@interface ICImageAndMovieThumbnailView
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)movieDuration;
- (BOOL)forceSquareImageAspectRatio;
- (BOOL)hairlineWidthUnitIsInPoint;
- (BOOL)showAsMovie;
- (BOOL)showMovieDuration;
- (BOOL)usesSeparateLayerForHairlineEdge:(unint64_t)a3;
- (BOOL)usesSeparateLayersForHairlines;
- (CGRect)frameByApplyingHorizontalReductionTo:(CGRect)a3 edge:(unint64_t)a4;
- (CGRect)frameByApplyingVerticalReductionTo:(CGRect)a3 edge:(unint64_t)a4;
- (ICImageAndMovieThumbnailView)initWithCoder:(id)a3;
- (ICImageAndMovieThumbnailView)initWithFrame:(CGRect)a3;
- (ICImageAndMovieThumbnailView)initWithFrame:(CGRect)a3 showMovieDuration:(BOOL)a4;
- (ICLabel)movieDurationLabel;
- (NSLayoutConstraint)imageViewBottomLayoutConstraint;
- (NSLayoutConstraint)imageViewLeftLayoutConstraint;
- (NSLayoutConstraint)imageViewRightLayoutConstraint;
- (NSLayoutConstraint)imageViewTopLayoutConstraint;
- (NSMutableDictionary)hairlineColors;
- (NSMutableDictionary)hairlineLayers;
- (UIColor)borderColor;
- (UIImage)image;
- (UIImageView)imageView;
- (UIView)movieFooter;
- (double)backingScale;
- (double)cornerRadius;
- (double)hairlineWidthInPoint;
- (double)imageInset;
- (double)mininumScaleFactor;
- (double)pixelWidth;
- (id)hairlineLayerForEdge:(unint64_t)a3;
- (unint64_t)edgesToRemoveEndPoint;
- (unint64_t)edgesToRemoveStartPoint;
- (unint64_t)hairlineEdges;
- (unint64_t)imageScaling;
- (void)commonInit;
- (void)setBorderColor:(id)a3;
- (void)setBounds:(CGRect)a3;
- (void)setCornerRadius:(double)a3;
- (void)setEdgesToRemoveEndPoint:(unint64_t)a3;
- (void)setEdgesToRemoveStartPoint:(unint64_t)a3;
- (void)setForceSquareImageAspectRatio:(BOOL)a3;
- (void)setHairlineColor:(id)a3 forEdges:(unint64_t)a4;
- (void)setHairlineColors:(id)a3;
- (void)setHairlineEdges:(unint64_t)a3;
- (void)setHairlineLayers:(id)a3;
- (void)setHairlineWidthUnitIsInPoint:(BOOL)a3;
- (void)setImage:(id)a3;
- (void)setImageInset:(double)a3;
- (void)setImageScaling:(unint64_t)a3;
- (void)setImageView:(id)a3;
- (void)setImageViewBottomLayoutConstraint:(id)a3;
- (void)setImageViewLeftLayoutConstraint:(id)a3;
- (void)setImageViewRightLayoutConstraint:(id)a3;
- (void)setImageViewTopLayoutConstraint:(id)a3;
- (void)setMininumScaleFactor:(double)a3;
- (void)setMovieDuration:(id *)a3;
- (void)setMovieDurationLabel:(id)a3;
- (void)setMovieFooter:(id)a3;
- (void)setShowAsMovie:(BOOL)a3;
- (void)setShowMovieDuration:(BOOL)a3;
- (void)setupMovieFooter;
- (void)updateDurationLabel;
- (void)updateHairline;
- (void)updateHairlineFrames;
@end

@implementation ICImageAndMovieThumbnailView

