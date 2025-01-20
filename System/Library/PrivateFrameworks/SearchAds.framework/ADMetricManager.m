@interface ADMetricManager
+ (id)sharedInstance;
+ (id)testInstance;
- (ADCapService)capService;
- (ADDESRecordsManager)desRecordManager;
- (ADMetricManager)init;
- (NSMutableDictionary)activeAdvertisementsByInstanceID;
- (NSMutableSet)clickCapUpdated;
- (NSMutableSet)downloadCapUpdated;
- (NSMutableSet)frequencyCapUpdated;
- (id)buttonStateToString:(int64_t)a3;
- (id)frequencyCapTypeToString:(int64_t)a3;
- (int64_t)buttonStateToDownloadType:(int64_t)a3;
- (void)activateAdvertisements:(id)a3;
- (void)adMarkerInteracted:(id)a3;
- (void)completed:(id)a3;
- (void)deactivateAdvertisements:(id)a3;
- (void)deactivateAdvertisementsByInstanceIDs:(id)a3;
- (void)deactivateAllAdvertisements;
- (void)discarded:(id)a3;
- (void)getApp:(id)a3 buttonState:(int64_t)a4 completion:(id)a5;
- (void)getApp:(id)a3 buttonState:(int64_t)a4 withCompletion:(id)a5;
- (void)interacted:(id)a3;
- (void)offScreen:(id)a3;
- (void)onScreen:(id)a3;
- (void)placed:(id)a3;
- (void)received:(id)a3;
- (void)replaceCapService:(id)a3;
- (void)setActiveAdvertisementsByInstanceID:(id)a3;
- (void)setCapService:(id)a3;
- (void)setClickCapUpdated:(id)a3;
- (void)setDesRecordManager:(id)a3;
- (void)setDownloadCapUpdated:(id)a3;
- (void)setFrequencyCapUpdated:(id)a3;
- (void)updateClickCap:(id)a3 targetAdvertisement:(id)a4;
- (void)updateStoreKitAttribution:(id)a3 targetAdvertisement:(id)a4;
- (void)visible:(id)a3 start:(id)a4 duration:(double)a5;
@end

@implementation ADMetricManager

+ (id)sharedInstance
{
  if (qword_26AC299E0 != -1) {
    dispatch_once(&qword_26AC299E0, &unk_26E9B1F10);
  }
  v2 = (void *)qword_26AC299E8;
  return v2;
}

- (ADMetricManager)init
{
  v30.receiver = self;
  v30.super_class = (Class)ADMetricManager;
  v6 = [(ADMetricManager *)&v30 init];
  if (v6)
  {
    uint64_t v7 = objc_msgSend_dictionary(MEMORY[0x263EFF9A0], v2, v3, v4, v5);
    activeAdvertisementsByInstanceID = v6->_activeAdvertisementsByInstanceID;
    v6->_activeAdvertisementsByInstanceID = (NSMutableDictionary *)v7;

    uint64_t v13 = objc_msgSend_set(MEMORY[0x263EFF9C0], v9, v10, v11, v12);
    clickCapUpdated = v6->_clickCapUpdated;
    v6->_clickCapUpdated = (NSMutableSet *)v13;

    uint64_t v19 = objc_msgSend_set(MEMORY[0x263EFF9C0], v15, v16, v17, v18);
    downloadCapUpdated = v6->_downloadCapUpdated;
    v6->_downloadCapUpdated = (NSMutableSet *)v19;

    uint64_t v25 = objc_msgSend_set(MEMORY[0x263EFF9C0], v21, v22, v23, v24);
    frequencyCapUpdated = v6->_frequencyCapUpdated;
    v6->_frequencyCapUpdated = (NSMutableSet *)v25;

    v27 = objc_alloc_init(ADCapService);
    capService = v6->_capService;
    v6->_capService = v27;
  }
  return v6;
}

+ (id)testInstance
{
  v2 = objc_alloc_init(ADMetricManager);
  return v2;
}

- (void)placed:(id)a3
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  id v3 = a3;
  uint64_t v4 = APLogForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138412290;
    id v6 = v3;
    _os_log_impl(&dword_236756000, v4, OS_LOG_TYPE_DEFAULT, "[Ad %@] Ad is placed.", (uint8_t *)&v5, 0xCu);
  }
}

- (void)onScreen:(id)a3
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  id v3 = a3;
  uint64_t v4 = APLogForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138412290;
    id v6 = v3;
    _os_log_impl(&dword_236756000, v4, OS_LOG_TYPE_DEFAULT, "[Ad %@] Ad is on screen.", (uint8_t *)&v5, 0xCu);
  }
}

