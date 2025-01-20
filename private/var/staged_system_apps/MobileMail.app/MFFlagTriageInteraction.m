@interface MFFlagTriageInteraction
+ (id)titleForFlagAction:(BOOL)a3 messageCount:(unint64_t)a4;
+ (unint64_t)defaultColor;
+ (void)setDefaultColor:(unint64_t)a3;
- (BOOL)isPermitted;
- (BOOL)overrideFlagStateForTriageAction:(id)a3;
- (BOOL)shouldOverrideFlageStateForTriageAction:(id)a3;
- (id)_iconImageName;
- (id)_previewImageName;
- (id)_swipeColor;
- (id)cardActionWithCompletion:(id)a3;
- (id)color;
- (id)shortTitle;
- (id)title;
- (id)triageAction;
- (id)undoTitle;
- (unint64_t)defaultFlagColorForTriageAction:(id)a3;
- (void)setTriageAction:(id)a3;
@end

@implementation MFFlagTriageInteraction

+ (unint64_t)defaultColor
{
  v2 = +[NSUserDefaults standardUserDefaults];
  v3 = [v2 objectForKey:@"kDefaultFlagColor"];

  if (v3) {
    unint64_t v4 = (unint64_t)[v3 integerValue];
  }
  else {
    unint64_t v4 = 1;
  }

  return v4;
}

+ (void)setDefaultColor:(unint64_t)a3
{
  id v5 = +[NSUserDefaults standardUserDefaults];
  unint64_t v4 = +[NSNumber numberWithUnsignedInteger:a3];
  [v5 setObject:v4 forKey:@"kDefaultFlagColor"];
}

- (id)triageAction
{
  triageAction = self->_triageAction;
  if (!triageAction)
  {
    id v4 = objc_alloc((Class)MSFlagTriageAction);
    id v5 = [(MFTriageInteraction *)self messageListItemSelection];
    v6 = [v4 initWithMessageListSelection:v5 origin:[self origin] actor:[self actor] delegate:self reason:[self reason]];
    v7 = self->_triageAction;
    self->_triageAction = v6;

    triageAction = self->_triageAction;
  }

  return triageAction;
}

- (id)title
{
  v3 = objc_opt_class();
  unsigned int v4 = [(MFFlagChangeTriageInteraction *)self flagState];
  if ([(MFTriageInteraction *)self isSelectAll]
    || ![(MFTriageInteraction *)self titleIncludesCount])
  {
    int64_t v5 = 1;
  }
  else
  {
    int64_t v5 = [(MFTriageInteraction *)self messageCount];
  }

  return [v3 titleForFlagAction:v4 ^ 1 messageCount:v5];
}

+ (id)titleForFlagAction:(BOOL)a3 messageCount:(unint64_t)a4
{
  BOOL v5 = a3;
  v6 = +[NSBundle mainBundle];
  v7 = v6;
  if (a4 == 1)
  {
    if (v5) {
      [v6 localizedStringForKey:@"MARK_EMAIL_FLAGGED" value:&stru_100619928 table:@"Main"];
    }
    else {
    v8 = [v6 localizedStringForKey:@"MARK_EMAIL_UNFLAGGED" value:&stru_100619928 table:@"Main"];
    }
  }
  else
  {
    if (v5) {
      [v6 localizedStringForKey:@"MARK_EMAIL_FLAGGED%1$lu" value:&stru_100619928 table:@"Main"];
    }
    else {
    uint64_t v9 = [v6 localizedStringForKey:@"MARK_EMAIL_UNFLAGGED%1$lu" value:&stru_100619928 table:@"Main"];
    }

    v8 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v9, a4);
    v7 = (void *)v9;
  }

  return v8;
}

- (id)shortTitle
{
  unsigned int v2 = [(MFFlagChangeTriageInteraction *)self flagState];
  v3 = +[NSBundle mainBundle];
  unsigned int v4 = v3;
  if (v2) {
    [v3 localizedStringForKey:@"SWIPE_UNFLAG" value:&stru_100619928 table:@"Main"];
  }
  else {
  BOOL v5 = [v3 localizedStringForKey:@"SWIPE_FLAG" value:&stru_100619928 table:@"Main"];
  }

  return v5;
}

