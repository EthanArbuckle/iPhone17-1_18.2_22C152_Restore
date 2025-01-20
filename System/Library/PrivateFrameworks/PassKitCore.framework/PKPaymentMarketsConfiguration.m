@interface PKPaymentMarketsConfiguration
+ (BOOL)supportsSecureCoding;
+ (id)closestMarketFromSet:(id)a3 forLocation:(id)a4;
+ (void)paymentMarketsConfigurationWithURL:(id)a3 forDeviceClass:(id)a4 version:(id)a5 completion:(id)a6;
- (NSSet)markets;
- (NSString)version;
- (NSURL)url;
- (PKPaymentMarketsConfiguration)initWithCoder:(id)a3;
- (PKPaymentMarketsConfiguration)initWithDictionary:(id)a3 url:(id)a4 forDeviceClass:(id)a5 version:(id)a6;
- (id)expressTransitNetworksForLocation:(id)a3;
- (id)marketsForLocation:(id)a3;
- (id)marketsForLocation:(id)a3 ofType:(int64_t)a4;
- (id)marketsForLocation:(id)a3 passingTest:(id)a4;
- (id)marketsForRegions:(id)a3;
- (id)supportedTransitNetworksForLocation:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PKPaymentMarketsConfiguration

+ (void)paymentMarketsConfigurationWithURL:(id)a3 forDeviceClass:(id)a4 version:(id)a5 completion:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  v13 = PKDeviceClass();
  v14 = +[PKOSVersionRequirement fromDeviceVersion];
  if (!v10)
  {
    id v10 = v13;
    if (v11) {
      goto LABEL_3;
    }
LABEL_13:
    id v11 = v14;
    goto LABEL_3;
  }
  if (!v11) {
    goto LABEL_13;
  }
LABEL_3:
  if ([v10 isEqualToString:v13] && objc_msgSend(v11, "isEqual:", v14))
  {
    if (([(id)qword_1EB402B48 isEqual:v9] & 1) == 0)
    {
      v15 = (void *)qword_1EB402B58;
      qword_1EB402B58 = 0;

      v16 = (void *)qword_1EB402B60;
      qword_1EB402B60 = 0;
    }
    char v17 = 1;
  }
  else
  {
    char v17 = 0;
  }
  if (qword_1EB402B40 != -1) {
    dispatch_once(&qword_1EB402B40, &__block_literal_global_21);
  }
  v18 = (void *)_MergedGlobals_198;
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __102__PKPaymentMarketsConfiguration_paymentMarketsConfigurationWithURL_forDeviceClass_version_completion___block_invoke_2;
  v23[3] = &unk_1E56DCE38;
  id v24 = v9;
  id v25 = v10;
  id v26 = v11;
  id v27 = v12;
  char v28 = v17;
  id v19 = v11;
  id v20 = v10;
  id v21 = v9;
  id v22 = v12;
  [v18 downloadFromUrl:v21 completionHandler:v23];
}

void __102__PKPaymentMarketsConfiguration_paymentMarketsConfigurationWithURL_forDeviceClass_version_completion___block_invoke()
{
  id v3 = [MEMORY[0x1E4F18DD0] defaultSessionConfiguration];
  [v3 setTimeoutIntervalForResource:360.0];
  [v3 setTimeoutIntervalForRequest:60.0];
  [v3 setNetworkServiceType:3];
  v0 = [MEMORY[0x1E4F18DC0] sessionWithConfiguration:v3];
  v1 = [[PKObjectDownloader alloc] initWithSession:v0];
  v2 = (void *)_MergedGlobals_198;
  _MergedGlobals_198 = (uint64_t)v1;
}

