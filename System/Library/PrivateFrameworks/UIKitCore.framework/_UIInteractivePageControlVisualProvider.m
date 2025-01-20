@interface _UIInteractivePageControlVisualProvider
- (BOOL)_indicatorModeForPage:(id *)a1;
- (BOOL)_isPageWithinPermittedDisplayedRange:(BOOL)result;
- (BOOL)_isPageWithinValidJoggingOffset:(uint64_t)a1;
- (BOOL)_supportsExpandedIndicator;
- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4;
- (BOOL)gestureRecognizerShouldBegin:(id)a3;
- (BOOL)isPlatterExpanded;
- (BOOL)isScrubbing;
- (BOOL)shouldDisableTouchTracking;
- (BOOL)supportsContinuousInteraction;
- (CADisplayLink)displayLink;
- (CAMediaTimingFunction)indicatorTransformCurve;
- (CGPoint)previousTouchLocation;
- (CGRect)indicatorFrameForPage:(int64_t)a3;
- (CGSize)indicatorSizeForImage:(id)a3;
- (CGSize)intrinsicContentSize;
- (CGSize)sizeForNumberOfPages:(int64_t)a3;
- (CGSize)sizeThatFits:(CGSize)a3;
- (UIDelayedAction)successiveTapAction;
- (UIImpactFeedbackGenerator)joggingFeedbackGenerator;
- (UILongPressGestureRecognizer)scrubbingGestureRecognizer;
- (UISelectionFeedbackGenerator)selectionFeedbackGenerator;
- (UITapGestureRecognizer)tapGestureRecognizer;
- (UIViewFloatAnimatableProperty)continuousDisplayedPage;
- (UIViewFloatAnimatableProperty)scrubProgress;
- (_UIPageControlContentView)contentView;
- (_UIPageControlIndicatorContentView)indicatorContentView;
- (_UIPageControlInteractor)interactor;
- (_UIPageIndicatorFeed)indicatorFeed;
- (_UIPageIndicatorStore)indicatorStore;
- (double)_contentTransformForActiveState:(int)a3;
- (double)_indicatorScaleForPage:(uint64_t)a1;
- (double)_indicatorSpacing;
- (double)_intrinsicContentSizeWithPageControlSize:(double)a3 includeExpandedActiveIndicator:(double)a4;
- (double)_layoutSizeForIndicator:(double)a3 progress:;
- (double)_layoutSizeForIndicator:(id *)a1;
- (double)_preciseIndicatorPageForPoint:(double)a3;
- (double)indicatorOpacity;
- (double)preciseTouchedPage;
- (id)_hasActiveExpandedIndicator;
- (id)_indicatorColorForEnabled:(id *)a1;
- (id)_numberOfVisibleIndicatorsFittingContentLengthForStartIndex:(id *)result;
- (id)_resolvedVisualEffect;
- (id)_updateIndicatorMode;
- (id)_visibleLeftIndicator;
- (id)_visibleRightIndicator;
- (id)backgroundView;
- (id)customActiveIndicatorImageForPage:(int64_t)a3;
- (id)customIndicatorImageForPage:(int64_t)a3;
- (id)preferredActiveIndicatorImage;
- (id)preferredIndicatorImage;
- (int64_t)previousMoveDirection;
- (int64_t)resolvedDirection;
- (uint64_t)_allowsPreciseTargetPageForTap:(uint64_t)a1;
- (uint64_t)_hasContentScaling;
- (uint64_t)_pageForExpandedIndicator;
- (uint64_t)_updateCurrentPlatterMode;
- (unint64_t)maxVisibleIndicators;
- (void)_installBackgroundViewIfNeeded;
- (void)_setDisplayedPage:(void *)a3 completion:;
- (void)_transitionIndicatorForPage:(uint64_t)a3 toEnabled:;
- (void)_updateCurrentPage:(void *)a3 completion:;
- (void)_updateIndicatorTintColor;
- (void)_updateReuseQueue;
- (void)configureIndicator:(id)a3 atPage:(int64_t)a4;
- (void)configureIndicatorImagesForIndicator:(id)a3 atPage:(int64_t)a4;
- (void)controlEventsGestureRecognizer:(id)a3 recognizedControlEvent:(unint64_t)a4 withEvent:(id)a5;
- (void)didScrubPageControl:(id)a3;
- (void)didTapPageControl:(id)a3;
- (void)didUpdateBackgroundEffect;
- (void)didUpdateBackgroundStyle;
- (void)didUpdateCurrentPageProgress;
- (void)didUpdateCustomLayoutValues;
- (void)didUpdateInteractionTypeAvailability;
- (void)didUpdateLayoutDirection;
- (void)didUpdateNumberOfPages;
- (void)didUpdatePageProgress;
- (void)displayLinkTicked:(id)a3;
- (void)invalidateIndicators;
- (void)layoutSubviews;
- (void)prepare;
- (void)pruneArchivedSubviews:(id)a3;
- (void)resetSuccessiveTapInfo;
- (void)setActivePageIndicatorVibrantColorMatrix:(CAColorMatrix *)a3;
- (void)setBackgroundView:(id)a3;
- (void)setContentView:(id)a3;
- (void)setContinuousDisplayedPage:(id)a3;
- (void)setCustomActiveIndicatorImage:(id)a3 forPage:(int64_t)a4;
- (void)setCustomIndicatorImage:(id)a3 forPage:(int64_t)a4;
- (void)setDisplayLink:(id)a3;
- (void)setIndicatorContentView:(id)a3;
- (void)setIndicatorFeed:(id)a3;
- (void)setIndicatorOpacity:(double)a3;
- (void)setIndicatorStore:(id)a3;
- (void)setIndicatorTransformCurve:(id)a3;
- (void)setInteractor:(id)a3;
- (void)setJoggingFeedbackGenerator:(id)a3;
- (void)setPage:(int64_t)a3 interactionState:(int64_t)a4;
- (void)setPageIndicatorVibrantColorMatrix:(CAColorMatrix *)a3;
- (void)setPlatterExpanded:(BOOL)a3;
- (void)setPreciseTouchedPage:(double)a3;
- (void)setPreferredActiveIndicatorImage:(id)a3;
- (void)setPreferredIndicatorImage:(id)a3;
- (void)setPreviousMoveDirection:(int64_t)a3;
- (void)setPreviousTouchLocation:(CGPoint)a3;
- (void)setScrubProgress:(id)a3;
- (void)setScrubbing:(BOOL)a3;
- (void)setScrubbingGestureRecognizer:(id)a3;
- (void)setSelectionFeedbackGenerator:(id)a3;
- (void)setSuccessiveTapAction:(id)a3;
- (void)setTapGestureRecognizer:(id)a3;
- (void)traitCollectionDidChangeOnSubtree:(id)a3;
- (void)updateDisplayedPageToCurrentPage;
- (void)updateScrubbingGestureRecognizer;
@end

@implementation _UIInteractivePageControlVisualProvider

