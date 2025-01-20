@interface _UIVisualStyleRegistry
+ (_UIVisualStyleRegistry)defaultRegistry;
+ (id)registryForIdiom:(int64_t)a3;
+ (id)registryForTraitEnvironment:(id)a3;
- (Class)visualStyleClassForStylableClass:(Class)a3;
- (Class)visualStyleClassForView:(id)a3;
- (_UIVisualStyleRegistry)init;
- (void)registerVisualStyleClass:(Class)a3 forStylableClass:(Class)a4;
@end

@implementation _UIVisualStyleRegistry

- (Class)visualStyleClassForView:(id)a3
{
  uint64_t v4 = objc_opt_class();
  return [(_UIVisualStyleRegistry *)self visualStyleClassForStylableClass:v4];
}

+ (id)registryForTraitEnvironment:(id)a3
{
  uint64_t v4 = [a3 traitCollection];
  v5 = objc_msgSend(a1, "registryForIdiom:", objc_msgSend(v4, "userInterfaceIdiom"));

  return v5;
}

+ (id)registryForIdiom:(int64_t)a3
{
  uint64_t v4 = (void *)__idiomToRegistry;
  if (!__idiomToRegistry)
  {
    uint64_t v5 = objc_opt_new();
    v6 = (void *)__idiomToRegistry;
    __idiomToRegistry = v5;

    uint64_t v4 = (void *)__idiomToRegistry;
  }
  v7 = [NSNumber numberWithInteger:a3];
  v8 = [v4 objectForKeyedSubscript:v7];

  if (!v8)
  {
    v8 = objc_opt_new();
    v9 = (void *)__idiomToRegistry;
    v10 = [NSNumber numberWithInteger:a3];
    [v9 setObject:v8 forKeyedSubscript:v10];
  }
  return v8;
}

- (Class)visualStyleClassForStylableClass:(Class)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  if (!a3)
  {
    v20 = [MEMORY[0x1E4F28B00] currentHandler];
    [v20 handleFailureInMethod:a2, self, @"_UIVisualStyleRegistry.m", 95, @"Invalid parameter not satisfying: %@", @"stylableClass != Nil" object file lineNumber description];
  }
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    v21 = [MEMORY[0x1E4F28B00] currentHandler];
    v22 = NSStringFromClass(a3);
    [v21 handleFailureInMethod:a2, self, @"_UIVisualStyleRegistry.m", 96, @"Cannot determine visual style class for class %@, since class does not conform to _UIVisualStyleStylable.", v22 object file lineNumber description];
  }
  v6 = [(objc_class *)a3 visualStyleRegistryIdentity];
  v7 = (void *)[(NSMutableDictionary *)self->__classToVisualStyleClass objectForKeyedSubscript:v6];
  v8 = [(NSMutableDictionary *)self->__classToVisualStyleClass allKeys];
  uint64_t v9 = [v8 count];

  if (!v9)
  {
    v10 = *(NSObject **)(__UILogGetCategoryCachedImpl("_UIVisualStyleRegistry", &_MergedGlobals_1263) + 8);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1853B0000, v10, OS_LOG_TYPE_DEFAULT, "Warning: no visual style classes have been registered at all.", buf, 2u);
    }
  }
  if (v7)
  {
    id v11 = v7;
LABEL_10:
    v12 = v11;
    goto LABEL_17;
  }
  v13 = [(id)objc_opt_class() defaultRegistry];

  if (v13 != self)
  {
    v14 = +[_UIVisualStyleRegistry defaultRegistry];
    v15 = (void *)[v14 visualStyleClassForStylableClass:a3];

    if (v15)
    {
      id v11 = v15;
      goto LABEL_10;
    }
  }
  v16 = *(NSObject **)(__UILogGetCategoryCachedImpl("_UIVisualStyleRegistry", &qword_1EB2647A8) + 8);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    v17 = v16;
    v18 = NSStringFromClass(a3);
    *(_DWORD *)buf = 138412290;
    v24 = v18;
    _os_log_impl(&dword_1853B0000, v17, OS_LOG_TYPE_DEFAULT, "Note: no default visual style class registered as fallback for stylable class %@", buf, 0xCu);
  }
  v12 = 0;
LABEL_17:

  return (Class)v12;
}

- (void)registerVisualStyleClass:(Class)a3 forStylableClass:(Class)a4
{
  if (a3 && (objc_opt_respondsToSelector() & 1) == 0)
  {
    v8 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v9 = NSStringFromClass(a4);
    [v8 handleFailureInMethod:a2, self, @"_UIVisualStyleRegistry.m", 126, @"Cannot determine visual style class for class %@, since class does not conform to _UIVisualStyleStylable.", v9 object file lineNumber description];
  }
  id v10 = [(objc_class *)a4 visualStyleRegistryIdentity];
  [(NSMutableDictionary *)self->__classToVisualStyleClass setObject:a3 forKeyedSubscript:v10];
}

+ (_UIVisualStyleRegistry)defaultRegistry
{
  v2 = (void *)__defaultVisualStyleRegistry;
  if (!__defaultVisualStyleRegistry)
  {
    uint64_t v3 = objc_opt_new();
    uint64_t v4 = (void *)__defaultVisualStyleRegistry;
    __defaultVisualStyleRegistry = v3;

    v2 = (void *)__defaultVisualStyleRegistry;
  }
  return (_UIVisualStyleRegistry *)v2;
}

- (_UIVisualStyleRegistry)init
{
  v6.receiver = self;
  v6.super_class = (Class)_UIVisualStyleRegistry;
  v2 = [(_UIVisualStyleRegistry *)&v6 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    classToVisualStyleClass = v2->__classToVisualStyleClass;
    v2->__classToVisualStyleClass = (NSMutableDictionary *)v3;
  }
  return v2;
}

- (void).cxx_destruct
{
}

@end