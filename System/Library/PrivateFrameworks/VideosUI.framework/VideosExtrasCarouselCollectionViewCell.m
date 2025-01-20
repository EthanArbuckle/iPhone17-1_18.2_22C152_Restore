@interface VideosExtrasCarouselCollectionViewCell
- (BOOL)allowsPinchingThumbnailImageForInteractiveZoomingImageTransition;
- (CGSize)thumbnailMaxSize;
- (CGSize)windowSize;
- (MPUContentSizeLayoutConstraint)descriptionLabelBaselineConstraint;
- (MPUContentSizeLayoutConstraint)subtitleBaselineConstraint;
- (NSArray)thumbnailImageContainerViewConstraints;
- (NSLayoutConstraint)thumbnailImageContainerViewHeightConstraint;
- (NSString)zoomingImageTransitionIdentifier;
- (UILabel)descriptionLabel;
- (UILabel)subtitleLabel;
- (UILabel)titleLabel;
- (UIPinchGestureRecognizer)pinchGestureRecognizer;
- (UIView)textContainer;
- (VideosExtrasConstrainedArtworkContainerView)thumbnailImageContainerView;
- (VideosExtrasZoomingImageInteractiveTransitionSourceContext)interactiveTransitionSourceContext;
- (double)_descriptionLabelTopInset;
- (double)thumbnailImageContainerHeight;
- (id)descriptionText;
- (id)descriptionTextStyle;
- (id)lockupElement;
- (id)subtitleText;
- (id)subtitleTextStyle;
- (id)thumbnailImage;
- (id)thumbnailImageAccessibilityText;
- (id)thumbnailImagePlaceholder;
- (id)titleText;
- (id)titleTextStyle;
- (unint64_t)itemIndex;
- (void)_handlePinchGesture:(id)a3;
- (void)_setupDescriptionLabelWithConstraintsAccumulator:(id)a3;
- (void)_setupSubtitleLabelWithConstraintsAccumulator:(id)a3;
- (void)_setupThumbnailImageContainerViewWithConstraintsAccumulator:(id)a3;
- (void)_setupTitleLabelWithConstraintsAccumulator:(id)a3;
- (void)_updateThumbnailArtworkViewBorder;
- (void)dealloc;
- (void)finalizeZoomingImageTransitionWithContext:(id)a3 transitionFinished:(BOOL)a4;
- (void)performZoomingImageTransitionWithContext:(id)a3;
- (void)prepareForReuse;
- (void)prepareZoomingImageTransitionWithContext:(id)a3;
- (void)setAllowsPinchingThumbnailImageForInteractiveZoomingImageTransition:(BOOL)a3;
- (void)setDescriptionLabel:(id)a3;
- (void)setDescriptionLabelBaselineConstraint:(id)a3;
- (void)setDescriptionText:(id)a3;
- (void)setHighlighted:(BOOL)a3;
- (void)setInteractiveTransitionSourceContext:(id)a3;
- (void)setItemIndex:(unint64_t)a3;
- (void)setPinchGestureRecognizer:(id)a3;
- (void)setSubtitleBaselineConstraint:(id)a3;
- (void)setSubtitleLabel:(id)a3;
- (void)setSubtitleText:(id)a3;
- (void)setTextContainer:(id)a3;
- (void)setThumbnailBorderColor:(id)a3;
- (void)setThumbnailImage:(id)a3;
- (void)setThumbnailImageAccessibilityText:(id)a3;
- (void)setThumbnailImageContainerView:(id)a3;
- (void)setThumbnailImageContainerViewConstraints:(id)a3;
- (void)setThumbnailImageContainerViewHeightConstraint:(id)a3;
- (void)setThumbnailImagePlaceholder:(id)a3;
- (void)setThumbnailOverlayImage:(id)a3;
- (void)setTitleLabel:(id)a3;
- (void)setTitleText:(id)a3;
- (void)setWindowSize:(CGSize)a3;
- (void)setZoomingImageTransitionIdentifier:(id)a3;
- (void)updateConstraints;
@end

@implementation VideosExtrasCarouselCollectionViewCell

- (void)dealloc
{
  v3 = [(VideosExtrasCarouselCollectionViewCell *)self pinchGestureRecognizer];
  [v3 removeTarget:self action:0];

  v4.receiver = self;
  v4.super_class = (Class)VideosExtrasCarouselCollectionViewCell;
  [(VideosExtrasCarouselCollectionViewCell *)&v4 dealloc];
}

