@interface TabOverviewItemView
- (BOOL)allowsBorrowedContentTopBackdropUnderlap;
- (BOOL)allowsSnapshotTopBackdropUnderlap;
- (BOOL)containsBorrowedContentView:(id)a3;
- (BOOL)isPinned;
- (BOOL)isRecording;
- (BOOL)isUnread;
- (BOOL)previewViewIsHidden;
- (BOOL)showsCloseButton;
- (BOOL)wasUsedForPreviewing;
- (CGRect)attachedViewReferenceRect;
- (CGSize)windowSize;
- (NSArray)shareParticipants;
- (NSString)title;
- (TabOverviewItemView)initWithFrame:(CGRect)a3;
- (UIButton)closeButton;
- (UIImage)icon;
- (UIView)attachedView;
- (UIView)dimmingView;
- (UIView)previewView;
- (UIView)snapshotView;
- (_SFBarTheme)topBarTheme;
- (double)_effectiveTransitionProgress;
- (double)additionalTopBackdropHeight;
- (double)cornerRadius;
- (double)shadowOpacity;
- (double)topBackdropHeight;
- (double)transitionProgress;
- (id)accessibilityIdentifier;
- (id)accessibilityLabel;
- (int64_t)tabLayout;
- (unint64_t)accessibilityTraits;
- (unint64_t)mediaStateIcon;
- (void)_layOutSubviewsDependentOnContentView;
- (void)insertBorrowedContentView:(id)a3 headerHeight:(double)a4;
- (void)layoutSubviews;
- (void)removeBorrowedContentView:(id)a3;
- (void)setAdditionalTopBackdropHeight:(double)a3;
- (void)setAllowsBorrowedContentTopBackdropUnderlap:(BOOL)a3;
- (void)setAllowsSnapshotTopBackdropUnderlap:(BOOL)a3;
- (void)setAttachedView:(id)a3;
- (void)setAttachedViewReferenceRect:(CGRect)a3;
- (void)setCornerRadius:(double)a3;
- (void)setIcon:(id)a3;
- (void)setMediaStateIcon:(unint64_t)a3;
- (void)setPinned:(BOOL)a3;
- (void)setPreviewViewHidden:(BOOL)a3;
- (void)setRecording:(BOOL)a3;
- (void)setShadowOpacity:(double)a3;
- (void)setShareParticipants:(id)a3;
- (void)setShowsCloseButton:(BOOL)a3;
- (void)setTabLayout:(int64_t)a3;
- (void)setTitle:(id)a3;
- (void)setTopBackdropHeight:(double)a3;
- (void)setTopBarTheme:(id)a3;
- (void)setTransitionProgress:(double)a3;
- (void)setUnread:(BOOL)a3;
- (void)setWasUsedForPreviewing:(BOOL)a3;
- (void)setWindowSize:(CGSize)a3;
- (void)updateSnapshotWithImage:(id)a3;
@end

@implementation TabOverviewItemView

