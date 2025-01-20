@interface _UIPortalView
+ (Class)layerClass;
- (BOOL)_allowedInContextTransform;
- (BOOL)_isGeometryFrozen;
- (BOOL)_prefersClientLayer;
- (BOOL)_shouldAnimatePropertyWithKey:(id)a3;
- (BOOL)allowsBackdropGroups;
- (BOOL)allowsHitTesting;
- (BOOL)forwardsClientHitTestingToSourceView;
- (BOOL)hidesSourceView;
- (BOOL)matchesAlpha;
- (BOOL)matchesPosition;
- (BOOL)matchesTransform;
- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4;
- (NSSet)_additionalAnimatableKeyPaths;
- (NSString)description;
- (NSString)name;
- (UIView)sourceView;
- (_UIPortalView)initWithFrame:(CGRect)a3;
- (_UIPortalView)initWithSourceView:(id)a3;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (void)_setAdditionalAnimatableKeypaths:(id)a3;
- (void)_setAllowedInContextTransform:(BOOL)a3;
- (void)_setGeometryFrozen:(BOOL)a3;
- (void)_setPrefersClientLayer:(BOOL)a3;
- (void)_updateSourceLayer;
- (void)setAllowsBackdropGroups:(BOOL)a3;
- (void)setAllowsHitTesting:(BOOL)a3;
- (void)setBounds:(CGRect)a3;
- (void)setCenter:(CGPoint)a3;
- (void)setForwardsClientHitTestingToSourceView:(BOOL)a3;
- (void)setFrame:(CGRect)a3;
- (void)setHidden:(BOOL)a3;
- (void)setHidesSourceView:(BOOL)a3;
- (void)setMatchesAlpha:(BOOL)a3;
- (void)setMatchesPosition:(BOOL)a3;
- (void)setMatchesTransform:(BOOL)a3;
- (void)setName:(id)a3;
- (void)setSourceView:(id)a3;
@end

@implementation _UIPortalView

+ (Class)layerClass
{
  return (Class)objc_opt_class();
}

- (BOOL)_shouldAnimatePropertyWithKey:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)_UIPortalView;
  if ([(UIView *)&v8 _shouldAnimatePropertyWithKey:v4])
  {
    char v5 = 1;
  }
  else
  {
    v6 = [(_UIPortalView *)self _additionalAnimatableKeyPaths];
    char v5 = [v6 containsObject:v4];
  }
  return v5;
}

- (NSSet)_additionalAnimatableKeyPaths
{
  return self->__additionalAnimatableKeyPaths;
}

- (void)setFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  if (![(_UIPortalView *)self _isGeometryFrozen])
  {
    v8.receiver = self;
    v8.super_class = (Class)_UIPortalView;
    -[UIView setFrame:](&v8, sel_setFrame_, x, y, width, height);
  }
}

- (void)setHidden:(BOOL)a3
{
  BOOL v3 = a3;
  if (![(_UIPortalView *)self _isGeometryFrozen])
  {
    v5.receiver = self;
    v5.super_class = (Class)_UIPortalView;
    [(UIView *)&v5 setHidden:v3];
  }
}

- (BOOL)_isGeometryFrozen
{
  return self->__geometryFrozen;
}

- (_UIPortalView)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)_UIPortalView;
  BOOL v3 = -[UIView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  id v4 = v3;
  if (v3) {
    [(_UIPortalView *)v3 setAllowsHitTesting:0];
  }
  return v4;
}

- (void)setAllowsHitTesting:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(_UIPortalView *)self portalLayer];
  [v4 setAllowsHitTesting:v3];
}

- (void)setSourceView:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_sourceView);

  if (WeakRetained != obj)
  {
    id v5 = objc_loadWeakRetained((id *)&self->_sourceView);
    -[UIView _removeMultiLayerDelegate:]((uint64_t)v5, (uint64_t)self);

    id v6 = objc_storeWeak((id *)&self->_sourceView, obj);
    -[UIView _registerMultiLayerDelegate:]((char *)obj, (uint64_t)self);

    [(_UIPortalView *)self _updateSourceLayer];
  }
}

