@interface SXTextComponentSizer
- (SXTextComponentSizer)initWithComponent:(id)a3 componentLayout:(id)a4 componentStyle:(id)a5 DOMObjectProvider:(id)a6 layoutOptions:(id)a7 textComponentLayoutHosting:(id)a8 textSourceFactory:(id)a9;
- (SXTextLayouter)textLayouter;
- (SXTextResizer)textResizer;
- (double)calculateHeightForWidth:(double)a3 layoutContext:(id)a4;
- (double)verticalPositionForRange:(_NSRange)a3;
- (id)additionsForTextSource:(id)a3;
- (id)componentTextStyleForTextSource:(id)a3 inheritingFromDefaultStyles:(BOOL)a4;
- (id)contentSizeCategoryForTextSource:(id)a3;
- (id)defaultComponentTextStyleForTextSource:(id)a3;
- (id)defaultComponentTextStylesForTextSource:(id)a3;
- (id)existingExclusionPathForComponentWithIdentifier:(id)a3;
- (id)inlineTextStylesForTextSource:(id)a3;
- (id)snapLines;
- (id)textResizerForTextSource:(id)a3;
- (id)textRulesForTextSource:(id)a3;
- (id)textStyleForIdentifier:(id)a3;
- (unint64_t)stringLength;
- (void)addExclusionPath:(id)a3;
- (void)removeAllExclusionPaths;
- (void)setTextLayouter:(id)a3;
- (void)setTextResizer:(id)a3;
@end

@implementation SXTextComponentSizer

- (SXTextComponentSizer)initWithComponent:(id)a3 componentLayout:(id)a4 componentStyle:(id)a5 DOMObjectProvider:(id)a6 layoutOptions:(id)a7 textComponentLayoutHosting:(id)a8 textSourceFactory:(id)a9
{
  id v15 = a3;
  id v16 = a8;
  id v17 = a9;
  v27.receiver = self;
  v27.super_class = (Class)SXTextComponentSizer;
  v18 = [(SXComponentSizer *)&v27 initWithComponent:v15 componentLayout:a4 componentStyle:a5 DOMObjectProvider:a6 layoutOptions:a7];
  if (v18)
  {
    v19 = [v15 text];
    v20 = [v17 createTextSourceWithString:v19 dataSource:v18];

    v21 = [SXTextLayouter alloc];
    v22 = [v16 documentRoot];
    uint64_t v23 = [(SXTextLayouter *)v21 initWithTextSource:v20 andDocumentRoot:v22];
    textLayouter = v18->_textLayouter;
    v18->_textLayouter = (SXTextLayouter *)v23;

    v25 = [(SXTextComponentSizer *)v18 textLayouter];
    [(SXComponentSizer *)v18 saveInfo:v25 forRenderingPhaseWithIdentifier:@"TextLayouter"];
  }
  return v18;
}

- (void)addExclusionPath:(id)a3
{
  id v4 = a3;
  id v5 = [(SXTextComponentSizer *)self textLayouter];
  [v5 addExclusionPath:v4];
}

- (void)removeAllExclusionPaths
{
  id v2 = [(SXTextComponentSizer *)self textLayouter];
  [v2 removeAllExclusionPaths];
}

- (double)calculateHeightForWidth:(double)a3 layoutContext:(id)a4
{
  v6 = [(SXTextComponentSizer *)self textLayouter];
  [v6 reset];

  v7 = [(SXTextComponentSizer *)self textLayouter];
  [v7 calculateHeightForWidth:a3];
  double v9 = v8;

  return v9;
}

- (id)snapLines
{
  id v2 = [(SXTextComponentSizer *)self textLayouter];
  v3 = [v2 firstColumn];

  id v4 = [MEMORY[0x263EFF980] array];
  [v3 frameBounds];
  if (CGRectGetHeight(v17) > 100.0)
  {
    id v5 = [v3 storage];
    uint64_t v6 = [v3 range];
    unint64_t v8 = objc_msgSend(v5, "paragraphIndexRangeForCharRange:", v6, v7);
    if (v8 < v8 + v9)
    {
      unint64_t v10 = v8;
      uint64_t v11 = v9;
      do
      {
        uint64_t v12 = [v5 textRangeForParagraphAtIndex:v10];
        if (v13 >= 2)
        {
          [v3 topOfLineAtCharIndex:v12];
          v14 = objc_msgSend(NSNumber, "numberWithDouble:");
          [v4 addObject:v14];
        }
        ++v10;
        --v11;
      }
      while (v11);
    }
  }
  return v4;
}

- (double)verticalPositionForRange:(_NSRange)a3
{
  NSUInteger location = a3.location;
  id v4 = [(SXTextComponentSizer *)self textLayouter];
  id v5 = [v4 firstColumn];
  [v5 topOfLineAtCharIndex:location];
  double v7 = v6;

  return v7;
}

- (unint64_t)stringLength
{
  id v2 = [(SXTextComponentSizer *)self textLayouter];
  v3 = [v2 textSource];
  id v4 = [v3 string];
  unint64_t v5 = [v4 length];

  return v5;
}

- (id)existingExclusionPathForComponentWithIdentifier:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  unint64_t v5 = [(SXTextComponentSizer *)self textLayouter];
  double v6 = [v5 exclusionPaths];

  id v7 = (id)[v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v15;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v6);
        }
        unint64_t v10 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        uint64_t v11 = -[SXTangierTextRenderCollectorItem componentIdentifier]((uint64_t)v10);
        int v12 = [v11 isEqualToString:v4];

        if (v12)
        {
          id v7 = v10;
          goto LABEL_11;
        }
      }
      id v7 = (id)[v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v7;
}