- (TabOverviewItemView)initWithFrame:(CGRect)a3
{
  v21.receiver = self;
  v21.super_class = (Class)TabOverviewItemView;
  v3 = -[TabOverviewItemView initWithFrame:](&v21, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v5 = [(TabOverviewItemView *)v3 layer];
    objc_msgSend(v5, "setAnchorPoint:", *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8));
    v6 = [MEMORY[0x1E4FB1BA8] mainScreen];
    [v6 scale];
    objc_msgSend(v5, "setRasterizationScale:");

    v7 = (UIView *)objc_alloc_init(MEMORY[0x1E4FB1EB0]);
    shadowView = v4->_shadowView;
    v4->_shadowView = v7;

    [(TabOverviewItemView *)v4 addSubview:v4->_shadowView];
    v9 = [(UIView *)v4->_shadowView layer];
    objc_msgSend(v9, "setShadowOffset:", 0.0, 1.0);
    [v9 setShadowRadius:8.0];
    [v9 setShadowPathIsBounds:1];
    v10 = [SFTabOverviewItemContentView alloc];
    [(TabOverviewItemView *)v4 bounds];
    uint64_t v11 = -[SFTabOverviewItemContentView initWithFrame:](v10, "initWithFrame:");
    contentView = v4->_contentView;
    v4->_contentView = (SFTabOverviewItemContentView *)v11;

    [(SFTabOverviewItemContentView *)v4->_contentView setAutoresizingMask:18];
    [(SFTabOverviewItemContentView *)v4->_contentView setMinYMatchesTopBarMaxYWhenZoomed:1];
    [(SFTabOverviewItemContentView *)v4->_contentView setDelegate:v4];
    [(TabOverviewItemView *)v4 addSubview:v4->_contentView];
    v13 = (UIView *)objc_alloc_init(MEMORY[0x1E4FB1EB0]);
    pinnedFillView = v4->_pinnedFillView;
    v4->_pinnedFillView = v13;

    v15 = [MEMORY[0x1E4FB1618] systemBackgroundColor];
    [(UIView *)v4->_pinnedFillView setBackgroundColor:v15];

    [(UIView *)v4->_pinnedFillView setUserInteractionEnabled:0];
    v16 = [(SFTabOverviewItemContentView *)v4->_contentView snapshotClipperView];
    v17 = v4->_pinnedFillView;
    v18 = [(SFTabOverviewItemContentView *)v4->_contentView headerBackgroundView];
    [v16 insertSubview:v17 aboveSubview:v18];

    v19 = v4;
  }

  return v4;
}

- (void)layoutSubviews
{
  [(SFTabOverviewItemContentView *)self->_contentView setEnableDelegateLayoutNotification:0];
  [(TabOverviewItemView *)self bounds];
  CGFloat v4 = v3;
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  [(TabOverviewItemView *)self _effectiveTransitionProgress];
  double v12 = v11;
  if (self->_windowSize.width > 0.0)
  {
    v15.origin.x = v4;
    v15.origin.y = v6;
    v15.size.width = v8;
    v15.size.height = v10;
    CGRectGetWidth(v15);
  }
  _SFRoundFloatToPixels();
  -[SFTabOverviewItemContentView setVisibleTopBackdropHeight:](self->_contentView, "setVisibleTopBackdropHeight:");
  double v13 = 0.0;
  if (!self->_pinned) {
    double v13 = v12;
  }
  [(SFTabOverviewItemContentView *)self->_contentView setTitleRevealPercent:v13];
  v14.receiver = self;
  v14.super_class = (Class)TabOverviewItemView;
  [(TabOverviewItemView *)&v14 layoutSubviews];
  [(SFTabOverviewItemContentView *)self->_contentView layoutIfNeeded];
  [(TabOverviewItemView *)self _layOutSubviewsDependentOnContentView];
  [(SFTabOverviewItemContentView *)self->_contentView setEnableDelegateLayoutNotification:1];
}

- (double)_effectiveTransitionProgress
{
  if (self->_tabLayout == 1) {
    return 0.0;
  }
  [(TabOverviewItemView *)self transitionProgress];
  _SFClamp();
  return result;
}