- (void)layoutSubviews
{
  uint64_t v279 = *MEMORY[0x1E4F143B8];
  v277.receiver = self;
  v277.super_class = (Class)_UIInteractivePageControlVisualProvider;
  [(_UIPageControlVisualProvider *)&v277 layoutSubviews];
  if (![(UIPageControl *)self->super._pageControl numberOfPages]) {
    return;
  }
  unint64_t v3 = [(_UIInteractivePageControlVisualProvider *)self resolvedDirection];
  int64_t v4 = [(_UIInteractivePageControlVisualProvider *)self resolvedDirection];
  v5 = [(UIPageControl *)self->super._pageControl progress];

  [(UIView *)self->super._pageControl bounds];
  double v8 = [(_UIInteractivePageControlVisualProvider *)(id *)&self->super.super.isa _intrinsicContentSizeWithPageControlSize:v6 includeExpandedActiveIndicator:v7];
  double v10 = v9;
  double v11 = 0.0;
  if ([(UIPageControl *)self->super._pageControl numberOfPages] > self->_numberOfVisibleIndicators)
  {
    v12 = [(_UIInteractivePageControlVisualProvider *)self interactor];
    [v12 joggingDistance];
    double v11 = v13;
  }
  v14 = [(_UIInteractivePageControlVisualProvider *)self scrubProgress];
  [v14 presentationValue];
  double v16 = v11 * v15 + (1.0 - v15) * 0.0;

  [(UIView *)self->super._pageControl bounds];
  double v19 = v18 + v17 * 0.5;
  double v22 = v21 + v20 * 0.5;
  double v266 = -[_UIInteractivePageControlVisualProvider _indicatorSpacing]((uint64_t)self);
  unint64_t v23 = [(_UIInteractivePageControlVisualProvider *)self resolvedDirection];
  if (v23 >= 2) {
    double v24 = v22;
  }
  else {
    double v24 = v19;
  }
  double v25 = v16 + v24;
  if (v23 >= 2) {
    double v22 = v25;
  }
  else {
    double v19 = v25;
  }
  [(UIView *)self->super._pageControl _currentScreenScale];
  UIRectCenteredAboutPointScale(0.0, 0.0, v8, v10, v19, v22, v26);
  double v28 = v27;
  double v30 = v29;
  double v32 = v31;
  double v34 = v33;
  v35 = [(_UIInteractivePageControlVisualProvider *)self contentView];
  objc_msgSend(v35, "setBounds:", 0.0, 0.0, v32, v34);

  v36 = [(_UIInteractivePageControlVisualProvider *)self contentView];
  objc_msgSend(v36, "setCenter:", v28 + v32 * 0.5, v30 + v34 * 0.5);

  unint64_t v37 = [(_UIInteractivePageControlVisualProvider *)self resolvedDirection];
  v38 = [(_UIInteractivePageControlVisualProvider *)self indicatorStore];
  objc_msgSend(v38, "contentSizeForNumberOfPages:hasExpandedActiveIndicator:", -[UIPageControl numberOfPages](self->super._pageControl, "numberOfPages"), v5 != 0);
  if (v37 >= 2) {
    double v41 = v40;
  }
  else {
    double v41 = v39;
  }

  v42 = [(_UIInteractivePageControlVisualProvider *)self contentView];
  [v42 bounds];
  double v44 = v43;
  double v46 = v45;

  if (v3 < 2) {
    double v44 = v41;
  }
  else {
    double v46 = v41;
  }
  v47 = [(_UIInteractivePageControlVisualProvider *)self indicatorContentView];
  objc_msgSend(v47, "setBounds:", 0.0, 0.0, v44, v46);

  v48 = [(_UIInteractivePageControlVisualProvider *)self scrubProgress];
  [v48 presentationValue];
  if (v49 != 0.0) {
    goto LABEL_22;
  }
  v50 = [(_UIInteractivePageControlVisualProvider *)self scrubProgress];
  [v50 value];
  double v52 = v51;

  if (v52 == 0.0)
  {
    unint64_t v53 = [(_UIInteractivePageControlVisualProvider *)self resolvedDirection];
    v54 = [(_UIInteractivePageControlVisualProvider *)self contentView];
    [v54 bounds];
    double v57 = v56 + v55 * 0.5;
    double v60 = v59 + v58 * 0.5;
    if (v53 >= 2) {
      double v61 = v60;
    }
    else {
      double v61 = v57;
    }

    v48 = [(_UIInteractivePageControlVisualProvider *)self interactor];
    [v48 setUnconstrainedPosition:v61 offset:0.0];
LABEL_22:
  }
  v62 = -[_UIInteractivePageControlVisualProvider _numberOfVisibleIndicatorsFittingContentLengthForStartIndex:]((id *)&self->super.super.isa, self->_indicatorStartIndex);
  v63 = [(_UIInteractivePageControlVisualProvider *)self continuousDisplayedPage];
  [v63 value];
  double v65 = v64;

  v66 = [(_UIInteractivePageControlVisualProvider *)self continuousDisplayedPage];
  [v66 presentationValue];
  double v68 = fmax(fmin(v67, (double)([(UIPageControl *)self->super._pageControl numberOfPages] - 1)), 0.0);

  int64_t numberOfVisibleIndicators = self->_numberOfVisibleIndicators;
  uint64_t v71 = numberOfVisibleIndicators - 2;
  BOOL v70 = numberOfVisibleIndicators < 2;
  uint64_t v72 = numberOfVisibleIndicators - 1;
  if (v70) {
    uint64_t v73 = v72;
  }
  else {
    uint64_t v73 = v71;
  }
  double v74 = (double)([(UIPageControl *)self->super._pageControl numberOfPages] - (uint64_t)v62);
  v75 = [(_UIInteractivePageControlVisualProvider *)self continuousDisplayedPage];
  [v75 presentationValue];
  double v77 = v76;

  uint64_t v78 = [(UIPageControl *)self->super._pageControl numberOfPages];
  double continuousStartIndex = self->_continuousStartIndex;
  if (v62)
  {
    double v80 = (double)(uint64_t)fmax(fmin((double)(v73 >> 1), 2.0), 0.0);
    double v81 = fmax(v77 - v80, 0.0);
    if (continuousStartIndex < v81)
    {
      double v81 = fmin((double)v78, v77 + v80 + 1.0) - (double)(uint64_t)v62;
      if (continuousStartIndex > v81)
      {
        double v81 = round(continuousStartIndex);
        if (v81 == continuousStartIndex) {
          double v81 = self->_continuousStartIndex;
        }
      }
    }
  }
  else
  {
    double v81 = self->_continuousStartIndex;
  }
  double v82 = fmax(fmin(v81, v74), 0.0);
  self->_double continuousStartIndex = v82;
  self->super._displayedPage = llround(v68);
  self->_int64_t indicatorStartIndex = vcvtmd_s64_f64(v82);
  self->_int64_t numberOfVisibleIndicators = (int64_t)-[_UIInteractivePageControlVisualProvider _numberOfVisibleIndicatorsFittingContentLengthForStartIndex:]((id *)&self->super.super.isa, llround(v82));
  v83 = [(_UIInteractivePageControlVisualProvider *)self indicatorContentView];
  [v83 frame];
  double v85 = v84;
  double v87 = v86;

  if ((uint64_t)v65 > (uint64_t)v68) {
    uint64_t v88 = 1;
  }
  else {
    uint64_t v88 = 2 * ((uint64_t)v65 < (uint64_t)v68);
  }
  pageControl = self->super._pageControl;
  double v90 = 14.0;
  if ((*(unsigned char *)&pageControl->_custom & 2) != 0)
  {
    [(UIPageControl *)pageControl _customHorizontalPadding];
    double v90 = v91;
    pageControl = self->super._pageControl;
  }
  double v92 = self->_continuousStartIndex;
  if ([(UIPageControl *)pageControl backgroundStyle] == UIPageControlBackgroundStyleMinimal
    && (*(unsigned char *)&self->super._pageControl->_custom & 3) == 0)
  {
    double v90 = 0.0;
  }
  double v258 = v16;
  v257 = v5;
  double v255 = v68;
  double v256 = v65;
  int64_t v93 = v4;
  unint64_t v94 = v3;
  if (v88 == 2)
  {
    int64_t indicatorStartIndex = vcvtmd_s64_f64(v92);
  }
  else if (v88 == 1)
  {
    int64_t indicatorStartIndex = vcvtpd_s64_f64(v92);
  }
  else
  {
    int64_t indicatorStartIndex = self->_indicatorStartIndex;
  }
  v96 = [(UIPageControl *)self->super._pageControl progress];

  v97 = -[_UIInteractivePageControlVisualProvider _numberOfVisibleIndicatorsFittingContentLengthForStartIndex:]((id *)&self->super.super.isa, indicatorStartIndex);
  unint64_t v98 = [(_UIInteractivePageControlVisualProvider *)self resolvedDirection];
  v99 = [(_UIInteractivePageControlVisualProvider *)self indicatorStore];
  objc_msgSend(v99, "minimumContentSizeForIndicatorsInRange:hasExpandedActiveIndicator:", indicatorStartIndex, v97, v96 != 0);
  if (v98 >= 2) {
    double v102 = v101;
  }
  else {
    double v102 = v100;
  }

  if (v96)
  {
    unint64_t v103 = [(_UIInteractivePageControlVisualProvider *)self resolvedDirection];
    v104 = [(_UIInteractivePageControlVisualProvider *)self indicatorStore];
    objc_msgSend(v104, "minimumContentSizeForIndicatorsInRange:hasExpandedActiveIndicator:", indicatorStartIndex, v97, 0);
    if (v103 >= 2) {
      double v105 = v106;
    }
    double v267 = v105;

    v107 = [(_UIInteractivePageControlVisualProvider *)self scrubProgress];
    [v107 presentationValue];
    double v108 = v87;
    double v109 = v85;
    double v111 = 1.0 - v110;

    double v112 = v267 * (1.0 - v111);
    double v113 = v102 * v111;
    double v85 = v109;
    double v87 = v108;
    double v102 = v113 + v112;
  }
  unint64_t v114 = v94;
  unint64_t v268 = v93 & 0xFFFFFFFFFFFFFFFDLL;
  unint64_t v115 = [(_UIInteractivePageControlVisualProvider *)self resolvedDirection];
  v116 = [(_UIInteractivePageControlVisualProvider *)self contentView];
  [v116 bounds];
  if (v115 >= 2) {
    double v119 = v118;
  }
  else {
    double v119 = v117;
  }
  double v120 = v119 - (v90 + v90);

  double v121 = (v120 - v102) * 0.5;
  if (v121 == self->_indicatorPaddingOffset || v92 == (double)indicatorStartIndex) {
    self->_indicatorPaddingOffset = v121;
  }
  v122 = [(_UIInteractivePageControlVisualProvider *)self indicatorStore];
  [v122 indicatorPositionForContinuousPage:-[_UIInteractivePageControlVisualProvider _pageForExpandedIndicator](self) expandedIndicatorPage:self->_continuousStartIndex];

  if (v268 == 1)
  {
    [(_UIInteractivePageControlVisualProvider *)self resolvedDirection];
    v123 = [(_UIInteractivePageControlVisualProvider *)self contentView];
    [v123 bounds];
    [(_UIInteractivePageControlVisualProvider *)self resolvedDirection];
  }
  UIRoundToViewScale(self->super._pageControl);
  unint64_t v260 = v114;
  if (v114 >= 2) {
    double v125 = 0.0;
  }
  else {
    double v125 = v124;
  }
  if (v114 >= 2) {
    double v126 = v124;
  }
  else {
    double v126 = 0.0;
  }
  v127 = [(_UIInteractivePageControlVisualProvider *)self indicatorContentView];
  objc_msgSend(v127, "setFrame:", v125, v126, v85, v87);

  int64_t v128 = self->_indicatorStartIndex;
  uint64_t v129 = (uint64_t)fmax((double)(v128 - 2), 0.0);
  uint64_t v130 = (uint64_t)fmin((double)(v128 + self->_numberOfVisibleIndicators + 2), (double)[(UIPageControl *)self->super._pageControl numberOfPages]);
  v131 = [(_UIInteractivePageControlVisualProvider *)self indicatorFeed];
  [v131 prepareIndicatorsFrom:v129 to:v130];

  v132 = [(_UIInteractivePageControlVisualProvider *)self indicatorStore];
  [v132 indicatorPositionForContinuousPage:-[_UIInteractivePageControlVisualProvider _pageForExpandedIndicator](self) expandedIndicatorPage:(double)v129];
  double v134 = v133;

  if (v268 == 1)
  {
    if ((unint64_t)[(_UIInteractivePageControlVisualProvider *)self resolvedDirection] >= 2) {
      double v135 = v87;
    }
    else {
      double v135 = v85;
    }
    double v134 = v135 - v134;
  }
  v136 = [(_UIInteractivePageControlVisualProvider *)self indicatorContentView];
  v137 = [v136 subviews];
  v138 = (void *)[v137 mutableCopy];

  v139 = [(_UIInteractivePageControlVisualProvider *)self indicatorStore];
  [v139 defaultIndicatorSize];
  double v259 = v140;
  double v262 = v141;

  UIControlContentVerticalAlignment v264 = [(UIControl *)self->super._pageControl contentVerticalAlignment];
  UIControlContentHorizontalAlignment v261 = [(UIControl *)self->super._pageControl contentHorizontalAlignment];
  v142 = [(_UIInteractivePageControlVisualProvider *)self contentView];
  [v142 bounds];
  double v144 = v143;
  double v146 = v145;
  double v148 = v147;
  double v150 = v149;

  if (v129 < v130)
  {
    BOOL v151 = v260 < 2;
    double v152 = v146 + v150 * 0.5;
    if (v260 >= 2) {
      double v153 = v144 + v148 * 0.5;
    }
    else {
      double v153 = 0.0;
    }
    if (v260 >= 2) {
      double v154 = 0.0;
    }
    else {
      double v154 = v152;
    }
    if (v264) {
      BOOL v155 = v260 < 2;
    }
    else {
      BOOL v155 = 0;
    }
    BOOL v265 = v155;
    if (v261 == UIControlContentHorizontalAlignmentCenter) {
      BOOL v151 = 1;
    }
    BOOL v263 = v151;
    do
    {
      v156 = [(_UIInteractivePageControlVisualProvider *)self indicatorFeed];
      v157 = [v156 indicatorForPage:v129];

      v158 = [v157 image];
      v159 = [(_UIInteractivePageControlVisualProvider *)self indicatorStore];
      v160 = [v159 indicatorImage];
      char v161 = [v158 isEqual:v160];

      if ((v161 & 1) == 0)
      {
        if (v265)
        {
          if (v264 == UIControlContentVerticalAlignmentBottom)
          {
            [v157 bounds];
            double v163 = v168 - v262;
            double v164 = -0.5;
            goto LABEL_95;
          }
          if (v264 == UIControlContentVerticalAlignmentTop)
          {
            [v157 bounds];
            double v163 = v162 - v262;
            double v164 = 0.5;
LABEL_95:
            double v154 = v154 + v163 * v164;
          }
        }
        else if (!v263)
        {
          if (v261 == UIControlContentHorizontalAlignmentRight)
          {
            [v157 bounds];
            double v166 = v169 - v259;
            double v167 = -0.5;
            goto LABEL_97;
          }
          if (v261 == UIControlContentHorizontalAlignmentLeft)
          {
            [v157 bounds];
            double v166 = v165 - v259;
            double v167 = 0.5;
LABEL_97:
            double v153 = v153 + v166 * v167;
          }
        }
      }
      double v170 = -[_UIInteractivePageControlVisualProvider _layoutSizeForIndicator:]((id *)&self->super.super.isa, v157);
      double v172 = v171;
      if ((unint64_t)[(_UIInteractivePageControlVisualProvider *)self resolvedDirection] >= 2) {
        double v173 = v172;
      }
      else {
        double v173 = v170;
      }
      double v174 = -[_UIInteractivePageControlVisualProvider _indicatorScaleForPage:]((uint64_t)self, [v157 page]);
      v175 = [v157 superview];

      if (v175)
      {
        [v138 removeObject:v157];
      }
      else
      {
        v176 = [(_UIInteractivePageControlVisualProvider *)self indicatorContentView];
        [v176 addSubview:v157];
      }
      double v177 = v173 * 0.5;
      double v178 = v134 - v177;
      double v179 = v134 + v177;
      unint64_t v180 = [(_UIInteractivePageControlVisualProvider *)self resolvedDirection];
      if (v268 == 1) {
        double v134 = v178 - (v266 + v177);
      }
      else {
        double v134 = v179 + v266 + v177;
      }
      UIRoundToViewScale(self->super._pageControl);
      if (v180 >= 2) {
        double v154 = v181;
      }
      else {
        double v153 = v181;
      }
      objc_msgSend(v157, "setDefaultModeSize:", -[_UIInteractivePageControlVisualProvider _layoutSizeForIndicator:progress:]((id *)&self->super.super.isa, v157, 0.0));
      objc_msgSend(v157, "setExpandedModeSize:", -[_UIInteractivePageControlVisualProvider _layoutSizeForIndicator:progress:]((id *)&self->super.super.isa, v157, 1.0));
      objc_msgSend(v157, "setBounds:", 0.0, 0.0, v170, v172);
      objc_msgSend(v157, "setCenter:", v153, v154);
      CGAffineTransformMakeScale(&v276, v174, v174);
      CGAffineTransform v275 = v276;
      [v157 setTransform:&v275];
      [v157 layoutBelowIfNeeded];

      ++v129;
    }
    while (v130 != v129);
  }
  long long v273 = 0u;
  long long v274 = 0u;
  long long v271 = 0u;
  long long v272 = 0u;
  id v182 = v138;
  uint64_t v183 = [v182 countByEnumeratingWithState:&v271 objects:v278 count:16];
  if (v183)
  {
    uint64_t v184 = v183;
    uint64_t v185 = *(void *)v272;
    do
    {
      for (uint64_t i = 0; i != v184; ++i)
      {
        if (*(void *)v272 != v185) {
          objc_enumerationMutation(v182);
        }
        [*(id *)(*((void *)&v271 + 1) + 8 * i) removeFromSuperview];
      }
      uint64_t v184 = [v182 countByEnumeratingWithState:&v271 objects:v278 count:16];
    }
    while (v184);
  }

  v187 = [(_UIInteractivePageControlVisualProvider *)self contentView];
  [v187 bounds];
  double v189 = v188;
  double v191 = v190;

  if (v257)
  {
    v192 = [(_UIInteractivePageControlVisualProvider *)self scrubProgress];
    [v192 presentationValue];
    double v194 = 1.0 - v193;

    [(UIView *)self->super._pageControl bounds];
    double v189 = v189 * v194
         + (1.0 - v194)
         * [(_UIInteractivePageControlVisualProvider *)(id *)&self->super.super.isa _intrinsicContentSizeWithPageControlSize:v195 includeExpandedActiveIndicator:v196];
    double v191 = v191 * v194 + (1.0 - v194) * v197;
  }
  v198 = [(_UIInteractivePageControlVisualProvider *)self backgroundView];
  objc_msgSend(v198, "setBounds:", 0.0, 0.0, v189, v191);
  v199 = [(_UIInteractivePageControlVisualProvider *)self contentView];
  [v199 bounds];
  objc_msgSend(v198, "setCenter:", v201 + v200 * 0.5, v203 + v202 * 0.5);

  double v204 = fabs(v258);
  double v205 = v204 * 0.0625 / 20.0 + 1.0;
  double v206 = v204 * -0.11111112 / 20.0 + 1.0;
  if (v260 > 1)
  {
    double v207 = v204 * -0.11111112 / 20.0 + 1.0;
  }
  else
  {
    double v207 = v204 * 0.0625 / 20.0 + 1.0;
    double v205 = v206;
  }
  CGAffineTransformMakeScale(&v270, v207, v205);
  CGAffineTransform v269 = v270;
  [v198 setTransform:&v269];
  unint64_t v208 = [(_UIInteractivePageControlVisualProvider *)self resolvedDirection];
  v209 = [(_UIInteractivePageControlVisualProvider *)self backgroundView];
  [v209 frame];
  if (v208 >= 2) {
    double v212 = v210;
  }
  else {
    double v212 = v211;
  }
  [v198 _setContinuousCornerRadius:v212 * 0.5];

  if (v256 == v255)
  {
    v213 = -[_UIInteractivePageControlVisualProvider _visibleLeftIndicator](self);
    v214 = -[_UIInteractivePageControlVisualProvider _visibleLeftIndicator](self);
    [v214 bounds];
    double v216 = v215;
    double v218 = v217;
    double v220 = v219;
    double v222 = v221;
    v223 = [(_UIInteractivePageControlVisualProvider *)self contentView];
    objc_msgSend(v213, "convertRect:toView:", v223, v216, v218, v220, v222);
    double v225 = v224;
    double v227 = v226;
    double v229 = v228;
    double v231 = v230;

    v232 = -[_UIInteractivePageControlVisualProvider _visibleRightIndicator](self);
    v233 = -[_UIInteractivePageControlVisualProvider _visibleRightIndicator](self);
    [v233 bounds];
    double v235 = v234;
    double v237 = v236;
    double v239 = v238;
    double v241 = v240;
    v242 = [(_UIInteractivePageControlVisualProvider *)self contentView];
    objc_msgSend(v232, "convertRect:toView:", v242, v235, v237, v239, v241);
    double v244 = v243;
    double v246 = v245;
    double v248 = v247;
    double v250 = v249;

    v251 = [(_UIInteractivePageControlVisualProvider *)self interactor];
    v252 = v251;
    if (v260 > 1)
    {
      [v251 updateScrubLowerBound:v227 + v231 * 0.5 upperBound:v246 + v250 * 0.5];

      v253 = [(_UIInteractivePageControlVisualProvider *)self interactor];
      double v254 = v227 + v231;
      double v244 = v246;
    }
    else
    {
      [v251 updateScrubLowerBound:v225 + v229 * 0.5 upperBound:v244 + v248 * 0.5];

      v253 = [(_UIInteractivePageControlVisualProvider *)self interactor];
      double v254 = v225 + v229;
    }
    [v253 updateRubberbandLowerBound:v266 + v254 upperBound:v244 - v266];
  }
}

- (int64_t)resolvedDirection
{
  return self->_resolvedDirection;
}

- (double)_layoutSizeForIndicator:(double)a3 progress:
{
  id v5 = a2;
  double v6 = v5;
  if (a1)
  {
    id v7 = v5;
    double v8 = [a1 indicatorStore];
    uint64_t v9 = [v7 page];

    [v8 resolvedIndicatorLayoutSizeForPage:v9];
    double v11 = v10;

    if (a3 != 0.0)
    {
      [v7 page];
      uint64_t v12 = [v7 page];
      if (v12 != [a1[1] numberOfPages] - 1)
      {
        double v13 = [a1 indicatorStore];
        objc_msgSend(v13, "resolvedIndicatorLayoutSizeForPage:", objc_msgSend(v7, "page") + 1);
      }
      -[_UIInteractivePageControlVisualProvider _indicatorSpacing]((uint64_t)a1);
      [a1 resolvedDirection];
      [a1 resolvedDirection];
      UIRoundToViewScale(a1[1]);
      double v15 = v14;
      if ((unint64_t)[a1 resolvedDirection] < 2) {
        double v11 = v15;
      }
    }
  }
  else
  {
    double v11 = 0.0;
  }

  return v11;
}

- (_UIPageIndicatorStore)indicatorStore
{
  return self->_indicatorStore;
}

- (_UIPageControlContentView)contentView
{
  return self->_contentView;
}

- (_UIPageIndicatorFeed)indicatorFeed
{
  return self->_indicatorFeed;
}

- (double)_indicatorSpacing
{
  if (!a1) {
    return 0.0;
  }
  uint64_t v1 = *(void *)(a1 + 8);
  if ((*(unsigned char *)(v1 + 468) & 4) != 0) {
    return *(double *)(v1 + 488);
  }
  v2 = [(id)v1 traitCollection];
  uint64_t v3 = [v2 userInterfaceIdiom];

  double result = 8.0;
  if (v3 == 5) {
    return 12.0;
  }
  return result;
}

- (double)_indicatorScaleForPage:(uint64_t)a1
{
  if (!a1) {
    return 0.0;
  }
  uint64_t v4 = *(void *)(a1 + 320);
  uint64_t v5 = v4 - 2;
  if (v4 < 2) {
    uint64_t v5 = v4 - 1;
  }
  uint64_t v6 = (uint64_t)fmax(fmin((double)(v5 >> 1), 2.0), 0.0);
  double v7 = *(double *)(a1 + 368);
  double v8 = (double)a2;
  double v9 = (double)a2 - v7;
  uint64_t v10 = [*(id *)(a1 + 8) numberOfPages];
  double v11 = 1.0;
  double v12 = fmax(fmin((v7 + -0.999) / -0.999, 1.0), 0.0);
  if (a2 || (v12 > 0.0 ? (BOOL v13 = v6 < 1) : (BOOL v13 = 1), v13))
  {
    if (a2 == 1 && v12 > 0.0 && v6 >= 2)
    {
      double v17 = (v9 + 0.5) / 1.5;
LABEL_31:
      double v15 = fmin(v17, 1.0);
      goto LABEL_32;
    }
    double v18 = (double)v4;
    if (fmax(fmin((v7 - ((double)(v10 - v4) + -1.0)) / ((double)(v10 - v4) - ((double)(v10 - v4) + -1.0)), 1.0), 0.0) > 0.0)
    {
      if ([*(id *)(a1 + 8) numberOfPages] - 1 == a2 && v6 >= 1)
      {
        double v19 = (double)(v4 - 1);
LABEL_30:
        double v17 = (v9 - v18) / (v19 - v18);
        goto LABEL_31;
      }
      if ([*(id *)(a1 + 8) numberOfPages] - 2 == a2 && v6 >= 2)
      {
        double v19 = v18 + -1.5;
        goto LABEL_30;
      }
    }
    double v20 = (double)v6;
    if (v7 != 0.0 && v9 < v20)
    {
      double v11 = 1.0;
      double v14 = (v9 + 1.0) / (v20 + 1.0);
      goto LABEL_10;
    }
    double v21 = fmax(v7, v7 + v18 + -1.0);
    double v22 = 1.0;
    if (v21 + 1.0 == (double)[*(id *)(a1 + 8) numberOfPages] || v21 - v20 >= v8) {
      goto LABEL_33;
    }
    double v19 = (double)(v4 + ~v6);
    goto LABEL_30;
  }
  double v14 = v9 + 1.0;
LABEL_10:
  double v15 = fmin(v14, v11);
LABEL_32:
  double v22 = fmax(v15, 0.0);
LABEL_33:
  unint64_t v23 = [(id)a1 indicatorTransformCurve];
  *(float *)&double v24 = v22;
  [v23 _solveForInput:v24];
  double v26 = fabsf(v25);

  return v26;
}

- (CAMediaTimingFunction)indicatorTransformCurve
{
  return self->_indicatorTransformCurve;
}

- (double)_layoutSizeForIndicator:(id *)a1
{
  if (!a1) {
    return 0.0;
  }
  id v3 = a2;
  [v3 currentExpandProgress];
  double v5 = -[_UIInteractivePageControlVisualProvider _layoutSizeForIndicator:progress:](a1, v3, v4);

  return v5;
}

- (_UIPageControlIndicatorContentView)indicatorContentView
{
  return self->_indicatorContentView;
}

- (UIViewFloatAnimatableProperty)continuousDisplayedPage
{
  return self->_continuousDisplayedPage;
}

- (UIViewFloatAnimatableProperty)scrubProgress
{
  return self->_scrubProgress;
}

