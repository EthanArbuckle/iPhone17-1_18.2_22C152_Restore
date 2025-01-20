@interface PlaylistModelResponse
- (_TtC16MusicApplication21PlaylistModelResponse)initWithRequest:(id)a3;
- (id)navigationHandlerForItemAt:(id)a3 sourceViewController:(id)a4;
- (id)newOperationForDetailedKeepLocalStatusConfigurationForSectionAtIndex:(int64_t)a3 responseHandler:(id)a4;
- (id)results;
- (void)getChangeDetailsFromPreviousResponse:(id)a3 completion:(id)a4;
- (void)setResults:(id)a3;
@end

@implementation PlaylistModelResponse

- (id)results
{
  id v2 = [*(id *)&self->MPModelResponse_opaque[OBJC_IVAR____TtC16MusicApplication21PlaylistModelResponse_underlyingModelResponse] results];

  return v2;
}

- (void)setResults:(id)a3
{
}

- (void)getChangeDetailsFromPreviousResponse:(id)a3 completion:(id)a4
{
  v6 = _Block_copy(a4);
  if (v6)
  {
    uint64_t v7 = swift_allocObject();
    *(void *)(v7 + 16) = v6;
    v6 = sub_C30F0;
  }
  else
  {
    uint64_t v7 = 0;
  }
  id v8 = a3;
  v9 = self;
  sub_C281C(a3, (uint64_t)v6, v7);
  sub_1A528((uint64_t)v6);
}

- (id)newOperationForDetailedKeepLocalStatusConfigurationForSectionAtIndex:(int64_t)a3 responseHandler:(id)a4
{
  v6 = _Block_copy(a4);
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = v6;
  id v8 = self;
  id v9 = sub_C2CBC(a3, (uint64_t (*)())sub_B6D6C, v7);

  swift_release();
  return v9;
}

- (_TtC16MusicApplication21PlaylistModelResponse)initWithRequest:(id)a3
{
  id v3 = a3;
  result = (_TtC16MusicApplication21PlaylistModelResponse *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
}

- (id)navigationHandlerForItemAt:(id)a3 sourceViewController:(id)a4
{
  uint64_t v7 = sub_AB1110();
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&aBlock[-1] - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_AB1080();
  aBlock[6] = &OBJC_PROTOCOL____TtP16MusicApplication40ContainerDetailAlbumNavigationHandleable_;
  v11 = (void *)swift_dynamicCastObjCProtocolConditional();
  id v12 = a3;
  if (v11)
  {
    id v13 = a4;
    v14 = self;
    Class isa = sub_AB1060().super.isa;
    id v16 = [v11 navigationHandlerForItemAt:isa sourceViewController:v13];

    if (v16)
    {
      uint64_t v17 = swift_allocObject();
      *(void *)(v17 + 16) = v16;

      (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
      aBlock[4] = sub_23C34C;
      aBlock[5] = v17;
      aBlock[0] = _NSConcreteStackBlock;
      aBlock[1] = 1107296256;
      aBlock[2] = sub_1DC200;
      aBlock[3] = &block_descriptor_73;
      v18 = _Block_copy(aBlock);
      swift_release();
      goto LABEL_6;
    }
  }
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);

  v18 = 0;
LABEL_6:

  return v18;
}

@end