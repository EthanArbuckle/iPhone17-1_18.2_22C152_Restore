@interface XPCConnection
- (_TtC14bluetoothuserd13XPCConnection)init;
- (void)appleAudioAccessoryLimitedLoggingWithCompletion:(id)a3;
- (void)deleteControllerInfoForDevice:(CBDevice *)a3 completion:(id)a4;
- (void)diagnosticShow:(NSDictionary *)a3 completion:(id)a4;
- (void)getCloudPairedDevicesWithCompletionHandler:(id)a3;
- (void)getControllerInfoForDevice:(CBDevice *)a3 completion:(id)a4;
- (void)getCurrentUserGivenNameWithCompletion:(id)a3;
- (void)getDistributedLoggingStatusWithCompletion:(id)a3;
- (void)readPrefKeys:(NSArray *)a3 source:(unsigned int)a4 completion:(id)a5;
- (void)recordEventWithDeviceIdentifier:(id)a3 initiator:(BOOL)a4 starting:(BOOL)a5 useCase:(unsigned int)a6;
- (void)recordEventWithStarting:(BOOL)a3 useCase:(unsigned int)a4;
- (void)setAppleAudioAccessoryLimitedLogging:(BOOL)a3 completion:(id)a4;
- (void)setDistributedLoggingStatus:(unsigned int)a3 completion:(id)a4;
- (void)storeControllerInfo:(CBControllerInfo *)a3 completion:(id)a4;
- (void)writePrefKey:(NSString *)a3 value:(id)a4 source:(unsigned int)a5 completion:(id)a6;
@end

@implementation XPCConnection

- (_TtC14bluetoothuserd13XPCConnection)init
{
  result = (_TtC14bluetoothuserd13XPCConnection *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC14bluetoothuserd13XPCConnection_xpcConnection);
}

