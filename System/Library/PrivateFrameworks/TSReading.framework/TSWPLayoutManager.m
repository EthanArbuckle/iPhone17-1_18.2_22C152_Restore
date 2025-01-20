@interface TSWPLayoutManager
+ (void)fixColumnBoundsForTarget:(id)a3 storage:(id)a4 charIndex:(unint64_t)a5 firstColumnIndex:(unint64_t)a6 precedingHeight:(double)a7 height:(double)a8 alreadyHasMargins:(BOOL)a9 styleProvider:(id)a10 vertical:(BOOL)a11;
- (BOOL)needsLayoutInColumn:(id)a3;
- (TSWPCTTypesetterCache)typesetterCache;
- (TSWPLayoutManager)initWithStorage:(id)a3 owner:(id)a4;
- (TSWPLayoutOwner)owner;
- (TSWPStorage)storage;
- (_NSRange)dirtyRange;
- (double)layoutIntoTarget:(id)a3 withRange:(_NSRange)a4;
- (id).cxx_construct;
- (id)styleProvider;
- (int)p_layoutConfigFlagsForTarget:(id)a3;
- (void)clearOwner;
- (void)clearTypesetterCache;
- (void)dealloc;
- (void)deflateTarget:(id)a3 intoHints:(void *)a4 childHints:(id)a5[2] anchoredAttachmentPositions:(id *)a6 topicNumbers:(void *)a7 layoutState:(void *)a8;
- (void)destroyLayoutState:(void *)a3;
- (void)inflateTarget:(id)a3 fromHints:(const void *)a4 childHint:(id)a5 anchoredAttachmentPositions:(id)a6 topicNumbers:(const void *)a7;
- (void)layoutIntoTarget:(id)a3 withLayoutState:(void *)a4 outSync:(BOOL *)a5;
- (void)layoutStateForLayoutTarget:(id)a3 afterHint:(id *)a4 childHint:(id)a5 topicNumbers:(const void *)a6 textIsVertical:(BOOL)a7;
- (void)resetTopicNumbers;
- (void)storage:(id)a3 didChangeRange:(_NSRange)a4 delta:(int64_t)a5 broadcastKind:(int)a6;
- (void)willRemoveAttachmentLayout:(id)a3;
@end

@implementation TSWPLayoutManager

- (void).cxx_destruct
{
}

