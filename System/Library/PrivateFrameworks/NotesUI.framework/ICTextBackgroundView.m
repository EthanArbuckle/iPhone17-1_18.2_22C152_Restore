@interface ICTextBackgroundView
- (ICTextBackgroundView)initWithCoder:(id)a3;
- (ICTextBackgroundView)initWithFrame:(CGRect)a3;
- (UIView)contentView;
- (id)backgroundColor;
- (void)createLayout;
- (void)setBackgroundColor:(id)a3;
@end

@implementation ICTextBackgroundView

- (ICTextBackgroundView)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)ICTextBackgroundView;
  v3 = -[ICTextBackgroundView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3) {
    [(ICTextBackgroundView *)v3 createLayout];
  }
  return v4;
}

- (ICTextBackgroundView)initWithCoder:(id)a3
{
  v10.receiver = self;
  v10.super_class = (Class)ICTextBackgroundView;
  v3 = [(ICTextBackgroundView *)&v10 initWithCoder:a3];
  v4 = v3;
  if (v3)
  {
    [(ICTextBackgroundView *)v3 createLayout];
    v9.receiver = v4;
    v9.super_class = (Class)ICTextBackgroundView;
    v5 = [(ICTextBackgroundView *)&v9 backgroundColor];
    objc_super v6 = [(ICTextBackgroundView *)v4 contentView];
    [v6 setBackgroundColor:v5];

    v8.receiver = v4;
    v8.super_class = (Class)ICTextBackgroundView;
    [(ICTextBackgroundView *)&v8 setBackgroundColor:0];
  }
  return v4;
}

- (void)createLayout
{
  [(ICTextBackgroundView *)self setUserInteractionEnabled:0];
  id v3 = [(ICTextBackgroundView *)self contentView];
  [(ICTextBackgroundView *)self addSubview:v3];
}

- (id)backgroundColor
{
  v2 = [(ICTextBackgroundView *)self contentView];
  id v3 = [v2 backgroundColor];

  return v3;
}

- (void)setBackgroundColor:(id)a3
{
  id v4 = a3;
  id v5 = [(ICTextBackgroundView *)self contentView];
  [v5 setBackgroundColor:v4];
}

- (UIView)contentView
{
  contentView = self->_contentView;
  if (!contentView)
  {
    id v4 = (UIView *)objc_alloc_init(MEMORY[0x1E4FB1EB0]);
    id v5 = self->_contentView;
    self->_contentView = v4;

    [(UIView *)self->_contentView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIView *)self->_contentView setUserInteractionEnabled:0];
    contentView = self->_contentView;
  }
  return contentView;
}

- (void).cxx_destruct
{
}

@end