@interface SBHIconGridSizeClassDomain
+ (SBHIconGridSizeClassDomain)allocWithZone:(_NSZone *)a3;
+ (SBHIconGridSizeClassDomain)builtInDomain;
+ (SBHMutableIconGridSizeClassDomain)globalDomain;
+ (id)effectiveGridSizeClassDomainForDomain:(id)a3;
- (BOOL)containsGridSizeClass:(id)a3;
- (SBHIconGridSizeClassDomain)init;
- (SBHIconGridSizeClassDomain)initWithGridSizeClass:(id)a3 info:(id)a4;
- (SBHIconGridSizeClassDomain)initWithGridSizeClasses:(id)a3;
- (SBHIconGridSizeClassDomain)initWithGridSizeClasses:(id)a3 order:(id)a4 fallbackDomain:(id)a5;
- (SBHIconGridSizeClassDomain)initWithIconGridSizeClassDomain:(id)a3;
- (SBHIconGridSizeClassSet)allGridSizeClasses;
- (SBHIconGridSizeClassSet)allNonDefaultGridSizeClasses;
- (id)archiveValueForGridSizeClass:(id)a3;
- (id)descriptionForGridSizeClass:(id)a3;
- (id)gridSizeClassForArchiveValue:(id)a3;
- (id)gridSizeClassForDescription:(id)a3;
- (id)gridSizeClassOrder;
- (id)iconGridSizeClassForATXStackLayoutSize:(unint64_t)a3;
- (id)iconGridSizeClassForCHSWidgetFamily:(int64_t)a3;
- (id)iconGridSizeClassPassingTest:(id)a3;
- (id)infoForIconGridSizeClass:(id)a3;
- (id)infoValueForGridSizeClass:(id)a3 forKey:(id)a4;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (id)registeredGridSizeClassOrder;
- (id)registeredGridSizeClasses;
- (id)shortDescriptionForGridSizeClass:(id)a3;
- (int64_t)chsWidgetFamilyForIconGridSizeClass:(id)a3;
- (unint64_t)atxStackLayoutSizeForIconGridSizeClass:(id)a3;
- (unint64_t)filterKnownCHSWidgetFamilies:(unint64_t)a3;
- (void)addIconGridSizeClassesToSet:(id)a3;
- (void)enumerateGridSizeClassesFilteredBySet:(id)a3 usingBlock:(id)a4;
- (void)enumerateGridSizeClassesUsingBlock:(id)a3;
@end

@implementation SBHIconGridSizeClassDomain

+ (SBHMutableIconGridSizeClassDomain)globalDomain
{
  if (globalDomain_onceToken != -1) {
    dispatch_once(&globalDomain_onceToken, &__block_literal_global_2_0);
  }
  v2 = (void *)globalDomain_globalDomain;
  return (SBHMutableIconGridSizeClassDomain *)v2;
}

- (id)infoValueForGridSizeClass:(id)a3 forKey:(id)a4
{
  id v6 = a4;
  v7 = [(SBHIconGridSizeClassDomain *)self infoForIconGridSizeClass:a3];
  v8 = [v7 objectForKey:v6];

  return v8;
}

- (id)infoForIconGridSizeClass:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4 && ([v4 isEqualToString:@"SBHIconGridSizeClassDefault"] & 1) == 0)
  {
    v7 = [(SBHIconGridSizeClassDomain *)self registeredGridSizeClasses];
    id v6 = [v7 objectForKey:v5];
    if (!v6)
    {
      v8 = [(SBHIconGridSizeClassDomain *)self fallbackDomain];
      id v6 = [v8 infoForIconGridSizeClass:v5];
    }
  }
  else
  {
    id v6 = &unk_1F300F2B0;
  }

  return v6;
}

- (id)descriptionForGridSizeClass:(id)a3
{
  return [(SBHIconGridSizeClassDomain *)self infoValueForGridSizeClass:a3 forKey:@"SBHIconGridSizeClassRegistrationInfoKeyDescription"];
}

