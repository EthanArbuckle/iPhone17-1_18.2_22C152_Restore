@interface PUToggleCTMMediaProvider
- (BOOL)_shouldToggleCTMForAsset:(id)a3;
- (PUBrowsingViewModel)viewModel;
- (PUMediaProvider)mediaProvider;
- (PUToggleCTMMediaProvider)initWithViewModel:(id)a3 mediaProvider:(id)a4;
- (id)_ctmImageResourceForAsset:(id)a3;
- (id)_ctmPairedVideoResourceForAsset:(id)a3;
- (id)_ctmVideoResourceForAsset:(id)a3;
- (id)_imageWithSize:(CGSize)a3 string:(id)a4;
- (id)_requestOptions;
- (id)_resourceOfType:(int64_t)a3 forAsset:(id)a4;
- (int)requestAVAssetForVideo:(id)a3 options:(id)a4 resultHandler:(id)a5;
- (int)requestAnimatedImageForAsset:(id)a3 options:(id)a4 resultHandler:(id)a5;
- (int)requestAsynchronousVideoURLForAsset:(id)a3 options:(id)a4 resultHandler:(id)a5;
- (int)requestImageDataForAsset:(id)a3 options:(id)a4 resultHandler:(id)a5;
- (int)requestImageForAsset:(id)a3 targetSize:(CGSize)a4 contentMode:(int64_t)a5 options:(id)a6 resultHandler:(id)a7;
- (int)requestImageURLForAsset:(id)a3 options:(id)a4 resultHandler:(id)a5;
- (int)requestLivePhotoForAsset:(id)a3 targetSize:(CGSize)a4 contentMode:(int64_t)a5 options:(id)a6 resultHandler:(id)a7;
- (int)requestPlayerItemForVideo:(id)a3 options:(id)a4 resultHandler:(id)a5;
- (void)cancelImageRequest:(int)a3;
@end

@implementation PUToggleCTMMediaProvider

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mediaProvider, 0);
  objc_storeStrong((id *)&self->_viewModel, 0);
}

- (PUMediaProvider)mediaProvider
{
  return self->_mediaProvider;
}

- (PUBrowsingViewModel)viewModel
{
  return self->_viewModel;
}

- (void)cancelImageRequest:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  -[PUMediaProvider cancelImageRequest:](self->_mediaProvider, "cancelImageRequest:");
  v4 = (void *)MEMORY[0x1E4F39138];
  [v4 cancelLivePhotoRequestWithRequestID:v3];
}

- (int)requestAsynchronousVideoURLForAsset:(id)a3 options:(id)a4 resultHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (objc_opt_respondsToSelector()) {
    int v11 = [(PUMediaProvider *)self->_mediaProvider requestAsynchronousVideoURLForAsset:v8 options:v9 resultHandler:v10];
  }
  else {
    int v11 = 0;
  }

  return v11;
}

- (int)requestAVAssetForVideo:(id)a3 options:(id)a4 resultHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (objc_opt_respondsToSelector()) {
    int v11 = [(PUMediaProvider *)self->_mediaProvider requestAVAssetForVideo:v8 options:v9 resultHandler:v10];
  }
  else {
    int v11 = 0;
  }

  return v11;
}

- (int)requestAnimatedImageForAsset:(id)a3 options:(id)a4 resultHandler:(id)a5
{
  return [(PUMediaProvider *)self->_mediaProvider requestAnimatedImageForAsset:a3 options:a4 resultHandler:a5];
}

