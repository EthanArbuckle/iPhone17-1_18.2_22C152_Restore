@interface SiriUISuggestionsHeaderText
- (BOOL)isEqual:(id)a3;
- (NSAttributedString)attributedStringForMainScreenTraitCollection;
- (NSString)compactString;
- (NSString)regularString;
- (SiriUISuggestionsHeaderText)initWithRegularString:(id)a3 compactString:(id)a4;
- (id)_attributedStringWithString:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)textAlignment;
- (void)setCompactString:(id)a3;
- (void)setRegularString:(id)a3;
- (void)setTextAlignment:(int64_t)a3;
@end

@implementation SiriUISuggestionsHeaderText

- (SiriUISuggestionsHeaderText)initWithRegularString:(id)a3 compactString:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v16.receiver = self;
  v16.super_class = (Class)SiriUISuggestionsHeaderText;
  v8 = [(SiriUISuggestionsHeaderText *)&v16 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    regularString = v8->_regularString;
    v8->_regularString = (NSString *)v9;

    uint64_t v11 = [v7 copy];
    compactString = v8->_compactString;
    v8->_compactString = (NSString *)v11;

    BOOL IsRTL = SiriLanguageIsRTL();
    uint64_t v14 = 2;
    if (!IsRTL) {
      uint64_t v14 = 0;
    }
    v8->_textAlignment = v14;
  }

  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init((Class)objc_opt_class());
  [v4 setRegularString:self->_regularString];
  [v4 setCompactString:self->_compactString];
  return v4;
}

- (NSAttributedString)attributedStringForMainScreenTraitCollection
{
  if (!SiriUIIsCompactWidth() || (regularString = self->_compactString) == 0) {
    regularString = self->_regularString;
  }
  return (NSAttributedString *)[(SiriUISuggestionsHeaderText *)self _attributedStringWithString:regularString];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    regularString = self->_regularString;
    id v6 = [v4 regularString];
    if ([(NSString *)regularString isEqualToString:v6])
    {
      compactString = self->_compactString;
      v8 = [v4 compactString];
      BOOL v9 = [(NSString *)compactString isEqualToString:v8];
    }
    else
    {
      BOOL v9 = 0;
    }
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

- (id)_attributedStringWithString:(id)a3
{
  v13[1] = *MEMORY[0x263EF8340];
  id v4 = (objc_class *)MEMORY[0x263F1C350];
  v5 = (__CFString *)a3;
  id v6 = objc_alloc_init(v4);
  [v6 setLineSpacing:0.0];
  [v6 setAlignment:self->_textAlignment];
  id v7 = objc_alloc(MEMORY[0x263F086A0]);
  if (v5) {
    v8 = v5;
  }
  else {
    v8 = &stru_26D647E48;
  }
  uint64_t v12 = *MEMORY[0x263F1C268];
  v13[0] = v6;
  BOOL v9 = [NSDictionary dictionaryWithObjects:v13 forKeys:&v12 count:1];
  v10 = (void *)[v7 initWithString:v8 attributes:v9];

  return v10;
}

- (NSString)regularString
{
  return self->_regularString;
}

- (void)setRegularString:(id)a3
{
}

- (NSString)compactString
{
  return self->_compactString;
}

- (void)setCompactString:(id)a3
{
}

- (int64_t)textAlignment
{
  return self->_textAlignment;
}

- (void)setTextAlignment:(int64_t)a3
{
  self->_textAlignment = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_compactString, 0);
  objc_storeStrong((id *)&self->_regularString, 0);
}

@end