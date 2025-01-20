@interface ActionButtonConfigurationViewController
- (_TtC34SystemActionConfigurationExtension39ActionButtonConfigurationViewController)initWithCoder:(id)a3;
- (_TtC34SystemActionConfigurationExtension39ActionButtonConfigurationViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
@end

@implementation ActionButtonConfigurationViewController

- (_TtC34SystemActionConfigurationExtension39ActionButtonConfigurationViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1000063C4();
}

- (void)viewDidLoad
{
  v2 = self;
  sub_1000064A0();
}

- (void)viewDidLayoutSubviews
{
  v2 = self;
  sub_100006A2C();
}

- (_TtC34SystemActionConfigurationExtension39ActionButtonConfigurationViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3) {
    sub_100015080();
  }
  id v5 = a4;
  sub_100006B30();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC34SystemActionConfigurationExtension39ActionButtonConfigurationViewController_materialView));
  id v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC34SystemActionConfigurationExtension39ActionButtonConfigurationViewController_embeddedViewController);
}

@end