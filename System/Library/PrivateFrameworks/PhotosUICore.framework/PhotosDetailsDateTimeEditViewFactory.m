@interface PhotosDetailsDateTimeEditViewFactory
+ (id)dateTimeViewControllerWithAssets:(id)a3 completion:(id)a4;
- (_TtC12PhotosUICore36PhotosDetailsDateTimeEditViewFactory)init;
@end

@implementation PhotosDetailsDateTimeEditViewFactory

+ (id)dateTimeViewControllerWithAssets:(id)a3 completion:(id)a4
{
  v5 = _Block_copy(a4);
  uint64_t v6 = swift_allocObject();
  *(void *)(v6 + 16) = v5;
  id v7 = a3;
  id v8 = _s12PhotosUICore0A30DetailsDateTimeEditViewFactoryC04dateeG10Controller6assets10completionSo06UIViewJ0CSo13PHFetchResultCySo7PHAssetCG_ySbctFZ_0(v7, (uint64_t)sub_1A9D5E1E4, v6);

  swift_release();
  return v8;
}

- (_TtC12PhotosUICore36PhotosDetailsDateTimeEditViewFactory)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for PhotosDetailsDateTimeEditViewFactory();
  return [(PhotosDetailsDateTimeEditViewFactory *)&v3 init];
}

@end