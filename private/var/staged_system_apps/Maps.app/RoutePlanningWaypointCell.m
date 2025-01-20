@interface RoutePlanningWaypointCell
- (BOOL)isDraggable;
- (BOOL)isEditable;
- (BOOL)mapsDragDestinationHandler:(id)a3 didReceiveURL:(id)a4;
- (BOOL)mapsDragDestinationHandler:(id)a3 didReceiveVCard:(id)a4;
- (BOOL)textFieldShouldClear:(id)a3;
- (BOOL)textFieldShouldReturn:(id)a3;
- (NSArray)waypoints;
- (NSNumber)waypointIndex;
- (NSString)currentText;
- (RoutePlanningWaypointCell)initWithWaypoints:(id)a3 waypointIndex:(id)a4 editable:(BOOL)a5 delegate:(id)a6 waypointInfoProvider:(id)a7 cellIndex:(unint64_t)a8;
- (RoutePlanningWaypointCellDelegate)delegate;
- (SearchFieldItem)editingWaypoint;
- (double)preferredSeparatorInset;
- (id)mapsDragDestinationHandler;
- (id)textDroppableView:(id)a3 proposalForDrop:(id)a4;
- (id)textField:(id)a3 editMenuForCharactersInRange:(_NSRange)a4 suggestedActions:(id)a5;
- (unint64_t)cellIndex;
- (unint64_t)textDroppableView:(id)a3 willBecomeEditableForDrop:(id)a4;
- (void)_markAsEditing;
- (void)_markAsNotEditingAndUpdateContent;
- (void)_textFieldEditingChanged:(id)a3;
- (void)_updateConstraints;
- (void)_updateContent;
- (void)_updateFonts;
- (void)_updateIconImage;
- (void)_updatePlaceholderText;
- (void)_updateTitleText;
- (void)beginEditing;
- (void)endEditing;
- (void)mapsDragDestinationHandler:(id)a3 didReceiveMapItem:(id)a4;
- (void)prepareForReplacement;
- (void)setCellIndex:(unint64_t)a3;
- (void)textDroppableView:(id)a3 dropSessionDidEnd:(id)a4;
- (void)textDroppableView:(id)a3 willPerformDrop:(id)a4;
- (void)textFieldDidBeginEditing:(id)a3;
- (void)textFieldDidEndEditing:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation RoutePlanningWaypointCell

