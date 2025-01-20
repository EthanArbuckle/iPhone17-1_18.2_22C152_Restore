@interface IDSServiceWrapper
- (_TtC16ReplicatorEngine17IDSServiceWrapper)init;
- (void)dealloc;
- (void)pairedDeviceStateChangedWithNotification:(id)a3;
- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 didSendWithSuccess:(BOOL)a6 error:(id)a7;
- (void)service:(id)a3 account:(id)a4 incomingMessage:(id)a5 fromID:(id)a6 context:(id)a7;
- (void)service:(id)a3 account:(id)a4 incomingResourceAtURL:(id)a5 metadata:(id)a6 fromID:(id)a7 context:(id)a8;
@end

@implementation IDSServiceWrapper

- (void)dealloc
{
  v3 = self;
  v4 = self;
  id v5 = objc_msgSend(v3, sel_defaultCenter);
  objc_msgSend(v5, sel_removeObserver_, v4);

  v6 = (int *)((char *)v4 + OBJC_IVAR____TtC16ReplicatorEngine17IDSServiceWrapper_pairedDeviceNotificationToken);
  swift_beginAccess();
  notify_cancel(*v6);
  v7.receiver = v4;
  v7.super_class = (Class)type metadata accessor for IDSServiceWrapper();
  [(IDSServiceWrapper *)&v7 dealloc];
}

- (void).cxx_destruct
{
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  uint64_t v3 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC16ReplicatorEngine17IDSServiceWrapper__lock_pairedDevice);
  uint64_t v4 = *(void *)&self->idsService[OBJC_IVAR____TtC16ReplicatorEngine17IDSServiceWrapper__lock_pairedDevice];
  sub_25B11641C(v3, v4);
}

- (_TtC16ReplicatorEngine17IDSServiceWrapper)init
{
  result = (_TtC16ReplicatorEngine17IDSServiceWrapper *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void)service:(id)a3 account:(id)a4 incomingResourceAtURL:(id)a5 metadata:(id)a6 fromID:(id)a7 context:(id)a8
{
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A4D9160);
  MEMORY[0x270FA5388](v15 - 8);
  v17 = (char *)&v24 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a5)
  {
    sub_25B28FE60();
    uint64_t v18 = sub_25B28FEA0();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v18 - 8) + 56))(v17, 0, 1, v18);
  }
  else
  {
    uint64_t v19 = sub_25B28FEA0();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v19 - 8) + 56))(v17, 1, 1, v19);
  }
  if (a6) {
    a6 = (id)sub_25B2904D0();
  }
  if (a7) {
    sub_25B2905C0();
  }
  id v20 = a3;
  id v21 = a4;
  id v22 = a8;
  v23 = self;
  sub_25B1C48C4((uint64_t)v17, (uint64_t)a6, a8);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_25B116DE0((uint64_t)v17, &qword_26A4D9160);
}

- (void)service:(id)a3 account:(id)a4 incomingMessage:(id)a5 fromID:(id)a6 context:(id)a7
{
  if (a5)
  {
    uint64_t v12 = sub_25B2904D0();
    if (!a6) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  uint64_t v12 = 0;
  if (a6) {
LABEL_3:
  }
    sub_25B2905C0();
LABEL_4:
  id v13 = a3;
  id v14 = a4;
  id v15 = a7;
  uint64_t v16 = self;
  sub_25B1C5160(v12, a7);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 didSendWithSuccess:(BOOL)a6 error:(id)a7
{
  BOOL v8 = a6;
  if (a5)
  {
    uint64_t v12 = sub_25B2905C0();
    unint64_t v14 = v13;
  }
  else
  {
    uint64_t v12 = 0;
    unint64_t v14 = 0;
  }
  id v15 = a3;
  id v16 = a4;
  id v17 = a7;
  uint64_t v18 = self;
  sub_25B1C5964(v12, v14, v8, a7);

  swift_bridgeObjectRelease();
}

- (void)pairedDeviceStateChangedWithNotification:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_25B1C3E74();
}

@end