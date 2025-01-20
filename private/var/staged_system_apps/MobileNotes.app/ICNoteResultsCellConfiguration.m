@interface ICNoteResultsCellConfiguration
+ (NSManagedObjectContext)legacyBackgroundContext;
+ (NSManagedObjectContext)modernBackgroundContext;
+ (OS_dispatch_queue)loadDataQueue;
+ (id)sizingConfigurationWithShowParticipantsInfo:(BOOL)a3 showsFolderName:(BOOL)a4;
- (BOOL)hasThumbnailImage;
- (BOOL)hideThumbnailImage;
- (BOOL)isDataLoaded;
- (BOOL)isDisplayedInFolder;
- (BOOL)isLargerThanAXLarge;
- (BOOL)showAccountName;
- (BOOL)showCollaboratorsBadge;
- (BOOL)showFolderName;
- (BOOL)showParticipantsInfo;
- (BOOL)showPinnedBadge;
- (BOOL)showUnreadIndicator;
- (BOOL)showsNoteContainer;
- (BOOL)styleForCalculator;
- (CGRect)estimatedSummaryLabelFrame;
- (CGRect)estimatedTitleLabelFrame;
- (ICFolderCustomNoteSortType)folderNoteSortType;
- (ICInvitation)invitation;
- (ICNoteContainer)noteContainer;
- (ICNoteResultsCellConfiguration)initWithInvitation:(id)a3;
- (ICNoteResultsCellConfiguration)initWithNote:(id)a3;
- (ICNoteResultsCellConfiguration)initWithSearchResult:(id)a3;
- (ICSearchIndexableNote)note;
- (ICSearchResult)searchResult;
- (NSAttributedString)summaryAttributedString;
- (NSAttributedString)titleAttributedString;
- (NSDictionary)folderAndAccountLabelAttributes;
- (NSDictionary)summaryLabelAttributes;
- (NSDictionary)titleLabelAttributes;
- (NSString)dateString;
- (NSString)folderAndAccountInfoString;
- (NSString)participantsInfoString;
- (NSString)summaryString;
- (NSString)titleString;
- (NoteCollectionObject)noteCollectionObject;
- (UIColor)highlightColor;
- (UIColor)primaryStatusImageTintColor;
- (UIColor)secondaryStatusImageTintColor;
- (UIImage)folderImage;
- (UIImage)primaryStatusImage;
- (UIImage)secondaryStatusImage;
- (UIImage)unreadIndicatorImage;
- (double)maxLengthForAttributes:(id)a3 frame:(CGRect)a4;
- (id)accessibilityLabel;
- (id)symbolImageConfiguration;
- (unint64_t)maxNumberOfLabelLines;
- (void)clearData;
- (void)commonInit;
- (void)loadDataWithCompletion:(id)a3;
- (void)loadDataWithContext:(id)a3;
- (void)loadInvitationDataWithContext:(id)a3;
- (void)loadNoteDataWithContext:(id)a3;
- (void)setDateString:(id)a3;
- (void)setEstimatedSummaryLabelFrame:(CGRect)a3;
- (void)setEstimatedTitleLabelFrame:(CGRect)a3;
- (void)setFolderAndAccountInfoString:(id)a3;
- (void)setFolderAndAccountLabelAttributes:(id)a3;
- (void)setFolderImage:(id)a3;
- (void)setFolderNoteSortType:(id)a3;
- (void)setHasThumbnailImage:(BOOL)a3;
- (void)setHideThumbnailImage:(BOOL)a3;
- (void)setHighlightColor:(id)a3;
- (void)setIsDataLoaded:(BOOL)a3;
- (void)setIsDisplayedInFolder:(BOOL)a3;
- (void)setMaxNumberOfLabelLines:(unint64_t)a3;
- (void)setNote:(id)a3;
- (void)setNoteCollectionObject:(id)a3;
- (void)setNoteContainer:(id)a3;
- (void)setParticipantsInfoString:(id)a3;
- (void)setPrimaryStatusImage:(id)a3;
- (void)setPrimaryStatusImageTintColor:(id)a3;
- (void)setSecondaryStatusImage:(id)a3;
- (void)setSecondaryStatusImageTintColor:(id)a3;
- (void)setShowAccountName:(BOOL)a3;
- (void)setShowCollaboratorsBadge:(BOOL)a3;
- (void)setShowFolderName:(BOOL)a3;
- (void)setShowParticipantsInfo:(BOOL)a3;
- (void)setShowPinnedBadge:(BOOL)a3;
- (void)setShowUnreadIndicator:(BOOL)a3;
- (void)setStyleForCalculator:(BOOL)a3;
- (void)setSummaryAttributedString:(id)a3;
- (void)setSummaryLabelAttributes:(id)a3;
- (void)setSummaryString:(id)a3;
- (void)setTitleAttributedString:(id)a3;
- (void)setTitleLabelAttributes:(id)a3;
- (void)setTitleString:(id)a3;
- (void)setUnreadIndicatorImage:(id)a3;
- (void)synchronouslyLoadData;
- (void)updateTitleLabelAttributes:(id)a3 summaryLabelAttributes:(id)a4;
- (void)updateTitleLabelAttributes:(id)a3 summaryLabelAttributes:(id)a4 folderAndAccountLabelAttributes:(id)a5 estimatedTitleLabelFrame:(CGRect)a6 estimatedSummaryLabelFrame:(CGRect)a7;
@end

@implementation ICNoteResultsCellConfiguration

