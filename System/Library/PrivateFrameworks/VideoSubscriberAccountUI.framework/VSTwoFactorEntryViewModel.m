@interface VSTwoFactorEntryViewModel
- (NSArray)buttons;
- (NSString)headerText;
- (NSString)originalTwoFacorCode;
- (VSExpressionEvaluator)buttonExpressionEvaluator;
- (VSTwoFactorEntryTextField)twoFactorTextField;
- (VSTwoFactorEntryViewModel)init;
- (VSTwoFactorEntryViewModelDelegate)delegate;
- (void)buttonAtIndexWasPressed:(unint64_t)a3;
- (void)configureWithRequest:(id)a3;
- (void)setButtonExpressionEvaluator:(id)a3;
- (void)setButtons:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setHeaderText:(id)a3;
- (void)setOriginalTwoFacorCode:(id)a3;
- (void)setTwoFactorTextField:(id)a3;
@end

@implementation VSTwoFactorEntryViewModel

- (VSTwoFactorEntryViewModel)init
{
  v24[1] = *MEMORY[0x263EF8340];
  v22.receiver = self;
  v22.super_class = (Class)VSTwoFactorEntryViewModel;
  v2 = [(VSCuratedViewModel *)&v22 init];
  if (v2)
  {
    v3 = objc_alloc_init(VSTwoFactorEntryTextField);
    twoFactorTextField = v2->_twoFactorTextField;
    v2->_twoFactorTextField = v3;

    [(VSTwoFactorEntryTextField *)v2->_twoFactorTextField setReturnKeyType:9];
    v5 = [MEMORY[0x263F087F0] expressionForKeyPath:@"twoFactorTextField.text"];
    v21 = [MEMORY[0x263F087F0] expressionForKeyPath:@"originalTwoFacorCode"];
    v6 = (void *)MEMORY[0x263F087F0];
    v24[0] = v5;
    v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v24 count:1];
    v20 = [v6 expressionForFunction:@"length:" arguments:v7];

    v19 = [MEMORY[0x263F087F0] expressionForKeyPath:@"twoFactorTextField.expectedLength"];
    v8 = [MEMORY[0x263F08720] predicateWithLeftExpression:v5 rightExpression:v21 modifier:0 type:5 options:0];
    v9 = [MEMORY[0x263F08720] predicateWithLeftExpression:v20 rightExpression:v19 modifier:0 type:4 options:0];
    v10 = (void *)MEMORY[0x263F08730];
    v23[0] = v9;
    v23[1] = v8;
    v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:v23 count:2];
    v12 = [v10 andPredicateWithSubpredicates:v11];

    v13 = [MEMORY[0x263F087F0] expressionForConstantValue:MEMORY[0x263EFFA88]];
    v14 = [MEMORY[0x263F087F0] expressionForConstantValue:MEMORY[0x263EFFA80]];
    v15 = [MEMORY[0x263F087F0] expressionForConditional:v12 trueExpression:v13 falseExpression:v14];
    id v16 = objc_alloc_init(MEMORY[0x263F1E200]);
    [v16 setObject:v2];
    [v16 setExpression:v15];
    [(VSTwoFactorEntryViewModel *)v2 setButtonExpressionEvaluator:v16];
    v17 = VSMainConcurrencyBindingOptions();
    [(VSTwoFactorEntryViewModel *)v2 vs_bind:@"beginValidationButtonEnabled" toObject:v16 withKeyPath:@"value" options:v17];
  }
  return v2;
}

- (void)configureWithRequest:(id)a3
{
  v4 = (void *)MEMORY[0x263F086E0];
  id v5 = a3;
  v6 = objc_msgSend(v4, "vs_frameworkBundle");
  v7 = [v6 localizedStringForKey:@"TWO_FACTOR_VERIFY_BUTTON_TITLE" value:0 table:0];

  [(VSCuratedViewModel *)self setBeginValidationButtonTitle:v7];
  v8 = [(VSViewModel *)self identityProvider];
  v9 = [v8 displayName];
  v10 = [v9 forceUnwrapObject];

  [(VSViewModel *)self setTitle:v10];
  v11.receiver = self;
  v11.super_class = (Class)VSTwoFactorEntryViewModel;
  [(VSCuratedViewModel *)&v11 configureWithRequest:v5];
}

- (void)setTwoFactorTextField:(id)a3
{
  objc_storeStrong((id *)&self->_twoFactorTextField, a3);
  id v5 = a3;
  [v5 setReturnKeyType:9];
  id v6 = [v5 text];

  [(VSTwoFactorEntryViewModel *)self setOriginalTwoFacorCode:v6];
}

- (void)buttonAtIndexWasPressed:(unint64_t)a3
{
  id v5 = [(VSTwoFactorEntryViewModel *)self delegate];
  [v5 twoFactorEntryViewModel:self didPressButtonAtIndex:a3];
}

- (VSTwoFactorEntryViewModelDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (VSTwoFactorEntryViewModelDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (VSTwoFactorEntryTextField)twoFactorTextField
{
  return self->_twoFactorTextField;
}

- (NSString)headerText
{
  return self->_headerText;
}

- (void)setHeaderText:(id)a3
{
}

- (NSArray)buttons
{
  return self->_buttons;
}

- (void)setButtons:(id)a3
{
}

- (NSString)originalTwoFacorCode
{
  return self->_originalTwoFacorCode;
}

- (void)setOriginalTwoFacorCode:(id)a3
{
}

- (VSExpressionEvaluator)buttonExpressionEvaluator
{
  return self->_buttonExpressionEvaluator;
}

- (void)setButtonExpressionEvaluator:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_buttonExpressionEvaluator, 0);
  objc_storeStrong((id *)&self->_originalTwoFacorCode, 0);
  objc_storeStrong((id *)&self->_buttons, 0);
  objc_storeStrong((id *)&self->_headerText, 0);
  objc_storeStrong((id *)&self->_twoFactorTextField, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end