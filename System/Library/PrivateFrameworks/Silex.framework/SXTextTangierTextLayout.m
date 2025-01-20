@interface SXTextTangierTextLayout
- (BOOL)alwaysAllowWordSplit;
- (BOOL)drawableAttachment:(id)a3 withLayout:(id)a4 shouldPositionIterativelyInColumn:(id)a5;
- (BOOL)pushAscendersIntoColumn;
- (BOOL)shouldPositionAttachmentsIteratively;
- (CGSize)maxSize;
- (NSMutableSet)addedChildren;
- (__CFLocale)hyphenationLocale;
- (double)baselineForLastLine;
- (double)lineHeightGuessForFirstLine;
- (id)attachedLayoutsInLayout:(id)a3 anchored:(BOOL)a4;
- (id)currentAnchoredDrawableLayouts;
- (id)currentInlineDrawableLayouts;
- (id)layoutForInlineDrawable:(id)a3;
- (id)validatedLayoutForAnchoredDrawable:(id)a3;
- (id)validatedLayoutForAttachedDrawable:(id)a3;
- (unint64_t)iterativeAttachmentPositioningMaxPassCount;
- (void)addAttachmentLayout:(id)a3;
- (void)drawableAttachment:(id)a3 didFinalizePosition:(CGPoint)a4;
- (void)drawableAttachment:(id)a3 willStartNewIterationWithIndex:(unint64_t)a4;
- (void)invalidate;
- (void)invalidateTextLayout;
- (void)setAddedChildren:(id)a3;
- (void)startedIterativePositioningProcessForDrawableAttachment:(id)a3;
- (void)validate;
@end

@implementation SXTextTangierTextLayout

- (double)lineHeightGuessForFirstLine
{
  v3 = [(TSWPLayout *)self columns];
  v4 = [v3 firstObject];

  v5 = [(TSDLayout *)self info];
  v6 = [v5 characterStyleAtCharIndex:0 effectiveRange:0];

  v7 = [(TSDLayout *)self info];
  v8 = [v7 paragraphStyleAtCharIndex:0 effectiveRange:0];

  [v4 scaleTextPercent];
  FontForStyle = (const __CTFont *)TSWPFastCreateFontForStyle();
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  TSWPFontHeightInfoForFont((uint64_t *)&v16, FontForStyle);
  v10 = [v8 valueForProperty:85];
  long long v11 = v17;
  [v10 amount];
  double v13 = v12;
  long long v14 = v18;
  CFRelease(FontForStyle);

  return *(double *)&v14 + (*(double *)&v11 + *((double *)&v11 + 1)) * v13 + *((double *)&v14 + 1);
}

- (double)baselineForLastLine
{
  v3 = [(TSWPLayout *)self columns];
  v4 = [v3 objectAtIndex:0];

  v5 = [(TSDLayout *)self info];
  uint64_t v6 = [v5 length];

  if (v4) {
    objc_msgSend(v4, "lineMetricsAtCharIndex:allowEndOfLine:", v6 - 1, 1, (unsigned __int128)0, (unsigned __int128)0);
  }

  return 0.0;
}

- (BOOL)shouldPositionAttachmentsIteratively
{
  return 1;
}

- (unint64_t)iterativeAttachmentPositioningMaxPassCount
{
  return 10;
}

- (__CFLocale)hyphenationLocale
{
  v2 = [(TSDLayout *)self info];
  v3 = [v2 locale];

  return (__CFLocale *)v3;
}

- (id)currentInlineDrawableLayouts
{
  return [(SXTextTangierTextLayout *)self attachedLayoutsInLayout:self anchored:0];
}

- (id)currentAnchoredDrawableLayouts
{
  return [(SXTextTangierTextLayout *)self attachedLayoutsInLayout:self anchored:1];
}

- (id)validatedLayoutForAnchoredDrawable:(id)a3
{
  v3 = [(SXTextTangierTextLayout *)self validatedLayoutForAttachedDrawable:a3];
  return v3;
}

- (id)layoutForInlineDrawable:(id)a3
{
  v3 = [(SXTextTangierTextLayout *)self validatedLayoutForAttachedDrawable:a3];
  return v3;
}

- (void)addAttachmentLayout:(id)a3
{
  id v8 = a3;
  v4 = [v8 parent];

  if (v4 != self)
  {
    [(TSDAbstractLayout *)self addChild:v8];
    v5 = [(SXTextTangierTextLayout *)self addedChildren];

    if (!v5)
    {
      id v6 = objc_alloc_init(MEMORY[0x263EFF9C0]);
      [(SXTextTangierTextLayout *)self setAddedChildren:v6];
    }
    v7 = [(SXTextTangierTextLayout *)self addedChildren];
    [v7 addObject:v8];
  }
  [v8 updateChildrenFromInfo];
}

