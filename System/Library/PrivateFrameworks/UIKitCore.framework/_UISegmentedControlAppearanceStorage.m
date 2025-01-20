@interface _UISegmentedControlAppearanceStorage
- (BOOL)legacySuppressOptionsBackground;
- (BOOL)wantsTrackingSuppressed;
- (_UISegmentedControlAppearanceStorage)init;
- (double)backgroundPositionAdjustmentForBarMetrics:(int64_t)a3;
- (id)anyDividerImage;
- (id)anyDividerImageForMini:(BOOL)a3;
- (id)backgroundImageForState:(unint64_t)a3 isMini:(BOOL)a4;
- (id)backgroundImageForState:(unint64_t)a3 isMini:(BOOL)a4 withFallback:(BOOL)a5;
- (id)contentPositionOffsetForSegment:(int64_t)a3 inMiniBar:(BOOL)a4;
- (id)contentPositionOffsetForSegment:(int64_t)a3 inMiniBar:(BOOL)a4 noFallback:(BOOL)a5;
- (id)dividerImageForLeftSegmentState:(unint64_t)a3 rightSegmentState:(unint64_t)a4 isMini:(BOOL)a5;
- (id)dividerImageForLeftSegmentState:(unint64_t)a3 rightSegmentState:(unint64_t)a4 isMini:(BOOL)a5 withFallback:(BOOL)a6;
- (id)textAttributesForState:(unint64_t)a3;
- (void)setBackgroundImage:(id)a3 forState:(unint64_t)a4 isMini:(BOOL)a5;
- (void)setBackgroundPositionAdjustment:(double)a3 forBarMetrics:(int64_t)a4;
- (void)setContentPositionOffset:(id)a3 forSegment:(int64_t)a4 inMiniBar:(BOOL)a5;
- (void)setDetail:(id *)a3;
- (void)setDividerImage:(id)a3 forLeftSegmentState:(unint64_t)a4 rightSegmentState:(unint64_t)a5 isMini:(BOOL)a6;
- (void)setIsTiled:(BOOL)a3 leftCapWidth:(unint64_t)a4 rightCapWidth:(unint64_t)a5;
- (void)setTextAttributes:(id)a3 forState:(unint64_t)a4;
- (void)takeTextAttributesFrom:(id *)a3 forState:(unint64_t)a4;
@end

@implementation _UISegmentedControlAppearanceStorage

- (id)contentPositionOffsetForSegment:(int64_t)a3 inMiniBar:(BOOL)a4 noFallback:(BOOL)a5
{
  uint64_t v7 = 56;
  if (a4) {
    uint64_t v7 = 64;
  }
  id v8 = *(id *)((char *)&self->super.isa + v7);
  v9 = [NSNumber numberWithInteger:a3];
  v10 = [v8 objectForKey:v9];

  if (!a5 && !v10)
  {
    v11 = [NSNumber numberWithInteger:0];
    v10 = [v8 objectForKey:v11];
  }
  return v10;
}

- (id)contentPositionOffsetForSegment:(int64_t)a3 inMiniBar:(BOOL)a4
{
  return [(_UISegmentedControlAppearanceStorage *)self contentPositionOffsetForSegment:a3 inMiniBar:a4 noFallback:0];
}

- (id)backgroundImageForState:(unint64_t)a3 isMini:(BOOL)a4 withFallback:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  uint64_t v9 = 8;
  if (a4) {
    uint64_t v9 = 16;
  }
  v10 = (NSMutableDictionary *)*(id *)((char *)&self->super.isa + v9);
  int v11 = !v6;
  if (v10) {
    int v11 = 1;
  }
  if (v11) {
    v12 = v10;
  }
  else {
    v12 = 0;
  }
  if ((v11 & 1) == 0 && v5) {
    v12 = self->_backgroundImages;
  }
  v13 = [NSNumber numberWithInteger:a3];
  v14 = [(NSMutableDictionary *)v12 objectForKey:v13];
  if (v14) {
    BOOL v15 = 1;
  }
  else {
    BOOL v15 = !v5;
  }
  if (!v15)
  {
    if (v12 == self->_backgroundImages)
    {
      v14 = 0;
    }
    else
    {
      v14 = [(NSMutableDictionary *)v12 objectForKey:v13];
    }
  }

  return v14;
}

