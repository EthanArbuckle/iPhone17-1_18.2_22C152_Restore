@interface AEAPolicyActivationRunner
- (id)deactivationForScratchpad:(id)a3;
- (id)identifier;
- (uint64_t)event;
- (void)activateWithScratchpad:(id)a3 invalidationHandler:(id)a4 completion:(id)a5;
@end

@implementation AEAPolicyActivationRunner

- (id)deactivationForScratchpad:(id)a3
{
  swift_unknownObjectRetain();
  swift_retain();
  v3 = (void *)sub_100044D28();
  swift_unknownObjectRelease();
  swift_release();

  return v3;
}

- (void)activateWithScratchpad:(id)a3 invalidationHandler:(id)a4 completion:(id)a5
{
  v7 = _Block_copy(a4);
  v8 = _Block_copy(a5);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v7;
  uint64_t v10 = swift_allocObject();
  *(void *)(v10 + 16) = v8;
  swift_unknownObjectRetain();
  swift_retain();
  sub_100044E94((uint64_t)a3, (uint64_t)sub_1000468BC, v9, (uint64_t)sub_100046914, v10);
  swift_unknownObjectRelease();
  swift_release();
  swift_release();

  swift_release();
}

- (id)identifier
{
  uint64_t v1 = a1[5];
  uint64_t v2 = a1[6];
  sub_100006340(a1 + 2, v1);
  uint64_t v3 = *(void *)(v2 + 8);
  v4 = *(void (**)(uint64_t, uint64_t))(v3 + 8);
  swift_retain();
  v4(v1, v3);
  swift_release();
  NSString v5 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();

  return v5;
}

- (uint64_t)event
{
  uint64_t v1 = a1[5];
  uint64_t v2 = a1[6];
  sub_100006340(a1 + 2, v1);
  uint64_t v3 = *(void *)(v2 + 8);
  v4 = *(uint64_t (**)(uint64_t, uint64_t))(v3 + 16);
  swift_retain();
  uint64_t v5 = v4(v1, v3);
  swift_release();
  return v5;
}

@end