@interface SHRemoteConfiguration
+ (id)sharedInstance;
- (AMSBag)amsBag;
- (AMSBagValue)cacheValuesBagValue;
- (AMSBagValue)campaignTokenBagValue;
- (AMSBagValue)defaultValuesBagValue;
- (AMSBagValue)endpointsBagValue;
- (AMSBagValue)externalHostBagValue;
- (AMSBagValue)featureFlagsBagValue;
- (AMSBagValue)internalHostBagValue;
- (AMSBagValue)languageTagBagValue;
- (AMSBagValue)recorderConfigurationBagValue;
- (AMSBagValue)shazamAMPConfigurationAPIEndpointsBagValue;
- (AMSBagValue)shazamOfferAPIHostsBagValue;
- (SHAMPConfigurationRequester)configurationRequester;
- (SHRemoteConfiguration)initWithBag:(id)a3;
- (id)recorderConfigurationWithPromise;
- (void)cacheValuesWithCompletion:(id)a3;
- (void)campaignTokenWithCompletion:(id)a3;
- (void)defaultValuesWithCompletion:(id)a3;
- (void)endpointsWithCompletion:(id)a3;
- (void)featureFlagsWithCompletion:(id)a3;
- (void)hostForClientType:(int64_t)a3 completion:(id)a4;
- (void)offerValuesWithCompletion:(id)a3;
- (void)populateRemoteConfiguration;
- (void)recorderConfigurationWithCompletion:(id)a3;
- (void)setAmsBag:(id)a3;
- (void)setCacheValuesBagValue:(id)a3;
- (void)setCampaignTokenBagValue:(id)a3;
- (void)setDefaultValuesBagValue:(id)a3;
- (void)setEndpointsBagValue:(id)a3;
- (void)setExternalHostBagValue:(id)a3;
- (void)setFeatureFlagsBagValue:(id)a3;
- (void)setInternalHostBagValue:(id)a3;
- (void)setLanguageTagBagValue:(id)a3;
- (void)setRecorderConfigurationBagValue:(id)a3;
- (void)setShazamAMPConfigurationAPIEndpointsBagValue:(id)a3;
- (void)setShazamOfferAPIHostsBagValue:(id)a3;
- (void)shazamAMPConfigurationAPIHostWithCompletion:(id)a3;
- (void)shazamOfferAPIURLPathWithCompletion:(id)a3;
- (void)streamingProviderValuesWithCompletion:(id)a3;
@end

@implementation SHRemoteConfiguration

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1) {
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global_2);
  }
  v2 = (void *)sharedInstance_configuration;
  return v2;
}

void __39__SHRemoteConfiguration_sharedInstance__block_invoke()
{
  [MEMORY[0x263F27C70] setSuppressEngagement:1];
  id v2 = [MEMORY[0x263F27B28] bagForProfile:@"Shazam" profileVersion:@"1"];
  v0 = [[SHRemoteConfiguration alloc] initWithBag:v2];
  v1 = (void *)sharedInstance_configuration;
  sharedInstance_configuration = (uint64_t)v0;
}

