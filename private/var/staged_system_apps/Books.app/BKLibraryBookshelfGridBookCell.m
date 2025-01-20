@interface BKLibraryBookshelfGridBookCell
+ (NSDateComponentsFormatter)bkaxDownloadAndAudiobookProgressFormatter;
- (AEAssetAudiobookStatus)audiobookStatus;
- (BCUCoverEffectsEnvironment)coverEffectsEnvironment;
- (BFMAsset)asset;
- (BKDimmedCoverDownloadProgressView)progressView;
- (BKLibraryActionHandler)actionHandler;
- (BKLibraryAsset)libraryAsset;
- (BKLibraryBookshelfCellMetrics)metrics;
- (BKLibraryBookshelfColumnMetrics)columnMetrics;
- (BKLibraryBookshelfCoverView)coverView;
- (BKLibraryBookshelfGridBookCell)initWithFrame:(CGRect)a3;
- (BKLibraryBookshelfInfoCell)infoCell;
- (BKLibraryBookshelfLayoutManager)layoutManager;
- (BKLibraryBookshelfStorageProvider)storageProvider;
- (BKLibraryBookshelfSupplementaryDataSource)dataSource;
- (BOOL)_accessibilityDidTriggerPlayPauseAction;
- (BOOL)_accessibilityDidTriggerShowMenuAction;
- (BOOL)_accessibilityIsSpeakThisElement;
- (BOOL)accessibilityActivate;
- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4;
- (BOOL)hasSeriesSequenceLabel;
- (BOOL)hideInfoBar;
- (BOOL)hideSelectIndicator;
- (BOOL)isAccessibilityElement;
- (BOOL)isRTL;
- (BOOL)needsAsset;
- (BOOL)pendingAnimationCompletion;
- (BOOL)pendingTouchUp;
- (BOOL)shouldDragWithTouch:(id)a3;
- (BOOL)showSeriesSequenceLabel;
- (BOOL)shrinkInEditMode;
- (BOOL)wantsAnimatedLayoutChange;
- (CGRect)_areaAboveInfoCell;
- (CGRect)coverArea;
- (CGRect)coverFrame;
- (CGRect)infoFrame;
- (CGRect)supplementalContentPDFTitleFrame;
- (NSIndexPath)indexPath;
- (NSString)formattedPrice;
- (UIImageView)selectIndicatorView;
- (UILabel)seriesSequenceLabel;
- (UILabel)supplementalContentPdfTitleLabel;
- (double)_desiredAlphaFromRawAlpha:(double)a3;
- (double)_seriesSequenceLabelHeight;
- (double)_seriesSequenceLabelTopMargin;
- (double)infoCellExpectedDateHeight;
- (double)infoCellHeight;
- (double)infoCellPadding;
- (id)_checkmarkImageForSelectedState:(BOOL)a3;
- (id)accessibilityCustomActions;
- (id)accessibilityElements;
- (id)accessibilityHint;
- (id)accessibilityLabel;
- (id)accessibilityUserInputLabels;
- (id)cellMetrics;
- (id)coverImage;
- (id)coverLayer;
- (id)dragPreview;
- (id)dragPreviewParametersForDrop:(BOOL)a3;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (id)libraryBookshelfInfoCell:(id)a3 analyticsAssetPropertyProviderForLibraryAsset:(id)a4 fromSourceView:(id)a5 inCollection:(id)a6;
- (id)libraryBookshelfInfoCell:(id)a3 menuWithLibraryAsset:(id)a4 sourceView:(id)a5 collection:(id)a6;
- (id)trackerForLibraryBookshelfInfoCell:(id)a3;
- (int)layoutDebugMode;
- (int64_t)accessibilityElementCount;
- (unint64_t)accessibilityTraits;
- (void)_animateDim;
- (void)_animateGrow;
- (void)_animateMakeVisible;
- (void)_animateShrink;
- (void)_layoutCoverView;
- (void)_updateSeriesSequenceLabel:(BOOL)a3;
- (void)_updateSeriesSequenceLabelText;
- (void)_updateSupplementalContentPDFTitleLabelText;
- (void)applyLayoutAttributes:(id)a3;
- (void)assetStateChanged;
- (void)cleanupCell;
- (void)dealloc;
- (void)didTapStopDownloadButtonWithAsset:(id)a3;
- (void)handleTapWithCompletion:(id)a3;
- (void)layoutSubviews;
- (void)libraryBookshelfInfoCellDidSelectCancelDownload:(id)a3 sourceView:(id)a4;
- (void)libraryBookshelfInfoCellDidSelectResumeDownload:(id)a3 sourceView:(id)a4;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)prepareForReuse;
- (void)setActionHandler:(id)a3;
- (void)setAsset:(id)a3;
- (void)setAudiobookStatus:(id)a3;
- (void)setColumnMetrics:(id)a3;
- (void)setCoverEffectsEnvironment:(id)a3;
- (void)setCoverHidden:(BOOL)a3;
- (void)setCoverView:(id)a3;
- (void)setDataSource:(id)a3;
- (void)setFormattedPrice:(id)a3;
- (void)setHasSeriesSequenceLabel:(BOOL)a3;
- (void)setHideInfoBar:(BOOL)a3;
- (void)setHideSelectIndicator:(BOOL)a3;
- (void)setIndexPath:(id)a3;
- (void)setInfoCell:(id)a3;
- (void)setIsRTL:(BOOL)a3;
- (void)setLayoutDebugMode:(int)a3;
- (void)setLayoutManager:(id)a3;
- (void)setLibraryAsset:(id)a3;
- (void)setMetrics:(id)a3;
- (void)setPendingAnimationCompletion:(BOOL)a3;
- (void)setPendingTouchUp:(BOOL)a3;
- (void)setProgressView:(id)a3;
- (void)setSelectIndicatorView:(id)a3;
- (void)setSelected:(BOOL)a3;
- (void)setSeriesSequenceLabel:(id)a3;
- (void)setStorageProvider:(id)a3;
- (void)setSupplementalContentPdfTitleLabel:(id)a3;
- (void)setWantsAnimatedLayoutChange:(BOOL)a3;
- (void)setupMenuWithLibraryAsset:(id)a3 withActionHandler:(id)a4;
- (void)togglePlayPause:(id)a3;
- (void)updateLibraryAssetPrice;
@end

@implementation BKLibraryBookshelfGridBookCell

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  -[BKLibraryBookshelfInfoCell convertPoint:fromView:](self->_infoCell, "convertPoint:fromView:", self, x, y);
  double v9 = v8;
  double v11 = v10;
  if ([(BKLibraryBookshelfGridBookCell *)self isHidden]) {
    goto LABEL_5;
  }
  v12 = [(BKLibraryBookshelfInfoCell *)self->_infoCell superview];
  if (!v12 || ([(BKLibraryBookshelfInfoCell *)self->_infoCell alpha], v13 != 1.0))
  {

LABEL_5:
    v16.receiver = self;
    v16.super_class = (Class)BKLibraryBookshelfGridBookCell;
    v14 = -[BKLibraryBookshelfGridBookCell hitTest:withEvent:](&v16, "hitTest:withEvent:", v7, x, y);
    goto LABEL_6;
  }
  v14 = -[BKLibraryBookshelfInfoCell hitTest:withEvent:](self->_infoCell, "hitTest:withEvent:", v7, v9, v11);

  if (!v14) {
    goto LABEL_5;
  }
LABEL_6:

  return v14;
}

- (BKLibraryBookshelfGridBookCell)initWithFrame:(CGRect)a3
{
  v20.receiver = self;
  v20.super_class = (Class)BKLibraryBookshelfGridBookCell;
  v3 = -[BKLibraryBookshelfCollectionViewCell initWithFrame:](&v20, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = [objc_alloc((Class)UILabel) initWithFrame:0.0, 0.0, 10.0, 10.0];
    seriesSequenceLabel = v3->_seriesSequenceLabel;
    v3->_seriesSequenceLabel = v4;

    [(UILabel *)v3->_seriesSequenceLabel setNumberOfLines:1];
    [(UILabel *)v3->_seriesSequenceLabel setHidden:1];
    v6 = [(BKLibraryBookshelfGridBookCell *)v3 contentView];
    [v6 addSubview:v3->_seriesSequenceLabel];

    id v7 = [objc_alloc((Class)UILabel) initWithFrame:0.0, 0.0, 10.0, 10.0];
    supplementalContentPdfTitleLabel = v3->_supplementalContentPdfTitleLabel;
    v3->_supplementalContentPdfTitleLabel = v7;

    [(UILabel *)v3->_supplementalContentPdfTitleLabel setNumberOfLines:1];
    [(UILabel *)v3->_supplementalContentPdfTitleLabel setHidden:1];
    double v9 = [(BKLibraryBookshelfGridBookCell *)v3 contentView];
    [v9 addSubview:v3->_supplementalContentPdfTitleLabel];

    double v10 = objc_alloc_init(BKLibraryBookshelfInfoCell);
    infoCell = v3->_infoCell;
    v3->_infoCell = v10;

    [(BKLibraryBookshelfInfoCell *)v3->_infoCell setDelegate:v3];
    v12 = [(BKLibraryBookshelfGridBookCell *)v3 contentView];
    [v12 addSubview:v3->_infoCell];

    double v13 = objc_alloc_init(BKLibraryBookshelfCoverView);
    coverView = v3->_coverView;
    v3->_coverView = v13;

    v15 = [(BKLibraryBookshelfGridBookCell *)v3 contentView];
    [v15 addSubview:v3->_coverView];

    objc_super v16 = (UIImageView *)objc_alloc_init((Class)UIImageView);
    selectIndicatorView = v3->_selectIndicatorView;
    v3->_selectIndicatorView = v16;

    v18 = [(BKLibraryBookshelfGridBookCell *)v3 contentView];
    [v18 addSubview:v3->_selectIndicatorView];

    [(BKLibraryBookshelfCollectionViewCell *)v3 setHighlightBackgroundColor:0];
  }
  return v3;
}

