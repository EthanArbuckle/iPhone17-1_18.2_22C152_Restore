@interface AEAPolicyStore
- (BOOL)cleanUpPolicyStoreWithError:(id *)a3;
- (BOOL)exists;
- (BOOL)hasPersistentData;
- (id)readOnlyScratchpadForIdentifier:(id)a3;
- (id)writeOnlyScratchpadForIdentifier:(id)a3;
@end

@implementation AEAPolicyStore

- (BOOL)exists
{
  uint64_t v3 = type metadata accessor for URL();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3, v5);
  v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_100006340(self->fileSystem, *(void *)&self->fileSystem[24]);
  v9 = self;
  swift_retain();
  id v10 = [v9 assessmentAgentPolicyStoreDirectoryURL];
  static URL._unconditionallyBridgeFromObjectiveC(_:)();

  v11 = *(void **)(*v8 + 16);
  URL.path.getter();
  NSString v12 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  LOBYTE(v11) = [v11 fileExistsAtPath:v12];

  (*(void (**)(char *, uint64_t))(v4 + 8))(v7, v3);
  swift_release();
  return (char)v11;
}

- (BOOL)hasPersistentData
{
  uint64_t v3 = type metadata accessor for URL();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3, v5);
  v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100006340(self->fileSystem, *(void *)&self->fileSystem[24]);
  v8 = self;
  swift_retain();
  id v9 = [v8 assessmentAgentPolicyStoreDirectoryURL];
  static URL._unconditionallyBridgeFromObjectiveC(_:)();

  id v10 = sub_10001B3D4((uint64_t)v7);
  (*(void (**)(char *, uint64_t))(v4 + 8))(v7, v3);
  uint64_t v11 = v10[2];
  swift_release();
  swift_bridgeObjectRelease();
  return v11 != 0;
}

- (id)writeOnlyScratchpadForIdentifier:(id)a3
{
  uint64_t v3 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v5 = v4;
  swift_retain();
  uint64_t v6 = sub_10003CEB4(v3, v5);
  swift_release();
  swift_bridgeObjectRelease();

  return v6;
}

- (id)readOnlyScratchpadForIdentifier:(id)a3
{
  uint64_t v3 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v5 = v4;
  swift_retain();
  uint64_t v6 = (void *)sub_10003D228(v3, v5);
  swift_release();
  swift_bridgeObjectRelease();

  return v6;
}

- (BOOL)cleanUpPolicyStoreWithError:(id *)a3
{
  uint64_t v4 = type metadata accessor for URL();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4, v6);
  v8 = (char *)&v12 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100006340(self->fileSystem, *(void *)&self->fileSystem[24]);
  id v9 = self;
  swift_retain();
  id v10 = [v9 assessmentAgentPolicyStoreDirectoryURL];
  static URL._unconditionallyBridgeFromObjectiveC(_:)();

  sub_10001B224();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v8, v4);
  swift_release();
  return 1;
}

@end