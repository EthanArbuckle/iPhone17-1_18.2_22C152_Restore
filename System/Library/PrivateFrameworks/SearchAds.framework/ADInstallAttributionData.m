@interface ADInstallAttributionData
- (ADInstallAttributionData)initWithDict:(id)a3;
- (NSNumber)adamID;
- (NSNumber)campaignID;
- (NSNumber)sourceAppAdamID;
- (NSNumber)timestamp;
- (NSString)adNetworkID;
- (NSString)signature;
- (NSString)uuid;
- (NSString)version;
- (id)dictionaryRepresentation;
- (void)recordStoreKitAdTap:(id)a3;
@end

@implementation ADInstallAttributionData

- (ADInstallAttributionData)initWithDict:(id)a3
{
  uint64_t v91 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v86.receiver = self;
  v86.super_class = (Class)ADInstallAttributionData;
  v5 = [(ADInstallAttributionData *)&v86 init];
  if (!v5) {
    goto LABEL_16;
  }
  uint64_t v6 = objc_opt_class();
  uint64_t v9 = objc_msgSend_AD_objectForKey_ofKindOfClass_(v4, v7, @"version", v6, v8);
  version = v5->_version;
  v5->_version = (NSString *)v9;

  if (!v5->_version)
  {
    v11 = APLogForCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      uint64_t v12 = objc_opt_class();
      *(_DWORD *)buf = 138412290;
      uint64_t v88 = v12;
      _os_log_impl(&dword_236756000, v11, OS_LOG_TYPE_INFO, "[%@] No version information, assuming SKIV V1", buf, 0xCu);
    }
  }
  uint64_t v13 = objc_opt_class();
  uint64_t v16 = objc_msgSend_AD_objectForKey_ofKindOfClass_(v4, v14, @"sourceAppAdamID", v13, v15);
  sourceAppAdamID = v5->_sourceAppAdamID;
  v5->_sourceAppAdamID = (NSNumber *)v16;

  if (!v5->_sourceAppAdamID)
  {
    v18 = APLogForCategory();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      uint64_t v19 = objc_opt_class();
      *(_DWORD *)buf = 138412290;
      uint64_t v88 = v19;
      _os_log_impl(&dword_236756000, v18, OS_LOG_TYPE_INFO, "[%@] No Source App AdamID, assuming SKIV V1, or default is acceptable", buf, 0xCu);
    }

    v20 = v5->_sourceAppAdamID;
    v5->_sourceAppAdamID = (NSNumber *)&unk_26E9B5308;
  }
  uint64_t v21 = objc_opt_class();
  uint64_t v24 = objc_msgSend_AD_objectForKey_ofKindOfClass_(v4, v22, @"adNetworkId", v21, v23);
  adNetworkID = v5->_adNetworkID;
  v5->_adNetworkID = (NSString *)v24;

  if (!v5->_adNetworkID)
  {
    v52 = APLogForCategory();
    if (!os_log_type_enabled(v52, OS_LOG_TYPE_ERROR)) {
      goto LABEL_30;
    }
    uint64_t v53 = objc_opt_class();
    v58 = objc_msgSend_AD_jsonString(v4, v54, v55, v56, v57);
    *(_DWORD *)buf = 138412546;
    uint64_t v88 = v53;
    __int16 v89 = 2112;
    v90 = v58;
    v59 = "[%@] ERROR: No Ad Network ID was provided: %@";
LABEL_29:
    _os_log_impl(&dword_236756000, v52, OS_LOG_TYPE_ERROR, v59, buf, 0x16u);

    goto LABEL_30;
  }
  uint64_t v26 = objc_opt_class();
  uint64_t v29 = objc_msgSend_AD_objectForKey_ofKindOfClass_(v4, v27, @"campaignId", v26, v28);
  campaignID = v5->_campaignID;
  v5->_campaignID = (NSNumber *)v29;

  if (!v5->_campaignID)
  {
    v52 = APLogForCategory();
    if (!os_log_type_enabled(v52, OS_LOG_TYPE_ERROR)) {
      goto LABEL_30;
    }
    uint64_t v60 = objc_opt_class();
    v58 = objc_msgSend_AD_jsonString(v4, v61, v62, v63, v64);
    *(_DWORD *)buf = 138412546;
    uint64_t v88 = v60;
    __int16 v89 = 2112;
    v90 = v58;
    v59 = "[%@] ERROR: No Campaign ID was provided: %@";
    goto LABEL_29;
  }
  uint64_t v31 = objc_opt_class();
  uint64_t v34 = objc_msgSend_AD_objectForKey_ofKindOfClass_(v4, v32, @"uuid", v31, v33);
  uuid = v5->_uuid;
  v5->_uuid = (NSString *)v34;

  if (!v5->_uuid)
  {
    v52 = APLogForCategory();
    if (!os_log_type_enabled(v52, OS_LOG_TYPE_ERROR)) {
      goto LABEL_30;
    }
    uint64_t v65 = objc_opt_class();
    v58 = objc_msgSend_AD_jsonString(v4, v66, v67, v68, v69);
    *(_DWORD *)buf = 138412546;
    uint64_t v88 = v65;
    __int16 v89 = 2112;
    v90 = v58;
    v59 = "[%@] ERROR: No UUID was provided: %@";
    goto LABEL_29;
  }
  uint64_t v36 = objc_opt_class();
  uint64_t v39 = objc_msgSend_AD_objectForKey_ofKindOfClass_(v4, v37, @"adamId", v36, v38);
  adamID = v5->_adamID;
  v5->_adamID = (NSNumber *)v39;

  if (!v5->_adamID)
  {
    v52 = APLogForCategory();
    if (!os_log_type_enabled(v52, OS_LOG_TYPE_ERROR)) {
      goto LABEL_30;
    }
    uint64_t v70 = objc_opt_class();
    v58 = objc_msgSend_AD_jsonString(v4, v71, v72, v73, v74);
    *(_DWORD *)buf = 138412546;
    uint64_t v88 = v70;
    __int16 v89 = 2112;
    v90 = v58;
    v59 = "[%@] ERROR: No Adam ID was provided: %@";
    goto LABEL_29;
  }
  uint64_t v41 = objc_opt_class();
  uint64_t v44 = objc_msgSend_AD_objectForKey_ofKindOfClass_(v4, v42, @"timestamp", v41, v43);
  timestamp = v5->_timestamp;
  v5->_timestamp = (NSNumber *)v44;

  if (!v5->_timestamp)
  {
    v52 = APLogForCategory();
    if (!os_log_type_enabled(v52, OS_LOG_TYPE_ERROR)) {
      goto LABEL_30;
    }
    uint64_t v75 = objc_opt_class();
    v58 = objc_msgSend_AD_jsonString(v4, v76, v77, v78, v79);
    *(_DWORD *)buf = 138412546;
    uint64_t v88 = v75;
    __int16 v89 = 2112;
    v90 = v58;
    v59 = "[%@] ERROR: No Timestamp was provided: %@";
    goto LABEL_29;
  }
  uint64_t v46 = objc_opt_class();
  uint64_t v49 = objc_msgSend_AD_objectForKey_ofKindOfClass_(v4, v47, @"signature", v46, v48);
  signature = v5->_signature;
  v5->_signature = (NSString *)v49;

  if (!v5->_signature)
  {
    v52 = APLogForCategory();
    if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
    {
      uint64_t v80 = objc_opt_class();
      v58 = objc_msgSend_AD_jsonString(v4, v81, v82, v83, v84);
      *(_DWORD *)buf = 138412546;
      uint64_t v88 = v80;
      __int16 v89 = 2112;
      v90 = v58;
      v59 = "[%@] ERROR: No Signature was provided: %@";
      goto LABEL_29;
    }
LABEL_30:

    v51 = 0;
    goto LABEL_31;
  }
