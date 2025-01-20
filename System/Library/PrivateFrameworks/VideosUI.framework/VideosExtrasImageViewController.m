@interface VideosExtrasImageViewController
- (BOOL)allowsPinchingImageForInteractiveZoomingImageTransition;
- (BOOL)overlayHidden;
- (BOOL)prefersStatusBarHidden;
- (MPUContentSizeLayoutConstraint)bottomLabelConstraint;
- (MPUContentSizeLayoutConstraint)descriptionLeadingConstraint;
- (MPUContentSizeLayoutConstraint)subtitleLeadingConstraint;
- (MPUContentSizeLayoutConstraint)topLabelConstraint;
- (NSArray)gestureRecognizers;
- (NSAttributedString)descriptionString;
- (NSAttributedString)subtitleString;
- (NSAttributedString)titleString;
- (NSString)zoomingImageTransitionIdentifier;
- (UIActivityIndicatorView)activityIndicatorView;
- (UIImage)image;
- (UILabel)descriptionLabel;
- (UILabel)subtitleLabel;
- (UILabel)titleLabel;
- (UIView)textContainmentView;
- (VideosExtrasZoomableImageView)zoomableImageView;
- (VideosExtrasZoomingImageInteractiveTransitionSourceContext)interactiveTransitionSourceContext;
- (unint64_t)imageIndex;
- (void)_handleDoubleTap:(id)a3;
- (void)_handlePinch:(id)a3;
- (void)_handleSingleTap:(id)a3;
- (void)dealloc;
- (void)finalizeZoomingImageTransitionWithContext:(id)a3 transitionFinished:(BOOL)a4;
- (void)performZoomingImageTransitionWithContext:(id)a3;
- (void)prepareZoomingImageTransitionWithContext:(id)a3;
- (void)setActivityIndicatorView:(id)a3;
- (void)setAllowsPinchingImageForInteractiveZoomingImageTransition:(BOOL)a3;
- (void)setBottomLabelConstraint:(id)a3;
- (void)setDescriptionLabel:(id)a3;
- (void)setDescriptionLeadingConstraint:(id)a3;
- (void)setDescriptionString:(id)a3;
- (void)setGestureRecognizers:(id)a3;
- (void)setImage:(id)a3;
- (void)setImageIndex:(unint64_t)a3;
- (void)setInteractiveTransitionSourceContext:(id)a3;
- (void)setOverlayHidden:(BOOL)a3;
- (void)setSubtitleLabel:(id)a3;
- (void)setSubtitleLeadingConstraint:(id)a3;
- (void)setSubtitleString:(id)a3;
- (void)setTextContainmentView:(id)a3;
- (void)setTitleLabel:(id)a3;
- (void)setTitleString:(id)a3;
- (void)setTopLabelConstraint:(id)a3;
- (void)setZoomableImageView:(id)a3;
- (void)setZoomingImageTransitionIdentifier:(id)a3;
- (void)updateViewConstraints;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation VideosExtrasImageViewController

- (void)dealloc
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  v3 = [(VideosExtrasImageViewController *)self gestureRecognizers];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v9 + 1) + 8 * v7++) removeTarget:self action:0];
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }

  v8.receiver = self;
  v8.super_class = (Class)VideosExtrasImageViewController;
  [(VideosExtrasImageViewController *)&v8 dealloc];
}

- (BOOL)prefersStatusBarHidden
{
  v2 = [(VideosExtrasImageViewController *)self navigationController];
  char v3 = [v2 isNavigationBarHidden];

  return v3;
}