- (id)textAttributesForState:(unint64_t)a3
{
  textAttributesForState = self->_textAttributesForState;
  v4 = [NSNumber numberWithInteger:a3];
  BOOL v5 = [(NSMutableDictionary *)textAttributesForState objectForKey:v4];

  return v5;
}

- (id)backgroundImageForState:(unint64_t)a3 isMini:(BOOL)a4
{
  return [(_UISegmentedControlAppearanceStorage *)self backgroundImageForState:a3 isMini:a4 withFallback:0];
}

- (id)dividerImageForLeftSegmentState:(unint64_t)a3 rightSegmentState:(unint64_t)a4 isMini:(BOOL)a5 withFallback:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a5;
  uint64_t v11 = 24;
  if (a5) {
    uint64_t v11 = 32;
  }
  v12 = (NSMutableDictionary *)*(id *)((char *)&self->super.isa + v11);
  int v13 = !v7;
  if (v12) {
    int v13 = 1;
  }
  if (v13) {
    v14 = v12;
  }
  else {
    v14 = 0;
  }
  if ((v13 & 1) == 0 && v6) {
    v14 = self->_dividerImages;
  }
  BOOL v15 = [NSNumber numberWithInteger:a4 + 100 * a3];
  v16 = [(NSMutableDictionary *)v14 objectForKey:v15];
  if (v16) {
    BOOL v17 = 1;
  }
  else {
    BOOL v17 = !v6;
  }
  if (!v17)
  {
    dividerImages = self->_dividerImages;
    if (v14 == dividerImages)
    {
      v16 = 0;
    }
    else
    {
      v16 = [(NSMutableDictionary *)dividerImages objectForKey:v15];
    }
  }

  return v16;
}

- (BOOL)legacySuppressOptionsBackground
{
  return self->_legacySuppressOptionsBackground;
}

- (id)anyDividerImageForMini:(BOOL)a3
{
  uint64_t v4 = 24;
  if (a3) {
    uint64_t v4 = 32;
  }
  BOOL v5 = (NSMutableDictionary *)*(id *)((char *)&self->super.isa + v4);
  if (!v5) {
    BOOL v5 = self->_dividerImages;
  }
  BOOL v6 = [NSNumber numberWithInteger:0];
  BOOL v7 = [(NSMutableDictionary *)v5 objectForKey:v6];
  id v8 = v7;
  if (v7)
  {
    id v9 = v7;
  }
  else
  {
    v10 = [(NSMutableDictionary *)v5 allValues];
    id v9 = [v10 lastObject];
  }
  return v9;
}

- (id)anyDividerImage
{
  v3 = [(_UISegmentedControlAppearanceStorage *)self anyDividerImageForMini:0];
  uint64_t v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    id v5 = [(_UISegmentedControlAppearanceStorage *)self anyDividerImageForMini:1];
  }
  BOOL v6 = v5;

  return v6;
}

- (void)setTextAttributes:(id)a3 forState:(unint64_t)a4
{
  id v6 = a3;
  textAttributesForState = self->_textAttributesForState;
  if (v6)
  {
    id v13 = v6;
    if (!textAttributesForState)
    {
      id v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
      id v9 = self->_textAttributesForState;
      self->_textAttributesForState = v8;

      id v6 = v13;
    }
    v10 = (void *)[v6 copy];
    uint64_t v11 = self->_textAttributesForState;
    v12 = [NSNumber numberWithInteger:a4];
    [(NSMutableDictionary *)v11 setObject:v10 forKey:v12];
  }
  else
  {
    if (!textAttributesForState) {
      goto LABEL_8;
    }
    id v13 = 0;
    v10 = [NSNumber numberWithInteger:a4];
    [(NSMutableDictionary *)textAttributesForState removeObjectForKey:v10];
  }

  id v6 = v13;
LABEL_8:
}

- (_UISegmentedControlAppearanceStorage)init
{
  v3.receiver = self;
  v3.super_class = (Class)_UISegmentedControlAppearanceStorage;
  result = [(_UISegmentedControlAppearanceStorage *)&v3 init];
  if (result) {
    *(int64x2_t *)&result->_leftCapWidth = vdupq_n_s64(0x7FFFFFFFFFFFFFFFuLL);
  }
  return result;
}

