@interface BSUIContextActionDataAssetModel
- (BSUIContextActionDataAssetModel)init;
- (BSUIContextActionDataAssetModel)initWithAdamID:(id)a3;
- (BSUIContextActionDataAssetModel)initWithLibraryAsset:(id)a3 productProfile:(id)a4;
- (BSUIContextActionDataAssetModel)initWithMResourceRawData:(id)a3;
@end

@implementation BSUIContextActionDataAssetModel

- (BSUIContextActionDataAssetModel)initWithAdamID:(id)a3
{
  uint64_t v4 = sub_2E4420();
  v5 = (char *)self + OBJC_IVAR___BSUIContextActionDataAssetModel_initType;
  *(void *)v5 = v4;
  *((void *)v5 + 1) = v6;
  v5[40] = 0;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for ContextActionDataModel.Asset();
  return [(BSUIContextActionDataAssetModel *)&v8 init];
}

- (BSUIContextActionDataAssetModel)initWithLibraryAsset:(id)a3 productProfile:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  return (BSUIContextActionDataAssetModel *)ContextActionDataModel.Asset.init(libraryAsset:productProfile:)(v5, a4);
}

- (BSUIContextActionDataAssetModel)initWithMResourceRawData:(id)a3
{
  uint64_t v3 = sub_2E4350();
  return (BSUIContextActionDataAssetModel *)ContextActionDataModel.Asset.init(mResourceRawData:)(v3);
}

- (BSUIContextActionDataAssetModel)init
{
  result = (BSUIContextActionDataAssetModel *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end