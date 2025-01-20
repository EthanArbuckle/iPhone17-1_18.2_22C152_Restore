@interface NowPlayingQueueViewController.CompositionalLayout
- (_TtCC5Music29NowPlayingQueueViewController19CompositionalLayout)initWithCoder:(id)a3;
- (_TtCC5Music29NowPlayingQueueViewController19CompositionalLayout)initWithSection:(id)a3;
- (_TtCC5Music29NowPlayingQueueViewController19CompositionalLayout)initWithSection:(id)a3 configuration:(id)a4;
- (_TtCC5Music29NowPlayingQueueViewController19CompositionalLayout)initWithSection:(id)a3 sectionProvider:(id)a4 configuration:(id)a5;
- (_TtCC5Music29NowPlayingQueueViewController19CompositionalLayout)initWithSectionProvider:(id)a3;
- (_TtCC5Music29NowPlayingQueueViewController19CompositionalLayout)initWithSectionProvider:(id)a3 configuration:(id)a4;
- (id)layoutAttributesForElementsInRect:(CGRect)a3;
- (id)layoutAttributesForInteractivelyMovingItemAtIndexPath:(id)a3 withTargetPosition:(CGPoint)a4;
- (id)layoutAttributesForSupplementaryViewOfKind:(id)a3 atIndexPath:(id)a4;
@end

@implementation NowPlayingQueueViewController.CompositionalLayout

- (id)layoutAttributesForSupplementaryViewOfKind:(id)a3 atIndexPath:(id)a4
{
  uint64_t v5 = type metadata accessor for IndexPath();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  v8 = (char *)&v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
  v9 = self;
  NSString v10 = String._bridgeToObjectiveC()();
  Class isa = IndexPath._bridgeToObjectiveC()().super.isa;
  v12 = (objc_class *)_s19CompositionalLayoutCMa();
  v15.receiver = v9;
  v15.super_class = v12;
  id v13 = [(NowPlayingQueueViewController.CompositionalLayout *)&v15 layoutAttributesForSupplementaryViewOfKind:v10 atIndexPath:isa];

  if (v13) {
    sub_1004D8F10(v13);
  }

  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);

  return v13;
}

- (id)layoutAttributesForElementsInRect:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  uint64_t v7 = self;
  unint64_t v8 = sub_1004D972C(x, y, width, height);

  if (v8)
  {
    sub_1004DA4A0();
    v9.super.Class isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
  }
  else
  {
    v9.super.Class isa = 0;
  }

  return v9.super.isa;
}

- (id)layoutAttributesForInteractivelyMovingItemAtIndexPath:(id)a3 withTargetPosition:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  uint64_t v7 = type metadata accessor for IndexPath();
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  NSString v10 = (char *)&v16 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
  v11 = self;
  Class isa = IndexPath._bridgeToObjectiveC()().super.isa;
  id v13 = (objc_class *)_s19CompositionalLayoutCMa();
  v16.receiver = v11;
  v16.super_class = v13;
  id v14 = -[NowPlayingQueueViewController.CompositionalLayout layoutAttributesForInteractivelyMovingItemAtIndexPath:withTargetPosition:](&v16, "layoutAttributesForInteractivelyMovingItemAtIndexPath:withTargetPosition:", isa, x, y);

  [v14 frame];
  if (CGRectGetMinY(v18) < *(double *)((char *)&v11->super.super.super.isa
                                      + OBJC_IVAR____TtCC5Music29NowPlayingQueueViewController19CompositionalLayout_upNextHeaderMaxY))
  {
    [v14 frame];
    [v14 setFrame:];
  }

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);

  return v14;
}

- (_TtCC5Music29NowPlayingQueueViewController19CompositionalLayout)initWithSection:(id)a3
{
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtCC5Music29NowPlayingQueueViewController19CompositionalLayout_upNextHeaderMaxY) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtCC5Music29NowPlayingQueueViewController19CompositionalLayout_dataSource) = 0;
  v5.receiver = self;
  v5.super_class = (Class)_s19CompositionalLayoutCMa();
  return [(NowPlayingQueueViewController.CompositionalLayout *)&v5 initWithSection:a3];
}

- (_TtCC5Music29NowPlayingQueueViewController19CompositionalLayout)initWithSection:(id)a3 configuration:(id)a4
{
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtCC5Music29NowPlayingQueueViewController19CompositionalLayout_upNextHeaderMaxY) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtCC5Music29NowPlayingQueueViewController19CompositionalLayout_dataSource) = 0;
  v7.receiver = self;
  v7.super_class = (Class)_s19CompositionalLayoutCMa();
  return [(NowPlayingQueueViewController.CompositionalLayout *)&v7 initWithSection:a3 configuration:a4];
}

- (_TtCC5Music29NowPlayingQueueViewController19CompositionalLayout)initWithSectionProvider:(id)a3
{
  v4 = _Block_copy(a3);
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtCC5Music29NowPlayingQueueViewController19CompositionalLayout_upNextHeaderMaxY) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtCC5Music29NowPlayingQueueViewController19CompositionalLayout_dataSource) = 0;
  aBlock[4] = sub_1004DA4E0;
  aBlock[5] = v5;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_10050AE20;
  aBlock[3] = &unk_100FDCAE8;
  uint64_t v6 = _Block_copy(aBlock);
  swift_retain();
  swift_release();
  v9.receiver = self;
  v9.super_class = (Class)_s19CompositionalLayoutCMa();
  objc_super v7 = [(NowPlayingQueueViewController.CompositionalLayout *)&v9 initWithSectionProvider:v6];
  swift_release();
  _Block_release(v6);
  return v7;
}

- (_TtCC5Music29NowPlayingQueueViewController19CompositionalLayout)initWithSectionProvider:(id)a3 configuration:(id)a4
{
  uint64_t v5 = _Block_copy(a3);
  uint64_t v6 = swift_allocObject();
  *(void *)(v6 + 16) = v5;
  return (_TtCC5Music29NowPlayingQueueViewController19CompositionalLayout *)sub_1004DA044((uint64_t)sub_1004DA4E0, v6, a4);
}

- (_TtCC5Music29NowPlayingQueueViewController19CompositionalLayout)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtCC5Music29NowPlayingQueueViewController19CompositionalLayout_upNextHeaderMaxY) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtCC5Music29NowPlayingQueueViewController19CompositionalLayout_dataSource) = 0;
  v5.receiver = self;
  v5.super_class = (Class)_s19CompositionalLayoutCMa();
  return [(NowPlayingQueueViewController.CompositionalLayout *)&v5 initWithCoder:a3];
}

- (_TtCC5Music29NowPlayingQueueViewController19CompositionalLayout)initWithSection:(id)a3 sectionProvider:(id)a4 configuration:(id)a5
{
  objc_super v7 = _Block_copy(a4);
  if (v7)
  {
    uint64_t v8 = swift_allocObject();
    *(void *)(v8 + 16) = v7;
    objc_super v7 = sub_1004DA498;
  }
  else
  {
    uint64_t v8 = 0;
  }
  id v9 = a3;
  return (_TtCC5Music29NowPlayingQueueViewController19CompositionalLayout *)sub_1004DA214(a3, (uint64_t)v7, v8, a5);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtCC5Music29NowPlayingQueueViewController19CompositionalLayout_dataSource));
}

@end