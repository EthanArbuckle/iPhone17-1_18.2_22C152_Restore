@interface TabBarItemView
- (BOOL)_canUseCachedTitleTruncationOnBoundsChange;
- (BOOL)_hasRoomForIconAndCloseButton;
- (BOOL)_isHovering;
- (BOOL)_isHoveringOverCloseButton;
- (BOOL)_isPinnedAndNarrow;
- (BOOL)_showsCloseButton;
- (BOOL)_showsParticipants;
- (BOOL)_showsUnreadIndicator;
- (BOOL)hidesTitleText;
- (BOOL)isActive;
- (BOOL)isPinned;
- (BOOL)isPlaceholder;
- (BOOL)isReordering;
- (BOOL)isUnread;
- (CGRect)_closeButtonFrame;
- (CGRect)_titleBoundingBox;
- (CGRect)_titleBounds;
- (NSArray)shareParticipants;
- (TabBarItemView)initWithTabBar:(id)a3;
- (UIButton)closeButton;
- (UIButton)mediaStateMuteButton;
- (UIImage)icon;
- (double)_contentWidthIgnoringCollaborationViews;
- (double)contentOffset;
- (double)titleAnchorAdditionalOffset;
- (double)titleLayoutWidth;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (int64_t)_iconPosition;
- (int64_t)_physicalEdgeForLogicalEdge:(int64_t)a3;
- (int64_t)titleAnchorEdge;
- (int64_t)visibleEdge;
- (unint64_t)mediaStateIcon;
- (void)_hover:(id)a3;
- (void)_layOutParticipantsView;
- (void)_layOutUnreadIndicator;
- (void)_layoutCloseButton;
- (void)_layoutEdges;
- (void)_layoutMediaStateIndicator;
- (void)_layoutTitleClipperView;
- (void)_layoutTitleLabel;
- (void)_layoutTitleLabelUsingCachedTruncation;
- (void)_showOrHideCloseButton;
- (void)_updateCloseButtonAlpha;
- (void)_updateCloseButtonEffect;
- (void)_updateCloseButtonImage;
- (void)_updateHighlightAlpha;
- (void)_updateIconViewVisibility;
- (void)_updateMediaStateButtonButtonAlpha;
- (void)_updateMediaStateIndicator;
- (void)_updateShowsParticipants;
- (void)_updateShowsUnreadIndicator;
- (void)configureForDragPreview;
- (void)setActive:(BOOL)a3;
- (void)setBounds:(CGRect)a3;
- (void)setContentOffset:(double)a3;
- (void)setFrame:(CGRect)a3;
- (void)setHidesTitleText:(BOOL)a3;
- (void)setIcon:(id)a3;
- (void)setIsPlaceholder:(BOOL)a3;
- (void)setMediaStateIcon:(unint64_t)a3;
- (void)setPinned:(BOOL)a3;
- (void)setReordering:(BOOL)a3;
- (void)setShareParticipants:(id)a3;
- (void)setTitleAnchorAdditionalOffset:(double)a3;
- (void)setTitleAnchorEdge:(int64_t)a3;
- (void)setTitleLayoutWidth:(double)a3;
- (void)setTitleText:(id)a3;
- (void)setUnread:(BOOL)a3;
- (void)setVisibleEdge:(int64_t)a3;
- (void)updateTabBarStyle;
@end

@implementation TabBarItemView

uint64_t __56__TabBarItemView__layoutTitleLabelUsingCachedTruncation__block_invoke(uint64_t a1, void *a2)
{
  return [a2 title];
}

- (void)setFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  [(TabBarItemView *)self bounds];
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  CGFloat v13 = v12;
  CGFloat v15 = v14;
  v20.receiver = self;
  v20.super_class = (Class)TabBarItemView;
  -[TabBarItemView setFrame:](&v20, sel_setFrame_, x, y, width, height);
  [(TabBarItemView *)self bounds];
  v22.origin.double x = v16;
  v22.origin.double y = v17;
  v22.size.double width = v18;
  v22.size.double height = v19;
  v21.origin.double x = v9;
  v21.origin.double y = v11;
  v21.size.double width = v13;
  v21.size.double height = v15;
  if (!CGRectEqualToRect(v21, v22))
  {
    [(TabBarItemView *)self _layoutCloseButton];
    [(TabBarItemView *)self _layoutEdges];
    [(TabBarItemView *)self _layoutTitleClipperView];
    [(TabBarItemView *)self _layoutMediaStateIndicator];
    [(TabBarItemView *)self _updateShowsParticipants];
    [(TabBarItemView *)self _updateShowsUnreadIndicator];
    if ([(TabBarItemView *)self _canUseCachedTitleTruncationOnBoundsChange])
    {
      [(TabBarItemView *)self _layoutTitleLabelUsingCachedTruncation];
    }
    else
    {
      [(TabBarItemView *)self _layoutTitleLabel];
    }
  }
}

- (void)_showOrHideCloseButton
{
  [(TabBarItemView *)self _layoutTitleLabel];
  [(TabBarItemView *)self _layoutEdges];
  [(TabBarItemView *)self _layoutCloseButton];
  [(TabBarItemView *)self _updateCloseButtonAlpha];
  [(TabBarItemView *)self _updateIconViewVisibility];
}

- (void)_layoutEdges
{
  [(TabBarItemView *)self bounds];
  CGFloat v4 = v3;
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  int64_t v11 = [(TabBarItemView *)self _physicalEdgeForLogicalEdge:self->_visibleEdge];
  if (v11)
  {
    int64_t v12 = v11;
    v23.origin.double x = v4;
    v23.origin.double y = v6;
    v23.size.double width = v8;
    v23.size.double height = v10;
    if (!CGRectEqualToRect(v23, *MEMORY[0x1E4F1DB28]))
    {
      _SFOnePixel();
      double v15 = v14;
      double v16 = 0.0;
      if (v12 != 1)
      {
        v24.origin.double x = v4;
        v24.origin.double y = v6;
        v24.size.double width = v8;
        v24.size.double height = v10;
        double v16 = CGRectGetMaxX(v24) - v15;
      }
      v21[0] = MEMORY[0x1E4F143A8];
      v21[1] = 3221225472;
      v21[2] = __30__TabBarItemView__layoutEdges__block_invoke;
      v21[3] = &unk_1E6D7C1F8;
      v21[4] = self;
      *(double *)&v21[5] = v16;
      *(double *)&v21[6] = v15;
      *(CGFloat *)&v21[7] = v4;
      *(CGFloat *)&v21[8] = v6;
      *(CGFloat *)&v21[9] = v8;
      *(CGFloat *)&v21[10] = v10;
      CGFloat v17 = (void (**)(void))MEMORY[0x1E4E42950](v21);
      [(UIVisualEffectView *)self->_borderEffectsView frame];
      double MinX = CGRectGetMinX(v25);
      if (MinX != 0.0 && v16 != 0.0 && MinX != v16)
      {
        id WeakRetained = objc_loadWeakRetained((id *)&self->_tabBar);
        if ([WeakRetained isDraggingItem])
        {
        }
        else
        {
          char v20 = [(UIVisualEffectView *)self->_borderEffectsView isHidden];

          if ((v20 & 1) == 0)
          {
            v17[2](v17);
            goto LABEL_15;
          }
        }
      }
      [MEMORY[0x1E4FB1EB0] performWithoutAnimation:v17];
LABEL_15:

      return;
    }
  }
  borderEffectsView = self->_borderEffectsView;
  [(UIVisualEffectView *)borderEffectsView setHidden:1];
}

- (void)_layoutCloseButton
{
  [(TabBarItemView *)self _closeButtonFrame];
  CGRect v9 = CGRectOffset(v8, self->_contentOffset, 0.0);
  -[UIButton setFrame:](self->_closeButton, "setFrame:", v9.origin.x, v9.origin.y, v9.size.width, v9.size.height);
  -[UIImageView sizeThatFits:](self->_closeButtonImageView, "sizeThatFits:", *MEMORY[0x1E4F1DB30], *(double *)(MEMORY[0x1E4F1DB30] + 8));
  -[UIVisualEffectView setBounds:](self->_closeButtonEffectsView, "setBounds:", 0.0, 0.0, v3, v4);
  [(UIButton *)self->_closeButton bounds];
  CGFloat Height = CGRectGetHeight(v10);
  -[UIVisualEffectView setCenter:](self->_closeButtonEffectsView, "setCenter:", Height * 0.5, Height * 0.5);
  [(UIVisualEffectView *)self->_closeButtonEffectsView frame];
  _SFRoundRectToPixels();
  -[UIVisualEffectView setFrame:](self->_closeButtonEffectsView, "setFrame:");
  [(UIVisualEffectView *)self->_closeButtonEffectsView bounds];
  closeButtonImageView = self->_closeButtonImageView;
  -[UIImageView setFrame:](closeButtonImageView, "setFrame:");
}

