@interface MFConversationItemFooterView
+ (UIFont)nameFont;
+ (UIFont)prefixFont;
- (BOOL)allowsPointerSnapping;
- (BOOL)blockquotesAreExpanded;
- (BOOL)isRevealActionsButtonHidden;
- (BOOL)isSeeMoreButtonHidden;
- (BOOL)isSemiExpanded;
- (BOOL)isUndoSendButtonHidden;
- (BOOL)messageContainsBlockQuotes;
- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4;
- (BOOL)shouldHideStickyFooterView;
- (ConversationSearchOverlayView)findOverlayView;
- (EMCachingContactStore)contactStore;
- (MFConversationItemFooterView)initWithFrame:(CGRect)a3;
- (MFMessageDisplayMetrics)displayMetrics;
- (MFMessageFooterViewDelegate)delegate;
- (UIButton)revealActionsButton;
- (UIButton)seeMoreButton;
- (UIButton)undoSendButton;
- (UIVisualEffectView)backgroundView;
- (double)currentYOffset;
- (double)defaultRevealActionButtonOriginY;
- (double)defaultSeeMoreButtonOriginY;
- (double)defaultUndoSendButtonOriginY;
- (double)seeMoreButtonAlpha;
- (double)seeMoreButtonHeight;
- (id)_seeMoreButton;
- (id)_undoSendButton;
- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5;
- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4;
- (void)_fontMetricCacheDidInvalidate:(id)a3;
- (void)_updateBackgroundView;
- (void)_updateButtons;
- (void)_updateSeeMoreButton;
- (void)addConversationSearchOverlay;
- (void)addTarget:(id)a3 action:(SEL)a4 toButton:(int64_t)a5;
- (void)layoutActionButtonWithBounds:(CGRect)a3;
- (void)layoutMarginsDidChange;
- (void)layoutSeeMoreButton;
- (void)layoutSubviews;
- (void)layoutUndoSendButton;
- (void)moveOriginYByOffset:(double)a3;
- (void)removeConversationSearchOverlay;
- (void)setAllowsPointerSnapping:(BOOL)a3;
- (void)setBackgroundView:(id)a3;
- (void)setBlockquotesAreExpanded:(BOOL)a3;
- (void)setBounds:(CGRect)a3;
- (void)setContactStore:(id)a3;
- (void)setCurrentYOffset:(double)a3;
- (void)setDefaultRevealActionButtonOriginY:(double)a3;
- (void)setDefaultSeeMoreButtonOriginY:(double)a3;
- (void)setDefaultUndoSendButtonOriginY:(double)a3;
- (void)setDelegate:(id)a3;
- (void)setDisplayMetrics:(id)a3;
- (void)setFindOverlayView:(id)a3;
- (void)setIsSemiExpanded:(BOOL)a3;
- (void)setLayoutMargins:(UIEdgeInsets)a3;
- (void)setMessageContainsBlockQuotes:(BOOL)a3;
- (void)setRevealActionsButton:(id)a3;
- (void)setSeeMoreButton:(id)a3;
- (void)setSeeMoreButtonAlpha:(double)a3;
- (void)setSeeMoreButtonHidden:(BOOL)a3;
- (void)setUndoSendButton:(id)a3;
- (void)setUndoSendButtonHidden:(BOOL)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation MFConversationItemFooterView

