@interface GameCenterReengagementCollectionViewCell
- (BOOL)canBecomeFocused;
- (_TtC8AppStore40GameCenterReengagementCollectionViewCell)initWithCoder:(id)a3;
- (_TtC8AppStore40GameCenterReengagementCollectionViewCell)initWithFrame:(CGRect)a3;
- (id)focusItemsInRect:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation GameCenterReengagementCollectionViewCell

- (_TtC8AppStore40GameCenterReengagementCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC8AppStore40GameCenterReengagementCollectionViewCell *)sub_1004456F8(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC8AppStore40GameCenterReengagementCollectionViewCell)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_100446DF4();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_100446410();
}

- (BOOL)canBecomeFocused
{
  return 0;
}

- (id)focusItemsInRect:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v7 = self;
  sub_1004469CC(x, y, width, height);

  sub_100082C28(&qword_100997430);
  v8.super.isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();

  return v8.super.isa;
}

- (void).cxx_destruct
{
  sub_1000A1D30((uint64_t)self + OBJC_IVAR____TtC8AppStore40GameCenterReengagementCollectionViewCell_itemLayoutContext);
  swift_unknownObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore40GameCenterReengagementCollectionViewCell_badgeGlyph));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore40GameCenterReengagementCollectionViewCell_badge));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore40GameCenterReengagementCollectionViewCell_title));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore40GameCenterReengagementCollectionViewCell_subtitle));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore40GameCenterReengagementCollectionViewCell_heroContent));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore40GameCenterReengagementCollectionViewCell_separator));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore40GameCenterReengagementCollectionViewCell_lockup));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore40GameCenterReengagementCollectionViewCell_button));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore40GameCenterReengagementCollectionViewCell_visualEffect));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore40GameCenterReengagementCollectionViewCell_backgroundImage));

  swift_bridgeObjectRelease();
}

@end