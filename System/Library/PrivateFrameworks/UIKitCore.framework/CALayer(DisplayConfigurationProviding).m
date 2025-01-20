@interface CALayer(DisplayConfigurationProviding)
- (id)_uis_provideRenderingAttributes;
@end

@implementation CALayer(DisplayConfigurationProviding)

- (id)_uis_provideRenderingAttributes
{
  v1 = _UIViewLayerGetNearestAncestorView(a1);
  v2 = [v1 traitCollection];
  id v3 = [v2 objectForTrait:objc_opt_class()];
  if (!v3)
  {
    v4 = [v1 _window];
    v5 = [v4 windowScene];
    v6 = -[UIScene _renderingEnvironmentSceneComponentRegisteringIfNecessary:](v5, 1);

    if (v6) {
      v7 = (void *)v6[3];
    }
    else {
      v7 = 0;
    }
    id v3 = v7;
  }
  return v3;
}

@end