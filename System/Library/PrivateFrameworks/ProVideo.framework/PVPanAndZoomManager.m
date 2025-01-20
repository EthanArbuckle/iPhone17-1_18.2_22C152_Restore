@interface PVPanAndZoomManager
+ (CGPoint)adjustPositionToKeepMediaInViewBounds:(CGPoint)a3 scale:(double)a4 minScale:(double)a5 mediaAspectRatio:(double)a6 viewAspectRatio:(double)a7 fillMode:(int)a8 outNeedsUpdate:(BOOL *)a9;
+ (CGPoint)maximumNormalizedPositionForScale:(double)a3 minScale:(double)a4 position:(CGPoint)a5 mediaAspectRatio:(double)a6 viewAspectRatio:(double)a7 fillMode:(int)a8;
+ (PVTransformAnimationInfo)transformAnimInfoForScale:(SEL)a3 atNormalizedLocationInView:(double)a4 minScale:(CGPoint)a5 currentScale:(double)a6 currentTranslation:(double)a7 mediaAspectRatio:(CGPoint)a8 viewAspectRatio:(double)a9 fillMode:(double)a10 outNeedsUpdate:(int)a11;
+ (double)calculateMaxScale:(double)result forMediaAspectRatio:(double)a4 viewAspectRatio:(double)a5 fillMode:(int)a6;
+ (double)calculateMinScaleForMediaAspectRatio:(double)a3 viewAspectRatio:(double)a4 fillMode:(int)a5;
+ (double)maximumNormalizedPositionInAxisForScale:(double)a3 minScale:(double)a4 isMediaAxisNormal:(BOOL)a5 isPositionBelowZero:(BOOL)a6;
+ (id)panAndZoomManagerWithMediaSize:(CGSize)a3 viewSize:(CGSize)a4 fillMode:(int)a5 maxScale:(double)a6;
- (BOOL)disableRotation;
- (BOOL)disableScale;
- (BOOL)disableTranslation;
- (BOOL)isEditing;
- (BOOL)isEditingTransformType:(int)a3;
- (BOOL)isTranslationDirectionLockEnabled;
- (BOOL)isZoomSnapEnabled;
- (CGSize)mediaSize;
- (CGSize)viewSize;
- (PVPanAndZoomManager)initWithMediaSize:(CGSize)a3 viewSize:(CGSize)a4 fillMode:(int)a5 maxScale:(double)a6;
- (PVTransformAnimationInfo)endEditingTransformForType:(SEL)a3;
- (PVTransformAnimationInfo)updateRotation:(SEL)a3 normalizedLocationInView:(double)a4 outNeedsUpdate:(CGPoint)a5;
- (PVTransformAnimationInfo)updateScale:(SEL)a3 normalizedLocationInView:(double)a4 outNeedsUpdate:(CGPoint)a5;
- (PVTransformAnimationInfo)updateTranslation:(SEL)a3 outNeedsUpdate:(CGPoint)a4;
- (double)maxScale;
- (double)translationDirectionLockThreshold;
- (double)zoomSnapScale;
- (double)zoomSnapThreshold;
- (int)fillMode;
- (void)beginEditingTransform:(PVTransformAnimationInfo *)a3 transformType:(int)a4 updateOtherWorkingTransforms:(BOOL)a5;
- (void)cancelEditing;
- (void)cancelSnapTimer;
- (void)onSnapTimer:(id)a3;
- (void)setDisableRotation:(BOOL)a3;
- (void)setDisableScale:(BOOL)a3;
- (void)setDisableTranslation:(BOOL)a3;
- (void)setFillMode:(int)a3;
- (void)setIsEditingTransform:(BOOL)a3 type:(int)a4;
- (void)setIsTranslationDirectionLockEnabled:(BOOL)a3;
- (void)setIsZoomSnapEnabled:(BOOL)a3;
- (void)setMaxScale:(double)a3;
- (void)setMediaSize:(CGSize)a3;
- (void)setTranslationDirectionLockThreshold:(double)a3;
- (void)setViewSize:(CGSize)a3;
- (void)setZoomSnapScale:(double)a3;
- (void)setZoomSnapThreshold:(double)a3;
- (void)updateMaxScale;
- (void)updateMediaAspectRatio;
- (void)updateMinScale;
- (void)updateViewAspectRatio;
@end

@implementation PVPanAndZoomManager

+ (id)panAndZoomManagerWithMediaSize:(CGSize)a3 viewSize:(CGSize)a4 fillMode:(int)a5 maxScale:(double)a6
{
  v6 = objc_msgSend(objc_alloc((Class)a1), "initWithMediaSize:viewSize:fillMode:maxScale:", *(void *)&a5, a3.width, a3.height, a4.width, a4.height, a6);

  return v6;
}

