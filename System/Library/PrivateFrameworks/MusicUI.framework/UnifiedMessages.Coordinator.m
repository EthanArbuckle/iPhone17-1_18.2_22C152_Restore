@interface UnifiedMessages.Coordinator
- (BOOL)engagementTaskViewController:(id)a3 handleDynamicDelegateAction:(id)a4 completionHandler:(id)a5;
- (BOOL)engagementViewController:(id)a3 handleDynamicDelegateAction:(id)a4 completionHandler:(id)a5;
- (_TtCO7MusicUI15UnifiedMessages11Coordinator)init;
- (void)engagement:(id)a3 didUpdateEngagementRequest:(id)a4 placement:(id)a5 serviceType:(id)a6 completion:(id)a7;
- (void)engagement:(id)a3 didUpdateRequest:(id)a4 placement:(id)a5 serviceType:(id)a6;
- (void)engagement:(id)a3 handleDialogRequest:(id)a4 completion:(id)a5;
- (void)engagement:(id)a3 handleEngagementRequest:(id)a4 completion:(id)a5;
- (void)engagementViewController:(id)a3 didResolveWithResult:(id)a4 error:(id)a5;
- (void)engagementViewControllerShouldDismiss:(id)a3;
@end

@implementation UnifiedMessages.Coordinator

- (void)engagement:(id)a3 didUpdateRequest:(id)a4 placement:(id)a5 serviceType:(id)a6
{
  sub_22A1707E0();
  sub_22A1707E0();
  id v9 = a3;
  id v10 = a4;
  v11 = self;
  sub_2299EA38C();

  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

- (void)engagement:(id)a3 didUpdateEngagementRequest:(id)a4 placement:(id)a5 serviceType:(id)a6 completion:(id)a7
{
  id v10 = _Block_copy(a7);
  uint64_t v11 = sub_22A1707E0();
  unint64_t v13 = v12;
  sub_22A1707E0();
  *(void *)(swift_allocObject() + 16) = v10;
  id v14 = a3;
  id v15 = a4;
  v16 = self;
  sub_2299E5990((uint64_t)v16, a4, v11, v13);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_release();
}

- (void)engagement:(id)a3 handleDialogRequest:(id)a4 completion:(id)a5
{
  v8 = _Block_copy(a5);
  *(void *)(swift_allocObject() + 16) = v8;
  id v9 = a3;
  id v10 = a4;
  uint64_t v11 = self;
  sub_2299EAC8C((uint64_t)v11, a4);

  swift_release();
}

- (void)engagement:(id)a3 handleEngagementRequest:(id)a4 completion:(id)a5
{
  v8 = _Block_copy(a5);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  id v10 = a3;
  id v11 = a4;
  unint64_t v12 = self;
  sub_2299EAF24((uint64_t)v12, a4, (uint64_t)sub_2299EBE94, v9);

  swift_release();
}

- (_TtCO7MusicUI15UnifiedMessages11Coordinator)init
{
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_release();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AD90678);
  OUTLINED_FUNCTION_16();
  OUTLINED_FUNCTION_6_2();
  v3();
  swift_release();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  sub_2294868C0((uint64_t)self + OBJC_IVAR____TtCO7MusicUI15UnifiedMessages11Coordinator_jsStackWillReloadObserver, (uint64_t *)&unk_26ADA7C90);
  swift_bridgeObjectRelease();
  v4 = (char *)self + OBJC_IVAR____TtCO7MusicUI15UnifiedMessages11Coordinator__pageMetrics;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AD91198);
  OUTLINED_FUNCTION_16();
  v7 = *(void (**)(char *, uint64_t))(v6 + 8);

  v7(v4, v5);
}

- (BOOL)engagementTaskViewController:(id)a3 handleDynamicDelegateAction:(id)a4 completionHandler:(id)a5
{
  v8 = _Block_copy(a5);
  _Block_copy(v8);
  id v9 = a3;
  id v10 = a4;
  id v11 = self;
  BOOL v12 = sub_229A24C0C(v9, v10, (uint64_t (*)())v11, v8);
  _Block_release(v8);

  return v12;
}

- (void)engagementViewControllerShouldDismiss:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  sub_229B63048();
}

- (void)engagementViewController:(id)a3 didResolveWithResult:(id)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v11 = a5;
  id v10 = self;
  sub_229B63230((uint64_t)v10, v9, v11);
}

- (BOOL)engagementViewController:(id)a3 handleDynamicDelegateAction:(id)a4 completionHandler:(id)a5
{
  id v8 = _Block_copy(a5);
  *(void *)(swift_allocObject() + 16) = v8;
  id v9 = a3;
  id v10 = a4;
  id v11 = self;
  sub_229B63574();

  swift_release();
  return 1;
}

@end