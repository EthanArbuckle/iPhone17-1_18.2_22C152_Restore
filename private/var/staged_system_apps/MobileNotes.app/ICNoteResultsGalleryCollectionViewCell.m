@interface ICNoteResultsGalleryCollectionViewCell
+ (ICNoteResultsGalleryCollectionViewCell)sizingCell;
+ (double)heightForItemWidth:(double)a3 showsParticipantsInfo:(BOOL)a4 showsFolderAndOrAccountName:(BOOL)a5;
- (BOOL)canBeEdited;
- (BOOL)isAccessibilityElement;
- (ICAccessibilityCustomActionsDelegate)accessibilityCustomActionsDelegate;
- (ICNoteResultsGalleryCollectionViewCell)initWithCoder:(id)a3;
- (ICNoteResultsImageBadgeView)pinnedBadgeView;
- (ICNoteResultsSelectionIndicatorView)selectionIndicatorView;
- (ICNoteResultsThumbnailView)thumbnailView;
- (NSLayoutConstraint)thumbnailTitleSpacerHeightConstraint;
- (UIImageView)folderImageView;
- (UIImageView)statusIndicatorImageView;
- (UILabel)folderAndAccountLabel;
- (UILabel)participantsLabel;
- (UILabel)summaryLabel;
- (UILabel)titleLabel;
- (UIStackView)folderAndAccountLabelStackView;
- (id)accessibilityCustomActions;
- (id)accessibilityCustomContent;
- (id)accessibilityLabel;
- (id)accessibilityValue;
- (unsigned)_accessibilityMediaAnalysisOptions;
- (void)awakeFromNib;
- (void)contentSizeCategoryDidChange:(id)a3;
- (void)dealloc;
- (void)layoutSubviews;
- (void)setAccessibilityCustomActionsDelegate:(id)a3;
- (void)setEditing:(BOOL)a3;
- (void)setFolderAndAccountLabel:(id)a3;
- (void)setFolderAndAccountLabelStackView:(id)a3;
- (void)setFolderImageView:(id)a3;
- (void)setParticipantsLabel:(id)a3;
- (void)setPinnedBadgeView:(id)a3;
- (void)setSelected:(BOOL)a3;
- (void)setSelectionIndicatorView:(id)a3;
- (void)setStatusIndicatorImageView:(id)a3;
- (void)setSummaryLabel:(id)a3;
- (void)setThumbnailTitleSpacerHeightConstraint:(id)a3;
- (void)setThumbnailView:(id)a3;
- (void)setTitleLabel:(id)a3;
- (void)updateFromConfiguration;
- (void)updateSelectionIndicator;
- (void)updateThumbnail;
@end

@implementation ICNoteResultsGalleryCollectionViewCell

- (ICNoteResultsGalleryCollectionViewCell)initWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)ICNoteResultsGalleryCollectionViewCell;
  v3 = [(ICBaseNoteResultsCollectionViewCell *)&v6 initWithCoder:a3];
  if (v3)
  {
    v4 = +[NSNotificationCenter defaultCenter];
    [v4 addObserver:v3 selector:"contentSizeCategoryDidChange:" name:UIContentSizeCategoryDidChangeNotification object:0];
  }
  return v3;
}