LABEL_16:
  v51 = v5;
LABEL_31:

  return v51;
}

- (id)dictionaryRepresentation
{
  uint64_t v6 = objc_msgSend_dictionary(MEMORY[0x263EFF9A0], a2, v2, v3, v4);
  v10 = v6;
  version = self->_version;
  if (version) {
    objc_msgSend_setObject_forKey_(v6, v7, (uint64_t)version, @"version", v9);
  }
  adNetworkID = self->_adNetworkID;
  if (adNetworkID) {
    objc_msgSend_setObject_forKey_(v10, v7, (uint64_t)adNetworkID, @"adNetworkId", v9);
  }
  campaignID = self->_campaignID;
  if (campaignID) {
    objc_msgSend_setObject_forKey_(v10, v7, (uint64_t)campaignID, @"campaignId", v9);
  }
  uuid = self->_uuid;
  if (uuid) {
    objc_msgSend_setObject_forKey_(v10, v7, (uint64_t)uuid, @"uuid", v9);
  }
  adamID = self->_adamID;
  if (adamID) {
    objc_msgSend_setObject_forKey_(v10, v7, (uint64_t)adamID, @"adamId", v9);
  }
  timestamp = self->_timestamp;
  if (timestamp) {
    objc_msgSend_setObject_forKey_(v10, v7, (uint64_t)timestamp, @"timestamp", v9);
  }
  signature = self->_signature;
  if (signature) {
    objc_msgSend_setObject_forKey_(v10, v7, (uint64_t)signature, @"signature", v9);
  }
  v18 = objc_msgSend_dictionaryWithDictionary_(NSDictionary, v7, (uint64_t)v10, v8, v9);

  return v18;
}

