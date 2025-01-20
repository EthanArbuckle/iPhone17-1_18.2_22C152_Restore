@interface RDDataAccessREMStoreProvider
- (BOOL)rd_isPersonIDSaltInitiallyNilError:(id)a3;
- (BOOL)rem_supportsClearingOrphanedStores;
- (id)rd_base64EncodedHMACStringFromString:(id)a3 usingPersonIDSalt:(id)a4;
- (id)rd_observePrimaryCloudKitAccountPersonIDSaltChangesOnQueue:(id)a3 successHandler:(id)a4 errorHandler:(id)a5;
- (id)rem_saveRequestForDataAccess;
- (id)rem_storeForDataAccess;
- (void)rd_unobservePrimaryCloudKitAccountPersonIDSaltChanges:(id)a3;
@end

@implementation RDDataAccessREMStoreProvider

- (id)rem_storeForDataAccess
{
  uint64_t v2 = *(void *)self->rdDaemonController;
  id v3 = objc_allocWithZone((Class)REMStore);
  swift_retain();
  id v4 = [v3 initWithDaemonController:v2];
  [v4 setMode:2];
  swift_release();

  return v4;
}

- (BOOL)rem_supportsClearingOrphanedStores
{
  return [*(id *)self->storeController supportsAccountUtils];
}

- (id)rem_saveRequestForDataAccess
{
  uint64_t v2 = *(void *)self->rdDaemonController;
  id v3 = objc_allocWithZone((Class)REMStore);
  swift_retain();
  id v4 = [v3 initWithDaemonController:v2];
  [v4 setMode:2];
  id v5 = [objc_allocWithZone((Class)REMSaveRequest) initWithStore:v4];

  [v5 setAuthor:DADREMSaveRequestAuthorKey];
  swift_release();

  return v5;
}

- (id)rd_observePrimaryCloudKitAccountPersonIDSaltChangesOnQueue:(id)a3 successHandler:(id)a4 errorHandler:(id)a5
{
  v7 = _Block_copy(a4);
  v8 = _Block_copy(a5);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v7;
  uint64_t v10 = swift_allocObject();
  *(void *)(v10 + 16) = v8;
  id v11 = a3;
  swift_retain();
  id v12 = sub_100745370((uint64_t)v11, (uint64_t)sub_100746308, v9, (uint64_t)sub_100746360, v10);

  swift_release();
  swift_release();
  swift_release();

  return v12;
}

- (void)rd_unobservePrimaryCloudKitAccountPersonIDSaltChanges:(id)a3
{
  uint64_t v4 = type metadata accessor for Logger();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for RDAccountPersonIDSaltObserver();
  uint64_t v8 = swift_dynamicCastClass();
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void **)self->storeController;
    [v10 unobservePrimaryCloudKitAccountPersonIDSaltChanges:v9];
  }
  else
  {
    uint64_t v11 = qword_100907B98;
    swift_unknownObjectRetain();
    swift_retain();
    if (v11 != -1) {
      swift_once();
    }
    uint64_t v12 = sub_10008E2DC(v4, (uint64_t)qword_100922060);
    (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, v12, v4);
    sub_1001805C0((uint64_t)_swiftEmptyArrayStorage);
    sub_1001805C0((uint64_t)_swiftEmptyArrayStorage);
    sub_10052ECB8((uint64_t)"Implementation of REMDAAccountPropertiesObserving must be actually RDAccountPersonIDSaltObserver", 96, 2);
    __break(1u);
  }
}

- (BOOL)rd_isPersonIDSaltInitiallyNilError:(id)a3
{
  sub_1000963CC(0, (unint64_t *)&qword_10090C120);
  id v4 = a3;
  swift_retain();
  uint64_t v5 = (void *)_convertErrorToNSError(_:)();
  if (qword_100907920 != -1) {
    swift_once();
  }
  char v6 = static NSObject.== infix(_:_:)();
  swift_release();

  return v6 & 1;
}

- (id)rd_base64EncodedHMACStringFromString:(id)a3 usingPersonIDSalt:(id)a4
{
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  id v5 = a4;
  swift_retain();
  uint64_t v6 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v8 = v7;

  String.base64EncodedHMACString(using:)();
  uint64_t v10 = v9;
  sub_100097F34(v6, v8);
  swift_release();
  swift_bridgeObjectRelease();
  if (v10)
  {
    NSString v11 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v11 = 0;
  }

  return v11;
}

@end