@interface TraceControlView
- (BOOL)_isSpanningTwoLines;
- (BOOL)_shouldSpanTwoLines;
- (BOOL)isLogging;
- (BOOL)isPlaying;
- (BOOL)useDistanceAsPosition;
- (NSDateComponentsFormatter)timePositionFormatter;
- (TraceControlView)initWithFrame:(CGRect)a3;
- (TraceControlViewDelegate)delegate;
- (UIButton)bookmarksButton;
- (UIButton)ffButton;
- (UIButton)frButton;
- (UIButton)jumpBackButton;
- (UIButton)playButton;
- (UIButton)viewCameraSnapshotsButton;
- (double)playSpeed;
- (unint64_t)_currentPlaySpeedIndex;
- (void)_bookmarksButtonPressed:(id)a3;
- (void)_ffButtonPressed:(id)a3;
- (void)_frButtonPressed:(id)a3;
- (void)_jumpBackButtonPressed:(id)a3;
- (void)_playButtonPressed:(id)a3;
- (void)_saveCameraSnapshotButtonPressed:(id)a3;
- (void)_testLoggingButtonPressed:(id)a3;
- (void)_viewCameraSnapshotsButtonPressed:(id)a3;
- (void)layoutSubviews;
- (void)setDelegate:(id)a3;
- (void)setIsLogging:(BOOL)a3;
- (void)setIsPlaying:(BOOL)a3;
- (void)setPlaySpeed:(double)a3;
- (void)setPosition:(double)a3;
- (void)setUseDistanceAsPosition:(BOOL)a3;
@end

@implementation TraceControlView

