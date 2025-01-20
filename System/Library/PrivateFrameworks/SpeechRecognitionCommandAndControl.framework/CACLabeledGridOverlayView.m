@interface CACLabeledGridOverlayView
- (BOOL)isSmallEnoughForZooming;
- (BOOL)showsElementsAsClickable;
- (BOOL)showsNumbersInTopLeft;
- (CACAdaptiveBackdropView)backdrop;
- (CACLabeledGridOverlayView)initWithFrame:(CGRect)a3;
- (CACZoomController)zoomController;
- (NSMutableArray)allBadgeViews;
- (NSMutableArray)dimmingViews;
- (NSMutableArray)outOfBoxBadgeViews;
- (NSMutableArray)separatorViews;
- (NSMutableArray)zoomedGridBadgeViews;
- (UIView)badgesContainer;
- (UIView)contrastBadgesContainer;
- (id)_newLineViewWithFrame:(CGRect)a3;
- (void)addLabeledElements:(id)a3;
- (void)clearLabeledElements;
- (void)hide;
- (void)setAllBadgeViews:(id)a3;
- (void)setBackdrop:(id)a3;
- (void)setBadgesContainer:(id)a3;
- (void)setContrastBadgesContainer:(id)a3;
- (void)setDimmingViews:(id)a3;
- (void)setIsSmallEnoughForZooming:(BOOL)a3;
- (void)setOutOfBoxBadgeViews:(id)a3;
- (void)setSeparatorViews:(id)a3;
- (void)setShowsElementsAsClickable:(BOOL)a3;
- (void)setShowsNumbersInTopLeft:(BOOL)a3;
- (void)setZoomController:(id)a3;
- (void)setZoomedGridBadgeViews:(id)a3;
- (void)show;
- (void)zoomOverRect:(CGRect)a3;
@end

@implementation CACLabeledGridOverlayView

- (CACLabeledGridOverlayView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v29.receiver = self;
  v29.super_class = (Class)CACLabeledGridOverlayView;
  v7 = -[CACLabeledGridOverlayView initWithFrame:](&v29, sel_initWithFrame_);
  if (v7)
  {
    uint64_t v8 = objc_opt_new();
    labeledElements = v7->_labeledElements;
    v7->_labeledElements = (NSMutableArray *)v8;

    v10 = [[CACZoomController alloc] initWithContainingView:v7];
    zoomController = v7->_zoomController;
    v7->_zoomController = v10;

    v12 = [(CACLabeledGridOverlayView *)v7 layer];
    [v12 setCreatesCompositingGroup:1];

    v13 = [CACAdaptiveBackdropView alloc];
    v14 = [MEMORY[0x263F82B60] mainScreen];
    [v14 bounds];
    uint64_t v15 = -[CACAdaptiveBackdropView initWithFrame:](v13, "initWithFrame:");
    backdrop = v7->_backdrop;
    v7->_backdrop = (CACAdaptiveBackdropView *)v15;

    v17 = [(CACAdaptiveBackdropView *)v7->_backdrop layer];
    [v17 setCaptureOnly:1];

    [(CACLabeledGridOverlayView *)v7 insertSubview:v7->_backdrop atIndex:0];
    uint64_t v18 = +[CACOverlayContainerView badgeViewContainerWithFrame:usingContrast:](CACOverlayContainerView, "badgeViewContainerWithFrame:usingContrast:", 0, x, y, width, height);
    badgesContainer = v7->_badgesContainer;
    v7->_badgesContainer = (UIView *)v18;

    uint64_t v20 = +[CACOverlayContainerView badgeViewContainerWithFrame:usingContrast:](CACOverlayContainerView, "badgeViewContainerWithFrame:usingContrast:", 1, x, y, width, height);
    contrastBadgesContainer = v7->_contrastBadgesContainer;
    v7->_contrastBadgesContainer = (UIView *)v20;

    uint64_t v22 = objc_opt_new();
    allBadgeViews = v7->_allBadgeViews;
    v7->_allBadgeViews = (NSMutableArray *)v22;

    uint64_t v24 = objc_opt_new();
    separatorViews = v7->_separatorViews;
    v7->_separatorViews = (NSMutableArray *)v24;

    uint64_t v26 = objc_opt_new();
    dimmingViews = v7->_dimmingViews;
    v7->_dimmingViews = (NSMutableArray *)v26;
  }
  return v7;
}

- (void)show
{
}

- (void)hide
{
}

- (void)clearLabeledElements
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  [(NSMutableArray *)self->_labeledElements removeAllObjects];
  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  v3 = [(CACLabeledGridOverlayView *)self subviews];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v30 objects:v36 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v31;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v31 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void **)(*((void *)&v30 + 1) + 8 * v7);
        v9 = [(CACLabeledGridOverlayView *)self backdrop];

        if (v8 != v9) {
          [v8 removeFromSuperview];
        }
        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v30 objects:v36 count:16];
    }
    while (v5);
  }

  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  v10 = [(CACLabeledGridOverlayView *)self badgesContainer];
  v11 = [v10 subviews];

  uint64_t v12 = [v11 countByEnumeratingWithState:&v26 objects:v35 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v27;
    do
    {
      uint64_t v15 = 0;
      do
      {
        if (*(void *)v27 != v14) {
          objc_enumerationMutation(v11);
        }
        [*(id *)(*((void *)&v26 + 1) + 8 * v15++) removeFromSuperview];
      }
      while (v13 != v15);
      uint64_t v13 = [v11 countByEnumeratingWithState:&v26 objects:v35 count:16];
    }
    while (v13);
  }

  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  v16 = [(CACLabeledGridOverlayView *)self contrastBadgesContainer];
  v17 = [v16 subviews];

  uint64_t v18 = [v17 countByEnumeratingWithState:&v22 objects:v34 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v20 = *(void *)v23;
    do
    {
      uint64_t v21 = 0;
      do
      {
        if (*(void *)v23 != v20) {
          objc_enumerationMutation(v17);
        }
        [*(id *)(*((void *)&v22 + 1) + 8 * v21++) removeFromSuperview];
      }
      while (v19 != v21);
      uint64_t v19 = [v17 countByEnumeratingWithState:&v22 objects:v34 count:16];
    }
    while (v19);
  }
}

