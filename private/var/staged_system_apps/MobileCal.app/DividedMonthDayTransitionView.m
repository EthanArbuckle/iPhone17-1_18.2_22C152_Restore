@interface DividedMonthDayTransitionView
+ (id)dividedMonthPaletteBackgroundColor;
- (id)completion;
- (void)animateToDayWithCompletion:(id)a3;
- (void)animateToMonthWithCompletion:(id)a3;
- (void)animationDidStop:(id)a3 finished:(BOOL)a4;
- (void)setCompletion:(id)a3;
@end

@implementation DividedMonthDayTransitionView

+ (id)dividedMonthPaletteBackgroundColor
{
  return (id)_EKUISimulatedNavigationBarColor(a1, a2);
}

- (void)animateToMonthWithCompletion:(id)a3
{
  id v4 = a3;
  if ([(MonthDayTransitionView *)self animating]) {
    [(MonthDayTransitionView *)self _haltAnimations];
  }
  v202 = v4;
  [(DividedMonthDayTransitionView *)self setCompletion:v4];
  v5 = [(MonthDayTransitionView *)self paletteView];
  [v5 layoutSubviews];

  v6 = [(MonthDayTransitionView *)self monthViewController];
  [v6 viewWillLayoutSubviews];

  v7 = [(MonthDayTransitionView *)self monthViewController];
  v8 = [v7 view];
  [v8 layoutSubviews];

  v9 = [(MonthDayTransitionView *)self monthViewController];
  [v9 viewDidLayoutSubviews];

  v10 = [(MonthDayTransitionView *)self monthViewController];
  [v10 forceUpdateListView];

  v11 = [(MonthDayTransitionView *)self monthViewController];
  v12 = [v11 view];
  [v12 frame];
  uint64_t v14 = v13;
  uint64_t v200 = v15;

  v16 = [(MonthDayTransitionView *)self monthViewController];
  v17 = [v16 view];
  [(MonthDayTransitionView *)self monthScrubberFrame];
  [v17 convertRect:self fromView:self];
  double v19 = v18;
  double v21 = v20;
  double v23 = v22;
  double v25 = v24;

  v26 = [(MonthDayTransitionView *)self monthViewController];
  v27 = [v26 view];
  [(MonthDayTransitionView *)self dayScrubberFrame];
  [v27 convertPoint:self fromView:self];
  double v29 = v28;

  v30 = [(MonthDayTransitionView *)self monthViewController];
  [v30 frameOfListView];
  CGFloat v198 = CGRectGetMinY(v243) - v29;

  v31 = [(MonthDayTransitionView *)self monthViewController];
  [v31 enterAnimationSplitStateWithCutOutArea:v19 topBoundary:v21];

  [(MonthDayTransitionView *)self dayScrubberFrame];
  double v33 = v29 + v32;
  v34 = [(MonthDayTransitionView *)self monthViewController];
  v35 = [v34 view];
  [v35 frame];
  double v37 = v36;
  double v39 = v38;

  v40 = [(MonthDayTransitionView *)self monthViewController];
  [v40 frameOfListView];
  double v42 = v33 - v41;

  v43 = [(MonthDayTransitionView *)self monthViewController];
  v44 = [v43 view];
  [v44 setFrame:0.0, v42, v37, v39];

  v45 = [(MonthDayTransitionView *)self bottomView];
  [v45 setHidden:1];

  v46 = [(MonthDayTransitionView *)self bottomView];
  [v46 frame];
  double v48 = v47;
  double v50 = v49;

  [(MonthDayTransitionView *)self dayViewDayLocation];
  double v52 = v51;
  double v54 = v53;
  v55 = [(MonthDayTransitionView *)self bottomView];
  [v55 setFrame:v52, v54, v48, v50];

  v56 = [(MonthDayTransitionView *)self allDayView];
  [v56 setAlpha:1.0];

  v57 = [(MonthDayTransitionView *)self monthViewController];
  v58 = [v57 view];
  [v58 setAlpha:1.0];

  v59 = [(MonthDayTransitionView *)self monthViewController];
  v60 = [v59 view];
  uint64_t v61 = captureImageFromView();

  v201 = (void *)v61;
  id v62 = [objc_alloc((Class)UIImageView) initWithImage:v61];
  v63 = [(MonthDayTransitionView *)self paletteView];
  v64 = [(MonthDayTransitionView *)self paletteView];
  v65 = [v64 subviews];
  v66 = [v65 firstObject];
  [v63 insertSubview:v62 belowSubview:v66];

  v67 = [(MonthDayTransitionView *)self paletteView];
  v68 = [v67 layer];
  [v68 setMasksToBounds:0];

  v69 = [(MonthDayTransitionView *)self paletteView];
  [(MonthDayTransitionView *)self dayScrubberFrame];
  [v69 convertRect:self fromView:self];
  double v71 = v70;
  double v73 = v72;

  [v62 setAlpha:0.0];
  [v62 frame];
  [v62 setFrame:v71, v73 - v21];
  [v62 setAutoresizingMask:0];
  v74 = [(MonthDayTransitionView *)self topView];
  [v74 bounds];
  double v76 = v75;
  double v78 = v77;
  double v80 = v79;
  double v82 = v81;
  v83 = [(MonthDayTransitionView *)self topView];
  -[DividedMonthDayTransitionView convertRect:fromView:](self, "convertRect:fromView:", v83, v76, v78, v80, v82);

  [(MonthDayTransitionView *)self monthScrubberFrame];
  [(MonthDayTransitionView *)self _topExtensionHeight];
  v84 = [(MonthDayTransitionView *)self bottomView];
  v85 = [v84 snapshotViewAfterScreenUpdates:0];

  v86 = [(MonthDayTransitionView *)self bottomView];
  [(DividedMonthDayTransitionView *)self insertSubview:v85 aboveSubview:v86];

  v87 = [(MonthDayTransitionView *)self bottomView];
  [v87 convertPoint:CGPointZero.x toView:CGPointZero.y];
  double v89 = v88;
  double v91 = v90;

  v196 = v85;
  [v85 frame];
  [v85 setFrame:v89, v91];
  v92 = [(MonthDayTransitionView *)self paletteView];
  v93 = [v92 dayInitialsHeaderView];
  [v93 frame];
  double v95 = v94;
  double v97 = v96;

  v98 = [(MonthDayTransitionView *)self paletteView];
  [v98 bounds];
  double v100 = v99;

  id v101 = [objc_alloc((Class)UIView) initWithFrame:0.0, v95, v100, v97];
  v102 = +[UIColor systemBackgroundColor];
  [v101 setBackgroundColor:v102];

  v103 = [(MonthDayTransitionView *)self paletteView];
  v104 = [(MonthDayTransitionView *)self paletteView];
  v105 = [v104 dayInitialsHeaderView];
  [v103 insertSubview:v101 belowSubview:v105];

  v106 = [(MonthDayTransitionView *)self paletteView];
  [v106 bounds];
  double v108 = v107;
  [v101 frame];
  CGFloat v109 = CGRectGetMaxY(v244) + 500.0;

  id v110 = [objc_alloc((Class)UIView) initWithFrame:0.0, -500.0, v108, v109];
  v111 = +[DividedMonthDayTransitionView dividedMonthPaletteBackgroundColor];
  [v110 setBackgroundColor:v111];

  v112 = [(MonthDayTransitionView *)self paletteView];
  [v112 insertSubview:v110 belowSubview:v101];

  id v113 = [objc_alloc((Class)UIView) initWithFrame:CGRectNull.origin.x, CGRectNull.origin.y, CGRectNull.size.width, CGRectNull.size.height];
  v245.origin.x = 0.0;
  v245.origin.y = v95;
  v245.size.width = v100;
  v245.size.height = v97;
  double Height = CGRectGetHeight(v245);
  EKUIScaleFactor();
  double v116 = v95 + Height - 1.0 / v115;
  EKUIScaleFactor();
  double v118 = 1.0 / v117;
  [(DividedMonthDayTransitionView *)self bounds];
  [v113 setFrame:CGRectMake(0.0, v116, CGRectGetWidth(v246), v118)];
  [v113 setAlpha:0.0];
  v119 = +[UIColor separatorColor];
  [v113 setBackgroundColor:v119];

  [v101 addSubview:v113];
  [(MonthDayTransitionView *)self setAnimating:1];
  v120 = [(MonthDayTransitionView *)self paletteView];
  [(MonthDayTransitionView *)self monthScrubberFrame];
  [v120 convertRect:self];
  double v122 = v121;

  double v123 = v122 - v21;
  v124 = [(MonthDayTransitionView *)self scrubber];
  [v124 setHidden:0];

  v125 = +[DividedMonthDayTransitionView dividedMonthPaletteBackgroundColor];
  v126 = [(MonthDayTransitionView *)self scrubber];
  [v126 setBackgroundColor:v125];

  v127 = [(MonthDayTransitionView *)self paletteView];
  v128 = [v127 dayScrubberController];
  v129 = [v128 view];
  [v129 setHidden:1];

  v130 = [(MonthDayTransitionView *)self scrubber];
  [v130 setVerticallyCompressedState:1];

  v131 = [(MonthDayTransitionView *)self scrubber];
  [v131 layoutIfNeeded];

  v132 = [(MonthDayTransitionView *)self scrubber];
  [v132 animateToMonthLayout];

  springAnimationDuration();
  double v134 = v133;
  v135 = +[SpringFactory sharedFactory];
  v235 = _NSConcreteStackBlock;
  uint64_t v236 = 3221225472;
  v237 = sub_100073554;
  v238 = &unk_1001D35F8;
  id v239 = v101;
  id v197 = v113;
  id v240 = v197;
  v241 = self;
  CGFloat v242 = v198;
  v136 = navigationAnimationsPreferringFRR();
  v232[0] = _NSConcreteStackBlock;
  v232[1] = 3221225472;
  v232[2] = sub_100073630;
  v232[3] = &unk_1001D2768;
  v232[4] = self;
  id v199 = v239;
  id v233 = v199;
  id v195 = v110;
  id v234 = v195;
  +[UIView _animateWithDuration:393216 delay:v135 options:v136 factory:v232 animations:v134 completion:0.0];

  v137 = [(MonthDayTransitionView *)self paletteView];
  v138 = [v137 dateLabel];
  [v138 setAlpha:0.0];

  [(MonthDayTransitionView *)self weekDayInitialsDay];
  double v140 = v139;
  double v142 = v141;
  double v144 = v143;
  double v146 = v145;
  v147 = [(MonthDayTransitionView *)self paletteView];
  v148 = [v147 dayInitialsHeaderView];
  [v148 setFrame:v140, v142, v144, v146];

  springAnimationDuration();
  double v150 = v149;
  v151 = +[SpringFactory sharedFactory];
  v227 = _NSConcreteStackBlock;
  uint64_t v228 = 3221225472;
  v229 = sub_1000736A0;
  v230 = &unk_1001D2740;
  v231 = self;
  v152 = navigationAnimationsPreferringFRR();
  +[UIView _animateWithDuration:393216 delay:v151 options:v152 factory:0 animations:v150 completion:0.0];

  v153 = [(MonthDayTransitionView *)self monthViewController];
  v154 = [v153 view];
  [v154 setHidden:1];

  springAnimationDuration();
  double v156 = v155;
  v157 = +[SpringFactory sharedFactory];
  v217 = _NSConcreteStackBlock;
  uint64_t v218 = 3221225472;
  v219 = sub_10007376C;
  v220 = &unk_1001D3620;
  v221 = self;
  uint64_t v223 = v14;
  uint64_t v224 = v200;
  id v222 = v62;
  uint64_t v225 = v14;
  double v226 = v123;
  v158 = navigationAnimationsPreferringFRR();
  v214[0] = _NSConcreteStackBlock;
  v214[1] = 3221225472;
  v214[2] = sub_100073868;
  v214[3] = &unk_1001D3188;
  id v159 = v222;
  id v215 = v159;
  v216 = self;
  +[UIView _animateWithDuration:393216 delay:v157 options:v158 factory:v214 animations:v156 completion:0.0];

  v160 = [(MonthDayTransitionView *)self monthViewController];
  [v160 frameOfListView];
  double v162 = v161;
  double v164 = v163;
  double v166 = v165;
  double v168 = v167;
  v169 = [(MonthDayTransitionView *)self monthViewController];
  v170 = [v169 view];
  -[DividedMonthDayTransitionView convertRect:fromView:](self, "convertRect:fromView:", v170, v162, v164, v166, v168);
  uint64_t v172 = v171;
  uint64_t v174 = v173;
  uint64_t v176 = v175;
  uint64_t v178 = v177;

  springAnimationDuration();
  double v180 = v179;
  v181 = +[SpringFactory sharedFactory];
  v205 = _NSConcreteStackBlock;
  uint64_t v206 = 3221225472;
  v207 = sub_1000738D4;
  v208 = &unk_1001D29C8;
  id v209 = v196;
  uint64_t v210 = v172;
  uint64_t v211 = v174;
  uint64_t v212 = v176;
  uint64_t v213 = v178;
  v182 = navigationAnimationsPreferringFRR();
  +[UIView _animateWithDuration:393216 delay:v181 options:v182 factory:0 animations:v180 completion:0.0];

  springAnimationDuration();
  double v184 = v183;
  v185 = +[SpringFactory sharedFactory];
  block[10] = _NSConcreteStackBlock;
  block[11] = 3221225472;
  block[12] = sub_1000738E4;
  block[13] = &unk_1001D2740;
  id v186 = v209;
  id v204 = v186;
  v187 = navigationAnimationsPreferringFRR();
  +[UIView _animateWithDuration:393216 delay:v185 options:v187 factory:0 animations:v184 completion:0.0];

  v188 = [(MonthDayTransitionView *)self bottomView];
  [(MonthDayTransitionView *)self dayViewMonthLocation];
  id v189 = -[MonthDayTransitionView _animateView:toPosition:setDelegate:](self, "_animateView:toPosition:setDelegate:", v188, 1);

  block[5] = _NSConcreteStackBlock;
  block[6] = 3221225472;
  block[7] = sub_1000738F0;
  block[8] = &unk_1001D2740;
  block[9] = self;
  v190 = navigationAnimationsPreferringFRR();
  +[UIView animateWithDuration:327680 delay:v190 options:0 animations:0.25 completion:0.0];

  UIAnimationDragCoefficient();
  if (v191 <= 1.5)
  {
    int64_t v193 = 600000000;
  }
  else
  {
    UIAnimationDragCoefficient();
    int64_t v193 = (uint64_t)(v192 * 0.91 * 1000000000.0);
  }
  dispatch_time_t v194 = dispatch_time(0, v193);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100073938;
  block[3] = &unk_1001D2740;
  block[4] = self;
  dispatch_after(v194, (dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)animateToDayWithCompletion:(id)a3
{
  id v4 = a3;
  if ([(MonthDayTransitionView *)self animating]) {
    [(MonthDayTransitionView *)self _haltAnimations];
  }
  v196 = v4;
  [(DividedMonthDayTransitionView *)self setCompletion:v4];
  v5 = [(MonthDayTransitionView *)self monthViewController];
  [v5 forceUpdateListView];

  v6 = [(MonthDayTransitionView *)self topView];
  [v6 bounds];
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  uint64_t v15 = [(MonthDayTransitionView *)self topView];
  -[DividedMonthDayTransitionView convertRect:fromView:](self, "convertRect:fromView:", v15, v8, v10, v12, v14);

  [(MonthDayTransitionView *)self monthScrubberFrame];
  [(MonthDayTransitionView *)self _topExtensionHeight];
  v16 = [(MonthDayTransitionView *)self monthViewController];
  v17 = [v16 view];
  [(MonthDayTransitionView *)self monthScrubberFrame];
  [v17 convertRect:self];
  CGFloat v19 = v18;
  double v194 = v18;
  CGFloat v21 = v20;
  double v191 = v20;
  double v23 = v22;
  double v25 = v24;

  v26 = [(MonthDayTransitionView *)self monthViewController];
  v27 = [v26 view];
  [(MonthDayTransitionView *)self dayScrubberFrame];
  [v27 convertPoint:self fromView:self];
  double v29 = v28;

  v230.origin.x = v19;
  v230.origin.y = v21;
  v230.size.width = v23;
  v230.size.height = v25;
  CGFloat v193 = CGRectGetMinY(v230) - v29;
  v30 = [(MonthDayTransitionView *)self monthViewController];
  v31 = [v30 view];
  double v32 = [(MonthDayTransitionView *)self paletteView];
  [v32 bounds];
  double v34 = v33;
  double v36 = v35;
  double v38 = v37;
  double v40 = v39;
  double v41 = [(MonthDayTransitionView *)self paletteView];
  [v31 convertRect:v41 fromView:v34];
  CGFloat v43 = v42;
  CGFloat v45 = v44;
  CGFloat v47 = v46;
  CGFloat v49 = v48;

  double v50 = [(MonthDayTransitionView *)self monthViewController];
  [v50 frameOfListView];
  double MinY = CGRectGetMinY(v231);
  v232.origin.x = v43;
  v232.origin.y = v45;
  v232.size.width = v47;
  v232.size.height = v49;
  double v52 = MinY - CGRectGetMaxY(v232);

  double v53 = [(MonthDayTransitionView *)self monthViewController];
  [v53 enterAnimationSplitStateWithCutOutArea:v194 topBoundary:v191 cutOutArea:v23 topBoundary:v25 cutOutArea:v29];

  double v54 = [(MonthDayTransitionView *)self monthViewController];
  v55 = [v54 view];
  [v55 setAlpha:1.0];

  v56 = [(MonthDayTransitionView *)self monthViewController];
  v57 = [v56 view];
  uint64_t v58 = captureImageFromView();

  id v195 = (void *)v58;
  id v59 = [objc_alloc((Class)UIImageView) initWithImage:v58];
  v60 = [(MonthDayTransitionView *)self paletteView];
  uint64_t v61 = [(MonthDayTransitionView *)self paletteView];
  id v62 = [v61 subviews];
  v63 = [v62 firstObject];
  [v60 insertSubview:v59 belowSubview:v63];

  v64 = [(MonthDayTransitionView *)self paletteView];
  v65 = [v64 layer];
  [v65 setMasksToBounds:0];

  v66 = [(MonthDayTransitionView *)self paletteView];
  [v66 setExtraPaletteHeight:v52];

  v67 = [(MonthDayTransitionView *)self paletteView];
  [v67 layoutSubviews];

  v68 = [(MonthDayTransitionView *)self paletteView];
  v69 = [(MonthDayTransitionView *)self monthViewController];
  double v70 = [v69 view];
  [v68 convertPoint:CGPointZero.x fromView:CGPointZero.y];
  double v72 = v71;
  double v74 = v73;

  [v59 frame];
  [v59 setFrame:v72, v74];
  [(MonthDayTransitionView *)self weekDayInitialsMonth];
  double v76 = v75;
  double v78 = v77;
  double v80 = v79;
  double v82 = v81;
  v83 = [(MonthDayTransitionView *)self paletteView];
  v84 = [v83 dayInitialsHeaderView];
  [v84 setFrame:v76, v78, v80, v82];

  v85 = [(MonthDayTransitionView *)self paletteView];
  v86 = [v85 dayInitialsHeaderView];
  [v86 frame];
  double v88 = v87;
  double v90 = v89;

  double v91 = [(MonthDayTransitionView *)self paletteView];
  [v91 bounds];
  double v93 = v92;

  id v94 = [objc_alloc((Class)UIView) initWithFrame:0.0, v88, v93, v90];
  double v95 = +[DividedMonthDayTransitionView dividedMonthPaletteBackgroundColor];
  [v94 setBackgroundColor:v95];

  double v96 = [(MonthDayTransitionView *)self paletteView];
  double v97 = [(MonthDayTransitionView *)self paletteView];
  v98 = [v97 dayInitialsHeaderView];
  [v96 insertSubview:v94 belowSubview:v98];

  double v99 = [(MonthDayTransitionView *)self paletteView];
  [v99 bounds];
  double v101 = v100;
  [v94 frame];
  CGFloat v102 = CGRectGetMaxY(v233) + 500.0;

  id v103 = [objc_alloc((Class)UIView) initWithFrame:0.0, -500.0, v101, v102];
  v104 = +[DividedMonthDayTransitionView dividedMonthPaletteBackgroundColor];
  [v103 setBackgroundColor:v104];

  v105 = [(MonthDayTransitionView *)self paletteView];
  [v105 insertSubview:v103 aboveSubview:v59];

  id v106 = [objc_alloc((Class)UIView) initWithFrame:CGRectNull.origin.x, CGRectNull.origin.y, CGRectNull.size.width, CGRectNull.size.height];
  v234.origin.x = 0.0;
  v234.origin.y = v88;
  v234.size.width = v93;
  v234.size.height = v90;
  double Height = CGRectGetHeight(v234);
  EKUIScaleFactor();
  double v109 = v88 + Height - 1.0 / v108;
  EKUIScaleFactor();
  double v111 = 1.0 / v110;
  [(DividedMonthDayTransitionView *)self bounds];
  [v106 setFrame:CGRectMake(0.0, v109, CGRectGetWidth(v235), v111)];
  [v106 setAlpha:1.0];
  v112 = +[UIColor separatorColor];
  [v106 setBackgroundColor:v112];

  [v94 addSubview:v106];
  [(MonthDayTransitionView *)self setAnimating:1];
  id v113 = [(MonthDayTransitionView *)self paletteView];
  v114 = [v113 dayScrubberController];
  double v115 = [v114 view];
  [v115 setHidden:1];

  double v116 = [(MonthDayTransitionView *)self scrubber];
  [v116 setHidden:0];

  double v117 = [(MonthDayTransitionView *)self scrubber];
  [v117 setAlpha:1.0];

  double v118 = [(MonthDayTransitionView *)self scrubber];
  [v118 setVerticallyCompressedState:1];

  v119 = [(MonthDayTransitionView *)self scrubber];
  [v119 layoutIfNeeded];

  v120 = +[CompactMonthViewController dividedModeBackgroundColor];
  double v121 = [(MonthDayTransitionView *)self scrubber];
  [v121 setBackgroundColor:v120];

  double v122 = [(MonthDayTransitionView *)self scrubber];
  [v122 animateToDayLayout];

  springAnimationDuration();
  double v124 = v123;
  v125 = +[SpringFactory sharedFactory];
  uint64_t v224 = _NSConcreteStackBlock;
  uint64_t v225 = 3221225472;
  double v226 = sub_100074928;
  v227 = &unk_1001D28A8;
  id v192 = v106;
  id v228 = v192;
  v229 = self;
  v126 = navigationAnimationsPreferringFRR();
  v221[0] = _NSConcreteStackBlock;
  v221[1] = 3221225472;
  v221[2] = sub_1000749C0;
  v221[3] = &unk_1001D3188;
  id v190 = v94;
  id v222 = v190;
  id v189 = v103;
  id v223 = v189;
  +[UIView _animateWithDuration:393216 delay:v125 options:v126 factory:v221 animations:v124 completion:0.0];

  [(MonthDayTransitionView *)self weekDayInitialsMonth];
  double v128 = v127;
  double v130 = v129;
  double v132 = v131;
  double v134 = v133;
  v135 = [(MonthDayTransitionView *)self paletteView];
  v136 = [v135 dayInitialsHeaderView];
  [v136 setFrame:v128, v130, v132, v134];

  v137 = [(MonthDayTransitionView *)self paletteView];
  v138 = [v137 animatableDateLabel];
  [v138 setAlpha:1.0];

  springAnimationDuration();
  double v140 = v139;
  double v141 = +[SpringFactory sharedFactory];
  v216 = _NSConcreteStackBlock;
  uint64_t v217 = 3221225472;
  uint64_t v218 = sub_1000749FC;
  v219 = &unk_1001D2740;
  v220 = self;
  double v142 = navigationAnimationsPreferringFRR();
  +[UIView _animateWithDuration:393216 delay:v141 options:v142 factory:0 animations:v140 completion:0.0];

  springAnimationDuration();
  double v144 = v143;
  uint64_t v211 = _NSConcreteStackBlock;
  uint64_t v212 = 3221225472;
  uint64_t v213 = sub_100074AC8;
  v214 = &unk_1001D2740;
  id v215 = self;
  double v145 = navigationAnimationsPreferringFRR();
  +[UIView _animateUsingSpringWithDuration:0 delay:v145 options:0 mass:v144 stiffness:0.0 damping:2.0 initialVelocity:300.0 animations:400.0 completion:0.0];

  double v146 = [(MonthDayTransitionView *)self monthViewController];
  v147 = [v146 view];
  [v147 setHidden:1];

  springAnimationDuration();
  double v149 = v148;
  double v150 = +[SpringFactory sharedFactory];
  v205 = _NSConcreteStackBlock;
  uint64_t v206 = 3221225472;
  v207 = sub_100074B34;
  v208 = &unk_1001D2A40;
  id v209 = v59;
  CGFloat v210 = v193;
  v151 = navigationAnimationsPreferringFRR();
  v203[0] = _NSConcreteStackBlock;
  v203[1] = 3221225472;
  v203[2] = sub_100074B94;
  v203[3] = &unk_1001D3188;
  v203[4] = self;
  id v152 = v209;
  id v204 = v152;
  +[UIView _animateWithDuration:393216 delay:v150 options:v151 factory:v203 animations:v149 completion:0.0];

  [(DividedMonthDayTransitionView *)self bounds];
  double MaxY = CGRectGetMaxY(v236);
  v154 = [(MonthDayTransitionView *)self bottomView];
  [v154 frame];
  double v155 = MaxY - CGRectGetHeight(v237);
  double v156 = [(MonthDayTransitionView *)self monthViewController];
  v157 = [v156 navigationController];
  v158 = [v157 toolbar];
  [v158 frame];
  double v159 = v155 - CGRectGetHeight(v238);

  v160 = [(MonthDayTransitionView *)self monthViewController];
  [v160 frameOfListView];
  double v161 = CGRectGetMinY(v239);
  double v162 = [(MonthDayTransitionView *)self monthViewController];
  double v163 = [v162 view];
  [v163 frame];
  CGFloat v164 = v161 / CGRectGetHeight(v240);

  double v165 = [(MonthDayTransitionView *)self bottomView];
  [v165 frame];
  CGFloat v166 = CGRectGetHeight(v241);
  CATransform3DMakeTranslation(&a, 0.0, v166 * 0.5, 0.0);
  CATransform3DMakeScale(&b, 1.0, v164, 1.0);
  CATransform3DConcat(&v202, &a, &b);
  double v167 = [(MonthDayTransitionView *)self bottomView];
  double v168 = [v167 layer];
  CATransform3D v199 = v202;
  [v168 setTransform:&v199];

  v169 = [(MonthDayTransitionView *)self bottomView];
  [v169 setAlpha:0.0];

  v170 = [(MonthDayTransitionView *)self bottomView];
  [v170 setHidden:0];

  uint64_t v171 = [(MonthDayTransitionView *)self bottomView];
  [v171 frame];
  double v173 = v172;
  double v175 = v174;

  uint64_t v176 = [(MonthDayTransitionView *)self bottomView];
  [v176 setFrame:0.0, v159, v173, v175];

  springAnimationDuration();
  double v178 = v177;
  double v179 = +[SpringFactory sharedFactory];
  v198[5] = _NSConcreteStackBlock;
  v198[6] = 3221225472;
  v198[7] = sub_100074BFC;
  v198[8] = &unk_1001D2740;
  v198[9] = self;
  double v180 = navigationAnimationsPreferringFRR();
  v198[0] = _NSConcreteStackBlock;
  v198[1] = 3221225472;
  v198[2] = sub_100074CE8;
  v198[3] = &unk_1001D27D8;
  v198[4] = self;
  +[UIView _animateWithDuration:393216 delay:v179 options:v180 factory:v198 animations:v178 completion:0.0];

  UIAnimationDragCoefficient();
  if (v181 <= 1.5)
  {
    int64_t v183 = 600000000;
  }
  else
  {
    UIAnimationDragCoefficient();
    int64_t v183 = (uint64_t)(v182 * 0.91 * 1000000000.0);
  }
  dispatch_time_t v184 = dispatch_time(0, v183);
  springAnimationDuration();
  double v186 = v185;
  v187 = +[SpringFactory sharedFactory];
  block[5] = _NSConcreteStackBlock;
  block[6] = 3221225472;
  block[7] = sub_100074CF8;
  block[8] = &unk_1001D2740;
  block[9] = self;
  v188 = navigationAnimationsPreferringFRR();
  +[UIView _animateWithDuration:393216 delay:v187 options:v188 factory:&stru_1001D3660 animations:v186 completion:0.0];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100074D44;
  block[3] = &unk_1001D2740;
  block[4] = self;
  dispatch_after(v184, (dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)animationDidStop:(id)a3 finished:(BOOL)a4
{
  v12.receiver = self;
  v12.super_class = (Class)DividedMonthDayTransitionView;
  [(MonthDayTransitionView *)&v12 animationDidStop:a3 finished:a4];
  v5 = [(MonthDayTransitionView *)self bottomView];
  v6 = [v5 layer];
  long long v7 = *(_OWORD *)&CATransform3DIdentity.m33;
  v11[4] = *(_OWORD *)&CATransform3DIdentity.m31;
  v11[5] = v7;
  long long v8 = *(_OWORD *)&CATransform3DIdentity.m43;
  v11[6] = *(_OWORD *)&CATransform3DIdentity.m41;
  v11[7] = v8;
  long long v9 = *(_OWORD *)&CATransform3DIdentity.m13;
  v11[0] = *(_OWORD *)&CATransform3DIdentity.m11;
  v11[1] = v9;
  long long v10 = *(_OWORD *)&CATransform3DIdentity.m23;
  v11[2] = *(_OWORD *)&CATransform3DIdentity.m21;
  v11[3] = v10;
  [v6 setTransform:v11];
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
}

@end