- (CGRect)_closeButtonFrame
{
  [(TabBarItemView *)self bounds];
  [(TabBarItemView *)self _sf_usesLeftToRightLayout];
  _SFRoundRectToPixels();
  result.size.double height = v6;
  result.size.double width = v5;
  result.origin.double y = v4;
  result.origin.double x = v3;
  return result;
}

- (void)_layoutTitleLabel
{
  truncatedTitleText = self->_truncatedTitleText;
  self->_truncatedTitleText = 0;

  [(TabBarItemView *)self _layoutTitleLabelUsingCachedTruncation];
}

- (void)_layoutTitleLabelUsingCachedTruncation
{
  [(TabBarItemView *)self _titleBounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  [(TabBarItemView *)self _titleBoundingBox];
  CGFloat rect_24 = v11;
  CGFloat v13 = v12;
  double v88 = v14;
  double v89 = v15;
  double v16 = +[TabIconAndTitleView defaultTabIconSize]();
  double v18 = v17;
  int64_t v19 = [(TabBarItemView *)self _iconPosition];
  double v79 = v16 + 4.0;
  double v80 = v18;
  if (v19 == 1) {
    double v20 = v16 + 4.0;
  }
  else {
    double v20 = 0.0;
  }
  double v91 = v16;
  if (!self->_truncatedTitleText)
  {
    CGRect v21 = [(UILabel *)self->_titleLabel font];
    long long v92 = *MEMORY[0x1E4F1DB30];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_tabBar);
    CGRect v23 = [WeakRetained items];
    CGRect v24 = objc_msgSend(v23, "safari_mapObjectsUsingBlock:", &__block_literal_global_48);

    CGRect v25 = [(NSString *)self->_titleText truncatedTitleWithFont:v21 desiredWidth:&v92 truncatedSize:v24 tabBarItemTitles:v88 - v20];
    truncatedTitleText = self->_truncatedTitleText;
    self->_truncatedTitleText = v25;

    -[NSString _legacy_sizeWithFont:constrainedToSize:lineBreakMode:](self->_truncatedTitleText, "_legacy_sizeWithFont:constrainedToSize:lineBreakMode:", v21, 4, v88 - v20, v89);
    self->_truncatedTitleTextSize.double width = v27;
    self->_truncatedTitleTextSize.CGFloat height = v28;
    double v29 = *(double *)&v92;
    self->_titleWasTruncated = *(double *)&v92 > v88;
    -[UILabel setText:](self->_titleLabel, "setText:", self->_truncatedTitleText, v29);
  }
  _SFCeilingFloatToPixels();
  CGFloat v31 = v30;
  CGFloat v76 = v8;
  _SFRoundFloatToPixels();
  CGFloat v78 = v4;
  CGFloat v33 = v4 + v32;
  CGFloat rect = v4 + v32;
  CGFloat v75 = v10;
  _SFRoundFloatToPixels();
  CGFloat v77 = v6;
  double v34 = v20;
  double v36 = v6 + v35;
  double v86 = v34;
  _SFCeilingFloatToPixels();
  CGFloat v38 = v37;
  int v39 = [(TabBarItemView *)self _sf_usesLeftToRightLayout];
  v93.origin.CGFloat x = v33;
  v93.origin.double y = v36;
  v93.size.double width = v38;
  v93.size.CGFloat height = v31;
  double rect_8 = CGRectGetMinX(v93);
  v94.origin.CGFloat x = rect_24;
  v94.origin.double y = v13;
  v94.size.double width = v88;
  v94.size.CGFloat height = v89;
  double MinX = CGRectGetMinX(v94);
  v95.origin.CGFloat x = rect_24;
  v95.origin.double y = v13;
  double v41 = v38;
  v95.size.double width = v88;
  v95.size.CGFloat height = v89;
  double MaxX = CGRectGetMaxX(v95);
  v96.origin.CGFloat x = rect;
  CGFloat v90 = v36;
  v96.origin.double y = v36;
  v96.size.double width = v38;
  CGFloat v43 = v31;
  v96.size.CGFloat height = v31;
  double v44 = fmax(MinX, fmin(MaxX - CGRectGetWidth(v96), rect_8));
  if (v19 == 3)
  {
    double v45 = v91 * 0.5 + 4.0;
    int v46 = [(TabBarItemView *)self _sf_usesLeftToRightLayout];
    [(TabBarItemView *)self bounds];
    double MidX = CGRectGetMidX(v97);
    if (v46)
    {
      double v44 = v45 + MidX;
    }
    else
    {
      double v48 = MidX - v45;
      v98.origin.CGFloat x = v44;
      v98.origin.double y = v36;
      v98.size.double width = v41;
      v98.size.CGFloat height = v31;
      double v44 = v48 - CGRectGetWidth(v98);
    }
  }
  double contentOffset = self->_contentOffset;
  int64_t v50 = [(TabBarItemView *)self _physicalEdgeForLogicalEdge:self->_titleAnchorEdge];
  if (v50 == 2)
  {
    double contentOffset = contentOffset - self->_titleAnchorAdditionalOffset;
  }
  else if (v50 == 1)
  {
    double contentOffset = contentOffset + self->_titleAnchorAdditionalOffset;
  }
  double v51 = v41 - v86;
  double v52 = -0.0;
  if (((v19 == 1) & v39) != 0) {
    double v52 = v79;
  }
  double v53 = v52 + v44 + contentOffset;
  if (v19) {
    BOOL v54 = !self->_hidesTitleText;
  }
  else {
    BOOL v54 = 0;
  }
  unsigned int v55 = v54;
  [(UIImageView *)self->_iconView setAlpha:(double)v55];
  -[UIImageView setBounds:](self->_iconView, "setBounds:", 0.0, 0.0, v91, v80);
  v56 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
  [(UIImageView *)self->_iconView setTintColor:v56];

  LODWORD(v56) = [(TabBarItemView *)self _hasRoomForIconAndCloseButton];
  [(TabBarItemView *)self bounds];
  CGFloat v61 = v57;
  CGFloat v62 = v58;
  CGFloat v63 = v59;
  CGFloat v64 = v60;
  if (v56)
  {
    v99.origin.CGFloat x = v53;
    v99.origin.double y = v90;
    v99.size.CGFloat height = v43;
    v99.size.double width = v51;
    CGRectGetMidY(v99);
    if (v19 != 3)
    {
      double v65 = v53;
      CGFloat v66 = v90;
      double v67 = v51;
      CGFloat v68 = v43;
      if (v39) {
        CGRectGetMinX(*(CGRect *)&v65);
      }
      else {
        CGRectGetMaxX(*(CGRect *)&v65);
      }
      goto LABEL_32;
    }
LABEL_29:
    v103.origin.CGFloat x = v61;
    v103.origin.double y = v62;
    v103.size.double width = v63;
    v103.size.CGFloat height = v64;
    CGRectGetMidX(v103);
    goto LABEL_32;
  }
  CGRectGetMidY(*(CGRect *)&v57);
  if (v19 == 3) {
    goto LABEL_29;
  }
  v100.origin.double y = v77;
  v100.origin.CGFloat x = v78;
  v100.size.CGFloat height = v75;
  v100.size.double width = v76;
  CGRect v101 = CGRectOffset(v100, contentOffset, 0.0);
  CGFloat x = v101.origin.x;
  CGFloat rect_16 = v101.origin.y;
  CGFloat rect_24a = v101.size.width;
  CGFloat height = v101.size.height;
  double v70 = v53;
  CGFloat v71 = v90;
  double v72 = v51;
  CGFloat v73 = v43;
  if (v39)
  {
    CGRectGetMinX(*(CGRect *)&v70);
    v102.size.CGFloat height = height;
    v102.origin.CGFloat x = x;
    v102.origin.double y = rect_16;
    v102.size.double width = rect_24a;
    CGRectGetMinX(v102);
  }
  else
  {
    CGRectGetMaxX(*(CGRect *)&v70);
    v104.size.CGFloat height = height;
    v104.origin.CGFloat x = x;
    v104.origin.double y = rect_16;
    v104.size.double width = rect_24a;
    CGRectGetMaxX(v104);
  }
LABEL_32:
  _SFRoundPointToPixels();
  -[UIImageView setCenter:](self->_iconView, "setCenter:");
  _SFRoundRectToPixels();
  -[UILabel setFrame:](self->_titleLabel, "setFrame:");
  double v74 = 0.0;
  if (v19 != 3) {
    double v74 = 1.0;
  }
  [(UILabel *)self->_titleLabel setAlpha:v74];
  [(TabBarItemView *)self _updateCloseButtonAlpha];
  [(TabBarItemView *)self _updateMediaStateButtonButtonAlpha];
}