- (void)addLabeledElements:(id)a3
{
  uint64_t v365 = *MEMORY[0x263EF8340];
  [(NSMutableArray *)self->_labeledElements addObjectsFromArray:a3];
  uint64_t v4 = [(CACLabeledGridOverlayView *)self zoomController];
  uint64_t v5 = [v4 view];
  [v5 removeFromSuperview];

  uint64_t v6 = [(CACLabeledGridOverlayView *)self badgesContainer];
  [v6 removeFromSuperview];

  uint64_t v7 = [(CACLabeledGridOverlayView *)self contrastBadgesContainer];
  [v7 removeFromSuperview];

  uint64_t v8 = [MEMORY[0x263EFF980] array];
  v9 = [MEMORY[0x263EFF980] array];
  v10 = [(NSMutableArray *)self->_labeledElements firstObject];
  [v10 rectangle];
  double v15 = CACViewRectFromPortraitUpRect(self, v11, v12, v13, v14);
  double v17 = v16;

  uint64_t v18 = [(NSMutableArray *)self->_labeledElements lastObject];
  [v18 rectangle];
  double v23 = CACViewRectFromPortraitUpRect(self, v19, v20, v21, v22);
  CGFloat v25 = v24;
  CGFloat v27 = v26;
  CGFloat v29 = v28;

  v366.origin.CGFloat x = v23;
  v366.origin.CGFloat y = v25;
  v366.size.CGFloat width = v27;
  v366.size.CGFloat height = v29;
  CGFloat v30 = CGRectGetMaxX(v366) - v15;
  v367.origin.CGFloat x = v23;
  v367.origin.CGFloat y = v25;
  v367.size.CGFloat width = v27;
  v367.size.CGFloat height = v29;
  double v323 = v15;
  double v325 = CGRectGetMaxY(v367) - v17;
  double v320 = v17;
  double v327 = v30;
  -[CACLabeledGridOverlayView zoomOverRect:](self, "zoomOverRect:", v15, v17, v30);
  long long v356 = 0u;
  long long v357 = 0u;
  long long v354 = 0u;
  long long v355 = 0u;
  v322 = self;
  long long v31 = self->_labeledElements;
  uint64_t v32 = [(NSMutableArray *)v31 countByEnumeratingWithState:&v354 objects:v364 count:16];
  if (v32)
  {
    uint64_t v33 = v32;
    uint64_t v34 = *(void *)v355;
    do
    {
      for (uint64_t i = 0; i != v33; ++i)
      {
        if (*(void *)v355 != v34) {
          objc_enumerationMutation(v31);
        }
        [*(id *)(*((void *)&v354 + 1) + 8 * i) rectangle];
        v368.origin.CGFloat x = CACViewRectFromPortraitUpRect(v322, v36, v37, v38, v39);
        CGFloat x = v368.origin.x;
        CGFloat y = v368.origin.y;
        CGFloat width = v368.size.width;
        CGFloat height = v368.size.height;
        double MaxX = CGRectGetMaxX(v368);
        v45 = [v8 lastObject];
        [v45 floatValue];
        double v47 = v46 + 1.0;

        if (MaxX > v47)
        {
          v369.origin.CGFloat x = x;
          v369.origin.CGFloat y = y;
          v369.size.CGFloat width = width;
          v369.size.CGFloat height = height;
          v48 = [NSNumber numberWithDouble:CGRectGetMaxX(v369)];
          [v8 addObject:v48];
        }
        v370.origin.CGFloat x = x;
        v370.origin.CGFloat y = y;
        v370.size.CGFloat width = width;
        v370.size.CGFloat height = height;
        double MaxY = CGRectGetMaxY(v370);
        v50 = [v9 lastObject];
        [v50 floatValue];
        double v52 = v51 + 1.0;

        if (MaxY > v52)
        {
          v371.origin.CGFloat x = x;
          v371.origin.CGFloat y = y;
          v371.size.CGFloat width = width;
          v371.size.CGFloat height = height;
          v53 = [NSNumber numberWithDouble:CGRectGetMaxY(v371)];
          [v9 addObject:v53];
        }
      }
      uint64_t v33 = [(NSMutableArray *)v31 countByEnumeratingWithState:&v354 objects:v364 count:16];
    }
    while (v33);
  }

  [(CACLabeledGridOverlayView *)v322 bounds];
  double v55 = v54;
  double v57 = v56;
  v58 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F82E00]), "initWithFrame:", 0.0, 0.0, v323, v56);
  v59 = [MEMORY[0x263F825C8] blackColor];
  [v58 setBackgroundColor:v59];

  [v58 setAlpha:0.5];
  v292 = v58;
  [(CACLabeledGridOverlayView *)v322 addSubview:v58];
  id v60 = objc_allocWithZone(MEMORY[0x263F82E00]);
  v372.origin.CGFloat x = v323;
  v372.origin.CGFloat y = v17;
  v372.size.CGFloat width = v327;
  v372.size.CGFloat height = v325;
  double v61 = CGRectGetMaxX(v372);
  v373.origin.CGFloat x = v323;
  v373.origin.CGFloat y = v17;
  v373.size.CGFloat width = v327;
  v373.size.CGFloat height = v325;
  v62 = objc_msgSend(v60, "initWithFrame:", v61, 0.0, v55 - CGRectGetMaxX(v373), v57);
  v63 = [MEMORY[0x263F825C8] blackColor];
  [v62 setBackgroundColor:v63];

  [v62 setAlpha:0.5];
  v291 = v62;
  [(CACLabeledGridOverlayView *)v322 addSubview:v62];
  v64 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F82E00]), "initWithFrame:", v323, 0.0, v327, v17);
  v65 = [MEMORY[0x263F825C8] blackColor];
  [v64 setBackgroundColor:v65];

  [v64 setAlpha:0.5];
  v290 = v64;
  [(CACLabeledGridOverlayView *)v322 addSubview:v64];
  v66 = v322;
  id v67 = objc_allocWithZone(MEMORY[0x263F82E00]);
  v374.origin.CGFloat x = v323;
  v374.origin.CGFloat y = v17;
  v374.size.CGFloat width = v327;
  v374.size.CGFloat height = v325;
  double v68 = CGRectGetMaxY(v374);
  v375.origin.CGFloat x = v323;
  v375.origin.CGFloat y = v17;
  v375.size.CGFloat width = v327;
  v375.size.CGFloat height = v325;
  v69 = objc_msgSend(v67, "initWithFrame:", v323, v68, v327, v57 - CGRectGetMaxY(v375));
  v70 = [MEMORY[0x263F825C8] blackColor];
  [v69 setBackgroundColor:v70];

  [v69 setAlpha:0.5];
  v289 = v69;
  [(CACLabeledGridOverlayView *)v322 addSubview:v69];
  uint64_t v71 = [v8 count];
  v294 = v9;
  v293 = v8;
  BOOL v308 = v71 == [v9 count] && objc_msgSend(v8, "count") == 3;
  v72 = objc_opt_new();
  [(CACLabeledGridOverlayView *)v322 setOutOfBoxBadgeViews:v72];

  v73 = objc_opt_new();
  [(CACLabeledGridOverlayView *)v322 setZoomedGridBadgeViews:v73];

  BOOL v74 = [(CACLabeledGridOverlayView *)v322 showsElementsAsClickable];
  long long v350 = 0u;
  long long v351 = 0u;
  long long v352 = 0u;
  long long v353 = 0u;
  v75 = v322->_labeledElements;
  uint64_t v76 = [(NSMutableArray *)v75 countByEnumeratingWithState:&v350 objects:v363 count:16];
  if (v76)
  {
    uint64_t v77 = v76;
    char v78 = 0;
    BOOL v79 = !v74;
    uint64_t v80 = *(void *)v351;
    double v81 = *MEMORY[0x263F001A8];
    double v82 = *(double *)(MEMORY[0x263F001A8] + 8);
    double v310 = *(double *)(MEMORY[0x263F001A8] + 24);
    id v311 = *(id *)(MEMORY[0x263F001A8] + 16);
    double v305 = *(double *)(MEMORY[0x263F83810] + 8);
    double v306 = *MEMORY[0x263F83810];
    obuint64_t j = v75;
    uint64_t v296 = 1;
    double v307 = *MEMORY[0x263F001A8];
    do
    {
      for (uint64_t j = 0; j != v77; ++j)
      {
        if (*(void *)v351 != v80) {
          objc_enumerationMutation(obj);
        }
        v84 = *(void **)(*((void *)&v350 + 1) + 8 * j);
        [v84 rectangle];
        double v89 = CACViewRectFromPortraitUpRect(v66, v85, v86, v87, v88);
        CGFloat v91 = v90;
        double v93 = v92;
        CGFloat v95 = v94;
        +[CACLabeledBadgeView sizeOfBadgeGivenNumberOfDisplayedDigits:1 arrowOrientation:0 badgePresentation:v79 badgeIndicator:0];
        CGFloat v98 = v93;
        BOOL v99 = v308;
        if (v93 >= v96) {
          BOOL v99 = 0;
        }
        if (v99)
        {
          double v100 = v96;
          CGFloat v101 = v89;
          float v102 = v96 - v327;
          double v103 = truncf(v102);
          if (v327 >= v100) {
            double v104 = 0.0;
          }
          else {
            double v104 = v103;
          }
          float v105 = v97 - v325;
          double v106 = truncf(v105);
          double v313 = v97;
          if (v325 >= v97) {
            double v107 = 0.0;
          }
          else {
            double v107 = v106;
          }
          double v309 = v100;
          switch(v296 + j)
          {
            case 1:
              v376.origin.CGFloat x = v101;
              v376.origin.CGFloat y = v91;
              v376.size.CGFloat width = v98;
              v376.size.CGFloat height = v95;
              CGFloat v297 = v95;
              double v304 = CGRectGetMinX(v376) - v100 - v104;
              CGFloat v108 = v101;
              CGFloat v109 = v101;
              goto LABEL_48;
            case 2:
              v392.origin.CGFloat x = v101;
              v392.origin.CGFloat y = v91;
              v392.size.CGFloat width = v98;
              v392.size.CGFloat height = v95;
              double v304 = CGRectGetMidX(v392) + v100 * -0.5;
              CGFloat v109 = v101;
              CGFloat v141 = v91;
              CGFloat v143 = v95;
              CGFloat v142 = v98;
              CGFloat v108 = v101;
              goto LABEL_49;
            case 3:
              v393.origin.CGFloat x = v101;
              v393.origin.CGFloat y = v91;
              v393.size.CGFloat width = v98;
              v393.size.CGFloat height = v95;
              CGFloat v297 = v95;
              double v304 = v104 + CGRectGetMaxX(v393);
              CGFloat v108 = v101;
              CGFloat v109 = v101;
LABEL_48:
              CGFloat v141 = v91;
              CGFloat v143 = v297;
              CGFloat v142 = v98;
LABEL_49:
              double v144 = CGRectGetMinY(*(CGRect *)&v109) - v313 - v107;
              goto LABEL_57;
            case 4:
              v394.origin.CGFloat x = v101;
              v394.origin.CGFloat y = v91;
              v394.size.CGFloat width = v98;
              v394.size.CGFloat height = v95;
              double v304 = CGRectGetMinX(v394) - v100 - v104;
              CGFloat v108 = v101;
              CGFloat v145 = v101;
              CGFloat v146 = v91;
              CGFloat v148 = v95;
              CGFloat v147 = v98;
              goto LABEL_52;
            case 6:
              v395.origin.CGFloat x = v101;
              v395.origin.CGFloat y = v91;
              v395.size.CGFloat width = v98;
              v395.size.CGFloat height = v95;
              double v304 = v104 + CGRectGetMaxX(v395);
              CGFloat v108 = v101;
              CGFloat v145 = v101;
              CGFloat v146 = v91;
              CGFloat v147 = v98;
              CGFloat v148 = v95;
LABEL_52:
              double v144 = CGRectGetMidY(*(CGRect *)&v145) + v313 * -0.5;
              goto LABEL_57;
            case 7:
              v391.origin.CGFloat x = v101;
              v391.origin.CGFloat y = v91;
              v391.size.CGFloat width = v98;
              v391.size.CGFloat height = v95;
              CGFloat v298 = v95;
              double v304 = CGRectGetMinX(v391) - v100 - v104;
              CGFloat v108 = v101;
              CGFloat v140 = v101;
              goto LABEL_55;
            case 8:
              v396.origin.CGFloat x = v101;
              v396.origin.CGFloat y = v91;
              v396.size.CGFloat width = v98;
              v396.size.CGFloat height = v95;
              double v304 = CGRectGetMidX(v396) + v100 * -0.5;
              CGFloat v140 = v101;
              CGFloat v149 = v91;
              CGFloat v151 = v95;
              CGFloat v150 = v98;
              CGFloat v108 = v101;
              goto LABEL_56;
            case 9:
              v397.origin.CGFloat x = v101;
              v397.origin.CGFloat y = v91;
              v397.size.CGFloat width = v98;
              v397.size.CGFloat height = v95;
              CGFloat v298 = v95;
              double v304 = v104 + CGRectGetMaxX(v397);
              CGFloat v108 = v101;
              CGFloat v140 = v101;
LABEL_55:
              CGFloat v149 = v91;
              CGFloat v151 = v298;
              CGFloat v150 = v98;
LABEL_56:
              double v144 = v107 + CGRectGetMaxY(*(CGRect *)&v140);
LABEL_57:
              double v303 = v144;
              break;
            default:
              double v313 = v310;
              double v309 = *(double *)&v311;
              double v303 = v82;
              double v304 = v81;
              CGFloat v108 = v101;
              break;
          }
          v152 = [(CACLabeledGridOverlayView *)v66 zoomController];
          [v152 zoomFactor];
          double v302 = v153;

          v154 = [CACLabeledBadgeView alloc];
          v155 = [v84 label];
          uint64_t v156 = -[CACLabeledBadgeView initWithFrame:label:arrowOrientation:badgePresentation:badgeIndicator:](v154, "initWithFrame:label:arrowOrientation:badgePresentation:badgeIndicator:", v155, 0, v79, 0, v81, v82, *(double *)&v311, v310);
          v157 = v66;
          v114 = (void *)v156;

          objc_msgSend(v114, "systemLayoutSizeFittingSize:", v306, v305);
          CGFloat v159 = v158;
          double v301 = v158;
          double rectb = v160;
          v398.origin.CGFloat x = v108;
          v398.origin.CGFloat y = v91;
          v398.size.CGFloat width = v98;
          v398.size.CGFloat height = v95;
          double MinX = CGRectGetMinX(v398);
          double v162 = v82;
          CGFloat v163 = v95;
          CGFloat v164 = v162;
          v399.origin.CGFloat x = v323;
          v399.size.CGFloat height = v325;
          v399.origin.CGFloat y = v320;
          v399.size.CGFloat width = v327;
          double v299 = MinX - CGRectGetMinX(v399);
          v400.origin.CGFloat x = v108;
          v400.origin.CGFloat y = v91;
          v400.size.CGFloat width = v98;
          v400.size.CGFloat height = v163;
          double v165 = CGRectGetWidth(v400);
          v401.origin.CGFloat x = v81;
          v401.origin.CGFloat y = v164;
          v401.size.CGFloat width = v159;
          v401.size.CGFloat height = rectb;
          CGFloat v166 = v302 * (v165 - CGRectGetWidth(v401) * 0.5) + v299 * v302;
          v402.origin.CGFloat x = v108;
          v402.origin.CGFloat y = v91;
          v402.size.CGFloat width = v98;
          v402.size.CGFloat height = v163;
          double MinY = CGRectGetMinY(v402);
          v403.origin.CGFloat x = v323;
          v403.size.CGFloat height = v325;
          v403.origin.CGFloat y = v320;
          v403.size.CGFloat width = v327;
          double v300 = MinY - CGRectGetMinY(v403);
          v404.origin.CGFloat x = v108;
          v404.origin.CGFloat y = v91;
          v404.size.CGFloat width = v98;
          v404.size.CGFloat height = v163;
          double v168 = CGRectGetHeight(v404);
          v405.origin.CGFloat x = v166;
          double v82 = v164;
          v405.origin.CGFloat y = v164;
          v405.size.CGFloat width = v301;
          v405.size.CGFloat height = rectb;
          objc_msgSend(v114, "setFrame:", v166, v302 * (v168 - CGRectGetHeight(v405) * 0.5) + v300 * v302, v301, rectb);
          v169 = [(CACLabeledGridOverlayView *)v157 zoomedGridBadgeViews];
          [v169 addObject:v114];

          v406.origin.CGFloat x = v304;
          v406.origin.CGFloat y = v303;
          v406.size.CGFloat width = v309;
          v406.size.CGFloat height = v313;
          if (!CGRectIsEmpty(v406))
          {
            v170 = [CACLabeledBadgeView alloc];
            v171 = [v84 label];
            v172 = -[CACLabeledBadgeView initWithFrame:label:arrowOrientation:badgePresentation:badgeIndicator:](v170, "initWithFrame:label:arrowOrientation:badgePresentation:badgeIndicator:", v171, 0, v79, 0, v304, v303, v309, v313);

            v173 = [(CACLabeledGridOverlayView *)v322 outOfBoxBadgeViews];
            [v173 addObject:v172];
          }
          if ((v78 & 1) == 0) {
            char v78 = 1;
          }
          double v81 = v307;
        }
        else
        {
          v110 = [CACLabeledBadgeView alloc];
          v111 = [v84 label];
          uint64_t v112 = -[CACLabeledBadgeView initWithFrame:label:arrowOrientation:badgePresentation:badgeIndicator:](v110, "initWithFrame:label:arrowOrientation:badgePresentation:badgeIndicator:", v111, 0, v79, 0, v81, v82, *(double *)&v311, v310);
          v113 = v66;
          v114 = (void *)v112;

          objc_msgSend(v114, "systemLayoutSizeFittingSize:", v306, v305);
          double v116 = v115;
          CGFloat rect = v117;
          if (![(CACLabeledGridOverlayView *)v113 showsNumbersInTopLeft]) {
            goto LABEL_40;
          }
          v377.origin.CGFloat x = v89;
          v377.origin.CGFloat y = v91;
          v377.size.CGFloat width = v93;
          v377.size.CGFloat height = v95;
          double v118 = CGRectGetWidth(v377);
          v378.origin.CGFloat x = v81;
          v378.origin.CGFloat y = v82;
          v378.size.CGFloat width = v116;
          v378.size.CGFloat height = rect;
          if (v118 - CGRectGetWidth(v378) <= 10.0) {
            goto LABEL_40;
          }
          v379.origin.CGFloat x = v89;
          v379.origin.CGFloat y = v91;
          v379.size.CGFloat width = v98;
          v379.size.CGFloat height = v95;
          double v119 = CGRectGetHeight(v379);
          v380.origin.CGFloat x = v81;
          v380.origin.CGFloat y = v82;
          v380.size.CGFloat width = v116;
          v380.size.CGFloat height = rect;
          if (v119 - CGRectGetHeight(v380) > 10.0)
          {
            v381.size.CGFloat width = v98;
            double v120 = v82;
            v381.origin.CGFloat x = v89;
            v381.origin.CGFloat y = v91;
            CGFloat v121 = v381.size.width;
            CGFloat v122 = v95;
            v381.size.CGFloat height = v95;
            CGFloat v123 = v91;
            double v124 = CGRectGetMinX(v381) + 5.0;
            v382.origin.CGFloat x = v89;
            v382.origin.CGFloat y = v123;
            v382.size.CGFloat width = v121;
            v382.size.CGFloat height = v122;
            double v125 = CGRectGetMinY(v382) + 5.0;
            [(CACLabeledGridOverlayView *)v322 safeAreaInsets];
            if (v126 >= v125) {
              double v125 = v126;
            }
            v383.origin.CGFloat x = v89;
            v383.origin.CGFloat y = v123;
            v383.size.CGFloat width = v121;
            v383.size.CGFloat height = v122;
            double v127 = CGRectGetMaxY(v383);
            v384.origin.CGFloat x = v124;
            v384.origin.CGFloat y = v125;
            v384.size.CGFloat width = v116;
            v384.size.CGFloat height = rect;
            double v128 = v127 - CGRectGetHeight(v384);
            if (v128 >= v125) {
              double v129 = v125;
            }
            else {
              double v129 = v128;
            }
            double v130 = rect;
          }
          else
          {
LABEL_40:
            v385.origin.CGFloat x = v89;
            v385.origin.CGFloat y = v91;
            v385.size.CGFloat width = v98;
            v385.size.CGFloat height = v95;
            double v314 = CGRectGetMinX(v385);
            v386.origin.CGFloat x = v89;
            v386.origin.CGFloat y = v91;
            v386.size.CGFloat width = v98;
            v386.size.CGFloat height = v95;
            CGFloat v131 = CGRectGetWidth(v386);
            CGFloat v132 = v81;
            CGFloat v133 = v82;
            double v134 = v131;
            v387.origin.CGFloat x = v132;
            v387.origin.CGFloat y = v133;
            v387.size.CGFloat width = v116;
            v387.size.CGFloat height = rect;
            CGFloat v135 = v314 + (v134 - CGRectGetWidth(v387)) * 0.5;
            v388.origin.CGFloat x = v89;
            v388.origin.CGFloat y = v91;
            v388.size.CGFloat width = v98;
            v388.size.CGFloat height = v95;
            double v315 = CGRectGetMinY(v388);
            v389.origin.CGFloat x = v89;
            v389.origin.CGFloat y = v91;
            double v124 = v135;
            v389.size.CGFloat width = v98;
            v389.size.CGFloat height = v95;
            double v136 = CGRectGetHeight(v389);
            v390.origin.CGFloat x = v135;
            double v120 = v133;
            v390.origin.CGFloat y = v133;
            v390.size.CGFloat width = v116;
            v390.size.CGFloat height = rect;
            double v129 = v315 + (v136 - CGRectGetHeight(v390)) * 0.5;
            double v130 = rect;
          }
          objc_msgSend(v114, "setFrame:", v124, v129, v116, v130);
          v137 = [(CACLabeledGridOverlayView *)v322 badgesContainer];
          [v137 addSubview:v114];

          if (UIAccessibilityDarkerSystemColorsEnabled())
          {
            v138 = [(CACLabeledGridOverlayView *)v322 contrastBadgesContainer];
            v139 = [v114 contrastedCopy];
            [v138 addSubview:v139];
          }
          double v81 = v307;
          double v82 = v120;
        }

        v66 = v322;
      }
      v296 += v77;
      uint64_t v77 = [(NSMutableArray *)obj countByEnumeratingWithState:&v350 objects:v363 count:16];
    }
    while (v77);

    if (v78)
    {
      double v174 = CACZWLensInnerBorderWidth() + 1.0;
      v175 = [(CACLabeledGridOverlayView *)v322 zoomController];
      v176 = [v175 view];
      [(CACLabeledGridOverlayView *)v322 addSubview:v176];

      v177 = [(CACLabeledGridOverlayView *)v322 backdrop];
      [(CACLabeledGridOverlayView *)v322 bringSubviewToFront:v177];

      v178 = [(CACLabeledGridOverlayView *)v322 zoomController];
      v179 = [v178 lensChromeView];
      [v179 frame];
      double v181 = v180;
      double v183 = v182;
      double v185 = v184;
      double v187 = v186;

      double v188 = v174 + v181;
      double v189 = v174 + v183;
      if ((unint64_t)[v293 count] >= 2)
      {
        int v190 = 2;
        unint64_t v191 = 1;
        do
        {
          id v192 = -[CACLabeledGridOverlayView _newLineViewWithFrame:](v322, "_newLineViewWithFrame:", v188 + (v185 + v174 * -2.0) * (float)((float)(int)(v190 - 6 * (v191 / 3)) / 6.0), v189, 1.0, v187 + v174 * -2.0);
          [(CACLabeledGridOverlayView *)v322 addSubview:v192];

          ++v191;
          v190 += 2;
        }
        while ([v293 count] > v191);
      }
      if ((unint64_t)[v294 count] >= 2)
      {
        int v193 = 2;
        unint64_t v194 = 1;
        do
        {
          id v195 = -[CACLabeledGridOverlayView _newLineViewWithFrame:](v322, "_newLineViewWithFrame:", v188, v189 + (v187 + v174 * -2.0) * (float)((float)(int)(v193 - 6 * (v194 / 3)) / 6.0), v185 + v174 * -2.0, 1.0);
          [(CACLabeledGridOverlayView *)v322 addSubview:v195];

          ++v194;
          v193 += 2;
        }
        while ([v294 count] > v194);
      }
      long long v340 = 0u;
      long long v341 = 0u;
      long long v338 = 0u;
      long long v339 = 0u;
      id v328 = [(CACLabeledGridOverlayView *)v322 zoomedGridBadgeViews];
      uint64_t v196 = [v328 countByEnumeratingWithState:&v338 objects:v360 count:16];
      if (v196)
      {
        uint64_t v197 = v196;
        uint64_t v198 = 0;
        uint64_t v199 = *(void *)v339;
        double v200 = v187 - v174 * 2.0;
        double v201 = v185 - v174 * 2.0;
        do
        {
          uint64_t v202 = 0;
          uint64_t v203 = (2 * v198) | 1;
          do
          {
            if (*(void *)v339 != v199) {
              objc_enumerationMutation(v328);
            }
            v204 = *(void **)(*((void *)&v338 + 1) + 8 * v202);
            uint64_t v205 = (v198 + v202) / 3;
            double v206 = v200 * (float)((float)((float)((float)v205 * 2.0) + 1.0) / 6.0);
            double v207 = v201 * (float)((float)(v203 - 6 * v205) / 6.0);
            v208 = [(CACLabeledGridOverlayView *)v322 zoomController];
            v209 = [v208 lensChromeView];
            [v209 frame];
            double v211 = v207 + v174 + v210;

            v212 = [(CACLabeledGridOverlayView *)v322 zoomController];
            v213 = [v212 lensChromeView];
            [v213 frame];
            double v215 = v206 + v174 + v214;

            objc_msgSend(v204, "setCenter:", v211, v215);
            v216 = [(CACLabeledGridOverlayView *)v322 badgesContainer];
            [v216 addSubview:v204];

            if (UIAccessibilityDarkerSystemColorsEnabled())
            {
              v217 = [(CACLabeledGridOverlayView *)v322 contrastBadgesContainer];
              v218 = [v204 contrastedCopy];
              [v217 addSubview:v218];
            }
            ++v202;
            v203 += 2;
          }
          while (v197 != v202);
          uint64_t v197 = [v328 countByEnumeratingWithState:&v338 objects:v360 count:16];
          v198 += v202;
        }
        while (v197);
      }

      long long v336 = 0u;
      long long v337 = 0u;
      long long v334 = 0u;
      long long v335 = 0u;
      id v312 = v293;
      v219 = v322;
      uint64_t recta = [v312 countByEnumeratingWithState:&v334 objects:v359 count:16];
      if (recta)
      {
        float v220 = v323;
        uint64_t v316 = *(void *)v335;
        float v221 = v320;
        do
        {
          uint64_t v222 = 0;
          do
          {
            if (*(void *)v335 != v316) {
              objc_enumerationMutation(v312);
            }
            uint64_t v321 = v222;
            v223 = *(void **)(*((void *)&v334 + 1) + 8 * v222);
            long long v330 = 0u;
            long long v331 = 0u;
            long long v332 = 0u;
            long long v333 = 0u;
            id v324 = v294;
            uint64_t v224 = [v324 countByEnumeratingWithState:&v330 objects:v358 count:16];
            if (v224)
            {
              uint64_t v225 = v224;
              id v329 = *(id *)v331;
              float v226 = v221;
              do
              {
                for (uint64_t k = 0; k != v225; ++k)
                {
                  if (*(id *)v331 != v329) {
                    objc_enumerationMutation(v324);
                  }
                  v228 = *(void **)(*((void *)&v330 + 1) + 8 * k);
                  [v223 floatValue];
                  double v230 = truncf((float)(v220 + v229) * 0.5);
                  [v228 floatValue];
                  id v232 = -[CACLabeledGridOverlayView _newLineViewWithFrame:](v219, "_newLineViewWithFrame:", v230, (float)(truncf((float)(v226 + v231) * 0.5) + -2.0), 1.0, 5.0);
                  [v223 floatValue];
                  double v234 = (float)(truncf((float)(v220 + v233) * 0.5) + -2.0);
                  [v228 floatValue];
                  id v236 = -[CACLabeledGridOverlayView _newLineViewWithFrame:](v219, "_newLineViewWithFrame:", v234, truncf((float)(v226 + v235) * 0.5), 5.0, 1.0);
                  [v232 frame];
                  CGFloat v238 = v237;
                  CGFloat v240 = v239;
                  CGFloat v242 = v241;
                  CGFloat v244 = v243;
                  v245 = [(CACLabeledGridOverlayView *)v219 zoomController];
                  v246 = [v245 lensChromeView];
                  [v246 frame];
                  v411.origin.CGFloat x = v247;
                  v411.origin.CGFloat y = v248;
                  v411.size.CGFloat width = v249;
                  v411.size.CGFloat height = v250;
                  v407.origin.CGFloat x = v238;
                  v407.origin.CGFloat y = v240;
                  v407.size.CGFloat width = v242;
                  v407.size.CGFloat height = v244;
                  CGRect v408 = CGRectIntersection(v407, v411);
                  if (CGRectIsNull(v408))
                  {
                    [v236 frame];
                    CGFloat v252 = v251;
                    CGFloat v254 = v253;
                    CGFloat v256 = v255;
                    CGFloat v258 = v257;
                    v259 = [(CACLabeledGridOverlayView *)v219 zoomController];
                    [v259 lensChromeView];
                    v326 = v232;
                    v261 = uint64_t v260 = v225;
                    [v261 frame];
                    v412.origin.CGFloat x = v262;
                    v412.origin.CGFloat y = v263;
                    v412.size.CGFloat width = v264;
                    v412.size.CGFloat height = v265;
                    v409.origin.CGFloat x = v252;
                    v409.origin.CGFloat y = v254;
                    v409.size.CGFloat width = v256;
                    v409.size.CGFloat height = v258;
                    CGRect v410 = CGRectIntersection(v409, v412);
                    BOOL IsNull = CGRectIsNull(v410);

                    uint64_t v225 = v260;
                    id v232 = v326;

                    v219 = v322;
                    if (IsNull)
                    {
                      [(CACLabeledGridOverlayView *)v322 addSubview:v326];
                      [(CACLabeledGridOverlayView *)v322 addSubview:v236];
                    }
                  }
                  else
                  {
                  }
                  [v228 floatValue];
                  float v226 = v267;
                }
                uint64_t v225 = [v324 countByEnumeratingWithState:&v330 objects:v358 count:16];
              }
              while (v225);
            }

            [v223 floatValue];
            float v220 = v268;
            uint64_t v222 = v321 + 1;
          }
          while (v321 + 1 != recta);
          uint64_t recta = [v312 countByEnumeratingWithState:&v334 objects:v359 count:16];
        }
        while (recta);
      }

      [(CACLabeledGridOverlayView *)v219 setIsSmallEnoughForZooming:1];
      v269 = v293;
      v270 = v294;
      goto LABEL_116;
    }
  }
  else
  {
  }
  v269 = v293;
  [v293 removeLastObject];
  long long v348 = 0u;
  long long v349 = 0u;
  long long v346 = 0u;
  long long v347 = 0u;
  id v271 = v293;
  uint64_t v272 = [v271 countByEnumeratingWithState:&v346 objects:v362 count:16];
  v270 = v294;
  if (v272)
  {
    uint64_t v273 = v272;
    uint64_t v274 = *(void *)v347;
    do
    {
      for (uint64_t m = 0; m != v273; ++m)
      {
        if (*(void *)v347 != v274) {
          objc_enumerationMutation(v271);
        }
        [*(id *)(*((void *)&v346 + 1) + 8 * m) floatValue];
        id v277 = -[CACLabeledGridOverlayView _newLineViewWithFrame:](v322, "_newLineViewWithFrame:", v276, v320, 1.0, v325);
        [(CACLabeledGridOverlayView *)v322 addSubview:v277];
      }
      uint64_t v273 = [v271 countByEnumeratingWithState:&v346 objects:v362 count:16];
    }
    while (v273);
  }

  [v294 removeLastObject];
  long long v344 = 0u;
  long long v345 = 0u;
  long long v342 = 0u;
  long long v343 = 0u;
  id v278 = v294;
  uint64_t v279 = [v278 countByEnumeratingWithState:&v342 objects:v361 count:16];
  if (v279)
  {
    uint64_t v280 = v279;
    uint64_t v281 = *(void *)v343;
    do
    {
      for (uint64_t n = 0; n != v280; ++n)
      {
        if (*(void *)v343 != v281) {
          objc_enumerationMutation(v278);
        }
        [*(id *)(*((void *)&v342 + 1) + 8 * n) floatValue];
        id v284 = -[CACLabeledGridOverlayView _newLineViewWithFrame:](v322, "_newLineViewWithFrame:", v323, v283, v327, 1.0);
        [(CACLabeledGridOverlayView *)v322 addSubview:v284];
      }
      uint64_t v280 = [v278 countByEnumeratingWithState:&v342 objects:v361 count:16];
    }
    while (v280);
  }

  v219 = v322;
  [(CACLabeledGridOverlayView *)v322 setIsSmallEnoughForZooming:0];
  v285 = [(CACLabeledGridOverlayView *)v322 zoomController];
  v286 = [v285 view];
  [v286 removeFromSuperview];

