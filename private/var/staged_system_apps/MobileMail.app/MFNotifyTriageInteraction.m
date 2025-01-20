@interface MFNotifyTriageInteraction
- (BOOL)flagState;
- (BOOL)isPermitted;
- (id)_iconImageName;
- (id)_previewImageName;
- (id)accessibilityIdentifer;
- (id)title;
- (id)triageAction;
- (void)setTriageAction:(id)a3;
@end

@implementation MFNotifyTriageInteraction

- (id)triageAction
{
  triageAction = self->_triageAction;
  if (!triageAction)
  {
    id v4 = objc_alloc((Class)MSNotifyTriageAction);
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
  BOOL v3 = [v2 conversationNotificationLevel] == (id)2;

  return v3;
}

- (BOOL)isPermitted
{
  BOOL v3 = [(MFConversationFlagTriageInteraction *)self referenceMessage];
  id v4 = [v3 conversationNotificationLevel];

  if (v4 == (id)1)
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
  unsigned int v2 = [(MFNotifyTriageInteraction *)self flagState];
  BOOL v3 = +[NSBundle mainBundle];
  id v4 = v3;
  if (v2) {
    [v3 localizedStringForKey:@"NOTIFY_ME_STOP" value:&stru_100619928 table:@"Main"];
  }
  else {
  unsigned int v5 = [v3 localizedStringForKey:@"NOTIFY_ME" value:&stru_100619928 table:@"Main"];
  }

  return v5;
}

- (id)accessibilityIdentifer
{
  return MSAccessibilityIdentifierActionsViewControllerNotifyMe;
}

- (id)_iconImageName
{
  unsigned int v2 = [(MFNotifyTriageInteraction *)self flagState];
  BOOL v3 = (void **)&MFImageGlyphStopNotify;
  if (!v2) {
    BOOL v3 = (void **)&MFImageGlyphNotify;
  }
  id v4 = *v3;

  return v4;
}

- (id)_previewImageName
{
  unsigned int v2 = [(MFNotifyTriageInteraction *)self flagState];
  BOOL v3 = (void **)&MFImageGlyphStopNotify;
  if (!v2) {
    BOOL v3 = (void **)&MFImageGlyphNotify;
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