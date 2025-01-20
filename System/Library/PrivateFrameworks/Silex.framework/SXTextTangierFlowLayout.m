@interface SXTextTangierFlowLayout
- (BOOL)allowsLastLineTruncation;
- (BOOL)ignoresEquationAlignment;
- (BOOL)isLastTarget;
- (BOOL)isLayoutOffscreen;
- (BOOL)layoutIsValid;
- (BOOL)shouldDisplayGuides;
- (BOOL)shouldHyphenate;
- (BOOL)shouldPositionAttachmentsIteratively;
- (BOOL)shouldProvideSizingGuides;
- (BOOL)textIsVertical;
- (BOOL)wantsLineFragments;
- (CGPoint)anchorPoint;
- (CGPoint)capturedInfoPositionForAttachment;
- (CGPoint)pointForCharacterPosition:(unint64_t)a3;
- (CGPoint)position;
- (CGRect)maskRect;
- (CGRect)targetRectForCanvasRect:(CGRect)a3;
- (CGSize)currentSize;
- (NSMutableArray)columns;
- (SXTextTangierFlowLayout)initWithInfo:(id)a3 layout:(id)a4 frame:(CGRect)a5;
- (TSDCanvas)canvas;
- (TSDHint)nextTargetFirstChildHint;
- (TSWPFootnoteHeightMeasurer)footnoteHeightMeasurer;
- (TSWPFootnoteMarkProvider)footnoteMarkProvider;
- (TSWPOffscreenColumn)nextTargetFirstColumn;
- (TSWPOffscreenColumn)previousTargetLastColumn;
- (const)nextTargetTopicNumbers;
- (const)previousTargetTopicNumbers;
- (double)maxAnchorY;
- (id)columnMetricsForCharIndex:(unint64_t)a3 outRange:(_NSRange *)a4;
- (id)currentAnchoredDrawableLayouts;
- (id)layoutForInlineDrawable:(id)a3;
- (id)layoutGeometryFromInfo;
- (id)validatedLayoutForAnchoredDrawable:(id)a3;
- (int)naturalDirection;
- (unint64_t)characterPositionForPoint:(CGPoint)a3;
- (unint64_t)iterativeAttachmentPositioningMaxPassCount;
- (unint64_t)pageCount;
- (unint64_t)pageNumber;
- (unsigned)autosizeFlags;
- (unsigned)maxLineCount;
- (unsigned)naturalAlignment;
- (unsigned)verticalAlignment;
- (void)addAttachmentLayout:(id)a3;
- (void)dealloc;
- (void)setColumns:(id)a3;
@end

@implementation SXTextTangierFlowLayout

- (SXTextTangierFlowLayout)initWithInfo:(id)a3 layout:(id)a4 frame:(CGRect)a5
{
  double height = a5.size.height;
  double width = a5.size.width;
  double y = a5.origin.y;
  double x = a5.origin.x;
  uint64_t v46 = *MEMORY[0x263EF8340];
  id v11 = a3;
  id v12 = a4;
  v43.receiver = self;
  v43.super_class = (Class)SXTextTangierFlowLayout;
  v13 = [(TSDLayout *)&v43 initWithInfo:v11];
  if (v13)
  {
    v14 = objc_msgSend(objc_alloc(MEMORY[0x263F7C6D0]), "initWithFrame:", x, y, width, height);
    [(TSDAbstractLayout *)v13 setGeometry:v14];

    id v15 = objc_alloc_init(MEMORY[0x263EFF980]);
    [(SXTextTangierFlowLayout *)v13 setColumns:v15];

    long long v41 = 0u;
    long long v42 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    v16 = [v12 columns];
    uint64_t v17 = [v16 countByEnumeratingWithState:&v39 objects:v45 count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v19 = *(void *)v40;
      do
      {
        uint64_t v20 = 0;
        do
        {
          if (*(void *)v40 != v19) {
            objc_enumerationMutation(v16);
          }
          v21 = *(void **)(*((void *)&v39 + 1) + 8 * v20);
          v22 = [v11 storage];
          uint64_t v23 = [v11 range];
          objc_msgSend(v21, "setStorage:range:", v22, v23, v24);

          v25 = [(SXTextTangierFlowLayout *)v13 columns];
          [v25 addObject:v21];

          ++v20;
        }
        while (v18 != v20);
        uint64_t v18 = [v16 countByEnumeratingWithState:&v39 objects:v45 count:16];
      }
      while (v18);
    }

    v26 = [v12 children];
    v27 = (void *)[v26 copy];

    long long v37 = 0u;
    long long v38 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    id v28 = v27;
    uint64_t v29 = [v28 countByEnumeratingWithState:&v35 objects:v44 count:16];
    if (v29)
    {
      uint64_t v30 = v29;
      uint64_t v31 = *(void *)v36;
      do
      {
        uint64_t v32 = 0;
        do
        {
          if (*(void *)v36 != v31) {
            objc_enumerationMutation(v28);
          }
          -[TSDAbstractLayout addChild:](v13, "addChild:", *(void *)(*((void *)&v35 + 1) + 8 * v32++), (void)v35);
        }
        while (v30 != v32);
        uint64_t v30 = [v28 countByEnumeratingWithState:&v35 objects:v44 count:16];
      }
      while (v30);
    }

    v33 = [v12 columns];
    [v33 removeAllObjects];
  }
  return v13;
}

