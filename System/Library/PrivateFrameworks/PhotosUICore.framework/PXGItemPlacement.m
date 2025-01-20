@interface PXGItemPlacement
- ($6FCFBD36564ECBB6D9D1614A84D6F83D)cornerRadius;
- ($810C7C628FE0F9AC50A6216490AB88B8)displayedAssetContentsRect;
- (BOOL)hasGeometry;
- (CGRect)normalizedDisplayedAssetRect;
- (CGRect)normalizedSubtitleRect;
- (CGRect)normalizedTitleRect;
- (CGRect)rectInCoordinateSpace:(id)a3 velocity:(CGRect *)a4;
- (CGRect)rectInLayout:(id)a3 velocity:(CGRect *)a4;
- (NSString)diagnosticDescription;
- (NSUUID)uuid;
- (PXDisplayAsset)displayedAsset;
- (PXGItemPlacement)adjustedPreferredPlacement;
- (PXGItemPlacement)init;
- (PXGItemPlacement)initWithContext:(id)a3 configuration:(id)a4;
- (PXGItemPlacement)otherItemsPlacement;
- (PXRegionOfInterest)regionOfInterest;
- (double)alpha;
- (double)chromeAlpha;
- (double)legibilityOverlayAlpha;
- (double)scrubberAlpha;
- (float)soundVolume;
- (id)copyWithConfiguration:(id)a3;
- (id)copyWithRegionOfInterest:(id)a3;
- (void)adjustPreferredPlacementInSourceWithIdentifier:(id)a3 configuration:(id)a4;
- (void)registerSourceIdentifier:(id)a3;
- (void)setAlpha:(double)a3;
- (void)setChromeAlpha:(double)a3;
- (void)setCornerRadius:(id)a3;
- (void)setDisplayedAsset:(id)a3;
- (void)setDisplayedAssetContentsRect:(id *)a3;
- (void)setLegibilityOverlayAlpha:(double)a3;
- (void)setNormalizedDisplayedAssetRect:(CGRect)a3;
- (void)setNormalizedSubtitleRect:(CGRect)a3;
- (void)setNormalizedTitleRect:(CGRect)a3;
- (void)setOtherItemsPlacement:(id)a3;
- (void)setRect:(CGRect)a3 velocity:(CGRect)a4 inCoordinateSpace:(id)a5;
- (void)setRect:(CGRect)a3 velocity:(CGRect)a4 inLayout:(id)a5;
- (void)setScrubberAlpha:(double)a3;
- (void)setSoundVolume:(float)a3;
@end

@implementation PXGItemPlacement

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_otherItemsPlacement, 0);
  objc_storeStrong((id *)&self->_displayedAsset, 0);
  objc_storeStrong((id *)&self->_registeredSourceIdentifiers, 0);
  objc_storeStrong((id *)&self->_layout, 0);
  objc_destroyWeak((id *)&self->_coordinateSpace);
  objc_destroyWeak((id *)&self->_context);
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (PXGItemPlacement)otherItemsPlacement
{
  return self->_otherItemsPlacement;
}

- (float)soundVolume
{
  return self->_soundVolume;
}

- (double)legibilityOverlayAlpha
{
  return self->_legibilityOverlayAlpha;
}

- (double)scrubberAlpha
{
  return self->_scrubberAlpha;
}

- (double)chromeAlpha
{
  return self->_chromeAlpha;
}

