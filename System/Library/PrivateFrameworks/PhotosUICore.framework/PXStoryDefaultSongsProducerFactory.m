@interface PXStoryDefaultSongsProducerFactory
- (id)songsProducerForConfiguration:(id)a3;
@end

@implementation PXStoryDefaultSongsProducerFactory

- (id)songsProducerForConfiguration:(id)a3
{
  id v3 = a3;
  if (([v3 options] & 2) != 0 || (objc_msgSend(v3, "isAllowedToPlayAnyMusicOrSound") & 1) == 0)
  {
    v9 = objc_alloc_init(PXStoryPassthroughSongsProducer);
  }
  else
  {
    uint64_t v4 = [v3 songsProducerKind];
    if (!v4)
    {
      v5 = +[PXStorySettings sharedInstance];
      uint64_t v4 = [v5 songsProducerKind];
    }
    uint64_t v6 = [v3 songsConfiguration];
    v7 = (void *)v6;
    switch(v4)
    {
      case 0:
        if (v6) {
          goto LABEL_7;
        }
        v12 = [v3 photoKitAssetContainer];
        if (v12)
        {
          v13 = [PXStoryDefaultSongsProducer alloc];
          v14 = [v3 musicCurationProvider];
          v9 = [(PXStoryDefaultSongsProducer *)v13 initWithAssetContainer:v12 configuration:v3 curationProvider:v14];
        }
        else
        {
          v9 = objc_alloc_init(PXStoryPassthroughSongsProducer);
        }

        break;
      case 1:
        v10 = PXStoryDummySongsProducer;
        goto LABEL_13;
      case 2:
        v10 = PXStoryDummyAppleMusicSongsProducer;
        goto LABEL_13;
      case 3:
LABEL_7:
        v8 = [[PXStoryPassthroughSongsProducer alloc] initWithSongsConfiguration:v6];
        goto LABEL_14;
      case 4:
        v10 = PXStoryExceptionThrowingSongsProducer;
LABEL_13:
        v8 = (PXStoryPassthroughSongsProducer *)objc_alloc_init(v10);
LABEL_14:
        v9 = v8;
        break;
      default:
        v9 = 0;
        break;
    }
  }
  return v9;
}

@end