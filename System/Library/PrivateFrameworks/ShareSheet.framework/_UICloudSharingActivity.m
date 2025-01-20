@interface _UICloudSharingActivity
+ (int64_t)activityCategory;
+ (unint64_t)_xpcAttributes;
- (BOOL)_activitySupportsPromiseURLs;
- (BOOL)_allowsAutoCancelOnDismiss;
- (BOOL)_isURLEligibleForSharing:(id)a3 isInitial:(BOOL *)a4 isFolder:(BOOL *)a5;
- (BOOL)activityItemIsFolder;
- (BOOL)activityItemIsInSharedFolder;
- (BOOL)canPerformWithActivityItems:(id)a3;
- (BOOL)eligibleTypeForActivity:(id)a3;
- (BOOL)initialSharing;
- (NSString)activityTitle;
- (UIImage)activityImage;
- (UIViewController)activityViewController;
- (id)_activityFooterText;
- (id)_systemImageName;
- (id)activityType;
- (void)_cloudShareControllerDidDismiss:(id)a3;
- (void)_documentSharingControllerDidDismiss:(id)a3;
- (void)_prepareWithActivityItems:(id)a3 completion:(id)a4;
- (void)_setupForInitialSharing;
- (void)_setupForSharingInfo;
- (void)_showSharingControllerForURL:(id)a3 completion:(id)a4;
- (void)setActivityImage:(id)a3;
- (void)setActivityItemIsFolder:(BOOL)a3;
- (void)setActivityItemIsInSharedFolder:(BOOL)a3;
- (void)setActivityTitle:(id)a3;
- (void)setActivityViewController:(id)a3;
- (void)setInitialSharing:(BOOL)a3;
@end

@implementation _UICloudSharingActivity

+ (unint64_t)_xpcAttributes
{
  uint64_t v2 = objc_opt_class();
  return v2 == objc_opt_class();
}

+ (int64_t)activityCategory
{
  return 0;
}

- (UIViewController)activityViewController
{
  return self->_activityViewController;
}

- (void)setActivityViewController:(id)a3
{
}

- (id)activityType
{
  return @"com.apple.UIKit.activity.CloudSharing";
}

- (id)_systemImageName
{
  if ([(_UICloudSharingActivity *)self initialSharing]) {
    return @"person.crop.circle.badge.plus";
  }
  else {
    return @"person.crop.circle.badge.checkmark";
  }
}

- (id)_activityFooterText
{
  v11[2] = *MEMORY[0x1E4F143B8];
  if ([(_UICloudSharingActivity *)self activityItemIsInSharedFolder])
  {
    uint64_t v2 = _ShareSheetBundle();
    v3 = [v2 localizedStringForKey:@"MANAGE_SHARED_FOLDER_FOOTER" value:@"This document is in a shared folder." table:@"Localizable"];

    id v4 = objc_alloc(MEMORY[0x1E4F28B18]);
    v10[0] = *MEMORY[0x1E4FB12B0];
    v5 = [MEMORY[0x1E4FB1798] preferredFontForTextStyle:*MEMORY[0x1E4FB28F0]];
    v11[0] = v5;
    v10[1] = *MEMORY[0x1E4FB12B8];
    v6 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
    v11[1] = v6;
    v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:v10 count:2];
    v8 = (void *)[v4 initWithString:v3 attributes:v7];
  }
  else
  {
    v8 = 0;
  }
  return v8;
}

- (BOOL)_allowsAutoCancelOnDismiss
{
  return 0;
}

- (void)_setupForInitialSharing
{
  BOOL v3 = [(_UICloudSharingActivity *)self activityItemIsFolder];
  id v4 = @"Share File in iCloud";
  if (v3) {
    id v4 = @"Share Folder in iCloud";
  }
  v5 = v4;
  _ShareSheetBundle();
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  v6 = [v7 localizedStringForKey:v5 value:v5 table:@"Localizable"];

  [(_UICloudSharingActivity *)self setActivityTitle:v6];
}

- (void)_setupForSharingInfo
{
  BOOL v3 = [(_UICloudSharingActivity *)self activityItemIsFolder];
  id v4 = @"Manage Shared File";
  if (v3) {
    id v4 = @"Manage Shared Folder";
  }
  v5 = v4;
  _ShareSheetBundle();
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  v6 = [v7 localizedStringForKey:v5 value:v5 table:@"Localizable"];

  [(_UICloudSharingActivity *)self setActivityTitle:v6];
}

- (BOOL)eligibleTypeForActivity:(id)a3
{
  v16[1] = *MEMORY[0x1E4F143B8];
  BOOL v3 = (__CFString *)a3;
  v16[0] = *MEMORY[0x1E4F22520];
  BOOL v4 = 1;
  [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:1];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v12;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        if (UTTypeConformsTo(v3, *(CFStringRef *)(*((void *)&v11 + 1) + 8 * i)))
        {
          BOOL v4 = 0;
          goto LABEL_11;
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v7) {
        continue;
      }
      break;
    }
    BOOL v4 = 1;
  }
LABEL_11:

  return v4;
}

