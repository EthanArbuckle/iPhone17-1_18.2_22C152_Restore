@interface JSContainerDetailModelResponse
- (_TtC16MusicApplication30JSContainerDetailModelResponse)initWithRequest:(id)a3;
- (id)navigationHandlerForItemAt:(id)a3 sourceViewController:(id)a4;
- (id)newOperationForDetailedKeepLocalStatusConfigurationForSectionAtIndex:(int64_t)a3 responseHandler:(id)a4;
- (id)request;
- (id)storeItemMetadataForItemAt:(id)a3;
@end

@implementation JSContainerDetailModelResponse

- (id)request
{
  if (self->MPModelResponse_opaque[OBJC_IVAR____TtC16MusicApplication30JSContainerDetailModelResponse_useUnderlyingResponseForPlayback] == 1)
  {
    id v2 = [*(id *)&self->MPModelResponse_opaque[OBJC_IVAR____TtC16MusicApplication30JSContainerDetailModelResponse_underlyingResponse] request];
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)swift_getObjectType();
    id v2 = [(JSContainerDetailModelResponse *)&v5 request];
  }
  id v3 = v2;

  return v3;
}

- (id)newOperationForDetailedKeepLocalStatusConfigurationForSectionAtIndex:(int64_t)a3 responseHandler:(id)a4
{
  v6 = _Block_copy(a4);
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = v6;
  v8 = *(void **)&self->MPModelResponse_opaque[OBJC_IVAR____TtC16MusicApplication30JSContainerDetailModelResponse_underlyingResponse];
  v13[4] = sub_B6D6C;
  v13[5] = v7;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 1107296256;
  v13[2] = sub_E8D28;
  v13[3] = &block_descriptor_61;
  v9 = _Block_copy(v13);
  v10 = self;
  swift_retain();
  swift_release();
  id v11 = [v8 newOperationForDetailedKeepLocalStatusConfigurationForSectionAtIndex:a3 responseHandler:v9];
  _Block_release(v9);

  swift_release();
  return v11;
}

- (_TtC16MusicApplication30JSContainerDetailModelResponse)initWithRequest:(id)a3
{
  id v3 = a3;
  result = (_TtC16MusicApplication30JSContainerDetailModelResponse *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  swift_release();
  swift_release();

  id v3 = *(void **)&self->MPModelResponse_opaque[OBJC_IVAR____TtC16MusicApplication30JSContainerDetailModelResponse_storeItemMetadataResults];
}

- (id)storeItemMetadataForItemAt:(id)a3
{
  uint64_t v5 = sub_AB1110();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  v8 = (char *)&v16 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_AB1080();
  v9 = *(void **)&self->MPModelResponse_opaque[OBJC_IVAR____TtC16MusicApplication30JSContainerDetailModelResponse_storeItemMetadataResults];
  id v10 = a3;
  id v11 = self;
  Class isa = sub_AB1060().super.isa;
  id v13 = [v9 itemAtIndexPath:isa];

  self;
  v14 = (void *)swift_dynamicCastObjCClass();

  if (!v14) {
    swift_unknownObjectRelease();
  }
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);

  return v14;
}

- (id)navigationHandlerForItemAt:(id)a3 sourceViewController:(id)a4
{
  uint64_t v7 = sub_AB1110();
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  id v10 = (char *)aBlock - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_AB1080();
  id v11 = a3;
  id v12 = a4;
  id v13 = self;
  v14 = sub_23B5FC((uint64_t)v10, v12);
  uint64_t v16 = v15;

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  if (v14)
  {
    aBlock[4] = v14;
    aBlock[5] = v16;
    aBlock[0] = _NSConcreteStackBlock;
    aBlock[1] = 1107296256;
    aBlock[2] = sub_1DC200;
    aBlock[3] = &block_descriptor_13_2;
    v14 = _Block_copy(aBlock);
    swift_release();
  }

  return v14;
}

@end