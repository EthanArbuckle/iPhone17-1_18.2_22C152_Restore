@interface VideosExtrasLockupCollectionViewCell
- (CGSize)thumbnailMaxSize;
- (IKLockupElement)lockup;
- (VideosExtrasLockupCollectionViewCell)initWithFrame:(CGRect)a3;
- (id)descriptionText;
- (id)descriptionTextStyle;
- (id)subtitleText;
- (id)subtitleTextStyle;
- (id)thumbnailImage;
- (id)titleText;
- (id)titleTextStyle;
- (unint64_t)itemIndex;
- (void)_handlePinchGesture:(id)a3;
- (void)finalizeZoomingImageTransitionWithContext:(id)a3 transitionFinished:(BOOL)a4;
- (void)performZoomingImageTransitionWithContext:(id)a3;
- (void)prepareForReuse;
- (void)prepareZoomingImageTransitionWithContext:(id)a3;
- (void)setAllowsPinchingThumbnailImageForInteractiveZoomingImageTransition:(BOOL)a3;
- (void)setDescriptionText:(id)a3;
- (void)setHighlighted:(BOOL)a3;
- (void)setItemIndex:(unint64_t)a3;
- (void)setLockup:(id)a3;
- (void)setSubtitleText:(id)a3;
- (void)setThumbnailBorderColor:(id)a3;
- (void)setThumbnailImage:(id)a3;
- (void)setThumbnailImageAccessibilityText:(id)a3;
- (void)setThumbnailImagePlaceholder:(id)a3;
- (void)setThumbnailMaxSize:(CGSize)a3;
- (void)setThumbnailOverlayImage:(id)a3;
- (void)setTitleText:(id)a3;
- (void)setZoomingImageTransitionIdentifier:(id)a3;
- (void)updateConstraints;
@end

@implementation VideosExtrasLockupCollectionViewCell