- (void)diagnosticShow:(NSDictionary *)a3 completion:(id)a4
{
  uint64_t v7 = sub_10000423C(&qword_100090620);
  __chkstk_darwin(v7 - 8);
  v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  v11 = (void *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  uint64_t v12 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_100090138;
  v13[5] = v11;
  v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_100090140;
  v14[5] = v13;
  v15 = a3;
  v16 = self;
  sub_10005D070((uint64_t)v9, (uint64_t)&unk_100090148, (uint64_t)v14);
  swift_release();
}

- (void)getCloudPairedDevicesWithCompletionHandler:(id)a3
{
  uint64_t v5 = sub_10000423C(&qword_100090620);
  __chkstk_darwin(v5 - 8);
  uint64_t v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = _Block_copy(a3);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  *(void *)(v9 + 24) = self;
  uint64_t v10 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v7, 1, 1, v10);
  v11 = (void *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_100090118;
  v11[5] = v9;
  uint64_t v12 = (void *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_100090120;
  v12[5] = v11;
  v13 = self;
  sub_10005D070((uint64_t)v7, (uint64_t)&unk_100090128, (uint64_t)v12);
  swift_release();
}

- (void)deleteControllerInfoForDevice:(CBDevice *)a3 completion:(id)a4
{
  uint64_t v7 = sub_10000423C(&qword_100090620);
  __chkstk_darwin(v7 - 8);
  uint64_t v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = _Block_copy(a4);
  v11 = (void *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  uint64_t v12 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_1000900F8;
  v13[5] = v11;
  uint64_t v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_100090100;
  v14[5] = v13;
  v15 = a3;
  v16 = self;
  sub_10005D070((uint64_t)v9, (uint64_t)&unk_100090108, (uint64_t)v14);
  swift_release();
}

- (void)storeControllerInfo:(CBControllerInfo *)a3 completion:(id)a4
{
  uint64_t v7 = sub_10000423C(&qword_100090620);
  __chkstk_darwin(v7 - 8);
  uint64_t v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = _Block_copy(a4);
  v11 = (void *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  uint64_t v12 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_1000900D8;
  v13[5] = v11;
  uint64_t v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_1000900E0;
  v14[5] = v13;
  v15 = a3;
  v16 = self;
  sub_10005D070((uint64_t)v9, (uint64_t)&unk_1000900E8, (uint64_t)v14);
  swift_release();
}

- (void)getControllerInfoForDevice:(CBDevice *)a3 completion:(id)a4
{
  uint64_t v7 = sub_10000423C(&qword_100090620);
  __chkstk_darwin(v7 - 8);
  uint64_t v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = _Block_copy(a4);
  v11 = (void *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  uint64_t v12 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_1000900B8;
  v13[5] = v11;
  uint64_t v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_1000900C0;
  v14[5] = v13;
  v15 = a3;
  v16 = self;
  sub_10005D070((uint64_t)v9, (uint64_t)&unk_1000900C8, (uint64_t)v14);
  swift_release();
}

- (void)getDistributedLoggingStatusWithCompletion:(id)a3
{
  uint64_t v5 = sub_10000423C(&qword_100090620);
  __chkstk_darwin(v5 - 8);
  uint64_t v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = _Block_copy(a3);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  *(void *)(v9 + 24) = self;
  uint64_t v10 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v7, 1, 1, v10);
  v11 = (void *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_100090098;
  v11[5] = v9;
  uint64_t v12 = (void *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_1000900A0;
  v12[5] = v11;
  v13 = self;
  sub_10005D070((uint64_t)v7, (uint64_t)&unk_1000900A8, (uint64_t)v12);
  swift_release();
}

- (void)setDistributedLoggingStatus:(unsigned int)a3 completion:(id)a4
{
  uint64_t v7 = sub_10000423C(&qword_100090620);
  __chkstk_darwin(v7 - 8);
  uint64_t v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = _Block_copy(a4);
  uint64_t v11 = swift_allocObject();
  *(_DWORD *)(v11 + 16) = a3;
  *(void *)(v11 + 24) = v10;
  *(void *)(v11 + 32) = self;
  uint64_t v12 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_100090078;
  v13[5] = v11;
  uint64_t v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_100090080;
  v14[5] = v13;
  v15 = self;
  sub_10005D070((uint64_t)v9, (uint64_t)&unk_100090088, (uint64_t)v14);
  swift_release();
}

- (void)appleAudioAccessoryLimitedLoggingWithCompletion:(id)a3
{
  uint64_t v5 = sub_10000423C(&qword_100090620);
  __chkstk_darwin(v5 - 8);
  uint64_t v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = _Block_copy(a3);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  *(void *)(v9 + 24) = self;
  uint64_t v10 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v7, 1, 1, v10);
  uint64_t v11 = (void *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_100090058;
  v11[5] = v9;
  uint64_t v12 = (void *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_100090060;
  v12[5] = v11;
  v13 = self;
  sub_10005D070((uint64_t)v7, (uint64_t)&unk_100090068, (uint64_t)v12);
  swift_release();
}

- (void)setAppleAudioAccessoryLimitedLogging:(BOOL)a3 completion:(id)a4
{
  uint64_t v7 = sub_10000423C(&qword_100090620);
  __chkstk_darwin(v7 - 8);
  uint64_t v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = _Block_copy(a4);
  uint64_t v11 = swift_allocObject();
  *(unsigned char *)(v11 + 16) = a3;
  *(void *)(v11 + 24) = v10;
  *(void *)(v11 + 32) = self;
  uint64_t v12 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_100090038;
  v13[5] = v11;
  uint64_t v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_100090040;
  v14[5] = v13;
  v15 = self;
  sub_10005D070((uint64_t)v9, (uint64_t)&unk_100090048, (uint64_t)v14);
  swift_release();
}

- (void)getCurrentUserGivenNameWithCompletion:(id)a3
{
  v4 = _Block_copy(a3);
  _Block_copy(v4);
  uint64_t v5 = self;
  sub_10005EDF8((uint64_t)v4);
  _Block_release(v4);
  _Block_release(v4);
}

- (void)recordEventWithDeviceIdentifier:(id)a3 initiator:(BOOL)a4 starting:(BOOL)a5 useCase:(unsigned int)a6
{
  uint64_t v6 = *(void *)&a6;
  BOOL v7 = a5;
  BOOL v8 = a4;
  uint64_t v10 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v12 = v11;
  v13 = *(uint64_t (**)(void))((swift_isaMask & **(void **)((char *)&self->super.isa
                                                           + OBJC_IVAR____TtC14bluetoothuserd13XPCConnection_listener))
                            + 0x70);
  uint64_t v14 = self;
  uint64_t v15 = v13();
  if (v15)
  {
    uint64_t v16 = (*(uint64_t (**)(void))(*(void *)v15 + 520))();
    if (v16)
    {
      (*(void (**)(uint64_t, uint64_t, BOOL, BOOL, uint64_t))(*(void *)v16 + 216))(v10, v12, v8, v7, v6);

      swift_bridgeObjectRelease();
      swift_release();
    }
    else
    {

      swift_bridgeObjectRelease();
    }
    swift_release();
  }
  else
  {

    swift_bridgeObjectRelease();
  }
}

- (void)recordEventWithStarting:(BOOL)a3 useCase:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  BOOL v5 = a3;
  uint64_t v6 = *(uint64_t (**)(void))((**(void **)((char *)&self->super.isa
                                          + OBJC_IVAR____TtC14bluetoothuserd13XPCConnection_listener) & swift_isaMask)
                           + 0x70);
  uint64_t v9 = self;
  uint64_t v7 = v6();
  if (v7)
  {
    uint64_t v8 = (*(uint64_t (**)(void))(*(void *)v7 + 520))();
    if (v8)
    {
      (*(void (**)(BOOL, uint64_t))(*(void *)v8 + 224))(v5, v4);

      swift_release();
    }
    else
    {
    }
    swift_release();
  }
  else
  {
  }
}

- (void)readPrefKeys:(NSArray *)a3 source:(unsigned int)a4 completion:(id)a5
{
  uint64_t v9 = sub_10000423C(&qword_100090620);
  __chkstk_darwin(v9 - 8);
  uint64_t v11 = (char *)&v19 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = _Block_copy(a5);
  uint64_t v13 = swift_allocObject();
  *(void *)(v13 + 16) = a3;
  *(_DWORD *)(v13 + 24) = a4;
  *(void *)(v13 + 32) = v12;
  *(void *)(v13 + 40) = self;
  uint64_t v14 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v11, 1, 1, v14);
  uint64_t v15 = (void *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_100090018;
  v15[5] = v13;
  uint64_t v16 = (void *)swift_allocObject();
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = &unk_100090020;
  v16[5] = v15;
  uint64_t v17 = a3;
  v18 = self;
  sub_10005D070((uint64_t)v11, (uint64_t)&unk_100090028, (uint64_t)v16);
  swift_release();
}

- (void)writePrefKey:(NSString *)a3 value:(id)a4 source:(unsigned int)a5 completion:(id)a6
{
  uint64_t v11 = sub_10000423C(&qword_100090620);
  __chkstk_darwin(v11 - 8);
  uint64_t v13 = (char *)&v21 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = _Block_copy(a6);
  uint64_t v15 = swift_allocObject();
  *(void *)(v15 + 16) = a3;
  *(void *)(v15 + 24) = a4;
  *(_DWORD *)(v15 + 32) = a5;
  *(void *)(v15 + 40) = v14;
  *(void *)(v15 + 48) = self;
  uint64_t v16 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 56))(v13, 1, 1, v16);
  uint64_t v17 = (void *)swift_allocObject();
  v17[2] = 0;
  v17[3] = 0;
  v17[4] = &unk_10008FFD8;
  v17[5] = v15;
  v18 = (void *)swift_allocObject();
  v18[2] = 0;
  v18[3] = 0;
  v18[4] = &unk_10008FFE8;
  v18[5] = v17;
  uint64_t v19 = a3;
  swift_unknownObjectRetain();
  v20 = self;
  sub_10005D070((uint64_t)v13, (uint64_t)&unk_10008FFF8, (uint64_t)v18);
  swift_release();
}

@end