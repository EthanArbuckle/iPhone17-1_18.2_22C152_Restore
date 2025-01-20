@interface UIDynamicCatalogSystemColor
- (BOOL)isEqual:(id)a3;
- (id)_resolvedColorWithTraitCollection:(id)a3;
- (id)description;
- (unint64_t)hash;
- (void)initWithName:(uint64_t)a3 coreUIColorName:;
@end

@implementation UIDynamicCatalogSystemColor

- (unint64_t)hash
{
  v2 = [(UIColor *)self _systemColorName];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (id)_resolvedColorWithTraitCollection:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  v4 = _UITraitCollectionReplacingStyleForBackgroundColorIfNeccessary(a3, self);
  unint64_t v5 = _UIThemeKeyValueFromTraitCollection(v4);
  os_unfair_lock_lock(&self->_colorCacheLock);
  cachedColor = self->_cachedColor;
  if (cachedColor && self->_cachedThemeKey == v5)
  {
    v7 = cachedColor;
  }
  else
  {
    v23 = (objc_class *)v5;
    os_unfair_lock_unlock(&self->_colorCacheLock);
    int64_t cuiColorName = self->_cuiColorName;
    v9 = v4;
    uint64_t v10 = 4 * ([v9 userInterfaceIdiom] == 3);
    BOOL v11 = [v9 userInterfaceStyle] == 2;
    BOOL v12 = [v9 accessibilityContrast] == 1;
    BOOL v13 = [v9 _vibrancy] == 2;
    uint64_t v14 = [v9 displayGamut];

    id v24 = 0;
    *(void *)buf = cuiColorName;
    *(void *)&buf[8] = v10;
    *(void *)&buf[16] = 0;
    BOOL v26 = v11;
    BOOL v27 = v12;
    BOOL v28 = v13;
    BOOL v29 = v14 == 1;
    v15 = [MEMORY[0x1E4F5E050] colorWithTraits:buf error:&v24];
    id v16 = v24;
    if (v15)
    {
      v7 = -[UIColor initWithCGColor:]([UIColor alloc], "initWithCGColor:", [v15 cgColor]);
      p_cachedColor = &self->_cachedColor;
      v17 = v23;
      v19 = &OBJC_IVAR____UIFindNavigatorViewController__findNavigatorView;
    }
    else
    {
      if (os_variant_has_internal_diagnostics())
      {
        v22 = __UIFaultDebugAssertLog();
        p_cachedColor = &self->_cachedColor;
        v17 = v23;
        v19 = &OBJC_IVAR____UIFindNavigatorViewController__findNavigatorView;
        if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 134218242;
          *(void *)&buf[4] = cuiColorName;
          *(_WORD *)&buf[12] = 2112;
          *(void *)&buf[14] = v16;
          _os_log_fault_impl(&dword_1853B0000, v22, OS_LOG_TYPE_FAULT, "Unable to lookup color %tu in CoreUI: %@", buf, 0x16u);
        }
      }
      else
      {
        v20 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &_UIColorFromCoreUI___s_category) + 8);
        p_cachedColor = &self->_cachedColor;
        v17 = v23;
        v19 = &OBJC_IVAR____UIFindNavigatorViewController__findNavigatorView;
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 134218242;
          *(void *)&buf[4] = cuiColorName;
          *(_WORD *)&buf[12] = 2112;
          *(void *)&buf[14] = v16;
          _os_log_impl(&dword_1853B0000, v20, OS_LOG_TYPE_ERROR, "Unable to lookup color %tu in CoreUI: %@", buf, 0x16u);
        }
      }
      v7 = +[UIColor clearColor];
    }

    os_unfair_lock_lock(&self->_colorCacheLock);
    objc_storeStrong((id *)p_cachedColor, v7);
    *(Class *)((char *)&self->super.super.super.isa + v19[566]) = v17;
  }
  os_unfair_lock_unlock(&self->_colorCacheLock);

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (UIDynamicCatalogSystemColor *)a3;
  if (self == v4)
  {
    char v7 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      unint64_t v5 = [(UIColor *)v4 _systemColorName];
      v6 = [(UIColor *)self _systemColorName];
      char v7 = [v5 isEqualToString:v6];
    }
    else
    {
      char v7 = 0;
    }
  }

  return v7;
}

- (void)initWithName:(uint64_t)a3 coreUIColorName:
{
  id v5 = a2;
  if (a1)
  {
    int has_internal_diagnostics = os_variant_has_internal_diagnostics();
    uint64_t v7 = [v5 length];
    if (has_internal_diagnostics)
    {
      if (!v7)
      {
        uint64_t v10 = __UIFaultDebugAssertLog();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_fault_impl(&dword_1853B0000, v10, OS_LOG_TYPE_FAULT, "bad color name", buf, 2u);
        }
      }
    }
    else if (!v7)
    {
      BOOL v11 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &initWithName_coreUIColorName____s_category) + 8);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1853B0000, v11, OS_LOG_TYPE_ERROR, "bad color name", buf, 2u);
      }
    }
    v12.receiver = a1;
    v12.super_class = (Class)UIDynamicCatalogSystemColor;
    id v8 = objc_msgSendSuper2(&v12, sel_init);
    a1 = v8;
    if (v8)
    {
      *((_DWORD *)v8 + 8) = 0;
      *((void *)v8 + 3) = a3;
      [v8 _setSystemColorName:v5];
    }
  }

  return a1;
}

- (id)description
{
  unint64_t v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  v6 = [(UIColor *)self _systemColorName];
  uint64_t v7 = [v3 stringWithFormat:@"<%@: %p name = %@>", v5, self, v6];;

  return v7;
}

- (void).cxx_destruct
{
}

@end