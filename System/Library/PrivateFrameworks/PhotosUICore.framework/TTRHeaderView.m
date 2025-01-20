@interface TTRHeaderView
- (_TtC12PhotosUICoreP33_FCD1DCB97D423C32F6337A2DCF1B8FA813TTRHeaderView)init;
- (_TtC12PhotosUICoreP33_FCD1DCB97D423C32F6337A2DCF1B8FA813TTRHeaderView)initWithCoder:(id)a3;
- (_TtC12PhotosUICoreP33_FCD1DCB97D423C32F6337A2DCF1B8FA813TTRHeaderView)initWithFrame:(CGRect)a3;
@end

@implementation TTRHeaderView

- (_TtC12PhotosUICoreP33_FCD1DCB97D423C32F6337A2DCF1B8FA813TTRHeaderView)init
{
  return (_TtC12PhotosUICoreP33_FCD1DCB97D423C32F6337A2DCF1B8FA813TTRHeaderView *)sub_1A9F9C17C();
}

- (_TtC12PhotosUICoreP33_FCD1DCB97D423C32F6337A2DCF1B8FA813TTRHeaderView)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC12PhotosUICoreP33_FCD1DCB97D423C32F6337A2DCF1B8FA813TTRHeaderView____lazy_storage___imageView) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC12PhotosUICoreP33_FCD1DCB97D423C32F6337A2DCF1B8FA813TTRHeaderView____lazy_storage___titleLabel) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC12PhotosUICoreP33_FCD1DCB97D423C32F6337A2DCF1B8FA813TTRHeaderView____lazy_storage___descriptionLabel) = 0;
  id v4 = a3;

  result = (_TtC12PhotosUICoreP33_FCD1DCB97D423C32F6337A2DCF1B8FA813TTRHeaderView *)sub_1AB23C1FC();
  __break(1u);
  return result;
}

- (_TtC12PhotosUICoreP33_FCD1DCB97D423C32F6337A2DCF1B8FA813TTRHeaderView)initWithFrame:(CGRect)a3
{
  result = (_TtC12PhotosUICoreP33_FCD1DCB97D423C32F6337A2DCF1B8FA813TTRHeaderView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12PhotosUICoreP33_FCD1DCB97D423C32F6337A2DCF1B8FA813TTRHeaderView____lazy_storage___imageView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12PhotosUICoreP33_FCD1DCB97D423C32F6337A2DCF1B8FA813TTRHeaderView____lazy_storage___titleLabel));
  v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC12PhotosUICoreP33_FCD1DCB97D423C32F6337A2DCF1B8FA813TTRHeaderView____lazy_storage___descriptionLabel);
}

@end