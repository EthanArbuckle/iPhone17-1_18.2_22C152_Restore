@interface PXScrollSnapController
- (CGPoint)adjustedTargetVisibleOriginForProposedTargetVisibleOrigin:(CGPoint)a3 scrollingVelocity:(CGPoint)a4 decelerationRate:(int64_t *)a5;
- (CGRect)visibleRect;
- (PXScrollSnapController)init;
- (PXScrollSnapController)initWithSnapBehavior:(int64_t)a3 scrollAxis:(int64_t)a4 visibleRect:(CGRect)a5 visibilityInsets:(UIEdgeInsets)a6 scrollablePageSource:(id)a7;
- (PXScrollablePageSource)scrollablePageSource;
- (UIEdgeInsets)visibilityInsets;
- (double)maximumAccelerationFactor;
- (double)maximumDecelerationFactor;
- (double)minimumSpeed;
- (int64_t)scrollAxis;
- (int64_t)snapBehavior;
- (void)setMaximumAccelerationFactor:(double)a3;
- (void)setMaximumDecelerationFactor:(double)a3;
- (void)setMinimumSpeed:(double)a3;
- (void)setScrollAxis:(int64_t)a3;
- (void)setScrollablePageSource:(id)a3;
- (void)setSnapBehavior:(int64_t)a3;
- (void)setVisibilityInsets:(UIEdgeInsets)a3;
- (void)setVisibleRect:(CGRect)a3;
@end

@implementation PXScrollSnapController

- (void).cxx_destruct
{
}

- (void)setMinimumSpeed:(double)a3
{
  self->_minimumSpeed = a3;
}

- (double)minimumSpeed
{
  return self->_minimumSpeed;
}

- (void)setMaximumDecelerationFactor:(double)a3
{
  self->_maximumDecelerationFactor = a3;
}

- (double)maximumDecelerationFactor
{
  return self->_maximumDecelerationFactor;
}

- (void)setMaximumAccelerationFactor:(double)a3
{
  self->_maximumAccelerationFactor = a3;
}

- (double)maximumAccelerationFactor
{
  return self->_maximumAccelerationFactor;
}

- (void)setScrollablePageSource:(id)a3
{
}

- (PXScrollablePageSource)scrollablePageSource
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_scrollablePageSource);
  return (PXScrollablePageSource *)WeakRetained;
}

- (void)setVisibilityInsets:(UIEdgeInsets)a3
{
  self->_visibilityInsets = a3;
}

- (UIEdgeInsets)visibilityInsets
{
  double top = self->_visibilityInsets.top;
  double left = self->_visibilityInsets.left;
  double bottom = self->_visibilityInsets.bottom;
  double right = self->_visibilityInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)setVisibleRect:(CGRect)a3
{
  self->_visibleRect = a3;
}