- (MFConversationItemFooterView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v26.receiver = self;
  v26.super_class = (Class)MFConversationItemFooterView;
  v7 = -[MFConversationItemFooterView initWithFrame:](&v26, sel_initWithFrame_);
  v8 = v7;
  if (v7)
  {
    [(MFConversationItemFooterView *)v7 setAccessibilityIdentifier:*MEMORY[0x1E4F73C20]];
    [(MFConversationItemFooterView *)v8 setInsetsLayoutMarginsFromSafeArea:0];
    v9 = [MEMORY[0x1E4FB1618] mailConversationViewFooterBackgroundColor];
    [(MFConversationItemFooterView *)v8 setBackgroundColor:v9];

    v10 = (void *)[objc_alloc(MEMORY[0x1E4FB1938]) initWithDelegate:0];
    [(MFConversationItemFooterView *)v8 addInteraction:v10];
    v11 = [(MFConversationItemFooterView *)v8 layer];
    objc_msgSend(v11, "setAnchorPoint:", *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8));

    id v12 = objc_alloc(MEMORY[0x1E4FB1F00]);
    v13 = [MEMORY[0x1E4FB14C8] effectWithStyle:1100];
    v14 = (void *)[v12 initWithEffect:v13];

    objc_msgSend(v14, "setFrame:", x, y, width, height);
    [v14 setClipsToBounds:1];
    [v14 setTranslatesAutoresizingMaskIntoConstraints:0];
    [(MFConversationItemFooterView *)v8 setBackgroundView:v14];
    v15 = [(MFConversationItemFooterView *)v8 backgroundView];
    [v15 setAlpha:1.0];

    [(MFConversationItemFooterView *)v8 addSubview:v14];
    [(MFConversationItemFooterView *)v8 _updateBackgroundView];
    uint64_t v16 = [(MFConversationItemFooterView *)v8 _seeMoreButton];
    seeMoreButton = v8->_seeMoreButton;
    v8->_seeMoreButton = (UIButton *)v16;

    [(MFConversationItemFooterView *)v8 addSubview:v8->_seeMoreButton];
    [(UIButton *)v8->_seeMoreButton sizeToFit];
    [(MFConversationItemFooterView *)v8 _updateSeeMoreButton];
    uint64_t v18 = objc_msgSend(MEMORY[0x1E4FB14D0], "mf_revealActionsButtonWithAccessibilityIdentifier:", *MEMORY[0x1E4F73C28]);
    revealActionsButton = v8->_revealActionsButton;
    v8->_revealActionsButton = (UIButton *)v18;

    v20 = v8->_revealActionsButton;
    v21 = (void *)[objc_alloc(MEMORY[0x1E4FB1AC8]) initWithDelegate:v8];
    [(UIButton *)v20 addInteraction:v21];

    [(MFConversationItemFooterView *)v8 addSubview:v8->_revealActionsButton];
    if (_os_feature_enabled_impl())
    {
      uint64_t v22 = [(MFConversationItemFooterView *)v8 _undoSendButton];
      undoSendButton = v8->_undoSendButton;
      v8->_undoSendButton = (UIButton *)v22;

      [(MFConversationItemFooterView *)v8 addSubview:v8->_undoSendButton];
      [(UIButton *)v8->_undoSendButton sizeToFit];
    }
    v24 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v24 addObserver:v8 selector:sel__fontMetricCacheDidInvalidate_ name:*MEMORY[0x1E4F35020] object:0];

    [(MFConversationItemFooterView *)v8 _updateButtons];
    [(MFConversationItemFooterView *)v8 setNeedsLayout];
  }
  return v8;
}

- (void)setLayoutMargins:(UIEdgeInsets)a3
{
  v3.receiver = self;
  v3.super_class = (Class)MFConversationItemFooterView;
  -[MFConversationItemFooterView setLayoutMargins:](&v3, sel_setLayoutMargins_, a3.top, a3.left + -7.0, a3.bottom, a3.right + -7.0);
}

- (ConversationSearchOverlayView)findOverlayView
{
  findOverlayView = self->_findOverlayView;
  if (!findOverlayView)
  {
    v4 = [ConversationSearchOverlayView alloc];
    [(MFConversationItemFooterView *)self bounds];
    v5 = -[ConversationSearchOverlayView initWithFrame:](v4, "initWithFrame:");
    v6 = self->_findOverlayView;
    self->_findOverlayView = v5;

    [(MFConversationItemFooterView *)self addSubview:self->_findOverlayView];
    findOverlayView = self->_findOverlayView;
  }
  return findOverlayView;
}

- (void)_updateBackgroundView
{
  BOOL v3 = [(MFConversationItemFooterView *)self shouldHideStickyFooterView];
  id v4 = [(MFConversationItemFooterView *)self backgroundView];
  [v4 setHidden:v3];
}

- (id)_seeMoreButton
{
  v2 = [MEMORY[0x1E4FB14D0] buttonWithType:1];
  LODWORD(v3) = -1102263091;
  [v2 setCharge:v3];
  id v4 = [v2 titleLabel];
  [v4 _setTextColorFollowsTintColor:1];

  v5 = [v2 titleLabel];
  [v5 setLineBreakMode:4];

  v6 = [(id)objc_opt_class() prefixFont];
  v7 = [v2 titleLabel];
  [v7 setFont:v6];

  v8 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  v9 = [v8 localizedStringForKey:@"SEE_MORE" value:&stru_1F39E2A88 table:@"Main"];
  [v2 setTitle:v9 forState:0];

  [v2 setAccessibilityIdentifier:*MEMORY[0x1E4F73C30]];
  return v2;
}