- (void)validate
{
  if (![(TSWPLayout *)self textLayoutValid])
  {
    v3.receiver = self;
    v3.super_class = (Class)SXTextTangierTextLayout;
    [(TSWPLayout *)&v3 validate];
  }
}

- (void)invalidate
{
  v2.receiver = self;
  v2.super_class = (Class)SXTextTangierTextLayout;
  [(TSDLayout *)&v2 invalidate];
}

- (void)invalidateTextLayout
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  v12.receiver = self;
  v12.super_class = (Class)SXTextTangierTextLayout;
  [(TSWPLayout *)&v12 invalidateTextLayout];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  objc_super v3 = [(SXTextTangierTextLayout *)self addedChildren];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v9;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v8 + 1) + 8 * v6++) removeFromParent];
      }
      while (v4 != v6);
      uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v13 count:16];
    }
    while (v4);
  }

  v7 = [(SXTextTangierTextLayout *)self addedChildren];
  [v7 removeAllObjects];
}

- (BOOL)alwaysAllowWordSplit
{
  return 1;
}

- (BOOL)pushAscendersIntoColumn
{
  return 1;
}

- (id)attachedLayoutsInLayout:(id)a3 anchored:(BOOL)a4
{
  int v4 = a4;
  uint64_t v21 = *MEMORY[0x263EF8340];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v15 = a3;
  uint64_t v5 = [v15 children];
  uint64_t v6 = 0;
  uint64_t v7 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(v5);
        }
        objc_opt_class();
        long long v10 = TSUDynamicCast();
        long long v11 = v10;
        if (v10)
        {
          objc_super v12 = [v10 info];
          double v13 = [v12 owningAttachment];

          if (v13
            && [v13 isDrawable]
            && [v13 isAnchored] == v4)
          {
            if (v6) {
              [v6 addObject:v11];
            }
            else {
              uint64_t v6 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithObjects:", v11, 0);
            }
          }
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v7);
  }

  return v6;
}

- (id)validatedLayoutForAttachedDrawable:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(TSDLayout *)self layoutController];
  uint64_t v6 = [v5 layoutForInfo:v4];

  if (!v6)
  {
    uint64_t v6 = (unsigned char *)objc_msgSend(objc_alloc((Class)objc_msgSend(v4, "layoutClass")), "initWithInfo:", v4);
    if (!v6) {
      goto LABEL_6;
    }
    [(SXTextTangierTextLayout *)self addAttachmentLayout:v6];
  }
  if ((v6[*MEMORY[0x263F7C7B0]] & 3) != 0)
  {
    uint64_t v7 = [(TSDLayout *)self layoutController];
    [v7 validateLayoutWithDependencies:v6];
  }
LABEL_6:

  return v6;
}

- (void)startedIterativePositioningProcessForDrawableAttachment:(id)a3
{
  id v6 = a3;
  objc_opt_class();
  objc_super v3 = [v6 drawable];
  id v4 = TSUDynamicCast();

  if (v4)
  {
    uint64_t v5 = [v4 exclusionPath];
    -[SXTextExclusionPath callStartBlock](v5);
  }
}

- (void)drawableAttachment:(id)a3 willStartNewIterationWithIndex:(unint64_t)a4
{
  id v13 = a3;
  objc_opt_class();
  uint64_t v5 = [v13 drawable];
  id v6 = TSUDynamicCast();

  if (v6)
  {
    objc_opt_class();
    uint64_t v7 = [(TSDLayout *)self layoutController];
    uint64_t v8 = [v7 layoutForInfo:v6];
    long long v9 = TSUDynamicCast();

    long long v10 = [v6 exclusionPath];
    [v9 frame];
    [(SXTextExclusionPath *)(uint64_t)v10 adjustYPositionWithCurrentPosition:v12];
  }
}

- (void)drawableAttachment:(id)a3 didFinalizePosition:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  id v11 = a3;
  objc_opt_class();
  id v6 = [v11 drawable];
  uint64_t v7 = TSUDynamicCast();

  if (v7)
  {
    uint64_t v8 = [v7 exclusionPath];
    [(SXTextExclusionPath *)(uint64_t)v8 setActualPosition:y];

    long long v9 = [v7 exclusionPath];
    [(SXTextExclusionPath *)v9 callCompletionBlock];
  }
}

- (BOOL)drawableAttachment:(id)a3 withLayout:(id)a4 shouldPositionIterativelyInColumn:(id)a5
{
  id v6 = a5;
  [a4 frame];
  double v8 = v7;
  [v6 frameBounds];
  LOBYTE(a4) = v8 <= v9 * 0.9;

  return (char)a4;
}

- (CGSize)maxSize
{
  double v2 = 1.79769313e308;
  double v3 = 1.79769313e308;
  result.height = v3;
  result.width = v2;
  return result;
}

- (NSMutableSet)addedChildren
{
  return self->_addedChildren;
}

- (void)setAddedChildren:(id)a3
{
}

- (void).cxx_destruct
{
}

@end