- (id)_numberOfVisibleIndicatorsFittingContentLengthForStartIndex:(id *)result
{
  if (result)
  {
    id v3 = result;
    unint64_t v4 = [result resolvedDirection];
    double v5 = [v3 contentView];
    [v5 bounds];
    if (v4 >= 2) {
      double v8 = v7;
    }
    else {
      double v8 = v6;
    }

    uint64_t v9 = [v3[1] backgroundStyle];
    uint64_t v10 = v3[1];
    if (v9 != 2 || (v10[468] & 3) != 0)
    {
      double v12 = 28.0;
      if ((v10[468] & 2) != 0)
      {
        objc_msgSend(v10, "_customHorizontalPadding", 28.0);
        double v12 = v13 + v13;
      }
      double v8 = v8 - v12;
    }
    double v14 = [v3 indicatorStore];
    double v15 = [v3[1] progress];
    BOOL v16 = v15 != 0;

    uint64_t v17 = [v14 numberOfVisibleIndicatorsForStartIndex:a2 fittingLength:v16 hasExpandedActiveIndicator:v8];
    return (id *)v17;
  }
  return result;
}

- (_UIPageControlInteractor)interactor
{
  return self->_interactor;
}

- (id)backgroundView
{
  backgroundView = self->_backgroundView;
  if (!backgroundView)
  {
    unint64_t v4 = [UIVisualEffectView alloc];
    double v5 = -[_UIInteractivePageControlVisualProvider _resolvedVisualEffect]((id *)&self->super.super.isa);
    double v6 = [(UIVisualEffectView *)v4 initWithEffect:v5];
    double v7 = self->_backgroundView;
    self->_backgroundView = v6;

    -[_UIInteractivePageControlVisualProvider _installBackgroundViewIfNeeded]((id *)&self->super.super.isa);
    backgroundView = self->_backgroundView;
  }
  return backgroundView;
}

- (uint64_t)_pageForExpandedIndicator
{
  if (!a1) {
    return 0;
  }
  if (-[_UIInteractivePageControlVisualProvider _hasActiveExpandedIndicator]((id *)a1))
  {
    id v3 = [a1 continuousDisplayedPage];
    [v3 value];
    uint64_t v1 = (uint64_t)v4;
  }
  return v1;
}

- (id)_hasActiveExpandedIndicator
{
  if (result)
  {
    uint64_t v1 = result;
    v2 = [result[1] progress];

    if (v2) {
      return (id *)([v1 isScrubbing] ^ 1);
    }
    else {
      return 0;
    }
  }
  return result;
}

- (id)_visibleRightIndicator
{
  uint64_t v1 = (uint64_t)a1;
  if (a1)
  {
    unint64_t v2 = [a1 resolvedDirection] & 0xFFFFFFFFFFFFFFFDLL;
    uint64_t v3 = *(void *)(v1 + 312);
    if (v2 != 1) {
      uint64_t v3 = v3 + *(void *)(v1 + 320) - 1;
    }
    if (v3 < 0 || v3 >= [*(id *)(v1 + 8) numberOfPages])
    {
      uint64_t v1 = 0;
    }
    else
    {
      double v4 = [(id)v1 indicatorFeed];
      uint64_t v1 = [v4 indicatorForPage:v3];
    }
  }
  return (id)v1;
}

- (id)_visibleLeftIndicator
{
  uint64_t v1 = (uint64_t)a1;
  if (a1)
  {
    unint64_t v2 = [a1 resolvedDirection] & 0xFFFFFFFFFFFFFFFDLL;
    uint64_t v3 = *(void *)(v1 + 312);
    if (v2 == 1) {
      uint64_t v3 = v3 + *(void *)(v1 + 320) - 1;
    }
    if (v3 < 0 || v3 >= [*(id *)(v1 + 8) numberOfPages])
    {
      uint64_t v1 = 0;
    }
    else
    {
      double v4 = [(id)v1 indicatorFeed];
      uint64_t v1 = [v4 indicatorForPage:v3];
    }
  }
  return (id)v1;
}

- (void)_installBackgroundViewIfNeeded
{
  if (a1 && a1[47])
  {
    objc_msgSend(a1[47], "setAlpha:", (double)objc_msgSend(a1, "isPlatterExpanded"));
    id v2 = [a1 contentView];
    [v2 insertSubview:a1[47] atIndex:0];
  }
}

- (void)didUpdateNumberOfPages
{
  [(UIView *)self->super._pageControl invalidateIntrinsicContentSize];
  -[_UIInteractivePageControlVisualProvider updateScrubbingGestureRecognizer]((id *)&self->super.super.isa);
  uint64_t v3 = [(UIPageControl *)self->super._pageControl numberOfPages];
  double v4 = [(_UIInteractivePageControlVisualProvider *)self indicatorStore];
  uint64_t v5 = [v4 numberOfPages];

  if (v5 != v3)
  {
    double v6 = [(_UIInteractivePageControlVisualProvider *)self indicatorStore];
    [v6 updateStoreForNumberOfPages:v3];

    int64_t numberOfVisibleIndicators = self->_numberOfVisibleIndicators;
    if (numberOfVisibleIndicators + self->_indicatorStartIndex > v3) {
      self->_int64_t indicatorStartIndex = (v3 - numberOfVisibleIndicators) & ~((v3 - numberOfVisibleIndicators) >> 63);
    }
    if (v3 < 1) {
      int64_t v8 = -1;
    }
    else {
      int64_t v8 = (uint64_t)fmax(fmin((double)self->super._displayedPage, (double)([(UIPageControl *)self->super._pageControl numberOfPages] - 1)), 0.0);
    }
    self->super._displayedPage = v8;
    -[_UIInteractivePageControlVisualProvider _updateReuseQueue]((uint64_t)self);
    pageControl = self->super._pageControl;
    [(UIView *)pageControl setNeedsLayout];
  }
}

- (void)prepare
{
  v50[2] = *MEMORY[0x1E4F143B8];
  v49.receiver = self;
  v49.super_class = (Class)_UIInteractivePageControlVisualProvider;
  [(_UIPageControlVisualProvider *)&v49 prepare];
  self->_int64_t numberOfVisibleIndicators = 0;
  [(UIPageControl *)self->super._pageControl setAllowsContinuousInteraction:1];
  [(UIPageControl *)self->super._pageControl _setAllowsDiscreteInteraction:1];
  [(UIPageControl *)self->super._pageControl _setFlickToEndGestureEnabled:1];
  self->_preciseTouchedPage = -1.79769313e308;
  uint64_t v3 = [[_UIPageIndicatorFeed alloc] initWithPageControl:self->super._pageControl];
  [(_UIInteractivePageControlVisualProvider *)self setIndicatorFeed:v3];

  double v4 = [(_UIInteractivePageControlVisualProvider *)self indicatorFeed];
  [v4 setDelegate:self];

  uint64_t v5 = objc_opt_new();
  [(_UIInteractivePageControlVisualProvider *)self setIndicatorStore:v5];

  double v6 = [(_UIInteractivePageControlVisualProvider *)self indicatorStore];
  [v6 setDelegate:self];

  double v7 = [[_UIPageControlInteractor alloc] initWithMaximumDistance:20.0];
  [(_UIInteractivePageControlVisualProvider *)self setInteractor:v7];

  id v8 = objc_alloc(MEMORY[0x1E4F39C10]);
  LODWORD(v9) = 0.375;
  LODWORD(v10) = -0.125;
  LODWORD(v11) = -0.3125;
  LODWORD(v12) = 0.125;
  double v13 = (void *)[v8 initWithControlPoints:v9 :v10 :v11 :v12];
  [(_UIInteractivePageControlVisualProvider *)self setIndicatorTransformCurve:v13];

  double v14 = objc_opt_new();
  [(_UIInteractivePageControlVisualProvider *)self setContentView:v14];

  double v15 = objc_opt_new();
  [(_UIInteractivePageControlVisualProvider *)self setIndicatorContentView:v15];

  BOOL v16 = [(_UIInteractivePageControlVisualProvider *)self contentView];
  [v16 bounds];
  double v18 = v17;
  double v20 = v19;
  double v22 = v21;
  double v24 = v23;
  float v25 = [(_UIInteractivePageControlVisualProvider *)self indicatorContentView];
  objc_msgSend(v25, "setFrame:", v18, v20, v22, v24);

  double v26 = [(_UIInteractivePageControlVisualProvider *)self contentView];
  double v27 = [(_UIInteractivePageControlVisualProvider *)self indicatorContentView];
  [v26 addSubview:v27];

  pageControl = self->super._pageControl;
  double v29 = [(_UIInteractivePageControlVisualProvider *)self contentView];
  [(UIView *)pageControl addSubview:v29];

  [(_UIInteractivePageControlVisualProvider *)self didUpdateLayoutDirection];
  double v30 = [[UITapGestureRecognizer alloc] initWithTarget:self action:sel_didTapPageControl_];
  [(UIGestureRecognizer *)v30 setDelegate:self];
  [(UIGestureRecognizer *)v30 setCancelsTouchesInView:0];
  [(UIView *)self->super._pageControl addGestureRecognizer:v30];
  [(_UIInteractivePageControlVisualProvider *)self setTapGestureRecognizer:v30];
  double v31 = objc_opt_new();
  [v31 setDelegate:self];
  [v31 setControlEventsDelegate:self];
  [v31 setDelaysTouchesEnded:0];
  [v31 setCancelsTouchesInView:0];
  [(UIView *)self->super._pageControl addGestureRecognizer:v31];
  [(_UIPageControlVisualProvider *)self setInteractionState:0];
  double v32 = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:sel_didScrubPageControl_];
  [(UILongPressGestureRecognizer *)v32 setMinimumPressDuration:0.15];
  [(UIGestureRecognizer *)v32 setDelegate:self];
  [(UIGestureRecognizer *)v32 setCancelsTouchesInView:0];
  [(UILongPressGestureRecognizer *)v32 setAllowableMovement:1.79769313e308];
  [(UIView *)self->super._pageControl addGestureRecognizer:v32];
  [(_UIInteractivePageControlVisualProvider *)self setScrubbingGestureRecognizer:v32];
  double v33 = objc_opt_new();
  [(_UIInteractivePageControlVisualProvider *)self setContinuousDisplayedPage:v33];

  double v34 = objc_opt_new();
  [(_UIInteractivePageControlVisualProvider *)self setScrubProgress:v34];

  v35 = [(_UIInteractivePageControlVisualProvider *)self continuousDisplayedPage];
  [v35 setValue:0.0];

  v36 = [(_UIInteractivePageControlVisualProvider *)self scrubProgress];
  [v36 setValue:0.0];

  unint64_t v37 = [(_UIInteractivePageControlVisualProvider *)self continuousDisplayedPage];
  v50[0] = v37;
  v38 = [(_UIInteractivePageControlVisualProvider *)self scrubProgress];
  v50[1] = v38;
  double v39 = [MEMORY[0x1E4F1C978] arrayWithObjects:v50 count:2];

  objc_initWeak(&location, self);
  v46[0] = MEMORY[0x1E4F143A8];
  v46[1] = 3221225472;
  v46[2] = __50___UIInteractivePageControlVisualProvider_prepare__block_invoke;
  v46[3] = &unk_1E52DC308;
  objc_copyWeak(&v47, &location);
  +[UIView _createTransformerWithInputAnimatableProperties:v39 presentationValueChangedCallback:v46];
  [(_UIInteractivePageControlVisualProvider *)self resetSuccessiveTapInfo];
  [(_UIInteractivePageControlVisualProvider *)self didUpdateCustomLayoutValues];
  double v40 = +[_UISelectionFeedbackGeneratorConfiguration pageControlConfiguration];
  double v41 = [v40 tweakedConfigurationForClass:objc_opt_class() usage:@"pageControl"];

  v42 = [(UIFeedbackGenerator *)[UISelectionFeedbackGenerator alloc] initWithConfiguration:v41 view:self->super._pageControl];
  [(_UIInteractivePageControlVisualProvider *)self setSelectionFeedbackGenerator:v42];

  double v43 = +[_UIImpactFeedbackGeneratorConfiguration lightConfiguration];
  double v44 = [v43 tweakedConfigurationForClass:objc_opt_class() usage:@"pageControl"];

  double v45 = [(UIFeedbackGenerator *)[UIImpactFeedbackGenerator alloc] initWithConfiguration:v44 view:self->super._pageControl];
  [(_UIInteractivePageControlVisualProvider *)self setJoggingFeedbackGenerator:v45];

  [(UIView *)self->super._pageControl setNeedsLayout];
  objc_destroyWeak(&v47);
  objc_destroyWeak(&location);
}

- (void)didUpdateCustomLayoutValues
{
  double v3 = -[_UIInteractivePageControlVisualProvider _indicatorSpacing]((uint64_t)self);
  double v4 = [(_UIInteractivePageControlVisualProvider *)self indicatorStore];
  [v4 setIndicatorSpacing:v3];

  [(UIView *)self->super._pageControl invalidateIntrinsicContentSize];
  pageControl = self->super._pageControl;
  [(UIView *)pageControl setNeedsLayout];
}

- (void)didUpdateInteractionTypeAvailability
{
  -[_UIInteractivePageControlVisualProvider updateScrubbingGestureRecognizer]((id *)&self->super.super.isa);
  [(UIView *)self->super._pageControl invalidateIntrinsicContentSize];
  [(UIView *)self->super._pageControl setNeedsLayout];
  if ([(UIPageControl *)self->super._pageControl _allowsDiscreteInteraction])
  {
    BOOL v3 = [(UIPageControl *)self->super._pageControl _prefersTargetPageForDiscreteInteraction];
    BOOL v4 = !v3;
    if (v3) {
      double v5 = 0.0;
    }
    else {
      double v5 = 0.15;
    }
  }
  else
  {
    BOOL v4 = 0;
    double v5 = 0.0;
  }
  double v6 = [(_UIInteractivePageControlVisualProvider *)self scrubbingGestureRecognizer];
  [v6 setMinimumPressDuration:v5];

  id v7 = [(_UIInteractivePageControlVisualProvider *)self tapGestureRecognizer];
  [v7 setEnabled:v4];
}

- (void)updateScrubbingGestureRecognizer
{
  if (a1)
  {
    uint64_t v2 = [a1[1] allowsContinuousInteraction];
    id v3 = [a1 scrubbingGestureRecognizer];
    [v3 setEnabled:v2];
  }
}

- (UILongPressGestureRecognizer)scrubbingGestureRecognizer
{
  return self->_scrubbingGestureRecognizer;
}

- (BOOL)supportsContinuousInteraction
{
  uint64_t v2 = [(UIView *)self->super._pageControl traitCollection];
  BOOL v3 = [v2 userInterfaceIdiom] != 6;

  return v3;
}

- (UITapGestureRecognizer)tapGestureRecognizer
{
  return self->_tapGestureRecognizer;
}

- (void)updateDisplayedPageToCurrentPage
{
  if ([(_UIInteractivePageControlVisualProvider *)self isScrubbing]
    && [(UIPageControl *)self->super._pageControl currentPage] != self->super._displayedPage)
  {
    BOOL v3 = [(_UIInteractivePageControlVisualProvider *)self scrubbingGestureRecognizer];
    [v3 setEnabled:0];

    BOOL v4 = [(_UIInteractivePageControlVisualProvider *)self scrubbingGestureRecognizer];
    [v4 setEnabled:1];
  }
  self->_targetPage = [(UIPageControl *)self->super._pageControl currentPage];
  [(_UIPageControlVisualProvider *)self setInteractionState:0];
  uint64_t v5 = [(UIPageControl *)self->super._pageControl currentPage];
  -[_UIInteractivePageControlVisualProvider _setDisplayedPage:completion:]((id *)&self->super.super.isa, v5, 0);
}

- (BOOL)isScrubbing
{
  return *(unsigned char *)&self->_state & 1;
}

- (void)_setDisplayedPage:(void *)a3 completion:
{
  uint64_t v5 = a3;
  if (a1)
  {
    double v6 = [a1 continuousDisplayedPage];
    [v6 value];
    double v8 = v7;

    if (v8 != (double)a2)
    {
      if ([a1 interactionState])
      {
        BOOL v9 = 1;
      }
      else
      {
        double v10 = [a1[1] window];
        BOOL v9 = v10 != 0;
      }
      uint64_t v11 = [a1 interactionState];
      double v12 = [a1 continuousDisplayedPage];
      [v12 value];
      uint64_t v14 = (uint64_t)v13;

      aBlock[0] = MEMORY[0x1E4F143A8];
      aBlock[1] = 3221225472;
      aBlock[2] = __72___UIInteractivePageControlVisualProvider__setDisplayedPage_completion___block_invoke;
      aBlock[3] = &unk_1E52DD178;
      aBlock[4] = a1;
      aBlock[5] = a2;
      aBlock[6] = v14;
      double v15 = _Block_copy(aBlock);
      BOOL v16 = v15;
      if (v9)
      {
        unsigned int v17 = -[_UIInteractivePageControlVisualProvider _hasActiveExpandedIndicator](a1);
        if (v17) {
          double v18 = 0.35;
        }
        else {
          double v18 = 0.15;
        }
        uint64_t v19 = v17 ^ 1;
        v25[0] = MEMORY[0x1E4F143A8];
        v25[1] = 3221225472;
        v25[2] = __72___UIInteractivePageControlVisualProvider__setDisplayedPage_completion___block_invoke_2;
        v25[3] = &unk_1E52DA040;
        id v26 = v16;
        v23[0] = MEMORY[0x1E4F143A8];
        v23[1] = 3221225472;
        v23[2] = __72___UIInteractivePageControlVisualProvider__setDisplayedPage_completion___block_invoke_3;
        v23[3] = &unk_1E52E8F50;
        double v24 = v5;
        +[UIView _animateUsingSpringWithDampingRatio:v19 response:v25 tracking:v23 dampingRatioSmoothing:1.0 responseSmoothing:v18 targetSmoothing:0.08 projectionDeceleration:1.0 animations:0.08 completion:0.995];
      }
      else
      {
        (*((void (**)(void *))v15 + 2))(v15);
        if (v5) {
          v5[2](v5);
        }
        -[_UIInteractivePageControlVisualProvider _updateReuseQueue]((uint64_t)a1);
        [a1[1] setNeedsLayout];
      }
      v34[0] = MEMORY[0x1E4F143A8];
      v34[1] = 3221225472;
      v34[2] = __93___UIInteractivePageControlVisualProvider_animateTransitionIndicatorsFromPage_toPage_ripple___block_invoke;
      v34[3] = &unk_1E52D9CD0;
      v34[4] = a1;
      v34[5] = v14;
      double v20 = v34;
      double v21 = 0.25;
      if (v11 == 1) {
        double v21 = 0.125;
      }
      uint64_t v28 = MEMORY[0x1E4F143A8];
      uint64_t v29 = 3221225472;
      double v30 = ___UIPageIndicatorAnimateFadeOut_block_invoke;
      double v31 = &unk_1E52DA040;
      double v32 = v20;
      +[UIView animateWithDuration:131076 delay:&v28 options:0 animations:v21 completion:0.0];

      uint64_t v28 = MEMORY[0x1E4F143A8];
      uint64_t v29 = 3221225472;
      double v30 = __93___UIInteractivePageControlVisualProvider_animateTransitionIndicatorsFromPage_toPage_ripple___block_invoke_2;
      double v31 = &unk_1E52D9CD0;
      double v32 = a1;
      uint64_t v33 = a2;
      double v22 = &v28;
      v35[0] = MEMORY[0x1E4F143A8];
      v35[1] = 3221225472;
      v35[2] = ___UIPageIndicatorAnimateFadeIn_block_invoke;
      v35[3] = &unk_1E52DA040;
      v36 = v22;
      +[UIView animateWithDuration:7 delay:v35 options:0 animations:0.015625 completion:0.0];
    }
  }
}

