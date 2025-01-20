@interface _UIBarBackButtonItemAppearanceStorage
- (NSValue)miniTitlePositionOffset;
- (NSValue)titlePositionOffset;
- (double)backgroundVerticalAdjustmentForBarMetrics:(int64_t)a3;
- (id)anyBackgroundImage;
- (id)backgroundImageForState:(unint64_t)a3 isMini:(BOOL)a4;
- (void)setBackgroundImage:(id)a3 forState:(unint64_t)a4 isMini:(BOOL)a5;
- (void)setBackgroundVerticalAdjustment:(double)a3 forBarMetrics:(int64_t)a4;
- (void)setMiniTitlePositionOffset:(id)a3;
- (void)setTitlePositionOffset:(id)a3;
@end

@implementation _UIBarBackButtonItemAppearanceStorage

- (void)setBackgroundImage:(id)a3 forState:(unint64_t)a4 isMini:(BOOL)a5
{
  BOOL v5 = a5;
  unint64_t v17 = (unint64_t)a3;
  p_miniBackgroundImages = &self->miniBackgroundImages;
  p_backgroundImages = &self->backgroundImages;
  uint64_t v10 = 8;
  if (v5)
  {
    uint64_t v10 = 16;
    v11 = (id *)&self->miniBackgroundImages;
  }
  else
  {
    v11 = (id *)&self->backgroundImages;
  }
  unint64_t v12 = (unint64_t)*(id *)((char *)&self->super.isa + v10);
  if (v17 | v12)
  {
    if (v17)
    {
      if (!v12)
      {
        id v13 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
        id v14 = *v11;
        id *v11 = v13;

        unint64_t v12 = (unint64_t)*v11;
      }
      v15 = [NSNumber numberWithInteger:a4];
      [(id)v12 setObject:v17 forKey:v15];
      goto LABEL_9;
    }
    v16 = [NSNumber numberWithInteger:a4];
    [(id)v12 removeObjectForKey:v16];

    if (![(id)v12 count])
    {
      if (v5)
      {
        v15 = *p_miniBackgroundImages;
        *p_miniBackgroundImages = 0;
      }
      else
      {
        v15 = *p_backgroundImages;
        *p_backgroundImages = 0;
      }
LABEL_9:
    }
  }
  else
  {
    unint64_t v12 = 0;
  }
}

- (id)backgroundImageForState:(unint64_t)a3 isMini:(BOOL)a4
{
  uint64_t v5 = 8;
  if (a4) {
    uint64_t v5 = 16;
  }
  v6 = NSNumber;
  id v7 = *(id *)((char *)&self->super.isa + v5);
  v8 = [v6 numberWithInteger:a3];
  v9 = [v7 objectForKey:v8];

  return v9;
}

- (id)anyBackgroundImage
{
  v3 = [NSNumber numberWithInteger:0];
  id v4 = [(NSMutableDictionary *)self->backgroundImages objectForKey:v3];
  if (!v4)
  {
    uint64_t v5 = [(NSMutableDictionary *)self->backgroundImages allValues];
    id v4 = [v5 lastObject];

    if (!v4)
    {
      v6 = [(NSMutableDictionary *)self->miniBackgroundImages objectForKey:v3];
      id v7 = v6;
      if (v6)
      {
        id v4 = v6;
      }
      else
      {
        v8 = [(NSMutableDictionary *)self->miniBackgroundImages allValues];
        id v4 = [v8 lastObject];
      }
    }
  }

  return v4;
}

- (void)setBackgroundVerticalAdjustment:(double)a3 forBarMetrics:(int64_t)a4
{
  double v5 = a3;
  if (!self->backgroundVerticalAdjustmentsForBarMetrics)
  {
    id v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    backgroundVerticalAdjustmentsForBarMetrics = self->backgroundVerticalAdjustmentsForBarMetrics;
    self->backgroundVerticalAdjustmentsForBarMetrics = v7;
  }
  *(float *)&a3 = v5;
  id v10 = [NSNumber numberWithFloat:a3];
  v9 = [NSNumber numberWithInteger:a4];
  [(NSMutableDictionary *)self->backgroundVerticalAdjustmentsForBarMetrics setObject:v10 forKey:v9];
}

- (double)backgroundVerticalAdjustmentForBarMetrics:(int64_t)a3
{
  backgroundVerticalAdjustmentsForBarMetrics = self->backgroundVerticalAdjustmentsForBarMetrics;
  v6 = objc_msgSend(NSNumber, "numberWithInteger:");
  id v7 = [(NSMutableDictionary *)backgroundVerticalAdjustmentsForBarMetrics objectForKey:v6];

  if (!v7)
  {
    if ((unint64_t)(a3 - 101) > 1)
    {
      id v7 = 0;
    }
    else
    {
      v8 = self->backgroundVerticalAdjustmentsForBarMetrics;
      v9 = [NSNumber numberWithInteger:a3 == 102];
      id v7 = [(NSMutableDictionary *)v8 objectForKey:v9];
    }
  }
  [v7 floatValue];
  double v11 = v10;

  return v11;
}

- (NSValue)titlePositionOffset
{
  return self->titlePositionOffset;
}

- (void)setTitlePositionOffset:(id)a3
{
}

- (NSValue)miniTitlePositionOffset
{
  return self->miniTitlePositionOffset;
}

- (void)setMiniTitlePositionOffset:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->backgroundVerticalAdjustmentsForBarMetrics, 0);
  objc_storeStrong((id *)&self->miniTitlePositionOffset, 0);
  objc_storeStrong((id *)&self->titlePositionOffset, 0);
  objc_storeStrong((id *)&self->miniBackgroundImages, 0);
  objc_storeStrong((id *)&self->backgroundImages, 0);
}

@end