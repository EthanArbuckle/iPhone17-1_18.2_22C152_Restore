@interface PSGCircleSegment
- (CGRect)titleRectForContentRect:(CGRect)a3;
- (CGSize)intrinsicContentSize;
- (CGSize)sizeThatFits:(CGSize)a3;
- (PSGCircleSegment)initWithFrame:(CGRect)a3;
- (void)setImage:(id)a3 animated:(BOOL)a4;
@end

@implementation PSGCircleSegment

- (PSGCircleSegment)initWithFrame:(CGRect)a3
{
  v17[1] = *MEMORY[0x263EF8340];
  v15.receiver = self;
  v15.super_class = (Class)PSGCircleSegment;
  v3 = -[PSGCircleSegment initWithFrame:](&v15, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = [MEMORY[0x263F81720] preferredFontDescriptorWithTextStyle:*MEMORY[0x263F83610]];
    uint64_t v16 = *MEMORY[0x263F81850];
    v5 = [NSNumber numberWithDouble:*MEMORY[0x263F81828]];
    v17[0] = v5;
    v6 = [NSDictionary dictionaryWithObjects:v17 forKeys:&v16 count:1];

    v7 = [v4 fontDescriptorByAddingAttributes:v6];

    v8 = [MEMORY[0x263F81708] fontWithDescriptor:v7 size:0.0];
    [(PSGCircleSegment *)v3 setOpaque:1];
    [(PSGCircleSegment *)v3 setAdjustsImageWhenHighlighted:0];
    v9 = [(PSGCircleSegment *)v3 titleLabel];
    [v9 setAdjustsFontSizeToFitWidth:1];

    v10 = [(PSGCircleSegment *)v3 titleLabel];
    [v10 setTextAlignment:1];

    v11 = [(PSGCircleSegment *)v3 titleLabel];
    [v11 setFont:v8];

    [(PSGCircleSegment *)v3 sizeToFit];
    v12 = [MEMORY[0x263F825C8] whiteColor];
    [(PSGCircleSegment *)v3 setTitleColor:v12 forState:4];

    v13 = [MEMORY[0x263F825C8] systemBlueColor];
    [(PSGCircleSegment *)v3 setTitleColor:v13 forState:0];
  }
  return v3;
}

- (CGRect)titleRectForContentRect:(CGRect)a3
{
  CGRect v20 = CGRectInset(a3, 4.0, 4.0);
  CGFloat x = v20.origin.x;
  CGFloat y = v20.origin.y;
  CGFloat width = v20.size.width;
  double height = v20.size.height;
  v8 = [(PSGCircleSegment *)self imageView];
  v9 = [v8 image];
  [v9 size];
  double v11 = v10;
  v12 = [(PSGCircleSegment *)self imageView];
  v13 = [v12 image];
  [v13 size];
  double v15 = height - (v11 - v14);

  double v16 = x;
  double v17 = y;
  double v18 = width;
  double v19 = v15;
  result.size.double height = v19;
  result.size.CGFloat width = v18;
  result.origin.CGFloat y = v17;
  result.origin.CGFloat x = v16;
  return result;
}

- (void)setImage:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v10 = a3;
  if (v4)
  {
    v6 = [MEMORY[0x263F15760] animationWithKeyPath:@"contents"];
    [v6 setDuration:0.15];
    id v7 = [(PSGCircleSegment *)self currentImage];
    objc_msgSend(v6, "setFromValue:", objc_msgSend(v7, "CGImage"));

    objc_msgSend(v6, "setToValue:", objc_msgSend(v10, "CGImage"));
    [v6 setRemovedOnCompletion:1];
    [v6 setFillMode:*MEMORY[0x263F15AB0]];
    v8 = [(PSGCircleSegment *)self imageView];
    v9 = [v8 layer];
    [v9 addAnimation:v6 forKey:@"animateContents"];
  }
  [(PSGCircleSegment *)self setImage:v10 forState:0];
  [(PSGCircleSegment *)self sizeToFit];
}

- (CGSize)intrinsicContentSize
{
  v2 = [(PSGCircleSegment *)self imageView];
  v3 = [v2 image];
  [v3 size];
  double v5 = v4;
  double v7 = v6;

  double v8 = v5;
  double v9 = v7;
  result.double height = v9;
  result.CGFloat width = v8;
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  v3 = [(PSGCircleSegment *)self imageView];
  double v4 = [v3 image];
  [v4 size];
  double v6 = v5;
  double v8 = v7;

  double v9 = v6;
  double v10 = v8;
  result.double height = v10;
  result.CGFloat width = v9;
  return result;
}

@end