- (SHRemoteConfiguration)initWithBag:(id)a3
{
  id v5 = a3;
  v44.receiver = self;
  v44.super_class = (Class)SHRemoteConfiguration;
  v6 = [(SHRemoteConfiguration *)&v44 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_amsBag, a3);
    v8 = [(SHRemoteConfiguration *)v7 amsBag];
    uint64_t v9 = [v8 dictionaryForKey:@"shazam-endpoints"];
    endpointsBagValue = v7->_endpointsBagValue;
    v7->_endpointsBagValue = (AMSBagValue *)v9;

    v11 = [(SHRemoteConfiguration *)v7 amsBag];
    uint64_t v12 = [v11 stringForKey:@"shazam-media-api-host"];
    internalHostBagValue = v7->_internalHostBagValue;
    v7->_internalHostBagValue = (AMSBagValue *)v12;

    v14 = [(SHRemoteConfiguration *)v7 amsBag];
    uint64_t v15 = [v14 stringForKey:@"shazamkit-media-api-host"];
    externalHostBagValue = v7->_externalHostBagValue;
    v7->_externalHostBagValue = (AMSBagValue *)v15;

    v17 = [(SHRemoteConfiguration *)v7 amsBag];
    uint64_t v18 = [v17 dictionaryForKey:@"shazam-campaign-tokens"];
    campaignTokenBagValue = v7->_campaignTokenBagValue;
    v7->_campaignTokenBagValue = (AMSBagValue *)v18;

    v20 = [(SHRemoteConfiguration *)v7 amsBag];
    uint64_t v21 = [v20 dictionaryForKey:@"shazam-default-values"];
    defaultValuesBagValue = v7->_defaultValuesBagValue;
    v7->_defaultValuesBagValue = (AMSBagValue *)v21;

    v23 = [(SHRemoteConfiguration *)v7 amsBag];
    uint64_t v24 = [v23 stringForKey:@"language-tag"];
    languageTagBagValue = v7->_languageTagBagValue;
    v7->_languageTagBagValue = (AMSBagValue *)v24;

    v26 = [(SHRemoteConfiguration *)v7 amsBag];
    uint64_t v27 = [v26 dictionaryForKey:@"shazam-feature-flags"];
    featureFlagsBagValue = v7->_featureFlagsBagValue;
    v7->_featureFlagsBagValue = (AMSBagValue *)v27;

    v29 = [(SHRemoteConfiguration *)v7 amsBag];
    uint64_t v30 = [v29 stringForKey:@"shazam-amp-api-host"];
    shazamOfferAPIHostsBagValue = v7->_shazamOfferAPIHostsBagValue;
    v7->_shazamOfferAPIHostsBagValue = (AMSBagValue *)v30;

    v32 = [(SHRemoteConfiguration *)v7 amsBag];
    uint64_t v33 = [v32 dictionaryForKey:@"shazam-amp-api-endpoints"];
    shazamAMPConfigurationAPIEndpointsBagValue = v7->_shazamAMPConfigurationAPIEndpointsBagValue;
    v7->_shazamAMPConfigurationAPIEndpointsBagValue = (AMSBagValue *)v33;

    v35 = [(SHRemoteConfiguration *)v7 amsBag];
    uint64_t v36 = [v35 dictionaryForKey:@"shazam-cache-values"];
    cacheValuesBagValue = v7->_cacheValuesBagValue;
    v7->_cacheValuesBagValue = (AMSBagValue *)v36;

    v38 = [(SHRemoteConfiguration *)v7 amsBag];
    uint64_t v39 = [v38 dictionaryForKey:@"shazam-recorder-configuration"];
    recorderConfigurationBagValue = v7->_recorderConfigurationBagValue;
    v7->_recorderConfigurationBagValue = (AMSBagValue *)v39;

    v41 = objc_alloc_init(SHAMPConfigurationRequester);
    configurationRequester = v7->_configurationRequester;
    v7->_configurationRequester = v41;
  }
  return v7;
}

