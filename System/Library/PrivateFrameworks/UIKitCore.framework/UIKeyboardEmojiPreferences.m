@interface UIKeyboardEmojiPreferences
+ (id)sharedInstance;
- (BOOL)deviceSupportsMemoji;
- (BOOL)hasCheckedMemojiPreference;
- (BOOL)hasDisplayedSkinToneHelp;
- (BOOL)hasLastUsedVariantForEmojiString:(id)a3;
- (BOOL)memojiSettingEnabled;
- (BOOL)shouldShowRecents;
- (BOOL)supportsMemoji;
- (EMFEmojiPreferencesClient)preferencesClient;
- (NSArray)recents;
- (NSDictionary)skinToneBaseKeyPreferences;
- (UIKeyboardEmojiPreferences)init;
- (id)emojiWithoutDuplicateRecents:(id)a3;
- (id)lastUsedVariantEmojiForEmojiString:(id)a3;
- (id)recentEmojiAtIndex:(int64_t)a3 size:(unint64_t *)a4;
- (id)typingNameForEmoji:(id)a3 language:(id)a4;
- (int64_t)emojiCategoryDefaultsIndex:(id)a3;
- (int64_t)selectedCategoryType;
- (unint64_t)maximumRecentsCount;
- (void)_updateCachedDeviceLockState;
- (void)_usageForEmoji:(id)a3 language:(id)a4 associatedText:(id)a5 resultIndex:(id)a6 isFromRecentsCategory:(BOOL)a7 isFromEmojiSearch:(BOOL)a8 isFromCandidateBar:(BOOL)a9 completionHandler:(id)a10;
- (void)clearEmojiKeyboardPreferenceClient;
- (void)clearLocalRecentsCache;
- (void)dealloc;
- (void)didDisplaySkinToneHelp;
- (void)emojiPredicted:(id)a3 typingName:(id)a4 language:(id)a5;
- (void)emojiUsed:(id)a3;
- (void)emojiUsed:(id)a3 language:(id)a4;
- (void)emojiUsed:(id)a3 language:(id)a4 completion:(id)a5;
- (void)emojiUsedFromEmojiKeyboardPalette:(id)a3 inputModeIdentifier:(id)a4 completionHandler:(id)a5;
- (void)emojiUsedFromEmojiKeyboardSearch:(id)a3 inputModeIdentifier:(id)a4 resultIndex:(id)a5 query:(id)a6 completionHandler:(id)a7;
- (void)handleBackground:(id)a3;
- (void)handleRead:(id)a3;
- (void)handleWrite:(id)a3;
- (void)preferencesControllerChanged:(id)a3;
- (void)readEmojiDefaults;
- (void)refreshLocalRecents;
- (void)setEmojiCategoryDefaultsIndex:(int64_t)a3 forCategory:(id)a4;
- (void)setHasCheckedMemojiPreference:(BOOL)a3;
- (void)setMaximumRecentsCount:(unint64_t)a3;
- (void)setSupportsMemoji:(BOOL)a3;
- (void)writeEmojiDefaults;
@end

@implementation UIKeyboardEmojiPreferences

+ (id)sharedInstance
{
  if (qword_1EB261B78 != -1) {
    dispatch_once(&qword_1EB261B78, &__block_literal_global_346);
  }
  v2 = (void *)qword_1EB261B70;
  return v2;
}

void __44__UIKeyboardEmojiPreferences_sharedInstance__block_invoke()
{
  v0 = objc_alloc_init(UIKeyboardEmojiPreferences);
  v1 = (void *)qword_1EB261B70;
  qword_1EB261B70 = (uint64_t)v0;
}

- (void)readEmojiDefaults
{
}

- (void)writeEmojiDefaults
{
}

