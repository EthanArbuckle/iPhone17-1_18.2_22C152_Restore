@interface PSSpecifierDataSource
+ (PSSpecifierDataSource)sharedInstance;
+ (id)loadSpecifiersFromPlist:(id)a3 inBundle:(id)a4 target:(id)a5 stringsTable:(id)a6;
- (BOOL)areSpecifiersLoaded;
- (NSMutableArray)specifiers;
- (PSSpecifierDataSource)init;
- (id)observers;
- (id)observersOfClass:(Class)a3;
- (id)readPreferenceValue:(id)a3;
- (id)specifierForID:(id)a3;
- (id)specifiersForSpecifier:(id)a3 observer:(id)a4;
- (void)_clearAllSpecifiers;
- (void)_invalidateSpecifiersForObservers;
- (void)addObserver:(id)a3;
- (void)enumerateObserversOfClass:(Class)a3 usingBlock:(id)a4;
- (void)enumerateObserversUsingBlock:(id)a3;
- (void)loadSpecifiers;
- (void)performUpdates:(id)a3;
- (void)performUpdatesAnimated:(BOOL)a3 usingBlock:(id)a4;
- (void)reloadSpecifiers;
- (void)removeObserver:(id)a3;
- (void)setPreferenceValue:(id)a3 specifier:(id)a4;
@end

@implementation PSSpecifierDataSource

+ (PSSpecifierDataSource)sharedInstance
{
  if (sharedInstance_onceToken_1 != -1) {
    dispatch_once(&sharedInstance_onceToken_1, &__block_literal_global_22);
  }
  v3 = [MEMORY[0x1E4F29238] valueWithPointer:a1];
  v4 = [(id)sharedInstance_instanceCache objectForKeyedSubscript:v3];
  v5 = [v4 object];

  if (v5)
  {
    v6 = [v4 object];
  }
  else
  {
    v6 = objc_opt_new();
    uint64_t v7 = +[PSWeakReference weakReferenceWithObject:v6];

    [(id)sharedInstance_instanceCache setObject:v7 forKeyedSubscript:v3];
    v4 = (void *)v7;
  }

  return (PSSpecifierDataSource *)v6;
}

uint64_t __39__PSSpecifierDataSource_sharedInstance__block_invoke()
{
  uint64_t v0 = objc_opt_new();
  uint64_t v1 = sharedInstance_instanceCache;
  sharedInstance_instanceCache = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

- (PSSpecifierDataSource)init
{
  v8.receiver = self;
  v8.super_class = (Class)PSSpecifierDataSource;
  v2 = [(PSSpecifierDataSource *)&v8 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    observerRefs = v2->_observerRefs;
    v2->_observerRefs = (NSMutableSet *)v3;

    uint64_t v5 = objc_opt_new();
    specifiers = v2->_specifiers;
    v2->_specifiers = (NSMutableArray *)v5;
  }
  return v2;
}

- (void)addObserver:(id)a3
{
  if (a3)
  {
    observerRefs = self->_observerRefs;
    +[PSWeakReference weakReferenceWithObject:](PSWeakReference, "weakReferenceWithObject:");
    id v4 = (id)objc_claimAutoreleasedReturnValue();
    [(NSMutableSet *)observerRefs addObject:v4];
  }
}

- (void)removeObserver:(id)a3
{
  if (a3) {
    -[NSMutableSet removeObject:](self->_observerRefs, "removeObject:");
  }
}

- (id)observers
{
  return [(PSSpecifierDataSource *)self observersOfClass:0];
}

- (void)enumerateObserversUsingBlock:(id)a3
{
}

- (id)observersOfClass:(Class)a3
{
  uint64_t v5 = objc_msgSend(MEMORY[0x1E4F1CA80], "setWithCapacity:", -[NSMutableSet count](self->_observerRefs, "count"));
  observerRefs = self->_observerRefs;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __42__PSSpecifierDataSource_observersOfClass___block_invoke;
  v9[3] = &unk_1E5C5F420;
  Class v11 = a3;
  id v7 = v5;
  id v10 = v7;
  [(NSMutableSet *)observerRefs enumerateObjectsUsingBlock:v9];

  return v7;
}

uint64_t __42__PSSpecifierDataSource_observersOfClass___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 object];
  if (v3)
  {
    uint64_t v5 = v3;
    if (!*(void *)(a1 + 40) || (objc_opt_isKindOfClass() & 1) != 0) {
      [*(id *)(a1 + 32) addObject:v5];
    }
  }
  return MEMORY[0x1F4181820]();
}

- (void)enumerateObserversOfClass:(Class)a3 usingBlock:(id)a4
{
  id v6 = a4;
  observerRefs = self->_observerRefs;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __62__PSSpecifierDataSource_enumerateObserversOfClass_usingBlock___block_invoke;
  v9[3] = &unk_1E5C5F448;
  id v10 = v6;
  Class v11 = a3;
  id v8 = v6;
  [(NSMutableSet *)observerRefs enumerateObjectsUsingBlock:v9];
}

