@interface PHRecentsHeaderView
+ (id)headerViewWithFrame:(CGRect)a3 recentCall:(id)a4;
- (CGSize)intrinsicContentSize;
- (CHRecentCall)recentCall;
- (NSArray)dateLabels;
- (NSArray)summaries;
- (PHRecentsHeaderView)init;
- (PHRecentsHeaderView)initWithFrame:(CGRect)a3;
- (double)intrinsicContentHeight;
- (id)_initWithFrame:(CGRect)a3 recentCall:(id)a4;
- (id)calendar;
- (id)dateFormatter;
- (id)newSummaryViewForRecentCall:(id)a3 occurrenceDate:(id)a4 status:(unsigned int)a5 duration:(double)a6 type:(unsigned int)a7 dataUsage:(int64_t)a8;
- (id)timeFormatter;
- (void)_buildView;
- (void)addNotificationObservers;
- (void)dealloc;
- (void)formattersDidChange:(id)a3;
- (void)setDateLabels:(id)a3;
- (void)setIntrinsicContentHeight:(double)a3;
- (void)setSummaries:(id)a3;
@end

@implementation PHRecentsHeaderView

- (PHRecentsHeaderView)initWithFrame:(CGRect)a3
{
  +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"Please don't call -[PHRecentsPersonHeaderView initWithFrame:]; instead call +[PHRecentsPersonHeaderView headerViewWithFrame:recentCall:]",
    a3.origin.x,
    a3.origin.y,
    a3.size.width,
  v5 = a3.size.height);
  NSLog(@"** TUAssertion failure: %@", v5);

  if (_TUAssertShouldCrashApplication())
  {
    v6 = +[NSAssertionHandler currentHandler];
    [v6 handleFailureInMethod:a2 object:self file:@"PHRecentsHeaderView.m" lineNumber:64 description:@"Please don't call -[PHRecentsPersonHeaderView initWithFrame:]; instead call +[PHRecentsPersonHeaderView headerViewWithFrame:recentCall:]"];
  }
  return 0;
}

- (PHRecentsHeaderView)init
{
  v4 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"Please don't call -[PHRecentsPersonHeaderView init] instead call +[PHRecentsPersonHeaderView headerViewWithFrame:recentCall:]");;
  NSLog(@"** TUAssertion failure: %@", v4);

  if (_TUAssertShouldCrashApplication())
  {
    v5 = +[NSAssertionHandler currentHandler];
    [v5 handleFailureInMethod:a2 object:self file:@"PHRecentsHeaderView.m" lineNumber:69 description:@"Please don't call -[PHRecentsPersonHeaderView init]; instead call +[PHRecentsPersonHeaderView headerViewWithFrame:recentCall:]"];
  }
  return 0;
}

- (id)_initWithFrame:(CGRect)a3 recentCall:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)PHRecentsHeaderView;
  v11 = -[PHRecentsHeaderView initWithFrame:](&v14, "initWithFrame:", x, y, width, height);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_recentCall, a4);
    [(PHRecentsHeaderView *)v12 addNotificationObservers];
    [(PHRecentsHeaderView *)v12 _buildView];
  }

  return v12;
}

- (void)addNotificationObservers
{
  TUAddLocalNSObserver();
  if (!qword_1000BC278)
  {
    v2 = +[NSNotificationCenter defaultCenter];
    v3 = +[NSOperationQueue mainQueue];
    uint64_t v4 = [v2 addObserverForName:NSCurrentLocaleDidChangeNotification object:0 queue:v3 usingBlock:&stru_1000A27C0];
    v5 = (void *)qword_1000BC278;
    qword_1000BC278 = v4;
  }
  if (!qword_1000BC280)
  {
    id v9 = +[NSNotificationCenter defaultCenter];
    v6 = +[NSOperationQueue mainQueue];
    uint64_t v7 = [v9 addObserverForName:NSSystemTimeZoneDidChangeNotification object:0 queue:v6 usingBlock:&stru_1000A27C0];
    v8 = (void *)qword_1000BC280;
    qword_1000BC280 = v7;
  }
}

- (void)dealloc
{
  v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)PHRecentsHeaderView;
  [(PHRecentsHeaderView *)&v4 dealloc];
}

