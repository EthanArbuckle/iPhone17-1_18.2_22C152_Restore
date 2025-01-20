@interface PXGPPTSettings
+ (NSArray)scrollingPresetNames;
+ (id)settingsControllerModule;
+ (id)sharedInstance;
- (BOOL)shouldTestNestedScrollView;
- (BOOL)useAssetBadgeDecoration;
- (BOOL)useMultipleScrollableRows;
- (id)createLayout;
- (id)parentSettings;
- (int64_t)numberOfColumns;
- (int64_t)numberOfItems;
- (int64_t)numberOfSections;
- (int64_t)selectionDecorationStlye;
- (void)setDefaultValues;
- (void)setDefaultValuesWithPresetName:(id)a3;
- (void)setNumberOfColumns:(int64_t)a3;
- (void)setNumberOfItems:(int64_t)a3;
- (void)setNumberOfSections:(int64_t)a3;
- (void)setSelectionDecorationStlye:(int64_t)a3;
- (void)setShouldTestNestedScrollView:(BOOL)a3;
- (void)setUseAssetBadgeDecoration:(BOOL)a3;
- (void)setUseMultipleScrollableRows:(BOOL)a3;
@end

@implementation PXGPPTSettings

- (void)setDefaultValues
{
  v3.receiver = self;
  v3.super_class = (Class)PXGPPTSettings;
  [(PTSettings *)&v3 setDefaultValues];
  [(PXGPPTSettings *)self setNumberOfItems:100000];
  [(PXGPPTSettings *)self setNumberOfSections:1];
  [(PXGPPTSettings *)self setNumberOfColumns:4];
  [(PXGPPTSettings *)self setUseAssetBadgeDecoration:0];
  [(PXGPPTSettings *)self setSelectionDecorationStlye:0];
  [(PXGPPTSettings *)self setUseMultipleScrollableRows:0];
  [(PXGPPTSettings *)self setShouldTestNestedScrollView:0];
}

- (void)setUseMultipleScrollableRows:(BOOL)a3
{
  self->_useMultipleScrollableRows = a3;
}

- (void)setUseAssetBadgeDecoration:(BOOL)a3
{
  self->_useAssetBadgeDecoration = a3;
}

- (void)setShouldTestNestedScrollView:(BOOL)a3
{
  self->_shouldTestNestedScrollView = a3;
}

- (void)setSelectionDecorationStlye:(int64_t)a3
{
  self->_selectionDecorationStlye = a3;
}

- (void)setNumberOfSections:(int64_t)a3
{
  self->_numberOfSections = a3;
}

- (void)setNumberOfItems:(int64_t)a3
{
  self->_numberOfItems = a3;
}

- (void)setNumberOfColumns:(int64_t)a3
{
  self->_numberOfColumns = a3;
}

- (BOOL)shouldTestNestedScrollView
{
  return self->_shouldTestNestedScrollView;
}

- (BOOL)useMultipleScrollableRows
{
  return self->_useMultipleScrollableRows;
}

- (int64_t)selectionDecorationStlye
{
  return self->_selectionDecorationStlye;
}

- (BOOL)useAssetBadgeDecoration
{
  return self->_useAssetBadgeDecoration;
}

- (int64_t)numberOfColumns
{
  return self->_numberOfColumns;
}

- (int64_t)numberOfSections
{
  return self->_numberOfSections;
}

- (int64_t)numberOfItems
{
  return self->_numberOfItems;
}

- (id)createLayout
{
  BOOL v3 = [(PXGPPTSettings *)self useMultipleScrollableRows];
  v4 = off_1E5DA6A40;
  if (!v3) {
    v4 = off_1E5DA6A18;
  }
  v5 = (void *)[objc_alloc(*v4) initWithSettings:self];
  return v5;
}

