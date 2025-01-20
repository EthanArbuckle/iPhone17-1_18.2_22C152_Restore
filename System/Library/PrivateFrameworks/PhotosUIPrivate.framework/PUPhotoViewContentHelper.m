@interface PUPhotoViewContentHelper
+ (CGRect)_imageContentFrameForBounds:(CGRect)result imageSize:(CGSize)a4 fillMode:(int64_t)a5;
+ (CGSize)sizeThatFits:(CGSize)a3 imageSize:(CGSize)a4 fillMode:(int64_t)a5;
- (AVAsset)loopingVideoAsset;
- (BOOL)_needsUpdate;
- (BOOL)avoidsImageViewIfPossible;
- (BOOL)avoidsPhotoDecoration;
- (BOOL)continuousCorners;
- (BOOL)flattensBadgeView;
- (BOOL)isAnimatingRoundedCorners;
- (BOOL)isHighlighted;
- (BOOL)isImageViewEdgeAntialiasingEnabled;
- (BOOL)isLivePhotoHidden;
- (BOOL)isTextBannerVisible;
- (BOOL)loopingPlaybackAllowed;
- (BOOL)needsAvalancheStack;
- (BOOL)providesVisualFeedbackOnPress;
- (BOOL)shouldPrepareForPlayback;
- (BOOL)showsLivePhoto;
- (BOOL)useOverlay;
- (CGAffineTransform)imageTransform;
- (CGColor)avalancheStackBackgroundColor;
- (CGRect)imageContentFrame;
- (CGRect)imageContentFrameForBounds:(CGRect)a3;
- (CGRect)photoDecorationBorderViewFrameForImageContentFrame:(CGRect)a3;
- (CGSize)contentViewSizeThatFits:(CGSize)a3;
- (CGSize)customPaddingForBadgeElements;
- (CGSize)photoSize;
- (ISWrappedAVAudioSession)_audioSession;
- (NSString)subtitle;
- (NSString)title;
- (NSString)titleFontName;
- (PHAnimatedImage)animatedImage;
- (PHLivePhoto)livePhoto;
- (PHLivePhotoView)livePhotoView;
- (PUAvalancheStackView)avalancheStackView;
- (PUPhotoDecoration)photoDecoration;
- (PUPhotoViewContentHelper)init;
- (PUPhotoViewContentHelper)initWithContentView:(id)a3;
- (PUPhotoViewContentHelperDelegate)delegate;
- (PXAssetBadgeInfo)badgeInfo;
- (PXCollectionTileLayoutTemplate)collectionTileLayoutTemplate;
- (PXFeatureSpec)featureSpec;
- (PXRoundedCornerOverlayView)roundedCornerOverlayView;
- (PXTextBannerView)textBannerView;
- (PXTitleSubtitleUILabel)_titleSubtitleLabel;
- (PXUIAssetBadgeView)_badgeView;
- (UIColor)backgroundColor;
- (UIColor)overlayColor;
- (UIImage)photoImage;
- (UIImage)placeHolderImage;
- (UIImageView)_crossfadeImageView;
- (UIImageView)photoImageView;
- (UIView)_highlightOverlayView;
- (UIView)contentView;
- (UIView)darkContentOverlay;
- (UIView)transitionSnapshotView;
- (double)contentAlpha;
- (double)cornerRadius;
- (double)darkContentOverlayAlpha;
- (int64_t)badgeStyle;
- (int64_t)fillMode;
- (int64_t)preferredImageDynamicRange;
- (unint64_t)cornersToRound;
- (void)_addAvalancheStackViewIfNecessary;
- (void)_invalidateAnimatedImageView;
- (void)_invalidateLoopingVideoView;
- (void)_invalidateTitleSubtitleUILabel;
- (void)_removeAvalancheStackViewIfNecessary;
- (void)_removePhotoImageViewIfNecessary;
- (void)_setAudioSession:(id)a3;
- (void)_setBadgeView:(id)a3;
- (void)_setHighlightOverlayView:(id)a3;
- (void)_setTitleSubtitleUILabel:(id)a3;
- (void)_startPlaybackWhenLivePhotoAvailableWithStyle:(int64_t)a3;
- (void)_updateAnimatedImageViewIfNeeded;
- (void)_updateBadgeView;
- (void)_updateContentViewClipsToBounds;
- (void)_updateHighlight;
- (void)_updateIfNeeded;
- (void)_updateImageView;
- (void)_updateLayerBackgroundColorIfNeeded;
- (void)_updateLayerCornerRadius;
- (void)_updateLivePhotoView;
- (void)_updateLivePhotoViewPreparing;
- (void)_updateLivePhotoViewVisibility;
- (void)_updateLoopingVideoViewIfNeeded;
- (void)_updatePhotoDecoration;
- (void)_updateRoundedCornersOverlayView;
- (void)_updateSubviewOrdering;
- (void)_updateTextBannerView;
- (void)_updateTitleSubtitleUILabelIfNeeded;
- (void)_updateUnderlyingImageViewDynamicRange;
- (void)animateCrossfadeToImage:(id)a3;
- (void)animateCrossfadeToImage:(id)a3 duration:(double)a4;
- (void)layoutSubviewsOfContentView;
- (void)livePhotoView:(id)a3 willBeginPlaybackWithStyle:(int64_t)a4;
- (void)setAnimatedImage:(id)a3;
- (void)setAnimatingRoundedCorners:(BOOL)a3;
- (void)setAvalancheStackBackgroundColor:(CGColor *)a3;
- (void)setAvalancheStackView:(id)a3;
- (void)setAvoidsImageViewIfPossible:(BOOL)a3;
- (void)setAvoidsPhotoDecoration:(BOOL)a3;
- (void)setBackgroundColor:(id)a3;
- (void)setBadgeInfo:(PXAssetBadgeInfo *)a3;
- (void)setBadgeStyle:(int64_t)a3;
- (void)setCollectionTileLayoutTemplate:(id)a3;
- (void)setContentAlpha:(double)a3;
- (void)setContinuousCorners:(BOOL)a3;
- (void)setCornerRadius:(double)a3;
- (void)setCornerRadius:(double)a3 cornersToRound:(unint64_t)a4 useOverlay:(BOOL)a5 overlayColor:(id)a6 continuousCorners:(BOOL)a7;
- (void)setCornersToRound:(unint64_t)a3;
- (void)setCustomPaddingForBadgeElements:(CGSize)a3;
- (void)setDarkContentOverlay:(id)a3;
- (void)setDarkContentOverlayAlpha:(double)a3;
- (void)setDelegate:(id)a3;
- (void)setFeatureSpec:(id)a3;
- (void)setFillMode:(int64_t)a3;
- (void)setFlattensBadgeView:(BOOL)a3;
- (void)setHighlighted:(BOOL)a3;
- (void)setImageTransform:(CGAffineTransform *)a3;
- (void)setImageViewEdgeAntialiasingEnabled:(BOOL)a3;
- (void)setLivePhoto:(id)a3;
- (void)setLivePhotoHidden:(BOOL)a3;
- (void)setLivePhotoView:(id)a3;
- (void)setLoopingPlaybackAllowed:(BOOL)a3;
- (void)setLoopingVideoAsset:(id)a3;
- (void)setNeedsAvalancheStack:(BOOL)a3;
- (void)setOverlayColor:(id)a3;
- (void)setPhotoDecoration:(id)a3;
- (void)setPhotoImage:(id)a3;
- (void)setPhotoImageView:(id)a3;
- (void)setPhotoSize:(CGSize)a3;
- (void)setPlaceHolderImage:(id)a3;
- (void)setPreferredImageDynamicRange:(int64_t)a3;
- (void)setRoundedCornerOverlayView:(id)a3;
- (void)setShouldPrepareForPlayback:(BOOL)a3;
- (void)setShowsLivePhoto:(BOOL)a3;
- (void)setSubtitle:(id)a3;
- (void)setTextBannerVisible:(BOOL)a3;
- (void)setTitle:(id)a3;
- (void)setTitleFontName:(id)a3;
- (void)setTransitionSnapshotView:(id)a3;
- (void)setUseOverlay:(BOOL)a3;
- (void)set_crossfadeImageView:(id)a3;
- (void)startPlaybackWithStyle:(int64_t)a3;
- (void)stopPlayback;
- (void)updatePhotoImageWithoutReconfiguring:(id)a3;
@end

@implementation PUPhotoViewContentHelper

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__audioSession, 0);
  objc_storeStrong((id *)&self->__titleSubtitleLabel, 0);
  objc_storeStrong((id *)&self->__badgeView, 0);
  objc_storeStrong((id *)&self->__highlightOverlayView, 0);
  objc_storeStrong((id *)&self->_roundedCornerOverlayView, 0);
  objc_storeStrong((id *)&self->_livePhotoView, 0);
  objc_storeStrong((id *)&self->_avalancheStackView, 0);
  objc_storeStrong((id *)&self->__crossfadeImageView, 0);
  objc_storeStrong((id *)&self->_darkContentOverlay, 0);
  objc_storeStrong((id *)&self->_photoImageView, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_titleFontName, 0);
  objc_storeStrong((id *)&self->_collectionTileLayoutTemplate, 0);
  objc_storeStrong((id *)&self->_featureSpec, 0);
  objc_storeStrong((id *)&self->_textBannerView, 0);
  objc_storeStrong((id *)&self->_animatedImage, 0);
  objc_storeStrong((id *)&self->_loopingVideoAsset, 0);
  objc_storeStrong((id *)&self->_livePhoto, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_backgroundColor, 0);
  objc_storeStrong((id *)&self->_overlayColor, 0);
  objc_storeStrong((id *)&self->_photoDecoration, 0);
  objc_storeStrong((id *)&self->_transitionSnapshotView, 0);
  objc_storeStrong((id *)&self->_placeHolderImage, 0);
  objc_storeStrong((id *)&self->_photoImage, 0);
  objc_destroyWeak((id *)&self->_contentView);
  objc_storeStrong((id *)&self->_animatedImageView, 0);
  objc_storeStrong((id *)&self->_loopingVideoPlayer, 0);
  objc_storeStrong((id *)&self->_loopingVideoView, 0);
  objc_storeStrong((id *)&self->_layerDefaultBackgroundColor, 0);
  objc_storeStrong((id *)&self->_photoDecorationOverlayView, 0);
  objc_storeStrong((id *)&self->_photoDecorationBorderView, 0);
}

