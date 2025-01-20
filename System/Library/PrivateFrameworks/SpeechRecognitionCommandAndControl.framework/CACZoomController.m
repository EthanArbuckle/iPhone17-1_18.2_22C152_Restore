@interface CACZoomController
+ (id)sharedController;
- (BOOL)_canShowWhileLocked;
- (CABackdropLayer)screenBackdropLayer;
- (CABackdropLayer)zoomedRegionBackdropLayer;
- (CACZWLensChromeView)lensChromeView;
- (CACZoomController)initWithContainingView:(id)a3;
- (CACZoomController)initWithZoomFactor:(double)a3;
- (CAReplicatorLayer)dockedReplicatorLayer;
- (CGRect)_effectiveRectForBounds:(CGRect)a3 position:(CGPoint)a4 scaleFactor:(double)a5;
- (CGRect)bestDockFromZoomRegion:(CGRect)a3;
- (CGRect)dockedLensFrame;
- (CGRect)zoomedRegionFrame;
- (CGSize)_prescaledSizeForFinalSize:(CGSize)a3 withScaleFactor:(double)a4;
- (UIView)containingView;
- (double)zoomFactor;
- (void)hide;
- (void)layerize:(id)a3 color:(id)a4;
- (void)loadView;
- (void)moveZoomRegion:(CGRect)a3;
- (void)printLayers;
- (void)setContainingView:(id)a3;
- (void)setDockedLensFrame:(CGRect)a3;
- (void)setDockedReplicatorLayer:(id)a3;
- (void)setLensChromeView:(id)a3;
- (void)setScreenBackdropLayer:(id)a3;
- (void)setZoomFactor:(double)a3;
- (void)setZoomedRegionBackdropLayer:(id)a3;
- (void)setZoomedRegionFrame:(CGRect)a3;
- (void)show;
@end

@implementation CACZoomController

+ (id)sharedController
{
  if (sharedController_onceToken != -1) {
    dispatch_once(&sharedController_onceToken, &__block_literal_global_24);
  }
  v2 = (void *)sharedController_sZoomController;
  return v2;
}

uint64_t __37__CACZoomController_sharedController__block_invoke()
{
  sharedController_sZoomController = [[CACZoomController alloc] initWithZoomFactor:1.0];
  return MEMORY[0x270F9A758]();
}

- (CACZoomController)initWithContainingView:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CACZoomController;
  v5 = [(CACZoomController *)&v8 init];
  v6 = v5;
  if (v5)
  {
    [(CACZoomController *)v5 setZoomFactor:1.0];
    [(CACZoomController *)v6 setContainingView:v4];
  }

  return v6;
}

- (CACZoomController)initWithZoomFactor:(double)a3
{
  v7.receiver = self;
  v7.super_class = (Class)CACZoomController;
  id v4 = [(CACZoomController *)&v7 init];
  v5 = v4;
  if (v4) {
    [(CACZoomController *)v4 setZoomFactor:a3];
  }
  return v5;
}