- (VideosExtrasLockupCollectionViewCell)initWithFrame:(CGRect)a3
{
  v58.receiver = self;
  v58.super_class = (Class)VideosExtrasLockupCollectionViewCell;
  v3 = -[VideosExtrasLockupCollectionViewCell initWithFrame:](&v58, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    uint64_t v4 = [[VideosExtrasConstrainedArtworkContainerView alloc] initForAutolayout];
    artworkContainerView = v3->_artworkContainerView;
    v3->_artworkContainerView = (VideosExtrasConstrainedArtworkContainerView *)v4;

    [(VideosExtrasConstrainedArtworkContainerView *)v3->_artworkContainerView setUserInteractionEnabled:1];
    [(VideosExtrasConstrainedArtworkContainerView *)v3->_artworkContainerView setMultipleTouchEnabled:1];
    v6 = [(VideosExtrasConstrainedArtworkContainerView *)v3->_artworkContainerView artworkView];
    [v6 setUserInteractionEnabled:1];

    v7 = [(VideosExtrasConstrainedArtworkContainerView *)v3->_artworkContainerView artworkView];
    [v7 setMultipleTouchEnabled:1];

    v8 = [(VideosExtrasConstrainedArtworkContainerView *)v3->_artworkContainerView artworkView];
    [v8 setDimsWhenHighlighted:1];

    id v9 = [MEMORY[0x1E4FB1618] colorWithWhite:0.2 alpha:1.0];
    uint64_t v10 = [v9 CGColor];
    v11 = [(VideosExtrasConstrainedArtworkContainerView *)v3->_artworkContainerView artworkView];
    v12 = [v11 layer];
    [v12 setBorderColor:v10];

    [(VideosExtrasLockupCollectionViewCell *)v3 addSubview:v3->_artworkContainerView];
    uint64_t v13 = [objc_alloc(MEMORY[0x1E4FB1EB0]) initForAutolayout];
    textContainerView = v3->_textContainerView;
    v3->_textContainerView = (UIView *)v13;

    [(VideosExtrasLockupCollectionViewCell *)v3 addSubview:v3->_textContainerView];
    uint64_t v15 = [objc_alloc(MEMORY[0x1E4FB1930]) initForAutolayout];
    titleLabel = v3->_titleLabel;
    v3->_titleLabel = (UILabel *)v15;

    LODWORD(v17) = 1148846080;
    [(UILabel *)v3->_titleLabel setContentCompressionResistancePriority:1 forAxis:v17];
    [(UILabel *)v3->_titleLabel MPU_setAutomaticallyUpdatesTextStyleFontsToPreferredTextStyleFonts:1];
    [(UILabel *)v3->_titleLabel setAdjustsFontSizeToFitWidth:0];
    [(UILabel *)v3->_titleLabel setNumberOfLines:0];
    v18 = [MEMORY[0x1E4FB1618] clearColor];
    [(UILabel *)v3->_titleLabel setBackgroundColor:v18];

    [(VideosExtrasLockupCollectionViewCell *)v3 addSubview:v3->_titleLabel];
    uint64_t v19 = [objc_alloc(MEMORY[0x1E4FB1930]) initForAutolayout];
    subtitleLabel = v3->_subtitleLabel;
    v3->_subtitleLabel = (UILabel *)v19;

    LODWORD(v21) = 1148846080;
    [(UILabel *)v3->_subtitleLabel setContentCompressionResistancePriority:1 forAxis:v21];
    [(UILabel *)v3->_subtitleLabel MPU_setAutomaticallyUpdatesTextStyleFontsToPreferredTextStyleFonts:1];
    [(UILabel *)v3->_subtitleLabel setAdjustsFontSizeToFitWidth:0];
    [(UILabel *)v3->_subtitleLabel setNumberOfLines:0];
    v22 = [MEMORY[0x1E4FB1618] clearColor];
    [(UILabel *)v3->_subtitleLabel setBackgroundColor:v22];

    [(VideosExtrasLockupCollectionViewCell *)v3 addSubview:v3->_subtitleLabel];
    uint64_t v23 = [objc_alloc(MEMORY[0x1E4FB1930]) initForAutolayout];
    descriptionLabel = v3->_descriptionLabel;
    v3->_descriptionLabel = (UILabel *)v23;

    LODWORD(v25) = 1144750080;
    [(UILabel *)v3->_descriptionLabel setContentCompressionResistancePriority:1 forAxis:v25];
    [(UILabel *)v3->_descriptionLabel MPU_setAutomaticallyUpdatesTextStyleFontsToPreferredTextStyleFonts:1];
    [(UILabel *)v3->_descriptionLabel setAdjustsFontSizeToFitWidth:0];
    [(UILabel *)v3->_descriptionLabel setNumberOfLines:0];
    v26 = [MEMORY[0x1E4FB1618] clearColor];
    [(UILabel *)v3->_descriptionLabel setBackgroundColor:v26];

    [(VideosExtrasLockupCollectionViewCell *)v3 addSubview:v3->_descriptionLabel];
    v57 = [MEMORY[0x1E4F28DC8] constraintWithItem:v3->_artworkContainerView attribute:5 relatedBy:0 toItem:v3 attribute:5 multiplier:1.0 constant:0.0];
    v56 = [MEMORY[0x1E4F28DC8] constraintWithItem:v3->_artworkContainerView attribute:10 relatedBy:0 toItem:v3 attribute:10 multiplier:1.0 constant:0.0];
    v55 = [MEMORY[0x1E4F28DC8] constraintWithItem:v3->_artworkContainerView attribute:8 relatedBy:-1 toItem:v3 attribute:8 multiplier:1.0 constant:0.0];
    uint64_t v27 = [MEMORY[0x1E4F28DC8] constraintWithItem:v3->_artworkContainerView attribute:7 relatedBy:0 toItem:0 attribute:0 multiplier:1.0 constant:v3->_artworkSize.width];
    artworkContainerWidthConstraint = v3->_artworkContainerWidthConstraint;
    v3->_artworkContainerWidthConstraint = (NSLayoutConstraint *)v27;

    LODWORD(v29) = 1148829696;
    [(NSLayoutConstraint *)v3->_artworkContainerWidthConstraint setPriority:v29];
    uint64_t v30 = [MEMORY[0x1E4F28DC8] constraintWithItem:v3->_artworkContainerView attribute:8 relatedBy:0 toItem:0 attribute:0 multiplier:1.0 constant:v3->_artworkSize.height];
    artworkContainerHeightConstraint = v3->_artworkContainerHeightConstraint;
    v3->_artworkContainerHeightConstraint = (NSLayoutConstraint *)v30;

    LODWORD(v32) = 1148829696;
    [(NSLayoutConstraint *)v3->_artworkContainerHeightConstraint setPriority:v32];
    v54 = [MEMORY[0x1E4F28DC8] constraintWithItem:v3->_textContainerView attribute:8 relatedBy:-1 toItem:v3->_artworkContainerView attribute:8 multiplier:1.0 constant:0.0];
    v53 = [MEMORY[0x1E4F28DC8] constraintWithItem:v3->_textContainerView attribute:3 relatedBy:1 toItem:v3 attribute:3 multiplier:1.0 constant:0.0];
    v52 = [MEMORY[0x1E4F28DC8] constraintWithItem:v3->_textContainerView attribute:4 relatedBy:-1 toItem:v3 attribute:4 multiplier:1.0 constant:0.0];
    v51 = [MEMORY[0x1E4F28DC8] constraintWithItem:v3->_textContainerView attribute:5 relatedBy:0 toItem:v3->_artworkContainerView attribute:6 multiplier:1.0 constant:20.0];
    v50 = [MEMORY[0x1E4F28DC8] constraintWithItem:v3->_textContainerView attribute:6 relatedBy:0 toItem:v3 attribute:6 multiplier:1.0 constant:-20.0];
    v49 = [MEMORY[0x1E4F28DC8] constraintWithItem:v3->_textContainerView attribute:10 relatedBy:0 toItem:v3 attribute:10 multiplier:1.0 constant:0.0];
    v48 = [MEMORY[0x1E4F28DC8] constraintWithItem:v3->_titleLabel attribute:3 relatedBy:0 toItem:v3->_textContainerView attribute:3 multiplier:1.0 constant:0.0];
    double v33 = *MEMORY[0x1E4FB2848];
    double v34 = *(double *)(MEMORY[0x1E4FB2848] + 8);
    double v35 = *(double *)(MEMORY[0x1E4FB2848] + 16);
    double v36 = *(double *)(MEMORY[0x1E4FB2848] + 24);
    v47 = objc_msgSend(MEMORY[0x1E4F28DC8], "constraintsByAttachingView:toView:alongEdges:insets:", v3->_titleLabel, v3->_textContainerView, 10, *MEMORY[0x1E4FB2848], v34, v35, v36);
    v37 = (void *)MEMORY[0x1E4F73A08];
    v38 = v3->_subtitleLabel;
    v39 = v3->_titleLabel;
    v40 = [(VideosExtrasLockupCollectionViewCell *)v3 subtitleTextStyle];
    v41 = [v37 constraintWithAutoupdatingBaselineOfView:v38 toView:v39 attribute:11 withTextStyle:v40 nonStandardLeading:20.0];

    v46 = objc_msgSend(MEMORY[0x1E4F28DC8], "constraintsByAttachingView:toView:alongEdges:insets:", v3->_subtitleLabel, v3->_textContainerView, 10, v33, v34, v35, v36);
    v42 = objc_msgSend(MEMORY[0x1E4F28DC8], "constraintsByAttachingView:toView:alongEdges:insets:", v3->_descriptionLabel, v3->_textContainerView, 10, v33, v34, v35, v36);
    v45 = [MEMORY[0x1E4F28DC8] constraintWithItem:v3->_descriptionLabel attribute:4 relatedBy:-1 toItem:v3->_textContainerView attribute:4 multiplier:1.0 constant:0.0];
    v43 = [MEMORY[0x1E4F1CA48] array];
    [v43 addObject:v57];
    [v43 addObject:v56];
    [v43 addObject:v55];
    [v43 addObject:v3->_artworkContainerWidthConstraint];
    [v43 addObject:v3->_artworkContainerHeightConstraint];
    [v43 addObject:v54];
    [v43 addObject:v53];
    [v43 addObject:v52];
    [v43 addObject:v51];
    [v43 addObject:v50];
    [v43 addObject:v49];
    [v43 addObject:v48];
    [v43 addObjectsFromArray:v47];
    [v43 addObject:v41];
    [v43 addObjectsFromArray:v46];
    [v43 addObjectsFromArray:v42];
    [v43 addObject:v45];
    [(VideosExtrasLockupCollectionViewCell *)v3 addConstraints:v43];
  }
  return v3;
}

