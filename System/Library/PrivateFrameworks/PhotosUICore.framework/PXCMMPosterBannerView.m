@interface PXCMMPosterBannerView
+ (id)_headlineLabelBoldFont;
+ (id)_headlineLabelFont;
+ (id)_subheadlineLabelFont;
- (BOOL)containsUnverifiedPersons;
- (BOOL)isAddingPhotos;
- (BOOL)isLoadingPeopleSuggestions;
- (CGSize)_performLayoutInWidth:(double)a3 updateSubviewFrames:(BOOL)a4;
- (CGSize)sizeThatFits:(CGSize)a3;
- (NSArray)localizedNamesForHeadline;
- (NSString)headline;
- (NSString)subheadline;
- (PXCMMPosterBannerView)initWithFrame:(CGRect)a3;
- (id)_actionButtonWithTitle:(id)a3 action:(SEL)a4 enabled:(BOOL)a5;
- (id)_attributedStringWithString:(id)a3 boldRange:(_NSRange)a4;
- (id)_headlineStringAttributes;
- (void)_actionButtonTapped:(id)a3;
- (void)_contentSizeCategoryDidChangeNotification:(id)a3;
- (void)_updateActionButton;
- (void)_updateLoadingPeopleSuggestions;
- (void)_updateTitles;
- (void)layoutSubviews;
- (void)setActionButtonWithTitle:(id)a3 actionBlock:(id)a4;
- (void)setAddingPhotos:(BOOL)a3;
- (void)setContainsUnverifiedPersons:(BOOL)a3;
- (void)setHeadline:(id)a3;
- (void)setHeadline:(id)a3 boldRange:(_NSRange)a4;
- (void)setLoadingPeopleSuggestions:(BOOL)a3;
- (void)setLocalizedNamesForHeadline:(id)a3;
- (void)setSubheadline:(id)a3;
- (void)tintColorDidChange;
- (void)willMoveToWindow:(id)a3;
@end

@implementation PXCMMPosterBannerView

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localizedNamesForHeadline, 0);
  objc_storeStrong((id *)&self->_subheadline, 0);
  objc_storeStrong((id *)&self->_headline, 0);
  objc_storeStrong((id *)&self->_updater, 0);
  objc_storeStrong((id *)&self->_visualEffectView, 0);
  objc_storeStrong((id *)&self->_subheadlineLabel, 0);
  objc_storeStrong((id *)&self->_headlineLabel, 0);
  objc_storeStrong(&self->_actionButtonAction, 0);
  objc_storeStrong((id *)&self->_actionButtonTitle, 0);
  objc_storeStrong((id *)&self->_actionButton, 0);
}

- (BOOL)isAddingPhotos
{
  return self->_addingPhotos;
}

- (BOOL)isLoadingPeopleSuggestions
{
  return self->_loadingPeopleSuggestions;
}

- (void)setContainsUnverifiedPersons:(BOOL)a3
{
  self->_containsUnverifiedPersons = a3;
}

- (BOOL)containsUnverifiedPersons
{
  return self->_containsUnverifiedPersons;
}

- (NSArray)localizedNamesForHeadline
{
  return self->_localizedNamesForHeadline;
}

- (NSString)subheadline
{
  return self->_subheadline;
}

- (NSString)headline
{
  return self->_headline;
}

- (id)_attributedStringWithString:(id)a3 boldRange:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  v14[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  v8 = [(PXCMMPosterBannerView *)self _headlineStringAttributes];
  v9 = (void *)[objc_alloc(MEMORY[0x1E4F28E48]) initWithString:v7 attributes:v8];

  if (location != 0x7FFFFFFFFFFFFFFFLL)
  {
    v10 = [(id)objc_opt_class() _headlineLabelBoldFont];
    uint64_t v13 = *MEMORY[0x1E4FB06F8];
    v14[0] = v10;
    v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:&v13 count:1];
    objc_msgSend(v9, "setAttributes:range:", v11, location, length);
  }
  return v9;
}

- (id)_headlineStringAttributes
{
  v7[2] = *MEMORY[0x1E4F143B8];
  id v2 = objc_alloc_init(MEMORY[0x1E4FB0848]);
  [v2 setAlignment:0];
  [v2 setLineBreakMode:0];
  v6[0] = *MEMORY[0x1E4FB06F8];
  v3 = [(id)objc_opt_class() _headlineLabelFont];
  v6[1] = *MEMORY[0x1E4FB0738];
  v7[0] = v3;
  v7[1] = v2;
  v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:v6 count:2];

  return v4;
}

