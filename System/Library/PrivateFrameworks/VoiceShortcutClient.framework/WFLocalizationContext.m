@interface WFLocalizationContext
+ (WFLocalizationContext)defaultContext;
- (INStringLocalizer)stringLocalizer;
- (NSLocale)locale;
- (WFLocalizationContext)initWithLocale:(id)a3 stringLocalizer:(id)a4;
- (id)localize:(id)a3;
- (id)localize:(id)a3 pluralizationNumber:(id)a4;
@end

@implementation WFLocalizationContext

- (NSLocale)locale
{
  return self->_locale;
}

+ (WFLocalizationContext)defaultContext
{
  if (defaultContext_onceToken[0] != -1) {
    dispatch_once(defaultContext_onceToken, &__block_literal_global_13038);
  }
  v2 = (void *)defaultContext_context;
  return (WFLocalizationContext *)v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stringLocalizer, 0);
  objc_storeStrong((id *)&self->_locale, 0);
}

- (INStringLocalizer)stringLocalizer
{
  return self->_stringLocalizer;
}

- (id)localize:(id)a3 pluralizationNumber:(id)a4
{
  v6 = (objc_class *)MEMORY[0x1E4F292C0];
  id v7 = a4;
  id v8 = a3;
  id v9 = objc_alloc_init(v6);
  [v9 setPluralizationNumber:v7];

  v10 = [(WFLocalizationContext *)self locale];
  [v8 setLocale:v10];

  v11 = [v8 localizeWithOptions:v9];

  return v11;
}

- (id)localize:(id)a3
{
  id v4 = a3;
  v5 = [(WFLocalizationContext *)self locale];
  [v4 setLocale:v5];

  v6 = [v4 localize];

  return v6;
}

- (WFLocalizationContext)initWithLocale:(id)a3 stringLocalizer:(id)a4
{
  id v8 = a3;
  id v9 = a4;
  v10 = v9;
  if (v8)
  {
    if (v9) {
      goto LABEL_3;
    }
  }
  else
  {
    v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2, self, @"WFLocalizationContext.m", 25, @"Invalid parameter not satisfying: %@", @"locale" object file lineNumber description];

    if (v10) {
      goto LABEL_3;
    }
  }
  v16 = [MEMORY[0x1E4F28B00] currentHandler];
  [v16 handleFailureInMethod:a2, self, @"WFLocalizationContext.m", 26, @"Invalid parameter not satisfying: %@", @"stringLocalizer" object file lineNumber description];

LABEL_3:
  v17.receiver = self;
  v17.super_class = (Class)WFLocalizationContext;
  v11 = [(WFLocalizationContext *)&v17 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_locale, a3);
    objc_storeStrong((id *)&v12->_stringLocalizer, a4);
    v13 = v12;
  }

  return v12;
}

void __39__WFLocalizationContext_defaultContext__block_invoke()
{
  v0 = [WFLocalizationContext alloc];
  id v4 = [MEMORY[0x1E4F1CA20] autoupdatingCurrentLocale];
  v1 = (void *)[objc_alloc(MEMORY[0x1E4F30788]) initWithLanguageCode:0];
  uint64_t v2 = [(WFLocalizationContext *)v0 initWithLocale:v4 stringLocalizer:v1];
  v3 = (void *)defaultContext_context;
  defaultContext_context = v2;
}

@end