@interface PRTimeDescriptor
+ (BOOL)supportsBSXPCSecureCoding;
- (BOOL)isEqual:(id)a3;
- (PRTimeDescriptor)initWithBSXPCCoder:(id)a3;
- (UIColor)color;
- (UIFont)font;
- (id)copyWithZone:(_NSZone *)a3;
- (void)encodeWithBSXPCCoder:(id)a3;
- (void)setColor:(id)a3;
- (void)setFont:(id)a3;
@end

@implementation PRTimeDescriptor

- (BOOL)isEqual:(id)a3
{
  v4 = (PRTimeDescriptor *)a3;
  v5 = v4;
  if (v4 == self)
  {
    char v6 = 1;
  }
  else if (v4 && [(UIFont *)self->_font isEqual:v4->_font])
  {
    char v6 = [(UIColor *)self->_color isEqual:v5->_color];
  }
  else
  {
    char v6 = 0;
  }

  return v6;
}

+ (BOOL)supportsBSXPCSecureCoding
{
  return 1;
}

- (void)encodeWithBSXPCCoder:(id)a3
{
  font = self->_font;
  id v5 = a3;
  [v5 encodeObject:font forKey:@"_font"];
  [v5 encodeObject:self->_color forKey:@"_color"];
}

- (PRTimeDescriptor)initWithBSXPCCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(PRTimeDescriptor *)self init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_font"];
    font = v5->_font;
    v5->_font = (UIFont *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_color"];
    color = v5->_color;
    v5->_color = (UIColor *)v8;
  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init(PRTimeDescriptor);
  objc_storeStrong((id *)&v4->_font, self->_font);
  objc_storeStrong((id *)&v4->_color, self->_color);
  return v4;
}

- (UIFont)font
{
  return self->_font;
}

- (void)setFont:(id)a3
{
}

- (UIColor)color
{
  return self->_color;
}

- (void)setColor:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_color, 0);
  objc_storeStrong((id *)&self->_font, 0);
}

@end