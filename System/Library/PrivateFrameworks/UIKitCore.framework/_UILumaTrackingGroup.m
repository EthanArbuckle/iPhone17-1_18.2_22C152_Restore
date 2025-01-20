@interface _UILumaTrackingGroup
- ($F24F406B2B787EFB06265DBA3D28CBD5)transitionBoundaries;
- (BOOL)isPaused;
- (_UILumaTrackingGroup)initWithTransitionBoundaries:(id)a3 minimumDifference:(double)a4 delegate:(id)a5 views:(id)a6;
- (double)minimumDifference;
- (unint64_t)backgroundLuminanceLevel;
- (void)_updateLumaValue;
- (void)backgroundLumaView:(id)a3 didChangeLuma:(double)a4;
- (void)setMinimumDifference:(double)a3;
- (void)setPaused:(BOOL)a3;
- (void)setTransitionBoundaries:(id)a3;
- (void)unpauseAfterSeedingWithLumaLevel:(unint64_t)a3;
@end

@implementation _UILumaTrackingGroup

- (void)_updateLumaValue
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  v3 = self->_lumaValues;
  uint64_t v4 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v34 objects:v38 count:16];
  if (!v4)
  {
LABEL_38:

    return;
  }
  uint64_t v5 = v4;
  uint64_t v6 = 0;
  uint64_t v7 = *(void *)v35;
  double v8 = 0.0;
  do
  {
    for (uint64_t i = 0; i != v5; ++i)
    {
      if (*(void *)v35 != v7) {
        objc_enumerationMutation(v3);
      }
      v10 = *(void **)(*((void *)&v34 + 1) + 8 * i);
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        objc_msgSend(v10, "floatValue", (void)v34);
        double v8 = v8 + v11;
        ++v6;
      }
    }
    uint64_t v5 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v34 objects:v38 count:16];
  }
  while (v5);

  if (v6 >= 1)
  {
    unint64_t backgroundLuminanceLevel = self->_backgroundLuminanceLevel;
    double v13 = v8 / (double)v6;
    if (BSFloatGreaterThanOrEqualToFloat())
    {
      unint64_t v14 = 1;
    }
    else if (BSFloatLessThanOrEqualToFloat())
    {
      unint64_t v14 = 2;
    }
    else
    {
      if (self->_backgroundLuminanceLevel) {
        goto LABEL_19;
      }
      int v15 = BSFloatGreaterThanOrEqualToFloat();
      unint64_t v14 = 1;
      if (!v15) {
        unint64_t v14 = 2;
      }
    }
    self->_unint64_t backgroundLuminanceLevel = v14;
LABEL_19:
    v3 = self->_outliers;
    v16 = (NSMapTable *)[objc_alloc(MEMORY[0x1E4F28E10]) initWithKeyOptions:0 valueOptions:0x10000 capacity:1];
    outliers = self->_outliers;
    self->_outliers = v16;

    if ((unint64_t)v6 >= 2 && [(NSArray *)self->_lumaViews count])
    {
      unint64_t v18 = 0;
      double v19 = v13 * (double)v6;
      double v20 = (double)(v6 - 1);
      do
      {
        v21 = -[NSArray objectAtIndexedSubscript:](self->_lumaViews, "objectAtIndexedSubscript:", v18, (void)v34);
        uint64_t v22 = [v21 backgroundLuminanceLevel];
        if (!v22) {
          goto LABEL_33;
        }
        uint64_t v23 = v22;
        if (v22 == self->_backgroundLuminanceLevel) {
          goto LABEL_33;
        }
        v24 = [(NSMutableArray *)self->_lumaValues objectAtIndexedSubscript:v18];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          [v24 floatValue];
          double v26 = v25;
          double v27 = (v19 - v26) / v20;
          if (v23 != 1)
          {
            if (v23 != 2 || v27 - v26 <= self->_minimumDifference) {
              goto LABEL_32;
            }
            v28 = self->_outliers;
            v29 = NSNumber;
            uint64_t v30 = 2;
            goto LABEL_31;
          }
          if (v26 - v27 > self->_minimumDifference)
          {
            v28 = self->_outliers;
            v29 = NSNumber;
            uint64_t v30 = 1;
LABEL_31:
            v31 = [v29 numberWithUnsignedInteger:v30];
            [(NSMapTable *)v28 setObject:v31 forKey:v21];
          }
        }
LABEL_32:

LABEL_33:
        ++v18;
      }
      while (v18 < [(NSArray *)self->_lumaViews count]);
    }
    if (self->_backgroundLuminanceLevel != backgroundLuminanceLevel
      || ([(NSMapTable *)self->_outliers isEqual:v3] & 1) == 0)
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

      if (WeakRetained)
      {
        id v33 = objc_loadWeakRetained((id *)&self->_delegate);
        [v33 backgroundLumaGroup:self didTransitionToLevel:self->_backgroundLuminanceLevel viewsWithDifferentLevels:self->_outliers];
      }
    }
    goto LABEL_38;
  }
}

- (BOOL)isPaused
{
  return self->_paused;
}