- (int64_t)_physicalEdgeForLogicalEdge:(int64_t)a3
{
  if (a3 == 2)
  {
    if ([(TabBarItemView *)self _sf_usesLeftToRightLayout]) {
      return 2;
    }
    else {
      return 1;
    }
  }
  else if (a3 == 1)
  {
    if ([(TabBarItemView *)self _sf_usesLeftToRightLayout]) {
      return 1;
    }
    else {
      return 2;
    }
  }
  else
  {
    return 0;
  }
}

- (CGRect)_titleBounds
{
  [(TabBarItemView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double titleLayoutWidth = v7;
  double v10 = v9;
  if (self->_titleLayoutWidth != 0.0)
  {
    int64_t v11 = [(TabBarItemView *)self _physicalEdgeForLogicalEdge:self->_titleAnchorEdge];
    if (v11 == 2)
    {
      double v4 = v4 - (self->_titleLayoutWidth - titleLayoutWidth);
      double titleLayoutWidth = self->_titleLayoutWidth;
    }
    else if (v11 == 1)
    {
      double titleLayoutWidth = self->_titleLayoutWidth;
    }
  }
  double v12 = v4;
  double v13 = v6;
  double v14 = titleLayoutWidth;
  double v15 = v10;
  result.size.CGFloat height = v15;
  result.size.double width = v14;
  result.origin.double y = v13;
  result.origin.CGFloat x = v12;
  return result;
}

- (BOOL)_hasRoomForIconAndCloseButton
{
  [(TabBarItemView *)self bounds];
  double Width = CGRectGetWidth(v8);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_tabBar);
  [WeakRetained minimumTabWidth];
  BOOL v6 = Width > v5 + +[TabIconAndTitleView defaultTabIconSize]() + 4.0;

  return v6;
}

- (void)_updateIconViewVisibility
{
  BOOL v3 = self->_hidesTitleText || [(TabBarItemView *)self _iconPosition] == 0;
  iconView = self->_iconView;
  [(UIImageView *)iconView setHidden:v3];
}

- (void)_updateCloseButtonAlpha
{
  [(TabBarItemView *)self bounds];
  double v4 = v3;
  [(UILabel *)self->_titleLabel frame];
  double v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  CGFloat v12 = v11;
  if ([(TabBarItemView *)self _sf_usesLeftToRightLayout])
  {
    double v13 = v6 + 1.0 - v4;
  }
  else
  {
    v17.origin.CGFloat x = v6;
    v17.origin.double y = v8;
    v17.size.double width = v10;
    v17.size.CGFloat height = v12;
    double v13 = -1.0 - CGRectGetMaxX(v17);
  }
  double v14 = 0.0;
  if (v13 <= 0.0) {
    double v14 = (double)[(TabBarItemView *)self _showsCloseButton];
  }
  [(UIButton *)self->_closeButton alpha];
  if (v15 != v14)
  {
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __41__TabBarItemView__updateCloseButtonAlpha__block_invoke;
    v16[3] = &unk_1E6D785E8;
    v16[4] = self;
    *(double *)&v16[5] = v14;
    [MEMORY[0x1E4FB1EB0] animateWithDuration:v16 animations:0.2];
  }
}

- (void)_updateMediaStateButtonButtonAlpha
{
  [(TabBarItemView *)self bounds];
  double v3 = 0.0;
  if (CGRectGetWidth(v6) >= self->_titleLayoutWidth) {
    double v3 = (double)([(TabBarItemView *)self _isPinnedAndNarrow] ^ 1);
  }
  [(UIButton *)self->_mediaStateMuteButton alpha];
  if (v4 != v3)
  {
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __52__TabBarItemView__updateMediaStateButtonButtonAlpha__block_invoke;
    v5[3] = &unk_1E6D785E8;
    v5[4] = self;
    *(double *)&v5[5] = v3;
    [MEMORY[0x1E4FB1EB0] animateWithDuration:v5 animations:0.2];
  }
}

- (CGRect)_titleBoundingBox
{
  [(TabBarItemView *)self _titleBounds];
  double height = v32.size.height;
  CGRect v33 = CGRectInset(v32, 12.0, 12.0);
  double x = v33.origin.x;
  CGFloat y = v33.origin.y;
  double width = v33.size.width;
  int v7 = [(TabBarItemView *)self _sf_usesLeftToRightLayout];
  if ([(TabBarItemView *)self _showsCloseButton] || self->_icon || _SFDeviceIsPad())
  {
    [(TabBarItemView *)self _closeButtonFrame];
    CGFloat v12 = v8;
    CGFloat v13 = v9;
    CGFloat v14 = v10;
    CGFloat v15 = v11;
    if (v7)
    {
      double MaxX = CGRectGetMaxX(*(CGRect *)&v8);
    }
    else
    {
      [(TabBarItemView *)self bounds];
      double v31 = height;
      double v17 = y;
      double v18 = CGRectGetWidth(v34);
      v35.origin.double x = v12;
      v35.origin.CGFloat y = v13;
      v35.size.double width = v14;
      v35.size.double height = v15;
      double MaxX = v18 - CGRectGetMinX(v35);
      CGFloat y = v17;
      double height = v31;
    }
    double v19 = MaxX + -12.0;
    double v20 = -0.0;
    if (v7) {
      double v20 = v19;
    }
    double x = x + v20;
    double width = width - v19;
  }
  if (self->_mediaStateIcon)
  {
    [(UIButton *)self->_mediaStateMuteButton frame];
    double v22 = -0.0;
    if (!v7) {
      double v22 = v21 + 6.0;
    }
    double x = x + v22;
    double width = width - (v21 + 6.0);
  }
  if ([(TabBarItemView *)self _showsParticipants])
  {
    [(SFAvatarStackView *)self->_participantsView bounds];
    double v23 = CGRectGetWidth(v36) + 6.0;
    double v24 = -0.0;
    if (!v7) {
      double v24 = v23;
    }
    double x = x + v24;
    double width = width - v23;
  }
  if ([(TabBarItemView *)self _showsUnreadIndicator])
  {
    [(SFUnreadIndicator *)self->_unreadIndicator bounds];
    double v25 = CGRectGetWidth(v37) + 6.0;
    double v26 = -0.0;
    if (!v7) {
      double v26 = v25;
    }
    double x = x + v26;
    double width = width - v25;
  }
  double v27 = height + -12.0;
  double v28 = x;
  double v29 = y;
  double v30 = width;
  result.size.double height = v27;
  result.size.double width = v30;
  result.origin.CGFloat y = v29;
  result.origin.double x = v28;
  return result;
}

- (BOOL)_showsCloseButton
{
  if (self->_pinned && !self->_hidesTitleText) {
    return ![(TabBarItemView *)self _isPinnedAndNarrow];
  }
  if ([(TabBarItemView *)self _isHovering]) {
    return 1;
  }
  return self->_active;
}

- (BOOL)_isHovering
{
  if ((unint64_t)([(UIHoverGestureRecognizer *)self->_hoverRecognizer state] - 1) > 1) {
    return 0;
  }
  [(TabBarItemView *)self bounds];
  return CGRectGetWidth(v4) >= self->_titleLayoutWidth;
}

- (BOOL)_showsParticipants
{
  if ([(TabBarItemView *)self _isPinnedAndNarrow])
  {
    LOBYTE(v3) = 0;
  }
  else
  {
    NSUInteger v3 = [(NSArray *)self->_shareParticipants count];
    if (v3)
    {
      [(TabBarItemView *)self _contentWidthIgnoringCollaborationViews];
      double v5 = v4;
      [(SFAvatarStackView *)self->_participantsView sizeForParticipantCount:[(NSArray *)self->_shareParticipants count]];
      LOBYTE(v3) = self->_titleLayoutWidth >= v5 + v6 + 6.0;
    }
  }
  return v3;
}

- (BOOL)_showsUnreadIndicator
{
  if ([(TabBarItemView *)self _isPinnedAndNarrow] || !self->_unread) {
    return 0;
  }
  [(TabBarItemView *)self _contentWidthIgnoringCollaborationViews];
  double v4 = v3;
  double v5 = [(TabBarItemView *)self shareParticipants];
  if ([v5 count])
  {
    [(SFAvatarStackView *)self->_participantsView sizeForParticipantCount:[(NSArray *)self->_shareParticipants count]];
    double v7 = v6 + 6.0;
  }
  else
  {
    double v7 = 0.0;
  }
  double v9 = v4 + v7;
  [(SFUnreadIndicator *)self->_unreadIndicator intrinsicContentSize];
  double v11 = v9 + v10 + 6.0;

  return self->_titleLayoutWidth >= v11;
}

- (int64_t)_iconPosition
{
  if ([(TabBarItemView *)self _isPinnedAndNarrow]) {
    return 3;
  }
  if (!self->_icon) {
    return 0;
  }
  if ([(TabBarItemView *)self _hasRoomForIconAndCloseButton]) {
    return 1;
  }
  if (self->_icon && ![(TabBarItemView *)self _showsCloseButton]) {
    return 2;
  }
  else {
    return 0;
  }
}

- (BOOL)_isPinnedAndNarrow
{
  return self->_pinned && self->_titleLayoutWidth < 50.0;
}

- (void)_layoutMediaStateIndicator
{
  double v3 = [(UIButton *)self->_mediaStateMuteButton superview];

  if (v3)
  {
    [(TabBarItemView *)self bounds];
    [(TabBarItemView *)self _sf_usesLeftToRightLayout];
    double v4 = [(UIButton *)self->_mediaStateMuteButton imageForState:0];
    [v4 size];

    _SFRoundRectToPixels();
    mediaStateMuteButton = self->_mediaStateMuteButton;
    -[UIButton setFrame:](mediaStateMuteButton, "setFrame:");
  }
}

- (BOOL)_canUseCachedTitleTruncationOnBoundsChange
{
  return (unint64_t)(self->_titleAnchorEdge - 1) < 2;
}

uint64_t __52__TabBarItemView__updateMediaStateButtonButtonAlpha__block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 568) setAlpha:*(double *)(a1 + 40)];
}