- (PVPanAndZoomManager)initWithMediaSize:(CGSize)a3 viewSize:(CGSize)a4 fillMode:(int)a5 maxScale:(double)a6
{
  CGFloat height = a4.height;
  CGFloat width = a4.width;
  CGFloat v10 = a3.height;
  CGFloat v11 = a3.width;
  v18.receiver = self;
  v18.super_class = (Class)PVPanAndZoomManager;
  v12 = [(PVPanAndZoomManager *)&v18 init];
  v13 = v12;
  if (v12)
  {
    [(PVPanAndZoomManager *)v12 cancelEditing];
    v13->_mediaSize.CGFloat width = v11;
    v13->_mediaSize.CGFloat height = v10;
    [(PVPanAndZoomManager *)v13 updateMediaAspectRatio];
    v13->_viewSize.CGFloat width = width;
    v13->_viewSize.CGFloat height = height;
    [(PVPanAndZoomManager *)v13 updateViewAspectRatio];
    v13->_fillMode = a5;
    [(PVPanAndZoomManager *)v13 updateMinScale];
    BOOL v14 = a6 >= 0.0000001 || a6 <= -0.0000001;
    double v15 = 3.0;
    if (v14) {
      double v15 = a6;
    }
    v13->_maxScale = v15;
    [(PVPanAndZoomManager *)v13 updateMaxScale];
    v13->_skipFirstSnap = 0;
    v13->_isZoomSnapEnabled = 1;
    v13->_zoomSnapScale = 1.0;
    v13->_zoomSnapThreshold = 0.01;
    snapTimer = v13->_snapTimer;
    v13->_scaleWhileSnapped = 1.0;
    v13->_snapTimer = 0;

    v13->_isTranslationDirectionLockEnabled = 0;
    v13->_translationDirectionLockThreshold = 5.0;
  }
  return v13;
}

- (void)beginEditingTransform:(PVTransformAnimationInfo *)a3 transformType:(int)a4 updateOtherWorkingTransforms:(BOOL)a5
{
  BOOL v5 = a5;
  -[PVPanAndZoomManager setIsEditingTransform:type:](self, "setIsEditingTransform:type:", 1);
  switch(a4)
  {
    case 2:
      long long v12 = *(_OWORD *)&a3->time.value;
      long long v13 = *(_OWORD *)&a3->time.epoch;
      long long v14 = *(_OWORD *)&a3->translation.y;
      self->_workingTransformRotate.rotation = a3->rotation;
      *(_OWORD *)&self->_workingTransformRotate.translation.y = v14;
      *(_OWORD *)&self->_workingTransformRotate.time.epoch = v13;
      *(_OWORD *)&self->_workingTransformRotate.time.value = v12;
      break;
    case 1:
      long long v15 = *(_OWORD *)&a3->time.value;
      long long v16 = *(_OWORD *)&a3->time.epoch;
      long long v17 = *(_OWORD *)&a3->translation.y;
      self->_workingTransformScale.rotation = a3->rotation;
      *(_OWORD *)&self->_workingTransformScale.time.epoch = v16;
      *(_OWORD *)&self->_workingTransformScale.translation.y = v17;
      *(_OWORD *)&self->_workingTransformScale.time.value = v15;
      if (v5) {
        self->_workingTransformTranslate.scale = self->_workingTransformScale.scale;
      }
      if (self->_isEditingTranslate) {
        self->_workingTransformScale.translation = self->_workingTransformTranslate.translation;
      }
      self->_skipFirstSnap = vabdd_f64(self->_workingTransformScale.scale, self->_zoomSnapScale) <= self->_zoomSnapThreshold;
      [(PVPanAndZoomManager *)self cancelSnapTimer];
      break;
    case 0:
      long long v9 = *(_OWORD *)&a3->time.value;
      long long v10 = *(_OWORD *)&a3->time.epoch;
      long long v11 = *(_OWORD *)&a3->translation.y;
      self->_workingTransformTranslate.rotation = a3->rotation;
      *(_OWORD *)&self->_workingTransformTranslate.translation.y = v11;
      *(_OWORD *)&self->_workingTransformTranslate.time.epoch = v10;
      *(_OWORD *)&self->_workingTransformTranslate.time.value = v9;
      if (v5) {
        self->_workingTransformScale.translation = self->_workingTransformTranslate.translation;
      }
      if (self->_isEditingScale) {
        self->_workingTransformTranslate.scale = self->_workingTransformScale.scale;
      }
      break;
  }
}

