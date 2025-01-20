@interface UIActivity
+ (BOOL)_isCapabilityBasedActivity;
+ (UIActivityCategory)activityCategory;
+ (double)imageWidthForContentSizeCategory:(id)a3;
+ (id)_actionImageForActionRepresentationImage:(id)a3 contentSizeCategory:(id)a4;
+ (id)_actionImageForActionRepresentationImage:(id)a3 contentSizeCategory:(id)a4 monochrome:(BOOL)a5;
+ (id)_actionImageForBundleImageConfiguration:(id)a3;
+ (id)_activityExtensionItemsForActivityItemValues:(id)a3 extensionItemDataRequest:(id)a4;
+ (id)_activityImageForActionRepresentationImage:(id)a3;
+ (id)_activityImageForApplicationBundleIdentifier:(id)a3 userInterfaceStyle:(int64_t)a4;
+ (id)_activityImageForBundleImageConfiguration:(id)a3;
+ (id)_activitySettingsImageForApplicationBundleIdentifier:(id)a3 userInterfaceStyle:(int64_t)a4;
+ (id)_activitySettingsImageForBundleImageConfiguration:(id)a3;
+ (id)_defaultFallbackActivityType;
+ (id)_imageByApplyingDefaultEffectsToImage:(id)a3 activityCategory:(int64_t)a4 iconFormat:(int)a5;
+ (id)_stringFromActivityCategory:(int64_t)a3;
+ (id)preparedActivityExtensionItemDataForActivityItemValues:(id)a3 extensionItemDataRequest:(id)a4;
+ (int64_t)_activityStyle;
+ (unint64_t)_xpcAttributes;
+ (void)_loadItemProvidersFromActivityItems:(id)a3 withCacheURL:(id)a4 completion:(id)a5;
+ (void)_performAfterActivityImageLoadingCompletes:(id)a3;
- (BOOL)_activitySupportsPromiseURLs;
- (BOOL)_allowsAutoCancelOnDismiss;
- (BOOL)_appIsDocumentTypeOwner;
- (BOOL)_canBeExcludeWhenMatchingWithContext:(id)a3;
- (BOOL)_dismissActivityFromViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5;
- (BOOL)_isBuiltinDerived;
- (BOOL)_isDisabled;
- (BOOL)_isExecutedInProcess;
- (BOOL)_managesOwnPresentation;
- (BOOL)_needsResolvedActivityItems;
- (BOOL)_presentActivityOnViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5;
- (BOOL)_showsInSystemActionGroup;
- (BOOL)_supportsOpenInPlace;
- (BOOL)_wantsAttachmentURLItemData;
- (BOOL)_wantsInitialSocialText;
- (BOOL)_wantsOriginalImageColor;
- (BOOL)_wantsThumbnailItemData;
- (BOOL)canPerformWithActivityItems:(NSArray *)activityItems;
- (BOOL)ss_shouldDismissHostsPresentationBeforePerforming;
- (BOOL)ss_shouldExecuteInShareSheet;
- (CGSize)_thumbnailSize;
- (NSArray)preferredLocalizations;
- (NSAttributedString)_activityFooterText;
- (NSExtension)applicationExtension;
- (NSString)_activityBadgeText;
- (NSString)_activitySubtitle;
- (NSString)_heroActionTitle;
- (NSString)activitySectionIdentifier;
- (NSString)activityTitle;
- (NSString)contentSizeCategory;
- (NSString)description;
- (NSUUID)activityUUID;
- (UIActivity)init;
- (UIActivityType)activityType;
- (UIColor)_activityBadgeColor;
- (UIColor)_activityBadgeTextColor;
- (UIColor)_activityStatusTintColor;
- (UIImage)_activityStatusImage;
- (UIImage)activityImage;
- (UIViewController)activityViewController;
- (_UIActivityResourceLoader)_activityImageLoader;
- (_UIActivityResourceLoader)_activitySettingsImageLoader;
- (id)_actionBundleImageConfiguration;
- (id)_actionImage;
- (id)_activityBundleImageConfiguration;
- (id)_activityImage;
- (id)_activityImageUTI;
- (id)_activitySettingsBundleImageConfiguration;
- (id)_activitySettingsImage;
- (id)_activityTypeUsingFallbackActivityTypeIfNecessary;
- (id)_attachmentNameForActivityItem:(id)a3;
- (id)_backgroundPreheatBlock;
- (id)_beforeActivity;
- (id)_bundleIdentifierForActivityImageCreation;
- (id)_dataTypeIdentifierForActivityItem:(id)a3;
- (id)_embeddedActivityViewController;
- (id)_subjectForActivityItem:(id)a3;
- (id)_systemImageName;
- (id)_thumbnailImageForActivityItem:(id)a3;
- (id)activityCompletionWithItemsHandler;
- (id)applicationProxy;
- (id)didFinishPerformingActivityHandler;
- (id)ss_activitySpecificExtensionItemDataRequestInfo;
- (int64_t)_defaultSortGroup;
- (int64_t)maxPreviews;
- (int64_t)userInterfaceStyle;
- (unint64_t)indexInApplicationDefinedActivities;
- (void)_loadItemProvidersFromActivityItems:(id)a3 completion:(id)a4;
- (void)_loadItemProvidersFromActivityItems:(id)a3 wantsSendCopyRepresentation:(BOOL)a4 completion:(id)a5;
- (void)_prepareWithActivityItems:(id)a3 completion:(id)a4;
- (void)activityDidFinish:(BOOL)a3 items:(id)a4 error:(id)a5;
- (void)activityDidFinish:(BOOL)completed;
- (void)performActivity;
- (void)setActivityCompletionWithItemsHandler:(id)a3;
- (void)setActivitySectionIdentifier:(id)a3;
- (void)setContentSizeCategory:(id)a3;
- (void)setDidFinishPerformingActivityHandler:(id)a3;
- (void)setIndexInApplicationDefinedActivities:(unint64_t)a3;
- (void)setMaxPreviews:(int64_t)a3;
- (void)setPreferredLocalizations:(id)a3;
- (void)setUserInterfaceStyle:(int64_t)a3;
@end