- (void)dealloc
{
  [(SXTextTangierFlowLayout *)self setColumns:0];
  v3.receiver = self;
  v3.super_class = (Class)SXTextTangierFlowLayout;
  [(TSDLayout *)&v3 dealloc];
}

- (unint64_t)characterPositionForPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  uint64_t v18 = *MEMORY[0x263EF8340];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v5 = [(SXTextTangierFlowLayout *)self columns];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        [v10 frameBounds];
        v19.double x = x;
        v19.double y = y;
        if (CGRectContainsPoint(v20, v19))
        {
          unint64_t v11 = objc_msgSend(v10, "charIndexForSelectionFromPoint:isTail:", 0, x, y);
          goto LABEL_11;
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
  unint64_t v11 = 0x7FFFFFFFFFFFFFFFLL;
LABEL_11:

  return v11;
}

- (CGPoint)pointForCharacterPosition:(unint64_t)a3
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  double v5 = *MEMORY[0x263F00148];
  double v6 = *(double *)(MEMORY[0x263F00148] + 8);
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  uint64_t v7 = [(SXTextTangierFlowLayout *)self columns];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v23;
    while (2)
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v23 != v10) {
          objc_enumerationMutation(v7);
        }
        unint64_t v12 = [*(id *)(*((void *)&v22 + 1) + 8 * i) range];
        if (v12 <= a3 && v12 + v13 >= a3 + 1)
        {
          long long v15 = (void *)MEMORY[0x263F7C720];
          long long v16 = objc_msgSend(MEMORY[0x263F7C790], "selectionWithRange:", a3, 1);
          uint64_t v17 = [(SXTextTangierFlowLayout *)self columns];
          [v15 rectForSelection:v16 withColumns:v17];
          double v5 = v18;
          double v6 = v19;

          goto LABEL_14;
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v22 objects:v26 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }
LABEL_14:

  double v20 = v5;
  double v21 = v6;
  result.double y = v21;
  result.double x = v20;
  return result;
}

- (CGPoint)capturedInfoPositionForAttachment
{
  double v2 = *MEMORY[0x263F00148];
  double v3 = *(double *)(MEMORY[0x263F00148] + 8);
  result.double y = v3;
  result.double x = v2;
  return result;
}

- (id)layoutGeometryFromInfo
{
  return 0;
}

- (BOOL)shouldDisplayGuides
{
  return 0;
}

- (BOOL)shouldProvideSizingGuides
{
  return 0;
}

- (id)columnMetricsForCharIndex:(unint64_t)a3 outRange:(_NSRange *)a4
{
  return 0;
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

- (TSDHint)nextTargetFirstChildHint
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

- (BOOL)isLastTarget
{
  return 1;
}

- (CGSize)currentSize
{
  double v2 = [(TSDAbstractLayout *)self geometry];
  [v2 size];
  double v4 = v3;
  double v6 = v5;

  double v7 = v4;
  double v8 = v6;
  result.double height = v8;
  result.double width = v7;
  return result;
}

- (CGPoint)position
{
  double v2 = [(TSDAbstractLayout *)self geometry];
  [v2 frame];
  double v4 = v3;
  double v6 = v5;

  double v7 = v4;
  double v8 = v6;
  result.double y = v8;
  result.double x = v7;
  return result;
}

- (CGPoint)anchorPoint
{
  double v2 = *MEMORY[0x263F00148];
  double v3 = *(double *)(MEMORY[0x263F00148] + 8);
  result.double y = v3;
  result.double x = v2;
  return result;
}

- (unsigned)autosizeFlags
{
  return 0;
}

- (unsigned)verticalAlignment
{
  return 0;
}

- (unsigned)naturalAlignment
{
  return 4;
}

- (int)naturalDirection
{
  return -1;
}

- (BOOL)wantsLineFragments
{
  return 1;
}

- (CGRect)targetRectForCanvasRect:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  [(TSDAbstractLayout *)self frameInRoot];
  double v8 = -v7;
  double v10 = -v9;
  CGFloat v11 = x;
  CGFloat v12 = y;
  CGFloat v13 = width;
  CGFloat v14 = height;
  return CGRectOffset(*(CGRect *)&v11, v8, v10);
}

