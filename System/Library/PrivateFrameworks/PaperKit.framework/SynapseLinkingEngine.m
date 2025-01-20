@interface SynapseLinkingEngine
- (_TtC8PaperKit20SynapseLinkingEngine)init;
- (void)linkableItemFinderItemsMightHaveChanged:(id)a3;
@end

@implementation SynapseLinkingEngine

- (_TtC8PaperKit20SynapseLinkingEngine)init
{
  ObjectType = (objc_class *)swift_getObjectType();
  *(void *)&self->engine[OBJC_IVAR____TtC8PaperKit20SynapseLinkingEngine_delegate] = 0;
  swift_unknownObjectWeakInit();
  id v4 = objc_allocWithZone(MEMORY[0x263F7C230]);
  v5 = self;
  v6 = (objc_class *)objc_msgSend(v4, sel_init);
  *(Class *)((char *)&v5->super.isa + OBJC_IVAR____TtC8PaperKit20SynapseLinkingEngine_engine) = v6;

  v9.receiver = v5;
  v9.super_class = ObjectType;
  v7 = [(SynapseLinkingEngine *)&v9 init];
  objc_msgSend(*(id *)((char *)&v7->super.isa + OBJC_IVAR____TtC8PaperKit20SynapseLinkingEngine_engine), sel_setDelegate_, v7);
  return v7;
}

- (void)linkableItemFinderItemsMightHaveChanged:(id)a3
{
  uint64_t v5 = MEMORY[0x210550400]((char *)self + OBJC_IVAR____TtC8PaperKit20SynapseLinkingEngine_delegate, a2);
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = v5 + OBJC_IVAR____TtC8PaperKit32PKPaperTextViewLinkingController_delegate;
    swift_beginAccess();
    v8 = (void *)MEMORY[0x210550400](v7);
    if (v8)
    {
      objc_super v9 = v8;
      if (objc_msgSend(v8, sel_respondsToSelector_, sel_linkingControllerLinksMightHaveChanged_))
      {
        id v10 = a3;
        v11 = self;
        objc_msgSend(v9, sel_linkingControllerLinksMightHaveChanged_, v6);
      }
      swift_unknownObjectRelease();
    }
    swift_unknownObjectRelease();
  }
}

- (void).cxx_destruct
{
  v3 = (char *)self + OBJC_IVAR____TtC8PaperKit20SynapseLinkingEngine_delegate;
  outlined destroy of weak AnyContainerCanvasElementView?((uint64_t)v3);
}

@end