- (void)traitCollectionDidChangeOnSubtree:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  BOOL v4 = a3;
  uint64_t v5 = [(UIView *)self->super._pageControl traitCollection];
  if (v5)
  {
    if (v4)
    {
      uint64_t v6 = v5[13];
      uint64_t v7 = v4[13];

      if (v6 == v7) {
        goto LABEL_14;
      }
    }
    else
    {
    }
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    double v8 = [(_UIInteractivePageControlVisualProvider *)self indicatorFeed];
    BOOL v9 = [v8 indicators];

    uint64_t v10 = [v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v16;
      do
      {
        uint64_t v13 = 0;
        do
        {
          if (*(void *)v16 != v12) {
            objc_enumerationMutation(v9);
          }
          [*(id *)(*((void *)&v15 + 1) + 8 * v13++) sizeToFit];
        }
        while (v11 != v13);
        uint64_t v11 = [v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v11);
    }
  }
LABEL_14:
  [(_UIInteractivePageControlVisualProvider *)self didUpdateLayoutDirection];
  uint64_t v14 = [(_UIInteractivePageControlVisualProvider *)self indicatorStore];
  [v14 invalidateLayoutCache];

  [(UIView *)self->super._pageControl invalidateIntrinsicContentSize];
  [(UIView *)self->super._pageControl setNeedsLayout];
}

- (void)didUpdateLayoutDirection
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  BOOL v3 = self->super._pageControl;
  unint64_t v4 = 0;
  switch([(UIPageControl *)v3 direction])
  {
    case UIPageControlDirectionNatural:
      unint64_t v4 = [(UIView *)v3 _shouldReverseLayoutDirection];
      break;
    case UIPageControlDirectionRightToLeft:
      unint64_t v4 = 1;
      break;
    case UIPageControlDirectionTopToBottom:
      unint64_t v4 = 2;
      break;
    case UIPageControlDirectionBottomToTop:
      unint64_t v4 = 3;
      break;
    default:
      break;
  }

  uint64_t v5 = [(_UIInteractivePageControlVisualProvider *)self indicatorStore];
  [v5 setDirection:v4];

  if (v4 >= 2) {
    uint64_t v6 = 2;
  }
  else {
    uint64_t v6 = 16;
  }
  uint64_t v7 = [(_UIInteractivePageControlVisualProvider *)self indicatorContentView];
  [v7 setAutoresizingMask:v6];

  if (self->_resolvedDirection != v4)
  {
    self->_resolvedDirection = v4;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    double v8 = [(_UIInteractivePageControlVisualProvider *)self indicatorFeed];
    BOOL v9 = [v8 indicators];

    uint64_t v10 = [v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v15;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v15 != v12) {
            objc_enumerationMutation(v9);
          }
          [*(id *)(*((void *)&v14 + 1) + 8 * i) setDirection:v4];
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v11);
    }

    [(UIView *)self->super._pageControl invalidateIntrinsicContentSize];
    [(UIView *)self->super._pageControl setNeedsLayout];
  }
}

- (unint64_t)maxVisibleIndicators
{
  if (self->super._pageControl->_preferredNumberOfVisibleIndicators <= 0xA) {
    return 10;
  }
  else {
    return self->super._pageControl->_preferredNumberOfVisibleIndicators;
  }
}

- (void)setTapGestureRecognizer:(id)a3
{
}

- (void)setSelectionFeedbackGenerator:(id)a3
{
}

- (void)setScrubbingGestureRecognizer:(id)a3
{
}

- (void)setScrubProgress:(id)a3
{
}

- (void)setPreviousMoveDirection:(int64_t)a3
{
  self->_previousMoveDirection = a3;
}

- (void)setJoggingFeedbackGenerator:(id)a3
{
}

- (void)setInteractor:(id)a3
{
}

- (void)setIndicatorTransformCurve:(id)a3
{
}

- (void)setIndicatorStore:(id)a3
{
}

- (void)setIndicatorFeed:(id)a3
{
}

- (void)setIndicatorContentView:(id)a3
{
}

- (void)setContinuousDisplayedPage:(id)a3
{
}

- (void)setContentView:(id)a3
{
}

- (void)resetSuccessiveTapInfo
{
  -[_UIInteractivePageControlVisualProvider setPreviousTouchLocation:](self, "setPreviousTouchLocation:", -100.0, -100.0);
  [(_UIInteractivePageControlVisualProvider *)self setPreviousMoveDirection:0];
}

- (void)setPreviousTouchLocation:(CGPoint)a3
{
  self->_previousTouchLocation = a3;
}

- (double)_intrinsicContentSizeWithPageControlSize:(double)a3 includeExpandedActiveIndicator:(double)a4
{
  if (!a1) {
    return 0.0;
  }
  if (qword_1EB25E750 != -1) {
    dispatch_once(&qword_1EB25E750, &__block_literal_global_562);
  }
  int v8 = _MergedGlobals_23_2;
  if (_MergedGlobals_23_2)
  {
    if (-[_UIInteractivePageControlVisualProvider _hasContentScaling](a1)) {
      double v9 = 1.05;
    }
    else {
      double v9 = 1.0;
    }
  }
  else
  {
    double v9 = 1.0;
  }
  if ((unint64_t)[a1 resolvedDirection] >= 2) {
    double v10 = a4;
  }
  else {
    double v10 = a3;
  }
  double v11 = v10 / v9;
  uint64_t v12 = [a1[1] backgroundStyle];
  uint64_t v13 = a1[1];
  if (v12 != 2 || (v13[468] & 3) != 0)
  {
    double v14 = 28.0;
    if ((v13[468] & 2) != 0)
    {
      objc_msgSend(v13, "_customHorizontalPadding", 28.0);
      double v14 = v15 + v15;
      uint64_t v13 = a1[1];
    }
    double v11 = v11 - v14;
  }
  if (![v13 numberOfPages]) {
    return *MEMORY[0x1E4F1DB30];
  }
  if (v8)
  {
    int v16 = [a1[1] allowsContinuousInteraction];
    double v17 = 42.5;
    if (!v16) {
      double v17 = 0.0;
    }
  }
  else
  {
    double v17 = 0.0;
  }
  double v19 = ceil(v11 - v17);
  uint64_t v20 = [a1 indicatorStore];
  [v20 sizeForMaximumContentSizeFittingLength:a2 hasExpandedActiveIndicator:v19];
  double v22 = v21;
  double v24 = v23;

  if ([a1[1] backgroundStyle] != 2 || (float v25 = a1[1], (v25[468] & 3) != 0))
  {
    unint64_t v26 = [a1 resolvedDirection];
    float v25 = a1[1];
    char v27 = v25[468];
    if ((v27 & 2) != 0)
    {
      [v25 _customHorizontalPadding];
      double v28 = v29;
      float v25 = a1[1];
      char v27 = v25[468];
    }
    else
    {
      double v28 = 14.0;
    }
    double v30 = 8.0;
    if (v27)
    {
      objc_msgSend(v25, "_customVerticalPadding", 8.0);
      float v25 = a1[1];
    }
    if (v26 >= 2) {
      double v31 = v30;
    }
    else {
      double v31 = v28;
    }
    if (v26 >= 2) {
      double v30 = v28;
    }
    double v24 = v24 + v30 + v30;
    double v22 = v22 + v31 + v31;
  }
  [v25 _currentScreenScale];
  double v33 = v32;
  UICeilToScale(v22, v32);
  double v18 = v34;
  UICeilToScale(v24, v33);
  return v18;
}

- (CGSize)indicatorSizeForImage:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(_UIInteractivePageControlVisualProvider *)self indicatorFeed];
  [v5 indicatorSizeForCustomImage:v4];
  double v7 = v6;
  double v9 = v8;

  double v10 = v7;
  double v11 = v9;
  result.height = v11;
  result.width = v10;
  return result;
}

- (void)_updateIndicatorTintColor
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    uint64_t v2 = -[_UIInteractivePageControlVisualProvider _indicatorColorForEnabled:](a1, 1);
    BOOL v3 = -[_UIInteractivePageControlVisualProvider _indicatorColorForEnabled:](a1, 0);
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v4 = objc_msgSend(a1, "indicatorFeed", 0);
    uint64_t v5 = [v4 indicators];

    uint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v16;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v16 != v8) {
            objc_enumerationMutation(v5);
          }
          double v10 = *(void **)(*((void *)&v15 + 1) + 8 * i);
          double v11 = (double)[v10 page];
          uint64_t v12 = [a1 continuousDisplayedPage];
          [v12 value];
          BOOL v14 = v13 == v11;

          -[_UIInteractivePageControlVisualProvider _transitionIndicatorForPage:toEnabled:](a1, [v10 page], v14);
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v7);
    }
  }
}

- (BOOL)_indicatorModeForPage:(id *)a1
{
  BOOL v2 = (BOOL)a1;
  if (a1)
  {
    if (-[_UIInteractivePageControlVisualProvider _hasActiveExpandedIndicator](a1))
    {
      double v4 = (double)a2;
      uint64_t v5 = [(id)v2 continuousDisplayedPage];
      [v5 value];
      BOOL v2 = v6 == v4;
    }
    else
    {
      return 0;
    }
  }
  return v2;
}

- (CGRect)indicatorFrameForPage:(int64_t)a3
{
  uint64_t v5 = [(_UIInteractivePageControlVisualProvider *)self indicatorFeed];
  double v6 = [v5 activeIndicatorForPage:a3];

  if (v6)
  {
    [v6 bounds];
    objc_msgSend(v6, "convertRect:toView:", self->super._pageControl);
    double v8 = v7;
    double v10 = v9;
    double v12 = v11;
    double v14 = v13;
  }
  else
  {
    double v8 = *MEMORY[0x1E4F1DB20];
    double v10 = *(double *)(MEMORY[0x1E4F1DB20] + 8);
    double v12 = *(double *)(MEMORY[0x1E4F1DB20] + 16);
    double v14 = *(double *)(MEMORY[0x1E4F1DB20] + 24);
  }

  double v15 = v8;
  double v16 = v10;
  double v17 = v12;
  double v18 = v14;
  result.size.height = v18;
  result.size.width = v17;
  result.origin.y = v16;
  result.origin.x = v15;
  return result;
}

- (void)configureIndicator:(id)a3 atPage:(int64_t)a4
{
  id v6 = a3;
  double v7 = -[_UIInteractivePageControlVisualProvider _indicatorScaleForPage:]((uint64_t)self, a4);
  CGAffineTransformMakeScale(&v18, v7, v7);
  CGAffineTransform v17 = v18;
  [v6 setTransform:&v17];
  objc_msgSend(v6, "setDirection:", -[_UIInteractivePageControlVisualProvider resolvedDirection](self, "resolvedDirection"));
  [v6 setSupportsExpandedIndicator:-[_UIInteractivePageControlVisualProvider _supportsExpandedIndicator]((uint64_t)self)];
  double v8 = -[_UIInteractivePageControlVisualProvider _indicatorColorForEnabled:]((id *)&self->super.super.isa, 1);
  [v6 setActiveIndicatorColor:v8];

  double v9 = -[_UIInteractivePageControlVisualProvider _indicatorColorForEnabled:]((id *)&self->super.super.isa, 0);
  [v6 setIndicatorColor:v9];

  [(_UIPageControlVisualProvider *)self pageIndicatorVibrantColorMatrix];
  v16[2] = v16[7];
  v16[3] = v16[8];
  v16[4] = v16[9];
  v16[0] = v16[5];
  v16[1] = v16[6];
  [v6 setVibrantColorMatrix:v16];
  [(_UIPageControlVisualProvider *)self activePageIndicatorVibrantColorMatrix];
  v15[2] = v15[7];
  v15[3] = v15[8];
  v15[4] = v15[9];
  v15[0] = v15[5];
  v15[1] = v15[6];
  [v6 setActiveVibrantColorMatrix:v15];
  double v10 = [(_UIInteractivePageControlVisualProvider *)self continuousDisplayedPage];
  [v10 value];
  [v6 setActive:(uint64_t)v11 == a4];

  double v12 = [(_UIInteractivePageControlVisualProvider *)self continuousDisplayedPage];
  [v12 value];
  if (self)
  {
    if ((uint64_t)v13 >= a4) {
      uint64_t v14 = 2 * ((uint64_t)v13 > a4);
    }
    else {
      uint64_t v14 = 1;
    }
  }
  else
  {
    uint64_t v14 = 0;
  }

  objc_msgSend(v6, "setMode:direction:", -[_UIInteractivePageControlVisualProvider _indicatorModeForPage:]((id *)&self->super.super.isa, a4), v14);
}

- (void)_transitionIndicatorForPage:(uint64_t)a3 toEnabled:
{
  if (a1)
  {
    id v6 = [a1 indicatorFeed];
    double v7 = [v6 indicators];
    double v8 = [v7 firstObject];
    unint64_t v9 = a2 - [v8 page];

    if ((v9 & 0x8000000000000000) == 0)
    {
      double v10 = [a1 indicatorFeed];
      double v11 = [v10 indicators];
      unint64_t v12 = [v11 count];

      if (v9 < v12)
      {
        double v13 = [a1 indicatorFeed];
        uint64_t v14 = [v13 indicatorForPage:a2];

        double v15 = -[_UIInteractivePageControlVisualProvider _indicatorColorForEnabled:]((id *)a1, 1);
        [v14 setActiveIndicatorColor:v15];

        double v16 = -[_UIInteractivePageControlVisualProvider _indicatorColorForEnabled:]((id *)a1, 0);
        [v14 setIndicatorColor:v16];

        [a1 pageIndicatorVibrantColorMatrix];
        v18[2] = v18[7];
        v18[3] = v18[8];
        v18[4] = v18[9];
        v18[0] = v18[5];
        v18[1] = v18[6];
        [v14 setVibrantColorMatrix:v18];
        [a1 activePageIndicatorVibrantColorMatrix];
        v17[2] = v17[7];
        v17[3] = v17[8];
        v17[4] = v17[9];
        v17[0] = v17[5];
        v17[1] = v17[6];
        [v14 setActiveVibrantColorMatrix:v17];
        [v14 setActive:a3];
      }
    }
  }
}

- (id)_indicatorColorForEnabled:(id *)a1
{
  BOOL v2 = a1;
  if (a1)
  {
    if (a2)
    {
      BOOL v3 = [a1[1] currentPageIndicatorTintColor];
      if (!v3)
      {
        double v4 = +[UIColor systemWhiteColor];
LABEL_12:
        BOOL v2 = v4;

        goto LABEL_13;
      }
LABEL_11:
      double v4 = v3;
      goto LABEL_12;
    }
    char v5 = [a1 isPlatterExpanded];
    id v6 = v2[1];
    if ((v5 & 1) == 0)
    {
      BOOL v3 = [v6 pageIndicatorTintColor];
      if (!v3)
      {
        double v4 = +[UIColor _pageControlIndicatorColor];
        goto LABEL_12;
      }
      goto LABEL_11;
    }
    if ([v6 backgroundStyle] != 1
      || !dyld_program_sdk_at_least()
      || ([v2[1] pageIndicatorTintColor], (BOOL v2 = (id *)objc_claimAutoreleasedReturnValue()) == 0))
    {
      BOOL v2 = +[UIColor _pageControlPlatterIndicatorColor];
    }
  }
LABEL_13:
  return v2;
}

- (BOOL)isPlatterExpanded
{
  return (*(unsigned char *)&self->_state >> 1) & 1;
}

