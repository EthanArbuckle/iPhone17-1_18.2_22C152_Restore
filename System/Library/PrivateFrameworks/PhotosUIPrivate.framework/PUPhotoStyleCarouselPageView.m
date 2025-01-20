@interface PUPhotoStyleCarouselPageView
- (_TtC15PhotosUIPrivate28PUPhotoStyleCarouselPageView)initWithCoder:(id)a3;
- (_TtC15PhotosUIPrivate28PUPhotoStyleCarouselPageView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation PUPhotoStyleCarouselPageView

- (void)layoutSubviews
{
  v2 = self;
  sub_1AEB66918();
}

- (_TtC15PhotosUIPrivate28PUPhotoStyleCarouselPageView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1AEB66A58();
}

- (_TtC15PhotosUIPrivate28PUPhotoStyleCarouselPageView)initWithFrame:(CGRect)a3
{
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15PhotosUIPrivate28PUPhotoStyleCarouselPageView_label));
  swift_unknownObjectRelease();
  sub_1AEA2489C((uint64_t)self + OBJC_IVAR____TtC15PhotosUIPrivate28PUPhotoStyleCarouselPageView_renderProvider);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15PhotosUIPrivate28PUPhotoStyleCarouselPageView_subscribedStyleCollection));
  id v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC15PhotosUIPrivate28PUPhotoStyleCarouselPageView_subscribedStyleElement);
}

@end