- (RoutePlanningWaypointCell)initWithWaypoints:(id)a3 waypointIndex:(id)a4 editable:(BOOL)a5 delegate:(id)a6 waypointInfoProvider:(id)a7 cellIndex:(unint64_t)a8
{
  BOOL v11 = a5;
  id v14 = a3;
  id v15 = a4;
  id v16 = a6;
  id v17 = a7;
  v108.receiver = self;
  v108.super_class = (Class)RoutePlanningWaypointCell;
  v18 = [(RoutePlanningWaypointCell *)&v108 initWithStyle:0 reuseIdentifier:0];
  if (v18)
  {
    id v103 = v14;
    id v104 = v17;
    v19 = (NSArray *)[v14 copy];
    waypoints = v18->_waypoints;
    v18->_waypoints = v19;

    objc_storeStrong((id *)&v18->_waypointIndex, a4);
    v18->_editable = v11;
    id v101 = v16;
    objc_storeWeak((id *)&v18->_delegate, v16);
    v18->_cellIndex = a8;
    v21 = +[UIColor tertiarySystemFillColor];
    [(RoutePlanningWaypointCell *)v18 setBackgroundColor:v21];

    [(RoutePlanningWaypointCell *)v18 setAccessibilityIdentifier:@"RoutePlanningWaypointCell"];
    id v22 = objc_alloc((Class)UIView);
    double y = CGRectZero.origin.y;
    double width = CGRectZero.size.width;
    double height = CGRectZero.size.height;
    id v26 = [v22 initWithFrame:CGRectZero.origin.x, y, width, height];
    [v26 setTranslatesAutoresizingMaskIntoConstraints:0];
    [v26 setUserInteractionEnabled:0];
    v27 = [(RoutePlanningWaypointCell *)v18 contentView];
    [v27 addSubview:v26];

    v28 = [objc_alloc((Class)UIImageView) initWithFrame:CGRectZero.origin.x, y, width, height];
    iconView = v18->_iconView;
    v18->_iconView = v28;

    [(UIImageView *)v18->_iconView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIImageView *)v18->_iconView setContentMode:1];
    [(UIImageView *)v18->_iconView setAccessibilityIdentifier:@"RoutePlanningWaypointCellIconView"];
    v30 = [(RoutePlanningWaypointCell *)v18 traitCollection];
    v31 = +[UIFont _maps_fontWithTextStyle:UIFontTextStyleTitle2 weight:v30 compatibleWithTraitCollection:UIFontWeightBold];
    v32 = +[UIImageSymbolConfiguration configurationWithFont:v31];
    [(UIImageView *)v18->_iconView setPreferredSymbolConfiguration:v32];

    [(UIImageView *)v18->_iconView setTag:10101];
    [v26 addSubview:v18->_iconView];
    v33 = -[RoutePlanningWaypointTextField initWithFrame:]([RoutePlanningWaypointTextField alloc], "initWithFrame:", CGRectZero.origin.x, y, width, height);
    titleTextField = v18->_titleTextField;
    v18->_titleTextField = v33;

    [(RoutePlanningWaypointTextField *)v18->_titleTextField setTranslatesAutoresizingMaskIntoConstraints:0];
    [(RoutePlanningWaypointTextField *)v18->_titleTextField setEnabled:v11];
    [(RoutePlanningWaypointTextField *)v18->_titleTextField setAccessibilityIdentifier:@"RoutePlanningWaypointCellTextField"];
    [(RoutePlanningWaypointTextField *)v18->_titleTextField setDelegate:v18];
    [(RoutePlanningWaypointTextField *)v18->_titleTextField setTextDropDelegate:v18];
    [(RoutePlanningWaypointTextField *)v18->_titleTextField setReturnKeyType:6];
    [(RoutePlanningWaypointTextField *)v18->_titleTextField setAutocorrectionType:1];
    [(RoutePlanningWaypointTextField *)v18->_titleTextField setSpellCheckingType:1];
    [(RoutePlanningWaypointTextField *)v18->_titleTextField setFocusGroupIdentifier:@"RoutePlanningWaypointFocusGroup"];
    LODWORD(v35) = 1132068864;
    [(RoutePlanningWaypointTextField *)v18->_titleTextField setContentHuggingPriority:0 forAxis:v35];
    v36 = +[UIApplication sharedApplication];
    LODWORD(v31) = [v36 userInterfaceLayoutDirection] == (id)1;

    [(RoutePlanningWaypointTextField *)v18->_titleTextField setTextAlignment:2 * v31];
    [(RoutePlanningWaypointCell *)v18 _updateFonts];
    [(RoutePlanningWaypointTextField *)v18->_titleTextField addTarget:v18 action:"_textFieldEditingChanged:" forControlEvents:0x20000];
    v37 = [(RoutePlanningWaypointCell *)v18 contentView];
    [v37 addSubview:v18->_titleTextField];

    if (sub_1000BBB44(v18) == 5) {
      double v38 = 13.0;
    }
    else {
      double v38 = 20.0;
    }
    uint64_t v39 = sub_1000BBB44(v18);
    double v40 = 14.0;
    if (v39 == 5) {
      double v40 = 9.0;
    }
    double v41 = v38 + v40 * 2.0;
    v42 = [v26 widthAnchor];
    uint64_t v43 = [v42 constraintEqualToConstant:v41];
    imageContainerViewWidthConstraint = v18->_imageContainerViewWidthConstraint;
    v18->_imageContainerViewWidthConstraint = (NSLayoutConstraint *)v43;

    v45 = [(UIImageView *)v18->_iconView widthAnchor];
    uint64_t v46 = [v45 constraintEqualToConstant:v38];
    iconViewWidthConstraint = v18->_iconViewWidthConstraint;
    v18->_iconViewWidthConstraint = (NSLayoutConstraint *)v46;

    v48 = [(UIImageView *)v18->_iconView heightAnchor];
    uint64_t v49 = [v48 constraintEqualToConstant:v38];
    iconViewHeightConstraint = v18->_iconViewHeightConstraint;
    v18->_iconViewHeightConstraint = (NSLayoutConstraint *)v49;

    if (v15 && [v17 hasValidEVRoute])
    {
      v51 = -[RoutePlanningWaypointPillView initWithWaypointIndex:waypointInfoProvider:]([RoutePlanningWaypointPillView alloc], "initWithWaypointIndex:waypointInfoProvider:", [v15 unsignedIntegerValue], v17);
      pillView = v18->_pillView;
      v18->_pillView = v51;

      [(RoutePlanningWaypointPillView *)v18->_pillView setTranslatesAutoresizingMaskIntoConstraints:0];
      v53 = [(RoutePlanningWaypointCell *)v18 contentView];
      [v53 addSubview:v18->_pillView];
    }
    id v102 = v15;
    v105 = objc_opt_new();
    v96 = [v26 leadingAnchor];
    v98 = [(RoutePlanningWaypointCell *)v18 contentView];
    v94 = [v98 leadingAnchor];
    v93 = [v96 constraintEqualToAnchor:v94];
    v110[0] = v93;
    v91 = [v26 topAnchor];
    v92 = [(RoutePlanningWaypointCell *)v18 contentView];
    v90 = [v92 topAnchor];
    v89 = [v91 constraintEqualToAnchor:v90];
    v110[1] = v89;
    v87 = [v26 bottomAnchor];
    v88 = [(RoutePlanningWaypointCell *)v18 contentView];
    v86 = [v88 bottomAnchor];
    v85 = [v87 constraintEqualToAnchor:v86];
    v110[2] = v85;
    v110[3] = v18->_imageContainerViewWidthConstraint;
    v84 = [(UIImageView *)v18->_iconView centerXAnchor];
    v83 = [v26 centerXAnchor];
    v82 = [v84 constraintEqualToAnchor:v83];
    v110[4] = v82;
    v81 = [(UIImageView *)v18->_iconView centerYAnchor];
    v80 = [v26 centerYAnchor];
    v79 = [v81 constraintEqualToAnchor:v80];
    v110[5] = v79;
    v110[6] = v18->_iconViewWidthConstraint;
    v110[7] = v18->_iconViewHeightConstraint;
    v78 = [(RoutePlanningWaypointTextField *)v18->_titleTextField leadingAnchor];
    v100 = v26;
    v77 = [v26 trailingAnchor];
    v76 = [v78 constraintEqualToAnchor:v77];
    v110[8] = v76;
    v75 = [(RoutePlanningWaypointTextField *)v18->_titleTextField topAnchor];
    v54 = [(RoutePlanningWaypointCell *)v18 contentView];
    v55 = [v54 topAnchor];
    v56 = [v75 constraintEqualToAnchor:v55];
    v110[9] = v56;
    v57 = [(RoutePlanningWaypointTextField *)v18->_titleTextField bottomAnchor];
    v58 = [(RoutePlanningWaypointCell *)v18 contentView];
    v59 = [v58 bottomAnchor];
    v60 = [v57 constraintEqualToAnchor:v59];
    v110[10] = v60;
    v61 = +[NSArray arrayWithObjects:v110 count:11];
    [v105 addObjectsFromArray:v61];

    v62 = v18->_pillView;
    if (v62)
    {
      v97 = [(RoutePlanningWaypointPillView *)v62 leadingAnchor];
      uint64_t v95 = [(RoutePlanningWaypointTextField *)v18->_titleTextField trailingAnchor];
      v63 = [v97 constraintEqualToAnchor:v95 constant:10.0];
      v109[0] = v63;
      v64 = [(RoutePlanningWaypointPillView *)v18->_pillView trailingAnchor];
      v99 = [(RoutePlanningWaypointCell *)v18 contentView];
      v65 = [v99 trailingAnchor];
      v66 = [v64 constraintLessThanOrEqualToAnchor:v65 constant:-16.0];
      v109[1] = v66;
      v67 = [(RoutePlanningWaypointPillView *)v18->_pillView centerYAnchor];
      v68 = [(RoutePlanningWaypointCell *)v18 contentView];
      v69 = [v68 centerYAnchor];
      v70 = [v67 constraintEqualToAnchor:v69];
      v109[2] = v70;
      v71 = +[NSArray arrayWithObjects:v109 count:3];
      [v105 addObjectsFromArray:v71];

      v72 = (void *)v95;
      v73 = v97;
    }
    else
    {
      v73 = [(RoutePlanningWaypointTextField *)v18->_titleTextField trailingAnchor];
      v72 = [(RoutePlanningWaypointCell *)v18 contentView];
      v63 = [v72 trailingAnchor];
      v64 = [v73 constraintEqualToAnchor:v63];
      [v105 addObject:v64];
    }
    id v14 = v103;

    +[NSLayoutConstraint activateConstraints:v105];
    [(RoutePlanningWaypointCell *)v18 _updateContent];
    [(RoutePlanningWaypointCell *)v18 _updateConstraints];
    [(RoutePlanningWaypointCell *)v18 _updatePlaceholderText];
    v106[0] = _NSConcreteStackBlock;
    v106[1] = 3221225472;
    v106[2] = sub_100B8C620;
    v106[3] = &unk_1012E5D08;
    v107 = v18;
    +[UIView performWithoutAnimation:v106];

    id v16 = v101;
    id v15 = v102;
    id v17 = v104;
  }

  return v18;
}

