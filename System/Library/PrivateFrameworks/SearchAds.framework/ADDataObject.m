@interface ADDataObject
+ (id)adResponseTypeToString:(int64_t)a3;
- (ADDataObject)initWith:(id)a3 andError:(id)a4;
- (APOdmlServerResponse)odmlResponse;
- (NSDictionary)adData;
- (NSDictionary)adResponseInUse;
- (NSDictionary)allOdmlResponses;
- (NSDictionary)dupAdResponse;
- (NSDictionary)noOrganicAdResponse;
- (NSDictionary)normalAdResponse;
- (NSError)error;
- (id)AD_jsonDictionary;
- (id)_jsonToDict:(id)a3 error:(id *)a4;
- (id)addCachedFeaturesToOdmlResponse:(id)a3;
- (id)parseDataForAdResponse:(id)a3;
- (id)parseDataForODMLResponse:(id)a3;
- (id)parseOdmlResponseFromString:(id)a3;
- (id)parseOdmlStringFromResponseData:(id)a3;
- (id)parseResponseForAdditionalFeatures:(id)a3 odmlResponse:(id)a4;
- (int64_t)adResponseInUseType_Int;
- (void)parseResponseData;
- (void)setAdData:(id)a3;
- (void)setAdResponseInUseType:(int64_t)a3;
- (void)setAdResponseInUseType_Int:(int64_t)a3;
- (void)setDupAdResponse:(id)a3;
- (void)setError:(id)a3;
- (void)setNoOrganicAdResponse:(id)a3;
- (void)setNormalAdResponse:(id)a3;
- (void)updateAdDataWithLocationState:(BOOL)a3 personalizedAdsState:(BOOL)a4;
@end

@implementation ADDataObject

- (id)AD_jsonDictionary
{
  v5 = objc_msgSend_dictionaryWithCapacity_(MEMORY[0x263EFF9A0], a2, 1, v2, v3);
  v10 = objc_msgSend_adData(self, v6, v7, v8, v9);
  objc_msgSend_setValue_forKey_(v5, v11, (uint64_t)v10, @"adData", v12);

  v17 = objc_msgSend_error(self, v13, v14, v15, v16);

  if (v17)
  {
    v22 = objc_msgSend_dictionaryWithCapacity_(MEMORY[0x263EFF9A0], v18, 3, v20, v21);
    v27 = objc_msgSend_error(self, v23, v24, v25, v26);
    v32 = objc_msgSend_domain(v27, v28, v29, v30, v31);
    objc_msgSend_setValue_forKey_(v22, v33, (uint64_t)v32, @"domain", v34);

    v35 = NSNumber;
    v40 = objc_msgSend_error(self, v36, v37, v38, v39);
    uint64_t v45 = objc_msgSend_code(v40, v41, v42, v43, v44);
    v49 = objc_msgSend_numberWithInteger_(v35, v46, v45, v47, v48);
    objc_msgSend_setValue_forKey_(v22, v50, (uint64_t)v49, @"code", v51);

    v56 = objc_msgSend_error(self, v52, v53, v54, v55);
    v61 = objc_msgSend_localizedDescription(v56, v57, v58, v59, v60);
    objc_msgSend_setValue_forKey_(v22, v62, (uint64_t)v61, @"localizedDescription", v63);

    objc_msgSend_setObject_forKeyedSubscript_(v5, v64, (uint64_t)v22, @"error", v65);
  }
  v66 = objc_msgSend_copy(v5, v18, v19, v20, v21);

  return v66;
}

- (ADDataObject)initWith:(id)a3 andError:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)ADDataObject;
  uint64_t v9 = [(ADDataObject *)&v16 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_adData, a3);
    objc_storeStrong((id *)&v10->_error, a4);
    v10->_adResponseInUseType_Int = 2;
    objc_msgSend_parseResponseData(v10, v11, v12, v13, v14);
  }

  return v10;
}

- (void)setAdResponseInUseType:(int64_t)a3
{
  objc_msgSend_setAdResponseInUseType_Int_(self, a2, a3, v3, v4);
  objc_msgSend_adResponseInUse(self, v6, v7, v8, v9);
  id v15 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_parseDataForODMLResponse_(self, v10, (uint64_t)v15, v11, v12);
  uint64_t v13 = (APOdmlServerResponse *)objc_claimAutoreleasedReturnValue();
  odmlResponse = self->_odmlResponse;
  self->_odmlResponse = v13;
}

