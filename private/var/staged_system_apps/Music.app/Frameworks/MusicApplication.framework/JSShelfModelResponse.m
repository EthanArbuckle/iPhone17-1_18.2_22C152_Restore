@interface JSShelfModelResponse
- (BOOL)hasVideoArtwork;
- (BOOL)hasVideoArtworkAt:(id)a3;
- (_TtC16MusicApplication20JSShelfModelResponse)initWithRequest:(id)a3;
- (id)newOperationForDetailedKeepLocalStatusConfigurationForSectionAtIndex:(int64_t)a3 responseHandler:(id)a4;
- (void)getChangeDetailsFromPreviousResponse:(id)a3 completion:(id)a4;
@end

@implementation JSShelfModelResponse

- (id)newOperationForDetailedKeepLocalStatusConfigurationForSectionAtIndex:(int64_t)a3 responseHandler:(id)a4
{
  v6 = _Block_copy(a4);
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = v6;
  v8 = *(void **)&self->MPModelResponse_opaque[OBJC_IVAR____TtC16MusicApplication20JSShelfModelResponse_personalizationResponse];
  v13[4] = sub_B6D6C;
  v13[5] = v7;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 1107296256;
  v13[2] = sub_E8D28;
  v13[3] = &block_descriptor_27_4;
  v9 = _Block_copy(v13);
  v10 = self;
  swift_retain();
  swift_release();
  id v11 = [v8 newOperationForDetailedKeepLocalStatusConfigurationForSectionAtIndex:a3 responseHandler:v9];
  _Block_release(v9);

  swift_release();
  return v11;
}

- (void)getChangeDetailsFromPreviousResponse:(id)a3 completion:(id)a4
{
  v6 = (void (*)(id))_Block_copy(a4);
  if (v6)
  {
    uint64_t v7 = swift_allocObject();
    *(void *)(v7 + 16) = v6;
    v6 = (void (*)(id))sub_2CAB10;
  }
  else
  {
    uint64_t v7 = 0;
  }
  id v8 = a3;
  v9 = self;
  sub_2C99C8(a3, v6, v7);
  sub_1A528((uint64_t)v6);
}

- (_TtC16MusicApplication20JSShelfModelResponse)initWithRequest:(id)a3
{
  id v3 = a3;
  result = (_TtC16MusicApplication20JSShelfModelResponse *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  swift_release();
  id v3 = *(void **)&self->MPModelResponse_opaque[OBJC_IVAR____TtC16MusicApplication20JSShelfModelResponse_jsResults];
}

- (BOOL)hasVideoArtwork
{
  v2 = self;
  char v3 = sub_3BED7C();

  return v3 & 1;
}

- (BOOL)hasVideoArtworkAt:(id)a3
{
  return sub_3BEFE0((char *)self, (uint64_t)a2, a3, &OBJC_IVAR____TtC16MusicApplication20JSShelfModelResponse_jsResults, (void (*)(void))type metadata accessor for JSShelfItem);
}

@end