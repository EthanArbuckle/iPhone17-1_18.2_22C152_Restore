@interface PFFairPlayKeyLoader
- (PFFairPlayKeyLoader)init;
- (void)createSessionWithAsset:(id)a3 completion:(id)a4;
- (void)renewKeyRequestWithAsset:(id)a3 completion:(id)a4;
- (void)renewKeyRequestsWithAssets:(id)a3 completion:(id)a4;
- (void)renewKeyWithSession:(id)a3;
- (void)startKeyRequestWithSession:(id)a3 completion:(id)a4;
- (void)stopKeyRequestWithAsset:(id)a3 completion:(id)a4;
- (void)stopKeyRequestWithSession:(id)a3 completion:(id)a4;
@end

@implementation PFFairPlayKeyLoader

- (PFFairPlayKeyLoader)init
{
  ObjectType = (objc_class *)swift_getObjectType();
  id v3 = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for MediaItemMetadataLoader()), sel_init);
  type metadata accessor for FairPlayKeySessionProvider();
  uint64_t v4 = swift_allocObject();
  *(void *)(v4 + 16) = 0;
  *(void *)(v4 + 24) = 0;
  v5 = (PFFairPlayKeyLoader *)sub_1ACE636A0((uint64_t)v3, v4, (char *)objc_allocWithZone(ObjectType));

  swift_getObjectType();
  swift_deallocPartialClassInstance();
  return v5;
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
  v9 = self;
  FairPlayKeyLoader.createSession(asset:completion:)(v8, (uint64_t)v6, v7);
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
  FairPlayKeyLoader.startKeyRequest(session:completion:)((uint64_t)a3, (uint64_t)v6, v7);
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
  id v8 = (char *)a3;
  v9 = self;
  FairPlayKeyLoader.renewKeyRequest(asset:completion:)(v8, (uint64_t)v6, v7);
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
  FairPlayKeyLoader.renewKeyRequests(assets:completion:)(v6, (uint64_t)v5, v7);
  sub_1ACA76F34((uint64_t)v5);

  swift_bridgeObjectRelease();
}

- (void)renewKeyWithSession:(id)a3
{
  swift_unknownObjectRetain();
  v5 = self;
  FairPlayKeyLoader.renewKey(session:)(a3);
  swift_unknownObjectRelease();
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
  id v8 = (char *)a3;
  v9 = self;
  FairPlayKeyLoader.stopKeyRequest(asset:completion:)(v8, (uint64_t)v6, v7);
  sub_1ACA76F34((uint64_t)v6);
}

- (void)stopKeyRequestWithSession:(id)a3 completion:(id)a4
{
  uint64_t v6 = (void (*)(void))_Block_copy(a4);
  if (v6)
  {
    uint64_t v7 = swift_allocObject();
    *(void *)(v7 + 16) = v6;
    uint64_t v6 = (void (*)(void))sub_1ACA3A598;
  }
  else
  {
    uint64_t v7 = 0;
  }
  swift_unknownObjectRetain();
  id v8 = self;
  FairPlayKeyLoader.stopKeyRequest(session:completion:)(a3, v6, v7);
  sub_1ACA76F34((uint64_t)v6);
  swift_unknownObjectRelease();
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  __swift_destroy_boxed_opaque_existential_0((uint64_t)self + OBJC_IVAR___PFFairPlayKeyLoader_fairPlayKeySessionProvider);
  swift_release();

  swift_bridgeObjectRelease();
}

@end