- (NSDictionary)adResponseInUse
{
  uint64_t v6 = objc_msgSend_adResponseInUseType_Int(self, a2, v2, v3, v4);
  if (v6 == 1)
  {
    uint64_t v11 = objc_msgSend_noOrganicAdResponse(self, v7, v8, v9, v10);
  }
  else
  {
    if (v6) {
      objc_msgSend_normalAdResponse(self, v7, v8, v9, v10);
    }
    else {
    uint64_t v11 = objc_msgSend_dupAdResponse(self, v7, v8, v9, v10);
    }
  }
  return (NSDictionary *)v11;
}

+ (id)adResponseTypeToString:(int64_t)a3
{
  uint64_t v3 = @"NORMAL";
  if (a3 == 1) {
    uint64_t v3 = @"NOORGANIC";
  }
  if (a3) {
    return v3;
  }
  else {
    return @"DUP";
  }
}

- (void)parseResponseData
{
  v5 = objc_msgSend_objectForKeyedSubscript_(self->_adData, a2, @"DUP", v2, v3);
  objc_msgSend_parseDataForAdResponse_(self, v6, (uint64_t)v5, v7, v8);
  uint64_t v9 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
  dupAdResponse = self->_dupAdResponse;
  self->_dupAdResponse = v9;

  uint64_t v14 = objc_msgSend_objectForKeyedSubscript_(self->_adData, v11, @"NOORGANIC", v12, v13);
  objc_msgSend_parseDataForAdResponse_(self, v15, (uint64_t)v14, v16, v17);
  v18 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
  noOrganicAdResponse = self->_noOrganicAdResponse;
  self->_noOrganicAdResponse = v18;

  uint64_t v26 = objc_msgSend_objectForKeyedSubscript_(self->_adData, v20, @"NORMAL", v21, v22);
  adData = self->_adData;
  if (v26)
  {
    v28 = objc_msgSend_objectForKeyedSubscript_(adData, v23, @"NORMAL", v24, v25);
    objc_msgSend_parseDataForAdResponse_(self, v29, (uint64_t)v28, v30, v31);
    v32 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
    normalAdResponse = self->_normalAdResponse;
    self->_normalAdResponse = v32;
  }
  else
  {
    uint64_t v34 = adData;
    v28 = self->_normalAdResponse;
    self->_normalAdResponse = v34;
  }

  objc_msgSend_adResponseInUse(self, v35, v36, v37, v38);
  id v44 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_parseDataForODMLResponse_(self, v39, (uint64_t)v44, v40, v41);
  uint64_t v42 = (APOdmlServerResponse *)objc_claimAutoreleasedReturnValue();
  odmlResponse = self->_odmlResponse;
  self->_odmlResponse = v42;
}

- (id)parseDataForAdResponse:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (!v4)
  {
    uint64_t v8 = APLogForCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v15 = objc_opt_class();
      uint64_t v11 = "[%@] Cannot find data in the ad response.";
LABEL_11:
      _os_log_impl(&dword_236756000, v8, OS_LOG_TYPE_ERROR, v11, buf, 0xCu);
    }
LABEL_12:
    uint64_t v7 = 0;
    goto LABEL_13;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    uint64_t v8 = APLogForCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v15 = objc_opt_class();
      uint64_t v11 = "[%@] Data is not a string";
      goto LABEL_11;
    }
    goto LABEL_12;
  }
  id v13 = 0;
  uint64_t v7 = objc_msgSend__jsonToDict_error_(self, v5, (uint64_t)v4, (uint64_t)&v13, v6);
  uint64_t v8 = v13;
  if (v8)
  {
    uint64_t v9 = APLogForCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      uint64_t v10 = objc_opt_class();
      *(_DWORD *)buf = 138412802;
      uint64_t v15 = v10;
      __int16 v16 = 2112;
      id v17 = v4;
      __int16 v18 = 2112;
      uint64_t v19 = v8;
      _os_log_impl(&dword_236756000, v9, OS_LOG_TYPE_ERROR, "[%@] Error deserializing ad data response %@: %@", buf, 0x20u);
    }
  }
