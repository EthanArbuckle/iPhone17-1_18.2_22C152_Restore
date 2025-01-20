@interface TUILinkEntityAttributes
- (NSArray)linkEntities;
- (TUIIdentifier)identifier;
- (TUILinkEntityAttributes)initWithIdentifier:(id)a3 linkEntities:(id)a4 size:(CGSize)a5 center:(CGPoint)a6 transform:(CGAffineTransform *)a7;
- (id)description;
@end

@implementation TUILinkEntityAttributes

- (TUILinkEntityAttributes)initWithIdentifier:(id)a3 linkEntities:(id)a4 size:(CGSize)a5 center:(CGPoint)a6 transform:(CGAffineTransform *)a7
{
  double y = a6.y;
  double x = a6.x;
  double height = a5.height;
  double width = a5.width;
  id v15 = a3;
  id v16 = a4;
  v24.receiver = self;
  v24.super_class = (Class)TUILinkEntityAttributes;
  long long v17 = *(_OWORD *)&a7->c;
  v23[0] = *(_OWORD *)&a7->a;
  v23[1] = v17;
  v23[2] = *(_OWORD *)&a7->tx;
  v18 = -[TUIGeometryAttributes initWithSize:center:transform:](&v24, "initWithSize:center:transform:", v23, width, height, x, y);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_identifier, a3);
    v20 = (NSArray *)[v16 copy];
    linkEntities = v19->_linkEntities;
    v19->_linkEntities = v20;
  }
  return v19;
}

- (id)description
{
  v3 = (objc_class *)objc_opt_class();
  v4 = NSStringFromClass(v3);
  v5 = [(TUIIdentifier *)self->_identifier tui_identifierToString];
  v6 = +[NSString stringWithFormat:@"<%@ %p id=%@ entities=%@>", v4, self, v5, self->_linkEntities];

  return v6;
}

- (TUIIdentifier)identifier
{
  return self->_identifier;
}

- (NSArray)linkEntities
{
  return self->_linkEntities;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_linkEntities, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

@end