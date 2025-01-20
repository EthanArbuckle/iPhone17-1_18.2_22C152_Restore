@interface SKUISlideshowGalleryBarView
- (SKUISlideshowGalleryBarView)initWithFrame:(CGRect)a3;
- (SKUISlideshowGalleryBarViewDelegate)delegate;
- (id)_newImageView;
- (id)imageAtIndex:(int64_t)a3;
- (unint64_t)numberOfImages;
- (unint64_t)selectedImageIndex;
- (void)_handleTouch:(id)a3 withEvent:(id)a4;
- (void)layoutSubviews;
- (void)setDelegate:(id)a3;
- (void)setImage:(id)a3 atIndex:(int64_t)a4;
- (void)setNumberOfImages:(unint64_t)a3;
- (void)setSelectedImageIndex:(unint64_t)a3;
- (void)touchesBegan:(id)a3 withEvent:(id)a4;
- (void)touchesCancelled:(id)a3 withEvent:(id)a4;
- (void)touchesEnded:(id)a3 withEvent:(id)a4;
- (void)touchesMoved:(id)a3 withEvent:(id)a4;
@end

@implementation SKUISlideshowGalleryBarView

- (SKUISlideshowGalleryBarView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    -[SKUISlideshowGalleryBarView initWithFrame:]();
  }
  v18.receiver = self;
  v18.super_class = (Class)SKUISlideshowGalleryBarView;
  v8 = -[SKUISlideshowGalleryBarView initWithFrame:](&v18, sel_initWithFrame_, x, y, width, height);
  v9 = v8;
  if (v8)
  {
    v8->_numberOfImages = 0;
    v8->_selectedImageIndedouble x = 0;
    id v10 = objc_alloc(MEMORY[0x1E4FB1DF0]);
    [(SKUISlideshowGalleryBarView *)v9 bounds];
    uint64_t v11 = objc_msgSend(v10, "initWithFrame:");
    toolbarView = v9->_toolbarView;
    v9->_toolbarView = (UIToolbar *)v11;

    [(UIToolbar *)v9->_toolbarView setBarStyle:2];
    [(SKUISlideshowGalleryBarView *)v9 addSubview:v9->_toolbarView];
    v13 = (UIView *)objc_alloc_init(MEMORY[0x1E4FB1EB0]);
    imageViewsContainer = v9->_imageViewsContainer;
    v9->_imageViewsContainer = v13;

    [(UIToolbar *)v9->_toolbarView addSubview:v9->_imageViewsContainer];
    v15 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    imageViews = v9->_imageViews;
    v9->_imageViews = v15;
  }
  return v9;
}

