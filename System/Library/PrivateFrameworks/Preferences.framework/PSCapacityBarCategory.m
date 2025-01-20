@interface PSCapacityBarCategory
- (NSString)identifier;
- (NSString)title;
- (PSCapacityBarCategory)initWithIdentifier:(id)a3 title:(id)a4 color:(id)a5 bytes:(int64_t)a6;
- (UIColor)color;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)bytes;
- (void)setBytes:(unint64_t)a3;
- (void)setColor:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation PSCapacityBarCategory

- (PSCapacityBarCategory)initWithIdentifier:(id)a3 title:(id)a4 color:(id)a5 bytes:(int64_t)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v16.receiver = self;
  v16.super_class = (Class)PSCapacityBarCategory;
  v13 = [(PSCapacityBarCategory *)&v16 init];
  if (v13)
  {
    if ([v10 length]) {
      v14 = v10;
    }
    else {
      v14 = v11;
    }
    objc_storeStrong((id *)&v13->_identifier, v14);
    objc_storeStrong((id *)&v13->_title, a4);
    objc_storeStrong((id *)&v13->_color, a5);
    v13->_bytes = a6;
  }

  return v13;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [PSCapacityBarCategory alloc];
  title = self->_title;
  color = self->_color;
  unint64_t bytes = self->_bytes;
  identifier = self->_identifier;
  return [(PSCapacityBarCategory *)v4 initWithIdentifier:identifier title:title color:color bytes:bytes];
}

- (unint64_t)bytes
{
  return self->_bytes;
}

- (void)setBytes:(unint64_t)a3
{
  self->_unint64_t bytes = a3;
}

- (NSString)identifier
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setIdentifier:(id)a3
{
}

- (NSString)title
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setTitle:(id)a3
{
}

- (UIColor)color
{
  return (UIColor *)objc_getProperty(self, a2, 32, 1);
}

- (void)setColor:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_color, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end