@interface WFCompactContentPreviewViewController
- (BOOL)_canShowWhileLocked;
- (BOOL)containsImageOrMediaThumbnail;
- (BOOL)contentAllowsScrolling;
- (UIActivityIndicatorView)indicatorView;
- (UIView)sourceViewForQuickLook;
- (WFCompactContentPreviewViewControllerDelegate)delegate;
- (WFCompactThumbnailViewController)thumbnailViewController;
- (WFContentItem)contentItem;
- (double)contentHeightForWidth:(double)a3;
- (id)_fileThumbnailViewControllerForContentItem:(id)a3;
- (void)_getTypeSpecificThumbnailViewControllerForContentItem:(id)a3 completionHandler:(id)a4;
- (void)getThumbnailViewControllerForContentItem:(id)a3 completionHandler:(id)a4;
- (void)invalidateContentSize;
- (void)loadView;
- (void)setContentItem:(id)a3 completionHandler:(id)a4;
- (void)setDelegate:(id)a3;
- (void)setIndicatorView:(id)a3;
- (void)setThumbnailViewController:(id)a3;
- (void)viewDidLayoutSubviews;
@end

@implementation WFCompactContentPreviewViewController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_thumbnailViewController, 0);
  objc_destroyWeak((id *)&self->_indicatorView);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_contentItem, 0);
}

- (void)setThumbnailViewController:(id)a3
{
}

- (WFCompactThumbnailViewController)thumbnailViewController
{
  return self->_thumbnailViewController;
}

- (void)setIndicatorView:(id)a3
{
}

- (UIActivityIndicatorView)indicatorView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_indicatorView);
  return (UIActivityIndicatorView *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (WFCompactContentPreviewViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (WFCompactContentPreviewViewControllerDelegate *)WeakRetained;
}

- (WFContentItem)contentItem
{
  return self->_contentItem;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (BOOL)containsImageOrMediaThumbnail
{
  v3 = [(WFCompactContentPreviewViewController *)self thumbnailViewController];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    char isKindOfClass = 1;
  }
  else
  {
    v5 = [(WFCompactContentPreviewViewController *)self thumbnailViewController];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
  }
  return isKindOfClass & 1;
}

- (void)_getTypeSpecificThumbnailViewControllerForContentItem:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (![MEMORY[0x263EFFA40] universalPreviewsEnabled]
    || ![v6 conformsToContentItemPreviewProviding])
  {
    if ([v6 isMemberOfClass:objc_opt_class()])
    {
      v8 = [(WFCompactContentPreviewViewController *)self _fileThumbnailViewControllerForContentItem:v6];
      goto LABEL_6;
    }
    if ([v6 preferredDisplayStyle] == 1)
    {
      v33[0] = MEMORY[0x263EF8330];
      v33[1] = 3221225472;
      v33[2] = __113__WFCompactContentPreviewViewController__getTypeSpecificThumbnailViewControllerForContentItem_completionHandler___block_invoke;
      v33[3] = &unk_2649CB1D8;
      id v34 = v6;
      id v35 = v7;
      [v34 getObjectRepresentation:v33 forClass:objc_opt_class()];

      id v10 = v34;
    }
    else
    {
      v11 = [v6 preferredObjectType];
      int v12 = [v11 isEqualToClass:getPHAssetClass()];

      if (v12)
      {
        v30[0] = MEMORY[0x263EF8330];
        v30[1] = 3221225472;
        v30[2] = __113__WFCompactContentPreviewViewController__getTypeSpecificThumbnailViewControllerForContentItem_completionHandler___block_invoke_190;
        v30[3] = &unk_2649CB278;
        id v31 = v6;
        id v32 = v7;
        [v31 getObjectRepresentation:v30 forClass:getPHAssetClass()];

        id v10 = v31;
      }
      else
      {
        v13 = [v6 preferredObjectType];
        if ([v13 isEqualToClass:objc_opt_class()])
        {
        }
        else
        {
          v14 = [v6 preferredFileType];
          v15 = [MEMORY[0x263F336D8] ownedTypes];
          int v16 = [v14 conformsToTypes:v15];

          if (!v16)
          {
            v17 = [v6 preferredFileType];
            int v18 = [v17 conformsToUTType:*MEMORY[0x263F1DB18]];

            if (v18)
            {
              v24[0] = MEMORY[0x263EF8330];
              v24[1] = 3221225472;
              v24[2] = __113__WFCompactContentPreviewViewController__getTypeSpecificThumbnailViewControllerForContentItem_completionHandler___block_invoke_203;
              v24[3] = &unk_2649CB2F0;
              id v25 = v6;
              id v26 = v7;
              [v25 getFileRepresentation:v24 forType:0];

              id v10 = v25;
            }
            else
            {
              v19 = [v6 preferredFileType];
              int v20 = [v19 conformsToUTType:*MEMORY[0x263F1DC20]];

              if (!v20)
              {
                (*((void (**)(id, void))v7 + 2))(v7, 0);
                goto LABEL_16;
              }
              v21[0] = MEMORY[0x263EF8330];
              v21[1] = 3221225472;
              v21[2] = __113__WFCompactContentPreviewViewController__getTypeSpecificThumbnailViewControllerForContentItem_completionHandler___block_invoke_3_208;
              v21[3] = &unk_2649CB318;
              id v22 = v6;
              id v23 = v7;
              [v22 getObjectRepresentation:v21 forClass:objc_opt_class()];

              id v10 = v22;
            }
            goto LABEL_15;
          }
        }
        v27[0] = MEMORY[0x263EF8330];
        v27[1] = 3221225472;
        v27[2] = __113__WFCompactContentPreviewViewController__getTypeSpecificThumbnailViewControllerForContentItem_completionHandler___block_invoke_201;
        v27[3] = &unk_2649CB2A0;
        id v28 = v6;
        id v29 = v7;
        [v28 getObjectRepresentation:v27 forClass:objc_opt_class()];

        id v10 = v28;
      }
    }
LABEL_15:

    goto LABEL_16;
  }
  v8 = [[WFCompactPreviewThumbnailViewController alloc] initWithContentItem:v6];
LABEL_6:
  v9 = v8;
  (*((void (**)(id, WFCompactPreviewThumbnailViewController *))v7 + 2))(v7, v8);

LABEL_16:
}

