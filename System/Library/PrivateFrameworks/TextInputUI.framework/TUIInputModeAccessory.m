@interface TUIInputModeAccessory
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSString)inputMode;
- (TUIInputModeAccessory)initWithCoder:(id)a3;
- (TUIInputModeAccessory)initWithInputMode:(id)a3;
- (id)additionalComponents;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setInputMode:(id)a3;
@end

@implementation TUIInputModeAccessory

- (void).cxx_destruct
{
}

- (void)setInputMode:(id)a3
{
}

- (NSString)inputMode
{
  return self->_inputMode;
}

- (unint64_t)hash
{
  v7.receiver = self;
  v7.super_class = (Class)TUIInputModeAccessory;
  uint64_t v3 = 257 * [(TUICursorAccessory *)&v7 hash];
  v4 = [(TUIInputModeAccessory *)self inputMode];
  unint64_t v5 = [v4 hash] + v3;

  return v5;
}

- (id)additionalComponents
{
  v6.receiver = self;
  v6.super_class = (Class)TUIInputModeAccessory;
  uint64_t v3 = [(TUICursorAccessory *)&v6 additionalComponents];
  if (self->_inputMode)
  {
    v4 = [NSString stringWithFormat:@"inputMode = %@", self->_inputMode];
    [v3 addObject:v4];
  }
  return v3;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (TUIInputModeAccessory *)a3;
  unint64_t v5 = v4;
  if (!v4) {
    goto LABEL_5;
  }
  if (self == v4)
  {
    BOOL v6 = 1;
    goto LABEL_7;
  }
  v8.receiver = self;
  v8.super_class = (Class)TUIInputModeAccessory;
  if ([(TUICursorAccessory *)&v8 isEqual:v4]) {
    BOOL v6 = [(NSString *)self->_inputMode isEqualToString:v5->_inputMode];
  }
  else {
LABEL_5:
  }
    BOOL v6 = 0;
LABEL_7:

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)TUIInputModeAccessory;
  id v4 = a3;
  [(TUICursorAccessory *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_inputMode, @"TUInputModeCodingKey", v5.receiver, v5.super_class);
}

- (TUIInputModeAccessory)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TUIInputModeAccessory;
  objc_super v5 = [(TUICursorAccessory *)&v9 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"TUInputModeCodingKey"];
    inputMode = v5->_inputMode;
    v5->_inputMode = (NSString *)v6;
  }
  return v5;
}

- (TUIInputModeAccessory)initWithInputMode:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)TUIInputModeAccessory;
  objc_super v5 = [(TUICursorAccessory *)&v8 init];
  uint64_t v6 = v5;
  if (v5) {
    [(TUIInputModeAccessory *)v5 setInputMode:v4];
  }

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end