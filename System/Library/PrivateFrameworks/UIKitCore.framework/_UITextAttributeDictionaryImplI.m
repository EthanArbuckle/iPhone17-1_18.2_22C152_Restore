@interface _UITextAttributeDictionaryImplI
+ (BOOL)_isMutable;
+ (Class)_ignoringClass;
+ (Class)_storageClass;
- (BOOL)ignoresFallbackForKey:(id)a3;
- (BOOL)isEqualToDictionary:(id)a3;
- (BOOL)isNSDictionary__;
- (BOOL)usesFallbackForKey:(id)a3;
- (_UITextAttributeDictionaryImplI)init;
- (_UITextAttributeDictionaryImplI)initWithCapacity:(unint64_t)a3;
- (_UITextAttributeDictionaryImplI)initWithDictionary:(id)a3 copyItems:(BOOL)a4;
- (_UITextAttributeDictionaryImplI)initWithDictionary:(id)a3 fallback:(id)a4;
- (_UITextAttributeDictionaryImplI)initWithFallback:(id)a3;
- (id)_fullDictionary;
- (id)_initWithDictionary:(id)a3 copyItems:(BOOL)a4 fallback:(id)a5;
- (id)_initWithStorage:(id)a3 fallback:(id)a4 ignoring:(id)a5;
- (id)_keysIfThereIsFallback;
- (id)allKeys;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)fallback;
- (id)keyEnumerator;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (id)objectForKey:(id)a3;
- (id)sparseDictionary;
- (unint64_t)count;
- (unint64_t)hash;
@end

@implementation _UITextAttributeDictionaryImplI

- (BOOL)isNSDictionary__
{
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ignoring, 0);
  objc_storeStrong((id *)&self->_storage, 0);
  objc_storeStrong((id *)&self->_fallback, 0);
}

- (id)objectForKey:(id)a3
{
  id v4 = a3;
  v5 = [(NSMutableDictionary *)self->_storage objectForKey:v4];
  if (!v5)
  {
    if (self->_fallback
      && ![(_UITextAttributeDictionaryImplI *)self ignoresFallbackForKey:v4])
    {
      v6 = [(_UITextAttributeDefaults *)self->_fallback _attributes];
      v5 = [v6 objectForKey:v4];
    }
    else
    {
      v5 = 0;
    }
  }

  return v5;
}

- (BOOL)isEqualToDictionary:(id)a3
{
  id v4 = (_UITextAttributeDictionaryImplI *)a3;
  v5 = v4;
  if (v4 == self)
  {
    char v12 = 1;
  }
  else
  {
    if (v4)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v6 = v5;
        v7 = [(_UITextAttributeDictionaryImplI *)self _fullDictionary];
        v8 = [(_UITextAttributeDictionaryImplI *)v6 _fullDictionary];
        v9 = v7;
        v10 = v8;
        v11 = v10;
        if (v9 == v10)
        {
          char v12 = 1;
        }
        else
        {
          char v12 = 0;
          if (v9 && v10) {
            char v12 = [(_UITextAttributeDictionaryImplI *)v9 isEqual:v10];
          }
        }

        goto LABEL_19;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v9 = [(_UITextAttributeDictionaryImplI *)self _fullDictionary];
        v11 = v5;
        if (v9 == v11)
        {
          char v12 = 1;
        }
        else if (v9)
        {
          char v12 = [(_UITextAttributeDictionaryImplI *)v9 isEqual:v11];
        }
        else
        {
          char v12 = 0;
        }
        v6 = v9;
LABEL_19:

        goto LABEL_20;
      }
    }
    char v12 = 0;
  }
LABEL_20:

  return v12;
}

- (id)_fullDictionary
{
  if (!self->_fallback) {
    goto LABEL_6;
  }
  uint64_t v3 = [(NSMutableDictionary *)self->_storage count];
  fallback = self->_fallback;
  if (v3)
  {
    v5 = [(_UITextAttributeDefaults *)fallback _attributes];
    v6 = (void *)[v5 mutableCopy];

    [v6 addEntriesFromDictionary:self->_storage];
    v7 = (NSMutableDictionary *)[v6 copy];

    goto LABEL_10;
  }
  if (fallback)
  {
    v8 = [(_UITextAttributeDefaults *)fallback _attributes];
  }
  else
  {
LABEL_6:
    storage = self->_storage;
    if (!storage) {
      storage = (NSMutableDictionary *)MEMORY[0x1E4F1CC08];
    }
    v8 = storage;
  }
  v7 = v8;
LABEL_10:
  return v7;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  id v4 = [_UITextAttributeDictionaryImplM alloc];
  v5 = (void *)[(NSMutableDictionary *)self->_storage mutableCopy];
  fallback = self->_fallback;
  v7 = (void *)[(NSMutableSet *)self->_ignoring mutableCopy];
  id v8 = [(_UITextAttributeDictionaryImplI *)v4 _initWithStorage:v5 fallback:fallback ignoring:v7];

  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [_UITextAttributeDictionaryImplI alloc];
  v5 = (void *)[(NSMutableDictionary *)self->_storage copy];
  fallback = self->_fallback;
  v7 = (void *)[(NSMutableSet *)self->_ignoring copy];
  id v8 = [(_UITextAttributeDictionaryImplI *)v4 _initWithStorage:v5 fallback:fallback ignoring:v7];

  return v8;
}

