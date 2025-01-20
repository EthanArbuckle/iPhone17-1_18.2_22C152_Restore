@interface UITextFormattingViewControllerComponentGroup
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSArray)components;
- (NSString)identifier;
- (UITextFormattingViewControllerComponentGroup)initWithCoder:(id)a3;
- (UITextFormattingViewControllerComponentGroup)initWithComponents:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation UITextFormattingViewControllerComponentGroup

- (UITextFormattingViewControllerComponentGroup)initWithComponents:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)UITextFormattingViewControllerComponentGroup;
  v6 = [(UITextFormattingViewControllerComponentGroup *)&v11 init];
  if (v6)
  {
    id v7 = objc_alloc_init(MEMORY[0x1E4F29128]);
    uint64_t v8 = [v7 UUIDString];
    identifier = v6->_identifier;
    v6->_identifier = (NSString *)v8;

    objc_storeStrong((id *)&v6->_components, a3);
  }

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_components, 0);
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v5 = [(UITextFormattingViewControllerComponentGroup *)self components];
  uint64_t v6 = [v5 copy];
  id v7 = (void *)v4[1];
  v4[1] = v6;

  uint64_t v8 = [(UITextFormattingViewControllerComponentGroup *)self identifier];
  v9 = (void *)v4[2];
  v4[2] = v8;

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (UITextFormattingViewControllerComponentGroup *)a3;
  if (self == v4)
  {
    char v10 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = v4;
      uint64_t v6 = [(UITextFormattingViewControllerComponentGroup *)self identifier];
      id v7 = [(UITextFormattingViewControllerComponentGroup *)v5 identifier];
      if ([v6 isEqualToString:v7])
      {
        uint64_t v8 = [(UITextFormattingViewControllerComponentGroup *)self components];
        v9 = [(UITextFormattingViewControllerComponentGroup *)v5 components];
        char v10 = [v8 isEqualToArray:v9];
      }
      else
      {
        char v10 = 0;
      }
    }
    else
    {
      char v10 = 0;
    }
  }

  return v10;
}

- (unint64_t)hash
{
  v3 = [(UITextFormattingViewControllerComponentGroup *)self identifier];
  uint64_t v4 = [v3 hash];
  id v5 = [(UITextFormattingViewControllerComponentGroup *)self components];
  unint64_t v6 = [v5 hash] ^ v4;

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(UITextFormattingViewControllerComponentGroup *)self identifier];
  [v4 encodeObject:v5 forKey:@"_Identifier"];

  id v6 = [(UITextFormattingViewControllerComponentGroup *)self components];
  [v4 encodeObject:v6 forKey:@"_Components"];
}

- (UITextFormattingViewControllerComponentGroup)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(UITextFormattingViewControllerComponentGroup *)self init];
  if (v5)
  {
    id v6 = _UITextFormattingViewControllerComponentGroupClasses();
    uint64_t v7 = [v4 decodeObjectOfClasses:v6 forKey:@"_Identifier"];
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v7;

    v9 = _UITextFormattingViewControllerComponentGroupClasses();
    uint64_t v10 = [v4 decodeObjectOfClasses:v9 forKey:@"_Components"];
    components = v5->_components;
    v5->_components = (NSArray *)v10;
  }
  return v5;
}

- (NSArray)components
{
  return self->_components;
}

- (NSString)identifier
{
  return self->_identifier;
}

@end