@interface MCPlugParallel
+ (id)keyPathsForValuesAffectingValueForKey:(id)a3;
- (BOOL)clipsContainer;
- (BOOL)hasAbsoluteAspectRatio;
- (BOOL)hasValidWidth;
- (BOOL)isTriggered;
- (BOOL)resetsTimeOnTrigger;
- (CGPoint)position;
- (CGSize)size;
- (CGSize)sizeForParentAspectRatio:(double)a3;
- (MCContainerParallelizer)supercontainer;
- (MCPlugParallel)init;
- (MCPlugParallel)initWithImprint:(id)a3 andMontage:(id)a4;
- (NSString)idInSupercontainer;
- (double)aspectRatio;
- (double)aspectRatioForParentAspectRatio:(double)result;
- (double)height;
- (double)opacity;
- (double)positionZ;
- (double)rotation;
- (double)rotationX;
- (double)rotationY;
- (double)scale;
- (double)timeIn;
- (double)width;
- (double)xRotationAngle;
- (double)yRotationAngle;
- (double)zPosition;
- (id)description;
- (id)imprint;
- (signed)audioPriority;
- (signed)zIndex;
- (unsigned)countOfLayouts;
- (unsigned)currentLayoutIndex;
- (void)_copySelfToSnapshot:(id)a3;
- (void)demolish;
- (void)setAudioPriority:(signed __int16)a3;
- (void)setClipsContainer:(BOOL)a3;
- (void)setCurrentLayoutIndex:(unsigned __int8)a3;
- (void)setHeight:(double)a3 andAbsoluteAspectRatio:(double)a4;
- (void)setIDInSupercontainer:(id)a3;
- (void)setIsTriggered:(BOOL)a3;
- (void)setOpacity:(double)a3;
- (void)setPosition:(CGPoint)a3;
- (void)setPositionZ:(double)a3;
- (void)setResetsTimeOnTrigger:(BOOL)a3;
- (void)setRotation:(double)a3;
- (void)setRotationX:(double)a3;
- (void)setRotationY:(double)a3;
- (void)setScale:(double)a3;
- (void)setSize:(CGSize)a3;
- (void)setSupercontainer:(id)a3;
- (void)setTimeIn:(double)a3;
- (void)setWidth:(double)a3 andAbsoluteAspectRatio:(double)a4;
- (void)setXRotationAngle:(double)a3;
- (void)setYRotationAngle:(double)a3;
- (void)setZIndex:(signed __int16)a3;
- (void)setZPosition:(double)a3;
@end

@implementation MCPlugParallel

+ (id)keyPathsForValuesAffectingValueForKey:(id)a3
{
  if ([a3 isEqualToString:@"positionRotationAndSize"]) {
    return +[NSSet setWithObjects:@"position", @"zPosition", @"scale", @"size", @"rotationAngle", @"xRotationAngle", @"yRotationAngle", @"currentLayout", 0];
  }
  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS___MCPlugParallel;
  return objc_msgSendSuper2(&v6, "keyPathsForValuesAffectingValueForKey:", a3);
}

- (MCPlugParallel)init
{
  v3.receiver = self;
  v3.super_class = (Class)MCPlugParallel;
  result = [(MCPlug *)&v3 init];
  if (result) {
    result->mOpacity = 1.0;
  }
  return result;
}

- (MCPlugParallel)initWithImprint:(id)a3 andMontage:(id)a4
{
  v46.receiver = self;
  v46.super_class = (Class)MCPlugParallel;
  v5 = [(MCPlug *)&v46 initWithImprint:a3 andMontage:a4];
  if (v5)
  {
    v5->mIDInSupercontainer = (NSString *)[a3 objectForKey:@"idInSupercontainer"];
    id v6 = [a3 objectForKey:@"timeIn"];
    if (v6) {
      [v6 doubleValue];
    }
    else {
      double v7 = 0.0;
    }
    v5->mTimeIn = v7;
    id v8 = [a3 objectForKey:@"zIndex"];
    if (v8) {
      LOWORD(v8) = (unsigned __int16)[v8 unsignedIntegerValue];
    }
    v5->mZIndex = (__int16)v8;
    id v9 = [a3 objectForKey:@"audioPriority"];
    if (v9) {
      LOWORD(v9) = (unsigned __int16)[v9 unsignedIntegerValue];
    }
    v5->mAudioPriority = (__int16)v9;
    id v10 = [a3 objectForKey:@"opacity"];
    if (v10)
    {
      [v10 floatValue];
      double v12 = v11;
    }
    else
    {
      double v12 = 1.0;
    }
    v5->mOpacity = v12;
    id v13 = [a3 objectForKey:@"geometries"];
    if (v13)
    {
      v14 = v13;
      unint64_t mFlags = v5->super.mFlags;
      mGeometry = v5->mGeometry;
      unint64_t v17 = mFlags >> 28;
      if ((mFlags & 0x40) == 0)
      {
        if (!mGeometry)
        {
          unsigned int v19 = 0;
          goto LABEL_21;
        }
        unsigned int v18 = BYTE3(mFlags) & 0xF;
        if (v17 > v18)
        {
          unsigned int v19 = v18 + 1;
LABEL_21:
          v22 = (char *)malloc_type_calloc((v17 + 1), 0x30uLL, 0x1000040EED21634uLL);
          v5->mGeometry = v22;
          v5->super.unint64_t mFlags = v5->super.mFlags & 0xF0FFFFFF | (v5->super.mFlags >> 28 << 24);
          if (mGeometry)
          {
            memcpy(v22, mGeometry, 48 * v19);
            free(mGeometry);
            v22 = (char *)v5->mGeometry;
          }
          if (v19)
          {
            v23 = &v22[48 * v19 - 48];
            long long v25 = *(_OWORD *)v23;
            _Q0 = *((_OWORD *)v23 + 1);
            long long v26 = *((_OWORD *)v23 + 2);
          }
          else
          {
            long long v26 = xmmword_165840;
            __asm { FMOV            V0.2D, #2.0 }
            long long v25 = 0uLL;
          }
          unint64_t v38 = v19;
          v39 = (long long *)&v22[48 * v19 + 32];
          if (!v22) {
            goto LABEL_33;
          }
LABEL_32:
          for (unint64_t i = (HIBYTE(v5->super.mFlags) & 0xF) + 1; v38 < i; unint64_t i = 0)
          {
            *(v39 - 2) = v25;
            *(v39 - 1) = _Q0;
            ++v38;
            long long *v39 = v26;
            v39 += 3;
            if (v22) {
              goto LABEL_32;
            }
LABEL_33:
            ;
          }
        }
LABEL_44:
        v45[0] = _NSConcreteStackBlock;
        v45[1] = 3221225472;
        v45[2] = sub_131AB8;
        v45[3] = &unk_1ABA30;
        v45[4] = a3;
        v45[5] = v5;
        [v14 enumerateObjectsUsingBlock:v45];
        return v5;
      }
      if (mGeometry)
      {
        unsigned int v20 = BYTE3(mFlags) & 0xF;
        if (v17 <= v20) {
          goto LABEL_44;
        }
        unsigned int v21 = v20 + 1;
      }
      else
      {
        unsigned int v21 = 0;
      }
      v27 = (char *)malloc_type_calloc(v17 + 1, 0x48uLL, 0x1000040FF89C88EuLL);
      v5->mGeometry = v27;
      v5->super.unint64_t mFlags = v5->super.mFlags & 0xF0FFFFFF | (v5->super.mFlags >> 28 << 24) | 0x40;
      if (mGeometry)
      {
        memcpy(v27, mGeometry, 48 * v21);
        free(mGeometry);
        v27 = (char *)v5->mGeometry;
      }
      if (v21)
      {
        v28 = &v27[72 * v21 - 72];
        long long v30 = *(_OWORD *)v28;
        _Q0 = *((_OWORD *)v28 + 1);
        uint64_t v31 = *((void *)v28 + 8);
        long long v32 = *((_OWORD *)v28 + 2);
        long long v33 = *((_OWORD *)v28 + 3);
      }
      else
      {
        long long v32 = xmmword_165840;
        __asm { FMOV            V0.2D, #2.0 }
        long long v30 = 0uLL;
        uint64_t v31 = 0;
        long long v33 = 0uLL;
      }
      unint64_t v41 = v21;
      uint64_t v42 = (uint64_t)&v27[72 * v21 + 32];
      if (!v27) {
        goto LABEL_40;
      }
LABEL_39:
      for (unint64_t j = (HIBYTE(v5->super.mFlags) & 0xF) + 1; v41 < j; unint64_t j = 0)
      {
        *(_OWORD *)(v42 - 32) = v30;
        *(_OWORD *)(v42 - 16) = _Q0;
        *(void *)(v42 + 32) = v31;
        ++v41;
        *(_OWORD *)uint64_t v42 = v32;
        *(_OWORD *)(v42 + 16) = v33;
        v42 += 72;
        if (v27) {
          goto LABEL_39;
        }
LABEL_40:
        ;
      }
      goto LABEL_44;
    }
  }
  return v5;
}

- (void)demolish
{
  mGeometry = self->mGeometry;
  if (mGeometry)
  {
    free(mGeometry);
    self->mGeometry = 0;
  }

  self->mIDInSupercontainer = 0;
  self->mSupercontainer = 0;
  v4.receiver = self;
  v4.super_class = (Class)MCPlugParallel;
  [(MCPlug *)&v4 demolish];
}

- (id)imprint
{
  v40.receiver = self;
  v40.super_class = (Class)MCPlugParallel;
  id v3 = [(MCPlug *)&v40 imprint];
  objc_super v4 = v3;
  mIDInSupercontainer = self->mIDInSupercontainer;
  if (mIDInSupercontainer) {
    [v3 setObject:mIDInSupercontainer forKey:@"idInSupercontainer"];
  }
  double mTimeIn = self->mTimeIn;
  if (mTimeIn != 0.0) {
    objc_msgSend(v4, "setObject:forKey:", +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"), @"timeIn");
  }
  if (self->mZIndex) {
    objc_msgSend(v4, "setObject:forKey:", +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:"), @"zIndex");
  }
  if (self->mAudioPriority)
  {
    *(float *)&double mTimeIn = (float)self->mAudioPriority;
    objc_msgSend(v4, "setObject:forKey:", +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", mTimeIn), @"audioPriority");
  }
  double mOpacity = self->mOpacity;
  if (mOpacity != 1.0)
  {
    *(float *)&double mOpacity = mOpacity;
    objc_msgSend(v4, "setObject:forKey:", +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", mOpacity), @"opacity");
  }
  if (self->mGeometry)
  {
    id v8 = objc_alloc((Class)NSMutableArray);
    v37 = v4;
    if (self->mGeometry) {
      uint64_t v9 = (HIBYTE(self->super.mFlags) & 0xF) + 1;
    }
    else {
      uint64_t v9 = 0;
    }
    id v10 = &OBJC_IVAR___MCPlug_mFlags;
    id v39 = objc_msgSend(v8, "initWithCapacity:", v9, v37);
    uint64_t v11 = 0;
    char v12 = 0;
    unint64_t v13 = 0;
    for (uint64_t i = 32; ; i += 72)
    {
      mGeometry = self->mGeometry;
      if (mGeometry) {
        mGeometry = (void *)((*((unsigned char *)&self->super.super.super.super.isa + *v10 + 3) & 0xF) + 1);
      }
      if (v13 >= (unint64_t)mGeometry)
      {
        objc_super v4 = v38;
        if (v12) {
          [v38 setObject:v39 forKey:@"geometries"];
        }

        return v4;
      }
      id v16 = objc_alloc_init((Class)NSMutableDictionary);
      unint64_t v17 = v10;
      uint64_t v18 = *v10;
      int v19 = *(_DWORD *)((char *)&self->super.super.super.super.isa + v18);
      unsigned int v20 = (char *)self->mGeometry;
      if ((v19 & 0x40) != 0) {
        double v21 = *(double *)&v20[i - 32];
      }
      else {
        double v21 = *(double *)&v20[v11];
      }
      if (v21 != 0.0)
      {
        *(float *)&double v21 = v21;
        objc_msgSend(v16, "setObject:forKey:", +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v21), @"positionX");
        int v19 = *(_DWORD *)((char *)&self->super.super.super.super.isa + v18);
      }
      v22 = (char *)self->mGeometry;
      if ((v19 & 0x40) != 0) {
        double v23 = *(double *)&v22[i - 24];
      }
      else {
        double v23 = *(double *)&v22[v11 + 8];
      }
      if (v23 != 0.0)
      {
        *(float *)&double v23 = v23;
        objc_msgSend(v16, "setObject:forKey:", +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v23), @"positionY");
        int v19 = *(_DWORD *)((char *)&self->super.super.super.super.isa + v18);
      }
      v24 = (char *)self->mGeometry;
      if ((v19 & 0x40) != 0) {
        double v25 = *(double *)&v24[i - 16];
      }
      else {
        double v25 = *(double *)&v24[v11 + 16];
      }
      if (v25 != 2.0)
      {
        *(float *)&double v25 = v25;
        objc_msgSend(v16, "setObject:forKey:", +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v25), @"width");
        int v19 = *(_DWORD *)((char *)&self->super.super.super.super.isa + v18);
      }
      long long v26 = (char *)self->mGeometry;
      if ((v19 & 0x40) != 0) {
        double v27 = *(double *)&v26[i - 8];
      }
      else {
        double v27 = *(double *)&v26[v11 + 24];
      }
      if (v27 != 2.0)
      {
        *(float *)&double v27 = v27;
        objc_msgSend(v16, "setObject:forKey:", +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v27), @"height");
        int v19 = *(_DWORD *)((char *)&self->super.super.super.super.isa + v18);
      }
      v28 = (char *)self->mGeometry;
      if ((v19 & 0x40) != 0) {
        double v29 = *(double *)&v28[i + 8];
      }
      else {
        double v29 = *(double *)&v28[v11 + 40];
      }
      if (v29 != 1.0)
      {
        *(float *)&double v29 = v29;
        objc_msgSend(v16, "setObject:forKey:", +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v29), @"scale");
        int v19 = *(_DWORD *)((char *)&self->super.super.super.super.isa + v18);
      }
      long long v30 = (char *)self->mGeometry;
      if ((v19 & 0x40) == 0) {
        break;
      }
      double v31 = *(double *)&v30[i];
      if (v31 != 0.0) {
        goto LABEL_48;
      }
LABEL_49:
      long long v32 = (char *)self->mGeometry;
      double v33 = *(double *)&v32[i + 16];
      if (v33 != 0.0)
      {
        *(float *)&double v33 = v33;
        objc_msgSend(v16, "setObject:forKey:", +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v33), @"positionZ");
        long long v32 = (char *)self->mGeometry;
      }
      double v34 = *(double *)&v32[i + 24];
      if (v34 != 0.0)
      {
        *(float *)&double v34 = v34;
        objc_msgSend(v16, "setObject:forKey:", +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v34), @"rotationX");
        long long v32 = (char *)self->mGeometry;
      }
      double v35 = *(double *)&v32[i + 32];
      if (v35 != 0.0)
      {
        *(float *)&double v35 = v35;
        objc_msgSend(v16, "setObject:forKey:", +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v35), @"rotationY");
      }
LABEL_55:
      [v39 addObject:v16];
      v12 |= [v16 count] != 0;

      ++v13;
      v11 += 48;
      id v10 = v17;
    }
    double v31 = *(double *)&v30[v11 + 32];
    if (v31 == 0.0) {
      goto LABEL_55;
    }