- (double)preferredSeparatorInset
{
  [(NSLayoutConstraint *)self->_imageContainerViewWidthConstraint constant];
  return result;
}

- (void)traitCollectionDidChange:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)RoutePlanningWaypointCell;
  id v4 = a3;
  [(RoutePlanningWaypointCell *)&v8 traitCollectionDidChange:v4];
  v5 = [v4 preferredContentSizeCategory];

  v6 = [(RoutePlanningWaypointCell *)self traitCollection];
  v7 = [v6 preferredContentSizeCategory];

  if (v5 != v7)
  {
    [(RoutePlanningWaypointCell *)self _updateFonts];
    [(RoutePlanningWaypointCell *)self _updateConstraints];
  }
}

- (void)setCellIndex:(unint64_t)a3
{
  if (self->_cellIndex != a3)
  {
    self->_cellIndex = a3;
    [(RoutePlanningWaypointCell *)self _updatePlaceholderText];
  }
}

- (void)_updateContent
{
  [(RoutePlanningWaypointCell *)self _updateTitleText];

  [(RoutePlanningWaypointCell *)self _updateIconImage];
}

- (void)_updateTitleText
{
  id v17 = [(RoutePlanningWaypointCell *)self waypoints];
  id v3 = [v17 count];
  if ((unint64_t)v3 < 2)
  {
    objc_super v8 = [v17 firstObject];
    if (![(RoutePlanningWaypointTextField *)self->_titleTextField isEnabled]) {
      goto LABEL_7;
    }
    v9 = [v8 searchResult];
    unsigned int v10 = [v9 isDynamicCurrentLocation];

    if (!v10
      || (+[MKLocationManager sharedLocationManager],
          BOOL v11 = objc_claimAutoreleasedReturnValue(),
          unsigned int v12 = [v11 isLocationServicesApproved],
          unsigned int v13 = [v11 isAuthorizedForPreciseLocation],
          v11,
          id v14 = &stru_101324E70,
          v12)
      && v13)
    {
LABEL_7:
      id v14 = [v8 waypointName];
    }
    if (v14) {
      CFStringRef v15 = v14;
    }
    else {
      CFStringRef v15 = &stru_101324E70;
    }
    [(RoutePlanningWaypointTextField *)self->_titleTextField setText:v15];
    id v16 = +[UIColor labelColor];
    [(RoutePlanningWaypointTextField *)self->_titleTextField setTextColor:v16];
  }
  else
  {
    id v4 = v3;
    v5 = +[NSBundle mainBundle];
    v6 = [v5 localizedStringForKey:@"[Route Planning] Waypoint List" value:@"localized string not found" table:0];
    v7 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v6, v4, v4, v4);
    [(RoutePlanningWaypointTextField *)self->_titleTextField setText:v7];

    objc_super v8 = +[UIColor systemBlueColor];
    [(RoutePlanningWaypointTextField *)self->_titleTextField setTextColor:v8];
  }
}