- (void)awakeFromNib
{
  v26.receiver = self;
  v26.super_class = (Class)ICNoteResultsGalleryCollectionViewCell;
  [(ICNoteResultsGalleryCollectionViewCell *)&v26 awakeFromNib];
  v3 = +[UIBackgroundConfiguration clearConfiguration];
  [(ICNoteResultsGalleryCollectionViewCell *)self setBackgroundConfiguration:v3];
  double v4 = 8.0;
  if ((+[UIDevice ic_isVision] & 1) == 0)
  {
    if ([(ICNoteResultsGalleryCollectionViewCell *)self ic_hasCompactWidth]) {
      double v4 = 10.0;
    }
    else {
      double v4 = 12.0;
    }
  }
  v5 = [(ICNoteResultsGalleryCollectionViewCell *)self thumbnailTitleSpacerHeightConstraint];
  [v5 setConstant:v4];

  unsigned int v6 = [(ICNoteResultsGalleryCollectionViewCell *)self ic_hasCompactWidth];
  UIFontTextStyle v7 = UIFontTextStyleBody;
  if (v6) {
    UIFontTextStyle v7 = UIFontTextStyleSubheadline;
  }
  v8 = v7;
  v9 = +[UIFont ic_preferredFontForStyle:v8 symbolicTraits:0x8000];
  v10 = [v9 ic_fontWithSingleLineA];

  v11 = [(ICNoteResultsGalleryCollectionViewCell *)self titleLabel];
  [v11 setFont:v10];

  if (+[UIDevice ic_isVision])
  {
    UIFontTextStyle v12 = UIFontTextStyleFootnote;
  }
  else
  {
    unsigned int v13 = [(ICNoteResultsGalleryCollectionViewCell *)self ic_hasCompactWidth];
    UIFontTextStyle v12 = UIFontTextStyleCaption1;
    if (!v13) {
      UIFontTextStyle v12 = UIFontTextStyleSubheadline;
    }
  }
  v14 = v12;
  v15 = +[UIFont ic_preferredFontForStyle:v14 symbolicTraits:0x8000];
  v16 = [v15 ic_fontWithSingleLineA];

  v17 = [(ICNoteResultsGalleryCollectionViewCell *)self summaryLabel];
  [v17 setFont:v16];

  v18 = [(ICNoteResultsGalleryCollectionViewCell *)self participantsLabel];
  [v18 setFont:v16];

  v19 = [(ICNoteResultsGalleryCollectionViewCell *)self folderAndAccountLabel];
  [v19 setFont:v16];

  v20 = [(ICNoteResultsGalleryCollectionViewCell *)self thumbnailView];
  v21 = [(ICNoteResultsGalleryCollectionViewCell *)self pinnedBadgeView];
  [v20 bringSubviewToFront:v21];

  v22 = [(ICNoteResultsGalleryCollectionViewCell *)self thumbnailView];
  v23 = [(ICNoteResultsGalleryCollectionViewCell *)self selectionIndicatorView];
  [v22 bringSubviewToFront:v23];

  v24 = [(ICNoteResultsGalleryCollectionViewCell *)self thumbnailView];
  v25 = [(ICBaseNoteResultsCollectionViewCell *)self collaboratorsBadgeView];
  [v24 bringSubviewToFront:v25];

  [(ICBaseNoteResultsCollectionViewCell *)self updateViewStateProperties];
}

- (void)layoutSubviews
{
  v5.receiver = self;
  v5.super_class = (Class)ICNoteResultsGalleryCollectionViewCell;
  [(ICBaseNoteResultsCollectionViewCell *)&v5 layoutSubviews];
  [(ICNoteResultsGalleryCollectionViewCell *)self bounds];
  double Width = CGRectGetWidth(v6);
  double v4 = [(ICNoteResultsGalleryCollectionViewCell *)self titleLabel];
  [v4 setPreferredMaxLayoutWidth:Width];
}

- (void)dealloc
{
  v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self name:UIContentSizeCategoryDidChangeNotification object:0];

  v4.receiver = self;
  v4.super_class = (Class)ICNoteResultsGalleryCollectionViewCell;
  [(ICNoteResultsGalleryCollectionViewCell *)&v4 dealloc];
}

+ (double)heightForItemWidth:(double)a3 showsParticipantsInfo:(BOOL)a4 showsFolderAndOrAccountName:(BOOL)a5
{
  UIFontTextStyle v7 = +[ICNoteResultsCellConfiguration sizingConfigurationWithShowParticipantsInfo:a4 showsFolderName:a5];
  v8 = [a1 sizingCell];
  [v8 setConfiguration:v7];

  v9 = [a1 sizingCell];
  [v9 updateFromConfiguration];

  v10 = [a1 sizingCell];
  LODWORD(v11) = 1148846080;
  LODWORD(v12) = 1112014848;
  [v10 systemLayoutSizeFittingSize:a3 withHorizontalFittingPriority:UILayoutFittingCompressedSize.height verticalFittingPriority:v11 v12];
  double v14 = v13;

  return v14;
}

