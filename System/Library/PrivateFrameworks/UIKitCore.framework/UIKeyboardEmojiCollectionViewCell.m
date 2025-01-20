@interface UIKeyboardEmojiCollectionViewCell
- (BOOL)cellBeingTouched;
- (BOOL)noResultsCell;
- (BOOL)unreleasedHighlight;
- (UIKeyboardEmoji)emoji;
- (UIKeyboardEmojiCollectionViewCell)initWithFrame:(CGRect)a3;
- (UIKeyboardEmojiDraggableView)emojiLabel;
- (UILabel)noResultsLabel;
- (UILabel)unreleasedBanner;
- (UIView)navigationHighlightView;
- (double)highlightPadding;
- (id)accessibilityIdentifier;
- (id)debugDescription;
- (int64_t)desiredFontSize;
- (int64_t)emojiFontSize;
- (void)layoutSubviews;
- (void)setCellBeingTouched:(BOOL)a3;
- (void)setCurrentEmojiFontSize:(int64_t)a3;
- (void)setDesiredFontSize:(int64_t)a3;
- (void)setEmoji:(id)a3;
- (void)setEmojiFontSize:(int64_t)a3;
- (void)setHighlightPadding:(double)a3;
- (void)setNavigationHighlightView:(id)a3;
- (void)setNoResultsCell:(BOOL)a3;
- (void)setNoResultsLabel:(id)a3;
- (void)setSelected:(BOOL)a3;
- (void)setUnreleasedBanner:(id)a3;
- (void)setUnreleasedHighlight:(BOOL)a3;
@end

@implementation UIKeyboardEmojiCollectionViewCell

- (id)accessibilityIdentifier
{
  return [(UIKeyboardEmoji *)self->_emoji emojiString];
}

- (UIKeyboardEmojiCollectionViewCell)initWithFrame:(CGRect)a3
{
  v12.receiver = self;
  v12.super_class = (Class)UIKeyboardEmojiCollectionViewCell;
  v3 = -[UICollectionViewCell initWithFrame:](&v12, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = [UIKeyboardEmojiDraggableView alloc];
    [(UIView *)v3 bounds];
    uint64_t v5 = -[UIKeyboardEmojiDraggableView initWithFrame:](v4, "initWithFrame:");
    emojiLabel = v3->_emojiLabel;
    v3->_emojiLabel = (UIKeyboardEmojiDraggableView *)v5;

    v7 = +[UIColor clearColor];
    [(UIView *)v3->_emojiLabel setBackgroundColor:v7];

    uint64_t v8 = +[UIKeyboardEmoji emojiWithString:0 withVariantMask:0];
    emoji = v3->_emoji;
    v3->_emoji = (UIKeyboardEmoji *)v8;

    v3->_highlightPadding = 2.0;
    v10 = [(UICollectionViewCell *)v3 contentView];
    [v10 addSubview:v3->_emojiLabel];
  }
  return v3;
}

- (void)setCellBeingTouched:(BOOL)a3
{
  self->_cellBeingTouched = a3;
}

- (void)layoutSubviews
{
  v7.receiver = self;
  v7.super_class = (Class)UIKeyboardEmojiCollectionViewCell;
  [(UICollectionViewCell *)&v7 layoutSubviews];
  [(UIView *)self bounds];
  -[UIView setFrame:](self->_emojiLabel, "setFrame:");
  [(UIView *)self->_emojiLabel frame];
  double v4 = v3;
  if (v3 >= (double)[(UIKeyboardEmojiCollectionViewCell *)self desiredFontSize])
  {
    int64_t v6 = [(UIKeyboardEmojiCollectionViewCell *)self emojiFontSize];
    if (v6 == [(UIKeyboardEmojiCollectionViewCell *)self desiredFontSize]) {
      return;
    }
    uint64_t v5 = [(UIKeyboardEmojiCollectionViewCell *)self desiredFontSize];
  }
  else
  {
    uint64_t v5 = (uint64_t)v4;
  }
  [(UIKeyboardEmojiCollectionViewCell *)self setCurrentEmojiFontSize:v5];
}

- (void)setEmoji:(id)a3
{
  id v8 = a3;
  if (self->_noResultsCell) {
    [(UIKeyboardEmojiCollectionViewCell *)self setNoResultsCell:0];
  }
  objc_storeStrong((id *)&self->_emoji, a3);
  emojiLabel = self->_emojiLabel;
  int64_t v6 = [(UIKeyboardEmoji *)self->_emoji emojiString];
  [(UIKeyboardEmojiDraggableView *)emojiLabel setText:v6];

  if (_os_feature_enabled_impl()) {
    uint64_t v7 = [(UIKeyboardEmoji *)self->_emoji supportsSkinToneVariants] ^ 1;
  }
  else {
    uint64_t v7 = 0;
  }
  [(UIKeyboardEmojiDraggableView *)self->_emojiLabel setDragEnabled:v7];
}