- (int)requestLivePhotoForAsset:(id)a3 targetSize:(CGSize)a4 contentMode:(int64_t)a5 options:(id)a6 resultHandler:(id)a7
{
  double height = a4.height;
  double width = a4.width;
  v37[2] = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  id v14 = a6;
  v15 = (void (**)(id, void *, void))a7;
  if ([(PUToggleCTMMediaProvider *)self _shouldToggleCTMForAsset:v13]
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v16 = v13;
    v17 = [(PUToggleCTMMediaProvider *)self _ctmImageResourceForAsset:v16];
    v18 = [(PUToggleCTMMediaProvider *)self _ctmPairedVideoResourceForAsset:v16];
    v19 = [v17 privateFileURL];
    uint64_t v20 = [v18 privateFileURL];
    v21 = (void *)v20;
    if (v19 && v20)
    {
      v29 = v17;
      v22 = (void *)MEMORY[0x1E4F39138];
      v37[0] = v19;
      v37[1] = v20;
      v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:v37 count:2];
      id v30 = 0;
      v24 = objc_msgSend(v22, "livePhotoWithResourceFileURLs:targetSize:contentMode:skipValidation:prefersHDR:error:", v23, a5, 1, 0, &v30, width, height);
      v25 = v30;

      if (v24)
      {
        v15[2](v15, v24, 0);
        v17 = v29;
      }
      else
      {
        log = PLOneUpGetLog();
        v17 = v29;
        if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412802;
          v32 = v29;
          __int16 v33 = 2112;
          v34 = v18;
          __int16 v35 = 2112;
          v36 = v25;
          _os_log_impl(&dword_1AE9F8000, log, OS_LOG_TYPE_DEFAULT, "Error creating live photo from resources image:%@ video:%@ error:%@", buf, 0x20u);
        }
      }
    }
    else
    {
      v25 = PLOneUpGetLog();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        v32 = v17;
        __int16 v33 = 2112;
        v34 = v18;
        _os_log_impl(&dword_1AE9F8000, v25, OS_LOG_TYPE_DEFAULT, "Error creating live photo from resources, missing file URLs for: image:%@ video:%@", buf, 0x16u);
      }
    }

    int v26 = 0;
  }
  else
  {
    int v26 = -[PUMediaProvider requestLivePhotoForAsset:targetSize:contentMode:options:resultHandler:](self->_mediaProvider, "requestLivePhotoForAsset:targetSize:contentMode:options:resultHandler:", v13, a5, v14, v15, width, height);
  }

  return v26;
}

- (int)requestPlayerItemForVideo:(id)a3 options:(id)a4 resultHandler:(id)a5
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, uint64_t, void))a5;
  if ([(PUToggleCTMMediaProvider *)self _shouldToggleCTMForAsset:v8]
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    int v11 = [(PUToggleCTMMediaProvider *)self _ctmVideoResourceForAsset:v8];
    v12 = [v11 privateFileURL];
    if (v12)
    {
      uint64_t v13 = [objc_alloc(MEMORY[0x1E4F16620]) initWithURL:v12];
      if (v13)
      {
        id v14 = v13;
        v10[2](v10, v13, 0);
      }
      else
      {
        id v16 = PLOneUpGetLog();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          int v18 = 138412290;
          v19 = v11;
          _os_log_impl(&dword_1AE9F8000, v16, OS_LOG_TYPE_DEFAULT, "Error creating playerItem for resource:%@", (uint8_t *)&v18, 0xCu);
        }

        id v14 = 0;
      }
    }
    else
    {
      id v14 = PLOneUpGetLog();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        int v18 = 138412290;
        v19 = v11;
        _os_log_impl(&dword_1AE9F8000, v14, OS_LOG_TYPE_DEFAULT, "No private file url for resource:%@", (uint8_t *)&v18, 0xCu);
      }
    }

    int v15 = 0;
  }
  else
  {
    int v15 = [(PUMediaProvider *)self->_mediaProvider requestPlayerItemForVideo:v8 options:v9 resultHandler:v10];
  }

  return v15;
}

