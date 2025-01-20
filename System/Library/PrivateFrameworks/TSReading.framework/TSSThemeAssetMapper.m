@interface TSSThemeAssetMapper
- (BOOL)p_hasCachedMappingsForPresetsOfKind:(id)a3;
- (TSSTheme)fromTheme;
- (TSSTheme)toTheme;
- (TSSThemeAssetMapper)init;
- (TSSThemeAssetMapper)initWithFromTheme:(id)a3 toTheme:(id)a4;
- (id)mapPresetsWithKindFromPreset:(id)a3;
- (id)mapStyle:(id)a3;
- (id)mappedAssetForAsset:(id)a3;
- (void)cacheAssetMappings:(id)a3;
- (void)cacheMappingFromAsset:(id)a3 toAsset:(id)a4;
- (void)clearMappingCache;
- (void)dealloc;
@end

@implementation TSSThemeAssetMapper

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)TSSThemeAssetMapper;
  [(TSSThemeAssetMapper *)&v3 dealloc];
}

- (TSSThemeAssetMapper)initWithFromTheme:(id)a3 toTheme:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)TSSThemeAssetMapper;
  v6 = [(TSSThemeAssetMapper *)&v8 init];
  if (v6)
  {
    v6->mFromTheme = (TSSTheme *)a3;
    v6->mToTheme = (TSSTheme *)a4;
    v6->mAssetMap = (TSUCustomCallBackDictionary *)[objc_alloc(MEMORY[0x263F7C810]) initForThemeAssetMapperWithCapacity:0];
  }
  return v6;
}