- (void)setCurrentEmojiFontSize:(int64_t)a3
{
  v11[2] = *MEMORY[0x1E4F143B8];
  if (_MergedGlobals_1_17 != a3 || qword_1EB25BE60 == 0)
  {
    uint64_t v6 = *MEMORY[0x1E4F24408];
    v10[0] = *(void *)off_1E52D6B78;
    v10[1] = v6;
    v11[0] = @"AppleColorEmoji";
    v11[1] = MEMORY[0x1E4F1CC28];
    uint64_t v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:v10 count:2];
    id v8 = [off_1E52D39C0 fontDescriptorWithFontAttributes:v7];

    id v9 = [off_1E52D39B8 fontWithDescriptor:v8 size:(double)a3];
    objc_storeStrong(&qword_1EB25BE60, v9);
    _MergedGlobals_1_17 = a3;
  }
  else
  {
    id v9 = qword_1EB25BE60;
  }
  [(UIKeyboardEmojiDraggableView *)self->_emojiLabel setFont:v9];
}

- (void)setEmojiFontSize:(int64_t)a3
{
  [(UIKeyboardEmojiCollectionViewCell *)self setDesiredFontSize:a3];
  int64_t v4 = [(UIKeyboardEmojiCollectionViewCell *)self desiredFontSize];
  [(UIKeyboardEmojiCollectionViewCell *)self setCurrentEmojiFontSize:v4];
}

- (int64_t)emojiFontSize
{
  v2 = [(UIKeyboardEmojiDraggableView *)self->_emojiLabel font];
  [v2 pointSize];
  int64_t v4 = (uint64_t)v3;

  return v4;
}

- (void)setUnreleasedHighlight:(BOOL)a3
{
  v41[2] = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    if (os_variant_has_internal_diagnostics())
    {
      v21 = [(UIKeyboardEmojiCollectionViewCell *)self unreleasedBanner];

      if (!v21)
      {
        v22 = [UILabel alloc];
        [(UIView *)self bounds];
        v23 = -[UILabel initWithFrame:](v22, "initWithFrame:");
        unreleasedBanner = self->_unreleasedBanner;
        self->_unreleasedBanner = v23;

        [(UILabel *)self->_unreleasedBanner setText:@"PRERELEASE"];
        v25 = +[UIColor colorWithRed:1.0 green:0.0 blue:0.0 alpha:1.0];
        [(UILabel *)self->_unreleasedBanner setTextColor:v25];

        v26 = [off_1E52D39B8 systemFontOfSize:6.0 weight:*(double *)off_1E52D6BD8];
        [(UILabel *)self->_unreleasedBanner setFont:v26];

        [(UILabel *)self->_unreleasedBanner setAdjustsFontSizeToFitWidth:1];
        [(UILabel *)self->_unreleasedBanner setMinimumScaleFactor:0.5];
        long long v27 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
        *(_OWORD *)&v39.a = *MEMORY[0x1E4F1DAB8];
        *(_OWORD *)&v39.c = v27;
        *(_OWORD *)&v39.tx = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
        CGAffineTransformRotate(&v40, &v39, -0.785398163);
        v28 = self->_unreleasedBanner;
        CGAffineTransform v38 = v40;
        [(UIView *)v28 setTransform:&v38];
        v29 = [(UICollectionViewCell *)self contentView];
        [v29 addSubview:self->_unreleasedBanner];

        [(UIView *)self->_unreleasedBanner setTranslatesAutoresizingMaskIntoConstraints:0];
        v30 = (void *)MEMORY[0x1E4F5B268];
        v31 = [(UIView *)self centerXAnchor];
        v32 = [(UIView *)self->_unreleasedBanner centerXAnchor];
        v33 = [v31 constraintEqualToAnchor:v32];
        v41[0] = v33;
        v34 = [(UIView *)self centerYAnchor];
        v35 = [(UIView *)self->_unreleasedBanner centerYAnchor];
        v36 = [v34 constraintEqualToAnchor:v35];
        v41[1] = v36;
        v37 = [MEMORY[0x1E4F1C978] arrayWithObjects:v41 count:2];
        [v30 activateConstraints:v37];
      }
    }
    int64_t v4 = [(UIKeyboardEmojiCollectionViewCell *)self unreleasedBanner];
    [v4 setHidden:0];

    uint64_t v5 = [(UIView *)self layer];
    objc_msgSend(v5, "setShadowOffset:", 3.0, 0.0);

    uint64_t v6 = [(UIView *)self layer];
    [v6 setShadowRadius:3.0];

    id v7 = +[UIColor colorWithRed:1.0 green:0.0 blue:0.0 alpha:0.3];
    uint64_t v8 = [v7 CGColor];
    id v9 = [(UIView *)self layer];
    [v9 setShadowColor:v8];

    v10 = [(UIView *)self layer];
    v11 = v10;
    LODWORD(v12) = 0.5;
  }
  else
  {
    v13 = [(UIKeyboardEmojiCollectionViewCell *)self unreleasedBanner];
    [v13 setHidden:1];

    double v14 = *MEMORY[0x1E4F1DB30];
    double v15 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
    v16 = [(UIView *)self layer];
    objc_msgSend(v16, "setShadowOffset:", v14, v15);

    v17 = [(UIView *)self layer];
    [v17 setShadowRadius:0.0];

    id v18 = +[UIColor clearColor];
    uint64_t v19 = [v18 CGColor];
    v20 = [(UIView *)self layer];
    [v20 setShadowColor:v19];

    v10 = [(UIView *)self layer];
    v11 = v10;
    LODWORD(v12) = 1.0;
  }
  [v10 setShadowOpacity:v12];

  [(UIView *)self setNeedsDisplay];
}

