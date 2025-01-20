@interface SKUINavigationBarMenusView
+ (id)_attributedStringWithMenuItem:(id)a3 context:(id)a4;
+ (void)requestLayoutWithMenus:(id)a3 width:(int64_t)a4 context:(id)a5;
- (CGSize)sizeThatFits:(CGSize)a3;
- (UIEdgeInsets)contentInset;
- (void)layoutSubviews;
- (void)reloadWithMenus:(id)a3 width:(int64_t)a4 context:(id)a5;
- (void)setButtonTarget:(id)a3 action:(SEL)a4;
- (void)setContentInset:(UIEdgeInsets)a3;
@end

@implementation SKUINavigationBarMenusView

+ (void)requestLayoutWithMenus:(id)a3 width:(int64_t)a4 context:(id)a5
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    +[SKUINavigationBarMenusView requestLayoutWithMenus:width:context:]();
  }
  v10 = [v9 labelLayoutCache];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v11 = v8;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v19;
    do
    {
      uint64_t v15 = 0;
      do
      {
        if (*(void *)v19 != v14) {
          objc_enumerationMutation(v11);
        }
        v16 = objc_msgSend(*(id *)(*((void *)&v18 + 1) + 8 * v15), "titleItem", (void)v18);
        v17 = [a1 _attributedStringWithMenuItem:v16 context:v9];
        [v10 requestLayoutForViewElement:v16 attributedString:v17 width:a4];

        ++v15;
      }
      while (v13 != v15);
      uint64_t v13 = [v11 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v13);
  }
}

- (void)reloadWithMenus:(id)a3 width:(int64_t)a4 context:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v10 = (NSArray *)[v8 copy];
  menuViewElements = self->_menuViewElements;
  self->_menuViewElements = v10;

  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __60__SKUINavigationBarMenusView_reloadWithMenus_width_context___block_invoke;
  v14[3] = &unk_1E64234F8;
  id v15 = v8;
  id v16 = v9;
  v17 = self;
  int64_t v18 = a4;
  id v12 = v9;
  id v13 = v8;
  [(SKUIViewReuseView *)self modifyUsingBlock:v14];
}

void __60__SKUINavigationBarMenusView_reloadWithMenus_width_context___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id obj = *(id *)(a1 + 32);
  uint64_t v4 = [obj countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v14 != v6) {
          objc_enumerationMutation(obj);
        }
        id v8 = [*(id *)(*((void *)&v13 + 1) + 8 * i) titleItem];
        id v9 = [v3 addMenuButtonWithTitleItem:v8 width:*(void *)(a1 + 40) context:(double)*(uint64_t *)(a1 + 56)];
        id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 48) + 432));
        if (*(void *)(*(void *)(a1 + 48) + 424)) {
          uint64_t v11 = *(void *)(*(void *)(a1 + 48) + 424);
        }
        else {
          uint64_t v11 = 0;
        }
        [v9 addTarget:WeakRetained action:v11 forControlEvents:64];
      }
      uint64_t v5 = [obj countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v5);
  }
}

- (void)setButtonTarget:(id)a3 action:(SEL)a4
{
  if (a4) {
    uint64_t v4 = a4;
  }
  else {
    uint64_t v4 = 0;
  }
  self->_buttonAction = v4;
  objc_storeWeak(&self->_buttonTarget, a3);
}

- (void)setContentInset:(UIEdgeInsets)a3
{
  if (self->_contentInset.left != a3.left
    || self->_contentInset.top != a3.top
    || self->_contentInset.right != a3.right
    || self->_contentInset.bottom != a3.bottom)
  {
    self->_contentInset = a3;
    [(SKUINavigationBarMenusView *)self setNeedsLayout];
  }
}

