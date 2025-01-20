@interface MFRemoveFollowUpTriageInteraction
- (BOOL)isDestructive;
- (BOOL)isPermitted;
- (BOOL)needShrinkAnimationAfterCompletion;
- (id)_iconImageName;
- (id)_previewImageName;
- (id)color;
- (id)shortTitle;
- (id)title;
- (id)triageAction;
- (void)setTriageAction:(id)a3;
@end

@implementation MFRemoveFollowUpTriageInteraction

- (id)triageAction
{
  triageAction = self->_triageAction;
  if (!triageAction)
  {
    id v4 = objc_alloc((Class)MSRemoveFollowUpTriageAction);
    v5 = [(MFTriageInteraction *)self messageListItemSelection];
    v6 = [v4 initWithMessageListSelection:v5 origin:[self origin] actor:[self actor] delegate:0 followUp:0];
    v7 = self->_triageAction;
    self->_triageAction = v6;

    triageAction = self->_triageAction;
  }

  return triageAction;
}

- (BOOL)isPermitted
{
  v2 = [(MFTriageInteraction *)self messageListItemSelection];
  v3 = [v2 messageListItems];
  unsigned __int8 v4 = [v3 ef_any:&stru_10060CD30];

  return v4;
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
  return +[UIColor mailRemoveFollowUpColor];
}

- (id)_iconImageName
{
  return MFImageGlyphRemoveFollowUp;
}

- (id)_previewImageName
{
  return MFImageGlyphRemoveFollowUp;
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