uint64_t __62__PSSpecifierDataSource_enumerateObserversOfClass_usingBlock___block_invoke(uint64_t a1, void *a2)
{
  if (objc_claimAutoreleasedReturnValue() && (!*(void *)(a1 + 40) || (objc_opt_isKindOfClass() & 1) ! = [a2 object]; {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  return MEMORY[0x1F4181820]();
}

- (void)performUpdates:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __40__PSSpecifierDataSource_performUpdates___block_invoke;
  v6[3] = &unk_1E5C5F470;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(PSSpecifierDataSource *)self enumerateObserversUsingBlock:v6];
}

uint64_t __40__PSSpecifierDataSource_performUpdates___block_invoke(uint64_t a1, void *a2)
{
  return [a2 dataSource:*(void *)(a1 + 32) performUpdates:*(void *)(a1 + 40)];
}

+ (id)loadSpecifiersFromPlist:(id)a3 inBundle:(id)a4 target:(id)a5 stringsTable:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  if (!v10)
  {
    id v10 = [MEMORY[0x1E4F28B50] mainBundle];
  }
  v13 = [v10 pathForResource:v9 ofType:@"plist"];
  if (v13)
  {
    v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithContentsOfFile:v13];
    v15 = SpecifiersFromPlist(v14, 0, v11, v12, v10, 0, 0, 0, 0);
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (void)_clearAllSpecifiers
{
  self->_specifiersLoaded = 0;
}

- (void)_invalidateSpecifiersForObservers
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __58__PSSpecifierDataSource__invalidateSpecifiersForObservers__block_invoke;
  v2[3] = &unk_1E5C5F498;
  v2[4] = self;
  [(PSSpecifierDataSource *)self enumerateObserversUsingBlock:v2];
}

uint64_t __58__PSSpecifierDataSource__invalidateSpecifiersForObservers__block_invoke(uint64_t a1, void *a2)
{
  return [a2 invalidateSpecifiersForDataSource:*(void *)(a1 + 32)];
}

- (id)specifiersForSpecifier:(id)a3 observer:(id)a4
{
  if (![(PSSpecifierDataSource *)self areSpecifiersLoaded])
  {
    [(PSSpecifierDataSource *)self loadSpecifiers];
    self->_specifiersLoaded = 1;
  }
  id v5 = (void *)MEMORY[0x1E4F1C978];
  specifiers = self->_specifiers;
  return (id)[v5 arrayWithArray:specifiers];
}

- (void)loadSpecifiers
{
}

- (BOOL)areSpecifiersLoaded
{
  return self->_specifiersLoaded;
}

- (void)reloadSpecifiers
{
  [(PSSpecifierDataSource *)self _clearAllSpecifiers];
  [(PSSpecifierDataSource *)self loadSpecifiers];
  self->_specifiersLoaded = 1;
  [(PSSpecifierDataSource *)self _invalidateSpecifiersForObservers];
}

- (void)performUpdatesAnimated:(BOOL)a3 usingBlock:(id)a4
{
  BOOL v4 = a3;
  id v6 = (void (**)(id, void *))a4;
  id v7 = [MEMORY[0x1E4F42948] currentDevice];
  if ([v7 sf_isInternalInstall])
  {
    char v8 = [MEMORY[0x1E4F29060] isMainThread];

    if (v8) {
      goto LABEL_6;
    }
    id v7 = _PSLoggingFacility();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[PSSpecifierDataSource performUpdatesAnimated:usingBlock:](v7);
    }
  }

LABEL_6:
  if (v6)
  {
    id v9 = +[PSSpecifierUpdates updatesWithSpecifiers:self->_specifiers];
    id v10 = [v9 context];
    [v10 setAnimated:v4];

    v6[2](v6, v9);
    id v11 = objc_alloc(MEMORY[0x1E4F1CA48]);
    id v12 = [v9 currentSpecifiers];
    v13 = (NSMutableArray *)[v11 initWithArray:v12];
    specifiers = self->_specifiers;
    self->_specifiers = v13;

    [(PSSpecifierDataSource *)self performUpdates:v9];
  }
}

- (id)specifierForID:(id)a3
{
  return (id)[(NSMutableArray *)self->_specifiers specifierForID:a3];
}

- (id)readPreferenceValue:(id)a3
{
  return +[PSRootController readPreferenceValue:a3];
}

- (void)setPreferenceValue:(id)a3 specifier:(id)a4
{
}

- (NSMutableArray)specifiers
{
  return self->_specifiers;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_specifiers, 0);
  objc_storeStrong((id *)&self->_observerRefs, 0);
}

- (void)performUpdatesAnimated:(NSObject *)a1 usingBlock:.cold.1(NSObject *a1)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4F29060] callStackSymbols];
  int v3 = 138412290;
  BOOL v4 = v2;
  _os_log_error_impl(&dword_1A6597000, a1, OS_LOG_TYPE_ERROR, "performUpdatesAnimated:usingBlock: is caled off the main thread from: %@", (uint8_t *)&v3, 0xCu);
}

@end