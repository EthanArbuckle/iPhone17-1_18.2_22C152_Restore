@interface RouteStepListCollectionCell
+ (Class)stepViewClass;
+ (double)heightForItem:(id)a3 width:(double)a4 maximumHeight:(double)a5;
- (BOOL)shouldUseTextToBottomConstraint;
- (RouteStepItem)item;
- (RouteStepListCollectionCell)initWithFrame:(CGRect)a3;
- (void)setItem:(id)a3;
- (void)setShouldUseTextToBottomConstraint:(BOOL)a3;
@end

@implementation RouteStepListCollectionCell

+ (Class)stepViewClass
{
  return (Class)objc_opt_class();
}

- (RouteStepListCollectionCell)initWithFrame:(CGRect)a3
{
  v20.receiver = self;
  v20.super_class = (Class)RouteStepListCollectionCell;
  v3 = -[RouteStepListCollectionCell initWithFrame:](&v20, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (objc_class *)objc_opt_class();
    v5 = NSStringFromClass(v4);
    [(RouteStepListCollectionCell *)v3 setAccessibilityIdentifier:v5];

    id v6 = objc_msgSend(objc_msgSend((id)objc_opt_class(), "stepViewClass"), "alloc");
    v7 = [(RouteStepListCollectionCell *)v3 contentView];
    [v7 bounds];
    v8 = [v6 initWithFrame:];
    stepView = v3->_stepView;
    v3->_stepView = v8;

    [(RouteStepListView *)v3->_stepView setTranslatesAutoresizingMaskIntoConstraints:0];
    v10 = [(RouteStepListCollectionCell *)v3 contentView];
    [v10 addSubview:v3->_stepView];

    v11 = v3->_stepView;
    v12 = [(RouteStepListCollectionCell *)v3 contentView];
    LODWORD(v13) = 1148846080;
    v14 = [(RouteStepListView *)v11 _maps_constraintsEqualToEdgesOfView:v12 priority:v13];
    v15 = [v14 allConstraints];
    +[NSLayoutConstraint activateConstraints:v15];

    v16 = [(RouteStepListView *)v3->_stepView heightAnchor];
    uint64_t v17 = [v16 constraintEqualToConstant:0.0];
    heightConstraint = v3->_heightConstraint;
    v3->_heightConstraint = (NSLayoutConstraint *)v17;
  }
  return v3;
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
}

- (RouteStepItem)item
{
  return [(RouteStepListView *)self->_stepView item];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_heightConstraint, 0);

  objc_storeStrong((id *)&self->_stepView, 0);
}

@end