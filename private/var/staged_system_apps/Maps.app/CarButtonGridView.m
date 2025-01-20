@interface CarButtonGridView
- (CarButtonGridView)initWithFrame:(CGRect)a3;
- (NSArray)buttons;
- (NSMutableArray)buttonArray;
- (UIStackView)buttonStack;
- (void)addButton:(id)a3;
- (void)resetButtons;
- (void)setButtonArray:(id)a3;
- (void)setButtonStack:(id)a3;
@end

@implementation CarButtonGridView

- (CarButtonGridView)initWithFrame:(CGRect)a3
{
  v31.receiver = self;
  v31.super_class = (Class)CarButtonGridView;
  v3 = -[CarButtonGridView initWithFrame:](&v31, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    [(CarButtonGridView *)v3 setAccessibilityIdentifier:@"CarButtonGridView"];
    uint64_t v5 = objc_opt_new();
    buttonArray = v4->_buttonArray;
    v4->_buttonArray = (NSMutableArray *)v5;

    id v7 = [objc_alloc((Class)UIStackView) initWithFrame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height];
    [(CarButtonGridView *)v4 setButtonStack:v7];

    v8 = [(CarButtonGridView *)v4 buttonStack];
    [v8 setTranslatesAutoresizingMaskIntoConstraints:0];

    v9 = [(CarButtonGridView *)v4 buttonStack];
    [v9 setAxis:1];

    v10 = [(CarButtonGridView *)v4 buttonStack];
    [v10 setDistribution:1];

    v11 = [(CarButtonGridView *)v4 buttonStack];
    [v11 setSpacing:20.0];

    v12 = [(CarButtonGridView *)v4 buttonStack];
    [(CarButtonGridView *)v4 addSubview:v12];

    v30 = [(CarButtonGridView *)v4 buttonStack];
    v29 = [v30 leadingAnchor];
    v28 = [(CarButtonGridView *)v4 leadingAnchor];
    v27 = [v29 constraintEqualToAnchor:v28];
    v32[0] = v27;
    v26 = [(CarButtonGridView *)v4 buttonStack];
    v25 = [v26 trailingAnchor];
    v24 = [(CarButtonGridView *)v4 trailingAnchor];
    v23 = [v25 constraintEqualToAnchor:v24];
    v32[1] = v23;
    v13 = [(CarButtonGridView *)v4 buttonStack];
    v14 = [v13 topAnchor];
    v15 = [(CarButtonGridView *)v4 topAnchor];
    v16 = [v14 constraintEqualToAnchor:v15];
    v32[2] = v16;
    v17 = [(CarButtonGridView *)v4 buttonStack];
    v18 = [v17 bottomAnchor];
    v19 = [(CarButtonGridView *)v4 bottomAnchor];
    v20 = [v18 constraintEqualToAnchor:v19];
    v32[3] = v20;
    v21 = +[NSArray arrayWithObjects:v32 count:4];

    +[NSLayoutConstraint activateConstraints:v21];
  }
  return v4;
}

- (NSArray)buttons
{
  v2 = [(CarButtonGridView *)self buttonArray];
  id v3 = [v2 copy];

  return (NSArray *)v3;
}

- (void)addButton:(id)a3
{
  id v14 = a3;
  v4 = [(CarButtonGridView *)self buttonArray];
  unsigned __int8 v5 = [v4 containsObject:v14];

  if ((v5 & 1) == 0)
  {
    v6 = [(CarButtonGridView *)self buttonArray];
    [v6 addObject:v14];

    id v7 = [(CarButtonGridView *)self buttonStack];
    v8 = [v7 arrangedSubviews];
    v9 = [v8 lastObject];

    if (!v9
      || ([v9 arrangedSubviews],
          v10 = objc_claimAutoreleasedReturnValue(),
          id v11 = [v10 count],
          v10,
          (unint64_t)v11 >= 2))
    {
      id v12 = [objc_alloc((Class)UIStackView) initWithFrame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height];

      [v12 setAxis:0];
      [v12 setDistribution:1];
      [v12 setSpacing:20.0];
      v13 = [(CarButtonGridView *)self buttonStack];
      [v13 addArrangedSubview:v12];

      v9 = v12;
    }
    [v9 addArrangedSubview:v14];
    [(CarButtonGridView *)self setNeedsLayout];
  }
}

- (void)resetButtons
{
  id v3 = [(CarButtonGridView *)self buttonArray];
  [v3 removeAllObjects];

  v4 = [(CarButtonGridView *)self buttonStack];
  [v4 _maps_setArrangedSubviews:&__NSArray0__struct];

  [(CarButtonGridView *)self setNeedsLayout];
}

- (UIStackView)buttonStack
{
  return self->_buttonStack;
}

- (void)setButtonStack:(id)a3
{
}

- (NSMutableArray)buttonArray
{
  return self->_buttonArray;
}

- (void)setButtonArray:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_buttonArray, 0);

  objc_storeStrong((id *)&self->_buttonStack, 0);
}

@end