+ (SBHIconGridSizeClassDomain)builtInDomain
{
  if (builtInDomain_onceToken != -1) {
    dispatch_once(&builtInDomain_onceToken, &__block_literal_global_38);
  }
  v2 = (void *)builtInDomain_builtInDomain;
  return (SBHIconGridSizeClassDomain *)v2;
}

void __43__SBHIconGridSizeClassDomain_builtInDomain__block_invoke()
{
  v0 = objc_alloc_init(SBHBuiltInIconGridSizeClassDomain);
  v1 = (void *)builtInDomain_builtInDomain;
  builtInDomain_builtInDomain = (uint64_t)v0;
}

void __42__SBHIconGridSizeClassDomain_globalDomain__block_invoke()
{
  v0 = objc_alloc_init(SBHGlobalIconGridSizeClassDomain);
  v1 = (void *)globalDomain_globalDomain;
  globalDomain_globalDomain = (uint64_t)v0;
}

+ (SBHIconGridSizeClassDomain)allocWithZone:(_NSZone *)a3
{
  self;
  id v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 == a1)
  {
    return (SBHIconGridSizeClassDomain *)+[SBHIconGridSizeClassDomain allocWithZone:a3];
  }
  else
  {
    v7.receiver = a1;
    v7.super_class = (Class)&OBJC_METACLASS___SBHIconGridSizeClassDomain;
    return (SBHIconGridSizeClassDomain *)objc_msgSendSuper2(&v7, sel_allocWithZone_, a3);
  }
}

- (SBHIconGridSizeClassDomain)init
{
  return [(SBHIconGridSizeClassDomain *)self initWithGridSizeClasses:MEMORY[0x1E4F1CC08]];
}

- (SBHIconGridSizeClassDomain)initWithGridSizeClass:(id)a3 info:(id)a4
{
  v13[1] = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  v13[0] = a4;
  id v6 = (void *)MEMORY[0x1E4F1C9E8];
  id v7 = a4;
  id v8 = a3;
  v9 = [v6 dictionaryWithObjects:v13 forKeys:&v12 count:1];

  v10 = [(SBHIconGridSizeClassDomain *)self initWithGridSizeClasses:v9];
  return v10;
}

- (SBHIconGridSizeClassDomain)initWithGridSizeClasses:(id)a3
{
  id v4 = a3;
  id v5 = [v4 allKeys];
  id v6 = [(SBHIconGridSizeClassDomain *)self initWithGridSizeClasses:v4 order:v5 fallbackDomain:0];

  return v6;
}

- (SBHIconGridSizeClassDomain)initWithGridSizeClasses:(id)a3 order:(id)a4 fallbackDomain:(id)a5
{
  v6.receiver = self;
  v6.super_class = (Class)SBHIconGridSizeClassDomain;
  return [(SBHIconGridSizeClassDomain *)&v6 init];
}

- (SBHIconGridSizeClassDomain)initWithIconGridSizeClassDomain:(id)a3
{
  id v4 = a3;
  id v5 = [v4 registeredGridSizeClasses];
  objc_super v6 = [v4 registeredGridSizeClassOrder];
  id v7 = [v4 fallbackDomain];

  id v8 = [(SBHIconGridSizeClassDomain *)self initWithGridSizeClasses:v5 order:v6 fallbackDomain:v7];
  return v8;
}

- (id)iconGridSizeClassPassingTest:(id)a3
{
  id v4 = a3;
  uint64_t v15 = 0;
  v16 = &v15;
  uint64_t v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__9;
  v19 = __Block_byref_object_dispose__9;
  id v20 = 0;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __59__SBHIconGridSizeClassDomain_iconGridSizeClassPassingTest___block_invoke;
  v12[3] = &unk_1E6AB0900;
  v12[4] = self;
  id v5 = v4;
  id v13 = v5;
  v14 = &v15;
  [(SBHIconGridSizeClassDomain *)self enumerateGridSizeClassesUsingBlock:v12];
  objc_super v6 = (void *)v16[5];
  if (!v6)
  {
    id v7 = [(SBHIconGridSizeClassDomain *)self fallbackDomain];
    uint64_t v8 = [v7 iconGridSizeClassPassingTest:v5];
    v9 = (void *)v16[5];
    v16[5] = v8;

    objc_super v6 = (void *)v16[5];
  }
  id v10 = v6;

  _Block_object_dispose(&v15, 8);
  return v10;
}