- (UIKeyboardEmojiPreferences)init
{
  v14.receiver = self;
  v14.super_class = (Class)UIKeyboardEmojiPreferences;
  v2 = [(UIKeyboardEmojiPreferences *)&v14 init];
  if (v2)
  {
    uint64_t v3 = [objc_alloc((Class)getEMFEmojiPreferencesClientClass()) _initWithoutConnection];
    preferencesClient = v2->_preferencesClient;
    v2->_preferencesClient = (EMFEmojiPreferencesClient *)v3;

    v5 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UTILITY, 0);
    dispatch_queue_t v6 = dispatch_queue_create("com.apple.UIKit.emoji-client", v5);
    clientDispatchQueue = v2->_clientDispatchQueue;
    v2->_clientDispatchQueue = (OS_dispatch_queue *)v6;

    v8 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v8 addObserver:v2 selector:sel_handleSuspend_ name:@"UIApplicationSuspendedNotification" object:0];
    [v8 addObserver:v2 selector:sel_handleWrite_ name:@"UIKeyboardWillHideNotification" object:0];
    [v8 addObserver:v2 selector:sel_handleWrite_ name:@"UIKeyboardWillChangeFrameNotification" object:0];
    [v8 addObserver:v2 selector:sel_handleRead_ name:@"UIApplicationWillEnterForegroundNotification" object:0];
    [v8 addObserver:v2 selector:sel_handleRead_ name:@"UIKeyboardWillShowNotification" object:0];
    [v8 addObserver:v2 selector:sel_handleBackground_ name:@"UIApplicationDidEnterBackgroundNotification" object:0];
    [v8 addObserver:v2 selector:sel_preferencesControllerChanged_ name:*MEMORY[0x1E4FAEA28] object:0];
    [(EMFEmojiPreferencesClient *)v2->_preferencesClient readEmojiDefaults];
    localRecentsWithClient = v2->_localRecentsWithClient;
    v2->_localRecentsWithClient = 0;

    localRecentsWithoutClient = v2->_localRecentsWithoutClient;
    v2->_localRecentsWithoutClient = 0;

    v11 = +[UIKeyboardInputModeController sharedInputModeController];
    v2->_deviceWasLockedWhenKeyboardWasShown = [v11 deviceStateIsLocked];

    v12 = v2;
  }

  return v2;
}

- (void)dealloc
{
  v10[5] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  v10[0] = @"UIApplicationSuspendedNotification";
  v10[1] = @"UIKeyboardWillHideNotification";
  v10[2] = @"UIKeyboardWillChangeFrameNotification";
  v10[3] = @"UIApplicationWillEnterForegroundNotification";
  v10[4] = @"UIKeyboardWillShowNotification";
  v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:5];
  -[NSNotificationCenter _uiRemoveObserver:names:](v3, self, v4);

  [(UIKeyboardEmojiPreferences *)self writeEmojiDefaults];
  preferencesClient = self->_preferencesClient;
  self->_preferencesClient = 0;

  localRecentsWithClient = self->_localRecentsWithClient;
  self->_localRecentsWithClient = 0;

  localRecentsWithoutClient = self->_localRecentsWithoutClient;
  self->_localRecentsWithoutClient = 0;

  clientDispatchQueue = self->_clientDispatchQueue;
  self->_clientDispatchQueue = 0;

  v9.receiver = self;
  v9.super_class = (Class)UIKeyboardEmojiPreferences;
  [(UIKeyboardEmojiPreferences *)&v9 dealloc];
}

- (void)clearEmojiKeyboardPreferenceClient
{
  [(UIKeyboardEmojiPreferences *)self writeEmojiDefaults];
  [(UIKeyboardEmojiPreferences *)self clearLocalRecentsCache];
  preferencesClient = self->_preferencesClient;
  self->_preferencesClient = 0;
}

- (void)handleWrite:(id)a3
{
  id v9 = a3;
  v4 = [v9 userInfo];
  v5 = [v4 objectForKey:@"UIKeyboardIsLocalUserInfoKey"];
  char v6 = [v5 BOOLValue];

  if ((v6 & 1) != 0
    || ([v9 name],
        v7 = objc_claimAutoreleasedReturnValue(),
        int v8 = [v7 isEqualToString:@"UIKeyboardWillChangeFrameNotification"],
        v7,
        v8))
  {
    [(UIKeyboardEmojiPreferences *)self writeEmojiDefaults];
  }
}

