@interface BKGoalPickerViewController
+ (void)createAsync:(int64_t)a3 :(int64_t)a4 :(id)a5 :(id)a6;
- (BKGoalPickerViewController)initWithCoder:(id)a3;
- (BKGoalPickerViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (BOOL)gestureRecognizerShouldBegin:(id)a3;
- (BOOL)shouldAutorotate;
- (UIButton)doneButton;
- (UILabel)titleLabel;
- (UIPickerView)picker;
- (UIView)containerView;
- (UIView)titleView;
- (double)pickerView:(id)a3 widthForComponent:(int64_t)a4;
- (id)pickerView:(id)a3 titleForRow:(int64_t)a4 forComponent:(int64_t)a5;
- (id)presentationControllerForPresentedViewController:(id)a3 presentingViewController:(id)a4 sourceViewController:(id)a5;
- (int64_t)modalPresentationStyle;
- (int64_t)numberOfComponentsInPickerView:(id)a3;
- (int64_t)pickerView:(id)a3 numberOfRowsInComponent:(int64_t)a4;
- (unint64_t)supportedInterfaceOrientations;
- (void)_traitCollectionDidChangeWithSender:(id)a3 previousTraitCollection:(id)a4;
- (void)backgroundTapped:(id)a3;
- (void)doneButtonPressed:(id)a3;
- (void)pickerView:(id)a3 didSelectRow:(int64_t)a4 inComponent:(int64_t)a5;
- (void)presentationControllerDidDismiss:(id)a3;
- (void)setContainerView:(id)a3;
- (void)setDoneButton:(id)a3;
- (void)setPicker:(id)a3;
- (void)setTitleLabel:(id)a3;
- (void)setTitleView:(id)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
@end

@implementation BKGoalPickerViewController

- (UIView)containerView
{
  Strong = (void *)swift_unknownObjectWeakLoadStrong();

  return (UIView *)Strong;
}

- (void)setContainerView:(id)a3
{
}

- (UIView)titleView
{
  Strong = (void *)swift_unknownObjectWeakLoadStrong();

  return (UIView *)Strong;
}

- (void)setTitleView:(id)a3
{
}

- (UIPickerView)picker
{
  Strong = (void *)swift_unknownObjectWeakLoadStrong();

  return (UIPickerView *)Strong;
}

- (void)setPicker:(id)a3
{
}

- (UILabel)titleLabel
{
  Strong = (void *)swift_unknownObjectWeakLoadStrong();

  return (UILabel *)Strong;
}

- (void)setTitleLabel:(id)a3
{
}

- (UIButton)doneButton
{
  Strong = (void *)swift_unknownObjectWeakLoadStrong();

  return (UIButton *)Strong;
}

- (void)setDoneButton:(id)a3
{
}

- (int64_t)modalPresentationStyle
{
  return 4;
}

+ (void)createAsync:(int64_t)a3 :(int64_t)a4 :(id)a5 :(id)a6
{
  swift_unknownObjectRetain();
  id v10 = a6;
  sub_100660100(a3, a4, (uint64_t)a5, v10);
  swift_unknownObjectRelease();
}

- (BKGoalPickerViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1006603D8();
}

- (BOOL)shouldAutorotate
{
  id v3 = self;
  v4 = self;
  id v5 = [v3 currentDevice];
  id v6 = [v5 userInterfaceIdiom];

  return v6 == (id)1;
}

- (void)viewDidLoad
{
  v2 = self;
  sub_10065DAA0();
}

- (void)_traitCollectionDidChangeWithSender:(id)a3 previousTraitCollection:(id)a4
{
  swift_unknownObjectRetain();
  id v6 = a4;
  v7 = self;
  sub_1007FEEC0();
  swift_unknownObjectRelease();
  sub_10065E374();

  _s5Books15CurrentPageViewVwxx_0((uint64_t)&v8);
}

- (void)viewWillAppear:(BOOL)a3
{
  v4 = self;
  sub_10065E530(a3);
}

- (void)viewWillLayoutSubviews
{
  v2 = self;
  sub_10065E63C();
}

- (unint64_t)supportedInterfaceOrientations
{
  id v3 = self;
  v4 = self;
  id v5 = [v3 currentDevice];
  id v6 = [v5 userInterfaceIdiom];

  if (v6 == (id)1) {
    return 30;
  }
  else {
    return 2;
  }
}

- (void)doneButtonPressed:(id)a3
{
  swift_unknownObjectRetain();
  v4 = self;
  sub_1007FEEC0();
  swift_unknownObjectRelease();
  sub_10065EC8C(1);
  [(BKGoalPickerViewController *)v4 dismissViewControllerAnimated:1 completion:0];

  _s5Books15CurrentPageViewVwxx_0((uint64_t)&v5);
}

- (void)backgroundTapped:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  sub_10065EC8C(1);
  [(BKGoalPickerViewController *)v5 dismissViewControllerAnimated:1 completion:0];
}

