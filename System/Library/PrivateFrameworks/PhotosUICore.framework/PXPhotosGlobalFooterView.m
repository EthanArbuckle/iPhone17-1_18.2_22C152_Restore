@interface PXPhotosGlobalFooterView
- (BOOL)_shouldUseActionLinkInSubtitle1;
- (BOOL)_shouldUseActionLinkInSubtitle2;
- (BOOL)needsWorkaroundFor53118165;
- (CGSize)_performLayoutInWidth:(double)a3 updateSubviewFrames:(BOOL)a4;
- (CGSize)sizeThatFits:(CGSize)a3;
- (PXFooterViewModel)viewModel;
- (PXPhotosGlobalFooterView)initWithFrame:(CGRect)a3;
- (PXPhotosGlobalFooterView)initWithFrame:(CGRect)a3 needsWorkaroundFor53118165:(BOOL)a4;
- (PXPhotosGlobalFooterViewDelegate)delegate;
- (PXPhotosGlobalFooterViewLayoutDelegate)layoutDelegate;
- (UIColor)labelColor;
- (double)currentHeight;
- (id)textView:(id)a3 menuConfigurationForTextItem:(id)a4 defaultMenu:(id)a5;
- (id)textView:(id)a3 primaryActionForTextItem:(id)a4 defaultAction:(id)a5;
- (void)_animatedIconCrossedGridCycleBoundary;
- (void)_configurePhotoCollectionGlobalFooterExtendedTitleLabel:(id)a3;
- (void)_configurePhotoCollectionGlobalFooterInternalMessageSubtitleLabel:(id)a3;
- (void)_configurePhotoCollectionGlobalFooterLabel:(id)a3 withFont:(id)a4 textColor:(id)a5;
- (void)_configurePhotoCollectionGlobalFooterSubtitleLabel:(id)a3;
- (void)_configurePhotoCollectionGlobalFooterTitleLabel:(id)a3;
- (void)_contentSizeCategoryDidChangeNotification:(id)a3;
- (void)_performActionFromView:(id)a3 sourceRect:(CGRect)a4;
- (void)_updateAccessory;
- (void)_updateAnimatedIcon;
- (void)_updateExtendedTitle;
- (void)_updateFilterView;
- (void)_updateInternalMessageSubtitle;
- (void)_updateLabelColor;
- (void)_updateProcessingView;
- (void)_updateProgressAnimated:(BOOL)a3;
- (void)_updateSubtitle1;
- (void)_updateSubtitle2;
- (void)_updateTitle;
- (void)_updateTopAccessory;
- (void)didMoveToWindow;
- (void)layoutSubviews;
- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5;
- (void)setDelegate:(id)a3;
- (void)setHidden:(BOOL)a3;
- (void)setLabelColor:(id)a3;
- (void)setLayoutDelegate:(id)a3;
- (void)setViewModel:(id)a3;
@end

@implementation PXPhotosGlobalFooterView

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_labelColor, 0);
  objc_destroyWeak((id *)&self->_layoutDelegate);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_viewModel, 0);
  objc_storeStrong((id *)&self->_processingView, 0);
  objc_storeStrong((id *)&self->_progressView, 0);
  objc_storeStrong((id *)&self->_subtitle2Label, 0);
  objc_storeStrong((id *)&self->_subtitle2TextView, 0);
  objc_storeStrong((id *)&self->_subtitle1TextView, 0);
  objc_storeStrong((id *)&self->_internalMessageSubtitleLabel, 0);
  objc_storeStrong((id *)&self->_extendedTitleLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
  objc_storeStrong((id *)&self->_animatedIconView, 0);
  objc_storeStrong((id *)&self->_filterView, 0);
  objc_storeStrong((id *)&self->_topAccessoryView, 0);
  objc_storeStrong((id *)&self->_accessoryView, 0);
}

- (void)setLabelColor:(id)a3
{
}

- (UIColor)labelColor
{
  return self->_labelColor;
}

- (BOOL)needsWorkaroundFor53118165
{
  return self->_needsWorkaroundFor53118165;
}

- (void)setLayoutDelegate:(id)a3
{
}

- (PXPhotosGlobalFooterViewLayoutDelegate)layoutDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_layoutDelegate);
  return (PXPhotosGlobalFooterViewLayoutDelegate *)WeakRetained;
}

- (PXPhotosGlobalFooterViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (PXPhotosGlobalFooterViewDelegate *)WeakRetained;
}

- (PXFooterViewModel)viewModel
{
  return self->_viewModel;
}

