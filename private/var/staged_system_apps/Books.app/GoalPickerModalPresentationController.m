@interface GoalPickerModalPresentationController
- (CGRect)frameOfPresentedViewInContainerView;
- (_TtC5Books37GoalPickerModalPresentationController)initWithPresentedViewController:(id)a3 presentingViewController:(id)a4;
@end

@implementation GoalPickerModalPresentationController

- (_TtC5Books37GoalPickerModalPresentationController)initWithPresentedViewController:(id)a3 presentingViewController:(id)a4
{
  v12.receiver = self;
  v12.super_class = (Class)swift_getObjectType();
  id v6 = a3;
  id v7 = a4;
  v8 = [(GoalPickerModalPresentationController *)&v12 initWithPresentedViewController:v6 presentingViewController:v7];
  sub_10068F3D8();
  v9 = v8;
  Class isa = sub_1007FEAD0(0.0, 0.0, 0.0, 0.49818).super.isa;
  -[GoalPickerModalPresentationController setDimmingViewBackgroundColor:](v9, "setDimmingViewBackgroundColor:", isa, v12.receiver, v12.super_class);

  return v9;
}

- (CGRect)frameOfPresentedViewInContainerView
{
  v2 = self;
  double v3 = sub_10072FBA8();
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;

  double v10 = v3;
  double v11 = v5;
  double v12 = v7;
  double v13 = v9;
  result.size.height = v13;
  result.size.width = v12;
  result.origin.y = v11;
  result.origin.x = v10;
  return result;
}

@end