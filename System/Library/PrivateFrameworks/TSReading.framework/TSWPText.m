@interface TSWPText
+ (void)renderColumn:(id)a3 selection:(id)a4 inContext:(CGContext *)a5 isFlipped:(BOOL)a6 viewScale:(double)a7;
+ (void)renderColumns:(id)a3 selection:(id)a4 inContext:(CGContext *)a5 isFlipped:(BOOL)a6 viewScale:(double)a7;
- (BOOL)adjustColumnOriginForAlignment;
- (BOOL)allowsLastLineTruncation;
- (BOOL)alwaysStartsNewTarget;
- (BOOL)caresAboutStorageChanges;
- (BOOL)columnsAreLeftToRight;
- (BOOL)forceWesternLineBreaking;
- (BOOL)isLastTarget;
- (BOOL)isLayoutOffscreen;
- (BOOL)layoutIsValid;
- (BOOL)shouldPositionAttachmentsIteratively;
- (BOOL)shrinkTextToFit;
- (BOOL)textIsVertical;
- (BOOL)wantsLineFragments;
- (CGPoint)anchorPoint;
- (CGPoint)position;
- (CGRect)targetRectForCanvasRect:(CGRect)a3;
- (CGSize)adjustedInsets;
- (CGSize)currentSize;
- (CGSize)maxSize;
- (CGSize)measureStorage:(id)a3;
- (CGSize)measureText:(id)a3;
- (CGSize)minSize;
- (NSMutableArray)columns;
- (TSDHint)nextTargetFirstChildHint;
- (TSUColor)textColorOverride;
- (TSWPFootnoteHeightMeasurer)footnoteHeightMeasurer;
- (TSWPFootnoteMarkProvider)footnoteMarkProvider;
- (TSWPOffscreenColumn)nextTargetFirstColumn;
- (TSWPOffscreenColumn)previousTargetLastColumn;
- (TSWPPadding)layoutMargins;
- (TSWPParagraphStyle)paragraphStyle;
- (TSWPStyleProvider)styleProvider;
- (TSWPText)initWithParagraphStyle:(id)a3;
- (TSWPText)initWithParagraphStyle:(id)a3 columnStyle:(id)a4;
- (TSWPText)initWithParagraphStyle:(id)a3 columnStyle:(id)a4 alignmentForNaturalAlignment:(unsigned int)a5 naturalDirection:(int)a6;
- (TSWPText)initWithParagraphStyle:(id)a3 listStyle:(id)a4;
- (TSWPText)initWithParagraphStyle:(id)a3 listStyle:(id)a4 columnStyle:(id)a5;
- (TSWPText)initWithParagraphStyle:(id)a3 listStyle:(id)a4 columnStyle:(id)a5 alignmentForNaturalAlignment:(unsigned int)a6 naturalDirection:(int)a7;
- (TSWPTextDelegate)delegate;
- (const)nextTargetTopicNumbers;
- (const)previousTargetTopicNumbers;
- (double)gapForColumnIndex:(unint64_t)a3 bodyWidth:(double)a4;
- (double)maxAnchorY;
- (double)positionForColumnIndex:(unint64_t)a3 bodyWidth:(double)a4 outWidth:(double *)a5 outGap:(double *)a6;
- (double)reservedWidthWhenTruncating;
- (double)widthForColumnIndex:(unint64_t)a3 bodyWidth:(double)a4;
- (id)currentAnchoredDrawableLayouts;
- (id)currentInlineDrawableLayouts;
- (id)layoutForInlineDrawable:(id)a3;
- (id)layoutMultiColumnTextStorage:(id)a3 minSize:(CGSize)a4 maxSize:(CGSize)a5 anchor:(CGPoint)a6 pageNumber:(unint64_t)a7 pageCount:(unint64_t)a8 flags:(int)a9;
- (id)layoutText:(id)a3 kind:(int)a4 minSize:(CGSize)a5 maxSize:(CGSize)a6 anchor:(CGPoint)a7 flags:(int)a8;
- (id)layoutText:(id)a3 minSize:(CGSize)a4 maxSize:(CGSize)a5 anchor:(CGPoint)a6 flags:(int)a7;
- (id)layoutTextStorage:(id)a3 minSize:(CGSize)a4 maxSize:(CGSize)a5 anchor:(CGPoint)a6 flags:(int)a7;
- (id)layoutTextStorage:(id)a3 minSize:(CGSize)a4 maxSize:(CGSize)a5 anchor:(CGPoint)a6 pageNumber:(unint64_t)a7 pageCount:(unint64_t)a8 flags:(int)a9;
- (id)lineHintsForTarget:(id)a3;
- (id)textWrapper;
- (id)validatedLayoutForAnchoredDrawable:(id)a3;
- (int)naturalDirection;
- (unint64_t)columnCount;
- (unint64_t)iterativeAttachmentPositioningMaxPassCount;
- (unint64_t)pageCount;
- (unint64_t)pageNumber;
- (unsigned)autosizeFlags;
- (unsigned)maxLineCount;
- (unsigned)naturalAlignment;
- (unsigned)verticalAlignment;
- (void)addAttachmentLayout:(id)a3;
- (void)dealloc;
- (void)drawColumn:(id)a3 inContext:(CGContext *)a4 isFlipped:(BOOL)a5 viewScale:(double)a6;
- (void)drawColumn:(id)a3 selection:(id)a4 inContext:(CGContext *)a5 isFlipped:(BOOL)a6 viewScale:(double)a7;
- (void)drawText:(id)a3 inContext:(CGContext *)a4 minSize:(CGSize)a5 maxSize:(CGSize)a6 anchor:(CGPoint)a7 flags:(int)a8 viewScale:(double)a9;
- (void)setAllowsLastLineTruncation:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setMaxLineCount:(unsigned int)a3;
- (void)setReservedWidthWhenTruncating:(double)a3;
- (void)setStyleProvider:(id)a3;
- (void)setTextColorOverride:(id)a3;
@end

