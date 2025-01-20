@interface PKFingerprintGlyphView
- (BOOL)fadeOnRecognized;
- (CALayer)contentLayer;
- (CGSize)boundsSizeToMatchPointScale:(double)a3;
- (PKFingerprintGlyphView)init;
- (PKFingerprintGlyphView)initWithCoder:(id)a3;
- (PKFingerprintGlyphViewDelegate)delegate;
- (UIColor)primaryColor;
- (UIColor)secondaryColor;
- (double)_minimumAnimationDurationForStateTransition;
- (double)pointScaleToMatchBoundsSize:(CGSize)a3;
- (id)pathStateForLayer:(id)a3;
- (int64_t)state;
- (void)_applyColor:(id)a3 toShapeLayers:(id)a4 animated:(BOOL)a5;
- (void)_applyPrimaryColorAnimated:(BOOL)a3;
- (void)_applySecondaryColorAnimated:(BOOL)a3;
- (void)_continueHoldingStateForPathAtIndex:(unint64_t)a3 withTransitionIndex:(unint64_t)a4;
- (void)_dynamicUserInterfaceTraitDidChange;
- (void)_endRotationAnimation;
- (void)_executeAfterMinimumAnimationDurationForStateTransition:(id)a3;
- (void)_executeTransitionCompletionHandlers:(BOOL)a3;
- (void)_finishTransitionForIndex:(unint64_t)a3;
- (void)_performTransitionWithTransitionIndex:(unint64_t)a3 animated:(BOOL)a4;
- (void)_restartRotationIfNecessary;
- (void)_setProgress:(double)a3 withDuration:(double)a4 forShapeLayerAtIndex:(unint64_t)a5;
- (void)_setRingState:(unint64_t)a3 withTransitionIndex:(unint64_t)a4 animated:(BOOL)a5;
- (void)_showFingerprintWithTransitionIndex:(unint64_t)a3 animated:(BOOL)a4;
- (void)_startRecognitionHoldingStateWithTransitionIndex:(unint64_t)a3;
- (void)_startRotationAnimation;
- (void)_updateLastAnimationTimeWithAnimationOfDuration:(double)a3;
- (void)_updateRotationAnimationsIfNecessary;
- (void)dealloc;
- (void)didMoveToWindow;
- (void)layoutSubviews;
- (void)setContentLayerOpacity:(double)a3 withDuration:(double)a4;
- (void)setDelegate:(id)a3;
- (void)setFadeOnRecognized:(BOOL)a3;
- (void)setPathState:(id)a3 forLayer:(id)a4;
- (void)setPrimaryColor:(id)a3;
- (void)setPrimaryColor:(id)a3 animated:(BOOL)a4;
- (void)setProgress:(double)a3 withDuration:(double)a4;
- (void)setRecognizedIfNecessaryWithCompletion:(id)a3;
- (void)setSecondaryColor:(id)a3;
- (void)setSecondaryColor:(id)a3 animated:(BOOL)a4;
- (void)setState:(int64_t)a3 animated:(BOOL)a4 completionHandler:(id)a5;
@end

@implementation PKFingerprintGlyphView

- (PKFingerprintGlyphView)initWithCoder:(id)a3
{
  [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF498] format:@"This class is not NSCoding compliant"];

  return [(PKFingerprintGlyphView *)self init];
}

