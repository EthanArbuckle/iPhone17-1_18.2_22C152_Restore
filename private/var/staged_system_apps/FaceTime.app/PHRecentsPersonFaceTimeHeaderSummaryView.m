@interface PHRecentsPersonFaceTimeHeaderSummaryView
- (CGSize)intrinsicContentSize;
- (PHRecentsPersonFaceTimeHeaderSummaryView)initWithFrame:(CGRect)a3 recentCall:(id)a4 occurrenceDate:(id)a5 status:(unsigned int)a6 duration:(double)a7 type:(unsigned int)a8 dataUsage:(int64_t)a9;
- (UILabel)bottommostLabel;
- (UILabel)topmostLabel;
- (double)intrinsicContentHeight;
- (void)setBottommostLabel:(id)a3;
- (void)setIntrinsicContentHeight:(double)a3;
- (void)setTopmostLabel:(id)a3;
@end

@implementation PHRecentsPersonFaceTimeHeaderSummaryView

- (PHRecentsPersonFaceTimeHeaderSummaryView)initWithFrame:(CGRect)a3 recentCall:(id)a4 occurrenceDate:(id)a5 status:(unsigned int)a6 duration:(double)a7 type:(unsigned int)a8 dataUsage:(int64_t)a9
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v18 = a4;
  v103.receiver = self;
  v103.super_class = (Class)PHRecentsPersonFaceTimeHeaderSummaryView;
  v19 = -[PHRecentsPersonFaceTimeHeaderSummaryView initWithFrame:](&v103, "initWithFrame:", x, y, width, height);
  if (!v19) {
    goto LABEL_52;
  }
  if ([UIApp userInterfaceStyle] == 1) {
    +[UIColor whiteColor];
  }
  else {
  uint64_t v20 = +[UIColor blackColor];
  }
  id v21 = objc_alloc((Class)UILabel);
  double v22 = CGRectZero.origin.y;
  double v23 = CGRectZero.size.width;
  double v24 = CGRectZero.size.height;
  id v25 = [v21 initWithFrame:CGRectZero.origin.x, v22, v23, v24];
  uint64_t v102 = UIFontDescriptorTextStyleCaption1;
  v26 = +[UIFont phPreferredBoldFontForTextStyle:](UIFont, "phPreferredBoldFontForTextStyle:");
  [v25 setFont:v26];

  [v25 setTextColor:v20];
  [(PHRecentsPersonFaceTimeHeaderSummaryView *)v19 addSubview:v25];
  [v25 setTranslatesAutoresizingMaskIntoConstraints:0];
  LODWORD(v27) = 1144750080;
  [v25 setContentCompressionResistancePriority:0 forAxis:v27];
  LODWORD(v28) = 1148846080;
  [v25 setContentCompressionResistancePriority:1 forAxis:v28];
  LODWORD(v29) = 1132068864;
  [v25 setContentHuggingPriority:0 forAxis:v29];
  LODWORD(v30) = 1148846080;
  [v25 setContentHuggingPriority:1 forAxis:v30];
  [v25 setNumberOfLines:0];
  int v31 = kCHCallTypeFaceTimeAudio;
  if (kCHCallStatusMissed == a6)
  {
    v32 = +[NSBundle mainBundle];
    if (v31 == a8) {
      CFStringRef v33 = @"MISSED_FACETIME_AUDIO";
    }
    else {
      CFStringRef v33 = @"MISSED_FACETIME";
    }
LABEL_20:
    v101 = [v32 localizedStringForKey:v33 value:&stru_1000A3488 table:@"Recents"];
    int v100 = 0;
LABEL_21:
    uint64_t v36 = v102;
    v37 = &CNActionTypeMail_ptr;
LABEL_22:

    goto LABEL_23;
  }
  if (kCHCallStatusCancelled == a6)
  {
    v32 = +[NSBundle mainBundle];
    if (v31 == a8) {
      CFStringRef v33 = @"CANCELED_FACETIME_AUDIO";
    }
    else {
      CFStringRef v33 = @"CANCELED_FACETIME";
    }
    goto LABEL_20;
  }
  if (kCHCallStatusAnsweredElsewhere == a6)
  {
    v32 = +[NSBundle mainBundle];
    if (v31 == a8) {
      CFStringRef v33 = @"ANSWERED_ELSEWHERE_FACETIME_AUDIO";
    }
    else {
      CFStringRef v33 = @"ANSWERED_ELSEWHERE_FACETIME";
    }
    goto LABEL_20;
  }
  if (kCHCallStatusConnectedOutgoing == a6)
  {
    v34 = +[NSBundle mainBundle];
    v32 = v34;
    if (v31 == a8) {
      CFStringRef v35 = @"OUTGOING_FACETIME_AUDIO";
    }
    else {
      CFStringRef v35 = @"OUTGOING_FACETIME";
    }
    v101 = [v34 localizedStringForKey:v35 value:&stru_1000A3488 table:@"Recents"];
    int v100 = 1;
    goto LABEL_21;
  }
  if (kCHCallStatusConnectedIncoming == a6)
  {
    v96 = +[NSBundle mainBundle];
    v32 = v96;
    v37 = &CNActionTypeMail_ptr;
    if (v31 == a8) {
      CFStringRef v97 = @"INCOMING_FACETIME_AUDIO";
    }
    else {
      CFStringRef v97 = @"INCOMING_FACETIME";
    }
    v101 = [v96 localizedStringForKey:v97 value:&stru_1000A3488 table:@"Recents"];
    int v100 = 1;
    uint64_t v36 = v102;
    goto LABEL_22;
  }
  int v100 = 0;
  v101 = 0;
  uint64_t v36 = v102;
  v37 = &CNActionTypeMail_ptr;