@implementation UIActivity

- (UIActivity)init
{
  v6.receiver = self;
  v6.super_class = (Class)UIActivity;
  v2 = [(UIActivity *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F29128] UUID];
    activityUUID = v2->_activityUUID;
    v2->_activityUUID = (NSUUID *)v3;

    v2->_indexInApplicationDefinedActivities = 0x7FFFFFFFFFFFFFFFLL;
  }
  return v2;
}

- (NSString)description
{
  if (self->_isInsideDescription)
  {
    uint64_t v3 = NSString;
    v12.receiver = self;
    v12.super_class = (Class)UIActivity;
    v4 = [(UIActivity *)&v12 description];
    v5 = [v3 stringWithFormat:@"%@ UIActivity-recursiveDescription>", v4];
  }
  else
  {
    self->_isInsideDescription = 1;
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      objc_super v6 = (objc_class *)objc_opt_class();
      NSStringFromClass(v6);
    }
    else
    {
      [(UIActivity *)self activityTitle];
    v4 = };
    v7 = NSString;
    v11.receiver = self;
    v11.super_class = (Class)UIActivity;
    v8 = [(UIActivity *)&v11 description];
    v9 = [(UIActivity *)self activityType];
    v5 = [v7 stringWithFormat:@"%@ activityType:%@ activityTitle:%@", v8, v9, v4];
  }
  self->_isInsideDescription = 0;
  return (NSString *)v5;
}

+ (UIActivityCategory)activityCategory
{
  return 0;
}

- (UIActivityType)activityType
{
  return 0;
}

- (NSString)activityTitle
{
  return 0;
}

- (UIImage)activityImage
{
  return 0;
}

- (BOOL)canPerformWithActivityItems:(NSArray *)activityItems
{
  return 0;
}

- (UIViewController)activityViewController
{
  return 0;
}

- (void)performActivity
{
}

- (void)activityDidFinish:(BOOL)completed
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __32__UIActivity_activityDidFinish___block_invoke;
  v3[3] = &unk_1E5A21CD0;
  v3[4] = self;
  BOOL v4 = completed;
  sh_dispatch_on_main_queue(v3);
}

uint64_t __32__UIActivity_activityDidFinish___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) activityDidFinish:*(unsigned __int8 *)(a1 + 40) items:0 error:0];
}

- (BOOL)_isBuiltinDerived
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v2 = +[_UIActivityHelper builtinActivityClasses];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v10;
    while (2)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(v2);
        }
        if (objc_opt_isKindOfClass())
        {
          BOOL v7 = 1;
          goto LABEL_11;
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
  BOOL v7 = 0;
LABEL_11:

  return v7;
}

- (BOOL)_allowsAutoCancelOnDismiss
{
  return 1;
}

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

+ (BOOL)_isCapabilityBasedActivity
{
  return 0;
}

- (id)_activityTypeUsingFallbackActivityTypeIfNecessary
{
  uint64_t v2 = [(UIActivity *)self activityType];
  if ([v2 length])
  {
    id v3 = v2;
  }
  else
  {
    id v3 = [(id)objc_opt_class() _defaultFallbackActivityType];
  }
  uint64_t v4 = v3;

  return v4;
}

+ (id)_defaultFallbackActivityType
{
  uint64_t v2 = [MEMORY[0x1E4F28B50] mainBundle];
  id v3 = [v2 bundleIdentifier];

  uint64_t v4 = (objc_class *)objc_opt_class();
  uint64_t v5 = NSStringFromClass(v4);
  objc_super v6 = [v3 stringByAppendingString:@"."];
  BOOL v7 = [v6 stringByAppendingString:v5];

  return v7;
}

- (int64_t)_defaultSortGroup
{
  if ([(id)objc_opt_class() _xpcAttributes]) {
    return 2;
  }
  if ([(UIActivity *)self indexInApplicationDefinedActivities] == 0x7FFFFFFFFFFFFFFFLL) {
    return 7;
  }
  return 3;
}

- (BOOL)_appIsDocumentTypeOwner
{
  return 0;
}

- (BOOL)_supportsOpenInPlace
{
  return 0;
}

