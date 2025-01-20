@interface TPSTipCollectionViewCell
- (BOOL)setTip:(id)a3 withCellAppearance:(id)a4;
- (NSBlockOperation)footnoteContentTextOperation;
- (NSLayoutConstraint)contentLabelBottomConstraint;
- (NSLayoutConstraint)footnoteBottomConstraint;
- (NSLayoutConstraint)sharedTextViewBottomConstraint;
- (NSLayoutConstraint)textViewBottomConstraint;
- (NSString)footnoteContentTextOperationID;
- (TPSConstellationContentParser)footnoteContentParser;
- (TPSTipCollectionViewCell)initWithFrame:(CGRect)a3;
- (TPSTipContentTextView)footnoteTextView;
- (UILabel)eyebrowLabel;
- (UIView)sharedTipAvailabilityView;
- (id)availabilityTextView;
- (id)constellationContentParserBoldFont:(id)a3;
- (id)constellationContentParserItalicFont:(id)a3;
- (void)cancelFootnoteParsingOperation;
- (void)cancelReplayButtonTimer;
- (void)constellationContentParserAttributedStringUpdated:(id)a3;
- (void)contentSizeCategoryDidChange:(id)a3;
- (void)createFootnoteTextView;
- (void)deactivateBottomConstraints;
- (void)dealloc;
- (void)prepareForReuse;
- (void)prepareSharedTipForReuse;
- (void)removeFootnoteContentParser;
- (void)setContentLabelBottomConstraint:(id)a3;
- (void)setEyebrowLabel:(id)a3;
- (void)setFootnoteBottomConstraint:(id)a3;
- (void)setFootnoteContentParser:(id)a3;
- (void)setFootnoteContentTextOperation:(id)a3;
- (void)setFootnoteContentTextOperationID:(id)a3;
- (void)setFootnoteTextView:(id)a3;
- (void)setNeedsTextView:(BOOL)a3;
- (void)setSharedTextViewBottomConstraint:(id)a3;
- (void)setSharedTipAvailabilityView:(id)a3;
- (void)setTextViewBottomConstraint:(id)a3;
- (void)setupSharedTipMessaging;
- (void)updateConstraints;
- (void)updateContentLabel;
@end

@implementation TPSTipCollectionViewCell

- (void)dealloc
{
  [(TPSTipCollectionViewCell *)self cancelFootnoteParsingOperation];
  v3.receiver = self;
  v3.super_class = (Class)TPSTipCollectionViewCell;
  [(TPSBaseTipCollectionViewCell *)&v3 dealloc];
}

