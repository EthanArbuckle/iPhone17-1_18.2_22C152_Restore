@interface PFDispatchingFairPlayKeyLoader
+ (id)receiveOn:(id)a3 loader:(id)a4;
- (PFDispatchingFairPlayKeyLoader)init;
- (void)createSessionWithAsset:(id)a3 completion:(id)a4;
- (void)renewKeyRequestWithAsset:(id)a3 completion:(id)a4;
- (void)renewKeyRequestsWithAssets:(id)a3 completion:(id)a4;
- (void)renewKeyWithSession:(id)a3;
- (void)startKeyRequestWithSession:(id)a3 completion:(id)a4;
- (void)stopKeyRequestWithAsset:(id)a3 completion:(id)a4;
- (void)stopKeyRequestWithSession:(id)a3 completion:(id)a4;
@end

@implementation PFDispatchingFairPlayKeyLoader

+ (id)receiveOn:(id)a3 loader:(id)a4
{
  ObjCClassMetadata = (objc_class *)swift_getObjCClassMetadata();
  v7 = (char *)objc_allocWithZone(ObjCClassMetadata);
  *(void *)&v7[OBJC_IVAR___PFDispatchingFairPlayKeyLoader_wrappedInstance] = a4;
  *(void *)&v7[OBJC_IVAR___PFDispatchingFairPlayKeyLoader_responseQueue] = a3;
  v11.receiver = v7;
  v11.super_class = ObjCClassMetadata;
  id v8 = a3;
  swift_unknownObjectRetain();
  id v9 = objc_msgSendSuper2(&v11, sel_init);
  return v9;
}

- (void)createSessionWithAsset:(id)a3 completion:(id)a4
{
  v6 = _Block_copy(a4);
  if (v6)
  {
    uint64_t v7 = swift_allocObject();
    *(void *)(v7 + 16) = v6;
    v6 = sub_1ACA50AB0;
  }
  else
  {
    uint64_t v7 = 0;
  }
  id v8 = a3;
  id v9 = self;
  DispatchingFairPlayKeyLoading.createSession(asset:completion:)((uint64_t)v8, (uint64_t)v6, v7);
  sub_1ACA76F34((uint64_t)v6);
}

- (void)startKeyRequestWithSession:(id)a3 completion:(id)a4
{
  v6 = _Block_copy(a4);
  if (v6)
  {
    uint64_t v7 = swift_allocObject();
    *(void *)(v7 + 16) = v6;
    v6 = sub_1ACA83FF0;
  }
  else
  {
    uint64_t v7 = 0;
  }
  swift_unknownObjectRetain();
  id v8 = self;
  DispatchingFairPlayKeyLoading.startKeyRequest(session:completion:)((uint64_t)a3, (uint64_t)v6, v7);
  sub_1ACA76F34((uint64_t)v6);
  swift_unknownObjectRelease();
}

- (void)renewKeyRequestWithAsset:(id)a3 completion:(id)a4
{
  v6 = _Block_copy(a4);
  if (v6)
  {
    uint64_t v7 = swift_allocObject();
    *(void *)(v7 + 16) = v6;
    v6 = sub_1ACA83FF0;
  }
  else
  {
    uint64_t v7 = 0;
  }
  id v8 = a3;
  id v9 = self;
  DispatchingFairPlayKeyLoading.renewKeyRequest(asset:completion:)((uint64_t)v8, (uint64_t)v6, v7);
  sub_1ACA76F34((uint64_t)v6);
}

- (void)renewKeyRequestsWithAssets:(id)a3 completion:(id)a4
{
  v5 = _Block_copy(a4);
  type metadata accessor for FairPlayAsset();
  uint64_t v6 = sub_1ACE76578();
  if (v5)
  {
    uint64_t v7 = swift_allocObject();
    *(void *)(v7 + 16) = v5;
    v5 = sub_1ACA83FE8;
  }
  else
  {
    uint64_t v7 = 0;
  }
  id v8 = self;
  DispatchingFairPlayKeyLoading.renewKeyRequests(assets:completion:)(v6, (uint64_t)v5, v7);
  sub_1ACA76F34((uint64_t)v5);

  swift_bridgeObjectRelease();
}

- (void)renewKeyWithSession:(id)a3
{
}

- (void)stopKeyRequestWithAsset:(id)a3 completion:(id)a4
{
  uint64_t v6 = _Block_copy(a4);
  if (v6)
  {
    uint64_t v7 = swift_allocObject();
    *(void *)(v7 + 16) = v6;
    uint64_t v6 = sub_1ACA83FF0;
  }
  else
  {
    uint64_t v7 = 0;
  }
  id v8 = a3;
  id v9 = self;
  DispatchingFairPlayKeyLoading.stopKeyRequest(asset:completion:)((uint64_t)v8, (uint64_t)v6, v7);
  sub_1ACA76F34((uint64_t)v6);
}

- (void)stopKeyRequestWithSession:(id)a3 completion:(id)a4
{
  uint64_t v6 = _Block_copy(a4);
  if (v6)
  {
    uint64_t v7 = swift_allocObject();
    *(void *)(v7 + 16) = v6;
    uint64_t v6 = sub_1ACA3A598;
  }
  else
  {
    uint64_t v7 = 0;
  }
  swift_unknownObjectRetain();
  id v8 = self;
  DispatchingFairPlayKeyLoading.stopKeyRequest(session:completion:)((uint64_t)a3, (uint64_t)v6, v7);
  sub_1ACA76F34((uint64_t)v6);
  swift_unknownObjectRelease();
}

- (PFDispatchingFairPlayKeyLoader)init
{
  result = (PFDispatchingFairPlayKeyLoader *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___PFDispatchingFairPlayKeyLoader_responseQueue);
}

@end