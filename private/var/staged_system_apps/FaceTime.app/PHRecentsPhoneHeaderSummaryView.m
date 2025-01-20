@interface PHRecentsPhoneHeaderSummaryView
- (CGSize)intrinsicContentSize;
- (PHRecentsPhoneHeaderSummaryView)initWithFrame:(CGRect)a3 recentCall:(id)a4 occurrenceDate:(id)a5 status:(unsigned int)a6 duration:(double)a7 type:(unsigned int)a8;
- (UILabel)bottommostLabel;
- (UILabel)topmostLabel;
- (double)intrinsicContentHeight;
- (void)setBottommostLabel:(id)a3;
- (void)setIntrinsicContentHeight:(double)a3;
- (void)setTopmostLabel:(id)a3;
@end

@implementation PHRecentsPhoneHeaderSummaryView

- (PHRecentsPhoneHeaderSummaryView)initWithFrame:(CGRect)a3 recentCall:(id)a4 occurrenceDate:(id)a5 status:(unsigned int)a6 duration:(double)a7 type:(unsigned int)a8
{
  uint64_t v8 = *(void *)&a8;
  v53.receiver = self;
  v53.super_class = (Class)PHRecentsPhoneHeaderSummaryView;
  v12 = -[PHRecentsPhoneHeaderSummaryView initWithFrame:](&v53, "initWithFrame:", a4, a5, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (!v12) {
    return v12;
  }
  if ([UIApp userInterfaceStyle] == 1) {
    +[UIColor whiteColor];
  }
  else {
  v13 = +[UIColor blackColor];
  }
  id v14 = objc_alloc((Class)UILabel);
  double y = CGRectZero.origin.y;
  double width = CGRectZero.size.width;
  double height = CGRectZero.size.height;
  id v18 = [v14 initWithFrame:CGRectZero.origin.x, y, width, height];
  uint64_t v19 = UIFontDescriptorTextStyleCaption1;
  v20 = +[UIFont phPreferredBoldFontForTextStyle:UIFontDescriptorTextStyleCaption1];
  [v18 setFont:v20];

  [v18 setTextColor:v13];
  [(PHRecentsPhoneHeaderSummaryView *)v12 addSubview:v18];
  [v18 setTranslatesAutoresizingMaskIntoConstraints:0];
  LODWORD(v21) = 1144750080;
  [v18 setContentCompressionResistancePriority:0 forAxis:v21];
  LODWORD(v22) = 1148846080;
  [v18 setContentCompressionResistancePriority:1 forAxis:v22];
  LODWORD(v23) = 1132068864;
  [v18 setContentHuggingPriority:0 forAxis:v23];
  LODWORD(v24) = 1148846080;
  [v18 setContentHuggingPriority:1 forAxis:v24];
  if (kCHCallStatusMissed == a6)
  {
    v25 = +[NSBundle mainBundle];
    v26 = v25;
    CFStringRef v27 = @"MISSED";
LABEL_11:
    v28 = [v25 localizedStringForKey:v27 value:&stru_1000A3488 table:@"Recents"];
    char v29 = 0;
    goto LABEL_12;
  }
  if (kCHCallStatusCancelled == a6)
  {
    v25 = +[NSBundle mainBundle];
    v26 = v25;
    CFStringRef v27 = @"CANCELLED";
    goto LABEL_11;
  }
  if (kCHCallStatusAnsweredElsewhere == a6)
  {
    v25 = +[NSBundle mainBundle];
    v26 = v25;
    CFStringRef v27 = @"ANSWERED_ELSEWHERE";
    goto LABEL_11;
  }
  if (kCHCallStatusConnectedOutgoing == a6)
  {
    v51 = +[NSBundle mainBundle];
    v26 = v51;
    CFStringRef v52 = @"OUTGOING";
LABEL_30:
    v28 = [v51 localizedStringForKey:v52 value:&stru_1000A3488 table:@"Recents"];
    char v29 = 1;
LABEL_12:

    if (v28) {
      goto LABEL_16;
    }
    goto LABEL_13;
  }
  if (kCHCallStatusConnectedIncoming == a6)
  {
    v51 = +[NSBundle mainBundle];
    v26 = v51;
    CFStringRef v52 = @"INCOMING";
    goto LABEL_30;
  }
  char v29 = 0;
LABEL_13:
  v30 = +[NSString stringWithFormat:@"Unable to generate type string for recent call type %d", v8];
  NSLog(@"** TUAssertion failure: %@", v30);

  if (_TUAssertShouldCrashApplication())
  {
    v31 = +[NSAssertionHandler currentHandler];
    [v31 handleFailureInMethod:a2 object:v12 file:@"PHRecentsPhoneHeaderView.m" lineNumber:101 description:@"Unable to generate type string for recent call type %d" v8];
  }
  v28 = 0;
LABEL_16:
  [v18 setText:v28];
  [v18 intrinsicContentSize];
  double v33 = v32;
  if ((v29 & 1) == 0)
  {
    CFStringRef v54 = @"Type";
    CFStringRef v55 = @"Duration";
    v56[0] = v18;
    goto LABEL_20;
  }
  id v34 = [objc_alloc((Class)UILabel) initWithFrame:CGRectZero.origin.x, y, width, height];
  v35 = +[UIFont phPreferredFontForTextStyle:v19];
  [v34 setFont:v35];

  [v34 setTextColor:v13];
  v36 = sub_1000467A8(a7);
  [v34 setText:v36];

  [(PHRecentsPhoneHeaderSummaryView *)v12 addSubview:v34];
  [v34 setTranslatesAutoresizingMaskIntoConstraints:0];
  LODWORD(v37) = 1148846080;
  [v34 setContentCompressionResistancePriority:0 forAxis:v37];
  LODWORD(v38) = 1148846080;
  [v34 setContentCompressionResistancePriority:1 forAxis:v38];
  LODWORD(v39) = 1148846080;
  [v34 setContentHuggingPriority:0 forAxis:v39];
  LODWORD(v40) = 1148846080;
  [v34 setContentHuggingPriority:1 forAxis:v40];
  CFStringRef v54 = @"Type";
  CFStringRef v55 = @"Duration";
  v56[0] = v18;
  if (!v34)
  {
LABEL_20:
    v42 = +[NSNull null];
    id v34 = 0;
    int v41 = 1;
    goto LABEL_21;
  }
  int v41 = 0;
  v42 = v34;
LABEL_21:
  v56[1] = v42;
  v43 = +[NSDictionary dictionaryWithObjects:v56 forKeys:&v54 count:2];
  if (v41)
  {

    v44 = +[NSLayoutConstraint constraintsWithVisualFormat:options:metrics:views:](NSLayoutConstraint, "constraintsWithVisualFormat:options:metrics:views:", @"V:|-0@1000-[Type]-0@1000-|", 0, 0, v43);
    [(PHRecentsPhoneHeaderSummaryView *)v12 addConstraints:v44];
    CFStringRef v45 = @"|-0@1000-[Type]->=0@999-|";
  }
  else
  {
    v46 = +[NSLayoutConstraint constraintsWithVisualFormat:options:metrics:views:](NSLayoutConstraint, "constraintsWithVisualFormat:options:metrics:views:", @"V:|-0@1000-[Type]-0@1000-|", 0, 0, v43);
    [(PHRecentsPhoneHeaderSummaryView *)v12 addConstraints:v46];

    v47 = +[NSLayoutConstraint constraintsWithVisualFormat:options:metrics:views:](NSLayoutConstraint, "constraintsWithVisualFormat:options:metrics:views:", @"V:|-0@500-[Duration]-0@500-|", 0, 0, v43);
    [(PHRecentsPhoneHeaderSummaryView *)v12 addConstraints:v47];

    LODWORD(v48) = 1148846080;
    v44 = +[NSLayoutConstraint constraintWithItem:v34 attribute:11 relatedBy:0 toItem:v18 attribute:11 multiplier:1.0 constant:0.0 priority:v48];
    [(PHRecentsPhoneHeaderSummaryView *)v12 addConstraint:v44];
    CFStringRef v45 = @"|-0@1000-[Type]->=0@999-[Duration]-0@1000-|";
  }

  v49 = +[NSLayoutConstraint constraintsWithVisualFormat:v45 options:0 metrics:0 views:v43];
  [(PHRecentsPhoneHeaderSummaryView *)v12 addConstraints:v49];

  [(PHRecentsPhoneHeaderSummaryView *)v12 setTopmostLabel:v18];
  [(PHRecentsPhoneHeaderSummaryView *)v12 setBottommostLabel:v18];
  [(PHRecentsPhoneHeaderSummaryView *)v12 setIntrinsicContentHeight:v33 + 0.0];

  return v12;
}

- (CGSize)intrinsicContentSize
{
  [(PHRecentsPhoneHeaderSummaryView *)self intrinsicContentHeight];
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