- (void)updateConstraints
{
  v3 = [(VideosExtrasCarouselCollectionViewCell *)self thumbnailImageContainerViewHeightConstraint];
  [(VideosExtrasCarouselCollectionViewCell *)self thumbnailImageContainerHeight];
  objc_msgSend(v3, "setConstant:");

  v46 = [(VideosExtrasCarouselCollectionViewCell *)self contentView];
  objc_super v4 = [(VideosExtrasCarouselCollectionViewCell *)self titleLabel];
  v5 = [(VideosExtrasCarouselCollectionViewCell *)self subtitleLabel];
  v6 = [(VideosExtrasCarouselCollectionViewCell *)self descriptionLabel];
  uint64_t v7 = [(VideosExtrasCarouselCollectionViewCell *)self thumbnailImageContainerView];
  v8 = [v4 text];
  v45 = (void *)v7;
  if ([v8 length])
  {

    uint64_t v9 = 11;
    v10 = v4;
  }
  else
  {
    v11 = [v4 attributedText];
    uint64_t v12 = [v11 length];

    if (v12) {
      v10 = v4;
    }
    else {
      v10 = (void *)v7;
    }
    if (v12) {
      uint64_t v9 = 11;
    }
    else {
      uint64_t v9 = 4;
    }
  }
  id v13 = v10;
  v14 = [(VideosExtrasCarouselCollectionViewCell *)self subtitleBaselineConstraint];
  if (v14)
  {
    v15 = v14;
    id v16 = [v14 secondItem];
    if (v16 == v13)
    {
      uint64_t v17 = [v15 secondAttribute];

      if (v17 == v9) {
        goto LABEL_15;
      }
    }
    else
    {
    }
    [v46 removeConstraint:v15];

    [(VideosExtrasCarouselCollectionViewCell *)self setSubtitleBaselineConstraint:0];
  }
  v18 = (void *)MEMORY[0x1E4F73A08];
  v19 = [(VideosExtrasCarouselCollectionViewCell *)self subtitleTextStyle];
  v15 = [v18 constraintWithAutoupdatingBaselineOfView:v5 toView:v13 attribute:v9 withTextStyle:v19 nonStandardLeading:25.0];

  [v46 addConstraint:v15];
  [(VideosExtrasCarouselCollectionViewCell *)self setSubtitleBaselineConstraint:v15];
LABEL_15:
  v20 = [v5 text];
  v44 = v13;
  if ([v20 length])
  {
    v21 = v5;
LABEL_17:

    uint64_t v22 = 11;
    goto LABEL_20;
  }
  v23 = [v5 attributedText];
  uint64_t v24 = [v23 length];

  if (v24)
  {
    uint64_t v22 = 11;
    v21 = v5;
  }
  else
  {
    v20 = [v4 text];
    if ([v20 length])
    {
      v21 = v4;
      goto LABEL_17;
    }
    v35 = [v4 attributedText];
    uint64_t v36 = [v35 length];

    if (v36) {
      v21 = v4;
    }
    else {
      v21 = v45;
    }
    if (v36) {
      uint64_t v22 = 11;
    }
    else {
      uint64_t v22 = 4;
    }
  }
LABEL_20:
  id v25 = v21;
  v26 = [(VideosExtrasCarouselCollectionViewCell *)self descriptionLabelBaselineConstraint];
  if (v26)
  {
    v27 = v26;
    id v28 = [v26 secondItem];
    if (v28 == v25)
    {
      uint64_t v29 = [v27 secondAttribute];

      if (v29 == v22) {
        goto LABEL_26;
      }
    }
    else
    {
    }
    [v46 removeConstraint:v27];

    [(VideosExtrasCarouselCollectionViewCell *)self setDescriptionLabelBaselineConstraint:0];
  }
  v30 = (void *)MEMORY[0x1E4F73A08];
  v31 = [(VideosExtrasCarouselCollectionViewCell *)self descriptionTextStyle];
  v27 = [v30 constraintWithAutoupdatingBaselineOfView:v6 toView:v25 attribute:v22 withTextStyle:v31 nonStandardLeading:40.0];

  [v46 addConstraint:v27];
  [(VideosExtrasCarouselCollectionViewCell *)self setDescriptionLabelBaselineConstraint:v27];
LABEL_26:
  v32 = [v4 text];
  if (![v32 length])
  {
    v33 = [v4 attributedText];
    if (![v33 length])
    {
      v34 = [v5 text];
      if (![v34 length])
      {
        v43 = [v5 attributedText];
        if (![v43 length])
        {
          v42 = [v6 text];
          if (![v42 length])
          {
            [v6 attributedText];
            v37 = v40 = v34;
            uint64_t v41 = [v37 length];

            if (v41) {
              goto LABEL_36;
            }
            v38 = [(VideosExtrasCarouselCollectionViewCell *)self thumbnailImageContainerViewConstraints];
            [v46 removeConstraints:v38];

            v39 = (void *)MEMORY[0x1E4F28DC8];
            v32 = [(VideosExtrasCarouselCollectionViewCell *)self thumbnailImageContainerView];
            v33 = objc_msgSend(v39, "constraintsByAttachingView:toView:alongEdges:insets:", v32, v46, 15, *MEMORY[0x1E4FB2848], *(double *)(MEMORY[0x1E4FB2848] + 8), *(double *)(MEMORY[0x1E4FB2848] + 16), *(double *)(MEMORY[0x1E4FB2848] + 24));
            [v46 addConstraints:v33];
            goto LABEL_34;
          }
        }
      }
    }
LABEL_34:
  }
LABEL_36:
  v47.receiver = self;
  v47.super_class = (Class)VideosExtrasCarouselCollectionViewCell;
  [(VideosExtrasCarouselCollectionViewCell *)&v47 updateConstraints];
}