LABEL_116:
  if (UIAccessibilityDarkerSystemColorsEnabled())
  {
    v287 = [(CACLabeledGridOverlayView *)v219 contrastBadgesContainer];
    [(CACLabeledGridOverlayView *)v219 addSubview:v287];
  }
  v288 = [(CACLabeledGridOverlayView *)v219 badgesContainer];
  [(CACLabeledGridOverlayView *)v219 addSubview:v288];
}

- (id)_newLineViewWithFrame:(CGRect)a3
{
  v3 = -[CACAdaptiveBackdropView initWithFrame:]([CACAdaptiveBackdropView alloc], "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  uint64_t v4 = [(CACAdaptiveBackdropView *)v3 layer];
  [v4 setCaptureOnly:0];

  return v3;
}

- (void)zoomOverRect:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  uint64_t v8 = [[CACZoomController alloc] initWithContainingView:self];
  [(CACLabeledGridOverlayView *)self setZoomController:v8];

  v9 = [(CACLabeledGridOverlayView *)self zoomController];
  [v9 hide];

  v10 = [(CACLabeledGridOverlayView *)self zoomController];
  objc_msgSend(v10, "moveZoomRegion:", x, y, width, height);

  id v11 = [(CACLabeledGridOverlayView *)self zoomController];
  [v11 show];
}

