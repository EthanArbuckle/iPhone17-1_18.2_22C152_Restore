@interface SXComponentSizer
- (BOOL)allowComponentIntersection;
- (BOOL)requiresSizeChangeForStateChange:(id)a3 fromState:(id)a4;
- (CGSize)suggestedSize;
- (NSMutableDictionary)infoForRendering;
- (SXComponent)component;
- (SXComponentLayout)componentLayout;
- (SXComponentSizer)initWithComponent:(id)a3 componentLayout:(id)a4 componentStyle:(id)a5 DOMObjectProvider:(id)a6 layoutOptions:(id)a7;
- (SXComponentState)componentState;
- (SXComponentStyle)componentStyle;
- (SXDOMObjectProviding)DOMObjectProvider;
- (SXLayoutOptions)layoutOptions;
- (UIEdgeInsets)bordersInsetsWithUnitConverter:(id)a3;
- (UIEdgeInsets)contentInsetsWithUnitConverter:(id)a3;
- (_NSRange)overrideColumnLayoutForColumnRange:(_NSRange)a3 inColumnLayout:(id)a4;
- (double)calculateHeightForWidth:(double)a3 layoutContext:(id)a4;
- (id)snapLines;
- (int64_t)minimumColumnLength;
- (unint64_t)shouldIgnoreMarginsForColumnLayout:(id)a3;
- (unint64_t)shouldIgnoreViewportPaddingForColumnLayout:(id)a3;
- (void)saveInfo:(id)a3 forRenderingPhaseWithIdentifier:(id)a4;
- (void)setComponentState:(id)a3;
- (void)setSuggestedSize:(CGSize)a3;
@end

@implementation SXComponentSizer

- (SXComponentSizer)initWithComponent:(id)a3 componentLayout:(id)a4 componentStyle:(id)a5 DOMObjectProvider:(id)a6 layoutOptions:(id)a7
{
  id v22 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v23.receiver = self;
  v23.super_class = (Class)SXComponentSizer;
  v17 = [(SXComponentSizer *)&v23 init];
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_component, a3);
    objc_storeStrong((id *)&v18->_componentLayout, a4);
    objc_storeStrong((id *)&v18->_componentStyle, a5);
    objc_storeStrong((id *)&v18->_DOMObjectProvider, a6);
    uint64_t v19 = [MEMORY[0x263EFF9A0] dictionary];
    infoForRendering = v18->_infoForRendering;
    v18->_infoForRendering = (NSMutableDictionary *)v19;

    objc_storeStrong((id *)&v18->_layoutOptions, a7);
  }

  return v18;
}

- (double)calculateHeightForWidth:(double)a3 layoutContext:(id)a4
{
  return 0.0;
}

- (id)snapLines
{
  return (id)MEMORY[0x263EFFA68];
}

- (BOOL)allowComponentIntersection
{
  v2 = [(SXComponentSizer *)self component];
  v3 = [v2 classification];
  v4 = [v3 layoutRules];
  char v5 = [v4 allowsIntersection];

  return v5;
}

- (unint64_t)shouldIgnoreMarginsForColumnLayout:(id)a3
{
  v3 = [(SXComponentSizer *)self componentLayout];
  unint64_t v4 = [v3 ignoreDocumentMargin];

  return v4;
}

- (unint64_t)shouldIgnoreViewportPaddingForColumnLayout:(id)a3
{
  v3 = [(SXComponentSizer *)self componentLayout];
  unint64_t v4 = [v3 ignoreViewportPadding];

  return v4;
}

- (_NSRange)overrideColumnLayoutForColumnRange:(_NSRange)a3 inColumnLayout:(id)a4
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (int64_t)minimumColumnLength
{
  v2 = [(SXComponentSizer *)self component];
  v3 = [v2 classification];
  unint64_t v4 = [v3 layoutRules];
  int64_t v5 = [v4 minimumColumnSpan];

  return v5;
}

