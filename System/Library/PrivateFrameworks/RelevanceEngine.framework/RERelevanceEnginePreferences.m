@interface RERelevanceEnginePreferences
+ (id)defaultPreferences;
- (BOOL)isEqual:(id)a3;
- (NSSet)disabledDataSourceIdentifiers;
- (RERelevanceEnginePreferences)init;
- (RERelevanceEnginePreferencesDelegate)delegate;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (unint64_t)mode;
- (void)setDelegate:(id)a3;
- (void)setDisabledDataSourceIdentifiers:(id)a3;
- (void)setMode:(unint64_t)a3;
@end

@implementation RERelevanceEnginePreferences

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_disabledDataSourceIdentifiers, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (unint64_t)mode
{
  return self->_mode;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_storeStrong((id *)(v4 + 16), self->_disabledDataSourceIdentifiers);
  *(void *)(v4 + 24) = self->_mode;
  return (id)v4;
}

- (RERelevanceEnginePreferences)init
{
  v6.receiver = self;
  v6.super_class = (Class)RERelevanceEnginePreferences;
  v2 = [(RERelevanceEnginePreferences *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x263EFFA08] set];
    disabledDataSourceIdentifiers = v2->_disabledDataSourceIdentifiers;
    v2->_disabledDataSourceIdentifiers = (NSSet *)v3;
  }
  return v2;
}

uint64_t __72__RERelevanceEnginePreferences_REDefaultPreferences__defaultPreferences__block_invoke()
{
  defaultPreferences_DefaultPreferences = objc_opt_new();
  return MEMORY[0x270F9A758]();
}

- (NSSet)disabledDataSourceIdentifiers
{
  return self->_disabledDataSourceIdentifiers;
}

+ (id)defaultPreferences
{
  if (defaultPreferences_onceToken != -1) {
    dispatch_once(&defaultPreferences_onceToken, &__block_literal_global_40);
  }
  v2 = (void *)defaultPreferences_DefaultPreferences;
  return v2;
}

- (unint64_t)hash
{
  return self->_mode ^ [(NSSet *)self->_disabledDataSourceIdentifiers hash];
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (RERelevanceEnginePreferences *)a3;
  if (v4 == self)
  {
    char v11 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      objc_super v6 = v5;
      if (self->_mode == v5->_mode)
      {
        disabledDataSourceIdentifiers = self->_disabledDataSourceIdentifiers;
        v8 = v5->_disabledDataSourceIdentifiers;
        v9 = disabledDataSourceIdentifiers;
        v10 = v9;
        if (v9 == v8) {
          char v11 = 1;
        }
        else {
          char v11 = [(NSSet *)v9 isEqual:v8];
        }
      }
      else
      {
        char v11 = 0;
      }
    }
    else
    {
      char v11 = 0;
    }
  }

  return v11;
}

- (void)setMode:(unint64_t)a3
{
  if (self->_mode != a3)
  {
    self->_mode = a3;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained relevanceEnginePreferencesDidUpdate:self];
  }
}

- (void)setDisabledDataSourceIdentifiers:(id)a3
{
  uint64_t v4 = (NSSet *)[a3 copy];
  disabledDataSourceIdentifiers = self->_disabledDataSourceIdentifiers;
  self->_disabledDataSourceIdentifiers = v4;

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained relevanceEnginePreferencesDidUpdate:self];
}

- (void)setDelegate:(id)a3
{
}

- (RERelevanceEnginePreferencesDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (RERelevanceEnginePreferencesDelegate *)WeakRetained;
}

@end