@interface PUOneUpContentTileProvider
- (PUMediaProvider)mediaProvider;
- (PUOneUpContentTileProvider)init;
- (PUOneUpContentTileProvider)initWithMediaProvider:(id)a3;
- (UIWindow)window;
- (id)tileControllerForAsset:(id)a3 viewModel:(id)a4 tilingView:(id)a5;
- (void)registerTileControllerClassesWithTilingView:(id)a3;
- (void)setWindow:(id)a3;
@end

@implementation PUOneUpContentTileProvider

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_window, 0);
  objc_storeStrong((id *)&self->_mediaProvider, 0);
}

- (void)setWindow:(id)a3
{
}

- (UIWindow)window
{
  return self->_window;
}

- (PUMediaProvider)mediaProvider
{
  return self->_mediaProvider;
}

- (id)tileControllerForAsset:(id)a3 viewModel:(id)a4 tilingView:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v12 = v11;
  if (!v9)
  {
    v29 = [MEMORY[0x1E4F28B00] currentHandler];
    [v29 handleFailureInMethod:a2, self, @"PUOneUpContentTileProvider.m", 46, @"Invalid parameter not satisfying: %@", @"asset != nil" object file lineNumber description];

    if (v12) {
      goto LABEL_3;
    }
LABEL_30:
    v30 = [MEMORY[0x1E4F28B00] currentHandler];
    [v30 handleFailureInMethod:a2, self, @"PUOneUpContentTileProvider.m", 47, @"Invalid parameter not satisfying: %@", @"tilingView != nil" object file lineNumber description];

    goto LABEL_3;
  }
  if (!v11) {
    goto LABEL_30;
  }
LABEL_3:
  uint64_t v13 = [v9 mediaType];
  if ([v9 playbackStyle] == 5 || v13 == 2)
  {
    v16 = [v12 dequeueTileControllerWithReuseIdentifier:@"PUVideoTileViewReuseIdentifier"];
    v17 = [(PUOneUpContentTileProvider *)self mediaProvider];
    [v16 setMediaProvider:v17];

    [v16 setAssetViewModel:v10];
    goto LABEL_26;
  }
  v14 = +[PURootSettings sharedInstance];
  if ([v14 irisUIEnabled])
  {
    if ([v9 canPlayPhotoIris])
    {

      if ([v9 isAnimatedImage])
      {
        int v15 = 1;
        goto LABEL_13;
      }
LABEL_19:
      v20 = &PUIrisImageTileViewReuseIdentifier;
      goto LABEL_20;
    }
    int v15 = [v9 isPhotoIrisPlaceholder];

    if ([v9 isAnimatedImage])
    {
LABEL_13:
      v18 = +[PUOneUpSettings sharedInstance];
      char v19 = [v18 allowGIFPlayback];

      v20 = &PUAnimatedImageTileViewReuseIdentifier;
      if (v15) {
        v20 = &PUIrisImageTileViewReuseIdentifier;
      }
      if (v15 & 1) != 0 || (v19) {
        goto LABEL_20;
      }
      goto LABEL_17;
    }
    if (v15) {
      goto LABEL_19;
    }
  }
  else
  {

    if ([v9 isAnimatedImage])
    {
      int v15 = 0;
      goto LABEL_13;
    }
  }
LABEL_17:
  v20 = &PUOneUpImageTileViewReuseIdentifier;
LABEL_20:
  v16 = [v12 dequeueTileControllerWithReuseIdentifier:*v20];
  id v21 = [(PUOneUpContentTileProvider *)self window];
  if (!v21)
  {
    v22 = [v12 window];
    v23 = v22;
    if (v22)
    {
      id v21 = v22;
    }
    else
    {
      v24 = [MEMORY[0x1E4FB1438] sharedApplication];
      v25 = [v24 windows];
      id v21 = [v25 firstObject];
    }
  }
  v26 = [(PUOneUpContentTileProvider *)self mediaProvider];
  [v16 setMediaProvider:v26];

  v27 = objc_msgSend(v21, "px_imageModulationManager");
  [v16 setImageModulationManager:v27];

  [v16 setAssetViewModel:v10];
LABEL_26:
  [v16 setContentViewEnabled:1];

  return v16;
}

- (void)registerTileControllerClassesWithTilingView:(id)a3
{
  id v3 = a3;
  [v3 registerTileControllerClass:objc_opt_class() forReuseIdentifier:@"PUOneUpImageTileViewReuseIdentifier"];
  [v3 registerTileControllerClass:objc_opt_class() forReuseIdentifier:@"PUVideoTileViewReuseIdentifier"];
  [v3 registerTileControllerClass:objc_opt_class() forReuseIdentifier:@"PUIrisImageTileViewReuseIdentifier"];
  [v3 registerTileControllerClass:objc_opt_class() forReuseIdentifier:@"PUAnimatedImageTileViewReuseIdentifier"];
}

- (PUOneUpContentTileProvider)initWithMediaProvider:(id)a3
{
  id v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PUOneUpContentTileProvider;
  v7 = [(PUOneUpContentTileProvider *)&v10 init];
  if (v7)
  {
    if (!v6)
    {
      id v9 = [MEMORY[0x1E4F28B00] currentHandler];
      [v9 handleFailureInMethod:a2, v7, @"PUOneUpContentTileProvider.m", 32, @"Invalid parameter not satisfying: %@", @"mediaProvider != nil" object file lineNumber description];
    }
    objc_storeStrong((id *)&v7->_mediaProvider, a3);
  }

  return v7;
}

- (PUOneUpContentTileProvider)init
{
  return [(PUOneUpContentTileProvider *)self initWithMediaProvider:0];
}

@end