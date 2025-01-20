@interface AmbientPhotoFrameExtendedMetadataOverlayView
- (_TtC15PhotosUIPrivate44AmbientPhotoFrameExtendedMetadataOverlayView)initWithCoder:(id)a3;
- (_TtC15PhotosUIPrivate44AmbientPhotoFrameExtendedMetadataOverlayView)initWithFrame:(CGRect)a3;
- (void)safeAreaInsetsDidChange;
@end

@implementation AmbientPhotoFrameExtendedMetadataOverlayView

- (_TtC15PhotosUIPrivate44AmbientPhotoFrameExtendedMetadataOverlayView)initWithFrame:(CGRect)a3
{
  return (_TtC15PhotosUIPrivate44AmbientPhotoFrameExtendedMetadataOverlayView *)sub_1AEA97844(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC15PhotosUIPrivate44AmbientPhotoFrameExtendedMetadataOverlayView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1AEA97988();
}

- (void)safeAreaInsetsDidChange
{
  v2 = self;
  sub_1AEA97A9C();
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy();
  swift_unknownObjectWeakDestroy();
  swift_unknownObjectWeakDestroy();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15PhotosUIPrivate44AmbientPhotoFrameExtendedMetadataOverlayView_titleLabelTopConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15PhotosUIPrivate44AmbientPhotoFrameExtendedMetadataOverlayView_subtitleTopNoTitleConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15PhotosUIPrivate44AmbientPhotoFrameExtendedMetadataOverlayView_subtitleTopWithTitleConstraint));
  swift_unknownObjectWeakDestroy();
}

@end