- (BOOL)canPerformWithActivityItems:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v4 = a3;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    char v7 = 0;
    uint64_t v8 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(v4);
        }
        v10 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0 && [v10 isFileURL])
        {
          id v11 = v10;
          __int16 v15 = 0;
          BOOL v12 = [(_UICloudSharingActivity *)self _isURLEligibleForSharing:v11 isInitial:(char *)&v15 + 1 isFolder:&v15];
          if (v7 & 1 | !v12)
          {
            BOOL v13 = v12;

            if (v13) {
              goto LABEL_20;
            }
          }
          else
          {
            [(_UICloudSharingActivity *)self setActivityItemIsFolder:v15];
            if (HIBYTE(v15))
            {
              [(_UICloudSharingActivity *)self setInitialSharing:1];
              [(_UICloudSharingActivity *)self _setupForInitialSharing];
            }
            else
            {
              [MEMORY[0x1E4F9F6B8] isSharedFileURL:v11 isLocalStorageFileURL:0 isiCloudDriveFileURL:0 isInSharedFolder:&self->_activityItemIsInSharedFolder];
              if ([(_UICloudSharingActivity *)self activityItemIsInSharedFolder]) {
                [(_UICloudSharingActivity *)self setActivityItemIsFolder:1];
              }
              [(_UICloudSharingActivity *)self _setupForSharingInfo];
            }

            char v7 = 1;
          }
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v6);
  }
  else
  {
LABEL_20:
    char v7 = 0;
  }

  return v7 & 1;
}

- (BOOL)_isURLEligibleForSharing:(id)a3 isInitial:(BOOL *)a4 isFolder:(BOOL *)a5
{
  id v8 = a3;
  uint64_t v18 = 0;
  long long v19 = &v18;
  uint64_t v20 = 0x2020000000;
  char v21 = 0;
  v9 = [MEMORY[0x1E4F28CB8] defaultManager];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __71___UICloudSharingActivity__isURLEligibleForSharing_isInitial_isFolder___block_invoke;
  v12[3] = &unk_1E5A22158;
  __int16 v15 = &v18;
  id v10 = v8;
  id v13 = v10;
  long long v14 = self;
  long long v16 = a4;
  long long v17 = a5;
  [v9 synchronouslyGetFileProviderServicesForItemAtURL:v10 completionHandler:v12];

  LOBYTE(a5) = *((unsigned char *)v19 + 24);
  _Block_object_dispose(&v18, 8);

  return (char)a5;
}

- (void)_prepareWithActivityItems:(id)a3 completion:(id)a4
{
  id v6 = a4;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __64___UICloudSharingActivity__prepareWithActivityItems_completion___block_invoke;
  v8[3] = &unk_1E5A21B08;
  v8[4] = self;
  id v9 = v6;
  id v7 = v6;
  [(UIActivity *)self _loadItemProvidersFromActivityItems:a3 wantsSendCopyRepresentation:0 completion:v8];
}

- (void)_showSharingControllerForURL:(id)a3 completion:(id)a4
{
  id v6 = (objc_class *)MEMORY[0x1E4FB16F8];
  id v7 = (void (**)(void))a4;
  id v8 = a3;
  id v15 = 0;
  id v9 = (void *)[[v6 alloc] initWithFileURL:v8 error:&v15];

  id v10 = v15;
  if (v9)
  {
    [v9 _setPrivateDelegate:self];
    [(_UICloudSharingActivity *)self setActivityViewController:v9];
  }
  else
  {
    id v11 = _ShareSheetBundle();
    BOOL v12 = [v11 localizedStringForKey:@"Unable to Share Item" value:@"Unable to Share Item" table:@"Localizable"];

    if (v10)
    {
      id v13 = [v10 localizedDescription];
    }
    else
    {
      id v13 = 0;
    }
    long long v14 = [MEMORY[0x1E4FB1418] alertControllerWithTitle:v12 message:v13 preferredStyle:1];
    [(_UICloudSharingActivity *)self setActivityViewController:v14];
  }
  v7[2](v7);
}

- (void)_cloudShareControllerDidDismiss:(id)a3
{
}

- (void)_documentSharingControllerDidDismiss:(id)a3
{
}

- (BOOL)_activitySupportsPromiseURLs
{
  return 1;
}

- (NSString)activityTitle
{
  return self->_activityTitle;
}

- (void)setActivityTitle:(id)a3
{
}

- (UIImage)activityImage
{
  return self->_activityImage;
}

- (void)setActivityImage:(id)a3
{
}

- (BOOL)initialSharing
{
  return self->_initialSharing;
}

- (void)setInitialSharing:(BOOL)a3
{
  self->_initialSharing = a3;
}

- (BOOL)activityItemIsFolder
{
  return self->_activityItemIsFolder;
}

- (void)setActivityItemIsFolder:(BOOL)a3
{
  self->_activityItemIsFolder = a3;
}

- (BOOL)activityItemIsInSharedFolder
{
  return self->_activityItemIsInSharedFolder;
}

- (void)setActivityItemIsInSharedFolder:(BOOL)a3
{
  self->_activityItemIsInSharedFolder = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activityImage, 0);
  objc_storeStrong((id *)&self->_activityViewController, 0);
  objc_storeStrong((id *)&self->_activityTitle, 0);
}

@end