- (TraceControlView)initWithFrame:(CGRect)a3
{
  v83.receiver = self;
  v83.super_class = (Class)TraceControlView;
  v3 = -[TraceControlView initWithFrame:](&v83, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = +[UIColor clearColor];
    [(TraceControlView *)v3 setBackgroundColor:v4];

    v3->_playSpeed = 1.0;
    id v5 = objc_alloc((Class)UIStackView);
    [(TraceControlView *)v3 bounds];
    v6 = [v5 initWithFrame:];
    firstLineStack = v3->_firstLineStack;
    v3->_firstLineStack = v6;

    [(UIStackView *)v3->_firstLineStack setAxis:0];
    [(UIStackView *)v3->_firstLineStack setDistribution:4];
    [(UIStackView *)v3->_firstLineStack setAlignment:3];
    [(UIStackView *)v3->_firstLineStack setSpacing:0.0];
    [(UIStackView *)v3->_firstLineStack setTranslatesAutoresizingMaskIntoConstraints:0];
    [(TraceControlView *)v3 addSubview:v3->_firstLineStack];
    uint64_t v8 = +[UIButton buttonWithType:1];
    viewCameraSnapshotsButton = v3->_viewCameraSnapshotsButton;
    v3->_viewCameraSnapshotsButton = (UIButton *)v8;

    [(UIButton *)v3->_viewCameraSnapshotsButton setTranslatesAutoresizingMaskIntoConstraints:0];
    v10 = v3->_viewCameraSnapshotsButton;
    v11 = +[UIImage imageNamed:@"navigation-view-snapshots"];
    v12 = [v11 imageWithRenderingMode:2];
    [(UIButton *)v10 setImage:v12 forState:0];

    [(UIButton *)v3->_viewCameraSnapshotsButton addTarget:v3 action:"_viewCameraSnapshotsButtonPressed:" forControlEvents:64];
    v13 = +[UIColor whiteColor];
    [(UIButton *)v3->_viewCameraSnapshotsButton setTintColor:v13];

    [(UIStackView *)v3->_firstLineStack addArrangedSubview:v3->_viewCameraSnapshotsButton];
    uint64_t v14 = +[UIButton buttonWithType:1];
    saveCameraSnapshotButton = v3->_saveCameraSnapshotButton;
    v3->_saveCameraSnapshotButton = (UIButton *)v14;

    [(UIButton *)v3->_saveCameraSnapshotButton setTranslatesAutoresizingMaskIntoConstraints:0];
    v16 = v3->_saveCameraSnapshotButton;
    v17 = +[UIImage imageNamed:@"navigation-save-snapshot"];
    v18 = [v17 imageWithRenderingMode:2];
    [(UIButton *)v16 setImage:v18 forState:0];

    [(UIButton *)v3->_saveCameraSnapshotButton addTarget:v3 action:"_saveCameraSnapshotButtonPressed:" forControlEvents:64];
    v19 = +[UIColor whiteColor];
    [(UIButton *)v3->_saveCameraSnapshotButton setTintColor:v19];

    LODWORD(v20) = 1140129792;
    [(UIButton *)v3->_saveCameraSnapshotButton setContentCompressionResistancePriority:0 forAxis:v20];
    [(UIStackView *)v3->_firstLineStack addArrangedSubview:v3->_saveCameraSnapshotButton];
    uint64_t v21 = +[UIButton buttonWithType:0];
    jumpBackButton = v3->_jumpBackButton;
    v3->_jumpBackButton = (UIButton *)v21;

    [(UIButton *)v3->_jumpBackButton setTranslatesAutoresizingMaskIntoConstraints:0];
    v23 = v3->_jumpBackButton;
    v24 = +[UIImage imageNamed:@"MN-skipback.png"];
    [(UIButton *)v23 setImage:v24 forState:0];

    [(UIButton *)v3->_jumpBackButton addTarget:v3 action:"_jumpBackButtonPressed:" forControlEvents:64];
    LODWORD(v25) = 1140785152;
    [(UIButton *)v3->_jumpBackButton setContentCompressionResistancePriority:0 forAxis:v25];
    [(UIStackView *)v3->_firstLineStack addArrangedSubview:v3->_jumpBackButton];
    uint64_t v26 = +[UIButton buttonWithType:0];
    frButton = v3->_frButton;
    v3->_frButton = (UIButton *)v26;

    [(UIButton *)v3->_frButton setTranslatesAutoresizingMaskIntoConstraints:0];
    id v28 = +[UIImage imageNamed:@"MN-fastforward.png"];
    v82 = +[UIImage imageWithCGImage:scale:orientation:](UIImage, "imageWithCGImage:scale:orientation:", [v28 CGImage], 4, 1.0);

    [(UIButton *)v3->_frButton setImage:v82 forState:0];
    v29 = [(UIButton *)v3->_frButton titleLabel];
    [v29 setTextAlignment:4];

    v30 = +[UIFont boldSystemFontOfSize:10.0];
    v31 = [(UIButton *)v3->_frButton titleLabel];
    [v31 setFont:v30];

    v32 = +[UIColor whiteColor];
    v33 = [(UIButton *)v3->_frButton titleLabel];
    [v33 setTextColor:v32];

    [(UIButton *)v3->_frButton addTarget:v3 action:"_frButtonPressed:" forControlEvents:64];
    LODWORD(v34) = 1135509504;
    [(UIButton *)v3->_frButton setContentCompressionResistancePriority:0 forAxis:v34];
    [(UIStackView *)v3->_firstLineStack addArrangedSubview:v3->_frButton];
    uint64_t v35 = +[UIButton buttonWithType:0];
    playButton = v3->_playButton;
    v3->_playButton = (UIButton *)v35;

    [(UIButton *)v3->_playButton setTranslatesAutoresizingMaskIntoConstraints:0];
    v37 = v3->_playButton;
    v38 = +[UIImage imageNamed:@"MN-pause.png"];
    [(UIButton *)v37 setImage:v38 forState:0];

    [(UIButton *)v3->_playButton addTarget:v3 action:"_playButtonPressed:" forControlEvents:64];
    LODWORD(v39) = 1144766464;
    [(UIButton *)v3->_playButton setContentCompressionResistancePriority:0 forAxis:v39];
    [(UIStackView *)v3->_firstLineStack addArrangedSubview:v3->_playButton];
    uint64_t v40 = +[UIButton buttonWithType:0];
    ffButton = v3->_ffButton;
    v3->_ffButton = (UIButton *)v40;

    [(UIButton *)v3->_ffButton setTranslatesAutoresizingMaskIntoConstraints:0];
    v42 = v3->_ffButton;
    v43 = +[UIImage imageNamed:@"MN-fastforward.png"];
    [(UIButton *)v42 setImage:v43 forState:0];

    [(UIButton *)v3->_ffButton setTitle:@" " forState:0];
    v44 = +[UIFont boldSystemFontOfSize:10.0];
    v45 = [(UIButton *)v3->_ffButton titleLabel];
    [v45 setFont:v44];

    v46 = +[UIColor whiteColor];
    v47 = [(UIButton *)v3->_ffButton titleLabel];
    [v47 setTextColor:v46];

    [(UIButton *)v3->_ffButton addTarget:v3 action:"_ffButtonPressed:" forControlEvents:64];
    LODWORD(v48) = 1135575040;
    [(UIButton *)v3->_ffButton setContentCompressionResistancePriority:0 forAxis:v48];
    [(UIStackView *)v3->_firstLineStack addArrangedSubview:v3->_ffButton];
    v3->_useDistanceAsPosition = 0;
    v49 = (UILabel *)objc_alloc_init((Class)UILabel);
    positionLabel = v3->_positionLabel;
    v3->_positionLabel = v49;

    [(UILabel *)v3->_positionLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    v51 = +[UIFont boldSystemFontOfSize:13.0];
    [(UILabel *)v3->_positionLabel setFont:v51];

    v52 = +[UIColor whiteColor];
    [(UILabel *)v3->_positionLabel setTextColor:v52];

    [(UILabel *)v3->_positionLabel setText:0];
    LODWORD(v53) = 1132134400;
    [(UILabel *)v3->_positionLabel setContentCompressionResistancePriority:0 forAxis:v53];
    [(UIStackView *)v3->_firstLineStack addArrangedSubview:v3->_positionLabel];
    uint64_t v54 = +[UIButton buttonWithType:0];
    bookmarksButton = v3->_bookmarksButton;
    v3->_bookmarksButton = (UIButton *)v54;

    [(UIButton *)v3->_bookmarksButton setTranslatesAutoresizingMaskIntoConstraints:0];
    v56 = v3->_bookmarksButton;
    v57 = +[UIImage imageNamed:@"MN-Bookmark.png"];
    [(UIButton *)v56 setImage:v57 forState:0];

    [(UIButton *)v3->_bookmarksButton addTarget:v3 action:"_bookmarksButtonPressed:" forControlEvents:64];
    LODWORD(v58) = 1132593152;
    [(UIButton *)v3->_bookmarksButton setContentCompressionResistancePriority:0 forAxis:v58];
    [(UIStackView *)v3->_firstLineStack addArrangedSubview:v3->_bookmarksButton];
    v59 = [(UIStackView *)v3->_firstLineStack arrangedSubviews];
    v3->_numberOfControls = (unint64_t)[v59 count];

    id v60 = objc_alloc_init((Class)NSMutableArray);
    v61 = [(UIStackView *)v3->_firstLineStack centerXAnchor];
    v62 = [(TraceControlView *)v3 centerXAnchor];
    v63 = [v61 constraintEqualToAnchor:v62];
    [v60 addObject:v63];

    v64 = [(UIStackView *)v3->_firstLineStack widthAnchor];
    v65 = [v64 constraintLessThanOrEqualToConstant:(double)v3->_numberOfControls * 88.0];
    [v60 addObject:v65];

    v66 = [(UIStackView *)v3->_firstLineStack leadingAnchor];
    v67 = [(TraceControlView *)v3 leadingAnchor];
    v68 = [v66 constraintEqualToAnchor:v67 constant:12.0];

    LODWORD(v69) = 1148829696;
    [v68 setPriority:v69];
    [v60 addObject:v68];
    v70 = [(TraceControlView *)v3 trailingAnchor];
    v71 = [(UIStackView *)v3->_firstLineStack trailingAnchor];
    v72 = [v70 constraintEqualToAnchor:v71 constant:12.0];

    LODWORD(v73) = 1148829696;
    [v72 setPriority:v73];
    [v60 addObject:v72];
    v74 = [(UIStackView *)v3->_firstLineStack topAnchor];
    v75 = [(TraceControlView *)v3 topAnchor];
    v76 = [v74 constraintEqualToAnchor:v75];
    [v60 addObject:v76];

    v77 = [(UIStackView *)v3->_firstLineStack bottomAnchor];
    v78 = [(TraceControlView *)v3 bottomAnchor];
    uint64_t v79 = [v77 constraintEqualToAnchor:v78];
    firstLineBottomToBottomConstraint = v3->_firstLineBottomToBottomConstraint;
    v3->_firstLineBottomToBottomConstraint = (NSLayoutConstraint *)v79;

    [v60 addObject:v3->_firstLineBottomToBottomConstraint];
    +[NSLayoutConstraint activateConstraints:v60];
  }
  return v3;
}

- (void)layoutSubviews
{
  v47.receiver = self;
  v47.super_class = (Class)TraceControlView;
  [(TraceControlView *)&v47 layoutSubviews];
  unsigned int v3 = [(TraceControlView *)self _shouldSpanTwoLines];
  if (v3 != [(TraceControlView *)self _isSpanningTwoLines])
  {
    if (v3)
    {
      v4 = [(UIStackView *)self->_secondLineStack superview];

      if (!v4)
      {
        id v5 = [objc_alloc((Class)UIStackView) initWithFrame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height];
        secondLineStack = self->_secondLineStack;
        self->_secondLineStack = v5;

        [(UIStackView *)self->_secondLineStack setAxis:0];
        [(UIStackView *)self->_secondLineStack setDistribution:4];
        [(UIStackView *)self->_secondLineStack setAlignment:3];
        [(UIStackView *)self->_secondLineStack setSpacing:0.0];
        [(UIStackView *)self->_secondLineStack setTranslatesAutoresizingMaskIntoConstraints:0];
        [(UIStackView *)self->_secondLineStack setHidden:1];
        [(TraceControlView *)self addSubview:self->_secondLineStack];
        id v7 = objc_alloc_init((Class)NSMutableArray);
        uint64_t v8 = [(UIStackView *)self->_secondLineStack leadingAnchor];
        v9 = [(UIStackView *)self->_firstLineStack leadingAnchor];
        v10 = [v8 constraintEqualToAnchor:v9];
        [v7 addObject:v10];

        v11 = [(UIStackView *)self->_secondLineStack trailingAnchor];
        v12 = [(UIStackView *)self->_firstLineStack trailingAnchor];
        v13 = [v11 constraintEqualToAnchor:v12];
        [v7 addObject:v13];

        uint64_t v14 = [(UIStackView *)self->_secondLineStack topAnchor];
        v15 = [(UIStackView *)self->_firstLineStack bottomAnchor];
        v16 = [v14 constraintEqualToAnchor:v15 constant:8.0];
        [v7 addObject:v16];

        +[NSLayoutConstraint activateConstraints:v7];
        v17 = [(UIStackView *)self->_secondLineStack bottomAnchor];
        v18 = [(TraceControlView *)self bottomAnchor];
        v19 = [v17 constraintEqualToAnchor:v18];
        secondLineBottomToBottomConstraint = self->_secondLineBottomToBottomConstraint;
        self->_secondLineBottomToBottomConstraint = v19;
      }
      id v21 = objc_alloc_init((Class)NSMutableArray);
      v22 = v21;
      if (self->_viewCameraSnapshotsButton) {
        [v21 addObject:];
      }
      if (self->_saveCameraSnapshotButton) {
        [v22 addObject:];
      }
      if (self->_jumpBackButton) {
        [v22 addObject:];
      }
      if (self->_testLoggingButton) {
        [v22 addObject:];
      }
      if (self->_positionLabel) {
        [v22 addObject:];
      }
      if (self->_bookmarksButton) {
        [v22 addObject:];
      }
      long long v45 = 0u;
      long long v46 = 0u;
      long long v43 = 0u;
      long long v44 = 0u;
      id v23 = v22;
      id v24 = [v23 countByEnumeratingWithState:&v43 objects:v49 count:16];
      if (v24)
      {
        id v25 = v24;
        uint64_t v26 = *(void *)v44;
        do
        {
          for (i = 0; i != v25; i = (char *)i + 1)
          {
            if (*(void *)v44 != v26) {
              objc_enumerationMutation(v23);
            }
            id v28 = *(void **)(*((void *)&v43 + 1) + 8 * i);
            [v28 removeFromSuperview];
            [(UIStackView *)self->_secondLineStack addArrangedSubview:v28];
          }
          id v25 = [v23 countByEnumeratingWithState:&v43 objects:v49 count:16];
        }
        while (v25);
      }

      [(NSLayoutConstraint *)self->_firstLineBottomToBottomConstraint setActive:0];
      [(NSLayoutConstraint *)self->_secondLineBottomToBottomConstraint setActive:1];
    }
    else
    {
      id v29 = objc_alloc_init((Class)NSMutableArray);
      id v30 = objc_alloc_init((Class)NSMutableArray);
      if (self->_viewCameraSnapshotsButton) {
        [v29 addObject:];
      }
      if (self->_saveCameraSnapshotButton) {
        [v29 addObject:];
      }
      if (self->_jumpBackButton) {
        [v29 addObject:];
      }
      if (self->_testLoggingButton) {
        [v30 addObject:];
      }
      if (self->_positionLabel) {
        [v30 addObject:];
      }
      if (self->_bookmarksButton) {
        [v30 addObject:];
      }
      v42[0] = _NSConcreteStackBlock;
      v42[1] = 3221225472;
      v42[2] = sub_1004DCE94;
      v42[3] = &unk_1012ECE70;
      v42[4] = self;
      [v29 enumerateObjectsUsingBlock:v42];
      long long v40 = 0u;
      long long v41 = 0u;
      long long v38 = 0u;
      long long v39 = 0u;
      id v31 = v30;
      id v32 = [v31 countByEnumeratingWithState:&v38 objects:v48 count:16];
      if (v32)
      {
        id v33 = v32;
        uint64_t v34 = *(void *)v39;
        do
        {
          for (j = 0; j != v33; j = (char *)j + 1)
          {
            if (*(void *)v39 != v34) {
              objc_enumerationMutation(v31);
            }
            v36 = *(void **)(*((void *)&v38 + 1) + 8 * (void)j);
            [v36 removeFromSuperview];
            [(UIStackView *)self->_firstLineStack addArrangedSubview:v36];
          }
          id v33 = [v31 countByEnumeratingWithState:&v38 objects:v48 count:16];
        }
        while (v33);
      }

      [(NSLayoutConstraint *)self->_secondLineBottomToBottomConstraint setActive:0];
      [(NSLayoutConstraint *)self->_firstLineBottomToBottomConstraint setActive:1];
    }
    [(UIStackView *)self->_secondLineStack setHidden:v3 ^ 1];
    v37.receiver = self;
    v37.super_class = (Class)TraceControlView;
    [(TraceControlView *)&v37 layoutSubviews];
  }
}

- (BOOL)_shouldSpanTwoLines
{
  [(TraceControlView *)self bounds];
  return v3 < (double)self->_numberOfControls * 44.0;
}

- (BOOL)_isSpanningTwoLines
{
  double v3 = [(UIStackView *)self->_secondLineStack superview];
  if (v3) {
    unsigned int v4 = [(UIStackView *)self->_secondLineStack isHidden] ^ 1;
  }
  else {
    LOBYTE(v4) = 0;
  }

  return v4;
}

- (void)_jumpBackButtonPressed:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained traceControlViewJumpedBack:self];
}