LABEL_48:
    *(float *)&double v31 = v31;
    objc_msgSend(v16, "setObject:forKey:", +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v31), @"rotationZ");
    if ((*((unsigned char *)&self->super.super.super.super.isa + v18) & 0x40) == 0) {
      goto LABEL_55;
    }
    goto LABEL_49;
  }
  return v4;
}

- (void)setTimeIn:(double)a3
{
  self->double mTimeIn = a3;
}

- (void)setOpacity:(double)a3
{
  self->double mOpacity = a3;
}

- (CGPoint)position
{
  mGeometry = (double *)self->mGeometry;
  if (mGeometry)
  {
    unint64_t mFlags = self->super.mFlags;
    unint64_t v4 = mFlags >> 28;
    unsigned int v5 = BYTE3(mFlags) & 0xF;
    if ((mFlags & 0x40) != 0)
    {
      if (self->super.mFlags >> 28 <= v5) {
        mGeometry += 9 * v4;
      }
    }
    else if (self->super.mFlags >> 28 <= v5)
    {
      mGeometry += 6 * v4;
    }
  }
  else
  {
    mGeometry = (double *)&CGPointZero;
  }
  double v6 = *mGeometry;
  double v7 = mGeometry[1];
  result.y = v7;
  result.x = v6;
  return result;
}