void __102__PKPaymentMarketsConfiguration_paymentMarketsConfigurationWithURL_forDeviceClass_version_completion___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v10 = v8;
    id v11 = v10;
    if (v10)
    {
      id v12 = (void *)qword_1EB402B60;
      v13 = [v10 valueForHTTPHeaderField:@"Etag"];
      if (([v12 isEqualToString:v13] & 1) == 0)
      {

        if (v7) {
          goto LABEL_11;
        }
LABEL_13:
        v18 = 0;
        goto LABEL_14;
      }
      v14 = (void *)qword_1EB402B58;
      v15 = [v11 valueForHTTPHeaderField:@"Last-Modified"];
      LODWORD(v14) = [v14 isEqualToString:v15];

      if (v14)
      {
        v16 = PKLogFacilityTypeGetObject(2uLL);
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_190E10000, v16, OS_LOG_TYPE_DEFAULT, "Markets configuration loaded from cache", buf, 2u);
        }

        uint64_t v17 = *(void *)(a1 + 56);
        if (v17)
        {
          (*(void (**)(uint64_t, uint64_t, void))(v17 + 16))(v17, qword_1EB402B50, 0);
          goto LABEL_40;
        }
      }
    }
  }
  else
  {
    id v11 = 0;
  }
  if (!v7) {
    goto LABEL_13;
  }
LABEL_11:
  id v33 = v9;
  v18 = [MEMORY[0x1E4F28D90] JSONObjectWithData:v7 options:0 error:&v33];
  id v19 = v33;

  id v9 = v19;
LABEL_14:
  id v20 = PKLogFacilityTypeGetObject(2uLL);
  BOOL v21 = os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG);

  if (v21)
  {
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_190E10000, v20, OS_LOG_TYPE_DEFAULT, "Markets configuration loaded from web", buf, 2u);
    }
  }
  if (!v7 || v9)
  {
    if (!v9)
    {
      id v9 = [MEMORY[0x1E4F28C58] errorWithDomain:@"PKPassKitErrorDomain" code:1 userInfo:0];
    }
    v29 = PKLogFacilityTypeGetObject(6uLL);
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v35 = v9;
      _os_log_impl(&dword_190E10000, v29, OS_LOG_TYPE_DEFAULT, "Markets configuration failed downloading: %@", buf, 0xCu);
    }

    uint64_t v30 = *(void *)(a1 + 56);
    if (v30) {
      (*(void (**)(uint64_t, void, id))(v30 + 16))(v30, 0, v9);
    }
  }
  else
  {
    if (v18
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && (id v22 = [[PKPaymentMarketsConfiguration alloc] initWithDictionary:v18 url:*(void *)(a1 + 32) forDeviceClass:*(void *)(a1 + 40) version:*(void *)(a1 + 48)]) != 0)
    {
      v23 = v22;
      if (*(unsigned char *)(a1 + 64))
      {
        objc_storeStrong((id *)&qword_1EB402B48, *(id *)(a1 + 32));
        objc_storeStrong((id *)&qword_1EB402B50, v23);
        uint64_t v24 = [v11 valueForHTTPHeaderField:@"Last-Modified"];
        id v25 = (void *)qword_1EB402B58;
        qword_1EB402B58 = v24;

        uint64_t v26 = [v11 valueForHTTPHeaderField:@"Etag"];
        id v27 = (void *)qword_1EB402B60;
        qword_1EB402B60 = v26;
      }
      uint64_t v28 = *(void *)(a1 + 56);
      if (v28) {
        (*(void (**)(uint64_t, PKPaymentMarketsConfiguration *, void))(v28 + 16))(v28, v23, 0);
      }
    }
    else
    {
      v31 = PKLogFacilityTypeGetObject(6uLL);
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v35 = 0;
        _os_log_impl(&dword_190E10000, v31, OS_LOG_TYPE_DEFAULT, "Markets configuration failed to parse: %@", buf, 0xCu);
      }

      uint64_t v32 = *(void *)(a1 + 56);
      if (v32) {
        (*(void (**)(uint64_t, void, void))(v32 + 16))(v32, 0, 0);
      }
      v23 = 0;
    }

    id v9 = 0;
  }

LABEL_40:
}