- (id)_undoSendButton
{
  v2 = [MEMORY[0x1E4FB14D8] plainButtonConfiguration];
  double v3 = [MEMORY[0x1E4FB14D0] buttonWithConfiguration:v2 primaryAction:0];
  objc_msgSend(v3, "_setTouchInsets:", -20.0, -20.0, 20.0, 20.0);
  id v4 = [v3 titleLabel];
  [v4 setLineBreakMode:4];

  v5 = [(id)objc_opt_class() prefixFont];
  v6 = [v3 titleLabel];
  [v6 setFont:v5];

  v7 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  v8 = [v7 localizedStringForKey:@"UNDO_SEND_BUTTON_TITLE" value:&stru_1F39E2A88 table:@"Main"];
  [v3 setTitle:v8 forState:0];

  [v3 setAccessibilityIdentifier:*MEMORY[0x1E4F73C38]];
  [v3 setHidden:1];

  return v3;
}

- (void)_updateSeeMoreButton
{
  if ([(MFConversationItemFooterView *)self isSemiExpanded])
  {
    double v3 = self;
    BOOL v4 = 0;
LABEL_11:
    [(MFConversationItemFooterView *)v3 setSeeMoreButtonHidden:v4];
    return;
  }
  int v5 = _os_feature_enabled_impl();
  BOOL v6 = [(MFConversationItemFooterView *)self messageContainsBlockQuotes];
  if (!v5)
  {
    BOOL v4 = !v6 || [(MFConversationItemFooterView *)self blockquotesAreExpanded];
    double v3 = self;
    goto LABEL_11;
  }
  if (v6 && ![(MFConversationItemFooterView *)self blockquotesAreExpanded])
  {
    id v9 = [(MFConversationItemFooterView *)self undoSendButton];
    uint64_t v8 = [v9 isHidden] ^ 1;
    int v7 = 1;
  }
  else
  {
    int v7 = 0;
    uint64_t v8 = 1;
  }
  [(MFConversationItemFooterView *)self setSeeMoreButtonHidden:v8];
  if (v7)
  {
  }
}

- (void)setSeeMoreButtonHidden:(BOOL)a3
{
  BOOL v3 = a3;
  int v5 = [(MFConversationItemFooterView *)self seeMoreButton];
  [v5 setHidden:v3];

  [(MFConversationItemFooterView *)self setNeedsLayout];
}

- (BOOL)isSeeMoreButtonHidden
{
  v2 = [(MFConversationItemFooterView *)self seeMoreButton];
  char v3 = [v2 isHidden];

  return v3;
}

- (BOOL)isRevealActionsButtonHidden
{
  v2 = [(MFConversationItemFooterView *)self revealActionsButton];
  char v3 = [v2 isHidden];

  return v3;
}

- (void)setUndoSendButtonHidden:(BOOL)a3
{
  BOOL v3 = a3;
  int v5 = [(MFConversationItemFooterView *)self undoSendButton];
  int v6 = [v5 isHidden];

  if (v6 != v3)
  {
    int v7 = [(MFConversationItemFooterView *)self undoSendButton];
    [v7 setHidden:v3];

    uint64_t v8 = v3 ^ 1;
    id v9 = [(MFConversationItemFooterView *)self revealActionsButton];
    [v9 setHidden:v8];

    v10 = [(MFConversationItemFooterView *)self seeMoreButton];
    [v10 setHidden:v8];

    [(MFConversationItemFooterView *)self setNeedsLayout];
  }
}

- (BOOL)isUndoSendButtonHidden
{
  v2 = [(MFConversationItemFooterView *)self undoSendButton];
  char v3 = [v2 isHidden];

  return v3;
}

- (void)setSeeMoreButtonAlpha:(double)a3
{
  id v4 = [(MFConversationItemFooterView *)self seeMoreButton];
  [v4 setAlpha:a3];
}

- (double)seeMoreButtonAlpha
{
  v2 = [(MFConversationItemFooterView *)self seeMoreButton];
  [v2 alpha];
  double v4 = v3;

  return v4;
}

- (void)setMessageContainsBlockQuotes:(BOOL)a3
{
  self->_messageContainsBlockQuotes = a3;
  [(MFConversationItemFooterView *)self _updateSeeMoreButton];
}

- (void)setBlockquotesAreExpanded:(BOOL)a3
{
  self->_blockquotesAreExpanded = a3;
  [(MFConversationItemFooterView *)self _updateSeeMoreButton];
}

- (double)seeMoreButtonHeight
{
  v2 = [(MFConversationItemFooterView *)self seeMoreButton];
  [v2 frame];
  double Height = CGRectGetHeight(v5);

  return Height;
}

