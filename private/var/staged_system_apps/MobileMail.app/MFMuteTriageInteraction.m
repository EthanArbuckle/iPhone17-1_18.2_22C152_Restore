@interface MFMuteTriageInteraction
- (BOOL)flagState;
- (BOOL)isPermitted;
- (id)_iconImageName;
- (id)_previewImageName;
- (id)accessibilityIdentifer;
- (id)title;
- (id)triageAction;
- (void)setTriageAction:(id)a3;
@end

@implementation MFMuteTriageInteraction

- (id)triageAction
{
  triageAction = self->_triageAction;
  if (!triageAction)
  {
    id v4 = objc_alloc((Class)MSMuteTriageAction);
    v5 = [(MFTriageInteraction *)self messageListItemSelection];
    v6 = [v4 initWithMessageListSelection:v5 origin:[self origin] actor:[self actor] delegate:0 reason:[self reason]];
    v7 = self->_triageAction;
    self->_triageAction = v6;

    triageAction = self->_triageAction;
  }

  return triageAction;
}

- (BOOL)flagState
{
  v2 = [(MFConversationFlagTriageInteraction *)self referenceMessage];
  BOOL v3 = [v2 conversationNotificationLevel] == (id)1;

  return v3;
}

- (BOOL)isPermitted
{
  BOOL v3 = [(MFConversationFlagTriageInteraction *)self referenceMessage];
  id v4 = [v3 conversationNotificationLevel];

  if (v4 == (id)2)
  {
    LOBYTE(v5) = 0;
  }
  else
  {
    v6 = [(MFTriageInteraction *)self messageListItemSelection];
    unsigned int v5 = [v6 isActingOnSender] ^ 1;
  }
  return v5;
}

- (id)title
{
  unsigned int v2 = [(MFMuteTriageInteraction *)self flagState];
  BOOL v3 = +[NSBundle mainBundle];
  id v4 = v3;
  if (v2) {
    [v3 localizedStringForKey:@"UNMUTE" value:&stru_100619928 table:@"Main"];
  }
  else {
  unsigned int v5 = [v3 localizedStringForKey:@"MUTE" value:&stru_100619928 table:@"Main"];
  }

  return v5;
}

- (id)accessibilityIdentifer
{
  return MSAccessibilityIdentifierActionsViewControllerMute;
}

- (id)_iconImageName
{
  unsigned int v2 = [(MFMuteTriageInteraction *)self flagState];
  BOOL v3 = (void **)&MFImageGlyphMute;
  if (!v2) {
    BOOL v3 = (void **)&MFImageGlyphUnMute;
  }
  id v4 = *v3;

  return v4;
}

- (id)_previewImageName
{
  unsigned int v2 = [(MFMuteTriageInteraction *)self flagState];
  BOOL v3 = (void **)&MFImageGlyphMute;
  if (!v2) {
    BOOL v3 = (void **)&MFImageGlyphUnMute;
  }
  id v4 = *v3;

  return v4;
}

- (void)setTriageAction:(id)a3
{
}

- (void).cxx_destruct
{
}

@end