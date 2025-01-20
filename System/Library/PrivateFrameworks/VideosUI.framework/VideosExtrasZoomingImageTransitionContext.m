@interface VideosExtrasZoomingImageTransitionContext
- (BOOL)isInteractive;
- (VideosExtrasBorderedImageView)zoomingImageView;
- (VideosExtrasZoomingImageTransitionContext)initWithZoomingImageView:(id)a3 itemIndex:(unint64_t)a4 appearState:(unint64_t)a5 isInteractive:(BOOL)a6;
- (unint64_t)appearState;
- (unint64_t)itemIndex;
- (void)setAppearState:(unint64_t)a3;
- (void)setInteractive:(BOOL)a3;
- (void)setItemIndex:(unint64_t)a3;
- (void)setZoomingImageView:(id)a3;
@end

@implementation VideosExtrasZoomingImageTransitionContext

- (VideosExtrasZoomingImageTransitionContext)initWithZoomingImageView:(id)a3 itemIndex:(unint64_t)a4 appearState:(unint64_t)a5 isInteractive:(BOOL)a6
{
  BOOL v6 = a6;
  id v10 = a3;
  v14.receiver = self;
  v14.super_class = (Class)VideosExtrasZoomingImageTransitionContext;
  v11 = [(VideosExtrasZoomingImageTransitionContext *)&v14 init];
  v12 = v11;
  if (v11)
  {
    [(VideosExtrasZoomingImageTransitionContext *)v11 setZoomingImageView:v10];
    [(VideosExtrasZoomingImageTransitionContext *)v12 setItemIndex:a4];
    [(VideosExtrasZoomingImageTransitionContext *)v12 setAppearState:a5];
    [(VideosExtrasZoomingImageTransitionContext *)v12 setInteractive:v6];
  }

  return v12;
}

- (VideosExtrasBorderedImageView)zoomingImageView
{
  return self->_zoomingImageView;
}

- (void)setZoomingImageView:(id)a3
{
}

- (unint64_t)itemIndex
{
  return self->_itemIndex;
}

- (void)setItemIndex:(unint64_t)a3
{
  self->_itemIndex = a3;
}

- (unint64_t)appearState
{
  return self->_appearState;
}

- (void)setAppearState:(unint64_t)a3
{
  self->_appearState = a3;
}

- (BOOL)isInteractive
{
  return self->_interactive;
}

- (void)setInteractive:(BOOL)a3
{
  self->_interactive = a3;
}

- (void).cxx_destruct
{
}

@end