- (void)setIsSemiExpanded:(BOOL)a3
{
  if (self->_isSemiExpanded != a3)
  {
    self->_isSemiExpanded = a3;
    [(MFConversationItemFooterView *)self _updateSeeMoreButton];
  }
}

- (void)setDisplayMetrics:(id)a3
{
  p_displayMetrics = &self->_displayMetrics;
  id v8 = a3;
  if (([v8 isEqual:*p_displayMetrics] & 1) == 0)
  {
    int v6 = [(MFMessageDisplayMetrics *)*p_displayMetrics usePhoneLandscapeSymbolConfiguration];
    int v7 = [v8 usePhoneLandscapeSymbolConfiguration];
    objc_storeStrong((id *)&self->_displayMetrics, a3);
    if (v6 != v7) {
      [(MFConversationItemFooterView *)self _updateButtons];
    }
    [(MFConversationItemFooterView *)self setNeedsLayout];
  }
}

- (void)addTarget:(id)a3 action:(SEL)a4 toButton:(int64_t)a5
{
  id v9 = a3;
  if (a5 == 2)
  {
    id v8 = [(MFConversationItemFooterView *)self undoSendButton];
    [v8 addTarget:v9 action:a4 forControlEvents:64];
  }
  else if (a5 == 1)
  {
    id v8 = [(MFConversationItemFooterView *)self revealActionsButton];
    [v8 addTarget:v9 action:a4 forControlEvents:64];
  }
  else
  {
    if (a5) {
      goto LABEL_8;
    }
    id v8 = [(MFConversationItemFooterView *)self seeMoreButton];
    [v8 addTarget:v9 action:a4 forControlEvents:64];
  }

LABEL_8:
}

- (void)layoutSubviews
{
  v30.receiver = self;
  v30.super_class = (Class)MFConversationItemFooterView;
  [(MFConversationItemFooterView *)&v30 layoutSubviews];
  [(MFConversationItemFooterView *)self frame];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  id v9 = [(MFConversationItemFooterView *)self displayMetrics];
  [v9 estimatedFooterViewHeight];
  double v11 = v10;

  -[MFConversationItemFooterView setFrame:](self, "setFrame:", v4, v6, v8, v11);
  [(MFConversationItemFooterView *)self bounds];
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;
  v20 = [(MFConversationItemFooterView *)self backgroundView];
  objc_msgSend(v20, "setFrame:", v13, v15, v17, v19);

  -[MFConversationItemFooterView layoutActionButtonWithBounds:](self, "layoutActionButtonWithBounds:", v13, v15, v17, v19);
  [(MFConversationItemFooterView *)self layoutSeeMoreButton];
  if (_os_feature_enabled_impl()) {
    [(MFConversationItemFooterView *)self layoutUndoSendButton];
  }
  [(MFConversationItemFooterView *)self currentYOffset];
  -[MFConversationItemFooterView moveOriginYByOffset:](self, "moveOriginYByOffset:");
  if (self->_findOverlayView)
  {
    [(MFConversationItemFooterView *)self bounds];
    double v22 = v21;
    double v24 = v23;
    double v26 = v25;
    double v28 = v27;
    v29 = [(MFConversationItemFooterView *)self findOverlayView];
    objc_msgSend(v29, "setFrame:", v22, v24, v26, v28);
  }
}

- (void)layoutMarginsDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)MFConversationItemFooterView;
  [(MFConversationItemFooterView *)&v3 layoutMarginsDidChange];
  [(MFConversationItemFooterView *)self setNeedsLayout];
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  [(MFConversationItemFooterView *)self bounds];
  v10.CGFloat x = x;
  v10.CGFloat y = y;
  if (CGRectContainsPoint(v12, v10)) {
    return 1;
  }
  double v8 = [(MFConversationItemFooterView *)self seeMoreButton];
  [v8 frame];
  v11.CGFloat x = x;
  v11.CGFloat y = y;
  BOOL v7 = CGRectContainsPoint(v13, v11);

  return v7;
}

