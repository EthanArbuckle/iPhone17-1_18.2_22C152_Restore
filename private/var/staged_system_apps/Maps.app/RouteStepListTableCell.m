@interface RouteStepListTableCell
+ (Class)stepViewClass;
+ (double)heightForItem:(id)a3 width:(double)a4 maximumHeight:(double)a5;
+ (id)_fallbackBackgroundColor;
- (BOOL)shouldUseTextToBottomConstraint;
- (RouteStepItem)item;
- (RouteStepListTableCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (void)setItem:(id)a3;
- (void)setShouldUseTextToBottomConstraint:(BOOL)a3;
@end

@implementation RouteStepListTableCell

+ (Class)stepViewClass
{
  return (Class)objc_opt_class();
}

- (RouteStepListTableCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v24.receiver = self;
  v24.super_class = (Class)RouteStepListTableCell;
  v4 = [(RouteStepListTableCell *)&v24 initWithStyle:a3 reuseIdentifier:a4];
  if (v4)
  {
    v5 = (objc_class *)objc_opt_class();
    v6 = NSStringFromClass(v5);
    [(RouteStepListTableCell *)v4 setAccessibilityIdentifier:v6];

    uint64_t v7 = objc_opt_new();
    backgroundView = v4->_backgroundView;
    v4->_backgroundView = (UIView *)v7;

    [(UIView *)v4->_backgroundView setTranslatesAutoresizingMaskIntoConstraints:0];
    v9 = [(id)objc_opt_class() _fallbackBackgroundColor];
    [(UIView *)v4->_backgroundView setBackgroundColor:v9];

    [(RouteStepListTableCell *)v4 addSubview:v4->_backgroundView];
    LODWORD(v10) = 1148846080;
    v11 = [(UIView *)v4->_backgroundView _maps_constraintsEqualToEdgesOfView:v4 priority:v10];
    v12 = [v11 allConstraints];
    +[NSLayoutConstraint activateConstraints:v12];

    id v13 = objc_msgSend(objc_msgSend((id)objc_opt_class(), "stepViewClass"), "alloc");
    v14 = [(RouteStepListTableCell *)v4 contentView];
    [v14 bounds];
    v15 = [v13 initWithFrame:];
    stepView = v4->_stepView;
    v4->_stepView = v15;

    [(RouteStepListView *)v4->_stepView setTranslatesAutoresizingMaskIntoConstraints:0];
    v17 = [(RouteStepListTableCell *)v4 contentView];
    [v17 addSubview:v4->_stepView];

    v18 = v4->_stepView;
    v19 = [(RouteStepListTableCell *)v4 contentView];
    LODWORD(v20) = 1148846080;
    v21 = [(RouteStepListView *)v18 _maps_constraintsEqualToEdgesOfView:v19 priority:v20];
    v22 = [v21 allConstraints];
    +[NSLayoutConstraint activateConstraints:v22];
  }
  return v4;
}

- (void)setShouldUseTextToBottomConstraint:(BOOL)a3
{
}

- (BOOL)shouldUseTextToBottomConstraint
{
  return [(RouteStepListView *)self->_stepView shouldUseTextToBottomConstraint];
}

+ (double)heightForItem:(id)a3 width:(double)a4 maximumHeight:(double)a5
{
  id v7 = a3;
  objc_msgSend(objc_msgSend((id)objc_opt_class(), "stepViewClass"), "heightForItem:width:maximumHeight:", v7, a4, a5);
  double v9 = v8;

  return v9;
}

- (void)setItem:(id)a3
{
  id v4 = a3;
  [(RouteStepListView *)self->_stepView setItem:v4];
  id v11 = v4;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v5 = v11;
  }
  else {
    v5 = 0;
  }
  id v6 = v5;

  if (v6)
  {
    id v7 = +[UIColor clearColor];
    [(RouteStepListView *)self->_stepView setBackgroundColor:v7];

    uint64_t v8 = [v6 backgroundColor];
    if (!v8)
    {
      double v9 = [(id)objc_opt_class() _fallbackBackgroundColor];
      [(UIView *)self->_backgroundView setBackgroundColor:v9];

      double v10 = 0;
      goto LABEL_9;
    }
  }
  else
  {
    uint64_t v8 = [(id)objc_opt_class() _fallbackBackgroundColor];
  }
  double v10 = (void *)v8;
  [(UIView *)self->_backgroundView setBackgroundColor:v8];
LABEL_9:
}

- (RouteStepItem)item
{
  return [(RouteStepListView *)self->_stepView item];
}

+ (id)_fallbackBackgroundColor
{
  return +[UIColor secondarySystemGroupedBackgroundColor];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backgroundView, 0);

  objc_storeStrong((id *)&self->_stepView, 0);
}

@end