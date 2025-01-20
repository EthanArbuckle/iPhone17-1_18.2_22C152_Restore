@interface MusicLibraryAddKeepLocalControl
+ (CGSize)_expectedSizeForControlStatusType:(int64_t)a3 controlTitle:(id)a4 hasControlImage:(BOOL)a5 displayScale:(double)a6 preferredHeight:(double)a7;
+ (id)_controlTitleFontForControlStatusType:(int64_t)a3;
+ (id)_newControlTitleLabel;
- (BOOL)adjustsFontSizeToFitWidth;
- (BOOL)allowsAddImage;
- (BOOL)hadFirstTouchHighlight;
- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4;
- (CGSize)intrinsicContentSize;
- (CGSize)maximumSizeWithPreferredHeight:(double)a3;
- (CGSize)sizeThatFits:(CGSize)a3;
- (MusicDownloadProgressView)downloadProgressView;
- (MusicLibraryAddKeepLocalControl)initWithFrame:(CGRect)a3;
- (MusicLibraryAddKeepLocalControlStatus)controlStatus;
- (NSMutableDictionary)controlStatusTypeToTitle;
- (UIEdgeInsets)controlImageEdgeInsets;
- (UIImageView)controlImageView;
- (UILabel)controlTitleLabel;
- (UIView)backgroundView;
- (UIView)transientContentView;
- (double)controlHitOutsets;
- (id)_centerImageForDownloading;
- (id)_centerImageForPausedDownload;
- (id)_currentContentSuperview;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (id)titleForControlStatusType:(int64_t)a3;
- (int64_t)controlStatusRevision;
- (int64_t)displayStyle;
- (int64_t)downloadingCenterIconType;
- (int64_t)offerButtonSize;
- (int64_t)transientContentViewTransactionCount;
- (void)_beginTransientContentViewTransaction;
- (void)_endTransientContentViewTransaction;
- (void)_updateBackgroundViewCornerRadius;
- (void)_updateControlImageViewAnimation;
- (void)_updateControlStatusProperties;
- (void)_updateControlTitleLabelVisualProperties;
- (void)dealloc;
- (void)didMoveToWindow;
- (void)layoutSubviews;
- (void)setAdjustsFontSizeToFitWidth:(BOOL)a3;
- (void)setAllowsAddImage:(BOOL)a3;
- (void)setBackgroundView:(id)a3;
- (void)setContentHorizontalAlignment:(int64_t)a3;
- (void)setControlHitOutsets:(double)a3;
- (void)setControlImageEdgeInsets:(UIEdgeInsets)a3;
- (void)setControlImageView:(id)a3;
- (void)setControlStatus:(MusicLibraryAddKeepLocalControlStatus)a3;
- (void)setControlStatus:(MusicLibraryAddKeepLocalControlStatus)a3 animated:(BOOL)a4;
- (void)setControlStatusRevision:(int64_t)a3;
- (void)setControlStatusTypeToTitle:(id)a3;
- (void)setControlTitleLabel:(id)a3;
- (void)setDisplayStyle:(int64_t)a3;
- (void)setDownloadProgressView:(id)a3;
- (void)setDownloadingCenterIconType:(int64_t)a3;
- (void)setHadFirstTouchHighlight:(BOOL)a3;
- (void)setHighlighted:(BOOL)a3;
- (void)setOfferButtonSize:(int64_t)a3;
- (void)setTitle:(id)a3 forControlStatusType:(int64_t)a4;
- (void)setTransientContentView:(id)a3;
- (void)setTransientContentViewTransactionCount:(int64_t)a3;
- (void)tintColorDidChange;
- (void)touchesCancelled:(id)a3 withEvent:(id)a4;
- (void)touchesEnded:(id)a3 withEvent:(id)a4;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation MusicLibraryAddKeepLocalControl

- (MusicLibraryAddKeepLocalControl)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)MusicLibraryAddKeepLocalControl;
  v3 = -[MusicLibraryAddKeepLocalControl initWithFrame:](&v6, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v3->_allowsAddImage = 1;
    [(MusicLibraryAddKeepLocalControl *)v3 _updateControlStatusProperties];
    v4->_controlHitOutsets = -16.0;
  }
  return v4;
}

- (void)dealloc
{
  if (self->_controlStatus.statusType == 3)
  {
    v3 = +[NSNotificationCenter defaultCenter];
    [v3 removeObserver:self name:MTApplicationWillEnterForegroundNotification object:0];
  }
  v4.receiver = self;
  v4.super_class = (Class)MusicLibraryAddKeepLocalControl;
  [(MusicLibraryAddKeepLocalControl *)&v4 dealloc];
}

