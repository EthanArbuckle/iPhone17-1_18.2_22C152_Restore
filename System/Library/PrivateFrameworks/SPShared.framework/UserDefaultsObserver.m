@interface UserDefaultsObserver
- (_TtC8SPShared20UserDefaultsObserver)init;
- (void)dealloc;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
@end

@implementation UserDefaultsObserver

- (void)dealloc
{
  v2 = self;
  sub_1BBBAF2D4();
  v3.receiver = v2;
  v3.super_class = (Class)type metadata accessor for UserDefaultsObserver();
  [(UserDefaultsObserver *)&v3 dealloc];
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_release();
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  if (a3)
  {
    uint64_t v9 = sub_1BBBEB2A8();
    uint64_t v11 = v10;
    if (a4) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v9 = 0;
    uint64_t v11 = 0;
    if (a4)
    {
LABEL_3:
      swift_unknownObjectRetain();
      id v12 = a5;
      v13 = self;
      sub_1BBBEB778();
      swift_unknownObjectRelease();
      if (a5) {
        goto LABEL_4;
      }
LABEL_8:
      if (v11) {
        goto LABEL_5;
      }
LABEL_9:

      swift_bridgeObjectRelease();
      goto LABEL_10;
    }
  }
  memset(v17, 0, sizeof(v17));
  id v15 = a5;
  v16 = self;
  if (!a5) {
    goto LABEL_8;
  }
LABEL_4:
  type metadata accessor for NSKeyValueChangeKey(0);
  sub_1BBBAF678();
  sub_1BBBEB1A8();

  if (!v11) {
    goto LABEL_9;
  }
LABEL_5:
  v14 = *(void (**)(uint64_t, uint64_t))((char *)&self->super.isa
                                                + OBJC_IVAR____TtC8SPShared20UserDefaultsObserver_notify);
  swift_retain();
  v14(v9, v11);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
LABEL_10:
  sub_1BBBAF618((uint64_t)v17);
}

- (_TtC8SPShared20UserDefaultsObserver)init
{
  result = (_TtC8SPShared20UserDefaultsObserver *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end