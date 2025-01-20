@interface PKPaperTextViewLinkingController
- (UIMenu)linkItemsMenu;
- (_TtC8PaperKit32PKPaperTextViewLinkingController)init;
- (_TtC8PaperKit32PKPaperTextViewLinkingController)initWithTextView:(id)a3;
@end

@implementation PKPaperTextViewLinkingController

- (_TtC8PaperKit32PKPaperTextViewLinkingController)initWithTextView:(id)a3
{
  ObjectType = (objc_class *)swift_getObjectType();
  id v5 = objc_allocWithZone((Class)type metadata accessor for SynapseLinkingEngine());
  v6 = specialized PKPaperTextViewLinkingController.init(textView:linkingEngine:)(a3, objc_msgSend(v5, sel_init), (char *)objc_allocWithZone(ObjectType));
  swift_getObjectType();
  swift_deallocPartialClassInstance();
  return (_TtC8PaperKit32PKPaperTextViewLinkingController *)v6;
}

- (UIMenu)linkItemsMenu
{
  v2 = self;
  v3.super.super.isa = PKPaperTextViewLinkingController.linkItemsMenu.getter().super.super.isa;

  return (UIMenu *)v3.super.super.isa;
}

- (_TtC8PaperKit32PKPaperTextViewLinkingController)init
{
  result = (_TtC8PaperKit32PKPaperTextViewLinkingController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy();
  swift_unknownObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC8PaperKit32PKPaperTextViewLinkingController____lazy_storage___addLinkClient));
  swift_release();
  UIMenu v3 = (char *)self + OBJC_IVAR____TtC8PaperKit32PKPaperTextViewLinkingController_delegate;
  outlined destroy of weak AnyContainerCanvasElementView?((uint64_t)v3);
}

@end