+ (id)headerViewWithFrame:(CGRect)a3 recentCall:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v10 = a4;
  v11 = v10;
  if (v10)
  {
    unsigned int v12 = [v10 callType];
    if ((kCHCallTypeTelephony & v12) != 0)
    {
      v13 = &off_1000A1360;
LABEL_9:
      id v18 = [objc_alloc(*v13) _initWithFrame:v11 recentCall:x, y, width, height];
      goto LABEL_11;
    }
    unsigned int v16 = [v11 callType];
    if (v16 == kCHCallTypeFaceTimeVideo
      || (unsigned int v17 = [v11 callType], v17 == kCHCallTypeFaceTimeAudio))
    {
      v13 = off_1000A1350;
      goto LABEL_9;
    }
  }
  else
  {
    objc_super v14 = +[NSString stringWithFormat:@"Initializing PHRecentsPersonHeaderView with nil recentCall not allowed"];
    NSLog(@"** TUAssertion failure: %@", v14);

    if (_TUAssertShouldCrashApplication())
    {
      v15 = +[NSAssertionHandler currentHandler];
      [v15 handleFailureInMethod:a2 object:a1 file:@"PHRecentsHeaderView.m" lineNumber:105 description:@"Initializing PHRecentsPersonHeaderView with nil recentCall not allowed"];
    }
  }
  id v18 = 0;
LABEL_11:

  return v18;
}

