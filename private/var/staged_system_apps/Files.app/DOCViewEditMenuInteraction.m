@interface DOCViewEditMenuInteraction
- (_TtC5Files26DOCViewEditMenuInteraction)init;
- (id)editMenuInteraction:(id)a3 menuForConfiguration:(id)a4 suggestedActions:(id)a5;
- (void)editMenuInteraction:(id)a3 willDismissMenuForConfiguration:(id)a4 animator:(id)a5;
- (void)longPressGesture:(id)a3;
@end

@implementation DOCViewEditMenuInteraction

- (void)longPressGesture:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1004DF838(v4);
}

- (id)editMenuInteraction:(id)a3 menuForConfiguration:(id)a4 suggestedActions:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  v9 = self;
  Class v10 = sub_1004E0280();

  return v10;
}

- (void)editMenuInteraction:(id)a3 willDismissMenuForConfiguration:(id)a4 animator:(id)a5
{
  v5 = (char *)self + OBJC_IVAR____TtC5Files26DOCViewEditMenuInteraction_activePresentationContext;
  *(void *)v5 = 0;
  *((void *)v5 + 1) = 0;
  v5[24] = 0;
  *((void *)v5 + 2) = 0;
  swift_bridgeObjectRelease();
}

- (_TtC5Files26DOCViewEditMenuInteraction)init
{
  result = (_TtC5Files26DOCViewEditMenuInteraction *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy();
  sub_10003A094((uint64_t)self + OBJC_IVAR____TtC5Files26DOCViewEditMenuInteraction_delegate);

  swift_bridgeObjectRelease();
}

@end