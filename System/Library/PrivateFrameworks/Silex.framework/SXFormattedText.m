@interface SXFormattedText
+ (id)valueClassBlockForPropertyWithName:(id)a3;
- (BOOL)shouldWrapText;
- (SXFormattedText)initWithText:(id)a3;
- (SXFormattedText)textWithValue:(id)a3 withType:(int)a4;
- (id)description;
- (void)setShouldWrapText:(BOOL)a3;
@end

@implementation SXFormattedText

- (SXFormattedText)initWithText:(id)a3
{
  v12[1] = *MEMORY[0x263EF8340];
  if (a3)
  {
    v11 = @"text";
    v12[0] = a3;
    v4 = NSDictionary;
    id v5 = a3;
    v6 = [v4 dictionaryWithObjects:v12 forKeys:&v11 count:1];
    v10.receiver = self;
    v10.super_class = (Class)SXFormattedText;
    v7 = [(SXJSONObject *)&v10 initWithJSONObject:v6 andVersion:0];

    self = v7;
    v8 = self;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (SXFormattedText)textWithValue:(id)a3 withType:(int)a4
{
  id v5 = a3;
  v6 = v5;
  v7 = &stru_26D5311C0;
  if (v5 && a4 == 3) {
    v7 = (__CFString *)v5;
  }

  return (SXFormattedText *)v7;
}

+ (id)valueClassBlockForPropertyWithName:(id)a3
{
  id v4 = a3;
  if ([v4 isEqualToString:@"inlineTextStyles"])
  {
    id v5 = &__block_literal_global_3;
  }
  else
  {
    if ([v4 isEqualToString:@"additions"])
    {
      uint64_t v6 = +[SXClassFactory valueClassBlockForBaseClass:objc_opt_class()];
    }
    else
    {
      v8.receiver = a1;
      v8.super_class = (Class)&OBJC_METACLASS___SXFormattedText;
      uint64_t v6 = objc_msgSendSuper2(&v8, sel_valueClassBlockForPropertyWithName_, v4);
    }
    id v5 = (void *)v6;
  }

  return v5;
}

uint64_t __54__SXFormattedText_valueClassBlockForPropertyWithName___block_invoke()
{
  return objc_opt_class();
}

- (id)description
{
  v3 = (void *)MEMORY[0x263F089D8];
  uint64_t v4 = objc_opt_class();
  id v5 = [(SXFormattedText *)self text];
  uint64_t v6 = [v3 stringWithFormat:@"<%@: %p; text: %@", v4, self, v5];

  v7 = [(SXFormattedText *)self textStyle];

  if (v7)
  {
    objc_super v8 = [(SXFormattedText *)self textStyle];
    [v6 appendFormat:@"; textStyle: %@", v8];
  }
  v9 = [(SXFormattedText *)self inlineTextStyles];

  if (v9)
  {
    objc_super v10 = [(SXFormattedText *)self inlineTextStyles];
    objc_msgSend(v6, "appendFormat:", @"; inlineTextStyles: %lu", objc_msgSend(v10, "count"));
  }
  v11 = [(SXFormattedText *)self additions];

  if (v11)
  {
    v12 = [(SXFormattedText *)self additions];
    objc_msgSend(v6, "appendFormat:", @"; additions: %lu", objc_msgSend(v12, "count"));
  }
  if ([(SXFormattedText *)self shouldWrapText]) {
    [v6 appendFormat:@"; wrap text"];
  }
  [v6 appendString:@">"];
  return v6;
}

- (BOOL)shouldWrapText
{
  return self->shouldWrapText;
}

- (void)setShouldWrapText:(BOOL)a3
{
  self->shouldWrapText = a3;
}

@end