- (PKFingerprintGlyphView)init
{
  uint64_t v188 = *MEMORY[0x263EF8340];
  v3 = (void *)MEMORY[0x263F15838];
  v4 = PKPassKitUIFoundationBundle();
  v5 = [v4 URLForResource:@"Payment_glyph" withExtension:@"caar"];
  uint64_t v6 = *MEMORY[0x263F15EE0];
  id v178 = 0;
  v7 = [v3 packageWithContentsOfURL:v5 type:v6 options:0 error:&v178];
  id v8 = v178;

  memset(&v177, 0, sizeof(v177));
  CATransform3DMakeScale(&v177, 0.5, 0.5, 1.0);
  v9 = [v7 rootLayer];
  objc_msgSend(v9, "setGeometryFlipped:", objc_msgSend(v7, "isGeometryFlipped"));
  CATransform3D v187 = v177;
  [v9 setTransform:&v187];
  [v9 bounds];
  double v10 = *MEMORY[0x263F00148];
  double v11 = *(double *)(MEMORY[0x263F00148] + 8);
  v176.receiver = self;
  v176.super_class = (Class)PKFingerprintGlyphView;
  double v150 = v11;
  double v151 = v10;
  double v148 = v13 * 0.5;
  double v149 = v12 * 0.5;
  v14 = -[PKFingerprintGlyphView initWithFrame:](&v176, sel_initWithFrame_);
  v15 = v14;
  if (v14)
  {
    id v147 = v8;
    v158 = v7;
    v14->_state = 0;
    unint64_t v16 = 0x263EFF000uLL;
    v17 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    transitionCompletionHandlers = v15->_transitionCompletionHandlers;
    v15->_transitionCompletionHandlers = v17;

    p_backgroundLayer = (id *)&v15->_backgroundLayer;
    v146 = v9;
    objc_storeStrong((id *)&v15->_backgroundLayer, v9);
    backgroundLayer = v15->_backgroundLayer;
    v21 = PKLayerNullActions();
    [(CALayer *)backgroundLayer setActions:v21];

    -[CALayer setAnchorPoint:](v15->_backgroundLayer, "setAnchorPoint:", 0.5, 0.5);
    if (v15->_backgroundLayer)
    {
      v22 = [(CALayer *)v15->_backgroundLayer sublayers];
      v23 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", objc_msgSend(v22, "count"));
      v24 = PKLayerNullActions();
      long long v179 = 0u;
      long long v180 = 0u;
      long long v181 = 0u;
      long long v182 = 0u;
      id v25 = v22;
      uint64_t v26 = [v25 countByEnumeratingWithState:&v179 objects:&v187 count:16];
      if (v26)
      {
        uint64_t v27 = v26;
        uint64_t v28 = *(void *)v180;
        do
        {
          for (uint64_t i = 0; i != v27; ++i)
          {
            if (*(void *)v180 != v28) {
              objc_enumerationMutation(v25);
            }
            v30 = *(void **)(*((void *)&v179 + 1) + 8 * i);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              [v30 setActions:v24];
              [v23 addObject:v30];
            }
          }
          uint64_t v27 = [v25 countByEnumeratingWithState:&v179 objects:&v187 count:16];
        }
        while (v27);
      }

      unint64_t v16 = 0x263EFF000;
    }
    else
    {
      v23 = 0;
    }
    uint64_t v31 = [v23 copy];

    backgroundShapeLayers = v15->_backgroundShapeLayers;
    v15->_backgroundShapeLayers = (NSArray *)v31;

    v33 = (CALayer *)objc_alloc_init(MEMORY[0x263F157E8]);
    foregroundLayer = v15->_foregroundLayer;
    v15->_foregroundLayer = v33;

    v35 = v15->_foregroundLayer;
    v36 = PKLayerNullActions();
    [(CALayer *)v35 setActions:v36];

    v37 = v15->_foregroundLayer;
    [*p_backgroundLayer anchorPoint];
    -[CALayer setAnchorPoint:](v37, "setAnchorPoint:");
    v38 = v15->_foregroundLayer;
    [*p_backgroundLayer bounds];
    -[CALayer setBounds:](v38, "setBounds:");
    v39 = v15->_foregroundLayer;
    [*p_backgroundLayer position];
    -[CALayer setPosition:](v39, "setPosition:");
    v40 = v15->_foregroundLayer;
    if (*p_backgroundLayer) {
      [*p_backgroundLayer transform];
    }
    else {
      memset(v175, 0, sizeof(v175));
    }
    [(CALayer *)v40 setTransform:v175];
    -[CALayer setGeometryFlipped:](v15->_foregroundLayer, "setGeometryFlipped:", [*p_backgroundLayer isGeometryFlipped]);
    v41 = v15->_backgroundShapeLayers;
    v42 = v15->_foregroundLayer;
    v43 = v41;
    v44 = v43;
    v45 = 0;
    if (v42 && v43)
    {
      unint64_t v46 = v16;
      v45 = objc_msgSend(objc_alloc(*(Class *)(v16 + 2432)), "initWithCapacity:", -[NSArray count](v43, "count"));
      long long v179 = 0u;
      long long v180 = 0u;
      long long v181 = 0u;
      long long v182 = 0u;
      v47 = v44;
      uint64_t v48 = [(NSArray *)v47 countByEnumeratingWithState:&v179 objects:&v187 count:16];
      if (v48)
      {
        uint64_t v49 = v48;
        uint64_t v50 = *(void *)v180;
        do
        {
          for (uint64_t j = 0; j != v49; ++j)
          {
            if (*(void *)v180 != v50) {
              objc_enumerationMutation(v47);
            }
            v52 = CloneShapeLayer(*(void **)(*((void *)&v179 + 1) + 8 * j));
            [v45 addObject:v52];
            [(CALayer *)v42 addSublayer:v52];
          }
          uint64_t v49 = [(NSArray *)v47 countByEnumeratingWithState:&v179 objects:&v187 count:16];
        }
        while (v49);
      }

      unint64_t v16 = v46;
    }
    uint64_t v53 = [v45 copy];

    foregroundShapeLayers = v15->_foregroundShapeLayers;
    v15->_foregroundShapeLayers = (NSArray *)v53;

    id v55 = objc_alloc_init(*(Class *)(v16 + 2432));
    long long v171 = 0u;
    long long v172 = 0u;
    long long v173 = 0u;
    long long v174 = 0u;
    v56 = v158;
    v57 = [v158 publishedObjectNames];
    uint64_t v58 = [v57 countByEnumeratingWithState:&v171 objects:v186 count:16];
    if (v58)
    {
      uint64_t v59 = v58;
      uint64_t v60 = *(void *)v172;
      do
      {
        uint64_t v61 = 0;
        do
        {
          if (*(void *)v172 != v60) {
            objc_enumerationMutation(v57);
          }
          v62 = *(void **)(*((void *)&v171 + 1) + 8 * v61);
          if (![v62 hasPrefix:@"ring_"]) {
            goto LABEL_40;
          }
          v63 = [v56 publishedObjectWithName:v62];
          if (!v63
            || (uint64_t v64 = [(NSArray *)v15->_backgroundShapeLayers indexOfObjectIdenticalTo:v63], v64 == 0x7FFFFFFFFFFFFFFFLL))
          {

            goto LABEL_41;
          }
          v65 = [(NSArray *)v15->_foregroundShapeLayers objectAtIndexedSubscript:v64];
          if (v65)
          {
            v66 = v65;
            PathBoundingBoCGFloat x = CGPathGetPathBoundingBox((CGPathRef)[v65 path]);
            CGFloat x = PathBoundingBox.origin.x;
            CGFloat y = PathBoundingBox.origin.y;
            CGFloat width = PathBoundingBox.size.width;
            CGFloat height = PathBoundingBox.size.height;
            if (!CGRectIsNull(PathBoundingBox))
            {
              [v66 anchorPoint];
              double v154 = v72;
              double v156 = v71;
              [v66 position];
              double v74 = v73;
              double v76 = v75;
              [v66 bounds];
              double v152 = v77;
              double v153 = v78;
              double v80 = v79;
              double v82 = v81;
              double v155 = v76 - v154 * v81;
              double v157 = v74 - v156 * v79;
              v190.origin.CGFloat x = x;
              v190.origin.CGFloat y = y;
              v190.size.CGFloat width = width;
              v190.size.CGFloat height = height;
              CGFloat v83 = (CGRectGetMidX(v190) - v152) / v80;
              v191.origin.CGFloat x = x;
              v191.origin.CGFloat y = y;
              v191.size.CGFloat width = width;
              v191.size.CGFloat height = height;
              CGFloat v84 = (CGRectGetMidY(v191) - v153) / v82;
              objc_msgSend(v66, "setAnchorPoint:", v83, v84);
              objc_msgSend(v66, "setPosition:", v157 + v83 * v80, v155 + v84 * v82);
            }
            [v55 addObject:v66];

            v56 = v158;
LABEL_40:
            [v55 sortUsingComparator:&__block_literal_global_3];
            goto LABEL_41;
          }

          v56 = v158;
LABEL_41:
          ++v61;
        }
        while (v59 != v61);
        uint64_t v85 = [v57 countByEnumeratingWithState:&v171 objects:v186 count:16];
        uint64_t v59 = v85;
      }
      while (v85);
    }

    uint64_t v86 = [v55 count];
    if (v86) {
      v87 = (void *)[v55 copy];
    }
    else {
      v87 = 0;
    }
    p_foregroundRingShapeLayers = (id *)&v15->_foregroundRingShapeLayers;
    objc_storeStrong((id *)&v15->_foregroundRingShapeLayers, v87);
    if (v86) {

    }
    if (*p_foregroundRingShapeLayers)
    {
      [(CALayer *)v15->_foregroundLayer bounds];
      double v90 = v89;
      double v92 = v91;
      double v94 = v93;
      double v96 = v95;
      v97 = (CALayer *)objc_alloc_init(MEMORY[0x263F157E8]);
      foregroundRingContainerLayer = v15->_foregroundRingContainerLayer;
      v15->_foregroundRingContainerLayer = v97;

      v99 = v15->_foregroundRingContainerLayer;
      v100 = PKLayerNullActions();
      [(CALayer *)v99 setActions:v100];

      -[CALayer setBounds:](v15->_foregroundRingContainerLayer, "setBounds:", v90, v92, v94, v96);
      v101 = (CALayer *)objc_alloc_init(MEMORY[0x263F157E8]);
      maskForegroundLayer = v15->_maskForegroundLayer;
      v15->_maskForegroundLayer = v101;

      v103 = v15->_maskForegroundLayer;
      v104 = PKLayerNullActions();
      [(CALayer *)v103 setActions:v104];

      MatchLayerGeometry(v15->_maskForegroundLayer, v15->_foregroundLayer);
      long long v169 = 0u;
      long long v170 = 0u;
      long long v167 = 0u;
      long long v168 = 0u;
      id v105 = *p_foregroundRingShapeLayers;
      uint64_t v106 = [v105 countByEnumeratingWithState:&v167 objects:v185 count:16];
      if (v106)
      {
        uint64_t v107 = v106;
        uint64_t v108 = *(void *)v168;
        do
        {
          for (uint64_t k = 0; k != v107; ++k)
          {
            if (*(void *)v168 != v108) {
              objc_enumerationMutation(v105);
            }
            v110 = *(void **)(*((void *)&v167 + 1) + 8 * k);
            [(CALayer *)v15->_foregroundRingContainerLayer addSublayer:v110];
            [v110 position];
          }
          double v113 = v111;
          double v114 = v112;
          uint64_t v107 = [v105 countByEnumeratingWithState:&v167 objects:v185 count:16];
        }
        while (v107);
      }
      else
      {
        double v114 = v150;
        double v113 = v151;
      }

      v115 = [*p_foregroundRingShapeLayers firstObject];
      if (v115)
      {
        v116 = v115;
        v117 = CloneShapeLayer(v115);

        id v118 = [MEMORY[0x263F1C550] blackColor];
        objc_msgSend(v117, "setFillColor:", objc_msgSend(v118, "CGColor"));

        id v119 = [MEMORY[0x263F1C550] blackColor];
        objc_msgSend(v117, "setStrokeColor:", objc_msgSend(v119, "CGColor"));

        [v117 setFillRule:*MEMORY[0x263F15AC8]];
        [v117 setStrokeStart:0.0];
        [v117 setStrokeEnd:1.0];
        [v117 setLineWidth:1.0];
        [(CALayer *)v15->_maskForegroundLayer addSublayer:v117];
      }
      -[CALayer setAnchorPoint:](v15->_foregroundRingContainerLayer, "setAnchorPoint:", (v113 - v90) / v94, (v114 - v92) / v96);
      -[CALayer setPosition:](v15->_foregroundRingContainerLayer, "setPosition:", v94 * ((v113 - v90) / v94), v96 * ((v114 - v92) / v96));
      v120 = (CALayer *)objc_alloc_init(MEMORY[0x263F157E8]);
      maskLayer = v15->_maskLayer;
      v15->_maskLayer = v120;

      v122 = v15->_maskLayer;
      v123 = PKLayerNullActions();
      [(CALayer *)v122 setActions:v123];

      [(CALayer *)v15->_maskLayer addSublayer:v15->_maskForegroundLayer];
      [(CALayer *)v15->_foregroundLayer addSublayer:v15->_foregroundRingContainerLayer];
    }
    uint64_t v124 = [(UIColor *)v15->_secondaryColor CGColor];
    long long v163 = 0u;
    long long v164 = 0u;
    long long v165 = 0u;
    long long v166 = 0u;
    v125 = v15->_backgroundShapeLayers;
    uint64_t v126 = [(NSArray *)v125 countByEnumeratingWithState:&v163 objects:v184 count:16];
    if (v126)
    {
      uint64_t v127 = v126;
      uint64_t v128 = *(void *)v164;
      do
      {
        for (uint64_t m = 0; m != v127; ++m)
        {
          if (*(void *)v164 != v128) {
            objc_enumerationMutation(v125);
          }
          v130 = *(void **)(*((void *)&v163 + 1) + 8 * m);
          v131 = (void *)[objc_alloc(MEMORY[0x263F5C230]) initWithShapeLayer:v130 reverse:1];
          [(PKFingerprintGlyphView *)v15 setPathState:v131 forLayer:v130];
          [v130 setStrokeColor:v124];
        }
        uint64_t v127 = [(NSArray *)v125 countByEnumeratingWithState:&v163 objects:v184 count:16];
      }
      while (v127);
    }

    uint64_t v132 = [(UIColor *)v15->_primaryColor CGColor];
    long long v159 = 0u;
    long long v160 = 0u;
    long long v161 = 0u;
    long long v162 = 0u;
    v133 = v15->_foregroundShapeLayers;
    uint64_t v134 = [(NSArray *)v133 countByEnumeratingWithState:&v159 objects:v183 count:16];
    if (v134)
    {
      uint64_t v135 = v134;
      uint64_t v136 = *(void *)v160;
      do
      {
        for (uint64_t n = 0; n != v135; ++n)
        {
          if (*(void *)v160 != v136) {
            objc_enumerationMutation(v133);
          }
          v138 = *(void **)(*((void *)&v159 + 1) + 8 * n);
          v139 = (void *)[objc_alloc(MEMORY[0x263F5C230]) initWithShapeLayer:v138];
          [(PKFingerprintGlyphView *)v15 setPathState:v139 forLayer:v138];
          [v138 setStrokeColor:v132];
        }
        uint64_t v135 = [(NSArray *)v133 countByEnumeratingWithState:&v159 objects:v183 count:16];
      }
      while (v135);
    }

    v140 = (CALayer *)objc_alloc_init(MEMORY[0x263F157E8]);
    contentLayer = v15->_contentLayer;
    v15->_contentLayer = v140;

    v142 = v15->_contentLayer;
    v143 = PKLayerNullActions();
    [(CALayer *)v142 setActions:v143];

    -[CALayer setFrame:](v15->_contentLayer, "setFrame:", v151, v150, v149, v148);
    [(CALayer *)v15->_contentLayer setMask:v15->_maskLayer];
    v144 = [(PKFingerprintGlyphView *)v15 layer];
    [v144 addSublayer:v15->_backgroundLayer];
    [v144 addSublayer:v15->_contentLayer];
    [v144 addSublayer:v15->_foregroundLayer];
    [(PKFingerprintGlyphView *)v15 setProgress:0.0 withDuration:0.0];
    v15->_priorState = 0;
    v15->_state = 0;
    [(PKFingerprintGlyphView *)v15 setContentLayerOpacity:0.0 withDuration:0.0];
    [(PKFingerprintGlyphView *)v15 setNeedsLayout];

    v7 = v158;
    v9 = v146;
    id v8 = v147;
  }

  return v15;
}

