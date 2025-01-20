@interface PLSharedAssetsContainerIncrementalChangeContainer
- (PLManagedAsset)asset;
- (PLSharedAssetsContainerIncrementalChange)change;
- (PLSharedAssetsContainerIncrementalChangeContainer)initWithAsset:(id)a3 change:(id)a4;
@end

@implementation PLSharedAssetsContainerIncrementalChangeContainer

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_change, 0);
  objc_storeStrong((id *)&self->_asset, 0);
}

- (PLSharedAssetsContainerIncrementalChange)change
{
  return self->_change;
}

- (PLManagedAsset)asset
{
  return self->_asset;
}

- (PLSharedAssetsContainerIncrementalChangeContainer)initWithAsset:(id)a3 change:(id)a4
{
  id v8 = a3;
  id v9 = a4;
  v14.receiver = self;
  v14.super_class = (Class)PLSharedAssetsContainerIncrementalChangeContainer;
  v10 = [(PLSharedAssetsContainerIncrementalChangeContainer *)&v14 init];
  if (v10)
  {
    if (v8)
    {
      if (v9)
      {
LABEL_4:
        objc_storeStrong((id *)&v10->_asset, a3);
        objc_storeStrong((id *)&v10->_change, a4);
        goto LABEL_5;
      }
    }
    else
    {
      v12 = [MEMORY[0x1E4F28B00] currentHandler];
      [v12 handleFailureInMethod:a2, v10, @"PLSharedAssetsContainer.m", 352, @"Invalid parameter not satisfying: %@", @"asset" object file lineNumber description];

      if (v9) {
        goto LABEL_4;
      }
    }
    v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2, v10, @"PLSharedAssetsContainer.m", 353, @"Invalid parameter not satisfying: %@", @"change" object file lineNumber description];

    goto LABEL_4;
  }
LABEL_5:

  return v10;
}

@end