- (void)populateRemoteConfiguration
{
  v3 = shcore_log_object();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v14 = 0;
    _os_log_impl(&dword_226D94000, v3, OS_LOG_TYPE_DEBUG, "Populating remote configuration...", v14, 2u);
  }

  v4 = [(SHRemoteConfiguration *)self endpointsBagValue];
  [v4 valueWithCompletion:&__block_literal_global_46];

  id v5 = [(SHRemoteConfiguration *)self internalHostBagValue];
  [v5 valueWithCompletion:&__block_literal_global_48];

  v6 = [(SHRemoteConfiguration *)self externalHostBagValue];
  [v6 valueWithCompletion:&__block_literal_global_50];

  v7 = [(SHRemoteConfiguration *)self languageTagBagValue];
  [v7 valueWithCompletion:&__block_literal_global_52];

  v8 = [(SHRemoteConfiguration *)self campaignTokenBagValue];
  [v8 valueWithCompletion:&__block_literal_global_54];

  uint64_t v9 = [(SHRemoteConfiguration *)self defaultValuesBagValue];
  [v9 valueWithCompletion:&__block_literal_global_56];

  v10 = [(SHRemoteConfiguration *)self featureFlagsBagValue];
  [v10 valueWithCompletion:&__block_literal_global_58];

  v11 = [(SHRemoteConfiguration *)self shazamAMPConfigurationAPIEndpointsBagValue];
  [v11 valueWithCompletion:&__block_literal_global_60];

  uint64_t v12 = [(SHRemoteConfiguration *)self cacheValuesBagValue];
  [v12 valueWithCompletion:&__block_literal_global_62];

  v13 = [(SHRemoteConfiguration *)self recorderConfigurationBagValue];
  [v13 valueWithCompletion:&__block_literal_global_64];
}

- (void)shazamAMPConfigurationAPIHostWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(SHRemoteConfiguration *)self shazamOfferAPIHostsBagValue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __69__SHRemoteConfiguration_shazamAMPConfigurationAPIHostWithCompletion___block_invoke;
  v7[3] = &unk_2647E5968;
  id v8 = v4;
  id v6 = v4;
  [v5 valueWithCompletion:v7];
}

void __69__SHRemoteConfiguration_shazamAMPConfigurationAPIHostWithCompletion___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v8 = a2;
  if (v8)
  {
    id v6 = [[SHHost alloc] initWithName:v8];
    v7 = 0;
  }
  else
  {
    v7 = +[SHCoreError errorWithCode:401 underlyingError:a4];
    id v6 = 0;
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)shazamOfferAPIURLPathWithCompletion:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  id v5 = [(SHRemoteConfiguration *)self languageTagBagValue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __61__SHRemoteConfiguration_shazamOfferAPIURLPathWithCompletion___block_invoke;
  v7[3] = &unk_2647E59B8;
  objc_copyWeak(&v9, &location);
  id v6 = v4;
  id v8 = v6;
  [v5 valueWithCompletion:v7];

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __61__SHRemoteConfiguration_shazamOfferAPIURLPathWithCompletion___block_invoke(uint64_t a1, __CFString *a2)
{
  id v4 = @"en-US";
  if (a2) {
    id v4 = a2;
  }
  id v5 = v4;
  id v6 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v8 = [WeakRetained shazamAMPConfigurationAPIEndpointsBagValue];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __61__SHRemoteConfiguration_shazamOfferAPIURLPathWithCompletion___block_invoke_2;
  v10[3] = &unk_2647E5990;
  v11 = v5;
  id v12 = *(id *)(a1 + 32);
  id v9 = v5;
  [v8 valueWithCompletion:v10];
}

void __61__SHRemoteConfiguration_shazamOfferAPIURLPathWithCompletion___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v10 = a4;
  uint64_t v6 = *(void *)(a1 + 32);
  v7 = [a2 objectForKeyedSubscript:@"configuration"];
  id v8 = +[SHTokenizedURL replaceToken:2 withValue:v6 urlString:v7];

  if (v8)
  {
    id v9 = 0;
  }
  else
  {
    id v9 = +[SHCoreError errorWithCode:401 underlyingError:v10];
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)endpointsWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = shcore_log_object();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl(&dword_226D94000, v5, OS_LOG_TYPE_DEBUG, "Fetching endpoints...", (uint8_t *)buf, 2u);
  }

  objc_initWeak(buf, self);
  uint64_t v6 = [(SHRemoteConfiguration *)self languageTagBagValue];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __49__SHRemoteConfiguration_endpointsWithCompletion___block_invoke;
  v8[3] = &unk_2647E59B8;
  objc_copyWeak(&v10, buf);
  id v7 = v4;
  id v9 = v7;
  [v6 valueWithCompletion:v8];

  objc_destroyWeak(&v10);
  objc_destroyWeak(buf);
}

