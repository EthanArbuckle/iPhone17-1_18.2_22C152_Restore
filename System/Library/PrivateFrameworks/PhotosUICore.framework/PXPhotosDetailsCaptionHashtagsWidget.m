@interface PXPhotosDetailsCaptionHashtagsWidget
- (BOOL)_fadeInEnabled;
- (BOOL)_prefersFloatingInfoPanelLayout;
- (BOOL)canSnapToEdges;
- (BOOL)captionHashtagsEntryViewShouldBeginEditing:(id)a3;
- (BOOL)captionHashtagsEntryViewShouldEndEditing:(id)a3;
- (BOOL)hasContentForCurrentInput;
- (BOOL)isInEditMode;
- (BOOL)wantsFocus;
- (CGRect)_textEntryViewFrameForSize:(CGSize)a3;
- (CGSize)contentSize;
- (CGSize)maxVisibleSizeInEditMode;
- (NSString)snappableWidgetIdentifier;
- (PHAsset)asset;
- (PXAnonymousView)contentView;
- (PXCaptionHashtagsEntryView)textEntryView;
- (PXPhotosDetailsCaptionHashtagsWidget)init;
- (PXPhotosDetailsContext)context;
- (PXWidgetDelegate)widgetDelegate;
- (PXWidgetEditingDelegate)widgetEditingDelegate;
- (PXWidgetSpec)spec;
- (UIEdgeInsets)_contentInsets;
- (UIEdgeInsets)_textViewContainerInsets;
- (UIView)separatorView;
- (UIView)textViewContainer;
- (_PXUIContainerView)containerView;
- (double)currentContentHeight;
- (double)preferredContentHeightForWidth:(double)a3;
- (id)deferredAppearingAnimation;
- (id)prepareForPhotoLibraryChange:(id)a3;
- (int64_t)exitEditChangesSavingMode;
- (void)_addSeparatorView;
- (void)_applySpec;
- (void)_configureFadeInAnimation;
- (void)_configureTextViewVisibility:(BOOL)a3;
- (void)_logCPAnalyticsEventsForCommittedCaption:(id)a3 numOfHashtags:(unint64_t)a4;
- (void)_removeSeparatorView;
- (void)captionHashtagsEntryViewDidBeginEditing:(id)a3;
- (void)captionHashtagsEntryViewDidEndEditing:(id)a3;
- (void)captionHashtagsEntryViewPreferredHeightDidChange:(id)a3;
- (void)captionHashtagsEntryViewRequestFocus:(id)a3;
- (void)contentViewDidDisappear;
- (void)contentViewWillAppear;
- (void)contentViewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
- (void)loadContentData;
- (void)photoLibraryDidChangeOnMainQueue:(id)a3 withPreparedInfo:(id)a4;
- (void)requestExitEditWithChangesSavingMode:(int64_t)a3;
- (void)setAsset:(id)a3;
- (void)setContentSize:(CGSize)a3;
- (void)setContext:(id)a3;
- (void)setDeferredAppearingAnimation:(id)a3;
- (void)setExitEditChangesSavingMode:(int64_t)a3;
- (void)setMaxVisibleSizeInEditMode:(CGSize)a3;
- (void)setSeparatorView:(id)a3;
- (void)setSpec:(id)a3;
- (void)setWidgetDelegate:(id)a3;
- (void)setWidgetEditingDelegate:(id)a3;
- (void)unloadContentData;
@end

@implementation PXPhotosDetailsCaptionHashtagsWidget

- (void).cxx_destruct
{
  objc_storeStrong(&self->_deferredAppearingAnimation, 0);
  objc_storeStrong((id *)&self->_asset, 0);
  objc_storeStrong((id *)&self->_textEntryView, 0);
  objc_storeStrong((id *)&self->_separatorView, 0);
  objc_storeStrong((id *)&self->_textViewContainer, 0);
  objc_storeStrong((id *)&self->_containerView, 0);
  objc_storeStrong((id *)&self->_spec, 0);
  objc_destroyWeak((id *)&self->_widgetDelegate);
  objc_storeStrong((id *)&self->_context, 0);
  objc_destroyWeak((id *)&self->_widgetEditingDelegate);
}

- (void)setDeferredAppearingAnimation:(id)a3
{
}

