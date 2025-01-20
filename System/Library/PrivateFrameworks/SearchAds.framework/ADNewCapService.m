@interface ADNewCapService
- (ADCapData)capData;
- (ADNewCapService)init;
- (ADNewCapService)initWithStorageType:(int64_t)a3;
- (double)clickExpirationThresholdInSeconds;
- (double)frequencyCapExpirationInSeconds;
- (id)_storageTypeString;
- (id)clickCountByLine;
- (id)impressionCountByLine;
- (int64_t)storageType;
- (unint64_t)maxClickCapElements;
- (unint64_t)maxFrequencyCapElements;
- (void)cleanDownloadData;
- (void)setCapData:(id)a3;
- (void)setClickExpirationThresholdInSeconds:(double)a3;
- (void)setFrequencyCapExpirationInSeconds:(double)a3;
- (void)setMaxClickCapElements:(unint64_t)a3;
- (void)setMaxFrequencyCapElements:(unint64_t)a3;
- (void)setStorageType:(int64_t)a3;
- (void)updateCapData:(id)a3 forType:(int64_t)a4 completionHandler:(id)a5;
- (void)updateClickData:(id)a3 completionHandler:(id)a4;
- (void)updateDownloadData:(id)a3 forType:(int64_t)a4 completionHandler:(id)a5;
- (void)updateFrequencyCapData:(id)a3 completionHandler:(id)a4;
@end

@implementation ADNewCapService

- (ADNewCapService)init
{
  return (ADNewCapService *)objc_msgSend_initWithStorageType_(self, a2, 1, v2, v3);
}

- (ADNewCapService)initWithStorageType:(int64_t)a3
{
  uint64_t v3 = self;
  uint64_t v48 = *MEMORY[0x263EF8340];
  if (a3)
  {
    v45.receiver = self;
    v45.super_class = (Class)ADNewCapService;
    v5 = [(ADNewCapService *)&v45 init];
    uint64_t v3 = v5;
    if (v5)
    {
      v5->_storageType = a3;
      v10 = objc_msgSend_sharedInstance(ADSearchAdsSettings, v6, v7, v8, v9);
      v15 = v10;
      switch(v3->_storageType)
      {
        case 1:
          v16 = objc_msgSend_landingPageSettings(v10, v11, v12, v13, v14);
          break;
        case 2:
        case 3:
          v16 = objc_msgSend_iris1Settings(v10, v11, v12, v13, v14);
          break;
        case 4:
        case 5:
          v16 = objc_msgSend_iris2Settings(v10, v11, v12, v13, v14);
          break;
        case 6:
          v16 = objc_msgSend_metisSettings(v10, v11, v12, v13, v14);
          break;
        case 7:
          v16 = objc_msgSend_floraSettings(v10, v11, v12, v13, v14);
          break;
        default:
          v21 = APLogForCategory();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 134217984;
            int64_t v47 = a3;
            _os_log_impl(&dword_236756000, v21, OS_LOG_TYPE_ERROR, "Unknown Cap storage type: %ld", buf, 0xCu);
          }

          goto LABEL_11;
      }
      v23 = v16;
      objc_msgSend_clickExpirationThresholdInSeconds(v16, v17, v18, v19, v20);
      v3->_clickExpirationThresholdInSeconds = v24;
      objc_msgSend_frequencyCapExpirationInSeconds(v23, v25, v26, v27, v28);
      v3->_frequencyCapExpirationInSeconds = v29;
      v3->_maxFrequencyCapElements = objc_msgSend_maxFrequencyCapElements(v23, v30, v31, v32, v33);
      v3->_maxClickCapElements = objc_msgSend_maxClickCapElements(v23, v34, v35, v36, v37);
      id v38 = objc_alloc(MEMORY[0x263F24190]);
      uint64_t v42 = objc_msgSend_initWithStorageType_(v38, v39, v3->_storageType, v40, v41);
      capData = v3->_capData;
      v3->_capData = (ADCapData *)v42;
    }
    uint64_t v3 = v3;
    v22 = v3;
  }
  else
  {
    v15 = APLogForCategory();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_236756000, v15, OS_LOG_TYPE_ERROR, "Cap Data: Results type is not supported.", buf, 2u);
    }
LABEL_11:

    v22 = 0;
  }

  return v22;
}

- (void)updateFrequencyCapData:(id)a3 completionHandler:(id)a4
{
}

- (void)updateClickData:(id)a3 completionHandler:(id)a4
{
}

- (void)updateCapData:(id)a3 forType:(int64_t)a4 completionHandler:(id)a5
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a5;
  v10 = APLogForCategory();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    uint64_t v26 = "-[ADNewCapService updateCapData:forType:completionHandler:]";
    _os_log_impl(&dword_236756000, v10, OS_LOG_TYPE_DEFAULT, "API call to %s received.", buf, 0xCu);
  }

  objc_initWeak((id *)buf, self);
  v15 = objc_msgSend_workQueue(MEMORY[0x263F24230], v11, v12, v13, v14);
  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = sub_23675BCA0;
  v21[3] = &unk_264CADAC0;
  objc_copyWeak(v24, (id *)buf);
  id v16 = v9;
  id v23 = v16;
  id v17 = v8;
  id v22 = v17;
  v24[1] = (id)a4;
  objc_msgSend_addOperationWithBlock_(v15, v18, (uint64_t)v21, v19, v20);

  objc_destroyWeak(v24);
  objc_destroyWeak((id *)buf);
}

