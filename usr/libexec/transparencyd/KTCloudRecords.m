@interface KTCloudRecords
- (BOOL)addDevice:(id)a3 clientData:(id)a4 error:(id *)a5;
- (BOOL)addOptInStateWithURI:(id)a3 smtTimestamp:(id)a4 application:(id)a5 state:(BOOL)a6 error:(id *)a7;
- (BOOL)clearOptInStateForURI:(id)a3 application:(id)a4 error:(id *)a5;
- (BOOL)cloudDeviceNeedUpdateWithPushToken:(id)a3 tbsRegistrationData:(id)a4;
- (BOOL)disableKTSyncabledKVSStore;
- (BOOL)enforceCKOptInRecords;
- (BOOL)havePendingRecords;
- (BOOL)removeDevice:(id)a3 clientData:(id)a4 error:(id *)a5;
- (BOOL)setOptInStateWithURIs:(id)a3 application:(id)a4 state:(BOOL)a5 error:(id *)a6;
- (BOOL)updatedRecordWithCkrecord:(id)a3;
- (_TtC13transparencyd14KTCloudRecords)init;
- (_TtC13transparencyd14KTCloudRecords)initWithContext:(id)a3 zone:(id)a4 database:(id)a5 hostInfo:(id)a6 delegate:(id)a7;
- (id)cloudDevices;
- (id)cloudKTDevices;
- (id)cloudKitZones;
- (id)deleteOptInIntentForApplication:(id)a3 error:(id *)a4;
- (id)deletedRecords;
- (id)evaluateKTLogData:(id)a3 application:(id)a4 error:(id *)a5;
- (id)fetchSyncedLoggableDataWithPushToken:(id)a3 tbsRegistrationData:(id)a4;
- (id)getAggregateOptInStateForApplication:(id)a3 error:(id *)a4;
- (id)getAllOptInStatesAndReturnError:(id *)a3;
- (id)getOptInStateWithUri:(id)a3 application:(id)a4 error:(id *)a5;
- (id)pendingRecords;
- (id)storeOptInForApplication:(id)a3 uris:(id)a4 state:(BOOL)a5 error:(id *)a6;
- (id)storeOptInIntentForApplication:(id)a3 state:(BOOL)a4 overwrite:(BOOL)a5 error:(id *)a6;
- (id)sysdiagnose;
- (id)updateCloudRecordsOperation:(id)a3 context:(id)a4;
- (void)clearDataStore:(BOOL)a3;
- (void)clearLocalCloudState;
- (void)deleteRecordIDWithCkrecordID:(id)a3;
- (void)deleteRecordWithCkrecord:(id)a3;
- (void)recordUpdateCloudStateWithType:(id)a3 records:(id)a4 newState:(id)a5;
- (void)updateSelfCloudDeviceWithPushToken:(id)a3 tbsRegistrationData:(id)a4 applications:(id)a5;
@end

@implementation KTCloudRecords

- (_TtC13transparencyd14KTCloudRecords)initWithContext:(id)a3 zone:(id)a4 database:(id)a5 hostInfo:(id)a6 delegate:(id)a7
{
  uint64_t v11 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v13 = v12;
  id v14 = a3;
  id v15 = a5;
  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  return (_TtC13transparencyd14KTCloudRecords *)KTCloudRecords.init(context:zone:database:hostInfo:delegate:)(v14, v11, v13, v15, (uint64_t)a6, (uint64_t)a7);
}

- (BOOL)disableKTSyncabledKVSStore
{
  v7 = &type metadata for TransparencyFeatureFlags;
  unint64_t v8 = sub_1000CA17C();
  v6[0] = 0;
  v3 = self;
  char v4 = isFeatureEnabled(_:)();
  sub_10008FBC4((uint64_t)v6);

  return v4 & 1;
}

- (id)sysdiagnose
{
  v2 = *(uint64_t (**)(void))(**(void **)((char *)&self->super.isa
                                         + OBJC_IVAR____TtC13transparencyd14KTCloudRecords_cloudOptIn)
                           + 280);
  v3 = self;
  uint64_t v4 = v2();
  sub_100080E08(&qword_100321488);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_1002856F0;
  *(void *)(inited + 32) = 0x6E4974706FLL;
  *(void *)(inited + 40) = 0xE500000000000000;
  *(void *)(inited + 72) = sub_100080E08(&qword_100321490);
  *(void *)(inited + 48) = v4;
  sub_1000C9718(inited);

  v6.super.isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();

  return v6.super.isa;
}