- (void)didMoveToWindow
{
  v3.receiver = self;
  v3.super_class = (Class)MusicLibraryAddKeepLocalControl;
  [(MusicLibraryAddKeepLocalControl *)&v3 didMoveToWindow];
  if ([(MusicLibraryAddKeepLocalControl *)self _isInAWindow]) {
    [(MusicLibraryAddKeepLocalControl *)self _updateControlImageViewAnimation];
  }
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  if (-[MusicLibraryAddKeepLocalControl pointInside:withEvent:](self, "pointInside:withEvent:", a4, a3.x, a3.y)
    && [(MusicLibraryAddKeepLocalControl *)self isEnabled])
  {
    v5 = self;
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  [(MusicLibraryAddKeepLocalControl *)self bounds];
  CGFloat v7 = v15.origin.x;
  CGFloat v8 = v15.origin.y;
  CGFloat width = v15.size.width;
  CGFloat height = v15.size.height;
  if (CGRectIsEmpty(v15)) {
    return 0;
  }
  v16.origin.CGFloat x = v7;
  v16.origin.CGFloat y = v8;
  v16.size.CGFloat width = width;
  v16.size.CGFloat height = height;
  CGRect v17 = CGRectInset(v16, self->_controlHitOutsets, self->_controlHitOutsets);
  v14.CGFloat x = x;
  v14.CGFloat y = y;
  if (!CGRectContainsPoint(v17, v14)) {
    return 0;
  }
  if (self->_controlImageView) {
    return 1;
  }
  v13 = [(UILabel *)self->_controlTitleLabel text];
  if ([v13 length]) {
    char v11 = 1;
  }
  else {
    char v11 = self->_downloadProgressView != 0;
  }

  return v11;
}

- (void)setAdjustsFontSizeToFitWidth:(BOOL)a3
{
  if (self->_adjustsFontSizeToFitWidth != a3)
  {
    self->_adjustsFontSizeToFitWidth = a3;
    [(MusicLibraryAddKeepLocalControl *)self _updateControlStatusProperties];
  }
}

- (void)layoutSubviews
{
  v137.receiver = self;
  v137.super_class = (Class)MusicLibraryAddKeepLocalControl;
  [(MusicLibraryAddKeepLocalControl *)&v137 layoutSubviews];
  [(MusicLibraryAddKeepLocalControl *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  char v11 = [(MusicLibraryAddKeepLocalControl *)self traitCollection];
  [v11 displayScale];
  MTMPUFloatGetSafeScaleForValue();
  uint64_t v13 = v12;

  [(UILabel *)self->_controlTitleLabel frame];
  CGFloat r2_16 = v14;
  CGFloat v16 = v15;
  -[UILabel sizeThatFits:](self->_controlTitleLabel, "sizeThatFits:", 1.79769313e308, 1.79769313e308);
  CGFloat v19 = v18;
  if (v17 >= v8 + -32.0) {
    double v20 = v8 + -32.0;
  }
  else {
    double v20 = v17;
  }
  v21 = (char *)[(MusicLibraryAddKeepLocalControl *)self contentHorizontalAlignment];
  controlImageView = self->_controlImageView;
  double v134 = v4;
  double v135 = v10;
  double r2_24 = v8;
  double v133 = v6;
  uint64_t r2 = v13;
  if (controlImageView)
  {
    [(UIImageView *)controlImageView frame];
    -[UIImageView sizeThatFits:](self->_controlImageView, "sizeThatFits:", v8, v10);
    UIRectCenteredYInRectScale();
    CGFloat rect = v23;
    CGFloat v25 = v24;
    double v27 = v26;
    CGFloat v136 = v28;
    v29 = [(UILabel *)self->_controlTitleLabel text];
    id v30 = [v29 length];

    if (v30)
    {
      CGFloat rect_16 = v25;
      CGFloat v118 = v27;
      uint64_t v114 = v13;
      UIRectCenteredYInRectScale();
      double v34 = v33;
      CGFloat v36 = v35;
      uint64_t v37 = 0;
      CGFloat rect_8 = v31;
      double r2_8 = v8 + -6.0;
      double r2_16a = v4 + 0.0;
      double v117 = v6 + 0.0;
      double rect_24 = v32;
      double v119 = v35;
      if (v21 == (unsigned char *)&dword_0 + 2)
      {
        v140.origin.CGFloat x = v4;
        CGFloat v47 = v32;
        CGFloat v48 = v31;
        v140.origin.CGFloat y = v6;
        v140.size.CGFloat width = v8;
        v140.size.CGFloat height = v10;
        CGFloat v115 = v34;
        CGFloat v49 = CGRectGetMaxX(v140) + -6.0;
        v141.origin.CGFloat x = v115;
        v141.origin.CGFloat y = v36;
        v141.size.CGFloat width = v48;
        v141.size.CGFloat height = v47;
        CGFloat v50 = v49 - CGRectGetWidth(v141);
        v142.origin.CGFloat x = v50;
        v142.origin.CGFloat y = v36;
        v142.size.CGFloat width = v48;
        v142.size.CGFloat height = v47;
        double MinX = CGRectGetMinX(v142);
        v143.origin.CGFloat x = rect;
        v143.origin.CGFloat y = rect_16;
        double v27 = v118;
        v143.size.CGFloat width = v118;
        CGFloat v41 = v136;
        v143.size.CGFloat height = v136;
        double v38 = MinX - CGRectGetWidth(v143);
        double v43 = v50;
      }
      else
      {
        if (v21 != (unsigned char *)&dword_0 + 1)
        {
          CGFloat v52 = v32;
          CGFloat v53 = v25;
          double v54 = v27;
          CGFloat v41 = v136;
          CGFloat v55 = v136;
          v144.origin.CGFloat x = CGRectGetMaxX(*(CGRect *)&v37) + 0.0;
          double recta = v144.origin.x;
          v160.origin.CGFloat x = 0.0;
          v144.origin.CGFloat y = v36;
          v144.size.CGFloat width = rect_8;
          v144.size.CGFloat height = v52;
          v160.origin.CGFloat y = rect_16;
          v160.size.CGFloat width = v27;
          v160.size.CGFloat height = v136;
          CGRect v145 = CGRectUnion(v144, v160);
          CGFloat x = v145.origin.x;
          CGFloat y = v145.origin.y;
          CGFloat width = v145.size.width;
          CGFloat height = v145.size.height;
          uint64_t v114 = r2;
          double v51 = v117;
          UIRectCenteredXInRectScale();
          CGRectGetMinX(v146);
          v147.origin.CGFloat x = x;
          v147.origin.CGFloat y = y;
          v147.size.CGFloat width = width;
          v147.size.CGFloat height = height;
          CGRectGetMinX(v147);
          MTMPUFloatRoundForScale();
          double v38 = v60 + 0.0;
          CGFloat v36 = v119;
          double v43 = recta + v60;
          double v10 = v135;
          goto LABEL_20;
        }
        double v38 = 0.0;
        CGFloat v39 = v25;
        double v40 = v27;
        CGFloat v41 = v136;
        CGFloat v42 = v136;
        double v43 = CGRectGetMaxX(*(CGRect *)&v37) + 0.0;
      }
      double v51 = v6 + 0.0;
LABEL_20:
      CGFloat v61 = v36;
      CGFloat v62 = rect_8;
      double v63 = rect_24;
      v161.origin.CGFloat x = v38;
      v161.origin.CGFloat y = rect_16;
      v161.size.CGFloat width = v27;
      v161.size.CGFloat height = v41;
      CGRect v148 = CGRectUnion(*(CGRect *)&v43, v161);
      CGFloat v64 = v148.origin.x;
      CGFloat v65 = v148.origin.y;
      CGFloat v66 = v148.size.width;
      CGFloat v67 = v148.size.height;
      v148.size.CGFloat width = r2_8;
      v148.origin.CGFloat x = r2_16a;
      v148.origin.CGFloat y = v51;
      v148.size.CGFloat height = v10;
      CGRectGetWidth(v148);
      CGFloat r2_8a = v65;
      double r2_16b = v64;
      v149.origin.CGFloat x = v64;
      v149.origin.CGFloat y = v65;
      v149.size.CGFloat width = v66;
      double v68 = v66;
      CGFloat v136 = v67;
      v149.size.CGFloat height = v67;
      CGRectGetWidth(v149);
      v69 = self->_controlImageView;
      double v6 = v133;
      double v4 = v134;
      double v8 = r2_24;
      MTMPURectByApplyingUserInterfaceLayoutDirectionInRect();
      [(UIImageView *)v69 setFrame:v114];
      controlTitleLabel = self->_controlTitleLabel;
      MTMPURectByApplyingUserInterfaceLayoutDirectionInRect();
      -[UILabel setFrame:](controlTitleLabel, "setFrame:");
      double v27 = v68 + 6.0;
      goto LABEL_27;
    }
    if (v21 == (unsigned char *)&dword_0 + 2)
    {
      v153.origin.CGFloat x = v4;
      v153.origin.CGFloat y = v6;
      v153.size.CGFloat width = v8;
      v153.size.CGFloat height = v10;
      CGFloat v75 = v27;
      double MaxX = CGRectGetMaxX(v153);
      v154.origin.CGFloat x = rect;
      v154.origin.CGFloat y = v25;
      v154.size.CGFloat width = v75;
      v154.size.CGFloat height = v136;
      double v46 = MaxX - CGRectGetWidth(v154);
      double v27 = v75;
    }
    else if (v21 == (unsigned char *)&dword_0 + 1)
    {
      v139.origin.CGFloat x = v4;
      v139.origin.CGFloat y = v6;
      v139.size.CGFloat width = v8;
      v139.size.CGFloat height = v10;
      double v46 = CGRectGetMinX(v139);
    }
    else
    {
      uint64_t v113 = v13;
      UIRectCenteredXInRectScale();
      CGFloat v25 = v77;
      double v27 = v78;
      CGFloat v136 = v79;
    }
    double r2_16b = v46;
    v80 = self->_controlImageView;
    MTMPURectByApplyingUserInterfaceLayoutDirectionInRect();
    -[UIImageView setFrame:](v80, "setFrame:");
    CGFloat r2_8a = v25;
  }
  else
  {
    v44 = [(UILabel *)self->_controlTitleLabel text];
    id v45 = [v44 length];

    if (v45)
    {
      if (v21 == (unsigned char *)&dword_0 + 2)
      {
        v150.origin.CGFloat x = v4;
        v150.origin.CGFloat y = v6;
        v150.size.CGFloat width = v8;
        v150.size.CGFloat height = v10;
        CGRectGetMaxX(v150);
        v151.origin.CGFloat x = r2_16;
        v151.origin.CGFloat y = v16;
        v151.size.CGFloat width = v20;
        v151.size.CGFloat height = v19;
        CGRectGetWidth(v151);
      }
      else if (v21 == (unsigned char *)&dword_0 + 1)
      {
        v138.origin.CGFloat x = v4;
        v138.origin.CGFloat y = v6;
        v138.size.CGFloat width = v8;
        v138.size.CGFloat height = v10;
        CGRectGetMinX(v138);
      }
      else
      {
        UIRectCenteredXInRectScale();
      }
      UIRectCenteredYInRectScale();
      double r2_16b = v71 + -16.0;
      double v73 = v72 + 32.0;
      v152.origin.CGFloat x = v4;
      v152.origin.CGFloat y = v6;
      v152.size.CGFloat width = v8;
      v152.size.CGFloat height = v10;
      CGFloat v136 = CGRectGetHeight(v152);
      v74 = self->_controlTitleLabel;
      double v27 = v73;
      MTMPURectByApplyingUserInterfaceLayoutDirectionInRect();
      [(UILabel *)v74 setFrame:v13];
      CGFloat r2_8a = 0.0;
    }
    else
    {
      double v27 = CGRectNull.size.width;
      CGFloat r2_8a = CGRectNull.origin.y;
      double r2_16b = CGRectNull.origin.x;
      CGFloat v136 = CGRectNull.size.height;
    }
  }
LABEL_27:
  if (!self->_downloadProgressView)
  {
    double v93 = v136;
    double v94 = r2_8a;
    double v95 = r2_16b;
    goto LABEL_40;
  }
  CGFloat v81 = v27;
  v155.origin.CGFloat x = v4;
  v155.origin.CGFloat y = v6;
  v155.size.CGFloat width = v8;
  v155.size.CGFloat height = v10;
  double v82 = CGRectGetWidth(v155);
  v156.origin.CGFloat x = v4;
  v156.origin.CGFloat y = v6;
  v156.size.CGFloat width = v8;
  v156.size.CGFloat height = v10;
  double v83 = CGRectGetHeight(v156);
  if (v82 >= v83) {
    double v82 = v83;
  }
  [(MusicDownloadProgressView *)self->_downloadProgressView frame];
  CGFloat v85 = v84;
  CGFloat v87 = v86;
  double v88 = v10;
  if (v21 == (unsigned char *)&dword_0 + 2)
  {
    double v96 = v4;
    double v97 = v6;
    double v98 = v8;
    double v99 = CGRectGetMaxX(*(CGRect *)(&v88 - 3));
    v157.origin.CGFloat x = v85;
    v157.origin.CGFloat y = v87;
    v157.size.CGFloat width = v82;
    v157.size.CGFloat height = v82;
    double v92 = v99 - CGRectGetWidth(v157);
  }
  else
  {
    if (v21 != (unsigned char *)&dword_0 + 1)
    {
      UIRectCenteredIntegralRectScale();
      CGFloat r2a = v101;
      CGFloat v87 = v102;
      double v82 = v103;
      CGFloat v100 = v104;
      goto LABEL_37;
    }
    double v89 = v4;
    double v90 = v6;
    double v91 = v8;
    double v92 = CGRectGetMinX(*(CGRect *)(&v88 - 3));
  }
  CGFloat r2a = v92;
  CGFloat v100 = v82;
LABEL_37:
  v158.origin.CGFloat x = r2_16b;
  v158.origin.CGFloat y = r2_8a;
  v158.size.CGFloat width = v81;
  v158.size.CGFloat height = v136;
  BOOL IsNull = CGRectIsNull(v158);
  CGFloat v106 = v136;
  CGFloat v107 = r2_8a;
  double v93 = v100;
  CGFloat v108 = v82;
  double v109 = r2_16b;
  double v94 = v87;
  double v95 = r2a;
  if (!IsNull)
  {
    CGFloat v110 = v81;
    v162.origin.CGFloat x = r2a;
    v162.origin.CGFloat y = v87;
    v162.size.CGFloat width = v82;
    v162.size.CGFloat height = v100;
    CGRect v159 = CGRectUnion(*(CGRect *)&v109, v162);
    double v95 = v159.origin.x;
    double v94 = v159.origin.y;
    CGFloat v108 = v159.size.width;
    double v93 = v159.size.height;
  }
  downloadProgressView = self->_downloadProgressView;
  MTMPURectByApplyingUserInterfaceLayoutDirectionInRect();
  -[MusicDownloadProgressView setFrame:](downloadProgressView, "setFrame:");
  double v27 = v108;
LABEL_40:
  backgroundView = self->_backgroundView;
  if (backgroundView)
  {
    -[UIView setFrame:](backgroundView, "setFrame:", v95, v94, v27, v93);
    [(MusicLibraryAddKeepLocalControl *)self _updateBackgroundViewCornerRadius];
  }
}

- (CGSize)intrinsicContentSize
{
  +[MusicAppTheme defaultLibraryAddKeepLocalControlHeight];

  -[MusicLibraryAddKeepLocalControl maximumSizeWithPreferredHeight:](self, "maximumSizeWithPreferredHeight:");
  result.CGFloat height = v4;
  result.CGFloat width = v3;
  return result;
}

- (CGSize)maximumSizeWithPreferredHeight:(double)a3
{
  double v4 = [(MusicLibraryAddKeepLocalControl *)self traitCollection];
  [v4 displayScale];
  MTMPUFloatGetSafeScaleForValue();

  uint64_t v5 = 0;
  double width = CGSizeZero.width;
  double height = CGSizeZero.height;
  do
  {
    uint64_t v8 = *(void *)((char *)&v18 + v5);
    double v9 = objc_opt_class();
    double v10 = [(MusicLibraryAddKeepLocalControl *)self titleForControlStatusType:v8];
    BOOL v11 = self->_allowsAddImage || self->_controlStatus.statusType != 1;
    MTMPUFloatGetSafeScaleForValue();
    [v9 _expectedSizeForControlStatusType:v8 controlTitle:v10 hasControlImage:v11 displayScale:v12 preferredHeight:v13];
    double v13 = v12;
    double v15 = v14;

    if (width < v13) {
      double width = v13;
    }
    if (height < v15) {
      double height = v15;
    }
    v5 += 8;
  }
  while (v5 != 48);
  double v16 = width;
  double v17 = height;
  result.double height = v17;
  result.double width = v16;
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v4 = objc_opt_class();
  int64_t statusType = self->_controlStatus.statusType;
  double v6 = [(MusicLibraryAddKeepLocalControl *)self titleForControlStatusType:statusType];
  BOOL v7 = self->_allowsAddImage || self->_controlStatus.statusType != 1;
  uint64_t v8 = [(MusicLibraryAddKeepLocalControl *)self traitCollection];
  [v8 displayScale];
  MTMPUFloatGetSafeScaleForValue();
  [v4 _expectedSizeForControlStatusType:statusType controlTitle:v6 hasControlImage:v7 displayScale:displayScale preferredHeight:preferredHeight];
  double v10 = v9;
  double v12 = v11;

  double v13 = v10;
  double v14 = v12;
  result.double height = v14;
  result.double width = v13;
  return result;
}

- (void)tintColorDidChange
{
  v4.receiver = self;
  v4.super_class = (Class)MusicLibraryAddKeepLocalControl;
  [(MusicLibraryAddKeepLocalControl *)&v4 tintColorDidChange];
  double v3 = [(MusicLibraryAddKeepLocalControl *)self tintColor];
  if (self->_displayStyle == 1) {
    [(UIView *)self->_backgroundView setBackgroundColor:v3];
  }
  [(MusicLibraryAddKeepLocalControl *)self _updateControlTitleLabelVisualProperties];
  if (self->_controlStatus.statusType == 2) {
    [(MusicLibraryAddKeepLocalControl *)self _updateControlStatusProperties];
  }
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)MusicLibraryAddKeepLocalControl;
  [(MusicLibraryAddKeepLocalControl *)&v10 traitCollectionDidChange:v4];
  id v5 = [v4 userInterfaceStyle];
  double v6 = [(MusicLibraryAddKeepLocalControl *)self traitCollection];
  id v7 = [v6 userInterfaceStyle];

  uint64_t v8 = [(MusicLibraryAddKeepLocalControl *)self traitCollection];
  double v9 = v8;
  if (v5 != v7
    || ([v8 displayScale], objc_msgSend(v4, "displayScale"), (MTMPUFloatEqualToFloat() & 1) == 0))
  {
    [(MusicLibraryAddKeepLocalControl *)self _updateControlStatusProperties];
  }
}

- (void)setContentHorizontalAlignment:(int64_t)a3
{
  id v5 = [(MusicLibraryAddKeepLocalControl *)self contentHorizontalAlignment];
  v6.receiver = self;
  v6.super_class = (Class)MusicLibraryAddKeepLocalControl;
  [(MusicLibraryAddKeepLocalControl *)&v6 setContentHorizontalAlignment:a3];
  if (v5 != [(MusicLibraryAddKeepLocalControl *)self contentHorizontalAlignment]) {
    [(MusicLibraryAddKeepLocalControl *)self setNeedsLayout];
  }
}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)MusicLibraryAddKeepLocalControl;
  [(MusicLibraryAddKeepLocalControl *)&v5 touchesCancelled:a3 withEvent:a4];
  self->_hadFirstTouchHighlight = 0;
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)MusicLibraryAddKeepLocalControl;
  [(MusicLibraryAddKeepLocalControl *)&v5 touchesEnded:a3 withEvent:a4];
  self->_hadFirstTouchHighlight = 0;
}