- (id)_actionButtonWithTitle:(id)a3 action:(SEL)a4 enabled:(BOOL)a5
{
  id v7 = a3;
  v8 = [PXCapsuleButton alloc];
  v9 = [(PXCMMPosterBannerView *)self tintColor];
  v10 = [(PXCapsuleButton *)v8 initWithColor:v9];

  [(PXCapsuleButton *)v10 setMaxContentSizeCategory:*MEMORY[0x1E4FB2790]];
  v11 = [MEMORY[0x1E4FB1618] lightGrayColor];
  [(PXCapsuleButton *)v10 setColor:v11 forState:2];

  v12 = [MEMORY[0x1E4FB1618] whiteColor];
  [(PXCapsuleButton *)v10 setTitleColor:v12 forState:0];

  [(PXCapsuleButton *)v10 setTitle:v7 forState:0];
  [(PXCapsuleButton *)v10 addTarget:self action:a4 forControlEvents:64];
  return v10;
}

- (void)_contentSizeCategoryDidChangeNotification:(id)a3
{
  v4 = [(id)objc_opt_class() _subheadlineLabelFont];
  [(UILabel *)self->_subheadlineLabel setFont:v4];

  [(PXUpdater *)self->_updater setNeedsUpdateOf:sel__updateTitles];
  updater = self->_updater;
  [(PXUpdater *)updater setNeedsUpdateOf:sel__updateActionButton];
}

- (void)_actionButtonTapped:(id)a3
{
  id v4 = a3;
  if (self->_actionButtonAction && ![(PXCMMPosterBannerView *)self isAddingPhotos])
  {
    uint64_t v5 = [self->_actionButtonAction copy];
    (*(void (**)(void))(v5 + 16))();
  }
  else
  {
    uint64_t v5 = PLSharingGetLog();
    if (os_log_type_enabled((os_log_t)v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_1A9AE7000, (os_log_t)v5, OS_LOG_TYPE_DEFAULT, "Tap on action button, but no button action block.", v6, 2u);
    }
  }
}