- (void)setNoResultsCell:(BOOL)a3
{
  BOOL v3 = a3;
  v24[4] = *MEMORY[0x1E4F143B8];
  if (self->_noResultsCell != a3)
  {
    self->_noResultsCell = a3;
    if (a3 && !self->_noResultsLabel)
    {
      uint64_t v5 = objc_alloc_init(UILabel);
      noResultsLabel = self->_noResultsLabel;
      self->_noResultsLabel = v5;

      [(UIView *)self->_noResultsLabel setTranslatesAutoresizingMaskIntoConstraints:0];
      id v7 = _UILocalizedStringInSystemLanguage(@"No Results", @"No Results");
      [(UILabel *)self->_noResultsLabel setText:v7];

      uint64_t v8 = [off_1E52D39B8 preferredFontForTextStyle:@"UICTFontTextStyleTitle3"];
      [(UILabel *)self->_noResultsLabel setFont:v8];

      [(UILabel *)self->_noResultsLabel setTextAlignment:1];
      id v9 = +[UIColor colorWithDynamicProvider:&__block_literal_global_345];
      [(UILabel *)self->_noResultsLabel setTextColor:v9];

      [(UIView *)self addSubview:self->_noResultsLabel];
      id v18 = (void *)MEMORY[0x1E4F5B268];
      v23 = [(UIView *)self->_noResultsLabel topAnchor];
      v22 = [(UIView *)self topAnchor];
      v21 = [v23 constraintEqualToAnchor:v22];
      v24[0] = v21;
      v20 = [(UIView *)self->_noResultsLabel leadingAnchor];
      uint64_t v19 = [(UIView *)self leadingAnchor];
      v17 = [v20 constraintEqualToAnchor:v19];
      v24[1] = v17;
      v10 = [(UIView *)self bottomAnchor];
      v11 = [(UIView *)self->_noResultsLabel bottomAnchor];
      double v12 = [v10 constraintEqualToAnchor:v11];
      v24[2] = v12;
      v13 = [(UIView *)self trailingAnchor];
      double v14 = [(UIView *)self->_noResultsLabel trailingAnchor];
      double v15 = [v13 constraintEqualToAnchor:v14];
      v24[3] = v15;
      v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v24 count:4];
      [v18 activateConstraints:v16];
    }
  }
  [(UIView *)self->_noResultsLabel setHidden:!v3];
}

id __54__UIKeyboardEmojiCollectionViewCell_setNoResultsCell___block_invoke(uint64_t a1, void *a2)
{
  if ([a2 userInterfaceStyle] == 1) {
    +[UIColor colorWithRed:0.518 green:0.553 blue:0.6 alpha:1.0];
  }
  else {
  v2 = +[UIColor secondaryLabelColor];
  }
  return v2;
}

