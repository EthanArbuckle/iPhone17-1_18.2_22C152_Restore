@interface LocationDetectionManager
- (BOOL)authorized;
- (BOOL)locationServicesEnabled;
- (CLLocation)mostFrequentLocation;
- (_TtC8NewsFeed24LocationDetectionManager)init;
- (id)observableMostFrequentLocation;
- (void)addObserver:(id)a3;
- (void)isAuthorizedWithCompletionHandler:(id)a3;
- (void)locationManagerDidChangeAuthorization:(id)a3;
- (void)removeObserver:(id)a3;
- (void)setMostFrequentLocation:(id)a3;
- (void)setObservableMostFrequentLocation:(id)a3;
@end

@implementation LocationDetectionManager

- (BOOL)authorized
{
  uint64_t v2 = qword_1EB882EE0;
  v3 = self;
  if (v2 != -1) {
    swift_once();
  }
  id v4 = (id)qword_1EB93C808;
  sub_1C151F36C();
  sub_1C15197BC();

  LODWORD(v4) = objc_msgSend(*(id *)((char *)&v3->super.isa+ OBJC_IVAR____TtC8NewsFeed24LocationDetectionManager_locationManager), sel__authorizationStatus);
  return (v4 - 3) < 2;
}

- (id)observableMostFrequentLocation
{
  uint64_t v2 = (id *)((char *)&self->super.isa
            + OBJC_IVAR____TtC8NewsFeed24LocationDetectionManager_observableMostFrequentLocation);
  swift_beginAccess();
  return *v2;
}

- (void)locationManagerDidChangeAuthorization:(id)a3
{
  id v4 = a3;
  v5 = self;
  _s8NewsFeed24LocationDetectionManagerC08locationE22DidChangeAuthorizationyySo010CLLocationE0CF_0();
}

- (CLLocation)mostFrequentLocation
{
  uint64_t v2 = self;
  swift_retain();
  sub_1C1518EBC();

  swift_release();
  return (CLLocation *)v4;
}

- (void)addObserver:(id)a3
{
  swift_unknownObjectRetain();
  id v4 = self;
  LocationDetectionManager.addObserver(_:)();
  swift_unknownObjectRelease();
}

- (_TtC8NewsFeed24LocationDetectionManager)init
{
  return (_TtC8NewsFeed24LocationDetectionManager *)LocationDetectionManager.init()();
}

- (void)setObservableMostFrequentLocation:(id)a3
{
  id v4 = (void **)((char *)&self->super.isa
               + OBJC_IVAR____TtC8NewsFeed24LocationDetectionManager_observableMostFrequentLocation);
  swift_beginAccess();
  v5 = *v4;
  *id v4 = a3;
  id v6 = a3;
}

- (void)setMostFrequentLocation:(id)a3
{
  id v4 = a3;
  v5 = self;
  swift_retain();
  sub_1C1518ECC();

  swift_release();
}

- (BOOL)locationServicesEnabled
{
  return objc_msgSend(*(id *)((char *)&self->super.isa+ OBJC_IVAR____TtC8NewsFeed24LocationDetectionManager_locationManager), sel_locationServicesAvailable);
}

- (void)removeObserver:(id)a3
{
  v5 = (uint64_t *)((char *)self + OBJC_IVAR____TtC8NewsFeed24LocationDetectionManager_observers);
  swift_beginAccess();
  swift_unknownObjectRetain();
  id v6 = self;
  unint64_t v7 = swift_bridgeObjectRetain();
  uint64_t v8 = sub_1C0D47B74(v7, (uint64_t)a3);
  swift_bridgeObjectRelease();
  uint64_t *v5 = v8;
  swift_unknownObjectRelease();

  swift_bridgeObjectRelease();
}

- (void)isAuthorizedWithCompletionHandler:(id)a3
{
  sub_1C0091510(0, &qword_1EB882700, MEMORY[0x1E4FBCFE8], MEMORY[0x1E4FBB718]);
  MEMORY[0x1F4188790](v5 - 8);
  unint64_t v7 = (char *)&v14 - v6;
  uint64_t v8 = _Block_copy(a3);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  *(void *)(v9 + 24) = self;
  uint64_t v10 = sub_1C151EE9C();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v7, 1, 1, v10);
  v11 = (void *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_1EA1A6930;
  v11[5] = v9;
  v12 = (void *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_1EA1A6940;
  v12[5] = v11;
  v13 = self;
  sub_1C0D478DC((uint64_t)v7, (uint64_t)&unk_1EA1A6950, (uint64_t)v12);
  swift_release();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();

  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC8NewsFeed24LocationDetectionManager_observableMostFrequentLocation));
  swift_release();
  uint64_t v3 = *(uint64_t *)((char *)&self->super.isa
                  + OBJC_IVAR____TtC8NewsFeed24LocationDetectionManager_onUserInteractedWithLocationAuthorizationTCC);
  sub_1BFC3E5C0(v3);
}

@end