- (double)currentHeight
{
  return self->_currentHeight;
}

- (id)textView:(id)a3 menuConfigurationForTextItem:(id)a4 defaultMenu:(id)a5
{
  return 0;
}

- (id)textView:(id)a3 primaryActionForTextItem:(id)a4 defaultAction:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([v9 contentType] == 2
    && ([v9 tagIdentifier],
        v11 = objc_claimAutoreleasedReturnValue(),
        int v12 = [v11 isEqualToString:@"com.apple.photos.ui.link-action"],
        v11,
        v12))
  {
    objc_initWeak(&location, self);
    v13 = (void *)MEMORY[0x1E4FB13F0];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __76__PXPhotosGlobalFooterView_textView_primaryActionForTextItem_defaultAction___block_invoke;
    v16[3] = &unk_1E5DD1098;
    id v17 = v8;
    id v18 = v9;
    objc_copyWeak(&v19, &location);
    v14 = [v13 actionWithHandler:v16];
    objc_destroyWeak(&v19);

    objc_destroyWeak(&location);
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

void __76__PXPhotosGlobalFooterView_textView_primaryActionForTextItem_defaultAction___block_invoke(id *a1)
{
  id v17 = [a1[4] layoutManager];
  uint64_t v2 = [a1[5] range];
  uint64_t v4 = objc_msgSend(v17, "glyphRangeForCharacterRange:actualCharacterRange:", v2, v3, 0);
  uint64_t v6 = v5;
  v7 = [a1[4] textContainer];
  objc_msgSend(v17, "boundingRectForGlyphRange:inTextContainer:", v4, v6, v7);
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;

  id WeakRetained = objc_loadWeakRetained(a1 + 6);
  objc_msgSend(WeakRetained, "_performActionFromView:sourceRect:", a1[4], v9, v11, v13, v15);
}

- (void)_performActionFromView:(id)a3 sourceRect:(CGRect)a4
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  double v10 = [(PXPhotosGlobalFooterView *)self viewModel];
  double v11 = [v10 action];
  if (v11)
  {
    uint64_t v12 = [v10 actionConfirmationAlertTitle];
    if (v12
      && (double v13 = (void *)v12,
          [v10 actionConfirmationAlertButtonTitle],
          double v14 = objc_claimAutoreleasedReturnValue(),
          v14,
          v13,
          v14))
    {
      double v15 = PLUserStatusUIGetLog();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        v16 = [v10 actionTitle];
        *(_DWORD *)buf = 138543362;
        v43 = v16;
        _os_log_impl(&dword_1A9AE7000, v15, OS_LOG_TYPE_DEFAULT, "Presenting confirmation alert for action with title: %{public}@", buf, 0xCu);
      }
      id v17 = (void *)MEMORY[0x1E4FB1418];
      id v18 = [v10 actionConfirmationAlertTitle];
      id v19 = [v17 alertControllerWithTitle:v18 message:0 preferredStyle:0];

      unint64_t v20 = [v10 actionStyle];
      if (v20 >= 3)
      {
        v33 = [MEMORY[0x1E4F28B00] currentHandler];
        v34 = [NSString stringWithUTF8String:"UIAlertActionStyle UIAlertActionStyleFromPXAlertActionStyle(PXAlertActionStyle)"];
        [v33 handleFailureInFunction:v34 file:@"PXAlertActionStyle.h" lineNumber:43 description:@"Code which should be unreachable has been reached"];

        abort();
      }
      unint64_t v21 = v20;
      v22 = (void *)MEMORY[0x1E4FB1410];
      v23 = [v10 actionConfirmationAlertButtonTitle];
      v38[0] = MEMORY[0x1E4F143A8];
      v38[1] = 3221225472;
      v38[2] = __62__PXPhotosGlobalFooterView__performActionFromView_sourceRect___block_invoke;
      v38[3] = &unk_1E5DD1040;
      id v24 = v10;
      id v39 = v24;
      v40 = self;
      v41 = v11;
      v25 = [v22 actionWithTitle:v23 style:v21 handler:v38];
      [v19 addAction:v25];

      v26 = (void *)MEMORY[0x1E4FB1410];
      v27 = PXLocalizedStringFromTable(@"PXCancel", @"PhotosUICore");
      v35[0] = MEMORY[0x1E4F143A8];
      v35[1] = 3221225472;
      v35[2] = __62__PXPhotosGlobalFooterView__performActionFromView_sourceRect___block_invoke_249;
      v35[3] = &unk_1E5DD1068;
      id v36 = v24;
      v37 = self;
      v28 = [v26 actionWithTitle:v27 style:1 handler:v35];
      [v19 addAction:v28];

      v29 = [v19 popoverPresentationController];
      [v29 setSourceView:v9];

      v30 = [v19 popoverPresentationController];
      objc_msgSend(v30, "setSourceRect:", x, y, width, height);

      v31 = [v19 popoverPresentationController];
      [v31 setPermittedArrowDirections:2];

      v32 = [(PXPhotosGlobalFooterView *)self delegate];
      [v32 photosGlobalFooterView:self presentViewController:v19];

      self->_isPresentingAlert = 1;
    }
    else
    {
      v11[2](v11);
    }
  }
}