- (void)viewDidLoad
{
  v54.receiver = self;
  v54.super_class = (Class)VideosExtrasImageViewController;
  [(VideosExtrasImageViewController *)&v54 viewDidLoad];
  char v3 = [(VideosExtrasImageViewController *)self view];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  long long v12 = objc_alloc_init(VideosExtrasZoomableImageView);
  -[VideosExtrasZoomableImageView setFrame:](v12, "setFrame:", v5, v7, v9, v11);
  [(VideosExtrasZoomableImageView *)v12 setAutoresizingMask:18];
  v13 = v3;
  [v3 addSubview:v12];
  id v14 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v15 = (void *)[objc_alloc(MEMORY[0x1E4FB1D38]) initWithTarget:self action:sel__handleDoubleTap_];
  [v15 setNumberOfTapsRequired:2];
  [(VideosExtrasZoomableImageView *)v12 addGestureRecognizer:v15];
  [v14 addObject:v15];
  v16 = (void *)[objc_alloc(MEMORY[0x1E4FB1D38]) initWithTarget:self action:sel__handleSingleTap_];
  v50 = v15;
  [v16 requireGestureRecognizerToFail:v15];
  [(VideosExtrasZoomableImageView *)v12 addGestureRecognizer:v16];
  v49 = v16;
  [v14 addObject:v16];
  if ([(VideosExtrasImageViewController *)self allowsPinchingImageForInteractiveZoomingImageTransition])
  {
    v17 = [(VideosExtrasZoomableImageView *)v12 pinchGestureRecognizer];
    [v17 addTarget:self action:sel__handlePinch_];
    [v14 addObject:v17];
  }
  [(VideosExtrasImageViewController *)self setGestureRecognizers:v14];
  v48 = (void *)[objc_alloc(MEMORY[0x1E4FB1400]) initWithActivityIndicatorStyle:100];
  [v48 sizeToFit];
  v55.origin.x = v5;
  v55.origin.y = v7;
  v55.size.width = v9;
  v55.size.height = v11;
  double MidX = CGRectGetMidX(v55);
  v56.origin.x = v5;
  v56.origin.y = v7;
  v56.size.width = v9;
  v56.size.height = v11;
  objc_msgSend(v48, "setCenter:", MidX, CGRectGetMidY(v56));
  [v48 setAutoresizingMask:45];
  [v13 addSubview:v48];
  [v48 startAnimating];
  [(VideosExtrasImageViewController *)self setActivityIndicatorView:v48];
  v46 = v12;
  [(VideosExtrasImageViewController *)self setZoomableImageView:v12];
  v19 = (void *)[objc_alloc(MEMORY[0x1E4FB1EB0]) initForAutolayout];
  [v13 addSubview:v19];
  v20 = (void *)[objc_alloc(MEMORY[0x1E4FB1930]) initForAutolayout];
  objc_msgSend(v20, "MPU_setAutomaticallyUpdatesTextStyleFontsToPreferredTextStyleFonts:", 1);
  [v20 setNumberOfLines:0];
  LODWORD(v21) = 1148846080;
  [v20 setContentCompressionResistancePriority:1 forAxis:v21];
  [v19 addSubview:v20];
  v22 = (void *)[objc_alloc(MEMORY[0x1E4FB1930]) initForAutolayout];
  objc_msgSend(v22, "MPU_setAutomaticallyUpdatesTextStyleFontsToPreferredTextStyleFonts:", 1);
  [v22 setNumberOfLines:0];
  LODWORD(v23) = 1148829696;
  [v22 setContentCompressionResistancePriority:1 forAxis:v23];
  [v19 addSubview:v22];
  v47 = v14;
  v24 = (void *)[objc_alloc(MEMORY[0x1E4FB1930]) initForAutolayout];
  objc_msgSend(v24, "MPU_setAutomaticallyUpdatesTextStyleFontsToPreferredTextStyleFonts:", 1);
  [v24 setNumberOfLines:0];
  LODWORD(v25) = 1148813312;
  [v24 setContentCompressionResistancePriority:1 forAxis:v25];
  [v19 addSubview:v24];
  double v26 = *MEMORY[0x1E4FB2848];
  double v27 = *(double *)(MEMORY[0x1E4FB2848] + 8);
  double v28 = *(double *)(MEMORY[0x1E4FB2848] + 16);
  double v29 = *(double *)(MEMORY[0x1E4FB2848] + 24);
  v53 = objc_msgSend(MEMORY[0x1E4F28DC8], "constraintsByAttachingView:toView:alongEdges:insets:", v20, v19, 10, *MEMORY[0x1E4FB2848], v27, v28, v29);
  v45 = v20;
  v52 = [MEMORY[0x1E4F28DC8] constraintWithItem:v20 attribute:3 relatedBy:1 toItem:v19 attribute:3 multiplier:1.0 constant:0.0];
  v51 = [MEMORY[0x1E4F28DC8] constraintWithItem:v20 attribute:11 relatedBy:-1 toItem:v19 attribute:4 multiplier:1.0 constant:0.0];
  v43 = objc_msgSend(MEMORY[0x1E4F28DC8], "constraintsByAttachingView:toView:alongEdges:insets:", v22, v19, 10, v26, v27, v28, v29);
  v44 = v22;
  v42 = [MEMORY[0x1E4F28DC8] constraintWithItem:v22 attribute:3 relatedBy:1 toItem:v19 attribute:3 multiplier:1.0 constant:0.0];
  v41 = [MEMORY[0x1E4F28DC8] constraintWithItem:v22 attribute:11 relatedBy:-1 toItem:v19 attribute:4 multiplier:1.0 constant:0.0];
  v40 = objc_msgSend(MEMORY[0x1E4F28DC8], "constraintsByAttachingView:toView:alongEdges:insets:", v24, v19, 10, v26, v27, v28, v29);
  v39 = [MEMORY[0x1E4F28DC8] constraintWithItem:v24 attribute:3 relatedBy:1 toItem:v19 attribute:3 multiplier:1.0 constant:0.0];
  uint64_t v30 = [MEMORY[0x1E4F28DC8] constraintWithItem:v24 attribute:11 relatedBy:-1 toItem:v19 attribute:4 multiplier:1.0 constant:0.0];
  [v19 addConstraints:v53];
  [v19 addConstraint:v52];
  [v19 addConstraint:v51];
  [v19 addConstraints:v43];
  [v19 addConstraint:v42];
  [v19 addConstraint:v41];
  [v19 addConstraints:v40];
  [v19 addConstraint:v39];
  v31 = (void *)v30;
  [v19 addConstraint:v30];
  v32 = v13;
  v33 = [MEMORY[0x1E4F28DC8] constraintWithItem:v19 attribute:9 relatedBy:0 toItem:v13 attribute:9 multiplier:1.0 constant:0.0];
  v34 = [MEMORY[0x1E4F28DC8] constraintWithItem:v19 attribute:7 relatedBy:0 toItem:v13 attribute:7 multiplier:0.75 constant:0.0];
  v35 = (void *)MEMORY[0x1E4F28DC8];
  v36 = [(VideosExtrasImageViewController *)self view];
  v37 = [v36 safeAreaLayoutGuide];
  v38 = [v35 constraintWithItem:v19 attribute:4 relatedBy:0 toItem:v37 attribute:4 multiplier:1.0 constant:-20.0];

  [v32 addConstraint:v33];
  [v32 addConstraint:v34];
  [v32 addConstraint:v38];
  [(VideosExtrasImageViewController *)self setTextContainmentView:v19];
  [(VideosExtrasImageViewController *)self setTitleLabel:v45];
  [(VideosExtrasImageViewController *)self setSubtitleLabel:v44];
  [(VideosExtrasImageViewController *)self setDescriptionLabel:v24];
}