void __49__SHRemoteConfiguration_endpointsWithCompletion___block_invoke(uint64_t a1, __CFString *a2)
{
  id v4 = @"en-US";
  if (a2) {
    id v4 = a2;
  }
  id v5 = v4;
  uint64_t v6 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v8 = [WeakRetained endpointsBagValue];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __49__SHRemoteConfiguration_endpointsWithCompletion___block_invoke_2;
  v11[3] = &unk_2647E59E0;
  id v9 = *(id *)(a1 + 32);
  id v12 = v5;
  id v13 = v9;
  id v10 = v5;
  [v8 valueWithCompletion:v11];
}

void __49__SHRemoteConfiguration_endpointsWithCompletion___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v6 = a2;
  id v7 = a4;
  id v8 = shcore_log_object();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    int v11 = 138412546;
    id v12 = v6;
    __int16 v13 = 2112;
    id v14 = v7;
    _os_log_impl(&dword_226D94000, v8, OS_LOG_TYPE_DEBUG, "Endpoint fetch complete with value %@ error %@", (uint8_t *)&v11, 0x16u);
  }

  uint64_t v9 = *(void *)(a1 + 40);
  if (v6)
  {
    id v10 = [[SHEndpoints alloc] initWithConfiguration:v6 suggestedLanguage:*(void *)(a1 + 32)];
    (*(void (**)(uint64_t, SHEndpoints *, id))(v9 + 16))(v9, v10, v7);
  }
  else
  {
    (*(void (**)(void, void, id))(v9 + 16))(*(void *)(a1 + 40), 0, v7);
  }
}

- (void)hostForClientType:(int64_t)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = shcore_log_object();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_226D94000, v7, OS_LOG_TYPE_DEBUG, "Fetching hosts...", buf, 2u);
  }

  if (a3 == 2)
  {
    uint64_t v8 = [(SHRemoteConfiguration *)self externalHostBagValue];
  }
  else
  {
    if (a3 != 1)
    {
      uint64_t v9 = 0;
      goto LABEL_9;
    }
    uint64_t v8 = [(SHRemoteConfiguration *)self internalHostBagValue];
  }
  uint64_t v9 = (void *)v8;
LABEL_9:
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __54__SHRemoteConfiguration_hostForClientType_completion___block_invoke;
  v11[3] = &unk_2647E5968;
  id v12 = v6;
  id v10 = v6;
  [v9 valueWithCompletion:v11];
}

void __54__SHRemoteConfiguration_hostForClientType_completion___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v6 = a2;
  id v7 = a4;
  uint64_t v8 = shcore_log_object();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    int v11 = 138412546;
    id v12 = v6;
    __int16 v13 = 2112;
    id v14 = v7;
    _os_log_impl(&dword_226D94000, v8, OS_LOG_TYPE_DEBUG, "Host fetch complete with value %@ error %@", (uint8_t *)&v11, 0x16u);
  }

  uint64_t v9 = *(void *)(a1 + 32);
  if (v6)
  {
    id v10 = [[SHHost alloc] initWithName:v6];
    (*(void (**)(uint64_t, SHHost *, id))(v9 + 16))(v9, v10, v7);
  }
  else
  {
    (*(void (**)(uint64_t, void, id))(v9 + 16))(v9, 0, v7);
  }
}

- (void)campaignTokenWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = shcore_log_object();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_226D94000, v5, OS_LOG_TYPE_DEBUG, "Fetching campaign tokens...", buf, 2u);
  }

  id v6 = [(SHRemoteConfiguration *)self campaignTokenBagValue];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __53__SHRemoteConfiguration_campaignTokenWithCompletion___block_invoke;
  v8[3] = &unk_2647E5968;
  id v9 = v4;
  id v7 = v4;
  [v6 valueWithCompletion:v8];
}

