@interface SUUIProductInformationView
- (BOOL)hidesSeparatorView;
- (CGSize)sizeThatFits:(CGSize)a3;
- (NSArray)informationLines;
- (NSString)title;
- (SUUIColorScheme)colorScheme;
- (SUUIProductInformationView)initWithFrame:(CGRect)a3;
- (UIEdgeInsets)contentInset;
- (double)_keyWidth;
- (void)layoutSubviews;
- (void)setBackgroundColor:(id)a3;
- (void)setColorScheme:(id)a3;
- (void)setContentInset:(UIEdgeInsets)a3;
- (void)setHidesSeparatorView:(BOOL)a3;
- (void)setInformationLines:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation SUUIProductInformationView

- (SUUIProductInformationView)initWithFrame:(CGRect)a3
{
  v16.receiver = self;
  v16.super_class = (Class)SUUIProductInformationView;
  v3 = -[SUUIProductInformationView initWithFrame:](&v16, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    __asm { FMOV            V0.2D, #15.0 }
    *(_OWORD *)&v3->_contentInset.top = _Q0;
    *(_OWORD *)&v3->_contentInset.bottom = _Q0;
    v10 = (UIView *)objc_alloc_init(MEMORY[0x263F82E00]);
    separatorView = v4->_separatorView;
    v4->_separatorView = v10;

    v12 = v4->_separatorView;
    v13 = [(SUUIColorScheme *)v4->_colorScheme primaryTextColor];
    if (v13)
    {
      [(UIView *)v12 setBackgroundColor:v13];
    }
    else
    {
      v14 = [MEMORY[0x263F825C8] colorWithWhite:0.0 alpha:0.2];
      [(UIView *)v12 setBackgroundColor:v14];
    }
    [(SUUIProductInformationView *)v4 addSubview:v4->_separatorView];
  }
  return v4;
}

- (BOOL)hidesSeparatorView
{
  return [(UIView *)self->_separatorView isHidden];
}

- (void)setHidesSeparatorView:(BOOL)a3
{
}

- (void)setInformationLines:(id)a3
{
  uint64_t v77 = *MEMORY[0x263EF8340];
  v6 = (NSArray *)a3;
  if (self->_informationLines != v6)
  {
    v49 = v6;
    objc_storeStrong((id *)&self->_informationLines, a3);
    long long v69 = 0u;
    long long v70 = 0u;
    long long v67 = 0u;
    long long v68 = 0u;
    v7 = self->_keyLabels;
    uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v67 objects:v76 count:16];
    if (v8)
    {
      v3 = (void *)v8;
      uint64_t v9 = *(void *)v68;
      do
      {
        for (i = 0; i != v3; i = (char *)i + 1)
        {
          if (*(void *)v68 != v9) {
            objc_enumerationMutation(v7);
          }
          [*(id *)(*((void *)&v67 + 1) + 8 * i) removeFromSuperview];
        }
        v3 = (void *)[(NSMutableArray *)v7 countByEnumeratingWithState:&v67 objects:v76 count:16];
      }
      while (v3);
    }

    long long v65 = 0u;
    long long v66 = 0u;
    long long v63 = 0u;
    long long v64 = 0u;
    v11 = self->_valueLabels;
    uint64_t v12 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v63 objects:v75 count:16];
    if (v12)
    {
      v3 = (void *)v12;
      uint64_t v13 = *(void *)v64;
      do
      {
        for (j = 0; j != v3; j = (char *)j + 1)
        {
          if (*(void *)v64 != v13) {
            objc_enumerationMutation(v11);
          }
          [*(id *)(*((void *)&v63 + 1) + 8 * (void)j) removeFromSuperview];
        }
        v3 = (void *)[(NSMutableArray *)v11 countByEnumeratingWithState:&v63 objects:v75 count:16];
      }
      while (v3);
    }

    long long v61 = 0u;
    long long v62 = 0u;
    long long v59 = 0u;
    long long v60 = 0u;
    v15 = self->_imageValues;
    uint64_t v16 = [(NSMutableArray *)v15 countByEnumeratingWithState:&v59 objects:v74 count:16];
    if (v16)
    {
      v3 = (void *)v16;
      uint64_t v17 = *(void *)v60;
      do
      {
        for (k = 0; k != v3; k = (char *)k + 1)
        {
          if (*(void *)v60 != v17) {
            objc_enumerationMutation(v15);
          }
          v19 = *(void **)(*((void *)&v59 + 1) + 8 * (void)k);
          v20 = [MEMORY[0x263EFF9D0] null];

          if (v19 != v20) {
            [v19 removeFromSuperview];
          }
        }
        v3 = (void *)[(NSMutableArray *)v15 countByEnumeratingWithState:&v59 objects:v74 count:16];
      }
      while (v3);
    }

    v21 = [MEMORY[0x263EFF980] array];
    keyLabels = self->_keyLabels;
    self->_keyLabels = v21;

    v23 = [MEMORY[0x263EFF980] array];
    valueLabels = self->_valueLabels;
    self->_valueLabels = v23;

    v25 = [MEMORY[0x263EFF980] array];
    imageValues = self->_imageValues;
    self->_imageValues = v25;

    long long v57 = 0u;
    long long v58 = 0u;
    long long v55 = 0u;
    long long v56 = 0u;
    obj = self->_informationLines;
    uint64_t v54 = [(NSArray *)obj countByEnumeratingWithState:&v55 objects:v73 count:16];
    if (v54)
    {
      uint64_t v52 = *MEMORY[0x263F81540];
      uint64_t v53 = *(void *)v56;
      uint64_t v51 = *MEMORY[0x263F81500];
      do
      {
        for (uint64_t m = 0; m != v54; ++m)
        {
          if (*(void *)v56 != v53) {
            objc_enumerationMutation(obj);
          }
          v28 = *(void **)(*((void *)&v55 + 1) + 8 * m);
          id v29 = objc_alloc_init(MEMORY[0x263F828E0]);
          v30 = [MEMORY[0x263F81708] systemFontOfSize:12.0];
          [v29 setFont:v30];

          [v29 setTextAlignment:2];
          v31 = [(SUUIProductInformationView *)self backgroundColor];
          [v29 setBackgroundColor:v31];

          v32 = [v28 objectAtIndex:0];
          [v29 setText:v32];

          v33 = [(SUUIColorScheme *)self->_colorScheme secondaryTextColor];
          if (v33)
          {
            [v29 setTextColor:v33];
          }
          else
          {
            v34 = [MEMORY[0x263F825C8] colorWithWhite:0.0 alpha:0.4];
            [v29 setTextColor:v34];
          }
          [(SUUIProductInformationView *)self addSubview:v29];
          [(NSMutableArray *)self->_keyLabels addObject:v29];
          id v35 = objc_alloc_init(MEMORY[0x263F81650]);
          [v35 setMinimumLineHeight:16.0];
          v71[0] = v52;
          v71[1] = v51;
          v72[0] = v35;
          v36 = [(SUUIColorScheme *)self->_colorScheme primaryTextColor];
          v37 = v36;
          if (!v36)
          {
            v3 = [MEMORY[0x263F825C8] colorWithWhite:0.0 alpha:0.8];
            v37 = v3;
          }
          v72[1] = v37;
          v38 = [NSDictionary dictionaryWithObjects:v72 forKeys:v71 count:2];
          if (!v36) {

          }
          id v39 = objc_alloc_init(MEMORY[0x263F828E0]);
          v40 = [MEMORY[0x263F81708] systemFontOfSize:12.0];
          [v39 setFont:v40];

          [v39 setNumberOfLines:0];
          v41 = [(SUUIProductInformationView *)self backgroundColor];
          [v39 setBackgroundColor:v41];

          id v42 = objc_alloc(MEMORY[0x263F086A0]);
          v43 = [v28 objectAtIndex:1];
          v44 = (void *)[v42 initWithString:v43 attributes:v38];
          [v39 setAttributedText:v44];

          [(SUUIProductInformationView *)self addSubview:v39];
          [(NSMutableArray *)self->_valueLabels addObject:v39];
          if ((unint64_t)[v28 count] >= 3)
          {
            v45 = [v28 objectAtIndex:2];
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v46 = (void *)[objc_alloc(MEMORY[0x263F82828]) initWithImage:v45];
              [(SUUIProductInformationView *)self addSubview:v46];

              if (v46)
              {
                v47 = self->_imageValues;
                goto LABEL_43;
              }
            }
            else
            {
            }
          }
          v48 = self->_imageValues;
          v46 = [MEMORY[0x263EFF9D0] null];
          v47 = v48;
LABEL_43:
          [(NSMutableArray *)v47 addObject:v46];
        }
        uint64_t v54 = [(NSArray *)obj countByEnumeratingWithState:&v55 objects:v73 count:16];
      }
      while (v54);
    }

    [(SUUIProductInformationView *)self setNeedsLayout];
    v6 = v49;
  }
}

