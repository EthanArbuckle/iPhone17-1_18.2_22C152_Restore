@interface BKClassicScrubberTrack
- (UIView)progressView;
- (UIView)trackBackgroundView;
- (void)_updateTrackForSize:(CGSize)a3;
- (void)dealloc;
- (void)layoutSubviews;
- (void)setLayoutDirection:(int64_t)a3;
- (void)setLoadingProgress:(double)a3;
- (void)setProgressView:(id)a3;
- (void)setReadingProgress:(double)a3;
- (void)setRoundEndCaps:(BOOL)a3;
- (void)setThickness:(double)a3;
- (void)setTrackBackgroundColor:(id)a3;
- (void)setTrackBackgroundView:(id)a3;
- (void)setTrackForegroundColor:(id)a3;
- (void)tintColorDidChange;
@end

@implementation BKClassicScrubberTrack

- (void)dealloc
{
  progressView = self->_progressView;
  self->_progressView = 0;

  trackBackgroundView = self->_trackBackgroundView;
  self->_trackBackgroundView = 0;

  v5.receiver = self;
  v5.super_class = (Class)BKClassicScrubberTrack;
  [(BKClassicScrubberTrack *)&v5 dealloc];
}

- (void)tintColorDidChange
{
  id v3 = [(BKClassicScrubberTrack *)self tintColor];
  [(UIView *)self->_progressView setBackgroundColor:v3];
}

- (void)_updateTrackForSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  double y = CGRectZero.origin.y;
  double v71 = CGRectZero.size.height;
  double v72 = CGRectZero.size.width;
  if (self->super._modern)
  {
    if ([(BKScrubberTrack *)self trackOrientation])
    {
      if ([(BKScrubberTrack *)self trackOrientation] != 1)
      {
LABEL_12:
        double v10 = y;
        double x = CGRectZero.origin.x;
        goto LABEL_15;
      }
      v7 = self;
      double v8 = width;
    }
    else
    {
      v7 = self;
      double v8 = height;
    }
    [(BKClassicScrubberTrack *)v7 setThickness:v8];
    goto LABEL_12;
  }
  [(BKScrubberTrack *)self thickness];
  if (v9 == 0.0) {
    [(BKClassicScrubberTrack *)self setThickness:2.0];
  }
  if (![(BKScrubberTrack *)self trackOrientation]
    || [(BKScrubberTrack *)self trackOrientation] == 1)
  {
    [(BKScrubberTrack *)self thickness];
  }
  [(BKClassicScrubberTrack *)self bounds];
  CGRectCenterRectInRect();
  double x = v12;
  double v10 = v13;
  double width = v14;
  double height = v15;