- (PKPaymentMarketsConfiguration)initWithDictionary:(id)a3 url:(id)a4 forDeviceClass:(id)a5 version:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v30.receiver = self;
  v30.super_class = (Class)PKPaymentMarketsConfiguration;
  v14 = [(PKPaymentMarketsConfiguration *)&v30 init];
  if (v14)
  {
    uint64_t v15 = [v11 copy];
    url = v14->_url;
    v14->_url = (NSURL *)v15;

    uint64_t v17 = [v10 PKStringForKey:@"Version"];
    uint64_t v18 = [v17 copy];
    version = v14->_version;
    v14->_version = (NSString *)v18;

    id v20 = [v10 PKArrayForKey:@"MarketGeos"];
    id v21 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __79__PKPaymentMarketsConfiguration_initWithDictionary_url_forDeviceClass_version___block_invoke;
    v26[3] = &unk_1E56DCE60;
    id v27 = v12;
    id v28 = v13;
    id v29 = v21;
    id v22 = v21;
    [v20 enumerateObjectsUsingBlock:v26];
    uint64_t v23 = [v22 copy];
    markets = v14->_markets;
    v14->_markets = (NSSet *)v23;
  }
  return v14;
}

void __79__PKPaymentMarketsConfiguration_initWithDictionary_url_forDeviceClass_version___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v5 = [[PKPaymentMarket alloc] initWithDictionary:v3 forDeviceClass:*(void *)(a1 + 32) version:*(void *)(a1 + 40)];

  v4 = v5;
  if (v5)
  {
    [*(id *)(a1 + 48) addObject:v5];
    v4 = v5;
  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKPaymentMarketsConfiguration)initWithCoder:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)PKPaymentMarketsConfiguration;
  v5 = [(PKPaymentMarketsConfiguration *)&v16 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"url"];
    url = v5->_url;
    v5->_url = (NSURL *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"version"];
    version = v5->_version;
    v5->_version = (NSString *)v8;

    id v10 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v11 = objc_opt_class();
    id v12 = objc_msgSend(v10, "setWithObjects:", v11, objc_opt_class(), 0);
    uint64_t v13 = [v4 decodeObjectOfClasses:v12 forKey:@"markets"];
    markets = v5->_markets;
    v5->_markets = (NSSet *)v13;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  url = self->_url;
  id v5 = a3;
  [v5 encodeObject:url forKey:@"url"];
  [v5 encodeObject:self->_version forKey:@"version"];
  [v5 encodeObject:self->_markets forKey:@"markets"];
}

- (id)marketsForLocation:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  markets = self->_markets;
  uint64_t v11 = MEMORY[0x1E4F143A8];
  uint64_t v12 = 3221225472;
  uint64_t v13 = __52__PKPaymentMarketsConfiguration_marketsForLocation___block_invoke;
  v14 = &unk_1E56DCE88;
  id v15 = v4;
  id v16 = v5;
  id v7 = v5;
  id v8 = v4;
  [(NSSet *)markets enumerateObjectsUsingBlock:&v11];
  id v9 = objc_msgSend(v7, "copy", v11, v12, v13, v14);

  return v9;
}

void __52__PKPaymentMarketsConfiguration_marketsForLocation___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 containsLocation:*(void *)(a1 + 32)]) {
    [*(id *)(a1 + 40) addObject:v3];
  }
}

- (id)marketsForLocation:(id)a3 passingTest:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  markets = self->_markets;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __64__PKPaymentMarketsConfiguration_marketsForLocation_passingTest___block_invoke;
  v15[3] = &unk_1E56DCEB0;
  id v17 = v8;
  id v18 = v7;
  id v16 = v6;
  id v10 = v8;
  id v11 = v6;
  id v12 = v7;
  [(NSSet *)markets enumerateObjectsUsingBlock:v15];
  uint64_t v13 = (void *)[v10 copy];

  return v13;
}

void __64__PKPaymentMarketsConfiguration_marketsForLocation_passingTest___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ((*(unsigned int (**)(void))(*(void *)(a1 + 48) + 16))()
    && [v3 containsLocation:*(void *)(a1 + 32)])
  {
    [*(id *)(a1 + 40) addObject:v3];
  }
}

