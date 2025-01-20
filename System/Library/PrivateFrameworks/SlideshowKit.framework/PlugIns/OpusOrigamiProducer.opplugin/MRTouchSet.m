@interface MRTouchSet
- (BOOL)isActive;
- (CGPoint)centroid;
- (MRTouchSet)init;
- (MRTouchSet)initWithPosition:(CGPoint)a3 andCountOfTouches:(unint64_t)a4;
- (MRTouchSet)initWithTouch:(id)a3;
- (MRTouchSet)initWithTouches:(id)a3;
- (MRTouchSet)initWithUITouches:(id)a3 inView:(id)a4;
- (MRTouchSet)initWithUITouches:(id)a3 inView:(id)a4 withLocationFactor:(CGSize)a5;
- (NSSet)touches;
- (double)rotation;
- (double)scale;
- (id)description;
- (id)updateWithPosition:(CGPoint)a3 andCountOfTouches:(unint64_t)a4;
- (id)updateWithUITouches:(id)a3 inView:(id)a4;
- (unint64_t)countOfActiveTouches;
- (void)addTouch:(id)a3;
- (void)cancelAllTouches;
- (void)dealloc;
- (void)removeAllTouches;
- (void)removeTouch:(id)a3;
@end

@implementation MRTouchSet

- (MRTouchSet)init
{
  v8.receiver = self;
  v8.super_class = (Class)MRTouchSet;
  result = [(MRTouchSet *)&v8 init];
  if (result)
  {
    __asm { FMOV            V0.2D, #1.0 }
    result->_locationFactor = _Q0;
  }
  return result;
}

- (MRTouchSet)initWithTouch:(id)a3
{
  v4 = [(MRTouchSet *)self init];
  if (v4) {
    v4->_touches = (NSMutableSet *)objc_msgSend(objc_alloc((Class)NSMutableSet), "initWithObjects:", a3, 0);
  }
  return v4;
}

- (MRTouchSet)initWithTouches:(id)a3
{
  v4 = [(MRTouchSet *)self init];
  if (v4) {
    v4->_touches = (NSMutableSet *)[objc_alloc((Class)NSMutableSet) initWithSet:a3];
  }
  return v4;
}

- (void)dealloc
{
  self->_touches = 0;
  self->_touchesForUITouches = 0;
  v3.receiver = self;
  v3.super_class = (Class)MRTouchSet;
  [(MRTouchSet *)&v3 dealloc];
}

- (void)addTouch:(id)a3
{
}

- (void)removeTouch:(id)a3
{
}

- (void)removeAllTouches
{
}

- (void)cancelAllTouches
{
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  touches = self->_touches;
  id v3 = [(NSMutableSet *)touches countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(touches);
        }
        [*(id *)(*((void *)&v7 + 1) + 8 * i) setPhase:4];
      }
      id v4 = [(NSMutableSet *)touches countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

- (MRTouchSet)initWithUITouches:(id)a3 inView:(id)a4
{
  return -[MRTouchSet initWithUITouches:inView:withLocationFactor:](self, "initWithUITouches:inView:withLocationFactor:", a3, a4, 1.0, 1.0);
}

- (MRTouchSet)initWithUITouches:(id)a3 inView:(id)a4 withLocationFactor:(CGSize)a5
{
  CGFloat height = a5.height;
  CGFloat width = a5.width;
  long long v9 = [(MRTouchSet *)self init];
  if (v9)
  {
    v9->_touches = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    v9->_touchesForUITouches = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    v9->_locationFactor.CGFloat width = width;
    v9->_locationFactor.CGFloat height = height;
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v10 = [a3 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v10)
    {
      id v11 = v10;
      uint64_t v12 = *(void *)v20;
      do
      {
        v13 = 0;
        do
        {
          if (*(void *)v20 != v12) {
            objc_enumerationMutation(a3);
          }
          uint64_t v14 = *(void *)(*((void *)&v19 + 1) + 8 * (void)v13);
          v15 = [[MRTouch alloc] initWithUITouch:v14 inView:a4];
          [(MRTouch *)v15 location];
          -[MRTouch setLocation:](v15, "setLocation:", v16 * v9->_locationFactor.width, v17 * v9->_locationFactor.height);
          [(NSMutableSet *)v9->_touches addObject:v15];
          [(NSMutableDictionary *)v9->_touchesForUITouches setObject:v15 forKey:+[MURetainingKey retainingKeyWithObject:v14]];

          v13 = (char *)v13 + 1;
        }
        while (v11 != v13);
        id v11 = [a3 countByEnumeratingWithState:&v19 objects:v23 count:16];
      }
      while (v11);
    }
  }
  return v9;
}

- (id)updateWithUITouches:(id)a3 inView:(id)a4
{
  long long v7 = +[NSMutableSet setWithCapacity:](NSMutableSet, "setWithCapacity:", [a3 count]);
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id v8 = a3;
  id v9 = [a3 countByEnumeratingWithState:&v30 objects:v34 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v31;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v31 != v11) {
          objc_enumerationMutation(v8);
        }
        v13 = *(void **)(*((void *)&v30 + 1) + 8 * (void)v12);
        uint64_t v14 = +[MURetainingKey retainingKeyWithObject:v13];
        v15 = (MRTouch *)[(NSMutableDictionary *)self->_touchesForUITouches objectForKey:v14];
        if (v15)
        {
          double v16 = v15;
          [v13 locationInView:a4];
          double v18 = v17;
          double v20 = v19;
          [a4 contentScaleFactor];
          double v22 = v18 * (v21 * self->_locationFactor.width);
          [a4 bounds];
          double v24 = v23 - v20;
          [a4 contentScaleFactor];
          -[MRTouch setLocation:](v16, "setLocation:", v22, self->_locationFactor.height * (v25 * v24));
          [v13 timestamp];
          -[MRTouch setTimestamp:](v16, "setTimestamp:");
          -[MRTouch setTapCount:](v16, "setTapCount:", [v13 tapCount]);
          -[MRTouch setPhase:](v16, "setPhase:", [v13 phase]);
LABEL_8:
          [(NSMutableSet *)v7 addObject:v16];
          goto LABEL_10;
        }
        if (![v13 phase])
        {
          double v16 = [[MRTouch alloc] initWithUITouch:v13 inView:a4];
          [(MRTouch *)v16 location];
          -[MRTouch setLocation:](v16, "setLocation:", v26 * self->_locationFactor.width, v27 * self->_locationFactor.height);
          [(NSMutableSet *)self->_touches addObject:v16];
          [(NSMutableDictionary *)self->_touchesForUITouches setObject:v16 forKey:v14];

          if (v16) {
            goto LABEL_8;
          }
        }
LABEL_10:
        uint64_t v12 = (char *)v12 + 1;
      }
      while (v10 != v12);
      id v28 = [v8 countByEnumeratingWithState:&v30 objects:v34 count:16];
      id v10 = v28;
    }
    while (v28);
  }
  return v7;
}

