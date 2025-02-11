*** Settings ***
Library           SeleniumLibrary
Suite Setup       Open Browser    https:///automationexercise.com/
Suite Teardown    Close Browser

*** Variables ***
${URL}            https://automationexercise.com/

*** Test Cases ***
Add Product To Cart And Verify
    Maximize Browser Window
    Add First Product To Cart
    Continue Shopping
    Add Second Product To Cart
    View Cart
    
*** Keywords ***
Add First Product To Cart
    Click Element    xpath=//a[@href='/products']
    Execute JavaScript    document.body.style.zoom='80%'
    Mouse Over       xpath=(//div[@class='product-image-wrapper'])[1]
    Click Element    xpath=(//a[@data-product-id='1'])

Continue Shopping
    Wait Until Element Is Visible    xpath=//button[text()='Continue Shopping']    timeout=5s
    Click Button    xpath=//button[text()='Continue Shopping']

Add Second Product To Cart
    Mouse Over       xpath=(//div[@class='product-image-wrapper'])[2]
    Click Element    xpath=(//a[@data-product-id='2'])

View Cart
    Wait Until Element Is Visible    xpath=//a[@href='/view_cart']    timeout=5s
    Click Link       xpath=//a[@href='/view_cart']