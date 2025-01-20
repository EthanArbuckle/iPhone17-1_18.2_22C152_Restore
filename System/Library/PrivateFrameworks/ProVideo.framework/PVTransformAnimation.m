@interface PVTransformAnimation
+ (BOOL)getTransformInfoFromAnimation:(id)a3 atLocalTime:(id *)a4 outInfo:(PVTransformAnimationInfo *)a5;
+ (BOOL)getTransformInfoFromAnimation:(id)a3 atLocalTime:(id *)a4 renderSize:(CGSize)a5 contentMode:(int)a6 invertY:(BOOL)a7 outInfo:(PVTransformAnimationInfo *)a8;
+ (BOOL)getTransformInfoFromAnimation:(id)a3 atTime:(id *)a4 outInfo:(PVTransformAnimationInfo *)a5;
+ (BOOL)getTransformInfoFromAnimation:(id)a3 atTime:(id *)a4 renderSize:(CGSize)a5 contentMode:(int)a6 invertY:(BOOL)a7 outInfo:(PVTransformAnimationInfo *)a8;
+ (BOOL)supportsSecureCoding;
- ($202A6A048D39AE170264FF71A65A9479)presentationTimeRange;
- (BOOL)isEqual:(id)a3;
- (CGSize)basisForRenderSize:(CGSize)a3 contentMode:(int)a4;
- (CGSize)basisForRenderSize:(CGSize)result contentMode:(int)a4 invertY:(BOOL)a5;
- (NSArray)animationData;
- (PVTransformAnimation)initWithAnimation:(id)a3;
- (PVTransformAnimation)initWithAnimation:(id)a3 liveTransform:(PVTransformAnimationInfo *)a4 presentationTimeRange:(id *)a5;
- (PVTransformAnimation)initWithAnimation:(id)a3 simplify:(BOOL)a4 tolerance:(double)a5 smoothness:(unsigned int)a6;
- (PVTransformAnimation)initWithAnimationInfo:(PVTransformAnimationInfo *)a3;
- (PVTransformAnimation)initWithCoder:(id)a3;
- (PVTransformAnimation)initWithLiveTransform:(PVTransformAnimationInfo *)a3;
- (PVTransformAnimationInfo)transformInfoAtLocalTime:(SEL)a3;
- (PVTransformAnimationInfo)transformInfoAtTime:(SEL)a3;
- (double)aspectRatio;
- (id)animationInfoFromData:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dataFromAnimationInfo:(id)a3;
- (id)description;
- (unint64_t)hash;
- (void)_commonInit:(id)a3 liveTransform:(PVTransformAnimationInfo *)a4 presentationTimeRange:(id *)a5;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)setAspectRatio:(double)a3;
- (void)setPresentationTimeRange:(id *)a3;
@end

@implementation PVTransformAnimation

- (PVTransformAnimation)initWithAnimation:(id)a3 simplify:(BOOL)a4 tolerance:(double)a5 smoothness:(unsigned int)a6
{
  BOOL v6 = a4;
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id obj = a3;
  v13.receiver = self;
  v13.super_class = (Class)PVTransformAnimation;
  v10 = [(PVTransformAnimation *)&v13 init];
  if (v10)
  {
    if (v6 && [obj count]) {
      operator new();
    }
    long long v8 = *(_OWORD *)(MEMORY[0x1E4F1FA20] + 16);
    v12[0] = *MEMORY[0x1E4F1FA20];
    v12[1] = v8;
    v12[2] = *(_OWORD *)(MEMORY[0x1E4F1FA20] + 32);
    -[PVTransformAnimation _commonInit:liveTransform:presentationTimeRange:](v10, "_commonInit:liveTransform:presentationTimeRange:", obj, 0, v12, v10);
  }

  return v10;
}

- (PVTransformAnimation)initWithAnimationInfo:(PVTransformAnimationInfo *)a3
{
  v12[1] = *MEMORY[0x1E4F143B8];
  long long v4 = *(_OWORD *)&a3->time.epoch;
  v10[0] = *(_OWORD *)&a3->time.value;
  v10[1] = v4;
  v10[2] = *(_OWORD *)&a3->translation.y;
  double rotation = a3->rotation;
  v5 = [MEMORY[0x1E4F29238] valueWithPVTransformAnimationInfo:v10];
  BOOL v6 = [PVTransformAnimation alloc];
  v12[0] = v5;
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:1];
  long long v8 = [(PVTransformAnimation *)v6 initWithAnimation:v7];

  return v8;
}

- (PVTransformAnimation)initWithAnimation:(id)a3
{
  return [(PVTransformAnimation *)self initWithAnimation:a3 simplify:0 tolerance:0 smoothness:4.0];
}

