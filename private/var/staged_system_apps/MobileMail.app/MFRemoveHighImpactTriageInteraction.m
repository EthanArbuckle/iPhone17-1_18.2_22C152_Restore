@interface MFRemoveHighImpactTriageInteraction
- (BOOL)isDestructive;
- (BOOL)needShrinkAnimationAfterCompletion;
- (id)_iconImageName;
- (id)_previewImageName;
- (id)color;
- (id)shortTitle;
- (id)title;
- (id)triageAction;
- (void)setTriageAction:(id)a3;
@end

@implementation MFRemoveHighImpactTriageInteraction

- (id)triageAction
{
  triageAction = self->_triageAction;
  if (!triageAction)
  {
    id v4 = objc_alloc((Class)MSRemoveHighImpactTriageAction);
    v5 = [(MFTriageInteraction *)self messageListItemSelection];
    v6 = [v4 initWithMessageListSelection:v5 origin:[self origin] actor:[self actor] delegate:0 highImpactChange:0];
    v7 = self->_triageAction;
    self->_triageAction = v6;

    triageAction = self->_triageAction;
  }

  return triageAction;
}

- (id)shortTitle
{
  return (id)_EFLocalizedString();
}

- (id)title
{
  return (id)_EFLocalizedString();
}

- (id)color
{
  return +[UIColor mailRemoveTimeSensitiveColor];
}

- (id)_iconImageName
{
  return MFImageGlyphRemoveHighImpact;
}

- (id)_previewImageName
{
  return MFImageGlyphRemoveHighImpact;
}

- (BOOL)isDestructive
{
  return 1;
}

- (BOOL)needShrinkAnimationAfterCompletion
{
  return 1;
}

- (void)setTriageAction:(id)a3
{
}

- (void).cxx_destruct
{
}

@end