- (CGRect)normalizedSubtitleRect
{
  double x = self->_normalizedSubtitleRect.origin.x;
  double y = self->_normalizedSubtitleRect.origin.y;
  double width = self->_normalizedSubtitleRect.size.width;
  double height = self->_normalizedSubtitleRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (CGRect)normalizedTitleRect
{
  double x = self->_normalizedTitleRect.origin.x;
  double y = self->_normalizedTitleRect.origin.y;
  double width = self->_normalizedTitleRect.size.width;
  double height = self->_normalizedTitleRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (CGRect)normalizedDisplayedAssetRect
{
  double x = self->_normalizedDisplayedAssetRect.origin.x;
  double y = self->_normalizedDisplayedAssetRect.origin.y;
  double width = self->_normalizedDisplayedAssetRect.size.width;
  double height = self->_normalizedDisplayedAssetRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- ($6FCFBD36564ECBB6D9D1614A84D6F83D)cornerRadius
{
  *(void *)&result.var0.var1[2] = a2;
  *(void *)&result.var0.var0.var0 = self;
  return result;
}

- ($810C7C628FE0F9AC50A6216490AB88B8)displayedAssetContentsRect
{
  long long v3 = *(_OWORD *)&self[6].var0.c;
  *(_OWORD *)&retstr->var0.a = *(_OWORD *)&self[6].var0.a;
  *(_OWORD *)&retstr->var0.c = v3;
  *(_OWORD *)&retstr->var0.tdouble x = *(_OWORD *)&self[6].var0.tx;
  return self;
}

- (PXDisplayAsset)displayedAsset
{
  return self->_displayedAsset;
}

- (double)alpha
{
  return self->_alpha;
}

- (NSString)diagnosticDescription
{
  id v3 = [NSString alloc];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  objc_claimAutoreleasedReturnValue();
  [objc_loadWeakRetained((id *)&self->_context) diagnosticDescription];
  objc_claimAutoreleasedReturnValue();
  PXRectDescription();
}

- (PXGItemPlacement)adjustedPreferredPlacement
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_context);
  v4 = [WeakRetained _adjustedPreferredPlacementForPlacement:self];
  v5 = v4;
  if (!v4) {
    v4 = self;
  }
  v6 = v4;

  return v6;
}

- (void)adjustPreferredPlacementInSourceWithIdentifier:(id)a3 configuration:(id)a4
{
  p_context = &self->_context;
  id v6 = a4;
  id v7 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_context);
  [WeakRetained _adjustPreferredPlacementInSourceWithIdentifier:v7 configuration:v6];
}

- (id)copyWithRegionOfInterest:(id)a3
{
  id v4 = a3;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __45__PXGItemPlacement_copyWithRegionOfInterest___block_invoke;
  v8[3] = &unk_1E5DB0D98;
  id v9 = v4;
  id v5 = v4;
  id v6 = [(PXGItemPlacement *)self copyWithConfiguration:v8];

  return v6;
}

void __45__PXGItemPlacement_copyWithRegionOfInterest___block_invoke(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v5 = [v3 coordinateSpace];
  [*(id *)(a1 + 32) rectInCoordinateSpace:v5];
  objc_msgSend(v4, "setRect:velocity:inCoordinateSpace:", v5);
}

- (PXRegionOfInterest)regionOfInterest
{
  int64_t rectReference = self->_rectReference;
  switch(rectReference)
  {
    case 1:
      id WeakRetained = objc_loadWeakRetained((id *)&self->_coordinateSpace);
      break;
    case 2:
      id v5 = [(PXGLayout *)self->_layout rootLayout];
      id WeakRetained = [v5 coordinateSpace];

      if (!WeakRetained) {
        PXGTungstenGetLog();
      }
      break;
    case 0:
      v10 = [MEMORY[0x1E4F28B00] currentHandler];
      [v10 handleFailureInMethod:a2 object:self file:@"PXGItemPlacement.m" lineNumber:215 description:@"Code which should be unreachable has been reached"];

      abort();
    default:
      id WeakRetained = 0;
      break;
  }
  id v6 = objc_alloc((Class)off_1E5DA82B8);
  [(PXGItemPlacement *)self rectInCoordinateSpace:WeakRetained velocity:0];
  id v7 = objc_msgSend(v6, "initWithRect:inCoordinateSpace:", WeakRetained);

  return (PXRegionOfInterest *)v7;
}

