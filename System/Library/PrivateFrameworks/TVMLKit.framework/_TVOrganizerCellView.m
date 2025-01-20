@interface _TVOrganizerCellView
- (BOOL)canBecomeFocused;
- (CGSize)_sizeThatFitsComponents:(id)a3 boundingSize:(CGSize)a4;
- (CGSize)sizeThatFits:(CGSize)a3;
- (NSArray)components;
- (NSArray)filteredComponents;
- (_TVOrganizerCellView)initWithFrame:(CGRect)a3;
- (int64_t)_alignmentFromView:(id)a3;
- (int64_t)contentVerticalAlignment;
- (void)_resetSubviews;
- (void)_updateView:(id)a3 maxViewWidth:(double)a4;
- (void)_verticallyStackComponents:(id)a3 alignment:(int64_t)a4;
- (void)layoutSubviews;
- (void)setComponents:(id)a3;
- (void)setContentVerticalAlignment:(int64_t)a3;
@end

@implementation _TVOrganizerCellView

- (_TVOrganizerCellView)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)_TVOrganizerCellView;
  v3 = -[_TVOrganizerCellView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = [MEMORY[0x263F1C550] clearColor];
    [(_TVOrganizerCellView *)v3 setBackgroundColor:v4];

    [(_TVOrganizerCellView *)v3 setOpaque:0];
    v3->_contentVerticalAlignment = 1;
  }
  return v3;
}

- (void)setContentVerticalAlignment:(int64_t)a3
{
  if (self->_contentVerticalAlignment != a3)
  {
    self->_contentVerticalAlignment = a3;
    v4 = [(_TVOrganizerCellView *)self subviews];
    uint64_t v5 = [v4 count];

    if (v5)
    {
      id v6 = [(_TVOrganizerCellView *)self filteredComponents];
      [(_TVOrganizerCellView *)self _verticallyStackComponents:v6 alignment:self->_contentVerticalAlignment];
    }
  }
}

- (void)setComponents:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v5 = a3;
  objc_storeStrong((id *)&self->_components, a3);
  [(_TVOrganizerCellView *)self setNeedsLayout];
  id v6 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v5, "count"));
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v7 = v5;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v16 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void *)(*((void *)&v15 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          objc_msgSend(v6, "addObject:", v12, (void)v15);
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v9);
  }

  uint64_t v13 = [v6 count];
  if (v13) {
    v14 = (void *)[v6 copy];
  }
  else {
    v14 = 0;
  }
  objc_storeStrong((id *)&self->_filteredComponents, v14);
  if (v13) {

  }
  [(_TVOrganizerCellView *)self _resetSubviews];
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  id v6 = [(_TVOrganizerCellView *)self filteredComponents];
  -[_TVOrganizerCellView _sizeThatFitsComponents:boundingSize:](self, "_sizeThatFitsComponents:boundingSize:", v6, width, height);
  double v8 = v7;
  double v10 = v9;

  double v11 = v8;
  double v12 = v10;
  result.double height = v12;
  result.double width = v11;
  return result;
}

- (void)layoutSubviews
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  v26.receiver = self;
  v26.super_class = (Class)_TVOrganizerCellView;
  [(_TVOrganizerCellView *)&v26 layoutSubviews];
  [(_TVOrganizerCellView *)self bounds];
  double v4 = v3;
  id v5 = [(_TVOrganizerCellView *)self filteredComponents];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v22 objects:v28 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v23 != v8) {
          objc_enumerationMutation(v5);
        }
        double v10 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        double v11 = [v10 superview];

        if (v11 != self) {
          [(_TVOrganizerCellView *)self addSubview:v10];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v22 objects:v28 count:16];
    }
    while (v7);
  }
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v12 = v5;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v18 objects:v27 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v19;
    do
    {
      for (uint64_t j = 0; j != v14; ++j)
      {
        if (*(void *)v19 != v15) {
          objc_enumerationMutation(v12);
        }
        -[_TVOrganizerCellView _updateView:maxViewWidth:](self, "_updateView:maxViewWidth:", *(void *)(*((void *)&v18 + 1) + 8 * j), v4, (void)v18);
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v18 objects:v27 count:16];
    }
    while (v14);
  }

  long long v17 = [(_TVOrganizerCellView *)self filteredComponents];
  [(_TVOrganizerCellView *)self _verticallyStackComponents:v17 alignment:[(_TVOrganizerCellView *)self contentVerticalAlignment]];
}

