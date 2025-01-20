@interface TISKTap
- (BOOL)isDownUpTap;
- (CGRect)getFrameForKey:(id)a3;
- (NSMutableArray)dragTouches;
- (TIKeyboardLayout)layout;
- (TIKeyboardTouchEvent)firstTouch;
- (TIKeyboardTouchEvent)lastTouch;
- (double)distance:(id)a3 withTouch:(id)a4;
- (double)downErrorDistance:(CGRect)a3;
- (double)totalTapDistance;
- (double)upErrorDistance:(CGRect)a3;
- (id)init:(id)a3 layout:(id)a4;
- (id)stringForIntendedKey;
- (int64_t)_forcedKeyCode;
- (int64_t)pathIndex;
- (unint64_t)numberOfDrags;
- (void)addDragTouch:(id)a3;
- (void)setDragTouches:(id)a3;
- (void)setFirstTouch:(id)a3;
- (void)setLastTouch:(id)a3;
- (void)setLayout:(id)a3;
- (void)setPathIndex:(int64_t)a3;
@end

@implementation TISKTap

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_layout, 0);
  objc_storeStrong((id *)&self->_dragTouches, 0);
  objc_storeStrong((id *)&self->_lastTouch, 0);

  objc_storeStrong((id *)&self->_firstTouch, 0);
}

- (void)setLayout:(id)a3
{
}

- (TIKeyboardLayout)layout
{
  return self->_layout;
}

- (void)setPathIndex:(int64_t)a3
{
  self->_pathIndex = a3;
}

- (int64_t)pathIndex
{
  return self->_pathIndex;
}

- (void)setDragTouches:(id)a3
{
}

- (NSMutableArray)dragTouches
{
  return self->_dragTouches;
}

- (void)setLastTouch:(id)a3
{
}

- (TIKeyboardTouchEvent)lastTouch
{
  return self->_lastTouch;
}

- (void)setFirstTouch:(id)a3
{
}

- (TIKeyboardTouchEvent)firstTouch
{
  return self->_firstTouch;
}

- (double)totalTapDistance
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  v3 = self->_firstTouch;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  v4 = self->_dragTouches;
  uint64_t v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v17;
    double v8 = 0.0;
    do
    {
      uint64_t v9 = 0;
      v10 = v3;
      do
      {
        if (*(void *)v17 != v7) {
          objc_enumerationMutation(v4);
        }
        v11 = *(void **)(*((void *)&v16 + 1) + 8 * v9);
        -[TISKTap distance:withTouch:](self, "distance:withTouch:", v10, v11, (void)v16);
        double v8 = v8 + v12;
        v3 = v11;

        ++v9;
        v10 = v3;
      }
      while (v6 != v9);
      uint64_t v6 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v6);
  }
  else
  {
    double v8 = 0.0;
  }

  [(TISKTap *)self distance:v3 withTouch:self->_lastTouch];
  double v14 = v13;

  return v8 + v14;
}

- (double)distance:(id)a3 withTouch:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  [v6 location];
  double v8 = v7;
  [v5 location];
  *(float *)&double v8 = v8 - v9;
  [v6 location];
  double v11 = v10;

  [v5 location];
  double v13 = v12;

  float v14 = v11 - v13;
  return hypotf(*(float *)&v8, v14);
}

- (id)stringForIntendedKey
{
  v11[0] = 0;
  v11[1] = v11;
  v11[2] = 0x2020000000;
  int64_t v12 = 0;
  int64_t v12 = [(TISKTap *)self _forcedKeyCode];
  uint64_t v7 = 0;
  double v8 = &v7;
  uint64_t v9 = 0x2020000000;
  uint64_t v10 = 0;
  layout = self->_layout;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __31__TISKTap_stringForIntendedKey__block_invoke;
  v6[3] = &unk_1E6E2DB10;
  v6[4] = v11;
  v6[5] = &v7;
  [(TIKeyboardLayout *)layout enumerateKeysUsingBlock:v6];
  if (v8[3])
  {
    v4 = objc_msgSend(NSString, "stringWithUTF8String:");
  }
  else
  {
    v4 = 0;
  }
  _Block_object_dispose(&v7, 8);
  _Block_object_dispose(v11, 8);

  return v4;
}

uint64_t __31__TISKTap_stringForIntendedKey__block_invoke(uint64_t result, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  if (*(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) == a3)
  {
    *(void *)(*(void *)(*(void *)(result + 40) + 8) + 24) = a2;
    *a4 = 1;
  }
  return result;
}

- (int64_t)_forcedKeyCode
{
  uint64_t v3 = [(TIKeyboardTouchEvent *)self->_lastTouch forcedKeyCode];
  uint64_t v4 = 16;
  if (v3 == -1) {
    uint64_t v4 = 8;
  }
  id v5 = *(Class *)((char *)&self->super.isa + v4);

  return [v5 forcedKeyCode];
}

