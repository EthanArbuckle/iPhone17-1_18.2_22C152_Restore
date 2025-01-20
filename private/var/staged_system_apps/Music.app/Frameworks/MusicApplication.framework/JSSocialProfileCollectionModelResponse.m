@interface JSSocialProfileCollectionModelResponse
- (_TtC16MusicApplication38JSSocialProfileCollectionModelResponse)initWithRequest:(id)a3;
- (void)getChangeDetailsFromPreviousResponse:(id)a3 completion:(id)a4;
@end

@implementation JSSocialProfileCollectionModelResponse

- (void)getChangeDetailsFromPreviousResponse:(id)a3 completion:(id)a4
{
  v6 = (void (*)(id))_Block_copy(a4);
  if (v6)
  {
    *(void *)(swift_allocObject() + 16) = v6;
    v6 = (void (*)(id))sub_C30F0;
  }
  id v7 = a3;
  v8 = self;
  sub_105898(a3, v6);
  sub_1A528((uint64_t)v6);
}

- (_TtC16MusicApplication38JSSocialProfileCollectionModelResponse)initWithRequest:(id)a3
{
  id v3 = a3;
  result = (_TtC16MusicApplication38JSSocialProfileCollectionModelResponse *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_release();

  swift_release();
}

@end