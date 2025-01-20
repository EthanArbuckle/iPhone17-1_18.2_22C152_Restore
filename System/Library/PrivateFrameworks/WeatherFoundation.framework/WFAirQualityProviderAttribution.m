@interface WFAirQualityProviderAttribution
+ (BOOL)supportsSecureCoding;
+ (WFAirQualityProviderAttribution)defaultProviderAttribution;
- (BOOL)logoRequestInFlight;
- (BOOL)p_checkRequestInFlight;
- (NSMutableArray)outstandingRequestsCompletionBlocks;
- (NSString)name;
- (NSURL)logoURL;
- (OS_dispatch_queue)logoImageLoadingQueue;
- (UIImage)cachedLogoImage;
- (WFAirQualityProviderAttribution)initWithCoder:(id)a3;
- (WFAirQualityProviderAttribution)initWithName:(id)a3 logoImage:(id)a4 dataOrigination:(int64_t)a5 station:(id)a6;
- (WFAirQualityProviderAttribution)initWithName:(id)a3 logoURL:(id)a4 dataOrigination:(int64_t)a5;
- (WFAirQualityProviderAttribution)initWithName:(id)a3 logoURL:(id)a4 dataOrigination:(int64_t)a5 station:(id)a6;
- (WFAirQualityProviderStation)station;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)p_imageWithData:(id)a3;
- (int64_t)dataOrigination;
- (os_unfair_lock_s)dataSynchronizationLock;
- (void)_initInternal;
- (void)encodeWithCoder:(id)a3;
- (void)loadLogoImageWithCompletion:(id)a3;
- (void)p_clearRequestInFlight;
- (void)p_invokeAndClearCompletionBlocksWithImage:(id)a3 error:(id)a4;
- (void)p_loadRemoteLogoImageForProvider:(id)a3 completion:(id)a4;
- (void)p_queueCompletionBlock:(id)a3;
- (void)p_setRequestInFlight;
- (void)setCachedLogoImage:(id)a3;
- (void)setDataOrigination:(int64_t)a3;
- (void)setDataSynchronizationLock:(os_unfair_lock_s)a3;
- (void)setLogoImageLoadingQueue:(id)a3;
- (void)setLogoRequestInFlight:(BOOL)a3;
- (void)setLogoURL:(id)a3;
- (void)setName:(id)a3;
- (void)setOutstandingRequestsCompletionBlocks:(id)a3;
- (void)setStation:(id)a3;
@end

@implementation WFAirQualityProviderAttribution

+ (WFAirQualityProviderAttribution)defaultProviderAttribution
{
  v2 = +[WFAttribution sharedAttribution];
  v3 = [v2 sourceAttributionImageForStyle:2];

  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __61__WFAirQualityProviderAttribution_defaultProviderAttribution__block_invoke;
  v8[3] = &unk_264431680;
  v9 = @"The Weather Channel";
  id v10 = v3;
  uint64_t v4 = defaultProviderAttribution_onceToken;
  id v5 = v3;
  if (v4 != -1) {
    dispatch_once(&defaultProviderAttribution_onceToken, v8);
  }
  v6 = (WFAirQualityProviderAttribution *)(id)defaultProviderAttribution_attribution;

  return v6;
}

uint64_t __61__WFAirQualityProviderAttribution_defaultProviderAttribution__block_invoke(uint64_t a1)
{
  v1 = [[WFAirQualityProviderAttribution alloc] initWithName:*(void *)(a1 + 32) logoImage:*(void *)(a1 + 40) dataOrigination:0 station:0];
  uint64_t v2 = defaultProviderAttribution_attribution;
  defaultProviderAttribution_attribution = (uint64_t)v1;
  return MEMORY[0x270F9A758](v1, v2);
}

- (WFAirQualityProviderAttribution)initWithName:(id)a3 logoImage:(id)a4 dataOrigination:(int64_t)a5 station:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a6;
  v17.receiver = self;
  v17.super_class = (Class)WFAirQualityProviderAttribution;
  v14 = [(WFAirQualityProviderAttribution *)&v17 init];
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_name, a3);
    objc_storeStrong((id *)&v15->_cachedLogoImage, a4);
    v15->_dataOrigination = a5;
    objc_storeStrong((id *)&v15->_station, a6);
    [(WFAirQualityProviderAttribution *)v15 _initInternal];
  }

  return v15;
}