- (void)dealloc
{
  [(AEAssetAudiobookStatus *)self->_audiobookStatus removeObserver:self forKeyPath:@"assetAudiobookStatusIsPlaying" context:off_100B1F308];
  [(AEAssetAudiobookStatus *)self->_audiobookStatus removeObserver:self forKeyPath:@"assetAudiobookStatusTrackProgress" context:off_100B1F310];
  libraryAsset = self->_libraryAsset;
  if (libraryAsset && ([(BKLibraryAsset *)libraryAsset isContainer] & 1) == 0)
  {
    [(BKLibraryAsset *)self->_libraryAsset removeObserver:self forKeyPath:@"state" context:off_100B1F318];
    [(BKLibraryAsset *)self->_libraryAsset removeObserver:self forKeyPath:@"title" context:off_100B1F320];
    [(BKLibraryAsset *)self->_libraryAsset removeObserver:self forKeyPath:@"author" context:off_100B1F320];
    [(BKLibraryAsset *)self->_libraryAsset removeObserver:self forKeyPath:@"genre" context:off_100B1F320];
  }
  v4.receiver = self;
  v4.super_class = (Class)BKLibraryBookshelfGridBookCell;
  [(BKLibraryBookshelfCollectionViewCell *)&v4 dealloc];
}

- (BKDimmedCoverDownloadProgressView)progressView
{
  progressView = self->_progressView;
  if (!progressView)
  {
    objc_super v4 = objc_alloc_init(BKDimmedCoverDownloadProgressView);
    v5 = self->_progressView;
    self->_progressView = v4;

    [(BKDimmedCoverDownloadProgressView *)self->_progressView setHidden:1];
    [(BKDimmedCoverDownloadProgressView *)self->_progressView setDelegate:self];
    v6 = [(BKLibraryBookshelfGridBookCell *)self contentView];
    [v6 addSubview:self->_progressView];

    progressView = self->_progressView;
  }

  return progressView;
}

- (id)coverLayer
{
  v2 = [(BKLibraryBookshelfGridBookCell *)self coverView];
  v3 = [v2 coverLayer];

  return v3;
}

- (void)cleanupCell
{
  v3 = [(BKLibraryBookshelfGridBookCell *)self coverLayer];
  long long v4 = *(_OWORD *)&CGAffineTransformIdentity.c;
  v8[0] = *(_OWORD *)&CGAffineTransformIdentity.a;
  v8[1] = v4;
  v8[2] = *(_OWORD *)&CGAffineTransformIdentity.tx;
  [v3 setAffineTransform:v8];

  v5 = [(BKLibraryBookshelfGridBookCell *)self coverLayer];
  LODWORD(v6) = 1.0;
  [v5 setOpacity:v6];

  [(BKLibraryBookshelfGridBookCell *)self setLibraryAsset:0];
  id v7 = [(BKLibraryBookshelfGridBookCell *)self infoCell];
  [v7 setAudiobookStatus:0];

  [(BKLibraryBookshelfGridBookCell *)self setAudiobookStatus:0];
}

- (void)prepareForReuse
{
  +[CATransaction begin];
  +[CATransaction setDisableActions:1];
  v5.receiver = self;
  v5.super_class = (Class)BKLibraryBookshelfGridBookCell;
  [(BKLibraryBookshelfCollectionViewCell *)&v5 prepareForReuse];
  [(BKLibraryBookshelfGridBookCell *)self cleanupCell];
  v3 = [(BKLibraryBookshelfGridBookCell *)self coverLayer];
  unsigned int v4 = [v3 isHidden];

  if (v4) {
    [(BKLibraryBookshelfGridBookCell *)self setCoverHidden:0];
  }
  +[CATransaction commit];
}

- (id)cellMetrics
{
  objc_opt_class();
  v3 = [(BKLibraryBookshelfGridBookCell *)self metrics];
  unsigned int v4 = BUDynamicCast();

  return v4;
}

- (BOOL)shrinkInEditMode
{
  return 1;
}

- (id)_checkmarkImageForSelectedState:(BOOL)a3
{
  if (a3) {
    CFStringRef v3 = @"ios_library_edit_selected_checkmark";
  }
  else {
    CFStringRef v3 = @"ios_library_edit_unselected_checkmark";
  }
  unsigned int v4 = +[UIImage imageNamed:v3];

  return v4;
}

- (void)setSelected:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(BKLibraryBookshelfGridBookCell *)self isSelected] != a3)
  {
    v7.receiver = self;
    v7.super_class = (Class)BKLibraryBookshelfGridBookCell;
    [(BKLibraryBookshelfGridBookCell *)&v7 setSelected:v3];
    if ([(BKLibraryBookshelfCollectionViewCell *)self isInEditMode])
    {
      if ([(BKLibraryBookshelfGridBookCell *)self shrinkInEditMode])
      {
        if ([(BKLibraryBookshelfGridBookCell *)self isSelected])
        {
          [(BKLibraryBookshelfGridBookCell *)self _animateGrow];
          [(BKLibraryBookshelfGridBookCell *)self _animateMakeVisible];
        }
        else
        {
          [(BKLibraryBookshelfGridBookCell *)self _animateShrink];
          [(BKLibraryBookshelfGridBookCell *)self _animateDim];
        }
      }
      objc_super v5 = [(BKLibraryBookshelfGridBookCell *)self _checkmarkImageForSelectedState:[(BKLibraryBookshelfGridBookCell *)self isSelected]];
      double v6 = [(BKLibraryBookshelfGridBookCell *)self selectIndicatorView];
      [v6 setImage:v5];
    }
  }
}

- (void)_animateShrink
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_100135CF0;
  v2[3] = &unk_100A43D60;
  v2[4] = self;
  +[UIView animateWithDuration:v2 animations:0.2];
}

- (void)_animateGrow
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_100135E08;
  v2[3] = &unk_100A43D60;
  v2[4] = self;
  +[UIView animateWithDuration:v2 animations:0.2];
}

- (void)_animateDim
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_100135EC8;
  v2[3] = &unk_100A43D60;
  v2[4] = self;
  +[UIView animateWithDuration:v2 animations:0.2];
}

- (void)_animateMakeVisible
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_100135FA0;
  v2[3] = &unk_100A43D60;
  v2[4] = self;
  +[UIView animateWithDuration:v2 animations:0.2];
}

- (id)dragPreview
{
  id v3 = objc_alloc((Class)UIDragPreview);
  unsigned int v4 = [(BKLibraryBookshelfGridBookCell *)self coverView];
  id v5 = [v3 initWithView:v4];

  return v5;
}

- (id)dragPreviewParametersForDrop:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = objc_alloc_init((Class)UIDragPreviewParameters);
  double v6 = [(BKLibraryBookshelfGridBookCell *)self traitCollection];
  objc_super v7 = [v6 traitCollectionByModifyingTraits:&stru_100A47C38];

  double v8 = +[UIColor bc_booksBackground];
  double v9 = [v8 resolvedColorWithTraitCollection:v7];
  [v5 setBackgroundColor:v9];

  double v10 = [(BKLibraryBookshelfGridBookCell *)self coverLayer];
  double v11 = [v10 boundingPath];

  if (v11)
  {
    v12 = [(BKLibraryBookshelfGridBookCell *)self coverLayer];
    double v13 = [v12 boundingPath];
    id v14 = [v13 copy];
    [v5 setVisiblePath:v14];
  }
  else
  {
    [(BKLibraryBookshelfGridBookCell *)self coverFrame];
    double v16 = v15;
    double v18 = v17;
    double v20 = v19;
    double v22 = v21;
    if (v3)
    {
      v23 = +[BCCacheManager defaultCacheManager];
      v24 = [(BKLibraryBookshelfGridBookCell *)self libraryAsset];
      v25 = [v24 assetID];
      v26 = [v23 metadataForIdentifier:v25];

      v27 = [v26 intrinsicAspectRatio];
      v28 = v27;
      if (v27)
      {
        [v27 floatValue];
        if (v29 > 0.0)
        {
          [(BKLibraryBookshelfGridBookCell *)self coverContainerFrame];
          CGFloat v31 = v30;
          CGFloat v33 = v32;
          CGFloat v35 = v34;
          CGFloat v37 = v36;
          [v28 floatValue];
          CGRectFitRectInRect();
          double v16 = v38;
          CGFloat v40 = v39;
          double v20 = v41;
          double v22 = v42;
          v46.origin.double x = v31;
          v46.origin.double y = v33;
          v46.size.width = v35;
          v46.size.height = v37;
          double Height = CGRectGetHeight(v46);
          v47.origin.double x = v16;
          v47.origin.double y = v40;
          v47.size.width = v20;
          v47.size.height = v22;
          double v18 = Height - CGRectGetHeight(v47);
        }
      }
    }
    v12 = +[UIBezierPath bezierPathWithRect:](UIBezierPath, "bezierPathWithRect:", v16, v18, v20, v22);
    [v5 setVisiblePath:v12];
  }

  return v5;
}

- (double)_desiredAlphaFromRawAlpha:(double)a3
{
  if ([(BKLibraryBookshelfCollectionViewCell *)self isInEditMode])
  {
    a3 = 1.0;
    if (([(BKLibraryBookshelfGridBookCell *)self isSelected] & 1) == 0)
    {
      id v5 = [(BKLibraryBookshelfGridBookCell *)self cellMetrics];
      [v5 dimmedAlpha];
      a3 = v6;
    }
  }
  return a3;
}

- (BCUCoverEffectsEnvironment)coverEffectsEnvironment
{
  v2 = [(BKLibraryBookshelfGridBookCell *)self coverLayer];
  BOOL v3 = [v2 coverEffectsEnvironment];

  return (BCUCoverEffectsEnvironment *)v3;
}

