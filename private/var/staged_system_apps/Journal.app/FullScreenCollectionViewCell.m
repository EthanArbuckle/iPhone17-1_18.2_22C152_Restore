@interface FullScreenCollectionViewCell
- (_TtC7Journal28FullScreenCollectionViewCell)initWithCoder:(id)a3;
- (_TtC7Journal28FullScreenCollectionViewCell)initWithFrame:(CGRect)a3;
@end

@implementation FullScreenCollectionViewCell

- (_TtC7Journal28FullScreenCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC7Journal28FullScreenCollectionViewCell *)sub_100519598(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC7Journal28FullScreenCollectionViewCell)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_100519CCC();
}

- (void).cxx_destruct
{
  sub_1000109BC((uint64_t)self + OBJC_IVAR____TtC7Journal28FullScreenCollectionViewCell_delegate);
  sub_100052EAC((uint64_t)self + OBJC_IVAR____TtC7Journal28FullScreenCollectionViewCell_menuURL);
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC7Journal28FullScreenCollectionViewCell_fullScreenAssetView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC7Journal28FullScreenCollectionViewCell_journalAssetView));
  id v3 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC7Journal28FullScreenCollectionViewCell_journalAsset);
}

@end