- (void)_updateIconImage
{
  id v3 = [(RoutePlanningWaypointCell *)self waypoints];
  id v4 = [v3 count];
  if (!self->_editing)
  {
    unint64_t v5 = (unint64_t)v4;
    v6 = [(RoutePlanningWaypointTextField *)self->_titleTextField text];
    id v7 = [v6 length];

    if (v7 && v5 != 0)
    {
      if (v5 < 2)
      {
        [(UIImageView *)self->_iconView setTintColor:0];
        v21 = [v3 firstObject];
        id v22 = [(RoutePlanningWaypointCell *)self traitCollection];
        [v22 displayScale];
        unsigned int v10 = [v21 waypointIconWithScale:];

        if (!v10)
        {
LABEL_18:
          v23 = +[GEOFeatureStyleAttributes genericMarkerStyleAttributes];
          v24 = [(RoutePlanningWaypointCell *)self traitCollection];
          [v24 displayScale];
          unsigned int v10 = +[MKIconManager imageForStyle:size:forScale:format:](MKIconManager, "imageForStyle:size:forScale:format:", v23, 0, 0);
        }
      }
      else
      {
        CFStringRef v15 = +[UIColor tertiaryLabelColor];
        [(UIImageView *)self->_iconView setTintColor:v15];

        id v16 = +[GEOFeatureStyleAttributes multipleWaypointsStyleAttributes];
        id v17 = [(RoutePlanningWaypointCell *)self traitCollection];
        [v17 displayScale];
        unsigned int v10 = +[MKIconManager imageForStyle:size:forScale:format:](MKIconManager, "imageForStyle:size:forScale:format:", v16, 0, 0);

        if (!v10)
        {
          v18 = sub_1005762E4();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
          {
            int v25 = 136315906;
            id v26 = "-[RoutePlanningWaypointCell _updateIconImage]";
            __int16 v27 = 2080;
            v28 = "RoutePlanningWaypointCell.m";
            __int16 v29 = 1024;
            int v30 = 260;
            __int16 v31 = 2080;
            v32 = "waypointCount <= 1";
            _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion: (%s)", (uint8_t *)&v25, 0x26u);
          }

          if (sub_100BB36BC())
          {
            v19 = sub_1005762E4();
            if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
            {
              v20 = +[NSThread callStackSymbols];
              int v25 = 138412290;
              id v26 = v20;
              _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v25, 0xCu);
            }
          }
          goto LABEL_18;
        }
      }
      [(UIImageView *)self->_iconView setImage:v10];
      goto LABEL_8;
    }
  }
  v9 = +[UIColor secondarySystemFillColor];
  [(UIImageView *)self->_iconView setTintColor:v9];

  unsigned int v10 = +[UIColor systemWhiteColor];
  v33[0] = v10;
  BOOL v11 = +[UIColor tertiaryLabelColor];
  v33[1] = v11;
  unsigned int v12 = +[NSArray arrayWithObjects:v33 count:2];
  unsigned int v13 = +[UIImageSymbolConfiguration configurationWithPaletteColors:v12];
  id v14 = +[UIImage systemImageNamed:@"magnifyingglass.circle.fill" withConfiguration:v13];
  [(UIImageView *)self->_iconView setImage:v14];