void __59__SBHIconGridSizeClassDomain_iconGridSizeClassPassingTest___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  id v7 = a2;
  objc_super v6 = objc_msgSend(*(id *)(a1 + 32), "infoForIconGridSizeClass:");
  if ((*(unsigned int (**)(void))(*(void *)(a1 + 40) + 16))())
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), a2);
    *a3 = 1;
  }
}

- (id)shortDescriptionForGridSizeClass:(id)a3
{
  return [(SBHIconGridSizeClassDomain *)self infoValueForGridSizeClass:a3 forKey:@"SBHIconGridSizeClassRegistrationInfoKeyShortDescription"];
}

- (id)archiveValueForGridSizeClass:(id)a3
{
  return [(SBHIconGridSizeClassDomain *)self infoValueForGridSizeClass:a3 forKey:@"SBHIconGridSizeClassRegistrationInfoKeyArchiveValue"];
}

- (id)gridSizeClassForDescription:(id)a3
{
  id v4 = a3;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __58__SBHIconGridSizeClassDomain_gridSizeClassForDescription___block_invoke;
  v8[3] = &unk_1E6AB0928;
  id v9 = v4;
  id v5 = v4;
  objc_super v6 = [(SBHIconGridSizeClassDomain *)self iconGridSizeClassPassingTest:v8];

  return v6;
}

uint64_t __58__SBHIconGridSizeClassDomain_gridSizeClassForDescription___block_invoke(uint64_t a1, void *a2)
{
  v3 = [a2 objectForKey:@"SBHIconGridSizeClassRegistrationInfoKeyDescription"];
  uint64_t v4 = [*(id *)(a1 + 32) isEqualToString:v3];

  return v4;
}

- (id)gridSizeClassForArchiveValue:(id)a3
{
  id v4 = a3;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __59__SBHIconGridSizeClassDomain_gridSizeClassForArchiveValue___block_invoke;
  v8[3] = &unk_1E6AB0928;
  id v9 = v4;
  id v5 = v4;
  objc_super v6 = [(SBHIconGridSizeClassDomain *)self iconGridSizeClassPassingTest:v8];

  return v6;
}

uint64_t __59__SBHIconGridSizeClassDomain_gridSizeClassForArchiveValue___block_invoke(uint64_t a1, void *a2)
{
  v3 = [a2 objectForKey:@"SBHIconGridSizeClassRegistrationInfoKeyArchiveValue"];
  uint64_t v4 = [*(id *)(a1 + 32) isEqualToString:v3];

  return v4;
}

- (BOOL)containsGridSizeClass:(id)a3
{
  v3 = [(SBHIconGridSizeClassDomain *)self infoForIconGridSizeClass:a3];
  BOOL v4 = v3 != 0;

  return v4;
}

- (SBHIconGridSizeClassSet)allGridSizeClasses
{
  allGridSizeClasses = self->_allGridSizeClasses;
  if (!allGridSizeClasses)
  {
    BOOL v4 = [[SBHDomainIconGridSizeClassSet alloc] initWithGridSizeClassDomain:self];
    id v5 = self->_allGridSizeClasses;
    self->_allGridSizeClasses = &v4->super;

    allGridSizeClasses = self->_allGridSizeClasses;
  }
  return allGridSizeClasses;
}

- (SBHIconGridSizeClassSet)allNonDefaultGridSizeClasses
{
  allNonDefaultGridSizeClasses = self->_allNonDefaultGridSizeClasses;
  if (!allNonDefaultGridSizeClasses)
  {
    BOOL v4 = [[SBHDomainIconGridSizeClassSet alloc] initWithGridSizeClassDomain:self filter:&__block_literal_global_15_1];
    id v5 = self->_allNonDefaultGridSizeClasses;
    self->_allNonDefaultGridSizeClasses = &v4->super;

    allNonDefaultGridSizeClasses = self->_allNonDefaultGridSizeClasses;
  }
  return allNonDefaultGridSizeClasses;
}