uint64_t __62__PXPhotosGlobalFooterView__performActionFromView_sourceRect___block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = PLUserStatusUIGetLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = [*(id *)(a1 + 32) actionTitle];
    int v5 = 138543362;
    uint64_t v6 = v3;
    _os_log_impl(&dword_1A9AE7000, v2, OS_LOG_TYPE_DEFAULT, "User confirmed action with title: %{public}@", (uint8_t *)&v5, 0xCu);
  }
  *(unsigned char *)(*(void *)(a1 + 40) + 600) = 0;
  return (*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16))();
}

void __62__PXPhotosGlobalFooterView__performActionFromView_sourceRect___block_invoke_249(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = PLUserStatusUIGetLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = [*(id *)(a1 + 32) actionTitle];
    int v4 = 138543362;
    int v5 = v3;
    _os_log_impl(&dword_1A9AE7000, v2, OS_LOG_TYPE_DEFAULT, "User dismissed action with title: %{public}@", (uint8_t *)&v4, 0xCu);
  }
  *(unsigned char *)(*(void *)(a1 + 40) + 600) = 0;
}

- (void)_contentSizeCategoryDidChangeNotification:(id)a3
{
  [(PXPhotosGlobalFooterView *)self _updateTitle];
  [(PXPhotosGlobalFooterView *)self _updateExtendedTitle];
  [(PXPhotosGlobalFooterView *)self _updateInternalMessageSubtitle];
  [(PXPhotosGlobalFooterView *)self _updateSubtitle1];
  [(PXPhotosGlobalFooterView *)self _updateSubtitle2];
  [(PXPhotosGlobalFooterView *)self setNeedsLayout];
}

- (void)layoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)PXPhotosGlobalFooterView;
  [(PXPhotosGlobalFooterView *)&v4 layoutSubviews];
  [(PXPhotosGlobalFooterView *)self bounds];
  [(PXPhotosGlobalFooterView *)self _performLayoutInWidth:1 updateSubviewFrames:v3];
}

- (void)didMoveToWindow
{
  v4.receiver = self;
  v4.super_class = (Class)PXPhotosGlobalFooterView;
  [(PXPhotosGlobalFooterView *)&v4 didMoveToWindow];
  if (self->_delegateRespondsTo.photosGlobalFooterViewDidMoveToWindow)
  {
    double v3 = [(PXPhotosGlobalFooterView *)self delegate];
    [v3 photosGlobalFooterViewDidMoveToWindow:self];
  }
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  -[PXPhotosGlobalFooterView _performLayoutInWidth:updateSubviewFrames:](self, "_performLayoutInWidth:updateSubviewFrames:", 0, a3.width, a3.height);
  result.double height = v4;
  result.double width = v3;
  return result;
}

