@interface SBSAViewDescriptionMutator
- (CGPoint)center;
- (CGRect)bounds;
- (CGRect)boundsVelocity;
- (CGSize)scale;
- (NSUUID)interfaceElementIdentifier;
- (SBSAViewDescriptionMutator)initWithViewDescription:(id)a3;
- (double)alpha;
- (double)cornerRadius;
- (id)description;
- (id)viewDescription;
- (void)setAlpha:(double)a3;
- (void)setBounds:(CGRect)a3;
- (void)setBoundsVelocity:(CGRect)a3;
- (void)setCenter:(CGPoint)a3;
- (void)setCornerRadius:(double)a3;
- (void)setInterfaceElementIdentifier:(id)a3;
- (void)setScale:(CGSize)a3;
@end

@implementation SBSAViewDescriptionMutator

- (void).cxx_destruct
{
}

- (SBSAViewDescriptionMutator)initWithViewDescription:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SBSAViewDescriptionMutator;
  v6 = [(SBSAViewDescriptionMutator *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_viewDescription, a3);
  }

  return v7;
}

- (void)setCornerRadius:(double)a3
{
}

- (void)setAlpha:(double)a3
{
}

- (void)setInterfaceElementIdentifier:(id)a3
{
}

- (void)setCenter:(CGPoint)a3
{
}

- (void)setBounds:(CGRect)a3
{
}

- (id)viewDescription
{
  return self->_viewDescription;
}

- (void)setScale:(CGSize)a3
{
}

- (void)setBoundsVelocity:(CGRect)a3
{
}

- (NSUUID)interfaceElementIdentifier
{
  return [(SBSAViewDescription *)self->_viewDescription interfaceElementIdentifier];
}

- (CGPoint)center
{
  [(SBSAViewDescription *)self->_viewDescription center];
  result.y = v3;
  result.x = v2;
  return result;
}

- (CGRect)bounds
{
  [(SBSAViewDescription *)self->_viewDescription bounds];
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (double)cornerRadius
{
  [(SBSAViewDescription *)self->_viewDescription cornerRadius];
  return result;
}

- (double)alpha
{
  [(SBSAViewDescription *)self->_viewDescription alpha];
  return result;
}

- (CGSize)scale
{
  [(SBSAViewDescription *)self->_viewDescription scale];
  result.height = v3;
  result.width = v2;
  return result;
}

- (CGRect)boundsVelocity
{
  [(SBSAViewDescription *)self->_viewDescription boundsVelocity];
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (id)description
{
  return (id)objc_msgSend(NSString, "stringWithFormat:", @"<%@: %p; interfaceElementDescription: %@>",
               objc_opt_class(),
               self,
               self->_viewDescription);
}

@end