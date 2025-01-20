@interface SavedLocationsManager
- (_TtC11WeatherCore21SavedLocationsManager)init;
- (void)dealloc;
- (void)sharedPreferencesChangedExternally;
@end

@implementation SavedLocationsManager

- (void)dealloc
{
  v2 = self;
  SavedLocationsManager.__deallocating_deinit();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC11WeatherCore21SavedLocationsManager_syncedDataManager);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC11WeatherCore21SavedLocationsManager_localKeyValueStore);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC11WeatherCore21SavedLocationsManager_keyValueStoreProvider);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC11WeatherCore21SavedLocationsManager_locationDataModelFactory);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC11WeatherCore21SavedLocationsManager_locationsReconciler);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC11WeatherCore21SavedLocationsManager_savedLocationsReader);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC11WeatherCore21SavedLocationsManager_coherenceMigrator);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC11WeatherCore21SavedLocationsManager_nanoSyncManager);
  sub_1B4961484((uint64_t)self + OBJC_IVAR____TtC11WeatherCore21SavedLocationsManager_locationMetadataManager, &qword_1EB6C1030);
  swift_bridgeObjectRelease();
  swift_release();

  swift_unknownObjectRelease();
  swift_release();
}

- (_TtC11WeatherCore21SavedLocationsManager)init
{
}

- (void)sharedPreferencesChangedExternally
{
  v2 = self;
  SavedLocationsManager.sharedPreferencesChangedExternally()();
}

@end