- (void)offScreen:(id)a3
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  id v3 = a3;
  uint64_t v4 = APLogForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138412290;
    id v6 = v3;
    _os_log_impl(&dword_236756000, v4, OS_LOG_TYPE_DEFAULT, "[Ad %@] Ad is completely off screen.", (uint8_t *)&v5, 0xCu);
  }
}

- (void)visible:(id)a3 start:(id)a4 duration:(double)a5
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = APLogForCategory();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v15 = objc_msgSend_AD_universalDateTimeAsString(v9, v11, v12, v13, v14);
    *(_DWORD *)buf = 138412802;
    id v28 = v8;
    __int16 v29 = 2112;
    objc_super v30 = v15;
    __int16 v31 = 2048;
    double v32 = a5;
    _os_log_impl(&dword_236756000, v10, OS_LOG_TYPE_DEFAULT, "[Ad %@] Ad was visible since %@ for %f seconds.", buf, 0x20u);
  }
  if (a5 >= 1.0)
  {
    v20 = objc_msgSend_workQueue(MEMORY[0x263F24230], v16, v17, v18, v19);
    v24[0] = MEMORY[0x263EF8330];
    v24[1] = 3221225472;
    v24[2] = sub_23675E8F8;
    v24[3] = &unk_264CADBC0;
    v24[4] = self;
    id v25 = v8;
    double v26 = a5;
    objc_msgSend_addOperationWithBlock_(v20, v21, (uint64_t)v24, v22, v23);
  }
}

- (void)adMarkerInteracted:(id)a3
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v4 = a3;
  int v5 = APLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138412290;
    id v10 = v4;
    _os_log_impl(&dword_236756000, v5, OS_LOG_TYPE_DEFAULT, "[Ad %@] Ad Marker is tapped.", (uint8_t *)&v9, 0xCu);
  }

  objc_msgSend_interacted_(self, v6, (uint64_t)v4, v7, v8);
}

- (void)getApp:(id)a3 buttonState:(int64_t)a4 completion:(id)a5
{
  id v8 = a5;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = sub_23675EC0C;
  v11[3] = &unk_264CADBE8;
  id v12 = v8;
  id v9 = v8;
  objc_msgSend_getApp_buttonState_withCompletion_(self, v10, (uint64_t)a3, a4, (uint64_t)v11);
}

- (void)getApp:(id)a3 buttonState:(int64_t)a4 withCompletion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  objc_msgSend_interacted_(self, v10, (uint64_t)v8, v11, v12);
  uint64_t v17 = objc_msgSend_workQueue(MEMORY[0x263F24230], v13, v14, v15, v16);
  v23[0] = MEMORY[0x263EF8330];
  v23[1] = 3221225472;
  v23[2] = sub_23675ED18;
  v23[3] = &unk_264CADC10;
  id v24 = v8;
  id v25 = self;
  id v26 = v9;
  int64_t v27 = a4;
  id v18 = v9;
  id v19 = v8;
  objc_msgSend_addOperationWithBlock_(v17, v20, (uint64_t)v23, v21, v22);
}

- (void)interacted:(id)a3
{
  id v4 = a3;
  id v9 = objc_msgSend_workQueue(MEMORY[0x263F24230], v5, v6, v7, v8);
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = sub_23675F134;
  v14[3] = &unk_264CADC38;
  id v15 = v4;
  uint64_t v16 = self;
  id v10 = v4;
  objc_msgSend_addOperationWithBlock_(v9, v11, (uint64_t)v14, v12, v13);
}

- (void)updateStoreKitAttribution:(id)a3 targetAdvertisement:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = [ADResponseData alloc];
  uint64_t v12 = objc_msgSend_adData(v6, v8, v9, v10, v11);

  uint64_t v17 = objc_msgSend_adResponseInUse(v12, v13, v14, v15, v16);
  uint64_t v21 = objc_msgSend_initWithDict_(v7, v18, (uint64_t)v17, v19, v20);

  id v26 = objc_msgSend_installAttribution(v21, v22, v23, v24, v25);
  if (v26)
  {
    v30[0] = MEMORY[0x263EF8330];
    v30[1] = 3221225472;
    v30[2] = sub_23675F3A0;
    v30[3] = &unk_264CADC60;
    id v31 = v5;
    objc_msgSend_recordStoreKitAdTap_(v26, v27, (uint64_t)v30, v28, v29);
  }
}