- (void)setBounds:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  [(MFConversationItemFooterView *)self bounds];
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  CGFloat v13 = v12;
  CGFloat v15 = v14;
  v19.receiver = self;
  v19.super_class = (Class)MFConversationItemFooterView;
  -[MFConversationItemFooterView setBounds:](&v19, sel_setBounds_, x, y, width, height);
  v20.origin.double x = v9;
  v20.origin.double y = v11;
  v20.size.double width = v13;
  v20.size.double height = v15;
  double v16 = CGRectGetHeight(v20);
  v21.origin.double x = x;
  v21.origin.double y = y;
  v21.size.double width = width;
  v21.size.double height = height;
  double v17 = v16 - CGRectGetHeight(v21);
  if (v17 < 0.0) {
    double v17 = -v17;
  }
  if (v17 >= 2.22044605e-16)
  {
    double v18 = [(MFConversationItemFooterView *)self delegate];
    [v18 footerViewDidChangeHeight:self];
  }
}

- (void)layoutSeeMoreButton
{
  objc_super v3 = [(MFConversationItemFooterView *)self seeMoreButton];
  if (([v3 isHidden] & 1) == 0)
  {
    [(MFConversationItemFooterView *)self bounds];
    if (v4 != 0.0)
    {
      [v3 frame];
      CGFloat rect = v5;
      CGFloat v7 = v6;
      double v9 = v8;
      double v10 = [(MFConversationItemFooterView *)self revealActionsButton];
      [v10 frame];
      CGFloat v12 = v11;
      CGFloat v14 = v13;
      CGFloat v16 = v15;
      CGFloat v18 = v17;

      objc_super v19 = [(MFConversationItemFooterView *)self displayMetrics];
      [v19 footerViewTopToBaseline];
      id v20 = v3;
      CGRect v21 = self;
      double v22 = [MEMORY[0x1E4F350E0] sharedFontMetricCache];
      v39[0] = MEMORY[0x1E4F143A8];
      v39[1] = 3221225472;
      v39[2] = __calculateYForSeeMoreButton_block_invoke;
      v39[3] = &unk_1E6D1AFD0;
      id v23 = v20;
      id v40 = v23;
      [v22 cachedFloat:v39 forKey:@"footerView.seeMoreButton.labelBaselineFromTop"];

      UIRoundToViewScale();
      double v25 = v24;

      if ([(MFConversationItemFooterView *)v21 effectiveUserInterfaceLayoutDirection] == 1)
      {
        CGFloat v36 = v12;
        CGFloat v37 = v18;
        [(MFConversationItemFooterView *)v21 layoutMargins];
        [(MFConversationItemFooterView *)v21 bounds];
        CGRectGetWidth(v41);
        v42.origin.double x = v7;
        v42.origin.double y = v25;
        v42.size.double width = rect;
        v42.size.double height = v9;
        CGRectGetWidth(v42);
        [(MFConversationItemFooterView *)v21 bounds];
        double Width = CGRectGetWidth(v43);
        [(MFConversationItemFooterView *)v21 layoutMargins];
        double v28 = v27;
        v44.origin.double x = v36;
        v44.size.double height = v37;
        v44.origin.double y = v14;
        v44.size.double width = v16;
        double MaxX = CGRectGetMaxX(v44);
        double MinX = Width - v28;
      }
      else
      {
        [(MFConversationItemFooterView *)v21 layoutMargins];
        CGFloat v32 = v31;
        v45.origin.double x = v12;
        v45.origin.double y = v14;
        v45.size.double width = v16;
        v45.size.double height = v18;
        double MinX = CGRectGetMinX(v45);
        v46.origin.double x = v32;
        v46.origin.double y = v25;
        v46.size.double width = rect;
        v46.size.double height = v9;
        double MaxX = CGRectGetMinX(v46);
      }
      UIRoundToViewScale();
      double x = v47.origin.x;
      v47.origin.double y = v25;
      v47.size.double width = rect;
      v47.size.double height = v9;
      double v34 = CGRectGetWidth(v47);
      if (v34 >= MinX - (MaxX + 10.0)) {
        double v35 = MinX - (MaxX + 10.0);
      }
      else {
        double v35 = v34;
      }
      objc_msgSend(v23, "setFrame:", x, v25, v35, v9);
      v48.origin.double x = x;
      v48.origin.double y = v25;
      v48.size.double width = v35;
      v48.size.double height = v9;
      [(MFConversationItemFooterView *)v21 setDefaultSeeMoreButtonOriginY:CGRectGetMinY(v48)];
    }
  }
}

