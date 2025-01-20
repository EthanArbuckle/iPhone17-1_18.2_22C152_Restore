@interface TILinguisticAssetDownloadClientMock
- (NSError)error;
- (TILinguisticAssetDownloadClientMock)init;
- (TILinguisticAssetDownloadClientMock)initWithResult:(int64_t)a3 error:(id)a4;
- (int64_t)result;
- (void)addLinguisticAssetsAssertionForLanguage:(id)a3 assertionID:(id)a4 region:(id)a5 clientID:(id)a6 withHandler:(id)a7;
- (void)fetchAssetUpdateStatusForInputModeIdentifier:(id)a3 callback:(id)a4;
- (void)removeLinguisticAssetsAssertionWithIdentifier:(id)a3 forClientID:(id)a4 withHandler:(id)a5;
- (void)requestLinguisticAssetsForLanguage:(id)a3 completion:(id)a4;
- (void)updateAssetForInputModeIdentifier:(id)a3 callback:(id)a4;
@end

@implementation TILinguisticAssetDownloadClientMock

- (void).cxx_destruct
{
}

- (NSError)error
{
  return self->_error;
}

- (int64_t)result
{
  return self->_result;
}

- (void)updateAssetForInputModeIdentifier:(id)a3 callback:(id)a4
{
}

- (void)fetchAssetUpdateStatusForInputModeIdentifier:(id)a3 callback:(id)a4
{
}

- (void)removeLinguisticAssetsAssertionWithIdentifier:(id)a3 forClientID:(id)a4 withHandler:(id)a5
{
}

- (void)addLinguisticAssetsAssertionForLanguage:(id)a3 assertionID:(id)a4 region:(id)a5 clientID:(id)a6 withHandler:(id)a7
{
}

- (void)requestLinguisticAssetsForLanguage:(id)a3 completion:(id)a4
{
  id v6 = a4;
  int64_t v7 = [(TILinguisticAssetDownloadClientMock *)self result];
  id v8 = [(TILinguisticAssetDownloadClientMock *)self error];
  (*((void (**)(id, int64_t, id))a4 + 2))(v6, v7, v8);
}

- (TILinguisticAssetDownloadClientMock)initWithResult:(int64_t)a3 error:(id)a4
{
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)TILinguisticAssetDownloadClientMock;
  id v8 = [(TILinguisticAssetDownloadClientMock *)&v11 init];
  v9 = v8;
  if (v8)
  {
    v8->_result = a3;
    objc_storeStrong((id *)&v8->_error, a4);
  }

  return v9;
}

- (TILinguisticAssetDownloadClientMock)init
{
  return [(TILinguisticAssetDownloadClientMock *)self initWithResult:-2 error:0];
}

@end