- (void)setHighlighted:(BOOL)a3
{
  BOOL v3 = a3;
  unsigned int v5 = [(MusicLibraryAddKeepLocalControl *)self isHighlighted];
  v12.receiver = self;
  v12.super_class = (Class)MusicLibraryAddKeepLocalControl;
  [(MusicLibraryAddKeepLocalControl *)&v12 setHighlighted:v3];
  unsigned int v6 = [(MusicLibraryAddKeepLocalControl *)self isHighlighted];
  if (v5 != v6)
  {
    char v7 = v6;
    double v8 = 1.0;
    if (v6)
    {
      [(MusicLibraryAddKeepLocalControl *)self _beginTransientContentViewTransaction];
      double v8 = 0.2;
    }
    if (self->_hadFirstTouchHighlight)
    {
      v11[0] = _NSConcreteStackBlock;
      v11[1] = 3221225472;
      v11[2] = __50__MusicLibraryAddKeepLocalControl_setHighlighted___block_invoke;
      v11[3] = &unk_420170;
      v11[4] = self;
      *(double *)&v11[5] = v8;
      v9[0] = _NSConcreteStackBlock;
      v9[1] = 3221225472;
      v9[2] = __50__MusicLibraryAddKeepLocalControl_setHighlighted___block_invoke_2;
      v9[3] = &unk_420198;
      char v10 = v7;
      v9[4] = self;
      +[UIView animateWithDuration:327684 delay:v11 options:v9 animations:0.47 completion:0.0];
    }
    else
    {
      self->_hadFirstTouchHighlight = 1;
      [(UIView *)self->_transientContentView setAlpha:v8];
      if ((v7 & 1) == 0) {
        [(MusicLibraryAddKeepLocalControl *)self _endTransientContentViewTransaction];
      }
    }
  }
}