LABEL_15:
  v16 = +[UIScreen mainScreen];
  [v16 scale];
  double v18 = v17;

  float v19 = x * v18;
  double v20 = floorf(v19) / v18;
  float v21 = v10 * v18;
  double v22 = floorf(v21) / v18;
  if (v18 > 0.0)
  {
    double v10 = v22;
    double x = v20;
  }
  [(BKScrubberTrack *)self readingProgress];
  double v24 = fmax(v23, 0.0);
  double v25 = 1.0;
  if (v24 > 1.0) {
    double v24 = 1.0;
  }
  double v70 = v24;
  [(BKScrubberTrack *)self loadingProgress];
  double v27 = fmax(v26, 0.0);
  if (v27 <= 1.0) {
    double v25 = v27;
  }
  if (!self->super._modern && !self->_trackBackgroundView)
  {
    v28 = (UIView *)objc_alloc_init((Class)UIView);
    trackBackgroundView = self->_trackBackgroundView;
    self->_trackBackgroundView = v28;

    [(BKClassicScrubberTrack *)self addSubview:self->_trackBackgroundView];
  }
  if (self->super._roundEndCaps)
  {
    v74.receiver = self;
    v74.super_class = (Class)BKClassicScrubberTrack;
    [(BKScrubberTrack *)&v74 thickness];
    double v31 = v30 * 0.5;
    v32 = [(UIView *)self->_trackBackgroundView layer];
    [v32 setCornerRadius:v31];

    v33 = [(UIView *)self->_trackBackgroundView layer];
    [v33 setMasksToBounds:1];
  }
  else
  {
    v34 = [(UIView *)self->_trackBackgroundView layer];
    [v34 setCornerRadius:0.0];

    v35 = [(UIView *)self->_trackBackgroundView layer];
    [v35 setMasksToBounds:0];
  }
  if (!self->_progressView)
  {
    v36 = [objc_alloc((Class)UIView) initWithFrame:CGRectZero.origin.x, y, v72, v71];
    progressView = self->_progressView;
    self->_progressView = v36;

    [(BKClassicScrubberTrack *)self addSubview:self->_progressView];
  }
  if (self->super._roundEndCaps)
  {
    v73.receiver = self;
    v73.super_class = (Class)BKClassicScrubberTrack;
    [(BKScrubberTrack *)&v73 thickness];
    double v39 = v38 * 0.5;
    v40 = [(UIView *)self->_progressView layer];
    [v40 setCornerRadius:v39];

    v41 = [(UIView *)self->_progressView layer];
    v42 = v41;
    uint64_t v43 = 1;
  }
  else
  {
    v44 = [(UIView *)self->_progressView layer];
    [v44 setCornerRadius:0.0];

    v41 = [(UIView *)self->_progressView layer];
    v42 = v41;
    uint64_t v43 = 0;
  }
  [v41 setMasksToBounds:v43];

  v45 = +[UIColor clearColor];
  [(BKClassicScrubberTrack *)self setBackgroundColor:v45];

  v46 = [(BKScrubberTrack *)self trackBackgroundColor];
  if (v46)
  {
    p_trackBackgroundView = &self->_trackBackgroundView;
    [(UIView *)self->_trackBackgroundView setBackgroundColor:v46];
  }
  else
  {
    v48 = +[UIColor colorWithWhite:0.7 alpha:1.0];
    p_trackBackgroundView = &self->_trackBackgroundView;
    [(UIView *)self->_trackBackgroundView setBackgroundColor:v48];
  }
  v49 = [(BKScrubberTrack *)self trackForegroundColor];
  if (v49)
  {
    [(UIView *)self->_progressView setBackgroundColor:v49];
  }
  else
  {
    v50 = [(BKClassicScrubberTrack *)self tintColor];
    [(UIView *)self->_progressView setBackgroundColor:v50];
  }
  if (self->super._modern)
  {
    double v51 = 0.0;
    if (self->super._loadingProgress < 1.0) {
      double v51 = 1.0;
    }
    [(UIView *)self->_progressView setAlpha:v51];
  }
  if (![(BKScrubberTrack *)self trackOrientation])
  {
    int64_t v59 = [(BKScrubberTrack *)self layoutDirection];
    if (v59 == 1)
    {
      if (v25 == 1.0)
      {
        v83.origin.double x = x;
        v83.origin.double y = v10;
        v83.size.double width = width;
        v83.size.double height = height;
        float v63 = (1.0 - v70) * CGRectGetWidth(v83);
        float v64 = roundf(v63);
        double v58 = v64;
        if (self->super._roundEndCaps) {
          double v65 = width;
        }
        else {
          double v65 = v64;
        }
        v84.origin.double x = x;
        v84.origin.double y = v10;
        v84.size.double width = width;
        v84.size.double height = height;
        double v57 = CGRectGetWidth(v84) - v58;
      }
      else
      {
        v85.origin.double x = x;
        v85.origin.double y = v10;
        v85.size.double width = width;
        v85.size.double height = height;
        float v68 = v25 * CGRectGetWidth(v85);
        double v65 = roundf(v68);
        v86.origin.double x = x;
        v86.origin.double y = v10;
        v86.size.double width = width;
        v86.size.double height = height;
        double v69 = CGRectGetWidth(v86);
        v87.origin.double x = x;
        v87.origin.double y = v10;
        v87.size.double width = v65;
        v87.size.double height = height;
        double v58 = x;
        double x = v69 - CGRectGetWidth(v87);
        double v57 = 0.0;
      }
      double v54 = height;
      double width = v65;
      goto LABEL_61;
    }
    if (!v59)
    {
      v79.origin.double x = x;
      v79.origin.double y = v10;
      v79.size.double width = width;
      v79.size.double height = height;
      double v60 = CGRectGetWidth(v79);
      if (v25 == 1.0)
      {
        float v61 = v70 * v60;
        double v57 = roundf(v61);
        if (!self->super._roundEndCaps)
        {
          v80.origin.double x = x;
          v80.origin.double y = v10;
          v80.size.double width = width;
          v80.size.double height = height;
          double v62 = CGRectGetWidth(v80);
          v81.origin.double x = x;
          v81.origin.double y = v10;
          v81.size.double width = v57;
          v81.size.double height = height;
          double width = v62 - CGRectGetWidth(v81);
          v82.origin.double x = x;
          v82.origin.double y = v10;
          v82.size.double width = v57;
          v82.size.double height = height;
          double v58 = x;
          double v54 = height;
          double v56 = v10;
          double x = CGRectGetWidth(v82);
          goto LABEL_62;
        }
      }
      else
      {
        float v67 = v25 * v60;
        double width = roundf(v67);
        double v57 = 0.0;
      }
      double v54 = height;
      goto LABEL_60;
    }
    goto LABEL_52;
  }
  if ([(BKScrubberTrack *)self trackOrientation] != 1)
  {
LABEL_52:
    double v54 = height;
    goto LABEL_59;
  }
  v75.origin.double x = x;
  v75.origin.double y = v10;
  v75.size.double width = width;
  v75.size.double height = height;
  double v52 = CGRectGetHeight(v75);
  if (v25 != 1.0)
  {
    float v66 = v25 * v52;
    double height = roundf(v66);
    double v54 = 0.0;
    goto LABEL_59;
  }
  float v53 = v70 * v52;
  double v54 = roundf(v53);
  if (self->super._roundEndCaps)
  {
LABEL_59:
    double v57 = width;
LABEL_60:
    double v58 = x;
LABEL_61:
    double v56 = v10;
    goto LABEL_62;
  }
  v76.origin.double x = x;
  v76.origin.double y = v10;
  v76.size.double width = width;
  v76.size.double height = height;
  double v55 = CGRectGetHeight(v76);
  v77.origin.double x = x;
  v77.origin.double y = v10;
  v77.size.double width = width;
  v77.size.double height = v54;
  double height = v55 - CGRectGetHeight(v77);
  v78.origin.double x = x;
  v78.origin.double y = v10;
  v78.size.double width = width;
  v78.size.double height = v54;
  double v56 = CGRectGetHeight(v78);
  double v57 = width;
  double v58 = x;
