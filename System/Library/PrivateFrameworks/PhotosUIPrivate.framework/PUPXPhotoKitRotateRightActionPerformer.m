@interface PUPXPhotoKitRotateRightActionPerformer
+ (id)localizedTitleForUseCase:(unint64_t)a3 actionManager:(id)a4;
+ (id)systemImageNameForActionManager:(id)a3;
- (int64_t)rotateDirection;
@end

@implementation PUPXPhotoKitRotateRightActionPerformer

- (int64_t)rotateDirection
{
  return 1;
}

+ (id)systemImageNameForActionManager:(id)a3
{
  return @"rotate.right";
}

+ (id)localizedTitleForUseCase:(unint64_t)a3 actionManager:(id)a4
{
  return (id)PXLocalizedString();
}

@end