- (void)updateViewConstraints
{
  char v3 = [(VideosExtrasImageViewController *)self view];
  double v4 = [(VideosExtrasImageViewController *)self titleLabel];
  double v5 = [(VideosExtrasImageViewController *)self subtitleLabel];
  double v6 = [(VideosExtrasImageViewController *)self descriptionLabel];
  double v7 = [v4 attributedText];
  if ([v7 length]) {
    goto LABEL_4;
  }
  double v8 = [v5 attributedText];
  if ([v8 length])
  {

LABEL_4:
    goto LABEL_5;
  }
  v51 = [v6 attributedText];
  uint64_t v52 = [v51 length];

  if (v52)
  {
LABEL_5:
    double v9 = [v6 attributedText];
    uint64_t v10 = [v9 length];

    double v11 = (id *)MEMORY[0x1E4FB28D8];
    long long v12 = v6;
    if (!v10)
    {
      v13 = [v5 attributedText];
      uint64_t v14 = [v13 length];

      if (v14) {
        long long v12 = v5;
      }
      else {
        long long v12 = v4;
      }
      if (v14) {
        double v11 = (id *)MEMORY[0x1E4FB28D0];
      }
      else {
        double v11 = (id *)MEMORY[0x1E4FB28C8];
      }
    }
    id v15 = v12;
    id v16 = *v11;
    uint64_t v17 = [(VideosExtrasImageViewController *)self bottomLabelConstraint];
    if (v17)
    {
      v18 = (void *)v17;
      id v19 = v16;
      v20 = [(VideosExtrasImageViewController *)self bottomLabelConstraint];
      id v21 = [v20 firstItem];
      if (v21 == v15)
      {
        [(VideosExtrasImageViewController *)self bottomLabelConstraint];
        v64 = v5;
        v22 = v4;
        double v23 = v3;
        id v24 = v15;
        v26 = double v25 = v6;
        double v27 = [v26 textStyle];
        char v63 = [v27 isEqualToString:v19];

        double v6 = v25;
        id v15 = v24;
        char v3 = v23;
        double v4 = v22;
        double v5 = v64;

        id v16 = v19;
        if (v63) {
          goto LABEL_17;
        }
      }
      else
      {

        id v16 = v19;
      }
      double v28 = [(VideosExtrasImageViewController *)self bottomLabelConstraint];
      [v3 removeConstraint:v28];

      [(VideosExtrasImageViewController *)self setBottomLabelConstraint:0];
    }
LABEL_17:
    double v29 = [(VideosExtrasImageViewController *)self bottomLabelConstraint];

    if (!v29)
    {
      uint64_t v30 = (void *)MEMORY[0x1E4F73A08];
      v31 = [(VideosExtrasImageViewController *)self textContainmentView];
      v32 = [v30 contentSizeAutoupdatingConstraintWithItem:v15 attribute:11 relatedBy:0 toItem:v31 attribute:4 multiplier:v16 textStyle:1.0 defaultSizeConstant:-10.0];
      [(VideosExtrasImageViewController *)self setBottomLabelConstraint:v32];

      v33 = [(VideosExtrasImageViewController *)self bottomLabelConstraint];
      [v3 addConstraint:v33];
    }
    v34 = [v4 attributedText];
    if ([v34 length])
    {
      v35 = [v5 attributedText];
      uint64_t v36 = [v35 length];

      if (v36)
      {
LABEL_24:
        v38 = [(VideosExtrasImageViewController *)self subtitleLeadingConstraint];
        if (!v38)
        {
          v38 = [v4 attributedText];
          if ([v38 length])
          {
            v48 = [v5 attributedText];
            uint64_t v49 = [v48 length];

            if (!v49) {
              goto LABEL_26;
            }
            v50 = [MEMORY[0x1E4F73A08] constraintWithAutoupdatingBaselineOfView:v5 toView:v4 attribute:11 withTextStyle:*MEMORY[0x1E4FB28D0] nonStandardLeading:25.0];
            [(VideosExtrasImageViewController *)self setSubtitleLeadingConstraint:v50];

            v38 = [(VideosExtrasImageViewController *)self subtitleLeadingConstraint];
            [v3 addConstraint:v38];
          }
        }

LABEL_26:
        v39 = [v5 attributedText];
        uint64_t v40 = [v39 length];

        v41 = v5;
        if (v40
          || ([v4 attributedText],
              v42 = objc_claimAutoreleasedReturnValue(),
              uint64_t v43 = [v42 length],
              v42,
              v41 = v4,
              v43))
        {
          id v44 = v41;
          if (v44)
          {
            v45 = [(VideosExtrasImageViewController *)self descriptionLeadingConstraint];
            id v46 = [v45 secondItem];

            if (v46 == v44) {
              goto LABEL_44;
            }
            char v47 = 0;
LABEL_43:
            v59 = [(VideosExtrasImageViewController *)self descriptionLeadingConstraint];
            [v3 removeConstraint:v59];

            [(VideosExtrasImageViewController *)self setDescriptionLeadingConstraint:0];
            if (v47)
            {
LABEL_46:

              goto LABEL_47;
            }
LABEL_44:
            v60 = [(VideosExtrasImageViewController *)self descriptionLeadingConstraint];

            if (!v60)
            {
              v61 = [MEMORY[0x1E4F73A08] constraintWithAutoupdatingBaselineOfView:v6 toView:v44 attribute:11 withTextStyle:*MEMORY[0x1E4FB28D8] nonStandardLeading:30.0];
              [(VideosExtrasImageViewController *)self setDescriptionLeadingConstraint:v61];

              v62 = [(VideosExtrasImageViewController *)self descriptionLeadingConstraint];
              [v3 addConstraint:v62];
            }
            goto LABEL_46;
          }
        }
        else
        {
          id v44 = 0;
        }
        char v47 = 1;
        goto LABEL_43;
      }
    }
    else
    {
    }
    v37 = [(VideosExtrasImageViewController *)self subtitleLeadingConstraint];
    [v3 removeConstraint:v37];

    [(VideosExtrasImageViewController *)self setSubtitleLeadingConstraint:0];
    goto LABEL_24;
  }
  v53 = [(VideosExtrasImageViewController *)self bottomLabelConstraint];

  if (v53)
  {
    objc_super v54 = [(VideosExtrasImageViewController *)self bottomLabelConstraint];
    [v3 removeConstraint:v54];

    [(VideosExtrasImageViewController *)self setBottomLabelConstraint:0];
  }
  CGRect v55 = [(VideosExtrasImageViewController *)self subtitleLeadingConstraint];

  if (v55)
  {
    CGRect v56 = [(VideosExtrasImageViewController *)self subtitleLeadingConstraint];
    [v3 removeConstraint:v56];

    [(VideosExtrasImageViewController *)self setSubtitleLeadingConstraint:0];
  }
  v57 = [(VideosExtrasImageViewController *)self descriptionLeadingConstraint];

  if (v57)
  {
    v58 = [(VideosExtrasImageViewController *)self descriptionLeadingConstraint];
    [v3 removeConstraint:v58];

    [(VideosExtrasImageViewController *)self setDescriptionLeadingConstraint:0];
  }
LABEL_47:
  v65.receiver = self;
  v65.super_class = (Class)VideosExtrasImageViewController;
  [(VideosExtrasImageViewController *)&v65 updateViewConstraints];
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)VideosExtrasImageViewController;
  [(VideosExtrasImageViewController *)&v4 viewWillAppear:a3];
  [(VideosExtrasImageViewController *)self setOverlayHidden:1];
}

