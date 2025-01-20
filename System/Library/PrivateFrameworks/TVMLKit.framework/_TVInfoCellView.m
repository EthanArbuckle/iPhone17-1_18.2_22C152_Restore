@interface _TVInfoCellView
+ (id)infoCellViewWithElement:(id)a3 existingView:(id)a4;
- (BOOL)headerOnLeading;
- (CGSize)sizeThatFits:(CGSize)a3;
- (CGSize)sizeThatFits:(CGSize)a3 withHeaderWidth:(double)a4;
- (NSArray)dataViews;
- (UIEdgeInsets)headerMargin;
- (UIView)headerContentView;
- (double)headerMaxWidth;
- (double)headerMinWidth;
- (double)headerWidth;
- (double)minimumHeaderWidth;
- (double)normalizedHeaderWidth;
- (id)impressionableElementsContainedInDocument:(id)a3;
- (void)layoutSubviews;
- (void)setDataViews:(id)a3;
- (void)setHeaderContentView:(id)a3;
- (void)setHeaderMargin:(UIEdgeInsets)a3;
- (void)setHeaderMaxWidth:(double)a3;
- (void)setHeaderMinWidth:(double)a3;
- (void)setHeaderOnLeading:(BOOL)a3;
- (void)setHeaderWidth:(double)a3;
- (void)setNormalizedHeaderWidth:(double)a3;
@end

@implementation _TVInfoCellView