uint64_t __30__PKFingerprintGlyphView_init__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  [a2 strokeStart];
  double v6 = v5;
  [v4 strokeStart];
  double v8 = v7;

  if (v6 < v8) {
    return -1;
  }
  else {
    return v6 > v8;
  }
}

- (void)dealloc
{
  if (self->_transitioning) {
    [(PKFingerprintGlyphView *)self _executeTransitionCompletionHandlers:1];
  }
  v3.receiver = self;
  v3.super_class = (Class)PKFingerprintGlyphView;
  [(PKFingerprintGlyphView *)&v3 dealloc];
}

- (void)_dynamicUserInterfaceTraitDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)PKFingerprintGlyphView;
  [(PKFingerprintGlyphView *)&v3 _dynamicUserInterfaceTraitDidChange];
  [(PKFingerprintGlyphView *)self _applyPrimaryColorAnimated:1];
  [(PKFingerprintGlyphView *)self _applySecondaryColorAnimated:1];
}

- (void)didMoveToWindow
{
  v4.receiver = self;
  v4.super_class = (Class)PKFingerprintGlyphView;
  [(PKFingerprintGlyphView *)&v4 didMoveToWindow];
  objc_super v3 = [(PKFingerprintGlyphView *)self window];

  if (v3) {
    [(PKFingerprintGlyphView *)self _restartRotationIfNecessary];
  }
}

- (void)layoutSubviews
{
  v29.receiver = self;
  v29.super_class = (Class)PKFingerprintGlyphView;
  [(PKFingerprintGlyphView *)&v29 layoutSubviews];
  [(PKFingerprintGlyphView *)self bounds];
  CGFloat v4 = v3;
  CGFloat v6 = v5;
  double v8 = v7;
  double v10 = v9;
  -[CALayer setFrame:](self->_contentLayer, "setFrame:");
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained fingerprintGlyphView:self didLayoutContentLayer:self->_contentLayer];

  -[PKFingerprintGlyphView pointScaleToMatchBoundsSize:](self, "pointScaleToMatchBoundsSize:", v8, v10);
  memset(&v28, 0, sizeof(v28));
  CATransform3DMakeScale(&v28, v12 * 0.5, v12 * 0.5, 1.0);
  backgroundLayer = self->_backgroundLayer;
  CATransform3D v27 = v28;
  [(CALayer *)backgroundLayer setTransform:&v27];
  foregroundLayer = self->_foregroundLayer;
  CATransform3D v27 = v28;
  [(CALayer *)foregroundLayer setTransform:&v27];
  v30.origin.CGFloat x = v4;
  v30.origin.CGFloat y = v6;
  v30.size.CGFloat width = v8;
  v30.size.CGFloat height = v10;
  double MidX = CGRectGetMidX(v30);
  v31.origin.CGFloat x = v4;
  v31.origin.CGFloat y = v6;
  v31.size.CGFloat width = v8;
  v31.size.CGFloat height = v10;
  double MidY = CGRectGetMidY(v31);
  -[CALayer setPosition:](self->_backgroundLayer, "setPosition:", MidX, MidY);
  -[CALayer setPosition:](self->_foregroundLayer, "setPosition:", MidX, MidY);
  [(CALayer *)self->_contentLayer bounds];
  double v18 = v17;
  double v20 = v19;
  double v22 = v21;
  double v24 = v23;
  [(CALayer *)self->_maskLayer anchorPoint];
  -[CALayer setPosition:](self->_maskLayer, "setPosition:", v18 + v25 * v22, v20 + v26 * v24);
  -[CALayer setBounds:](self->_maskLayer, "setBounds:", v18, v20, v22, v24);
  MatchLayerGeometry(self->_maskForegroundLayer, self->_foregroundLayer);
}

- (double)pointScaleToMatchBoundsSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  [(CALayer *)self->_backgroundLayer bounds];
  double v7 = width / v6;
  double v8 = 0.0;
  if (v6 == 0.0) {
    double v7 = 0.0;
  }
  if (v5 != 0.0) {
    double v8 = height / v5;
  }
  double v9 = fmin(v7, v8);
  return v9 + v9;
}

- (CGSize)boundsSizeToMatchPointScale:(double)a3
{
  double v3 = a3 * 0.5;
  [(CALayer *)self->_backgroundLayer bounds];
  double v5 = v3 * v4;
  double v7 = v3 * v6;
  result.double height = v7;
  result.double width = v5;
  return result;
}

- (void)setRecognizedIfNecessaryWithCompletion:(id)a3
{
  double v4 = (void (**)(id, void))a3;
  int64_t state = self->_state;
  BOOL v6 = state == 4 || state == 1;
  if (v6 && !self->_fadeOnRecognized)
  {
    -[PKFingerprintGlyphView setState:animated:completionHandler:](self, "setState:animated:completionHandler:", 4, 1);
  }
  else if (v4)
  {
    v4[2](v4, 0);
  }

  MEMORY[0x270F9A830]();
}

- (void)setState:(int64_t)a3 animated:(BOOL)a4 completionHandler:(id)a5
{
  BOOL v5 = a4;
  id v8 = a5;
  if (self->_state == a3)
  {
    if (!v8) {
      goto LABEL_12;
    }
    id v16 = v8;
    if (self->_transitioning)
    {
      transitionCompletionHandlers = self->_transitionCompletionHandlers;
      double v10 = (void *)[v8 copy];
      double v11 = (void *)MEMORY[0x223C3D8D0]();
      [(NSMutableArray *)transitionCompletionHandlers addObject:v11];
    }
    else
    {
      (*((void (**)(id, void))v8 + 2))(v8, 0);
    }
  }
  else
  {
    id v16 = v8;
    if (self->_transitioning)
    {
      self->_transitioning = 0;
      [(PKFingerprintGlyphView *)self _executeTransitionCompletionHandlers:1];
      [(PKFingerprintGlyphView *)self setState:a3 animated:v5 completionHandler:v16];
    }
    else
    {
      unint64_t v12 = self->_transitionIndex + 1;
      self->_transitionIndeCGFloat x = v12;
      self->_transitioning = 1;
      self->_priorState = self->_state;
      self->_int64_t state = a3;
      if (v8)
      {
        double v13 = self->_transitionCompletionHandlers;
        v14 = (void *)[v8 copy];
        v15 = (void *)MEMORY[0x223C3D8D0]();
        [(NSMutableArray *)v13 addObject:v15];
      }
      [(PKFingerprintGlyphView *)self _performTransitionWithTransitionIndex:v12 animated:v5];
    }
  }
  id v8 = v16;
LABEL_12:
}

