@interface MediaMoments
- (_TtC18FTLivePhotoService12MediaMoments)init;
@end

@implementation MediaMoments

- (_TtC18FTLivePhotoService12MediaMoments)init
{
}

- (void).cxx_destruct
{
  sub_10003CDA0();
  sub_10000DA20();
  sub_10000DA30();
  v3();
  sub_10003CD40();
  sub_10000DA20();
  sub_10000DA30();
  v4();

  sub_10000CDF0(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC18FTLivePhotoService12MediaMoments_onRequestFinishedProcessing));
  uint64_t v5 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC18FTLivePhotoService12MediaMoments_onRequestError);

  sub_10000CDF0(v5);
}

@end