- (id)deferredAppearingAnimation
{
  return self->_deferredAppearingAnimation;
}

- (void)setExitEditChangesSavingMode:(int64_t)a3
{
  self->_exitEditChangesSavingMode = a3;
}

- (int64_t)exitEditChangesSavingMode
{
  return self->_exitEditChangesSavingMode;
}

- (void)setAsset:(id)a3
{
}

- (PHAsset)asset
{
  return (PHAsset *)objc_getProperty(self, a2, 80, 1);
}

- (CGSize)contentSize
{
  double width = self->_contentSize.width;
  double height = self->_contentSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (PXCaptionHashtagsEntryView)textEntryView
{
  return self->_textEntryView;
}

- (void)setSeparatorView:(id)a3
{
}

- (UIView)separatorView
{
  return self->_separatorView;
}

- (UIView)textViewContainer
{
  return self->_textViewContainer;
}

- (_PXUIContainerView)containerView
{
  return self->_containerView;
}

- (CGSize)maxVisibleSizeInEditMode
{
  double width = self->_maxVisibleSizeInEditMode.width;
  double height = self->_maxVisibleSizeInEditMode.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (BOOL)isInEditMode
{
  return self->_isInEditMode;
}

- (PXWidgetSpec)spec
{
  return self->_spec;
}

- (void)setWidgetDelegate:(id)a3
{
}

- (PXWidgetDelegate)widgetDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_widgetDelegate);
  return (PXWidgetDelegate *)WeakRetained;
}

- (PXPhotosDetailsContext)context
{
  return self->_context;
}

- (void)setWidgetEditingDelegate:(id)a3
{
}

- (PXWidgetEditingDelegate)widgetEditingDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_widgetEditingDelegate);
  return (PXWidgetEditingDelegate *)WeakRetained;
}

- (void)_configureFadeInAnimation
{
  v3 = +[PXPhotosDetailsSettings sharedInstance];
  [v3 captionWidgetFadeInDuration];
  v5 = v4;

  objc_initWeak(&location, self);
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __65__PXPhotosDetailsCaptionHashtagsWidget__configureFadeInAnimation__block_invoke;
  aBlock[3] = &unk_1E5DD0260;
  v9[1] = v5;
  objc_copyWeak(v9, &location);
  v6 = (void (**)(void))_Block_copy(aBlock);
  v7 = [(PXPhotosDetailsCaptionHashtagsWidget *)self containerView];

  if (v7) {
    v6[2](v6);
  }
  else {
    [(PXPhotosDetailsCaptionHashtagsWidget *)self setDeferredAppearingAnimation:v6];
  }

  objc_destroyWeak(v9);
  objc_destroyWeak(&location);
}

void __65__PXPhotosDetailsCaptionHashtagsWidget__configureFadeInAnimation__block_invoke(uint64_t a1)
{
  v1 = (void *)MEMORY[0x1E4FB1EB0];
  double v2 = *(double *)(a1 + 40);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __65__PXPhotosDetailsCaptionHashtagsWidget__configureFadeInAnimation__block_invoke_2;
  v3[3] = &unk_1E5DD32D0;
  objc_copyWeak(&v4, (id *)(a1 + 32));
  [v1 animateWithDuration:v3 animations:v2];
  objc_destroyWeak(&v4);
}

void __65__PXPhotosDetailsCaptionHashtagsWidget__configureFadeInAnimation__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _configureTextViewVisibility:1];
}

- (void)_removeSeparatorView
{
  v3 = [(PXPhotosDetailsCaptionHashtagsWidget *)self separatorView];

  if (v3)
  {
    id v4 = [(PXPhotosDetailsCaptionHashtagsWidget *)self separatorView];
    [v4 removeFromSuperview];

    [(PXPhotosDetailsCaptionHashtagsWidget *)self setSeparatorView:0];
  }
}

