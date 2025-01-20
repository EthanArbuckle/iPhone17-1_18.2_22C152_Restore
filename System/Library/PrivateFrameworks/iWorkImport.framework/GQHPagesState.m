@interface GQHPagesState
- ($0AC6E346AE4835514AAA8AC86D8F4844)rangeForSectionStyleAtPageIndex:(int)a3;
- (BOOL)allowInlineWrap;
- (BOOL)hasLayoutDrawables;
- (BOOL)isMappingHeadersFooters;
- (BOOL)needAbsolutelyPositionedTables;
- (BOOL)splitNextAttachment;
- (BOOL)useOutline;
- (CGSize)pageSize;
- (GQHPagesState)initWithState:(id)a3 documentSize:(CGSize)a4;
- (__CFArray)pageDrawables:(int)a3;
- (__CFDictionary)pagesOrderToCssZOrderClassMapDictionary;
- (__CFString)cssZOrderClassForDrawable:(id)a3;
- (__CFString)cssZOrderClassForDrawablePagesOrder:(int)a3;
- (const)wrapPoints;
- (double)currentAttachmentPosition;
- (double)moveToNextAttachmentPosition;
- (id)drawableAtIndex:(int)a3;
- (id)footerForName:(__CFString *)a3;
- (id)headerForName:(__CFString *)a3;
- (id)sectionStyleForPageIndex:(int)a3;
- (id)sectionStyleRunForRunBeforePageIndex:(int)a3;
- (id)wrapPointSetForPage:(int)a3;
- (int)currentPageIndex;
- (int)floatingDrawablesCount;
- (int)mode;
- (int)pageNumberForHeaderOrFooter;
- (int64_t)currentAttachmentId;
- (int64_t)firstAttachmentId;
- (int64_t)nextAttachmentId;
- (unsigned)tocDepth;
- (void)addAttachmentPosition:(double)a3;
- (void)addFloatingDrawable:(id)a3;
- (void)addSectionStyle:(id)a3 pageIndex:(int)a4 numPages:(int)a5;
- (void)addStyle:(__CFString *)a3 className:(__CFString *)a4 srcStyle:(id)a5;
- (void)addWrapPoint:(id)a3;
- (void)beginWrapPointSet;
- (void)clearFloatingDrawables;
- (void)closeStateLayoutElementsAndStyles;
- (void)createListOfWrapPointsAlongY:(float)a3 minX:(float)a4 maxX:(float)a5 zIndex:(int)a6;
- (void)dealloc;
- (void)endSection;
- (void)endWrapPointSet;
- (void)finishedWithSplitAttachment;
- (void)handleContainerHint:(id)a3;
- (void)inContent;
- (void)insertAttachmentPlaceholder;
- (void)mapFloatingDrawablesForPageAtIndex:(unint64_t)a3;
- (void)openStateLayoutElementsAndStyles;
- (void)overrideSectionStyle:(id)a3;
- (void)popTocHref;
- (void)pushTocHref:(__CFString *)a3;
- (void)resolveHeaderName:(const __CFString *)a3 footerName:(const __CFString *)a4;
- (void)setCurrentLayoutStyle:(id)a3;
- (void)setCurrentPageIndex:(int)a3;
- (void)setCurrentParagraphStyle:(id)a3 baseStyle:(id)a4 cachedClass:(__CFString *)a5;
- (void)setCurrentSpanStyle:(id)a3 baseStyle:(id)a4 cachedClass:(__CFString *)a5;
- (void)setDidFindContainerHint:(BOOL)a3;
- (void)setDidInsertPageHeader:(BOOL)a3;
- (void)setFooters:(__CFArray *)a3;
- (void)setHasLayoutDrawables:(BOOL)a3;
- (void)setHeaders:(__CFArray *)a3;
- (void)setIsMappingHeadersFooters:(BOOL)a3;
- (void)setMode:(int)a3;
- (void)setOutlineLevel:(int)a3;
- (void)setOutlineStyleType:(int)a3;
- (void)setPageSize:(CGSize)a3;
- (void)startLayout;
- (void)startSection;
@end

@implementation GQHPagesState

- (GQHPagesState)initWithState:(id)a3 documentSize:(CGSize)a4
{
  v6.receiver = self;
  v6.super_class = (Class)GQHPagesState;
  v4 = -[GQHState initWithState:documentSize:](&v6, "initWithState:documentSize:", a3, a4.width, a4.height);
  if (v4)
  {
    v4->mFloatingDrawables = CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
    v4->mSectionStyles = CFArrayCreateMutable(0, 0, &kCFTypeArrayCallBacks);
    v4->mPageWrapPointsMap = CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
    v4->mMappingFloatingDrawables = 0;
    v4->mAttachmentPositions = CFArrayCreateMutable(0, 0, &kCFTypeArrayCallBacks);
    v4->mDrawablePagesOrderToCssZOrderClassMap = CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
    v4->mStartPageAt = 1;
    v4->mStartPageAtValueChangedAtPageIndex = 0;
    v4->mProgressiveIndex = 2;
  }
  return v4;
}

