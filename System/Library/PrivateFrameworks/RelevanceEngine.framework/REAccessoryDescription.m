@interface REAccessoryDescription
- (BOOL)isEqual:(id)a3;
- (CLKTextProvider)textProvider;
- (REAccessoryDescription)initWithCoder:(id)a3;
- (UIColor)backgroundColor;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setBackgroundColor:(id)a3;
- (void)setTextProvider:(id)a3;
@end

@implementation REAccessoryDescription

- (REAccessoryDescription)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)REAccessoryDescription;
  v5 = [(REAccessoryDescription *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectForKey:@"_backgroundColor"];
    backgroundColor = v5->_backgroundColor;
    v5->_backgroundColor = (UIColor *)v6;

    uint64_t v8 = [v4 decodeObjectForKey:@"_textProvider"];
    textProvider = v5->_textProvider;
    v5->_textProvider = (CLKTextProvider *)v8;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  backgroundColor = self->_backgroundColor;
  id v5 = a3;
  [v5 encodeObject:backgroundColor forKey:@"_backgroundColor"];
  [v5 encodeObject:self->_textProvider forKey:@"_textProvider"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [+[REAccessoryDescription allocWithZone:a3] init];
  objc_storeStrong((id *)&v4->_backgroundColor, self->_backgroundColor);
  objc_storeStrong((id *)&v4->_textProvider, self->_textProvider);
  return v4;
}

- (unint64_t)hash
{
  uint64_t v3 = [(CLKTextProvider *)self->_textProvider hash];
  return [(UIColor *)self->_backgroundColor hash] ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    uint64_t v6 = (CLKTextProvider *)v5[2];
    v7 = self->_textProvider;
    uint64_t v8 = v7;
    if (v7 == v6) {
      int v9 = 1;
    }
    else {
      int v9 = [(CLKTextProvider *)v7 isEqual:v6];
    }

    v10 = (UIColor *)v5[1];
    objc_super v11 = self->_backgroundColor;
    v12 = v11;
    if (v11 != v10) {
      v9 &= [(UIColor *)v11 isEqual:v10];
    }
  }
  else
  {
    v14.receiver = self;
    v14.super_class = (Class)REAccessoryDescription;
    LOBYTE(v9) = [(REAccessoryDescription *)&v14 isEqual:v4];
  }

  return v9;
}

- (UIColor)backgroundColor
{
  return self->_backgroundColor;
}

- (void)setBackgroundColor:(id)a3
{
}

- (CLKTextProvider)textProvider
{
  return self->_textProvider;
}

- (void)setTextProvider:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textProvider, 0);
  objc_storeStrong((id *)&self->_backgroundColor, 0);
}

@end