- (void)handleRead:(id)a3
{
  [(UIKeyboardEmojiPreferences *)self readEmojiDefaults];
  [(UIKeyboardEmojiPreferences *)self _updateCachedDeviceLockState];
}

- (void)handleBackground:(id)a3
{
}

- (EMFEmojiPreferencesClient)preferencesClient
{
  preferencesClient = self->_preferencesClient;
  if (!preferencesClient)
  {
    v4 = (EMFEmojiPreferencesClient *)[objc_alloc((Class)getEMFEmojiPreferencesClientClass()) _initWithoutConnection];
    v5 = self->_preferencesClient;
    self->_preferencesClient = v4;

    preferencesClient = self->_preferencesClient;
  }
  return preferencesClient;
}

- (BOOL)hasDisplayedSkinToneHelp
{
  v2 = [(UIKeyboardEmojiPreferences *)self preferencesClient];
  char v3 = [v2 hasDisplayedSkinToneHelp];

  return v3;
}

- (void)didDisplaySkinToneHelp
{
  id v2 = [(UIKeyboardEmojiPreferences *)self preferencesClient];
  [v2 didDisplaySkinToneHelp];
}

- (unint64_t)maximumRecentsCount
{
  id v2 = [(UIKeyboardEmojiPreferences *)self preferencesClient];
  unint64_t v3 = [v2 maximumRecentsCount];

  return v3;
}

- (void)setMaximumRecentsCount:(unint64_t)a3
{
  id v4 = [(UIKeyboardEmojiPreferences *)self preferencesClient];
  [v4 setMaximumRecentsCount:a3];
}

- (void)setEmojiCategoryDefaultsIndex:(int64_t)a3 forCategory:(id)a4
{
  id v6 = a4;
  id v9 = [(UIKeyboardEmojiPreferences *)self preferencesClient];
  uint64_t v7 = [v6 categoryType];

  int v8 = +[UIKeyboardEmojiCategory emojiCategoryStringForCategoryType:v7];
  [v9 didViewEmojiIndex:a3 forCategory:v8];
}

- (int64_t)emojiCategoryDefaultsIndex:(id)a3
{
  id v4 = a3;
  v5 = [(UIKeyboardEmojiPreferences *)self preferencesClient];
  uint64_t v6 = [v4 categoryType];

  uint64_t v7 = +[UIKeyboardEmojiCategory emojiCategoryStringForCategoryType:v6];
  int64_t v8 = [v5 previouslyUsedIndexInCategory:v7];

  return v8;
}

- (NSArray)recents
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  uint64_t v17 = 0;
  v18 = &v17;
  uint64_t v19 = 0x2050000000;
  id v2 = (void *)getEMFEmojiPreferencesClass_softClass;
  uint64_t v20 = getEMFEmojiPreferencesClass_softClass;
  if (!getEMFEmojiPreferencesClass_softClass)
  {
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __getEMFEmojiPreferencesClass_block_invoke;
    v16[3] = &unk_1E52D9900;
    v16[4] = &v17;
    __getEMFEmojiPreferencesClass_block_invoke((uint64_t)v16);
    id v2 = (void *)v18[3];
  }
  id v3 = v2;
  _Block_object_dispose(&v17, 8);
  id v4 = [v3 _recentEmojiStrings];
  v5 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v4, "count"));
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v21 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v6);
        }
        v10 = +[UIKeyboardEmoji emojiWithString:withVariantMask:](UIKeyboardEmoji, "emojiWithString:withVariantMask:", *(void *)(*((void *)&v12 + 1) + 8 * i), +[UIKeyboardEmojiCategory hasVariantsForEmoji:](UIKeyboardEmojiCategory, "hasVariantsForEmoji:", *(void *)(*((void *)&v12 + 1) + 8 * i), (void)v12));
        [v5 addObject:v10];
      }
      uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v21 count:16];
    }
    while (v7);
  }

  return (NSArray *)v5;
}

