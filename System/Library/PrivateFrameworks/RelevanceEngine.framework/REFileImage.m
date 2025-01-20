@interface REFileImage
- (BOOL)isEqual:(id)a3;
- (NSString)path;
- (REFileImage)initWithCoder:(id)a3;
- (REFileImage)initWithPath:(id)a3 scale:(double)a4;
- (double)scale;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation REFileImage

- (REFileImage)initWithPath:(id)a3 scale:(double)a4
{
  id v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)REFileImage;
  v7 = [(REFileImage *)&v11 init];
  if (v7)
  {
    uint64_t v8 = [v6 copy];
    path = v7->_path;
    v7->_path = (NSString *)v8;

    v7->_scale = a4;
  }

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  path = self->_path;
  double scale = self->_scale;
  return (id)[v4 initWithPath:path scale:scale];
}

- (unint64_t)hash
{
  unint64_t scale = (unint64_t)self->_scale;
  return [(NSString *)self->_path hash] ^ scale;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    id v6 = [v5 path];
    v7 = self->_path;
    if (v6 == v7)
    {
    }
    else
    {
      uint64_t v8 = v7;
      int v9 = [(NSString *)v6 isEqual:v7];

      if (!v9)
      {
        BOOL v10 = 0;
LABEL_8:

        goto LABEL_9;
      }
    }
    [v5 scale];
    *(float *)&double v11 = v11 - self->_scale;
    BOOL v10 = fabsf(*(float *)&v11) < 0.00000011921;
    goto LABEL_8;
  }
  BOOL v10 = 0;
LABEL_9:

  return v10;
}

- (REFileImage)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"path"];
  id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"scale"];

  [v6 doubleValue];
  v7 = -[REFileImage initWithPath:scale:](self, "initWithPath:scale:", v5);

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  path = self->_path;
  id v5 = a3;
  [v5 encodeObject:path forKey:@"path"];
  id v6 = [NSNumber numberWithDouble:self->_scale];
  [v5 encodeObject:v6 forKey:@"scale"];
}

- (NSString)path
{
  return self->_path;
}

- (double)scale
{
  return self->_scale;
}

- (void).cxx_destruct
{
}

@end