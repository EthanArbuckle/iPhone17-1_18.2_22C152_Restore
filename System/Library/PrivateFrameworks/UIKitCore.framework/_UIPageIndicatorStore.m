@interface _UIPageIndicatorStore
- (CGSize)_contentSizeForIndicatorsInRange:(_NSRange)a3 hasExpandedActiveIndicator:(BOOL)a4;
- (CGSize)_indicatorSizeForObject:(id)a3;
- (CGSize)_sizeForMaximumContentSizeFittingLength:(double)a3 hasExpandedActiveIndicator:(BOOL)a4;
- (CGSize)contentSizeForNumberOfPages:(int64_t)a3 hasExpandedActiveIndicator:(BOOL)a4;
- (CGSize)defaultIndicatorSize;
- (CGSize)indicatorSizeForPage:(int64_t)a3;
- (CGSize)minimumContentSizeForIndicatorsInRange:(_NSRange)a3 hasExpandedActiveIndicator:(BOOL)a4;
- (CGSize)resolvedIndicatorLayoutSizeForPage:(int64_t)a3;
- (CGSize)sizeForMaximumContentSizeFittingLength:(double)a3 hasExpandedActiveIndicator:(BOOL)a4;
- (NSMutableArray)store;
- (UIImage)indicatorImage;
- (UIImage)preferredActiveImage;
- (UIImage)preferredImage;
- (_UIPageIndicatorStore)init;
- (_UIPageIndicatorStoreDelegate)delegate;
- (double)indicatorPositionForContinuousPage:(double)a3 expandedIndicatorPage:(int64_t)a4;
- (double)indicatorSpacing;
- (id)_defaultIndicatorImage;
- (id)activeIndicatorImageForPage:(int64_t)a3;
- (id)customActiveIndicatorImageForPage:(int64_t)a3;
- (id)customIndicatorImageForPage:(int64_t)a3;
- (id)indicatorImageForPage:(int64_t)a3;
- (int64_t)_objectIndexForPage:(int64_t)a3 lower:(int64_t)a4 upper:(int64_t)a5;
- (int64_t)direction;
- (int64_t)numberOfPages;
- (int64_t)numberOfVisibleIndicatorsForStartIndex:(int64_t)a3 fittingLength:(double)a4 hasExpandedActiveIndicator:(BOOL)a5;
- (int64_t)objectIndexForPage:(int64_t)a3;
- (void)_insertImage:(id)a3 forPage:(int64_t)a4 active:(BOOL)a5;
- (void)_removeImageForPage:(int64_t)a3 active:(BOOL)a4;
- (void)_resetStore;
- (void)_updateImage:(id)a3 forPage:(int64_t)a4 active:(BOOL)a5;
- (void)invalidateLayoutCache;
- (void)setDelegate:(id)a3;
- (void)setDirection:(int64_t)a3;
- (void)setIndicatorSpacing:(double)a3;
- (void)setPreferredActiveImage:(id)a3;
- (void)setPreferredImage:(id)a3;
- (void)setStore:(id)a3;
- (void)updateActiveImage:(id)a3 forPage:(int64_t)a4;
- (void)updateImage:(id)a3 forPage:(int64_t)a4;
- (void)updateStoreForNumberOfPages:(int64_t)a3;
@end

@implementation _UIPageIndicatorStore

- (CGSize)resolvedIndicatorLayoutSizeForPage:(int64_t)a3
{
  v5 = [(_UIPageIndicatorStore *)self store];
  v6 = objc_msgSend(v5, "objectAtIndex:", -[_UIPageIndicatorStore objectIndexForPage:](self, "objectIndexForPage:", a3));

  [(_UIPageIndicatorStore *)self _indicatorSizeForObject:v6];
  double v8 = v7;
  double v10 = v9;

  double v11 = v8;
  double v12 = v10;
  result.height = v12;
  result.width = v11;
  return result;
}

