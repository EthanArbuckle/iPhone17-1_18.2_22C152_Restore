@interface PLVideoEditingOverlayView
- (PLVideoEditingOverlayView)initWithFrame:(CGRect)a3;
- (void)setBody:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation PLVideoEditingOverlayView

- (void)setBody:(id)a3
{
  [(UITextView *)self->_bodyLabel setText:a3];
  [(PLVideoEditingOverlayView *)self setNeedsLayout];
}

- (void)setTitle:(id)a3
{
  [(UILabel *)self->_titleLabel setText:a3];
  [(PLVideoEditingOverlayView *)self setNeedsLayout];
}

- (PLVideoEditingOverlayView)initWithFrame:(CGRect)a3
{
  v14.receiver = self;
  v14.super_class = (Class)PLVideoEditingOverlayView;
  v3 = -[PLVideoEditingOverlayView initWithFrame:](&v14, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    [(PLVideoEditingOverlayView *)v3 bounds];
    CGFloat x = v15.origin.x;
    CGFloat y = v15.origin.y;
    CGFloat width = v15.size.width;
    CGFloat height = v15.size.height;
    v9 = (UILabel *)objc_msgSend(objc_alloc(MEMORY[0x1E4F42B38]), "initWithFrame:", 0.0, 16.0, CGRectGetWidth(v15), 32.0);
    v4->_titleLabel = v9;
    [(UILabel *)v9 setOpaque:0];
    -[UILabel setBackgroundColor:](v4->_titleLabel, "setBackgroundColor:", [MEMORY[0x1E4F428B8] clearColor]);
    -[UILabel setFont:](v4->_titleLabel, "setFont:", [MEMORY[0x1E4F42A30] boldSystemFontOfSize:18.0]);
    [(UILabel *)v4->_titleLabel setTextAlignment:1];
    [(PLVideoEditingOverlayView *)v4 addSubview:v4->_titleLabel];
    [(UILabel *)v4->_titleLabel setAutoresizingMask:34];

    v16.origin.CGFloat x = x;
    v16.origin.CGFloat y = y;
    v16.size.CGFloat width = width;
    v16.size.CGFloat height = height;
    double v10 = CGRectGetWidth(v16);
    [(PLVideoEditingOverlayView *)v4 bounds];
    v11 = (UITextView *)objc_msgSend(objc_alloc(MEMORY[0x1E4F42F58]), "initWithFrame:textContainer:", 0, 0.0, 48.0, v10, CGRectGetMaxY(v17) + -48.0);
    v4->_bodyLabel = v11;
    [(UITextView *)v11 setEditable:0];
    [(UITextView *)v4->_bodyLabel setSelectable:0];
    -[UITextView setTextContainerInset:](v4->_bodyLabel, "setTextContainerInset:", *MEMORY[0x1E4F437F8], *(double *)(MEMORY[0x1E4F437F8] + 8), *(double *)(MEMORY[0x1E4F437F8] + 16), *(double *)(MEMORY[0x1E4F437F8] + 24));
    [(UITextView *)v4->_bodyLabel setOpaque:0];
    -[UITextView setBackgroundColor:](v4->_bodyLabel, "setBackgroundColor:", [MEMORY[0x1E4F428B8] clearColor]);
    -[UITextView setFont:](v4->_bodyLabel, "setFont:", [MEMORY[0x1E4F42A30] systemFontOfSize:14.0]);
    [(UITextView *)v4->_bodyLabel setTextAlignment:1];
    [(PLVideoEditingOverlayView *)v4 addSubview:v4->_bodyLabel];
    [(UITextView *)v4->_bodyLabel setAutoresizingMask:34];

    [(PLVideoEditingOverlayView *)v4 setOpaque:0];
    id v12 = (id)[objc_alloc(MEMORY[0x1E4F430A8]) initWithPrivateStyle:2020];
    [(PLVideoEditingOverlayView *)v4 addSubview:v12];
    [(PLVideoEditingOverlayView *)v4 sendSubviewToBack:v12];
    [(PLVideoEditingOverlayView *)v4 setClipsToBounds:1];
    objc_msgSend((id)-[PLVideoEditingOverlayView layer](v4, "layer"), "setCornerRadius:", 9.0);
  }
  return v4;
}

@end