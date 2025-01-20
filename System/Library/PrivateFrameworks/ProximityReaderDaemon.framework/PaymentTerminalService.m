@interface PaymentTerminalService
- (_TtC21ProximityReaderDaemon22PaymentTerminalService)init;
- (uint64_t)pinUIDidLoad;
- (void)cancelTransactionWithCompletion:(id)a3;
- (void)closeSession:(BOOL)a3;
- (void)createContext:(id)a3 completion:(id)a4;
- (void)dealloc;
- (void)getTerminalIdWithCompletion:(id)a3;
- (void)isAccountLinked:(id)a3 completion:(id)a4;
- (void)linkAccount:(id)a3 relink:(BOOL)a4 completion:(id)a5;
- (void)pinAuthNeeded;
- (void)pinAuthResultWithError:(id)a3 cancelsFlow:(BOOL)a4;
- (void)pinDataReceivedWithPinData:(id)a3 isCardRequest:(BOOL)a4 isAccessibilityEnabled:(BOOL)a5 accessibilityEntryType:(int64_t)a6 drawNumberFailures:(int64_t)a7;
- (void)pinValidateSession;
- (void)reportGuidanceUpdateWithVisible:(BOOL)a3 trigger:(id)a4;
- (void)reportPINErrorWithError:(int64_t)a3 isCardRequest:(BOOL)a4 isAccessibilityEnabled:(BOOL)a5 accessibilityEntryType:(int64_t)a6 drawNumberFailures:(int64_t)a7;
- (void)reportProxEventInRange:(BOOL)a3 inRangeTime:(unsigned int)a4;
- (void)setVoiceOverWithEnabled:(BOOL)a3;
- (void)startIssuerPINEntry:(id)a3 transactionId:(id)a4 completion:(id)a5;
- (void)startSession:(id)a3 options:(id)a4 completion:(id)a5;
- (void)startTransaction:(id)a3 completion:(id)a4;
- (void)status:(id)a3 completion:(id)a4;
- (void)tapUIDidLoad;
- (void)tapUIFinishedWithExpected:(BOOL)a3 issuerPIN:(BOOL)a4;
- (void)tapUIRequestingCancel;
- (void)tapUIRequestingRetry;
@end

@implementation PaymentTerminalService

- (void)dealloc
{
  v2 = self;
  sub_25ABBD434();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC21ProximityReaderDaemon22PaymentTerminalService_connection));
  swift_unknownObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC21ProximityReaderDaemon22PaymentTerminalService_uiManager));
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC21ProximityReaderDaemon22PaymentTerminalService_cardReaderAdapter);
  swift_release();
  swift_release();
  sub_25AB74948(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC21ProximityReaderDaemon22PaymentTerminalService_transactionCompletion));
  swift_release();
  swift_release();
  sub_25AB74948(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC21ProximityReaderDaemon22PaymentTerminalService_pinCompletion));
  swift_release();
  sub_25AB74948(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC21ProximityReaderDaemon22PaymentTerminalService_registrationCompletion));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  sub_25AB18FAC((uint64_t)self + OBJC_IVAR____TtC21ProximityReaderDaemon22PaymentTerminalService_finishedContinuation, &qword_26A4A1270);
  swift_release();
  sub_25AB18FAC((uint64_t)self + OBJC_IVAR____TtC21ProximityReaderDaemon22PaymentTerminalService_issuerPINContinuation, &qword_26A4A1270);
  swift_release();
  swift_release();
}

- (_TtC21ProximityReaderDaemon22PaymentTerminalService)init
{
  result = (_TtC21ProximityReaderDaemon22PaymentTerminalService *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void)createContext:(id)a3 completion:(id)a4
{
}

- (void)getTerminalIdWithCompletion:(id)a3
{
}

- (void)isAccountLinked:(id)a3 completion:(id)a4
{
}

- (void)linkAccount:(id)a3 relink:(BOOL)a4 completion:(id)a5
{
  BOOL v5 = a4;
  v7 = _Block_copy(a5);
  uint64_t v8 = sub_25AC34E40();
  uint64_t v10 = v9;
  uint64_t v11 = swift_allocObject();
  *(void *)(v11 + 16) = v7;
  v12 = self;
  sub_25ABBE47C(v8, v10, v5, (void (*)(void, void *))sub_25ABD22BC, v11);

  swift_bridgeObjectRelease();
  swift_release();
}

- (void)status:(id)a3 completion:(id)a4
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
  uint64_t v9 = self;
  sub_25ABCE514(v7, (uint64_t)a3, (uint64_t)v9, (void (**)(void, void, void))v6);
  _Block_release(v6);
  _Block_release(v6);

  swift_bridgeObjectRelease();
}

- (void)startSession:(id)a3 options:(id)a4 completion:(id)a5
{
  uint64_t v7 = _Block_copy(a5);
  uint64_t v8 = sub_25AC34E40();
  uint64_t v10 = v9;
  _Block_copy(v7);
  id v11 = a4;
  v12 = self;
  sub_25ABCEDA0(v8, v10, v11, (uint64_t)v12, v7);
  _Block_release(v7);
  _Block_release(v7);

  swift_bridgeObjectRelease();
}

- (void)closeSession:(BOOL)a3
{
  BOOL v3 = a3;
  v4 = self;
  sub_25ABC07E0(v3);
}