- (void)updateClickCap:(id)a3 targetAdvertisement:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v12 = objc_msgSend_clickCapUpdated(self, v8, v9, v10, v11);
  char v16 = objc_msgSend_containsObject_(v12, v13, (uint64_t)v6, v14, v15);

  if ((v16 & 1) == 0)
  {
    uint64_t v21 = objc_msgSend_desRecordManager(self, v17, v18, v19, v20);
    id v26 = objc_msgSend_adamID(v7, v22, v23, v24, v25);
    objc_msgSend_updateDESRecord_forEvent_(v21, v27, (uint64_t)v26, 2, v28);

    uint64_t v33 = objc_msgSend_capService(self, v29, v30, v31, v32);
    v38 = objc_msgSend_adData(v7, v34, v35, v36, v37);
    v50[0] = MEMORY[0x263EF8330];
    v50[1] = 3221225472;
    v50[2] = sub_23675F5CC;
    v50[3] = &unk_264CADC60;
    id v39 = v6;
    id v51 = v39;
    objc_msgSend_updateClickData_completionHandler_(v33, v40, (uint64_t)v38, (uint64_t)v50, v41);

    v46 = objc_msgSend_clickCapUpdated(self, v42, v43, v44, v45);
    objc_msgSend_addObject_(v46, v47, (uint64_t)v39, v48, v49);
  }
}

- (void)completed:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = APLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v18 = v4;
    _os_log_impl(&dword_236756000, v5, OS_LOG_TYPE_DEFAULT, "[Ad %@] Ad lifecycle has completed.", buf, 0xCu);
  }

  uint64_t v10 = objc_msgSend_workQueue(MEMORY[0x263F24230], v6, v7, v8, v9);
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = sub_23675F7D4;
  v15[3] = &unk_264CADC38;
  v15[4] = self;
  id v16 = v4;
  id v11 = v4;
  objc_msgSend_addOperationWithBlock_(v10, v12, (uint64_t)v15, v13, v14);
}

- (void)received:(id)a3
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = APLogForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138412290;
    id v6 = v3;
    _os_log_impl(&dword_236756000, v4, OS_LOG_TYPE_DEFAULT, "[Ad %@] Ad is received from the server.", (uint8_t *)&v5, 0xCu);
  }
}

- (void)discarded:(id)a3
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = APLogForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138412290;
    id v6 = v3;
    _os_log_impl(&dword_236756000, v4, OS_LOG_TYPE_DEFAULT, "[Ad %@] Ad has been discarded. [Discarded event is deprecated, this call is ignored.]", (uint8_t *)&v5, 0xCu);
  }
}

- (void)activateAdvertisements:(id)a3
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  uint64_t v6 = objc_msgSend_countByEnumeratingWithState_objects_count_(v4, v5, (uint64_t)&v23, (uint64_t)v27, 16);
  if (v6)
  {
    uint64_t v11 = v6;
    uint64_t v12 = *(void *)v24;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v24 != v12) {
          objc_enumerationMutation(v4);
        }
        uint64_t v14 = *(void **)(*((void *)&v23 + 1) + 8 * v13);
        uint64_t v15 = objc_msgSend_activeAdvertisementsByInstanceID(self, v7, v8, v9, v10);
        uint64_t v20 = objc_msgSend_instanceID(v14, v16, v17, v18, v19);
        objc_msgSend_setObject_forKey_(v15, v21, (uint64_t)v14, (uint64_t)v20, v22);

        ++v13;
      }
      while (v11 != v13);
      uint64_t v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(v4, v7, (uint64_t)&v23, (uint64_t)v27, 16);
    }
    while (v11);
  }
}

- (void)deactivateAdvertisements:(id)a3
{
  uint64_t v6 = objc_msgSend_valueForKeyPath_(a3, a2, @"@unionOfObjects.instanceID", v3, v4);
  uint64_t v11 = objc_msgSend_activeAdvertisementsByInstanceID(self, v7, v8, v9, v10);
  objc_msgSend_removeObjectsForKeys_(v11, v12, (uint64_t)v6, v13, v14);

  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = sub_23675FBA8;
  v18[3] = &unk_264CADC88;
  v18[4] = self;
  objc_msgSend_enumerateObjectsUsingBlock_(v6, v15, (uint64_t)v18, v16, v17);
}

- (void)deactivateAdvertisementsByInstanceIDs:(id)a3
{
  id v4 = a3;
  uint64_t v9 = objc_msgSend_activeAdvertisementsByInstanceID(self, v5, v6, v7, v8);
  objc_msgSend_removeObjectsForKeys_(v9, v10, (uint64_t)v4, v11, v12);

  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = sub_23675FCF8;
  v16[3] = &unk_264CADC88;
  v16[4] = self;
  objc_msgSend_enumerateObjectsUsingBlock_(v4, v13, (uint64_t)v16, v14, v15);
}