- (ISWrappedAVAudioSession)_audioSession
{
  return self->__audioSession;
}

- (void)_setTitleSubtitleUILabel:(id)a3
{
}

- (PXTitleSubtitleUILabel)_titleSubtitleLabel
{
  return self->__titleSubtitleLabel;
}

- (void)_setBadgeView:(id)a3
{
}

- (PXUIAssetBadgeView)_badgeView
{
  return self->__badgeView;
}

- (void)_setHighlightOverlayView:(id)a3
{
}

- (UIView)_highlightOverlayView
{
  return self->__highlightOverlayView;
}

- (void)setRoundedCornerOverlayView:(id)a3
{
}

- (PXRoundedCornerOverlayView)roundedCornerOverlayView
{
  return self->_roundedCornerOverlayView;
}

- (void)setLivePhotoView:(id)a3
{
}

- (PHLivePhotoView)livePhotoView
{
  return self->_livePhotoView;
}

- (void)setAvalancheStackView:(id)a3
{
}

- (PUAvalancheStackView)avalancheStackView
{
  return self->_avalancheStackView;
}

- (void)set_crossfadeImageView:(id)a3
{
}

- (UIImageView)_crossfadeImageView
{
  return self->__crossfadeImageView;
}

- (void)setDarkContentOverlay:(id)a3
{
}

- (UIView)darkContentOverlay
{
  return self->_darkContentOverlay;
}

- (void)setPhotoImageView:(id)a3
{
}

- (UIImageView)photoImageView
{
  return self->_photoImageView;
}

- (int64_t)preferredImageDynamicRange
{
  return self->_preferredImageDynamicRange;
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (NSString)title
{
  return self->_title;
}

- (NSString)titleFontName
{
  return self->_titleFontName;
}

- (PXCollectionTileLayoutTemplate)collectionTileLayoutTemplate
{
  return self->_collectionTileLayoutTemplate;
}

- (PXFeatureSpec)featureSpec
{
  return self->_featureSpec;
}

- (PXTextBannerView)textBannerView
{
  return self->_textBannerView;
}

- (CGSize)customPaddingForBadgeElements
{
  double width = self->_customPaddingForBadgeElements.width;
  double height = self->_customPaddingForBadgeElements.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (int64_t)badgeStyle
{
  return self->_badgeStyle;
}

- (PXAssetBadgeInfo)badgeInfo
{
  long long v3 = *(_OWORD *)&self[13].duration;
  *(_OWORD *)&retstr->badges = *(_OWORD *)&self[12].fileSize;
  *(_OWORD *)&retstr->count = v3;
  return self;
}

- (void)setAvalancheStackBackgroundColor:(CGColor *)a3
{
  self->_avalancheStackBackgroundColor = a3;
}

- (CGColor)avalancheStackBackgroundColor
{
  return self->_avalancheStackBackgroundColor;
}

- (void)setNeedsAvalancheStack:(BOOL)a3
{
  self->_needsAvalancheStack = a3;
}

- (BOOL)needsAvalancheStack
{
  return self->_needsAvalancheStack;
}

- (BOOL)showsLivePhoto
{
  return self->_showsLivePhoto;
}

- (BOOL)loopingPlaybackAllowed
{
  return self->_loopingPlaybackAllowed;
}

- (PHAnimatedImage)animatedImage
{
  return self->_animatedImage;
}

- (AVAsset)loopingVideoAsset
{
  return self->_loopingVideoAsset;
}

- (BOOL)shouldPrepareForPlayback
{
  return self->_shouldPrepareForPlayback;
}

- (PHLivePhoto)livePhoto
{
  return self->_livePhoto;
}

- (PUPhotoViewContentHelperDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (PUPhotoViewContentHelperDelegate *)WeakRetained;
}

- (BOOL)isLivePhotoHidden
{
  return self->_livePhotoHidden;
}

- (UIColor)backgroundColor
{
  return self->_backgroundColor;
}

- (BOOL)isHighlighted
{
  return self->_highlighted;
}

- (double)darkContentOverlayAlpha
{
  return self->_darkContentOverlayAlpha;
}

- (double)contentAlpha
{
  return self->_contentAlpha;
}

- (UIColor)overlayColor
{
  return self->_overlayColor;
}

- (BOOL)useOverlay
{
  return self->_useOverlay;
}

- (unint64_t)cornersToRound
{
  return self->_cornersToRound;
}

- (void)setContinuousCorners:(BOOL)a3
{
  self->_continuousCorners = a3;
}

- (BOOL)continuousCorners
{
  return self->_continuousCorners;
}

- (double)cornerRadius
{
  return self->_cornerRadius;
}

- (BOOL)isAnimatingRoundedCorners
{
  return self->_animatingRoundedCorners;
}

- (BOOL)avoidsPhotoDecoration
{
  return self->_avoidsPhotoDecoration;
}

- (BOOL)flattensBadgeView
{
  return self->_flattensBadgeView;
}

- (void)setAvoidsImageViewIfPossible:(BOOL)a3
{
  self->_avoidsImageViewIfPossible = a3;
}

- (BOOL)avoidsImageViewIfPossible
{
  return self->_avoidsImageViewIfPossible;
}

- (PUPhotoDecoration)photoDecoration
{
  return self->_photoDecoration;
}

- (UIView)transitionSnapshotView
{
  return self->_transitionSnapshotView;
}

- (UIImage)placeHolderImage
{
  return self->_placeHolderImage;
}

- (UIImage)photoImage
{
  return self->_photoImage;
}

- (CGSize)photoSize
{
  double width = self->_photoSize.width;
  double height = self->_photoSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (CGAffineTransform)imageTransform
{
  long long v3 = *(_OWORD *)&self[9].d;
  *(_OWORD *)&retstr->a = *(_OWORD *)&self[9].b;
  *(_OWORD *)&retstr->c = v3;
  *(_OWORD *)&retstr->tx = *(_OWORD *)&self[9].ty;
  return self;
}

- (int64_t)fillMode
{
  return self->_fillMode;
}

- (UIView)contentView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_contentView);
  return (UIView *)WeakRetained;
}

- (BOOL)isTextBannerVisible
{
  return self->_isTextBannerVisible;
}

- (void)animateCrossfadeToImage:(id)a3 duration:(double)a4
{
  id v6 = a3;
  if (!self->__crossfadeImageView)
  {
    id v7 = objc_alloc(MEMORY[0x1E4FB1838]);
    [(UIImageView *)self->_photoImageView frame];
    v8 = (UIImageView *)objc_msgSend(v7, "initWithFrame:");
    crossfadeImageView = self->__crossfadeImageView;
    self->__crossfadeImageView = v8;

    [(PUPhotoViewContentHelper *)self _updateUnderlyingImageViewDynamicRange];
    [(UIImageView *)self->__crossfadeImageView setContentMode:[(UIImageView *)self->_photoImageView contentMode]];
    v10 = self->__crossfadeImageView;
    v11 = [(UIImageView *)self->_photoImageView backgroundColor];
    [(UIImageView *)v10 setBackgroundColor:v11];

    id WeakRetained = objc_loadWeakRetained((id *)&self->_contentView);
    [WeakRetained insertSubview:self->__crossfadeImageView belowSubview:self->_photoImageView];

    [(PUPhotoViewContentHelper *)self _updateSubviewOrdering];
  }
  [(UIImageView *)self->_photoImageView setAlpha:1.0];
  [(UIImageView *)self->__crossfadeImageView setImage:v6];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __61__PUPhotoViewContentHelper_animateCrossfadeToImage_duration___block_invoke;
  v13[3] = &unk_1E5F2ED10;
  v13[4] = self;
  [MEMORY[0x1E4FB1EB0] animateWithDuration:v13 animations:a4];
}

uint64_t __61__PUPhotoViewContentHelper_animateCrossfadeToImage_duration___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 296) setAlpha:0.0];
}

- (void)animateCrossfadeToImage:(id)a3
{
}

