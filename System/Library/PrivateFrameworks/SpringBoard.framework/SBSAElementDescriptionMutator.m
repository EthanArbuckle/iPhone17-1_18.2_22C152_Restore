@interface SBSAElementDescriptionMutator
- (CGAffineTransform)leadingViewTransform;
- (CGAffineTransform)minimalViewTransform;
- (CGAffineTransform)trailingViewTransform;
- (CGSize)leadingViewScale;
- (CGSize)minimalViewScale;
- (CGSize)trailingViewScale;
- (NSString)description;
- (NSString)snapshotReason;
- (NSUUID)interfaceElementIdentifier;
- (SAElementIdentifying)associatedSystemApertureElementIdentity;
- (SBSAElementDescriptionMutator)initWithElementDescription:(id)a3;
- (double)customContentAlpha;
- (double)customContentBlurProgress;
- (double)leadingViewAlpha;
- (double)leadingViewBlurProgress;
- (double)leadingViewSquishProgress;
- (double)minimalViewAlpha;
- (double)minimalViewBlurProgress;
- (double)minimalViewSquishProgress;
- (double)sensorObscuringShadowProgress;
- (double)snapshotViewAlpha;
- (double)snapshotViewBlurProgress;
- (double)trailingViewAlpha;
- (double)trailingViewBlurProgress;
- (double)trailingViewSquishProgress;
- (int)appearState;
- (void)setAppearState:(int)a3;
- (void)setAssociatedSystemApertureElementIdentity:(id)a3;
- (void)setCustomContentAlpha:(double)a3;
- (void)setCustomContentBlurProgress:(double)a3;
- (void)setInterfaceElementIdentifier:(id)a3;
- (void)setLeadingViewAlpha:(double)a3;
- (void)setLeadingViewBlurProgress:(double)a3;
- (void)setLeadingViewScale:(CGSize)a3;
- (void)setLeadingViewSquishProgress:(double)a3;
- (void)setLeadingViewTransform:(CGAffineTransform *)a3;
- (void)setMinimalViewAlpha:(double)a3;
- (void)setMinimalViewBlurProgress:(double)a3;
- (void)setMinimalViewScale:(CGSize)a3;
- (void)setMinimalViewSquishProgress:(double)a3;
- (void)setMinimalViewTransform:(CGAffineTransform *)a3;
- (void)setSensorObscuringShadowProgress:(double)a3;
- (void)setSnapshotReason:(id)a3;
- (void)setSnapshotViewAlpha:(double)a3;
- (void)setSnapshotViewBlurProgress:(double)a3;
- (void)setTrailingViewAlpha:(double)a3;
- (void)setTrailingViewBlurProgress:(double)a3;
- (void)setTrailingViewScale:(CGSize)a3;
- (void)setTrailingViewSquishProgress:(double)a3;
- (void)setTrailingViewTransform:(CGAffineTransform *)a3;
@end

@implementation SBSAElementDescriptionMutator

- (SBSAElementDescriptionMutator)initWithElementDescription:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SBSAElementDescriptionMutator;
  v6 = [(SBSAElementDescriptionMutator *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_elementDescription, a3);
  }

  return v7;
}

- (NSUUID)interfaceElementIdentifier
{
  return [(SBSAElementDescription *)self->_elementDescription interfaceElementIdentifier];
}

- (void)setInterfaceElementIdentifier:(id)a3
{
}

- (SAElementIdentifying)associatedSystemApertureElementIdentity
{
  return [(SBSAElementDescription *)self->_elementDescription associatedSystemApertureElementIdentity];
}

- (void)setAssociatedSystemApertureElementIdentity:(id)a3
{
  id v11 = a3;
  v4 = [(SBSAElementDescriptionMutator *)self associatedSystemApertureElementIdentity];
  char v5 = BSEqualObjects();

  if ((v5 & 1) == 0)
  {
    elementDescription = self->_elementDescription;
    if (v11)
    {
      v7 = [SBSAElementIdentification alloc];
      v8 = [v11 clientIdentifier];
      objc_super v9 = [v11 elementIdentifier];
      v10 = [(SBSAElementIdentification *)v7 initWithClientIdentifier:v8 elementIdentifier:v9];
      [(SBSAElementDescription *)elementDescription _setAssociatedSystemApertureElementIdentity:v10];
    }
    else
    {
      [(SBSAElementDescription *)elementDescription _setAssociatedSystemApertureElementIdentity:0];
    }
  }
}

- (int)appearState
{
  return [(SBSAElementDescription *)self->_elementDescription appearState];
}

- (void)setAppearState:(int)a3
{
}

- (double)sensorObscuringShadowProgress
{
  [(SBSAElementDescription *)self->_elementDescription sensorObscuringShadowProgress];
  return result;
}

- (void)setSensorObscuringShadowProgress:(double)a3
{
}

- (double)leadingViewBlurProgress
{
  [(SBSAElementDescription *)self->_elementDescription leadingViewBlurProgress];
  return result;
}

- (void)setLeadingViewBlurProgress:(double)a3
{
}

- (double)leadingViewAlpha
{
  [(SBSAElementDescription *)self->_elementDescription leadingViewAlpha];
  return result;
}

- (void)setLeadingViewAlpha:(double)a3
{
}

- (double)leadingViewSquishProgress
{
  [(SBSAElementDescription *)self->_elementDescription leadingViewSquishProgress];
  return result;
}

- (void)setLeadingViewSquishProgress:(double)a3
{
}

- (CGSize)leadingViewScale
{
  [(SBSAElementDescription *)self->_elementDescription leadingViewScale];
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)setLeadingViewScale:(CGSize)a3
{
}