- (TPSTipCollectionViewCell)initWithFrame:(CGRect)a3
{
  v138.receiver = self;
  v138.super_class = (Class)TPSTipCollectionViewCell;
  objc_super v3 = -[TPSBaseTipCollectionViewCell initWithFrame:](&v138, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v5 = [(TPSBaseTipCollectionViewCell *)v3 heroAssetView];
    id v137 = [objc_alloc((Class)UITapGestureRecognizer) initWithTarget:v4 action:"replayVideo"];
    [v5 addGestureRecognizer:v137];
    [v5 setRespectLoadingStatus:1];
    [(TPSBaseTipCollectionViewCell *)v4 updateFonts];
    v6 = [(TPSTipCollectionViewCell *)v4 contentView];
    v7 = [v5 topAnchor];
    v8 = [(TPSBaseTipCollectionViewCell *)v4 contentScrollView];
    v9 = [v8 topAnchor];
    v10 = [v7 constraintEqualToAnchor:v9];
    [v10 setActive:1];

    v11 = [v5 widthAnchor];
    v136 = v6;
    v12 = [v6 widthAnchor];
    v13 = [v11 constraintEqualToAnchor:v12];
    [v13 setActive:1];

    v14 = [v5 centerXAnchor];
    v15 = [v6 centerXAnchor];
    v16 = [v14 constraintEqualToAnchor:v15];

    v135 = v16;
    [v16 setActive:1];
    [(TPSBaseTipCollectionViewCell *)v4 setAssetViewLayoutGuideCenterXConstraint:v16];
    v17 = [v5 heightAnchor];
    v18 = [v17 constraintEqualToConstant:0.0];
    [(TPSBaseTipCollectionViewCell *)v4 setAssetViewHeightConstraint:v18];

    v19 = [(TPSBaseTipCollectionViewCell *)v4 assetViewHeightConstraint];
    [v19 setActive:1];

    id v20 = objc_alloc((Class)UIImageView);
    v21 = +[UIImage imageNamed:@"ReplayGradient"];
    id v22 = [v20 initWithImage:v21];

    v23 = v22;
    [v22 setTranslatesAutoresizingMaskIntoConstraints:0];
    [v22 setHidden:1];
    v24 = [(TPSBaseTipCollectionViewCell *)v4 contentScrollView];
    [v24 addSubview:v23];

    v25 = v23;
    v26 = [v23 widthAnchor];
    v27 = [(TPSBaseTipCollectionViewCell *)v4 heroAssetView];
    v28 = [v27 widthAnchor];
    v29 = [v26 constraintEqualToAnchor:v28];
    [v29 setActive:1];

    v30 = [v25 heightAnchor];
    v31 = [v30 constraintEqualToConstant:100.0];
    [v31 setActive:1];

    v32 = [v25 centerXAnchor];
    v33 = [(TPSBaseTipCollectionViewCell *)v4 heroAssetView];
    v34 = [v33 centerXAnchor];
    v35 = [v32 constraintEqualToAnchor:v34];
    [v35 setActive:1];

    v36 = [v25 topAnchor];
    v37 = [(TPSBaseTipCollectionViewCell *)v4 heroAssetView];
    v38 = [v37 bottomAnchor];
    v39 = [v36 constraintEqualToAnchor:v38 constant:-100.0];
    [v39 setActive:1];

    v134 = v25;
    v40 = [v25 bottomAnchor];
    v41 = [(TPSBaseTipCollectionViewCell *)v4 heroAssetView];
    v42 = [v41 bottomAnchor];
    v43 = [v40 constraintEqualToAnchor:v42];
    [v43 setActive:1];

    v44 = +[UIButton buttonWithType:1];
    [v44 setupReplayButtonConfiguration];
    [v44 addTarget:v4 action:"replayButtonTapped" forControlEvents:64];
    [v44 setPreferredBehavioralStyle:0];
    [v44 setTranslatesAutoresizingMaskIntoConstraints:0];
    v45 = [v44 layer];
    [v45 setShadowRadius:30.0];

    v46 = [v44 layer];
    LODWORD(v47) = 1050253722;
    [v46 setShadowOpacity:v47];

    v48 = [v44 layer];
    [v48 setShadowPathIsBounds:1];

    v49 = [(TPSBaseTipCollectionViewCell *)v4 contentScrollView];
    [v49 addSubview:v44];

    v50 = [v44 centerXAnchor];
    v51 = [(TPSBaseTipCollectionViewCell *)v4 heroAssetView];
    v52 = [v51 centerXAnchor];
    v53 = [v50 constraintEqualToAnchor:v52];
    [v53 setActive:1];

    v131 = v44;
    v54 = [v44 bottomAnchor];
    v55 = [(TPSBaseTipCollectionViewCell *)v4 heroAssetView];
    v56 = [v55 bottomAnchor];
    v57 = [v54 constraintEqualToAnchor:v56 constant:-14.0];
    [v57 setActive:1];

    [v5 setReplayButton:v44];
    [v5 setReplayGradientView:v25];
    v58 = [(TPSBaseTipCollectionViewCell *)v4 contentScrollView];
    v59 = [v58 frameLayoutGuide];

    v60 = [(TPSBaseTipCollectionViewCell *)v4 titleLabel];
    v61 = (UILabel *)objc_alloc_init((Class)UILabel);
    eyebrowLabel = v4->_eyebrowLabel;
    v4->_eyebrowLabel = v61;

    [(UILabel *)v4->_eyebrowLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UILabel *)v4->_eyebrowLabel setOpaque:1];
    [(UILabel *)v4->_eyebrowLabel setTextAlignment:4];
    v63 = +[UIColor clearColor];
    [(UILabel *)v4->_eyebrowLabel setBackgroundColor:v63];

    [(UILabel *)v4->_eyebrowLabel setNumberOfLines:0];
    [(UILabel *)v4->_eyebrowLabel setLineBreakMode:0];
    v64 = +[TPSAppearance footnoteFont];
    [(UILabel *)v4->_eyebrowLabel setFont:v64];

    [(UILabel *)v4->_eyebrowLabel setAdjustsFontForContentSizeCategory:1];
    v65 = +[TPSAppearance secondaryLabelColor];
    [(UILabel *)v4->_eyebrowLabel setTextColor:v65];

    [(UILabel *)v4->_eyebrowLabel setHidden:1];
    v66 = [(TPSBaseTipCollectionViewCell *)v4 contentScrollView];
    [v66 addSubview:v4->_eyebrowLabel];

    v67 = [(UILabel *)v4->_eyebrowLabel topAnchor];
    v133 = v5;
    v68 = [v5 bottomAnchor];
    uint64_t v69 = [v67 constraintEqualToAnchor:v68 constant:17.0];
    eyebrowLabelTopAnchorConstraint = v4->_eyebrowLabelTopAnchorConstraint;
    v4->_eyebrowLabelTopAnchorConstraint = (NSLayoutConstraint *)v69;

    [(NSLayoutConstraint *)v4->_eyebrowLabelTopAnchorConstraint setActive:1];
    v71 = [(UILabel *)v4->_eyebrowLabel leadingAnchor];
    v72 = [v60 leadingAnchor];
    v73 = [v71 constraintEqualToAnchor:v72];
    [v73 setActive:1];

    v74 = [(UILabel *)v4->_eyebrowLabel trailingAnchor];
    v75 = [v60 trailingAnchor];
    v76 = [v74 constraintEqualToAnchor:v75];
    [v76 setActive:1];

    v77 = [v60 topAnchor];
    v78 = [(UILabel *)v4->_eyebrowLabel bottomAnchor];
    uint64_t v79 = [v77 constraintEqualToAnchor:v78 constant:4.0];
    titleLabelToEyebrowLabelTopAnchor = v4->_titleLabelToEyebrowLabelTopAnchor;
    v4->_titleLabelToEyebrowLabelTopAnchor = (NSLayoutConstraint *)v79;

    v81 = [v60 topAnchor];
    v82 = [v5 bottomAnchor];
    uint64_t v83 = [v81 constraintEqualToAnchor:v82 constant:21.0];
    titleLabelTopAnchorConstraint = v4->_titleLabelTopAnchorConstraint;
    v4->_titleLabelTopAnchorConstraint = (NSLayoutConstraint *)v83;

    [(NSLayoutConstraint *)v4->_titleLabelTopAnchorConstraint setActive:1];
    v85 = [v60 leadingAnchor];
    v132 = v59;
    v86 = [v59 leadingAnchor];
    uint64_t v87 = [v85 constraintEqualToAnchor:v86];
    titleLabelLeadingConstraint = v4->_titleLabelLeadingConstraint;
    v4->_titleLabelLeadingConstraint = (NSLayoutConstraint *)v87;

    [(NSLayoutConstraint *)v4->_titleLabelLeadingConstraint setActive:1];
    v89 = [v60 trailingAnchor];
    v90 = [v59 trailingAnchor];
    uint64_t v91 = [v89 constraintEqualToAnchor:v90];
    titleLabelTrailingConstraint = v4->_titleLabelTrailingConstraint;
    v4->_titleLabelTrailingConstraint = (NSLayoutConstraint *)v91;

    [(NSLayoutConstraint *)v4->_titleLabelTrailingConstraint setActive:1];
    v93 = [(TPSBaseTipCollectionViewCell *)v4 contentLabel];
    v94 = [v93 leadingAnchor];
    v95 = [v60 leadingAnchor];
    v130 = [v94 constraintEqualToAnchor:v95];

    v96 = [(TPSBaseTipCollectionViewCell *)v4 contentLabel];
    v97 = [v96 trailingAnchor];
    v98 = [v60 trailingAnchor];
    v99 = [v97 constraintEqualToAnchor:v98];

    v100 = [(TPSBaseTipCollectionViewCell *)v4 contentLabel];
    v101 = [v100 topAnchor];
    v102 = [v60 bottomAnchor];
    v129 = [v101 constraintEqualToAnchor:v102 constant:9.0];

    v103 = [(TPSBaseTipCollectionViewCell *)v4 contentLabel];
    v104 = [v103 bottomAnchor];
    v105 = [(TPSBaseTipCollectionViewCell *)v4 contentScrollView];
    v106 = [v105 bottomAnchor];
    uint64_t v107 = [v104 constraintEqualToAnchor:v106];
    contentLabelBottomConstraint = v4->_contentLabelBottomConstraint;
    v4->_contentLabelBottomConstraint = (NSLayoutConstraint *)v107;

    LODWORD(v109) = 1147224064;
    [(NSLayoutConstraint *)v4->_contentLabelBottomConstraint setPriority:v109];
    v140[0] = v129;
    v140[1] = v130;
    v140[2] = v99;
    v140[3] = v4->_contentLabelBottomConstraint;
    v110 = +[NSArray arrayWithObjects:v140 count:4];
    [(TPSBaseTipCollectionViewCell *)v4 setContentLabelConstraints:v110];

    v111 = [(TPSBaseTipCollectionViewCell *)v4 contentTextView];
    v112 = [v111 topAnchor];
    v113 = [v60 bottomAnchor];
    v114 = [v112 constraintEqualToAnchor:v113 constant:9.0];

    v115 = [v111 bottomAnchor];
    v116 = [(TPSBaseTipCollectionViewCell *)v4 contentScrollView];
    v117 = [v116 bottomAnchor];
    uint64_t v118 = [v115 constraintEqualToAnchor:v117];
    textViewBottomConstraint = v4->_textViewBottomConstraint;
    v4->_textViewBottomConstraint = (NSLayoutConstraint *)v118;

    LODWORD(v120) = 1144750080;
    [(NSLayoutConstraint *)v4->_textViewBottomConstraint setPriority:v120];
    v121 = [v111 leadingAnchor];
    v122 = [v60 leadingAnchor];
    v123 = [v121 constraintEqualToAnchor:v122];

    v124 = [v111 trailingAnchor];
    v125 = [v60 trailingAnchor];
    v126 = [v124 constraintEqualToAnchor:v125];

    v139[0] = v114;
    v139[1] = v123;
    v139[2] = v126;
    v139[3] = v4->_textViewBottomConstraint;
    v127 = +[NSArray arrayWithObjects:v139 count:4];
    [(TPSBaseTipCollectionViewCell *)v4 setContentTextViewConstraints:v127];

    [(TPSTipCollectionViewCell *)v4 setNeedsTextView:0];
  }
  return v4;
}

