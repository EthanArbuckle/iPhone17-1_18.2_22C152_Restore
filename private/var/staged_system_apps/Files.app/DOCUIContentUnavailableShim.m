@interface DOCUIContentUnavailableShim
+ (BOOL)supportsSecureCoding;
+ (Class)implClass;
+ (id)instanceWrappingImpl:(id)a3;
- (DOCUIContentUnavailableShim)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation DOCUIContentUnavailableShim

+ (id)instanceWrappingImpl:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v5 = (id *)objc_alloc_init((Class)objc_opt_class());
    objc_storeStrong(v5 + 1, a3);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void).cxx_destruct
{
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
}

+ (Class)implClass
{
  return 0;
}

- (DOCUIContentUnavailableShim)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = objc_msgSend(objc_alloc((Class)objc_msgSend((id)objc_opt_class(), "implClass")), "initWithCoder:", v4);

  if (v5)
  {
    v6 = [(id)objc_opt_class() instanceWrappingImpl:v5];
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_alloc_init((Class)objc_opt_class());
  id v6 = [(NSCopying *)self->_impl copyWithZone:a3];
  v7 = (void *)v5[1];
  v5[1] = v6;

  return v5;
}

@end