@interface SocialProfilesAccessoryView
- (_TtC16MusicApplication27SocialProfilesAccessoryView)initWithCoder:(id)a3;
- (_TtC16MusicApplication27SocialProfilesAccessoryView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation SocialProfilesAccessoryView

- (void)layoutSubviews
{
  v2 = self;
  sub_3DF7AC();
}

- (_TtC16MusicApplication27SocialProfilesAccessoryView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  ObjectType = (objc_class *)swift_getObjectType();
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC16MusicApplication27SocialProfilesAccessoryView_accessorySocialPersons) = (Class)_swiftEmptyArrayStorage;
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC16MusicApplication27SocialProfilesAccessoryView_artworkCachingReference) = 0;
  v9 = (_OWORD *)((char *)self + OBJC_IVAR____TtC16MusicApplication27SocialProfilesAccessoryView_overlayMargins);
  long long v10 = *(_OWORD *)&UIEdgeInsetsZero.bottom;
  _OWORD *v9 = *(_OWORD *)&UIEdgeInsetsZero.top;
  v9[1] = v10;
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC16MusicApplication27SocialProfilesAccessoryView_peopleBadgeView) = 0;
  v12.receiver = self;
  v12.super_class = ObjectType;
  return -[SocialProfilesAccessoryView initWithFrame:](&v12, "initWithFrame:", x, y, width, height);
}

- (_TtC16MusicApplication27SocialProfilesAccessoryView)initWithCoder:(id)a3
{
  id v3 = a3;
  v4 = (_TtC16MusicApplication27SocialProfilesAccessoryView *)sub_3E16BC((uint64_t)v3);

  return v4;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_release();
  id v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC16MusicApplication27SocialProfilesAccessoryView_peopleBadgeView);
}

@end