- (ICNoteResultsCellConfiguration)initWithNote:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ICNoteResultsCellConfiguration;
  v6 = [(ICNoteResultsCellConfiguration *)&v9 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_note, a3);
    [(ICNoteResultsCellConfiguration *)v7 commonInit];
  }

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_folderAndAccountLabelAttributes, 0);
  objc_storeStrong((id *)&self->_summaryLabelAttributes, 0);
  objc_storeStrong((id *)&self->_titleLabelAttributes, 0);
  objc_storeStrong((id *)&self->_noteCollectionObject, 0);
  objc_storeStrong((id *)&self->_noteContainer, 0);
  objc_storeStrong((id *)&self->_secondaryStatusImageTintColor, 0);
  objc_storeStrong((id *)&self->_secondaryStatusImage, 0);
  objc_storeStrong((id *)&self->_primaryStatusImageTintColor, 0);
  objc_storeStrong((id *)&self->_primaryStatusImage, 0);
  objc_storeStrong((id *)&self->_unreadIndicatorImage, 0);
  objc_storeStrong((id *)&self->_folderImage, 0);
  objc_storeStrong((id *)&self->_searchResult, 0);
  objc_storeStrong((id *)&self->_dateString, 0);
  objc_storeStrong((id *)&self->_folderAndAccountInfoString, 0);
  objc_storeStrong((id *)&self->_participantsInfoString, 0);
  objc_storeStrong((id *)&self->_summaryAttributedString, 0);
  objc_storeStrong((id *)&self->_summaryString, 0);
  objc_storeStrong((id *)&self->_titleAttributedString, 0);
  objc_storeStrong((id *)&self->_titleString, 0);
  objc_storeStrong((id *)&self->_highlightColor, 0);
  objc_storeStrong((id *)&self->_folderNoteSortType, 0);
  objc_storeStrong((id *)&self->_invitation, 0);

  objc_storeStrong((id *)&self->_note, 0);
}

- (BOOL)showFolderName
{
  return self->_showFolderName;
}

- (BOOL)showAccountName
{
  return self->_showAccountName;
}

- (void)setShowParticipantsInfo:(BOOL)a3
{
  self->_showParticipantsInfo = a3;
}

- (void)setShowFolderName:(BOOL)a3
{
  self->_showFolderName = a3;
}

- (void)setShowAccountName:(BOOL)a3
{
  self->_showAccountName = a3;
}

- (void)setIsDisplayedInFolder:(BOOL)a3
{
  self->_isDisplayedInFolder = a3;
}

- (void)setHideThumbnailImage:(BOOL)a3
{
  self->_hideThumbnailImage = a3;
}

- (void)setFolderNoteSortType:(id)a3
{
}

- (void)commonInit
{
  self->_maxNumberOfLabelLines = 1;
  if (ICAccessibilityAccessibilityLargerTextSizesEnabled())
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      unsigned __int8 v3 = [(ICSearchIndexableNote *)self->_note hasThumbnailImage];
    }
    else {
      unsigned __int8 v3 = 0;
    }
    self->_hasThumbnailImage = v3;
  }
}

+ (NSManagedObjectContext)legacyBackgroundContext
{
  if (qword_1006AA2D0 != -1) {
    dispatch_once(&qword_1006AA2D0, &stru_100629D30);
  }
  v2 = (void *)qword_1006AA2D8;

  return (NSManagedObjectContext *)v2;
}

+ (NSManagedObjectContext)modernBackgroundContext
{
  if (qword_1006AA2E0 != -1) {
    dispatch_once(&qword_1006AA2E0, &stru_100629D50);
  }
  v2 = (void *)qword_1006AA2E8;

  return (NSManagedObjectContext *)v2;
}

+ (OS_dispatch_queue)loadDataQueue
{
  if (qword_1006AA2F0 != -1) {
    dispatch_once(&qword_1006AA2F0, &stru_100629D70);
  }
  v2 = (void *)qword_1006AA2F8;

  return (OS_dispatch_queue *)v2;
}

- (ICNoteResultsCellConfiguration)initWithSearchResult:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)ICNoteResultsCellConfiguration;
  v6 = [(ICNoteResultsCellConfiguration *)&v11 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_searchResult, a3);
    v7->_showFolderName = 1;
    uint64_t v8 = [v5 object];
    note = v7->_note;
    v7->_note = (ICSearchIndexableNote *)v8;

    [(ICNoteResultsCellConfiguration *)v7 commonInit];
  }

  return v7;
}

- (ICNoteResultsCellConfiguration)initWithInvitation:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ICNoteResultsCellConfiguration;
  v6 = [(ICNoteResultsCellConfiguration *)&v9 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_invitation, a3);
    v7->_showFolderName = 1;
    [(ICNoteResultsCellConfiguration *)v7 commonInit];
  }

  return v7;
}

+ (id)sizingConfigurationWithShowParticipantsInfo:(BOOL)a3 showsFolderName:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  v6 = objc_alloc_init(ICNoteResultsCellConfiguration);
  [(ICNoteResultsCellConfiguration *)v6 setShowFolderName:v4];
  [(ICNoteResultsCellConfiguration *)v6 setIsDataLoaded:1];
  [(ICNoteResultsCellConfiguration *)v6 setTitleString:@"Two\nLines"];
  [(ICNoteResultsCellConfiguration *)v6 setParticipantsInfoString:@"Participants"];
  [(ICNoteResultsCellConfiguration *)v6 setFolderAndAccountInfoString:@"Folder"];
  [(ICNoteResultsCellConfiguration *)v6 setDateString:@"Date"];
  [(ICNoteResultsCellConfiguration *)v6 setShowParticipantsInfo:v5];

  return v6;
}

- (void)updateTitleLabelAttributes:(id)a3 summaryLabelAttributes:(id)a4 folderAndAccountLabelAttributes:(id)a5 estimatedTitleLabelFrame:(CGRect)a6 estimatedSummaryLabelFrame:(CGRect)a7
{
  double height = a7.size.height;
  double width = a7.size.width;
  double y = a7.origin.y;
  double x = a7.origin.x;
  double v11 = a6.size.height;
  double v12 = a6.size.width;
  double v13 = a6.origin.y;
  double v14 = a6.origin.x;
  id v21 = a3;
  id v18 = a4;
  id v19 = a5;
  v20 = self;
  objc_sync_enter(v20);
  [(ICNoteResultsCellConfiguration *)v20 setTitleLabelAttributes:v21];
  [(ICNoteResultsCellConfiguration *)v20 setSummaryLabelAttributes:v18];
  [(ICNoteResultsCellConfiguration *)v20 setFolderAndAccountLabelAttributes:v19];
  -[ICNoteResultsCellConfiguration setEstimatedTitleLabelFrame:](v20, "setEstimatedTitleLabelFrame:", v14, v13, v12, v11);
  -[ICNoteResultsCellConfiguration setEstimatedSummaryLabelFrame:](v20, "setEstimatedSummaryLabelFrame:", x, y, width, height);
  objc_sync_exit(v20);
}

