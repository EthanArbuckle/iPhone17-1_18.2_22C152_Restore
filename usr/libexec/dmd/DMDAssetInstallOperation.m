@interface DMDAssetInstallOperation
- (DMDRemoteAssetResolver)assetResolver;
- (void)installOperationDidFinish:(id)a3 asset:(id)a4;
- (void)main;
- (void)setAssetResolver:(id)a3;
@end

@implementation DMDAssetInstallOperation

- (void)main
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_100027DC0;
  v2[3] = &unk_1000CA580;
  v2[4] = self;
  [(DMDPayloadActionOperation *)self performBackgroundContextBlock:v2];
}

- (void)installOperationDidFinish:(id)a3 asset:(id)a4
{
  id v5 = a3;
  [v5 error];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100028268;
  v8[3] = &unk_1000CA5A8;
  v8[4] = self;
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  id v10 = v5;
  id v6 = v5;
  id v7 = v9;
  [(DMDPayloadActionOperation *)self performBackgroundContextBlock:v8];
}

- (DMDRemoteAssetResolver)assetResolver
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_assetResolver);

  return (DMDRemoteAssetResolver *)WeakRetained;
}

- (void)setAssetResolver:(id)a3
{
}

- (void).cxx_destruct
{
}

@end