LABEL_13:

  return v7;
}

- (id)_jsonToDict:(id)a3 error:(id *)a4
{
  uint64_t v6 = objc_msgSend_dataUsingEncoding_(a3, a2, 4, (uint64_t)a4, v4);
  uint64_t v8 = objc_msgSend_JSONObjectWithData_options_error_(MEMORY[0x263F08900], v7, (uint64_t)v6, 0, (uint64_t)a4);

  return v8;
}

- (id)parseDataForODMLResponse:(id)a3
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v11 = objc_msgSend_parseOdmlStringFromResponseData_(self, v5, (uint64_t)v4, v6, v7);
  if (v11)
  {
    uint64_t v14 = objc_msgSend_parseOdmlResponseFromString_(self, v8, (uint64_t)v11, v9, v10);
    if (v14)
    {
      uint64_t v15 = objc_msgSend_parseResponseForAdditionalFeatures_odmlResponse_(self, v12, (uint64_t)v4, (uint64_t)v14, v13);
      goto LABEL_11;
    }
    uint64_t v21 = APLogForCategory();
    if (!os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      goto LABEL_9;
    }
    int v26 = 138412290;
    uint64_t v27 = objc_opt_class();
    uint64_t v22 = "[%@] ERROR: Failed to parse ODML response from string.";
    v23 = v21;
    uint32_t v24 = 12;
LABEL_8:
    _os_log_impl(&dword_236756000, v23, OS_LOG_TYPE_ERROR, v22, (uint8_t *)&v26, v24);
LABEL_9:

    goto LABEL_10;
  }
  uint64_t v14 = APLogForCategory();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
  {
    uint64_t v16 = objc_opt_class();
    uint64_t v21 = objc_msgSend_AD_jsonString(v4, v17, v18, v19, v20);
    int v26 = 138412546;
    uint64_t v27 = v16;
    __int16 v28 = 2112;
    uint64_t v29 = v21;
    uint64_t v22 = "[%@] ERROR: No ODML data was returned with the Ad Response: %@";
    v23 = v14;
    uint32_t v24 = 22;
    goto LABEL_8;
  }
LABEL_10:
  uint64_t v15 = 0;
LABEL_11:

  return v15;
}

- (id)parseOdmlStringFromResponseData:(id)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v3 = a3;
  if (v3)
  {
    uint64_t v4 = objc_opt_class();
    uint64_t v7 = objc_msgSend_objectForKey_ofKindOfClass_(v3, v5, @"ODMLDataV2", v4, v6);
  }
  else
  {
    uint64_t v8 = APLogForCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      int v10 = 138412290;
      uint64_t v11 = objc_opt_class();
      _os_log_impl(&dword_236756000, v8, OS_LOG_TYPE_ERROR, "[%@] Cannot find response dictionary in the ad response.", (uint8_t *)&v10, 0xCu);
    }

    uint64_t v7 = 0;
  }

  return v7;
}

- (id)parseOdmlResponseFromString:(id)a3
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v3 = (objc_class *)MEMORY[0x263EFF8F8];
  id v4 = a3;
  id v5 = [v3 alloc];
  uint64_t v8 = objc_msgSend_initWithBase64EncodedString_options_(v5, v6, (uint64_t)v4, 0, v7);

  uint64_t v13 = objc_msgSend_sharedInstance(MEMORY[0x263F24230], v9, v10, v11, v12);
  id v30 = 0;
  uint64_t v16 = objc_msgSend_deserializeMessage_error_(v13, v14, (uint64_t)v8, (uint64_t)&v30, v15);
  id v17 = v30;

  if (v17)
  {
    uint64_t v18 = APLogForCategory();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      uint64_t v19 = objc_opt_class();
      *(_DWORD *)buf = 138412802;
      uint64_t v32 = v19;
      __int16 v33 = 2112;
      uint64_t v34 = v8;
      __int16 v35 = 2112;
      id v36 = v17;
      _os_log_impl(&dword_236756000, v18, OS_LOG_TYPE_ERROR, "[%@] Error deserializing protobuf %@: %@", buf, 0x20u);
    }
    uint64_t v20 = 0;
  }
  else
  {
    id v21 = objc_alloc(MEMORY[0x263F61ED8]);
    uint64_t v18 = objc_msgSend_initWithData_(v21, v22, (uint64_t)v16, v23, v24);
    id v25 = objc_alloc(MEMORY[0x263F61EF8]);
    uint64_t v20 = objc_msgSend_initWithSRPResponse_(v25, v26, (uint64_t)v18, v27, v28);
  }

  return v20;
}

