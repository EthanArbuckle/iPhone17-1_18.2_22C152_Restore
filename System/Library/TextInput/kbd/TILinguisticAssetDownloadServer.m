@interface TILinguisticAssetDownloadServer
+ (id)_dispatchQueue;
+ (id)sharedServer;
+ (int64_t)serverResultForAssetManagerResult:(int64_t)a3;
- (BOOL)isStarted;
- (void)addLinguisticAssetsAssertionForLanguage:(id)a3 assertionID:(id)a4 region:(id)a5 clientID:(id)a6 withHandler:(id)a7;
- (void)fetchAssetUpdateStatusForInputModeIdentifier:(id)a3 callback:(id)a4;
- (void)removeLinguisticAssetsAssertionWithIdentifier:(id)a3 forClientID:(id)a4 withHandler:(id)a5;
- (void)requestLinguisticAssetsForLanguage:(id)a3 completion:(id)a4;
- (void)start;
- (void)stop;
- (void)updateAssetForInputModeIdentifier:(id)a3 callback:(id)a4;
@end

@implementation TILinguisticAssetDownloadServer

+ (id)sharedServer
{
  if (qword_100026E78 != -1) {
    dispatch_once(&qword_100026E78, &stru_10001CB20);
  }
  v2 = (void *)qword_100026E70;
  return v2;
}

+ (id)_dispatchQueue
{
  if (qword_100026E88 != -1) {
    dispatch_once(&qword_100026E88, &stru_10001CB40);
  }
  v2 = (void *)qword_100026E80;
  return v2;
}

- (void)start
{
  v2 = +[TILinguisticAssetDownloadServer _dispatchQueue];
  TIDispatchAsync();
}

- (void)stop
{
  v2 = +[TILinguisticAssetDownloadServer _dispatchQueue];
  TIDispatchAsync();
}

+ (int64_t)serverResultForAssetManagerResult:(int64_t)a3
{
  if ((unint64_t)(a3 + 1) >= 4) {
    return 0;
  }
  else {
    return a3;
  }
}

- (void)requestLinguisticAssetsForLanguage:(id)a3 completion:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = +[TILinguisticAssetDownloadServer _dispatchQueue];
  v10 = v6;
  id v8 = v6;
  id v9 = v5;
  TIDispatchAsync();
}

- (void)addLinguisticAssetsAssertionForLanguage:(id)a3 assertionID:(id)a4 region:(id)a5 clientID:(id)a6 withHandler:(id)a7
{
  id v11 = a7;
  id v12 = a6;
  id v13 = a5;
  id v14 = a4;
  id v15 = a3;
  id v16 = +[TIAssetManager sharedAssetManager];
  [v16 addLinguisticAssetsAssertionForLanguage:v15 assertionID:v14 region:v13 clientID:v12 withHandler:v11];
}

- (void)removeLinguisticAssetsAssertionWithIdentifier:(id)a3 forClientID:(id)a4 withHandler:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  id v10 = +[TIAssetManager sharedAssetManager];
  [v10 removeLinguisticAssetsAssertionWithIdentifier:v9 forClientID:v8 withHandler:v7];
}

- (void)fetchAssetUpdateStatusForInputModeIdentifier:(id)a3 callback:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = +[TIAssetManager sharedAssetManager];
  [v7 fetchAssetUpdateStatusForInputModeIdentifier:v6 callback:v5];
}

- (void)updateAssetForInputModeIdentifier:(id)a3 callback:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = +[TIAssetManager sharedAssetManager];
  [v7 updateAssetForInputModeIdentifier:v6 callback:v5];
}

- (BOOL)isStarted
{
  return self->_isStarted;
}

@end