- (void)_layOutSubviewsDependentOnContentView
{
  [(TabOverviewItemView *)self bounds];
  CGFloat v4 = v3;
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  [(TabOverviewItemView *)self _effectiveTransitionProgress];
  long double v12 = v11;
  double v13 = [(SFTabOverviewItemContentView *)self->_contentView snapshotClipperView];
  [v13 bounds];
  objc_msgSend(v13, "convertRect:toView:", self);
  -[UIView setFrame:](self->_shadowView, "setFrame:");
  objc_super v14 = [(SFTabOverviewItemContentView *)self->_contentView titleView];
  -[TabIconAndTitleView setAlignment:](v14, (const char *)(2 * self->_pinned));
  objc_msgSend(v14, "setAlpha:", (double)pow(v12, 3.0));
  CGRect v15 = [(SFTabOverviewItemContentView *)self->_contentView closeButton];
  unint64_t v16 = [(SFTabOverviewItemContentView *)self->_contentView mediaStateIcon];
  if (self->_pinned)
  {
    if ([(TabOverviewItemView *)self _sf_usesLeftToRightLayout])
    {
      if (v16)
      {
        v17 = [(SFTabOverviewItemContentView *)self->_contentView recordingIndicatorView];
        [v17 frame];
        CGRectGetMaxX(v39);
      }
      [v15 frame];
      double MinX = CGRectGetMinX(v42);
      v43.origin.x = v4;
      v43.origin.y = v6;
      v43.size.width = v8;
      v43.size.height = v10;
      CGFloat v21 = v10;
      CGFloat v22 = CGRectGetWidth(v43) - *MEMORY[0x1E4F787F0];
      +[TabThumbnailCloseButton defaultButtonSize];
      if (MinX >= v22 - v23)
      {
        v45.origin.x = v4;
        v45.origin.y = v6;
        v45.size.width = v8;
        v45.size.height = v21;
        CGRectGetWidth(v45);
        +[TabThumbnailCloseButton defaultButtonSize];
      }
      else
      {
        [v15 frame];
        CGRectGetMinX(v44);
      }
    }
    else
    {
      [v15 frame];
      double MaxX = CGRectGetMaxX(v40);
      if (v16)
      {
        v19 = [(SFTabOverviewItemContentView *)self->_contentView recordingIndicatorView];
        [v19 frame];
        CGRectGetMinX(v41);
      }
      else
      {
        v46.origin.x = v4;
        v46.origin.y = v6;
        v46.size.width = v8;
        v46.size.height = v10;
        CGRectGetWidth(v46);
      }
    }
    [(SFTabOverviewItemContentView *)self->_contentView titleHeight];
    [(SFTabOverviewItemContentView *)self->_contentView titleHeight];
    _SFRoundRectToPixels();
    objc_msgSend(v14, "setFrame:");
  }
  [v13 bounds];
  -[UIView setFrame:](self->_pinnedFillView, "setFrame:");
  [(UIView *)self->_pinnedFillView setHidden:!self->_pinned];
  [(UIView *)self->_pinnedFillView setAlpha:(double)v12];
  if (self->_pinned) {
    v24 = @"pin.fill";
  }
  else {
    v24 = @"xmark";
  }
  v25 = [MEMORY[0x1E4FB1818] systemImageNamed:v24];
  [v15 setImage:v25];

  if (self->_showsCloseButton || self->_pinned) {
    double v26 = v12;
  }
  else {
    double v26 = 0.0;
  }
  [v15 setAlpha:v26];
  [v15 setEnabled:!self->_pinned];
  CGAffineTransformMakeScale(&v38, v12, v12);
  CGAffineTransform v37 = v38;
  [v15 setTransform:&v37];
  double v27 = 0.0;
  if (!self->_pinned)
  {
    v28 = [(SFTabOverviewItemContentView *)self->_contentView shareParticipants];
    uint64_t v29 = [v28 count];

    if (v29) {
      double v27 = v12;
    }
    else {
      double v27 = 0.0;
    }
  }
  v30 = [(SFTabOverviewItemContentView *)self->_contentView participantsBackgroundView];
  [v30 setAlpha:v27];

  _SFClampPercent();
  double v32 = v31;
  v33 = [(SFTabOverviewItemContentView *)self->_contentView placeholderView];
  [v33 setAlpha:v32];

  if (v16) {
    double v34 = v12;
  }
  else {
    double v34 = 0.0;
  }
  v35 = [(SFTabOverviewItemContentView *)self->_contentView recordingIndicatorView];
  [v35 setAlpha:v34];

  v36 = [(SFTabOverviewItemContentView *)self->_contentView attachedView];
  objc_msgSend(v36, "setAlpha:", fmax(v12 * -2.0 + 1.0, 0.0));
}

- (void)setWindowSize:(CGSize)a3
{
  if (a3.width != self->_windowSize.width || a3.height != self->_windowSize.height)
  {
    self->_windowSize = a3;
    [(TabOverviewItemView *)self setNeedsLayout];
  }
}