void __113__WFCompactContentPreviewViewController__getTypeSpecificThumbnailViewControllerForContentItem_completionHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v6 = a2;
  id v7 = a4;
  if (v6)
  {
    uint64_t v8 = *(void *)(a1 + 40);
    v9 = [[WFCompactMapThumbnailViewController alloc] initWithCLPlacemark:v6];
    (*(void (**)(uint64_t, WFCompactMapThumbnailViewController *))(v8 + 16))(v8, v9);
  }
  else
  {
    id v10 = getWFDialogLogObject();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v11 = *(void *)(a1 + 32);
      int v12 = 136315650;
      v13 = "-[WFCompactContentPreviewViewController _getTypeSpecificThumbnailViewControllerForContentItem:completionHand"
            "ler:]_block_invoke";
      __int16 v14 = 2114;
      uint64_t v15 = v11;
      __int16 v16 = 2112;
      id v17 = v7;
      _os_log_impl(&dword_22D994000, v10, OS_LOG_TYPE_DEFAULT, "%s Failed to get a CLPlacemark representation for content: %{public}@, %@", (uint8_t *)&v12, 0x20u);
    }

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

void __113__WFCompactContentPreviewViewController__getTypeSpecificThumbnailViewControllerForContentItem_completionHandler___block_invoke_190(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (!v7)
  {
    v13 = getWFDialogLogObject();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v14 = *(void **)(a1 + 32);
      *(_DWORD *)buf = 136315650;
      id v31 = "-[WFCompactContentPreviewViewController _getTypeSpecificThumbnailViewControllerForContentItem:completionHand"
            "ler:]_block_invoke";
      __int16 v32 = 2114;
      id v33 = v14;
      __int16 v34 = 2112;
      id v35 = v9;
      uint64_t v15 = "%s Failed to get a PHAsset representation for content: %{public}@, %@";
      __int16 v16 = v13;
      os_log_type_t v17 = OS_LOG_TYPE_DEFAULT;
      uint32_t v18 = 32;
LABEL_17:
      _os_log_impl(&dword_22D994000, v16, v17, v15, buf, v18);
      goto LABEL_18;
    }
    goto LABEL_18;
  }
  uint64_t v10 = [v7 playbackStyle];
  if ((unint64_t)(v10 - 1) < 3)
  {
    unint64_t v19 = [v7 pixelWidth];
    unint64_t v20 = [v7 pixelHeight];
    if (v19 && v20)
    {
      double v21 = (double)v19 / (double)v20;
      aBlock[0] = MEMORY[0x263EF8330];
      aBlock[1] = 3221225472;
      aBlock[2] = __113__WFCompactContentPreviewViewController__getTypeSpecificThumbnailViewControllerForContentItem_completionHandler___block_invoke_191;
      aBlock[3] = &unk_2649CB228;
      id v29 = *(id *)(a1 + 32);
      id v22 = _Block_copy(aBlock);
      uint64_t v23 = *(void *)(a1 + 40);
      v24 = [[WFCompactImageThumbnailViewController alloc] initWithAspectRatio:v22 imageGenerator:v21];
      (*(void (**)(uint64_t, WFCompactImageThumbnailViewController *))(v23 + 16))(v23, v24);

      id v12 = v29;
      goto LABEL_10;
    }
    v13 = getWFDialogLogObject();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315394;
      id v31 = "-[WFCompactContentPreviewViewController _getTypeSpecificThumbnailViewControllerForContentItem:completionHand"
            "ler:]_block_invoke";
      __int16 v32 = 2112;
      id v33 = v7;
      uint64_t v15 = "%s Photo had a size of zero: %@";
      goto LABEL_16;
    }
