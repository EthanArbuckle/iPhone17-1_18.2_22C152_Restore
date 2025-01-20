@interface BKYearInReviewEligibilityService
- (BKYearInReviewEligibilityService)init;
- (BSUIDynamicValue)topPicksIsEligible;
- (JSValue)topPicksIsEligiblePromise;
- (NSNumber)activeYear;
- (id)isActiveEntryPoint:(id)a3;
- (id)isEligibleForEntryConditionPromise:(id)a3;
- (void)dealloc;
- (void)onConfigurationChange:(id)a3;
@end

@implementation BKYearInReviewEligibilityService

- (BKYearInReviewEligibilityService)init
{
  return (BKYearInReviewEligibilityService *)YearInReviewEligibilityService.init()();
}

- (void)dealloc
{
  ObjectType = (objc_class *)swift_getObjectType();
  v4 = self;
  v5 = self;
  id v6 = [v4 defaultCenter];
  v7 = v5;
  v8 = (void *)sub_1007FE810();
  [v6 removeObserver:v7 name:v8 object:0];

  v9.receiver = v7;
  v9.super_class = ObjectType;
  [(BKYearInReviewEligibilityService *)&v9 dealloc];
}

- (void).cxx_destruct
{
  swift_release();

  swift_release();
  swift_release();
  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___BKYearInReviewEligibilityService_topPicksObserver);
}

- (void)onConfigurationChange:(id)a3
{
  uint64_t v4 = sub_1007F25F0();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1007F25C0();
  v8 = self;
  sub_10062BFE0();

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (BSUIDynamicValue)topPicksIsEligible
{
  v2 = (Class *)((char *)&self->super.isa + OBJC_IVAR___BKYearInReviewEligibilityService_topPicksObserver);
  swift_beginAccess();
  if (*v2) {
    id v3 = *(id *)(*v2 + OBJC_IVAR____TtC5Books29TopPicksCardConditionObserver_isEligible);
  }
  else {
    id v3 = 0;
  }

  return (BSUIDynamicValue *)v3;
}

- (JSValue)topPicksIsEligiblePromise
{
  v2 = self;
  sub_10062CB8C();
  uint64_t v4 = v3;

  return (JSValue *)v4;
}

- (NSNumber)activeYear
{
  if (*(Class *)((char *)&self->super.super.isa + OBJC_IVAR___BKYearInReviewEligibilityService_eligibilityProvider))
  {
    v2 = self;
    swift_retain();
    sub_100509268();
    char v4 = v3;
    swift_release();
    if (v4) {
      v5.super.super.isa = 0;
    }
    else {
      v5.super.super.isa = sub_1007FE290().super.super.isa;
    }

    return (NSNumber *)v5.super.super.isa;
  }
  else
  {
    __break(1u);
  }
  return self;
}

- (id)isActiveEntryPoint:(id)a3
{
  id v4 = a3;
  NSNumber v5 = self;
  sub_10062D2A0(v4);
  v7 = v6;

  return v7;
}

- (id)isEligibleForEntryConditionPromise:(id)a3
{
  id v4 = a3;
  NSNumber v5 = self;
  sub_10062D4B4(v4);
  v7 = v6;

  return v7;
}

@end