- (void)layoutUndoSendButton
{
  v22[5] = *MEMORY[0x1E4F143B8];
  objc_super v3 = [(MFConversationItemFooterView *)self undoSendButton];
  if (([v3 isHidden] & 1) == 0)
  {
    [(MFConversationItemFooterView *)self bounds];
    if (v4 != 0.0
      && [(UIButton *)self->_seeMoreButton isHidden]
      && [(UIButton *)self->_revealActionsButton isHidden])
    {
      [v3 setTranslatesAutoresizingMaskIntoConstraints:0];
      double v5 = (void *)MEMORY[0x1E4F28DC8];
      CGRect v21 = [v3 leadingAnchor];
      CGFloat v18 = [(MFConversationItemFooterView *)self leadingAnchor];
      double v17 = objc_msgSend(v21, "constraintEqualToAnchor:");
      v22[0] = v17;
      id v20 = [v3 centerXAnchor];
      CGFloat v16 = [(MFConversationItemFooterView *)self centerXAnchor];
      double v15 = objc_msgSend(v20, "constraintEqualToAnchor:");
      v22[1] = v15;
      objc_super v19 = [v3 topAnchor];
      CGFloat v14 = [(MFConversationItemFooterView *)self topAnchor];
      double v6 = objc_msgSend(v19, "constraintEqualToAnchor:");
      v22[2] = v6;
      CGFloat v7 = [v3 centerYAnchor];
      double v8 = [(MFConversationItemFooterView *)self centerYAnchor];
      double v9 = [v7 constraintEqualToAnchor:v8];
      v22[3] = v9;
      double v10 = [v3 trailingAnchor];
      double v11 = [(MFConversationItemFooterView *)self trailingAnchor];
      CGFloat v12 = [v10 constraintEqualToAnchor:v11];
      v22[4] = v12;
      double v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v22 count:5];
      [v5 activateConstraints:v13];
    }
  }
}

- (BOOL)shouldHideStickyFooterView
{
  v2 = [(MFConversationItemFooterView *)self traitCollection];
  char v3 = objc_msgSend(v2, "mf_hasCompactDimension");

  return v3;
}

- (void)_fontMetricCacheDidInvalidate:(id)a3
{
  double v4 = [(MFConversationItemFooterView *)self displayMetrics];
  if ([v4 hasCompactLayout])
  {
    double v5 = [(id)*MEMORY[0x1E4FB2608] preferredContentSizeCategory];
    IsAccessibilityCategordouble y = UIContentSizeCategoryIsAccessibilityCategory(v5);

    if (IsAccessibilityCategory) {
      uint64_t v7 = 2;
    }
    else {
      uint64_t v7 = 1;
    }
  }
  else
  {

    uint64_t v7 = 1;
  }
  double v8 = [(MFConversationItemFooterView *)self seeMoreButton];
  double v9 = [v8 titleLabel];
  [v9 setNumberOfLines:v7];

  if (_os_feature_enabled_impl())
  {
    double v10 = [(MFConversationItemFooterView *)self undoSendButton];
    double v11 = [v10 titleLabel];
    [v11 setNumberOfLines:v7];
  }
  [(MFConversationItemFooterView *)self setNeedsLayout];
}

+ (UIFont)prefixFont
{
  v2 = [MEMORY[0x1E4F350E0] sharedFontMetricCache];
  char v3 = [v2 cachedFont:&__block_literal_global_3 forKey:@"conversationItemFooterView.prefixFont"];

  return (UIFont *)v3;
}

uint64_t __42__MFConversationItemFooterView_prefixFont__block_invoke()
{
  return [MEMORY[0x1E4FB08E0] systemFontOfSize:15.0];
}

+ (UIFont)nameFont
{
  v2 = [MEMORY[0x1E4F350E0] sharedFontMetricCache];
  char v3 = [v2 cachedPreferredFontForStyle:*MEMORY[0x1E4FB28E0]];

  return (UIFont *)v3;
}