- (void)layoutSubviewsOfContentView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_contentView);
  [WeakRetained bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  -[UIImageView setFrame:](self->_photoImageView, "setFrame:", v5, v7, v9, v11);
  -[UIView setFrame:](self->_transitionSnapshotView, "setFrame:", v5, v7, v9, v11);
  -[UIView setFrame:](self->_darkContentOverlay, "setFrame:", v5, v7, v9, v11);
  -[PHLivePhotoView setFrame:](self->_livePhotoView, "setFrame:", v5, v7, v9, v11);
  -[PXVideoPlayerView setFrame:](self->_loopingVideoView, "setFrame:", v5, v7, v9, v11);
  -[ISAnimatedImageView setFrame:](self->_animatedImageView, "setFrame:", v5, v7, v9, v11);
  -[PUAvalancheStackView setFrame:](self->_avalancheStackView, "setFrame:", v5, v7, v9, v11);
  -[UIImageView setFrame:](self->__crossfadeImageView, "setFrame:", v5, v7, v9, v11);
  [(PUPhotoViewContentHelper *)self imageContentFrame];
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;
  photoDecorationBorderView = self->_photoDecorationBorderView;
  if (photoDecorationBorderView && ([(PUBackgroundColorView *)photoDecorationBorderView isHidden] & 1) == 0)
  {
    -[PUPhotoViewContentHelper photoDecorationBorderViewFrameForImageContentFrame:](self, "photoDecorationBorderViewFrameForImageContentFrame:", v13, v15, v17, v19);
    -[PUBackgroundColorView setFrame:](self->_photoDecorationBorderView, "setFrame:");
  }
  -[PUBackgroundColorView setFrame:](self->_photoDecorationOverlayView, "setFrame:", v13, v15, v17, v19);
  v40.origin.x = v13;
  v40.origin.double y = v15;
  v40.size.double width = v17;
  v40.size.double height = v19;
  double y = CGRectGetMaxY(v40) + -24.0;
  v22 = [(PUPhotoViewContentHelper *)self _badgeView];
  double height = 24.0;
  objc_msgSend(v22, "setFrame:", v13, y, v17, 24.0);

  textBannerView = self->_textBannerView;
  if (textBannerView && self->_isTextBannerVisible)
  {
    -[PXTextBannerView sizeThatFits:](textBannerView, "sizeThatFits:", v9, v11);
    if (v25 <= v17)
    {
      v41.origin.x = v13;
      v41.size.double width = v17;
    }
    else
    {
      if (v9 >= v25) {
        double v26 = v25;
      }
      else {
        double v26 = v9;
      }
      double v27 = (v9 - v26) * 0.5;
      double v28 = 24.0;
      double v29 = y;
      CGRect v41 = CGRectIntegral(*(CGRect *)(&v26 - 2));
      double y = v41.origin.y;
      double height = v41.size.height;
    }
    -[PXTextBannerView setFrame:](self->_textBannerView, "setFrame:", v41.origin.x, y, v41.size.width, height);
  }
  v30 = [(PUPhotoViewContentHelper *)self _highlightOverlayView];
  objc_msgSend(v30, "setFrame:", v13, v15, v17, v19);

  -[PXRoundedCornerOverlayView setFrame:](self->_roundedCornerOverlayView, "setFrame:", v13, v15, v17, v19);
  -[PXCollectionTileLayoutTemplate setBounds:](self->_collectionTileLayoutTemplate, "setBounds:", v13, v15, v17, v19);
  [(PXCollectionTileLayoutTemplate *)self->_collectionTileLayoutTemplate prepare];
  [(PUPhotoViewContentHelper *)self _updateIfNeeded];
  v31 = [(PUPhotoViewContentHelper *)self _titleSubtitleLabel];
  v32 = v31;
  if (v31 && ([v31 isHidden] & 1) == 0)
  {
    featureSpec = self->_featureSpec;
    uint64_t v34 = PXViewSpecContextForMemoryTile();
    uint64_t v35 = PXViewSpecOptionsWithTitleFontName();
    [(PXCollectionTileLayoutTemplate *)self->_collectionTileLayoutTemplate titleSubtitleRect];
    v39[0] = v34;
    v39[1] = v35;
    v39[2] = v36;
    v39[3] = v37;
    v38 = [(PXFeatureSpec *)featureSpec viewSpecWithDescriptor:v39];
    [v32 setSpec:v38];
    [(PXCollectionTileLayoutTemplate *)self->_collectionTileLayoutTemplate titleSubtitleRect];
    objc_msgSend(v32, "setFrame:");
  }
}

- (CGSize)contentViewSizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  int64_t v6 = [(PUPhotoViewContentHelper *)self fillMode];
  [(PUPhotoViewContentHelper *)self photoSize];
  double v8 = v7;
  double v10 = v9;
  double v11 = objc_opt_class();
  objc_msgSend(v11, "sizeThatFits:imageSize:fillMode:", v6, width, height, v8, v10);
  result.double height = v13;
  result.double width = v12;
  return result;
}

- (void)_updateTitleSubtitleUILabelIfNeeded
{
  if (!self->_needsUpdateFlags.titleSubtitleUILabel) {
    return;
  }
  self->_needsUpdateFlags.titleSubtitleUILabel = 0;
  if (([(NSString *)self->_title length] || [(NSString *)self->_subtitle length])
    && self->_featureSpec
    && self->_collectionTileLayoutTemplate)
  {
    photoImage = self->_photoImage;
    double v4 = [(PUPhotoViewContentHelper *)self _titleSubtitleLabel];
    if (photoImage)
    {
      if (!v4)
      {
        id v5 = objc_alloc(MEMORY[0x1E4F90818]);
        [(PXCollectionTileLayoutTemplate *)self->_collectionTileLayoutTemplate titleSubtitleRect];
        id v7 = (id)objc_msgSend(v5, "initWithFrame:");
        id WeakRetained = objc_loadWeakRetained((id *)&self->_contentView);
        [WeakRetained addSubview:v7];

        [(PUPhotoViewContentHelper *)self _setTitleSubtitleUILabel:v7];
        [(PUPhotoViewContentHelper *)self _updateSubviewOrdering];
        double v4 = v7;
      }
      id v8 = v4;
      [v4 setTitleText:self->_title];
      [v8 setSubtitleText:self->_subtitle];
      goto LABEL_12;
    }
  }
  else
  {
    double v4 = [(PUPhotoViewContentHelper *)self _titleSubtitleLabel];
  }
  id v8 = v4;
  [v4 removeFromSuperview];
  [(PUPhotoViewContentHelper *)self _setTitleSubtitleUILabel:0];
LABEL_12:
}

- (void)_invalidateTitleSubtitleUILabel
{
  self->_needsUpdateFlags.titleSubtitleUILabel = 1;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_contentView);
  [WeakRetained setNeedsLayout];
}

- (void)_updateAnimatedImageViewIfNeeded
{
  if (self->_needsUpdateFlags.animatedImageView)
  {
    self->_needsUpdateFlags.animatedImageView = 0;
    long long v3 = [(PUPhotoViewContentHelper *)self animatedImage];

    animatedImageView = self->_animatedImageView;
    if (v3)
    {
      if (!animatedImageView)
      {
        id v5 = objc_alloc(MEMORY[0x1E4F8EB90]);
        int64_t v6 = (ISAnimatedImageView *)objc_msgSend(v5, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
        id v7 = self->_animatedImageView;
        self->_animatedImageView = v6;

        [(ISAnimatedImageView *)self->_animatedImageView setContentMode:2];
        [(ISAnimatedImageView *)self->_animatedImageView setClipsToBounds:1];
        id WeakRetained = objc_loadWeakRetained((id *)&self->_contentView);
        [WeakRetained addSubview:self->_animatedImageView];

        [(PUPhotoViewContentHelper *)self _updateSubviewOrdering];
      }
      double v9 = [(PUPhotoViewContentHelper *)self animatedImage];
      double v10 = objc_msgSend(v9, "pf_animatedImage");
      [(ISAnimatedImageView *)self->_animatedImageView setImage:v10];

      id v11 = objc_loadWeakRetained((id *)&self->_contentView);
      [v11 bounds];
      -[ISAnimatedImageView setFrame:](self->_animatedImageView, "setFrame:");

      [(ISAnimatedImageView *)self->_animatedImageView setHidden:0];
      [(ISAnimatedImageView *)self->_animatedImageView setPlaying:self->_loopingPlaybackAllowed];
    }
    else
    {
      [(ISAnimatedImageView *)animatedImageView setHidden:1];
    }
    photoImageView = self->_photoImageView;
    [(UIImageView *)photoImageView setHidden:v3 != 0];
  }
}

- (void)_invalidateAnimatedImageView
{
  self->_needsUpdateFlags.animatedImageView = 1;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_contentView);
  [WeakRetained setNeedsLayout];
}

- (void)_updateLoopingVideoViewIfNeeded
{
  if (self->_needsUpdateFlags.loopingVideoView)
  {
    self->_needsUpdateFlags.loopingVideoView = 0;
    long long v3 = [(PUPhotoViewContentHelper *)self loopingVideoAsset];

    if (v3)
    {
      if (!self->_loopingVideoPlayer)
      {
        double v4 = (ISWrappedAVPlayer *)objc_alloc_init(MEMORY[0x1E4F8EBD0]);
        loopingVideoPlayer = self->_loopingVideoPlayer;
        self->_loopingVideoPlayer = v4;

        [(ISWrappedAVPlayer *)self->_loopingVideoPlayer setIsAudioEnabled:0];
        [(ISWrappedAVPlayer *)self->_loopingVideoPlayer setVolume:0.0];
        [(ISWrappedAVPlayer *)self->_loopingVideoPlayer setPreventsSleepDuringVideoPlayback:0];
        objc_initWeak(&location, self);
        int64_t v6 = dispatch_get_global_queue(2, 0);
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __59__PUPhotoViewContentHelper__updateLoopingVideoViewIfNeeded__block_invoke;
        block[3] = &unk_1E5F2E530;
        objc_copyWeak(&v29, &location);
        dispatch_async(v6, block);

        objc_destroyWeak(&v29);
        objc_destroyWeak(&location);
      }
      if (!self->_loopingVideoView)
      {
        id v7 = objc_alloc(MEMORY[0x1E4F908B0]);
        id WeakRetained = objc_loadWeakRetained((id *)&self->_contentView);
        [WeakRetained bounds];
        double v9 = (PXVideoPlayerView *)objc_msgSend(v7, "initWithFrame:");
        loopingVideoView = self->_loopingVideoView;
        self->_loopingVideoView = v9;

        [(PXVideoPlayerView *)self->_loopingVideoView setAlpha:0.0];
        id v11 = objc_loadWeakRetained((id *)&self->_contentView);
        [v11 addSubview:self->_loopingVideoView];

        [(PUPhotoViewContentHelper *)self _updateSubviewOrdering];
        double v12 = self->_loopingVideoPlayer;
        double v13 = (void *)MEMORY[0x1E4F16620];
        double v14 = [(PUPhotoViewContentHelper *)self loopingVideoAsset];
        double v15 = [v13 playerItemWithAsset:v14];
        [(ISWrappedAVPlayer *)v12 setLoopingEnabled:1 withTemplateItem:v15];

        [(PXVideoPlayerView *)self->_loopingVideoView setPlayer:self->_loopingVideoPlayer];
        v27[0] = MEMORY[0x1E4F143A8];
        v27[1] = 3221225472;
        v27[2] = __59__PUPhotoViewContentHelper__updateLoopingVideoViewIfNeeded__block_invoke_3;
        v27[3] = &unk_1E5F2ED10;
        v27[4] = self;
        [MEMORY[0x1E4FB1EB0] animateWithDuration:2 delay:v27 options:0 animations:0.3 completion:0.0];
      }
      id v16 = [(PUPhotoViewContentHelper *)self _audioSession];
      if (v16)
      {
        [(ISWrappedAVPlayer *)self->_loopingVideoPlayer setWrappedAudioSession:v16];
        LODWORD(v17) = 1.0;
        [(ISWrappedAVPlayer *)self->_loopingVideoPlayer setRate:v17];
      }
    }
    else
    {
      if (!self->_loopingVideoView) {
        return;
      }
      id v18 = objc_loadWeakRetained((id *)&self->_contentView);
      double v19 = [v18 window];

      if (v19)
      {
        id v16 = [(PXVideoPlayerView *)self->_loopingVideoView snapshotViewAfterScreenUpdates:0];
        id v20 = objc_loadWeakRetained((id *)&self->_contentView);
        [v20 insertSubview:v16 aboveSubview:self->_loopingVideoView];
      }
      else
      {
        id v16 = 0;
      }
      [(ISWrappedAVPlayer *)self->_loopingVideoPlayer setLoopingEnabled:0];
      [(PXVideoPlayerView *)self->_loopingVideoView removeFromSuperview];
      v21 = self->_loopingVideoView;
      self->_loopingVideoView = 0;

      if (v16)
      {
        v22 = (void *)MEMORY[0x1E4FB1EB0];
        v25[0] = MEMORY[0x1E4F143A8];
        v25[1] = 3221225472;
        v25[2] = __59__PUPhotoViewContentHelper__updateLoopingVideoViewIfNeeded__block_invoke_4;
        v25[3] = &unk_1E5F2ED10;
        id v26 = v16;
        v23[0] = MEMORY[0x1E4F143A8];
        v23[1] = 3221225472;
        v23[2] = __59__PUPhotoViewContentHelper__updateLoopingVideoViewIfNeeded__block_invoke_5;
        v23[3] = &unk_1E5F2CEE8;
        id v16 = v26;
        id v24 = v16;
        [v22 animateWithDuration:2 delay:v25 options:v23 animations:0.3 completion:0.0];
      }
    }
  }
}