- (PVTransformAnimation)initWithLiveTransform:(PVTransformAnimationInfo *)a3
{
  v9.receiver = self;
  v9.super_class = (Class)PVTransformAnimation;
  long long v4 = [(PVTransformAnimation *)&v9 init];
  v5 = v4;
  if (v4)
  {
    long long v6 = *(_OWORD *)(MEMORY[0x1E4F1FA20] + 16);
    v8[0] = *MEMORY[0x1E4F1FA20];
    v8[1] = v6;
    v8[2] = *(_OWORD *)(MEMORY[0x1E4F1FA20] + 32);
    [(PVTransformAnimation *)v4 _commonInit:0 liveTransform:a3 presentationTimeRange:v8];
  }
  return v5;
}

- (PVTransformAnimation)initWithAnimation:(id)a3 liveTransform:(PVTransformAnimationInfo *)a4 presentationTimeRange:(id *)a5
{
  id v8 = a3;
  if (a4) {
    objc_super v9 = [(PVTransformAnimation *)self initWithLiveTransform:a4];
  }
  else {
    objc_super v9 = [(PVTransformAnimation *)self initWithAnimation:v8];
  }
  v10 = v9;
  if (v9)
  {
    long long v11 = *(_OWORD *)&a5->var0.var0;
    long long v12 = *(_OWORD *)&a5->var1.var1;
    *(_OWORD *)&v9->_presentationTimeRange.start.epoch = *(_OWORD *)&a5->var0.var3;
    *(_OWORD *)&v9->_presentationTimeRange.duration.timescale = v12;
    *(_OWORD *)&v9->_presentationTimeRange.start.value = v11;
  }

  return v10;
}

- (void)_commonInit:(id)a3 liveTransform:(PVTransformAnimationInfo *)a4 presentationTimeRange:(id *)a5
{
  objc_storeStrong((id *)&self->_animationData, a3);
  self->_liveTransform = a4;
  long long v8 = *(_OWORD *)&a5->var0.var0;
  long long v9 = *(_OWORD *)&a5->var1.var1;
  *(_OWORD *)&self->_presentationTimeRange.start.epoch = *(_OWORD *)&a5->var0.var3;
  *(_OWORD *)&self->_presentationTimeRange.duration.timescale = v9;
  *(_OWORD *)&self->_presentationTimeRange.start.value = v8;
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)PVTransformAnimation;
  [(PVTransformAnimation *)&v2 dealloc];
}

