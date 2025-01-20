@interface PGPortalView
+ (Class)layerClass;
- (UIView)sourceView;
- (void)setSourceView:(id)a3;
@end

@implementation PGPortalView

- (void)setSourceView:(id)a3
{
  id v4 = a3;
  v5 = [(PGPortalView *)self portalLayer];
  v6 = [v4 layer];

  [v5 setSourceLayer:v6];
  id v7 = [(PGPortalView *)self portalLayer];
  [v7 setMatchesTransform:1];
}

+ (Class)layerClass
{
  return (Class)objc_opt_class();
}

- (UIView)sourceView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_sourceView);

  return (UIView *)WeakRetained;
}

- (void).cxx_destruct
{
}

@end