- (void)_addSeparatorView
{
  v3 = [(PXPhotosDetailsCaptionHashtagsWidget *)self separatorView];

  if (v3) {
    [(PXPhotosDetailsCaptionHashtagsWidget *)self _removeSeparatorView];
  }
  id v4 = [(PXPhotosDetailsCaptionHashtagsWidget *)self textViewContainer];
  [v4 frame];
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  CGFloat v12 = v11;

  v20.origin.x = v6;
  v20.origin.y = v8;
  v20.size.double width = v10;
  v20.size.double height = v12;
  CGFloat v13 = CGRectGetMaxY(v20) + -1.0;
  v21.origin.x = v6;
  v21.origin.y = v8;
  v21.size.double width = v10;
  v21.size.double height = v12;
  v14 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1EB0]), "initWithFrame:", 0.0, v13, CGRectGetWidth(v21), 1.0);
  [(PXPhotosDetailsCaptionHashtagsWidget *)self setSeparatorView:v14];

  v15 = [MEMORY[0x1E4FB1618] separatorColor];
  v16 = [v15 colorWithAlphaComponent:0.1];
  v17 = [(PXPhotosDetailsCaptionHashtagsWidget *)self separatorView];
  [v17 setBackgroundColor:v16];

  id v18 = [(PXPhotosDetailsCaptionHashtagsWidget *)self textViewContainer];
  [v18 addSubview:self->_separatorView];
}

- (void)_applySpec
{
  if ([(PXPhotosDetailsCaptionHashtagsWidget *)self _prefersFloatingInfoPanelLayout])
  {
    [(PXPhotosDetailsCaptionHashtagsWidget *)self _removeSeparatorView];
    v3 = [MEMORY[0x1E4FB1618] tertiarySystemFillColor];
    double v4 = 8.0;
  }
  else
  {
    [(PXPhotosDetailsCaptionHashtagsWidget *)self _addSeparatorView];
    v3 = [MEMORY[0x1E4FB1618] systemBackgroundColor];
    double v4 = 0.0;
  }
  double v5 = [(PXPhotosDetailsCaptionHashtagsWidget *)self textViewContainer];
  [v5 setBackgroundColor:v3];

  CGFloat v6 = [MEMORY[0x1E4FB1618] clearColor];
  double v7 = [(PXPhotosDetailsCaptionHashtagsWidget *)self textEntryView];
  CGFloat v8 = [v7 uiTextView];
  [v8 setBackgroundColor:v6];

  double v9 = [(PXPhotosDetailsCaptionHashtagsWidget *)self textViewContainer];
  CGFloat v10 = [v9 layer];
  [v10 setCornerRadius:v4];

  id v12 = [(PXPhotosDetailsCaptionHashtagsWidget *)self spec];
  double v11 = [(PXPhotosDetailsCaptionHashtagsWidget *)self textEntryView];
  [v11 setSpec:v12];
}

- (void)_configureTextViewVisibility:(BOOL)a3
{
  if (a3) {
    double v4 = 1.0;
  }
  else {
    double v4 = 0.0;
  }
  double v5 = [(PXPhotosDetailsCaptionHashtagsWidget *)self containerView];
  [v5 setAlpha:v4];

  id v7 = [(PXPhotosDetailsCaptionHashtagsWidget *)self textEntryView];
  CGFloat v6 = [v7 uiTextView];
  [v6 setAlpha:v4];
}

- (void)_logCPAnalyticsEventsForCommittedCaption:(id)a3 numOfHashtags:(unint64_t)a4
{
  v32[4] = *MEMORY[0x1E4F143B8];
  uint64_t v6 = [a3 length];
  uint64_t v7 = [(PXPhotosDetailsCaptionHashtagsWidget *)self asset];
  CGFloat v8 = (void *)v7;
  if (v6 && v7)
  {
    double v9 = (objc_class *)objc_opt_class();
    CGFloat v10 = NSStringFromClass(v9);
    double v11 = (void *)MEMORY[0x1E4F56658];
    uint64_t v13 = *MEMORY[0x1E4F56558];
    v31[0] = *MEMORY[0x1E4F56560];
    uint64_t v12 = v31[0];
    v31[1] = v13;
    v32[0] = v10;
    v32[1] = v8;
    v31[2] = @"captionLength";
    v14 = [NSNumber numberWithUnsignedInteger:v6];
    v32[2] = v14;
    v31[3] = @"numOfHashtags";
    [NSNumber numberWithUnsignedInteger:a4];
    v15 = unint64_t v26 = a4;
    v32[3] = v15;
    v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v32 forKeys:v31 count:4];
    [v11 sendEvent:@"com.apple.photos.CPAnalytics.oneUpCaptionEditExited" withPayload:v16];

    v17 = objc_msgSend(MEMORY[0x1E4F56658], "bucketNameForInteger:bucketLimits:", v6, 1, 10, 20, 30, 50, 100, 0);
    id v18 = [NSString stringWithFormat:@"%@With%@Characters", @"com.apple.photos.CPAnalytics.oneUpCaptionEditExited", v17];
    v19 = (void *)MEMORY[0x1E4F56658];
    v29[0] = v12;
    v29[1] = v13;
    uint64_t v20 = v13;
    v30[0] = v10;
    v30[1] = v8;
    CGRect v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v30 forKeys:v29 count:2];
    [v19 sendEvent:v18 withPayload:v21];

    if (v26)
    {
      v22 = objc_msgSend(MEMORY[0x1E4F56658], "bucketNameForInteger:bucketLimits:", v26, 1, 2, 3, 5, 10, 0);
      v23 = [NSString stringWithFormat:@"%@With%@Hashtags", @"com.apple.photos.CPAnalytics.oneUpCaptionEditExited", v22];
      v24 = (void *)MEMORY[0x1E4F56658];
      v27[0] = v12;
      v27[1] = v20;
      v28[0] = v10;
      v28[1] = v8;
      v25 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v28 forKeys:v27 count:2];
      [v24 sendEvent:v23 withPayload:v25];
    }
  }
}