- (void)updateTitleLabelAttributes:(id)a3 summaryLabelAttributes:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  v7 = self;
  objc_sync_enter(v7);
  [(ICNoteResultsCellConfiguration *)v7 setTitleLabelAttributes:v8];
  [(ICNoteResultsCellConfiguration *)v7 setSummaryLabelAttributes:v6];
  objc_sync_exit(v7);
}

- (void)synchronouslyLoadData
{
  unsigned __int8 v3 = [(ICNoteResultsCellConfiguration *)self note];
  BOOL v4 = [v3 managedObjectContext];
  BOOL v5 = v4;
  if (v4)
  {
    id v6 = v4;
  }
  else
  {
    v7 = [(ICNoteResultsCellConfiguration *)self invitation];
    id v6 = [v7 managedObjectContext];
  }
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1000FA054;
  v9[3] = &unk_100625860;
  v9[4] = self;
  id v10 = v6;
  id v8 = v6;
  [v8 performBlockAndWait:v9];
}

- (void)loadDataWithCompletion:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(id)objc_opt_class() loadDataQueue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000FA118;
  v7[3] = &unk_100625B40;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (void)loadDataWithContext:(id)a3
{
  id v6 = a3;
  [(ICNoteResultsCellConfiguration *)self clearData];
  id v4 = [(ICNoteResultsCellConfiguration *)self note];

  if (v4)
  {
    [(ICNoteResultsCellConfiguration *)self loadNoteDataWithContext:v6];
  }
  else
  {
    BOOL v5 = [(ICNoteResultsCellConfiguration *)self invitation];

    if (v5) {
      [(ICNoteResultsCellConfiguration *)self loadInvitationDataWithContext:v6];
    }
  }
  [(ICNoteResultsCellConfiguration *)self setIsDataLoaded:1];
}