- (CGSize)_performLayoutInWidth:(double)a3 updateSubviewFrames:(BOOL)a4
{
  [(PXPhotosGlobalFooterView *)self directionalLayoutMargins];
  [(PXPhotosGlobalFooterView *)self safeAreaInsets];
  [(PXPhotosGlobalFooterView *)self safeAreaInsets];
  int v5 = [(PXPhotosGlobalFooterView *)self traitCollection];
  [v5 displayScale];

  PXFloatCeilingToPixel();
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  id v8 = a3;
  if ((void *)PXPhotosGlobalFooterViewViewModelObservationContext != a5) {
    goto LABEL_26;
  }
  id v14 = v8;
  if ((a4 & 0x8000) != 0) {
    [(PXPhotosGlobalFooterView *)self _updateAnimatedIcon];
  }
  if (a4) {
    [(PXPhotosGlobalFooterView *)self _updateTitle];
  }
  if ((a4 & 0x20002) != 0) {
    [(PXPhotosGlobalFooterView *)self _updateExtendedTitle];
  }
  if ((a4 & 0x20) != 0) {
    [(PXPhotosGlobalFooterView *)self _updateInternalMessageSubtitle];
  }
  if ((a4 & 4) != 0) {
    [(PXPhotosGlobalFooterView *)self _updateFilterView];
  }
  BOOL v9 = (a4 & 0x11C) != 0;
  BOOL v10 = (a4 & 0x110) != 0;
  if ((a4 & 0x2000C0) != 0)
  {
    BOOL v9 = 1;
    [(PXPhotosGlobalFooterView *)self _updateProgressAnimated:1];
    BOOL v10 = 1;
  }
  unint64_t v11 = (a4 >> 9) & 1;
  int v12 = v11 | v9;
  if ((a4 & 0x1E00) != 0 && self->_isPresentingAlert)
  {
    double v13 = [(PXPhotosGlobalFooterView *)self delegate];
    [v13 photosGlobalFooterView:self presentViewController:0];

    self->_isPresentingAlert = 0;
  }
  if ((a4 & 0x4000) == 0)
  {
    if ((a4 & 0x10000) == 0) {
      goto LABEL_19;
    }
LABEL_30:
    [(PXPhotosGlobalFooterView *)self _updateTopAccessory];
    if ((a4 & 0x100000) == 0) {
      goto LABEL_21;
    }
    goto LABEL_20;
  }
  [(PXPhotosGlobalFooterView *)self _updateAccessory];
  int v12 = 1;
  if ((a4 & 0x10000) != 0) {
    goto LABEL_30;
  }
LABEL_19:
  if ((a4 & 0x100000) != 0) {
LABEL_20:
  }
    [(PXPhotosGlobalFooterView *)self _updateProcessingView];
LABEL_21:
  if (v12) {
    [(PXPhotosGlobalFooterView *)self _updateSubtitle1];
  }
  if (v11 | v10) {
    [(PXPhotosGlobalFooterView *)self _updateSubtitle2];
  }
  [(PXPhotosGlobalFooterView *)self setNeedsLayout];
  id v8 = v14;
LABEL_26:
}

- (void)_configurePhotoCollectionGlobalFooterSubtitleLabel:(id)a3
{
}

- (void)_configurePhotoCollectionGlobalFooterExtendedTitleLabel:(id)a3
{
  id v3 = a3;
  PXFontWithTextStyleSymbolicTraits();
}

- (void)_configurePhotoCollectionGlobalFooterInternalMessageSubtitleLabel:(id)a3
{
  id v3 = a3;
  PXFontWithTextStyleSymbolicTraits();
}

- (void)_configurePhotoCollectionGlobalFooterTitleLabel:(id)a3
{
  id v3 = a3;
  PXFontWithTextStyleSymbolicTraits();
}

- (void)_configurePhotoCollectionGlobalFooterLabel:(id)a3 withFont:(id)a4 textColor:(id)a5
{
  uint64_t v7 = (void *)MEMORY[0x1E4FB1618];
  id v8 = a5;
  id v9 = a4;
  id v11 = a3;
  BOOL v10 = [v7 clearColor];
  [v11 setBackgroundColor:v10];

  [v11 setFont:v9];
  [v11 setTextAlignment:1];
  [v11 setTextColor:v8];

  [v11 setNumberOfLines:0];
}

- (BOOL)_shouldUseActionLinkInSubtitle1
{
  id v3 = [(PXPhotosGlobalFooterView *)self viewModel];
  double v4 = [v3 actionTitle];
  if (v4)
  {
    int v5 = [v3 subtitle1];
    if (v5) {
      BOOL v6 = ![(PXPhotosGlobalFooterView *)self _shouldUseActionLinkInSubtitle2];
    }
    else {
      LOBYTE(v6) = 0;
    }
  }
  else
  {
    LOBYTE(v6) = 0;
  }

  return v6;
}