- (WFAirQualityProviderAttribution)initWithName:(id)a3 logoURL:(id)a4 dataOrigination:(int64_t)a5
{
  return [(WFAirQualityProviderAttribution *)self initWithName:a3 logoURL:a4 dataOrigination:a5 station:0];
}

- (WFAirQualityProviderAttribution)initWithName:(id)a3 logoURL:(id)a4 dataOrigination:(int64_t)a5 station:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a6;
  v17.receiver = self;
  v17.super_class = (Class)WFAirQualityProviderAttribution;
  v14 = [(WFAirQualityProviderAttribution *)&v17 init];
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_name, a3);
    objc_storeStrong((id *)&v15->_logoURL, a4);
    v15->_dataOrigination = a5;
    objc_storeStrong((id *)&v15->_station, a6);
    [(WFAirQualityProviderAttribution *)v15 _initInternal];
  }

  return v15;
}

- (void)_initInternal
{
  v3 = [MEMORY[0x263EFF980] array];
  outstandingRequestsCompletionBlocks = self->_outstandingRequestsCompletionBlocks;
  self->_outstandingRequestsCompletionBlocks = v3;

  self->_logoRequestInFlight = 0;
  id v5 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v6 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.weatherfoundation.airquality.attribution.logo.image.loading", v5);
  logoImageLoadingQueue = self->_logoImageLoadingQueue;
  self->_logoImageLoadingQueue = v6;

  self->_dataSynchronizationLock._os_unfair_lock_opaque = 0;
}

- (void)loadLogoImageWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(WFAirQualityProviderAttribution *)self logoImageLoadingQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __63__WFAirQualityProviderAttribution_loadLogoImageWithCompletion___block_invoke;
  v7[3] = &unk_2644322E8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __63__WFAirQualityProviderAttribution_loadLogoImageWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) cachedLogoImage];

  if (v2)
  {
    uint64_t v3 = *(void *)(a1 + 40);
    id v5 = [*(id *)(a1 + 32) cachedLogoImage];
    (*(void (**)(uint64_t))(v3 + 16))(v3);
  }
  else
  {
    id v4 = *(void **)(a1 + 32);
    id v5 = [v4 name];
    objc_msgSend(v4, "p_loadRemoteLogoImageForProvider:completion:");
  }
}

- (void)p_loadRemoteLogoImageForProvider:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(WFAirQualityProviderAttribution *)self logoImageLoadingQueue];
  dispatch_assert_queue_V2(v8);

  v9 = [(WFAirQualityProviderAttribution *)self logoURL];
  if (v9)
  {
    if ([(WFAirQualityProviderAttribution *)self p_checkRequestInFlight])
    {
      [(WFAirQualityProviderAttribution *)self p_queueCompletionBlock:v7];
    }
    else
    {
      [(WFAirQualityProviderAttribution *)self p_setRequestInFlight];
      [(WFAirQualityProviderAttribution *)self p_queueCompletionBlock:v7];
      objc_initWeak(&location, self);
      id v11 = [MEMORY[0x263F08BF8] sharedSession];
      id v12 = [(WFAirQualityProviderAttribution *)self logoURL];
      v14[0] = MEMORY[0x263EF8330];
      v14[1] = 3221225472;
      v14[2] = __79__WFAirQualityProviderAttribution_p_loadRemoteLogoImageForProvider_completion___block_invoke;
      v14[3] = &unk_264432310;
      objc_copyWeak(&v15, &location);
      v14[4] = self;
      id v13 = [v11 dataTaskWithURL:v12 completionHandler:v14];

      [v13 resume];
      objc_destroyWeak(&v15);
      objc_destroyWeak(&location);
    }
  }
  else
  {
    id v10 = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.weather.foundation.airQuality.provider.attribution.errorDomain" code:7001 userInfo:0];
    [(WFAirQualityProviderAttribution *)self p_invokeAndClearCompletionBlocksWithImage:0 error:v10];
  }
}

void __79__WFAirQualityProviderAttribution_p_loadRemoteLogoImageForProvider_completion___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6 = a2;
  id v7 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __79__WFAirQualityProviderAttribution_p_loadRemoteLogoImageForProvider_completion___block_invoke_2;
  v11[3] = &unk_264432108;
  id v12 = v6;
  id v13 = v7;
  uint64_t v14 = *(void *)(a1 + 32);
  id v15 = WeakRetained;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(MEMORY[0x263EF83A0], v11);
}