- (void)_updateReuseQueue
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    uint64_t v2 = *(void *)(a1 + 312);
    uint64_t v3 = *(void *)(a1 + 320);
    uint64_t v4 = [*(id *)(a1 + 8) numberOfPages];
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    char v5 = objc_msgSend((id)a1, "indicatorFeed", 0);
    id v6 = [v5 indicators];

    uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = (uint64_t)fmax((double)(v2 - 2), 0.0);
      uint64_t v10 = (uint64_t)fmin((double)(v2 + v3 + 2), (double)v4);
      uint64_t v11 = *(void *)v16;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v16 != v11) {
            objc_enumerationMutation(v6);
          }
          double v13 = *(void **)(*((void *)&v15 + 1) + 8 * i);
          if ([v13 page] < v9 || objc_msgSend(v13, "page") >= v10) {
            [v13 invalidate];
          }
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v8);
    }

    uint64_t v14 = [(id)a1 indicatorFeed];
    [v14 updateReuseQueue];
  }
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  if ((unint64_t)[(_UIInteractivePageControlVisualProvider *)self resolvedDirection] >= 2) {
    double v6 = height;
  }
  else {
    double v6 = width;
  }
  if (v6 == 0.0)
  {
    [(_UIInteractivePageControlVisualProvider *)self intrinsicContentSize];
  }
  else
  {
    if (self)
    {
      uint64_t v9 = [(UIPageControl *)self->super._pageControl progress];

      if (v9) {
        uint64_t v10 = 4;
      }
      else {
        uint64_t v10 = 5;
      }
      unint64_t v11 = [(_UIInteractivePageControlVisualProvider *)self resolvedDirection];
      unint64_t v12 = [(_UIInteractivePageControlVisualProvider *)self indicatorStore];
      [v12 defaultIndicatorSize];
      if (v11 >= 2) {
        double v13 = v14;
      }
      double v15 = v13 * (double)v10;
      double v16 = -[_UIInteractivePageControlVisualProvider _indicatorSpacing]((uint64_t)self) * (double)(v10 - 1);
      pageControl = self->super._pageControl;
      double v18 = 28.0;
      if ((*(unsigned char *)&pageControl->_custom & 2) != 0)
      {
        [(UIPageControl *)pageControl _customHorizontalPadding];
        double v18 = v19 + v19;
      }
      double v20 = v16 + v15;

      if (qword_1EB25E750 != -1) {
        dispatch_once(&qword_1EB25E750, &__block_literal_global_562);
      }
      double v21 = v20 + v18;
      if (_MergedGlobals_23_2)
      {
        BOOL v22 = [(UIPageControl *)self->super._pageControl allowsContinuousInteraction];
        double v23 = 42.5;
        if (!v22) {
          double v23 = 0.0;
        }
        double v24 = v21 + v23;
        int hasContent = -[_UIInteractivePageControlVisualProvider _hasContentScaling]((id *)&self->super.super.isa);
        double v26 = 1.05;
        if (!hasContent) {
          double v26 = 1.0;
        }
        double v21 = v24 * v26;
      }
    }
    else
    {
      double v21 = 0.0;
    }
    unint64_t v27 = [(_UIInteractivePageControlVisualProvider *)self resolvedDirection];
    if ((unint64_t)[(_UIInteractivePageControlVisualProvider *)self resolvedDirection] >= 2) {
      double v28 = height;
    }
    else {
      double v28 = width;
    }
    double v29 = fmax(v21, v28);
    if (v27 >= 2) {
      double height = v29;
    }
    else {
      double width = v29;
    }
    BOOL v30 = -[_UIInteractivePageControlVisualProvider _supportsExpandedIndicator]((uint64_t)self);
    double v31 = [(_UIInteractivePageControlVisualProvider *)(id *)&self->super.super.isa _intrinsicContentSizeWithPageControlSize:width includeExpandedActiveIndicator:height];
    double v33 = v32;
    if (qword_1EB25E750 != -1) {
      dispatch_once(&qword_1EB25E750, &__block_literal_global_562);
    }
    if (_MergedGlobals_23_2)
    {
      unint64_t v34 = [(_UIInteractivePageControlVisualProvider *)self resolvedDirection];
      if (self)
      {
        BOOL v35 = [(UIPageControl *)self->super._pageControl allowsContinuousInteraction];
        double v36 = 42.5;
        if (!v35) {
          double v36 = 0.0;
        }
      }
      else
      {
        double v36 = 0.0;
      }
      if (v34 >= 2) {
        double v37 = v33;
      }
      else {
        double v37 = v31;
      }
      double v38 = v37 + v36;
      if (v34 >= 2) {
        double v39 = v31;
      }
      else {
        double v39 = v38;
      }
      if (v34 >= 2) {
        double v33 = v38;
      }
      [(_UIInteractivePageControlVisualProvider *)(uint64_t)v41 _contentTransformForActiveState:1];
      double v31 = v39 * v41[0] + v33 * v41[2];
      double v33 = v39 * v41[1] + v33 * v41[3];
    }
    [(UIView *)self->super._pageControl _currentScreenScale];
    double v7 = UISizeRoundToScale(v31, v33, v40);
  }
  result.double height = v8;
  result.double width = v7;
  return result;
}

- (CGSize)sizeForNumberOfPages:(int64_t)a3
{
  char v5 = [(_UIInteractivePageControlVisualProvider *)self indicatorStore];
  [v5 contentSizeForNumberOfPages:a3 hasExpandedActiveIndicator:-[_UIInteractivePageControlVisualProvider _supportsExpandedIndicator]((uint64_t)self)];
  double v7 = v6;
  double v9 = v8;

  if (self
    && ([(UIPageControl *)self->super._pageControl backgroundStyle] != UIPageControlBackgroundStyleMinimal
     || (*(unsigned char *)&self->super._pageControl->_custom & 3) != 0))
  {
    unint64_t v10 = [(_UIInteractivePageControlVisualProvider *)self resolvedDirection];
    pageControl = self->super._pageControl;
    char custom = (char)pageControl->_custom;
    if (v10 > 1)
    {
      double v13 = 16.0;
      if (*(unsigned char *)&pageControl->_custom)
      {
        [(UIPageControl *)pageControl _customVerticalPadding];
        double v13 = v17 + v17;
        pageControl = self->super._pageControl;
        char custom = (char)pageControl->_custom;
      }
      double v15 = 28.0;
      if ((custom & 2) == 0) {
        goto LABEL_14;
      }
      [(UIPageControl *)pageControl _customHorizontalPadding];
    }
    else
    {
      double v13 = 28.0;
      if ((*(unsigned char *)&pageControl->_custom & 2) != 0)
      {
        [(UIPageControl *)pageControl _customHorizontalPadding];
        double v13 = v14 + v14;
        pageControl = self->super._pageControl;
        char custom = (char)pageControl->_custom;
      }
      double v15 = 16.0;
      if ((custom & 1) == 0) {
        goto LABEL_14;
      }
      [(UIPageControl *)pageControl _customVerticalPadding];
    }
    double v15 = v16 + v16;
LABEL_14:
    double v7 = v7 + v13;
    double v9 = v9 + v15;
  }
  if (qword_1EB25E750 != -1) {
    dispatch_once(&qword_1EB25E750, &__block_literal_global_562);
  }
  if (_MergedGlobals_23_2)
  {
    unint64_t v18 = [(_UIInteractivePageControlVisualProvider *)self resolvedDirection];
    double v19 = 0.0;
    double v20 = 0.0;
    if (self)
    {
      BOOL v21 = [(UIPageControl *)self->super._pageControl allowsContinuousInteraction];
      double v20 = 42.5;
      if (!v21) {
        double v20 = 0.0;
      }
    }
    if (v18 >= 2) {
      double v22 = v9;
    }
    else {
      double v22 = v7;
    }
    double v23 = v22 + v20;
    if (v18 >= 2) {
      double v9 = v23;
    }
    else {
      double v7 = v23;
    }
    unint64_t v24 = [(_UIInteractivePageControlVisualProvider *)self resolvedDirection];
    if ((unint64_t)[(_UIInteractivePageControlVisualProvider *)self resolvedDirection] >= 2) {
      double v25 = v9;
    }
    else {
      double v25 = v7;
    }
    if (self)
    {
      if (-[_UIInteractivePageControlVisualProvider _hasContentScaling]((id *)&self->super.super.isa)) {
        double v19 = 1.05;
      }
      else {
        double v19 = 1.0;
      }
    }
    if (v24 >= 2) {
      double v9 = v25 * v19;
    }
    else {
      double v7 = v25 * v19;
    }
  }
  double v26 = v7;
  double v27 = v9;
  result.double height = v27;
  result.double width = v26;
  return result;
}

- (BOOL)_supportsExpandedIndicator
{
  if (!a1) {
    return 0;
  }
  uint64_t v1 = [*(id *)(a1 + 8) progress];
  BOOL v2 = v1 != 0;

  return v2;
}

- (void)configureIndicatorImagesForIndicator:(id)a3 atPage:(int64_t)a4
{
  id v6 = a3;
  double v7 = [(_UIInteractivePageControlVisualProvider *)self indicatorStore];
  double v8 = [v7 indicatorImageForPage:a4];
  [v6 setImage:v8];

  id v10 = [(_UIInteractivePageControlVisualProvider *)self indicatorStore];
  double v9 = [v10 activeIndicatorImageForPage:a4];
  [v6 setActiveImage:v9];
}

- (id)_resolvedVisualEffect
{
  if (a1)
  {
    BOOL v2 = a1;
    uint64_t v3 = [a1[1] _platterEffect];

    if (v3) {
      [v2[1] _platterEffect];
    }
    else {
    a1 = +[UIBlurEffect effectWithStyle:7];
    }
    uint64_t v1 = vars8;
  }
  return a1;
}

- (CGSize)intrinsicContentSize
{
  if (self)
  {
    if (self->super._pageControl->_preferredNumberOfVisibleIndicators) {
      unint64_t preferredNumberOfVisibleIndicators = self->super._pageControl->_preferredNumberOfVisibleIndicators;
    }
    else {
      unint64_t preferredNumberOfVisibleIndicators = 8;
    }
  }
  else
  {
    unint64_t preferredNumberOfVisibleIndicators = 0;
  }
  [(_UIInteractivePageControlVisualProvider *)self sizeForNumberOfPages:preferredNumberOfVisibleIndicators];
  -[_UIInteractivePageControlVisualProvider sizeThatFits:](self, "sizeThatFits:");
  result.double height = v5;
  result.double width = v4;
  return result;
}

- (void)setCustomIndicatorImage:(id)a3 forPage:(int64_t)a4
{
  id v14 = a3;
  id v6 = [(_UIInteractivePageControlVisualProvider *)self indicatorStore];
  double v7 = [v6 customIndicatorImageForPage:a4];
  char v8 = [v7 isEqual:v14];

  if ((v8 & 1) == 0)
  {
    double v9 = [(_UIInteractivePageControlVisualProvider *)self indicatorStore];
    [v9 updateImage:v14 forPage:a4];

    id v10 = [(_UIInteractivePageControlVisualProvider *)self indicatorFeed];
    [v10 reloadIndicatorImageForPage:a4];

    unint64_t v11 = [(_UIInteractivePageControlVisualProvider *)self continuousDisplayedPage];
    [v11 value];
    unint64_t v13 = llround(v12);

    -[_UIInteractivePageControlVisualProvider _transitionIndicatorForPage:toEnabled:](self, a4, v13 == a4);
    [(UIView *)self->super._pageControl invalidateIntrinsicContentSize];
    [(UIView *)self->super._pageControl setNeedsLayout];
  }
}

- (void)pruneArchivedSubviews:(id)a3
{
  id v4 = a3;
  id v5 = [(_UIInteractivePageControlVisualProvider *)self contentView];
  [v4 removeObject:v5];
}

- (BOOL)shouldDisableTouchTracking
{
  return 1;
}

- (double)_contentTransformForActiveState:(int)a3
{
  if (a2)
  {
    int hasContent = -[_UIInteractivePageControlVisualProvider _hasContentScaling](a2);
    if (a3)
    {
      double v6 = 1.05;
      if (!hasContent) {
        double v6 = 1.0;
      }
      CGAffineTransformMakeScale((CGAffineTransform *)a1, v6, v6);
    }
    else
    {
      uint64_t v8 = MEMORY[0x1E4F1DAB8];
      long long v9 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
      *(_OWORD *)a1 = *MEMORY[0x1E4F1DAB8];
      *(_OWORD *)(a1 + 16) = v9;
      long long v7 = *(_OWORD *)(v8 + 32);
      *(_OWORD *)(a1 + 32) = v7;
    }
  }
  else
  {
    *(void *)&long long v7 = 0;
    *(_OWORD *)(a1 + 16) = 0u;
    *(_OWORD *)(a1 + 32) = 0u;
    *(_OWORD *)a1 = 0u;
  }
  return *(double *)&v7;
}

- (void)setPreciseTouchedPage:(double)a3
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  double preciseTouchedPage = self->_preciseTouchedPage;
  if (preciseTouchedPage != a3)
  {
    self->_double preciseTouchedPage = a3;
    memset(&v48, 0, sizeof(v48));
    [(_UIPageControlVisualProvider *)self activeTransformForTouchedPage];
    CGAffineTransform v47 = v48;
    if (!CGAffineTransformIsIdentity(&v47))
    {
      memset(&v47, 0, sizeof(v47));
      [(_UIPageControlVisualProvider *)self targetTransformForTouchedPage];
      CGAffineTransform v46 = v47;
      BOOL IsIdentity = CGAffineTransformIsIdentity(&v46);
      double v7 = floor(a3);
      if (a3 >= 0.0) {
        double v8 = (double)(uint64_t)a3;
      }
      else {
        double v8 = v7;
      }
      NSInteger v9 = [(UIPageControl *)self->super._pageControl numberOfPages];
      if (fmax(fmin((double)(uint64_t)v8, (double)([(UIPageControl *)self->super._pageControl numberOfPages] - 1)), 0.0) == (double)(uint64_t)v8)
      {
        double v10 = floor(preciseTouchedPage);
        if (preciseTouchedPage >= 0.0) {
          double v10 = (double)(uint64_t)preciseTouchedPage;
        }
        if (preciseTouchedPage != -1.79769313e308
          && fmax(fmin((double)(uint64_t)v10, (double)(v9 - 1)), 0.0) != (double)(uint64_t)v10)
        {
          unint64_t v11 = [(_UIInteractivePageControlVisualProvider *)self selectionFeedbackGenerator];
          [(UIView *)self->super._pageControl center];
          objc_msgSend(v11, "selectionChangedAtLocation:");
        }
      }
      char state = (char)self->_state;
      long long v42 = 0u;
      long long v43 = 0u;
      long long v44 = 0u;
      long long v45 = 0u;
      double v12 = [(_UIInteractivePageControlVisualProvider *)self indicatorFeed];
      unint64_t v13 = [v12 indicators];

      id obj = v13;
      uint64_t v14 = [v13 countByEnumeratingWithState:&v42 objects:v49 count:16];
      if (v14)
      {
        uint64_t v15 = v14;
        uint64_t v16 = *(void *)v43;
        int v17 = (state & 4) == 0 || IsIdentity;
        int v28 = v17;
        long long v32 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
        long long v33 = *MEMORY[0x1E4F1DAB8];
        long long v31 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
        do
        {
          for (uint64_t i = 0; i != v15; ++i)
          {
            if (*(void *)v43 != v16) {
              objc_enumerationMutation(obj);
            }
            double v19 = *(void **)(*((void *)&v42 + 1) + 8 * i);
            *(_OWORD *)&v46.a = v33;
            *(_OWORD *)&v46.c = v32;
            *(_OWORD *)&v46.tx = v31;
            *(_OWORD *)&v41.a = v33;
            *(_OWORD *)&v41.c = v32;
            *(_OWORD *)&v41.tx = v31;
            if (a3 == -1.79769313e308)
            {
              *(_OWORD *)&v46.a = v33;
              *(_OWORD *)&v46.c = v32;
              *(_OWORD *)&v46.tx = v31;
              goto LABEL_33;
            }
            if ([v19 page] == (uint64_t)v8)
            {
              if ((state & 4) != 0)
              {
                CGAffineTransform v46 = v48;
              }
              else
              {
                CGAffineTransformComponents v40 = (CGAffineTransformComponents)v48;
                _UITransformLerp(MEMORY[0x1E4F1DAB8], &v40, (uint64_t)&v46, 0.333333333);
              }
              *(_OWORD *)&v41.a = *(_OWORD *)&v46.a;
              *(_OWORD *)&v41.c = *(_OWORD *)&v46.c;
              long long v20 = *(_OWORD *)&v46.tx;
            }
            else
            {
              if (v28)
              {
                *(_OWORD *)&v46.a = v33;
                *(_OWORD *)&v46.c = v32;
                *(_OWORD *)&v46.tx = v31;
                goto LABEL_33;
              }
              double v21 = fmax(fmin(vabdd_f64(a3, (double)[v19 page]) * -0.25 + 1.0, 1.0), 0.0);
              CGAffineTransform transform = v47;
              _UITransformLerp(MEMORY[0x1E4F1DAB8], &transform, (uint64_t)&v40, v21);
              CGAffineTransform v46 = (CGAffineTransform)v40;
              if (fabs(v21) >= 2.22044605e-16)
              {
                *(_OWORD *)&v41.a = *(_OWORD *)&v47.a;
                *(_OWORD *)&v41.c = *(_OWORD *)&v47.c;
                long long v20 = *(_OWORD *)&v47.tx;
              }
              else
              {
                *(_OWORD *)&v41.a = v33;
                *(_OWORD *)&v41.c = v32;
                long long v20 = v31;
              }
            }
            *(_OWORD *)&v41.tx = v20;
LABEL_33:
            CGAffineTransform transform = v41;
            memset(&v40, 0, sizeof(v40));
            CGAffineTransformDecompose(&v40, &transform);
            objc_msgSend(v19, "setImageDisplayScaleFactor:", fmax(v40.scale.width, v40.scale.height));
            aBlock[0] = MEMORY[0x1E4F143A8];
            aBlock[1] = 3221225472;
            aBlock[2] = __65___UIInteractivePageControlVisualProvider_setPreciseTouchedPage___block_invoke;
            aBlock[3] = &unk_1E52E7948;
            aBlock[4] = v19;
            CGAffineTransform v38 = v46;
            double v22 = _Block_copy(aBlock);
            CGAffineTransform transform = v46;
            CGAffineTransform t2 = v48;
            BOOL v23 = CGAffineTransformEqualToTransform(&transform, &t2);
            if (v23) {
              double v24 = 0.49991;
            }
            else {
              double v24 = 1.0;
            }
            if (v23) {
              double v25 = 0.4;
            }
            else {
              double v25 = 0.25;
            }
            BOOL v26 = !v23;
            v34[0] = MEMORY[0x1E4F143A8];
            v34[1] = 3221225472;
            v34[2] = __65___UIInteractivePageControlVisualProvider_setPreciseTouchedPage___block_invoke_2;
            v34[3] = &unk_1E52DA040;
            id v35 = v22;
            id v27 = v22;
            +[UIView _animateUsingSpringWithDampingRatio:v26 response:v34 tracking:0 dampingRatioSmoothing:v24 responseSmoothing:v25 targetSmoothing:0.08 projectionDeceleration:1.0 animations:0.0 completion:0.0];
          }
          uint64_t v15 = [obj countByEnumeratingWithState:&v42 objects:v49 count:16];
        }
        while (v15);
      }
    }
  }
}

