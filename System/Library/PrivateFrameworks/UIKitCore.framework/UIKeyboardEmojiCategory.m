@interface UIKeyboardEmojiCategory
+ (BOOL)doesShowStickers;
+ (BOOL)isRTLMode;
+ (id)allowedCategoryIndexes;
+ (id)categories;
+ (id)categoriesByType;
+ (id)categoryForType:(int64_t)a3;
+ (id)displayName:(int64_t)a3;
+ (id)emojiCategoryStringForCategoryType:(int64_t)a3;
+ (id)emojiRecentsFromPreferences;
+ (id)enabledCategoryIndexes;
+ (id)fallbackDisplayName:(int64_t)a3;
+ (id)loadPrecomputedEmojiFlagCategory;
+ (id)localizedStringForKey:(id)a3;
+ (id)professionSkinToneEmojiBaseKey:(id)a3;
+ (id)sharedManager;
+ (int64_t)categoryTypeForCategoryIndex:(unint64_t)a3;
+ (int64_t)emojiCategoryTypeForCategoryString:(id)a3;
+ (int64_t)numberOfCategories;
+ (unint64_t)categoryIndexForCategoryType:(int64_t)a3;
+ (unint64_t)hasVariantsForEmoji:(id)a3;
+ (void)setDoesShowStickers:(BOOL)a3;
- (NSArray)emoji;
- (NSMutableDictionary)localizedNames;
- (NSMutableDictionary)shortLocalizedNames;
- (NSString)displaySymbol;
- (NSString)name;
- (int64_t)categoryType;
- (int64_t)lastVisibleFirstEmojiIndex;
- (void)dealloc;
- (void)localeDidChange;
- (void)releaseCategories;
- (void)setCategoryType:(int64_t)a3;
- (void)setEmoji:(id)a3;
- (void)setLastVisibleFirstEmojiIndex:(int64_t)a3;
- (void)setLocalizedNames:(id)a3;
- (void)setShortLocalizedNames:(id)a3;
@end

@implementation UIKeyboardEmojiCategory

+ (id)sharedManager
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __40__UIKeyboardEmojiCategory_sharedManager__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (_MergedGlobals_1134 != -1) {
    dispatch_once(&_MergedGlobals_1134, block);
  }
  v2 = (void *)qword_1EB261B60;
  return v2;
}

void __40__UIKeyboardEmojiCategory_sharedManager__block_invoke(uint64_t a1)
{
  id v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)qword_1EB261B60;
  qword_1EB261B60 = (uint64_t)v1;

  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 addObserver:qword_1EB261B60 selector:sel_localeDidChange name:*MEMORY[0x1E4F1C370] object:0];

  v4 = objc_opt_new();
  [(id)qword_1EB261B60 setLocalizedNames:v4];

  id v5 = (id)objc_opt_new();
  [(id)qword_1EB261B60 setShortLocalizedNames:v5];
}

+ (BOOL)doesShowStickers
{
  return _doesShowStickers;
}

+ (void)setDoesShowStickers:(BOOL)a3
{
  _doesShowStickers = a3;
}

- (void)localeDidChange
{
  v2 = +[UIKeyboardEmojiCategory sharedManager];
  v3 = [v2 localizedNames];
  [v3 removeAllObjects];

  id v5 = +[UIKeyboardEmojiCategory sharedManager];
  v4 = [v5 shortLocalizedNames];
  [v4 removeAllObjects];
}

+ (id)enabledCategoryIndexes
{
  v3 = +[UIKeyboardEmojiPreferences sharedInstance];
  int v4 = [v3 shouldShowRecents];

  if (v4)
  {
    id v5 = [a1 allowedCategoryIndexes];
  }
  else
  {
    id v5 = &unk_1ED3F0760;
  }
  return v5;
}

+ (id)allowedCategoryIndexes
{
  if ((_UIApplicationIsStickerPickerService() & (_doesShowStickers != 0)) != 0) {
    return &unk_1ED3F0778;
  }
  else {
    return &unk_1ED3F0790;
  }
}

