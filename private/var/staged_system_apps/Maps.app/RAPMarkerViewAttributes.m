@interface RAPMarkerViewAttributes
- (GEOFeatureStyleAttributes)styleAttributes;
- (NSString)title;
- (RAPMarkerViewAttributes)initWithTitle:(id)a3 styleAttributes:(id)a4;
- (id)copyWithZone:(_NSZone *)a3;
@end

@implementation RAPMarkerViewAttributes

- (RAPMarkerViewAttributes)initWithTitle:(id)a3 styleAttributes:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)RAPMarkerViewAttributes;
  v8 = [(RAPMarkerViewAttributes *)&v14 init];
  if (v8)
  {
    v9 = (NSString *)[v6 copy];
    title = v8->_title;
    v8->_title = v9;

    v11 = (GEOFeatureStyleAttributes *)[v7 copy];
    styleAttributes = v8->_styleAttributes;
    v8->_styleAttributes = v11;
  }
  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [[objc_opt_class() allocWithZone:a3] init];
  id v5 = [(GEOFeatureStyleAttributes *)self->_styleAttributes copy];
  id v6 = (void *)v4[2];
  v4[2] = v5;

  id v7 = [(NSString *)self->_title copy];
  v8 = (void *)v4[1];
  v4[1] = v7;

  return v4;
}

- (NSString)title
{
  return self->_title;
}

- (GEOFeatureStyleAttributes)styleAttributes
{
  return self->_styleAttributes;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_styleAttributes, 0);

  objc_storeStrong((id *)&self->_title, 0);
}

@end