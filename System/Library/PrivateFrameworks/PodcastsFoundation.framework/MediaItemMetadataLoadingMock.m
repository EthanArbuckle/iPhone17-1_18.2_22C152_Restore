@interface MediaItemMetadataLoadingMock
- (void)keyIdentifiersFrom:(id)a3 completion:(id)a4;
@end

@implementation MediaItemMetadataLoadingMock

- (void)keyIdentifiersFrom:(id)a3 completion:(id)a4
{
  v5 = _Block_copy(a4);
  uint64_t v6 = swift_allocObject();
  *(void *)(v6 + 16) = v5;
  v7 = *(void (**)(id, void (*)(uint64_t), uint64_t))self->keyIdentifiersHandler;
  if (v7)
  {
    id v8 = a3;
    swift_retain();
    sub_1ACA6DEC8((uint64_t)v7);
    v7(v8, sub_1ACADDDC4, v6);
    sub_1ACA76F34((uint64_t)v7);
    swift_release();
  }
  else
  {
    id v9 = a3;
  }
  swift_release();
}

@end