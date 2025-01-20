@interface SPRPrimer
+ (SPRPrimer)primerWithConfiguration:(id)a3 error:(id *)a4;
+ (SPRPrimer)shared;
- (BOOL)isProduction;
- (NSDictionary)configuration;
- (NSURL)attestationBackendURL;
- (NSURL)configuratorBackendURL;
- (NSURL)monitoringBackendURL;
- (NSURL)storageURL;
- (SPRPrimer)initWithConfiguration:(id)a3 error:(id *)a4;
- (SPRProvider)getProvider;
- (id)attestationManagerAndReturnError:(id *)a3;
- (id)monitorManagerAndReturnError:(id *)a3;
- (id)persistenceFactoryAndReturnError:(id *)a3;
- (id)secureChannelAndReturnError:(id *)a3;
- (id)secureChannelWithName:(id)a3 error:(id *)a4;
- (void)onDisconnect;
@end

@implementation SPRPrimer

+ (SPRPrimer)shared
{
  v6 = objc_msgSend_shared(SPRServiceClient, a2, v2, v3, v4, v5);
  v12 = objc_msgSend_sharedPrimer(v6, v7, v8, v9, v10, v11);

  return (SPRPrimer *)v12;
}

- (NSDictionary)configuration
{
  uint64_t v14 = 0;
  v15 = &v14;
  uint64_t v16 = 0x3032000000;
  v17 = sub_221253AD0;
  v18 = sub_221253AE0;
  id v19 = 0;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = sub_221253AE8;
  v13[3] = &unk_26459CB70;
  v13[4] = self;
  uint64_t v5 = objc_msgSend_syncProxyWithErrorHandler_(self, a2, (uint64_t)v13, v2, v3, v4);
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = sub_221253B54;
  v12[3] = &unk_26459CEE0;
  v12[4] = &v14;
  objc_msgSend_copyConfigurationWithReply_(v5, v6, (uint64_t)v12, v7, v8, v9);

  id v10 = (id)v15[5];
  _Block_object_dispose(&v14, 8);

  return (NSDictionary *)v10;
}

- (SPRProvider)getProvider
{
  p_providerPredicate = &self->_providerPredicate;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_221253C08;
  block[3] = &unk_26459CF58;
  block[4] = self;
  if (*p_providerPredicate != -1) {
    dispatch_once(p_providerPredicate, block);
  }
  return self->_provider;
}

- (NSURL)attestationBackendURL
{
  v6 = objc_msgSend_configuration(self, a2, v2, v3, v4, v5);
  uint64_t v11 = objc_msgSend_objectForKeyedSubscript_(v6, v7, @"Server.MPOC.Monitoring.Url", v8, v9, v10);

  return (NSURL *)v11;
}

- (NSURL)configuratorBackendURL
{
  v6 = objc_msgSend_configuration(self, a2, v2, v3, v4, v5);
  uint64_t v11 = objc_msgSend_objectForKeyedSubscript_(v6, v7, @"Server.Configurator.Url", v8, v9, v10);

  return (NSURL *)v11;
}

- (NSURL)monitoringBackendURL
{
  v6 = objc_msgSend_configuration(self, a2, v2, v3, v4, v5);
  uint64_t v11 = objc_msgSend_objectForKeyedSubscript_(v6, v7, @"Server.MPOC.Monitoring.Url", v8, v9, v10);

  return (NSURL *)v11;
}

- (NSURL)storageURL
{
  v6 = objc_msgSend_configuration(self, a2, v2, v3, v4, v5);
  uint64_t v11 = objc_msgSend_objectForKeyedSubscript_(v6, v7, @"Storage.Location.Path", v8, v9, v10);

  return (NSURL *)v11;
}

- (SPRPrimer)initWithConfiguration:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v24[0] = 0;
  v24[1] = v24;
  v24[2] = 0x3032000000;
  v24[3] = sub_221253AD0;
  v24[4] = sub_221253AE0;
  id v25 = (id)objc_msgSend_mutableCopy(v6, v7, v8, v9, v10, v11);
  v23[0] = MEMORY[0x263EF8330];
  v23[1] = 3221225472;
  v23[2] = sub_221254118;
  v23[3] = &unk_26459CFA8;
  v23[4] = v24;
  id v16 = (id)objc_msgSend_initWithConnector_(self, v12, (uint64_t)v23, v13, v14, v15);
  objc_msgSend_connectAndReturnError_(v16, v17, (uint64_t)a4, v18, v19, v20);
  v21 = (SPRPrimer *)objc_claimAutoreleasedReturnValue();

  _Block_object_dispose(v24, 8);
  return v21;
}

+ (SPRPrimer)primerWithConfiguration:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v6 = [SPRPrimer alloc];
  uint64_t v10 = objc_msgSend_initWithConfiguration_error_(v6, v7, (uint64_t)v5, (uint64_t)a4, v8, v9);

  return (SPRPrimer *)v10;
}

- (id)attestationManagerAndReturnError:(id *)a3
{
  uint64_t v7 = objc_msgSend_errorWithCode_(SPRError, a2, 7002, v3, v4, v5);

  if (a3 && v7)
  {
    objc_msgSend_errorWithCode_(SPRError, v8, 7002, v9, v10, v11);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  return 0;
}

- (id)monitorManagerAndReturnError:(id *)a3
{
  uint64_t v7 = objc_msgSend_errorWithCode_(SPRError, a2, 7002, v3, v4, v5);

  if (a3 && v7)
  {
    objc_msgSend_errorWithCode_(SPRError, v8, 7002, v9, v10, v11);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  return 0;
}

- (id)persistenceFactoryAndReturnError:(id *)a3
{
  uint64_t v7 = objc_msgSend_errorWithCode_(SPRError, a2, 7002, v3, v4, v5);

  if (a3 && v7)
  {
    objc_msgSend_errorWithCode_(SPRError, v8, 7002, v9, v10, v11);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  return 0;
}

- (id)secureChannelAndReturnError:(id *)a3
{
  uint64_t v5 = [SPRSecureChannel alloc];
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = sub_221254728;
  v19[3] = &unk_26459CFF8;
  v19[4] = self;
  uint64_t v10 = objc_msgSend_initWithConnector_(v5, v6, (uint64_t)v19, v7, v8, v9);
  uint64_t v15 = v10;
  if (a3)
  {
    objc_msgSend_connectAndReturnError_(v10, v11, (uint64_t)a3, v12, v13, v14);
    id v16 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v16 = v10;
  }
  v17 = v16;

  return v17;
}

- (void)onDisconnect
{
  objc_msgSend_invalidate(self->_provider, a2, v2, v3, v4, v5);
}

- (id)secureChannelWithName:(id)a3 error:(id *)a4
{
  return (id)objc_msgSend_secureChannelAndReturnError_(self, a2, (uint64_t)a4, (uint64_t)a4, v4, v5);
}

- (BOOL)isProduction
{
  return self->_isProduction;
}

- (void).cxx_destruct
{
}

@end