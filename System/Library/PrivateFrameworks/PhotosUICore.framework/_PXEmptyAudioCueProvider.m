@interface _PXEmptyAudioCueProvider
- (id)requestCuesForAudioAsset:(id)a3 resultHandler:(id)a4;
@end

@implementation _PXEmptyAudioCueProvider

- (id)requestCuesForAudioAsset:(id)a3 resultHandler:(id)a4
{
  id v5 = a4;
  v6 = objc_alloc_init(PXConcreteAudioCueSource);
  (*((void (**)(id, PXConcreteAudioCueSource *, void))a4 + 2))(v5, v6, 0);

  return 0;
}

@end