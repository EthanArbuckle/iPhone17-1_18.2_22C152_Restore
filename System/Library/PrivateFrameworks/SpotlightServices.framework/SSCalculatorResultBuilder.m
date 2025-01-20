@interface SSCalculatorResultBuilder
+ (BOOL)supportsResult:(id)a3;
+ (id)bundleId;
+ (id)currencyConversionAttributionImageWithSize:(CGSize)a3;
- (BOOL)buildButtonItemsAreTrailing;
- (BOOL)isCalculation;
- (BOOL)isCurrencyConversion;
- (NSString)input;
- (NSString)output;
- (SSCalculatorResultBuilder)initWithResult:(id)a3;
- (id)buildBackgroundColor;
- (id)buildButtonItems;
- (id)buildCommand;
- (id)buildCompactCardSection;
- (id)buildInlineCardSections;
- (id)buildPreviewButtonItems;
- (id)buildResult;
- (id)formattedInput;
- (id)openCalculationCommand;
- (void)setInput:(id)a3;
- (void)setIsCalculation:(BOOL)a3;
- (void)setIsCurrencyConversion:(BOOL)a3;
- (void)setOutput:(id)a3;
@end

@implementation SSCalculatorResultBuilder

+ (id)bundleId
{
  return @"com.apple.calculation";
}

+ (BOOL)supportsResult:(id)a3
{
  id v4 = a3;
  v8.receiver = a1;
  v8.super_class = (Class)&OBJC_METACLASS___SSCalculatorResultBuilder;
  if (objc_msgSendSuper2(&v8, sel_supportsResult_, v4))
  {
    char v5 = 1;
  }
  else
  {
    v6 = [v4 sectionBundleIdentifier];
    char v5 = [v6 isEqual:@"com.apple.conversion"];
  }
  return v5;
}

+ (id)currencyConversionAttributionImageWithSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  char v5 = objc_opt_new();
  [v5 setLocalImageType:3];
  objc_msgSend(v5, "setSize:", width, height);
  return v5;
}

- (SSCalculatorResultBuilder)initWithResult:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)SSCalculatorResultBuilder;
  char v5 = [(SSResultBuilder *)&v13 initWithResult:v4];
  if (v5)
  {
    v6 = [v4 valueForAttribute:@"SSAttributeCalculatorInput" withType:objc_opt_class()];
    if (v6)
    {
      [(SSCalculatorResultBuilder *)v5 setInput:v6];
    }
    else
    {
      v7 = [v4 userInput];
      [(SSCalculatorResultBuilder *)v5 setInput:v7];
    }
    objc_super v8 = [v4 valueForAttribute:@"SSAttributeCalculatorOutput" withType:objc_opt_class()];
    [(SSCalculatorResultBuilder *)v5 setOutput:v8];

    v9 = [v4 valueForAttribute:@"SSAttributeIsCurrencyConversion" withType:objc_opt_class()];
    -[SSCalculatorResultBuilder setIsCurrencyConversion:](v5, "setIsCurrencyConversion:", [v9 BOOLValue]);

    v10 = [v4 sectionBundleIdentifier];
    -[SSCalculatorResultBuilder setIsCalculation:](v5, "setIsCalculation:", [v10 isEqualToString:@"com.apple.conversion"] ^ 1);

    v11 = [v4 valueForAttribute:@"SSAttributeIsCalculation" withType:objc_opt_class()];
    -[SSCalculatorResultBuilder setIsCalculation:](v5, "setIsCalculation:", [v11 BOOLValue]);
  }
  return v5;
}

- (id)buildResult
{
  BOOL v3 = [(SSCalculatorResultBuilder *)self isCalculation];
  id v4 = @"com.apple.conversion";
  if (v3) {
    id v4 = @"com.apple.calculation";
  }
  v9.receiver = self;
  v9.super_class = (Class)SSCalculatorResultBuilder;
  if (v3) {
    uint64_t v5 = 6;
  }
  else {
    uint64_t v5 = 7;
  }
  v6 = v4;
  v7 = [(SSResultBuilder *)&v9 buildResult];
  objc_msgSend(v7, "setResultBundleId:", v6, v9.receiver, v9.super_class);
  [v7 setSectionBundleIdentifier:v6];
  [v7 setApplicationBundleIdentifier:@"com.apple.calculation"];
  [v7 setPlacement:3];
  [v7 setType:v5];
  [v7 setIdentifier:v6];

  return v7;
}