- (void)loadView
{
  v3 = [CACZoomMainView alloc];
  id v4 = [(CACZoomController *)self containingView];
  [v4 frame];
  v5 = -[CACZoomMainView initWithFrame:](v3, "initWithFrame:");
  [(CACZoomController *)self setView:v5];

  v6 = [(CACZoomController *)self containingView];
  [v6 size];
  double v8 = v7 * 0.5;
  v9 = [(CACZoomController *)self containingView];
  [v9 size];
  double v11 = v10 * 0.5;
  v12 = [(CACZoomController *)self view];
  objc_msgSend(v12, "setPosition:", v8, v11);

  v13 = [(CACZoomController *)self view];
  v14 = [v13 layer];
  [v14 setNeedsDisplayOnBoundsChange:1];

  id v15 = objc_alloc(MEMORY[0x263F82E00]);
  v16 = [(CACZoomController *)self view];
  [v16 bounds];
  v17 = objc_msgSend(v15, "initWithFrame:");

  id v18 = objc_alloc_init(MEMORY[0x263F15868]);
  [v18 setAllowsHitTesting:0];
  v19 = [(CACZoomController *)self view];
  [v19 frame];
  objc_msgSend(v18, "setFrame:");

  [v17 bounds];
  objc_msgSend(v18, "setBounds:");
  [v18 setInstanceCount:2];
  [(CACZoomController *)self setDockedReplicatorLayer:v18];
  id v20 = objc_alloc_init(MEMORY[0x263F15758]);
  [v20 setAllowsHitTesting:0];
  [v20 setEnabled:1];
  [v20 bounds];
  objc_msgSend(v20, "setBackdropRect:");
  [v20 setGroupName:@"Zoomed"];
  [v20 setMasksToBounds:1];
  double v21 = CACZWLensCornerRadius();
  [(CACZoomController *)self zoomFactor];
  [v20 setCornerRadius:v21 / v22];
  [(CACZoomController *)self setZoomedRegionBackdropLayer:v20];
  v23 = [(CACZoomController *)self dockedReplicatorLayer];
  [v23 addSublayer:v20];

  v24 = [v17 layer];
  [v24 addSublayer:v18];

  v25 = [(CACZoomController *)self view];
  [v25 addSubview:v17];

  v26 = [(CACZoomController *)self dockedReplicatorLayer];
  long long v27 = *(_OWORD *)(MEMORY[0x263F15740] + 80);
  v34[4] = *(_OWORD *)(MEMORY[0x263F15740] + 64);
  v34[5] = v27;
  long long v28 = *(_OWORD *)(MEMORY[0x263F15740] + 112);
  v34[6] = *(_OWORD *)(MEMORY[0x263F15740] + 96);
  v34[7] = v28;
  long long v29 = *(_OWORD *)(MEMORY[0x263F15740] + 16);
  v34[0] = *MEMORY[0x263F15740];
  v34[1] = v29;
  long long v30 = *(_OWORD *)(MEMORY[0x263F15740] + 48);
  v34[2] = *(_OWORD *)(MEMORY[0x263F15740] + 32);
  v34[3] = v30;
  [v26 setTransform:v34];

  v31 = [CACZWLensChromeView alloc];
  v32 = -[CACZWLensChromeView initWithFrame:](v31, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  [(CACZoomController *)self setLensChromeView:v32];
  [(CACZWLensChromeView *)v32 setTranslatesAutoresizingMaskIntoConstraints:0];
  v33 = [(CACZoomController *)self view];
  [v33 addSubview:v32];
}

- (void)show
{
  id v2 = [(CACZoomController *)self view];
  [v2 setAlpha:1.0];
}

- (void)hide
{
  id v2 = [(CACZoomController *)self view];
  [v2 setAlpha:0.0];
}

- (void)moveZoomRegion:(CGRect)a3
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __36__CACZoomController_moveZoomRegion___block_invoke;
  v3[3] = &unk_264D11698;
  v3[4] = self;
  CGRect v4 = a3;
  [MEMORY[0x263F82E00] animateWithDuration:v3 animations:0.5];
}

