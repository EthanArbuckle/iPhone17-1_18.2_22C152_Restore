@interface GQHState
- (BOOL)allowInlineWrap;
- (BOOL)coloredBackground;
- (BOOL)drawablesNeedCssZOrdering;
- (BOOL)finishMainHtml;
- (BOOL)multiColumned;
- (BOOL)needAbsolutelyPositionedTables;
- (BOOL)shouldMapLinkWithUrl:(__CFString *)a3;
- (BOOL)useOutline;
- (CGSize)scale;
- (GQHState)initWithState:(id)a3;
- (GQHState)initWithState:(id)a3 documentSize:(CGSize)a4;
- (GQHState)initWithState:(id)a3 needIndexFile:(BOOL)a4 documentSize:(CGSize)a5;
- (__CFString)addCacheForCellStyle:(id)a3 fillStyle:(id)a4 cellClass:(Class)a5 vectorStyles:(id *)a6 groupLevel:(unsigned __int16)a7 hasFormula:(BOOL)a8 baseClassString:(__CFString *)a9 cssCachedStyle:(id)a10;
- (__CFString)addCachedClassStringForTextStyle:(id)a3 implicitStyle:(id)a4 isColoredBackground:(BOOL)a5 outlineLevel:(int)a6 outlineType:(int)a7 isSpan:(BOOL)a8 baseClassString:(__CFString *)a9 cssCachedStyle:(id)a10;
- (__CFString)cachedClassStringForCellStyle:(id)a3 fillStyle:(id)a4 cellClass:(Class)a5 vectorStyles:(id *)a6 groupLevel:(unsigned __int16)a7 hasFormula:(BOOL)a8;
- (__CFString)cachedClassStringForTextStyle:(id)a3 implicitStyle:(id)a4 isColoredBackground:(BOOL)a5 outlineLevel:(int)a6 outlineType:(int)a7 isSpan:(BOOL)a8;
- (__CFString)className:(id)a3;
- (__CFString)createStyleName:(id)a3 type:(const char *)a4;
- (__CFString)createUniqueShapeId:(const char *)a3;
- (__CFString)cssZOrderClassForDrawable:(id)a3;
- (__CFString)cssZOrderClassForDrawableUid:(const char *)a3;
- (__CFString)getColorString:(id)a3;
- (__CFString)makeInlineStyle:(__CFString *)a3;
- (__CFString)makeInlineStyle:(__CFString *)a3 inDocument:(id)a4;
- (id)htmlDoc;
- (id)implicitStyle;
- (id)processorState;
- (id)shapeContext;
- (id)tableState;
- (int)indexForStyle:(const char *)a3;
- (int)outlineLevel;
- (int)outlineStyleType;
- (int)paragraphCount;
- (int)paragraphIndex;
- (unsigned)textScale;
- (void)addCachedStyle:(__CFString *)a3;
- (void)addStyle:(__CFString *)a3 className:(__CFString *)a4 srcStyle:(id)a5;
- (void)dealloc;
- (void)enterGraphicObject;
- (void)invalidateTextScale;
- (void)leaveGraphicObject;
- (void)popImplicitStyle;
- (void)pushImplicitStyle:(id)a3;
- (void)setColoredBackground:(BOOL)a3;
- (void)setMultiColumned:(BOOL)a3;
- (void)setParagraphCount:(int)a3;
- (void)setParagraphIndex:(int)a3;
- (void)setScale:(CGSize)a3;
- (void)setTextScale:(unsigned int)a3;
@end

@implementation GQHState