- (void)setCoverEffectsEnvironment:(id)a3
{
  id v4 = a3;
  id v5 = [(BKLibraryBookshelfGridBookCell *)self coverLayer];
  [v5 setCoverEffectsEnvironment:v4];
}

- (void)handleTapWithCompletion:(id)a3
{
  id v4 = a3;
  id v6 = [(BKLibraryBookshelfGridBookCell *)self actionHandler];
  id v5 = [(BKLibraryBookshelfGridBookCell *)self indexPath];
  [v6 bookTapped:v5 completion:v4];
}

- (void)setCoverHidden:(BOOL)a3
{
  BOOL v3 = a3;
  +[CATransaction begin];
  +[CATransaction setDisableActions:1];
  id v5 = [(BKLibraryBookshelfGridBookCell *)self coverLayer];
  [v5 setHidden:v3];

  id v6 = [(BKLibraryBookshelfCollectionViewCell *)self audiobookControl];
  [v6 setHidden:v3];

  +[CATransaction commit];
}

- (id)coverImage
{
  v2 = [(BKLibraryBookshelfGridBookCell *)self coverLayer];
  BOOL v3 = [v2 image];

  return v3;
}

- (BKLibraryBookshelfCoverView)coverView
{
  return self->_coverView;
}

- (CGRect)coverFrame
{
  BOOL v3 = [(BKLibraryBookshelfGridBookCell *)self layer];
  id v4 = [(BKLibraryBookshelfGridBookCell *)self coverLayer];
  [v4 coverBounds];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  double v13 = [(BKLibraryBookshelfGridBookCell *)self coverLayer];
  [v3 convertRect:v13 fromLayer:v6, v8, v10, v12];
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;
  double v21 = v20;

  double v22 = v15;
  double v23 = v17;
  double v24 = v19;
  double v25 = v21;
  result.size.height = v25;
  result.size.width = v24;
  result.origin.double y = v23;
  result.origin.double x = v22;
  return result;
}

- (CGRect)coverArea
{
  [(BKLibraryBookshelfGridBookCell *)self _areaAboveInfoCell];
  double v4 = v3;
  double v6 = v5;
  [(BKLibraryBookshelfGridBookCell *)self _seriesSequenceLabelHeight];
  double v8 = v7;
  [(BKLibraryBookshelfGridBookCell *)self _seriesSequenceLabelTopMargin];
  double v10 = v6 - (v8 + v9);
  double v11 = 0.0;
  double v12 = 0.0;
  double v13 = v4;
  result.size.height = v10;
  result.size.width = v13;
  result.origin.double y = v12;
  result.origin.double x = v11;
  return result;
}