uint64_t __36__CACZoomController_moveZoomRegion___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setZoomedRegionFrame:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
  double v2 = *(double *)(a1 + 56);
  if (v2 != 0.0) {
    [*(id *)(a1 + 32) setZoomFactor:280.0 / v2];
  }
  double v3 = CACZWLensCornerRadius();
  [*(id *)(a1 + 32) zoomFactor];
  double v5 = v3 / v4;
  v6 = [*(id *)(a1 + 32) zoomedRegionBackdropLayer];
  [v6 setCornerRadius:v5];

  objc_msgSend(*(id *)(a1 + 32), "bestDockFromZoomRegion:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
  double v60 = v8;
  double v61 = v7;
  double v58 = v10;
  double v59 = v9;
  [*(id *)(a1 + 32) zoomedRegionFrame];
  double v12 = v11;
  double v14 = v13;
  CGFloat v16 = v15;
  CGFloat v57 = v17;
  [MEMORY[0x263F158F8] setDisableActions:1];
  [MEMORY[0x263F158F8] begin];
  [*(id *)(a1 + 32) zoomedRegionFrame];
  double v19 = v18;
  double v21 = v20;
  double v23 = v22;
  double v25 = v24;
  v26 = [*(id *)(a1 + 32) zoomedRegionBackdropLayer];
  objc_msgSend(v26, "setFrame:", v19, v21, v23, v25);

  long long v27 = [*(id *)(a1 + 32) zoomedRegionBackdropLayer];
  [v27 bounds];
  double v29 = v28;
  double v31 = v30;
  double v33 = v32;
  double v35 = v34;
  v36 = [*(id *)(a1 + 32) zoomedRegionBackdropLayer];
  objc_msgSend(v36, "setBackdropRect:", v29, v31, v33, v35);

  v37 = [*(id *)(a1 + 32) dockedReplicatorLayer];
  [v37 position];
  double v39 = v38 - v12;
  [*(id *)(a1 + 32) zoomFactor];
  double v56 = v39 * (v40 + -1.0);

  v41 = [*(id *)(a1 + 32) dockedReplicatorLayer];
  [v41 position];
  double v43 = v42 - v14;
  [*(id *)(a1 + 32) zoomFactor];
  double v55 = v43 * (v44 + -1.0);

  memset(&v68, 0, sizeof(v68));
  [*(id *)(a1 + 32) zoomFactor];
  CGFloat v46 = v45;
  [*(id *)(a1 + 32) zoomFactor];
  CATransform3DMakeScale(&v68, v46, v47, 1.0);
  memset(&v67, 0, sizeof(v67));
  v69.origin.x = v12;
  v69.origin.y = v14;
  v69.size.width = v16;
  v69.size.height = v57;
  double MinX = CGRectGetMinX(v69);
  v70.origin.x = v61;
  v70.origin.y = v60;
  v70.size.width = v59;
  v70.size.height = v58;
  CGFloat v49 = -(MinX - CGRectGetMinX(v70) - v56);
  v71.origin.x = v12;
  v71.origin.y = v14;
  v71.size.width = v16;
  v71.size.height = v57;
  double MinY = CGRectGetMinY(v71);
  v72.origin.x = v61;
  v72.origin.y = v60;
  v72.size.width = v59;
  v72.size.height = v58;
  CGFloat v51 = CGRectGetMinY(v72);
  CATransform3DMakeTranslation(&v67, v49, -(MinY - v51 - v55), 0.0);
  memset(&v66, 0, sizeof(v66));
  CATransform3D a = v68;
  CATransform3D b = v67;
  CATransform3DConcat(&v66, &a, &b);
  CATransform3D v63 = v66;
  v52 = [*(id *)(a1 + 32) dockedReplicatorLayer];
  CATransform3D v62 = v63;
  [v52 setInstanceTransform:&v62];

  v53 = [*(id *)(a1 + 32) lensChromeView];
  objc_msgSend(v53, "setFrame:", v61, v60, v59, v58);

  return [MEMORY[0x263F158F8] commit];
}

- (CGRect)bestDockFromZoomRegion:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  [(CACZoomController *)self zoomFactor];
  double v7 = width * v6;
  double v8 = height * v6;
  double v9 = [(CACZoomController *)self view];
  [v9 center];
  double v11 = v10 - v7 * 0.5;
  double v12 = [(CACZoomController *)self view];
  [v12 center];
  double v14 = v13 - v8 * 0.5;

  double v15 = [(CACZoomController *)self view];
  [v15 frame];
  double v17 = v16 * 0.9;
  double v18 = [(CACZoomController *)self view];
  [v18 frame];
  double v20 = v19 * 0.9;

  if (v7 <= v17) {
    double v21 = v8;
  }
  else {
    double v21 = v20;
  }
  if (v7 <= v17) {
    double v22 = v7;
  }
  else {
    double v22 = v17;
  }
  double v23 = 280.0;
  if (v22 <= 280.0) {
    double v24 = v21;
  }
  else {
    double v24 = 280.0;
  }
  if (v22 <= 280.0) {
    double v23 = v22;
  }
  double v25 = v11;
  double v26 = v14;
  result.size.double height = v24;
  result.size.double width = v23;
  result.origin.y = v26;
  result.origin.x = v25;
  return result;
}

- (void)setZoomFactor:(double)a3
{
  if (self->_zoomFactor != a3) {
    self->_zoomFactor = a3;
  }
}

- (CGSize)_prescaledSizeForFinalSize:(CGSize)a3 withScaleFactor:(double)a4
{
  double v4 = a3.width / a4;
  double v5 = a3.height / a4;
  result.double height = v5;
  result.double width = v4;
  return result;
}

- (CGRect)_effectiveRectForBounds:(CGRect)a3 position:(CGPoint)a4 scaleFactor:(double)a5
{
  double v5 = a3.size.width * a5;
  double v6 = a3.size.height * a5;
  double v7 = a4.x - v5 * 0.5;
  double v8 = a4.y - v6 * 0.5;
  result.size.double height = v6;
  result.size.double width = v5;
  result.origin.y = v8;
  result.origin.x = v7;
  return result;
}

