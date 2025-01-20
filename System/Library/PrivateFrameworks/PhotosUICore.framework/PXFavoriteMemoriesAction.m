@interface PXFavoriteMemoriesAction
+ (BOOL)toggledValueForMemories:(id)a3;
+ (id)menuTitleForMemories:(id)a3;
- (BOOL)isFavorite;
- (PXFavoriteMemoriesAction)initWithMemories:(id)a3;
- (PXFavoriteMemoriesAction)initWithMemories:(id)a3 favorite:(BOOL)a4;
- (id)actionIdentifier;
- (id)actionSystemImageName;
- (id)localizedActionName;
- (void)performAction:(id)a3;
- (void)performUndo:(id)a3;
@end

@implementation PXFavoriteMemoriesAction

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_actionSystemImageName, 0);
  objc_storeStrong((id *)&self->_localizedActionName, 0);
}

- (BOOL)isFavorite
{
  return self->_favorite;
}

- (id)actionSystemImageName
{
  return self->_actionSystemImageName;
}

- (id)localizedActionName
{
  return self->_localizedActionName;
}

- (void)performUndo:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(PXFavoriteMemoriesAction *)self isFavorite];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __40__PXFavoriteMemoriesAction_performUndo___block_invoke;
  v6[3] = &__block_descriptor_33_e44_v24__0__PHMemoryChangeRequest_8__NSString_16l;
  BOOL v7 = !v5;
  [(PXMemoriesAction *)self performMemoryChanges:v6 completionHandler:v4];
}

uint64_t __40__PXFavoriteMemoriesAction_performUndo___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setFavorite:*(unsigned __int8 *)(a1 + 32)];
}

- (void)performAction:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(PXFavoriteMemoriesAction *)self isFavorite];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __42__PXFavoriteMemoriesAction_performAction___block_invoke;
  v6[3] = &unk_1E5DAFEE0;
  BOOL v7 = v5;
  void v6[4] = self;
  [(PXMemoriesAction *)self performMemoryChanges:v6 completionHandler:v4];
}

void __42__PXFavoriteMemoriesAction_performAction___block_invoke(uint64_t a1, void *a2, void *a3)
{
  v15[2] = *MEMORY[0x1E4F143B8];
  uint64_t v5 = *(unsigned __int8 *)(a1 + 40);
  id v6 = a3;
  [a2 setFavorite:v5];
  BOOL v7 = (void *)MEMORY[0x1E4F56658];
  if (*(unsigned char *)(a1 + 40)) {
    v8 = @"com.apple.photos.CPAnalytics.assetCollectionFavorited";
  }
  else {
    v8 = @"com.apple.photos.CPAnalytics.assetCollectionUnfavorited";
  }
  uint64_t v9 = *MEMORY[0x1E4F56550];
  v15[0] = v6;
  uint64_t v10 = *MEMORY[0x1E4F56560];
  v14[0] = v9;
  v14[1] = v10;
  v11 = (objc_class *)objc_opt_class();
  v12 = NSStringFromClass(v11);
  v15[1] = v12;
  v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:v14 count:2];
  [v7 sendEvent:v8 withPayload:v13];
}

- (id)actionIdentifier
{
  return @"FavoriteMemories";
}

- (PXFavoriteMemoriesAction)initWithMemories:(id)a3
{
  id v4 = a3;
  uint64_t v5 = -[PXFavoriteMemoriesAction initWithMemories:favorite:](self, "initWithMemories:favorite:", v4, [(id)objc_opt_class() toggledValueForMemories:v4]);

  return v5;
}

- (PXFavoriteMemoriesAction)initWithMemories:(id)a3 favorite:(BOOL)a4
{
  BOOL v4 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PXFavoriteMemoriesAction;
  uint64_t v5 = [(PXMemoriesAction *)&v12 initWithMemories:a3];
  id v6 = v5;
  if (v5)
  {
    v5->_favorite = v4;
    if (v4) {
      BOOL v7 = @"heart";
    }
    else {
      BOOL v7 = @"heart.slash";
    }
    objc_storeStrong((id *)&v5->_actionSystemImageName, v7);
    if (v6->_favorite) {
      v8 = @"PXMemoriesFeedMultiFavoriteActionTitle";
    }
    else {
      v8 = @"PXMemoriesFeedMultiUnfavoriteActionTitle";
    }
    uint64_t v9 = PXLocalizedStringFromTable(v8, @"PhotosUICore");
    localizedActionName = v6->_localizedActionName;
    v6->_localizedActionName = (NSString *)v9;
  }
  return v6;
}

+ (id)menuTitleForMemories:(id)a3
{
  if ([a1 toggledValueForMemories:a3]) {
    v3 = @"PXMemoriesFeedFavoriteMenuActionTitle";
  }
  else {
    v3 = @"PXMemoriesFeedUnfavoriteMenuActionTitle";
  }
  BOOL v4 = PXLocalizedStringFromTable(v3, @"PhotosUICore");
  return v4;
}

+ (BOOL)toggledValueForMemories:(id)a3
{
  id v3 = a3;
  if ([v3 count]) {
    PXExists();
  }

  return 1;
}

uint64_t __52__PXFavoriteMemoriesAction_toggledValueForMemories___block_invoke(uint64_t a1, void *a2)
{
  return [a2 isFavorite] ^ 1;
}

@end