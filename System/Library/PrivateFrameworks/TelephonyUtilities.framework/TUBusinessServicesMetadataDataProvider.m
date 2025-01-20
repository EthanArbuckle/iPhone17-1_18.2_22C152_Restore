@interface TUBusinessServicesMetadataDataProvider
+ (TUBusinessServicesMetadataDataProvider)sharedInstance;
- (BOOL)isValidBusinessItem:(id)a3;
- (OS_dispatch_queue)queue;
- (TUBusinessServiceProviderProtocol)businessQueryService;
- (TUBusinessServicesMetadataDataProvider)init;
- (TUBusinessServicesMetadataDataProvider)initWithBusinessService:(id)a3;
- (id)metadataQueryHandler;
- (void)fetchBusinessServiceInformationForHandleValue:(id)a3 completion:(id)a4;
- (void)setMetadataQueryHandler:(id)a3;
@end

@implementation TUBusinessServicesMetadataDataProvider

+ (TUBusinessServicesMetadataDataProvider)sharedInstance
{
  v3 = objc_opt_new();
  int v4 = TUBusinessConnectCallingEnabled(v3);

  if (v4)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __56__TUBusinessServicesMetadataDataProvider_sharedInstance__block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0l;
    block[4] = a1;
    if (sharedInstance_onceToken_2 != -1) {
      dispatch_once(&sharedInstance_onceToken_2, block);
    }
    id v5 = (id)sharedInstance_sBusinessServicesDataProvider;
  }
  else
  {
    id v5 = 0;
  }

  return (TUBusinessServicesMetadataDataProvider *)v5;
}

uint64_t __56__TUBusinessServicesMetadataDataProvider_sharedInstance__block_invoke(uint64_t a1)
{
  sharedInstance_sBusinessServicesDataProvider = (uint64_t)objc_alloc_init(*(Class *)(a1 + 32));

  return MEMORY[0x1F41817F8]();
}

- (TUBusinessServicesMetadataDataProvider)init
{
  id v3 = (id)objc_opt_new();
  if (!TUBusinessConnectCallingEnabled(v3))
  {
    BCSBusinessQueryServiceClass = 0;
    goto LABEL_5;
  }
  BCSBusinessQueryServiceClass = (TUBusinessServicesMetadataDataProvider *)getBCSBusinessQueryServiceClass();

  if (BCSBusinessQueryServiceClass)
  {
    id v3 = objc_alloc_init((Class)getBCSBusinessQueryServiceClass());
    self = [(TUBusinessServicesMetadataDataProvider *)self initWithBusinessService:v3];
    BCSBusinessQueryServiceClass = self;
LABEL_5:
  }
  return BCSBusinessQueryServiceClass;
}

- (TUBusinessServicesMetadataDataProvider)initWithBusinessService:(id)a3
{
  id v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)TUBusinessServicesMetadataDataProvider;
  v6 = [(TUBusinessServicesMetadataDataProvider *)&v12 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_businessQueryService, a3);
    v8 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
    dispatch_queue_t v9 = dispatch_queue_create("com.apple.BusinessServicesDataProvider", v8);
    queue = v7->_queue;
    v7->_queue = (OS_dispatch_queue *)v9;
  }
  return v7;
}

- (void)fetchBusinessServiceInformationForHandleValue:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v15[0] = 0;
  v15[1] = v15;
  v15[2] = 0x3032000000;
  v15[3] = __Block_byref_object_copy__11;
  v15[4] = __Block_byref_object_dispose__11;
  id v16 = 0;
  v8 = [(TUBusinessServicesMetadataDataProvider *)self queue];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __99__TUBusinessServicesMetadataDataProvider_fetchBusinessServiceInformationForHandleValue_completion___block_invoke;
  v11[3] = &unk_1E58E7AF0;
  v11[4] = self;
  id v12 = v6;
  id v13 = v7;
  v14 = v15;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, v11);

  _Block_object_dispose(v15, 8);
}