- (void)setTopBackdropHeight:(double)a3
{
  if (self->_topBackdropHeight != a3)
  {
    self->_topBackdropHeight = a3;
    [(TabOverviewItemView *)self setNeedsLayout];
  }
}

- (void)setPinned:(BOOL)a3
{
  if (self->_pinned != a3)
  {
    double v5 = [(TabOverviewItemView *)self previewView];
    uint64_t v6 = [v5 isHidden];

    double v7 = [(TabOverviewItemView *)self previewView];
    [v7 setHidden:0];

    self->_pinned = a3;
    CGFloat v8 = [(TabOverviewItemView *)self previewView];
    [v8 setHidden:v6];

    [(TabOverviewItemView *)self setNeedsLayout];
  }
}

- (void)setTabLayout:(int64_t)a3
{
  if (self->_tabLayout != a3)
  {
    self->_tabLayout = a3;
    [(TabOverviewItemView *)self setNeedsLayout];
  }
}

- (void)setTransitionProgress:(double)a3
{
  if (self->_transitionProgress != a3)
  {
    self->_transitionProgress = a3;
    [(TabOverviewItemView *)self setNeedsLayout];
  }
}

- (void)setCornerRadius:(double)a3
{
  if (self->_cornerRadius != a3)
  {
    self->_double cornerRadius = a3;
    -[SFTabOverviewItemContentView setCornerRadius:](self->_contentView, "setCornerRadius:");
    double cornerRadius = self->_cornerRadius;
    shadowView = self->_shadowView;
    [(UIView *)shadowView _setContinuousCornerRadius:cornerRadius];
  }
}

- (double)shadowOpacity
{
  v2 = [(UIView *)self->_shadowView layer];
  [v2 shadowOpacity];
  double v4 = v3;

  return v4;
}

- (void)setShadowOpacity:(double)a3
{
  float v3 = a3;
  id v5 = [(UIView *)self->_shadowView layer];
  *(float *)&double v4 = v3;
  [v5 setShadowOpacity:v4];
}

- (UIView)previewView
{
  BOOL pinned = self->_pinned;
  contentView = self->_contentView;
  if (pinned)
  {
    double v4 = contentView;
  }
  else
  {
    double v4 = [(SFTabOverviewItemContentView *)contentView snapshotClipperView];
  }
  return (UIView *)v4;
}

- (void)setPreviewViewHidden:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(TabOverviewItemView *)self previewView];
  if ([v4 isHidden] != v3) {
    [v4 setHidden:v3];
  }
}

- (BOOL)previewViewIsHidden
{
  v2 = [(TabOverviewItemView *)self previewView];
  char v3 = [v2 isHidden];

  return v3;
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x1E4FB0698];
}

- (id)accessibilityLabel
{
  v2 = [(SFTabOverviewItemContentView *)self->_contentView titleView];
  char v3 = -[TabIconAndTitleView title](v2);

  return v3;
}

- (id)accessibilityIdentifier
{
  v8[1] = *MEMORY[0x1E4F143B8];
  BOOL pinned = self->_pinned;
  double v7 = @"IsPinned";
  if (pinned) {
    char v3 = @"true";
  }
  else {
    char v3 = @"false";
  }
  v8[0] = v3;
  id v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:&v7 count:1];
  id v5 = WBSMakeAccessibilityIdentifier();

  return v5;
}

- (UIButton)closeButton
{
  return [(SFTabOverviewItemContentView *)self->_contentView closeButton];
}

- (UIView)attachedView
{
  return [(SFTabOverviewItemContentView *)self->_contentView attachedView];
}

- (void)setAttachedView:(id)a3
{
}

- (NSString)title
{
  return [(SFTabOverviewItemContentView *)self->_contentView title];
}

- (void)setTitle:(id)a3
{
}

- (UIImage)icon
{
  return [(SFTabOverviewItemContentView *)self->_contentView icon];
}

- (void)setIcon:(id)a3
{
}

- (BOOL)isRecording
{
  return [(SFTabOverviewItemContentView *)self->_contentView isRecording];
}

- (void)setRecording:(BOOL)a3
{
}

- (unint64_t)mediaStateIcon
{
  return [(SFTabOverviewItemContentView *)self->_contentView mediaStateIcon];
}

