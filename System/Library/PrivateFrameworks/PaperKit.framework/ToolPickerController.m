@interface ToolPickerController
- (_TtC8PaperKit20ToolPickerController)init;
- (int64_t)adaptivePresentationStyleForPresentationController:(id)a3;
- (int64_t)adaptivePresentationStyleForPresentationController:(id)a3 traitCollection:(id)a4;
- (void)handleSqueezeInteractionDidChangePaletteViewVisibilityNotification:(id)a3;
- (void)imageDescriptionViewControllerDidCancel:(id)a3;
- (void)imageDescriptionViewControllerDidDismiss:(id)a3;
- (void)imageDescriptionViewControllerDidSave:(id)a3;
- (void)insertStickerFromItemProvider:(id)a3 completionHandler:(id)a4;
- (void)stickerPickerViewControllerDidDismiss;
- (void)toolPickerDidHideNotification:(id)a3;
- (void)toolPickerDidShowNotification:(id)a3;
- (void)toolPickerWillShowNotification:(id)a3;
@end

@implementation ToolPickerController

- (void)handleSqueezeInteractionDidChangePaletteViewVisibilityNotification:(id)a3
{
  uint64_t v4 = type metadata accessor for Notification();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  static Notification._unconditionallyBridgeFromObjectiveC(_:)();
  v8 = self;
  ToolPickerController.handleSqueezeInteractionDidChangePaletteViewVisibilityNotification(_:)();

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (void)toolPickerWillShowNotification:(id)a3
{
}

- (void)toolPickerDidShowNotification:(id)a3
{
}

- (void)toolPickerDidHideNotification:(id)a3
{
  uint64_t v3 = type metadata accessor for Notification();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v6 = (char *)&v7 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  static Notification._unconditionallyBridgeFromObjectiveC(_:)();
  specialized ToolPickerController.toolPickerDidHideNotification(_:)();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
}

- (int64_t)adaptivePresentationStyleForPresentationController:(id)a3
{
  return -1;
}

- (int64_t)adaptivePresentationStyleForPresentationController:(id)a3 traitCollection:(id)a4
{
  return -1;
}

- (void)stickerPickerViewControllerDidDismiss
{
  v2 = self;
  ToolPickerController.stickerPickerViewControllerDidDismiss()();
}

- (void)insertStickerFromItemProvider:(id)a3 completionHandler:(id)a4
{
  uint64_t v5 = _Block_copy(a4);
  uint64_t v6 = swift_allocObject();
  *(void *)(v6 + 16) = v5;
  uint64_t v7 = (char *)self + OBJC_IVAR____TtC8PaperKit20ToolPickerController_delegate;
  if (MEMORY[0x210550400]((char *)self + OBJC_IVAR____TtC8PaperKit20ToolPickerController_delegate))
  {
    uint64_t v8 = *((void *)v7 + 1);
    uint64_t ObjectType = swift_getObjectType();
    v10 = *(void (**)(id, uint64_t (*)(char), uint64_t, uint64_t, uint64_t))(v8 + 80);
    id v11 = a3;
    v12 = self;
    v10(v11, partial apply for thunk for @escaping @callee_unowned @convention(block) (@unowned ObjCBool) -> (), v6, ObjectType, v8);

    swift_release();
    swift_unknownObjectRelease();
  }
  else
  {
    id v13 = a3;
    swift_release();
  }
}

- (_TtC8PaperKit20ToolPickerController)init
{
  result = (_TtC8PaperKit20ToolPickerController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  outlined destroy of weak AnyContainerCanvasElementView?((uint64_t)self + OBJC_IVAR____TtC8PaperKit20ToolPickerController_delegate);

  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC8PaperKit20ToolPickerController____lazy_storage___textToolListViewController));
  uint64_t v3 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC8PaperKit20ToolPickerController____lazy_storage___shapeButtonListViewController);
}

- (void)imageDescriptionViewControllerDidSave:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  ToolPickerController.imageDescriptionViewControllerDidSave(_:)(v4);
}

- (void)imageDescriptionViewControllerDidCancel:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  ToolPickerController.imageDescriptionViewControllerDidCancel(_:)(v4);
}

- (void)imageDescriptionViewControllerDidDismiss:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  ToolPickerController.imageDescriptionViewControllerDidDismiss(_:)(v4);
}

@end