LABEL_23:
  [v25 setText:v101];
  [v25 sizeThatFits:177.0, 1.79769313e308];
  double v39 = v38 + 0.0;
  id v40 = [objc_alloc((Class)UILabel) initWithFrame:CGRectZero.origin.x, v22, v23, v24];
  v41 = [v37[149] phPreferredBoldFontForTextStyle:v36];
  [v40 setFont:v41];

  [v40 setTextColor:v20];
  [(PHRecentsPersonFaceTimeHeaderSummaryView *)v19 addSubview:v40];
  [v40 setTranslatesAutoresizingMaskIntoConstraints:0];
  LODWORD(v42) = 1144750080;
  [v40 setContentCompressionResistancePriority:0 forAxis:v42];
  LODWORD(v43) = 1148846080;
  [v40 setContentCompressionResistancePriority:1 forAxis:v43];
  LODWORD(v44) = 1132068864;
  [v40 setContentHuggingPriority:0 forAxis:v44];
  LODWORD(v45) = 1148846080;
  [v40 setContentHuggingPriority:1 forAxis:v45];
  [v40 setNumberOfLines:1];
  [v40 setText:v101];
  [v40 setAlpha:0.0];
  id v98 = v18;
  v99 = (void *)v20;
  if (v100)
  {
    id v46 = [objc_alloc((Class)UILabel) initWithFrame:CGRectZero.origin.x, v22, v23, v24];
    [v46 setTextColor:v20];
    v47 = [v37[149] phPreferredFontForTextStyle:v36];
    [v46 setFont:v47];

    [(PHRecentsPersonFaceTimeHeaderSummaryView *)v19 addSubview:v46];
    [v46 setTranslatesAutoresizingMaskIntoConstraints:0];
    LODWORD(v48) = 1148846080;
    [v46 setContentCompressionResistancePriority:0 forAxis:v48];
    LODWORD(v49) = 1148846080;
    [v46 setContentCompressionResistancePriority:1 forAxis:v49];
    LODWORD(v50) = 1148846080;
    [v46 setContentHuggingPriority:0 forAxis:v50];
    LODWORD(v51) = 1148846080;
    [v46 setContentHuggingPriority:1 forAxis:v51];
    v52 = sub_1000467A8(a7);
    v53 = +[NSByteCountFormatter stringFromByteCount:a9 countStyle:0];
    v54 = +[NSString stringWithFormat:@"%@ (%@)", v52, v53];
    [v46 setText:v54];

    id v18 = v98;
    [v46 sizeThatFits:177.0, 1.79769313e308];
    double v39 = v39 + v55;
  }
  else
  {
    id v46 = 0;
  }
  id v56 = [v18 screenSharingType];
  if (v56)
  {
    id v57 = [objc_alloc((Class)UILabel) initWithFrame:CGRectZero.origin.x, v22, v23, v24];
    [v57 setTextColor:v99];
    v58 = +[UIFont phPreferredFontForTextStyle:v102];
    [v57 setFont:v58];

    [(PHRecentsPersonFaceTimeHeaderSummaryView *)v19 addSubview:v57];
    [v57 setTranslatesAutoresizingMaskIntoConstraints:0];
    LODWORD(v59) = 1148846080;
    [v57 setContentCompressionResistancePriority:0 forAxis:v59];
    LODWORD(v60) = 1148846080;
    [v57 setContentCompressionResistancePriority:1 forAxis:v60];
    LODWORD(v61) = 1148846080;
    [v57 setContentHuggingPriority:0 forAxis:v61];
    LODWORD(v62) = 1148846080;
    [v57 setContentHuggingPriority:1 forAxis:v62];
    unint64_t v63 = (unint64_t)[v18 screenSharingType];
    if ((CHCallScreenSharingTypeScreenShareOrRemoteControl & ~v63) != 0)
    {
      if (([v18 screenSharingType] & 2) != 0)
      {
        v71 = +[NSBundle mainBundle];
        uint64_t v72 = [v71 localizedStringForKey:@"REMOTE_CONTROL" value:&stru_1000A3488 table:@"Recents"];
        v73 = v18;
        v74 = (void *)v72;
        v75 = [v73 callerNameForDisplay];
        v76 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v74, v75);
        [v57 setText:v76];
      }
      else if ([v18 screenSharingType])
      {
        v69 = +[NSBundle mainBundle];
        v70 = [v69 localizedStringForKey:@"SHARED_SCREEN" value:&stru_1000A3488 table:@"Recents"];
        [v57 setText:v70];
      }
    }
    else
    {
      +[NSBundle mainBundle];
      v65 = v64 = v18;
      v66 = [v65 localizedStringForKey:@"SHARED_ALLOWED_REMOTE_CONTROL" value:&stru_1000A3488 table:@"Recents"];
      v67 = [v64 callerNameForDisplay];
      v68 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v66, v67);
      [v57 setText:v68];

      [v57 setNumberOfLines:2];
    }
    [v57 sizeThatFits:177.0, 1.79769313e308];
    double v39 = v39 + v77;
  }
  else
  {
    id v57 = 0;
  }
  v104[0] = @"Type";
  v104[1] = @"FakeType";
  v105[0] = v25;
  v105[1] = v40;
  v104[2] = @"Duration";
  v78 = v46;
  if (!v46)
  {
    v78 = +[NSNull null];
  }
  v105[2] = v78;
  v104[3] = @"ScreenSharingInfo";
  v79 = v57;
  if (!v57)
  {
    v79 = +[NSNull null];
  }
  v105[3] = v79;
  v80 = +[NSDictionary dictionaryWithObjects:v105 forKeys:v104 count:4];
  if (!v57)
  {

    if (v46) {
      goto LABEL_41;
    }
LABEL_54:

    goto LABEL_41;
  }
  if (!v46) {
    goto LABEL_54;
  }