- (CGRect)visibleRect
{
  double x = self->_visibleRect.origin.x;
  double y = self->_visibleRect.origin.y;
  double width = self->_visibleRect.size.width;
  double height = self->_visibleRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setScrollAxis:(int64_t)a3
{
  self->_scrollAxis = a3;
}

- (int64_t)scrollAxis
{
  return self->_scrollAxis;
}

- (void)setSnapBehavior:(int64_t)a3
{
  self->_snapBehavior = a3;
}

- (int64_t)snapBehavior
{
  return self->_snapBehavior;
}

- (CGPoint)adjustedTargetVisibleOriginForProposedTargetVisibleOrigin:(CGPoint)a3 scrollingVelocity:(CGPoint)a4 decelerationRate:(int64_t *)a5
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  int64_t v8 = [(PXScrollSnapController *)self snapBehavior];
  [(PXScrollSnapController *)self scrollAxis];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
  {
    int buf = 134218240;
    *(CGFloat *)buf_4 = y;
    __int16 v14 = 2048;
    int64_t v15 = v8;
    _os_log_debug_impl(&dword_1A9AE7000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "[ScrollSnap] === adjust %f with behavior %ti", (uint8_t *)&buf, 0x16u);
    if (v8) {
LABEL_3:
    }
      PXPointValueForAxis();
  }
  else if (v8)
  {
    goto LABEL_3;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
  {
    int buf = 134217984;
    *(CGFloat *)buf_4 = y;
    _os_log_debug_impl(&dword_1A9AE7000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "[ScrollSnap] ===> adjusted %f", (uint8_t *)&buf, 0xCu);
    if (!a5) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (a5) {
LABEL_6:
  }
    *a5 = v8;
LABEL_7:
  double v9 = x;
  double v10 = y;
  result.CGFloat y = v10;
  result.CGFloat x = v9;
  return result;
}

void __119__PXScrollSnapController_adjustedTargetVisibleOriginForProposedTargetVisibleOrigin_scrollingVelocity_decelerationRate___block_invoke(uint64_t a1, uint64_t a2, int a3, unsigned char *a4, CGFloat a5, CGFloat a6, CGFloat a7, CGFloat a8)
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  double MinY = CGRectGetMinY(*(CGRect *)&a5);
  v45.origin.CGFloat x = a5;
  v45.origin.CGFloat y = a6;
  v45.size.double width = a7;
  v45.size.double height = a8;
  double MaxY = CGRectGetMaxY(v45);
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
  CGRect v50 = CGRectInset(*(CGRect *)(a1 + 104), 1.0, 1.0);
  v46.origin.CGFloat x = a5;
  v46.origin.CGFloat y = a6;
  v46.size.double width = a7;
  v46.size.double height = a8;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = CGRectIntersectsRect(v46, v50);
  CGRect v51 = CGRectInset(*(CGRect *)(a1 + 104), 1.0, 1.0);
  v47.origin.CGFloat x = a5;
  v47.origin.CGFloat y = a6;
  v47.size.double width = a7;
  v47.size.double height = a8;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = CGRectIntersectsRect(v47, v51);
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
  {
    int v25 = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
    int v26 = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
    int v27 = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
    *(_DWORD *)int buf = 134218752;
    uint64_t v37 = a2;
    __int16 v38 = 1024;
    int v39 = v25;
    __int16 v40 = 1024;
    int v41 = v26;
    __int16 v42 = 1024;
    int v43 = v27;
    _os_log_debug_impl(&dword_1A9AE7000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "[ScrollSnap] %ti isPageInFocus %i isPageAtLeastPartiallyVisible %i lastPageWasInFocus %i", buf, 0x1Eu);
  }
  if (*(unsigned char *)(a1 + 240) || *(void *)(a1 + 136) != 2)
  {
    if (!a3) {
      goto LABEL_20;
    }
  }
  else if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) && (a3 & 1) == 0)
  {
    goto LABEL_20;
  }
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __119__PXScrollSnapController_adjustedTargetVisibleOriginForProposedTargetVisibleOrigin_scrollingVelocity_decelerationRate___block_invoke_10;
  aBlock[3] = &unk_1E5DCE460;
  long long v18 = *(_OWORD *)(a1 + 160);
  long long v32 = *(_OWORD *)(a1 + 144);
  long long v33 = v18;
  uint64_t v34 = *(void *)(a1 + 176);
  uint64_t v19 = *(void *)(a1 + 56);
  aBlock[4] = *(void *)(a1 + 40);
  aBlock[5] = v19;
  long long v35 = *(_OWORD *)(a1 + 184);
  long long v20 = *(_OWORD *)(a1 + 88);
  long long v30 = *(_OWORD *)(a1 + 72);
  long long v31 = v20;
  v21 = (void (**)(void, __n128))_Block_copy(aBlock);
  switch(*(void *)(a1 + 136))
  {
    case 0:
      v28 = [MEMORY[0x1E4F28B00] currentHandler];
      [v28 handleFailureInMethod:*(void *)(a1 + 200) object:*(void *)(a1 + 32) file:@"PXScrollSnapController.m" lineNumber:172 description:@"Code which should be unreachable has been reached"];

      abort();
    case 1:
      v48.origin.CGFloat x = a5;
      v48.origin.CGFloat y = a6;
      v48.size.double width = a7;
      v48.size.double height = a8;
      double MidY = CGRectGetMidY(v48);
      v22.n128_f64[0] = MidY - CGRectGetMidY(*(CGRect *)(a1 + 104)) + *(double *)(a1 + 192);
      goto LABEL_12;
    case 2:
      v22.n128_f64[0] = MinY - *(double *)(a1 + 208);
LABEL_12:
      v21[2](v21, v22);
      break;
    case 3:
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)int buf = 134217984;
        uint64_t v37 = a2;
        _os_log_debug_impl(&dword_1A9AE7000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "[ScrollSnap] %ti page top?", buf, 0xCu);
      }
      ((void (*)(void (**)(void, __n128), double))v21[2])(v21, MinY - *(double *)(a1 + 208));
      v49.origin.CGFloat x = a5;
      v49.origin.CGFloat y = a6;
      v49.size.double width = a7;
      v49.size.double height = a8;
      double Height = CGRectGetHeight(v49);
      if (Height > CGRectGetHeight(*(CGRect *)(a1 + 104)))
      {
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)int buf = 134217984;
          uint64_t v37 = a2;
          _os_log_debug_impl(&dword_1A9AE7000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "[ScrollSnap] %ti page bottom?", buf, 0xCu);
        }
        ((void (*)(void (**)(void, __n128), double))v21[2])(v21, MaxY - *(double *)(a1 + 128) - *(double *)(a1 + 208));
      }
      break;
    default:
      break;
  }

LABEL_20:
  *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = a3;
  if (*(unsigned char *)(a1 + 240) && MaxY < CGRectGetMinY(*(CGRect *)(a1 + 104))
    || *(unsigned char *)(a1 + 241) && MinY > CGRectGetMaxY(*(CGRect *)(a1 + 104)))
  {
    *a4 = 1;
  }
}