- (void)clearLocalRecentsCache
{
  localRecentsWithClient = self->_localRecentsWithClient;
  self->_localRecentsWithClient = 0;

  localRecentsWithoutClient = self->_localRecentsWithoutClient;
  self->_localRecentsWithoutClient = 0;
}

- (void)refreshLocalRecents
{
  id v3 = [(UIKeyboardEmojiPreferences *)self preferencesClient];
  if (v3)
  {
    id v4 = [(UIKeyboardEmojiPreferences *)self preferencesClient];
    v5 = [v4 recentEmojis];
    id v6 = (NSArray *)[v5 copy];
    localRecentsWithClient = self->_localRecentsWithClient;
    self->_localRecentsWithClient = v6;
  }
  else
  {
    id v4 = self->_localRecentsWithClient;
    self->_localRecentsWithClient = 0;
  }

  id v10 = [(UIKeyboardEmojiPreferences *)self recents];
  uint64_t v8 = (NSArray *)[v10 copy];
  localRecentsWithoutClient = self->_localRecentsWithoutClient;
  self->_localRecentsWithoutClient = v8;
}

- (id)recentEmojiAtIndex:(int64_t)a3 size:(unint64_t *)a4
{
  uint64_t v7 = [(UIKeyboardEmojiPreferences *)self preferencesClient];

  if (!v7)
  {
    v11 = self->_localRecentsWithoutClient;
    id v9 = v11;
    if (a4) {
      *a4 = [(NSArray *)v11 count];
    }
    if ([v9 count] <= (unint64_t)a3)
    {
      id v10 = 0;
    }
    else
    {
      long long v12 = [v9 objectAtIndex:a3];
      id v10 = [v12 emojiString];
    }
    goto LABEL_15;
  }
  localRecentsWithClient = self->_localRecentsWithClient;
  if (!localRecentsWithClient)
  {
    long long v13 = [(UIKeyboardEmojiPreferences *)self preferencesClient];
    long long v14 = [v13 recentEmojis];
    long long v15 = (NSArray *)[v14 copy];
    v16 = self->_localRecentsWithClient;
    self->_localRecentsWithClient = v15;

    localRecentsWithClient = self->_localRecentsWithClient;
    if (!a4) {
      goto LABEL_5;
    }
    goto LABEL_4;
  }
  if (a4)
  {
LABEL_4:
    *a4 = [(NSArray *)localRecentsWithClient count];
    localRecentsWithClient = self->_localRecentsWithClient;
  }
LABEL_5:
  if ([(NSArray *)localRecentsWithClient count] <= a3)
  {
    id v10 = 0;
    goto LABEL_16;
  }
  id v9 = [(NSArray *)self->_localRecentsWithClient objectAtIndex:a3];
  id v10 = [v9 string];
LABEL_15:

LABEL_16:
  return v10;
}

- (BOOL)shouldShowRecents
{
  return !self->_deviceWasLockedWhenKeyboardWasShown;
}

- (BOOL)memojiSettingEnabled
{
  if (![(UIKeyboardEmojiPreferences *)self hasCheckedMemojiPreference])
  {
    id v3 = +[UIKeyboardPreferencesController sharedPreferencesController];
    id v4 = [v3 preferencesActions];
    -[UIKeyboardEmojiPreferences setSupportsMemoji:](self, "setSupportsMemoji:", [v4 BOOLForPreferenceKey:@"ShowStickers"]);

    [(UIKeyboardEmojiPreferences *)self setHasCheckedMemojiPreference:1];
  }
  return [(UIKeyboardEmojiPreferences *)self supportsMemoji];
}

- (void)preferencesControllerChanged:(id)a3
{
}

