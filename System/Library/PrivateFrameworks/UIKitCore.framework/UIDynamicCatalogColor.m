@interface UIDynamicCatalogColor
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (id)_debugCatalogBundleIdentifier;
- (id)_debugName;
- (id)_resolvedColorWithTraitCollection:(id)a3;
- (id)description;
- (id)initWithName:(void *)a3 assetManager:(void *)a4 genericColor:;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation UIDynamicCatalogColor

- (unint64_t)hash
{
  uint64_t v3 = [(_UIAssetManager *)self->_assetManager hash];
  return [(NSString *)self->_name hash] ^ v3;
}

- (id)initWithName:(void *)a3 assetManager:(void *)a4 genericColor:
{
  id v8 = a2;
  id v9 = a3;
  id v10 = a4;
  if (!a1) {
    goto LABEL_7;
  }
  if (v8)
  {
    if (v9) {
      goto LABEL_4;
    }
LABEL_9:
    v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:sel_initWithName_assetManager_genericColor_, a1, @"UIColor.m", 4768, @"Invalid parameter not satisfying: %@", @"assetManager != nil" object file lineNumber description];

    if (v10) {
      goto LABEL_5;
    }
    goto LABEL_10;
  }
  v13 = [MEMORY[0x1E4F28B00] currentHandler];
  [v13 handleFailureInMethod:sel_initWithName_assetManager_genericColor_, a1, @"UIColor.m", 4767, @"Invalid parameter not satisfying: %@", @"name != nil" object file lineNumber description];

  if (!v9) {
    goto LABEL_9;
  }
LABEL_4:
  if (v10) {
    goto LABEL_5;
  }
LABEL_10:
  v15 = [MEMORY[0x1E4F28B00] currentHandler];
  [v15 handleFailureInMethod:sel_initWithName_assetManager_genericColor_, a1, @"UIColor.m", 4769, @"Invalid parameter not satisfying: %@", @"genericColor != nil" object file lineNumber description];

LABEL_5:
  v16.receiver = a1;
  v16.super_class = (Class)UIDynamicCatalogColor;
  v11 = (id *)objc_msgSendSuper2(&v16, sel_init);
  a1 = v11;
  if (v11)
  {
    objc_storeStrong(v11 + 3, a2);
    objc_storeStrong(a1 + 4, a3);
    objc_storeStrong(a1 + 5, a4);
    *((_DWORD *)a1 + 12) = 0;
  }
LABEL_7:

  return a1;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (UIDynamicCatalogColor *)a3;
  if (self == v4)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
      && self->_assetManager == v4->_assetManager
      && [(NSString *)self->_name isEqualToString:v4->_name];
  }

  return v5;
}

- (id)_resolvedColorWithTraitCollection:(id)a3
{
  v4 = a3;
  os_unfair_lock_lock(&self->_cachedColorLock);
  unint64_t v5 = _UIThemeKeyValueFromTraitCollection(v4);
  unint64_t v6 = v5;
  if (self->_cachedColor && self->_cachedThemeKey == v5)
  {
    v7 = self->_cachedColor;
  }
  else
  {
    os_unfair_lock_unlock(&self->_cachedColorLock);
    id v8 = [(_UIAssetManager *)self->_assetManager resolvedColorNamed:self->_name withTraitCollection:v4];
    genericColor = v8;
    if (!v8) {
      genericColor = self->_genericColor;
    }
    v7 = genericColor;

    os_unfair_lock_lock(&self->_cachedColorLock);
    objc_storeStrong((id *)&self->_cachedColor, genericColor);
    self->_cachedThemeKey = v6;
  }
  os_unfair_lock_unlock(&self->_cachedColorLock);

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedColor, 0);
  objc_storeStrong((id *)&self->_genericColor, 0);
  objc_storeStrong((id *)&self->_assetManager, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  name = self->_name;
  id v5 = a3;
  [v5 encodeObject:name forKey:@"UIDynamicCatalogName"];
  assetManager = self->_assetManager;
  if (assetManager)
  {
    v7 = [(_UIAssetManager *)assetManager bundle];
    id v8 = [v7 bundleIdentifier];
    [v5 encodeObject:v8 forKey:@"UIDynamicCatalogBundleIdentifier"];

    id v9 = [v7 executablePath];
    id v10 = [v9 lastPathComponent];
    [v5 encodeObject:v10 forKey:@"UIDynamicCatalogBundleLibraryName"];
  }
  else
  {
    [v5 encodeBool:1 forKey:@"UIDynamicCatalogUseNibBundle"];
  }
  v11.receiver = self;
  v11.super_class = (Class)UIDynamicCatalogColor;
  [(UIColor *)&v11 encodeWithCoder:v5];
}

- (id)description
{
  uint64_t v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  unint64_t v6 = [v3 stringWithFormat:@"<%@: %p name = %@>", v5, self, self->_name];;

  return v6;
}

- (id)_debugName
{
  return self->_name;
}

- (id)_debugCatalogBundleIdentifier
{
  v2 = [(_UIAssetManager *)self->_assetManager bundle];
  uint64_t v3 = [v2 bundleIdentifier];

  return v3;
}

@end