- (void)prepareForReuse
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __57__VideosExtrasCarouselCollectionViewCell_prepareForReuse__block_invoke;
  v4[3] = &unk_1E6DF3D58;
  v4[4] = self;
  [MEMORY[0x1E4FB1EB0] performWithoutAnimation:v4];
  v3.receiver = self;
  v3.super_class = (Class)VideosExtrasCarouselCollectionViewCell;
  [(VideosExtrasCarouselCollectionViewCell *)&v3 prepareForReuse];
  [(VideosExtrasCarouselCollectionViewCell *)self setTitleText:0];
  [(VideosExtrasCarouselCollectionViewCell *)self setSubtitleText:0];
  [(VideosExtrasCarouselCollectionViewCell *)self setDescriptionText:0];
  [(VideosExtrasCarouselCollectionViewCell *)self setThumbnailImage:0];
  [(VideosExtrasCarouselCollectionViewCell *)self setThumbnailImagePlaceholder:0];
  [(VideosExtrasCarouselCollectionViewCell *)self setItemIndex:0];
  [(VideosExtrasCarouselCollectionViewCell *)self setThumbnailOverlayImage:0];
  [(VideosExtrasCarouselCollectionViewCell *)self clearArtworkCatalogs];
}

void __57__VideosExtrasCarouselCollectionViewCell_prepareForReuse__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) thumbnailImageContainerView];
  v1 = [v2 artworkView];
  [v1 setHighlighted:0];
}

- (void)setHighlighted:(BOOL)a3
{
  BOOL v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)VideosExtrasCarouselCollectionViewCell;
  -[VideosExtrasCarouselCollectionViewCell setHighlighted:](&v7, sel_setHighlighted_);
  v5 = [(VideosExtrasCarouselCollectionViewCell *)self thumbnailImageContainerView];
  v6 = [v5 artworkView];
  [v6 setHighlighted:v3 animated:v3 ^ 1];
}

- (void)prepareZoomingImageTransitionWithContext:(id)a3
{
  id v7 = a3;
  objc_super v4 = [(VideosExtrasCarouselCollectionViewCell *)self thumbnailImageContainerView];
  v5 = [v4 artworkView];

  if ([v7 appearState] == 1)
  {
    v6 = [v7 zoomingImageView];
    [v6 replicateStateFromImageView:v5];
  }
  [v5 setHidden:1];
}

- (void)performZoomingImageTransitionWithContext:(id)a3
{
  id v7 = a3;
  if (![v7 appearState])
  {
    objc_super v4 = [v7 zoomingImageView];
    v5 = [(VideosExtrasCarouselCollectionViewCell *)self thumbnailImageContainerView];
    v6 = [v5 artworkView];
    [v4 replicateStateFromImageView:v6];
  }
}