- (PVTransformAnimationInfo)transformInfoAtTime:(SEL)a3
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  retstr->translation.x = 0.0;
  retstr->translation.y = 0.0;
  *(_OWORD *)&retstr->scale = xmmword_1B7E733D0;
  retstr->CMTime time = ($95D729B680665BEAEFA1D6FCA8238556)*a4;
  uint64_t v5 = *(void *)&self->time.timescale;
  if (v5)
  {
    long long v6 = *(_OWORD *)(v5 + 16);
    *(_OWORD *)&retstr->time.value = *(_OWORD *)v5;
    *(_OWORD *)&retstr->time.epoch = v6;
    *(_OWORD *)&retstr->translation.y = *(_OWORD *)(v5 + 32);
    retstr->double rotation = *(double *)(v5 + 48);
    return self;
  }
  long long v8 = self;
  p_epoch = &self->time.epoch;
  uint64_t v10 = [self->time.epoch count];
  long long v11 = [(id)*p_epoch firstObject];
  v24 = v11;
  v26 = [(id)*p_epoch lastObject];
  if (v11)
  {
    [v11 PVTransformAnimationInfoValue];
  }
  else
  {
    double v47 = 0.0;
    long long v46 = 0u;
    memset(v45, 0, sizeof(v45));
  }
  long long v52 = *(_OWORD *)v45;
  long long v53 = *(_OWORD *)&v45[16];
  long long v54 = v46;
  double v55 = v47;
  CMTime time1 = *(CMTime *)v45;
  CMTime time2 = *(CMTime *)*(void *)&MEMORY[0x1E4F1FA48];
  int32_t v12 = CMTimeCompare(&time1, &time2);
  p_y = (_OWORD *)&v8->translation.y;
  if ((BYTE4(v8->scale) & 1) != 0
    && (v8[1].time.flags & 1) != 0
    && !v8[1].time.epoch
    && (v8[1].time.value & 0x8000000000000000) == 0)
  {
    *(_OWORD *)&lhs.value = v52;
    lhs.epoch = v53;
    *(_OWORD *)&rhs.value = *p_y;
    rhs.epoch = *(void *)&v8->rotation;
    CMTimeAdd((CMTime *)v45, &lhs, &rhs);
    long long v52 = *(_OWORD *)v45;
    *(void *)&long long v53 = *(void *)&v45[16];
  }
  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  id obj = (id)v8->time.epoch;
  uint64_t v13 = [obj countByEnumeratingWithState:&v37 objects:v56 count:16];
  if (!v13)
  {
    uint64_t v14 = 0;
    goto LABEL_45;
  }
  int v22 = v12;
  uint64_t v14 = 0;
  uint64_t v15 = *(void *)v38;
  while (2)
  {
    for (uint64_t i = 0; i != v13; ++i)
    {
      if (*(void *)v38 != v15) {
        objc_enumerationMutation(obj);
      }
      v17 = *(void **)(*((void *)&v37 + 1) + 8 * i);
      if (v17)
      {
        [*(id *)(*((void *)&v37 + 1) + 8 * i) PVTransformAnimationInfoValue];
      }
      else
      {
        double v47 = 0.0;
        long long v46 = 0u;
        memset(v45, 0, sizeof(v45));
      }
      long long v18 = *(_OWORD *)&v45[16];
      *(_OWORD *)&retstr->time.value = *(_OWORD *)v45;
      *(_OWORD *)&retstr->time.epoch = v18;
      *(_OWORD *)&retstr->translation.y = v46;
      retstr->double rotation = v47;
      if ((BYTE4(v8->scale) & 1) != 0
        && (v8[1].time.flags & 1) != 0
        && !v8[1].time.epoch
        && (v8[1].time.value & 0x8000000000000000) == 0)
      {
        CMTime time = (CMTime)retstr->time;
        *(_OWORD *)&v35.value = *p_y;
        v35.epoch = *(void *)&v8->rotation;
        CMTimeAdd((CMTime *)v45, &time, &v35);
        *(_OWORD *)&retstr->time.value = *(_OWORD *)v45;
        retstr->time.epoch = *(void *)&v45[16];
      }
      if (v10 == 1)
      {
        uint64_t v14 = 0;
        *(_OWORD *)&retstr->time.value = *(_OWORD *)&a4->var0;
        retstr->time.epoch = a4->var3;
LABEL_44:
        long long v11 = v24;
        goto LABEL_45;
      }
      if (v17 == v26) {
        goto LABEL_44;
      }
      CMTime v34 = (CMTime)*a4;
      *(_OWORD *)&v33.value = v52;
      v33.epoch = v53;
      if (CMTimeCompare(&v34, &v33) < 0)
      {
        if (v22 >= 1)
        {
          long long v20 = *MEMORY[0x1E4F1FA48];
          *(_OWORD *)&v45[16] = *(unint64_t *)(MEMORY[0x1E4F1FA48] + 16);
          retstr->translation.y = 0.0;
          long long v21 = *(_OWORD *)&v45[16];
          *(_OWORD *)&retstr->time.value = v20;
          *(_OWORD *)&retstr->time.epoch = v21;
          *(_OWORD *)&retstr->scale = xmmword_1B7E733D0;
        }
        goto LABEL_44;
      }
      v19 = objc_msgSend((id)v8->time.epoch, "objectAtIndex:", objc_msgSend((id)v8->time.epoch, "indexOfObject:", v17) + 1);

      uint64_t v14 = v19;
      if (v19)
      {
        [v19 PVTransformAnimationInfoValue];
      }
      else
      {
        double v47 = 0.0;
        long long v46 = 0u;
        memset(v45, 0, sizeof(v45));
      }
      long long v48 = *(_OWORD *)v45;
      long long v49 = *(_OWORD *)&v45[16];
      long long v50 = v46;
      double v51 = v47;
      if ((BYTE4(v8->scale) & 1) != 0
        && (v8[1].time.flags & 1) != 0
        && !v8[1].time.epoch
        && (v8[1].time.value & 0x8000000000000000) == 0)
      {
        *(_OWORD *)&v32.value = v48;
        v32.epoch = v49;
        *(_OWORD *)&v31.value = *p_y;
        v31.epoch = *(void *)&v8->rotation;
        CMTimeAdd((CMTime *)v45, &v32, &v31);
        long long v48 = *(_OWORD *)v45;
        *(void *)&long long v49 = *(void *)&v45[16];
      }
      CMTime v30 = (CMTime)*a4;
      CMTime v29 = (CMTime)retstr->time;
      if ((CMTimeCompare(&v30, &v29) & 0x80000000) == 0)
      {
        CMTime v28 = (CMTime)*a4;
        *(_OWORD *)&v27.value = v48;
        v27.epoch = v49;
        if (CMTimeCompare(&v28, &v27) < 0) {
          goto LABEL_44;
        }
      }
    }
    uint64_t v13 = [obj countByEnumeratingWithState:&v37 objects:v56 count:16];
    long long v11 = v24;
    if (v13) {
      continue;
    }
    break;
  }
LABEL_45:

  return self;
}

