@interface ICNoteBrowseGalleryFolderCollectionViewCell
- (BOOL)isAccessibilityElement;
- (ICAccessibilityCustomActionsDelegate)accessibilityCustomActionsDelegate;
- (ICFolder)folder;
- (ICNoteBrowseFolderThumbnailView)thumbnailView;
- (ICNoteResultsImageBadgeView)smartFolderBadgeView;
- (NSLayoutConstraint)thumbnailTitleSpaceConstraint;
- (UILabel)summaryLabel;
- (UILabel)titleLabel;
- (UIView)contextMenuInteractionPreview;
- (id)accessibilityCustomActions;
- (id)accessibilityLabel;
- (id)accessibilityValue;
- (void)awakeFromNib;
- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4;
- (void)setAccessibilityCustomActionsDelegate:(id)a3;
- (void)setFolder:(id)a3;
- (void)setSmartFolderBadgeView:(id)a3;
- (void)setSummaryLabel:(id)a3;
- (void)setThumbnailTitleSpaceConstraint:(id)a3;
- (void)setThumbnailView:(id)a3;
- (void)setTitleLabel:(id)a3;
- (void)updateFocusEffect;
- (void)updateFromConfiguration;
- (void)updateTextAndStatus;
- (void)updateThumbnail;
- (void)updateUI;
@end

@implementation ICNoteBrowseGalleryFolderCollectionViewCell

- (void)awakeFromNib
{
  v19.receiver = self;
  v19.super_class = (Class)ICNoteBrowseGalleryFolderCollectionViewCell;
  [(ICNoteBrowseGalleryFolderCollectionViewCell *)&v19 awakeFromNib];
  v3 = [(ICNoteBrowseGalleryFolderCollectionViewCell *)self smartFolderBadgeView];
  [v3 setSystemImageName:@"gearshape.fill"];

  unsigned int v4 = [(ICNoteBrowseGalleryFolderCollectionViewCell *)self ic_hasCompactWidth];
  UIFontTextStyle v5 = UIFontTextStyleBody;
  if (v4) {
    UIFontTextStyle v5 = UIFontTextStyleSubheadline;
  }
  v6 = v5;
  v7 = +[UIFont ic_preferredFontForStyle:v6 symbolicTraits:0x8000];
  v8 = [v7 ic_fontWithSingleLineA];

  v9 = [(ICNoteBrowseGalleryFolderCollectionViewCell *)self titleLabel];
  [v9 setFont:v8];

  if (+[UIDevice ic_isVision])
  {
    UIFontTextStyle v10 = UIFontTextStyleFootnote;
  }
  else
  {
    unsigned int v11 = [(ICNoteBrowseGalleryFolderCollectionViewCell *)self ic_hasCompactWidth];
    UIFontTextStyle v10 = UIFontTextStyleCaption1;
    if (!v11) {
      UIFontTextStyle v10 = UIFontTextStyleSubheadline;
    }
  }
  v12 = v10;
  v13 = +[UIFont ic_preferredFontForStyle:v12 symbolicTraits:0x8000];
  v14 = [v13 ic_fontWithSingleLineA];

  v15 = [(ICNoteBrowseGalleryFolderCollectionViewCell *)self summaryLabel];
  [v15 setFont:v14];

  v16 = +[UIBackgroundConfiguration clearConfiguration];
  [(ICNoteBrowseGalleryFolderCollectionViewCell *)self setBackgroundConfiguration:v16];

  double v17 = 8.0;
  if ((+[UIDevice ic_isVision] & 1) == 0)
  {
    if ([(ICNoteBrowseGalleryFolderCollectionViewCell *)self ic_hasCompactWidth]) {
      double v17 = 10.0;
    }
    else {
      double v17 = 12.0;
    }
  }
  v18 = [(ICNoteBrowseGalleryFolderCollectionViewCell *)self thumbnailTitleSpaceConstraint];
  [v18 setConstant:v17];
}

- (void)updateFromConfiguration
{
  [(ICNoteBrowseGalleryFolderCollectionViewCell *)self updateTextAndStatus];

  [(ICNoteBrowseGalleryFolderCollectionViewCell *)self updateThumbnail];
}

