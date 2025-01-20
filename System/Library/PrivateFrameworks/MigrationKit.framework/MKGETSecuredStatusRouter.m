@interface MKGETSecuredStatusRouter
- (MKGETSecuredStatusRouter)init;
- (MKGETStatusRouter)getStatusRouter;
- (MKStorage)storage;
- (NSArray)supportedContentTypes;
- (NSArray)supportedTransferEncodings;
- (NSDictionary)signatures;
- (NSString)uuid;
- (void)server:(id)a3 didReceiveRequest:(id)a4 response:(id)a5;
- (void)setGetStatusRouter:(id)a3;
- (void)setSignatures:(id)a3;
- (void)setStorage:(id)a3;
- (void)setSupportedContentTypes:(id)a3;
- (void)setSupportedTransferEncodings:(id)a3;
- (void)setUuid:(id)a3;
@end

@implementation MKGETSecuredStatusRouter

- (MKGETSecuredStatusRouter)init
{
  v9.receiver = self;
  v9.super_class = (Class)MKGETSecuredStatusRouter;
  v2 = [(MKGETSecuredStatusRouter *)&v9 init];
  if (v2)
  {
    v3 = [MEMORY[0x263EFFA40] standardUserDefaults];
    v4 = [v3 objectForKey:@"uuid"];
    if (![v4 length])
    {
      v5 = [MEMORY[0x263F08C38] UUID];
      uint64_t v6 = [v5 UUIDString];

      [v3 setObject:v6 forKey:@"uuid"];
      [v3 synchronize];
      v4 = (void *)v6;
    }
    [(MKGETSecuredStatusRouter *)v2 setUuid:v4];
    v7 = objc_alloc_init(MKStorage);
    [(MKGETSecuredStatusRouter *)v2 setStorage:v7];
  }
  return v2;
}