- (void)layoutSubviews
{
  uint64_t v62 = *MEMORY[0x1E4F143B8];
  [(SKUINavigationBarMenusView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  p_contentInset = &self->_contentInset;
  double v8 = self->_contentInset.left + self->_contentInset.right;
  id v9 = [(SKUIViewReuseView *)self allExistingViews];
  long long v56 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v56 objects:v61 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v57;
    double v13 = *MEMORY[0x1E4F1DB28];
    double v14 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v15 = 0.0;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v57 != v12) {
          objc_enumerationMutation(v9);
        }
        v17 = *(void **)(*((void *)&v56 + 1) + 8 * i);
        objc_msgSend(v17, "sizeThatFits:", v4, v6);
        double v19 = v18;
        double v21 = v20;
        objc_msgSend(v17, "setFrame:", v13, v14, v18, v20);
        [v17 setHidden:0];
        if (v15 < v21) {
          double v15 = v21;
        }
        double v8 = v8 + v19;
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v56 objects:v61 count:16];
    }
    while (v11);
  }
  else
  {
    double v15 = 0.0;
  }
  uint64_t v22 = [v9 count];
  if (v22 < 2)
  {
    double v26 = 40.0;
  }
  else
  {
    uint64_t v23 = v22;
    uint64_t v24 = v22 - 1;
    double v25 = (double)(v22 - 1);
    double v26 = 40.0;
    double v8 = v8 + v25 * 40.0;
    if (v8 > v4)
    {
      double v26 = 40.0;
      do
      {
        double v26 = v26 + -1.0;
        double v8 = v8 - v25;
      }
      while (v26 > 20.0 && v8 > v4);
      if (v8 > v4)
      {
        v28 = [v9 sortedArrayWithOptions:0 usingComparator:&__block_literal_global_20];
        uint64_t v29 = 1;
        do
        {
          v30 = [v28 objectAtIndex:v29 - 1];
          [v30 frame];
          float v32 = v31 * 0.2;
          double v33 = floorf(v32);
          objc_msgSend(v30, "setFrame:");
          double v8 = v8 - v33;

          if (v29 >= v23) {
            break;
          }
          ++v29;
        }
        while (v8 > v4);
      }
    }
    while (v8 > v4)
    {
      v34 = [v9 objectAtIndex:v24];
      [v34 setHidden:1];
      [v34 frame];
      double v8 = v8 - (v26 + v35);

      if (v24 < 2) {
        break;
      }
      --v24;
    }
  }
  double left = p_contentInset->left;
  long long v52 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  id v37 = v9;
  uint64_t v38 = [v37 countByEnumeratingWithState:&v52 objects:v60 count:16];
  if (v38)
  {
    uint64_t v39 = v38;
    float v40 = (v4 - v8) * 0.5;
    double v41 = floorf(v40);
    if (left < v41) {
      double left = v41;
    }
    uint64_t v42 = *(void *)v53;
    do
    {
      for (uint64_t j = 0; j != v39; ++j)
      {
        if (*(void *)v53 != v42) {
          objc_enumerationMutation(v37);
        }
        v44 = *(void **)(*((void *)&v52 + 1) + 8 * j);
        objc_msgSend(v44, "frame", (void)v52);
        CGFloat v47 = v46;
        float v48 = (v15 - v46) * 0.5;
        double v49 = floorf(v48);
        double v50 = p_contentInset->top + v49;
        if (v45 >= v4) {
          double v51 = v4;
        }
        else {
          double v51 = v45;
        }
        objc_msgSend(v44, "setFrame:", left, p_contentInset->top + v49, v51);
        v63.origin.x = left;
        v63.origin.y = v50;
        v63.size.width = v51;
        v63.size.height = v47;
        double left = v26 + CGRectGetMaxX(v63);
      }
      uint64_t v39 = [v37 countByEnumeratingWithState:&v52 objects:v60 count:16];
    }
    while (v39);
  }
}

uint64_t __44__SKUINavigationBarMenusView_layoutSubviews__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  [a2 frame];
  double v6 = v5;
  [v4 frame];
  double v8 = v7;

  if (v6 <= v8) {
    uint64_t v9 = 0;
  }
  else {
    uint64_t v9 = -1;
  }
  if (v6 < v8) {
    return 1;
  }
  else {
    return v9;
  }
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  double v6 = *MEMORY[0x1E4F1DB30];
  double v7 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  double v8 = [(SKUIViewReuseView *)self allExistingViews];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v22;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v22 != v11) {
          objc_enumerationMutation(v8);
        }
        objc_msgSend(*(id *)(*((void *)&v21 + 1) + 8 * v12), "sizeThatFits:", width, height);
        if (v7 < v14) {
          double v7 = v14;
        }
        double v6 = v6 + v13;
        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v10);
  }
  if ((unint64_t)[v8 count] >= 2) {
    double v6 = v6 + (float)((float)(unint64_t)([v8 count] - 1) * 40.0);
  }
  double top = self->_contentInset.top;
  double left = self->_contentInset.left;
  double bottom = self->_contentInset.bottom;
  double right = self->_contentInset.right;

  double v19 = v7 + top + bottom;
  double v20 = v6 + left + right;
  result.double height = v19;
  result.double width = v20;
  return result;
}

+ (id)_attributedStringWithMenuItem:(id)a3 context:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  double v7 = [v5 style];
  double v8 = SKUIViewElementFontWithStyle(v7);
  if (!v8)
  {
    double v8 = [MEMORY[0x1E4FB08E0] systemFontOfSize:14.0];
  }
  uint64_t v9 = [v6 tintColor];
  uint64_t v10 = SKUIViewElementPlainColorWithStyle(v7, v9);

  if (!v10)
  {
    uint64_t v10 = [MEMORY[0x1E4FB1618] blackColor];
  }
  uint64_t v11 = [v5 itemText];
  uint64_t v12 = [v11 attributedStringWithDefaultFont:v8 foregroundColor:v10 style:v7];

  return v12;
}

- (UIEdgeInsets)contentInset
{
  double top = self->_contentInset.top;
  double left = self->_contentInset.left;
  double bottom = self->_contentInset.bottom;
  double right = self->_contentInset.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_menuViewElements, 0);

  objc_destroyWeak(&self->_buttonTarget);
}

+ (void)requestLayoutWithMenus:width:context:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "+[SKUINavigationBarMenusView requestLayoutWithMenus:width:context:]";
}

@end