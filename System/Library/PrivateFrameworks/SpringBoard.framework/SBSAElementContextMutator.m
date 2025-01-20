@interface SBSAElementContextMutator
- (CGRect)preferredLeadingBounds;
- (CGRect)preferredMinimalBounds;
- (CGRect)preferredTrailingBounds;
- (NSDirectionalEdgeInsets)preferredEdgeOutsets;
- (NSString)clientIdentifier;
- (NSString)elementIdentifier;
- (SBSAElementContext)systemApertureElementContext;
- (SBSAElementContextMutator)initWithSystemApertureElementContext:(id)a3;
- (UIColor)keyColor;
- (id)description;
- (int64_t)activeDynamicAnimation;
- (int64_t)interfaceOrientation;
- (int64_t)layoutMode;
- (int64_t)systemApertureCustomLayout;
- (int64_t)systemApertureCustomLayoutCustomAnimationStyle;
- (int64_t)systemApertureLayoutCustomizingOptions;
- (void)setActiveDynamicAnimation:(int64_t)a3;
- (void)setClientIdentifier:(id)a3;
- (void)setElementIdentifier:(id)a3;
- (void)setInterfaceOrientation:(int64_t)a3;
- (void)setKeyColor:(id)a3;
- (void)setLayoutMode:(int64_t)a3;
- (void)setPreferredEdgeOutsets:(NSDirectionalEdgeInsets)a3;
- (void)setPreferredLeadingBounds:(CGRect)a3;
- (void)setPreferredMinimalBounds:(CGRect)a3;
- (void)setPreferredTrailingBounds:(CGRect)a3;
- (void)setSystemApertureCustomLayout:(int64_t)a3;
- (void)setSystemApertureCustomLayoutCustomAnimationStyle:(int64_t)a3;
- (void)setSystemApertureLayoutCustomizingOptions:(int64_t)a3;
@end

@implementation SBSAElementContextMutator

- (SBSAElementContextMutator)initWithSystemApertureElementContext:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SBSAElementContextMutator;
  v6 = [(SBSAElementContextMutator *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_systemApertureElementContext, a3);
  }

  return v7;
}

- (NSString)clientIdentifier
{
  return [(SBSAElementContext *)self->_systemApertureElementContext clientIdentifier];
}

- (void)setClientIdentifier:(id)a3
{
}

- (NSString)elementIdentifier
{
  return [(SBSAElementContext *)self->_systemApertureElementContext elementIdentifier];
}

- (void)setElementIdentifier:(id)a3
{
}

- (int64_t)layoutMode
{
  return [(SBSAElementContext *)self->_systemApertureElementContext layoutMode];
}

- (void)setLayoutMode:(int64_t)a3
{
}

- (NSDirectionalEdgeInsets)preferredEdgeOutsets
{
  [(SBSAElementContext *)self->_systemApertureElementContext preferredEdgeOutsets];
  result.trailing = v5;
  result.bottom = v4;
  result.leading = v3;
  result.top = v2;
  return result;
}

- (void)setPreferredEdgeOutsets:(NSDirectionalEdgeInsets)a3
{
}

- (int64_t)interfaceOrientation
{
  return [(SBSAElementContext *)self->_systemApertureElementContext interfaceOrientation];
}

- (void)setInterfaceOrientation:(int64_t)a3
{
}

- (int64_t)systemApertureCustomLayout
{
  return [(SBSAElementContext *)self->_systemApertureElementContext systemApertureCustomLayout];
}

- (void)setSystemApertureCustomLayout:(int64_t)a3
{
}

- (int64_t)systemApertureCustomLayoutCustomAnimationStyle
{
  return [(SBSAElementContext *)self->_systemApertureElementContext systemApertureCustomLayoutCustomAnimationStyle];
}

- (void)setSystemApertureCustomLayoutCustomAnimationStyle:(int64_t)a3
{
}

- (int64_t)systemApertureLayoutCustomizingOptions
{
  return [(SBSAElementContext *)self->_systemApertureElementContext systemApertureLayoutCustomizingOptions];
}

- (void)setSystemApertureLayoutCustomizingOptions:(int64_t)a3
{
}

- (int64_t)activeDynamicAnimation
{
  return [(SBSAElementContext *)self->_systemApertureElementContext activeDynamicAnimation];
}

- (void)setActiveDynamicAnimation:(int64_t)a3
{
}

- (UIColor)keyColor
{
  return [(SBSAElementContext *)self->_systemApertureElementContext keyColor];
}

- (void)setKeyColor:(id)a3
{
  id v6 = a3;
  double v4 = [(SBSAElementContext *)self->_systemApertureElementContext keyColor];
  char v5 = BSEqualObjects();

  if ((v5 & 1) == 0) {
    [(SBSAElementContext *)self->_systemApertureElementContext _setKeyColor:v6];
  }
}

- (CGRect)preferredLeadingBounds
{
  [(SBSAElementContext *)self->_systemApertureElementContext preferredLeadingBounds];
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void)setPreferredLeadingBounds:(CGRect)a3
{
}

- (CGRect)preferredTrailingBounds
{
  [(SBSAElementContext *)self->_systemApertureElementContext preferredTrailingBounds];
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void)setPreferredTrailingBounds:(CGRect)a3
{
}

- (CGRect)preferredMinimalBounds
{
  [(SBSAElementContext *)self->_systemApertureElementContext preferredMinimalBounds];
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void)setPreferredMinimalBounds:(CGRect)a3
{
}

- (id)description
{
  return (id)objc_msgSend(NSString, "stringWithFormat:", @"<%@: %p; systemApertureElementContext: %@>",
               objc_opt_class(),
               self,
               self->_systemApertureElementContext);
}

- (SBSAElementContext)systemApertureElementContext
{
  return self->_systemApertureElementContext;
}

- (void).cxx_destruct
{
}

@end