- (void)_buildView
{
  v113 = +[UIFont phPreferredFontForTextStyle:UIFontDescriptorTextStyleSubheadline];
  v129 = +[UIFont phPreferredFontForTextStyle:UIFontDescriptorTextStyleCaption1];
  uint64_t v3 = +[NSMutableArray array];
  v131 = +[NSMutableArray array];
  if ([UIApp userInterfaceStyle] == 1) {
    +[UIColor whiteColor];
  }
  else {
  v124 = +[UIColor blackColor];
  }
  v121 = (void *)v3;
  uint64_t v4 = kCHCallOccurrenceDateKey;
  uint64_t v5 = +[NSSortDescriptor sortDescriptorWithKey:kCHCallOccurrenceDateKey ascending:0];
  unsigned int v6 = [UIApp headerViewShowsAllRecentCalls];
  uint64_t v7 = [(PHRecentsHeaderView *)self recentCall];
  v8 = [v7 callOccurrences];
  id v9 = v8;
  if (v6)
  {
    uint64_t v143 = v5;
    id v10 = +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v143, 1, v5);
    v11 = [v9 sortedArrayUsingDescriptors:v10];
  }
  else
  {
    id v12 = [v8 count];

    v13 = [(PHRecentsHeaderView *)self recentCall];
    objc_super v14 = [v13 callOccurrences];
    uint64_t v142 = v5;
    v15 = +[NSArray arrayWithObjects:&v142 count:1];
    uint64_t v7 = [v14 sortedArrayUsingDescriptors:v15];

    id v16 = [UIApp headerViewNumberOfCallsToShow];
    if ((uint64_t)v12 >= (uint64_t)v16) {
      id v17 = v16;
    }
    else {
      id v17 = v12;
    }
    v11 = [v7 subarrayWithRange:0, v17];
  }

  long long v135 = 0u;
  long long v136 = 0u;
  long long v133 = 0u;
  long long v134 = 0u;
  id obj = v11;
  id v128 = [obj countByEnumeratingWithState:&v133 objects:v141 count:16];
  if (v128)
  {
    v122 = 0;
    uint64_t v18 = *(void *)v134;
    uint64_t v19 = kCHCallOccurrenceCallTypeKey;
    int v127 = kCHCallTypeUnknown;
    uint64_t v117 = kCHCallOccurrenceCallStatusKey;
    uint64_t v116 = kCHCallOccurrenceDurationKey;
    double v20 = 0.0;
    uint64_t v115 = kCHCallOccurrenceDataUsageKey;
    v21 = v121;
    uint64_t v119 = *(void *)v134;
    uint64_t v120 = v4;
    uint64_t v118 = kCHCallOccurrenceCallTypeKey;
    do
    {
      for (i = 0; i != v128; i = (char *)i + 1)
      {
        if (*(void *)v134 != v18) {
          objc_enumerationMutation(obj);
        }
        v23 = *(void **)(*((void *)&v133 + 1) + 8 * i);
        v24 = [v23 objectForKeyedSubscript:v4];
        v25 = [v23 objectForKeyedSubscript:v19];
        unsigned int v26 = [v25 intValue];

        unsigned int v132 = v26;
        if (v24) {
          BOOL v27 = v26 == v127;
        }
        else {
          BOOL v27 = 1;
        }
        if (!v27)
        {
          v28 = [v23 objectForKeyedSubscript:v117];
          unsigned int v29 = [v28 intValue];

          v30 = [v23 objectForKeyedSubscript:v116];
          [v30 doubleValue];
          double v32 = v31;

          v33 = [v23 objectForKeyedSubscript:v115];
          id v34 = [v33 integerValue];

          v35 = [(PHRecentsHeaderView *)self calendar];
          v36 = [v35 components:28 fromDate:v24];

          v130 = v24;
          v126 = v36;
          id v125 = v34;
          if (!v36 || v122 && ([v36 isEqual:v122] & 1) != 0)
          {
            v37 = &CNActionTypeMail_ptr;
          }
          else
          {
            id v114 = v36;

            id v38 = objc_alloc_init((Class)UILabel);
            [v38 setFont:v113];
            [v38 setTextColor:v124];
            v39 = [(PHRecentsHeaderView *)self dateFormatter];
            v40 = [v39 stringFromDate:v24];
            [v38 setText:v40];

            [v38 setTextAlignment:4];
            [v38 intrinsicContentSize];
            double v42 = v41;
            [(PHRecentsHeaderView *)self addSubview:v38];
            [v38 setTranslatesAutoresizingMaskIntoConstraints:0];
            LODWORD(v43) = 1148846080;
            [v38 setContentCompressionResistancePriority:0 forAxis:v43];
            LODWORD(v44) = 1148846080;
            [v38 setContentCompressionResistancePriority:1 forAxis:v44];
            LODWORD(v45) = 1148846080;
            [v38 setContentHuggingPriority:0 forAxis:v45];
            LODWORD(v46) = 1148846080;
            [v38 setContentHuggingPriority:1 forAxis:v46];
            CFStringRef v139 = @"Header";
            id v140 = v38;
            v47 = +[NSDictionary dictionaryWithObjects:&v140 forKeys:&v139 count:1];
            v48 = +[NSLayoutConstraint constraintsWithVisualFormat:options:metrics:views:](NSLayoutConstraint, "constraintsWithVisualFormat:options:metrics:views:", @"|-0@1000-[Header]-0@1000-|", 0, 0, v47);
            [(PHRecentsHeaderView *)self addConstraints:v48];

            if ([v21 count])
            {
              v49 = [v131 objectAtIndexedSubscript:[v131 count] - 1];
              [v129 _bodyLeading];
              LODWORD(v51) = 1148846080;
              v52 = +[NSLayoutConstraint constraintWithItem:v38 attribute:3 relatedBy:0 toItem:v49 attribute:11 multiplier:1.0 constant:v50 * 0.75 priority:v51];
              [(PHRecentsHeaderView *)self addConstraint:v52];

              [v129 _bodyLeading];
              double v54 = v53;
              [v38 _baselineOffsetFromBottom];
              double v56 = -(v55 - v54 * 0.75);
            }
            else
            {
              [v113 ascender];
              double v58 = v57;
              [v113 capHeight];
              LODWORD(v60) = 1148846080;
              v61 = +[NSLayoutConstraint constraintWithItem:v38 attribute:3 relatedBy:0 toItem:self attribute:3 multiplier:1.0 constant:v59 - v58 + 16.0 priority:v60];
              [(PHRecentsHeaderView *)self addConstraint:v61];

              [v113 ascender];
              double v63 = v62;
              [v113 capHeight];
              double v56 = v64 - v63 + 16.0;
            }
            double v20 = v20 + v42 + v56;
            [v21 addObject:v38];
            v65 = +[NSNull null];
            [v131 addObject:v65];

            v122 = v114;
            v37 = &CNActionTypeMail_ptr;
            v24 = v130;
          }
          id v66 = objc_alloc_init((Class)UILabel);
          [v66 setFont:v129];
          [v66 setTextColor:v124];
          v67 = [(PHRecentsHeaderView *)self timeFormatter];
          v68 = [v67 stringFromDate:v24];
          [v66 setText:v68];

          [(PHRecentsHeaderView *)self addSubview:v66];
          [v66 setTextAlignment:4];
          [v66 setTranslatesAutoresizingMaskIntoConstraints:0];
          LODWORD(v69) = 1144750080;
          [v66 setContentCompressionResistancePriority:0 forAxis:v69];
          LODWORD(v70) = 1148846080;
          [v66 setContentCompressionResistancePriority:1 forAxis:v70];
          LODWORD(v71) = 1148846080;
          [v66 setContentHuggingPriority:1 forAxis:v71];
          v72 = v37[75];
          v73 = [v21 objectAtIndexedSubscript:(char *)[v21 count] - 1];
          [v129 _bodyLeading];
          double v75 = v74 * 0.75;
          [v131 objectAtIndexedSubscript:[v131 count] - 1];
          v77 = v76 = v21;
          v78 = +[NSNull null];
          if (v77 == v78) {
            *(float *)&double v79 = 1000.0;
          }
          else {
            *(float *)&double v79 = 750.0;
          }
          v80 = [v72 constraintWithItem:v66 attribute:3 relatedBy:0 toItem:v73 attribute:11 multiplier:1.0 constant:v75 priority:v79];
          [(PHRecentsHeaderView *)self addConstraint:v80];

          v81 = [v131 objectAtIndexedSubscript:[v131 count] - 1];
          v82 = +[NSNull null];

          if (v81 == v82)
          {
            [v129 _bodyLeading];
            double v95 = v94;
            v90 = [v76 objectAtIndexedSubscript:(char *)[v76 count] - 1];
            [v90 _baselineOffsetFromBottom];
            double v93 = -(v96 - v95 * 0.75);
          }
          else
          {
            v83 = [v131 objectAtIndexedSubscript:((char *)[v131 count]) - 1];
            v84 = [v83 bottommostLabel];
            [v129 _bodyLeading];
            LODWORD(v86) = 1148846080;
            v87 = +[NSLayoutConstraint constraintWithItem:v66 attribute:3 relatedBy:0 toItem:v84 attribute:11 multiplier:1.0 constant:v85 * 0.75 priority:v86];
            [(PHRecentsHeaderView *)self addConstraint:v87];

            [v129 _bodyLeading];
            double v89 = v88;
            v90 = [v131 objectAtIndexedSubscript:[v131 count] - 1];
            v91 = [v90 bottommostLabel];
            [v91 _baselineOffsetFromBottom];
            double v93 = -(v92 - v89 * 0.75);
          }
          uint64_t v4 = v120;

          v97 = [(PHRecentsHeaderView *)self recentCall];
          v24 = v130;
          id v98 = [(PHRecentsHeaderView *)self newSummaryViewForRecentCall:v97 occurrenceDate:v130 status:v29 duration:v132 type:v125 dataUsage:v32];

          [(PHRecentsHeaderView *)self addSubview:v98];
          [v98 setTranslatesAutoresizingMaskIntoConstraints:0];
          LODWORD(v99) = 1144750080;
          [v98 setContentCompressionResistancePriority:0 forAxis:v99];
          LODWORD(v100) = 1148846080;
          [v98 setContentCompressionResistancePriority:1 forAxis:v100];
          LODWORD(v101) = 1148846080;
          [v98 setContentHuggingPriority:0 forAxis:v101];
          LODWORD(v102) = 1148846080;
          [v98 setContentHuggingPriority:1 forAxis:v102];
          v137[0] = @"Time";
          v137[1] = @"Summary";
          v138[0] = v66;
          v138[1] = v98;
          v103 = +[NSDictionary dictionaryWithObjects:v138 forKeys:v137 count:2];
          v104 = +[NSLayoutConstraint constraintsWithVisualFormat:options:metrics:views:](NSLayoutConstraint, "constraintsWithVisualFormat:options:metrics:views:", @"|-0@1000-[Time(==90@1000)]-3@1000-[Summary]-15@1000-|", 0, 0, v103);
          [(PHRecentsHeaderView *)self addConstraints:v104];

          v105 = [v98 topmostLabel];
          LODWORD(v106) = 1148846080;
          v107 = +[NSLayoutConstraint constraintWithItem:v105 attribute:11 relatedBy:0 toItem:v66 attribute:11 multiplier:1.0 constant:0.0 priority:v106];
          [(PHRecentsHeaderView *)self addConstraint:v107];

          [v98 intrinsicContentSize];
          double v20 = v20 + v93 + v108;
          [v131 addObject:v98];

          v21 = v121;
          uint64_t v19 = v118;
          uint64_t v18 = v119;
        }
      }
      id v128 = [obj countByEnumeratingWithState:&v133 objects:v141 count:16];
    }
    while (v128);
  }
  else
  {
    v122 = 0;
    double v20 = 0.0;
    v21 = v121;
  }

  if ([v131 count])
  {
    v109 = [v131 objectAtIndexedSubscript:[v131 count] - 1];
    v110 = [v109 bottommostLabel];
    [v110 _baselineOffsetFromBottom];
    double v20 = v20 + 16.0 - v111;
  }
  [(PHRecentsHeaderView *)self setIntrinsicContentHeight:v20];
  [(PHRecentsHeaderView *)self setDateLabels:v21];
  [(PHRecentsHeaderView *)self setSummaries:v131];
}

