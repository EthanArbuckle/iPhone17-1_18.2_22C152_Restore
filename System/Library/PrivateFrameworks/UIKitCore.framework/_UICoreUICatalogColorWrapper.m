@interface _UICoreUICatalogColorWrapper
- (BOOL)_uikit_variesByTraitCollections;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToCoreUICatalogColor:(id)a3;
- (CGColor)cgColorForTraitCollection:(id)a3;
- (NSString)bundleID;
- (NSString)name;
- (UIColor)color;
- (UIColor)fallbackColor;
- (_UICoreUICatalogColorWrapper)initWithCoder:(id)a3;
- (_UICoreUICatalogColorWrapper)initWithName:(id)a3 bundleID:(id)a4 fallbackColor:(id)a5;
- (id)_uikit_valueForTraitCollection:(id)a3;
- (id)bundle;
- (id)cachedColorForDisplayGamut:(int64_t)a3;
- (id)colorCache;
- (id)description;
- (id)nibLoadingBundle;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setCachedColor:(id)a3 forDisplayGamut:(int64_t)a4;
@end

@implementation _UICoreUICatalogColorWrapper

- (_UICoreUICatalogColorWrapper)initWithName:(id)a3 bundleID:(id)a4 fallbackColor:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v18.receiver = self;
  v18.super_class = (Class)_UICoreUICatalogColorWrapper;
  v12 = [(_UICoreUICatalogColorWrapper *)&v18 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_name, a3);
    objc_storeStrong((id *)&v13->_bundleID, a4);
    objc_storeStrong((id *)&v13->_fallbackColor, a5);
    if (!v13->_bundleID)
    {
      v14 = [MEMORY[0x1E4F28B50] currentNibLoadingBundle];
      uint64_t v15 = [v14 bundleIdentifier];
      nibLoadingBundleID = v13->_nibLoadingBundleID;
      v13->_nibLoadingBundleID = (NSString *)v15;
    }
  }

  return v13;
}

- (id)bundle
{
  return (id)[MEMORY[0x1E4F28B50] bundleWithIdentifier:self->_bundleID];
}

- (id)nibLoadingBundle
{
  return (id)[MEMORY[0x1E4F28B50] bundleWithIdentifier:self->_nibLoadingBundleID];
}

- (id)colorCache
{
  colorCache = self->_colorCache;
  if (!colorCache)
  {
    v4 = [MEMORY[0x1E4F1CA60] dictionary];
    v5 = self->_colorCache;
    self->_colorCache = v4;

    colorCache = self->_colorCache;
  }
  return colorCache;
}

- (id)cachedColorForDisplayGamut:(int64_t)a3
{
  v4 = [(_UICoreUICatalogColorWrapper *)self colorCache];
  v5 = [NSNumber numberWithInteger:a3];
  v6 = [v4 objectForKey:v5];

  return v6;
}

- (void)setCachedColor:(id)a3 forDisplayGamut:(int64_t)a4
{
  id v6 = a3;
  id v8 = [(_UICoreUICatalogColorWrapper *)self colorCache];
  v7 = [NSNumber numberWithInteger:a4];
  [v8 setObject:v6 forKey:v7];
}

- (CGColor)cgColorForTraitCollection:(id)a3
{
  id v3 = [(_UICoreUICatalogColorWrapper *)self _uikit_valueForTraitCollection:a3];
  v4 = (CGColor *)[v3 CGColor];

  return v4;
}

- (BOOL)_uikit_variesByTraitCollections
{
  return 1;
}