- (void)updateFromConfiguration
{
  v3 = [(ICBaseNoteResultsCollectionViewCell *)self configuration];
  uint64_t v4 = [v3 showParticipantsInfo] ^ 1;
  objc_super v5 = [(ICNoteResultsGalleryCollectionViewCell *)self participantsLabel];
  [v5 setHidden:v4];

  CGRect v6 = [(ICBaseNoteResultsCollectionViewCell *)self configuration];
  unsigned __int8 v7 = [v6 showFolderName];
  if (v7)
  {
    uint64_t v8 = 0;
  }
  else
  {
    objc_super v5 = [(ICBaseNoteResultsCollectionViewCell *)self configuration];
    uint64_t v8 = [v5 showAccountName] ^ 1;
  }
  v9 = [(ICNoteResultsGalleryCollectionViewCell *)self folderAndAccountLabelStackView];
  [v9 setHidden:v8];

  if ((v7 & 1) == 0) {
  v10 = [(ICBaseNoteResultsCollectionViewCell *)self configuration];
  }
  unsigned __int8 v11 = [v10 isDataLoaded];

  double v12 = [(ICBaseNoteResultsCollectionViewCell *)self configuration];
  double v13 = v12;
  if ((v11 & 1) == 0)
  {
    v34 = [v12 note];
    v35 = [v34 title];
    v36 = [(ICNoteResultsGalleryCollectionViewCell *)self titleLabel];
    [v36 setText:v35];

    v37 = [(ICNoteResultsGalleryCollectionViewCell *)self summaryLabel];
    [v37 setText:@" "];

    v38 = [(ICBaseNoteResultsCollectionViewCell *)self configuration];
    LODWORD(v34) = [v38 showParticipantsInfo];

    if (v34)
    {
      v39 = [(ICNoteResultsGalleryCollectionViewCell *)self participantsLabel];
      [v39 setText:@" "];
    }
    v40 = [(ICBaseNoteResultsCollectionViewCell *)self configuration];
    unsigned int v41 = [v40 showsNoteContainer];

    if (v41)
    {
      v42 = [(ICNoteResultsGalleryCollectionViewCell *)self folderAndAccountLabel];
      [v42 setText:@" "];
    }
    v43 = [(ICNoteResultsGalleryCollectionViewCell *)self statusIndicatorImageView];
    [v43 setHidden:1];

    v44 = [(ICNoteResultsGalleryCollectionViewCell *)self pinnedBadgeView];
    [v44 setHidden:1];

    v45 = [(ICBaseNoteResultsCollectionViewCell *)self collaboratorsBadgeView];
    v46 = v45;
    goto LABEL_19;
  }
  double v14 = [v12 titleString];
  v15 = [(ICNoteResultsGalleryCollectionViewCell *)self titleLabel];
  [v15 setText:v14];

  v16 = [(ICBaseNoteResultsCollectionViewCell *)self configuration];
  v17 = [v16 dateString];
  v18 = [(ICNoteResultsGalleryCollectionViewCell *)self summaryLabel];
  [v18 setText:v17];

  v19 = [(ICBaseNoteResultsCollectionViewCell *)self configuration];
  v20 = [v19 participantsInfoString];
  v21 = [(ICNoteResultsGalleryCollectionViewCell *)self participantsLabel];
  [v21 setText:v20];

  v22 = [(ICBaseNoteResultsCollectionViewCell *)self configuration];
  v23 = [v22 folderAndAccountInfoString];
  v24 = [(ICNoteResultsGalleryCollectionViewCell *)self folderAndAccountLabel];
  [v24 setText:v23];

  v25 = [(ICBaseNoteResultsCollectionViewCell *)self configuration];
  objc_super v26 = [v25 folderImage];
  v27 = [(ICNoteResultsGalleryCollectionViewCell *)self folderImageView];
  [v27 setImage:v26];

  v28 = [(ICBaseNoteResultsCollectionViewCell *)self configuration];
  LODWORD(v26) = [v28 showUnreadIndicator];

  v29 = [(ICNoteResultsGalleryCollectionViewCell *)self statusIndicatorImageView];
  v30 = v29;
  if (v26)
  {
    [v29 setHidden:0];

    v31 = [(ICBaseNoteResultsCollectionViewCell *)self configuration];
    v32 = [v31 unreadIndicatorImage];
    v33 = [(ICNoteResultsGalleryCollectionViewCell *)self statusIndicatorImageView];
    [v33 setImage:v32];
  }
  else
  {
    [v29 setHidden:1];

    v47 = [(ICNoteResultsGalleryCollectionViewCell *)self statusIndicatorImageView];
    v48 = [v47 image];

    if (!v48) {
      goto LABEL_17;
    }
    v31 = [(ICNoteResultsGalleryCollectionViewCell *)self statusIndicatorImageView];
    [v31 setImage:0];
  }

LABEL_17:
  v49 = [(ICBaseNoteResultsCollectionViewCell *)self configuration];
  uint64_t v50 = [v49 showPinnedBadge] ^ 1;
  v51 = [(ICNoteResultsGalleryCollectionViewCell *)self pinnedBadgeView];
  [v51 setHidden:v50];

  v52 = [(ICBaseNoteResultsCollectionViewCell *)self configuration];
  LODWORD(v50) = [v52 showCollaboratorsBadge];

  v45 = [(ICBaseNoteResultsCollectionViewCell *)self collaboratorsBadgeView];
  v46 = v45;
  if (v50)
  {
    [v45 setHidden:0];

    v53 = [(ICBaseNoteResultsCollectionViewCell *)self configuration];
    v46 = [v53 note];

    objc_opt_class();
    v54 = ICDynamicCast();
    v55 = [v54 serverShareCheckingParent];
    v56 = [(ICBaseNoteResultsCollectionViewCell *)self collaboratorsBadgeView];
    [v56 setShare:v55];

    goto LABEL_20;
  }
LABEL_19:
  [v45 setHidden:1];
LABEL_20:

  [(ICNoteResultsGalleryCollectionViewCell *)self updateThumbnail];
}