void __119__PXScrollSnapController_adjustedTargetVisibleOriginForProposedTargetVisibleOrigin_scrollingVelocity_decelerationRate___block_invoke_10(uint64_t a1, double a2)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
  {
    int v18 = 134217984;
    double v19 = a2;
    _os_log_debug_impl(&dword_1A9AE7000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "[ScrollSnap] candidate %f", (uint8_t *)&v18, 0xCu);
  }
  if (*(double *)(a1 + 80) > a2 || *(double *)(a1 + 88) < a2) {
    return;
  }
  double v5 = *(double *)(a1 + 96);
  double v4 = *(double *)(a1 + 104);
  uint64_t v6 = *(void *)(a1 + 112);
  if (v6 == 1)
  {
    if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)
      || !*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24))
    {
      double v7 = *(double *)(a1 + 128);
      double v11 = vabdd_f64(a2, v7);
      if (v11 >= *(double *)(*(void *)(*(void *)(a1 + 56) + 8) + 24)) {
        goto LABEL_30;
      }
      double v8 = *(double *)(a1 + 120);
      double v9 = vabdd_f64(a2, v8);
      double v10 = a2 - v7;
      goto LABEL_15;
    }
    double v8 = *(double *)(a1 + 120);
    double v7 = *(double *)(a1 + 128);
    double v9 = vabdd_f64(a2, v8);
    double v10 = a2 - v7;
    double v11 = vabdd_f64(a2, v7);
    double v5 = 1.79769313e308;
  }
  else
  {
    if (v6) {
      goto LABEL_30;
    }
    double v8 = *(double *)(a1 + 120);
    double v7 = *(double *)(a1 + 128);
    double v9 = vabdd_f64(a2, v8);
    double v10 = a2 - v7;
    double v11 = vabdd_f64(a2, v7);
  }
  if (v9 >= *(double *)(*(void *)(*(void *)(a1 + 48) + 8) + 24))
  {
LABEL_30:
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
    {
      LOWORD(v18) = 0;
      int64_t v15 = MEMORY[0x1E4F14500];
      uint64_t v16 = "[ScrollSnap] not closer";
      goto LABEL_32;
    }
    return;
  }
  if (v8 == v7) {
    goto LABEL_33;
  }
LABEL_15:
  double v12 = v10 / (v8 - v7);
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
  {
    int v18 = 134217984;
    double v19 = v12;
    _os_log_debug_impl(&dword_1A9AE7000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "[ScrollSnap] factor %f", (uint8_t *)&v18, 0xCu);
  }
  BOOL v13 = v12 < 1.0 || v12 > v5;
  if (v13 && (v12 < 1.0 ? (BOOL v14 = v12 < 1.0 / v4) : (BOOL v14 = 1), v14))
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
    {
      LOWORD(v18) = 0;
      int64_t v15 = MEMORY[0x1E4F14500];
      uint64_t v16 = "[ScrollSnap] not acceptable";
LABEL_32:
      uint32_t v17 = 2;
LABEL_36:
      _os_log_debug_impl(&dword_1A9AE7000, v15, OS_LOG_TYPE_DEBUG, v16, (uint8_t *)&v18, v17);
    }
  }
  else
  {
LABEL_33:
    *(double *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v9;
    *(double *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = v11;
    *(double *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = a2;
    *(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = 1;
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
    {
      int v18 = 134217984;
      double v19 = a2;
      int64_t v15 = MEMORY[0x1E4F14500];
      uint64_t v16 = "[ScrollSnap] accepted %f";
      uint32_t v17 = 12;
      goto LABEL_36;
    }
  }
}

- (PXScrollSnapController)initWithSnapBehavior:(int64_t)a3 scrollAxis:(int64_t)a4 visibleRect:(CGRect)a5 visibilityInsets:(UIEdgeInsets)a6 scrollablePageSource:(id)a7
{
  CGFloat right = a6.right;
  CGFloat bottom = a6.bottom;
  CGFloat left = a6.left;
  CGFloat top = a6.top;
  CGFloat height = a5.size.height;
  CGFloat width = a5.size.width;
  CGFloat y = a5.origin.y;
  CGFloat x = a5.origin.x;
  id v18 = a7;
  v22.receiver = self;
  v22.super_class = (Class)PXScrollSnapController;
  double v19 = [(PXScrollSnapController *)&v22 init];
  uint64_t v20 = v19;
  if (v19)
  {
    v19->_snapBehavior = a3;
    v19->_scrollAxis = a4;
    v19->_visibleRect.origin.CGFloat x = x;
    v19->_visibleRect.origin.CGFloat y = y;
    v19->_visibleRect.size.CGFloat width = width;
    v19->_visibleRect.size.CGFloat height = height;
    v19->_visibilityInsets.CGFloat top = top;
    v19->_visibilityInsets.CGFloat left = left;
    v19->_visibilityInsets.CGFloat bottom = bottom;
    v19->_visibilityInsets.CGFloat right = right;
    objc_storeWeak((id *)&v19->_scrollablePageSource, v18);
    *(_OWORD *)&v20->_maximumAccelerationFactor = xmmword_1AB35A110;
    v20->_minimumSpeed = 0.1;
  }

  return v20;
}

- (PXScrollSnapController)init
{
  double v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:self file:@"PXScrollSnapController.m" lineNumber:23 description:@"Code which should be unreachable has been reached"];

  abort();
}

@end