- (void)_updateSourceLayer
{
  BOOL v3 = [(_UIPortalView *)self _prefersClientLayer];
  id v4 = [(_UIPortalView *)self sourceView];
  v7 = v4;
  if (v3) {
    -[UIView _backing_clientLayer](v4);
  }
  else {
  id v5 = -[UIView _backing_outermostLayer](v4);
  }
  id v6 = [(_UIPortalView *)self portalLayer];
  [v6 setSourceLayer:v5];
}

- (UIView)sourceView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_sourceView);
  return (UIView *)WeakRetained;
}

- (BOOL)_prefersClientLayer
{
  return self->__prefersClientLayer;
}

- (_UIPortalView)initWithSourceView:(id)a3
{
  id v4 = a3;
  [v4 bounds];
  id v5 = -[_UIPortalView initWithFrame:](self, "initWithFrame:", 0.0, 0.0);
  id v6 = v5;
  if (v5) {
    [(_UIPortalView *)v5 setSourceView:v4];
  }

  return v6;
}

- (void)setName:(id)a3
{
  id v7 = a3;
  if (!-[NSString isEqualToString:](self->_name, "isEqualToString:"))
  {
    id v4 = (NSString *)[v7 copy];
    name = self->_name;
    self->_name = v4;

    if (os_variant_has_internal_diagnostics())
    {
      id v6 = [(UIView *)self layer];
      [v6 setName:v7];
    }
  }
}

- (BOOL)hidesSourceView
{
  v2 = [(_UIPortalView *)self portalLayer];
  char v3 = [v2 hidesSourceLayer];

  return v3;
}

- (void)setHidesSourceView:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(_UIPortalView *)self portalLayer];
  [v4 setHidesSourceLayer:v3];
}

- (BOOL)matchesAlpha
{
  v2 = [(_UIPortalView *)self portalLayer];
  char v3 = [v2 matchesOpacity];

  return v3;
}

- (void)setMatchesAlpha:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(_UIPortalView *)self portalLayer];
  [v4 setMatchesOpacity:v3];
}

- (BOOL)matchesTransform
{
  v2 = [(_UIPortalView *)self portalLayer];
  char v3 = [v2 matchesTransform];

  return v3;
}

- (void)setMatchesTransform:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(_UIPortalView *)self portalLayer];
  [v4 setMatchesTransform:v3];
}

- (BOOL)matchesPosition
{
  v2 = [(_UIPortalView *)self portalLayer];
  char v3 = [v2 matchesPosition];

  return v3;
}

- (void)setMatchesPosition:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(_UIPortalView *)self portalLayer];
  [v4 setMatchesPosition:v3];
}

- (BOOL)allowsBackdropGroups
{
  v2 = [(_UIPortalView *)self portalLayer];
  char v3 = [v2 allowsBackdropGroups];

  return v3;
}

- (void)setAllowsBackdropGroups:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(_UIPortalView *)self portalLayer];
  [v4 setAllowsBackdropGroups:v3];
}

- (BOOL)allowsHitTesting
{
  v2 = [(_UIPortalView *)self portalLayer];
  char v3 = [v2 allowsHitTesting];

  return v3;
}

- (void)_setPrefersClientLayer:(BOOL)a3
{
  if (self->__prefersClientLayer != a3)
  {
    self->__prefersClientLayer = a3;
    [(_UIPortalView *)self _updateSourceLayer];
  }
}

- (void)_setAllowedInContextTransform:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(_UIPortalView *)self portalLayer];
  [v4 setAllowedInContextTransform:v3];
}

