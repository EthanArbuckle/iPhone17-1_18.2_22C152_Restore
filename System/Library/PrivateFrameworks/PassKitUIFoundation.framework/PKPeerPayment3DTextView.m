@interface PKPeerPayment3DTextView
+ (id)supportedCharacterSet;
- (BOOL)setText:(id)a3;
- (NSString)text;
- (PKPeerPayment3DTextView)initWithFrame:(CGRect)a3;
- (PKPeerPayment3DTextView)initWithFrame:(CGRect)a3 renderStyle:(unint64_t)a4 usedForSnapshotting:(BOOL)a5;
- (float32x2_t)_fakeAnimationRollPitchWithElapsedTime:(uint64_t)a1;
- (id)generatedSnapshot;
- (unint64_t)renderStyle;
- (void)dealloc;
- (void)didBecomeActive;
- (void)didMoveToWindow;
- (void)layoutSubviews;
- (void)layoutText;
- (void)loadCharactersAndLayout;
- (void)performPostRender:(id)a3;
- (void)renderer:(id)a3 didRenderScene:(id)a4 atTime:(double)a5;
- (void)renderer:(id)a3 updateAtTime:(double)a4;
- (void)setMotionEffectEnabled:(BOOL)a3 animated:(BOOL)a4;
- (void)updateSceneUnits;
- (void)willResignActive;
@end

@implementation PKPeerPayment3DTextView

+ (id)supportedCharacterSet
{
  return (id)[MEMORY[0x263F08708] characterSetWithCharactersInString:@"$.,0123456789 "];
}

- (PKPeerPayment3DTextView)initWithFrame:(CGRect)a3
{
  return -[PKPeerPayment3DTextView initWithFrame:renderStyle:usedForSnapshotting:](self, "initWithFrame:renderStyle:usedForSnapshotting:", 0, 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (PKPeerPayment3DTextView)initWithFrame:(CGRect)a3 renderStyle:(unint64_t)a4 usedForSnapshotting:(BOOL)a5
{
  v31[1] = *MEMORY[0x263EF8340];
  v29.receiver = self;
  v29.super_class = (Class)PKPeerPayment3DTextView;
  v7 = -[PKPeerPayment3DTextView initWithFrame:](&v29, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v8 = v7;
  if (v7)
  {
    v7->_dynamicRollPitchMix = 0.0;
    v7->_usedForSnapshotting = a5;
    uint64_t v30 = *MEMORY[0x263F16BC0];
    v31[0] = &unk_26D086878;
    v9 = [NSDictionary dictionaryWithObjects:v31 forKeys:&v30 count:1];
    id v10 = objc_alloc(MEMORY[0x263F16B10]);
    [(PKPeerPayment3DTextView *)v8 bounds];
    uint64_t v11 = objc_msgSend(v10, "initWithFrame:options:", v9);
    sceneView = v8->_sceneView;
    v8->_sceneView = (SCNView *)v11;

    [(SCNView *)v8->_sceneView setAntialiasingMode:2];
    v13 = v8->_sceneView;
    v14 = [MEMORY[0x263F1C550] clearColor];
    [(SCNView *)v13 setBackgroundColor:v14];

    [(SCNView *)v8->_sceneView setDelegate:v8];
    v8->_renderStyle = a4;
    uint64_t v15 = +[PKPeerPayment3DStore sharedInstance];
    _3DStore = v8->_3DStore;
    v8->_3DStore = (PKPeerPayment3DStore *)v15;

    [(SCNView *)v8->_sceneView setOpaque:0];
    v17 = [MEMORY[0x263F08A00] defaultCenter];
    [v17 addObserver:v8 selector:sel_willResignActive name:*MEMORY[0x263F1D0D8] object:0];

    v18 = [MEMORY[0x263F08A00] defaultCenter];
    [v18 addObserver:v8 selector:sel_didBecomeActive name:*MEMORY[0x263F1D038] object:0];

    v19 = [MEMORY[0x263F08A00] defaultCenter];
    [v19 addObserver:v8 selector:sel_willResignActive name:*MEMORY[0x263F07FD8] object:0];

    v20 = [MEMORY[0x263F08A00] defaultCenter];
    [v20 addObserver:v8 selector:sel_didBecomeActive name:*MEMORY[0x263F07FC0] object:0];

    v21 = v8->_3DStore;
    uint64_t v24 = MEMORY[0x263EF8330];
    uint64_t v25 = 3221225472;
    v26 = __73__PKPeerPayment3DTextView_initWithFrame_renderStyle_usedForSnapshotting___block_invoke;
    v27 = &unk_2644F8CA8;
    v22 = v8;
    v28 = v22;
    [(PKPeerPayment3DStore *)v21 newSceneWithCompletion:&v24 synchronously:v8->_usedForSnapshotting];
    -[PKPeerPayment3DTextView addSubview:](v22, "addSubview:", v8->_sceneView, v24, v25, v26, v27);
  }
  return v8;
}

void __73__PKPeerPayment3DTextView_initWithFrame_renderStyle_usedForSnapshotting___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __73__PKPeerPayment3DTextView_initWithFrame_renderStyle_usedForSnapshotting___block_invoke_2;
  v9[3] = &unk_2644F8C58;
  id v10 = *(id *)(a1 + 32);
  id v4 = v3;
  id v11 = v4;
  v5 = (void (**)(void))MEMORY[0x223C3D8D0](v9);
  v6 = v5;
  if (*(unsigned char *)(*(void *)(a1 + 32) + 483))
  {
    v5[2](v5);
  }
  else
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __73__PKPeerPayment3DTextView_initWithFrame_renderStyle_usedForSnapshotting___block_invoke_3;
    block[3] = &unk_2644F8C80;
    v8 = v5;
    dispatch_async(MEMORY[0x263EF83A0], block);
  }
}

uint64_t __73__PKPeerPayment3DTextView_initWithFrame_renderStyle_usedForSnapshotting___block_invoke_2(uint64_t a1)
{
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 416), *(id *)(a1 + 40));
  [*(id *)(*(void *)(a1 + 32) + 408) setScene:*(void *)(*(void *)(a1 + 32) + 416)];
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 408), "setDelegate:");
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v2 + 480))
  {
    [*(id *)(v2 + 408) setPlaying:1];
    uint64_t v2 = *(void *)(a1 + 32);
  }

  return [(id)v2 updateSceneUnits];
}