+ (void)fixColumnBoundsForTarget:(id)a3 storage:(id)a4 charIndex:(unint64_t)a5 firstColumnIndex:(unint64_t)a6 precedingHeight:(double)a7 height:(double)a8 alreadyHasMargins:(BOOL)a9 styleProvider:(id)a10 vertical:(BOOL)a11
{
  long long v86 = *MEMORY[0x263F7C7C8];
  v18 = (void *)[a3 columnMetricsForCharIndex:a5 outRange:&v86];
  int v19 = [v18 columnsAreLeftToRight];
  if (v18) {
    unint64_t v20 = [v18 columnCount];
  }
  else {
    unint64_t v20 = 1;
  }
  BOOL v21 = (unint64_t)v86 < a5 || a9;
  char v82 = v21;
  id v81 = +[TSWPPadding padding];
  v83 = (void *)[a3 columns];
  if (!v83)
  {
    v22 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v23 = [NSString stringWithUTF8String:"+[TSWPLayoutManager fixColumnBoundsForTarget:storage:charIndex:firstColumnIndex:precedingHeight:height:alreadyHasMargins:styleProvider:vertical:]"];
    objc_msgSend(v22, "handleFailureInFunction:file:lineNumber:description:", v23, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPLayoutManager.mm"), 484, @"invalid nil value for '%s'", "columnsArray");
  }
  [a3 currentSize];
  double v76 = v25;
  double v77 = v24;
  if (a11) {
    double v24 = v25;
  }
  double v75 = v24;
  if (v18)
  {
    [v18 adjustedInsets];
    double v27 = v26;
    double v29 = v28;
  }
  else
  {
    double v27 = *MEMORY[0x263F001B0];
    double v29 = *(double *)(MEMORY[0x263F001B0] + 8);
  }
  unint64_t v80 = [v83 count];
  if ([a4 allowsElementKind:32]) {
    uint64_t v79 = [a3 pageNumber];
  }
  else {
    uint64_t v79 = 0x7FFFFFFFFFFFFFFFLL;
  }
  double v30 = v75 - TSDMultiplySizeScalar(v27, v29, 2.0);
  double v32 = a8 - v31;
  double v33 = 0.0;
  if (v30 >= 0.0) {
    double v34 = v30;
  }
  else {
    double v34 = 0.0;
  }
  if (v32 >= 0.0) {
    double v35 = v32;
  }
  else {
    double v35 = 0.0;
  }
  if (a6) {
    char v36 = v82;
  }
  else {
    char v36 = 1;
  }
  if ((v36 & 1) == 0)
  {
    objc_opt_class();
    objc_msgSend((id)objc_msgSend(a3, "columns"), "objectAtIndexedSubscript:", a6 - 1);
    v37 = (void *)TSUDynamicCast();
    if (!v37)
    {
      v73 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
      uint64_t v38 = [NSString stringWithUTF8String:"+[TSWPLayoutManager fixColumnBoundsForTarget:storage:charIndex:firstColumnIndex:precedingHeight:height:alreadyHasMargins:styleProvider:vertical:]"];
      objc_msgSend(v73, "handleFailureInFunction:file:lineNumber:description:", v38, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPLayoutManager.mm"), 519, @"invalid nil value for '%s'", "column");
    }
    v39 = objc_msgSend((id)objc_msgSend(a3, "columnMetricsForCharIndex:outRange:", objc_msgSend(v37, "range"), 0), "layoutMargins");
    if (v39)
    {
      [v39 bottomInset];
      double v33 = v40;
    }
  }
  unint64_t v72 = v20 + a6;
  if (v20 + a6 > a6)
  {
    uint64_t v41 = 0;
    double v42 = v29 + a7;
    double v74 = v29 + a7;
    do
    {
      double v85 = v34;
      uint64_t v84 = 0;
      uint64_t v43 = [v18 layoutMargins];
      if (v43) {
        v44 = (void *)v43;
      }
      else {
        v44 = v81;
      }
      if (a11)
      {
        [v44 topInset];
        double v46 = v76 - v45;
        [v44 bottomInset];
      }
      else
      {
        [v44 leftInset];
        double v46 = v77 - v48;
        [v44 rightInset];
      }
      double v49 = v46 - v47;
      int v50 = [a4 wpKind];
      double v51 = fmax(v49, 36.0);
      if (!v50) {
        double v49 = v51;
      }
      if (a11)
      {
        [v44 topInset];
      }
      else if (v19)
      {
        [v44 leftInset];
      }
      else
      {
        [v44 rightInset];
      }
      double v53 = v52;
      if (v18)
      {
        [v18 positionForColumnIndex:v41 bodyWidth:&v85 outWidth:&v84 outGap:v49];
        if (v19) {
          goto LABEL_48;
        }
      }
      else
      {
        double v54 = 0.0;
        if (v19)
        {
LABEL_48:
          double v55 = v53 + v54;
          goto LABEL_51;
        }
      }
      double v55 = v49 - v53 - v54 - v85;
LABEL_51:
      int v56 = [a4 wpKind];
      double v57 = v85;
      if (!v56)
      {
        double v57 = fmax(v85, 18.0);
        double v85 = v57;
        if (v75 + (float)((float)v20 * -18.0) < v55) {
          double v55 = v75 + (float)((float)v20 * -18.0);
        }
      }
      double v58 = v35;
      double v59 = v42;
      if ((v82 & 1) == 0)
      {
        if (a11) {
          [v44 rightInset];
        }
        else {
          [v44 topInset];
        }
        double v59 = v42 + v33 + v60;
        [a3 maxSize];
        double v62 = v61;
        v87.origin.x = v55;
        v87.origin.y = v59;
        v87.size.width = v57;
        v87.size.height = v35;
        double MaxY = CGRectGetMaxY(v87);
        if (a6 || MaxY <= v62)
        {
          double v58 = v35;
        }
        else
        {
          BOOL v64 = [a4 wpKind] == 0;
          double v65 = 36.0;
          BOOL v66 = v62 - v59 < 36.0;
          double v67 = v62 + -36.0;
          if (!v64 || !v66) {
            double v65 = v62 - v59;
          }
          double v42 = v74;
          if (!v64 || !v66) {
            double v67 = v59;
          }
          double v68 = v62 + -1.0;
          if (v65 < 1.0) {
            double v58 = 1.0;
          }
          else {
            double v58 = v65;
          }
          if (v65 < 1.0) {
            double v59 = v68;
          }
          else {
            double v59 = v67;
          }
        }
      }
      if (a6 + v41 >= v80)
      {
        v69 = -[TSWPColumn initWithStorage:frameBounds:]([TSWPColumn alloc], "initWithStorage:frameBounds:", a4, v55, v59, v57, v58);
        [(TSWPColumn *)v69 setStyleProvider:a10];
        [(TSWPColumn *)v69 setColumnIndex:a6 + v41];
        [v83 addObject:v69];
      }
      else
      {
        v69 = (TSWPColumn *)[v83 objectAtIndexedSubscript:a6 + v41];
        -[TSWPColumn setWpBounds:](v69, "setWpBounds:", v55, v59, v57, v58);
      }
      -[TSWPColumn setTextIsVertical:](v69, "setTextIsVertical:", [a3 textIsVertical]);
      [(TSWPColumn *)v69 setPageNumber:v79];
      ++v41;
      --v20;
    }
    while (v20);
  }
  int v70 = [a4 wpKind];
  if (!a6 && v70)
  {
    unint64_t v71 = [v83 count];
    if (v71 > v72) {
      objc_msgSend(v83, "removeObjectsInRange:", v72, v71 - v72);
    }
  }
}

- (id).cxx_construct
{
  return self;
}

- (TSWPCTTypesetterCache)typesetterCache
{
  int v3 = objc_msgSend(-[TSWPStorage documentRoot](self->_storage, "documentRoot"), "useLigatures");
  if (self->_useLigatures != v3)
  {
    BOOL v4 = v3;
    [(TSWPLayoutManager *)self clearTypesetterCache];
    self->_useLigatures = v4;
  }
  result = self->_typesetterCache;
  if (!result)
  {
    result = objc_alloc_init(TSWPCTTypesetterCache);
    self->_typesetterCache = result;
  }
  return result;
}

- (void)layoutIntoTarget:(id)a3 withLayoutState:(void *)a4 outSync:(BOOL *)a5
{
  v9 = (void *)-[TSWPLayoutOwner lineHintsForTarget:](self->_owner, "lineHintsForTarget:");
  if (v9 && [v9 hints])
  {
    if (a4) {
      [(TSWPLayoutManager *)self destroyLayoutState:a4];
    }
    operator new();
  }
  if (!a4)
  {
    [(TSWPLayoutManager *)self p_layoutConfigFlagsForTarget:a3];
    operator new();
  }
  TSWPTopicNumberHints::reset(&self->_cachedTopicNumbers);
  if (objc_opt_respondsToSelector())
  {
    objc_msgSend(a3, "setAnchoredDrawablesForRelayout:", objc_msgSend(MEMORY[0x263EFF980], "array"));
    int v10 = TSWPLayoutChore::layoutIntoTarget((uint64_t)a4, a3, 1, (char *)a5);
    [a3 setAnchoredDrawablesForRelayout:0];
  }
  else
  {
    int v10 = TSWPLayoutChore::layoutIntoTarget((uint64_t)a4, a3, 1, (char *)a5);
  }
  TSWPTopicNumberHints::operator=(&self->_cachedTopicNumbers, (TSWPTopicNumberHints *)a4 + 17);
  if (objc_msgSend((id)objc_msgSend(a3, "columns"), "count"))
  {
    unint64_t charIndex = self->_cachedTopicNumbers._charIndex;
    if (charIndex != 0x7FFFFFFFFFFFFFFFLL
      && charIndex >= objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "columns"), "firstObject"), "range"))
    {
      v12 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
      uint64_t v13 = [NSString stringWithUTF8String:"-[TSWPLayoutManager layoutIntoTarget:withLayoutState:outSync:]"];
      objc_msgSend(v12, "handleFailureInFunction:file:lineNumber:description:", v13, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPLayoutManager.mm"), 311, @"topic numbers are out of sync with layout");
    }
  }
  if (v10)
  {
    if (self->_dirtyRange.location != 0x7FFFFFFFFFFFFFFFLL)
    {
      v14 = objc_msgSend((id)objc_msgSend(a3, "columns"), "lastObject");
      if (v14)
      {
        uint64_t v15 = [v14 range];
        NSUInteger v17 = v15 + v16;
        NSUInteger location = self->_dirtyRange.location;
        if (v15 + v16 > location)
        {
          NSUInteger v19 = self->_dirtyRange.length + location;
          if (v19 > v17)
          {
            self->_dirtyRange.NSUInteger location = v17;
            self->_dirtyRange.length = v19 - v17;
          }
          else
          {
            int64_t delta = self->_delta;
            self->_dirtyRange.length = 0;
            *(_OWORD *)&self->_int64_t delta = xmmword_22383ACF0;
            TSWPLayoutChore::clearDelta((uint64_t)a4);
            [(TSWPLayoutOwner *)self->_owner layoutManager:self didClearDirtyRangeWithDelta:delta afterCharIndex:v19];
          }
        }
      }
    }
  }
  else
  {
    (*(void (**)(void *))(*(void *)a4 + 8))(a4);
    a4 = 0;
    self->_dirtyRange.length = 0;
    *(_OWORD *)&self->_int64_t delta = xmmword_22383ACF0;
  }
  return a4;
}