- (void)setColorScheme:(id)a3
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  v5 = (SUUIColorScheme *)a3;
  p_colorScheme = &self->_colorScheme;
  if (self->_colorScheme != v5)
  {
    id v29 = v5;
    objc_storeStrong((id *)&self->_colorScheme, a3);
    long long v36 = 0u;
    long long v37 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    v7 = self->_keyLabels;
    uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v34 objects:v39 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v35;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v35 != v10) {
            objc_enumerationMutation(v7);
          }
          uint64_t v12 = *(void **)(*((void *)&v34 + 1) + 8 * i);
          uint64_t v13 = [(SUUIColorScheme *)*p_colorScheme secondaryTextColor];
          if (v13)
          {
            [v12 setTextColor:v13];
          }
          else
          {
            v14 = [MEMORY[0x263F825C8] colorWithWhite:0.0 alpha:0.4];
            [v12 setTextColor:v14];
          }
        }
        uint64_t v9 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v34 objects:v39 count:16];
      }
      while (v9);
    }

    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    v15 = self->_valueLabels;
    uint64_t v16 = [(NSMutableArray *)v15 countByEnumeratingWithState:&v30 objects:v38 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = *(void *)v31;
      do
      {
        for (uint64_t j = 0; j != v17; ++j)
        {
          if (*(void *)v31 != v18) {
            objc_enumerationMutation(v15);
          }
          v20 = *(void **)(*((void *)&v30 + 1) + 8 * j);
          v21 = [(SUUIColorScheme *)*p_colorScheme primaryTextColor];
          if (v21)
          {
            [v20 setTextColor:v21];
          }
          else
          {
            v22 = [MEMORY[0x263F825C8] colorWithWhite:0.0 alpha:0.8];
            [v20 setTextColor:v22];
          }
        }
        uint64_t v17 = [(NSMutableArray *)v15 countByEnumeratingWithState:&v30 objects:v38 count:16];
      }
      while (v17);
    }

    separatorView = self->_separatorView;
    v24 = [(SUUIColorScheme *)*p_colorScheme primaryTextColor];
    if (v24)
    {
      [(UIView *)separatorView setBackgroundColor:v24];
    }
    else
    {
      v25 = [MEMORY[0x263F825C8] colorWithWhite:0.0 alpha:0.2];
      [(UIView *)separatorView setBackgroundColor:v25];
    }
    titleLabel = self->_titleLabel;
    v27 = [(SUUIColorScheme *)*p_colorScheme secondaryTextColor];
    if (v27)
    {
      [(UILabel *)titleLabel setTextColor:v27];
    }
    else
    {
      v28 = [MEMORY[0x263F825C8] blackColor];
      [(UILabel *)titleLabel setTextColor:v28];
    }
    v5 = v29;
  }
}

