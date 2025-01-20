@interface Journaling.LivePhotoAsset
- (void)dealloc;
@end

@implementation Journaling.LivePhotoAsset

- (void)dealloc
{
  if ((*((unsigned char *)&self->super.super.isa
        + OBJC_IVAR____TtCC21JournalShareExtension10Journaling14LivePhotoAsset_pendingLivePhotoRequest
        + 4) & 1) != 0)
  {
    v3 = self;
  }
  else
  {
    uint64_t v4 = *(unsigned int *)((char *)&self->super.super.isa
                         + OBJC_IVAR____TtCC21JournalShareExtension10Journaling14LivePhotoAsset_pendingLivePhotoRequest);
    v5 = self;
    v6 = self;
    [v5 cancelLivePhotoRequestWithRequestID:v4];
  }
  v7.receiver = self;
  v7.super_class = (Class)_s14LivePhotoAssetCMa(0);
  [(Journaling.Asset *)&v7 dealloc];
}

- (void).cxx_destruct
{
  swift_release();

  swift_release();
}

@end