- (void)_executeTransitionCompletionHandlers:(BOOL)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  double v4 = (void *)[(NSMutableArray *)self->_transitionCompletionHandlers copy];
  [(NSMutableArray *)self->_transitionCompletionHandlers removeAllObjects];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v5 = v4;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v10 + 1) + 8 * v9) + 16))(*(void *)(*((void *)&v10 + 1) + 8 * v9));
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (void)_finishTransitionForIndex:(unint64_t)a3
{
  if (self->_transitioning && self->_transitionIndex == a3)
  {
    self->_transitioning = 0;
    [(PKFingerprintGlyphView *)self _executeTransitionCompletionHandlers:0];
  }
}

- (void)_updateLastAnimationTimeWithAnimationOfDuration:(double)a3
{
  self->_lastAnimationWillFinish = fmax(CFAbsoluteTimeGetCurrent() + a3, self->_lastAnimationWillFinish);
}

- (double)_minimumAnimationDurationForStateTransition
{
  CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
  double lastAnimationWillFinish = self->_lastAnimationWillFinish;
  double v5 = lastAnimationWillFinish - Current;
  BOOL v6 = lastAnimationWillFinish <= Current;
  double result = 0.0;
  if (!v6) {
    return v5;
  }
  return result;
}

- (void)_executeAfterMinimumAnimationDurationForStateTransition:(id)a3
{
  double v4 = (void (**)(void))a3;
  if (v4)
  {
    blocuint64_t k = v4;
    [(PKFingerprintGlyphView *)self _minimumAnimationDurationForStateTransition];
    if (v5 <= 0.0)
    {
      block[2]();
    }
    else
    {
      dispatch_time_t v6 = dispatch_time(0, (uint64_t)(v5 * 1000000000.0));
      dispatch_after(v6, MEMORY[0x263EF83A0], block);
    }
    double v4 = block;
  }
}

- (void)_performTransitionWithTransitionIndex:(unint64_t)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  [(PKFingerprintGlyphView *)self _minimumAnimationDurationForStateTransition];
  double v8 = v7;
  objc_initWeak(&location, self);
  switch(self->_state)
  {
    case 0:
      [(CALayer *)self->_contentLayer opacity];
      if (v15 == 0.0) {
        goto LABEL_18;
      }
      double v16 = 0.0;
      if (v4) {
        double v16 = 0.25;
      }
      double v17 = fmax(v16, v8);
      [(PKFingerprintGlyphView *)self setContentLayerOpacity:0.0 withDuration:v17];
      [(PKFingerprintGlyphView *)self _updateLastAnimationTimeWithAnimationOfDuration:v17];
      v33[0] = MEMORY[0x263EF8330];
      v33[1] = 3221225472;
      v33[2] = __73__PKFingerprintGlyphView__performTransitionWithTransitionIndex_animated___block_invoke;
      v33[3] = &unk_2644F9528;
      uint64_t v9 = v34;
      objc_copyWeak(v34, &location);
      v34[1] = (id)a3;
      BOOL v35 = v4;
      [(PKFingerprintGlyphView *)self _executeAfterMinimumAnimationDurationForStateTransition:v33];
      goto LABEL_23;
    case 1:
      if (v4)
      {
        double v13 = 0.5;
        if (!self->_fadeOnRecognized) {
          double v13 = 0.75;
        }
        double v8 = fmax(v13, v8);
      }
      [(PKFingerprintGlyphView *)self setContentLayerOpacity:0.0 withDuration:v8];
      if (v4)
      {
        [(PKFingerprintGlyphView *)self setProgress:1.0 withDuration:v8];
        dispatch_time_t v14 = dispatch_time(0, (uint64_t)(v8 * 0.85 * 1000000000.0));
        block[0] = MEMORY[0x263EF8330];
        block[1] = 3221225472;
        block[2] = __73__PKFingerprintGlyphView__performTransitionWithTransitionIndex_animated___block_invoke_3;
        block[3] = &unk_2644F9550;
        uint64_t v9 = v30;
        objc_copyWeak(v30, &location);
        v30[1] = (id)a3;
        dispatch_after(v14, MEMORY[0x263EF83A0], block);
      }
      else
      {
        [(PKFingerprintGlyphView *)self setProgress:0.8 withDuration:v8];
        v27[0] = MEMORY[0x263EF8330];
        v27[1] = 3221225472;
        v27[2] = __73__PKFingerprintGlyphView__performTransitionWithTransitionIndex_animated___block_invoke_4;
        v27[3] = &unk_2644F9550;
        uint64_t v9 = v28;
        objc_copyWeak(v28, &location);
        v28[1] = (id)a3;
        [(PKFingerprintGlyphView *)self _executeAfterMinimumAnimationDurationForStateTransition:v27];
      }
      goto LABEL_23;
    case 2:
    case 3:
      uint64_t v20 = MEMORY[0x263EF8330];
      uint64_t v21 = 3221225472;
      double v22 = __73__PKFingerprintGlyphView__performTransitionWithTransitionIndex_animated___block_invoke_5;
      double v23 = &unk_2644F9578;
      uint64_t v9 = v25;
      objc_copyWeak(v25, &location);
      v25[1] = (id)a3;
      double v24 = self;
      BOOL v26 = v4;
      uint64_t v10 = MEMORY[0x223C3D8D0](&v20);
      long long v11 = (void *)v10;
      if (self->_priorState == 1)
      {
        double v12 = 0.4;
        if (!v4) {
          double v12 = 0.0;
        }
        -[PKFingerprintGlyphView setProgress:withDuration:](self, "setProgress:withDuration:", 1.0, fmax(v12, v8), v20, v21, v22, v23);
        [(PKFingerprintGlyphView *)self _executeAfterMinimumAnimationDurationForStateTransition:v11];
      }
      else
      {
        (*(void (**)(uint64_t))(v10 + 16))(v10);
      }

      goto LABEL_23;
    case 4:
LABEL_18:
      [(PKFingerprintGlyphView *)self _showFingerprintWithTransitionIndex:a3 animated:v4];
      goto LABEL_24;
    case 5:
      [(PKFingerprintGlyphView *)self _minimumAnimationDurationForStateTransition];
      double v19 = 0.3;
      if (!v4) {
        double v19 = 0.0;
      }
      [(PKFingerprintGlyphView *)self setContentLayerOpacity:1.0 withDuration:fmax(v19, v18)];
      [(PKFingerprintGlyphView *)self _setRingState:2 withTransitionIndex:a3 animated:v4];
      v31[0] = MEMORY[0x263EF8330];
      v31[1] = 3221225472;
      v31[2] = __73__PKFingerprintGlyphView__performTransitionWithTransitionIndex_animated___block_invoke_2;
      v31[3] = &unk_2644F9550;
      uint64_t v9 = v32;
      objc_copyWeak(v32, &location);
      v32[1] = (id)a3;
      [(PKFingerprintGlyphView *)self _executeAfterMinimumAnimationDurationForStateTransition:v31];
LABEL_23:
      objc_destroyWeak(v9);
LABEL_24:
      if (self->_state != 3) {
        goto LABEL_25;
      }
      goto LABEL_26;
    default:
LABEL_25:
      [(PKFingerprintGlyphView *)self _updateRotationAnimationsIfNecessary];
LABEL_26:
      objc_destroyWeak(&location);
      return;
  }
}

void __73__PKFingerprintGlyphView__performTransitionWithTransitionIndex_animated___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    [WeakRetained _showFingerprintWithTransitionIndex:*(void *)(a1 + 40) animated:*(unsigned __int8 *)(a1 + 48)];
    id WeakRetained = v3;
  }
}

void __73__PKFingerprintGlyphView__performTransitionWithTransitionIndex_animated___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    [WeakRetained _finishTransitionForIndex:*(void *)(a1 + 40)];
    id WeakRetained = v3;
  }
}

void __73__PKFingerprintGlyphView__performTransitionWithTransitionIndex_animated___block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    [WeakRetained _startRecognitionHoldingStateWithTransitionIndex:*(void *)(a1 + 40)];
    id WeakRetained = v3;
  }
}

void __73__PKFingerprintGlyphView__performTransitionWithTransitionIndex_animated___block_invoke_4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    [WeakRetained _startRecognitionHoldingStateWithTransitionIndex:*(void *)(a1 + 40)];
    id WeakRetained = v3;
  }
}

void __73__PKFingerprintGlyphView__performTransitionWithTransitionIndex_animated___block_invoke_5(uint64_t a1)
{
  v2 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  BOOL v4 = WeakRetained;
  if (WeakRetained && WeakRetained[59] == *(void *)(a1 + 48))
  {
    objc_msgSend(WeakRetained, "_setRingState:withTransitionIndex:animated:", *(void *)(*(void *)(a1 + 32) + 552) != 2);
    if (*(unsigned char *)(a1 + 56))
    {
      [v4 _minimumAnimationDurationForStateTransition];
      double v6 = v5;
    }
    else
    {
      double v6 = 0.0;
    }
    [v4 setContentLayerOpacity:0.0 withDuration:v6];
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __73__PKFingerprintGlyphView__performTransitionWithTransitionIndex_animated___block_invoke_6;
    v7[3] = &unk_2644F9550;
    objc_copyWeak(v8, v2);
    v8[1] = *(id *)(a1 + 48);
    [v4 _executeAfterMinimumAnimationDurationForStateTransition:v7];
    objc_destroyWeak(v8);
  }
}