- (void)setPaused:(BOOL)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (self->_paused != a3)
  {
    BOOL v3 = a3;
    self->_paused = a3;
    long long v9 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    uint64_t v4 = self->_lumaViews;
    uint64_t v5 = [(NSArray *)v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v10;
      do
      {
        uint64_t v8 = 0;
        do
        {
          if (*(void *)v10 != v7) {
            objc_enumerationMutation(v4);
          }
          objc_msgSend(*(id *)(*((void *)&v9 + 1) + 8 * v8++), "setPaused:", v3, (void)v9);
        }
        while (v6 != v8);
        uint64_t v6 = [(NSArray *)v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
      }
      while (v6);
    }
  }
}

- (_UILumaTrackingGroup)initWithTransitionBoundaries:(id)a3 minimumDifference:(double)a4 delegate:(id)a5 views:(id)a6
{
  double var1 = a3.var1;
  double var0 = a3.var0;
  id v10 = a5;
  id v11 = a6;
  v22.receiver = self;
  v22.super_class = (Class)_UILumaTrackingGroup;
  long long v12 = [(_UILumaTrackingGroup *)&v22 init];
  double v13 = v12;
  if (v12)
  {
    v12->_unint64_t backgroundLuminanceLevel = 0;
    v12->_transitionBoundaries.minimum = var0;
    v12->_transitionBoundaries.maximum = var1;
    objc_storeWeak((id *)&v12->_delegate, v10);
    v13->_paused = 1;
    uint64_t v14 = [v11 copy];
    lumaViews = v13->_lumaViews;
    v13->_lumaViews = (NSArray *)v14;

    uint64_t v16 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", -[NSArray count](v13->_lumaViews, "count"));
    lumaValues = v13->_lumaValues;
    v13->_lumaValues = (NSMutableArray *)v16;

    if ([(NSArray *)v13->_lumaViews count])
    {
      unint64_t v18 = 0;
      do
      {
        double v19 = [(NSArray *)v13->_lumaViews objectAtIndexedSubscript:v18];
        double v20 = [MEMORY[0x1E4F1CA98] null];
        [(NSMutableArray *)v13->_lumaValues setObject:v20 atIndexedSubscript:v18];

        [v19 setPaused:1];
        objc_msgSend(v19, "setTransitionBoundaries:", var0, var1);
        if (v19) {
          objc_storeWeak(v19 + 52, v13);
        }

        ++v18;
      }
      while (v18 < [(NSArray *)v13->_lumaViews count]);
    }
  }

  return v13;
}

- (void)backgroundLumaView:(id)a3 didChangeLuma:(double)a4
{
  NSUInteger v6 = [(NSArray *)self->_lumaViews indexOfObject:a3];
  if (v6 != 0x7FFFFFFFFFFFFFFFLL)
  {
    NSUInteger v7 = v6;
    uint64_t v8 = [NSNumber numberWithDouble:a4];
    [(NSMutableArray *)self->_lumaValues setObject:v8 atIndexedSubscript:v7];

    if ((*(unsigned char *)&self->_lumaTrackingGroupFlags & 1) == 0)
    {
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __57___UILumaTrackingGroup_backgroundLumaView_didChangeLuma___block_invoke;
      block[3] = &unk_1E52D9F70;
      block[4] = self;
      dispatch_async(MEMORY[0x1E4F14428], block);
      *(unsigned char *)&self->_lumaTrackingGroupFlags |= 1u;
    }
  }
}

- (void)unpauseAfterSeedingWithLumaLevel:(unint64_t)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if (self->_paused)
  {
    if (a3)
    {
      self->_unint64_t backgroundLuminanceLevel = a3;
      uint64_t v5 = (NSMapTable *)objc_opt_new();
      outliers = self->_outliers;
      self->_outliers = v5;

      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      if (WeakRetained)
      {
        id v8 = objc_loadWeakRetained((id *)&self->_delegate);
        [v8 backgroundLumaGroup:self didTransitionToLevel:self->_backgroundLuminanceLevel viewsWithDifferentLevels:self->_outliers];
      }
    }
    self->_paused = 0;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v9 = self->_lumaViews;
    uint64_t v10 = [(NSArray *)v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v15;
      do
      {
        uint64_t v13 = 0;
        do
        {
          if (*(void *)v15 != v12) {
            objc_enumerationMutation(v9);
          }
          objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * v13++), "unpauseAfterSeedingWithLumaLevel:", a3, (void)v14);
        }
        while (v11 != v13);
        uint64_t v11 = [(NSArray *)v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v11);
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_outliers, 0);
  objc_storeStrong((id *)&self->_lumaValues, 0);
  objc_storeStrong((id *)&self->_lumaViews, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- ($F24F406B2B787EFB06265DBA3D28CBD5)transitionBoundaries
{
  double minimum = self->_transitionBoundaries.minimum;
  double maximum = self->_transitionBoundaries.maximum;
  result.double var1 = maximum;
  result.double var0 = minimum;
  return result;
}

- (void)setTransitionBoundaries:(id)a3
{
  self->_transitionBoundaries = ($888842945EE2C7AB0ACD33E179C69952)a3;
}

- (double)minimumDifference
{
  return self->_minimumDifference;
}

- (void)setMinimumDifference:(double)a3
{
  self->_minimumDifference = a3;
}

- (unint64_t)backgroundLuminanceLevel
{
  return self->_backgroundLuminanceLevel;
}

@end