@interface UISocialActivity
+ (id)_activityExtensionItemsForActivityItemValues:(id)a3 extensionItemDataRequest:(id)a4;
+ (int64_t)activityCategory;
- (BOOL)_canBeExcludeWhenMatchingWithContext:(id)a3;
- (BOOL)_dismissActivityFromViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5;
- (BOOL)_managesOwnPresentation;
- (BOOL)_presentActivityOnViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5;
- (BOOL)_wantsAttachmentURLItemData;
- (BOOL)_wantsInitialSocialText;
- (BOOL)_wantsThumbnailItemData;
- (BOOL)canPerformWithActivityItems:(id)a3;
- (BOOL)isContentManaged;
- (CGSize)_thumbnailSize;
- (NSString)builtinActivityType;
- (NSString)initialText;
- (NSString)sourceApplicationBundleID;
- (SLComposeViewController)socialComposeViewController;
- (UISocialActivity)initWithActivityType:(id)a3;
- (UISocialActivity)initWithApplicationExtension:(id)a3;
- (id)activityType;
- (id)debugDescription;
- (void)_cleanup;
- (void)_prepareComposeViewController:(id)a3 withActivityExtensionItems:(id)a4;
- (void)_prepareComposeViewController:(id)a3 withInjectedExtensionItems:(id)a4;
- (void)_willBePerformedOrPresented;
- (void)prepareWithActivityExtensionItemData:(id)a3;
- (void)setBuiltinActivityType:(id)a3;
- (void)setInitialText:(id)a3;
- (void)setIsContentManaged:(BOOL)a3;
- (void)setSocialComposeViewController:(id)a3;
- (void)setSourceApplicationBundleID:(id)a3;
@end

@implementation UISocialActivity

- (UISocialActivity)initWithApplicationExtension:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)UISocialActivity;
  v5 = [(UIApplicationExtensionActivity *)&v13 initWithApplicationExtension:v4];
  if (v5)
  {
    uint64_t v6 = _UISocialActivityGetActivityTypeForApplicationExtension_once;
    id v7 = v4;
    if (v6 != -1) {
      dispatch_once(&_UISocialActivityGetActivityTypeForApplicationExtension_once, &__block_literal_global_129);
    }
    v8 = (void *)_UISocialActivityGetActivityTypeForApplicationExtension___activityTypesByApplicationExtensionIdentifiers;
    v9 = [v7 identifier];

    v10 = [v8 objectForKeyedSubscript:v9];

    if (v10) {
      [(UISocialActivity *)v5 setBuiltinActivityType:v10];
    }
    v11 = v5;
  }
  return v5;
}

- (UISocialActivity)initWithActivityType:(id)a3
{
  id v4 = a3;
  v5 = [(objc_class *)getSLComposeViewControllerClass() extensionIdentifierForActivityType:v4];
  id v13 = 0;
  uint64_t v6 = [MEMORY[0x1E4F28C70] extensionWithIdentifier:v5 error:&v13];
  id v7 = v13;
  if (v7)
  {
    v8 = share_sheet_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      [(UISocialActivity *)(uint64_t)v4 initWithActivityType:v8];
    }
  }
  v9 = [(UISocialActivity *)self initWithApplicationExtension:v6];
  v10 = v9;
  if (v9) {
    v11 = v9;
  }

  return v10;
}

- (void)setInitialText:(id)a3
{
  id v6 = a3;
  if (!-[NSString isEqualToString:](self->_initialText, "isEqualToString:"))
  {
    objc_storeStrong((id *)&self->_initialText, a3);
    v5 = [(UISocialActivity *)self socialComposeViewController];
    [v5 setInitialText:v6];
  }
}

- (id)debugDescription
{
  v3 = [(UISocialActivity *)self builtinActivityType];

  if (v3)
  {
    id v4 = NSString;
    v9.receiver = self;
    v9.super_class = (Class)UISocialActivity;
    v5 = [(UIActivity *)&v9 description];
    id v6 = [(UISocialActivity *)self activityType];
    id v7 = [v4 stringWithFormat:@"%@ {type = %@}", v5, v6];
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)UISocialActivity;
    id v7 = [(UIApplicationExtensionActivity *)&v10 debugDescription];
  }
  return v7;
}

+ (int64_t)activityCategory
{
  return 1;
}

- (id)activityType
{
  v3 = [(UISocialActivity *)self builtinActivityType];
  if (!v3)
  {
    id v4 = [(UIApplicationExtensionActivity *)self applicationExtension];
    v3 = [v4 identifier];
  }
  return v3;
}