- (BOOL)deviceSupportsMemoji
{
  if (qword_1EB261B80 != -1) {
    dispatch_once(&qword_1EB261B80, &__block_literal_global_185_0);
  }
  if (_MergedGlobals_1135)
  {
    id v2 = +[UIKeyboard keyboardBundleIdentifier];
    if ([v2 isEqualToString:@"com.apple.springboard"]) {
      LOBYTE(v3) = 0;
    }
    else {
      int v3 = [v2 isEqualToString:@"com.apple.MobileSMS.MessagesNotificationExtension"] ^ 1;
    }
  }
  else
  {
    LOBYTE(v3) = 0;
  }
  return v3;
}

- (id)emojiWithoutDuplicateRecents:(id)a3
{
  id v4 = a3;
  if (!self->_preferencesClient) {
    goto LABEL_6;
  }
  localRecentsWithClient = self->_localRecentsWithClient;
  if (!localRecentsWithClient)
  {
    id v6 = [MEMORY[0x1E4F1C978] array];
    if (v6) {
      goto LABEL_5;
    }
LABEL_6:
    localRecentsWithoutClient = self->_localRecentsWithoutClient;
    if (localRecentsWithoutClient)
    {
      id v9 = localRecentsWithoutClient;
    }
    else
    {
      id v9 = [MEMORY[0x1E4F1C978] array];
    }
    uint64_t v7 = v9;
    id v6 = 0;
    goto LABEL_10;
  }
  id v6 = localRecentsWithClient;
LABEL_5:
  uint64_t v7 = 0;
LABEL_10:
  uint64_t v15 = MEMORY[0x1E4F143A8];
  uint64_t v16 = 3221225472;
  uint64_t v17 = __59__UIKeyboardEmojiPreferences_emojiWithoutDuplicateRecents___block_invoke;
  v18 = &unk_1E52FBC90;
  uint64_t v19 = v7;
  uint64_t v20 = v6;
  id v10 = v6;
  v11 = v7;
  long long v12 = [v4 indexesOfObjectsPassingTest:&v15];
  long long v13 = objc_msgSend(v4, "objectsAtIndexes:", v12, v15, v16, v17, v18);

  return v13;
}

uint64_t __59__UIKeyboardEmojiPreferences_emojiWithoutDuplicateRecents___block_invoke(uint64_t a1, void *a2)
{
  int v3 = *(void **)(a1 + 32);
  id v4 = a2;
  v5 = v4;
  if (v3)
  {
    id v6 = [v4 emojiString];

    uint64_t v7 = v3;
  }
  else
  {
    id EMFEmojiTokenClass_0 = getEMFEmojiTokenClass_0();
    id v9 = [v5 emojiString];

    id v6 = [EMFEmojiTokenClass_0 emojiTokenWithString:v9 localeData:0];

    uint64_t v7 = *(void **)(a1 + 40);
  }
  int v10 = [v7 containsObject:v6];

  return v10 ^ 1u;
}

- (NSDictionary)skinToneBaseKeyPreferences
{
  return 0;
}

- (BOOL)hasLastUsedVariantForEmojiString:(id)a3
{
  id v4 = a3;
  v5 = [getEMFEmojiTokenClass_0() emojiTokenWithString:v4 localeData:0];

  id v6 = [(UIKeyboardEmojiPreferences *)self preferencesClient];
  LOBYTE(v4) = [v6 hasLastUsedVariantForEmoji:v5];

  return (char)v4;
}

- (id)lastUsedVariantEmojiForEmojiString:(id)a3
{
  id v4 = a3;
  v5 = [getEMFEmojiTokenClass_0() emojiTokenWithString:v4 localeData:0];
  if ([v5 supportsSkinToneVariants])
  {
    id v6 = [(UIKeyboardEmojiPreferences *)self preferencesClient];
    uint64_t v7 = [v6 lastUsedVariantEmojiForEmoji:v5];

    id v8 = [v7 string];
  }
  else
  {
    id v8 = v4;
  }

  return v8;
}

- (int64_t)selectedCategoryType
{
  id v2 = [(UIKeyboardEmojiPreferences *)self preferencesClient];
  int v3 = [v2 previouslyUsedCategory];
  int64_t v4 = +[UIKeyboardEmojiCategory emojiCategoryTypeForCategoryString:v3];

  return v4;
}