- (CGRect)_areaAboveInfoCell
{
  [(BKLibraryBookshelfGridBookCell *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  [(BKLibraryBookshelfGridBookCell *)self infoCellHeight];
  double v12 = v11;
  [(BKLibraryBookshelfGridBookCell *)self infoCellPadding];
  double v14 = v12 + v13;
  [(BKLibraryBookshelfGridBookCell *)self infoCellExpectedDateHeight];
  double v16 = v10 - (v14 + v15);
  double v17 = v4;
  double v18 = v6;
  double v19 = v8;
  result.size.height = v16;
  result.size.width = v19;
  result.origin.double y = v18;
  result.origin.double x = v17;
  return result;
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  id v5 = a4;
  if ([(BKLibraryBookshelfGridBookCell *)self isHidden])
  {
    BOOL v6 = 0;
  }
  else if ([(BKLibraryBookshelfCollectionViewCell *)self isInEditMode])
  {
    BOOL v6 = 1;
  }
  else
  {
    [(BKLibraryBookshelfGridBookCell *)self coverFrame];
    CGFloat v8 = v7;
    CGFloat v10 = v9;
    CGFloat v12 = v11;
    CGFloat v14 = v13;
    [v5 locationInView:self];
    v18.double x = v15;
    v18.double y = v16;
    v19.origin.double x = v8;
    v19.origin.double y = v10;
    v19.size.width = v12;
    v19.size.height = v14;
    BOOL v6 = CGRectContainsPoint(v19, v18);
  }

  return v6;
}

- (double)_seriesSequenceLabelHeight
{
  if (![(BKLibraryBookshelfGridBookCell *)self hasSeriesSequenceLabel]) {
    return 0.0;
  }
  double v3 = [(BKLibraryBookshelfGridBookCell *)self cellMetrics];
  [v3 seriesSequenceLabelHeight];
  double v5 = v4;

  return v5;
}

- (double)_seriesSequenceLabelTopMargin
{
  if (![(BKLibraryBookshelfGridBookCell *)self hasSeriesSequenceLabel]) {
    return 0.0;
  }
  double v3 = [(BKLibraryBookshelfGridBookCell *)self cellMetrics];
  [v3 seriesSequenceLabelTopMargin];
  double v5 = v4;

  return v5;
}

- (CGRect)infoFrame
{
  double v3 = 0.0;
  if (![(BKLibraryBookshelfCollectionViewCell *)self isInEditMode])
  {
    double v4 = [(BKLibraryBookshelfGridBookCell *)self cellMetrics];
    [v4 infoBarHeight];
    double v6 = v5;
    double v7 = [(BKLibraryBookshelfGridBookCell *)self cellMetrics];
    [v7 infoBarDateSpacing];
    double v9 = v6 + v8;
    CGFloat v10 = [(BKLibraryBookshelfGridBookCell *)self cellMetrics];
    [v10 infoBarExpectedDateHeight];
    double v3 = v9 + v11;
  }
  [(BKLibraryBookshelfGridBookCell *)self _areaAboveInfoCell];
  CGFloat width = v19.size.width;
  double MaxY = CGRectGetMaxY(v19);
  [(BKLibraryBookshelfGridBookCell *)self infoCellPadding];
  double v15 = MaxY + v14;
  double v16 = 0.0;
  double v17 = width;
  double v18 = v3;
  result.size.height = v18;
  result.size.CGFloat width = v17;
  result.origin.double y = v15;
  result.origin.double x = v16;
  return result;
}

- (double)infoCellExpectedDateHeight
{
  double v3 = 0.0;
  if (![(BKLibraryBookshelfGridBookCell *)self hideInfoBar])
  {
    double v4 = [(BKLibraryBookshelfGridBookCell *)self cellMetrics];
    [v4 infoBarDateSpacing];
    double v6 = v5;
    double v7 = [(BKLibraryBookshelfGridBookCell *)self cellMetrics];
    [v7 infoBarExpectedDateHeight];
    double v3 = v6 + v8;
  }
  return v3;
}

- (double)infoCellHeight
{
  if ([(BKLibraryBookshelfGridBookCell *)self hideInfoBar]) {
    return 0.0;
  }
  double v4 = [(BKLibraryBookshelfGridBookCell *)self cellMetrics];
  [v4 infoBarHeight];
  double v6 = v5;

  return v6;
}

- (double)infoCellPadding
{
  double v3 = 0.0;
  if (![(BKLibraryBookshelfGridBookCell *)self hideInfoBar])
  {
    double v4 = [(BKLibraryBookshelfGridBookCell *)self seriesSequenceLabel];
    unsigned int v5 = [v4 isHidden];

    double v6 = [(BKLibraryBookshelfGridBookCell *)self cellMetrics];
    double v7 = v6;
    if (v5) {
      [v6 infoBarSpacing];
    }
    else {
      [v6 seriesSequenceLabelBottomMargin];
    }
    double v3 = v8;
  }
  return v3;
}

- (void)_layoutCoverView
{
  [(BKLibraryBookshelfGridBookCell *)self coverArea];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v22 = 0u;
  double v11 = [(BKLibraryBookshelfGridBookCell *)self coverLayer];
  CGFloat v12 = v11;
  if (v11)
  {
    [v11 affineTransform];
  }
  else
  {
    long long v23 = 0u;
    long long v24 = 0u;
    long long v22 = 0u;
  }

  double v13 = [(BKLibraryBookshelfGridBookCell *)self coverLayer];
  long long v14 = *(_OWORD *)&CGAffineTransformIdentity.c;
  v21[0] = *(_OWORD *)&CGAffineTransformIdentity.a;
  v21[1] = v14;
  v21[2] = *(_OWORD *)&CGAffineTransformIdentity.tx;
  [v13 setAffineTransform:v21];

  double v15 = [(BKLibraryBookshelfGridBookCell *)self coverView];
  [v15 setFrame:v4, v6, v8, v10];

  long long v18 = v22;
  long long v19 = v23;
  long long v20 = v24;
  double v16 = [(BKLibraryBookshelfGridBookCell *)self coverLayer];
  v17[0] = v18;
  v17[1] = v19;
  v17[2] = v20;
  [v16 setAffineTransform:v17];
}

- (CGRect)supplementalContentPDFTitleFrame
{
  [(BKLibraryBookshelfGridBookCell *)self coverArea];
  CGFloat v4 = v3;
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  double v11 = [(BKLibraryBookshelfGridBookCell *)self supplementalContentPdfTitleLabel];
  v23.origin.double x = v4;
  v23.origin.double y = v6;
  v23.size.CGFloat width = v8;
  v23.size.height = v10;
  [v11 sizeThatFits:CGRectGetWidth(v23) 3.40282347e38];
  double v13 = v12;

  v24.origin.double x = v4;
  v24.origin.double y = v6;
  v24.size.CGFloat width = v8;
  v24.size.height = v10;
  CGFloat Width = CGRectGetWidth(v24);
  v25.origin.double x = v4;
  v25.origin.double y = v6;
  v25.size.CGFloat width = v8;
  v25.size.height = v10;
  double Height = CGRectGetHeight(v25);
  double v16 = [(BKLibraryBookshelfGridBookCell *)self cellMetrics];
  [v16 smallTitleTopMargin];
  double v18 = Height + v17;

  double v19 = v4;
  double v20 = v18;
  double v21 = Width;
  double v22 = v13;
  result.size.height = v22;
  result.size.CGFloat width = v21;
  result.origin.double y = v20;
  result.origin.double x = v19;
  return result;
}

- (void)layoutSubviews
{
  v69.receiver = self;
  v69.super_class = (Class)BKLibraryBookshelfGridBookCell;
  [(BKLibraryBookshelfGridBookCell *)&v69 layoutSubviews];
  unsigned int v3 = [(BKLibraryBookshelfGridBookCell *)self wantsAnimatedLayoutChange];
  +[CATransaction begin];
  if (v3)
  {
    +[UIView inheritedAnimationDuration];
    +[CATransaction setAnimationDuration:](CATransaction, "setAnimationDuration:");
    CGFloat v4 = +[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    +[CATransaction setAnimationTimingFunction:v4];

    [(BKLibraryBookshelfGridBookCell *)self _layoutCoverView];
    +[CATransaction commit];
    [(BKLibraryBookshelfGridBookCell *)self infoFrame];
    double x = v70.origin.x;
    double y = v70.origin.y;
    double width = v70.size.width;
    double height = v70.size.height;
    if (!CGRectIsEmpty(v70))
    {
      double v9 = [(BKLibraryBookshelfGridBookCell *)self infoCell];
      [v9 setFrame:CGRectMake(x, y, width, height)];
    }
  }
  else
  {
    +[CATransaction setDisableActions:1];
    [(BKLibraryBookshelfGridBookCell *)self _layoutCoverView];
    +[CATransaction commit];
    v68[0] = _NSConcreteStackBlock;
    v68[1] = 3221225472;
    v68[2] = sub_100137154;
    v68[3] = &unk_100A43D60;
    v68[4] = self;
    +[UIView performWithoutAnimation:v68];
  }
  [(BKLibraryBookshelfGridBookCell *)self coverArea];
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;
  double v18 = [(BKLibraryBookshelfGridBookCell *)self seriesSequenceLabel];
  unsigned __int8 v19 = [v18 isHidden];

  if ((v19 & 1) == 0)
  {
    double v20 = [(BKLibraryBookshelfGridBookCell *)self cellMetrics];
    double v21 = [v20 seriesSequenceLabelFontAttributes];
    double v22 = [v21 font];

    v71.origin.double x = v11;
    v71.origin.double y = v13;
    v71.size.double width = v15;
    v71.size.double height = v17;
    double MaxY = CGRectGetMaxY(v71);
    CGRect v24 = [(BKLibraryBookshelfGridBookCell *)self cellMetrics];
    [v24 seriesSequenceLabelTopMargin];
    double v26 = MaxY + v25;
    v27 = [(BKLibraryBookshelfGridBookCell *)self cellMetrics];
    [v27 seriesSequenceLabelHeight];
    double v29 = v26 + v28;
    [v22 descender];
    double v31 = v29 - v30;

    double v32 = [(BKLibraryBookshelfGridBookCell *)self seriesSequenceLabel];
    v72.origin.double x = v11;
    v72.origin.double y = v13;
    v72.size.double width = v15;
    v72.size.double height = v17;
    [v32 sizeThatFits:CGRectGetWidth(v72), 3.40282347e38];
    double v34 = v33;

    v73.origin.double x = v11;
    v73.origin.double y = v13;
    v73.size.double width = v15;
    v73.size.double height = v17;
    double v35 = CGRectGetWidth(v73);
    v74.origin.double x = v11;
    v74.origin.double y = v13;
    v74.size.double width = v35;
    v74.size.double height = v34;
    double v36 = v31 - CGRectGetHeight(v74);
    CGFloat v37 = [(BKLibraryBookshelfGridBookCell *)self seriesSequenceLabel];
    [v37 setFrame:v11, v36, v35, v34];
  }
  double v38 = [(BKLibraryBookshelfGridBookCell *)self supplementalContentPdfTitleLabel];
  unsigned __int8 v39 = [v38 isHidden];

  if ((v39 & 1) == 0)
  {
    CGFloat v40 = [(BKLibraryBookshelfGridBookCell *)self progressView];
    [v40 setFrame:v11, v13, v15, v17];

    [(BKLibraryBookshelfGridBookCell *)self supplementalContentPDFTitleFrame];
    double v42 = v41;
    double v44 = v43;
    double v46 = v45;
    double v48 = v47;
    v49 = [(BKLibraryBookshelfGridBookCell *)self supplementalContentPdfTitleLabel];
    [v49 setFrame:v42, v44, v46, v48];
  }
  double v50 = *(double *)&qword_100B4A410;
  if (*(double *)&qword_100B4A410 == 0.0)
  {
    v51 = +[UIImage imageNamed:@"ios_library_edit_selected_checkmark"];
    [v51 size];
    qword_100B4A408 = v52;
    qword_100B4A410 = v53;

    double v50 = *(double *)&qword_100B4A410;
  }
  double v54 = *(double *)&qword_100B4A408;
  v75.origin.double x = v11;
  v75.origin.double y = v13;
  v75.size.double width = v15;
  v75.size.double height = v17;
  CGFloat v55 = CGRectGetMaxX(v75) - v54 + -8.0;
  v76.origin.double x = v11;
  v76.origin.double y = v13;
  v76.size.double width = v15;
  v76.size.double height = v17;
  CGFloat v56 = CGRectGetMaxY(v76) - v50 + -8.0;
  v57 = [(BKLibraryBookshelfGridBookCell *)self selectIndicatorView];
  [v57 setFrame:v55, v56, v54, v50];

  v58 = [(BKLibraryBookshelfCollectionViewCell *)self audiobookControl];
  if (v58)
  {
    v59 = [(BKLibraryBookshelfGridBookCell *)self cellMetrics];
    [v59 audiobookControlMargin];
    double v61 = v60;

    [v58 frame];
    CGFloat v63 = v62;
    CGFloat v65 = v64;
    CGFloat v66 = v11 + v61;
    CGFloat v67 = v13 + v17 - v64 - v61;
    [v58 frame];
    v78.origin.double x = v66;
    v78.origin.double y = v67;
    v78.size.double width = v63;
    v78.size.double height = v65;
    if (!CGRectEqualToRect(v77, v78))
    {
      [(BKLibraryBookshelfGridBookCell *)self effectiveUserInterfaceLayoutDirection];
      IMRectFlippedForRTL();
      [v58 setFrame:];
    }
  }
  [(BKLibraryBookshelfGridBookCell *)self setWantsAnimatedLayoutChange:0];
}

- (void)applyLayoutAttributes:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  double v5 = BUDynamicCast();
  unsigned int v6 = [(BKLibraryBookshelfCollectionViewCell *)self isInEditMode];
  uint64_t v7 = v6 ^ [v5 editMode];
  v56.receiver = self;
  v56.super_class = (Class)BKLibraryBookshelfGridBookCell;
  [(BKLibraryBookshelfCollectionViewCell *)&v56 applyLayoutAttributes:v4];
  CGFloat v8 = [v4 indexPath];
  [(BKLibraryBookshelfGridBookCell *)self setIndexPath:v8];

  double v9 = +[UIApplication sharedApplication];
  -[BKLibraryBookshelfGridBookCell setIsRTL:](self, "setIsRTL:", [v9 userInterfaceLayoutDirection] == (id)1);

  id v10 = [v5 layoutDebugMode];
  if ([(BKLibraryBookshelfGridBookCell *)self layoutDebugMode] == v10)
  {
    if (v7)
    {
LABEL_3:
      BOOL v11 = 1;
      goto LABEL_12;
    }
  }
  else
  {
    [(BKLibraryBookshelfGridBookCell *)self setLayoutDebugMode:v10];
    if ([v5 layoutDebugMode])
    {
      double v12 = +[UIColor redColor];
      id v13 = [v12 colorWithAlphaComponent:0.2];
      id v14 = [v13 CGColor];
      double v15 = [(BKLibraryBookshelfGridBookCell *)self layer];
      [v15 setBorderColor:v14];

      double v16 = [(BKLibraryBookshelfGridBookCell *)self layer];
      [v16 setBorderWidth:0.5];

      double v17 = +[UIColor redColor];
      id v18 = [v17 colorWithAlphaComponent:0.2];
      id v19 = [v18 CGColor];
      double v20 = [(BKLibraryBookshelfGridBookCell *)self seriesSequenceLabel];
      double v21 = [v20 layer];
      [v21 setBorderColor:v19];

      double v22 = [(BKLibraryBookshelfGridBookCell *)self seriesSequenceLabel];
      CGRect v23 = [v22 layer];
      [v23 setBorderWidth:0.5];

      CGRect v24 = +[UIColor redColor];
      id v25 = [v24 colorWithAlphaComponent:0.2];
      id v26 = [v25 CGColor];
      v27 = [(BKLibraryBookshelfGridBookCell *)self infoCell];
      double v28 = [v27 layer];
      [v28 setBorderColor:v26];

      double v29 = [(BKLibraryBookshelfGridBookCell *)self infoCell];
      double v30 = [v29 layer];
      double v31 = v30;
      double v32 = 0.5;
    }
    else
    {
      double v33 = [(BKLibraryBookshelfGridBookCell *)self layer];
      [v33 setBorderWidth:0.0];

      double v34 = [(BKLibraryBookshelfGridBookCell *)self seriesSequenceLabel];
      double v35 = [v34 layer];
      [v35 setBorderWidth:0.0];

      double v29 = [(BKLibraryBookshelfGridBookCell *)self infoCell];
      double v30 = [v29 layer];
      double v31 = v30;
      double v32 = 0.0;
    }
    [v30 setBorderWidth:v32];

    if (v7) {
      goto LABEL_3;
    }
  }
  double v36 = [(BKLibraryBookshelfGridBookCell *)self metrics];
  CGFloat v37 = [v5 cellMetrics];
  if (v36 == v37)
  {
    double v38 = [(BKLibraryBookshelfGridBookCell *)self columnMetrics];
    unsigned __int8 v39 = [v5 columnMetrics];
    BOOL v11 = v38 != v39;
  }
  else
  {
    BOOL v11 = 1;
  }

LABEL_12:
  [(BKLibraryBookshelfGridBookCell *)self setWantsAnimatedLayoutChange:v7];
  -[BKLibraryBookshelfGridBookCell setHideInfoBar:](self, "setHideInfoBar:", [v5 editMode]);
  CGFloat v40 = [v5 cellMetrics];
  [(BKLibraryBookshelfGridBookCell *)self setMetrics:v40];

  double v41 = [v5 columnMetrics];
  [(BKLibraryBookshelfGridBookCell *)self setColumnMetrics:v41];

  double v42 = [v5 cellMetrics];
  double v43 = [(BKLibraryBookshelfGridBookCell *)self infoCell];
  [v43 setMetrics:v42];

  -[BKLibraryBookshelfGridBookCell setHideSelectIndicator:](self, "setHideSelectIndicator:", [v5 editMode] ^ 1);
  [(BKLibraryBookshelfGridBookCell *)self assetStateChanged];
  [v4 alpha];
  -[BKLibraryBookshelfCollectionViewCell setAlpha:](self, "setAlpha:");
  unsigned int v44 = [(BKLibraryBookshelfGridBookCell *)self hideInfoBar];
  double v45 = 1.0;
  if (v44) {
    double v45 = 0.0;
  }
  [(BKLibraryBookshelfInfoCell *)self->_infoCell setAlpha:v45];
  double v46 = [(BKLibraryBookshelfGridBookCell *)self seriesSequenceLabel];
  unsigned __int8 v47 = [v46 isHidden];

  if ((v47 & 1) == 0) {
    [(BKLibraryBookshelfGridBookCell *)self _updateSeriesSequenceLabelText];
  }
  [(BKLibraryBookshelfGridBookCell *)self _updateSupplementalContentPDFTitleLabelText];
  double v48 = [(BKLibraryBookshelfGridBookCell *)self _checkmarkImageForSelectedState:[(BKLibraryBookshelfGridBookCell *)self isSelected]];
  v49 = [(BKLibraryBookshelfGridBookCell *)self selectIndicatorView];
  [v49 setImage:v48];

  if (v11)
  {
    double v50 = [(BKLibraryBookshelfGridBookCell *)self libraryAsset];

    if (v50)
    {
      [(BKLibraryBookshelfGridBookCell *)self setNeedsLayout];
      v51 = [(BKLibraryBookshelfGridBookCell *)self coverView];
      uint64_t v52 = [v51 coverLayer];
      libraryAsset = self->_libraryAsset;
      [(BKLibraryBookshelfGridBookCell *)self coverArea];
      [v52 setLibraryAsset:libraryAsset size:v54 v55];
    }
  }
}

- (BOOL)needsAsset
{
  unsigned int v3 = [(BKLibraryBookshelfGridBookCell *)self libraryAsset];
  if ([v3 isStoreItem])
  {
    unsigned __int8 v4 = 1;
  }
  else
  {
    double v5 = [(BKLibraryBookshelfGridBookCell *)self libraryAsset];
    unsigned __int8 v4 = [v5 isSeriesItem];
  }
  return v4;
}

- (void)setAsset:(id)a3
{
  id v4 = a3;
  id v5 = [(BKLibraryBookshelfGridBookCell *)self infoCell];
  [v5 setAsset:v4];
}

- (BFMAsset)asset
{
  v2 = [(BKLibraryBookshelfGridBookCell *)self infoCell];
  unsigned int v3 = [v2 asset];

  return (BFMAsset *)v3;
}

- (void)assetStateChanged
{
  unsigned int v3 = [(BKLibraryBookshelfGridBookCell *)self libraryAsset];

  if (v3)
  {
    unsigned __int8 v4 = [(BKLibraryBookshelfGridBookCell *)self hideSelectIndicator];
    if (v4)
    {
      double v5 = 0.0;
    }
    else
    {
      id v7 = [(BKLibraryBookshelfGridBookCell *)self libraryAsset];
      double v5 = [v7 state] == 2 ? 0.0 : 1.0;
    }
    unsigned int v6 = [(BKLibraryBookshelfGridBookCell *)self selectIndicatorView];
    [v6 setAlpha:v5];

    if ((v4 & 1) == 0)
    {
    }
  }
}

- (BOOL)showSeriesSequenceLabel
{
  unsigned int v3 = [(BKLibraryBookshelfGridBookCell *)self dataSource];
  unsigned __int8 v4 = [v3 seriesID];
  if (v4)
  {
    double v5 = [(BKLibraryBookshelfGridBookCell *)self libraryAsset];
    unsigned int v6 = [v5 sequenceDisplayName];
    BOOL v7 = v6 != 0;
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (void)_updateSeriesSequenceLabelText
{
  unsigned int v3 = [(BKLibraryBookshelfGridBookCell *)self cellMetrics];
  unsigned __int8 v4 = [v3 seriesSequenceLabelFontAttributes];
  id v9 = [v4 attributesWithTruncated:1];

  double v5 = [(BKLibraryBookshelfGridBookCell *)self libraryAsset];
  unsigned int v6 = [v5 sequenceDisplayName];
  BOOL v7 = +[TUIFontSpec attributedStringWith:v6 attributes:v9];
  CGFloat v8 = [(BKLibraryBookshelfGridBookCell *)self seriesSequenceLabel];
  [v8 setAttributedText:v7];

  [(BKLibraryBookshelfGridBookCell *)self setNeedsLayout];
}

- (void)_updateSupplementalContentPDFTitleLabelText
{
  id v15 = [(BKLibraryBookshelfGridBookCell *)self dataSource];
  if ([v15 supplementalContentPDFPicker])
  {
    unsigned int v3 = [(BKLibraryBookshelfGridBookCell *)self dataSource];
    id v4 = [v3 viewMode];

    if (v4 != (id)1) {
      return;
    }
    double v5 = [(BKLibraryBookshelfGridBookCell *)self supplementalContentPdfTitleLabel];
    [v5 setHidden:0];

    unsigned int v6 = [(BKLibraryBookshelfGridBookCell *)self cellMetrics];
    BOOL v7 = [v6 smallTitleFontAttributes];
    id v15 = [v7 attributesWithCentered:1 truncated:1];

    CGFloat v8 = [(BKLibraryBookshelfGridBookCell *)self libraryAsset];
    id v9 = [v8 title];
    id v10 = +[TUIFontSpec attributedStringWith:v9 attributes:v15];
    BOOL v11 = [(BKLibraryBookshelfGridBookCell *)self supplementalContentPdfTitleLabel];
    [v11 setAttributedText:v10];

    double v12 = [(BKLibraryBookshelfGridBookCell *)self cellMetrics];
    id v13 = [v12 numOfLinesSmallTitle];
    id v14 = [(BKLibraryBookshelfGridBookCell *)self supplementalContentPdfTitleLabel];
    [v14 setNumberOfLines:v13];

    [(BKLibraryBookshelfGridBookCell *)self setNeedsLayout];
  }
}

- (void)_updateSeriesSequenceLabel:(BOOL)a3
{
  BOOL v3 = a3;
  double v5 = [(BKLibraryBookshelfGridBookCell *)self seriesSequenceLabel];
  unsigned int v6 = [v5 isHidden];

  unsigned int v7 = [(BKLibraryBookshelfGridBookCell *)self showSeriesSequenceLabel];
  if (v6 == v7)
  {
    CGFloat v8 = [(BKLibraryBookshelfGridBookCell *)self seriesSequenceLabel];
    [v8 setHidden:v7 ^ 1];

    if (v7)
    {
      BOOL v3 = 1;
    }
    else
    {
      id v9 = [(BKLibraryBookshelfGridBookCell *)self seriesSequenceLabel];
      [v9 setAttributedText:0];
    }
    [(BKLibraryBookshelfGridBookCell *)self setNeedsLayout];
  }
  if ((v7 & v3) == 1)
  {
    [(BKLibraryBookshelfGridBookCell *)self _updateSeriesSequenceLabelText];
  }
}

- (void)setLibraryAsset:(id)a3
{
  double v5 = (BKLibraryAsset *)a3;
  p_libraryAsset = &self->_libraryAsset;
  libraryAsset = self->_libraryAsset;
  if (libraryAsset != v5)
  {
    double v17 = v5;
    if (([(BKLibraryAsset *)libraryAsset isContainer] & 1) == 0)
    {
      [(BKLibraryAsset *)*p_libraryAsset removeObserver:self forKeyPath:@"state" context:off_100B1F318];
      [(BKLibraryAsset *)*p_libraryAsset removeObserver:self forKeyPath:@"title" context:off_100B1F320];
      [(BKLibraryAsset *)*p_libraryAsset removeObserver:self forKeyPath:@"author" context:off_100B1F320];
      [(BKLibraryAsset *)*p_libraryAsset removeObserver:self forKeyPath:@"genre" context:off_100B1F320];
    }
    objc_storeStrong((id *)&self->_libraryAsset, a3);
    CGFloat v8 = [(BKLibraryBookshelfGridBookCell *)self libraryAsset];
    id v9 = [(BKLibraryBookshelfGridBookCell *)self dataSource];
    unsigned int v10 = [v9 supplementalContentPDFPicker];

    if (v10)
    {
      [(BKLibraryBookshelfGridBookCell *)self _updateSupplementalContentPDFTitleLabelText];
      BOOL v11 = [(BKLibraryBookshelfGridBookCell *)self progressView];
      [v11 setHidden:0];

      double v12 = [(BKLibraryBookshelfGridBookCell *)self progressView];
      [v12 setAsset:v8];
    }
    id v13 = [(BKLibraryBookshelfGridBookCell *)self infoCell];
    [v13 setLibraryAsset:v8];

    id v14 = [(BKLibraryBookshelfGridBookCell *)self coverLayer];
    [(BKLibraryBookshelfGridBookCell *)self coverArea];
    [v14 setLibraryAsset:v8 size:v15, v16];

    if (v8)
    {
      if (([v8 isOwned] & 1) == 0) {
        [(BKLibraryBookshelfGridBookCell *)self updateLibraryAssetPrice];
      }
      [(BKLibraryBookshelfGridBookCell *)self _updateSeriesSequenceLabel:1];
      if (([v8 isContainer] & 1) == 0)
      {
        [v8 addObserver:self forKeyPath:@"state" options:0 context:off_100B1F318];
        [v8 addObserver:self forKeyPath:@"title" options:0 context:off_100B1F320];
        [v8 addObserver:self forKeyPath:@"author" options:0 context:off_100B1F320];
        [v8 addObserver:self forKeyPath:@"genre" options:0 context:off_100B1F320];
      }
      [(BKLibraryBookshelfGridBookCell *)self assetStateChanged];
      [(BKLibraryBookshelfGridBookCell *)self setNeedsLayout];
    }
    else
    {
      [(BKLibraryBookshelfGridBookCell *)self _updateSeriesSequenceLabel:1];
      [(BKLibraryBookshelfGridBookCell *)self assetStateChanged];
    }

    double v5 = v17;
  }
}

- (void)updateLibraryAssetPrice
{
  BOOL v3 = +[BKLibraryManager defaultManager];
  id v4 = [v3 priceManager];

  double v5 = [(BKLibraryBookshelfGridBookCell *)self libraryAsset];
  unsigned int v6 = [v5 storeID];

  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100138080;
  _OWORD v8[3] = &unk_100A47C60;
  id v9 = v6;
  unsigned int v10 = self;
  id v7 = v6;
  [v4 fetchPriceForAssetID:v7 completion:v8];
}

- (void)setDataSource:(id)a3
{
  p_dataSource = &self->_dataSource;
  id v5 = a3;
  objc_storeWeak((id *)p_dataSource, v5);
  unsigned int v6 = [(BKLibraryBookshelfGridBookCell *)self infoCell];
  [v6 setDataSource:v5];

  id v7 = [(BKLibraryBookshelfGridBookCell *)self _checkmarkImageForSelectedState:[(BKLibraryBookshelfGridBookCell *)self isSelected]];
  CGFloat v8 = [(BKLibraryBookshelfGridBookCell *)self selectIndicatorView];
  [v8 setImage:v7];

  [(BKLibraryBookshelfGridBookCell *)self _updateSeriesSequenceLabel:0];
  LODWORD(v7) = [v5 supplementalContentPDFPicker];

  if (v7)
  {
    id v9 = [(BKLibraryBookshelfGridBookCell *)self infoCell];
    [v9 setHidden:1];

    [(BKLibraryBookshelfGridBookCell *)self _updateSupplementalContentPDFTitleLabelText];
  }

  [(BKLibraryBookshelfGridBookCell *)self layoutIfNeeded];
}

- (void)setAudiobookStatus:(id)a3
{
  id v5 = (AEAssetAudiobookStatus *)a3;
  p_audiobookStatus = &self->_audiobookStatus;
  audiobookStatus = self->_audiobookStatus;
  if (audiobookStatus != v5)
  {
    unsigned int v10 = v5;
    if (audiobookStatus)
    {
      [(AEAssetAudiobookStatus *)audiobookStatus removeObserver:self forKeyPath:@"assetAudiobookStatusIsPlaying" context:off_100B1F308];
      [(AEAssetAudiobookStatus *)*p_audiobookStatus removeObserver:self forKeyPath:@"assetAudiobookStatusTrackProgress" context:off_100B1F310];
    }
    objc_storeStrong((id *)&self->_audiobookStatus, a3);
    if (*p_audiobookStatus)
    {
      [(AEAssetAudiobookStatus *)*p_audiobookStatus addObserver:self forKeyPath:@"assetAudiobookStatusIsPlaying" options:0 context:off_100B1F308];
      [(AEAssetAudiobookStatus *)*p_audiobookStatus addObserver:self forKeyPath:@"assetAudiobookStatusTrackProgress" options:0 context:off_100B1F310];
    }
    CGFloat v8 = [(BKLibraryBookshelfGridBookCell *)self infoCell];
    [v8 setAudiobookStatus:v10];

    id v9 = [(BKLibraryBookshelfGridBookCell *)self cellMetrics];
    [v9 audiobookControlDiameter];
    -[BKLibraryBookshelfCollectionViewCell updateAudiobookControlWithStatus:diameter:](self, "updateAudiobookControlWithStatus:diameter:", v10);

    id v5 = v10;
  }
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  objc_initWeak(&location, self);
  if (off_100B1F318 == a6)
  {
    id v13 = v23;
    id v14 = (id *)&v24;
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    double v15 = sub_100138620;
LABEL_10:
    v13[2] = v15;
    v13[3] = &unk_100A43F68;
    objc_copyWeak(v14, &location);
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v13);
    objc_destroyWeak(v14);
    goto LABEL_11;
  }
  if (off_100B1F308 == a6)
  {
    id v14 = (id *)&v22;
    id v13 = v21;
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    double v15 = sub_100138660;
    goto LABEL_10;
  }
  if (off_100B1F310 == a6)
  {
    id v14 = (id *)&v20;
    id v13 = v19;
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    double v15 = sub_1001386F0;
    goto LABEL_10;
  }
  if (off_100B1F320 == a6)
  {
    id v14 = (id *)&v18;
    id v13 = v17;
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    double v15 = sub_100138788;
    goto LABEL_10;
  }
  v16.receiver = self;
  v16.super_class = (Class)BKLibraryBookshelfGridBookCell;
  [(BKLibraryBookshelfGridBookCell *)&v16 observeValueForKeyPath:v10 ofObject:v11 change:v12 context:a6];
LABEL_11:
  objc_destroyWeak(&location);
}

- (void)didTapStopDownloadButtonWithAsset:(id)a3
{
  id v5 = [(BKLibraryBookshelfGridBookCell *)self actionHandler];
  id v4 = [(BKLibraryBookshelfGridBookCell *)self libraryAsset];
  [v5 bookCancelDownload:v4];
}

- (id)trackerForLibraryBookshelfInfoCell:(id)a3
{
  BOOL v3 = [(BKLibraryBookshelfGridBookCell *)self actionHandler];
  id v4 = [v3 tracker];

  return v4;
}

- (id)libraryBookshelfInfoCell:(id)a3 analyticsAssetPropertyProviderForLibraryAsset:(id)a4 fromSourceView:(id)a5 inCollection:(id)a6
{
  id v9 = a6;
  id v10 = a5;
  id v11 = a4;
  id v12 = [(BKLibraryBookshelfGridBookCell *)self actionHandler];
  id v13 = [v12 analyticsAssetPropertyProviderForLibraryAsset:v11 fromSourceView:v10 inCollection:v9];

  return v13;
}

- (id)libraryBookshelfInfoCell:(id)a3 menuWithLibraryAsset:(id)a4 sourceView:(id)a5 collection:(id)a6
{
  id v9 = a6;
  id v10 = a5;
  id v11 = a4;
  id v12 = [(BKLibraryBookshelfGridBookCell *)self actionHandler];
  id v13 = [v12 menuWithLibraryAsset:v11 sourceView:v10 collection:v9];

  return v13;
}

- (void)libraryBookshelfInfoCellDidSelectCancelDownload:(id)a3 sourceView:(id)a4
{
  id v6 = [(BKLibraryBookshelfGridBookCell *)self actionHandler];
  id v5 = [(BKLibraryBookshelfGridBookCell *)self libraryAsset];
  [v6 bookCancelDownload:v5];
}

- (void)libraryBookshelfInfoCellDidSelectResumeDownload:(id)a3 sourceView:(id)a4
{
  id v6 = [(BKLibraryBookshelfGridBookCell *)self actionHandler];
  id v5 = [(BKLibraryBookshelfGridBookCell *)self libraryAsset];
  [v6 bookResumeDownload:v5];
}

- (BOOL)shouldDragWithTouch:(id)a3
{
  return 1;
}

- (void)setupMenuWithLibraryAsset:(id)a3 withActionHandler:(id)a4
{
  id v4 = [(BKLibraryBookshelfGridBookCell *)self infoCell];
  [v4 setupMenu];
}

- (void)togglePlayPause:(id)a3
{
  id v3 = [(BKLibraryBookshelfGridBookCell *)self audiobookStatus];
  [v3 assetAudiobookStatusTogglePlayPause];
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (BOOL)_accessibilityIsSpeakThisElement
{
  return 1;
}

- (int64_t)accessibilityElementCount
{
  return 0;
}

- (id)accessibilityElements
{
  return 0;
}

- (id)accessibilityLabel
{
  id v3 = objc_opt_new();
  id v4 = objc_opt_new();
  id v5 = objc_opt_new();
  id v6 = [(BKLibraryBookshelfGridBookCell *)self libraryAsset];
  id v7 = [(BKLibraryBookshelfGridBookCell *)self formattedPrice];
  if ([v6 isDownloading])
  {
    CGFloat v8 = v7;
    id v9 = +[NSBundle mainBundle];
    id v10 = [v9 localizedStringForKey:@"Downloading" value:&stru_100A70340 table:0];
    [v3 addObject:v10];

    id v11 = +[BKLibraryAssetStatusController sharedController];
    id v12 = [v6 permanentOrTemporaryAssetID];
    id v13 = [v11 statusForAssetID:v12];

    if ([v13 state] == (id)4 && (uint64_t)objc_msgSend(v13, "timeRemaining") >= 1)
    {
      id v14 = +[NSBundle mainBundle];
      double v15 = [v14 localizedStringForKey:@"%@ remaining" value:&stru_100A70340 table:0];

      objc_super v16 = +[BKLibraryBookshelfGridBookCell bkaxDownloadAndAudiobookProgressFormatter];
      double v17 = [v16 stringFromTimeInterval:[v13 timeRemaining]];
      uint64_t v18 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v15, v17);
      [v3 addObject:v18];
    }
    unsigned int v90 = 0;
    id v7 = v8;
    goto LABEL_64;
  }
  if ([v6 isAudiobook])
  {
    id v19 = [v6 assetID];
    if (v19 && [v6 isOwned]) {
      unsigned int v90 = [v6 isNew];
    }
    else {
      unsigned int v90 = 0;
    }
    goto LABEL_15;
  }
  if ([v6 isOwned] && objc_msgSend(v6, "isNew"))
  {
    id v19 = [v6 readingProgress];
    unsigned int v90 = v19 == 0;
LABEL_15:

    goto LABEL_16;
  }
  unsigned int v90 = 0;
LABEL_16:
  if (([v6 isSample] & 1) != 0
    || ([v6 isOwned] & 1) == 0 && objc_msgSend(v6, "isInSamples"))
  {
    uint64_t v20 = +[NSBundle mainBundle];
    double v21 = [v20 localizedStringForKey:@"Sample" value:&stru_100A70340 table:0];
    [v3 addObject:v21];

    int v22 = 1;
  }
  else
  {
    int v22 = 0;
  }
  CGRect v23 = [(BKLibraryBookshelfGridBookCell *)self asset];
  unsigned int v24 = [v23 isPreorder];

  if (v24)
  {
    if ([v6 isPreorderBook])
    {
      id v25 = +[NSBundle mainBundle];
      uint64_t v26 = [v25 localizedStringForKey:@"Preordered" value:&stru_100A70340 table:0];
    }
    else
    {
      if (!v7)
      {
LABEL_30:
        double v29 = [(BKLibraryBookshelfGridBookCell *)self asset];
        double v30 = [v29 expectedReleaseDate];

        if (!v30) {
          goto LABEL_41;
        }
        v88 = v4;
        double v31 = +[NSBundle mainBundle];
        uint64_t v86 = [v31 localizedStringForKey:@"Expected %@" value:&stru_100A70340 table:0];

        id v32 = objc_alloc_init((Class)NSDateFormatter);
        [v32 setDateStyle:3];
        double v33 = +[NSTimeZone timeZoneForSecondsFromGMT:0];
        [v32 setTimeZone:v33];

        double v34 = [(BKLibraryBookshelfGridBookCell *)self asset];
        [v34 expectedReleaseDate];
        v87 = v5;
        v36 = double v35 = v7;
        CGFloat v37 = [v32 stringFromDate:v36];
        double v38 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v86, v37);
        [v3 addObject:v38];

        unsigned __int8 v39 = (void *)v86;
        id v7 = v35;
        id v5 = v87;
        goto LABEL_39;
      }
      v27 = +[NSBundle mainBundle];
      id v25 = [v27 localizedStringForKey:@"Preorder for %@" value:&stru_100A70340 table:0];

      uint64_t v26 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v25, v7);
    }
    double v28 = (void *)v26;
    [v3 addObject:v26];

    goto LABEL_30;
  }
  if (([v6 isStoreItem] & 1) == 0)
  {
    if ((v22 | [v6 isSeriesItem] ^ 1)) {
      goto LABEL_41;
    }
    goto LABEL_33;
  }
  if ((v22 & 1) == 0)
  {
LABEL_33:
    CGFloat v40 = [(BKLibraryBookshelfGridBookCell *)self asset];
    unsigned __int8 v39 = [v40 price];

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      && (objc_opt_class(),
          BUDynamicCast(),
          double v41 = objc_claimAutoreleasedReturnValue(),
          [v41 floatValue],
          float v43 = v42,
          v41,
          v43 == 0.0))
    {
      v88 = v4;
      id v32 = +[NSBundle mainBundle];
      uint64_t v44 = [v32 localizedStringForKey:@"Free download" value:&stru_100A70340 table:0];
    }
    else
    {
      if (!v7)
      {
LABEL_40:

        goto LABEL_41;
      }
      v88 = v4;
      double v45 = +[NSBundle mainBundle];
      id v32 = [v45 localizedStringForKey:@"Buy for %@" value:&stru_100A70340 table:0];

      uint64_t v44 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v32, v7);
    }
    double v34 = (void *)v44;
    [v3 addObject:v44];
LABEL_39:

    id v4 = v88;
    goto LABEL_40;
  }