- (UIEdgeInsets)contentInsetsWithUnitConverter:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "convertValueToPoints:", 0x4049000000000000, 6);
  double v6 = v5;
  v7 = [(SXComponentSizer *)self componentLayout];
  char v8 = [v7 contentInset];

  double v9 = v6;
  double v10 = v6;
  double v11 = v6;
  if ((v8 & 1) == 0)
  {
    double v11 = *MEMORY[0x263F1D1C0];
    double v10 = *(double *)(MEMORY[0x263F1D1C0] + 8);
    double v9 = *(double *)(MEMORY[0x263F1D1C0] + 16);
    double v12 = *(double *)(MEMORY[0x263F1D1C0] + 24);
    id v13 = [(SXComponentSizer *)self componentLayout];
    __int16 v14 = [v13 contentInset];

    if ((v14 & 0x100) != 0) {
      double v10 = v6;
    }
    id v15 = [(SXComponentSizer *)self componentLayout];
    int v16 = [v15 contentInset];

    if ((*(void *)&v16 & 0x10000) != 0) {
      double v11 = v6;
    }
    v17 = [(SXComponentSizer *)self componentLayout];
    int v18 = [v17 contentInset];

    if ((v18 & 0x1000000) != 0) {
      double v12 = v6;
    }
    uint64_t v19 = [(SXComponentSizer *)self componentLayout];
    uint64_t v20 = [v19 contentInset];

    if ((v20 & 0x100000000) != 0) {
      double v9 = v6;
    }
    double v6 = v12;
  }
  v21 = [(SXComponentSizer *)self componentLayout];
  id v22 = [v21 padding];

  uint64_t v23 = [v22 left];
  objc_msgSend(v4, "convertValueToPoints:", v23, v24);
  if (v10 >= v25) {
    double v26 = v10;
  }
  else {
    double v26 = v25;
  }
  uint64_t v27 = [v22 top];
  objc_msgSend(v4, "convertValueToPoints:", v27, v28);
  if (v11 >= v29) {
    double v30 = v11;
  }
  else {
    double v30 = v29;
  }
  uint64_t v31 = [v22 right];
  objc_msgSend(v4, "convertValueToPoints:", v31, v32);
  if (v6 >= v33) {
    double v34 = v6;
  }
  else {
    double v34 = v33;
  }
  uint64_t v35 = [v22 bottom];
  objc_msgSend(v4, "convertValueToPoints:", v35, v36);
  if (v9 >= v37) {
    double v38 = v9;
  }
  else {
    double v38 = v37;
  }
  [(SXComponentSizer *)self layoutMarginsWithUnitConverter:v4];
  double v40 = v39;
  double v42 = v41;
  double v44 = v43;
  double v46 = v45;

  double v47 = v30 + v40;
  double v48 = v26 + v42;
  double v49 = v38 + v44;
  double v50 = v34 + v46;
  result.right = v50;
  result.bottom = v49;
  result.left = v48;
  result.top = v47;
  return result;
}

- (UIEdgeInsets)bordersInsetsWithUnitConverter:(id)a3
{
  id v4 = a3;
  double v5 = [(SXComponentSizer *)self componentStyle];
  double v6 = [v5 border];

  if (v6)
  {
    v7 = [v6 all];
    uint64_t v8 = [v7 width];
    objc_msgSend(v4, "convertValueToPoints:", v8, v9);
    double v11 = v10;

    double v12 = [v6 top];

    double v13 = v11;
    if (v12)
    {
      __int16 v14 = [v6 top];
      uint64_t v15 = [v14 width];
      objc_msgSend(v4, "convertValueToPoints:", v15, v16);
      double v13 = v17;
    }
    int v18 = [v6 right];

    double v19 = v11;
    if (v18)
    {
      uint64_t v20 = [v6 right];
      uint64_t v21 = [v20 width];
      objc_msgSend(v4, "convertValueToPoints:", v21, v22);
      double v19 = v23;
    }
    uint64_t v24 = [v6 bottom];

    double v25 = v11;
    if (v24)
    {
      double v26 = [v6 bottom];
      uint64_t v27 = [v26 width];
      objc_msgSend(v4, "convertValueToPoints:", v27, v28);
      double v25 = v29;
    }
    double v30 = [v6 left];

    if (v30)
    {
      uint64_t v31 = [v6 left];
      uint64_t v32 = [v31 width];
      objc_msgSend(v4, "convertValueToPoints:", v32, v33);
      double v11 = v34;
    }
  }
  else
  {
    double v13 = *MEMORY[0x263F1D1C0];
    double v11 = *(double *)(MEMORY[0x263F1D1C0] + 8);
    double v25 = *(double *)(MEMORY[0x263F1D1C0] + 16);
    double v19 = *(double *)(MEMORY[0x263F1D1C0] + 24);
  }

  double v35 = v13;
  double v36 = v11;
  double v37 = v25;
  double v38 = v19;
  result.right = v38;
  result.bottom = v37;
  result.left = v36;
  result.top = v35;
  return result;
}

- (BOOL)requiresSizeChangeForStateChange:(id)a3 fromState:(id)a4
{
  return 0;
}

- (void)saveInfo:(id)a3 forRenderingPhaseWithIdentifier:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(SXComponentSizer *)self infoForRendering];
  [v8 setObject:v7 forKey:v6];
}

- (SXComponent)component
{
  return self->_component;
}

- (SXComponentLayout)componentLayout
{
  return self->_componentLayout;
}

- (SXComponentStyle)componentStyle
{
  return self->_componentStyle;
}

- (SXDOMObjectProviding)DOMObjectProvider
{
  return self->_DOMObjectProvider;
}

- (SXComponentState)componentState
{
  return self->_componentState;
}

- (void)setComponentState:(id)a3
{
}

- (CGSize)suggestedSize
{
  double width = self->_suggestedSize.width;
  double height = self->_suggestedSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setSuggestedSize:(CGSize)a3
{
  self->_suggestedSize = a3;
}

- (SXLayoutOptions)layoutOptions
{
  return self->_layoutOptions;
}

- (NSMutableDictionary)infoForRendering
{
  return self->_infoForRendering;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_infoForRendering, 0);
  objc_storeStrong((id *)&self->_layoutOptions, 0);
  objc_storeStrong((id *)&self->_componentState, 0);
  objc_storeStrong((id *)&self->_DOMObjectProvider, 0);
  objc_storeStrong((id *)&self->_componentStyle, 0);
  objc_storeStrong((id *)&self->_componentLayout, 0);
  objc_storeStrong((id *)&self->_component, 0);
}

@end