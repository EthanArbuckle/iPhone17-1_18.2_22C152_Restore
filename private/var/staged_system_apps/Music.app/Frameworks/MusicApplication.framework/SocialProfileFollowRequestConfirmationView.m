@interface SocialProfileFollowRequestConfirmationView
- (CGSize)sizeThatFits:(CGSize)a3;
- (_TtC16MusicApplication42SocialProfileFollowRequestConfirmationView)init;
- (_TtC16MusicApplication42SocialProfileFollowRequestConfirmationView)initWithCoder:(id)a3;
- (_TtC16MusicApplication42SocialProfileFollowRequestConfirmationView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation SocialProfileFollowRequestConfirmationView

- (_TtC16MusicApplication42SocialProfileFollowRequestConfirmationView)init
{
  return (_TtC16MusicApplication42SocialProfileFollowRequestConfirmationView *)sub_37634();
}

- (_TtC16MusicApplication42SocialProfileFollowRequestConfirmationView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_38D6C();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_37FA8();
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double width = a3.width;
  v4 = self;
  sub_38368(width);
  double v6 = v5;
  double v8 = v7;

  double v9 = v6;
  double v10 = v8;
  result.height = v10;
  result.double width = v9;
  return result;
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5 = a3;
  double v6 = self;
  sub_385D8((uint64_t)a3);
}

- (_TtC16MusicApplication42SocialProfileFollowRequestConfirmationView)initWithFrame:(CGRect)a3
{
  CGSize result = (_TtC16MusicApplication42SocialProfileFollowRequestConfirmationView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  sub_1A528(*(uint64_t *)((char *)&self->super.super.super.isa
                       + OBJC_IVAR____TtC16MusicApplication42SocialProfileFollowRequestConfirmationView_acceptButtonHandler));
  sub_1A528(*(uint64_t *)((char *)&self->super.super.super.isa
                       + OBJC_IVAR____TtC16MusicApplication42SocialProfileFollowRequestConfirmationView_declineButtonHandler));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication42SocialProfileFollowRequestConfirmationView_backgroundView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication42SocialProfileFollowRequestConfirmationView_titleCompositingView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication42SocialProfileFollowRequestConfirmationView_acceptButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication42SocialProfileFollowRequestConfirmationView_declineButton));
  swift_release();

  swift_release();
}

@end