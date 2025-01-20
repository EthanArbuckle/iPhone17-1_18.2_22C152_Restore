@interface WFWorkflowIconDrawerContext
+ (double)glyphTestFontSize;
+ (id)cachedContextOrNewContext;
- (CGFont)glyphFont;
- (NSSet)coreGlyphsCatalogs;
- (__CTFont)glyphTestFont;
- (__CTFont)newGlyphFontForSize:(double)a3;
- (void)dealloc;
@end

@implementation WFWorkflowIconDrawerContext

- (void).cxx_destruct
{
}

- (__CTFont)newGlyphFontForSize:(double)a3
{
  v4 = [(WFWorkflowIconDrawerContext *)self glyphFont];
  uint64_t v10 = 0;
  v11 = &v10;
  uint64_t v12 = 0x2020000000;
  v5 = getCTFontCreateWithGraphicsFontSymbolLoc_ptr;
  v13 = getCTFontCreateWithGraphicsFontSymbolLoc_ptr;
  if (!getCTFontCreateWithGraphicsFontSymbolLoc_ptr)
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __getCTFontCreateWithGraphicsFontSymbolLoc_block_invoke;
    v9[3] = &unk_1E6079C28;
    v9[4] = &v10;
    __getCTFontCreateWithGraphicsFontSymbolLoc_block_invoke(v9);
    v5 = (void *)v11[3];
  }
  _Block_object_dispose(&v10, 8);
  if (v5) {
    return (__CTFont *)((uint64_t (*)(CGFont *, void, void, double))v5)(v4, 0, 0, a3);
  }
  v7 = [MEMORY[0x1E4F28B00] currentHandler];
  v8 = objc_msgSend(NSString, "stringWithUTF8String:", "CTFontRef WFCTFontCreateWithGraphicsFont(CGFontRef, CGFloat, const CGAffineTransform * _Nullable, CTFontDescriptorRef _Nullable)");
  objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", v8, @"WFWorkflowIconDrawerContext.m", 20, @"%s", dlerror());

  __break(1u);
  return result;
}

- (__CTFont)glyphTestFont
{
  result = self->_glyphTestFont;
  if (!result)
  {
    [(id)objc_opt_class() glyphTestFontSize];
    result = -[WFWorkflowIconDrawerContext newGlyphFontForSize:](self, "newGlyphFontForSize:");
    self->_glyphTestFont = result;
  }
  return result;
}

- (CGFont)glyphFont
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  result = self->_glyphFont;
  if (!result)
  {
    v4 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    CFURLRef v5 = [v4 URLForResource:@"WorkflowGlyphs" withExtension:@"ttf"];

    CGDataProviderRef v6 = CGDataProviderCreateWithURL(v5);
    if (v6)
    {
      v7 = v6;
      aBlock[0] = MEMORY[0x1E4F143A8];
      aBlock[1] = 3221225472;
      aBlock[2] = __40__WFWorkflowIconDrawerContext_glyphFont__block_invoke;
      aBlock[3] = &__block_descriptor_40_e5_v8__0l;
      aBlock[4] = v6;
      v8 = (void (**)(void))_Block_copy(aBlock);
      self->_glyphFont = CGFontCreateWithDataProvider(v7);
      v8[2](v8);

      return self->_glyphFont;
    }
    else
    {
      v9 = getWFVoiceShortcutClientLogObject();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315138;
        uint64_t v12 = "-[WFWorkflowIconDrawerContext glyphFont]";
        _os_log_impl(&dword_1B3C5C000, v9, OS_LOG_TYPE_FAULT, "%s Couldn't load workflow glyph font data.", buf, 0xCu);
      }

      return 0;
    }
  }
  return result;
}

void __40__WFWorkflowIconDrawerContext_glyphFont__block_invoke(uint64_t a1)
{
}

- (NSSet)coreGlyphsCatalogs
{
  coreGlyphsCatalogs = self->_coreGlyphsCatalogs;
  if (!coreGlyphsCatalogs)
  {
    WFImageBeginUsingCoreGlyphsCatalogs();
    v4 = (NSSet *)objc_claimAutoreleasedReturnValue();
    CFURLRef v5 = self->_coreGlyphsCatalogs;
    self->_coreGlyphsCatalogs = v4;

    coreGlyphsCatalogs = self->_coreGlyphsCatalogs;
  }
  return coreGlyphsCatalogs;
}

- (void)dealloc
{
  CGFontRelease(self->_glyphFont);
  glyphTestFont = self->_glyphTestFont;
  if (glyphTestFont) {
    CFRelease(glyphTestFont);
  }
  if (self->_coreGlyphsCatalogs) {
    WFImageEndUsingCoreGlyphsCatalogs();
  }
  v4.receiver = self;
  v4.super_class = (Class)WFWorkflowIconDrawerContext;
  [(WFWorkflowIconDrawerContext *)&v4 dealloc];
}

+ (double)glyphTestFontSize
{
  return 40.0;
}

+ (id)cachedContextOrNewContext
{
  os_unfair_lock_lock((os_unfair_lock_t)&contextLock);
  if (context) {
    id v3 = (id)context;
  }
  else {
    id v3 = objc_alloc_init((Class)a1);
  }
  objc_super v4 = v3;
  os_unfair_lock_unlock((os_unfair_lock_t)&contextLock);
  return v4;
}

@end