@interface PXEditAutomationManager
- (_TtC12PhotosUICore23PXEditAutomationManager)init;
- (void)dealloc;
@end

@implementation PXEditAutomationManager

- (void)dealloc
{
  v2 = (void *)MEMORY[0x1E4FBC8C8];
  v3 = *(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & (uint64_t)self->super.isa) + 0x60);
  v4 = self;
  uint64_t v5 = v3();
  if (v5)
  {
    uint64_t v6 = v5;
    id v7 = objc_msgSend(self, sel_defaultCenter);
    objc_msgSend(v7, sel_removeObserver_, v6);

    (*(void (**)(void))((*v2 & (uint64_t)v4->super.isa) + 0x68))(0);
    swift_unknownObjectRelease();
  }
  v8.receiver = v4;
  v8.super_class = (Class)type metadata accessor for PXEditAutomationManager();
  [(PXEditAutomationManager *)&v8 dealloc];
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  v3 = (char *)self + OBJC_IVAR____TtC12PhotosUICore23PXEditAutomationManager__automationDelegate;
  sub_1A9D6D380((uint64_t)v3);
}

- (_TtC12PhotosUICore23PXEditAutomationManager)init
{
  result = (_TtC12PhotosUICore23PXEditAutomationManager *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end