+ (int64_t)categoryTypeForCategoryIndex:(unint64_t)a3
{
  id v5 = [a1 enabledCategoryIndexes];
  unint64_t v6 = [v5 count];

  if (v6 <= a3) {
    return 7;
  }
  v7 = [a1 enabledCategoryIndexes];
  v8 = [v7 objectAtIndex:a3];
  int64_t v9 = [v8 integerValue];

  return v9;
}

+ (unint64_t)categoryIndexForCategoryType:(int64_t)a3
{
  int v4 = [a1 enabledCategoryIndexes];
  id v5 = [NSNumber numberWithInteger:a3];
  unint64_t v6 = [v4 indexOfObject:v5];

  if (v6 == 0x7FFFFFFFFFFFFFFFLL) {
    return 0;
  }
  else {
    return v6;
  }
}

+ (int64_t)numberOfCategories
{
  return 11;
}

+ (id)categories
{
  v2 = (void *)categories_categories;
  if (!categories_categories)
  {
    uint64_t v3 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(a1, "numberOfCategories"));
    int v4 = (void *)categories_categories;
    categories_categories = v3;

    for (uint64_t i = 0; i != 12; ++i)
    {
      unint64_t v6 = objc_alloc_init(UIKeyboardEmojiCategory);
      [(UIKeyboardEmojiCategory *)v6 setCategoryType:i];
      [(id)categories_categories addObject:v6];
    }
    v2 = (void *)categories_categories;
  }
  return v2;
}

+ (id)categoriesByType
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = (void *)categoriesByType_categories;
  if (!categoriesByType_categories)
  {
    id v4 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    id v5 = (void *)categoriesByType_categories;
    categoriesByType_categories = (uint64_t)v4;

    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    unint64_t v6 = objc_msgSend(a1, "allowedCategoryIndexes", 0);
    uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v16;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v16 != v9) {
            objc_enumerationMutation(v6);
          }
          v11 = *(void **)(*((void *)&v15 + 1) + 8 * v10);
          v12 = objc_alloc_init(UIKeyboardEmojiCategory);
          -[UIKeyboardEmojiCategory setCategoryType:](v12, "setCategoryType:", (int)[v11 intValue]);
          [(id)categoriesByType_categories setObject:v12 forKey:v11];

          ++v10;
        }
        while (v8 != v10);
        uint64_t v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v8);
    }

    v13 = objc_alloc_init(UIKeyboardEmojiCategory);
    [(UIKeyboardEmojiCategory *)v13 setCategoryType:9];
    [(id)categoriesByType_categories setObject:v13 forKey:&unk_1ED3F5208];

    uint64_t v3 = (void *)categoriesByType_categories;
  }
  return v3;
}

- (void)releaseCategories
{
  id v2 = +[UIKeyboardEmojiCategory categories];
  [v2 removeAllObjects];
}

+ (id)professionSkinToneEmojiBaseKey:(id)a3
{
  id v3 = a3;
  if ([v3 _containsSubstring:@"🏻"])
  {
    uint64_t v4 = [v3 length];
    id v5 = @"🏻";
LABEL_11:
    objc_msgSend(v3, "stringByReplacingOccurrencesOfString:withString:options:range:", v5, &stru_1ED0E84C0, 2, 0, v4);
    id v6 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_12;
  }
  if ([v3 _containsSubstring:@"🏼"])
  {
    uint64_t v4 = [v3 length];
    id v5 = @"🏼";
    goto LABEL_11;
  }
  if ([v3 _containsSubstring:@"🏽"])
  {
    uint64_t v4 = [v3 length];
    id v5 = @"🏽";
    goto LABEL_11;
  }
  if ([v3 _containsSubstring:@"🏾"])
  {
    uint64_t v4 = [v3 length];
    id v5 = @"🏾";
    goto LABEL_11;
  }
  if ([v3 _containsSubstring:@"🏿"])
  {
    uint64_t v4 = [v3 length];
    id v5 = @"🏿";
    goto LABEL_11;
  }
  id v6 = v3;
LABEL_12:
  uint64_t v7 = v6;

  return v7;
}