uint64_t __73__PKPeerPayment3DTextView_initWithFrame_renderStyle_usedForSnapshotting___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)dealloc
{
  if (self->_scene) {
    -[PKPeerPayment3DStore relinquishScene:](self->_3DStore, "relinquishScene:");
  }
  v3.receiver = self;
  v3.super_class = (Class)PKPeerPayment3DTextView;
  [(PKPeerPayment3DTextView *)&v3 dealloc];
}

- (void)updateSceneUnits
{
  double sceneWidthUnits = self->_sceneWidthUnits;
  [(SCNView *)self->_sceneView bounds];
  double v5 = v4;
  [(SCNView *)self->_sceneView bounds];
  double v7 = 8.0;
  if (v6 <= v5) {
    double v7 = v5 * 8.0 / v6;
  }
  self->_double sceneWidthUnits = v7;
  self->_sceneHeightUnits = v6 * v7 / v5;
  if (sceneWidthUnits != self->_sceneWidthUnits)
  {
    [(PKPeerPayment3DTextView *)self layoutText];
  }
}

- (void)layoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)PKPeerPayment3DTextView;
  [(PKPeerPayment3DTextView *)&v4 layoutSubviews];
  sceneView = self->_sceneView;
  [(PKPeerPayment3DTextView *)self bounds];
  -[SCNView setFrame:](sceneView, "setFrame:");
  [(PKPeerPayment3DTextView *)self updateSceneUnits];
}

