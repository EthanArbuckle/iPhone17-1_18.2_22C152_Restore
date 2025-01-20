@interface RUISwiftUIContainerElement
+ (BOOL)supportsElementNamed:(id)a3;
- (_TtC8RemoteUI26RUISwiftUIContainerElement)init;
- (_TtC8RemoteUI26RUISwiftUIContainerElement)initWithAttributes:(id)a3 parent:(id)a4;
- (_TtC8RemoteUI26RUISwiftUIContainerElement)initWithElement:(id)a3 parent:(id)a4;
- (id)didLayoutSubviewsHandler;
- (id)subElementWithID:(id)a3;
- (id)view;
- (id)viewController;
- (id)willLayoutSubviewsHandler;
- (void)loadElement;
- (void)loadElementIfNeeded;
- (void)prepareToPreload;
- (void)setDidLayoutSubviewsHandler:(id)a3;
- (void)setObjectModel:(id)a3;
- (void)setWillLayoutSubviewsHandler:(id)a3;
@end

@implementation RUISwiftUIContainerElement

- (_TtC8RemoteUI26RUISwiftUIContainerElement)initWithElement:(id)a3 parent:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  RUISwiftUIContainerElement.init(element:parent:)(v5, a4);
  return result;
}

+ (BOOL)supportsElementNamed:(id)a3
{
  uint64_t v3 = sub_214602EA8();
  uint64_t v5 = v4;
  id v6 = (id *)sub_214578DAC();
  v7 = *(uint64_t (**)(uint64_t, uint64_t))((*MEMORY[0x263F8EED0] & *(void *)*v6) + 0x98);
  id v8 = *v6;
  LOBYTE(v3) = v7(v3, v5);
  swift_bridgeObjectRelease();

  return v3 & 1;
}

- (id)willLayoutSubviewsHandler
{
  return sub_21458949C((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC8RemoteUI26RUISwiftUIContainerElement_willLayoutSubviewsHandler, (uint64_t)&block_descriptor_37);
}

- (void)setWillLayoutSubviewsHandler:(id)a3
{
  uint64_t v4 = _Block_copy(a3);
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = swift_allocObject();
    *(void *)(v6 + 16) = v5;
    v7 = sub_21458F1B4;
  }
  else
  {
    v7 = 0;
    uint64_t v6 = 0;
  }
  id v8 = self;
  sub_21458DF30((uint64_t)v7, v6);
  sub_21458CF28((uint64_t)v7);
}

- (id)didLayoutSubviewsHandler
{
  return sub_21458949C((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC8RemoteUI26RUISwiftUIContainerElement_didLayoutSubviewsHandler, (uint64_t)&block_descriptor_30);
}

- (void)setDidLayoutSubviewsHandler:(id)a3
{
  uint64_t v4 = _Block_copy(a3);
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = swift_allocObject();
    *(void *)(v6 + 16) = v5;
    v7 = sub_21458F104;
  }
  else
  {
    v7 = 0;
    uint64_t v6 = 0;
  }
  id v8 = self;
  sub_21458E0A0((uint64_t)v7, v6);
  sub_21458CF28((uint64_t)v7);
}

- (id)subElementWithID:(id)a3
{
  if (a3)
  {
    uint64_t v4 = sub_214602EA8();
    uint64_t v6 = v5;
    v7 = *(uint64_t (**)(uint64_t, uint64_t))(**(void **)((char *)&self->super.super.isa
                                                                  + OBJC_IVAR____TtC8RemoteUI26RUISwiftUIContainerElement_childElementDirectory)
                                                    + 120);
    id v8 = self;
    v9 = (void *)v7(v4, v6);

    swift_bridgeObjectRelease();
  }
  else
  {
    v9 = 0;
  }
  return v9;
}

- (void)prepareToPreload
{
  v2 = self;
  sub_214589AC0();
}

- (void)loadElement
{
  v2 = *(void (**)(void))(qword_26781A4E0
                        + (**(void **)((char *)&self->super.super.isa
                                       + OBJC_IVAR____TtC8RemoteUI26RUISwiftUIContainerElement_container) & *MEMORY[0x263F8EED0])
                        + 192);
  uint64_t v3 = self;
  v2();
}

- (void)loadElementIfNeeded
{
  v2 = *(void (**)(void))(qword_26781A4E0
                        + (**(void **)((char *)&self->super.super.isa
                                       + OBJC_IVAR____TtC8RemoteUI26RUISwiftUIContainerElement_container) & *MEMORY[0x263F8EED0])
                        + 184);
  uint64_t v3 = self;
  v2();
}

- (_TtC8RemoteUI26RUISwiftUIContainerElement)initWithAttributes:(id)a3 parent:(id)a4
{
  id v4 = a4;
  result = (_TtC8RemoteUI26RUISwiftUIContainerElement *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC8RemoteUI26RUISwiftUIContainerElement)init
{
  result = (_TtC8RemoteUI26RUISwiftUIContainerElement *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();

  swift_unknownObjectWeakDestroy();
  sub_21458CF28(*(uint64_t *)((char *)&self->super.super.isa
                           + OBJC_IVAR____TtC8RemoteUI26RUISwiftUIContainerElement_willLayoutSubviewsHandler));
  uint64_t v3 = *(uint64_t *)((char *)&self->super.super.isa
                  + OBJC_IVAR____TtC8RemoteUI26RUISwiftUIContainerElement_didLayoutSubviewsHandler);
  sub_21458CF28(v3);
}

- (id)view
{
  id v2 = objc_msgSend(*(id *)((char *)&self->super.super.isa + OBJC_IVAR____TtC8RemoteUI26RUISwiftUIContainerElement_container), sel_view);
  return v2;
}

- (id)viewController
{
  return objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.isa
                                                 + OBJC_IVAR____TtC8RemoteUI26RUISwiftUIContainerElement_container));
}

- (void)setObjectModel:(id)a3
{
  uint64_t v5 = *(void (**)(id))((*MEMORY[0x263F8EED0] & (uint64_t)self->super.super.isa) + 0x80);
  id v6 = a3;
  v7 = self;
  v5(a3);
}

@end