void __50__MusicLibraryAddKeepLocalControl_setHighlighted___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) transientContentView];
  [v2 setAlpha:*(double *)(a1 + 40)];
}

id *__50__MusicLibraryAddKeepLocalControl_setHighlighted___block_invoke_2(id *result)
{
  if (!*((unsigned char *)result + 40)) {
    return (id *)[result[4] _endTransientContentViewTransaction];
  }
  return result;
}

- (void)setAllowsAddImage:(BOOL)a3
{
  if (self->_allowsAddImage != a3)
  {
    self->_allowsAddImage = a3;
    if (self->_controlStatus.statusType == 1) {
      [(MusicLibraryAddKeepLocalControl *)self _updateControlStatusProperties];
    }
  }
}

- (void)setDisplayStyle:(int64_t)a3
{
  if (self->_displayStyle != a3)
  {
    self->_displayStyle = a3;
    [(MusicLibraryAddKeepLocalControl *)self _updateControlStatusProperties];
    [(MusicLibraryAddKeepLocalControl *)self _updateControlTitleLabelVisualProperties];
  }
}

- (void)setControlStatus:(MusicLibraryAddKeepLocalControlStatus)a3
{
}

- (void)setControlStatus:(MusicLibraryAddKeepLocalControlStatus)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  p_controlStatus = &self->_controlStatus;
  int64_t statusType = self->_controlStatus.statusType;
  if (statusType == a3.statusType)
  {
    if (vabdd_f64(self->_controlStatus.downloadProgress, a3.downloadProgress) <= 0.00000011920929) {
      return;
    }
    int64_t controlStatusRevision = self->_controlStatusRevision;
    self->_controlStatus.downloadProgress = a3.downloadProgress;
    int64_t v9 = controlStatusRevision + 1;
    self->_int64_t controlStatusRevision = controlStatusRevision + 1;
    if ((statusType & 0xFFFFFFFFFFFFFFFELL) == 4)
    {
      v21[0] = _NSConcreteStackBlock;
      v21[1] = 3221225472;
      v21[2] = __61__MusicLibraryAddKeepLocalControl_setControlStatus_animated___block_invoke;
      v21[3] = &unk_420108;
      v21[4] = self;
      char v10 = objc_retainBlock(v21);
      double v11 = v10;
      if (v4) {
        +[UIView animateWithDuration:134 delay:v10 options:0 animations:0.25 completion:0.0];
      }
      else {
        ((void (*)(void *))v10[2])(v10);
      }

      return;
    }
  }
  else
  {
    p_controlStatus->int64_t statusType = a3.statusType;
    self->_controlStatus.downloadProgress = a3.downloadProgress;
    int64_t v9 = self->_controlStatusRevision + 1;
    self->_int64_t controlStatusRevision = v9;
  }
  if (a3.statusType == 3)
  {
    if (statusType != 3)
    {
      objc_super v12 = +[NSNotificationCenter defaultCenter];
      uint64_t v13 = MTApplicationWillEnterForegroundNotification;
      double v14 = +[UIApplication sharedApplication];
      [v12 addObserver:self selector:"_applicationWillEnterForegroundNotification:" name:v13 object:v14];

      goto LABEL_12;
    }
  }
  else
  {
    if (statusType != 3)
    {
LABEL_12:
      BOOL v18 = (statusType & 0xFFFFFFFFFFFFFFFELL) != 4 || !v4;
      if (!v18 && p_controlStatus->statusType == 6)
      {
        v20[0] = _NSConcreteStackBlock;
        v20[1] = 3221225472;
        v20[2] = __61__MusicLibraryAddKeepLocalControl_setControlStatus_animated___block_invoke_2;
        v20[3] = &unk_420108;
        v20[4] = self;
        v19[0] = _NSConcreteStackBlock;
        v19[1] = 3221225472;
        v19[2] = __61__MusicLibraryAddKeepLocalControl_setControlStatus_animated___block_invoke_3;
        v19[3] = &unk_4201C0;
        v19[4] = self;
        v19[5] = v9;
        +[UIView animateWithDuration:134 delay:v20 options:v19 animations:0.25 completion:0.0];
        return;
      }
      goto LABEL_18;
    }
    double v15 = +[NSNotificationCenter defaultCenter];
    uint64_t v16 = MTApplicationWillEnterForegroundNotification;
    double v17 = +[UIApplication sharedApplication];
    [v15 removeObserver:self name:v16 object:v17];
  }