- (BOOL)_shouldUseActionLinkInSubtitle2
{
  uint64_t v2 = [(PXPhotosGlobalFooterView *)self viewModel];
  id v3 = [v2 actionTitle];
  if (v3)
  {
    double v4 = [v2 subtitle2];
    BOOL v5 = v4 != 0;
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (void)_updateTopAccessory
{
  [(UIView *)self->_topAccessoryView removeFromSuperview];
  id v3 = [(PXPhotosGlobalFooterView *)self viewModel];
  double v4 = [v3 topAccessoryView];
  topAccessoryView = self->_topAccessoryView;
  self->_topAccessoryView = v4;

  if (self->_topAccessoryView)
  {
    -[PXPhotosGlobalFooterView addSubview:](self, "addSubview:");
  }
}

- (void)_updateAccessory
{
  [(UIView *)self->_accessoryView removeFromSuperview];
  id v3 = [(PXPhotosGlobalFooterView *)self viewModel];
  double v4 = [v3 accessoryView];
  accessoryView = self->_accessoryView;
  self->_accessoryView = v4;

  if (self->_accessoryView)
  {
    -[PXPhotosGlobalFooterView addSubview:](self, "addSubview:");
  }
}

- (void)_updateProgressAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL v5 = [(PXPhotosGlobalFooterView *)self viewModel];
  [v5 progress];
  float v7 = v6;

  progressView = self->_progressView;
  if (v7 == -1.0)
  {
    [(UIProgressView *)progressView setHidden:1];
  }
  else
  {
    if ([(UIProgressView *)progressView isHidden]) {
      [(UIProgressView *)self->_progressView setHidden:0];
    }
    id v9 = self->_progressView;
    BOOL v10 = [(PXPhotosGlobalFooterView *)self viewModel];
    char v11 = [v10 isPaused];
    int v12 = (void *)MEMORY[0x1E4FB1618];
    double v13 = v9;
    if (v11) {
      [v12 systemGrayColor];
    }
    else {
    id v14 = [v12 systemBlueColor];
    }
    [(UIProgressView *)v13 setProgressTintColor:v14];

    double v15 = +[PXFooterSettings sharedInstance];
    [v15 minimumDisplayedProgress];
    float v17 = v16;

    if (v7 >= v17) {
      *(float *)&double v18 = v7;
    }
    else {
      *(float *)&double v18 = v17;
    }
    id v19 = self->_progressView;
    [(UIProgressView *)v19 setProgress:v3 animated:v18];
  }
}

- (void)_updateSubtitle2
{
  id v10 = [(PXPhotosGlobalFooterView *)self viewModel];
  BOOL v3 = [v10 subtitle2];
  BOOL v4 = [(PXPhotosGlobalFooterView *)self _shouldUseActionLinkInSubtitle2];
  subtitle2Label = self->_subtitle2Label;
  if (!v3 || v4)
  {
    [(UILabel *)subtitle2Label setHidden:1];
  }
  else
  {
    if ([(UILabel *)subtitle2Label isHidden]) {
      [(UILabel *)self->_subtitle2Label setHidden:0];
    }
    [(UILabel *)self->_subtitle2Label setText:v3];
    [(PXPhotosGlobalFooterView *)self _configurePhotoCollectionGlobalFooterSubtitleLabel:self->_subtitle2Label];
  }
  subtitle2TextView = self->_subtitle2TextView;
  if (v4)
  {
    if ([(UITextView *)subtitle2TextView isHidden]) {
      [(UITextView *)self->_subtitle2TextView setHidden:0];
    }
    [v10 actionStyle];
    [v10 useBlankActionSeparator];
    float v7 = self->_subtitle2TextView;
    id v8 = [v10 actionTitle];
    id v9 = [(PXPhotosGlobalFooterView *)self labelColor];
    _ConfigureSubtitleTextView(v7, v3, v8, v9, 1, 0);
  }
  [(UITextView *)subtitle2TextView setHidden:1];
}

- (void)_updateSubtitle1
{
  id v11 = [(PXPhotosGlobalFooterView *)self viewModel];
  BOOL v3 = [v11 subtitle1];
  subtitle1TextView = self->_subtitle1TextView;
  if (v3)
  {
    if ([(UITextView *)subtitle1TextView isHidden]) {
      [(UITextView *)self->_subtitle1TextView setHidden:0];
    }
    if ([(PXPhotosGlobalFooterView *)self _shouldUseActionLinkInSubtitle1])
    {
      uint64_t v5 = [v11 actionTitle];
      float v6 = v11;
      float v7 = (void *)v5;
    }
    else
    {
      float v7 = 0;
      float v6 = v11;
    }
    uint64_t v8 = [v6 subtitle1Style];
    [v11 actionStyle];
    [v11 useBlankActionSeparator];
    [v11 showBadge];
    id v9 = self->_subtitle1TextView;
    id v10 = [(PXPhotosGlobalFooterView *)self labelColor];
    _ConfigureSubtitleTextView(v9, v3, v7, v10, 0, v8);
  }
  [(UITextView *)subtitle1TextView setHidden:1];
}

- (void)_updateFilterView
{
  [(UIView *)self->_filterView removeFromSuperview];
  BOOL v3 = [(PXPhotosGlobalFooterView *)self viewModel];
  BOOL v4 = [v3 filterView];
  filterView = self->_filterView;
  self->_filterView = v4;

  if (self->_filterView)
  {
    float v6 = [(PXPhotosGlobalFooterView *)self viewModel];
    float v7 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
    id v8 = [v6 adjustedChromeColor:v7];

    [(UIView *)self->_filterView setCaptionColor:v8];
    [(PXPhotosGlobalFooterView *)self addSubview:self->_filterView];
  }
}

- (void)_updateInternalMessageSubtitle
{
  BOOL v3 = [(PXPhotosGlobalFooterView *)self viewModel];
  id v6 = [v3 internalMessageSubtitle];

  uint64_t v4 = [v6 length];
  internalMessageSubtitleLabel = self->_internalMessageSubtitleLabel;
  if (v4)
  {
    if ([(UILabel *)internalMessageSubtitleLabel isHidden]) {
      [(UILabel *)self->_internalMessageSubtitleLabel setHidden:0];
    }
    [(UILabel *)self->_internalMessageSubtitleLabel setText:v6];
  }
  else
  {
    [(UILabel *)internalMessageSubtitleLabel setHidden:1];
  }
}

- (void)_updateExtendedTitle
{
  id v22 = [(PXPhotosGlobalFooterView *)self viewModel];
  BOOL v3 = [v22 extendedTitle];
  extendedTitleLabel = self->_extendedTitleLabel;
  if (v3)
  {
    if ([(UILabel *)extendedTitleLabel isHidden]) {
      [(UILabel *)self->_extendedTitleLabel setHidden:0];
    }
    [(PXPhotosGlobalFooterView *)self _configurePhotoCollectionGlobalFooterExtendedTitleLabel:self->_extendedTitleLabel];
    uint64_t v5 = [v22 extendedSystemImageName];
    if (v5)
    {
      id v6 = objc_alloc_init(MEMORY[0x1E4FB0870]);
      float v7 = (void *)MEMORY[0x1E4FB1830];
      id v8 = [(UILabel *)self->_extendedTitleLabel font];
      id v9 = [v7 configurationWithFont:v8];

      id v10 = (void *)MEMORY[0x1E4FB1830];
      id v11 = [(PXPhotosGlobalFooterView *)self labelColor];
      int v12 = [v10 configurationWithHierarchicalColor:v11];
      double v13 = [v9 configurationByApplyingConfiguration:v12];

      id v14 = [MEMORY[0x1E4FB1818] systemImageNamed:v5 withConfiguration:v13];
      [v6 setImage:v14];

      id v15 = objc_alloc_init(MEMORY[0x1E4F28E48]);
      float v16 = [MEMORY[0x1E4F28B18] attributedStringWithAttachment:v6];
      [v15 appendAttributedString:v16];

      id v17 = objc_alloc(MEMORY[0x1E4F28B18]);
      double v18 = [@" " stringByAppendingString:v3];
      id v19 = (void *)[v17 initWithString:v18];
      [v15 appendAttributedString:v19];

      unint64_t v20 = (void *)[v15 copy];
      id v21 = 0;
    }
    else
    {
      id v21 = v3;
      unint64_t v20 = 0;
    }
    [(UILabel *)self->_extendedTitleLabel setText:v21];
    [(UILabel *)self->_extendedTitleLabel setAttributedText:v20];
  }
  else
  {
    [(UILabel *)extendedTitleLabel setHidden:1];
  }
}

- (void)_updateTitle
{
  BOOL v3 = [(PXPhotosGlobalFooterView *)self viewModel];
  id v5 = [v3 title];

  titleLabel = self->_titleLabel;
  if (v5)
  {
    if ([(UILabel *)titleLabel isHidden]) {
      [(UILabel *)self->_titleLabel setHidden:0];
    }
    [(UILabel *)self->_titleLabel setText:v5];
    [(PXPhotosGlobalFooterView *)self _configurePhotoCollectionGlobalFooterTitleLabel:self->_titleLabel];
  }
  else
  {
    [(UILabel *)titleLabel setHidden:1];
  }
}

- (void)_animatedIconCrossedGridCycleBoundary
{
  id v2 = [(PXPhotosGlobalFooterView *)self viewModel];
  [v2 footerAnimationCrossedGridCycleBoundary];
}

- (void)_updateAnimatedIcon
{
  BOOL v3 = [(PXPhotosGlobalFooterView *)self viewModel];
  uint64_t v4 = [v3 animatedIconMode];

  BOOL v5 = v4 != 0;
  if (v4)
  {
    if (!self->_animatedIconView)
    {
      id v6 = objc_alloc_init(PXFooterAnimatedIconView);
      animatedIconView = self->_animatedIconView;
      self->_animatedIconView = v6;

      id v8 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v8 addObserver:self selector:sel__animatedIconCrossedGridCycleBoundary name:@"PXFooterAnimatedIconViewCrossedGridCycleBoundaryNotificationName" object:self->_animatedIconView];

      BOOL v9 = [(PXPhotosGlobalFooterView *)self needsWorkaroundFor53118165];
      id v10 = self->_animatedIconView;
      if (v9) {
        [(PXPhotosGlobalFooterView *)self insertSubview:v10 aboveSubview:self->_backgroundView];
      }
      else {
        [(PXPhotosGlobalFooterView *)self insertSubview:v10 atIndex:0];
      }
    }
    self->_hasAnimatedIconView = v5;
    uint64_t v11 = [(PXPhotosGlobalFooterView *)self isHidden];
  }
  else
  {
    self->_hasAnimatedIconView = v5;
    uint64_t v11 = 1;
  }
  [(PXFooterAnimatedIconView *)self->_animatedIconView setHidden:v11];
  int v12 = self->_animatedIconView;
  [(PXFooterAnimatedIconView *)v12 setDesiredMode:v4];
}