- (void)prepareForReuse
{
  v5.receiver = self;
  v5.super_class = (Class)VideosExtrasLockupCollectionViewCell;
  [(VideosExtrasLockupCollectionViewCell *)&v5 prepareForReuse];
  v3 = [(VideosExtrasConstrainedArtworkContainerView *)self->_artworkContainerView artworkView];
  [v3 setPlaceholderImage:0];

  uint64_t v4 = [(VideosExtrasConstrainedArtworkContainerView *)self->_artworkContainerView artworkView];
  [v4 setImage:0];

  [(VideosExtrasConstrainedArtworkContainerView *)self->_artworkContainerView setOverlayImage:0];
  [(UILabel *)self->_titleLabel setText:0];
  [(UILabel *)self->_titleLabel setAttributedText:0];
  [(UILabel *)self->_titleLabel setFont:0];
  [(UILabel *)self->_subtitleLabel setText:0];
  [(UILabel *)self->_subtitleLabel setAttributedText:0];
  [(UILabel *)self->_subtitleLabel setFont:0];
  [(UILabel *)self->_descriptionLabel setText:0];
  [(UILabel *)self->_descriptionLabel setAttributedText:0];
  [(UILabel *)self->_descriptionLabel setFont:0];
}

- (void)setTitleText:(id)a3
{
}