- (BOOL)wantsTrackingSuppressed
{
  if (self->_legacyDontHighlight) {
    return 1;
  }
  backgroundImages = self->_backgroundImages;
  id v5 = [NSNumber numberWithInteger:1];
  id v6 = [(NSMutableDictionary *)backgroundImages objectForKey:v5];
  if (v6)
  {
    BOOL v2 = 0;
  }
  else
  {
    miniBackgroundImages = self->_miniBackgroundImages;
    id v8 = [NSNumber numberWithInteger:1];
    id v9 = [(NSMutableDictionary *)miniBackgroundImages objectForKey:v8];
    BOOL v2 = v9 == 0;
  }
  return v2;
}

- (void)setBackgroundPositionAdjustment:(double)a3 forBarMetrics:(int64_t)a4
{
  id v14 = [NSNumber numberWithInteger:a4];
  id v6 = -[NSMutableDictionary objectForKey:](self->_backgroundPositionAdjustmentsForBarMetrics, "objectForKey:");
  [v6 floatValue];
  double v8 = v7;

  if (v8 != a3)
  {
    backgroundPositionAdjustmentsForBarMetrics = self->_backgroundPositionAdjustmentsForBarMetrics;
    if (!backgroundPositionAdjustmentsForBarMetrics)
    {
      uint64_t v11 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
      v12 = self->_backgroundPositionAdjustmentsForBarMetrics;
      self->_backgroundPositionAdjustmentsForBarMetrics = v11;

      backgroundPositionAdjustmentsForBarMetrics = self->_backgroundPositionAdjustmentsForBarMetrics;
    }
    *(float *)&double v9 = a3;
    id v13 = [NSNumber numberWithFloat:v9];
    [(NSMutableDictionary *)backgroundPositionAdjustmentsForBarMetrics setObject:v13 forKey:v14];
  }
}

- (double)backgroundPositionAdjustmentForBarMetrics:(int64_t)a3
{
  backgroundPositionAdjustmentsForBarMetrics = self->_backgroundPositionAdjustmentsForBarMetrics;
  uint64_t v4 = [NSNumber numberWithInteger:a3];
  id v5 = [(NSMutableDictionary *)backgroundPositionAdjustmentsForBarMetrics objectForKey:v4];
  [v5 floatValue];
  double v7 = v6;

  return v7;
}

