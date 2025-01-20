@interface PreviewViewController
- (_TtC5TeaUI21PreviewViewController)initWithCoder:(id)a3;
- (_TtC5TeaUI21PreviewViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
@end

@implementation PreviewViewController

- (_TtC5TeaUI21PreviewViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1B5E56E5C();
}

- (void)viewDidLoad
{
  v2 = self;
  PreviewViewController.viewDidLoad()();
}

- (void)viewDidDisappear:(BOOL)a3
{
  v4 = self;
  PreviewViewController.viewDidDisappear(_:)(a3);
}

- (void)viewWillAppear:(BOOL)a3
{
  v4 = self;
  PreviewViewController.viewWillAppear(_:)(a3);
}

- (void)viewWillLayoutSubviews
{
  v2 = self;
  PreviewViewController.viewWillLayoutSubviews()();
}

- (_TtC5TeaUI21PreviewViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3) {
    sub_1B61B20F0();
  }
  id v5 = a4;
  PreviewViewController.init(nibName:bundle:)();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5TeaUI21PreviewViewController_previewedViewController));
  swift_unknownObjectWeakDestroy();
}

@end