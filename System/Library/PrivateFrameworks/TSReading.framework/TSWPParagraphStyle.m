@interface TSWPParagraphStyle
+ (float)defaultFloatValueForProperty:(int)a3;
+ (id)defaultPropertyMap;
+ (id)defaultStyleWithContext:(id)a3;
+ (id)defaultValueForProperty:(int)a3;
+ (id)deprecatedProperties;
+ (id)nonEmphasisParagraphProperties;
+ (id)p_normalDecimalSeparator;
+ (id)paragraphProperties;
+ (id)paragraphPropertiesAllowingNSNull;
+ (id)presetStyleDescriptor;
+ (id)properties;
+ (id)propertiesAllowingNSNull;
+ (id)styleSummaryForPropertyMap:(id)a3;
+ (int)defaultIntValueForProperty:(int)a3;
+ (void)initialize;
- (BOOL)transformsFontSizes;
- (NSString)presetKind;
- (SEL)mapThemePropertyMapSelector;
- (__CFDictionary)getTypesetterAttributes:(id)a3 scalePercent:(unint64_t)a4 isRightToLeft:(BOOL)a5;
- (__CFDictionary)p_newCoreTextCharacterStyle:(id)a3 allowLigatures:(BOOL)a4 scalePercent:(unint64_t)a5;
- (__CTFont)findCachedFontForCharacterStyle:(id)a3 scalePercent:(unint64_t)a4;
- (__CTParagraphStyle)p_createCoreTextParagraphStyleWithCharacterStyle:(id)a3 writingDirection:(int)a4 lineBoundsOptions:(unint64_t)a5;
- (char)p_coreTextWritingDirectionFromWPWritingDirection:(int)a3;
- (id)contentTag;
- (id)followingParagraphStyle;
- (id)fullPropertyMap;
- (id)initialListStyle;
- (id)styleSummary;
- (unint64_t)p_lineBoundsOptions;
- (void)clearStyleCaches;
- (void)dealloc;
- (void)localizeForBidi:(BOOL)a3;
- (void)localizeForRightToLeft;
- (void)setInitialListStyle:(id)a3;
- (void)setOverridePropertyMap:(id)a3;
@end

@implementation TSWPParagraphStyle

+ (int)defaultIntValueForProperty:(int)a3
{
  int result = 0x80000000;
  if (a3 > 55)
  {
    switch(a3)
    {
      case 'Y':
      case 'Z':
      case '[':
      case 'f':
      case 'k':
      case 'n':
      case 'q':
LABEL_5:
        int result = 0;
        break;
      case '\\':
      case ']':
LABEL_6:
        int result = 1;
        break;
      case '^':
      case '_':
      case 'a':
      case 'b':
      case 'c':
      case 'd':
      case 'e':
      case 'g':
      case 'h':
      case 'i':
      case 'l':
      case 'm':
      case 'o':
      case 'p':
        return result;
      case 'j':
LABEL_13:
        int result = -1;
        break;
      default:
        if (a3 == 86) {
          int v4 = 4;
        }
        else {
          int v4 = 0x80000000;
        }
        if (a3 == 56) {
          int result = 0;
        }
        else {
          int result = v4;
        }
        break;
    }
  }
  else
  {
    switch(a3)
    {
      case 19:
      case 20:
      case 21:
      case 22:
      case 25:
      case 26:
      case 29:
      case 36:
        goto LABEL_5;
      case 23:
      case 24:
      case 27:
      case 28:
      case 30:
      case 31:
      case 32:
      case 33:
      case 34:
      case 35:
        return result;
      default:
        switch(a3)
        {
          case ')':
            goto LABEL_6;
          case ',':
            goto LABEL_13;
          case '0':
          case '1':
          case '3':
            goto LABEL_5;
          default:
            return result;
        }
    }
  }
  return result;
}

+ (float)defaultFloatValueForProperty:(int)a3
{
  float result = INFINITY;
  if (a3 <= 49)
  {
    switch(a3)
    {
      case 23:
      case 31:
      case 33:
      case 34:
      case 35:
LABEL_5:
        float result = 0.0;
        break;
      case 24:
      case 25:
      case 26:
      case 28:
      case 29:
      case 30:
      case 32:
        return result;
      case 27:
        float result = 1.0;
        break;
      default:
        BOOL v5 = a3 == 17;
        float v4 = 12.0;
LABEL_10:
        if (v5) {
          float result = v4;
        }
        break;
    }
  }
  else
  {
    switch(a3)
    {
      case 'P':
      case 'Q':
      case 'R':
      case 'W':
      case 'X':
        goto LABEL_5;
      case 'S':
        float result = 36.0;
        break;
      case 'T':
      case 'U':
      case 'V':
        return result;
      default:
        float v4 = -1000.0;
        if (a3 == 104) {
          float result = 1.0;
        }
        BOOL v5 = a3 == 50;
        goto LABEL_10;
    }
  }
  return result;
}