LABEL_18:

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    goto LABEL_19;
  }
  if ((unint64_t)(v10 - 4) >= 2)
  {
    if (v10) {
      goto LABEL_19;
    }
    v13 = getWFDialogLogObject();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315394;
      id v31 = "-[WFCompactContentPreviewViewController _getTypeSpecificThumbnailViewControllerForContentItem:completionHand"
            "ler:]_block_invoke";
      __int16 v32 = 2112;
      id v33 = v7;
      uint64_t v15 = "%s PHAsset has an unsupported playback style: %@";
LABEL_16:
      __int16 v16 = v13;
      os_log_type_t v17 = OS_LOG_TYPE_FAULT;
      uint32_t v18 = 22;
      goto LABEL_17;
    }
    goto LABEL_18;
  }
  uint64_t v11 = *(void **)(a1 + 32);
  v25[0] = MEMORY[0x263EF8330];
  v25[1] = 3221225472;
  v25[2] = __113__WFCompactContentPreviewViewController__getTypeSpecificThumbnailViewControllerForContentItem_completionHandler___block_invoke_3;
  v25[3] = &unk_2649CB250;
  id v26 = v11;
  id v27 = *(id *)(a1 + 40);
  [v26 getObjectRepresentation:v25 forClass:objc_opt_class()];

  id v12 = v26;
LABEL_10:

LABEL_19:
}