void __59__PUPhotoViewContentHelper__updateLoopingVideoViewIfNeeded__block_invoke(uint64_t a1)
{
  v2 = [MEMORY[0x1E4F8EBC8] sharedAmbientInstance];
  objc_copyWeak(&v4, (id *)(a1 + 32));
  id v3 = v2;
  px_dispatch_on_main_queue();

  objc_destroyWeak(&v4);
}

uint64_t __59__PUPhotoViewContentHelper__updateLoopingVideoViewIfNeeded__block_invoke_3(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 56) setAlpha:1.0];
}

uint64_t __59__PUPhotoViewContentHelper__updateLoopingVideoViewIfNeeded__block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:0.0];
}

uint64_t __59__PUPhotoViewContentHelper__updateLoopingVideoViewIfNeeded__block_invoke_5(uint64_t a1)
{
  return [*(id *)(a1 + 32) removeFromSuperview];
}

void __59__PUPhotoViewContentHelper__updateLoopingVideoViewIfNeeded__block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _setAudioSession:v1];
}

- (void)_invalidateLoopingVideoView
{
  self->_needsUpdateFlags.loopingVideoView = 1;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_contentView);
  [WeakRetained setNeedsLayout];
}

- (void)_setAudioSession:(id)a3
{
  id v5 = (ISWrappedAVAudioSession *)a3;
  if (self->__audioSession != v5)
  {
    int64_t v6 = v5;
    objc_storeStrong((id *)&self->__audioSession, a3);
    [(PUPhotoViewContentHelper *)self _invalidateLoopingVideoView];
    id v5 = v6;
  }
}

- (void)setSubtitle:(id)a3
{
  id v5 = (NSString *)a3;
  if (self->_subtitle != v5)
  {
    int64_t v6 = v5;
    objc_storeStrong((id *)&self->_subtitle, a3);
    [(PUPhotoViewContentHelper *)self _invalidateTitleSubtitleUILabel];
    id v5 = v6;
  }
}

- (void)setTitle:(id)a3
{
  id v5 = (NSString *)a3;
  if (self->_title != v5)
  {
    int64_t v6 = v5;
    objc_storeStrong((id *)&self->_title, a3);
    [(PUPhotoViewContentHelper *)self _invalidateTitleSubtitleUILabel];
    id v5 = v6;
  }
}

- (void)setTitleFontName:(id)a3
{
  id v5 = (NSString *)a3;
  if (self->_titleFontName != v5)
  {
    int64_t v6 = v5;
    objc_storeStrong((id *)&self->_titleFontName, a3);
    [(PUPhotoViewContentHelper *)self _invalidateTitleSubtitleUILabel];
    id v5 = v6;
  }
}

- (void)setCollectionTileLayoutTemplate:(id)a3
{
  id v5 = (PXCollectionTileLayoutTemplate *)a3;
  if (self->_collectionTileLayoutTemplate != v5)
  {
    int64_t v6 = v5;
    objc_storeStrong((id *)&self->_collectionTileLayoutTemplate, a3);
    [(PUPhotoViewContentHelper *)self _invalidateTitleSubtitleUILabel];
    id v5 = v6;
  }
}

- (void)setFeatureSpec:(id)a3
{
  id v5 = (PXFeatureSpec *)a3;
  if (self->_featureSpec != v5)
  {
    int64_t v6 = v5;
    objc_storeStrong((id *)&self->_featureSpec, a3);
    [(PUPhotoViewContentHelper *)self _invalidateTitleSubtitleUILabel];
    id v5 = v6;
  }
}

- (void)_updateHighlight
{
  BOOL v3 = [(PUPhotoViewContentHelper *)self isHighlighted];
  id v4 = [(PUPhotoViewContentHelper *)self _highlightOverlayView];
  if (v3 && !v4)
  {
    id v5 = objc_alloc(MEMORY[0x1E4FB1EB0]);
    id WeakRetained = objc_loadWeakRetained((id *)&self->_contentView);
    [WeakRetained bounds];
    id v9 = (id)objc_msgSend(v5, "initWithFrame:");

    [v9 setUserInteractionEnabled:0];
    id v7 = [MEMORY[0x1E4FB1618] labelColor];
    [v9 setBackgroundColor:v7];

    [v9 setAlpha:0.5];
    id v8 = objc_loadWeakRetained((id *)&self->_contentView);
    [v8 addSubview:v9];

    [(PUPhotoViewContentHelper *)self _setHighlightOverlayView:v9];
    [(PUPhotoViewContentHelper *)self _updateSubviewOrdering];
    id v4 = v9;
  }
  id v10 = v4;
  [v4 setHidden:!v3];
}

- (void)_updateRoundedCornersOverlayView
{
  if (self->_cornerRadius > 0.0 && self->_useOverlay)
  {
    overlayColor = self->_overlayColor;
    uint64_t v4 = [(PUPhotoViewContentHelper *)self roundedCornerOverlayView];
    id v5 = (id)v4;
    if (overlayColor)
    {
      if (!v4)
      {
        id v5 = objc_alloc_init(MEMORY[0x1E4F90620]);
        id WeakRetained = objc_loadWeakRetained((id *)&self->_contentView);
        [WeakRetained addSubview:v5];

        [(PUPhotoViewContentHelper *)self setRoundedCornerOverlayView:v5];
        [(PUPhotoViewContentHelper *)self _updateSubviewOrdering];
      }
      v7[0] = MEMORY[0x1E4F143A8];
      v7[1] = 3221225472;
      v7[2] = __60__PUPhotoViewContentHelper__updateRoundedCornersOverlayView__block_invoke;
      v7[3] = &unk_1E5F2A0A0;
      v7[4] = self;
      [v5 performChanges:v7];
      goto LABEL_10;
    }
  }
  else
  {
    id v5 = [(PUPhotoViewContentHelper *)self roundedCornerOverlayView];
  }
  if (!v5) {
    return;
  }
  [v5 removeFromSuperview];
  [(PUPhotoViewContentHelper *)self setRoundedCornerOverlayView:0];
LABEL_10:
}

void __60__PUPhotoViewContentHelper__updateRoundedCornersOverlayView__block_invoke(uint64_t a1, void *a2)
{
  BOOL v3 = *(void **)(a1 + 32);
  id v5 = a2;
  [v3 cornerRadius];
  objc_msgSend(v5, "setCornerRadius:");
  objc_msgSend(v5, "setCornersToRound:", objc_msgSend(*(id *)(a1 + 32), "cornersToRound"));
  uint64_t v4 = [*(id *)(a1 + 32) overlayColor];
  [v5 setOverlayColor:v4];

  objc_msgSend(v5, "setContinuousCorners:", objc_msgSend(*(id *)(a1 + 32), "continuousCorners"));
  if (PUMainScreenScale_onceToken != -1) {
    dispatch_once(&PUMainScreenScale_onceToken, &__block_literal_global_28618);
  }
  [v5 setDisplayScale:*(double *)&PUMainScreenScale_screenScale];
}

- (void)_updateLayerCornerRadius
{
  id v7 = [(PUPhotoViewContentHelper *)self contentView];
  BOOL v3 = [v7 layer];
  double v4 = 0.0;
  if (!self->_useOverlay)
  {
    [(PUPhotoViewContentHelper *)self cornerRadius];
    double v4 = v5;
  }
  [v3 cornerRadius];
  if (v6 != v4)
  {
    [v3 setCornerRadius:v4];
    [v3 setCornerCurve:*MEMORY[0x1E4F39EA8]];
    [(PUPhotoViewContentHelper *)self _updateContentViewClipsToBounds];
    [v7 setNeedsLayout];
  }
}

