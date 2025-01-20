@interface InterestSyncStorage
+ (void)resetInterestSync;
- (_TtC8Podcasts19InterestSyncStorage)init;
@end

@implementation InterestSyncStorage

- (_TtC8Podcasts19InterestSyncStorage)init
{
  id v2 = [self sharedInstance];
  id v3 = [v2 importContext];

  v4 = (objc_class *)type metadata accessor for InterestSyncStorage();
  v5 = (char *)objc_allocWithZone(v4);
  *(void *)&v5[OBJC_IVAR____TtC8Podcasts19InterestSyncStorage_importContext] = v3;
  v8.receiver = v5;
  v8.super_class = v4;
  v6 = [(InterestSyncStorage *)&v8 init];
  swift_getObjectType();
  swift_deallocPartialClassInstance();
  return v6;
}

- (void).cxx_destruct
{
}

+ (void)resetInterestSync
{
  type metadata accessor for SyncKeysRepository();
  id v2 = (void *)static SyncKeysRepository.shared.getter();
  SyncKeysRepository.interestLastSyncTimestamp.setter();

  id v3 = (void *)static SyncKeysRepository.shared.getter();
  SyncKeysRepository.interestSyncVersion.setter();

  id v4 = (id)static SyncKeysRepository.shared.getter();
  SyncKeysRepository.isInterestSyncDirty.setter();
}

@end