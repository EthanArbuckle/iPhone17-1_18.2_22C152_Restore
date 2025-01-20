@interface SBSABackgroundBlurDescriptionMutator
- (BOOL)isBlurHidden;
- (CGRect)blurFrame;
- (SBSABackgroundBlurDescription)backgroundBlurDescription;
- (SBSABackgroundBlurDescriptionMutator)initWithBackgroundBlurDescription:(id)a3;
- (id)description;
- (void)setBlurFrame:(CGRect)a3;
- (void)setBlurHidden:(BOOL)a3;
@end

@implementation SBSABackgroundBlurDescriptionMutator

- (void).cxx_destruct
{
}

- (SBSABackgroundBlurDescriptionMutator)initWithBackgroundBlurDescription:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SBSABackgroundBlurDescriptionMutator;
  v6 = [(SBSABackgroundBlurDescriptionMutator *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_backgroundBlurDescription, a3);
  }

  return v7;
}

- (void)setBlurHidden:(BOOL)a3
{
}

- (void)setBlurFrame:(CGRect)a3
{
}

- (BOOL)isBlurHidden
{
  return [(SBSABackgroundBlurDescription *)self->_backgroundBlurDescription isBlurHidden];
}

- (CGRect)blurFrame
{
  [(SBSABackgroundBlurDescription *)self->_backgroundBlurDescription blurFrame];
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (id)description
{
  return (id)objc_msgSend(NSString, "stringWithFormat:", @"<%@: %p; backgroundBlurDescription: %@>",
               objc_opt_class(),
               self,
               self->_backgroundBlurDescription);
}

- (SBSABackgroundBlurDescription)backgroundBlurDescription
{
  return self->_backgroundBlurDescription;
}

@end