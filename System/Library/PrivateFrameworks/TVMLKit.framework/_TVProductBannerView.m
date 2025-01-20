@interface _TVProductBannerView
+ (id)productBannerViewWithElement:(id)a3 existingView:(id)a4;
- (CGSize)sizeThatFits:(CGSize)result;
- (UIView)backgroundImageView;
- (UIView)heroImageView;
- (UIView)infoListView;
- (UIView)stackView;
- (_TVProductBannerView)initWithFrame:(CGRect)a3;
- (id)impressionableElementsContainedInDocument:(id)a3;
- (id)preferredFocusEnvironments;
- (void)layoutSubviews;
- (void)setBackgroundImageView:(id)a3;
- (void)setHeroImageView:(id)a3;
- (void)setInfoListView:(id)a3;
- (void)setStackView:(id)a3;
@end

@implementation _TVProductBannerView

+ (id)productBannerViewWithElement:(id)a3 existingView:(id)a4
{
  uint64_t v52 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  v7 = [v5 style];
  objc_msgSend(v7, "tv_height");
  double v9 = v8;

  v10 = [MEMORY[0x263F1C920] mainScreen];
  [v10 bounds];
  double v12 = v11;

  objc_opt_class();
  v39 = v6;
  if (objc_opt_isKindOfClass()) {
    v13 = (_TVProductBannerView *)v6;
  }
  else {
    v13 = -[_TVProductBannerView initWithFrame:]([_TVProductBannerView alloc], "initWithFrame:", 0.0, 0.0, v12, v9);
  }
  -[_TVProductBannerView setSemanticContentAttribute:](v13, "setSemanticContentAttribute:", objc_msgSend(v5, "tv_semanticContentAttribute"));
  -[_TVProductBannerView setFrame:](v13, "setFrame:", 0.0, 0.0, v12, v9);
  long long v48 = 0u;
  long long v49 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  v40 = v5;
  v14 = [v5 children];
  uint64_t v15 = [v14 countByEnumeratingWithState:&v46 objects:v51 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v47;
    unint64_t v18 = 0x264BA5000uLL;
    v41 = v14;
    do
    {
      for (uint64_t i = 0; i != v16; ++i)
      {
        if (*(void *)v47 != v17) {
          objc_enumerationMutation(v14);
        }
        v20 = *(void **)(*((void *)&v46 + 1) + 8 * i);
        uint64_t v21 = objc_msgSend(v20, "tv_elementType");
        if (v21 > 18)
        {
          switch(v21)
          {
            case 19:
              v27 = [*(id *)(v18 + 2784) sharedInterfaceFactory];
              v28 = [(_TVProductBannerView *)v13 infoListView];
              v24 = [v27 _viewFromElement:v20 existingView:v28];

              [(_TVProductBannerView *)v13 setInfoListView:v24];
              break;
            case 24:
LABEL_18:
              v25 = [*(id *)(v18 + 2784) sharedInterfaceFactory];
              v26 = [(_TVProductBannerView *)v13 heroImageView];
              v24 = [v25 _viewFromElement:v20 existingView:v26];

              [(_TVProductBannerView *)v13 setHeroImageView:v24];
              break;
            case 54:
              v22 = [*(id *)(v18 + 2784) sharedInterfaceFactory];
              v23 = [(_TVProductBannerView *)v13 stackView];
              v24 = [v22 _viewFromElement:v20 existingView:v23];

              [(_TVProductBannerView *)v13 setStackView:v24];
              break;
            default:
              continue;
          }
LABEL_32:

          continue;
        }
        if (v21 == 4)
        {
          long long v44 = 0u;
          long long v45 = 0u;
          long long v42 = 0u;
          long long v43 = 0u;
          v24 = [v20 children];
          uint64_t v29 = [v24 countByEnumeratingWithState:&v42 objects:v50 count:16];
          if (v29)
          {
            uint64_t v30 = v29;
            unint64_t v31 = v18;
            uint64_t v32 = *(void *)v43;
            while (2)
            {
              for (uint64_t j = 0; j != v30; ++j)
              {
                if (*(void *)v43 != v32) {
                  objc_enumerationMutation(v24);
                }
                v34 = *(void **)(*((void *)&v42 + 1) + 8 * j);
                if (objc_msgSend(v34, "tv_elementType") == 16 && !objc_msgSend(v34, "tv_imageType"))
                {
                  unint64_t v18 = v31;
                  v35 = [*(id *)(v31 + 2784) sharedInterfaceFactory];
                  v36 = [(_TVProductBannerView *)v13 backgroundImageView];
                  v37 = [v35 _viewFromElement:v34 existingView:v36];

                  [(_TVProductBannerView *)v13 setBackgroundImageView:v37];
                  goto LABEL_31;
                }
              }
              uint64_t v30 = [v24 countByEnumeratingWithState:&v42 objects:v50 count:16];
              if (v30) {
                continue;
              }
              break;
            }
            unint64_t v18 = v31;
LABEL_31:
            v14 = v41;
          }
          goto LABEL_32;
        }
        if (v21 == 16 && (objc_msgSend(v20, "tv_imageType") == 3 || !objc_msgSend(v20, "tv_imageType"))) {
          goto LABEL_18;
        }
      }
      uint64_t v16 = [v14 countByEnumeratingWithState:&v46 objects:v51 count:16];
    }
    while (v16);
  }

  return v13;
}