- (void)layoutSubviews
{
  v12.receiver = self;
  v12.super_class = (Class)SKUISlideshowGalleryBarView;
  [(SKUISlideshowGalleryBarView *)&v12 layoutSubviews];
  [(SKUISlideshowGalleryBarView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  -[UIToolbar setFrame:](self->_toolbarView, "setFrame:");
  unint64_t v7 = [(NSMutableArray *)self->_imageViews count];
  -[UIView setFrame:](self->_imageViewsContainer, "setFrame:", v4 * 0.5 - (v6 / 3.0 * 1.33333337 + 1.0) * (double)v7 * 0.5, 0.0, (v6 / 3.0 * 1.33333337 + 1.0) * (double)v7, v6);
  imageViewsContainer = self->_imageViewsContainer;
  v9 = [MEMORY[0x1E4FB1618] clearColor];
  [(UIView *)imageViewsContainer setBackgroundColor:v9];

  imageViews = self->_imageViews;
  v11[1] = 3221225472;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[2] = __45__SKUISlideshowGalleryBarView_layoutSubviews__block_invoke;
  v11[3] = &__block_descriptor_56_e28_v32__0__UIImageView_8Q16_B24l;
  *(double *)&v11[4] = v6 / 3.0 * 1.33333337;
  *(double *)&v11[5] = v6 / 3.0;
  *(double *)&v11[6] = v6 * 0.5 - v6 / 3.0 * 0.5;
  [(NSMutableArray *)imageViews enumerateObjectsUsingBlock:v11];
}

void __45__SKUISlideshowGalleryBarView_layoutSubviews__block_invoke(double *a1, void *a2, unint64_t a3)
{
  id v5 = a2;
  double v6 = v5;
  double v7 = a1[4];
  double v8 = a1[5];
  double v9 = a1[6];
  memset(&v11[1], 0, sizeof(CGAffineTransform));
  if (v5) {
    [v5 transform];
  }
  v11[0] = v11[1];
  if (CGAffineTransformIsIdentity(v11))
  {
    objc_msgSend(v6, "setFrame:", (v7 + 1.0) * (double)a3, v9, v7, v8);
  }
  else
  {
    long long v10 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
    *(_OWORD *)&v11[0].a = *MEMORY[0x1E4F1DAB8];
    *(_OWORD *)&v11[0].c = v10;
    *(_OWORD *)&v11[0].tdouble x = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
    [v6 setTransform:v11];
    objc_msgSend(v6, "setFrame:", (v7 + 1.0) * (double)a3, v9, v7, v8);
    v11[0] = v11[1];
    [v6 setTransform:v11];
  }
}

- (void)setNumberOfImages:(unint64_t)a3
{
  unint64_t v5 = [(NSMutableArray *)self->_imageViews count];
  unint64_t v6 = a3 - v5;
  if (a3 <= v5)
  {
    if (a3 < v5)
    {
      unint64_t v9 = v5;
      do
      {
        long long v10 = [(NSMutableArray *)self->_imageViews objectAtIndexedSubscript:a3];
        [v10 removeFromSuperview];
        [(NSMutableArray *)self->_imageViews removeObjectAtIndex:a3];

        ++a3;
      }
      while (v9 != a3);
    }
  }
  else
  {
    uint64_t v7 = 0;
    do
    {
      id v8 = [(SKUISlideshowGalleryBarView *)self _newImageView];
      [v8 setTag:v7];
      [(NSMutableArray *)self->_imageViews addObject:v8];
      [(UIView *)self->_imageViewsContainer addSubview:v8];

      ++v7;
    }
    while (v6 != v7);
  }

  [(SKUISlideshowGalleryBarView *)self setNeedsLayout];
}

- (void)setSelectedImageIndex:(unint64_t)a3
{
  if ([(NSMutableArray *)self->_imageViews count] > a3)
  {
    unint64_t v5 = [(NSMutableArray *)self->_imageViews objectAtIndexedSubscript:self->_selectedImageIndex];
    long long v6 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
    v9[0] = *MEMORY[0x1E4F1DAB8];
    v9[1] = v6;
    v9[2] = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
    [v5 setTransform:v9];
    uint64_t v7 = [(NSMutableArray *)self->_imageViews objectAtIndexedSubscript:a3];
    CGAffineTransformMakeScale(&v8, 1.5, 1.5);
    [v7 setTransform:&v8];
    [(UIView *)self->_imageViewsContainer bringSubviewToFront:v7];
    self->_selectedImageIndedouble x = a3;
  }
}

- (id)imageAtIndex:(int64_t)a3
{
  if ([(NSMutableArray *)self->_imageViews count] > (unint64_t)a3
    && ([(NSMutableArray *)self->_imageViews objectAtIndexedSubscript:a3],
        unint64_t v5 = objc_claimAutoreleasedReturnValue(),
        v5,
        v5))
  {
    long long v6 = [(NSMutableArray *)self->_imageViews objectAtIndexedSubscript:a3];
    uint64_t v7 = [v6 image];
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

- (void)setImage:(id)a3 atIndex:(int64_t)a4
{
  id v9 = a3;
  if ([(NSMutableArray *)self->_imageViews count] > (unint64_t)a4)
  {
    long long v6 = [(NSMutableArray *)self->_imageViews objectAtIndexedSubscript:a4];

    if (!v6)
    {
      id v7 = [(SKUISlideshowGalleryBarView *)self _newImageView];
      [v7 setTag:a4];
      [(NSMutableArray *)self->_imageViews setObject:v7 atIndexedSubscript:a4];
    }
    CGAffineTransform v8 = [(NSMutableArray *)self->_imageViews objectAtIndexedSubscript:a4];
    [v8 setImage:v9];
  }
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  id v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SKUISlideshowGalleryBarView;
  id v7 = a4;
  [(SKUISlideshowGalleryBarView *)&v11 touchesBegan:v6 withEvent:v7];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  if (WeakRetained)
  {
    id v9 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v9, "userBeganInteractingWithGalleryBarView:", self, v11.receiver, v11.super_class);
  }
  long long v10 = objc_msgSend(v6, "anyObject", v11.receiver, v11.super_class);
  [(SKUISlideshowGalleryBarView *)self _handleTouch:v10 withEvent:v7];
}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)SKUISlideshowGalleryBarView;
  id v6 = a4;
  id v7 = a3;
  [(SKUISlideshowGalleryBarView *)&v9 touchesMoved:v7 withEvent:v6];
  CGAffineTransform v8 = objc_msgSend(v7, "anyObject", v9.receiver, v9.super_class);

  [(SKUISlideshowGalleryBarView *)self _handleTouch:v8 withEvent:v6];
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)SKUISlideshowGalleryBarView;
  [(SKUISlideshowGalleryBarView *)&v7 touchesEnded:a3 withEvent:a4];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  if (WeakRetained)
  {
    id v6 = objc_loadWeakRetained((id *)&self->_delegate);
    [v6 userStoppedInteractingWithGalleryBarView:self];
  }
}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)SKUISlideshowGalleryBarView;
  [(SKUISlideshowGalleryBarView *)&v7 touchesCancelled:a3 withEvent:a4];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  if (WeakRetained)
  {
    id v6 = objc_loadWeakRetained((id *)&self->_delegate);
    [v6 userStoppedInteractingWithGalleryBarView:self];
  }
}