LABEL_8:
}

- (void)_updateFonts
{
  id v5 = [(RoutePlanningWaypointCell *)self traitCollection];
  id v3 = [v5 _maps_traitCollectionWithMaximumContentSizeCategory:UIContentSizeCategoryAccessibilityLarge];
  id v4 = +[UIFont preferredFontForTextStyle:UIFontTextStyleBody compatibleWithTraitCollection:v3];
  [(RoutePlanningWaypointTextField *)self->_titleTextField setFont:v4];
}

- (void)_updateConstraints
{
  id v3 = [(RoutePlanningWaypointCell *)self traitCollection];
  id v4 = [v3 preferredContentSizeCategory];
  NSComparisonResult v5 = UIContentSizeCategoryCompareToCategory(v4, UIContentSizeCategoryExtraExtraExtraLarge);

  uint64_t v6 = sub_1000BBB44(self);
  double v7 = 30.0;
  if (v5 == NSOrderedAscending) {
    double v7 = 20.0;
  }
  if (v6 == 5) {
    double v8 = 13.0;
  }
  else {
    double v8 = v7;
  }
  uint64_t v9 = sub_1000BBB44(self);
  double v10 = 14.0;
  if (v9 == 5) {
    double v10 = 9.0;
  }
  [(NSLayoutConstraint *)self->_imageContainerViewWidthConstraint setConstant:v8 + v10 * 2.0];
  [(NSLayoutConstraint *)self->_iconViewWidthConstraint setConstant:v8];
  iconViewHeightConstraint = self->_iconViewHeightConstraint;

  [(NSLayoutConstraint *)iconViewHeightConstraint setConstant:v8];
}

