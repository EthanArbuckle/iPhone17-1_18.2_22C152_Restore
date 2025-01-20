@interface SBAlwaysOnPolicySettings
+ (id)_keyPathForSemanticTypeName:(id)a3;
+ (id)settingsControllerModule;
- (BOOL)semanticTypeCustom;
- (BOOL)semanticTypeDefault;
- (BOOL)semanticTypeDriving;
- (BOOL)semanticTypeExercise;
- (BOOL)semanticTypeGaming;
- (BOOL)semanticTypeMindfulness;
- (BOOL)semanticTypePersonal;
- (BOOL)semanticTypeReading;
- (BOOL)semanticTypeSleep;
- (BOOL)semanticTypeWork;
- (NSSet)alwaysOnDisablingFocusSemanticTypes;
- (int64_t)focusStrategy;
- (void)setAlwaysOnDisablingFocusSemanticTypes:(id)a3;
- (void)setDefaultValues;
- (void)setFocusStrategy:(int64_t)a3;
- (void)setSemanticTypeCustom:(BOOL)a3;
- (void)setSemanticTypeDefault:(BOOL)a3;
- (void)setSemanticTypeDriving:(BOOL)a3;
- (void)setSemanticTypeExercise:(BOOL)a3;
- (void)setSemanticTypeGaming:(BOOL)a3;
- (void)setSemanticTypeMindfulness:(BOOL)a3;
- (void)setSemanticTypePersonal:(BOOL)a3;
- (void)setSemanticTypeReading:(BOOL)a3;
- (void)setSemanticTypeSleep:(BOOL)a3;
- (void)setSemanticTypeWork:(BOOL)a3;
@end

@implementation SBAlwaysOnPolicySettings

- (void)setDefaultValues
{
  v4.receiver = self;
  v4.super_class = (Class)SBAlwaysOnPolicySettings;
  [(PTSettings *)&v4 setDefaultValues];
  self->_focusStrategy = 0;
  v3 = [MEMORY[0x1E4F1CAD0] setWithArray:&unk_1F3348318];
  [(SBAlwaysOnPolicySettings *)self setAlwaysOnDisablingFocusSemanticTypes:v3];
}

+ (id)settingsControllerModule
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F94110] rowWithTitle:@"Strategy" valueKeyPath:@"focusStrategy"];
  v24 = [v3 possibleValues:&unk_1F3348348 titles:&unk_1F3348330];

  objc_super v4 = [MEMORY[0x1E4F1CA48] array];
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  v5 = [&unk_1F334BA60 allKeys];
  v6 = [v5 sortedArrayUsingSelector:sel_localizedCaseInsensitiveCompare_];

  id obj = v6;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v26 objects:v32 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v27;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v27 != v9) {
          objc_enumerationMutation(obj);
        }
        uint64_t v11 = *(void *)(*((void *)&v26 + 1) + 8 * i);
        v12 = (void *)MEMORY[0x1E4F941E8];
        v13 = [a1 _keyPathForSemanticTypeName:v11];
        v14 = [v12 rowWithTitle:v11 valueKeyPath:v13];
        v15 = [v14 conditionFormat:@"focusStrategy = %@", &unk_1F334AD48];

        [v4 addObject:v15];
      }
      uint64_t v8 = [obj countByEnumeratingWithState:&v26 objects:v32 count:16];
    }
    while (v8);
  }

  v16 = (void *)MEMORY[0x1E4F94168];
  v31 = v24;
  v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v31 count:1];
  v18 = [v17 arrayByAddingObjectsFromArray:v4];
  v19 = [v16 sectionWithRows:v18 title:@"Disabling By Focus Modes"];

  v20 = (void *)MEMORY[0x1E4F94168];
  v30 = v19;
  v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v30 count:1];
  v22 = [v20 moduleWithTitle:@"Always-On Policies" contents:v21];

  return v22;
}

+ (id)_keyPathForSemanticTypeName:(id)a3
{
  return (id)[NSString stringWithFormat:@"semanticType%@", a3];
}

