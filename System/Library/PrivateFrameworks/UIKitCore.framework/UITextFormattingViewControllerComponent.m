@interface UITextFormattingViewControllerComponent
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSString)componentKey;
- (UITextFormattingViewControllerComponent)initWithCoder:(id)a3;
- (UITextFormattingViewControllerComponent)initWithComponentKey:(id)a3 preferredSize:(int64_t)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)preferredSize;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation UITextFormattingViewControllerComponent

- (void).cxx_destruct
{
}

- (UITextFormattingViewControllerComponent)initWithComponentKey:(id)a3 preferredSize:(int64_t)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)UITextFormattingViewControllerComponent;
  v8 = [(UITextFormattingViewControllerComponent *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_componentKey, a3);
    v9->_preferredSize = a4;
  }

  return v9;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  v5 = [(UITextFormattingViewControllerComponent *)self componentKey];
  v6 = objc_msgSend(v4, "initWithComponentKey:preferredSize:", v5, -[UITextFormattingViewControllerComponent preferredSize](self, "preferredSize"));

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (UITextFormattingViewControllerComponent *)a3;
  if (self == v4)
  {
    BOOL v8 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      v6 = [(UITextFormattingViewControllerComponent *)self componentKey];
      id v7 = [(UITextFormattingViewControllerComponent *)v5 componentKey];
      if (v6 == v7)
      {
        int64_t v9 = [(UITextFormattingViewControllerComponent *)self preferredSize];
        BOOL v8 = v9 == [(UITextFormattingViewControllerComponent *)v5 preferredSize];
      }
      else
      {
        BOOL v8 = 0;
      }
    }
    else
    {
      BOOL v8 = 0;
    }
  }

  return v8;
}

- (unint64_t)hash
{
  v3 = [(UITextFormattingViewControllerComponent *)self componentKey];
  uint64_t v4 = [v3 hash];
  unint64_t v5 = [(UITextFormattingViewControllerComponent *)self preferredSize] ^ v4;

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v5 = a3;
  uint64_t v4 = [(UITextFormattingViewControllerComponent *)self componentKey];
  [v5 encodeObject:v4 forKey:@"_ComponentKey"];

  objc_msgSend(v5, "encodeInteger:forKey:", -[UITextFormattingViewControllerComponent preferredSize](self, "preferredSize"), @"_PreferredSize");
}

- (UITextFormattingViewControllerComponent)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(UITextFormattingViewControllerComponent *)self init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectForKey:@"_ComponentKey"];
    componentKey = v5->_componentKey;
    v5->_componentKey = (NSString *)v6;

    v5->_preferredSize = [v4 decodeIntegerForKey:@"_PreferredSize"];
  }

  return v5;
}

- (NSString)componentKey
{
  return self->_componentKey;
}

- (int64_t)preferredSize
{
  return self->_preferredSize;
}

@end