- (CGRect)getFrameForKey:(id)a3
{
  id v4 = a3;
  uint64_t v19 = 0;
  v20 = (double *)&v19;
  uint64_t v21 = 0x5012000000;
  v22 = __Block_byref_object_copy__19881;
  v23 = __Block_byref_object_dispose__19882;
  v24 = "";
  long long v5 = *(_OWORD *)(MEMORY[0x1E4F1DB20] + 16);
  long long v25 = *MEMORY[0x1E4F1DB20];
  long long v26 = v5;
  layout = self->_layout;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __26__TISKTap_getFrameForKey___block_invoke;
  v16[3] = &unk_1E6E2DAE8;
  id v17 = v4;
  long long v18 = &v19;
  id v7 = v4;
  [(TIKeyboardLayout *)layout enumerateKeysUsingBlock:v16];
  double v8 = v20[6];
  double v9 = v20[7];
  double v10 = v20[8];
  double v11 = v20[9];

  _Block_object_dispose(&v19, 8);
  double v12 = v8;
  double v13 = v9;
  double v14 = v10;
  double v15 = v11;
  result.size.height = v15;
  result.size.width = v14;
  result.origin.y = v13;
  result.origin.x = v12;
  return result;
}

void __26__TISKTap_getFrameForKey___block_invoke(uint64_t a1, uint64_t a2, double a3, double a4, double a5, double a6, uint64_t a7, unsigned char *a8)
{
  double v14 = *(void **)(a1 + 32);
  double v15 = [NSString stringWithUTF8String:a2];
  uint64_t v16 = [v14 caseInsensitiveCompare:v15];

  if (!v16)
  {
    id v17 = *(double **)(*(void *)(a1 + 40) + 8);
    v17[6] = a3;
    v17[7] = a4;
    v17[8] = a5;
    v17[9] = a6;
    *a8 = 1;
  }
}

- (double)upErrorDistance:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  [(TIKeyboardTouchEvent *)self->_lastTouch location];
  double v9 = v8;
  v15.origin.CGFloat x = x;
  v15.origin.CGFloat y = y;
  v15.size.CGFloat width = width;
  v15.size.CGFloat height = height;
  double v10 = v9 - CGRectGetMidX(v15);
  [(TIKeyboardTouchEvent *)self->_lastTouch location];
  double v12 = v11;
  v16.origin.CGFloat x = x;
  v16.origin.CGFloat y = y;
  v16.size.CGFloat width = width;
  v16.size.CGFloat height = height;
  CGFloat MidY = CGRectGetMidY(v16);
  return sqrt((v12 - MidY) * (v12 - MidY) + v10 * v10);
}

- (double)downErrorDistance:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  [(TIKeyboardTouchEvent *)self->_firstTouch location];
  double v9 = v8;
  v15.origin.CGFloat x = x;
  v15.origin.CGFloat y = y;
  v15.size.CGFloat width = width;
  v15.size.CGFloat height = height;
  double v10 = v9 - CGRectGetMidX(v15);
  [(TIKeyboardTouchEvent *)self->_firstTouch location];
  double v12 = v11;
  v16.origin.CGFloat x = x;
  v16.origin.CGFloat y = y;
  v16.size.CGFloat width = width;
  v16.size.CGFloat height = height;
  CGFloat MidY = CGRectGetMidY(v16);
  return sqrt((v12 - MidY) * (v12 - MidY) + v10 * v10);
}

- (BOOL)isDownUpTap
{
  if ([(TIKeyboardTouchEvent *)self->_firstTouch stage])
  {
    LOBYTE(lastTouch) = 0;
  }
  else
  {
    lastTouch = self->_lastTouch;
    if (lastTouch) {
      LOBYTE(lastTouch) = [(TIKeyboardTouchEvent *)lastTouch stage] == 2;
    }
  }
  return (char)lastTouch;
}

- (void)addDragTouch:(id)a3
{
}

- (unint64_t)numberOfDrags
{
  return [(NSMutableArray *)self->_dragTouches count];
}

- (id)init:(id)a3 layout:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v15.receiver = self;
  v15.super_class = (Class)TISKTap;
  double v9 = [(TISKTap *)&v15 init];
  double v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_firstTouch, a3);
    lastTouch = v10->_lastTouch;
    v10->_lastTouch = 0;

    v10->_pathIndeCGFloat x = -1;
    objc_storeStrong((id *)&v10->_layout, a4);
    uint64_t v12 = [MEMORY[0x1E4F1CA48] array];
    dragTouches = v10->_dragTouches;
    v10->_dragTouches = (NSMutableArray *)v12;
  }
  return v10;
}

@end