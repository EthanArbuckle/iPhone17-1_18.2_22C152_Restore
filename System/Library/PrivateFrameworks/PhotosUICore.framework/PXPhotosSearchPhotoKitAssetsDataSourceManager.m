@interface PXPhotosSearchPhotoKitAssetsDataSourceManager
- (PXPhotosSearchPhotoKitAssetsDataSourceManager)initWithPhotosDataSource:(id)a3;
- (PXPhotosSearchPhotoKitAssetsDataSourceManager)initWithPhotosDataSourceProvider:(id)a3;
@end

@implementation PXPhotosSearchPhotoKitAssetsDataSourceManager

- (PXPhotosSearchPhotoKitAssetsDataSourceManager)initWithPhotosDataSource:(id)a3
{
  return (PXPhotosSearchPhotoKitAssetsDataSourceManager *)sub_1AA36C238(a3);
}

- (PXPhotosSearchPhotoKitAssetsDataSourceManager)initWithPhotosDataSourceProvider:(id)a3
{
  swift_unknownObjectRetain();
  result = (PXPhotosSearchPhotoKitAssetsDataSourceManager *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR___PXPhotosSearchPhotoKitAssetsDataSourceManager_uuidValidator));
}

@end