- (void)finalizeZoomingImageTransitionWithContext:(id)a3 transitionFinished:(BOOL)a4
{
  id v5 = [(VideosExtrasCarouselCollectionViewCell *)self thumbnailImageContainerView];
  objc_super v4 = [v5 artworkView];
  [v4 setHidden:0];
}

- (id)thumbnailImage
{
  id v2 = [(VideosExtrasCarouselCollectionViewCell *)self thumbnailImageContainerView];
  BOOL v3 = [v2 artworkView];
  objc_super v4 = [v3 image];

  return v4;
}

- (void)setThumbnailImage:(id)a3
{
  id v4 = a3;
  id v5 = [(VideosExtrasCarouselCollectionViewCell *)self thumbnailImageContainerView];
  v6 = [v5 artworkView];
  [v6 setImage:v4];

  [(VideosExtrasCarouselCollectionViewCell *)self _updateThumbnailArtworkViewBorder];
}

- (void)setThumbnailBorderColor:(id)a3
{
  id v4 = a3;
  id v9 = [(VideosExtrasCarouselCollectionViewCell *)self thumbnailImageContainerView];
  id v5 = [v9 artworkView];
  v6 = [v5 layer];
  id v7 = v4;
  uint64_t v8 = [v7 CGColor];

  [v6 setBorderColor:v8];
}

- (id)thumbnailImagePlaceholder
{
  id v2 = [(VideosExtrasCarouselCollectionViewCell *)self thumbnailImageContainerView];
  BOOL v3 = [v2 artworkView];
  id v4 = [v3 placeholderImage];

  return v4;
}

- (void)setThumbnailImagePlaceholder:(id)a3
{
  id v4 = a3;
  id v5 = [(VideosExtrasCarouselCollectionViewCell *)self thumbnailImageContainerView];
  v6 = [v5 artworkView];
  [v6 setPlaceholderImage:v4];

  [(VideosExtrasCarouselCollectionViewCell *)self _updateThumbnailArtworkViewBorder];
}

- (void)setThumbnailOverlayImage:(id)a3
{
  id v4 = a3;
  id v5 = [(VideosExtrasCarouselCollectionViewCell *)self thumbnailImageContainerView];
  [v5 setOverlayImage:v4];

  id v6 = [(VideosExtrasCarouselCollectionViewCell *)self thumbnailImageContainerView];
  [v6 setOverlayScale:0.2];
}

- (id)thumbnailImageAccessibilityText
{
  id v2 = [(VideosExtrasCarouselCollectionViewCell *)self thumbnailImageContainerView];
  BOOL v3 = [v2 artworkView];
  id v4 = [v3 accessibilityLabel];

  return v4;
}

- (void)setThumbnailImageAccessibilityText:(id)a3
{
  id v4 = a3;
  id v6 = [(VideosExtrasCarouselCollectionViewCell *)self thumbnailImageContainerView];
  id v5 = [v6 artworkView];
  [v5 setAccessibilityLabel:v4];
}

- (id)titleText
{
  id v2 = [(VideosExtrasCarouselCollectionViewCell *)self titleLabel];
  BOOL v3 = [v2 text];

  return v3;
}

- (void)setTitleText:(id)a3
{
  id v4 = a3;
  id v5 = [(VideosExtrasCarouselCollectionViewCell *)self titleLabel];
  [v5 setAttributedText:v4];
}

- (id)subtitleText
{
  id v2 = [(VideosExtrasCarouselCollectionViewCell *)self subtitleLabel];
  BOOL v3 = [v2 text];

  return v3;
}

- (void)setSubtitleText:(id)a3
{
  id v4 = a3;
  id v5 = [(VideosExtrasCarouselCollectionViewCell *)self subtitleLabel];
  [v5 setAttributedText:v4];
}

- (id)descriptionText
{
  id v2 = [(VideosExtrasCarouselCollectionViewCell *)self descriptionLabel];
  BOOL v3 = [v2 text];

  return v3;
}

- (void)setDescriptionText:(id)a3
{
  id v4 = a3;
  id v5 = [(VideosExtrasCarouselCollectionViewCell *)self descriptionLabel];
  [v5 setAttributedText:v4];
}