- (void)_updatePhotoDecoration
{
  id v28 = [(PUPhotoViewContentHelper *)self photoDecoration];
  BOOL v3 = [(PUPhotoViewContentHelper *)self avoidsPhotoDecoration];
  if (v3)
  {
    photoDecorationBorderView = self->_photoDecorationBorderView;
    if (photoDecorationBorderView)
    {
      [(PUBackgroundColorView *)photoDecorationBorderView removeFromSuperview];
      int v5 = 0;
      id WeakRetained = self->_photoDecorationBorderView;
      self->_photoDecorationBorderView = 0;
LABEL_13:
      int v13 = !v3;

      int v14 = 1;
      goto LABEL_14;
    }
    int v5 = 0;
LABEL_8:
    int v13 = 0;
    int v14 = 0;
LABEL_14:
    double v12 = v28;
    goto LABEL_15;
  }
  [v28 borderWidth];
  double v8 = v7;
  uint64_t v9 = [v28 foregroundColor];
  if (v9)
  {
    id v10 = (void *)v9;
    id v11 = [v28 foregroundColor];
    int v5 = CGColorGetAlpha((CGColorRef)[v11 CGColor]) > 0.0;

    if (v8 <= 0.0) {
      goto LABEL_8;
    }
    double v12 = v28;
  }
  else
  {
    int v5 = 0;
    int v13 = 0;
    int v14 = 0;
    double v12 = v28;
    if (v8 <= 0.0) {
      goto LABEL_15;
    }
  }
  if (!self->_photoDecorationBorderView)
  {
    double v15 = objc_alloc_init(PUBackgroundColorView);
    id v16 = self->_photoDecorationBorderView;
    self->_photoDecorationBorderView = v15;

    id WeakRetained = objc_loadWeakRetained((id *)&self->_contentView);
    [WeakRetained addSubview:self->_photoDecorationBorderView];
    goto LABEL_13;
  }
  int v14 = 0;
  int v13 = 1;
LABEL_15:
  double v17 = self->_photoDecorationBorderView;
  id v18 = [v12 borderColor];
  [(PUBackgroundColorView *)v17 _puSetBackgroundColor:v18];

  if (v5 && !self->_photoDecorationOverlayView)
  {
    v21 = objc_alloc_init(PUBackgroundColorView);
    photoDecorationOverlayView = self->_photoDecorationOverlayView;
    self->_photoDecorationOverlayView = v21;

    id v20 = objc_loadWeakRetained((id *)&self->_contentView);
    [v20 addSubview:self->_photoDecorationOverlayView];
    goto LABEL_21;
  }
  if (v3)
  {
    double v19 = self->_photoDecorationOverlayView;
    if (v19)
    {
      [(PUBackgroundColorView *)v19 removeFromSuperview];
      id v20 = self->_photoDecorationOverlayView;
      self->_photoDecorationOverlayView = 0;
LABEL_21:

      int v14 = 1;
    }
  }
  v23 = self->_photoDecorationOverlayView;
  id v24 = [v28 foregroundColor];
  [(PUBackgroundColorView *)v23 _puSetBackgroundColor:v24];

  double v25 = self->_photoDecorationBorderView;
  if (v25 && v13 == [(PUBackgroundColorView *)v25 isHidden])
  {
    [(PUBackgroundColorView *)self->_photoDecorationBorderView setHidden:v13 ^ 1u];
    int v14 = 1;
  }
  id v26 = self->_photoDecorationOverlayView;
  if (v26 && v5 == [(PUBackgroundColorView *)v26 isHidden])
  {
    [(PUBackgroundColorView *)self->_photoDecorationOverlayView setHidden:v5 ^ 1u];
    goto LABEL_30;
  }
  if (v14)
  {
LABEL_30:
    [(PUPhotoViewContentHelper *)self _updateSubviewOrdering];
    [(PUPhotoViewContentHelper *)self _updateImageView];
    id v27 = objc_loadWeakRetained((id *)&self->_contentView);
    [v27 setNeedsLayout];
  }
}

- (void)_updateBadgeView
{
  long long v10 = 0u;
  long long v11 = 0u;
  [(PUPhotoViewContentHelper *)self badgeInfo];
  BOOL v3 = [(PUPhotoViewContentHelper *)self flattensBadgeView];
  uint64_t IsNull = PXAssetBadgeInfoIsNull();
  id v5 = [(PUPhotoViewContentHelper *)self _badgeView];
  if (IsNull) {
    goto LABEL_9;
  }
  uint64_t v6 = objc_opt_class();
  if ((v3 ^ (v6 != objc_opt_class())))
  {
    if (v5) {
      goto LABEL_7;
    }
  }
  else
  {
    [v5 removeFromSuperview];
  }
  id v5 = objc_alloc_init((Class)objc_opt_class());
  id WeakRetained = objc_loadWeakRetained((id *)&self->_contentView);
  [WeakRetained addSubview:v5];

  [(PUPhotoViewContentHelper *)self _setBadgeView:v5];
  [(PUPhotoViewContentHelper *)self _updateSubviewOrdering];
LABEL_7:
  v9[0] = v10;
  v9[1] = v11;
  [v5 setBadgeInfo:v9];
  objc_msgSend(v5, "setStyle:", -[PUPhotoViewContentHelper badgeStyle](self, "badgeStyle"));
  [(PUPhotoViewContentHelper *)self customPaddingForBadgeElements];
  if ((PXSizeIsNull() & 1) == 0)
  {
    [(PUPhotoViewContentHelper *)self customPaddingForBadgeElements];
    objc_msgSend(v5, "setBottomElementsPadding:");
  }
LABEL_9:
  [v5 setHidden:IsNull];
  id v8 = objc_loadWeakRetained((id *)&self->_contentView);
  [v8 setNeedsLayout];
}

- (void)_updateIfNeeded
{
  if ([(PUPhotoViewContentHelper *)self _needsUpdate])
  {
    [(PUPhotoViewContentHelper *)self _updateTitleSubtitleUILabelIfNeeded];
    [(PUPhotoViewContentHelper *)self _updateLoopingVideoViewIfNeeded];
    [(PUPhotoViewContentHelper *)self _updateAnimatedImageViewIfNeeded];
    if ([(PUPhotoViewContentHelper *)self _needsUpdate])
    {
      id v4 = [MEMORY[0x1E4F28B00] currentHandler];
      [v4 handleFailureInMethod:a2, self, @"PUPhotoView.m", 890, @"%@: update still needed at end of update pass", self object file lineNumber description];
    }
  }
}

- (BOOL)_needsUpdate
{
  return self->_needsUpdateFlags.loopingVideoView
      || self->_needsUpdateFlags.titleSubtitleUILabel
      || self->_needsUpdateFlags.animatedImageView;
}

- (void)_updateTextBannerView
{
  BOOL isTextBannerVisible = self->_isTextBannerVisible;
  textBannerView = self->_textBannerView;
  if (isTextBannerVisible)
  {
    if (!textBannerView)
    {
      id v5 = (PXTextBannerView *)objc_alloc_init(MEMORY[0x1E4F907F8]);
      uint64_t v6 = self->_textBannerView;
      self->_textBannerView = v5;

      textBannerView = self->_textBannerView;
    }
    double v7 = [(PXTextBannerView *)textBannerView superview];

    if (!v7)
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_contentView);
      [WeakRetained addSubview:self->_textBannerView];

      [(PUPhotoViewContentHelper *)self _updateSubviewOrdering];
    }
  }
  else
  {
    [(PXTextBannerView *)textBannerView removeFromSuperview];
  }
  id v9 = objc_loadWeakRetained((id *)&self->_contentView);
  [v9 setNeedsLayout];
}

- (void)_updateSubviewOrdering
{
  p_contentView = &self->_contentView;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_contentView);
  [WeakRetained bringSubviewToFront:self->_avalancheStackView];

  id v5 = objc_loadWeakRetained((id *)p_contentView);
  [v5 bringSubviewToFront:self->_photoDecorationBorderView];

  id v6 = objc_loadWeakRetained((id *)p_contentView);
  [v6 bringSubviewToFront:self->__crossfadeImageView];

  id v7 = objc_loadWeakRetained((id *)p_contentView);
  [v7 bringSubviewToFront:self->_photoImageView];

  id v8 = objc_loadWeakRetained((id *)p_contentView);
  [v8 bringSubviewToFront:self->_livePhotoView];

  id v9 = objc_loadWeakRetained((id *)p_contentView);
  [v9 bringSubviewToFront:self->_loopingVideoView];

  id v10 = objc_loadWeakRetained((id *)p_contentView);
  [v10 bringSubviewToFront:self->_animatedImageView];

  id v11 = objc_loadWeakRetained((id *)p_contentView);
  [v11 bringSubviewToFront:self->_photoDecorationOverlayView];

  id v12 = objc_loadWeakRetained((id *)p_contentView);
  [v12 bringSubviewToFront:self->__badgeView];

  id v13 = objc_loadWeakRetained((id *)p_contentView);
  [v13 bringSubviewToFront:self->_textBannerView];

  id v14 = objc_loadWeakRetained((id *)p_contentView);
  [v14 bringSubviewToFront:self->__titleSubtitleLabel];

  id v15 = objc_loadWeakRetained((id *)p_contentView);
  [v15 bringSubviewToFront:self->__highlightOverlayView];

  id v16 = objc_loadWeakRetained((id *)p_contentView);
  [v16 bringSubviewToFront:self->_roundedCornerOverlayView];
}

- (void)_updateContentViewClipsToBounds
{
  if ((self->_photoImageView || self->_avalancheStackView)
    && ![(PUPhotoViewContentHelper *)self isAnimatingRoundedCorners])
  {
    [(PUPhotoViewContentHelper *)self cornerRadius];
    BOOL v3 = v4 != 0.0;
  }
  else
  {
    BOOL v3 = 1;
  }
  p_contentView = &self->_contentView;
  id WeakRetained = objc_loadWeakRetained((id *)p_contentView);
  int v7 = [WeakRetained clipsToBounds];

  if (v3 != v7)
  {
    id v8 = objc_loadWeakRetained((id *)p_contentView);
    [v8 setClipsToBounds:v3];
  }
}

- (void)_updateLayerBackgroundColorIfNeeded
{
  if (self->_hasLayerBackgroundColor)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_contentView);
    id v9 = [WeakRetained layer];

    double v4 = [(PUPhotoViewContentHelper *)self backgroundColor];
    layerDefaultBackgroundColor = v4;
    if (!v4) {
      layerDefaultBackgroundColor = self->_layerDefaultBackgroundColor;
    }
    id v6 = layerDefaultBackgroundColor;

    int v7 = v6;
    uint64_t v8 = [(UIColor *)v7 CGColor];

    [v9 setBackgroundColor:v8];
  }
}

- (void)_updateUnderlyingImageViewDynamicRange
{
  [(UIImageView *)self->_photoImageView setPreferredImageDynamicRange:[(PUPhotoViewContentHelper *)self preferredImageDynamicRange]];
  int64_t v3 = [(PUPhotoViewContentHelper *)self preferredImageDynamicRange];
  crossfadeImageView = self->__crossfadeImageView;
  [(UIImageView *)crossfadeImageView setPreferredImageDynamicRange:v3];
}

