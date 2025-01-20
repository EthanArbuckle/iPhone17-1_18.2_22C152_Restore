@interface CRLSEExtensionContextManager
+ (NSString)defaultImageFileName;
- (NSOperationQueue)presentedItemOperationQueue;
- (NSURL)presentedItemURL;
- (_TtC24FreeformSharingExtension28CRLSEExtensionContextManager)init;
- (void)setPresentedItemOperationQueue:(id)a3;
- (void)setPresentedItemURL:(id)a3;
@end

@implementation CRLSEExtensionContextManager

+ (NSString)defaultImageFileName
{
  id v2 = [self mainBundle];
  NSString v3 = sub_10005C7D0();
  NSString v4 = sub_10005C7D0();
  id v5 = [v2 localizedStringForKey:v3 value:v4 table:0];

  sub_10005C810();
  NSString v6 = sub_10005C7D0();
  swift_bridgeObjectRelease();

  return (NSString *)v6;
}

- (NSURL)presentedItemURL
{
  uint64_t v3 = sub_1000131E0(&qword_10007D0E8);
  __chkstk_darwin(v3 - 8);
  id v5 = (char *)&v13 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  NSString v6 = (char *)self + OBJC_IVAR____TtC24FreeformSharingExtension28CRLSEExtensionContextManager_presentedItemURL;
  swift_beginAccess();
  sub_10001E85C((uint64_t)v6, (uint64_t)v5, &qword_10007D0E8);
  uint64_t v7 = sub_10005C300();
  uint64_t v8 = *(void *)(v7 - 8);
  v10 = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v5, 1, v7) != 1)
  {
    sub_10005C270(v9);
    v10 = v11;
    (*(void (**)(char *, uint64_t))(v8 + 8))(v5, v7);
  }

  return (NSURL *)v10;
}

- (void)setPresentedItemURL:(id)a3
{
  uint64_t v5 = sub_1000131E0(&qword_10007D0E8);
  __chkstk_darwin(v5 - 8);
  uint64_t v7 = (char *)&v12 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a3)
  {
    sub_10005C290();
    uint64_t v8 = sub_10005C300();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56))(v7, 0, 1, v8);
  }
  else
  {
    uint64_t v9 = sub_10005C300();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 56))(v7, 1, 1, v9);
  }
  v10 = (char *)self + OBJC_IVAR____TtC24FreeformSharingExtension28CRLSEExtensionContextManager_presentedItemURL;
  swift_beginAccess();
  v11 = self;
  sub_10003701C((uint64_t)v7, (uint64_t)v10, &qword_10007D0E8);
  swift_endAccess();
}

- (NSOperationQueue)presentedItemOperationQueue
{
  id v2 = self;
  id v3 = sub_10003D62C();

  return (NSOperationQueue *)v3;
}

- (void)setPresentedItemOperationQueue:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC24FreeformSharingExtension28CRLSEExtensionContextManager____lazy_storage___presentedItemOperationQueue);
  *(Class *)((char *)&self->super.isa
           + OBJC_IVAR____TtC24FreeformSharingExtension28CRLSEExtensionContextManager____lazy_storage___presentedItemOperationQueue) = (Class)a3;
  id v3 = a3;
}

- (_TtC24FreeformSharingExtension28CRLSEExtensionContextManager)init
{
  id v3 = (char *)self + OBJC_IVAR____TtC24FreeformSharingExtension28CRLSEExtensionContextManager_containerURL;
  uint64_t v4 = sub_10005C300();
  uint64_t v5 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56);
  v5(v3, 1, 1, v4);
  v5((char *)self + OBJC_IVAR____TtC24FreeformSharingExtension28CRLSEExtensionContextManager_importDirectoryURL, 1, 1, v4);
  v5((char *)self + OBJC_IVAR____TtC24FreeformSharingExtension28CRLSEExtensionContextManager_presentedItemURL, 1, 1, v4);
  *(Class *)((char *)&self->super.isa
           + OBJC_IVAR____TtC24FreeformSharingExtension28CRLSEExtensionContextManager____lazy_storage___presentedItemOperationQueue) = 0;
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for CRLSEExtensionContextManager();
  return [(CRLSEExtensionContextManager *)&v7 init];
}

- (void).cxx_destruct
{
  sub_10001E8C0((uint64_t)self + OBJC_IVAR____TtC24FreeformSharingExtension28CRLSEExtensionContextManager_containerURL, &qword_10007D0E8);
  sub_10001E8C0((uint64_t)self + OBJC_IVAR____TtC24FreeformSharingExtension28CRLSEExtensionContextManager_importDirectoryURL, &qword_10007D0E8);
  sub_10001E8C0((uint64_t)self + OBJC_IVAR____TtC24FreeformSharingExtension28CRLSEExtensionContextManager_presentedItemURL, &qword_10007D0E8);
  id v3 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC24FreeformSharingExtension28CRLSEExtensionContextManager____lazy_storage___presentedItemOperationQueue);
}

@end