- (CGSize)_indicatorSizeForObject:(id)a3
{
  v5 = (_UIPageIndicatorStoreObject *)a3;
  v6 = v5;
  if (!v5 || ![(_UIPageIndicatorStoreObject *)v5 hasImage])
  {
    double v7 = self->_defaultObject;

    v6 = v7;
  }
  [(_UIPageIndicatorStoreObject *)v6 indicatorSize];
  if (v9 == -1.0 && v8 == -1.0)
  {
    double v11 = [(_UIPageIndicatorStore *)self delegate];
    double v12 = [(_UIPageIndicatorStoreObject *)v6 customImage];
    v3 = v12;
    if (!v12)
    {
      v3 = [(_UIPageIndicatorStore *)self indicatorImage];
    }
    [v11 indicatorSizeForImage:v3];
    -[_UIPageIndicatorStoreObject setIndicatorSize:](v6, "setIndicatorSize:");
    if (!v12) {
  }
    }
  [(_UIPageIndicatorStoreObject *)v6 activeIndicatorSize];
  if (v14 == -1.0 && v13 == -1.0)
  {
    v15 = [(_UIPageIndicatorStore *)self delegate];
    uint64_t v16 = [(_UIPageIndicatorStoreObject *)v6 activeImage];
    v17 = (void *)v16;
    if (v16)
    {
      int v18 = 0;
      v19 = (void *)v16;
    }
    else
    {
      uint64_t v20 = [(_UIPageIndicatorStore *)self preferredActiveImage];
      v3 = (void *)v20;
      if (v20)
      {
        int v18 = 0;
        v19 = (void *)v20;
      }
      else
      {
        v19 = [(_UIPageIndicatorStore *)self indicatorImage];
        int v18 = 1;
      }
    }
    [v15 indicatorSizeForImage:v19];
    -[_UIPageIndicatorStoreObject setActiveIndicatorSize:](v6, "setActiveIndicatorSize:");
    if (v18) {

    }
    if (!v17) {
  }
    }
  [(_UIPageIndicatorStoreObject *)v6 resolvedSize];
  double v22 = v21;
  double v24 = v23;

  double v25 = v22;
  double v26 = v24;
  result.height = v26;
  result.width = v25;
  return result;
}

- (int64_t)objectIndexForPage:(int64_t)a3
{
  if (a3 < 0 || [(_UIPageIndicatorStore *)self numberOfPages] <= a3)
  {
    double v9 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"_UIPageIndicatorStore.m", 693, @"[UIPageControl] Page out-of-bounds. Requested %ld but the page control only has %ld pages.", a3, -[_UIPageIndicatorStore numberOfPages](self, "numberOfPages"));
  }
  v6 = [(_UIPageIndicatorStore *)self store];
  int64_t v7 = -[_UIPageIndicatorStore _objectIndexForPage:lower:upper:](self, "_objectIndexForPage:lower:upper:", a3, 0, [v6 count]);

  return v7;
}

- (int64_t)numberOfPages
{
  v2 = [(_UIPageIndicatorStore *)self store];
  v3 = [v2 lastObject];
  int64_t v4 = [v3 endIndex];

  return v4;
}

- (NSMutableArray)store
{
  return self->_store;
}

- (int64_t)_objectIndexForPage:(int64_t)a3 lower:(int64_t)a4 upper:(int64_t)a5
{
  int64_t v10 = a5 - a4;
  if (a5 < a4)
  {
    double v21 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"_UIPageIndicatorStore.m", 699, @"[UIPageControl] Failed to find page index. Tried to look for %ld.", a3);
  }
  if (v10 >= 0) {
    uint64_t v11 = v10;
  }
  else {
    uint64_t v11 = v10 + 1;
  }
  int64_t v12 = a4 + (v11 >> 1);
  double v13 = [(_UIPageIndicatorStore *)self store];
  double v14 = [v13 objectAtIndex:v12];

  if (([v14 validPageWithinBound:a3] & 1) == 0)
  {
    if ([v14 startIndex] > a3)
    {
      int64_t v15 = v12 - 1;
      uint64_t v16 = self;
      int64_t v17 = a3;
      int64_t v18 = a4;
LABEL_12:
      int64_t v12 = [(_UIPageIndicatorStore *)v16 _objectIndexForPage:v17 lower:v18 upper:v15];
      goto LABEL_13;
    }
    if ([v14 endIndex] <= a3)
    {
      int64_t v18 = v12 + 1;
      uint64_t v16 = self;
      int64_t v17 = a3;
      int64_t v15 = a5;
      goto LABEL_12;
    }
    v19 = [MEMORY[0x1E4F28B00] currentHandler];
    [v19 handleFailureInMethod:a2, self, @"_UIPageIndicatorStore.m", 709, @"Uhm, this shouldn't be possible?" object file lineNumber description];

    int64_t v12 = -1;
  }
LABEL_13:

  return v12;
}

- (UIImage)indicatorImage
{
  v3 = [(_UIPageIndicatorStore *)self preferredImage];
  int64_t v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    id v5 = [(_UIPageIndicatorStore *)self _defaultIndicatorImage];
  }
  v6 = v5;

  return (UIImage *)v6;
}

- (UIImage)preferredImage
{
  return self->_preferredImage;
}

