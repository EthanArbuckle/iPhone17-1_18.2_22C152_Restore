@interface RENamedImage
- (BOOL)isEqual:(id)a3;
- (NSBundle)bundle;
- (NSString)name;
- (RENamedImage)initWithCoder:(id)a3;
- (RENamedImage)initWithName:(id)a3 inBundle:(id)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation RENamedImage

- (RENamedImage)initWithName:(id)a3 inBundle:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)RENamedImage;
  v8 = [(RENamedImage *)&v12 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    name = v8->_name;
    v8->_name = (NSString *)v9;

    objc_storeStrong((id *)&v8->_bundle, a4);
  }

  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  name = self->_name;
  bundle = self->_bundle;
  return (id)[v4 initWithName:name inBundle:bundle];
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_name hash];
  return [(NSBundle *)self->_bundle hash] ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    id v6 = [v5 name];
    id v7 = self->_name;
    if (v6 == v7)
    {
    }
    else
    {
      v8 = v7;
      int v9 = [(NSString *)v6 isEqual:v7];

      if (!v9)
      {
        char v10 = 0;
LABEL_11:

        goto LABEL_12;
      }
    }
    v11 = [v5 bundle];
    objc_super v12 = v11;
    if (v11 == self->_bundle) {
      char v10 = 1;
    }
    else {
      char v10 = -[NSBundle isEqual:](v11, "isEqual:");
    }

    goto LABEL_11;
  }
  char v10 = 0;
LABEL_12:

  return v10;
}

- (RENamedImage)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"name"];
  id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"bundle"];

  id v7 = [MEMORY[0x263F086E0] bundleWithPath:v6];
  v8 = [(RENamedImage *)self initWithName:v5 inBundle:v7];

  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  bundle = self->_bundle;
  id v6 = a3;
  id v5 = [(NSBundle *)bundle bundlePath];
  [v6 encodeObject:v5 forKey:@"bundle"];

  [v6 encodeObject:self->_name forKey:@"name"];
}

- (NSString)name
{
  return self->_name;
}

- (NSBundle)bundle
{
  return self->_bundle;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundle, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end