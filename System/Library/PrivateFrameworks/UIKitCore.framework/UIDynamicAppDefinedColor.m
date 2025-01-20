@interface UIDynamicAppDefinedColor
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (id)_generateColorsByTraitCollection;
- (id)_resolvedColorWithTraitCollection:(id)a3;
- (id)description;
- (id)initWithColorsByTraitCollection:(id *)a1;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation UIDynamicAppDefinedColor

void __62__UIDynamicAppDefinedColor__resolvedColorWithTraitCollection___block_invoke(uint64_t a1, uint64_t a2, unsigned char *a3)
{
  uint64_t v5 = [*(id *)(*(void *)(a1 + 32) + 24) objectForKey:a2];
  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;

  if (*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)) {
    *a3 = 1;
  }
}

- (id)_resolvedColorWithTraitCollection:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  v4 = a3;
  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__107;
  v16 = __Block_byref_object_dispose__107;
  id v17 = 0;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __62__UIDynamicAppDefinedColor__resolvedColorWithTraitCollection___block_invoke;
  v11[3] = &unk_1E52F14C8;
  v11[4] = self;
  v11[5] = &v12;
  -[UITraitCollection _enumerateThemeKeysForLookup:](v4, (uint64_t)v11);
  int has_internal_diagnostics = os_variant_has_internal_diagnostics();
  uint64_t v6 = v13[5];
  if (has_internal_diagnostics)
  {
    if (!v6)
    {
      v9 = __UIFaultDebugAssertLog();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 138412290;
        v19 = self;
        _os_log_fault_impl(&dword_1853B0000, v9, OS_LOG_TYPE_FAULT, "Dynamic color couldn't be resolved: %@", buf, 0xCu);
      }
    }
  }
  else if (!v6)
  {
    v10 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &_resolvedColorWithTraitCollection____s_category_1835)
                       + 8);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v19 = self;
      _os_log_impl(&dword_1853B0000, v10, OS_LOG_TYPE_ERROR, "Dynamic color couldn't be resolved: %@", buf, 0xCu);
    }
  }
  id v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

void __60__UIDynamicAppDefinedColor_initWithColorsByTraitCollection___block_invoke(uint64_t a1, void *a2, void *a3)
{
  v8 = a2;
  id v5 = a3;
  uint64_t v6 = -[UITraitCollection _themeKey](v8);
  id v7 = [*(id *)(a1 + 32) objectForKey:v6];

  if (v7) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8], @"Dynamic color dictionary contains a redundant trait collection: %@", v8 format];
  }
  [*(id *)(a1 + 32) setObject:v5 forKey:v6];
}

- (unint64_t)hash
{
  return [(NSDictionary *)self->_colorsByThemeKey hash];
}

- (void).cxx_destruct
{
}

- (BOOL)isEqual:(id)a3
{
  v4 = (UIDynamicAppDefinedColor *)a3;
  if (self == v4)
  {
    char v5 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      char v5 = [(NSDictionary *)v4->_colorsByThemeKey isEqual:self->_colorsByThemeKey];
    }
    else {
      char v5 = 0;
    }
  }

  return v5;
}

- (id)initWithColorsByTraitCollection:(id *)a1
{
  v2 = a1;
  if (a1)
  {
    id v3 = a2;
    if (![v3 count]) {
      [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"Requires one or more colors"];
    }
    id v4 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    uint64_t v13 = MEMORY[0x1E4F143A8];
    uint64_t v14 = 3221225472;
    v15 = __60__UIDynamicAppDefinedColor_initWithColorsByTraitCollection___block_invoke;
    v16 = &unk_1E52F14F0;
    id v5 = v4;
    id v17 = v5;
    [v3 enumerateKeysAndObjectsUsingBlock:&v13];

    uint64_t v6 = _UIThemeKeyLeastSpecific();
    id v7 = [v5 objectForKeyedSubscript:v6];

    if (!v7) {
      [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8], @"Dynamic color dictionary must specify a fallback color with unspecified idiom, unspecified style, and unspecified or SRGB gamut" format];
    }
    id v8 = v5;
    if (![v8 count])
    {
      uint64_t v12 = [MEMORY[0x1E4F28B00] currentHandler];
      [v12 handleFailureInMethod:sel__initWithColorsByThemeKey_, v2, @"UIColor.m", 4913, @"Invalid parameter not satisfying: %@", @"colorsByThemeKey.count > 0", v13, v14, v15, v16 object file lineNumber description];
    }
    v18.receiver = v2;
    v18.super_class = (Class)UIDynamicAppDefinedColor;
    v9 = (id *)objc_msgSendSuper2(&v18, sel_init);
    v10 = v9;
    if (v9) {
      objc_storeStrong(v9 + 3, v4);
    }

    v2 = v10;
  }
  return v2;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = -[UIDynamicAppDefinedColor _generateColorsByTraitCollection]((id *)&self->super.super.super.isa);
  [v4 encodeObject:v5 forKey:@"UIDynamicAppDefinedColorsByTraitCollection"];

  v6.receiver = self;
  v6.super_class = (Class)UIDynamicAppDefinedColor;
  [(UIColor *)&v6 encodeWithCoder:v4];
}

- (id)_generateColorsByTraitCollection
{
  v1 = a1;
  if (a1)
  {
    v2 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(a1[3], "count"));
    id v3 = v1[3];
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __60__UIDynamicAppDefinedColor__generateColorsByTraitCollection__block_invoke;
    v5[3] = &unk_1E52F1518;
    v1 = v2;
    objc_super v6 = v1;
    [v3 enumerateKeysAndObjectsUsingBlock:v5];
  }
  return v1;
}

void __60__UIDynamicAppDefinedColor__generateColorsByTraitCollection__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = *(void **)(a1 + 32);
  id v5 = a3;
  self;
  _UITraitCollectionFromThemeKey(a2);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  [v4 setObject:v5 forKey:v6];
}

- (id)description
{
  id v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  id v6 = -[UIDynamicAppDefinedColor _generateColorsByTraitCollection]((id *)&self->super.super.super.isa);
  id v7 = [v3 stringWithFormat:@"<%@: %p colors = %@>", v5, self, v6];;

  return v7;
}

@end