- (__CFDictionary)getTypesetterAttributes:(id)a3 scalePercent:(unint64_t)a4 isRightToLeft:(BOOL)a5
{
  BOOL v5 = a5;
  objc_sync_enter(self);
  if (!self->_coreTextParagraphStyle) {
    self->_coreTextParagraphStyle = [(TSWPParagraphStyle *)self p_createCoreTextParagraphStyleWithCharacterStyle:0 writingDirection:0 lineBoundsOptions:[(TSWPParagraphStyle *)self p_lineBoundsOptions]];
  }
  if (a4 == 100)
  {
    styleCache = self->_styleCache;
    if (!styleCache)
    {
      styleCache = CFDictionaryCreateMutable(0, 0, &-[TSWPParagraphStyle getTypesetterAttributes:scalePercent:isRightToLeft:]::keyCallBacks, MEMORY[0x263EFFF90]);
      self->_styleCache = styleCache;
    }
  }
  else
  {
    if (a4 - 20 >= 0xB5)
    {
      v10 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
      uint64_t v11 = [NSString stringWithUTF8String:"-[TSWPParagraphStyle getTypesetterAttributes:scalePercent:isRightToLeft:]"];
      objc_msgSend(v10, "handleFailureInFunction:file:lineNumber:description:", v11, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPParagraphStyle.mm"), 428, @"Bad scalePercent");
    }
    scalePercentStyleCaches = self->_scalePercentStyleCaches;
    if (!scalePercentStyleCaches)
    {
      scalePercentStyleCaches = CFDictionaryCreateMutable(0, 0, &-[TSWPParagraphStyle getTypesetterAttributes:scalePercent:isRightToLeft:]::keyCallBacks, MEMORY[0x263EFFF90]);
      self->_scalePercentStyleCaches = scalePercentStyleCaches;
    }
    styleCache = (__CFDictionary *)CFDictionaryGetValue(scalePercentStyleCaches, (const void *)a4);
    if (!styleCache)
    {
      styleCache = CFDictionaryCreateMutable(0, 0, &-[TSWPParagraphStyle getTypesetterAttributes:scalePercent:isRightToLeft:]::keyCallBacks, MEMORY[0x263EFFF90]);
      CFDictionaryAddValue(self->_scalePercentStyleCaches, (const void *)a4, styleCache);
      CFRelease(styleCache);
    }
  }
  if (a3) {
    v13 = a3;
  }
  else {
    v13 = self;
  }
  Value = (__CFDictionary *)CFDictionaryGetValue(styleCache, v13);
  if (!Value)
  {
    objc_opt_class();
    [(TSPObjectContext *)[(TSPObject *)self context] documentObject];
    v15 = (void *)TSUDynamicCast();
    if (v15) {
      uint64_t v16 = [v15 useLigatures];
    }
    else {
      uint64_t v16 = 1;
    }
    Value = [(TSWPParagraphStyle *)self p_newCoreTextCharacterStyle:a3 allowLigatures:v16 scalePercent:a4];
    CFDictionaryAddValue(styleCache, v13, Value);
    CFRelease(Value);
  }
  unint64_t v17 = [(TSWPParagraphStyle *)self p_lineBoundsOptions];
  unint64_t v18 = v17;
  if (v5 || v17)
  {
    unsigned int v19 = [(TSSStyle *)self intValueForProperty:44];
    if (v5) {
      unsigned int v20 = 1;
    }
    else {
      unsigned int v20 = -1;
    }
    if (v19 == -1) {
      uint64_t v21 = v20;
    }
    else {
      uint64_t v21 = v19;
    }
    v22 = [(TSWPParagraphStyle *)self p_createCoreTextParagraphStyleWithCharacterStyle:0 writingDirection:v21 lineBoundsOptions:v18];
    Value = CFDictionaryCreateMutableCopy((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, Value);
    CFDictionaryReplaceValue(Value, (const void *)*MEMORY[0x263F03CA0], v22);
    CFRelease(v22);
    CFAutorelease(Value);
  }
  objc_sync_exit(self);
  if (!Value)
  {
    v23 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v24 = [NSString stringWithUTF8String:"-[TSWPParagraphStyle getTypesetterAttributes:scalePercent:isRightToLeft:]"];
    uint64_t v25 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPParagraphStyle.mm"];
    v26 = @"NO";
    if (v5) {
      v26 = @"YES";
    }
    [v23 handleFailureInFunction:v24, v25, 485, @"Failed to get attributes isRTL: %@\ncharacter style: %@\n paragraph style: %@", v26, a3, self file lineNumber description];
  }
  return Value;
}

- (unint64_t)p_lineBoundsOptions
{
  return 4 * ([(TSSStyle *)self intValueForProperty:110] != 0);
}

+ (id)defaultValueForProperty:(int)a3
{
  if (a3 > 83)
  {
    switch(a3)
    {
      case 'b':
      case 'c':
      case 'g':
      case 'l':
      case 'm':
      case 'o':
      case 'p':
      case 'r':
LABEL_5:
        break;
      case 'd':
      case 'f':
      case 'h':
      case 'j':
      case 'k':
      case 'n':
      case 'q':
        goto LABEL_21;
      case 'e':
        id result = (id)objc_msgSend(a1, "p_normalDecimalSeparator");
        break;
      case 'i':
        id result = +[TSWPRuleOffset ruleOffset];
        break;
      default:
        if (a3 == 84)
        {
          id result = +[TSWPTabs tabs];
        }
        else if (a3 == 85)
        {
          id result = +[TSWPLineSpacing lineSpacing];
        }
        else
        {
LABEL_21:
          v5.receiver = a1;
          v5.super_class = (Class)&OBJC_METACLASS___TSWPParagraphStyle;
          id result = objc_msgSendSuper2(&v5, sel_defaultValueForProperty_);
        }
        break;
    }
  }
  else
  {
    id result = @"Helvetica";
    switch(a3)
    {
      case 16:
        return result;
      case 18:
      case 32:
        break;
      case 24:
      case 28:
      case 37:
      case 38:
      case 39:
      case 40:
      case 43:
      case 45:
      case 46:
      case 47:
      case 53:
      case 54:
      case 55:
        goto LABEL_5;
      default:
        goto LABEL_21;
    }
  }
  return result;
}

- (__CTFont)findCachedFontForCharacterStyle:(id)a3 scalePercent:(unint64_t)a4
{
  id result = [(TSWPParagraphStyle *)self getTypesetterAttributes:a3 scalePercent:a4 isRightToLeft:0];
  if (result)
  {
    objc_super v5 = (const void *)*MEMORY[0x263F039A0];
    return (__CTFont *)CFDictionaryGetValue(result, v5);
  }
  return result;
}

TSSPropertySet *__42__TSWPParagraphStyle_deprecatedProperties__block_invoke()
{
  id result = -[TSSPropertySet initWithProperties:]([TSSPropertySet alloc], "initWithProperties:", 113, 114, 112, 0);
  +[TSWPParagraphStyle deprecatedProperties]::s_deprecatedProperties = (uint64_t)result;
  return result;
}

TSSPropertySet *__41__TSWPParagraphStyle_paragraphProperties__block_invoke()
{
  id result = -[TSSPropertySet initWithProperties:]([TSSPropertySet alloc], "initWithProperties:", 86, 101, 83, 98, 80, 99, 93, 108, 89, 90, 81, 85, 106, 107, 91, 102, 105,
             104,
             82,
             88,
             87,
             103,
             84,
             92,
             109,
             110,
             111,
             51,
             112,
             113,
             114,
             0);
  +[TSWPParagraphStyle paragraphProperties]::s_paragraphProperties = (uint64_t)result;
  return result;
}

id __32__TSWPParagraphStyle_properties__block_invoke()
{
  id result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "paragraphProperties"), "propertySetByAddingPropertiesFromSet:", +[TSWPCharacterStyle properties](TSWPCharacterStyle, "properties"));
  +[TSWPParagraphStyle properties]::s_properties = (uint64_t)result;
  return result;
}