- (void)layoutActionButtonWithBounds:(CGRect)a3
{
  double y = a3.origin.y;
  double height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat x = a3.origin.x;
  double v6 = [(MFConversationItemFooterView *)self revealActionsButton];
  uint64_t v7 = [(MFConversationItemFooterView *)self displayMetrics];
  int v8 = [(MFConversationItemFooterView *)self mf_prefersRightToLeftInterfaceLayout];
  [v6 frame];
  CGFloat v10 = v9;
  CGFloat v12 = v11;
  CGFloat v14 = v13;
  id v15 = v6;
  CGFloat v16 = self;
  if (*(double *)&calculatePadding_imageWidth == 0.0)
  {
    double v17 = objc_msgSend(v15, "imageView", *(double *)&calculatePadding_imageWidth);
    [v17 bounds];
    calculatePadding_imagedouble Width = v18;
  }
  v41.origin.CGFloat x = v10;
  v41.origin.double y = v12;
  v41.size.CGFloat width = 51.0;
  v41.size.double height = v14;
  CGRectGetWidth(v41);
  UIRoundToViewScale();

  [v7 footerViewTrailingButtonOrigin];
  double v20 = v19;
  CGRect v21 = [(MFConversationItemFooterView *)v16 traitCollection];
  uint64_t v22 = [v21 horizontalSizeClass];

  if (v22 != 1 || v20 == 2.22507386e-308)
  {
    [(MFConversationItemFooterView *)v16 layoutMargins];
    if (!v8)
    {
      v42.origin.CGFloat x = x;
      v42.origin.double y = y;
      v42.size.double height = height;
      v42.size.CGFloat width = width;
      CGRectGetWidth(v42);
      v43.origin.CGFloat x = v10;
      v43.origin.double y = v12;
      v43.size.CGFloat width = 51.0;
      v43.size.double height = v14;
      CGRectGetWidth(v43);
    }
  }
  UIRoundToViewScale();
  double v24 = v23;
  [v7 footerViewTopToBaseline];
  id v39 = v15;
  double v25 = v16;
  if (*(double *)&calculateFrameForActionButtonImageView_imageHeight == 0.0)
  {
    objc_msgSend(v39, "sizeToFit", *(double *)&calculateFrameForActionButtonImageView_imageHeight);
    double v26 = [v39 imageView];
    [v26 bounds];
    calculateFrameForActionButtonImageView_imagedouble Height = CGRectGetHeight(v44);

    double v27 = [v39 imageView];
    double v28 = [v27 image];
    [v28 baselineOffsetFromBottom];
    calculateFrameForActionButtonImageView_imageBaselineOffset = v29;
  }
  UIRoundToViewScale();
  double v31 = v30;
  double v32 = *(double *)&calculateFrameForActionButtonImageView_imageHeight;

  double v33 = -v31;
  if (v31 + v32 - (y + height) > -v31) {
    double v33 = v31 + v32 - (y + height);
  }
  CGFloat v34 = v24 + 0.0;
  CGFloat v35 = v31 + v33;
  CGFloat v36 = v32 - (v33 + v33);
  objc_msgSend(v39, "setFrame:", v34, v35, 51.0, v36);
  v45.origin.CGFloat x = v34;
  v45.origin.double y = v35;
  v45.size.CGFloat width = 51.0;
  v45.size.double height = v36;
  [(MFConversationItemFooterView *)v25 setDefaultRevealActionButtonOriginY:CGRectGetMinY(v45)];
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4 = a3;
  v5.receiver = self;
  v5.super_class = (Class)MFConversationItemFooterView;
  [(MFConversationItemFooterView *)&v5 traitCollectionDidChange:v4];
  [(MFConversationItemFooterView *)self _updateButtons];
  [(MFConversationItemFooterView *)self _updateBackgroundView];
  [(MFConversationItemFooterView *)self _updateSeeMoreButton];
  [(MFConversationItemFooterView *)self setNeedsLayout];
}

- (void)_updateButtons
{
  BOOL v3 = [(MFConversationItemFooterView *)self shouldHideStickyFooterView];
  double v4 = 0.0;
  if (!v3) {
    [(MFConversationItemFooterView *)self currentYOffset];
  }
  [(MFConversationItemFooterView *)self setCurrentYOffset:v4];
  id v7 = [(MFConversationItemFooterView *)self displayMetrics];
  if ([v7 usePhoneLandscapeSymbolConfiguration]) {
    uint64_t v5 = 17;
  }
  else {
    uint64_t v5 = 16;
  }

  id v8 = [(MFConversationItemFooterView *)self revealActionsButton];
  double v6 = objc_msgSend(MEMORY[0x1E4FB1818], "mf_symbolConfigurationForView:", v5);
  [v8 setPreferredSymbolConfiguration:v6 forImageInState:0];
}