- (void)updateSelfCloudDeviceWithPushToken:(id)a3 tbsRegistrationData:(id)a4 applications:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v18 = self;
  uint64_t v11 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v13 = v12;

  uint64_t v14 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v16 = v15;

  uint64_t v17 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  (*(void (**)(uint64_t, unint64_t, uint64_t, unint64_t, uint64_t))(**(void **)((char *)&v18->super.isa + OBJC_IVAR____TtC13transparencyd14KTCloudRecords_cloudDevice)
                                                                                        + 248))(v11, v13, v14, v16, v17);
  swift_bridgeObjectRelease();
  sub_100080CB0(v14, v16);
  sub_100080CB0(v11, v13);
}

- (BOOL)cloudDeviceNeedUpdateWithPushToken:(id)a3 tbsRegistrationData:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = self;
  uint64_t v9 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v11 = v10;

  uint64_t v12 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v14 = v13;

  uint64_t v15 = *(uint64_t *)((char *)&v8->super.isa + OBJC_IVAR____TtC13transparencyd14KTCloudRecords_cloudDevice);
  unint64_t v16 = *(Class *)((char *)&v8->super.isa + OBJC_IVAR____TtC13transparencyd14KTCloudRecords_hostInfo);
  if (v16)
  {
    id v17 = [v16 osVersion];
    uint64_t v18 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v20 = v19;
  }
  else
  {
    uint64_t v18 = 0;
    uint64_t v20 = 0;
  }
  char v21 = (*(uint64_t (**)(uint64_t, unint64_t, uint64_t, unint64_t, uint64_t, uint64_t))(*(void *)v15 + 256))(v9, v11, v12, v14, v18, v20);
  swift_bridgeObjectRelease();
  sub_100080CB0(v12, v14);
  sub_100080CB0(v9, v11);

  return v21 & 1;
}

- (id)fetchSyncedLoggableDataWithPushToken:(id)a3 tbsRegistrationData:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = self;
  uint64_t v9 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v11 = v10;

  uint64_t v12 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v14 = v13;

  uint64_t v15 = (void *)(*(uint64_t (**)(uint64_t, unint64_t, uint64_t, unint64_t))(**(void **)((char *)&v8->super.isa + OBJC_IVAR____TtC13transparencyd14KTCloudRecords_cloudDevice)
                                                                                                + 264))(v9, v11, v12, v14);
  sub_100080CB0(v12, v14);
  sub_100080CB0(v9, v11);

  return v15;
}

- (id)cloudKTDevices
{
  v2 = *(void (**)(void))(**(void **)((char *)&self->super.isa
                                      + OBJC_IVAR____TtC13transparencyd14KTCloudRecords_cloudDevice)
                        + 272);
  v3 = self;
  v2();

  sub_10008E0A0(0, &qword_100321510);
  v4.super.isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();

  return v4.super.isa;
}

- (id)cloudDevices
{
  v2 = *(void (**)(void))(**(void **)((char *)&self->super.isa
                                      + OBJC_IVAR____TtC13transparencyd14KTCloudRecords_cloudDevice)
                        + 280);
  v3 = self;
  v2();

  sub_10008E0A0(0, &qword_1003215D0);
  v4.super.isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();

  return v4.super.isa;
}

- (BOOL)addDevice:(id)a3 clientData:(id)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = self;
  uint64_t v10 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v12 = v11;

  uint64_t v13 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v15 = v14;

  (*(void (**)(uint64_t, unint64_t, uint64_t, unint64_t))(**(void **)((char *)&v9->super.isa
                                                                                             + OBJC_IVAR____TtC13transparencyd14KTCloudRecords_cloudDevice)
                                                                               + 288))(v10, v12, v13, v15);

  sub_100080CB0(v13, v15);
  sub_100080CB0(v10, v12);
  return 1;
}

- (BOOL)removeDevice:(id)a3 clientData:(id)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = self;
  uint64_t v10 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v12 = v11;

  uint64_t v13 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v15 = v14;

  (*(void (**)(uint64_t, unint64_t, uint64_t, unint64_t))(**(void **)((char *)&v9->super.isa
                                                                                             + OBJC_IVAR____TtC13transparencyd14KTCloudRecords_cloudDevice)
                                                                               + 296))(v10, v12, v13, v15);

  sub_100080CB0(v13, v15);
  sub_100080CB0(v10, v12);
  return 1;
}