- (id)_subjectForActivityItem:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(UIActivity *)self activityType];
  objc_super v6 = +[_UIActivityItemMapping _subjectForActivityItem:v4 activityType:v5];

  return v6;
}

- (id)_dataTypeIdentifierForActivityItem:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(UIActivity *)self activityType];
  objc_super v6 = +[_UIActivityItemMapping _dataTypeIdentifierForActivityItem:v4 activityType:v5];

  return v6;
}

- (id)_thumbnailImageForActivityItem:(id)a3
{
  id v4 = a3;
  [(UIActivity *)self _thumbnailSize];
  double v6 = v5;
  double v8 = v7;
  long long v9 = [(UIActivity *)self activityType];
  long long v10 = +[_UIActivityItemMapping _thumbnailImageForActivityItem:thumbnailSize:activityType:](_UIActivityItemMapping, "_thumbnailImageForActivityItem:thumbnailSize:activityType:", v4, v9, v6, v8);

  return v10;
}

- (id)_attachmentNameForActivityItem:(id)a3
{
  id v4 = a3;
  double v5 = [(UIActivity *)self activityType];
  double v6 = +[_UIActivityItemMapping _attachmentNameForActivityItem:v4 activityType:v5];

  return v6;
}

- (void)activityDidFinish:(BOOL)a3 items:(id)a4 error:(id)a5
{
  BOOL v6 = a3;
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = a5;
  long long v10 = share_sheet_log();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    long long v11 = @"NO";
    int v15 = 138412802;
    if (v6) {
      long long v11 = @"YES";
    }
    v16 = v11;
    __int16 v17 = 2112;
    id v18 = v8;
    __int16 v19 = 2112;
    id v20 = v9;
    _os_log_impl(&dword_1A0AD8000, v10, OS_LOG_TYPE_DEFAULT, "Called activityDidFinish:%@ items:%@ error:%@", (uint8_t *)&v15, 0x20u);
  }

  if (self->_representationCacheURL)
  {
    long long v12 = [MEMORY[0x1E4F28CB8] defaultManager];
    [v12 removeItemAtURL:self->_representationCacheURL error:0];
  }
  v13 = (void (**)(void, void, void, void))MEMORY[0x1A6229A90](self->_didFinishPerformingActivityHandler);
  id didFinishPerformingActivityHandler = self->_didFinishPerformingActivityHandler;
  self->_id didFinishPerformingActivityHandler = 0;

  if (v13) {
    ((void (**)(void, BOOL, id, id))v13)[2](v13, v6, v8, v9);
  }
}

- (BOOL)_canBeExcludeWhenMatchingWithContext:(id)a3
{
  return 1;
}

- (BOOL)_activitySupportsPromiseURLs
{
  return 0;
}

- (BOOL)_wantsThumbnailItemData
{
  return 0;
}

- (BOOL)_wantsAttachmentURLItemData
{
  return 0;
}

- (BOOL)_wantsInitialSocialText
{
  return 0;
}

+ (void)_performAfterActivityImageLoadingCompletes:(id)a3
{
  id v3 = a3;
  id v4 = share_sheet_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A0AD8000, v4, OS_LOG_TYPE_DEFAULT, "Waiting on image loading queue", buf, 2u);
  }

  double v5 = imageLoadingQueue();
  dispatch_sync(v5, &__block_literal_global_8);

  BOOL v6 = share_sheet_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)double v7 = 0;
    _os_log_impl(&dword_1A0AD8000, v6, OS_LOG_TYPE_DEFAULT, "Finished waiting on image loading queue", v7, 2u);
  }

  dispatch_async(MEMORY[0x1E4F14428], v3);
}

+ (double)imageWidthForContentSizeCategory:(id)a3
{
  id v3 = (NSString *)a3;
  id v4 = v3;
  if ((NSString *)*MEMORY[0x1E4FB27D0] == v3)
  {
    uint64_t v6 = 0x4040000000000000;
LABEL_12:
    double v5 = *(double *)&v6;
    goto LABEL_16;
  }
  if ((NSString *)*MEMORY[0x1E4FB27C8] == v3)
  {
    double v5 = 26.0;
    goto LABEL_16;
  }
  if ((NSString *)*MEMORY[0x1E4FB27E8] == v3)
  {
    double v5 = 28.0;
    goto LABEL_16;
  }
  if ((NSString *)*MEMORY[0x1E4FB27D8] == v3)
  {
    double v5 = 30.0;
    goto LABEL_16;
  }
  if ((NSString *)*MEMORY[0x1E4FB27C0] == v3)
  {
    uint64_t v6 = 0x4041000000000000;
    goto LABEL_12;
  }
  if ((NSString *)*MEMORY[0x1E4FB27B8] == v3)
  {
    uint64_t v6 = 0x4042000000000000;
    goto LABEL_12;
  }
  if ((NSString *)*MEMORY[0x1E4FB27B0] == v3)
  {
    uint64_t v6 = 0x4043000000000000;
    goto LABEL_12;
  }
  if (UIContentSizeCategoryIsAccessibilityCategory(v3)) {
    double v5 = 46.0;
  }
  else {
    double v5 = 32.0;
  }
LABEL_16:

  return v5;
}