- (BOOL)_canBeExcludeWhenMatchingWithContext:(id)a3
{
  id v4 = a3;
  v5 = [(UISocialActivity *)self builtinActivityType];

  if (v5)
  {
    BOOL v6 = 1;
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)UISocialActivity;
    BOOL v6 = [(UIApplicationExtensionActivity *)&v8 _canBeExcludeWhenMatchingWithContext:v4];
  }

  return v6;
}

- (BOOL)canPerformWithActivityItems:(id)a3
{
  id v4 = a3;
  v5 = [(UISocialActivity *)self sourceApplicationBundleID];
  BOOL v6 = v5;
  if (v5)
  {
    id v7 = v5;
  }
  else
  {
    objc_super v8 = [MEMORY[0x1E4F28B50] mainBundle];
    id v7 = [v8 bundleIdentifier];
  }
  id v9 = [(UIApplicationExtensionActivity *)self applicationExtension];
  id v10 = v7;
  if (_UIComposeViewControllerIsAvailable_once != -1) {
    dispatch_once(&_UIComposeViewControllerIsAvailable_once, &__block_literal_global_121_0);
  }
  v11 = [v9 _plugIn];
  v12 = [v11 supersededBy];

  if (v12) {
    goto LABEL_7;
  }
  v15 = [v9 identifier];
  if ([(id)_UIComposeViewControllerIsAvailable_legacySocialActivityTypes containsObject:v15])
  {
    int v16 = [(objc_class *)getSLComposeViewControllerClass() isAvailableForExtension:v9 inHostApplicationBundleID:v10];
  }
  else
  {
    v17 = [(id)_UIComposeViewControllerIsAvailable_mediaShareExtension extensionIdentifier];
    int v18 = [v15 isEqualToString:v17];

    if (!v18)
    {

LABEL_7:
      goto LABEL_8;
    }
    id v19 = (id)_UIComposeViewControllerIsAvailable_mediaShareExtension;
    uint64_t v26 = 0;
    v27 = &v26;
    uint64_t v28 = 0x2020000000;
    char v29 = 0;
    dispatch_semaphore_t v20 = dispatch_semaphore_create(0);
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = ___UIMediaShareExtensionIsAvailable_block_invoke;
    v23[3] = &unk_1E5A23968;
    v25 = &v26;
    v21 = v20;
    v24 = v21;
    [v19 getVisibilityWithCompletionBlock:v23];
    dispatch_semaphore_wait(v21, 0xFFFFFFFFFFFFFFFFLL);
    int v16 = *((unsigned char *)v27 + 24) != 0;

    _Block_object_dispose(&v26, 8);
  }

  if (!v16)
  {
    BOOL v13 = 0;
    goto LABEL_9;
  }
LABEL_8:
  v22.receiver = self;
  v22.super_class = (Class)UISocialActivity;
  BOOL v13 = [(UIApplicationExtensionActivity *)&v22 canPerformWithActivityItems:v4];
LABEL_9:

  return v13;
}

- (void)prepareWithActivityExtensionItemData:(id)a3
{
  v14[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  Class SLComposeViewControllerClass = getSLComposeViewControllerClass();
  BOOL v6 = [(UIApplicationExtensionActivity *)self applicationExtension];
  id v7 = [(objc_class *)SLComposeViewControllerClass composeViewControllerForExtension:v6];

  objc_super v8 = [(UISocialActivity *)self initialText];

  if (v8)
  {
    id v9 = [(UISocialActivity *)self initialText];
    [v7 setInitialText:v9];
  }
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __57__UISocialActivity_prepareWithActivityExtensionItemData___block_invoke;
  v13[3] = &unk_1E5A23940;
  v13[4] = self;
  [v7 setCompletionHandler:v13];
  id v10 = [(UIApplicationExtensionActivity *)self _injectedExtensionItem];

  if (v10)
  {
    v11 = [(UIApplicationExtensionActivity *)self _injectedExtensionItem];
    v14[0] = v11;
    v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:1];
    [(UISocialActivity *)self _prepareComposeViewController:v7 withInjectedExtensionItems:v12];
  }
  else
  {
    v11 = [v4 extensionItems];
    [(UISocialActivity *)self _prepareComposeViewController:v7 withActivityExtensionItems:v11];
  }

  [(UISocialActivity *)self setSocialComposeViewController:v7];
}

uint64_t __57__UISocialActivity_prepareWithActivityExtensionItemData___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) activityDidFinish:a2 != 0];
}