void __73__PKFingerprintGlyphView__performTransitionWithTransitionIndex_animated___block_invoke_6(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained && WeakRetained[59] == *(void *)(a1 + 40))
  {
    id v3 = WeakRetained;
    [WeakRetained _updateRotationAnimationsIfNecessary];
    [v3 _finishTransitionForIndex:*(void *)(a1 + 40)];
    id WeakRetained = v3;
  }
}

- (void)_showFingerprintWithTransitionIndex:(unint64_t)a3 animated:(BOOL)a4
{
  if (self->_transitionIndex == a3)
  {
    BOOL v4 = a4;
    [(PKFingerprintGlyphView *)self _minimumAnimationDurationForStateTransition];
    double v8 = 0.0;
    double v9 = 0.0;
    if (v4) {
      double v9 = dbl_21EEE7B80[!self->_fadeOnRecognized];
    }
    int64_t state = self->_state;
    BOOL v11 = state == 4;
    if (state == 4 && (double v8 = 1.0, self->_fadeOnRecognized)) {
      -[PKFingerprintGlyphView setContentLayerOpacity:withDuration:](self, "setContentLayerOpacity:withDuration:", 1.0, 0.25, 1.0);
    }
    else {
      [(PKFingerprintGlyphView *)self setProgress:v8 withDuration:fmax(v9, v7)];
    }
    objc_initWeak(&location, self);
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __71__PKFingerprintGlyphView__showFingerprintWithTransitionIndex_animated___block_invoke;
    v12[3] = &unk_2644F9528;
    objc_copyWeak(v13, &location);
    v13[1] = (id)a3;
    BOOL v14 = v11;
    [(PKFingerprintGlyphView *)self _executeAfterMinimumAnimationDurationForStateTransition:v12];
    objc_destroyWeak(v13);
    objc_destroyWeak(&location);
  }
}

void __71__PKFingerprintGlyphView__showFingerprintWithTransitionIndex_animated___block_invoke(uint64_t a1)
{
  v2 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  BOOL v4 = WeakRetained;
  if (WeakRetained && WeakRetained[59] == *(void *)(a1 + 40))
  {
    if (*(unsigned char *)(a1 + 48))
    {
      uint64_t v5 = MEMORY[0x263EF8330];
      uint64_t v6 = 3221225472;
      double v7 = __71__PKFingerprintGlyphView__showFingerprintWithTransitionIndex_animated___block_invoke_2;
      double v8 = &unk_2644F9550;
      objc_copyWeak(v9, v2);
      v9[1] = *(id *)(a1 + 40);
      [v4 _executeAfterMinimumAnimationDurationForStateTransition:&v5];
      objc_msgSend(v4, "setContentLayerOpacity:withDuration:", 1.0, 0.25, v5, v6, v7, v8);
      objc_destroyWeak(v9);
    }
    else
    {
      objc_msgSend(WeakRetained, "_finishTransitionForIndex:");
    }
  }
}

void __71__PKFingerprintGlyphView__showFingerprintWithTransitionIndex_animated___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    [WeakRetained _finishTransitionForIndex:*(void *)(a1 + 40)];
    id WeakRetained = v3;
  }
}

- (void)_startRecognitionHoldingStateWithTransitionIndex:(unint64_t)a3
{
  if (self->_transitionIndex == a3)
  {
    NSUInteger v5 = [(NSArray *)self->_backgroundShapeLayers count];
    if (v5)
    {
      NSUInteger v6 = v5;
      for (uint64_t i = 0; i != v6; ++i)
        [(PKFingerprintGlyphView *)self _continueHoldingStateForPathAtIndex:i withTransitionIndex:a3];
    }
    [(PKFingerprintGlyphView *)self _finishTransitionForIndex:a3];
  }
}

- (void)_continueHoldingStateForPathAtIndex:(unint64_t)a3 withTransitionIndex:(unint64_t)a4
{
  if (self->_transitionIndex == a4)
  {
    double v7 = -[NSArray objectAtIndexedSubscript:](self->_foregroundShapeLayers, "objectAtIndexedSubscript:");
    double v8 = [(PKFingerprintGlyphView *)self pathStateForLayer:v7];
    double v9 = [(NSArray *)self->_foregroundShapeLayers objectAtIndexedSubscript:a3];
    [v8 progressForShapeLayer:v9];
    double v11 = v10;

    LODWORD(v7) = arc4random_uniform(2u);
    double v12 = (double)arc4random_uniform(0x65u) / 1000.0;
    double v13 = 0.8;
    if (!v7) {
      double v13 = 0.5;
    }
    double v14 = v13 + v12;
    double v15 = vabdd_f64(v13 + v12, v11);
    double v16 = 1.5;
    if (v14 > v11) {
      double v16 = 2.25;
    }
    double v17 = v16 * v15;
    [(PKFingerprintGlyphView *)self _updateLastAnimationTimeWithAnimationOfDuration:v16 * v15];
    [(PKFingerprintGlyphView *)self _setProgress:a3 withDuration:v14 forShapeLayerAtIndex:v17];
    objc_initWeak(&location, self);
    uint32_t v18 = arc4random_uniform(0xFBu);
    dispatch_time_t v19 = dispatch_time(0, (uint64_t)((v17 + (double)v18 / 1000.0 + 0.5) * 1000000000.0));
    v20[0] = MEMORY[0x263EF8330];
    v20[1] = 3221225472;
    v20[2] = __82__PKFingerprintGlyphView__continueHoldingStateForPathAtIndex_withTransitionIndex___block_invoke;
    v20[3] = &unk_2644F95A0;
    objc_copyWeak(v21, &location);
    v21[1] = (id)a3;
    v21[2] = (id)a4;
    dispatch_after(v19, MEMORY[0x263EF83A0], v20);
    objc_destroyWeak(v21);
    objc_destroyWeak(&location);
  }
}

void __82__PKFingerprintGlyphView__continueHoldingStateForPathAtIndex_withTransitionIndex___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    [WeakRetained _continueHoldingStateForPathAtIndex:*(void *)(a1 + 40) withTransitionIndex:*(void *)(a1 + 48)];
    id WeakRetained = v3;
  }
}