- (void)_loadItemProvidersFromActivityItems:(id)a3 completion:(id)a4
{
}

- (void)_loadItemProvidersFromActivityItems:(id)a3 wantsSendCopyRepresentation:(BOOL)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  long long v10 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v8, "count"));
  long long v11 = _itemLoaderQueue();
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __89__UIActivity__loadItemProvidersFromActivityItems_wantsSendCopyRepresentation_completion___block_invoke;
  block[3] = &unk_1E5A21D70;
  id v16 = v8;
  __int16 v17 = self;
  BOOL v20 = a4;
  id v18 = v10;
  id v19 = v9;
  id v12 = v9;
  id v13 = v10;
  id v14 = v8;
  dispatch_async(v11, block);
}

void __89__UIActivity__loadItemProvidersFromActivityItems_wantsSendCopyRepresentation_completion___block_invoke(uint64_t a1)
{
  id v3 = *(void **)(a1 + 32);
  uint64_t v2 = *(void **)(a1 + 40);
  id v4 = (void *)v2[5];
  int v5 = *(unsigned __int8 *)(a1 + 64);
  uint64_t v6 = [v2 activityType];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __89__UIActivity__loadItemProvidersFromActivityItems_wantsSendCopyRepresentation_completion___block_invoke_2;
  v13[3] = &unk_1E5A21CF8;
  id v14 = *(id *)(a1 + 48);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __89__UIActivity__loadItemProvidersFromActivityItems_wantsSendCopyRepresentation_completion___block_invoke_3;
  v9[3] = &unk_1E5A21D48;
  int8x16_t v8 = *(int8x16_t *)(a1 + 32);
  id v7 = (id)v8.i64[0];
  int8x16_t v10 = vextq_s8(v8, v8, 8uLL);
  id v11 = *(id *)(a1 + 48);
  id v12 = *(id *)(a1 + 56);
  _loadItemProvidersFromActivityItemsStartingAtIndex(v3, 0, v4, v5, v6, v13, v9);
}

void __89__UIActivity__loadItemProvidersFromActivityItems_wantsSendCopyRepresentation_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  id v7 = _itemLoaderQueue();
  dispatch_assert_queue_V2(v7);

  id v8 = (id)objc_opt_new();
  [v8 setOriginalItem:v6];

  [v8 setResolvedItem:v5];
  [*(id *)(a1 + 32) addObject:v8];
}

void __89__UIActivity__loadItemProvidersFromActivityItems_wantsSendCopyRepresentation_completion___block_invoke_3(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 40), a2);
  id v4 = a2;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __89__UIActivity__loadItemProvidersFromActivityItems_wantsSendCopyRepresentation_completion___block_invoke_4;
  block[3] = &unk_1E5A21D20;
  id v6 = *(id *)(a1 + 40);
  id v7 = *(id *)(a1 + 48);
  id v8 = *(id *)(a1 + 56);
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __89__UIActivity__loadItemProvidersFromActivityItems_wantsSendCopyRepresentation_completion___block_invoke_4(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(*(id *)(a1 + 32), "count"));
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v3 = *(id *)(a1 + 40);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v15 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        id v9 = objc_msgSend(v8, "originalItem", (void)v14);
        int8x16_t v10 = [v8 resolvedItem];
        _updateActivityItemMappingWithResolvedActivityItem(v9, v10);

        id v11 = [v8 resolvedItem];
        [v2 addObject:v11];
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v5);
  }

  uint64_t v12 = *(void *)(a1 + 48);
  id v13 = (void *)[v2 copy];
  (*(void (**)(uint64_t, void *))(v12 + 16))(v12, v13);
}

+ (void)_loadItemProvidersFromActivityItems:(id)a3 withCacheURL:(id)a4 completion:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  int8x16_t v10 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v7, "count"));
  id v11 = _itemLoaderQueue();
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __74__UIActivity__loadItemProvidersFromActivityItems_withCacheURL_completion___block_invoke;
  v16[3] = &unk_1E5A21DE8;
  id v17 = v7;
  id v18 = v8;
  id v19 = v10;
  id v20 = v9;
  id v12 = v9;
  id v13 = v10;
  id v14 = v8;
  id v15 = v7;
  dispatch_async(v11, v16);
}

void __74__UIActivity__loadItemProvidersFromActivityItems_withCacheURL_completion___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = *(void **)(a1 + 40);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __74__UIActivity__loadItemProvidersFromActivityItems_withCacheURL_completion___block_invoke_2;
  v8[3] = &unk_1E5A21CF8;
  id v9 = *(id *)(a1 + 48);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __74__UIActivity__loadItemProvidersFromActivityItems_withCacheURL_completion___block_invoke_3;
  v4[3] = &unk_1E5A21DC0;
  id v5 = *(id *)(a1 + 32);
  id v6 = *(id *)(a1 + 48);
  id v7 = *(id *)(a1 + 56);
  _loadItemProvidersFromActivityItemsStartingAtIndex(v2, 0, v3, 1, 0, v8, v4);
}