void __113__WFCompactContentPreviewViewController__getTypeSpecificThumbnailViewControllerForContentItem_completionHandler___block_invoke_201(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v6 = a4;
  if (a2)
  {
    id v7 = [MEMORY[0x263EFA800] playerItemWithAsset:a2];
    uint64_t v8 = *(void *)(a1 + 40);
    id v9 = [[WFCompactMediaThumbnailViewController alloc] initWithAVPlayerItem:v7];
    (*(void (**)(uint64_t, WFCompactMediaThumbnailViewController *))(v8 + 16))(v8, v9);
  }
  else
  {
    uint64_t v10 = getWFDialogLogObject();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v11 = *(void *)(a1 + 32);
      int v12 = 136315650;
      v13 = "-[WFCompactContentPreviewViewController _getTypeSpecificThumbnailViewControllerForContentItem:completionHand"
            "ler:]_block_invoke";
      __int16 v14 = 2114;
      uint64_t v15 = v11;
      __int16 v16 = 2112;
      id v17 = v6;
      _os_log_impl(&dword_22D994000, v10, OS_LOG_TYPE_DEFAULT, "%s Failed to get an AVAsset representation for content: %{public}@, %@", (uint8_t *)&v12, 0x20u);
    }

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

void __113__WFCompactContentPreviewViewController__getTypeSpecificThumbnailViewControllerForContentItem_completionHandler___block_invoke_203(uint64_t a1, void *a2, void *a3)
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (!v5)
  {
    v13 = getWFDialogLogObject();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v14 = *(void **)(a1 + 32);
      *(_DWORD *)buf = 136315650;
      id v22 = "-[WFCompactContentPreviewViewController _getTypeSpecificThumbnailViewControllerForContentItem:completionHand"
            "ler:]_block_invoke";
      __int16 v23 = 2114;
      id v24 = v14;
      __int16 v25 = 2112;
      id v26 = v6;
      uint64_t v15 = "%s Failed to get a file representation for image: %{public}@, %@";
      __int16 v16 = v13;
      os_log_type_t v17 = OS_LOG_TYPE_DEFAULT;
      uint32_t v18 = 32;
LABEL_9:
      _os_log_impl(&dword_22D994000, v16, v17, v15, buf, v18);
    }
LABEL_10:

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    goto LABEL_11;
  }
  WFImageSizeFromFile();
  if (v7 == 0.0 || v8 == 0.0)
  {
    v13 = getWFDialogLogObject();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315394;
      id v22 = "-[WFCompactContentPreviewViewController _getTypeSpecificThumbnailViewControllerForContentItem:completionHand"
            "ler:]_block_invoke";
      __int16 v23 = 2112;
      id v24 = v5;
      uint64_t v15 = "%s Image had a size of zero: %@";
      __int16 v16 = v13;
      os_log_type_t v17 = OS_LOG_TYPE_FAULT;
      uint32_t v18 = 22;
      goto LABEL_9;
    }
    goto LABEL_10;
  }
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __113__WFCompactContentPreviewViewController__getTypeSpecificThumbnailViewControllerForContentItem_completionHandler___block_invoke_204;
  aBlock[3] = &unk_2649CB228;
  double v9 = v7 / v8;
  id v20 = v5;
  uint64_t v10 = _Block_copy(aBlock);
  uint64_t v11 = *(void *)(a1 + 40);
  int v12 = [[WFCompactImageThumbnailViewController alloc] initWithAspectRatio:v10 imageGenerator:v9];
  (*(void (**)(uint64_t, WFCompactImageThumbnailViewController *))(v11 + 16))(v11, v12);

LABEL_11:
}