- (PVTransformAnimationInfo)endEditingTransformForType:(SEL)a3
{
  result = (PVTransformAnimationInfo *)[(PVPanAndZoomManager *)self setIsEditingTransform:0 type:*(void *)&a4];
  if (a4 == 2)
  {
    if (!self->_disableRotation)
    {
      long long v10 = *(_OWORD *)&self->_workingTransformRotate.time.epoch;
      *(_OWORD *)&retstr->time.value = *(_OWORD *)&self->_workingTransformRotate.time.value;
      *(_OWORD *)&retstr->time.epoch = v10;
      *(_OWORD *)&retstr->translation.y = *(_OWORD *)&self->_workingTransformRotate.translation.y;
      double rotation = self->_workingTransformRotate.rotation;
LABEL_17:
      retstr->double rotation = rotation;
      return result;
    }
  }
  else if (a4 == 1)
  {
    if (!self->_disableScale)
    {
      result = (PVTransformAnimationInfo *)[(PVPanAndZoomManager *)self cancelSnapTimer];
      if (self->_isEditingTranslate) {
        self->_workingTransformTranslate.scale = self->_workingTransformScale.scale;
      }
      long long v11 = *(_OWORD *)&self->_workingTransformScale.time.epoch;
      *(_OWORD *)&retstr->time.value = *(_OWORD *)&self->_workingTransformScale.time.value;
      *(_OWORD *)&retstr->time.epoch = v11;
      *(_OWORD *)&retstr->translation.y = *(_OWORD *)&self->_workingTransformScale.translation.y;
      double rotation = self->_workingTransformScale.rotation;
      goto LABEL_17;
    }
  }
  else if (!a4 && !self->_disableTranslation)
  {
    if (self->_isEditingScale) {
      self->_workingTransformScale.translation = self->_workingTransformTranslate.translation;
    }
    long long v8 = *(_OWORD *)&self->_workingTransformTranslate.time.epoch;
    *(_OWORD *)&retstr->time.value = *(_OWORD *)&self->_workingTransformTranslate.time.value;
    *(_OWORD *)&retstr->time.epoch = v8;
    *(_OWORD *)&retstr->translation.y = *(_OWORD *)&self->_workingTransformTranslate.translation.y;
    double rotation = self->_workingTransformTranslate.rotation;
    goto LABEL_17;
  }

  PVTransformAnimationInfoIdentity((uint64_t)retstr);
  return result;
}

- (void)cancelEditing
{
  [(PVPanAndZoomManager *)self cancelSnapTimer];
  *(_WORD *)&self->_isEditingTranslate = 0;
  self->_isEditingRotate = 0;
  PVTransformAnimationInfoIdentity((uint64_t)&v6);
  long long v3 = v7;
  *(_OWORD *)&self->_workingTransformTranslate.time.value = v6;
  *(_OWORD *)&self->_workingTransformTranslate.time.epoch = v3;
  *(_OWORD *)&self->_workingTransformTranslate.translation.y = v8;
  self->_workingTransformTranslate.double rotation = v9;
  PVTransformAnimationInfoIdentity((uint64_t)&v6);
  long long v4 = v7;
  *(_OWORD *)&self->_workingTransformScale.time.value = v6;
  *(_OWORD *)&self->_workingTransformScale.time.epoch = v4;
  *(_OWORD *)&self->_workingTransformScale.translation.y = v8;
  self->_workingTransformScale.double rotation = v9;
  PVTransformAnimationInfoIdentity((uint64_t)&v6);
  long long v5 = v7;
  *(_OWORD *)&self->_workingTransformRotate.time.value = v6;
  *(_OWORD *)&self->_workingTransformRotate.time.epoch = v5;
  *(_OWORD *)&self->_workingTransformRotate.translation.y = v8;
  self->_workingTransformRotate.double rotation = v9;
}

- (PVTransformAnimationInfo)updateTranslation:(SEL)a3 outNeedsUpdate:(CGPoint)a4
{
  char v17 = 0;
  if (a5) {
    *a5 = 0;
  }
  if (self->_disableTranslation) {
    goto LABEL_4;
  }
  if (!self->_isEditingTranslate)
  {
    NSLog(&cfstr_Pvpanandzoomma.isa, a3, a4.x, a4.y);
LABEL_4:
    PVTransformAnimationInfoIdentity((uint64_t)retstr);
    return result;
  }
  if (self->_isZoomSnapEnabled && self->_snapTimer) {
    a4 = *(CGPoint *)*(void *)&MEMORY[0x1E4F1DAD8];
  }
  if (self->_isTranslationDirectionLockEnabled)
  {
    double v9 = fabs(a4.x);
    double v10 = fabs(a4.y);
    double translationDirectionLockThreshold = self->_translationDirectionLockThreshold;
    if (v10 <= v9 * translationDirectionLockThreshold)
    {
      if (v9 > v10 * translationDirectionLockThreshold) {
        a4.y = 0.0;
      }
    }
    else
    {
      a4.x = 0.0;
    }
  }
  if (self->_isEditingScale) {
    self->_workingTransformTranslate.scale = self->_workingTransformScale.scale;
  }
  result = (PVTransformAnimationInfo *)objc_msgSend((id)objc_opt_class(), "adjustPositionToKeepMediaInViewBounds:scale:minScale:mediaAspectRatio:viewAspectRatio:fillMode:outNeedsUpdate:", self->_fillMode, &v17, a4.x + self->_workingTransformTranslate.translation.x, a4.y + self->_workingTransformTranslate.translation.y, self->_workingTransformTranslate.scale, self->_minScale, self->_mediaAspectRatio, self->_viewAspectRatio);
  if (!v17
    && (self->_workingTransformTranslate.translation.x == v12
      ? (BOOL v14 = self->_workingTransformTranslate.translation.y == v13)
      : (BOOL v14 = 0),
        v14))
  {
    BOOL v15 = 0;
  }
  else
  {
    if (self->_isEditingScale) {
      self->_workingTransformTranslate.scale = self->_workingTransformScale.scale;
    }
    self->_workingTransformTranslate.translation.x = v12;
    self->_workingTransformTranslate.translation.y = v13;
    BOOL v15 = 1;
  }
  if (a5) {
    *a5 = v15;
  }
  long long v16 = *(_OWORD *)&self->_workingTransformTranslate.time.epoch;
  *(_OWORD *)&retstr->time.value = *(_OWORD *)&self->_workingTransformTranslate.time.value;
  *(_OWORD *)&retstr->time.epoch = v16;
  *(_OWORD *)&retstr->translation.y = *(_OWORD *)&self->_workingTransformTranslate.translation.y;
  retstr->double rotation = self->_workingTransformTranslate.rotation;
  return result;
}