- (int64_t)numberOfVisibleIndicatorsForStartIndex:(int64_t)a3 fittingLength:(double)a4 hasExpandedActiveIndicator:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v9 = 40;
  if (a5) {
    uint64_t v9 = 176;
  }
  int64_t v10 = (char *)self + v9;
  if ((*((unsigned char *)&self->super.isa + v9) & 1) == 0 && *((double *)v10 + 1) == a4 && *((void *)v10 + 2) == a3) {
    return *((void *)v10 + 3);
  }
  [(_UIPageIndicatorStore *)self indicatorSpacing];
  double v13 = v12;
  double v14 = v12 + a4;
  double v30 = v12 + a4;
  int64_t v15 = [(_UIPageIndicatorStore *)self objectIndexForPage:a3];
  uint64_t v29 = 0x10000000000000;
  if (v5) {
    uint64_t v16 = (double *)&v29;
  }
  else {
    uint64_t v16 = 0;
  }
  int64_t v17 = [(_UIPageIndicatorStore *)self store];
  unint64_t v18 = [v17 count];

  int64_t v11 = 0;
  if (v15 < v18)
  {
    int64_t v11 = 0;
    unint64_t v19 = v15;
    do
    {
      uint64_t v20 = _calculateVisibleIndicators(self, v19, v16, &v30, v13);
      v11 += v20;
      ++v19;
      double v21 = [(_UIPageIndicatorStore *)self store];
      unint64_t v22 = [v21 count];
    }
    while (v19 < v22 && v20);
    double v14 = v30;
  }
  if (v14 > 0.0 && v15 >= 1)
  {
    int64_t v24 = [(_UIPageIndicatorStore *)self objectIndexForPage:v15 - 1];
    if ((v24 & 0x8000000000000000) == 0)
    {
      uint64_t v25 = v24;
      do
      {
        uint64_t v26 = _calculateVisibleIndicators(self, v25, v16, &v30, v13);
        v11 += v26;
        BOOL v27 = v25-- != 0;
      }
      while (v27 && v26);
    }
  }
  *v10 &= ~1u;
  *((double *)v10 + 1) = a4;
  *((void *)v10 + 2) = a3;
  *((void *)v10 + 3) = v11;
  return v11;
}

- (double)indicatorPositionForContinuousPage:(double)a3 expandedIndicatorPage:(int64_t)a4
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  int64_t v7 = [(_UIPageIndicatorStore *)self store];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v31 objects:v35 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v32;
    BOOL v12 = a4 >= 0 && (uint64_t)a3 > a4;
    double v13 = 0.0;
LABEL_9:
    uint64_t v14 = 0;
    while (1)
    {
      if (*(void *)v32 != v10) {
        objc_enumerationMutation(v7);
      }
      int64_t v15 = *(void **)(*((void *)&v31 + 1) + 8 * v14);
      double v16 = (double)[v15 startIndex];
      if (v16 >= a3) {
        break;
      }
      unint64_t v17 = [(_UIPageIndicatorStore *)self direction];
      [(_UIPageIndicatorStore *)self _indicatorSizeForObject:v15];
      if (v17 >= 2) {
        double v20 = v19;
      }
      else {
        double v20 = v18;
      }
      double v21 = fmin(a3, (double)[v15 endIndex]);
      double v22 = v21 - (double)[v15 startIndex];
      [(_UIPageIndicatorStore *)self indicatorSpacing];
      double v13 = v13 + (v20 + v23) * v22;
      if (v12 && [v15 validPageWithinBound:a4])
      {
        if (([v15 validPageWithinBound:a4 + 1] & 1) != 0
          || a4 + 1 == [(_UIPageIndicatorStore *)self numberOfPages])
        {
          [(_UIPageIndicatorStore *)self indicatorSpacing];
          double v25 = v24;
        }
        else
        {
          unint64_t v26 = [(_UIPageIndicatorStore *)self direction];
          [(_UIPageIndicatorStore *)self indicatorSizeForPage:a4 + 1];
          if (v26 >= 2) {
            double v25 = v28;
          }
          else {
            double v25 = v27;
          }
          [(_UIPageIndicatorStore *)self indicatorSpacing];
          double v20 = v29;
        }
        double v13 = v13 + v25 + v20;
      }
      if (v9 == ++v14)
      {
        uint64_t v9 = [v7 countByEnumeratingWithState:&v31 objects:v35 count:16];
        if (v9) {
          goto LABEL_9;
        }
        break;
      }
    }
  }
  else
  {
    double v13 = 0.0;
  }

  return v13;
}

- (CGSize)contentSizeForNumberOfPages:(int64_t)a3 hasExpandedActiveIndicator:(BOOL)a4
{
  uint64_t v4 = 72;
  if (a4) {
    uint64_t v4 = 208;
  }
  BOOL v5 = (double *)((char *)self + v4);
  if (*((unsigned char *)&self->super.isa + v4))
  {
    double v6 = (double)a3;
    goto LABEL_7;
  }
  double v6 = (double)a3;
  if (v5[1] != (double)a3)
  {
LABEL_7:
    [(_UIPageIndicatorStore *)self _contentSizeForIndicatorsInRange:0 hasExpandedActiveIndicator:a3];
    *(unsigned char *)v5 &= ~1u;
    v5[1] = v6;
    v5[2] = v7;
    v5[3] = v8;
    goto LABEL_8;
  }
  double v7 = v5[2];
  double v8 = v5[3];
LABEL_8:
  result.height = v8;
  result.width = v7;
  return result;
}

