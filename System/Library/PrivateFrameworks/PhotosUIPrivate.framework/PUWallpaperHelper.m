@interface PUWallpaperHelper
+ (id)deleteSuggestionAction:(id)a3;
+ (id)fileRadarActionForComponent:(int64_t)a3 title:(id)a4 suggestion:(id)a5 asset:(id)a6 actionBeingHandler:(id)a7 actionEndHandler:(id)a8;
+ (id)fileRadarSubmenuForSuggestion:(id)a3 asset:(id)a4 actionBeingHandler:(id)a5 actionEndHandler:(id)a6;
+ (id)presentPosterEditorWithAsset:(id)a3 fromViewController:(id)a4;
+ (id)rejectSuggestionAction:(id)a3;
@end

@implementation PUWallpaperHelper

+ (id)fileRadarActionForComponent:(int64_t)a3 title:(id)a4 suggestion:(id)a5 asset:(id)a6 actionBeingHandler:(id)a7 actionEndHandler:(id)a8
{
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  id v16 = a8;
  v17 = (void *)MEMORY[0x1E4FB13F0];
  v18 = (void *)MEMORY[0x1E4FB1818];
  id v19 = a4;
  v20 = [v18 systemImageNamed:@"ant.circle"];
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __108__PUWallpaperHelper_fileRadarActionForComponent_title_suggestion_asset_actionBeingHandler_actionEndHandler___block_invoke;
  v27[3] = &unk_1E5F2A1A8;
  id v28 = v14;
  id v29 = v13;
  id v31 = v16;
  int64_t v32 = a3;
  id v30 = v15;
  id v21 = v16;
  id v22 = v13;
  id v23 = v14;
  id v24 = v15;
  v25 = [v17 actionWithTitle:v19 image:v20 identifier:0 handler:v27];

  return v25;
}

void __108__PUWallpaperHelper_fileRadarActionForComponent_title_suggestion_asset_actionBeingHandler_actionEndHandler___block_invoke(void *a1)
{
  uint64_t v2 = a1[6];
  if (v2) {
    (*(void (**)(void))(v2 + 16))();
  }
  id v3 = +[PUWallpaperRadarAttachmentProvider radarConfigurationForAsset:a1[4] suggestion:a1[5] compoundLayerStack:0 segmentationItem:0 posterDescriptor:0 posterConfiguration:0 component:a1[8] completionHandler:a1[7]];
  PXFileRadarWithConfiguration();
}

+ (id)fileRadarSubmenuForSuggestion:(id)a3 asset:(id)a4 actionBeingHandler:(id)a5 actionEndHandler:(id)a6
{
  v24[5] = *MEMORY[0x1E4F143B8];
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  id v14 = [a1 fileRadarActionForComponent:9 title:@"File General Radar" suggestion:v13 asset:v12 actionBeingHandler:v11 actionEndHandler:v10];
  id v15 = objc_msgSend(a1, "fileRadarActionForComponent:title:suggestion:asset:actionBeingHandler:actionEndHandler:", 7, @"File UI Radar", v13, v12, v11, v10, v14);
  v24[1] = v15;
  id v16 = [a1 fileRadarActionForComponent:8 title:@"File Curation Radar" suggestion:v13 asset:v12 actionBeingHandler:v11 actionEndHandler:v10];
  v24[2] = v16;
  v17 = [a1 fileRadarActionForComponent:9 title:@"File Feedback Radar" suggestion:v13 asset:v12 actionBeingHandler:v11 actionEndHandler:v10];
  v24[3] = v17;
  v18 = [a1 fileRadarActionForComponent:10 title:@"File Imaging Radar" suggestion:v13 asset:v12 actionBeingHandler:v11 actionEndHandler:v10];

  v24[4] = v18;
  id v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v24 count:5];

  v20 = (void *)MEMORY[0x1E4FB1970];
  id v21 = [MEMORY[0x1E4FB1818] systemImageNamed:@"ant.circle"];
  id v22 = [v20 menuWithTitle:@"File Radar" image:v21 identifier:0 options:32 children:v19];

  return v22;
}

+ (id)presentPosterEditorWithAsset:(id)a3 fromViewController:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = (void *)MEMORY[0x1E4FB13F0];
  v8 = [MEMORY[0x1E4FB1818] systemImageNamed:@"slider.horizontal.3"];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __69__PUWallpaperHelper_presentPosterEditorWithAsset_fromViewController___block_invoke;
  v13[3] = &unk_1E5F2A180;
  id v14 = v5;
  id v15 = v6;
  id v9 = v6;
  id v10 = v5;
  id v11 = [v7 actionWithTitle:@"Edit Poster" image:v8 identifier:0 handler:v13];

  return v11;
}