- (void)_updateProcessingView
{
  BOOL v3 = [(PXPhotosGlobalFooterView *)self viewModel];
  int v4 = [v3 isProcessing];

  processingView = self->_processingView;
  if (v4)
  {
    if (!processingView)
    {
      id v6 = [(PXPhotosGlobalFooterView *)self viewModel];
      float v7 = +[PXLemonadeFeatureAvailabilityProcessingViewFactory makeProcessingViewWithFooterViewModel:v6];
      id v8 = self->_processingView;
      self->_processingView = v7;

      [(PXPhotosGlobalFooterView *)self addSubview:self->_processingView];
      [(UIView *)self->_processingView sizeToFit];
      processingView = self->_processingView;
    }
    uint64_t v9 = 0;
  }
  else
  {
    uint64_t v9 = 1;
  }
  [(UIView *)processingView setHidden:v9];
}

- (void)_updateLabelColor
{
  id v7 = [MEMORY[0x1E4FB1618] labelColor];
  BOOL v3 = [(PXPhotosGlobalFooterView *)self viewModel];

  if (v3)
  {
    int v4 = [(PXPhotosGlobalFooterView *)self viewModel];
    uint64_t v5 = [v4 adjustedChromeColor:v7];

    id v6 = (id)v5;
  }
  else
  {
    id v6 = v7;
  }
  id v8 = v6;
  [(PXPhotosGlobalFooterView *)self setLabelColor:v6];
}