- (void)setTitle:(id)a3
{
  id v16 = a3;
  id v4 = [(UILabel *)self->_titleLabel text];
  if (v4 != v16 && ([v4 isEqualToString:v16] & 1) == 0)
  {
    titleLabel = self->_titleLabel;
    if (v16)
    {
      if (!titleLabel)
      {
        v6 = (UILabel *)objc_alloc_init(MEMORY[0x263F828E0]);
        v7 = self->_titleLabel;
        self->_titleLabel = v6;

        uint64_t v8 = self->_titleLabel;
        uint64_t v9 = [(SUUIProductInformationView *)self backgroundColor];
        [(UILabel *)v8 setBackgroundColor:v9];

        uint64_t v10 = self->_titleLabel;
        v11 = [MEMORY[0x263F81708] systemFontOfSize:17.0];
        [(UILabel *)v10 setFont:v11];

        uint64_t v12 = self->_titleLabel;
        uint64_t v13 = [(SUUIColorScheme *)self->_colorScheme secondaryTextColor];
        if (v13)
        {
          [(UILabel *)v12 setTextColor:v13];
        }
        else
        {
          v15 = [MEMORY[0x263F825C8] blackColor];
          [(UILabel *)v12 setTextColor:v15];
        }
        [(SUUIProductInformationView *)self addSubview:self->_titleLabel];
        titleLabel = self->_titleLabel;
      }
      -[UILabel setText:](titleLabel, "setText:");
      [(UILabel *)self->_titleLabel sizeToFit];
    }
    else
    {
      [(UILabel *)titleLabel removeFromSuperview];
      v14 = self->_titleLabel;
      self->_titleLabel = 0;
    }
    [(SUUIProductInformationView *)self setNeedsLayout];
  }
}

- (NSString)title
{
  return [(UILabel *)self->_titleLabel text];
}