LABEL_41:
  if ([v6 isFinished])
  {
    unsigned int v46 = [v6 isAudiobook];
    unsigned __int8 v47 = +[NSBundle mainBundle];
    double v48 = v47;
    if (v46) {
      CFStringRef v49 = @"Finished";
    }
    else {
      CFStringRef v49 = @"Finished book";
    }
    uint64_t v52 = [v47 localizedStringForKey:v49 value:&stru_100A70340 table:0];
    [v4 addObject:v52];
    goto LABEL_52;
  }
  if ([v6 isOwned])
  {
    double v50 = +[NSBundle mainBundle];
    double v48 = [v50 localizedStringForKey:@"%@ finished" value:&stru_100A70340 table:0];

    if ([v6 isAudiobook])
    {
      v51 = [(BKLibraryBookshelfGridBookCell *)self infoCell];
      uint64_t v52 = [v51 bkaxAudiobookReadPercentage];

      if (!v52) {
        goto LABEL_52;
      }
    }
    else
    {
      uint64_t v52 = [v6 readingProgress];
      if (!v52)
      {
LABEL_52:

        goto LABEL_53;
      }
    }
    uint64_t v53 = +[NSString bc_formattedReadingProgress:isFinished:](NSString, "bc_formattedReadingProgress:isFinished:", v52, [v6 isFinished]);
    double v54 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v48, v53);
    [v4 addObject:v54];

    goto LABEL_52;
  }