- (void)dealloc
{
  CFRelease(self->mFloatingDrawables);
  mSectionStyles = self->mSectionStyles;
  if (mSectionStyles) {
    CFRelease(mSectionStyles);
  }
  mPageWrapPointsMap = self->mPageWrapPointsMap;
  if (mPageWrapPointsMap) {
    CFRelease(mPageWrapPointsMap);
  }

  mAttachmentPositions = self->mAttachmentPositions;
  if (mAttachmentPositions) {
    CFRelease(mAttachmentPositions);
  }
  mDrawablePagesOrderToCssZOrderClassMap = self->mDrawablePagesOrderToCssZOrderClassMap;
  if (mDrawablePagesOrderToCssZOrderClassMap) {
    CFRelease(mDrawablePagesOrderToCssZOrderClassMap);
  }
  mHeaders = self->mHeaders;
  if (mHeaders) {
    CFRelease(mHeaders);
  }
  mFooters = self->mFooters;
  if (mFooters) {
    CFRelease(mFooters);
  }

  mTocHrefStack = self->mTocHrefStack;
  if (mTocHrefStack) {
    CFRelease(mTocHrefStack);
  }
  v10.receiver = self;
  v10.super_class = (Class)GQHPagesState;
  [(GQHState *)&v10 dealloc];
}

- (int)floatingDrawablesCount
{
  v2 = [(GQHPagesState *)self pageDrawables:self->mCurrentPageIndex];
  if (v2) {
    LODWORD(v2) = CFArrayGetCount(v2);
  }
  return (int)v2;
}

- (void)addFloatingDrawable:(id)a3
{
  id v5 = [objc_alloc((Class)NSNumber) initWithInt:self->mCurrentPageIndex];
  Value = (void *)CFDictionaryGetValue(self->mFloatingDrawables, v5);
  if (!Value)
  {
    Value = CFArrayCreateMutable(0, 0, &kCFTypeArrayCallBacks);
    CFDictionaryAddValue(self->mFloatingDrawables, v5, Value);
    CFRelease(Value);
  }

  CFArrayAppendValue((CFMutableArrayRef)Value, a3);
}

- (id)drawableAtIndex:(int)a3
{
  id result = [(GQHPagesState *)self pageDrawables:self->mCurrentPageIndex];
  if (result)
  {
    return (id)CFArrayGetValueAtIndex((CFArrayRef)result, a3);
  }
  return result;
}

- (void)clearFloatingDrawables
{
  id key = [objc_alloc((Class)NSNumber) initWithInt:self->mCurrentPageIndex];
  Value = (__CFArray *)CFDictionaryGetValue(self->mFloatingDrawables, key);
  if (Value) {
    CFArrayRemoveAllValues(Value);
  }
  CFDictionaryRemoveValue(self->mFloatingDrawables, key);
}

- (__CFArray)pageDrawables:(int)a3
{
  id v4 = [objc_alloc((Class)NSNumber) initWithInt:*(void *)&a3];
  Value = (__CFArray *)CFDictionaryGetValue(self->mFloatingDrawables, v4);

  return Value;
}

- (int)mode
{
  return self->mMode;
}

- (void)setMode:(int)a3
{
  self->mMode = a3;
}

- (id)headerForName:(__CFString *)a3
{
  id result = self->mHeaders;
  if (result) {
    return (id)CFDictionaryGetValue((CFDictionaryRef)result, a3);
  }
  return result;
}

- (void)setHeaders:(__CFArray *)a3
{
  mHeaders = self->mHeaders;
  if (mHeaders)
  {
    CFRelease(mHeaders);
    self->mHeaders = 0;
  }
  Mutable = CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  if (a3)
  {
    uint64_t Count = CFArrayGetCount(a3);
    if (Count)
    {
      CFIndex v8 = 0;
      do
      {
        ValueAtIndex = (void *)CFArrayGetValueAtIndex(a3, v8);
        CFDictionarySetValue(Mutable, [ValueAtIndex name], ValueAtIndex);
        ++v8;
      }
      while (Count != v8);
    }
  }
  self->mHeaders = Mutable;
}

- (id)footerForName:(__CFString *)a3
{
  id result = self->mFooters;
  if (result) {
    return (id)CFDictionaryGetValue((CFDictionaryRef)result, a3);
  }
  return result;
}

- (void)setFooters:(__CFArray *)a3
{
  mFooters = self->mFooters;
  if (mFooters)
  {
    CFRelease(mFooters);
    self->mFooters = 0;
  }
  Mutable = CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  if (a3)
  {
    uint64_t Count = CFArrayGetCount(a3);
    if (Count)
    {
      CFIndex v8 = 0;
      do
      {
        ValueAtIndex = (void *)CFArrayGetValueAtIndex(a3, v8);
        CFDictionarySetValue(Mutable, [ValueAtIndex name], ValueAtIndex);
        ++v8;
      }
      while (Count != v8);
    }
  }
  self->mFooters = Mutable;
}

- (void)addSectionStyle:(id)a3 pageIndex:(int)a4 numPages:(int)a5
{
  if (a4 < 0) {
    return;
  }
  LODWORD(v6) = a4;
  int Count = CFArrayGetCount(self->mSectionStyles);
  int v10 = v6 - Count;
  if ((int)v6 <= Count)
  {
    if (v6)
    {
      ValueAtIndex = (GQHSectionStyleRun *)CFArrayGetValueAtIndex(self->mSectionStyles, (v6 - 1));
      if (ValueAtIndex->mStyle == a3)
      {
        int v14 = a5 + v6;
        ValueAtIndex->mPageRange.length = a5 + (int)v6 - ValueAtIndex->mPageRange.location;
        valueb = ValueAtIndex;
        v15 = ValueAtIndex;
        v13 = valueb;
        goto LABEL_9;
      }
    }
  }
  else
  {
    do
    {
      CFArrayAppendValue(self->mSectionStyles, kCFNull);
      --v10;
    }
    while (v10);
  }
  valuea = objc_alloc_init(GQHSectionStyleRun);
  v12 = (GQDSStyle *)a3;
  v13 = valuea;
  valuea->mStyle = v12;
  valuea->mPageRange.location = v6;
  valuea->mPageRange.length = a5;
  int v14 = a5 + v6;
LABEL_9:
  if (a5 >= 1)
  {
    CFIndex v6 = (int)v6;
    value = v13;
    do
      CFArraySetValueAtIndex(self->mSectionStyles, v6++, value);
    while (v6 < v14);
  }
  _objc_release_x1();
}