- (void)viewDidAppear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)VideosExtrasImageViewController;
  [(VideosExtrasImageViewController *)&v6 viewDidAppear:a3];
  objc_super v4 = [(VideosExtrasImageViewController *)self view];
  double v5 = [(VideosExtrasImageViewController *)self titleLabel];
  [v4 bringSubviewToFront:v5];
}

- (void)prepareZoomingImageTransitionWithContext:(id)a3
{
  id v4 = a3;
  double v5 = [(VideosExtrasImageViewController *)self zoomableImageView];
  [v5 prepareZoomingImageTransitionWithContext:v4];

  uint64_t v6 = [v4 appearState];
  if (v6 == 1)
  {
    [(VideosExtrasImageViewController *)self setOverlayHidden:0];
  }
}

- (void)performZoomingImageTransitionWithContext:(id)a3
{
  id v4 = a3;
  id v5 = [(VideosExtrasImageViewController *)self zoomableImageView];
  [v5 performZoomingImageTransitionWithContext:v4];
}

- (void)finalizeZoomingImageTransitionWithContext:(id)a3 transitionFinished:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = [(VideosExtrasImageViewController *)self zoomableImageView];
  [v7 finalizeZoomingImageTransitionWithContext:v6 transitionFinished:v4];
}

- (UIImage)image
{
  v2 = [(VideosExtrasImageViewController *)self zoomableImageView];
  char v3 = [v2 image];

  return (UIImage *)v3;
}

