@interface UIKeyboardEmojiKeyDisplayController
+ (Class)classForCategoryControl:(int64_t)a3;
+ (Class)classForInputView:(int64_t)a3;
+ (void)writeEmojiDefaultsAndReleaseActiveInputView;
- (BOOL)hasLastUsedVariantForEmojiString:(id)a3;
- (BOOL)userHasSelectedSkinToneEmoji;
- (UIKeyboardEmojiCategory)lastViewedCategory;
- (UIKeyboardEmojiKeyDisplayController)init;
- (UIKeyboardEmojiKeyView)categoryView;
- (UIKeyboardEmojiKeyView)inputView;
- (id)emojiWithoutDuplicateRecents:(id)a3;
- (id)lastUsedVariantEmojiForEmojiString:(id)a3;
- (id)recentEmojiAtIndex:(int64_t)a3 size:(unint64_t *)a4;
- (id)recents;
- (id)skinToneBaseKeyPreferences;
- (int64_t)lastVisibleFirstEmojiIndexforCategory:(id)a3;
- (int64_t)reloadCategoryForOffsetPercentage:(double)a3 withSender:(id)a4;
- (void)dealloc;
- (void)emojiUsed:(id)a3;
- (void)emojiUsed:(id)a3 language:(id)a4;
- (void)reloadCategoryForIndexPath:(id)a3 withSender:(id)a4;
- (void)reloadForCategory:(int64_t)a3 withSender:(id)a4;
- (void)setCategoryView:(id)a3;
- (void)setInputView:(id)a3;
- (void)setLastViewedCategory:(id)a3;
- (void)updateEmojiKeyManagerWithKey:(id)a3 withKeyView:(id)a4;
- (void)updateSkinToneBaseKey:(id)a3 variantUsed:(id)a4;
@end

@implementation UIKeyboardEmojiKeyDisplayController

- (UIKeyboardEmojiKeyDisplayController)init
{
  v5.receiver = self;
  v5.super_class = (Class)UIKeyboardEmojiKeyDisplayController;
  v2 = [(UIKeyboardEmojiKeyDisplayController *)&v5 init];
  v3 = v2;
  if (v2)
  {
    objc_storeWeak((id *)&v2->_inputView, 0);
    objc_storeWeak((id *)&v3->_categoryView, 0);
  }
  return v3;
}

- (void)dealloc
{
  p_inputView = &self->_inputView;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_inputView);

  if (WeakRetained) {
    objc_storeWeak((id *)p_inputView, 0);
  }
  id v5 = objc_loadWeakRetained((id *)&self->_categoryView);

  if (v5) {
    objc_storeWeak((id *)&self->_categoryView, 0);
  }
  v6.receiver = self;
  v6.super_class = (Class)UIKeyboardEmojiKeyDisplayController;
  [(UIKeyboardEmojiKeyDisplayController *)&v6 dealloc];
}

- (void)updateEmojiKeyManagerWithKey:(id)a3 withKeyView:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  if (+[UIKeyboard isRemoteEmojiCollectionViewEnabled]
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || _UIApplicationIsStickerPickerService())
  {
    if ([v9 displayType] == 36)
    {
      uint64_t v7 = 8;
    }
    else
    {
      if ([v9 displayType] != 37) {
        goto LABEL_9;
      }
      uint64_t v7 = 16;
    }
    id v8 = objc_storeWeak((id *)((char *)&self->super.isa + v7), v6);
    [v6 setEmojiKeyManager:self];
  }
LABEL_9:
}

+ (Class)classForInputView:(int64_t)a3
{
  if (a3 == 1) {
    +[UIKeyboardImpl isSplit];
  }
  id v3 = (id)objc_opt_class();
  return (Class)v3;
}

+ (Class)classForCategoryControl:(int64_t)a3
{
  if (a3 == 1)
  {
    +[UIKeyboardImpl isSplit];
    id v3 = (id)objc_opt_class();
  }
  else
  {
    objc_opt_class();
    id v3 = (id)objc_claimAutoreleasedReturnValue();
  }
  return (Class)v3;
}

+ (void)writeEmojiDefaultsAndReleaseActiveInputView
{
  id v2 = +[UIKeyboardEmojiPreferences sharedInstance];
  [v2 writeEmojiDefaults];
}

- (void)reloadForCategory:(int64_t)a3 withSender:(id)a4
{
  id v9 = a4;
  id v6 = [(UIKeyboardEmojiKeyDisplayController *)self inputView];

  id v7 = [(UIKeyboardEmojiKeyDisplayController *)self categoryView];
  if (v6 != v9)
  {

    if (v7 != v9) {
      goto LABEL_5;
    }
    id v7 = [(UIKeyboardEmojiKeyDisplayController *)self inputView];
  }
  [v7 updateToCategory:a3];

LABEL_5:
  id v8 = +[UIKeyboardEmojiPreferences sharedInstance];
  [v8 refreshLocalRecents];
}

- (int64_t)reloadCategoryForOffsetPercentage:(double)a3 withSender:(id)a4
{
  id v6 = a4;
  id v7 = [(UIKeyboardEmojiKeyDisplayController *)self categoryView];

  if (v7 != v6) {
    return 0;
  }
  id v9 = [(UIKeyboardEmojiKeyDisplayController *)self inputView];
  int64_t v10 = [v9 updateToCategoryWithOffsetPercentage:a3];

  return v10;
}