- (void)_playButtonPressed:(id)a3
{
  [(TraceControlView *)self setIsPlaying:!self->_isPlaying];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained traceControlView:self setPlaying:self->_isPlaying];
}

- (void)setIsPlaying:(BOOL)a3
{
  self->_isPlaying = a3;
  if (a3) {
    CFStringRef v4 = @"MN-pause.png";
  }
  else {
    CFStringRef v4 = @"MN-play.png";
  }
  id v5 = +[UIImage imageNamed:v4];
  [(UIButton *)self->_playButton setImage:v5 forState:0];
}

- (void)setUseDistanceAsPosition:(BOOL)a3
{
  self->_useDistanceAsPosition = a3;
  [(TraceControlView *)self setPosition:0.0];
}

- (unint64_t)_currentPlaySpeedIndex
{
  for (unint64_t i = 0; i != 11; ++i)
  {
    if (self->_playSpeed <= dbl_100F6F8B0[i]) {
      break;
    }
  }
  if (i >= 0xA) {
    return 10;
  }
  else {
    return i;
  }
}

- (void)_frButtonPressed:(id)a3
{
  unint64_t v4 = [(TraceControlView *)self _currentPlaySpeedIndex];
  unint64_t v5 = v4 - 1;
  if (!v4) {
    unint64_t v5 = 0;
  }
  double v6 = dbl_100F6F8B0[v5];
  if (v6 != self->_playSpeed)
  {
    [(TraceControlView *)self setPlaySpeed:v6];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained traceControlView:self setPlaySpeed:v6];
  }
}

