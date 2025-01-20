@interface SUUICommentImageDataConsumer
- (id)_scaledImageWithBounds:(CGSize)a3 contentRect:(CGRect)a4 drawBlock:(id)a5;
- (id)completionBlock;
- (id)imageForImage:(id)a3;
- (void)setCompletionBlock:(id)a3;
@end

@implementation SUUICommentImageDataConsumer

- (id)imageForImage:(id)a3
{
  id v4 = a3;
  [(SUUIStyledImageDataConsumer *)self imageSize];
  double v6 = v5;
  double v8 = v7;
  [(SUUIStyledImageDataConsumer *)self imageSize];
  double v10 = v9;
  [(SUUIStyledImageDataConsumer *)self imageSize];
  double v12 = v11;
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __46__SUUICommentImageDataConsumer_imageForImage___block_invoke;
  v18[3] = &unk_265401428;
  id v13 = v4;
  id v19 = v13;
  v14 = -[SUUICommentImageDataConsumer _scaledImageWithBounds:contentRect:drawBlock:](self, "_scaledImageWithBounds:contentRect:drawBlock:", v18, v6, v8, 0.0, 0.0, v10, v12);
  v15 = [v14 imageWithRenderingMode:1];

  completionBlock = (void (**)(id, void *, void))self->_completionBlock;
  if (completionBlock) {
    completionBlock[2](completionBlock, v15, 0);
  }

  return v15;
}

uint64_t __46__SUUICommentImageDataConsumer_imageForImage___block_invoke(uint64_t a1)
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
  double v11 = (void *)MEMORY[0x263F82B60];
  double v12 = (void (**)(void, double, double, double, double))a5;
  id v13 = [v11 mainScreen];
  [v13 scale];
  CGFloat v15 = v14;
  v19.double width = v10;
  v19.double height = v9;
  UIGraphicsBeginImageContextWithOptions(v19, 1, v15);

  v12[2](v12, x, y, width, height);
  v16 = UIGraphicsGetImageFromCurrentImageContext();
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

@end