- (void)setPosition:(CGPoint)a3
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  mGeometrCGFloat y = (char *)self->mGeometry;
  if (!mGeometry && a3.x == 0.0 && a3.y == 0.0) {
    return;
  }
  unint64_t mFlags = self->super.mFlags;
  unint64_t v8 = mFlags >> 28;
  if ((mFlags & 0x40) != 0)
  {
    if (mGeometry)
    {
      unsigned int v11 = BYTE3(mFlags) & 0xF;
      if (v8 <= v11) {
        goto LABEL_36;
      }
      unsigned int v12 = v11 + 1;
    }
    else
    {
      unsigned int v12 = 0;
    }
    unint64_t v13 = (char *)malloc_type_calloc(v8 + 1, 0x48uLL, 0x1000040FF89C88EuLL);
    self->mGeometrCGFloat y = v13;
    self->super.unint64_t mFlags = self->super.mFlags & 0xF0FFFFFF | (self->super.mFlags >> 28 << 24) | 0x40;
    if (mGeometry)
    {
      memcpy(v13, mGeometry, 48 * v12);
      free(mGeometry);
      unint64_t v13 = (char *)self->mGeometry;
    }
    if (v12)
    {
      uint64_t v18 = &v13[72 * v12 - 72];
      long long v20 = *(_OWORD *)v18;
      _Q0 = *((_OWORD *)v18 + 1);
      uint64_t v21 = *((void *)v18 + 8);
      long long v22 = *((_OWORD *)v18 + 2);
      long long v23 = *((_OWORD *)v18 + 3);
    }
    else
    {
      long long v22 = xmmword_165840;
      __asm { FMOV            V0.2D, #2.0 }
      long long v20 = 0uLL;
      uint64_t v21 = 0;
      long long v23 = 0uLL;
    }
    unint64_t v31 = v12;
    uint64_t v32 = (uint64_t)&v13[72 * v12 + 32];
    if (!v13) {
      goto LABEL_31;
    }
LABEL_30:
    for (unint64_t i = (HIBYTE(self->super.mFlags) & 0xF) + 1; v31 < i; unint64_t i = 0)
    {
      *(_OWORD *)(v32 - 32) = v20;
      *(_OWORD *)(v32 - 16) = _Q0;
      *(void *)(v32 + 32) = v21;
      ++v31;
      *(_OWORD *)uint64_t v32 = v22;
      *(_OWORD *)(v32 + 16) = v23;
      v32 += 72;
      if (v13) {
        goto LABEL_30;
      }
LABEL_31:
      ;
    }
    goto LABEL_35;
  }
  if (!mGeometry)
  {
    unsigned int v10 = 0;
    goto LABEL_12;
  }
  unsigned int v9 = BYTE3(mFlags) & 0xF;
  if (v8 > v9)
  {
    unsigned int v10 = v9 + 1;
LABEL_12:
    unint64_t v13 = (char *)malloc_type_calloc((v8 + 1), 0x30uLL, 0x1000040EED21634uLL);
    self->mGeometrCGFloat y = v13;
    self->super.unint64_t mFlags = self->super.mFlags & 0xF0FFFFFF | (self->super.mFlags >> 28 << 24);
    if (mGeometry)
    {
      memcpy(v13, mGeometry, 48 * v10);
      free(mGeometry);
      unint64_t v13 = (char *)self->mGeometry;
    }
    if (v10)
    {
      v14 = &v13[48 * v10 - 48];
      long long v16 = *(_OWORD *)v14;
      _Q0 = *((_OWORD *)v14 + 1);
      long long v17 = *((_OWORD *)v14 + 2);
    }
    else
    {
      long long v17 = xmmword_165840;
      __asm { FMOV            V0.2D, #2.0 }
      long long v16 = 0uLL;
    }
    unint64_t v28 = v10;
    double v29 = (long long *)&v13[48 * v10 + 32];
    if (!v13) {
      goto LABEL_24;
    }
LABEL_23:
    for (unint64_t j = (HIBYTE(self->super.mFlags) & 0xF) + 1; v28 < j; unint64_t j = 0)
    {
      *(v29 - 2) = v16;
      *(v29 - 1) = _Q0;
      ++v28;
      *double v29 = v17;
      v29 += 3;
      if (v13) {
        goto LABEL_23;
      }
LABEL_24:
      ;
    }
LABEL_35:
    mGeometrCGFloat y = v13;
  }
LABEL_36:
  if ((self->super.mFlags & 0x40) != 0) {
    double v34 = (CGFloat *)&mGeometry[72 * (self->super.mFlags >> 28)];
  }
  else {
    double v34 = (CGFloat *)&mGeometry[48 * (self->super.mFlags >> 28)];
  }
  *double v34 = x;
  v34[1] = y;
}

- (CGSize)size
{
  mGeometrCGFloat y = (char *)self->mGeometry;
  if (mGeometry)
  {
    unint64_t mFlags = self->super.mFlags;
    unint64_t v4 = mFlags >> 28;
    unsigned int v5 = BYTE3(mFlags) & 0xF;
    double v6 = (double *)(mGeometry + 16);
    double v7 = (double *)(mGeometry + 24);
    unint64_t v8 = &mGeometry[48 * (self->super.mFlags >> 28)];
    unsigned int v9 = (double *)(v8 + 16);
    unsigned int v10 = (double *)(v8 + 24);
    if (self->super.mFlags >> 28 > v5)
    {
      unsigned int v10 = (double *)(mGeometry + 24);
      unsigned int v9 = (double *)(mGeometry + 16);
    }
    BOOL v11 = v4 > v5;
    unsigned int v12 = &mGeometry[72 * v4];
    unint64_t v13 = (double *)(v12 + 16);
    v14 = (double *)(v12 + 24);
    if (v11)
    {
      v14 = v7;
      unint64_t v13 = v6;
    }
    if ((mFlags & 0x40) != 0)
    {
      v15 = v13;
    }
    else
    {
      v14 = v10;
      v15 = v9;
    }
    CGFloat width = *v15;
    if (*v15 < 0.0 || (CGFloat height = *v14, *v14 < 0.0))
    {
      CGFloat width = CGSizeZero.width;
      CGFloat height = CGSizeZero.height;
      NSLog(@"Calling size on plug with absolute aspect ratio", a2);
    }
  }
  else
  {
    CGFloat height = 2.0;
    CGFloat width = 2.0;
  }
  double v18 = width;
  double v19 = height;
  result.CGFloat height = v19;
  result.CGFloat width = v18;
  return result;
}

- (void)setSize:(CGSize)a3
{
  CGFloat width = a3.width;
  mGeometrCGFloat y = (char *)self->mGeometry;
  if (mGeometry) {
    _ZF = 0;
  }
  else {
    _ZF = a3.width == 2.0;
  }
  if (_ZF && a3.height == 2.0) {
    return;
  }
  CGFloat height = a3.height;
  unint64_t mFlags = self->super.mFlags;
  unint64_t v10 = mFlags >> 28;
  if ((mFlags & 0x40) != 0)
  {
    if (mGeometry)
    {
      unsigned int v13 = BYTE3(mFlags) & 0xF;
      if (v10 <= v13) {
        goto LABEL_40;
      }
      unsigned int v14 = v13 + 1;
    }
    else
    {
      unsigned int v14 = 0;
    }
    v15 = (char *)malloc_type_calloc(v10 + 1, 0x48uLL, 0x1000040FF89C88EuLL);
    self->mGeometrCGFloat y = v15;
    self->super.unint64_t mFlags = self->super.mFlags & 0xF0FFFFFF | (self->super.mFlags >> 28 << 24) | 0x40;
    if (mGeometry)
    {
      memcpy(v15, mGeometry, 48 * v14);
      free(mGeometry);
      v15 = (char *)self->mGeometry;
    }
    if (v14)
    {
      long long v20 = &v15[72 * v14 - 72];
      long long v22 = *(_OWORD *)v20;
      _Q0 = *((_OWORD *)v20 + 1);
      uint64_t v23 = *((void *)v20 + 8);
      long long v24 = *((_OWORD *)v20 + 2);
      long long v25 = *((_OWORD *)v20 + 3);
    }
    else
    {
      long long v24 = xmmword_165840;
      __asm { FMOV            V0.2D, #2.0 }
      long long v22 = 0uLL;
      uint64_t v23 = 0;
      long long v25 = 0uLL;
    }
    unint64_t v32 = v14;
    uint64_t v33 = (uint64_t)&v15[72 * v14 + 32];
    if (!v15) {
      goto LABEL_35;
    }
LABEL_34:
    for (unint64_t i = (HIBYTE(self->super.mFlags) & 0xF) + 1; v32 < i; unint64_t i = 0)
    {
      *(_OWORD *)(v33 - 32) = v22;
      *(_OWORD *)(v33 - 16) = _Q0;
      *(void *)(v33 + 32) = v23;
      ++v32;
      *(_OWORD *)uint64_t v33 = v24;
      *(_OWORD *)(v33 + 16) = v25;
      v33 += 72;
      if (v15) {
        goto LABEL_34;
      }
LABEL_35:
      ;
    }
    goto LABEL_39;
  }
  if (!mGeometry)
  {
    unsigned int v12 = 0;
    goto LABEL_16;
  }
  unsigned int v11 = BYTE3(mFlags) & 0xF;
  if (v10 > v11)
  {
    unsigned int v12 = v11 + 1;
LABEL_16:
    v15 = (char *)malloc_type_calloc((v10 + 1), 0x30uLL, 0x1000040EED21634uLL);
    self->mGeometrCGFloat y = v15;
    self->super.unint64_t mFlags = self->super.mFlags & 0xF0FFFFFF | (self->super.mFlags >> 28 << 24);
    if (mGeometry)
    {
      memcpy(v15, mGeometry, 48 * v12);
      free(mGeometry);
      v15 = (char *)self->mGeometry;
    }
    if (v12)
    {
      long long v16 = &v15[48 * v12 - 48];
      long long v18 = *(_OWORD *)v16;
      _Q0 = *((_OWORD *)v16 + 1);
      long long v19 = *((_OWORD *)v16 + 2);
    }
    else
    {
      long long v19 = xmmword_165840;
      __asm { FMOV            V0.2D, #2.0 }
      long long v18 = 0uLL;
    }
    unint64_t v29 = v12;
    long long v30 = (long long *)&v15[48 * v12 + 32];
    if (!v15) {
      goto LABEL_28;
    }
LABEL_27:
    for (unint64_t j = (HIBYTE(self->super.mFlags) & 0xF) + 1; v29 < j; unint64_t j = 0)
    {
      *(v30 - 2) = v18;
      *(v30 - 1) = _Q0;
      ++v29;
      *long long v30 = v19;
      v30 += 3;
      if (v15) {
        goto LABEL_27;
      }
LABEL_28:
      ;
    }
LABEL_39:
    mGeometrCGFloat y = v15;
  }
LABEL_40:
  if ((self->super.mFlags & 0x40) != 0) {
    double v35 = (CGFloat *)&mGeometry[72 * (self->super.mFlags >> 28) + 16];
  }
  else {
    double v35 = (CGFloat *)&mGeometry[48 * (self->super.mFlags >> 28) + 16];
  }
  *double v35 = width;
  v35[1] = height;
}

- (BOOL)hasAbsoluteAspectRatio
{
  mGeometrCGFloat y = (char *)self->mGeometry;
  if (!mGeometry) {
    return 0;
  }
  unint64_t mFlags = self->super.mFlags;
  unint64_t v4 = mFlags >> 28;
  unsigned int v5 = BYTE3(mFlags) & 0xF;
  double v6 = (double *)(mGeometry + 16);
  double v7 = (double *)(mGeometry + 24);
  unint64_t v8 = &mGeometry[48 * (self->super.mFlags >> 28)];
  unsigned int v9 = (double *)(v8 + 16);
  unint64_t v10 = (double *)(v8 + 24);
  if (self->super.mFlags >> 28 > v5)
  {
    unsigned int v9 = (double *)(mGeometry + 16);
    unint64_t v10 = (double *)(mGeometry + 24);
  }
  BOOL v11 = v4 > v5;
  unsigned int v12 = &mGeometry[72 * v4];
  unsigned int v13 = (double *)(v12 + 16);
  unsigned int v14 = (double *)(v12 + 24);
  if (v11)
  {
    unsigned int v13 = v6;
    unsigned int v14 = v7;
  }
  if ((mFlags & 0x40) != 0) {
    v15 = v13;
  }
  else {
    v15 = v9;
  }
  if ((self->super.mFlags & 0x40) == 0) {
    unsigned int v14 = v10;
  }
  return *v14 < 0.0 || *v15 < 0.0;
}

- (BOOL)hasValidWidth
{
  mGeometrCGFloat y = (char *)self->mGeometry;
  if (!mGeometry) {
    return 1;
  }
  unint64_t mFlags = self->super.mFlags;
  unint64_t v4 = mFlags >> 28;
  unsigned int v5 = BYTE3(mFlags) & 0xF;
  double v6 = (double *)(mGeometry + 16);
  uint64_t v7 = (uint64_t)&mGeometry[48 * (self->super.mFlags >> 28) + 16];
  if (self->super.mFlags >> 28 > v5) {
    uint64_t v7 = (uint64_t)(mGeometry + 16);
  }
  unint64_t v8 = (double *)&mGeometry[72 * v4 + 16];
  if (v4 > v5) {
    unint64_t v8 = v6;
  }
  if ((mFlags & 0x40) == 0) {
    unint64_t v8 = (double *)v7;
  }
  return *v8 >= 0.0;
}

- (double)width
{
  mGeometrCGFloat y = (char *)self->mGeometry;
  if (!mGeometry) {
    return 2.0;
  }
  unint64_t mFlags = self->super.mFlags;
  unint64_t v4 = mFlags >> 28;
  unsigned int v5 = BYTE3(mFlags) & 0xF;
  double v6 = (double *)(mGeometry + 16);
  uint64_t v7 = (uint64_t)&mGeometry[48 * (self->super.mFlags >> 28) + 16];
  if (self->super.mFlags >> 28 > v5) {
    uint64_t v7 = (uint64_t)(mGeometry + 16);
  }
  unint64_t v8 = (double *)&mGeometry[72 * v4 + 16];
  if (v4 > v5) {
    unint64_t v8 = v6;
  }
  if ((mFlags & 0x40) == 0) {
    unint64_t v8 = (double *)v7;
  }
  double result = *v8;
  if (*v8 < 0.0)
  {
    NSLog(@"Calling width on plug with absolute aspect ratio and height set", a2, result);
    return 0.0;
  }
  return result;
}

- (double)height
{
  mGeometrCGFloat y = (char *)self->mGeometry;
  if (!mGeometry) {
    return 2.0;
  }
  unint64_t mFlags = self->super.mFlags;
  unint64_t v4 = mFlags >> 28;
  unsigned int v5 = BYTE3(mFlags) & 0xF;
  double v6 = (double *)(mGeometry + 24);
  uint64_t v7 = (uint64_t)&mGeometry[48 * (self->super.mFlags >> 28) + 24];
  if (self->super.mFlags >> 28 > v5) {
    uint64_t v7 = (uint64_t)(mGeometry + 24);
  }
  unint64_t v8 = (double *)&mGeometry[72 * v4 + 24];
  if (v4 > v5) {
    unint64_t v8 = v6;
  }
  if ((mFlags & 0x40) == 0) {
    unint64_t v8 = (double *)v7;
  }
  double result = *v8;
  if (*v8 < 0.0)
  {
    NSLog(@"Calling height on plug with absolute aspect ratio and width set", a2, result);
    return 0.0;
  }
  return result;
}

- (double)aspectRatio
{
  mGeometrCGFloat y = (char *)self->mGeometry;
  double result = 1.0;
  if (mGeometry)
  {
    unint64_t mFlags = self->super.mFlags;
    unint64_t v5 = mFlags >> 28;
    unsigned int v6 = BYTE3(mFlags) & 0xF;
    uint64_t v7 = (double *)(mGeometry + 16);
    unint64_t v8 = (double *)(mGeometry + 24);
    unsigned int v9 = &mGeometry[48 * (self->super.mFlags >> 28)];
    unint64_t v10 = (double *)(v9 + 16);
    BOOL v11 = (double *)(v9 + 24);
    if (self->super.mFlags >> 28 > v6)
    {
      unint64_t v10 = (double *)(mGeometry + 16);
      BOOL v11 = (double *)(mGeometry + 24);
    }
    BOOL v12 = v5 > v6;
    unsigned int v13 = &mGeometry[72 * v5];
    unsigned int v14 = (double *)(v13 + 16);
    v15 = (double *)(v13 + 24);
    if (v12)
    {
      unsigned int v14 = v7;
      v15 = v8;
    }
    if ((mFlags & 0x40) != 0) {
      long long v16 = v14;
    }
    else {
      long long v16 = v10;
    }
    if ((self->super.mFlags & 0x40) == 0) {
      v15 = v11;
    }
    double v17 = *v16;
    if (*v16 >= 0.0)
    {
      double v18 = *v15;
      if (*v15 >= 0.0)
      {
        if (*v15 > 0.0) {
          return v17 / v18;
        }
      }
      else
      {
        return -v18;
      }
    }
    else
    {
      return -v17;
    }
  }
  return result;
}

- (double)aspectRatioForParentAspectRatio:(double)result
{
  mGeometrCGFloat y = (char *)self->mGeometry;
  if (mGeometry)
  {
    unint64_t mFlags = self->super.mFlags;
    unint64_t v5 = mFlags >> 28;
    unsigned int v6 = BYTE3(mFlags) & 0xF;
    uint64_t v7 = (double *)(mGeometry + 16);
    unint64_t v8 = (double *)(mGeometry + 24);
    unsigned int v9 = &mGeometry[48 * (self->super.mFlags >> 28)];
    unint64_t v10 = (double *)(v9 + 16);
    BOOL v11 = (double *)(v9 + 24);
    if (self->super.mFlags >> 28 > v6)
    {
      unint64_t v10 = (double *)(mGeometry + 16);
      BOOL v11 = (double *)(mGeometry + 24);
    }
    BOOL v12 = v5 > v6;
    unsigned int v13 = &mGeometry[72 * v5];
    unsigned int v14 = (double *)(v13 + 16);
    v15 = (double *)(v13 + 24);
    if (v12)
    {
      unsigned int v14 = v7;
      v15 = v8;
    }
    if ((mFlags & 0x40) != 0) {
      long long v16 = v14;
    }
    else {
      long long v16 = v10;
    }
    if ((self->super.mFlags & 0x40) == 0) {
      v15 = v11;
    }
    double v17 = *v16;
    if (*v16 >= 0.0)
    {
      double v18 = *v15;
      if (*v15 >= 0.0) {
        return v17 * result / v18;
      }
      else {
        return -v18;
      }
    }
    else
    {
      return -v17;
    }
  }
  return result;
}

- (CGSize)sizeForParentAspectRatio:(double)a3
{
  mGeometrCGFloat y = (char *)self->mGeometry;
  if (mGeometry)
  {
    unint64_t mFlags = self->super.mFlags;
    unint64_t v5 = mFlags >> 28;
    unsigned int v6 = BYTE3(mFlags) & 0xF;
    uint64_t v7 = (double *)(mGeometry + 16);
    unint64_t v8 = (double *)(mGeometry + 24);
    unsigned int v9 = &mGeometry[48 * (self->super.mFlags >> 28)];
    unint64_t v10 = (double *)(v9 + 16);
    BOOL v11 = (double *)(v9 + 24);
    if (self->super.mFlags >> 28 > v6)
    {
      BOOL v11 = (double *)(mGeometry + 24);
      unint64_t v10 = (double *)(mGeometry + 16);
    }
    BOOL v12 = v5 > v6;
    unsigned int v13 = &mGeometry[72 * v5];
    unsigned int v14 = (double *)(v13 + 16);
    v15 = (double *)(v13 + 24);
    if (v12)
    {
      v15 = v8;
      unsigned int v14 = v7;
    }
    if ((mFlags & 0x40) != 0)
    {
      long long v16 = v14;
    }
    else
    {
      v15 = v11;
      long long v16 = v10;
    }
    double v17 = *v16;
    double v18 = *v15;
    if (*v16 >= 0.0)
    {
      if (v18 < 0.0) {
        double v18 = -v17 / v18 * a3;
      }
    }
    else
    {
      double v17 = -(v18 * v17) / a3;
    }
  }
  else
  {
    double v18 = 2.0;
    double v17 = 2.0;
  }
  double v19 = v17;
  result.CGFloat height = v18;
  result.CGFloat width = v19;
  return result;
}

- (void)setWidth:(double)a3 andAbsoluteAspectRatio:(double)a4
{
  unint64_t mFlags = self->super.mFlags;
  mGeometrCGFloat y = (char *)self->mGeometry;
  unint64_t v9 = mFlags >> 28;
  if ((mFlags & 0x40) != 0)
  {
    if (mGeometry)
    {
      unsigned int v12 = BYTE3(mFlags) & 0xF;
      if (v9 <= v12) {
        goto LABEL_33;
      }
      unsigned int v13 = v12 + 1;
    }
    else
    {
      unsigned int v13 = 0;
    }
    unsigned int v14 = (char *)malloc_type_calloc(v9 + 1, 0x48uLL, 0x1000040FF89C88EuLL);
    self->mGeometrCGFloat y = v14;
    self->super.unint64_t mFlags = self->super.mFlags & 0xF0FFFFFF | (self->super.mFlags >> 28 << 24) | 0x40;
    if (mGeometry)
    {
      memcpy(v14, mGeometry, 48 * v13);
      free(mGeometry);
      unsigned int v14 = (char *)self->mGeometry;
    }
    if (v13)
    {
      double v19 = &v14[72 * v13 - 72];
      long long v21 = *(_OWORD *)v19;
      _Q0 = *((_OWORD *)v19 + 1);
      uint64_t v22 = *((void *)v19 + 8);
      long long v23 = *((_OWORD *)v19 + 2);
      long long v24 = *((_OWORD *)v19 + 3);
    }
    else
    {
      long long v23 = xmmword_165840;
      __asm { FMOV            V0.2D, #2.0 }
      long long v21 = 0uLL;
      uint64_t v22 = 0;
      long long v24 = 0uLL;
    }
    unint64_t v32 = v13;
    uint64_t v33 = (uint64_t)&v14[72 * v13 + 32];
    if (!v14) {
      goto LABEL_28;
    }
LABEL_27:
    for (unint64_t i = (HIBYTE(self->super.mFlags) & 0xF) + 1; v32 < i; unint64_t i = 0)
    {
      *(_OWORD *)(v33 - 32) = v21;
      *(_OWORD *)(v33 - 16) = _Q0;
      *(void *)(v33 + 32) = v22;
      ++v32;
      *(_OWORD *)uint64_t v33 = v23;
      *(_OWORD *)(v33 + 16) = v24;
      v33 += 72;
      if (v14) {
        goto LABEL_27;
      }
LABEL_28:
      ;
    }
  }
  else
  {
    if (mGeometry)
    {
      unsigned int v10 = BYTE3(mFlags) & 0xF;
      if (v9 <= v10) {
        goto LABEL_33;
      }
      unsigned int v11 = v10 + 1;
    }
    else
    {
      unsigned int v11 = 0;
    }
    unsigned int v14 = (char *)malloc_type_calloc((v9 + 1), 0x30uLL, 0x1000040EED21634uLL);
    self->mGeometrCGFloat y = v14;
    self->super.unint64_t mFlags = self->super.mFlags & 0xF0FFFFFF | (self->super.mFlags >> 28 << 24);
    if (mGeometry)
    {
      memcpy(v14, mGeometry, 48 * v11);
      free(mGeometry);
      unsigned int v14 = (char *)self->mGeometry;
    }
    if (v11)
    {
      v15 = &v14[48 * v11 - 48];
      long long v17 = *(_OWORD *)v15;
      _Q0 = *((_OWORD *)v15 + 1);
      long long v18 = *((_OWORD *)v15 + 2);
    }
    else
    {
      long long v18 = xmmword_165840;
      __asm { FMOV            V0.2D, #2.0 }
      long long v17 = 0uLL;
    }
    unint64_t v29 = v11;
    long long v30 = (long long *)&v14[48 * v11 + 32];
    if (!v14) {
      goto LABEL_21;
    }
LABEL_20:
    for (unint64_t j = (HIBYTE(self->super.mFlags) & 0xF) + 1; v29 < j; unint64_t j = 0)
    {
      *(v30 - 2) = v17;
      *(v30 - 1) = _Q0;
      ++v29;
      *long long v30 = v18;
      v30 += 3;
      if (v14) {
        goto LABEL_20;
      }
LABEL_21:
      ;
    }
  }
  mGeometrCGFloat y = v14;
LABEL_33:
  if ((self->super.mFlags & 0x40) != 0) {
    double v35 = (double *)&mGeometry[72 * (self->super.mFlags >> 28) + 16];
  }
  else {
    double v35 = (double *)&mGeometry[48 * (self->super.mFlags >> 28) + 16];
  }
  *double v35 = a3;
  v35[1] = -a4;
}

- (void)setHeight:(double)a3 andAbsoluteAspectRatio:(double)a4
{
  unint64_t mFlags = self->super.mFlags;
  mGeometrCGFloat y = (char *)self->mGeometry;
  unint64_t v9 = mFlags >> 28;
  if ((mFlags & 0x40) != 0)
  {
    if (mGeometry)
    {
      unsigned int v12 = BYTE3(mFlags) & 0xF;
      if (v9 <= v12) {
        goto LABEL_33;
      }
      unsigned int v13 = v12 + 1;
    }
    else
    {
      unsigned int v13 = 0;
    }
    unsigned int v14 = (char *)malloc_type_calloc(v9 + 1, 0x48uLL, 0x1000040FF89C88EuLL);
    self->mGeometrCGFloat y = v14;
    self->super.unint64_t mFlags = self->super.mFlags & 0xF0FFFFFF | (self->super.mFlags >> 28 << 24) | 0x40;
    if (mGeometry)
    {
      memcpy(v14, mGeometry, 48 * v13);
      free(mGeometry);
      unsigned int v14 = (char *)self->mGeometry;
    }
    if (v13)
    {
      double v19 = &v14[72 * v13 - 72];
      long long v21 = *(_OWORD *)v19;
      _Q0 = *((_OWORD *)v19 + 1);
      uint64_t v22 = *((void *)v19 + 8);
      long long v23 = *((_OWORD *)v19 + 2);
      long long v24 = *((_OWORD *)v19 + 3);
    }
    else
    {
      long long v23 = xmmword_165840;
      __asm { FMOV            V0.2D, #2.0 }
      long long v21 = 0uLL;
      uint64_t v22 = 0;
      long long v24 = 0uLL;
    }
    unint64_t v32 = v13;
    uint64_t v33 = (uint64_t)&v14[72 * v13 + 32];
    if (!v14) {
      goto LABEL_28;
    }
LABEL_27:
    for (unint64_t i = (HIBYTE(self->super.mFlags) & 0xF) + 1; v32 < i; unint64_t i = 0)
    {
      *(_OWORD *)(v33 - 32) = v21;
      *(_OWORD *)(v33 - 16) = _Q0;
      *(void *)(v33 + 32) = v22;
      ++v32;
      *(_OWORD *)uint64_t v33 = v23;
      *(_OWORD *)(v33 + 16) = v24;
      v33 += 72;
      if (v14) {
        goto LABEL_27;
      }
LABEL_28:
      ;
    }
  }
  else
  {
    if (mGeometry)
    {
      unsigned int v10 = BYTE3(mFlags) & 0xF;
      if (v9 <= v10) {
        goto LABEL_33;
      }
      unsigned int v11 = v10 + 1;
    }
    else
    {
      unsigned int v11 = 0;
    }
    unsigned int v14 = (char *)malloc_type_calloc((v9 + 1), 0x30uLL, 0x1000040EED21634uLL);
    self->mGeometrCGFloat y = v14;
    self->super.unint64_t mFlags = self->super.mFlags & 0xF0FFFFFF | (self->super.mFlags >> 28 << 24);
    if (mGeometry)
    {
      memcpy(v14, mGeometry, 48 * v11);
      free(mGeometry);
      unsigned int v14 = (char *)self->mGeometry;
    }
    if (v11)
    {
      v15 = &v14[48 * v11 - 48];
      long long v17 = *(_OWORD *)v15;
      _Q0 = *((_OWORD *)v15 + 1);
      long long v18 = *((_OWORD *)v15 + 2);
    }
    else
    {
      long long v18 = xmmword_165840;
      __asm { FMOV            V0.2D, #2.0 }
      long long v17 = 0uLL;
    }
    unint64_t v29 = v11;
    long long v30 = (long long *)&v14[48 * v11 + 32];
    if (!v14) {
      goto LABEL_21;
    }
LABEL_20:
    for (unint64_t j = (HIBYTE(self->super.mFlags) & 0xF) + 1; v29 < j; unint64_t j = 0)
    {
      *(v30 - 2) = v17;
      *(v30 - 1) = _Q0;
      ++v29;
      *long long v30 = v18;
      v30 += 3;
      if (v14) {
        goto LABEL_20;
      }
LABEL_21:
      ;
    }
  }
  mGeometrCGFloat y = v14;
LABEL_33:
  if ((self->super.mFlags & 0x40) != 0) {
    double v35 = (double *)&mGeometry[72 * (self->super.mFlags >> 28) + 16];
  }
  else {
    double v35 = (double *)&mGeometry[48 * (self->super.mFlags >> 28) + 16];
  }
  *double v35 = -a4;
  v35[1] = a3;
}

- (double)scale
{
  mGeometrCGFloat y = (char *)self->mGeometry;
  if (!mGeometry) {
    return 1.0;
  }
  unint64_t mFlags = self->super.mFlags;
  unint64_t v4 = mFlags >> 28;
  unsigned int v5 = BYTE3(mFlags) & 0xF;
  unsigned int v6 = (double *)(mGeometry + 40);
  uint64_t v7 = (uint64_t)&mGeometry[48 * (self->super.mFlags >> 28) + 40];
  if (self->super.mFlags >> 28 > v5) {
    uint64_t v7 = (uint64_t)(mGeometry + 40);
  }
  unint64_t v8 = (double *)&mGeometry[72 * v4 + 40];
  if (v4 > v5) {
    unint64_t v8 = v6;
  }
  if ((mFlags & 0x40) == 0) {
    unint64_t v8 = (double *)v7;
  }
  return *v8;
}

- (void)setScale:(double)a3
{
  mGeometrCGFloat y = (char *)self->mGeometry;
  if (a3 == 1.0 && mGeometry == 0) {
    return;
  }
  unint64_t mFlags = self->super.mFlags;
  unint64_t v8 = mFlags >> 28;
  if ((mFlags & 0x40) != 0)
  {
    if (mGeometry)
    {
      unsigned int v11 = BYTE3(mFlags) & 0xF;
      if (v8 <= v11) {
        goto LABEL_37;
      }
      unsigned int v12 = v11 + 1;
    }
    else
    {
      unsigned int v12 = 0;
    }
    unsigned int v13 = (char *)malloc_type_calloc(v8 + 1, 0x48uLL, 0x1000040FF89C88EuLL);
    self->mGeometrCGFloat y = v13;
    self->super.unint64_t mFlags = self->super.mFlags & 0xF0FFFFFF | (self->super.mFlags >> 28 << 24) | 0x40;
    if (mGeometry)
    {
      memcpy(v13, mGeometry, 48 * v12);
      free(mGeometry);
      unsigned int v13 = (char *)self->mGeometry;
    }
    if (v12)
    {
      long long v18 = &v13[72 * v12 - 72];
      long long v20 = *(_OWORD *)v18;
      _Q0 = *((_OWORD *)v18 + 1);
      uint64_t v21 = *((void *)v18 + 8);
      long long v22 = *((_OWORD *)v18 + 2);
      long long v23 = *((_OWORD *)v18 + 3);
    }
    else
    {
      long long v22 = xmmword_165840;
      __asm { FMOV            V0.2D, #2.0 }
      long long v20 = 0uLL;
      uint64_t v21 = 0;
      long long v23 = 0uLL;
    }
    unint64_t v30 = v12;
    uint64_t v31 = (uint64_t)&v13[72 * v12 + 32];
    if (!v13) {
      goto LABEL_32;
    }
LABEL_31:
    for (unint64_t i = (HIBYTE(self->super.mFlags) & 0xF) + 1; v30 < i; unint64_t i = 0)
    {
      *(_OWORD *)(v31 - 32) = v20;
      *(_OWORD *)(v31 - 16) = _Q0;
      *(void *)(v31 + 32) = v21;
      ++v30;
      *(_OWORD *)uint64_t v31 = v22;
      *(_OWORD *)(v31 + 16) = v23;
      v31 += 72;
      if (v13) {
        goto LABEL_31;
      }
LABEL_32:
      ;
    }
    goto LABEL_36;
  }
  if (!mGeometry)
  {
    unsigned int v10 = 0;
    goto LABEL_13;
  }
  unsigned int v9 = BYTE3(mFlags) & 0xF;
  if (v8 > v9)
  {
    unsigned int v10 = v9 + 1;
LABEL_13:
    unsigned int v13 = (char *)malloc_type_calloc((v8 + 1), 0x30uLL, 0x1000040EED21634uLL);
    self->mGeometrCGFloat y = v13;
    self->super.unint64_t mFlags = self->super.mFlags & 0xF0FFFFFF | (self->super.mFlags >> 28 << 24);
    if (mGeometry)
    {
      memcpy(v13, mGeometry, 48 * v10);
      free(mGeometry);
      unsigned int v13 = (char *)self->mGeometry;
    }
    if (v10)
    {
      unsigned int v14 = &v13[48 * v10 - 48];
      long long v16 = *(_OWORD *)v14;
      _Q0 = *((_OWORD *)v14 + 1);
      long long v17 = *((_OWORD *)v14 + 2);
    }
    else
    {
      long long v17 = xmmword_165840;
      __asm { FMOV            V0.2D, #2.0 }
      long long v16 = 0uLL;
    }
    unint64_t v27 = v10;
    unint64_t v28 = (long long *)&v13[48 * v10 + 32];
    if (!v13) {
      goto LABEL_25;
    }
LABEL_24:
    for (unint64_t j = (HIBYTE(self->super.mFlags) & 0xF) + 1; v27 < j; unint64_t j = 0)
    {
      *(v28 - 2) = v16;
      *(v28 - 1) = _Q0;
      ++v27;
      long long *v28 = v17;
      v28 += 3;
      if (v13) {
        goto LABEL_24;
      }
LABEL_25:
      ;
    }
LABEL_36:
    mGeometrCGFloat y = v13;
  }
LABEL_37:
  if ((self->super.mFlags & 0x40) != 0) {
    uint64_t v33 = (double *)&mGeometry[72 * (self->super.mFlags >> 28) + 40];
  }
  else {
    uint64_t v33 = (double *)&mGeometry[48 * (self->super.mFlags >> 28) + 40];
  }
  *uint64_t v33 = a3;
}

- (double)rotation
{
  mGeometrCGFloat y = (char *)self->mGeometry;
  if (!mGeometry) {
    return 0.0;
  }
  unint64_t mFlags = self->super.mFlags;
  unint64_t v4 = mFlags >> 28;
  unsigned int v5 = BYTE3(mFlags) & 0xF;
  unsigned int v6 = (double *)(mGeometry + 32);
  uint64_t v7 = (uint64_t)&mGeometry[48 * (self->super.mFlags >> 28) + 32];
  if (self->super.mFlags >> 28 > v5) {
    uint64_t v7 = (uint64_t)(mGeometry + 32);
  }
  unint64_t v8 = (double *)&mGeometry[72 * v4 + 32];
  if (v4 > v5) {
    unint64_t v8 = v6;
  }
  if ((mFlags & 0x40) == 0) {
    unint64_t v8 = (double *)v7;
  }
  return *v8;
}

- (void)setRotation:(double)a3
{
  mGeometrCGFloat y = (char *)self->mGeometry;
  if (a3 == 0.0 && mGeometry == 0) {
    return;
  }
  unint64_t mFlags = self->super.mFlags;
  unint64_t v8 = mFlags >> 28;
  if ((mFlags & 0x40) != 0)
  {
    if (mGeometry)
    {
      unsigned int v11 = BYTE3(mFlags) & 0xF;
      if (v8 <= v11) {
        goto LABEL_37;
      }
      unsigned int v12 = v11 + 1;
    }
    else
    {
      unsigned int v12 = 0;
    }
    unsigned int v13 = (char *)malloc_type_calloc(v8 + 1, 0x48uLL, 0x1000040FF89C88EuLL);
    self->mGeometrCGFloat y = v13;
    self->super.unint64_t mFlags = self->super.mFlags & 0xF0FFFFFF | (self->super.mFlags >> 28 << 24) | 0x40;
    if (mGeometry)
    {
      memcpy(v13, mGeometry, 48 * v12);
      free(mGeometry);
      unsigned int v13 = (char *)self->mGeometry;
    }
    if (v12)
    {
      long long v18 = &v13[72 * v12 - 72];
      long long v20 = *(_OWORD *)v18;
      _Q0 = *((_OWORD *)v18 + 1);
      uint64_t v21 = *((void *)v18 + 8);
      long long v22 = *((_OWORD *)v18 + 2);
      long long v23 = *((_OWORD *)v18 + 3);
    }
    else
    {
      long long v22 = xmmword_165840;
      __asm { FMOV            V0.2D, #2.0 }
      long long v20 = 0uLL;
      uint64_t v21 = 0;
      long long v23 = 0uLL;
    }
    unint64_t v30 = v12;
    uint64_t v31 = (uint64_t)&v13[72 * v12 + 32];
    if (!v13) {
      goto LABEL_32;
    }
LABEL_31:
    for (unint64_t i = (HIBYTE(self->super.mFlags) & 0xF) + 1; v30 < i; unint64_t i = 0)
    {
      *(_OWORD *)(v31 - 32) = v20;
      *(_OWORD *)(v31 - 16) = _Q0;
      *(void *)(v31 + 32) = v21;
      ++v30;
      *(_OWORD *)uint64_t v31 = v22;
      *(_OWORD *)(v31 + 16) = v23;
      v31 += 72;
      if (v13) {
        goto LABEL_31;
      }
LABEL_32:
      ;
    }
    goto LABEL_36;
  }
  if (!mGeometry)
  {
    unsigned int v10 = 0;
    goto LABEL_13;
  }
  unsigned int v9 = BYTE3(mFlags) & 0xF;
  if (v8 > v9)
  {
    unsigned int v10 = v9 + 1;
LABEL_13:
    unsigned int v13 = (char *)malloc_type_calloc((v8 + 1), 0x30uLL, 0x1000040EED21634uLL);
    self->mGeometrCGFloat y = v13;
    self->super.unint64_t mFlags = self->super.mFlags & 0xF0FFFFFF | (self->super.mFlags >> 28 << 24);
    if (mGeometry)
    {
      memcpy(v13, mGeometry, 48 * v10);
      free(mGeometry);
      unsigned int v13 = (char *)self->mGeometry;
    }
    if (v10)
    {
      unsigned int v14 = &v13[48 * v10 - 48];
      long long v16 = *(_OWORD *)v14;
      _Q0 = *((_OWORD *)v14 + 1);
      long long v17 = *((_OWORD *)v14 + 2);
    }
    else
    {
      long long v17 = xmmword_165840;
      __asm { FMOV            V0.2D, #2.0 }
      long long v16 = 0uLL;
    }
    unint64_t v27 = v10;
    unint64_t v28 = (long long *)&v13[48 * v10 + 32];
    if (!v13) {
      goto LABEL_25;
    }
LABEL_24:
    for (unint64_t j = (HIBYTE(self->super.mFlags) & 0xF) + 1; v27 < j; unint64_t j = 0)
    {
      *(v28 - 2) = v16;
      *(v28 - 1) = _Q0;
      ++v27;
      long long *v28 = v17;
      v28 += 3;
      if (v13) {
        goto LABEL_24;
      }
LABEL_25:
      ;
    }
LABEL_36:
    mGeometrCGFloat y = v13;
  }
LABEL_37:
  if ((self->super.mFlags & 0x40) != 0) {
    uint64_t v33 = (double *)&mGeometry[72 * (self->super.mFlags >> 28) + 32];
  }
  else {
    uint64_t v33 = (double *)&mGeometry[48 * (self->super.mFlags >> 28) + 32];
  }
  *uint64_t v33 = a3;
}

- (double)positionZ
{
  double result = 0.0;
  if ((self->super.mFlags & 0x40) != 0) {
    return *((double *)self->mGeometry + 9 * (self->super.mFlags >> 28) + 6);
  }
  return result;
}

- (void)setPositionZ:(double)a3
{
  mGeometrCGFloat y = (double *)self->mGeometry;
  if (a3 != 0.0 || mGeometry != 0)
  {
    unint64_t mFlags = self->super.mFlags;
    unint64_t v8 = mFlags >> 28;
    if (mGeometry)
    {
      unsigned int v9 = BYTE3(mFlags) & 0xF;
      if ((mFlags & 0x40) != 0 && v8 <= v9)
      {
LABEL_33:
        mGeometry[9 * v8 + 6] = a3;
        return;
      }
      unsigned int v10 = v9 + 1;
      if ((mFlags & 0x40) != 0) {
        unsigned int v11 = self->mGeometry;
      }
      else {
        unsigned int v11 = 0;
      }
    }
    else
    {
      unsigned int v11 = 0;
      unsigned int v10 = 0;
    }
    unsigned int v12 = (char *)malloc_type_calloc(v8 + 1, 0x48uLL, 0x1000040FF89C88EuLL);
    self->mGeometrCGFloat y = v12;
    self->super.unint64_t mFlags = self->super.mFlags & 0xF0FFFFFF | (self->super.mFlags >> 28 << 24) | 0x40;
    if (v11)
    {
      memcpy(v12, v11, 48 * v10);
      unsigned int v13 = (double *)v11;
    }
    else
    {
      if (!mGeometry)
      {
LABEL_23:
        mGeometrCGFloat y = (double *)self->mGeometry;
        if (v10)
        {
          uint64_t v21 = &mGeometry[9 * v10 - 9];
          long long v23 = *(_OWORD *)v21;
          _Q0 = *((_OWORD *)v21 + 1);
          uint64_t v24 = *((void *)v21 + 8);
          long long v25 = *((_OWORD *)v21 + 2);
          long long v26 = *((_OWORD *)v21 + 3);
        }
        else
        {
          long long v25 = xmmword_165840;
          __asm { FMOV            V0.2D, #2.0 }
          long long v23 = 0uLL;
          uint64_t v24 = 0;
          long long v26 = 0uLL;
        }
        unint64_t v30 = v10;
        uint64_t v31 = (uint64_t)&mGeometry[9 * v10 + 4];
        if (!mGeometry) {
          goto LABEL_28;
        }
LABEL_27:
        for (unint64_t i = (HIBYTE(self->super.mFlags) & 0xF) + 1; v30 < i; unint64_t i = 0)
        {
          *(_OWORD *)(v31 - 32) = v23;
          *(_OWORD *)(v31 - 16) = _Q0;
          *(void *)(v31 + 32) = v24;
          ++v30;
          *(_OWORD *)uint64_t v31 = v25;
          *(_OWORD *)(v31 + 16) = v26;
          v31 += 72;
          if (mGeometry) {
            goto LABEL_27;
          }
LABEL_28:
          ;
        }
        LODWORD(v8) = self->super.mFlags >> 28;
        goto LABEL_33;
      }
      uint64_t v14 = 0;
      unint64_t v15 = 0;
      long long v16 = mGeometry;
      if (!v12) {
        goto LABEL_17;
      }
LABEL_16:
      for (unint64_t j = (HIBYTE(self->super.mFlags) & 0xF) + 1; v15 < j; unint64_t j = 0)
      {
        long long v18 = &v12[v14];
        long long v19 = *(_OWORD *)v16;
        long long v20 = *((_OWORD *)v16 + 2);
        *((_OWORD *)v18 + 1) = *((_OWORD *)v16 + 1);
        *((_OWORD *)v18 + 2) = v20;
        *(_OWORD *)long long v18 = v19;
        ++v15;
        unsigned int v12 = (char *)self->mGeometry;
        v14 += 72;
        v16 += 6;
        if (v12) {
          goto LABEL_16;
        }
LABEL_17:
        ;
      }
      unsigned int v13 = mGeometry;
    }
    free(v13);
    goto LABEL_23;
  }
}

- (double)rotationX
{
  double result = 0.0;
  if ((self->super.mFlags & 0x40) != 0) {
    return *((double *)self->mGeometry + 9 * (self->super.mFlags >> 28) + 7);
  }
  return result;
}

- (void)setRotationX:(double)a3
{
  mGeometrCGFloat y = (double *)self->mGeometry;
  if (a3 != 0.0 || mGeometry != 0)
  {
    unint64_t mFlags = self->super.mFlags;
    unint64_t v8 = mFlags >> 28;
    if (mGeometry)
    {
      unsigned int v9 = BYTE3(mFlags) & 0xF;
      if ((mFlags & 0x40) != 0 && v8 <= v9)
      {
LABEL_33:
        mGeometry[9 * v8 + 7] = a3;
        return;
      }
      unsigned int v10 = v9 + 1;
      if ((mFlags & 0x40) != 0) {
        unsigned int v11 = self->mGeometry;
      }
      else {
        unsigned int v11 = 0;
      }
    }
    else
    {
      unsigned int v11 = 0;
      unsigned int v10 = 0;
    }
    unsigned int v12 = (char *)malloc_type_calloc(v8 + 1, 0x48uLL, 0x1000040FF89C88EuLL);
    self->mGeometrCGFloat y = v12;
    self->super.unint64_t mFlags = self->super.mFlags & 0xF0FFFFFF | (self->super.mFlags >> 28 << 24) | 0x40;
    if (v11)
    {
      memcpy(v12, v11, 48 * v10);
      unsigned int v13 = (double *)v11;
    }
    else
    {
      if (!mGeometry)
      {
LABEL_23:
        mGeometrCGFloat y = (double *)self->mGeometry;
        if (v10)
        {
          uint64_t v21 = &mGeometry[9 * v10 - 9];
          long long v23 = *(_OWORD *)v21;
          _Q0 = *((_OWORD *)v21 + 1);
          uint64_t v24 = *((void *)v21 + 8);
          long long v25 = *((_OWORD *)v21 + 2);
          long long v26 = *((_OWORD *)v21 + 3);
        }
        else
        {
          long long v25 = xmmword_165840;
          __asm { FMOV            V0.2D, #2.0 }
          long long v23 = 0uLL;
          uint64_t v24 = 0;
          long long v26 = 0uLL;
        }
        unint64_t v30 = v10;
        uint64_t v31 = (uint64_t)&mGeometry[9 * v10 + 4];
        if (!mGeometry) {
          goto LABEL_28;
        }
LABEL_27:
        for (unint64_t i = (HIBYTE(self->super.mFlags) & 0xF) + 1; v30 < i; unint64_t i = 0)
        {
          *(_OWORD *)(v31 - 32) = v23;
          *(_OWORD *)(v31 - 16) = _Q0;
          *(void *)(v31 + 32) = v24;
          ++v30;
          *(_OWORD *)uint64_t v31 = v25;
          *(_OWORD *)(v31 + 16) = v26;
          v31 += 72;
          if (mGeometry) {
            goto LABEL_27;
          }
LABEL_28:
          ;
        }
        LODWORD(v8) = self->super.mFlags >> 28;
        goto LABEL_33;
      }
      uint64_t v14 = 0;
      unint64_t v15 = 0;
      long long v16 = mGeometry;
      if (!v12) {
        goto LABEL_17;
      }
LABEL_16:
      for (unint64_t j = (HIBYTE(self->super.mFlags) & 0xF) + 1; v15 < j; unint64_t j = 0)
      {
        long long v18 = &v12[v14];
        long long v19 = *(_OWORD *)v16;
        long long v20 = *((_OWORD *)v16 + 2);
        *((_OWORD *)v18 + 1) = *((_OWORD *)v16 + 1);
        *((_OWORD *)v18 + 2) = v20;
        *(_OWORD *)long long v18 = v19;
        ++v15;
        unsigned int v12 = (char *)self->mGeometry;
        v14 += 72;
        v16 += 6;
        if (v12) {
          goto LABEL_16;
        }
LABEL_17:
        ;
      }
      unsigned int v13 = mGeometry;
    }
    free(v13);
    goto LABEL_23;
  }
}

- (double)rotationY
{
  double result = 0.0;
  if ((self->super.mFlags & 0x40) != 0) {
    return *((double *)self->mGeometry + 9 * (self->super.mFlags >> 28) + 8);
  }
  return result;
}

- (void)setRotationY:(double)a3
{
  mGeometrCGFloat y = (double *)self->mGeometry;
  if (a3 != 0.0 || mGeometry != 0)
  {
    unint64_t mFlags = self->super.mFlags;
    unint64_t v8 = mFlags >> 28;
    if (mGeometry)
    {
      unsigned int v9 = BYTE3(mFlags) & 0xF;
      if ((mFlags & 0x40) != 0 && v8 <= v9)
      {
LABEL_33:
        mGeometry[9 * v8 + 8] = a3;
        return;
      }
      unsigned int v10 = v9 + 1;
      if ((mFlags & 0x40) != 0) {
        unsigned int v11 = self->mGeometry;
      }
      else {
        unsigned int v11 = 0;
      }
    }
    else
    {
      unsigned int v11 = 0;
      unsigned int v10 = 0;
    }
    unsigned int v12 = (char *)malloc_type_calloc(v8 + 1, 0x48uLL, 0x1000040FF89C88EuLL);
    self->mGeometrCGFloat y = v12;
    self->super.unint64_t mFlags = self->super.mFlags & 0xF0FFFFFF | (self->super.mFlags >> 28 << 24) | 0x40;
    if (v11)
    {
      memcpy(v12, v11, 48 * v10);
      unsigned int v13 = (double *)v11;
    }
    else
    {
      if (!mGeometry)
      {
LABEL_23:
        mGeometrCGFloat y = (double *)self->mGeometry;
        if (v10)
        {
          uint64_t v21 = &mGeometry[9 * v10 - 9];
          long long v23 = *(_OWORD *)v21;
          _Q0 = *((_OWORD *)v21 + 1);
          uint64_t v24 = *((void *)v21 + 8);
          long long v25 = *((_OWORD *)v21 + 2);
          long long v26 = *((_OWORD *)v21 + 3);
        }
        else
        {
          long long v25 = xmmword_165840;
          __asm { FMOV            V0.2D, #2.0 }
          long long v23 = 0uLL;
          uint64_t v24 = 0;
          long long v26 = 0uLL;
        }
        unint64_t v30 = v10;
        uint64_t v31 = (uint64_t)&mGeometry[9 * v10 + 4];
        if (!mGeometry) {
          goto LABEL_28;
        }
LABEL_27:
        for (unint64_t i = (HIBYTE(self->super.mFlags) & 0xF) + 1; v30 < i; unint64_t i = 0)
        {
          *(_OWORD *)(v31 - 32) = v23;
          *(_OWORD *)(v31 - 16) = _Q0;
          *(void *)(v31 + 32) = v24;
          ++v30;
          *(_OWORD *)uint64_t v31 = v25;
          *(_OWORD *)(v31 + 16) = v26;
          v31 += 72;
          if (mGeometry) {
            goto LABEL_27;
          }
LABEL_28:
          ;
        }
        LODWORD(v8) = self->super.mFlags >> 28;
        goto LABEL_33;
      }
      uint64_t v14 = 0;
      unint64_t v15 = 0;
      long long v16 = mGeometry;
      if (!v12) {
        goto LABEL_17;
      }
LABEL_16:
      for (unint64_t j = (HIBYTE(self->super.mFlags) & 0xF) + 1; v15 < j; unint64_t j = 0)
      {
        long long v18 = &v12[v14];
        long long v19 = *(_OWORD *)v16;
        long long v20 = *((_OWORD *)v16 + 2);
        *((_OWORD *)v18 + 1) = *((_OWORD *)v16 + 1);
        *((_OWORD *)v18 + 2) = v20;
        *(_OWORD *)long long v18 = v19;
        ++v15;
        unsigned int v12 = (char *)self->mGeometry;
        v14 += 72;
        v16 += 6;
        if (v12) {
          goto LABEL_16;
        }
LABEL_17:
        ;
      }
      unsigned int v13 = mGeometry;
    }
    free(v13);
    goto LABEL_23;
  }
}

- (BOOL)isTriggered
{
  return (LOBYTE(self->super.mFlags) >> 4) & 1;
}

- (void)setIsTriggered:(BOOL)a3
{
  if (a3) {
    int v3 = 16;
  }
  else {
    int v3 = 0;
  }
  self->super.unint64_t mFlags = self->super.mFlags & 0xFFFFFFEF | v3;
}

- (BOOL)resetsTimeOnTrigger
{
  return (LOBYTE(self->super.mFlags) >> 5) & 1;
}

- (void)setResetsTimeOnTrigger:(BOOL)a3
{
  if (a3) {
    int v3 = 32;
  }
  else {
    int v3 = 0;
  }
  self->super.unint64_t mFlags = self->super.mFlags & 0xFFFFFFDF | v3;
}

- (BOOL)clipsContainer
{
  return LOBYTE(self->super.mFlags) >> 7;
}

- (void)setClipsContainer:(BOOL)a3
{
  if (a3) {
    int v3 = 128;
  }
  else {
    int v3 = 0;
  }
  self->super.unint64_t mFlags = self->super.mFlags & 0xFFFFFF7F | v3;
}

- (unsigned)countOfLayouts
{
  if (self->mGeometry) {
    return (HIBYTE(self->super.mFlags) & 0xF) + 1;
  }
  else {
    return 0;
  }
}

- (unsigned)currentLayoutIndex
{
  return self->super.mFlags >> 28;
}

- (void)setCurrentLayoutIndex:(unsigned __int8)a3
{
  self->super.unint64_t mFlags = self->super.mFlags & 0xFFFFFFF | (a3 << 28);
}

- (void)_copySelfToSnapshot:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)MCPlugParallel;
  -[MCPlug _copySelfToSnapshot:](&v8, "_copySelfToSnapshot:");
  *((void *)a3 + 15) = *(void *)&self->mTimeIn;
  *((_WORD *)a3 + 48) = self->mZIndex;
  *((_WORD *)a3 + 49) = self->mAudioPriority;
  *((void *)a3 + 16) = *(void *)&self->mOpacity;
  if (self->mGeometry)
  {
    uint64_t v5 = 72;
    if ((self->super.mFlags & 0x40) == 0) {
      uint64_t v5 = 48;
    }
    size_t v6 = v5 + v5 * (unint64_t)(HIBYTE(self->super.mFlags) & 0xF);
    uint64_t v7 = malloc_type_malloc(v6, 0xB9076531uLL);
    *((void *)a3 + 11) = v7;
    memcpy(v7, self->mGeometry, v6);
  }
}

- (double)zPosition
{
  [(MCPlugParallel *)self positionZ];
  return result;
}

- (void)setZPosition:(double)a3
{
}

- (double)xRotationAngle
{
  [(MCPlugParallel *)self rotationX];
  return result;
}

- (void)setXRotationAngle:(double)a3
{
}

- (double)yRotationAngle
{
  [(MCPlugParallel *)self rotationY];
  return result;
}

- (void)setYRotationAngle:(double)a3
{
}

- (id)description
{
  v11.receiver = self;
  v11.super_class = (Class)MCPlugParallel;
  id result = objc_msgSend(-[MCPlugParallel description](&v11, "description"), "stringByAppendingFormat:", @"\n\ttimeIn=%f, zIndex=%d, audioPriority=%d, currentLayoutIndex=%d, idInSupercontainer=%@", *(void *)&self->mTimeIn, self->mZIndex, self->mAudioPriority, self->super.mFlags >> 28, self->mIDInSupercontainer);
  mGeometrCGFloat y = (char *)self->mGeometry;
  if (mGeometry)
  {
    uint64_t v5 = 0;
    uint64_t v6 = 0;
    unint64_t v7 = 0;
LABEL_3:
    for (unint64_t i = (HIBYTE(self->super.mFlags) & 0xF) + 1; v7 < i; unint64_t i = 0)
    {
      unsigned int v9 = &mGeometry[v6];
      if ((self->super.mFlags & 0x40) != 0) {
        uint64_t v10 = v6;
      }
      else {
        uint64_t v10 = v5;
      }
      if ((self->super.mFlags & 0x40) == 0) {
        unsigned int v9 = &mGeometry[v5];
      }
      id result = [result stringByAppendingFormat:@"\n\t\tposition=(%f,%f), size=(%f,%f), scale=%f, rotation=%f", *(void *)&mGeometry[v10], *((void *)v9 + 1), *((void *)v9 + 2), *((void *)v9 + 3), *((void *)v9 + 5), *((void *)v9 + 4)];
      if ((self->super.mFlags & 0x40) != 0) {
        id result = [result stringByAppendingFormat:@"\n\t\t\tpositionZ=%f, rotationX=%f, rotationY=%f", *(void *)((char *)self->mGeometry + v6 + 48), *(void *)((char *)self->mGeometry + v6 + 56), *(void *)((char *)self->mGeometry + v6 + 64)];
      }
      ++v7;
      mGeometrCGFloat y = (char *)self->mGeometry;
      v6 += 72;
      v5 += 48;
      if (mGeometry) {
        goto LABEL_3;
      }
    }
  }
  return result;
}

- (NSString)idInSupercontainer
{
  return (NSString *)objc_getProperty(self, a2, 104, 1);
}

- (void)setIDInSupercontainer:(id)a3
{
}

- (MCContainerParallelizer)supercontainer
{
  return self->mSupercontainer;
}

- (void)setSupercontainer:(id)a3
{
  self->mSupercontainer = (MCContainerParallelizer *)a3;
}

- (double)timeIn
{
  return self->mTimeIn;
}

- (signed)zIndex
{
  return self->mZIndex;
}

- (void)setZIndex:(signed __int16)a3
{
  self->mZIndeCGFloat x = a3;
}

- (signed)audioPriority
{
  return self->mAudioPriority;
}

- (void)setAudioPriority:(signed __int16)a3
{
  self->mAudioPrioritCGFloat y = a3;
}

- (double)opacity
{
  return self->mOpacity;
}

@end