- (void)updateDownloadData:(id)a3 forType:(int64_t)a4 completionHandler:(id)a5
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a5;
  v10 = APLogForCategory();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    uint64_t v26 = "-[ADNewCapService updateDownloadData:forType:completionHandler:]";
    _os_log_impl(&dword_236756000, v10, OS_LOG_TYPE_DEFAULT, "API call to %s received.", buf, 0xCu);
  }

  objc_initWeak((id *)buf, self);
  v15 = objc_msgSend_workQueue(MEMORY[0x263F24230], v11, v12, v13, v14);
  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = sub_23675C05C;
  v21[3] = &unk_264CADAC0;
  objc_copyWeak(v24, (id *)buf);
  v24[1] = (id)a4;
  id v16 = v9;
  id v23 = v16;
  id v17 = v8;
  id v22 = v17;
  objc_msgSend_addOperationWithBlock_(v15, v18, (uint64_t)v21, v19, v20);

  objc_destroyWeak(v24);
  objc_destroyWeak((id *)buf);
}

- (id)clickCountByLine
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  v6 = objc_msgSend_capData(self, a2, v2, v3, v4);
  uint64_t v11 = objc_msgSend_maxClickCapElements(self, v7, v8, v9, v10);
  objc_msgSend_clickExpirationThresholdInSeconds(self, v12, v13, v14, v15);
  objc_msgSend_clickCountByLineMaxClickElements_expirationClickThreshold_(v6, v16, v11, v17, v18);
  uint64_t v19 = (__CFString *)objc_claimAutoreleasedReturnValue();

  uint64_t v20 = APLogForCategory();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v25 = objc_msgSend__storageTypeString(self, v21, v22, v23, v24);
    uint64_t v26 = (void *)v25;
    uint64_t v27 = @"{}";
    if (v19) {
      uint64_t v27 = v19;
    }
    int v29 = 138543619;
    uint64_t v30 = v25;
    __int16 v31 = 2113;
    uint64_t v32 = v27;
    _os_log_impl(&dword_236756000, v20, OS_LOG_TYPE_DEBUG, "[CappingService] Preparing click cap data for %{public}@. Loaded data: %{private}@.", (uint8_t *)&v29, 0x16u);
  }
  return v19;
}

- (id)impressionCountByLine
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  v6 = objc_msgSend_capData(self, a2, v2, v3, v4);
  uint64_t v11 = objc_msgSend_maxFrequencyCapElements(self, v7, v8, v9, v10);
  objc_msgSend_frequencyCapExpirationInSeconds(self, v12, v13, v14, v15);
  objc_msgSend_impressionCountByLineWithMaxFrequencyElements_expirationFrequencyThreshold_(v6, v16, v11, v17, v18);
  uint64_t v19 = (__CFString *)objc_claimAutoreleasedReturnValue();

  uint64_t v20 = APLogForCategory();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v25 = objc_msgSend__storageTypeString(self, v21, v22, v23, v24);
    uint64_t v26 = (void *)v25;
    uint64_t v27 = @"{}";
    if (v19) {
      uint64_t v27 = v19;
    }
    int v29 = 138543619;
    uint64_t v30 = v25;
    __int16 v31 = 2113;
    uint64_t v32 = v27;
    _os_log_impl(&dword_236756000, v20, OS_LOG_TYPE_DEBUG, "[CappingService] Preparing impression cap data for %{public}@. Loaded data: %{private}@.", (uint8_t *)&v29, 0x16u);
  }
  return v19;
}

- (void)cleanDownloadData
{
  objc_msgSend_capData(self, a2, v2, v3, v4);
  id v18 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v10 = objc_msgSend_maxClickCapElements(self, v6, v7, v8, v9);
  objc_msgSend_clickExpirationThresholdInSeconds(self, v11, v12, v13, v14);
  objc_msgSend_cleanDownloadArrayWithMaxClickElements_expirationClickThreshold_(v18, v15, v10, v16, v17);
}

- (id)_storageTypeString
{
  uint64_t v5 = objc_msgSend_storageType(self, a2, v2, v3, v4);
  if ((unint64_t)(v5 - 1) > 6) {
    return @"Results";
  }
  else {
    return off_264CADAE0[v5 - 1];
  }
}

- (ADCapData)capData
{
  return self->_capData;
}

- (void)setCapData:(id)a3
{
}

- (int64_t)storageType
{
  return self->_storageType;
}

- (void)setStorageType:(int64_t)a3
{
  self->_storageType = a3;
}

- (double)clickExpirationThresholdInSeconds
{
  return self->_clickExpirationThresholdInSeconds;
}

- (void)setClickExpirationThresholdInSeconds:(double)a3
{
  self->_clickExpirationThresholdInSeconds = a3;
}

- (double)frequencyCapExpirationInSeconds
{
  return self->_frequencyCapExpirationInSeconds;
}

- (void)setFrequencyCapExpirationInSeconds:(double)a3
{
  self->_frequencyCapExpirationInSeconds = a3;
}

- (unint64_t)maxFrequencyCapElements
{
  return self->_maxFrequencyCapElements;
}

- (void)setMaxFrequencyCapElements:(unint64_t)a3
{
  self->_maxFrequencyCapElements = a3;
}

- (unint64_t)maxClickCapElements
{
  return self->_maxClickCapElements;
}

- (void)setMaxClickCapElements:(unint64_t)a3
{
  self->_maxClickCapElements = a3;
}

- (void).cxx_destruct
{
}

@end