- (id)_initWithStorage:(id)a3 fallback:(id)a4 ignoring:(id)a5
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v22.receiver = self;
  v22.super_class = (Class)_UITextAttributeDictionaryImplI;
  v11 = [(_UITextAttributeDictionaryImplI *)&v22 init];
  if (!v11) {
    goto LABEL_8;
  }
  int has_internal_diagnostics = os_variant_has_internal_diagnostics();
  storage = v11->_storage;
  if (has_internal_diagnostics)
  {
    if (storage)
    {
      v18 = __UIFaultDebugAssertLog();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT))
      {
        uint64_t v19 = objc_opt_class();
        *(_DWORD *)buf = 138412290;
        uint64_t v24 = v19;
        _os_log_fault_impl(&dword_1853B0000, v18, OS_LOG_TYPE_FAULT, "%@ initialized with nil storage", buf, 0xCu);
      }
      goto LABEL_14;
    }
  }
  else if (storage)
  {
    v20 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &_initWithStorage_fallback_ignoring____s_category) + 8);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      v18 = v20;
      uint64_t v21 = objc_opt_class();
      *(_DWORD *)buf = 138412290;
      uint64_t v24 = v21;
      _os_log_impl(&dword_1853B0000, v18, OS_LOG_TYPE_ERROR, "%@ initialized with nil storage", buf, 0xCu);
LABEL_14:
    }
  }
  if (v8)
  {
    v14 = (NSMutableDictionary *)v8;
    v15 = v11->_storage;
    v11->_storage = v14;
  }
  else
  {
    [(id)objc_opt_class() _storageClass];
    v15 = (NSMutableDictionary *)(id)objc_opt_new();
    v16 = v11->_storage;
    v11->_storage = v15;
  }
  objc_storeStrong((id *)&v11->_fallback, a4);
  objc_storeStrong((id *)&v11->_ignoring, a5);
  [(_UITextAttributeDictionaryImplI *)v11 _removeFallbackFromStorage];
LABEL_8:

  return v11;
}

- (id)keyEnumerator
{
  uint64_t v3 = [(_UITextAttributeDictionaryImplI *)self _keysIfThereIsFallback];
  id v4 = v3;
  if (v3) {
    [v3 objectEnumerator];
  }
  else {
  v5 = [(NSMutableDictionary *)self->_storage keyEnumerator];
  }

  return v5;
}

- (unint64_t)count
{
  storage = [(_UITextAttributeDictionaryImplI *)self _keysIfThereIsFallback];
  id v4 = storage;
  if (!storage) {
    storage = self->_storage;
  }
  unint64_t v5 = [storage count];

  return v5;
}

- (id)_keysIfThereIsFallback
{
  uint64_t v3 = [(_UITextAttributeDefaults *)self->_fallback _attributes];
  if (v3)
  {
    id v4 = (void *)MEMORY[0x1E4F1CAD0];
    unint64_t v5 = [(NSMutableDictionary *)self->_storage allKeys];
    v6 = [v4 setWithArray:v5];

    v7 = [v3 allKeys];
    id v8 = [v6 setByAddingObjectsFromArray:v7];
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

- (_UITextAttributeDictionaryImplI)init
{
  [(id)objc_opt_class() _storageClass];
  uint64_t v3 = objc_opt_new();
  id v4 = [(_UITextAttributeDictionaryImplI *)self _initWithStorage:v3 fallback:0 ignoring:0];

  return v4;
}

+ (BOOL)_isMutable
{
  return 0;
}

+ (Class)_storageClass
{
  return (Class)objc_opt_class();
}

+ (Class)_ignoringClass
{
  return (Class)objc_opt_class();
}

- (_UITextAttributeDictionaryImplI)initWithDictionary:(id)a3 fallback:(id)a4
{
  return (_UITextAttributeDictionaryImplI *)[(_UITextAttributeDictionaryImplI *)self _initWithDictionary:a3 copyItems:0 fallback:a4];
}

- (_UITextAttributeDictionaryImplI)initWithDictionary:(id)a3 copyItems:(BOOL)a4
{
  return (_UITextAttributeDictionaryImplI *)[(_UITextAttributeDictionaryImplI *)self _initWithDictionary:a3 copyItems:a4 fallback:0];
}

- (id)_initWithDictionary:(id)a3 copyItems:(BOOL)a4 fallback:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = a5;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if ([(id)objc_opt_class() _isMutable]) {
      uint64_t v10 = [v8 mutableCopy];
    }
    else {
      uint64_t v10 = [v8 copy];
    }
    v16 = (void *)v10;
  }
  else
  {
    v11 = objc_opt_class();
    if (v8)
    {
      int v12 = [v11 _isMutable];
      v13 = (Class *)0x1E4F1CA60;
      if (!v12) {
        v13 = (Class *)0x1E4F1C9E8;
      }
      v14 = (void *)[objc_alloc(*v13) initWithDictionary:v8 copyItems:v6];
      id v15 = objc_alloc((Class)objc_opt_class());
    }
    else
    {
      id v17 = objc_alloc((Class)v11);
      [(id)objc_opt_class() _storageClass];
      v14 = objc_opt_new();
      id v15 = v17;
    }
    v16 = (void *)[v15 _initWithStorage:v14 fallback:v9 ignoring:0];
  }
  return v16;
}