- (void)_ffButtonPressed:(id)a3
{
  unint64_t v4 = [(TraceControlView *)self _currentPlaySpeedIndex];
  uint64_t v5 = 10;
  if (v4 + 1 < 0xA) {
    uint64_t v5 = v4 + 1;
  }
  double v6 = dbl_100F6F8B0[v5];
  if (v6 != self->_playSpeed)
  {
    [(TraceControlView *)self setPlaySpeed:v6];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained traceControlView:self setPlaySpeed:v6];
  }
}

- (void)_bookmarksButtonPressed:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained traceControlViewPressedBookmarksButton:self];
}

- (void)_saveCameraSnapshotButtonPressed:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained traceControlViewPressedSaveCameraSnapshotButton:self];
}

- (void)_viewCameraSnapshotsButtonPressed:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained traceControlViewPressedViewCameraSnapshotsButton:self];
}

- (void)setPlaySpeed:(double)a3
{
  self->_playSpeed = a3;
  if (a3 == 1.0)
  {
    CFStringRef v4 = @"     ";
  }
  else
  {
    if (vabdd_f64(a3, (double)(int)(a3 + 0.05)) >= 0.1) {
      +[NSString stringWithFormat:@"%.1fx", *(void *)&a3];
    }
    else {
    CFStringRef v4 = +[NSString stringWithFormat:@"%dx", (int)(a3 + 0.05)];
    }
  }
  uint64_t v5 = (__CFString *)v4;
  [(UIButton *)self->_ffButton setTitle:v4 forState:0];
}