- (PVTransformAnimationInfo)transformInfoAtLocalTime:(SEL)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  retstr->translation.x = 0.0;
  retstr->translation.y = 0.0;
  *(_OWORD *)&retstr->scale = xmmword_1B7E733D0;
  retstr->CMTime time = ($95D729B680665BEAEFA1D6FCA8238556)*a4;
  uint64_t v5 = *(void *)&self->time.timescale;
  if (v5)
  {
    long long v6 = *(_OWORD *)(v5 + 16);
    *(_OWORD *)&retstr->time.value = *(_OWORD *)v5;
    *(_OWORD *)&retstr->time.epoch = v6;
    *(_OWORD *)&retstr->translation.y = *(_OWORD *)(v5 + 32);
    retstr->double rotation = *(double *)(v5 + 48);
  }
  else
  {
    long long v8 = self;
    uint64_t v9 = [self->time.epoch count];
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    id v10 = (id)v8->time.epoch;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v28 objects:v32 count:16];
    if (v11)
    {
      uint64_t v12 = *(void *)v29;
      while (2)
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v29 != v12) {
            objc_enumerationMutation(v10);
          }
          uint64_t v14 = *(void **)(*((void *)&v28 + 1) + 8 * i);
          if (v14)
          {
            [*(id *)(*((void *)&v28 + 1) + 8 * i) PVTransformAnimationInfoValue];
          }
          else
          {
            double v27 = 0.0;
            long long v25 = 0u;
            long long v26 = 0u;
            long long v24 = 0u;
          }
          long long v15 = v25;
          *(_OWORD *)&retstr->time.value = v24;
          *(_OWORD *)&retstr->time.epoch = v15;
          *(_OWORD *)&retstr->translation.y = v26;
          retstr->double rotation = v27;
          if (v9 == 1) {
            goto LABEL_19;
          }
          CMTime time1 = (CMTime)retstr->time;
          CMTime time2 = (CMTime)*a4;
          if (!CMTimeCompare(&time1, &time2)) {
            goto LABEL_20;
          }
          CMTime time = (CMTime)retstr->time;
          CMTime v20 = (CMTime)*a4;
          if (CMTimeCompare(&time, &v20) >= 1)
          {
            v16 = [(id)v8->time.epoch firstObject];
            BOOL v17 = v14 == v16;

            if (!v17) {
              goto LABEL_20;
            }
            long long v18 = *MEMORY[0x1E4F1FA48];
            long long v25 = *(unint64_t *)(MEMORY[0x1E4F1FA48] + 16);
            retstr->translation.y = 0.0;
            long long v19 = v25;
            *(_OWORD *)&retstr->time.value = v18;
            *(_OWORD *)&retstr->time.epoch = v19;
            *(_OWORD *)&retstr->scale = xmmword_1B7E733D0;
LABEL_19:
            *(_OWORD *)&retstr->time.value = *(_OWORD *)&a4->var0;
            retstr->time.epoch = a4->var3;
            goto LABEL_20;
          }
        }
        uint64_t v11 = [v10 countByEnumeratingWithState:&v28 objects:v32 count:16];
        if (v11) {
          continue;
        }
        break;
      }
    }
LABEL_20:
  }
  return self;
}

+ (BOOL)getTransformInfoFromAnimation:(id)a3 atTime:(id *)a4 outInfo:(PVTransformAnimationInfo *)a5
{
  id v7 = a3;
  long long v8 = v7;
  long long v24 = *MEMORY[0x1E4F1FA48];
  int64_t v25 = *(void *)(MEMORY[0x1E4F1FA48] + 16);
  if (v7)
  {
    long long v16 = *(_OWORD *)&a4->var0;
    int64_t var3 = a4->var3;
    [v7 transformInfoAtTime:&v16];
    long long v24 = v18;
    int64_t v25 = v19;
    CGFloat v10 = v20;
    CGFloat v9 = v21;
    double v11 = v22;
    double v12 = v23;
    char v13 = 1;
    if (v20 > -0.0000001 && v20 < 0.0000001 && v21 > -0.0000001 && v21 < 0.0000001 && fabs(v22 + -1.0) < 0.0001)
    {
      BOOL v14 = v23 > -0.0000001;
      if (v23 >= 0.0000001) {
        BOOL v14 = 0;
      }
      char v13 = !v14;
    }
  }
  else
  {
    char v13 = 0;
    double v11 = 1.0;
    double v12 = 0.0;
    CGFloat v9 = 0.0;
    CGFloat v10 = 0.0;
  }
  if (a5)
  {
    *(_OWORD *)&a5->time.value = v24;
    a5->time.epoch = v25;
    a5->translation.x = v10;
    a5->translation.y = v9;
    a5->scale = v11;
    a5->double rotation = v12;
  }

  return v13 & 1;
}