- (BKGoalPickerViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (BKGoalPickerViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy();
  swift_unknownObjectWeakDestroy();
  swift_unknownObjectWeakDestroy();
  swift_unknownObjectWeakDestroy();
  swift_unknownObjectWeakDestroy();

  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  id v3 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___BKGoalPickerViewController_separatorView);
}

- (int64_t)numberOfComponentsInPickerView:(id)a3
{
  return 1;
}

- (int64_t)pickerView:(id)a3 numberOfRowsInComponent:(int64_t)a4
{
  return (*(void **)((char *)&self->super.super.super.isa + OBJC_IVAR___BKGoalPickerViewController_model))[2];
}

- (id)pickerView:(id)a3 titleForRow:(int64_t)a4 forComponent:(int64_t)a5
{
  id v7 = a3;
  uint64_t v8 = self;
  sub_100660800(v7, a4);
  uint64_t v10 = v9;

  if (v10)
  {
    NSString v11 = sub_1007FDC30();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v11 = 0;
  }

  return v11;
}

- (void)pickerView:(id)a3 didSelectRow:(int64_t)a4 inComponent:(int64_t)a5
{
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___BKGoalPickerViewController_selectedRow) = (Class)a4;
  id v7 = a3;
  uint64_t v8 = self;
  sub_10065EC8C(0);
  sub_10065E8F0();
  sub_10065F1D4(v7, a4);
}

- (double)pickerView:(id)a3 widthForComponent:(int64_t)a4
{
  uint64_t v5 = qword_100B230D8;
  id v6 = a3;
  id v7 = self;
  if (v5 != -1) {
    swift_once();
  }
  double v8 = *(double *)&qword_100B40640;

  return v8;
}

- (void)presentationControllerDidDismiss:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  sub_10065EC8C(1);
}

- (id)presentationControllerForPresentedViewController:(id)a3 presentingViewController:(id)a4 sourceViewController:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  NSString v11 = self;
  id v12 = sub_10065F5F8((uint64_t)v8, (uint64_t)a4, v10);

  return v12;
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  Strong = (void *)swift_unknownObjectWeakLoadStrong();
  id v6 = a3;
  id v7 = self;
  [v6 locationInView:Strong];
  CGFloat v9 = v8;
  CGFloat v11 = v10;

  id v12 = (void *)swift_unknownObjectWeakLoadStrong();
  if (v12)
  {
    v13 = v12;
    [v12 bounds];
    CGFloat v15 = v14;
    CGFloat v17 = v16;
    CGFloat v19 = v18;
    CGFloat v21 = v20;

    v24.origin.x = v15;
    v24.origin.y = v17;
    v24.size.width = v19;
    v24.size.height = v21;
    v23.x = v9;
    v23.y = v11;
    LOBYTE(v13) = CGRectContainsPoint(v24, v23);

    LOBYTE(v12) = v13 ^ 1;
  }
  else
  {
    __break(1u);
  }
  return (char)v12;
}

@end