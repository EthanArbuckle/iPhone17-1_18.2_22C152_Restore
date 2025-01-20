@interface RBSDomainAttribute
+ (id)attributeWithDomain:(id)a3 name:(id)a4;
+ (id)attributeWithDomain:(id)a3 name:(id)a4 sourceEnvironment:(id)a5;
- (BOOL)isEqual:(id)a3;
- (NSString)domain;
- (NSString)fullyQualifiedName;
- (NSString)name;
- (NSString)sourceEnvironment;
- (RBSDomainAttribute)initWithRBSXPCCoder:(id)a3;
- (id)description;
- (unint64_t)hash;
- (void)_initWithDomain:(void *)a3 name:(void *)a4 sourceEnvironment:;
- (void)encodeWithRBSXPCCoder:(id)a3;
- (void)setDomain:(id)a3;
- (void)setName:(id)a3;
- (void)setSourceEnvironment:(id)a3;
@end

@implementation RBSDomainAttribute

- (void)encodeWithRBSXPCCoder:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)RBSDomainAttribute;
  id v4 = a3;
  [(RBSAttribute *)&v8 encodeWithRBSXPCCoder:v4];
  v5 = [(RBSDomainAttribute *)self domain];
  [v4 encodeObject:v5 forKey:@"domain"];

  v6 = [(RBSDomainAttribute *)self name];
  [v4 encodeObject:v6 forKey:@"name"];

  v7 = [(RBSDomainAttribute *)self sourceEnvironment];
  [v4 encodeObject:v7 forKey:@"sourceEnvironment"];
}

- (NSString)name
{
  return self->_name;
}

- (NSString)domain
{
  return self->_domain;
}

- (NSString)sourceEnvironment
{
  return self->_sourceEnvironment;
}

- (id)description
{
  id v3 = [NSString alloc];
  id v4 = [(id)objc_opt_class() description];
  v5 = (void *)[v3 initWithFormat:@"<%@| domain:\"%@\" name:\"%@\" sourceEnvironment:\"%@\">", v4, self->_domain, self->_name, self->_sourceEnvironment];

  return v5;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_domain hash];
  NSUInteger v4 = [(NSString *)self->_name hash] ^ v3;
  return v4 ^ [(NSString *)self->_sourceEnvironment hash];
}

- (BOOL)isEqual:(id)a3
{
  NSUInteger v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)RBSDomainAttribute;
  BOOL v8 = 0;
  if ([(RBSAttribute *)&v10 isEqual:v4])
  {
    domain = self->_domain;
    if (domain == (NSString *)v4[1] || -[NSString isEqualToString:](domain, "isEqualToString:"))
    {
      name = self->_name;
      if (name == (NSString *)v4[2] || -[NSString isEqualToString:](name, "isEqualToString:"))
      {
        sourceEnvironment = self->_sourceEnvironment;
        if (sourceEnvironment == (NSString *)v4[3]
          || -[NSString isEqualToString:](sourceEnvironment, "isEqualToString:"))
        {
          BOOL v8 = 1;
        }
      }
    }
  }

  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sourceEnvironment, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_domain, 0);
}

+ (id)attributeWithDomain:(id)a3 name:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  BOOL v8 = -[RBSDomainAttribute _initWithDomain:name:sourceEnvironment:](objc_alloc((Class)a1), v7, v6, 0);

  return v8;
}

- (void)_initWithDomain:(void *)a3 name:(void *)a4 sourceEnvironment:
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (a1)
  {
    v17.receiver = a1;
    v17.super_class = (Class)RBSDomainAttribute;
    a1 = objc_msgSendSuper2(&v17, sel__init);
    if (a1)
    {
      uint64_t v10 = [v7 copy];
      v11 = (void *)a1[1];
      a1[1] = v10;

      uint64_t v12 = [v8 copy];
      v13 = (void *)a1[2];
      a1[2] = v12;

      uint64_t v14 = [v9 copy];
      v15 = (void *)a1[3];
      a1[3] = v14;
    }
  }

  return a1;
}

- (RBSDomainAttribute)initWithRBSXPCCoder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)RBSDomainAttribute;
  v5 = [(RBSAttribute *)&v10 initWithRBSXPCCoder:v4];
  if (v5)
  {
    id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"domain"];
    [(RBSDomainAttribute *)v5 setDomain:v6];

    id v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"name"];
    [(RBSDomainAttribute *)v5 setName:v7];

    id v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"sourceEnvironment"];
    [(RBSDomainAttribute *)v5 setSourceEnvironment:v8];
  }
  return v5;
}

- (void)setSourceEnvironment:(id)a3
{
}

- (void)setName:(id)a3
{
}

- (void)setDomain:(id)a3
{
}

+ (id)attributeWithDomain:(id)a3 name:(id)a4 sourceEnvironment:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  v11 = -[RBSDomainAttribute _initWithDomain:name:sourceEnvironment:](objc_alloc((Class)a1), v10, v9, v8);

  return v11;
}

- (NSString)fullyQualifiedName
{
  return [(NSString *)self->_domain stringByAppendingPathExtension:self->_name];
}

@end