- (BOOL)setText:(id)a3
{
  id v4 = a3;
  double v5 = [(id)objc_opt_class() supportedCharacterSet];
  double v6 = [v5 invertedSet];
  uint64_t v7 = [v4 rangeOfCharacterFromSet:v6];

  if (v7 == 0x7FFFFFFFFFFFFFFFLL)
  {
    text = self->_text;
    if (!text || ![(NSString *)text isEqualToString:v4])
    {
      v9 = (NSString *)[v4 copy];
      id v10 = self->_text;
      self->_text = v9;

      [(PKPeerPayment3DTextView *)self setIsAccessibilityElement:1];
      [(PKPeerPayment3DTextView *)self setAccessibilityLabel:self->_text];
      [(PKPeerPayment3DTextView *)self loadCharactersAndLayout];
    }
  }

  return v7 == 0x7FFFFFFFFFFFFFFFLL;
}

- (void)loadCharactersAndLayout
{
  [(NSMutableArray *)self->_charactersToDraw removeAllObjects];
  _3DStore = self->_3DStore;
  text = self->_text;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __50__PKPeerPayment3DTextView_loadCharactersAndLayout__block_invoke;
  v5[3] = &unk_2644F8CD0;
  v5[4] = self;
  [(PKPeerPayment3DStore *)_3DStore charactersForText:text completion:v5 synchronously:self->_usedForSnapshotting];
}

void __50__PKPeerPayment3DTextView_loadCharactersAndLayout__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __50__PKPeerPayment3DTextView_loadCharactersAndLayout__block_invoke_2;
  v9[3] = &unk_2644F8C58;
  void v9[4] = *(void *)(a1 + 32);
  id v4 = v3;
  id v10 = v4;
  double v5 = (void (**)(void))MEMORY[0x223C3D8D0](v9);
  double v6 = v5;
  if (*(unsigned char *)(*(void *)(a1 + 32) + 483))
  {
    v5[2](v5);
  }
  else
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __50__PKPeerPayment3DTextView_loadCharactersAndLayout__block_invoke_3;
    block[3] = &unk_2644F8C80;
    v8 = v5;
    dispatch_async(MEMORY[0x263EF83A0], block);
  }
}

uint64_t __50__PKPeerPayment3DTextView_loadCharactersAndLayout__block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) layoutText];
  [*(id *)(*(void *)(a1 + 32) + 416) resetScene];
  *(void *)(*(void *)(a1 + 32) + 512) = [*(id *)(a1 + 40) mutableCopy];

  return MEMORY[0x270F9A758]();
}

uint64_t __50__PKPeerPayment3DTextView_loadCharactersAndLayout__block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)layoutText
{
  self->_layoutRequested = 1;
}