+ (id)paragraphProperties
{
  if (+[TSWPParagraphStyle paragraphProperties]::onceToken != -1) {
    dispatch_once(&+[TSWPParagraphStyle paragraphProperties]::onceToken, &__block_literal_global_60);
  }
  return (id)+[TSWPParagraphStyle paragraphProperties]::s_paragraphProperties;
}

+ (id)properties
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __32__TSWPParagraphStyle_properties__block_invoke;
  block[3] = &unk_2646AF7B8;
  block[4] = a1;
  if (+[TSWPParagraphStyle properties]::onceToken != -1) {
    dispatch_once(&+[TSWPParagraphStyle properties]::onceToken, block);
  }
  return (id)+[TSWPParagraphStyle properties]::s_properties;
}

- (__CFDictionary)p_newCoreTextCharacterStyle:(id)a3 allowLigatures:(BOOL)a4 scalePercent:(unint64_t)a5
{
  BOOL v6 = a4;
  v47[2] = *MEMORY[0x263EF8340];
  Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
  CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x263F03CA0], self->_coreTextParagraphStyle);
  v47[0] = a3;
  v47[1] = self;
  v10 = TSWPCreateFontForStylesWithScale((uint64_t)v47, 2uLL, a5);
  if (!v10)
  {
    uint64_t v11 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v12 = [NSString stringWithUTF8String:"-[TSWPParagraphStyle p_newCoreTextCharacterStyle:allowLigatures:scalePercent:]"];
    objc_msgSend(v11, "handleFailureInFunction:file:lineNumber:description:", v12, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPParagraphStyle.mm"), 670, @"Bad font");
  }
  CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x263F039A0], v10);
  TSWPResolveFloatPropertyForStyles((uint64_t)a3, (uint64_t)self, 35);
  if (v13 == 0.0)
  {
    if (v6)
    {
      uint64_t v15 = TSWPResolveIntPropertyForStyles((uint64_t)a3, (uint64_t)self, 41, 0);
      if (v15 == 1) {
        goto LABEL_11;
      }
      goto LABEL_9;
    }
  }
  else
  {
    v14 = (void *)[objc_alloc(NSNumber) initWithDouble:v13 * CTFontGetSize(v10)];
    CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x263F03C88], v14);
  }
  uint64_t v15 = 0;
