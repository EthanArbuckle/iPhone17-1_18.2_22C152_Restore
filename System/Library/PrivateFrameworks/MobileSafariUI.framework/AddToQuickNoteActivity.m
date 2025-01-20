@interface AddToQuickNoteActivity
- (BOOL)canPerformWithTabDocument:(id)a3;
- (id)_systemImageName;
- (id)activityTitle;
- (id)activityType;
- (void)performActivityWithTabDocument:(id)a3;
@end

@implementation AddToQuickNoteActivity

- (id)_systemImageName
{
  return @"quicknote";
}

- (id)activityTitle
{
  return (id)_WBSLocalizedString();
}

- (id)activityType
{
  return @"SafariActivityTypeAddToQuickNote";
}

- (void)performActivityWithTabDocument:(id)a3
{
  [a3 addAppHighlightCreatingLink:1];
  [(_SFActivity *)self activityDidFinish:1];
}

- (BOOL)canPerformWithTabDocument:(id)a3
{
  id v3 = a3;
  v4 = +[Application sharedApplication];
  v5 = [v4 systemNoteTakingController];
  uint64_t v6 = [v3 isPrivateBrowsingEnabled];

  LOBYTE(v3) = [v5 isNoteTakingSupportedWithPrivateBrowsing:v6];
  return (char)v3;
}

@end