- (void)setVisibleEdge:(int64_t)a3
{
  if (self->_visibleEdge != a3)
  {
    self->_visibleEdge = a3;
    [(TabBarItemView *)self _layoutEdges];
    [(TabBarItemView *)self _layoutTitleClipperView];
  }
}

- (void)setTitleLayoutWidth:(double)a3
{
  if (self->_titleLayoutWidth != a3)
  {
    self->_double titleLayoutWidth = a3;
    truncatedTitleText = self->_truncatedTitleText;
    self->_truncatedTitleText = 0;

    [(TabBarItemView *)self _updateIconViewVisibility];
  }
}

- (void)setHidesTitleText:(BOOL)a3
{
  self->_hidesTitleText = a3;
  -[UILabel setHidden:](self->_titleLabel, "setHidden:");
  [(TabBarItemView *)self _updateIconViewVisibility];
  [(TabBarItemView *)self _showOrHideCloseButton];
}

- (void)setContentOffset:(double)a3
{
  if (self->_contentOffset != a3)
  {
    self->_double contentOffset = a3;
    [(TabBarItemView *)self setNeedsLayout];
  }
}

- (void)setTitleAnchorAdditionalOffset:(double)a3
{
  if (self->_titleAnchorAdditionalOffset != a3)
  {
    self->_titleAnchorAdditionalOffset = a3;
    [(TabBarItemView *)self setNeedsLayout];
  }
}

- (UIButton)closeButton
{
  return self->_closeButton;
}

- (void)setActive:(BOOL)a3
{
  if (self->_active != a3)
  {
    self->_active = a3;
    -[TabBarItemView setClipsToBounds:](self, "setClipsToBounds:");
    id WeakRetained = objc_loadWeakRetained((id *)&self->_tabBar);

    if (WeakRetained)
    {
      v5[0] = MEMORY[0x1E4F143A8];
      v5[1] = 3221225472;
      v5[2] = __28__TabBarItemView_setActive___block_invoke;
      v5[3] = &unk_1E6D77E20;
      v5[4] = self;
      [MEMORY[0x1E4FB1EB0] performWithoutAnimation:v5];
      [(UIButton *)self->_closeButton setPointerInteractionEnabled:0];
      [(UIButton *)self->_closeButton setPointerInteractionEnabled:1];
    }
  }
}

- (void)setUnread:(BOOL)a3
{
  if (self->_unread != a3)
  {
    self->_unread = a3;
    [(TabBarItemView *)self _updateShowsUnreadIndicator];
  }
}

- (void)setTitleText:(id)a3
{
  double v4 = (NSString *)a3;
  double v5 = v4;
  if (self->_titleText != v4)
  {
    double v9 = v4;
    BOOL v6 = -[NSString isEqualToString:](v4, "isEqualToString:");
    double v5 = v9;
    if (!v6)
    {
      double v7 = (NSString *)[(NSString *)v9 copy];
      titleText = self->_titleText;
      self->_titleText = v7;

      [(TabBarItemView *)self _layoutTitleLabel];
      double v5 = v9;
    }
  }
}

- (void)setTitleAnchorEdge:(int64_t)a3
{
  self->_titleAnchorEdge = a3;
}

- (void)setReordering:(BOOL)a3
{
  self->_reordering = a3;
}

- (void)setPinned:(BOOL)a3
{
  if (self->_pinned != a3)
  {
    self->_pinned = a3;
    [(UIButton *)self->_closeButton setEnabled:!a3];
    [(TabBarItemView *)self _updateCloseButtonImage];
    [(TabBarItemView *)self _updateCloseButtonEffect];
    [(TabBarItemView *)self _updateCloseButtonAlpha];
    [(TabBarItemView *)self _layoutCloseButton];
    [(TabBarItemView *)self setNeedsLayout];
  }
}

- (void)setMediaStateIcon:(unint64_t)a3
{
  if (self->_mediaStateIcon != a3)
  {
    self->_mediaStateIcon = a3;
    [(TabBarItemView *)self _updateMediaStateIndicator];
    [(TabBarItemView *)self _updateShowsParticipants];
    [(TabBarItemView *)self _updateShowsUnreadIndicator];
    [(TabBarItemView *)self _layoutTitleLabel];
  }
}

- (void)setIsPlaceholder:(BOOL)a3
{
  if (self->_isPlaceholder != a3)
  {
    self->_isPlaceholder = a3;
    [(UIHoverGestureRecognizer *)self->_hoverRecognizer setEnabled:!a3];
  }
}

- (UIButton)mediaStateMuteButton
{
  return self->_mediaStateMuteButton;
}

- (BOOL)isPlaceholder
{
  return self->_isPlaceholder;
}

- (BOOL)hidesTitleText
{
  return self->_hidesTitleText;
}

uint64_t __45__TabBarItemView__updateShowsUnreadIndicator__block_invoke_3(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) _showsUnreadIndicator] ^ 1;
  double v3 = *(void **)(*(void *)(a1 + 32) + 544);
  return [v3 setHidden:v2];
}

uint64_t __42__TabBarItemView__updateShowsParticipants__block_invoke_2(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) _showsParticipants] ^ 1;
  double v3 = *(void **)(*(void *)(a1 + 32) + 536);
  return [v3 setHidden:v2];
}