- (void)layerize:(id)a3 color:(id)a4
{
  id v5 = a4;
  id v8 = a3;
  [v8 setBorderWidth:3.0];
  id v6 = v5;
  double v7 = (CGColor *)[v6 CGColor];

  objc_msgSend(v8, "setBorderColor:", CGColorCreateCopyWithAlpha(v7, 0.3));
}

- (void)printLayers
{
  uint64_t v76 = *MEMORY[0x263EF8340];
  double v3 = [MEMORY[0x263F089D8] string];
  long long v67 = 0u;
  long long v68 = 0u;
  long long v69 = 0u;
  long long v70 = 0u;
  double v38 = self;
  double v4 = [(CACZoomController *)self view];
  id v5 = [v4 subviews];

  obuint64_t j = v5;
  uint64_t v41 = [v5 countByEnumeratingWithState:&v67 objects:v75 count:16];
  if (v41)
  {
    uint64_t v40 = *(void *)v68;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v68 != v40) {
          objc_enumerationMutation(obj);
        }
        uint64_t v42 = v6;
        double v7 = *(void **)(*((void *)&v67 + 1) + 8 * v6);
        [v3 appendFormat:@"\n %@", v7];
        long long v65 = 0u;
        long long v66 = 0u;
        long long v63 = 0u;
        long long v64 = 0u;
        id v8 = [v7 layer];
        double v9 = [v8 sublayers];

        id v43 = v9;
        uint64_t v47 = [v9 countByEnumeratingWithState:&v63 objects:v74 count:16];
        if (v47)
        {
          uint64_t v45 = *(void *)v64;
          do
          {
            uint64_t v10 = 0;
            do
            {
              if (*(void *)v64 != v45) {
                objc_enumerationMutation(v43);
              }
              double v11 = *(void **)(*((void *)&v63 + 1) + 8 * v10);
              [v11 frame];
              double v12 = NSStringFromCGRect(v77);
              objc_opt_class();
              uint64_t v49 = v10;
              if (objc_opt_isKindOfClass())
              {
                double v13 = [v11 groupName];
                [v3 appendFormat:@"\n\t %@, frame: %@, name: %@", v11, v12, v13];
              }
              else
              {
                [v3 appendFormat:@"\n\t %@, frame: %@, name: %@", v11, v12, @"N/A"];
              }

              long long v61 = 0u;
              long long v62 = 0u;
              long long v59 = 0u;
              long long v60 = 0u;
              double v14 = [v11 sublayers];
              uint64_t v15 = [v14 countByEnumeratingWithState:&v59 objects:v73 count:16];
              if (v15)
              {
                uint64_t v16 = v15;
                uint64_t v17 = *(void *)v60;
                do
                {
                  for (uint64_t i = 0; i != v16; ++i)
                  {
                    if (*(void *)v60 != v17) {
                      objc_enumerationMutation(v14);
                    }
                    double v19 = *(void **)(*((void *)&v59 + 1) + 8 * i);
                    [v19 frame];
                    double v20 = NSStringFromCGRect(v78);
                    objc_opt_class();
                    if (objc_opt_isKindOfClass())
                    {
                      double v21 = [v19 groupName];
                      [v3 appendFormat:@"\n\t\t %@, frame: %@ name: %@", v19, v20, v21];
                    }
                    else
                    {
                      [v3 appendFormat:@"\n\t\t %@, frame: %@ name: %@", v19, v20, @"N/A"];
                    }
                  }
                  uint64_t v16 = [v14 countByEnumeratingWithState:&v59 objects:v73 count:16];
                }
                while (v16);
              }

              uint64_t v10 = v49 + 1;
            }
            while (v49 + 1 != v47);
            uint64_t v47 = [v43 countByEnumeratingWithState:&v63 objects:v74 count:16];
          }
          while (v47);
        }

        uint64_t v6 = v42 + 1;
      }
      while (v42 + 1 != v41);
      uint64_t v41 = [obj countByEnumeratingWithState:&v67 objects:v75 count:16];
    }
    while (v41);
  }

  double v22 = [(CACZoomController *)v38 view];
  [v3 appendFormat:@"\n %@", v22];

  long long v57 = 0u;
  long long v58 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  double v23 = [(CACZoomController *)v38 view];
  double v24 = [v23 layer];
  double v25 = [v24 sublayers];

  id v44 = v25;
  uint64_t v48 = [v25 countByEnumeratingWithState:&v55 objects:v72 count:16];
  if (v48)
  {
    uint64_t v46 = *(void *)v56;
    do
    {
      uint64_t v26 = 0;
      do
      {
        if (*(void *)v56 != v46) {
          objc_enumerationMutation(v44);
        }
        long long v27 = *(void **)(*((void *)&v55 + 1) + 8 * v26);
        [v27 frame];
        double v28 = NSStringFromCGRect(v79);
        objc_opt_class();
        uint64_t v50 = v26;
        if (objc_opt_isKindOfClass())
        {
          double v29 = [v27 groupName];
          [v3 appendFormat:@"\n\t %@, frame: %@, name: %@", v27, v28, v29];
        }
        else
        {
          [v3 appendFormat:@"\n\t %@, frame: %@, name: %@", v27, v28, @"N/A"];
        }

        long long v53 = 0u;
        long long v54 = 0u;
        long long v51 = 0u;
        long long v52 = 0u;
        double v30 = [v27 sublayers];
        uint64_t v31 = [v30 countByEnumeratingWithState:&v51 objects:v71 count:16];
        if (v31)
        {
          uint64_t v32 = v31;
          uint64_t v33 = *(void *)v52;
          do
          {
            for (uint64_t j = 0; j != v32; ++j)
            {
              if (*(void *)v52 != v33) {
                objc_enumerationMutation(v30);
              }
              double v35 = *(void **)(*((void *)&v51 + 1) + 8 * j);
              [v35 frame];
              v36 = NSStringFromCGRect(v80);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                v37 = [v35 groupName];
                [v3 appendFormat:@"\n\t\t %@, frame: %@ name: %@", v35, v36, v37];
              }
              else
              {
                [v3 appendFormat:@"\n\t\t %@, frame: %@ name: %@", v35, v36, @"N/A"];
              }
            }
            uint64_t v32 = [v30 countByEnumeratingWithState:&v51 objects:v71 count:16];
          }
          while (v32);
        }

        uint64_t v26 = v50 + 1;
      }
      while (v50 + 1 != v48);
      uint64_t v48 = [v44 countByEnumeratingWithState:&v55 objects:v72 count:16];
    }
    while (v48);
  }

  NSLog(&stru_26EB37790.isa, v3);
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (CACZWLensChromeView)lensChromeView
{
  return self->_lensChromeView;
}