- (void)setHidden:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PXPhotosGlobalFooterView;
  [(PXPhotosGlobalFooterView *)&v4 setHidden:a3];
  [(PXPhotosGlobalFooterView *)self _updateAnimatedIcon];
}

- (void)setDelegate:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_delegate, obj);
    p_delegateRespondsTo = &self->_delegateRespondsTo;
    p_delegateRespondsTo->photosGlobalFooterViewDidChangeHeight = objc_opt_respondsToSelector() & 1;
    p_delegateRespondsTo->photosGlobalFooterViewDidMoveToWindow = objc_opt_respondsToSelector() & 1;
  }
}

- (void)setViewModel:(id)a3
{
  uint64_t v5 = (PXFooterViewModel *)a3;
  viewModel = self->_viewModel;
  if (viewModel != v5)
  {
    id v7 = v5;
    [(PXFooterViewModel *)viewModel unregisterChangeObserver:self context:PXPhotosGlobalFooterViewViewModelObservationContext];
    objc_storeStrong((id *)&self->_viewModel, a3);
    [(PXPhotosGlobalFooterView *)self _updateLabelColor];
    [(PXPhotosGlobalFooterView *)self _updateTopAccessory];
    [(PXPhotosGlobalFooterView *)self _updateAnimatedIcon];
    [(PXPhotosGlobalFooterView *)self _updateTitle];
    [(PXPhotosGlobalFooterView *)self _updateExtendedTitle];
    [(PXPhotosGlobalFooterView *)self _updateInternalMessageSubtitle];
    [(PXPhotosGlobalFooterView *)self _updateFilterView];
    [(PXPhotosGlobalFooterView *)self _updateSubtitle1];
    [(PXPhotosGlobalFooterView *)self _updateSubtitle2];
    [(PXPhotosGlobalFooterView *)self _updateProgressAnimated:0];
    [(PXPhotosGlobalFooterView *)self _updateAccessory];
    [(PXPhotosGlobalFooterView *)self _updateProcessingView];
    [(PXPhotosGlobalFooterView *)self setNeedsLayout];
    [(PXFooterViewModel *)self->_viewModel registerChangeObserver:self context:PXPhotosGlobalFooterViewViewModelObservationContext];
    uint64_t v5 = v7;
  }
}

