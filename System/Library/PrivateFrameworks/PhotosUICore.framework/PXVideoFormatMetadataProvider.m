@interface PXVideoFormatMetadataProvider
- (_TtC12PhotosUICore29PXVideoFormatMetadataProvider)init;
- (_TtC12PhotosUICore29PXVideoFormatMetadataProvider)initWithImageManager:(id)a3;
- (void)cancelActiveRequest;
- (void)requestVideoMetadataFor:(id)a3 processingQueue:(id)a4 callbackQueue:(id)a5 completion:(id)a6;
@end

@implementation PXVideoFormatMetadataProvider

- (_TtC12PhotosUICore29PXVideoFormatMetadataProvider)initWithImageManager:(id)a3
{
  v4 = (char *)self + OBJC_IVAR____TtC12PhotosUICore29PXVideoFormatMetadataProvider_activeRequestID;
  *(_DWORD *)v4 = 0;
  v4[4] = 1;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC12PhotosUICore29PXVideoFormatMetadataProvider_imageManager) = (Class)a3;
  *(_DWORD *)v4 = 0;
  v4[4] = 1;
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for PXVideoFormatMetadataProvider();
  id v5 = a3;
  return [(PXVideoFormatMetadataProvider *)&v7 init];
}

- (void)cancelActiveRequest
{
  if ((*((unsigned char *)&self->super.isa + OBJC_IVAR____TtC12PhotosUICore29PXVideoFormatMetadataProvider_activeRequestID + 4) & 1) == 0) {
    objc_msgSend(*(id *)((char *)&self->super.isa + OBJC_IVAR____TtC12PhotosUICore29PXVideoFormatMetadataProvider_imageManager), sel_cancelImageRequest_, *(unsigned int *)((char *)&self->super.isa+ OBJC_IVAR____TtC12PhotosUICore29PXVideoFormatMetadataProvider_activeRequestID));
  }
}

- (void)requestVideoMetadataFor:(id)a3 processingQueue:(id)a4 callbackQueue:(id)a5 completion:(id)a6
{
  v10 = _Block_copy(a6);
  uint64_t v11 = swift_allocObject();
  *(void *)(v11 + 16) = v10;
  uint64_t v12 = swift_allocObject();
  *(void *)(v12 + 16) = sub_1AA22FAD4;
  *(void *)(v12 + 24) = v11;
  v13 = *(void (**)(id, id, id, void (*)(void *, char), uint64_t))((*MEMORY[0x1E4FBC8C8] & (uint64_t)self->super.isa)
                                                                                      + 0x88);
  swift_unknownObjectRetain();
  id v14 = a4;
  id v15 = a5;
  v16 = self;
  sub_1AB22F8DC();
  v13(a3, v14, v15, sub_1AA39C79C, v12);
  swift_unknownObjectRelease();

  swift_release();
  swift_release();
}

- (_TtC12PhotosUICore29PXVideoFormatMetadataProvider)init
{
  result = (_TtC12PhotosUICore29PXVideoFormatMetadataProvider *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC12PhotosUICore29PXVideoFormatMetadataProvider_imageManager));
}

@end