- (void)contentSizeCategoryDidChange:(id)a3
{
  v3 = (void *)qword_1006AA250;
  if (qword_1006AA250)
  {
    qword_1006AA250 = 0;

    qword_1006AA258 = 0;
  }
}

- (void)updateThumbnail
{
  v3 = [(ICBaseNoteResultsCollectionViewCell *)self configuration];
  uint64_t v4 = [v3 note];
  objc_super v5 = [(ICNoteResultsGalleryCollectionViewCell *)self thumbnailView];
  [v5 setNote:v4];

  id v8 = [(ICBaseNoteResultsCollectionViewCell *)self configuration];
  CGRect v6 = [v8 invitation];
  unsigned __int8 v7 = [(ICNoteResultsGalleryCollectionViewCell *)self thumbnailView];
  [v7 setInvitation:v6];
}

- (void)setSelected:(BOOL)a3
{
  BOOL v3 = a3;
  unsigned int v5 = [(ICNoteResultsGalleryCollectionViewCell *)self isSelected];
  v6.receiver = self;
  v6.super_class = (Class)ICNoteResultsGalleryCollectionViewCell;
  [(ICNoteResultsGalleryCollectionViewCell *)&v6 setSelected:v3];
  if (v5 != v3) {
    [(ICNoteResultsGalleryCollectionViewCell *)self updateSelectionIndicator];
  }
}

- (BOOL)canBeEdited
{
  return 1;
}

- (void)setEditing:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)ICNoteResultsGalleryCollectionViewCell;
  [(ICNoteResultsGalleryCollectionViewCell *)&v4 setEditing:a3];
  [(ICNoteResultsGalleryCollectionViewCell *)self updateSelectionIndicator];
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  v2 = [(ICBaseNoteResultsCollectionViewCell *)self configuration];
  BOOL v3 = [v2 accessibilityLabel];

  return v3;
}