+ (id)infoCellViewWithElement:(id)a3 existingView:(id)a4
{
  uint64_t v74 = *MEMORY[0x263EF8340];
  id v51 = a3;
  id v5 = a4;
  objc_opt_class();
  id v53 = v5;
  if (objc_opt_isKindOfClass())
  {
    v6 = (_TVInfoCellView *)v5;
  }
  else
  {
    v7 = [_TVInfoCellView alloc];
    v6 = -[_TVInfoCellView initWithFrame:](v7, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  }
  v8 = v6;
  -[_TVInfoCellView setSemanticContentAttribute:](v6, "setSemanticContentAttribute:", objc_msgSend(v51, "tv_semanticContentAttribute"));
  id v54 = objc_alloc_init(MEMORY[0x263EFF980]);
  id v50 = objc_alloc_init(MEMORY[0x263EFF980]);
  v52 = [MEMORY[0x263F08708] whitespaceAndNewlineCharacterSet];
  obuint64_t j = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v67 = 0u;
  long long v68 = 0u;
  long long v69 = 0u;
  long long v70 = 0u;
  v9 = [(_TVInfoCellView *)v8 layoutGuides];
  uint64_t v10 = [v9 countByEnumeratingWithState:&v67 objects:v73 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v68;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v68 != v12) {
          objc_enumerationMutation(v9);
        }
        v14 = *(void **)(*((void *)&v67 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v15 = [v14 identifier];
          int v16 = [v15 isEqual:@"_TVInfoViewFocusGuide"];

          if (v16) {
            [obj addObject:v14];
          }
        }
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v67 objects:v73 count:16];
    }
    while (v11);
  }

  long long v65 = 0u;
  long long v66 = 0u;
  long long v63 = 0u;
  long long v64 = 0u;
  id v17 = obj;
  uint64_t v18 = [v17 countByEnumeratingWithState:&v63 objects:v72 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v20 = *(void *)v64;
    do
    {
      for (uint64_t j = 0; j != v19; ++j)
      {
        if (*(void *)v64 != v20) {
          objc_enumerationMutation(v17);
        }
        [(_TVInfoCellView *)v8 removeLayoutGuide:*(void *)(*((void *)&v63 + 1) + 8 * j)];
      }
      uint64_t v19 = [v17 countByEnumeratingWithState:&v63 objects:v72 count:16];
    }
    while (v19);
  }
  v49 = v17;

  long long v61 = 0u;
  long long v62 = 0u;
  long long v59 = 0u;
  long long v60 = 0u;
  id obja = [v51 children];
  uint64_t v22 = [obja countByEnumeratingWithState:&v59 objects:v71 count:16];
  v23 = v53;
  if (v22)
  {
    uint64_t v24 = v22;
    uint64_t v25 = *(void *)v60;
    unint64_t v26 = 0x264BA5000uLL;
    do
    {
      uint64_t v27 = 0;
      uint64_t v55 = v24;
      do
      {
        if (*(void *)v60 != v25) {
          objc_enumerationMutation(obja);
        }
        v28 = *(void **)(*((void *)&v59 + 1) + 8 * v27);
        if (objc_msgSend(v28, "tv_elementType") == 15)
        {
          v29 = [v28 children];
          v30 = [v29 firstObject];

          v31 = [*(id *)(v26 + 2784) sharedInterfaceFactory];
          v32 = [(_TVInfoCellView *)v8 headerContentView];
          v33 = [v31 _viewFromElement:v30 existingView:v32];

          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0 && [v33 numberOfLines] != 1)
          {
            __int16 v58 = 173;
            v34 = (void *)[v52 mutableCopy];
            v35 = [NSString stringWithCharacters:&v58 length:1];
            [v34 addCharactersInString:v35];

            v36 = [v33 attributedText];
            v37 = [v36 string];
            v38 = [v37 componentsSeparatedByCharactersInSet:v34];

            if ((unint64_t)[v38 count] <= 1) {
              [v33 setNumberOfLines:1];
            }

            v23 = v53;
          }
          [(_TVInfoCellView *)v8 setHeaderContentView:v33];
          v39 = [v28 style];
          objc_msgSend(v39, "tv_width");
          -[_TVInfoCellView setHeaderWidth:](v8, "setHeaderWidth:");

          v40 = [v28 style];
          objc_msgSend(v40, "tv_maxWidth");
          -[_TVInfoCellView setHeaderMaxWidth:](v8, "setHeaderMaxWidth:");

          v41 = [v28 style];
          objc_msgSend(v41, "tv_minWidth");
          -[_TVInfoCellView setHeaderMinWidth:](v8, "setHeaderMinWidth:");

          v42 = [v28 style];
          objc_msgSend(v42, "tv_margin");
          -[_TVInfoCellView setHeaderMargin:](v8, "setHeaderMargin:");

          unint64_t v26 = 0x264BA5000;
          uint64_t v24 = v55;
        }
        else
        {
          v43 = [*(id *)(v26 + 2784) sharedInterfaceFactory];
          v30 = [v43 _viewFromElement:v28 existingView:v23];

          if (v30) {
            [v54 addObject:v30];
          }
        }

        ++v27;
      }
      while (v24 != v27);
      uint64_t v24 = [obja countByEnumeratingWithState:&v59 objects:v71 count:16];
    }
    while (v24);
  }

  [(_TVInfoCellView *)v8 setDataViews:v54];
  if ([v50 count]) {
    [MEMORY[0x263F08938] activateConstraints:v50];
  }
  id v44 = v51;
  v45 = v44;
  while (1)
  {
    v46 = [v45 parent];

    if (!v46) {
      break;
    }
    v47 = [v45 parent];

    if (objc_msgSend(v47, "tv_elementType") == 19) {
      goto LABEL_45;
    }
    v45 = v47;
    if (objc_msgSend(v47, "tv_elementType") == 20)
    {
      [(_TVInfoCellView *)v8 setHeaderOnLeading:1];
      goto LABEL_45;
    }
  }
  v47 = v45;
LABEL_45:

  return v8;
}

- (double)minimumHeaderWidth
{
  [(_TVInfoCellView *)self headerWidth];
  if (v3 <= 0.0)
  {
    [(_TVInfoCellView *)self headerMaxWidth];
    double v6 = v5;
    [(_TVInfoCellView *)self headerMinWidth];
    double v8 = v7;
    [(UIView *)self->_headerContentView tv_margin];
    double v10 = v9;
    double v12 = v11;
    [(UIView *)self->_headerContentView tv_sizeThatFits:fmax(v6 - v9 - v11, 0.0)];
    return fmax(v8, v12 + v10 + v13);
  }
  else
  {
    [(_TVInfoCellView *)self headerWidth];
  }
  return result;
}

