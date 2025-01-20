@interface PLFlatVideoOverlayButton
- (PLFlatVideoOverlayButton)initWithStyle:(int64_t)a3;
- (id)_createOverlayImageWithBackgroundWhite:(double)a3 backgroundAlpha:(double)a4 glyphAlpha:(double)a5;
- (id)_highlightedButtonImage;
- (id)_normalButtonImage;
- (int64_t)style;
- (void)_handleTap:(id)a3;
- (void)setTarget:(id)a3 action:(SEL)a4;
@end

@implementation PLFlatVideoOverlayButton

- (id)_createOverlayImageWithBackgroundWhite:(double)a3 backgroundAlpha:(double)a4 glyphAlpha:(double)a5
{
  uint64_t v8 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  v9 = (void *)[MEMORY[0x1E4F42A80] imageNamed:@"PLVideoOverlayBackgroundMask" inBundle:v8];
  v10 = (void *)[MEMORY[0x1E4F42A80] imageNamed:@"PLVideoOverlayGlyphMask" inBundle:v8];
  double v11 = *MEMORY[0x1E4F1DAD8];
  double v12 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  [v9 size];
  CGFloat width = v18.width;
  CGFloat height = v18.height;
  UIGraphicsBeginImageContextWithOptions(v18, 0, 0.0);
  CurrentContext = UIGraphicsGetCurrentContext();
  CGContextSetGrayFillColor(CurrentContext, a3, a4);
  v19.origin.x = v11;
  v19.origin.y = v12;
  v19.size.CGFloat width = width;
  v19.size.CGFloat height = height;
  CGContextFillRect(CurrentContext, v19);
  objc_msgSend(v9, "drawAtPoint:blendMode:alpha:", 23, v11, v12, 1.0);
  objc_msgSend(v10, "drawAtPoint:blendMode:alpha:", 23, v11, v12, 1.0);
  objc_msgSend(v10, "drawAtPoint:blendMode:alpha:", 0, v11, v12, a5);
  v16 = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();
  return v16;
}

- (id)_highlightedButtonImage
{
  return (id)_highlightedButtonImage_image;
}

uint64_t __51__PLFlatVideoOverlayButton__highlightedButtonImage__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) _createOverlayImageWithBackgroundWhite:0.959999979 backgroundAlpha:0.959999979 glyphAlpha:0.5];
  _highlightedButtonImage_image = result;
  return result;
}

- (id)_normalButtonImage
{
  return (id)_normalButtonImage_image;
}

uint64_t __46__PLFlatVideoOverlayButton__normalButtonImage__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) _createOverlayImageWithBackgroundWhite:0.959999979 backgroundAlpha:0.959999979 glyphAlpha:0.300000012];
  _normalButtonImage_image = result;
  return result;
}

- (void)_handleTap:(id)a3
{
  p_action = &self->_action;
  if (objc_opt_respondsToSelector())
  {
    id target = self->_target;
    if (*p_action) {
      SEL v6 = *p_action;
    }
    else {
      SEL v6 = 0;
    }
    [target performSelector:v6 withObject:self];
  }
}

- (void)setTarget:(id)a3 action:(SEL)a4
{
  self->_id target = a3;
  if (a4) {
    v4 = a4;
  }
  else {
    v4 = 0;
  }
  self->_action = v4;
}

- (int64_t)style
{
  return self->_style;
}

- (PLFlatVideoOverlayButton)initWithStyle:(int64_t)a3
{
  v7.receiver = self;
  v7.super_class = (Class)PLFlatVideoOverlayButton;
  v4 = -[PLFlatVideoOverlayButton initWithFrame:](&v7, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  v5 = v4;
  if (v4)
  {
    v4->_style = a3;
    [(PLFlatVideoOverlayButton *)v4 setImage:[(PLFlatVideoOverlayButton *)v4 _normalButtonImage] forState:0];
    [(PLFlatVideoOverlayButton *)v5 setImage:[(PLFlatVideoOverlayButton *)v5 _highlightedButtonImage] forState:1];
    [(PLFlatVideoOverlayButton *)v5 sizeToFit];
    [(PLFlatVideoOverlayButton *)v5 setDeliversTouchesForGesturesToSuperview:0];
    [(PLFlatVideoOverlayButton *)v5 addTarget:v5 action:sel__handleTap_ forControlEvents:64];
  }
  return v5;
}

@end