uint64_t __58__SBHIconGridSizeClassDomain_allNonDefaultGridSizeClasses__block_invoke(uint64_t a1, void *a2)
{
  if (a2) {
    return [a2 isEqualToString:@"SBHIconGridSizeClassDefault"] ^ 1;
  }
  else {
    return 0;
  }
}

- (void)enumerateGridSizeClassesUsingBlock:(id)a3
{
  id v4 = a3;
  id v5 = [(SBHIconGridSizeClassDomain *)self gridSizeClassOrder];
  id v6 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __65__SBHIconGridSizeClassDomain_enumerateGridSizeClassesUsingBlock___block_invoke;
  v15[3] = &unk_1E6AAE4E0;
  id v7 = v6;
  id v16 = v7;
  id v8 = v4;
  id v17 = v8;
  [v5 enumerateObjectsWithOptions:2 usingBlock:v15];
  id v9 = [(SBHIconGridSizeClassDomain *)self fallbackDomain];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __65__SBHIconGridSizeClassDomain_enumerateGridSizeClassesUsingBlock___block_invoke_2;
  v12[3] = &unk_1E6AB0970;
  id v13 = v7;
  id v14 = v8;
  id v10 = v8;
  id v11 = v7;
  [v9 enumerateGridSizeClassesUsingBlock:v12];
}

void __65__SBHIconGridSizeClassDomain_enumerateGridSizeClassesUsingBlock___block_invoke(uint64_t a1, void *a2)
{
  v3 = *(void **)(a1 + 32);
  id v4 = a2;
  [v3 addObject:v4];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __65__SBHIconGridSizeClassDomain_enumerateGridSizeClassesUsingBlock___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ((objc_msgSend(*(id *)(a1 + 32), "containsObject:") & 1) == 0)
  {
    [*(id *)(a1 + 32) addObject:v3];
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

- (void)enumerateGridSizeClassesFilteredBySet:(id)a3 usingBlock:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v6 = (void (**)(id, uint64_t, char *))a4;
  if (a3)
  {
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v7 = [a3 allGridSizeClasses];
    uint64_t v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v16;
      while (2)
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v16 != v10) {
            objc_enumerationMutation(v7);
          }
          uint64_t v12 = *(void *)(*((void *)&v15 + 1) + 8 * i);
          id v13 = [(SBHIconGridSizeClassDomain *)self infoForIconGridSizeClass:v12];
          if (v13)
          {
            char v14 = 0;
            v6[2](v6, v12, &v14);
            if (v14)
            {

              goto LABEL_14;
            }
          }
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
        if (v9) {
          continue;
        }
        break;
      }
    }
LABEL_14:
  }
  else
  {
    [(SBHIconGridSizeClassDomain *)self enumerateGridSizeClassesUsingBlock:v6];
  }
}

+ (id)effectiveGridSizeClassDomainForDomain:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    id v6 = v4;
  }
  else
  {
    id v6 = [a1 globalDomain];
  }
  id v7 = v6;

  return v7;
}

- (id)gridSizeClassOrder
{
  v6[1] = *MEMORY[0x1E4F143B8];
  v2 = [(SBHIconGridSizeClassDomain *)self registeredGridSizeClassOrder];
  v6[0] = @"SBHIconGridSizeClassDefault";
  id v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:1];
  id v4 = [v3 arrayByAddingObjectsFromArray:v2];

  return v4;
}

- (id)registeredGridSizeClassOrder
{
  return 0;
}

- (id)registeredGridSizeClasses
{
  return 0;
}