- (id)lockupElement
{
  return 0;
}

- (void)setAllowsPinchingThumbnailImageForInteractiveZoomingImageTransition:(BOOL)a3
{
  if (self->_allowsPinchingThumbnailImageForInteractiveZoomingImageTransition != a3)
  {
    self->_allowsPinchingThumbnailImageForInteractiveZoomingImageTransition = a3;
    if (a3)
    {
      id v10 = (id)[objc_alloc(MEMORY[0x1E4FB1AA0]) initWithTarget:self action:sel__handlePinchGesture_];
      id v4 = [(VideosExtrasCarouselCollectionViewCell *)self thumbnailImageContainerView];
      id v5 = [v4 artworkView];
      [v5 addGestureRecognizer:v10];

      [(VideosExtrasCarouselCollectionViewCell *)self setPinchGestureRecognizer:v10];
      id v6 = objc_alloc_init(VideosExtrasZoomingImageInteractiveTransitionSourceContext);
      [(VideosExtrasZoomingImageInteractiveTransitionSourceContext *)v6 setPinchGestureRecognizer:v10];
      [(VideosExtrasZoomingImageInteractiveTransitionSourceContext *)v6 setItemIndex:[(VideosExtrasCarouselCollectionViewCell *)self itemIndex]];
      [(VideosExtrasZoomingImageInteractiveTransitionSourceContext *)v6 setSupportedZoomingImageTransitionDirections:3];
      id v7 = [(VideosExtrasCarouselCollectionViewCell *)self zoomingImageTransitionIdentifier];
      [(VideosExtrasZoomingImageInteractiveTransitionSourceContext *)v6 setIdentifier:v7];

      [(VideosExtrasCarouselCollectionViewCell *)self setInteractiveTransitionSourceContext:v6];
    }
    else
    {
      id v10 = [(VideosExtrasCarouselCollectionViewCell *)self pinchGestureRecognizer];
      uint64_t v8 = [(VideosExtrasCarouselCollectionViewCell *)self thumbnailImageContainerView];
      id v9 = [v8 artworkView];
      [v9 removeGestureRecognizer:v10];

      [v10 removeTarget:self action:0];
      [(VideosExtrasCarouselCollectionViewCell *)self setPinchGestureRecognizer:0];
      [(VideosExtrasCarouselCollectionViewCell *)self setInteractiveTransitionSourceContext:0];
    }
  }
}

- (void)setZoomingImageTransitionIdentifier:(id)a3
{
  if (self->_zoomingImageTransitionIdentifier != a3)
  {
    id v4 = a3;
    id v5 = (NSString *)[v4 copy];
    zoomingImageTransitionIdentifier = self->_zoomingImageTransitionIdentifier;
    self->_zoomingImageTransitionIdentifier = v5;

    id v7 = [(VideosExtrasCarouselCollectionViewCell *)self interactiveTransitionSourceContext];
    [v7 setIdentifier:v4];
  }
}

- (CGSize)thumbnailMaxSize
{
  double v2 = *MEMORY[0x1E4F1DB30];
  double v3 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  result.height = v3;
  result.width = v2;
  return result;
}

- (id)titleTextStyle
{
  return (id)*MEMORY[0x1E4FB28C8];
}

- (id)subtitleTextStyle
{
  return (id)*MEMORY[0x1E4FB2950];
}

- (id)descriptionTextStyle
{
  return (id)*MEMORY[0x1E4FB28F0];
}

- (void)setWindowSize:(CGSize)a3
{
  double width = self->_windowSize.width;
  double height = self->_windowSize.height;
  if (width != a3.width || height != a3.height)
  {
    self->_windowSize = a3;
    if (width == *MEMORY[0x1E4F1DB30] && height == *(double *)(MEMORY[0x1E4F1DB30] + 8))
    {
      id v8 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      [(VideosExtrasCarouselCollectionViewCell *)self _setupThumbnailImageContainerViewWithConstraintsAccumulator:v8];
      [(VideosExtrasCarouselCollectionViewCell *)self _setupTitleLabelWithConstraintsAccumulator:v8];
      [(VideosExtrasCarouselCollectionViewCell *)self _setupSubtitleLabelWithConstraintsAccumulator:v8];
      [(VideosExtrasCarouselCollectionViewCell *)self _setupDescriptionLabelWithConstraintsAccumulator:v8];
      id v9 = [(VideosExtrasCarouselCollectionViewCell *)self contentView];
      [v9 addConstraints:v8];
    }
    [(VideosExtrasCarouselCollectionViewCell *)self setNeedsUpdateConstraints];
  }
}

