@interface PhotosDetailsSharedLibraryWidget
- (NSString)snappableWidgetIdentifier;
- (PXPhotosDetailsContext)context;
- (PXWidgetInteractionDelegate)widgetInteractionDelegate;
- (_TtC12PhotosUICore32PhotosDetailsSharedLibraryWidget)init;
- (void)setContext:(id)a3;
- (void)setWidgetInteractionDelegate:(id)a3;
@end

@implementation PhotosDetailsSharedLibraryWidget

- (PXWidgetInteractionDelegate)widgetInteractionDelegate
{
  v2 = (char *)self + OBJC_IVAR____TtC12PhotosUICore32PhotosDetailsSharedLibraryWidget_widgetInteractionDelegate;
  swift_beginAccess();
  v3 = (void *)MEMORY[0x1AD10DA80](v2);
  return (PXWidgetInteractionDelegate *)v3;
}

- (void)setWidgetInteractionDelegate:(id)a3
{
}

- (PXPhotosDetailsContext)context
{
  v2 = self;
  v3 = (void *)sub_1AA0A5974();

  return (PXPhotosDetailsContext *)v3;
}

- (void)setContext:(id)a3
{
  id v5 = a3;
  v4 = self;
  sub_1AA6C5A9C(v5);
}

- (NSString)snappableWidgetIdentifier
{
  v2 = (void *)sub_1AB23A72C();
  return (NSString *)v2;
}

- (_TtC12PhotosUICore32PhotosDetailsSharedLibraryWidget)init
{
  swift_unknownObjectWeakInit();
  v3 = (Class *)((char *)&self->super.super.isa
               + OBJC_IVAR____TtC12PhotosUICore32PhotosDetailsSharedLibraryWidget_contextObservation);
  void *v3 = 0;
  v3[1] = 0;
  *((unsigned char *)&self->super.super.isa
  + OBJC_IVAR____TtC12PhotosUICore32PhotosDetailsSharedLibraryWidget____lazy_storage___hasSiblingWidgetAbove) = 2;
  *((unsigned char *)&self->super.super.isa
  + OBJC_IVAR____TtC12PhotosUICore32PhotosDetailsSharedLibraryWidget____lazy_storage___hasSiblingWidgetBelow) = 2;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for PhotosDetailsSharedLibraryWidget();
  return [(PhotosDetailsWidget *)&v5 init];
}

- (void).cxx_destruct
{
  sub_1A9D6D380((uint64_t)self + OBJC_IVAR____TtC12PhotosUICore32PhotosDetailsSharedLibraryWidget_widgetInteractionDelegate);
  swift_unknownObjectRelease();
}

@end