- (CGSize)intrinsicContentSize
{
  [(PHRecentsHeaderView *)self intrinsicContentHeight];
  double v3 = v2;
  double v4 = 285.0;
  result.double height = v3;
  result.double width = v4;
  return result;
}

- (id)calendar
{
  double v2 = (void *)qword_1000BC288;
  if (!qword_1000BC288)
  {
    uint64_t v3 = +[NSCalendar currentCalendar];
    double v4 = (void *)qword_1000BC288;
    qword_1000BC288 = v3;

    double v2 = (void *)qword_1000BC288;
  }

  return v2;
}

- (id)dateFormatter
{
  double v2 = (void *)qword_1000BC290;
  if (!qword_1000BC290)
  {
    id v3 = objc_alloc_init((Class)NSDateFormatter);
    double v4 = (void *)qword_1000BC290;
    qword_1000BC290 = (uint64_t)v3;

    [(id)qword_1000BC290 setDateStyle:3];
    [(id)qword_1000BC290 setDoesRelativeDateFormatting:1];
    [(id)qword_1000BC290 setTimeStyle:0];
    double v2 = (void *)qword_1000BC290;
  }

  return v2;
}

- (id)timeFormatter
{
  double v2 = (void *)qword_1000BC298;
  if (!qword_1000BC298)
  {
    id v3 = objc_alloc_init((Class)NSDateFormatter);
    double v4 = (void *)qword_1000BC298;
    qword_1000BC298 = (uint64_t)v3;

    [(id)qword_1000BC298 setDateStyle:0];
    [(id)qword_1000BC298 setTimeStyle:1];
    double v2 = (void *)qword_1000BC298;
  }

  return v2;
}

