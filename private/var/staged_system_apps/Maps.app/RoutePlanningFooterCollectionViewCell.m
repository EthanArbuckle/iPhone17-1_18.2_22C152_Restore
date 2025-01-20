@interface RoutePlanningFooterCollectionViewCell
+ (Class)_contentViewClass;
+ (double)heightForItem:(id)a3 width:(double)a4 maximumHeight:(double)a5;
- (BOOL)shouldUseTextToBottomConstraint;
- (RoutePlanningFooterCollectionViewCell)initWithFrame:(CGRect)a3;
- (RouteStepItem)item;
- (void)setItem:(id)a3;
- (void)setShouldUseTextToBottomConstraint:(BOOL)a3;
@end

@implementation RoutePlanningFooterCollectionViewCell

+ (Class)_contentViewClass
{
  return (Class)objc_opt_class();
}

- (RoutePlanningFooterCollectionViewCell)initWithFrame:(CGRect)a3
{
  v5.receiver = self;
  v5.super_class = (Class)RoutePlanningFooterCollectionViewCell;
  v3 = -[RoutePlanningFooterCollectionViewCell initWithFrame:](&v5, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3) {
    +[RoutingAppearanceManager configureBackgroundViewForStepCell:v3];
  }
  return v3;
}

- (void)setItem:(id)a3
{
  id v5 = a3;
  objc_storeStrong((id *)&self->_item, a3);
  id v10 = v5;
  id v6 = [v10 commandSet];
  v7 = [(RoutePlanningFooterCollectionViewCell *)self footerView];
  [v7 setVisibleCommandSet:v6];

  v8 = [v10 delegate];

  v9 = [(RoutePlanningFooterCollectionViewCell *)self footerView];
  [v9 setDelegate:v8];
}

+ (double)heightForItem:(id)a3 width:(double)a4 maximumHeight:(double)a5
{
  uint64_t v6 = qword_10160FE80;
  id v7 = a3;
  if (v6 != -1) {
    dispatch_once(&qword_10160FE80, &stru_1012FFAE8);
  }
  [qword_10160FE88 setFrame:0.0, 0.0, a4, 1.79769313e308];
  id v8 = [v7 commandSet];

  [(id)qword_10160FE88 setVisibleCommandSet:v8];
  [qword_10160FE88 systemLayoutSizeFittingSize:UILayoutFittingCompressedSize.width, UILayoutFittingCompressedSize.height];
  return v9;
}

- (RouteStepItem)item
{
  return self->_item;
}

- (BOOL)shouldUseTextToBottomConstraint
{
  return self->_shouldUseTextToBottomConstraint;
}

- (void)setShouldUseTextToBottomConstraint:(BOOL)a3
{
  self->_shouldUseTextToBottomConstraint = a3;
}

- (void).cxx_destruct
{
}

@end