- (void)layoutSubviews
{
  [(SUUIProductInformationView *)self bounds];
  double v44 = v3;
  double top = self->_contentInset.top;
  titleLabel = self->_titleLabel;
  if (titleLabel)
  {
    [(UILabel *)titleLabel frame];
    CGFloat v7 = v6;
    CGFloat v9 = v8;
    double left = self->_contentInset.left;
    -[UILabel setFrame:](self->_titleLabel, "setFrame:", left, top + -4.0);
    v52.origin.x = left;
    v52.origin.y = top + -4.0;
    v52.size.width = v7;
    v52.size.height = v9;
    double top = CGRectGetMaxY(v52) + -4.0 + 10.0;
  }
  [(SUUIProductInformationView *)self _keyWidth];
  double v48 = v11;
  double v12 = self->_contentInset.left;
  double right = self->_contentInset.right;
  if ([(NSMutableArray *)self->_keyLabels count])
  {
    unint64_t v14 = 0;
    double v46 = v44 - v12 - right - v48 + -15.0;
    do
    {
      v15 = [(NSMutableArray *)self->_keyLabels objectAtIndex:v14];
      [v15 frame];
      double v16 = self->_contentInset.left;
      CGFloat v17 = v48;
      objc_msgSend(v15, "sizeThatFits:", v48, 1.79769313e308);
      double v19 = v18;
      objc_msgSend(v15, "setFrame:", v16, top + -3.0, v48, v18);
      v20 = [(NSMutableArray *)self->_valueLabels objectAtIndex:v14];
      [v20 frame];
      v53.origin.x = v16;
      v53.origin.y = top + -3.0;
      v53.size.width = v48;
      v53.size.height = v19;
      double rect_8 = CGRectGetMaxX(v53) + 15.0;
      objc_msgSend(v20, "sizeThatFits:", v46, 1.79769313e308);
      double v22 = v21;
      double v24 = v23;
      v25 = [(NSMutableArray *)self->_imageValues objectAtIndex:v14];
      v26 = [MEMORY[0x263EFF9D0] null];

      CGFloat rect = v16;
      if (v25 == v26)
      {
        id v27 = 0;
        double v37 = -2.0;
      }
      else
      {
        id v27 = v25;
        [v27 sizeToFit];
        [v27 frame];
        double v47 = v28;
        double v45 = v29;
        double v30 = v48;
        double v31 = 15.0;
        double v32 = top + -3.0;
        double v33 = v19;
        if (v22 > 0.0)
        {
          double v31 = 5.0;
          objc_msgSend(v20, "sizeThatFits:", v46 - (v47 + 5.0), 1.79769313e308, v48, v19);
          double v30 = v34;
          double v33 = v35;
          double v16 = rect_8;
          double v32 = top + -5.0;
          double v24 = v33;
          double v22 = v34;
        }
        double v36 = v16;
        double v37 = -2.0;
        objc_msgSend(v27, "setFrame:", CGRectGetMaxX(*(CGRect *)(&v32 - 1)) + v31, top + -2.0, v47, v45);
        CGFloat v17 = v48;
      }
      objc_msgSend(v20, "setFrame:", rect_8, top + -5.0, v22, v24);
      v54.origin.x = rect;
      v54.origin.y = top + -3.0;
      v54.size.width = v17;
      v54.size.height = v19;
      double v38 = CGRectGetMaxY(v54) + v37;
      v55.origin.x = rect_8;
      v55.origin.y = top + -5.0;
      v55.size.width = v22;
      v55.size.height = v24;
      double v39 = CGRectGetMaxY(v55) + v37;
      if (v38 < v39) {
        double v38 = v39;
      }
      if (v27)
      {
        [v27 frame];
        double v40 = CGRectGetMaxY(v56) + v37;
        if (v40 >= v38) {
          double v38 = v40;
        }
      }
      double top = v38 + 9.0;

      ++v14;
    }
    while (v14 < [(NSMutableArray *)self->_keyLabels count]);
  }
  separatorView = self->_separatorView;
  if (separatorView)
  {
    [(UIView *)separatorView frame];
    id v42 = [MEMORY[0x263F82B60] mainScreen];
    [v42 scale];

    v43 = self->_separatorView;
    -[UIView setFrame:](v43, "setFrame:");
  }
}

