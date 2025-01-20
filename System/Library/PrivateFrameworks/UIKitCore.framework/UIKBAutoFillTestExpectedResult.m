@interface UIKBAutoFillTestExpectedResult
- (UIKBAutoFillTestExpectedResult)init;
- (UIKBAutoFillTestExpectedResult)initWithCoder:(id)a3;
- (int64_t)formType;
- (int64_t)typeForTextFieldWithTag:(int64_t)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setFormType:(int64_t)a3;
- (void)setType:(int64_t)a3 forTextFieldWithTag:(int64_t)a4;
@end

@implementation UIKBAutoFillTestExpectedResult

- (UIKBAutoFillTestExpectedResult)init
{
  v7.receiver = self;
  v7.super_class = (Class)UIKBAutoFillTestExpectedResult;
  v2 = [(UIKBAutoFillTestExpectedResult *)&v7 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F1CA60] dictionary];
    textFieldTagToTextFieldType = v2->_textFieldTagToTextFieldType;
    v2->_textFieldTagToTextFieldType = (NSMutableDictionary *)v3;

    v5 = v2;
  }

  return v2;
}

- (UIKBAutoFillTestExpectedResult)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(UIKBAutoFillTestExpectedResult *)self init];
  if (v5)
  {
    v5->_formType = [v4 decodeIntegerForKey:@"formType"];
    v6 = [v4 decodeObjectForKey:@"textFieldTagToTextFieldType"];
    uint64_t v7 = [v6 mutableCopy];
    textFieldTagToTextFieldType = v5->_textFieldTagToTextFieldType;
    v5->_textFieldTagToTextFieldType = (NSMutableDictionary *)v7;

    v9 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t formType = self->_formType;
  id v5 = a3;
  [v5 encodeInteger:formType forKey:@"formType"];
  [v5 encodeObject:self->_textFieldTagToTextFieldType forKey:@"textFieldTagToTextFieldType"];
}

- (int64_t)typeForTextFieldWithTag:(int64_t)a3
{
  textFieldTagToTextFieldType = self->_textFieldTagToTextFieldType;
  id v4 = [NSNumber numberWithInteger:a3];
  id v5 = [(NSMutableDictionary *)textFieldTagToTextFieldType objectForKeyedSubscript:v4];
  int64_t v6 = [v5 integerValue];

  return v6;
}

- (void)setType:(int64_t)a3 forTextFieldWithTag:(int64_t)a4
{
  id v8 = [NSNumber numberWithInteger:a3];
  textFieldTagToTextFieldType = self->_textFieldTagToTextFieldType;
  uint64_t v7 = [NSNumber numberWithInteger:a4];
  [(NSMutableDictionary *)textFieldTagToTextFieldType setObject:v8 forKeyedSubscript:v7];
}

- (int64_t)formType
{
  return self->_formType;
}

- (void)setFormType:(int64_t)a3
{
  self->_int64_t formType = a3;
}

- (void).cxx_destruct
{
}

@end