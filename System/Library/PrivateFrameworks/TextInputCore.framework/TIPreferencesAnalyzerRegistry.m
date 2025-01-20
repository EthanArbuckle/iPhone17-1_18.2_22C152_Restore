@interface TIPreferencesAnalyzerRegistry
- (NSMutableArray)registry;
- (TIPreferencesAnalyzerRegistry)init;
- (unint64_t)count;
- (void)_registerPreference:(id)a3 domain:(id)a4 defaultValue:(id)a5 reportingMode:(int)a6;
- (void)enumerateRegisteredPreferencesUsingBlock:(id)a3;
@end

@implementation TIPreferencesAnalyzerRegistry

- (void).cxx_destruct
{
}

- (NSMutableArray)registry
{
  return self->_registry;
}

- (void)_registerPreference:(id)a3 domain:(id)a4 defaultValue:(id)a5 reportingMode:(int)a6
{
  if (a3 && a4)
  {
    uint64_t v7 = *(void *)&a6;
    id v10 = a5;
    id v11 = a4;
    id v12 = a3;
    v13 = [[_TIPreferencesAnalyzerProperty alloc] initWithKey:v12 domain:v11 defaultValue:v10 reportingMode:v7];

    [(NSMutableArray *)self->_registry addObject:v13];
  }
}

- (unint64_t)count
{
  return [(NSMutableArray *)self->_registry count];
}

- (void)enumerateRegisteredPreferencesUsingBlock:(id)a3
{
  id v4 = a3;
  registry = self->_registry;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __74__TIPreferencesAnalyzerRegistry_enumerateRegisteredPreferencesUsingBlock___block_invoke;
  v7[3] = &unk_1E6E2D718;
  id v8 = v4;
  id v6 = v4;
  [(NSMutableArray *)registry enumerateObjectsUsingBlock:v7];
}

void __74__TIPreferencesAnalyzerRegistry_enumerateRegisteredPreferencesUsingBlock___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = *(void *)(a1 + 32);
  id v6 = a2;
  id v10 = [v6 domain];
  uint64_t v7 = [v6 key];
  id v8 = [v6 defaultValue];
  uint64_t v9 = [v6 reportingMode];

  (*(void (**)(uint64_t, id, void *, void *, uint64_t, uint64_t))(v5 + 16))(v5, v10, v7, v8, v9, a4);
}

- (TIPreferencesAnalyzerRegistry)init
{
  v8.receiver = self;
  v8.super_class = (Class)TIPreferencesAnalyzerRegistry;
  v2 = [(TIPreferencesAnalyzerRegistry *)&v8 init];
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    registry = v2->_registry;
    v2->_registry = v3;

    uint64_t v5 = *MEMORY[0x1E4FAE7A8];
    uint64_t v6 = MEMORY[0x1E4F1CC38];
    [(TIPreferencesAnalyzerRegistry *)v2 _registerPreference:*MEMORY[0x1E4FAE7A8] domain:@"com.apple.keyboard.preferences" defaultValue:MEMORY[0x1E4F1CC38] reportingMode:2];
    [(TIPreferencesAnalyzerRegistry *)v2 _registerPreference:*MEMORY[0x1E4FAEA10] domain:@"com.apple.InputModePreferences" defaultValue:v6 reportingMode:1];
    [(TIPreferencesAnalyzerRegistry *)v2 _registerPreference:v5 domain:@"com.apple.keyboard.preferences" defaultValue:v6 reportingMode:1];
    [(TIPreferencesAnalyzerRegistry *)v2 _registerPreference:*MEMORY[0x1E4FAE888] domain:@"com.apple.keyboard.preferences" defaultValue:v6 reportingMode:1];
    [(TIPreferencesAnalyzerRegistry *)v2 _registerPreference:*MEMORY[0x1E4FAEA08] domain:@"com.apple.keyboard.preferences" defaultValue:MEMORY[0x1E4F1CC28] reportingMode:1];
    [(TIPreferencesAnalyzerRegistry *)v2 _registerPreference:*MEMORY[0x1E4FAE798] domain:@"com.apple.preferences.sounds" defaultValue:v6 reportingMode:1];
    [(TIPreferencesAnalyzerRegistry *)v2 _registerPreference:*MEMORY[0x1E4FAE780] domain:@"com.apple.keyboard.preferences" defaultValue:v6 reportingMode:1];
    [(TIPreferencesAnalyzerRegistry *)v2 _registerPreference:*MEMORY[0x1E4FAE5C0] domain:@"com.apple.assistant.support" defaultValue:v6 reportingMode:1];
    [(TIPreferencesAnalyzerRegistry *)v2 _registerPreference:*MEMORY[0x1E4FAEA20] domain:@"com.apple.InputModePreferences" defaultValue:&unk_1F3FA7CB8 reportingMode:1];
    [(TIPreferencesAnalyzerRegistry *)v2 _registerPreference:*MEMORY[0x1E4FAE5C8] domain:@"com.apple.assistant.support" defaultValue:v6 reportingMode:1];
  }
  return v2;
}

@end