- (id)undoTitle
{
  unsigned int v2 = [(MFFlagChangeTriageInteraction *)self flagState];
  v3 = +[NSBundle mainBundle];
  unsigned int v4 = v3;
  if (v2) {
    [v3 localizedStringForKey:@"OPERATION_UNFLAG_DESC" value:&stru_100619928 table:@"Main"];
  }
  else {
  BOOL v5 = [v3 localizedStringForKey:@"OPERATION_FLAG_DESC" value:&stru_100619928 table:@"Main"];
  }

  return v5;
}

- (id)color
{
  BOOL v5 = self;
  unsigned int v6 = [(MFFlagChangeTriageInteraction *)self flagState];
  if (v6)
  {
    BOOL v5 = [v5 messageListItemSelection];
    unsigned int v2 = [v5 messageListItems];
    v3 = [v2 firstObject];
    unsigned int v4 = [v3 flagColors];
    id v7 = [v4 firstIndex];
  }
  else
  {
    id v7 = +[MFFlagTriageInteraction defaultColor];
  }
  v8 = +[UIColor mf_colorFromFlagColor:v7];
  if (v6)
  {
  }

  return v8;
}

- (id)_swipeColor
{
  v7.receiver = self;
  v7.super_class = (Class)MFFlagTriageInteraction;
  unsigned int v2 = [(MFTriageInteraction *)&v7 _swipeColor];
  v3 = +[UIColor mailFlaggedColorRed];
  unsigned int v4 = [v2 isEqual:v3];

  if (v4)
  {
    uint64_t v5 = +[UIColor mailFlaggedColorIncreasedContrastRed];

    unsigned int v2 = (void *)v5;
  }

  return v2;
}

- (id)_iconImageName
{
  unsigned int v2 = [(MFFlagChangeTriageInteraction *)self flagState];
  v3 = (void **)&MFImageGlyphUnflag;
  if (!v2) {
    v3 = (void **)&MFImageGlyphFlag;
  }
  unsigned int v4 = *v3;

  return v4;
}

- (id)_previewImageName
{
  unsigned int v2 = [(MFFlagChangeTriageInteraction *)self flagState];
  v3 = (void **)&MFImageGlyphUnflag;
  if (!v2) {
    v3 = (void **)&MFImageGlyphFlag;
  }
  unsigned int v4 = *v3;

  return v4;
}

- (id)cardActionWithCompletion:(id)a3
{
  id v4 = a3;
  unsigned int v5 = [(MFFlagChangeTriageInteraction *)self flagState];
  unsigned int v6 = (id *)&MFImageGlyphUnflag;
  if (!v5) {
    unsigned int v6 = (id *)&MFImageGlyphFlag;
  }
  id v7 = *v6;
  v8 = [(MFTriageInteraction *)self cardTitle];
  v12 = _NSConcreteStackBlock;
  uint64_t v13 = 3221225472;
  v14 = sub_1001990F0;
  v15 = &unk_10060ABB8;
  v16 = self;
  id v9 = v4;
  id v17 = v9;
  v10 = +[MFCardAction cardActionWithTitle:v8 shortTitle:0 imageName:v7 tintColor:0 handler:&v12];

  [v10 setAccessibilityIdentifer:MSAccessibilityIdentifierActionsViewControllerFlag v12, v13, v14, v15, v16];

  return v10;
}

- (BOOL)isPermitted
{
  unsigned int v2 = [(MFTriageInteraction *)self messageListItemSelection];
  char v3 = [v2 isActingOnSender] ^ 1;

  return v3;
}

- (BOOL)shouldOverrideFlageStateForTriageAction:(id)a3
{
  if ([(MFTriageInteraction *)self shouldOverrideFlagState])
  {
    id v4 = [(MFTriageInteraction *)self delegate];
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
  id v4 = [(MFTriageInteraction *)self delegate];
  if (objc_opt_respondsToSelector()) {
    unsigned __int8 v5 = [v4 flagStateForFlagChangeTriageInteraction:self];
  }
  else {
    unsigned __int8 v5 = 0;
  }

  return v5;
}

- (unint64_t)defaultFlagColorForTriageAction:(id)a3
{
  char v3 = objc_opt_class();

  return (unint64_t)[v3 defaultColor];
}

- (void)setTriageAction:(id)a3
{
}

- (void).cxx_destruct
{
}

@end