- (void)_updateImageView
{
  if (!self->_avoidsImageViewIfPossible
    || self->_hasTransform
    || (photoDecorationBorderView = self->_photoDecorationBorderView) != 0
    && ![(PUBackgroundColorView *)photoDecorationBorderView isHidden])
  {
    int v3 = 1;
  }
  else
  {
    photoDecorationOverlayView = self->_photoDecorationOverlayView;
    if (photoDecorationOverlayView) {
      int v3 = [(PUBackgroundColorView *)photoDecorationOverlayView isHidden] ^ 1;
    }
    else {
      int v3 = 0;
    }
  }
  photoImage = self->_photoImage;
  if (!photoImage) {
    photoImage = self->_placeHolderImage;
  }
  v38 = photoImage;
  if (self->_photoImage)
  {
    placeHolderImage = self->_placeHolderImage;
    if (placeHolderImage)
    {
      self->_placeHolderImage = 0;
    }
  }
  self->_hasLayerBackgroundColor = 0;
  if (v3)
  {
    [(PUPhotoViewContentHelper *)self _removeAvalancheStackViewIfNecessary];
    if (!self->_photoImageView)
    {
      id v6 = objc_alloc_init(MEMORY[0x1E4FB1838]);
      [(PUPhotoViewContentHelper *)self setPhotoImageView:v6];
      [(PUPhotoViewContentHelper *)self _updateUnderlyingImageViewDynamicRange];
      [v6 setClipsToBounds:1];
      int v7 = [v6 layer];
      [v7 setAllowsGroupOpacity:0];

      id WeakRetained = objc_loadWeakRetained((id *)&self->_contentView);
      [WeakRetained addSubview:v6];

      id v9 = objc_loadWeakRetained((id *)&self->_contentView);
      [v9 layoutIfNeeded];

      [(PUPhotoViewContentHelper *)self _updateSubviewOrdering];
    }
    [(PUPhotoViewContentHelper *)self _updateContentViewClipsToBounds];
    id v10 = objc_loadWeakRetained((id *)&self->_contentView);
    id v11 = [v10 layer];
    [v11 setContents:0];

    id v12 = objc_loadWeakRetained((id *)&self->_contentView);
    id v13 = [v12 layer];
    [v13 setBackgroundColor:0];

    [(UIImageView *)self->_photoImageView setImage:v38];
    photoImageView = self->_photoImageView;
    id v15 = [(PUPhotoViewContentHelper *)self backgroundColor];
    [(UIImageView *)photoImageView setBackgroundColor:v15];

    id v16 = self->_photoImageView;
    [(PUPhotoViewContentHelper *)self contentAlpha];
    -[UIImageView setAlpha:](v16, "setAlpha:");
    if (self->_transitionSnapshotView)
    {
      [(UIImageView *)self->_photoImageView bounds];
      -[UIView setFrame:](self->_transitionSnapshotView, "setFrame:");
      [(UIImageView *)self->_photoImageView addSubview:self->_transitionSnapshotView];
    }
    [(PUPhotoViewContentHelper *)self darkContentOverlayAlpha];
    if (v17 > 0.0 && !self->_darkContentOverlay)
    {
      id v18 = (UIView *)objc_alloc_init(MEMORY[0x1E4FB1EB0]);
      darkContentOverladouble y = self->_darkContentOverlay;
      self->_darkContentOverladouble y = v18;

      id v20 = self->_darkContentOverlay;
      v21 = [MEMORY[0x1E4FB1618] blackColor];
      [(UIView *)v20 setBackgroundColor:v21];

      id v22 = objc_loadWeakRetained((id *)&self->_contentView);
      [v22 addSubview:self->_darkContentOverlay];
    }
    [(PUPhotoViewContentHelper *)self darkContentOverlayAlpha];
    -[UIView setAlpha:](self->_darkContentOverlay, "setAlpha:");
    unint64_t fillMode = self->_fillMode;
    if (fillMode > 2) {
      uint64_t v24 = 0;
    }
    else {
      uint64_t v24 = qword_1AEFF8300[fillMode];
    }
    [(UIView *)self->_transitionSnapshotView setContentMode:v24];
    [(UIImageView *)self->_photoImageView setContentMode:v24];
    [(UIImageView *)self->__crossfadeImageView setContentMode:v24];
  }
  else
  {
    BOOL v25 = [(PUPhotoViewContentHelper *)self needsAvalancheStack];
    [(PUPhotoViewContentHelper *)self _removePhotoImageViewIfNecessary];
    if (v25)
    {
      [(PUPhotoViewContentHelper *)self _addAvalancheStackViewIfNecessary];
      [(PUPhotoViewContentHelper *)self _updateContentViewClipsToBounds];
      id v26 = objc_loadWeakRetained((id *)&self->_contentView);
      id v27 = [v26 layer];
      [v27 setContents:0];

      id v28 = objc_loadWeakRetained((id *)&self->_contentView);
      id v29 = [v28 layer];
      [v29 setBackgroundColor:0];

      [(PUAvalancheStackView *)self->_avalancheStackView setImage:v38];
      avalancheStackView = self->_avalancheStackView;
      v31 = [(PUPhotoViewContentHelper *)self backgroundColor];
      [(PUAvalancheStackView *)avalancheStackView setBackgroundColor:v31];
    }
    else
    {
      [(PUPhotoViewContentHelper *)self _removeAvalancheStackViewIfNecessary];
      [(PUPhotoViewContentHelper *)self _updateContentViewClipsToBounds];
      id v32 = objc_loadWeakRetained((id *)&self->_contentView);
      v33 = [v32 layer];

      objc_msgSend(v33, "setContents:", -[UIImage CGImage](v38, "CGImage"));
      if (PUMainScreenScale_onceToken != -1) {
        dispatch_once(&PUMainScreenScale_onceToken, &__block_literal_global_28618);
      }
      [v33 setContentsScale:*(double *)&PUMainScreenScale_screenScale];
      self->_hasLayerBackgroundColor = 1;
      [(PUPhotoViewContentHelper *)self _updateLayerBackgroundColorIfNeeded];
      unint64_t v34 = self->_fillMode;
      if (v34 > 2) {
        id v35 = 0;
      }
      else {
        id v35 = **((id **)&unk_1E5F2A0C0 + v34);
      }
      [v33 setContentsGravity:v35];
    }
  }
}

- (void)_updateLivePhotoView
{
  BOOL showsLivePhoto = self->_showsLivePhoto;
  livePhotoView = self->_livePhotoView;
  if (showsLivePhoto)
  {
    if (!livePhotoView)
    {
      id v6 = objc_alloc(MEMORY[0x1E4F39928]);
      id WeakRetained = objc_loadWeakRetained((id *)&self->_contentView);
      [WeakRetained bounds];
      uint64_t v8 = (PHLivePhotoView *)objc_msgSend(v6, "initWithFrame:");
      id v9 = self->_livePhotoView;
      self->_livePhotoView = v8;

      id v10 = objc_loadWeakRetained((id *)&self->_contentView);
      [v10 addSubview:self->_livePhotoView];

      [(PHLivePhotoView *)self->_livePhotoView setDelegate:self];
      [(PUPhotoViewContentHelper *)self _updateSubviewOrdering];
      id v11 = objc_loadWeakRetained((id *)&self->_contentView);
      [v11 setNeedsLayout];

      [(PUPhotoViewContentHelper *)self _updateLivePhotoViewVisibility];
      [(PUPhotoViewContentHelper *)self _updateLivePhotoViewPreparing];
    }
    unint64_t fillMode = self->_fillMode;
    if (fillMode > 2) {
      uint64_t v13 = 0;
    }
    else {
      uint64_t v13 = qword_1AEFF8300[fillMode];
    }
    [(PHLivePhotoView *)self->_livePhotoView setContentMode:v13];
    [(PHLivePhotoView *)self->_livePhotoView setLivePhoto:self->_livePhoto];
    if (self->_hasPendingPlaybackRequest)
    {
      self->_hasPendingPlaybackRequest = 0;
      if (!self->_pendingPlaybackRequestStyle)
      {
        id v15 = [MEMORY[0x1E4F28B00] currentHandler];
        [v15 handleFailureInMethod:a2 object:self file:@"PUPhotoView.m" lineNumber:699 description:@"Trying to start playback with PHLivePhotoViewPlaybackStyleUndefined"];
      }
      -[PUPhotoViewContentHelper startPlaybackWithStyle:](self, "startPlaybackWithStyle:");
    }
  }
  else
  {
    [(PHLivePhotoView *)livePhotoView removeFromSuperview];
    id v14 = self->_livePhotoView;
    self->_livePhotoView = 0;
  }
}

- (void)_removeAvalancheStackViewIfNecessary
{
  avalancheStackView = self->_avalancheStackView;
  if (avalancheStackView)
  {
    [(PUAvalancheStackView *)avalancheStackView removeFromSuperview];
    [(PUPhotoViewContentHelper *)self setAvalancheStackView:0];
  }
}

- (void)_addAvalancheStackViewIfNecessary
{
  if (!self->_avalancheStackView)
  {
    int v3 = objc_alloc_init(PUAvalancheStackView);
    avalancheStackView = self->_avalancheStackView;
    self->_avalancheStackView = v3;

    [(PUAvalancheStackView *)self->_avalancheStackView setContentMode:[(PUPhotoViewContentHelper *)self fillMode]];
    id v5 = [(PUPhotoViewContentHelper *)self avalancheStackBackgroundColor];
    id v6 = [(PUAvalancheStackView *)self->_avalancheStackView layer];
    [v6 setBackgroundColor:v5];

    id WeakRetained = objc_loadWeakRetained((id *)&self->_contentView);
    [WeakRetained addSubview:self->_avalancheStackView];

    [(PUPhotoViewContentHelper *)self _updateSubviewOrdering];
    id v8 = objc_loadWeakRetained((id *)&self->_contentView);
    [v8 setNeedsLayout];
  }
}

- (void)_removePhotoImageViewIfNecessary
{
  photoImageView = self->_photoImageView;
  if (photoImageView)
  {
    [(UIImageView *)photoImageView removeFromSuperview];
    [(PUPhotoViewContentHelper *)self setPhotoImageView:0];
  }
}

