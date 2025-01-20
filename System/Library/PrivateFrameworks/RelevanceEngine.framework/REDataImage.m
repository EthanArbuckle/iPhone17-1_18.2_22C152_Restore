@interface REDataImage
- (BOOL)isEqual:(id)a3;
- (NSData)data;
- (REDataImage)initWithCoder:(id)a3;
- (REDataImage)initWithData:(id)a3 scale:(double)a4;
- (double)scale;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation REDataImage

- (REDataImage)initWithData:(id)a3 scale:(double)a4
{
  id v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)REDataImage;
  v7 = [(REDataImage *)&v11 init];
  if (v7)
  {
    uint64_t v8 = [v6 copy];
    data = v7->_data;
    v7->_data = (NSData *)v8;

    v7->_scale = a4;
  }

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  data = self->_data;
  double scale = self->_scale;
  return (id)[v4 initWithData:data scale:scale];
}

- (unint64_t)hash
{
  unint64_t scale = (unint64_t)self->_scale;
  return [(NSData *)self->_data hash] ^ scale;
}

- (BOOL)isEqual:(id)a3
{
  id v5 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v6 = v5;
    v7 = [v6 data];
    data = self->_data;
    if (v7 == data
      || ([v6 data],
          v3 = objc_claimAutoreleasedReturnValue(),
          [v3 isEqualToData:self->_data]))
    {
      [v6 scale];
      *(float *)&double v10 = v10 - self->_scale;
      BOOL v9 = fabsf(*(float *)&v10) < 0.00000011921;
      if (v7 == data)
      {
LABEL_8:

        goto LABEL_9;
      }
    }
    else
    {
      BOOL v9 = 0;
    }

    goto LABEL_8;
  }
  BOOL v9 = 0;
LABEL_9:

  return v9;
}

- (REDataImage)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"data"];
  id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"scale"];

  [v6 doubleValue];
  v7 = -[REDataImage initWithData:scale:](self, "initWithData:scale:", v5);

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  data = self->_data;
  id v5 = a3;
  [v5 encodeObject:data forKey:@"data"];
  id v6 = [NSNumber numberWithDouble:self->_scale];
  [v5 encodeObject:v6 forKey:@"scale"];
}

- (NSData)data
{
  return self->_data;
}

- (double)scale
{
  return self->_scale;
}

- (void).cxx_destruct
{
}

@end