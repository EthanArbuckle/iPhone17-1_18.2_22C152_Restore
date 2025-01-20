@interface _UIAttributedStringView
+ (Class)layerClass;
- (_UIAttributedStringView)initWithFrame:(CGRect)a3;
- (void)_updateContentsScale:(id)a3;
- (void)dealloc;
- (void)didMoveToSuperview;
- (void)setFrame:(CGRect)a3;
- (void)setString:(id)a3;
- (void)setTextRotationAngle:(double)a3;
@end

@implementation _UIAttributedStringView

+ (Class)layerClass
{
  return (Class)objc_opt_class();
}

- (_UIAttributedStringView)initWithFrame:(CGRect)a3
{
  v7.receiver = self;
  v7.super_class = (Class)_UIAttributedStringView;
  v3 = -[UIView initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    [(UIView *)v3 setOpaque:0];
    v5 = [(UIView *)v4 layer];
    [(CALayer *)v5 setContentsGravity:*MEMORY[0x1E4F3A3F0]];
    [(CALayer *)v5 setAlignmentMode:*MEMORY[0x1E4F39D38]];
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter"), "addObserver:selector:name:object:", v4, sel__updateContentsScale_, @"UITextSelectionDidZoom", 0);
  }
  return v4;
}

- (void)dealloc
{
  -[NSNotificationCenter _uiRemoveObserver:names:]((void *)[MEMORY[0x1E4F28EB8] defaultCenter], self, &unk_1ED3F19D8);

  v3.receiver = self;
  v3.super_class = (Class)_UIAttributedStringView;
  [(UIView *)&v3 dealloc];
}

- (void)setFrame:(CGRect)a3
{
  CGRect v5 = CGRectIntegral(a3);
  v4.receiver = self;
  v4.super_class = (Class)_UIAttributedStringView;
  -[UIView setFrame:](&v4, sel_setFrame_, v5.origin.x, v5.origin.y, v5.size.width, v5.size.height);
}

- (void)_updateContentsScale:(id)a3
{
  id v5 = [(UIView *)self _scroller];
  if ((id)[a3 object] == v5)
  {
    [MEMORY[0x1E4F39CF8] setDisableActions:1];
    v6 = [(UIView *)self layer];
    [v5 zoomScale];
    -[CALayer setContentsScale:](v6, "setContentsScale:");
  }
}

- (void)didMoveToSuperview
{
  id v3 = [(UIView *)self _scroller];
  if (v3)
  {
    objc_super v4 = v3;
    [MEMORY[0x1E4F39CF8] setDisableActions:1];
    id v5 = [(UIView *)self layer];
    [v4 zoomScale];
    -[CALayer setContentsScale:](v5, "setContentsScale:");
  }
}

- (void)setString:(id)a3
{
  id v5 = a3;

  self->_string = (NSAttributedString *)a3;
  v6 = [(UIView *)self layer];
  string = self->_string;
  [(CALayer *)v6 setString:string];
}

- (void)setTextRotationAngle:(double)a3
{
  objc_super v4 = [(UIView *)self layer];
  CGAffineTransformMakeRotation(&v5, a3);
  [(CALayer *)v4 setAffineTransform:&v5];
}

@end