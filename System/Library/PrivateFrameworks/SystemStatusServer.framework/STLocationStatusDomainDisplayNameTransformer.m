@interface STLocationStatusDomainDisplayNameTransformer
- (STLocationStatusDomainDisplayNameTransformer)initWithEntityResolver:(id)a3;
- (id)transformedDataForData:(id)a3;
@end

@implementation STLocationStatusDomainDisplayNameTransformer

id __71__STLocationStatusDomainDisplayNameTransformer_transformedDataForData___block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 activityAttribution];
  v3 = [v2 attributedEntity];

  return v3;
}

id __71__STLocationStatusDomainDisplayNameTransformer_transformedDataForData___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [v3 activityAttribution];
  v5 = [v4 attributedEntity];
  v6 = [*(id *)(a1 + 32) resolveEntity:v5];
  v7 = [v6 attributedEntity];
  v8 = [v6 activeEntity];
  v9 = (void *)[v4 copyReplacingAttributedEntity:v7 activeEntity:v8];

  id v10 = objc_alloc(MEMORY[0x1E4FA93C0]);
  uint64_t v11 = [v3 locationState];
  uint64_t v12 = [v3 eligibleDisplayModes];

  v13 = (void *)[v10 initWithLocationState:v11 activityAttribution:v9 eligibleDisplayModes:v12];
  return v13;
}

- (id)transformedDataForData:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  id v6 = v4;
  v7 = v6;
  id v8 = v6;
  if (isKindOfClass)
  {
    v9 = [v6 attributions];
    id v10 = objc_msgSend(v9, "bs_map:", &__block_literal_global_2);
    if (self) {
      entityResolver = self->_entityResolver;
    }
    else {
      entityResolver = 0;
    }
    uint64_t v12 = entityResolver;
    [(STAttributedEntityBatchResolving *)v12 resolveEntities:v10];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __71__STLocationStatusDomainDisplayNameTransformer_transformedDataForData___block_invoke_2;
    v17[3] = &unk_1E6AD23A8;
    v18 = v12;
    v13 = v12;
    v14 = objc_msgSend(v9, "bs_map:", v17);
    id v8 = objc_alloc_init(MEMORY[0x1E4FA9408]);
    uint64_t v15 = [v7 activeDisplayModes];

    [v8 setActiveDisplayModes:v15];
    [v8 setAttributions:v14];
  }
  return v8;
}

- (STLocationStatusDomainDisplayNameTransformer)initWithEntityResolver:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)STLocationStatusDomainDisplayNameTransformer;
  id v6 = [(STLocationStatusDomainDisplayNameTransformer *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_entityResolver, a3);
  }

  return v7;
}

- (void).cxx_destruct
{
}

@end