- (double)thumbnailImageContainerHeight
{
  [(VideosExtrasCarouselCollectionViewCell *)self windowSize];
  MPULayoutLinearRelationMake();
  MPULayoutLinearRelationEvaluate();
  return result;
}

- (void)setItemIndex:(unint64_t)a3
{
  self->_itemIndex = a3;
  id v4 = [(VideosExtrasCarouselCollectionViewCell *)self interactiveTransitionSourceContext];
  [v4 setItemIndex:a3];
}

- (void)_handlePinchGesture:(id)a3
{
  id v5 = [(VideosExtrasCarouselCollectionViewCell *)self interactiveTransitionSourceContext];
  id v4 = [(VideosExtrasCarouselCollectionViewCell *)self targetForAction:sel_handlePinchGestureForZoomingImageInteractiveTransitionWithContext_ withSender:v5];
  [v4 handlePinchGestureForZoomingImageInteractiveTransitionWithContext:v5];
}

- (double)_descriptionLabelTopInset
{
  [(VideosExtrasCarouselCollectionViewCell *)self windowSize];
  MPULayoutLinearRelationMake();
  MPULayoutLinearRelationEvaluate();
  return result;
}

- (void)_setupThumbnailImageContainerViewWithConstraintsAccumulator:(id)a3
{
  id v4 = a3;
  id v9 = [(VideosExtrasCarouselCollectionViewCell *)self contentView];
  id v5 = (void *)[[VideosExtrasConstrainedArtworkContainerView alloc] initForAutolayout];
  id v6 = [v5 artworkView];
  [v6 setDimsWhenHighlighted:1];
  [v6 setForcesAnimatedUnhighlighting:1];
  [v6 setMultipleTouchEnabled:1];
  [v6 setUserInteractionEnabled:1];
  [v6 setIsAccessibilityElement:1];
  [v9 addSubview:v5];
  id v7 = objc_msgSend(MEMORY[0x1E4F28DC8], "constraintsByAttachingView:toView:alongEdges:insets:", v5, v9, 11, *MEMORY[0x1E4FB2848], *(double *)(MEMORY[0x1E4FB2848] + 8), *(double *)(MEMORY[0x1E4FB2848] + 16), *(double *)(MEMORY[0x1E4FB2848] + 24));
  [(VideosExtrasCarouselCollectionViewCell *)self setThumbnailImageContainerViewConstraints:v7];
  [v4 addObjectsFromArray:v7];

  id v8 = [MEMORY[0x1E4F28DC8] constraintWithItem:v5 attribute:8 relatedBy:0 toItem:0 attribute:0 multiplier:0.0 constant:0.0];
  [v5 addConstraint:v8];
  [(VideosExtrasCarouselCollectionViewCell *)self setThumbnailImageContainerViewHeightConstraint:v8];
  [(VideosExtrasCarouselCollectionViewCell *)self setThumbnailImageContainerView:v5];
}