LABEL_53:
  if ([v6 isOwned] && objc_msgSend(v6, "isCloud"))
  {
    double v55 = +[NSBundle mainBundle];
    objc_super v56 = [v55 localizedStringForKey:@"In iCloud" value:&stru_100A70340 table:0];
    [v4 addObject:v56];
  }
  if ([v6 isAudiobook])
  {
    v57 = [(BKLibraryBookshelfGridBookCell *)self infoCell];
    unsigned int v58 = [v57 showsPlaybackProgress];

    if (v58)
    {
      v59 = [(BKLibraryBookshelfGridBookCell *)self audiobookStatus];
      unsigned int v60 = [v59 assetAudiobookStatusIsPlaying];

      double v61 = +[NSBundle mainBundle];
      double v62 = v61;
      if (v60) {
        CFStringRef v63 = @"Playing";
      }
      else {
        CFStringRef v63 = @"Paused";
      }
      [v61 localizedStringForKey:v63 value:&stru_100A70340 table:0];
      double v64 = v89 = v7;
      [v4 addObject:v64];

      CGFloat v65 = +[NSBundle mainBundle];
      CGFloat v66 = [v65 localizedStringForKey:@"%@ remaining in chapter" value:&stru_100A70340 table:0];

      CGFloat v67 = +[BKLibraryBookshelfGridBookCell bkaxDownloadAndAudiobookProgressFormatter];
      v68 = [(BKLibraryBookshelfGridBookCell *)self audiobookStatus];
      [v68 assetAudiobookStatusTrackTimeRemaining];
      objc_super v69 = objc_msgSend(v67, "stringFromTimeInterval:");
      CGRect v70 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v66, v69);
      [v4 addObject:v70];

      id v7 = v89;
    }
  }
  if ([(BKLibraryBookshelfGridBookCell *)self showSeriesSequenceLabel])
  {
    id v13 = [v6 sequenceDisplayName];
    [v5 addObject:v13];
LABEL_64:
  }
  CGRect v71 = [v6 title];
  id v72 = [v71 length];

  if (v72)
  {
    CGRect v73 = [v6 title];
    [v5 addObject:v73];
  }
  CGRect v74 = [v6 displayAuthor];
  id v75 = [v74 length];

  if (v75)
  {
    CGRect v76 = [v6 displayAuthor];
    [v5 addObject:v76];
  }
  if (([v6 isContainer] & 1) == 0 && objc_msgSend(v6, "isAudiobook"))
  {
    CGRect v77 = +[NSBundle mainBundle];
    CGRect v78 = [v77 localizedStringForKey:@"Audiobook" value:&stru_100A70340 table:0];
    [v4 addObject:v78];
  }
  if ([v6 isContainer])
  {
    v79 = +[NSBundle mainBundle];
    v80 = [v79 localizedStringForKey:@"Series" value:&stru_100A70340 table:0];
    [v4 addObject:v80];
  }
  if (v90)
  {
    v81 = +[NSBundle mainBundle];
    v82 = [v81 localizedStringForKey:@"New" value:&stru_100A70340 table:0];
    [v3 insertObject:v82 atIndex:0];
  }
  v83 = objc_opt_new();
  [v83 addObjectsFromArray:v3];
  [v83 addObjectsFromArray:v5];
  [v83 addObjectsFromArray:v4];
  v84 = [v83 componentsJoinedByString:@", "];

  return v84;
}