- (void)setImage:(id)a3
{
  id v8 = a3;
  if (([(VideosExtrasImageViewController *)self isViewLoaded] & 1) == 0) {
    id v4 = (id)[(VideosExtrasImageViewController *)self view];
  }
  id v5 = [(VideosExtrasImageViewController *)self zoomableImageView];
  id v6 = [v5 image];

  if (v6 != v8)
  {
    [v5 setImage:v8];
    id v7 = [(VideosExtrasImageViewController *)self activityIndicatorView];
    if ((((v8 != 0) ^ [v7 isAnimating]) & 1) == 0)
    {
      if (v8) {
        [v7 stopAnimating];
      }
      else {
        [v7 startAnimating];
      }
    }
  }
}

- (void)setTitleString:(id)a3
{
  id v6 = a3;
  if (([(VideosExtrasImageViewController *)self isViewLoaded] & 1) == 0) {
    id v4 = (id)[(VideosExtrasImageViewController *)self view];
  }
  [(UILabel *)self->_titleLabel setAttributedText:v6];
  id v5 = [(VideosExtrasImageViewController *)self view];
  [v5 setNeedsUpdateConstraints];
}

- (NSAttributedString)titleString
{
  return [(UILabel *)self->_titleLabel attributedText];
}

- (void)setSubtitleString:(id)a3
{
  id v6 = a3;
  if (([(VideosExtrasImageViewController *)self isViewLoaded] & 1) == 0) {
    id v4 = (id)[(VideosExtrasImageViewController *)self view];
  }
  [(UILabel *)self->_subtitleLabel setAttributedText:v6];
  id v5 = [(VideosExtrasImageViewController *)self view];
  [v5 setNeedsUpdateConstraints];
}