- (id)_uikit_valueForTraitCollection:(id)a3
{
  id v4 = a3;
  uint64_t v20 = 0;
  v21 = &v20;
  uint64_t v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__118;
  v24 = __Block_byref_object_dispose__118;
  id v25 = 0;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __63___UICoreUICatalogColorWrapper__uikit_valueForTraitCollection___block_invoke;
  aBlock[3] = &unk_1E52F2FD0;
  v19 = &v20;
  aBlock[4] = self;
  id v5 = v4;
  id v18 = v5;
  id v6 = _Block_copy(aBlock);
  v7 = (void (**)(void, void))v6;
  if (self->_bundleID)
  {
    (*((void (**)(void *))v6 + 2))(v6);
  }
  else
  {
    (*((void (**)(void *, NSString *))v6 + 2))(v6, self->_nibLoadingBundleID);
    id v8 = _UIMainBundleIdentifier();
    ((void (**)(void, void *))v7)[2](v7, v8);
  }
  fallbackColor = (UIColor *)v21[5];
  if (!fallbackColor)
  {
    if (self->_hasLoggedFailure) {
      goto LABEL_6;
    }
    id v10 = [MEMORY[0x1E4F1CA48] array];
    id v11 = v10;
    if (self->_bundleID)
    {
      objc_msgSend(v10, "addObject:");
    }
    else
    {
      if (self->_nibLoadingBundleID) {
        objc_msgSend(v10, "addObject:");
      }
      v12 = _UIMainBundleIdentifier();
      [v11 addObject:v12];
    }
    name = self->_name;
    v14 = [v11 componentsJoinedByString:@", "];
    NSLog(&cfstr_WarningUnableT.isa, name, v14);

    self->_hasLoggedFailure = 1;
    fallbackColor = (UIColor *)v21[5];
    if (!fallbackColor) {
LABEL_6:
    }
      fallbackColor = self->_fallbackColor;
  }
  uint64_t v15 = fallbackColor;

  _Block_object_dispose(&v20, 8);
  return v15;
}

- (_UICoreUICatalogColorWrapper)initWithCoder:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)_UICoreUICatalogColorWrapper;
  id v5 = [(_UICoreUICatalogColorWrapper *)&v16 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectForKey:@"UIAssetName"];
    name = v5->_name;
    v5->_name = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectForKey:@"UIAssetBundleID"];
    bundleID = v5->_bundleID;
    v5->_bundleID = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectForKey:@"UIFallbackColor"];
    fallbackColor = v5->_fallbackColor;
    v5->_fallbackColor = (UIColor *)v10;

    if (!v5->_bundleID)
    {
      v12 = [MEMORY[0x1E4F28B50] currentNibLoadingBundle];
      uint64_t v13 = [v12 bundleIdentifier];
      nibLoadingBundleID = v5->_nibLoadingBundleID;
      v5->_nibLoadingBundleID = (NSString *)v13;
    }
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  name = self->_name;
  id v5 = a3;
  [v5 encodeObject:name forKey:@"UIAssetName"];
  [v5 encodeObject:self->_bundleID forKey:@"UIAssetBundleID"];
  [v5 encodeObject:self->_fallbackColor forKey:@"UIFallbackColor"];
}

- (id)description
{
  id v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  if (self->_bundleID) {
    bundleID = (__CFString *)self->_bundleID;
  }
  else {
    bundleID = @"<main>";
  }
  v7 = [(_UICoreUICatalogColorWrapper *)self name];
  uint64_t v8 = [v3 stringWithFormat:@"<%@: %p: %@ %@>", v5, self, bundleID, v7];

  return v8;
}

- (BOOL)isEqualToCoreUICatalogColor:(id)a3
{
  id v5 = (_UICoreUICatalogColorWrapper *)a3;
  if (v5 == self)
  {
    char v10 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v6 = v5;
      name = self->_name;
      uint64_t v8 = [(_UICoreUICatalogColorWrapper *)v6 name];
      if (name == v8
        || (id v9 = self->_name,
            [(_UICoreUICatalogColorWrapper *)v6 name],
            id v3 = objc_claimAutoreleasedReturnValue(),
            [(NSString *)v9 isEqualToString:v3]))
      {
        bundleID = self->_bundleID;
        v12 = [(_UICoreUICatalogColorWrapper *)v6 bundleID];
        if (bundleID == v12)
        {
          char v10 = 1;
        }
        else
        {
          uint64_t v13 = self->_bundleID;
          v14 = [(_UICoreUICatalogColorWrapper *)v6 bundleID];
          char v10 = [(NSString *)v13 isEqualToString:v14];
        }
        if (name == v8) {
          goto LABEL_13;
        }
      }
      else
      {
        char v10 = 0;
      }

LABEL_13:
      goto LABEL_14;
    }
    char v10 = 0;
  }
LABEL_14:

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
    && [(_UICoreUICatalogColorWrapper *)self isEqualToCoreUICatalogColor:v4];

  return v5;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_name hash];
  return [(NSString *)self->_bundleID hash] ^ v3;
}

- (UIColor)color
{
  return (UIColor *)[(_UICoreUICatalogColorWrapper *)self _uikit_valueForTraitCollection:0];
}

- (NSString)name
{
  return self->_name;
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (UIColor)fallbackColor
{
  return self->_fallbackColor;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fallbackColor, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_colorCache, 0);
  objc_storeStrong((id *)&self->_nibLoadingBundleID, 0);
}

@end