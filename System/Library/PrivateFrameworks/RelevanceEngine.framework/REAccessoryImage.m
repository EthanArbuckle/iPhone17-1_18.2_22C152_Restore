@interface REAccessoryImage
- (BOOL)isEqual:(id)a3;
- (REAccessoryImage)initWithCoder:(id)a3;
- (REImage)image;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setImage:(id)a3;
@end

@implementation REAccessoryImage

- (REAccessoryImage)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)REAccessoryImage;
  v5 = [(REAccessoryImage *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectForKey:@"_image"];
    image = v5->_image;
    v5->_image = (REImage *)v6;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = [+[REAccessoryImage allocWithZone:](REAccessoryImage, "allocWithZone:") init];
  uint64_t v6 = [(REImage *)self->_image copyWithZone:a3];
  image = v5->_image;
  v5->_image = v6;

  return v5;
}

- (unint64_t)hash
{
  return [(REImage *)self->_image hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    image = self->_image;
    uint64_t v6 = (REImage *)v4[1];
    v7 = image;
    v8 = v7;
    if (v7 == v6) {
      unsigned __int8 v9 = 1;
    }
    else {
      unsigned __int8 v9 = [(REImage *)v7 isEqual:v6];
    }
  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)REAccessoryImage;
    unsigned __int8 v9 = [(REAccessoryImage *)&v11 isEqual:v4];
  }

  return v9;
}

- (REImage)image
{
  return self->_image;
}

- (void)setImage:(id)a3
{
}

- (void).cxx_destruct
{
}

@end