- (id)parseResponseForAdditionalFeatures:(id)a3 odmlResponse:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = objc_opt_class();
  uint64_t v11 = objc_msgSend_objectForKey_ofKindOfClass_(v7, v9, @"format", v8, v10);

  uint64_t v15 = objc_msgSend_objectForKey_(v11, v12, @"userRating", v13, v14);
  objc_msgSend_addUserRating_(v6, v16, (uint64_t)v15, v17, v18);
  uint64_t v22 = objc_msgSend_addCachedFeaturesToOdmlResponse_(self, v19, (uint64_t)v6, v20, v21);

  return v22;
}

- (id)addCachedFeaturesToOdmlResponse:(id)a3
{
  id v4 = a3;
  uint64_t v9 = objc_msgSend_sharedInstance(MEMORY[0x263F241C0], v5, v6, v7, v8);
  uint64_t v14 = objc_msgSend_shortModelType(v9, v10, v11, v12, v13);

  uint64_t v19 = objc_msgSend_sharedInstance(MEMORY[0x263F241D8], v15, v16, v17, v18);
  uint64_t v24 = objc_msgSend_activeDSIDRecord(v19, v20, v21, v22, v23);
  uint64_t v29 = objc_msgSend_segmentData(v24, v25, v26, v27, v28);

  if (v29)
  {
    uint64_t v37 = 0;
    uint64_t v34 = objc_msgSend__jsonToDict_error_(self, v30, (uint64_t)v29, (uint64_t)&v37, v31);
    if (v34) {
      BOOL v35 = v37 == 0;
    }
    else {
      BOOL v35 = 0;
    }
    if (v35) {
      objc_msgSend_addCachedFeatures_deviceModel_(v4, v32, (uint64_t)v34, (uint64_t)v14, v33);
    }
    else {
      objc_msgSend_addCachedFeatures_deviceModel_(v4, v32, 0, (uint64_t)v14, v33);
    }
  }
  else
  {
    objc_msgSend_addCachedFeatures_deviceModel_(v4, v30, 0, (uint64_t)v14, v31);
  }

  return v4;
}