- (BOOL)setOptInStateWithURIs:(id)a3 application:(id)a4 state:(BOOL)a5 error:(id *)a6
{
  BOOL v6 = a5;
  type metadata accessor for Date();
  uint64_t v8 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v9 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v11 = v10;
  unint64_t v12 = *(void (**)(uint64_t, uint64_t, uint64_t, BOOL))(**(void **)((char *)&self->super.isa
                                                                               + OBJC_IVAR____TtC13transparencyd14KTCloudRecords_cloudOptIn)
                                                                 + 352);
  uint64_t v13 = self;
  v12(v8, v9, v11, v6);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return 1;
}

- (BOOL)addOptInStateWithURI:(id)a3 smtTimestamp:(id)a4 application:(id)a5 state:(BOOL)a6 error:(id *)a7
{
  v19[1] = a7;
  BOOL v22 = a6;
  uint64_t v21 = type metadata accessor for Date();
  uint64_t v8 = *(void *)(v21 - 8);
  __chkstk_darwin(v21);
  uint64_t v10 = (char *)v19 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v13 = v12;
  static Date._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v14 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v16 = v15;
  id v17 = *(void (**)(uint64_t, uint64_t, char *, uint64_t, uint64_t, BOOL))(**(void **)((char *)&self->super.isa
                                                                                                + OBJC_IVAR____TtC13transparencyd14KTCloudRecords_cloudOptIn)
                                                                                  + 360);
  uint64_t v20 = self;
  v17(v11, v13, v10, v14, v16, v22);
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v21);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return 1;
}

- (id)getOptInStateWithUri:(id)a3 application:(id)a4 error:(id *)a5
{
  uint64_t v7 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v9 = v8;
  uint64_t v10 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v12 = v11;
  uint64_t v13 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(**(void **)((char *)&self->super.isa
                                                                                   + OBJC_IVAR____TtC13transparencyd14KTCloudRecords_cloudOptIn)
                                                                     + 248);
  uint64_t v14 = self;
  uint64_t v15 = v13(v7, v9, v10, v12);
  if (v15)
  {
    uint64_t v16 = (void *)v15;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  else
  {
    sub_1000CB228();
    swift_allocError();
    swift_willThrow();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();

    if (a5)
    {
      id v17 = (void *)_convertErrorToNSError(_:)();
      swift_errorRelease();
      id v18 = v17;
      uint64_t v16 = 0;
      *a5 = v17;
    }
    else
    {
      swift_errorRelease();
      uint64_t v16 = 0;
    }
  }

  return v16;
}

- (id)getAggregateOptInStateForApplication:(id)a3 error:(id *)a4
{
  uint64_t v6 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v8 = v7;
  uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t))(**(void **)((char *)&self->super.isa
                                                                + OBJC_IVAR____TtC13transparencyd14KTCloudRecords_cloudOptIn)
                                                  + 264);
  uint64_t v10 = self;
  uint64_t v11 = v9(v6, v8);
  if (v11)
  {
    uint64_t v12 = (void *)v11;
    swift_bridgeObjectRelease();
  }
  else
  {
    type metadata accessor for KTError();
    sub_1000D27FC((unint64_t *)&qword_100321170, (void (*)(uint64_t))type metadata accessor for KTError);
    swift_allocError();
    swift_storeEnumTagMultiPayload();
    swift_willThrow();
    swift_bridgeObjectRelease();

    if (a4)
    {
      uint64_t v13 = (void *)_convertErrorToNSError(_:)();
      swift_errorRelease();
      id v14 = v13;
      uint64_t v12 = 0;
      *a4 = v13;
    }
    else
    {
      swift_errorRelease();
      uint64_t v12 = 0;
    }
  }

  return v12;
}

- (id)getAllOptInStatesAndReturnError:(id *)a3
{
  v3 = *(void (**)(void))(**(void **)((char *)&self->super.isa
                                      + OBJC_IVAR____TtC13transparencyd14KTCloudRecords_cloudOptIn)
                        + 272);
  NSArray v4 = self;
  v3();

  sub_10008E0A0(0, (unint64_t *)&qword_1003214D0);
  v5.super.isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();

  return v5.super.isa;
}