LABEL_18:

  [(MusicLibraryAddKeepLocalControl *)self _updateControlStatusProperties];
}

void __61__MusicLibraryAddKeepLocalControl_setControlStatus_animated___block_invoke(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) downloadProgressView];
  [*(id *)(a1 + 32) controlStatus];
  [v3 setDownloadProgress:v2];
}

void __61__MusicLibraryAddKeepLocalControl_setControlStatus_animated___block_invoke_2(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) downloadProgressView];
  [v1 setDownloadProgress:1.0];
}

void __61__MusicLibraryAddKeepLocalControl_setControlStatus_animated___block_invoke_3(uint64_t a1)
{
  dispatch_time_t v2 = dispatch_time(0, 100000000);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = __61__MusicLibraryAddKeepLocalControl_setControlStatus_animated___block_invoke_4;
  v4[3] = &unk_420170;
  uint64_t v3 = *(void *)(a1 + 40);
  v4[4] = *(void *)(a1 + 32);
  v4[5] = v3;
  dispatch_after(v2, (dispatch_queue_t)&_dispatch_main_q, v4);
}

id __61__MusicLibraryAddKeepLocalControl_setControlStatus_animated___block_invoke_4(uint64_t a1)
{
  id result = [*(id *)(a1 + 32) controlStatusRevision];
  if (result == *(id *)(a1 + 40))
  {
    uint64_t v3 = *(void **)(a1 + 32);
    return [v3 _updateControlStatusProperties];
  }
  return result;
}

- (void)setTitle:(id)a3 forControlStatusType:(int64_t)a4
{
  id v11 = a3;
  unsigned int v6 = +[NSNumber numberWithInteger:a4];
  controlStatusTypeToTitle = self->_controlStatusTypeToTitle;
  if (v11)
  {
    if (!controlStatusTypeToTitle)
    {
      double v8 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
      int64_t v9 = self->_controlStatusTypeToTitle;
      self->_controlStatusTypeToTitle = v8;

      controlStatusTypeToTitle = self->_controlStatusTypeToTitle;
    }
    [(NSMutableDictionary *)controlStatusTypeToTitle setObject:v11 forKey:v6];
  }
  else
  {
    [(NSMutableDictionary *)controlStatusTypeToTitle removeObjectForKey:v6];
    if (![(NSMutableDictionary *)self->_controlStatusTypeToTitle count])
    {
      char v10 = self->_controlStatusTypeToTitle;
      self->_controlStatusTypeToTitle = 0;
    }
  }
  if (self->_controlStatus.statusType == a4) {
    [(MusicLibraryAddKeepLocalControl *)self _updateControlStatusProperties];
  }
}

- (id)titleForControlStatusType:(int64_t)a3
{
  controlStatusTypeToTitle = self->_controlStatusTypeToTitle;
  BOOL v4 = +[NSNumber numberWithInteger:a3];
  unsigned int v5 = [(NSMutableDictionary *)controlStatusTypeToTitle objectForKey:v4];

  return v5;
}

