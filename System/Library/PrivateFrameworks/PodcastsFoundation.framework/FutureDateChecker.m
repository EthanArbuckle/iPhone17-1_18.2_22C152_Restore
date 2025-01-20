@interface FutureDateChecker
+ (BOOL)sharedInstanceShouldAssertTestsOnly;
+ (_TtC18PodcastsFoundation17FutureDateChecker)lenientSharedInstance;
+ (_TtC18PodcastsFoundation17FutureDateChecker)sharedInstance;
+ (void)setSharedInstanceShouldAssertTestsOnly:(BOOL)a3;
- (BOOL)isFutureWithDate:(id)a3 boundBy:(id)a4;
- (BOOL)isFutureWithTimestamp:(double)a3;
- (BOOL)isFutureWithTimestamp:(double)a3 boundBy:(double)a4;
- (_TtC18PodcastsFoundation17FutureDateChecker)init;
- (double)timestamp:(double)a3 boundBy:(double)a4;
- (double)timestampBoundByNow:(double)a3;
- (double)timestampBoundByNowForDate:(id)a3;
- (double)timestampForDate:(id)a3 boundBy:(id)a4;
@end

@implementation FutureDateChecker

+ (_TtC18PodcastsFoundation17FutureDateChecker)sharedInstance
{
  return (_TtC18PodcastsFoundation17FutureDateChecker *)sub_1ACCF2524((uint64_t)a1, (uint64_t)a2, &qword_1E99F00F0, (void **)&qword_1EB7669F8);
}

+ (_TtC18PodcastsFoundation17FutureDateChecker)lenientSharedInstance
{
  return (_TtC18PodcastsFoundation17FutureDateChecker *)sub_1ACCF2524((uint64_t)a1, (uint64_t)a2, &qword_1EB767208, (void **)qword_1EB7671F8);
}

+ (BOOL)sharedInstanceShouldAssertTestsOnly
{
  if (qword_1E99F00F0 != -1) {
    swift_once();
  }
  return *(unsigned char *)(qword_1EB7669F8 + OBJC_IVAR____TtC18PodcastsFoundation17FutureDateChecker_assertOnFutures);
}

+ (void)setSharedInstanceShouldAssertTestsOnly:(BOOL)a3
{
  if (qword_1E99F00F0 != -1) {
    swift_once();
  }
  *(unsigned char *)(qword_1EB7669F8 + OBJC_IVAR____TtC18PodcastsFoundation17FutureDateChecker_assertOnFutures) = a3;
}

- (BOOL)isFutureWithTimestamp:(double)a3 boundBy:(double)a4
{
  return sub_1ACCF3124(a3, a4);
}

- (BOOL)isFutureWithTimestamp:(double)a3
{
  v4 = self;
  sub_1ACE74FC8();
  BOOL v6 = sub_1ACCF3124(a3, v5);

  return v6;
}

- (BOOL)isFutureWithDate:(id)a3 boundBy:(id)a4
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EB773140);
  MEMORY[0x1F4188790](v6 - 8);
  v8 = (char *)&v28 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v9);
  v11 = (char *)&v28 - v10;
  uint64_t v12 = sub_1ACE750A8();
  uint64_t v13 = *(void *)(v12 - 8);
  MEMORY[0x1F4188790](v12);
  v15 = (char *)&v28 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v16);
  v18 = (char *)&v28 - v17;
  sub_1ACE75078();
  if (a4)
  {
    sub_1ACE75078();
    uint64_t v19 = 0;
  }
  else
  {
    uint64_t v19 = 1;
  }
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v13 + 56))(v11, v19, 1, v12);
  sub_1ACA72A5C((uint64_t)v11, (uint64_t)v8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v13 + 48))(v8, 1, v12) == 1)
  {
    v20 = self;
    sub_1ACE75098();
    sub_1ACA3E034((uint64_t)v8);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v13 + 32))(v15, v8, v12);
    v21 = self;
  }
  sub_1ACE74FB8();
  double v23 = v22;
  sub_1ACE74FB8();
  BOOL v25 = sub_1ACCF3124(v23, v24);
  v26 = *(void (**)(char *, uint64_t))(v13 + 8);
  v26(v15, v12);

  sub_1ACA3E034((uint64_t)v11);
  v26(v18, v12);
  return v25;
}

- (double)timestamp:(double)a3 boundBy:(double)a4
{
  if (sub_1ACCF3124(a3, a4)) {
    return a4;
  }
  else {
    return a3;
  }
}

- (double)timestampForDate:(id)a3 boundBy:(id)a4
{
  uint64_t v5 = sub_1ACE750A8();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x1F4188790](v5);
  v8 = (char *)&v20 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v9);
  v11 = (char *)&v20 - v10;
  sub_1ACE75078();
  sub_1ACE75078();
  uint64_t v12 = self;
  sub_1ACE74FB8();
  double v14 = v13;
  sub_1ACE74FB8();
  double v16 = v15;
  BOOL v17 = sub_1ACCF3124(v14, v15);

  if (v17) {
    double v14 = v16;
  }
  v18 = *(void (**)(char *, uint64_t))(v6 + 8);
  v18(v8, v5);
  v18(v11, v5);
  return v14;
}

- (double)timestampBoundByNow:(double)a3
{
  v4 = self;
  sub_1ACE74FC8();
  double v6 = v5;
  BOOL v7 = sub_1ACCF3124(a3, v5);

  if (v7) {
    return v6;
  }
  else {
    return a3;
  }
}

- (double)timestampBoundByNowForDate:(id)a3
{
  uint64_t v4 = sub_1ACE750A8();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4);
  BOOL v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1ACE75078();
  v8 = self;
  sub_1ACE74FB8();
  double v10 = v9;
  sub_1ACE74FC8();
  double v12 = v11;
  LOBYTE(self) = sub_1ACCF3124(v10, v11);

  if (self) {
    double v10 = v12;
  }
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  return v10;
}

- (_TtC18PodcastsFoundation17FutureDateChecker)init
{
  result = (_TtC18PodcastsFoundation17FutureDateChecker *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end