- (void)server:(id)a3 didReceiveRequest:(id)a4 response:(id)a5
{
  uint64_t v117 = *MEMORY[0x263EF8340];
  id v85 = a5;
  id v6 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  v7 = NSNumber;
  locatiouint64_t n = (id *)&self->_getStatusRouter;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_getStatusRouter);
  objc_super v9 = objc_msgSend(v7, "numberWithInteger:", objc_msgSend(WeakRetained, "state"));
  v90 = v6;
  [v6 setObject:v9 forKey:@"state"];

  id v10 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  long long v108 = 0u;
  long long v109 = 0u;
  long long v110 = 0u;
  long long v111 = 0u;
  v89 = self;
  v11 = self->_supportedContentTypes;
  uint64_t v12 = [(NSArray *)v11 countByEnumeratingWithState:&v108 objects:v116 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v109;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v109 != v14) {
          objc_enumerationMutation(v11);
        }
        uint64_t v16 = *(void *)(*((void *)&v108 + 1) + 8 * i);
        v17 = [NSNumber numberWithBool:1];
        [v10 setObject:v17 forKey:v16];
      }
      uint64_t v13 = [(NSArray *)v11 countByEnumeratingWithState:&v108 objects:v116 count:16];
    }
    while (v13);
  }

  [v90 setObject:v10 forKey:@"supported_content_types"];
  id v18 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  long long v104 = 0u;
  long long v105 = 0u;
  long long v106 = 0u;
  long long v107 = 0u;
  v19 = v89->_supportedTransferEncodings;
  uint64_t v20 = [(NSArray *)v19 countByEnumeratingWithState:&v104 objects:v115 count:16];
  if (v20)
  {
    uint64_t v21 = v20;
    uint64_t v22 = *(void *)v105;
    do
    {
      for (uint64_t j = 0; j != v21; ++j)
      {
        if (*(void *)v105 != v22) {
          objc_enumerationMutation(v19);
        }
        uint64_t v24 = *(void *)(*((void *)&v104 + 1) + 8 * j);
        v25 = [NSNumber numberWithBool:1];
        [v18 setObject:v25 forKey:v24];
      }
      uint64_t v21 = [(NSArray *)v19 countByEnumeratingWithState:&v104 objects:v115 count:16];
    }
    while (v21);
  }
  v84 = v10;

  v82 = v18;
  [v90 setObject:v18 forKey:@"supported_transfer_encodings"];
  id v88 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  long long v100 = 0u;
  long long v101 = 0u;
  long long v102 = 0u;
  long long v103 = 0u;
  obuint64_t j = v89->_signatures;
  uint64_t v26 = [(NSDictionary *)obj countByEnumeratingWithState:&v100 objects:v114 count:16];
  if (v26)
  {
    uint64_t v27 = v26;
    uint64_t v28 = *(void *)v101;
    uint64_t v29 = MEMORY[0x263EFFA88];
    do
    {
      for (uint64_t k = 0; k != v27; ++k)
      {
        if (*(void *)v101 != v28) {
          objc_enumerationMutation(obj);
        }
        uint64_t v31 = *(void *)(*((void *)&v100 + 1) + 8 * k);
        v32 = [(NSDictionary *)v89->_signatures objectForKeyedSubscript:v31];
        id v33 = objc_alloc_init(MEMORY[0x263EFF9A0]);
        long long v96 = 0u;
        long long v97 = 0u;
        long long v98 = 0u;
        long long v99 = 0u;
        id v34 = v32;
        uint64_t v35 = [v34 countByEnumeratingWithState:&v96 objects:v113 count:16];
        if (v35)
        {
          uint64_t v36 = v35;
          uint64_t v37 = *(void *)v97;
          do
          {
            for (uint64_t m = 0; m != v36; ++m)
            {
              if (*(void *)v97 != v37) {
                objc_enumerationMutation(v34);
              }
              [v33 setObject:v29 forKeyedSubscript:*(void *)(*((void *)&v96 + 1) + 8 * m)];
            }
            uint64_t v36 = [v34 countByEnumeratingWithState:&v96 objects:v113 count:16];
          }
          while (v36);
        }

        [v88 setObject:v33 forKeyedSubscript:v31];
      }
      uint64_t v27 = [(NSDictionary *)obj countByEnumeratingWithState:&v100 objects:v114 count:16];
    }
    while (v27);
  }

  [v90 setObject:v88 forKey:@"signatures"];
  id v39 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  v40 = [MEMORY[0x263EFF960] currentLocale];
  uint64_t v41 = [v40 localeIdentifier];
  uint64_t v42 = [v40 languageCode];
  uint64_t v43 = [v40 countryCode];
  uint64_t v44 = [v40 scriptCode];
  v81 = v40;
  uint64_t v45 = [v40 variantCode];
  v80 = (void *)v41;
  [v39 setObject:v41 forKey:@"identifier"];
  v79 = (void *)v42;
  [v39 setObject:v42 forKey:@"language_code"];
  if (v43) {
    [v39 setObject:v43 forKey:@"country_code"];
  }
  if (v44) {
    [v39 setObject:v44 forKey:@"script_code"];
  }
  v77 = (void *)v44;
  v78 = (void *)v43;
  if (v45) {
    [v39 setObject:v45 forKey:@"variant_code"];
  }
  v76 = (void *)v45;
  id obja = v39;
  [v90 setObject:v39 forKey:@"locale"];
  v46 = objc_alloc_init(MKDevice);
  v47 = NSNumber;
  *(float *)&double v48 = (float)[(MKDevice *)v46 iconSize];
  v49 = [v47 numberWithFloat:v48];
  [v90 setObject:v49 forKey:@"icon_size"];

  v50 = [(MKDevice *)v46 systemName];
  [v90 setObject:v50 forKey:@"system_name"];

  v51 = [(MKDevice *)v46 systemVersion];
  [v90 setObject:v51 forKey:@"system_version"];

  v52 = [(MKDevice *)v46 deviceFamily];
  [v90 setObject:v52 forKey:@"device_family"];

  v53 = [(MKDevice *)v46 deviceName];
  [v90 setObject:v53 forKey:@"device_name"];

  v54 = [(MKDevice *)v46 deviceModel];
  [v90 setObject:v54 forKey:@"device_model"];

  v55 = [(MKGETSecuredStatusRouter *)v89 uuid];
  [v90 setObject:v55 forKey:@"id"];

  id v56 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  v57 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[MKStorage availableSpaceInBytes](v89->_storage, "availableSpaceInBytes"));
  [v56 setObject:v57 forKey:@"available_space_in_bytes"];

  v58 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[MKStorage availableSpaceInMegabytes](v89->_storage, "availableSpaceInMegabytes"));
  [v56 setObject:v58 forKey:@"available_space_in_megabytes"];

  v59 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[MKStorage availableSpaceInGigabytes](v89->_storage, "availableSpaceInGigabytes"));
  [v56 setObject:v59 forKey:@"available_space_in_gigabytes"];

  v60 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[MKStorage availableSpaceInTerabytes](v89->_storage, "availableSpaceInTerabytes"));
  [v56 setObject:v60 forKey:@"available_space_in_terabytes"];

  [v90 setObject:v56 forKey:@"storage"];
  v61 = objc_alloc_init(MKWiFiDevice);
  v62 = [(MKWiFiDevice *)v61 currentNetwork];
  long long v92 = 0u;
  long long v93 = 0u;
  long long v94 = 0u;
  long long v95 = 0u;
  v63 = [v62 allKeys];
  uint64_t v64 = [v63 countByEnumeratingWithState:&v92 objects:v112 count:16];
  if (v64)
  {
    uint64_t v65 = v64;
    uint64_t v66 = *(void *)v93;
    do
    {
      for (uint64_t n = 0; n != v65; ++n)
      {
        if (*(void *)v93 != v66) {
          objc_enumerationMutation(v63);
        }
        uint64_t v68 = *(void *)(*((void *)&v92 + 1) + 8 * n);
        v69 = [v62 objectForKeyedSubscript:v68];
        [v90 setObject:v69 forKey:v68];
      }
      uint64_t v65 = [v63 countByEnumeratingWithState:&v92 objects:v112 count:16];
    }
    while (v65);
  }

  v70 = NSNumber;
  id v71 = objc_loadWeakRetained(location);
  v72 = objc_msgSend(v70, "numberWithInteger:", objc_msgSend(v71, "preferredChannel"));
  [v90 setObject:v72 forKey:@"ap1"];

  id v91 = 0;
  v73 = [MEMORY[0x263F08900] dataWithJSONObject:v90 options:0 error:&v91];
  id v74 = v91;
  if (v74)
  {
    v75 = +[MKLog log];
    if (os_log_type_enabled(v75, OS_LOG_TYPE_ERROR)) {
      -[MKGETStatusRouter server:didReceiveRequest:response:]((uint64_t)v74, v75);
    }
  }
  [v85 setBody:v73];
}

- (MKGETStatusRouter)getStatusRouter
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_getStatusRouter);
  return (MKGETStatusRouter *)WeakRetained;
}

- (void)setGetStatusRouter:(id)a3
{
}

- (NSArray)supportedContentTypes
{
  return self->_supportedContentTypes;
}

- (void)setSupportedContentTypes:(id)a3
{
}

- (NSArray)supportedTransferEncodings
{
  return self->_supportedTransferEncodings;
}

- (void)setSupportedTransferEncodings:(id)a3
{
}

- (NSDictionary)signatures
{
  return self->_signatures;
}

- (void)setSignatures:(id)a3
{
}

- (NSString)uuid
{
  return self->_uuid;
}

- (void)setUuid:(id)a3
{
}

- (MKStorage)storage
{
  return self->_storage;
}

- (void)setStorage:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_storage, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_signatures, 0);
  objc_storeStrong((id *)&self->_supportedTransferEncodings, 0);
  objc_storeStrong((id *)&self->_supportedContentTypes, 0);
  objc_destroyWeak((id *)&self->_getStatusRouter);
}

@end