void __53__SHRemoteConfiguration_campaignTokenWithCompletion___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v6 = a2;
  id v7 = a4;
  uint64_t v8 = shcore_log_object();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    int v11 = 138412546;
    id v12 = v6;
    __int16 v13 = 2112;
    id v14 = v7;
    _os_log_impl(&dword_226D94000, v8, OS_LOG_TYPE_DEBUG, "Campaign tokens fetch complete with value %@ error %@", (uint8_t *)&v11, 0x16u);
  }

  uint64_t v9 = *(void *)(a1 + 32);
  if (v6)
  {
    id v10 = [[SHCampaignTokens alloc] initWithConfiguration:v6];
    (*(void (**)(uint64_t, SHCampaignTokens *, id))(v9 + 16))(v9, v10, v7);
  }
  else
  {
    (*(void (**)(uint64_t, void, id))(v9 + 16))(v9, 0, v7);
  }
}

- (void)defaultValuesWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = shcore_log_object();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_226D94000, v5, OS_LOG_TYPE_DEBUG, "Fetching default values...", buf, 2u);
  }

  id v6 = [(SHRemoteConfiguration *)self defaultValuesBagValue];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __53__SHRemoteConfiguration_defaultValuesWithCompletion___block_invoke;
  v8[3] = &unk_2647E5968;
  id v9 = v4;
  id v7 = v4;
  [v6 valueWithCompletion:v8];
}

void __53__SHRemoteConfiguration_defaultValuesWithCompletion___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v6 = a2;
  id v7 = a4;
  uint64_t v8 = shcore_log_object();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    int v11 = 138412546;
    id v12 = v6;
    __int16 v13 = 2112;
    id v14 = v7;
    _os_log_impl(&dword_226D94000, v8, OS_LOG_TYPE_DEBUG, "Default values fetch complete with value %@ error %@", (uint8_t *)&v11, 0x16u);
  }

  uint64_t v9 = *(void *)(a1 + 32);
  if (v6)
  {
    id v10 = [[SHDefaultConfigurationValues alloc] initWithConfiguration:v6];
    (*(void (**)(uint64_t, SHDefaultConfigurationValues *, id))(v9 + 16))(v9, v10, v7);
  }
  else
  {
    (*(void (**)(uint64_t, void, id))(v9 + 16))(v9, 0, v7);
  }
}

- (void)featureFlagsWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = shcore_log_object();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_226D94000, v5, OS_LOG_TYPE_DEBUG, "Fetching feature flags...", buf, 2u);
  }

  id v6 = [(SHRemoteConfiguration *)self featureFlagsBagValue];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __52__SHRemoteConfiguration_featureFlagsWithCompletion___block_invoke;
  v8[3] = &unk_2647E5968;
  id v9 = v4;
  id v7 = v4;
  [v6 valueWithCompletion:v8];
}

void __52__SHRemoteConfiguration_featureFlagsWithCompletion___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v6 = a2;
  id v7 = a4;
  uint64_t v8 = shcore_log_object();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    int v11 = 138412546;
    id v12 = v6;
    __int16 v13 = 2112;
    id v14 = v7;
    _os_log_impl(&dword_226D94000, v8, OS_LOG_TYPE_DEBUG, "Feature flags fetch complete with value %@ error %@", (uint8_t *)&v11, 0x16u);
  }

  uint64_t v9 = *(void *)(a1 + 32);
  if (v6)
  {
    id v10 = [[SHFeatureFlags alloc] initWithConfiguration:v6];
    (*(void (**)(uint64_t, SHFeatureFlags *, id))(v9 + 16))(v9, v10, v7);
  }
  else
  {
    (*(void (**)(uint64_t, void, id))(v9 + 16))(v9, 0, v7);
  }
}