void __99__TUBusinessServicesMetadataDataProvider_fetchBusinessServiceInformationForHandleValue_completion___block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) businessQueryService];
  char v3 = objc_opt_respondsToSelector();

  if (v3)
  {
    int v4 = TUDefaultLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v5 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138412290;
      uint64_t v17 = v5;
      _os_log_impl(&dword_19C496000, v4, OS_LOG_TYPE_DEFAULT, "Querying business service for destinationID: %@", buf, 0xCu);
    }

    id v6 = [*(id *)(a1 + 32) businessQueryService];
    id v7 = *(void **)(a1 + 40);
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __99__TUBusinessServicesMetadataDataProvider_fetchBusinessServiceInformationForHandleValue_completion___block_invoke_4;
    v12[3] = &unk_1E58E7AC8;
    id v8 = v7;
    uint64_t v9 = *(void *)(a1 + 32);
    id v13 = v8;
    uint64_t v14 = v9;
    long long v11 = *(_OWORD *)(a1 + 48);
    id v10 = (id)v11;
    long long v15 = v11;
    [v6 isBusinessCallerRegisteredForPhoneNumber:v8 completion:v12];
  }
}

void __99__TUBusinessServicesMetadataDataProvider_fetchBusinessServiceInformationForHandleValue_completion___block_invoke_4(uint64_t a1, int a2)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  int v4 = TUDefaultLog();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (a2)
  {
    if (v5)
    {
      uint64_t v6 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138412290;
      uint64_t v19 = v6;
      _os_log_impl(&dword_19C496000, v4, OS_LOG_TYPE_DEFAULT, "Got result indicating that destinationID: %@ is registered with business. Querying for more information about business", buf, 0xCu);
    }

    id v7 = [*(id *)(a1 + 40) businessQueryService];
    id v8 = *(void **)(a1 + 32);
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __99__TUBusinessServicesMetadataDataProvider_fetchBusinessServiceInformationForHandleValue_completion___block_invoke_5;
    v14[3] = &unk_1E58E7AA0;
    id v9 = v8;
    uint64_t v10 = *(void *)(a1 + 40);
    id v15 = v9;
    uint64_t v16 = v10;
    long long v13 = *(_OWORD *)(a1 + 48);
    id v11 = (id)v13;
    long long v17 = v13;
    [v7 fetchBusinessCallerMetadataWithPhoneNumber:v9 completion:v14];
  }
  else
  {
    if (v5)
    {
      uint64_t v12 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138412290;
      uint64_t v19 = v12;
      _os_log_impl(&dword_19C496000, v4, OS_LOG_TYPE_DEFAULT, "Got result indicating that destinationID: %@ is not registered with business", buf, 0xCu);
    }

    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

void __99__TUBusinessServicesMetadataDataProvider_fetchBusinessServiceInformationForHandleValue_completion___block_invoke_5(uint64_t a1, void *a2)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  int v4 = TUDefaultLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v16 = 138412546;
    id v17 = v3;
    __int16 v18 = 2112;
    uint64_t v19 = v5;
    _os_log_impl(&dword_19C496000, v4, OS_LOG_TYPE_DEFAULT, "Got businessItem: %@ for destinationID: %@", (uint8_t *)&v16, 0x16u);
  }

  if (v3 && [*(id *)(a1 + 40) isValidBusinessItem:v3])
  {
    uint64_t v6 = [TUBusinessCallerItem alloc];
    id v7 = [v3 name];
    id v8 = [v3 department];
    id v9 = [v3 logoURL];
    uint64_t v10 = [(TUBusinessCallerItem *)v6 initWithName:v7 department:v8 logoURL:v9];
    uint64_t v11 = *(void *)(*(void *)(a1 + 56) + 8);
    uint64_t v12 = *(void **)(v11 + 40);
    *(void *)(v11 + 40) = v10;

    long long v13 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
  }
  else
  {
    uint64_t v14 = TUDefaultLog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      id v15 = [v3 logoURL];
      int v16 = 138412290;
      id v17 = v15;
      _os_log_impl(&dword_19C496000, v14, OS_LOG_TYPE_DEFAULT, "Got nil or invalid businessItem with improper logoURL %@", (uint8_t *)&v16, 0xCu);
    }
    long long v13 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
  }
  v13();
}

- (BOOL)isValidBusinessItem:(id)a3
{
  id v3 = a3;
  int v4 = [v3 logoURL];
  if (v4)
  {
    uint64_t v5 = [v3 logoURL];
    char v6 = [v5 isFileURL];
  }
  else
  {
    char v6 = 1;
  }

  return v6;
}

- (TUBusinessServiceProviderProtocol)businessQueryService
{
  return self->_businessQueryService;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (id)metadataQueryHandler
{
  return self->_metadataQueryHandler;
}

- (void)setMetadataQueryHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_metadataQueryHandler, 0);
  objc_storeStrong((id *)&self->_queue, 0);

  objc_storeStrong((id *)&self->_businessQueryService, 0);
}

@end