void __69__PUWallpaperHelper_presentPosterEditorWithAsset_fromViewController___block_invoke(uint64_t a1)
{
  uint64_t v2 = [[PUWallpaperPosterEditDebugViewController alloc] initWithAsset:*(void *)(a1 + 32)];
  [(PUWallpaperPosterEditDebugViewController *)v2 setModalPresentationStyle:5];
  [*(id *)(a1 + 40) presentViewController:v2 animated:1 completion:0];
}

+ (id)rejectSuggestionAction:(id)a3
{
  id v3 = a3;
  v4 = (void *)MEMORY[0x1E4FB13F0];
  id v5 = [MEMORY[0x1E4FB1818] systemImageNamed:@"xmark.circle"];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __44__PUWallpaperHelper_rejectSuggestionAction___block_invoke;
  v9[3] = &unk_1E5F2ADC0;
  id v10 = v3;
  id v6 = v3;
  v7 = [v4 actionWithTitle:@"Reject Suggestion" image:v5 identifier:0 handler:v9];

  [v7 setAttributes:2];
  return v7;
}

void __44__PUWallpaperHelper_rejectSuggestionAction___block_invoke(uint64_t a1)
{
  v1 = (void *)MEMORY[0x1E4F8E858];
  uint64_t v2 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __44__PUWallpaperHelper_rejectSuggestionAction___block_invoke_2;
  v3[3] = &unk_1E5F2E3B8;
  id v4 = v2;
  [v1 rejectWallpaperSuggestionsUsingAssetOfSuggestion:v4 completionHandler:v3];
}

void __44__PUWallpaperHelper_rejectSuggestionAction___block_invoke_2(uint64_t a1, char a2, void *a3)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if ((a2 & 1) == 0)
  {
    id v6 = PLUIGetLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v7 = [*(id *)(a1 + 32) localIdentifier];
      int v8 = 138412546;
      id v9 = v7;
      __int16 v10 = 2112;
      id v11 = v5;
      _os_log_impl(&dword_1AE9F8000, v6, OS_LOG_TYPE_ERROR, "Failed rejecting Suggesstion %@, error: %@", (uint8_t *)&v8, 0x16u);
    }
  }
}

+ (id)deleteSuggestionAction:(id)a3
{
  id v3 = a3;
  id v4 = (void *)MEMORY[0x1E4FB13F0];
  id v5 = [MEMORY[0x1E4FB1818] systemImageNamed:@"trash"];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __44__PUWallpaperHelper_deleteSuggestionAction___block_invoke;
  v9[3] = &unk_1E5F2ADC0;
  id v10 = v3;
  id v6 = v3;
  v7 = [v4 actionWithTitle:@"Delete Suggestion" image:v5 identifier:0 handler:v9];

  [v7 setAttributes:2];
  return v7;
}

void __44__PUWallpaperHelper_deleteSuggestionAction___block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) photoLibrary];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __44__PUWallpaperHelper_deleteSuggestionAction___block_invoke_2;
  v8[3] = &unk_1E5F2ED10;
  id v9 = *(id *)(a1 + 32);
  id v7 = 0;
  char v3 = [v2 performChangesAndWait:v8 error:&v7];
  id v4 = v7;
  if ((v3 & 1) == 0)
  {
    id v5 = PLUIGetLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      id v6 = [*(id *)(a1 + 32) localIdentifier];
      *(_DWORD *)buf = 138412546;
      id v11 = v6;
      __int16 v12 = 2112;
      id v13 = v4;
      _os_log_impl(&dword_1AE9F8000, v5, OS_LOG_TYPE_ERROR, "Failed deleting Suggesstion %@, error: %@", buf, 0x16u);
    }
  }
}

void __44__PUWallpaperHelper_deleteSuggestionAction___block_invoke_2(uint64_t a1)
{
  v3[1] = *MEMORY[0x1E4F143B8];
  v1 = (void *)MEMORY[0x1E4F39318];
  v3[0] = *(void *)(a1 + 32);
  uint64_t v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v3 count:1];
  [v1 deleteSuggestions:v2];
}

@end