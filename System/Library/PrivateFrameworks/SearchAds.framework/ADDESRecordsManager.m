@interface ADDESRecordsManager
- (ADDESRecordsManager)init;
- (BOOL)isAppInstalled:(id)a3;
- (NSString)recordID;
- (id)eventTypeToString:(int64_t)a3;
- (void)_createRecordForAdData:(id)a3 installed:(BOOL)a4 isDupe:(BOOL)a5 rerankingError:(id)a6;
- (void)createRecords:(id)a3 firstOrganicId:(id)a4 error:(id)a5;
- (void)setRecordID:(id)a3;
- (void)updateDESRecord:(id)a3 forEvent:(int64_t)a4;
@end

@implementation ADDESRecordsManager

- (ADDESRecordsManager)init
{
  v15.receiver = self;
  v15.super_class = (Class)ADDESRecordsManager;
  v6 = [(ADDESRecordsManager *)&v15 init];
  if (v6)
  {
    v7 = objc_msgSend_UUID(MEMORY[0x263F08C38], v2, v3, v4, v5);
    uint64_t v12 = objc_msgSend_UUIDString(v7, v8, v9, v10, v11);
    recordID = v6->_recordID;
    v6->_recordID = (NSString *)v12;
  }
  return v6;
}

- (void)createRecords:(id)a3 firstOrganicId:(id)a4 error:(id)a5
{
  uint64_t v53 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  objc_super v15 = objc_msgSend_sharedInstance(MEMORY[0x263F241C0], v11, v12, v13, v14);
  int isPersonalizedAdsEnabled = objc_msgSend_isPersonalizedAdsEnabled(v15, v16, v17, v18, v19);

  if (isPersonalizedAdsEnabled)
  {
    long long v50 = 0u;
    long long v51 = 0u;
    long long v48 = 0u;
    long long v49 = 0u;
    id v46 = v8;
    id obj = v8;
    uint64_t v22 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v21, (uint64_t)&v48, (uint64_t)v52, 16);
    if (v22)
    {
      uint64_t v27 = v22;
      uint64_t v28 = *(void *)v49;
      do
      {
        for (uint64_t i = 0; i != v27; ++i)
        {
          if (*(void *)v49 != v28) {
            objc_enumerationMutation(obj);
          }
          v30 = *(void **)(*((void *)&v48 + 1) + 8 * i);
          v31 = objc_msgSend_adamID(v30, v23, v24, v25, v26, v46);
          uint64_t isAppInstalled = objc_msgSend_isAppInstalled_(self, v32, (uint64_t)v31, v33, v34);

          v40 = objc_msgSend_adamID(v30, v36, v37, v38, v39);
          uint64_t isEqualToString = objc_msgSend_isEqualToString_(v9, v41, (uint64_t)v40, v42, v43);

          objc_msgSend__createRecordForAdData_installed_isDupe_rerankingError_(self, v45, (uint64_t)v30, isAppInstalled, isEqualToString, v10);
        }
        uint64_t v27 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v23, (uint64_t)&v48, (uint64_t)v52, 16);
      }
      while (v27);
    }

    id v8 = v46;
  }
}

- (void)updateDESRecord:(id)a3 forEvent:(int64_t)a4
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v6 = a3;
  uint64_t v11 = objc_msgSend_sharedInstance(MEMORY[0x263F241C0], v7, v8, v9, v10);
  int isPersonalizedAdsEnabled = objc_msgSend_isPersonalizedAdsEnabled(v11, v12, v13, v14, v15);

  if (isPersonalizedAdsEnabled)
  {
    uint64_t v17 = APLogForCategory();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      v21 = objc_msgSend_eventTypeToString_(self, v18, a4, v19, v20);
      int v29 = 138412546;
      id v30 = v6;
      __int16 v31 = 2112;
      v32 = v21;
      _os_log_impl(&dword_236756000, v17, OS_LOG_TYPE_DEBUG, "[AdamID %@] Updating DES record with event %@", (uint8_t *)&v29, 0x16u);
    }
    uint64_t v22 = (void *)MEMORY[0x263F61F10];
    uint64_t v27 = objc_msgSend_recordID(self, v23, v24, v25, v26);
    objc_msgSend_updateWithRecordID_adamID_event_(v22, v28, (uint64_t)v27, (uint64_t)v6, a4);
  }
}

- (void)_createRecordForAdData:(id)a3 installed:(BOOL)a4 isDupe:(BOOL)a5 rerankingError:(id)a6
{
  BOOL v7 = a5;
  BOOL v8 = a4;
  uint64_t v63 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a6;
  v16 = objc_msgSend_adData(v10, v12, v13, v14, v15);
  v21 = objc_msgSend_error(v16, v17, v18, v19, v20);

  if (v21)
  {
    uint64_t v26 = APLogForCategory();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      __int16 v31 = objc_msgSend_instanceID(v10, v27, v28, v29, v30);
      v36 = objc_msgSend_error(v16, v32, v33, v34, v35);
      int v59 = 138412546;
      v60 = v31;
      __int16 v61 = 2112;
      v62 = v36;
      _os_log_impl(&dword_236756000, v26, OS_LOG_TYPE_ERROR, "[Ad %@] Error detected within the Ad Data object when writing to DES: %@", (uint8_t *)&v59, 0x16u);

LABEL_4:
    }
  }
  else
  {
    uint64_t v37 = objc_msgSend_odmlResponse(v16, v22, v23, v24, v25);

    if (v37)
    {
      uint64_t v42 = (void *)MEMORY[0x263F61F10];
      uint64_t v43 = objc_msgSend_recordID(self, v38, v39, v40, v41);
      long long v48 = objc_msgSend_adamID(v10, v44, v45, v46, v47);
      uint64_t v53 = objc_msgSend_odmlResponse(v16, v49, v50, v51, v52);
      objc_msgSend_eventWithRecordID_adamID_odmlResponse_appInstalled_isDupe_rerankingError_(v42, v54, (uint64_t)v43, (uint64_t)v48, (uint64_t)v53, v8, v7, v11);

      goto LABEL_8;
    }
    uint64_t v26 = APLogForCategory();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      __int16 v31 = objc_msgSend_instanceID(v10, v55, v56, v57, v58);
      int v59 = 138412290;
      v60 = v31;
      _os_log_impl(&dword_236756000, v26, OS_LOG_TYPE_ERROR, "[Ad %@] ODML response not found for ad. Aborting DES write.", (uint8_t *)&v59, 0xCu);
      goto LABEL_4;
    }
  }

LABEL_8:
}

- (BOOL)isAppInstalled:(id)a3
{
  uint64_t v5 = objc_msgSend_integerValue(a3, a2, (uint64_t)a3, v3, v4);
  id v6 = objc_alloc(MEMORY[0x263F01878]);
  uint64_t v9 = objc_msgSend_initWithStoreItemIdentifier_error_(v6, v7, v5, 0, v8);
  LOBYTE(v5) = v9 != 0;

  return v5;
}

- (id)eventTypeToString:(int64_t)a3
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  if (a3 == 1) {
    return @"Impression Event";
  }
  if (a3 == 2) {
    return @"Interaction Event";
  }
  uint64_t v5 = APLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    int v6 = 134217984;
    int64_t v7 = a3;
    _os_log_impl(&dword_236756000, v5, OS_LOG_TYPE_ERROR, "Error: Unidentifiable event type: %ld.", (uint8_t *)&v6, 0xCu);
  }

  return @"Unknown";
}

- (NSString)recordID
{
  return self->_recordID;
}

- (void)setRecordID:(id)a3
{
}

- (void).cxx_destruct
{
}

@end