+ (unint64_t)hasVariantsForEmoji:(id)a3
{
  return 0;
}

+ (id)emojiRecentsFromPreferences
{
  return 0;
}

+ (id)loadPrecomputedEmojiFlagCategory
{
  return 0;
}

+ (id)emojiCategoryStringForCategoryType:(int64_t)a3
{
  id v3 = 0;
  switch(a3)
  {
    case 0:
      uint64_t v10 = 0;
      v11 = &v10;
      uint64_t v12 = 0x2020000000;
      uint64_t v4 = (id *)getEMFEmojiCategoryRecentsSymbolLoc_ptr;
      uint64_t v13 = getEMFEmojiCategoryRecentsSymbolLoc_ptr;
      if (!getEMFEmojiCategoryRecentsSymbolLoc_ptr)
      {
        id v5 = EmojiFoundationLibrary_0();
        v11[3] = (uint64_t)dlsym(v5, "EMFEmojiCategoryRecents");
        getEMFEmojiCategoryRecentsSymbolLoc_ptr = v11[3];
        uint64_t v4 = (id *)v11[3];
      }
      _Block_object_dispose(&v10, 8);
      if (v4)
      {
        id v3 = *v4;
        break;
      }
      uint64_t v8 = [MEMORY[0x1E4F28B00] currentHandler];
      uint64_t v9 = [NSString stringWithUTF8String:"NSString *getEMFEmojiCategoryRecents(void)"];
      objc_msgSend(v8, "handleFailureInFunction:file:lineNumber:description:", v9, @"UIKeyboardEmojiCategory.m", 33, @"%s", dlerror());

      __break(1u);
      return result;
    case 1:
      getEMFEmojiCategoryPeople();
      id v3 = (id)objc_claimAutoreleasedReturnValue();
      break;
    case 2:
      getEMFEmojiCategoryNature();
      id v3 = (id)objc_claimAutoreleasedReturnValue();
      break;
    case 3:
      getEMFEmojiCategoryFoodAndDrink();
      id v3 = (id)objc_claimAutoreleasedReturnValue();
      break;
    case 5:
      getEMFEmojiCategoryActivity();
      id v3 = (id)objc_claimAutoreleasedReturnValue();
      break;
    case 6:
      getEMFEmojiCategoryTravelAndPlaces();
      id v3 = (id)objc_claimAutoreleasedReturnValue();
      break;
    case 7:
      getEMFEmojiCategoryFlags();
      id v3 = (id)objc_claimAutoreleasedReturnValue();
      break;
    case 9:
      getEMFEmojiCategoryPrepopulated();
      id v3 = (id)objc_claimAutoreleasedReturnValue();
      break;
    case 10:
      getEMFEmojiCategoryObjects();
      id v3 = (id)objc_claimAutoreleasedReturnValue();
      break;
    case 11:
      getEMFEmojiCategorySymbols();
      id v3 = (id)objc_claimAutoreleasedReturnValue();
      break;
    case 13:
      id v6 = @"Memoji";
      goto LABEL_10;
    case 14:
      id v6 = @"Stickers";
LABEL_10:
      _UILocalizedStringInSystemLanguage(v6, v6);
      id v3 = (id)objc_claimAutoreleasedReturnValue();
      break;
    default:
      break;
  }
  return v3;
}