- (int)p_layoutConfigFlagsForTarget:(id)a3
{
  if ([a3 textIsVertical]) {
    int v4 = 16;
  }
  else {
    int v4 = 0;
  }
  if ((objc_opt_respondsToSelector() & 1) != 0 && [a3 allowsLastLineTruncation]) {
    v4 |= 0x20u;
  }
  if ((objc_opt_respondsToSelector() & 1) != 0 && ![a3 allowsDescendersToClip]) {
    v4 |= 4u;
  }
  if ((objc_opt_respondsToSelector() & 1) != 0 && [a3 pushAscendersIntoColumn]) {
    return v4 | 0x40;
  }
  return v4;
}

- (id)styleProvider
{
  if (!self->_owner
    || (objc_opt_class(), TSUDynamicCast(), (objc_opt_respondsToSelector() & 1) == 0)
    || (id result = (id)[(TSWPLayoutOwner *)self->_owner styleProvider]) == 0)
  {
    storage = self->_storage;
    return +[TSWPStorageStyleProvider styleProviderForStorage:storage];
  }
  return result;
}

- (void)dealloc
{
  [(TSWPLayoutManager *)self clearOwner];

  v3.receiver = self;
  v3.super_class = (Class)TSWPLayoutManager;
  [(TSWPLayoutManager *)&v3 dealloc];
}

