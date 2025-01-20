@interface _UIGroupTableViewCellBackground_TV
- (_UIGroupTableViewCellBackground_TV)initWithFrame:(CGRect)a3 backgroundImageColor:(id)a4 cornerRadius:(double)a5;
- (void)updateBackgroundImageColor:(id)a3 cornerRadius:(double)a4;
@end

@implementation _UIGroupTableViewCellBackground_TV

- (_UIGroupTableViewCellBackground_TV)initWithFrame:(CGRect)a3 backgroundImageColor:(id)a4 cornerRadius:(double)a5
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v11 = a4;
  v15.receiver = self;
  v15.super_class = (Class)_UIGroupTableViewCellBackground_TV;
  v12 = -[UIView initWithFrame:](&v15, sel_initWithFrame_, x, y, width, height);
  v13 = v12;
  if (v12) {
    [(_UIGroupTableViewCellBackground_TV *)v12 updateBackgroundImageColor:v11 cornerRadius:a5];
  }

  return v13;
}

- (void)updateBackgroundImageColor:(id)a3 cornerRadius:(double)a4
{
  id v6 = a3;
  v7 = v6;
  v8 = (void *)MEMORY[0x1E4F29238];
  long long v35 = 0u;
  long long v36 = 0u;
  double v37 = a4;
  if (v6) {
    [v6 getRed:&v35 green:(char *)&v35 + 8 blue:&v36 alpha:(char *)&v36 + 8];
  }
  v9 = [v8 valueWithBytes:&v35 objCType:"{TVShadowComponentsKey=ddddd}"];
  if (!-[NSValue isEqualToValue:](self->_currentShadowKey, "isEqualToValue:", v9, v35, v36, *(void *)&v37))
  {
    objc_storeStrong((id *)&self->_currentShadowKey, v9);
    if (_MergedGlobals_1_26 != -1) {
      dispatch_once(&_MergedGlobals_1_26, &__block_literal_global_523);
    }
    v10 = [(id)qword_1EB25BF50 objectForKey:v9];
    if (!v10)
    {
      id v11 = v7;
      DeviceRGB = CGColorSpaceCreateDeviceRGB();
      v39.origin.double x = 10.0;
      v39.origin.double y = 10.0;
      v39.size.double width = a4 + a4 + 10.0;
      v39.size.double height = v39.size.width;
      CGFloat v13 = CGRectGetWidth(v39) + 20.0;
      v40.origin.double x = 10.0;
      v40.origin.double y = 10.0;
      v40.size.double width = a4 + a4 + 10.0;
      v40.size.double height = v40.size.width;
      CGFloat Height = CGRectGetHeight(v40);
      objc_super v15 = CGBitmapContextCreate(0, (unint64_t)v13, (unint64_t)(Height + 20.0), 8uLL, 0, DeviceRGB, 0x2002u);
      CGColorSpaceRelease(DeviceRGB);
      CGContextSaveGState(v15);
      if (a4 == 0.0) {
        +[UIBezierPath bezierPathWithRect:](UIBezierPath, "bezierPathWithRect:", 10.0, 10.0, a4 + a4 + 10.0, a4 + a4 + 10.0);
      }
      else {
        +[UIBezierPath _bezierPathWithPillRect:cornerRadius:](UIBezierPath, "_bezierPathWithPillRect:cornerRadius:", 10.0, 10.0, a4 + a4 + 10.0, a4 + a4 + 10.0, a4 + 1.0);
      }
      id v16 = objc_claimAutoreleasedReturnValue();
      CGContextAddPath(v15, (CGPathRef)[v16 CGPath]);
      id v17 = +[UIColor colorWithWhite:0.0 alpha:0.05];
      v18 = (CGColor *)[v17 CGColor];

      id v19 = +[UIColor blackColor];
      v20 = (CGColor *)[v19 CGColor];

      v38.double width = 0.0;
      v38.double height = 0.0;
      CGContextSetShadowWithColor(v15, v38, 10.0, v20);
      CGContextSetFillColorWithColor(v15, v18);
      CGContextFillPath(v15);
      CGContextRestoreGState(v15);
      double v21 = 10.0;
      double v22 = 10.0;
      double v23 = a4 + a4 + 10.0;
      double v24 = v23;
      if (a4 == 0.0) {
        v25 = CGPathCreateWithRect(*(CGRect *)&v21, 0);
      }
      else {
        v25 = CGPathCreateWithRoundedRect(*(CGRect *)&v21, a4, a4, 0);
      }
      v26 = v25;
      CGContextAddPath(v15, v25);
      if (v7)
      {
        v27 = (CGColor *)[v11 CGColor];
      }
      else
      {
        id v28 = +[UIColor clearColor];
        v27 = (CGColor *)[v28 CGColor];
      }
      CGContextSetFillColorWithColor(v15, v27);
      CGContextSetBlendMode(v15, kCGBlendModeCopy);
      CGContextFillPath(v15);
      CGPathRelease(v26);
      Image = CGBitmapContextCreateImage(v15);
      CFRelease(v15);
      v30 = +[UIImage imageWithCGImage:Image];
      CGImageRelease(Image);
      v10 = objc_msgSend(v30, "resizableImageWithCapInsets:resizingMode:", 1, a4 + 10.0, a4 + 10.0, a4 + 10.0, a4 + 10.0);

      [(id)qword_1EB25BF50 setObject:v10 forKey:v9];
    }
    backgroundImageView = self->_backgroundImageView;
    if (!backgroundImageView)
    {
      v32 = [UIImageView alloc];
      [(UIView *)self bounds];
      CGRect v42 = CGRectInset(v41, -10.0, -10.0);
      v33 = -[UIImageView initWithFrame:](v32, "initWithFrame:", v42.origin.x, v42.origin.y, v42.size.width, v42.size.height);
      v34 = self->_backgroundImageView;
      self->_backgroundImageView = v33;

      [(UIView *)self->_backgroundImageView setAutoresizingMask:18];
      [(UIView *)self addSubview:self->_backgroundImageView];
      backgroundImageView = self->_backgroundImageView;
    }
    [(UIImageView *)backgroundImageView setImage:v10];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backgroundImageView, 0);
  objc_storeStrong((id *)&self->_currentShadowKey, 0);
}

@end