- (int)requestImageURLForAsset:(id)a3 options:(id)a4 resultHandler:(id)a5
{
  v27[2] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, NSObject *, void *))a5;
  if ([(PUToggleCTMMediaProvider *)self _shouldToggleCTMForAsset:v8]
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v11 = v8;
    v12 = [(PUToggleCTMMediaProvider *)self _ctmImageResourceForAsset:v11];
    uint64_t v13 = v12;
    if (v12)
    {
      id v14 = [v12 privateFileURL];
      if (v14)
      {
        v26[0] = *MEMORY[0x1E4F396D0];
        uint64_t v15 = [v13 uniformTypeIdentifier];
        id v16 = v15;
        v17 = &stru_1F06BE7B8;
        if (v15) {
          v17 = (__CFString *)v15;
        }
        v27[0] = v17;
        v26[1] = *MEMORY[0x1E4F396B8];
        int v18 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v11, "imageOrientation"));
        v27[1] = v18;
        v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v27 forKeys:v26 count:2];
        v10[2](v10, v14, v19);
      }
      else
      {
        id v16 = PLOneUpGetLog();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          int v22 = 138412546;
          id v23 = v13;
          __int16 v24 = 2112;
          uint64_t v25 = 0;
          _os_log_impl(&dword_1AE9F8000, v16, OS_LOG_TYPE_DEFAULT, "Error retrieving fileURL for resource:%@ fileURL:%@", (uint8_t *)&v22, 0x16u);
        }
      }
    }
    else
    {
      id v14 = PLOneUpGetLog();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        int v22 = 138412290;
        id v23 = v11;
        _os_log_impl(&dword_1AE9F8000, v14, OS_LOG_TYPE_DEFAULT, "Missing CTM resource for asset:%@", (uint8_t *)&v22, 0xCu);
      }
    }

    int v20 = 0;
  }
  else
  {
    int v20 = [(PUMediaProvider *)self->_mediaProvider requestImageURLForAsset:v8 options:v9 resultHandler:v10];
  }

  return v20;
}

- (int)requestImageDataForAsset:(id)a3 options:(id)a4 resultHandler:(id)a5
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, NSObject *, void *, uint64_t, void))a5;
  if ([(PUToggleCTMMediaProvider *)self _shouldToggleCTMForAsset:v8]
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v11 = v8;
    v12 = [(PUToggleCTMMediaProvider *)self _ctmImageResourceForAsset:v11];
    uint64_t v13 = v12;
    if (v12)
    {
      id v14 = [v12 privateFileURL];
      if (v14
        && (id v15 = objc_alloc(MEMORY[0x1E4F1C9B8]),
            [v14 path],
            id v16 = objc_claimAutoreleasedReturnValue(),
            v17 = [v15 initWithContentsOfFile:v16],
            v16,
            v17))
      {
        int v18 = [v13 uniformTypeIdentifier];
        v10[2](v10, v17, v18, [v11 imageOrientation], 0);
      }
      else
      {
        v17 = PLOneUpGetLog();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          int v21 = 138412546;
          id v22 = v13;
          __int16 v23 = 2112;
          __int16 v24 = v14;
          _os_log_impl(&dword_1AE9F8000, v17, OS_LOG_TYPE_DEFAULT, "Error retrieving data for resource:%@ fileURL:%@", (uint8_t *)&v21, 0x16u);
        }
      }
    }
    else
    {
      id v14 = PLOneUpGetLog();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        int v21 = 138412290;
        id v22 = v11;
        _os_log_impl(&dword_1AE9F8000, v14, OS_LOG_TYPE_DEFAULT, "Missing CTM resource for asset:%@", (uint8_t *)&v21, 0xCu);
      }
    }

    int v19 = 0;
  }
  else
  {
    int v19 = [(PUMediaProvider *)self->_mediaProvider requestImageDataForAsset:v8 options:v9 resultHandler:v10];
  }

  return v19;
}

- (int)requestImageForAsset:(id)a3 targetSize:(CGSize)a4 contentMode:(int64_t)a5 options:(id)a6 resultHandler:(id)a7
{
  double height = a4.height;
  double width = a4.width;
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  id v14 = a6;
  id v15 = (void (**)(id, void *, void))a7;
  if ([(PUToggleCTMMediaProvider *)self _shouldToggleCTMForAsset:v13])
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && height > 150.0)
    {
      id v16 = v13;
      v17 = [(PUToggleCTMMediaProvider *)self _ctmImageResourceForAsset:v16];
      int v18 = v17;
      if (v17)
      {
        int v19 = [v17 privateFileURL];
        if (!v19
          || (id v20 = objc_alloc(MEMORY[0x1E4FB1818]),
              [v19 path],
              int v21 = objc_claimAutoreleasedReturnValue(),
              id v22 = (void *)[v20 initWithContentsOfFile:v21],
              v21,
              !v22))
        {
          id v22 = [NSString stringWithFormat:@"Error creating image for resource:%@ fileURL:%@", v18, v19];
          __int16 v23 = PLOneUpGetLog();
          if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            id v29 = v22;
            _os_log_impl(&dword_1AE9F8000, v23, OS_LOG_TYPE_DEFAULT, "%@", buf, 0xCu);
          }

          __int16 v24 = -[PUToggleCTMMediaProvider _imageWithSize:string:](self, "_imageWithSize:string:", v22, width, height);
          v15[2](v15, v24, 0);

          goto LABEL_15;
        }
      }
      else
      {
        int v26 = PLOneUpGetLog();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          id v29 = v16;
          _os_log_impl(&dword_1AE9F8000, v26, OS_LOG_TYPE_DEFAULT, "Missing CTM resource for asset:%@", buf, 0xCu);
        }

        int v19 = [NSString stringWithFormat:@"No matching CTM resource type for asset:%@", v16];
        id v22 = -[PUToggleCTMMediaProvider _imageWithSize:string:](self, "_imageWithSize:string:", v19, width, height);
      }
      v15[2](v15, v22, 0);