- (void)deactivateAllAdvertisements
{
  uint64_t v6 = objc_msgSend_activeAdvertisementsByInstanceID(self, a2, v2, v3, v4);
  objc_msgSend_removeAllObjects(v6, v7, v8, v9, v10);

  uint64_t v15 = objc_msgSend_clickCapUpdated(self, v11, v12, v13, v14);
  objc_msgSend_removeAllObjects(v15, v16, v17, v18, v19);

  long long v24 = objc_msgSend_downloadCapUpdated(self, v20, v21, v22, v23);
  objc_msgSend_removeAllObjects(v24, v25, v26, v27, v28);

  objc_msgSend_frequencyCapUpdated(self, v29, v30, v31, v32);
  id v37 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_removeAllObjects(v37, v33, v34, v35, v36);
}

- (void)replaceCapService:(id)a3
{
}

- (int64_t)buttonStateToDownloadType:(int64_t)a3
{
  int64_t v3 = 2;
  if (a3 != 30) {
    int64_t v3 = 0;
  }
  if ((unint64_t)(a3 - 10) >= 5) {
    return v3;
  }
  else {
    return 1;
  }
}

- (id)buttonStateToString:(int64_t)a3
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  if (a3 > 29)
  {
    if (a3 == 30)
    {
      return @"Download";
    }
    else if (a3 == 40)
    {
      return @"Open";
    }
    else
    {
LABEL_8:
      int v5 = APLogForCategory();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        int v6 = 134217984;
        int64_t v7 = a3;
        _os_log_impl(&dword_236756000, v5, OS_LOG_TYPE_ERROR, "Error: Unidentifiable button state: %ld.", (uint8_t *)&v6, 0xCu);
      }

      return @"Unknown";
    }
  }
  else
  {
    switch(a3)
    {
      case 5:
        id result = @"Cancel";
        break;
      case 6:
      case 7:
      case 8:
      case 9:
      case 15:
      case 16:
      case 17:
      case 18:
      case 19:
        goto LABEL_8;
      case 10:
        id result = @"Get";
        break;
      case 11:
        id result = @"Purchase";
        break;
      case 12:
        id result = @"Get Arcade";
        break;
      case 13:
        id result = @"Get Preorder";
        break;
      case 14:
        id result = @"Purchase Preorder";
        break;
      case 20:
        id result = @"Update";
        break;
      default:
        if (a3) {
          goto LABEL_8;
        }
        return @"Unknown";
    }
  }
  return result;
}

- (id)frequencyCapTypeToString:(int64_t)a3
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  if ((unint64_t)a3 < 3) {
    return off_264CADCA8[a3];
  }
  int v5 = APLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    int v6 = 134217984;
    int64_t v7 = a3;
    _os_log_impl(&dword_236756000, v5, OS_LOG_TYPE_ERROR, "Error: Unidentifiable frequency cap type: %ld.", (uint8_t *)&v6, 0xCu);
  }

  return @"Unknown";
}

- (ADCapService)capService
{
  return self->_capService;
}

- (void)setCapService:(id)a3
{
}

- (NSMutableDictionary)activeAdvertisementsByInstanceID
{
  return self->_activeAdvertisementsByInstanceID;
}

- (void)setActiveAdvertisementsByInstanceID:(id)a3
{
}

- (NSMutableSet)clickCapUpdated
{
  return self->_clickCapUpdated;
}

- (void)setClickCapUpdated:(id)a3
{
}

- (NSMutableSet)downloadCapUpdated
{
  return self->_downloadCapUpdated;
}

- (void)setDownloadCapUpdated:(id)a3
{
}

- (NSMutableSet)frequencyCapUpdated
{
  return self->_frequencyCapUpdated;
}

- (void)setFrequencyCapUpdated:(id)a3
{
}

- (ADDESRecordsManager)desRecordManager
{
  return self->_desRecordManager;
}

- (void)setDesRecordManager:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_desRecordManager, 0);
  objc_storeStrong((id *)&self->_frequencyCapUpdated, 0);
  objc_storeStrong((id *)&self->_downloadCapUpdated, 0);
  objc_storeStrong((id *)&self->_clickCapUpdated, 0);
  objc_storeStrong((id *)&self->_activeAdvertisementsByInstanceID, 0);
  objc_storeStrong((id *)&self->_capService, 0);
}

@end