@interface ShadableShaderModifierObserver
- (_TtC3VFX30ShadableShaderModifierObserver)init;
- (void)dealloc;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
@end

@implementation ShadableShaderModifierObserver

- (void)dealloc
{
  v2 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC3VFX30ShadableShaderModifierObserver_shadable);
  v3 = self;
  swift_unknownObjectRetain();
  v4 = (void *)sub_1B6E31768();
  objc_msgSend(v2, sel_removeObserver_forKeyPath_, v3, v4);
  swift_unknownObjectRelease();

  v5.receiver = v3;
  v5.super_class = (Class)type metadata accessor for ShadableShaderModifierObserver();
  [(ShadableShaderModifierObserver *)&v5 dealloc];
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();

  swift_bridgeObjectRelease();
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  if (a3)
  {
    sub_1B6E31798();
    if (a4) {
      goto LABEL_3;
    }
LABEL_6:
    memset(v13, 0, sizeof(v13));
    id v11 = a5;
    v12 = self;
    if (!a5) {
      goto LABEL_7;
    }
    goto LABEL_4;
  }
  if (!a4) {
    goto LABEL_6;
  }
LABEL_3:
  swift_unknownObjectRetain();
  id v9 = a5;
  v10 = self;
  sub_1B6E32718();
  swift_unknownObjectRelease();
  if (a5)
  {
LABEL_4:
    type metadata accessor for NSKeyValueChangeKey(0);
    sub_1B6B94F80();
    sub_1B6E314C8();
  }
LABEL_7:
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC3VFX30ShadableShaderModifierObserver_propertyCache) = (Class)MEMORY[0x1E4FBC860];

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_1B62B32CC((uint64_t)v13);
}

- (_TtC3VFX30ShadableShaderModifierObserver)init
{
  result = (_TtC3VFX30ShadableShaderModifierObserver *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end