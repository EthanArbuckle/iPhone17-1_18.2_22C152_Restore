@interface MTMediaItemMetadataLoader
- (MTMediaItemMetadataLoader)init;
- (void)keyIdentifiersFrom:(id)a3 completion:(id)a4;
@end

@implementation MTMediaItemMetadataLoader

- (MTMediaItemMetadataLoader)init
{
  return (MTMediaItemMetadataLoader *)MediaItemMetadataLoader.init()();
}

- (void)keyIdentifiersFrom:(id)a3 completion:(id)a4
{
  v6 = _Block_copy(a4);
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = v6;
  id v8 = a3;
  v9 = self;
  sub_1ACADCA00(v8, (uint64_t)sub_1ACADDDC4, v7);

  swift_release();
}

- (void).cxx_destruct
{
}

@end