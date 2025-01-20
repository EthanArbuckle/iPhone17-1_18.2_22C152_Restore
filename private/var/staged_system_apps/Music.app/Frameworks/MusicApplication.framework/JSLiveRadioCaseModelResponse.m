@interface JSLiveRadioCaseModelResponse
- (BOOL)hasVideoArtwork;
- (BOOL)hasVideoArtworkAt:(id)a3;
- (_TtC16MusicApplication28JSLiveRadioCaseModelResponse)initWithRequest:(id)a3;
- (id)newOperationForDetailedKeepLocalStatusConfigurationForSectionAtIndex:(int64_t)a3 responseHandler:(id)a4;
- (void)getChangeDetailsFromPreviousResponse:(id)a3 completion:(id)a4;
@end

@implementation JSLiveRadioCaseModelResponse

- (id)newOperationForDetailedKeepLocalStatusConfigurationForSectionAtIndex:(int64_t)a3 responseHandler:(id)a4
{
  v6 = _Block_copy(a4);
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = v6;
  v8 = *(void **)&self->MPModelResponse_opaque[OBJC_IVAR____TtC16MusicApplication28JSLiveRadioCaseModelResponse_personalizationResponse];
  v13[4] = sub_B6D6C;
  v13[5] = v7;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 1107296256;
  v13[2] = sub_E8D28;
  v13[3] = &block_descriptor_27_2;
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
    *(void *)(swift_allocObject() + 16) = v6;
    v6 = (void (*)(id))sub_C30F0;
  }
  id v7 = a3;
  v8 = self;
  sub_24AAFC(a3, v6);
  sub_1A528((uint64_t)v6);
}

- (_TtC16MusicApplication28JSLiveRadioCaseModelResponse)initWithRequest:(id)a3
{
  id v3 = a3;
  result = (_TtC16MusicApplication28JSLiveRadioCaseModelResponse *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  swift_release();
  id v3 = *(void **)&self->MPModelResponse_opaque[OBJC_IVAR____TtC16MusicApplication28JSLiveRadioCaseModelResponse_personalizationResponse];
}

- (BOOL)hasVideoArtwork
{
  v2 = self;
  char v3 = sub_3BE788();

  return v3 & 1;
}

- (BOOL)hasVideoArtworkAt:(id)a3
{
  uint64_t v5 = sub_AB1110();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  v8 = (char *)&v13 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_AB1080();
  id v9 = a3;
  v10 = self;
  char v11 = sub_3BE9B4();

  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  return v11 & 1;
}

@end