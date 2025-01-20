@interface PhotosDetailsVisualLookupWidget
- (NSString)snappableWidgetIdentifier;
- (PXPhotosDetailsContext)context;
- (PXWidgetInteractionDelegate)widgetInteractionDelegate;
- (_TtC12PhotosUICore31PhotosDetailsVisualLookupWidget)init;
- (int64_t)contentLayoutStyle;
- (void)setContext:(id)a3;
- (void)setWidgetInteractionDelegate:(id)a3;
@end

@implementation PhotosDetailsVisualLookupWidget

- (PXWidgetInteractionDelegate)widgetInteractionDelegate
{
  v2 = (char *)self + OBJC_IVAR____TtC12PhotosUICore31PhotosDetailsVisualLookupWidget_widgetInteractionDelegate;
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
  sub_1AA22419C(v5);
}

- (NSString)snappableWidgetIdentifier
{
  v2 = (void *)sub_1AB23A72C();
  return (NSString *)v2;
}

- (int64_t)contentLayoutStyle
{
  v2 = *(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & (uint64_t)self->super.super.isa) + 0x108);
  v3 = self;
  v4 = (void *)v2();
  BOOL v5 = objc_msgSend(v4, sel_sizeClass) != (id)2;

  return 2 * v5;
}

- (_TtC12PhotosUICore31PhotosDetailsVisualLookupWidget)init
{
  swift_unknownObjectWeakInit();
  v3 = (Class *)((char *)&self->super.super.isa
               + OBJC_IVAR____TtC12PhotosUICore31PhotosDetailsVisualLookupWidget_contextObservation);
  v4 = (objc_class *)type metadata accessor for PhotosDetailsVisualLookupWidget();
  void *v3 = 0;
  v3[1] = 0;
  v6.receiver = self;
  v6.super_class = v4;
  return [(PhotosDetailsWidget *)&v6 init];
}

- (void).cxx_destruct
{
  sub_1A9D6D380((uint64_t)self + OBJC_IVAR____TtC12PhotosUICore31PhotosDetailsVisualLookupWidget_widgetInteractionDelegate);
  swift_unknownObjectRelease();
}

@end