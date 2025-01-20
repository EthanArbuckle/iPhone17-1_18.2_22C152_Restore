@interface TLKDetailsView
- (BOOL)configureMenuForFootnoteButton:(id)a3;
- (BOOL)isAccessoryViewBottomAligned;
- (BOOL)secondaryTitleIsDetached;
- (BOOL)truncateTitleMiddle;
- (BOOL)useCompactMode;
- (NSArray)details;
- (NSString)footnoteButtonText;
- (TLKDetailsViewDelegate)delegate;
- (TLKImage)secondaryTitleImage;
- (TLKRichText)bannerBadge;
- (TLKRichText)footnote;
- (TLKRichText)secondaryTitle;
- (TLKRichText)title;
- (TLKRichText)topText;
- (UIView)accessoryView;
- (id)detailsFields;
- (id)detailsStrings;
- (id)footnoteButton;
- (id)footnoteContainer;
- (id)footnoteLabel;
- (id)footnoteLabelString;
- (id)setupContentView;
- (id)titleContainer;
- (id)viewForFirstBaselineLayout;
- (id)viewForLastBaselineLayout;
- (void)footnoteButtonPressed;
- (void)layoutMarginsDidChange;
- (void)performBatchUpdates:(id)a3;
- (void)setAccessoryView:(id)a3;
- (void)setBannerBadge:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDetails:(id)a3;
- (void)setFootnote:(id)a3;
- (void)setFootnoteButtonText:(id)a3;
- (void)setIsAccessoryViewBottomAligned:(BOOL)a3;
- (void)setSecondaryTitle:(id)a3;
- (void)setSecondaryTitleImage:(id)a3;
- (void)setSecondaryTitleIsDetached:(BOOL)a3;
- (void)setTitle:(id)a3;
- (void)setTopText:(id)a3;
- (void)setTruncateTitleMiddle:(BOOL)a3;
- (void)setUseCompactMode:(BOOL)a3;
@end

@implementation TLKDetailsView

- (id)setupContentView
{
  v3 = objc_opt_new();
  [v3 setButtonDelegate:self];
  +[TLKView makeContainerShadowCompatible:v3];
  return v3;
}

- (void)footnoteButtonPressed
{
  id v2 = [(TLKDetailsView *)self delegate];
  [v2 footnoteButtonPressed];
}

- (BOOL)configureMenuForFootnoteButton:(id)a3
{
  id v4 = a3;
  v5 = [(TLKDetailsView *)self delegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    v7 = [(TLKDetailsView *)self delegate];
    char v8 = [v7 configureMenuForFootnoteButton:v4];
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

- (BOOL)useCompactMode
{
  id v2 = [(TLKView *)self contentView];
  char v3 = [v2 useCompactMode];

  return v3;
}

- (void)setUseCompactMode:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(TLKView *)self contentView];
  [v4 setUseCompactMode:v3];
}

- (TLKRichText)bannerBadge
{
  id v2 = [(TLKView *)self contentView];
  BOOL v3 = [v2 bannerText];

  return (TLKRichText *)v3;
}

- (void)setBannerBadge:(id)a3
{
  id v4 = a3;
  id v5 = [(TLKView *)self contentView];
  [v5 setBannerText:v4];
}

- (TLKRichText)topText
{
  id v2 = [(TLKView *)self contentView];
  BOOL v3 = [v2 topText];

  return (TLKRichText *)v3;
}

- (void)setTopText:(id)a3
{
  id v4 = a3;
  id v5 = [(TLKView *)self contentView];
  [v5 setTopText:v4];
}

- (TLKRichText)title
{
  id v2 = [(TLKView *)self contentView];
  BOOL v3 = [v2 title];

  return (TLKRichText *)v3;
}

- (void)setTitle:(id)a3
{
  id v4 = a3;
  id v5 = [(TLKView *)self contentView];
  [v5 setTitle:v4];
}

- (BOOL)truncateTitleMiddle
{
  id v2 = [(TLKView *)self contentView];
  char v3 = [v2 truncateTitleMiddle];

  return v3;
}

- (void)setTruncateTitleMiddle:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(TLKView *)self contentView];
  [v4 setTruncateTitleMiddle:v3];
}

- (TLKRichText)secondaryTitle
{
  id v2 = [(TLKView *)self contentView];
  BOOL v3 = [v2 secondaryTitle];

  return (TLKRichText *)v3;
}

- (void)setSecondaryTitle:(id)a3
{
  id v4 = a3;
  id v5 = [(TLKView *)self contentView];
  [v5 setSecondaryTitle:v4];
}

- (TLKImage)secondaryTitleImage
{
  id v2 = [(TLKView *)self contentView];
  BOOL v3 = [v2 secondaryTitleImage];

  return (TLKImage *)v3;
}

