@interface UIKBTouchState
+ (id)touchForTouchUUID:(id)a3;
+ (id)touchStateForTouch:(id)a3;
+ (id)touchStateForTouchUUID:(id)a3 withTimestamp:(double)a4 phase:(int64_t)a5 location:(CGPoint)a6 pathIndex:(unsigned __int8)a7 inView:(id)a8;
+ (id)touchUUIDForTouch:(id)a3;
+ (id)touchUUIDsForTouches:(id)a3;
+ (id)touchesForTouchUUIDs:(id)a3;
+ (void)releaseUUIDForTouch:(id)a3;
- (CGPoint)locationInView:(id)a3;
- (CGPoint)locationInWindow;
- (NSUUID)touchUUID;
- (UITouch)uiTouch;
- (UIWindow)window;
- (double)pathMajorRadius;
- (double)timestamp;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)inputSource;
- (int64_t)phase;
- (unint64_t)pathIndex;
- (unint64_t)tapCount;
@end

@implementation UIKBTouchState

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(UIKBTouchState);
  v4->_timestamp = self->_timestamp;
  v4->_phase = self->_phase;
  objc_storeStrong((id *)&v4->_window, self->_window);
  v4->_locationInWindow = self->_locationInWindow;
  v4->_pathMajorRadius = self->_pathMajorRadius;
  v4->_pathIndex = self->_pathIndex;
  uint64_t v5 = [(NSUUID *)self->_touchUUID copy];
  touchUUID = v4->_touchUUID;
  v4->_touchUUID = (NSUUID *)v5;

  v4->_tapCount = self->_tapCount;
  v4->_inputSource = self->_inputSource;
  return v4;
}

+ (id)touchUUIDForTouch:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    v4 = (void *)_MergedGlobals_30;
    if (!_MergedGlobals_30)
    {
      uint64_t v5 = [objc_alloc(MEMORY[0x1E4F28E10]) initWithKeyOptions:5 valueOptions:5 capacity:0];
      v6 = (void *)_MergedGlobals_30;
      _MergedGlobals_30 = v5;

      uint64_t v7 = [objc_alloc(MEMORY[0x1E4F28E10]) initWithKeyOptions:5 valueOptions:5 capacity:0];
      v8 = (void *)qword_1EB2593A0;
      qword_1EB2593A0 = v7;

      v4 = (void *)_MergedGlobals_30;
    }
    v9 = [v4 objectForKey:v3];
    if (!v9)
    {
      v9 = [MEMORY[0x1E4F29128] UUID];
      [(id)_MergedGlobals_30 setObject:v9 forKey:v3];
      [(id)qword_1EB2593A0 setObject:v3 forKey:v9];
    }
  }
  else
  {
    v9 = [MEMORY[0x1E4F29128] UUID];
  }

  return v9;
}

+ (id)touchForTouchUUID:(id)a3
{
  id v3 = (void *)qword_1EB2593A0;
  if (qword_1EB2593A0)
  {
    id v3 = [(id)qword_1EB2593A0 objectForKey:a3];
  }
  return v3;
}

+ (id)touchesForTouchUUIDs:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (qword_1EB2593A0)
  {
    v4 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v3, "count"));
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v5 = v3;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v13;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v13 != v8) {
            objc_enumerationMutation(v5);
          }
          v10 = objc_msgSend((id)qword_1EB2593A0, "objectForKey:", *(void *)(*((void *)&v12 + 1) + 8 * i), (void)v12);
          if (v10) {
            [v4 addObject:v10];
          }
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v7);
    }
  }
  else
  {
    v4 = [MEMORY[0x1E4F1C978] array];
  }

  return v4;
}

+ (id)touchUUIDsForTouches:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (_MergedGlobals_30)
  {
    v4 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v3, "count"));
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v5 = v3;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v13;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v13 != v8) {
            objc_enumerationMutation(v5);
          }
          v10 = objc_msgSend((id)_MergedGlobals_30, "objectForKey:", *(void *)(*((void *)&v12 + 1) + 8 * i), (void)v12);
          if (v10) {
            [v4 addObject:v10];
          }
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v7);
    }
  }
  else
  {
    v4 = [MEMORY[0x1E4F1C978] array];
  }

  return v4;
}