- (GQHState)initWithState:(id)a3 needIndexFile:(BOOL)a4 documentSize:(CGSize)a5
{
  double height = a5.height;
  double width = a5.width;
  BOOL v7 = a4;
  CGSize v20 = a5;
  v19.receiver = self;
  v19.super_class = (Class)GQHState;
  v9 = [(GQHState *)&v19 init];
  if (v9)
  {
    if (v7)
    {
      v10 = [GQHXML alloc];
      if (height <= 1.0 || width <= 1.0) {
        v12 = 0;
      }
      else {
        v12 = &v20;
      }
      v9->mHtmlDoc = -[GQHXML initWithFilename:documentSize:outputBundle:useExternalCss:](v10, "initWithFilename:documentSize:outputBundle:useExternalCss:", @"index.html", v12, [a3 outputBundle], -[GQSDocument isGeneratingThumbnail](v9->mProcessorState, "isGeneratingThumbnail") ^ 1);
    }
    __asm { FMOV            V0.2D, #1.0 }
    v9->mScale = _Q0;
    v9->mTableState = objc_alloc_init(GQHTableState);
    v9->mProcessorState = (GQSDocument *)a3;
    v9->mStyleIndexes = CFDictionaryCreateMutable(0, 0, (const CFDictionaryKeyCallBacks *)&unk_850E0, &kCFTypeDictionaryValueCallBacks);
    v9->mStyleNameMap = CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
    v9->mImplicitStyles = CFArrayCreateMutable(0, 0, &kCFTypeArrayCallBacks);
    *(void *)&v9->mColoredBackgroundLayerCount = 0;
    v9->mGraphicPropertiesStack = CFArrayCreateMutable(0, 0, &kCFTypeArrayCallBacks);
    v9->mCachedTableStyles = CFDictionaryCreateMutable(0, 0, (const CFDictionaryKeyCallBacks *)&unk_84BB0, &kCFTypeDictionaryValueCallBacks);
    v9->mCachedTextStyles = CFDictionaryCreateMutable(0, 0, (const CFDictionaryKeyCallBacks *)&unk_84BE0, &kCFTypeDictionaryValueCallBacks);
    v9->mInlineStyles = CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
    v9->mColorStrings = CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
    v9->mShapeContext = (GQHContext *)objc_alloc_init(GQHCanvasContext);
  }
  return v9;
}

- (GQHState)initWithState:(id)a3
{
  return -[GQHState initWithState:needIndexFile:documentSize:](self, "initWithState:needIndexFile:documentSize:", a3, 0, 0.0, 0.0);
}

- (GQHState)initWithState:(id)a3 documentSize:(CGSize)a4
{
  return -[GQHState initWithState:needIndexFile:documentSize:](self, "initWithState:needIndexFile:documentSize:", a3, 1, a4.width, a4.height);
}

- (void)dealloc
{
  mStyleIndexes = self->mStyleIndexes;
  if (mStyleIndexes) {
    CFRelease(mStyleIndexes);
  }
  mStyleNameMap = self->mStyleNameMap;
  if (mStyleNameMap) {
    CFRelease(mStyleNameMap);
  }
  mCachedTableStyles = self->mCachedTableStyles;
  if (mCachedTableStyles) {
    CFRelease(mCachedTableStyles);
  }
  mCachedTextStyles = self->mCachedTextStyles;
  if (mCachedTextStyles) {
    CFRelease(mCachedTextStyles);
  }
  mInlineStyles = self->mInlineStyles;
  if (mInlineStyles) {
    CFRelease(mInlineStyles);
  }
  mColorStrings = self->mColorStrings;
  if (mColorStrings) {
    CFRelease(mColorStrings);
  }

  mImplicitStyles = self->mImplicitStyles;
  if (mImplicitStyles) {
    CFRelease(mImplicitStyles);
  }
  mGraphicPropertiesStack = self->mGraphicPropertiesStack;
  if (mGraphicPropertiesStack) {
    CFRelease(mGraphicPropertiesStack);
  }

  v11.receiver = self;
  v11.super_class = (Class)GQHState;
  [(GQHState *)&v11 dealloc];
}

- (id)htmlDoc
{
  return self->mHtmlDoc;
}

- (void)setScale:(CGSize)a3
{
  self->mScale = a3;
}

- (CGSize)scale
{
  double width = self->mScale.width;
  double height = self->mScale.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)addStyle:(__CFString *)a3 className:(__CFString *)a4 srcStyle:(id)a5
{
  if (![(GQHState *)self className:a5])
  {
    CFDictionarySetValue(self->mStyleNameMap, a5, a4);
    mHtmlDoc = self->mHtmlDoc;
    [(GQHXML *)mHtmlDoc addStyleClass:a3];
  }
}

- (__CFString)makeInlineStyle:(__CFString *)a3
{
  return [(GQHState *)self makeInlineStyle:a3 inDocument:self->mHtmlDoc];
}

- (__CFString)makeInlineStyle:(__CFString *)a3 inDocument:(id)a4
{
  Value = (__CFString *)CFDictionaryGetValue(self->mInlineStyles, a3);
  if (!Value)
  {
    uint64_t v8 = (self->mInlineStyleIndex + 1);
    self->mInlineStyleIndex = v8;
    Value = (__CFString *)CFStringCreateWithFormat(0, 0, @"i%d", v8);
    CFDictionarySetValue(self->mInlineStyles, a3, Value);
    CFRelease(Value);
    CFStringRef v9 = CFStringCreateWithFormat(0, 0, @".%@ { %@ }\n", Value, a3);
    [a4 addStyleClassLast:v9];
    CFRelease(v9);
  }
  return Value;
}

- (void)addCachedStyle:(__CFString *)a3
{
}

- (__CFString)className:(id)a3
{
  return (__CFString *)CFDictionaryGetValue(self->mStyleNameMap, a3);
}

- (id)tableState
{
  return self->mTableState;
}

- (id)processorState
{
  return self->mProcessorState;
}

- (BOOL)finishMainHtml
{
  mHtmlDoc = self->mHtmlDoc;
  id v4 = [(GQSDocument *)self->mProcessorState outputBundle];
  BOOL v5 = [(GQSDocument *)self->mProcessorState isGeneratingThumbnail];
  return [(GQHXML *)mHtmlDoc writeToOutputBundle:v4 isThumbnail:v5];
}

- (__CFString)createStyleName:(id)a3 type:(const char *)a4
{
  return (__CFString *)CFStringCreateWithFormat(0, 0, @"%s%d", a4, [(GQHState *)self indexForStyle:a4]);
}

- (BOOL)drawablesNeedCssZOrdering
{
  return 0;
}

- (__CFString)cssZOrderClassForDrawable:(id)a3
{
  id v4 = [a3 uid];
  return [(GQHState *)self cssZOrderClassForDrawableUid:v4];
}

- (__CFString)cssZOrderClassForDrawableUid:(const char *)a3
{
  return &stru_85630;
}

- (void)pushImplicitStyle:(id)a3
{
}

- (id)implicitStyle
{
  int Count = CFArrayGetCount(self->mImplicitStyles);
  if (!Count) {
    return 0;
  }
  CFIndex v4 = (Count - 1);
  mImplicitStyles = self->mImplicitStyles;
  return (id)CFArrayGetValueAtIndex(mImplicitStyles, v4);
}

- (void)popImplicitStyle
{
  int Count = CFArrayGetCount(self->mImplicitStyles);
  if (Count)
  {
    CFIndex v4 = (Count - 1);
    mImplicitStyles = self->mImplicitStyles;
    CFArrayRemoveValueAtIndex(mImplicitStyles, v4);
  }
}

- (void)setColoredBackground:(BOOL)a3
{
  BOOL v3 = a3;
  int Count = CFArrayGetCount(self->mGraphicPropertiesStack);
  CFDictionaryRef ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(self->mGraphicPropertiesStack, Count - 1);
  value = 0;
  if (CFDictionaryGetValueIfPresent(ValueAtIndex, @"Colored Background", (const void **)&value)
    && CFBooleanGetValue((CFBooleanRef)value))
  {
    if (v3) {
      return;
    }
    int v7 = -1;
    uint64_t v8 = (const void **)&kCFBooleanFalse;
  }
  else
  {
    if (!v3) {
      return;
    }
    int v7 = 1;
    uint64_t v8 = (const void **)&kCFBooleanTrue;
  }
  CFDictionarySetValue(ValueAtIndex, @"Colored Background", *v8);
  self->mColoredBackgroundLayerCount += v7;
}

- (BOOL)coloredBackground
{
  return (objc_opt_isKindOfClass() & 1) == 0
      || [(GQHState *)self mode]
      || self->mColoredBackgroundLayerCount != 0;
}

- (void)setMultiColumned:(BOOL)a3
{
  BOOL v3 = a3;
  int Count = CFArrayGetCount(self->mGraphicPropertiesStack);
  CFDictionaryRef ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(self->mGraphicPropertiesStack, Count - 1);
  value = 0;
  if (CFDictionaryGetValueIfPresent(ValueAtIndex, @"Multi Columned", (const void **)&value)
    && CFBooleanGetValue((CFBooleanRef)value))
  {
    if (v3) {
      return;
    }
    int v7 = -1;
    uint64_t v8 = (const void **)&kCFBooleanFalse;
  }
  else
  {
    if (!v3) {
      return;
    }
    int v7 = 1;
    uint64_t v8 = (const void **)&kCFBooleanTrue;
  }
  CFDictionarySetValue(ValueAtIndex, @"Multi Columned", *v8);
  self->mMultiColumnedDepth += v7;
}

- (BOOL)multiColumned
{
  return self->mMultiColumnedDepth != 0;
}

- (void)enterGraphicObject
{
  CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFArrayAppendValue(self->mGraphicPropertiesStack, Mutable);
  CFRelease(Mutable);
}

- (void)leaveGraphicObject
{
  int Count = CFArrayGetCount(self->mGraphicPropertiesStack);
  [(GQHState *)self setColoredBackground:0];
  [(GQHState *)self setMultiColumned:0];
  mGraphicPropertiesStack = self->mGraphicPropertiesStack;
  CFArrayRemoveValueAtIndex(mGraphicPropertiesStack, Count - 1);
}

- (void)setParagraphCount:(int)a3
{
  self->mParagraphint Count = a3;
}

- (int)paragraphCount
{
  return self->mParagraphCount;
}

- (void)setParagraphIndex:(int)a3
{
  self->mParagraphIndex = a3;
}

- (int)paragraphIndex
{
  return self->mParagraphIndex;
}

- (__CFString)cachedClassStringForCellStyle:(id)a3 fillStyle:(id)a4 cellClass:(Class)a5 vectorStyles:(id *)a6 groupLevel:(unsigned __int16)a7 hasFormula:(BOOL)a8
{
  v10[0] = a3;
  v10[1] = a4;
  long long v8 = *((_OWORD *)a6 + 1);
  long long v11 = *(_OWORD *)a6;
  long long v12 = v8;
  Class v13 = a5;
  int v14 = a7;
  BOOL v15 = a8;
  return (__CFString *)CFDictionaryGetValue(self->mCachedTableStyles, v10);
}

- (__CFString)addCacheForCellStyle:(id)a3 fillStyle:(id)a4 cellClass:(Class)a5 vectorStyles:(id *)a6 groupLevel:(unsigned __int16)a7 hasFormula:(BOOL)a8 baseClassString:(__CFString *)a9 cssCachedStyle:(id)a10
{
  *(void *)&long long key = a3;
  *((void *)&key + 1) = a4;
  long long v11 = *((_OWORD *)a6 + 1);
  long long v23 = *(_OWORD *)a6;
  long long v24 = v11;
  *(void *)&long long v25 = a5;
  DWORD2(v25) = a7;
  BYTE12(v25) = a8;
  Value = (__CFString *)CFDictionaryGetValue(self->mCachedTableStyles, &key);
  if (!Value)
  {
    uint64_t v13 = (self->mCachedCellStyleIndex + 1);
    self->mCachedCellStyleIndex = v13;
    CFStringRef v14 = CFStringCreateWithFormat(0, 0, @"ic%d", v13);
    id v15 = [a10 createNamedStyle:v14];
    if (v15)
    {
      v16 = v15;
      [(GQHState *)self addCachedStyle:v15];
      CFRelease(v16);
    }
    Value = (__CFString *)CFStringCreateWithFormat(0, 0, @"%@%@", a9, v14);
    CFRelease(v14);
    v17 = malloc_type_malloc(0x40uLL, 0x1080040398047DBuLL);
    long long v18 = v25;
    long long v20 = key;
    long long v19 = v23;
    v17[2] = v24;
    v17[3] = v18;
    _OWORD *v17 = v20;
    v17[1] = v19;
    CFDictionarySetValue(self->mCachedTableStyles, v17, Value);
    CFRelease(Value);
  }
  return Value;
}

- (__CFString)cachedClassStringForTextStyle:(id)a3 implicitStyle:(id)a4 isColoredBackground:(BOOL)a5 outlineLevel:(int)a6 outlineType:(int)a7 isSpan:(BOOL)a8
{
  v9[0] = a3;
  v9[1] = a4;
  BOOL v10 = a5;
  int v11 = a6;
  int v12 = a7;
  BOOL v13 = a8;
  return (__CFString *)CFDictionaryGetValue(self->mCachedTextStyles, v9);
}

- (__CFString)addCachedClassStringForTextStyle:(id)a3 implicitStyle:(id)a4 isColoredBackground:(BOOL)a5 outlineLevel:(int)a6 outlineType:(int)a7 isSpan:(BOOL)a8 baseClassString:(__CFString *)a9 cssCachedStyle:(id)a10
{
  *(void *)&long long key = a3;
  *((void *)&key + 1) = a4;
  LOBYTE(v20) = a5;
  DWORD1(v20) = a6;
  DWORD2(v20) = a7;
  BYTE12(v20) = a8;
  Value = (__CFString *)CFDictionaryGetValue(self->mCachedTextStyles, &key);
  if (!Value)
  {
    uint64_t v12 = (self->mCachedTextStyleIndex + 1);
    self->mCachedTextStyleIndex = v12;
    CFStringRef v13 = CFStringCreateWithFormat(0, 0, @"it%d", v12);
    id v14 = [a10 createNamedStyle:v13];
    if (v14)
    {
      id v15 = v14;
      [(GQHState *)self addCachedStyle:v14];
      CFRelease(v15);
    }
    Value = (__CFString *)CFStringCreateWithFormat(0, 0, @"%@%@", a9, v13);
    CFRelease(v13);
    v16 = malloc_type_malloc(0x20uLL, 0x1080040BD8EE1D8uLL);
    long long v17 = v20;
    _OWORD *v16 = key;
    v16[1] = v17;
    CFDictionarySetValue(self->mCachedTextStyles, v16, Value);
    CFRelease(Value);
  }
  return Value;
}

- (__CFString)getColorString:(id)a3
{
  value = 0;
  if (!CFDictionaryGetValueIfPresent(self->mColorStrings, a3, (const void **)&value))
  {
    double v16 = 0.0;
    double v17 = 0.0;
    double v14 = 1.0;
    double v15 = 0.0;
    [a3 getRed:&v17 green:&v16 blue:&v15 alpha:&v14];
    float v5 = v14 + -1.0;
    float v6 = v17 * 255.0;
    unint64_t v7 = llroundf(v6);
    float v8 = v16 * 255.0;
    unint64_t v9 = llroundf(v8);
    float v10 = v15 * 255.0;
    unint64_t v11 = llroundf(v10);
    if (fabsf(v5) >= 0.01) {
      uint64_t v12 = (__CFString *)CFStringCreateWithFormat(kCFAllocatorDefault, 0, @"rgba(%ld,%ld,%ld,%01.1f)", v7, v9, v11, *(void *)&v14);
    }
    else {
      uint64_t v12 = (__CFString *)CFStringCreateWithFormat(kCFAllocatorDefault, 0, @"rgb(%ld,%ld,%ld)", v7, v9, v11);
    }
    value = v12;
    CFDictionaryAddValue(self->mColorStrings, a3, v12);
    CFRelease(value);
  }
  return (__CFString *)value;
}

- (BOOL)shouldMapLinkWithUrl:(__CFString *)a3
{
  return a3 && CFStringHasPrefix(a3, @"?") == 0;
}

- (id)shapeContext
{
  return self->mShapeContext;
}

- (BOOL)useOutline
{
  return 0;
}

- (int)outlineLevel
{
  return self->mOutlineLevel;
}

- (int)outlineStyleType
{
  return self->mOutlineStyleType;
}

- (__CFString)createUniqueShapeId:(const char *)a3
{
  if (a3)
  {
    return (__CFString *)CFStringCreateWithCString(0, a3, 0x8000100u);
  }
  else
  {
    uint64_t mShapeIDCounter = self->mShapeIDCounter;
    self->uint64_t mShapeIDCounter = mShapeIDCounter + 1;
    return (__CFString *)CFStringCreateWithFormat(0, 0, @"ShapeId_%d", mShapeIDCounter);
  }
}

- (unsigned)textScale
{
  return self->mTextScale;
}

- (void)setTextScale:(unsigned int)a3
{
  self->mTextScale = a3;
}

- (void)invalidateTextScale
{
  self->mTextScale = 0;
}

- (BOOL)needAbsolutelyPositionedTables
{
  return 1;
}

- (BOOL)allowInlineWrap
{
  return 1;
}

- (int)indexForStyle:(const char *)a3
{
  Value = (void *)CFDictionaryGetValue(self->mStyleIndexes, a3);
  if (Value) {
    uint64_t v6 = [Value intValue] + 1;
  }
  else {
    uint64_t v6 = 1;
  }
  id v7 = [objc_alloc((Class)NSNumber) initWithInt:v6];
  CFDictionarySetValue(self->mStyleIndexes, a3, v7);

  return v6;
}

@end