- (void)setPosition:(double)a3
{
  if (self->_useDistanceAsPosition)
  {
    distancePositionFormatter = self->_distancePositionFormatter;
    if (!distancePositionFormatter)
    {
      double v6 = (NSNumberFormatter *)objc_alloc_init((Class)NSNumberFormatter);
      id v7 = self->_distancePositionFormatter;
      self->_distancePositionFormatter = v6;

      [(NSNumberFormatter *)self->_distancePositionFormatter setFormatterBehavior:1];
      [(NSNumberFormatter *)self->_distancePositionFormatter setNumberStyle:1];
      [(NSNumberFormatter *)self->_distancePositionFormatter setMaximumFractionDigits:0];
      distancePositionFormatter = self->_distancePositionFormatter;
    }
    id v13 = +[NSNumber numberWithDouble:a3];
    uint64_t v8 = -[NSNumberFormatter stringFromNumber:](distancePositionFormatter, "stringFromNumber:");
    v9 = +[NSString stringWithFormat:@"%@m", v8];
    [(UILabel *)self->_positionLabel setText:v9];
  }
  else
  {
    double v10 = floor(a3);
    if (v10 == self->_lastPositionInLabel) {
      return;
    }
    self->_lastPositionInLabel = v10;
    if (v10 >= 3600.0) {
      uint64_t v11 = 224;
    }
    else {
      uint64_t v11 = 192;
    }
    v12 = [(TraceControlView *)self timePositionFormatter];
    [v12 setAllowedUnits:v11];

    id v13 = [(TraceControlView *)self timePositionFormatter];
    uint64_t v8 = [v13 stringFromTimeInterval:v10];
    [(UILabel *)self->_positionLabel setText:v8];
  }
}