- (CGRect)_textEntryViewFrameForSize:(CGSize)a3
{
  [(PXPhotosDetailsCaptionHashtagsWidget *)self _contentInsets];
  double v4 = [(PXPhotosDetailsCaptionHashtagsWidget *)self textViewContainer];
  [v4 bounds];

  PXEdgeInsetsInsetRect();
}

- (BOOL)_prefersFloatingInfoPanelLayout
{
  double v2 = [(PXPhotosDetailsCaptionHashtagsWidget *)self spec];
  BOOL v3 = [v2 sizeClass] == 2;

  return v3;
}

- (UIEdgeInsets)_contentInsets
{
  BOOL v3 = [(PXPhotosDetailsCaptionHashtagsWidget *)self spec];
  [v3 contentGuideInsets];
  double v5 = v4;
  double v7 = v6;

  CGFloat v8 = [(PXPhotosDetailsCaptionHashtagsWidget *)self textEntryView];
  [v8 textContainerInsets];
  double v10 = 16.0 - v9;
  double v11 = [(PXPhotosDetailsCaptionHashtagsWidget *)self textEntryView];
  [v11 textContainerInsets];
  double v13 = 16.0 - v12;

  double v14 = v10;
  double v15 = v5;
  double v16 = v13;
  double v17 = v7;
  result.right = v17;
  result.bottom = v16;
  result.left = v15;
  result.top = v14;
  return result;
}

- (void)photoLibraryDidChangeOnMainQueue:(id)a3 withPreparedInfo:(id)a4
{
  id v11 = a4;
  double v5 = [v11 objectForKeyedSubscript:@"new"];
  if (v5)
  {
    [(PXPhotosDetailsCaptionHashtagsWidget *)self setAsset:v5];
    double v6 = [v11 objectForKeyedSubscript:@"description"];
    double v7 = [(PXPhotosDetailsCaptionHashtagsWidget *)self textEntryView];
    CGFloat v8 = [v7 originalText];
    char v9 = [v8 isEqualToString:v6];

    if ((v9 & 1) == 0)
    {
      double v10 = [(PXPhotosDetailsCaptionHashtagsWidget *)self textEntryView];
      [v10 setOriginalText:v6];
    }
  }
}

- (id)prepareForPhotoLibraryChange:(id)a3
{
  v17[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  double v5 = [(PXPhotosDetailsCaptionHashtagsWidget *)self asset];
  double v6 = [v4 changeDetailsForObject:v5];

  double v7 = [v6 objectAfterChanges];
  CGFloat v8 = v7;
  if (v7)
  {
    [v7 fetchPropertySetsIfNeeded];
    char v9 = [v8 descriptionProperties];
    uint64_t v10 = [v9 assetDescription];
    id v11 = (void *)v10;
    double v12 = &stru_1F00B0030;
    if (v10) {
      double v12 = (__CFString *)v10;
    }
    double v13 = v12;

    v16[0] = @"new";
    v16[1] = @"description";
    v17[0] = v8;
    v17[1] = v13;
    double v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:v16 count:2];
  }
  else
  {
    double v14 = 0;
  }

  return v14;
}