LABEL_9:
  uint64_t v16 = (const void *)[NSNumber numberWithInt:v15];
  if (v16) {
    CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x263F03C98], v16);
  }
LABEL_11:
  objc_opt_class();
  TSWPResolvePropertyForStyles((uint64_t)a3, (uint64_t)self, 18, 0);
  unint64_t v17 = (void *)TSUDynamicCast();
  if (v17)
  {
    unint64_t v18 = (const void *)[v17 CGColor];
    if (v18) {
      CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x263F03C60], v18);
    }
  }
  TSWPResolveFloatPropertyForStyles((uint64_t)a3, (uint64_t)self, 33);
  CFDictionaryAddValue(Mutable, @"TSWPBaselineShift", (const void *)objc_msgSend(NSNumber, "numberWithDouble:"));
  uint64_t v19 = TSWPResolveIntPropertyForStyles((uint64_t)a3, (uint64_t)self, 36, 0);
  CFDictionaryAddValue(Mutable, @"TSWPSuperscript", (const void *)[NSNumber numberWithUnsignedInt:v19]);
  if (v19)
  {
    TSWPResolveFloatPropertyForStyles((uint64_t)a3, (uint64_t)self, 17);
    CTFontRef CopyWithAttributes = CTFontCreateCopyWithAttributes(v10, v20, 0, 0);
    CFDictionaryAddValue(Mutable, @"TSWPUnadjustedFont", CopyWithAttributes);
    CFRelease(CopyWithAttributes);
  }
  v22 = (void *)TSWPResolvePropertyForStyles((uint64_t)a3, (uint64_t)self, 40, 0);
  if ([v22 isEnabled]) {
    CFDictionaryAddValue(Mutable, @"TSWPShadow", v22);
  }
  LODWORD(v23) = TSWPResolveIntPropertyForStyles((uint64_t)a3, (uint64_t)self, 22, 0);
  if (v23 >= 4)
  {
    uint64_t v24 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v25 = [NSString stringWithUTF8String:"-[TSWPParagraphStyle p_newCoreTextCharacterStyle:allowLigatures:scalePercent:]"];
    objc_msgSend(v24, "handleFailureInFunction:file:lineNumber:description:", v25, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPParagraphStyle.mm"), 732, @"bad underline value");
  }
  if (v23 >= 3) {
    uint64_t v23 = 3;
  }
  else {
    uint64_t v23 = v23;
  }
  v26 = (void *)[objc_alloc(NSNumber) initWithUnsignedInt:v23];
  CFDictionaryAddValue(Mutable, @"TSWPUnderline", v26);

  v27 = (const void *)TSWPResolvePropertyForStyles((uint64_t)a3, (uint64_t)self, 24, 0);
  if (v27) {
    CFDictionaryAddValue(Mutable, @"TSWPUnderlineColor", v27);
  }
  TSWPResolveFloatPropertyForStyles((uint64_t)a3, (uint64_t)self, 23);
  if (v28 != 0.0)
  {
    *(float *)&double v28 = v28;
    CFDictionaryAddValue(Mutable, @"TSWPUnderlineWidthAttribute", (const void *)[NSNumber numberWithFloat:v28]);
  }
  uint64_t v29 = TSWPResolvePropertyForStyles((uint64_t)a3, (uint64_t)self, 45, 1);
  if (v29)
  {
    v30 = (const void *)v29;
    {
      v31 = String(45);
      CFDictionaryAddValue(Mutable, v31, v30);
    }
  }
  uint64_t v32 = TSWPResolvePropertyForStyles((uint64_t)a3, (uint64_t)self, 47, 1);
  if (v32)
  {
    v33 = (const void *)v32;
    {
      v34 = String(47);
      CFDictionaryAddValue(Mutable, v34, v33);
    }
  }
  LODWORD(v35) = TSWPResolveIntPropertyForStyles((uint64_t)a3, (uint64_t)self, 26, 0);
  if (v35 >= 3)
  {
    v36 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v37 = [NSString stringWithUTF8String:"-[TSWPParagraphStyle p_newCoreTextCharacterStyle:allowLigatures:scalePercent:]"];
    objc_msgSend(v36, "handleFailureInFunction:file:lineNumber:description:", v37, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPParagraphStyle.mm"), 767, @"bad strikethru value");
  }
  if (v35 >= 2) {
    uint64_t v35 = 2;
  }
  else {
    uint64_t v35 = v35;
  }
  v38 = (void *)[objc_alloc(NSNumber) initWithUnsignedInt:v35];
  CFDictionaryAddValue(Mutable, @"TSWPStrikethrough", v38);

  v39 = (const void *)TSWPResolvePropertyForStyles((uint64_t)a3, (uint64_t)self, 28, 0);
  if (v39) {
    CFDictionaryAddValue(Mutable, @"TSWPStrikethroughColor", v39);
  }
  v40 = (const void *)TSWPResolvePropertyForStyles((uint64_t)a3, (uint64_t)self, 37, 1);
  if (v40) {
    CFDictionaryAddValue(Mutable, @"TSWPTextBackgroundColor", v40);
  }
  TSWPResolveFloatPropertyForStyles((uint64_t)a3, (uint64_t)self, 31);
  if (v41 > 0.0)
  {
    double v42 = v41;
    int v43 = TSWPResolveIntPropertyForStyles((uint64_t)a3, (uint64_t)self, 49, 0);
    double v44 = -v42;
    if (!v43) {
      double v44 = v42;
    }
    CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x263F03CB8], (const void *)[NSNumber numberWithDouble:v44]);
  }
  objc_opt_class();
  TSWPResolvePropertyForStyles((uint64_t)a3, (uint64_t)self, 32, 0);
  v45 = (void *)TSUDynamicCast();
  if (v45) {
    CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x263F03CB0], (const void *)[v45 CGColor]);
  }
  CFRelease(v10);
  return Mutable;
}

