@interface APProxySessionConfigurationProvider
- (APProxySessionConfigurationProvider)initWithDefaultProxyURL:(id)a3;
- (APUnfairLock)lock;
- (NSArray)protocolClasses;
- (NSURL)defaultProxyURL;
- (NSURL)proxyURL;
- (id)_createConnectProxyConfig;
- (id)connectProxyConfig;
- (void)addProtocolClasses:(id)a3;
- (void)setDefaultProxyURL:(id)a3;
- (void)setProtocolClasses:(id)a3;
- (void)setProxyURL:(id)a3;
@end

@implementation APProxySessionConfigurationProvider

- (APProxySessionConfigurationProvider)initWithDefaultProxyURL:(id)a3
{
  id v5 = a3;
  v10 = (APProxySessionConfigurationProvider *)objc_msgSend_init(self, v6, v7, v8, v9);
  if (v10)
  {
    id v11 = objc_alloc(MEMORY[0x263F20B90]);
    uint64_t v15 = objc_msgSend_initWithOptions_(v11, v12, 1, v13, v14);
    lock = v10->_lock;
    v10->_lock = (APUnfairLock *)v15;

    objc_storeStrong((id *)&v10->_defaultProxyURL, a3);
    protocolClasses = v10->_protocolClasses;
    v10->_protocolClasses = (NSArray *)MEMORY[0x263EFFA68];
  }
  return v10;
}

- (void)addProtocolClasses:(id)a3
{
  id v4 = a3;
  objc_msgSend_lock(self, v5, v6, v7, v8);
  id v30 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_lock(v30, v9, v10, v11, v12);
  v17 = objc_msgSend_protocolClasses(self, v13, v14, v15, v16);
  v21 = objc_msgSend_arrayByAddingObjectsFromArray_(v17, v18, (uint64_t)v4, v19, v20);

  objc_msgSend_setProtocolClasses_(self, v22, (uint64_t)v21, v23, v24);
  connectProxyConfig = self->_connectProxyConfig;
  self->_connectProxyConfig = 0;

  objc_msgSend_unlock(v30, v26, v27, v28, v29);
}

- (void)setProxyURL:(id)a3
{
  id v4 = (NSURL *)a3;
  objc_msgSend_lock(self, v5, v6, v7, v8);
  id v20 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_lock(v20, v9, v10, v11, v12);
  proxyURL = self->_proxyURL;
  self->_proxyURL = v4;
  uint64_t v14 = v4;

  connectProxyConfig = self->_connectProxyConfig;
  self->_connectProxyConfig = 0;

  objc_msgSend_unlock(v20, v16, v17, v18, v19);
}

- (id)connectProxyConfig
{
  uint64_t v6 = objc_msgSend_lock(self, a2, v2, v3, v4);
  objc_msgSend_lock(v6, v7, v8, v9, v10);
  if (!self->_connectProxyConfig)
  {
    objc_msgSend__createConnectProxyConfig(self, v11, v12, v13, v14);
    uint64_t v15 = (NSURLSessionConfiguration *)objc_claimAutoreleasedReturnValue();
    connectProxyConfig = self->_connectProxyConfig;
    self->_connectProxyConfig = v15;
  }
  objc_msgSend_unlock(v6, v11, v12, v13, v14);
  uint64_t v17 = self->_connectProxyConfig;

  return v17;
}

- (id)_createConnectProxyConfig
{
  v78[4] = *MEMORY[0x263EF8340];
  uint64_t v6 = objc_msgSend_proxyURL(self, a2, v2, v3, v4);
  uint64_t v11 = objc_msgSend_host(v6, v7, v8, v9, v10);
  id v20 = objc_msgSend_port(v6, v12, v13, v14, v15);
  if (!v6 || !v11)
  {
    v21 = objc_msgSend_defaultProxyURL(self, v16, v17, v18, v19);

    uint64_t v26 = objc_msgSend_host(v21, v22, v23, v24, v25);

    uint64_t v31 = objc_msgSend_port(v21, v27, v28, v29, v30);

    uint64_t v11 = (void *)v26;
    id v20 = (void *)v31;
    uint64_t v6 = v21;
  }
  v32 = objc_msgSend_scheme(v6, v16, v17, v18, v19);
  int isEqualToString = objc_msgSend_isEqualToString_(v32, v33, @"http", v34, v35);

  v77[0] = @"HTTPEnable";
  v77[1] = @"HTTPSEnable";
  v78[0] = &unk_26ECD4288;
  v78[1] = &unk_26ECD4288;
  v38 = &unk_26ECD42A0;
  uint64_t v39 = *MEMORY[0x263EFC798];
  v77[2] = *MEMORY[0x263EFC788];
  v77[3] = v39;
  v40 = &unk_26ECD42B8;
  if (v20)
  {
    v38 = v20;
    v40 = v20;
  }
  v78[2] = v38;
  v78[3] = v40;
  v41 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v37, (uint64_t)v78, (uint64_t)v77, 4);
  v46 = v41;
  if (v11)
  {
    v47 = objc_msgSend_mutableCopy(v41, v42, v43, v44, v45);
    objc_msgSend_setObject_forKeyedSubscript_(v47, v48, (uint64_t)v11, *MEMORY[0x263EFC780], v49);
    objc_msgSend_setObject_forKeyedSubscript_(v47, v50, (uint64_t)v11, *MEMORY[0x263EFC790], v51);
    uint64_t v56 = objc_msgSend_copy(v47, v52, v53, v54, v55);

    v46 = (void *)v56;
  }
  uint64_t v57 = isEqualToString ^ 1u;
  v58 = objc_msgSend_ephemeralSessionConfiguration(MEMORY[0x263EFC648], v42, v43, v44, v45);
  objc_msgSend_setConnectionProxyDictionary_(v58, v59, (uint64_t)v46, v60, v61);
  v66 = objc_msgSend_protocolClasses(self, v62, v63, v64, v65);
  objc_msgSend_setProtocolClasses_(v58, v67, (uint64_t)v66, v68, v69);

  objc_msgSend_set_preventsSystemHTTPProxyAuthentication_(v58, v70, 1, v71, v72);
  objc_msgSend_set_requiresSecureHTTPSProxyConnection_(v58, v73, v57, v74, v75);

  return v58;
}

- (NSArray)protocolClasses
{
  return self->_protocolClasses;
}

- (void)setProtocolClasses:(id)a3
{
}

- (NSURL)proxyURL
{
  return self->_proxyURL;
}

- (NSURL)defaultProxyURL
{
  return self->_defaultProxyURL;
}

- (void)setDefaultProxyURL:(id)a3
{
}

- (APUnfairLock)lock
{
  return self->_lock;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lock, 0);
  objc_storeStrong((id *)&self->_defaultProxyURL, 0);
  objc_storeStrong((id *)&self->_proxyURL, 0);
  objc_storeStrong((id *)&self->_protocolClasses, 0);

  objc_storeStrong((id *)&self->_connectProxyConfig, 0);
}

@end