- (id)accessibilityUserInputLabels
{
  id v3 = objc_alloc_init((Class)NSMutableArray);
  id v4 = [(BKLibraryBookshelfGridBookCell *)self libraryAsset];
  id v5 = [v4 title];

  if ([v5 length]) {
    [v3 addObject:v5];
  }
  id v6 = [(BKLibraryBookshelfGridBookCell *)self accessibilityLabel];
  if ([v6 length]) {
    [v3 addObject:v6];
  }

  return v3;
}

- (id)accessibilityHint
{
  id v3 = [(BKLibraryBookshelfGridBookCell *)self libraryAsset];
  unsigned __int8 v4 = [v3 isDownloading];

  if (v4)
  {
    id v5 = 0;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)BKLibraryBookshelfGridBookCell;
    id v5 = [(BKLibraryBookshelfGridBookCell *)&v7 accessibilityHint];
  }

  return v5;
}

- (unint64_t)accessibilityTraits
{
  v8.receiver = self;
  v8.super_class = (Class)BKLibraryBookshelfGridBookCell;
  unint64_t v3 = [(BKLibraryBookshelfGridBookCell *)&v8 accessibilityTraits];
  unsigned __int8 v4 = [(BKLibraryBookshelfGridBookCell *)self libraryAsset];
  unsigned int v5 = [v4 isDownloading];

  UIAccessibilityTraits v6 = UIAccessibilityTraitButton;
  if (v5) {
    UIAccessibilityTraits v6 = 0;
  }
  return v6 | v3 | UIAccessibilityTraitUpdatesFrequently;
}