- (void)renderer:(id)a3 updateAtTime:(double)a4
{
  uint64_t v93 = *MEMORY[0x263EF8340];
  scene = self->_scene;
  if (scene)
  {
    double v6 = [(PKPeerPayment3DScene *)scene textContainerNode];
    uint64_t v7 = objc_msgSend(MEMORY[0x263F1C658], "pk_peerPaymentChiseledCashFontOfSize:", 8.92);
    if ([(NSMutableArray *)self->_charactersToDraw count]) {
      BOOL v8 = v7 == 0;
    }
    else {
      BOOL v8 = 1;
    }
    if (v8)
    {
      int v9 = 0;
    }
    else
    {
      v80 = v6;
      v79 = v7;
      id v10 = v7;
      long long v87 = 0u;
      long long v88 = 0u;
      long long v89 = 0u;
      long long v90 = 0u;
      id v11 = (void *)[(NSMutableArray *)self->_charactersToDraw copy];
      uint64_t v12 = [v11 countByEnumeratingWithState:&v87 objects:v92 count:16];
      if (v12)
      {
        uint64_t v13 = v12;
        uint64_t v14 = *(void *)v88;
        double v15 = 0.0;
        do
        {
          for (uint64_t i = 0; i != v13; ++i)
          {
            if (*(void *)v88 != v14) {
              objc_enumerationMutation(v11);
            }
            v17 = *(void **)(*((void *)&v87 + 1) + 8 * i);
            v18 = [v17 character];
            char v19 = [v18 isEqualToString:@" "];

            if ((v19 & 1) == 0)
            {
              UniChar characters = 0;
              v20 = [v17 character];
              UniChar v21 = [v20 characterAtIndex:0];

              UniChar characters = v21;
              CGGlyph glyphs = 0;
              CTFontGetGlyphsForCharacters(v10, &characters, &glyphs, 1);
              CGRect BoundingRectsForGlyphs = CTFontGetBoundingRectsForGlyphs(v10, kCTFontOrientationDefault, &glyphs, 0, 1);
              CGFloat x = BoundingRectsForGlyphs.origin.x;
              CGFloat y = BoundingRectsForGlyphs.origin.y;
              CGFloat width = BoundingRectsForGlyphs.size.width;
              CGFloat height = BoundingRectsForGlyphs.size.height;
              DWORD2(v82[0]) = 0;
              *(void *)&v82[0] = 0;
              int v84 = 0;
              uint64_t v83 = 0;
              v26 = [v17 node];
              [v80 addChildNode:v26];
              v27 = [v26 geometry];
              v28 = [(PKPeerPayment3DScene *)self->_scene textMaterial];
              v91 = v28;
              objc_super v29 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v91 count:1];
              [v27 setMaterials:v29];

              [v26 getBoundingBoxMin:v82 max:&v83];
              double v30 = (float)(*(float *)&v83 + *(float *)v82) * -0.5;
              v95.origin.CGFloat x = x;
              v95.origin.CGFloat y = y;
              v95.size.CGFloat width = width;
              v95.size.CGFloat height = height;
              double v31 = v15 + CGRectGetMidX(v95) + v30;
              *(float *)&double v31 = v31;
              objc_msgSend(v26, "setPosition:", v31, 0.0, 0.0);
              double v15 = v15 + CTFontGetAdvancesForGlyphs(v10, kCTFontOrientationDefault, &glyphs, 0, 1);
            }
          }
          uint64_t v13 = [v11 countByEnumeratingWithState:&v87 objects:v92 count:16];
        }
        while (v13);
      }

      CFRelease(v10);
      [(NSMutableArray *)self->_charactersToDraw removeAllObjects];
      if (self->_framesFullyRendered)
      {
        int v9 = 0;
        double v6 = v80;
        uint64_t v7 = v79;
      }
      else
      {
        double v6 = v80;
        uint64_t v7 = v79;
        if (!self->_snapshotRequested && !self->_usedForSnapshotting) {
          goto LABEL_31;
        }
        int v9 = 1;
      }
    }
    if (self->_layoutRequested)
    {
      v32 = [v6 childNodes];
      uint64_t v33 = [v32 count];

      if (v33)
      {
        [(SCNView *)self->_sceneView bounds];
        double v35 = v34;
        double v37 = v36;
        DWORD2(v82[0]) = 0;
        *(void *)&v82[0] = 0;
        int v84 = 0;
        uint64_t v83 = 0;
        [v6 getBoundingBoxMin:v82 max:&v83];
        double v38 = (float)(*(float *)&v83 - *(float *)v82);
        double v39 = *((float *)&v83 + 1) + -6.87682009;
        double sceneHeightUnits = self->_sceneHeightUnits;
        double v41 = 49.0 / v37 * sceneHeightUnits;
        double v42 = 0.0 / v37 * sceneHeightUnits;
        double v43 = (v35 + -28.0) / v35 * self->_sceneWidthUnits / v38;
        double v44 = v41 / v39;
        if (v43 >= v44) {
          double v43 = v44;
        }
        double v45 = -(*(float *)v82 + v38 * 0.5) * v43;
        *(float *)&double v45 = v45;
        double v46 = v42 + -(*((float *)&v83 + 1) - v39 * 0.5) * v43;
        *(float *)&double v46 = v46;
        float v47 = v43;
        objc_msgSend(v6, "setPosition:", v45, v46, 0.0);
        *(float *)&double v48 = v47;
        *(float *)&double v49 = v47;
        *(float *)&double v50 = v47;
        objc_msgSend(v6, "setScale:", v48, v49, v50);
        self->_layoutRequested = 0;
        if (!self->_framesFullyRendered)
        {
LABEL_31:
          if (!self->_snapshotRequested && !self->_usedForSnapshotting) {
            goto LABEL_54;
          }
        }
      }
      else if (v9)
      {
        goto LABEL_31;
      }
    }
    else if (v9)
    {
      goto LABEL_31;
    }
    if (self->_scene)
    {
      v51 = [v6 childNodes];
      uint64_t v52 = [v51 count];

      if (v52)
      {
        if (!self->_liveMotionEnabled && self->_animationDuration == 0.0
          || self->_snapshotRequested
          || self->_usedForSnapshotting
          || self->_liveMotionEnabled && self->_willAnimate)
        {
          v56 = v7;
          +[PKPeerPayment3DScene staticRollPitch];
          float32x2_t v55 = v68;
          +[PKPeerPayment3DScene rotationMatrixForRollPitch:](PKPeerPayment3DScene, "rotationMatrixForRollPitch:");
          int v67 = 0;
          v82[0] = v62;
          int v66 = 1;
        }
        else
        {
          double animationDuration = self->_animationDuration;
          +[PKPeerPayment3DScene staticRollPitch];
          float32x2_t v55 = v54;
          v56 = v7;
          if (animationDuration > 0.0)
          {
            double v57 = fmin(fmax(self->_dynamicRollPitchMix, 0.0), 1.0);
            double v58 = v57 * v57 * (v57 * -2.0 + 3.0);
            [(PKPeerPayment3DScene *)self->_scene currentRollPitch];
            float v59 = v58;
            double v61 = COERCE_DOUBLE(vmla_n_f32(v55, vsub_f32(v60, v55), v59));
            +[PKPeerPayment3DScene rotationMatrixForRollPitch:v61];
            int v66 = 0;
            v82[0] = v62;
            int v67 = 1;
            goto LABEL_45;
          }
          [(PKPeerPayment3DScene *)self->_scene currentRotationMatrix];
          int v66 = 0;
          int v67 = 0;
          v82[0] = v62;
        }
        double v61 = 0.0;
LABEL_45:
        v82[1] = v63;
        v82[2] = v64;
        v82[3] = v65;
        float32x4_t v81 = vaddq_f32(v65, vmlaq_f32(vmlaq_f32(vmulq_f32(v62, (float32x4_t)0), (float32x4_t)0, v63), (float32x4_t)vdupq_n_s32(0x428C0000u), v64));
        v69 = [(PKPeerPayment3DScene *)self->_scene lightNode];
        *(float32x2_t *)&double v70 = vneg_f32(*(float32x2_t *)v81.f32);
        LODWORD(v71) = v81.i32[2];
        objc_msgSend(v69, "setPosition:", v70, COERCE_DOUBLE(__PAIR64__(v81.u32[1], HIDWORD(v70))), v71);

        v72 = [MEMORY[0x263EFF8F8] dataWithBytes:v82 length:64];
        v73 = [(PKPeerPayment3DScene *)self->_scene textMaterial];
        [v73 setValue:v72 forKey:@"rotationMatrix"];
        if (v66)
        {
          v74 = self;
          double v75 = *(double *)&v55;
        }
        else
        {
          if (!v67)
          {
            v74 = self;
            [(PKPeerPayment3DScene *)self->_scene currentSkew];
            goto LABEL_51;
          }
          v74 = self;
          double v75 = v61;
        }
        +[PKPeerPayment3DScene skewForRollPitch:v75];
LABEL_51:
        uint64_t v83 = v76;
        v77 = [MEMORY[0x263EFF8F8] dataWithBytes:&v83 length:8];
        [v73 setValue:v77 forKey:@"skew"];
        unint64_t framesFullyRendered = v74->_framesFullyRendered;
        if (framesFullyRendered <= 2) {
          v74->_unint64_t framesFullyRendered = framesFullyRendered + 1;
        }

        uint64_t v7 = v56;
      }
    }
LABEL_54:
  }
}

