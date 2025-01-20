@interface MFNanoServerFullMessageLoader2
- (MFNanoServerFullMessageLoader2)init;
- (MFNanoServerFullMessageLoader2)initWithCallbackQueue:(id)a3 mailMessageLibrary:(id)a4 legacyLoader:(id)a5;
- (void)attemptToCancelFullMessageLoadForMessageIds:(id)a3;
- (void)cancelAllPendingOperations;
- (void)loadFullMessagesForMessageIds:(id)a3 completion:(id)a4;
- (void)start;
@end

@implementation MFNanoServerFullMessageLoader2

- (void).cxx_destruct
{
}

- (MFNanoServerFullMessageLoader2)initWithCallbackQueue:(id)a3 mailMessageLibrary:(id)a4 legacyLoader:(id)a5
{
  swift_getObjectType();
  id v5 = a3;
  id v6 = a4;
  swift_unknownObjectRetain();
  return (MFNanoServerFullMessageLoader2 *)sub_1A833FA10(a3, a4, (uint64_t)a5);
}

- (void)loadFullMessagesForMessageIds:(id)a3 completion:(id)a4
{
  swift_getObjectType();
  id v5 = a3;
  v8 = _Block_copy(a4);
  id v6 = self;
  uint64_t v10 = sub_1A8A76C68();
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  sub_1A833FBF8(v10, (uint64_t)sub_1A8343D24, v9);
  swift_release();
  swift_bridgeObjectRelease();
}

- (void)attemptToCancelFullMessageLoadForMessageIds:(id)a3
{
  swift_getObjectType();
  id v4 = a3;
  id v5 = self;
  uint64_t v6 = sub_1A8A76C68();
  sub_1A8341C98(v6);
  swift_bridgeObjectRelease();
}

- (void)cancelAllPendingOperations
{
  swift_getObjectType();
  v3 = self;
  sub_1A8342A4C();
}

- (void)start
{
  swift_getObjectType();
  v3 = self;
  sub_1A8343790();
}

- (MFNanoServerFullMessageLoader2)init
{
  return (MFNanoServerFullMessageLoader2 *)MFNanoServerFullMessageLoader2.init()();
}

@end