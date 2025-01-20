@interface SKUIPageControlCollectionViewCell
+ (BOOL)prefetchResourcesForViewElement:(id)a3 reason:(int64_t)a4 context:(id)a5;
+ (CGSize)preferredSizeForViewElement:(id)a3 context:(id)a4;
+ (CGSize)sizeThatFitsWidth:(double)a3 viewElement:(id)a4 context:(id)a5;
- (BOOL)setImage:(id)a3 forArtworkRequest:(id)a4 context:(id)a5;
- (BOOL)updateWithItemState:(id)a3 context:(id)a4 animated:(BOOL)a5;
- (SKUIPageControlCollectionViewCell)initWithFrame:(CGRect)a3;
- (id)viewForElementIdentifier:(id)a3;
- (int64_t)currentPage;
- (int64_t)numberOfPages;
- (void)layoutSubviews;
- (void)reloadWithViewElement:(id)a3 width:(double)a4 context:(id)a5;
- (void)setContentInset:(UIEdgeInsets)a3;
- (void)setCurrentPage:(int64_t)a3;
- (void)setNumberOfPages:(int64_t)a3;
@end

@implementation SKUIPageControlCollectionViewCell

- (SKUIPageControlCollectionViewCell)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    -[SKUIPageControlCollectionViewCell initWithFrame:]();
  }
  v13.receiver = self;
  v13.super_class = (Class)SKUIPageControlCollectionViewCell;
  v8 = -[SKUIViewReuseCollectionViewCell initWithFrame:](&v13, sel_initWithFrame_, x, y, width, height);
  if (v8)
  {
    v9 = (UIPageControl *)objc_alloc_init(MEMORY[0x1E4FB1A40]);
    pageControl = v8->_pageControl;
    v8->_pageControl = v9;

    [(UIPageControl *)v8->_pageControl setEnabled:0];
    v11 = [(SKUIPageControlCollectionViewCell *)v8 contentView];
    [v11 addSubview:v8->_pageControl];
  }
  return v8;
}

- (int64_t)currentPage
{
  return [(UIPageControl *)self->_pageControl currentPage];
}

- (int64_t)numberOfPages
{
  return [(UIPageControl *)self->_pageControl numberOfPages];
}

- (void)setCurrentPage:(int64_t)a3
{
}

- (void)setNumberOfPages:(int64_t)a3
{
  if ([(UIPageControl *)self->_pageControl numberOfPages] != a3)
  {
    [(UIPageControl *)self->_pageControl setNumberOfPages:a3];
    [(SKUIPageControlCollectionViewCell *)self setNeedsLayout];
  }
}

+ (BOOL)prefetchResourcesForViewElement:(id)a3 reason:(int64_t)a4 context:(id)a5
{
  return 0;
}

+ (CGSize)preferredSizeForViewElement:(id)a3 context:(id)a4
{
  double v4 = *MEMORY[0x1E4F1DB30];
  double v5 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  result.double height = v5;
  result.double width = v4;
  return result;
}

+ (CGSize)sizeThatFitsWidth:(double)a3 viewElement:(id)a4 context:(id)a5
{
  double v5 = 37.0;
  result.double height = v5;
  result.double width = a3;
  return result;
}

- (void)reloadWithViewElement:(id)a3 width:(double)a4 context:(id)a5
{
  objc_msgSend(a3, "style", a4);
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  self->_pageControlPosition = [v10 elementPosition];
  v6 = [v10 ikColor];
  v7 = [v6 color];

  if (!v7)
  {
    v7 = [MEMORY[0x1E4FB1618] darkGrayColor];
  }
  [(UIPageControl *)self->_pageControl setCurrentPageIndicatorTintColor:v7];
  pageControl = self->_pageControl;
  v9 = [v7 colorWithAlphaComponent:0.33];
  [(UIPageControl *)pageControl setPageIndicatorTintColor:v9];

  [(SKUIPageControlCollectionViewCell *)self setNeedsLayout];
}

- (void)setContentInset:(UIEdgeInsets)a3
{
  if (self->_contentInset.left != a3.left
    || self->_contentInset.top != a3.top
    || self->_contentInset.right != a3.right
    || self->_contentInset.bottom != a3.bottom)
  {
    self->_contentInset = a3;
    [(SKUIPageControlCollectionViewCell *)self setNeedsLayout];
  }
}

- (BOOL)setImage:(id)a3 forArtworkRequest:(id)a4 context:(id)a5
{
  return 0;
}

- (BOOL)updateWithItemState:(id)a3 context:(id)a4 animated:(BOOL)a5
{
  return 0;
}

- (id)viewForElementIdentifier:(id)a3
{
  return 0;
}

- (void)layoutSubviews
{
  v3 = [(SKUIPageControlCollectionViewCell *)self contentView];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;

  v8 = (double *)MEMORY[0x1E4F1DB28];
  -[UIPageControl sizeThatFits:](self->_pageControl, "sizeThatFits:", v5, v7);
  double v11 = v9;
  double v12 = v10;
  unint64_t pageControlPosition = self->_pageControlPosition;
  if (pageControlPosition > 9)
  {
    double left = *v8;
  }
  else if (((1 << pageControlPosition) & 0xF) != 0)
  {
    float v15 = (v5 - v9) * 0.5;
    double left = floorf(v15);
  }
  else if (((1 << pageControlPosition) & 0x150) != 0)
  {
    double left = self->_contentInset.left;
  }
  else
  {
    double left = v5 - v9 - self->_contentInset.right;
  }
  if (pageControlPosition > 9)
  {
    double top = v8[1];
  }
  else if (((1 << pageControlPosition) & 0x33) != 0)
  {
    float v17 = (v7 - v10) * 0.5;
    double top = floorf(v17);
  }
  else if (((1 << pageControlPosition) & 0xC4) != 0)
  {
    double top = self->_contentInset.top;
  }
  else
  {
    double top = v7 - v10 - self->_contentInset.bottom;
  }
  pageControl = self->_pageControl;

  -[UIPageControl setFrame:](pageControl, "setFrame:", left, top, v11, v12);
}

- (void).cxx_destruct
{
}

- (void)initWithFrame:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "-[SKUIPageControlCollectionViewCell initWithFrame:]";
}

@end