- (void)captionHashtagsEntryViewRequestFocus:(id)a3
{
  id v4 = [(PXPhotosDetailsCaptionHashtagsWidget *)self widgetDelegate];
  [v4 widgetRequestFocus:self];
}

- (void)captionHashtagsEntryViewDidEndEditing:(id)a3
{
  id v4 = [(PXPhotosDetailsCaptionHashtagsWidget *)self asset];
  double v5 = [v4 descriptionProperties];
  uint64_t v6 = [v5 assetDescription];
  double v7 = (void *)v6;
  if (v6) {
    CGFloat v8 = (__CFString *)v6;
  }
  else {
    CGFloat v8 = &stru_1F00B0030;
  }
  char v9 = v8;

  uint64_t v10 = [(PXPhotosDetailsCaptionHashtagsWidget *)self textEntryView];
  uint64_t v11 = [v10 text];
  double v12 = (void *)v11;
  if (v11) {
    double v13 = (__CFString *)v11;
  }
  else {
    double v13 = &stru_1F00B0030;
  }
  double v14 = v13;

  if (([(__CFString *)v9 isEqualToString:v14] & 1) == 0)
  {
    int64_t v15 = [(PXPhotosDetailsCaptionHashtagsWidget *)self exitEditChangesSavingMode];
    if (v15)
    {
      if (v15 == 1)
      {
        double v16 = [(PXPhotosDetailsCaptionHashtagsWidget *)self textEntryView];
        [v16 setOriginalText:v14];

        dispatch_time_t v17 = dispatch_time(0, 200000000);
        id v18 = dispatch_get_global_queue(25, 0);
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __78__PXPhotosDetailsCaptionHashtagsWidget_captionHashtagsEntryViewDidEndEditing___block_invoke;
        block[3] = &unk_1E5DD32A8;
        id v31 = v4;
        v32 = v14;
        dispatch_after(v17, v18, block);
      }
    }
    else
    {
      v19 = [(PXPhotosDetailsCaptionHashtagsWidget *)self textEntryView];
      [v19 resetToOriginalText];
    }
    uint64_t v20 = [(PXPhotosDetailsCaptionHashtagsWidget *)self textEntryView];
    -[PXPhotosDetailsCaptionHashtagsWidget _logCPAnalyticsEventsForCommittedCaption:numOfHashtags:](self, "_logCPAnalyticsEventsForCommittedCaption:numOfHashtags:", v14, [v20 numberOfHashtagsInText]);
  }
  [(PXPhotosDetailsCaptionHashtagsWidget *)self setExitEditChangesSavingMode:1];
  self->_isInEditMode = 0;
  CGRect v21 = [(PXPhotosDetailsCaptionHashtagsWidget *)self widgetEditingDelegate];
  if (objc_opt_respondsToSelector()) {
    [v21 widget:self didChangeEditingMode:0];
  }
  v22 = [(PXPhotosDetailsCaptionHashtagsWidget *)self widgetDelegate];
  uint64_t v24 = MEMORY[0x1E4F143A8];
  uint64_t v25 = 3221225472;
  unint64_t v26 = __78__PXPhotosDetailsCaptionHashtagsWidget_captionHashtagsEntryViewDidEndEditing___block_invoke_217;
  v27 = &unk_1E5DD32A8;
  id v23 = v22;
  id v28 = v23;
  v29 = self;
  [v23 widget:self animateChanges:&v24 withAnimationOptions:0];
  if (objc_opt_respondsToSelector()) {
    objc_msgSend(v21, "widgetEditorHeightDidChange:", self, v24, v25, v26, v27);
  }
}

void __78__PXPhotosDetailsCaptionHashtagsWidget_captionHashtagsEntryViewDidEndEditing___block_invoke(uint64_t a1)
{
  double v2 = [*(id *)(a1 + 32) photoLibrary];
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __78__PXPhotosDetailsCaptionHashtagsWidget_captionHashtagsEntryViewDidEndEditing___block_invoke_2;
  v3[3] = &unk_1E5DD32A8;
  id v4 = *(id *)(a1 + 32);
  id v5 = *(id *)(a1 + 40);
  [v2 performChanges:v3 completionHandler:&__block_literal_global_23176];
}