+ (void)releaseUUIDForTouch:(id)a3
{
  id v5 = a3;
  v4 = objc_msgSend(a1, "touchUUIDForTouch:");
  if (v4)
  {
    [(id)_MergedGlobals_30 removeObjectForKey:v5];
    [(id)qword_1EB2593A0 removeObjectForKey:v4];
  }
}

+ (id)touchStateForTouch:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init((Class)objc_opt_class());
  [v4 timestamp];
  *((void *)v5 + 1) = v6;
  *((void *)v5 + 2) = [v4 phase];
  uint64_t v7 = [v4 window];
  uint64_t v8 = (void *)*((void *)v5 + 3);
  *((void *)v5 + 3) = v7;

  [v4 _pathMajorRadius];
  *((double *)v5 + 4) = v9;
  *((void *)v5 + 5) = [v4 _pathIndex];
  uint64_t v10 = [a1 touchUUIDForTouch:v4];
  v11 = (void *)*((void *)v5 + 6);
  *((void *)v5 + 6) = v10;

  *((void *)v5 + 7) = [v4 tapCount];
  [v4 locationInView:0];
  *((void *)v5 + 10) = v12;
  *((void *)v5 + 11) = v13;
  objc_storeWeak((id *)v5 + 9, v4);

  *((void *)v5 + 8) = 1;
  return v5;
}

+ (id)touchStateForTouchUUID:(id)a3 withTimestamp:(double)a4 phase:(int64_t)a5 location:(CGPoint)a6 pathIndex:(unsigned __int8)a7 inView:(id)a8
{
  unsigned int v9 = a7;
  double y = a6.y;
  double x = a6.x;
  id v14 = a3;
  id v15 = a8;
  v16 = (double *)objc_alloc_init((Class)objc_opt_class());
  v16[1] = a4;
  *((void *)v16 + 2) = a5;
  uint64_t v17 = [v15 window];
  v18 = (void *)*((void *)v16 + 3);
  *((void *)v16 + 3) = v17;

  v19 = [v15 window];
  objc_msgSend(v19, "convertPoint:fromView:", v15, x, y);
  uint64_t v21 = v20;
  uint64_t v23 = v22;

  *((void *)v16 + 10) = v21;
  *((void *)v16 + 11) = v23;

  v16[4] = 1.0;
  *((void *)v16 + 5) = v9;
  v24 = (void *)*((void *)v16 + 6);
  *((void *)v16 + 6) = v14;

  return v16;
}

- (CGPoint)locationInView:(id)a3
{
  id v4 = a3;
  id v5 = [(UIKBTouchState *)self window];
  [(UIKBTouchState *)self locationInWindow];
  objc_msgSend(v5, "convertPoint:toView:", v4);
  double v7 = v6;
  double v9 = v8;

  double v10 = v7;
  double v11 = v9;
  result.double y = v11;
  result.double x = v10;
  return result;
}

- (id)description
{
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithFormat:@"<%@: %p", objc_opt_class(), self];
  id v4 = [(UIKBTouchState *)self touchUUID];
  id v5 = [v4 UUIDString];
  [v3 appendFormat:@"; UUID = %@", v5];

  unint64_t v6 = [(UIKBTouchState *)self phase];
  if (v6 <= 4 && ((0x1Bu >> v6) & 1) != 0) {
    [v3 appendFormat:@"; phase = %@", off_1E52FCED0[v6]];
  }
  return v3;
}

- (double)timestamp
{
  return self->_timestamp;
}

- (int64_t)phase
{
  return self->_phase;
}

- (UIWindow)window
{
  return self->_window;
}

- (CGPoint)locationInWindow
{
  double x = self->_locationInWindow.x;
  double y = self->_locationInWindow.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (double)pathMajorRadius
{
  return self->_pathMajorRadius;
}

- (unint64_t)pathIndex
{
  return self->_pathIndex;
}

- (NSUUID)touchUUID
{
  return self->_touchUUID;
}

- (unint64_t)tapCount
{
  return self->_tapCount;
}

- (int64_t)inputSource
{
  return self->_inputSource;
}

- (UITouch)uiTouch
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_uiTouch);
  return (UITouch *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_uiTouch);
  objc_storeStrong((id *)&self->_touchUUID, 0);
  objc_storeStrong((id *)&self->_window, 0);
}

@end