void __74__UIActivity__loadItemProvidersFromActivityItems_withCacheURL_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  id v7 = _itemLoaderQueue();
  dispatch_assert_queue_V2(v7);

  id v8 = (id)objc_opt_new();
  [v8 setOriginalItem:v6];

  [v8 setResolvedItem:v5];
  [*(id *)(a1 + 32) addObject:v8];
}

void __74__UIActivity__loadItemProvidersFromActivityItems_withCacheURL_completion___block_invoke_3(id *a1, void *a2)
{
  id v3 = a2;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __74__UIActivity__loadItemProvidersFromActivityItems_withCacheURL_completion___block_invoke_4;
  v6[3] = &unk_1E5A21D98;
  id v7 = a1[4];
  id v8 = a1[5];
  id v4 = a1[6];
  id v9 = v3;
  id v10 = v4;
  id v5 = v3;
  dispatch_async(MEMORY[0x1E4F14428], v6);
}

void __74__UIActivity__loadItemProvidersFromActivityItems_withCacheURL_completion___block_invoke_4(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(*(id *)(a1 + 32), "count"));
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v3 = *(id *)(a1 + 40);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v15 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        id v9 = objc_msgSend(v8, "originalItem", (void)v14);
        id v10 = [v8 resolvedItem];
        _updateActivityItemMappingWithResolvedActivityItem(v9, v10);

        id v11 = [v8 resolvedItem];
        [v2 addObject:v11];
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v5);
  }

  uint64_t v12 = *(void *)(a1 + 56);
  id v13 = (void *)[v2 copy];
  (*(void (**)(uint64_t, void *, void))(v12 + 16))(v12, v13, *(void *)(a1 + 48));
}

+ (id)_stringFromActivityCategory:(int64_t)a3
{
  id v3 = @"Unknown";
  if (!a3) {
    id v3 = @"UIActivityCategoryAction";
  }
  if (a3 == 1) {
    return @"UIActivityCategoryShare";
  }
  else {
    return v3;
  }
}

- (_UIActivityResourceLoader)_activityImageLoader
{
  activityImageLoader = self->_activityImageLoader;
  if (!activityImageLoader)
  {
    id location = 0;
    objc_initWeak(&location, self);
    uint64_t v4 = [_UIActivityResourceLoader alloc];
    uint64_t v5 = imageLoadingQueue();
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __34__UIActivity__activityImageLoader__block_invoke;
    v9[3] = &unk_1E5A21E10;
    objc_copyWeak(&v10, &location);
    uint64_t v6 = [(_UIActivityResourceLoader *)v4 initWithQueue:v5 loadBlock:v9];
    id v7 = self->_activityImageLoader;
    self->_activityImageLoader = v6;

    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
    activityImageLoader = self->_activityImageLoader;
  }
  return activityImageLoader;
}

id __34__UIActivity__activityImageLoader__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v2 = [WeakRetained _activityImage];

  return v2;
}

- (_UIActivityResourceLoader)_activitySettingsImageLoader
{
  activitySettingsImageLoader = self->_activitySettingsImageLoader;
  if (!activitySettingsImageLoader)
  {
    id location = 0;
    objc_initWeak(&location, self);
    uint64_t v4 = [_UIActivityResourceLoader alloc];
    uint64_t v5 = imageLoadingQueue();
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __42__UIActivity__activitySettingsImageLoader__block_invoke;
    v9[3] = &unk_1E5A21E10;
    objc_copyWeak(&v10, &location);
    uint64_t v6 = [(_UIActivityResourceLoader *)v4 initWithQueue:v5 loadBlock:v9];
    id v7 = self->_activitySettingsImageLoader;
    self->_activitySettingsImageLoader = v6;

    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
    activitySettingsImageLoader = self->_activitySettingsImageLoader;
  }
  return activitySettingsImageLoader;
}

id __42__UIActivity__activitySettingsImageLoader__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v2 = [WeakRetained _activitySettingsImage];

  return v2;
}

- (id)_backgroundPreheatBlock
{
  return 0;
}

- (id)applicationProxy
{
  return 0;
}

- (id)_actionImage
{
  id v3 = [(UIActivity *)self _activityBundleImageConfiguration];
  if (v3)
  {
    uint64_t v4 = +[UIActivity _actionImageForBundleImageConfiguration:v3];
  }
  else
  {
    uint64_t v5 = [(UIActivity *)self activityImage];
    uint64_t v6 = [(UIActivity *)self contentSizeCategory];
    uint64_t v4 = +[UIActivity _actionImageForActionRepresentationImage:v5 contentSizeCategory:v6];
  }
  return v4;
}

+ (id)_actionImageForActionRepresentationImage:(id)a3 contentSizeCategory:(id)a4
{
  return (id)[a1 _actionImageForActionRepresentationImage:a3 contentSizeCategory:a4 monochrome:1];
}

