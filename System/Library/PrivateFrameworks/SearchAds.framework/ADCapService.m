@interface ADCapService
- (ADCapData)capData;
- (ADCapService)init;
- (id)clickCountByLine;
- (id)impressionCountByLine;
- (void)cleanDownloadData;
- (void)setCapData:(id)a3;
- (void)updateCapData:(id)a3 forType:(int64_t)a4 completionHandler:(id)a5;
- (void)updateClickData:(id)a3 completionHandler:(id)a4;
- (void)updateDownloadData:(id)a3 identifier:(id)a4 forType:(int64_t)a5 completionHandler:(id)a6;
- (void)updateFrequencyCapData:(id)a3 completionHandler:(id)a4;
@end

@implementation ADCapService

- (ADCapService)init
{
  v10.receiver = self;
  v10.super_class = (Class)ADCapService;
  v6 = [(ADCapService *)&v10 init];
  if (v6)
  {
    uint64_t v7 = objc_msgSend_sharedInstance(MEMORY[0x263F24190], v2, v3, v4, v5);
    capData = v6->_capData;
    v6->_capData = (ADCapData *)v7;
  }
  return v6;
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
  objc_super v10 = APLogForCategory();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v26 = "-[ADCapService updateCapData:forType:completionHandler:]";
    _os_log_impl(&dword_236756000, v10, OS_LOG_TYPE_DEFAULT, "API call to %s received.", buf, 0xCu);
  }

  objc_initWeak((id *)buf, self);
  v15 = objc_msgSend_workQueue(MEMORY[0x263F24230], v11, v12, v13, v14);
  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = sub_23675D9B0;
  v21[3] = &unk_264CADB50;
  objc_copyWeak(v24, (id *)buf);
  v21[4] = self;
  id v16 = v9;
  id v23 = v16;
  id v17 = v8;
  id v22 = v17;
  v24[1] = (id)a4;
  objc_msgSend_addOperationWithBlock_(v15, v18, (uint64_t)v21, v19, v20);

  objc_destroyWeak(v24);
  objc_destroyWeak((id *)buf);
}

- (void)updateDownloadData:(id)a3 identifier:(id)a4 forType:(int64_t)a5 completionHandler:(id)a6
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  uint64_t v13 = APLogForCategory();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    v31 = "-[ADCapService updateDownloadData:identifier:forType:completionHandler:]";
    __int16 v32 = 2112;
    id v33 = v11;
    __int16 v34 = 2048;
    int64_t v35 = a5;
    _os_log_impl(&dword_236756000, v13, OS_LOG_TYPE_DEFAULT, "%s (identifier: %@ type:%ld)", buf, 0x20u);
  }

  objc_initWeak((id *)buf, self);
  v18 = objc_msgSend_workQueue(MEMORY[0x263F24230], v14, v15, v16, v17);
  v25[0] = MEMORY[0x263EF8330];
  v25[1] = 3221225472;
  v25[2] = sub_23675DE88;
  v25[3] = &unk_264CADB78;
  objc_copyWeak(v29, (id *)buf);
  v29[1] = (id)a5;
  id v19 = v12;
  id v28 = v19;
  v25[4] = self;
  id v20 = v10;
  id v26 = v20;
  id v21 = v11;
  id v27 = v21;
  objc_msgSend_addOperationWithBlock_(v18, v22, (uint64_t)v25, v23, v24);

  objc_destroyWeak(v29);
  objc_destroyWeak((id *)buf);
}

- (id)clickCountByLine
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  uint64_t v5 = objc_msgSend_capData(self, a2, v2, v3, v4);
  objc_msgSend_clickCountByLine(v5, v6, v7, v8, v9);
  id v10 = (__CFString *)objc_claimAutoreleasedReturnValue();

  id v11 = APLogForCategory();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    id v12 = @"{}";
    if (v10) {
      id v12 = v10;
    }
    int v14 = 138477827;
    uint64_t v15 = v12;
    _os_log_impl(&dword_236756000, v11, OS_LOG_TYPE_DEBUG, "[CappingService] Preparing click cap data for Search Results Page (SRP). Loaded data: %{private}@.", (uint8_t *)&v14, 0xCu);
  }

  return v10;
}

- (id)impressionCountByLine
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  uint64_t v5 = objc_msgSend_capData(self, a2, v2, v3, v4);
  objc_msgSend_impressionCountByLine(v5, v6, v7, v8, v9);
  id v10 = (__CFString *)objc_claimAutoreleasedReturnValue();

  id v11 = APLogForCategory();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    id v12 = @"{}";
    if (v10) {
      id v12 = v10;
    }
    int v14 = 138477827;
    uint64_t v15 = v12;
    _os_log_impl(&dword_236756000, v11, OS_LOG_TYPE_DEBUG, "[CappingService] Preparing impression cap data for Search Results Page (SRP). Loaded data: %{private}@.", (uint8_t *)&v14, 0xCu);
  }

  return v10;
}

- (void)cleanDownloadData
{
  objc_msgSend_capData(self, a2, v2, v3, v4);
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_cleanDownloadArray(v9, v5, v6, v7, v8);
}

- (ADCapData)capData
{
  return self->_capData;
}

- (void)setCapData:(id)a3
{
}

- (void).cxx_destruct
{
}

@end