- (void)setSelected:(BOOL)a3
{
  BOOL v3 = a3;
  v33[4] = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [(UIKeyboardEmojiCollectionViewCell *)self navigationHighlightView];

  if (!v5)
  {
    uint64_t v8 = objc_alloc_init(UIView);
    [(UIKeyboardEmojiCollectionViewCell *)self setNavigationHighlightView:v8];

    id v9 = [(UIKeyboardEmojiCollectionViewCell *)self navigationHighlightView];
    [v9 setTranslatesAutoresizingMaskIntoConstraints:0];

    v10 = [(UICollectionViewCell *)self contentView];
    [(UIKeyboardEmojiCollectionViewCell *)self navigationHighlightView];
    v11 = BOOL v32 = v3;
    [v10 insertSubview:v11 below:self->_emojiLabel];

    double v12 = [(UIKeyboardEmojiCollectionViewCell *)self navigationHighlightView];
    v13 = [v12 layer];
    [v13 setCornerRadius:5.0];

    v24 = (void *)MEMORY[0x1E4F5B268];
    v30 = [(UIView *)self leadingAnchor];
    v31 = [(UIKeyboardEmojiCollectionViewCell *)self navigationHighlightView];
    v29 = [v31 leadingAnchor];
    v28 = [v30 constraintEqualToAnchor:v29 constant:self->_highlightPadding];
    v33[0] = v28;
    long long v27 = [(UIKeyboardEmojiCollectionViewCell *)self navigationHighlightView];
    v26 = [v27 trailingAnchor];
    v25 = [(UIView *)self trailingAnchor];
    v23 = [v26 constraintEqualToAnchor:v25 constant:self->_highlightPadding];
    v33[1] = v23;
    double v14 = [(UIView *)self topAnchor];
    double v15 = [(UIKeyboardEmojiCollectionViewCell *)self navigationHighlightView];
    v16 = [v15 topAnchor];
    v17 = [v14 constraintEqualToAnchor:v16 constant:self->_highlightPadding];
    v33[2] = v17;
    id v18 = [(UIKeyboardEmojiCollectionViewCell *)self navigationHighlightView];
    uint64_t v19 = [v18 bottomAnchor];
    v20 = [(UIView *)self bottomAnchor];
    v21 = [v19 constraintEqualToAnchor:v20 constant:self->_highlightPadding];
    v33[3] = v21;
    v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:v33 count:4];
    [v24 activateConstraints:v22];

    if (v32) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v6 = [(UIKeyboardEmojiCollectionViewCell *)self navigationHighlightView];
    [v6 setBackgroundColor:0];
    goto LABEL_6;
  }
  if (!v3) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v6 = +[UIColor systemBlueColor];
  id v7 = [(UIKeyboardEmojiCollectionViewCell *)self navigationHighlightView];
  [v7 setBackgroundColor:v6];

LABEL_6:
  [(UIView *)self setNeedsDisplay];
}

- (id)debugDescription
{
  v8.receiver = self;
  v8.super_class = (Class)UIKeyboardEmojiCollectionViewCell;
  BOOL v3 = [(UIView *)&v8 debugDescription];
  int64_t v4 = [(UIKeyboardEmojiCollectionViewCell *)self emoji];
  uint64_t v5 = [v4 emojiString];
  id v6 = (id)[v3 stringByAppendingFormat:@"emojiString = %@", v5];

  return v3;
}

- (UILabel)unreleasedBanner
{
  return self->_unreleasedBanner;
}

- (void)setUnreleasedBanner:(id)a3
{
}

- (UIKeyboardEmoji)emoji
{
  return self->_emoji;
}

- (double)highlightPadding
{
  return self->_highlightPadding;
}

- (void)setHighlightPadding:(double)a3
{
  self->_highlightPadding = a3;
}

- (UIKeyboardEmojiDraggableView)emojiLabel
{
  return self->_emojiLabel;
}

- (BOOL)unreleasedHighlight
{
  return self->_unreleasedHighlight;
}

- (BOOL)noResultsCell
{
  return self->_noResultsCell;
}

- (UIView)navigationHighlightView
{
  return self->_navigationHighlightView;
}

- (void)setNavigationHighlightView:(id)a3
{
}

- (UILabel)noResultsLabel
{
  return self->_noResultsLabel;
}

- (void)setNoResultsLabel:(id)a3
{
}

- (BOOL)cellBeingTouched
{
  return self->_cellBeingTouched;
}

- (int64_t)desiredFontSize
{
  return self->_desiredFontSize;
}

- (void)setDesiredFontSize:(int64_t)a3
{
  self->_desiredFontSize = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_noResultsLabel, 0);
  objc_storeStrong((id *)&self->_navigationHighlightView, 0);
  objc_storeStrong((id *)&self->_emojiLabel, 0);
  objc_storeStrong((id *)&self->_emoji, 0);
  objc_storeStrong((id *)&self->_unreleasedBanner, 0);
}

@end