- (void)setSecondaryTitleImage:(id)a3
{
  id v4 = a3;
  id v5 = [(TLKView *)self contentView];
  [v5 setSecondaryTitleImage:v4];
}

- (BOOL)secondaryTitleIsDetached
{
  id v2 = [(TLKView *)self contentView];
  char v3 = [v2 secondaryTitleIsDetached];

  return v3;
}

- (void)setSecondaryTitleIsDetached:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(TLKView *)self contentView];
  [v4 setSecondaryTitleIsDetached:v3];
}

- (NSArray)details
{
  id v2 = [(TLKView *)self contentView];
  BOOL v3 = [v2 detailTexts];

  return (NSArray *)v3;
}

- (void)setDetails:(id)a3
{
  id v4 = a3;
  id v5 = [(TLKView *)self contentView];
  [v5 setDetailTexts:v4];
}

- (TLKRichText)footnote
{
  id v2 = [(TLKView *)self contentView];
  BOOL v3 = [v2 footnote];

  return (TLKRichText *)v3;
}

- (void)setFootnote:(id)a3
{
  id v4 = a3;
  id v5 = [(TLKView *)self contentView];
  [v5 setFootnote:v4];
}

- (NSString)footnoteButtonText
{
  id v2 = [(TLKView *)self contentView];
  BOOL v3 = [v2 footnoteButtonText];

  return (NSString *)v3;
}

- (void)setFootnoteButtonText:(id)a3
{
  id v4 = a3;
  id v5 = [(TLKView *)self contentView];
  [v5 setFootnoteButtonText:v4];
}

- (UIView)accessoryView
{
  id v2 = [(TLKView *)self contentView];
  BOOL v3 = [v2 accessoryView];

  return (UIView *)v3;
}

- (void)setAccessoryView:(id)a3
{
  id v4 = a3;
  id v5 = [(TLKView *)self contentView];
  [v5 setAccessoryView:v4];
}

- (void)performBatchUpdates:(id)a3
{
  id v4 = a3;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __38__TLKDetailsView_performBatchUpdates___block_invoke;
  v7[3] = &unk_1E5FD30C0;
  v7[4] = self;
  id v8 = v4;
  v6.receiver = self;
  v6.super_class = (Class)TLKDetailsView;
  id v5 = v4;
  [(TLKView *)&v6 performBatchUpdates:v7];
}

void __38__TLKDetailsView_performBatchUpdates___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) contentView];
  [v2 performBatchUpdates:*(void *)(a1 + 40)];
}

- (id)titleContainer
{
  id v2 = [(TLKView *)self contentView];
  BOOL v3 = [v2 titleContainer];

  return v3;
}

- (id)detailsFields
{
  id v2 = [(TLKView *)self contentView];
  BOOL v3 = [v2 detailsFields];

  return v3;
}

- (id)detailsStrings
{
  id v2 = [(TLKView *)self contentView];
  BOOL v3 = [v2 detailsStrings];

  return v3;
}

- (id)footnoteLabel
{
  id v2 = [(TLKView *)self contentView];
  BOOL v3 = [v2 footnoteLabel];

  return v3;
}

- (id)footnoteLabelString
{
  id v2 = [(TLKView *)self contentView];
  BOOL v3 = [v2 footnoteLabelString];

  return v3;
}

- (id)footnoteButton
{
  id v2 = [(TLKView *)self contentView];
  BOOL v3 = [v2 footnoteButton];

  return v3;
}

- (id)footnoteContainer
{
  id v2 = [(TLKView *)self contentView];
  BOOL v3 = [v2 footnoteContainer];

  return v3;
}

- (void)layoutMarginsDidChange
{
  [(TLKDetailsView *)self layoutMargins];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  id v11 = [(TLKView *)self contentView];
  objc_msgSend(v11, "setLayoutMargins:", v4, v6, v8, v10);
}

- (id)viewForFirstBaselineLayout
{
  id v2 = [(TLKView *)self contentView];
  double v3 = [v2 viewForFirstBaselineLayout];

  return v3;
}

- (id)viewForLastBaselineLayout
{
  id v2 = [(TLKView *)self contentView];
  double v3 = [v2 viewForLastBaselineLayout];

  return v3;
}

- (BOOL)isAccessoryViewBottomAligned
{
  id v2 = [(TLKView *)self contentView];
  char v3 = [v2 isAccessoryViewBottomAligned];

  return v3;
}

- (void)setIsAccessoryViewBottomAligned:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(TLKView *)self contentView];
  [v4 setIsAccessoryViewBottomAligned:v3];
}

- (TLKDetailsViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (TLKDetailsViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end