- (void)_updateTitles
{
  headline = self->_headline;
  if (headline || self->_localizedNamesForHeadline)
  {
    if (self->_headlineLabel)
    {
      if (headline)
      {
LABEL_5:
        id v4 = -[PXCMMPosterBannerView _attributedStringWithString:boldRange:](self, "_attributedStringWithString:boldRange:", headline, self->_headlineBoldRange.location, self->_headlineBoldRange.length);
        [(UILabel *)self->_headlineLabel setAttributedText:v4];

        goto LABEL_9;
      }
    }
    else
    {
      id v5 = objc_alloc(MEMORY[0x1E4FB1930]);
      v6 = (UILabel *)objc_msgSend(v5, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
      headlineLabel = self->_headlineLabel;
      self->_headlineLabel = v6;

      [(UILabel *)self->_headlineLabel setNumberOfLines:0];
      v8 = [(UIVisualEffectView *)self->_visualEffectView contentView];
      [v8 addSubview:self->_headlineLabel];

      headline = self->_headline;
      if (headline) {
        goto LABEL_5;
      }
    }
    -[UILabel setAttributedText:](self->_headlineLabel, "setAttributedText:");
  }
  else
  {
    [(UILabel *)self->_headlineLabel removeFromSuperview];
    v9 = self->_headlineLabel;
    self->_headlineLabel = 0;
  }
LABEL_9:
  subheadline = self->_subheadline;
  subheadlineLabel = self->_subheadlineLabel;
  if (subheadline)
  {
    if (!subheadlineLabel)
    {
      id v12 = objc_alloc(MEMORY[0x1E4FB1930]);
      uint64_t v13 = (UILabel *)objc_msgSend(v12, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
      v14 = self->_subheadlineLabel;
      self->_subheadlineLabel = v13;

      v15 = [(id)objc_opt_class() _subheadlineLabelFont];
      [(UILabel *)self->_subheadlineLabel setFont:v15];

      v16 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
      [(UILabel *)self->_subheadlineLabel setTextColor:v16];

      v17 = [(UIVisualEffectView *)self->_visualEffectView contentView];
      [v17 addSubview:self->_subheadlineLabel];

      subheadline = self->_subheadline;
      subheadlineLabel = self->_subheadlineLabel;
    }
    [(UILabel *)subheadlineLabel setText:subheadline];
  }
  else
  {
    [(UILabel *)subheadlineLabel removeFromSuperview];
    v18 = self->_subheadlineLabel;
    self->_subheadlineLabel = 0;
  }
}

- (void)_updateActionButton
{
  id actionButtonAction = self->_actionButtonAction;
  actionButtonTitle = self->_actionButtonTitle;
  actionButton = self->_actionButton;
  if (actionButtonTitle)
  {
    if (actionButton) {
      goto LABEL_6;
    }
    -[PXCMMPosterBannerView _actionButtonWithTitle:action:enabled:](self, "_actionButtonWithTitle:action:enabled:");
    v6 = (PXCapsuleButton *)objc_claimAutoreleasedReturnValue();
    id v7 = self->_actionButton;
    self->_actionButton = v6;

    v8 = [(UIVisualEffectView *)self->_visualEffectView contentView];
    [v8 addSubview:self->_actionButton];
  }
  else
  {
    [(PXCapsuleButton *)actionButton removeFromSuperview];
    v8 = self->_actionButton;
    self->_actionButton = 0;
  }

  actionButton = self->_actionButton;
LABEL_6:
  [(PXCapsuleButton *)actionButton setEnabled:actionButtonAction != 0];
  [(PXCapsuleButton *)self->_actionButton setTitle:self->_actionButtonTitle forState:0];
  [(PXCapsuleButton *)self->_actionButton sizeToFit];
  BOOL v9 = [(PXCMMPosterBannerView *)self isAddingPhotos];
  v10 = self->_actionButton;
  if (v9)
  {
    [(PXCapsuleButton *)v10 startLoadingAnimation];
  }
  else
  {
    [(PXCapsuleButton *)v10 stopLoadingAnimation];
  }
}

- (CGSize)_performLayoutInWidth:(double)a3 updateSubviewFrames:(BOOL)a4
{
  BOOL v4 = a4;
  [(PXUpdater *)self->_updater updateIfNeeded];
  double v38 = a3;
  double v7 = a3 + -32.0;
  v41.origin.x = 16.0;
  v41.origin.y = 0.0;
  v41.size.width = v7;
  v41.size.height = 1.79769313e308;
  double MinX = CGRectGetMinX(v41);
  v42.origin.x = 16.0;
  v42.origin.y = 0.0;
  v42.size.width = v7;
  v42.size.height = 1.79769313e308;
  double MaxX = CGRectGetMaxX(v42);
  double v10 = *MEMORY[0x1E4F1DB28];
  double v11 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  double v13 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  double v12 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  uint64_t v14 = objc_msgSend(MEMORY[0x1E4FB1EB0], "userInterfaceLayoutDirectionForSemanticContentAttribute:", -[PXCMMPosterBannerView semanticContentAttribute](self, "semanticContentAttribute"));
  v15 = [MEMORY[0x1E4FB1438] sharedApplication];
  v16 = [v15 preferredContentSizeCategory];
  BOOL IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v16);

  actionButton = self->_actionButton;
  double v35 = v13;
  double v37 = v12;
  double v39 = v11;
  if (actionButton)
  {
    -[PXCapsuleButton sizeThatFits:](actionButton, "sizeThatFits:", MaxX - MinX, 1.79769313e308);
    double v13 = v19;
    double v21 = v20;
    double v22 = MinX;
    double v23 = MinX;
    if ((v14 == 0) != IsAccessibilityCategory)
    {
      v43.origin.x = 16.0;
      v43.origin.y = 0.0;
      v43.size.width = v7;
      v43.size.height = 1.79769313e308;
      double v23 = CGRectGetMaxX(v43) - v13;
    }
    double v36 = (60.0 - v21) * 0.5;
    if (IsAccessibilityCategory)
    {
      double v24 = v37;
    }
    else
    {
      double v26 = v13 + 16.0;
      double v24 = v37;
      if (v14) {
        double v22 = MinX + v26;
      }
      else {
        double MaxX = MaxX - v26;
      }
    }
  }
  else
  {
    double v25 = v11;
    double v21 = v12;
    double v36 = v25;
    double v23 = v10;
    double v24 = v12;
    double v22 = MinX;
  }
  headlineLabel = self->_headlineLabel;
  if (headlineLabel)
  {
    if (!self->_headline && self->_localizedNamesForHeadline)
    {
      v28 = [(PXCMMPosterBannerView *)self _headlineStringAttributes];
      v29 = [(id)objc_opt_class() _headlineLabelBoldFont];
      v30 = +[PXCMMSharePromptStringGenerator sharePromptStringWithAttributes:v28 boldFont:v29 lines:2 width:self->_localizedNamesForHeadline names:self->_containsUnverifiedPersons containsUnverifiedPersons:MaxX - v22];
      [(UILabel *)self->_headlineLabel setAttributedText:v30];

      headlineLabel = self->_headlineLabel;
    }
    if ([(UILabel *)headlineLabel px_isOneLineForWidth:MaxX - v22])
    {
      if (!self->_subheadlineLabel) {
        PXScaledValueForTextStyleWithSymbolicTraits();
      }
    }
    PXScaledValueForTextStyleWithSymbolicTraits();
  }
  if (self->_subheadlineLabel) {
    PXScaledValueForTextStyleWithSymbolicTraits();
  }
  double v31 = 0.0 + 9.0 + 0.0;
  if (!self->_actionButton)
  {
    double v32 = v23;
    if (!v4) {
      goto LABEL_25;
    }
LABEL_24:
    -[UIVisualEffectView setFrame:](self->_visualEffectView, "setFrame:", 0.0, 0.0, v38, v31);
    -[UILabel setFrame:](self->_headlineLabel, "setFrame:", v10, v39, v35, v24);
    -[UILabel setFrame:](self->_subheadlineLabel, "setFrame:", v10, v39, v35, v24);
    -[PXCapsuleButton setFrame:](self->_actionButton, "setFrame:", v32, v36, v13, v21);
    goto LABEL_25;
  }
  if (IsAccessibilityCategory) {
    PXScaledValueForTextStyleWithSymbolicTraits();
  }
  double v32 = v23;
  double v36 = (v31 - v21) * 0.5;
  if (v4) {
    goto LABEL_24;
  }
LABEL_25:
  double v33 = v38;
  double v34 = 0.0 + 9.0 + 0.0;
  result.height = v34;
  result.width = v33;
  return result;
}

- (void)_updateLoadingPeopleSuggestions
{
  BOOL v3 = [(PXCMMPosterBannerView *)self isLoadingPeopleSuggestions];
  actionButton = self->_actionButton;
  if (v3)
  {
    [(PXCapsuleButton *)actionButton startLoadingAnimation];
  }
  else
  {
    [(PXCapsuleButton *)actionButton stopLoadingAnimation];
  }
}

- (void)tintColorDidChange
{
  v5.receiver = self;
  v5.super_class = (Class)PXCMMPosterBannerView;
  [(PXCMMPosterBannerView *)&v5 tintColorDidChange];
  actionButton = self->_actionButton;
  BOOL v4 = [(PXCMMPosterBannerView *)self tintColor];
  [(PXCapsuleButton *)actionButton setColor:v4 forState:0];
}

- (void)willMoveToWindow:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PXCMMPosterBannerView;
  -[PXCMMPosterBannerView willMoveToWindow:](&v5, sel_willMoveToWindow_);
  if (a3)
  {
    [(PXUpdater *)self->_updater setNeedsUpdateOf:sel__updateTitles];
    [(PXUpdater *)self->_updater setNeedsUpdateOf:sel__updateActionButton];
  }
}