- (_TVProductBannerView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  v5.receiver = self;
  v5.super_class = (Class)_TVProductBannerView;
  result = -[_TVFocusRedirectView initWithFrame:](&v5, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width);
  if (result) {
    result->_double height = height;
  }
  return result;
}

- (id)preferredFocusEnvironments
{
  v7[1] = *MEMORY[0x263EF8340];
  v3 = [(_TVProductBannerView *)self stackView];
  if (v3)
  {
    v4 = [(_TVProductBannerView *)self stackView];
    v7[0] = v4;
    objc_super v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:v7 count:1];
  }
  else
  {
    objc_super v5 = (void *)MEMORY[0x263EFFA68];
  }

  return v5;
}

- (void)setBackgroundImageView:(id)a3
{
  objc_super v5 = (UIView *)a3;
  p_backgroundImageView = &self->_backgroundImageView;
  backgroundImageView = self->_backgroundImageView;
  double v8 = v5;
  if (backgroundImageView != v5)
  {
    [(UIView *)backgroundImageView removeFromSuperview];
    objc_storeStrong((id *)&self->_backgroundImageView, a3);
    if (*p_backgroundImageView) {
      [(_TVProductBannerView *)self insertSubview:*p_backgroundImageView atIndex:0];
    }
  }
  [(_TVProductBannerView *)self setNeedsLayout];
}

- (void)setInfoListView:(id)a3
{
  objc_super v5 = (UIView *)a3;
  infoListView = self->_infoListView;
  v7 = v5;
  if (infoListView != v5)
  {
    [(UIView *)infoListView removeFromSuperview];
    objc_storeStrong((id *)&self->_infoListView, a3);
    if (self->_infoListView) {
      -[_TVProductBannerView addSubview:](self, "addSubview:");
    }
  }
  [(_TVProductBannerView *)self setNeedsLayout];
}

- (void)setStackView:(id)a3
{
  objc_super v5 = (UIView *)a3;
  stackView = self->_stackView;
  v7 = v5;
  if (stackView != v5)
  {
    [(UIView *)stackView removeFromSuperview];
    objc_storeStrong((id *)&self->_stackView, a3);
    if (self->_stackView) {
      -[_TVProductBannerView addSubview:](self, "addSubview:");
    }
  }
  [(_TVProductBannerView *)self setNeedsLayout];
}

- (void)setHeroImageView:(id)a3
{
  objc_super v5 = (UIView *)a3;
  heroImageView = self->_heroImageView;
  v7 = v5;
  if (heroImageView != v5)
  {
    [(UIView *)heroImageView removeFromSuperview];
    objc_storeStrong((id *)&self->_heroImageView, a3);
    if (self->_heroImageView) {
      -[_TVProductBannerView addSubview:](self, "addSubview:");
    }
  }
  [(_TVProductBannerView *)self setNeedsLayout];
}

- (CGSize)sizeThatFits:(CGSize)result
{
  double height = self->_height;
  result.double height = height;
  return result;
}