- (id)buildInlineCardSections
{
  v26[1] = *MEMORY[0x1E4F143B8];
  BOOL v3 = NSString;
  id v4 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  uint64_t v5 = [v4 localizedStringForKey:@"INLINE_EQUATION_FORMAT" value:&stru_1F1824018 table:@"SpotlightServices"];
  v6 = [(SSCalculatorResultBuilder *)self formattedInput];
  v7 = objc_msgSend(v3, "stringWithFormat:", v5, v6);

  objc_super v8 = objc_opt_new();
  [v8 setTitle:v7];
  objc_super v9 = [(SSCalculatorResultBuilder *)self output];
  [v8 setSubtitle:v9];

  [v8 setSubtitleIsEmphasized:1];
  v10 = [(SSCalculatorResultBuilder *)self buildCommand];
  [v8 setCommand:v10];

  v11 = objc_opt_new();
  v12 = [(SSCalculatorResultBuilder *)self output];
  [v11 setCopyableString:v12];

  objc_super v13 = objc_opt_new();
  [v13 setCopyableItem:v11];
  v14 = objc_opt_new();
  [v14 setCommand:v13];
  v15 = [(SSCalculatorResultBuilder *)self buildButtonItems];
  [v8 setButtonItems:v15];

  if ([(SSCalculatorResultBuilder *)self isCurrencyConversion])
  {
    [v8 setSeparatorStyle:1];
    v16 = objc_opt_new();
    v17 = objc_msgSend((id)objc_opt_class(), "currencyConversionAttributionImageWithSize:", 78.0, 12.0);
    v26[0] = v17;
    v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v26 count:1];
    [v16 setIcons:v18];

    v19 = [(SSCalculatorResultBuilder *)self openCalculationCommand];
    [v19 setShouldOpenCurrencyConversionProvider:1];
    id v20 = objc_alloc_init(MEMORY[0x1E4F99ED0]);
    [v20 setTrailingAttribution:v16];
    [v20 setTrailingAttributionCommand:v19];
    v21 = [v8 command];
    [v20 setCommand:v21];

    v25[0] = v8;
    v25[1] = v20;
    v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:v25 count:2];
  }
  else
  {
    v24 = v8;
    v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v24 count:1];
  }

  return v22;
}

- (id)buildCompactCardSection
{
  v18[1] = *MEMORY[0x1E4F143B8];
  BOOL v3 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  id v4 = [v3 localizedStringForKey:@"COMPACT_EQUATION_FORMAT" value:&stru_1F1824018 table:@"SpotlightServices"];

  uint64_t v5 = NSString;
  v6 = [(SSCalculatorResultBuilder *)self formattedInput];
  v7 = [(SSCalculatorResultBuilder *)self output];
  objc_super v8 = objc_msgSend(v5, "stringWithFormat:", v4, v6, v7);

  v16.receiver = self;
  v16.super_class = (Class)SSCalculatorResultBuilder;
  objc_super v9 = [(SSResultBuilder *)&v16 buildCompactCardSection];
  v10 = [MEMORY[0x1E4F9A378] textWithString:v8];
  [v9 setTitle:v10];

  if ([(SSCalculatorResultBuilder *)self isCurrencyConversion])
  {
    v11 = [MEMORY[0x1E4F9A378] textWithString:@" "];
    v12 = objc_msgSend((id)objc_opt_class(), "currencyConversionAttributionImageWithSize:", 91.0, 15.0);
    v18[0] = v12;
    objc_super v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:1];
    [v11 setIcons:v13];

    v17 = v11;
    v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v17 count:1];
    [v9 setDescriptions:v14];
  }
  return v9;
}