- (ICImageAndMovieThumbnailView)initWithFrame:(CGRect)a3 showMovieDuration:(BOOL)a4
{
  v8.receiver = self;
  v8.super_class = (Class)ICImageAndMovieThumbnailView;
  v5 = -[ICImageAndMovieThumbnailView initWithFrame:](&v8, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v6 = v5;
  if (v5)
  {
    v5->_showMovieDuration = a4;
    [(ICImageAndMovieThumbnailView *)v5 commonInit];
  }
  return v6;
}

- (ICImageAndMovieThumbnailView)initWithFrame:(CGRect)a3
{
  return -[ICImageAndMovieThumbnailView initWithFrame:showMovieDuration:](self, "initWithFrame:showMovieDuration:", 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (ICImageAndMovieThumbnailView)initWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)ICImageAndMovieThumbnailView;
  v3 = [(ICImageAndMovieThumbnailView *)&v6 initWithCoder:a3];
  v4 = v3;
  if (v3)
  {
    v3->_showMovieDuration = 0;
    [(ICImageAndMovieThumbnailView *)v3 commonInit];
  }
  return v4;
}

- (void)commonInit
{
  v30[4] = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  [(ICImageAndMovieThumbnailView *)self setHairlineLayers:v3];

  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  [(ICImageAndMovieThumbnailView *)self setHairlineColors:v4];

  [(ICImageAndMovieThumbnailView *)self setMininumScaleFactor:1.0];
  [(ICImageAndMovieThumbnailView *)self setForceSquareImageAspectRatio:0];
  id v5 = objc_alloc(MEMORY[0x1E4FB1838]);
  [(ICImageAndMovieThumbnailView *)self frame];
  double v7 = v6;
  [(ICImageAndMovieThumbnailView *)self frame];
  objc_super v8 = objc_msgSend(v5, "initWithFrame:", 0.0, 0.0, v7);
  [(ICImageAndMovieThumbnailView *)self setImageView:v8];

  v9 = [(ICImageAndMovieThumbnailView *)self imageView];
  [v9 setClipsToBounds:1];

  v10 = [(ICImageAndMovieThumbnailView *)self imageView];
  [v10 setContentMode:2];

  v11 = [(ICImageAndMovieThumbnailView *)self imageView];
  [v11 setTranslatesAutoresizingMaskIntoConstraints:0];

  v12 = [(ICImageAndMovieThumbnailView *)self imageView];
  [(ICImageAndMovieThumbnailView *)self addSubview:v12];

  v13 = (void *)MEMORY[0x1E4F28DC8];
  v14 = [(ICImageAndMovieThumbnailView *)self imageView];
  v15 = [v13 constraintWithItem:v14 attribute:5 relatedBy:0 toItem:self attribute:5 multiplier:1.0 constant:0.0];
  [(ICImageAndMovieThumbnailView *)self setImageViewLeftLayoutConstraint:v15];

  v16 = (void *)MEMORY[0x1E4F28DC8];
  v17 = [(ICImageAndMovieThumbnailView *)self imageView];
  v18 = [v16 constraintWithItem:self attribute:6 relatedBy:0 toItem:v17 attribute:6 multiplier:1.0 constant:0.0];
  [(ICImageAndMovieThumbnailView *)self setImageViewRightLayoutConstraint:v18];

  v19 = (void *)MEMORY[0x1E4F28DC8];
  v20 = [(ICImageAndMovieThumbnailView *)self imageView];
  v21 = [v19 constraintWithItem:v20 attribute:3 relatedBy:0 toItem:self attribute:3 multiplier:1.0 constant:0.0];
  [(ICImageAndMovieThumbnailView *)self setImageViewTopLayoutConstraint:v21];

  v22 = (void *)MEMORY[0x1E4F28DC8];
  v23 = [(ICImageAndMovieThumbnailView *)self imageView];
  v24 = [v22 constraintWithItem:self attribute:4 relatedBy:0 toItem:v23 attribute:4 multiplier:1.0 constant:0.0];
  [(ICImageAndMovieThumbnailView *)self setImageViewBottomLayoutConstraint:v24];

  v25 = [(ICImageAndMovieThumbnailView *)self imageViewLeftLayoutConstraint];
  v30[0] = v25;
  v26 = [(ICImageAndMovieThumbnailView *)self imageViewRightLayoutConstraint];
  v30[1] = v26;
  v27 = [(ICImageAndMovieThumbnailView *)self imageViewTopLayoutConstraint];
  v30[2] = v27;
  v28 = [(ICImageAndMovieThumbnailView *)self imageViewBottomLayoutConstraint];
  v30[3] = v28;
  v29 = [MEMORY[0x1E4F1C978] arrayWithObjects:v30 count:4];

  [MEMORY[0x1E4F28DC8] activateConstraints:v29];
  if ([(ICImageAndMovieThumbnailView *)self showAsMovie]) {
    [(ICImageAndMovieThumbnailView *)self setupMovieFooter];
  }
}

- (void)setBounds:(CGRect)a3
{
  v4.receiver = self;
  v4.super_class = (Class)ICImageAndMovieThumbnailView;
  -[ICImageAndMovieThumbnailView setBounds:](&v4, sel_setBounds_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if ([(ICImageAndMovieThumbnailView *)self usesSeparateLayersForHairlines]) {
    [(ICImageAndMovieThumbnailView *)self updateHairlineFrames];
  }
}

- (void)setImage:(id)a3
{
  id v4 = a3;
  id v5 = [(ICImageAndMovieThumbnailView *)self imageView];
  [v5 setImage:v4];
}

- (UIImage)image
{
  v2 = [(ICImageAndMovieThumbnailView *)self imageView];
  id v3 = [v2 image];

  return (UIImage *)v3;
}

- (void)setImageScaling:(unint64_t)a3
{
  if (self->_imageScaling != a3)
  {
    self->_imageScaling = a3;
    if (a3 == 2)
    {
      id v3 = [(ICImageAndMovieThumbnailView *)self imageView];
      id v5 = v3;
      uint64_t v4 = 1;
    }
    else if (a3 == 1)
    {
      id v3 = [(ICImageAndMovieThumbnailView *)self imageView];
      id v5 = v3;
      uint64_t v4 = 2;
    }
    else
    {
      if (a3) {
        return;
      }
      id v3 = [(ICImageAndMovieThumbnailView *)self imageView];
      id v5 = v3;
      uint64_t v4 = 4;
    }
    [v3 setContentMode:v4];
  }
}

- (double)imageInset
{
  v2 = [(ICImageAndMovieThumbnailView *)self imageViewLeftLayoutConstraint];
  [v2 constant];
  double v4 = v3;

  return v4;
}

- (void)setImageInset:(double)a3
{
  id v5 = [(ICImageAndMovieThumbnailView *)self imageViewLeftLayoutConstraint];
  [v5 setConstant:a3];

  double v6 = [(ICImageAndMovieThumbnailView *)self imageViewRightLayoutConstraint];
  [v6 setConstant:a3];

  double v7 = [(ICImageAndMovieThumbnailView *)self imageViewTopLayoutConstraint];
  [v7 setConstant:a3];

  id v8 = [(ICImageAndMovieThumbnailView *)self imageViewBottomLayoutConstraint];
  [v8 setConstant:a3];
}

- (void)setupMovieFooter
{
  v75[1] = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc(MEMORY[0x1E4FB1EB0]);
  double v4 = *MEMORY[0x1E4F1DB28];
  double v5 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  double v6 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  double v7 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  id v8 = objc_msgSend(v3, "initWithFrame:", *MEMORY[0x1E4F1DB28], v5, v6, v7);
  [(ICImageAndMovieThumbnailView *)self setMovieFooter:v8];

  uint64_t v9 = [(ICImageAndMovieThumbnailView *)self showAsMovie] ^ 1;
  v10 = [(ICImageAndMovieThumbnailView *)self movieFooter];
  [v10 setHidden:v9];

  if ([(ICImageAndMovieThumbnailView *)self showMovieDuration])
  {
    v11 = -[ICLabel initWithFrame:]([ICLabel alloc], "initWithFrame:", v4, v5, v6, v7);
    [(ICImageAndMovieThumbnailView *)self setMovieDurationLabel:v11];

    v12 = [(ICImageAndMovieThumbnailView *)self movieDurationLabel];
    [v12 setString:@"0"];

    v13 = [(ICImageAndMovieThumbnailView *)self movieDurationLabel];
    [v13 setNumberOfLines:1];

    v14 = [MEMORY[0x1E4FB1618] whiteColor];
    v15 = [(ICImageAndMovieThumbnailView *)self movieDurationLabel];
    [v15 setTextColor:v14];

    if ([(UIView *)self ic_isRTL]) {
      uint64_t v16 = 0;
    }
    else {
      uint64_t v16 = 2;
    }
    v17 = [(ICImageAndMovieThumbnailView *)self movieDurationLabel];
    [v17 setTextAlignment:v16];

    v18 = [MEMORY[0x1E4FB08E0] systemFontOfSize:12.0];
    v19 = objc_msgSend(v18, "ic_fontWithSingleLineA");
    v20 = [(ICImageAndMovieThumbnailView *)self movieDurationLabel];
    [v20 setFont:v19];
  }
  v21 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1838]), "initWithFrame:", v4, v5, v6, v7);
  [v21 setTranslatesAutoresizingMaskIntoConstraints:0];
  v22 = [MEMORY[0x1E4FB1818] imageNamed:@"attachment_thumb_video_gradient"];
  [v21 setImage:v22];

  v23 = [(ICImageAndMovieThumbnailView *)self movieFooter];
  [v23 addSubview:v21];

  v24 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1838]), "initWithFrame:", v4, v5, v6, v7);
  v25 = [(ICImageAndMovieThumbnailView *)self movieFooter];
  [v25 setTranslatesAutoresizingMaskIntoConstraints:0];

  if ([(ICImageAndMovieThumbnailView *)self showMovieDuration])
  {
    v26 = [(ICImageAndMovieThumbnailView *)self movieDurationLabel];
    [v26 setTranslatesAutoresizingMaskIntoConstraints:0];
  }
  [v24 setTranslatesAutoresizingMaskIntoConstraints:0];
  LODWORD(v27) = 1144750080;
  [v24 setContentHuggingPriority:0 forAxis:v27];
  v28 = [(ICImageAndMovieThumbnailView *)self movieFooter];
  [v28 addSubview:v24];

  if ([(ICImageAndMovieThumbnailView *)self showMovieDuration])
  {
    v29 = [(ICImageAndMovieThumbnailView *)self movieFooter];
    v30 = [(ICImageAndMovieThumbnailView *)self movieDurationLabel];
    [v29 addSubview:v30];
  }
  v31 = [(ICImageAndMovieThumbnailView *)self movieFooter];
  [(ICImageAndMovieThumbnailView *)self addSubview:v31];

  v32 = [MEMORY[0x1E4FB1818] imageNamed:@"attachment_thumb_video_camera_icon"];
  [v24 setImage:v32];

  v33 = objc_opt_new();
  v34 = (void *)MEMORY[0x1E4F28DC8];
  v74 = @"movieFooter";
  v35 = [(ICImageAndMovieThumbnailView *)self movieFooter];
  v75[0] = v35;
  v36 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v75 forKeys:&v74 count:1];
  v37 = [v34 constraintsWithVisualFormat:@"|[movieFooter]|" options:0 metrics:0 views:v36];
  [v33 addObjectsFromArray:v37];

  v38 = (void *)MEMORY[0x1E4F28DC8];
  v72 = @"movieFooter";
  v39 = [(ICImageAndMovieThumbnailView *)self movieFooter];
  v73 = v39;
  v40 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v73 forKeys:&v72 count:1];
  v41 = [v38 constraintsWithVisualFormat:@"V:[movieFooter(18)]|" options:0 metrics:0 views:v40];
  [v33 addObjectsFromArray:v41];

  v42 = (void *)MEMORY[0x1E4F28DC8];
  v70 = @"movieFooterBackground";
  v71 = v21;
  v43 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v71 forKeys:&v70 count:1];
  v44 = [v42 constraintsWithVisualFormat:@"|[movieFooterBackground]|" options:0 metrics:0 views:v43];
  [v33 addObjectsFromArray:v44];

  v45 = (void *)MEMORY[0x1E4F28DC8];
  v68 = @"movieFooterBackground";
  v69 = v21;
  v46 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v69 forKeys:&v68 count:1];
  v47 = [v45 constraintsWithVisualFormat:@"V:|[movieFooterBackground]|" options:0 metrics:0 views:v46];
  [v33 addObjectsFromArray:v47];

  BOOL v48 = [(ICImageAndMovieThumbnailView *)self showMovieDuration];
  v49 = (void *)MEMORY[0x1E4F28DC8];
  if (v48)
  {
    v66[0] = @"cameraIcon";
    v66[1] = @"movieDurationLabel";
    v67[0] = v24;
    v50 = [(ICImageAndMovieThumbnailView *)self movieDurationLabel];
    v67[1] = v50;
    v51 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v67 forKeys:v66 count:2];
    v52 = [v49 constraintsWithVisualFormat:@"|-6-[cameraIcon]-1-[movieDurationLabel]-6-|" options:0 metrics:0 views:v51];
    [v33 addObjectsFromArray:v52];

    v53 = (void *)MEMORY[0x1E4F28DC8];
    v64 = @"movieDurationLabel";
    v54 = [(ICImageAndMovieThumbnailView *)self movieDurationLabel];
    v65 = v54;
    v55 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v65 forKeys:&v64 count:1];
    v56 = [v53 constraintsWithVisualFormat:@"V:|[movieDurationLabel]-1-|" options:0 metrics:0 views:v55];
    [v33 addObjectsFromArray:v56];
  }
  else
  {
    v62 = @"cameraIcon";
    v63 = v24;
    v54 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v63 forKeys:&v62 count:1];
    v55 = [v49 constraintsWithVisualFormat:@"|-6-[cameraIcon]" options:0 metrics:0 views:v54];
    [v33 addObjectsFromArray:v55];
  }

  v57 = (void *)MEMORY[0x1E4F28DC8];
  v60 = @"cameraIcon";
  v61 = v24;
  v58 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v61 forKeys:&v60 count:1];
  v59 = [v57 constraintsWithVisualFormat:@"V:[cameraIcon]|" options:0 metrics:0 views:v58];
  [v33 addObjectsFromArray:v59];

  [MEMORY[0x1E4F28DC8] activateConstraints:v33];
}