- (void)cacheValuesWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = shcore_log_object();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_226D94000, v5, OS_LOG_TYPE_DEBUG, "Fetching cache values...", buf, 2u);
  }

  id v6 = [(SHRemoteConfiguration *)self cacheValuesBagValue];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __51__SHRemoteConfiguration_cacheValuesWithCompletion___block_invoke;
  v8[3] = &unk_2647E5968;
  id v9 = v4;
  id v7 = v4;
  [v6 valueWithCompletion:v8];
}

void __51__SHRemoteConfiguration_cacheValuesWithCompletion___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v6 = a2;
  id v7 = a4;
  uint64_t v8 = shcore_log_object();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    int v11 = 138412546;
    id v12 = v6;
    __int16 v13 = 2112;
    id v14 = v7;
    _os_log_impl(&dword_226D94000, v8, OS_LOG_TYPE_DEBUG, "Cache values fetch complete with value %@ error %@", (uint8_t *)&v11, 0x16u);
  }

  uint64_t v9 = *(void *)(a1 + 32);
  if (v6)
  {
    id v10 = [[SHCacheValues alloc] initWithValues:v6];
    (*(void (**)(uint64_t, SHCacheValues *, id))(v9 + 16))(v9, v10, v7);
  }
  else
  {
    (*(void (**)(uint64_t, void, id))(v9 + 16))(v9, 0, v7);
  }
}

- (void)offerValuesWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(SHRemoteConfiguration *)self configurationRequester];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __51__SHRemoteConfiguration_offerValuesWithCompletion___block_invoke;
  v7[3] = &unk_2647E5A08;
  id v8 = v4;
  id v6 = v4;
  [v5 offersWithCompletion:v7];
}

void __51__SHRemoteConfiguration_offerValuesWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id v7 = shcore_log_object();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    int v8 = 138412546;
    id v9 = v5;
    __int16 v10 = 2112;
    id v11 = v6;
    _os_log_impl(&dword_226D94000, v7, OS_LOG_TYPE_DEBUG, "Shazam campaign offers fetch complete with value %@ error %@", (uint8_t *)&v8, 0x16u);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)streamingProviderValuesWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(SHRemoteConfiguration *)self configurationRequester];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __63__SHRemoteConfiguration_streamingProviderValuesWithCompletion___block_invoke;
  v7[3] = &unk_2647E5A30;
  id v8 = v4;
  id v6 = v4;
  [v5 streamingProvidersWithCompletion:v7];
}

void __63__SHRemoteConfiguration_streamingProviderValuesWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id v7 = shcore_log_object();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    int v8 = 138412546;
    id v9 = v5;
    __int16 v10 = 2112;
    id v11 = v6;
    _os_log_impl(&dword_226D94000, v7, OS_LOG_TYPE_DEBUG, "Third party streaming providers fetch complete with value %@ error %@", (uint8_t *)&v8, 0x16u);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)recorderConfigurationWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = shcore_log_object();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_226D94000, v5, OS_LOG_TYPE_DEBUG, "Fetching recorder configuration values...", buf, 2u);
  }

  id v6 = [(SHRemoteConfiguration *)self recorderConfigurationBagValue];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __61__SHRemoteConfiguration_recorderConfigurationWithCompletion___block_invoke;
  v8[3] = &unk_2647E5968;
  id v9 = v4;
  id v7 = v4;
  [v6 valueWithCompletion:v8];
}

void __61__SHRemoteConfiguration_recorderConfigurationWithCompletion___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v6 = a2;
  id v7 = a4;
  int v8 = shcore_log_object();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    int v11 = 138412546;
    id v12 = v6;
    __int16 v13 = 2112;
    id v14 = v7;
    _os_log_impl(&dword_226D94000, v8, OS_LOG_TYPE_DEBUG, "Recorder configuration with value %@ error %@", (uint8_t *)&v11, 0x16u);
  }

  uint64_t v9 = *(void *)(a1 + 32);
  if (v6)
  {
    __int16 v10 = [[SHRecorderConfiguration alloc] initWithValues:v6];
    (*(void (**)(uint64_t, SHRecorderConfiguration *, id))(v9 + 16))(v9, v10, v7);
  }
  else
  {
    (*(void (**)(uint64_t, void, id))(v9 + 16))(v9, 0, v7);
  }
}

