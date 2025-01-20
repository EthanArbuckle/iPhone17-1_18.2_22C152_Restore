@interface MonthDayTransitionView
+ (Class)monthDayNavigationTransitionViewClass;
- (BOOL)animating;
- (BOOL)dividedMonthView;
- (CGPoint)dayViewDayLocation;
- (CGPoint)dayViewMonthLocation;
- (CGRect)dayScrubberFrame;
- (CGRect)monthScrubberFrame;
- (CGRect)weekDayInitialsDay;
- (CGRect)weekDayInitialsMonth;
- (CGSize)dayCellSize;
- (CompactWidthMonthViewController)monthViewController;
- (MonthDayNavigationTransitionView)scrubber;
- (MonthDayTransitionView)initWithFrame:(CGRect)a3;
- (NSDate)selectedDate;
- (PaletteView)paletteView;
- (UIView)allDayView;
- (UIView)bottomView;
- (UIView)topLabelsContainer;
- (UIView)topView;
- (double)_topExtensionHeight;
- (double)animationDuration;
- (id)_animateView:(id)a3 toPosition:(CGPoint)a4 setDelegate:(BOOL)a5;
- (id)completion;
- (void)_animateView:(id)a3 toAlpha:(double)a4 delay:(double)a5;
- (void)_animateView:(id)a3 toPosition:(CGPoint)a4;
- (void)_basicAnimateView:(id)a3 toAlpha:(double)a4 duration:(double)a5;
- (void)_createViews;
- (void)_haltAnimations;
- (void)animateToDayWithCompletion:(id)a3;
- (void)animateToMonthWithCompletion:(id)a3;
- (void)animationDidStop:(id)a3 finished:(BOOL)a4;
- (void)prepareTransitionScrubberWithSelectedDate:(id)a3 todayDate:(id)a4 dayViewController:(id)a5 monthViewController:(id)a6 paletteView:(id)a7 reverse:(BOOL)a8;
- (void)prepareTransitionWithTopView:(id)a3 bottomView:(id)a4 allDayView:(id)a5 topLabelsContainer:(id)a6;
- (void)setAllDayView:(id)a3;
- (void)setAnimating:(BOOL)a3;
- (void)setBottomView:(id)a3;
- (void)setCompletion:(id)a3;
- (void)setDayCellSize:(CGSize)a3;
- (void)setDayScrubberFrame:(CGRect)a3;
- (void)setDayViewDayLocation:(CGPoint)a3;
- (void)setDayViewMonthLocation:(CGPoint)a3;
- (void)setDividedMonthView:(BOOL)a3;
- (void)setMonthScrubberFrame:(CGRect)a3;
- (void)setMonthViewController:(id)a3;
- (void)setPaletteView:(id)a3;
- (void)setScrubber:(id)a3;
- (void)setSelectedDate:(id)a3;
- (void)setTopLabelsContainer:(id)a3;
- (void)setTopView:(id)a3;
- (void)setWeekDayInitialsDay:(CGRect)a3;
- (void)setWeekDayInitialsMonth:(CGRect)a3;
@end

@implementation MonthDayTransitionView

+ (Class)monthDayNavigationTransitionViewClass
{
  return (Class)objc_opt_class();
}

- (MonthDayTransitionView)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)MonthDayTransitionView;
  v3 = -[MonthDayTransitionView initWithFrame:](&v6, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3) {
    [(MonthDayTransitionView *)v3 _createViews];
  }
  return v4;
}

- (void)_createViews
{
  v3 = +[UIColor clearColor];
  [(MonthDayTransitionView *)self setBackgroundColor:v3];

  id v4 = objc_alloc_init((Class)[(id)objc_opt_class() monthDayNavigationTransitionViewClass]);
  [(MonthDayTransitionView *)self setScrubber:v4];

  UIAnimationDragCoefficient();
  BOOL v6 = v5 > 1.5;
  v7 = [(MonthDayTransitionView *)self scrubber];
  [v7 setDebug:v6];

  id v8 = [(MonthDayTransitionView *)self scrubber];
  [v8 setHidden:1];
}

