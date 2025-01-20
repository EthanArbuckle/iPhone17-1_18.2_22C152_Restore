@interface TSSTheme
+ (TSSTheme)themeWithContext:(id)a3 alternate:(int)a4;
+ (id)presetBootstrapOrder;
+ (id)presetSources;
+ (void)registerPresetSourceClass:(Class)a3;
+ (void)registerPresetSourceClasses;
- (BOOL)containsCGColor:(CGColor *)a3;
- (BOOL)hasPresetsOfKind:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isLocked;
- (NSString)themeIdentifier;
- (TSSStylesheet)stylesheet;
- (TSSTheme)initWithContext:(id)a3;
- (id)childEnumerator;
- (id)colors;
- (id)modelPathComponentForChild:(id)a3;
- (id)p_identifierForBootstrapTheme:(int)a3;
- (id)presetOfKind:(id)a3 index:(unint64_t)a4;
- (id)presetsOfKind:(id)a3;
- (unint64_t)indexOfPreset:(id)a3;
- (void)addPreset:(id)a3 ofKind:(id)a4;
- (void)bootstrapThemeAlternate:(int)a3;
- (void)checkThemeStylesheetConsistency;
- (void)dealloc;
- (void)insertPreset:(id)a3 ofKind:(id)a4 atIndex:(unint64_t)a5;
- (void)movePresetOfKind:(id)a3 fromIndex:(unint64_t)a4 toIndex:(unint64_t)a5;
- (void)removePreset:(id)a3;
- (void)setIsLocked:(BOOL)a3;
- (void)setPresets:(id)a3 ofKind:(id)a4;
- (void)setThemeIdentifier:(id)a3;
@end

@implementation TSSTheme

+ (TSSTheme)themeWithContext:(id)a3 alternate:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  v5 = (void *)[objc_alloc((Class)a1) initWithContext:a3];
  [v5 bootstrapThemeAlternate:v4];

  return (TSSTheme *)v5;
}

- (TSSTheme)initWithContext:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)TSSTheme;
  uint64_t v4 = -[TSPObject initWithContext:](&v7, sel_initWithContext_);
  if (v4)
  {
    v5 = [[TSSStylesheet alloc] initWithContext:a3];
    v4->mStylesheet = v5;
    [(TSSStylesheet *)v5 setIsLocked:1];
    v4->mPresetsByKind = (NSMutableDictionary *)objc_opt_new();
    [(TSSTheme *)v4 disablePresetValidation];
  }
  return v4;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)TSSTheme;
  [(TSSTheme *)&v3 dealloc];
}

- (BOOL)isEqual:(id)a3
{
  if (a3 == self)
  {
    LOBYTE(v4) = 1;
  }
  else
  {
    objc_opt_class();
    uint64_t v4 = (void *)TSUDynamicCast();
    if (v4)
    {
      v5 = v4;
      if ((TSSStylesheet *)[v4 stylesheet] == self->mStylesheet
        || (LODWORD(v4) = objc_msgSend((id)objc_msgSend(v5, "stylesheet"), "isEqual:", self->mStylesheet), v4))
      {
        mPresetsByKind = self->mPresetsByKind;
        uint64_t v7 = v5[8];
        LOBYTE(v4) = [(NSMutableDictionary *)mPresetsByKind isEqual:v7];
      }
    }
  }
  return (char)v4;
}

- (void)setThemeIdentifier:(id)a3
{
  self->mThemeIdentifier = (NSString *)[a3 copy];
}

- (NSString)themeIdentifier
{
  return self->mThemeIdentifier;
}

- (BOOL)isLocked
{
  return [(TSSStylesheet *)self->mStylesheet isLocked];
}

- (void)setIsLocked:(BOOL)a3
{
}

+ (id)presetSources
{
  if (presetSources_onceToken != -1) {
    dispatch_once(&presetSources_onceToken, &__block_literal_global_20);
  }
  return (id)presetSources_presetSources;
}

uint64_t __25__TSSTheme_presetSources__block_invoke()
{
  uint64_t result = objc_opt_new();
  presetSources_presetSources = result;
  return result;
}

+ (void)registerPresetSourceClasses
{
  uint64_t v3 = objc_opt_class();

  [a1 registerPresetSourceClass:v3];
}

+ (void)registerPresetSourceClass:(Class)a3
{
  v5 = (void *)[(objc_class *)a3 presetKinds];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __38__TSSTheme_registerPresetSourceClass___block_invoke;
  v6[3] = &unk_2646B10C8;
  v6[4] = a1;
  v6[5] = a3;
  [v5 enumerateObjectsUsingBlock:v6];
}

uint64_t __38__TSSTheme_registerPresetSourceClass___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = (void *)[*(id *)(a1 + 32) presetSources];

  return [v4 setObject:v3 forKeyedSubscript:a2];
}