- (void)setShowAsMovie:(BOOL)a3
{
  if (self->_showAsMovie != a3)
  {
    self->_showAsMovie = a3;
    if (a3)
    {
      [(ICImageAndMovieThumbnailView *)self setupMovieFooter];
    }
    else
    {
      double v4 = [(ICImageAndMovieThumbnailView *)self movieFooter];
      [v4 removeFromSuperview];

      [(ICImageAndMovieThumbnailView *)self setMovieFooter:0];
    }
  }
}

- (void)setMovieDuration:(id *)a3
{
  if ([(ICImageAndMovieThumbnailView *)self showMovieDuration])
  {
    CMTime time1 = (CMTime)self->_movieDuration;
    $3CC8671D27C23BF42ADDB32F2B5E48AE v7 = *a3;
    if (CMTimeCompare(&time1, (CMTime *)&v7))
    {
      long long v5 = *(_OWORD *)&a3->var0;
      self->_movieDuration.epoch = a3->var3;
      *(_OWORD *)&self->_movieDuration.value = v5;
      [(ICImageAndMovieThumbnailView *)self updateDurationLabel];
    }
  }
  else
  {
    double v6 = os_log_create("com.apple.notes", "UI");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[ICImageAndMovieThumbnailView setMovieDuration:](v6);
    }
  }
}