- (void)setFolder:(id)a3
{
  objc_storeStrong((id *)&self->_folder, a3);

  [(ICNoteBrowseGalleryFolderCollectionViewCell *)self updateUI];
}

- (UIView)contextMenuInteractionPreview
{
  v2 = [(ICNoteBrowseGalleryFolderCollectionViewCell *)self thumbnailView];
  v3 = [v2 contextMenuInteractionPreview];

  return (UIView *)v3;
}

- (void)updateTextAndStatus
{
  v3 = [(ICNoteBrowseGalleryFolderCollectionViewCell *)self folder];
  unsigned int v4 = [v3 localizedTitle];
  UIFontTextStyle v5 = [(ICNoteBrowseGalleryFolderCollectionViewCell *)self titleLabel];
  [v5 setText:v4];

  v6 = +[NSBundle mainBundle];
  v7 = [v6 localizedStringForKey:@"%lu Notes" value:&stru_10063F3D8 table:0];
  v8 = [(ICNoteBrowseGalleryFolderCollectionViewCell *)self folder];
  v9 = [v8 visibleNotes];
  UIFontTextStyle v10 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v7, [v9 count]);
  unsigned int v11 = [(ICNoteBrowseGalleryFolderCollectionViewCell *)self summaryLabel];
  [v11 setText:v10];

  v12 = [(ICNoteBrowseGalleryFolderCollectionViewCell *)self folder];
  LODWORD(v10) = [v12 isSharedRootObject];

  v13 = [(ICBaseNoteResultsCollectionViewCell *)self collaboratorsBadgeView];
  v14 = v13;
  if (v10)
  {
    [v13 setHidden:0];

    v14 = [(ICNoteBrowseGalleryFolderCollectionViewCell *)self folder];
    v15 = [v14 serverShareCheckingParent];
    v16 = [(ICBaseNoteResultsCollectionViewCell *)self collaboratorsBadgeView];
    [v16 setShare:v15];
  }
  else
  {
    [v13 setHidden:1];
  }

  id v19 = [(ICNoteBrowseGalleryFolderCollectionViewCell *)self folder];
  uint64_t v17 = [v19 isSmartFolder] ^ 1;
  v18 = [(ICNoteBrowseGalleryFolderCollectionViewCell *)self smartFolderBadgeView];
  [v18 setHidden:v17];
}

- (void)updateThumbnail
{
  id v4 = [(ICNoteBrowseGalleryFolderCollectionViewCell *)self folder];
  v3 = [(ICNoteBrowseGalleryFolderCollectionViewCell *)self thumbnailView];
  [v3 setFolder:v4];
}

- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4
{
  UIFontTextStyle v5 = [a3 nextFocusedItem];
  unsigned int v6 = [v5 isEqual:self];

  if (v6)
  {
    [(ICNoteBrowseGalleryFolderCollectionViewCell *)self updateFocusEffect];
  }
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  v3 = [(ICNoteBrowseGalleryFolderCollectionViewCell *)self folder];
  unsigned int v4 = [v3 isSharedViaICloud];
  UIFontTextStyle v5 = +[NSBundle mainBundle];
  unsigned int v6 = v5;
  if (v4) {
    CFStringRef v7 = @"Shared Folder";
  }
  else {
    CFStringRef v7 = @"Folder";
  }
  v8 = [v5 localizedStringForKey:v7 value:&stru_10063F3D8 table:0];

  v9 = [(ICNoteBrowseGalleryFolderCollectionViewCell *)self titleLabel];
  UIFontTextStyle v10 = [v9 text];
  unsigned int v11 = [(ICNoteBrowseGalleryFolderCollectionViewCell *)self summaryLabel];
  v14 = [v11 text];
  v12 = __ICAccessibilityStringForVariables();

  return v12;
}