- (CGAffineTransform)leadingViewTransform
{
  CGSize result = (CGAffineTransform *)self->_elementDescription;
  if (result) {
    return (CGAffineTransform *)[(CGAffineTransform *)result leadingViewTransform];
  }
  *(_OWORD *)&retstr->c = 0u;
  *(_OWORD *)&retstr->tx = 0u;
  *(_OWORD *)&retstr->a = 0u;
  return result;
}

- (void)setLeadingViewTransform:(CGAffineTransform *)a3
{
  elementDescription = self->_elementDescription;
  long long v4 = *(_OWORD *)&a3->c;
  v5[0] = *(_OWORD *)&a3->a;
  v5[1] = v4;
  v5[2] = *(_OWORD *)&a3->tx;
  [(SBSAElementDescription *)elementDescription _setLeadingViewTransform:v5];
}

- (double)trailingViewBlurProgress
{
  [(SBSAElementDescription *)self->_elementDescription trailingViewBlurProgress];
  return result;
}

- (void)setTrailingViewBlurProgress:(double)a3
{
}

- (double)trailingViewAlpha
{
  [(SBSAElementDescription *)self->_elementDescription trailingViewAlpha];
  return result;
}

- (void)setTrailingViewAlpha:(double)a3
{
}

- (double)trailingViewSquishProgress
{
  [(SBSAElementDescription *)self->_elementDescription trailingViewSquishProgress];
  return result;
}

- (void)setTrailingViewSquishProgress:(double)a3
{
}

- (CGSize)trailingViewScale
{
  [(SBSAElementDescription *)self->_elementDescription trailingViewScale];
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)setTrailingViewScale:(CGSize)a3
{
}

- (CGAffineTransform)trailingViewTransform
{
  CGSize result = (CGAffineTransform *)self->_elementDescription;
  if (result) {
    return (CGAffineTransform *)[(CGAffineTransform *)result trailingViewTransform];
  }
  *(_OWORD *)&retstr->c = 0u;
  *(_OWORD *)&retstr->tx = 0u;
  *(_OWORD *)&retstr->a = 0u;
  return result;
}

- (void)setTrailingViewTransform:(CGAffineTransform *)a3
{
  elementDescription = self->_elementDescription;
  long long v4 = *(_OWORD *)&a3->c;
  v5[0] = *(_OWORD *)&a3->a;
  v5[1] = v4;
  v5[2] = *(_OWORD *)&a3->tx;
  [(SBSAElementDescription *)elementDescription _setTrailingViewTransform:v5];
}

- (double)minimalViewBlurProgress
{
  [(SBSAElementDescription *)self->_elementDescription minimalViewBlurProgress];
  return result;
}

- (void)setMinimalViewBlurProgress:(double)a3
{
}

- (double)minimalViewAlpha
{
  [(SBSAElementDescription *)self->_elementDescription minimalViewAlpha];
  return result;
}

- (void)setMinimalViewAlpha:(double)a3
{
}

- (double)minimalViewSquishProgress
{
  [(SBSAElementDescription *)self->_elementDescription minimalViewSquishProgress];
  return result;
}

- (void)setMinimalViewSquishProgress:(double)a3
{
}

- (CGSize)minimalViewScale
{
  [(SBSAElementDescription *)self->_elementDescription minimalViewScale];
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)setMinimalViewScale:(CGSize)a3
{
}

- (CGAffineTransform)minimalViewTransform
{
  CGSize result = (CGAffineTransform *)self->_elementDescription;
  if (result) {
    return (CGAffineTransform *)[(CGAffineTransform *)result minimalViewTransform];
  }
  *(_OWORD *)&retstr->c = 0u;
  *(_OWORD *)&retstr->tx = 0u;
  *(_OWORD *)&retstr->a = 0u;
  return result;
}

- (void)setMinimalViewTransform:(CGAffineTransform *)a3
{
  elementDescription = self->_elementDescription;
  long long v4 = *(_OWORD *)&a3->c;
  v5[0] = *(_OWORD *)&a3->a;
  v5[1] = v4;
  v5[2] = *(_OWORD *)&a3->tx;
  [(SBSAElementDescription *)elementDescription _setMinimalViewTransform:v5];
}

- (double)customContentBlurProgress
{
  [(SBSAElementDescription *)self->_elementDescription customContentBlurProgress];
  return result;
}

- (void)setCustomContentBlurProgress:(double)a3
{
}

- (double)customContentAlpha
{
  [(SBSAElementDescription *)self->_elementDescription customContentAlpha];
  return result;
}

- (void)setCustomContentAlpha:(double)a3
{
}

- (double)snapshotViewBlurProgress
{
  [(SBSAElementDescription *)self->_elementDescription snapshotViewBlurProgress];
  return result;
}

- (void)setSnapshotViewBlurProgress:(double)a3
{
}

- (double)snapshotViewAlpha
{
  [(SBSAElementDescription *)self->_elementDescription snapshotViewAlpha];
  return result;
}

- (void)setSnapshotViewAlpha:(double)a3
{
}

- (NSString)snapshotReason
{
  return [(SBSAElementDescription *)self->_elementDescription snapshotReason];
}

- (void)setSnapshotReason:(id)a3
{
}

- (NSString)description
{
  return (NSString *)objc_msgSend(NSString, "stringWithFormat:", @"<%@: %p; elementDescription: %@>",
                       objc_opt_class(),
                       self,
                       self->_elementDescription);
}

- (void).cxx_destruct
{
}

@end