- (BOOL)canBecomeFocused
{
  return 0;
}

- (void)_verticallyStackComponents:(id)a3 alignment:(int64_t)a4
{
  uint64_t v67 = *MEMORY[0x263EF8340];
  id v6 = a3;
  [(_TVOrganizerCellView *)self bounds];
  double v55 = v7;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  double v14 = *MEMORY[0x263F1D1C0];
  double v15 = *(double *)(MEMORY[0x263F1D1C0] + 16);
  long long v61 = 0u;
  long long v62 = 0u;
  long long v63 = 0u;
  long long v64 = 0u;
  id v16 = v6;
  uint64_t v17 = [v16 countByEnumeratingWithState:&v61 objects:v66 count:16];
  double v18 = 0.0;
  if (v17)
  {
    uint64_t v19 = v17;
    id v20 = 0;
    uint64_t v21 = *(void *)v62;
    double v22 = 0.0;
    do
    {
      uint64_t v23 = 0;
      long long v24 = v20;
      double v25 = v15;
      do
      {
        if (*(void *)v62 != v21) {
          objc_enumerationMutation(v16);
        }
        objc_super v26 = *(void **)(*((void *)&v61 + 1) + 8 * v23);
        objc_msgSend(v26, "tv_margin");
        double v15 = v28;
        double v29 = fmax(v27, v25);
        if (v24) {
          double v30 = v29;
        }
        else {
          double v30 = v27;
        }
        if (!v24) {
          double v14 = v27;
        }
        [v26 bounds];
        double v22 = v22 + v30 + v31;
        id v20 = v26;

        ++v23;
        long long v24 = v20;
        double v25 = v15;
      }
      while (v19 != v23);
      uint64_t v19 = [v16 countByEnumeratingWithState:&v61 objects:v66 count:16];
    }
    while (v19);
  }
  else
  {
    double v22 = 0.0;
  }

  double v32 = v15 + v22;
  switch(a4)
  {
    case 3:
      double v18 = floor(v9 + v13 - v32);
      break;
    case 2:
      double v18 = floor((v13 - (v32 - v14 - v15)) * 0.5) - v14;
      break;
    case 1:
      double v18 = floor(v9);
      break;
  }
  long long v59 = 0u;
  long long v60 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  id v33 = v16;
  uint64_t v34 = [v33 countByEnumeratingWithState:&v57 objects:v65 count:16];
  if (v34)
  {
    uint64_t v35 = v34;
    uint64_t v36 = *(void *)v58;
    double v54 = v55 + v11;
    double v56 = v55 + v11 * 0.5;
    do
    {
      for (uint64_t i = 0; i != v35; ++i)
      {
        double v38 = v14;
        if (*(void *)v58 != v36) {
          objc_enumerationMutation(v33);
        }
        v39 = *(void **)(*((void *)&v57 + 1) + 8 * i);
        objc_msgSend(v39, "tv_margin");
        double v41 = v40;
        double v43 = v42;
        double v14 = v44;
        double v46 = v45;
        [v39 center];
        int64_t v47 = [(_TVOrganizerCellView *)self _alignmentFromView:v39];
        double v48 = v56;
        if (v47 != 2)
        {
          if (v47 == 3)
          {
            [v39 bounds];
            double v48 = v54 - v46 + v49 * -0.5;
          }
          else
          {
            [v39 bounds];
            double v48 = v55 + v43 + v50 * 0.5;
          }
        }
        [v39 bounds];
        double v52 = v18 + fmax(v41, v38) + v51 * 0.5;
        objc_msgSend(v39, "setCenter:", v48, v52);
        [v39 bounds];
        double v18 = v52 + v53 * 0.5;
      }
      uint64_t v35 = [v33 countByEnumeratingWithState:&v57 objects:v65 count:16];
    }
    while (v35);
  }
}