- (void)_setRingState:(unint64_t)a3 withTransitionIndex:(unint64_t)a4 animated:(BOOL)a5
{
  uint64_t v65 = *MEMORY[0x263EF8340];
  if (self->_transitionIndex == a4)
  {
    uint64_t v59 = 0;
    uint64_t v60 = &v59;
    uint64_t v61 = 0x2020000000;
    char v62 = 0;
    BOOL fadeOnRecognized = self->_fadeOnRecognized;
    if (a5) {
      double v8 = 0.4;
    }
    else {
      double v8 = 0.0;
    }
    v57[0] = MEMORY[0x263EF8330];
    v57[1] = 3221225472;
    v57[2] = __69__PKFingerprintGlyphView__setRingState_withTransitionIndex_animated___block_invoke;
    v57[3] = &unk_2644F95C8;
    *(double *)&v57[5] = v8;
    v57[4] = &v59;
    BOOL v58 = fadeOnRecognized;
    double v9 = (void (**)(void, void, __n128, double))MEMORY[0x223C3D8D0](v57, a2);
    long long v55 = 0u;
    long long v56 = 0u;
    long long v53 = 0u;
    long long v54 = 0u;
    double v10 = self->_backgroundShapeLayers;
    uint64_t v11 = [(NSArray *)v10 countByEnumeratingWithState:&v53 objects:v64 count:16];
    if (v11)
    {
      uint64_t v12 = *(void *)v54;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v54 != v12) {
            objc_enumerationMutation(v10);
          }
          uint64_t v14 = *(void *)(*((void *)&v53 + 1) + 8 * i);
          if (a3) {
            [*(id *)(*((void *)&v53 + 1) + 8 * i) strokeEnd];
          }
          else {
            [*(id *)(*((void *)&v53 + 1) + 8 * i) strokeStart];
          }
          v9[2](v9, v14, v15, v15.n128_f64[0]);
        }
        uint64_t v11 = [(NSArray *)v10 countByEnumeratingWithState:&v53 objects:v64 count:16];
      }
      while (v11);
    }

    NSUInteger v16 = [(NSArray *)self->_foregroundRingShapeLayers count];
    long long v51 = 0u;
    long long v52 = 0u;
    long long v49 = 0u;
    long long v50 = 0u;
    obuint64_t j = self->_foregroundShapeLayers;
    uint64_t v17 = [(NSArray *)obj countByEnumeratingWithState:&v49 objects:v63 count:16];
    if (v17)
    {
      unint64_t v45 = v16 - 1;
      uint64_t v47 = *(void *)v50;
      do
      {
        uint64_t v48 = v17;
        for (uint64_t j = 0; j != v48; ++j)
        {
          if (*(void *)v50 != v47) {
            objc_enumerationMutation(obj);
          }
          dispatch_time_t v19 = *(void **)(*((void *)&v49 + 1) + 8 * j);
          foregroundRingShapeLayers = self->_foregroundRingShapeLayers;
          if (foregroundRingShapeLayers
            && (unint64_t v21 = [(NSArray *)foregroundRingShapeLayers indexOfObjectIdenticalTo:*(void *)(*((void *)&v49 + 1) + 8 * j)], v21 != 0x7FFFFFFFFFFFFFFFLL))
          {
            double v23 = [(PKFingerprintGlyphView *)self pathStateForLayer:v19];
            [v23 strokeStartAtProgress:1.0];
            double v25 = v24;
            [v23 strokeEndAtProgress:1.0];
            double v27 = v26;
            if (v21)
            {
              CATransform3D v28 = [(NSArray *)self->_foregroundRingShapeLayers objectAtIndexedSubscript:v21 - 1];
              objc_super v29 = [(PKFingerprintGlyphView *)self pathStateForLayer:v28];

              [v29 strokeEndAtProgress:1.0];
              double v31 = v30;

              double v32 = (v25 + v31) * 0.5;
            }
            else
            {
              double v32 = 0.0;
            }
            double v33 = 1.0;
            if (v21 < v45)
            {
              v34 = -[NSArray objectAtIndexedSubscript:](self->_foregroundRingShapeLayers, "objectAtIndexedSubscript:", v21 + 1, 1.0);
              BOOL v35 = [(PKFingerprintGlyphView *)self pathStateForLayer:v34];

              [v35 strokeStartAtProgress:1.0];
              double v37 = v36;

              double v33 = (v27 + v37) * 0.5;
            }
            if (a3) {
              double v38 = v33;
            }
            else {
              double v38 = v32;
            }
            if (a3 == 1)
            {
              double v39 = v32 + 0.025;
              if (v21) {
                double v39 = v32;
              }
              double v40 = v38 + -0.025;
              if (v21 != v45) {
                double v40 = v38;
              }
              double v32 = fmin(v39, v40);
              double v38 = fmax(v32, v40);
            }
            [v19 strokeStart];
            double v42 = v41;
            [v19 strokeEnd];
            if (v42 == v43
              && (objc_msgSend(v19, "pkui_hasAdditiveAnimationForKeyPath:", @"strokeStart") & 1) == 0
              && (objc_msgSend(v19, "pkui_hasAdditiveAnimationForKeyPath:", @"strokeEnd") & 1) == 0)
            {
              if (v32 == v38)
              {
                [v19 setStrokeStart:v32];
                double v44 = v38;
              }
              else
              {
                double v44 = 0.5;
                [v19 setStrokeStart:0.5];
              }
              [v19 setStrokeEnd:v44];
            }
            ((void (*)(void (**)(void, void, __n128, double), void *, double, double))v9[2])(v9, v19, v32, v38);
          }
          else
          {
            if (a3) {
              [v19 strokeEnd];
            }
            else {
              [v19 strokeStart];
            }
            ((void (**)(void, void *, __n128, double))v9)[2](v9, v19, v22, v22.n128_f64[0]);
          }
        }
        uint64_t v17 = [(NSArray *)obj countByEnumeratingWithState:&v49 objects:v63 count:16];
      }
      while (v17);
    }

    if (*((unsigned char *)v60 + 24)) {
      [(PKFingerprintGlyphView *)self _updateLastAnimationTimeWithAnimationOfDuration:v8];
    }

    _Block_object_dispose(&v59, 8);
  }
}

void __69__PKFingerprintGlyphView__setRingState_withTransitionIndex_animated___block_invoke(uint64_t a1, void *a2, double a3, double a4)
{
  id v7 = a2;
  id v26 = v7;
  if (*(double *)(a1 + 40) > 0.0)
  {
    id v8 = objc_alloc_init(MEMORY[0x263EFF980]);
    [v26 strokeStart];
    if (v9 == a3)
    {
      uint64_t v14 = v26;
LABEL_9:
      [v14 strokeEnd];
      if (v15 != a4)
      {
        if (v8)
        {
          double v16 = v15;
          uint64_t v17 = [MEMORY[0x263F15760] animationWithKeyPath:@"strokeEnd"];
          [v17 setAdditive:1];
          [v17 setDuration:*(double *)(a1 + 40)];
          uint32_t v18 = PKMagicCurve();
          [v17 setTimingFunction:v18];

          objc_msgSend(v17, "pkui_updateForAdditiveAnimationFromScalar:toScalar:", v16, a4);
          [v8 addObject:v17];
        }
        goto LABEL_13;
      }
      goto LABEL_14;
    }
    if (v8)
    {
      double v10 = v9;
      uint64_t v11 = [MEMORY[0x263F15760] animationWithKeyPath:@"strokeStart"];
      [v11 setAdditive:1];
      [v11 setDuration:*(double *)(a1 + 40)];
      uint64_t v12 = PKMagicCurve();
      [v11 setTimingFunction:v12];

      objc_msgSend(v11, "pkui_updateForAdditiveAnimationFromScalar:toScalar:", v10, a3);
      [v8 addObject:v11];
    }
LABEL_7:
    [v26 setStrokeStart:a3];
    uint64_t v14 = v26;
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
    goto LABEL_9;
  }
  [v7 strokeStart];
  if (v13 != a3)
  {
    id v8 = 0;
    goto LABEL_7;
  }
  [v26 strokeEnd];
  id v8 = 0;
  if (v19 != a4)
  {
LABEL_13:
    [v26 setStrokeEnd:a4];
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
  }
LABEL_14:
  if (a3 == a4 && *(unsigned char *)(a1 + 48) && [v8 count])
  {
    [v26 opacity];
    double v21 = v20;
    __n128 v22 = [MEMORY[0x263F15760] animationWithKeyPath:@"opacity"];
    [v22 setAdditive:1];
    [v22 setDuration:*(double *)(a1 + 40)];
    double v23 = PKMagicCurve();
    [v22 setTimingFunction:v23];

    [v22 setFillMode:*MEMORY[0x263F15AB0]];
    objc_msgSend(v22, "pkui_updateForAdditiveAnimationFromScalar:toScalar:withLayerScalar:", v21, 0.0, v21);
    [v8 addObject:v22];
  }
  if ([v8 count])
  {
    double v24 = [MEMORY[0x263F15750] animation];
    [v24 setDuration:*(double *)(a1 + 40)];
    [v24 setAnimations:v8];
    id v25 = (id)objc_msgSend(v26, "pkui_addAdditiveAnimation:", v24);
  }
}

- (void)_updateRotationAnimationsIfNecessary
{
  BOOL v2 = self->_state == 3;
  if (self->_state == 3)
  {
    if (!self->_rotatingRing)
    {
      self->_rotatingRing = v2;
      [(PKFingerprintGlyphView *)self _startRotationAnimation];
    }
  }
  else if (self->_rotatingRing)
  {
    self->_rotatingRing = v2;
    [(PKFingerprintGlyphView *)self _endRotationAnimation];
  }
}

- (void)_restartRotationIfNecessary
{
  if (self->_rotationAnimationKey)
  {
    id v3 = -[CALayer animationForKey:](self->_foregroundRingContainerLayer, "animationForKey:");

    if (!v3)
    {
      rotationAnimationKeCGFloat y = self->_rotationAnimationKey;
      self->_rotationAnimationKeCGFloat y = 0;

      [(PKFingerprintGlyphView *)self _startRotationAnimation];
    }
  }
}

