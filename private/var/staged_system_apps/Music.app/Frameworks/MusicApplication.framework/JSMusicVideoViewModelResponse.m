@interface JSMusicVideoViewModelResponse
- (_TtC16MusicApplication29JSMusicVideoViewModelResponse)initWithRequest:(id)a3;
- (id)newOperationForDetailedKeepLocalStatusConfigurationForSectionAtIndex:(int64_t)a3 responseHandler:(id)a4;
@end

@implementation JSMusicVideoViewModelResponse

- (id)newOperationForDetailedKeepLocalStatusConfigurationForSectionAtIndex:(int64_t)a3 responseHandler:(id)a4
{
  v6 = _Block_copy(a4);
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = v6;
  v8 = *(void **)&self->MPModelResponse_opaque[OBJC_IVAR____TtC16MusicApplication29JSMusicVideoViewModelResponse_personalizationResponse];
  v13[4] = sub_B6D6C;
  v13[5] = v7;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 1107296256;
  v13[2] = sub_E8D28;
  v13[3] = &block_descriptor_94;
  v9 = _Block_copy(v13);
  v10 = self;
  swift_retain();
  swift_release();
  id v11 = [v8 newOperationForDetailedKeepLocalStatusConfigurationForSectionAtIndex:a3 responseHandler:v9];
  _Block_release(v9);

  swift_release();
  return v11;
}

- (_TtC16MusicApplication29JSMusicVideoViewModelResponse)initWithRequest:(id)a3
{
  id v3 = a3;
  result = (_TtC16MusicApplication29JSMusicVideoViewModelResponse *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  swift_release();
  id v3 = *(void **)&self->MPModelResponse_opaque[OBJC_IVAR____TtC16MusicApplication29JSMusicVideoViewModelResponse_personalizationResponse];
}

@end