- (void)setInitialListStyle:(id)a3
{
  if (!a3) {
    a3 = (id)[MEMORY[0x263EFF9D0] null];
  }

  [(TSSStyle *)self setValue:a3 forProperty:108];
}

+ (id)defaultPropertyMap
{
  v3.receiver = a1;
  v3.super_class = (Class)&OBJC_METACLASS___TSWPParagraphStyle;
  return (id)objc_msgSend(objc_msgSendSuper2(&v3, sel_defaultPropertyMap), "propertyMapByRemovingValuesForProperties:", objc_msgSend(a1, "deprecatedProperties"));
}

+ (id)deprecatedProperties
{
  if (+[TSWPParagraphStyle deprecatedProperties]::onceToken != -1) {
    dispatch_once(&+[TSWPParagraphStyle deprecatedProperties]::onceToken, &__block_literal_global_5);
  }
  return (id)+[TSWPParagraphStyle deprecatedProperties]::s_deprecatedProperties;
}

+ (id)p_normalDecimalSeparator
{
  v2 = (void *)[MEMORY[0x263EFF960] currentLocale];
  id result = (id)[v2 objectForKey:*MEMORY[0x263EFF4E8]];
  if (!result) {
    return @".";
  }
  return result;
}

+ (void)initialize
{
  {
  }
}

