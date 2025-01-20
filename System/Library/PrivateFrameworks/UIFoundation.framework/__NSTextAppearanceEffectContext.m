@interface __NSTextAppearanceEffectContext
- (__NSTextAppearanceEffectContext)initWithTextEffectName:(id)a3 catalog:(id)a4 styleEffectConfiguration:(id)a5 font:(id)a6 color:(id)a7 applicationFrameworkContext:(int64_t)a8 useSimplifiedEffect:(BOOL)a9;
- (void)dealloc;
- (void)drawGlyphs:(const unsigned __int16 *)a3 positions:(const CGPoint *)a4 count:(int64_t)a5 context:(CGContext *)a6;
@end

@implementation __NSTextAppearanceEffectContext

- (__NSTextAppearanceEffectContext)initWithTextEffectName:(id)a3 catalog:(id)a4 styleEffectConfiguration:(id)a5 font:(id)a6 color:(id)a7 applicationFrameworkContext:(int64_t)a8 useSimplifiedEffect:(BOOL)a9
{
  if (+[NSTextGraphicsContextProvider textGraphicsContextProviderClassRespondsToColorQuery])
  {
    v16 = (objc_class *)[(objc_class *)+[NSTextGraphicsContextProvider textGraphicsContextProviderClass] colorClassForApplicationFrameworkContext:a8];
  }
  else
  {
    v16 = +[NSTextGraphicsContextProvider __defaultColorClass];
  }
  v17 = v16;
  if (a8 == 2)
  {
    if (!a4) {
      goto LABEL_21;
    }
    if (!a3)
    {
      if (!a5) {
        goto LABEL_21;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0 || ![a5 backgroundType]) {
        goto LABEL_21;
      }
    }
  }
  else if (!a3 || a4)
  {
    if (!a3)
    {
LABEL_21:

      return 0;
    }
  }
  else
  {
    uint64_t v24 = 0;
    v25 = &v24;
    uint64_t v26 = 0x2020000000;
    v18 = (uint64_t (*)(void))get_UIKitGetTextEffectsCatalogSymbolLoc_ptr;
    v27 = get_UIKitGetTextEffectsCatalogSymbolLoc_ptr;
    if (!get_UIKitGetTextEffectsCatalogSymbolLoc_ptr)
    {
      v23[0] = MEMORY[0x1E4F143A8];
      v23[1] = 3221225472;
      v23[2] = __get_UIKitGetTextEffectsCatalogSymbolLoc_block_invoke;
      v23[3] = &unk_1E55C6FF0;
      v23[4] = &v24;
      __get_UIKitGetTextEffectsCatalogSymbolLoc_block_invoke((uint64_t)v23);
      v18 = (uint64_t (*)(void))v25[3];
    }
    _Block_object_dispose(&v24, 8);
    if (!v18) {
      -[__NSTextAppearanceEffectContext initWithTextEffectName:catalog:styleEffectConfiguration:font:color:applicationFrameworkContext:useSimplifiedEffect:]();
    }
    a4 = (id)v18();
  }
  v22.receiver = self;
  v22.super_class = (Class)__NSTextAppearanceEffectContext;
  v19 = [(__NSTextAppearanceEffectContext *)&v22 init];
  if (v19)
  {
    v19->_effectName = (NSString *)a3;
    v19->_catalog = (CUICatalog *)a4;
    if (a5) {
      v20 = (CUIStyleEffectConfiguration *)[a5 copy];
    }
    else {
      v20 = (CUIStyleEffectConfiguration *)objc_alloc_init(MEMORY[0x1E4F5E088]);
    }
    v19->_effectConfiguration = v20;
    v19->_font = (UIFont *)a6;
    if (!a7) {
      a7 = (id)[(objc_class *)v17 blackColor];
    }
    v19->_color = (UIColor *)a7;
    [(CUIStyleEffectConfiguration *)v19->_effectConfiguration setUseSimplifiedEffect:a9];
  }
  return v19;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)__NSTextAppearanceEffectContext;
  [(__NSTextAppearanceEffectContext *)&v3 dealloc];
}

- (void)drawGlyphs:(const unsigned __int16 *)a3 positions:(const CGPoint *)a4 count:(int64_t)a5 context:(CGContext *)a6
{
}

- (void)initWithTextEffectName:catalog:styleEffectConfiguration:font:color:applicationFrameworkContext:useSimplifiedEffect:.cold.1()
{
  v0 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(NSString, "stringWithUTF8String:", "CUICatalog *__UIKitGetTextEffectsCatalog(void)"), @"__NSTextAppearanceInterface.m", 17, @"%s", dlerror());
  __break(1u);
}

@end