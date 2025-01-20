@interface UIDebuggingInformationHierarchyLayoutAttributes
- (BOOL)isEqual:(id)a3;
- (UIColor)lineColor;
- (id)copyWithZone:(_NSZone *)a3;
- (void)setLineColor:(id)a3;
@end

@implementation UIDebuggingInformationHierarchyLayoutAttributes

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)UIDebuggingInformationHierarchyLayoutAttributes;
  if ([(UICollectionViewLayoutAttributes *)&v9 isEqual:v4]
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v5 = [v4 lineColor];
    v6 = [(UIDebuggingInformationHierarchyLayoutAttributes *)self lineColor];
    BOOL v7 = v5 == v6;
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v7.receiver = self;
  v7.super_class = (Class)UIDebuggingInformationHierarchyLayoutAttributes;
  id v4 = [(UICollectionViewLayoutAttributes *)&v7 copyWithZone:a3];
  v5 = [(UIDebuggingInformationHierarchyLayoutAttributes *)self lineColor];
  [v4 setLineColor:v5];

  return v4;
}

- (UIColor)lineColor
{
  return self->_lineColor;
}

- (void)setLineColor:(id)a3
{
}

- (void).cxx_destruct
{
}

@end