- (id)presetsOfKind:(id)a3
{
  if (a3) {
    return (id)-[NSMutableDictionary objectForKeyedSubscript:](self->mPresetsByKind, "objectForKeyedSubscript:");
  }
  else {
    return 0;
  }
}

- (BOOL)hasPresetsOfKind:(id)a3
{
  return a3 && -[NSMutableDictionary objectForKeyedSubscript:](self->mPresetsByKind, "objectForKeyedSubscript:") != 0;
}

- (void)setPresets:(id)a3 ofKind:(id)a4
{
  if (!a4)
  {
    uint64_t v7 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v8 = [NSString stringWithUTF8String:"-[TSSTheme setPresets:ofKind:]"];
    objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", v8, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/styles/TSSTheme.m"), 210, @"invalid nil value for '%s'", "kind");
  }
  [(TSPObject *)self willModify];
  if (a3 && [a3 count])
  {
    id v9 = (id)[a3 mutableCopy];
    mPresetsByKind = self->mPresetsByKind;
    [(NSMutableDictionary *)mPresetsByKind setObject:v9 forKeyedSubscript:a4];
  }
  else
  {
    v11 = self->mPresetsByKind;
    [(NSMutableDictionary *)v11 removeObjectForKey:a4];
  }
}

- (void)addPreset:(id)a3 ofKind:(id)a4
{
  uint64_t v7 = (void *)[(NSMutableDictionary *)self->mPresetsByKind objectForKeyedSubscript:a4];
  if (!v7 || ([v7 containsObject:a3] & 1) == 0)
  {
    [(TSSTheme *)self insertPreset:a3 ofKind:a4 atIndex:-1];
  }
}

- (void)insertPreset:(id)a3 ofKind:(id)a4 atIndex:(unint64_t)a5
{
  [(TSPObject *)self willModify];
  id v9 = (void *)[(NSMutableDictionary *)self->mPresetsByKind objectForKeyedSubscript:a4];
  if (!v9)
  {
    id v9 = (void *)[MEMORY[0x263EFF980] array];
    [(NSMutableDictionary *)self->mPresetsByKind setObject:v9 forKeyedSubscript:a4];
  }
  if (a5 == -1 || [v9 count] <= a5)
  {
    [v9 addObject:a3];
  }
  else
  {
    [v9 insertObject:a3 atIndex:a5];
  }
}

- (void)removePreset:(id)a3
{
  if (a3)
  {
    uint64_t v5 = -[NSMutableDictionary objectForKeyedSubscript:](self->mPresetsByKind, "objectForKeyedSubscript:", [a3 presetKind]);
    if (v5)
    {
      v6 = (void *)v5;
      [(TSPObject *)self willModify];
      [v6 removeObject:a3];
    }
  }
}

- (void)movePresetOfKind:(id)a3 fromIndex:(unint64_t)a4 toIndex:(unint64_t)a5
{
  id v9 = (id)objc_msgSend(-[TSSTheme presetsOfKind:](self, "presetsOfKind:"), "mutableCopy");
  if (!v9) {
    id v9 = objc_alloc_init(MEMORY[0x263EFF980]);
  }
  id v11 = v9;
  if ([v9 count] > a4 && objc_msgSend(v11, "count") > a5)
  {
    id v10 = [(TSSTheme *)self presetOfKind:a3 index:a4];
    [v11 removeObject:v10];
    [v11 insertObject:v10 atIndex:a5];
    [(TSSTheme *)self setPresets:v11 ofKind:a3];
  }
}

- (id)presetOfKind:(id)a3 index:(unint64_t)a4
{
  id v6 = -[TSSTheme presetsOfKind:](self, "presetsOfKind:");
  if ([v6 count] <= a4)
  {
    uint64_t v8 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v9 = [NSString stringWithUTF8String:"-[TSSTheme presetOfKind:index:]"];
    [v8 handleFailureInFunction:v9, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/styles/TSSTheme.m"), 303, @"Attempt to request %@ preset for out of bounds index %lu.", a3, a4 file lineNumber description];
    return 0;
  }
  else
  {
    return (id)[v6 objectAtIndexedSubscript:a4];
  }
}

- (unint64_t)indexOfPreset:(id)a3
{
  uint64_t v5 = [a3 presetKind];
  if (v5 == String) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  id v6 = (void *)[(NSMutableDictionary *)self->mPresetsByKind objectForKeyedSubscript:v5];
  if (!v6) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  uint64_t v7 = v6;
  if (![v6 count]) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }

  return [v7 indexOfObjectIdenticalTo:a3];
}

- (id)colors
{
  return [(TSSTheme *)self presetsOfKind:String];
}