- (void)_setupTitleLabelWithConstraintsAccumulator:(id)a3
{
  id v4 = a3;
  id v15 = [(VideosExtrasCarouselCollectionViewCell *)self contentView];
  id v5 = [(VideosExtrasCarouselCollectionViewCell *)self thumbnailImageContainerView];
  id v6 = (void *)[objc_alloc(MEMORY[0x1E4FB1930]) initForAutolayout];
  objc_msgSend(v6, "MPU_setAutomaticallyUpdatesTextStyleFontsToPreferredTextStyleFonts:", 1);
  id v7 = [MEMORY[0x1E4FB08E0] systemFontOfSize:17.0];
  [v6 setFont:v7];
  id v8 = [MEMORY[0x1E4FB1618] whiteColor];
  [v6 setTextColor:v8];

  [v15 insertSubview:v6 belowSubview:v5];
  LODWORD(v9) = 1144750080;
  [v6 setContentHuggingPriority:1 forAxis:v9];
  id v10 = (void *)MEMORY[0x1E4F73A08];
  v11 = [(VideosExtrasCarouselCollectionViewCell *)self titleTextStyle];
  uint64_t v12 = [v10 constraintWithAutoupdatingBaselineOfView:v6 relation:0 toView:v5 attribute:4 withTextStyle:v11 multiplier:1.0 nonStandardLeading:34.0];
  [v4 addObject:v12];

  id v13 = objc_msgSend(MEMORY[0x1E4F28DC8], "constraintsByAttachingView:toView:alongEdges:insets:", v6, v15, 10, *MEMORY[0x1E4FB2848], *(double *)(MEMORY[0x1E4FB2848] + 8), *(double *)(MEMORY[0x1E4FB2848] + 16), *(double *)(MEMORY[0x1E4FB2848] + 24));
  [v4 addObjectsFromArray:v13];

  v14 = [MEMORY[0x1E4F28DC8] constraintWithItem:v6 attribute:4 relatedBy:-1 toItem:v15 attribute:4 multiplier:1.0 constant:0.0];
  [v4 addObject:v14];

  [(VideosExtrasCarouselCollectionViewCell *)self setTitleLabel:v6];
}

- (void)_setupSubtitleLabelWithConstraintsAccumulator:(id)a3
{
  id v4 = a3;
  id v12 = [(VideosExtrasCarouselCollectionViewCell *)self contentView];
  id v5 = [(VideosExtrasCarouselCollectionViewCell *)self thumbnailImageContainerView];
  id v6 = (void *)[objc_alloc(MEMORY[0x1E4FB1930]) initForAutolayout];
  objc_msgSend(v6, "MPU_setAutomaticallyUpdatesTextStyleFontsToPreferredTextStyleFonts:", 1);
  id v7 = [MEMORY[0x1E4FB08E0] systemFontOfSize:11.0];
  [v6 setFont:v7];
  id v8 = [MEMORY[0x1E4FB1618] colorWithWhite:0.5 alpha:1.0];
  [v6 setTextColor:v8];

  [v12 insertSubview:v6 belowSubview:v5];
  LODWORD(v9) = 1144733696;
  [v6 setContentHuggingPriority:1 forAxis:v9];
  id v10 = objc_msgSend(MEMORY[0x1E4F28DC8], "constraintsByAttachingView:toView:alongEdges:insets:", v6, v12, 10, *MEMORY[0x1E4FB2848], *(double *)(MEMORY[0x1E4FB2848] + 8), *(double *)(MEMORY[0x1E4FB2848] + 16), *(double *)(MEMORY[0x1E4FB2848] + 24));
  [v4 addObjectsFromArray:v10];

  v11 = [MEMORY[0x1E4F28DC8] constraintWithItem:v6 attribute:4 relatedBy:-1 toItem:v12 attribute:4 multiplier:1.0 constant:0.0];
  [v4 addObject:v11];

  [(VideosExtrasCarouselCollectionViewCell *)self setSubtitleLabel:v6];
}

- (void)_setupDescriptionLabelWithConstraintsAccumulator:(id)a3
{
  id v4 = a3;
  id v12 = [(VideosExtrasCarouselCollectionViewCell *)self contentView];
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4FB1930]) initForAutolayout];
  objc_msgSend(v5, "MPU_setAutomaticallyUpdatesTextStyleFontsToPreferredTextStyleFonts:", 1);
  id v6 = [MEMORY[0x1E4FB08E0] systemFontOfSize:11.0];
  [v5 setFont:v6];
  id v7 = [MEMORY[0x1E4FB1618] colorWithWhite:0.7 alpha:1.0];
  [v5 setTextColor:v7];

  [v5 setNumberOfLines:0];
  id v8 = [(VideosExtrasCarouselCollectionViewCell *)self thumbnailImageContainerView];
  [v12 insertSubview:v5 belowSubview:v8];

  LODWORD(v9) = 1144717312;
  [v5 setContentHuggingPriority:1 forAxis:v9];
  id v10 = objc_msgSend(MEMORY[0x1E4F28DC8], "constraintsByAttachingView:toView:alongEdges:insets:", v5, v12, 10, *MEMORY[0x1E4FB2848], *(double *)(MEMORY[0x1E4FB2848] + 8), *(double *)(MEMORY[0x1E4FB2848] + 16), *(double *)(MEMORY[0x1E4FB2848] + 24));
  [v4 addObjectsFromArray:v10];

  v11 = [MEMORY[0x1E4F28DC8] constraintWithItem:v5 attribute:4 relatedBy:-1 toItem:v12 attribute:4 multiplier:1.0 constant:0.0];
  [v4 addObject:v11];

  [(VideosExtrasCarouselCollectionViewCell *)self setDescriptionLabel:v5];
}

