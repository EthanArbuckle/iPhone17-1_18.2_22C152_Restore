@interface TouchEventGenerator
+ (id)sharedTouchEventGenerator;
- (BOOL)_sendHIDEvent:(__IOHIDEvent *)a3;
- (TouchEventGenerator)init;
- (__IOHIDEvent)_createIOHIDEventType:(int)a3;
- (void)_updateTouchPoints:(CGPoint *)a3 count:(unint64_t)a4;
- (void)liftUp:(CGPoint)a3;
- (void)liftUp:(CGPoint)a3 touchCount:(unint64_t)a4;
- (void)liftUpAtPoints:(CGPoint *)a3 touchCount:(unint64_t)a4;
- (void)moveToPoints:(CGPoint *)a3 touchCount:(unint64_t)a4 duration:(double)a5;
- (void)touchDown:(CGPoint)a3;
- (void)touchDown:(CGPoint)a3 touchCount:(unint64_t)a4;
- (void)touchDownAtPoints:(CGPoint *)a3 touchCount:(unint64_t)a4;
@end

@implementation TouchEventGenerator

+ (id)sharedTouchEventGenerator
{
  v2 = (void *)sharedTouchEventGenerator_eventGenerator;
  if (!sharedTouchEventGenerator_eventGenerator)
  {
    v3 = objc_alloc_init(TouchEventGenerator);
    v4 = (void *)sharedTouchEventGenerator_eventGenerator;
    sharedTouchEventGenerator_eventGenerator = (uint64_t)v3;

    v2 = (void *)sharedTouchEventGenerator_eventGenerator;
  }
  return v2;
}

- (TouchEventGenerator)init
{
  v9.receiver = self;
  v9.super_class = (Class)TouchEventGenerator;
  v2 = [(TouchEventGenerator *)&v9 init];
  v3 = v2;
  if (v2)
  {
    v4 = &fingerIdentifiers;
    for (uint64_t i = 16; i != 256; i += 48)
    {
      int v6 = *v4++;
      *(_DWORD *)((char *)&v2->super.isa + i) = v6;
    }
    v7 = v2;
  }

  return v3;
}

- (__IOHIDEvent)_createIOHIDEventType:(int)a3
{
  mach_absolute_time();
  DigitizerEvent = (__IOHIDEvent *)IOHIDEventCreateDigitizerEvent();
  IOHIDEventSetIntegerValue();
  if (self->_activePointCount)
  {
    unint64_t v6 = 0;
    p_pathProximity = &self->_activePoints[0].pathProximity;
    do
    {
      if (a3 == 1)
      {
        if (*((double *)p_pathProximity - 2) == 0.0) {
          *((void *)p_pathProximity - 2) = 0x4014000000000000;
        }
        if (*((double *)p_pathProximity - 1) == 0.0) {
          *((void *)p_pathProximity - 1) = 0;
        }
        if (!*p_pathProximity) {
          unsigned __int8 *p_pathProximity = 3;
        }
      }
      else if ((a3 & 0xFFFFFFFE) == 4)
      {
        *((void *)p_pathProximity - 2) = 0;
        *((void *)p_pathProximity - 1) = 0;
        unsigned __int8 *p_pathProximity = 0;
      }
      DigitizerFingerEvent = (const void *)IOHIDEventCreateDigitizerFingerEvent();
      IOHIDEventSetFloatValue();
      IOHIDEventSetFloatValue();
      IOHIDEventAppendEvent();
      CFRelease(DigitizerFingerEvent);
      ++v6;
      p_pathProximity += 48;
    }
    while (v6 < self->_activePointCount);
  }
  return DigitizerEvent;
}