- (void)layoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)PXCMMPosterBannerView;
  [(PXCMMPosterBannerView *)&v4 layoutSubviews];
  [(PXCMMPosterBannerView *)self bounds];
  [(PXCMMPosterBannerView *)self _performLayoutInWidth:1 updateSubviewFrames:v3];
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  -[PXCMMPosterBannerView _performLayoutInWidth:updateSubviewFrames:](self, "_performLayoutInWidth:updateSubviewFrames:", 0, a3.width, a3.height);
  result.height = v4;
  result.width = v3;
  return result;
}

- (void)setActionButtonWithTitle:(id)a3 actionBlock:(id)a4
{
  uint64_t v14 = (NSString *)a3;
  id v6 = a4;
  double v7 = self->_actionButtonTitle;
  actionButtonTitle = v14;
  if (v7 != v14)
  {
    BOOL v9 = v7;
    BOOL v10 = [(NSString *)v7 isEqualToString:v14];

    if (v10) {
      goto LABEL_5;
    }
    double v11 = (NSString *)[(NSString *)v14 copy];
    actionButtonTitle = self->_actionButtonTitle;
    self->_actionButtonTitle = v11;
  }

LABEL_5:
  double v12 = (void *)[v6 copy];
  id actionButtonAction = self->_actionButtonAction;
  self->_id actionButtonAction = v12;

  [(PXUpdater *)self->_updater setNeedsUpdateOf:sel__updateActionButton];
}

- (void)setSubheadline:(id)a3
{
  v8 = (NSString *)a3;
  double v4 = self->_subheadline;
  if (v4 == v8)
  {
  }
  else
  {
    BOOL v5 = [(NSString *)v4 isEqualToString:v8];

    if (!v5)
    {
      id v6 = (NSString *)[(NSString *)v8 copy];
      subheadline = self->_subheadline;
      self->_subheadline = v6;

      [(PXUpdater *)self->_updater setNeedsUpdateOf:sel__updateTitles];
    }
  }
}