- (void)createFootnoteTextView
{
  objc_super v3 = [(TPSTipCollectionViewCell *)self footnoteTextView];

  if (!v3)
  {
    v33 = objc_alloc_init(TPSTipContentTextView);
    [(TPSTipContentTextView *)v33 setTranslatesAutoresizingMaskIntoConstraints:0];
    [(TPSTipContentTextView *)v33 setScrollEnabled:0];
    [(TPSTipContentTextView *)v33 _setInteractiveTextSelectionDisabled:1];
    v4 = +[UIColor clearColor];
    [(TPSTipContentTextView *)v33 setBackgroundColor:v4];

    [(TPSTipContentTextView *)v33 setEditable:0];
    v5 = +[TPSAppearance footnoteFont];
    [(TPSTipContentTextView *)v33 setFont:v5];

    [(TPSTipContentTextView *)v33 setDataDetectorTypes:0];
    v6 = [(TPSTipContentTextView *)v33 textContainer];
    [v6 setHeightTracksTextView:1];

    [(TPSTipContentTextView *)v33 setDelegate:self];
    [(TPSTipContentTextView *)v33 setOpaque:1];
    -[TPSTipContentTextView setTextContainerInset:](v33, "setTextContainerInset:", UIEdgeInsetsZero.top, UIEdgeInsetsZero.left, UIEdgeInsetsZero.bottom, UIEdgeInsetsZero.right);
    v7 = [(TPSTipContentTextView *)v33 textContainer];
    [v7 setLineFragmentPadding:0.0];

    v8 = [(TPSBaseTipCollectionViewCell *)self contentScrollView];
    [v8 addSubview:v33];

    v9 = [(TPSBaseTipCollectionViewCell *)self tip];
    v10 = [v9 actions];
    id v11 = [v10 count];

    if (v11)
    {
      [(TPSBaseTipCollectionViewCell *)self updateActionButton];
      v12 = [(TPSBaseTipCollectionViewCell *)self actionButton];
    }
    else
    {
      v13 = [(TPSBaseTipCollectionViewCell *)self contentLabel];
      if ([v13 isHidden]) {
        [(TPSBaseTipCollectionViewCell *)self contentTextView];
      }
      else {
      v12 = [(TPSBaseTipCollectionViewCell *)self contentLabel];
      }
    }
    v14 = v33;
    if (v12)
    {
      v15 = [(TPSTipContentTextView *)v33 topAnchor];
      v16 = [v12 bottomAnchor];
      v17 = [v15 constraintEqualToAnchor:v16 constant:15.0];
      [v17 setActive:1];

      v14 = v33;
    }
    v18 = [(TPSTipContentTextView *)v14 leadingAnchor];
    v19 = [(TPSBaseTipCollectionViewCell *)self titleLabel];
    id v20 = [v19 leadingAnchor];
    v21 = [v18 constraintEqualToAnchor:v20];
    [v21 setActive:1];

    id v22 = [(TPSTipContentTextView *)v33 trailingAnchor];
    v23 = [(TPSBaseTipCollectionViewCell *)self titleLabel];
    v24 = [v23 trailingAnchor];
    v25 = [v22 constraintEqualToAnchor:v24];
    [v25 setActive:1];

    v26 = [(TPSTipContentTextView *)v33 bottomAnchor];
    v27 = [(TPSBaseTipCollectionViewCell *)self contentScrollView];
    v28 = [v27 bottomAnchor];
    v29 = [v26 constraintEqualToAnchor:v28];
    [(TPSTipCollectionViewCell *)self setFootnoteBottomConstraint:v29];

    v30 = [(TPSTipCollectionViewCell *)self footnoteBottomConstraint];
    LODWORD(v31) = 1144750080;
    [v30 setPriority:v31];

    v32 = [(TPSTipCollectionViewCell *)self footnoteBottomConstraint];
    [v32 setActive:1];

    [(TPSTipCollectionViewCell *)self setFootnoteTextView:v33];
    [(TPSTipCollectionViewCell *)self setNeedsUpdateConstraints];
  }
}

