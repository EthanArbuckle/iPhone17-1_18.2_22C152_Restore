@interface PLContactPhotoOverlay
- (CAShapeLayer)circularLayer;
- (CGRect)inscribingBounds;
- (PLContactPhotoOverlay)initWithCoder:(id)a3;
- (PLContactPhotoOverlay)initWithFrame:(CGRect)a3;
- (UIEdgeInsets)overlayEdgeInsets;
- (UIImageView)_avatarPreview;
- (UILabel)titleLabel;
- (void)_commonPLContactPhotoOverlayInitialization;
- (void)dealloc;
- (void)layoutSubviews;
- (void)setCircularLayer:(id)a3;
@end

@implementation PLContactPhotoOverlay

- (void)setCircularLayer:(id)a3
{
}

- (CAShapeLayer)circularLayer
{
  return self->_circularLayer;
}

- (UIImageView)_avatarPreview
{
  return self->__avatarPreview;
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (CGRect)inscribingBounds
{
  [(PLContactPhotoOverlay *)self bounds];
  CGFloat x = v16.origin.x;
  CGFloat y = v16.origin.y;
  CGFloat width = v16.size.width;
  CGFloat height = v16.size.height;
  double v6 = CGRectGetWidth(v16);
  v17.origin.CGFloat x = x;
  v17.origin.CGFloat y = y;
  v17.size.CGFloat width = width;
  v17.size.CGFloat height = height;
  double v7 = CGRectGetHeight(v17);
  if (v6 < v7) {
    double v7 = v6;
  }
  CGFloat v8 = v7 + -30.0;
  v18.origin.CGFloat x = x;
  v18.origin.CGFloat y = y;
  v18.size.CGFloat width = width;
  v18.size.CGFloat height = height;
  double v9 = CGRectGetWidth(v18);
  v19.origin.CGFloat x = 0.0;
  v19.origin.CGFloat y = 0.0;
  v19.size.CGFloat width = v8;
  v19.size.CGFloat height = v8;
  double v10 = (v9 - CGRectGetWidth(v19)) * 0.5;
  v20.origin.CGFloat x = x;
  v20.origin.CGFloat y = y;
  v20.size.CGFloat width = width;
  v20.size.CGFloat height = height;
  double v11 = CGRectGetHeight(v20);
  v21.origin.CGFloat x = 0.0;
  v21.origin.CGFloat y = 0.0;
  v21.size.CGFloat width = v8;
  v21.size.CGFloat height = v8;
  double v12 = (v11 - CGRectGetHeight(v21)) * 0.5;
  double v13 = v10;
  double v14 = v8;
  double v15 = v8;
  result.size.CGFloat height = v15;
  result.size.CGFloat width = v14;
  result.origin.CGFloat y = v12;
  result.origin.CGFloat x = v13;
  return result;
}

- (void)layoutSubviews
{
  v29.receiver = self;
  v29.super_class = (Class)PLContactPhotoOverlay;
  [(PLContactPhotoOverlay *)&v29 layoutSubviews];
  [(PLContactPhotoOverlay *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  [(UILabel *)self->_titleLabel sizeToFit];
  [(UILabel *)self->_titleLabel bounds];
  UIRectCenteredIntegralRectScale();
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;
  v30.origin.CGFloat x = v4;
  v30.origin.CGFloat y = v6;
  v30.size.CGFloat width = v8;
  v30.size.CGFloat height = v10;
  -[UILabel setFrame:](self->_titleLabel, "setFrame:", v12, CGRectGetMinY(v30) + 64.0, v14, v16, 0);
  v31.origin.CGFloat x = v4;
  v31.origin.CGFloat y = v6;
  v31.size.CGFloat width = v8;
  v31.size.CGFloat height = v10;
  CGFloat v17 = CGRectGetMinX(v31) + 15.0;
  v32.origin.CGFloat x = v4;
  v32.origin.CGFloat y = v6;
  v32.size.CGFloat width = v8;
  v32.size.CGFloat height = v10;
  -[UIImageView setFrame:](self->__avatarPreview, "setFrame:", v17, CGRectGetMinY(v32) + 30.0, 60.0, 60.0);
  [(PLContactPhotoOverlay *)self inscribingBounds];
  double v19 = v18;
  double v21 = v20;
  double v23 = v22;
  double v25 = v24;
  v26 = objc_msgSend(MEMORY[0x1E4F427D0], "bezierPathWithRect:", v4, v6, v8, v10);
  objc_msgSend(v26, "appendPath:", objc_msgSend(MEMORY[0x1E4F427D0], "bezierPathWithOvalInRect:", v19, v21, v23, v25));
  [v26 setUsesEvenOddFillRule:1];
  v27 = [(PLContactPhotoOverlay *)self circularLayer];
  if (!v27)
  {
    v28 = (void *)[MEMORY[0x1E4F39C88] layer];
    objc_msgSend(v28, "setPath:", objc_msgSend(v26, "CGPath"));
    [v28 setFillRule:*MEMORY[0x1E4F39FB8]];
    objc_msgSend(v28, "setFillColor:", objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F428B8], "colorWithRed:green:blue:alpha:", 0.043, 0.043, 0.043, 0.73), "CGColor"));
    objc_msgSend((id)-[PLContactPhotoOverlay layer](self, "layer"), "addSublayer:", v28);
    [(PLContactPhotoOverlay *)self bringSubviewToFront:self->_titleLabel];
    [(PLContactPhotoOverlay *)self setCircularLayer:v28];
  }
  -[CAShapeLayer setPath:](v27, "setPath:", [v26 CGPath]);
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)PLContactPhotoOverlay;
  [(PLContactPhotoOverlay *)&v3 dealloc];
}

