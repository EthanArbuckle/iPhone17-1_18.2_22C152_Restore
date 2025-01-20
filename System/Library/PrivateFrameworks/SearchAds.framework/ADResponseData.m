@interface ADResponseData
- (ADInstallAttributionData)installAttribution;
- (ADResponseData)initWithDict:(id)a3;
- (NSDictionary)format;
- (NSString)algoID;
- (NSString)clientRequestID;
- (NSString)impressionID;
- (NSString)lineItem;
- (NSString)metadata;
- (NSString)privacy;
- (NSString)templateType;
@end

@implementation ADResponseData

- (ADResponseData)initWithDict:(id)a3
{
  uint64_t v68 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v63.receiver = self;
  v63.super_class = (Class)ADResponseData;
  v5 = [(ADResponseData *)&v63 init];
  if (v5)
  {
    uint64_t v6 = objc_opt_class();
    uint64_t v9 = objc_msgSend_AD_objectForKey_ofKindOfClass_(v4, v7, @"impressionId", v6, v8);
    impressionID = v5->_impressionID;
    v5->_impressionID = (NSString *)v9;

    uint64_t v11 = objc_opt_class();
    uint64_t v14 = objc_msgSend_AD_objectForKey_ofKindOfClass_(v4, v12, @"metadata", v11, v13);
    metadata = v5->_metadata;
    v5->_metadata = (NSString *)v14;

    uint64_t v16 = objc_opt_class();
    uint64_t v19 = objc_msgSend_AD_objectForKey_ofKindOfClass_(v4, v17, @"lineItem", v16, v18);
    lineItem = v5->_lineItem;
    v5->_lineItem = (NSString *)v19;

    uint64_t v21 = objc_opt_class();
    uint64_t v24 = objc_msgSend_AD_objectForKey_ofKindOfClass_(v4, v22, @"algoId", v21, v23);
    algoID = v5->_algoID;
    v5->_algoID = (NSString *)v24;

    uint64_t v26 = objc_opt_class();
    uint64_t v29 = objc_msgSend_AD_objectForKey_ofKindOfClass_(v4, v27, @"privacy", v26, v28);
    privacy = v5->_privacy;
    v5->_privacy = (NSString *)v29;

    uint64_t v31 = objc_opt_class();
    uint64_t v34 = objc_msgSend_AD_objectForKey_ofKindOfClass_(v4, v32, @"templateType", v31, v33);
    templateType = v5->_templateType;
    v5->_templateType = (NSString *)v34;

    uint64_t v36 = objc_opt_class();
    uint64_t v39 = objc_msgSend_AD_objectForKey_ofKindOfClass_(v4, v37, @"clientRequestId", v36, v38);
    clientRequestID = v5->_clientRequestID;
    v5->_clientRequestID = (NSString *)v39;

    uint64_t v41 = objc_opt_class();
    uint64_t v44 = objc_msgSend_AD_objectForKey_ofKindOfClass_(v4, v42, @"format", v41, v43);
    format = v5->_format;
    v5->_format = (NSDictionary *)v44;

    uint64_t v46 = objc_opt_class();
    v49 = objc_msgSend_AD_objectForKey_ofKindOfClass_(v4, v47, @"installAttribution", v46, v48);
    if (v49)
    {
      v50 = [ADInstallAttributionData alloc];
      uint64_t v54 = objc_msgSend_initWithDict_(v50, v51, (uint64_t)v49, v52, v53);
      p_super = &v5->_installAttribution->super;
      v5->_installAttribution = (ADInstallAttributionData *)v54;
    }
    else
    {
      p_super = APLogForCategory();
      if (os_log_type_enabled(p_super, OS_LOG_TYPE_ERROR))
      {
        uint64_t v56 = objc_opt_class();
        v61 = objc_msgSend_AD_jsonString(v4, v57, v58, v59, v60);
        *(_DWORD *)buf = 138412546;
        uint64_t v65 = v56;
        __int16 v66 = 2112;
        v67 = v61;
        _os_log_impl(&dword_236756000, p_super, OS_LOG_TYPE_ERROR, "[%@] ERROR: No Install Attribution dictionary was provided: %@", buf, 0x16u);
      }
    }
  }
  return v5;
}

- (NSString)impressionID
{
  return self->_impressionID;
}

- (NSString)metadata
{
  return self->_metadata;
}

- (NSString)lineItem
{
  return self->_lineItem;
}

- (NSString)algoID
{
  return self->_algoID;
}

- (NSString)privacy
{
  return self->_privacy;
}

- (NSString)templateType
{
  return self->_templateType;
}

- (NSString)clientRequestID
{
  return self->_clientRequestID;
}

- (NSDictionary)format
{
  return self->_format;
}

- (ADInstallAttributionData)installAttribution
{
  return self->_installAttribution;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_installAttribution, 0);
  objc_storeStrong((id *)&self->_format, 0);
  objc_storeStrong((id *)&self->_clientRequestID, 0);
  objc_storeStrong((id *)&self->_templateType, 0);
  objc_storeStrong((id *)&self->_privacy, 0);
  objc_storeStrong((id *)&self->_algoID, 0);
  objc_storeStrong((id *)&self->_lineItem, 0);
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_impressionID, 0);
}

@end