+ (CGSize)_expectedSizeForControlStatusType:(int64_t)a3 controlTitle:(id)a4 hasControlImage:(BOOL)a5 displayScale:(double)a6 preferredHeight:(double)a7
{
  BOOL v8 = a5;
  id v11 = a4;
  objc_super v12 = v11;
  double width = CGSizeZero.width;
  double height = CGSizeZero.height;
  if (a3)
  {
    if ([v11 length])
    {
      id v15 = [a1 _newControlTitleLabel];
      uint64_t v16 = [a1 _controlTitleFontForControlStatusType:a3];
      [v15 setFont:v16];

      [v15 setText:v12];
      double v17 = [v15 font];
      [v15 sizeThatFits:1.79769313e308, 1.79769313e308];
      MTMPUFloatCeilForScale();
      if (v8)
      {
        double width = CGSizeZero.width + v18 + 0.0 + 6.0 + 28.0;
        [v17 lineHeight];
        double v20 = v19;
        [v17 ascender];
        double v22 = v20 - v21;
        [v17 descender];
        double height = fmax(v22 + v23 + 16.0, 28.0);
      }
      else
      {
        double width = CGSizeZero.width + v18 + 32.0;
      }
      if (height <= a7) {
        double height = a7;
      }
    }
    else
    {
      if (a7 >= 28.0) {
        double height = a7;
      }
      else {
        double height = 28.0;
      }
      double width = height;
    }
  }

  double v24 = width;
  double v25 = height;
  result.double height = v25;
  result.double width = v24;
  return result;
}

+ (id)_newControlTitleLabel
{
  id v2 = [objc_alloc((Class)UILabel) initWithFrame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height];
  uint64_t v3 = +[UIColor clearColor];
  [v2 setBackgroundColor:v3];

  return v2;
}

+ (id)_controlTitleFontForControlStatusType:(int64_t)a3
{
  if (a3 == 6)
  {
    uint64_t v3 = +[UIFont boldSystemFontOfSize:11.0];
  }
  else
  {
    BOOL v4 = +[MTMPUFontDescriptor fontDescriptorWithTextStyle:2 weight:4];
    uint64_t v3 = [v4 defaultFont];
  }

  return v3;
}

- (void)_beginTransientContentViewTransaction
{
  int64_t transientContentViewTransactionCount = self->_transientContentViewTransactionCount;
  self->_int64_t transientContentViewTransactionCount = transientContentViewTransactionCount + 1;
  if (!transientContentViewTransactionCount)
  {
    if (!self->_transientContentView)
    {
      id v4 = objc_alloc((Class)UIView);
      [(MusicLibraryAddKeepLocalControl *)self bounds];
      unsigned int v5 = (UIView *)[v4 initWithFrame:];
      transientContentView = self->_transientContentView;
      self->_transientContentView = v5;

      [(MusicLibraryAddKeepLocalControl *)self insertSubview:self->_transientContentView atIndex:0];
    }
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    char v7 = [(MusicLibraryAddKeepLocalControl *)self subviews];
    id v8 = [v7 copy];

    id v9 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = *(void *)v15;
      do
      {
        objc_super v12 = 0;
        do
        {
          if (*(void *)v15 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v13 = self->_transientContentView;
          if (*(UIView **)(*((void *)&v14 + 1) + 8 * (void)v12) != v13) {
            -[UIView addSubview:](v13, "addSubview:");
          }
          objc_super v12 = (char *)v12 + 1;
        }
        while (v10 != v12);
        id v10 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v10);
    }
  }
}

- (void)_endTransientContentViewTransaction
{
  --self->_transientContentViewTransactionCount;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v3 = [(UIView *)self->_transientContentView subviews];
  id v4 = [v3 copy];

  id v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      id v8 = 0;
      do
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        transientContentView = *(UIView **)(*((void *)&v11 + 1) + 8 * (void)v8);
        if (transientContentView != self->_transientContentView)
        {
          -[MusicLibraryAddKeepLocalControl addSubview:](self, "addSubview:");
          transientContentView = self->_transientContentView;
        }
        [(UIView *)transientContentView removeFromSuperview];
        id v10 = self->_transientContentView;
        self->_transientContentView = 0;

        id v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }
}

- (id)_currentContentSuperview
{
  if (self->_transientContentViewTransactionCount >= 1) {
    self = (MusicLibraryAddKeepLocalControl *)self->_transientContentView;
  }
  return self;
}

- (void)_updateControlTitleLabelVisualProperties
{
  if (self->_controlStatus.statusType == 6)
  {
    controlTitleLabel = self->_controlTitleLabel;
    uint64_t v3 = +[UIColor systemGrayColor];
  }
  else
  {
    controlTitleLabel = self->_controlTitleLabel;
    if (self->_displayStyle == 1) {
      +[UIColor whiteColor];
    }
    else {
    uint64_t v3 = [(MusicLibraryAddKeepLocalControl *)self tintColor];
    }
  }
  id v4 = (id)v3;
  -[UILabel setTextColor:](controlTitleLabel, "setTextColor:");
}

- (void)_updateBackgroundViewCornerRadius
{
  [(UIView *)self->_backgroundView bounds];
  CGFloat x = v12.origin.x;
  CGFloat y = v12.origin.y;
  CGFloat width = v12.size.width;
  CGFloat height = v12.size.height;
  double v7 = CGRectGetWidth(v12);
  v13.origin.CGFloat x = x;
  v13.origin.CGFloat y = y;
  v13.size.CGFloat width = width;
  v13.size.CGFloat height = height;
  double v8 = CGRectGetHeight(v13);
  if (v7 < v8) {
    double v8 = v7;
  }
  double v9 = v8 * 0.5;
  id v10 = [(UIView *)self->_backgroundView layer];
  [v10 setCornerRadius:v9];
}

- (id)_centerImageForDownloading
{
  int64_t v3 = [(MusicLibraryAddKeepLocalControl *)self downloadingCenterIconType];
  if (v3 == 1)
  {
    id v4 = [(MusicLibraryAddKeepLocalControl *)self traitCollection];
    uint64_t v5 = +[MusicAppTheme pauseButtonImageWithTraitCollection:v4];
    goto LABEL_5;
  }
  if (!v3)
  {
    id v4 = [(MusicLibraryAddKeepLocalControl *)self traitCollection];
    uint64_t v5 = +[MusicAppTheme stopButtonImageWithTraitCollection:v4];
LABEL_5:
    id v6 = (void *)v5;

    goto LABEL_7;
  }
  id v6 = 0;
LABEL_7:
  double v7 = [v6 imageWithRenderingMode:2];

  return v7;
}

- (id)_centerImageForPausedDownload
{
  id v2 = [(MusicLibraryAddKeepLocalControl *)self traitCollection];
  int64_t v3 = +[MusicAppTheme resumeButtonImageWithTraitCollection:v2];

  id v4 = [v3 imageWithRenderingMode:2];

  return v4;
}

