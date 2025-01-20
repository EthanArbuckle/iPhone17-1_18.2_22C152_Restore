@interface MFDeleteTriageInteraction
+ (unint64_t)deleteOrArchive;
- (BOOL)_movesToTrash;
- (BOOL)_requiresConfirmationPrompt;
- (BOOL)isDestructive;
- (BOOL)needShrinkAnimationAfterCompletion;
- (id)_iconImageName;
- (id)_previewImageName;
- (id)_swipeColor;
- (id)accessibilityIdentifer;
- (id)color;
- (id)shortTitle;
- (id)swipeTitle;
- (id)title;
- (id)undoTitle;
- (int64_t)_preferredAlertActionStyle;
@end

@implementation MFDeleteTriageInteraction

+ (unint64_t)deleteOrArchive
{
  return 1;
}

- (BOOL)_requiresConfirmationPrompt
{
  if ((id)[(MFDestructiveTriageInteraction *)self type] == (id)2) {
    return 1;
  }
  v3 = +[NSUserDefaults em_userDefaults];
  unsigned __int8 v4 = [v3 BOOLForKey:ShowMessageDeleteConfirmationKey];

  if (v4) {
    return 1;
  }
  v6 = [(MFTriageInteraction *)self messageListItemSelection];
  v7 = [v6 messageListItems];
  BOOL v5 = [(unint64_t)[v7 em_messageListItemTotalCount] > 1];

  return v5;
}

- (int64_t)_preferredAlertActionStyle
{
  return 2;
}

- (BOOL)_movesToTrash
{
  v2 = [(MFTriageInteraction *)self messageListItemSelection];
  v3 = [v2 messageListItems];
  unsigned __int8 v4 = [v3 ef_any:&stru_10060B488];

  return v4;
}

- (id)title
{
  unsigned int v3 = [(MFDeleteTriageInteraction *)self _movesToTrash];
  if ([(MFTriageInteraction *)self titleIncludesCount])
  {
    if ([(MFTriageInteraction *)self messageCount] < 2)
    {
      v9 = +[NSBundle mainBundle];
      BOOL v5 = v9;
      if (v3) {
        [(__CFString *)v9 localizedStringForKey:@"TRASH_EMAIL" value:&stru_100619928 table:@"Main"];
      }
      else {
      v8 = [(__CFString *)v9 localizedStringForKey:@"DELETE_EMAIL" value:&stru_100619928 table:@"Main"];
      }
    }
    else
    {
      unsigned __int8 v4 = @"DELETE_FORMAT%1$lu";
      if (v3) {
        unsigned __int8 v4 = @"TRASH_FORMAT%1$lu";
      }
      BOOL v5 = v4;
      v6 = +[NSBundle mainBundle];
      v7 = [v6 localizedStringForKey:v5 value:&stru_100619928 table:@"Main"];
      v8 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v7, [(MFTriageInteraction *)self messageCount]);
    }
  }
  else
  {
    v8 = _EFLocalizedString();
  }

  return v8;
}

- (id)accessibilityIdentifer
{
  return MSAccessibilityIdentifierActionsViewControllerTrashMessage;
}

- (id)shortTitle
{
  unsigned int v3 = [(MFDeleteTriageInteraction *)self _movesToTrash];
  uint64_t v4 = [(MFTriageInteraction *)self messageCount];
  BOOL v5 = +[NSBundle mainBundle];
  v6 = v5;
  if (v4 < 2)
  {
    if (v3) {
      [v5 localizedStringForKey:@"TRASH" value:&stru_100619928 table:@"Main"];
    }
    else {
    v8 = [v5 localizedStringForKey:@"DELETE" value:&stru_100619928 table:@"Main"];
    }
    v7 = v6;
  }
  else
  {
    if (v3) {
      [v5 localizedStringForKey:@"TRASH_COUNT" value:&stru_100619928 table:@"Main"];
    }
    else {
    v7 = [v5 localizedStringForKey:@"DELETE_COUNT" value:&stru_100619928 table:@"Main"];
    }

    v8 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v7, [(MFTriageInteraction *)self messageCount]);
  }

  return v8;
}

- (id)swipeTitle
{
  unsigned int v3 = [(MFDeleteTriageInteraction *)self _movesToTrash];
  uint64_t v4 = [(MFTriageInteraction *)self messageCount];
  BOOL v5 = +[NSBundle mainBundle];
  v6 = v5;
  if (v4 < 2)
  {
    if (v3) {
      [v5 localizedStringForKey:@"SWIPE_TRASH" value:&stru_100619928 table:@"Main"];
    }
    else {
    v8 = [v5 localizedStringForKey:@"SWIPE_DELETE" value:&stru_100619928 table:@"Main"];
    }
    v7 = v6;
  }
  else
  {
    if (v3) {
      [v5 localizedStringForKey:@"SWIPE_TRASH_COUNT" value:&stru_100619928 table:@"Main"];
    }
    else {
    v7 = [v5 localizedStringForKey:@"SWIPE_DELETE_COUNT" value:&stru_100619928 table:@"Main"];
    }

    v8 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v7, [(MFTriageInteraction *)self messageCount]);
  }

  return v8;
}

- (id)undoTitle
{
  v2 = +[NSBundle mainBundle];
  unsigned int v3 = [v2 localizedStringForKey:@"OPERATION_DELETE_DESC" value:&stru_100619928 table:@"Main"];

  return v3;
}

- (id)color
{
  return +[UIColor mailDestructiveActionColor];
}

- (id)_swipeColor
{
  return +[UIColor mailDestructiveActionSwipeColor];
}

- (id)_iconImageName
{
  return MFImageGlyphTrash;
}

- (id)_previewImageName
{
  return MFImageGlyphTrash;
}

- (BOOL)isDestructive
{
  return 1;
}

- (BOOL)needShrinkAnimationAfterCompletion
{
  return 1;
}

@end