- (void)recordStoreKitAdTap:(id)a3
{
  uint64_t v122 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = APLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = objc_opt_class();
    id v7 = v6;
    uint64_t v12 = objc_msgSend_dictionaryRepresentation(self, v8, v9, v10, v11);
    v17 = objc_msgSend_AD_jsonString(v12, v13, v14, v15, v16);
    *(_DWORD *)buf = 138412546;
    v119 = v6;
    __int16 v120 = 2112;
    id v121 = v17;
    _os_log_impl(&dword_236756000, v5, OS_LOG_TYPE_DEFAULT, "[%@] Attempting to update StoreKit Install Attribution with data: %@", buf, 0x16u);
  }
  id v18 = objc_alloc_init(MEMORY[0x263F25458]);
  uint64_t v23 = objc_msgSend_adamID(self, v19, v20, v21, v22);
  objc_msgSend_setAppAdamId_(v18, v24, (uint64_t)v23, v25, v26);

  uint64_t v31 = objc_msgSend_adNetworkID(self, v27, v28, v29, v30);
  objc_msgSend_setAdNetworkId_(v18, v32, (uint64_t)v31, v33, v34);

  uint64_t v39 = objc_msgSend_campaignID(self, v35, v36, v37, v38);
  objc_msgSend_setCampaignId_(v18, v40, (uint64_t)v39, v41, v42);

  v47 = objc_msgSend_uuid(self, v43, v44, v45, v46);
  objc_msgSend_setImpressionId_(v18, v48, (uint64_t)v47, v49, v50);

  uint64_t v55 = objc_msgSend_timestamp(self, v51, v52, v53, v54);
  objc_msgSend_setTimestamp_(v18, v56, (uint64_t)v55, v57, v58);

  uint64_t v63 = objc_msgSend_signature(self, v59, v60, v61, v62);
  objc_msgSend_setAttributionSignature_(v18, v64, (uint64_t)v63, v65, v66);

  objc_msgSend_setSourceAppBundleId_(v18, v67, 0, v68, v69);
  objc_msgSend_setOverrideCampaignLimit_(v18, v70, 1, v71, v72);
  uint64_t v77 = objc_msgSend_version(self, v73, v74, v75, v76);
  if (v77)
  {
    uint64_t v82 = (void *)v77;
    uint64_t v83 = objc_msgSend_version(self, v78, v79, v80, v81);
    uint64_t v88 = objc_msgSend_length(v83, v84, v85, v86, v87);

    if (v88)
    {
      v93 = objc_msgSend_version(self, v89, v90, v91, v92);
      objc_msgSend_setVersion_(v18, v94, (uint64_t)v93, v95, v96);

      v101 = objc_msgSend_sourceAppAdamID(self, v97, v98, v99, v100);
      objc_msgSend_setSourceAppAdamId_(v18, v102, (uint64_t)v101, v103, v104);
    }
  }
  v105 = APLogForCategory();
  if (os_log_type_enabled(v105, OS_LOG_TYPE_DEFAULT))
  {
    v106 = objc_opt_class();
    *(_DWORD *)buf = 138412546;
    v119 = v106;
    __int16 v120 = 2112;
    id v121 = v18;
    id v107 = v106;
    _os_log_impl(&dword_236756000, v105, OS_LOG_TYPE_DEFAULT, "[%@] Making call to StoreKit Install Attribution with ASDInstallAttributionParamsConfig: %@", buf, 0x16u);
  }
  v112 = objc_msgSend_sharedInstance(MEMORY[0x263F25450], v108, v109, v110, v111);
  v116[0] = MEMORY[0x263EF8330];
  v116[1] = 3221225472;
  v116[2] = sub_23676696C;
  v116[3] = &unk_264CADE50;
  v116[4] = self;
  id v117 = v4;
  id v113 = v4;
  objc_msgSend_addInstallAttributionParamsWithConfig_completionHandler_(v112, v114, (uint64_t)v18, (uint64_t)v116, v115);
}

- (NSString)version
{
  return self->_version;
}

- (NSNumber)sourceAppAdamID
{
  return self->_sourceAppAdamID;
}

- (NSString)adNetworkID
{
  return self->_adNetworkID;
}

- (NSNumber)campaignID
{
  return self->_campaignID;
}

- (NSString)uuid
{
  return self->_uuid;
}

- (NSNumber)adamID
{
  return self->_adamID;
}

- (NSNumber)timestamp
{
  return self->_timestamp;
}

- (NSString)signature
{
  return self->_signature;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_signature, 0);
  objc_storeStrong((id *)&self->_timestamp, 0);
  objc_storeStrong((id *)&self->_adamID, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_campaignID, 0);
  objc_storeStrong((id *)&self->_adNetworkID, 0);
  objc_storeStrong((id *)&self->_sourceAppAdamID, 0);
  objc_storeStrong((id *)&self->_version, 0);
}

@end