- (void)loadNoteDataWithContext:(id)a3
{
  id v113 = a3;
  id v4 = self;
  objc_sync_enter(v4);
  BOOL v5 = [(ICNoteResultsCellConfiguration *)v4 titleLabelAttributes];
  id v6 = [v5 copy];

  v7 = [(ICNoteResultsCellConfiguration *)v4 summaryLabelAttributes];
  id v8 = [v7 copy];

  objc_super v9 = [(ICNoteResultsCellConfiguration *)v4 folderAndAccountLabelAttributes];
  id v10 = [v9 copy];

  [(ICNoteResultsCellConfiguration *)v4 estimatedTitleLabelFrame];
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;
  [(ICNoteResultsCellConfiguration *)v4 estimatedSummaryLabelFrame];
  double v20 = v19;
  double v22 = v21;
  double v24 = v23;
  double v26 = v25;
  objc_sync_exit(v4);

  v27 = [(ICNoteResultsCellConfiguration *)v4 note];
  v28 = [v27 objectID];
  v29 = [v113 ic_existingObjectWithID:v28];

  v30 = [(ICNoteResultsCellConfiguration *)v4 folderNoteSortType];
  v31 = +[ICNoteListSortUtilities dateForCurrentSortTypeForNote:v29 folderNoteSortType:v30];
  v32 = [v31 ic_briefFormattedDate];
  [(ICNoteResultsCellConfiguration *)v4 setDateString:v32];

  if ([v29 isSharedViaICloud]) {
    uint64_t v33 = [v29 isSharedViaICloudFolder] ^ 1;
  }
  else {
    uint64_t v33 = 0;
  }
  [(ICNoteResultsCellConfiguration *)v4 setShowCollaboratorsBadge:v33];
  if ([v29 isPinned]) {
    uint64_t v34 = [v29 isDeletedOrInTrash] ^ 1;
  }
  else {
    uint64_t v34 = 0;
  }
  [(ICNoteResultsCellConfiguration *)v4 setShowPinnedBadge:v34];
  if ([v29 hasUnreadChanges]) {
    id v35 = [v29 isSharedViaICloud];
  }
  else {
    id v35 = 0;
  }
  [(ICNoteResultsCellConfiguration *)v4 setShowUnreadIndicator:v35];
  id v36 = [v29 currentStatus];
  if ([(ICNoteResultsCellConfiguration *)v4 showUnreadIndicator] || v36)
  {
    if ([(ICNoteResultsCellConfiguration *)v4 showUnreadIndicator])
    {
      v37 = objc_alloc_init(ICNoteIndicatorUnreadChanges);
      v38 = [(ICNoteIndicatorUnreadChanges *)v37 imageName];
      [(ICNoteResultsCellConfiguration *)v4 symbolImageConfiguration];
      v40 = id v39 = v10;
      v41 = +[UIImage systemImageNamed:v38 withConfiguration:v40];
      [(ICNoteResultsCellConfiguration *)v4 setPrimaryStatusImage:v41];

      id v10 = v39;
      v42 = [(ICNoteIndicatorUnreadChanges *)v37 tintColor];
      [(ICNoteResultsCellConfiguration *)v4 setPrimaryStatusImageTintColor:v42];

      v43 = [(ICNoteResultsCellConfiguration *)v4 primaryStatusImage];
      [(ICNoteResultsCellConfiguration *)v4 setUnreadIndicatorImage:v43];
    }
    if (v36)
    {
      v44 = [[ICNoteIndicatorStatus alloc] initWithStatusType:v36 isDisplayedInFolder:[(ICNoteResultsCellConfiguration *)v4 isDisplayedInFolder]];
      v45 = [(ICNoteIndicatorStatus *)v44 imageName];
      v46 = [(ICNoteResultsCellConfiguration *)v4 symbolImageConfiguration];
      v47 = +[UIImage systemImageNamed:v45 withConfiguration:v46];

      v48 = [(ICNoteResultsCellConfiguration *)v4 primaryStatusImage];

      if (v48)
      {
        [(ICNoteResultsCellConfiguration *)v4 setSecondaryStatusImage:v47];
        v49 = [(ICNoteIndicatorStatus *)v44 tintColor];
        [(ICNoteResultsCellConfiguration *)v4 setSecondaryStatusImageTintColor:v49];
      }
      else
      {
        [(ICNoteResultsCellConfiguration *)v4 setPrimaryStatusImage:v47];
        v49 = [(ICNoteIndicatorStatus *)v44 tintColor];
        [(ICNoteResultsCellConfiguration *)v4 setPrimaryStatusImageTintColor:v49];
      }
    }
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v50 = [v29 hasThumbnailImage];
  }
  else {
    id v50 = 0;
  }
  [(ICNoteResultsCellConfiguration *)v4 setHasThumbnailImage:v50];
  v51 = [(ICNoteResultsCellConfiguration *)v4 searchResult];

  if (!v51)
  {
    id v62 = [v29 title];
    v66 = [v29 attributedTitle];
    -[ICNoteResultsCellConfiguration maxLengthForAttributes:frame:](v4, "maxLengthForAttributes:frame:", v6, v12, v14, v16, v18);
    if (v67 > 0.0)
    {
      double v68 = v67;
      double v69 = (double)(unint64_t)[v62 length];
      if (v68 <= v69) {
        double v69 = v68;
      }
      unint64_t v70 = (unint64_t)v69;
      if (!v66)
      {
        uint64_t v72 = [v62 ic_substringWithRange:0, v70];

        id v62 = (id)v72;
        goto LABEL_37;
      }
      uint64_t v71 = [v66 attributedSubstringFromRange:0, v70];

      v66 = (void *)v71;
    }
    if (v66)
    {
      [(ICNoteResultsCellConfiguration *)v4 setTitleAttributedString:v66];

LABEL_38:
      if ([v29 isUnsupported])
      {
        v73 = +[NSBundle mainBundle];
        v74 = [v73 localizedStringForKey:@"Content hidden" value:&stru_10063F3D8 table:0];
        [v74 ic_attributedString];
        id v65 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        id v65 = [v29 attributedContentInfoText];
      }
      if (![(ICNoteResultsCellConfiguration *)v4 isLargerThanAXLarge])
      {
        uint64_t v75 = [(ICNoteResultsCellConfiguration *)v4 dateString];
        if (v75)
        {
          v76 = (void *)v75;
          id v77 = [v65 length];

          if (v77)
          {
            v78 = [(ICNoteResultsCellConfiguration *)v4 dateString];
            v79 = +[NSString stringWithFormat:@"%@  ", v78];
            [v65 ic_attributedStringByPrependingString:v79];
            id v80 = v8;
            id v81 = v6;
            v83 = id v82 = v10;

            id v65 = (id)v83;
            id v10 = v82;
            id v6 = v81;
            id v8 = v80;
          }
        }
      }
      -[ICNoteResultsCellConfiguration maxLengthForAttributes:frame:](v4, "maxLengthForAttributes:frame:", v8, v20, v22, v24, v26);
      if (v84 > 0.0)
      {
        double v85 = v84;
        double v86 = (double)(unint64_t)[v65 length];
        if (v85 <= v86) {
          double v86 = v85;
        }
        uint64_t v87 = [v65 ic_attributedSubstringFromRange:0, (unint64_t)v86];

        id v65 = (id)v87;
      }
      goto LABEL_49;
    }
LABEL_37:
    [(ICNoteResultsCellConfiguration *)v4 setTitleString:v62];
    goto LABEL_38;
  }
  v52 = [(ICNoteResultsCellConfiguration *)v4 searchResult];
  v53 = [(ICNoteResultsCellConfiguration *)v4 highlightColor];
  v54 = [v52 attributedTitleWithBaseAttributes:v6 highlightColor:v53 insideFrame:v12, v14, v16, v18];
  [(ICNoteResultsCellConfiguration *)v4 setTitleAttributedString:v54];

  v55 = [(ICNoteResultsCellConfiguration *)v4 searchResult];
  v56 = [(ICNoteResultsCellConfiguration *)v4 highlightColor];
  v57 = [v55 attributedSummaryWithBaseAttributes:v8 highlightColor:v56 insideFrame:v20, v22, v24, v26];
  [(ICNoteResultsCellConfiguration *)v4 setSummaryAttributedString:v57];

  if ([(ICNoteResultsCellConfiguration *)v4 isLargerThanAXLarge]) {
    goto LABEL_51;
  }
  uint64_t v58 = [(ICNoteResultsCellConfiguration *)v4 dateString];
  v59 = (void *)v58;
  v60 = &stru_10063F3D8;
  if (v58) {
    v60 = (__CFString *)v58;
  }
  v61 = v60;

  id v62 = [objc_alloc((Class)NSMutableAttributedString) initWithString:v61 attributes:v8];
  v63 = [(ICNoteResultsCellConfiguration *)v4 summaryAttributedString];

  if (v63)
  {
    [v62 ic_appendString:@"  "];
    v64 = [(ICNoteResultsCellConfiguration *)v4 summaryAttributedString];
    [v62 appendAttributedString:v64];

    id v65 = [v62 copy];
LABEL_49:
    [(ICNoteResultsCellConfiguration *)v4 setSummaryAttributedString:v65];

    goto LABEL_50;
  }
  [(ICNoteResultsCellConfiguration *)v4 setSummaryAttributedString:v62];
LABEL_50:

LABEL_51:
  if ([(ICNoteResultsCellConfiguration *)v4 showParticipantsInfo])
  {
    objc_opt_class();
    v88 = ICDynamicCast();
    v89 = [v88 participantsInfoDescription];
    [(ICNoteResultsCellConfiguration *)v4 setParticipantsInfoString:v89];
  }
  if ([(ICNoteResultsCellConfiguration *)v4 showsNoteContainer])
  {
    if ([(ICNoteResultsCellConfiguration *)v4 showFolderName]
      && [(ICNoteResultsCellConfiguration *)v4 showAccountName])
    {
      uint64_t v90 = [v29 folderName];
      v91 = (void *)v90;
      v92 = &stru_10063F3D8;
      if (v90) {
        v92 = (__CFString *)v90;
      }
      v93 = v92;

      v94 = [v29 accountName];
      v95 = +[NSString localizedStringWithFormat:@"%@ — %@", v93, v94];
    }
    else
    {
      if ([(ICNoteResultsCellConfiguration *)v4 showAccountName])
      {
        uint64_t v96 = [v29 accountName];
        v94 = (void *)v96;
        v97 = &stru_10063F3D8;
        if (v96) {
          v97 = (__CFString *)v96;
        }
      }
      else
      {
        v95 = &stru_10063F3D8;
        if (![(ICNoteResultsCellConfiguration *)v4 showFolderName]) {
          goto LABEL_69;
        }
        uint64_t v98 = [v29 folderName];
        v94 = (void *)v98;
        if (v98) {
          v97 = (__CFString *)v98;
        }
        else {
          v97 = &stru_10063F3D8;
        }
      }
      v95 = v97;
    }

LABEL_69:
    v99 = [@" " stringByAppendingString:v95];
    [(ICNoteResultsCellConfiguration *)v4 setFolderAndAccountInfoString:v99];

    if ([(ICNoteResultsCellConfiguration *)v4 showFolderName]
      || ([(ICNoteResultsCellConfiguration *)v4 searchResult],
          v100 = objc_claimAutoreleasedReturnValue(),
          v100,
          v100))
    {
      id v112 = v8;
      objc_opt_class();
      v101 = ICDynamicCast();
      v102 = [v101 folderSystemImageName];
      v103 = v102;
      id v104 = v6;
      if (v102)
      {
        id v105 = v102;
      }
      else
      {
        id v105 = +[ICFolder defaultSystemImageName];
      }
      v106 = v105;

      v107 = +[UIImage ic_systemImageNamed:v106];
      v108 = [v10 objectForKeyedSubscript:NSFontAttributeName];
      +[UIImageSymbolConfiguration configurationWithFont:v108 scale:-1];
      v110 = id v109 = v10;
      v111 = [v107 imageWithConfiguration:v110];
      [(ICNoteResultsCellConfiguration *)v4 setFolderImage:v111];

      id v10 = v109;
      id v6 = v104;
      id v8 = v112;
    }
  }
}