- (BOOL)clearOptInStateForURI:(id)a3 application:(id)a4 error:(id *)a5
{
  if (a3)
  {
    uint64_t v6 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v8 = v7;
  }
  else
  {
    uint64_t v6 = 0;
    uint64_t v8 = 0;
  }
  uint64_t v9 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v11 = v10;
  uint64_t v12 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(**(void **)((char *)&self->super.isa
                                                                                + OBJC_IVAR____TtC13transparencyd14KTCloudRecords_cloudOptIn)
                                                                  + 288);
  uint64_t v13 = self;
  v12(v6, v8, v9, v11);
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  return 1;
}

- (id)storeOptInIntentForApplication:(id)a3 state:(BOOL)a4 overwrite:(BOOL)a5 error:(id *)a6
{
  BOOL v6 = a5;
  BOOL v7 = a4;
  uint64_t v9 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v11 = v10;
  uint64_t v12 = *(uint64_t (**)(uint64_t, uint64_t, BOOL, BOOL))(**(void **)((char *)&self->super.isa
                                                                                 + OBJC_IVAR____TtC13transparencyd14KTCloudRecords_cloudOptIn)
                                                                   + 328);
  uint64_t v13 = self;
  id v14 = (void *)v12(v9, v11, v7, v6);
  swift_bridgeObjectRelease();

  return v14;
}

- (id)deleteOptInIntentForApplication:(id)a3 error:(id *)a4
{
  uint64_t v5 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v7 = v6;
  uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, _TtC13transparencyd14KTCloudRecords *))(**(void **)((char *)&self->super.isa + OBJC_IVAR____TtC13transparencyd14KTCloudRecords_cloudOptIn)
                                                                                         + 336);
  uint64_t v9 = self;
  uint64_t v10 = (void *)v8(v5, v7, v9);
  swift_bridgeObjectRelease();

  return v10;
}

- (id)storeOptInForApplication:(id)a3 uris:(id)a4 state:(BOOL)a5 error:(id *)a6
{
  BOOL v6 = a5;
  uint64_t v8 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v10 = v9;
  type metadata accessor for Date();
  uint64_t v11 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v12 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, BOOL, _TtC13transparencyd14KTCloudRecords *))(**(void **)((char *)&self->super.isa + OBJC_IVAR____TtC13transparencyd14KTCloudRecords_cloudOptIn) + 344);
  uint64_t v13 = self;
  id v14 = (void *)v12(v8, v10, v11, v6, v13);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return v14;
}

- (void)clearDataStore:(BOOL)a3
{
  BOOL v3 = a3;
  NSArray v4 = *(void (**)(BOOL))(**(void **)((char *)&self->super.isa
                                                   + OBJC_IVAR____TtC13transparencyd14KTCloudRecords_cloudOptIn)
                                     + 456);
  uint64_t v5 = self;
  v4(v3);
  (*(void (**)(BOOL))(**(void **)((char *)&v5->super.isa
                                               + OBJC_IVAR____TtC13transparencyd14KTCloudRecords_cloudDevice)
                                 + 392))(v3);
}

- (void)clearLocalCloudState
{
  v2 = *(void (**)(void))((swift_isaMask & (uint64_t)self->super.isa) + 0x158);
  BOOL v3 = self;
  v2(0);
  type metadata accessor for KTCKZone();
  uint64_t v4 = sub_100088420((uint64_t)objc_retain(*(id *)((char *)&v3->super.isa
                                                + OBJC_IVAR____TtC13transparencyd14KTCloudRecords_context)));
  id v5 = [*(id *)((char *)&v3->super.isa + OBJC_IVAR____TtC13transparencyd14KTCloudRecords_zoneID) zoneName];
  uint64_t v6 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v8 = v7;

  (*(void (**)(uint64_t, uint64_t))(*(void *)v4 + 128))(v6, v8);
  swift_release();

  swift_bridgeObjectRelease();
}

- (BOOL)havePendingRecords
{
  v2 = self;
  Swift::Bool v3 = KTCloudRecords.havePendingRecords()();

  return v3;
}

- (id)pendingRecords
{
  return sub_1000CD464((char *)self, (uint64_t)a2, (void (*)(void *, uint64_t))sub_1000CC37C, &qword_100321980);
}