- (void)emojiUsed:(id)a3
{
}

- (void)emojiUsed:(id)a3 language:(id)a4
{
}

- (void)emojiUsed:(id)a3 language:(id)a4 completion:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = TIStatisticGetKey();
  TIStatisticScalarIncrement();

  clientDispatchQueue = self->_clientDispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __60__UIKeyboardEmojiPreferences_emojiUsed_language_completion___block_invoke;
  block[3] = &unk_1E52DCB30;
  block[4] = self;
  id v14 = v7;
  id v15 = v8;
  id v11 = v8;
  id v12 = v7;
  dispatch_async(clientDispatchQueue, block);
}

void __60__UIKeyboardEmojiPreferences_emojiUsed_language_completion___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  id v4 = [*(id *)(a1 + 40) emojiString];
  LOBYTE(v3) = 0;
  objc_msgSend(v2, "_usageForEmoji:language:associatedText:resultIndex:isFromRecentsCategory:isFromEmojiSearch:isFromCandidateBar:completionHandler:", v4, *(void *)(a1 + 48), 0, 0, objc_msgSend(*(id *)(a1 + 40), "isFromRecentsCategory"), objc_msgSend(*(id *)(a1 + 40), "isFromEmojiSearch"), v3, 0);
}

- (void)emojiPredicted:(id)a3 typingName:(id)a4 language:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v12 = a3;
  int v10 = TIStatisticGetKey();
  TIStatisticScalarIncrement();

  LOBYTE(v11) = 1;
  [(UIKeyboardEmojiPreferences *)self _usageForEmoji:v12 language:v8 associatedText:v9 resultIndex:0 isFromRecentsCategory:0 isFromEmojiSearch:0 isFromCandidateBar:v11 completionHandler:0];
}

- (id)typingNameForEmoji:(id)a3 language:(id)a4
{
  id v6 = a3;
  if (a4)
  {
    id v7 = a4;
    a4 = [getEMFEmojiLocaleDataClass() emojiLocaleDataWithLocaleIdentifier:v7];
  }
  id v8 = [getEMFEmojiTokenClass_0() emojiTokenWithString:v6 localeData:a4];
  id v9 = [(UIKeyboardEmojiPreferences *)self preferencesClient];
  int v10 = [v9 typingNameForEmoji:v8];

  return v10;
}

- (void)emojiUsedFromEmojiKeyboardPalette:(id)a3 inputModeIdentifier:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = TIStatisticGetKey();
  TIStatisticScalarIncrement();

  clientDispatchQueue = self->_clientDispatchQueue;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __102__UIKeyboardEmojiPreferences_emojiUsedFromEmojiKeyboardPalette_inputModeIdentifier_completionHandler___block_invoke;
  v16[3] = &unk_1E52DC7E8;
  v16[4] = self;
  id v17 = v8;
  id v18 = v9;
  id v19 = v10;
  id v13 = v10;
  id v14 = v9;
  id v15 = v8;
  dispatch_async(clientDispatchQueue, v16);
}

void __102__UIKeyboardEmojiPreferences_emojiUsedFromEmojiKeyboardPalette_inputModeIdentifier_completionHandler___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  id v4 = [*(id *)(a1 + 40) emojiString];
  LOBYTE(v3) = 0;
  objc_msgSend(v2, "_usageForEmoji:language:associatedText:resultIndex:isFromRecentsCategory:isFromEmojiSearch:isFromCandidateBar:completionHandler:", v4, *(void *)(a1 + 48), 0, 0, objc_msgSend(*(id *)(a1 + 40), "isFromRecentsCategory"), 0, v3, *(void *)(a1 + 56));
}