- (id)sectionStyleForPageIndex:(int)a3
{
  if (a3 < 0) {
    return 0;
  }
  uint64_t v3 = *(void *)&a3;
  if (CFArrayGetCount(self->mSectionStyles) > a3)
  {
    ValueAtIndex = (id *)CFArrayGetValueAtIndex(self->mSectionStyles, v3);
    if (ValueAtIndex != (id *)kCFNull) {
      return ValueAtIndex[1];
    }
    return 0;
  }
  mCurrentSectionStyle = self->mCurrentSectionStyle;
  if (mCurrentSectionStyle) {
    [(GQHPagesState *)self addSectionStyle:self->mCurrentSectionStyle pageIndex:v3 numPages:1];
  }
  return mCurrentSectionStyle;
}

- ($0AC6E346AE4835514AAA8AC86D8F4844)rangeForSectionStyleAtPageIndex:(int)a3
{
  if (a3 < 0)
  {
    int64_t v8 = 0;
    int64_t v7 = 0;
  }
  else if (CFArrayGetCount(self->mSectionStyles) <= a3 {
         || (ValueAtIndex = CFArrayGetValueAtIndex(self->mSectionStyles, a3),
  }
             ValueAtIndex == (void *)kCFNull))
  {
    int64_t v8 = 0;
    int64_t v7 = 0;
  }
  else
  {
    CFIndex v6 = ValueAtIndex;
    int64_t v7 = ValueAtIndex[2];
    int64_t v8 = v6[3];
  }
  result.var1 = v8;
  result.var0 = v7;
  return result;
}

- (void)overrideSectionStyle:(id)a3
{
  CFRetain(a3);
  mCurrentSectionStyle = self->mCurrentSectionStyle;
  if (mCurrentSectionStyle) {
    CFRelease(mCurrentSectionStyle);
  }
  self->mCurrentSectionStyle = (GQDSStyle *)a3;
}

- (int)currentPageIndex
{
  return self->mCurrentPageIndex;
}

- (void)setCurrentPageIndex:(int)a3
{
  self->mCurrentPageIndex = a3;
}

- (void)setCurrentLayoutStyle:(id)a3
{
  if (!self->mMappingFloatingDrawables)
  {
    id v5 = a3;

    self->mCurrentLayoutStyle = (GQHStyle *)a3;
  }
}

- (void)setCurrentParagraphStyle:(id)a3 baseStyle:(id)a4 cachedClass:(__CFString *)a5
{
  if (!self->mMappingFloatingDrawables && !self->mIsMappingHeadersFooters)
  {
    id v9 = a3;
    id v10 = a4;
    if (a5) {
      CFRetain(a5);
    }

    mCurrentCachedParagraphClass = self->mCurrentCachedParagraphClass;
    if (mCurrentCachedParagraphClass) {
      CFRelease(mCurrentCachedParagraphClass);
    }
    self->mCurrentParagraphStyle = 0;
    self->mCurrentBaseParagraphStyle = 0;
    self->mCurrentCachedParagraphClass = 0;
    if (a5)
    {
      self->mCurrentCachedParagraphClass = a5;
    }
    else if (a3)
    {
      if (a4)
      {
        self->mCurrentParagraphStyle = (GQHStyle *)a3;
        self->mCurrentBaseParagraphStyle = (GQDSStyle *)a4;
      }
    }
  }
}

- (void)setCurrentSpanStyle:(id)a3 baseStyle:(id)a4 cachedClass:(__CFString *)a5
{
  if (!self->mMappingFloatingDrawables && !self->mIsMappingHeadersFooters)
  {
    id v9 = a3;
    id v10 = a4;
    if (a5) {
      CFRetain(a5);
    }

    mCurrentCachedSpanClass = self->mCurrentCachedSpanClass;
    if (mCurrentCachedSpanClass) {
      CFRelease(mCurrentCachedSpanClass);
    }
    self->mCurrentSpanStyle = 0;
    self->mCurrentBaseSpanStyle = 0;
    self->mCurrentCachedSpanClass = 0;
    if (a5)
    {
      self->mCurrentCachedSpanClass = a5;
    }
    else if (a3)
    {
      if (a4)
      {
        self->mCurrentSpanStyle = (GQHStyle *)a3;
        self->mCurrentBaseSpanStyle = (GQDSStyle *)a4;
      }
    }
  }
}

- (void)setDidInsertPageHeader:(BOOL)a3
{
  self->mDidInsertPageHeader = a3;
}

- (void)setDidFindContainerHint:(BOOL)a3
{
  self->mDidFindContainerHint = a3;
}