- (void)setPage:(int64_t)a3 interactionState:(int64_t)a4
{
  [(_UIPageControlVisualProvider *)self setInteractionState:a4];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __68___UIInteractivePageControlVisualProvider_setPage_interactionState___block_invoke;
  v7[3] = &unk_1E52DD178;
  v7[4] = self;
  v7[5] = a3;
  v7[6] = a4;
  -[_UIInteractivePageControlVisualProvider _updateCurrentPage:completion:]((id *)&self->super.super.isa, a3, v7);
}

- (void)_updateCurrentPage:(void *)a3 completion:
{
  if (a1)
  {
    id v5 = a1[1];
    id v6 = a3;
    [v5 _updateCurrentPage:a2 updateDisplayImmediately:0];
    [a1[1] _emitValueChanged];
    -[_UIInteractivePageControlVisualProvider _setDisplayedPage:completion:](a1, a2, v6);
  }
}

- (void)didUpdateBackgroundStyle
{
  -[_UIInteractivePageControlVisualProvider _updateCurrentPlatterMode]((uint64_t)self);
  [(UIView *)self->super._pageControl invalidateIntrinsicContentSize];
  pageControl = self->super._pageControl;
  [(UIView *)pageControl setNeedsLayout];
}

- (uint64_t)_updateCurrentPlatterMode
{
  if (result)
  {
    uint64_t v1 = (void *)result;
    CGSize result = [*(id *)(result + 8) backgroundStyle];
    if (result == 2)
    {
      uint64_t v2 = 0;
    }
    else if (result == 1)
    {
      uint64_t v2 = 1;
    }
    else
    {
      if (result) {
        return result;
      }
      uint64_t v2 = [v1 isScrubbing];
    }
    return [v1 setPlatterExpanded:v2];
  }
  return result;
}

- (void)didUpdateBackgroundEffect
{
  char custom = (char)self->super._pageControl->_custom;
  id v4 = self->_backgroundView;
  if ((custom & 8) == 0)
  {
    double v7 = v4;
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
    id v4 = v7;
    if (isKindOfClass)
    {
      id v6 = -[_UIInteractivePageControlVisualProvider _resolvedVisualEffect]((id *)&self->super.super.isa);
      [(UIView *)v7 setEffect:v6];

      id v4 = v7;
    }
  }
}

- (void)didUpdatePageProgress
{
  [(UIView *)self->super._pageControl invalidateIntrinsicContentSize];
  [(UIView *)self->super._pageControl setNeedsLayout];
  -[_UIInteractivePageControlVisualProvider _updateIndicatorMode]((id *)&self->super.super.isa);
  uint64_t v3 = -[_UIInteractivePageControlVisualProvider _hasActiveExpandedIndicator]((id *)&self->super.super.isa);
  id v4 = [(UIPageControl *)self->super._pageControl progress];
  [v4 _progressVisibilityChanged:v3];
}

- (id)_updateIndicatorMode
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    uint64_t v1 = result;
    uint64_t v2 = [result continuousDisplayedPage];
    [v2 value];
    double v4 = v3;

    id v5 = [v1[1] progress];

    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v6 = [v1 indicatorFeed];
    double v7 = [v6 indicators];

    id obj = v7;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = (uint64_t)v4;
      uint64_t v11 = *(void *)v19;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v19 != v11) {
            objc_enumerationMutation(obj);
          }
          unint64_t v13 = *(void **)(*((void *)&v18 + 1) + 8 * i);
          uint64_t v14 = [v13 page];
          if (v14 > v10) {
            uint64_t v15 = 1;
          }
          else {
            uint64_t v15 = 2 * (v14 < v10);
          }
          BOOL v16 = -[_UIInteractivePageControlVisualProvider _indicatorModeForPage:](v1, [v13 page]);
          [v13 setSupportsExpandedIndicator:v5 != 0];
          [v13 setMode:v16 direction:v15];
        }
        uint64_t v9 = [obj countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v9);
    }

    return (id *)[v1 didUpdateCurrentPageProgress];
  }
  return result;
}

- (void)didUpdateCurrentPageProgress
{
  double v3 = [(_UIInteractivePageControlVisualProvider *)self indicatorFeed];
  objc_msgSend(v3, "activeIndicatorForPage:", -[UIPageControl currentPage](self->super._pageControl, "currentPage"));
  id v5 = (id)objc_claimAutoreleasedReturnValue();

  double v4 = [(UIPageControl *)self->super._pageControl progress];
  [v4 currentProgress];
  objc_msgSend(v5, "setCurrentProgress:");
}

- (void)setPageIndicatorVibrantColorMatrix:(CAColorMatrix *)a3
{
  v7.receiver = self;
  v7.super_class = (Class)_UIInteractivePageControlVisualProvider;
  long long v4 = *(_OWORD *)&a3->m33;
  v6[2] = *(_OWORD *)&a3->m24;
  v6[3] = v4;
  v6[4] = *(_OWORD *)&a3->m42;
  long long v5 = *(_OWORD *)&a3->m15;
  v6[0] = *(_OWORD *)&a3->m11;
  v6[1] = v5;
  [(_UIPageControlVisualProvider *)&v7 setPageIndicatorVibrantColorMatrix:v6];
  -[_UIInteractivePageControlVisualProvider _updateIndicatorTintColor]((id *)&self->super.super.isa);
}

- (void)setActivePageIndicatorVibrantColorMatrix:(CAColorMatrix *)a3
{
  v7.receiver = self;
  v7.super_class = (Class)_UIInteractivePageControlVisualProvider;
  long long v4 = *(_OWORD *)&a3->m33;
  v6[2] = *(_OWORD *)&a3->m24;
  v6[3] = v4;
  v6[4] = *(_OWORD *)&a3->m42;
  long long v5 = *(_OWORD *)&a3->m15;
  v6[0] = *(_OWORD *)&a3->m11;
  v6[1] = v5;
  [(_UIPageControlVisualProvider *)&v7 setActivePageIndicatorVibrantColorMatrix:v6];
  -[_UIInteractivePageControlVisualProvider _updateIndicatorTintColor]((id *)&self->super.super.isa);
}

- (double)indicatorOpacity
{
  [(UIView *)self->_indicatorContentView alpha];
  return result;
}

- (void)setIndicatorOpacity:(double)a3
{
}

- (void)setBackgroundView:(id)a3
{
  long long v4 = (UIView *)a3;
  [(UIView *)self->_backgroundView removeFromSuperview];
  backgroundView = self->_backgroundView;
  self->_backgroundView = v4;
  id v6 = v4;

  -[_UIInteractivePageControlVisualProvider _installBackgroundViewIfNeeded]((id *)&self->super.super.isa);
  [(UIView *)self->super._pageControl setNeedsLayout];
}

- (void)invalidateIndicators
{
  [(UIView *)self->super._pageControl invalidateIntrinsicContentSize];
  double v3 = [(_UIInteractivePageControlVisualProvider *)self indicatorFeed];
  [v3 invalidateIndicators];

  -[_UIInteractivePageControlVisualProvider _updateReuseQueue]((uint64_t)self);
  pageControl = self->super._pageControl;
  [(UIView *)pageControl setNeedsLayout];
}

- (BOOL)_isPageWithinPermittedDisplayedRange:(BOOL)result
{
  if (result)
  {
    uint64_t v3 = result;
    uint64_t v4 = *(void *)(result + 312);
    uint64_t v5 = a2 - v4;
    uint64_t v6 = *(void *)(result + 320);
    uint64_t v7 = [*(id *)(result + 8) numberOfPages];
    double result = 0;
    uint64_t v8 = *(void *)(v3 + 320);
    uint64_t v10 = v8 - 2;
    BOOL v9 = v8 < 2;
    uint64_t v11 = v8 - 1;
    if (!v9) {
      uint64_t v11 = v10;
    }
    if ((v5 & 0x8000000000000000) == 0 && v5 < v6)
    {
      uint64_t v12 = (uint64_t)fmax(fmin((double)(v11 >> 1), 2.0), 0.0);
      if (v4 && v5 < v12) {
        return 0;
      }
      if ([*(id *)(v3 + 8) numberOfPages] - v12 <= a2)
      {
        uint64_t v13 = *(void *)(v3 + 312);
        if (v13 == v7 - v6 || v5 + v12 < v6) {
          return v13 + v6 <= [*(id *)(v3 + 8) numberOfPages];
        }
      }
      else if (v5 + v12 < v6)
      {
        uint64_t v13 = *(void *)(v3 + 312);
        return v13 + v6 <= [*(id *)(v3 + 8) numberOfPages];
      }
      return 0;
    }
  }
  return result;
}

- (id)customIndicatorImageForPage:(int64_t)a3
{
  uint64_t v4 = [(_UIInteractivePageControlVisualProvider *)self indicatorStore];
  uint64_t v5 = [v4 customIndicatorImageForPage:a3];

  return v5;
}

- (void)setPreferredIndicatorImage:(id)a3
{
  id v8 = a3;
  uint64_t v4 = [(_UIInteractivePageControlVisualProvider *)self indicatorStore];
  uint64_t v5 = [v4 preferredImage];
  char v6 = [v5 isEqual:v8];

  if ((v6 & 1) == 0)
  {
    uint64_t v7 = [(_UIInteractivePageControlVisualProvider *)self indicatorStore];
    [v7 setPreferredImage:v8];

    [(_UIInteractivePageControlVisualProvider *)self invalidateIndicators];
  }
}

- (id)preferredIndicatorImage
{
  uint64_t v2 = [(_UIInteractivePageControlVisualProvider *)self indicatorStore];
  uint64_t v3 = [v2 preferredImage];

  return v3;
}

- (id)customActiveIndicatorImageForPage:(int64_t)a3
{
  uint64_t v4 = [(_UIInteractivePageControlVisualProvider *)self indicatorStore];
  uint64_t v5 = [v4 customActiveIndicatorImageForPage:a3];

  return v5;
}

- (void)setCustomActiveIndicatorImage:(id)a3 forPage:(int64_t)a4
{
  id v14 = a3;
  char v6 = [(_UIInteractivePageControlVisualProvider *)self indicatorStore];
  uint64_t v7 = [v6 customActiveIndicatorImageForPage:a4];
  char v8 = [v7 isEqual:v14];

  if ((v8 & 1) == 0)
  {
    BOOL v9 = [(_UIInteractivePageControlVisualProvider *)self indicatorStore];
    [v9 updateActiveImage:v14 forPage:a4];

    uint64_t v10 = [(_UIInteractivePageControlVisualProvider *)self indicatorFeed];
    [v10 reloadIndicatorImageForPage:a4];

    uint64_t v11 = [(_UIInteractivePageControlVisualProvider *)self continuousDisplayedPage];
    [v11 value];
    unint64_t v13 = llround(v12);

    -[_UIInteractivePageControlVisualProvider _transitionIndicatorForPage:toEnabled:](self, a4, v13 == a4);
    [(UIView *)self->super._pageControl invalidateIntrinsicContentSize];
    [(UIView *)self->super._pageControl setNeedsLayout];
  }
}

- (void)setPreferredActiveIndicatorImage:(id)a3
{
  id v8 = a3;
  uint64_t v4 = [(_UIInteractivePageControlVisualProvider *)self indicatorStore];
  uint64_t v5 = [v4 preferredActiveImage];
  char v6 = [v5 isEqual:v8];

  if ((v6 & 1) == 0)
  {
    uint64_t v7 = [(_UIInteractivePageControlVisualProvider *)self indicatorStore];
    [v7 setPreferredActiveImage:v8];

    [(_UIInteractivePageControlVisualProvider *)self invalidateIndicators];
  }
}

- (id)preferredActiveIndicatorImage
{
  uint64_t v2 = [(_UIInteractivePageControlVisualProvider *)self indicatorStore];
  uint64_t v3 = [v2 preferredActiveImage];

  return v3;
}

- (double)_preciseIndicatorPageForPoint:(double)a3
{
  if (!a1) {
    return 0.0;
  }
  char v6 = [(id)a1 contentView];
  uint64_t v7 = [(id)a1 indicatorContentView];
  objc_msgSend(v6, "convertPoint:toView:", v7, a2, a3);
  double v74 = v9;
  double v76 = v8;

  unint64_t v10 = [(id)a1 resolvedDirection] & 0xFFFFFFFFFFFFFFFDLL;
  double v11 = -[_UIInteractivePageControlVisualProvider _indicatorSpacing](a1) * 0.5;
  [*(id *)(a1 + 8) _currentScreenScale];
  double v13 = v12;
  uint64_t v14 = *(void *)(a1 + 320) + *(void *)(a1 + 312);
  uint64_t v15 = [*(id *)(a1 + 8) numberOfPages];
  if (v14 >= v15) {
    uint64_t v16 = v15;
  }
  else {
    uint64_t v16 = v14;
  }
  uint64_t v17 = *(void *)(a1 + 312);
  if (v17 >= v16)
  {
LABEL_23:
    unint64_t v43 = objc_msgSend((id)a1, "resolvedDirection", *(void *)&v74);
    long long v44 = [(id)a1 indicatorStore];
    [v44 defaultIndicatorSize];
    if (v43 >= 2) {
      double v45 = v46;
    }
    double v47 = v11 + v11 + v45;

    long long v19 = -[_UIInteractivePageControlVisualProvider _visibleLeftIndicator]((id)a1);
    CGAffineTransform v48 = -[_UIInteractivePageControlVisualProvider _visibleRightIndicator]((id)a1);
    double v49 = v76;
    if ((unint64_t)[(id)a1 resolvedDirection] >= 2) {
      double v50 = v75;
    }
    else {
      double v50 = v76;
    }
    unint64_t v51 = [(id)a1 resolvedDirection];
    [v19 center];
    if (v51 >= 2) {
      double v54 = v53;
    }
    else {
      double v54 = v52;
    }
    if ((unint64_t)[(id)a1 resolvedDirection] >= 2) {
      double v49 = v75;
    }
    unint64_t v55 = [(id)a1 resolvedDirection];
    if (v50 >= v54)
    {
      [v48 center];
      if (v55 >= 2) {
        double v66 = v65;
      }
      else {
        double v66 = v64;
      }
      unint64_t v67 = [(id)a1 resolvedDirection];
      double v68 = -[_UIInteractivePageControlVisualProvider _layoutSizeForIndicator:]((id *)a1, v19);
      if (v67 >= 2) {
        double v68 = v69;
      }
      double v62 = v11 + v66 + v68 * 0.5;
      uint64_t v63 = [v48 page] + 1;
    }
    else
    {
      [v19 center];
      if (v55 >= 2) {
        double v58 = v57;
      }
      else {
        double v58 = v56;
      }
      unint64_t v59 = [(id)a1 resolvedDirection];
      double v60 = -[_UIInteractivePageControlVisualProvider _layoutSizeForIndicator:]((id *)a1, v19);
      if (v59 >= 2) {
        double v60 = v61;
      }
      double v62 = v58 + v60 * -0.5 - v11;
      uint64_t v63 = [v19 page];
    }
    double v70 = (v49 - v62) / v47;
    if (v10 == 1) {
      double v70 = -v70;
    }
    double v71 = v70 + (double)v63;
  }
  else
  {
    while (1)
    {
      long long v18 = objc_msgSend((id)a1, "indicatorFeed", *(void *)&v74);
      long long v19 = [v18 indicatorForPage:v17];

      unint64_t v20 = [(id)a1 resolvedDirection];
      [v19 center];
      if (v20 >= 2) {
        double v23 = v22;
      }
      else {
        double v23 = v21;
      }
      unint64_t v24 = [(id)a1 resolvedDirection];
      double v25 = -[_UIInteractivePageControlVisualProvider _layoutSizeForIndicator:]((id *)a1, v19);
      if (v24 >= 2) {
        double v25 = v26;
      }
      double v27 = v23 + v25 * -0.5 - v11;
      unint64_t v28 = [(id)a1 resolvedDirection];
      [v19 center];
      double v30 = v29;
      double v32 = v31;
      unint64_t v33 = [(id)a1 resolvedDirection];
      double v34 = -[_UIInteractivePageControlVisualProvider _layoutSizeForIndicator:]((id *)a1, v19);
      double v36 = v35;
      double v37 = (unint64_t)[(id)a1 resolvedDirection] >= 2 ? v74 : v76;
      UIFloorToScale(v27, v13);
      if (v37 >= v38)
      {
        double v39 = v28 >= 2 ? v32 : v30;
        double v40 = v33 >= 2 ? v36 : v34;
        double v41 = v11 + v39 + v40 * 0.5;
        UICeilToScale(v41, v13);
        if (v37 <= v42) {
          break;
        }
      }

      if (v16 == ++v17) {
        goto LABEL_23;
      }
    }
    double v73 = (v37 - v41) / (v27 - v41);
    if (v10 != 1) {
      double v73 = (v37 - v27) / (v41 - v27);
    }
    double v71 = v73 + (double)v17;
  }

  return v71;
}