- (void)loadInvitationDataWithContext:(id)a3
{
  id v64 = a3;
  id v4 = self;
  objc_sync_enter(v4);
  BOOL v5 = [(ICNoteResultsCellConfiguration *)v4 titleLabelAttributes];
  id v6 = [v5 copy];

  v7 = [(ICNoteResultsCellConfiguration *)v4 summaryLabelAttributes];
  id v8 = [v7 copy];

  [(ICNoteResultsCellConfiguration *)v4 estimatedTitleLabelFrame];
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;
  [(ICNoteResultsCellConfiguration *)v4 estimatedSummaryLabelFrame];
  double v18 = v17;
  double v20 = v19;
  double v22 = v21;
  double v24 = v23;
  objc_sync_exit(v4);

  double v25 = [(ICNoteResultsCellConfiguration *)v4 invitation];
  double v26 = [v25 objectID];
  v27 = [v64 ic_existingObjectWithID:v26];

  -[ICNoteResultsCellConfiguration maxLengthForAttributes:frame:](v4, "maxLengthForAttributes:frame:", v6, v10, v12, v14, v16);
  double v29 = v28;
  v30 = [v27 title];
  if (v30)
  {
    [(ICNoteResultsCellConfiguration *)v4 setTitleString:v30];
  }
  else
  {
    v31 = +[NSBundle mainBundle];
    v32 = [v31 localizedStringForKey:@"Invitation" value:&stru_10063F3D8 table:0];
    [(ICNoteResultsCellConfiguration *)v4 setTitleString:v32];
  }
  uint64_t v33 = [(ICNoteResultsCellConfiguration *)v4 titleString];
  if (v29 == 0.0)
  {
    [(ICNoteResultsCellConfiguration *)v4 setTitleString:v33];
  }
  else
  {
    uint64_t v34 = [(ICNoteResultsCellConfiguration *)v4 titleString];
    id v35 = [v34 length];

    double v36 = (double)(unint64_t)v35;
    if (v29 <= (double)(unint64_t)v35) {
      double v36 = v29;
    }
    v37 = [v33 ic_substringWithRange:0, (unint64_t)v36];
    [(ICNoteResultsCellConfiguration *)v4 setTitleString:v37];
  }
  v38 = [v27 creationDate];
  id v39 = [v38 ic_briefFormattedDate];
  [(ICNoteResultsCellConfiguration *)v4 setDateString:v39];

  v40 = [v27 contentDescription];
  [(ICNoteResultsCellConfiguration *)v4 setSummaryString:v40];

  if (![(ICNoteResultsCellConfiguration *)v4 isLargerThanAXLarge])
  {
    v41 = [(ICNoteResultsCellConfiguration *)v4 dateString];
    if ([v41 length])
    {
      v42 = [(ICNoteResultsCellConfiguration *)v4 summaryString];
      id v43 = [v42 length];

      if (!v43) {
        goto LABEL_14;
      }
      v41 = [(ICNoteResultsCellConfiguration *)v4 dateString];
      v44 = [(ICNoteResultsCellConfiguration *)v4 summaryString];
      v45 = +[NSString stringWithFormat:@"%@  %@", v41, v44];
      [(ICNoteResultsCellConfiguration *)v4 setSummaryString:v45];
    }
  }
LABEL_14:
  -[ICNoteResultsCellConfiguration maxLengthForAttributes:frame:](v4, "maxLengthForAttributes:frame:", v8, v18, v20, v22, v24);
  double v47 = v46;
  v48 = [(ICNoteResultsCellConfiguration *)v4 summaryString];
  if (v47 == 0.0)
  {
    [(ICNoteResultsCellConfiguration *)v4 setSummaryString:v48];
  }
  else
  {
    v49 = [(ICNoteResultsCellConfiguration *)v4 summaryString];
    id v50 = [v49 length];

    double v51 = (double)(unint64_t)v50;
    if (v47 <= (double)(unint64_t)v50) {
      double v51 = v47;
    }
    v52 = [v48 ic_substringWithRange:0, (unint64_t)v51];
    [(ICNoteResultsCellConfiguration *)v4 setSummaryString:v52];
  }
  if ([v27 hasThumbnail])
  {
    [(ICNoteResultsCellConfiguration *)v4 setHasThumbnailImage:1];
  }
  else
  {
    v53 = [v27 rootObjectType];
    -[ICNoteResultsCellConfiguration setHasThumbnailImage:](v4, "setHasThumbnailImage:", [v53 isEqualToString:@"com.apple.notes.folder"]);
  }
  v54 = [(ICNoteResultsCellConfiguration *)v4 symbolImageConfiguration];
  v55 = +[UIImage systemImageNamed:@"arrow.down.message" withConfiguration:v54];
  [(ICNoteResultsCellConfiguration *)v4 setPrimaryStatusImage:v55];

  v56 = +[UIColor secondaryLabelColor];
  [(ICNoteResultsCellConfiguration *)v4 setPrimaryStatusImageTintColor:v56];

  v57 = [v27 typeDescription];
  [(ICNoteResultsCellConfiguration *)v4 setFolderAndAccountInfoString:v57];

  if ([(ICNoteResultsCellConfiguration *)v4 showAccountName])
  {
    uint64_t v58 = [v27 account];

    if (v58)
    {
      v59 = [(ICNoteResultsCellConfiguration *)v4 folderAndAccountInfoString];
      if (v59)
      {
        v60 = [(ICNoteResultsCellConfiguration *)v4 folderAndAccountInfoString];
        v61 = [v27 account];
        id v62 = [v61 localizedName];
        v63 = +[NSString stringWithFormat:@"%@ — %@", v60, v62];
        [(ICNoteResultsCellConfiguration *)v4 setFolderAndAccountInfoString:v63];
      }
      else
      {
        v60 = [v27 account];
        v61 = [v60 localizedName];
        [(ICNoteResultsCellConfiguration *)v4 setFolderAndAccountInfoString:v61];
      }
    }
  }
}

