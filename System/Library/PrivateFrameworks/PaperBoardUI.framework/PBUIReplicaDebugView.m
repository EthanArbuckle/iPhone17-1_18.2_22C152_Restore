@interface PBUIReplicaDebugView
+ (BOOL)requiresConstraintBasedLayout;
+ (id)debugFont;
- (NSString)title;
- (PBUIReplicaDebugView)initWithFrame:(CGRect)a3;
- (UIColor)color;
- (void)layoutSubviews;
- (void)setColor:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation PBUIReplicaDebugView

+ (id)debugFont
{
  if (debugFont_onceToken != -1) {
    dispatch_once(&debugFont_onceToken, &__block_literal_global_3);
  }
  v2 = (void *)debugFont___font;
  return v2;
}

void __33__PBUIReplicaDebugView_debugFont__block_invoke()
{
  id v2 = [MEMORY[0x1E4F42A38] _preferredFontDescriptorWithTextStyle:*MEMORY[0x1E4F43878] design:*MEMORY[0x1E4F43828] weight:*MEMORY[0x1E4F43928]];
  uint64_t v0 = [MEMORY[0x1E4F42A30] fontWithDescriptor:v2 size:0.0];
  v1 = (void *)debugFont___font;
  debugFont___font = v0;
}

+ (BOOL)requiresConstraintBasedLayout
{
  return 0;
}

- (PBUIReplicaDebugView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v19.receiver = self;
  v19.super_class = (Class)PBUIReplicaDebugView;
  v7 = -[PBUIReplicaDebugView initWithFrame:](&v19, sel_initWithFrame_);
  v8 = v7;
  if (v7)
  {
    v7->_labelViewNeedsLayout = 0;
    uint64_t v9 = objc_msgSend(objc_alloc(MEMORY[0x1E4F42FF0]), "initWithFrame:", x, y, width, height);
    borderView = v8->_borderView;
    v8->_borderView = (UIView *)v9;

    uint64_t v11 = objc_msgSend(objc_alloc(MEMORY[0x1E4F42B38]), "initWithFrame:", x, y, width, height);
    labelView = v8->_labelView;
    v8->_labelView = (UILabel *)v11;

    [(UIView *)v8->_borderView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UILabel *)v8->_labelView setTranslatesAutoresizingMaskIntoConstraints:0];
    v13 = v8->_labelView;
    v14 = [(id)objc_opt_class() debugFont];
    [(UILabel *)v13 setFont:v14];

    [(UILabel *)v8->_labelView setNumberOfLines:1];
    v15 = [(UIView *)v8->_borderView layer];
    id v16 = [MEMORY[0x1E4F428B8] redColor];
    objc_msgSend(v15, "setBorderColor:", objc_msgSend(v16, "CGColor"));

    v17 = [(UIView *)v8->_borderView layer];
    [v17 setBorderWidth:15.0];

    [(PBUIReplicaDebugView *)v8 addSubview:v8->_borderView];
    [(PBUIReplicaDebugView *)v8 addSubview:v8->_labelView];
  }
  return v8;
}

- (void)setTitle:(id)a3
{
  [(UILabel *)self->_labelView setText:a3];
  self->_labelViewNeedsLayout = 1;
  [(PBUIReplicaDebugView *)self setNeedsLayout];
}

- (NSString)title
{
  return [(UILabel *)self->_labelView text];
}

- (void)setColor:(id)a3
{
  id v4 = a3;
  id v7 = v4;
  if (!v4)
  {
    id v4 = [MEMORY[0x1E4F428B8] redColor];
  }
  p_color = &self->_color;
  objc_storeStrong((id *)&self->_color, v4);
  if (!v7) {

  }
  v6 = [(UIView *)self->_borderView layer];
  objc_msgSend(v6, "setBorderColor:", -[UIColor CGColor](*p_color, "CGColor"));
}

- (void)layoutSubviews
{
  borderView = self->_borderView;
  [(PBUIReplicaDebugView *)self bounds];
  -[UIView setFrame:](borderView, "setFrame:");
  if (self->_labelViewNeedsLayout)
  {
    self->_labelViewNeedsLayout = 0;
    [(UILabel *)self->_labelView sizeToFit];
  }
  [(PBUIReplicaDebugView *)self bounds];
  double v5 = v4;
  double v7 = v6;
  [(PBUIReplicaDebugView *)self safeAreaInsets];
  double v9 = v5 + v8;
  double v11 = v7 + v10;
  labelView = self->_labelView;
  [(UILabel *)labelView frame];
  -[UILabel setFrame:](labelView, "setFrame:", v9, v11);
}

- (UIColor)color
{
  return self->_color;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_color, 0);
  objc_storeStrong((id *)&self->_borderView, 0);
  objc_storeStrong((id *)&self->_labelView, 0);
}

@end