- (id)accessibilityValue
{
  v13.receiver = self;
  v13.super_class = (Class)ICNoteResultsGalleryCollectionViewCell;
  BOOL v3 = [(ICNoteResultsGalleryCollectionViewCell *)&v13 accessibilityValue];
  objc_super v4 = [(ICBaseNoteResultsCollectionViewCell *)self configuration];
  unsigned __int8 v5 = [v4 showCollaboratorsBadge];

  if (v5)
  {
    objc_super v6 = [(ICBaseNoteResultsCollectionViewCell *)self cloudSharingParticipantNames];
    if ([v6 count])
    {
      unsigned __int8 v7 = [v6 componentsJoinedByString:@", "];
      id v8 = +[NSBundle mainBundle];
      v9 = [v8 localizedStringForKey:@"Note participants: %@" value:&stru_10063F3D8 table:0];

      uint64_t v10 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v9, v7);

      BOOL v3 = (void *)v10;
    }
    id v11 = v3;
  }
  else
  {
    id v11 = v3;
  }

  return v11;
}

- (unsigned)_accessibilityMediaAnalysisOptions
{
  return 0;
}

- (id)accessibilityCustomActions
{
  BOOL v3 = [(ICNoteResultsGalleryCollectionViewCell *)self accessibilityCustomActionsDelegate];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    unsigned __int8 v5 = [(ICNoteResultsGalleryCollectionViewCell *)self accessibilityCustomActionsDelegate];
    objc_super v6 = [(ICBaseNoteResultsCollectionViewCell *)self configuration];
    unsigned __int8 v7 = [v6 note];
    id v8 = [v7 objectID];
    v9 = [v5 customAccessibilityActionsForObjectID:v8 galleryView:1];
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)accessibilityCustomContent
{
  BOOL v3 = +[NSMutableArray array];
  objc_opt_class();
  char v4 = [(ICBaseNoteResultsCollectionViewCell *)self configuration];
  unsigned __int8 v5 = [v4 note];
  objc_super v6 = ICDynamicCast();
  unsigned __int8 v7 = [v6 icaxGalleryViewCustomContentDescription];

  if (v7)
  {
    id v8 = +[NSBundle mainBundle];
    v9 = [v8 localizedStringForKey:@"Thumbnail description" value:&stru_10063F3D8 table:0];

    uint64_t v10 = +[AXCustomContent customContentWithLabel:v9 value:v7];
    [v3 addObject:v10];
  }

  return v3;
}

+ (ICNoteResultsGalleryCollectionViewCell)sizingCell
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000E3480;
  block[3] = &unk_100627688;
  block[4] = a1;
  if (qword_1006AA258 != -1) {
    dispatch_once(&qword_1006AA258, block);
  }
  v2 = (void *)qword_1006AA250;

  return (ICNoteResultsGalleryCollectionViewCell *)v2;
}

- (void)updateSelectionIndicator
{
  uint64_t v3 = [(ICNoteResultsGalleryCollectionViewCell *)self isEditing] ^ 1;
  char v4 = [(ICNoteResultsGalleryCollectionViewCell *)self selectionIndicatorView];
  [v4 setHidden:v3];

  unsigned __int8 v5 = [(ICNoteResultsGalleryCollectionViewCell *)self selectionIndicatorView];
  LODWORD(v4) = [v5 isSelected];
  if (v4 == [(ICNoteResultsGalleryCollectionViewCell *)self isSelected])
  {
    unsigned __int8 v6 = [(ICNoteResultsGalleryCollectionViewCell *)self isEditing];

    if ((v6 & 1) == 0) {
      goto LABEL_5;
    }
  }
  else
  {
  }
  id v7 = [(ICNoteResultsGalleryCollectionViewCell *)self isSelected];
  id v8 = [(ICNoteResultsGalleryCollectionViewCell *)self selectionIndicatorView];
  [v8 setSelected:v7];

LABEL_5:
  if ([(ICNoteResultsGalleryCollectionViewCell *)self isEditing])
  {
    double v9 = 2.0;
    if ([(ICNoteResultsGalleryCollectionViewCell *)self isSelected]) {
      goto LABEL_11;
    }
LABEL_10:
    double v9 = 0.0;
    goto LABEL_11;
  }
  if (![(ICNoteResultsGalleryCollectionViewCell *)self isFocused]) {
    goto LABEL_10;
  }
  double v9 = 2.0;
  if ([(ICNoteResultsGalleryCollectionViewCell *)self isSelected]) {
    goto LABEL_10;
  }
LABEL_11:
  uint64_t v10 = [(ICNoteResultsGalleryCollectionViewCell *)self thumbnailView];
  id v11 = [v10 layer];
  [v11 setBorderWidth:v9];

  id v15 = [(ICNoteResultsGalleryCollectionViewCell *)self tintColor];
  id v12 = [v15 CGColor];
  objc_super v13 = [(ICNoteResultsGalleryCollectionViewCell *)self thumbnailView];
  double v14 = [v13 layer];
  [v14 setBorderColor:v12];
}