- (void)clearData
{
  [(ICNoteResultsCellConfiguration *)self setTitleString:0];
  [(ICNoteResultsCellConfiguration *)self setTitleAttributedString:0];
  [(ICNoteResultsCellConfiguration *)self setSummaryString:0];
  [(ICNoteResultsCellConfiguration *)self setSummaryAttributedString:0];
  [(ICNoteResultsCellConfiguration *)self setDateString:0];
  [(ICNoteResultsCellConfiguration *)self setFolderAndAccountInfoString:0];
  [(ICNoteResultsCellConfiguration *)self setShowCollaboratorsBadge:0];
  [(ICNoteResultsCellConfiguration *)self setHasThumbnailImage:0];
  [(ICNoteResultsCellConfiguration *)self setShowPinnedBadge:0];
  [(ICNoteResultsCellConfiguration *)self setShowUnreadIndicator:0];
  [(ICNoteResultsCellConfiguration *)self setPrimaryStatusImage:0];
  [(ICNoteResultsCellConfiguration *)self setPrimaryStatusImageTintColor:0];
  [(ICNoteResultsCellConfiguration *)self setSecondaryStatusImage:0];

  [(ICNoteResultsCellConfiguration *)self setSecondaryStatusImageTintColor:0];
}

- (BOOL)isLargerThanAXLarge
{
  v2 = +[UITraitCollection currentTraitCollection];
  unsigned __int8 v3 = [v2 preferredContentSizeCategory];
  BOOL v4 = UIContentSizeCategoryCompareToCategory(v3, UIContentSizeCategoryAccessibilityLarge) > NSOrderedSame;

  return v4;
}

- (id)symbolImageConfiguration
{
  if ([(ICNoteResultsCellConfiguration *)self isLargerThanAXLarge])
  {
    v2 = +[UIFont ic_preferredFontForBodyTextWithContentSizeCategory:UIContentSizeCategoryAccessibilityLarge];
  }
  else
  {
    unsigned __int8 v3 = +[UIFont preferredFontForTextStyle:UIFontTextStyleSubheadline];
    v2 = [v3 ic_fontWithSingleLineA];
  }
  BOOL v4 = +[UIImageSymbolConfiguration configurationWithFont:v2 scale:1];

  return v4;
}

- (double)maxLengthForAttributes:(id)a3 frame:(CGRect)a4
{
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  [@"." sizeWithAttributes:a3];
  double v10 = v9;
  v15.origin.CGFloat x = x;
  v15.origin.CGFloat y = y;
  v15.size.CGFloat width = width;
  v15.size.CGFloat height = height;
  double v11 = CGRectGetWidth(v15);
  double v12 = 1.0;
  if (v10 >= 1.0) {
    double v12 = v10;
  }
  unint64_t v13 = (unint64_t)(v11 / v12);
  if ([(ICNoteResultsCellConfiguration *)self maxNumberOfLabelLines] >= 2) {
    v13 *= [(ICNoteResultsCellConfiguration *)self maxNumberOfLabelLines];
  }
  return (double)v13;
}

