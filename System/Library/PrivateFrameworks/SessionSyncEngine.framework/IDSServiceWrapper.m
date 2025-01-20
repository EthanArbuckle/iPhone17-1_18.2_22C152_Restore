@interface IDSServiceWrapper
- (_TtC17SessionSyncEngine17IDSServiceWrapper)init;
- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 didSendWithSuccess:(BOOL)a6 error:(id)a7;
- (void)service:(id)a3 account:(id)a4 incomingMessage:(id)a5 fromID:(id)a6 context:(id)a7;
@end

@implementation IDSServiceWrapper

- (_TtC17SessionSyncEngine17IDSServiceWrapper)init
{
  result = (_TtC17SessionSyncEngine17IDSServiceWrapper *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  v3 = (char *)self + OBJC_IVAR____TtC17SessionSyncEngine17IDSServiceWrapper_delegate;
  sub_1C7B53710((uint64_t)v3);
}

- (void)service:(id)a3 account:(id)a4 incomingMessage:(id)a5 fromID:(id)a6 context:(id)a7
{
  id v8 = a6;
  if (a5)
  {
    uint64_t v12 = sub_1C7B7B1A0();
    if (v8)
    {
LABEL_3:
      uint64_t v13 = sub_1C7B7B1D0();
      id v8 = v14;
      goto LABEL_6;
    }
  }
  else
  {
    uint64_t v12 = 0;
    if (a6) {
      goto LABEL_3;
    }
  }
  uint64_t v13 = 0;
LABEL_6:
  id v15 = a3;
  id v16 = a4;
  id v17 = a7;
  v18 = self;
  sub_1C7B528E4(a3, v12, v13, (uint64_t)v8);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 didSendWithSuccess:(BOOL)a6 error:(id)a7
{
  if (a5)
  {
    uint64_t v11 = sub_1C7B7B1D0();
    uint64_t v13 = v12;
  }
  else
  {
    uint64_t v11 = 0;
    uint64_t v13 = 0;
  }
  id v14 = a3;
  id v15 = a4;
  id v16 = a7;
  id v17 = self;
  sub_1C7B532EC(v11, v13, (uint64_t)a7);

  swift_bridgeObjectRelease();
}

@end