uint64_t __78__PXPhotosDetailsCaptionHashtagsWidget_captionHashtagsEntryViewDidEndEditing___block_invoke_217(uint64_t a1)
{
  return [*(id *)(a1 + 32) widgetPreferredContentHeightForWidthDidChange:*(void *)(a1 + 40)];
}

void __78__PXPhotosDetailsCaptionHashtagsWidget_captionHashtagsEntryViewDidEndEditing___block_invoke_2(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4F38ED0] changeRequestForAsset:*(void *)(a1 + 32)];
  [v2 setAssetDescription:*(void *)(a1 + 40)];
}

void __78__PXPhotosDetailsCaptionHashtagsWidget_captionHashtagsEntryViewDidEndEditing___block_invoke_3(uint64_t a1, char a2, void *a3)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ((a2 & 1) == 0)
  {
    id v5 = PLOneUpGetLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      int v6 = 138412290;
      id v7 = v4;
      _os_log_impl(&dword_1A9AE7000, v5, OS_LOG_TYPE_ERROR, "Saving assetDescription failed with error: %@", (uint8_t *)&v6, 0xCu);
    }
  }
}

- (BOOL)captionHashtagsEntryViewShouldEndEditing:(id)a3
{
  return 1;
}

- (void)captionHashtagsEntryViewDidBeginEditing:(id)a3
{
  self->_isInEditMode = 1;
  id v4 = [(PXPhotosDetailsCaptionHashtagsWidget *)self widgetEditingDelegate];
  if (objc_opt_respondsToSelector()) {
    [v4 widget:self didChangeEditingMode:1];
  }
  id v5 = [(PXPhotosDetailsCaptionHashtagsWidget *)self widgetDelegate];
  uint64_t v7 = MEMORY[0x1E4F143A8];
  uint64_t v8 = 3221225472;
  char v9 = __80__PXPhotosDetailsCaptionHashtagsWidget_captionHashtagsEntryViewDidBeginEditing___block_invoke;
  uint64_t v10 = &unk_1E5DD32A8;
  id v6 = v5;
  id v11 = v6;
  double v12 = self;
  [v6 widget:self animateChanges:&v7 withAnimationOptions:0];
  if (objc_opt_respondsToSelector()) {
    objc_msgSend(v4, "widgetEditorHeightDidChange:", self, v7, v8, v9, v10);
  }
}

uint64_t __80__PXPhotosDetailsCaptionHashtagsWidget_captionHashtagsEntryViewDidBeginEditing___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) widgetPreferredContentHeightForWidthDidChange:*(void *)(a1 + 40)];
}

- (BOOL)captionHashtagsEntryViewShouldBeginEditing:(id)a3
{
  BOOL v3 = [(PXPhotosDetailsCaptionHashtagsWidget *)self asset];
  char v4 = [v3 canPerformEditOperation:3];

  return v4;
}

- (void)captionHashtagsEntryViewPreferredHeightDidChange:(id)a3
{
  char v4 = [(PXPhotosDetailsCaptionHashtagsWidget *)self widgetDelegate];
  uint64_t v7 = MEMORY[0x1E4F143A8];
  uint64_t v8 = 3221225472;
  char v9 = __89__PXPhotosDetailsCaptionHashtagsWidget_captionHashtagsEntryViewPreferredHeightDidChange___block_invoke;
  uint64_t v10 = &unk_1E5DD32A8;
  id v5 = v4;
  id v11 = v5;
  double v12 = self;
  [v5 widget:self animateChanges:&v7 withAnimationOptions:0];
  id v6 = [(PXPhotosDetailsCaptionHashtagsWidget *)self widgetEditingDelegate];
  if (objc_opt_respondsToSelector()) {
    [v6 widgetEditorHeightDidChange:self];
  }
}

uint64_t __89__PXPhotosDetailsCaptionHashtagsWidget_captionHashtagsEntryViewPreferredHeightDidChange___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) widgetPreferredContentHeightForWidthDidChange:*(void *)(a1 + 40)];
}