- (void)contentSizeCategoryDidChange:(id)a3
{
  id v4 = a3;
  v5 = [(TPSTipCollectionViewCell *)self footnoteTextView];
  [v5 setAttributedText:0];

  v8.receiver = self;
  v8.super_class = (Class)TPSTipCollectionViewCell;
  [(TPSBaseTipCollectionViewCell *)&v8 contentSizeCategoryDidChange:v4];

  v6 = [(TPSBaseTipCollectionViewCell *)self heroAssetView];
  v7 = [v6 replayButton];
  [v7 setupReplayButtonConfiguration];
}

- (void)cancelFootnoteParsingOperation
{
  [(NSBlockOperation *)self->_footnoteContentTextOperation cancel];
  footnoteContentTextOperation = self->_footnoteContentTextOperation;
  self->_footnoteContentTextOperation = 0;

  footnoteContentTextOperationID = self->_footnoteContentTextOperationID;
  self->_footnoteContentTextOperationID = 0;
}

- (void)removeFootnoteContentParser
{
  objc_super v3 = [(TPSTipCollectionViewCell *)self footnoteContentParser];
  [v3 setDelegate:0];

  id v4 = [(TPSTipCollectionViewCell *)self footnoteContentParser];
  [v4 cancelAssetFetches];

  [(TPSTipCollectionViewCell *)self setFootnoteContentParser:0];
}