- (void)setBackgroundColor:(id)a3
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  v5 = self->_keyLabels;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v20 objects:v25 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v21;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v21 != v8) {
          objc_enumerationMutation(v5);
        }
        [*(id *)(*((void *)&v20 + 1) + 8 * v9++) setBackgroundColor:v4];
      }
      while (v7 != v9);
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v20 objects:v25 count:16];
    }
    while (v7);
  }

  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v10 = self->_valueLabels;
  uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v16 objects:v24 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v17;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v17 != v13) {
          objc_enumerationMutation(v10);
        }
        [*(id *)(*((void *)&v16 + 1) + 8 * v14++) setBackgroundColor:v4];
      }
      while (v12 != v14);
      uint64_t v12 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v16 objects:v24 count:16];
    }
    while (v12);
  }

  [(UILabel *)self->_titleLabel setBackgroundColor:v4];
  v15.receiver = self;
  v15.super_class = (Class)SUUIProductInformationView;
  [(SUUIProductInformationView *)&v15 setBackgroundColor:v4];
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double width = a3.width;
  p_contentInset = &self->_contentInset;
  double v6 = self->_contentInset.top + self->_contentInset.bottom;
  titleLabel = self->_titleLabel;
  if (titleLabel)
  {
    [(UILabel *)titleLabel frame];
    double v6 = v6 + v8 + 10.0 + -4.0 + -4.0;
  }
  [(SUUIProductInformationView *)self _keyWidth];
  double v10 = v9;
  double left = p_contentInset->left;
  double right = p_contentInset->right;
  double v31 = v9;
  if ([(NSMutableArray *)self->_keyLabels count])
  {
    unint64_t v13 = 0;
    double v14 = width - left - right - v10 + -15.0;
    double v15 = 0.0;
    do
    {
      long long v16 = [(NSMutableArray *)self->_keyLabels objectAtIndex:v13];
      [v16 frame];
      double v18 = v17 + -3.0 + -2.0;

      long long v19 = [(NSMutableArray *)self->_valueLabels objectAtIndex:v13];
      objc_msgSend(v19, "sizeThatFits:", v14, 1.79769313e308);
      double v21 = v20;
      double v23 = v22;

      if (v18 >= v23 + -5.0 + -2.0) {
        double v24 = v18;
      }
      else {
        double v24 = v23 + -5.0 + -2.0;
      }
      if (v24 <= 0.0)
      {
        v25 = [(NSMutableArray *)self->_imageValues objectAtIndex:v13];
        uint64_t v26 = [MEMORY[0x263EFF9D0] null];

        if (v25 != v26)
        {
          id v27 = [(NSMutableArray *)self->_imageValues objectAtIndex:v13];
          [v27 frame];
          double v24 = v28 + 2.0;
        }
      }
      double v6 = v6 + v24;
      if (v21 >= v15) {
        double v15 = v21;
      }
      ++v13;
    }
    while (v13 < [(NSMutableArray *)self->_keyLabels count]);
  }
  else
  {
    double v15 = 0.0;
  }
  if ((unint64_t)[(NSMutableArray *)self->_keyLabels count] > 1) {
    double v6 = v6 + (float)((float)(unint64_t)([(NSMutableArray *)self->_keyLabels count] - 1) * 9.0);
  }
  double v29 = v31 + 15.0 + v15 + p_contentInset->left + p_contentInset->right;
  double v30 = v6;
  result.height = v30;
  result.double width = v29;
  return result;
}

- (double)_keyWidth
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  v2 = self->_keyLabels;
  uint64_t v3 = [(NSMutableArray *)v2 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v13;
    double v6 = *(double *)(MEMORY[0x263F00190] + 16);
    double v7 = *(double *)(MEMORY[0x263F00190] + 24);
    double v8 = 0.0;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v13 != v5) {
          objc_enumerationMutation(v2);
        }
        objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * i), "sizeThatFits:", v6, v7, (void)v12);
        if (v8 < v10) {
          double v8 = v10;
        }
      }
      uint64_t v4 = [(NSMutableArray *)v2 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v4);
  }
  else
  {
    double v8 = 0.0;
  }

  return v8;
}

- (SUUIColorScheme)colorScheme
{
  return self->_colorScheme;
}

- (NSArray)informationLines
{
  return self->_informationLines;
}

- (UIEdgeInsets)contentInset
{
  double top = self->_contentInset.top;
  double left = self->_contentInset.left;
  bottouint64_t m = self->_contentInset.bottom;
  double right = self->_contentInset.right;
  result.double right = right;
  result.bottouint64_t m = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)setContentInset:(UIEdgeInsets)a3
{
  self->_contentInset = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_valueLabels, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_separatorView, 0);
  objc_storeStrong((id *)&self->_keyLabels, 0);
  objc_storeStrong((id *)&self->_imageValues, 0);
  objc_storeStrong((id *)&self->_informationLines, 0);
  objc_storeStrong((id *)&self->_colorScheme, 0);
}

@end