- (MRTouchSet)initWithPosition:(CGPoint)a3 andCountOfTouches:(unint64_t)a4
{
  double y = a3.y;
  double x = a3.x;
  long long v7 = [(MRTouchSet *)self init];
  if (v7)
  {
    for (v7->_touches = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet); a4; --a4)
    {
      id v8 = objc_alloc_init(MRTouch);
      -[MRTouch setLocation:](v8, "setLocation:", x, y);
      [(MRTouch *)v8 setTimestamp:MRGetCurrentTime()];
      [(MRTouch *)v8 setPhase:0];
      [(NSMutableSet *)v7->_touches addObject:v8];
    }
  }
  return v7;
}

- (id)updateWithPosition:(CGPoint)a3 andCountOfTouches:(unint64_t)a4
{
  double y = a3.y;
  double x = a3.x;
  long long v7 = +[NSMutableSet setWithCapacity:a4];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  touches = self->_touches;
  id v9 = [(NSMutableSet *)touches countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v16;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v16 != v11) {
          objc_enumerationMutation(touches);
        }
        v13 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        objc_msgSend(v13, "setLocation:", x, y);
        [v13 setTimestamp:MRGetCurrentTime()];
        [v13 setPhase:1];
        [(NSMutableSet *)v7 addObject:v13];
      }
      id v10 = [(NSMutableSet *)touches countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v10);
  }
  return v7;
}