- (PLContactPhotoOverlay)initWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)PLContactPhotoOverlay;
  objc_super v3 = [(PLContactPhotoOverlay *)&v6 initWithCoder:a3];
  double v4 = v3;
  if (v3) {
    [(PLContactPhotoOverlay *)v3 _commonPLContactPhotoOverlayInitialization];
  }
  return v4;
}

- (PLContactPhotoOverlay)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)PLContactPhotoOverlay;
  objc_super v3 = -[PLContactPhotoOverlay initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  double v4 = v3;
  if (v3) {
    [(PLContactPhotoOverlay *)v3 _commonPLContactPhotoOverlayInitialization];
  }
  return v4;
}

- (void)_commonPLContactPhotoOverlayInitialization
{
  -[PLContactPhotoOverlay setBackgroundColor:](self, "setBackgroundColor:", [MEMORY[0x1E4F428B8] clearColor]);
  id v3 = objc_alloc(MEMORY[0x1E4F42B38]);
  double v4 = *MEMORY[0x1E4F1DB28];
  double v5 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  double v6 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  double v7 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  double v8 = (UILabel *)objc_msgSend(v3, "initWithFrame:", *MEMORY[0x1E4F1DB28], v5, v6, v7);
  self->_titleLabel = v8;
  -[UILabel setFont:](v8, "setFont:", objc_msgSend(MEMORY[0x1E4F42A30], "fontWithDescriptor:size:", objc_msgSend(MEMORY[0x1E4F42A38], "preferredFontDescriptorWithTextStyle:", *MEMORY[0x1E4F43870]), 18.0));
  -[UILabel setTextColor:](self->_titleLabel, "setTextColor:", [MEMORY[0x1E4F428B8] whiteColor]);
  [(PLContactPhotoOverlay *)self addSubview:self->_titleLabel];
  double v9 = (UIImageView *)objc_msgSend(objc_alloc(MEMORY[0x1E4F42AA0]), "initWithFrame:", v4, v5, v6, v7);
  self->__avatarPreview = v9;
  [(PLContactPhotoOverlay *)self addSubview:v9];
}

- (UIEdgeInsets)overlayEdgeInsets
{
  [(PLContactPhotoOverlay *)self inscribingBounds];
  CGFloat v4 = v3;
  CGFloat v6 = v5;
  CGFloat rect = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  [(PLContactPhotoOverlay *)self bounds];
  CGFloat v12 = v11;
  CGFloat v14 = v13;
  CGFloat v16 = v15;
  CGFloat v18 = v17;
  v32.origin.CGFloat x = v4;
  CGFloat v28 = v4;
  v32.origin.CGFloat y = v6;
  v32.size.CGFloat width = v8;
  v32.size.CGFloat height = v10;
  double MinX = CGRectGetMinX(v32);
  v33.origin.CGFloat x = v12;
  v33.origin.CGFloat y = v14;
  v33.size.CGFloat width = v16;
  v33.size.CGFloat height = v18;
  double v30 = MinX - CGRectGetMinX(v33);
  v34.origin.CGFloat x = v4;
  v34.origin.CGFloat y = rect;
  v34.size.CGFloat width = v8;
  v34.size.CGFloat height = v10;
  double MinY = CGRectGetMinY(v34);
  v35.origin.CGFloat x = v12;
  v35.origin.CGFloat y = v14;
  v35.size.CGFloat width = v16;
  v35.size.CGFloat height = v18;
  double v29 = MinY - CGRectGetMinY(v35);
  v36.origin.CGFloat x = v12;
  v36.origin.CGFloat y = v14;
  v36.size.CGFloat width = v16;
  v36.size.CGFloat height = v18;
  double MaxX = CGRectGetMaxX(v36);
  v37.origin.CGFloat x = v28;
  v37.origin.CGFloat y = rect;
  v37.size.CGFloat width = v8;
  v37.size.CGFloat height = v10;
  double v22 = MaxX - CGRectGetMaxX(v37);
  v38.origin.CGFloat x = v12;
  v38.origin.CGFloat y = v14;
  v38.size.CGFloat width = v16;
  v38.size.CGFloat height = v18;
  double MaxY = CGRectGetMaxY(v38);
  v39.origin.CGFloat x = v28;
  v39.origin.CGFloat y = rect;
  v39.size.CGFloat width = v8;
  v39.size.CGFloat height = v10;
  double v24 = MaxY - CGRectGetMaxY(v39);
  double v25 = v29;
  double v26 = v30;
  double v27 = v22;
  result.right = v27;
  result.bottom = v24;
  result.left = v26;
  result.top = v25;
  return result;
}

@end