- (id)titleText
{
  return [(UILabel *)self->_titleLabel text];
}

- (void)setSubtitleText:(id)a3
{
}

- (id)subtitleText
{
  return [(UILabel *)self->_subtitleLabel text];
}

- (void)setDescriptionText:(id)a3
{
}

- (id)descriptionText
{
  return [(UILabel *)self->_descriptionLabel text];
}

- (void)setThumbnailImage:(id)a3
{
  artworkContainerView = self->_artworkContainerView;
  id v4 = a3;
  id v10 = [(VideosExtrasConstrainedArtworkContainerView *)artworkContainerView artworkView];
  [v10 setImage:v4];

  objc_super v5 = [v10 image];
  if (v5)
  {
    v6 = [MEMORY[0x1E4FB1BA8] mainScreen];
    [v6 scale];
    double v8 = 1.0 / v7;
  }
  else
  {
    double v8 = 0.0;
  }

  id v9 = [v10 layer];
  [v9 setBorderWidth:v8];
}

- (void)setThumbnailBorderColor:(id)a3
{
  uint64_t v4 = [a3 CGColor];
  id v6 = [(VideosExtrasConstrainedArtworkContainerView *)self->_artworkContainerView artworkView];
  objc_super v5 = [v6 layer];
  [v5 setBorderColor:v4];
}

- (void)setThumbnailImagePlaceholder:(id)a3
{
  artworkContainerView = self->_artworkContainerView;
  id v4 = a3;
  id v5 = [(VideosExtrasConstrainedArtworkContainerView *)artworkContainerView artworkView];
  [v5 setPlaceholderImage:v4];
}