uint64_t __79__WFAirQualityProviderAttribution_p_loadRemoteLogoImageForProvider_completion___block_invoke_2(uint64_t a1)
{
  if (*(void *)(a1 + 32) && !*(void *)(a1 + 40))
  {
    uint64_t v2 = objc_msgSend(*(id *)(a1 + 48), "p_imageWithData:");
    [*(id *)(a1 + 56) setCachedLogoImage:v2];
    uint64_t v3 = *(void **)(a1 + 56);
    id v4 = v2;
    id v5 = 0;
  }
  else
  {
    uint64_t v2 = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.weather.foundation.airQuality.provider.attribution.errorDomain" code:7000 userInfo:0];
    uint64_t v3 = *(void **)(a1 + 56);
    id v4 = 0;
    id v5 = v2;
  }
  objc_msgSend(v3, "p_invokeAndClearCompletionBlocksWithImage:error:", v4, v5);

  id v6 = *(void **)(a1 + 56);
  return objc_msgSend(v6, "p_clearRequestInFlight");
}

- (id)p_imageWithData:(id)a3
{
  id v3 = a3;
  uint64_t v9 = 0;
  id v10 = &v9;
  uint64_t v11 = 0x2050000000;
  id v4 = (void *)getUIImageClass_softClass;
  uint64_t v12 = getUIImageClass_softClass;
  if (!getUIImageClass_softClass)
  {
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __getUIImageClass_block_invoke;
    v8[3] = &unk_2644316A8;
    void v8[4] = &v9;
    __getUIImageClass_block_invoke((uint64_t)v8);
    id v4 = (void *)v10[3];
  }
  id v5 = v4;
  _Block_object_dispose(&v9, 8);
  id v6 = [v5 imageWithData:v3];

  return v6;
}

- (BOOL)p_checkRequestInFlight
{
  uint64_t v2 = self;
  p_dataSynchronizationLock = &self->_dataSynchronizationLock;
  os_unfair_lock_lock_with_options();
  LOBYTE(v2) = [(WFAirQualityProviderAttribution *)v2 logoRequestInFlight];
  os_unfair_lock_unlock(p_dataSynchronizationLock);
  return (char)v2;
}

- (void)p_setRequestInFlight
{
  p_dataSynchronizationLock = &self->_dataSynchronizationLock;
  os_unfair_lock_lock_with_options();
  [(WFAirQualityProviderAttribution *)self setLogoRequestInFlight:1];
  os_unfair_lock_unlock(p_dataSynchronizationLock);
}

- (void)p_clearRequestInFlight
{
  p_dataSynchronizationLock = &self->_dataSynchronizationLock;
  os_unfair_lock_lock_with_options();
  [(WFAirQualityProviderAttribution *)self setLogoRequestInFlight:0];
  os_unfair_lock_unlock(p_dataSynchronizationLock);
}

- (void)p_queueCompletionBlock:(id)a3
{
  id v4 = a3;
  id v7 = objc_alloc_init(WFAirQualityProviderCompletionWrapper);
  [(WFAirQualityProviderCompletionWrapper *)v7 setCompletion:v4];

  p_dataSynchronizationLock = &self->_dataSynchronizationLock;
  os_unfair_lock_lock_with_options();
  id v6 = [(WFAirQualityProviderAttribution *)self outstandingRequestsCompletionBlocks];
  [v6 addObject:v7];

  os_unfair_lock_unlock(p_dataSynchronizationLock);
}

