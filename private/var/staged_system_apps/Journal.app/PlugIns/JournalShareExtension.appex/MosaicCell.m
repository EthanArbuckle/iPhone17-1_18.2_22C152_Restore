@interface MosaicCell
- (_TtC21JournalShareExtension10MosaicCell)initWithCoder:(id)a3;
- (_TtC21JournalShareExtension10MosaicCell)initWithFrame:(CGRect)a3;
- (void)applyLayoutAttributes:(id)a3;
@end

@implementation MosaicCell

- (_TtC21JournalShareExtension10MosaicCell)initWithFrame:(CGRect)a3
{
  return (_TtC21JournalShareExtension10MosaicCell *)sub_100073C54(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC21JournalShareExtension10MosaicCell)initWithCoder:(id)a3
{
  uint64_t v5 = OBJC_IVAR____TtC21JournalShareExtension10MosaicCell_assetContainerView;
  id v6 = objc_allocWithZone((Class)UIView);
  id v7 = a3;
  *(Class *)((char *)&self->super.super.super.super.super.isa + v5) = (Class)[v6 init];
  *((unsigned char *)&self->super.super.super.super.super.isa
  + OBJC_IVAR____TtC21JournalShareExtension10MosaicCell_hasOnlyOneImage) = 0;
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC21JournalShareExtension10MosaicCell_journalAsset) = 0;

  result = (_TtC21JournalShareExtension10MosaicCell *)sub_10010AA60();
  __break(1u);
  return result;
}

- (void)applyLayoutAttributes:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  sub_100073EB4(v4);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC21JournalShareExtension10MosaicCell_assetContainerView));
  v3 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC21JournalShareExtension10MosaicCell_journalAsset);
}

@end