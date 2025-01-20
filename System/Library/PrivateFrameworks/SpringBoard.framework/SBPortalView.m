@interface SBPortalView
+ (Class)layerClass;
- (BOOL)allowsBackdropGroups;
- (BOOL)hidesSourceView;
- (BOOL)matchesAlpha;
- (BOOL)matchesPosition;
- (BOOL)matchesTransform;
- (BOOL)passesTouchesThrough;
- (UIView)sourceView;
- (id)description;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (void)setAllowsBackdropGroups:(BOOL)a3;
- (void)setHidesSourceView:(BOOL)a3;
- (void)setMatchesAlpha:(BOOL)a3;
- (void)setMatchesPosition:(BOOL)a3;
- (void)setMatchesTransform:(BOOL)a3;
- (void)setPassesTouchesThrough:(BOOL)a3;
- (void)setSourceView:(id)a3;
@end

@implementation SBPortalView

- (void)setSourceView:(id)a3
{
  p_sourceView = &self->_sourceView;
  id v5 = a3;
  objc_storeWeak((id *)p_sourceView, v5);
  id v7 = [v5 layer];

  v6 = [(SBPortalView *)self portalLayer];
  [v6 setSourceLayer:v7];
}

- (BOOL)hidesSourceView
{
  v2 = [(SBPortalView *)self portalLayer];
  char v3 = [v2 hidesSourceLayer];

  return v3;
}

- (void)setHidesSourceView:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(SBPortalView *)self portalLayer];
  [v4 setHidesSourceLayer:v3];
}

- (BOOL)matchesAlpha
{
  v2 = [(SBPortalView *)self portalLayer];
  char v3 = [v2 matchesOpacity];

  return v3;
}

- (void)setMatchesAlpha:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(SBPortalView *)self portalLayer];
  [v4 setMatchesOpacity:v3];
}

- (BOOL)matchesTransform
{
  v2 = [(SBPortalView *)self portalLayer];
  char v3 = [v2 matchesTransform];

  return v3;
}

- (void)setMatchesTransform:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(SBPortalView *)self portalLayer];
  [v4 setMatchesTransform:v3];
}

- (BOOL)matchesPosition
{
  v2 = [(SBPortalView *)self portalLayer];
  char v3 = [v2 matchesPosition];

  return v3;
}

- (void)setMatchesPosition:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(SBPortalView *)self portalLayer];
  [v4 setMatchesPosition:v3];
}

- (BOOL)allowsBackdropGroups
{
  v2 = [(SBPortalView *)self portalLayer];
  char v3 = [v2 allowsBackdropGroups];

  return v3;
}

- (void)setAllowsBackdropGroups:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(SBPortalView *)self portalLayer];
  [v4 setAllowsBackdropGroups:v3];
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)SBPortalView;
  BOOL v3 = [(SBPortalView *)&v7 description];
  id v4 = (void *)[v3 mutableCopy];

  objc_msgSend(v4, "replaceCharactersInRange:withString:", objc_msgSend(v4, "length") - 1, 1, @"; ");
  if ([(SBPortalView *)self hidesSourceView]) {
    [v4 appendString:@"hidesSourceView = YES; "];
  }
  if ([(SBPortalView *)self matchesAlpha]) {
    [v4 appendString:@"matchesAlpha = YES; "];
  }
  if ([(SBPortalView *)self matchesPosition]) {
    [v4 appendString:@"matchesPosition = YES; "];
  }
  if ([(SBPortalView *)self matchesTransform]) {
    [v4 appendString:@"matchesTransform = YES; "];
  }
  if ([(SBPortalView *)self allowsBackdropGroups]) {
    [v4 appendString:@"allowsBackdropGroups = YES; "];
  }
  id v5 = [(SBPortalView *)self sourceView];
  [v4 appendFormat:@"sourceView = <%@: %p>>", objc_opt_class(), v5];

  return v4;
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)SBPortalView;
  -[SBPortalView hitTest:withEvent:](&v7, sel_hitTest_withEvent_, a4, a3.x, a3.y);
  id v5 = (SBPortalView *)objc_claimAutoreleasedReturnValue();
  if (v5 == self)
  {
    if (self->_passesTouchesThrough)
    {

      id v5 = 0;
    }
    else
    {
      id v5 = self;
    }
  }
  return v5;
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

- (BOOL)passesTouchesThrough
{
  return self->_passesTouchesThrough;
}

- (void)setPassesTouchesThrough:(BOOL)a3
{
  self->_passesTouchesThrough = a3;
}

- (void).cxx_destruct
{
}

@end