- (id)accessibilityValue
{
  v13.receiver = self;
  v13.super_class = (Class)ICNoteBrowseGalleryFolderCollectionViewCell;
  v3 = [(ICNoteBrowseGalleryFolderCollectionViewCell *)&v13 accessibilityValue];
  unsigned int v4 = [(ICNoteBrowseGalleryFolderCollectionViewCell *)self folder];
  unsigned __int8 v5 = [v4 isSharedViaICloud];

  if (v5)
  {
    unsigned int v6 = [(ICBaseNoteResultsCollectionViewCell *)self cloudSharingParticipantNames];
    if ([v6 count])
    {
      CFStringRef v7 = [v6 componentsJoinedByString:@", "];
      v8 = +[NSBundle mainBundle];
      v9 = [v8 localizedStringForKey:@"Folder participants: %@" value:&stru_10063F3D8 table:0];

      uint64_t v10 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v9, v7);

      v3 = (void *)v10;
    }
    id v11 = v3;
  }
  else
  {
    id v11 = v3;
  }

  return v11;
}

- (id)accessibilityCustomActions
{
  v3 = [(ICNoteBrowseGalleryFolderCollectionViewCell *)self accessibilityCustomActionsDelegate];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    unsigned __int8 v5 = [(ICNoteBrowseGalleryFolderCollectionViewCell *)self accessibilityCustomActionsDelegate];
    unsigned int v6 = [(ICNoteBrowseGalleryFolderCollectionViewCell *)self folder];
    CFStringRef v7 = [v6 objectID];
    v8 = [v5 customAccessibilityActionsForObjectID:v7 galleryView:1];
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void)updateUI
{
  [(ICNoteBrowseGalleryFolderCollectionViewCell *)self updateTextAndStatus];
  [(ICNoteBrowseGalleryFolderCollectionViewCell *)self updateThumbnail];
  id v3 = [(ICNoteBrowseGalleryFolderCollectionViewCell *)self folder];
  [(ICNoteBrowseGalleryFolderCollectionViewCell *)self ic_annotateWithFolder:v3];
}

- (void)updateFocusEffect
{
  id v14 = [(ICNoteBrowseGalleryFolderCollectionViewCell *)self thumbnailView];
  [v14 frame];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  id v11 = [(ICNoteBrowseGalleryFolderCollectionViewCell *)self thumbnailView];
  [v11 cornerRadius];
  objc_super v13 = +[UIFocusHaloEffect effectWithRoundedRect:cornerRadius:curve:](UIFocusHaloEffect, "effectWithRoundedRect:cornerRadius:curve:", kCACornerCurveContinuous, v4, v6, v8, v10, v12);
  [(ICNoteBrowseGalleryFolderCollectionViewCell *)self setFocusEffect:v13];
}

- (ICFolder)folder
{
  return self->_folder;
}

- (ICAccessibilityCustomActionsDelegate)accessibilityCustomActionsDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_accessibilityCustomActionsDelegate);

  return (ICAccessibilityCustomActionsDelegate *)WeakRetained;
}

- (void)setAccessibilityCustomActionsDelegate:(id)a3
{
}

- (ICNoteResultsImageBadgeView)smartFolderBadgeView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_smartFolderBadgeView);

  return (ICNoteResultsImageBadgeView *)WeakRetained;
}

- (void)setSmartFolderBadgeView:(id)a3
{
}

- (UILabel)titleLabel
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_titleLabel);

  return (UILabel *)WeakRetained;
}

- (void)setTitleLabel:(id)a3
{
}

- (UILabel)summaryLabel
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_summaryLabel);

  return (UILabel *)WeakRetained;
}

- (void)setSummaryLabel:(id)a3
{
}

- (ICNoteBrowseFolderThumbnailView)thumbnailView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_thumbnailView);

  return (ICNoteBrowseFolderThumbnailView *)WeakRetained;
}

- (void)setThumbnailView:(id)a3
{
}

- (NSLayoutConstraint)thumbnailTitleSpaceConstraint
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_thumbnailTitleSpaceConstraint);

  return (NSLayoutConstraint *)WeakRetained;
}

- (void)setThumbnailTitleSpaceConstraint:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_thumbnailTitleSpaceConstraint);
  objc_destroyWeak((id *)&self->_thumbnailView);
  objc_destroyWeak((id *)&self->_summaryLabel);
  objc_destroyWeak((id *)&self->_titleLabel);
  objc_destroyWeak((id *)&self->_smartFolderBadgeView);
  objc_destroyWeak((id *)&self->_accessibilityCustomActionsDelegate);

  objc_storeStrong((id *)&self->_folder, 0);
}

@end