uint64_t __42__TabBarItemView__updateShowsParticipants__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _layOutParticipantsView];
  [*(id *)(a1 + 32) _layOutUnreadIndicator];
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 536);
  return [v2 layoutIfNeeded];
}

- (void)_layOutUnreadIndicator
{
  [(TabBarItemView *)self _titleBounds];
  CGFloat v4 = v3;
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  [(SFUnreadIndicator *)self->_unreadIndicator intrinsicContentSize];
  v16.origin.double x = v4;
  v16.origin.CGFloat y = v6;
  v16.size.double width = v8;
  v16.size.double height = v10;
  CGRectGetHeight(v16);
  v17.origin.double x = v4;
  v17.origin.CGFloat y = v6;
  v17.size.double width = v8;
  v17.size.double height = v10;
  double Width = CGRectGetWidth(v17);
  if (self->_mediaStateIcon)
  {
    [(UIButton *)self->_mediaStateMuteButton bounds];
    double Width = CGRectGetWidth(v18);
    double v12 = 6.0;
  }
  CGFloat v13 = [(TabBarItemView *)self shareParticipants];
  if ([v13 count])
  {
    [(SFAvatarStackView *)self->_participantsView bounds];
    CGRectGetWidth(v19);
  }

  [(TabBarItemView *)self _sf_usesLeftToRightLayout];
  _SFFlipRectInCoordinateSpace();
  _SFRoundRectToPixels();
  unreadIndicator = self->_unreadIndicator;
  -[SFUnreadIndicator ss_setUntransformedFrame:](unreadIndicator, "ss_setUntransformedFrame:");
}

- (NSArray)shareParticipants
{
  return self->_shareParticipants;
}

- (void)_layOutParticipantsView
{
  [(TabBarItemView *)self _titleBounds];
  CGFloat v4 = v3;
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  [(SFAvatarStackView *)self->_participantsView intrinsicContentSize];
  v13.origin.double x = v4;
  v13.origin.CGFloat y = v6;
  v13.size.double width = v8;
  v13.size.double height = v10;
  CGRectGetHeight(v13);
  v14.origin.double x = v4;
  v14.origin.CGFloat y = v6;
  v14.size.double width = v8;
  v14.size.double height = v10;
  CGRectGetWidth(v14);
  if (self->_mediaStateIcon)
  {
    [(UIButton *)self->_mediaStateMuteButton bounds];
    CGRectGetWidth(v15);
  }
  [(TabBarItemView *)self _sf_usesLeftToRightLayout];
  _SFFlipRectInCoordinateSpace();
  _SFRoundRectToPixels();
  participantsView = self->_participantsView;
  -[SFAvatarStackView setFrame:](participantsView, "setFrame:");
}

- (TabBarItemView)initWithTabBar:(id)a3
{
  id v4 = a3;
  v53.receiver = self;
  v53.super_class = (Class)TabBarItemView;
  double v5 = -[TabBarItemView initWithFrame:](&v53, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  if (v5)
  {
    objc_initWeak(&location, v5);
    objc_storeWeak((id *)&v5->_tabBar, v4);
    CGFloat v6 = [(TabBarItemView *)v5 layer];
    [v6 setAllowsGroupBlending:0];

    double v7 = (UIButton *)objc_alloc_init(MEMORY[0x1E4FB14D0]);
    closeButton = v5->_closeButton;
    v5->_closeButton = v7;

    [(UIButton *)v5->_closeButton setAccessibilityIdentifier:@"CloseTabBarItemButton"];
    [(UIButton *)v5->_closeButton setAlpha:0.0];
    double v48 = objc_msgSend(MEMORY[0x1E4FB1830], "_sf_staticConfigurationWithTextStyle:scale:", *MEMORY[0x1E4FB28C8], 1);
    v50[0] = MEMORY[0x1E4F143A8];
    v50[1] = 3221225472;
    v50[2] = __33__TabBarItemView_initWithTabBar___block_invoke;
    v50[3] = &unk_1E6D78D70;
    objc_copyWeak(&v51, &location);
    [(UIButton *)v5->_closeButton setPointerStyleProvider:v50];
    id v9 = objc_alloc(MEMORY[0x1E4FB1838]);
    CGFloat v10 = [MEMORY[0x1E4FB1818] imageNamed:@"xmark.noshape"];
    uint64_t v11 = [v9 initWithImage:v10];
    closeButtonImageView = v5->_closeButtonImageView;
    v5->_closeButtonImageView = (UIImageView *)v11;

    [(UIImageView *)v5->_closeButtonImageView setPreferredSymbolConfiguration:v48];
    CGRect v13 = (UIButton *)objc_alloc_init(MEMORY[0x1E4FB14D0]);
    mediaStateMuteButton = v5->_mediaStateMuteButton;
    v5->_mediaStateMuteButton = v13;

    CGRect v15 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
    titleLabel = v5->_titleLabel;
    v5->_titleLabel = v15;

    CGRect v17 = [MEMORY[0x1E4FB08E0] boldSystemFontOfSize:12.0];
    [(UILabel *)v5->_titleLabel setFont:v17];

    id v18 = objc_alloc(MEMORY[0x1E4FB1838]);
    CGRect v19 = [MEMORY[0x1E4F78580] fallbackFavicon];
    uint64_t v20 = [v18 initWithImage:v19];
    iconView = v5->_iconView;
    v5->_iconView = (UIImageView *)v20;

    [(UIImageView *)v5->_iconView setContentMode:1];
    double v22 = (SFUnreadIndicator *)objc_alloc_init(MEMORY[0x1E4F784F8]);
    unreadIndicator = v5->_unreadIndicator;
    v5->_unreadIndicator = v22;

    [(SFUnreadIndicator *)v5->_unreadIndicator setHidden:1];
    double v24 = [MEMORY[0x1E4FB1618] systemBlueColor];
    [(SFUnreadIndicator *)v5->_unreadIndicator setTintColor:v24];

    double v25 = (SFAvatarStackView *)objc_alloc_init(MEMORY[0x1E4F781D0]);
    participantsView = v5->_participantsView;
    v5->_participantsView = v25;

    [(SFAvatarStackView *)v5->_participantsView setHidden:1];
    double v27 = (UIView *)objc_alloc_init(MEMORY[0x1E4FB1EB0]);
    titleClipperView = v5->_titleClipperView;
    v5->_titleClipperView = v27;

    [(UIView *)v5->_titleClipperView setClipsToBounds:1];
    [(UIView *)v5->_titleClipperView addSubview:v5->_titleLabel];
    v49 = objc_msgSend(NSString, "stringWithFormat:", @"TabBarItemView.content.%p", v4);
    double v29 = (UIVisualEffectView *)objc_alloc_init(MEMORY[0x1E4FB1F00]);
    borderEffectsView = v5->_borderEffectsView;
    v5->_borderEffectsView = v29;

    double v31 = [MEMORY[0x1E4FB1618] blackColor];
    CGRect v32 = [(UIVisualEffectView *)v5->_borderEffectsView contentView];
    [v32 setBackgroundColor:v31];

    [(UIVisualEffectView *)v5->_borderEffectsView _setGroupName:v49];
    [(TabBarItemView *)v5 addSubview:v5->_borderEffectsView];
    CGRect v33 = (UIVisualEffectView *)objc_alloc_init(MEMORY[0x1E4FB1F00]);
    contentEffectsView = v5->_contentEffectsView;
    v5->_contentEffectsView = v33;

    [(TabBarItemView *)v5 bounds];
    -[UIVisualEffectView setFrame:](v5->_contentEffectsView, "setFrame:");
    [(UIVisualEffectView *)v5->_contentEffectsView setAutoresizingMask:18];
    [(UIVisualEffectView *)v5->_contentEffectsView _setGroupName:v49];
    [(TabBarItemView *)v5 addSubview:v5->_contentEffectsView];
    CGRect v35 = (UIVisualEffectView *)objc_alloc_init(MEMORY[0x1E4FB1F00]);
    closeButtonEffectsView = v5->_closeButtonEffectsView;
    v5->_closeButtonEffectsView = v35;

    [(UIVisualEffectView *)v5->_closeButtonEffectsView _setGroupName:v49];
    [(UIVisualEffectView *)v5->_closeButtonEffectsView setUserInteractionEnabled:0];
    CGRect v37 = [(UIVisualEffectView *)v5->_closeButtonEffectsView contentView];
    [v37 addSubview:v5->_closeButtonImageView];

    [(UIButton *)v5->_closeButton addSubview:v5->_closeButtonEffectsView];
    [(TabBarItemView *)v5 addSubview:v5->_closeButton];
    CGFloat v38 = [(UIVisualEffectView *)v5->_contentEffectsView contentView];
    [v38 addSubview:v5->_titleClipperView];

    int v39 = (UIView *)objc_alloc_init(MEMORY[0x1E4FB1EB0]);
    iconClipperView = v5->_iconClipperView;
    v5->_iconClipperView = v39;

    [(UIView *)v5->_iconClipperView setClipsToBounds:1];
    [(UIView *)v5->_iconClipperView setUserInteractionEnabled:0];
    [(UIView *)v5->_iconClipperView addSubview:v5->_iconView];
    [(UIView *)v5->_iconClipperView addSubview:v5->_unreadIndicator];
    [(UIView *)v5->_iconClipperView addSubview:v5->_participantsView];
    [(TabBarItemView *)v5 addSubview:v5->_iconClipperView];
    [(TabBarItemView *)v5 _layoutEdges];
    [(TabBarItemView *)v5 _layoutTitleClipperView];
    [(TabBarItemView *)v5 _layoutTitleLabel];
    [(TabBarItemView *)v5 updateTabBarStyle];
    uint64_t v41 = [objc_alloc(MEMORY[0x1E4FB1800]) initWithTarget:v5 action:sel__hover_];
    hoverRecognizer = v5->_hoverRecognizer;
    v5->_hoverRecognizer = (UIHoverGestureRecognizer *)v41;

    [(TabBarItemView *)v5 addGestureRecognizer:v5->_hoverRecognizer];
    id v43 = objc_alloc(MEMORY[0x1E4FB1EB0]);
    [(TabBarItemView *)v5 bounds];
    uint64_t v44 = objc_msgSend(v43, "initWithFrame:");
    highlightView = v5->_highlightView;
    v5->_highlightView = (UIView *)v44;

    [(UIView *)v5->_highlightView setAutoresizingMask:18];
    int v46 = objc_msgSend(MEMORY[0x1E4FB1618], "sf_separateTabBarHighlightColor");
    [(UIView *)v5->_highlightView setBackgroundColor:v46];

    [(UIView *)v5->_highlightView setAlpha:0.0];
    [(UIView *)v5->_highlightView setUserInteractionEnabled:0];
    [(TabBarItemView *)v5 insertSubview:v5->_highlightView atIndex:0];

    objc_destroyWeak(&v51);
    objc_destroyWeak(&location);
  }

  return v5;
}

- (void)_layoutTitleClipperView
{
  [(TabBarItemView *)self bounds];
  double x = v20.origin.x;
  double y = v20.origin.y;
  double width = v20.size.width;
  double height = v20.size.height;
  double MidX = CGRectGetMidX(v20);
  v21.origin.double x = x;
  v21.origin.double y = y;
  v21.size.double width = width;
  v21.size.double height = height;
  double MidY = CGRectGetMidY(v21);
  _SFOnePixel();
  double v10 = v9;
  int64_t v11 = [(TabBarItemView *)self _physicalEdgeForLogicalEdge:self->_visibleEdge];
  double v12 = width - v10;
  double v13 = x + v10;
  double v14 = MidX + v10 * 0.5;
  if (v11 == 1)
  {
    double v15 = width - v10;
  }
  else
  {
    double v13 = x;
    double v14 = MidX;
    double v15 = width;
  }
  if (v11 == 2)
  {
    double v16 = MidX + v10 * -0.5;
  }
  else
  {
    double x = v13;
    double v16 = v14;
  }
  if (v11 == 2) {
    double v17 = v12;
  }
  else {
    double v17 = v15;
  }
  -[UIView setBounds:](self->_titleClipperView, "setBounds:", x, y, v17, height, y, v15);
  -[UIView setPosition:](self->_titleClipperView, "setPosition:", v16, MidY);
  -[UIView setBounds:](self->_iconClipperView, "setBounds:", x, y, v17, height);
  iconClipperView = self->_iconClipperView;
  -[UIView setPosition:](iconClipperView, "setPosition:", v16, MidY);
}

- (void)_updateCloseButtonEffect
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_tabBar);
  uint64_t v4 = [WeakRetained tintStyle];

  if (v4)
  {
    if (self->_pinned) {
      uint64_t v5 = 5;
    }
    else {
      uint64_t v5 = 4;
    }
    objc_msgSend(MEMORY[0x1E4FB1EA0], "_sf_effectWithStyle:forBarTintStyle:", v5, v4);
    id v6 = (id)objc_claimAutoreleasedReturnValue();
    [(UIVisualEffectView *)self->_closeButtonEffectsView setEffect:v6];
  }
}

