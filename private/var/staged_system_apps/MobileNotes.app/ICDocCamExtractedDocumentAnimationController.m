@interface ICDocCamExtractedDocumentAnimationController
- (BOOL)isPresenting;
- (ICDocCamExtractedDocumentAnimationController)initWithPresentedController:(id)a3 presentingController:(id)a4 thumbnailView:(id)a5 duration:(double)a6 isPresenting:(BOOL)a7;
- (UIView)thumbnailView;
- (double)duration;
- (id)imageWithColor:(id)a3;
- (void)animateDismissalTransition:(id)a3;
- (void)animatePresentationOrDismissalTransition:(id)a3;
- (void)animateTransition:(id)a3;
- (void)setDuration:(double)a3;
- (void)setIsPresenting:(BOOL)a3;
- (void)setThumbnailView:(id)a3;
@end

@implementation ICDocCamExtractedDocumentAnimationController

- (ICDocCamExtractedDocumentAnimationController)initWithPresentedController:(id)a3 presentingController:(id)a4 thumbnailView:(id)a5 duration:(double)a6 isPresenting:(BOOL)a7
{
  BOOL v7 = a7;
  id v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)ICDocCamExtractedDocumentAnimationController;
  v11 = [(ICDocCamExtractedDocumentAnimationController *)&v14 init];
  v12 = v11;
  if (v11)
  {
    [(ICDocCamExtractedDocumentAnimationController *)v11 setDuration:a6];
    [(ICDocCamExtractedDocumentAnimationController *)v12 setIsPresenting:v7];
    [(ICDocCamExtractedDocumentAnimationController *)v12 setThumbnailView:v10];
  }

  return v12;
}

- (void)animateTransition:(id)a3
{
  id v13 = a3;
  v4 = [v13 viewControllerForKey:UITransitionContextFromViewControllerKey];
  v5 = [v13 viewControllerForKey:UITransitionContextToViewControllerKey];
  if ([(ICDocCamExtractedDocumentAnimationController *)self isPresenting]) {
    v6 = v5;
  }
  else {
    v6 = v4;
  }
  id v7 = v6;
  v8 = [v7 view];
  objc_opt_class();
  v9 = ICDynamicCast();
  id v10 = [v9 topViewController];
  v11 = [v10 view];

  if ([(ICDocCamExtractedDocumentAnimationController *)self isPresenting])
  {
    v12 = [v13 containerView];
    [v12 addSubview:v8];
  }
  [v13 finalFrameForViewController:v7];
  [v8 setFrame:];
  [v8 setNeedsDisplay];
  [v8 setNeedsLayout];
  [v8 layoutIfNeeded];
  [v11 setNeedsDisplay];
  [v11 setNeedsLayout];
  [v11 layoutIfNeeded];
  [(ICDocCamExtractedDocumentAnimationController *)self animatePresentationOrDismissalTransition:v13];
}

