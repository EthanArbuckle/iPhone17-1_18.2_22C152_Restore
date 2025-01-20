@interface PBUIImageSlotView
- (CGSize)_pointSize;
- (PBUIImageSlot)imageSlot;
- (void)_updateWithImage:(id)a3;
- (void)deferredImageSlot:(id)a3 didUpdateImage:(id)a4;
- (void)layoutSubviews;
- (void)setImageSlot:(id)a3;
@end

@implementation PBUIImageSlotView

- (void)setImageSlot:(id)a3
{
  v5 = (PBUIImageSlot *)a3;
  p_imageSlot = &self->_imageSlot;
  imageSlot = self->_imageSlot;
  if (imageSlot != v5)
  {
    v13 = v5;
    v8 = [(PBUIImageSlot *)imageSlot _deferredImageSlot];
    [v8 removeImageSlotObserver:self];

    objc_storeStrong((id *)&self->_imageSlot, a3);
    v9 = [(PBUIImageSlot *)*p_imageSlot _deferredImageSlot];
    [v9 addImageSlotObserver:self];
    v10 = [v9 fallbackColor];
    [(PBUIImageSlotView *)self setBackgroundColor:v10];

    v11 = [(PBUIImageSlot *)*p_imageSlot image];

    if (v11)
    {
      imageView = [(PBUIImageSlot *)*p_imageSlot image];
      [(PBUIImageSlotView *)self _updateWithImage:imageView];
    }
    else
    {
      [(UIImageView *)self->_imageView removeFromSuperview];
      imageView = self->_imageView;
      self->_imageView = 0;
    }

    [(PBUIImageSlotView *)self invalidateIntrinsicContentSize];
    [(PBUIImageSlotView *)self setNeedsLayout];

    v5 = v13;
  }
  MEMORY[0x1F41817F8](imageSlot, v5);
}

- (void)layoutSubviews
{
  v5.receiver = self;
  v5.super_class = (Class)PBUIImageSlotView;
  [(PBUIImageSlotView *)&v5 layoutSubviews];
  v3 = [(PBUIImageSlot *)self->_imageSlot image];
  v4 = [(UIImageView *)self->_imageView image];

  if (v4 != v3) {
    [(PBUIImageSlotView *)self _updateWithImage:v3];
  }
}

- (void)deferredImageSlot:(id)a3 didUpdateImage:(id)a4
{
  if (self->_imageSlot == a3) {
    [(PBUIImageSlotView *)self _updateWithImage:a4];
  }
}

- (void)_updateWithImage:(id)a3
{
  imageView = self->_imageView;
  if (!imageView)
  {
    id v5 = objc_alloc(MEMORY[0x1E4F42AA0]);
    [(PBUIImageSlotView *)self bounds];
    v6 = (UIImageView *)objc_msgSend(v5, "initWithFrame:");
    v7 = self->_imageView;
    self->_imageView = v6;

    [(UIImageView *)self->_imageView setAutoresizingMask:18];
    [(PBUIImageSlotView *)self addSubview:self->_imageView];
    imageView = self->_imageView;
  }
  v8 = [(PBUIImageSlot *)self->_imageSlot image];
  [(UIImageView *)imageView setImage:v8];

  [(PBUIImageSlotView *)self invalidateIntrinsicContentSize];
  [(PBUIImageSlotView *)self setNeedsLayout];
}

- (CGSize)_pointSize
{
  v2 = [(PBUIImageSlot *)self->_imageSlot image];
  [v2 size];
  double v4 = v3;
  double v6 = v5;

  double v7 = v4;
  double v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (PBUIImageSlot)imageSlot
{
  return self->_imageSlot;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageSlot, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
}

@end