- (uint64_t)_allowsPreciseTargetPageForTap:(uint64_t)a1
{
  id v3 = a2;
  uint64_t v4 = v3;
  if (a1)
  {
    if (*(id *)(a1 + 408) == v3)
    {
      char v6 = [v3 touches];
      uint64_t v7 = [v6 firstObject];
      int v5 = [v7 _isPointerTouch];
    }
    else
    {
      int v5 = 0;
    }
    double v8 = [(id)a1 contentView];
    double v9 = [(id)a1 contentView];
    [v4 locationInView:v9];
    unsigned int v10 = objc_msgSend(v8, "pointInside:withEvent:", 0);

    if ([*(id *)(a1 + 8) _prefersTargetPageForDiscreteInteraction]) {
      BOOL v11 = -[_UIInteractivePageControlVisualProvider _indicatorSpacing](a1) > 20.0;
    }
    else {
      BOOL v11 = 0;
    }
    a1 = (v5 | v11) & v10;
  }

  return a1;
}

- (void)controlEventsGestureRecognizer:(id)a3 recognizedControlEvent:(unint64_t)a4 withEvent:(id)a5
{
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  id v4 = a3;
  if ([v4 _isGestureType:1])
  {
    int v5 = [(_UIInteractivePageControlVisualProvider *)self contentView];
    char v6 = [(_UIInteractivePageControlVisualProvider *)self contentView];
    [v4 locationInView:v6];
    LOBYTE(self) = objc_msgSend(v5, "pointInside:withEvent:", 0);
  }
  else if ([v4 _isGestureType:0])
  {
    LODWORD(self) = ![(_UIInteractivePageControlVisualProvider *)self isScrubbing];
  }
  else
  {
    LOBYTE(self) = 1;
  }

  return (char)self;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  char v7 = [v6 isMemberOfClass:objc_opt_class()];

  if (v7) {
    char v8 = 1;
  }
  else {
    char v8 = [v5 isMemberOfClass:objc_opt_class()];
  }

  return v8;
}

- (void)didTapPageControl:(id)a3
{
  id v81 = a3;
  id v4 = [(_UIInteractivePageControlVisualProvider *)self contentView];
  [v81 locationInView:v4];
  double v6 = v5;
  double v8 = v7;

  if (!-[_UIInteractivePageControlVisualProvider _allowsPreciseTargetPageForTap:]((uint64_t)self, v81))
  {
    if ([(UIPageControl *)self->super._pageControl numberOfPages] == 2)
    {
      uint64_t v9 = [(UIPageControl *)self->super._pageControl currentPage] == 0;
LABEL_52:
      if (v9 != [(UIPageControl *)self->super._pageControl currentPage]) {
        [(_UIInteractivePageControlVisualProvider *)self setPage:v9 interactionState:1];
      }
      goto LABEL_54;
    }
    double v23 = -[_UIInteractivePageControlVisualProvider _indicatorSpacing]((uint64_t)self);
    int64_t v24 = [(_UIInteractivePageControlVisualProvider *)self previousMoveDirection];
    unint64_t v25 = [(_UIInteractivePageControlVisualProvider *)self resolvedDirection];
    [(_UIInteractivePageControlVisualProvider *)self previousTouchLocation];
    double v27 = v8 - v26;
    double v29 = v6 - v28;
    if (v25 >= 2) {
      double v29 = v27;
    }
    if (v24)
    {
      double v29 = fabs(v29);
      if (v29 <= v23)
      {
LABEL_44:
        uint64_t v9 = [(UIPageControl *)self->super._pageControl currentPage];
        if (v24 != 1)
        {
          if (v24 != 2)
          {
LABEL_48:
            double v77 = [(_UIInteractivePageControlVisualProvider *)self successiveTapAction];

            if (v77)
            {
              uint64_t v78 = [(_UIInteractivePageControlVisualProvider *)self successiveTapAction];
              [v78 cancel];

              [(_UIInteractivePageControlVisualProvider *)self setSuccessiveTapAction:0];
            }
            v79 = [[UIDelayedAction alloc] initWithTarget:self action:sel_resetSuccessiveTapInfo userInfo:0 delay:0.75];
            [(_UIInteractivePageControlVisualProvider *)self setSuccessiveTapAction:v79];

            -[_UIInteractivePageControlVisualProvider setPreviousTouchLocation:](self, "setPreviousTouchLocation:", v6, v8);
LABEL_51:
            if (v9 == -1) {
              goto LABEL_54;
            }
            goto LABEL_52;
          }
          int64_t v24 = -1;
        }
        uint64_t v9 = (uint64_t)fmax(fmin((double)(v24 + v9), (double)([(UIPageControl *)self->super._pageControl numberOfPages] - 1)), 0.0);
        goto LABEL_48;
      }
    }
    double v30 = [(_UIInteractivePageControlVisualProvider *)self indicatorFeed];
    double v31 = objc_msgSend(v30, "activeIndicatorForPage:", -[UIPageControl currentPage](self->super._pageControl, "currentPage"));

    if (v31)
    {
      [v31 bounds];
      double v33 = v32;
      double v35 = v34;
      double v37 = v36;
      double v39 = v38;
      double v40 = [(_UIInteractivePageControlVisualProvider *)self contentView];
      objc_msgSend(v31, "convertRect:toView:", v40, v33, v35, v37, v39);
      double v42 = v41;
      double v44 = v43;
      double v46 = v45;
      double v48 = v47;

      v85.origin.x = v42;
      v85.origin.y = v44;
      v85.size.double width = v46;
      v85.size.double height = v48;
      v83.x = v6;
      v83.y = v8;
      if (CGRectContainsPoint(v85, v83))
      {
LABEL_43:
        [(_UIInteractivePageControlVisualProvider *)self setPreviousMoveDirection:v24];

        goto LABEL_44;
      }
    }
    else
    {
      double v68 = [(_UIInteractivePageControlVisualProvider *)self contentView];
      [v68 bounds];
      double v42 = v69;
      double v44 = v70;
      double v46 = v71;
      double v48 = v72;
    }
    unint64_t v73 = [(_UIInteractivePageControlVisualProvider *)self resolvedDirection];
    int v74 = ([(_UIInteractivePageControlVisualProvider *)self resolvedDirection] & 0xFFFFFFFFFFFFFFFDLL) == 1;
    if (v73 > 1) {
      BOOL v75 = v8 > v48 * 0.5 + v44;
    }
    else {
      BOOL v75 = v6 > v46 * 0.5 + v42;
    }
    int v76 = v75;
    if (v76 != v74) {
      int64_t v24 = 1;
    }
    else {
      int64_t v24 = 2;
    }
    goto LABEL_43;
  }
  uint64_t v9 = (uint64_t)[(_UIInteractivePageControlVisualProvider *)(uint64_t)self _preciseIndicatorPageForPoint:v8];
  int64_t indicatorStartIndex = self->_indicatorStartIndex;
  if (indicatorStartIndex <= v9 && self->_numberOfVisibleIndicators + indicatorStartIndex > v9)
  {
    BOOL v11 = [(_UIInteractivePageControlVisualProvider *)self indicatorFeed];
    double v12 = [v11 indicatorForPage:v9];

    [v12 bounds];
    double v14 = v13;
    double v16 = v15;
    double v18 = v17;
    double v20 = v19;
    double v21 = [v81 touches];
    double v22 = [v21 firstObject];
    if ([v22 _isPointerTouch])
    {
    }
    else
    {
      BOOL v49 = [(UIPageControl *)self->super._pageControl _prefersTargetPageForDiscreteInteraction];

      if (v49)
      {
        double v50 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
        double v80 = *MEMORY[0x1E4F1DB30];
        unint64_t v51 = [(_UIInteractivePageControlVisualProvider *)self resolvedDirection];
        unint64_t v52 = [(_UIInteractivePageControlVisualProvider *)self resolvedDirection];
        [v12 bounds];
        if (v52 >= 2) {
          double v55 = v54;
        }
        else {
          double v55 = v53;
        }
        double v56 = -[_UIInteractivePageControlVisualProvider _indicatorSpacing]((uint64_t)self) + v55;
        if (v51 >= 2) {
          double v57 = v80;
        }
        else {
          double v57 = v56;
        }
        if (v51 >= 2) {
          double v50 = v56;
        }
        unint64_t v58 = [(_UIInteractivePageControlVisualProvider *)self resolvedDirection];
        unint64_t v59 = [(_UIInteractivePageControlVisualProvider *)self resolvedDirection];
        double v60 = [(_UIInteractivePageControlVisualProvider *)self contentView];
        [v60 bounds];
        if (v59 >= 2) {
          double v63 = v61;
        }
        else {
          double v63 = v62;
        }
        if (v58 < 2) {
          double v50 = v63;
        }
        else {
          double v57 = v63;
        }

        double v14 = v14 + (v18 - v57) * 0.5;
        double v16 = v16 + (v20 - v50) * 0.5;
        double v20 = v50;
        double v18 = v57;
      }
    }
    double v64 = [(_UIInteractivePageControlVisualProvider *)self contentView];
    objc_msgSend(v64, "convertPoint:toView:", v12, v6, v8);
    v84.x = v65;
    v84.y = v66;
    v86.origin.x = v14;
    v86.origin.y = v16;
    v86.size.double width = v18;
    v86.size.double height = v20;
    BOOL v67 = CGRectContainsPoint(v86, v84);

    if (v67) {
      goto LABEL_51;
    }
  }
LABEL_54:
}

- (void)didScrubPageControl:(id)a3
{
  id v70 = a3;
  [v70 locationInView:self->super._pageControl];
  double v5 = v4;
  double v7 = v6;
  uint64_t v8 = [v70 state];
  if (v8 == 4)
  {
    BOOL v11 = [(_UIInteractivePageControlVisualProvider *)self selectionFeedbackGenerator];
    objc_msgSend(v11, "userInteractionCancelledAtLocation:", v5, v7);
LABEL_7:

    unsigned int v10 = [(_UIInteractivePageControlVisualProvider *)self joggingFeedbackGenerator];
    [v10 deactivate];
    goto LABEL_8;
  }
  if (v8 == 3)
  {
    BOOL v11 = [(_UIInteractivePageControlVisualProvider *)self selectionFeedbackGenerator];
    objc_msgSend(v11, "userInteractionEndedAtLocation:", v5, v7);
    goto LABEL_7;
  }
  if (v8 != 1) {
    goto LABEL_9;
  }
  uint64_t v9 = [(_UIInteractivePageControlVisualProvider *)self selectionFeedbackGenerator];
  objc_msgSend(v9, "userInteractionStartedAtLocation:", v5, v7);

  unsigned int v10 = [(_UIInteractivePageControlVisualProvider *)self joggingFeedbackGenerator];
  [v10 activateWithCompletionBlock:0];
LABEL_8:

LABEL_9:
  uint64_t v12 = [v70 state];
  if ((unint64_t)(v12 - 3) < 2)
  {
    double v47 = [(_UIInteractivePageControlVisualProvider *)self contentView];
    [v70 velocityInView:v47];
    double v49 = v48;
    double v51 = v50;

    if ([(UIPageControl *)self->super._pageControl _flickToEndGestureEnabled])
    {
      double v52 = (unint64_t)[(_UIInteractivePageControlVisualProvider *)self resolvedDirection] >= 2
          ? v51
          : v49;
      if (fabs(v52) > 800.0)
      {
        if ((unint64_t)[(_UIInteractivePageControlVisualProvider *)self resolvedDirection] >= 2) {
          double v53 = v51;
        }
        else {
          double v53 = v49;
        }
        if (v53 > 0.0 == (([(_UIInteractivePageControlVisualProvider *)self resolvedDirection] & 0xFFFFFFFFFFFFFFFDLL) == 1)) {
          int64_t v54 = 0;
        }
        else {
          int64_t v54 = [(UIPageControl *)self->super._pageControl numberOfPages] - 1;
        }
        self->_targetPage = v54;
        -[_UIInteractivePageControlVisualProvider _updateCurrentPage:completion:]((id *)&self->super.super.isa, v54, 0);
      }
    }
    double v69 = [(_UIInteractivePageControlVisualProvider *)self interactor];
    [v69 commitTranslation];

    [(_UIInteractivePageControlVisualProvider *)self setScrubbing:0];
  }
  else if (v12 == 2)
  {
    double v55 = [(_UIInteractivePageControlVisualProvider *)self contentView];
    [v70 _translationInView:v55];
    double v57 = v56;
    double v59 = v58;

    double v60 = [(_UIInteractivePageControlVisualProvider *)self contentView];
    [v70 velocityInView:v60];
    double v62 = v61;
    double v64 = v63;

    CGFloat v65 = [(_UIInteractivePageControlVisualProvider *)self interactor];
    if ((unint64_t)[(_UIInteractivePageControlVisualProvider *)self resolvedDirection] >= 2) {
      double v66 = v59;
    }
    else {
      double v66 = v57;
    }
    if ((unint64_t)[(_UIInteractivePageControlVisualProvider *)self resolvedDirection] >= 2) {
      double v67 = v64;
    }
    else {
      double v67 = v62;
    }
    [v65 setTranslation:v66 velocity:v67];

    if ((unint64_t)[(_UIInteractivePageControlVisualProvider *)self resolvedDirection] >= 2) {
      double v68 = v59;
    }
    else {
      double v68 = v57;
    }
    self->_panDistance = v68;
    [(UIView *)self->super._pageControl setNeedsLayout];
  }
  else if (v12 == 1)
  {
    [(_UIInteractivePageControlVisualProvider *)self setScrubbing:1];
    *(unsigned char *)&self->_state &= ~4u;
    double v13 = [(_UIInteractivePageControlVisualProvider *)self contentView];
    [v70 startPoint];
    double v15 = v14;
    double v17 = v16;
    double v18 = [v70 view];
    objc_msgSend(v13, "convertPoint:fromView:", v18, v15, v17);
    double v20 = v19;
    double v22 = v21;

    int64_t v23 = (uint64_t)fmax(fmin([(_UIInteractivePageControlVisualProvider *)(uint64_t)self _preciseIndicatorPageForPoint:v22], (double)([(UIPageControl *)self->super._pageControl numberOfPages] - 1)), 0.0);
    if (-[_UIInteractivePageControlVisualProvider _allowsPreciseTargetPageForTap:]((uint64_t)self, v70))
    {
      int64_t indicatorStartIndex = self->_indicatorStartIndex;
      if (indicatorStartIndex <= v23 && self->_numberOfVisibleIndicators + indicatorStartIndex > v23)
      {
        self->_targetPage = v23;
        [(_UIInteractivePageControlVisualProvider *)self setPage:v23 interactionState:1];
      }
    }
    NSInteger v25 = [(UIPageControl *)self->super._pageControl currentPage];
    double v26 = [(_UIInteractivePageControlVisualProvider *)self indicatorFeed];
    double v27 = [v26 indicatorForPage:v23];
    [v27 center];
    double v29 = v28;
    double v31 = v30;

    double v32 = [(_UIInteractivePageControlVisualProvider *)self indicatorFeed];
    double v33 = [v32 indicatorForPage:v25];
    [v33 center];
    double v35 = v34;
    double v37 = v36;

    if ((unint64_t)[(_UIInteractivePageControlVisualProvider *)self resolvedDirection] >= 2) {
      double v35 = v37;
    }
    if ((unint64_t)[(_UIInteractivePageControlVisualProvider *)self resolvedDirection] >= 2) {
      double v38 = v31;
    }
    else {
      double v38 = v29;
    }
    double v39 = v35 - v38;
    double v40 = [(_UIInteractivePageControlVisualProvider *)self interactor];
    if ((unint64_t)[(_UIInteractivePageControlVisualProvider *)self resolvedDirection] >= 2) {
      double v41 = v22;
    }
    else {
      double v41 = v20;
    }
    [v40 setUnconstrainedPosition:v41 offset:v39];

    double v42 = [(_UIInteractivePageControlVisualProvider *)self displayLink];

    if (!v42)
    {
      double v43 = [(UIView *)self->super._pageControl _screen];
      double v44 = [v43 displayLinkWithTarget:self selector:sel_displayLinkTicked_];

      double v45 = [MEMORY[0x1E4F1CAC0] mainRunLoop];
      [v44 addToRunLoop:v45 forMode:*MEMORY[0x1E4F1C4B0]];

      double v46 = [MEMORY[0x1E4F1CAC0] mainRunLoop];
      [v44 addToRunLoop:v46 forMode:@"UITrackingRunLoopMode"];

      [(_UIInteractivePageControlVisualProvider *)self setDisplayLink:v44];
    }
  }
}