+ (BOOL)getTransformInfoFromAnimation:(id)a3 atLocalTime:(id *)a4 outInfo:(PVTransformAnimationInfo *)a5
{
  id v7 = a3;
  long long v8 = v7;
  long long v24 = *MEMORY[0x1E4F1FA48];
  int64_t v25 = *(void *)(MEMORY[0x1E4F1FA48] + 16);
  if (v7)
  {
    long long v16 = *(_OWORD *)&a4->var0;
    int64_t var3 = a4->var3;
    [v7 transformInfoAtLocalTime:&v16];
    long long v24 = v18;
    int64_t v25 = v19;
    CGFloat v10 = v20;
    CGFloat v9 = v21;
    double v11 = v22;
    double v12 = v23;
    char v13 = 1;
    if (v20 > -0.0000001 && v20 < 0.0000001 && v21 > -0.0000001 && v21 < 0.0000001 && fabs(v22 + -1.0) < 0.0001)
    {
      BOOL v14 = v23 > -0.0000001;
      if (v23 >= 0.0000001) {
        BOOL v14 = 0;
      }
      char v13 = !v14;
    }
  }
  else
  {
    char v13 = 0;
    double v11 = 1.0;
    double v12 = 0.0;
    CGFloat v9 = 0.0;
    CGFloat v10 = 0.0;
  }
  if (a5)
  {
    *(_OWORD *)&a5->time.value = v24;
    a5->time.epoch = v25;
    a5->translation.x = v10;
    a5->translation.y = v9;
    a5->scale = v11;
    a5->double rotation = v12;
  }

  return v13 & 1;
}

+ (BOOL)getTransformInfoFromAnimation:(id)a3 atTime:(id *)a4 renderSize:(CGSize)a5 contentMode:(int)a6 invertY:(BOOL)a7 outInfo:(PVTransformAnimationInfo *)a8
{
  BOOL v9 = a7;
  uint64_t v10 = *(void *)&a6;
  double height = a5.height;
  double width = a5.width;
  id v15 = a3;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v21 = *a4;
  char v16 = [a1 getTransformInfoFromAnimation:v15 atTime:&v21 outInfo:a8];
  char v17 = v16 ^ 1;
  if (!a8) {
    char v17 = 1;
  }
  if ((v17 & 1) == 0)
  {
    objc_msgSend(v15, "basisForRenderSize:contentMode:invertY:", v10, v9, width, height);
    v19.f64[1] = v18;
    a8->translation = (CGPoint)vmulq_f64(v19, (float64x2_t)a8->translation);
  }

  return v16;
}

+ (BOOL)getTransformInfoFromAnimation:(id)a3 atLocalTime:(id *)a4 renderSize:(CGSize)a5 contentMode:(int)a6 invertY:(BOOL)a7 outInfo:(PVTransformAnimationInfo *)a8
{
  BOOL v9 = a7;
  uint64_t v10 = *(void *)&a6;
  double height = a5.height;
  double width = a5.width;
  id v15 = a3;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v21 = *a4;
  char v16 = [a1 getTransformInfoFromAnimation:v15 atLocalTime:&v21 outInfo:a8];
  char v17 = v16 ^ 1;
  if (!a8) {
    char v17 = 1;
  }
  if ((v17 & 1) == 0)
  {
    objc_msgSend(v15, "basisForRenderSize:contentMode:invertY:", v10, v9, width, height);
    v19.f64[1] = v18;
    a8->translation = (CGPoint)vmulq_f64(v19, (float64x2_t)a8->translation);
  }

  return v16;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PVTransformAnimation)initWithCoder:(id)a3
{
  id v4 = a3;
  if (-[PVTransformAnimation initWithCoder:]::onceToken != -1) {
    dispatch_once(&-[PVTransformAnimation initWithCoder:]::onceToken, &__block_literal_global_8);
  }
  uint64_t v5 = (PVTransformAnimation *)objc_alloc_init((Class)objc_opt_class());

  if (v5)
  {
    int v6 = [v4 decodeIntForKey:@"PVTransformAnimation_CodingVersion"];
    if (v6 >= 1)
    {
      id v7 = [v4 decodeObjectOfClasses:-[PVTransformAnimation initWithCoder:]::whitelist forKey:@"PVTransformAnimation_AnimationData"];
      uint64_t v8 = [(PVTransformAnimation *)v5 animationInfoFromData:v7];
      animationData = v5->_animationData;
      v5->_animationData = (NSArray *)v8;

      uint64_t v10 = (void *)MEMORY[0x1E4F1CAD0];
      uint64_t v11 = objc_opt_class();
      uint64_t v12 = objc_opt_class();
      uint64_t v13 = objc_opt_class();
      BOOL v14 = objc_msgSend(v10, "setWithObjects:", v11, v12, v13, objc_opt_class(), 0);
      id v22 = 0;
      CFDictionaryRef v15 = [v4 decodeTopLevelObjectOfClasses:v14 forKey:@"PVTransformAnimation_PresentationTimeRange" error:&v22];
      id v16 = v22;

      if (v15)
      {
        CMTimeRangeMakeFromDictionary(&v21, v15);
        long long v17 = *(_OWORD *)&v21.duration.timescale;
        long long v18 = *(_OWORD *)&v21.start.epoch;
        *(_OWORD *)&v5->_presentationTimeRange.start.value = *(_OWORD *)&v21.start.value;
        *(_OWORD *)&v5->_presentationTimeRange.start.epoch = v18;
        *(_OWORD *)&v5->_presentationTimeRange.duration.timescale = v17;
      }

      if (v6 >= 2)
      {
        [v4 decodeDoubleForKey:@"PVTransformAnimation_AspectRatio"];
        v5->_aspectRatio = v19;
      }
    }
  }

  return v5;
}