- (void)_startRotationAnimation
{
  v42[5] = *MEMORY[0x263EF8340];
  if (self->_foregroundRingContainerLayer)
  {
    if (!self->_rotationAnimationKey)
    {
      id v3 = [MEMORY[0x263F157D8] animationWithKeyPath:@"transform"];
      [v3 setAdditive:1];
      uint64_t v4 = *MEMORY[0x263F15980];
      [v3 setBeginTimeMode:*MEMORY[0x263F15980]];
      [v3 setDuration:0.55];
      uint64_t v35 = *MEMORY[0x263F15AA8];
      objc_msgSend(v3, "setFillMode:");
      NSUInteger v5 = (void *)MEMORY[0x263F08D40];
      CATransform3DMakeRotation(&v39, -3.14159265, 0.0, 0.0, -1.0);
      NSUInteger v6 = [v5 valueWithCATransform3D:&v39];
      *(void *)&v41.m11 = v6;
      id v7 = (void *)MEMORY[0x263F08D40];
      CATransform3DMakeRotation(&v38, -1.57079633, 0.0, 0.0, -1.0);
      id v8 = [v7 valueWithCATransform3D:&v38];
      *(void *)&v41.m12 = v8;
      double v9 = (void *)MEMORY[0x263F08D40];
      CATransform3DMakeRotation(&v37, 0.0, 0.0, 0.0, -1.0);
      double v10 = [v9 valueWithCATransform3D:&v37];
      *(void *)&v41.m13 = v10;
      uint64_t v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v41 count:3];
      [v3 setValues:v11];

      [v3 setKeyTimes:&unk_26D086C38];
      uint64_t v12 = [MEMORY[0x263F15808] functionWithName:*MEMORY[0x263F15EB0]];
      *(void *)&v40.m11 = v12;
      uint64_t v13 = *MEMORY[0x263F15EC8];
      uint64_t v14 = [MEMORY[0x263F15808] functionWithName:*MEMORY[0x263F15EC8]];
      *(void *)&v40.m12 = v14;
      double v15 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v40 count:2];
      [v3 setTimingFunctions:v15];

      double v16 = [MEMORY[0x263F157D8] animationWithKeyPath:@"transform"];
      [v16 setAdditive:1];
      [v16 setBeginTimeMode:v4];
      [v16 setDuration:1.0];
      uint64_t v17 = [MEMORY[0x263F15808] functionWithName:v13];
      [v16 setTimingFunction:v17];

      [v16 setFillMode:v35];
      uint32_t v18 = (void *)MEMORY[0x263F08D40];
      CATransform3DMakeRotation(&v39, 0.0, 0.0, 0.0, -1.0);
      double v19 = [v18 valueWithCATransform3D:&v39];
      v42[0] = v19;
      float v20 = (void *)MEMORY[0x263F08D40];
      CATransform3DMakeRotation(&v38, 1.57079633, 0.0, 0.0, -1.0);
      double v21 = [v20 valueWithCATransform3D:&v38];
      v42[1] = v21;
      __n128 v22 = (void *)MEMORY[0x263F08D40];
      CATransform3DMakeRotation(&v37, 3.14159265, 0.0, 0.0, -1.0);
      double v23 = [v22 valueWithCATransform3D:&v37];
      v42[2] = v23;
      double v24 = (void *)MEMORY[0x263F08D40];
      CATransform3DMakeRotation(&v41, 4.71238898, 0.0, 0.0, -1.0);
      id v25 = [v24 valueWithCATransform3D:&v41];
      v42[3] = v25;
      id v26 = (void *)MEMORY[0x263F08D40];
      CATransform3DMakeRotation(&v40, 0.0, 0.0, 0.0, -1.0);
      double v27 = [v26 valueWithCATransform3D:&v40];
      v42[4] = v27;
      CATransform3D v28 = [MEMORY[0x263EFF8C0] arrayWithObjects:v42 count:5];
      [v16 setValues:v28];

      [v16 setKeyTimes:&unk_26D086C50];
      LODWORD(v29) = 2139095040;
      [v16 setRepeatCount:v29];
      [v16 setBeginTime:0.55];
      id v30 = (id)[(CALayer *)self->_foregroundRingContainerLayer pkui_addAdditiveAnimation:v3];
      double v31 = [(CALayer *)self->_foregroundRingContainerLayer pkui_addAdditiveAnimation:v16];
      double v32 = (NSString *)[v31 copy];
      rotationAnimationKeCGFloat y = self->_rotationAnimationKey;
      self->_rotationAnimationKeCGFloat y = v32;

      foregroundRingContainerLayer = self->_foregroundRingContainerLayer;
      CATransform3DMakeRotation(&v36, 3.14159265, 0.0, 0.0, -1.0);
      [(CALayer *)foregroundRingContainerLayer setTransform:&v36];
    }
  }
}

- (void)_endRotationAnimation
{
  v36[3] = *MEMORY[0x263EF8340];
  if (self->_foregroundRingContainerLayer && self->_rotationAnimationKey)
  {
    id v3 = [MEMORY[0x263F157D8] animationWithKeyPath:@"transform"];
    [v3 setAdditive:1];
    [v3 setBeginTimeMode:*MEMORY[0x263F15980]];
    [v3 setDuration:0.55];
    [v3 setFillMode:*MEMORY[0x263F15AA8]];
    uint64_t v4 = (void *)MEMORY[0x263F08D40];
    CATransform3DMakeRotation(&v34, -3.14159265, 0.0, 0.0, -1.0);
    NSUInteger v5 = [v4 valueWithCATransform3D:&v34];
    v36[0] = v5;
    NSUInteger v6 = (void *)MEMORY[0x263F08D40];
    CATransform3DMakeRotation(&v33, -1.57079633, 0.0, 0.0, -1.0);
    id v7 = [v6 valueWithCATransform3D:&v33];
    v36[1] = v7;
    id v8 = (void *)MEMORY[0x263F08D40];
    CATransform3DMakeRotation(&v32, 0.0, 0.0, 0.0, -1.0);
    double v9 = [v8 valueWithCATransform3D:&v32];
    v36[2] = v9;
    double v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v36 count:3];
    [v3 setValues:v10];

    [v3 setKeyTimes:&unk_26D086C68];
    uint64_t v11 = [MEMORY[0x263F15808] functionWithName:*MEMORY[0x263F15EC8]];
    v35[0] = v11;
    uint64_t v12 = [MEMORY[0x263F15808] functionWithName:*MEMORY[0x263F15EC0]];
    v35[1] = v12;
    uint64_t v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:v35 count:2];
    [v3 setTimingFunctions:v13];

    uint64_t v14 = self->_rotationAnimationKey;
    rotationAnimationKeCGFloat y = self->_rotationAnimationKey;
    self->_rotationAnimationKeCGFloat y = 0;

    [(CALayer *)self->_foregroundRingContainerLayer pkui_elapsedDurationForAnimationWithKey:v14];
    double v17 = v16;
    if (v16 <= 0.0)
    {
      [(CALayer *)self->_foregroundRingContainerLayer removeAnimationForKey:v14];

      uint64_t v14 = 0;
      double v18 = fabs(v17);
    }
    else
    {
      double v18 = 1.0 - fmod(v16, 1.0);
    }
    [v3 setBeginTime:v18 + CACurrentMediaTime()];
    [v3 setBeginTimeMode:*MEMORY[0x263F15950]];
    if (v14)
    {
      objc_initWeak((id *)&v34, self);
      uint64_t v26 = MEMORY[0x263EF8330];
      uint64_t v27 = 3221225472;
      CATransform3D v28 = __47__PKFingerprintGlyphView__endRotationAnimation__block_invoke;
      double v29 = &unk_2644F9040;
      objc_copyWeak(&v31, (id *)&v34);
      id v30 = v14;
      objc_msgSend(v3, "pkui_setDidStartHandler:", &v26);

      objc_destroyWeak(&v31);
      objc_destroyWeak((id *)&v34);
    }
    p_foregroundRingContainerLayer = &self->_foregroundRingContainerLayer;
    id v20 = (id)-[CALayer pkui_addAdditiveAnimation:](*p_foregroundRingContainerLayer, "pkui_addAdditiveAnimation:", v3, v26, v27, v28, v29);
    double v21 = *p_foregroundRingContainerLayer;
    long long v22 = *(_OWORD *)(MEMORY[0x263F15740] + 80);
    *(_OWORD *)&v34.m31 = *(_OWORD *)(MEMORY[0x263F15740] + 64);
    *(_OWORD *)&v34.m33 = v22;
    long long v23 = *(_OWORD *)(MEMORY[0x263F15740] + 112);
    *(_OWORD *)&v34.m41 = *(_OWORD *)(MEMORY[0x263F15740] + 96);
    *(_OWORD *)&v34.m43 = v23;
    long long v24 = *(_OWORD *)(MEMORY[0x263F15740] + 16);
    *(_OWORD *)&v34.m11 = *MEMORY[0x263F15740];
    *(_OWORD *)&v34.m13 = v24;
    long long v25 = *(_OWORD *)(MEMORY[0x263F15740] + 48);
    *(_OWORD *)&v34.m21 = *(_OWORD *)(MEMORY[0x263F15740] + 32);
    *(_OWORD *)&v34.m23 = v25;
    [(CALayer *)v21 setTransform:&v34];
  }
}

void __47__PKFingerprintGlyphView__endRotationAnimation__block_invoke(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    [WeakRetained[53] removeAnimationForKey:*(void *)(a1 + 32)];
    id WeakRetained = v3;
  }
}

- (void)setContentLayerOpacity:(double)a3 withDuration:(double)a4
{
  [(CALayer *)self->_contentLayer opacity];
  double v8 = *(float *)&v7;
  if (*(float *)&v7 != a3)
  {
    if (a4 > 0.0)
    {
      double v9 = [MEMORY[0x263F5C280] springAnimationWithKeyPath:@"opacity"];
      objc_msgSend(v9, "pkui_updateForAdditiveAnimationFromScalar:toScalar:", v8, a3);
      id v10 = (id)[(CALayer *)self->_contentLayer pkui_addAdditiveAnimation:v9];
    }
    contentLayer = self->_contentLayer;
    *(float *)&double v7 = a3;
    [(CALayer *)contentLayer setOpacity:v7];
  }
}