- (void)livePhotoView:(id)a3 willBeginPlaybackWithStyle:(int64_t)a4
{
  if (self->_delegateFlags.respondsToLivePhotoWillBeginPlaybackWithStyle)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained photoViewContentHelper:self livePhotoWillBeginPlaybackWithStyle:a4];
  }
}

- (void)setLoopingPlaybackAllowed:(BOOL)a3
{
  if (self->_loopingPlaybackAllowed != a3)
  {
    self->_loopingPlaybackAllowed = a3;
    [(PUPhotoViewContentHelper *)self _invalidateAnimatedImageView];
  }
}

- (void)setAnimatedImage:(id)a3
{
  id v5 = (PHAnimatedImage *)a3;
  if (self->_animatedImage != v5)
  {
    id v6 = v5;
    objc_storeStrong((id *)&self->_animatedImage, a3);
    [(PUPhotoViewContentHelper *)self _invalidateAnimatedImageView];
    id v5 = v6;
  }
}

- (void)setLoopingVideoAsset:(id)a3
{
  if (self->_loopingVideoAsset != a3)
  {
    double v4 = (AVAsset *)[a3 copy];
    loopingVideoAsset = self->_loopingVideoAsset;
    self->_loopingVideoAsset = v4;

    [(PUPhotoViewContentHelper *)self _invalidateLoopingVideoView];
  }
}

- (void)setDelegate:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  if (WeakRetained != obj)
  {
    id v5 = objc_storeWeak((id *)&self->_delegate, obj);
    self->_delegateFlags.respondsToLivePhotoWillBeginPlaybackWithStyle = objc_opt_respondsToSelector() & 1;
  }
}

- (void)_startPlaybackWhenLivePhotoAvailableWithStyle:(int64_t)a3
{
  self->_hasPendingPlaybackRequest = 1;
  self->_pendingPlaybackRequestStyle = a3;
}

- (void)_updateLivePhotoViewPreparing
{
}

- (void)_updateLivePhotoViewVisibility
{
}

- (void)stopPlayback
{
  self->_hasPendingPlaybackRequest = 0;
  [(PHLivePhotoView *)self->_livePhotoView stopPlayback];
}

- (void)startPlaybackWithStyle:(int64_t)a3
{
  if (self->_livePhotoView)
  {
    [(PUPhotoViewContentHelper *)self setShouldPrepareForPlayback:1];
    livePhotoView = self->_livePhotoView;
    [(PHLivePhotoView *)livePhotoView startPlaybackWithStyle:a3];
  }
  else
  {
    -[PUPhotoViewContentHelper _startPlaybackWhenLivePhotoAvailableWithStyle:](self, "_startPlaybackWhenLivePhotoAvailableWithStyle:");
  }
}

- (void)setLivePhoto:(id)a3
{
  id v5 = (PHLivePhoto *)a3;
  livePhoto = self->_livePhoto;
  if (livePhoto != v5)
  {
    id v8 = v5;
    char v7 = [(PHLivePhoto *)livePhoto isEqual:v5];
    id v5 = v8;
    if ((v7 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_livePhoto, a3);
      [(PUPhotoViewContentHelper *)self _updateLivePhotoView];
      id v5 = v8;
    }
  }
}

- (void)setShowsLivePhoto:(BOOL)a3
{
  if (self->_showsLivePhoto != a3)
  {
    self->_BOOL showsLivePhoto = a3;
    [(PUPhotoViewContentHelper *)self _updateLivePhotoView];
  }
}

- (void)setShouldPrepareForPlayback:(BOOL)a3
{
  if (self->_shouldPrepareForPlayback != a3)
  {
    self->_shouldPrepareForPlayback = a3;
    [(PUPhotoViewContentHelper *)self _updateLivePhotoViewPreparing];
  }
}

- (void)setLivePhotoHidden:(BOOL)a3
{
  if (self->_livePhotoHidden != a3)
  {
    self->_livePhotoHidden = a3;
    [(PUPhotoViewContentHelper *)self _updateLivePhotoViewVisibility];
  }
}

- (void)setDarkContentOverlayAlpha:(double)a3
{
  if (self->_darkContentOverlayAlpha != a3)
  {
    self->_darkContentOverlayAlpha = a3;
    [(PUPhotoViewContentHelper *)self _updateImageView];
  }
}

- (void)setContentAlpha:(double)a3
{
  if (self->_contentAlpha != a3)
  {
    self->_contentAlpha = a3;
    [(PUPhotoViewContentHelper *)self _updateImageView];
  }
}

- (void)setBackgroundColor:(id)a3
{
  id v5 = (UIColor *)a3;
  if (self->_backgroundColor != v5)
  {
    id v6 = v5;
    objc_storeStrong((id *)&self->_backgroundColor, a3);
    [(PUPhotoViewContentHelper *)self _updateImageView];
    id v5 = v6;
  }
}

- (void)setCornerRadius:(double)a3 cornersToRound:(unint64_t)a4 useOverlay:(BOOL)a5 overlayColor:(id)a6 continuousCorners:(BOOL)a7
{
  BOOL v7 = a7;
  BOOL v9 = a5;
  uint64_t v13 = (UIColor *)a6;
  if (self->_cornerRadius != a3
    || self->_cornersToRound != a4
    || self->_useOverlay != v9
    || self->_overlayColor != v13
    || self->_continuousCorners != v7)
  {
    self->_cornerRadius = a3;
    self->_cornersToRound = a4;
    id v14 = v13;
    self->_useOverladouble y = v9;
    objc_storeStrong((id *)&self->_overlayColor, a6);
    self->_continuousCorners = v7;
    [(PUPhotoViewContentHelper *)self _updateLayerCornerRadius];
    [(PUPhotoViewContentHelper *)self _updateRoundedCornersOverlayView];
    uint64_t v13 = v14;
  }
}

- (void)setOverlayColor:(id)a3
{
  id v5 = a3;
  [(PUPhotoViewContentHelper *)self cornerRadius];
  [(PUPhotoViewContentHelper *)self setCornerRadius:[(PUPhotoViewContentHelper *)self cornersToRound] cornersToRound:[(PUPhotoViewContentHelper *)self useOverlay] useOverlay:v5 overlayColor:1 continuousCorners:v4];
}

- (void)setUseOverlay:(BOOL)a3
{
  BOOL v3 = a3;
  [(PUPhotoViewContentHelper *)self cornerRadius];
  double v6 = v5;
  unint64_t v7 = [(PUPhotoViewContentHelper *)self cornersToRound];
  id v8 = [(PUPhotoViewContentHelper *)self overlayColor];
  [(PUPhotoViewContentHelper *)self setCornerRadius:v7 cornersToRound:v3 useOverlay:v8 overlayColor:1 continuousCorners:v6];
}

- (void)setCornersToRound:(unint64_t)a3
{
  [(PUPhotoViewContentHelper *)self cornerRadius];
  double v6 = v5;
  BOOL v7 = [(PUPhotoViewContentHelper *)self useOverlay];
  id v8 = [(PUPhotoViewContentHelper *)self overlayColor];
  [(PUPhotoViewContentHelper *)self setCornerRadius:a3 cornersToRound:v7 useOverlay:v8 overlayColor:1 continuousCorners:v6];
}

- (void)setCornerRadius:(double)a3
{
  unint64_t v5 = [(PUPhotoViewContentHelper *)self cornersToRound];
  id v6 = [(PUPhotoViewContentHelper *)self overlayColor];
  [(PUPhotoViewContentHelper *)self setCornerRadius:v5 cornersToRound:0 useOverlay:v6 overlayColor:1 continuousCorners:a3];
}

- (void)setHighlighted:(BOOL)a3
{
  if (self->_highlighted != a3)
  {
    self->_highlighted = a3;
    [(PUPhotoViewContentHelper *)self _updateHighlight];
  }
}

- (void)setAnimatingRoundedCorners:(BOOL)a3
{
  if (self->_animatingRoundedCorners != a3)
  {
    self->_animatingRoundedCorners = a3;
    [(PUPhotoViewContentHelper *)self _updateContentViewClipsToBounds];
  }
}

- (BOOL)providesVisualFeedbackOnPress
{
  return self->_livePhotoView != 0;
}

- (void)setAvoidsPhotoDecoration:(BOOL)a3
{
  if (self->_avoidsPhotoDecoration != a3)
  {
    self->_avoidsPhotoDecoration = a3;
    [(PUPhotoViewContentHelper *)self _updatePhotoDecoration];
  }
}

- (void)setFlattensBadgeView:(BOOL)a3
{
  if (self->_flattensBadgeView != a3)
  {
    self->_flattensBadgeView = a3;
    [(PUPhotoViewContentHelper *)self _invalidateBadgeView];
  }
}

- (void)setImageViewEdgeAntialiasingEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(PUPhotoViewContentHelper *)self photoImageView];
  double v4 = [v5 layer];
  [v4 setAllowsEdgeAntialiasing:v3];
}

- (BOOL)isImageViewEdgeAntialiasingEnabled
{
  v2 = [(PUPhotoViewContentHelper *)self photoImageView];
  BOOL v3 = [v2 layer];
  char v4 = [v3 allowsEdgeAntialiasing];

  return v4;
}

- (void)setPhotoDecoration:(id)a3
{
  char v4 = (PUPhotoDecoration *)a3;
  photoDecoration = self->_photoDecoration;
  if (photoDecoration != v4)
  {
    BOOL v9 = v4;
    BOOL v6 = [(PUPhotoDecoration *)photoDecoration isEqual:v4];
    char v4 = v9;
    if (!v6)
    {
      BOOL v7 = (PUPhotoDecoration *)[(PUPhotoDecoration *)v9 copy];
      id v8 = self->_photoDecoration;
      self->_photoDecoration = v7;

      [(PUPhotoViewContentHelper *)self _updatePhotoDecoration];
      char v4 = v9;
    }
  }
}

