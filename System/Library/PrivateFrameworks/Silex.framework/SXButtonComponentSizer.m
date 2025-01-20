@interface SXButtonComponentSizer
- (SXButtonComponentSizer)initWithComponent:(id)a3 componentLayout:(id)a4 componentStyle:(id)a5 DOMObjectProvider:(id)a6 layoutOptions:(id)a7 textProvider:(id)a8 textComponentLayoutHosting:(id)a9 textSourceFactory:(id)a10;
- (SXTextLayouter)textLayouter;
- (UIEdgeInsets)contentInsetsWithUnitConverter:(id)a3;
- (UIEdgeInsets)layoutMarginsWithUnitConverter:(id)a3;
- (double)calculateHeightForWidth:(double)a3 layoutContext:(id)a4;
- (id)additionsForTextSource:(id)a3;
- (id)componentTextStyleForTextSource:(id)a3 inheritingFromDefaultStyles:(BOOL)a4;
- (id)contentSizeCategoryForTextSource:(id)a3;
- (id)defaultComponentTextStyleForTextSource:(id)a3;
- (id)defaultComponentTextStylesForTextSource:(id)a3;
- (id)inlineTextStylesForTextSource:(id)a3;
- (id)textResizerForTextSource:(id)a3;
- (id)textRulesForTextSource:(id)a3;
- (id)textStyleForIdentifier:(id)a3;
@end

@implementation SXButtonComponentSizer

- (SXButtonComponentSizer)initWithComponent:(id)a3 componentLayout:(id)a4 componentStyle:(id)a5 DOMObjectProvider:(id)a6 layoutOptions:(id)a7 textProvider:(id)a8 textComponentLayoutHosting:(id)a9 textSourceFactory:(id)a10
{
  id v16 = a3;
  id v17 = a8;
  id v18 = a9;
  id v19 = a10;
  v29.receiver = self;
  v29.super_class = (Class)SXButtonComponentSizer;
  v20 = [(SXComponentSizer *)&v29 initWithComponent:v16 componentLayout:a4 componentStyle:a5 DOMObjectProvider:a6 layoutOptions:a7];
  if (v20)
  {
    v21 = [v17 textForComponent:v16];
    v22 = [v19 createTextSourceWithString:v21 dataSource:v20];
    v23 = [SXTextLayouter alloc];
    v24 = [v18 documentRoot];
    uint64_t v25 = [(SXTextLayouter *)v23 initWithTextSource:v22 andDocumentRoot:v24];
    textLayouter = v20->_textLayouter;
    v20->_textLayouter = (SXTextLayouter *)v25;

    v27 = [(SXButtonComponentSizer *)v20 textLayouter];
    [(SXComponentSizer *)v20 saveInfo:v27 forRenderingPhaseWithIdentifier:@"TextLayouter"];
  }
  return v20;
}

- (double)calculateHeightForWidth:(double)a3 layoutContext:(id)a4
{
  v6 = [(SXButtonComponentSizer *)self textLayouter];
  [v6 reset];

  v7 = [(SXButtonComponentSizer *)self textLayouter];
  [v7 calculateHeightForWidth:a3];

  v8 = (void *)MEMORY[0x263F08D40];
  v9 = [(SXButtonComponentSizer *)self textLayouter];
  [v9 typographicBounds];
  v10 = objc_msgSend(v8, "valueWithCGRect:");
  [(SXComponentSizer *)self saveInfo:v10 forRenderingPhaseWithIdentifier:@"TypographicBounds"];

  v11 = [(SXButtonComponentSizer *)self textLayouter];
  [v11 typographicBounds];
  double v13 = v12;

  return v13;
}

