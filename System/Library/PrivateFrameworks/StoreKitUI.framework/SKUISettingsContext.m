@interface SKUISettingsContext
- (SKUIClientContext)clientContext;
- (SKUISettingsContext)initWithClientContext:(id)a3;
- (id)_dequeueReusableSettingDescriptionWithReuseIdentifier:(id)a3 forViewElement:(id)a4 parent:(id)a5;
- (id)dequeueReusableSettingDescriptionForViewElement:(id)a3 parent:(id)a4;
- (void)_registerClass:(Class)a3 forReuseIdentifier:(id)a4;
- (void)_registerReuseClasses;
- (void)recycleSettingDescriptions:(id)a3;
- (void)setClientContext:(id)a3;
@end

@implementation SKUISettingsContext

- (SKUISettingsContext)initWithClientContext:(id)a3
{
  id v4 = a3;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    -[SKUISettingsContext initWithClientContext:]();
  }
  v14.receiver = self;
  v14.super_class = (Class)SKUISettingsContext;
  v5 = [(SKUISettingsContext *)&v14 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_clientContext, v4);
    v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    elementTypeClass = v6->_elementTypeClass;
    v6->_elementTypeClass = v7;

    v9 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    descriptionReusePool = v6->_descriptionReusePool;
    v6->_descriptionReusePool = v9;

    v11 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    viewReusePool = v6->_viewReusePool;
    v6->_viewReusePool = v11;

    [(SKUISettingsContext *)v6 _registerReuseClasses];
  }

  return v6;
}

- (id)dequeueReusableSettingDescriptionForViewElement:(id)a3 parent:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v6 elementType];
  switch(v8)
  {
    case 'o':
      v9 = @"editProfile";
      goto LABEL_8;
    case 'p':
      v9 = @"family";
      goto LABEL_8;
    case 'q':
      v9 = @"field";
      goto LABEL_8;
    case 'r':
      v9 = @"profile";
      goto LABEL_8;
    default:
      if (v8 == 66)
      {
        v9 = @"default";
LABEL_8:
        v10 = [(SKUISettingsContext *)self _dequeueReusableSettingDescriptionWithReuseIdentifier:v9 forViewElement:v6 parent:v7];
      }
      else
      {
        v10 = 0;
      }

      return v10;
  }
}

- (void)recycleSettingDescriptions:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        [(NSMutableArray *)self->_descriptionReusePool addObject:*(void *)(*((void *)&v9 + 1) + 8 * v8++)];
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (id)_dequeueReusableSettingDescriptionWithReuseIdentifier:(id)a3 forViewElement:(id)a4 parent:(id)a5
{
  id v8 = a3;
  descriptionReusePool = self->_descriptionReusePool;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __99__SKUISettingsContext__dequeueReusableSettingDescriptionWithReuseIdentifier_forViewElement_parent___block_invoke;
  v17[3] = &unk_1E64275C0;
  id v18 = v8;
  id v10 = v8;
  id v11 = a5;
  id v12 = a4;
  uint64_t v13 = [(NSMutableArray *)descriptionReusePool indexOfObjectPassingTest:v17];
  if (v13 == 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v14 = objc_msgSend(objc_alloc((Class)(id)-[NSMutableDictionary objectForKey:](self->_elementTypeClass, "objectForKey:", v10)), "initWithViewElement:parent:", v12, v11);

    objc_setAssociatedObject(v14, "com.apple.StoreKitUI.SKUISettingsContext.reuseIdentifier", v10, (void *)1);
  }
  else
  {
    uint64_t v15 = v13;
    uint64_t v14 = [(NSMutableArray *)self->_descriptionReusePool objectAtIndex:v13];
    [(NSMutableArray *)self->_descriptionReusePool removeObjectAtIndex:v15];
    [v14 reloadWithViewElement:v12 parent:v11];
  }

  return v14;
}

uint64_t __99__SKUISettingsContext__dequeueReusableSettingDescriptionWithReuseIdentifier_forViewElement_parent___block_invoke(uint64_t a1, id object)
{
  v3 = objc_getAssociatedObject(object, "com.apple.StoreKitUI.SKUISettingsContext.reuseIdentifier");
  id v4 = v3;
  if (v3) {
    uint64_t v5 = [v3 isEqualToString:*(void *)(a1 + 32)];
  }
  else {
    uint64_t v5 = 0;
  }

  return v5;
}

- (void)_registerReuseClasses
{
  [(SKUISettingsContext *)self _registerClass:objc_opt_class() forReuseIdentifier:@"default"];
  [(SKUISettingsContext *)self _registerClass:objc_opt_class() forReuseIdentifier:@"editProfile"];
  [(SKUISettingsContext *)self _registerClass:objc_opt_class() forReuseIdentifier:@"family"];
  [(SKUISettingsContext *)self _registerClass:objc_opt_class() forReuseIdentifier:@"field"];
  uint64_t v3 = objc_opt_class();

  [(SKUISettingsContext *)self _registerClass:v3 forReuseIdentifier:@"profile"];
}

- (void)_registerClass:(Class)a3 forReuseIdentifier:(id)a4
{
}

- (SKUIClientContext)clientContext
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_clientContext);

  return (SKUIClientContext *)WeakRetained;
}

- (void)setClientContext:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_clientContext);
  objc_storeStrong((id *)&self->_viewReusePool, 0);
  objc_storeStrong((id *)&self->_descriptionReusePool, 0);

  objc_storeStrong((id *)&self->_elementTypeClass, 0);
}

- (void)initWithClientContext:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "-[SKUISettingsContext initWithClientContext:]";
}

@end