- (id)recorderConfigurationWithPromise
{
  id v2 = [(SHRemoteConfiguration *)self recorderConfigurationBagValue];
  v3 = [v2 valuePromise];

  id v4 = [[SHRecorderConfiguration alloc] initWithPromise:v3];
  return v4;
}

- (AMSBag)amsBag
{
  return self->_amsBag;
}

- (void)setAmsBag:(id)a3
{
}

- (AMSBagValue)endpointsBagValue
{
  return self->_endpointsBagValue;
}

- (void)setEndpointsBagValue:(id)a3
{
}

- (AMSBagValue)internalHostBagValue
{
  return self->_internalHostBagValue;
}

- (void)setInternalHostBagValue:(id)a3
{
}

- (AMSBagValue)externalHostBagValue
{
  return self->_externalHostBagValue;
}

- (void)setExternalHostBagValue:(id)a3
{
}

- (AMSBagValue)campaignTokenBagValue
{
  return self->_campaignTokenBagValue;
}

- (void)setCampaignTokenBagValue:(id)a3
{
}

- (AMSBagValue)defaultValuesBagValue
{
  return self->_defaultValuesBagValue;
}

- (void)setDefaultValuesBagValue:(id)a3
{
}

- (AMSBagValue)languageTagBagValue
{
  return self->_languageTagBagValue;
}

- (void)setLanguageTagBagValue:(id)a3
{
}

- (AMSBagValue)featureFlagsBagValue
{
  return self->_featureFlagsBagValue;
}

- (void)setFeatureFlagsBagValue:(id)a3
{
}

- (AMSBagValue)shazamOfferAPIHostsBagValue
{
  return self->_shazamOfferAPIHostsBagValue;
}

- (void)setShazamOfferAPIHostsBagValue:(id)a3
{
}

- (AMSBagValue)shazamAMPConfigurationAPIEndpointsBagValue
{
  return self->_shazamAMPConfigurationAPIEndpointsBagValue;
}

- (void)setShazamAMPConfigurationAPIEndpointsBagValue:(id)a3
{
}

- (AMSBagValue)cacheValuesBagValue
{
  return self->_cacheValuesBagValue;
}

- (void)setCacheValuesBagValue:(id)a3
{
}

- (AMSBagValue)recorderConfigurationBagValue
{
  return self->_recorderConfigurationBagValue;
}

- (void)setRecorderConfigurationBagValue:(id)a3
{
}

- (SHAMPConfigurationRequester)configurationRequester
{
  return self->_configurationRequester;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configurationRequester, 0);
  objc_storeStrong((id *)&self->_recorderConfigurationBagValue, 0);
  objc_storeStrong((id *)&self->_cacheValuesBagValue, 0);
  objc_storeStrong((id *)&self->_shazamAMPConfigurationAPIEndpointsBagValue, 0);
  objc_storeStrong((id *)&self->_shazamOfferAPIHostsBagValue, 0);
  objc_storeStrong((id *)&self->_featureFlagsBagValue, 0);
  objc_storeStrong((id *)&self->_languageTagBagValue, 0);
  objc_storeStrong((id *)&self->_defaultValuesBagValue, 0);
  objc_storeStrong((id *)&self->_campaignTokenBagValue, 0);
  objc_storeStrong((id *)&self->_externalHostBagValue, 0);
  objc_storeStrong((id *)&self->_internalHostBagValue, 0);
  objc_storeStrong((id *)&self->_endpointsBagValue, 0);
  objc_storeStrong((id *)&self->_amsBag, 0);
}

@end