- (id)generatedSnapshot
{
  self->_snapshotRequested = 1;
  id result = [(SCNView *)self->_sceneView snapshot];
  self->_snapshotRequested = 0;
  return result;
}

- (void)setMotionEffectEnabled:(BOOL)a3 animated:(BOOL)a4
{
  if (self->_liveMotionEnabled != a3)
  {
    self->_liveMotionEnabled = a3;
    if (a4)
    {
      self->_willAnimate = 1;
      v4[0] = MEMORY[0x263EF8330];
      v4[1] = 3221225472;
      v4[2] = __59__PKPeerPayment3DTextView_setMotionEffectEnabled_animated___block_invoke;
      v4[3] = &unk_2644F8CF8;
      v4[4] = self;
      [(PKPeerPayment3DTextView *)self performPostRender:v4];
    }
  }
}

double __59__PKPeerPayment3DTextView_setMotionEffectEnabled_animated___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  double result = *(double *)(v1 + 472);
  *(double *)(v1 + 456) = result;
  *(void *)(*(void *)(a1 + 32) + 464) = 0x3FE0000000000000;
  *(unsigned char *)(*(void *)(a1 + 32) + 481) = 0;
  return result;
}

- (void)willResignActive
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __43__PKPeerPayment3DTextView_willResignActive__block_invoke;
  block[3] = &unk_2644F8CF8;
  void block[4] = self;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t __43__PKPeerPayment3DTextView_willResignActive__block_invoke(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 32);
  if (*(void *)(v1 + 416))
  {
    uint64_t v2 = result;
    [*(id *)(v1 + 408) setPlaying:0];
    uint64_t v3 = *(void *)(v2 + 32);
    id v4 = *(void **)(v3 + 496);
    uint64_t v5 = *(void *)(v3 + 416);
    return [v4 sceneDidBecomeInactive:v5];
  }
  return result;
}