- (CGSize)defaultIndicatorSize
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  v3 = [(_UIPageIndicatorStore *)self store];
  unint64_t v4 = [v3 count];
  unint64_t v5 = [(_UIPageIndicatorStore *)self numberOfPages];

  if (v4 >= v5)
  {
    double v7 = *MEMORY[0x1E4F1DB30];
    double v9 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    uint64_t v10 = [(_UIPageIndicatorStore *)self store];
    uint64_t v11 = [v10 countByEnumeratingWithState:&v24 objects:v28 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v25;
      while (2)
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v25 != v13) {
            objc_enumerationMutation(v10);
          }
          int64_t v15 = *(void **)(*((void *)&v24 + 1) + 8 * i);
          [(_UIPageIndicatorStore *)self _indicatorSizeForObject:v15];
          double v17 = v16;
          double v19 = v18;
          double v20 = [v15 customImage];

          if (!v20)
          {
            double v9 = v19;
            double v7 = v17;
            goto LABEL_18;
          }
          if ((unint64_t)[(_UIPageIndicatorStore *)self direction] <= 1) {
            BOOL v21 = v17 <= v7;
          }
          else {
            BOOL v21 = v19 <= v9;
          }
          if (!v21)
          {
            double v9 = v19;
            double v7 = v17;
          }
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v24 objects:v28 count:16];
        if (v12) {
          continue;
        }
        break;
      }
    }
LABEL_18:
  }
  else
  {
    [(_UIPageIndicatorStore *)self _indicatorSizeForObject:0];
    double v7 = v6;
    double v9 = v8;
  }
  double v22 = v7;
  double v23 = v9;
  result.height = v23;
  result.width = v22;
  return result;
}

- (CGSize)minimumContentSizeForIndicatorsInRange:(_NSRange)a3 hasExpandedActiveIndicator:(BOOL)a4
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  uint64_t v6 = 104;
  if (a4) {
    uint64_t v6 = 240;
  }
  double v7 = (double *)((char *)self + v6);
  if ((*((unsigned char *)&self->super.isa + v6) & 1) == 0
    && (*((void *)v7 + 1) == a3.location ? (BOOL v8 = *((void *)v7 + 2) == a3.length) : (BOOL v8 = 0), v8))
  {
    double v9 = v7[3];
    double v10 = v7[4];
  }
  else
  {
    [(_UIPageIndicatorStore *)self _contentSizeForIndicatorsInRange:a3.location hasExpandedActiveIndicator:a3.length];
    *(unsigned char *)v7 &= ~1u;
    *((void *)v7 + 1) = location;
    *((void *)v7 + 2) = length;
    v7[3] = v9;
    v7[4] = v10;
  }
  result.height = v10;
  result.width = v9;
  return result;
}

- (id)_defaultIndicatorImage
{
  defaultImage = self->_defaultImage;
  if (!defaultImage)
  {
    unint64_t v4 = +[UIImage systemImageNamed:@"circlebadge.fill"];
    unint64_t v5 = self->_defaultImage;
    self->_defaultImage = v4;

    defaultImage = self->_defaultImage;
  }
  return defaultImage;
}