- (id)accessibilityCustomActions
{
  unint64_t v3 = objc_opt_new();
  id v4 = [(BKLibraryBookshelfGridBookCell *)self infoCell];
  if ([v4 _accessibilityViewIsVisible])
  {
    unsigned int v5 = [(BKLibraryBookshelfGridBookCell *)self infoCell];
    UIAccessibilityTraits v6 = [v5 moreButton];
    unsigned int v7 = [v6 _accessibilityViewIsVisible];

    if (!v7) {
      goto LABEL_5;
    }
    id v8 = objc_alloc((Class)UIAccessibilityCustomAction);
    id v9 = +[NSBundle mainBundle];
    id v10 = [v9 localizedStringForKey:@"Show Actions Popover" value:&stru_100A70340 table:0];
    id v4 = [v8 initWithName:v10 target:self selector:"_accessibilityDidTriggerShowMenuAction"];

    [v3 addObject:v4];
  }

LABEL_5:
  id v11 = [(BKLibraryBookshelfGridBookCell *)self libraryAsset];
  if ([v11 isAudiobook])
  {
    id v12 = [(BKLibraryBookshelfGridBookCell *)self infoCell];
    unsigned int v13 = [v12 showsPlaybackProgress];

    if (!v13) {
      goto LABEL_15;
    }
    id v14 = [(BKLibraryBookshelfGridBookCell *)self audiobookStatus];
    unsigned int v15 = [v14 assetAudiobookStatusIsPlaying];

    objc_super v16 = +[NSBundle mainBundle];
    double v17 = v16;
    if (v15) {
      CFStringRef v18 = @"Pause";
    }
    else {
      CFStringRef v18 = @"Play";
    }
    if (v15) {
      CFStringRef v19 = @"pause.fill";
    }
    else {
      CFStringRef v19 = @"play.fill";
    }
    id v11 = [v16 localizedStringForKey:v18 value:&stru_100A70340 table:0];

    uint64_t v20 = +[UIImageSymbolConfiguration configurationWithPointSize:30.0];
    double v21 = +[UIImage systemImageNamed:v19 withConfiguration:v20];

    id v22 = [objc_alloc((Class)UIAccessibilityCustomAction) initWithName:v11 image:v21 target:self selector:"_accessibilityDidTriggerPlayPauseAction"];
    [v3 addObject:v22];
  }
LABEL_15:
  id v23 = [v3 copy];

  return v23;
}

- (BOOL)_accessibilityDidTriggerShowMenuAction
{
  v2 = [(BKLibraryBookshelfGridBookCell *)self infoCell];
  unint64_t v3 = [v2 moreButton];
  [v3 sendActionsForControlEvents:64];

  return 1;
}

- (BOOL)_accessibilityDidTriggerPlayPauseAction
{
  return 1;
}

- (BOOL)accessibilityActivate
{
  if ([(BKLibraryBookshelfCollectionViewCell *)self isInEditMode])
  {
    unint64_t v3 = [(BKLibraryBookshelfCollectionViewCell *)self delegate];
    id v4 = [v3 indexPathForCell:self];

    if (v4)
    {
      unsigned int v5 = [(BKLibraryBookshelfGridBookCell *)self isSelected];
      UIAccessibilityTraits v6 = [(BKLibraryBookshelfCollectionViewCell *)self delegate];
      unsigned int v7 = v6;
      if (v5) {
        [v6 selectItemAtIndexPath:v4 animated:1 scrollPosition:0];
      }
      else {
        [v6 deselectItemAtIndexPath:v4 animated:1];
      }
    }
    return 0;
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)BKLibraryBookshelfGridBookCell;
    return [(BKLibraryBookshelfGridBookCell *)&v9 accessibilityActivate];
  }
}

+ (NSDateComponentsFormatter)bkaxDownloadAndAudiobookProgressFormatter
{
  v2 = (void *)qword_100B4A418;
  if (!qword_100B4A418)
  {
    id v3 = objc_alloc_init((Class)NSDateComponentsFormatter);
    [v3 setZeroFormattingBehavior:14];
    [v3 setAllowedUnits:224];
    [v3 setUnitsStyle:4];
    id v4 = (void *)qword_100B4A418;
    qword_100B4A418 = (uint64_t)v3;

    v2 = (void *)qword_100B4A418;
  }

  return (NSDateComponentsFormatter *)v2;
}

- (void)setCoverView:(id)a3
{
}

- (BKLibraryAsset)libraryAsset
{
  return self->_libraryAsset;
}

- (BKLibraryBookshelfSupplementaryDataSource)dataSource
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);

  return (BKLibraryBookshelfSupplementaryDataSource *)WeakRetained;
}

- (BKLibraryBookshelfCellMetrics)metrics
{
  return self->_metrics;
}

- (void)setMetrics:(id)a3
{
}

- (BKLibraryBookshelfColumnMetrics)columnMetrics
{
  return self->_columnMetrics;
}

- (void)setColumnMetrics:(id)a3
{
}

- (NSIndexPath)indexPath
{
  return self->_indexPath;
}

- (void)setIndexPath:(id)a3
{
}

- (BKLibraryBookshelfStorageProvider)storageProvider
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_storageProvider);

  return (BKLibraryBookshelfStorageProvider *)WeakRetained;
}

- (void)setStorageProvider:(id)a3
{
}

- (BKLibraryBookshelfLayoutManager)layoutManager
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_layoutManager);

  return (BKLibraryBookshelfLayoutManager *)WeakRetained;
}

- (void)setLayoutManager:(id)a3
{
}

- (BKLibraryActionHandler)actionHandler
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_actionHandler);

  return (BKLibraryActionHandler *)WeakRetained;
}

- (void)setActionHandler:(id)a3
{
}

- (AEAssetAudiobookStatus)audiobookStatus
{
  return self->_audiobookStatus;
}

- (BOOL)hasSeriesSequenceLabel
{
  return self->_hasSeriesSequenceLabel;
}

- (void)setHasSeriesSequenceLabel:(BOOL)a3
{
  self->_hasSeriesSequenceLabel = a3;
}

- (BKLibraryBookshelfInfoCell)infoCell
{
  return self->_infoCell;
}

- (void)setInfoCell:(id)a3
{
}

- (BOOL)hideSelectIndicator
{
  return self->_hideSelectIndicator;
}

- (void)setHideSelectIndicator:(BOOL)a3
{
  self->_hideSelectIndicator = a3;
}

- (BOOL)pendingTouchUp
{
  return self->_pendingTouchUp;
}

- (void)setPendingTouchUp:(BOOL)a3
{
  self->_pendingTouchUp = a3;
}

- (BOOL)pendingAnimationCompletion
{
  return self->_pendingAnimationCompletion;
}

- (void)setPendingAnimationCompletion:(BOOL)a3
{
  self->_pendingAnimationCompletion = a3;
}

- (BOOL)wantsAnimatedLayoutChange
{
  return self->_wantsAnimatedLayoutChange;
}

- (void)setWantsAnimatedLayoutChange:(BOOL)a3
{
  self->_wantsAnimatedLayoutChange = a3;
}

- (void)setProgressView:(id)a3
{
}

- (NSString)formattedPrice
{
  return self->_formattedPrice;
}

- (void)setFormattedPrice:(id)a3
{
}

- (int)layoutDebugMode
{
  return self->_layoutDebugMode;
}

- (void)setLayoutDebugMode:(int)a3
{
  self->_layoutDebugMode = a3;
}

- (UIImageView)selectIndicatorView
{
  return self->_selectIndicatorView;
}

- (void)setSelectIndicatorView:(id)a3
{
}

- (UILabel)seriesSequenceLabel
{
  return self->_seriesSequenceLabel;
}

- (void)setSeriesSequenceLabel:(id)a3
{
}

- (BOOL)hideInfoBar
{
  return self->_hideInfoBar;
}

- (void)setHideInfoBar:(BOOL)a3
{
  self->_hideInfoBar = a3;
}

- (BOOL)isRTL
{
  return self->_isRTL;
}

- (void)setIsRTL:(BOOL)a3
{
  self->_isRTL = a3;
}

- (UILabel)supplementalContentPdfTitleLabel
{
  return self->_supplementalContentPdfTitleLabel;
}

- (void)setSupplementalContentPdfTitleLabel:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_supplementalContentPdfTitleLabel, 0);
  objc_storeStrong((id *)&self->_seriesSequenceLabel, 0);
  objc_storeStrong((id *)&self->_selectIndicatorView, 0);
  objc_storeStrong((id *)&self->_formattedPrice, 0);
  objc_storeStrong((id *)&self->_progressView, 0);
  objc_storeStrong((id *)&self->_infoCell, 0);
  objc_storeStrong((id *)&self->_audiobookStatus, 0);
  objc_destroyWeak((id *)&self->_actionHandler);
  objc_destroyWeak((id *)&self->_layoutManager);
  objc_destroyWeak((id *)&self->_storageProvider);
  objc_storeStrong((id *)&self->_indexPath, 0);
  objc_storeStrong((id *)&self->_columnMetrics, 0);
  objc_storeStrong((id *)&self->_metrics, 0);
  objc_destroyWeak((id *)&self->_dataSource);
  objc_storeStrong((id *)&self->_libraryAsset, 0);

  objc_storeStrong((id *)&self->_coverView, 0);
}

@end