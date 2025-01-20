@interface SocialOnboardingNetworkCell
- (BOOL)isHighlighted;
- (NSString)title;
- (_TtC16MusicApplication27SocialOnboardingNetworkCell)initWithCoder:(id)a3;
- (_TtC16MusicApplication27SocialOnboardingNetworkCell)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)setHighlighted:(BOOL)a3;
- (void)setTitle:(id)a3;
@end

@implementation SocialOnboardingNetworkCell

- (_TtC16MusicApplication27SocialOnboardingNetworkCell)initWithFrame:(CGRect)a3
{
  return (_TtC16MusicApplication27SocialOnboardingNetworkCell *)sub_39D580(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC16MusicApplication27SocialOnboardingNetworkCell)initWithCoder:(id)a3
{
  uint64_t v5 = OBJC_IVAR____TtC16MusicApplication27SocialOnboardingNetworkCell_networkStackView;
  type metadata accessor for SocialOnboardingNetworkStackView();
  id v6 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  id v7 = a3;
  *(Class *)((char *)&self->super.super.super.super.super.super.isa + v5) = (Class)[v6 init];

  result = (_TtC16MusicApplication27SocialOnboardingNetworkCell *)sub_AB8280();
  __break(1u);
  return result;
}

- (NSString)title
{
  swift_bridgeObjectRetain();
  NSString v2 = sub_AB64D0();
  swift_bridgeObjectRelease();

  return (NSString *)v2;
}

- (void)setTitle:(id)a3
{
  uint64_t v5 = sub_AB6510();
  uint64_t v7 = v6;
  id v9 = a3;
  v8 = self;
  sub_39E11C(v5, v7);
}

- (void)layoutSubviews
{
  NSString v2 = self;
  sub_39D93C();
}

- (BOOL)isHighlighted
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for SocialOnboardingNetworkCell();
  return [(SocialOnboardingNetworkCell *)&v3 isHighlighted];
}

- (void)setHighlighted:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for SocialOnboardingNetworkCell();
  id v4 = v5.receiver;
  [(SocialOnboardingNetworkCell *)&v5 setHighlighted:v3];
  sub_39E1F0([v4 isHighlighted]);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication27SocialOnboardingNetworkCell_networkStackView));
}

@end