- (id)deletedRecords
{
  return sub_1000CD464((char *)self, (uint64_t)a2, (void (*)(void *, uint64_t))sub_1000CC57C, (unint64_t *)&unk_1003206B0);
}

- (id)cloudKitZones
{
  sub_100080E08(&qword_100320D40);
  uint64_t v3 = swift_allocObject();
  *(_OWORD *)(v3 + 16) = xmmword_100287920;
  uint64_t v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC13transparencyd14KTCloudRecords_zoneID);
  *(void *)(v3 + 32) = v4;
  specialized Array._endMutation()();
  sub_10008E0A0(0, &qword_10031F8E0);
  id v5 = v4;
  v6.super.isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();

  return v6.super.isa;
}

- (BOOL)updatedRecordWithCkrecord:(id)a3
{
  id v4 = a3;
  id v5 = self;
  LOBYTE(self) = KTCloudRecords.updatedRecord(withCkrecord:)((CKRecord)v4);

  return self & 1;
}

- (void)deleteRecordWithCkrecord:(id)a3
{
  id v4 = a3;
  id v5 = self;
  KTCloudRecords.deleteRecord(withCkrecord:)((CKRecord)v4);
}

- (void)deleteRecordIDWithCkrecordID:(id)a3
{
  swift_beginAccess();
  id v5 = a3;
  NSArray v6 = self;
  uint64_t v7 = swift_bridgeObjectRetain();
  sub_1000D262C(v7, (void (*)(uint64_t, uint64_t, unsigned char *))sub_1000D07E8);

  swift_bridgeObjectRelease();
}

- (void)recordUpdateCloudStateWithType:(id)a3 records:(id)a4 newState:(id)a5
{
  void (*v13)(long long *__return_ptr, uint64_t, uint64_t);
  _TtC13transparencyd14KTCloudRecords *v14;
  uint64_t v15;
  uint64_t v16;
  long long v17;
  uint64_t v18;
  void v19[3];
  uint64_t v20;
  uint64_t v21;

  uint64_t v6 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v8 = v7;
  sub_10008E0A0(0, (unint64_t *)&unk_1003206B0);
  uint64_t v9 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v10 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v12 = v11;
  uint64_t v13 = *(void (**)(long long *__return_ptr, uint64_t, uint64_t))((swift_isaMask & (uint64_t)self->super.isa)
                                                                        + 0x190);
  id v14 = self;
  v13(&v17, v6, v8);
  if (v18)
  {
    sub_100098428(&v17, (uint64_t)v19);
    uint64_t v15 = v20;
    uint64_t v16 = v21;
    sub_100097048(v19, v20);
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v16 + 64))(v9, v10, v12, v15, v16);
    sub_10008FBC4((uint64_t)v19);
  }
  else
  {
    sub_100087A1C((uint64_t)&v17, &qword_1003214B8);
  }

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (id)updateCloudRecordsOperation:(id)a3 context:(id)a4
{
  type metadata accessor for KTUpdateCloudStorageOperation();
  id v7 = KTUpdateCloudStorageOperation.__allocating_init(deps:source:context:)((uint64_t)a3, (uint64_t)self, (uint64_t)a4);

  return v7;
}

- (id)evaluateKTLogData:(id)a3 application:(id)a4 error:(id *)a5
{
  sub_100080E08(&qword_1003214D8);
  uint64_t v6 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v7 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v9 = v8;
  uint64_t v10 = self;
  uint64_t v11 = KTCloudRecords.evaluateKTLogData(_:application:)(v6, v7, v9);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return v11;
}

- (BOOL)enforceCKOptInRecords
{
  uint64_t v7 = &type metadata for TransparencyFeatureFlags;
  unint64_t v8 = sub_1000CA17C();
  v6[0] = 1;
  uint64_t v3 = self;
  char v4 = isFeatureEnabled(_:)();
  sub_10008FBC4((uint64_t)v6);

  return (v4 & 1) == 0;
}

- (_TtC13transparencyd14KTCloudRecords)init
{
  result = (_TtC13transparencyd14KTCloudRecords *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();

  swift_unknownObjectRelease();
  sub_1000A3E38((uint64_t)self + OBJC_IVAR____TtC13transparencyd14KTCloudRecords_delegate);

  uint64_t v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC13transparencyd14KTCloudRecords_database);
}

@end