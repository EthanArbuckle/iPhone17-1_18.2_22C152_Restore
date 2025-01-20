@interface THGlossaryDividerLayout
- (Class)repClassOverride;
- (id)computeLayoutGeometry;
- (void)validate;
@end

@implementation THGlossaryDividerLayout

- (Class)repClassOverride
{
  return (Class)objc_opt_class();
}

- (void)validate
{
  [(THGlossaryDividerLayout *)self invalidateFrame];
  v3.receiver = self;
  v3.super_class = (Class)THGlossaryDividerLayout;
  [(THGlossaryDividerLayout *)&v3 validate];
}

- (id)computeLayoutGeometry
{
  id v2 = [objc_alloc((Class)TSDLayoutGeometry) initWithFrame:0.0, 0.0, 100.0, 1.0];

  return v2;
}

@end