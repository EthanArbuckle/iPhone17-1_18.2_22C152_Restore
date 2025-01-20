@interface PUAvalancheStackView
- (CALayer)imageLayer;
- (CALayer)stackLayer0;
- (CALayer)stackLayer1;
- (CGRect)_imageContentFrame;
- (PUAvalancheStackView)init;
- (int64_t)contentMode;
- (void)layoutSubviews;
- (void)setContentMode:(int64_t)a3;
- (void)setImage:(id)a3;
- (void)setImageLayer:(id)a3;
- (void)setStackLayer0:(id)a3;
- (void)setStackLayer1:(id)a3;
@end

@implementation PUAvalancheStackView

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stackLayer1, 0);
  objc_storeStrong((id *)&self->_stackLayer0, 0);
  objc_storeStrong((id *)&self->_imageLayer, 0);
}

- (void)setContentMode:(int64_t)a3
{
  self->_contentMode = a3;
}

- (int64_t)contentMode
{
  return self->_contentMode;
}

- (void)setStackLayer1:(id)a3
{
}

- (CALayer)stackLayer1
{
  return self->_stackLayer1;
}

- (void)setStackLayer0:(id)a3
{
}

- (CALayer)stackLayer0
{
  return self->_stackLayer0;
}

- (void)setImageLayer:(id)a3
{
}

- (CALayer)imageLayer
{
  return self->_imageLayer;
}

- (CGRect)_imageContentFrame
{
  [(PUAvalancheStackView *)self contentScaleFactor];
  double v4 = v3 * 2.5;
  v5 = [(CALayer *)self->_imageLayer contents];
  v6 = v5;
  if (self->_contentMode != 2 || v5 == 0)
  {
    double v20 = v4 + v4;
    [(PUAvalancheStackView *)self frame];
    CGFloat v18 = v8;
    [(PUAvalancheStackView *)self frame];
    double v22 = v9 + v4 * -2.0;
    double v16 = 0.0;
  }
  else
  {
    double Width = (double)CGImageGetWidth(v5);
    double v11 = (double)CGImageGetHeight(v6) + v4 * 2.0;
    [(PUAvalancheStackView *)self bounds];
    double v16 = PURectWithSizeThatFitsInRect(Width, v11, v12, v13, v14, v15);
    CGFloat v18 = v17;
    double v20 = v19 + v4 * 2.0;
    double v22 = v21 + v4 * -2.0;
  }
  double v23 = PURoundRectToPixel(v16, v20, v18, v22);
  double v25 = v24;
  double v27 = v26;
  double v29 = v28;

  double v30 = v23;
  double v31 = v25;
  double v32 = v27;
  double v33 = v29;
  result.size.height = v33;
  result.size.width = v32;
  result.origin.y = v31;
  result.origin.x = v30;
  return result;
}

- (void)layoutSubviews
{
  [(PUAvalancheStackView *)self contentScaleFactor];
  double v4 = v3 * 2.5;
  double v5 = v3 * -0.5;
  [(PUAvalancheStackView *)self _imageContentFrame];
  double v7 = v4 + v6;
  double v9 = v8 - v4;
  double v11 = v10 + v4 * -2.0;
  double v12 = v4 + v5;
  double v13 = v6 + v4 * 2.0;
  double v14 = v8 + v4 * -2.0;
  double v15 = v10 + v4 * -4.0;
  -[CALayer setFrame:](self->_imageLayer, "setFrame:");
  -[CALayer setFrame:](self->_stackLayer0, "setFrame:", v7, v9, v11, v12);
  -[CALayer setFrame:](self->_stackLayer1, "setFrame:", v13, v14, v15, v12);
  double v16 = [(CALayer *)self->_imageLayer contents];
  double v20 = v16;
  if (v16)
  {
    double Width = (double)CGImageGetWidth(v16);
    [(CALayer *)self->_stackLayer0 setContentsScale:Width / v11];
    stackLayer1 = self->_stackLayer1;
    double v19 = Width / v15;
  }
  else
  {
    [(CALayer *)self->_stackLayer0 setContentsScale:1.0];
    stackLayer1 = self->_stackLayer1;
    double v19 = 1.0;
  }
  [(CALayer *)stackLayer1 setContentsScale:v19];
}