- (BOOL)_sendHIDEvent:(__IOHIDEvent *)a3
{
  if (!self->_ioSystemClient)
  {
    self->_ioSystemClient = (__IOHIDEventSystemClient *)IOHIDEventSystemClientCreate();
    if (!a3) {
      return 1;
    }
    goto LABEL_3;
  }
  if (a3)
  {
LABEL_3:
    CFRetain(a3);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __37__TouchEventGenerator__sendHIDEvent___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0l;
    block[4] = a3;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
  return 1;
}

void __37__TouchEventGenerator__sendHIDEvent___block_invoke(uint64_t a1)
{
  v2 = [(id)*MEMORY[0x1E4FB2608] openSessions];
  v3 = objc_msgSend(v2, "safari_mapAndFilterObjectsUsingBlock:", &__block_literal_global_62);
  unint64_t v4 = [v3 count];

  if (v4 >= 2)
  {
    id v9 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3A8] reason:@"This code assumes a single window scene exists to correctly route touches." userInfo:0];
    objc_exception_throw(v9);
  }
  v5 = [MEMORY[0x1E4FB1438] sharedApplication];
  unint64_t v6 = [v5 keyWindow];
  [v6 _contextId];

  BKSHIDEventSetDigitizerInfo();
  v7 = [MEMORY[0x1E4FB1438] sharedApplication];
  [v7 _enqueueHIDEvent:*(void *)(a1 + 32)];

  v8 = *(const void **)(a1 + 32);
  CFRelease(v8);
}

id __37__TouchEventGenerator__sendHIDEvent___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [v2 role];
  if (v3 == (void *)*MEMORY[0x1E4FB3130]) {
    unint64_t v4 = v2;
  }
  else {
    unint64_t v4 = 0;
  }
  id v5 = v4;

  return v5;
}

- (void)_updateTouchPoints:(CGPoint *)a3 count:(unint64_t)a4
{
  unint64_t activePointCount = self->_activePointCount;
  if (activePointCount)
  {
    if (!a4)
    {
      self->_unint64_t activePointCount = 0;
      uint64_t v6 = 4;
      goto LABEL_12;
    }
    if (activePointCount == a4) {
      uint64_t v6 = 2;
    }
    else {
      uint64_t v6 = 3;
    }
    self->_unint64_t activePointCount = a4;
  }
  else
  {
    self->_unint64_t activePointCount = a4;
    uint64_t v6 = 1;
    if (!a4) {
      goto LABEL_12;
    }
  }
  p_point = &self->_activePoints[0].point;
  do
  {
    CGPoint v8 = *a3++;
    CGPoint *p_point = v8;
    p_point += 3;
    --a4;
  }
  while (a4);
LABEL_12:
  id v9 = [(TouchEventGenerator *)self _createIOHIDEventType:v6];
  [(TouchEventGenerator *)self _sendHIDEvent:v9];
  CFRelease(v9);
}

- (void)touchDownAtPoints:(CGPoint *)a3 touchCount:(unint64_t)a4
{
  unint64_t v5 = 5;
  if (a4 < 5) {
    unint64_t v5 = a4;
  }
  if (v5)
  {
    p_point = &self->_activePoints[0].point;
    do
    {
      CGPoint v7 = *a3++;
      CGPoint *p_point = v7;
      p_point += 3;
      --v5;
    }
    while (v5);
  }
  CGPoint v8 = [(TouchEventGenerator *)self _createIOHIDEventType:1];
  [(TouchEventGenerator *)self _sendHIDEvent:v8];
  CFRelease(v8);
}

- (void)touchDown:(CGPoint)a3 touchCount:(unint64_t)a4
{
  v7[1] = *MEMORY[0x1E4F143B8];
  if (a4 >= 5) {
    unint64_t v4 = 5;
  }
  else {
    unint64_t v4 = a4;
  }
  if (v4)
  {
    unint64_t v5 = (char *)&v7[1] - (16 * v4);
    unint64_t v6 = v4;
    do
    {
      *(CGPoint *)(v5 - 8) = a3;
      v5 += 16;
      --v6;
    }
    while (v6);
  }
  [(TouchEventGenerator *)self touchDownAtPoints:a3.x touchCount:a3.y];
}

- (void)touchDown:(CGPoint)a3
{
  CGPoint v3 = a3;
  [(TouchEventGenerator *)self touchDownAtPoints:&v3 touchCount:1];
}