- (CGRect)weekDayInitialsDay
{
  double x = self->_weekDayInitialsDay.origin.x;
  double y = self->_weekDayInitialsDay.origin.y;
  double width = self->_weekDayInitialsDay.size.width;
  double height = self->_weekDayInitialsDay.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setWeekDayInitialsDay:(CGRect)a3
{
  self->_weekDayInitialsDadouble y = a3;
}

- (CGRect)weekDayInitialsMonth
{
  double x = self->_weekDayInitialsMonth.origin.x;
  double y = self->_weekDayInitialsMonth.origin.y;
  double width = self->_weekDayInitialsMonth.size.width;
  double height = self->_weekDayInitialsMonth.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setWeekDayInitialsMonth:(CGRect)a3
{
  self->_weekDayInitialsMonth = a3;
}

- (double)animationDuration
{
  UIAnimationDragCoefficient();
  return dbl_1001C14C0[v2 > 1.5];
}

- (void)prepareTransitionWithTopView:(id)a3 bottomView:(id)a4 allDayView:(id)a5 topLabelsContainer:(id)a6
{
  v10 = (UIView *)a5;
  v11 = (UIView *)a6;
  id v12 = a4;
  [(MonthDayTransitionView *)self setTopView:a3];
  [(MonthDayTransitionView *)self setBottomView:v12];

  allDayView = self->_allDayView;
  self->_allDayView = v10;
  v15 = v10;

  topLabelsContainer = self->_topLabelsContainer;
  self->_topLabelsContainer = v11;
}

- (void)prepareTransitionScrubberWithSelectedDate:(id)a3 todayDate:(id)a4 dayViewController:(id)a5 monthViewController:(id)a6 paletteView:(id)a7 reverse:(BOOL)a8
{
  BOOL v242 = a8;
  id v13 = a3;
  id v251 = a4;
  id v14 = a5;
  id v15 = a6;
  id v232 = a7;
  id v16 = a7;
  [(MonthDayTransitionView *)self setSelectedDate:v13];
  objc_storeStrong((id *)&self->_monthViewController, a6);
  v17 = [v14 dayScrubberController];
  v18 = [v17 view];
  [v18 layoutIfNeeded];

  v19 = [v14 dayScrubberController];
  v20 = [v19 weekScrollView];
  [v20 frame];
  double v236 = v21;

  v22 = [v14 dayScrubberController];
  v23 = [v22 weekScrollView];
  [v23 cellSize];
  double v237 = v24;
  double v249 = v25;

  v26 = [v14 view];
  v27 = [v14 dayScrubberController];
  v28 = [v27 view];
  [v28 frame];
  v244 = v16;
  [v26 convertRect:v16 fromView:];
  double v30 = v29;
  double v32 = v31;
  double v34 = v33;
  double v36 = v35;

  v37 = [v14 view];
  -[MonthDayTransitionView convertRect:fromView:](self, "convertRect:fromView:", v37, v30, v32, v34, v36);
  double v230 = v39;
  double v231 = v38;
  double v228 = v41;
  double v229 = v40;

  v243 = [v15 cellFramesForWeekContainingDate:v13];
  [v15 frameForWeekContainingDate:v13];
  double v43 = v42;
  double v45 = v44;
  double v47 = v46;
  double v49 = v48;
  v50 = [v15 view];
  -[MonthDayTransitionView convertRect:fromView:](self, "convertRect:fromView:", v50, v43, v45, v47, v49);
  double v52 = v51;
  double v54 = v53;
  double v56 = v55;
  double v227 = v57;

  id v245 = v14;
  v58 = [v14 dayScrubberController];
  v59 = [v58 weekScrollView];
  v60 = (char *)[v59 firstVisibleDayOffsetFromSelectedDay];

  uint64_t v61 = (uint64_t)(v60 + 6);
  v62 = CUIKCalendar();
  id v63 = objc_alloc_init((Class)NSDateComponents);
  [v63 setHour:1];
  v241 = [v62 dateByAddingComponents:v63 toDate:v13 options:0];
  v240 = [v62 components:512];
  id v64 = [v240 weekday];
  uint64_t v65 = CUIKZeroIndexedWeekStart();
  int IsLeftToRight = CalTimeDirectionIsLeftToRight();
  uint64_t v67 = v65 - (void)v64 - 6;
  if (!IsLeftToRight) {
    uint64_t v67 = (uint64_t)v64 - v65 + 6;
  }
  uint64_t v68 = v67 % 7;
  uint64_t v69 = (7 - (uint64_t)v64) % 7;
  v71 = &v60[-v68];
  BOOL v70 = (uint64_t)v60 < v68;
  if ((uint64_t)v60 >= v68) {
    uint64_t v72 = v68;
  }
  else {
    uint64_t v72 = (uint64_t)v60;
  }
  if ((uint64_t)v60 >= v68) {
    uint64_t v73 = 0;
  }
  else {
    uint64_t v73 = v68 - (void)v60;
  }
  uint64_t v262 = v73;
  if (v70) {
    v74 = 0;
  }
  else {
    v74 = v71;
  }
  v234 = v74;
  if (v61 <= v69) {
    uint64_t v61 = v69;
  }
  id v75 = objc_alloc_init((Class)NSDateComponents);
  if (CalTimeDirectionIsLeftToRight()) {
    uint64_t v76 = v72;
  }
  else {
    uint64_t v76 = -v72;
  }
  [v75 setDay:v76];
  v239 = v75;
  id v77 = v13;
  v78 = [v62 dateByAddingComponents:v75 toDate:v13 options:0];
  v261 = v62;
  v250 = v63;
  uint64_t v79 = [v62 dateByAddingComponents:v63 toDate:v78 options:0];

  if (v72 >= 0) {
    uint64_t v80 = v72;
  }
  else {
    uint64_t v80 = -v72;
  }
  if (v61 < 0) {
    uint64_t v61 = -v61;
  }
  id v267 = [objc_alloc((Class)NSMutableArray) initWithCapacity:v80 + v61 + 1];
  v259 = CUIKGetOverlayCalendar();
  if (v259) {
    id v266 = [objc_alloc((Class)NSMutableArray) initWithCapacity:v80 + v61 + 1];
  }
  else {
    id v266 = 0;
  }
  uint64_t v81 = [v62 components:542 fromDate:v79];
  v252 = v77;
  v248 = [v62 components:542 fromDate:v77];
  v265 = [v62 dateFromComponents:];
  v255 = v15;
  v257 = self;
  v238 = (void *)v79;
  if (v251)
  {
    v247 = [v62 components:542];
    v264 = [v62 dateFromComponents:];
  }
  else
  {
    v264 = 0;
    v247 = 0;
  }
  v82 = v62;
  v235 = (void *)v81;
  v83 = [v62 dateFromComponents:v81];
  uint64_t v84 = [v62 dateByAddingComponents:v250 toDate:v83 options:0];

  id v85 = objc_alloc_init((Class)NSDateComponents);
  [v85 setHour:0];
  if (CalTimeDirectionIsLeftToRight()) {
    uint64_t v86 = 1;
  }
  else {
    uint64_t v86 = -1;
  }
  v263 = v85;
  [v85 setDay:v86];
  id v260 = [objc_alloc((Class)NSMutableArray) initWithCapacity:v80 + v61 + 1];
  v258 = 0;
  v87 = 0;
  uint64_t v88 = 0;
  uint64_t v89 = v61 + v80;
  uint64_t v90 = v84;
  uint64_t v91 = v89 + 1;
  double v92 = 0.0;
  uint64_t v271 = -1;
  uint64_t v268 = -1;
  uint64_t v269 = -1;
  uint64_t v256 = -1;
  do
  {
    v93 = v87;
    v94 = (void *)v90;
    v270 = [v82 components:542 fromDate:v90];
    [v270 day];
    v95 = CUIKLocalizedStringForInteger();
    [v267 addObject:v95];

    if (v266)
    {
      v96 = +[CUIKDateStrings overlayShortStringForDate:v90 inCalendar:v259];
      [v266 addObject:v96];

      v97 = [v259 components:24 fromDate:v90];
      v87 = v270;
      if ([v97 day] == (id)1)
      {
        if ([v97 month] == (id)1 && (objc_msgSend(v97, "isLeapMonth") & 1) == 0)
        {
          v100 = [(MonthDayTransitionView *)self traitCollection];
          int v101 = EKUIUsesLargeTextLayout();

          if (v101) {
            double v92 = 3.0;
          }
          else {
            double v92 = 1.5;
          }
        }
        else
        {
          v98 = [(MonthDayTransitionView *)self traitCollection];
          int v99 = EKUIUsesLargeTextLayout();

          if (v99) {
            double v92 = 2.0;
          }
          else {
            double v92 = 1.0;
          }
        }
        uint64_t v256 = v88;
        v82 = v62;
      }
    }
    else
    {
      v87 = v270;
    }
    if ([v87 weekday] == (id)1 || objc_msgSend(v87, "weekday") == (id)7)
    {
      v102 = +[NSNumber numberWithInteger:v88];
      [v260 addObject:v102];
    }
    if (v93)
    {
      id v103 = [v87 month];
      id v104 = [v93 month];
      uint64_t v105 = v269;
      if (v103 != v104) {
        uint64_t v105 = v88 - 1;
      }
      uint64_t v269 = v105;
    }
    v106 = [v82 dateFromComponents:v87];
    unsigned int v107 = [v106 isEqualToDate:v265];
    uint64_t v108 = v271;
    if (v107) {
      uint64_t v108 = v88;
    }
    uint64_t v271 = v108;
    if (v264)
    {
      unsigned int v109 = [v106 isEqualToDate:];
      uint64_t v110 = v268;
      if (v109) {
        uint64_t v110 = v88;
      }
      uint64_t v268 = v110;
    }
    if (v262 == v88)
    {
      v111 = +[CUIKPreferences sharedPreferences];
      unsigned int v112 = [v111 showWeekNumbers];

      if (v112)
      {
        v82 = v62;
        [v62 component:0x2000 fromDate:v94];
        uint64_t v113 = CUIKLocalizedStringForInteger();

        v258 = (void *)v113;
      }
      else
      {
        v82 = v62;
      }
    }
    uint64_t v90 = [v82 dateByAddingComponents:v263 toDate:v94 options:0];

    ++v88;
  }
  while (v91 != v88);
  v114 = [v82 timeZone];
  uint64_t v115 = +[EKCalendarDate calendarDateWithDate:v252 timeZone:v114];

  v116 = v255;
  v226 = (void *)v115;
  uint64_t v117 = [v255 subviewForDate:v115];
  objc_opt_class();
  v225 = (void *)v117;
  if (objc_opt_isKindOfClass()) {
    v118 = (void *)v117;
  }
  else {
    v118 = 0;
  }
  id v119 = v118;
  v120 = [v119 visibleDaySummaryViews];
  v121 = v245;
  v273 = v119;
  v224 = v120;
  if (v119)
  {
    v122 = v120;
    uint64_t v253 = v90;
    if (v120)
    {
      v123 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v120 count]);
      v124 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v122 count]);
      long long v274 = 0u;
      long long v275 = 0u;
      long long v276 = 0u;
      long long v277 = 0u;
      id obj = v122;
      id v125 = [obj countByEnumeratingWithState:&v274 objects:v278 count:16];
      if (v125)
      {
        id v126 = v125;
        uint64_t v127 = *(void *)v275;
        do
        {
          for (i = 0; i != v126; i = (char *)i + 1)
          {
            if (*(void *)v275 != v127) {
              objc_enumerationMutation(obj);
            }
            v129 = *(void **)(*((void *)&v274 + 1) + 8 * i);
            v130 = captureImageFromView();
            id v131 = [objc_alloc((Class)UIImageView) initWithImage:v130];
            [v129 bounds];
            [v273 convertRect:v129 fromView:];
            double v133 = v132;
            double v135 = v134;
            double v137 = v136;
            double v139 = v138;
            [v131 setFrame:];
            if ([v273 containsFirstDayOfMonth])
            {
              +[CompactMonthWeekView headerHeight];
              double v135 = v135 - v140;
            }
            [v123 addObject:v131];
            v141 = +[NSValue valueWithCGRect:](NSValue, "valueWithCGRect:", v133, v135, v137, v139);
            [v124 addObject:v141];
          }
          id v126 = [obj countByEnumeratingWithState:&v274 objects:v278 count:16];
        }
        while (v126);
      }

      self = v257;
      v142 = [(MonthDayTransitionView *)v257 scrubber];
      [v142 setMonthSummarySnapshots:v123];

      v143 = [(MonthDayTransitionView *)v257 scrubber];
      [v143 setMonthSummaryFrames:v124];

      v121 = v245;
      uint64_t v90 = v253;
      v116 = v255;
    }
    else
    {
      v144 = [v119 occurrencesView];
      v145 = captureImageFromView();

      id v146 = [objc_alloc((Class)UIImageView) initWithImage:v145];
      v147 = [v119 occurrencesView];
      [v147 bounds];
      double v149 = v148;
      double v151 = v150;
      double v153 = v152;
      double v155 = v154;
      v156 = [v119 occurrencesView];
      [v119 convertRect:v156 fromView:v149 toView:v151];
      double v158 = v157;
      double v160 = v159;
      double v162 = v161;
      double v164 = v163;

      [v146 setFrame:v158, v160, v162, v164];
      if ([v119 containsFirstDayOfMonth])
      {
        +[CompactMonthWeekView headerHeight];
        double v160 = v160 - v165;
      }
      uint64_t v90 = v253;
      v166 = [(MonthDayTransitionView *)self scrubber];
      [v166 setMonthOccurrencesSnapshot:v146];

      v167 = [(MonthDayTransitionView *)self scrubber];
      [v167 setMonthOccurrencesFrame:v158, v160, v162, v164];
    }
  }
  objc_storeStrong((id *)&self->_paletteView, v232);
  -[MonthDayTransitionView setDayScrubberFrame:](self, "setDayScrubberFrame:", v231, v230, v229, v228);
  -[MonthDayTransitionView setMonthScrubberFrame:](self, "setMonthScrubberFrame:", v52, v54, v56, v227);
  -[PaletteView convertRect:fromView:](self->_paletteView, "convertRect:fromView:", self, v231, v230, v229, v228);
  double v169 = v168;
  double v171 = v170;
  double v173 = v172;
  double v175 = v174;
  -[PaletteView convertRect:fromView:](self->_paletteView, "convertRect:fromView:", self, v52, v54, v56, v227);
  id v233 = v176;
  double v178 = v177;
  double v246 = v179;
  double v181 = v180;
  v182 = [(PaletteView *)self->_paletteView window];

  if (!v182)
  {
    v183 = [v116 navigationController];
    v184 = [v183 navigationBar];
    [v184 frame];
    double v186 = v185;

    double v178 = v178 - v186;
  }
  v254 = (void *)v90;
  paletteView = self->_paletteView;
  v188 = [(MonthDayTransitionView *)self scrubber];
  [(PaletteView *)paletteView addSubview:v188];

  v189 = [(MonthDayTransitionView *)self scrubber];
  [v189 setDayCellSize:v237, v249];

  v190 = [(MonthDayTransitionView *)self scrubber];
  [v190 setSelectedIndex:v271];

  v191 = [(MonthDayTransitionView *)self scrubber];
  [v191 setTodayIndex:v268];

  id v192 = [v247 month];
  BOOL v194 = v192 == [v248 month] && v268 >= 0;
  v195 = [(MonthDayTransitionView *)self scrubber];
  [v195 setStrings:v267 overlayStrings:v266 weekNumberString:v258 todayInWeek:v194];

  if ((v256 & 0x8000000000000000) == 0)
  {
    v196 = [(MonthDayTransitionView *)self scrubber];
    [v196 setUnderlineThickness:v256 forOverlayStringAtIndex:v92];
  }
  v197 = [(MonthDayTransitionView *)self scrubber];
  [v197 setWeekendIndices:v260];

  v198 = [(MonthDayTransitionView *)self scrubber];
  v199 = [v121 dayScrubberController];
  v200 = [v199 visibleCellDayTypes];
  v201 = [v121 dayScrubberController];
  v202 = [v201 visibleCellBadgeColors];
  v203 = [v121 dayScrubberController];
  v204 = [v203 visibleCellBadgeLocales];
  [v198 setDayTypes:v200 badgeColors:v202 badgeLocales:v204];

  v205 = [(MonthDayTransitionView *)v257 scrubber];
  [v205 setDayFrame:v169, v171, v173, v175];

  v206 = [(MonthDayTransitionView *)v257 scrubber];
  [v206 setMonthFrame:*(double *)&v233, v178, v246, v181];

  v207 = [(MonthDayTransitionView *)v257 scrubber];
  [v207 setFirstDayCellInset:v236];

  v208 = [(MonthDayTransitionView *)v257 scrubber];
  [v208 setFirstDayCellIndex:v234];

  v209 = [(MonthDayTransitionView *)v257 scrubber];
  [v209 setFirstMonthCellIndex:v262];

  v210 = [(MonthDayTransitionView *)v257 scrubber];
  [v210 setMonthCellFrames:v243];

  v211 = [(MonthDayTransitionView *)v257 scrubber];
  [v211 setMonthRowHeight:v181];

  v212 = [(MonthDayTransitionView *)v257 scrubber];
  [v212 setMonthBreakIndex:v269];

  -[MonthDayTransitionView setDayCellSize:](v257, "setDayCellSize:", v237, v249);
  v213 = [(MonthDayTransitionView *)v257 scrubber];
  [v213 completeSetup];

  v214 = [(MonthDayTransitionView *)v257 bottomView];
  [v214 frame];
  v257->_dayViewDayLocation.double x = v215;
  v257->_dayViewDayLocation.double y = v216;

  [(MonthDayTransitionView *)v257 monthScrubberFrame];
  v257->_dayViewMonthLocation.double x = v218;
  v257->_dayViewMonthLocation.double y = v181 + v217;
  if (v242)
  {
    v219 = v255;
    v220 = v244;
    [v255 updatePalette:v244];
    [v244 layoutSubviews];
    v221 = [v244 dayInitialsHeaderView];
    [v221 frame];
    -[MonthDayTransitionView setWeekDayInitialsMonth:](v257, "setWeekDayInitialsMonth:");

    [v121 updatePalette:v244];
    [v244 layoutSubviews];
    v222 = [v244 dayInitialsHeaderView];
    [v222 frame];
    -[MonthDayTransitionView setWeekDayInitialsDay:](v257, "setWeekDayInitialsDay:");
  }
  else
  {
    v220 = v244;
    [v121 updatePalette:v244];
    [v244 layoutSubviews];
    v223 = [v244 dayInitialsHeaderView];
    [v223 frame];
    -[MonthDayTransitionView setWeekDayInitialsDay:](v257, "setWeekDayInitialsDay:");

    v219 = v255;
    [v255 updatePalette:v244];
    [v244 layoutSubviews];
    v222 = [v244 dayInitialsHeaderView];
    [v222 frame];
    -[MonthDayTransitionView setWeekDayInitialsMonth:](v257, "setWeekDayInitialsMonth:");
  }
}