- (void)mapFloatingDrawablesForPageAtIndex:(unint64_t)a3
{
  self->mMappingFloatingDrawables = 1;
  id v4 = [(GQHPagesState *)self pageDrawables:a3];
  if (v4)
  {
    CFArrayRef v5 = v4;
    int Count = CFArrayGetCount(v4);
    if (Count >= 1)
    {
      CFIndex v7 = 0;
      uint64_t v8 = Count;
      do
      {
        ValueAtIndex = (void *)CFArrayGetValueAtIndex(v5, v7);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          [(GQSDocument *)self->super.mProcessorState setCurrentTableGenerator:objc_opt_class()];
          int mMode = self->mMode;
          self->int mMode = 1;
          [ValueAtIndex walkTableWithGenerator:objc_opt_class() state:self->super.mProcessorState];
          self->int mMode = mMode;
        }
        else
        {
          +[GQHDrawable handleFloatingDrawable:ValueAtIndex htmlState:self];
        }
        ++v7;
      }
      while (v8 != v7);
    }
  }
  self->mMappingFloatingDrawables = 0;
}

- (BOOL)splitNextAttachment
{
  return self->mSplitNextAttachment;
}

- (void)finishedWithSplitAttachment
{
  self->mSplitNextAttachment = 0;
}

- (void)addAttachmentPosition:(double)a3
{
  double valuePtr = a3;
  CFNumberRef v4 = CFNumberCreate(0, kCFNumberDoubleType, &valuePtr);
  CFArrayAppendValue(self->mAttachmentPositions, v4);
  CFRelease(v4);
}

- (double)currentAttachmentPosition
{
  double valuePtr = 0.0;
  double v3 = 0.0;
  if (CFArrayGetCount(self->mAttachmentPositions) >= 1)
  {
    CFNumberRef ValueAtIndex = (const __CFNumber *)CFArrayGetValueAtIndex(self->mAttachmentPositions, 0);
    if (ValueAtIndex)
    {
      CFNumberGetValue(ValueAtIndex, kCFNumberDoubleType, &valuePtr);
      return valuePtr;
    }
  }
  return v3;
}

- (double)moveToNextAttachmentPosition
{
  if (CFArrayGetCount(self->mAttachmentPositions) >= 1) {
    CFArrayRemoveValueAtIndex(self->mAttachmentPositions, 0);
  }
  [(GQHPagesState *)self currentAttachmentPosition];
  return result;
}

- (int64_t)currentAttachmentId
{
  return self->mAttachmentIdCounter;
}

- (int64_t)nextAttachmentId
{
  int64_t mAttachmentIdCounter = self->mAttachmentIdCounter;
  self->int64_t mAttachmentIdCounter = mAttachmentIdCounter + 1;
  return mAttachmentIdCounter;
}

- (int64_t)firstAttachmentId
{
  return self->mFirstAttachmentId;
}

- (void)insertAttachmentPlaceholder
{
  [(GQHXML *)self->super.mHtmlDoc startElement:"div"];
  CFStringRef v3 = CFStringCreateWithFormat(0, 0, @"attPlaceholder-%ld", [(GQHPagesState *)self nextAttachmentId]);
  [(GQHXML *)self->super.mHtmlDoc setAttribute:"id" cfStringValue:v3];
  CFRelease(v3);
  mHtmlDoc = self->super.mHtmlDoc;
  [(GQHXML *)mHtmlDoc endElementWithExpectedName:"div"];
}