- (void)setCornerRadius:(double)a3
{
  id v5 = [(ICImageAndMovieThumbnailView *)self imageView];
  double v4 = [v5 layer];
  [v4 setCornerRadius:a3];
}

- (double)cornerRadius
{
  v2 = [(ICImageAndMovieThumbnailView *)self imageView];
  id v3 = [v2 layer];
  [v3 cornerRadius];
  double v5 = v4;

  return v5;
}

- (void)setBorderColor:(id)a3
{
  double v5 = (UIColor *)a3;
  p_borderColor = &self->_borderColor;
  if (self->_borderColor != v5)
  {
    objc_storeStrong((id *)p_borderColor, a3);
    p_borderColor = (UIColor **)[(ICImageAndMovieThumbnailView *)self updateHairline];
  }
  MEMORY[0x1F41817F8](p_borderColor);
}

- (void)setHairlineColor:(id)a3 forEdges:(unint64_t)a4
{
  id v21 = a3;
  double v6 = [(ICImageAndMovieThumbnailView *)self hairlineColors];

  if (!v6) {
    [MEMORY[0x1E4F836F8] handleFailedAssertWithCondition:"self.hairlineColors" functionName:"-[ICImageAndMovieThumbnailView setHairlineColor:forEdges:]" simulateCrash:1 showAlert:0 format:@"hairlineColors not initialized"];
  }
  $3CC8671D27C23BF42ADDB32F2B5E48AE v7 = [(ICImageAndMovieThumbnailView *)self hairlineColors];

  if (!v7)
  {
    id v8 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    [(ICImageAndMovieThumbnailView *)self setHairlineColors:v8];
  }
  uint64_t v9 = 0;
  char v10 = 0;
  do
  {
    while (1)
    {
      uint64_t v11 = ICRectEdgeAtIndex();
      if ((v11 & a4) == 0) {
        break;
      }
      uint64_t v12 = v11;
      v13 = [(ICImageAndMovieThumbnailView *)self hairlineColors];
      v14 = [NSNumber numberWithUnsignedInteger:v12];
      v15 = [v13 objectForKeyedSubscript:v14];
      int v16 = [v15 isEqual:v21];

      if (v16) {
        break;
      }
      v17 = (void *)[v21 copy];
      v18 = [(ICImageAndMovieThumbnailView *)self hairlineColors];
      v19 = [NSNumber numberWithUnsignedInteger:v12];
      [v18 setObject:v17 forKeyedSubscript:v19];

      char v10 = 1;
      if (v9++ == 3) {
        goto LABEL_14;
      }
    }
    ++v9;
  }
  while (v9 != 4);
  if ((v10 & 1) == 0) {
    goto LABEL_15;
  }
LABEL_14:
  [(ICImageAndMovieThumbnailView *)self updateHairline];
LABEL_15:
}