- (void)reloadCategoryForIndexPath:(id)a3 withSender:(id)a4
{
  id v14 = a3;
  id v6 = a4;
  id v7 = [(UIKeyboardEmojiKeyDisplayController *)self categoryView];
  if (v7 == v6)
  {
    id v8 = [(UIKeyboardEmojiKeyDisplayController *)self inputView];
    char v9 = objc_opt_respondsToSelector();

    if (v9)
    {
      int64_t v10 = [(UIKeyboardEmojiKeyDisplayController *)self inputView];
LABEL_8:
      id v11 = v10;
      [v10 updateToIndexPath:v14];
      goto LABEL_9;
    }
  }
  else
  {
  }
  id v11 = [(UIKeyboardEmojiKeyDisplayController *)self inputView];
  if (v11 == v6)
  {
    v12 = [(UIKeyboardEmojiKeyDisplayController *)self inputView];
    char v13 = objc_opt_respondsToSelector();

    if ((v13 & 1) == 0) {
      goto LABEL_10;
    }
    int64_t v10 = [(UIKeyboardEmojiKeyDisplayController *)self categoryView];
    goto LABEL_8;
  }
LABEL_9:

LABEL_10:
}

- (BOOL)userHasSelectedSkinToneEmoji
{
  id v2 = +[UIKeyboardEmojiPreferences sharedInstance];
  char v3 = [v2 hasDisplayedSkinToneHelp];

  return v3;
}

- (void)emojiUsed:(id)a3
{
}

- (void)emojiUsed:(id)a3 language:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = +[UIKeyboardEmojiPreferences sharedInstance];
  [v7 emojiUsedFromEmojiKeyboardPalette:v6 inputModeIdentifier:v5 completionHandler:0];
}

- (void)updateSkinToneBaseKey:(id)a3 variantUsed:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = +[UIKeyboardEmojiPreferences sharedInstance];
  [v7 updateSkinToneBaseKey:v6 variantUsed:v5];
}

- (id)recents
{
  id v2 = +[UIKeyboardEmojiPreferences sharedInstance];
  char v3 = [v2 recents];

  return v3;
}

- (id)recentEmojiAtIndex:(int64_t)a3 size:(unint64_t *)a4
{
  id v6 = +[UIKeyboardEmojiPreferences sharedInstance];
  id v7 = [v6 recentEmojiAtIndex:a3 size:a4];

  return v7;
}

- (id)emojiWithoutDuplicateRecents:(id)a3
{
  id v3 = a3;
  v4 = +[UIKeyboardEmojiPreferences sharedInstance];
  id v5 = [v4 emojiWithoutDuplicateRecents:v3];

  return v5;
}

- (id)skinToneBaseKeyPreferences
{
  id v2 = +[UIKeyboardEmojiPreferences sharedInstance];
  id v3 = [v2 skinToneBaseKeyPreferences];

  return v3;
}

- (BOOL)hasLastUsedVariantForEmojiString:(id)a3
{
  id v3 = a3;
  v4 = +[UIKeyboardEmojiPreferences sharedInstance];
  char v5 = [v4 hasLastUsedVariantForEmojiString:v3];

  return v5;
}

- (id)lastUsedVariantEmojiForEmojiString:(id)a3
{
  id v3 = a3;
  v4 = +[UIKeyboardEmojiPreferences sharedInstance];
  char v5 = [v4 lastUsedVariantEmojiForEmojiString:v3];

  return v5;
}

- (UIKeyboardEmojiCategory)lastViewedCategory
{
  id v2 = +[UIKeyboardEmojiPreferences sharedInstance];
  id v3 = +[UIKeyboardEmojiCategory categoryForType:](UIKeyboardEmojiCategory, "categoryForType:", [v2 selectedCategoryType]);

  v4 = +[UIKeyboardEmojiPreferences sharedInstance];
  objc_msgSend(v3, "setLastVisibleFirstEmojiIndex:", objc_msgSend(v4, "emojiCategoryDefaultsIndex:", v3));

  return (UIKeyboardEmojiCategory *)v3;
}

- (void)setLastViewedCategory:(id)a3
{
  id v3 = a3;
  v4 = +[UIKeyboardEmojiPreferences sharedInstance];
  objc_msgSend(v4, "setSelectedCategoryType:", objc_msgSend(v3, "categoryType"));

  id v5 = +[UIKeyboardEmojiPreferences sharedInstance];
  objc_msgSend(v5, "setEmojiCategoryDefaultsIndex:forCategory:", objc_msgSend(v3, "lastVisibleFirstEmojiIndex"), v3);
}

- (int64_t)lastVisibleFirstEmojiIndexforCategory:(id)a3
{
  id v3 = a3;
  v4 = +[UIKeyboardEmojiPreferences sharedInstance];
  int64_t v5 = [v4 emojiCategoryDefaultsIndex:v3];

  return v5;
}

- (UIKeyboardEmojiKeyView)inputView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_inputView);
  return (UIKeyboardEmojiKeyView *)WeakRetained;
}

- (void)setInputView:(id)a3
{
}

- (UIKeyboardEmojiKeyView)categoryView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_categoryView);
  return (UIKeyboardEmojiKeyView *)WeakRetained;
}

- (void)setCategoryView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastViewedCategory, 0);
  objc_destroyWeak((id *)&self->_categoryView);
  objc_destroyWeak((id *)&self->_inputView);
}

@end