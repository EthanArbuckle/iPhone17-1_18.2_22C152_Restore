@interface ADAppAdvertisement
- (ADAppAdvertisement)initWithAdamID:(id)a3 assetInfo:(id)a4 adData:(id)a5;
- (ADAppAdvertisement)initWithAdamID:(id)a3 assetInfo:(id)a4 adData:(id)a5 instanceID:(id)a6;
- (ADAppAdvertisement)initWithAdamID:(id)a3 cppIDs:(id)a4 serverCppID:(id)a5 adData:(id)a6 instanceID:(id)a7;
- (ADDataObject)adData;
- (APOdmlServerResponse)odmlResponse;
- (NSArray)appBinaryTraits;
- (NSString)instanceID;
- (NSString)selectedCppID;
- (id)AD_jsonDictionary;
- (void)setAdData:(id)a3;
- (void)setAppBinaryTraits:(id)a3;
- (void)setInstanceID:(id)a3;
- (void)setSelectedCppID:(id)a3;
@end

@implementation ADAppAdvertisement

- (ADAppAdvertisement)initWithAdamID:(id)a3 assetInfo:(id)a4 adData:(id)a5
{
  v8 = (void *)MEMORY[0x263F08C38];
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  v16 = objc_msgSend_UUID(v8, v12, v13, v14, v15);
  v21 = objc_msgSend_UUIDString(v16, v17, v18, v19, v20);
  v23 = (ADAppAdvertisement *)objc_msgSend_initWithAdamID_assetInfo_adData_instanceID_(self, v22, (uint64_t)v11, (uint64_t)v10, (uint64_t)v9, v21);

  return v23;
}

- (ADAppAdvertisement)initWithAdamID:(id)a3 assetInfo:(id)a4 adData:(id)a5 instanceID:(id)a6
{
  id v11 = a5;
  id v12 = a6;
  v16.receiver = self;
  v16.super_class = (Class)ADAppAdvertisement;
  uint64_t v13 = [(ADAppRepresentation *)&v16 initWithAdamID:a3 assetInformation:a4];
  uint64_t v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_adData, a5);
    objc_storeStrong((id *)&v14->_instanceID, a6);
  }

  return v14;
}

- (ADAppAdvertisement)initWithAdamID:(id)a3 cppIDs:(id)a4 serverCppID:(id)a5 adData:(id)a6 instanceID:(id)a7
{
  uint64_t v44 = *MEMORY[0x263EF8340];
  id v12 = a3;
  id v13 = a4;
  uint64_t v14 = (__CFString *)a5;
  id v15 = a6;
  id v16 = a7;
  v17 = APLogForCategory();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    uint64_t v18 = objc_opt_class();
    uint64_t v19 = @"nil";
    *(_DWORD *)buf = 138412802;
    uint64_t v39 = v18;
    if (v14) {
      uint64_t v19 = v14;
    }
    __int16 v40 = 2112;
    v41 = v12;
    __int16 v42 = 2112;
    v43 = v19;
    _os_log_impl(&dword_236756000, v17, OS_LOG_TYPE_INFO, "[%@] For adamID: %@ this is the serverCppID: %@.", buf, 0x20u);
  }

  if (v13)
  {
    v36 = v12;
    v23 = v14;
    id v24 = a6;
    id v25 = a7;
    id v26 = a5;
    id v27 = v16;
    id v28 = v15;
    v29 = objc_msgSend_componentsJoinedByString_(v13, v20, @" , ", v21, v22);
    v30 = APLogForCategory();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
    {
      uint64_t v31 = objc_opt_class();
      *(_DWORD *)buf = 138412546;
      uint64_t v39 = v31;
      __int16 v40 = 2112;
      v41 = v29;
      _os_log_impl(&dword_236756000, v30, OS_LOG_TYPE_INFO, "[%@] cppIDs provided from the server are: %@", buf, 0x16u);
    }

    id v15 = v28;
    id v16 = v27;
    a5 = v26;
    a7 = v25;
    a6 = v24;
    uint64_t v14 = v23;
    id v12 = v36;
  }
  else
  {
    v29 = APLogForCategory();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
    {
      uint64_t v32 = objc_opt_class();
      *(_DWORD *)buf = 138412290;
      uint64_t v39 = v32;
      _os_log_impl(&dword_236756000, v29, OS_LOG_TYPE_INFO, "[%@] cppIDs are not provided from server", buf, 0xCu);
    }
  }

  v37.receiver = self;
  v37.super_class = (Class)ADAppAdvertisement;
  v33 = [(ADAppRepresentation *)&v37 initWithAdamID:v12];
  v34 = v33;
  if (v33)
  {
    objc_storeStrong((id *)&v33->_adData, a6);
    objc_storeStrong((id *)&v34->_instanceID, a7);
    objc_storeStrong((id *)&v34->_selectedCppID, a5);
  }

  return v34;
}

- (APOdmlServerResponse)odmlResponse
{
  v5 = objc_msgSend_adData(self, a2, v2, v3, v4);
  id v10 = objc_msgSend_odmlResponse(v5, v6, v7, v8, v9);

  return (APOdmlServerResponse *)v10;
}

- (NSArray)appBinaryTraits
{
  return self->_appBinaryTraits;
}

- (void)setAppBinaryTraits:(id)a3
{
}

- (ADDataObject)adData
{
  return self->_adData;
}

- (void)setAdData:(id)a3
{
}

- (NSString)instanceID
{
  return self->_instanceID;
}

- (void)setInstanceID:(id)a3
{
}

- (NSString)selectedCppID
{
  return self->_selectedCppID;
}

- (void)setSelectedCppID:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selectedCppID, 0);
  objc_storeStrong((id *)&self->_instanceID, 0);
  objc_storeStrong((id *)&self->_adData, 0);
  objc_storeStrong((id *)&self->_appBinaryTraits, 0);
  objc_storeStrong((id *)&self->_odmlResponse, 0);
}

- (id)AD_jsonDictionary
{
  v5 = objc_msgSend_dictionaryWithCapacity_(MEMORY[0x263EFF9A0], a2, 5, v2, v3);
  id v10 = objc_msgSend_instanceID(self, v6, v7, v8, v9);
  objc_msgSend_setValue_forKey_(v5, v11, (uint64_t)v10, @"instanceID", v12);

  v17 = objc_msgSend_selectedCppID(self, v13, v14, v15, v16);
  objc_msgSend_setValue_forKey_(v5, v18, (uint64_t)v17, @"selectedCppID", v19);

  id v24 = objc_msgSend_adamID(self, v20, v21, v22, v23);
  objc_msgSend_setValue_forKey_(v5, v25, (uint64_t)v24, @"adamID", v26);

  uint64_t v31 = objc_msgSend_assetInformation(self, v27, v28, v29, v30);
  objc_msgSend_setValue_forKey_(v5, v32, (uint64_t)v31, @"assetInformation", v33);

  v38 = objc_msgSend_adData(self, v34, v35, v36, v37);
  v43 = objc_msgSend_AD_jsonDictionary(v38, v39, v40, v41, v42);
  objc_msgSend_setValue_forKey_(v5, v44, (uint64_t)v43, @"adData", v45);

  v50 = objc_msgSend_copy(v5, v46, v47, v48, v49);
  return v50;
}

@end