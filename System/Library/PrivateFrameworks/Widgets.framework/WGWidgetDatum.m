@interface WGWidgetDatum
- (BOOL)isEqual:(id)a3;
- (NSExtension)representedExtension;
- (NSString)datumIdentifier;
- (NSString)description;
- (WGWidgetDatum)initWithExtension:(id)a3;
- (unint64_t)hash;
@end

@implementation WGWidgetDatum

- (WGWidgetDatum)initWithExtension:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)WGWidgetDatum;
  v6 = [(WGWidgetDatum *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_representedExtension, a3);
  }

  return v7;
}

- (NSString)datumIdentifier
{
  return (NSString *)[(NSExtension *)self->_representedExtension identifier];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  id v5 = self;
  id v6 = v4;
  v7 = v6;
  if (v5 && v6 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v8 = [(WGWidgetDatum *)v5 datumIdentifier];
    objc_super v9 = [v7 datumIdentifier];
    int v10 = [v8 isEqual:v9];

    if (!v10)
    {
      char v12 = 0;
      goto LABEL_8;
    }
    representedExtension = v5->_representedExtension;
    id v5 = [v7 representedExtension];
    char v12 = [(NSExtension *)representedExtension isEqual:v5];
  }
  else
  {

    char v12 = 0;
  }

LABEL_8:
  return v12;
}

- (unint64_t)hash
{
  return [(NSExtension *)self->_representedExtension hash];
}

- (NSString)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  id v5 = [(NSExtension *)self->_representedExtension wg_description];
  id v6 = [v3 stringWithFormat:@"<%@: %p; representedExtension: %@>", v4, self, v5];

  return (NSString *)v6;
}

- (NSExtension)representedExtension
{
  return self->_representedExtension;
}

- (void).cxx_destruct
{
}

@end