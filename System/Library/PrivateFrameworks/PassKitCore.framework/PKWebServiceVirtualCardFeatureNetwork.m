@interface PKWebServiceVirtualCardFeatureNetwork
+ (id)virtualCardFeatureNetworksFromDictionary:(id)a3;
- (BOOL)implicitlySupported;
- (BOOL)isSupportedOnDevice:(id)a3;
- (NSNumber)refreshType;
- (PKOSVersionRequirementRange)versions;
- (PKWebServiceVirtualCardFeatureNetwork)initWithDictionary:(id)a3 network:(int64_t)a4;
- (int64_t)network;
- (void)setImplicitlySupported:(BOOL)a3;
- (void)setNetwork:(int64_t)a3;
- (void)setRefreshType:(id)a3;
- (void)setVersions:(id)a3;
@end

@implementation PKWebServiceVirtualCardFeatureNetwork

+ (id)virtualCardFeatureNetworksFromDictionary:(id)a3
{
  v3 = (objc_class *)MEMORY[0x1E4F1CA60];
  id v4 = a3;
  v5 = objc_msgSend([v3 alloc], "initWithCapacity:", objc_msgSend(v4, "count"));
  id v6 = objc_alloc_init(MEMORY[0x1E4F28EE0]);
  [v6 setNumberStyle:1];
  uint64_t v11 = MEMORY[0x1E4F143A8];
  uint64_t v12 = 3221225472;
  v13 = __82__PKWebServiceVirtualCardFeatureNetwork_virtualCardFeatureNetworksFromDictionary___block_invoke;
  v14 = &unk_1E56DD410;
  id v15 = v6;
  id v16 = v5;
  id v7 = v5;
  id v8 = v6;
  [v4 enumerateKeysAndObjectsUsingBlock:&v11];

  v9 = objc_msgSend(v7, "copy", v11, v12, v13, v14);
  return v9;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_versions, 0);
  objc_storeStrong((id *)&self->_refreshType, 0);
}

void __82__PKWebServiceVirtualCardFeatureNetwork_virtualCardFeatureNetworksFromDictionary___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_class(), (objc_opt_isKindOfClass()))
  {
    id v7 = [*(id *)(a1 + 32) numberFromString:v5];
    if (v7)
    {
      id v8 = v7;
      v9 = [[PKWebServiceVirtualCardFeatureNetwork alloc] initWithDictionary:v6 network:[v7 integerValue]];
      if (v9) {
        [*(id *)(a1 + 40) setObject:v9 forKeyedSubscript:v8];
      }
    }
    else
    {
      v14 = PKLogFacilityTypeGetObject(6uLL);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        int v15 = 138412290;
        id v16 = v5;
        _os_log_impl(&dword_190E10000, v14, OS_LOG_TYPE_DEFAULT, "Couldn't parse version requirement for network: Key was not a number: '%@'", (uint8_t *)&v15, 0xCu);
      }

      id v8 = 0;
    }
  }
  else
  {
    id v8 = PKLogFacilityTypeGetObject(6uLL);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v10 = (objc_class *)objc_opt_class();
      uint64_t v11 = NSStringFromClass(v10);
      uint64_t v12 = (objc_class *)objc_opt_class();
      v13 = NSStringFromClass(v12);
      int v15 = 138412546;
      id v16 = v11;
      __int16 v17 = 2112;
      v18 = v13;
      _os_log_impl(&dword_190E10000, v8, OS_LOG_TYPE_DEFAULT, "Couldn't parse version requirement for network: Unexpected class (key: %@, value: %@)", (uint8_t *)&v15, 0x16u);
    }
  }
}

- (PKWebServiceVirtualCardFeatureNetwork)initWithDictionary:(id)a3 network:(int64_t)a4
{
  id v6 = a3;
  id v7 = [(PKWebServiceVirtualCardFeatureNetwork *)self init];
  id v8 = v7;
  if (v7)
  {
    v7->_network = a4;
    v7->_implicitlySupported = [v6 PKBoolForKey:@"implicitlySupported"];
    uint64_t v9 = [v6 PKNumberForKey:@"refreshType"];
    refreshType = v8->_refreshType;
    v8->_refreshType = (NSNumber *)v9;

    uint64_t v11 = [v6 PKDictionaryForKey:@"versionRange"];
    uint64_t v12 = [[PKOSVersionRequirementRange alloc] initWithDictionary:v11];
    versions = v8->_versions;
    v8->_versions = v12;
  }
  return v8;
}

- (BOOL)isSupportedOnDevice:(id)a3
{
  if (!self->_versions) {
    return 1;
  }
  v3 = self;
  id v4 = [a3 deviceClass];
  id v5 = +[PKOSVersionRequirement fromDeviceVersion];
  LOBYTE(v3) = [(PKOSVersionRequirementRange *)v3->_versions versionMeetsRequirements:v5 deviceClass:v4];

  return (char)v3;
}

- (int64_t)network
{
  return self->_network;
}

- (void)setNetwork:(int64_t)a3
{
  self->_network = a3;
}

- (BOOL)implicitlySupported
{
  return self->_implicitlySupported;
}

- (void)setImplicitlySupported:(BOOL)a3
{
  self->_implicitlySupported = a3;
}

- (NSNumber)refreshType
{
  return self->_refreshType;
}

- (void)setRefreshType:(id)a3
{
}

- (PKOSVersionRequirementRange)versions
{
  return self->_versions;
}

- (void)setVersions:(id)a3
{
}

@end