- (void)setHairlineEdges:(unint64_t)a3
{
  if (self->_hairlineEdges != a3)
  {
    self->_hairlineEdges = a3;
    [(ICImageAndMovieThumbnailView *)self updateHairline];
  }
}

- (void)setEdgesToRemoveStartPoint:(unint64_t)a3
{
  if (self->_edgesToRemoveStartPoint != a3)
  {
    self->_edgesToRemoveStartPoint = a3;
    [(ICImageAndMovieThumbnailView *)self updateHairline];
  }
}

- (void)setEdgesToRemoveEndPoint:(unint64_t)a3
{
  if (self->_edgesToRemoveEndPoint != a3)
  {
    self->_edgesToRemoveEndPoint = a3;
    [(ICImageAndMovieThumbnailView *)self updateHairline];
  }
}

- (void)updateDurationLabel
{
  id v3 = +[ICMediaTimeFormatter timecodeFormatter];
  double v4 = [ICMediaTime alloc];
  [(ICImageAndMovieThumbnailView *)self movieDuration];
  double v5 = [(ICMediaTime *)v4 initWithCMTime:v8];
  double v6 = [v3 stringForObjectValue:v5];
  $3CC8671D27C23BF42ADDB32F2B5E48AE v7 = [(ICImageAndMovieThumbnailView *)self movieDurationLabel];
  [v7 setString:v6];
}

- (BOOL)usesSeparateLayersForHairlines
{
  if (![(ICImageAndMovieThumbnailView *)self hairlineEdges]) {
    return 0;
  }
  if ([(ICImageAndMovieThumbnailView *)self hairlineEdges] != 15) {
    return 1;
  }
  id v3 = [(ICImageAndMovieThumbnailView *)self hairlineColors];
  BOOL v4 = (unint64_t)[v3 count] > 1;

  return v4;
}

- (BOOL)usesSeparateLayerForHairlineEdge:(unint64_t)a3
{
  BOOL v5 = [(ICImageAndMovieThumbnailView *)self usesSeparateLayersForHairlines];
  if (v5) {
    LOBYTE(v5) = ([(ICImageAndMovieThumbnailView *)self hairlineEdges] & a3) != 0;
  }
  return v5;
}

- (id)hairlineLayerForEdge:(unint64_t)a3
{
  if (-[ICImageAndMovieThumbnailView usesSeparateLayerForHairlineEdge:](self, "usesSeparateLayerForHairlineEdge:"))
  {
    BOOL v5 = [(ICImageAndMovieThumbnailView *)self hairlineLayers];
    double v6 = [NSNumber numberWithUnsignedInteger:a3];
    $3CC8671D27C23BF42ADDB32F2B5E48AE v7 = [v5 objectForKeyedSubscript:v6];

    if (!v7) {
      objc_msgSend(MEMORY[0x1E4F836F8], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "layer", "-[ICImageAndMovieThumbnailView hairlineLayerForEdge:]", 1, 0, @"No layer found for edge %lu", a3);
    }
  }
  else
  {
    $3CC8671D27C23BF42ADDB32F2B5E48AE v7 = 0;
  }
  return v7;
}

