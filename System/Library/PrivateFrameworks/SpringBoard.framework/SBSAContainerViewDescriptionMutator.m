@interface SBSAContainerViewDescriptionMutator
- (CGPoint)contentCenter;
- (CGRect)contentBounds;
- (CGSize)contentScale;
- (SAElementIdentifying)associatedSystemApertureElementIdentity;
- (SBSystemApertureContainerRenderingConfiguration)renderingConfiguration;
- (UIColor)keyLineTintColor;
- (id)_containerViewDescription;
- (int64_t)keyLineMode;
- (int64_t)sampledBackgroundLuminanceLevel;
- (int64_t)shadowStyle;
- (void)setAssociatedSystemApertureElementIdentity:(id)a3;
- (void)setContentBounds:(CGRect)a3;
- (void)setContentCenter:(CGPoint)a3;
- (void)setContentScale:(CGSize)a3;
- (void)setKeyLineMode:(int64_t)a3;
- (void)setKeyLineTintColor:(id)a3;
- (void)setRenderingConfiguration:(SBSystemApertureContainerRenderingConfiguration *)a3;
- (void)setSampledBackgroundLuminanceLevel:(int64_t)a3;
- (void)setShadowStyle:(int64_t)a3;
@end

@implementation SBSAContainerViewDescriptionMutator

- (void)setSampledBackgroundLuminanceLevel:(int64_t)a3
{
  id v4 = [(SBSAContainerViewDescriptionMutator *)self _containerViewDescription];
  [v4 _setSampledBackgroundLuminanceLevel:a3];
}

- (void)setShadowStyle:(int64_t)a3
{
  id v4 = [(SBSAContainerViewDescriptionMutator *)self _containerViewDescription];
  [v4 _setShadowStyle:a3];
}

- (void)setContentCenter:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  id v5 = [(SBSAContainerViewDescriptionMutator *)self _containerViewDescription];
  objc_msgSend(v5, "_setContentCenter:", x, y);
}

- (void)setContentBounds:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v7 = [(SBSAContainerViewDescriptionMutator *)self _containerViewDescription];
  objc_msgSend(v7, "_setContentBounds:", x, y, width, height);
}

- (void)setKeyLineMode:(int64_t)a3
{
  id v4 = [(SBSAContainerViewDescriptionMutator *)self _containerViewDescription];
  [v4 _setKeyLineMode:a3];
}

- (void)setKeyLineTintColor:(id)a3
{
  id v7 = a3;
  id v4 = [(SBSAContainerViewDescriptionMutator *)self keyLineTintColor];
  char v5 = BSEqualObjects();

  if ((v5 & 1) == 0)
  {
    v6 = [(SBSAContainerViewDescriptionMutator *)self _containerViewDescription];
    [v6 _setKeyLineTintColor:v7];
  }
}

- (UIColor)keyLineTintColor
{
  v2 = [(SBSAContainerViewDescriptionMutator *)self _containerViewDescription];
  v3 = [v2 keyLineTintColor];

  return (UIColor *)v3;
}

- (void)setRenderingConfiguration:(SBSystemApertureContainerRenderingConfiguration *)a3
{
  id v4 = [(SBSAContainerViewDescriptionMutator *)self _containerViewDescription];
  SBSystemApertureContainerRenderingConfiguration v5 = *a3;
  [v4 _setRenderingConfiguration:&v5];
}

- (id)_containerViewDescription
{
  v2 = [(SBSAViewDescriptionMutator *)self viewDescription];
  uint64_t v3 = objc_opt_class();
  id v4 = v2;
  if (v3)
  {
    if (objc_opt_isKindOfClass()) {
      SBSystemApertureContainerRenderingConfiguration v5 = v4;
    }
    else {
      SBSystemApertureContainerRenderingConfiguration v5 = 0;
    }
  }
  else
  {
    SBSystemApertureContainerRenderingConfiguration v5 = 0;
  }
  id v6 = v5;

  return v6;
}

- (void)setAssociatedSystemApertureElementIdentity:(id)a3
{
  id v11 = a3;
  id v4 = [(SBSAContainerViewDescriptionMutator *)self associatedSystemApertureElementIdentity];
  char v5 = BSEqualObjects();

  if ((v5 & 1) == 0)
  {
    id v6 = [(SBSAContainerViewDescriptionMutator *)self _containerViewDescription];
    if (v11)
    {
      id v7 = [SBSAElementIdentification alloc];
      v8 = [v11 clientIdentifier];
      v9 = [v11 elementIdentifier];
      v10 = [(SBSAElementIdentification *)v7 initWithClientIdentifier:v8 elementIdentifier:v9];
      [v6 _setAssociatedSystemApertureElementIdentity:v10];
    }
    else
    {
      [v6 _setAssociatedSystemApertureElementIdentity:0];
    }
  }
}

- (SAElementIdentifying)associatedSystemApertureElementIdentity
{
  v2 = [(SBSAContainerViewDescriptionMutator *)self _containerViewDescription];
  uint64_t v3 = [v2 associatedSystemApertureElementIdentity];

  return (SAElementIdentifying *)v3;
}

- (void)setContentScale:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  id v5 = [(SBSAContainerViewDescriptionMutator *)self _containerViewDescription];
  objc_msgSend(v5, "_setContentScale:", width, height);
}

- (CGSize)contentScale
{
  v2 = [(SBSAContainerViewDescriptionMutator *)self _containerViewDescription];
  [v2 contentScale];
  double v4 = v3;
  double v6 = v5;

  double v7 = v4;
  double v8 = v6;
  result.double height = v8;
  result.double width = v7;
  return result;
}

- (CGRect)contentBounds
{
  v2 = [(SBSAContainerViewDescriptionMutator *)self _containerViewDescription];
  [v2 contentBounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;

  double v11 = v4;
  double v12 = v6;
  double v13 = v8;
  double v14 = v10;
  result.size.double height = v14;
  result.size.double width = v13;
  result.origin.double y = v12;
  result.origin.double x = v11;
  return result;
}

- (CGPoint)contentCenter
{
  v2 = [(SBSAContainerViewDescriptionMutator *)self _containerViewDescription];
  [v2 contentCenter];
  double v4 = v3;
  double v6 = v5;

  double v7 = v4;
  double v8 = v6;
  result.double y = v8;
  result.double x = v7;
  return result;
}

- (int64_t)keyLineMode
{
  v2 = [(SBSAContainerViewDescriptionMutator *)self _containerViewDescription];
  int64_t v3 = [v2 keyLineMode];

  return v3;
}

- (int64_t)sampledBackgroundLuminanceLevel
{
  v2 = [(SBSAContainerViewDescriptionMutator *)self _containerViewDescription];
  int64_t v3 = [v2 sampledBackgroundLuminanceLevel];

  return v3;
}

- (int64_t)shadowStyle
{
  v2 = [(SBSAContainerViewDescriptionMutator *)self _containerViewDescription];
  int64_t v3 = [v2 shadowStyle];

  return v3;
}

- (SBSystemApertureContainerRenderingConfiguration)renderingConfiguration
{
  double v4 = [(SBSAContainerViewDescriptionMutator *)self _containerViewDescription];
  if (v4)
  {
    double v6 = v4;
    [v4 renderingConfiguration];
    double v4 = v6;
  }
  else
  {
    retstr->renderingStyle = 0;
    retstr->cloningStyle = 0;
    *(void *)&retstr->alwaysRenderInSnapshots = 0;
  }

  return result;
}

@end