- (id)accessibilityLabel
{
  unsigned __int8 v3 = [(ICNoteResultsCellConfiguration *)self invitation];

  if (v3)
  {
    BOOL v4 = [(ICNoteResultsCellConfiguration *)self invitation];
    BOOL v5 = [v4 rootObjectType];
    unsigned int v6 = [v5 isEqualToString:@"com.apple.notes.folder"];
    v7 = +[NSBundle mainBundle];
    id v8 = v7;
    if (v6) {
      CFStringRef v9 = @"Invitation for folder titled %@";
    }
    else {
      CFStringRef v9 = @"Invitation for note titled %@";
    }
    double v10 = [v7 localizedStringForKey:v9 value:&stru_10063F3D8 table:0];

    double v11 = [(ICNoteResultsCellConfiguration *)self invitation];
    double v12 = [v11 title];
    unint64_t v13 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v10, v12);

    double v14 = [(ICNoteResultsCellConfiguration *)self invitation];
    CGRect v15 = [v14 receivedDate];
    double v16 = [v15 ic_briefFormattedDate];

    double v17 = [(ICNoteResultsCellConfiguration *)self invitation];
    double v18 = [v17 contentDescription];

    double v19 = +[NSBundle mainBundle];
    double v20 = [v19 localizedStringForKey:@"Shared with me via iCloud" value:&stru_10063F3D8 table:0];

    double v21 = __ICAccessibilityStringForVariables();
  }
  else
  {
    double v22 = [(ICNoteResultsCellConfiguration *)self note];
    uint64_t v59 = [v22 title];

    double v23 = [(ICNoteResultsCellConfiguration *)self note];
    double v24 = [(ICNoteResultsCellConfiguration *)self folderNoteSortType];
    uint64_t v25 = +[ICNoteListSortUtilities dateForCurrentSortTypeAccessibilityStringForNote:v23 folderNoteSortType:v24];

    double v26 = [(ICNoteResultsCellConfiguration *)self note];
    double v16 = [v26 contentInfoText];

    id v27 = [v16 paragraphRangeForRange:0, 0];
    double v18 = [v16 substringWithRange:v27, v28];
    double v20 = 0;
    if ([(ICNoteResultsCellConfiguration *)self showPinnedBadge])
    {
      double v29 = +[NSBundle mainBundle];
      double v20 = [v29 localizedStringForKey:@"pinned" value:&stru_10063F3D8 table:0];
    }
    v30 = [(ICNoteResultsCellConfiguration *)self note];
    uint64_t v31 = [v30 folderName];

    v32 = +[NSBundle mainBundle];
    uint64_t v33 = [v32 localizedStringForKey:@"In folder %@" value:&stru_10063F3D8 table:0];

    v57 = (void *)v33;
    uint64_t v58 = (void *)v31;
    v60 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v33, v31);
    uint64_t v34 = [(ICNoteResultsCellConfiguration *)self note];
    id v35 = [v34 currentStatus];

    switch((unint64_t)v35)
    {
      case 1uLL:
        double v36 = +[NSBundle mainBundle];
        v37 = v36;
        CFStringRef v38 = @"Locked";
        goto LABEL_12;
      case 2uLL:
        double v36 = +[NSBundle mainBundle];
        v37 = v36;
        CFStringRef v38 = @"Unlocked";
LABEL_12:
        [v36 localizedStringForKey:v38 value:&stru_10063F3D8 table:0];
        v56 = v55 = 0;
        id v39 = v18;
        double v18 = 0;
        goto LABEL_21;
      case 3uLL:
        objc_opt_class();
        v40 = [(ICNoteResultsCellConfiguration *)self note];
        id v39 = ICDynamicCast();

        unsigned int v41 = [v39 isOwnedByCurrentUser];
        v42 = +[NSBundle mainBundle];
        v37 = v42;
        if (v41) {
          CFStringRef v43 = @"Shared by me via iCloud";
        }
        else {
          CFStringRef v43 = @"Shared with me via iCloud";
        }
        v55 = [v42 localizedStringForKey:v43 value:&stru_10063F3D8 table:0];
        v56 = 0;
        goto LABEL_21;
      case 4uLL:
        objc_opt_class();
        v44 = [(ICNoteResultsCellConfiguration *)self note];
        id v39 = ICDynamicCast();

        v45 = [v39 folder];
        LODWORD(v44) = [v45 isOwnedByCurrentUser];
        double v46 = +[NSBundle mainBundle];
        double v47 = v46;
        if (v44) {
          CFStringRef v48 = @"In a folder shared by me called %@";
        }
        else {
          CFStringRef v48 = @"In a folder shared with me called %@";
        }
        v37 = [v46 localizedStringForKey:v48 value:&stru_10063F3D8 table:0];

        uint64_t v49 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v37, v58);

        v55 = 0;
        v56 = 0;
        v60 = (void *)v49;
LABEL_21:
        double v10 = (void *)v59;

        break;
      default:
        v55 = 0;
        v56 = 0;
        double v10 = (void *)v59;
        break;
    }
    objc_opt_class();
    id v50 = [(ICNoteResultsCellConfiguration *)self note];
    double v51 = ICDynamicCast();

    if ([v51 isSharedViaICloud] && objc_msgSend(v51, "hasUnreadChanges"))
    {
      unint64_t v13 = (void *)v25;
      v52 = +[NSBundle mainBundle];
      v53 = [v52 localizedStringForKey:@"has unread changes" value:&stru_10063F3D8 table:0];

      double v10 = (void *)v59;
    }
    else
    {
      unint64_t v13 = (void *)v25;
      v53 = 0;
    }
    [(ICNoteResultsCellConfiguration *)self showsNoteContainer];
    double v21 = __ICAccessibilityStringForVariables();
  }

  return v21;
}

- (BOOL)showsNoteContainer
{
  if ([(ICNoteResultsCellConfiguration *)self showFolderName]) {
    return 1;
  }

  return [(ICNoteResultsCellConfiguration *)self showAccountName];
}

- (ICSearchIndexableNote)note
{
  return self->_note;
}

- (void)setNote:(id)a3
{
}

- (ICInvitation)invitation
{
  return self->_invitation;
}

- (ICFolderCustomNoteSortType)folderNoteSortType
{
  return self->_folderNoteSortType;
}

- (unint64_t)maxNumberOfLabelLines
{
  return self->_maxNumberOfLabelLines;
}

- (void)setMaxNumberOfLabelLines:(unint64_t)a3
{
  self->_maxNumberOfLabelLines = a3;
}