- (void)startTransaction:(id)a3 completion:(id)a4
{
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A4A0070);
  MEMORY[0x270FA5388](v7 - 8);
  uint64_t v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = _Block_copy(a4);
  uint64_t v11 = swift_allocObject();
  *(void *)(v11 + 16) = v10;
  uint64_t v12 = sub_25AC35140();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = self;
  v13[5] = a3;
  v13[6] = sub_25ABD2788;
  v13[7] = v11;
  id v14 = a3;
  v15 = self;
  id v16 = v14;
  swift_retain();
  *(Class *)((char *)&v15->super.isa
           + OBJC_IVAR____TtC21ProximityReaderDaemon22PaymentTerminalService_startTransactionTask) = (Class)sub_25AB71DDC((uint64_t)v9, (uint64_t)&unk_26A4A12C0, (uint64_t)v13);

  swift_release();
  swift_release();
}

- (void)cancelTransactionWithCompletion:(id)a3
{
}

- (void)startIssuerPINEntry:(id)a3 transactionId:(id)a4 completion:(id)a5
{
  v6 = _Block_copy(a5);
  uint64_t v7 = sub_25AC34E40();
  uint64_t v9 = v8;
  uint64_t v10 = sub_25AC34E40();
  uint64_t v12 = v11;
  _Block_copy(v6);
  v13 = self;
  sub_25ABD000C(v7, v9, v10, v12, v13, v6);
  _Block_release(v6);
  _Block_release(v6);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (void)tapUIDidLoad
{
  v2 = self;
  sub_25ABC81B4();
}

- (void)tapUIRequestingRetry
{
  v2 = self;
  sub_25ABC8BA8();
}

- (void)tapUIRequestingCancel
{
  v2 = self;
  sub_25ABC8DD8();
}

- (void)tapUIFinishedWithExpected:(BOOL)a3 issuerPIN:(BOOL)a4
{
  BOOL v4 = a4;
  v6 = self;
  sub_25ABC8FE4(a3, v4);
}

- (void)pinValidateSession
{
  v2 = self;
  sub_25ABCA890();
}

- (void)pinAuthNeeded
{
  v2 = self;
  sub_25ABCB304();
}

- (void)pinAuthResultWithError:(id)a3 cancelsFlow:(BOOL)a4
{
  if (a3)
  {
    uint64_t v6 = sub_25AC34E40();
    uint64_t v8 = v7;
  }
  else
  {
    uint64_t v6 = 0;
    uint64_t v8 = 0;
  }
  uint64_t v9 = self;
  sub_25ABCB564(v6, v8, a4);

  swift_bridgeObjectRelease();
}

- (void)pinDataReceivedWithPinData:(id)a3 isCardRequest:(BOOL)a4 isAccessibilityEnabled:(BOOL)a5 accessibilityEntryType:(int64_t)a6 drawNumberFailures:(int64_t)a7
{
  BOOL v9 = a5;
  BOOL v10 = a4;
  id v12 = a3;
  v13 = self;
  sub_25ABCB8C0(v12, v10, v9, a6, a7);
}

- (void)reportPINErrorWithError:(int64_t)a3 isCardRequest:(BOOL)a4 isAccessibilityEnabled:(BOOL)a5 accessibilityEntryType:(int64_t)a6 drawNumberFailures:(int64_t)a7
{
  BOOL v10 = a4;
  id v12 = self;
  sub_25ABCBCA8(a3, v10, a5, a6, a7);
}

- (void)reportGuidanceUpdateWithVisible:(BOOL)a3 trigger:(id)a4
{
  BOOL v4 = a3;
  uint64_t v6 = sub_25AC34E40();
  uint64_t v8 = v7;
  BOOL v9 = self;
  sub_25ABCBFB8(v4, v6, v8);

  swift_bridgeObjectRelease();
}

- (void)reportProxEventInRange:(BOOL)a3 inRangeTime:(unsigned int)a4
{
  BOOL v5 = a3;
  uint64_t v6 = self;
  sub_25ABCC0F4(v5, a4);
}

- (void)setVoiceOverWithEnabled:(BOOL)a3
{
}

- (uint64_t)pinUIDidLoad
{
  uint64_t v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A49F9A0);
  MEMORY[0x270FA5388](v0);
  v2 = (char *)&v10 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_26A49F7D8 != -1) {
    swift_once();
  }
  uint64_t v3 = __swift_project_value_buffer(v0, (uint64_t)qword_26A4A1C70);
  sub_25AB4C944(v3, (uint64_t)v2, &qword_26A49F9A0);
  uint64_t v4 = sub_25AC345E0();
  uint64_t v5 = *(void *)(v4 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v5 + 48))(v2, 1, v4) == 1) {
    return sub_25AB18FAC((uint64_t)v2, &qword_26A49F9A0);
  }
  uint64_t v7 = sub_25AC345C0();
  os_log_type_t v8 = sub_25AC352B0();
  if (os_log_type_enabled(v7, v8))
  {
    BOOL v9 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)BOOL v9 = 0;
    _os_log_impl(&dword_25AB11000, v7, v8, "pinUIDidLoad", v9, 2u);
    MEMORY[0x261151C20](v9, -1, -1);
  }

  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v2, v4);
}

@end