@interface FTIDSService
+ (FTIDSService)sharedInstance;
- (BOOL)sendResourceAtURL:(id)a3 metadata:(id)a4 toDestinations:(id)a5 priority:(int64_t)a6 options:(id)a7 identifier:(id *)a8 error:(id *)a9;
- (NSString)description;
- (NSString)name;
- (OS_dispatch_queue)queue;
- (_TtC18FTLivePhotoService12FTIDSService)init;
- (_TtP18FTLivePhotoService24FTIDSServiceDependencies_)idsService;
- (void)addServiceDelegate:(id)a3 queue:(id)a4;
- (void)donateWithDestination:(NSString *)a3 completionHandler:(id)a4;
- (void)setIdsService:(id)a3;
- (void)setName:(id)a3;
- (void)setQueue:(id)a3;
@end

@implementation FTIDSService

+ (FTIDSService)sharedInstance
{
}

- (NSString)description
{
  v2 = self;
  sub_100028B30();

  NSString v3 = sub_10003CFB0();
  swift_bridgeObjectRelease();

  return (NSString *)v3;
}

- (_TtP18FTLivePhotoService24FTIDSServiceDependencies_)idsService
{
  v2 = (void *)sub_100026FC8();

  return (_TtP18FTLivePhotoService24FTIDSServiceDependencies_ *)v2;
}

- (void)setIdsService:(id)a3
{
  swift_unknownObjectRetain();
  v5 = self;
  sub_100026FD8((uint64_t)a3);
}

- (NSString)name
{
  sub_100026FF0();
  NSString v2 = sub_10003CFB0();
  swift_bridgeObjectRelease();

  return (NSString *)v2;
}

- (void)setName:(id)a3
{
  uint64_t v4 = sub_10003CFC0();
  uint64_t v6 = v5;
  v7 = self;
  sub_10002702C(v4, v6);
}

- (OS_dispatch_queue)queue
{
  id v2 = sub_100027048();

  return (OS_dispatch_queue *)v2;
}

- (void)setQueue:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  sub_100027058((uint64_t)v4);
}

- (BOOL)sendResourceAtURL:(id)a3 metadata:(id)a4 toDestinations:(id)a5 priority:(int64_t)a6 options:(id)a7 identifier:(id *)a8 error:(id *)a9
{
  int64_t v21 = a6;
  uint64_t v22 = sub_10003CD40();
  uint64_t v12 = *(void *)(v22 - 8);
  __chkstk_darwin(v22);
  v14 = (char *)&v20 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10003CD00();
  uint64_t v15 = sub_10003CF70();
  uint64_t v16 = sub_10003D0B0();
  if (a7) {
    a7 = (id)sub_10003CF70();
  }
  uint64_t v17 = v21;
  v18 = self;
  sub_10002706C((uint64_t)v14, v15, v16, v17, (Class)a7, (uint64_t)a8);
  (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v22);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  return 1;
}

- (void)addServiceDelegate:(id)a3 queue:(id)a4
{
  swift_getObjectType();
  swift_unknownObjectRetain();
  id v7 = a4;
  v8 = self;
  sub_10002AB98((uint64_t)a3, (uint64_t)v7, (uint64_t)v8);
  swift_unknownObjectRelease();
}

- (void)donateWithDestination:(NSString *)a3 completionHandler:(id)a4
{
}

- (_TtC18FTLivePhotoService12FTIDSService)init
{
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  NSString v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC18FTLivePhotoService12FTIDSService_queue);
}

@end