+ (int64_t)emojiCategoryTypeForCategoryString:(id)a3
{
  id v3 = a3;
  uint64_t v4 = getEMFEmojiCategoryPrepopulated();
  char v5 = [v3 isEqualToString:v4];

  if (v5)
  {
    int64_t v6 = 9;
  }
  else
  {
    uint64_t v7 = getEMFEmojiCategoryPeople();
    char v8 = [v3 isEqualToString:v7];

    if (v8)
    {
      int64_t v6 = 1;
    }
    else
    {
      uint64_t v9 = getEMFEmojiCategoryNature();
      char v10 = [v3 isEqualToString:v9];

      if (v10)
      {
        int64_t v6 = 2;
      }
      else
      {
        v11 = getEMFEmojiCategoryFoodAndDrink();
        char v12 = [v3 isEqualToString:v11];

        if (v12)
        {
          int64_t v6 = 3;
        }
        else
        {
          uint64_t v13 = getEMFEmojiCategoryActivity();
          char v14 = [v3 isEqualToString:v13];

          if (v14)
          {
            int64_t v6 = 5;
          }
          else
          {
            long long v15 = getEMFEmojiCategoryTravelAndPlaces();
            char v16 = [v3 isEqualToString:v15];

            if (v16)
            {
              int64_t v6 = 6;
            }
            else
            {
              long long v17 = getEMFEmojiCategoryObjects();
              char v18 = [v3 isEqualToString:v17];

              if (v18)
              {
                int64_t v6 = 10;
              }
              else
              {
                v19 = getEMFEmojiCategorySymbols();
                char v20 = [v3 isEqualToString:v19];

                if (v20)
                {
                  int64_t v6 = 11;
                }
                else
                {
                  v21 = getEMFEmojiCategoryFlags();
                  char v22 = [v3 isEqualToString:v21];

                  if (v22)
                  {
                    int64_t v6 = 7;
                  }
                  else if ([v3 isEqualToString:@"UIKeyboardEmojiCategoryMemoji"])
                  {
                    int64_t v6 = 13;
                  }
                  else if ([v3 isEqualToString:@"UIKeyboardEmojiCategoryStickers"])
                  {
                    int64_t v6 = 14;
                  }
                  else
                  {
                    int64_t v6 = 0;
                  }
                }
              }
            }
          }
        }
      }
    }
  }

  return v6;
}

+ (id)categoryForType:(int64_t)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  char v5 = objc_msgSend(a1, "emojiCategoryStringForCategoryType:");
  int64_t v6 = [a1 categoriesByType];
  uint64_t v7 = [NSNumber numberWithInteger:a3];
  char v8 = [v6 objectForKey:v7];

  uint64_t v9 = [v8 emoji];
  uint64_t v10 = [v9 count];

  if (!a3 || !v10)
  {
    v11 = [getEMFEmojiCategoryClass() _emojiSetForIdentifier:v5];
    char v12 = v11;
    if (v11)
    {
      char v22 = v8;
      uint64_t v13 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v11, "count"));
      long long v23 = 0u;
      long long v24 = 0u;
      long long v25 = 0u;
      long long v26 = 0u;
      id v14 = v12;
      uint64_t v15 = [v14 countByEnumeratingWithState:&v23 objects:v27 count:16];
      if (v15)
      {
        uint64_t v16 = v15;
        uint64_t v17 = *(void *)v24;
        do
        {
          for (uint64_t i = 0; i != v16; ++i)
          {
            if (*(void *)v24 != v17) {
              objc_enumerationMutation(v14);
            }
            id v19 = *(id *)(*((void *)&v23 + 1) + 8 * i);
            char v20 = +[UIKeyboardEmoji emojiWithString:withVariantMask:](UIKeyboardEmoji, "emojiWithString:withVariantMask:", v19, +[UIKeyboardEmojiCategory hasVariantsForEmoji:v19]);

            if (v20) {
              [v13 addObject:v20];
            }
          }
          uint64_t v16 = [v14 countByEnumeratingWithState:&v23 objects:v27 count:16];
        }
        while (v16);
      }

      char v8 = v22;
      if (v13)
      {
        [v22 setEmoji:v13];
      }
    }
  }
  return v8;
}

+ (BOOL)isRTLMode
{
  id v2 = +[UIKeyboardImpl activeInstance];

  if (v2)
  {
    id v3 = +[UIKeyboardImpl activeInstance];
    BOOL v4 = +[UIView userInterfaceLayoutDirectionForSemanticContentAttribute:](UIView, "userInterfaceLayoutDirectionForSemanticContentAttribute:", [v3 semanticContentAttribute]) == UIUserInterfaceLayoutDirectionRightToLeft;
  }
  else
  {
    char v5 = (void *)MEMORY[0x1E4F1CA20];
    id v3 = [MEMORY[0x1E4F1CA20] _deviceLanguage];
    BOOL v4 = [v5 characterDirectionForLanguage:v3] == 2;
  }
  BOOL v6 = v4;

  return v6;
}