- (__CTParagraphStyle)p_createCoreTextParagraphStyleWithCharacterStyle:(id)a3 writingDirection:(int)a4 lineBoundsOptions:(unint64_t)a5
{
  uint64_t v5 = *(void *)&a4;
  uint64_t v67 = *MEMORY[0x263EF8340];
  unint64_t v53 = a5;
  int v7 = [(TSSStyle *)self intValueForProperty:86];
  if (v7 >= 256)
  {
    double v42 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v43 = [NSString stringWithUTF8String:"-[TSWPParagraphStyle p_createCoreTextParagraphStyleWithCharacterStyle:writingDirection:lineBoundsOptions:]"];
    objc_msgSend(v42, "handleFailureInFunction:file:lineNumber:description:", v43, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPParagraphStyle.mm"), 540, @"Out-of-bounds type assignment was clamped to max");
    char v46 = -1;
  }
  else if (v7 < 0)
  {
    double v44 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v45 = [NSString stringWithUTF8String:"-[TSWPParagraphStyle p_createCoreTextParagraphStyleWithCharacterStyle:writingDirection:lineBoundsOptions:]"];
    objc_msgSend(v44, "handleFailureInFunction:file:lineNumber:description:", v45, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPParagraphStyle.mm"), 540, @"Out-of-bounds type assignment was clamped to min");
    char v46 = 0;
  }
  else
  {
    char v46 = v7;
  }
  int v8 = [(TSWPParagraphStyle *)self p_coreTextWritingDirectionFromWPWritingDirection:v5];
  char v52 = v8;
  [(TSSStyle *)self floatValueForProperty:83];
  double v10 = v9;
  double v51 = v9;
  id v11 = [(TSSStyle *)self valueForProperty:84];
  unint64_t v12 = [v11 count];
  CFMutableArrayRef Mutable = CFArrayCreateMutable(0, 0, MEMORY[0x263EFFF70]);
  CFTypeRef cf = Mutable;
  [(TSSStyle *)self floatValueForProperty:81];
  float v15 = v14;
  if (v14 <= 0.0)
  {
    BOOL v17 = 0;
  }
  else
  {
    [(TSSStyle *)self floatValueForProperty:80];
    BOOL v17 = v16 < v15;
  }
  double v18 = v15;
  if (!v12)
  {
    CFIndex v23 = 0;
    if (!v17) {
      goto LABEL_35;
    }
    goto LABEL_34;
  }
  v48 = self;
  CFIndex v19 = 0;
  v47 = (void *)*MEMORY[0x263F03CC8];
  if (v8 == 1) {
    CGFloat v20 = &unk_22383AC48;
  }
  else {
    CGFloat v20 = &unk_22383AC44;
  }
  double v21 = 0.0;
  unsigned int v22 = 1;
  CFIndex v23 = v12;
  do
  {
    uint64_t v24 = (void *)[v11 tabAtIndex:v19];
    int v25 = [v24 alignment];
    [v24 position];
    if (v26 >= v21) {
      long double v27 = v26;
    }
    else {
      long double v27 = v21;
    }
    if (v25 == 3)
    {
      *(void *)&values.spec = 0;
      *(void *)&values.spec = CFCharacterSetCreateWithCharactersInString(0, (CFStringRef)[(TSSStyle *)v48 valueForProperty:101]);
      keys = v47;
      CFDictionaryRef v28 = CFDictionaryCreate(0, (const void **)&keys, (const void **)&values, 1, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
      CFRelease(*(CFTypeRef *)&values.spec);
    }
    else
    {
      CFDictionaryRef v28 = 0;
    }
    if (v27 == v18 && v17)
    {
      long double v30 = nextafter(v27, v21);
      if (v21 >= v30) {
        long double v30 = nextafter(v27, INFINITY);
      }
    }
    else
    {
      long double v30 = v27;
    }
    CTTextTabRef v31 = CTTextTabCreate((CTTextAlignment)v20[v25], v30, v28);
    if (v28) {
      CFRelease(v28);
    }
    CFArrayAppendValue(Mutable, v31);
    CFRelease(v31);
    BOOL v32 = v23 == v12 && v17;
    if (v32 && v30 > v18) {
      CFIndex v23 = v19;
    }
    double v21 = nextafter(v30, INFINITY);
    CFIndex v19 = v22;
  }
  while (v12 > v22++);
  if (v17)
  {
LABEL_34:
    CTTextTabRef v34 = CTTextTabCreate(kCTTextAlignmentLeft, v18, 0);
    CFArrayInsertValueAtIndex(Mutable, v23, v34);
    CFRelease(v34);
  }
LABEL_35:
  CFIndex Count = CFArrayGetCount(Mutable);
  if (Count)
  {
    ValueAtIndex = (const __CTTextTab *)CFArrayGetValueAtIndex(Mutable, Count - 1);
    double Location = CTTextTabGetLocation(ValueAtIndex);
    double v38 = (floor(Location / v10) + 1.0) * v10;
    if (v38 - Location < v10)
    {
      CTTextTabRef v39 = CTTextTabCreate(kCTTextAlignmentLeft, v38, 0);
      CFArrayAppendValue(Mutable, v39);
      CFRelease(v39);
    }
  }
  LOBYTE(keys) = v46;
  values.spec = kCTParagraphStyleSpecifierAlignment;
  values.valueSize = 1;
  values.value = &keys;
  int v55 = 13;
  uint64_t v56 = 1;
  v57 = &v52;
  int v58 = 5;
  uint64_t v59 = 8;
  v60 = &v51;
  int v61 = 4;
  uint64_t v62 = 8;
  p_CFTypeRef cf = &cf;
  int v64 = 17;
  uint64_t v65 = 8;
  v66 = &v53;
  v40 = CTParagraphStyleCreate(&values, 5uLL);
  CFRelease(cf);
  return v40;
}

- (char)p_coreTextWritingDirectionFromWPWritingDirection:(int)a3
{
  return -1;
}

+ (id)nonEmphasisParagraphProperties
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __52__TSWPParagraphStyle_nonEmphasisParagraphProperties__block_invoke;
  block[3] = &unk_2646AF7B8;
  block[4] = a1;
  if (+[TSWPParagraphStyle nonEmphasisParagraphProperties]::onceToken != -1) {
    dispatch_once(&+[TSWPParagraphStyle nonEmphasisParagraphProperties]::onceToken, block);
  }
  return (id)+[TSWPParagraphStyle nonEmphasisParagraphProperties]::s_nonEmphasisParagraphProperties;
}

id __52__TSWPParagraphStyle_nonEmphasisParagraphProperties__block_invoke(uint64_t a1)
{
  id result = (id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "properties"), "propertySetByRemovingPropertiesFromSet:", +[TSWPCharacterStyle emphasisProperties](TSWPCharacterStyle, "emphasisProperties"));
  +[TSWPParagraphStyle nonEmphasisParagraphProperties]::s_nonEmphasisParagraphProperties = (uint64_t)result;
  return result;
}

+ (id)propertiesAllowingNSNull
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __46__TSWPParagraphStyle_propertiesAllowingNSNull__block_invoke;
  block[3] = &unk_2646AF7B8;
  block[4] = a1;
  if (+[TSWPParagraphStyle propertiesAllowingNSNull]::onceToken != -1) {
    dispatch_once(&+[TSWPParagraphStyle propertiesAllowingNSNull]::onceToken, block);
  }
  return (id)+[TSWPParagraphStyle propertiesAllowingNSNull]::s_nullProperties;
}

