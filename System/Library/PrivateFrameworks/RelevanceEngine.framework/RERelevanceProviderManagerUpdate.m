@interface RERelevanceProviderManagerUpdate
+ (id)immediateUpdateForAllProviders;
+ (id)immediateUpdateForProvider:(id)a3;
+ (id)scheduledUpdateForAllProvidersAtDate:(id)a3;
+ (id)scheduledUpdateForProvider:(id)a3 atDate:(id)a4;
- (BOOL)allProviders;
- (BOOL)isEqual:(id)a3;
- (RERelevanceProvider)provider;
- (RERelevanceProviderManagerUpdate)initWithProvider:(id)a3;
- (id)completion;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)setCompletion:(id)a3;
@end

@implementation RERelevanceProviderManagerUpdate

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completion, 0);
  objc_storeStrong((id *)&self->_provider, 0);
}

+ (id)immediateUpdateForAllProviders
{
  v2 = [(RERelevanceProviderManagerUpdate *)[RERelevanceProviderManagerImmediateUpdate alloc] initWithProvider:0];
  return v2;
}

- (RERelevanceProviderManagerUpdate)initWithProvider:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)RERelevanceProviderManagerUpdate;
  v6 = [(RERelevanceProviderManagerUpdate *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_provider, a3);
  }

  return v7;
}

- (id)completion
{
  return self->_completion;
}

- (BOOL)allProviders
{
  return self->_provider == 0;
}

+ (id)immediateUpdateForProvider:(id)a3
{
  id v3 = a3;
  v4 = [(RERelevanceProviderManagerUpdate *)[RERelevanceProviderManagerImmediateUpdate alloc] initWithProvider:v3];

  return v4;
}

+ (id)scheduledUpdateForProvider:(id)a3 atDate:(id)a4
{
  if (a4)
  {
    id v5 = a4;
    id v6 = a3;
    v7 = [[RERelevanceProviderManagerScheduledUpdate alloc] initWithProvider:v6 updateDate:v5];
  }
  else
  {
    v7 = 0;
  }
  return v7;
}

+ (id)scheduledUpdateForAllProvidersAtDate:(id)a3
{
  if (a3)
  {
    id v3 = a3;
    v4 = [[RERelevanceProviderManagerScheduledUpdate alloc] initWithProvider:0 updateDate:v3];
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = (id *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_storeStrong(v4 + 1, self->_provider);
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (RERelevanceProviderManagerUpdate *)a3;
  if (self == v4)
  {
    char v9 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      provider = self->_provider;
      id v6 = v4->_provider;
      v7 = provider;
      v8 = v7;
      if (v7 == v6) {
        char v9 = 1;
      }
      else {
        char v9 = [(RERelevanceProvider *)v7 isEqual:v6];
      }
    }
    else
    {
      char v9 = 0;
    }
  }

  return v9;
}

- (unint64_t)hash
{
  return [(RERelevanceProvider *)self->_provider hash];
}

- (RERelevanceProvider)provider
{
  return self->_provider;
}

- (void)setCompletion:(id)a3
{
}

@end