@interface TSWPStorageMeasurer
- (BOOL)alwaysStartsNewTarget;
- (BOOL)caresAboutStorageChanges;
- (BOOL)columnsAreLeftToRight;
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
- (CGSize)maxSize;
- (CGSize)measuredSizeWithFlags:(unsigned int)a3;
- (CGSize)measuredSizeWithFlags:(unsigned int)a3 maxSize:(CGSize)a4 layoutParent:(id)a5 styleProvider:(id)a6;
- (CGSize)minSize;
- (NSMutableArray)columns;
- (TSDHint)nextTargetFirstChildHint;
- (TSWPFootnoteHeightMeasurer)footnoteHeightMeasurer;
- (TSWPFootnoteMarkProvider)footnoteMarkProvider;
- (TSWPOffscreenColumn)nextTargetFirstColumn;
- (TSWPOffscreenColumn)previousTargetLastColumn;
- (TSWPPadding)layoutMargins;
- (TSWPStorageMeasurer)initWithStorage:(id)a3;
- (const)nextTargetTopicNumbers;
- (const)previousTargetTopicNumbers;
- (double)gapForColumnIndex:(unint64_t)a3 bodyWidth:(double)a4;
- (double)maxAnchorY;
- (double)positionForColumnIndex:(unint64_t)a3 bodyWidth:(double)a4 outWidth:(double *)a5 outGap:(double *)a6;
- (id)columnMetricsForCharIndex:(unint64_t)a3 outRange:(_NSRange *)a4;
- (id)currentAnchoredDrawableLayouts;
- (id)currentInlineDrawableLayouts;
- (id)layoutForInlineDrawable:(id)a3;
- (id)lineHintsForTarget:(id)a3;
- (id)pLayoutWithMinSize:(CGSize)a3 maxSize:(CGSize)a4 anchor:(CGPoint)a5 flags:(unsigned int)a6;
- (id)styleProvider;
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
@end

@implementation TSWPStorageMeasurer

- (TSWPStorageMeasurer)initWithStorage:(id)a3
{
  v4 = [(TSWPStorageMeasurer *)self init];
  if (v4)
  {
    v4->_storage = (TSWPStorage *)a3;
    v4->_columns = (NSMutableArray *)objc_opt_new();
  }
  return v4;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)TSWPStorageMeasurer;
  [(TSWPStorageMeasurer *)&v3 dealloc];
}