- (void)handleContainerHint:(id)a3
{
  [(GQHPagesState *)self setDidInsertPageHeader:1];
  if (self->mMode != 2)
  {
    CFArrayRef v5 = (char *)[a3 pageIndex];
    id v6 = [a3 cIndex];
    [a3 attachmentPosition];
    double v8 = v7;
    [a3 frame];
    CGFloat v10 = v9;
    double v12 = v11;
    CGFloat v14 = v13;
    double v16 = v15;
    objc_msgSend(-[GQSDocument root](self->super.mProcessorState, "root"), "pageSize");
    double v18 = v17;
    double v20 = v19;
    if (v8 > 0.0)
    {
      [(GQHPagesState *)self inContent];
      [(GQHPagesState *)self addAttachmentPosition:v8];
      if (!self->mSplitNextAttachment)
      {
        self->mFirstAttachmentId = self->mAttachmentIdCounter;
        self->mSplitNextAttachment = 1;
      }
    }
    if (v5 == (char *)self->mCurrentHintPageIndex && v6 && v6 != self->mCurrentHintColumnIndex)
    {
      if (!self->mStartedPage)
      {
        [(GQHPagesState *)self startLayout];
        self->mStartedPage = 1;
      }
      [(GQHPagesState *)self closeStateLayoutElementsAndStyles];
      [(GQHXML *)self->super.mHtmlDoc endElement];
      self->mCurrentPageIndex = (int)v5;
      self->mLastFrame.origin.x = v10;
      self->mLastFrame.origin.y = v12 + 10.0;
      self->mLastFrame.size.width = v14;
      self->mLastFrame.size.height = v16 + 20.0;
      [(GQHPagesState *)self startLayout];
      self->mCurrentHintPageIndex = (int)v5;
      self->mCurrentHintColumnIndex = (int)v6;
    }
    else
    {
      self->mCurrentHintPageIndex = (int)v5;
      self->mCurrentHintColumnIndex = (int)v6;
      [(GQHPagesState *)self closeStateLayoutElementsAndStyles];
      if (v5)
      {
        [(GQHPagesState *)self endSection];
        if (self->mStartedPage) {
          [(GQHXML *)self->super.mHtmlDoc endElement];
        }
        +[GQHPages mapCurrentHiddenPositioningFooterFromPublication:state:](GQHPages, "mapCurrentHiddenPositioningFooterFromPublication:state:", objc_msgSend(-[GQHState processorState](self, "processorState"), "root"), -[GQHState processorState](self, "processorState"));
        [(GQHPagesState *)self mapFloatingDrawablesForPageAtIndex:v5 - 1];
        [(GQHXML *)self->super.mHtmlDoc endElementWithExpectedName:"div"];
      }
      self->mCurrentPageIndex = (int)v5;
      self->mLastFrame.origin.x = v10;
      self->mLastFrame.origin.y = v12 + 10.0;
      self->mLastFrame.size.width = v14;
      self->mLastFrame.size.height = v16 + 20.0;
      v21 = objc_alloc_init(GQHStyle);
      [(GQHStyle *)v21 addAttribute:off_9CE00 value:@"white"];
      [(GQHStyle *)v21 addAttribute:off_9CF68 pxValue:(int)v18];
      [(GQHStyle *)v21 addAttribute:off_9CF18 value:off_9D040];
      [(GQHStyle *)v21 addAttribute:off_9CEE8 value:off_9CFE8];
      [(GQHStyle *)v21 addAttribute:off_9CEC0 pxValue:0];
      [(GQHStyle *)v21 addAttribute:off_9CEC8 pxValue:0];
      [(GQHStyle *)v21 addAttribute:off_9CED0 pxValue:0];
      [(GQHStyle *)v21 addAttribute:off_9CEB8 pxValue:5];
      [(GQHStyle *)v21 addAttribute:@"-webkit-box-shadow" value:@"0px 5px 5px rgba(0, 0, 0, 0.5)"];
      [(GQHStyle *)v21 addAttribute:off_9CED8 pxValue:(int)(v20 + 20.0)];
      [(GQHXML *)self->super.mHtmlDoc startElement:"div"];
      [(GQHStyle *)v21 addClass:@"dzo"];
      [(GQHStyle *)v21 setStyleOnCurrentNode:self];

      self->mStartedPage = 0;
    }
  }
}

- (void)resolveHeaderName:(const __CFString *)a3 footerName:(const __CFString *)a4
{
  if ((unint64_t)a3 | (unint64_t)a4)
  {
    if (a3) {
      *a3 = 0;
    }
    if (a4) {
      *a4 = 0;
    }
    uint64_t mCurrentPageIndex = self->mCurrentPageIndex;
    id v8 = [(GQHPagesState *)self sectionStyleForPageIndex:mCurrentPageIndex];
    double v9 = v8;
    char v31 = 0;
    CGFloat v10 = v8;
    if ((mCurrentPageIndex & 0x80000000) == 0)
    {
      CGFloat v10 = v8;
      if (v8)
      {
        CGFloat v10 = v8;
        while ([v10 hasValueForBoolProperty:59 value:&v31] && v31)
        {
          double v11 = [(GQHPagesState *)self sectionStyleRunForRunBeforePageIndex:mCurrentPageIndex];
          if (!v11)
          {
            CGFloat v10 = 0;
            LODWORD(mCurrentPageIndex) = -1;
LABEL_16:
            if (mCurrentPageIndex == -1)
            {
              if (v31)
              {
                id v12 = objc_msgSend(objc_msgSend(objc_msgSend(-[GQHState processorState](self, "processorState"), "root"), "stylesheet"), "styleWithIdentifier:", "section-style-default");
                if (v12) {
                  CGFloat v10 = v12;
                }
              }
            }
            break;
          }
          uint64_t mCurrentPageIndex = *((unsigned int *)v11 + 4);
          CGFloat v10 = (void *)v11[1];
          if ((mCurrentPageIndex & 0x80000000) != 0 || !v10) {
            goto LABEL_16;
          }
        }
      }
    }
    if (v9 && v10)
    {
      char v30 = 0;
      int v29 = 0;
      id v28 = 0;
      if (self->mMode != 1)
      {
        [v9 hasValueForBoolProperty:62 value:&v30];
        [v9 hasValueForIntProperty:58 value:&v29];
        if (![v9 hasValueForObjectProperty:64 value:&v28]
          || ![v28 headerIdentifier]
          || !CFStringGetLength((CFStringRef)[v28 headerIdentifier]))
        {
          [v10 hasValueForObjectProperty:64 value:&v28];
        }
      }
      char v27 = 0;
      [v9 hasValueForBoolProperty:63 value:&v27];
      int v25 = 0;
      int v26 = 0;
      if ([v9 hasValueForIntProperty:61 value:&v26]
        && [v9 hasValueForIntProperty:60 value:&v25]
        && v25 == 1)
      {
        self->mStartPageAt = v26;
        self->mStartPageAtValueChangedAtPageIndex = self->mCurrentPageIndex;
      }
      id v24 = 0;
      if (![v9 hasValueForObjectProperty:65 value:&v24]
        || ![v24 headerIdentifier]
        || !CFStringGetLength((CFStringRef)[v24 headerIdentifier]))
      {
        [v10 hasValueForObjectProperty:65 value:&v24];
      }
      id v23 = 0;
      if (![v9 hasValueForObjectProperty:66 value:&v23]
        || ![v23 headerIdentifier]
        || !CFStringGetLength((CFStringRef)[v23 headerIdentifier]))
      {
        [v10 hasValueForObjectProperty:66 value:&v23];
      }
      double v13 = (char *)[(GQHPagesState *)self rangeForSectionStyleAtPageIndex:self->mCurrentPageIndex];
      CGFloat v14 = (char *)self->mCurrentPageIndex;
      if ((v29 == 1 && (v14 & 1) != 0 || v29 == 2 && (v14 & 1) == 0) && v13 == v14)
      {
        id v15 = 0;
      }
      else if (!v30 {
             || (id v15 = v28) == 0
      }
             || v13 != v14
             && (v13 + 1 == v14 ? (BOOL v16 = v29 == 1) : (BOOL v16 = 0),
                 v16 ? (char v17 = 0) : (char v17 = 1),
                 (char v18 = v17 | v14, (v14 & 1) != 0) ? (v19 = v29 == 2) : (v19 = 0),
                 v19 ? (int v20 = 0) : (int v20 = 1),
                 (v18 & 1) != 0 && v20))
      {
        if (v27)
        {
          if (v14) {
            id v15 = v23;
          }
          else {
            id v15 = v24;
          }
        }
        else
        {
          id v15 = v24;
        }
      }
      id v21 = [v15 headerIdentifier];
      if (a3 && v21) {
        *a3 = (const __CFString *)[v15 headerIdentifier];
      }
      id v22 = [v15 footerIdentifier];
      if (a4)
      {
        if (v22) {
          *a4 = (const __CFString *)[v15 footerIdentifier];
        }
      }
    }
  }
}