id __46__TSWPParagraphStyle_propertiesAllowingNSNull__block_invoke()
{
  id result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "paragraphPropertiesAllowingNSNull"), "propertySetByAddingPropertiesFromSet:", +[TSWPCharacterStyle propertiesAllowingNSNull](TSWPCharacterStyle, "propertiesAllowingNSNull"));
  +[TSWPParagraphStyle propertiesAllowingNSNull]::s_nullProperties = (uint64_t)result;
  return result;
}

+ (id)paragraphPropertiesAllowingNSNull
{
  if (+[TSWPParagraphStyle paragraphPropertiesAllowingNSNull]::onceToken != -1) {
    dispatch_once(&+[TSWPParagraphStyle paragraphPropertiesAllowingNSNull]::onceToken, &__block_literal_global_7);
  }
  return (id)+[TSWPParagraphStyle paragraphPropertiesAllowingNSNull]::s_nullParagraphProperties;
}

TSSPropertySet *__55__TSWPParagraphStyle_paragraphPropertiesAllowingNSNull__block_invoke()
{
  id result = -[TSSPropertySet initWithProperties:]([TSSPropertySet alloc], "initWithProperties:", 101, 98, 99, 85, 105, 103, 84, 108, 112, 114, 0);
  +[TSWPParagraphStyle paragraphPropertiesAllowingNSNull]::s_nullParagraphProperties = (uint64_t)result;
  return result;
}

+ (id)defaultStyleWithContext:(id)a3
{
  objc_super v3 = (void *)[objc_alloc((Class)objc_opt_class()) initWithContext:a3 name:0 overridePropertyMap:0 isVariation:0];

  return v3;
}

- (void)dealloc
{
  scalePercentStyleCaches = self->_scalePercentStyleCaches;
  if (scalePercentStyleCaches) {
    CFRelease(scalePercentStyleCaches);
  }
  styleCache = self->_styleCache;
  if (styleCache) {
    CFRelease(styleCache);
  }
  coreTextParagraphStyle = self->_coreTextParagraphStyle;
  if (coreTextParagraphStyle) {
    CFRelease(coreTextParagraphStyle);
  }
  v6.receiver = self;
  v6.super_class = (Class)TSWPParagraphStyle;
  [(TSSStyle *)&v6 dealloc];
}

- (id)fullPropertyMap
{
  v4.receiver = self;
  v4.super_class = (Class)TSWPParagraphStyle;
  id v2 = [(TSSStyle *)&v4 fullPropertyMap];
  objc_msgSend(v2, "removeValuesForProperties:", objc_msgSend((id)objc_opt_class(), "deprecatedProperties"));
  return v2;
}

- (void)setOverridePropertyMap:(id)a3
{
  [(TSWPParagraphStyle *)self clearStyleCaches];
  id v5 = [(TSSStylesheet *)[(TSSStyle *)self stylesheet] rootAncestor];
  if (v5)
  {
    objc_super v6 = v5;
    do
    {
      objc_msgSend((id)objc_msgSend(v6, "childrenOfStyle:", self), "enumerateObjectsUsingBlock:", &__block_literal_global_25);
      objc_super v6 = (void *)[v6 child];
    }
    while (v6);
  }
  v7.receiver = self;
  v7.super_class = (Class)TSWPParagraphStyle;
  [(TSSStyle *)&v7 setOverridePropertyMap:a3];
}

uint64_t __45__TSWPParagraphStyle_setOverridePropertyMap___block_invoke(uint64_t a1, void *a2)
{
  return [a2 clearStyleCaches];
}