- (CGSize)_sizeThatFitsComponents:(id)a3 boundingSize:(CGSize)a4
{
  double width = a4.width;
  uint64_t v43 = *MEMORY[0x263EF8340];
  id v6 = a3;
  double v7 = *MEMORY[0x263F001B0];
  double v8 = *(double *)(MEMORY[0x263F001B0] + 8);
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  uint64_t v9 = [v6 countByEnumeratingWithState:&v38 objects:v42 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    id v11 = 0;
    uint64_t v12 = *(void *)v39;
    double v13 = 0.0;
    do
    {
      uint64_t v14 = 0;
      double v15 = v13;
      id v16 = v11;
      do
      {
        if (*(void *)v39 != v12) {
          objc_enumerationMutation(v6);
        }
        uint64_t v17 = *(void **)(*((void *)&v38 + 1) + 8 * v14);
        objc_msgSend(v17, "tv_margin");
        double v19 = v18;
        double v21 = v20;
        double v13 = v22;
        double v24 = v23;
        if (!v16) {
          double v15 = v18;
        }
        id v11 = v17;

        double v25 = v21 + v24;
        if (width - v25 > 0.0) {
          double v26 = width - v25;
        }
        else {
          double v26 = 0.0;
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          objc_msgSend(v11, "tv_textSizeForWidth:", v26);
        }
        else {
          objc_msgSend(v11, "tv_sizeThatFits:", v26, 0.0);
        }
        double v29 = v28;
        double v30 = v25 + v27;
        unint64_t v31 = [(_TVOrganizerCellView *)self _alignmentFromView:v11] & 0xFFFFFFFFFFFFFFFDLL;
        if (v30 < width && v31 == 1) {
          double v33 = width;
        }
        else {
          double v33 = v30;
        }
        if (v7 < v33) {
          double v7 = v33;
        }
        double v8 = v8 + fmax(v19, v15) + v29;
        ++v14;
        double v15 = v13;
        id v16 = v11;
      }
      while (v10 != v14);
      uint64_t v10 = [v6 countByEnumeratingWithState:&v38 objects:v42 count:16];
    }
    while (v10);
  }
  else
  {
    double v13 = 0.0;
  }

  float v34 = v7;
  double v35 = ceilf(v34);
  float v36 = v13 + v8;
  double v37 = ceilf(v36);
  result.double height = v37;
  result.double width = v35;
  return result;
}

- (void)_updateView:(id)a3 maxViewWidth:(double)a4
{
  id v22 = a3;
  objc_msgSend(v22, "tv_margin");
  if (a4 - (v6 + v7) > 0.0) {
    double v8 = a4 - (v6 + v7);
  }
  else {
    double v8 = 0.0;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(v22, "tv_textSizeForWidth:", v8);
  }
  else {
    objc_msgSend(v22, "tv_sizeThatFits:", v8, 0.0);
  }
  double v11 = v9;
  double v12 = v10;
  int64_t v13 = [(_TVOrganizerCellView *)self _alignmentFromView:v22];
  objc_msgSend(v22, "tv_itemWidth");
  double v15 = v14;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && (v13 & 0xFFFFFFFFFFFFFFFDLL) == 1)
  {
    id v16 = v22;
    if (v15 <= 0.0)
    {
      objc_msgSend(v22, "tv_maxWidth");
      id v16 = v22;
      double v18 = fmin(v8, v17);
      if (v17 <= 0.0) {
        double v11 = v8;
      }
      else {
        double v11 = v18;
      }
    }
  }
  else
  {
    id v16 = v22;
  }
  float v19 = v11;
  double v20 = ceilf(v19);
  float v21 = v12;
  objc_msgSend(v16, "setBounds:", 0.0, 0.0, v20, ceilf(v21));
}

- (int64_t)_alignmentFromView:(id)a3
{
  id v3 = a3;
  uint64_t v4 = objc_msgSend(v3, "tv_alignment");
  if (v4) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 4;
  }
  uint64_t v6 = [v3 semanticContentAttribute];

  return +[TVMLUtilities semanticAlignmentForAlignment:v5 semanticContentAttribute:v6];
}

- (void)_resetSubviews
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v3 = [(_TVOrganizerCellView *)self subviews];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v12;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v3);
        }
        double v8 = *(void **)(*((void *)&v11 + 1) + 8 * v7);
        double v9 = [(_TVOrganizerCellView *)self filteredComponents];
        char v10 = [v9 containsObject:v8];

        if ((v10 & 1) == 0) {
          [v8 removeFromSuperview];
        }
        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v5);
  }
}

- (NSArray)components
{
  return self->_components;
}

- (int64_t)contentVerticalAlignment
{
  return self->_contentVerticalAlignment;
}

- (NSArray)filteredComponents
{
  return self->_filteredComponents;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_filteredComponents, 0);
  objc_storeStrong((id *)&self->_components, 0);
}

@end