@interface PUPXPhotoKitRotateLeftActionPerformer
+ (id)localizedTitleForUseCase:(unint64_t)a3 actionManager:(id)a4;
+ (id)systemImageNameForActionManager:(id)a3;
- (int64_t)rotateDirection;
@end

@implementation PUPXPhotoKitRotateLeftActionPerformer

- (int64_t)rotateDirection
{
  return 0;
}

+ (id)systemImageNameForActionManager:(id)a3
{
  return @"rotate.left";
}

+ (id)localizedTitleForUseCase:(unint64_t)a3 actionManager:(id)a4
{
  return (id)PXLocalizedString();
}

@end