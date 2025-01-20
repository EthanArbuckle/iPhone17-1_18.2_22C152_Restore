@interface TSKPlaceholderTextView
- (BOOL)becomeFirstResponder;
- (NSString)placeholder;
- (TSKPlaceholderTextView)initWithFrame:(CGRect)a3;
- (void)dealloc;
- (void)didMoveToSuperview;
- (void)p_textDidChange:(id)a3;
- (void)removeFromSuperview;
- (void)setFont:(id)a3;
- (void)setFrame:(CGRect)a3;
- (void)setPlaceholder:(id)a3;
- (void)setText:(id)a3;
- (void)setTextAlignment:(int64_t)a3;
- (void)setTextColor:(id)a3;
@end

@implementation TSKPlaceholderTextView

- (TSKPlaceholderTextView)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)TSKPlaceholderTextView;
  v3 = -[TSKPlaceholderTextView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    -[TSKPlaceholderTextView setFont:](v3, "setFont:", [MEMORY[0x263F1C658] systemFontOfSize:17.0]);
    v4 = (void *)[MEMORY[0x263F08A00] defaultCenter];
    [v4 addObserver:v3 selector:sel_p_textDidChange_ name:*MEMORY[0x263F1D790] object:v3];
  }
  return v3;
}

- (void)dealloc
{
  v3 = (void *)[MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self name:*MEMORY[0x263F1D790] object:self];

  self->mPlaceholderView = 0;
  v4.receiver = self;
  v4.super_class = (Class)TSKPlaceholderTextView;
  [(TSKPlaceholderTextView *)&v4 dealloc];
}

- (NSString)placeholder
{
  return [(UILabel *)self->mPlaceholderView text];
}

- (void)setPlaceholder:(id)a3
{
  mPlaceholderView = self->mPlaceholderView;
  if (!mPlaceholderView)
  {
    [(TSKPlaceholderTextView *)self frame];
    CGRect v10 = CGRectInset(v9, 2.0, 0.0);
    self->mPlaceholderView = (UILabel *)objc_msgSend(objc_alloc(MEMORY[0x263F1C768]), "initWithFrame:", v10.origin.x, v10.origin.y, v10.size.width, v10.size.height);
    [(UILabel *)self->mPlaceholderView setTextAlignment:[(TSKPlaceholderTextView *)self textAlignment]];
    [(UILabel *)self->mPlaceholderView setFont:[(TSKPlaceholderTextView *)self font]];
    [(UILabel *)self->mPlaceholderView setTextColor:[(TSKPlaceholderTextView *)self textColor]];
    [(UILabel *)self->mPlaceholderView setAlpha:0.600000024];
    [(UILabel *)self->mPlaceholderView setOpaque:0];
    -[UILabel setBackgroundColor:](self->mPlaceholderView, "setBackgroundColor:", [MEMORY[0x263F1C550] clearColor]);
    [(UILabel *)self->mPlaceholderView setAdjustsFontSizeToFitWidth:1];
    [(UILabel *)self->mPlaceholderView setMinimumFontSize:12.0];
    objc_msgSend((id)-[TSKPlaceholderTextView superview](self, "superview"), "insertSubview:belowSubview:", self->mPlaceholderView, self);
    mPlaceholderView = self->mPlaceholderView;
  }
  [(UILabel *)mPlaceholderView setText:a3];
  BOOL v6 = objc_msgSend((id)-[TSKPlaceholderTextView text](self, "text"), "length") != 0;
  v7 = self->mPlaceholderView;

  [(UILabel *)v7 setHidden:v6];
}

- (void)setFrame:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  v8.receiver = self;
  v8.super_class = (Class)TSKPlaceholderTextView;
  -[TSKPlaceholderTextView setFrame:](&v8, sel_setFrame_);
  v9.origin.CGFloat x = x;
  v9.origin.CGFloat y = y;
  v9.size.CGFloat width = width;
  v9.size.CGFloat height = height;
  CGRect v10 = CGRectInset(v9, 6.0, 0.0);
  -[UILabel setFrame:](self->mPlaceholderView, "setFrame:", v10.origin.x, v10.origin.y, v10.size.width, v10.size.height);
}

- (void)setTextAlignment:(int64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)TSKPlaceholderTextView;
  -[TSKPlaceholderTextView setTextAlignment:](&v5, sel_setTextAlignment_);
  [(UILabel *)self->mPlaceholderView setTextAlignment:a3];
}

- (void)setFont:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)TSKPlaceholderTextView;
  -[TSKPlaceholderTextView setFont:](&v5, sel_setFont_);
  [(UILabel *)self->mPlaceholderView setFont:a3];
}

- (void)setTextColor:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)TSKPlaceholderTextView;
  -[TSKPlaceholderTextView setTextColor:](&v5, sel_setTextColor_);
  [(UILabel *)self->mPlaceholderView setTextColor:a3];
}

- (void)removeFromSuperview
{
  [(UILabel *)self->mPlaceholderView removeFromSuperview];
  v3.receiver = self;
  v3.super_class = (Class)TSKPlaceholderTextView;
  [(TSKPlaceholderTextView *)&v3 removeFromSuperview];
}

- (void)didMoveToSuperview
{
  v3.receiver = self;
  v3.super_class = (Class)TSKPlaceholderTextView;
  [(TSKPlaceholderTextView *)&v3 didMoveToSuperview];
  objc_msgSend((id)-[TSKPlaceholderTextView superview](self, "superview"), "insertSubview:belowSubview:", self->mPlaceholderView, self);
}

- (void)setText:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)TSKPlaceholderTextView;
  [(TSKPlaceholderTextView *)&v4 setText:a3];
  -[UILabel setHidden:](self->mPlaceholderView, "setHidden:", objc_msgSend((id)-[TSKPlaceholderTextView text](self, "text"), "length") != 0);
}

- (void)p_textDidChange:(id)a3
{
  BOOL v4 = objc_msgSend((id)-[TSKPlaceholderTextView text](self, "text", a3), "length") != 0;
  mPlaceholderView = self->mPlaceholderView;

  [(UILabel *)mPlaceholderView setHidden:v4];
}

- (BOOL)becomeFirstResponder
{
  int v3 = [(TSKPlaceholderTextView *)self isUserInteractionEnabled];
  if (v3)
  {
    v5.receiver = self;
    v5.super_class = (Class)TSKPlaceholderTextView;
    LOBYTE(v3) = [(TSKPlaceholderTextView *)&v5 becomeFirstResponder];
  }
  return v3;
}

@end