@interface PLSimpleAlbum
- (BOOL)canPerformEditOperation:(unint64_t)a3;
- (BOOL)canShowAvalancheStacks;
- (BOOL)canShowComments;
- (BOOL)isEmpty;
- (NSArray)localizedLocationNames;
- (NSOrderedSet)assets;
- (NSString)localizedTitle;
- (NSString)title;
- (NSString)uuid;
- (PLSimpleAlbum)initWithTitle:(id)a3 assets:(id)a4;
- (int64_t)_countOfAssetType:(signed __int16)a3;
- (unint64_t)assetsCount;
- (unint64_t)photosCount;
- (unint64_t)videosCount;
@end

@implementation PLSimpleAlbum

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assets, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

- (NSArray)localizedLocationNames
{
  return 0;
}

- (BOOL)canShowAvalancheStacks
{
  return 0;
}

- (BOOL)canShowComments
{
  return 0;
}

- (BOOL)canPerformEditOperation:(unint64_t)a3
{
  return 0;
}

- (BOOL)isEmpty
{
  return [(PLSimpleAlbum *)self assetsCount] == 0;
}

- (unint64_t)videosCount
{
  return [(PLSimpleAlbum *)self _countOfAssetType:1];
}

- (unint64_t)photosCount
{
  return [(PLSimpleAlbum *)self _countOfAssetType:0];
}

- (unint64_t)assetsCount
{
  v2 = [(PLSimpleAlbum *)self assets];
  unint64_t v3 = [v2 count];

  return v3;
}

- (NSOrderedSet)assets
{
  return self->_assets;
}

- (NSString)localizedTitle
{
  v2 = [(PLSimpleAlbum *)self title];
  unint64_t v3 = PLLocalizedFrameworkString();

  return (NSString *)v3;
}

- (NSString)title
{
  return self->_title;
}

- (NSString)uuid
{
  return 0;
}

- (int64_t)_countOfAssetType:(signed __int16)a3
{
  uint64_t v8 = 0;
  v9 = &v8;
  uint64_t v10 = 0x2020000000;
  uint64_t v11 = 0;
  assets = self->_assets;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __35__PLSimpleAlbum__countOfAssetType___block_invoke;
  v6[3] = &unk_1E586DB68;
  signed __int16 v7 = a3;
  v6[4] = &v8;
  [(NSOrderedSet *)assets enumerateObjectsUsingBlock:v6];
  int64_t v4 = v9[3];
  _Block_object_dispose(&v8, 8);
  return v4;
}

uint64_t __35__PLSimpleAlbum__countOfAssetType___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result = [a2 kind];
  if (*(unsigned __int16 *)(a1 + 40) == (unsigned __int16)result) {
    ++*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  return result;
}

- (PLSimpleAlbum)initWithTitle:(id)a3 assets:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)PLSimpleAlbum;
  uint64_t v8 = [(PLSimpleAlbum *)&v14 init];
  if (v8)
  {
    uint64_t v9 = [v7 copy];
    assets = v8->_assets;
    v8->_assets = (NSOrderedSet *)v9;

    uint64_t v11 = [v6 copy];
    title = v8->_title;
    v8->_title = (NSString *)v11;
  }
  return v8;
}

@end