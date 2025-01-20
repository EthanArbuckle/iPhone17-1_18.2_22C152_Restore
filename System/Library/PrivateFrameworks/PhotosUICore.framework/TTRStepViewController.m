@interface TTRStepViewController
- (_TtC12PhotosUICoreP33_FCD1DCB97D423C32F6337A2DCF1B8FA821TTRStepViewController)initWithCoder:(id)a3;
- (_TtC12PhotosUICoreP33_FCD1DCB97D423C32F6337A2DCF1B8FA821TTRStepViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)handleBack;
- (void)handleClose;
- (void)viewDidLoad;
@end

@implementation TTRStepViewController

- (_TtC12PhotosUICoreP33_FCD1DCB97D423C32F6337A2DCF1B8FA821TTRStepViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1A9F9DD3C();
}

- (void)viewDidLoad
{
}

- (void)handleClose
{
}

- (void)handleBack
{
  v6 = self;
  v2 = (_TtC12PhotosUICoreP33_FCD1DCB97D423C32F6337A2DCF1B8FA821TTRStepViewController *)[(TTRStepViewController *)v6 navigationController];
  if (v2)
  {
    id v3 = v2;
    id v4 = [(TTRStepViewController *)v2 popViewControllerAnimated:1];

    v5 = v3;
  }
  else
  {
    v5 = v6;
  }
}

- (_TtC12PhotosUICoreP33_FCD1DCB97D423C32F6337A2DCF1B8FA821TTRStepViewController)initWithNibName:(id)a3 bundle:(id)a4
{
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12PhotosUICoreP33_FCD1DCB97D423C32F6337A2DCF1B8FA821TTRStepViewController____lazy_storage___containerView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12PhotosUICoreP33_FCD1DCB97D423C32F6337A2DCF1B8FA821TTRStepViewController____lazy_storage___titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12PhotosUICoreP33_FCD1DCB97D423C32F6337A2DCF1B8FA821TTRStepViewController____lazy_storage___descriptionLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12PhotosUICoreP33_FCD1DCB97D423C32F6337A2DCF1B8FA821TTRStepViewController____lazy_storage___headerView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12PhotosUICoreP33_FCD1DCB97D423C32F6337A2DCF1B8FA821TTRStepViewController____lazy_storage___stackView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12PhotosUICoreP33_FCD1DCB97D423C32F6337A2DCF1B8FA821TTRStepViewController____lazy_storage___closeButton));
  id v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC12PhotosUICoreP33_FCD1DCB97D423C32F6337A2DCF1B8FA821TTRStepViewController____lazy_storage___backButton);
}

@end