LABEL_62:
  +[CATransaction begin];
  +[CATransaction setDisableActions:1];
  -[UIView setFrame:](*p_trackBackgroundView, "setFrame:", x, v56, width, height);
  -[UIView setFrame:](self->_progressView, "setFrame:", v58, v10, v57, v54);
  +[CATransaction commit];
}

- (void)layoutSubviews
{
  [(BKClassicScrubberTrack *)self bounds];

  -[BKClassicScrubberTrack _updateTrackForSize:](self, "_updateTrackForSize:", v3, v4);
}

- (void)setTrackBackgroundColor:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)BKClassicScrubberTrack;
  [(BKScrubberTrack *)&v4 setTrackBackgroundColor:a3];
  [(BKClassicScrubberTrack *)self setNeedsLayout];
}

- (void)setTrackForegroundColor:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)BKClassicScrubberTrack;
  [(BKScrubberTrack *)&v4 setTrackForegroundColor:a3];
  [(BKClassicScrubberTrack *)self setNeedsLayout];
}

- (void)setLayoutDirection:(int64_t)a3
{
  if ([(BKScrubberTrack *)self layoutDirection] != a3)
  {
    v5.receiver = self;
    v5.super_class = (Class)BKClassicScrubberTrack;
    [(BKScrubberTrack *)&v5 setLayoutDirection:a3];
    [(BKClassicScrubberTrack *)self setNeedsLayout];
  }
}

- (void)setLoadingProgress:(double)a3
{
  if (self->super._loadingProgress != a3)
  {
    v4.receiver = self;
    v4.super_class = (Class)BKClassicScrubberTrack;
    -[BKScrubberTrack setLoadingProgress:](&v4, "setLoadingProgress:");
    [(BKClassicScrubberTrack *)self setNeedsLayout];
  }
}

- (void)setReadingProgress:(double)a3
{
  if (self->super._readingProgress != a3)
  {
    v4.receiver = self;
    v4.super_class = (Class)BKClassicScrubberTrack;
    -[BKScrubberTrack setReadingProgress:](&v4, "setReadingProgress:");
    [(BKClassicScrubberTrack *)self setNeedsLayout];
  }
}

- (void)setThickness:(double)a3
{
  if (self->super._thickness != a3)
  {
    v4.receiver = self;
    v4.super_class = (Class)BKClassicScrubberTrack;
    -[BKScrubberTrack setThickness:](&v4, "setThickness:");
    [(BKClassicScrubberTrack *)self setNeedsLayout];
  }
}

- (void)setRoundEndCaps:(BOOL)a3
{
  if (self->super._roundEndCaps != a3)
  {
    v4.receiver = self;
    v4.super_class = (Class)BKClassicScrubberTrack;
    -[BKScrubberTrack setRoundEndCaps:](&v4, "setRoundEndCaps:");
    [(BKClassicScrubberTrack *)self setNeedsLayout];
  }
}

- (UIView)progressView
{
  return self->_progressView;
}

- (void)setProgressView:(id)a3
{
}

- (UIView)trackBackgroundView
{
  return self->_trackBackgroundView;
}

- (void)setTrackBackgroundView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trackBackgroundView, 0);

  objc_storeStrong((id *)&self->_progressView, 0);
}

@end