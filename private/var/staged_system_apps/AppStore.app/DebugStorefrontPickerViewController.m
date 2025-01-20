@interface DebugStorefrontPickerViewController
- (_TtC8AppStore35DebugStorefrontPickerViewController)initWithCoder:(id)a3;
- (_TtC8AppStore35DebugStorefrontPickerViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (double)pickerView:(id)a3 widthForComponent:(int64_t)a4;
- (id)pickerView:(id)a3 titleForRow:(int64_t)a4 forComponent:(int64_t)a5;
- (int64_t)numberOfComponentsInPickerView:(id)a3;
- (int64_t)pickerView:(id)a3 numberOfRowsInComponent:(int64_t)a4;
- (void)pickerView:(id)a3 didSelectRow:(int64_t)a4 inComponent:(int64_t)a5;
- (void)setStorefront;
- (void)setStorefrontToUS;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
@end

@implementation DebugStorefrontPickerViewController

- (_TtC8AppStore35DebugStorefrontPickerViewController)initWithCoder:(id)a3
{
  result = (_TtC8AppStore35DebugStorefrontPickerViewController *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  v2 = self;
  sub_100328D9C();
}

- (void)viewDidLayoutSubviews
{
  v2 = self;
  sub_100329370();
}

- (void)setStorefront
{
  v2 = self;
  dispatch thunk of StorefrontPickerPagePresenter.updateStorefront()();
}

- (void)setStorefrontToUS
{
  v2 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC8AppStore35DebugStorefrontPickerViewController_countryPicker);
  v3 = self;
  [v2 selectRow:157 inComponent:0 animated:1];
  dispatch thunk of StorefrontPickerPagePresenter.didSelectCountry(at:)();
  [*(id *)((char *)&v3->super.super.super.isa+ OBJC_IVAR____TtC8AppStore35DebugStorefrontPickerViewController_languagePicker) selectRow:0 inComponent:0 animated:1];
  dispatch thunk of StorefrontPickerPagePresenter.didSelectLanguage(at:)();
}

- (int64_t)numberOfComponentsInPickerView:(id)a3
{
  return 1;
}

- (int64_t)pickerView:(id)a3 numberOfRowsInComponent:(int64_t)a4
{
  id v5 = a3;
  v6 = self;
  int64_t v7 = sub_100329E20();

  return v7;
}

- (double)pickerView:(id)a3 widthForComponent:(int64_t)a4
{
  id v5 = a3;
  v6 = self;
  id v7 = [(DebugStorefrontPickerViewController *)v6 view];
  if (v7)
  {
    v9 = v7;
    sub_100084CF0(0, (unint64_t *)&qword_1009828E0);
    LayoutMarginsAware<>.layoutFrame.getter();
    CGFloat v11 = v10;
    CGFloat v13 = v12;
    CGFloat v15 = v14;
    CGFloat v17 = v16;

    v19.origin.x = v11;
    v19.origin.y = v13;
    v19.size.width = v15;
    v19.size.height = v17;
    double Width = CGRectGetWidth(v19);

    return Width;
  }
  else
  {
    __break(1u);
  }
  return result;
}

- (id)pickerView:(id)a3 titleForRow:(int64_t)a4 forComponent:(int64_t)a5
{
  id v6 = a3;
  id v7 = self;
  sub_100329EC4();
  uint64_t v9 = v8;

  if (v9)
  {
    NSString v10 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v10 = 0;
  }

  return v10;
}

- (void)pickerView:(id)a3 didSelectRow:(int64_t)a4 inComponent:(int64_t)a5
{
  id v6 = a3;
  id v7 = self;
  sub_100329F80();
}

- (_TtC8AppStore35DebugStorefrontPickerViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  double result = (_TtC8AppStore35DebugStorefrontPickerViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore35DebugStorefrontPickerViewController_countryPicker));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore35DebugStorefrontPickerViewController_languagePicker));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore35DebugStorefrontPickerViewController_submitButton));
  v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC8AppStore35DebugStorefrontPickerViewController_backToUSButton);
}

@end