- (void)_updatePlaceholderText
{
  unint64_t cellIndex = self->_cellIndex;
  id v4 = +[NSBundle mainBundle];
  id v7 = v4;
  if (cellIndex) {
    CFStringRef v5 = @"[Route Planning] To";
  }
  else {
    CFStringRef v5 = @"[Route Planning] From";
  }
  uint64_t v6 = [v4 localizedStringForKey:v5 value:@"localized string not found" table:0];
  [(RoutePlanningWaypointTextField *)self->_titleTextField setPlaceholder:v6];
}

- (NSString)currentText
{
  v2 = [(RoutePlanningWaypointTextField *)self->_titleTextField text];
  id v3 = [v2 copy];

  return (NSString *)v3;
}

- (SearchFieldItem)editingWaypoint
{
  if ([(RoutePlanningWaypointCell *)self isEditable])
  {
    id v3 = [(RoutePlanningWaypointCell *)self waypoints];
    id v4 = [v3 firstObject];
  }
  else
  {
    id v4 = 0;
  }

  return (SearchFieldItem *)v4;
}

- (void)beginEditing
{
  [(RoutePlanningWaypointTextField *)self->_titleTextField becomeFirstResponder];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100B8D07C;
  block[3] = &unk_1012E5D08;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)endEditing
{
}

- (void)prepareForReplacement
{
  objc_storeWeak((id *)&self->_delegate, 0);
  waypoints = self->_waypoints;
  self->_waypoints = 0;

  [(RoutePlanningWaypointTextField *)self->_titleTextField setText:0];
  titleTextField = self->_titleTextField;

  [(RoutePlanningWaypointTextField *)titleTextField setPlaceholder:0];
}

- (void)textFieldDidBeginEditing:(id)a3
{
  BOOL v4 = [(RoutePlanningWaypointTextField *)self->_titleTextField isHandlingTouch];
  [(RoutePlanningWaypointTextField *)self->_titleTextField didBeginEditingFromTouch:v4];
  CFStringRef v5 = [(RoutePlanningWaypointCell *)self delegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = [(RoutePlanningWaypointCell *)self delegate];
    [v7 cellDidStartEditing:self withUserInteraction:v4];
  }
}

- (void)textFieldDidEndEditing:(id)a3
{
  [(RoutePlanningWaypointCell *)self _markAsNotEditingAndUpdateContent];
  BOOL v4 = [(RoutePlanningWaypointCell *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = [(RoutePlanningWaypointCell *)self delegate];
    [v6 cellDidStopEditing:self];
  }
}

- (BOOL)textFieldShouldClear:(id)a3
{
  BOOL v4 = sub_1005768D4();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    char v5 = [(RoutePlanningWaypointCell *)self editingWaypoint];
    int v11 = 138412290;
    unsigned int v12 = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "Will clear item: %@", (uint8_t *)&v11, 0xCu);
  }
  id v6 = [(RoutePlanningWaypointCell *)self editingWaypoint];
  [v6 clear];

  [(RoutePlanningWaypointCell *)self _markAsEditing];
  id v7 = [(RoutePlanningWaypointCell *)self delegate];
  char v8 = objc_opt_respondsToSelector();

  if (v8)
  {
    uint64_t v9 = [(RoutePlanningWaypointCell *)self delegate];
    [v9 cellDidClearInputText:self];
  }
  return 1;
}