- (void)_willBePerformedOrPresented
{
  v3 = [(UISocialActivity *)self socialComposeViewController];
  [v3 _instantiateAndBeginExtensionIfNeeded];

  id v4 = [(UIApplicationExtensionActivity *)self applicationExtension];
  v5 = [v4 infoDictionary];
  id v22 = [v5 objectForKeyedSubscript:@"NSExtension"];

  BOOL v6 = [(UIApplicationExtensionActivity *)self applicationExtension];
  id v7 = +[_UIActivityBundleHelper activityBundleHelperForExtension:v6];

  objc_super v8 = [v7 bundleProxy];
  uint64_t v9 = [v8 sdkVersion];
  id v10 = (void *)v9;
  v11 = @"1.0";
  if (v9) {
    v11 = (__CFString *)v9;
  }
  v12 = v11;

  BOOL v13 = [v22 objectForKeyedSubscript:@"NSExtensionShareWantsFullScreenPresentation"];
  if ([v13 BOOLValue]) {
    goto LABEL_6;
  }
  v14 = [v22 objectForKeyedSubscript:@"NSExtensionAttributes"];
  v15 = [v14 objectForKeyedSubscript:@"NSExtensionShareWantsFullScreenPresentation"];
  if ([v15 BOOLValue])
  {

LABEL_6:
LABEL_7:
    uint64_t v16 = 1;
    uint64_t v17 = 5;
    goto LABEL_8;
  }
  dispatch_semaphore_t v20 = [MEMORY[0x1E4F223E0] defaultWorkspace];
  char v21 = [v20 isVersion:v12 greaterThanOrEqualToVersion:@"13.0"];

  if ((v21 & 1) == 0) {
    goto LABEL_7;
  }
  uint64_t v16 = 0;
  uint64_t v17 = -2;
LABEL_8:
  int v18 = [(UISocialActivity *)self socialComposeViewController];
  [v18 setModalPresentationStyle:v17];

  id v19 = [(UISocialActivity *)self socialComposeViewController];
  [v19 setShouldForceNonAnimatedTransition:v16];
}

- (void)_prepareComposeViewController:(id)a3 withInjectedExtensionItems:(id)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v21 objects:v26 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v22;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v22 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = *(void **)(*((void *)&v21 + 1) + 8 * v10);
        long long v17 = 0u;
        long long v18 = 0u;
        long long v19 = 0u;
        long long v20 = 0u;
        v12 = objc_msgSend(v11, "attachments", 0);
        uint64_t v13 = [v12 countByEnumeratingWithState:&v17 objects:v25 count:16];
        if (v13)
        {
          uint64_t v14 = v13;
          uint64_t v15 = *(void *)v18;
          do
          {
            uint64_t v16 = 0;
            do
            {
              if (*(void *)v18 != v15) {
                objc_enumerationMutation(v12);
              }
              [v5 addItemProvider:*(void *)(*((void *)&v17 + 1) + 8 * v16++)];
            }
            while (v14 != v16);
            uint64_t v14 = [v12 countByEnumeratingWithState:&v17 objects:v25 count:16];
          }
          while (v14);
        }

        ++v10;
      }
      while (v10 != v8);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v21 objects:v26 count:16];
    }
    while (v8);
  }
}

- (void)_prepareComposeViewController:(id)a3 withActivityExtensionItems:(id)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        [v5 addExtensionItem:*(void *)(*((void *)&v11 + 1) + 8 * v10++)];
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }
}

- (BOOL)_presentActivityOnViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  return 0;
}

- (BOOL)_dismissActivityFromViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  return 0;
}

- (BOOL)_managesOwnPresentation
{
  return 0;
}

- (CGSize)_thumbnailSize
{
  double v2 = 70.0;
  double v3 = 70.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)_cleanup
{
  [(UISocialActivity *)self setSocialComposeViewController:0];
  v3.receiver = self;
  v3.super_class = (Class)UISocialActivity;
  [(UIApplicationExtensionActivity *)&v3 _cleanup];
}

- (BOOL)_wantsThumbnailItemData
{
  objc_super v3 = [(UISocialActivity *)self activityType];
  if ([v3 isEqualToString:@"com.apple.UIKit.activity.PostToFacebook"])
  {
    char v4 = 1;
  }
  else
  {
    id v5 = [(UISocialActivity *)self activityType];
    if ([v5 isEqualToString:@"com.apple.UIKit.activity.PostToTwitter"])
    {
      char v4 = 1;
    }
    else
    {
      id v6 = [(UISocialActivity *)self activityType];
      char v4 = [v6 isEqualToString:@"com.apple.UIKit.activity.PostToWeibo"];
    }
  }

  return v4;
}