- (void)layoutSubviews
{
  v46.receiver = self;
  v46.super_class = (Class)_TVProductBannerView;
  [(_TVFocusRedirectView *)&v46 layoutSubviews];
  [(_TVProductBannerView *)self bounds];
  -[UIView setFrame:](self->_backgroundImageView, "setFrame:");
  [(UIView *)self->_infoListView tv_margin];
  double v45 = v3;
  double v5 = v4;
  double v7 = v6;
  [(UIView *)self->_stackView tv_margin];
  double v44 = v8;
  double v10 = v9;
  double v12 = v11;
  [(UIView *)self->_heroImageView tv_margin];
  v13 = [(UIView *)self->_heroImageView tv_associatedIKViewElement];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v14 = [(UIView *)self->_heroImageView tv_associatedIKViewElement];
  }
  else
  {
    v14 = 0;
  }

  if (objc_msgSend(MEMORY[0x263F1CB60], "userInterfaceLayoutDirectionForSemanticContentAttribute:", -[_TVProductBannerView semanticContentAttribute](self, "semanticContentAttribute")) == 1)
  {
    [(UIView *)self->_stackView tv_itemWidth];
    double v16 = v15;
    if (v15 == 0.0)
    {
      [(_TVProductBannerView *)self bounds];
      double v16 = CGRectGetWidth(v47) - v10 - v12;
    }
    [(UIView *)self->_stackView tv_itemHeight];
    double v41 = v10;
    double v42 = v17;
    double v18 = fmax(v12, v5) + v10 + v16;
    [(UIView *)self->_infoListView tv_itemWidth];
    double v20 = v19;
    [(UIView *)self->_infoListView tv_itemHeight];
    double v22 = v21;
  }
  else
  {
    double v43 = v12;
    [(UIView *)self->_infoListView tv_itemWidth];
    double v24 = v23;
    [(UIView *)self->_infoListView tv_itemHeight];
    double v40 = v25;
    double v26 = v10;
    double v18 = v5;
    double v27 = v24;
    double v28 = v5 + v24;
    double v29 = fmax(v7, v26);
    [(UIView *)self->_stackView tv_itemWidth];
    double v16 = v30;
    if (v30 == 0.0)
    {
      [(_TVProductBannerView *)self bounds];
      double v16 = CGRectGetWidth(v48) - v26 - v43;
    }
    double v41 = v29 + v28;
    [(UIView *)self->_stackView tv_itemHeight];
    double v42 = v31;
    double v20 = v27;
    double v22 = v40;
  }
  [v14 width];
  [v14 height];
  UIRectCenteredXInRect();
  double v33 = v32;
  double v35 = v34;
  double v37 = v36;
  double v39 = v38;
  -[UIView setFrame:](self->_infoListView, "setFrame:", v18, v45, v20, v22);
  -[UIView setFrame:](self->_stackView, "setFrame:", v41, v44, v16, v42);
  -[UIView setFrame:](self->_heroImageView, "setFrame:", v33, v35, v37, v39);
}

- (id)impressionableElementsContainedInDocument:(id)a3
{
  double v4 = (void *)MEMORY[0x263EFF980];
  id v5 = a3;
  double v6 = [v4 array];
  double v7 = [(_TVProductBannerView *)self infoListView];
  double v8 = objc_msgSend(v7, "tv_impressionableElementsForDocument:", v5);
  [v6 addObjectsFromArray:v8];

  double v9 = [(_TVProductBannerView *)self stackView];
  double v10 = objc_msgSend(v9, "tv_impressionableElementsForDocument:", v5);
  [v6 addObjectsFromArray:v10];

  double v11 = [(_TVProductBannerView *)self heroImageView];
  double v12 = objc_msgSend(v11, "tv_impressionableElementsForDocument:", v5);

  [v6 addObjectsFromArray:v12];
  if ([v6 count])
  {
    v13 = [MEMORY[0x263EFF8C0] arrayWithArray:v6];
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (UIView)backgroundImageView
{
  return self->_backgroundImageView;
}

- (UIView)infoListView
{
  return self->_infoListView;
}

- (UIView)stackView
{
  return self->_stackView;
}

- (UIView)heroImageView
{
  return self->_heroImageView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_heroImageView, 0);
  objc_storeStrong((id *)&self->_stackView, 0);
  objc_storeStrong((id *)&self->_infoListView, 0);
  objc_storeStrong((id *)&self->_backgroundImageView, 0);
}

@end