- (BOOL)containsCGColor:(CGColor *)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v4 = [(TSSTheme *)self colors];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v11;
    while (2)
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        if (CGColorEqualToColor(a3, (CGColorRef)[*(id *)(*((void *)&v10 + 1) + 8 * v8) CGColor]))
        {
          LOBYTE(v5) = 1;
          return v5;
        }
        ++v8;
      }
      while (v6 != v8);
      uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
      uint64_t v6 = v5;
      if (v5) {
        continue;
      }
      break;
    }
  }
  return v5;
}

- (id)childEnumerator
{
  id v3 = (id)objc_opt_new();
  mPresetsByKind = self->mPresetsByKind;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __27__TSSTheme_childEnumerator__block_invoke;
  v6[3] = &unk_2646B10F0;
  v6[4] = v3;
  [(NSMutableDictionary *)mPresetsByKind enumerateKeysAndObjectsUsingBlock:v6];
  return v3;
}

uint64_t __27__TSSTheme_childEnumerator__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t result = [a3 count];
  if (result)
  {
    uint64_t result = objc_msgSend((id)objc_msgSend(a3, "objectAtIndexedSubscript:", 0), "conformsToProtocol:", &unk_26D7429E0);
    if (result)
    {
      uint64_t v6 = *(void **)(a1 + 32);
      uint64_t v7 = [a3 objectEnumerator];
      return [v6 addObject:v7];
    }
  }
  return result;
}

- (id)modelPathComponentForChild:(id)a3
{
  objc_opt_class();
  uint64_t v5 = (void *)TSUClassAndProtocolCast();
  if (v5) {
    return (id)[NSString stringWithFormat:@"%@-%lu", String(objc_msgSend(v5, "presetKind", &unk_26D7857D0)), -[TSSTheme indexOfPreset:](self, "indexOfPreset:", v5)];
  }
  else {
    return (id)objc_msgSend(NSString, "stringWithFormat:", @"?%s-%p?", object_getClassName(a3), a3);
  }
}

- (id)p_identifierForBootstrapTheme:(int)a3
{
  return off_2646B1110[a3];
}

+ (id)presetBootstrapOrder
{
  v3[13] = *MEMORY[0x263EF8340];
  v3[0] = String;
  v3[1] = String;
  v3[2] = String;
  v3[3] = String;
  v3[4] = String;
  v3[5] = String;
  v3[6] = String;
  v3[7] = String;
  v3[8] = String;
  v3[9] = String;
  v3[10] = String;
  v3[11] = String;
  v3[12] = String;
  return (id)[MEMORY[0x263EFF8C0] arrayWithObjects:v3 count:13];
}

- (void)bootstrapThemeAlternate:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v16 = *MEMORY[0x263EF8340];
  BOOL v5 = [(TSSTheme *)self isLocked];
  [(TSSTheme *)self setIsLocked:0];
  if (([(TSSTheme *)self isMemberOfClass:objc_opt_class()] & 1) == 0)
  {
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    uint64_t v6 = objc_msgSend((id)objc_opt_class(), "presetBootstrapOrder", 0);
    uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v12;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v12 != v9) {
            objc_enumerationMutation(v6);
          }
          objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "presetSources"), "objectForKeyedSubscript:", *(void *)(*((void *)&v11 + 1) + 8 * v10)), "bootstrapPresetsOfKind:inTheme:alternate:", *(void *)(*((void *)&v11 + 1) + 8 * v10), self, v3);
          ++v10;
        }
        while (v8 != v10);
        uint64_t v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v8);
    }
  }
  [(TSSTheme *)self setThemeIdentifier:[(TSSTheme *)self p_identifierForBootstrapTheme:v3]];
  [(TSSTheme *)self setIsLocked:v5];
}

- (void)checkThemeStylesheetConsistency
{
  uint64_t v3 = [[TSKDocumentModelEnumerator alloc] initWithRootModelObject:self filter:0];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __43__TSSTheme_checkThemeStylesheetConsistency__block_invoke;
  v4[3] = &unk_2646B1150;
  v4[4] = self;
  [(TSKDocumentModelEnumerator *)v3 enumerateReferencedStylesUsingBlock:v4];
}

uint64_t __43__TSSTheme_checkThemeStylesheetConsistency__block_invoke(uint64_t a1, void *a2)
{
  if (!objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "stylesheet"), "containsStyle:", a2)
    || (uint64_t v4 = [a2 stylesheet], result = objc_msgSend(*(id *)(a1 + 32), "stylesheet"), v4 != result))
  {
    uint64_t v6 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v7 = [NSString stringWithUTF8String:"-[TSSTheme checkThemeStylesheetConsistency]_block_invoke"];
    return [v6 handleFailureInFunction:v7, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/styles/TSSTheme.m"), 440, @"theme content refers to a style %@ not in the theme stylesheet", a2 file lineNumber description];
  }
  return result;
}

- (TSSStylesheet)stylesheet
{
  return self->mStylesheet;
}

@end