- (void)updatePhotoImageWithoutReconfiguring:(id)a3
{
  id v5 = (UIImage *)a3;
  if (self->_photoImage != v5)
  {
    id v11 = v5;
    objc_storeStrong((id *)&self->_photoImage, a3);
    photoImageView = self->_photoImageView;
    if (photoImageView)
    {
      [(UIImageView *)photoImageView setImage:self->_photoImage];
    }
    else if ([(PUPhotoViewContentHelper *)self needsAvalancheStack])
    {
      [(PUPhotoViewContentHelper *)self _addAvalancheStackViewIfNecessary];
      [(PUAvalancheStackView *)self->_avalancheStackView setImage:self->_photoImage];
      id WeakRetained = objc_loadWeakRetained((id *)&self->_contentView);
      id v8 = [WeakRetained layer];
      [v8 setContents:0];
    }
    else
    {
      [(PUPhotoViewContentHelper *)self _removeAvalancheStackViewIfNecessary];
      id v9 = objc_loadWeakRetained((id *)&self->_contentView);
      id v10 = [v9 layer];
      objc_msgSend(v10, "setContents:", -[UIImage CGImage](self->_photoImage, "CGImage"));
    }
    id v5 = v11;
  }
}

- (void)setPreferredImageDynamicRange:(int64_t)a3
{
  if (self->_preferredImageDynamicRange == a3)
  {
    self->_preferredImageDynamicRange = a3;
    [(PUPhotoViewContentHelper *)self _updateUnderlyingImageViewDynamicRange];
  }
}

- (void)setPlaceHolderImage:(id)a3
{
  id v5 = (UIImage *)a3;
  if (self->_placeHolderImage != v5)
  {
    BOOL v6 = v5;
    objc_storeStrong((id *)&self->_placeHolderImage, a3);
    [(PUPhotoViewContentHelper *)self _updateImageView];
    id v5 = v6;
  }
}

- (void)setPhotoImage:(id)a3
{
  id v5 = (UIImage *)a3;
  if (self->_photoImage != v5)
  {
    BOOL v6 = v5;
    objc_storeStrong((id *)&self->_photoImage, a3);
    [(PUPhotoViewContentHelper *)self _updateImageView];
    [(PUPhotoViewContentHelper *)self _invalidateTitleSubtitleUILabel];
    id v5 = v6;
  }
}

- (void)setTransitionSnapshotView:(id)a3
{
  id v5 = (UIView *)a3;
  transitionSnapshotView = self->_transitionSnapshotView;
  if (transitionSnapshotView != v5)
  {
    BOOL v7 = v5;
    [(UIView *)transitionSnapshotView removeFromSuperview];
    objc_storeStrong((id *)&self->_transitionSnapshotView, a3);
    [(PUPhotoViewContentHelper *)self _updateImageView];
    id v5 = v7;
  }
}

- (void)setImageTransform:(CGAffineTransform *)a3
{
  p_imageTransform = &self->_imageTransform;
  long long v6 = *(_OWORD *)&self->_imageTransform.c;
  *(_OWORD *)&t1.a = *(_OWORD *)&self->_imageTransform.a;
  *(_OWORD *)&t1.c = v6;
  *(_OWORD *)&t1.tx = *(_OWORD *)&self->_imageTransform.tx;
  long long v7 = *(_OWORD *)&a3->c;
  *(_OWORD *)&t2.a = *(_OWORD *)&a3->a;
  *(_OWORD *)&t2.c = v7;
  *(_OWORD *)&t2.tx = *(_OWORD *)&a3->tx;
  if (!CGAffineTransformEqualToTransform(&t1, &t2))
  {
    long long v8 = *(_OWORD *)&a3->a;
    long long v9 = *(_OWORD *)&a3->tx;
    *(_OWORD *)&p_imageTransform->c = *(_OWORD *)&a3->c;
    *(_OWORD *)&p_imageTransform->tx = v9;
    *(_OWORD *)&p_imageTransform->a = v8;
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __46__PUPhotoViewContentHelper_setImageTransform___block_invoke;
    v10[3] = &unk_1E5F2ED10;
    v10[4] = self;
    [MEMORY[0x1E4FB1EB0] performWithoutAnimation:v10];
  }
}

uint64_t __46__PUPhotoViewContentHelper_setImageTransform___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  long long v3 = *(_OWORD *)(v2 + 456);
  *(_OWORD *)&v8.a = *(_OWORD *)(v2 + 440);
  *(_OWORD *)&v8.c = v3;
  *(_OWORD *)&v8.tx = *(_OWORD *)(v2 + 472);
  *(unsigned char *)(v2 + 24) = !CGAffineTransformIsIdentity(&v8);
  [*(id *)(a1 + 32) _updateImageView];
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = *(void **)(v4 + 296);
  v4 += 440;
  long long v6 = *(_OWORD *)(v4 + 16);
  *(_OWORD *)&v8.a = *(_OWORD *)v4;
  *(_OWORD *)&v8.c = v6;
  *(_OWORD *)&v8.tx = *(_OWORD *)(v4 + 32);
  return [v5 setTransform:&v8];
}

- (void)setPhotoSize:(CGSize)a3
{
  if (self->_photoSize.width != a3.width || self->_photoSize.height != a3.height)
  {
    self->_photoSize = a3;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_contentView);
    [WeakRetained setNeedsLayout];
  }
}

- (void)setFillMode:(int64_t)a3
{
  if (self->_fillMode != a3)
  {
    self->_unint64_t fillMode = a3;
    [(PUPhotoViewContentHelper *)self _updateImageView];
    [(PUPhotoViewContentHelper *)self _updateLivePhotoView];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_contentView);
    [WeakRetained setNeedsLayout];
  }
}

- (void)setTextBannerVisible:(BOOL)a3
{
  if (self->_isTextBannerVisible != a3)
  {
    self->_BOOL isTextBannerVisible = a3;
    [(PUPhotoViewContentHelper *)self _updateTextBannerView];
  }
}

- (void)setCustomPaddingForBadgeElements:(CGSize)a3
{
  if (a3.width != self->_customPaddingForBadgeElements.width
    || a3.height != self->_customPaddingForBadgeElements.height)
  {
    self->_customPaddingForBadgeElements = a3;
    [(PUPhotoViewContentHelper *)self _invalidateBadgeView];
  }
}

- (void)setBadgeStyle:(int64_t)a3
{
  if (self->_badgeStyle != a3)
  {
    self->_badgeStyle = a3;
    [(PUPhotoViewContentHelper *)self _invalidateBadgeView];
  }
}

- (void)setBadgeInfo:(PXAssetBadgeInfo *)a3
{
  p_PXAssetBadgeInfo badgeInfo = &self->_badgeInfo;
  PXAssetBadgeInfo v8 = *a3;
  PXAssetBadgeInfo badgeInfo = self->_badgeInfo;
  if ((PXAssetBadgeInfoEqualToBadgeInfo() & 1) == 0)
  {
    long long v6 = *(_OWORD *)&a3->count;
    *(_OWORD *)&p_badgeInfo->badges = *(_OWORD *)&a3->badges;
    *(_OWORD *)&p_badgeInfo->count = v6;
    [(PUPhotoViewContentHelper *)self _invalidateBadgeView];
  }
}

- (CGRect)imageContentFrame
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_contentView);
  [WeakRetained bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  -[PUPhotoViewContentHelper imageContentFrameForBounds:](self, "imageContentFrameForBounds:", v5, v7, v9, v11);
  result.size.double height = v15;
  result.size.double width = v14;
  result.origin.double y = v13;
  result.origin.x = v12;
  return result;
}

- (CGRect)imageContentFrameForBounds:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  int64_t v8 = [(PUPhotoViewContentHelper *)self fillMode];
  [(PUPhotoViewContentHelper *)self photoSize];
  double v10 = v9;
  double v12 = v11;
  double v13 = objc_opt_class();
  objc_msgSend(v13, "_imageContentFrameForBounds:imageSize:fillMode:", v8, x, y, width, height, v10, v12);
  result.size.double height = v17;
  result.size.double width = v16;
  result.origin.double y = v15;
  result.origin.double x = v14;
  return result;
}

- (CGRect)photoDecorationBorderViewFrameForImageContentFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  double v7 = [(PUPhotoViewContentHelper *)self photoDecoration];
  [v7 borderWidth];
  double v9 = v8;

  double v10 = x - v9;
  double v11 = y - v9;
  double v12 = -v9 - v9;
  double v13 = width - v12;
  double v14 = height - v12;
  result.size.double height = v14;
  result.size.double width = v13;
  result.origin.double y = v11;
  result.origin.double x = v10;
  return result;
}

- (PUPhotoViewContentHelper)initWithContentView:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PUPhotoViewContentHelper;
  double v5 = [(PUPhotoViewContentHelper *)&v10 init];
  double v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_contentView, v4);
    v6->_unint64_t fillMode = 0;
    uint64_t v7 = [MEMORY[0x1E4FB1618] systemBackgroundColor];
    layerDefaultBackgroundColor = v6->_layerDefaultBackgroundColor;
    v6->_layerDefaultBackgroundColor = (UIColor *)v7;

    v6->_badgeStyle = 1;
    v6->_customPaddingForBadgeElements = (CGSize)*MEMORY[0x1E4F91350];
    v6->_contentAlpha = 1.0;
    v6->_continuousCorners = 1;
  }

  return v6;
}

- (PUPhotoViewContentHelper)init
{
  return [(PUPhotoViewContentHelper *)self initWithContentView:0];
}

+ (CGSize)sizeThatFits:(CGSize)a3 imageSize:(CGSize)a4 fillMode:(int64_t)a5
{
  objc_msgSend(a1, "_imageContentFrameForBounds:imageSize:fillMode:", a5, 0.0, 0.0, a3.width, a3.height, a4.width, a4.height);
  double v6 = v5;
  double v8 = v7;
  result.double height = v8;
  result.double width = v6;
  return result;
}

+ (CGRect)_imageContentFrameForBounds:(CGRect)result imageSize:(CGSize)a4 fillMode:(int64_t)a5
{
  CGFloat height = result.size.height;
  CGFloat width = result.size.width;
  CGFloat y = result.origin.y;
  CGFloat x = result.origin.x;
  if ((unint64_t)a5 >= 2)
  {
    result.size.CGFloat height = 0.0;
    result.size.CGFloat width = 0.0;
    result.origin.CGFloat y = 0.0;
    result.origin.CGFloat x = 0.0;
    if (a5 == 2) {
      result.origin.CGFloat x = PURectWithSizeThatFitsInRect(a4.width, a4.height, x, y, width, height);
    }
  }
  return result;
}

@end