- (void)formattersDidChange:(id)a3
{
  double v4 = [(PHRecentsHeaderView *)self subviews];
  [v4 makeObjectsPerformSelector:"removeFromSuperview"];

  [(PHRecentsHeaderView *)self _buildView];
}

- (CHRecentCall)recentCall
{
  return (CHRecentCall *)objc_getProperty(self, a2, 8, 1);
}

- (NSArray)dateLabels
{
  return (NSArray *)objc_getProperty(self, a2, 16, 1);
}

- (void)setDateLabels:(id)a3
{
}

- (NSArray)summaries
{
  return (NSArray *)objc_getProperty(self, a2, 24, 1);
}

- (void)setSummaries:(id)a3
{
}

- (double)intrinsicContentHeight
{
  return self->_intrinsicContentHeight;
}

- (void)setIntrinsicContentHeight:(double)a3
{
  self->_intrinsicContentHeight = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_summaries, 0);
  objc_storeStrong((id *)&self->_dateLabels, 0);

  objc_storeStrong((id *)&self->_recentCall, 0);
}

- (id)newSummaryViewForRecentCall:(id)a3 occurrenceDate:(id)a4 status:(unsigned int)a5 duration:(double)a6 type:(unsigned int)a7 dataUsage:(int64_t)a8
{
  id v10 = +[NSString stringWithFormat:@"Subclasses of PHRecentsPersonHeaderView must implement _createSummaryViewAtIndex:size:", a4, *(void *)&a5, *(void *)&a7, a8, a6];
  NSLog(@"** TUAssertion failure: %@", v10);

  if (_TUAssertShouldCrashApplication())
  {
    v11 = +[NSAssertionHandler currentHandler];
    [v11 handleFailureInMethod:a2 object:self file:@"PHRecentsHeaderView.m" lineNumber:340 description:@"Subclasses of PHRecentsPersonHeaderView must implement _createSummaryViewAtIndex:size:"];
  }
  return 0;
}

@end