- (PVTransformAnimationInfo)updateScale:(SEL)a3 normalizedLocationInView:(double)a4 outNeedsUpdate:(CGPoint)a5
{
  double y = a5.y;
  double x = a5.x;
  double v9 = self;
  if (a6) {
    *a6 = 0;
  }
  if (BYTE3(self[4].time.epoch)) {
    goto LABEL_4;
  }
  if (!BYTE1(self[3].time.timescale))
  {
    NSLog(&cfstr_Pvpanandzoomma_0.isa, a3, a4);
LABEL_4:
    PVTransformAnimationInfoIdentity((uint64_t)retstr);
    return self;
  }
  double rotation = self[1].rotation;
  double v12 = rotation * a4;
  double scale = self[3].scale;
  double v14 = fmax(v12, self[3].translation.y);
  if (LOBYTE(self[3].time.timescale)) {
    *(_OWORD *)&self[1].translation.double y = *(_OWORD *)&self->translation.y;
  }
  double v15 = fmin(v14, scale);
  if (LOBYTE(self[4].time.epoch))
  {
    if (*(void *)&self[4].time.timescale)
    {
      if (v15 <= self[4].rotation + 1.0)
      {
        double v19 = v15 * *(double *)&self[4].time.value;
        *(double *)&self[4].time.value = v19;
        double v15 = rotation;
        if (v19 <= 0.75)
        {
          self = (PVTransformAnimationInfo *)[(PVTransformAnimationInfo *)self cancelSnapTimer];
          double v15 = 1.0 - (v9[4].rotation + v9[4].rotation);
        }
      }
      else
      {
        self = (PVTransformAnimationInfo *)[(PVTransformAnimationInfo *)self cancelSnapTimer];
      }
    }
    else
    {
      double v16 = self[4].scale;
      if (v15 < v16)
      {
        double v17 = self[4].rotation;
        if (vabdd_f64(rotation, v16) <= v17 || rotation >= v16 + v17)
        {
          if (!LOBYTE(self[3].rotation))
          {
            uint64_t v24 = [MEMORY[0x1E4F1CB00] scheduledTimerWithTimeInterval:self target:sel_onSnapTimer_ selector:0 userInfo:0 repeats:1.0];
            v25 = *(void **)&v9[4].time.timescale;
            *(void *)&v9[4].time.timedouble scale = v24;

            *(double *)&v9[4].time.value = v16;
            v9[1].double rotation = v16;
            if (fabs(v9[4].scale + -1.0) < 0.0001)
            {
              float64x2_t v26 = *(float64x2_t *)&v9[3].time.epoch;
              int8x8_t v27 = (int8x8_t)0x100000001;
              if (fabs(vsubq_f64(v26, (float64x2_t)vdupq_laneq_s64((int64x2_t)v26, 1)).f64[0]) >= 0.0001)
              {
                switch(LODWORD(v9[4].translation.x))
                {
                  case 0:
                  case 4:
                  case 5:
                  case 6:
                  case 7:
                  case 8:
                  case 9:
                  case 0xA:
                  case 0xB:
                  case 0xC:
                  case 0xD:
                    int8x8_t v28 = (int8x8_t)1;
                    break;
                  case 1:
                    int64x2_t v29 = vcgtq_f64((float64x2_t)vextq_s8((int8x16_t)v26, (int8x16_t)v26, 8uLL), v26);
                    goto LABEL_47;
                  case 2:
                    int64x2_t v29 = vcgtq_f64(v26, (float64x2_t)vextq_s8((int8x16_t)v26, (int8x16_t)v26, 8uLL));
LABEL_47:
                    int8x8_t v28 = (int8x8_t)vmovn_s64(v29);
                    break;
                  case 3:
                    int8x8_t v28 = (int8x8_t)0x100000001;
                    break;
                  case 0xE:
                    int8x8_t v28 = (int8x8_t)0x100000000;
                    break;
                  default:
                    int8x8_t v28 = 0;
                    break;
                }
                int8x8_t v27 = vand_s8(v28, (int8x8_t)0x100000001);
              }
              if (v27.i32[0]) {
                v9[1].translation.double y = 0.0;
              }
              if (v27.i32[1]) {
                v9[1].double scale = 0.0;
              }
            }
            goto LABEL_25;
          }
          LOBYTE(self[3].rotation) = 0;
          double v15 = v16 - (v17 + v17);
        }
      }
    }
  }
  double v16 = v15;
  if (vabdd_f64(rotation, v15) >= 0.0001)
  {
LABEL_25:
    double v20 = v9[1].translation.y;
    double v21 = v9[1].scale;
    memset(v30, 0, 24);
    self = (PVTransformAnimationInfo *)objc_opt_class();
    if (self) {
      self = (PVTransformAnimationInfo *)-[PVTransformAnimationInfo transformAnimInfoForScale:atNormalizedLocationInView:minScale:currentScale:currentTranslation:mediaAspectRatio:viewAspectRatio:fillMode:outNeedsUpdate:](self, "transformAnimInfoForScale:atNormalizedLocationInView:minScale:currentScale:currentTranslation:mediaAspectRatio:viewAspectRatio:fillMode:outNeedsUpdate:", LODWORD(v9[4].translation.x), 0, v16, x, y, v9[3].translation.y, rotation, v20, v21, *(double *)&v9[3].time.epoch, *(void *)&v9[3].translation.x);
    }
    else {
      memset(v30, 0, 24);
    }
    v9[1].double rotation = 0.0;
    *(_OWORD *)&v9[1].translation.double y = *(_OWORD *)((char *)v30 + 8);
    if (LOBYTE(v9[3].time.timescale))
    {
      v9->double rotation = 0.0;
      *(_OWORD *)&v9->translation.double y = *(_OWORD *)((char *)v30 + 8);
    }
    BOOL v22 = 1;
    goto LABEL_32;
  }
  BOOL v22 = 0;
LABEL_32:
  if (a6) {
    *a6 = v22;
  }
  CGPoint translation = v9[1].translation;
  *(_OWORD *)&retstr->time.value = *(_OWORD *)&v9[1].time.timescale;
  *(CGPoint *)&retstr->time.epoch = translation;
  *(_OWORD *)&retstr->translation.double y = *(_OWORD *)&v9[1].scale;
  *(void *)&retstr->double rotation = v9[2].time.value;
  return self;
}