- (void)setMediaStateIcon:(unint64_t)a3
{
}

- (UIView)dimmingView
{
  return [(SFTabOverviewItemContentView *)self->_contentView dimmingView];
}

- (CGRect)attachedViewReferenceRect
{
  [(SFTabOverviewItemContentView *)self->_contentView attachedViewReferenceRect];
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void)setAttachedViewReferenceRect:(CGRect)a3
{
}

- (_SFBarTheme)topBarTheme
{
  return [(SFTabOverviewItemContentView *)self->_contentView topBarTheme];
}

- (void)setTopBarTheme:(id)a3
{
}

- (UIView)snapshotView
{
  return (UIView *)[(SFTabOverviewItemContentView *)self->_contentView snapshotView];
}

- (BOOL)allowsSnapshotTopBackdropUnderlap
{
  return [(SFTabOverviewItemContentView *)self->_contentView allowsSnapshotTopBackdropUnderlap];
}

- (void)setAllowsSnapshotTopBackdropUnderlap:(BOOL)a3
{
}

- (BOOL)allowsBorrowedContentTopBackdropUnderlap
{
  return [(SFTabOverviewItemContentView *)self->_contentView allowsBorrowedContentTopBackdropUnderlap];
}

- (void)setAllowsBorrowedContentTopBackdropUnderlap:(BOOL)a3
{
}

- (BOOL)isUnread
{
  return [(SFTabOverviewItemContentView *)self->_contentView isUnread];
}

- (void)setUnread:(BOOL)a3
{
}

- (NSArray)shareParticipants
{
  return [(SFTabOverviewItemContentView *)self->_contentView shareParticipants];
}

- (void)setShareParticipants:(id)a3
{
}

- (void)setShowsCloseButton:(BOOL)a3
{
  if (self->_showsCloseButton != a3)
  {
    self->_showsCloseButton = a3;
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __43__TabOverviewItemView_setShowsCloseButton___block_invoke;
    v3[3] = &unk_1E6D77E20;
    v3[4] = self;
    [MEMORY[0x1E4FB1EB0] _animateUsingDefaultTimingWithOptions:0 animations:v3 completion:0];
  }
}

void __43__TabOverviewItemView_setShowsCloseButton___block_invoke(uint64_t a1, double a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  LOBYTE(a2) = *(unsigned char *)(v2 + 440);
  double v3 = (double)*(unint64_t *)&a2;
  id v4 = [*(id *)(v2 + 416) closeButton];
  [v4 setAlpha:v3];
}

- (void)updateSnapshotWithImage:(id)a3
{
}

- (void)insertBorrowedContentView:(id)a3 headerHeight:(double)a4
{
  self->_borrowedContentHeaderHeight = a4;
}

- (void)removeBorrowedContentView:(id)a3
{
}

- (BOOL)containsBorrowedContentView:(id)a3
{
  return [a3 isDescendantOfView:self];
}

- (BOOL)showsCloseButton
{
  return self->_showsCloseButton;
}

- (BOOL)isPinned
{
  return self->_pinned;
}

- (double)transitionProgress
{
  return self->_transitionProgress;
}

- (int64_t)tabLayout
{
  return self->_tabLayout;
}

- (BOOL)wasUsedForPreviewing
{
  return self->_wasUsedForPreviewing;
}

- (void)setWasUsedForPreviewing:(BOOL)a3
{
  self->_wasUsedForPreviewing = a3;
}

- (double)cornerRadius
{
  return self->_cornerRadius;
}

- (double)topBackdropHeight
{
  return self->_topBackdropHeight;
}

- (double)additionalTopBackdropHeight
{
  return self->_additionalTopBackdropHeight;
}

- (void)setAdditionalTopBackdropHeight:(double)a3
{
  self->_additionalTopBackdropHeight = a3;
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
  objc_storeStrong((id *)&self->_shadowView, 0);
  objc_storeStrong((id *)&self->_pinnedFillView, 0);
  objc_storeStrong((id *)&self->_contentView, 0);
}

@end