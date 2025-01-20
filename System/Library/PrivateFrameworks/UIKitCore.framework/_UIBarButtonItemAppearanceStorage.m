@interface _UIBarButtonItemAppearanceStorage
- (NSValue)backButtonTitlePositionOffset;
- (NSValue)miniBackButtonTitlePositionOffset;
- (NSValue)miniTitlePositionOffset;
- (NSValue)titlePositionOffset;
- (UIColor)tintColor;
- (double)backButtonBackgroundVerticalAdjustmentForBarMetrics:(int64_t)a3;
- (double)backgroundVerticalAdjustmentForBarMetrics:(int64_t)a3;
- (id)anyBackButtonBackgroundImage;
- (id)anyBackgroundImage;
- (id)backButtonBackgroundImageForState:(unint64_t)a3 isMini:(BOOL)a4;
- (id)backgroundImageForState:(unint64_t)a3 style:(int64_t)a4 isMini:(BOOL)a5;
- (void)setBackButtonBackgroundImage:(id)a3 forState:(unint64_t)a4 isMini:(BOOL)a5;
- (void)setBackButtonBackgroundVerticalAdjustment:(double)a3 forBarMetrics:(int64_t)a4;
- (void)setBackButtonTitlePositionOffset:(id)a3;
- (void)setBackgroundImage:(id)a3 forState:(unint64_t)a4 style:(int64_t)a5 isMini:(BOOL)a6;
- (void)setBackgroundVerticalAdjustment:(double)a3 forBarMetrics:(int64_t)a4;
- (void)setMiniBackButtonTitlePositionOffset:(id)a3;
- (void)setMiniTitlePositionOffset:(id)a3;
- (void)setTintColor:(id)a3;
- (void)setTitlePositionOffset:(id)a3;
@end

@implementation _UIBarButtonItemAppearanceStorage

- (id)backgroundImageForState:(unint64_t)a3 style:(int64_t)a4 isMini:(BOOL)a5
{
  uint64_t v7 = 1;
  if (a5) {
    uint64_t v7 = 0;
  }
  v8 = NSNumber;
  id v9 = objc_retain(*(id *)((char *)&self->super.super.isa
                         + OBJC_IVAR____UIBarButtonItemAppearanceStorage_miniBackgroundImages[v7]));
  v10 = [v8 numberWithInteger:a3];
  v11 = [v9 objectForKey:v10];

  v12 = [NSNumber numberWithInteger:a4];
  v13 = [v11 objectForKey:v12];

  if (!v13)
  {
    int v14 = dyld_program_sdk_at_least();
    if (!a4 && v14)
    {
      v15 = [NSNumber numberWithInteger:1];
      v13 = [v11 objectForKey:v15];
    }
    if (a4 != 8 && !v13)
    {
      v16 = [NSNumber numberWithInteger:8];
      v13 = [v11 objectForKey:v16];
    }
  }

  return v13;
}