- (void)_textFieldEditingChanged:(id)a3
{
  id v4 = a3;
  [(RoutePlanningWaypointCell *)self _markAsEditing];
  char v5 = [(RoutePlanningWaypointCell *)self delegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = [v4 text];
    if (!v7)
    {
      uint64_t v9 = sub_1005762E4();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        double v10 = +[NSString stringWithFormat:@"Should always have text!"];
        int v13 = 136316162;
        id v14 = "-[RoutePlanningWaypointCell _textFieldEditingChanged:]";
        __int16 v15 = 2080;
        id v16 = "RoutePlanningWaypointCell.m";
        __int16 v17 = 1024;
        int v18 = 368;
        __int16 v19 = 2080;
        v20 = "text";
        __int16 v21 = 2112;
        id v22 = v10;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion: (%s) '%@'", (uint8_t *)&v13, 0x30u);
      }
      if (sub_100BB36BC())
      {
        int v11 = sub_1005762E4();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        {
          unsigned int v12 = +[NSThread callStackSymbols];
          int v13 = 138412290;
          id v14 = v12;
          _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v13, 0xCu);
        }
      }
    }
    char v8 = [(RoutePlanningWaypointCell *)self delegate];
    [v8 cell:self didChangeInputText:v7];
  }
}

- (BOOL)textFieldShouldReturn:(id)a3
{
  id v4 = [a3 text];
  char v5 = [v4 _maps_stringByTrimmingLeadingWhitespace];
  id v6 = [v5 length];

  if (v6)
  {
    id v7 = [(RoutePlanningWaypointCell *)self delegate];
    char v8 = objc_opt_respondsToSelector();

    if (v8)
    {
      uint64_t v9 = [(RoutePlanningWaypointCell *)self delegate];
      [v9 cellDidRequestSearch:self];
    }
  }
  return v6 != 0;
}

- (id)textField:(id)a3 editMenuForCharactersInRange:(_NSRange)a4 suggestedActions:(id)a5
{
  id v6 = a5;
  id v7 = [(RoutePlanningWaypointCell *)self delegate];
  char v8 = objc_opt_respondsToSelector();

  if (v8)
  {
    uint64_t v9 = [(RoutePlanningWaypointCell *)self delegate];
    double v10 = [v9 contextMenuForCell:self];

    if (v10)
    {
      id v11 = [v6 mutableCopy];
      [v11 insertObject:v10 atIndex:0];
      unsigned int v12 = +[UIMenu menuWithChildren:v11];
    }
    else
    {
      unsigned int v12 = 0;
    }
  }
  else
  {
    unsigned int v12 = 0;
  }

  return v12;
}

- (id)mapsDragDestinationHandler
{
  mapsDragDestinationHandler = self->_mapsDragDestinationHandler;
  if (!mapsDragDestinationHandler)
  {
    id v4 = objc_alloc_init(MapsDragDestinationHandler);
    char v5 = self->_mapsDragDestinationHandler;
    self->_mapsDragDestinationHandler = v4;

    [(MapsDragDestinationHandler *)self->_mapsDragDestinationHandler setDelegate:self];
    mapsDragDestinationHandler = self->_mapsDragDestinationHandler;
  }

  return mapsDragDestinationHandler;
}

- (unint64_t)textDroppableView:(id)a3 willBecomeEditableForDrop:(id)a4
{
  return 2;
}

- (id)textDroppableView:(id)a3 proposalForDrop:(id)a4
{
  id v5 = a4;
  id v6 = [objc_alloc((Class)UITextDropProposal) initWithDropOperation:2];
  id v7 = [(RoutePlanningWaypointCell *)self mapsDragDestinationHandler];
  char v8 = [v5 dropSession];

  [v7 beginDrop:v8];
  [v6 setDropPerformer:1];

  return v6;
}