- (void)animatePresentationOrDismissalTransition:(id)a3
{
  id v4 = a3;
  v5 = +[ICQuickNoteSessionManager sharedManager];
  unsigned int v6 = [v5 isSecureScreenShowing];

  uint64_t v7 = [v4 viewControllerForKey:UITransitionContextFromViewControllerKey];
  v668 = v4;
  v8 = [v4 viewControllerForKey:UITransitionContextToViewControllerKey];
  objc_opt_class();
  v9 = ICDynamicCast();
  objc_opt_class();
  id v10 = ICDynamicCast();
  LODWORD(v5) = [(ICDocCamExtractedDocumentAnimationController *)self isPresenting];
  objc_opt_class();
  v659 = (void *)v7;
  if (v5)
  {
    v11 = ICDynamicCast();
    objc_opt_class();
    v12 = [v11 viewControllers];
    id v13 = [v12 objectAtIndexedSubscript:0];
    v665 = ICDynamicCast();
  }
  else
  {
    v11 = ICDynamicCast();
    objc_opt_class();
    objc_super v14 = [v11 viewControllers];
    v15 = [v14 objectAtIndexedSubscript:0];
    v16 = ICDynamicCast();

    v665 = v16;
    if (![v16 documentCount])
    {
      v35 = v668;
      [(ICDocCamExtractedDocumentAnimationController *)self animateDismissalTransition:v668];
      id v36 = v16;
      v37 = v659;
      goto LABEL_338;
    }
  }
  v619 = v9;
  if (v6)
  {
    v17 = +[ICQuickNoteSessionManager sharedManager];
    v18 = [v17 noteEditorViewController];

    v655 = v18;
    v647 = [v18 navigationController];
    BOOL v609 = 0;
    unsigned int v626 = 0;
    BOOL v606 = 0;
    unsigned int v19 = 0;
    v656 = 0;
    v662 = 0;
    v631 = 0;
    int v663 = 1;
    v20 = v665;
    goto LABEL_22;
  }
  unsigned int v21 = [(ICDocCamExtractedDocumentAnimationController *)self isPresenting];
  objc_opt_class();
  if (v21)
  {
    uint64_t v22 = ICDynamicCast();
    objc_opt_class();
    v23 = [v9 topViewController];
    uint64_t v24 = v22;
    uint64_t v25 = ICDynamicCast();

    v656 = (void *)v25;
    uint64_t v26 = v24 | v25;
    v20 = v665;
    if (!v26)
    {
      objc_opt_class();
      v27 = v659;
LABEL_11:
      v32 = [v27 presentingViewController];
      uint64_t v24 = ICDynamicCast();
    }
  }
  else
  {
    uint64_t v28 = ICDynamicCast();
    objc_opt_class();
    v29 = [v10 topViewController];
    uint64_t v24 = v28;
    uint64_t v30 = ICDynamicCast();

    v656 = (void *)v30;
    uint64_t v31 = v24 | v30;
    v20 = v665;
    if (!v31)
    {
      objc_opt_class();
      v27 = v8;
      goto LABEL_11;
    }
  }
  v662 = (void *)v24;
  if (v24)
  {
    v33 = [v24 ic_viewControllerManager];
    BOOL v34 = [v33 noteContainerViewMode] == (id)1;
  }
  else
  {
    BOOL v34 = 0;
  }
  if (v656)
  {
    v38 = [v656 ic_viewControllerManager];
    BOOL v34 = [v38 noteContainerViewMode] == (id)1;
  }
  else
  {
    v656 = 0;
  }
  BOOL v606 = v34;
  if (v662)
  {
    v39 = [v662 ic_viewControllerManager];
    v655 = [v39 noteEditorViewController];
    v647 = [v655 navigationController];
    v40 = [v39 currentNoteBrowseViewController];
    unsigned int v19 = [v40 ic_isViewVisible];

    v631 = v39;
    v41 = [v39 folderListViewController];
    unsigned int v626 = [v41 ic_isViewVisible];

    BOOL v609 = [v662 displayMode] == (id)4;
    int v663 = 1;
  }
  else
  {
    v631 = [v656 ic_viewControllerManager];
    int v663 = 0;
    BOOL v609 = 0;
    unsigned int v626 = 0;
    unsigned int v19 = 0;
    v647 = 0;
    v655 = 0;
    v662 = 0;
  }
LABEL_22:
  id v666 = objc_alloc_init((Class)NSMutableArray);
  id v42 = objc_alloc_init((Class)NSMutableArray);
  id v658 = objc_alloc_init((Class)NSMutableArray);
  id v664 = objc_alloc_init((Class)NSMutableArray);
  v657 = v42;
  if ([(ICDocCamExtractedDocumentAnimationController *)self isPresenting])
  {
    v43 = [v8 view];
    v44 = v666;
  }
  else
  {
    v43 = [v659 view];
    v44 = v42;
  }
  [v44 addObject:v43];

  v45 = [v20 indexPathForCurrentDocument];
  v654 = [v20 croppedAndFilteredmageForDocumentAtIndex:[v45 item]];
  v615 = v45;
  unsigned int v637 = v6;
  if ([(ICDocCamExtractedDocumentAnimationController *)self isPresenting]) {
    [v20 zoomTargetForIndexPath:v45];
  }
  else {
    [v20 imageRectWithZoomAndPanForIndexPath:v45];
  }
  double v629 = v47;
  double v630 = v46;
  double v644 = v49;
  double v645 = v48;
  v50 = [v655 ic_windowScene];
  v51 = [v50 statusBarManager];

  v616 = v10;
  v617 = v8;
  v646 = v11;
  double x = CGPointZero.x;
  double y = CGPointZero.y;
  unsigned int v620 = v19;
  v653 = v51;
  double width = CGRectNull.size.width;
  double height = CGRectNull.size.height;
  double v578 = CGRectNull.origin.x;
  double v582 = CGRectNull.origin.y;
  if (v663)
  {
    objc_opt_class();
    v52 = [(ICDocCamExtractedDocumentAnimationController *)self thumbnailView];
    v53 = ICDynamicCast();

    objc_opt_class();
    v54 = [v53 superview];
    v55 = ICDynamicCast();

    [v55 bounds];
    double v57 = v56;
    double v59 = v58;
    double v61 = v60;
    double v63 = v62;
    v64 = [v662 view];
    v598 = v55;
    [v55 convertRect:v64 toView:v57];
    CGFloat v635 = v65;
    CGFloat v67 = v66;
    CGFloat v69 = v68;
    CGFloat v71 = v70;

    v72 = [(ICDocCamExtractedDocumentAnimationController *)self thumbnailView];
    [v72 bounds];
    double v74 = v73;
    double v76 = v75;
    double v78 = v77;
    double v80 = v79;

    v81 = [v53 imageView];
    v82 = [(ICDocCamExtractedDocumentAnimationController *)self thumbnailView];
    v83 = [v662 view];
    [v82 convertRect:v83 toView:v74];
    double v85 = v84;
    double v87 = v86;
    double v89 = v88;
    double v91 = v90;

    [v654 size];
    double v93 = v92;
    [v654 size];
    double v95 = v93 / v94;
    double v96 = v89 / v91;
    double v648 = v95;
    BOOL v97 = v95 > ICGalleryAttachmentMaxAspectRatio || v95 < ICGalleryAttachmentMinAspectRatio;
    v98 = v658;
    double v660 = v87;
    CGFloat v618 = v91;
    double v624 = v85;
    double v625 = v89;
    BOOL v586 = v97;
    if (+[NSParagraphStyle ic_isRTL])
    {
      double v642 = v91;
      double v643 = v89;
      double v639 = v85;
      if (v97)
      {
        if (v96 > 1.0)
        {
          double v642 = v91;
          double v643 = v91 * v648;
          double v639 = v85 + v89 - v91 * v648;
        }
        else
        {
          double v639 = v85;
          double v642 = v89 / v648;
          double v643 = v89;
        }
      }
      v722.origin.double x = v635;
      v722.origin.double y = v67;
      v722.size.double width = v69;
      v722.size.double height = v71;
      v732.origin.double x = v85;
      v732.origin.double y = v87;
      v732.size.double width = v89;
      v732.size.double height = v91;
      if (!CGRectIntersectsRect(v722, v732))
      {
        r1 = 0;
        v636 = 0;
        v649 = 0;
        double v568 = CGPointZero.x;
        double v569 = y;
        double v565 = v582;
        double v566 = height;
        double v567 = CGRectNull.origin.x;
        double v576 = CGPointZero.x;
        double v577 = y;
        double v574 = width;
        double v575 = height;
        double v572 = v582;
        double v570 = width;
        double v571 = CGRectNull.origin.x;
        goto LABEL_202;
      }
      v723.origin.double x = v635;
      v723.origin.double y = v67;
      v723.size.double width = v69;
      v723.size.double height = v71;
      v733.origin.double x = v85;
      v733.origin.double y = v87;
      v733.size.double width = v89;
      v733.size.double height = v91;
      CGRect v724 = CGRectIntersection(v723, v733);
      double v102 = v724.origin.x;
      double v103 = v724.size.width;
      double v104 = v724.size.height;
      unsigned int v105 = [(ICDocCamExtractedDocumentAnimationController *)self isPresenting];
      if (v105) {
        double v106 = y;
      }
      else {
        double v106 = 0.0;
      }
      double v577 = v106;
      if (v105) {
        double v107 = CGPointZero.x;
      }
      else {
        double v107 = v102 - v639;
      }
      if (v105) {
        double v108 = 0.0;
      }
      else {
        double v108 = y;
      }
      if (v105) {
        double v109 = v102 - v639;
      }
      else {
        double v109 = CGPointZero.x;
      }
      if (v105) {
        double v110 = v644;
      }
      else {
        double v110 = v104;
      }
      double v575 = v110;
      double v576 = v107;
      if (v105) {
        double v111 = v645;
      }
      else {
        double v111 = v103;
      }
      double v574 = v111;
      if (v105) {
        double v112 = v104;
      }
      else {
        double v112 = v644;
      }
      if (v105) {
        double v113 = v103;
      }
      else {
        double v113 = v645;
      }
      v114 = +[CALayer layer];
      [v114 setAnchorPoint:0.0, 0.0];
      [v114 setMasksToBounds:1];
      if (v97)
      {
        double v588 = v113;
        id v115 = +[UIImage imageNamed:@"gallery_fade_gradient"];
        double v116 = v648;
        v546 = v53;
        double v633 = v112;
        if (v648 > 1.0)
        {
          uint64_t v117 = +[UIImage ic_orientedImageFromImage:toOrientation:](UIImage, "ic_orientedImageFromImage:toOrientation:", v115, 3, v648);

          id v115 = (id)v117;
        }
        v118 = +[CALayer layer];
        [v118 setAnchorPoint:0.0, 0.0];
        [v118 setContents:[v115 ic_CGImage]];
        v119 = +[CALayer layer];
        [v119 setAnchorPoint:0.0, 0.0];
        id v120 = +[UIColor whiteColor];
        objc_msgSend(v119, "setBackgroundColor:", objc_msgSend(v120, "CGColor"));

        r1 = v119;
        [v114 addSublayer:v119];
        v636 = v118;
        [v114 addSublayer:v118];
        double v121 = v104 * 0.1;
        if (v648 > 1.0) {
          double v121 = v625 * 0.055;
        }
        double v122 = round(v121);
        double v592 = v108;
        if (v648 > 1.0)
        {
          double v583 = v109;
          v20 = v665;
          if (v102 == v624 && v103 < v625)
          {
            double v189 = 0.0;
            double v190 = v122 + 0.0;
            double v191 = v122;
            CGFloat v192 = v618;
          }
          else
          {
            BOOL v200 = v103 < v625;
            BOOL v201 = v102 > v624;
            double v189 = v103 - v625;
            double v190 = v103 - v625 + v122;
            if (v201 && v200) {
              double v191 = v103 - v625 + v122;
            }
            else {
              double v191 = v122;
            }
            CGFloat v192 = v618;
            if (!v201 || !v200) {
              CGFloat v192 = v104;
            }
          }
          double v651 = v192;
          double v87 = v660;
          double v202 = v103 - v191;
          unsigned int v203 = [(ICDocCamExtractedDocumentAnimationController *)self isPresenting];
          double v204 = v577;
          if (!v203) {
            double v204 = 0.0;
          }
          double v601 = v204;
          double v205 = v576;
          if (!v203) {
            double v205 = v190;
          }
          double v579 = v205;
          if (v203) {
            double v206 = v575;
          }
          else {
            double v206 = v104;
          }
          double v207 = v574;
          if (!v203) {
            double v207 = v202;
          }
          double width = v207;
          double height = v206;
          if (v203) {
            double v142 = 0.0;
          }
          else {
            double v142 = y;
          }
          if (v203) {
            double v143 = v190;
          }
          else {
            double v143 = CGPointZero.x;
          }
          double v144 = v588;
          if (v203) {
            double v208 = y;
          }
          else {
            double v208 = 0.0;
          }
          if (v203) {
            double v209 = CGPointZero.x;
          }
          else {
            double v209 = v189;
          }
          double v568 = v209;
          double v569 = v208;
          if (v203) {
            double v210 = 0.0;
          }
          else {
            double v210 = v122;
          }
          double v570 = v210;
          if (v203) {
            double v211 = v575;
          }
          else {
            double v211 = v651;
          }
          if (v203) {
            double v150 = v189;
          }
          else {
            double v150 = CGPointZero.x;
          }
          double v566 = v211;
          double v567 = 0.0;
          if (!v203) {
            double v122 = 0.0;
          }
          double v565 = 0.0;
          double v133 = v142;
          double v149 = v583;
        }
        else
        {
          TSDRectGetMaxPoint();
          TSDRectWithPoints();
          double v613 = v123;
          double v125 = v124;
          double v127 = v126;
          double v129 = v128;
          TSDRectWithPoints();
          double v131 = v130;
          double v133 = v132;
          double v122 = v134;
          double v650 = v135;
          unsigned int v136 = [(ICDocCamExtractedDocumentAnimationController *)self isPresenting];
          double v137 = v108 + v633;
          double v138 = v577;
          if (!v136) {
            double v138 = v125;
          }
          double v601 = v138;
          double v139 = v576;
          if (!v136) {
            double v139 = v613;
          }
          double v579 = v139;
          if (v136) {
            double v140 = v575;
          }
          else {
            double v140 = v129;
          }
          double height = v140;
          if (v136) {
            double v141 = v574;
          }
          else {
            double v141 = v127;
          }
          double width = v141;
          if (v136) {
            double v142 = v125;
          }
          else {
            double v142 = v108;
          }
          if (v136) {
            double v143 = v613;
          }
          else {
            double v143 = v109;
          }
          double v144 = v588;
          if (v136) {
            double v145 = v575;
          }
          else {
            double v145 = v133;
          }
          if (v136) {
            double v146 = 0.0;
          }
          else {
            double v146 = v131;
          }
          double v568 = v146;
          double v569 = v145;
          double v565 = 0.0;
          if (v136) {
            double v147 = v574;
          }
          else {
            double v147 = v122;
          }
          double v570 = v147;
          if (v136) {
            double v148 = 0.0;
          }
          else {
            double v148 = v650;
          }
          double v566 = v148;
          double v567 = 0.0;
          if (!v136) {
            double v133 = v137;
          }
          double v149 = v109;
          if (v136) {
            double v150 = v131;
          }
          else {
            double v150 = v109;
          }
          double v151 = 0.0;
          if (v136) {
            double v151 = v650;
          }
          else {
            double v122 = v588;
          }
          double v651 = v151;
          v20 = v665;
          double v87 = v660;
        }
        [r1 setPosition:v143, v142];
        double v582 = 0.0;
        [r1 setBounds:];
        [v118 setPosition:v150, v133];
        [v118 setBounds:0.0, 0.0, v122, v651];
        [v114 setPosition:v149, v592];
        [v114 setBounds:0.0, 0.0, v144, v633];
        double x = v579;
        double y = v601;
        double v578 = 0.0;
        goto LABEL_200;
      }
      v185 = +[UIColor blackColor];
      v186 = [(ICDocCamExtractedDocumentAnimationController *)self imageWithColor:v185];

      id v115 = v186;
      [v114 setContents:[v115 CGImage]];
      [v114 setBounds:0.0, 0.0, v113, v112];
      [v114 setPosition:v109, v108];
      r1 = 0;
      v636 = 0;
      double v568 = CGPointZero.x;
      double v569 = y;
      double v570 = width;
      double v565 = v582;
      double v566 = height;
      double v567 = CGRectNull.origin.x;
LABEL_146:
      v20 = v665;
      double v87 = v660;
LABEL_201:
      v649 = v114;

      double v571 = 0.0;
      double v572 = 0.0;
LABEL_202:
      v218 = [v20 pageViewController];
      v219 = [v218 view];
      [v219 setAlpha:0.0];

      [v81 setAlpha:0.0];
      LODWORD(v218) = [(ICDocCamExtractedDocumentAnimationController *)self isPresenting];
      id v220 = objc_alloc((Class)UIImageView);
      v614 = v81;
      if (v218)
      {
        id v221 = [v220 initWithFrame:v639, v87, v643, v642];
        v222 = [v668 containerView];
        [v222 addSubview:v221];

        id v223 = v221;
        [v221 setContentMode:1];
        [v221 setImage:v654];
        [v221 setClipsToBounds:1];
        [v221 setFrame:v639, v87, v643, v642];
        v632 = v221;
        if (v649)
        {
          v224 = [v221 layer];
          [v224 setMask:v649];

          id v223 = v221;
        }
        v225 = v658;
      }
      else
      {
        id v226 = [v220 initWithFrame:v630, v629, v645, v644];
        v227 = [v668 containerView];
        [v227 addSubview:v226];

        id v223 = v226;
        [v226 setContentMode:1];
        [v226 setImage:v654];
        [v226 setClipsToBounds:1];
        [v226 setFrame:v630, v629, v645, v644];
        v632 = v226;
        if (v649)
        {
          v228 = [v226 layer];
          [v228 setMask:v649];

          id v223 = v226;
        }
        v225 = v664;
      }
      [v225 addObject:v223];
      v229 = [v647 toolbar];
      v230 = [v20 traitCollection];
      id v231 = [v230 horizontalSizeClass];
      v232 = (char *)[v230 verticalSizeClass];
      v595 = v230;
      if (v6)
      {
        v233 = [v647 navigationBar];
        v234 = v647;
        goto LABEL_218;
      }
      if (v231 == (id)1 && (unint64_t)(v232 - 1) <= 1)
      {
        v234 = v647;
        if (!v606)
        {
          v236 = [v662 viewControllerForColumn:0];
          v233 = [v236 navigationBar];

LABEL_218:
          v607 = v233;
          v237 = [v233 window];
          v238 = [v237 windowScene];
          v239 = [v238 statusBarManager];

          v603 = v239;
          if (([v239 isStatusBarHidden] & 1) == 0)
          {
            id v240 = objc_alloc((Class)UIView);
            [v239 statusBarFrame];
            id v241 = [v240 initWithFrame:];
            v242 = +[UIColor systemBackgroundColor];
            [v241 setBackgroundColor:v242];

            [v241 setAccessibilityLabel:@"noteEditorStatusBarBackground"];
            [v241 setTranslatesAutoresizingMaskIntoConstraints:0];
            [v241 setHidden:[v239 isStatusBarHidden]];
            v243 = [v668 containerView];
            [v243 addSubview:v241];

            [v658 addObject:v241];
          }
          if ((v6 & 1) != 0 || ((v620 | v626) & 1) == 0)
          {
            double v273 = 0.0;
            double v257 = 0.0;
            if (([v239 isStatusBarHidden] & 1) == 0)
            {
              v279 = [v607 window];
              v280 = [v279 windowScene];
              sub_1000F01D0(v280);
              double v257 = v281;
            }
            [v607 bounds];
            double v259 = v282;
            double v261 = v283;
            [v229 frame];
            double v551 = v285;
            double v554 = v284;
            double v548 = v286;
            double v278 = v287;
          }
          else
          {
            v244 = [v662 view];
            [v607 frame];
            double v246 = v245;
            double v248 = v247;
            double v250 = v249;
            double v252 = v251;
            v253 = [v234 view];
            [v244 convertRect:v253 fromView:v246];
            double v255 = v254;
            double v257 = v256;
            double v259 = v258;
            double v261 = v260;

            v262 = [v662 view];
            [v229 frame];
            double v264 = v263;
            double v266 = v265;
            double v268 = v267;
            double v270 = v269;
            v271 = [v234 view];
            double v272 = v270;
            double v273 = v255;
            [v262 convertRect:v271 fromView:v264];
            double v551 = v275;
            double v554 = v274;
            double v548 = v276;
            double v278 = v277;
          }
          [v229 bounds];
          double v589 = v288;
          double v561 = v290;
          double v563 = v289;
          double v292 = v291;
          v293 = [v229 _backgroundView];

          v587 = self;
          if (v293)
          {
            v294 = [v229 _backgroundView];
            [v294 bounds];
            double v296 = v295;

            if (v278 < v296) {
              double v278 = v296;
            }
            double v558 = v278;
            v297 = [v229 _backgroundView];
            [v297 bounds];
            double v299 = v298;

            if (v292 < v299) {
              double v292 = v299;
            }
          }
          else
          {
            double v558 = v278;
          }
          double v556 = v292;
          id v300 = [objc_alloc((Class)UIView) initWithFrame:v273, v257, v259, v261];
          [v300 setBackgroundColor:0];
          [v300 setAccessibilityLabel:@"fakeNoteEditorNavBarBackground"];
          [v300 setTranslatesAutoresizingMaskIntoConstraints:0];
          v301 = [v668 containerView];
          [v301 addSubview:v300];

          [v607 bounds];
          double left = UIEdgeInsetsZero.left;
          double bottom = UIEdgeInsetsZero.bottom;
          double right = UIEdgeInsetsZero.right;
          v305 = [v607 resizableSnapshotViewFromRect:1];
          [v305 setFrame:v273, v257, v259, v261];
          [v305 setTranslatesAutoresizingMaskIntoConstraints:0];
          [v305 setAccessibilityLabel:@"fakeNoteEditorNavBarView"];
          [v305 setTranslatesAutoresizingMaskIntoConstraints:0];
          v306 = [v668 containerView];
          [v306 addSubview:v305];

          id v307 = [objc_alloc((Class)UIView) initWithFrame:v554, v551, v548, v558];
          [v307 setBackgroundColor:0];
          [v307 setAccessibilityLabel:@"fakeNoteEditorToolbarBackground"];
          [v307 setTranslatesAutoresizingMaskIntoConstraints:0];
          [v307 setHidden:[v229 isHidden]];
          v308 = [v668 containerView];
          [v308 addSubview:v307];

          double v309 = v589;
          double v311 = v561;
          double v310 = v563;
          double v590 = left;
          double v562 = right;
          double v564 = bottom;
          v312 = [v229 resizableSnapshotViewFromRect:1 afterScreenUpdates:v309 withCapInsets:v310, v311, v556, UIEdgeInsetsZero.top, left, bottom, right];
          [v312 setFrame:v554, v551, v548, v558];
          [v312 setAccessibilityLabel:@"fakeNoteEditorToolbarView"];
          [v312 setTranslatesAutoresizingMaskIntoConstraints:0];
          [v312 setHidden:[v229 isHidden]];
          v313 = [v668 containerView];
          [v313 addSubview:v312];

          [v658 addObject:v300];
          if (v305) {
            [v658 addObject:v305];
          }
          CGFloat v99 = v660;
          if (v307) {
            [v658 addObject:v307];
          }
          if (v312) {
            [v658 addObject:v312];
          }
          if (![(ICDocCamExtractedDocumentAnimationController *)v587 isPresenting])
          {
            [v666 addObject:v300];
            if (v305) {
              [v666 addObject:v305];
            }
            if (v307) {
              [v666 addObject:v307];
            }
            if (v312) {
              [v666 addObject:v312];
            }
          }
          if (((v637 ^ 1) & (v626 | v620)) != 1)
          {
            v320 = 0;
            v322 = v53;
            v319 = 0;
            v323 = 0;
            v324 = 0;
            v610 = 0;
            v638 = 0;
LABEL_281:

            v101 = v668;
            v11 = v646;
            v20 = v665;
            self = v587;
            v51 = v653;
            v100 = v657;
            goto LABEL_282;
          }
          id v557 = v300;
          v547 = v53;
          v545 = v229;
          if (v609)
          {
            v314 = [v631 folderListViewController];
            v315 = [v314 navigationController];

            v555 = [v315 navigationBar];
            v638 = v315;
            v316 = v315;
            id v300 = v557;
            v559 = [v316 toolbar];
            v317 = [v631 currentNoteBrowseViewController];
            v318 = [v317 navigationController];

            v319 = [v318 navigationBar];
            v610 = v318;
            v320 = [v318 toolbar];
            v321 = v662;
            if (!v620)
            {
LABEL_268:
              if (v626)
              {
                id v627 = v320;
                v385 = [v321 view];
                [v555 frame];
                double v387 = v386;
                double v389 = v388;
                double v391 = v390;
                double v393 = v392;
                v394 = [v555 superview];
                [v385 convertRect:v394 fromView:v387];
                double v396 = v395;
                double v398 = v397;
                double v400 = v399;
                double v402 = v401;

                v403 = [v321 view];
                [v559 frame];
                double v405 = v404;
                double v407 = v406;
                double v409 = v408;
                double v411 = v410;
                v412 = [v559 superview];
                [v403 convertRect:v412 fromView:v405];
                double v550 = v414;
                double v553 = v413;
                double v544 = v415;
                double v417 = v416;

                [v559 bounds];
                double v540 = v419;
                double v542 = v418;
                double v538 = v420;
                double v422 = v421;
                v423 = [v559 _backgroundView];

                v622 = v319;
                if (v423)
                {
                  v424 = [v559 _backgroundView];
                  [v424 bounds];
                  double v426 = v425;

                  if (v422 < v426) {
                    double v422 = v426;
                  }
                  double v534 = v422;
                  v427 = [v559 _backgroundView];
                  [v427 bounds];
                  double v429 = v428;

                  if (v417 < v429) {
                    double v417 = v429;
                  }
                  double v536 = v417;
                  v430 = v559;
                }
                else
                {
                  v430 = v559;
                  double v534 = v422;
                  double v536 = v417;
                }
                id v431 = [objc_alloc((Class)UIView) initWithFrame:v396, v398, v400, v402];
                [v431 setBackgroundColor:0];
                [v431 setAccessibilityLabel:@"fakeFolderListNavBarBackground"];
                [v431 setTranslatesAutoresizingMaskIntoConstraints:0];
                [v431 setHidden:[v555 isHidden]];
                v432 = [v668 containerView];
                [v432 addSubview:v431];

                [v555 bounds];
                v433 = [v555 resizableSnapshotViewFromRect:1];
                [v433 setFrame:v396, v398, v400, v402];
                [v433 setAccessibilityLabel:@"fakeFolderListNavBarView"];
                [v433 setTranslatesAutoresizingMaskIntoConstraints:0];
                [v433 setHidden:[v555 isHidden]];
                v434 = [v668 containerView];
                [v434 addSubview:v433];

                [v430 resizableSnapshotViewFromRect:1 withCapInsets:UIEdgeInsetsZero.top v542, v540, v538, v534, v590, v564, v562];
                v435 = v430;
                v436 = v560 = v430;
                [v436 setFrame:v553, v550, v544, v536];
                [v436 setAccessibilityLabel:@"fakeFolderListToolbarView"];
                [v436 setTranslatesAutoresizingMaskIntoConstraints:0];
                [v436 setHidden:[v435 isHidden]];
                v437 = [v668 containerView];
                [v437 addSubview:v436];

                [v658 addObject:v431];
                [v658 addObject:v433];
                [v658 addObject:v436];
                if ([(ICDocCamExtractedDocumentAnimationController *)v587 isPresenting]) {
                  v438 = v657;
                }
                else {
                  v438 = v666;
                }
                [v438 addObject:v431];
                [v438 addObject:v433];
                [v438 addObject:v436];

                v324 = v555;
                v98 = v658;
                CGFloat v99 = v660;
                v322 = v547;
                v229 = v545;
                id v300 = v557;
                v323 = v560;
                v319 = v622;
                v320 = v627;
              }
              else
              {
                v322 = v547;
                v229 = v545;
                v324 = v555;
                v323 = v559;
              }
              goto LABEL_281;
            }
          }
          else
          {
            if (v626)
            {
              v325 = [v631 folderListViewController];
              v326 = [v325 navigationController];

              uint64_t v327 = [v326 navigationBar];
              v638 = v326;
              uint64_t v328 = [v326 toolbar];
            }
            else
            {
              uint64_t v328 = 0;
              uint64_t v327 = 0;
              v638 = 0;
            }
            v559 = (void *)v328;
            v555 = (void *)v327;
            if (!v620)
            {
              v610 = 0;
              v319 = 0;
              v320 = 0;
              v321 = v662;
              goto LABEL_268;
            }
            v329 = [v631 currentNoteBrowseViewController];
            v330 = [v329 navigationController];

            v319 = [v330 navigationBar];
            v610 = v330;
            v320 = [v330 toolbar];
            v321 = v662;
          }
          v331 = v320;
          v332 = [v321 view];
          [v319 frame];
          double v334 = v333;
          double v336 = v335;
          double v338 = v337;
          double v340 = v339;
          v341 = [v319 superview];
          [v332 convertRect:v341 fromView:v334 toView:v336];
          double v343 = v342;
          double v345 = v344;
          double v347 = v346;
          double v349 = v348;

          v350 = [v321 view];
          [v331 frame];
          double v352 = v351;
          double v354 = v353;
          double v356 = v355;
          double v358 = v357;
          v359 = [v331 superview];
          [v350 convertRect:v359 fromView:v352 toView:v354];
          double v621 = v360;
          double v549 = v362;
          double v552 = v361;
          double v364 = v363;

          [v331 bounds];
          double v541 = v366;
          double v543 = v365;
          double v539 = v367;
          double v369 = v368;
          v370 = [v331 _backgroundView];

          if (v370)
          {
            v371 = [v331 _backgroundView];
            [v371 bounds];
            double v373 = v372;

            if (v369 < v373) {
              double v369 = v373;
            }
            double v535 = v369;
            v374 = [v331 _backgroundView];
            [v374 bounds];
            double v376 = v375;

            if (v364 < v376) {
              double v364 = v376;
            }
            double v537 = v364;
          }
          else
          {
            double v535 = v369;
            double v537 = v364;
          }
          id v377 = [objc_alloc((Class)UIView) initWithFrame:v343, v345, v347, v349];
          [v377 setBackgroundColor:0];
          [v377 setAccessibilityLabel:@"fakeNoteListNavBarBackground"];
          [v377 setTranslatesAutoresizingMaskIntoConstraints:0];
          [v377 setHidden:[v319 isHidden]];
          v378 = [v668 containerView];
          [v378 addSubview:v377];

          [v319 bounds];
          v379 = [v319 resizableSnapshotViewFromRect:1];
          [v379 setFrame:v343, v345, v347, v349];
          [v379 setTranslatesAutoresizingMaskIntoConstraints:0];
          [v379 setAccessibilityLabel:@"fakeNoteListNavBarView"];
          [v379 setTranslatesAutoresizingMaskIntoConstraints:0];
          [v379 setHidden:[v319 isHidden]];
          [v668 containerView];
          v381 = v380 = v319;
          [v381 addSubview:v379];

          v382 = [v331 resizableSnapshotViewFromRect:1 afterScreenUpdates:v543 withCapInsets:v541, v539, v535, UIEdgeInsetsZero.top, v590, v564, v562];
          [v382 setFrame:v621, v552, v549, v537];
          [v382 setAccessibilityLabel:@"fakeNoteListToolbarView"];
          [v382 setTranslatesAutoresizingMaskIntoConstraints:0];
          [v382 setHidden:[v331 isHidden]];
          v383 = [v668 containerView];
          [v383 addSubview:v382];

          [v658 addObject:v377];
          [v658 addObject:v379];
          [v658 addObject:v382];
          if ([(ICDocCamExtractedDocumentAnimationController *)v587 isPresenting]) {
            v384 = v657;
          }
          else {
            v384 = v666;
          }
          [v384 addObject:v377];
          [v384 addObject:v379];

          v319 = v380;
          v98 = v658;
          v321 = v662;
          CGFloat v99 = v660;
          id v300 = v557;
          v320 = v331;
          goto LABEL_268;
        }
        v235 = v619;
      }
      else
      {
        v234 = v647;
        v235 = v647;
      }
      v233 = [v235 navigationBar];
      goto LABEL_218;
    }
    double v642 = v91;
    double v643 = v89;
    if (v97)
    {
      if (v96 > 1.0)
      {
        double v642 = v91;
        double v643 = v91 * v648;
      }
      else
      {
        double v642 = v89 / v648;
        double v643 = v89;
      }
    }
    v725.origin.double x = v635;
    v725.origin.double y = v67;
    v725.size.double width = v69;
    v725.size.double height = v71;
    v734.origin.double x = v85;
    v734.origin.double y = v87;
    v734.size.double width = v89;
    v734.size.double height = v91;
    if (!CGRectIntersectsRect(v725, v734))
    {
      r1 = 0;
      v636 = 0;
      v649 = 0;
      double v568 = CGPointZero.x;
      double v569 = y;
      double v565 = v582;
      double v566 = height;
      double v567 = CGRectNull.origin.x;
      double v576 = CGPointZero.x;
      double v577 = y;
      double v574 = width;
      double v575 = height;
      double v572 = v582;
      double v570 = width;
      double v571 = CGRectNull.origin.x;
      double v639 = v85;
      goto LABEL_202;
    }
    v726.origin.double x = v635;
    v726.origin.double y = v67;
    v726.size.double width = v69;
    v726.size.double height = v71;
    v735.origin.double x = v85;
    v735.origin.double y = v87;
    v735.size.double width = v89;
    v735.size.double height = v91;
    CGRect v727 = CGRectIntersection(v726, v735);
    double v152 = v727.origin.x;
    double v153 = v727.size.width;
    double v154 = v727.size.height;
    unsigned int v155 = [(ICDocCamExtractedDocumentAnimationController *)self isPresenting];
    double v593 = v152;
    double v156 = v152 - v85;
    if (v155) {
      double v157 = y;
    }
    else {
      double v157 = 0.0;
    }
    double v577 = v157;
    if (v155) {
      double v158 = CGPointZero.x;
    }
    else {
      double v158 = v152 - v85;
    }
    if (v155) {
      double v159 = 0.0;
    }
    else {
      double v159 = y;
    }
    if (v155) {
      double v160 = v156;
    }
    else {
      double v160 = CGPointZero.x;
    }
    if (v155) {
      double v161 = v644;
    }
    else {
      double v161 = v154;
    }
    double v575 = v161;
    double v576 = v158;
    if (v155) {
      double v162 = v645;
    }
    else {
      double v162 = v153;
    }
    double v574 = v162;
    if (v155) {
      double v163 = v154;
    }
    else {
      double v163 = v644;
    }
    double v640 = v153;
    if (!v155) {
      double v153 = v645;
    }
    v114 = +[CALayer layer];
    [v114 setAnchorPoint:0.0, 0.0];
    [v114 setMasksToBounds:1];
    if (!v97)
    {
      v187 = +[UIColor blackColor];
      v188 = [(ICDocCamExtractedDocumentAnimationController *)self imageWithColor:v187];

      id v115 = v188;
      [v114 setContents:[v115 CGImage]];
      [v114 setBounds:0.0, 0.0, v153, v163];
      [v114 setPosition:v160, v159];
      r1 = 0;
      v636 = 0;
      double v568 = CGPointZero.x;
      double v569 = y;
      double v570 = width;
      double v565 = v582;
      double v566 = height;
      double v567 = CGRectNull.origin.x;
      double v639 = v85;
      goto LABEL_146;
    }
    double v602 = v153;
    id v115 = +[UIImage imageNamed:@"gallery_fade_gradient"];
    double v164 = v648;
    v546 = v53;
    if (v648 > 1.0)
    {
      uint64_t v165 = +[UIImage ic_orientedImageFromImage:toOrientation:](UIImage, "ic_orientedImageFromImage:toOrientation:", v115, 2, v648);

      id v115 = (id)v165;
    }
    double v166 = v163;
    v167 = +[CALayer layer];
    [v167 setAnchorPoint:0.0, 0.0];
    [v167 setContents:[v115 ic_CGImage]];
    v168 = +[CALayer layer];
    [v168 setAnchorPoint:0.0, 0.0];
    id v169 = +[UIColor whiteColor];
    objc_msgSend(v168, "setBackgroundColor:", objc_msgSend(v169, "CGColor"));

    r1 = v168;
    [v114 addSublayer:v168];
    v636 = v167;
    [v114 addSublayer:v167];
    double v170 = v154 * 0.1;
    if (v648 > 1.0) {
      double v170 = v625 * 0.055;
    }
    double v171 = round(v170);
    if (v648 > 1.0)
    {
      if (v593 == v624 && v640 < v625)
      {
        double v178 = v625 - v171;
        v728.origin.double y = 0.0;
        v728.origin.double x = v625 - v171;
        double v570 = v171;
        v728.size.double width = v171;
        v728.size.double height = v618;
        CGRectGetMinX(v728);
        CGFloat v581 = v618;
        CGFloat v573 = 0.0;
      }
      else
      {
        v729.origin.double x = 0.0;
        v729.origin.double y = 0.0;
        v729.size.double width = v640;
        v729.size.double height = v154;
        CGRectGetMaxX(v729);
        TSDRectGetMaxPoint();
        TSDRectWithPoints();
        double v178 = v730.origin.x;
        CGFloat v573 = v730.origin.y;
        double v570 = v730.size.width;
        CGFloat v581 = v730.size.height;
        CGRectGetMinX(v730);
      }
      v20 = v665;
      v731.origin.double x = 0.0;
      v731.origin.double y = 0.0;
      v731.size.double width = v640;
      v731.size.double height = v154;
      CGRectGetMaxY(v731);
      TSDRectWithPoints();
      double v652 = v212;
      double v641 = v213;
      double v175 = v214;
      double v195 = v215;
      if ([(ICDocCamExtractedDocumentAnimationController *)self isPresenting])
      {
        double v569 = 0.0;
        double v594 = v570;
        double v184 = v581;
        double x = v576;
        double y = v577;
        double v566 = v575;
        double v567 = 0.0;
        double v180 = v573;
        double width = v574;
        double height = v575;
        double v568 = v574;
        double v565 = 0.0;
        double v570 = 0.0;
        goto LABEL_196;
      }
      double v184 = v581;
      double v194 = v160;
      double v196 = v160 + v602;
      double v193 = v159;
      double v197 = v159;
      double v199 = v166;
      double v198 = 0.0;
      double v180 = v573;
    }
    else
    {
      TSDRectGetMaxPoint();
      TSDRectWithPoints();
      double v652 = v172;
      double v641 = v173;
      double v175 = v174;
      double v580 = v176;
      TSDRectWithPoints();
      double v178 = v177;
      double v180 = v179;
      double v182 = v181;
      double v184 = v183;
      if ([(ICDocCamExtractedDocumentAnimationController *)self isPresenting])
      {
        double v594 = v182;
        double v568 = 0.0;
        double x = v576;
        double y = v577;
        double v567 = 0.0;
        double width = v574;
        double height = v575;
        double v569 = v575;
        double v570 = v574;
        double v565 = 0.0;
        double v566 = 0.0;
        v20 = v665;
LABEL_196:
        double v216 = v160;
        double v217 = v652;
        double v197 = v641;
LABEL_199:
        [r1 setPosition:v217, v197];
        double v582 = 0.0;
        [r1 setBounds:];
        [v167 setPosition:v178, v180];
        [v167 setBounds:0.0, 0.0, v594, v184];
        [v114 setPosition:v216, v159];
        [v114 setBounds:0.0, 0.0, v602, v166];
        double v578 = 0.0;
        double v639 = v624;
        double v87 = v660;
LABEL_200:
        v53 = v546;
        goto LABEL_201;
      }
      double v570 = v182;
      double v193 = v159 + v166;
      double v195 = v580;
      double v194 = v160;
      double v196 = v160;
      double v197 = v159;
      double v198 = v602;
      double v199 = 0.0;
      v20 = v665;
    }
    double v594 = v198;
    double x = v652;
    double y = v641;
    double v567 = 0.0;
    double v568 = v178;
    double width = v175;
    double height = v195;
    double v217 = v194;
    double v569 = v180;
    double v565 = 0.0;
    double v566 = v184;
    double v180 = v193;
    double v178 = v196;
    double v184 = v199;
    double v216 = v194;
    goto LABEL_199;
  }
  BOOL v586 = 0;
  r1 = 0;
  v636 = 0;
  v649 = 0;
  v614 = 0;
  v632 = 0;
  v610 = 0;
  v638 = 0;
  CGFloat v99 = CGRectZero.origin.y;
  double v568 = CGPointZero.x;
  double v569 = CGPointZero.y;
  double v565 = CGRectNull.origin.y;
  double v566 = CGRectNull.size.height;
  double v570 = CGRectNull.size.width;
  double v571 = CGRectNull.origin.x;
  double v567 = CGRectNull.origin.x;
  double v576 = CGPointZero.x;
  double v577 = v569;
  double v574 = v570;
  double v575 = v566;
  double v572 = v565;
  double v642 = CGRectZero.size.height;
  double v643 = CGRectZero.size.width;
  CGFloat v618 = v642;
  double v624 = CGRectZero.origin.x;
  double v625 = v643;
  double v639 = CGRectZero.origin.x;
  v98 = v658;
  v100 = v657;
  v101 = v668;
LABEL_282:
  CGFloat v661 = v99;
  if (([v51 isStatusBarHidden] & 1) == 0)
  {
    id v439 = objc_alloc((Class)UIView);
    [v653 statusBarFrame];
    id v440 = [v439 initWithFrame:];
    v441 = +[UIColor systemBackgroundColor];
    [v440 setBackgroundColor:v441];

    [v440 setAccessibilityLabel:@"extractedDocumentStatusBarBackground"];
    [v440 setTranslatesAutoresizingMaskIntoConstraints:0];
    [v440 setHidden:[v653 isStatusBarHidden]];
    v442 = [v101 containerView];
    [v442 addSubview:v440];

    if ([(ICDocCamExtractedDocumentAnimationController *)self isPresenting]) {
      v443 = v666;
    }
    else {
      v443 = v100;
    }
    [v443 addObject:v440];
    [v98 addObject:v440];
  }
  v444 = [v11 navigationBar];
  id v445 = objc_alloc((Class)UIView);
  [v444 frame];
  id v446 = [v445 initWithFrame:];
  [v446 setBackgroundColor:0];
  [v446 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v446 setAccessibilityLabel:@"extractedDocumentNavBarBackground"];
  [v446 setHidden:[v444 isHidden]];
  v447 = [v101 containerView];
  [v447 addSubview:v446];

  [v444 bounds];
  double top = UIEdgeInsetsZero.top;
  double v449 = UIEdgeInsetsZero.left;
  double v599 = UIEdgeInsetsZero.bottom;
  double v591 = UIEdgeInsetsZero.right;
  v450 = [v444 resizableSnapshotViewFromRect:1];
  [v444 frame];
  [v450 setFrame:];
  [v450 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v450 setAccessibilityLabel:@"extractedDocumentNavBarView"];
  id v628 = v444;
  [v450 setHidden:[v444 isHidden]];
  v451 = [v101 containerView];
  [v451 addSubview:v450];

  if ([(ICDocCamExtractedDocumentAnimationController *)self isPresenting]) {
    v452 = v666;
  }
  else {
    v452 = v100;
  }
  [v452 addObject:v446];
  [v452 addObject:v450];
  v623 = v446;
  [v98 addObject:v446];
  v608 = v450;
  [v98 addObject:v450];
  v453 = [v20 bottomToolbar];
  [v453 bounds];
  double v455 = v454;
  double v457 = v456;
  double v459 = v458;
  double v461 = v460;
  [v453 frame];
  double v463 = v462;
  double v604 = v464;
  double v596 = v465;
  double v467 = v466;
  v468 = [v20 bottomToolbar];
  v469 = [v468 _backgroundView];

  if (v469)
  {
    v470 = [v20 bottomToolbar];
    v471 = [v470 _backgroundView];
    [v471 bounds];
    double v473 = v472;

    if (v461 < v473) {
      double v461 = v473;
    }
    v474 = [v20 bottomToolbar];
    v475 = [v474 _backgroundView];
    [v475 bounds];
    double v477 = v476;

    if (v467 < v477) {
      double v467 = v477;
    }
    double top = UIEdgeInsetsZero.top;
  }
  v478 = [v453 resizableSnapshotViewFromRect:1 afterScreenUpdates:v455 withCapInsets:v457, v459, v461, top, v449, v599, v591];
  [v478 setFrame:v463, v604, v596, v467];
  [v478 setAccessibilityLabel:@"fakeExtractedDocumentBottomToolbar"];
  [v478 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v478 setHidden:[v453 isHidden]];
  v479 = [v101 containerView];
  [v479 addSubview:v478];

  unsigned int v480 = [(ICDocCamExtractedDocumentAnimationController *)self isPresenting];
  BOOL v481 = v480 == 0;
  if (v480) {
    v482 = v666;
  }
  else {
    v482 = v100;
  }
  if (v481) {
    v483 = v98;
  }
  else {
    v483 = v664;
  }
  [v482 addObject:v478];
  v605 = v478;
  [v483 addObject:v478];
  v597 = v453;
  [v453 setAlpha:0.0];
  v484 = [v20 topToolbar];
  if (([v484 isHidden] & 1) == 0
    && [v20 thumbnailContainerViewIsVisible])
  {
    [v484 bounds];
    v485 = [v484 resizableSnapshotViewFromRect:1];
    [v485 setAccessibilityLabel:@"fakeExtractedDocumentTopToolbar"];
    [v485 setTranslatesAutoresizingMaskIntoConstraints:0];
    [v484 frame];
    [v485 setFrame:];
    [v485 setHidden:[v484 isHidden]];
    v486 = [v668 containerView];
    [v486 addSubview:v485];

    unsigned int v487 = [(ICDocCamExtractedDocumentAnimationController *)self isPresenting];
    BOOL v488 = v487 == 0;
    if (v487) {
      v489 = v666;
    }
    else {
      v489 = v100;
    }
    if (v488) {
      v490 = v98;
    }
    else {
      v490 = v664;
    }
    [v489 addObject:v485];
    [v490 addObject:v485];
    [v484 setAlpha:0.0];
  }
  v491 = [v20 filterViewController];
  v492 = v491;
  if (v491)
  {
    v493 = [v491 scrollView];
    [v493 bounds];
    v494 = [v493 resizableSnapshotViewFromRect:1];
    [v494 setAccessibilityLabel:@"fakeFilterScrollView"];
    [v494 setTranslatesAutoresizingMaskIntoConstraints:0];
    [v493 frame];
    [v494 setFrame:];
    [v494 setHidden:[v493 isHidden]];
    v495 = [v668 containerView];
    [v495 addSubview:v494];

    unsigned int v496 = [(ICDocCamExtractedDocumentAnimationController *)self isPresenting];
    BOOL v497 = v496 == 0;
    if (v496) {
      v498 = v666;
    }
    else {
      v498 = v100;
    }
    if (v497) {
      v499 = v98;
    }
    else {
      v499 = v664;
    }
    [v498 addObject:v494];
    [v499 addObject:v494];
    [v493 setAlpha:0.0];
  }
  v600 = v492;
  long long v718 = 0u;
  long long v719 = 0u;
  long long v716 = 0u;
  long long v717 = 0u;
  id v500 = v666;
  id v501 = [v500 countByEnumeratingWithState:&v716 objects:v721 count:16];
  if (v501)
  {
    id v502 = v501;
    uint64_t v503 = *(void *)v717;
    do
    {
      for (i = 0; i != v502; i = (char *)i + 1)
      {
        if (*(void *)v717 != v503) {
          objc_enumerationMutation(v500);
        }
        v505 = [*(id *)(*((void *)&v716 + 1) + 8 * i) layer];
        [v505 setOpacity:0.0];
      }
      id v502 = [v500 countByEnumeratingWithState:&v716 objects:v721 count:16];
    }
    while (v502);
  }

  long long v714 = 0u;
  long long v715 = 0u;
  long long v712 = 0u;
  long long v713 = 0u;
  id v506 = v657;
  id v507 = [v506 countByEnumeratingWithState:&v712 objects:v720 count:16];
  if (v507)
  {
    id v508 = v507;
    uint64_t v509 = *(void *)v713;
    do
    {
      for (j = 0; j != v508; j = (char *)j + 1)
      {
        if (*(void *)v713 != v509) {
          objc_enumerationMutation(v506);
        }
        v511 = [*(id *)(*((void *)&v712 + 1) + 8 * (void)j) layer];
        LODWORD(v512) = 1.0;
        [v511 setOpacity:v512];
      }
      id v508 = [v506 countByEnumeratingWithState:&v712 objects:v720 count:16];
    }
    while (v508);
  }

  v513 = v668;
  if (v663)
  {
    [(ICDocCamExtractedDocumentAnimationController *)self transitionDuration:v668];
    double v515 = v514;
    +[CATransaction begin];
    *(float *)&double v516 = v515;
    v517 = +[NSNumber numberWithFloat:v516];
    +[CATransaction setValue:v517 forKey:kCATransactionAnimationDuration];

    v518 = +[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    +[CATransaction setValue:v518 forKey:kCATransactionAnimationTimingFunction];

    [v649 setBounds:v571, v572, v574, v575];
    [v649 setPosition:v576, v577];
    if (v586)
    {
      [r1 setPosition:x, y];
      [r1 setBounds:v578, v582, width, height];
      [v636 setPosition:v568, v569];
      [v636 setBounds:v567, v565, v570, v566];
    }
    +[CATransaction commit];
    v513 = v668;
  }
  [(ICDocCamExtractedDocumentAnimationController *)self transitionDuration:v513];
  double v520 = v519;
  v694[0] = _NSConcreteStackBlock;
  v694[1] = 3221225472;
  v694[2] = sub_1000F33EC;
  v694[3] = &unk_100629BB8;
  id v695 = v500;
  id v696 = v506;
  v697 = self;
  char v711 = v663;
  id v521 = v632;
  v522 = v513;
  id v523 = v521;
  double v700 = v630;
  double v701 = v629;
  double v702 = v645;
  double v703 = v644;
  id v698 = v521;
  id v699 = 0;
  uint64_t v704 = 0;
  double v705 = v639;
  CGFloat v706 = v661;
  double v707 = v643;
  double v708 = v642;
  CGSize size = CGRectZero.size;
  CGPoint origin = CGRectZero.origin;
  CGSize v710 = size;
  v669[0] = _NSConcreteStackBlock;
  v669[1] = 3221225472;
  v669[2] = sub_1000F3620;
  v669[3] = &unk_100629BE0;
  id v670 = v522;
  id v524 = v695;
  id v671 = v524;
  id v525 = v696;
  id v672 = v525;
  id v526 = v658;
  id v673 = v526;
  id v527 = v665;
  v528 = self;
  id v36 = v527;
  id v674 = v527;
  v675 = v528;
  char v693 = v663;
  id v529 = v523;
  double v682 = v630;
  double v683 = v629;
  double v684 = v645;
  double v685 = v644;
  id v676 = v529;
  id v677 = 0;
  uint64_t v686 = 0;
  double v687 = v624;
  CGFloat v688 = v661;
  double v689 = v625;
  CGFloat v690 = v618;
  CGPoint v691 = origin;
  CGSize v692 = size;
  id v530 = v614;
  id v678 = v530;
  id v531 = v484;
  id v679 = v531;
  id v532 = v597;
  id v680 = v532;
  id v533 = v664;
  id v681 = v533;
  +[UIView animateWithDuration:v694 animations:v669 completion:v520];

  v35 = v668;
  v37 = v659;
  id v10 = v616;
  v8 = v617;
  v9 = v619;
  v11 = v646;
LABEL_338:
}

- (void)animateDismissalTransition:(id)a3
{
  id v4 = a3;
  v5 = [v4 viewControllerForKey:UITransitionContextFromViewControllerKey];
  unsigned int v6 = [v5 view];
  [v6 setAlpha:1.0];

  [(ICDocCamExtractedDocumentAnimationController *)self transitionDuration:v4];
  double v8 = v7;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_1000F3D60;
  v14[3] = &unk_100625AF0;
  id v15 = v5;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1000F3DA8;
  v11[3] = &unk_100628010;
  id v12 = v4;
  id v13 = v15;
  id v9 = v15;
  id v10 = v4;
  +[UIView animateWithDuration:v14 animations:v11 completion:v8];
}

- (id)imageWithColor:(id)a3
{
  id v3 = a3;
  v10.double width = 1.0;
  v10.double height = 1.0;
  UIGraphicsBeginImageContext(v10);
  CurrentContext = UIGraphicsGetCurrentContext();
  id v5 = v3;
  unsigned int v6 = (CGColor *)[v5 CGColor];

  CGContextSetFillColorWithColor(CurrentContext, v6);
  v11.origin.double x = 0.0;
  v11.origin.double y = 0.0;
  v11.size.double width = 1.0;
  v11.size.double height = 1.0;
  CGContextFillRect(CurrentContext, v11);
  double v7 = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();

  return v7;
}

- (double)duration
{
  return self->_duration;
}

- (void)setDuration:(double)a3
{
  self->_duration = a3;
}

- (BOOL)isPresenting
{
  return self->_isPresenting;
}

- (void)setIsPresenting:(BOOL)a3
{
  self->_isPresenting = a3;
}

- (UIView)thumbnailView
{
  return self->_thumbnailView;
}

- (void)setThumbnailView:(id)a3
{
}

- (void).cxx_destruct
{
}

@end