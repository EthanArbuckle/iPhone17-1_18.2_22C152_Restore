@interface BKPictureBookPageContainerView
- (BKPageScrollerPageView)pageScrollerPageView;
- (BKPictureBookPageContainerView)init;
- (BOOL)isLeftPage;
- (BOOL)isRightPage;
- (BOOL)useRoundedCornerRadius;
- (unint64_t)pageNumber;
- (void)layoutSubviews;
- (void)setIsLeftPage:(BOOL)a3;
- (void)setIsRightPage:(BOOL)a3;
- (void)setPageNumber:(unint64_t)a3;
- (void)setPageScrollerPageView:(id)a3;
- (void)setUseRoundedCornerRadius:(BOOL)a3;
@end

@implementation BKPictureBookPageContainerView

- (BKPictureBookPageContainerView)init
{
  v5.receiver = self;
  v5.super_class = (Class)BKPictureBookPageContainerView;
  v2 = [(BKPictureBookPageContainerView *)&v5 init];
  v3 = v2;
  if (v2) {
    [(BKPictureBookPageContainerView *)v2 setUseRoundedCornerRadius:1];
  }
  return v3;
}

- (void)layoutSubviews
{
  v10.receiver = self;
  v10.super_class = (Class)BKPictureBookPageContainerView;
  [(BKPictureBookPageContainerView *)&v10 layoutSubviews];
  if ([(BKPictureBookPageContainerView *)self useRoundedCornerRadius])
  {
    v3 = [(BKPictureBookPageContainerView *)self layer];
    [v3 setCornerRadius:6.0];

    v4 = [(BKPictureBookPageContainerView *)self layer];
    [v4 setMasksToBounds:1];

    if ([(BKPictureBookPageContainerView *)self isLeftPage])
    {
      objc_super v5 = [(BKPictureBookPageContainerView *)self layer];
      v6 = v5;
      uint64_t v7 = 5;
    }
    else
    {
      unsigned int v8 = [(BKPictureBookPageContainerView *)self isRightPage];
      objc_super v5 = [(BKPictureBookPageContainerView *)self layer];
      v6 = v5;
      if (v8) {
        uint64_t v7 = 10;
      }
      else {
        uint64_t v7 = 15;
      }
    }
    [v5 setMaskedCorners:v7];
  }
  v9 = +[UIColor whiteColor];
  [(BKPictureBookPageContainerView *)self setBackgroundColor:v9];
}

- (unint64_t)pageNumber
{
  return self->_pageNumber;
}

- (void)setPageNumber:(unint64_t)a3
{
  self->_pageNumber = a3;
}

- (BKPageScrollerPageView)pageScrollerPageView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_pageScrollerPageView);

  return (BKPageScrollerPageView *)WeakRetained;
}

- (void)setPageScrollerPageView:(id)a3
{
}

- (BOOL)isLeftPage
{
  return self->_isLeftPage;
}

- (void)setIsLeftPage:(BOOL)a3
{
  self->_isLeftPage = a3;
}

- (BOOL)isRightPage
{
  return self->_isRightPage;
}

- (void)setIsRightPage:(BOOL)a3
{
  self->_isRightPage = a3;
}

- (BOOL)useRoundedCornerRadius
{
  return self->_useRoundedCornerRadius;
}

- (void)setUseRoundedCornerRadius:(BOOL)a3
{
  self->_useRoundedCornerRadius = a3;
}

- (void).cxx_destruct
{
}

@end