void __38__PVTransformAnimation_initWithCoder___block_invoke()
{
  v4[2] = *MEMORY[0x1E4F143B8];
  v0 = (void *)MEMORY[0x1E4F1CAD0];
  v4[0] = objc_opt_class();
  v4[1] = objc_opt_class();
  v1 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:2];
  uint64_t v2 = [v0 setWithArray:v1];
  v3 = (void *)-[PVTransformAnimation initWithCoder:]::whitelist;
  -[PVTransformAnimation initWithCoder:]::whitelist = v2;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  [v4 encodeInteger:2 forKey:@"PVTransformAnimation_CodingVersion"];
  uint64_t v5 = [(PVTransformAnimation *)self dataFromAnimationInfo:self->_animationData];
  [v4 encodeObject:v5 forKey:@"PVTransformAnimation_AnimationData"];

  long long v6 = *(_OWORD *)&self->_presentationTimeRange.start.epoch;
  *(_OWORD *)&v8.start.value = *(_OWORD *)&self->_presentationTimeRange.start.value;
  *(_OWORD *)&v8.start.epoch = v6;
  *(_OWORD *)&v8.duration.timescale = *(_OWORD *)&self->_presentationTimeRange.duration.timescale;
  CFDictionaryRef v7 = CMTimeRangeCopyAsDictionary(&v8, (CFAllocatorRef)*MEMORY[0x1E4F1CF80]);
  [v4 encodeObject:v7 forKey:@"PVTransformAnimation_PresentationTimeRange"];
  [v4 encodeDouble:@"PVTransformAnimation_AspectRatio" forKey:self->_aspectRatio];
}

- (id)animationInfoFromData:(id)a3
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  double v20 = v3;
  if (v3 && [v3 count])
  {
    id v4 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v20, "count"));
    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    id obj = v20;
    uint64_t v5 = [obj countByEnumeratingWithState:&v30 objects:v35 count:16];
    if (v5)
    {
      uint64_t v6 = *(void *)v31;
      uint64_t v7 = *MEMORY[0x1E4F284E8];
      do
      {
        for (uint64_t i = 0; i != v5; ++i)
        {
          if (*(void *)v31 != v6) {
            objc_enumerationMutation(obj);
          }
          uint64_t v9 = *(void *)(*((void *)&v30 + 1) + 8 * i);
          id v10 = objc_alloc(MEMORY[0x1E4F28DC0]);
          id v29 = 0;
          uint64_t v11 = (void *)[v10 initForReadingFromData:v9 error:&v29];
          id v12 = v29;
          uint64_t v13 = (void *)MEMORY[0x1E4F1CAD0];
          v34[0] = objc_opt_class();
          v34[1] = objc_opt_class();
          v34[2] = objc_opt_class();
          BOOL v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v34 count:3];
          CFDictionaryRef v15 = [v13 setWithArray:v14];

          id v28 = 0;
          id v16 = [v11 decodeTopLevelObjectOfClasses:v15 forKey:v7 error:&v28];
          id v17 = v28;
          [v11 finishDecoding];
          uint64_t v27 = 0;
          long long v25 = 0u;
          long long v26 = 0u;
          long long v24 = 0u;
          if (v16) {
            [v16 PVTransformAnimationInfo];
          }
          v22[0] = v24;
          v22[1] = v25;
          v22[2] = v26;
          uint64_t v23 = v27;
          long long v18 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithPVTransformAnimationInfo:", v22, v20);
          [v4 addObject:v18];
        }
        uint64_t v5 = [obj countByEnumeratingWithState:&v30 objects:v35 count:16];
      }
      while (v5);
    }
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- (id)dataFromAnimationInfo:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  BOOL v14 = v3;
  if (v3 && [v3 count])
  {
    id v4 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v14, "count"));
    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id obj = v14;
    uint64_t v5 = [obj countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (v5)
    {
      uint64_t v6 = *(void *)v23;
      uint64_t v7 = *MEMORY[0x1E4F284E8];
      do
      {
        for (uint64_t i = 0; i != v5; ++i)
        {
          if (*(void *)v23 != v6) {
            objc_enumerationMutation(obj);
          }
          uint64_t v9 = *(void **)(*((void *)&v22 + 1) + 8 * i);
          uint64_t v21 = 0;
          long long v19 = 0u;
          long long v20 = 0u;
          long long v18 = 0u;
          if (v9) {
            [v9 PVTransformAnimationInfoValue];
          }
          v16[0] = v18;
          v16[1] = v19;
          v16[2] = v20;
          uint64_t v17 = v21;
          id v10 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithPVTransformAnimationInfo:", v16, v14);
          uint64_t v11 = (void *)[objc_alloc(MEMORY[0x1E4F28DB0]) initRequiringSecureCoding:1];
          [v11 encodeObject:v10 forKey:v7];
          [v11 finishEncoding];
          id v12 = [v11 encodedData];
          [v4 addObject:v12];
        }
        uint64_t v5 = [obj countByEnumeratingWithState:&v22 objects:v26 count:16];
      }
      while (v5);
    }
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  animationData = self->_animationData;
  if (animationData)
  {
    uint64_t v5 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", -[NSArray count](animationData, "count", a3));
    uint64_t v6 = self->_animationData;
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = *(void *)"";
    v16[2] = __37__PVTransformAnimation_copyWithZone___block_invoke;
    _OWORD v16[3] = &unk_1E61693F0;
    id v7 = v5;
    id v17 = v7;
    [(NSArray *)v6 enumerateObjectsUsingBlock:v16];
    uint64_t v8 = [v7 copy];

    uint64_t v9 = (void *)v8;
  }
  else
  {
    uint64_t v9 = 0;
  }
  id v10 = [PVTransformAnimation alloc];
  liveTransform = self->_liveTransform;
  long long v12 = *(_OWORD *)&self->_presentationTimeRange.start.epoch;
  v15[0] = *(_OWORD *)&self->_presentationTimeRange.start.value;
  v15[1] = v12;
  v15[2] = *(_OWORD *)&self->_presentationTimeRange.duration.timescale;
  uint64_t v13 = [(PVTransformAnimation *)v10 initWithAnimation:v9 liveTransform:liveTransform presentationTimeRange:v15];
  [(PVTransformAnimation *)self aspectRatio];
  -[PVTransformAnimation setAspectRatio:](v13, "setAspectRatio:");

  return v13;
}

