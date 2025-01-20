@interface VideosExtrasCarouselCollectionView
- (VideosExtrasCarouselCollectionViewDelegate)carouselCollectionViewDelegate;
- (void)didAddSubview:(id)a3;
- (void)setCarouselCollectionViewDelegate:(id)a3;
@end

@implementation VideosExtrasCarouselCollectionView

- (void)didAddSubview:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)VideosExtrasCarouselCollectionView;
  [(VideosExtrasCarouselCollectionView *)&v5 didAddSubview:a3];
  v4 = [(VideosExtrasCarouselCollectionView *)self carouselCollectionViewDelegate];
  if (objc_opt_respondsToSelector()) {
    [v4 subviewsDidChangeForCarouselCollectionView:self];
  }
}

- (VideosExtrasCarouselCollectionViewDelegate)carouselCollectionViewDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_carouselCollectionViewDelegate);
  return (VideosExtrasCarouselCollectionViewDelegate *)WeakRetained;
}

- (void)setCarouselCollectionViewDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end