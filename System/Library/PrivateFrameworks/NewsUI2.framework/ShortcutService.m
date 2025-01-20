@interface ShortcutService
- (_TtC7NewsUI215ShortcutService)init;
- (void)dealloc;
- (void)shortcutList:(id)a3 didAddShortcuts:(id)a4 changedShortcuts:(id)a5 removedShortcuts:(id)a6;
- (void)subscriptionController:(id)a3 didAddTags:(id)a4 changeTags:(id)a5 moveTags:(id)a6 removeTags:(id)a7 subscriptionType:(unint64_t)a8;
@end

@implementation ShortcutService

- (void)dealloc
{
  ObjectType = (objc_class *)swift_getObjectType();
  v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC7NewsUI215ShortcutService_shortcutList);
  v5 = self;
  objc_msgSend(v4, sel_removeObserver_, v5);
  objc_msgSend(*(id *)((char *)&v5->super.isa + OBJC_IVAR____TtC7NewsUI215ShortcutService_subscriptionController), sel_removeObserver_, v5);
  v6.receiver = v5;
  v6.super_class = ObjectType;
  [(ShortcutService *)&v6 dealloc];
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();

  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();
  swift_release();
}

- (_TtC7NewsUI215ShortcutService)init
{
  result = (_TtC7NewsUI215ShortcutService *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void)subscriptionController:(id)a3 didAddTags:(id)a4 changeTags:(id)a5 moveTags:(id)a6 removeTags:(id)a7 subscriptionType:(unint64_t)a8
{
  if (a4)
  {
    sub_1DFDFE5D0();
    if (!a5) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  if (a5) {
LABEL_3:
  }
    sub_1DFDFE5D0();
LABEL_4:
  if (a6) {
    sub_1DFDFE5D0();
  }
  if (a7)
  {
    uint64_t v13 = sub_1DFDFE5D0();
    id v14 = a3;
    v15 = self;
    v16 = (void *)sub_1DEE10FE0(v13);
    if (v16[2]) {
      sub_1DEE11CE4(v16);
    }

    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRelease();
}

- (void)shortcutList:(id)a3 didAddShortcuts:(id)a4 changedShortcuts:(id)a5 removedShortcuts:(id)a6
{
  sub_1DE919914(0, &qword_1EBAF5DB0);
  unint64_t v8 = sub_1DFDFE220();
  unint64_t v9 = sub_1DFDFE220();
  uint64_t v10 = sub_1DFDFE220();
  id v11 = a3;
  v12 = self;
  sub_1DEE122F8(v11, v8, v9, v10);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end