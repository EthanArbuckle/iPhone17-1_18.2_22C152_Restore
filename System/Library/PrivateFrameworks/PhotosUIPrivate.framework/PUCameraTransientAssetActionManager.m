@interface PUCameraTransientAssetActionManager
- (BOOL)canPerformActionType:(unint64_t)a3 onAsset:(id)a4 inAssetCollection:(id)a5;
- (BOOL)shouldEnableActionType:(unint64_t)a3 onAsset:(id)a4 inAssetCollection:(id)a5;
@end

@implementation PUCameraTransientAssetActionManager

- (BOOL)shouldEnableActionType:(unint64_t)a3 onAsset:(id)a4 inAssetCollection:(id)a5
{
  return 0;
}

- (BOOL)canPerformActionType:(unint64_t)a3 onAsset:(id)a4 inAssetCollection:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  char v9 = 0;
  if (a3 <= 0x3F)
  {
    if (((1 << a3) & 0x8000030100008100) != 0)
    {
      char v9 = 1;
    }
    else if (a3 == 34)
    {
      if ([v7 conformsToProtocol:&unk_1F090E360])
      {
        id v12 = v7;
        v13 = [v12 burstIdentifier];
        uint64_t v14 = [v12 numberOfRepresentedAssets];

        if (v13) {
          BOOL v15 = v14 <= 1;
        }
        else {
          BOOL v15 = 1;
        }
        char v9 = !v15;
      }
      else
      {
        char v9 = 0;
      }
    }
  }
  if (a3 == 8) {
    BOOL v10 = 1;
  }
  else {
    BOOL v10 = v9;
  }

  return v10;
}

@end