- (void)updateContentLabel
{
  v39.receiver = self;
  v39.super_class = (Class)TPSTipCollectionViewCell;
  [(TPSBaseTipCollectionViewCell *)&v39 updateContentLabel];
  objc_super v3 = [(TPSBaseTipCollectionViewCell *)self uniqueIdentifierForCurrentTip];
  id v4 = [v3 stringByAppendingString:@"-footNote"];

  v5 = [(TPSTipCollectionViewCell *)self footnoteContentTextOperationID];
  unsigned __int8 v6 = [v4 isEqualToString:v5];

  if ((v6 & 1) == 0)
  {
    v7 = [(TPSTipCollectionViewCell *)self footnoteTextView];
    [v7 setAttributedText:0];

    [(TPSTipCollectionViewCell *)self cancelFootnoteParsingOperation];
    objc_super v8 = [(TPSBaseTipCollectionViewCell *)self tip];
    v9 = [v8 footnoteContent];

    if (v9)
    {
      [(TPSTipCollectionViewCell *)self createFootnoteTextView];
      v10 = [(TPSBaseTipCollectionViewCell *)self appController];
      id v11 = [(TPSBaseTipCollectionViewCell *)self tip];
      v12 = [v11 identifier];
      v13 = [v10 footNoteAttributedStringForIdentifier:v12];

      if (v13)
      {
        v14 = [(TPSTipCollectionViewCell *)self footnoteTextView];
        [v14 setAttributedText:v13];

        v15 = [(TPSTipCollectionViewCell *)self footnoteTextView];
        [v15 setTipID:v4];

        v16 = [(TPSTipCollectionViewCell *)self footnoteTextView];
        [v16 setHidden:0];
      }
      else
      {
        id v17 = objc_alloc_init((Class)NSBlockOperation);
        [(TPSTipCollectionViewCell *)self setFootnoteContentTextOperation:v17];

        [(TPSTipCollectionViewCell *)self setFootnoteContentTextOperationID:v4];
        objc_initWeak(&location, self);
        v40[0] = NSFontAttributeName;
        v18 = +[TPSAppearance footnoteFont];
        v41[0] = v18;
        v40[1] = NSForegroundColorAttributeName;
        v19 = +[UIColor tertiaryLabelColor];
        v41[1] = v19;
        id v20 = +[NSDictionary dictionaryWithObjects:v41 forKeys:v40 count:2];

        [(TPSTipCollectionViewCell *)self removeFootnoteContentParser];
        id v21 = objc_alloc_init((Class)TPSConstellationContentParser);
        [(TPSTipCollectionViewCell *)self setFootnoteContentParser:v21];

        id v22 = [(TPSTipCollectionViewCell *)self traitCollection];
        v23 = [(TPSTipCollectionViewCell *)self footnoteContentParser];
        [v23 setTraitCollection:v22];

        v24 = [(TPSTipCollectionViewCell *)self footnoteContentParser];
        [v24 setDelegate:self];

        v25 = [(TPSBaseTipCollectionViewCell *)self tip];
        id v26 = [v25 copy];

        footnoteContentTextOperation = self->_footnoteContentTextOperation;
        v32[0] = _NSConcreteStackBlock;
        v32[1] = 3221225472;
        v32[2] = sub_10002E5D8;
        v32[3] = &unk_1000B7788;
        objc_copyWeak(&v37, &location);
        id v28 = v26;
        id v33 = v28;
        id v34 = v9;
        id v29 = v20;
        id v35 = v29;
        id v36 = v4;
        [(NSBlockOperation *)footnoteContentTextOperation addExecutionBlock:v32];
        v30 = +[TPSBaseTipCollectionViewCell attributedStringOperationQueue];
        double v31 = [(TPSTipCollectionViewCell *)self footnoteContentTextOperation];
        [v30 addOperation:v31];

        objc_destroyWeak(&v37);
        objc_destroyWeak(&location);
      }
    }
    [(TPSTipCollectionViewCell *)self setupSharedTipMessaging];
  }
}