- (void)animateToDayWithCompletion:(id)a3
{
  id v4 = a3;
  if (self->_animating) {
    [(MonthDayTransitionView *)self _haltAnimations];
  }
  [(MonthDayTransitionView *)self weekDayInitialsMonth];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  id v13 = [(PaletteView *)self->_paletteView dayInitialsHeaderView];
  [v13 setFrame:v6, v8, v10, v12];

  id v14 = [(PaletteView *)self->_paletteView dayInitialsHeaderView];
  [v14 setAlpha:1.0];

  id v15 = [(PaletteView *)self->_paletteView dateLabel];
  [v15 setAlpha:1.0];

  id v16 = [(PaletteView *)self->_paletteView animatableDateLabel];
  [v16 setAlpha:1.0];

  v17 = [(MonthDayTransitionView *)self topView];
  [v17 bounds];
  double v19 = v18;
  double v21 = v20;
  double v23 = v22;
  double v25 = v24;
  v26 = [(MonthDayTransitionView *)self topView];
  -[MonthDayTransitionView convertRect:fromView:](self, "convertRect:fromView:", v26, v19, v21, v23, v25);

  [(MonthDayTransitionView *)self monthScrubberFrame];
  [(MonthDayTransitionView *)self _topExtensionHeight];
  v27 = [(MonthDayTransitionView *)self topView];
  [v27 bounds];
  double v29 = v28;
  double v31 = v30;
  double v33 = v32;
  double v35 = v34;
  double v36 = [(MonthDayTransitionView *)self topView];
  -[MonthDayTransitionView convertRect:fromView:](self, "convertRect:fromView:", v36, v29, v31, v33, v35);

  [(MonthDayTransitionView *)self monthScrubberFrame];
  [(MonthDayTransitionView *)self monthScrubberFrame];
  v37 = [(MonthDayTransitionView *)self topView];
  [v37 bounds];

  double v38 = [(CompactWidthMonthViewController *)self->_monthViewController view];
  [(MonthDayTransitionView *)self monthScrubberFrame];
  [v38 convertRect:self fromView:self];
  double v40 = v39;
  double v42 = v41;
  double v44 = v43;
  double v46 = v45;

  double v47 = [(CompactWidthMonthViewController *)self->_monthViewController view];
  [(MonthDayTransitionView *)self dayScrubberFrame];
  [v47 convertPoint:self fromView:self];
  double v49 = v48;

  -[CompactWidthMonthViewController enterAnimationSplitStateWithCutOutArea:topBoundary:](self->_monthViewController, "enterAnimationSplitStateWithCutOutArea:topBoundary:", v40, v42, v44, v46, v49);
  [(CompactWidthMonthViewController *)self->_monthViewController setSplitStateOpen:0];
  v50 = [(MonthDayTransitionView *)self topView];
  [v50 setAlpha:1.0];

  double v51 = [(MonthDayTransitionView *)self bottomView];
  [v51 frame];
  double v53 = v52;
  double v55 = v54;

  double x = self->_dayViewMonthLocation.x;
  double y = self->_dayViewMonthLocation.y;
  v58 = [(MonthDayTransitionView *)self bottomView];
  [v58 setFrame:x, y, v53, v55];

  [(UIView *)self->_allDayView setAlpha:0.0];
  [(UIView *)self->_topLabelsContainer setAlpha:0.0];
  v59 = [(PaletteView *)self->_paletteView dayScrubberController];
  v60 = [v59 view];
  [v60 setHidden:1];

  uint64_t v61 = [(MonthDayTransitionView *)self scrubber];
  [v61 setHidden:0];

  v62 = [(MonthDayTransitionView *)self scrubber];
  [v62 animateToDayLayout];

  springAnimationDuration();
  double v64 = v63;
  uint64_t v65 = +[SpringFactory sharedFactory];
  block[15] = _NSConcreteStackBlock;
  block[16] = 3221225472;
  block[17] = sub_1000A7DB0;
  block[18] = &unk_1001D2740;
  block[19] = self;
  v66 = navigationAnimationsPreferringFRR();
  +[UIView _animateWithDuration:393216 delay:v65 options:v66 factory:0 animations:v64 completion:0.0];

  self->_animating = 1;
  [(MonthDayTransitionView *)self setCompletion:v4];
  springAnimationDuration();
  double v68 = v67;
  uint64_t v69 = +[SpringFactory sharedFactory];
  block[10] = _NSConcreteStackBlock;
  block[11] = 3221225472;
  block[12] = sub_1000A7DC4;
  block[13] = &unk_1001D2740;
  block[14] = self;
  BOOL v70 = navigationAnimationsPreferringFRR();
  +[UIView _animateWithDuration:393216 delay:v69 options:v70 factory:0 animations:v68 completion:0.0];

  v71 = [(MonthDayTransitionView *)self bottomView];
  id v72 = -[MonthDayTransitionView _animateView:toPosition:setDelegate:](self, "_animateView:toPosition:setDelegate:", v71, 1, self->_dayViewDayLocation.x, self->_dayViewDayLocation.y);

  block[5] = _NSConcreteStackBlock;
  block[6] = 3221225472;
  block[7] = sub_1000A7EB8;
  block[8] = &unk_1001D2740;
  block[9] = self;
  uint64_t v73 = navigationAnimationsPreferringFRR();
  +[UIView animateWithDuration:327680 delay:v73 options:0 animations:0.395 completion:0.205];

  UIAnimationDragCoefficient();
  if (v74 <= 1.5)
  {
    int64_t v76 = 600000000;
  }
  else
  {
    UIAnimationDragCoefficient();
    int64_t v76 = (uint64_t)(v75 * 0.91 * 1000000000.0);
  }
  dispatch_time_t v77 = dispatch_time(0, v76);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000A7F14;
  block[3] = &unk_1001D2740;
  block[4] = self;
  dispatch_after(v77, (dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)animateToMonthWithCompletion:(id)a3
{
  id v4 = a3;
  if (self->_animating) {
    [(MonthDayTransitionView *)self _haltAnimations];
  }
  double v5 = [(PaletteView *)self->_paletteView dateLabel];
  [v5 setHidden:1];

  double v6 = [(PaletteView *)self->_paletteView animatableDateLabel];
  [v6 setAlpha:0.0];

  [(MonthDayTransitionView *)self weekDayInitialsDay];
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  id v15 = [(PaletteView *)self->_paletteView dayInitialsHeaderView];
  [v15 setFrame:v8, v10, v12, v14];

  id v16 = [(PaletteView *)self->_paletteView dayInitialsHeaderView];
  [v16 setAlpha:1.0];

  v17 = [(CompactWidthMonthViewController *)self->_monthViewController view];
  [(MonthDayTransitionView *)self monthScrubberFrame];
  [v17 convertRect:self fromView:self];
  double v19 = v18;
  double v21 = v20;
  double v23 = v22;
  double v25 = v24;

  v26 = [(CompactWidthMonthViewController *)self->_monthViewController view];
  [(MonthDayTransitionView *)self dayScrubberFrame];
  [v26 convertPoint:self fromView:];
  double v28 = v27;

  -[CompactWidthMonthViewController enterAnimationSplitStateWithCutOutArea:topBoundary:](self->_monthViewController, "enterAnimationSplitStateWithCutOutArea:topBoundary:", v19, v21, v23, v25, v28);
  [(CompactWidthMonthViewController *)self->_monthViewController setSplitStateOpen:1];
  double v29 = [(CompactWidthMonthViewController *)self->_monthViewController view];
  [v29 setAlpha:0.0];

  double v30 = [(MonthDayTransitionView *)self topView];
  [v30 bounds];
  double v32 = v31;
  double v34 = v33;
  double v36 = v35;
  double v38 = v37;
  double v39 = [(MonthDayTransitionView *)self topView];
  -[MonthDayTransitionView convertRect:fromView:](self, "convertRect:fromView:", v39, v32, v34, v36, v38);

  [(MonthDayTransitionView *)self monthScrubberFrame];
  [(MonthDayTransitionView *)self _topExtensionHeight];
  double v40 = [(MonthDayTransitionView *)self topView];
  [v40 setAlpha:1.0];

  double v41 = [(MonthDayTransitionView *)self bottomView];
  [v41 setAlpha:1.0];

  [(MonthDayTransitionView *)self dayScrubberFrame];
  [(MonthDayTransitionView *)self _topExtensionHeight];
  double v42 = [(MonthDayTransitionView *)self bottomView];
  [v42 frame];
  double v44 = v43;
  double v46 = v45;

  double x = self->_dayViewDayLocation.x;
  double y = self->_dayViewDayLocation.y;
  double v49 = [(MonthDayTransitionView *)self bottomView];
  [v49 setFrame:x, y, v44, v46];

  [(UIView *)self->_allDayView setAlpha:1.0];
  [(UIView *)self->_topLabelsContainer setAlpha:1.0];
  v50 = [(MonthDayTransitionView *)self scrubber];
  [v50 setHidden:0];

  double v51 = [(MonthDayTransitionView *)self scrubber];
  [v51 animateToMonthLayout];

  double v52 = [(PaletteView *)self->_paletteView dayScrubberController];
  double v53 = [v52 view];
  [v53 setHidden:1];

  springAnimationDuration();
  double v55 = v54;
  double v56 = +[SpringFactory sharedFactory];
  v70[10] = _NSConcreteStackBlock;
  v70[11] = 3221225472;
  v70[12] = sub_1000A8538;
  v70[13] = &unk_1001D2740;
  v70[14] = self;
  double v57 = navigationAnimationsPreferringFRR();
  +[UIView _animateWithDuration:393216 delay:v56 options:v57 factory:0 animations:v55 completion:0.0];

  self->_animating = 1;
  [(MonthDayTransitionView *)self setCompletion:v4];
  springAnimationDuration();
  double v59 = v58;
  v60 = +[SpringFactory sharedFactory];
  v70[5] = _NSConcreteStackBlock;
  v70[6] = 3221225472;
  v70[7] = sub_1000A854C;
  v70[8] = &unk_1001D2740;
  v70[9] = self;
  uint64_t v61 = navigationAnimationsPreferringFRR();
  v70[0] = _NSConcreteStackBlock;
  v70[1] = 3221225472;
  v70[2] = sub_1000A8640;
  v70[3] = &unk_1001D27D8;
  v70[4] = self;
  +[UIView _animateWithDuration:393216 delay:v60 options:v61 factory:v70 animations:v59 completion:0.0];

  v62 = [(MonthDayTransitionView *)self bottomView];
  id v63 = -[MonthDayTransitionView _animateView:toPosition:setDelegate:](self, "_animateView:toPosition:setDelegate:", v62, 1, self->_dayViewMonthLocation.x, self->_dayViewMonthLocation.y);

  v69[5] = _NSConcreteStackBlock;
  v69[6] = 3221225472;
  v69[7] = sub_1000A86C8;
  v69[8] = &unk_1001D2740;
  v69[9] = self;
  double v64 = navigationAnimationsPreferringFRR();
  +[UIView animateWithDuration:327680 delay:v64 options:0 animations:0.25 completion:0.0];

  UIAnimationDragCoefficient();
  if (v65 <= 1.5)
  {
    int64_t v67 = 600000000;
  }
  else
  {
    UIAnimationDragCoefficient();
    int64_t v67 = (uint64_t)(v66 * 0.91 * 1000000000.0);
  }
  dispatch_time_t v68 = dispatch_time(0, v67);
  v69[0] = _NSConcreteStackBlock;
  v69[1] = 3221225472;
  v69[2] = sub_1000A8724;
  v69[3] = &unk_1001D2740;
  v69[4] = self;
  dispatch_after(v68, (dispatch_queue_t)&_dispatch_main_q, v69);
}

- (double)_topExtensionHeight
{
  [(MonthDayTransitionView *)self monthScrubberFrame];
  return v2 + -5.0;
}

- (void)_haltAnimations
{
  id v3 = [(MonthDayTransitionView *)self window];
  double v2 = [v3 layer];
  recursiveAnimationRemove();
}

- (id)_animateView:(id)a3 toPosition:(CGPoint)a4 setDelegate:(BOOL)a5
{
  double v5 = springAnimateViewPosition();
  preferredNavigationAnimationFrameRateRange();
  [v5 setPreferredFrameRateRange:];

  return v5;
}

- (void)_animateView:(id)a3 toPosition:(CGPoint)a4
{
  id v4 = -[MonthDayTransitionView _animateView:toPosition:setDelegate:](self, "_animateView:toPosition:setDelegate:", a3, 0, a4.x, a4.y);
}

- (void)_animateView:(id)a3 toAlpha:(double)a4 delay:(double)a5
{
  id v7 = a3;
  UIAnimationDragCoefficient();
  dispatch_time_t v9 = dispatch_time(0, (uint64_t)(v8 * a5 * 1000000000.0));
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1000A88FC;
  v11[3] = &unk_1001D2A40;
  id v12 = v7;
  double v13 = a4;
  id v10 = v7;
  dispatch_after(v9, (dispatch_queue_t)&_dispatch_main_q, v11);
}

- (void)_basicAnimateView:(id)a3 toAlpha:(double)a4 duration:(double)a5
{
  id v7 = a3;
  id v12 = objc_alloc_init((Class)CABasicAnimation);
  [v12 setKeyPath:@"opacity"];
  [v7 alpha];
  float v8 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  [v12 setFromValue:v8];

  dispatch_time_t v9 = +[NSNumber numberWithDouble:a4];
  [v12 setToValue:v9];

  UIAnimationDragCoefficient();
  [v12 setDuration:v10 * a5];
  double v11 = [v7 layer];
  [v11 addAnimation:v12 forKey:@"opacity"];

  preferredNavigationAnimationFrameRateRange();
  [v12 setPreferredFrameRateRange:];
  [v7 setAlpha:a4];
}

- (void)animationDidStop:(id)a3 finished:(BOOL)a4
{
  [(CompactWidthMonthViewController *)self->_monthViewController endAnimationSplitState];
  double v5 = [(CompactWidthMonthViewController *)self->_monthViewController view];
  [v5 setAlpha:1.0];

  double v6 = [(MonthDayTransitionView *)self scrubber];
  [v6 setHidden:1];

  id v7 = [(MonthDayTransitionView *)self scrubber];
  [v7 setAlpha:1.0];

  float v8 = [(MonthDayTransitionView *)self scrubber];
  [v8 removeFromSuperview];

  dispatch_time_t v9 = [(PaletteView *)self->_paletteView dayScrubberController];
  float v10 = [v9 view];
  [v10 setHidden:0];

  double v11 = [(MonthDayTransitionView *)self bottomView];
  [v11 frame];
  double v13 = v12;
  double v15 = v14;

  double x = self->_dayViewDayLocation.x;
  double y = self->_dayViewDayLocation.y;
  double v18 = [(MonthDayTransitionView *)self bottomView];
  [v18 setFrame:x, y, v13, v15];

  [(UIView *)self->_allDayView setAlpha:1.0];
  [(UIView *)self->_topLabelsContainer setAlpha:1.0];
  [(MonthDayTransitionView *)self setAlpha:1.0];
  self->_animating = 0;
  uint64_t v20 = [(MonthDayTransitionView *)self completion];
  [(MonthDayTransitionView *)self setCompletion:0];
  double v19 = (void *)v20;
  if (v20)
  {
    (*(void (**)(uint64_t))(v20 + 16))(v20);
    double v19 = (void *)v20;
  }
}

- (BOOL)animating
{
  return self->_animating;
}

- (void)setAnimating:(BOOL)a3
{
  self->_animating = a3;
}

- (BOOL)dividedMonthView
{
  return self->_dividedMonthView;
}

- (void)setDividedMonthView:(BOOL)a3
{
  self->_dividedMonthView = a3;
}

- (NSDate)selectedDate
{
  return self->_selectedDate;
}

- (void)setSelectedDate:(id)a3
{
}

- (UIView)topView
{
  return self->_topView;
}

- (void)setTopView:(id)a3
{
}

- (UIView)bottomView
{
  return self->_bottomView;
}

- (void)setBottomView:(id)a3
{
}

- (MonthDayNavigationTransitionView)scrubber
{
  return self->_scrubber;
}

- (void)setScrubber:(id)a3
{
}

- (CGRect)dayScrubberFrame
{
  double x = self->_dayScrubberFrame.origin.x;
  double y = self->_dayScrubberFrame.origin.y;
  double width = self->_dayScrubberFrame.size.width;
  double height = self->_dayScrubberFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setDayScrubberFrame:(CGRect)a3
{
  self->_dayScrubberFrame = a3;
}

- (CGSize)dayCellSize
{
  double width = self->_dayCellSize.width;
  double height = self->_dayCellSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setDayCellSize:(CGSize)a3
{
  self->_dayCellSize = a3;
}

- (CGRect)monthScrubberFrame
{
  double x = self->_monthScrubberFrame.origin.x;
  double y = self->_monthScrubberFrame.origin.y;
  double width = self->_monthScrubberFrame.size.width;
  double height = self->_monthScrubberFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setMonthScrubberFrame:(CGRect)a3
{
  self->_monthScrubberFrame = a3;
}

- (CompactWidthMonthViewController)monthViewController
{
  return self->_monthViewController;
}

- (void)setMonthViewController:(id)a3
{
}

- (PaletteView)paletteView
{
  return self->_paletteView;
}

- (void)setPaletteView:(id)a3
{
}

- (UIView)allDayView
{
  return self->_allDayView;
}

- (void)setAllDayView:(id)a3
{
}

- (UIView)topLabelsContainer
{
  return self->_topLabelsContainer;
}

- (void)setTopLabelsContainer:(id)a3
{
}

- (CGPoint)dayViewDayLocation
{
  double x = self->_dayViewDayLocation.x;
  double y = self->_dayViewDayLocation.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setDayViewDayLocation:(CGPoint)a3
{
  self->_dayViewDayLocation = a3;
}

- (CGPoint)dayViewMonthLocation
{
  double x = self->_dayViewMonthLocation.x;
  double y = self->_dayViewMonthLocation.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setDayViewMonthLocation:(CGPoint)a3
{
  self->_dayViewMonthLocation = a3;
}

- (id)completion
{
  return self->_completion;
}

- (void)setCompletion:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completion, 0);
  objc_storeStrong((id *)&self->_topLabelsContainer, 0);
  objc_storeStrong((id *)&self->_allDayView, 0);
  objc_storeStrong((id *)&self->_paletteView, 0);
  objc_storeStrong((id *)&self->_monthViewController, 0);
  objc_storeStrong((id *)&self->_scrubber, 0);
  objc_storeStrong((id *)&self->_bottomView, 0);
  objc_storeStrong((id *)&self->_topView, 0);

  objc_storeStrong((id *)&self->_selectedDate, 0);
}

@end