- (CGSize)_contentSizeForIndicatorsInRange:(_NSRange)a3 hasExpandedActiveIndicator:(BOOL)a4
{
  BOOL v4 = a4;
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  double v8 = *MEMORY[0x1E4F1DB30];
  double v9 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  unint64_t v10 = [(_UIPageIndicatorStore *)self direction];
  [(_UIPageIndicatorStore *)self indicatorSpacing];
  double v12 = v11 * (double)(length - 1);
  if (v10 < 2) {
    double v8 = v12;
  }
  long long v48 = 0u;
  long long v49 = 0u;
  if (v10 >= 2) {
    double v9 = v12;
  }
  uint64_t v13 = location + length;
  long long v50 = 0uLL;
  long long v51 = 0uLL;
  uint64_t v14 = [(_UIPageIndicatorStore *)self store];
  uint64_t v15 = [v14 countByEnumeratingWithState:&v48 objects:v52 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v49;
    double v18 = 0.0;
LABEL_7:
    uint64_t v19 = 0;
    while (1)
    {
      if (*(void *)v49 != v17) {
        objc_enumerationMutation(v14);
      }
      double v20 = *(void **)(*((void *)&v48 + 1) + 8 * v19);
      if ([v20 startIndex] >= v13) {
        break;
      }
      if ([v20 endIndex] >= location)
      {
        [(_UIPageIndicatorStore *)self _indicatorSizeForObject:v20];
        double v22 = v21;
        double v24 = v23;
        unint64_t v25 = [v20 startIndex];
        if (location <= v25) {
          unint64_t v26 = v25;
        }
        else {
          unint64_t v26 = location;
        }
        uint64_t v27 = [v20 endIndex];
        if (v13 >= v27) {
          uint64_t v28 = v27;
        }
        else {
          uint64_t v28 = v13;
        }
        if ((unint64_t)[(_UIPageIndicatorStore *)self direction] >= 2) {
          double v29 = v24;
        }
        else {
          double v29 = v22;
        }
        unint64_t v30 = [(_UIPageIndicatorStore *)self direction];
        if (v30 >= 2) {
          double v31 = v9;
        }
        else {
          double v31 = v8;
        }
        if (v30 >= 2) {
          double v9 = v31 + v29 * (double)(uint64_t)(v28 - v26);
        }
        else {
          double v8 = v31 + v29 * (double)(uint64_t)(v28 - v26);
        }
        double v18 = fmax(v18, v29);
        if ((unint64_t)[(_UIPageIndicatorStore *)self direction] > 1) {
          double v8 = fmax(v8, v22);
        }
        else {
          double v9 = fmax(v9, v24);
        }
      }
      if (v16 == ++v19)
      {
        uint64_t v16 = [v14 countByEnumeratingWithState:&v48 objects:v52 count:16];
        if (v16) {
          goto LABEL_7;
        }
        break;
      }
    }
  }
  else
  {
    double v18 = 0.0;
  }

  uint64_t v32 = v13 - [(_UIPageIndicatorStore *)self numberOfPages];
  if (v32 >= 1)
  {
    unint64_t v33 = [(_UIPageIndicatorStore *)self direction];
    double v34 = (double)v32;
    unint64_t v35 = [(_UIPageIndicatorStore *)self direction];
    [(_UIPageIndicatorStore *)self defaultIndicatorSize];
    if (v35 >= 2) {
      double v36 = v37;
    }
    double v38 = v36 * v34;
    if (v33 >= 2) {
      double v39 = v9;
    }
    else {
      double v39 = v8;
    }
    double v40 = v39 + v38;
    if (v33 >= 2) {
      double v9 = v40;
    }
    else {
      double v8 = v40;
    }
  }
  if (v4)
  {
    unint64_t v41 = [(_UIPageIndicatorStore *)self direction];
    [(_UIPageIndicatorStore *)self indicatorSpacing];
    double v43 = v18 + v42;
    if (v41 >= 2) {
      double v44 = v9;
    }
    else {
      double v44 = v8;
    }
    double v45 = v44 + v43;
    if (v41 >= 2) {
      double v9 = v45;
    }
    else {
      double v8 = v45;
    }
  }
  double v46 = v8;
  double v47 = v9;
  result.height = v47;
  result.width = v46;
  return result;
}

- (void)updateStoreForNumberOfPages:(int64_t)a3
{
  int64_t v5 = [(_UIPageIndicatorStore *)self numberOfPages];
  if (v5 != a3)
  {
    int64_t v6 = v5;
    double v7 = [(_UIPageIndicatorStore *)self store];
    id v22 = [v7 lastObject];

    if (v6 >= a3)
    {
      if (v6 > a3)
      {
        unint64_t v11 = [(_UIPageIndicatorStore *)self objectIndexForPage:a3];
        double v12 = [(_UIPageIndicatorStore *)self store];
        uint64_t v13 = [v12 objectAtIndex:v11];

        [v13 setEndIndex:a3];
        uint64_t v14 = [(_UIPageIndicatorStore *)self store];
        unint64_t v15 = [v14 count] - 1;

        if (v11 < v15)
        {
          uint64_t v16 = [(_UIPageIndicatorStore *)self store];
          uint64_t v17 = [(_UIPageIndicatorStore *)self store];
          objc_msgSend(v16, "removeObjectsInRange:", v11 + 1, objc_msgSend(v17, "count") + ~v11);
        }
        uint64_t v18 = [v13 startIndex];
        if (v18 >= [v13 endIndex])
        {
          uint64_t v19 = [(_UIPageIndicatorStore *)self store];
          [v19 removeObject:v13];
        }
      }
    }
    else
    {
      double v8 = [v22 customImage];

      if (v8)
      {
        double v9 = [(_UIPageIndicatorStore *)self store];
        unint64_t v10 = [[_UIPageIndicatorStoreObject alloc] initWithStartIndex:v6 endIndex:a3];
        [v9 addObject:v10];
      }
      else
      {
        [v22 setEndIndex:a3];
      }
    }
    double v20 = [(_UIPageIndicatorStore *)self store];
    uint64_t v21 = [v20 count];

    if (!v21) {
      [(_UIPageIndicatorStore *)self _resetStore];
    }
    [(_UIPageIndicatorStore *)self invalidateLayoutCache];
  }
}

- (void)setIndicatorSpacing:(double)a3
{
  if (self->_indicatorSpacing != a3)
  {
    self->_indicatorSpacing = a3;
    [(_UIPageIndicatorStore *)self invalidateLayoutCache];
  }
}