- (void)clearOwner
{
  self->_owner = 0;
  if (self->_isObservingStorage) {
    [(TSWPStorage *)self->_storage removeObserver:self];
  }
}

- (TSWPLayoutManager)initWithStorage:(id)a3 owner:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)TSWPLayoutManager;
  v6 = [(TSWPLayoutManager *)&v9 init];
  if (v6)
  {
    v7 = (TSWPStorage *)a3;
    v6->_owner = (TSWPLayoutOwner *)a4;
    v6->_storage = v7;
    if ([a4 caresAboutStorageChanges])
    {
      [(TSWPStorage *)v6->_storage addObserver:v6];
      v6->_isObservingStorage = 1;
    }
    v6->_dirtyRange.NSUInteger location = 0x7FFFFFFFFFFFFFFFLL;
  }
  return v6;
}

- (void)willRemoveAttachmentLayout:(id)a3
{
  uint64_t v4 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "info"), "owningAttachment"), "findCharIndex");
  storage = self->_storage;
  if (storage) {
    [(TSWPStorage *)storage paragraphEnumeratorAtCharIndex:v4 styleProvider:0];
  }
  else {
    memset(&v6, 0, sizeof(v6));
  }
  [(TSWPCTTypesetterCache *)self->_typesetterCache removeTypesetterForParagraphIndex:TSWPParagraphEnumerator::relevantParagraphIndex(&v6)];
  TSWPParagraphEnumerator::~TSWPParagraphEnumerator(&v6);
}

- (void)resetTopicNumbers
{
  p_cachedTopicNumbers = &self->_cachedTopicNumbers;
  id v3 = [(TSWPLayoutManager *)self styleProvider];

  TSWPTopicNumberHints::resetWithStyleProvider((uint64_t)p_cachedTopicNumbers, v3);
}

- (void)clearTypesetterCache
{
}

