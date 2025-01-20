@interface TPSDiscoverabilitySignal
+ (id)osBuild;
- (NSString)bundleIdentifier;
- (NSString)context;
- (NSString)identifier;
- (TPSDiscoverabilitySignal)initWithIdentifier:(id)a3;
- (TPSDiscoverabilitySignal)initWithIdentifier:(id)a3 bundleIdentifier:(id)a4 context:(id)a5;
- (id)_discoverabilitySignalsStream;
- (id)_knowledgeStore;
- (void)donateSignalWithCompletion:(id)a3;
- (void)setBundleIdentifier:(id)a3;
- (void)setContext:(id)a3;
- (void)setIdentifier:(id)a3;
@end

@implementation TPSDiscoverabilitySignal

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

- (void)setContext:(id)a3
{
}

- (NSString)context
{
  return self->_context;
}

- (void)setBundleIdentifier:(id)a3
{
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (void)setIdentifier:(id)a3
{
}

- (NSString)identifier
{
  return self->_identifier;
}

- (id)_discoverabilitySignalsStream
{
  uint64_t v14 = 0;
  v15 = &v14;
  uint64_t v16 = 0x2050000000;
  v2 = (void *)get_DKEventStreamClass_softClass;
  uint64_t v17 = get_DKEventStreamClass_softClass;
  if (!get_DKEventStreamClass_softClass)
  {
    uint64_t v9 = MEMORY[0x1E4F143A8];
    uint64_t v10 = 3221225472;
    v11 = __get_DKEventStreamClass_block_invoke;
    v12 = &unk_1E6E2E248;
    v13 = &v14;
    __get_DKEventStreamClass_block_invoke((uint64_t)&v9);
    v2 = (void *)v15[3];
  }
  id v3 = v2;
  _Block_object_dispose(&v14, 8);
  uint64_t v14 = 0;
  v15 = &v14;
  uint64_t v16 = 0x2050000000;
  v4 = (void *)get_DKAnyStringIdentifierClass_softClass;
  uint64_t v17 = get_DKAnyStringIdentifierClass_softClass;
  if (!get_DKAnyStringIdentifierClass_softClass)
  {
    uint64_t v9 = MEMORY[0x1E4F143A8];
    uint64_t v10 = 3221225472;
    v11 = __get_DKAnyStringIdentifierClass_block_invoke;
    v12 = &unk_1E6E2E248;
    v13 = &v14;
    __get_DKAnyStringIdentifierClass_block_invoke((uint64_t)&v9);
    v4 = (void *)v15[3];
  }
  id v5 = v4;
  _Block_object_dispose(&v14, 8);
  v6 = [v5 type];
  v7 = [v3 eventStreamWithName:@"/discoverability/signals" valueType:v6];

  return v7;
}

- (id)_knowledgeStore
{
  if (_knowledgeStore_onceToken != -1) {
    dispatch_once(&_knowledgeStore_onceToken, &__block_literal_global_9059);
  }
  v2 = (void *)_knowledgeStore_store;

  return v2;
}

void __43__TPSDiscoverabilitySignal__knowledgeStore__block_invoke()
{
  uint64_t v5 = 0;
  v6 = &v5;
  uint64_t v7 = 0x2050000000;
  v0 = (void *)get_DKKnowledgeStoreClass_softClass;
  uint64_t v8 = get_DKKnowledgeStoreClass_softClass;
  if (!get_DKKnowledgeStoreClass_softClass)
  {
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __get_DKKnowledgeStoreClass_block_invoke;
    v4[3] = &unk_1E6E2E248;
    v4[4] = &v5;
    __get_DKKnowledgeStoreClass_block_invoke((uint64_t)v4);
    v0 = (void *)v6[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v5, 8);
  uint64_t v2 = [v1 knowledgeStore];
  id v3 = (void *)_knowledgeStore_store;
  _knowledgeStore_store = v2;
}

- (void)donateSignalWithCompletion:(id)a3
{
  v42[1] = *MEMORY[0x1E4F143B8];
  id v27 = a3;
  v26 = [MEMORY[0x1E4F1C9C8] date];
  v4 = [(TPSDiscoverabilitySignal *)self identifier];
  uint64_t v5 = [(TPSDiscoverabilitySignal *)self bundleIdentifier];
  v6 = v5;
  if (v5)
  {
    id v7 = v5;
  }
  else
  {
    uint64_t v8 = [MEMORY[0x1E4F28B50] mainBundle];
    id v7 = [v8 bundleIdentifier];
  }
  uint64_t v9 = [(TPSDiscoverabilitySignal *)self context];
  uint64_t v38 = 0;
  v39 = &v38;
  uint64_t v40 = 0x2050000000;
  uint64_t v10 = (void *)get_DKSourceClass_softClass;
  uint64_t v41 = get_DKSourceClass_softClass;
  if (!get_DKSourceClass_softClass)
  {
    uint64_t v33 = MEMORY[0x1E4F143A8];
    uint64_t v34 = 3221225472;
    v35 = __get_DKSourceClass_block_invoke;
    v36 = &unk_1E6E2E248;
    v37 = &v38;
    __get_DKSourceClass_block_invoke((uint64_t)&v33);
    uint64_t v10 = (void *)v39[3];
  }
  v11 = v10;
  _Block_object_dispose(&v38, 8);
  v12 = (void *)[[v11 alloc] initWithIdentifier:0 bundleIdentifier:v7 itemIdentifier:0 groupIdentifier:0 deviceIdentifier:0 userIdentifier:0];
  v13 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:2];
  uint64_t v14 = [(id)objc_opt_class() osBuild];
  [v13 setObject:v14 forKeyedSubscript:@"_DKDiscoverabilitySignalsMetadataKey-osBuild"];

  [v13 setObject:v9 forKeyedSubscript:@"_DKDiscoverabilitySignalsMetadataKey-context"];
  uint64_t v38 = 0;
  v39 = &v38;
  uint64_t v40 = 0x2050000000;
  v15 = (void *)get_DKEventClass_softClass;
  uint64_t v41 = get_DKEventClass_softClass;
  if (!get_DKEventClass_softClass)
  {
    uint64_t v33 = MEMORY[0x1E4F143A8];
    uint64_t v34 = 3221225472;
    v35 = __get_DKEventClass_block_invoke;
    v36 = &unk_1E6E2E248;
    v37 = &v38;
    __get_DKEventClass_block_invoke((uint64_t)&v33);
    v15 = (void *)v39[3];
  }
  id v16 = v15;
  _Block_object_dispose(&v38, 8);
  uint64_t v17 = [(TPSDiscoverabilitySignal *)self _discoverabilitySignalsStream];
  v18 = (void *)[v13 copy];
  v19 = [v16 eventWithStream:v17 source:v12 startDate:v26 endDate:v26 identifierStringValue:v4 metadata:v18];

  v20 = [(TPSDiscoverabilitySignal *)self _knowledgeStore];
  v42[0] = v19;
  v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:v42 count:1];
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __55__TPSDiscoverabilitySignal_donateSignalWithCompletion___block_invoke;
  v28[3] = &unk_1E6E2B468;
  id v29 = v4;
  id v30 = v7;
  id v31 = v9;
  id v32 = v27;
  id v22 = v27;
  id v23 = v9;
  id v24 = v7;
  id v25 = v4;
  [v20 saveObjects:v21 responseQueue:0 withCompletion:v28];
}