void __113__WFCompactContentPreviewViewController__getTypeSpecificThumbnailViewControllerForContentItem_completionHandler___block_invoke_3_208(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v6 = a2;
  id v7 = a4;
  if ([v6 length])
  {
    uint64_t v8 = *(void *)(a1 + 40);
    double v9 = [[WFCompactTextThumbnailViewController alloc] initWithString:v6];
    (*(void (**)(uint64_t, WFCompactTextThumbnailViewController *))(v8 + 16))(v8, v9);
  }
  else
  {
    uint64_t v10 = getWFDialogLogObject();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v11 = *(void *)(a1 + 32);
      int v12 = 136315650;
      v13 = "-[WFCompactContentPreviewViewController _getTypeSpecificThumbnailViewControllerForContentItem:completionHand"
            "ler:]_block_invoke_3";
      __int16 v14 = 2114;
      uint64_t v15 = v11;
      __int16 v16 = 2112;
      id v17 = v7;
      _os_log_impl(&dword_22D994000, v10, OS_LOG_TYPE_DEFAULT, "%s Failed to get a NSString representation for content: %{public}@, %@", (uint8_t *)&v12, 0x20u);
    }

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

void __113__WFCompactContentPreviewViewController__getTypeSpecificThumbnailViewControllerForContentItem_completionHandler___block_invoke_204(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [*(id *)(a1 + 32) wfType];
  id v6 = v3;
  id v5 = v3;
  WFAsyncTransformedImageFromImage();
}

void __113__WFCompactContentPreviewViewController__getTypeSpecificThumbnailViewControllerForContentItem_completionHandler___block_invoke_2_205(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = (void *)MEMORY[0x263F85308];
  id v6 = [a2 mappedData];
  v4 = [v3 imageWithData:v6 scale:1.0];
  id v5 = [v4 UIImage];
  (*(void (**)(uint64_t, void *))(v2 + 16))(v2, v5);
}

void __113__WFCompactContentPreviewViewController__getTypeSpecificThumbnailViewControllerForContentItem_completionHandler___block_invoke_191(uint64_t a1, void *a2, double a3, double a4)
{
  id v7 = a2;
  uint64_t v8 = *(void **)(a1 + 32);
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __113__WFCompactContentPreviewViewController__getTypeSpecificThumbnailViewControllerForContentItem_completionHandler___block_invoke_2;
  v10[3] = &unk_2649CB200;
  id v11 = v7;
  id v9 = v7;
  objc_msgSend(v8, "getThumbnail:ofSize:", v10, a3, a4);
}

void __113__WFCompactContentPreviewViewController__getTypeSpecificThumbnailViewControllerForContentItem_completionHandler___block_invoke_3(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v6 = a2;
  id v7 = a4;
  if (v6)
  {
    uint64_t v8 = *(void *)(a1 + 40);
    id v9 = [[WFCompactMediaThumbnailViewController alloc] initWithAVPlayerItem:v6];
    (*(void (**)(uint64_t, WFCompactMediaThumbnailViewController *))(v8 + 16))(v8, v9);
  }
  else
  {
    uint64_t v10 = getWFDialogLogObject();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v11 = *(void *)(a1 + 32);
      int v12 = 136315650;
      v13 = "-[WFCompactContentPreviewViewController _getTypeSpecificThumbnailViewControllerForContentItem:completionHand"
            "ler:]_block_invoke_3";
      __int16 v14 = 2114;
      uint64_t v15 = v11;
      __int16 v16 = 2112;
      id v17 = v7;
      _os_log_impl(&dword_22D994000, v10, OS_LOG_TYPE_DEFAULT, "%s Failed to get an AVPlayerItem representation for content: %{public}@, %@", (uint8_t *)&v12, 0x20u);
    }

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

void __113__WFCompactContentPreviewViewController__getTypeSpecificThumbnailViewControllerForContentItem_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = [a2 UIImage];
  (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);
}

- (id)_fileThumbnailViewControllerForContentItem:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v3 = a3;
  v4 = getWFDialogLogObject();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 136315394;
    uint64_t v11 = "-[WFCompactContentPreviewViewController _fileThumbnailViewControllerForContentItem:]";
    __int16 v12 = 2114;
    id v13 = v3;
    _os_log_impl(&dword_22D994000, v4, OS_LOG_TYPE_DEFAULT, "%s Showing content with a file thumbnail: %{public}@", (uint8_t *)&v10, 0x16u);
  }

  id v5 = [WFCompactFileThumbnailViewController alloc];
  id v6 = [v3 preferredFileType];
  id v7 = [v3 name];
  uint64_t v8 = [(WFCompactFileThumbnailViewController *)v5 initWithFileType:v6 filename:v7];

  return v8;
}

- (void)getThumbnailViewControllerForContentItem:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __100__WFCompactContentPreviewViewController_getThumbnailViewControllerForContentItem_completionHandler___block_invoke;
  v10[3] = &unk_2649CB1B0;
  void v10[4] = self;
  id v11 = v6;
  id v12 = v7;
  id v8 = v7;
  id v9 = v6;
  [(WFCompactContentPreviewViewController *)self _getTypeSpecificThumbnailViewControllerForContentItem:v9 completionHandler:v10];
}