- (void)updateTabBarStyle
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_tabBar);
  uint64_t v4 = [WeakRetained tintStyle];

  uint64_t v5 = objc_msgSend(MEMORY[0x1E4FB1EA0], "_sf_effectWithStyle:forBarTintStyle:", 6, v4);
  [(UIVisualEffectView *)self->_borderEffectsView setEffect:v5];

  if (self->_active) {
    uint64_t v6 = 3;
  }
  else {
    uint64_t v6 = 4;
  }
  double v7 = objc_msgSend(MEMORY[0x1E4FB1EA0], "_sf_effectWithStyle:forBarTintStyle:", v6, v4);
  [(UIVisualEffectView *)self->_contentEffectsView setEffect:v7];

  if (!mediaStateIconColor_colorForLightBars)
  {
    uint64_t v8 = [MEMORY[0x1E4FB1618] colorWithWhite:0.25 alpha:1.0];
    double v9 = (void *)mediaStateIconColor_colorForLightBars;
    mediaStateIconColor_colorForLightBars = v8;
  }
  if (_SFIsDarkTintStyle())
  {
    id v10 = [MEMORY[0x1E4FB1618] whiteColor];
  }
  else
  {
    id v10 = (id)mediaStateIconColor_colorForLightBars;
  }
  int64_t v11 = v10;
  [(UIButton *)self->_mediaStateMuteButton setTintColor:v10];

  [(TabBarItemView *)self _updateCloseButtonEffect];
}

uint64_t __45__TabBarItemView__updateShowsUnreadIndicator__block_invoke_2(uint64_t a1, double a2)
{
  LOBYTE(a2) = *(unsigned char *)(a1 + 40);
  [*(id *)(*(void *)(a1 + 32) + 544) setAlpha:(double)*(unint64_t *)&a2];
  double v3 = 1.0;
  if (!*(unsigned char *)(a1 + 40)) {
    double v3 = 0.5;
  }
  CGAffineTransformMakeScale(&v7, v3, v3);
  uint64_t v4 = *(void **)(*(void *)(a1 + 32) + 544);
  CGAffineTransform v6 = v7;
  return [v4 setTransform:&v6];
}

uint64_t __41__TabBarItemView__updateCloseButtonAlpha__block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 560) setAlpha:*(double *)(a1 + 40)];
}

- (void)setShareParticipants:(id)a3
{
  id v8 = a3;
  uint64_t v4 = [(TabBarItemView *)self shareParticipants];
  char v5 = [v4 isEqualToArray:v8];

  if ((v5 & 1) == 0)
  {
    CGAffineTransform v6 = (NSArray *)[v8 copy];
    shareParticipants = self->_shareParticipants;
    self->_shareParticipants = v6;

    [(TabBarItemView *)self _updateShowsUnreadIndicator];
    [(TabBarItemView *)self _updateShowsParticipants];
  }
}

