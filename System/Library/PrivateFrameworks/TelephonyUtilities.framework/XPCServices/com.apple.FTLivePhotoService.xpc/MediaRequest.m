@interface MediaRequest
- (_TtC18FTLivePhotoService12MediaRequest)init;
@end

@implementation MediaRequest

- (_TtC18FTLivePhotoService12MediaRequest)init
{
}

- (void).cxx_destruct
{
  v3 = (char *)self + OBJC_IVAR____TtC18FTLivePhotoService12MediaRequest_uuid;
  uint64_t v4 = sub_10003CDA0();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  sub_10000D5B8((uint64_t)self + OBJC_IVAR____TtC18FTLivePhotoService12MediaRequest_request);

  sub_10000E444((uint64_t)self + OBJC_IVAR____TtC18FTLivePhotoService12MediaRequest_videoURL);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC18FTLivePhotoService12MediaRequest_remoteCaptionsMachine));

  v5 = (char *)self + OBJC_IVAR____TtC18FTLivePhotoService12MediaRequest_evalDirectoryURL;

  sub_10000E444((uint64_t)v5);
}

@end