- (void)updateHairline
{
  uint64_t v62 = *MEMORY[0x1E4F143B8];
  id v3 = [(ICImageAndMovieThumbnailView *)self borderColor];

  if (!v3)
  {
    if ([(ICImageAndMovieThumbnailView *)self hairlineEdges]
      && ([(ICImageAndMovieThumbnailView *)self hairlineColors],
          uint64_t v9 = objc_claimAutoreleasedReturnValue(),
          uint64_t v10 = [v9 count],
          v9,
          v10))
    {
      if (![(ICImageAndMovieThumbnailView *)self usesSeparateLayersForHairlines])
      {
        id v4 = [(ICImageAndMovieThumbnailView *)self hairlineColors];
        v47 = [v4 allValues];
        id v48 = [v47 firstObject];
        uint64_t v49 = [v48 CGColor];
        v50 = [(ICImageAndMovieThumbnailView *)self layer];
        [v50 setBorderColor:v49];

        goto LABEL_3;
      }
      uint64_t v11 = [(ICImageAndMovieThumbnailView *)self hairlineLayers];

      if (!v11) {
        [MEMORY[0x1E4F836F8] handleFailedAssertWithCondition:"self.hairlineLayers" functionName:"-[ICImageAndMovieThumbnailView updateHairline]" simulateCrash:1 showAlert:0 format:@"hairlineLayers not initialized"];
      }
      uint64_t v12 = [(ICImageAndMovieThumbnailView *)self hairlineLayers];

      if (!v12)
      {
        id v13 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
        [(ICImageAndMovieThumbnailView *)self setHairlineLayers:v13];
      }
      v14 = [(ICImageAndMovieThumbnailView *)self hairlineLayers];
      unint64_t v15 = [v14 count];

      if (v15 <= 3)
      {
        do
        {
          int v16 = [(ICImageAndMovieThumbnailView *)self hairlineLayers];
          [v16 count];

          uint64_t v17 = ICRectEdgeAtIndex();
          id v18 = objc_alloc_init(MEMORY[0x1E4F39BE8]);
          [v18 setZPosition:1.0];
          v19 = [(ICImageAndMovieThumbnailView *)self hairlineLayers];
          v20 = [NSNumber numberWithUnsignedInteger:v17];
          [v19 setObject:v18 forKeyedSubscript:v20];

          id v21 = [(ICImageAndMovieThumbnailView *)self layer];
          [v21 addSublayer:v18];

          v22 = [(ICImageAndMovieThumbnailView *)self hairlineLayers];
          unint64_t v23 = [v22 count];
        }
        while (v23 < 4);
      }
      long long v58 = 0u;
      long long v59 = 0u;
      long long v56 = 0u;
      long long v57 = 0u;
      v24 = [(ICImageAndMovieThumbnailView *)self hairlineLayers];
      uint64_t v25 = [v24 countByEnumeratingWithState:&v56 objects:v61 count:16];
      if (v25)
      {
        uint64_t v26 = v25;
        uint64_t v27 = *(void *)v57;
        do
        {
          for (uint64_t i = 0; i != v26; ++i)
          {
            if (*(void *)v57 != v27) {
              objc_enumerationMutation(v24);
            }
            v29 = *(void **)(*((void *)&v56 + 1) + 8 * i);
            objc_opt_class();
            v30 = [(ICImageAndMovieThumbnailView *)self hairlineLayers];
            v31 = [v30 objectForKeyedSubscript:v29];
            v32 = ICCheckedDynamicCast();

            v33 = [(ICImageAndMovieThumbnailView *)self hairlineColors];
            id v34 = [v33 objectForKeyedSubscript:v29];
            objc_msgSend(v32, "setBackgroundColor:", objc_msgSend(v34, "CGColor"));

            objc_msgSend(v32, "setHidden:", -[ICImageAndMovieThumbnailView usesSeparateLayerForHairlineEdge:](self, "usesSeparateLayerForHairlineEdge:", objc_msgSend(v29, "unsignedIntegerValue")) ^ 1);
          }
          uint64_t v26 = [v24 countByEnumeratingWithState:&v56 objects:v61 count:16];
        }
        while (v26);
      }

      [(ICImageAndMovieThumbnailView *)self updateHairlineFrames];
    }
    else
    {
      long long v54 = 0u;
      long long v55 = 0u;
      long long v52 = 0u;
      long long v53 = 0u;
      v35 = [(ICImageAndMovieThumbnailView *)self hairlineLayers];
      uint64_t v36 = [v35 countByEnumeratingWithState:&v52 objects:v60 count:16];
      if (v36)
      {
        uint64_t v37 = v36;
        uint64_t v38 = *(void *)v53;
        do
        {
          for (uint64_t j = 0; j != v37; ++j)
          {
            if (*(void *)v53 != v38) {
              objc_enumerationMutation(v35);
            }
            uint64_t v40 = *(void *)(*((void *)&v52 + 1) + 8 * j);
            objc_opt_class();
            v41 = [(ICImageAndMovieThumbnailView *)self hairlineLayers];
            v42 = [v41 objectForKeyedSubscript:v40];
            v43 = ICCheckedDynamicCast();

            [v43 removeFromSuperlayer];
          }
          uint64_t v37 = [v35 countByEnumeratingWithState:&v52 objects:v60 count:16];
        }
        while (v37);
      }

      v44 = [(ICImageAndMovieThumbnailView *)self hairlineLayers];
      [v44 removeAllObjects];
    }
    v45 = [(ICImageAndMovieThumbnailView *)self layer];
    [v45 setBorderColor:0];

    v46 = [(ICImageAndMovieThumbnailView *)self layer];
    [v46 setBorderWidth:0.0];

    return;
  }
  id v4 = [(ICImageAndMovieThumbnailView *)self borderColor];
  uint64_t v5 = [v4 CGColor];
  double v6 = [(ICImageAndMovieThumbnailView *)self layer];
  [v6 setBorderColor:v5];

LABEL_3:
  [(ICImageAndMovieThumbnailView *)self hairlineWidthInPoint];
  double v8 = v7;
  id v51 = [(ICImageAndMovieThumbnailView *)self layer];
  [v51 setBorderWidth:v8];
}