- (void)setHeaderContentView:(id)a3
{
  double v5 = (UIView *)a3;
  headerContentView = self->_headerContentView;
  double v7 = v5;
  if (headerContentView != v5)
  {
    [(UIView *)headerContentView removeFromSuperview];
    objc_storeStrong((id *)&self->_headerContentView, a3);
    if (self->_headerContentView) {
      -[_TVInfoCellView addSubview:](self, "addSubview:");
    }
  }
  [(_TVInfoCellView *)self setNeedsLayout];
}

- (void)setDataViews:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v5 = a3;
  p_dataViews = &self->_dataViews;
  if (![(NSArray *)self->_dataViews isEqualToArray:v5])
  {
    [(NSArray *)*p_dataViews makeObjectsPerformSelector:sel_removeFromSuperview];
    objc_storeStrong((id *)&self->_dataViews, a3);
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    double v7 = *p_dataViews;
    uint64_t v8 = [(NSArray *)v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v13;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v13 != v10) {
            objc_enumerationMutation(v7);
          }
          -[_TVInfoCellView addSubview:](self, "addSubview:", *(void *)(*((void *)&v12 + 1) + 8 * v11++), (void)v12);
        }
        while (v9 != v11);
        uint64_t v9 = [(NSArray *)v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v9);
    }
  }
  [(_TVInfoCellView *)self setNeedsLayout];
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  [(_TVInfoCellView *)self normalizedHeaderWidth];
  -[_TVInfoCellView sizeThatFits:withHeaderWidth:](self, "sizeThatFits:withHeaderWidth:", width, height, v6);
  result.double height = v8;
  result.double width = v7;
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3 withHeaderWidth:(double)a4
{
  double height = a3.height;
  double width = a3.width;
  [(UIView *)self tv_lineSpacing];
  uint64_t v9 = v8;
  [(UIView *)self->_headerContentView tv_margin];
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;
  if (a4 <= 0.0)
  {
    [(_TVInfoCellView *)self headerWidth];
    a4 = v18;
  }
  headerContentView = self->_headerContentView;
  if (self->_headerOnLeading)
  {
    -[UIView sizeThatFits:](headerContentView, "sizeThatFits:", a4 - v13 - v17, 0.0);
    double v21 = v20;
    double v22 = width - a4;
    double bottom = self->_headerMargin.bottom;
    double top = self->_headerMargin.top;
    double v25 = v22 - self->_headerMargin.right - self->_headerMargin.left;
    uint64_t v40 = 0;
    v41 = (double *)&v40;
    uint64_t v42 = 0x2020000000;
    CGFloat v43 = 0.0;
    uint64_t v36 = 0;
    v37 = &v36;
    uint64_t v38 = 0x2020000000;
    uint64_t v39 = 0;
    dataViews = self->_dataViews;
    v35[0] = MEMORY[0x263EF8330];
    v35[1] = 3221225472;
    v35[2] = __48___TVInfoCellView_sizeThatFits_withHeaderWidth___block_invoke;
    v35[3] = &unk_264BA7D10;
    *(double *)&v35[6] = v25;
    v35[7] = 0;
    v35[4] = &v40;
    v35[5] = &v36;
    v35[8] = v9;
    [(NSArray *)dataViews enumerateObjectsUsingBlock:v35];
    double v27 = fmax(bottom + top + v15 + v11 + v21, v41[3]);
  }
  else
  {
    -[UIView sizeThatFits:](headerContentView, "sizeThatFits:", width - self->_headerMargin.left - self->_headerMargin.right - v13 - v17, 0.0);
    CGFloat v29 = self->_headerMargin.top + v15 + v11 + v28;
    uint64_t v40 = 0;
    v41 = (double *)&v40;
    uint64_t v42 = 0x2020000000;
    CGFloat v43 = v29;
    uint64_t v36 = 0;
    v37 = &v36;
    uint64_t v38 = 0x2020000000;
    uint64_t v39 = 0;
    v30 = self->_dataViews;
    v34[0] = MEMORY[0x263EF8330];
    v34[1] = 3221225472;
    v34[2] = __48___TVInfoCellView_sizeThatFits_withHeaderWidth___block_invoke_2;
    v34[3] = &unk_264BA7D38;
    *(double *)&v34[7] = width;
    *(double *)&v34[8] = height;
    v34[4] = self;
    v34[5] = &v40;
    v34[6] = &v36;
    v34[9] = v9;
    [(NSArray *)v30 enumerateObjectsUsingBlock:v34];
    double v27 = v41[3];
  }
  _Block_object_dispose(&v36, 8);
  _Block_object_dispose(&v40, 8);
  double v31 = fmin(v27, height);
  if (height <= 0.0) {
    double v32 = v27;
  }
  else {
    double v32 = v31;
  }
  double v33 = width;
  result.double height = v32;
  result.double width = v33;
  return result;
}