- (id)copyWithConfiguration:(id)a3
{
  id v4 = (void (**)(id, uint64_t))a3;
  id v5 = objc_alloc((Class)objc_opt_class());
  id WeakRetained = objc_loadWeakRetained((id *)&self->_context);
  uint64_t v7 = [v5 initWithContext:WeakRetained configuration:&__block_literal_global_19218];

  CGSize size = self->_rect.size;
  *(CGPoint *)(v7 + 16) = self->_rect.origin;
  *(CGSize *)(v7 + 32) = size;
  CGSize v9 = self->_rectVelocity.size;
  *(CGPoint *)(v7 + 48) = self->_rectVelocity.origin;
  *(CGSize *)(v7 + 64) = v9;
  *(void *)(v7 + 80) = self->_rectReference;
  id v10 = objc_loadWeakRetained((id *)&self->_coordinateSpace);
  objc_storeWeak((id *)(v7 + 88), v10);

  objc_storeStrong((id *)(v7 + 96), self->_layout);
  *(double *)(v7 + 120) = self->_alpha;
  objc_storeStrong((id *)(v7 + 128), self->_displayedAsset);
  long long v11 = *(_OWORD *)&self->_displayedAssetContentsRect.t.a;
  long long v12 = *(_OWORD *)&self->_displayedAssetContentsRect.t.tx;
  *(_OWORD *)(v7 + 304) = *(_OWORD *)&self->_displayedAssetContentsRect.t.c;
  *(_OWORD *)(v7 + 320) = v12;
  *(_OWORD *)(v7 + 288) = v11;
  *($E57FD295544FE3DD2B3C272D7C23EB59 *)(v7 + 176) = self->_cornerRadius;
  CGSize v13 = self->_normalizedDisplayedAssetRect.size;
  *(CGPoint *)(v7 + 192) = self->_normalizedDisplayedAssetRect.origin;
  *(CGSize *)(v7 + 208) = v13;
  CGSize v14 = self->_normalizedTitleRect.size;
  *(CGPoint *)(v7 + 224) = self->_normalizedTitleRect.origin;
  *(CGSize *)(v7 + 240) = v14;
  CGSize v15 = self->_normalizedSubtitleRect.size;
  *(CGPoint *)(v7 + 256) = self->_normalizedSubtitleRect.origin;
  *(CGSize *)(v7 + 272) = v15;
  *(double *)(v7 + 136) = self->_chromeAlpha;
  *(double *)(v7 + 144) = self->_scrubberAlpha;
  *(double *)(v7 + 152) = self->_legibilityOverlayAlpha;
  *(float *)(v7 + 112) = self->_soundVolume;
  objc_storeStrong((id *)(v7 + 160), self->_otherItemsPlacement);
  v4[2](v4, v7);

  return (id)v7;
}

- (void)registerSourceIdentifier:(id)a3
{
  id v4 = a3;
  registeredSourceIdentifiers = self->_registeredSourceIdentifiers;
  id v8 = v4;
  if (!registeredSourceIdentifiers)
  {
    id v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v7 = self->_registeredSourceIdentifiers;
    self->_registeredSourceIdentifiers = v6;

    id v4 = v8;
    registeredSourceIdentifiers = self->_registeredSourceIdentifiers;
  }
  [(NSMutableArray *)registeredSourceIdentifiers addObject:v4];
}

- (void)setOtherItemsPlacement:(id)a3
{
}

- (void)setSoundVolume:(float)a3
{
  self->_soundVolume = a3;
}

- (void)setLegibilityOverlayAlpha:(double)a3
{
  self->_legibilityOverlayAlpha = a3;
}

- (void)setScrubberAlpha:(double)a3
{
  self->_scrubberAlpha = a3;
}

- (void)setChromeAlpha:(double)a3
{
  self->_chromeAlpha = a3;
}

- (void)setNormalizedSubtitleRect:(CGRect)a3
{
  self->_normalizedSubtitleRect = a3;
}

- (void)setNormalizedTitleRect:(CGRect)a3
{
  self->_normalizedTitleRect = a3;
}

- (void)setNormalizedDisplayedAssetRect:(CGRect)a3
{
  self->_normalizedDisplayedAssetRect = a3;
}

- (void)setCornerRadius:(id)a3
{
  self->_cornerRadius.var0.var0.topLeft = v3;
  self->_cornerRadius.var0.var0.topRight = v4;
  self->_cornerRadius.var0.var0.bottomLeft = v5;
  self->_cornerRadius.var0.var0.bottomRight = v6;
}