- (BOOL)_wantsAttachmentURLItemData
{
  objc_super v3 = [(UISocialActivity *)self activityType];
  if ([v3 isEqualToString:@"com.apple.UIKit.activity.PostToFacebook"])
  {
    char v4 = 1;
  }
  else
  {
    id v5 = [(UISocialActivity *)self activityType];
    if ([v5 isEqualToString:@"com.apple.UIKit.activity.PostToTwitter"])
    {
      char v4 = 1;
    }
    else
    {
      id v6 = [(UISocialActivity *)self activityType];
      char v4 = [v6 isEqualToString:@"com.apple.UIKit.activity.PostToWeibo"];
    }
  }

  return v4;
}

- (BOOL)_wantsInitialSocialText
{
  return 1;
}

+ (id)_activityExtensionItemsForActivityItemValues:(id)a3 extensionItemDataRequest:(id)a4
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v25 = a4;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v30 objects:v35 count:16];
  if (!v6)
  {
    id v8 = 0;
    goto LABEL_17;
  }
  uint64_t v7 = v6;
  id v8 = 0;
  uint64_t v9 = *(void *)v31;
  do
  {
    for (uint64_t i = 0; i != v7; ++i)
    {
      if (*(void *)v31 != v9) {
        objc_enumerationMutation(v5);
      }
      uint64_t v11 = *(void *)(*((void *)&v30 + 1) + 8 * i);
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();
      if ((isKindOfClass & 1) == 0)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0) {
          continue;
        }
      }
      if (v8)
      {
        long long v13 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:@"\n"];
        [v8 appendAttributedString:v13];

        if (isKindOfClass) {
          goto LABEL_10;
        }
      }
      else
      {
        id v8 = objc_alloc_init(MEMORY[0x1E4F28E48]);
        if (isKindOfClass)
        {
LABEL_10:
          long long v14 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:v11];
          [v8 appendAttributedString:v14];

          continue;
        }
      }
      [v8 appendAttributedString:v11];
    }
    uint64_t v7 = [v5 countByEnumeratingWithState:&v30 objects:v35 count:16];
  }
  while (v7);
LABEL_17:
  uint64_t v15 = _NSExtensionItemsFromActivityItemValuesForExtensionItemDataRequest(v5, v25);
  uint64_t v16 = v15;
  if (v8)
  {
    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    id v17 = v15;
    uint64_t v18 = [v17 countByEnumeratingWithState:&v26 objects:v34 count:16];
    if (v18)
    {
      uint64_t v19 = v18;
      uint64_t v20 = *(void *)v27;
      while (2)
      {
        for (uint64_t j = 0; j != v19; ++j)
        {
          if (*(void *)v27 != v20) {
            objc_enumerationMutation(v17);
          }
          long long v22 = *(void **)(*((void *)&v26 + 1) + 8 * j);
          if (([v5 containsObject:v22] & 1) == 0)
          {
            [v22 setAttributedContentText:v8];
            uint64_t v16 = v17;
            goto LABEL_28;
          }
        }
        uint64_t v19 = [v17 countByEnumeratingWithState:&v26 objects:v34 count:16];
        if (v19) {
          continue;
        }
        break;
      }
    }

    id v23 = objc_alloc_init(MEMORY[0x1E4F28C80]);
    [v23 setAttributedContentText:v8];
    uint64_t v16 = [v17 arrayByAddingObject:v23];

    id v17 = v23;
LABEL_28:
  }
  return v16;
}

- (BOOL)isContentManaged
{
  return self->_isContentManaged;
}

- (void)setIsContentManaged:(BOOL)a3
{
  self->_isContentManaged = a3;
}

- (NSString)sourceApplicationBundleID
{
  return self->_sourceApplicationBundleID;
}

- (void)setSourceApplicationBundleID:(id)a3
{
}

- (NSString)builtinActivityType
{
  return self->_builtinActivityType;
}

- (void)setBuiltinActivityType:(id)a3
{
}

- (SLComposeViewController)socialComposeViewController
{
  return self->_socialComposeViewController;
}

- (void)setSocialComposeViewController:(id)a3
{
}

- (NSString)initialText
{
  return self->_initialText;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_initialText, 0);
  objc_storeStrong((id *)&self->_socialComposeViewController, 0);
  objc_storeStrong((id *)&self->_builtinActivityType, 0);
  objc_storeStrong((id *)&self->_sourceApplicationBundleID, 0);
}

- (void)initWithActivityType:(os_log_t)log .cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v3 = 138543618;
  uint64_t v4 = a1;
  __int16 v5 = 2114;
  uint64_t v6 = a2;
  _os_log_error_impl(&dword_1A0AD8000, log, OS_LOG_TYPE_ERROR, "Cannot find application extension for activity type \"%{public}@\": %{public}@", (uint8_t *)&v3, 0x16u);
}

@end