- (ICAccessibilityCustomActionsDelegate)accessibilityCustomActionsDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_accessibilityCustomActionsDelegate);

  return (ICAccessibilityCustomActionsDelegate *)WeakRetained;
}

- (void)setAccessibilityCustomActionsDelegate:(id)a3
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

- (UILabel)participantsLabel
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_participantsLabel);

  return (UILabel *)WeakRetained;
}

- (void)setParticipantsLabel:(id)a3
{
}

- (UILabel)folderAndAccountLabel
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_folderAndAccountLabel);

  return (UILabel *)WeakRetained;
}

- (void)setFolderAndAccountLabel:(id)a3
{
}

- (UIImageView)folderImageView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_folderImageView);

  return (UIImageView *)WeakRetained;
}

- (void)setFolderImageView:(id)a3
{
}

- (UIStackView)folderAndAccountLabelStackView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_folderAndAccountLabelStackView);

  return (UIStackView *)WeakRetained;
}

- (void)setFolderAndAccountLabelStackView:(id)a3
{
}

- (ICNoteResultsImageBadgeView)pinnedBadgeView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_pinnedBadgeView);

  return (ICNoteResultsImageBadgeView *)WeakRetained;
}

- (void)setPinnedBadgeView:(id)a3
{
}

- (ICNoteResultsSelectionIndicatorView)selectionIndicatorView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_selectionIndicatorView);

  return (ICNoteResultsSelectionIndicatorView *)WeakRetained;
}

- (void)setSelectionIndicatorView:(id)a3
{
}

- (UIImageView)statusIndicatorImageView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_statusIndicatorImageView);

  return (UIImageView *)WeakRetained;
}

- (void)setStatusIndicatorImageView:(id)a3
{
}

- (ICNoteResultsThumbnailView)thumbnailView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_thumbnailView);

  return (ICNoteResultsThumbnailView *)WeakRetained;
}

- (void)setThumbnailView:(id)a3
{
}

- (NSLayoutConstraint)thumbnailTitleSpacerHeightConstraint
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_thumbnailTitleSpacerHeightConstraint);

  return (NSLayoutConstraint *)WeakRetained;
}

- (void)setThumbnailTitleSpacerHeightConstraint:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_thumbnailTitleSpacerHeightConstraint);
  objc_destroyWeak((id *)&self->_thumbnailView);
  objc_destroyWeak((id *)&self->_statusIndicatorImageView);
  objc_destroyWeak((id *)&self->_selectionIndicatorView);
  objc_destroyWeak((id *)&self->_pinnedBadgeView);
  objc_destroyWeak((id *)&self->_folderAndAccountLabelStackView);
  objc_destroyWeak((id *)&self->_folderImageView);
  objc_destroyWeak((id *)&self->_folderAndAccountLabel);
  objc_destroyWeak((id *)&self->_participantsLabel);
  objc_destroyWeak((id *)&self->_summaryLabel);
  objc_destroyWeak((id *)&self->_titleLabel);

  objc_destroyWeak((id *)&self->_accessibilityCustomActionsDelegate);
}

@end