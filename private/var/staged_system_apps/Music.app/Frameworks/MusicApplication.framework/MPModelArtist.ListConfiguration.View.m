@interface MPModelArtist.ListConfiguration.View
- (CGSize)sizeThatFits:(CGSize)a3;
- (_TtCVE16MusicApplicationCSo13MPModelArtist17ListConfiguration4View)initWithCoder:(id)a3;
- (_TtCVE16MusicApplicationCSo13MPModelArtist17ListConfiguration4View)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation MPModelArtist.ListConfiguration.View

- (_TtCVE16MusicApplicationCSo13MPModelArtist17ListConfiguration4View)initWithCoder:(id)a3
{
  uint64_t v4 = OBJC_IVAR____TtCVE16MusicApplicationCSo13MPModelArtist17ListConfiguration4View_favoriteIndicator;
  id v5 = a3;
  *(Class *)((char *)&self->super.super.super.isa + v4) = (Class)sub_1402F8();
  uint64_t v6 = OBJC_IVAR____TtCVE16MusicApplicationCSo13MPModelArtist17ListConfiguration4View_nameLabel;
  *(Class *)((char *)&self->super.super.super.isa + v6) = (Class)[objc_allocWithZone((Class)UILabel) init];

  result = (_TtCVE16MusicApplicationCSo13MPModelArtist17ListConfiguration4View *)sub_AB8280();
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  v2 = self;
  sub_140B28();
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  v3 = self;
  double v4 = sub_140EE4();
  double v6 = v5;

  double v7 = v4;
  double v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (_TtCVE16MusicApplicationCSo13MPModelArtist17ListConfiguration4View)initWithFrame:(CGRect)a3
{
  CGSize result = (_TtCVE16MusicApplicationCSo13MPModelArtist17ListConfiguration4View *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtCVE16MusicApplicationCSo13MPModelArtist17ListConfiguration4View_favoriteIndicator));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtCVE16MusicApplicationCSo13MPModelArtist17ListConfiguration4View_artworkView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtCVE16MusicApplicationCSo13MPModelArtist17ListConfiguration4View_nameLabel));
  v3 = (char *)self + OBJC_IVAR____TtCVE16MusicApplicationCSo13MPModelArtist17ListConfiguration4View_typedConfiguration;

  sub_14325C((uint64_t)v3);
}

@end