- (void)layoutSubviews
{
  v49.receiver = self;
  v49.super_class = (Class)_TVInfoCellView;
  [(_TVInfoCellView *)&v49 layoutSubviews];
  [(_TVInfoCellView *)self bounds];
  double Width = CGRectGetWidth(v50);
  [(_TVInfoCellView *)self bounds];
  CGFloat Height = CGRectGetHeight(v51);
  [(UIView *)self tv_lineSpacing];
  uint64_t v5 = v4;
  [(UIView *)self->_headerContentView tv_margin];
  double v7 = v6;
  double v9 = v8;
  double v43 = v10;
  double v12 = v11;
  int64_t v13 = [(UIView *)self->_headerContentView tv_alignment];
  if (self->_headerOnLeading)
  {
    [(_TVInfoCellView *)self normalizedHeaderWidth];
    if (v14 <= 0.0) {
      [(_TVInfoCellView *)self headerWidth];
    }
    else {
      [(_TVInfoCellView *)self normalizedHeaderWidth];
    }
    double v16 = v15;
  }
  else
  {
    double v16 = Width - self->_headerMargin.left - self->_headerMargin.right;
  }
  -[UIView sizeThatFits:](self->_headerContentView, "sizeThatFits:", v16 - v9 - v12, 0.0);
  double v18 = v17;
  double v20 = v19;
  uint64_t v21 = [(_TVInfoCellView *)self effectiveUserInterfaceLayoutDirection];
  BOOL v22 = v21 == 1;
  p_headerMargin = &self->_headerMargin;
  p_left = &self->_headerMargin.left;
  if (v21 == 1) {
    p_right = &self->_headerMargin.right;
  }
  else {
    p_right = &self->_headerMargin.left;
  }
  if (v21 == 1) {
    double v26 = v9;
  }
  else {
    double v26 = v12;
  }
  if (v21 == 1) {
    double v27 = v12;
  }
  else {
    double v27 = v9;
  }
  if (v21 != 1) {
    p_left = &self->_headerMargin.right;
  }
  double v28 = *p_right;
  double v29 = *p_left;
  if (v13)
  {
    double top = p_headerMargin->top;
    if (v13 == 3)
    {
      double v31 = v16 + v27 + v28 - v26 - v18;
    }
    else if (v13 == 1)
    {
      double v31 = v27 + v28;
    }
    else
    {
      float v32 = (v16 - v18 - v27 - v26) * 0.5;
      double v31 = v27 + v28 + floorf(v32);
    }
  }
  else
  {
    double v31 = v27 + v28;
    double top = p_headerMargin->top;
  }
  double v33 = v7 + top;
  headerContentView = self->_headerContentView;
  double v35 = v18;
  double v36 = v20;
  CGRect v52 = CGRectIntegral(*(CGRect *)&v31);
  -[UIView setFrame:](headerContentView, "setFrame:", v52.origin.x, v52.origin.y, v52.size.width, v52.size.height);
  BOOL headerOnLeading = self->_headerOnLeading;
  double v38 = v28 + v16 + v29;
  double v39 = 0.0;
  if (self->_headerOnLeading) {
    double v40 = v28 + v16 + v29;
  }
  else {
    double v40 = 0.0;
  }
  v48[0] = 0;
  v48[1] = v48;
  v48[2] = 0x2020000000;
  CGFloat bottom = 0.0;
  if (!headerOnLeading)
  {
    double v39 = v43 + v7 + v20 + p_headerMargin->top;
    CGFloat bottom = self->_headerMargin.bottom;
    double v38 = 0.0;
  }
  *(double *)&v48[3] = v39;
  v47[0] = 0;
  v47[1] = v47;
  v47[2] = 0x2020000000;
  v47[3] = 0;
  dataViews = self->_dataViews;
  v45[0] = MEMORY[0x263EF8330];
  v45[1] = 3221225472;
  v45[2] = __33___TVInfoCellView_layoutSubviews__block_invoke;
  v45[3] = &unk_264BA7D60;
  BOOL v46 = v22;
  v45[5] = v48;
  v45[6] = v47;
  *(CGFloat *)&v45[7] = bottom;
  v45[8] = v5;
  *(double *)&v45[9] = Width - v38;
  v45[10] = 0;
  v45[4] = self;
  *(double *)&v45[11] = v40;
  *(CGFloat *)&v45[12] = Height;
  [(NSArray *)dataViews enumerateObjectsUsingBlock:v45];
  _Block_object_dispose(v47, 8);
  _Block_object_dispose(v48, 8);
}