- (TSDCanvas)canvas
{
  double v2 = [(TSDLayout *)self layoutController];
  double v3 = [v2 canvas];

  return (TSDCanvas *)v3;
}

- (id)layoutForInlineDrawable:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  double v5 = [(TSDAbstractLayout *)self children];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v15;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        objc_opt_class();
        double v10 = TSUDynamicCast();
        CGFloat v11 = v10;
        if (v10)
        {
          id v12 = [v10 info];

          if (v12 == v4)
          {

            goto LABEL_13;
          }
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }

  CGFloat v11 = objc_msgSend(objc_alloc((Class)objc_msgSend(v4, "layoutClass")), "initWithInfo:", v4);
  if (v11) {
    [(TSDAbstractLayout *)self addChild:v11];
  }
LABEL_13:
  [v11 updateChildrenFromInfo];

  return v11;
}

- (id)validatedLayoutForAnchoredDrawable:(id)a3
{
  double v3 = objc_msgSend(MEMORY[0x263F7C7F0], "currentHandler", a3);
  id v4 = [NSString stringWithUTF8String:"-[SXTextTangierFlowLayout validatedLayoutForAnchoredDrawable:]"];
  double v5 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/FeldsparServicesUI/Modules/silex/Silex/Text/Tangier/SXTextTangierFlowLayout.m"];
  [v3 handleFailureInFunction:v4 file:v5 lineNumber:270 description:@"Anchored attachments not supported in non-body text."];

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
  id v5 = a3;
  id v4 = [v5 parent];

  if (v4 != self) {
    [(TSDAbstractLayout *)self addChild:v5];
  }
  [v5 updateChildrenFromInfo];
}

- (id)currentAnchoredDrawableLayouts
{
  double v2 = [MEMORY[0x263F7C7F0] currentHandler];
  double v3 = [NSString stringWithUTF8String:"-[SXTextTangierFlowLayout currentAnchoredDrawableLayouts]"];
  id v4 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/FeldsparServicesUI/Modules/silex/Silex/Text/Tangier/SXTextTangierFlowLayout.m"];
  [v2 handleFailureInFunction:v3 file:v4 lineNumber:305 description:@"Anchored attachments not supported in flow text."];

  return 0;
}

- (double)maxAnchorY
{
  [(SXTextTangierFlowLayout *)self position];
  double v4 = v3;
  [(SXTextTangierFlowLayout *)self maxSize];
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

- (CGRect)maskRect
{
  double v2 = *MEMORY[0x263F001A0];
  double v3 = *(double *)(MEMORY[0x263F001A0] + 8);
  double v4 = *(double *)(MEMORY[0x263F001A0] + 16);
  double v5 = *(double *)(MEMORY[0x263F001A0] + 24);
  result.size.CGFloat height = v5;
  result.size.CGFloat width = v4;
  result.origin.CGFloat y = v3;
  result.origin.CGFloat x = v2;
  return result;
}

- (BOOL)isLayoutOffscreen
{
  double v2 = [(TSDLayout *)self layoutController];
  char v3 = [v2 isLayoutOffscreen];

  return v3;
}

- (BOOL)layoutIsValid
{
  return 1;
}

- (BOOL)allowsLastLineTruncation
{
  return 0;
}

- (unsigned)maxLineCount
{
  return 0;
}

- (BOOL)ignoresEquationAlignment
{
  return 0;
}

- (BOOL)shouldHyphenate
{
  return 1;
}

- (NSMutableArray)columns
{
  return self->_columns;
}

- (void)setColumns:(id)a3
{
}

- (void).cxx_destruct
{
}

@end