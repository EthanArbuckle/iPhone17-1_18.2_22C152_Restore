@interface InstallPageInstallingOfferView
- (CGSize)sizeThatFits:(CGSize)a3;
- (_TtC8AppStore30InstallPageInstallingOfferView)initWithCoder:(id)a3;
- (_TtC8AppStore30InstallPageInstallingOfferView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation InstallPageInstallingOfferView

- (_TtC8AppStore30InstallPageInstallingOfferView)initWithFrame:(CGRect)a3
{
  return (_TtC8AppStore30InstallPageInstallingOfferView *)sub_1004BFB44(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC8AppStore30InstallPageInstallingOfferView)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC8AppStore30InstallPageInstallingOfferView_progressView) = 0;
  v4 = (Class *)((char *)&self->super.super.super.super.isa
               + OBJC_IVAR____TtC8AppStore30InstallPageInstallingOfferView_animationCompletionHandler);
  void *v4 = 0;
  v4[1] = 0;
  id v5 = a3;

  result = (_TtC8AppStore30InstallPageInstallingOfferView *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  v3 = self;
  double v4 = sub_1004C0280();
  double v6 = v5;

  double v7 = v4;
  double v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (void)layoutSubviews
{
  v2 = self;
  sub_1004C0584();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore30InstallPageInstallingOfferView_iconView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore30InstallPageInstallingOfferView_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore30InstallPageInstallingOfferView_subtitleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore30InstallPageInstallingOfferView_descriptionLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore30InstallPageInstallingOfferView_offerButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore30InstallPageInstallingOfferView_ageRatingView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore30InstallPageInstallingOfferView_progressView));
  uint64_t v3 = *(uint64_t *)((char *)&self->super.super.super.super.isa
                  + OBJC_IVAR____TtC8AppStore30InstallPageInstallingOfferView_animationCompletionHandler);

  sub_10006012C(v3);
}

@end