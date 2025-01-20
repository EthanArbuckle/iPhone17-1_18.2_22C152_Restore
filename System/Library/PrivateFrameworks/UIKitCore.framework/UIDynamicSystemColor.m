@interface UIDynamicSystemColor
- (BOOL)isEqual:(id)a3;
- (id)_resolvedColorWithTraitCollection:(id)a3;
- (id)description;
- (id)initWithName:(void *)a3 colorsByThemeKey:;
- (unint64_t)hash;
@end

@implementation UIDynamicSystemColor

- (unint64_t)hash
{
  v2 = [(UIColor *)self _systemColorName];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (id)_resolvedColorWithTraitCollection:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v16 = 0;
  v17 = (id *)&v16;
  uint64_t v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__107;
  v20 = __Block_byref_object_dispose__107;
  id v21 = 0;
  v5 = _UITraitCollectionReplacingStyleForBackgroundColorIfNeccessary(v4, self);

  os_unfair_lock_lock(&self->_cachedColorLock);
  unint64_t v6 = _UIThemeKeyValueFromTraitCollection(v5);
  unint64_t v7 = v6;
  cachedColor = self->_cachedColor;
  if (cachedColor && self->_cachedThemeKey == v6)
  {
    objc_storeStrong(v17 + 5, cachedColor);
  }
  else
  {
    os_unfair_lock_unlock(&self->_cachedColorLock);
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __58__UIDynamicSystemColor__resolvedColorWithTraitCollection___block_invoke;
    v15[3] = &unk_1E52F14C8;
    v15[4] = self;
    v15[5] = &v16;
    -[UITraitCollection _enumerateThemeKeysForLookup:](v5, (uint64_t)v15);
    os_unfair_lock_lock(&self->_cachedColorLock);
    objc_storeStrong((id *)&self->_cachedColor, v17[5]);
    self->_cachedThemeKey = v7;
  }
  os_unfair_lock_unlock(&self->_cachedColorLock);
  int has_internal_diagnostics = os_variant_has_internal_diagnostics();
  id v10 = v17[5];
  if (has_internal_diagnostics)
  {
    if (!v10)
    {
      v13 = __UIFaultDebugAssertLog();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 138412290;
        v23 = self;
        _os_log_fault_impl(&dword_1853B0000, v13, OS_LOG_TYPE_FAULT, "Dynamic color couldn't be resolved: %@", buf, 0xCu);
      }
    }
  }
  else if (!v10)
  {
    v14 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &_resolvedColorWithTraitCollection____s_category) + 8);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v23 = self;
      _os_log_impl(&dword_1853B0000, v14, OS_LOG_TYPE_ERROR, "Dynamic color couldn't be resolved: %@", buf, 0xCu);
    }
  }
  id v11 = v17[5];
  _Block_object_dispose(&v16, 8);

  return v11;
}

void __58__UIDynamicSystemColor__resolvedColorWithTraitCollection___block_invoke(uint64_t a1, uint64_t a2, unsigned char *a3)
{
  uint64_t v5 = [*(id *)(*(void *)(a1 + 32) + 24) objectForKey:a2];
  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  unint64_t v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;

  if (*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)) {
    *a3 = 1;
  }
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (UIDynamicSystemColor *)a3;
  if (self == v4)
  {
    char v7 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v5 = [(UIColor *)v4 _systemColorName];
      uint64_t v6 = [(UIColor *)self _systemColorName];
      char v7 = [v5 isEqualToString:v6];
    }
    else
    {
      char v7 = 0;
    }
  }

  return v7;
}

- (id)initWithName:(void *)a3 colorsByThemeKey:
{
  id v5 = a2;
  id v6 = a3;
  if (a1)
  {
    int has_internal_diagnostics = os_variant_has_internal_diagnostics();
    uint64_t v8 = [v5 length];
    if (has_internal_diagnostics)
    {
      if (!v8)
      {
        v15 = __UIFaultDebugAssertLog();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_fault_impl(&dword_1853B0000, v15, OS_LOG_TYPE_FAULT, "bad color name", buf, 2u);
        }
      }
    }
    else if (!v8)
    {
      v17 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &qword_1EB25DE78) + 8);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1853B0000, v17, OS_LOG_TYPE_ERROR, "bad color name", buf, 2u);
      }
    }
    int v9 = os_variant_has_internal_diagnostics();
    id v10 = _UIThemeKeyLeastSpecific();
    id v11 = [v6 objectForKeyedSubscript:v10];

    if (v9)
    {
      if (!v11)
      {
        uint64_t v16 = __UIFaultDebugAssertLog();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_fault_impl(&dword_1853B0000, v16, OS_LOG_TYPE_FAULT, "must specify an 'any' fallback color", buf, 2u);
        }
      }
    }
    else if (!v11)
    {
      uint64_t v18 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &qword_1EB25DE80) + 8);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1853B0000, v18, OS_LOG_TYPE_ERROR, "must specify an 'any' fallback color", buf, 2u);
      }
    }
    v19.receiver = a1;
    v19.super_class = (Class)UIDynamicSystemColor;
    a1 = objc_msgSendSuper2(&v19, sel_init);
    if (a1)
    {
      uint64_t v12 = [v6 copy];
      v13 = (void *)*((void *)a1 + 3);
      *((void *)a1 + 3) = v12;

      [a1 _setSystemColorName:v5];
      *((_DWORD *)a1 + 8) = 0;
    }
  }

  return a1;
}

- (id)description
{
  unint64_t v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  id v6 = [(UIColor *)self _systemColorName];
  char v7 = [v3 stringWithFormat:@"<%@: %p name = %@>", v5, self, v6];;

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedColor, 0);
  objc_storeStrong((id *)&self->_colorsByThemeKey, 0);
}

@end