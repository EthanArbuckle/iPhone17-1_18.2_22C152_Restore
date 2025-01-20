@interface BiographyView
- (CGSize)sizeThatFits:(CGSize)a3;
- (NSArray)accessibilityListStrings;
- (NSArray)accessibilityStackViews;
- (_TtC16MusicApplication13BiographyView)initWithCoder:(id)a3;
- (_TtC16MusicApplication13BiographyView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)music_inheritedLayoutInsetsDidChange;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation BiographyView

- (_TtC16MusicApplication13BiographyView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1840A0();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_18283C();
}

- (void)music_inheritedLayoutInsetsDidChange
{
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for BiographyView();
  v2 = (char *)v4.receiver;
  [(BiographyView *)&v4 music_inheritedLayoutInsetsDidChange];
  [v2 setNeedsLayout];
  id v3 = *(void (**)(char *))&v2[OBJC_IVAR____TtC16MusicApplication13BiographyView_layoutInvalidationHandler];
  if (v3)
  {
    swift_retain();
    v3(v2);
    sub_1A528((uint64_t)v3);
  }
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  v5 = self;
  sub_182B8C(width, height);
  double v7 = v6;
  double v9 = v8;

  double v10 = v7;
  double v11 = v9;
  result.double height = v11;
  result.double width = v10;
  return result;
}

- (void)traitCollectionDidChange:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for BiographyView();
  objc_super v4 = (char *)v7.receiver;
  id v5 = a3;
  [(BiographyView *)&v7 traitCollectionDidChange:v5];
  [v4 setNeedsLayout];
  double v6 = *(void (**)(char *))&v4[OBJC_IVAR____TtC16MusicApplication13BiographyView_layoutInvalidationHandler];
  if (v6)
  {
    swift_retain();
    v6(v4);
    sub_1A528((uint64_t)v6);
  }
}

- (NSArray)accessibilityStackViews
{
  v2 = self;
  sub_18312C();

  type metadata accessor for TextStackView();
  v3.super.isa = sub_AB6990().super.isa;
  swift_bridgeObjectRelease();

  return (NSArray *)v3.super.isa;
}

- (NSArray)accessibilityListStrings
{
  v2 = self;
  sub_1836A8();

  v3.super.isa = sub_AB6990().super.isa;
  swift_bridgeObjectRelease();

  return (NSArray *)v3.super.isa;
}

- (_TtC16MusicApplication13BiographyView)initWithFrame:(CGRect)a3
{
  CGSize result = (_TtC16MusicApplication13BiographyView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1A528(*(uint64_t *)((char *)&self->super.super.super.isa
                       + OBJC_IVAR____TtC16MusicApplication13BiographyView_layoutInvalidationHandler));
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

@end