- (void)updateAdDataWithLocationState:(BOOL)a3 personalizedAdsState:(BOOL)a4
{
  BOOL v5 = a4;
  BOOL v92 = a3;
  uint64_t v107 = *MEMORY[0x263EF8340];
  uint64_t v7 = objc_msgSend_adData(self, a2, a3, a4, v4);
  uint64_t v12 = objc_msgSend_dictionary(MEMORY[0x263EFF9A0], v8, v9, v10, v11);
  uint64_t v13 = (void *)v12;
  if (v7)
  {
    v90 = v7;
    v91 = (void *)v12;
    v89 = self;
    long long v104 = 0u;
    long long v105 = 0u;
    long long v102 = 0u;
    long long v103 = 0u;
    id v14 = v7;
    uint64_t v16 = v92;
    uint64_t v96 = objc_msgSend_countByEnumeratingWithState_objects_count_(v14, v15, (uint64_t)&v102, (uint64_t)v106, 16);
    if (v96)
    {
      unint64_t v20 = 0x263F08000uLL;
      id v94 = v14;
      uint64_t v95 = *(void *)v103;
      do
      {
        for (uint64_t i = 0; i != v96; ++i)
        {
          if (*(void *)v103 != v95) {
            objc_enumerationMutation(v14);
          }
          uint64_t v97 = *(void *)(*((void *)&v102 + 1) + 8 * i);
          uint64_t v22 = objc_msgSend_objectForKey_(v14, v17, v97, v18, v19);
          uint64_t v26 = objc_msgSend_dataUsingEncoding_(v22, v23, 4, v24, v25);
          uint64_t v28 = objc_msgSend_JSONObjectWithData_options_error_(*(void **)(v20 + 2304), v27, (uint64_t)v26, 0, 0);
          uint64_t v33 = objc_msgSend_mutableCopy(v28, v29, v30, v31, v32);

          uint64_t v37 = objc_msgSend_objectForKeyedSubscript_(v33, v34, @"privacy", v35, v36);
          if (v37)
          {
            v100 = v22;
            id v38 = objc_alloc(MEMORY[0x263EFF8F8]);
            uint64_t v41 = objc_msgSend_initWithBase64EncodedString_options_(v38, v39, (uint64_t)v37, 0, v40);
            id v42 = objc_alloc(MEMORY[0x263F24240]);
            v99 = (void *)v41;
            v98 = objc_msgSend_initWithData_(v42, v43, v41, v44, v45);
            v50 = objc_msgSend_dictionaryRepresentation(v98, v46, v47, v48, v49);
            uint64_t v54 = objc_msgSend_numberWithBool_(NSNumber, v51, v16, v52, v53);
            objc_msgSend_setValue_forKey_(v50, v55, (uint64_t)v54, @"renderingStateForLocation", v56);

            uint64_t v60 = objc_msgSend_numberWithBool_(NSNumber, v57, v5, v58, v59);
            objc_msgSend_setValue_forKey_(v50, v61, (uint64_t)v60, @"renderingStateForPA", v62);

            uint64_t v63 = *(void **)(v20 + 2304);
            id v101 = 0;
            uint64_t v65 = objc_msgSend_dataWithJSONObject_options_error_(v63, v64, (uint64_t)v50, 0, (uint64_t)&v101);
            id v69 = v101;
            if (!v69)
            {
              v93 = objc_msgSend_base64EncodedStringWithOptions_(v65, v66, 0, v67, v68);
              objc_msgSend_setValue_forKey_(v33, v70, (uint64_t)v93, @"privacy", v71);
              v73 = objc_msgSend_dataWithJSONObject_options_error_(MEMORY[0x263F08900], v72, (uint64_t)v33, 0, 0);
              id v74 = [NSString alloc];
              BOOL v77 = v5;
              v78 = objc_msgSend_initWithData_encoding_(v74, v75, (uint64_t)v73, 4, v76);
              objc_msgSend_setValue_forKey_(v91, v79, (uint64_t)v78, v97, v80);

              BOOL v5 = v77;
              uint64_t v16 = v92;
            }
            id v14 = v94;
            unint64_t v20 = 0x263F08000;
            uint64_t v22 = v100;
          }
        }
        uint64_t v96 = objc_msgSend_countByEnumeratingWithState_objects_count_(v14, v17, (uint64_t)&v102, (uint64_t)v106, 16);
      }
      while (v96);
    }

    uint64_t v13 = v91;
    v85 = objc_msgSend_copy(v91, v81, v82, v83, v84);
    objc_msgSend_setAdData_(v89, v86, (uint64_t)v85, v87, v88);

    uint64_t v7 = v90;
  }
}

- (NSDictionary)adData
{
  return self->_adData;
}

- (void)setAdData:(id)a3
{
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
}

- (NSDictionary)dupAdResponse
{
  return self->_dupAdResponse;
}

- (void)setDupAdResponse:(id)a3
{
}

- (NSDictionary)noOrganicAdResponse
{
  return self->_noOrganicAdResponse;
}

- (void)setNoOrganicAdResponse:(id)a3
{
}

- (NSDictionary)normalAdResponse
{
  return self->_normalAdResponse;
}

- (void)setNormalAdResponse:(id)a3
{
}

- (int64_t)adResponseInUseType_Int
{
  return self->_adResponseInUseType_Int;
}

- (void)setAdResponseInUseType_Int:(int64_t)a3
{
  self->_adResponseInUseType_Int = a3;
}

- (APOdmlServerResponse)odmlResponse
{
  return (APOdmlServerResponse *)objc_getProperty(self, a2, 56, 1);
}

- (NSDictionary)allOdmlResponses
{
  return (NSDictionary *)objc_getProperty(self, a2, 64, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_allOdmlResponses, 0);
  objc_storeStrong((id *)&self->_odmlResponse, 0);
  objc_storeStrong((id *)&self->_normalAdResponse, 0);
  objc_storeStrong((id *)&self->_noOrganicAdResponse, 0);
  objc_storeStrong((id *)&self->_dupAdResponse, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_adData, 0);
}

@end