- (void)prepareForReuse
{
  [(TPSTipCollectionViewCell *)self prepareSharedTipForReuse];
  v3.receiver = self;
  v3.super_class = (Class)TPSTipCollectionViewCell;
  [(TPSBaseTipCollectionViewCell *)&v3 prepareForReuse];
}

- (BOOL)setTip:(id)a3 withCellAppearance:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [v7 size];
  double v9 = v8;
  double v11 = v10;
  [(TPSBaseTipCollectionViewCell *)self cacheCellSize];
  double v13 = v12;
  double v15 = v14;
  v25.receiver = self;
  v25.super_class = (Class)TPSTipCollectionViewCell;
  BOOL v16 = [(TPSBaseTipCollectionViewCell *)&v25 setTip:v6 withCellAppearance:v7];

  id v17 = [(TPSBaseTipCollectionViewCell *)self tip];
  id v18 = [v17 hasVideo];
  v19 = [(TPSBaseTipCollectionViewCell *)self heroAssetView];
  [v19 setUserInteractionEnabled:v18];

  if (v16 || v9 != v13 || v11 != v15)
  {
    id v20 = [(TPSTipCollectionViewCell *)self footnoteTextView];
    [v20 setHidden:1];

    id v21 = [v6 eyebrowText];
    if (!v21)
    {
      if ([v6 isSiriSuggestion])
      {
        id v22 = +[NSBundle mainBundle];
        id v21 = [v22 localizedStringForKey:@"SIRI_SUGGESTION" value:&stru_1000B98B0 table:0];
      }
      else
      {
        id v21 = 0;
      }
    }
    BOOL v23 = v21 == 0;
    -[TPSTipCollectionViewCell setNeedsTextView:](self, "setNeedsTextView:", [v6 containsLinks]);
    [(UILabel *)self->_eyebrowLabel setText:v21];
    [(UILabel *)self->_eyebrowLabel setHidden:v23];
    [(NSLayoutConstraint *)self->_eyebrowLabelTopAnchorConstraint setActive:v21 != 0];
    [(NSLayoutConstraint *)self->_titleLabelToEyebrowLabelTopAnchor setActive:v21 != 0];
    [(NSLayoutConstraint *)self->_titleLabelTopAnchorConstraint setActive:v23];
    [(TPSTipCollectionViewCell *)self setNeedsUpdateConstraints];
  }
  return v16;
}