- (void)setMaxVisibleSizeInEditMode:(CGSize)a3
{
  if (a3.width != self->_maxVisibleSizeInEditMode.width || a3.height != self->_maxVisibleSizeInEditMode.height)
  {
    self->_maxVisibleSizeInEditMode = a3;
    -[PXPhotosDetailsCaptionHashtagsWidget _textEntryViewFrameForSize:](self, "_textEntryViewFrameForSize:");
    double v6 = v5;
    id v7 = [(PXPhotosDetailsCaptionHashtagsWidget *)self textEntryView];
    [v7 setMaxHeightInEditMode:v6];
  }
}

- (NSString)snappableWidgetIdentifier
{
  return (NSString *)@"PXPhotosDetailsCaptionHashtagsWidget";
}

- (BOOL)canSnapToEdges
{
  return 1;
}

- (BOOL)wantsFocus
{
  id v2 = [(PXPhotosDetailsCaptionHashtagsWidget *)self textEntryView];
  char v3 = [v2 isEditing];

  return v3;
}

- (void)requestExitEditWithChangesSavingMode:(int64_t)a3
{
  [(PXPhotosDetailsCaptionHashtagsWidget *)self setExitEditChangesSavingMode:a3];
  id v4 = [(PXPhotosDetailsCaptionHashtagsWidget *)self textEntryView];
  [v4 exitEditing];
}

- (void)contentViewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  id v5 = a4;
  [(PXPhotosDetailsCaptionHashtagsWidget *)self _textViewContainerInsets];
  PXEdgeInsetsInsetRect();
}

void __98__PXPhotosDetailsCaptionHashtagsWidget_contentViewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  double v2 = *(double *)(a1 + 40);
  double v3 = *(double *)(a1 + 48);
  double v4 = *(double *)(a1 + 56);
  double v5 = *(double *)(a1 + 64);
  double v6 = [*(id *)(a1 + 32) textViewContainer];
  objc_msgSend(v6, "setFrame:", v2, v3, v4, v5);

  double v7 = *(double *)(a1 + 72);
  double v8 = *(double *)(a1 + 80);
  double v9 = *(double *)(a1 + 88);
  double v10 = *(double *)(a1 + 96);
  id v11 = [*(id *)(a1 + 32) separatorView];
  objc_msgSend(v11, "setFrame:", v7, v8, v9, v10);

  double v12 = *(double *)(a1 + 104);
  double v13 = *(double *)(a1 + 112);
  double v14 = *(double *)(a1 + 120);
  double v15 = *(double *)(a1 + 128);
  id v16 = [*(id *)(a1 + 32) textEntryView];
  objc_msgSend(v16, "setFrame:", v12, v13, v14, v15);
}

- (void)contentViewDidDisappear
{
  if ([(PXPhotosDetailsCaptionHashtagsWidget *)self _fadeInEnabled])
  {
    [(PXPhotosDetailsCaptionHashtagsWidget *)self _configureTextViewVisibility:0];
  }
}

- (void)contentViewWillAppear
{
  if ([(PXPhotosDetailsCaptionHashtagsWidget *)self _fadeInEnabled])
  {
    [(PXPhotosDetailsCaptionHashtagsWidget *)self _configureFadeInAnimation];
  }
}

- (UIEdgeInsets)_textViewContainerInsets
{
  if ([(PXPhotosDetailsCaptionHashtagsWidget *)self _prefersFloatingInfoPanelLayout]) {
    PXEdgeInsetsMake();
  }
  double v2 = *(double *)off_1E5DAAF10;
  double v3 = *((double *)off_1E5DAAF10 + 1);
  double v4 = *((double *)off_1E5DAAF10 + 2);
  double v5 = *((double *)off_1E5DAAF10 + 3);
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (BOOL)_fadeInEnabled
{
  if ([(PXPhotosDetailsCaptionHashtagsWidget *)self _prefersFloatingInfoPanelLayout]) {
    return 0;
  }
  double v3 = +[PXPhotosDetailsSettings sharedInstance];
  char v4 = [v3 captionWidgetEnableFadeInEffect];

  return v4;
}

- (PXAnonymousView)contentView
{
  containerView = self->_containerView;
  if (!containerView)
  {
    [(PXPhotosDetailsCaptionHashtagsWidget *)self contentSize];
    PXSizeIsNull();
  }
  double v3 = containerView;
  return (PXAnonymousView *)v3;
}

- (void)unloadContentData
{
  objc_msgSend(MEMORY[0x1E4F39228], "px_deprecated_appPhotoLibrary");
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "px_unregisterChangeObserver:", self);
}