- (void)emojiUsedFromEmojiKeyboardSearch:(id)a3 inputModeIdentifier:(id)a4 resultIndex:(id)a5 query:(id)a6 completionHandler:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  clientDispatchQueue = self->_clientDispatchQueue;
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __119__UIKeyboardEmojiPreferences_emojiUsedFromEmojiKeyboardSearch_inputModeIdentifier_resultIndex_query_completionHandler___block_invoke;
  v23[3] = &unk_1E52FBCB8;
  v23[4] = self;
  id v24 = v12;
  id v25 = v13;
  id v26 = v15;
  id v27 = v14;
  id v28 = v16;
  id v18 = v16;
  id v19 = v14;
  id v20 = v15;
  id v21 = v13;
  id v22 = v12;
  dispatch_async(clientDispatchQueue, v23);
}

void __119__UIKeyboardEmojiPreferences_emojiUsedFromEmojiKeyboardSearch_inputModeIdentifier_resultIndex_query_completionHandler___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  id v4 = [*(id *)(a1 + 40) emojiString];
  LOBYTE(v3) = 0;
  [v2 _usageForEmoji:v4 language:*(void *)(a1 + 48) associatedText:*(void *)(a1 + 56) resultIndex:*(void *)(a1 + 64) isFromRecentsCategory:0 isFromEmojiSearch:1 isFromCandidateBar:v3 completionHandler:*(void *)(a1 + 72)];
}

- (void)_usageForEmoji:(id)a3 language:(id)a4 associatedText:(id)a5 resultIndex:(id)a6 isFromRecentsCategory:(BOOL)a7 isFromEmojiSearch:(BOOL)a8 isFromCandidateBar:(BOOL)a9 completionHandler:(id)a10
{
  BOOL v10 = a8;
  BOOL v11 = a7;
  id v30 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a10;
  if (v16)
  {
    id v20 = [getEMFEmojiLocaleDataClass() emojiLocaleDataWithLocaleIdentifier:v16];
  }
  else
  {
    id v20 = 0;
  }
  id v21 = [getEMFEmojiTokenClass_0() emojiTokenWithString:v30 localeData:v20];
  if (v21)
  {
    id v29 = v18;
    id v22 = v17;
    BOOL v23 = v11;
    id v24 = [(UIKeyboardEmojiPreferences *)self preferencesClient];
    id v25 = v24;
    if (v10)
    {
      id v17 = v22;
      id v26 = v22;
      id v18 = v29;
      [v24 didUseEmojiInEmojiKeyboardSearch:v21 finalQuery:v26 resultIndex:v29];
    }
    else if (a9)
    {
      char v27 = objc_opt_respondsToSelector();

      id v28 = [(UIKeyboardEmojiPreferences *)self preferencesClient];
      id v25 = v28;
      id v17 = v22;
      id v18 = v29;
      if (v27) {
        [v28 didUseEmojiInKeyboardCandidateBar:v21 candidatePosition:v29 replacementContext:v17];
      }
      else {
        [v28 didUseEmojiInKeyboardCandidateBar:v21 replacementContext:v17];
      }
    }
    else
    {
      [v24 didUseEmojiInEmojiKeyboardPalette:v21 wasFromRecentsSection:v23];
      id v17 = v22;
      id v18 = v29;
    }

    if (v19) {
      dispatch_async(MEMORY[0x1E4F14428], v19);
    }
  }
}

- (void)_updateCachedDeviceLockState
{
  id v3 = +[UIKeyboardInputModeController sharedInputModeController];
  self->_deviceWasLockedWhenKeyboardWasShown = [v3 deviceStateIsLocked];
}

- (BOOL)hasCheckedMemojiPreference
{
  return self->_hasCheckedMemojiPreference;
}

- (void)setHasCheckedMemojiPreference:(BOOL)a3
{
  self->_hasCheckedMemojiPreference = a3;
}

- (BOOL)supportsMemoji
{
  return self->_supportsMemoji;
}

- (void)setSupportsMemoji:(BOOL)a3
{
  self->_supportsMemojuint64_t i = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localRecentsWithoutClient, 0);
  objc_storeStrong((id *)&self->_localRecentsWithClient, 0);
  objc_storeStrong((id *)&self->_clientDispatchQueue, 0);
  objc_storeStrong((id *)&self->_preferencesClient, 0);
}

@end