- (void)addIconGridSizeClassesToSet:(id)a3
{
  id v6 = a3;
  id v4 = [(SBHIconGridSizeClassDomain *)self registeredGridSizeClassOrder];
  if (v4) {
    [v6 addObjectsFromArray:v4];
  }
  id v5 = [(SBHIconGridSizeClassDomain *)self fallbackDomain];
  [v5 addIconGridSizeClassesToSet:v6];
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  id v4 = [SBHMutableIconGridSizeClassDomain alloc];
  return [(SBHIconGridSizeClassDomain *)v4 initWithIconGridSizeClassDomain:self];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_allNonDefaultGridSizeClasses, 0);
  objc_storeStrong((id *)&self->_allGridSizeClasses, 0);
}

- (unint64_t)atxStackLayoutSizeForIconGridSizeClass:(id)a3
{
  id v3 = [(SBHIconGridSizeClassDomain *)self infoValueForGridSizeClass:a3 forKey:@"SBHIconGridSizeClassRegistrationInfoKeyATXStackLayoutSize"];
  unint64_t v4 = [v3 integerValue];

  return v4;
}

- (id)iconGridSizeClassForATXStackLayoutSize:(unint64_t)a3
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __92__SBHIconGridSizeClassDomain_SBHATXStackLayoutSize__iconGridSizeClassForATXStackLayoutSize___block_invoke;
  v5[3] = &__block_descriptor_40_e22_B16__0__NSDictionary_8l;
  v5[4] = a3;
  id v3 = [(SBHIconGridSizeClassDomain *)self iconGridSizeClassPassingTest:v5];
  return v3;
}

BOOL __92__SBHIconGridSizeClassDomain_SBHATXStackLayoutSize__iconGridSizeClassForATXStackLayoutSize___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 objectForKey:@"SBHIconGridSizeClassRegistrationInfoKeyATXStackLayoutSize"];
  BOOL v4 = [v3 integerValue] == *(void *)(a1 + 32);

  return v4;
}

- (int64_t)chsWidgetFamilyForIconGridSizeClass:(id)a3
{
  id v3 = [(SBHIconGridSizeClassDomain *)self infoValueForGridSizeClass:a3 forKey:@"SBHIconGridSizeClassRegistrationInfoKeyCHSWidgetFamily"];
  int64_t v4 = [v3 integerValue];

  return v4;
}

- (id)iconGridSizeClassForCHSWidgetFamily:(int64_t)a3
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __86__SBHIconGridSizeClassDomain_SBHCHSWidgetFamily__iconGridSizeClassForCHSWidgetFamily___block_invoke;
  v5[3] = &__block_descriptor_40_e22_B16__0__NSDictionary_8l;
  v5[4] = a3;
  id v3 = [(SBHIconGridSizeClassDomain *)self iconGridSizeClassPassingTest:v5];
  return v3;
}

BOOL __86__SBHIconGridSizeClassDomain_SBHCHSWidgetFamily__iconGridSizeClassForCHSWidgetFamily___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 objectForKey:@"SBHIconGridSizeClassRegistrationInfoKeyCHSWidgetFamily"];
  BOOL v4 = [v3 integerValue] == *(void *)(a1 + 32);

  return v4;
}

- (unint64_t)filterKnownCHSWidgetFamilies:(unint64_t)a3
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x2020000000;
  uint64_t v10 = 0;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  void v6[2] = __79__SBHIconGridSizeClassDomain_SBHCHSWidgetFamily__filterKnownCHSWidgetFamilies___block_invoke;
  v6[3] = &unk_1E6AB2988;
  v6[4] = self;
  v6[5] = &v7;
  [(SBHIconGridSizeClassDomain *)self enumerateGridSizeClassesUsingBlock:v6];
  unint64_t v4 = v8[3] & a3;
  _Block_object_dispose(&v7, 8);
  return v4;
}

uint64_t __79__SBHIconGridSizeClassDomain_SBHCHSWidgetFamily__filterKnownCHSWidgetFamilies___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result = [*(id *)(a1 + 32) chsWidgetFamilyForIconGridSizeClass:a2];
  if (result) {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) |= 1 << result;
  }
  return result;
}

@end