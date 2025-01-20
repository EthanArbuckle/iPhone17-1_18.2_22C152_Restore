@interface PUPhotoStyleGridCell
- (_TtC15PhotosUIPrivate20PUPhotoStyleGridCell)initWithCoder:(id)a3;
- (_TtC15PhotosUIPrivate20PUPhotoStyleGridCell)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation PUPhotoStyleGridCell

- (_TtC15PhotosUIPrivate20PUPhotoStyleGridCell)initWithFrame:(CGRect)a3
{
  return (_TtC15PhotosUIPrivate20PUPhotoStyleGridCell *)sub_1AEAFBA3C(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void)layoutSubviews
{
  v2 = self;
  sub_1AEAFBF80();
}

- (_TtC15PhotosUIPrivate20PUPhotoStyleGridCell)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1AEAFC1E8();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC15PhotosUIPrivate20PUPhotoStyleGridCell_imageView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC15PhotosUIPrivate20PUPhotoStyleGridCell_label));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC15PhotosUIPrivate20PUPhotoStyleGridCell_labelBackground));
  id v3 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC15PhotosUIPrivate20PUPhotoStyleGridCell_subscribedStyleElement);
}

@end