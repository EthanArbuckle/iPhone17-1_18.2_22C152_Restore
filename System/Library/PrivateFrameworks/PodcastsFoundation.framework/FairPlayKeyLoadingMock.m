@interface FairPlayKeyLoadingMock
- (void)createSessionWithAsset:(id)a3 completion:(id)a4;
- (void)renewKeyRequestWithAsset:(id)a3 completion:(id)a4;
- (void)renewKeyRequestsWithAssets:(id)a3 completion:(id)a4;
- (void)renewKeyWithSession:(id)a3;
- (void)startKeyRequestWithSession:(id)a3 completion:(id)a4;
- (void)stopKeyRequestWithAsset:(id)a3 completion:(id)a4;
- (void)stopKeyRequestWithSession:(id)a3 completion:(id)a4;
@end

@implementation FairPlayKeyLoadingMock

- (void)createSessionWithAsset:(id)a3 completion:(id)a4
{
  v5 = _Block_copy(a4);
  if (v5)
  {
    v6 = v5;
    uint64_t v7 = swift_allocObject();
    *(void *)(v7 + 16) = v6;
    v8 = sub_1ACA50AB0;
  }
  else
  {
    v8 = 0;
    uint64_t v7 = 0;
  }
  v9 = *(void (**)(id, void (*)(uint64_t, uint64_t), uint64_t))self->createSessionHandler;
  if (v9)
  {
    id v10 = a3;
    swift_retain();
    v9(v10, v8, v7);
  }
  else
  {
    id v11 = a3;
    swift_retain();
  }
  sub_1ACA76F34((uint64_t)v8);
  swift_release();
}

- (void)startKeyRequestWithSession:(id)a3 completion:(id)a4
{
  v6 = _Block_copy(a4);
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = swift_allocObject();
    *(void *)(v8 + 16) = v7;
    v9 = sub_1ACA83FF0;
    id v10 = *(void (**)(id, void (*)(uint64_t), uint64_t))self->startKeyRequestHandler;
    if (v10)
    {
LABEL_3:
      swift_unknownObjectRetain();
      swift_retain();
      v10(a3, v9, v8);
      goto LABEL_6;
    }
  }
  else
  {
    v9 = 0;
    uint64_t v8 = 0;
    id v10 = *(void (**)(id, void (*)(uint64_t), uint64_t))self->startKeyRequestHandler;
    if (v10) {
      goto LABEL_3;
    }
  }
  swift_unknownObjectRetain();
  swift_retain();
LABEL_6:
  sub_1ACA76F34((uint64_t)v9);
  swift_release();
  swift_unknownObjectRelease();
}

- (void)renewKeyRequestWithAsset:(id)a3 completion:(id)a4
{
  v5 = _Block_copy(a4);
  if (v5)
  {
    v6 = v5;
    uint64_t v7 = swift_allocObject();
    *(void *)(v7 + 16) = v6;
    uint64_t v8 = sub_1ACA83FF0;
  }
  else
  {
    uint64_t v8 = 0;
    uint64_t v7 = 0;
  }
  v9 = *(void (**)(id, void (*)(uint64_t), uint64_t))self->renewKeyRequestHandler;
  if (v9)
  {
    id v10 = a3;
    swift_retain();
    v9(v10, v8, v7);
  }
  else
  {
    id v11 = a3;
    swift_retain();
  }
  sub_1ACA76F34((uint64_t)v8);
  swift_release();
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
    uint64_t v8 = sub_1ACA83FE8;
    v9 = *(void (**)(uint64_t, void (*)(uint64_t, uint64_t), uint64_t))self->renewKeyRequestsHandler;
    if (v9)
    {
LABEL_3:
      swift_retain();
      v9(v6, v8, v7);
      goto LABEL_6;
    }
  }
  else
  {
    uint64_t v8 = 0;
    uint64_t v7 = 0;
    v9 = *(void (**)(uint64_t, void (*)(uint64_t, uint64_t), uint64_t))self->renewKeyRequestsHandler;
    if (v9) {
      goto LABEL_3;
    }
  }
  swift_retain();
LABEL_6:
  sub_1ACA76F34((uint64_t)v8);
  swift_bridgeObjectRelease();
  swift_release();
}

- (void)renewKeyWithSession:(id)a3
{
  v3 = *(void (**)(id))self->renewKeyHandler;
  if (v3)
  {
    swift_unknownObjectRetain();
    swift_retain();
    v3(a3);
    swift_unknownObjectRelease();
    swift_release();
  }
}

- (void)stopKeyRequestWithAsset:(id)a3 completion:(id)a4
{
  v5 = _Block_copy(a4);
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = swift_allocObject();
    *(void *)(v7 + 16) = v6;
    uint64_t v8 = sub_1ACA83FF0;
  }
  else
  {
    uint64_t v8 = 0;
    uint64_t v7 = 0;
  }
  v9 = *(void (**)(id, void (*)(uint64_t), uint64_t))self->stopKeyRequestAssetHandler;
  if (v9)
  {
    id v10 = a3;
    swift_retain();
    v9(v10, v8, v7);
  }
  else
  {
    id v11 = a3;
    swift_retain();
  }
  sub_1ACA76F34((uint64_t)v8);
  swift_release();
}

- (void)stopKeyRequestWithSession:(id)a3 completion:(id)a4
{
  uint64_t v6 = _Block_copy(a4);
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = swift_allocObject();
    *(void *)(v8 + 16) = v7;
    v9 = sub_1ACA3A598;
    id v10 = *(void (**)(id, void (*)(uint64_t), uint64_t))self->stopKeyRequestSessionHandler;
    if (v10)
    {
LABEL_3:
      swift_unknownObjectRetain();
      swift_retain();
      v10(a3, v9, v8);
      goto LABEL_6;
    }
  }
  else
  {
    v9 = 0;
    uint64_t v8 = 0;
    id v10 = *(void (**)(id, void (*)(uint64_t), uint64_t))self->stopKeyRequestSessionHandler;
    if (v10) {
      goto LABEL_3;
    }
  }
  swift_unknownObjectRetain();
  swift_retain();
LABEL_6:
  sub_1ACA76F34((uint64_t)v9);
  swift_release();
  swift_unknownObjectRelease();
}

@end