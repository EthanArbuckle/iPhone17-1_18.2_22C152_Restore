@interface TITypologyRecordKeyboardLayout
+ (BOOL)supportsSecureCoding;
- (NSString)name;
- (TIKeyboardLayout)keyboardLayout;
- (TITypologyRecordKeyboardLayout)initWithCoder:(id)a3;
- (id)shortDescription;
- (void)encodeWithCoder:(id)a3;
- (void)setKeyboardLayout:(id)a3;
- (void)setName:(id)a3;
@end

@implementation TITypologyRecordKeyboardLayout

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);

  objc_storeStrong((id *)&self->_keyboardLayout, 0);
}

- (void)setName:(id)a3
{
}

- (NSString)name
{
  return self->_name;
}

- (void)setKeyboardLayout:(id)a3
{
}

- (TIKeyboardLayout)keyboardLayout
{
  return self->_keyboardLayout;
}

- (id)shortDescription
{
  return @"KEYBOARD LAYOUT DESCRIPTION";
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)TITypologyRecordKeyboardLayout;
  id v4 = a3;
  [(TITypologyRecord *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_keyboardLayout, @"keyboardLayout", v5.receiver, v5.super_class);
  [v4 encodeObject:self->_name forKey:@"name"];
}

- (TITypologyRecordKeyboardLayout)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)TITypologyRecordKeyboardLayout;
  objc_super v5 = [(TITypologyRecord *)&v11 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"keyboardLayout"];
    keyboardLayout = v5->_keyboardLayout;
    v5->_keyboardLayout = (TIKeyboardLayout *)v6;

    uint64_t v8 = [v4 decodeObjectForKey:@"name"];
    name = v5->_name;
    v5->_name = (NSString *)v8;
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end