- (void)cancelReplayButtonTimer
{
  id v2 = [(TPSBaseTipCollectionViewCell *)self heroAssetView];
  [v2 cancelReplayButtonTimer];
}

- (void)setNeedsTextView:(BOOL)a3
{
  v7.receiver = self;
  v7.super_class = (Class)TPSTipCollectionViewCell;
  [(TPSBaseTipCollectionViewCell *)&v7 setNeedsTextView:a3];
  id v4 = [(TPSBaseTipCollectionViewCell *)self tip];
  v5 = [v4 footnoteContent];
  if (v5)
  {
  }
  else
  {
    unsigned __int8 v6 = [(TPSBaseTipCollectionViewCell *)self isSharedVariant];

    if ((v6 & 1) == 0) {
      return;
    }
  }
  [(NSLayoutConstraint *)self->_contentLabelBottomConstraint setActive:0];
  [(NSLayoutConstraint *)self->_textViewBottomConstraint setActive:0];
}

- (void)updateConstraints
{
  [(TPSBaseTipCollectionViewCell *)self bottomPadding];
  double v4 = v3;
  -[NSLayoutConstraint setConstant:](self->_contentLabelBottomConstraint, "setConstant:");
  [(NSLayoutConstraint *)self->_textViewBottomConstraint setConstant:v4];
  [(NSLayoutConstraint *)self->_footnoteBottomConstraint setConstant:v4];
  [(NSLayoutConstraint *)self->_sharedTextViewBottomConstraint setConstant:v4];
  v5 = [(TPSBaseTipCollectionViewCell *)self cellAppearance];
  [v5 contentSidePadding];
  -[NSLayoutConstraint setConstant:](self->_titleLabelLeadingConstraint, "setConstant:");
  [v5 contentSidePadding];
  [(NSLayoutConstraint *)self->_titleLabelTrailingConstraint setConstant:-v6];
  v7.receiver = self;
  v7.super_class = (Class)TPSTipCollectionViewCell;
  [(TPSBaseTipCollectionViewCell *)&v7 updateConstraints];
}

- (void)constellationContentParserAttributedStringUpdated:(id)a3
{
  id v4 = a3;
  v5 = [(TPSTipCollectionViewCell *)self footnoteContentParser];
  unsigned int v6 = [v4 isEqual:v5];

  if (v6)
  {
    objc_super v7 = [v4 identifier];
    double v8 = [(TPSBaseTipCollectionViewCell *)self tip];
    double v9 = [v8 identifier];
    unsigned int v10 = [v7 isEqualToString:v9];

    if (v10)
    {
      double v11 = [(TPSBaseTipCollectionViewCell *)self appController];
      double v12 = [v4 attributedString];
      [v11 updateFootnoteAttributedString:v12 forIdentifier:v7];

      double v13 = [(TPSTipCollectionViewCell *)self footnoteTextView];
      [v13 setTipID:0];

      double v14 = [(TPSTipCollectionViewCell *)self footnoteTextView];
      [v14 setAttributedText:0];

      [(TPSTipCollectionViewCell *)self updateContentLabel];
    }
  }
  else
  {
    v15.receiver = self;
    v15.super_class = (Class)TPSTipCollectionViewCell;
    [(TPSBaseTipCollectionViewCell *)&v15 constellationContentParserAttributedStringUpdated:v4];
  }
}