- (void)loadContentData
{
  objc_msgSend(MEMORY[0x1E4F39228], "px_deprecated_appPhotoLibrary");
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "px_registerChangeObserver:", self);
}

- (void)setContext:(id)a3
{
  double v5 = (PXPhotosDetailsContext *)a3;
  if (self->_context != v5)
  {
    objc_storeStrong((id *)&self->_context, a3);
    double v6 = [(PXPhotosDetailsContext *)v5 firstAsset];
    [(PXPhotosDetailsCaptionHashtagsWidget *)self setAsset:v6];
    double v7 = [v6 descriptionProperties];
    double v8 = [v7 assetDescription];
    double v9 = [(PXPhotosDetailsCaptionHashtagsWidget *)self textEntryView];
    [v9 setOriginalText:v8];

    if (!v6)
    {
      double v10 = PLOneUpGetLog();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)id v11 = 0;
        _os_log_impl(&dword_1A9AE7000, v10, OS_LOG_TYPE_ERROR, "No asset is in the photos details context!", v11, 2u);
      }
    }
  }
}

- (void)setContentSize:(CGSize)a3
{
  self->_contentSize = a3;
}

- (double)preferredContentHeightForWidth:(double)a3
{
  [(PXPhotosDetailsCaptionHashtagsWidget *)self _contentInsets];
  double v6 = v5;
  double v8 = v7;
  double v11 = fmax(a3 - (v9 + v10), 0.0);
  double v12 = [(PXPhotosDetailsCaptionHashtagsWidget *)self textEntryView];
  [v12 preferredHeightForWidth:v11];
  double v14 = v13;

  return v8 + v6 + v14;
}

- (double)currentContentHeight
{
  double v2 = [(PXPhotosDetailsCaptionHashtagsWidget *)self contentView];
  [v2 frame];
  double Height = CGRectGetHeight(v5);

  return Height;
}

- (BOOL)hasContentForCurrentInput
{
  double v2 = [(PXPhotosDetailsCaptionHashtagsWidget *)self asset];
  if ([v2 canPerformEditOperation:3])
  {
    BOOL v3 = 1;
  }
  else
  {
    char v4 = [v2 descriptionProperties];
    CGRect v5 = [v4 assetDescription];
    BOOL v3 = [v5 length] != 0;
  }
  return v3;
}

- (void)setSpec:(id)a3
{
  CGRect v5 = (PXWidgetSpec *)a3;
  if (self->_spec != v5)
  {
    double v7 = v5;
    objc_storeStrong((id *)&self->_spec, a3);
    [(PXPhotosDetailsCaptionHashtagsWidget *)self _applySpec];
    double v6 = [(PXPhotosDetailsCaptionHashtagsWidget *)self widgetDelegate];
    [v6 widgetPreferredContentHeightForWidthDidChange:self];

    CGRect v5 = v7;
  }
}

- (PXPhotosDetailsCaptionHashtagsWidget)init
{
  v14.receiver = self;
  v14.super_class = (Class)PXPhotosDetailsCaptionHashtagsWidget;
  double v2 = [(PXPhotosDetailsCaptionHashtagsWidget *)&v14 init];
  BOOL v3 = (PXPhotosDetailsCaptionHashtagsWidget *)v2;
  if (v2)
  {
    *(_OWORD *)(v2 + 120) = *(_OWORD *)off_1E5DAB030;
    *((void *)v2 + 11) = 1;
    char v4 = [PXCaptionHashtagsEntryView alloc];
    double v5 = *MEMORY[0x1E4F1DB28];
    double v6 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v7 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v8 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
    uint64_t v9 = -[PXCaptionHashtagsEntryView initWithFrame:](v4, "initWithFrame:", *MEMORY[0x1E4F1DB28], v6, v7, v8);
    textEntryView = v3->_textEntryView;
    v3->_textEntryView = (PXCaptionHashtagsEntryView *)v9;

    uint64_t v11 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1EB0]), "initWithFrame:", v5, v6, v7, v8);
    textViewContainer = v3->_textViewContainer;
    v3->_textViewContainer = (UIView *)v11;
  }
  return v3;
}

@end