- (PVTransformAnimationInfo)updateRotation:(SEL)a3 normalizedLocationInView:(double)a4 outNeedsUpdate:(CGPoint)a5
{
  if (a6) {
    *a6 = 0;
  }
  if (BYTE4(self[4].time.epoch)) {
    goto LABEL_4;
  }
  if (!BYTE2(self[3].time.timescale))
  {
    NSLog(&cfstr_Pvpanandzoomma_1.isa, a3, a4, a5.x, a5.y);
LABEL_4:
    PVTransformAnimationInfoIdentity((uint64_t)retstr);
    return self;
  }
  if (a6) {
    *a6 = 0;
  }
  CGPoint translation = self[2].translation;
  *(_OWORD *)&retstr->time.value = *(_OWORD *)&self[2].time.timescale;
  *(CGPoint *)&retstr->time.epoch = translation;
  *(_OWORD *)&retstr->translation.double y = *(_OWORD *)&self[2].scale;
  *(void *)&retstr->double rotation = self[3].time.value;
  return self;
}

- (void)onSnapTimer:(id)a3
{
  self->_workingTransformScale.double scale = 1.0 - (self->_zoomSnapThreshold + self->_zoomSnapThreshold);
  [(PVPanAndZoomManager *)self cancelSnapTimer];
}

- (void)cancelSnapTimer
{
  [(NSTimer *)self->_snapTimer invalidate];
  snapTimer = self->_snapTimer;
  self->_snapTimer = 0;
}

- (void)setMediaSize:(CGSize)a3
{
  if (self->_mediaSize.width != a3.width || self->_mediaSize.height != a3.height)
  {
    self->_mediaSize = a3;
    [(PVPanAndZoomManager *)self updateMediaAspectRatio];
    [(PVPanAndZoomManager *)self updateMinScale];
    [(PVPanAndZoomManager *)self updateMaxScale];
  }
}

- (void)updateMediaAspectRatio
{
  double height = self->_mediaSize.height;
  if (height <= -0.0000001 || (CGFloat v3 = 1.0, height >= 0.0000001)) {
    CGFloat v3 = self->_mediaSize.width / height;
  }
  self->_mediaAspectRatio = v3;
}

- (void)setViewSize:(CGSize)a3
{
  if (self->_viewSize.width != a3.width || self->_viewSize.height != a3.height)
  {
    self->_viewSize = a3;
    [(PVPanAndZoomManager *)self updateViewAspectRatio];
    [(PVPanAndZoomManager *)self updateMinScale];
    [(PVPanAndZoomManager *)self updateMaxScale];
  }
}