void __100__WFCompactContentPreviewViewController_getThumbnailViewControllerForContentItem_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (!v3)
  {
    id v3 = [*(id *)(a1 + 32) _fileThumbnailViewControllerForContentItem:*(void *)(a1 + 40)];
  }
  id v4 = v3;
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (BOOL)contentAllowsScrolling
{
  id v3 = [(WFCompactContentPreviewViewController *)self thumbnailViewController];
  if (v3)
  {
    id v4 = [(WFCompactContentPreviewViewController *)self thumbnailViewController];
    BOOL v5 = [v4 preferredContentMode] == 1;
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (UIView)sourceViewForQuickLook
{
  uint64_t v2 = [(WFCompactContentPreviewViewController *)self thumbnailViewController];
  id v3 = [v2 view];

  return (UIView *)v3;
}

- (void)setContentItem:(id)a3 completionHandler:(id)a4
{
  id v8 = a3;
  id v9 = a4;
  if (!v8)
  {
    uint64_t v15 = [MEMORY[0x263F08690] currentHandler];
    [v15 handleFailureInMethod:a2, self, @"WFCompactContentPreviewViewController.m", 71, @"Invalid parameter not satisfying: %@", @"contentItem" object file lineNumber description];
  }
  [(WFCompactContentPreviewViewController *)self loadViewIfNeeded];
  [(WFCompactThumbnailViewController *)self->_thumbnailViewController willMoveToParentViewController:0];
  int v10 = [(WFCompactThumbnailViewController *)self->_thumbnailViewController view];
  [v10 removeFromSuperview];

  [(WFCompactThumbnailViewController *)self->_thumbnailViewController removeFromParentViewController];
  thumbnailViewController = self->_thumbnailViewController;
  self->_thumbnailViewController = 0;

  objc_storeStrong((id *)&self->_contentItem, a3);
  id v12 = [(WFCompactContentPreviewViewController *)self indicatorView];
  [v12 startAnimating];

  [(WFCompactContentPreviewViewController *)self invalidateContentSize];
  objc_initWeak(&location, self);
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __74__WFCompactContentPreviewViewController_setContentItem_completionHandler___block_invoke;
  v16[3] = &unk_2649CB188;
  objc_copyWeak(&v19, &location);
  id v13 = v8;
  id v17 = v13;
  id v14 = v9;
  id v18 = v14;
  [(WFCompactContentPreviewViewController *)self getThumbnailViewControllerForContentItem:v13 completionHandler:v16];

  objc_destroyWeak(&v19);
  objc_destroyWeak(&location);
}

void __74__WFCompactContentPreviewViewController_setContentItem_completionHandler___block_invoke(id *a1, void *a2)
{
  id v3 = a2;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __74__WFCompactContentPreviewViewController_setContentItem_completionHandler___block_invoke_2;
  v6[3] = &unk_2649CB160;
  objc_copyWeak(&v10, a1 + 6);
  id v7 = a1[4];
  id v4 = a1[5];
  id v8 = v3;
  id v9 = v4;
  id v5 = v3;
  dispatch_async(MEMORY[0x263EF83A0], v6);

  objc_destroyWeak(&v10);
}

void __74__WFCompactContentPreviewViewController_setContentItem_completionHandler___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  id v3 = [WeakRetained contentItem];
  id v4 = *(void **)(a1 + 32);

  if (v3 == v4)
  {
    uint64_t v5 = *(void *)(a1 + 48);
    uint64_t v6 = [*(id *)(a1 + 40) contentHeightLikelyToChange];
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __74__WFCompactContentPreviewViewController_setContentItem_completionHandler___block_invoke_3;
    v7[3] = &unk_2649CC018;
    v7[4] = WeakRetained;
    id v8 = *(id *)(a1 + 40);
    (*(void (**)(uint64_t, uint64_t, void *))(v5 + 16))(v5, v6, v7);
  }
}

void __74__WFCompactContentPreviewViewController_setContentItem_completionHandler___block_invoke_3(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) indicatorView];
  [v2 stopAnimating];

  [*(id *)(a1 + 40) setDelegate:*(void *)(a1 + 32)];
  [*(id *)(a1 + 32) setThumbnailViewController:*(void *)(a1 + 40)];
  [*(id *)(a1 + 32) addChildViewController:*(void *)(a1 + 40)];
  id v3 = *(void **)(a1 + 40);
  id v4 = [*(id *)(a1 + 32) view];
  [v4 bounds];
  [v3 contentHeightForWidth:v5];
  double v7 = v6;

  id v8 = [*(id *)(a1 + 32) delegate];
  [v8 targetHeightForAnimatingPreviewViewController:*(void *)(a1 + 32) toProposedHeight:v7];
  double v10 = v9;

  id v11 = [*(id *)(a1 + 32) view];
  [v11 bounds];
  double v13 = v12;

  id v14 = [*(id *)(a1 + 40) view];
  [v14 setAlpha:0.0];
  objc_msgSend(v14, "setFrame:", 0.0, 0.0, v13, v10);
  uint64_t v15 = [*(id *)(a1 + 32) view];
  [v15 addSubview:v14];

  [*(id *)(a1 + 40) didMoveToParentViewController:*(void *)(a1 + 32)];
  [v14 layoutIfNeeded];
  __int16 v16 = (void *)MEMORY[0x263F82E00];
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __74__WFCompactContentPreviewViewController_setContentItem_completionHandler___block_invoke_4;
  v18[3] = &unk_2649CBF20;
  id v19 = v14;
  id v17 = v14;
  [v16 animateWithDuration:v18 animations:0.400000006];
  [*(id *)(a1 + 32) invalidateContentSize];
}

