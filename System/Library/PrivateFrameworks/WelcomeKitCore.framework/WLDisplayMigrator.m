@interface WLDisplayMigrator
+ (id)contentType;
- (BOOL)accountBased;
- (BOOL)storeRecordDataInDatabase;
- (BOOL)wantsSegmentedDownloads;
- (WLFeaturePayload)featurePayload;
- (id)contentType;
- (id)dataType;
- (void)addWorkingTime:(unint64_t)a3;
- (void)enable;
- (void)estimateItemSizeForSummary:(id)a3 account:(id)a4;
- (void)importRecordData:(id)a3 summary:(id)a4 account:(id)a5 completion:(id)a6;
- (void)setFeaturePayload:(id)a3;
- (void)setState:(id)a3;
@end

@implementation WLDisplayMigrator

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

- (void)addWorkingTime:(unint64_t)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_featurePayload);
  objc_msgSend(WeakRetained, "setElapsedTime:", objc_msgSend(WeakRetained, "elapsedTime") + a3);
}

+ (id)contentType
{
  return @"display";
}

- (id)contentType
{
  return +[WLDisplayMigrator contentType];
}

- (id)dataType
{
  return +[WLDisplayMigrator contentType];
}

- (BOOL)accountBased
{
  return 1;
}

- (BOOL)storeRecordDataInDatabase
{
  return 1;
}

- (BOOL)wantsSegmentedDownloads
{
  return 0;
}

- (void)estimateItemSizeForSummary:(id)a3 account:(id)a4
{
  id v4 = a3;
  if (![v4 itemSize]) {
    [v4 setItemSize:5242880];
  }
}

- (void)importRecordData:(id)a3 summary:(id)a4 account:(id)a5 completion:(id)a6
{
  v26[1] = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v12 = (void (**)(id, uint64_t, void))a6;
  if (v9 && [v9 length])
  {
    v13 = [MEMORY[0x263F862A8] settingsWithData:v9];
    v14 = v13;
    if (v13)
    {
      objc_msgSend(MEMORY[0x263F862C0], "setBool:forKey:", objc_msgSend(v13, "enableDisplayZoom"), @"enable_display_zoom");
      if ([v14 enableDisplayDarkMode])
      {
        v15 = (void *)[objc_alloc(MEMORY[0x263F83E90]) initWithDelegate:0];
        [v15 setModeValue:2];
      }
      if (v12) {
        v12[2](v12, 1, 0);
      }
    }
    else
    {
      _WLLog();
      if (v12)
      {
        v19 = (void *)MEMORY[0x263F087E8];
        uint64_t v20 = *MEMORY[0x263F86308];
        uint64_t v23 = *MEMORY[0x263F08320];
        v24 = @"did fail to convert json";
        v21 = [NSDictionary dictionaryWithObjects:&v24 forKeys:&v23 count:1];
        v22 = [v19 errorWithDomain:v20 code:1 userInfo:v21];

        ((void (**)(id, uint64_t, void *))v12)[2](v12, 0, v22);
      }
    }
    goto LABEL_10;
  }
  _WLLog();
  if (v12)
  {
    v16 = (void *)MEMORY[0x263F087E8];
    uint64_t v17 = *MEMORY[0x263F86308];
    uint64_t v25 = *MEMORY[0x263F08320];
    v26[0] = @"could not import anything from nil data";
    v18 = [NSDictionary dictionaryWithObjects:v26 forKeys:&v25 count:1];
    v14 = [v16 errorWithDomain:v17 code:1 userInfo:v18];

    ((void (**)(id, uint64_t, void *))v12)[2](v12, 0, v14);
LABEL_10:
  }
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
}

@end