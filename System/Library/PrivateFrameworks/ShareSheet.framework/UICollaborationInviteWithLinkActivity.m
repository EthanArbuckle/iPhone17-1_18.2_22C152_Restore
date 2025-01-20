@interface UICollaborationInviteWithLinkActivity
+ (int64_t)activityCategory;
+ (unint64_t)_xpcAttributes;
- (BOOL)_allowsAutoCancelOnDismiss;
- (BOOL)canPerformWithActivityItems:(id)a3;
- (BOOL)canPerformWithCollaborationItem:(id)a3 activityItems:(id)a4;
- (SFCollaborationItem)collaborationItem;
- (id)_activityImage;
- (id)_activitySettingsImage;
- (id)activityTitle;
- (id)activityType;
- (int64_t)_defaultSortGroup;
- (void)performActivity;
- (void)prepareWithActivityItems:(id)a3;
- (void)setCollaborationItem:(id)a3;
@end

@implementation UICollaborationInviteWithLinkActivity

+ (unint64_t)_xpcAttributes
{
  uint64_t v2 = objc_opt_class();
  if (v2 == objc_opt_class()) {
    return 3;
  }
  else {
    return 0;
  }
}

+ (int64_t)activityCategory
{
  return 1;
}

- (int64_t)_defaultSortGroup
{
  return 1;
}

- (id)activityType
{
  return @"com.apple.UIKit.activity.CollaborationInviteWithLink";
}

- (id)_activityImage
{
  uint64_t v2 = (void *)MEMORY[0x1E4FB1818];
  v3 = _ShareSheetBundle();
  v4 = [v2 imageNamed:@"CopyLinkActivity" inBundle:v3];
  v5 = [MEMORY[0x1E4FB1BA8] mainScreen];
  [v5 scale];
  v6 = objc_msgSend(v4, "_applicationIconImageForFormat:precomposed:scale:", 10, 0);

  return v6;
}

- (id)_activitySettingsImage
{
  uint64_t v2 = (void *)MEMORY[0x1E4FB1818];
  v3 = _ShareSheetBundle();
  v4 = [v2 imageNamed:@"CopyLinkActivity" inBundle:v3];
  v5 = [MEMORY[0x1E4FB1BA8] mainScreen];
  [v5 scale];
  v6 = objc_msgSend(v4, "_applicationIconImageForFormat:precomposed:scale:", 0, 0);

  return v6;
}

- (id)activityTitle
{
  uint64_t v2 = _ShareSheetBundle();
  v3 = [v2 localizedStringForKey:@"Link[Activity]" value:@"Link" table:@"Localizable"];

  return v3;
}

- (BOOL)_allowsAutoCancelOnDismiss
{
  return 0;
}

- (BOOL)canPerformWithCollaborationItem:(id)a3 activityItems:(id)a4
{
  id v4 = a3;
  uint64_t v5 = [v4 type];
  if (v5)
  {
    if (v5 != 2)
    {
      BOOL v7 = 1;
      goto LABEL_7;
    }
    char v6 = [v4 isURLProviderSupported];
  }
  else
  {
    char v6 = [v4 isiCloudDrive];
  }
  BOOL v7 = v6;
LABEL_7:

  return v7;
}

- (BOOL)canPerformWithActivityItems:(id)a3
{
  return 0;
}

- (void)prepareWithActivityItems:(id)a3
{
  v6[1] = *MEMORY[0x1E4F143B8];
  v3 = [a3 firstObject];
  id v4 = [MEMORY[0x1E4FB1A78] generalPasteboard];
  v6[0] = v3;
  uint64_t v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:1];
  [v4 setObjects:v5];
}

- (void)performActivity
{
}

- (SFCollaborationItem)collaborationItem
{
  return self->_collaborationItem;
}

- (void)setCollaborationItem:(id)a3
{
}

- (void).cxx_destruct
{
}

@end