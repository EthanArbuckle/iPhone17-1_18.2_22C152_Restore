@interface TC2Daemon
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (_TtC20privatecloudcomputed9TC2Daemon)init;
@end

@implementation TC2Daemon

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  char v9 = sub_1000B7B20(v7);

  return v9 & 1;
}

- (_TtC20privatecloudcomputed9TC2Daemon)init
{
  result = (_TtC20privatecloudcomputed9TC2Daemon *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  v3 = (char *)self + OBJC_IVAR____TtC20privatecloudcomputed9TC2Daemon_logger;
  uint64_t v4 = sub_1001C0340();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  long long v5 = *(_OWORD *)&self->systemInfo[OBJC_IVAR____TtC20privatecloudcomputed9TC2Daemon_systemInfo + 136];
  v16[8] = *(_OWORD *)&self->systemInfo[OBJC_IVAR____TtC20privatecloudcomputed9TC2Daemon_systemInfo + 120];
  v16[9] = v5;
  v16[10] = *(_OWORD *)&self->systemInfo[OBJC_IVAR____TtC20privatecloudcomputed9TC2Daemon_systemInfo + 152];
  long long v6 = *(_OWORD *)&self->systemInfo[OBJC_IVAR____TtC20privatecloudcomputed9TC2Daemon_systemInfo + 72];
  v16[4] = *(_OWORD *)&self->systemInfo[OBJC_IVAR____TtC20privatecloudcomputed9TC2Daemon_systemInfo + 56];
  v16[5] = v6;
  long long v7 = *(_OWORD *)&self->systemInfo[OBJC_IVAR____TtC20privatecloudcomputed9TC2Daemon_systemInfo + 104];
  v16[6] = *(_OWORD *)&self->systemInfo[OBJC_IVAR____TtC20privatecloudcomputed9TC2Daemon_systemInfo + 88];
  v16[7] = v7;
  long long v8 = *(_OWORD *)&self->systemInfo[OBJC_IVAR____TtC20privatecloudcomputed9TC2Daemon_systemInfo + 8];
  v16[0] = *(_OWORD *)((char *)&self->super.isa + OBJC_IVAR____TtC20privatecloudcomputed9TC2Daemon_systemInfo);
  v16[1] = v8;
  long long v9 = *(_OWORD *)&self->systemInfo[OBJC_IVAR____TtC20privatecloudcomputed9TC2Daemon_systemInfo + 40];
  v16[2] = *(_OWORD *)&self->systemInfo[OBJC_IVAR____TtC20privatecloudcomputed9TC2Daemon_systemInfo + 24];
  v16[3] = v9;
  sub_1000161E0((uint64_t)v16);
  swift_release();
  v10 = (char *)self + OBJC_IVAR____TtC20privatecloudcomputed9TC2Daemon_config;
  uint64_t v11 = sub_1001BFB30();
  (*(void (**)(char *, uint64_t))(*(void *)(v11 - 8) + 8))(v10, v11);
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  sub_1000B9A3C((uint64_t)self + OBJC_IVAR____TtC20privatecloudcomputed9TC2Daemon_attestationVerifier, (uint64_t (*)(void))type metadata accessor for TC2CloudAttestationVerifier);
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  v12 = (char *)self + OBJC_IVAR____TtC20privatecloudcomputed9TC2Daemon_thimbledEventStream;
  uint64_t v13 = sub_100003918(&qword_10020C360);
  (*(void (**)(char *, uint64_t))(*(void *)(v13 - 8) + 8))(v12, v13);
  v14 = (char *)self + OBJC_IVAR____TtC20privatecloudcomputed9TC2Daemon_thimbledEventContinuation;
  uint64_t v15 = sub_100003918(qword_100208000);
  (*(void (**)(char *, uint64_t))(*(void *)(v15 - 8) + 8))(v14, v15);
  sub_100010360((uint64_t)self + OBJC_IVAR____TtC20privatecloudcomputed9TC2Daemon_structuredRequestFactoriesBySetup, (uint64_t *)&unk_10020C320);
  swift_release();
}

@end