- (CGSize)_sizeForMaximumContentSizeFittingLength:(double)a3 hasExpandedActiveIndicator:(BOOL)a4
{
  BOOL v4 = a4;
  double v7 = [(_UIPageIndicatorStore *)self delegate];
  uint64_t v8 = [v7 maxVisibleIndicators];

  int64_t v9 = [(_UIPageIndicatorStore *)self numberOfPages];
  [(_UIPageIndicatorStore *)self indicatorSpacing];
  double v11 = -v10;
  double v12 = *MEMORY[0x1E4F1DB30];
  double v13 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  unint64_t v14 = [(_UIPageIndicatorStore *)self direction];
  if (v14 >= 2) {
    double v15 = v12;
  }
  else {
    double v15 = v11;
  }
  if (v14 >= 2) {
    double v16 = v11;
  }
  else {
    double v16 = v13;
  }
  uint64_t v17 = [(_UIPageIndicatorStore *)self store];
  uint64_t v18 = [v17 count];

  if (v18)
  {
    uint64_t v19 = 0;
    uint64_t v20 = 0;
    uint64_t v21 = 0;
    while (1)
    {
      id v22 = [(_UIPageIndicatorStore *)self store];
      uint64_t v51 = v19;
      double v23 = [v22 objectAtIndex:v19];

      [(_UIPageIndicatorStore *)self _indicatorSizeForObject:v23];
      double v25 = v24;
      double v27 = v26;
      for (uint64_t i = [v23 startIndex]; i < objc_msgSend(v23, "endIndex") && v20 < v9; ++i)
      {
        [(_UIPageIndicatorStore *)self indicatorSpacing];
        double v30 = -v29;
        double v31 = 0.0;
        double v52 = v15;
        if (i >= v9 || v8 < 1)
        {
          uint64_t v20 = i;
          double v41 = v30;
          double v33 = 0.0;
          if (!v4) {
            goto LABEL_34;
          }
        }
        else
        {
          uint64_t v32 = 0;
          double v33 = 0.0;
          while (1)
          {
            if (objc_msgSend(v23, "validPageWithinBound:", i + v32, v31))
            {
              double v34 = v25;
              double v35 = v27;
            }
            else
            {
              if (([v21 validPageWithinBound:i + v32] & 1) == 0)
              {
                double v36 = [(_UIPageIndicatorStore *)self store];
                uint64_t v37 = objc_msgSend(v36, "objectAtIndex:", -[_UIPageIndicatorStore objectIndexForPage:](self, "objectIndexForPage:", i + v32));

                uint64_t v21 = (void *)v37;
              }
              [(_UIPageIndicatorStore *)self _indicatorSizeForObject:v21];
              double v34 = v38;
              double v35 = v39;
            }
            if ((unint64_t)[(_UIPageIndicatorStore *)self direction] >= 2) {
              double v34 = v35;
            }
            [(_UIPageIndicatorStore *)self indicatorSpacing];
            double v31 = v40 + v34;
            double v33 = fmax(v33, v31);
            double v41 = v30 + v31;
            if (v30 + v31 > a3) {
              break;
            }
            if (++v32 + i < v9)
            {
              double v30 = v30 + v31;
              if (v32 < v8) {
                continue;
              }
            }
            uint64_t v20 = i + v32;
            if (v4) {
              goto LABEL_30;
            }
            goto LABEL_34;
          }
          uint64_t v20 = i + v32;
          double v41 = v30;
          if (!v4) {
            goto LABEL_34;
          }
        }
LABEL_30:
        double v41 = v41 + v33;
        if (v41 > a3)
        {
          double v15 = v52;
          do
            double v41 = v41 - v31;
          while (v41 > a3);
          goto LABEL_35;
        }
LABEL_34:
        double v15 = v52;
LABEL_35:
        if ((unint64_t)[(_UIPageIndicatorStore *)self direction] >= 2) {
          double v42 = v16;
        }
        else {
          double v42 = v15;
        }
        if (v41 <= a3 && v42 < v41)
        {
          if ((unint64_t)[(_UIPageIndicatorStore *)self direction] >= 2) {
            double v16 = v41;
          }
          else {
            double v15 = v41;
          }
        }
        if (v20 < objc_msgSend(v23, "endIndex", v42)) {
          uint64_t i = i - v20 + [v23 endIndex];
        }
      }
      unint64_t v44 = [(_UIPageIndicatorStore *)self direction];
      double v45 = fmax(v16, v27);
      double v46 = fmax(v15, v25);
      if (v44 < 2) {
        double v16 = v45;
      }
      else {
        double v15 = v46;
      }

      uint64_t v19 = v51 + 1;
      double v47 = [(_UIPageIndicatorStore *)self store];
      unint64_t v48 = [v47 count];

      if (v51 + 1 >= v48)
      {

        break;
      }
    }
  }
  double v49 = v15;
  double v50 = v16;
  result.height = v50;
  result.width = v49;
  return result;
}

- (int64_t)direction
{
  return self->_direction;
}

- (double)indicatorSpacing
{
  return self->_indicatorSpacing;
}

- (_UIPageIndicatorStoreDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (_UIPageIndicatorStoreDelegate *)WeakRetained;
}

- (void)setDirection:(int64_t)a3
{
  if (self->_direction != a3)
  {
    self->_direction = a3;
    [(_UIPageIndicatorStore *)self invalidateLayoutCache];
  }
}

- (void)setDelegate:(id)a3
{
}