- (void)_updateShowsParticipants
{
  int v3 = [(TabBarItemView *)self _showsParticipants];
  if (v3) {
    shareParticipants = self->_shareParticipants;
  }
  else {
    shareParticipants = (NSArray *)MEMORY[0x1E4F1CBF0];
  }
  char v5 = shareParticipants;
  if (v3 == [(SFAvatarStackView *)self->_participantsView isHidden])
  {
    BOOL v8 = 1;
    if (!v3) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
  CGAffineTransform v6 = [(SFAvatarStackView *)self->_participantsView shareParticipants];
  uint64_t v7 = [v6 count];
  BOOL v8 = v7 != [(NSArray *)v5 count];

  if (v3) {
LABEL_8:
  }
    [(SFAvatarStackView *)self->_participantsView setHidden:0];
LABEL_9:
  [(SFAvatarStackView *)self->_participantsView setShareParticipants:v5];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __42__TabBarItemView__updateShowsParticipants__block_invoke;
  v11[3] = &unk_1E6D77E20;
  v11[4] = self;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __42__TabBarItemView__updateShowsParticipants__block_invoke_2;
  v10[3] = &unk_1E6D77C20;
  v10[4] = self;
  [MEMORY[0x1E4FB1EB0] _animateUsingDefaultTimingWithOptions:1 animations:v11 completion:v10];
  if (v8)
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __42__TabBarItemView__updateShowsParticipants__block_invoke_3;
    v9[3] = &unk_1E6D77E20;
    v9[4] = self;
    [MEMORY[0x1E4FB1EB0] performWithoutAnimation:v9];
  }
}

- (void)_updateShowsUnreadIndicator
{
  BOOL v3 = [(TabBarItemView *)self _showsUnreadIndicator];
  char v4 = v3 ^ [(SFUnreadIndicator *)self->_unreadIndicator isHidden];
  if (v3 && [(SFUnreadIndicator *)self->_unreadIndicator isHidden])
  {
    [(SFUnreadIndicator *)self->_unreadIndicator setHidden:0];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __45__TabBarItemView__updateShowsUnreadIndicator__block_invoke;
    v9[3] = &unk_1E6D77E20;
    v9[4] = self;
    [MEMORY[0x1E4FB1EB0] performWithoutAnimation:v9];
  }
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __45__TabBarItemView__updateShowsUnreadIndicator__block_invoke_2;
  v7[3] = &unk_1E6D781E8;
  v7[4] = self;
  BOOL v8 = v3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __45__TabBarItemView__updateShowsUnreadIndicator__block_invoke_3;
  v6[3] = &unk_1E6D77C20;
  v6[4] = self;
  [MEMORY[0x1E4FB1EB0] _animateUsingDefaultTimingWithOptions:50331648 animations:v7 completion:v6];
  if ((v4 & 1) == 0)
  {
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __45__TabBarItemView__updateShowsUnreadIndicator__block_invoke_4;
    v5[3] = &unk_1E6D77E20;
    v5[4] = self;
    [MEMORY[0x1E4FB1EB0] performWithoutAnimation:v5];
  }
}

- (void)setIcon:(id)a3
{
  char v5 = (UIImage *)a3;
  if (self->_icon != v5)
  {
    uint64_t v7 = v5;
    objc_storeStrong((id *)&self->_icon, a3);
    if (self->_icon)
    {
      -[UIImageView setImage:](self->_iconView, "setImage:");
    }
    else
    {
      CGAffineTransform v6 = [MEMORY[0x1E4F78580] fallbackFavicon];
      [(UIImageView *)self->_iconView setImage:v6];
    }
    [(TabBarItemView *)self _layoutTitleLabel];
    [(TabBarItemView *)self _updateIconViewVisibility];
    char v5 = v7;
  }
}

uint64_t __28__TabBarItemView_setActive___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _updateHighlightAlpha];
  [*(id *)(a1 + 32) _updateCloseButtonImage];
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 472));
  uint64_t v3 = [WeakRetained tintStyle];

  if (*(unsigned char *)(*(void *)(a1 + 32) + 552)) {
    uint64_t v4 = 3;
  }
  else {
    uint64_t v4 = 4;
  }
  char v5 = objc_msgSend(MEMORY[0x1E4FB1EA0], "_sf_effectWithStyle:forBarTintStyle:", v4, v3);
  [*(id *)(*(void *)(a1 + 32) + 408) setEffect:v5];

  [*(id *)(a1 + 32) _showOrHideCloseButton];
  CGAffineTransform v6 = *(void **)(a1 + 32);
  return [v6 _updateMediaStateIndicator];
}

- (void)_updateHighlightAlpha
{
  double v3 = 0.0;
  if (!self->_active) {
    double v3 = (double)[(TabBarItemView *)self _isHovering];
  }
  highlightView = self->_highlightView;
  [(UIView *)highlightView setAlpha:v3];
}

- (void)_updateCloseButtonImage
{
  if (self->_pinned)
  {
    double v3 = (void *)MEMORY[0x1E4FB1818];
    uint64_t v4 = @"pin.fill";
LABEL_5:
    uint64_t v5 = [v3 systemImageNamed:v4];
    goto LABEL_6;
  }
  double v3 = (void *)MEMORY[0x1E4FB1818];
  if (self->_active)
  {
    uint64_t v4 = @"xmark.square.fill";
    goto LABEL_5;
  }
  uint64_t v5 = [MEMORY[0x1E4FB1818] imageNamed:@"xmark.noshape"];
LABEL_6:
  id v6 = (id)v5;
  [(UIImageView *)self->_closeButtonImageView setImage:v5];
}

- (void)_updateMediaStateIndicator
{
  unint64_t mediaStateIcon = self->_mediaStateIcon;
  if (mediaStateIcon)
  {
    BOOL v5 = mediaStateIcon != 4 || self->_active;
    [(UIButton *)self->_mediaStateMuteButton setUserInteractionEnabled:v5];
    id v6 = _SFImageForMediaStateIcon();
    id v10 = [v6 imageWithRenderingMode:2];

    [(UIButton *)self->_mediaStateMuteButton setImage:v10 forState:0];
    uint64_t v7 = [(UIButton *)self->_mediaStateMuteButton superview];

    if (!v7)
    {
      BOOL v8 = [(UIVisualEffectView *)self->_contentEffectsView contentView];
      [v8 addSubview:self->_mediaStateMuteButton];
    }
    [(TabBarItemView *)self _layoutMediaStateIndicator];
  }
  else
  {
    mediaStateMuteButton = self->_mediaStateMuteButton;
    [(UIButton *)mediaStateMuteButton removeFromSuperview];
  }
}

uint64_t __30__TabBarItemView__layoutEdges__block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 416) setHidden:0];
  CGRectGetHeight(*(CGRect *)(a1 + 56));
  _SFRoundRectToPixels();
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 416);
  return objc_msgSend(v2, "setFrame:");
}

uint64_t __45__TabBarItemView__updateShowsUnreadIndicator__block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 544) setAlpha:0.0];
  CGAffineTransformMakeScale(&v5, 0.5, 0.5);
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 544);
  CGAffineTransform v4 = v5;
  [v2 setTransform:&v4];
  return [*(id *)(a1 + 32) _layOutUnreadIndicator];
}

uint64_t __45__TabBarItemView__updateShowsUnreadIndicator__block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) _layoutTitleLabel];
}

uint64_t __42__TabBarItemView__updateShowsParticipants__block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) _layoutTitleLabel];
}

- (double)_contentWidthIgnoringCollaborationViews
{
  [(TabBarItemView *)self _closeButtonFrame];
  double Width = CGRectGetWidth(v7);
  if (minimumTitleWidth_onceToken != -1) {
    dispatch_once(&minimumTitleWidth_onceToken, &__block_literal_global_211);
  }
  double v4 = *(double *)&minimumTitleWidth_minimumTitleWidth;
  if (self->_mediaStateIcon)
  {
    [(UIButton *)self->_mediaStateMuteButton bounds];
    double v5 = CGRectGetWidth(v8) + 6.0;
  }
  else
  {
    double v5 = 0.0;
  }
  return Width + 4.0 + v4 + v5;
}

