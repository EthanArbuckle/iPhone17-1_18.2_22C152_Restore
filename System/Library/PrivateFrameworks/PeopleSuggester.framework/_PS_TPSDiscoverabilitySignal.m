@interface _PS_TPSDiscoverabilitySignal
- (NSString)bundleIdentifier;
- (NSString)context;
- (NSString)identifier;
- (_PS_TPSDiscoverabilitySignal)initWithIdentifier:(id)a3;
- (_PS_TPSDiscoverabilitySignal)initWithIdentifier:(id)a3 bundleIdentifier:(id)a4 context:(id)a5;
- (id)_knowledgeStore;
- (void)donateSignalWithCompletion:(id)a3;
- (void)setBundleIdentifier:(id)a3;
- (void)setContext:(id)a3;
- (void)setIdentifier:(id)a3;
@end

@implementation _PS_TPSDiscoverabilitySignal

- (_PS_TPSDiscoverabilitySignal)initWithIdentifier:(id)a3
{
  return [(_PS_TPSDiscoverabilitySignal *)self initWithIdentifier:a3 bundleIdentifier:0 context:0];
}

- (_PS_TPSDiscoverabilitySignal)initWithIdentifier:(id)a3 bundleIdentifier:(id)a4 context:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)_PS_TPSDiscoverabilitySignal;
  v12 = [(_PS_TPSDiscoverabilitySignal *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_identifier, a3);
    objc_storeStrong((id *)&v13->_bundleIdentifier, a4);
    objc_storeStrong((id *)&v13->_context, a5);
  }

  return v13;
}

- (void)donateSignalWithCompletion:(id)a3
{
  v30[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v24 = [MEMORY[0x1E4F1C9C8] date];
  v5 = [(_PS_TPSDiscoverabilitySignal *)self identifier];
  v6 = [(_PS_TPSDiscoverabilitySignal *)self bundleIdentifier];
  v7 = v6;
  if (v6)
  {
    id v8 = v6;
  }
  else
  {
    id v9 = [MEMORY[0x1E4F28B50] mainBundle];
    id v8 = [v9 bundleIdentifier];
  }
  id v10 = [(_PS_TPSDiscoverabilitySignal *)self context];
  v23 = (void *)[objc_alloc(MEMORY[0x1E4F5B5F0]) initWithIdentifier:0 bundleIdentifier:v8 itemIdentifier:0 groupIdentifier:0 deviceIdentifier:0 userIdentifier:0];
  id v11 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:1];
  v12 = [MEMORY[0x1E4F5B500] context];
  [v11 setObject:v10 forKeyedSubscript:v12];

  v13 = (void *)MEMORY[0x1E4F5B510];
  v14 = [MEMORY[0x1E4F5B5F8] discoverabilitySignalsStream];
  objc_super v15 = (void *)[v11 copy];
  v16 = [v13 eventWithStream:v14 source:v23 startDate:v24 endDate:v24 identifierStringValue:v5 metadata:v15];

  v17 = [(_PS_TPSDiscoverabilitySignal *)self _knowledgeStore];
  v30[0] = v16;
  v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v30 count:1];
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __59___PS_TPSDiscoverabilitySignal_donateSignalWithCompletion___block_invoke_2;
  v25[3] = &unk_1E5AE16D8;
  id v26 = v5;
  id v27 = v8;
  id v28 = v10;
  id v29 = v4;
  id v19 = v4;
  id v20 = v10;
  id v21 = v8;
  id v22 = v5;
  [v17 saveObjects:v18 tracker:&__block_literal_global_40 responseQueue:0 withCompletion:v25];
}

- (id)_knowledgeStore
{
  if (_knowledgeStore_onceToken != -1) {
    dispatch_once(&_knowledgeStore_onceToken, &__block_literal_global_23);
  }
  v2 = (void *)_knowledgeStore_store;

  return v2;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (void)setBundleIdentifier:(id)a3
{
}

- (NSString)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

@end