- (id)pLayoutWithMinSize:(CGSize)a3 maxSize:(CGSize)a4 anchor:(CGPoint)a5 flags:(unsigned int)a6
{
  CGFloat y = a5.y;
  CGFloat x = a5.x;
  CGFloat height = a4.height;
  CGFloat width = a4.width;
  CGFloat v11 = a3.height;
  CGFloat v12 = a3.width;
  if (![(TSWPStorage *)self->_storage length]) {
    return 0;
  }
  self->_minSize.CGFloat width = v12;
  self->_minSize.CGFloat height = v11;
  self->_maxSize.CGFloat width = width;
  self->_maxSize.CGFloat height = height;
  self->_flags = a6;
  self->_anchor.CGFloat x = x;
  self->_anchor.CGFloat y = y;
  v14 = [[TSWPLayoutManager alloc] initWithStorage:self->_storage owner:self];
  uint64_t v15 = [(TSWPLayoutManager *)v14 layoutIntoTarget:self withLayoutState:0 outSync:0];
  if ([(NSMutableArray *)[(TSWPStorageMeasurer *)self columns] count] != 1)
  {
    v16 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v17 = [NSString stringWithUTF8String:"-[TSWPStorageMeasurer pLayoutWithMinSize:maxSize:anchor:flags:]"];
    objc_msgSend(v16, "handleFailureInFunction:file:lineNumber:description:", v17, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPText.mm"), 1183, @"Invalid column count");
  }
  id v18 = (id)[(NSMutableArray *)[(TSWPStorageMeasurer *)self columns] firstObject];
  if (v15) {
    (*(void (**)(uint64_t))(*(void *)v15 + 8))(v15);
  }
  [(NSMutableArray *)[(TSWPStorageMeasurer *)self columns] removeAllObjects];

  CGSize v19 = (CGSize)*MEMORY[0x263F001B0];
  self->_minSize = (CGSize)*MEMORY[0x263F001B0];
  self->_maxSize = v19;
  self->_flags = 0;
  self->_anchor = (CGPoint)*MEMORY[0x263F00148];
  return v18;
}

- (CGSize)measuredSizeWithFlags:(unsigned int)a3
{
  objc_msgSend(-[TSWPStorageMeasurer pLayoutWithMinSize:maxSize:anchor:flags:](self, "pLayoutWithMinSize:maxSize:anchor:flags:", a3 | 0x1000, *MEMORY[0x263F001B0], *(double *)(MEMORY[0x263F001B0] + 8), 4294967300.0, 4294967300.0, *MEMORY[0x263F00148], *(double *)(MEMORY[0x263F00148] + 8)), "frameBounds");
  double v4 = v3;
  double v6 = v5;
  result.CGFloat height = v6;
  result.CGFloat width = v4;
  return result;
}

- (CGSize)measuredSizeWithFlags:(unsigned int)a3 maxSize:(CGSize)a4 layoutParent:(id)a5 styleProvider:(id)a6
{
  self->_layoutParent = (TSWPLayoutParent *)a5;
  self->_styleProvider = (TSWPStyleProvider *)a6;
  objc_msgSend(-[TSWPStorageMeasurer pLayoutWithMinSize:maxSize:anchor:flags:](self, "pLayoutWithMinSize:maxSize:anchor:flags:", a3 | 0x1000, *MEMORY[0x263F001B0], *(double *)(MEMORY[0x263F001B0] + 8), a4.width, a4.height, *MEMORY[0x263F00148], *(double *)(MEMORY[0x263F00148] + 8)), "frameBounds");
  double v8 = v7;
  double v10 = v9;
  self->_layoutParent = 0;
  self->_styleProvider = 0;
  result.CGFloat height = v10;
  result.CGFloat width = v8;
  return result;
}

- (id)columnMetricsForCharIndex:(unint64_t)a3 outRange:(_NSRange *)a4
{
  if (![(TSWPStorage *)self->_storage supportsColumnStyles]) {
    return self;
  }
  storage = self->_storage;

  return [(TSWPStorage *)storage columnStyleAtCharIndex:0 effectiveRange:0];
}

- (TSWPOffscreenColumn)previousTargetLastColumn
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

- (TSWPFootnoteHeightMeasurer)footnoteHeightMeasurer
{
  return 0;
}

- (TSWPFootnoteMarkProvider)footnoteMarkProvider
{
  return 0;
}

- (TSDHint)nextTargetFirstChildHint
{
  return 0;
}

- (BOOL)isLastTarget
{
  return 1;
}

- (CGSize)minSize
{
  double width = self->_minSize.width;
  double height = self->_minSize.height;
  result.double height = height;
  result.double width = width;
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

- (CGPoint)position
{
  double v2 = *MEMORY[0x263F00148];
  double v3 = *(double *)(MEMORY[0x263F00148] + 8);
  result.CGFloat y = v3;
  result.CGFloat x = v2;
  return result;
}

- (CGPoint)anchorPoint
{
  double x = self->_anchor.x;
  double y = self->_anchor.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (unsigned)autosizeFlags
{
  return self->_flags;
}

- (unsigned)verticalAlignment
{
  return 0;
}

- (unsigned)naturalAlignment
{
  return 0;
}

- (int)naturalDirection
{
  return -1;
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
  result.size.double height = v6;
  result.size.double width = v5;
  result.origin.double y = v4;
  result.origin.double x = v3;
  return result;
}

- (id)layoutForInlineDrawable:(id)a3
{
  double v3 = objc_msgSend(MEMORY[0x263F7C7F0], "currentHandler", a3);
  uint64_t v4 = [NSString stringWithUTF8String:"-[TSWPStorageMeasurer layoutForInlineDrawable:]"];
  objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPText.mm"), 1355, @"Inline attachments not yet supported in TSWPText.");
  return 0;
}

- (id)validatedLayoutForAnchoredDrawable:(id)a3
{
  double v3 = objc_msgSend(MEMORY[0x263F7C7F0], "currentHandler", a3);
  uint64_t v4 = [NSString stringWithUTF8String:"-[TSWPStorageMeasurer validatedLayoutForAnchoredDrawable:]"];
  objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPText.mm"), 1363, @"Anchored attachments not yet supported in TSWPText.");
  return 0;
}

- (id)currentInlineDrawableLayouts
{
  return 0;
}

- (BOOL)shouldPositionAttachmentsIteratively
{
  return 0;
}

- (unint64_t)iterativeAttachmentPositioningMaxPassCount
{
  return 0;
}

- (void)addAttachmentLayout:(id)a3
{
  double v3 = objc_msgSend(MEMORY[0x263F7C7F0], "currentHandler", a3);
  uint64_t v4 = [NSString stringWithUTF8String:"-[TSWPStorageMeasurer addAttachmentLayout:]"];
  uint64_t v5 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPText.mm"];

  [v3 handleFailureInFunction:v4 file:v5 lineNumber:1389 description:@"Partitioned attachments not yet supported in TSWPText."];
}

- (id)currentAnchoredDrawableLayouts
{
  return 0;
}

- (double)maxAnchorY
{
  [(TSWPStorageMeasurer *)self position];
  double v4 = v3;
  [(TSWPStorageMeasurer *)self maxSize];
  return v4 + v5;
}

- (unint64_t)pageNumber
{
  return 0x7FFFFFFFFFFFFFFFLL;
}

- (unint64_t)pageCount
{
  return 0x7FFFFFFFFFFFFFFFLL;
}

- (BOOL)textIsVertical
{
  return 0;
}

- (BOOL)isLayoutOffscreen
{
  return 1;
}

- (BOOL)layoutIsValid
{
  return 1;
}

- (id)styleProvider
{
  return self->_styleProvider;
}

- (BOOL)caresAboutStorageChanges
{
  return 0;
}

- (id)textWrapper
{
  return 0;
}

- (id)lineHintsForTarget:(id)a3
{
  return 0;
}

- (unsigned)maxLineCount
{
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    return 0;
  }
  layoutParent = self->_layoutParent;

  return [(TSWPLayoutParent *)layoutParent maxLineCountForTextLayout:0];
}

- (CGSize)adjustedInsets
{
  double v2 = *MEMORY[0x263F001B0];
  double v3 = *(double *)(MEMORY[0x263F001B0] + 8);
  result.double height = v3;
  result.double width = v2;
  return result;
}

- (TSWPPadding)layoutMargins
{
  return 0;
}

- (unint64_t)columnCount
{
  return 1;
}

- (double)gapForColumnIndex:(unint64_t)a3 bodyWidth:(double)a4
{
  return 0.0;
}

- (double)positionForColumnIndex:(unint64_t)a3 bodyWidth:(double)a4 outWidth:(double *)a5 outGap:(double *)a6
{
  if (a5) {
    *a5 = a4;
  }
  if (a6) {
    *a6 = 0.0;
  }
  return 0.0;
}

- (BOOL)alwaysStartsNewTarget
{
  return 0;
}

- (BOOL)shrinkTextToFit
{
  return 0;
}

- (BOOL)columnsAreLeftToRight
{
  return 1;
}

- (NSMutableArray)columns
{
  return self->_columns;
}

@end