- (void)updateViewAspectRatio
{
  double height = self->_viewSize.height;
  if (height <= -0.0000001 || (CGFloat v3 = 1.0, height >= 0.0000001)) {
    CGFloat v3 = self->_viewSize.width / height;
  }
  self->_viewAspectRatio = v3;
}

- (void)setFillMode:(int)a3
{
  if (self->_fillMode != a3)
  {
    self->_fillMode = a3;
    [(PVPanAndZoomManager *)self updateMinScale];
    [(PVPanAndZoomManager *)self updateMaxScale];
  }
}

- (void)setMaxScale:(double)a3
{
  if (self->_maxScale != a3)
  {
    self->_maxScale = a3;
    [(PVPanAndZoomManager *)self updateMaxScale];
  }
}

- (void)updateMinScale
{
  [(id)objc_opt_class() calculateMinScaleForMediaAspectRatio:self->_fillMode viewAspectRatio:self->_mediaAspectRatio fillMode:self->_viewAspectRatio];
  self->_minScale = v3;
}

- (void)updateMaxScale
{
  [(id)objc_opt_class() calculateMaxScale:self->_fillMode forMediaAspectRatio:self->_maxScale viewAspectRatio:self->_mediaAspectRatio fillMode:self->_viewAspectRatio];
  self->_adjustedMaxScale = v3;
}

- (BOOL)isEditing
{
  return self->_isEditingTranslate || self->_isEditingScale || self->_isEditingRotate;
}

- (BOOL)isEditingTransformType:(int)a3
{
  if (a3 <= 2) {
    char v3 = *(&self->_isEditingTranslate + a3);
  }
  return v3 & 1;
}

- (void)setIsEditingTransform:(BOOL)a3 type:(int)a4
{
  if (a4 <= 2) {
    *(&self->_isEditingTranslate + a4) = a3;
  }
}

+ (PVTransformAnimationInfo)transformAnimInfoForScale:(SEL)a3 atNormalizedLocationInView:(double)a4 minScale:(CGPoint)a5 currentScale:(double)a6 currentTranslation:(double)a7 mediaAspectRatio:(CGPoint)a8 viewAspectRatio:(double)a9 fillMode:(double)a10 outNeedsUpdate:(int)a11
{
  uint64_t v13 = *(void *)&a11;
  double y = a8.y;
  double x = a8.x;
  double v30 = a5.y;
  double v18 = a5.x;
  retstr->double rotation = 0.0;
  *(_OWORD *)&retstr->time.epoch = 0u;
  *(_OWORD *)&retstr->translation.double y = 0u;
  *(_OWORD *)&retstr->time.value = 0u;
  PVTransformAnimationInfoIdentity((uint64_t)retstr);
  double v22 = 1.0;
  double v23 = a10;
  switch((int)v13)
  {
    case 0:
      break;
    case 1:
      if (a10 <= 1.0)
      {
        if (a9 < a10) {
          double v22 = a10 / a9;
        }
      }
      else
      {
        double v22 = a10 / a9;
        if (a10 / a9 < 1.0) {
          double v22 = 1.0;
        }
      }
      goto LABEL_14;
    case 2:
      double v22 = a10 / a9;
      if (a10 / a9 > 1.0) {
        double v22 = 1.0;
      }
LABEL_14:
      double v23 = v22 * a9;
      break;
    case 3:
      double v23 = a10;
      break;
    default:
      if (v13 == 13)
      {
        double v22 = a10 / a9;
        double v23 = a10;
      }
      else
      {
        double v23 = a9;
      }
      break;
  }
  CGFloat v24 = a4 * a7 * v23;
  CGFloat v25 = a4 * a7 * v22;
  CGFloat v26 = v18 + -0.5;
  CGAffineTransformMakeScale(&v31, a4 / a7, a4 / a7);
  memset(&v32, 0, sizeof(v32));
  CGAffineTransformMakeTranslation(&t1, -v26, -(0.5 - v30));
  CGAffineTransform t2 = v31;
  CGAffineTransformConcat(&v35, &t1, &t2);
  CGAffineTransformMakeTranslation(&t2, v26, 0.5 - v30);
  CGAffineTransformConcat(&v32, &v35, &t2);
  CGAffineTransform v35 = v32;
  v36.origin.double x = x + v24 * -0.5;
  v36.origin.double y = v25 * -0.5 - y;
  v36.size.CGFloat width = v24;
  v36.size.double height = v25;
  CGRect v37 = CGRectApplyAffineTransform(v36, &v35);
  retstr->translation.double x = v37.origin.x + v37.size.width * 0.5;
  retstr->translation.double y = -(v37.origin.y + v37.size.height * 0.5);
  retstr->double scale = a4;
  result = (PVTransformAnimationInfo *)objc_msgSend(a2, "adjustPositionToKeepMediaInViewBounds:scale:minScale:mediaAspectRatio:viewAspectRatio:fillMode:outNeedsUpdate:", v13, a12);
  retstr->translation.double x = v28;
  retstr->translation.double y = v29;
  return result;
}

