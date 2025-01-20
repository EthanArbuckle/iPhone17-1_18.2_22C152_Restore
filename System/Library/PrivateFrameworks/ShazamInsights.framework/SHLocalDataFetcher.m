@interface SHLocalDataFetcher
- (void)clusterDataAtURL:(id)a3 forLocation:(id)a4 date:(id)a5 completionHandler:(id)a6;
- (void)fetchClusterURL:(id)a3 forCurrentStorefront:(id)a4 cachedUniqueHash:(id)a5 completionHandler:(id)a6;
@end

@implementation SHLocalDataFetcher

- (void)fetchClusterURL:(id)a3 forCurrentStorefront:(id)a4 cachedUniqueHash:(id)a5 completionHandler:(id)a6
{
  id v19 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = (void (**)(id, void, SHDataFetcherFileInfo *))a6;
  v12 = [MEMORY[0x263F08850] defaultManager];
  v13 = [v19 path];
  int v14 = [v12 fileExistsAtPath:v13];

  if (v14)
  {
    v15 = +[SHFileChecksum checksumForFile:v19 withError:0];
    v16 = v15;
    if (v15 && [(SHDataFetcherFileInfo *)v15 isEqualToString:v10])
    {
      v17 = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.ShazamInsightsDataFetcher" code:100 userInfo:0];
      v11[2](v11, 0, v17);
    }
    else
    {
      v17 = [[SHDataFetcherFileInfo alloc] initWithDataURL:v19];
      [(SHDataFetcherFileInfo *)v17 setStorefront:v9];
      v18 = [MEMORY[0x263EFF910] date];
      [(SHDataFetcherFileInfo *)v17 setCreationDate:v18];

      [(SHDataFetcherFileInfo *)v17 setUniqueHash:v16];
      ((void (**)(id, SHDataFetcherFileInfo *, SHDataFetcherFileInfo *))v11)[2](v11, v17, 0);
    }
  }
  else
  {
    v16 = +[SHInsightsError errorWithCode:200 underlyingError:0];
    v11[2](v11, 0, v16);
  }
}

- (void)clusterDataAtURL:(id)a3 forLocation:(id)a4 date:(id)a5 completionHandler:(id)a6
{
  id v16 = a3;
  id v8 = a5;
  id v9 = (void *)MEMORY[0x263EFF8F8];
  id v10 = (void (**)(id, void *, void *))a6;
  v11 = [v9 dataWithContentsOfURL:v16];
  if (v11)
  {
    v12 = [SHDataFetcherFileInfo alloc];
    v13 = [v16 lastPathComponent];
    int v14 = [(SHDataFetcherFileInfo *)v12 initWithData:v11 suggestedFileName:v13];

    [(SHDataFetcherFileInfo *)v14 setCreationDate:v8];
    v15 = 0;
  }
  else
  {
    v15 = +[SHInsightsError errorWithCode:200 underlyingError:0];
    int v14 = 0;
  }
  v10[2](v10, v14, v15);
}

@end