@interface TLKTrialManager
+ (id)sharedManager;
- (BOOL)biggerSuggestionsLayoutEnabled;
- (BOOL)snippetModernizationEnabled;
- (NSString)namespace;
- (TLKTrialManager)init;
- (TRIClient)client;
- (TRIExperimentIdentifiers)experimentIdentifiers;
- (int64_t)zkwOverrideValue;
- (void)refresh;
- (void)setBiggerSuggestionsLayoutEnabled:(BOOL)a3;
- (void)setClient:(id)a3;
- (void)setNamespace:(id)a3;
- (void)setSnippetModernizationEnabled:(BOOL)a3;
- (void)setZkwOverrideValue:(int64_t)a3;
@end

@implementation TLKTrialManager

+ (id)sharedManager
{
  if (sharedManager_onceToken[0] != -1) {
    dispatch_once(sharedManager_onceToken, &__block_literal_global_4);
  }
  v2 = (void *)sharedManager_manager;
  return v2;
}

- (BOOL)snippetModernizationEnabled
{
  return self->_snippetModernizationEnabled;
}

- (int64_t)zkwOverrideValue
{
  return self->_zkwOverrideValue;
}

uint64_t __32__TLKTrialManager_sharedManager__block_invoke()
{
  sharedManager_manager = objc_opt_new();
  return MEMORY[0x1F41817F8]();
}

- (void)refresh
{
  if (!self->_client)
  {
    v3 = [MEMORY[0x1E4FB0098] clientWithIdentifier:333];
    [(TLKTrialManager *)self setClient:v3];

    v4 = [MEMORY[0x1E4FB05B8] namespaceNameFromId:333];
    [(TLKTrialManager *)self setNamespace:v4];
  }
  v5 = [(TLKTrialManager *)self client];
  [v5 refresh];

  if (self->_experimentIdentifiers) {
    NSLog(&cfstr_HasExperimentI.isa);
  }
  v6 = [(TLKTrialManager *)self client];
  v7 = [MEMORY[0x1E4FB05B8] namespaceNameFromId:333];
  v8 = [v6 experimentIdentifiersWithNamespaceName:v7];
  experimentIdentifiers = self->_experimentIdentifiers;
  self->_experimentIdentifiers = v8;

  v10 = [(TLKTrialManager *)self client];
  v11 = [(TLKTrialManager *)self namespace];
  id v18 = [v10 levelForFactor:@"SnippetModernization" withNamespaceName:v11];

  v12 = [(TLKTrialManager *)self client];
  v13 = [(TLKTrialManager *)self namespace];
  v14 = [v12 levelForFactor:@"BiggerSuggestionsLayout" withNamespaceName:v13];

  v15 = [(TLKTrialManager *)self client];
  v16 = [(TLKTrialManager *)self namespace];
  v17 = [v15 levelForFactor:@"ZKWExpansionOverride" withNamespaceName:v16];

  if (v18) {
    -[TLKTrialManager setSnippetModernizationEnabled:](self, "setSnippetModernizationEnabled:", [v18 BOOLeanValue]);
  }
  if (v14) {
    -[TLKTrialManager setBiggerSuggestionsLayoutEnabled:](self, "setBiggerSuggestionsLayoutEnabled:", [v14 BOOLeanValue]);
  }
  if (v17) {
    -[TLKTrialManager setZkwOverrideValue:](self, "setZkwOverrideValue:", [v17 longValue]);
  }
}

- (TRIClient)client
{
  return self->_client;
}

- (NSString)namespace
{
  return self->_namespace;
}

- (void)setNamespace:(id)a3
{
}

- (void)setClient:(id)a3
{
}

- (TLKTrialManager)init
{
  v5.receiver = self;
  v5.super_class = (Class)TLKTrialManager;
  v2 = [(TLKTrialManager *)&v5 init];
  v3 = v2;
  if (v2)
  {
    [(TLKTrialManager *)v2 setSnippetModernizationEnabled:1];
    [(TLKTrialManager *)v3 setBiggerSuggestionsLayoutEnabled:1];
    [(TLKTrialManager *)v3 setZkwOverrideValue:0];
  }
  return v3;
}

- (void)setZkwOverrideValue:(int64_t)a3
{
  self->_zkwOverrideValue = a3;
}

- (void)setSnippetModernizationEnabled:(BOOL)a3
{
  self->_snippetModernizationEnabled = a3;
}

- (void)setBiggerSuggestionsLayoutEnabled:(BOOL)a3
{
  self->_biggerSuggestionsLayoutEnabled = a3;
}

- (BOOL)biggerSuggestionsLayoutEnabled
{
  return self->_biggerSuggestionsLayoutEnabled;
}

- (TRIExperimentIdentifiers)experimentIdentifiers
{
  return self->_experimentIdentifiers;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_client, 0);
  objc_storeStrong((id *)&self->_namespace, 0);
  objc_storeStrong((id *)&self->_experimentIdentifiers, 0);
}

@end