- (void)clearStyleCaches
{
  objc_sync_enter(self);
  scalePercentStyleCaches = self->_scalePercentStyleCaches;
  if (scalePercentStyleCaches)
  {
    CFRelease(scalePercentStyleCaches);
    self->_scalePercentStyleCaches = 0;
  }
  styleCache = self->_styleCache;
  if (styleCache)
  {
    CFRelease(styleCache);
    self->_styleCache = 0;
  }
  coreTextParagraphStyle = self->_coreTextParagraphStyle;
  if (coreTextParagraphStyle)
  {
    CFRelease(coreTextParagraphStyle);
    self->_coreTextParagraphStyle = 0;
  }

  objc_sync_exit(self);
}

- (id)followingParagraphStyle
{
  id v3 = [(TSSStyle *)self valueForProperty:99];
  if (v3 == (id)[MEMORY[0x263EFF9D0] null]) {
    return self;
  }
  objc_opt_class();

  return (id)TSUDynamicCast();
}

- (id)contentTag
{
  id result = [(TSSStyle *)self styleIdentifier];
  if (result)
  {
    objc_super v4 = [(TSSStyle *)self styleIdentifier];
    return (id)String(v4);
  }
  return result;
}

- (id)initialListStyle
{
  id v2 = [(TSSStyle *)self valueForProperty:108];
  if (objc_msgSend(v2, "isEqual:", objc_msgSend(MEMORY[0x263EFF9D0], "null"))) {
    return 0;
  }
  else {
    return v2;
  }
}

- (void)localizeForRightToLeft
{
  int v3 = [(TSSStyle *)self intValueForProperty:86];
  if (v3)
  {
    if (v3 != 1) {
      goto LABEL_6;
    }
    uint64_t v4 = 0;
  }
  else
  {
    uint64_t v4 = 4;
  }
  [(TSSStyle *)self setIntValue:v4 forProperty:86];
LABEL_6:

  [(TSSStyle *)self setIntValue:0xFFFFFFFFLL forProperty:44];
}

- (void)localizeForBidi:(BOOL)a3
{
  BOOL v3 = a3;
  int v5 = [(TSSStyle *)self intValueForProperty:86];
  if (v5 != 1)
  {
    if (!v5) {
      [(TSSStyle *)self setIntValue:4 forProperty:86];
    }
    [(TSSStyle *)self setIntValue:0xFFFFFFFFLL forProperty:44];
    if (!v3) {
      return;
    }
LABEL_8:
    [(TSSStyle *)self floatValueForProperty:81];
    int v7 = v6;
    [(TSSStyle *)self floatValueForProperty:82];
    int v9 = v8;
    LODWORD(v10) = v7;
    [(TSSStyle *)self setFloatValue:82 forProperty:v10];
    LODWORD(v11) = v9;
    [(TSSStyle *)self setFloatValue:81 forProperty:v11];
    return;
  }
  if (v3)
  {
    [(TSSStyle *)self setIntValue:0 forProperty:86];
    [(TSSStyle *)self setIntValue:0xFFFFFFFFLL forProperty:44];
    goto LABEL_8;
  }

  [(TSSStyle *)self setIntValue:0xFFFFFFFFLL forProperty:44];
}

- (BOOL)transformsFontSizes
{
  return 1;
}

- (SEL)mapThemePropertyMapSelector
{
  return sel_tswpMapParagraphStylePropertyMap_;
}

+ (id)presetStyleDescriptor
{
  return @"paragraphstyle";
}

- (NSString)presetKind
{
  return (NSString *)String;
}

+ (id)styleSummaryForPropertyMap:(id)a3
{
  uint64_t v4 = [a3 boxedObjectForProperty:16];
  [a3 floatValueForProperty:17];
  double v6 = v5;
  if ([a3 intValueForProperty:19]) {
    int v7 = @"B";
  }
  else {
    int v7 = &stru_26D688A48;
  }
  if ([a3 intValueForProperty:20]) {
    int v8 = @"I";
  }
  else {
    int v8 = &stru_26D688A48;
  }
  if ([a3 intValueForProperty:22]) {
    int v9 = @"U";
  }
  else {
    int v9 = &stru_26D688A48;
  }
  int v10 = [a3 intValueForProperty:26];
  double v11 = @"S";
  if (!v10) {
    double v11 = &stru_26D688A48;
  }
  return (id)[NSString stringWithFormat:@"%@-%g [%@%@%@%@]", v4, *(void *)&v6, v7, v8, v9, v11];
}

- (id)styleSummary
{
  BOOL v3 = objc_opt_class();
  id v4 = [(TSSStyle *)self propertyMap];

  return (id)[v3 styleSummaryForPropertyMap:v4];
}

@end