uint64_t __74__WFCompactContentPreviewViewController_setContentItem_completionHandler___block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:1.0];
}

- (void)invalidateContentSize
{
  id v3 = [(WFCompactContentPreviewViewController *)self delegate];
  [v3 previewViewControllerDidInvalidateSize:self];
}

- (double)contentHeightForWidth:(double)a3
{
  double v5 = [(WFCompactContentPreviewViewController *)self thumbnailViewController];

  if (!v5) {
    return 150.0;
  }
  double v6 = [(WFCompactContentPreviewViewController *)self thumbnailViewController];
  [v6 contentHeightForWidth:a3];
  double v8 = v7;

  return v8;
}

- (void)viewDidLayoutSubviews
{
  v14.receiver = self;
  v14.super_class = (Class)WFCompactContentPreviewViewController;
  [(WFCompactContentPreviewViewController *)&v14 viewDidLayoutSubviews];
  id v3 = [(WFCompactContentPreviewViewController *)self view];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v12 = [(WFCompactContentPreviewViewController *)self thumbnailViewController];
  double v13 = [v12 view];
  objc_msgSend(v13, "setFrame:", v5, v7, v9, v11);
}

- (void)loadView
{
  v16[2] = *MEMORY[0x263EF8340];
  v15.receiver = self;
  v15.super_class = (Class)WFCompactContentPreviewViewController;
  [(WFCompactContentPreviewViewController *)&v15 loadView];
  id v3 = (void *)[objc_alloc(MEMORY[0x263F823E8]) initWithActivityIndicatorStyle:100];
  [v3 setTranslatesAutoresizingMaskIntoConstraints:0];
  double v4 = [(WFCompactContentPreviewViewController *)self view];
  [v4 addSubview:v3];

  [(WFCompactContentPreviewViewController *)self setIndicatorView:v3];
  [v3 startAnimating];
  objc_super v14 = (void *)MEMORY[0x263F08938];
  double v5 = [v3 centerXAnchor];
  double v6 = [(WFCompactContentPreviewViewController *)self view];
  double v7 = [v6 centerXAnchor];
  double v8 = [v5 constraintEqualToAnchor:v7];
  v16[0] = v8;
  double v9 = [v3 centerYAnchor];
  double v10 = [(WFCompactContentPreviewViewController *)self view];
  double v11 = [v10 centerYAnchor];
  double v12 = [v9 constraintEqualToAnchor:v11];
  v16[1] = v12;
  double v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:v16 count:2];
  [v14 activateConstraints:v13];
}

@end