- (UIEdgeInsets)contentInsetsWithUnitConverter:(id)a3
{
  id v4 = a3;
  v5 = [(SXComponentSizer *)self componentLayout];
  v6 = [v5 padding];

  if (v6)
  {
    v25.receiver = self;
    v25.super_class = (Class)SXButtonComponentSizer;
    [(SXComponentSizer *)&v25 contentInsetsWithUnitConverter:v4];
    double v8 = v7;
    double v10 = v9;
    double v12 = v11;
    double v14 = v13;
  }
  else
  {
    v26.receiver = self;
    v26.super_class = (Class)SXButtonComponentSizer;
    [(SXComponentSizer *)&v26 contentInsetsWithUnitConverter:v4];
    double v16 = v15;
    double v10 = v17;
    double v19 = v18;
    double v14 = v20;

    double v8 = v16 + 5.0;
    double v12 = v19 + 5.0;
  }
  double v21 = v8;
  double v22 = v10;
  double v23 = v12;
  double v24 = v14;
  result.right = v24;
  result.bottom = v23;
  result.left = v22;
  result.top = v21;
  return result;
}

- (UIEdgeInsets)layoutMarginsWithUnitConverter:(id)a3
{
  id v4 = a3;
  v50.receiver = self;
  v50.super_class = (Class)SXButtonComponentSizer;
  [(SXComponentSizer *)&v50 layoutMarginsWithUnitConverter:v4];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  double v13 = [(SXComponentSizer *)self componentLayout];
  double v14 = [v13 padding];

  if (v14)
  {
    uint64_t v15 = [v14 left];
    objc_msgSend(v4, "convertValueToPoints:", v15, v16);
    double v18 = v17;
    uint64_t v19 = [v14 top];
    objc_msgSend(v4, "convertValueToPoints:", v19, v20);
    uint64_t v21 = [v14 right];
    objc_msgSend(v4, "convertValueToPoints:", v21, v22);
    double v24 = v23;
    uint64_t v25 = [v14 bottom];
    objc_msgSend(v4, "convertValueToPoints:", v25, v26);
  }
  else
  {
    double v24 = 10.0;
    double v18 = 10.0;
  }
  v27 = [(SXButtonComponentSizer *)self textLayouter];
  v28 = [v27 wpStorage];

  objc_super v29 = [v28 paragraphStyleAtParIndex:0 effectiveRange:0];
  v30 = [(TSWPText *)[SXTextUtilities alloc] initWithParagraphStyle:v29];
  [(TSWPText *)v30 measureStorage:v28];
  double v32 = v31;
  objc_msgSend(v4, "convertValueToPoints:", 0x4059000000000000, 7);
  double v34 = v33 - v18 - v24 - v8 - v12;
  v35 = [(SXComponentSizer *)self componentLayout];
  [v35 maximumContentWidth];
  uint64_t v37 = v36;

  if (v37)
  {
    v38 = [(SXComponentSizer *)self componentLayout];
    uint64_t v39 = [v38 maximumContentWidth];
    objc_msgSend(v4, "convertValueToPoints:", v39, v40);
    double v42 = v41;

    if (v32 >= v42) {
      double v32 = v42;
    }
  }
  double v43 = v34 - v32;
  if (v34 - v32 > 0.0)
  {
    v44 = [(SXComponentSizer *)self componentLayout];
    uint64_t v45 = [v44 horizontalContentAlignment];

    if (v45 == 1)
    {
      double v12 = v34 - v32;
    }
    else if (v45 == 3)
    {
      double v8 = v34 - v32;
    }
    else
    {
      double v12 = v43 * 0.5;
      double v8 = v43 * 0.5;
    }
  }

  double v46 = v6;
  double v47 = v8;
  double v48 = v10;
  double v49 = v12;
  result.right = v49;
  result.bottom = v48;
  result.left = v47;
  result.top = v46;
  return result;
}

