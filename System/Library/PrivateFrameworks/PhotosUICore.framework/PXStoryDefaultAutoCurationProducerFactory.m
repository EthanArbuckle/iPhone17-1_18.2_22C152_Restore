@interface PXStoryDefaultAutoCurationProducerFactory
- (id)autoCurationProducerForConfiguration:(id)a3;
@end

@implementation PXStoryDefaultAutoCurationProducerFactory

- (id)autoCurationProducerForConfiguration:(id)a3
{
  id v3 = a3;
  v4 = [v3 autoCurationProducer];
  if (!v4)
  {
    v5 = [PXStoryDefaultAutoCurationProducer alloc];
    v6 = [v3 originalCurationContext];
    v4 = [(PXStoryDefaultAutoCurationProducer *)v5 initWithCurationContext:v6];

    if (!v4)
    {
      v7 = [v3 assetCollection];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v4 = [[PXStoryMemoryAutoCurationProducer alloc] initWithMemory:v7];

        if (v4) {
          goto LABEL_8;
        }
      }
      else
      {
      }
      v4 = objc_alloc_init(PXStoryPassthroughAutoCurationProducer);
      v8 = [v3 assets];
      [(PXStoryMemoryAutoCurationProducer *)v4 setAssets:v8];
    }
  }
LABEL_8:

  return v4;
}

@end