+ (id)_actionImageForActionRepresentationImage:(id)a3 contentSizeCategory:(id)a4 monochrome:(BOOL)a5
{
  id v7 = a3;
  id v8 = a4;
  if (!v7
    || (([v7 size], v10 == *MEMORY[0x1E4F1DB30])
      ? (BOOL v11 = v9 == *(double *)(MEMORY[0x1E4F1DB30] + 8))
      : (BOOL v11 = 0),
        v11))
  {
    v28 = 0;
  }
  else
  {
    uint64_t v12 = [MEMORY[0x1E4FB1BA8] mainScreen];
    [v12 scale];
    CGFloat v14 = v13;

    +[UIActivity imageWidthForContentSizeCategory:v8];
    CGFloat v16 = v15;
    [v7 size];
    UIRectCenteredAboutPointScale();
    CGFloat v18 = v17;
    CGFloat v20 = v19;
    CGFloat v22 = v21;
    CGFloat v24 = v23;
    v32.width = v16;
    v32.height = v16;
    UIGraphicsBeginImageContextWithOptions(v32, 0, v14);
    CurrentContext = UIGraphicsGetCurrentContext();
    v30.b = 0.0;
    v30.c = 0.0;
    v30.a = 1.0;
    *(_OWORD *)&v30.d = xmmword_1A0B9FF40;
    v30.ty = v16;
    CGContextConcatCTM(CurrentContext, &v30);
    if (a5)
    {
      id v26 = [MEMORY[0x1E4FB1618] whiteColor];
      CGContextSetFillColorWithColor(CurrentContext, (CGColorRef)[v26 CGColor]);

      v33.origin.x = v18;
      v33.origin.y = v20;
      v33.size.width = v22;
      v33.size.height = v24;
      CGContextFillRect(CurrentContext, v33);
      CGContextSetBlendMode(CurrentContext, kCGBlendModeDestinationIn);
    }
    v27 = (CGImage *)[v7 CGImage];
    v34.origin.x = v18;
    v34.origin.y = v20;
    v34.size.width = v22;
    v34.size.height = v24;
    CGContextDrawImage(CurrentContext, v34, v27);
    v28 = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
  }

  return v28;
}

- (id)_actionBundleImageConfiguration
{
  return 0;
}

+ (id)_activityExtensionItemsForActivityItemValues:(id)a3 extensionItemDataRequest:(id)a4
{
  return _NSExtensionItemsFromActivityItemValuesForExtensionItemDataRequest(a3, a4);
}

+ (id)preparedActivityExtensionItemDataForActivityItemValues:(id)a3 extensionItemDataRequest:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = objc_alloc_init(UISUIActivityExtensionItemData);
  double v9 = [a1 _activityExtensionItemsForActivityItemValues:v7 extensionItemDataRequest:v6];

  [(UISUIActivityExtensionItemData *)v8 setExtensionItems:v9];
  return v8;
}

- (id)activityCompletionWithItemsHandler
{
  return self->_activityCompletionWithItemsHandler;
}

- (void)setActivityCompletionWithItemsHandler:(id)a3
{
}

- (NSString)activitySectionIdentifier
{
  return self->_activitySectionIdentifier;
}

- (void)setActivitySectionIdentifier:(id)a3
{
}

- (id)didFinishPerformingActivityHandler
{
  return self->_didFinishPerformingActivityHandler;
}

- (void)setDidFinishPerformingActivityHandler:(id)a3
{
}

- (int64_t)maxPreviews
{
  return self->_maxPreviews;
}

- (void)setMaxPreviews:(int64_t)a3
{
  self->_maxPreviews = a3;
}

- (NSString)contentSizeCategory
{
  return self->_contentSizeCategory;
}

- (void)setContentSizeCategory:(id)a3
{
}

- (int64_t)userInterfaceStyle
{
  return self->_userInterfaceStyle;
}

- (void)setUserInterfaceStyle:(int64_t)a3
{
  self->_userInterfaceStyle = a3;
}

- (NSArray)preferredLocalizations
{
  return self->_preferredLocalizations;
}

- (void)setPreferredLocalizations:(id)a3
{
}

- (unint64_t)indexInApplicationDefinedActivities
{
  return self->_indexInApplicationDefinedActivities;
}

- (void)setIndexInApplicationDefinedActivities:(unint64_t)a3
{
  self->_indexInApplicationDefinedActivities = a3;
}

- (BOOL)_showsInSystemActionGroup
{
  return self->__showsInSystemActionGroup;
}

- (NSUUID)activityUUID
{
  return self->_activityUUID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activityUUID, 0);
  objc_storeStrong((id *)&self->_preferredLocalizations, 0);
  objc_storeStrong((id *)&self->_contentSizeCategory, 0);
  objc_storeStrong(&self->_didFinishPerformingActivityHandler, 0);
  objc_storeStrong((id *)&self->_activitySectionIdentifier, 0);
  objc_storeStrong(&self->_activityCompletionWithItemsHandler, 0);
  objc_storeStrong((id *)&self->_representationCacheURL, 0);
  objc_storeStrong((id *)&self->_activitySettingsImageLoader, 0);
  objc_storeStrong((id *)&self->_activityImageLoader, 0);
}

+ (id)_activityImageForApplicationBundleIdentifier:(id)a3 userInterfaceStyle:(int64_t)a4
{
  return _UIActivityImageForBundleIdentifier(a3, 10, a4);
}