- (void)storage:(id)a3 didChangeRange:(_NSRange)a4 delta:(int64_t)a5 broadcastKind:(int)a6
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  v12.NSUInteger location = self->_dirtyRange.location;
  if (v12.location == 0x7FFFFFFFFFFFFFFFLL)
  {
    self->_dirtyRange = a4;
    self->_int64_t delta = a5;
  }
  else
  {
    if (a4.location + a4.length <= v12.location)
    {
      v12.location += a5;
      self->_dirtyRange.NSUInteger location = v12.location;
      v12.NSUInteger length = self->_dirtyRange.length;
    }
    else
    {
      v12.NSUInteger length = self->_dirtyRange.length;
      if (a4.location < v12.length + v12.location)
      {
        v12.length += a5;
        self->_dirtyRange.NSUInteger length = v12.length;
      }
    }
    self->_dirtyRange = NSUnionRange(v12, a4);
    self->_delta += a5;
  }
  if (a6 != 1 || a5 != (int)length)
  {
LABEL_16:
    [(TSWPCTTypesetterCache *)self->_typesetterCache clearCache];
    goto LABEL_17;
  }
  if (location < location + length)
  {
    NSUInteger v13 = location;
    while (!IsParagraphBreakingCharacter([a3 characterAtIndex:v13]))
    {
      ++v13;
      if (!--length) {
        goto LABEL_14;
      }
    }
    goto LABEL_16;
  }
LABEL_14:
  if (a3) {
    [a3 paragraphEnumeratorAtCharIndex:location styleProvider:0];
  }
  else {
    memset(&v14, 0, sizeof(v14));
  }
  [(TSWPCTTypesetterCache *)self->_typesetterCache removeTypesetterForParagraphIndex:TSWPParagraphEnumerator::relevantParagraphIndex(&v14)];
  TSWPParagraphEnumerator::~TSWPParagraphEnumerator(&v14);
LABEL_17:
  -[TSWPLayoutOwner layoutManagerNeedsLayout:](self->_owner, "layoutManagerNeedsLayout:", self, *(_OWORD *)&v14.var0, *(_OWORD *)&v14.var2, *(_OWORD *)&v14.var4, *(void *)&v14.var6);
}

- (BOOL)needsLayoutInColumn:(id)a3
{
  uint64_t v4 = [a3 range];
  BOOL v6 = 0;
  if (v5)
  {
    NSUInteger location = self->_dirtyRange.location;
    if (location <= 0x7FFFFFFFFFFFFFFELL)
    {
      unint64_t v8 = v4 + v5;
      if (!(v4 + v5)) {
        return 0;
      }
      unsigned int v9 = [(TSWPStorage *)self->_storage characterAtIndex:v8 - 1] - 4;
      if (v9 < 0xC && ((0x907u >> v9) & 1) != 0)
      {
        return 0;
      }
      else
      {
        int v10 = objc_msgSend(-[TSWPLayoutManager styleProvider](self, "styleProvider"), "paragraphStyleAtParIndex:effectiveRange:", -[TSWPStorage paragraphIndexAtCharIndex:](self->_storage, "paragraphIndexAtCharIndex:", location), v15);
        v11 = v10;
        uint64_t v12 = v15[0];
        BOOL v6 = v15[0] <= v8 && [v10 intValueForProperty:92] != 0;
        if (v12 == v8 && !v6) {
          BOOL v6 = [v11 intValueForProperty:89] != 0;
        }
        if (!v6 && v15[0] > v8)
        {
          BOOL v6 = 0;
          do
          {
            id v13 = [(TSWPLayoutManager *)self styleProvider];
            if (!objc_msgSend((id)objc_msgSend(v13, "paragraphStyleAtParIndex:effectiveRange:", -[TSWPStorage paragraphIndexAtCharIndex:](self->_storage, "paragraphIndexAtCharIndex:", v15[0] - 1), v15), "intValueForProperty:", 90))break; {
            BOOL v6 = v15[0] == v8;
            }
          }
          while (v15[0] > v8);
        }
      }
    }
  }
  return v6;
}

- (double)layoutIntoTarget:(id)a3 withRange:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  [a3 currentSize];
  NSUInteger v8 = length;
  NSUInteger v9 = location;
  if (location + length < [(TSWPStorage *)self->_storage length])
  {
    NSUInteger v10 = [(TSWPStorage *)self->_storage textRangeForParagraphAtCharIndex:location + length];
    NSUInteger v12 = v11;
    if (v10 + v11 <= location + length)
    {
      id v13 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
      uint64_t v14 = [NSString stringWithUTF8String:"-[TSWPLayoutManager layoutIntoTarget:withRange:]"];
      objc_msgSend(v13, "handleFailureInFunction:file:lineNumber:description:", v14, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPLayoutManager.mm"), 372, @"this isn't the next paragraph range");
    }
    v18.NSUInteger location = location;
    v18.NSUInteger length = length;
    v19.NSUInteger location = v10;
    v19.NSUInteger length = v12;
    NSRange v15 = NSUnionRange(v18, v19);
    NSUInteger v9 = v15.location;
    NSUInteger v8 = v15.length;
  }
  if (objc_opt_respondsToSelector()) {
    objc_msgSend(a3, "expandedRangeForLayoutRange:styleProvider:", v9, v8, -[TSWPLayoutManager styleProvider](self, "styleProvider"));
  }
  TSWPTopicNumberHints::TSWPTopicNumberHints(&v17, [(TSWPLayoutManager *)self styleProvider]);
  [(TSWPLayoutManager *)self p_layoutConfigFlagsForTarget:a3];
  operator new();
}