- (void)displayLinkTicked:(id)a3
{
  double v4 = &OBJC_IVAR____UICursorAccessoryView__accessoryIdentifiers;
  if ([(_UIInteractivePageControlVisualProvider *)self isScrubbing])
  {
    unint64_t v5 = [(_UIInteractivePageControlVisualProvider *)self resolvedDirection];
    double v6 = [(_UIInteractivePageControlVisualProvider *)self interactor];
    [v6 unconstrainedPosition];
    double MidY = v7;
    [(UIView *)self->super._pageControl bounds];
    if (v5 > 1)
    {
      double MidX = CGRectGetMidX(*(CGRect *)&v9);
    }
    else
    {
      double MidX = MidY;
      double MidY = CGRectGetMidY(*(CGRect *)&v9);
    }

    double v14 = [(_UIInteractivePageControlVisualProvider *)(uint64_t)self _preciseIndicatorPageForPoint:MidY];
    -[_UIInteractivePageControlVisualProvider setPreciseTouchedPage:](self, "setPreciseTouchedPage:");
    double v15 = fabs(self->_panDistance);
    if (v15 <= 16.0)
    {
      if ((*(unsigned char *)&self->_state & 4) == 0) {
        return;
      }
    }
    else
    {
      *(unsigned char *)&self->_state |= 4u;
    }
    unint64_t v16 = [(_UIInteractivePageControlVisualProvider *)self resolvedDirection];
    double v17 = [(_UIInteractivePageControlVisualProvider *)self interactor];
    [v17 boundedScrubPosition];
    double v19 = v18;
    [(UIView *)self->super._pageControl bounds];
    if (v16 > 1)
    {
      double v24 = CGRectGetMidX(*(CGRect *)&v20);
    }
    else
    {
      double v24 = v19;
      double v19 = CGRectGetMidY(*(CGRect *)&v20);
    }

    double v25 = [(_UIInteractivePageControlVisualProvider *)(uint64_t)self _preciseIndicatorPageForPoint:v19];
    if (v15 <= 16.0 && self->_tickThreshold != 0)
    {
LABEL_37:
      int64_t v46 = self->_currentTick + 1;
      self->_currentTick = v46;
      if (v46 < self->_tickThreshold) {
        goto LABEL_72;
      }
      self->_currentTick = 0;
      BOOL v47 = -[_UIInteractivePageControlVisualProvider _isPageWithinPermittedDisplayedRange:]((BOOL)self, (uint64_t)v14);
      BOOL v48 = -[_UIInteractivePageControlVisualProvider _isPageWithinPermittedDisplayedRange:]((BOOL)self, (uint64_t)v25);
      NSInteger v49 = [(UIPageControl *)self->super._pageControl currentPage];
      NSInteger v50 = [(UIPageControl *)self->super._pageControl numberOfPages];
      NSInteger v51 = [(UIPageControl *)self->super._pageControl numberOfPages];
      if (v47 || !v48)
      {
        uint64_t v52 = (uint64_t)fmax(fmin(v25, (double)(v51 - 1)), 0.0);
        if (!v47 || v48 || v49 == v52) {
          goto LABEL_64;
        }
        double v56 = [(_UIInteractivePageControlVisualProvider *)self indicatorFeed];
        [v56 indicatorSizeForPage:v49];
        double v58 = v57;
        double v60 = v59;

        if ((unint64_t)[(_UIInteractivePageControlVisualProvider *)self resolvedDirection] >= 2) {
          double v61 = v60;
        }
        else {
          double v61 = v58;
        }
        double v62 = v61 * 0.25;
      }
      else
      {
        uint64_t v52 = (uint64_t)fmax(fmin(v14, (double)(v50 - 1)), 0.0);
        int64_t numberOfVisibleIndicators = self->_numberOfVisibleIndicators;
        NSInteger v54 = [(UIPageControl *)self->super._pageControl numberOfPages];
        if (v15 > 16.0 && numberOfVisibleIndicators != v54)
        {
          double v55 = [(_UIInteractivePageControlVisualProvider *)self interactor];
          [v55 reduceScrubOffsetByRatio:3.0];
LABEL_63:

LABEL_64:
          if (v52 > v49) {
            uint64_t v72 = 1;
          }
          else {
            uint64_t v72 = 2 * (v52 < v49);
          }
          uint64_t v73 = v4[871];
          int v74 = *(Class *)((char *)&self->super.super.isa + v73);
          if (v72 != 1)
          {
            if (v72 != 2)
            {
LABEL_71:
              *(Class *)((char *)&self->super.super.isa + v73) = v74;
              goto LABEL_72;
            }
            uint64_t v72 = -1;
          }
          int v74 = (objc_class *)(uint64_t)fmax(fmin((double)((uint64_t)v74 + v72), (double)([(UIPageControl *)self->super._pageControl numberOfPages]- 1)), 0.0);
          goto LABEL_71;
        }
        BOOL v64 = v15 <= 16.0 || numberOfVisibleIndicators != v54;
        if (v49 == v52 && v64)
        {
          uint64_t v52 = v49;
          goto LABEL_64;
        }
        double v65 = -[_UIInteractivePageControlVisualProvider _indicatorSpacing]((uint64_t)self);
        double v66 = [(_UIInteractivePageControlVisualProvider *)self indicatorFeed];
        [v66 indicatorSizeForPage:v49];
        double v68 = v67;
        double v70 = v69;

        if ((unint64_t)[(_UIInteractivePageControlVisualProvider *)self resolvedDirection] >= 2) {
          double v71 = v70;
        }
        else {
          double v71 = v68;
        }
        double v62 = v65 + v71;
      }
      double v55 = [(_UIInteractivePageControlVisualProvider *)self interactor];
      [v55 reduceScrubOffsetByOffset:v62];
      goto LABEL_63;
    }
    uint64_t v27 = [(UIPageControl *)self->super._pageControl numberOfPages];
    int64_t v28 = self->_numberOfVisibleIndicators;
    uint64_t v29 = v28 - 2;
    int64_t indicatorStartIndex = self->_indicatorStartIndex;
    if (v28 < 2) {
      uint64_t v29 = v28 - 1;
    }
    uint64_t v85 = v29;
    double v31 = [(_UIInteractivePageControlVisualProvider *)self displayLink];
    uint64_t v32 = [v31 actualFramesPerSecond];

    int64_t v33 = self->_numberOfVisibleIndicators;
    NSInteger v34 = [(UIPageControl *)self->super._pageControl numberOfPages];
    int v35 = -[_UIInteractivePageControlVisualProvider _isPageWithinValidJoggingOffset:]((uint64_t)self, v14);
    int v36 = -[_UIInteractivePageControlVisualProvider _isPageWithinValidJoggingOffset:]((uint64_t)self, v25);
    if ((double)v28 * 0.5 + (double)indicatorStartIndex >= v14)
    {
      double v38 = (double)self->_indicatorStartIndex;
      double v37 = v14;
    }
    else
    {
      double v37 = (double)(indicatorStartIndex + v28);
      double v38 = v14;
    }
    double v39 = (double)v32;
    double v40 = v38 - v37;
    double v4 = &OBJC_IVAR____UICursorAccessoryView__accessoryIdentifiers;
    if (v33 == v34)
    {
      BOOL v41 = v14 < -1.0 && [(UIPageControl *)self->super._pageControl currentPage] > 1;
      BOOL v44 = v14 > (double)v27 && [(UIPageControl *)self->super._pageControl currentPage] < v27 - 2;
      double v45 = 0.0;
      if (!v41 && !v44) {
        goto LABEL_36;
      }
      double v43 = exp2(fmin(v40, 3.0));
    }
    else
    {
      if ((v35 & v36) != 1)
      {
        double v45 = v39 * 0.25;
        if (v35 == v36) {
          double v45 = 0.0;
        }
        goto LABEL_36;
      }
      double v42 = fmax(fmin((double)(v85 >> 1), 2.0), 0.0);
      double v43 = pow(1.6, fmin((double)(uint64_t)v42 + 3.5, v40 + (double)(uint64_t)v42));
    }
    double v45 = v39 / v43;
LABEL_36:
    self->_tickThreshold = (uint64_t)v45;
    self->_panDistance = 0.0;
    goto LABEL_37;
  }
LABEL_72:
  NSInteger v75 = [(UIPageControl *)self->super._pageControl currentPage];
  NSInteger v76 = [(UIPageControl *)self->super._pageControl numberOfPages];
  uint64_t v77 = (uint64_t)fmax(fmin((double)*(uint64_t *)((char *)&self->super.super.isa + v4[871]), (double)([(UIPageControl *)self->super._pageControl numberOfPages] - 1)), 0.0);
  if (v75 == v77)
  {
    if (![(_UIInteractivePageControlVisualProvider *)self isScrubbing])
    {
      id v81 = [(_UIInteractivePageControlVisualProvider *)self displayLink];
      [v81 invalidate];

      [(_UIInteractivePageControlVisualProvider *)self setDisplayLink:0];
    }
    return;
  }
  [(_UIPageControlVisualProvider *)self setInteractionState:2];
  -[_UIInteractivePageControlVisualProvider _updateCurrentPage:completion:]((id *)&self->super.super.isa, v77, 0);
  if (v76 == self->_numberOfVisibleIndicators)
  {
LABEL_86:
    id v86 = [(_UIInteractivePageControlVisualProvider *)self selectionFeedbackGenerator];
    [(UIView *)self->super._pageControl center];
    objc_msgSend(v86, "selectionChangedAtLocation:");
    goto LABEL_88;
  }
  if (v77) {
    BOOL v78 = v76 - 1 == v77;
  }
  else {
    BOOL v78 = 1;
  }
  if (!v78)
  {
    if (!-[_UIInteractivePageControlVisualProvider _isPageWithinPermittedDisplayedRange:]((BOOL)self, v77))
    {
      id v86 = [(_UIInteractivePageControlVisualProvider *)self joggingFeedbackGenerator];
      [(UIView *)self->super._pageControl center];
      objc_msgSend(v86, "impactOccurredWithIntensity:atLocation:", 0.45, v83, v84);
      goto LABEL_88;
    }
    goto LABEL_86;
  }
  id v86 = [(_UIInteractivePageControlVisualProvider *)self joggingFeedbackGenerator];
  [(UIView *)self->super._pageControl center];
  objc_msgSend(v86, "impactOccurredWithIntensity:atLocation:", 1.0, v79, v80);
LABEL_88:
}

- (BOOL)_isPageWithinValidJoggingOffset:(uint64_t)a1
{
  uint64_t v4 = *(void *)(a1 + 312);
  uint64_t v5 = *(void *)(a1 + 320);
  if (-[_UIInteractivePageControlVisualProvider _isPageWithinPermittedDisplayedRange:](a1, (uint64_t)a2)) {
    return 0;
  }
  if (a2 <= 0.0 && *(void *)(a1 + 312) == 0) {
    return 0;
  }
  uint64_t v7 = v5 + v4;
  uint64_t v8 = [*(id *)(a1 + 8) numberOfPages];
  return (double)(v7 - 1) > a2 || v7 != v8;
}

- (void)setScrubbing:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(_UIInteractivePageControlVisualProvider *)self isScrubbing] != a3)
  {
    *(unsigned char *)&self->_char state = *(unsigned char *)&self->_state & 0xFE | v3;
    self->_targetPage = [(UIPageControl *)self->super._pageControl currentPage];
    self->_tickThreshold = 0;
    -[_UIInteractivePageControlVisualProvider _updateCurrentPlatterMode]((uint64_t)self);
    if (v3)
    {
      uint64_t v5 = 2;
    }
    else
    {
      [(_UIInteractivePageControlVisualProvider *)self setPreciseTouchedPage:-1.79769313e308];
      uint64_t v5 = 0;
    }
    [(_UIPageControlVisualProvider *)self setInteractionState:v5];
    double v6 = [(UIPageControl *)self->super._pageControl progress];
    [v6 _progressVisibilityChanged:!v3];

    long long v17 = 0u;
    long long v18 = 0u;
    long long v16 = 0u;
    [(_UIInteractivePageControlVisualProvider *)(uint64_t)&v16 _contentTransformForActiveState:v3];
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    long long v12 = v16;
    aBlock[2] = __56___UIInteractivePageControlVisualProvider_setScrubbing___block_invoke;
    aBlock[3] = &unk_1E52E7900;
    aBlock[4] = self;
    long long v13 = v17;
    long long v14 = v18;
    BOOL v15 = v3;
    uint64_t v7 = _Block_copy(aBlock);
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __56___UIInteractivePageControlVisualProvider_setScrubbing___block_invoke_2;
    v9[3] = &unk_1E52DA040;
    id v10 = v7;
    id v8 = v7;
    +[UIView _animateUsingSpringWithDampingRatio:1 response:v9 tracking:0 dampingRatioSmoothing:1.0 responseSmoothing:0.25 targetSmoothing:0.08 projectionDeceleration:1.0 animations:0.0 completion:0.0];
  }
}

- (uint64_t)_hasContentScaling
{
  uint64_t result = [a1[1] backgroundStyle];
  if (result)
  {
    [a1 activeTransformForTouchedPage];
    return CGAffineTransformIsIdentity(&v3);
  }
  return result;
}

- (void)setPlatterExpanded:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(_UIInteractivePageControlVisualProvider *)self isPlatterExpanded] != a3)
  {
    if (v3) {
      char v5 = 2;
    }
    else {
      char v5 = 0;
    }
    *(unsigned char *)&self->_char state = *(unsigned char *)&self->_state & 0xFD | v5;
    double v6 = [(_UIInteractivePageControlVisualProvider *)self backgroundView];
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __62___UIInteractivePageControlVisualProvider_setPlatterExpanded___block_invoke;
    aBlock[3] = &unk_1E52D9FC0;
    id v7 = v6;
    id v14 = v7;
    BOOL v15 = v3;
    id v8 = (void (**)(void))_Block_copy(aBlock);
    if (v3 && ![(UIPageControl *)self->super._pageControl _allowsDiscreteInteraction])
    {
      v8[2](v8);
      [(_UIInteractivePageControlVisualProvider *)self didUpdatePageIndicatorTintColor];
    }
    else
    {
      v11[0] = MEMORY[0x1E4F143A8];
      v11[1] = 3221225472;
      v11[2] = __62___UIInteractivePageControlVisualProvider_setPlatterExpanded___block_invoke_2;
      v11[3] = &unk_1E52DA040;
      long long v12 = v8;
      +[UIView _animateUsingSpringWithDampingRatio:1 response:v11 tracking:0 dampingRatioSmoothing:1.0 responseSmoothing:0.1 targetSmoothing:0.08 projectionDeceleration:1.0 animations:0.0 completion:0.0];
      v10[0] = MEMORY[0x1E4F143A8];
      v10[1] = 3221225472;
      v10[2] = __62___UIInteractivePageControlVisualProvider_setPlatterExpanded___block_invoke_3;
      v10[3] = &unk_1E52D9F70;
      v10[4] = self;
      uint64_t v9 = v10;
      v16[0] = MEMORY[0x1E4F143A8];
      v16[1] = 3221225472;
      v16[2] = ___UIPageIndicatorAnimateFadeIn_block_invoke;
      v16[3] = &unk_1E52DA040;
      id v17 = v9;
      +[UIView animateWithDuration:7 delay:v16 options:0 animations:0.015625 completion:0.0];
    }
  }
}

- (CADisplayLink)displayLink
{
  return self->_displayLink;
}

- (void)setDisplayLink:(id)a3
{
}

- (double)preciseTouchedPage
{
  return self->_preciseTouchedPage;
}

- (UIDelayedAction)successiveTapAction
{
  return self->_successiveTapAction;
}

- (void)setSuccessiveTapAction:(id)a3
{
}

- (int64_t)previousMoveDirection
{
  return self->_previousMoveDirection;
}

- (CGPoint)previousTouchLocation
{
  double x = self->_previousTouchLocation.x;
  double y = self->_previousTouchLocation.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (UISelectionFeedbackGenerator)selectionFeedbackGenerator
{
  return self->_selectionFeedbackGenerator;
}

- (UIImpactFeedbackGenerator)joggingFeedbackGenerator
{
  return self->_joggingFeedbackGenerator;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_joggingFeedbackGenerator, 0);
  objc_storeStrong((id *)&self->_selectionFeedbackGenerator, 0);
  objc_storeStrong((id *)&self->_indicatorTransformCurve, 0);
  objc_storeStrong((id *)&self->_scrubProgress, 0);
  objc_storeStrong((id *)&self->_continuousDisplayedPage, 0);
  objc_storeStrong((id *)&self->_interactor, 0);
  objc_storeStrong((id *)&self->_indicatorStore, 0);
  objc_storeStrong((id *)&self->_indicatorFeed, 0);
  objc_storeStrong((id *)&self->_successiveTapAction, 0);
  objc_storeStrong((id *)&self->_scrubbingGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_tapGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_displayLink, 0);
  objc_storeStrong((id *)&self->_indicatorContentView, 0);
  objc_storeStrong((id *)&self->_contentView, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
}

@end