id __33__TabBarItemView_initWithTabBar___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = a3;
  id v7 = a4;
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  double v9 = WeakRetained;
  if (WeakRetained)
  {
    id v10 = WeakRetained[53];
    int64_t v11 = (void *)[objc_alloc(MEMORY[0x1E4FB1D48]) initWithView:v10];
    if ([v9 isActive])
    {
      double v12 = [MEMORY[0x1E4FB1AD0] effectWithPreview:v11];
      double v13 = (void *)MEMORY[0x1E4FB1AE0];
      [v10 frame];
      objc_msgSend(v13, "shapeWithRoundedRect:");
    }
    else
    {
      [v10 frame];
      CGFloat x = v30.origin.x;
      CGFloat y = v30.origin.y;
      CGFloat width = v30.size.width;
      CGFloat height = v30.size.height;
      double v19 = CGRectGetWidth(v30) + 8.0;
      v31.origin.CGFloat x = x;
      v31.origin.CGFloat y = y;
      v31.size.CGFloat width = width;
      v31.size.CGFloat height = height;
      double v20 = fmax(fmax(v19, CGRectGetHeight(v31) + 8.0), 16.0);
      v32.origin.CGFloat x = x;
      v32.origin.CGFloat y = y;
      v32.size.CGFloat width = width;
      v32.size.CGFloat height = height;
      CGFloat v21 = fmin((CGRectGetWidth(v32) - v20) * 0.5, 0.0);
      v33.origin.CGFloat x = x;
      v33.origin.CGFloat y = y;
      v33.size.CGFloat width = width;
      v33.size.CGFloat height = height;
      CGFloat v22 = fmin((CGRectGetHeight(v33) - v20) * 0.5, 0.0);
      v34.origin.CGFloat x = x;
      v34.origin.CGFloat y = y;
      v34.size.CGFloat width = width;
      v34.size.CGFloat height = height;
      CGRect v35 = CGRectInset(v34, v21, v22);
      double v23 = v35.origin.x;
      double v24 = v35.origin.y;
      double v25 = v35.size.width;
      double v26 = v35.size.height;
      double v12 = [MEMORY[0x1E4FB1AB0] effectWithPreview:v11];
      objc_msgSend(MEMORY[0x1E4FB1AE0], "shapeWithRoundedRect:cornerRadius:", v23, v24, v25, v26, 3.0);
    double v27 = };
    double v14 = [MEMORY[0x1E4FB1AE8] styleWithEffect:v12 shape:v27];
  }
  else
  {
    double v14 = [MEMORY[0x1E4FB1AE8] styleWithEffect:v6 shape:v7];
  }

  return v14;
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  [(TabBarItemView *)self bounds];
  v14.double x = x;
  v14.double y = y;
  if (CGRectContainsPoint(v15, v14))
  {
    v12.receiver = self;
    v12.super_class = (Class)TabBarItemView;
    -[TabBarItemView hitTest:withEvent:](&v12, sel_hitTest_withEvent_, v7, x, y);
    CGRect v8 = (TabBarItemView *)objc_claimAutoreleasedReturnValue();
    double v9 = v8;
    if (v8 == self) {
      id v10 = 0;
    }
    else {
      id v10 = v8;
    }
  }
  else
  {
    id v10 = 0;
  }

  return v10;
}

- (void)setBounds:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  [(TabBarItemView *)self bounds];
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  CGFloat v13 = v12;
  CGFloat v15 = v14;
  v20.receiver = self;
  v20.super_class = (Class)TabBarItemView;
  -[TabBarItemView setBounds:](&v20, sel_setBounds_, x, y, width, height);
  [(TabBarItemView *)self bounds];
  v22.origin.double x = v16;
  v22.origin.double y = v17;
  v22.size.double width = v18;
  v22.size.double height = v19;
  v21.origin.double x = v9;
  v21.origin.double y = v11;
  v21.size.double width = v13;
  v21.size.double height = v15;
  if (!CGRectEqualToRect(v21, v22))
  {
    [(TabBarItemView *)self _layoutCloseButton];
    [(TabBarItemView *)self _layoutEdges];
    [(TabBarItemView *)self _layoutTitleClipperView];
    [(TabBarItemView *)self _layoutMediaStateIndicator];
    [(TabBarItemView *)self _updateShowsParticipants];
    [(TabBarItemView *)self _updateShowsUnreadIndicator];
    if ([(TabBarItemView *)self _canUseCachedTitleTruncationOnBoundsChange])
    {
      [(TabBarItemView *)self _layoutTitleLabelUsingCachedTruncation];
    }
    else
    {
      [(TabBarItemView *)self _layoutTitleLabel];
    }
  }
}

- (void)_hover:(id)a3
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __25__TabBarItemView__hover___block_invoke;
  v5[3] = &unk_1E6D77E20;
  v5[4] = self;
  [MEMORY[0x1E4FB1EB0] performWithoutAnimation:v5];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __25__TabBarItemView__hover___block_invoke_2;
  v4[3] = &unk_1E6D77E20;
  v4[4] = self;
  [MEMORY[0x1E4FB1EB0] animateWithDuration:2 delay:v4 options:0 animations:0.2 completion:0.0];
}

uint64_t __25__TabBarItemView__hover___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _layoutCloseButton];
}

uint64_t __25__TabBarItemView__hover___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) _updateHighlightAlpha];
  uint64_t v2 = *(void **)(a1 + 32);
  return [v2 _showOrHideCloseButton];
}

- (BOOL)_isHoveringOverCloseButton
{
  BOOL v3 = [(TabBarItemView *)self _isHovering];
  if (v3)
  {
    [(UIButton *)self->_closeButton bounds];
    uint64_t v5 = v4;
    uint64_t v7 = v6;
    uint64_t v9 = v8;
    uint64_t v11 = v10;
    [(UIHoverGestureRecognizer *)self->_hoverRecognizer locationInView:self->_closeButton];
    uint64_t v13 = v12;
    uint64_t v15 = v14;
    uint64_t v16 = v5;
    uint64_t v17 = v7;
    uint64_t v18 = v9;
    uint64_t v19 = v11;
    LOBYTE(v3) = CGRectContainsPoint(*(CGRect *)&v16, *(CGPoint *)&v13);
  }
  return v3;
}

- (void)configureForDragPreview
{
  [(TabBarItemView *)self _updateIconViewVisibility];
  [(UIVisualEffectView *)self->_contentEffectsView setEffect:0];
  if (self->_active) {
    [MEMORY[0x1E4FB1618] labelColor];
  }
  else {
  BOOL v3 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
  }
  [(UILabel *)self->_titleLabel setColor:v3];

  [(UIVisualEffectView *)self->_closeButtonEffectsView setEffect:0];
  uint64_t v4 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
  [(UIButton *)self->_closeButton setTintColor:v4];

  [(TabBarItemView *)self _showOrHideCloseButton];
  self->_titleAnchorEdge = 0;
  [(TabBarItemView *)self setNeedsLayout];
  [(TabBarItemView *)self layoutIfNeeded];
}

- (UIImage)icon
{
  return self->_icon;
}

- (BOOL)isActive
{
  return self->_active;
}

- (BOOL)isReordering
{
  return self->_reordering;
}

- (unint64_t)mediaStateIcon
{
  return self->_mediaStateIcon;
}

- (BOOL)isPinned
{
  return self->_pinned;
}

- (BOOL)isUnread
{
  return self->_unread;
}

- (int64_t)visibleEdge
{
  return self->_visibleEdge;
}

- (double)titleLayoutWidth
{
  return self->_titleLayoutWidth;
}

- (int64_t)titleAnchorEdge
{
  return self->_titleAnchorEdge;
}

- (double)titleAnchorAdditionalOffset
{
  return self->_titleAnchorAdditionalOffset;
}

- (double)contentOffset
{
  return self->_contentOffset;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shareParticipants, 0);
  objc_storeStrong((id *)&self->_icon, 0);
  objc_storeStrong((id *)&self->_mediaStateMuteButton, 0);
  objc_storeStrong((id *)&self->_closeButton, 0);
  objc_storeStrong((id *)&self->_unreadIndicator, 0);
  objc_storeStrong((id *)&self->_participantsView, 0);
  objc_storeStrong((id *)&self->_hoverRecognizer, 0);
  objc_storeStrong((id *)&self->_highlightView, 0);
  objc_storeStrong((id *)&self->_closeButtonImageView, 0);
  objc_storeStrong((id *)&self->_truncatedTitleText, 0);
  objc_destroyWeak((id *)&self->_tabBar);
  objc_storeStrong((id *)&self->_titleText, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_iconView, 0);
  objc_storeStrong((id *)&self->_titleClipperView, 0);
  objc_storeStrong((id *)&self->_iconClipperView, 0);
  objc_storeStrong((id *)&self->_closeButtonEffectsView, 0);
  objc_storeStrong((id *)&self->_borderEffectsView, 0);
  objc_storeStrong((id *)&self->_contentEffectsView, 0);
}

@end