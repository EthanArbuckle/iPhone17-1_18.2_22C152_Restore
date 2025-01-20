@interface IdentityReaderService
- (_TtC21ProximityReaderDaemon21IdentityReaderService)init;
- (uint64_t)identityRegUIDidLoad;
- (void)cancelReadWithCompletion:(id)a3;
- (void)cancelRegistration;
- (void)dealloc;
- (void)identityRegUIFinished;
- (void)identityUIDidLoad;
- (void)identityUIFinished;
- (void)notifyUIButtonTapWithButton:(int64_t)a3;
- (void)performDataRequest:(id)a3 completion:(id)a4;
- (void)performDisplayRequest:(id)a3 completion:(id)a4;
- (void)performRawDataRequest:(id)a3 completion:(id)a4;
- (void)prepareUsing:(id)a3 completion:(id)a4;
- (void)qrCodeScanErrorWithError:(id)a3;
- (void)qrCodeScanInitiated;
- (void)readDocumentFromScannedQRCodeWithPayload:(id)a3;
- (void)readerConfigurationWithCompletion:(id)a3;
- (void)registerWithCompletion:(id)a3;
- (void)requestCancelReadWithIsEngagementTransition:(BOOL)a3;
- (void)requestRestartReadWithTriggeredByMultipleCheck:(BOOL)a3;
@end

@implementation IdentityReaderService

- (void)dealloc
{
  v2 = self;
  sub_25ABFC0EC();
}

- (void).cxx_destruct
{
  v3 = (char *)self + OBJC_IVAR____TtC21ProximityReaderDaemon21IdentityReaderService_entitlements;
  uint64_t v4 = sub_25AC332F0();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  swift_release();
  swift_release();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC21ProximityReaderDaemon21IdentityReaderService_uiManager));
  sub_25AB74948(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC21ProximityReaderDaemon21IdentityReaderService_startReader));
  sub_25AB74948(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC21ProximityReaderDaemon21IdentityReaderService_readerReadyListener));
  sub_25AB74948(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC21ProximityReaderDaemon21IdentityReaderService_prepareTask));
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC21ProximityReaderDaemon21IdentityReaderService_prepareError));
  sub_25AB74948(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC21ProximityReaderDaemon21IdentityReaderService_prepareHandler));
  swift_release();
  sub_25AB74948(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC21ProximityReaderDaemon21IdentityReaderService_readDocumentTask));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC21ProximityReaderDaemon21IdentityReaderService_readError));
  sub_25AB74948(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC21ProximityReaderDaemon21IdentityReaderService_dataRequestHandler));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC21ProximityReaderDaemon21IdentityReaderService_dataRequestResponse));
  sub_25AB74948(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC21ProximityReaderDaemon21IdentityReaderService_rawDataRequestHandler));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC21ProximityReaderDaemon21IdentityReaderService_rawDataRequestResponse));
  sub_25AB74948(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC21ProximityReaderDaemon21IdentityReaderService_displayRequestHandler));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC21ProximityReaderDaemon21IdentityReaderService_displayRequestResponse));
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  sub_25AB18FAC((uint64_t)self + OBJC_IVAR____TtC21ProximityReaderDaemon21IdentityReaderService_analyticsTransaction, &qword_26A4A1650);
}

- (_TtC21ProximityReaderDaemon21IdentityReaderService)init
{
  result = (_TtC21ProximityReaderDaemon21IdentityReaderService *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void)readerConfigurationWithCompletion:(id)a3
{
}

- (void)prepareUsing:(id)a3 completion:(id)a4
{
  v6 = _Block_copy(a4);
  if (a3)
  {
    uint64_t v7 = sub_25AC34E40();
    a3 = v8;
  }
  else
  {
    uint64_t v7 = 0;
  }
  _Block_copy(v6);
  v9 = self;
  sub_25AC0E604(v7, (unint64_t)a3, (char *)v9, v6);
  _Block_release(v6);
  _Block_release(v6);

  swift_bridgeObjectRelease();
}

- (void)performRawDataRequest:(id)a3 completion:(id)a4
{
}

- (void)performDataRequest:(id)a3 completion:(id)a4
{
}

- (void)performDisplayRequest:(id)a3 completion:(id)a4
{
}

- (void)cancelReadWithCompletion:(id)a3
{
}

- (void)identityUIDidLoad
{
  v2 = self;
  sub_25ABF905C();
}

- (void)identityUIFinished
{
  v2 = self;
  sub_25ABF9670();
}

- (void)requestCancelReadWithIsEngagementTransition:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v4 = self;
  sub_25ABF984C(v3);
}

- (void)requestRestartReadWithTriggeredByMultipleCheck:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v4 = self;
  sub_25ABFA0D4(v3);
}

- (void)readDocumentFromScannedQRCodeWithPayload:(id)a3
{
  id v4 = a3;
  v8 = self;
  uint64_t v5 = sub_25AC323A0();
  unint64_t v7 = v6;

  sub_25ABF9DFC(v5, v7);
  sub_25AB16958(v5, v7);
}

- (void)notifyUIButtonTapWithButton:(int64_t)a3
{
  id v4 = self;
  sub_25ABFA61C(a3);
}

- (void)cancelRegistration
{
  v2 = self;
  sub_25ABFB374();
}

- (void)registerWithCompletion:(id)a3
{
  id v4 = _Block_copy(a3);
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  unint64_t v6 = self;
  sub_25ABFAF40((uint64_t)sub_25AC0BE4C, v5);

  swift_release();
}

- (void)identityRegUIFinished
{
  v2 = self;
  sub_25ABF8D98();
}

- (uint64_t)identityRegUIDidLoad
{
  uint64_t v0 = sub_25AC328E0();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x270FA5388](v0);
  BOOL v3 = (char *)&v14 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A49F9A0);
  MEMORY[0x270FA5388](v4);
  unint64_t v6 = (char *)&v14 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_26A49F840 != -1) {
    swift_once();
  }
  uint64_t v7 = __swift_project_value_buffer(v4, (uint64_t)qword_26A4A1DA8);
  sub_25AB4C944(v7, (uint64_t)v6, &qword_26A49F9A0);
  uint64_t v8 = sub_25AC345E0();
  uint64_t v9 = *(void *)(v8 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v9 + 48))(v6, 1, v8) == 1)
  {
    sub_25AB18FAC((uint64_t)v6, &qword_26A49F9A0);
  }
  else
  {
    v10 = sub_25AC345C0();
    os_log_type_t v11 = sub_25AC352D0();
    if (os_log_type_enabled(v10, v11))
    {
      v12 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v12 = 0;
      _os_log_impl(&dword_25AB11000, v10, v11, "Identity registration UI is visible", v12, 2u);
      MEMORY[0x261151C20](v12, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v9 + 8))(v6, v8);
  }
  sub_25AC32800();
  sub_25AC32850();
  return (*(uint64_t (**)(char *, uint64_t))(v1 + 8))(v3, v0);
}

- (void)qrCodeScanInitiated
{
  uint64_t v2 = self;
  sub_25AC120C8();
}

- (void)qrCodeScanErrorWithError:(id)a3
{
  uint64_t v4 = sub_25AC34E40();
  uint64_t v6 = v5;
  uint64_t v7 = self;
  sub_25AC123DC(v4, v6);

  swift_bridgeObjectRelease();
}

@end