- (double)backingScale
{
  [(UIView *)self ic_backingScaleFactor];
  double v3 = v2;
  if (v2 <= 0.0) {
    objc_msgSend(MEMORY[0x1E4F836F8], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "scale > 0.0", "-[ICImageAndMovieThumbnailView backingScale]", 1, 0, @"Invalid scale %f", *(void *)&v2);
  }
  double result = 1.0;
  if (v3 > 0.0) {
    return v3;
  }
  return result;
}

- (double)hairlineWidthInPoint
{
  if ([(ICImageAndMovieThumbnailView *)self hairlineWidthUnitIsInPoint]) {
    return 1.0;
  }
  [(ICImageAndMovieThumbnailView *)self pixelWidth];
  return result;
}

- (void)setHairlineWidthUnitIsInPoint:(BOOL)a3
{
  if (self->_hairlineWidthUnitIsInPoint != a3)
  {
    self->_hairlineWidthUnitIsInPoint = a3;
    [(ICImageAndMovieThumbnailView *)self updateHairlineFrames];
  }
}

- (double)pixelWidth
{
  [(ICImageAndMovieThumbnailView *)self backingScale];
  return 1.0 / v2;
}

- (CGRect)frameByApplyingVerticalReductionTo:(CGRect)a3 edge:(unint64_t)a4
{
  double height = a3.size.height;
  CGFloat width = a3.size.width;
  double y = a3.origin.y;
  CGFloat x = a3.origin.x;
  if (([(ICImageAndMovieThumbnailView *)self edgesToRemoveStartPoint] & a4) != 0) {
    double height = height + -1.0;
  }
  unint64_t v10 = [(ICImageAndMovieThumbnailView *)self edgesToRemoveEndPoint];
  double v11 = y + 1.0;
  double v12 = height + -1.0;
  if ((v10 & a4) == 0)
  {
    double v12 = height;
    double v11 = y;
  }
  double v13 = fmax(v12, 1.0);
  double v14 = x;
  double v15 = width;
  result.size.double height = v13;
  result.size.CGFloat width = v15;
  result.origin.double y = v11;
  result.origin.CGFloat x = v14;
  return result;
}

- (CGRect)frameByApplyingHorizontalReductionTo:(CGRect)a3 edge:(unint64_t)a4
{
  CGFloat height = a3.size.height;
  double width = a3.size.width;
  CGFloat y = a3.origin.y;
  double x = a3.origin.x;
  unint64_t v10 = [(ICImageAndMovieThumbnailView *)self edgesToRemoveStartPoint];
  if ((v10 & a4) != 0) {
    double v11 = width + -1.0;
  }
  else {
    double v11 = width;
  }
  if ((v10 & a4) != 0) {
    double v12 = x + 1.0;
  }
  else {
    double v12 = x;
  }
  unint64_t v13 = [(ICImageAndMovieThumbnailView *)self edgesToRemoveEndPoint];
  double v14 = v11 + -1.0;
  if ((v13 & a4) == 0) {
    double v14 = v11;
  }
  double v15 = fmax(v14, 1.0);
  double v16 = v12;
  double v17 = y;
  double v18 = height;
  result.size.CGFloat height = v18;
  result.size.double width = v15;
  result.origin.CGFloat y = v17;
  result.origin.double x = v16;
  return result;
}

