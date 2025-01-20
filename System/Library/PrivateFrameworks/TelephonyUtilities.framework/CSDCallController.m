@interface CSDCallController
- (CSDCallContainer)callContainer;
- (CSDCallController)init;
- (CSDCallController)initWithDataSources:(id)a3 queue:(id)a4;
- (CSDCallStateController)callStateController;
- (id)callChanged;
- (void)registerCall:(id)a3;
- (void)setCallChanged:(id)a3;
- (void)setCallStateController:(id)a3;
@end

@implementation CSDCallController

- (CSDCallStateController)callStateController
{
  v2 = (void *)sub_10027D740();

  return (CSDCallStateController *)v2;
}

- (void)setCallStateController:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_10027D7AC(a3);
}

- (id)callChanged
{
  uint64_t v2 = sub_10027D89C();
  if (v2)
  {
    v6[4] = v2;
    v6[5] = v3;
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 1107296256;
    v6[2] = sub_10027D68C;
    v6[3] = &unk_100510000;
    v4 = _Block_copy(v6);
    swift_release();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)setCallChanged:(id)a3
{
  v4 = _Block_copy(a3);
  if (v4)
  {
    uint64_t v5 = swift_allocObject();
    *(void *)(v5 + 16) = v4;
    v4 = sub_10027E488;
  }
  else
  {
    uint64_t v5 = 0;
  }
  v6 = self;
  sub_10027D984((uint64_t)v4, v5);
}

- (CSDCallContainer)callContainer
{
  uint64_t v2 = self;
  sub_10027D9E8();
  v4 = v3;

  return (CSDCallContainer *)v4;
}

- (CSDCallController)initWithDataSources:(id)a3 queue:(id)a4
{
  sub_1001F6204(0, &qword_100587018);
  uint64_t v5 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  return (CSDCallController *)sub_10027DD34(v5, a4);
}

- (void)registerCall:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  sub_10027DF4C(v4);
}

- (CSDCallController)init
{
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy();
  sub_100208490(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___CSDCallController_callChanged));
  swift_bridgeObjectRelease();

  swift_unknownObjectRelease();
}

@end