- (void)_updateThumbnailArtworkViewBorder
{
  double v2 = [(VideosExtrasCarouselCollectionViewCell *)self thumbnailImageContainerView];
  id v8 = [v2 artworkView];

  double v3 = [v8 image];

  id v4 = [v8 layer];
  id v5 = v4;
  if (v3)
  {
    id v6 = [MEMORY[0x1E4FB1BA8] mainScreen];
    [v6 scale];
    [v5 setBorderWidth:1.0 / v7];
  }
  else
  {
    [v4 setBorderWidth:0.0];
  }
}

- (VideosExtrasConstrainedArtworkContainerView)thumbnailImageContainerView
{
  return self->_thumbnailImageContainerView;
}

- (void)setThumbnailImageContainerView:(id)a3
{
}

- (NSLayoutConstraint)thumbnailImageContainerViewHeightConstraint
{
  return self->_thumbnailImageContainerViewHeightConstraint;
}

- (void)setThumbnailImageContainerViewHeightConstraint:(id)a3
{
}

- (NSArray)thumbnailImageContainerViewConstraints
{
  return self->_thumbnailImageContainerViewConstraints;
}

- (void)setThumbnailImageContainerViewConstraints:(id)a3
{
}

- (MPUContentSizeLayoutConstraint)subtitleBaselineConstraint
{
  return self->_subtitleBaselineConstraint;
}

- (void)setSubtitleBaselineConstraint:(id)a3
{
}

- (MPUContentSizeLayoutConstraint)descriptionLabelBaselineConstraint
{
  return self->_descriptionLabelBaselineConstraint;
}

- (void)setDescriptionLabelBaselineConstraint:(id)a3
{
}

- (UIView)textContainer
{
  return self->_textContainer;
}

- (void)setTextContainer:(id)a3
{
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
}

- (UILabel)subtitleLabel
{
  return self->_subtitleLabel;
}

- (void)setSubtitleLabel:(id)a3
{
}

- (UILabel)descriptionLabel
{
  return self->_descriptionLabel;
}

- (void)setDescriptionLabel:(id)a3
{
}

- (unint64_t)itemIndex
{
  return self->_itemIndex;
}

- (VideosExtrasZoomingImageInteractiveTransitionSourceContext)interactiveTransitionSourceContext
{
  return self->_interactiveTransitionSourceContext;
}

- (void)setInteractiveTransitionSourceContext:(id)a3
{
}

- (UIPinchGestureRecognizer)pinchGestureRecognizer
{
  return self->_pinchGestureRecognizer;
}

- (void)setPinchGestureRecognizer:(id)a3
{
}

- (BOOL)allowsPinchingThumbnailImageForInteractiveZoomingImageTransition
{
  return self->_allowsPinchingThumbnailImageForInteractiveZoomingImageTransition;
}

- (NSString)zoomingImageTransitionIdentifier
{
  return self->_zoomingImageTransitionIdentifier;
}

- (CGSize)windowSize
{
  double width = self->_windowSize.width;
  double height = self->_windowSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_zoomingImageTransitionIdentifier, 0);
  objc_storeStrong((id *)&self->_pinchGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_interactiveTransitionSourceContext, 0);
  objc_storeStrong((id *)&self->_descriptionLabel, 0);
  objc_storeStrong((id *)&self->_subtitleLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_textContainer, 0);
  objc_storeStrong((id *)&self->_descriptionLabelBaselineConstraint, 0);
  objc_storeStrong((id *)&self->_subtitleBaselineConstraint, 0);
  objc_storeStrong((id *)&self->_thumbnailImageContainerViewConstraints, 0);
  objc_storeStrong((id *)&self->_thumbnailImageContainerViewHeightConstraint, 0);
  objc_storeStrong((id *)&self->_thumbnailImageContainerView, 0);
}

@end