- (BOOL)showsNumbersInTopLeft
{
  return self->_showsNumbersInTopLeft;
}

- (void)setShowsNumbersInTopLeft:(BOOL)a3
{
  self->_showsNumbersInTopLeft = a3;
}

- (BOOL)showsElementsAsClickable
{
  return self->_showsElementsAsClickable;
}

- (void)setShowsElementsAsClickable:(BOOL)a3
{
  self->_showsElementsAsClickable = a3;
}

- (BOOL)isSmallEnoughForZooming
{
  return self->_isSmallEnoughForZooming;
}

- (void)setIsSmallEnoughForZooming:(BOOL)a3
{
  self->_isSmallEnoughForZooming = a3;
}

- (CACZoomController)zoomController
{
  return self->_zoomController;
}

- (void)setZoomController:(id)a3
{
}

- (CACAdaptiveBackdropView)backdrop
{
  return self->_backdrop;
}

- (void)setBackdrop:(id)a3
{
}

- (UIView)badgesContainer
{
  return self->_badgesContainer;
}

- (void)setBadgesContainer:(id)a3
{
}

- (UIView)contrastBadgesContainer
{
  return self->_contrastBadgesContainer;
}

- (void)setContrastBadgesContainer:(id)a3
{
}

- (NSMutableArray)outOfBoxBadgeViews
{
  return self->_outOfBoxBadgeViews;
}