- (void)liftUpAtPoints:(CGPoint *)a3 touchCount:(unint64_t)a4
{
  unint64_t activePointCount = self->_activePointCount;
  if (a4 >= activePointCount) {
    unint64_t v6 = self->_activePointCount;
  }
  else {
    unint64_t v6 = a4;
  }
  if (v6 >= 5) {
    unint64_t v6 = 5;
  }
  unint64_t v7 = activePointCount - v6;
  if (v6)
  {
    CGPoint v8 = (_OWORD *)((char *)&self->_activePoints[0].point.x + 48 * activePointCount - 48 * v6);
    do
    {
      long long v9 = (__int128)*a3++;
      _OWORD *v8 = v9;
      v8 += 3;
      --v6;
    }
    while (v6);
  }
  v10 = [(TouchEventGenerator *)self _createIOHIDEventType:4];
  [(TouchEventGenerator *)self _sendHIDEvent:v10];
  CFRelease(v10);
  self->_unint64_t activePointCount = v7;
}

- (void)liftUp:(CGPoint)a3 touchCount:(unint64_t)a4
{
  v7[1] = *MEMORY[0x1E4F143B8];
  if (a4 >= 5) {
    unint64_t v4 = 5;
  }
  else {
    unint64_t v4 = a4;
  }
  if (v4)
  {
    unint64_t v5 = (char *)&v7[1] - (16 * v4);
    unint64_t v6 = v4;
    do
    {
      *(CGPoint *)(v5 - 8) = a3;
      v5 += 16;
      --v6;
    }
    while (v6);
  }
  [(TouchEventGenerator *)self liftUpAtPoints:a3.x touchCount:a3.y];
}

- (void)liftUp:(CGPoint)a3
{
}

- (void)moveToPoints:(CGPoint *)a3 touchCount:(unint64_t)a4 duration:(double)a5
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  if (a4 >= 5) {
    unint64_t v8 = 5;
  }
  else {
    unint64_t v8 = a4;
  }
  uint64_t v9 = MEMORY[0x1F4188790](self, a2);
  MEMORY[0x1F4188790](v9, v10);
  double Current = CFAbsoluteTimeGetCurrent();
  if (a5 + -0.016 > 0.0)
  {
    int v12 = 0;
    double v26 = 1000000000.0;
    do
    {
      double v13 = CFAbsoluteTimeGetCurrent() - Current;
      if (v8)
      {
        long double v14 = sin(v13 / a5 * 3.14159265 * 0.5);
        *(double *)&uint64_t v15 = sin(v13 / a5 * v14 * 3.14159265 * 0.5);
        p_point = &self->_activePoints[0].point;
        float64x2_t v17 = (float64x2_t)vdupq_lane_s64(v15, 0);
        v18 = (float64x2_t *)(&v26 - 2 * v8);
        v19 = a3;
        unint64_t v20 = v8;
        v21 = v18;
        do
        {
          if (!v12) {
            float64x2_t *v21 = *(float64x2_t *)p_point;
          }
          float64x2_t v22 = *v21++;
          float64x2_t v23 = v22;
          float64x2_t v24 = *(float64x2_t *)v19++;
          *v18++ = vmlaq_f64(v23, v17, vsubq_f64(v24, v23));
          p_point += 3;
          --v20;
        }
        while (v20);
      }
      -[TouchEventGenerator _updateTouchPoints:count:](self, "_updateTouchPoints:count:", &v26 - 2 * v8, v8, *(void *)&v26);
      double v25 = -(v13 - (double)v12 * 0.016);
      if (v25 > 0.0)
      {
        __rqtp.tv_sec = 0;
        __rqtp.tv_nsec = (uint64_t)(v25 * v26);
        nanosleep(&__rqtp, 0);
      }
      ++v12;
    }
    while (v13 < a5 + -0.016);
  }
  [(TouchEventGenerator *)self _updateTouchPoints:a3 count:v8];
}

@end