- (id)impressionableElementsContainedInDocument:(id)a3
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [self tv_associatedIKViewElement];
  double v6 = [v5 appDocument];
  int v7 = [v6 isEqual:v4];

  if (v7)
  {
    double v8 = [MEMORY[0x263EFF980] array];
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    double v9 = [(_TVInfoCellView *)self dataViews];
    uint64_t v10 = [v9 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v20;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v20 != v12) {
            objc_enumerationMutation(v9);
          }
          double v14 = objc_msgSend(*(id *)(*((void *)&v19 + 1) + 8 * i), "tv_impressionableElementsForDocument:", v4);
          [v8 addObjectsFromArray:v14];
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v19 objects:v23 count:16];
      }
      while (v11);
    }

    double v15 = [(_TVInfoCellView *)self headerContentView];
    double v16 = objc_msgSend(v15, "tv_impressionableElementsForDocument:", v4);
    [v8 addObjectsFromArray:v16];

    if ([v8 count])
    {
      double v17 = [MEMORY[0x263EFF8C0] arrayWithArray:v8];
    }
    else
    {
      double v17 = 0;
    }
  }
  else
  {
    double v17 = 0;
  }

  return v17;
}

- (UIView)headerContentView
{
  return self->_headerContentView;
}

- (NSArray)dataViews
{
  return self->_dataViews;
}

- (BOOL)headerOnLeading
{
  return self->_headerOnLeading;
}

- (void)setHeaderOnLeading:(BOOL)a3
{
  self->_BOOL headerOnLeading = a3;
}

- (double)headerWidth
{
  return self->_headerWidth;
}

- (void)setHeaderWidth:(double)a3
{
  self->_headerdouble Width = a3;
}

- (double)headerMaxWidth
{
  return self->_headerMaxWidth;
}

- (void)setHeaderMaxWidth:(double)a3
{
  self->_headerMaxdouble Width = a3;
}

- (double)headerMinWidth
{
  return self->_headerMinWidth;
}

- (void)setHeaderMinWidth:(double)a3
{
  self->_headerMindouble Width = a3;
}

- (UIEdgeInsets)headerMargin
{
  double top = self->_headerMargin.top;
  double left = self->_headerMargin.left;
  double bottom = self->_headerMargin.bottom;
  double right = self->_headerMargin.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)setHeaderMargin:(UIEdgeInsets)a3
{
  self->_headerMargin = a3;
}

- (double)normalizedHeaderWidth
{
  return self->_normalizedHeaderWidth;
}

- (void)setNormalizedHeaderWidth:(double)a3
{
  self->_normalizedHeaderdouble Width = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataViews, 0);
  objc_storeStrong((id *)&self->_headerContentView, 0);
}

@end