@interface SUUIPageControlCollectionViewCell
+ (BOOL)prefetchResourcesForViewElement:(id)a3 reason:(int64_t)a4 context:(id)a5;
+ (CGSize)preferredSizeForViewElement:(id)a3 context:(id)a4;
+ (CGSize)sizeThatFitsWidth:(double)a3 viewElement:(id)a4 context:(id)a5;
- (BOOL)setImage:(id)a3 forArtworkRequest:(id)a4 context:(id)a5;
- (BOOL)updateWithItemState:(id)a3 context:(id)a4 animated:(BOOL)a5;
- (SUUIPageControlCollectionViewCell)initWithFrame:(CGRect)a3;
- (id)viewForElementIdentifier:(id)a3;
- (int64_t)currentPage;
- (int64_t)numberOfPages;
- (void)layoutSubviews;
- (void)reloadWithViewElement:(id)a3 width:(double)a4 context:(id)a5;
- (void)setContentInset:(UIEdgeInsets)a3;
- (void)setCurrentPage:(int64_t)a3;
- (void)setNumberOfPages:(int64_t)a3;
@end

@implementation SUUIPageControlCollectionViewCell

- (SUUIPageControlCollectionViewCell)initWithFrame:(CGRect)a3
{
  v8.receiver = self;
  v8.super_class = (Class)SUUIPageControlCollectionViewCell;
  v3 = -[SUUIViewReuseCollectionViewCell initWithFrame:](&v8, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (UIPageControl *)objc_alloc_init(MEMORY[0x263F829F0]);
    pageControl = v3->_pageControl;
    v3->_pageControl = v4;

    [(UIPageControl *)v3->_pageControl setEnabled:0];
    v6 = [(SUUIPageControlCollectionViewCell *)v3 contentView];
    [v6 addSubview:v3->_pageControl];
  }
  return v3;
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
    [(SUUIPageControlCollectionViewCell *)self setNeedsLayout];
  }
}

+ (BOOL)prefetchResourcesForViewElement:(id)a3 reason:(int64_t)a4 context:(id)a5
{
  return 0;
}

+ (CGSize)preferredSizeForViewElement:(id)a3 context:(id)a4
{
  double v4 = *MEMORY[0x263F001B0];
  double v5 = *(double *)(MEMORY[0x263F001B0] + 8);
  result.height = v5;
  result.width = v4;
  return result;
}

+ (CGSize)sizeThatFitsWidth:(double)a3 viewElement:(id)a4 context:(id)a5
{
  double v5 = 37.0;
  result.height = v5;
  result.width = a3;
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
    v7 = [MEMORY[0x263F825C8] darkGrayColor];
  }
  [(UIPageControl *)self->_pageControl setCurrentPageIndicatorTintColor:v7];
  pageControl = self->_pageControl;
  v9 = [v7 colorWithAlphaComponent:0.33];
  [(UIPageControl *)pageControl setPageIndicatorTintColor:v9];

  [(SUUIPageControlCollectionViewCell *)self setNeedsLayout];
}

- (void)setContentInset:(UIEdgeInsets)a3
{
  if (self->_contentInset.left != a3.left
    || self->_contentInset.top != a3.top
    || self->_contentInset.right != a3.right
    || self->_contentInset.bottom != a3.bottom)
  {
    self->_contentInset = a3;
    [(SUUIPageControlCollectionViewCell *)self setNeedsLayout];
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
  v3 = [(SUUIPageControlCollectionViewCell *)self contentView];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;

  objc_super v8 = (double *)MEMORY[0x263F001A8];
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

@end