+ (id)_activitySettingsImageForApplicationBundleIdentifier:(id)a3 userInterfaceStyle:(int64_t)a4
{
  return _UIActivityImageForBundleIdentifier(a3, 0, a4);
}

+ (id)_actionImageForBundleImageConfiguration:(id)a3
{
  id v3 = [a3 fetchedImage];
  uint64_t v4 = +[UIActivity _actionImageForActionRepresentationImage:v3 contentSizeCategory:0];

  return v4;
}

+ (id)_activityImageForBundleImageConfiguration:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 fetchedImage];
  uint64_t v5 = [v3 activityCategory];

  id v6 = +[UIActivity _imageByApplyingDefaultEffectsToImage:v4 activityCategory:v5 iconFormat:10];

  return v6;
}

+ (id)_activitySettingsImageForBundleImageConfiguration:(id)a3
{
  id v3 = [a3 fetchedImage];
  uint64_t v4 = [MEMORY[0x1E4FB1BA8] mainScreen];
  [v4 scale];
  double v6 = v5;

  id v7 = [v3 _applicationIconImageForFormat:0 precomposed:0 scale:v6];

  return v7;
}

+ (id)_imageByApplyingDefaultEffectsToImage:(id)a3 activityCategory:(int64_t)a4 iconFormat:(int)a5
{
  id v6 = a3;
  char v7 = dyld_program_sdk_at_least();
  if (a4 && (v7 & 1) != 0)
  {
    id v8 = v6;
  }
  else
  {
    id v8 = +[UIActivity _activityImageForActionRepresentationImage:v6];
  }
  double v9 = v8;

  return v9;
}

+ (id)_activityImageForActionRepresentationImage:(id)a3
{
  id v3 = a3;
  uint64_t v4 = v3;
  if (_activityImageForActionRepresentationImage__once == -1)
  {
    if (!v3) {
      goto LABEL_9;
    }
  }
  else
  {
    dispatch_once(&_activityImageForActionRepresentationImage__once, &__block_literal_global_361);
    if (!v4) {
      goto LABEL_9;
    }
  }
  [v4 size];
  if (v6 != *MEMORY[0x1E4F1DB30] || v5 != *(double *)(MEMORY[0x1E4F1DB30] + 8))
  {
    [(id)_activityImageForActionRepresentationImage____chickletImage size];
    CGFloat v9 = v8;
    CGFloat v11 = v10;
    [(id)_activityImageForActionRepresentationImage____chickletImage scale];
    CGFloat v13 = v12;
    [v4 size];
    UIRectCenteredAboutPointScale();
    CGFloat v15 = v14;
    CGFloat v17 = v16;
    CGFloat v19 = v18;
    CGFloat v21 = v20;
    v29.width = v9;
    v29.height = v11;
    UIGraphicsBeginImageContextWithOptions(v29, 0, v13);
    CurrentContext = UIGraphicsGetCurrentContext();
    v27.b = 0.0;
    v27.c = 0.0;
    v27.a = 1.0;
    *(_OWORD *)&v27.d = xmmword_1A0B9FF40;
    v27.ty = v11;
    CGContextConcatCTM(CurrentContext, &v27);
    objc_msgSend((id)_activityImageForActionRepresentationImage____chickletImage, "drawAtPoint:blendMode:alpha:", 17, *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8), 1.0);
    double v23 = (CGImage *)[(id)_activityImageForActionRepresentationImage____chickletImage CGImage];
    v30.origin.x = 0.0;
    v30.origin.y = 0.0;
    v30.size.width = v9;
    v30.size.height = v11;
    CGContextClipToMask(CurrentContext, v30, v23);
    CGFloat v24 = (CGImage *)[v4 CGImage];
    v31.origin.x = v15;
    v31.origin.y = v17;
    v31.size.width = v19;
    v31.size.height = v21;
    CGContextClipToMask(CurrentContext, v31, v24);
    [(id)_activityImageForActionRepresentationImage____imageTintColor set];
    v32.origin.x = 0.0;
    v32.origin.y = 0.0;
    v32.size.width = v9;
    v32.size.height = v11;
    UIRectFill(v32);
    UIGraphicsGetImageFromCurrentImageContext();
    id v25 = (id)objc_claimAutoreleasedReturnValue();
    UIGraphicsEndImageContext();
    goto LABEL_10;
  }
LABEL_9:
  id v25 = (id)_activityImageForActionRepresentationImage____chickletImage;
LABEL_10:

  return v25;
}