void __55__TPSDiscoverabilitySignal_donateSignalWithCompletion___block_invoke(void *a1, int a2, void *a3)
{
  id v5 = a3;
  if (a2)
  {
    v6 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:3];
    [v6 setObject:a1[4] forKeyedSubscript:@"signalIdentifier"];
    [v6 setObject:a1[5] forKeyedSubscript:@"sourceBundleIdentifier"];
    [v6 setObject:a1[6] forKeyedSubscript:@"context"];
    uint64_t v20 = 0;
    v21 = &v20;
    uint64_t v22 = 0x2050000000;
    id v7 = (void *)get_CDContextualKeyPathClass_softClass;
    uint64_t v23 = get_CDContextualKeyPathClass_softClass;
    if (!get_CDContextualKeyPathClass_softClass)
    {
      uint64_t v15 = MEMORY[0x1E4F143A8];
      uint64_t v16 = 3221225472;
      uint64_t v17 = __get_CDContextualKeyPathClass_block_invoke;
      v18 = &unk_1E6E2E248;
      v19 = &v20;
      __get_CDContextualKeyPathClass_block_invoke((uint64_t)&v15);
      id v7 = (void *)v21[3];
    }
    id v8 = v7;
    _Block_object_dispose(&v20, 8);
    uint64_t v9 = [v8 keyPathWithKey:@"/discoverability/signals/dataDictionary"];
    uint64_t v20 = 0;
    v21 = &v20;
    uint64_t v22 = 0x2050000000;
    uint64_t v10 = (void *)get_CDClientContextClass_softClass;
    uint64_t v23 = get_CDClientContextClass_softClass;
    if (!get_CDClientContextClass_softClass)
    {
      uint64_t v15 = MEMORY[0x1E4F143A8];
      uint64_t v16 = 3221225472;
      uint64_t v17 = __get_CDClientContextClass_block_invoke;
      v18 = &unk_1E6E2E248;
      v19 = &v20;
      __get_CDClientContextClass_block_invoke((uint64_t)&v15);
      uint64_t v10 = (void *)v21[3];
    }
    id v11 = v10;
    _Block_object_dispose(&v20, 8);
    v12 = [v11 userContext];
    [v12 setObject:v6 forKeyedSubscript:v9];
  }
  uint64_t v13 = a1[7];
  if (v13)
  {
    if (a2) {
      id v14 = 0;
    }
    else {
      id v14 = v5;
    }
    (*(void (**)(uint64_t, id))(v13 + 16))(v13, v14);
  }
}

- (TPSDiscoverabilitySignal)initWithIdentifier:(id)a3 bundleIdentifier:(id)a4 context:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)TPSDiscoverabilitySignal;
  v12 = [(TPSDiscoverabilitySignal *)&v15 init];
  uint64_t v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_identifier, a3);
    objc_storeStrong((id *)&v13->_bundleIdentifier, a4);
    objc_storeStrong((id *)&v13->_context, a5);
  }

  return v13;
}

- (TPSDiscoverabilitySignal)initWithIdentifier:(id)a3
{
  return [(TPSDiscoverabilitySignal *)self initWithIdentifier:a3 bundleIdentifier:0 context:0];
}

+ (id)osBuild
{
  if (osBuild_onceToken != -1) {
    dispatch_once(&osBuild_onceToken, &__block_literal_global_25);
  }
  uint64_t v2 = (void *)osBuild_gOSBuild;

  return v2;
}

void __35__TPSDiscoverabilitySignal_osBuild__block_invoke()
{
  uint64_t v0 = MGCopyAnswer();
  id v2 = (id)v0;
  if (v0)
  {
    uint64_t v0 = [@"iOS-" stringByAppendingString:v0];
  }
  id v1 = (void *)osBuild_gOSBuild;
  osBuild_gOSBuild = v0;
}

@end