+ (CGPoint)adjustPositionToKeepMediaInViewBounds:(CGPoint)a3 scale:(double)a4 minScale:(double)a5 mediaAspectRatio:(double)a6 viewAspectRatio:(double)a7 fillMode:(int)a8 outNeedsUpdate:(BOOL *)a9
{
  double y = a3.y;
  double x = a3.x;
  objc_msgSend(a1, "maximumNormalizedPositionForScale:minScale:position:mediaAspectRatio:viewAspectRatio:fillMode:", *(void *)&a8, a4, a5, a3.x, a3.y, a6, a7);
  double v14 = fabs(x);
  double v15 = fabs(v12);
  double v16 = fabs(y);
  double v17 = fabs(v13);
  if (a9)
  {
    BOOL v18 = v16 > v17;
    if (v14 > v15) {
      BOOL v18 = 1;
    }
    *a9 = v18;
  }
  if (v16 <= v17) {
    double v13 = y;
  }
  if (v14 <= v15) {
    double v12 = x;
  }
  result.double y = v13;
  result.double x = v12;
  return result;
}

+ (CGPoint)maximumNormalizedPositionForScale:(double)a3 minScale:(double)a4 position:(CGPoint)a5 mediaAspectRatio:(double)a6 viewAspectRatio:(double)a7 fillMode:(int)a8
{
  double y = a5.y;
  double v12 = 1.0;
  if (a7 <= 1.0)
  {
    if (a6 < a7) {
      double v12 = a7 / a6;
    }
  }
  else
  {
    double v12 = a7 / a6;
    if (a7 / a6 < 1.0) {
      double v12 = 1.0;
    }
  }
  double v13 = a7;
  switch(a8)
  {
    case 0:
      goto LABEL_15;
    case 1:
      double v14 = 1.0;
      if (a7 <= 1.0)
      {
        if (a6 < a7) {
          double v14 = a7 / a6;
        }
      }
      else
      {
        double v14 = a7 / a6;
        if (a7 / a6 < 1.0) {
          double v14 = 1.0;
        }
      }
      goto LABEL_14;
    case 2:
      double v14 = a7 / a6;
      if (a7 / a6 > 1.0) {
        double v14 = 1.0;
      }
LABEL_14:
      double v13 = v14 * a6;
      goto LABEL_15;
    case 3:
      goto LABEL_11;
    default:
      double v13 = a6;
      if (a8 == 13) {
LABEL_11:
      }
        double v13 = a7;
LABEL_15:
      int v15 = 1;
      int v16 = 1;
      if (vabdd_f64(a6, a7) >= 0.0001)
      {
        switch(a8)
        {
          case 0:
          case 4:
          case 5:
          case 6:
          case 7:
          case 8:
          case 9:
          case 10:
          case 11:
          case 12:
          case 13:
            BOOL v17 = 0;
            BOOL v18 = 1;
            break;
          case 1:
            BOOL v18 = a6 < a7;
            BOOL v17 = a6 > a7;
            break;
          case 2:
            BOOL v18 = a6 > a7;
            BOOL v17 = a6 < a7;
            break;
          case 3:
            BOOL v18 = 1;
            goto LABEL_33;
          case 14:
            BOOL v18 = 0;
LABEL_33:
            BOOL v17 = 1;
            break;
          default:
            BOOL v18 = 0;
            BOOL v17 = 0;
            break;
        }
        int v15 = v18;
        int v16 = v17;
      }
      int v27 = v16;
      double v19 = v13 / (v12 * a6) * a3;
      if (v15) {
        double v20 = a3;
      }
      else {
        double v20 = v13 / (v12 * a6) * a3;
      }
      [a1 maximumNormalizedPositionInAxisForScale:v15 != 0 minScale:a5.x < 0.0 isMediaAxisNormal:v20 isPositionBelowZero:a4];
      double v22 = v21;
      if (v27) {
        double v23 = a3;
      }
      else {
        double v23 = v19;
      }
      [a1 maximumNormalizedPositionInAxisForScale:v27 != 0 minScale:y < 0.0 isMediaAxisNormal:v23 isPositionBelowZero:a4];
      double v25 = v24;
      double v26 = v22;
      result.double y = v25;
      result.double x = v26;
      return result;
  }
}

+ (double)maximumNormalizedPositionInAxisForScale:(double)a3 minScale:(double)a4 isMediaAxisNormal:(BOOL)a5 isPositionBelowZero:(BOOL)a6
{
  if (a5) {
    a4 = 1.0;
  }
  double v6 = vabdd_f64(a3, a4) / a4;
  double v7 = 2.0;
  if (a6) {
    double v7 = -2.0;
  }
  return v6 / v7;
}

