@interface NUArticleContainerTitleView
- (NUArticleContainerTitleView)initWithFrame:(CGRect)a3;
- (NUPageStyle)pageStyle;
- (NUTitleView)titleView;
- (void)applyPageStyle:(id)a3;
- (void)layoutSubviews;
- (void)setPageStyle:(id)a3;
@end

@implementation NUArticleContainerTitleView

- (NUArticleContainerTitleView)initWithFrame:(CGRect)a3
{
  v8.receiver = self;
  v8.super_class = (Class)NUArticleContainerTitleView;
  v3 = -[NUArticleContainerTitleView initWithFrame:](&v8, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = objc_alloc_init(NUTitleViewStyler);
    v5 = [[NUTitleView alloc] initWithStyler:v4];
    titleView = v3->_titleView;
    v3->_titleView = v5;

    [(NUArticleContainerTitleView *)v3 addSubview:v3->_titleView];
  }
  return v3;
}

- (void)layoutSubviews
{
  v12.receiver = self;
  v12.super_class = (Class)NUArticleContainerTitleView;
  [(NUArticleContainerTitleView *)&v12 layoutSubviews];
  [(NUArticleContainerTitleView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  v11 = [(NUArticleContainerTitleView *)self titleView];
  objc_msgSend(v11, "setFrame:", v4, v6, v8, v10);
}

- (void)applyPageStyle:(id)a3
{
  id v19 = a3;
  uint64_t v4 = [(NUArticleContainerTitleView *)self pageStyle];
  if (!v4
    || (double v5 = (void *)v4,
        [(NUArticleContainerTitleView *)self pageStyle],
        double v6 = objc_claimAutoreleasedReturnValue(),
        char v7 = [v19 isEqual:v6],
        v6,
        v5,
        (v7 & 1) == 0))
  {
    [(NUArticleContainerTitleView *)self setPageStyle:v19];
    double v8 = [(NUArticleContainerTitleView *)self pageStyle];
    double v9 = [v8 titleImage];

    if (v9)
    {
      double v10 = [NUTitleViewUpdate alloc];
      v11 = [(NUArticleContainerTitleView *)self pageStyle];
      objc_super v12 = [v11 titleImage];
      uint64_t v13 = [(NUTitleViewUpdate *)v10 initWithImage:v12];
    }
    else
    {
      v14 = [(NUArticleContainerTitleView *)self pageStyle];
      v15 = [v14 title];

      if (!v15)
      {
        v17 = objc_alloc_init(NUTitleViewUpdate);
        goto LABEL_8;
      }
      v16 = [NUTitleViewUpdate alloc];
      v11 = [(NUArticleContainerTitleView *)self pageStyle];
      objc_super v12 = [v11 title];
      uint64_t v13 = [(NUTitleViewUpdate *)v16 initWithText:v12 styleType:0];
    }
    v17 = (NUTitleViewUpdate *)v13;

LABEL_8:
    [(NUTitleViewUpdate *)v17 setCancelPendingUpdates:1];
    [(NUTitleViewUpdate *)v17 setSpeakAccessibilityTitleWhenDisplayed:0];
    v18 = [(NUArticleContainerTitleView *)self titleView];
    [v18 applyTitleViewUpdate:v17 animation:0];
  }
}

- (NUTitleView)titleView
{
  return self->_titleView;
}

- (NUPageStyle)pageStyle
{
  return self->_pageStyle;
}

- (void)setPageStyle:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pageStyle, 0);

  objc_storeStrong((id *)&self->_titleView, 0);
}

@end