LABEL_15:

      int v25 = 0;
      goto LABEL_16;
    }
  }
  int v25 = -[PUMediaProvider requestImageForAsset:targetSize:contentMode:options:resultHandler:](self->_mediaProvider, "requestImageForAsset:targetSize:contentMode:options:resultHandler:", v13, a5, v14, v15, width, height);
LABEL_16:

  return v25;
}

- (id)_requestOptions
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F38F98]);
  [v2 setNetworkAccessAllowed:1];
  return v2;
}

- (id)_ctmPairedVideoResourceForAsset:(id)a3
{
  return [(PUToggleCTMMediaProvider *)self _resourceOfType:15 forAsset:a3];
}

- (id)_ctmVideoResourceForAsset:(id)a3
{
  return [(PUToggleCTMMediaProvider *)self _resourceOfType:14 forAsset:a3];
}

- (id)_ctmImageResourceForAsset:(id)a3
{
  return [(PUToggleCTMMediaProvider *)self _resourceOfType:13 forAsset:a3];
}

- (id)_resourceOfType:(int64_t)a3 forAsset:(id)a4
{
  v5 = [MEMORY[0x1E4F38F60] assetResourcesForAsset:a4];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __53__PUToggleCTMMediaProvider__resourceOfType_forAsset___block_invoke;
  v9[3] = &__block_descriptor_40_e32_B32__0__PHAssetResource_8Q16_B24l;
  v9[4] = a3;
  uint64_t v6 = [v5 indexOfObjectPassingTest:v9];
  if (v6 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v7 = 0;
  }
  else
  {
    v7 = [v5 objectAtIndexedSubscript:v6];
  }

  return v7;
}

BOOL __53__PUToggleCTMMediaProvider__resourceOfType_forAsset___block_invoke(uint64_t a1, void *a2)
{
  return [a2 type] == *(void *)(a1 + 32);
}

- (id)_imageWithSize:(CGSize)a3 string:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  id v6 = a4;
  v7 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB17D8]), "initWithSize:", width, height);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __50__PUToggleCTMMediaProvider__imageWithSize_string___block_invoke;
  v11[3] = &unk_1E5F2A4B0;
  id v12 = v6;
  id v8 = v6;
  id v9 = [v7 imageWithActions:v11];

  return v9;
}

void __50__PUToggleCTMMediaProvider__imageWithSize_string___block_invoke(uint64_t a1, void *a2)
{
  v15[1] = *MEMORY[0x1E4F143B8];
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = [a2 format];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  uint64_t v14 = *MEMORY[0x1E4FB06F8];
  id v12 = [MEMORY[0x1E4FB08E0] systemFontOfSize:28.0];
  v15[0] = v12;
  id v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:&v14 count:1];
  objc_msgSend(v2, "drawInRect:withAttributes:", v13, v5, v7, v9, v11);
}

- (BOOL)_shouldToggleCTMForAsset:(id)a3
{
  return 0;
}

- (PUToggleCTMMediaProvider)initWithViewModel:(id)a3 mediaProvider:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PUToggleCTMMediaProvider;
  double v9 = [(PUToggleCTMMediaProvider *)&v12 init];
  double v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_viewModel, a3);
    objc_storeStrong((id *)&v10->_mediaProvider, a4);
  }

  return v10;
}

@end