- (BOOL)_allowedInContextTransform
{
  v2 = [(_UIPortalView *)self portalLayer];
  char v3 = [v2 allowedInContextTransform];

  return v3;
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)_UIPortalView;
  -[UIView hitTest:withEvent:](&v11, sel_hitTest_withEvent_, v7, x, y);
  objc_super v8 = (_UIPortalView *)objc_claimAutoreleasedReturnValue();
  v9 = [(_UIPortalView *)self sourceView];
  if ([(_UIPortalView *)self forwardsClientHitTestingToSourceView]
    && v9
    && v8 == self)
  {
    objc_msgSend(v9, "convertPoint:fromView:", self, x, y);
    objc_msgSend(v9, "hitTest:withEvent:", v7);
    objc_super v8 = (_UIPortalView *)objc_claimAutoreleasedReturnValue();
  }
  return v8;
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)_UIPortalView;
  unsigned __int8 v8 = -[UIView pointInside:withEvent:](&v11, sel_pointInside_withEvent_, v7, x, y);
  v9 = [(_UIPortalView *)self sourceView];
  if ([(_UIPortalView *)self forwardsClientHitTestingToSourceView] && v9)
  {
    objc_msgSend(v9, "convertPoint:fromView:", self, x, y);
    unsigned __int8 v8 = objc_msgSend(v9, "pointInside:withEvent:", v7);
  }

  return v8;
}

- (NSString)description
{
  v13.receiver = self;
  v13.super_class = (Class)_UIPortalView;
  char v3 = [(UIView *)&v13 description];
  id v4 = (void *)[v3 mutableCopy];

  objc_msgSend(v4, "replaceCharactersInRange:withString:", objc_msgSend(v4, "length") - 1, 1, @"; ");
  if (os_variant_has_internal_diagnostics())
  {
    id v6 = [(_UIPortalView *)self name];

    if (v6)
    {
      id v7 = NSString;
      unsigned __int8 v8 = [(_UIPortalView *)self name];
      v9 = [v7 stringWithFormat:@"name = %@ ", v8];;
      [v4 appendString:v9];
    }
    if ([(_UIPortalView *)self hidesSourceView]) {
      [v4 appendString:@"hidesSourceView = YES; "];
    }
    if ([(_UIPortalView *)self matchesAlpha]) {
      [v4 appendString:@"matchesAlpha = YES; "];
    }
    if ([(_UIPortalView *)self matchesPosition]) {
      [v4 appendString:@"matchesPosition = YES; "];
    }
    if ([(_UIPortalView *)self matchesTransform]) {
      [v4 appendString:@"matchesTransform = YES; "];
    }
    if ([(_UIPortalView *)self allowsBackdropGroups]) {
      [v4 appendString:@"allowsBackdropGroups = YES; "];
    }
    if ([(_UIPortalView *)self allowsHitTesting]) {
      [v4 appendString:@"allowsHitTesting = YES; "];
    }
    if ([(_UIPortalView *)self _isGeometryFrozen]) {
      [v4 appendString:@"_geometryFrozen = YES; "];
    }
    v10 = [(_UIPortalView *)self sourceView];
    uint64_t v11 = objc_opt_class();
    v12 = [(_UIPortalView *)self sourceView];
    [v4 appendFormat:@"sourceView = <%@: %p>>", v11, v12];
  }
  return (NSString *)v4;
}

- (void)setBounds:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  if (![(_UIPortalView *)self _isGeometryFrozen])
  {
    v8.receiver = self;
    v8.super_class = (Class)_UIPortalView;
    -[UIView setBounds:](&v8, sel_setBounds_, x, y, width, height);
  }
}

- (void)setCenter:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  if (![(_UIPortalView *)self _isGeometryFrozen])
  {
    v6.receiver = self;
    v6.super_class = (Class)_UIPortalView;
    -[UIView setCenter:](&v6, sel_setCenter_, x, y);
  }
}

- (NSString)name
{
  return self->_name;
}

- (BOOL)forwardsClientHitTestingToSourceView
{
  return self->_forwardsClientHitTestingToSourceView;
}

- (void)setForwardsClientHitTestingToSourceView:(BOOL)a3
{
  self->_forwardsClientHitTestingToSourceView = a3;
}

- (void)_setGeometryFrozen:(BOOL)a3
{
  self->__geometryFrozen = a3;
}

- (void)_setAdditionalAnimatableKeypaths:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__additionalAnimatableKeyPaths, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_destroyWeak((id *)&self->_sourceView);
}

@end