- (void)p_invokeAndClearCompletionBlocksWithImage:(id)a3 error:(id)a4
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  p_dataSynchronizationLock = &self->_dataSynchronizationLock;
  os_unfair_lock_lock_with_options();
  uint64_t v9 = [(WFAirQualityProviderAttribution *)self outstandingRequestsCompletionBlocks];
  id v10 = (void *)[v9 copy];

  uint64_t v11 = [(WFAirQualityProviderAttribution *)self outstandingRequestsCompletionBlocks];
  [v11 removeAllObjects];

  os_unfair_lock_unlock(p_dataSynchronizationLock);
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v12 = v10;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v19;
    do
    {
      uint64_t v16 = 0;
      do
      {
        if (*(void *)v19 != v15) {
          objc_enumerationMutation(v12);
        }
        objc_msgSend(*(id *)(*((void *)&v18 + 1) + 8 * v16), "completion", (void)v18);
        objc_super v17 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue();
        ((void (**)(void, id, id))v17)[2](v17, v6, v7);

        ++v16;
      }
      while (v14 != v16);
      uint64_t v14 = [v12 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v14);
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init(WFAirQualityProviderAttribution);
  id v5 = [(WFAirQualityProviderAttribution *)self name];
  [(WFAirQualityProviderAttribution *)v4 setName:v5];

  id v6 = [(WFAirQualityProviderAttribution *)self logoURL];
  [(WFAirQualityProviderAttribution *)v4 setLogoURL:v6];

  [(WFAirQualityProviderAttribution *)v4 setDataOrigination:[(WFAirQualityProviderAttribution *)self dataOrigination]];
  id v7 = [(WFAirQualityProviderAttribution *)self cachedLogoImage];
  [(WFAirQualityProviderAttribution *)v4 setCachedLogoImage:v7];

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v6 = a3;
  id v4 = [(WFAirQualityProviderAttribution *)self name];
  [v6 encodeObject:v4 forKey:@"WFAirQualityProviderNameKey"];

  id v5 = [(WFAirQualityProviderAttribution *)self logoURL];
  [v6 encodeObject:v5 forKey:@"WFAirQualityProviderLogoURLKey"];

  objc_msgSend(v6, "encodeInteger:forKey:", -[WFAirQualityProviderAttribution dataOrigination](self, "dataOrigination"), @"WFAirQualityProviderDataOriginationKey");
}

- (WFAirQualityProviderAttribution)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)WFAirQualityProviderAttribution;
  id v5 = [(WFAirQualityProviderAttribution *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"WFAirQualityProviderNameKey"];
    name = v5->_name;
    v5->_name = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"WFAirQualityProviderLogoURLKey"];
    logoURL = v5->_logoURL;
    v5->_logoURL = (NSURL *)v8;

    v5->_dataOrigination = [v4 decodeIntegerForKey:@"WFAirQualityProviderDataOriginationKey"];
    [(WFAirQualityProviderAttribution *)v5 _initInternal];
  }

  return v5;
}

- (id)description
{
  id v3 = NSString;
  id v4 = [(WFAirQualityProviderAttribution *)self name];
  int64_t v5 = [(WFAirQualityProviderAttribution *)self dataOrigination];
  uint64_t v6 = [(WFAirQualityProviderAttribution *)self station];
  id v7 = [v3 stringWithFormat:@"<WFAirQualityProviderAttribution name: %@, dataOrigination: %ld, station: %@>", v4, v5, v6];

  return v7;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (int64_t)dataOrigination
{
  return self->_dataOrigination;
}

- (void)setDataOrigination:(int64_t)a3
{
  self->_dataOrigination = a3;
}

- (UIImage)cachedLogoImage
{
  return self->_cachedLogoImage;
}

- (void)setCachedLogoImage:(id)a3
{
}

- (WFAirQualityProviderStation)station
{
  return self->_station;
}

- (void)setStation:(id)a3
{
}

- (OS_dispatch_queue)logoImageLoadingQueue
{
  return self->_logoImageLoadingQueue;
}

- (void)setLogoImageLoadingQueue:(id)a3
{
}

- (NSMutableArray)outstandingRequestsCompletionBlocks
{
  return self->_outstandingRequestsCompletionBlocks;
}

- (void)setOutstandingRequestsCompletionBlocks:(id)a3
{
}

- (BOOL)logoRequestInFlight
{
  return self->_logoRequestInFlight;
}

- (void)setLogoRequestInFlight:(BOOL)a3
{
  self->_logoRequestInFlight = a3;
}

- (os_unfair_lock_s)dataSynchronizationLock
{
  return self->_dataSynchronizationLock;
}

- (void)setDataSynchronizationLock:(os_unfair_lock_s)a3
{
  self->_dataSynchronizationLock = a3;
}

- (NSURL)logoURL
{
  return self->_logoURL;
}

- (void)setLogoURL:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_logoURL, 0);
  objc_storeStrong((id *)&self->_outstandingRequestsCompletionBlocks, 0);
  objc_storeStrong((id *)&self->_logoImageLoadingQueue, 0);
  objc_storeStrong((id *)&self->_station, 0);
  objc_storeStrong((id *)&self->_cachedLogoImage, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end