@interface _UIInterfaceActionGroupHeaderScrollView
- (UIView)contentView;
- (_UIInterfaceActionGroupHeaderScrollView)initWithContentView:(id)a3;
- (double)_contentFitCanScrollThreshold;
- (void)accessoryInsetsDidChange:(UIEdgeInsets)a3;
- (void)updateConstraints;
@end

@implementation _UIInterfaceActionGroupHeaderScrollView

- (_UIInterfaceActionGroupHeaderScrollView)initWithContentView:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)_UIInterfaceActionGroupHeaderScrollView;
  v6 = -[UIScrollView initWithFrame:](&v10, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  v7 = v6;
  if (v6)
  {
    p_contentView = (id *)&v6->_contentView;
    objc_storeStrong((id *)&v6->_contentView, a3);
    [v5 setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIView *)v7 setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIView *)v7 addSubview:*p_contentView];
    [*p_contentView setClipsToBounds:0];
  }

  return v7;
}

- (double)_contentFitCanScrollThreshold
{
  return 0.5;
}

- (void)accessoryInsetsDidChange:(UIEdgeInsets)a3
{
  v4.receiver = self;
  v4.super_class = (Class)_UIInterfaceActionGroupHeaderScrollView;
  -[UIScrollView accessoryInsetsDidChange:](&v4, sel_accessoryInsetsDidChange_, a3.top, a3.left, a3.bottom, a3.right);
  [(UIView *)self setNeedsUpdateConstraints];
}

- (void)updateConstraints
{
  v29[2] = *MEMORY[0x1E4F143B8];
  v25.receiver = self;
  v25.super_class = (Class)_UIInterfaceActionGroupHeaderScrollView;
  [(UIView *)&v25 updateConstraints];
  if (self->_constraints) {
    objc_msgSend(MEMORY[0x1E4F5B268], "deactivateConstraints:");
  }
  [(UIScrollView *)self accessoryInsets];
  double v4 = v3;
  double v6 = v5;
  v28[0] = @"leftInset";
  v7 = [NSNumber numberWithDouble:v3];
  v28[1] = @"rightInset";
  v29[0] = v7;
  v8 = [NSNumber numberWithDouble:v6];
  v29[1] = v8;
  v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v29 forKeys:v28 count:2];

  contentView = self->_contentView;
  v26 = @"contentView";
  v27 = contentView;
  v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v27 forKeys:&v26 count:1];
  v12 = [MEMORY[0x1E4F1CA48] array];
  v13 = [MEMORY[0x1E4F5B268] constraintsWithVisualFormat:@"H:|-leftInset-[contentView]-rightInset-|" options:0x10000 metrics:v9 views:v11];
  [v12 addObjectsFromArray:v13];

  v14 = [MEMORY[0x1E4F5B268] constraintsWithVisualFormat:@"V:|[contentView]|" options:0 metrics:0 views:v11];
  [v12 addObjectsFromArray:v14];

  v15 = [(UIView *)self heightAnchor];
  v16 = [(UIView *)self->_contentView heightAnchor];
  v17 = [v15 constraintEqualToAnchor:v16];

  LODWORD(v18) = 1144733696;
  [v17 setPriority:v18];
  [v12 addObject:v17];
  v19 = [(UIView *)self widthAnchor];
  v20 = [(UIView *)self->_contentView widthAnchor];
  v21 = [v19 constraintEqualToAnchor:v20 constant:v4 + v6];

  [v12 addObject:v21];
  _UIConstraintsBySortingConstraintsForInsertionPerformance(v12, v22);
  v23 = (NSArray *)objc_claimAutoreleasedReturnValue();
  constraints = self->_constraints;
  self->_constraints = v23;

  [MEMORY[0x1E4F5B268] activateConstraints:self->_constraints];
}

- (UIView)contentView
{
  return self->_contentView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentView, 0);
  objc_storeStrong((id *)&self->_constraints, 0);
}

@end