- (UIColor)highlightColor
{
  return self->_highlightColor;
}

- (void)setHighlightColor:(id)a3
{
}

- (CGRect)estimatedTitleLabelFrame
{
  objc_copyStruct(v6, &self->_estimatedTitleLabelFrame, 32, 1, 0);
  double v2 = *(double *)v6;
  double v3 = *(double *)&v6[1];
  double v4 = *(double *)&v6[2];
  double v5 = *(double *)&v6[3];
  result.size.CGFloat height = v5;
  result.size.CGFloat width = v4;
  result.origin.CGFloat y = v3;
  result.origin.CGFloat x = v2;
  return result;
}

- (void)setEstimatedTitleLabelFrame:(CGRect)a3
{
  CGRect v3 = a3;
  objc_copyStruct(&self->_estimatedTitleLabelFrame, &v3, 32, 1, 0);
}

- (CGRect)estimatedSummaryLabelFrame
{
  objc_copyStruct(v6, &self->_estimatedSummaryLabelFrame, 32, 1, 0);
  double v2 = *(double *)v6;
  double v3 = *(double *)&v6[1];
  double v4 = *(double *)&v6[2];
  double v5 = *(double *)&v6[3];
  result.size.CGFloat height = v5;
  result.size.CGFloat width = v4;
  result.origin.CGFloat y = v3;
  result.origin.CGFloat x = v2;
  return result;
}

- (void)setEstimatedSummaryLabelFrame:(CGRect)a3
{
  CGRect v3 = a3;
  objc_copyStruct(&self->_estimatedSummaryLabelFrame, &v3, 32, 1, 0);
}

- (NSString)titleString
{
  return self->_titleString;
}

- (void)setTitleString:(id)a3
{
}

- (NSAttributedString)titleAttributedString
{
  return self->_titleAttributedString;
}

- (void)setTitleAttributedString:(id)a3
{
}

- (NSString)summaryString
{
  return self->_summaryString;
}

- (void)setSummaryString:(id)a3
{
}

- (NSAttributedString)summaryAttributedString
{
  return self->_summaryAttributedString;
}

- (void)setSummaryAttributedString:(id)a3
{
}

- (NSString)participantsInfoString
{
  return self->_participantsInfoString;
}

- (void)setParticipantsInfoString:(id)a3
{
}

- (NSString)folderAndAccountInfoString
{
  return self->_folderAndAccountInfoString;
}

- (void)setFolderAndAccountInfoString:(id)a3
{
}

- (NSString)dateString
{
  return self->_dateString;
}

- (void)setDateString:(id)a3
{
}

- (BOOL)showCollaboratorsBadge
{
  return self->_showCollaboratorsBadge;
}

- (void)setShowCollaboratorsBadge:(BOOL)a3
{
  self->_showCollaboratorsBadge = a3;
}

- (BOOL)showParticipantsInfo
{
  return self->_showParticipantsInfo;
}

- (BOOL)isDisplayedInFolder
{
  return self->_isDisplayedInFolder;
}

- (ICSearchResult)searchResult
{
  return self->_searchResult;
}

- (BOOL)hasThumbnailImage
{
  return self->_hasThumbnailImage;
}

- (void)setHasThumbnailImage:(BOOL)a3
{
  self->_hasThumbnailImage = a3;
}

- (BOOL)hideThumbnailImage
{
  return self->_hideThumbnailImage;
}

- (BOOL)showPinnedBadge
{
  return self->_showPinnedBadge;
}

- (void)setShowPinnedBadge:(BOOL)a3
{
  self->_showPinnedBadge = a3;
}

- (BOOL)showUnreadIndicator
{
  return self->_showUnreadIndicator;
}

- (void)setShowUnreadIndicator:(BOOL)a3
{
  self->_showUnreadIndicator = a3;
}

- (UIImage)folderImage
{
  return self->_folderImage;
}

- (void)setFolderImage:(id)a3
{
}

- (UIImage)unreadIndicatorImage
{
  return self->_unreadIndicatorImage;
}

- (void)setUnreadIndicatorImage:(id)a3
{
}

- (UIImage)primaryStatusImage
{
  return self->_primaryStatusImage;
}

- (void)setPrimaryStatusImage:(id)a3
{
}

- (UIColor)primaryStatusImageTintColor
{
  return self->_primaryStatusImageTintColor;
}

- (void)setPrimaryStatusImageTintColor:(id)a3
{
}

- (UIImage)secondaryStatusImage
{
  return self->_secondaryStatusImage;
}

- (void)setSecondaryStatusImage:(id)a3
{
}

- (UIColor)secondaryStatusImageTintColor
{
  return self->_secondaryStatusImageTintColor;
}

- (void)setSecondaryStatusImageTintColor:(id)a3
{
}

- (BOOL)isDataLoaded
{
  return self->_isDataLoaded;
}

- (void)setIsDataLoaded:(BOOL)a3
{
  self->_isDataLoaded = a3;
}

- (BOOL)styleForCalculator
{
  return self->_styleForCalculator;
}

- (void)setStyleForCalculator:(BOOL)a3
{
  self->_styleForCalculator = a3;
}

- (ICNoteContainer)noteContainer
{
  return self->_noteContainer;
}

- (void)setNoteContainer:(id)a3
{
}

- (NoteCollectionObject)noteCollectionObject
{
  return self->_noteCollectionObject;
}

- (void)setNoteCollectionObject:(id)a3
{
}

- (NSDictionary)titleLabelAttributes
{
  return self->_titleLabelAttributes;
}

- (void)setTitleLabelAttributes:(id)a3
{
}

- (NSDictionary)summaryLabelAttributes
{
  return self->_summaryLabelAttributes;
}

- (void)setSummaryLabelAttributes:(id)a3
{
}

- (NSDictionary)folderAndAccountLabelAttributes
{
  return self->_folderAndAccountLabelAttributes;
}

- (void)setFolderAndAccountLabelAttributes:(id)a3
{
}

@end