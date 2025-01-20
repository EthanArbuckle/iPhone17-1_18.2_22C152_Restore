@interface AmbientPhotoFrameCompactMetadataOverlayView
- (_TtC15PhotosUIPrivate43AmbientPhotoFrameCompactMetadataOverlayView)initWithCoder:(id)a3;
- (_TtC15PhotosUIPrivate43AmbientPhotoFrameCompactMetadataOverlayView)initWithFrame:(CGRect)a3;
- (void)safeAreaInsetsDidChange;
@end

@implementation AmbientPhotoFrameCompactMetadataOverlayView

- (_TtC15PhotosUIPrivate43AmbientPhotoFrameCompactMetadataOverlayView)initWithFrame:(CGRect)a3
{
  return (_TtC15PhotosUIPrivate43AmbientPhotoFrameCompactMetadataOverlayView *)sub_1AEB68060(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC15PhotosUIPrivate43AmbientPhotoFrameCompactMetadataOverlayView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1AEB68194();
}

- (void)safeAreaInsetsDidChange
{
  v2 = self;
  sub_1AEB68920();
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy();
  swift_unknownObjectWeakDestroy();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15PhotosUIPrivate43AmbientPhotoFrameCompactMetadataOverlayView_subtitleLabelBottomConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15PhotosUIPrivate43AmbientPhotoFrameCompactMetadataOverlayView____lazy_storage___titleFontDescriptor));
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15PhotosUIPrivate43AmbientPhotoFrameCompactMetadataOverlayView____lazy_storage___titleMinimumFont));
  id v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC15PhotosUIPrivate43AmbientPhotoFrameCompactMetadataOverlayView____lazy_storage___titleMaximumFont);
}

@end