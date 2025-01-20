@interface SearchUISportsKitUtilities
+ (BOOL)checkForSessionWithCanonicalId:(id)a3;
+ (id)sportsFollowStatusDidChangeNotificaitonName;
+ (void)createSessionWithCanonicalId:(id)a3 completionBlock:(id)a4;
+ (void)destroySessionWithCanonicalId:(id)a3 completionBlock:(id)a4;
+ (void)liveActivitiesEnabledWithCompletionBlock:(id)a3;
+ (void)registerForLiveActivityChanges;
- (_TtC8SearchUI26SearchUISportsKitUtilities)init;
@end

@implementation SearchUISportsKitUtilities

+ (void)createSessionWithCanonicalId:(id)a3 completionBlock:(id)a4
{
  uint64_t v5 = sub_1E46A5E50();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x1F4188790]();
  v8 = (char *)&v13 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = _Block_copy(a4);
  sub_1E46A6050();
  uint64_t v10 = swift_allocObject();
  *(void *)(v10 + 16) = v9;
  sub_1E46A5EC0();
  v11 = (void *)sub_1E46A5EB0();
  (*(void (**)(char *, void, uint64_t))(v6 + 104))(v8, *MEMORY[0x1E4FA5950], v5);
  uint64_t v12 = swift_allocObject();
  *(void *)(v12 + 16) = sub_1E4664444;
  *(void *)(v12 + 24) = v10;
  sub_1E46A4AB0();
  sub_1E46A5E60();

  swift_release();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  swift_bridgeObjectRelease();
  swift_release();
}

+ (BOOL)checkForSessionWithCanonicalId:(id)a3
{
  sub_1E46A6050();
  sub_1E46A5EC0();
  v3 = (void *)sub_1E46A5EB0();
  char v4 = sub_1E46A5E90();
  swift_bridgeObjectRelease();

  return v4 & 1;
}

+ (void)destroySessionWithCanonicalId:(id)a3 completionBlock:(id)a4
{
  uint64_t v5 = sub_1E46A5E50();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x1F4188790]();
  v8 = (char *)&v13 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = _Block_copy(a4);
  sub_1E46A6050();
  uint64_t v10 = swift_allocObject();
  *(void *)(v10 + 16) = v9;
  sub_1E46A5EC0();
  v11 = (void *)sub_1E46A5EB0();
  (*(void (**)(char *, void, uint64_t))(v6 + 104))(v8, *MEMORY[0x1E4FA5950], v5);
  uint64_t v12 = swift_allocObject();
  *(void *)(v12 + 16) = sub_1E466433C;
  *(void *)(v12 + 24) = v10;
  sub_1E46A4AB0();
  sub_1E46A5E70();

  swift_release();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  swift_bridgeObjectRelease();
  swift_release();
}

+ (void)liveActivitiesEnabledWithCompletionBlock:(id)a3
{
  v3 = _Block_copy(a3);
  uint64_t v4 = swift_allocObject();
  *(void *)(v4 + 16) = v3;
  sub_1E46A5EC0();
  uint64_t v5 = (void *)sub_1E46A5EB0();
  uint64_t v6 = swift_allocObject();
  *(void *)(v6 + 16) = sub_1E4664300;
  *(void *)(v6 + 24) = v4;
  sub_1E46A4AB0();
  sub_1E46A5EA0();
  swift_release();

  swift_release();
}

+ (id)sportsFollowStatusDidChangeNotificaitonName
{
  v2 = (void *)sub_1E46A6040();
  return v2;
}

- (_TtC8SearchUI26SearchUISportsKitUtilities)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for SearchUISportsKitUtilities();
  return [(SearchUISportsKitUtilities *)&v3 init];
}

+ (void)registerForLiveActivityChanges
{
  if (!qword_1EAE57FB0)
  {
    sub_1E46A5EC0();
    v0 = (void *)sub_1E46A5EB0();
    sub_1E46A5E80();

    __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE558F0);
    sub_1E466439C();
    uint64_t v1 = sub_1E46A5190();
    swift_release();
    qword_1EAE57FB0 = v1;
    swift_release();
  }
}

@end