- (void)beginWrapPointSet
{
  self->mCurrentWrapPointSet = objc_alloc_init(GQWrapPointSet);
}

- (void)endWrapPointSet
{
  id v3 = [objc_alloc((Class)NSNumber) initWithInt:self->mCurrentPageIndex];
  CFDictionaryAddValue(self->mPageWrapPointsMap, v3, self->mCurrentWrapPointSet);

  self->mCurrentWrapPointSet = 0;
}

- (void)addWrapPoint:(id)a3
{
  mWrapPointSet = (uint64_t **)self->mCurrentWrapPointSet->mWrapPointSet;
  id v5 = a3;
  id v4 = a3;
  sub_A038(mWrapPointSet, &v5, &v5);
}

- (const)wrapPoints
{
  double result = [(GQHPagesState *)self wrapPointSetForPage:self->mCurrentPageIndex];
  if (result) {
    return (const void *)*((void *)result + 1);
  }
  return result;
}

- (void)createListOfWrapPointsAlongY:(float)a3 minX:(float)a4 maxX:(float)a5 zIndex:(int)a6
{
}

- (void)inContent
{
  if (![(GQHPagesState *)self isMappingHeadersFooters])
  {
    if (!self->mDidFindContainerHint && !self->mDidInsertPageHeader)
    {
      [(GQHPagesState *)self setDidInsertPageHeader:1];
      id v3 = [(GQSDocument *)self->super.mProcessorState root];
      id v4 = [v3 pageMargins];
      [v4 left];
      double v6 = v5;
      [v4 top];
      double v8 = v7;
      [v3 pageSize];
      double v10 = v9;
      double v12 = v11;
      [v4 left];
      double v14 = v10 - v13;
      [v4 right];
      double v16 = v14 - v15;
      [v4 top];
      double v18 = v12 - v17;
      [v4 bottom];
      double v20 = v18 - v19;
      mLastInsertedContainerHint = self->mLastInsertedContainerHint;
      if (mLastInsertedContainerHint)
      {
        id v22 = (char *)[(GQDWPContainerHint *)mLastInsertedContainerHint pageIndex] + 1;
        id v23 = (char *)[(GQDWPContainerHint *)self->mLastInsertedContainerHint cIndex] + 1;
        int64_t v24 = [(GQDWPContainerHint *)self->mLastInsertedContainerHint anchorLocation];
      }
      else
      {
        id v22 = 0;
        id v23 = 0;
        int64_t v24 = 0;
      }
      int v25 = -[GQDWPContainerHint initWithPageIndex:cIndex:sIndex:lIndex:anchorLocation:frame:]([GQDWPContainerHint alloc], "initWithPageIndex:cIndex:sIndex:lIndex:anchorLocation:frame:", v22, v23, 0, 0, v24, v6, v8, v16, v20);
      self->mLastInsertedContainerHint = v25;
      [(GQHPagesState *)self handleContainerHint:v25];
    }
    if (!self->mStartedPage)
    {
      [(GQHPagesState *)self startSection];
      self->mStartedPage = 1;
    }
  }
}

- (void)setHasLayoutDrawables:(BOOL)a3
{
  self->mHasLayoutDrawables = a3;
}

- (BOOL)hasLayoutDrawables
{
  return self->mHasLayoutDrawables;
}

- (void)setIsMappingHeadersFooters:(BOOL)a3
{
  self->mIsMappingHeadersFooters = a3;
}

- (BOOL)isMappingHeadersFooters
{
  return self->mIsMappingHeadersFooters;
}

- (int)pageNumberForHeaderOrFooter
{
  return self->mCurrentPageIndex + self->mStartPageAt - self->mStartPageAtValueChangedAtPageIndex;
}

- (BOOL)useOutline
{
  return self->mMode == 2;
}

- (void)setOutlineLevel:(int)a3
{
  if (self->mMode == 2) {
    self->super.mOutlineLevel = a3;
  }
}

