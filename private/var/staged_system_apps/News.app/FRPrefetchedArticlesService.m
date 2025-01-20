@interface FRPrefetchedArticlesService
- (FCAssetManager)assetManager;
- (FRFeldsparContext)feldsparContext;
- (FRPrefetchedArticlesService)initWithFeldsparContext:(id)a3 assetManager:(id)a4;
- (id)ts_fetchArticlesWithURL:(id)a3;
- (void)setAssetManager:(id)a3;
- (void)setFeldsparContext:(id)a3;
@end

@implementation FRPrefetchedArticlesService

- (FRPrefetchedArticlesService)initWithFeldsparContext:(id)a3 assetManager:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (!v7 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_100075658();
    if (v8) {
      goto LABEL_6;
    }
  }
  else if (v8)
  {
    goto LABEL_6;
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_100075578();
  }
LABEL_6:
  v12.receiver = self;
  v12.super_class = (Class)FRPrefetchedArticlesService;
  v9 = [(FRPrefetchedArticlesService *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_feldsparContext, a3);
    objc_storeStrong((id *)&v10->_assetManager, a4);
  }

  return v10;
}

- (id)ts_fetchArticlesWithURL:(id)a3
{
  id v4 = a3;
  uint64_t v9 = 0;
  v10 = &v9;
  uint64_t v11 = 0x3032000000;
  objc_super v12 = sub_100018AC0;
  v13 = sub_1000189E8;
  id v14 = 0;
  v5 = [(FRPrefetchedArticlesService *)self assetManager];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10003D750;
  v8[3] = &unk_1000C7968;
  v8[4] = self;
  v8[5] = &v9;
  [v4 fr_feldsparArticleIDWithAssetManager:v5 completion:v8];

  id v6 = (id)v10[5];
  _Block_object_dispose(&v9, 8);

  return v6;
}

- (FRFeldsparContext)feldsparContext
{
  return self->_feldsparContext;
}

- (void)setFeldsparContext:(id)a3
{
}

- (FCAssetManager)assetManager
{
  return self->_assetManager;
}

- (void)setAssetManager:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetManager, 0);

  objc_storeStrong((id *)&self->_feldsparContext, 0);
}

@end