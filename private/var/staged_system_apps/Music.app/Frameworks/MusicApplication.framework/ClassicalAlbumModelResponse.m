@interface ClassicalAlbumModelResponse
- (_TtC16MusicApplication27ClassicalAlbumModelResponse)initWithRequest:(id)a3;
- (id)newOperationForDetailedKeepLocalStatusConfigurationForSectionAtIndex:(int64_t)a3 responseHandler:(id)a4;
@end

@implementation ClassicalAlbumModelResponse

- (id)newOperationForDetailedKeepLocalStatusConfigurationForSectionAtIndex:(int64_t)a3 responseHandler:(id)a4
{
  v6 = _Block_copy(a4);
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = v6;
  v8 = self;
  id v9 = sub_223C9C(a3, (uint64_t (*)())sub_B6D6C, v7);

  swift_release();
  return v9;
}

- (_TtC16MusicApplication27ClassicalAlbumModelResponse)initWithRequest:(id)a3
{
  id v3 = a3;
  result = (_TtC16MusicApplication27ClassicalAlbumModelResponse *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end