LABEL_41:
  v81 = +[NSLayoutConstraint constraintsWithVisualFormat:options:metrics:views:](NSLayoutConstraint, "constraintsWithVisualFormat:options:metrics:views:", @"|-0@1000-[Type]-0@1000-|", 0, 0, v80);
  [(PHRecentsPersonFaceTimeHeaderSummaryView *)v19 addConstraints:v81];

  v82 = +[NSLayoutConstraint constraintsWithVisualFormat:options:metrics:views:](NSLayoutConstraint, "constraintsWithVisualFormat:options:metrics:views:", @"V:|-0@1000-[FakeType]", 0, 0, v80);
  [(PHRecentsPersonFaceTimeHeaderSummaryView *)v19 addConstraints:v82];

  v83 = +[NSLayoutConstraint constraintWithItem:v25 attribute:3 relatedBy:0 toItem:v40 attribute:3 multiplier:1.0 constant:0.0];
  [(PHRecentsPersonFaceTimeHeaderSummaryView *)v19 addConstraint:v83];

  if (v56)
  {
    v84 = +[NSLayoutConstraint constraintsWithVisualFormat:options:metrics:views:](NSLayoutConstraint, "constraintsWithVisualFormat:options:metrics:views:", @"|-0@1000-[ScreenSharingInfo]-0@1000-|", 0, 0, v80);
    [(PHRecentsPersonFaceTimeHeaderSummaryView *)v19 addConstraints:v84];

    v85 = +[NSLayoutConstraint constraintWithItem:v57 attribute:3 relatedBy:0 toItem:v25 attribute:4 multiplier:1.0 constant:0.0];
    [(PHRecentsPersonFaceTimeHeaderSummaryView *)v19 addConstraint:v85];
  }
  if (v100)
  {
    v86 = +[NSLayoutConstraint constraintsWithVisualFormat:options:metrics:views:](NSLayoutConstraint, "constraintsWithVisualFormat:options:metrics:views:", @"|-0@1000-[Duration]-0@1000-|", 0, 0, v80);
    [(PHRecentsPersonFaceTimeHeaderSummaryView *)v19 addConstraints:v86];

    if (v57) {
      id v88 = v57;
    }
    else {
      id v88 = v25;
    }
    LODWORD(v87) = 1148846080;
    v89 = +[NSLayoutConstraint constraintWithItem:v46 attribute:3 relatedBy:0 toItem:v88 attribute:11 multiplier:1.0 constant:4.30000019 priority:v87];
    [(PHRecentsPersonFaceTimeHeaderSummaryView *)v19 addConstraint:v89];

    v90 = +[UIFont phPreferredFontForTextStyle:v102];
    [v90 _bodyLeading];
    double v92 = v91;
    [v25 _baselineOffsetFromBottom];
    double v39 = v39 - (v93 - v92 * 0.75);
  }
  id v18 = v98;
  [(PHRecentsPersonFaceTimeHeaderSummaryView *)v19 setTopmostLabel:v40];
  if (v46) {
    id v94 = v46;
  }
  else {
    id v94 = v25;
  }
  [(PHRecentsPersonFaceTimeHeaderSummaryView *)v19 setBottommostLabel:v94];
  [(PHRecentsPersonFaceTimeHeaderSummaryView *)v19 setIntrinsicContentHeight:v39];

LABEL_52:
  return v19;
}

- (CGSize)intrinsicContentSize
{
  [(PHRecentsPersonFaceTimeHeaderSummaryView *)self intrinsicContentHeight];
  double v3 = v2;
  double v4 = 177.0;
  result.double height = v3;
  result.double width = v4;
  return result;
}

- (UILabel)topmostLabel
{
  return self->_topmostLabel;
}

- (void)setTopmostLabel:(id)a3
{
  self->_topmostLabel = (UILabel *)a3;
}

- (UILabel)bottommostLabel
{
  return self->_bottommostLabel;
}

- (void)setBottommostLabel:(id)a3
{
  self->_bottommostLabel = (UILabel *)a3;
}

- (double)intrinsicContentHeight
{
  return self->_intrinsicContentHeight;
}

- (void)setIntrinsicContentHeight:(double)a3
{
  self->_intrinsicContentHeight = a3;
}

@end