- (void)setThumbnailImageAccessibilityText:(id)a3
{
  artworkContainerView = self->_artworkContainerView;
  id v4 = a3;
  id v5 = [(VideosExtrasConstrainedArtworkContainerView *)artworkContainerView artworkView];
  [v5 setAccessibilityLabel:v4];
}

- (void)setAllowsPinchingThumbnailImageForInteractiveZoomingImageTransition:(BOOL)a3
{
  if (self->_allowsPinchingThumbnailImageForInteractiveZoomingImageTransition != a3)
  {
    self->_allowsPinchingThumbnailImageForInteractiveZoomingImageTransition = a3;
    if (a3)
    {
      id v4 = (UIPinchGestureRecognizer *)[objc_alloc(MEMORY[0x1E4FB1AA0]) initWithTarget:self action:sel__handlePinchGesture_];
      id v5 = [(VideosExtrasConstrainedArtworkContainerView *)self->_artworkContainerView artworkView];
      [v5 addGestureRecognizer:v4];

      pinchGestureRecognizer = self->_pinchGestureRecognizer;
      self->_pinchGestureRecognizer = v4;
      v12 = v4;

      double v7 = objc_alloc_init(VideosExtrasZoomingImageInteractiveTransitionSourceContext);
      [(VideosExtrasZoomingImageInteractiveTransitionSourceContext *)v7 setPinchGestureRecognizer:v12];
      [(VideosExtrasZoomingImageInteractiveTransitionSourceContext *)v7 setItemIndex:[(VideosExtrasLockupCollectionViewCell *)self itemIndex]];
      [(VideosExtrasZoomingImageInteractiveTransitionSourceContext *)v7 setSupportedZoomingImageTransitionDirections:3];
      [(VideosExtrasZoomingImageInteractiveTransitionSourceContext *)v7 setIdentifier:self->_zoomingImageTransitionIdentifier];
      interactiveTransitionSourceContext = self->_interactiveTransitionSourceContext;
      self->_interactiveTransitionSourceContext = v7;

      id v9 = (VideosExtrasZoomingImageInteractiveTransitionSourceContext *)v12;
    }
    else
    {
      id v10 = [(VideosExtrasConstrainedArtworkContainerView *)self->_artworkContainerView artworkView];
      [v10 removeGestureRecognizer:self->_pinchGestureRecognizer];

      [(UIPinchGestureRecognizer *)self->_pinchGestureRecognizer removeTarget:self action:0];
      v11 = self->_pinchGestureRecognizer;
      self->_pinchGestureRecognizer = 0;

      id v9 = self->_interactiveTransitionSourceContext;
      self->_interactiveTransitionSourceContext = 0;
    }
  }
}

- (void)_handlePinchGesture:(id)a3
{
  id v4 = self->_interactiveTransitionSourceContext;
  id v5 = [(VideosExtrasLockupCollectionViewCell *)self targetForAction:sel_handlePinchGestureForZoomingImageInteractiveTransitionWithContext_ withSender:v4];
  [v5 handlePinchGestureForZoomingImageInteractiveTransitionWithContext:v4];
}

- (void)setItemIndex:(unint64_t)a3
{
  self->_itemIndex = a3;
  -[VideosExtrasZoomingImageInteractiveTransitionSourceContext setItemIndex:](self->_interactiveTransitionSourceContext, "setItemIndex:");
}

- (unint64_t)itemIndex
{
  return self->_itemIndex;
}