- (PXPhotosGlobalFooterView)initWithFrame:(CGRect)a3 needsWorkaroundFor53118165:(BOOL)a4
{
  v26.receiver = self;
  v26.super_class = (Class)PXPhotosGlobalFooterView;
  uint64_t v5 = -[PXPhotosGlobalFooterView initWithFrame:](&v26, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  id v6 = v5;
  if (v5)
  {
    if (a4)
    {
      id v7 = +[PXWorkaroundSettings sharedInstance];
      v6->_needsWorkaroundFor53118165 = [v7 shouldWorkAround53118165];

      if (v6->_needsWorkaroundFor53118165)
      {
        id v8 = objc_alloc_init(PXGradientView);
        backgroundView = v6->_backgroundView;
        v6->_backgroundView = v8;

        [(PXPhotosGlobalFooterView *)v6 addSubview:v6->_backgroundView];
      }
    }
    else
    {
      v5->_needsWorkaroundFor53118165 = 0;
    }
    [(PXPhotosGlobalFooterView *)v6 _updateLabelColor];
    id v10 = objc_alloc(MEMORY[0x1E4FB1930]);
    double v11 = *MEMORY[0x1E4F1DB28];
    double v12 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v13 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v14 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
    uint64_t v15 = objc_msgSend(v10, "initWithFrame:", *MEMORY[0x1E4F1DB28], v12, v13, v14);
    titleLabel = v6->_titleLabel;
    v6->_titleLabel = (UILabel *)v15;

    [(PXPhotosGlobalFooterView *)v6 addSubview:v6->_titleLabel];
    [(PXPhotosGlobalFooterView *)v6 _configurePhotoCollectionGlobalFooterTitleLabel:v6->_titleLabel];
    uint64_t v17 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1930]), "initWithFrame:", v11, v12, v13, v14);
    extendedTitleLabel = v6->_extendedTitleLabel;
    v6->_extendedTitleLabel = (UILabel *)v17;

    [(PXPhotosGlobalFooterView *)v6 addSubview:v6->_extendedTitleLabel];
    [(PXPhotosGlobalFooterView *)v6 _configurePhotoCollectionGlobalFooterExtendedTitleLabel:v6->_extendedTitleLabel];
    uint64_t v19 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1930]), "initWithFrame:", v11, v12, v13, v14);
    internalMessageSubtitleLabel = v6->_internalMessageSubtitleLabel;
    v6->_internalMessageSubtitleLabel = (UILabel *)v19;

    [(PXPhotosGlobalFooterView *)v6 addSubview:v6->_internalMessageSubtitleLabel];
    [(PXPhotosGlobalFooterView *)v6 _configurePhotoCollectionGlobalFooterInternalMessageSubtitleLabel:v6->_internalMessageSubtitleLabel];
    uint64_t v21 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1DD8]), "initWithFrame:", v11, v12, v13, v14);
    subtitle1TextView = v6->_subtitle1TextView;
    v6->_subtitle1TextView = (UITextView *)v21;

    [(UITextView *)v6->_subtitle1TextView setDelegate:v6];
    [(PXPhotosGlobalFooterView *)v6 addSubview:v6->_subtitle1TextView];
    v23 = v6->_subtitle1TextView;
    id v24 = [(PXPhotosGlobalFooterView *)v6 labelColor];
    _ConfigurePhotoCollectionGlobalFooterSubtitleTextView(v23, 0, v24);
  }
  return 0;
}

- (PXPhotosGlobalFooterView)initWithFrame:(CGRect)a3
{
  return -[PXPhotosGlobalFooterView initWithFrame:needsWorkaroundFor53118165:](self, "initWithFrame:needsWorkaroundFor53118165:", 1, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

@end