- (void)_updateControlStatusProperties
{
  int64_t v3 = [(MusicLibraryAddKeepLocalControl *)self traitCollection];
  [v3 displayScale];

  if (MTMPUFloatLessThanOrEqualToFloat()) {
    return;
  }
  int64_t statusType = self->_controlStatus.statusType;
  downloadProgressView = self->_downloadProgressView;
  if ((statusType & 0xFFFFFFFFFFFFFFFELL) == 4)
  {
    if (!downloadProgressView)
    {
      id v6 = [MusicDownloadProgressView alloc];
      [(MusicLibraryAddKeepLocalControl *)self bounds];
      double v7 = -[MusicDownloadProgressView initWithFrame:](v6, "initWithFrame:");
      double v8 = self->_downloadProgressView;
      self->_downloadProgressView = v7;

      double v9 = [(MusicLibraryAddKeepLocalControl *)self _currentContentSuperview];
      [v9 addSubview:self->_downloadProgressView];
    }
    if (statusType == 5)
    {
      id v10 = self->_downloadProgressView;
      uint64_t v11 = [(MusicLibraryAddKeepLocalControl *)self _centerImageForPausedDownload];
    }
    else
    {
      if (statusType != 4)
      {
LABEL_15:
        [(MusicDownloadProgressView *)self->_downloadProgressView setDownloadProgress:self->_controlStatus.downloadProgress];
        goto LABEL_16;
      }
      id v10 = self->_downloadProgressView;
      uint64_t v11 = [(MusicLibraryAddKeepLocalControl *)self _centerImageForDownloading];
    }
    double v23 = (void *)v11;
    [(MusicDownloadProgressView *)v10 setCenterImage:v11];

    goto LABEL_15;
  }
  [(MusicDownloadProgressView *)downloadProgressView removeFromSuperview];
  CGRect v12 = self->_downloadProgressView;
  self->_downloadProgressView = 0;

  if (statusType != 1 || self->_displayStyle != 1)
  {
LABEL_16:
    [(UIView *)self->_backgroundView removeFromSuperview];
    backgroundView = self->_backgroundView;
    self->_backgroundView = 0;

    CGFloat top = UIEdgeInsetsZero.top;
    double left = UIEdgeInsetsZero.left;
    CGFloat bottom = UIEdgeInsetsZero.bottom;
    double right = UIEdgeInsetsZero.right;
    switch(statusType)
    {
      case 1:
        goto LABEL_17;
      case 2:
        if ([(MusicLibraryAddKeepLocalControl *)self offerButtonSize]) {
          double v29 = 16.0;
        }
        else {
          double v29 = 22.0;
        }
        id v30 = [(MusicLibraryAddKeepLocalControl *)self tintColor];
        double v31 = [(MusicLibraryAddKeepLocalControl *)self traitCollection];
        double v27 = +[MusicAppTheme cloudDownloadImageForTintColor:v30 pointSize:v31 traitCollection:v29];

        goto LABEL_28;
      case 3:
        double v27 = +[UIImage imageNamed:@"UniversalAddControlWaiting"];
        goto LABEL_28;
      case 6:
        double v32 = [(MusicLibraryAddKeepLocalControl *)self titleForControlStatusType:6];
        if ([v32 length])
        {
        }
        else
        {
          double v33 = +[NSUserDefaults standardUserDefaults];
          unsigned int v34 = [v33 BOOLForKey:@"MusicKeepLocalControlShouldShowDownloadedIndicator"];

          if (!v34) {
            goto LABEL_37;
          }
        }
        double v27 = +[UIImage imageNamed:@"UniversalAddControlDownloaded"];
        if (MTMPUFloatEqualToFloat()) {
          double left = -1.5;
        }
        else {
          double left = -2.0;
        }
        if (self->_displayStyle == 1) {
          +[UIColor systemGrayColor];
        }
        else {
        uint64_t v28 = +[MusicAppTheme systemLightGrayColor];
        }
        CGFloat bottom = 0.0;
        double right = -3.0;
        CGFloat top = 0.0;
        break;
      default:
        goto LABEL_37;
    }
    goto LABEL_40;
  }
  if (!self->_backgroundView)
  {
    id v13 = objc_alloc((Class)UIView);
    [(MusicLibraryAddKeepLocalControl *)self bounds];
    long long v14 = [v13 initWithFrame:];
    long long v15 = self->_backgroundView;
    self->_backgroundView = v14;

    long long v16 = self->_backgroundView;
    long long v17 = [(MusicLibraryAddKeepLocalControl *)self tintColor];
    [(UIView *)v16 setBackgroundColor:v17];

    [(UIView *)self->_backgroundView setClipsToBounds:1];
    [(MusicLibraryAddKeepLocalControl *)self _updateBackgroundViewCornerRadius];
    double v18 = [(MusicLibraryAddKeepLocalControl *)self _currentContentSuperview];
    [v18 insertSubview:self->_backgroundView atIndex:0];
  }
  CGFloat top = UIEdgeInsetsZero.top;
  double left = UIEdgeInsetsZero.left;
  CGFloat bottom = UIEdgeInsetsZero.bottom;
  double right = UIEdgeInsetsZero.right;
LABEL_17:
  if (!self->_allowsAddImage)
  {
LABEL_37:
    id v48 = 0;
    self->_controlImageEdgeInsets.CGFloat top = top;
    self->_controlImageEdgeInsets.double left = left;
    self->_controlImageEdgeInsets.CGFloat bottom = bottom;
    self->_controlImageEdgeInsets.double right = right;
    goto LABEL_44;
  }
  if ([(MusicLibraryAddKeepLocalControl *)self offerButtonSize]) {
    double v25 = 16.0;
  }
  else {
    double v25 = 20.0;
  }
  double v26 = [(MusicLibraryAddKeepLocalControl *)self traitCollection];
  double v27 = +[MusicAppTheme addButtonImageWithPointSize:v26 traitCollection:v25];

  if (self->_displayStyle == 1)
  {
    uint64_t v28 = +[UIColor whiteColor];
  }
  else
  {
LABEL_28:
    uint64_t v28 = 0;
  }
LABEL_40:
  self->_controlImageEdgeInsets.CGFloat top = top;
  self->_controlImageEdgeInsets.double left = left;
  self->_controlImageEdgeInsets.CGFloat bottom = bottom;
  self->_controlImageEdgeInsets.double right = right;
  id v48 = (id)v28;
  if (v27)
  {
    controlImageView = self->_controlImageView;
    if (!controlImageView)
    {
      CGFloat v36 = [(UIImageView *)[objc_alloc((Class)UIImageView) initWithFrame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height]];
      uint64_t v37 = self->_controlImageView;
      self->_controlImageView = v36;

      double v38 = [(MusicLibraryAddKeepLocalControl *)self _currentContentSuperview];
      [v38 addSubview:self->_controlImageView];

      uint64_t v28 = (uint64_t)v48;
      controlImageView = self->_controlImageView;
    }
    [(UIImageView *)controlImageView setTintColor:v28];
    [(UIImageView *)self->_controlImageView setImage:v27];
    [(MusicLibraryAddKeepLocalControl *)self _updateControlImageViewAnimation];
    goto LABEL_45;
  }
LABEL_44:
  [(UIImageView *)self->_controlImageView removeFromSuperview];
  double v27 = self->_controlImageView;
  self->_controlImageView = 0;
LABEL_45:

  CGFloat v39 = [(MusicLibraryAddKeepLocalControl *)self titleForControlStatusType:statusType];
  id v40 = [v39 length];
  controlTitleLabel = self->_controlTitleLabel;
  if (v40)
  {
    if (!controlTitleLabel)
    {
      CGFloat v42 = (UILabel *)[(id)objc_opt_class() _newControlTitleLabel];
      double v43 = self->_controlTitleLabel;
      self->_controlTitleLabel = v42;

      v44 = [(MusicLibraryAddKeepLocalControl *)self _currentContentSuperview];
      [v44 addSubview:self->_controlTitleLabel];
    }
    [(MusicLibraryAddKeepLocalControl *)self _updateControlTitleLabelVisualProperties];
    id v45 = self->_controlTitleLabel;
    double v46 = [(id)objc_opt_class() _controlTitleFontForControlStatusType:statusType];
    [(UILabel *)v45 setFont:v46];

    [(UILabel *)self->_controlTitleLabel setText:v39];
    [(UILabel *)self->_controlTitleLabel setAdjustsFontSizeToFitWidth:[(MusicLibraryAddKeepLocalControl *)self adjustsFontSizeToFitWidth]];
    [(UILabel *)self->_controlTitleLabel setMinimumScaleFactor:0.75];
    [(UILabel *)self->_controlTitleLabel setBaselineAdjustment:[(MusicLibraryAddKeepLocalControl *)self adjustsFontSizeToFitWidth]];
    [(MusicLibraryAddKeepLocalControl *)self setNeedsLayout];
  }
  else
  {
    [(UILabel *)controlTitleLabel removeFromSuperview];
    CGFloat v47 = self->_controlTitleLabel;
    self->_controlTitleLabel = 0;
  }
  [(MusicLibraryAddKeepLocalControl *)self setNeedsLayout];
}