- (id)thumbnailImage
{
  v2 = [(VideosExtrasConstrainedArtworkContainerView *)self->_artworkContainerView artworkView];
  v3 = [v2 image];

  return v3;
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

- (void)setThumbnailMaxSize:(CGSize)a3
{
  if (self->_artworkSize.width != a3.width || self->_artworkSize.height != a3.height)
  {
    self->_artworkSize = a3;
    [(VideosExtrasLockupCollectionViewCell *)self setNeedsUpdateConstraints];
  }
}

- (CGSize)thumbnailMaxSize
{
  double width = self->_artworkSize.width;
  double height = self->_artworkSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setThumbnailOverlayImage:(id)a3
{
  [(VideosExtrasConstrainedArtworkContainerView *)self->_artworkContainerView setOverlayImage:a3];
  artworkContainerView = self->_artworkContainerView;
  [(VideosExtrasConstrainedArtworkContainerView *)artworkContainerView setOverlayScale:0.2];
}

- (void)updateConstraints
{
  p_artworkSize = &self->_artworkSize;
  [(NSLayoutConstraint *)self->_artworkContainerWidthConstraint setConstant:self->_artworkSize.width];
  [(NSLayoutConstraint *)self->_artworkContainerHeightConstraint setConstant:p_artworkSize->height];
  id v4 = [(UILabel *)self->_titleLabel text];
  uint64_t v5 = [v4 length];

  if (v5)
  {
    titleLabel = self->_titleLabel;
    uint64_t v7 = 11;
  }
  else
  {
    uint64_t v7 = 3;
    titleLabel = self;
  }
  id v8 = titleLabel;
  subtitleBaselineConstraint = self->_subtitleBaselineConstraint;
  if (subtitleBaselineConstraint)
  {
    id v10 = [(NSLayoutConstraint *)subtitleBaselineConstraint secondItem];
    if (v10 == v8)
    {
      NSLayoutAttribute v11 = [(NSLayoutConstraint *)self->_subtitleBaselineConstraint secondAttribute];

      if (v11 == v7) {
        goto LABEL_9;
      }
    }
    else
    {
    }
    [(VideosExtrasLockupCollectionViewCell *)self removeConstraint:self->_subtitleBaselineConstraint];
    v12 = self->_subtitleBaselineConstraint;
    self->_subtitleBaselineConstraint = 0;

LABEL_9:
    if (self->_subtitleBaselineConstraint) {
      goto LABEL_11;
    }
  }
  uint64_t v13 = (void *)MEMORY[0x1E4F73A08];
  subtitleLabel = self->_subtitleLabel;
  uint64_t v15 = [(VideosExtrasLockupCollectionViewCell *)self subtitleTextStyle];
  v16 = [v13 constraintWithAutoupdatingBaselineOfView:subtitleLabel relation:0 toView:v8 attribute:v7 withTextStyle:v15 multiplier:1.0 nonStandardLeading:20.0];
  double v17 = self->_subtitleBaselineConstraint;
  self->_subtitleBaselineConstraint = v16;

LABEL_11:
  v18 = [(UILabel *)self->_subtitleLabel text];
  if ([v18 length]) {
    p_subtitleLabel = &self->_subtitleLabel;
  }
  else {
    p_subtitleLabel = &self->_titleLabel;
  }
  v20 = *p_subtitleLabel;

  double v21 = [(UILabel *)v20 text];
  uint64_t v22 = [v21 length];

  if (v22) {
    uint64_t v23 = (VideosExtrasLockupCollectionViewCell *)v20;
  }
  else {
    uint64_t v23 = self;
  }
  if (v22) {
    uint64_t v24 = 11;
  }
  else {
    uint64_t v24 = 3;
  }
  double v25 = v23;
  descriptionBaselineConstraint = self->_descriptionBaselineConstraint;
  if (!descriptionBaselineConstraint) {
    goto LABEL_26;
  }
  uint64_t v27 = [(NSLayoutConstraint *)descriptionBaselineConstraint secondItem];
  if (v27 == v25)
  {
    NSLayoutAttribute v28 = [(NSLayoutConstraint *)self->_descriptionBaselineConstraint secondAttribute];

    if (v28 == v24) {
      goto LABEL_25;
    }
  }
  else
  {
  }
  [(VideosExtrasLockupCollectionViewCell *)self removeConstraint:self->_descriptionBaselineConstraint];
  double v29 = self->_descriptionBaselineConstraint;
  self->_descriptionBaselineConstraint = 0;

LABEL_25:
  if (!self->_descriptionBaselineConstraint)
  {
LABEL_26:
    uint64_t v30 = (void *)MEMORY[0x1E4F73A08];
    descriptionLabel = self->_descriptionLabel;
    double v32 = [(VideosExtrasLockupCollectionViewCell *)self descriptionTextStyle];
    double v33 = [v30 constraintWithAutoupdatingBaselineOfView:descriptionLabel toView:v25 attribute:v24 withTextStyle:v32 nonStandardLeading:30.0];
    double v34 = self->_descriptionBaselineConstraint;
    self->_descriptionBaselineConstraint = v33;

    [(VideosExtrasLockupCollectionViewCell *)self addConstraint:self->_descriptionBaselineConstraint];
  }
  v35.receiver = self;
  v35.super_class = (Class)VideosExtrasLockupCollectionViewCell;
  [(VideosExtrasLockupCollectionViewCell *)&v35 updateConstraints];
}

- (void)setZoomingImageTransitionIdentifier:(id)a3
{
  if (self->_zoomingImageTransitionIdentifier != a3)
  {
    id v4 = (NSString *)[a3 copy];
    zoomingImageTransitionIdentifier = self->_zoomingImageTransitionIdentifier;
    self->_zoomingImageTransitionIdentifier = v4;

    interactiveTransitionSourceContext = self->_interactiveTransitionSourceContext;
    uint64_t v7 = self->_zoomingImageTransitionIdentifier;
    [(VideosExtrasZoomingImageInteractiveTransitionSourceContext *)interactiveTransitionSourceContext setIdentifier:v7];
  }
}

- (void)prepareZoomingImageTransitionWithContext:(id)a3
{
  id v7 = a3;
  if ([v7 appearState] == 1)
  {
    id v4 = [v7 zoomingImageView];
    uint64_t v5 = [(VideosExtrasConstrainedArtworkContainerView *)self->_artworkContainerView artworkView];
    [v4 replicateStateFromImageView:v5];
  }
  id v6 = [(VideosExtrasConstrainedArtworkContainerView *)self->_artworkContainerView artworkView];
  [v6 setHidden:1];
}

- (void)performZoomingImageTransitionWithContext:(id)a3
{
  id v6 = a3;
  if (![v6 appearState])
  {
    id v4 = [v6 zoomingImageView];
    uint64_t v5 = [(VideosExtrasConstrainedArtworkContainerView *)self->_artworkContainerView artworkView];
    [v4 replicateStateFromImageView:v5];
  }
}

- (void)finalizeZoomingImageTransitionWithContext:(id)a3 transitionFinished:(BOOL)a4
{
  id v4 = [(VideosExtrasConstrainedArtworkContainerView *)self->_artworkContainerView artworkView];
  [v4 setHidden:0];
}

- (void)setHighlighted:(BOOL)a3
{
  BOOL v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)VideosExtrasLockupCollectionViewCell;
  -[VideosExtrasLockupCollectionViewCell setHighlighted:](&v6, sel_setHighlighted_);
  uint64_t v5 = [(VideosExtrasConstrainedArtworkContainerView *)self->_artworkContainerView artworkView];
  [v5 setHighlighted:v3];
}

- (IKLockupElement)lockup
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_lockup);
  return (IKLockupElement *)WeakRetained;
}

- (void)setLockup:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_lockup);
  objc_storeStrong((id *)&self->_pinchGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_interactiveTransitionSourceContext, 0);
  objc_storeStrong((id *)&self->_zoomingImageTransitionIdentifier, 0);
  objc_storeStrong((id *)&self->_descriptionBaselineConstraint, 0);
  objc_storeStrong((id *)&self->_subtitleBaselineConstraint, 0);
  objc_storeStrong((id *)&self->_artworkContainerHeightConstraint, 0);
  objc_storeStrong((id *)&self->_artworkContainerWidthConstraint, 0);
  objc_storeStrong((id *)&self->_descriptionLabel, 0);
  objc_storeStrong((id *)&self->_subtitleLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_textContainerView, 0);
  objc_storeStrong((id *)&self->_artworkContainerView, 0);
}

@end