- (TSSThemeAssetMapper)init
{
  objc_super v3 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
  uint64_t v4 = [NSString stringWithUTF8String:"-[TSSThemeAssetMapper init]"];
  [v3 handleFailureInFunction:v4, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/styles/TSSThemeAssetMapper.m"), 76, @"-init not supported, call designated initializer instead." file lineNumber description];

  return 0;
}

- (id)mappedAssetForAsset:(id)a3
{
  v5 = (void *)-[TSUCustomCallBackDictionary objectForKeyedSubscript:](self->mAssetMap, "objectForKeyedSubscript:");
  if (!v5)
  {
    if (![a3 conformsToProtocol:&unk_26D7857D0]
      || (uint64_t v6 = [a3 presetKind], String == v6)
      || [(TSSThemeAssetMapper *)self p_hasCachedMappingsForPresetsOfKind:v6]
      || ((objc_opt_respondsToSelector() & 1) == 0
        ? (v7 = sel_mapPresetsWithKindFromPreset_)
        : (v7 = (char *)[a3 mapThemePresetsSelector]),
          objc_super v8 = (void *)[(TSSThemeAssetMapper *)self performSelector:v7 withObject:a3],
          [(TSSThemeAssetMapper *)self cacheAssetMappings:v8],
          (v5 = (void *)[v8 objectForKeyedSubscript:a3]) == 0))
    {
      if (objc_opt_respondsToSelector())
      {
        v5 = (void *)-[TSSThemeAssetMapper performSelector:withObject:](self, "performSelector:withObject:", [a3 mapThemeAssetSelector], a3);
        if (v5) {
          [(TSSThemeAssetMapper *)self cacheMappingFromAsset:a3 toAsset:v5];
        }
      }
      else
      {
        return 0;
      }
    }
  }
  return v5;
}

- (id)mapPresetsWithKindFromPreset:(id)a3
{
  uint64_t v4 = [a3 presetKind];
  if (String == v4) {
    goto LABEL_18;
  }
  uint64_t v5 = v4;
  id v6 = [[(TSSThemeAssetMapper *)self fromTheme] presetsOfKind:v4];
  id v7 = [[(TSSThemeAssetMapper *)self toTheme] presetsOfKind:v5];
  objc_super v8 = v7;
  if (v6)
  {
    uint64_t v9 = [v6 count];
    if (v8) {
      goto LABEL_4;
    }
  }
  else
  {
    uint64_t v9 = 0;
    if (v7)
    {
LABEL_4:
      unint64_t v10 = [v8 count] - 1;
      if (v9) {
        goto LABEL_5;
      }
LABEL_18:
      v12 = 0;
      goto LABEL_19;
    }
  }
  unint64_t v10 = -1;
  if (!v9) {
    goto LABEL_18;
  }
LABEL_5:
  unint64_t v11 = 0;
  v12 = 0;
  do
  {
    if (v8)
    {
      unint64_t v13 = v11 >= v10 ? v10 : v11;
      uint64_t v14 = [v8 objectAtIndexedSubscript:v13];
      if (v14)
      {
        uint64_t v15 = v14;
        if (!v12) {
          v12 = (void *)[objc_alloc(MEMORY[0x263F7C810]) initWithCapacity:v9];
        }
        objc_msgSend(v12, "setObject:forKeyedSubscript:", v15, objc_msgSend(v6, "objectAtIndexedSubscript:", v11));
      }
    }
    ++v11;
    --v9;
  }
  while (v9);
LABEL_19:

  return v12;
}

- (id)mapStyle:(id)a3
{
  uint64_t v5 = [(TSSTheme *)self->mFromTheme stylesheet];
  if (v5 == (TSSStylesheet *)[a3 stylesheet])
  {
    objc_super v8 = 0;
    id v12 = 0;
    id v6 = a3;
    if (a3) {
      goto LABEL_7;
    }
LABEL_11:
    uint64_t v15 = TSUObjectReferenceDescription();
    NSLog((NSString *)@"Failed to find original theme style when mapping style %@.", v15);
    if ((objc_opt_respondsToSelector() & 1) == 0)
    {
LABEL_22:
      uint64_t v18 = TSUObjectReferenceDescription();
      NSLog((NSString *)@"Failed to find mapped theme style when mapping style %@.", v18);
LABEL_23:
      uint64_t v19 = TSUObjectReferenceDescription();
      NSLog((NSString *)@"Failed to find mapped style for style %@.", v19);
      return 0;
    }
    id v6 = 0;
    objc_super v8 = v12;
    goto LABEL_13;
  }
  id v6 = (id)[a3 parent];
  uint64_t v7 = [a3 overridePropertyMap];
  objc_super v8 = (void *)v7;
  if (!v6)
  {
    id v12 = (id)v7;
    goto LABEL_11;
  }
  while (1)
  {
    uint64_t v9 = (TSSStylesheet *)[v6 stylesheet];
    if (v9 == [(TSSTheme *)self->mFromTheme stylesheet]) {
      break;
    }
    uint64_t v10 = TSUObjectReferenceDescription();
    uint64_t v11 = TSUObjectReferenceDescription();
    NSLog((NSString *)@"Mapping style %@ whose ancestor %@ is not in the original theme stylesheet.", v10, v11);
    id v12 = (id)objc_msgSend((id)objc_msgSend(v6, "overridePropertyMap"), "copy");
    [v12 addValuesFromPropertyMap:v8];
    id v6 = (id)[v6 parent];
    objc_super v8 = v12;
    if (!v6) {
      goto LABEL_11;
    }
  }
LABEL_7:
  if (objc_opt_respondsToSelector())
  {
LABEL_13:
    id v14 = (id)-[TSSThemeAssetMapper performSelector:withObject:](self, "performSelector:withObject:", [a3 mapThemeStyleSelector], v6);
    goto LABEL_14;
  }
  uint64_t v13 = [v6 styleIdentifier];
  if (!v13)
  {
    uint64_t v17 = TSUObjectReferenceDescription();
    NSLog((NSString *)@"Original theme style %@ has no identifier.", v17);
    goto LABEL_22;
  }
  id v14 = [(TSSStylesheet *)[[(TSSThemeAssetMapper *)self toTheme] stylesheet] styleWithIdentifier:v13];
LABEL_14:
  v16 = v14;
  if (!v14) {
    goto LABEL_22;
  }
  if (v8 && [v8 count])
  {
    if (objc_opt_respondsToSelector()) {
      objc_super v8 = (void *)-[TSSThemeAssetMapper performSelector:withObject:](self, "performSelector:withObject:", [a3 mapThemePropertyMapSelector], v8);
    }
    v16 = objc_msgSend((id)objc_msgSend(-[TSPObject documentRoot](self->mFromTheme, "documentRoot"), "stylesheet"), "variationOfStyle:propertyMap:", v16, v8);
    if (!v16) {
      goto LABEL_23;
    }
  }
  return v16;
}

- (void)cacheMappingFromAsset:(id)a3 toAsset:(id)a4
{
}

- (void)cacheAssetMappings:(id)a3
{
}

- (void)clearMappingCache
{
}

- (TSSTheme)fromTheme
{
  return self->mFromTheme;
}

- (TSSTheme)toTheme
{
  return self->mToTheme;
}

- (BOOL)p_hasCachedMappingsForPresetsOfKind:(id)a3
{
  id v4 = [(TSSTheme *)self->mFromTheme presetOfKind:a3 index:0];
  if (!v4
    || (uint64_t v5 = [(TSUCustomCallBackDictionary *)self->mAssetMap objectForKeyedSubscript:v4]) != 0)
  {
    LOBYTE(v5) = 1;
  }
  return v5;
}

@end