- (void)setDisplayedAssetContentsRect:(id *)a3
{
  long long v3 = *(_OWORD *)&a3->var0.a;
  long long v4 = *(_OWORD *)&a3->var0.tx;
  *(_OWORD *)&self->_displayedAssetContentsRect.t.c = *(_OWORD *)&a3->var0.c;
  *(_OWORD *)&self->_displayedAssetContentsRect.t.tdouble x = v4;
  *(_OWORD *)&self->_displayedAssetContentsRect.t.a = v3;
}

- (void)setDisplayedAsset:(id)a3
{
}

- (void)setAlpha:(double)a3
{
  self->_alpha = a3;
}

- (CGRect)rectInLayout:(id)a3 velocity:(CGRect *)a4
{
  id v6 = a3;
  uint64_t v7 = v6;
  int64_t rectReference = self->_rectReference;
  if (rectReference == 2)
  {
    objc_msgSend(v6, "convertRect:fromLayout:", self->_layout, self->_rect.origin.x, self->_rect.origin.y, self->_rect.size.width, self->_rect.size.height);
    double v9 = v13;
    double v10 = v14;
    double v11 = v15;
    double v12 = v16;
  }
  else if (rectReference == 1)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_context);

    if (!WeakRetained) {
      PXAssertGetLog();
    }
    id v18 = objc_loadWeakRetained((id *)&self->_context);
    id v19 = objc_loadWeakRetained((id *)&self->_coordinateSpace);
    objc_msgSend(v18, "_convertRect:fromCoordinateSpace:toLayout:", v19, v7, self->_rect.origin.x, self->_rect.origin.y, self->_rect.size.width, self->_rect.size.height);
    double v9 = v20;
    double v10 = v21;
    double v11 = v22;
    double v12 = v23;
  }
  else
  {
    double v9 = *MEMORY[0x1E4F1DB20];
    double v10 = *(double *)(MEMORY[0x1E4F1DB20] + 8);
    double v11 = *(double *)(MEMORY[0x1E4F1DB20] + 16);
    double v12 = *(double *)(MEMORY[0x1E4F1DB20] + 24);
    if (!rectReference) {
      PXAssertGetLog();
    }
  }
  if (a4)
  {
    CGSize size = self->_rectVelocity.size;
    a4->origin = self->_rectVelocity.origin;
    a4->CGSize size = size;
  }

  double v25 = v9;
  double v26 = v10;
  double v27 = v11;
  double v28 = v12;
  result.size.double height = v28;
  result.size.double width = v27;
  result.origin.double y = v26;
  result.origin.double x = v25;
  return result;
}

- (void)setRect:(CGRect)a3 velocity:(CGRect)a4 inLayout:(id)a5
{
  self->_rect = a3;
  self->_rectVelocitdouble y = a4;
  objc_storeStrong((id *)&self->_layout, a5);
  self->_int64_t rectReference = 2;
}

- (CGRect)rectInCoordinateSpace:(id)a3 velocity:(CGRect *)a4
{
  id v6 = a3;
  int64_t rectReference = self->_rectReference;
  if (rectReference == 2)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_context);
    objc_msgSend(WeakRetained, "_convertRect:fromLayout:toCoordinateSpace:", self->_layout, v6, self->_rect.origin.x, self->_rect.origin.y, self->_rect.size.width, self->_rect.size.height);
    double v8 = v13;
    double v9 = v14;
    double v10 = v15;
    double v11 = v16;
  }
  else
  {
    if (rectReference == 1)
    {
      objc_loadWeakRetained((id *)&self->_coordinateSpace);
      PXRectConvertFromCoordinateSpaceToCoordinateSpace();
    }
    double v8 = *MEMORY[0x1E4F1DB20];
    double v9 = *(double *)(MEMORY[0x1E4F1DB20] + 8);
    double v10 = *(double *)(MEMORY[0x1E4F1DB20] + 16);
    double v11 = *(double *)(MEMORY[0x1E4F1DB20] + 24);
    if (!rectReference) {
      PXAssertGetLog();
    }
  }
  if (a4)
  {
    CGSize size = self->_rectVelocity.size;
    a4->origin = self->_rectVelocity.origin;
    a4->CGSize size = size;
  }

  double v18 = v8;
  double v19 = v9;
  double v20 = v10;
  double v21 = v11;
  result.size.double height = v21;
  result.size.double width = v20;
  result.origin.double y = v19;
  result.origin.double x = v18;
  return result;
}