- (void)_updateControlImageViewAnimation
{
  controlImageView = self->_controlImageView;
  if (controlImageView)
  {
    id v14 = [(UIImageView *)controlImageView layer];
    if (self->_controlStatus.statusType == 3)
    {
      id v4 = +[CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
      uint64_t v5 = [v14 presentationLayer];
      if (v5) {
        id v6 = v5;
      }
      else {
        id v6 = v14;
      }
      double v7 = [v4 keyPath];
      double v8 = [v6 valueForKeyPath:v7];

      [v4 setFromValue:v8];
      [v8 floatValue];
      id v10 = +[NSNumber numberWithDouble:(double)(fmod(v9, 6.28318531) + 6.28318531)];
      [v4 setToValue:v10];

      [v4 setRemovedOnCompletion:0];
      LODWORD(v11) = 2139095040;
      [v4 setRepeatCount:v11];
      [v4 setFillMode:kCAFillModeBoth];
      [v4 setDuration:1.0];
      [v4 setBeginTimeMode:kCAAnimationAbsolute];
      CFTimeInterval v12 = CACurrentMediaTime();
      [v4 duration];
      [v4 setBeginTime:(double)(v12 - fmod(v12, v13))];
      [v14 addAnimation:v4 forKey:@"_MusicLibraryAddKeepLocalControlWaitingSpinnerAnimationKey"];
    }
    else
    {
      [v14 removeAnimationForKey:@"_MusicLibraryAddKeepLocalControlWaitingSpinnerAnimationKey"];
    }
  }
}

- (BOOL)allowsAddImage
{
  return self->_allowsAddImage;
}

- (MusicLibraryAddKeepLocalControlStatus)controlStatus
{
  p_controlStatus = &self->_controlStatus;
  int64_t statusType = self->_controlStatus.statusType;
  double downloadProgress = p_controlStatus->downloadProgress;
  result.double downloadProgress = downloadProgress;
  result.int64_t statusType = statusType;
  return result;
}

- (int64_t)displayStyle
{
  return self->_displayStyle;
}

- (int64_t)offerButtonSize
{
  return self->_offerButtonSize;
}

- (void)setOfferButtonSize:(int64_t)a3
{
  self->_offerButtonSize = a3;
}

- (double)controlHitOutsets
{
  return self->_controlHitOutsets;
}

- (void)setControlHitOutsets:(double)a3
{
  self->_controlHitOutsets = a3;
}

- (BOOL)adjustsFontSizeToFitWidth
{
  return self->_adjustsFontSizeToFitWidth;
}

- (int64_t)downloadingCenterIconType
{
  return self->_downloadingCenterIconType;
}

- (void)setDownloadingCenterIconType:(int64_t)a3
{
  self->_downloadingCenterIconType = a3;
}

- (UIView)transientContentView
{
  return self->_transientContentView;
}

- (void)setTransientContentView:(id)a3
{
}

- (MusicDownloadProgressView)downloadProgressView
{
  return self->_downloadProgressView;
}

- (void)setDownloadProgressView:(id)a3
{
}

- (UILabel)controlTitleLabel
{
  return self->_controlTitleLabel;
}

- (void)setControlTitleLabel:(id)a3
{
}

- (UIView)backgroundView
{
  return self->_backgroundView;
}

- (void)setBackgroundView:(id)a3
{
}

- (UIImageView)controlImageView
{
  return self->_controlImageView;
}

- (void)setControlImageView:(id)a3
{
}

- (NSMutableDictionary)controlStatusTypeToTitle
{
  return self->_controlStatusTypeToTitle;
}

- (void)setControlStatusTypeToTitle:(id)a3
{
}

- (int64_t)controlStatusRevision
{
  return self->_controlStatusRevision;
}

- (void)setControlStatusRevision:(int64_t)a3
{
  self->_int64_t controlStatusRevision = a3;
}

- (BOOL)hadFirstTouchHighlight
{
  return self->_hadFirstTouchHighlight;
}

- (void)setHadFirstTouchHighlight:(BOOL)a3
{
  self->_hadFirstTouchHighlight = a3;
}

- (UIEdgeInsets)controlImageEdgeInsets
{
  double top = self->_controlImageEdgeInsets.top;
  double left = self->_controlImageEdgeInsets.left;
  double bottom = self->_controlImageEdgeInsets.bottom;
  double right = self->_controlImageEdgeInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)setControlImageEdgeInsets:(UIEdgeInsets)a3
{
  self->_controlImageEdgeInsets = a3;
}

- (int64_t)transientContentViewTransactionCount
{
  return self->_transientContentViewTransactionCount;
}

- (void)setTransientContentViewTransactionCount:(int64_t)a3
{
  self->_int64_t transientContentViewTransactionCount = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_controlStatusTypeToTitle, 0);
  objc_storeStrong((id *)&self->_controlImageView, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
  objc_storeStrong((id *)&self->_controlTitleLabel, 0);
  objc_storeStrong((id *)&self->_downloadProgressView, 0);

  objc_storeStrong((id *)&self->_transientContentView, 0);
}

@end