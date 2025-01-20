@interface PXPhotosGridHideAssetAnimationHelper
+ (id)_createDecorationAnimationsForLayout:(id)a3 scope:(int64_t)a4;
+ (id)createDecorationAnimationsForLayout:(id)a3 animationType:(int64_t)a4;
@end

@implementation PXPhotosGridHideAssetAnimationHelper

+ (id)createDecorationAnimationsForLayout:(id)a3 animationType:(int64_t)a4
{
  id v7 = a3;
  if ((unint64_t)(a4 - 1) >= 2)
  {
    if (a4)
    {
      v10 = [MEMORY[0x1E4F28B00] currentHandler];
      [v10 handleFailureInMethod:a2 object:a1 file:@"PXPhotosGridHideAssetAnimationHelper.m" lineNumber:55 description:@"Code which should be unreachable has been reached"];

      abort();
    }
    v8 = (void *)MEMORY[0x1E4F1CBF0];
  }
  else
  {
    v8 = [a1 _createDecorationAnimationsForLayout:v7 scope:a4];
  }

  return v8;
}

+ (id)_createDecorationAnimationsForLayout:(id)a3 scope:(int64_t)a4
{
  v5 = (void *)MEMORY[0x1E4F1CA48];
  id v6 = a3;
  id v7 = [v5 array];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __83__PXPhotosGridHideAssetAnimationHelper__createDecorationAnimationsForLayout_scope___block_invoke;
  v10[3] = &unk_1E5DBA490;
  int64_t v12 = a4;
  id v8 = v7;
  id v11 = v8;
  _CreateAnimationOnDecoratingLayouts(v6, v10);

  return v8;
}

void __83__PXPhotosGridHideAssetAnimationHelper__createDecorationAnimationsForLayout_scope___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 createAnimation];
  [v3 setCurve:0];
  [v3 setDuration:0.3];
  [v3 setScope:*(void *)(a1 + 40)];
  [*(id *)(a1 + 32) addObject:v3];
}

@end