- (void)setOutOfBoxBadgeViews:(id)a3
{
}

- (NSMutableArray)zoomedGridBadgeViews
{
  return self->_zoomedGridBadgeViews;
}

- (void)setZoomedGridBadgeViews:(id)a3
{
}

- (NSMutableArray)allBadgeViews
{
  return self->_allBadgeViews;
}

- (void)setAllBadgeViews:(id)a3
{
}

- (NSMutableArray)separatorViews
{
  return self->_separatorViews;
}

- (void)setSeparatorViews:(id)a3
{
}

- (NSMutableArray)dimmingViews
{
  return self->_dimmingViews;
}

- (void)setDimmingViews:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dimmingViews, 0);
  objc_storeStrong((id *)&self->_separatorViews, 0);
  objc_storeStrong((id *)&self->_allBadgeViews, 0);
  objc_storeStrong((id *)&self->_zoomedGridBadgeViews, 0);
  objc_storeStrong((id *)&self->_outOfBoxBadgeViews, 0);
  objc_storeStrong((id *)&self->_contrastBadgesContainer, 0);
  objc_storeStrong((id *)&self->_badgesContainer, 0);
  objc_storeStrong((id *)&self->_backdrop, 0);
  objc_storeStrong((id *)&self->_zoomController, 0);
  objc_storeStrong((id *)&self->_labeledElements, 0);
}

@end