- (void)moveOriginYByOffset:(double)a3
{
  -[MFConversationItemFooterView setCurrentYOffset:](self, "setCurrentYOffset:");
  UIRoundToViewScale();
  double v5 = v4;
  [(MFConversationItemFooterView *)self defaultRevealActionButtonOriginY];
  double v7 = v6;
  id v24 = [(MFConversationItemFooterView *)self revealActionsButton];
  [v24 frame];
  double MinY = CGRectGetMinY(v30);
  double v9 = v5 + v7;

  if (v9 != MinY)
  {
    id v25 = [(MFConversationItemFooterView *)self revealActionsButton];
    [v25 frame];
    double v11 = v10;
    double v13 = v12;
    double v15 = v14;

    id v26 = [(MFConversationItemFooterView *)self revealActionsButton];
    objc_msgSend(v26, "setFrame:", v11, v9, v13, v15);

    id v27 = [(MFConversationItemFooterView *)self seeMoreButton];
    [v27 frame];
    double v17 = v16;
    double v19 = v18;
    double v21 = v20;

    [(MFConversationItemFooterView *)self defaultSeeMoreButtonOriginY];
    double v23 = v5 + v22;
    id v28 = [(MFConversationItemFooterView *)self seeMoreButton];
    objc_msgSend(v28, "setFrame:", v17, v23, v19, v21);
  }
}

- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5
{
  id v6 = a5;
  if ([(MFConversationItemFooterView *)self allowsPointerSnapping]) {
    id v7 = v6;
  }
  else {
    id v7 = 0;
  }

  return v7;
}

- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4
{
  double v5 = [(MFConversationItemFooterView *)self revealActionsButton];
  id v6 = objc_msgSend(v5, "mf_revealActionButtonPointerStyleInView:", self);

  return v6;
}

- (void)addConversationSearchOverlay
{
  id v3 = [(MFConversationItemFooterView *)self findOverlayView];
  -[MFConversationItemFooterView bringSubviewToFront:](self, "bringSubviewToFront:");

  id v4 = [(MFConversationItemFooterView *)self findOverlayView];
  [v4 show];
}

- (void)removeConversationSearchOverlay
{
  id v3 = [(MFConversationItemFooterView *)self findOverlayView];
  [v3 hide];

  id v4 = [(MFConversationItemFooterView *)self findOverlayView];
  -[MFConversationItemFooterView sendSubviewToBack:](self, "sendSubviewToBack:");
}

- (UIVisualEffectView)backgroundView
{
  return self->_backgroundView;
}

- (void)setBackgroundView:(id)a3
{
}

- (BOOL)messageContainsBlockQuotes
{
  return self->_messageContainsBlockQuotes;
}

- (BOOL)blockquotesAreExpanded
{
  return self->_blockquotesAreExpanded;
}

- (BOOL)isSemiExpanded
{
  return self->_isSemiExpanded;
}

- (UIButton)revealActionsButton
{
  return self->_revealActionsButton;
}

- (void)setRevealActionsButton:(id)a3
{
}

- (MFMessageFooterViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (MFMessageFooterViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (MFMessageDisplayMetrics)displayMetrics
{
  return self->_displayMetrics;
}

- (BOOL)allowsPointerSnapping
{
  return self->_allowsPointerSnapping;
}

- (void)setAllowsPointerSnapping:(BOOL)a3
{
  self->_allowsPointerSnapping = a3;
}

- (double)defaultRevealActionButtonOriginY
{
  return self->_defaultRevealActionButtonOriginY;
}

- (void)setDefaultRevealActionButtonOriginY:(double)a3
{
  self->_defaultRevealActionButtonOriginY = a3;
}

- (double)defaultSeeMoreButtonOriginY
{
  return self->_defaultSeeMoreButtonOriginY;
}

- (void)setDefaultSeeMoreButtonOriginY:(double)a3
{
  self->_defaultSeeMoreButtonOriginY = a3;
}

- (double)defaultUndoSendButtonOriginY
{
  return self->_defaultUndoSendButtonOriginY;
}

- (void)setDefaultUndoSendButtonOriginY:(double)a3
{
  self->_defaultUndoSendButtonOriginY = a3;
}

- (EMCachingContactStore)contactStore
{
  return self->_contactStore;
}

- (void)setContactStore:(id)a3
{
}

- (double)currentYOffset
{
  return self->_currentYOffset;
}

- (void)setCurrentYOffset:(double)a3
{
  self->_currentYOffset = a3;
}

- (void)setFindOverlayView:(id)a3
{
}

- (UIButton)seeMoreButton
{
  return self->_seeMoreButton;
}

- (void)setSeeMoreButton:(id)a3
{
}

- (UIButton)undoSendButton
{
  return self->_undoSendButton;
}

- (void)setUndoSendButton:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_undoSendButton, 0);
  objc_storeStrong((id *)&self->_seeMoreButton, 0);
  objc_storeStrong((id *)&self->_findOverlayView, 0);
  objc_storeStrong((id *)&self->_contactStore, 0);
  objc_storeStrong((id *)&self->_displayMetrics, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_revealActionsButton, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
}

@end