void __37__PVTransformAnimation_copyWithZone___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = (id)[a2 copy];
  objc_msgSend(v2, "addObject:");
}

- (CGSize)basisForRenderSize:(CGSize)a3 contentMode:(int)a4
{
  -[PVTransformAnimation basisForRenderSize:contentMode:invertY:](self, "basisForRenderSize:contentMode:invertY:", *(void *)&a4, 0, a3.width, a3.height);
  result.double height = v5;
  result.double width = v4;
  return result;
}

- (CGSize)basisForRenderSize:(CGSize)result contentMode:(int)a4 invertY:(BOOL)a5
{
  if (a4)
  {
    if (a4 != 3)
    {
      double aspectRatio = self->_aspectRatio;
      if (aspectRatio <= -0.0000001 || aspectRatio >= 0.0000001)
      {
        if (a4 <= 2)
        {
          if (a4 == 1)
          {
            if (result.width <= result.height)
            {
              double height = result.height;
              if (result.height * aspectRatio < result.width) {
                double height = result.width / aspectRatio;
              }
            }
            else
            {
              double height = result.width / aspectRatio;
              if (result.width / aspectRatio < result.height) {
                double height = result.height;
              }
            }
            result.double width = aspectRatio * height;
            result.double height = height;
          }
          else if (a4 == 2)
          {
            double v6 = result.width / aspectRatio;
            if (v6 <= result.height) {
              result.double height = v6;
            }
            result.double width = aspectRatio * result.height;
          }
          else
          {
            result.double width = self->_aspectRatio;
            result.double height = 1.0;
          }
        }
        else if (a4 == 13)
        {
          result.double height = result.width / aspectRatio;
        }
        else
        {
          result.double width = result.height * aspectRatio;
          if (a4 != 14)
          {
            result.double width = self->_aspectRatio;
            result.double height = 1.0;
          }
        }
      }
    }
  }
  if (a5) {
    result.double height = -result.height;
  }
  return result;
}

- (BOOL)isEqual:(id)a3
{
  double v4 = (PVTransformAnimation *)a3;
  double v5 = v4;
  if (!v4) {
    goto LABEL_7;
  }
  if (self == v4)
  {
    char v12 = 1;
    goto LABEL_11;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    double v6 = v5;
    double aspectRatio = self->_aspectRatio;
    [(PVTransformAnimation *)v6 aspectRatio];
    if (vabdd_f64(aspectRatio, v8) < 0.0001
      && (long long v9 = *(_OWORD *)&self->_presentationTimeRange.start.epoch,
          *(_OWORD *)&range1.start.value = *(_OWORD *)&self->_presentationTimeRange.start.value,
          *(_OWORD *)&range1.start.epoch = v9,
          *(_OWORD *)&range1.duration.timescale = *(_OWORD *)&self->_presentationTimeRange.duration.timescale,
          [(PVTransformAnimation *)v6 presentationTimeRange],
          CMTimeRangeEqual(&range1, &v14)))
    {
      animationData = self->_animationData;
      uint64_t v11 = [(PVTransformAnimation *)v6 animationData];
      char v12 = [(NSArray *)animationData isEqualToArray:v11];
    }
    else
    {
      char v12 = 0;
    }
  }
  else
  {
LABEL_7:
    char v12 = 0;
  }
LABEL_11:

  return v12;
}