- (id)_newImageView
{
  id v2 = objc_alloc_init(MEMORY[0x1E4FB1838]);
  double v3 = [MEMORY[0x1E4FB1618] colorWithWhite:0.75 alpha:1.0];
  [v2 setBackgroundColor:v3];

  [v2 setContentMode:2];
  [v2 setClipsToBounds:1];
  [v2 setUserInteractionEnabled:1];
  double v4 = [v2 layer];
  id v5 = [MEMORY[0x1E4FB1618] whiteColor];
  objc_msgSend(v4, "setBorderColor:", objc_msgSend(v5, "CGColor"));

  id v6 = [v2 layer];
  [v6 setBorderWidth:1.0];

  objc_super v7 = [v2 layer];
  id v8 = [MEMORY[0x1E4FB1618] blackColor];
  objc_msgSend(v7, "setShadowColor:", objc_msgSend(v8, "CGColor"));

  objc_super v9 = [v2 layer];
  objc_msgSend(v9, "setShadowOffset:", *MEMORY[0x1E4F1DB30], *(double *)(MEMORY[0x1E4F1DB30] + 8));

  long long v10 = [v2 layer];
  LODWORD(v11) = 1061997773;
  [v10 setShadowOpacity:v11];

  objc_super v12 = [v2 layer];
  [v12 setShadowRadius:2.0];

  return v2;
}

- (void)_handleTouch:(id)a3 withEvent:(id)a4
{
  id v17 = a3;
  id v6 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  if (WeakRetained)
  {
    [v17 locationInView:self];
    double v9 = v8;
    double v11 = v10;
    if ([(NSMutableArray *)self->_imageViews count])
    {
      objc_super v12 = [(NSMutableArray *)self->_imageViews objectAtIndexedSubscript:0];
      [v12 center];
      double v11 = v13;
    }
    v14 = -[SKUISlideshowGalleryBarView hitTest:withEvent:](self, "hitTest:withEvent:", v6, v9, v11);
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v15 = [v14 tag];
      id v16 = objc_loadWeakRetained((id *)&self->_delegate);
      [v16 galleryBarView:self didSelectIndex:v15];
    }
  }
}

- (SKUISlideshowGalleryBarViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (SKUISlideshowGalleryBarViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (unint64_t)numberOfImages
{
  return self->_numberOfImages;
}

- (unint64_t)selectedImageIndex
{
  return self->_selectedImageIndex;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_imageViews, 0);
  objc_storeStrong((id *)&self->_imageViewsContainer, 0);

  objc_storeStrong((id *)&self->_toolbarView, 0);
}

- (void)initWithFrame:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "-[SKUISlideshowGalleryBarView initWithFrame:]";
}

@end