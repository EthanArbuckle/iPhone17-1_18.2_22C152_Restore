@interface PASUICDPEnrollmentObserver
- (_TtC23ProximityAppleIDSetupUI26PASUICDPEnrollmentObserver)init;
- (uint64_t)uiController:didPresentRootViewController:;
- (void)dealloc;
- (void)uiController:(id)a3 prepareAlertContext:(id)a4;
- (void)uiController:(id)a3 preparePresentationContext:(id)a4;
@end

@implementation PASUICDPEnrollmentObserver

- (void)dealloc
{
  v2 = self;
  sub_22E7EE7D4();
  v3.receiver = v2;
  v3.super_class = (Class)type metadata accessor for PASUICDPEnrollmentObserver();
  [(PASUICDPEnrollmentObserver *)&v3 dealloc];
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC23ProximityAppleIDSetupUI26PASUICDPEnrollmentObserver_notificationCenter));
  swift_bridgeObjectRelease();
  objc_super v3 = (char *)self + OBJC_IVAR____TtC23ProximityAppleIDSetupUI26PASUICDPEnrollmentObserver_delegate;
  sub_22E7B4FDC((uint64_t)v3);
}

- (_TtC23ProximityAppleIDSetupUI26PASUICDPEnrollmentObserver)init
{
  result = (_TtC23ProximityAppleIDSetupUI26PASUICDPEnrollmentObserver *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void)uiController:(id)a3 prepareAlertContext:(id)a4
{
  v6 = _Block_copy(a4);
  _Block_copy(v6);
  id v7 = a3;
  v8 = self;
  sub_22E7EECB4((uint64_t)v6);
  _Block_release(v6);
  _Block_release(v6);
}

- (void)uiController:(id)a3 preparePresentationContext:(id)a4
{
  v6 = _Block_copy(a4);
  _Block_copy(v6);
  id v7 = a3;
  v8 = self;
  sub_22E7EEE20((uint64_t)v8, (uint64_t)v6);
  _Block_release(v6);
  _Block_release(v6);
}

- (uint64_t)uiController:didPresentRootViewController:
{
  uint64_t v0 = sub_22E7F3580();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x270FA5388](v0);
  objc_super v3 = (char *)&v9 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_22E7F3560();
  (*(void (**)(char *, uint64_t, uint64_t))(v1 + 16))(v3, v4, v0);
  v5 = sub_22E7F3570();
  os_log_type_t v6 = sub_22E7F4010();
  if (os_log_type_enabled(v5, v6))
  {
    id v7 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)id v7 = 0;
    _os_log_impl(&dword_22E7A0000, v5, v6, "PASUICDPEnrollmentObserver uiController(_:didPresentRootViewController:)", v7, 2u);
    MEMORY[0x230FA4830](v7, -1, -1);
  }

  return (*(uint64_t (**)(char *, uint64_t))(v1 + 8))(v3, v0);
}

@end