- (id)marketsForLocation:(id)a3 ofType:(int64_t)a4
{
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __59__PKPaymentMarketsConfiguration_marketsForLocation_ofType___block_invoke;
  v6[3] = &__block_descriptor_40_e25_B16__0__PKPaymentMarket_8l;
  v6[4] = a4;
  id v4 = [(PKPaymentMarketsConfiguration *)self marketsForLocation:a3 passingTest:v6];
  return v4;
}

BOOL __59__PKPaymentMarketsConfiguration_marketsForLocation_ofType___block_invoke(uint64_t a1, void *a2)
{
  return [a2 type] == *(void *)(a1 + 32);
}

+ (id)closestMarketFromSet:(id)a3 forLocation:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  uint64_t v7 = [v5 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    id v9 = 0;
    double v10 = *MEMORY[0x1E4F1E568];
    uint64_t v11 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v19 != v11) {
          objc_enumerationMutation(v5);
        }
        uint64_t v13 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        [v13 shortestDistanceFromLocation:v6];
        if (v14 < v10)
        {
          double v15 = v14;
          id v16 = v13;

          double v10 = v15;
          id v9 = v16;
        }
      }
      uint64_t v8 = [v5 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v8);
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

- (id)marketsForRegions:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  markets = self->_markets;
  uint64_t v11 = MEMORY[0x1E4F143A8];
  uint64_t v12 = 3221225472;
  uint64_t v13 = __51__PKPaymentMarketsConfiguration_marketsForRegions___block_invoke;
  double v14 = &unk_1E56DCE88;
  id v15 = v4;
  id v16 = v5;
  id v7 = v5;
  id v8 = v4;
  [(NSSet *)markets enumerateObjectsUsingBlock:&v11];
  id v9 = objc_msgSend(v7, "copy", v11, v12, v13, v14);

  return v9;
}

void __51__PKPaymentMarketsConfiguration_marketsForRegions___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  id v6 = v3;
  id v5 = [v3 region];
  LODWORD(v4) = [v4 containsObject:v5];

  if (v4) {
    [*(id *)(a1 + 40) addObject:v6];
  }
}

- (id)supportedTransitNetworksForLocation:(id)a3
{
  id v3 = [(PKPaymentMarketsConfiguration *)self marketsForLocation:a3];
  if (v3)
  {
    id v4 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __69__PKPaymentMarketsConfiguration_supportedTransitNetworksForLocation___block_invoke;
    v8[3] = &unk_1E56DCEF8;
    id v5 = v4;
    id v9 = v5;
    [v3 enumerateObjectsUsingBlock:v8];
  }
  else
  {
    id v5 = 0;
  }
  id v6 = (void *)[v5 copy];

  return v6;
}

void __69__PKPaymentMarketsConfiguration_supportedTransitNetworksForLocation___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = [a2 supportedTransitNetworks];
  [v2 unionSet:v3];
}

- (id)expressTransitNetworksForLocation:(id)a3
{
  id v3 = [(PKPaymentMarketsConfiguration *)self marketsForLocation:a3];
  if (v3)
  {
    id v4 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __67__PKPaymentMarketsConfiguration_expressTransitNetworksForLocation___block_invoke;
    v8[3] = &unk_1E56DCEF8;
    id v5 = v4;
    id v9 = v5;
    [v3 enumerateObjectsUsingBlock:v8];
  }
  else
  {
    id v5 = 0;
  }
  id v6 = (void *)[v5 copy];

  return v6;
}

void __67__PKPaymentMarketsConfiguration_expressTransitNetworksForLocation___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = [a2 expressTransitNetworks];
  [v2 unionSet:v3];
}

- (NSSet)markets
{
  return (NSSet *)objc_getProperty(self, a2, 8, 1);
}

- (NSString)version
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (NSURL)url
{
  return (NSURL *)objc_getProperty(self, a2, 24, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_version, 0);
  objc_storeStrong((id *)&self->_markets, 0);
}

@end