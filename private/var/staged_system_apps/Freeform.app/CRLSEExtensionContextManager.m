@interface CRLSEExtensionContextManager
+ (NSString)defaultImageFileName;
- (NSOperationQueue)presentedItemOperationQueue;
- (NSURL)presentedItemURL;
- (_TtC8Freeform28CRLSEExtensionContextManager)init;
- (void)setPresentedItemOperationQueue:(id)a3;
- (void)setPresentedItemURL:(id)a3;
@end

@implementation CRLSEExtensionContextManager

+ (NSString)defaultImageFileName
{
  id v2 = [self mainBundle];
  NSString v3 = String._bridgeToObjectiveC()();
  NSString v4 = String._bridgeToObjectiveC()();
  id v5 = [v2 localizedStringForKey:v3 value:v4 table:0];

  static String._unconditionallyBridgeFromObjectiveC(_:)();
  NSString v6 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();

  return (NSString *)v6;
}

- (NSURL)presentedItemURL
{
  uint64_t v3 = sub_1005057FC(&qword_101672E90);
  __chkstk_darwin(v3 - 8, v4);
  NSString v6 = (char *)&v14 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = (char *)self + OBJC_IVAR____TtC8Freeform28CRLSEExtensionContextManager_presentedItemURL;
  swift_beginAccess();
  sub_1005F7C80((uint64_t)v7, (uint64_t)v6);
  uint64_t v8 = type metadata accessor for URL();
  uint64_t v9 = *(void *)(v8 - 8);
  v11 = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v9 + 48))(v6, 1, v8) != 1)
  {
    URL._bridgeToObjectiveC()(v10);
    v11 = v12;
    (*(void (**)(char *, uint64_t))(v9 + 8))(v6, v8);
  }

  return (NSURL *)v11;
}

- (void)setPresentedItemURL:(id)a3
{
  uint64_t v5 = sub_1005057FC(&qword_101672E90);
  __chkstk_darwin(v5 - 8, v6);
  uint64_t v8 = (char *)&v13 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a3)
  {
    static URL._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v9 = type metadata accessor for URL();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v9 - 8) + 56))(v8, 0, 1, v9);
  }
  else
  {
    uint64_t v10 = type metadata accessor for URL();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v8, 1, 1, v10);
  }
  v11 = (char *)self + OBJC_IVAR____TtC8Freeform28CRLSEExtensionContextManager_presentedItemURL;
  swift_beginAccess();
  v12 = self;
  sub_100757E50((uint64_t)v8, (uint64_t)v11);
  swift_endAccess();
}

- (NSOperationQueue)presentedItemOperationQueue
{
  id v2 = self;
  id v3 = sub_100757A4C();

  return (NSOperationQueue *)v3;
}

- (void)setPresentedItemOperationQueue:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC8Freeform28CRLSEExtensionContextManager____lazy_storage___presentedItemOperationQueue);
  *(Class *)((char *)&self->super.isa
           + OBJC_IVAR____TtC8Freeform28CRLSEExtensionContextManager____lazy_storage___presentedItemOperationQueue) = (Class)a3;
  id v3 = a3;
}

- (_TtC8Freeform28CRLSEExtensionContextManager)init
{
  id v3 = (char *)self + OBJC_IVAR____TtC8Freeform28CRLSEExtensionContextManager_containerURL;
  uint64_t v4 = type metadata accessor for URL();
  uint64_t v5 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56);
  v5(v3, 1, 1, v4);
  v5((char *)self + OBJC_IVAR____TtC8Freeform28CRLSEExtensionContextManager_importDirectoryURL, 1, 1, v4);
  v5((char *)self + OBJC_IVAR____TtC8Freeform28CRLSEExtensionContextManager_presentedItemURL, 1, 1, v4);
  *(Class *)((char *)&self->super.isa
           + OBJC_IVAR____TtC8Freeform28CRLSEExtensionContextManager____lazy_storage___presentedItemOperationQueue) = 0;
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for CRLSEExtensionContextManager();
  return [(CRLSEExtensionContextManager *)&v7 init];
}

- (void).cxx_destruct
{
  sub_1005CCBB8((uint64_t)self + OBJC_IVAR____TtC8Freeform28CRLSEExtensionContextManager_containerURL);
  sub_1005CCBB8((uint64_t)self + OBJC_IVAR____TtC8Freeform28CRLSEExtensionContextManager_importDirectoryURL);
  sub_1005CCBB8((uint64_t)self + OBJC_IVAR____TtC8Freeform28CRLSEExtensionContextManager_presentedItemURL);
  id v3 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC8Freeform28CRLSEExtensionContextManager____lazy_storage___presentedItemOperationQueue);
}

@end