+ (double)calculateMinScaleForMediaAspectRatio:(double)a3 viewAspectRatio:(double)a4 fillMode:(int)a5
{
  double v5 = 1.0;
  if (vabdd_f64(a3, a4) >= 0.0001 && (a3 <= -0.0000001 || a3 >= 0.0000001) && (a4 <= -0.0000001 || a4 >= 0.0000001))
  {
    double v6 = a4;
    switch(a5)
    {
      case 0:
      case 3:
        goto LABEL_22;
      case 1:
        double v7 = 1.0;
        if (a4 <= 1.0)
        {
          if (a3 < a4) {
            double v7 = a4 / a3;
          }
        }
        else
        {
          double v7 = a4 / a3;
          if (a4 / a3 < 1.0) {
            double v7 = 1.0;
          }
        }
        goto LABEL_21;
      case 2:
        double v7 = a4 / a3;
        if (a4 / a3 > 1.0) {
          double v7 = 1.0;
        }
LABEL_21:
        double v6 = v7 * a3;
        goto LABEL_22;
      default:
        if (a5 == 13)
        {
          double v8 = a4 / a3;
          double v9 = 1.0;
          if (v8 <= 1.0) {
            double v9 = v8;
          }
          double v5 = v9 / v8;
        }
        else
        {
          double v6 = a3;
LABEL_22:
          double v10 = a4 / a3;
          if (v10 > 1.0) {
            double v10 = 1.0;
          }
          double v5 = v10 * a3 / v6;
        }
        break;
    }
  }
  return v5;
}

+ (double)calculateMaxScale:(double)result forMediaAspectRatio:(double)a4 viewAspectRatio:(double)a5 fillMode:(int)a6
{
  if (vabdd_f64(a4, a5) >= 0.0001 && (a4 <= -0.0000001 || a4 >= 0.0000001) && (a5 <= -0.0000001 || a5 >= 0.0000001))
  {
    double v6 = 1.0;
    double v7 = a5;
    switch(a6)
    {
      case 0:
        break;
      case 1:
        if (a5 <= 1.0)
        {
          if (a4 < a5) {
            double v6 = a5 / a4;
          }
        }
        else
        {
          double v6 = a5 / a4;
          if (a5 / a4 < 1.0) {
            double v6 = 1.0;
          }
        }
        goto LABEL_19;
      case 2:
        double v6 = a5 / a4;
        if (a5 / a4 > 1.0) {
          double v6 = 1.0;
        }
LABEL_19:
        double v7 = v6 * a4;
        break;
      case 3:
        double v7 = a5;
        break;
      default:
        double v7 = a4;
        if (a6 == 13)
        {
          double v7 = a5;
          double v6 = a5 / a4;
        }
        break;
    }
    double v8 = 1.0;
    if (a5 <= 1.0)
    {
      if (a4 < a5) {
        double v8 = a5 / a4;
      }
    }
    else
    {
      double v8 = a5 / a4;
      if (a5 / a4 < 1.0) {
        double v8 = 1.0;
      }
    }
    double v9 = v8 * a4 / v7;
    if (a6 == 13) {
      double v9 = v8 / v6;
    }
    return v9 * result;
  }
  return result;
}

- (CGSize)mediaSize
{
  double width = self->_mediaSize.width;
  double height = self->_mediaSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (CGSize)viewSize
{
  double width = self->_viewSize.width;
  double height = self->_viewSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (int)fillMode
{
  return self->_fillMode;
}

- (double)maxScale
{
  return self->_maxScale;
}

- (double)zoomSnapScale
{
  return self->_zoomSnapScale;
}

- (void)setZoomSnapScale:(double)a3
{
  self->_zoomSnapScale = a3;
}

- (BOOL)isZoomSnapEnabled
{
  return self->_isZoomSnapEnabled;
}

- (void)setIsZoomSnapEnabled:(BOOL)a3
{
  self->_isZoomSnapEnabled = a3;
}

- (double)zoomSnapThreshold
{
  return self->_zoomSnapThreshold;
}

- (void)setZoomSnapThreshold:(double)a3
{
  self->_zoomSnapThreshold = a3;
}

- (BOOL)isTranslationDirectionLockEnabled
{
  return self->_isTranslationDirectionLockEnabled;
}

- (void)setIsTranslationDirectionLockEnabled:(BOOL)a3
{
  self->_isTranslationDirectionLockEnabled = a3;
}

- (double)translationDirectionLockThreshold
{
  return self->_translationDirectionLockThreshold;
}

- (void)setTranslationDirectionLockThreshold:(double)a3
{
  self->_double translationDirectionLockThreshold = a3;
}

- (BOOL)disableTranslation
{
  return self->_disableTranslation;
}

- (void)setDisableTranslation:(BOOL)a3
{
  self->_disableTranslation = a3;
}

- (BOOL)disableScale
{
  return self->_disableScale;
}

- (void)setDisableScale:(BOOL)a3
{
  self->_disableScale = a3;
}

- (BOOL)disableRotation
{
  return self->_disableRotation;
}

- (void)setDisableRotation:(BOOL)a3
{
  self->_disableRotation = a3;
}

- (void).cxx_destruct
{
}

@end