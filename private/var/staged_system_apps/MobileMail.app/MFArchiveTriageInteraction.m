@interface MFArchiveTriageInteraction
+ (unint64_t)deleteOrArchive;
- (BOOL)_requiresConfirmationPrompt;
- (BOOL)isDestructive;
- (BOOL)needShrinkAnimationAfterCompletion;
- (id)_iconImageName;
- (id)_previewImageName;
- (id)accessibilityIdentifer;
- (id)color;
- (id)shortTitle;
- (id)title;
- (id)undoTitle;
@end

@implementation MFArchiveTriageInteraction

+ (unint64_t)deleteOrArchive
{
  return 2;
}

- (BOOL)_requiresConfirmationPrompt
{
  BOOL result = (id)[(MFDestructiveTriageInteraction *)self type] == (id)2
        || (+[NSUserDefaults em_userDefaults],
            v3 = objc_claimAutoreleasedReturnValue(),
            unsigned __int8 v4 = [v3 BOOLForKey:ShowMessageDeleteConfirmationKey],
            v3,
            (v4 & 1) != 0)
        || [(MFTriageInteraction *)self messageCount] > 1;
  return result;
}

- (id)title
{
  if ([(MFTriageInteraction *)self titleIncludesCount])
  {
    if ([(MFTriageInteraction *)self messageCount] < 2)
    {
      v3 = +[NSBundle mainBundle];
      v5 = [v3 localizedStringForKey:@"ARCHIVE_EMAIL" value:&stru_100619928 table:@"Main"];
    }
    else
    {
      v3 = +[NSBundle mainBundle];
      unsigned __int8 v4 = [v3 localizedStringForKey:@"ARCHIVE_FORMAT%1$lu" value:&stru_100619928 table:@"Main"];
      v5 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v4, [(MFTriageInteraction *)self messageCount]);
    }
  }
  else
  {
    v5 = _EFLocalizedString();
  }

  return v5;
}

- (id)accessibilityIdentifer
{
  return MSAccessibilityIdentifierActionsViewControllerArchiveMessage;
}

- (id)shortTitle
{
  if ([(MFTriageInteraction *)self messageCount] < 2)
  {
    v3 = +[NSBundle mainBundle];
    v5 = [v3 localizedStringForKey:@"ARCHIVE" value:&stru_100619928 table:@"Main"];
  }
  else
  {
    v3 = +[NSBundle mainBundle];
    unsigned __int8 v4 = [v3 localizedStringForKey:@"SWIPE_ARCHIVE_COUNT" value:&stru_100619928 table:@"Main"];
    v5 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v4, [(MFTriageInteraction *)self messageCount]);
  }

  return v5;
}

- (id)undoTitle
{
  v2 = +[NSBundle mainBundle];
  v3 = [v2 localizedStringForKey:@"OPERATION_ARCHIVE_DESC" value:&stru_100619928 table:@"Main"];

  return v3;
}

- (id)color
{
  return +[UIColor mailArchiveActionColor];
}

- (id)_iconImageName
{
  return MFImageGlyphArchive;
}

- (id)_previewImageName
{
  return MFImageGlyphArchive;
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