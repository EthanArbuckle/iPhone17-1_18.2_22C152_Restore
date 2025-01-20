@interface GroupedTextListView
- (CGSize)sizeThatFits:(CGSize)a3;
- (NSArray)accessibilityListGroupStrings;
- (NSArray)accessibilityStackViews;
- (_TtC16MusicApplication19GroupedTextListView)initWithCoder:(id)a3;
- (_TtC16MusicApplication19GroupedTextListView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)music_inheritedLayoutInsetsDidChange;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation GroupedTextListView

- (void)traitCollectionDidChange:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_421410(a3);
}

- (void)music_inheritedLayoutInsetsDidChange
{
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for GroupedTextListView();
  v2 = (char *)v4.receiver;
  [(GroupedTextListView *)&v4 music_inheritedLayoutInsetsDidChange];
  [v2 setNeedsLayout];
  v3 = *(void (**)(char *))&v2[OBJC_IVAR____TtC16MusicApplication19GroupedTextListView_layoutInvalidationHandler];
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
  id v5 = self;
  sub_421804(width, height);
  double v7 = v6;
  double v9 = v8;

  double v10 = v7;
  double v11 = v9;
  result.double height = v11;
  result.double width = v10;
  return result;
}

- (void)layoutSubviews
{
  v2 = self;
  sub_421CDC();
}

- (NSArray)accessibilityStackViews
{
  swift_beginAccess();
  type metadata accessor for TextStackView();
  swift_bridgeObjectRetain();
  v2.super.isa = sub_AB6990().super.isa;
  swift_bridgeObjectRelease();

  return (NSArray *)v2.super.isa;
}

- (NSArray)accessibilityListGroupStrings
{
  NSArray v2 = self;
  sub_423CB4();

  v3.super.isa = sub_AB6990().super.isa;
  swift_bridgeObjectRelease();

  return (NSArray *)v3.super.isa;
}

- (_TtC16MusicApplication19GroupedTextListView)initWithFrame:(CGRect)a3
{
  return (_TtC16MusicApplication19GroupedTextListView *)sub_423F78(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC16MusicApplication19GroupedTextListView)initWithCoder:(id)a3
{
  id v3 = a3;
  objc_super v4 = (_TtC16MusicApplication19GroupedTextListView *)sub_424488((uint64_t)v3);

  return v4;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_1A528(*(uint64_t *)((char *)&self->super.super.super.isa
                       + OBJC_IVAR____TtC16MusicApplication19GroupedTextListView_layoutInvalidationHandler));
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication19GroupedTextListView____lazy_storage___separator));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication19GroupedTextListView____lazy_storage___headerTitleLabel));

  swift_bridgeObjectRelease();
}

@end