- (_UIPageIndicatorStore)init
{
  v6.receiver = self;
  v6.super_class = (Class)_UIPageIndicatorStore;
  v2 = [(_UIPageIndicatorStore *)&v6 init];
  if (v2)
  {
    v3 = [[_UIPageIndicatorStoreObject alloc] initWithStartIndex:0 endIndex:0];
    defaultObject = v2->_defaultObject;
    v2->_defaultObject = v3;

    [(_UIPageIndicatorStore *)v2 _resetStore];
    [(_UIPageIndicatorStore *)v2 invalidateLayoutCache];
  }
  return v2;
}

- (void)invalidateLayoutCache
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  *(unsigned char *)&self->_cache.fittingSize |= 1u;
  *(unsigned char *)&self->_cache.indicatorCount |= 1u;
  *(unsigned char *)&self->_cache.contentSize |= 1u;
  *(unsigned char *)&self->_cache.contentSizeInRange |= 1u;
  *(unsigned char *)&self->_expandedCache.fittingSize |= 1u;
  *(unsigned char *)&self->_expandedCache.indicatorCount |= 1u;
  *(unsigned char *)&self->_expandedCache.contentSize |= 1u;
  *(unsigned char *)&self->_expandedCache.contentSizeInRange |= 1u;
  [(_UIPageIndicatorStoreObject *)self->_defaultObject invalidateLayoutInfo];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  v3 = [(_UIPageIndicatorStore *)self store];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v8 + 1) + 8 * v7++) invalidateLayoutInfo];
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
}

- (void)_resetStore
{
  v3 = [(_UIPageIndicatorStore *)self store];

  if (v3)
  {
    uint64_t v4 = [(_UIPageIndicatorStore *)self store];
    [v4 removeAllObjects];
  }
  else
  {
    uint64_t v4 = objc_opt_new();
    [(_UIPageIndicatorStore *)self setStore:v4];
  }

  uint64_t v5 = [(_UIPageIndicatorStore *)self store];
  uint64_t v6 = [[_UIPageIndicatorStoreObject alloc] initWithStartIndex:0 endIndex:[(_UIPageIndicatorStore *)self numberOfPages]];
  [v5 addObject:v6];

  [(_UIPageIndicatorStore *)self invalidateLayoutCache];
}

- (void)setStore:(id)a3
{
}

- (CGSize)sizeForMaximumContentSizeFittingLength:(double)a3 hasExpandedActiveIndicator:(BOOL)a4
{
  uint64_t v5 = 8;
  if (a4) {
    uint64_t v5 = 144;
  }
  uint64_t v6 = (double *)((char *)self + v5);
  if ((*((unsigned char *)&self->super.isa + v5) & 1) != 0 || v6[1] != a3)
  {
    -[_UIPageIndicatorStore _sizeForMaximumContentSizeFittingLength:hasExpandedActiveIndicator:](self, "_sizeForMaximumContentSizeFittingLength:hasExpandedActiveIndicator:", a3);
    *(unsigned char *)v6 &= ~1u;
    v6[1] = a3;
    v6[2] = v7;
    v6[3] = v8;
  }
  else
  {
    double v7 = v6[2];
    double v8 = v6[3];
  }
  result.height = v8;
  result.width = v7;
  return result;
}

- (id)activeIndicatorImageForPage:(int64_t)a3
{
  uint64_t v5 = -[_UIPageIndicatorStore customActiveIndicatorImageForPage:](self, "customActiveIndicatorImageForPage:");
  if (!v5)
  {
    uint64_t v5 = [(_UIPageIndicatorStore *)self customIndicatorImageForPage:a3];
    if (!v5)
    {
      uint64_t v6 = [(_UIPageIndicatorStore *)self preferredActiveImage];
      double v7 = v6;
      if (v6)
      {
        id v8 = v6;
      }
      else
      {
        id v8 = [(_UIPageIndicatorStore *)self indicatorImage];
      }
      uint64_t v5 = v8;
    }
  }
  return v5;
}

- (UIImage)preferredActiveImage
{
  return self->_preferredActiveImage;
}

- (id)indicatorImageForPage:(int64_t)a3
{
  uint64_t v4 = [(_UIPageIndicatorStore *)self customIndicatorImageForPage:a3];
  uint64_t v5 = v4;
  if (v4)
  {
    id v6 = v4;
  }
  else
  {
    id v6 = [(_UIPageIndicatorStore *)self indicatorImage];
  }
  double v7 = v6;

  return v7;
}

- (id)customIndicatorImageForPage:(int64_t)a3
{
  int64_t v4 = [(_UIPageIndicatorStore *)self objectIndexForPage:a3];
  uint64_t v5 = [(_UIPageIndicatorStore *)self store];
  id v6 = [v5 objectAtIndex:v4];

  double v7 = [v6 customImage];

  return v7;
}

