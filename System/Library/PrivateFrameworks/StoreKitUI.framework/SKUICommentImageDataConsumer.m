@interface SKUICommentImageDataConsumer
- (id)_scaledImageWithBounds:(CGSize)a3 contentRect:(CGRect)a4 drawBlock:(id)a5;
- (id)completionBlock;
- (id)imageForImage:(id)a3;
- (void)setCompletionBlock:(id)a3;
@end

@implementation SKUICommentImageDataConsumer

- (id)imageForImage:(id)a3
{
  id v4 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v5 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v5) {
        -[SKUICommentImageDataConsumer imageForImage:](v5, v6, v7, v8, v9, v10, v11, v12);
      }
    }
  }
  [(SKUIStyledImageDataConsumer *)self imageSize];
  double v14 = v13;
  double v16 = v15;
  [(SKUIStyledImageDataConsumer *)self imageSize];
  double v18 = v17;
  [(SKUIStyledImageDataConsumer *)self imageSize];
  double v20 = v19;
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __46__SKUICommentImageDataConsumer_imageForImage___block_invoke;
  v26[3] = &unk_1E6426D30;
  id v21 = v4;
  id v27 = v21;
  v22 = -[SKUICommentImageDataConsumer _scaledImageWithBounds:contentRect:drawBlock:](self, "_scaledImageWithBounds:contentRect:drawBlock:", v26, v14, v16, 0.0, 0.0, v18, v20);
  v23 = [v22 imageWithRenderingMode:1];

  completionBlock = (void (**)(id, void *, void))self->_completionBlock;
  if (completionBlock) {
    completionBlock[2](completionBlock, v23, 0);
  }

  return v23;
}

uint64_t __46__SKUICommentImageDataConsumer_imageForImage___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "drawInRect:");
}

- (id)_scaledImageWithBounds:(CGSize)a3 contentRect:(CGRect)a4 drawBlock:(id)a5
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  CGFloat v9 = a3.height;
  CGFloat v10 = a3.width;
  uint64_t v11 = (void *)MEMORY[0x1E4FB1BA8];
  uint64_t v12 = (void (**)(void, double, double, double, double))a5;
  double v13 = [v11 mainScreen];
  [v13 scale];
  CGFloat v15 = v14;
  v19.double width = v10;
  v19.double height = v9;
  UIGraphicsBeginImageContextWithOptions(v19, 1, v15);

  v12[2](v12, x, y, width, height);
  double v16 = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();

  return v16;
}

- (id)completionBlock
{
  return objc_getProperty(self, a2, 232, 1);
}

- (void)setCompletionBlock:(id)a3
{
}

- (void).cxx_destruct
{
}

- (void)imageForImage:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end