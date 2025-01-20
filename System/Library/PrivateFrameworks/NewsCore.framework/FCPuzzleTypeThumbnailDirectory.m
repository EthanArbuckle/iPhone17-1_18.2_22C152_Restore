@interface FCPuzzleTypeThumbnailDirectory
- (FCAssetManager)assetManager;
- (FCContentContext)context;
- (FCPuzzleTypeThumbnailDirectory)initWithResourceMapId:(id)a3 assetManager:(id)a4 context:(id)a5;
- (NSString)resourceMapId;
- (id)smallThumbnailForDate:(id)a3 difficulty:(id)a4;
- (void)setAssetManager:(id)a3;
- (void)setContext:(id)a3;
- (void)setResourceMapId:(id)a3;
@end

@implementation FCPuzzleTypeThumbnailDirectory

- (FCPuzzleTypeThumbnailDirectory)initWithResourceMapId:(id)a3 assetManager:(id)a4 context:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)FCPuzzleTypeThumbnailDirectory;
  v11 = [(FCPuzzleTypeThumbnailDirectory *)&v14 init];
  v12 = v11;
  if (v11)
  {
    [(FCPuzzleTypeThumbnailDirectory *)v11 setAssetManager:v9];
    [(FCPuzzleTypeThumbnailDirectory *)v12 setContext:v10];
    [(FCPuzzleTypeThumbnailDirectory *)v12 setResourceMapId:v8];
  }

  return v12;
}

- (id)smallThumbnailForDate:(id)a3 difficulty:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(FCPuzzleTypeThumbnailDirectory *)self resourceMapId];

  if (v8)
  {
    id v9 = [(FCPuzzleTypeThumbnailDirectory *)self resourceMapId];
    id v10 = +[FCPuzzleThumbnailURLProtocol URLForResourceMapID:v9 publishDate:v6 difficulty:v7];

    v11 = [(FCPuzzleTypeThumbnailDirectory *)self assetManager];
    v12 = [v11 assetHandleForURL:v10 lifetimeHint:0];
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (FCAssetManager)assetManager
{
  return self->_assetManager;
}

- (void)setAssetManager:(id)a3
{
}

- (NSString)resourceMapId
{
  return self->_resourceMapId;
}

- (void)setResourceMapId:(id)a3
{
}

- (FCContentContext)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_resourceMapId, 0);
  objc_storeStrong((id *)&self->_assetManager, 0);
}

@end