- (void)setContentPositionOffset:(id)a3 forSegment:(int64_t)a4 inMiniBar:(BOOL)a5
{
  BOOL v5 = a5;
  unint64_t v15 = (unint64_t)a3;
  if (v5) {
    uint64_t v8 = 64;
  }
  else {
    uint64_t v8 = 56;
  }
  unint64_t v9 = (unint64_t)*(id *)((char *)&self->super.isa + v8);
  v10 = (void *)v15;
  if (v15 | v9)
  {
    id v11 = (id)v9;
    if (!v9)
    {
      v12 = (objc_class *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
      id v13 = *(Class *)((char *)&self->super.isa + v8);
      *(Class *)((char *)&self->super.isa + v8) = v12;

      id v11 = *(id *)((char *)&self->super.isa + v8);
    }
    id v14 = [NSNumber numberWithInteger:a4];
    if (v15) {
      [v11 setObject:v15 forKey:v14];
    }
    else {
      [v11 removeObjectForKey:v14];
    }

    v10 = (void *)v15;
  }
}

- (void)setBackgroundImage:(id)a3 forState:(unint64_t)a4 isMini:(BOOL)a5
{
  BOOL v5 = a5;
  unint64_t v15 = (unint64_t)a3;
  if (v5) {
    uint64_t v8 = 16;
  }
  else {
    uint64_t v8 = 8;
  }
  unint64_t v9 = (unint64_t)*(id *)((char *)&self->super.isa + v8);
  v10 = (void *)v15;
  if (v15 | v9)
  {
    id v11 = (id)v9;
    if (!v9)
    {
      v12 = (objc_class *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
      id v13 = *(Class *)((char *)&self->super.isa + v8);
      *(Class *)((char *)&self->super.isa + v8) = v12;

      id v11 = *(id *)((char *)&self->super.isa + v8);
    }
    id v14 = [NSNumber numberWithInteger:a4];
    if (v15) {
      [v11 setObject:v15 forKey:v14];
    }
    else {
      [v11 removeObjectForKey:v14];
    }

    v10 = (void *)v15;
  }
}

- (void)setDividerImage:(id)a3 forLeftSegmentState:(unint64_t)a4 rightSegmentState:(unint64_t)a5 isMini:(BOOL)a6
{
  BOOL v6 = a6;
  unint64_t v17 = (unint64_t)a3;
  if (v6) {
    uint64_t v10 = 32;
  }
  else {
    uint64_t v10 = 24;
  }
  unint64_t v11 = (unint64_t)*(id *)((char *)&self->super.isa + v10);
  v12 = (void *)v17;
  if (v17 | v11)
  {
    id v13 = (id)v11;
    if (!v11)
    {
      id v14 = (objc_class *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
      unint64_t v15 = *(Class *)((char *)&self->super.isa + v10);
      *(Class *)((char *)&self->super.isa + v10) = v14;

      id v13 = *(id *)((char *)&self->super.isa + v10);
    }
    v16 = [NSNumber numberWithInteger:a5 + 100 * a4];
    if (v17) {
      [v13 setObject:v17 forKey:v16];
    }
    else {
      [v13 removeObjectForKey:v16];
    }

    v12 = (void *)v17;
  }
}

- (id)dividerImageForLeftSegmentState:(unint64_t)a3 rightSegmentState:(unint64_t)a4 isMini:(BOOL)a5
{
  return [(_UISegmentedControlAppearanceStorage *)self dividerImageForLeftSegmentState:a3 rightSegmentState:a4 isMini:a5 withFallback:0];
}

- (void)takeTextAttributesFrom:(id *)a3 forState:(unint64_t)a4
{
  double v7 = [(_UISegmentedControlAppearanceStorage *)self textAttributesForState:a4];
  uint64_t v8 = (void *)[v7 mutableCopy];
  unint64_t v9 = v8;
  if (v8) {
    id v10 = v8;
  }
  else {
    id v10 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  }
  id v12 = v10;

  [v12 setValue:a3->var3 forKey:*(void *)off_1E52D2048];
  if (a3->var4)
  {
    id v11 = objc_alloc_init((Class)off_1E52D2E28);
    [v11 setShadowColor:a3->var4];
    objc_msgSend(v11, "setShadowOffset:", a3->var5.width, a3->var5.height);
  }
  else
  {
    id v11 = 0;
  }
  [v12 setValue:v11 forKey:*(void *)off_1E52D2238];
  [(_UISegmentedControlAppearanceStorage *)self setTextAttributes:v12 forState:a4];
}

- (void)setDetail:(id *)a3
{
  if (a3)
  {
    self->_legacySuppressOptionsBackground = 1;
    self->_legacyDontHighlight = a3->var7;
    double var1 = a3->var1;
    if (a3->var2 != 0.0 || var1 != 0.0)
    {
      v23[0] = *(void *)&a3->var2;
      *(double *)&v23[1] = var1;
      BOOL v6 = [MEMORY[0x1E4F29238] valueWithBytes:v23 objCType:"{UIOffset=dd}"];
      double v7 = a3->var1;
      v22[0] = -a3->var2;
      v22[1] = v7;
      uint64_t v8 = [MEMORY[0x1E4F29238] valueWithBytes:v22 objCType:"{UIOffset=dd}"];
      double v9 = a3->var1;
      v21[0] = 0;
      *(double *)&v21[1] = v9;
      id v10 = [MEMORY[0x1E4F29238] valueWithBytes:v21 objCType:"{UIOffset=dd}"];
      [(_UISegmentedControlAppearanceStorage *)self setContentPositionOffset:v6 forSegment:4 inMiniBar:0];
      [(_UISegmentedControlAppearanceStorage *)self setContentPositionOffset:v6 forSegment:1 inMiniBar:0];
      [(_UISegmentedControlAppearanceStorage *)self setContentPositionOffset:v8 forSegment:3 inMiniBar:0];
      [(_UISegmentedControlAppearanceStorage *)self setContentPositionOffset:v10 forSegment:2 inMiniBar:0];
    }
    [(_UISegmentedControlAppearanceStorage *)self setBackgroundImage:a3->var3.var0 forState:0 isMini:0];
    [(_UISegmentedControlAppearanceStorage *)self setBackgroundImage:a3->var4.var0 forState:4 isMini:0];
    [(_UISegmentedControlAppearanceStorage *)self setBackgroundImage:a3->var6.var0 forState:2 isMini:0];
    [(_UISegmentedControlAppearanceStorage *)self setDividerImage:a3->var3.var1 forLeftSegmentState:0 rightSegmentState:0 isMini:0];
    [(_UISegmentedControlAppearanceStorage *)self setDividerImage:a3->var4.var1 forLeftSegmentState:0 rightSegmentState:4 isMini:0];
    [(_UISegmentedControlAppearanceStorage *)self setDividerImage:a3->var4.var2 forLeftSegmentState:4 rightSegmentState:0 isMini:0];
    [(_UISegmentedControlAppearanceStorage *)self setDividerImage:a3->var6.var1 forLeftSegmentState:0 rightSegmentState:2 isMini:0];
    [(_UISegmentedControlAppearanceStorage *)self setDividerImage:a3->var6.var2 forLeftSegmentState:2 rightSegmentState:0 isMini:0];
    id v11 = [(_UISegmentedControlAppearanceStorage *)self textAttributesForState:0];
    id v12 = (id)[v11 mutableCopy];

    if (a3->var0 && !v12) {
      id v12 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    }
    objc_msgSend(v12, "setValue:forKey:");
    [(_UISegmentedControlAppearanceStorage *)self setTextAttributes:v12 forState:0];
    if (a3->var3.var3 || a3->var3.var4)
    {
      long long v13 = *(_OWORD *)&a3->var3.var2;
      long long v17 = *(_OWORD *)&a3->var3.var0;
      long long v18 = v13;
      long long v19 = *(_OWORD *)&a3->var3.var4;
      CGFloat height = a3->var3.var5.height;
      [(_UISegmentedControlAppearanceStorage *)self takeTextAttributesFrom:&v17 forState:0];
    }
    if (a3->var4.var3 || a3->var4.var4)
    {
      long long v14 = *(_OWORD *)&a3->var4.var2;
      long long v17 = *(_OWORD *)&a3->var4.var0;
      long long v18 = v14;
      long long v19 = *(_OWORD *)&a3->var4.var4;
      CGFloat height = a3->var4.var5.height;
      [(_UISegmentedControlAppearanceStorage *)self takeTextAttributesFrom:&v17 forState:4];
    }
    if (a3->var6.var3 || a3->var6.var4)
    {
      long long v15 = *(_OWORD *)&a3->var6.var2;
      long long v17 = *(_OWORD *)&a3->var6.var0;
      long long v18 = v15;
      long long v19 = *(_OWORD *)&a3->var6.var4;
      CGFloat height = a3->var6.var5.height;
      [(_UISegmentedControlAppearanceStorage *)self takeTextAttributesFrom:&v17 forState:2];
    }
    if (!a3->var7)
    {
      [(_UISegmentedControlAppearanceStorage *)self setBackgroundImage:a3->var5.var0 forState:1 isMini:0];
      [(_UISegmentedControlAppearanceStorage *)self setDividerImage:a3->var5.var1 forLeftSegmentState:0 rightSegmentState:1 isMini:0];
      [(_UISegmentedControlAppearanceStorage *)self setDividerImage:a3->var5.var2 forLeftSegmentState:1 rightSegmentState:0 isMini:0];
      if (a3->var5.var3 || a3->var5.var4)
      {
        long long v16 = *(_OWORD *)&a3->var5.var2;
        long long v17 = *(_OWORD *)&a3->var5.var0;
        long long v18 = v16;
        long long v19 = *(_OWORD *)&a3->var5.var4;
        CGFloat height = a3->var5.var5.height;
        [(_UISegmentedControlAppearanceStorage *)self takeTextAttributesFrom:&v17 forState:1];
      }
    }
  }
  else
  {
    [(NSMutableDictionary *)self->_backgroundImages removeAllObjects];
    [(NSMutableDictionary *)self->_dividerImages removeAllObjects];
    *(_WORD *)&self->_legacyDontHighlight = 0;
  }
}

- (void)setIsTiled:(BOOL)a3 leftCapWidth:(unint64_t)a4 rightCapWidth:(unint64_t)a5
{
  self->_isTiled = a3;
  self->_leftCapWidth = a4;
  self->_rightCapWidth = a5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_miniContentPositionOffsets, 0);
  objc_storeStrong((id *)&self->_contentPositionOffsets, 0);
  objc_storeStrong((id *)&self->_backgroundPositionAdjustmentsForBarMetrics, 0);
  objc_storeStrong((id *)&self->_textAttributesForState, 0);
  objc_storeStrong((id *)&self->_miniDividerImages, 0);
  objc_storeStrong((id *)&self->_dividerImages, 0);
  objc_storeStrong((id *)&self->_miniBackgroundImages, 0);
  objc_storeStrong((id *)&self->_backgroundImages, 0);
}

@end