- (NSAttributedString)subtitleString
{
  return [(UILabel *)self->_subtitleLabel attributedText];
}

- (void)setDescriptionString:(id)a3
{
  id v6 = a3;
  if (([(VideosExtrasImageViewController *)self isViewLoaded] & 1) == 0) {
    id v4 = (id)[(VideosExtrasImageViewController *)self view];
  }
  [(UILabel *)self->_descriptionLabel setAttributedText:v6];
  id v5 = [(VideosExtrasImageViewController *)self view];
  [v5 setNeedsUpdateConstraints];
}

- (NSAttributedString)descriptionString
{
  return [(UILabel *)self->_descriptionLabel attributedText];
}

- (void)setImageIndex:(unint64_t)a3
{
  self->_imageIndex = a3;
  id v4 = [(VideosExtrasImageViewController *)self interactiveTransitionSourceContext];
  [v4 setItemIndex:a3];
}

- (void)setAllowsPinchingImageForInteractiveZoomingImageTransition:(BOOL)a3
{
  if (self->_allowsPinchingImageForInteractiveZoomingImageTransition != a3)
  {
    BOOL v3 = a3;
    self->_allowsPinchingImageForInteractiveZoomingImageTransition = a3;
    id v5 = [(VideosExtrasImageViewController *)self zoomableImageView];
    id v9 = [v5 pinchGestureRecognizer];

    if (v9)
    {
      if (v3)
      {
        [v9 addTarget:self action:sel__handlePinch_];
        id v6 = [(VideosExtrasImageViewController *)self gestureRecognizers];
        id v7 = [v6 arrayByAddingObject:v9];
        [(VideosExtrasImageViewController *)self setGestureRecognizers:v7];
      }
      else
      {
        [v9 removeTarget:self action:0];
        id v8 = [(VideosExtrasImageViewController *)self gestureRecognizers];
        id v6 = (void *)[v8 mutableCopy];

        [v6 removeObject:v9];
        [(VideosExtrasImageViewController *)self setGestureRecognizers:v6];
      }
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

    id v7 = [(VideosExtrasImageViewController *)self interactiveTransitionSourceContext];
    [v7 setIdentifier:v4];
  }
}

- (void)_handleDoubleTap:(id)a3
{
  id v8 = a3;
  if ([v8 state] == 3)
  {
    id v4 = [(VideosExtrasImageViewController *)self zoomableImageView];
    [v4 zoomScale];
    double v6 = v5;
    [v4 minimumZoomScale];
    if (v6 >= v7 + 0.00000011920929)
    {
      objc_msgSend(v4, "setZoomScale:animated:", 1);
    }
    else
    {
      [v8 locationInView:v4];
      objc_msgSend(v4, "zoomToPoint:animated:", 1);
    }
  }
}

- (void)_handlePinch:(id)a3
{
  id v7 = a3;
  id v4 = [(VideosExtrasImageViewController *)self interactiveTransitionSourceContext];
  if (!v4)
  {
    id v4 = objc_alloc_init(VideosExtrasZoomingImageInteractiveTransitionSourceContext);
    [(VideosExtrasZoomingImageInteractiveTransitionSourceContext *)v4 setItemIndex:[(VideosExtrasImageViewController *)self imageIndex]];
    [(VideosExtrasZoomingImageInteractiveTransitionSourceContext *)v4 setPinchGestureRecognizer:v7];
    [(VideosExtrasZoomingImageInteractiveTransitionSourceContext *)v4 setSupportedZoomingImageTransitionDirections:2];
    double v5 = [(VideosExtrasImageViewController *)self zoomingImageTransitionIdentifier];
    [(VideosExtrasZoomingImageInteractiveTransitionSourceContext *)v4 setIdentifier:v5];

    [(VideosExtrasImageViewController *)self setInteractiveTransitionSourceContext:v4];
  }
  double v6 = [(VideosExtrasImageViewController *)self targetForAction:sel_handlePinchGestureForZoomingImageInteractiveTransitionWithContext_ withSender:v4];
  [v6 handlePinchGestureForZoomingImageInteractiveTransitionWithContext:v4];
}

- (void)_handleSingleTap:(id)a3
{
  if ([a3 state] == 3)
  {
    uint64_t v4 = [(VideosExtrasImageViewController *)self overlayHidden] ^ 1;
    [(VideosExtrasImageViewController *)self setOverlayHidden:v4];
  }
}

- (void)setOverlayHidden:(BOOL)a3
{
  BOOL v3 = a3;
  self->_overlayHidden = a3;
  double v5 = [(VideosExtrasImageViewController *)self navigationController];
  [v5 _setNavigationBarHidden:v3 edge:15 duration:0.3];

  textContainmentView = self->_textContainmentView;
  [(UIView *)textContainmentView setHidden:v3];
}

- (unint64_t)imageIndex
{
  return self->_imageIndex;
}

- (BOOL)allowsPinchingImageForInteractiveZoomingImageTransition
{
  return self->_allowsPinchingImageForInteractiveZoomingImageTransition;
}

- (NSString)zoomingImageTransitionIdentifier
{
  return self->_zoomingImageTransitionIdentifier;
}

- (UIActivityIndicatorView)activityIndicatorView
{
  return self->_activityIndicatorView;
}

- (void)setActivityIndicatorView:(id)a3
{
}

- (VideosExtrasZoomableImageView)zoomableImageView
{
  return self->_zoomableImageView;
}

- (void)setZoomableImageView:(id)a3
{
}

- (NSArray)gestureRecognizers
{
  return self->_gestureRecognizers;
}

- (void)setGestureRecognizers:(id)a3
{
}

- (VideosExtrasZoomingImageInteractiveTransitionSourceContext)interactiveTransitionSourceContext
{
  return self->_interactiveTransitionSourceContext;
}

- (void)setInteractiveTransitionSourceContext:(id)a3
{
}

- (UIView)textContainmentView
{
  return self->_textContainmentView;
}

- (void)setTextContainmentView:(id)a3
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

- (MPUContentSizeLayoutConstraint)topLabelConstraint
{
  return self->_topLabelConstraint;
}

- (void)setTopLabelConstraint:(id)a3
{
}

- (MPUContentSizeLayoutConstraint)subtitleLeadingConstraint
{
  return self->_subtitleLeadingConstraint;
}

- (void)setSubtitleLeadingConstraint:(id)a3
{
}

- (MPUContentSizeLayoutConstraint)descriptionLeadingConstraint
{
  return self->_descriptionLeadingConstraint;
}

- (void)setDescriptionLeadingConstraint:(id)a3
{
}

- (MPUContentSizeLayoutConstraint)bottomLabelConstraint
{
  return self->_bottomLabelConstraint;
}

- (void)setBottomLabelConstraint:(id)a3
{
}

- (BOOL)overlayHidden
{
  return self->_overlayHidden;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bottomLabelConstraint, 0);
  objc_storeStrong((id *)&self->_descriptionLeadingConstraint, 0);
  objc_storeStrong((id *)&self->_subtitleLeadingConstraint, 0);
  objc_storeStrong((id *)&self->_topLabelConstraint, 0);
  objc_storeStrong((id *)&self->_descriptionLabel, 0);
  objc_storeStrong((id *)&self->_subtitleLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_textContainmentView, 0);
  objc_storeStrong((id *)&self->_interactiveTransitionSourceContext, 0);
  objc_storeStrong((id *)&self->_gestureRecognizers, 0);
  objc_storeStrong((id *)&self->_zoomableImageView, 0);
  objc_storeStrong((id *)&self->_activityIndicatorView, 0);
  objc_storeStrong((id *)&self->_zoomingImageTransitionIdentifier, 0);
}

@end