- (void)setLensChromeView:(id)a3
{
}

- (double)zoomFactor
{
  return self->_zoomFactor;
}

- (CABackdropLayer)screenBackdropLayer
{
  return self->_screenBackdropLayer;
}

- (void)setScreenBackdropLayer:(id)a3
{
}

- (CABackdropLayer)zoomedRegionBackdropLayer
{
  return self->_zoomedRegionBackdropLayer;
}

- (void)setZoomedRegionBackdropLayer:(id)a3
{
}

- (CAReplicatorLayer)dockedReplicatorLayer
{
  return self->_dockedReplicatorLayer;
}

- (void)setDockedReplicatorLayer:(id)a3
{
}

- (CGRect)zoomedRegionFrame
{
  double x = self->_zoomedRegionFrame.origin.x;
  double y = self->_zoomedRegionFrame.origin.y;
  double width = self->_zoomedRegionFrame.size.width;
  double height = self->_zoomedRegionFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setZoomedRegionFrame:(CGRect)a3
{
  self->_zoomedRegionFrame = a3;
}

- (CGRect)dockedLensFrame
{
  double x = self->_dockedLensFrame.origin.x;
  double y = self->_dockedLensFrame.origin.y;
  double width = self->_dockedLensFrame.size.width;
  double height = self->_dockedLensFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setDockedLensFrame:(CGRect)a3
{
  self->_dockedLensFrame = a3;
}

- (UIView)containingView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_containingView);
  return (UIView *)WeakRetained;
}

- (void)setContainingView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_containingView);
  objc_storeStrong((id *)&self->_dockedReplicatorLayer, 0);
  objc_storeStrong((id *)&self->_zoomedRegionBackdropLayer, 0);
  objc_storeStrong((id *)&self->_screenBackdropLayer, 0);
  objc_storeStrong((id *)&self->_lensChromeView, 0);
}

@end