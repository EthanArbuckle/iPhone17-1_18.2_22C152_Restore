@interface PUPhotoStyleVariationScrubberCell
- (_TtC15PhotosUIPrivate33PUPhotoStyleVariationScrubberCell)initWithCoder:(id)a3;
- (_TtC15PhotosUIPrivate33PUPhotoStyleVariationScrubberCell)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)prepareForReuse;
- (void)wheelScrubberView:(id)a3 updateCell:(id)a4 forItemAtIndex:(int64_t)a5;
- (void)wheelScrubberViewDidChangeSelectedIndex:(id)a3;
@end

@implementation PUPhotoStyleVariationScrubberCell

- (_TtC15PhotosUIPrivate33PUPhotoStyleVariationScrubberCell)initWithFrame:(CGRect)a3
{
  return (_TtC15PhotosUIPrivate33PUPhotoStyleVariationScrubberCell *)sub_1AEB017CC(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void)prepareForReuse
{
  v2 = self;
  sub_1AEB01924();
}

- (void)wheelScrubberView:(id)a3 updateCell:(id)a4 forItemAtIndex:(int64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  v10 = self;
  sub_1AEB019F8((uint64_t)v10, a4, a5);
}

- (void)wheelScrubberViewDidChangeSelectedIndex:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_1AEB01C2C(a3);
}

- (void)layoutSubviews
{
  v2 = self;
  sub_1AEB01D58();
}

- (_TtC15PhotosUIPrivate33PUPhotoStyleVariationScrubberCell)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1AEB021F0();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC15PhotosUIPrivate33PUPhotoStyleVariationScrubberCell_scrubberView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC15PhotosUIPrivate33PUPhotoStyleVariationScrubberCell_image));
  swift_bridgeObjectRelease();
  id v3 = (char *)self + OBJC_IVAR____TtC15PhotosUIPrivate33PUPhotoStyleVariationScrubberCell_delegate;
  sub_1AEA2489C((uint64_t)v3);
}

@end