- (void)setOutlineStyleType:(int)a3
{
  if (self->mMode == 2) {
    self->super.mOutlineStyleType = a3;
  }
}

- (void)addStyle:(__CFString *)a3 className:(__CFString *)a4 srcStyle:(id)a5
{
  if (a5)
  {
    v6.receiver = self;
    v6.super_class = (Class)GQHPagesState;
    -[GQHState addStyle:className:srcStyle:](&v6, "addStyle:className:srcStyle:", a3, a4);
  }
  else
  {
    mHtmlDoc = self->super.mHtmlDoc;
    -[GQHXML addStyleClass:](mHtmlDoc, "addStyleClass:", a3, a4);
  }
}

- (__CFString)cssZOrderClassForDrawable:(id)a3
{
  id v4 = [a3 pagesOrder];
  return [(GQHPagesState *)self cssZOrderClassForDrawablePagesOrder:v4];
}

- (__CFString)cssZOrderClassForDrawablePagesOrder:(int)a3
{
  int valuePtr = a3;
  CFNumberRef v4 = CFNumberCreate(0, kCFNumberIntType, &valuePtr);
  Value = (__CFString *)CFDictionaryGetValue(self->mDrawablePagesOrderToCssZOrderClassMap, v4);
  if (!Value)
  {
    objc_super v6 = @"n";
    if (valuePtr < 0)
    {
      uint64_t v7 = -valuePtr;
    }
    else
    {
      objc_super v6 = &stru_85630;
      uint64_t v7 = valuePtr;
    }
    Value = (__CFString *)CFStringCreateWithFormat(0, 0, @"drawableZOrder_%@%u", v6, v7);
    CFDictionarySetValue(self->mDrawablePagesOrderToCssZOrderClassMap, v4, Value);
    CFRelease(Value);
  }
  CFRelease(v4);
  return Value;
}

- (__CFDictionary)pagesOrderToCssZOrderClassMapDictionary
{
  return self->mDrawablePagesOrderToCssZOrderClassMap;
}