- (id)constellationContentParserBoldFont:(id)a3
{
  id v4 = a3;
  v5 = [(TPSTipCollectionViewCell *)self footnoteContentParser];
  unsigned int v6 = [v4 isEqual:v5];

  if (v6)
  {
    uint64_t v7 = +[TPSAppearance footnoteBoldTextFont];
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)TPSTipCollectionViewCell;
    uint64_t v7 = [(TPSBaseTipCollectionViewCell *)&v10 constellationContentParserBoldFont:v4];
  }
  double v8 = (void *)v7;

  return v8;
}

- (id)constellationContentParserItalicFont:(id)a3
{
  id v4 = a3;
  v5 = [(TPSTipCollectionViewCell *)self footnoteContentParser];
  unsigned int v6 = [v4 isEqual:v5];

  if (v6)
  {
    uint64_t v7 = +[TPSAppearance footnoteItalicTextFont];
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)TPSTipCollectionViewCell;
    uint64_t v7 = [(TPSBaseTipCollectionViewCell *)&v10 constellationContentParserItalicFont:v4];
  }
  double v8 = (void *)v7;

  return v8;
}

- (NSLayoutConstraint)contentLabelBottomConstraint
{
  return self->_contentLabelBottomConstraint;
}

- (void)setContentLabelBottomConstraint:(id)a3
{
}

- (NSLayoutConstraint)textViewBottomConstraint
{
  return self->_textViewBottomConstraint;
}

- (void)setTextViewBottomConstraint:(id)a3
{
}

- (NSLayoutConstraint)footnoteBottomConstraint
{
  return self->_footnoteBottomConstraint;
}

- (void)setFootnoteBottomConstraint:(id)a3
{
}

- (NSLayoutConstraint)sharedTextViewBottomConstraint
{
  return self->_sharedTextViewBottomConstraint;
}

- (void)setSharedTextViewBottomConstraint:(id)a3
{
}

- (TPSTipContentTextView)footnoteTextView
{
  return self->_footnoteTextView;
}

- (void)setFootnoteTextView:(id)a3
{
}

- (UIView)sharedTipAvailabilityView
{
  return self->_sharedTipAvailabilityView;
}

- (void)setSharedTipAvailabilityView:(id)a3
{
}

- (UILabel)eyebrowLabel
{
  return self->_eyebrowLabel;
}

- (void)setEyebrowLabel:(id)a3
{
}

- (NSBlockOperation)footnoteContentTextOperation
{
  return self->_footnoteContentTextOperation;
}

- (void)setFootnoteContentTextOperation:(id)a3
{
}

- (NSString)footnoteContentTextOperationID
{
  return self->_footnoteContentTextOperationID;
}

- (void)setFootnoteContentTextOperationID:(id)a3
{
}

- (TPSConstellationContentParser)footnoteContentParser
{
  return self->_footnoteContentParser;
}

- (void)setFootnoteContentParser:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_footnoteContentParser, 0);
  objc_storeStrong((id *)&self->_footnoteContentTextOperationID, 0);
  objc_storeStrong((id *)&self->_footnoteContentTextOperation, 0);
  objc_storeStrong((id *)&self->_eyebrowLabel, 0);
  objc_storeStrong((id *)&self->_sharedTipAvailabilityView, 0);
  objc_storeStrong((id *)&self->_footnoteTextView, 0);
  objc_storeStrong((id *)&self->_sharedTextViewBottomConstraint, 0);
  objc_storeStrong((id *)&self->_footnoteBottomConstraint, 0);
  objc_storeStrong((id *)&self->_textViewBottomConstraint, 0);
  objc_storeStrong((id *)&self->_contentLabelBottomConstraint, 0);
  objc_storeStrong((id *)&self->_titleLabelTrailingConstraint, 0);
  objc_storeStrong((id *)&self->_titleLabelLeadingConstraint, 0);
  objc_storeStrong((id *)&self->_titleLabelTopAnchorConstraint, 0);
  objc_storeStrong((id *)&self->_titleLabelToEyebrowLabelTopAnchor, 0);

  objc_storeStrong((id *)&self->_eyebrowLabelTopAnchorConstraint, 0);
}

- (void)setupSharedTipMessaging
{
  id v2 = self;
  sub_1000526EC();
}

- (void)prepareSharedTipForReuse
{
  id v2 = self;
  sub_1000530E4();
}

- (id)availabilityTextView
{
  id v2 = self;
  id v3 = sub_1000531F0();

  return v3;
}

- (void)deactivateBottomConstraints
{
  id v2 = self;
  sub_1000540CC();
}

@end