- (void)setRect:(CGRect)a3 velocity:(CGRect)a4 inCoordinateSpace:(id)a5
{
  self->_rect = a3;
  self->_rectVelocitdouble y = a4;
  objc_storeWeak((id *)&self->_coordinateSpace, a5);
  self->_int64_t rectReference = 1;
}

- (BOOL)hasGeometry
{
  return self->_rectReference != 0;
}

- (PXGItemPlacement)initWithContext:(id)a3 configuration:(id)a4
{
  id v6 = a3;
  uint64_t v7 = (void (**)(id, void))a4;
  v28.receiver = self;
  v28.super_class = (Class)PXGItemPlacement;
  double v8 = [(PXGItemPlacement *)&v28 init];
  double v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_context, v6);
    double v10 = (NSUUID *)objc_alloc_init(MEMORY[0x1E4F29128]);
    uuid = v9->_uuid;
    v9->_uuid = v10;

    double v12 = (CGPoint *)MEMORY[0x1E4F1DB20];
    CGPoint v13 = (CGPoint)*MEMORY[0x1E4F1DB20];
    CGSize v14 = *(CGSize *)(MEMORY[0x1E4F1DB20] + 16);
    CGPoint v15 = (CGPoint)*MEMORY[0x1E4F1DB20];
    v9->_rect.origin = (CGPoint)*MEMORY[0x1E4F1DB20];
    v9->_rect.CGSize size = v14;
    CGSize v16 = (CGSize)*((_OWORD *)off_1E5DAB008 + 1);
    v9->_rectVelocity.origin = *(CGPoint *)off_1E5DAB008;
    v9->_rectVelocity.CGSize size = v16;
    v9->_alpha = 1.0;
    long long v17 = *(_OWORD *)off_1E5DAB038;
    long long v18 = *((_OWORD *)off_1E5DAB038 + 2);
    *(_OWORD *)&v9->_displayedAssetContentsRect.t.c = *((_OWORD *)off_1E5DAB038 + 1);
    *(_OWORD *)&v9->_displayedAssetContentsRect.t.tdouble x = v18;
    v9->_cornerRadius = *($E57FD295544FE3DD2B3C272D7C23EB59 *)off_1E5DAAF48;
    v9->_normalizedDisplayedAssetRect.origin = v13;
    CGPoint v19 = *v12;
    v9->_normalizedDisplayedAssetRect.CGSize size = (CGSize)v12[1];
    v9->_normalizedTitleRect.origin = v19;
    v9->_normalizedSubtitleRect.CGSize size = (CGSize)v12[1];
    *(_OWORD *)&v9->_displayedAssetContentsRect.t.a = v17;
    v9->_normalizedTitleRect.CGSize size = (CGSize)v12[1];
    v9->_normalizedSubtitleRect.origin = v15;
    __asm { FMOV            V0.2D, #1.0 }
    *(_OWORD *)&v9->_chromeAlpha = _Q0;
    v9->_legibilityOverlayAlpha = 1.0;
    v9->_soundVolume = 1.0;
    ((void (**)(id, PXGItemPlacement *))v7)[2](v7, v9);
    id WeakRetained = objc_loadWeakRetained((id *)&v9->_context);
    [WeakRetained _registerOriginalPlacement:v9 forSourceIdentifiers:v9->_registeredSourceIdentifiers];

    registeredSourceIdentifiers = v9->_registeredSourceIdentifiers;
    v9->_registeredSourceIdentifiers = 0;
  }
  return v9;
}

- (PXGItemPlacement)init
{
  long long v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXGItemPlacement.m", 47, @"%s is not available as initializer", "-[PXGItemPlacement init]");

  abort();
}

@end