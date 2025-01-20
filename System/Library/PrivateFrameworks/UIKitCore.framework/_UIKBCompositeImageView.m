@interface _UIKBCompositeImageView
- (CGSize)imageSize;
- (NSArray)imageViews;
- (void)layoutSubviews;
- (void)setImageSize:(CGSize)a3;
- (void)setImageViews:(id)a3;
@end

@implementation _UIKBCompositeImageView

- (void)setImageViews:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  objc_storeStrong((id *)&self->_imageViews, a3);
  v6 = [(UIView *)self subviews];
  [v6 makeObjectsPerformSelector:sel_removeFromSuperview];

  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v7 = self->_imageViews;
  uint64_t v8 = [(NSArray *)v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v13;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v13 != v10) {
          objc_enumerationMutation(v7);
        }
        -[UIView addSubview:](self, "addSubview:", *(void *)(*((void *)&v12 + 1) + 8 * v11++), (void)v12);
      }
      while (v9 != v11);
      uint64_t v9 = [(NSArray *)v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v9);
  }
}

- (void)layoutSubviews
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  v27.receiver = self;
  v27.super_class = (Class)_UIKBCompositeImageView;
  [(UIView *)&v27 layoutSubviews];
  [(UIView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  [(_UIKBCompositeImageView *)self imageSize];
  double v12 = v11;
  [(_UIKBCompositeImageView *)self imageSize];
  double v14 = v13;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v15 = self->_imageViews;
  uint64_t v16 = [(NSArray *)v15 countByEnumeratingWithState:&v23 objects:v28 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    double v18 = v4 + (v8 - v12) * 0.5;
    double v19 = v6 + (v10 - v14) * 0.5;
    uint64_t v20 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v17; ++i)
      {
        if (*(void *)v24 != v20) {
          objc_enumerationMutation(v15);
        }
        v22 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        objc_msgSend(v22, "setFrame:", v18, v19, v12, v14, (void)v23);
        [v22 setContentMode:1];
      }
      uint64_t v17 = [(NSArray *)v15 countByEnumeratingWithState:&v23 objects:v28 count:16];
    }
    while (v17);
  }
}

- (CGSize)imageSize
{
  double width = self->_imageSize.width;
  double height = self->_imageSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setImageSize:(CGSize)a3
{
  self->_imageSize = a3;
}

- (NSArray)imageViews
{
  return self->_imageViews;
}

- (void).cxx_destruct
{
}

@end