- (void)setImage:(id)a3
{
  id v4 = a3;
  double v5 = [(CALayer *)self->_imageLayer contents];
  double v6 = v5;
  if (v5)
  {
    size_t Width = CGImageGetWidth(v5);
    size_t Height = CGImageGetHeight(v6);
  }
  else
  {
    size_t Height = 0;
    size_t Width = 0;
  }
  imageLayer = self->_imageLayer;
  id v10 = v4;
  -[CALayer setContents:](imageLayer, "setContents:", [v10 CGImage]);
  stackLayer0 = self->_stackLayer0;
  id v12 = v10;
  -[CALayer setContents:](stackLayer0, "setContents:", [v12 CGImage]);
  stackLayer1 = self->_stackLayer1;
  id v14 = v12;
  -[CALayer setContents:](stackLayer1, "setContents:", [v14 CGImage]);
  id v15 = v14;
  if (Width != CGImageGetWidth((CGImageRef)[v15 CGImage])
    || Height != CGImageGetHeight((CGImageRef)[v15 CGImage]))
  {
    [(PUAvalancheStackView *)self setNeedsLayout];
  }
}

- (PUAvalancheStackView)init
{
  v26[6] = *MEMORY[0x1E4F143B8];
  v24.receiver = self;
  v24.super_class = (Class)PUAvalancheStackView;
  v2 = [(PUAvalancheStackView *)&v24 init];
  if (v2)
  {
    v25[0] = @"bounds";
    double v3 = [MEMORY[0x1E4F1CA98] null];
    v26[0] = v3;
    v25[1] = @"contents";
    id v4 = [MEMORY[0x1E4F1CA98] null];
    v26[1] = v4;
    v25[2] = @"contentsScale";
    double v5 = [MEMORY[0x1E4F1CA98] null];
    v26[2] = v5;
    v25[3] = @"onOrderIn";
    double v6 = [MEMORY[0x1E4F1CA98] null];
    v26[3] = v6;
    v25[4] = @"onOrderOut";
    double v7 = [MEMORY[0x1E4F1CA98] null];
    v26[4] = v7;
    v25[5] = @"sublayers";
    double v8 = [MEMORY[0x1E4F1CA98] null];
    v26[5] = v8;
    double v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v26 forKeys:v25 count:6];

    id v10 = (CALayer *)objc_alloc_init(MEMORY[0x1E4F39BE8]);
    imageLayer = v2->_imageLayer;
    v2->_imageLayer = v10;

    id v12 = (CALayer *)objc_alloc_init(MEMORY[0x1E4F39BE8]);
    stackLayer0 = v2->_stackLayer0;
    v2->_stackLayer0 = v12;

    id v14 = (CALayer *)objc_alloc_init(MEMORY[0x1E4F39BE8]);
    stackLayer1 = v2->_stackLayer1;
    v2->_stackLayer1 = v14;

    [(CALayer *)v2->_imageLayer setOpaque:1];
    LODWORD(v16) = 1058642330;
    [(CALayer *)v2->_stackLayer0 setOpacity:v16];
    LODWORD(v17) = 1058642330;
    [(CALayer *)v2->_stackLayer1 setOpacity:v17];
    [(CALayer *)v2->_imageLayer setMasksToBounds:1];
    [(CALayer *)v2->_stackLayer0 setMasksToBounds:1];
    [(CALayer *)v2->_stackLayer1 setMasksToBounds:1];
    [(CALayer *)v2->_imageLayer setContentsGravity:*MEMORY[0x1E4F3A3E0]];
    uint64_t v18 = *MEMORY[0x1E4F3A3A8];
    [(CALayer *)v2->_stackLayer0 setContentsGravity:*MEMORY[0x1E4F3A3A8]];
    [(CALayer *)v2->_stackLayer1 setContentsGravity:v18];
    [(CALayer *)v2->_imageLayer setActions:v9];
    [(CALayer *)v2->_stackLayer0 setActions:v9];
    [(CALayer *)v2->_stackLayer1 setActions:v9];
    double v19 = [(PUAvalancheStackView *)v2 layer];
    [v19 addSublayer:v2->_imageLayer];

    double v20 = [(PUAvalancheStackView *)v2 layer];
    [v20 addSublayer:v2->_stackLayer0];

    double v21 = [(PUAvalancheStackView *)v2 layer];
    [v21 addSublayer:v2->_stackLayer1];

    double v22 = [(PUAvalancheStackView *)v2 layer];
    [v22 setAllowsGroupOpacity:0];
  }
  return v2;
}

@end