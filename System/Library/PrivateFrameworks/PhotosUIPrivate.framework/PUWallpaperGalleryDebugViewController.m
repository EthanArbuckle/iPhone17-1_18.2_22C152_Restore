@interface PUWallpaperGalleryDebugViewController
- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5;
- (NSArray)suggestions;
- (NSDictionary)keyAssetBySuggestionUUID;
- (PUPassiveContentDebugViewSpec)spec;
- (PUWallpaperGalleryDebugViewController)initWithSpec:(id)a3;
- (UIEdgeInsets)collectionView:(id)a3 layout:(id)a4 insetForSectionAtIndex:(int64_t)a5;
- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4;
- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4;
- (int64_t)numberOfSectionsInCollectionView:(id)a3;
- (void)setKeyAssetBySuggestionUUID:(id)a3;
- (void)setSpec:(id)a3;
- (void)setSuggestions:(id)a3;
- (void)viewDidLoad;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation PUWallpaperGalleryDebugViewController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keyAssetBySuggestionUUID, 0);
  objc_storeStrong((id *)&self->_spec, 0);
  objc_storeStrong((id *)&self->_suggestions, 0);
}

- (void)setKeyAssetBySuggestionUUID:(id)a3
{
}

- (NSDictionary)keyAssetBySuggestionUUID
{
  return self->_keyAssetBySuggestionUUID;
}

- (void)setSpec:(id)a3
{
}

- (PUPassiveContentDebugViewSpec)spec
{
  return self->_spec;
}

- (NSArray)suggestions
{
  return self->_suggestions;
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)PUWallpaperGalleryDebugViewController;
  -[PUWallpaperGalleryDebugViewController viewWillTransitionToSize:withTransitionCoordinator:](&v7, sel_viewWillTransitionToSize_withTransitionCoordinator_, a4, a3.width, a3.height);
  v5 = [(PUWallpaperGalleryDebugViewController *)self collectionView];
  v6 = [v5 collectionViewLayout];
  [v6 invalidateLayout];
}

- (UIEdgeInsets)collectionView:(id)a3 layout:(id)a4 insetForSectionAtIndex:(int64_t)a5
{
  v5 = [(PUWallpaperGalleryDebugViewController *)self spec];
  [v5 collectionViewContentInsets];
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;

  double v14 = v7;
  double v15 = v9;
  double v16 = v11;
  double v17 = v13;
  result.right = v17;
  result.bottom = v16;
  result.left = v15;
  result.top = v14;
  return result;
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5
{
  v5 = [(PUWallpaperGalleryDebugViewController *)self spec];
  [v5 itemSize];
  double v7 = v6;
  double v9 = v8;

  double v10 = v7;
  double v11 = v9;
  result.height = v11;
  result.width = v10;
  return result;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v6 = a4;
  double v7 = [a3 dequeueReusableCellWithReuseIdentifier:@"wallpaperCell" forIndexPath:v6];
  double v8 = [(PUWallpaperGalleryDebugViewController *)self suggestions];
  uint64_t v9 = [v6 row];

  double v10 = [v8 objectAtIndexedSubscript:v9];

  double v11 = [(PUWallpaperGalleryDebugViewController *)self keyAssetBySuggestionUUID];
  double v12 = [v10 uuid];
  double v13 = [v11 objectForKeyedSubscript:v12];

  [v7 setAsset:v13];
  uint64_t v14 = objc_msgSend(MEMORY[0x1E4F8E858], "posterClassificationForSuggestionSubtype:", objc_msgSend(v10, "subtype"));
  double v15 = [v7 wallpaperView];
  [v15 setClassificationMode:v14];

  return v7;
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  v4 = [(PUWallpaperGalleryDebugViewController *)self suggestions];
  int64_t v5 = [v4 count];

  return v5;
}

- (int64_t)numberOfSectionsInCollectionView:(id)a3
{
  return 1;
}

- (void)viewDidLoad
{
  v4.receiver = self;
  v4.super_class = (Class)PUWallpaperGalleryDebugViewController;
  [(PUWallpaperGalleryDebugViewController *)&v4 viewDidLoad];
  v3 = [(PUWallpaperGalleryDebugViewController *)self collectionView];
  [v3 registerClass:objc_opt_class() forCellWithReuseIdentifier:@"wallpaperCell"];
}

- (void)setSuggestions:(id)a3
{
  p_suggestions = &self->_suggestions;
  id v13 = a3;
  if ((-[NSArray isEqual:](*p_suggestions, "isEqual:") & 1) == 0)
  {
    objc_storeStrong((id *)&self->_suggestions, a3);
    if ([(NSArray *)*p_suggestions count])
    {
      id v6 = [(NSArray *)*p_suggestions firstObject];
      double v7 = [v6 photoLibrary];

      id v8 = objc_alloc(MEMORY[0x1E4F39150]);
      uint64_t v9 = (void *)[v8 initWithObjects:*p_suggestions photoLibrary:v7 fetchType:*MEMORY[0x1E4F39688] fetchPropertySets:0 identifier:0 registerIfNeeded:0];
      double v10 = [v7 librarySpecificFetchOptions];
      double v11 = [MEMORY[0x1E4F38EB8] fetchKeyAssetBySuggestionUUIDForSuggestions:v9 options:v10];
      [(PUWallpaperGalleryDebugViewController *)self setKeyAssetBySuggestionUUID:v11];

      double v12 = [(PUWallpaperGalleryDebugViewController *)self collectionView];
      [v12 reloadData];
    }
  }
}

- (PUWallpaperGalleryDebugViewController)initWithSpec:(id)a3
{
  id v5 = a3;
  id v6 = objc_alloc_init(MEMORY[0x1E4FB15C0]);
  double v7 = [(PUWallpaperGalleryDebugViewController *)self initWithCollectionViewLayout:v6];
  id v8 = v7;
  if (v7) {
    objc_storeStrong((id *)&v7->_spec, a3);
  }

  return v8;
}

@end