- (void)didBecomeActive
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __42__PKPeerPayment3DTextView_didBecomeActive__block_invoke;
  block[3] = &unk_2644F8CF8;
  void block[4] = self;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t __42__PKPeerPayment3DTextView_didBecomeActive__block_invoke(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 32);
  if (*(void *)(v1 + 416) && *(unsigned char *)(v1 + 480))
  {
    uint64_t v2 = result;
    [*(id *)(v1 + 408) setPlaying:1];
    uint64_t v3 = *(void *)(v2 + 32);
    id v4 = *(void **)(v3 + 496);
    uint64_t v5 = *(void *)(v3 + 416);
    return [v4 sceneDidBecomeActive:v5];
  }
  return result;
}

- (void)didMoveToWindow
{
  v4.receiver = self;
  v4.super_class = (Class)PKPeerPayment3DTextView;
  [(PKPeerPayment3DTextView *)&v4 didMoveToWindow];
  uint64_t v3 = [(PKPeerPayment3DTextView *)self window];

  if (v3)
  {
    if (self->_scene)
    {
      if (self->_liveMotionEnabled)
      {
        [(SCNView *)self->_sceneView setPlaying:1];
        [(PKPeerPayment3DStore *)self->_3DStore sceneDidBecomeActive:self->_scene];
      }
    }
  }
  else
  {
    [(SCNView *)self->_sceneView setPlaying:0];
    if (self->_scene) {
      -[PKPeerPayment3DStore sceneDidBecomeInactive:](self->_3DStore, "sceneDidBecomeInactive:");
    }
  }
}

