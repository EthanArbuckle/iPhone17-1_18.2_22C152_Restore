@interface WLPhotosMigrator
+ (id)contentType;
- (BOOL)accountBased;
- (BOOL)storeRecordDataInDatabase;
- (BOOL)wantsSegmentedDownloads;
- (WLFeaturePayload)featurePayload;
- (id)contentType;
- (id)dataType;
- (id)importDidEnd;
- (id)importWillBegin;
- (unint64_t)importErrorCount;
- (void)addWorkingTime:(unint64_t)a3;
- (void)enable;
- (void)importRecordData:(id)a3 summary:(id)a4 account:(id)a5 completion:(id)a6;
- (void)setEstimatedDataSize:(unint64_t)a3;
- (void)setFeaturePayload:(id)a3;
- (void)setState:(id)a3;
@end

@implementation WLPhotosMigrator

- (void)enable
{
  p_featurePayload = &self->_featurePayload;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_featurePayload);
  [WeakRetained setEnabled:1];

  id v4 = objc_loadWeakRetained((id *)p_featurePayload);
  [v4 setState:@"enabled"];
}

- (void)setState:(id)a3
{
  p_featurePayload = &self->_featurePayload;
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_featurePayload);
  [WeakRetained setState:v4];
}

- (void)setEstimatedDataSize:(unint64_t)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_featurePayload);
  [WeakRetained setSize:a3];
}

- (void)addWorkingTime:(unint64_t)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_featurePayload);
  objc_msgSend(WeakRetained, "setElapsedTime:", objc_msgSend(WeakRetained, "elapsedTime") + a3);
}

- (BOOL)accountBased
{
  return 0;
}

+ (id)contentType
{
  return @"files/photo";
}

- (id)contentType
{
  return +[WLPhotosMigrator contentType];
}

- (id)dataType
{
  return @"cameraroll";
}

- (BOOL)storeRecordDataInDatabase
{
  return 0;
}

- (BOOL)wantsSegmentedDownloads
{
  return 1;
}

- (id)importWillBegin
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_featurePayload);
  [WeakRetained setSize:0];

  id v4 = [[WLPhotoLibrary alloc] initWithContentType:0];
  photoLibrary = self->_photoLibrary;
  self->_photoLibrary = v4;

  return 0;
}

- (id)importDidEnd
{
  unint64_t v3 = [(WLPhotoLibrary *)self->_photoLibrary errorCount];
  photoLibrary = self->_photoLibrary;
  self->_importErrorCount = v3;
  self->_photoLibrary = 0;

  return 0;
}

- (unint64_t)importErrorCount
{
  return self->_importErrorCount;
}

- (void)importRecordData:(id)a3 summary:(id)a4 account:(id)a5 completion:(id)a6
{
  id v8 = a6;
  id v9 = a4;
  uint64_t v10 = [v9 itemSize];
  v11 = [v9 dataFilePath];
  v12 = [v9 identifier];
  v13 = [v12 lastPathComponent];

  v14 = [v9 bucket];

  id WeakRetained = objc_loadWeakRetained((id *)&self->_featurePayload);
  objc_msgSend(WeakRetained, "setCount:", objc_msgSend(WeakRetained, "count") + 1);

  id v16 = objc_loadWeakRetained((id *)&self->_featurePayload);
  objc_msgSend(v16, "setSize:", objc_msgSend(v16, "size") + v10);

  photoLibrary = self->_photoLibrary;
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __64__WLPhotosMigrator_importRecordData_summary_account_completion___block_invoke;
  v19[3] = &unk_26490C038;
  id v20 = v8;
  id v18 = v8;
  [(WLPhotoLibrary *)photoLibrary addAsset:v11 filename:v13 size:v10 collection:v14 completion:v19];
}

uint64_t __64__WLPhotosMigrator_importRecordData_summary_account_completion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (WLFeaturePayload)featurePayload
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_featurePayload);
  return (WLFeaturePayload *)WeakRetained;
}

- (void)setFeaturePayload:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_featurePayload);
  objc_storeStrong((id *)&self->_photoLibrary, 0);
}

@end