- (void)setProgress:(double)a3 withDuration:(double)a4
{
  [(PKFingerprintGlyphView *)self _updateLastAnimationTimeWithAnimationOfDuration:a4];
  NSUInteger v7 = [(NSArray *)self->_backgroundShapeLayers count];
  if (v7)
  {
    NSUInteger v8 = v7;
    uint64_t v9 = 0;
    double v10 = fmax(fmin(a3, 1.0), 0.0);
    do
      [(PKFingerprintGlyphView *)self _setProgress:v9++ withDuration:v10 forShapeLayerAtIndex:a4];
    while (v8 != v9);
  }
}

- (void)_setProgress:(double)a3 withDuration:(double)a4 forShapeLayerAtIndex:(unint64_t)a5
{
  NSUInteger v8 = (void *)MEMORY[0x223C3D8D0]();
  uint64_t v9 = [(NSArray *)self->_backgroundShapeLayers objectAtIndexedSubscript:a5];
  double v10 = [(PKFingerprintGlyphView *)self pathStateForLayer:v9];
  [v10 setProgress:v9 onShapeLayer:v8 withAnimationHandler:1.0 - a3];

  uint64_t v11 = [(NSArray *)self->_foregroundShapeLayers objectAtIndexedSubscript:a5];

  uint64_t v12 = [(PKFingerprintGlyphView *)self pathStateForLayer:v11];
  [v12 setProgress:v11 onShapeLayer:v8 withAnimationHandler:a3];
}

void __73__PKFingerprintGlyphView__setProgress_withDuration_forShapeLayerAtIndex___block_invoke(uint64_t a1, void *a2, uint64_t a3, double a4, double a5)
{
  id v12 = a2;
  uint64_t v9 = [MEMORY[0x263F15760] animationWithKeyPath:a3];
  [v9 setAdditive:1];
  [v9 setDuration:*(double *)(a1 + 32)];
  double v10 = PKMagicCurve();
  [v9 setTimingFunction:v10];

  objc_msgSend(v9, "pkui_updateForAdditiveAnimationFromScalar:toScalar:", a4, a5);
  id v11 = (id)objc_msgSend(v12, "pkui_addAdditiveAnimation:", v9);
}

- (void)setPrimaryColor:(id)a3
{
}

- (void)setPrimaryColor:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  NSUInteger v6 = (UIColor *)a3;
  primaryColor = self->_primaryColor;
  id v11 = v6;
  if (!v6 || !primaryColor)
  {
LABEL_5:
    if (primaryColor == v6) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  int v8 = [(UIColor *)primaryColor isEqual:v6];
  NSUInteger v6 = v11;
  if (v8)
  {
    primaryColor = self->_primaryColor;
    goto LABEL_5;
  }
LABEL_6:
  uint64_t v9 = (UIColor *)[(UIColor *)v6 copy];
  double v10 = self->_primaryColor;
  self->_primaryColor = v9;

  primaryColor = (UIColor *)[(PKFingerprintGlyphView *)self _applyPrimaryColorAnimated:v4];
  NSUInteger v6 = v11;
LABEL_7:

  MEMORY[0x270F9A758](primaryColor, v6);
}

- (void)_applyPrimaryColorAnimated:(BOOL)a3
{
}

- (void)setSecondaryColor:(id)a3
{
}

- (void)setSecondaryColor:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  NSUInteger v6 = (UIColor *)a3;
  secondaryColor = self->_secondaryColor;
  id v11 = v6;
  if (!v6 || !secondaryColor)
  {
LABEL_5:
    if (secondaryColor == v6) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  int v8 = [(UIColor *)secondaryColor isEqual:v6];
  NSUInteger v6 = v11;
  if (v8)
  {
    secondaryColor = self->_secondaryColor;
    goto LABEL_5;
  }
LABEL_6:
  uint64_t v9 = (UIColor *)[(UIColor *)v6 copy];
  double v10 = self->_secondaryColor;
  self->_secondaryColor = v9;

  secondaryColor = (UIColor *)[(PKFingerprintGlyphView *)self _applySecondaryColorAnimated:v4];
  NSUInteger v6 = v11;
LABEL_7:

  MEMORY[0x270F9A758](secondaryColor, v6);
}

- (void)_applySecondaryColorAnimated:(BOOL)a3
{
}

- (void)_applyColor:(id)a3 toShapeLayers:(id)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v23 = a3;
  id v22 = a4;
  if (v22)
  {
    uint64_t v33 = 0;
    CATransform3D v34 = &v33;
    uint64_t v35 = 0x2020000000;
    uint64_t v36 = 0;
    v28[0] = MEMORY[0x263EF8330];
    v28[1] = 3221225472;
    double v29 = __61__PKFingerprintGlyphView__applyColor_toShapeLayers_animated___block_invoke;
    id v30 = &unk_2644F9610;
    CATransform3D v32 = &v33;
    id v31 = v23;
    int v8 = (void *)MEMORY[0x263F1CB00];
    uint64_t v9 = v28;
    double v10 = self;
    id v11 = [v8 currentTraitCollection];
    id v12 = (void *)MEMORY[0x263F1CB00];
    uint64_t v13 = [(PKFingerprintGlyphView *)v10 traitCollection];

    [v12 setCurrentTraitCollection:v13];
    v29((uint64_t)v9);

    [MEMORY[0x263F1CB00] setCurrentTraitCollection:v11];
    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    id v14 = v22;
    uint64_t v15 = [v14 countByEnumeratingWithState:&v24 objects:v37 count:16];
    if (v15)
    {
      uint64_t v16 = *(void *)v25;
      do
      {
        uint64_t v17 = 0;
        do
        {
          if (*(void *)v25 != v16) {
            objc_enumerationMutation(v14);
          }
          double v18 = *(void **)(*((void *)&v24 + 1) + 8 * v17);
          if (v5)
          {
            [*(id *)(*((void *)&v24 + 1) + 8 * v17) removeAnimationForKey:@"color"];
            double v19 = [v18 presentationLayer];
            uint64_t v20 = [v19 strokeColor];

            double v21 = [MEMORY[0x263F5C280] springAnimationWithKeyPath:@"strokeColor"];
            [v21 setAdditive:0];
            [v21 setFromValue:v20];
            [v21 setToValue:v34[3]];
            [v18 addAnimation:v21 forKey:@"color"];
          }
          objc_msgSend(v18, "setStrokeColor:", v34[3], v22);
          ++v17;
        }
        while (v15 != v17);
        uint64_t v15 = [v14 countByEnumeratingWithState:&v24 objects:v37 count:16];
      }
      while (v15);
    }

    CGColorRelease((CGColorRef)v34[3]);
    _Block_object_dispose(&v33, 8);
  }
}

CGColorRef __61__PKFingerprintGlyphView__applyColor_toShapeLayers_animated___block_invoke(uint64_t a1)
{
  CGColorRef result = CGColorRetain((CGColorRef)[*(id *)(a1 + 32) CGColor]);
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (void)setPathState:(id)a3 forLayer:(id)a4
{
  if (a4) {
    objc_setAssociatedObject(a4, &PathStateKey, a3, (void *)0x301);
  }
}

- (id)pathStateForLayer:(id)a3
{
  if (a3)
  {
    BOOL v4 = objc_getAssociatedObject(a3, &PathStateKey);
  }
  else
  {
    BOOL v4 = 0;
  }
  return v4;
}

- (UIColor)primaryColor
{
  return self->_primaryColor;
}

- (UIColor)secondaryColor
{
  return self->_secondaryColor;
}

- (BOOL)fadeOnRecognized
{
  return self->_fadeOnRecognized;
}

- (void)setFadeOnRecognized:(BOOL)a3
{
  self->_BOOL fadeOnRecognized = a3;
}

- (int64_t)state
{
  return self->_state;
}

- (CALayer)contentLayer
{
  return self->_contentLayer;
}

- (PKFingerprintGlyphViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (PKFingerprintGlyphViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_contentLayer, 0);
  objc_storeStrong((id *)&self->_secondaryColor, 0);
  objc_storeStrong((id *)&self->_primaryColor, 0);
  objc_storeStrong((id *)&self->_rotationAnimationKey, 0);
  objc_storeStrong((id *)&self->_transitionCompletionHandlers, 0);
  objc_storeStrong((id *)&self->_maskForegroundLayer, 0);
  objc_storeStrong((id *)&self->_maskLayer, 0);
  objc_storeStrong((id *)&self->_foregroundRingShapeLayers, 0);
  objc_storeStrong((id *)&self->_foregroundShapeLayers, 0);
  objc_storeStrong((id *)&self->_backgroundShapeLayers, 0);
  objc_storeStrong((id *)&self->_foregroundRingContainerLayer, 0);
  objc_storeStrong((id *)&self->_foregroundLayer, 0);

  objc_storeStrong((id *)&self->_backgroundLayer, 0);
}

@end