- (void)textDroppableView:(id)a3 willPerformDrop:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [v7 bounds];
  double v10 = v9 + v8 * 0.5;
  double v13 = v12 + v11 * 0.5;
  id v15 = [(RoutePlanningWaypointCell *)self mapsDragDestinationHandler];
  id v14 = [v6 dropSession];

  [v15 performDrop:v14 finishingAtLocation:v7 inView:v10];
}

- (void)textDroppableView:(id)a3 dropSessionDidEnd:(id)a4
{
  id v5 = a4;
  id v6 = [(RoutePlanningWaypointCell *)self mapsDragDestinationHandler];
  [v6 endDrop:v5];
}

- (void)mapsDragDestinationHandler:(id)a3 didReceiveMapItem:(id)a4
{
  id v5 = a4;
  id v6 = [v5 name];
  [(RoutePlanningWaypointTextField *)self->_titleTextField setText:v6];

  id v7 = [(RoutePlanningWaypointCell *)self delegate];
  char v8 = objc_opt_respondsToSelector();

  if (v8)
  {
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_100B8DAE4;
    v9[3] = &unk_1012E5D58;
    v9[4] = self;
    id v10 = v5;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v9);
  }
  else
  {
    [(RoutePlanningWaypointCell *)self _textFieldEditingChanged:self->_titleTextField];
  }
}

- (BOOL)mapsDragDestinationHandler:(id)a3 didReceiveVCard:(id)a4
{
  return 0;
}

- (BOOL)mapsDragDestinationHandler:(id)a3 didReceiveURL:(id)a4
{
  return 0;
}

- (void)_markAsEditing
{
  if (!self->_editing)
  {
    self->_editing = 1;
    id v3 = [(RoutePlanningWaypointCell *)self editingWaypoint];
    [v3 clear];

    [(RoutePlanningWaypointCell *)self _updateIconImage];
  }
}

- (void)_markAsNotEditingAndUpdateContent
{
  if (self->_editing)
  {
    self->_editing = 0;
    id v3 = [(RoutePlanningWaypointCell *)self editingWaypoint];
    id v4 = [v3 waypoint];
    unsigned __int8 v5 = [v4 isValid];

    if ((v5 & 1) == 0)
    {
      [v3 clear];
      id v6 = [(RoutePlanningWaypointCell *)self currentText];
      id v7 = [v6 length];

      if (v7)
      {
        char v8 = [(RoutePlanningWaypointCell *)self currentText];
        [v3 setSearchString:v8];

        double v9 = sub_1005768D4();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
        {
          int v10 = 138412290;
          double v11 = v3;
          _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "Did end editing invalid item with entered text, saving to item: %@", (uint8_t *)&v10, 0xCu);
        }
      }
    }
    [(RoutePlanningWaypointCell *)self _updateContent];
  }
}

- (NSArray)waypoints
{
  return self->_waypoints;
}

- (NSNumber)waypointIndex
{
  return self->_waypointIndex;
}

- (BOOL)isEditable
{
  return self->_editable;
}

- (BOOL)isDraggable
{
  return self->_draggable;
}

- (RoutePlanningWaypointCellDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (RoutePlanningWaypointCellDelegate *)WeakRetained;
}

- (unint64_t)cellIndex
{
  return self->_cellIndex;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_waypointIndex, 0);
  objc_storeStrong((id *)&self->_waypoints, 0);
  objc_storeStrong((id *)&self->_mapsDragDestinationHandler, 0);
  objc_storeStrong((id *)&self->_iconViewHeightConstraint, 0);
  objc_storeStrong((id *)&self->_iconViewWidthConstraint, 0);
  objc_storeStrong((id *)&self->_imageContainerViewWidthConstraint, 0);
  objc_storeStrong((id *)&self->_pillView, 0);
  objc_storeStrong((id *)&self->_titleTextField, 0);

  objc_storeStrong((id *)&self->_iconView, 0);
}

@end