- (unint64_t)hash
{
  uint64_t v15 = 0;
  id v16 = &v15;
  uint64_t v17 = 0x2020000000;
  uint64_t v18 = 0;
  uint64_t v18 = [(NSArray *)self->_animationData hash];
  uint64_t timescale = self->_presentationTimeRange.start.timescale;
  if (timescale) {
    uint64_t v4 = ((self->_presentationTimeRange.start.value << 10) / timescale);
  }
  else {
    uint64_t v4 = 0;
  }
  double v5 = v16;
  uint64_t v6 = v16[3] ^ v4;
  _OWORD v16[3] = v6;
  uint64_t v7 = self->_presentationTimeRange.duration.timescale;
  if (v7) {
    uint64_t v8 = ((self->_presentationTimeRange.duration.value << 10) / v7);
  }
  else {
    uint64_t v8 = 0;
  }
  v5[3] = v8 ^ v6;
  long long v9 = [NSNumber numberWithDouble:self->_aspectRatio];
  uint64_t v10 = [v9 hash];
  v16[3] ^= v10;

  animationData = self->_animationData;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = *(void *)"";
  v14[2] = __28__PVTransformAnimation_hash__block_invoke;
  v14[3] = &unk_1E6169418;
  v14[4] = &v15;
  [(NSArray *)animationData enumerateObjectsUsingBlock:v14];
  unint64_t v12 = v16[3];
  _Block_object_dispose(&v15, 8);
  return v12;
}

void __28__PVTransformAnimation_hash__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) ^= [v3 hash];
}

- (id)description
{
  id v3 = objc_alloc(MEMORY[0x1E4F28E78]);
  v16.receiver = self;
  v16.super_class = (Class)PVTransformAnimation;
  uint64_t v4 = [(PVTransformAnimation *)&v16 description];
  double v5 = (void *)[v3 initWithString:v4];

  long long v6 = *(_OWORD *)&self->_presentationTimeRange.start.epoch;
  *(_OWORD *)&range.start.value = *(_OWORD *)&self->_presentationTimeRange.start.value;
  *(_OWORD *)&range.start.epoch = v6;
  *(_OWORD *)&range.duration.uint64_t timescale = *(_OWORD *)&self->_presentationTimeRange.duration.timescale;
  uint64_t v7 = (__CFString *)CMTimeRangeCopyDescription(0, &range);
  uint64_t v8 = [NSString stringWithFormat:@" presentationTimeRange = %@\n", v7];
  [v5 appendString:v8];

  long long v9 = objc_msgSend(NSString, "stringWithFormat:", @"aspectRatio = %.3f\n", *(void *)&self->_aspectRatio);
  [v5 appendString:v9];

  animationData = self->_animationData;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = *(void *)"";
  v13[2] = __35__PVTransformAnimation_description__block_invoke;
  v13[3] = &unk_1E6169440;
  id v11 = v5;
  id v14 = v11;
  [(NSArray *)animationData enumerateObjectsUsingBlock:v13];

  return v11;
}

void __35__PVTransformAnimation_description__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = v3;
  uint64_t v12 = 0;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v9 = 0u;
  if (v3) {
    [v3 PVTransformAnimationInfoValue];
  }
  double v5 = *(void **)(a1 + 32);
  v7[0] = v9;
  v7[1] = v10;
  v7[2] = v11;
  uint64_t v8 = v12;
  long long v6 = NSStringFromPVTransformAnimationInfo((uint64_t)v7, 5);
  [v5 appendString:v6];
}

- (NSArray)animationData
{
  return self->_animationData;
}

- ($202A6A048D39AE170264FF71A65A9479)presentationTimeRange
{
  long long v3 = *(_OWORD *)&self[1].var0.var0;
  *(_OWORD *)&retstr->var0.var0 = *(_OWORD *)&self->var1.var1;
  *(_OWORD *)&retstr->var0.int64_t var3 = v3;
  *(_OWORD *)&retstr->var1.var1 = *(_OWORD *)&self[1].var0.var3;
  return self;
}

- (void)setPresentationTimeRange:(id *)a3
{
  long long v3 = *(_OWORD *)&a3->var0.var0;
  long long v4 = *(_OWORD *)&a3->var1.var1;
  *(_OWORD *)&self->_presentationTimeRange.start.epoch = *(_OWORD *)&a3->var0.var3;
  *(_OWORD *)&self->_presentationTimeRange.duration.uint64_t timescale = v4;
  *(_OWORD *)&self->_presentationTimeRange.start.value = v3;
}

- (double)aspectRatio
{
  return self->_aspectRatio;
}

- (void)setAspectRatio:(double)a3
{
  self->_double aspectRatio = a3;
}

- (void).cxx_destruct
{
}

@end