- (void)setLocalizedNamesForHeadline:(id)a3
{
  id v6 = a3;
  if (([v6 isEqualToArray:self->_localizedNamesForHeadline] & 1) == 0)
  {
    double v4 = (NSArray *)[v6 copy];
    localizedNamesForHeadline = self->_localizedNamesForHeadline;
    self->_localizedNamesForHeadline = v4;

    [(PXUpdater *)self->_updater setNeedsUpdateOf:sel__updateTitles];
  }
}

- (void)setHeadline:(id)a3 boldRange:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  double v13 = (NSString *)a3;
  double v7 = self->_headline;
  if (v7 == v13)
  {

LABEL_5:
    if (self->_headlineBoldRange.location == location && self->_headlineBoldRange.length == length) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }
  v8 = v7;
  BOOL v9 = [(NSString *)v7 isEqualToString:v13];

  if (v9) {
    goto LABEL_5;
  }
LABEL_9:
  double v11 = (NSString *)[(NSString *)v13 copy];
  headline = self->_headline;
  self->_headline = v11;

  self->_headlineBoldRange.NSUInteger location = location;
  self->_headlineBoldRange.NSUInteger length = length;
  [(PXUpdater *)self->_updater setNeedsUpdateOf:sel__updateTitles];
LABEL_10:
}

- (void)setHeadline:(id)a3
{
}

- (void)setAddingPhotos:(BOOL)a3
{
  if (self->_addingPhotos != a3)
  {
    self->_addingPhotos = a3;
    [(PXCMMPosterBannerView *)self _updateActionButton];
  }
}

- (void)setLoadingPeopleSuggestions:(BOOL)a3
{
  if (self->_loadingPeopleSuggestions != a3)
  {
    self->_loadingPeopleSuggestions = a3;
    [(PXCMMPosterBannerView *)self _updateLoadingPeopleSuggestions];
  }
}

- (PXCMMPosterBannerView)initWithFrame:(CGRect)a3
{
  v12.receiver = self;
  v12.super_class = (Class)PXCMMPosterBannerView;
  double v3 = -[PXCMMPosterBannerView initWithFrame:](&v12, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  double v4 = (PXCMMPosterBannerView *)v3;
  if (v3)
  {
    *(_OWORD *)(v3 + 408) = xmmword_1AB359BD0;
    BOOL v5 = [MEMORY[0x1E4FB14C8] effectWithStyle:10];
    uint64_t v6 = [objc_alloc(MEMORY[0x1E4FB1F00]) initWithEffect:v5];
    visualEffectView = v4->_visualEffectView;
    v4->_visualEffectView = (UIVisualEffectView *)v6;

    [(PXCMMPosterBannerView *)v4 addSubview:v4->_visualEffectView];
    v8 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v8 addObserver:v4 selector:sel__contentSizeCategoryDidChangeNotification_ name:*MEMORY[0x1E4FB27A8] object:0];

    uint64_t v9 = [objc_alloc((Class)off_1E5DA9778) initWithTarget:v4];
    updater = v4->_updater;
    v4->_updater = (PXUpdater *)v9;

    [(PXUpdater *)v4->_updater setNeedsUpdateSelector:sel_setNeedsLayout];
    [(PXUpdater *)v4->_updater addUpdateSelector:sel__updateActionButton];
    [(PXUpdater *)v4->_updater addUpdateSelector:sel__updateTitles];
    [(PXUpdater *)v4->_updater setNeedsUpdateOf:sel__updateActionButton];
    [(PXUpdater *)v4->_updater setNeedsUpdateOf:sel__updateTitles];
  }
  return v4;
}

+ (id)_subheadlineLabelFont
{
  return (id)objc_msgSend(MEMORY[0x1E4FB08E0], "px_preferredFontForTextStyle:withSymbolicTraits:options:", *MEMORY[0x1E4FB2950], 0x8000, 0);
}

+ (id)_headlineLabelBoldFont
{
  return (id)objc_msgSend(MEMORY[0x1E4FB08E0], "px_preferredFontForTextStyle:withSymbolicTraits:options:", *MEMORY[0x1E4FB28C8], 32770, 0);
}

+ (id)_headlineLabelFont
{
  return (id)objc_msgSend(MEMORY[0x1E4FB08E0], "px_preferredFontForTextStyle:withSymbolicTraits:options:", *MEMORY[0x1E4FB28C8], 0x8000, 0);
}

@end