- (NSDateComponentsFormatter)timePositionFormatter
{
  timePositionFormatter = self->_timePositionFormatter;
  if (!timePositionFormatter)
  {
    CFStringRef v4 = (NSDateComponentsFormatter *)objc_alloc_init((Class)NSDateComponentsFormatter);
    uint64_t v5 = self->_timePositionFormatter;
    self->_timePositionFormatter = v4;

    [(NSDateComponentsFormatter *)self->_timePositionFormatter setZeroFormattingBehavior:0];
    [(NSDateComponentsFormatter *)self->_timePositionFormatter setUnitsStyle:0];
    timePositionFormatter = self->_timePositionFormatter;
  }

  return timePositionFormatter;
}

- (void)_testLoggingButtonPressed:(id)a3
{
  [(TraceControlView *)self setIsLogging:!self->_isLogging];
  unsigned int v4 = [(TraceControlView *)self isLogging];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  id v6 = WeakRetained;
  if (v4) {
    [WeakRetained traceControlViewPressedStartLoggingButton:self];
  }
  else {
    [WeakRetained traceControlViewPressedEndLoggingButton:self];
  }
}

- (TraceControlViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (TraceControlViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)isPlaying
{
  return self->_isPlaying;
}

- (double)playSpeed
{
  return self->_playSpeed;
}

- (UIButton)jumpBackButton
{
  return self->_jumpBackButton;
}

- (UIButton)playButton
{
  return self->_playButton;
}

- (UIButton)ffButton
{
  return self->_ffButton;
}

- (UIButton)frButton
{
  return self->_frButton;
}

- (UIButton)bookmarksButton
{
  return self->_bookmarksButton;
}

- (BOOL)useDistanceAsPosition
{
  return self->_useDistanceAsPosition;
}

- (BOOL)isLogging
{
  return self->_isLogging;
}

- (void)setIsLogging:(BOOL)a3
{
  self->_isLogging = a3;
}

- (UIButton)viewCameraSnapshotsButton
{
  return self->_viewCameraSnapshotsButton;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewCameraSnapshotsButton, 0);
  objc_storeStrong((id *)&self->_jumpBackButton, 0);
  objc_storeStrong((id *)&self->_distancePositionFormatter, 0);
  objc_storeStrong((id *)&self->_timePositionFormatter, 0);
  objc_storeStrong((id *)&self->_secondLineBottomToBottomConstraint, 0);
  objc_storeStrong((id *)&self->_firstLineBottomToBottomConstraint, 0);
  objc_storeStrong((id *)&self->_secondLineStack, 0);
  objc_storeStrong((id *)&self->_firstLineStack, 0);
  objc_storeStrong((id *)&self->_positionLabel, 0);
  objc_storeStrong((id *)&self->_testLoggingButton, 0);
  objc_storeStrong((id *)&self->_bookmarksButton, 0);
  objc_storeStrong((id *)&self->_frButton, 0);
  objc_storeStrong((id *)&self->_ffButton, 0);
  objc_storeStrong((id *)&self->_playButton, 0);
  objc_storeStrong((id *)&self->_saveCameraSnapshotButton, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end