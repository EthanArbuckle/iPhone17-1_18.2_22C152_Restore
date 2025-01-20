@interface TTSVBDataStore
- (_TtC31TextToSpeechVoiceBankingSupport14TTSVBDataStore)init;
- (void)handleDidResetCloudSync:(id)a3;
- (void)handleManagedObjectContextDidChange:(id)a3;
- (void)handleManagedObjectContextDidMergeChangesObjectIDs:(id)a3;
- (void)handlePersistentCloudKitContainerEventChanged:(id)a3;
- (void)handlePersistentStoreRemoteChange:(id)a3;
- (void)handleWillResetCloudSync:(id)a3;
@end

@implementation TTSVBDataStore

- (void)handleManagedObjectContextDidChange:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_25F3B0648(v4);
}

- (void)handleManagedObjectContextDidMergeChangesObjectIDs:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_25F3A8F60(v4);
}

- (void)handlePersistentCloudKitContainerEventChanged:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_25F3A9238();
}

- (void)handleWillResetCloudSync:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_25F3B0D1C(v4, " *** Will reset Cloud sync. Reason=%s");
}

- (void)handleDidResetCloudSync:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_25F3B0D1C(v4, " *** Did finish reset Cloud sync. Reason=%s");
}

- (void)handlePersistentStoreRemoteChange:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_25F3A9C4C();
}

- (_TtC31TextToSpeechVoiceBankingSupport14TTSVBDataStore)init
{
  result = (_TtC31TextToSpeechVoiceBankingSupport14TTSVBDataStore *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  v3 = (char *)self + OBJC_IVAR____TtC31TextToSpeechVoiceBankingSupport14TTSVBDataStore_voiceBankingRootURL;
  uint64_t v4 = sub_25F3F5B60();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);

  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC31TextToSpeechVoiceBankingSupport14TTSVBDataStore_calloutQueue));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_25F307B78((uint64_t)self+ OBJC_IVAR____TtC31TextToSpeechVoiceBankingSupport14TTSVBDataStore____lazy_storage___cloudDatastoreURL, &qword_26B398888);
  sub_25F307B78((uint64_t)self+ OBJC_IVAR____TtC31TextToSpeechVoiceBankingSupport14TTSVBDataStore____lazy_storage___localDatastoreURL, &qword_26B398888);
  sub_25F307B78((uint64_t)self+ OBJC_IVAR____TtC31TextToSpeechVoiceBankingSupport14TTSVBDataStore____lazy_storage___managedObjectModelURL, &qword_26B398888);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC31TextToSpeechVoiceBankingSupport14TTSVBDataStore____lazy_storage___container));
  sub_25F307B78((uint64_t)self + OBJC_IVAR____TtC31TextToSpeechVoiceBankingSupport14TTSVBDataStore_queue_loadError, &qword_26B3988B0);

  swift_bridgeObjectRelease();
}

@end