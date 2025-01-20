@interface MFReadTriageInteraction
- (BOOL)overrideFlagStateForTriageAction:(id)a3;
- (BOOL)shouldOverrideFlageStateForTriageAction:(id)a3;
- (id)_iconImageName;
- (id)_previewImageName;
- (id)accessibilityIdentifer;
- (id)color;
- (id)shortTitle;
- (id)title;
- (id)triageAction;
- (id)undoTitle;
- (void)setTriageAction:(id)a3;
@end

@implementation MFReadTriageInteraction

- (id)triageAction
{
  if (!self->_triageAction)
  {
    v3 = [(MFTriageInteraction *)self query];

    id v4 = objc_alloc((Class)MSReadTriageAction);
    if (v3)
    {
      v5 = [(MFTriageInteraction *)self query];
      v6 = [v4 initWithQuery:v5 origin:[self origin] actor:[self actor] delegate:self reason:[self reason]];
    }
    else
    {
      v5 = [(MFTriageInteraction *)self messageListItemSelection];
      v6 = [v4 initWithMessageListSelection:v5 origin:[self origin] actor:[self actor] delegate:self reason:[self reason]];
    }
    triageAction = self->_triageAction;
    self->_triageAction = v6;
  }
  v8 = self->_triageAction;

  return v8;
}

- (id)title
{
  unsigned int v3 = [(MFFlagChangeTriageInteraction *)self flagState];
  uint64_t v4 = [(MFTriageInteraction *)self messageCount];
  if (v4 >= 2 && [(MFTriageInteraction *)self titleIncludesAllMessages])
  {
    v9 = _EFLocalizedString();
  }
  else if ([(MFTriageInteraction *)self isSelectAll] {
         || ![(MFTriageInteraction *)self titleIncludesCount]
  }
         || v4 == 1)
  {
    v7 = +[NSBundle mainBundle];
    v8 = v7;
    if (v3) {
      [v7 localizedStringForKey:@"MARK_EMAIL_UNREAD" value:&stru_100619928 table:@"Main"];
    }
    else {
    v9 = [v7 localizedStringForKey:@"MARK_EMAIL_READ" value:&stru_100619928 table:@"Main"];
    }
  }
  else
  {
    v5 = +[NSBundle mainBundle];
    v6 = v5;
    if (v3) {
      [v5 localizedStringForKey:@"MARK_EMAIL_UNREAD%1$lu" value:&stru_100619928 table:@"Main"];
    }
    else {
    v10 = [v5 localizedStringForKey:@"MARK_EMAIL_READ%1$lu" value:&stru_100619928 table:@"Main"];
    }

    v9 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v10, v4);
  }

  return v9;
}

- (id)accessibilityIdentifer
{
  return MSAccessibilityIdentifierActionsViewControllerMarkAsUnread;
}

- (id)shortTitle
{
  unsigned int v2 = [(MFFlagChangeTriageInteraction *)self flagState];
  unsigned int v3 = +[NSBundle mainBundle];
  uint64_t v4 = v3;
  if (v2) {
    [v3 localizedStringForKey:@"SWIPE_MARK_AS_UNREAD" value:&stru_100619928 table:@"Main"];
  }
  else {
  v5 = [v3 localizedStringForKey:@"SWIPE_MARK_AS_READ" value:&stru_100619928 table:@"Main"];
  }

  return v5;
}

- (id)undoTitle
{
  unsigned int v2 = [(MFFlagChangeTriageInteraction *)self flagState];
  unsigned int v3 = +[NSBundle mainBundle];
  uint64_t v4 = v3;
  if (v2) {
    [v3 localizedStringForKey:@"OPERATION_UNREAD_DESC" value:&stru_100619928 table:@"Main"];
  }
  else {
  v5 = [v3 localizedStringForKey:@"OPERATION_READ_DESC" value:&stru_100619928 table:@"Main"];
  }

  return v5;
}

- (id)color
{
  return +[UIColor mailInteractiveColor];
}

- (id)_iconImageName
{
  unsigned int v2 = [(MFFlagChangeTriageInteraction *)self flagState];
  unsigned int v3 = (void **)&MFImageGlyphUnread;
  if (!v2) {
    unsigned int v3 = (void **)&MFImageGlyphRead;
  }
  uint64_t v4 = *v3;

  return v4;
}

- (id)_previewImageName
{
  unsigned int v2 = [(MFFlagChangeTriageInteraction *)self flagState];
  unsigned int v3 = (void **)&MFImageGlyphUnread;
  if (!v2) {
    unsigned int v3 = (void **)&MFImageGlyphRead;
  }
  uint64_t v4 = *v3;

  return v4;
}

- (BOOL)shouldOverrideFlageStateForTriageAction:(id)a3
{
  if ([(MFTriageInteraction *)self shouldOverrideFlagState])
  {
    uint64_t v4 = [(MFTriageInteraction *)self delegate];
    char v5 = objc_opt_respondsToSelector();
  }
  else
  {
    char v5 = 0;
  }
  return v5 & 1;
}

- (BOOL)overrideFlagStateForTriageAction:(id)a3
{
  if (![(MFTriageInteraction *)self shouldOverrideFlagState]) {
    return 0;
  }
  uint64_t v4 = [(MFTriageInteraction *)self delegate];
  if (objc_opt_respondsToSelector()) {
    unsigned __int8 v5 = [v4 flagStateForFlagChangeTriageInteraction:self];
  }
  else {
    unsigned __int8 v5 = 0;
  }

  return v5;
}

- (void)setTriageAction:(id)a3
{
}

- (void).cxx_destruct
{
}

@end