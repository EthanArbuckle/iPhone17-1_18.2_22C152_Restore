@interface ItemizedTextListView
- (CGSize)sizeThatFits:(CGSize)a3;
- (_TtC16MusicApplication20ItemizedTextListView)initWithCoder:(id)a3;
- (_TtC16MusicApplication20ItemizedTextListView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)music_inheritedLayoutInsetsDidChange;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation ItemizedTextListView

- (_TtC16MusicApplication20ItemizedTextListView)initWithFrame:(CGRect)a3
{
  return (_TtC16MusicApplication20ItemizedTextListView *)sub_2DF370(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC16MusicApplication20ItemizedTextListView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_2E2094();
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_2DF60C(a3);
}

- (void)music_inheritedLayoutInsetsDidChange
{
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for ItemizedTextListView();
  v2 = (char *)v4.receiver;
  [(ItemizedTextListView *)&v4 music_inheritedLayoutInsetsDidChange];
  [v2 setNeedsLayout];
  id v3 = *(void (**)(char *))&v2[OBJC_IVAR____TtC16MusicApplication20ItemizedTextListView_layoutInvalidationHandler];
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
  double v6 = sub_2DF890(width, height);
  double v8 = v7;

  double v9 = v6;
  double v10 = v8;
  result.double height = v10;
  result.double width = v9;
  return result;
}

- (void)layoutSubviews
{
  v2 = self;
  sub_2E0114();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_1A528(*(uint64_t *)((char *)&self->super.super.super.isa
                       + OBJC_IVAR____TtC16MusicApplication20ItemizedTextListView_layoutInvalidationHandler));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication20ItemizedTextListView____lazy_storage___separator));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication20ItemizedTextListView____lazy_storage___headerTitleLabel));

  swift_bridgeObjectRelease();
}

@end