- (void)layoutStateForLayoutTarget:(id)a3 afterHint:(id *)a4 childHint:(id)a5 topicNumbers:(const void *)a6 textIsVertical:(BOOL)a7
{
  if (a4)
  {
    [(TSWPLayoutManager *)self p_layoutConfigFlagsForTarget:a3];
    operator new();
  }
  v7 = objc_msgSend(MEMORY[0x263F7C7F0], "currentHandler", a3, 0, a5, a6, a7);
  uint64_t v8 = [NSString stringWithUTF8String:"-[TSWPLayoutManager layoutStateForLayoutTarget:afterHint:childHint:topicNumbers:textIsVertical:]"];
  objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", v8, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPLayoutManager.mm"), 448, @"bad hint");
  return 0;
}

- (void)deflateTarget:(id)a3 intoHints:(void *)a4 childHints:(id)a5[2] anchoredAttachmentPositions:(id *)a6 topicNumbers:(void *)a7 layoutState:(void *)a8
{
  uint64_t v85 = *MEMORY[0x263EF8340];
  NSUInteger v10 = (void *)[a3 columns];
  uint64_t v79 = (char **)a4;
  unint64_t v77 = [v10 count];
  if (v77)
  {
    unint64_t v11 = 0;
    double v75 = (char *)a4 + 16;
    double v76 = v10;
    do
    {
      NSUInteger v12 = (void *)[v10 objectAtIndexedSubscript:v11];
      id v13 = objc_msgSend(a3, "columnMetricsForCharIndex:outRange:", objc_msgSend(v12, "startCharIndex"), 0);
      if (v13) {
        uint64_t v14 = [v13 columnCount];
      }
      else {
        uint64_t v14 = 1;
      }
      v11 += v14;
      NSRange v15 = (void *)[v10 objectAtIndexedSubscript:v11 - 1];
      [v12 frameBounds];
      uint64_t v17 = v16;
      uint64_t v19 = v18;
      uint64_t v21 = v20;
      [v15 frameBounds];
      double MaxX = CGRectGetMaxX(v88);
      [v12 frameBounds];
      double MinX = CGRectGetMinX(v89);
      unint64_t v24 = [v12 startCharIndex];
      uint64_t v25 = [v15 startCharIndex];
      uint64_t v26 = [v15 characterCount];
      if (v24 <= v26 + v25) {
        unint64_t v27 = v26 + v25;
      }
      else {
        unint64_t v27 = v24;
      }
      if (v24 >= v26 + v25) {
        unint64_t v28 = v26 + v25;
      }
      else {
        unint64_t v28 = v24;
      }
      unint64_t v29 = v27 - v28;
      NSUInteger v30 = [v12 anchoredRange];
      NSUInteger v32 = v31;
      v87.NSUInteger location = [v15 anchoredRange];
      v87.NSUInteger length = v33;
      v86.NSUInteger location = v30;
      v86.NSUInteger length = v32;
      NSRange v34 = NSUnionRange(v86, v87);
      unint64_t v35 = [v15 nextWidowPullsDownFromCharIndex];
      unint64_t v36 = v35;
      if ((v35 - v28 >= v27 - v28 || v35 < v28) && v35 != v27)
      {
        v39 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
        uint64_t v40 = [NSString stringWithUTF8String:"-[TSWPLayoutManager deflateTarget:intoHints:childHints:anchoredAttachmentPositions:topicNumbers:layoutState:]"];
        objc_msgSend(v39, "handleFailureInFunction:file:lineNumber:description:", v40, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPLayoutManager.mm"), 657, @"Bad widow location");
      }
      double v41 = MaxX - MinX;
      double v42 = v79;
      v44 = v79[1];
      unint64_t v43 = (unint64_t)v79[2];
      if ((unint64_t)v44 >= v43)
      {
        double v46 = *v79;
        unint64_t v47 = 0xCCCCCCCCCCCCCCCDLL * ((v44 - *v79) >> 4);
        unint64_t v48 = v47 + 1;
        if (v47 + 1 > 0x333333333333333) {
          abort();
        }
        unint64_t v49 = 0xCCCCCCCCCCCCCCCDLL * ((uint64_t)(v43 - (void)v46) >> 4);
        if (2 * v49 > v48) {
          unint64_t v48 = 2 * v49;
        }
        if (v49 >= 0x199999999999999) {
          unint64_t v50 = 0x333333333333333;
        }
        else {
          unint64_t v50 = v48;
        }
        if (v50)
        {
          double v51 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<EQKitLayoutTable::LayoutRow>>((uint64_t)v75, v50);
          double v46 = *v79;
          v44 = v79[1];
        }
        else
        {
          double v51 = 0;
        }
        double v52 = &v51[80 * v47];
        *(void *)double v52 = v17;
        *((void *)v52 + 1) = v19;
        *((double *)v52 + 2) = v41;
        *((void *)v52 + 3) = v21;
        *((void *)v52 + 4) = v28;
        *((void *)v52 + 5) = v29;
        *((void *)v52 + 6) = v36;
        *(NSRange *)(v52 + 56) = v34;
        *((void *)v52 + 9) = v14;
        double v53 = v52;
        if (v44 == v46)
        {
          double v42 = v79;
          NSUInteger v10 = v76;
        }
        else
        {
          double v42 = v79;
          NSUInteger v10 = v76;
          do
          {
            *((_OWORD *)v53 - 5) = *((_OWORD *)v44 - 5);
            long long v54 = *((_OWORD *)v44 - 4);
            long long v55 = *((_OWORD *)v44 - 3);
            long long v56 = *((_OWORD *)v44 - 1);
            *((_OWORD *)v53 - 2) = *((_OWORD *)v44 - 2);
            *((_OWORD *)v53 - 1) = v56;
            *((_OWORD *)v53 - 4) = v54;
            *((_OWORD *)v53 - 3) = v55;
            v53 -= 80;
            v44 -= 80;
          }
          while (v44 != v46);
          double v46 = *v79;
        }
        double v45 = v52 + 80;
        *double v42 = v53;
        v42[1] = v52 + 80;
        v42[2] = &v51[80 * v50];
        if (v46) {
          operator delete(v46);
        }
      }
      else
      {
        *(void *)v44 = v17;
        *((void *)v44 + 1) = v19;
        *((double *)v44 + 2) = v41;
        *((void *)v44 + 3) = v21;
        *((void *)v44 + 4) = v28;
        *((void *)v44 + 5) = v29;
        *((void *)v44 + 6) = v36;
        *(NSRange *)(v44 + 56) = v34;
        double v45 = v44 + 80;
        *((void *)v44 + 9) = v14;
        NSUInteger v10 = v76;
      }
      v42[1] = v45;
    }
    while (v11 < v77);
  }
  *a5 = 0;
  a5[1] = 0;
  double v57 = (void *)[v10 firstObject];
  if ([v57 countLines]) {
    *a5 = (id)TSWPLineFragment::hintForAttachmentLayout((TSWPLineFragment *)[v57 lineFragmentAtIndex:0]);
  }
  double v58 = (void *)[v10 lastObject];
  uint64_t v59 = [v58 countLines];
  if (v59)
  {
    uint64_t v60 = [v58 lineFragmentAtIndex:v59 - 1];
    if ((*(unsigned char *)(v60 + 25) & 1) == 0) {
      a5[1] = (id)TSWPLineFragment::hintForAttachmentLayout((TSWPLineFragment *)v60);
    }
  }
  double v61 = (void *)[a3 currentAnchoredDrawableLayouts];
  uint64_t v62 = [v61 count];
  if (v62)
  {
    *a6 = (id)[MEMORY[0x263F7C8C8] dictionaryWithCapacity:v62];
    long long v80 = 0u;
    long long v81 = 0u;
    long long v82 = 0u;
    long long v83 = 0u;
    uint64_t v63 = [v61 countByEnumeratingWithState:&v80 objects:v84 count:16];
    if (v63)
    {
      uint64_t v64 = *(void *)v81;
      do
      {
        for (uint64_t i = 0; i != v63; ++i)
        {
          if (*(void *)v81 != v64) {
            objc_enumerationMutation(v61);
          }
          BOOL v66 = *(void **)(*((void *)&v80 + 1) + 8 * i);
          uint64_t v67 = objc_msgSend((id)objc_msgSend(v66, "info"), "owningAttachment");
          double v68 = (void *)MEMORY[0x263F08D40];
          [v66 alignmentFrame];
          objc_msgSend(*a6, "setObject:forUncopiedKey:", objc_msgSend(v68, "valueWithCGPoint:"), v67);
        }
        uint64_t v63 = [v61 countByEnumeratingWithState:&v80 objects:v84 count:16];
      }
      while (v63);
    }
  }
  if (v77)
  {
    unint64_t charIndex = self->_cachedTopicNumbers._charIndex;
    if (charIndex != 0x7FFFFFFFFFFFFFFFLL && charIndex >= *((void *)*v79 + 4))
    {
      int v70 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
      uint64_t v71 = [NSString stringWithUTF8String:"-[TSWPLayoutManager deflateTarget:intoHints:childHints:anchoredAttachmentPositions:topicNumbers:layoutState:]"];
      objc_msgSend(v70, "handleFailureInFunction:file:lineNumber:description:", v71, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPLayoutManager.mm"), 696, @"topic numbers are out of sync with layout");
    }
  }
  TSWPTopicNumberHints::operator=((TSWPTopicNumberHints *)a7, &self->_cachedTopicNumbers);
  TSWPTopicNumberHints::reset(&self->_cachedTopicNumbers);
}

- (void)inflateTarget:(id)a3 fromHints:(const void *)a4 childHint:(id)a5 anchoredAttachmentPositions:(id)a6 topicNumbers:(const void *)a7
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  if (objc_msgSend((id)objc_msgSend(a3, "columns"), "count"))
  {
    uint64_t v8 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v9 = [NSString stringWithUTF8String:"-[TSWPLayoutManager inflateTarget:fromHints:childHint:anchoredAttachmentPositions:topicNumbers:]"];
    objc_msgSend(v8, "handleFailureInFunction:file:lineNumber:description:", v9, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPLayoutManager.mm"), 706, @"Newly created target should have 0 columns");
  }
  objc_msgSend(a3, "setAnchoredDrawablesForRelayout:", objc_msgSend(MEMORY[0x263EFF980], "array"));
  [a3 columns];
  [(TSWPLayoutManager *)self p_layoutConfigFlagsForTarget:a3];
  [(TSWPStorage *)self->_storage wpKind];
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  NSUInteger v10 = (void *)[a6 allKeys];
  uint64_t v11 = [v10 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v11)
  {
    uint64_t v12 = *(void *)v25;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v25 != v12) {
          objc_enumerationMutation(v10);
        }
        uint64_t v14 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        uint64_t v15 = [v14 drawable];
        uint64_t v16 = (void *)[a3 validatedLayoutForAnchoredDrawable:v15];
        uint64_t v17 = (void *)[a6 objectForKeyedSubscript:v14];
        if (v17)
        {
          [v17 CGPointValue];
          double v19 = v18;
          objc_msgSend(v16, "setInterimPositionX:");
          [v16 setInterimPositionY:v19];
          [v16 fixTransformFromInterimPosition];
          objc_msgSend((id)objc_msgSend(a3, "anchoredDrawablesForRelayout"), "addObject:", v15);
        }
        else
        {
          uint64_t v20 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
          uint64_t v21 = [NSString stringWithUTF8String:"-[TSWPLayoutManager inflateTarget:fromHints:childHint:anchoredAttachmentPositions:topicNumbers:]"];
          objc_msgSend(v20, "handleFailureInFunction:file:lineNumber:description:", v21, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPLayoutManager.mm"), 730, @"invalid nil value for '%s'", "value");
        }
      }
      uint64_t v11 = [v10 countByEnumeratingWithState:&v24 objects:v28 count:16];
    }
    while (v11);
  }
  operator new();
}

- (void)destroyLayoutState:(void *)a3
{
  if (a3) {
    (*(void (**)(void *))(*(void *)a3 + 8))(a3);
  }
}

- (TSWPLayoutOwner)owner
{
  return self->_owner;
}

- (TSWPStorage)storage
{
  return self->_storage;
}

- (_NSRange)dirtyRange
{
  NSUInteger length = self->_dirtyRange.length;
  NSUInteger location = self->_dirtyRange.location;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

@end