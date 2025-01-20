@interface WFCompactHighlightedView
- (NSArray)requiredVisualStyleCategories;
- (UIView)backgroundView;
- (UIView)contentDimmingView;
- (UIView)contentView;
- (WFCompactHighlightedView)initWithFrame:(CGRect)a3;
- (void)didAddSubview:(id)a3;
- (void)setBackgroundView:(id)a3;
- (void)setContentDimmingView:(id)a3;
- (void)setContentView:(id)a3;
- (void)setVisualStylingProvider:(id)a3 forCategory:(int64_t)a4;
- (void)touchesBegan:(id)a3 withEvent:(id)a4;
- (void)touchesCancelled:(id)a3 withEvent:(id)a4;
- (void)touchesEnded:(id)a3 withEvent:(id)a4;
- (void)touchesMoved:(id)a3 withEvent:(id)a4;
@end

@implementation WFCompactHighlightedView

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_contentDimmingView);
  objc_destroyWeak((id *)&self->_backgroundView);
  objc_storeStrong((id *)&self->_contentView, 0);
}

- (void)setContentDimmingView:(id)a3
{
}

- (UIView)contentDimmingView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_contentDimmingView);
  return (UIView *)WeakRetained;
}

- (void)setBackgroundView:(id)a3
{
}

- (UIView)backgroundView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_backgroundView);
  return (UIView *)WeakRetained;
}

- (void)setContentView:(id)a3
{
}

- (UIView)contentView
{
  return self->_contentView;
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  v6.receiver = self;
  v6.super_class = (Class)WFCompactHighlightedView;
  [(WFCompactHighlightedView *)&v6 touchesEnded:a3 withEvent:a4];
  v5 = [(WFCompactHighlightedView *)self backgroundView];
  [v5 setHidden:1];
}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  v6.receiver = self;
  v6.super_class = (Class)WFCompactHighlightedView;
  [(WFCompactHighlightedView *)&v6 touchesCancelled:a3 withEvent:a4];
  v5 = [(WFCompactHighlightedView *)self backgroundView];
  [v5 setHidden:1];
}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
  v20.receiver = self;
  v20.super_class = (Class)WFCompactHighlightedView;
  id v6 = a3;
  [(WFCompactHighlightedView *)&v20 touchesMoved:v6 withEvent:a4];
  [(WFCompactHighlightedView *)self bounds];
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  CGFloat v12 = v11;
  CGFloat v14 = v13;
  v15 = [v6 anyObject];

  [v15 locationInView:self];
  v21.x = v16;
  v21.y = v17;
  v22.origin.x = v8;
  v22.origin.y = v10;
  v22.size.width = v12;
  v22.size.height = v14;
  BOOL v18 = !CGRectContainsPoint(v22, v21);
  v19 = [(WFCompactHighlightedView *)self backgroundView];
  [v19 setHidden:v18];
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  v6.receiver = self;
  v6.super_class = (Class)WFCompactHighlightedView;
  [(WFCompactHighlightedView *)&v6 touchesBegan:a3 withEvent:a4];
  v5 = [(WFCompactHighlightedView *)self backgroundView];
  [v5 setHidden:0];
}

- (void)setVisualStylingProvider:(id)a3 forCategory:(int64_t)a4
{
  if (a4 == 2)
  {
    id v6 = a3;
    id v7 = [(WFCompactHighlightedView *)self backgroundView];
    [v6 automaticallyUpdateView:v7 withStyle:4];
  }
}

- (NSArray)requiredVisualStyleCategories
{
  return (NSArray *)&unk_26E1CA858;
}

- (void)didAddSubview:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)WFCompactHighlightedView;
  [(WFCompactHighlightedView *)&v5 didAddSubview:a3];
  uint64_t v4 = [(WFCompactHighlightedView *)self backgroundView];
  [(WFCompactHighlightedView *)self bringSubviewToFront:v4];
}

- (WFCompactHighlightedView)initWithFrame:(CGRect)a3
{
  v7.receiver = self;
  v7.super_class = (Class)WFCompactHighlightedView;
  v3 = -[WFCompactHighlightedView initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    uint64_t v4 = objc_opt_new();
    [v4 setHidden:1];
    [(WFCompactHighlightedView *)v3 bounds];
    objc_msgSend(v4, "setFrame:");
    [v4 setAutoresizingMask:18];
    [(WFCompactHighlightedView *)v3 addSubview:v4];
    objc_storeWeak((id *)&v3->_backgroundView, v4);
    objc_super v5 = v3;
  }
  return v3;
}

@end