@interface PhotosDetailsLocationSearchViewFactory
+ (id)searchViewControllerWithAssets:(id)a3 delegate:(id)a4 completion:(id)a5;
- (_TtC12PhotosUICore38PhotosDetailsLocationSearchViewFactory)init;
@end

@implementation PhotosDetailsLocationSearchViewFactory

+ (id)searchViewControllerWithAssets:(id)a3 delegate:(id)a4 completion:(id)a5
{
  v7 = _Block_copy(a5);
  if (v7)
  {
    uint64_t v8 = swift_allocObject();
    *(void *)(v8 + 16) = v7;
    v7 = sub_1A9D5E1E4;
  }
  else
  {
    uint64_t v8 = 0;
  }
  id v9 = a3;
  swift_unknownObjectRetain();
  id v10 = _s12PhotosUICore0A32DetailsLocationSearchViewFactoryC06searchF10Controller6assets8delegate10completionSo06UIViewI0CSo13PHFetchResultCySo7PHAssetCG_So08PXPhotoscdE8Delegate_pSgySbcSgtFZ_0(v9, (uint64_t)a4, (uint64_t)v7, v8);
  sub_1A9D4E2C0((uint64_t)v7);

  swift_unknownObjectRelease();
  return v10;
}

- (_TtC12PhotosUICore38PhotosDetailsLocationSearchViewFactory)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for PhotosDetailsLocationSearchViewFactory();
  return [(PhotosDetailsLocationSearchViewFactory *)&v3 init];
}

@end