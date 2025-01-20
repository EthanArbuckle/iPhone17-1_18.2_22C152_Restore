@interface UITextInputPasswordRules
+ (BOOL)supportsSecureCoding;
+ (UITextInputPasswordRules)passwordRulesWithDescriptor:(NSString *)passwordRulesDescriptor;
- (BOOL)isEqual:(id)a3;
- (NSString)passwordRulesDescriptor;
- (UITextInputPasswordRules)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)initPasswordRulesWithDescriptor:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation UITextInputPasswordRules

- (id)initPasswordRulesWithDescriptor:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)UITextInputPasswordRules;
  v6 = [(UITextInputPasswordRules *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_passwordRulesDescriptor, a3);
  }

  return v7;
}

+ (UITextInputPasswordRules)passwordRulesWithDescriptor:(NSString *)passwordRulesDescriptor
{
  v4 = passwordRulesDescriptor;
  id v5 = (void *)[objc_alloc((Class)a1) initPasswordRulesWithDescriptor:v4];

  return (UITextInputPasswordRules *)v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (UITextInputPasswordRules)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)UITextInputPasswordRules;
  id v5 = [(UITextInputPasswordRules *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"passwordRulesDescriptor"];
    passwordRulesDescriptor = v5->_passwordRulesDescriptor;
    v5->_passwordRulesDescriptor = (NSString *)v6;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  passwordRulesDescriptor = self->_passwordRulesDescriptor;
  if (passwordRulesDescriptor) {
    [a3 encodeObject:passwordRulesDescriptor forKey:@"passwordRulesDescriptor"];
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  v3 = [(UITextInputPasswordRules *)self passwordRulesDescriptor];
  id v4 = +[UITextInputPasswordRules passwordRulesWithDescriptor:v3];

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    uint64_t v6 = [(UITextInputPasswordRules *)self passwordRulesDescriptor];
    v7 = [v5 passwordRulesDescriptor];
    if (v6 == v7)
    {
      char v10 = 1;
    }
    else
    {
      v8 = [(UITextInputPasswordRules *)self passwordRulesDescriptor];
      objc_super v9 = [v5 passwordRulesDescriptor];
      char v10 = [v8 isEqual:v9];
    }
  }
  else
  {
    char v10 = 0;
  }

  return v10;
}

- (id)description
{
  v3 = (void *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithFormat:@"<%@: %p", objc_opt_class(), self];
  id v4 = [(UITextInputPasswordRules *)self passwordRulesDescriptor];

  if (v4)
  {
    id v5 = [(UITextInputPasswordRules *)self passwordRulesDescriptor];
    [v3 appendFormat:@"; passwordRulesDescriptor = %@", v5];
  }
  [v3 appendString:@">"];
  return v3;
}

- (NSString)passwordRulesDescriptor
{
  return self->_passwordRulesDescriptor;
}

- (void).cxx_destruct
{
}

@end