@interface WFActionProvider
- (INStringLocalizer)stringLocalizer;
- (NSDictionary)defaultSerializedParameters;
- (WFActionDefinition)defaultActionDefinition;
- (WFActionProviderDelegate)delegate;
- (id)availableActionIdentifiers;
- (id)createAllAvailableActions;
- (id)definitionForMissingActionWithSerializedParameters:(id)a3;
- (void)createActionsForRequests:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setStringLocalizer:(id)a3;
@end

@implementation WFActionProvider

- (void)createActionsForRequests:(id)a3
{
}

- (WFActionDefinition)defaultActionDefinition
{
  v14[1] = *MEMORY[0x1E4F143B8];
  v3 = [WFActionDefinition alloc];
  v13 = @"FillingProvider";
  if (self)
  {
    providerName = self->_providerName;
    v5 = [MEMORY[0x1E4F1CA98] null];

    if (providerName == v5)
    {
      v6 = 0;
    }
    else if (providerName)
    {
      providerName = providerName;
      v6 = providerName;
    }
    else
    {
      v7 = (objc_class *)objc_opt_class();
      NSStringFromClass(v7);
      v8 = (NSString *)objc_claimAutoreleasedReturnValue();
      v6 = v8;
      if (v8)
      {
        v9 = v8;
      }
      else
      {
        v9 = [MEMORY[0x1E4F1CA98] null];
      }
      providerName = self->_providerName;
      self->_providerName = v9;
    }
  }
  else
  {
    v6 = 0;
  }
  v14[0] = v6;
  v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:&v13 count:1];
  v11 = [(WFActionDefinition *)v3 initWithDictionary:v10];

  return v11;
}

- (void)setStringLocalizer:(id)a3
{
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stringLocalizer, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_providerName, 0);
}

- (WFActionProviderDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (WFActionProviderDelegate *)WeakRetained;
}

- (NSDictionary)defaultSerializedParameters
{
  return (NSDictionary *)MEMORY[0x1E4F1CC08];
}

- (INStringLocalizer)stringLocalizer
{
  stringLocalizer = self->_stringLocalizer;
  if (!stringLocalizer)
  {
    v4 = [MEMORY[0x1E4F30788] localizerForLanguage:0];
    v5 = self->_stringLocalizer;
    self->_stringLocalizer = v4;

    stringLocalizer = self->_stringLocalizer;
  }
  return stringLocalizer;
}

- (id)definitionForMissingActionWithSerializedParameters:(id)a3
{
  return 0;
}

- (id)createAllAvailableActions
{
  v3 = [(WFActionProvider *)self availableActionIdentifiers];
  v4 = objc_msgSend(v3, "if_map:", &__block_literal_global_55567);

  v5 = [v4 allObjects];
  [(WFActionProvider *)self createActionsForRequests:v5];

  v6 = objc_msgSend(v4, "if_compactMap:", &__block_literal_global_196_55568);

  return v6;
}

uint64_t __45__WFActionProvider_createAllAvailableActions__block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 result];
}

WFActionRequest *__45__WFActionProvider_createAllAvailableActions__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [[WFActionRequest alloc] initWithActionIdentifier:v2 serializedParameters:0];

  return v3;
}

- (id)availableActionIdentifiers
{
  return 0;
}

@end