- (unint64_t)countOfActiveTouches
{
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  touches = self->_touches;
  id v3 = [(NSMutableSet *)touches countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (!v3) {
    return 0;
  }
  id v4 = v3;
  unint64_t v5 = 0;
  uint64_t v6 = *(void *)v10;
  do
  {
    for (i = 0; i != v4; i = (char *)i + 1)
    {
      if (*(void *)v10 != v6) {
        objc_enumerationMutation(touches);
      }
      if ([*(id *)(*((void *)&v9 + 1) + 8 * i) phase] < 3) {
        ++v5;
      }
    }
    id v4 = [(NSMutableSet *)touches countByEnumeratingWithState:&v9 objects:v13 count:16];
  }
  while (v4);
  return v5;
}

- (CGPoint)centroid
{
  double x = CGPointZero.x;
  double y = CGPointZero.y;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  touches = self->_touches;
  id v5 = [(NSMutableSet *)touches countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v5)
  {
    id v6 = v5;
    unint64_t v7 = 0;
    uint64_t v8 = *(void *)v16;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(touches);
        }
        long long v10 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        if ([v10 phase] <= 2)
        {
          [v10 location];
          double x = x + v11;
          [v10 location];
          double y = y + v12;
          ++v7;
        }
      }
      id v6 = [(NSMutableSet *)touches countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v6);
  }
  else
  {
    unint64_t v7 = 0;
  }
  double v13 = x / (double)v7;
  double v14 = y / (double)v7;
  result.double y = v14;
  result.double x = v13;
  return result;
}

- (double)scale
{
  [(MRTouchSet *)self centroid];
  double v4 = v3;
  double v6 = v5;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  touches = self->_touches;
  id v8 = [(NSMutableSet *)touches countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (!v8) {
    return 1.0;
  }
  id v9 = v8;
  unint64_t v10 = 0;
  uint64_t v11 = *(void *)v19;
  double v12 = 0.0;
  do
  {
    for (i = 0; i != v9; i = (char *)i + 1)
    {
      if (*(void *)v19 != v11) {
        objc_enumerationMutation(touches);
      }
      double v14 = *(void **)(*((void *)&v18 + 1) + 8 * i);
      if ([v14 phase] <= 2)
      {
        [v14 location];
        *(float *)&double v15 = (v16 - v6) * (v16 - v6) + (v15 - v4) * (v15 - v4);
        double v12 = v12 + sqrtf(*(float *)&v15);
        ++v10;
      }
    }
    id v9 = [(NSMutableSet *)touches countByEnumeratingWithState:&v18 objects:v22 count:16];
  }
  while (v9);
  double result = v12 / (double)v10;
  if (v10 <= 1) {
    return 1.0;
  }
  return result;
}

- (double)rotation
{
  [(MRTouchSet *)self centroid];
  double v4 = v3;
  double v6 = v5;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  touches = self->_touches;
  id v8 = [(NSMutableSet *)touches countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (!v8) {
    return 0.0;
  }
  id v9 = v8;
  unint64_t v10 = 0;
  uint64_t v11 = *(void *)v20;
  double v12 = 0.0;
  do
  {
    for (i = 0; i != v9; i = (char *)i + 1)
    {
      if (*(void *)v20 != v11) {
        objc_enumerationMutation(touches);
      }
      double v14 = *(void **)(*((void *)&v19 + 1) + 8 * i);
      if ([v14 phase] <= 2)
      {
        [v14 location];
        float v16 = v15 - v6;
        *(float *)&double v15 = v17 - v4;
        double v12 = v12 + atan2f(v16, *(float *)&v15);
        ++v10;
      }
    }
    id v9 = [(NSMutableSet *)touches countByEnumeratingWithState:&v19 objects:v23 count:16];
  }
  while (v9);
  double result = v12 / (double)v10;
  if (v10 <= 1) {
    return 0.0;
  }
  return result;
}

- (BOOL)isActive
{
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  touches = self->_touches;
  id v3 = [(NSMutableSet *)touches countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v9;
    while (2)
    {
      double v6 = 0;
      do
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(touches);
        }
        if ([*(id *)(*((void *)&v8 + 1) + 8 * (void)v6) phase] < 3)
        {
          LOBYTE(v3) = 1;
          return (char)v3;
        }
        double v6 = (char *)v6 + 1;
      }
      while (v4 != v6);
      id v3 = [(NSMutableSet *)touches countByEnumeratingWithState:&v8 objects:v12 count:16];
      id v4 = v3;
      if (v3) {
        continue;
      }
      break;
    }
  }
  return (char)v3;
}

- (id)description
{
  [(MRTouchSet *)self centroid];
  uint64_t v4 = v3;
  uint64_t v6 = v5;
  v12.receiver = self;
  v12.super_class = (Class)MRTouchSet;
  id v7 = [(MRTouchSet *)&v12 description];
  [(MRTouchSet *)self scale];
  uint64_t v9 = v8;
  [(MRTouchSet *)self rotation];
  return [v7 stringByAppendingFormat:@" centroid=(%f,%f), scale=%f, rotation=%f, isActive=%d\n\ttouches=%@", v4, v6, v9, v10, -[MRTouchSet isActive](self, "isActive"), self->_touches];
}

- (NSSet)touches
{
  return &self->_touches->super;
}

@end