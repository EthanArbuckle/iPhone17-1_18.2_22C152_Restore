@interface SiriSuggestionsXPCService
- (void)disconnectForAppWithAppBundleId:(id)a3 placementId:(id)a4 completionHandler:(id)a5;
- (void)getSuggestionsForAppWithAppBundleId:(id)a3 placementId:(id)a4 entities:(id)a5 intentToSuggest:(id)a6 bridge:(id)a7 completionHandler:(id)a8;
- (void)logIntentFor:(id)a3 intent:(id)a4 completion:(id)a5;
- (void)logWithSuggestions:(id)a3 deliveryVehicle:(id)a4 generationId:(id)a5 completion:(id)a6;
- (void)refreshServiceWithCompletion:(id)a3;
- (void)submitFor:(id)a3 propertyKey:(id)a4 propertyValue:(id)a5 completion:(id)a6;
- (void)submitFor:(id)a3 stateStoreProperties:(id)a4 completion:(id)a5;
- (void)suggestNextWithRequestId:(id)a3 extraStateStoreProperties:(id)a4 completionHandler:(id)a5;
- (void)warmupWithCompletion:(id)a3;
@end

@implementation SiriSuggestionsXPCService

- (void)suggestNextWithRequestId:(id)a3 extraStateStoreProperties:(id)a4 completionHandler:(id)a5
{
}

- (void)logIntentFor:(id)a3 intent:(id)a4 completion:(id)a5
{
}

- (void)getSuggestionsForAppWithAppBundleId:(id)a3 placementId:(id)a4 entities:(id)a5 intentToSuggest:(id)a6 bridge:(id)a7 completionHandler:(id)a8
{
  v26 = _Block_copy(a8);
  uint64_t v27 = sub_1C69E1CF8();
  uint64_t v13 = v12;
  if (a4)
  {
    uint64_t v14 = sub_1C69E1CF8();
    a4 = v15;
  }
  else
  {
    uint64_t v14 = 0;
  }
  id v16 = a5;
  swift_unknownObjectRetain();
  swift_retain();
  id v17 = a6;
  uint64_t v18 = sub_1C69E0628();
  unint64_t v20 = v19;

  if (v17)
  {
    uint64_t v21 = sub_1C69E0628();
    unint64_t v23 = v22;
  }
  else
  {
    uint64_t v21 = 0;
    unint64_t v23 = 0xF000000000000000;
  }
  uint64_t v24 = swift_allocObject();
  *(void *)(v24 + 16) = v26;
  sub_1C69D2B74(v27, v13, v14, (uint64_t)a4, v18, v20, v21, v23, (uint64_t)a7, (uint64_t)sub_1C69D9E3C, v24, v25, (uint64_t)v26, v27, v28, v29, v30, v31, v32,
    v33,
    v34,
    v35);
  swift_release();
  sub_1C69A36A0(v21, v23);
  sub_1C69A36B4(v18, v20);
  swift_unknownObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (void)disconnectForAppWithAppBundleId:(id)a3 placementId:(id)a4 completionHandler:(id)a5
{
  v6 = _Block_copy(a5);
  sub_1C69E1CF8();
  if (a4) {
    sub_1C69E1CF8();
  }
  *(void *)(swift_allocObject() + 16) = v6;
  swift_retain();
  sub_1C69D4F74();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
}

- (void)refreshServiceWithCompletion:(id)a3
{
  v3 = _Block_copy(a3);
  uint64_t v4 = swift_allocObject();
  *(void *)(v4 + 16) = v3;
  swift_retain();
  sub_1C69D54B8((uint64_t)sub_1C69D9E3C, v4);
  swift_release();
  swift_release();
}

- (void)submitFor:(id)a3 stateStoreProperties:(id)a4 completion:(id)a5
{
}

- (void)submitFor:(id)a3 propertyKey:(id)a4 propertyValue:(id)a5 completion:(id)a6
{
  v7 = _Block_copy(a6);
  sub_1C69E1CF8();
  sub_1C69E1CF8();
  id v8 = a5;
  swift_retain();
  uint64_t v9 = sub_1C69E0628();
  unint64_t v11 = v10;

  *(void *)(swift_allocObject() + 16) = v7;
  sub_1C69D6B18();
  swift_release();
  sub_1C69A36B4(v9, v11);
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (void)warmupWithCompletion:(id)a3
{
  v3 = _Block_copy(a3);
  _Block_copy(v3);
  uint64_t v4 = swift_retain();
  sub_1C69D7740(v4, (void (**)(void, void))v3);
  _Block_release(v3);
  swift_release();
}

- (void)logWithSuggestions:(id)a3 deliveryVehicle:(id)a4 generationId:(id)a5 completion:(id)a6
{
  uint64_t v24 = sub_1C69E0678();
  uint64_t v10 = *(void *)(v24 - 8);
  MEMORY[0x1F4188790](v24);
  uint64_t v12 = (char *)&v23 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = _Block_copy(a6);
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  swift_retain();
  uint64_t v17 = sub_1C69E0628();
  unint64_t v19 = v18;

  uint64_t v20 = sub_1C69E0628();
  unint64_t v22 = v21;

  sub_1C69E0658();
  *(void *)(swift_allocObject() + 16) = v13;
  sub_1C69D78A0();
  swift_release();
  sub_1C69A36B4(v20, v22);
  sub_1C69A36B4(v17, v19);
  swift_release();
  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v24);
}

@end