- (void)setDefaultValuesWithPresetName:(id)a3
{
  id v8 = a3;
  [(PXGPPTSettings *)self setDefaultValues];
  if ([v8 isEqualToString:@"10k_Grid"])
  {
    v5 = self;
    uint64_t v6 = 10000;
LABEL_5:
    [(PXGPPTSettings *)v5 setNumberOfItems:v6];
    goto LABEL_6;
  }
  if ([v8 isEqualToString:@"100k_Grid"])
  {
    v5 = self;
    uint64_t v6 = 100000;
    goto LABEL_5;
  }
  if ([v8 isEqualToString:@"10k_Sections"])
  {
    [(PXGPPTSettings *)self setNumberOfItems:500000];
    [(PXGPPTSettings *)self setNumberOfSections:10000];
  }
  else if ([v8 isEqualToString:@"10k_Sections_Decorated"])
  {
    [(PXGPPTSettings *)self setNumberOfItems:500000];
    [(PXGPPTSettings *)self setNumberOfSections:10000];
    [(PXGPPTSettings *)self setUseAssetBadgeDecoration:1];
    [(PXGPPTSettings *)self setSelectionDecorationStlye:3];
  }
  else
  {
    if (![v8 hasPrefix:@"ScrollableRows_"])
    {
      v7 = [MEMORY[0x1E4F28B00] currentHandler];
      [v7 handleFailureInMethod:a2, self, @"PXGPPTSettings.m", 74, @"unknown presetName %@", v8 object file lineNumber description];

      abort();
    }
    [(PXGPPTSettings *)self setUseMultipleScrollableRows:1];
    [(PXGPPTSettings *)self setNumberOfSections:10000];
    if ([v8 hasSuffix:@"_HorizontalRow"]) {
      [(PXGPPTSettings *)self setShouldTestNestedScrollView:1];
    }
  }
LABEL_6:
}

- (id)parentSettings
{
  return +[PXRootSettings sharedInstance];
}

+ (NSArray)scrollingPresetNames
{
  return (NSArray *)&unk_1F02D3718;
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_37679 != -1) {
    dispatch_once(&sharedInstance_onceToken_37679, &__block_literal_global_37680);
  }
  v2 = (void *)sharedInstance_sharedInstance_37681;
  return v2;
}

void __32__PXGPPTSettings_sharedInstance__block_invoke()
{
  id v2 = +[PXRootSettings sharedInstance];
  uint64_t v0 = [v2 tungstenPPTSettings];
  v1 = (void *)sharedInstance_sharedInstance_37681;
  sharedInstance_sharedInstance_37681 = v0;
}

+ (id)settingsControllerModule
{
  v11[1] = *MEMORY[0x1E4F143B8];
  BOOL v3 = [a1 sharedInstance];
  v4 = (void *)MEMORY[0x1E4F94160];
  v5 = (void *)MEMORY[0x1E4F940F8];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __46__PXGPPTSettings_UI__settingsControllerModule__block_invoke;
  v10[3] = &unk_1E5DBFCB0;
  id v6 = v3;
  v10[4] = v6;
  v7 = objc_msgSend(v5, "px_rowWithTitle:action:", @"Show Benchmarked View", v10);
  v11[0] = v7;
  id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:1];
  [v4 sectionWithRows:v8 title:@"(Double-tap to dismiss)"];
  objc_claimAutoreleasedReturnValue();

  [a1 allPresetNames];
  objc_claimAutoreleasedReturnValue();
  v6;
  PXMap();
}

void __46__PXGPPTSettings_UI__settingsControllerModule__block_invoke(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v5 = [v2 createLayout];
  v4 = [[PXGPPTViewController alloc] initWithLayout:v5];
  [v3 presentViewController:v4 animated:1 completion:0];
}

id __46__PXGPPTSettings_UI__settingsControllerModule__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = (void *)MEMORY[0x1E4F940F8];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __46__PXGPPTSettings_UI__settingsControllerModule__block_invoke_3;
  v8[3] = &unk_1E5DB9CB0;
  id v9 = *(id *)(a1 + 32);
  id v10 = v3;
  id v5 = v3;
  id v6 = objc_msgSend(v4, "px_rowWithTitle:action:", v5, v8);

  return v6;
}

uint64_t __46__PXGPPTSettings_UI__settingsControllerModule__block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) setDefaultValuesWithPresetName:*(void *)(a1 + 40)];
}

@end