- (_UITextAttributeDictionaryImplI)initWithCapacity:(unint64_t)a3
{
  id v4 = objc_msgSend(objc_alloc((Class)objc_msgSend((id)objc_opt_class(), "_storageClass")), "initWithCapacity:", a3);
  unint64_t v5 = [(_UITextAttributeDictionaryImplI *)self _initWithStorage:v4 fallback:0 ignoring:0];

  return v5;
}

- (_UITextAttributeDictionaryImplI)initWithFallback:(id)a3
{
  id v4 = a3;
  [(id)objc_opt_class() _storageClass];
  unint64_t v5 = objc_opt_new();
  BOOL v6 = [(_UITextAttributeDictionaryImplI *)self _initWithStorage:v5 fallback:v4 ignoring:0];

  return v6;
}

- (id)allKeys
{
  uint64_t v3 = [(_UITextAttributeDictionaryImplI *)self _keysIfThereIsFallback];
  id v4 = v3;
  if (v3) {
    [v3 allObjects];
  }
  else {
  unint64_t v5 = [(NSMutableDictionary *)self->_storage allKeys];
  }

  return v5;
}

- (id)fallback
{
  return self->_fallback;
}

- (BOOL)usesFallbackForKey:(id)a3
{
  id v4 = a3;
  if (v4 && (storage = self->_storage) != 0 && CFDictionaryContainsKey((CFDictionaryRef)storage, v4))
  {
    BOOL v6 = 0;
  }
  else
  {
    CFDictionaryRef v7 = [(_UITextAttributeDefaults *)self->_fallback _attributes];
    CFDictionaryRef v8 = v7;
    BOOL v6 = 0;
    if (v4 && v7) {
      BOOL v6 = CFDictionaryContainsKey(v7, v4) != 0;
    }
  }
  return v6;
}

- (BOOL)ignoresFallbackForKey:(id)a3
{
  return [(NSMutableSet *)self->_ignoring containsObject:a3];
}

- (id)sparseDictionary
{
  char v3 = [(id)objc_opt_class() _isMutable];
  storage = self->_storage;
  if (v3) {
    unint64_t v5 = (NSMutableDictionary *)[(NSMutableDictionary *)storage copy];
  }
  else {
    unint64_t v5 = storage;
  }
  return v5;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSMutableDictionary *)self->_storage hash];
  uint64_t v4 = [(NSMutableSet *)self->_ignoring hash] ^ v3;
  return v4 ^ [(_UITextAttributeDefaults *)self->_fallback hash];
}

- (id)description
{
  uint64_t v3 = [(_UITextAttributeDefaults *)self->_fallback _attributes];
  if ([v3 count])
  {
    uint64_t v4 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", -[NSMutableDictionary count](self->_storage, "count") + objc_msgSend(v3, "count"));
    [v4 addEntriesFromDictionary:self->_storage];
    uint64_t v10 = MEMORY[0x1E4F143A8];
    uint64_t v11 = 3221225472;
    int v12 = __46___UITextAttributeDictionaryImplI_description__block_invoke;
    v13 = &unk_1E52DA238;
    v14 = self;
    id v15 = v4;
    id v5 = v4;
    [v3 enumerateKeysAndObjectsUsingBlock:&v10];
    BOOL v6 = objc_msgSend(v5, "description", v10, v11, v12, v13, v14);
    CFDictionaryRef v7 = objc_msgSend(v6, "stringByReplacingOccurrencesOfString:withString:", @"\"\\U100000", @"(");

    CFDictionaryRef v8 = [v7 stringByReplacingOccurrencesOfString:@"\\U100000\" withString:@"""]);
  }
  else
  {
    CFDictionaryRef v8 = [(NSMutableDictionary *)self->_storage description];
  }

  return v8;
}

@end