void __77__UIActivity_UIActivity_Private___activityImageForActionRepresentationImage___block_invoke()
{
  v14[2] = *MEMORY[0x1E4F143B8];
  v0 = (void *)MEMORY[0x1E4FB1E20];
  v1 = [MEMORY[0x1E4FB1BA8] mainScreen];
  uint64_t v2 = [v1 traitCollection];
  v14[0] = v2;
  id v3 = (void *)MEMORY[0x1E4FB1E20];
  uint64_t v4 = [MEMORY[0x1E4FB16C8] currentDevice];
  double v5 = objc_msgSend(v3, "traitCollectionWithUserInterfaceIdiom:", objc_msgSend(v4, "userInterfaceIdiom"));
  v14[1] = v5;
  double v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:2];
  char v7 = [v0 traitCollectionWithTraitsFromCollections:v6];

  double v8 = (void *)MEMORY[0x1E4FB1818];
  CGFloat v9 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  uint64_t v10 = [v8 imageNamed:@"UIActivityRoundedCornerButtonBackground" inBundle:v9 compatibleWithTraitCollection:v7];
  CGFloat v11 = (void *)_activityImageForActionRepresentationImage____chickletImage;
  _activityImageForActionRepresentationImage____chickletImage = v10;

  uint64_t v12 = [MEMORY[0x1E4FB1618] colorWithRed:0.40625 green:0.40625 blue:0.44140625 alpha:1.0];
  CGFloat v13 = (void *)_activityImageForActionRepresentationImage____imageTintColor;
  _activityImageForActionRepresentationImage____imageTintColor = v12;
}

- (NSExtension)applicationExtension
{
  return 0;
}

- (id)_bundleIdentifierForActivityImageCreation
{
  return 0;
}

- (id)_activityBundleImageConfiguration
{
  return 0;
}

- (id)_activitySettingsBundleImageConfiguration
{
  return 0;
}

- (id)_systemImageName
{
  return 0;
}

- (id)_activityImageUTI
{
  return 0;
}

- (id)_activityImage
{
  id v3 = [(UIActivity *)self _bundleIdentifierForActivityImageCreation];
  if ([v3 length])
  {
    uint64_t v4 = +[UIActivity _activityImageForApplicationBundleIdentifier:v3 userInterfaceStyle:[(UIActivity *)self userInterfaceStyle]];
  }
  else
  {
    double v5 = [(UIActivity *)self _activityBundleImageConfiguration];
    if (v5)
    {
      uint64_t v4 = +[UIActivity _activityImageForBundleImageConfiguration:v5];
    }
    else
    {
      double v6 = [(UIActivity *)self activityImage];
      uint64_t v4 = +[UIActivity _imageByApplyingDefaultEffectsToImage:activityCategory:iconFormat:](UIActivity, "_imageByApplyingDefaultEffectsToImage:activityCategory:iconFormat:", v6, [(id)objc_opt_class() activityCategory], 10);
    }
  }

  return v4;
}

- (id)_activitySettingsImage
{
  id v3 = [(UIActivity *)self _bundleIdentifierForActivityImageCreation];
  if (v3)
  {
    uint64_t v4 = +[UIActivity _activitySettingsImageForApplicationBundleIdentifier:v3 userInterfaceStyle:[(UIActivity *)self userInterfaceStyle]];
  }
  else
  {
    double v5 = [(UIActivity *)self _activitySettingsBundleImageConfiguration];
    if (v5)
    {
      uint64_t v4 = +[UIActivity _activitySettingsImageForBundleImageConfiguration:v5];
    }
    else
    {
      uint64_t v4 = 0;
    }
  }
  return v4;
}

- (BOOL)_wantsOriginalImageColor
{
  return 0;
}

- (id)_beforeActivity
{
  return 0;
}

- (NSString)_activitySubtitle
{
  return 0;
}

- (BOOL)_isDisabled
{
  return 0;
}

- (NSString)_activityBadgeText
{
  return 0;
}

- (UIColor)_activityBadgeColor
{
  return 0;
}

- (UIColor)_activityBadgeTextColor
{
  return 0;
}

- (UIImage)_activityStatusImage
{
  return 0;
}

- (UIColor)_activityStatusTintColor
{
  return 0;
}

- (NSAttributedString)_activityFooterText
{
  return 0;
}

- (NSString)_heroActionTitle
{
  return 0;
}

- (id)_embeddedActivityViewController
{
  return 0;
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

- (BOOL)_needsResolvedActivityItems
{
  return 1;
}

- (void)_prepareWithActivityItems:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id location = 0;
  objc_initWeak(&location, self);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __71__UIActivity_UIActivity_Private___prepareWithActivityItems_completion___block_invoke;
  v9[3] = &unk_1E5A21E38;
  objc_copyWeak(&v11, &location);
  id v8 = v7;
  id v10 = v8;
  [(UIActivity *)self _loadItemProvidersFromActivityItems:v6 completion:v9];

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

uint64_t __71__UIActivity_UIActivity_Private___prepareWithActivityItems_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = (id *)(a1 + 40);
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained(v3);
  [WeakRetained prepareWithActivityItems:v4];

  id v6 = *(uint64_t (**)(void))(*(void *)(a1 + 32) + 16);
  return v6();
}

- (CGSize)_thumbnailSize
{
  double v2 = *MEMORY[0x1E4F1DB30];
  double v3 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  result.height = v3;
  result.width = v2;
  return result;
}

+ (int64_t)_activityStyle
{
  return 0;
}

- (BOOL)ss_shouldExecuteInShareSheet
{
  return 0;
}

- (BOOL)ss_shouldDismissHostsPresentationBeforePerforming
{
  return 1;
}

- (id)ss_activitySpecificExtensionItemDataRequestInfo
{
  return 0;
}

- (BOOL)_isExecutedInProcess
{
  return 1;
}

@end