@implementation TSWPText

- (void)setReservedWidthWhenTruncating:(double)a3
{
  self->_reservedWidthWhenTruncating = a3;
}

- (void)setMaxLineCount:(unsigned int)a3
{
  self->_maxLineCount = a3;
}

- (void)setAllowsLastLineTruncation:(BOOL)a3
{
  self->_allowsLastLineTruncation = a3;
}

- (double)maxAnchorY
{
  [(TSWPText *)self position];
  double v4 = v3;
  [(TSWPText *)self maxSize];
  return v4 + v5;
}

- (CGPoint)position
{
  double v2 = *MEMORY[0x263F00148];
  double v3 = *(double *)(MEMORY[0x263F00148] + 8);
  result.y = v3;
  result.x = v2;
  return result;
}

- (CGSize)maxSize
{
  double width = self->_maxSize.width;
  double height = self->_maxSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (CGSize)adjustedInsets
{
  delegate = self->_delegate;
  if (delegate)
  {
    double v4 = (void *)[(TSWPTextDelegate *)delegate padding];
    [v4 leftInset];
    double v6 = v5;
    [v4 topInset];
    double v8 = v7;
    double v9 = v6;
  }
  else
  {
    columnStyle = self->_columnStyle;
    [(TSWPColumnStyle *)columnStyle adjustedInsets];
  }
  result.double height = v8;
  result.double width = v9;
  return result;
}

- (BOOL)textIsVertical
{
  return 0;
}

- (CGSize)currentSize
{
  if (![(TSWPText *)self autosizeFlags])
  {
    [(TSWPText *)self minSize];
    double v4 = v3;
    double v6 = v5;
    [(TSWPText *)self maxSize];
    if (v4 != v8 || v6 != v7)
    {
      v10 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
      uint64_t v11 = [NSString stringWithUTF8String:"-[TSWPText currentSize]"];
      objc_msgSend(v10, "handleFailureInFunction:file:lineNumber:description:", v11, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPText.mm"), 630, @"autosizeFlags set to no autosize but min and max sizes are unequal. They should be the same.");
    }
  }

  [(TSWPText *)self maxSize];
  result.double height = v13;
  result.double width = v12;
  return result;
}

- (unsigned)autosizeFlags
{
  return self->_flags;
}

- (unint64_t)columnCount
{
  return [(TSWPColumnStyle *)self->_columnStyle columnCount];
}

- (double)positionForColumnIndex:(unint64_t)a3 bodyWidth:(double)a4 outWidth:(double *)a5 outGap:(double *)a6
{
  if (self->_delegate)
  {
    [(TSWPColumnStyle *)self->_columnStyle adjustedInsets];
    if (v12 != *MEMORY[0x263F001B0] || v11 != *(double *)(MEMORY[0x263F001B0] + 8))
    {
      v14 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
      uint64_t v15 = [NSString stringWithUTF8String:"-[TSWPText positionForColumnIndex:bodyWidth:outWidth:outGap:]"];
      [v14 handleFailureInFunction:v15, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPText.mm"), 532, @"if a delegate provides padding, column style must not have a non-zero adjusted inset" file lineNumber description];
    }
    [(TSWPText *)self adjustedInsets];
    double v17 = 10.0;
    if (a4 <= 10.0) {
      double v17 = a4;
    }
    if (v16 >= (a4 - v17) * 0.5) {
      double v18 = (a4 - v17) * 0.5;
    }
    else {
      double v18 = v16;
    }
    a4 = a4 + v18 * -2.0;
    if (a4 < v17)
    {
      v19 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
      uint64_t v20 = [NSString stringWithUTF8String:"-[TSWPText positionForColumnIndex:bodyWidth:outWidth:outGap:]"];
      objc_msgSend(v19, "handleFailureInFunction:file:lineNumber:description:", v20, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPText.mm"), 541, @"created an undersized column");
    }
  }
  else
  {
    double v18 = 0.0;
  }
  [(TSWPColumnStyle *)self->_columnStyle positionForColumnIndex:a3 bodyWidth:a5 outWidth:a6 outGap:a4];
  return v18 + v21;
}

- (unint64_t)pageNumber
{
  return self->_pageNumber;
}

- (TSWPPadding)layoutMargins
{
  return 0;
}

- (BOOL)columnsAreLeftToRight
{
  return 1;
}

- (unsigned)naturalAlignment
{
  return self->_naturalAlignment;
}

- (id)textWrapper
{
  return 0;
}

- (TSUColor)textColorOverride
{
  return self->_textColorOverride;
}

- (TSWPOffscreenColumn)previousTargetLastColumn
{
  return 0;
}

- (TSWPFootnoteMarkProvider)footnoteMarkProvider
{
  return 0;
}

- (TSWPFootnoteHeightMeasurer)footnoteHeightMeasurer
{
  return 0;
}

- (BOOL)forceWesternLineBreaking
{
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    return 0;
  }
  delegate = self->_delegate;

  return [(TSWPTextDelegate *)delegate forceWesternLineBreaking];
}

- (TSWPText)initWithParagraphStyle:(id)a3 columnStyle:(id)a4 alignmentForNaturalAlignment:(unsigned int)a5 naturalDirection:(int)a6
{
  return [(TSWPText *)self initWithParagraphStyle:a3 listStyle:0 columnStyle:a4 alignmentForNaturalAlignment:*(void *)&a5 naturalDirection:*(void *)&a6];
}

- (id)lineHintsForTarget:(id)a3
{
  return 0;
}

- (BOOL)shouldPositionAttachmentsIteratively
{
  return 0;
}

- (BOOL)isLastTarget
{
  return 1;
}

- (BOOL)allowsLastLineTruncation
{
  return self->_allowsLastLineTruncation;
}

+ (void)renderColumns:(id)a3 selection:(id)a4 inContext:(CGContext *)a5 isFlipped:(BOOL)a6 viewScale:(double)a7
{
  BOOL v8 = a6;
  uint64_t v20 = *MEMORY[0x263EF8340];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v11 = [a3 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v16;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v16 != v13) {
          objc_enumerationMutation(a3);
        }
        +[TSWPText renderColumn:*(void *)(*((void *)&v15 + 1) + 8 * v14++) selection:0 inContext:a5 isFlipped:v8 viewScale:a7];
      }
      while (v12 != v14);
      uint64_t v12 = [a3 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v12);
  }
}

- (TSWPStyleProvider)styleProvider
{
  return self->_styleProvider;
}

- (unsigned)verticalAlignment
{
  delegate = self->_delegate;
  if (delegate) {
    return [(TSWPTextDelegate *)delegate verticalAlignment];
  }
  else {
    return [(TSSStyle *)self->_columnStyle intValueForProperty:149];
  }
}

- (id)currentAnchoredDrawableLayouts
{
  return 0;
}

- (id)layoutMultiColumnTextStorage:(id)a3 minSize:(CGSize)a4 maxSize:(CGSize)a5 anchor:(CGPoint)a6 pageNumber:(unint64_t)a7 pageCount:(unint64_t)a8 flags:(int)a9
{
  CGFloat y = a6.y;
  CGFloat x = a6.x;
  CGFloat height = a5.height;
  CGFloat width = a5.width;
  CGFloat v16 = a4.height;
  CGFloat v17 = a4.width;
  if (self->_storage)
  {
    uint64_t v20 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v21 = [NSString stringWithUTF8String:"-[TSWPText layoutMultiColumnTextStorage:minSize:maxSize:anchor:pageNumber:pageCount:flags:]"];
    objc_msgSend(v20, "handleFailureInFunction:file:lineNumber:description:", v21, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPText.mm"), 149, @"Storage should be nil");
  }
  if (!a3)
  {
    v22 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v23 = [NSString stringWithUTF8String:"-[TSWPText layoutMultiColumnTextStorage:minSize:maxSize:anchor:pageNumber:pageCount:flags:]"];
    objc_msgSend(v22, "handleFailureInFunction:file:lineNumber:description:", v23, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPText.mm"), 150, @"Should probably pass some actual text to layout - it is nil");
  }
  id result = (id)[a3 length];
  if (result)
  {
    self->_minSize.CGFloat width = v17;
    self->_maxSize.CGFloat width = width;
    self->_minSize.CGFloat height = v16;
    self->_maxSize.CGFloat height = height;
    self->_flags = a9;
    self->_anchor.CGFloat x = x;
    self->_anchor.CGFloat y = y;
    self->_pageNumber = a7;
    self->_pageCount = a8;
    self->_storage = (TSWPStorage *)a3;
    v25 = [[TSWPLayoutManager alloc] initWithStorage:self->_storage owner:self];
    uint64_t v26 = [(TSWPLayoutManager *)v25 layoutIntoTarget:self withLayoutState:0 outSync:0];
    if (v26) {
      (*(void (**)(uint64_t))(*(void *)v26 + 8))(v26);
    }
    id v27 = (id)[(NSMutableArray *)[(TSWPText *)self columns] copy];
    [(NSMutableArray *)[(TSWPText *)self columns] removeAllObjects];

    CGSize v28 = (CGSize)*MEMORY[0x263F001B0];
    self->_minSize = (CGSize)*MEMORY[0x263F001B0];
    self->_maxSize = v28;
    self->_flags = 0;
    self->_anchor = (CGPoint)*MEMORY[0x263F00148];
    self->_storage = 0;
    return v27;
  }
  return result;
}

- (NSMutableArray)columns
{
  return self->_columns;
}

- (BOOL)caresAboutStorageChanges
{
  return 0;
}

- (void)dealloc
{
  self->_storage = 0;
  self->_paragraphStyle = 0;

  self->_listStyle = 0;
  self->_columnStyle = 0;

  self->_columns = 0;
  self->_textColorOverride = 0;

  self->_styleProvider = 0;
  v3.receiver = self;
  v3.super_class = (Class)TSWPText;
  [(TSWPText *)&v3 dealloc];
}

- (TSWPText)initWithParagraphStyle:(id)a3 listStyle:(id)a4 columnStyle:(id)a5 alignmentForNaturalAlignment:(unsigned int)a6 naturalDirection:(int)a7
{
  v14.receiver = self;
  v14.super_class = (Class)TSWPText;
  uint64_t v12 = [(TSWPText *)&v14 init];
  if (v12)
  {
    v12->_paragraphStyle = (TSWPParagraphStyle *)a3;
    v12->_listStyle = (TSWPListStyle *)a4;
    if (!a5) {
      a5 = +[TSWPColumnStyle defaultStyleWithContext:](TSWPColumnStyle, "defaultStyleWithContext:", [a3 context]);
    }
    v12->_columnStyle = (TSWPColumnStyle *)a5;
    v12->_columns = (NSMutableArray *)objc_opt_new();
    v12->_naturalAlignment = a6;
    v12->_naturalDirection = a7;
  }
  return v12;
}

- (unsigned)maxLineCount
{
  return self->_maxLineCount;
}

- (CGSize)minSize
{
  double width = self->_minSize.width;
  double height = self->_minSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (unint64_t)pageCount
{
  return self->_pageCount;
}

- (BOOL)adjustColumnOriginForAlignment
{
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    return 0;
  }
  delegate = self->_delegate;

  return [(TSWPTextDelegate *)delegate adjustColumnOriginForAlignment];
}

+ (void)renderColumn:(id)a3 selection:(id)a4 inContext:(CGContext *)a5 isFlipped:(BOOL)a6 viewScale:(double)a7
{
  BOOL v8 = a6;
  if (!a3 || !a5)
  {
    uint64_t v12 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v13 = [NSString stringWithUTF8String:"+[TSWPText renderColumn:selection:inContext:isFlipped:viewScale:]"];
    objc_msgSend(v12, "handleFailureInFunction:file:lineNumber:description:", v13, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPText.mm"), 427, @"Invalid arguments");
  }
  v22 = 0;
  uint64_t v23 = 0;
  uint64_t v24 = 0;
  objc_super v14 = [[TSWPRenderer alloc] initWithContext:a5];
  [(TSWPRenderer *)v14 setFlipShadows:v8];
  [(TSWPRenderer *)v14 setViewScale:a7];
  [(TSWPRenderer *)v14 setPreventClipToColumn:1];
  long long v15 = (void *)MEMORY[0x263F7C7C8];
  uint64_t v16 = *MEMORY[0x263F7C7C8];
  uint64_t v17 = *(void *)(MEMORY[0x263F7C7C8] + 8);
  LOBYTE(v21) = 0;
  LODWORD(v20) = 3;
  LOBYTE(v19) = TSDCGContextHasBackgroundsSuppressed((uint64_t)a5);
  LOBYTE(v18) = 0;
  objc_msgSend(a3, "renderWithRenderer:currentSelection:limitSelection:listRange:rubyGlyphRange:isCanvasInteractive:spellChecker:suppressedMisspellingRange:blackAndWhite:dictationInterpretations:autocorrections:markedRange:markedText:renderMode:pageCount:suppressInvisibles:currentCanvasSelection:", v14, 0, a4, v16, v17, v16, v17, v18, 0, v16, v17, v19, &v22, &v22, *v15,
    v15[1],
    0,
    v20,
    0x7FFFFFFFFFFFFFFFLL,
    v21,
    0);

  if (v22)
  {
    uint64_t v23 = v22;
    operator delete(v22);
  }
}

- (TSWPText)initWithParagraphStyle:(id)a3 listStyle:(id)a4 columnStyle:(id)a5
{
  return [(TSWPText *)self initWithParagraphStyle:a3 listStyle:a4 columnStyle:a5 alignmentForNaturalAlignment:0 naturalDirection:0];
}

- (TSWPText)initWithParagraphStyle:(id)a3 columnStyle:(id)a4
{
  return [(TSWPText *)self initWithParagraphStyle:a3 listStyle:0 columnStyle:a4 alignmentForNaturalAlignment:0 naturalDirection:0];
}

- (TSWPText)initWithParagraphStyle:(id)a3
{
  return [(TSWPText *)self initWithParagraphStyle:a3 listStyle:0 columnStyle:0 alignmentForNaturalAlignment:0 naturalDirection:0];
}

- (TSWPText)initWithParagraphStyle:(id)a3 listStyle:(id)a4
{
  return [(TSWPText *)self initWithParagraphStyle:a3 listStyle:a4 columnStyle:0 alignmentForNaturalAlignment:0 naturalDirection:0];
}

- (id)layoutTextStorage:(id)a3 minSize:(CGSize)a4 maxSize:(CGSize)a5 anchor:(CGPoint)a6 flags:(int)a7
{
  return -[TSWPText layoutTextStorage:minSize:maxSize:anchor:pageNumber:pageCount:flags:](self, "layoutTextStorage:minSize:maxSize:anchor:pageNumber:pageCount:flags:", a3, 0x7FFFFFFFFFFFFFFFLL, 0x7FFFFFFFFFFFFFFFLL, *(void *)&a7, a4.width, a4.height, a5.width, a5.height, a6.x, a6.y);
}

- (id)layoutTextStorage:(id)a3 minSize:(CGSize)a4 maxSize:(CGSize)a5 anchor:(CGPoint)a6 pageNumber:(unint64_t)a7 pageCount:(unint64_t)a8 flags:(int)a9
{
  id v9 = -[TSWPText layoutMultiColumnTextStorage:minSize:maxSize:anchor:pageNumber:pageCount:flags:](self, "layoutMultiColumnTextStorage:minSize:maxSize:anchor:pageNumber:pageCount:flags:", a3, a7, a8, *(void *)&a9, a4.width, a4.height, a5.width, a5.height, a6.x, a6.y);
  if ([v9 count] != 1)
  {
    v10 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v11 = [NSString stringWithUTF8String:"-[TSWPText layoutTextStorage:minSize:maxSize:anchor:pageNumber:pageCount:flags:]"];
    objc_msgSend(v10, "handleFailureInFunction:file:lineNumber:description:", v11, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPText.mm"), 140, @"Invalid column count");
  }
  id v12 = (id)[v9 firstObject];

  return v12;
}

- (id)layoutText:(id)a3 minSize:(CGSize)a4 maxSize:(CGSize)a5 anchor:(CGPoint)a6 flags:(int)a7
{
  return -[TSWPText layoutText:kind:minSize:maxSize:anchor:flags:](self, "layoutText:kind:minSize:maxSize:anchor:flags:", a3, 3, *(void *)&a7, a4.width, a4.height, a5.width, a5.height, a6.x, a6.y);
}

- (id)layoutText:(id)a3 kind:(int)a4 minSize:(CGSize)a5 maxSize:(CGSize)a6 anchor:(CGPoint)a7 flags:(int)a8
{
  CGFloat y = a7.y;
  CGFloat x = a7.x;
  CGFloat height = a6.height;
  CGFloat width = a6.width;
  CGFloat v13 = a5.height;
  CGFloat v14 = a5.width;
  uint64_t v15 = *(void *)&a4;
  if (!self->_paragraphStyle)
  {
    uint64_t v18 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v19 = [NSString stringWithUTF8String:"-[TSWPText layoutText:kind:minSize:maxSize:anchor:flags:]"];
    objc_msgSend(v18, "handleFailureInFunction:file:lineNumber:description:", v19, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPText.mm"), 208, @"Paragraph style is required");
  }
  if (self->_storage)
  {
    uint64_t v20 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v21 = [NSString stringWithUTF8String:"-[TSWPText layoutText:kind:minSize:maxSize:anchor:flags:]"];
    objc_msgSend(v20, "handleFailureInFunction:file:lineNumber:description:", v21, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPText.mm"), 209, @"Storage should be nil");
  }
  if (!a3)
  {
    v22 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v23 = [NSString stringWithUTF8String:"-[TSWPText layoutText:kind:minSize:maxSize:anchor:flags:]"];
    objc_msgSend(v22, "handleFailureInFunction:file:lineNumber:description:", v23, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPText.mm"), 210, @"Should probably pass some actual text to layout - it is nil");
  }
  if (![a3 length]) {
    return 0;
  }
  self->_minSize.CGFloat width = v14;
  self->_minSize.CGFloat height = v13;
  self->_maxSize.CGFloat width = width;
  self->_maxSize.CGFloat height = height;
  self->_flags = a8;
  self->_anchor.CGFloat x = x;
  self->_anchor.CGFloat y = y;
  uint64_t v24 = [TSWPStorage alloc];
  v25 = [(TSPObject *)self->_paragraphStyle context];
  uint64_t v26 = [(TSSStyle *)self->_paragraphStyle stylesheet];
  LODWORD(v35) = self->_naturalDirection;
  id v27 = [(TSWPStorage *)v24 initWithContext:v25 string:a3 kind:v15 stylesheet:v26 paragraphStyle:self->_paragraphStyle listStyle:self->_listStyle section:0 columnStyle:0 paragraphDirection:v35];
  self->_storage = v27;
  if (!v27) {
    return 0;
  }
  CGSize v28 = [[TSWPLayoutManager alloc] initWithStorage:self->_storage owner:self];
  uint64_t v29 = [(TSWPLayoutManager *)v28 layoutIntoTarget:self withLayoutState:0 outSync:0];
  if ([(NSMutableArray *)[(TSWPText *)self columns] count] != 1)
  {
    v30 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v31 = [NSString stringWithUTF8String:"-[TSWPText layoutText:kind:minSize:maxSize:anchor:flags:]"];
    objc_msgSend(v30, "handleFailureInFunction:file:lineNumber:description:", v31, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPText.mm"), 244, @"Invalid column count");
  }
  id v32 = (id)[(NSMutableArray *)[(TSWPText *)self columns] firstObject];
  if (v29) {
    (*(void (**)(uint64_t))(*(void *)v29 + 8))(v29);
  }
  [(NSMutableArray *)[(TSWPText *)self columns] removeAllObjects];

  CGSize v33 = (CGSize)*MEMORY[0x263F001B0];
  self->_minSize = (CGSize)*MEMORY[0x263F001B0];
  self->_maxSize = v33;
  self->_flags = 0;
  self->_anchor = (CGPoint)*MEMORY[0x263F00148];

  self->_storage = 0;
  return v32;
}

- (CGSize)measureText:(id)a3
{
  double v3 = *MEMORY[0x263F001B0];
  double v4 = *(double *)(MEMORY[0x263F001B0] + 8);
  if (a3)
  {
    objc_msgSend(-[TSWPText layoutText:minSize:maxSize:anchor:flags:](self, "layoutText:minSize:maxSize:anchor:flags:", a3, 4111, v3, v4, 4294967300.0, 4294967300.0, *MEMORY[0x263F00148], *(double *)(MEMORY[0x263F00148] + 8)), "frameBounds");
    double v3 = v5;
    double v4 = v6;
  }
  result.CGFloat height = v4;
  result.CGFloat width = v3;
  return result;
}

- (CGSize)measureStorage:(id)a3
{
  double v3 = *MEMORY[0x263F001B0];
  double v4 = *(double *)(MEMORY[0x263F001B0] + 8);
  if (a3)
  {
    objc_msgSend(-[TSWPText layoutTextStorage:minSize:maxSize:anchor:flags:](self, "layoutTextStorage:minSize:maxSize:anchor:flags:", a3, 4111, v3, v4, 4294967300.0, 4294967300.0, *MEMORY[0x263F00148], *(double *)(MEMORY[0x263F00148] + 8)), "frameBounds");
    double v3 = v5;
    double v4 = v6;
  }
  result.CGFloat height = v4;
  result.CGFloat width = v3;
  return result;
}

- (void)drawColumn:(id)a3 selection:(id)a4 inContext:(CGContext *)a5 isFlipped:(BOOL)a6 viewScale:(double)a7
{
  BOOL v8 = a6;
  if (!a3 || !a5)
  {
    CGFloat v13 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v14 = [NSString stringWithUTF8String:"-[TSWPText drawColumn:selection:inContext:isFlipped:viewScale:]"];
    objc_msgSend(v13, "handleFailureInFunction:file:lineNumber:description:", v14, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPText.mm"), 306, @"Invalid arguments");
  }
  uint64_t v23 = 0;
  uint64_t v24 = 0;
  uint64_t v25 = 0;
  uint64_t v15 = [[TSWPRenderer alloc] initWithContext:a5];
  [(TSWPRenderer *)v15 setFlipShadows:v8];
  [(TSWPRenderer *)v15 setViewScale:a7];
  uint64_t v16 = (void *)MEMORY[0x263F7C7C8];
  uint64_t v17 = *MEMORY[0x263F7C7C8];
  uint64_t v18 = *(void *)(MEMORY[0x263F7C7C8] + 8);
  LOBYTE(v22) = 0;
  LODWORD(v21) = 3;
  LOBYTE(v20) = TSDCGContextHasBackgroundsSuppressed((uint64_t)a5);
  LOBYTE(v19) = 0;
  objc_msgSend(a3, "renderWithRenderer:currentSelection:limitSelection:listRange:rubyGlyphRange:isCanvasInteractive:spellChecker:suppressedMisspellingRange:blackAndWhite:dictationInterpretations:autocorrections:markedRange:markedText:renderMode:pageCount:suppressInvisibles:currentCanvasSelection:", v15, 0, a4, v17, v18, v17, v18, v19, 0, v17, v18, v20, &v23, &v23, *v16,
    v16[1],
    0,
    v21,
    [(TSWPText *)self pageCount],
    v22,
    0);

  if (v23)
  {
    uint64_t v24 = v23;
    operator delete(v23);
  }
}

- (void)drawColumn:(id)a3 inContext:(CGContext *)a4 isFlipped:(BOOL)a5 viewScale:(double)a6
{
}

- (void)drawText:(id)a3 inContext:(CGContext *)a4 minSize:(CGSize)a5 maxSize:(CGSize)a6 anchor:(CGPoint)a7 flags:(int)a8 viewScale:(double)a9
{
  CGFloat y = a7.y;
  CGFloat x = a7.x;
  id v14 = -[TSWPText layoutText:minSize:maxSize:anchor:flags:](self, "layoutText:minSize:maxSize:anchor:flags:", a3, *(void *)&a8, a5.width, a5.height, a6.width, a6.height);
  if (v14)
  {
    id v15 = v14;
    CGContextSaveGState(a4);
    CGContextTranslateCTM(a4, x, y);
    [(TSWPText *)self drawColumn:v15 inContext:a4 isFlipped:0 viewScale:a9];
    CGContextRestoreGState(a4);
  }
}

- (double)widthForColumnIndex:(unint64_t)a3 bodyWidth:(double)a4
{
  [(TSWPColumnStyle *)self->_columnStyle widthForColumnIndex:a3 bodyWidth:a4];
  return result;
}

- (double)gapForColumnIndex:(unint64_t)a3 bodyWidth:(double)a4
{
  [(TSWPColumnStyle *)self->_columnStyle gapForColumnIndex:a3 bodyWidth:a4];
  return result;
}

- (BOOL)alwaysStartsNewTarget
{
  return 0;
}

- (BOOL)shrinkTextToFit
{
  return 0;
}

- (const)previousTargetTopicNumbers
{
  return 0;
}

- (const)nextTargetTopicNumbers
{
  return 0;
}

- (TSWPOffscreenColumn)nextTargetFirstColumn
{
  return 0;
}

- (TSDHint)nextTargetFirstChildHint
{
  return 0;
}

- (CGPoint)anchorPoint
{
  double x = self->_anchor.x;
  double y = self->_anchor.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (BOOL)wantsLineFragments
{
  return (BYTE1(self->_flags) >> 4) & 1;
}

- (CGRect)targetRectForCanvasRect:(CGRect)a3
{
  double v3 = *MEMORY[0x263F001A8];
  double v4 = *(double *)(MEMORY[0x263F001A8] + 8);
  double v5 = *(double *)(MEMORY[0x263F001A8] + 16);
  double v6 = *(double *)(MEMORY[0x263F001A8] + 24);
  result.size.CGFloat height = v6;
  result.size.CGFloat width = v5;
  result.origin.double y = v4;
  result.origin.double x = v3;
  return result;
}

- (id)layoutForInlineDrawable:(id)a3
{
  return 0;
}

- (id)validatedLayoutForAnchoredDrawable:(id)a3
{
  double v3 = objc_msgSend(MEMORY[0x263F7C7F0], "currentHandler", a3);
  uint64_t v4 = [NSString stringWithUTF8String:"-[TSWPText validatedLayoutForAnchoredDrawable:]"];
  objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPText.mm"), 699, @"Anchored attachments not yet supported in TSWPText.");
  return 0;
}

- (unint64_t)iterativeAttachmentPositioningMaxPassCount
{
  return 0;
}

- (id)currentInlineDrawableLayouts
{
  return 0;
}

- (void)addAttachmentLayout:(id)a3
{
  double v3 = objc_msgSend(MEMORY[0x263F7C7F0], "currentHandler", a3);
  uint64_t v4 = [NSString stringWithUTF8String:"-[TSWPText addAttachmentLayout:]"];
  uint64_t v5 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPText.mm"];

  [v3 handleFailureInFunction:v4 file:v5 lineNumber:725 description:@"Partitioned attachments not yet supported in TSWPTableText."];
}

- (BOOL)isLayoutOffscreen
{
  return 0;
}

- (BOOL)layoutIsValid
{
  return 1;
}

- (double)reservedWidthWhenTruncating
{
  return self->_reservedWidthWhenTruncating;
}

- (TSWPTextDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = (TSWPTextDelegate *)a3;
}

- (TSWPParagraphStyle)paragraphStyle
{
  return self->_paragraphStyle;
}

- (void)setStyleProvider:(id)a3
{
}

- (int)naturalDirection
{
  return self->_naturalDirection;
}

- (void)setTextColorOverride:(id)a3
{
}

@end