- (double)backgroundVerticalAdjustmentForBarMetrics:(int64_t)a3
{
  backgroundVerticalAdjustmentsForBarMetrics = self->backgroundVerticalAdjustmentsForBarMetrics;
  v6 = objc_msgSend(NSNumber, "numberWithInteger:");
  uint64_t v7 = [(NSMutableDictionary *)backgroundVerticalAdjustmentsForBarMetrics objectForKey:v6];

  if (!v7)
  {
    if ((unint64_t)(a3 - 101) > 1)
    {
      uint64_t v7 = 0;
    }
    else
    {
      v8 = self->backgroundVerticalAdjustmentsForBarMetrics;
      id v9 = [NSNumber numberWithInteger:a3 == 102];
      uint64_t v7 = [(NSMutableDictionary *)v8 objectForKey:v9];
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

- (UIColor)tintColor
{
  return self->tintColor;
}

- (void)setTintColor:(id)a3
{
}

- (void)setBackgroundImage:(id)a3 forState:(unint64_t)a4 style:(int64_t)a5 isMini:(BOOL)a6
{
  BOOL v6 = a6;
  unint64_t v22 = (unint64_t)a3;
  uint64_t v10 = 1;
  if (v6) {
    uint64_t v10 = 0;
  }
  uint64_t v11 = OBJC_IVAR____UIBarButtonItemAppearanceStorage_miniBackgroundImages[v10];
  unint64_t v12 = (unint64_t)*(id *)((char *)&self->super.super.isa + v11);
  v13 = (void *)v22;
  if (v22 | v12)
  {
    int v14 = [NSNumber numberWithInteger:a4];
    if (v22)
    {
      if (!v12)
      {
        v15 = (objc_class *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
        uint64_t v16 = 1;
        if (v6) {
          uint64_t v16 = 0;
        }
        uint64_t v17 = OBJC_IVAR____UIBarButtonItemAppearanceStorage_miniBackgroundImages[v16];
        v18 = *(Class *)((char *)&self->super.super.isa + v17);
        *(Class *)((char *)&self->super.super.isa + v17) = v15;

        unint64_t v12 = (unint64_t)*(id *)((char *)&self->super.super.isa + v17);
      }
      id v19 = [(id)v12 objectForKey:v14];
      if (!v19)
      {
        id v19 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
        [(id)v12 setObject:v19 forKey:v14];
      }
      v20 = [NSNumber numberWithInteger:a5];
      [v19 setObject:v22 forKey:v20];
    }
    else
    {
      id v19 = [(id)v12 objectForKey:v14];
      v21 = [NSNumber numberWithInteger:a5];
      [v19 removeObjectForKey:v21];

      if ([v19 count]) {
        goto LABEL_15;
      }
      [(id)v12 removeObjectForKey:v14];
      if ([(id)v12 count]) {
        goto LABEL_15;
      }
      v20 = *(Class *)((char *)&self->super.super.isa + v11);
      *(Class *)((char *)&self->super.super.isa + v11) = 0;
    }

LABEL_15:
    v13 = (void *)v22;
  }
}

- (id)anyBackgroundImage
{
  v3 = [NSNumber numberWithInteger:0];
  v4 = [NSNumber numberWithInteger:8];
  v5 = [(NSMutableDictionary *)self->backgroundImages objectForKey:v3];
  BOOL v6 = v5;
  if (v5)
  {
    id v7 = v5;
  }
  else
  {
    v8 = [(NSMutableDictionary *)self->backgroundImages allValues];
    id v7 = [v8 lastObject];
  }
  uint64_t v9 = [v7 objectForKey:v4];
  if (v9)
  {
    id v10 = (id)v9;
  }
  else
  {
    uint64_t v11 = [v7 allValues];
    id v10 = [v11 lastObject];

    if (!v10)
    {
      int v14 = [(NSMutableDictionary *)self->miniBackgroundImages objectForKey:v3];
      v15 = v14;
      if (v14)
      {
        id v12 = v14;
      }
      else
      {
        uint64_t v16 = [(NSMutableDictionary *)self->miniBackgroundImages allValues];
        id v12 = [v16 lastObject];

        id v7 = v16;
      }

      uint64_t v17 = [v12 objectForKey:v4];
      v18 = v17;
      if (v17)
      {
        id v10 = v17;
      }
      else
      {
        id v19 = [v12 allValues];
        id v10 = [v19 lastObject];
      }
      goto LABEL_8;
    }
  }
  id v12 = v7;
LABEL_8:

  return v10;
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
  uint64_t v9 = [NSNumber numberWithInteger:a4];
  [(NSMutableDictionary *)self->backgroundVerticalAdjustmentsForBarMetrics setObject:v10 forKey:v9];
}

- (void)setBackButtonBackgroundVerticalAdjustment:(double)a3 forBarMetrics:(int64_t)a4
{
  backButtonAppearance = self->backButtonAppearance;
  if (!backButtonAppearance)
  {
    v8 = objc_alloc_init(_UIBarBackButtonItemAppearanceStorage);
    uint64_t v9 = self->backButtonAppearance;
    self->backButtonAppearance = v8;

    backButtonAppearance = self->backButtonAppearance;
  }
  [(_UIBarBackButtonItemAppearanceStorage *)backButtonAppearance setBackgroundVerticalAdjustment:a4 forBarMetrics:a3];
}

- (double)backButtonBackgroundVerticalAdjustmentForBarMetrics:(int64_t)a3
{
  [(_UIBarBackButtonItemAppearanceStorage *)self->backButtonAppearance backgroundVerticalAdjustmentForBarMetrics:a3];
  return result;
}

- (void)setBackButtonBackgroundImage:(id)a3 forState:(unint64_t)a4 isMini:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  backButtonAppearance = self->backButtonAppearance;
  id v12 = v8;
  if (v8)
  {
    if (!backButtonAppearance)
    {
      id v10 = objc_alloc_init(_UIBarBackButtonItemAppearanceStorage);
      uint64_t v11 = self->backButtonAppearance;
      self->backButtonAppearance = v10;

      backButtonAppearance = self->backButtonAppearance;
    }
  }
  else if (!backButtonAppearance)
  {
    goto LABEL_6;
  }
  [(_UIBarBackButtonItemAppearanceStorage *)backButtonAppearance setBackgroundImage:v12 forState:a4 isMini:v5];
  id v8 = v12;
LABEL_6:
}

- (id)backButtonBackgroundImageForState:(unint64_t)a3 isMini:(BOOL)a4
{
  return [(_UIBarBackButtonItemAppearanceStorage *)self->backButtonAppearance backgroundImageForState:a3 isMini:a4];
}

- (id)anyBackButtonBackgroundImage
{
  return [(_UIBarBackButtonItemAppearanceStorage *)self->backButtonAppearance anyBackgroundImage];
}

- (void)setBackButtonTitlePositionOffset:(id)a3
{
  id v4 = a3;
  backButtonAppearance = self->backButtonAppearance;
  id v8 = v4;
  if (v4)
  {
    if (!backButtonAppearance)
    {
      BOOL v6 = objc_alloc_init(_UIBarBackButtonItemAppearanceStorage);
      id v7 = self->backButtonAppearance;
      self->backButtonAppearance = v6;

      backButtonAppearance = self->backButtonAppearance;
    }
  }
  else if (!backButtonAppearance)
  {
    goto LABEL_6;
  }
  [(_UIBarBackButtonItemAppearanceStorage *)backButtonAppearance setTitlePositionOffset:v8];
  id v4 = v8;
LABEL_6:
}

- (NSValue)backButtonTitlePositionOffset
{
  return [(_UIBarBackButtonItemAppearanceStorage *)self->backButtonAppearance titlePositionOffset];
}

- (void)setMiniBackButtonTitlePositionOffset:(id)a3
{
  id v4 = a3;
  backButtonAppearance = self->backButtonAppearance;
  id v8 = v4;
  if (v4)
  {
    if (!backButtonAppearance)
    {
      BOOL v6 = objc_alloc_init(_UIBarBackButtonItemAppearanceStorage);
      id v7 = self->backButtonAppearance;
      self->backButtonAppearance = v6;

      backButtonAppearance = self->backButtonAppearance;
    }
  }
  else if (!backButtonAppearance)
  {
    goto LABEL_6;
  }
  [(_UIBarBackButtonItemAppearanceStorage *)backButtonAppearance setMiniTitlePositionOffset:v8];
  id v4 = v8;
LABEL_6:
}

- (NSValue)miniBackButtonTitlePositionOffset
{
  return [(_UIBarBackButtonItemAppearanceStorage *)self->backButtonAppearance miniTitlePositionOffset];
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
  objc_storeStrong((id *)&self->backButtonAppearance, 0);
  objc_storeStrong((id *)&self->backgroundVerticalAdjustmentsForBarMetrics, 0);
  objc_storeStrong((id *)&self->miniTitlePositionOffset, 0);
  objc_storeStrong((id *)&self->titlePositionOffset, 0);
  objc_storeStrong((id *)&self->tintColor, 0);
  objc_storeStrong((id *)&self->miniBackgroundImages, 0);
  objc_storeStrong((id *)&self->backgroundImages, 0);
}

@end