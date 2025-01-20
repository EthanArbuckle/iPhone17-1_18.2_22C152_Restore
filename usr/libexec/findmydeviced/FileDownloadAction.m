@interface FileDownloadAction
- (BOOL)shouldCancelAction:(id)a3;
- (BOOL)shouldWaitForAction:(id)a3;
- (FMDAsset)asset;
- (FMDAssetRegistry)assetRegistry;
- (FMDServerInteractionController)serverInteractionController;
- (FMFileDownloadRequest)request;
- (FileDownloadAction)initWithAsset:(id)a3 serverInteractionController:(id)a4 assetRegistry:(id)a5;
- (id)actionType;
- (void)_saveAsset:(id)a3 fromLocation:(id)a4;
- (void)runWithCompletion:(id)a3;
- (void)setAsset:(id)a3;
- (void)setAssetRegistry:(id)a3;
- (void)setRequest:(id)a3;
- (void)setServerInteractionController:(id)a3;
- (void)willCancelAction;
@end

@implementation FileDownloadAction

- (FileDownloadAction)initWithAsset:(id)a3 serverInteractionController:(id)a4 assetRegistry:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)FileDownloadAction;
  v11 = [(FileDownloadAction *)&v14 init];
  v12 = v11;
  if (v11)
  {
    [(FileDownloadAction *)v11 setAsset:v8];
    [(FileDownloadAction *)v12 setServerInteractionController:v9];
    [(FileDownloadAction *)v12 setAssetRegistry:v10];
  }

  return v12;
}

- (id)actionType
{
  return @"FileDownloadAction";
}

- (void)runWithCompletion:(id)a3
{
  id v4 = a3;
  v5 = [FMFileDownloadRequest alloc];
  v6 = [(FileDownloadAction *)self asset];
  v7 = [(FMFileDownloadRequest *)v5 initWithAsset:v6];

  objc_initWeak(&location, self);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1000227F0;
  v10[3] = &unk_1002D9EE0;
  objc_copyWeak(&v12, &location);
  id v8 = v4;
  id v11 = v8;
  [(FMDRequest *)v7 setCompletionHandler:v10];
  [(FileDownloadAction *)self setRequest:v7];
  id v9 = [(FileDownloadAction *)self serverInteractionController];
  [v9 enqueueRequest:v7];

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

- (void)_saveAsset:(id)a3 fromLocation:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    id v8 = [(FileDownloadAction *)self assetRegistry];
    [v8 storeAsset:v6 fromLocation:v7];
  }
  else
  {
    id v8 = sub_100004238();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_10023C424(v8);
    }
  }
}

- (void)willCancelAction
{
  id v4 = [(FileDownloadAction *)self serverInteractionController];
  v3 = [(FileDownloadAction *)self request];
  [v4 cancelRequest:v3];
}

- (BOOL)shouldWaitForAction:(id)a3
{
  return 0;
}

- (BOOL)shouldCancelAction:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v5 = [v4 asset];
    id v6 = [v5 url];
    id v7 = [v6 absoluteString];
    id v8 = [(FileDownloadAction *)self asset];
    id v9 = [v8 url];
    id v10 = [v9 absoluteString];
    unsigned __int8 v11 = [v7 isEqualToString:v10];
  }
  else
  {
    unsigned __int8 v11 = 0;
  }

  return v11;
}

- (FMDAsset)asset
{
  return self->_asset;
}

- (void)setAsset:(id)a3
{
}

- (FMDServerInteractionController)serverInteractionController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_serverInteractionController);

  return (FMDServerInteractionController *)WeakRetained;
}

- (void)setServerInteractionController:(id)a3
{
}

- (FMDAssetRegistry)assetRegistry
{
  return self->_assetRegistry;
}

- (void)setAssetRegistry:(id)a3
{
}

- (FMFileDownloadRequest)request
{
  return self->_request;
}

- (void)setRequest:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_request, 0);
  objc_storeStrong((id *)&self->_assetRegistry, 0);
  objc_destroyWeak((id *)&self->_serverInteractionController);

  objc_storeStrong((id *)&self->_asset, 0);
}

@end