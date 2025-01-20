@interface MFJunkTriageInteraction
- (BOOL)flagState;
- (BOOL)needShrinkAnimationAfterCompletion;
- (id)_iconImageName;
- (id)_previewImageName;
- (id)accessibilityIdentifer;
- (id)cardTitle;
- (id)color;
- (id)shortTitle;
- (id)title;
- (id)triageAction;
- (id)undoTitle;
- (void)setTriageAction:(id)a3;
@end

@implementation MFJunkTriageInteraction

- (id)triageAction
{
  triageAction = self->_triageAction;
  if (!triageAction)
  {
    id v4 = objc_alloc((Class)MSJunkTriageAction);
    v5 = [(MFTriageInteraction *)self messageListItemSelection];
    v6 = [v4 initWithMessageListSelection:v5 origin:[self origin] actor:[self actor] delegate:self];
    v7 = self->_triageAction;
    self->_triageAction = v6;

    triageAction = self->_triageAction;
  }

  return triageAction;
}

- (BOOL)flagState
{
  v2 = [(MFJunkTriageInteraction *)self triageAction];
  char v3 = [v2 hasNonJunkMessages] ^ 1;

  return v3;
}

- (id)title
{
  unsigned int v2 = [(MFJunkTriageInteraction *)self flagState];
  char v3 = +[NSBundle mainBundle];
  id v4 = v3;
  if (v2) {
    [v3 localizedStringForKey:@"MARK_EMAIL_NOT_JUNK" value:&stru_100619928 table:@"Main"];
  }
  else {
  v5 = [v3 localizedStringForKey:@"MARK_EMAIL_JUNK" value:&stru_100619928 table:@"Main"];
  }

  return v5;
}

- (id)accessibilityIdentifer
{
  return MSAccessibilityIdentifierActionsViewControllerMoveToJunk;
}

- (id)shortTitle
{
  unsigned int v2 = [(MFJunkTriageInteraction *)self flagState];
  char v3 = +[NSBundle mainBundle];
  id v4 = v3;
  if (v2) {
    [v3 localizedStringForKey:@"SWIPE_NOT_JUNK" value:&stru_100619928 table:@"Main"];
  }
  else {
  v5 = [v3 localizedStringForKey:@"SWIPE_JUNK" value:&stru_100619928 table:@"Main"];
  }

  return v5;
}

- (id)undoTitle
{
  unsigned int v2 = [(MFJunkTriageInteraction *)self flagState];
  char v3 = +[NSBundle mainBundle];
  id v4 = v3;
  if (v2) {
    [v3 localizedStringForKey:@"OPERATION_NOT_JUNK_DESC" value:&stru_100619928 table:@"Main"];
  }
  else {
  v5 = [v3 localizedStringForKey:@"OPERATION_JUNK_DESC" value:&stru_100619928 table:@"Main"];
  }

  return v5;
}

- (id)cardTitle
{
  uint64_t v3 = [(MFTriageInteraction *)self messageCount];
  if (v3 >= 2 && (uint64_t v4 = v3, [(MFTriageInteraction *)self titleIncludesCount]))
  {
    unsigned int v5 = [(MFJunkTriageInteraction *)self flagState];
    v6 = +[NSBundle mainBundle];
    v7 = v6;
    if (v5) {
      [v6 localizedStringForKey:@"MARK_NOT_JUNK_FORMAT%1$ld" value:&stru_100619928 table:@"Main"];
    }
    else {
    v10 = [v6 localizedStringForKey:@"MARK_JUNK_FORMAT%1$ld" value:&stru_100619928 table:@"Main"];
    }

    uint64_t v11 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v10, v4);
  }
  else
  {
    unsigned int v8 = [(MFJunkTriageInteraction *)self flagState];
    v9 = +[NSBundle mainBundle];
    v10 = v9;
    if (v8) {
      [v9 localizedStringForKey:@"MARK_EMAIL_NOT_JUNK" value:&stru_100619928 table:@"Main"];
    }
    else {
    uint64_t v11 = [v9 localizedStringForKey:@"MARK_EMAIL_JUNK" value:&stru_100619928 table:@"Main"];
    }
  }
  v12 = (void *)v11;

  return v12;
}

- (id)color
{
  return +[UIColor mailFlaggedColor];
}

- (id)_iconImageName
{
  return MFImageGlyphJunk;
}

- (id)_previewImageName
{
  return MFImageGlyphJunk;
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