- (CGSize)pageSize
{
  double width = self->mPageSize.width;
  double height = self->mPageSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setPageSize:(CGSize)a3
{
  self->mPageSize = a3;
}

- (unsigned)tocDepth
{
  mTocHrefStack = self->mTocHrefStack;
  if (mTocHrefStack) {
    LODWORD(mTocHrefStack) = CFArrayGetCount(mTocHrefStack);
  }
  return mTocHrefStack;
}

- (void)pushTocHref:(__CFString *)a3
{
  mTocHrefStack = self->mTocHrefStack;
  if (!mTocHrefStack)
  {
    mTocHrefStack = CFArrayCreateMutable(0, 0, &kCFTypeArrayCallBacks);
    self->mTocHrefStack = mTocHrefStack;
  }
  CFArrayAppendValue(mTocHrefStack, a3);
}

- (void)popTocHref
{
  unsigned int v3 = [(GQHPagesState *)self tocDepth];
  if (v3)
  {
    uint64_t v4 = v3;
    mTocHrefStack = self->mTocHrefStack;
    CFArrayRemoveValueAtIndex(mTocHrefStack, v4 - 1);
  }
}

- (void)endSection
{
  if (self->mStartedSection)
  {
    [(GQHXML *)self->super.mHtmlDoc endElementWithExpectedName:"div"];
    self->mStartedSection = 0;
    if ([(GQHXML *)self->super.mHtmlDoc isProgressive])
    {
      unsigned int v3 = [(GQHXML *)self->super.mHtmlDoc createProgressiveHtml];
      uint64_t v4 = [(GQHXML *)self->super.mHtmlDoc createProgressiveeCSSwithStyleTags:1];
      [(__CFData *)v3 appendData:v4];
      CFRelease(v4);
      objc_msgSend(-[GQSDocument outputBundle](self->super.mProcessorState, "outputBundle"), "setDataForMainHtmlResource:", v3);
      CFRelease(v3);
      self->mProgressiveIndex = 2 * self->mCurrentPageIndex + 4;
    }
  }
}

- (BOOL)needAbsolutelyPositionedTables
{
  return [(GQHPagesState *)self mode] == 1;
}

- (BOOL)allowInlineWrap
{
  return !self->mCurrentFrameHasSandbagFloats;
}

- (id)wrapPointSetForPage:(int)a3
{
  id v4 = [objc_alloc((Class)NSNumber) initWithInt:*(void *)&a3];
  Value = (void *)CFDictionaryGetValue(self->mPageWrapPointsMap, v4);

  return Value;
}

- (void)startSection
{
  if (!self->mStartedSection)
  {
    [(GQHXML *)self->super.mHtmlDoc startElement:"div"];
    if (![(GQHPagesState *)self isMappingHeadersFooters]) {
      +[GQHPages mapCurrentHeaderAndFooterFromPublication:state:](GQHPages, "mapCurrentHeaderAndFooterFromPublication:state:", objc_msgSend(-[GQHState processorState](self, "processorState"), "root"), -[GQHState processorState](self, "processorState"));
    }
    self->mStartedSection = 1;
  }
  if (self->mMode != 2)
  {
    [(GQHPagesState *)self startLayout];
  }
}

- (void)startLayout
{
  [(GQHXML *)self->super.mHtmlDoc startElement:"div"];
  unsigned int v3 = objc_alloc_init(GQHStyle);
  [(GQHStyle *)v3 addAttribute:off_9CF10 pxValue:(int)self->mLastFrame.origin.y];
  [(GQHStyle *)v3 addAttribute:off_9CF00 pxValue:(int)self->mLastFrame.origin.x];
  [(GQHStyle *)v3 addAttribute:off_9CED8 pxValue:(int)self->mLastFrame.size.height];
  [(GQHStyle *)v3 addAttribute:off_9CF68 pxValue:(int)self->mLastFrame.size.width];
  [(GQHStyle *)v3 addAttribute:off_9CF18 value:off_9CFA0];
  [(GQHStyle *)v3 addClass:@"dzo"];
  [(GQHStyle *)v3 setStyleOnCurrentNode:self];

  self->mCurrentFrameHasSandbagFloats = +[GQHTextBox outputWrapSandbagsForFrame:columnCount:drawable:state:isPageFrame:](GQHTextBox, "outputWrapSandbagsForFrame:columnCount:drawable:state:isPageFrame:", 1, 0, self, 1, self->mLastFrame.origin.x, self->mLastFrame.origin.y, self->mLastFrame.size.width, self->mLastFrame.size.height);
  [(GQHPagesState *)self openStateLayoutElementsAndStyles];
}

- (void)closeStateLayoutElementsAndStyles
{
  unsigned int v3 = [(GQHPagesState *)self tocDepth];
  if (v3)
  {
    unsigned int v4 = v3;
    do
    {
      [(GQHXML *)self->super.mHtmlDoc endElementWithExpectedName:"a"];
      --v4;
    }
    while (v4);
  }
  if (self->mCurrentSpanStyle || self->mCurrentCachedSpanClass) {
    [(GQHXML *)self->super.mHtmlDoc endElementWithExpectedName:"span"];
  }
  if (self->mCurrentParagraphStyle || self->mCurrentCachedParagraphClass) {
    [(GQHXML *)self->super.mHtmlDoc endElementWithExpectedName:"p"];
  }
  if (self->mSplitNextAttachment) {
    [(GQHPagesState *)self insertAttachmentPlaceholder];
  }
  if (self->mCurrentLayoutStyle) {
    [(GQHXML *)self->super.mHtmlDoc endElementWithExpectedName:"div"];
  }
  self->mCurrentFrameHasSandbagFloats = 0;
}

- (void)openStateLayoutElementsAndStyles
{
  if (self->mCurrentLayoutStyle)
  {
    [(GQHXML *)self->super.mHtmlDoc startElement:"div"];
    [(GQHStyle *)self->mCurrentLayoutStyle setStyleOnCurrentNode:self];
  }
  unsigned int v3 = [(GQHPagesState *)self tocDepth];
  if (v3)
  {
    CFIndex v4 = 0;
    uint64_t v5 = v3;
    do
    {
      [(GQHXML *)self->super.mHtmlDoc startElement:"a"];
      [(GQHXML *)self->super.mHtmlDoc setAttribute:"href" cfStringValue:CFArrayGetValueAtIndex(self->mTocHrefStack, v4++)];
    }
    while (v5 != v4);
  }
  if (self->mCurrentParagraphStyle || self->mCurrentCachedParagraphClass)
  {
    [(GQHXML *)self->super.mHtmlDoc startElement:"p"];
    mCurrentParagraphStyle = self->mCurrentParagraphStyle;
    if (mCurrentParagraphStyle)
    {
      [(GQHStyle *)mCurrentParagraphStyle setStyleOnCurrentNode:self mappingBaseStyleClass:self->mCurrentBaseParagraphStyle baseClassType:objc_opt_class()];
    }
    else if (self->mCurrentCachedParagraphClass)
    {
      -[GQHXML setAttribute:cfStringValue:](self->super.mHtmlDoc, "setAttribute:cfStringValue:", "class");
    }
  }
  if (self->mCurrentSpanStyle || self->mCurrentCachedSpanClass)
  {
    [(GQHXML *)self->super.mHtmlDoc startElement:"span"];
    mCurrentSpanStyle = self->mCurrentSpanStyle;
    if (mCurrentSpanStyle)
    {
      mCurrentBaseSpanStyle = self->mCurrentBaseSpanStyle;
      uint64_t v9 = objc_opt_class();
      [(GQHStyle *)mCurrentSpanStyle setStyleOnCurrentNode:self mappingBaseStyleClass:mCurrentBaseSpanStyle baseClassType:v9];
    }
    else if (self->mCurrentCachedSpanClass)
    {
      mHtmlDoc = self->super.mHtmlDoc;
      -[GQHXML setAttribute:cfStringValue:](mHtmlDoc, "setAttribute:cfStringValue:", "class");
    }
  }
}

- (id)sectionStyleRunForRunBeforePageIndex:(int)a3
{
  if (a3 < 0) {
    return 0;
  }
  int Count = CFArrayGetCount(self->mSectionStyles);
  int v6 = Count;
  if (Count > a3)
  {
    CFNumberRef ValueAtIndex = CFArrayGetValueAtIndex(self->mSectionStyles, a3);
    if (ValueAtIndex == (_DWORD *)kCFNull) {
      return 0;
    }
    int v6 = ValueAtIndex[4];
  }
  id result = 0;
  CFIndex v9 = (v6 - 1);
  if (v6 - 1 >= 0 && (int)v9 < Count)
  {
    id result = (id)CFArrayGetValueAtIndex(self->mSectionStyles, v9);
    if (result == kCFNull) {
      return 0;
    }
  }
  return result;
}

@end