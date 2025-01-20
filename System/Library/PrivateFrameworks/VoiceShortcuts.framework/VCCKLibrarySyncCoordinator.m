@interface VCCKLibrarySyncCoordinator
+ (BOOL)handleSavedLibraryRecord:(id)a3 database:(id)a4 error:(id *)a5;
+ (BOOL)handleUnknownItemErrorForRecord:(id)a3 database:(id)a4 error:(id *)a5;
+ (uint64_t)handleFetchedLibraryRecord:(void *)a3 database:(void *)a4 logger:(void *)a5 error:;
- (_TtC14VoiceShortcuts26VCCKLibrarySyncCoordinator)init;
@end

@implementation VCCKLibrarySyncCoordinator

+ (BOOL)handleSavedLibraryRecord:(id)a3 database:(id)a4 error:(id *)a5
{
  id v6 = a3;
  id v7 = a4;
  sub_1C7DBB2DC((uint64_t)v6, v7);

  return 1;
}

+ (uint64_t)handleFetchedLibraryRecord:(void *)a3 database:(void *)a4 logger:(void *)a5 error:
{
  swift_getObjCClassMetadata();
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  sub_1C7DBC004((uint64_t)v8, v9, a5);

  return 1;
}

+ (BOOL)handleUnknownItemErrorForRecord:(id)a3 database:(id)a4 error:(id *)a5
{
  id v6 = a3;
  id v7 = a4;
  sub_1C7DBC16C((uint64_t)v7, v7);

  return 1;
}

- (_TtC14VoiceShortcuts26VCCKLibrarySyncCoordinator)init
{
  return (_TtC14VoiceShortcuts26VCCKLibrarySyncCoordinator *)VCCKLibrarySyncCoordinator.init()();
}

@end