- (id)textResizerForTextSource:(id)a3
{
  v26[1] = *MEMORY[0x263EF8340];
  id v4 = [(SXComponentSizer *)self DOMObjectProvider];
  unint64_t v5 = SXDefaultTextStyleIdentifierForRole(@"body");
  v26[0] = v5;
  double v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v26 count:1];
  id v7 = [(SXComponentSizer *)self component];
  uint64_t v8 = [v4 componentTextStyleForIdentifiers:v6 component:v7];

  if (!v8)
  {
    uint64_t v9 = [(SXComponentSizer *)self DOMObjectProvider];
    v25 = @"default";
    unint64_t v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v25 count:1];
    uint64_t v11 = [(SXComponentSizer *)self component];
    uint64_t v8 = [v9 componentTextStyleForIdentifiers:v10 component:v11];
  }
  int v12 = [(SXComponentSizer *)self DOMObjectProvider];
  unint64_t v13 = [(SXComponentSizer *)self component];
  long long v14 = [v13 textStyle];
  long long v15 = [(SXComponentSizer *)self component];
  long long v16 = [v15 classification];
  long long v17 = [(SXComponentSizer *)self component];
  v18 = [v12 componentTextStyleForIdentifier:v14 classification:v16 component:v17];

  if (v18) {
    char v19 = [v18 fontScaling];
  }
  else {
    char v19 = 1;
  }
  v20 = [SXTextResizer alloc];
  v21 = [(SXComponentSizer *)self layoutOptions];
  v22 = [v21 columnLayout];
  uint64_t v23 = -[SXTextResizer initWithColumnLayout:defaultTextStyle:fontScalingEnabled:]((id *)&v20->super.isa, v22, v8, v19);

  return v23;
}

- (id)componentTextStyleForTextSource:(id)a3 inheritingFromDefaultStyles:(BOOL)a4
{
  BOOL v4 = a4;
  double v6 = objc_msgSend(MEMORY[0x263EFF980], "array", a3);
  if (v4)
  {
    id v7 = [(SXComponentSizer *)self component];
    uint64_t v8 = [v7 classification];
    uint64_t v9 = [v8 defaultTextStyleIdentifiers];
    [v6 addObjectsFromArray:v9];
  }
  unint64_t v10 = [(SXComponentSizer *)self component];
  uint64_t v11 = [v10 textStyle];

  if (v11)
  {
    int v12 = [(SXComponentSizer *)self component];
    unint64_t v13 = [v12 textStyle];
    [v6 addObject:v13];
  }
  long long v14 = [(SXComponentSizer *)self DOMObjectProvider];
  long long v15 = [(SXComponentSizer *)self component];
  long long v16 = [v14 componentTextStyleForIdentifiers:v6 component:v15];

  return v16;
}

- (id)defaultComponentTextStyleForTextSource:(id)a3
{
  BOOL v4 = [(SXComponentSizer *)self DOMObjectProvider];
  unint64_t v5 = [(SXComponentSizer *)self component];
  double v6 = [v5 classification];
  id v7 = [v6 defaultTextStyleIdentifiers];
  uint64_t v8 = [(SXComponentSizer *)self component];
  uint64_t v9 = [v4 componentTextStyleForIdentifiers:v7 component:v8];

  return v9;
}

- (id)defaultComponentTextStylesForTextSource:(id)a3
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  objc_msgSend(MEMORY[0x263EFF980], "array", a3);
  id v17 = (id)objc_claimAutoreleasedReturnValue();
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  BOOL v4 = [(SXComponentSizer *)self component];
  unint64_t v5 = [v4 classification];
  double v6 = [v5 defaultTextStyleIdentifiers];

  uint64_t v7 = [v6 countByEnumeratingWithState:&v18 objects:v23 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v19 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v18 + 1) + 8 * i);
        int v12 = [(SXComponentSizer *)self DOMObjectProvider];
        uint64_t v22 = v11;
        unint64_t v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v22 count:1];
        long long v14 = [(SXComponentSizer *)self component];
        long long v15 = [v12 componentTextStyleForIdentifiers:v13 component:v14];

        if (v15) {
          [v17 addObject:v15];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v18 objects:v23 count:16];
    }
    while (v8);
  }

  return v17;
}

- (id)inlineTextStylesForTextSource:(id)a3
{
  v3 = [(SXComponentSizer *)self component];
  BOOL v4 = [v3 inlineTextStyles];

  return v4;
}

- (id)additionsForTextSource:(id)a3
{
  v3 = [(SXComponentSizer *)self component];
  BOOL v4 = [v3 additions];
  unint64_t v5 = [v4 NSArray];

  return v5;
}

- (id)textRulesForTextSource:(id)a3
{
  v3 = [(SXComponentSizer *)self component];
  BOOL v4 = [v3 classification];
  unint64_t v5 = [v4 textRules];

  return v5;
}

- (id)contentSizeCategoryForTextSource:(id)a3
{
  v3 = [(SXComponentSizer *)self layoutOptions];
  BOOL v4 = [v3 contentSizeCategory];

  return v4;
}

- (id)textStyleForIdentifier:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(SXComponentSizer *)self DOMObjectProvider];
  double v6 = [(SXComponentSizer *)self component];
  uint64_t v7 = [v5 textStyleForIdentifier:v4 component:v6];

  return v7;
}

- (SXTextResizer)textResizer
{
  return self->_textResizer;
}

- (void)setTextResizer:(id)a3
{
}

- (SXTextLayouter)textLayouter
{
  return self->_textLayouter;
}

- (void)setTextLayouter:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textLayouter, 0);
  objc_storeStrong((id *)&self->_textResizer, 0);
}

@end