- (void)updateHairlineFrames
{
  double v3 = [(ICImageAndMovieThumbnailView *)self layer];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  id v27 = [(ICImageAndMovieThumbnailView *)self hairlineLayerForEdge:2];
  if (v27)
  {
    [(ICImageAndMovieThumbnailView *)self hairlineWidthInPoint];
    -[ICImageAndMovieThumbnailView frameByApplyingVerticalReductionTo:edge:](self, "frameByApplyingVerticalReductionTo:edge:", 2, v5, v7, v12, v11);
    objc_msgSend(v27, "setFrame:");
  }
  unint64_t v13 = [(ICImageAndMovieThumbnailView *)self hairlineLayerForEdge:8];
  if (v13)
  {
    [(ICImageAndMovieThumbnailView *)self hairlineWidthInPoint];
    double v15 = v14;
    v29.origin.double x = v5;
    v29.origin.CGFloat y = v7;
    v29.size.double width = v9;
    v29.size.CGFloat height = v11;
    double MaxX = CGRectGetMaxX(v29);
    [(ICImageAndMovieThumbnailView *)self hairlineWidthInPoint];
    -[ICImageAndMovieThumbnailView frameByApplyingVerticalReductionTo:edge:](self, "frameByApplyingVerticalReductionTo:edge:", 8, MaxX - v17, v7, v15, v11);
    objc_msgSend(v13, "setFrame:");
  }
  double v18 = [(ICImageAndMovieThumbnailView *)self hairlineLayerForEdge:1];
  if (v18)
  {
    [(ICImageAndMovieThumbnailView *)self hairlineWidthInPoint];
    double v20 = v19;
    v30.origin.double x = v5;
    v30.origin.CGFloat y = v7;
    v30.size.double width = v9;
    v30.size.CGFloat height = v11;
    double MaxY = CGRectGetMaxY(v30);
    [(ICImageAndMovieThumbnailView *)self hairlineWidthInPoint];
    double v23 = MaxY - v22;
    objc_msgSend(v18, "setFrame:", v5, v23, v9, v20);
    -[ICImageAndMovieThumbnailView frameByApplyingHorizontalReductionTo:edge:](self, "frameByApplyingHorizontalReductionTo:edge:", 1, v5, v23, v9, v20);
    objc_msgSend(v18, "setFrame:");
  }
  v24 = [(ICImageAndMovieThumbnailView *)self hairlineLayerForEdge:4];
  if (v24)
  {
    [(ICImageAndMovieThumbnailView *)self hairlineWidthInPoint];
    double v26 = v25;
    objc_msgSend(v24, "setFrame:", v5, v7, v9, v25);
    -[ICImageAndMovieThumbnailView frameByApplyingHorizontalReductionTo:edge:](self, "frameByApplyingHorizontalReductionTo:edge:", 4, v5, v7, v9, v26);
    objc_msgSend(v24, "setFrame:");
  }
}

- (unint64_t)imageScaling
{
  return self->_imageScaling;
}

- (BOOL)showAsMovie
{
  return self->_showAsMovie;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)movieDuration
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)((char *)self + 536);
  return self;
}

- (UIColor)borderColor
{
  return self->_borderColor;
}

- (BOOL)hairlineWidthUnitIsInPoint
{
  return self->_hairlineWidthUnitIsInPoint;
}

- (unint64_t)hairlineEdges
{
  return self->_hairlineEdges;
}

- (unint64_t)edgesToRemoveStartPoint
{
  return self->_edgesToRemoveStartPoint;
}

- (unint64_t)edgesToRemoveEndPoint
{
  return self->_edgesToRemoveEndPoint;
}

- (double)mininumScaleFactor
{
  return self->_mininumScaleFactor;
}

- (void)setMininumScaleFactor:(double)a3
{
  self->_mininumScaleFactor = a3;
}

- (BOOL)forceSquareImageAspectRatio
{
  return self->_forceSquareImageAspectRatio;
}

- (void)setForceSquareImageAspectRatio:(BOOL)a3
{
  self->_forceSquareImageAspectRatio = a3;
}

- (UIImageView)imageView
{
  return self->_imageView;
}

- (void)setImageView:(id)a3
{
}

- (NSLayoutConstraint)imageViewLeftLayoutConstraint
{
  return self->_imageViewLeftLayoutConstraint;
}

- (void)setImageViewLeftLayoutConstraint:(id)a3
{
}

- (NSLayoutConstraint)imageViewRightLayoutConstraint
{
  return self->_imageViewRightLayoutConstraint;
}

- (void)setImageViewRightLayoutConstraint:(id)a3
{
}

- (NSLayoutConstraint)imageViewBottomLayoutConstraint
{
  return self->_imageViewBottomLayoutConstraint;
}

- (void)setImageViewBottomLayoutConstraint:(id)a3
{
}

- (NSLayoutConstraint)imageViewTopLayoutConstraint
{
  return self->_imageViewTopLayoutConstraint;
}

- (void)setImageViewTopLayoutConstraint:(id)a3
{
}

- (UIView)movieFooter
{
  return self->_movieFooter;
}

- (void)setMovieFooter:(id)a3
{
}

- (ICLabel)movieDurationLabel
{
  return self->_movieDurationLabel;
}

- (void)setMovieDurationLabel:(id)a3
{
}

- (NSMutableDictionary)hairlineLayers
{
  return self->_hairlineLayers;
}

- (void)setHairlineLayers:(id)a3
{
}

- (NSMutableDictionary)hairlineColors
{
  return self->_hairlineColors;
}

- (void)setHairlineColors:(id)a3
{
}

- (BOOL)showMovieDuration
{
  return self->_showMovieDuration;
}

- (void)setShowMovieDuration:(BOOL)a3
{
  self->_showMovieDuration = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hairlineColors, 0);
  objc_storeStrong((id *)&self->_hairlineLayers, 0);
  objc_storeStrong((id *)&self->_movieDurationLabel, 0);
  objc_storeStrong((id *)&self->_movieFooter, 0);
  objc_storeStrong((id *)&self->_imageViewTopLayoutConstraint, 0);
  objc_storeStrong((id *)&self->_imageViewBottomLayoutConstraint, 0);
  objc_storeStrong((id *)&self->_imageViewRightLayoutConstraint, 0);
  objc_storeStrong((id *)&self->_imageViewLeftLayoutConstraint, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_borderColor, 0);
}

- (void)setMovieDuration:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1B08EB000, log, OS_LOG_TYPE_ERROR, "Movie duration set on thumbnail view when it is hidden", v1, 2u);
}

@end