- (NSSet)alwaysOnDisablingFocusSemanticTypes
{
  v3 = [&unk_1F334BA88 allKeys];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __63__SBAlwaysOnPolicySettings_alwaysOnDisablingFocusSemanticTypes__block_invoke;
  v8[3] = &unk_1E6AF4A20;
  v8[4] = self;
  objc_super v4 = objc_msgSend(v3, "bs_filter:", v8);
  v5 = objc_msgSend(v4, "bs_map:", &__block_literal_global_302);

  v6 = [MEMORY[0x1E4F1CAD0] setWithArray:v5];

  return (NSSet *)v6;
}

uint64_t __63__SBAlwaysOnPolicySettings_alwaysOnDisablingFocusSemanticTypes__block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  objc_super v4 = [(id)objc_opt_class() _keyPathForSemanticTypeName:v3];

  v5 = [v2 valueForKey:v4];
  uint64_t v6 = [v5 BOOLValue];

  return v6;
}

uint64_t __63__SBAlwaysOnPolicySettings_alwaysOnDisablingFocusSemanticTypes__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [&unk_1F334BAB0 objectForKeyedSubscript:a2];
}

- (void)setAlwaysOnDisablingFocusSemanticTypes:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id obj = [&unk_1F334BAD8 allKeys];
  uint64_t v5 = [obj countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v16 != v7) {
          objc_enumerationMutation(obj);
        }
        uint64_t v9 = *(void *)(*((void *)&v15 + 1) + 8 * i);
        v10 = [&unk_1F334BB00 objectForKeyedSubscript:v9];
        uint64_t v11 = [v4 containsObject:v10];

        v12 = [NSNumber numberWithBool:v11];
        v13 = [(id)objc_opt_class() _keyPathForSemanticTypeName:v9];
        [(SBAlwaysOnPolicySettings *)self setValue:v12 forKey:v13];
      }
      uint64_t v6 = [obj countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v6);
  }
}

- (int64_t)focusStrategy
{
  return self->_focusStrategy;
}

- (void)setFocusStrategy:(int64_t)a3
{
  self->_focusStrategy = a3;
}

- (BOOL)semanticTypeCustom
{
  return self->_semanticTypeCustom;
}

- (void)setSemanticTypeCustom:(BOOL)a3
{
  self->_semanticTypeCustom = a3;
}

- (BOOL)semanticTypeDefault
{
  return self->_semanticTypeDefault;
}

- (void)setSemanticTypeDefault:(BOOL)a3
{
  self->_semanticTypeDefault = a3;
}

- (BOOL)semanticTypeSleep
{
  return self->_semanticTypeSleep;
}

- (void)setSemanticTypeSleep:(BOOL)a3
{
  self->_semanticTypeSleep = a3;
}

- (BOOL)semanticTypeDriving
{
  return self->_semanticTypeDriving;
}

- (void)setSemanticTypeDriving:(BOOL)a3
{
  self->_semanticTypeDriving = a3;
}

- (BOOL)semanticTypeExercise
{
  return self->_semanticTypeExercise;
}

- (void)setSemanticTypeExercise:(BOOL)a3
{
  self->_semanticTypeExercise = a3;
}

- (BOOL)semanticTypeWork
{
  return self->_semanticTypeWork;
}

- (void)setSemanticTypeWork:(BOOL)a3
{
  self->_semanticTypeWork = a3;
}

- (BOOL)semanticTypePersonal
{
  return self->_semanticTypePersonal;
}

- (void)setSemanticTypePersonal:(BOOL)a3
{
  self->_semanticTypePersonal = a3;
}

- (BOOL)semanticTypeReading
{
  return self->_semanticTypeReading;
}

- (void)setSemanticTypeReading:(BOOL)a3
{
  self->_semanticTypeReading = a3;
}

- (BOOL)semanticTypeGaming
{
  return self->_semanticTypeGaming;
}

- (void)setSemanticTypeGaming:(BOOL)a3
{
  self->_semanticTypeGaming = a3;
}

- (BOOL)semanticTypeMindfulness
{
  return self->_semanticTypeMindfulness;
}

- (void)setSemanticTypeMindfulness:(BOOL)a3
{
  self->_semanticTypeMindfulness = a3;
}

@end