- (id)openCalculationCommand
{
  BOOL v3 = objc_opt_new();
  id v4 = [(SSCalculatorResultBuilder *)self input];
  [v3 setInput:v4];

  uint64_t v5 = [(SSCalculatorResultBuilder *)self output];
  [v3 setOutput:v5];

  return v3;
}

- (id)buildCommand
{
  if ([(SSCalculatorResultBuilder *)self isCurrencyConversion])
  {
    BOOL v3 = [(SSCalculatorResultBuilder *)self openCalculationCommand];
    [v3 setShouldOpenCurrencyConversionProvider:1];
    if (v3) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if ([(SSCalculatorResultBuilder *)self isCalculation]
    || (BOOL v3 = objc_opt_new(),
        [(SSCalculatorResultBuilder *)self input],
        id v4 = objc_claimAutoreleasedReturnValue(),
        [v3 setSearchString:v4],
        v4,
        !v3))
  {
LABEL_6:
    BOOL v3 = [(SSCalculatorResultBuilder *)self openCalculationCommand];
  }
LABEL_7:
  return v3;
}

- (id)buildPreviewButtonItems
{
  if ([(SSCalculatorResultBuilder *)self isCalculation] && (isMacOS() & 1) == 0)
  {
    v5.receiver = self;
    v5.super_class = (Class)SSCalculatorResultBuilder;
    BOOL v3 = [(SSResultBuilder *)&v5 buildPreviewButtonItems];
  }
  else
  {
    BOOL v3 = [(SSCalculatorResultBuilder *)self buildButtonItems];
  }
  return v3;
}

- (id)buildButtonItems
{
  v9[1] = *MEMORY[0x1E4F143B8];
  BOOL v3 = objc_opt_new();
  id v4 = [(SSCalculatorResultBuilder *)self output];
  [v3 setCopyableString:v4];

  objc_super v5 = objc_opt_new();
  [v5 setCopyableItem:v3];
  v6 = objc_opt_new();
  [v6 setCommand:v5];
  v9[0] = v6;
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:1];

  return v7;
}

- (BOOL)buildButtonItemsAreTrailing
{
  return 1;
}

- (id)buildBackgroundColor
{
  v2 = objc_opt_new();
  [v2 setApplicationBundleIdentifier:@"com.apple.calculator"];
  return v2;
}

- (id)formattedInput
{
  BOOL v3 = [(SSCalculatorResultBuilder *)self input];
  uint64_t v4 = [v3 length];

  if (v4)
  {
    uint64_t v11 = 0;
    objc_super v5 = [MEMORY[0x1E4F28FD8] regularExpressionWithPattern:@"[=＝]\\s*$" options:0 error:&v11];
    v6 = 0;
    if (v5) {
      BOOL v7 = v11 == 0;
    }
    else {
      BOOL v7 = 0;
    }
    if (v7)
    {
      objc_super v8 = [(SSCalculatorResultBuilder *)self input];
      objc_super v9 = [(SSCalculatorResultBuilder *)self input];
      v6 = objc_msgSend(v5, "stringByReplacingMatchesInString:options:range:withTemplate:", v8, 0, 0, objc_msgSend(v9, "length"), &stru_1F1824018);
    }
  }
  else
  {
    v6 = [(SSCalculatorResultBuilder *)self input];
  }
  return v6;
}

- (NSString)input
{
  return self->_input;
}

- (void)setInput:(id)a3
{
}

- (NSString)output
{
  return self->_output;
}

- (void)setOutput:(id)a3
{
}

- (BOOL)isCalculation
{
  return self->_isCalculation;
}

- (void)setIsCalculation:(BOOL)a3
{
  self->_isCalculation = a3;
}

- (BOOL)isCurrencyConversion
{
  return self->_isCurrencyConversion;
}

- (void)setIsCurrencyConversion:(BOOL)a3
{
  self->_isCurrencyConversion = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_output, 0);
  objc_storeStrong((id *)&self->_input, 0);
}

@end