- (void)dealloc
{
  self->_categoryType = -1;
  [(UIKeyboardEmojiCategory *)self setEmoji:0];
  v3.receiver = self;
  v3.super_class = (Class)UIKeyboardEmojiCategory;
  [(UIKeyboardEmojiCategory *)&v3 dealloc];
}

+ (id)localizedStringForKey:(id)a3
{
  id v3 = a3;
  BOOL v4 = TIBundleForInputMode();
  char v5 = [v4 localizedStringForKey:v3 value:0 table:0];

  return v5;
}

- (NSString)name
{
  unint64_t v2 = [(UIKeyboardEmojiCategory *)self categoryType];
  if (v2 > 0xE) {
    return 0;
  }
  else {
    return &off_1E52FBA70[v2]->isa;
  }
}

+ (id)displayName:(int64_t)a3
{
  id v3 = [a1 emojiCategoryStringForCategoryType:a3];
  BOOL v4 = +[UIKeyboardEmojiCategory sharedManager];
  char v5 = [v4 localizedNames];
  BOOL v6 = [v5 objectForKey:v3];

  if (!v6)
  {
    uint64_t v7 = [getEMFEmojiCategoryClass() categoryWithIdentifier:v3];
    char v8 = +[UIKeyboardEmojiCategory sharedManager];
    uint64_t v9 = [v8 localizedNames];
    uint64_t v10 = [v7 localizedName];
    [v9 setObject:v10 forKey:v3];
  }
  v11 = +[UIKeyboardEmojiCategory sharedManager];
  char v12 = [v11 localizedNames];
  uint64_t v13 = [v12 objectForKey:v3];

  return v13;
}

+ (id)fallbackDisplayName:(int64_t)a3
{
  id v3 = [a1 emojiCategoryStringForCategoryType:a3];
  BOOL v4 = +[UIKeyboardEmojiCategory sharedManager];
  char v5 = [v4 shortLocalizedNames];
  BOOL v6 = [v5 objectForKey:v3];

  if (!v6)
  {
    uint64_t v7 = [getEMFEmojiCategoryClass() categoryWithIdentifier:v3];
    char v8 = +[UIKeyboardEmojiCategory sharedManager];
    uint64_t v9 = [v8 shortLocalizedNames];
    uint64_t v10 = [v7 shortLocalizedName];
    [v9 setObject:v10 forKey:v3];
  }
  v11 = +[UIKeyboardEmojiCategory sharedManager];
  char v12 = [v11 shortLocalizedNames];
  uint64_t v13 = [v12 objectForKey:v3];

  return v13;
}

- (int64_t)categoryType
{
  return self->_categoryType;
}

- (void)setCategoryType:(int64_t)a3
{
  self->_categoryType = a3;
}

- (NSMutableDictionary)localizedNames
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 32, 1);
}

- (void)setLocalizedNames:(id)a3
{
}

- (NSMutableDictionary)shortLocalizedNames
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 40, 1);
}

- (void)setShortLocalizedNames:(id)a3
{
}

- (NSArray)emoji
{
  return (NSArray *)objc_getProperty(self, a2, 16, 1);
}

- (void)setEmoji:(id)a3
{
}

- (int64_t)lastVisibleFirstEmojiIndex
{
  return self->_lastVisibleFirstEmojiIndex;
}

- (void)setLastVisibleFirstEmojiIndex:(int64_t)a3
{
  self->_lastVisibleFirstEmojiIndex = a3;
}

- (NSString)displaySymbol
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displaySymbol, 0);
  objc_storeStrong((id *)&self->_shortLocalizedNames, 0);
  objc_storeStrong((id *)&self->_localizedNames, 0);
  objc_storeStrong((id *)&self->_emoji, 0);
}

@end