- (id)customActiveIndicatorImageForPage:(int64_t)a3
{
  int64_t v4 = [(_UIPageIndicatorStore *)self objectIndexForPage:a3];
  uint64_t v5 = [(_UIPageIndicatorStore *)self store];
  id v6 = [v5 objectAtIndex:v4];

  double v7 = [v6 activeImage];

  return v7;
}

- (void)updateImage:(id)a3 forPage:(int64_t)a4
{
}

- (void)_updateImage:(id)a3 forPage:(int64_t)a4 active:(BOOL)a5
{
  if (a3) {
    [(_UIPageIndicatorStore *)self _insertImage:a3 forPage:a4 active:a5];
  }
  else {
    [(_UIPageIndicatorStore *)self _removeImageForPage:a4 active:a5];
  }
  [(_UIPageIndicatorStore *)self validateDataStore];
  [(_UIPageIndicatorStore *)self invalidateLayoutCache];
}

- (void)_insertImage:(id)a3 forPage:(int64_t)a4 active:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  int64_t v9 = [(_UIPageIndicatorStore *)self objectIndexForPage:a4];
  long long v10 = [(_UIPageIndicatorStore *)self store];
  id v13 = [v10 objectAtIndex:v9];

  long long v11 = [(_UIPageIndicatorStore *)self store];
  double v12 = [v13 splitAtIndex:a4 withImage:v8 active:v5];

  objc_msgSend(v11, "replaceObjectsInRange:withObjectsFromArray:", v9, 1, v12);
}

- (CGSize)indicatorSizeForPage:(int64_t)a3
{
  int64_t v4 = [(_UIPageIndicatorStore *)self objectIndexForPage:a3];
  BOOL v5 = [(_UIPageIndicatorStore *)self store];
  id v6 = [v5 objectAtIndex:v4];

  [(_UIPageIndicatorStore *)self _indicatorSizeForObject:v6];
  double v8 = v7;
  double v10 = v9;

  double v11 = v8;
  double v12 = v10;
  result.height = v12;
  result.width = v11;
  return result;
}

- (void)updateActiveImage:(id)a3 forPage:(int64_t)a4
{
}

- (void)_removeImageForPage:(int64_t)a3 active:(BOOL)a4
{
  uint64_t v6 = [(_UIPageIndicatorStore *)self objectIndexForPage:a3];
  double v7 = [(_UIPageIndicatorStore *)self store];
  id v18 = [v7 objectAtIndex:v6];

  if (a4) {
    [v18 setActiveImage:0];
  }
  else {
    [v18 setCustomImage:0];
  }
  if (([v18 hasImage] & 1) == 0)
  {
    double v8 = [(_UIPageIndicatorStore *)self store];
    if (v6 >= (unint64_t)([v8 count] - 1))
    {

      double v10 = 0;
      double v11 = 0;
      if (v6 < 1) {
        goto LABEL_25;
      }
    }
    else
    {
      double v9 = [(_UIPageIndicatorStore *)self store];
      double v10 = [v9 objectAtIndex:v6 + 1];

      if (v6 <= 0)
      {
        if (!v10)
        {
          double v11 = 0;
          goto LABEL_25;
        }
        double v11 = 0;
        if ([v10 hasImage]) {
          goto LABEL_25;
        }
        goto LABEL_21;
      }
    }
    double v12 = [(_UIPageIndicatorStore *)self store];
    double v11 = [v12 objectAtIndex:v6 - 1];

    if (v10)
    {
      int v13 = [v10 hasImage];
      int v14 = v13;
      if (v11)
      {
        int v15 = [v11 hasImage];
        if (((v14 | v15) & 1) == 0)
        {
          objc_msgSend(v11, "setEndIndex:", objc_msgSend(v10, "endIndex"));
          double v16 = [(_UIPageIndicatorStore *)self store];
          [v16 removeObjectAtIndex:v6 + 1];

          goto LABEL_24;
        }
        if (v14)
        {
          if (v15) {
            goto LABEL_25;
          }
          goto LABEL_23;
        }
LABEL_21:
        objc_msgSend(v10, "setStartIndex:", objc_msgSend(v18, "startIndex"));
LABEL_24:
        uint64_t v17 = [(_UIPageIndicatorStore *)self store];
        [v17 removeObjectAtIndex:v6];

        goto LABEL_25;
      }
      if ((v13 & 1) == 0) {
        goto LABEL_21;
      }
    }
    else
    {
      if (v11 && ([v11 hasImage] & 1) == 0)
      {
LABEL_23:
        objc_msgSend(v11, "setEndIndex:", objc_msgSend(v18, "endIndex"));
        goto LABEL_24;
      }
      double v10 = 0;
    }
LABEL_25:
  }
}

- (void)setPreferredImage:(id)a3
{
}

- (void)setPreferredActiveImage:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_store, 0);
  objc_storeStrong((id *)&self->_preferredActiveImage, 0);
  objc_storeStrong((id *)&self->_preferredImage, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_defaultObject, 0);
  objc_storeStrong((id *)&self->_defaultImage, 0);
}

@end