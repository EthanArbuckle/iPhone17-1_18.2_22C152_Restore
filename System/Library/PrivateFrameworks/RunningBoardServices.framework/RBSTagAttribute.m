@interface RBSTagAttribute
+ (id)attributeWithTag:(id)a3;
- (BOOL)isEqual:(id)a3;
- (NSString)tag;
- (RBSTagAttribute)initWithRBSXPCCoder:(id)a3;
- (id)description;
- (unint64_t)hash;
- (void)_initWithTag:(void *)a1;
- (void)encodeWithRBSXPCCoder:(id)a3;
@end

@implementation RBSTagAttribute

- (unint64_t)hash
{
  return [(NSString *)self->_tag hash];
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)RBSTagAttribute;
  BOOL v6 = 0;
  if ([(RBSAttribute *)&v8 isEqual:v4])
  {
    tag = self->_tag;
    if (tag == (NSString *)v4[1] || -[NSString isEqualToString:](tag, "isEqualToString:")) {
      BOOL v6 = 1;
    }
  }

  return v6;
}

- (NSString)tag
{
  return self->_tag;
}

+ (id)attributeWithTag:(id)a3
{
  id v3 = a3;
  v4 = -[RBSTagAttribute _initWithTag:]([RBSTagAttribute alloc], v3);

  return v4;
}

- (void)_initWithTag:(void *)a1
{
  id v3 = a2;
  if (a1)
  {
    v7.receiver = a1;
    v7.super_class = (Class)RBSTagAttribute;
    a1 = objc_msgSendSuper2(&v7, sel__init);
    if (a1)
    {
      uint64_t v4 = [v3 copy];
      v5 = (void *)a1[1];
      a1[1] = v4;
    }
  }

  return a1;
}

- (void)encodeWithRBSXPCCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)RBSTagAttribute;
  id v4 = a3;
  [(RBSAttribute *)&v5 encodeWithRBSXPCCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_tag, @"tag", v5.receiver, v5.super_class);
}

- (RBSTagAttribute)initWithRBSXPCCoder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)RBSTagAttribute;
  objc_super v5 = [(RBSAttribute *)&v10 initWithRBSXPCCoder:v4];
  if (v5)
  {
    BOOL v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"tag"];
    uint64_t v7 = [v6 copy];
    tag = v5->_tag;
    v5->_tag = (NSString *)v7;
  }
  return v5;
}

- (id)description
{
  id v3 = [NSString alloc];
  id v4 = [(id)objc_opt_class() description];
  objc_super v5 = (void *)[v3 initWithFormat:@"<%@| tag:\"%@\">", v4, self->_tag];

  return v5;
}

- (void).cxx_destruct
{
}

@end