- (float32x2_t)_fakeAnimationRollPitchWithElapsedTime:(uint64_t)a1
{
  float32_t v2 = a2;
  float v3 = *(double *)(a1 + 464);
  v4.f32[0] = v2;
  float v20 = v2;
  v4.f32[1] = (float)(v2 - (float)(v3 + -1.0)) / (float)(v3 - (float)(v3 + -1.0));
  float32x2_t v5 = vmaxnm_f32(v4, 0);
  __asm { FMOV            V1.2S, #1.0 }
  float32x2_t v11 = vminnm_f32(v5, _D1);
  __asm { FMOV            V3.2S, #3.0 }
  float32x2_t v13 = vmul_f32(vmul_f32(v11, v11), vmla_f32(_D3, (float32x2_t)0xC0000000C0000000, v11));
  _D1.f32[0] = vsub_f32(v13, (float32x2_t)vdup_lane_s32((int32x2_t)v13, 1)).f32[0];
  v13.f32[0] = ((float)(v2 / v3) + (float)(v2 / v3)) * 3.14159265;
  _D1.f32[0] = _D1.f32[0] * 0.628318531;
  float v21 = _D1.f32[0];
  __float2 v14 = __sincosf_stret(v13.f32[0]);
  +[PKPeerPayment3DScene staticRollPitch];
  float v15 = fminf(fmaxf((float)(v20 - (float)(v3 + -0.5)) / (float)(v3 - (float)(v3 + -0.5)), 0.0), 1.0);
  float v16 = (float)(v15 * v15) * (float)((float)(v15 * -2.0) + 3.0);
  float32x2_t v17 = vmul_n_f32((float32x2_t)__PAIR64__(LODWORD(v14.__sinval), LODWORD(v14.__cosval)), v21);
  return vmla_n_f32(v17, vsub_f32(v18, v17), v16);
}

- (void)performPostRender:(id)a3
{
  id v4 = a3;
  float32x2_t v5 = v4;
  if (v4)
  {
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __45__PKPeerPayment3DTextView_performPostRender___block_invoke;
    v6[3] = &unk_2644F8D20;
    v6[4] = self;
    id v7 = v4;
    dispatch_async(MEMORY[0x263EF83A0], v6);
  }
}

void __45__PKPeerPayment3DTextView_performPostRender___block_invoke(uint64_t a1)
{
  float32_t v2 = *(void **)(*(void *)(a1 + 32) + 440);
  if (!v2)
  {
    uint64_t v3 = [MEMORY[0x263EFF980] array];
    uint64_t v4 = *(void *)(a1 + 32);
    float32x2_t v5 = *(void **)(v4 + 440);
    *(void *)(v4 + 440) = v3;

    float32_t v2 = *(void **)(*(void *)(a1 + 32) + 440);
  }
  id v6 = (id)MEMORY[0x223C3D8D0](*(void *)(a1 + 40));
  [v2 addObject:v6];
}

- (void)renderer:(id)a3 didRenderScene:(id)a4 atTime:(double)a5
{
  id v8 = a3;
  id v9 = a4;
  self->_lastRenderTime = a5;
  double animationDuration = self->_animationDuration;
  if (animationDuration > 0.0)
  {
    double v11 = (a5 - self->_startAnimationTime) / animationDuration;
    double v12 = fmax(1.0 - v11, 0.0);
    double v13 = fmin(v11, 1.0);
    if (!self->_liveMotionEnabled) {
      double v13 = v12;
    }
    self->_dynamicRollPitchMiCGFloat x = v13;
    if (v13 == 1.0 || v13 == 0.0) {
      self->_double animationDuration = 0.0;
    }
  }
  if (self->_performHandlers && self->_framesFullyRendered >= 3)
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __58__PKPeerPayment3DTextView_renderer_didRenderScene_atTime___block_invoke;
    block[3] = &unk_2644F8CF8;
    void block[4] = self;
    dispatch_async(MEMORY[0x263EF83A0], block);
  }
}

void __58__PKPeerPayment3DTextView_renderer_didRenderScene_atTime___block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v2 = *(id *)(*(void *)(a1 + 32) + 440);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v10;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(v2);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v9 + 1) + 8 * v6) + 16))(*(void *)(*((void *)&v9 + 1) + 8 * v6));
        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v4);
  }

  uint64_t v7 = *(void *)(a1 + 32);
  id v8 = *(void **)(v7 + 440);
  *(void *)(v7 + 440) = 0;
}

- (unint64_t)renderStyle
{
  return self->_renderStyle;
}

- (NSString)text
{
  return self->_text;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_text, 0);
  objc_storeStrong((id *)&self->_charactersToDraw, 0);
  objc_storeStrong((id *)&self->_3DStore, 0);
  objc_storeStrong((id *)&self->_performHandlers, 0);
  objc_storeStrong((id *)&self->_scene, 0);

  objc_storeStrong((id *)&self->_sceneView, 0);
}

@end