- (id)textResizerForTextSource:(id)a3
{
  v22[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  double v5 = [(SXComponentSizer *)self DOMObjectProvider];
  double v6 = SXDefaultTextStyleIdentifierForRole(@"body");
  v22[0] = v6;
  double v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v22 count:1];
  double v8 = [(SXComponentSizer *)self component];
  double v9 = [v5 componentTextStyleForIdentifiers:v7 component:v8];

  if (!v9)
  {
    double v10 = [(SXComponentSizer *)self DOMObjectProvider];
    uint64_t v21 = @"default";
    double v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v21 count:1];
    double v12 = [(SXComponentSizer *)self component];
    double v9 = [v10 componentTextStyleForIdentifiers:v11 component:v12];
  }
  char v13 = 1;
  double v14 = [(SXButtonComponentSizer *)self componentTextStyleForTextSource:v4 inheritingFromDefaultStyles:1];
  uint64_t v15 = v14;
  if (v14) {
    char v13 = [v14 fontScaling];
  }
  uint64_t v16 = [SXTextResizer alloc];
  double v17 = [(SXComponentSizer *)self layoutOptions];
  double v18 = [v17 columnLayout];
  uint64_t v19 = -[SXTextResizer initWithColumnLayout:defaultTextStyle:fontScalingEnabled:]((id *)&v16->super.isa, v18, v9, v13);

  return v19;
}

- (id)componentTextStyleForTextSource:(id)a3 inheritingFromDefaultStyles:(BOOL)a4
{
  BOOL v4 = a4;
  double v6 = objc_msgSend(MEMORY[0x263EFF980], "array", a3);
  if (v4)
  {
    double v7 = [(SXComponentSizer *)self component];
    double v8 = [v7 classification];
    double v9 = [v8 defaultTextStyleIdentifiers];

    if (v9)
    {
      double v10 = [(SXComponentSizer *)self component];
      double v11 = [v10 classification];
      double v12 = [v11 defaultTextStyleIdentifiers];
      [v6 addObjectsFromArray:v12];
    }
  }
  char v13 = [(SXComponentSizer *)self component];
  double v14 = [v13 textStyle];

  if (v14)
  {
    uint64_t v15 = [(SXComponentSizer *)self component];
    uint64_t v16 = [v15 textStyle];
    [v6 addObject:v16];
  }
  double v17 = [(SXComponentSizer *)self DOMObjectProvider];
  double v18 = [(SXComponentSizer *)self component];
  uint64_t v19 = [v17 componentTextStyleForIdentifiers:v6 component:v18];

  return v19;
}

- (id)defaultComponentTextStyleForTextSource:(id)a3
{
  BOOL v4 = [(SXComponentSizer *)self DOMObjectProvider];
  double v5 = (void *)MEMORY[0x263EFF8C0];
  double v6 = [(SXComponentSizer *)self component];
  double v7 = [v6 classification];
  double v8 = [v7 defaultTextStyleIdentifiers];
  double v9 = [v5 arrayWithArray:v8];
  double v10 = [(SXComponentSizer *)self component];
  double v11 = [v4 componentTextStyleForIdentifiers:v9 component:v10];

  return v11;
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
  double v5 = [v4 classification];
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
        double v12 = [(SXComponentSizer *)self DOMObjectProvider];
        uint64_t v22 = v11;
        char v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v22 count:1];
        double v14 = [(SXComponentSizer *)self component];
        uint64_t v15 = [v12 componentTextStyleForIdentifiers:v13 component:v14];

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
  return (id)MEMORY[0x263EFFA68];
}

- (id)additionsForTextSource:(id)a3
{
  v3 = [(SXComponentSizer *)self component];
  BOOL v4 = [v3 additions];
  double v5 = [v4 NSArray];

  return v5;
}

- (id)textRulesForTextSource:(id)a3
{
  v3 = [(SXComponentSizer *)self component];
  BOOL v4 = [v3 classification];
  double v5 = [v4 textRules];

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
  double v5 = [(SXComponentSizer *)self DOMObjectProvider];
  double v6 = [(SXComponentSizer *)self component];
  uint64_t v7 = [v5 textStyleForIdentifier:v4 component:v6];

  return v7;
}

- (SXTextLayouter)textLayouter
{
  return self->_textLayouter;
}

- (void).cxx_destruct
{
}

@end