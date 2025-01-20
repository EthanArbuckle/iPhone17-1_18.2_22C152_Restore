@interface _UIPageIndicatorFeed
- (BOOL)_isPageWithinActiveBounds:(int64_t)a3;
- (CGSize)indicatorSizeForCustomImage:(id)a3;
- (CGSize)indicatorSizeForPage:(int64_t)a3;
- (NSArray)indicators;
- (NSMutableArray)activeQueue;
- (NSMutableArray)reuseQueue;
- (_UIPageIndicatorFeed)initWithPageControl:(id)a3;
- (_UIPageIndicatorFeedDelegate)delegate;
- (id)activeIndicatorForPage:(int64_t)a3;
- (id)indicatorForPage:(int64_t)a3;
- (id)indicatorForPage:(int64_t)a3 forSizeOnly:(BOOL)a4;
- (void)invalidateIndicators;
- (void)prepareIndicatorsFrom:(int64_t)a3 to:(int64_t)a4;
- (void)reloadIndicatorImageForPage:(int64_t)a3;
- (void)reloadIndicatorImages;
- (void)setActiveQueue:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setReuseQueue:(id)a3;
- (void)updateReuseQueue;
@end

@implementation _UIPageIndicatorFeed

- (id)indicatorForPage:(int64_t)a3
{
  return [(_UIPageIndicatorFeed *)self indicatorForPage:a3 forSizeOnly:0];
}

- (void)prepareIndicatorsFrom:(int64_t)a3 to:(int64_t)a4
{
  v7 = [(_UIPageIndicatorFeed *)self activeQueue];
  v8 = [v7 firstObject];
  uint64_t v9 = [v8 page];

  v10 = [(_UIPageIndicatorFeed *)self activeQueue];
  v11 = [v10 lastObject];
  int64_t v12 = [v11 page];

  if (v9 <= a4)
  {
    if (a3 <= v12) {
      goto LABEL_9;
    }
  }
  else
  {
    v10 = [(_UIPageIndicatorFeed *)self activeQueue];
    if (v9 - a4 >= (unint64_t)[v10 count])
    {

      goto LABEL_16;
    }
    if (a3 <= v12)
    {

LABEL_9:
      v16 = [(_UIPageIndicatorFeed *)self activeQueue];
      v17 = [v16 firstObject];
      int64_t v18 = [v17 page];

      while (v18 > a3)
        id v19 = [(_UIPageIndicatorFeed *)self indicatorForPage:--v18];
      v20 = [(_UIPageIndicatorFeed *)self activeQueue];
      v21 = [v20 lastObject];
      int64_t v22 = [v21 page];

      if (v22 < a4)
      {
        do
          id v23 = [(_UIPageIndicatorFeed *)self indicatorForPage:v22++];
        while (a4 != v22);
      }
      return;
    }
  }
  unint64_t v13 = a3 - v12;
  v14 = [(_UIPageIndicatorFeed *)self activeQueue];
  unint64_t v15 = [v14 count];

  if (v9 > a4) {
  if (v13 < v15)
  }
    goto LABEL_9;
LABEL_16:
  [(_UIPageIndicatorFeed *)self invalidateIndicators];
  if (a3 < a4)
  {
    do
      id v24 = [(_UIPageIndicatorFeed *)self indicatorForPage:a3++];
    while (a4 != a3);
  }
}

- (void)setDelegate:(id)a3
{
}

- (_UIPageIndicatorFeed)initWithPageControl:(id)a3
{
  v4 = (UIPageControl *)a3;
  v10.receiver = self;
  v10.super_class = (Class)_UIPageIndicatorFeed;
  v5 = [(_UIPageIndicatorFeed *)&v10 init];
  v6 = v5;
  if (v5)
  {
    v5->_pageControl = v4;
    v7 = objc_opt_new();
    [(_UIPageIndicatorFeed *)v6 setActiveQueue:v7];

    v8 = objc_opt_new();
    [(_UIPageIndicatorFeed *)v6 setReuseQueue:v8];
  }
  return v6;
}

- (void)setReuseQueue:(id)a3
{
}

- (void)setActiveQueue:(id)a3
{
}

- (id)activeIndicatorForPage:(int64_t)a3
{
  if (-[_UIPageIndicatorFeed _isPageWithinActiveBounds:](self, "_isPageWithinActiveBounds:"))
  {
    v5 = [(_UIPageIndicatorFeed *)self indicatorForPage:a3];
  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (BOOL)_isPageWithinActiveBounds:(int64_t)a3
{
  BOOL v5 = (a3 & 0x8000000000000000) == 0 && [(UIPageControl *)self->_pageControl numberOfPages] > a3;
  v6 = [(_UIPageIndicatorFeed *)self activeQueue];
  v7 = [v6 firstObject];
  if ([v7 page] <= a3)
  {
    uint64_t v9 = [(_UIPageIndicatorFeed *)self activeQueue];
    objc_super v10 = [v9 lastObject];
    BOOL v8 = [v10 page] >= a3;
  }
  else
  {
    BOOL v8 = 0;
  }

  return v5 && v8;
}

- (NSArray)indicators
{
  v2 = [(_UIPageIndicatorFeed *)self activeQueue];
  v3 = (void *)[v2 copy];

  return (NSArray *)v3;
}

- (void)updateReuseQueue
{
  v3 = [(_UIPageIndicatorFeed *)self activeQueue];
  uint64_t v4 = [v3 count];

  if (v4 - 1 >= 0)
  {
    do
    {
      --v4;
      BOOL v5 = [(_UIPageIndicatorFeed *)self activeQueue];
      v6 = [v5 objectAtIndexedSubscript:v4];

      if ([v6 isInvalidated])
      {
        [v6 removeFromSuperview];
        v7 = [(_UIPageIndicatorFeed *)self reuseQueue];
        [v7 addObject:v6];

        BOOL v8 = [(_UIPageIndicatorFeed *)self activeQueue];
        [v8 removeObjectAtIndex:v4];
      }
    }
    while (v4 > 0);
  }
}

- (id)indicatorForPage:(int64_t)a3 forSizeOnly:(BOOL)a4
{
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  v7 = [(_UIPageIndicatorFeed *)self activeQueue];
  BOOL v8 = [v7 firstObject];
  unint64_t v9 = a3 - [v8 page];

  if ((v9 & 0x8000000000000000) != 0
    || ([(_UIPageIndicatorFeed *)self activeQueue],
        objc_super v10 = objc_claimAutoreleasedReturnValue(),
        unint64_t v11 = [v10 count],
        v10,
        v9 >= v11))
  {
    v20 = [(_UIPageIndicatorFeed *)self reuseQueue];
    v21 = [v20 lastObject];

    if (v21)
    {
      int64_t v22 = [(_UIPageIndicatorFeed *)self reuseQueue];
      unint64_t v13 = [v22 lastObject];

      id v23 = [(_UIPageIndicatorFeed *)self reuseQueue];
      [v23 removeLastObject];
    }
    else
    {
      unint64_t v13 = objc_opt_new();
    }
    id v24 = [(_UIPageIndicatorFeed *)self delegate];
    [v24 configureIndicatorImagesForIndicator:v13 atPage:a3];

    if (a4)
    {
      [v13 sizeToFit];
      [v13 invalidate];
      v25 = [(_UIPageIndicatorFeed *)self reuseQueue];
    }
    else
    {
      [v13 setPage:a3];
      v26 = [(_UIPageIndicatorFeed *)self delegate];
      [v26 configureIndicator:v13 atPage:a3];

      v27 = [(_UIPageIndicatorFeed *)self activeQueue];
      v28 = [v27 firstObject];
      uint64_t v29 = [v28 page] - 1;

      v30 = [(_UIPageIndicatorFeed *)self activeQueue];
      v16 = v30;
      if (v29 == a3)
      {
        [v30 insertObject:v13 atIndex:0];
LABEL_14:

        goto LABEL_25;
      }
      v31 = [v30 lastObject];
      if ([v31 page] + 1 == a3)
      {
      }
      else
      {
        v32 = [(_UIPageIndicatorFeed *)self activeQueue];
        uint64_t v33 = [v32 count];

        if (v33)
        {
          if (os_variant_has_internal_diagnostics())
          {
            v16 = __UIFaultDebugAssertLog();
            if (!os_log_type_enabled(v16, OS_LOG_TYPE_FAULT)) {
              goto LABEL_14;
            }
            v46 = (objc_class *)objc_opt_class();
            int64_t v18 = NSStringFromClass(v46);
            pageControl = self->_pageControl;
            v37 = [(_UIPageIndicatorFeed *)self activeQueue];
            v38 = [v37 firstObject];
            uint64_t v48 = [v38 page];
            v40 = [(_UIPageIndicatorFeed *)self activeQueue];
            v41 = [v40 lastObject];
            int v49 = 138413314;
            v50 = v18;
            __int16 v51 = 2048;
            v52 = pageControl;
            __int16 v53 = 2048;
            int64_t v54 = a3;
            __int16 v55 = 2048;
            uint64_t v56 = v48;
            __int16 v57 = 2048;
            uint64_t v58 = [v41 page];
            _os_log_fault_impl(&dword_1853B0000, v16, OS_LOG_TYPE_FAULT, "<%@ %p>: Attempting to fetch indicator outside of queue bound. Asked for %ld, bound is in %ld..<%ld. This is a UIKit bug.", (uint8_t *)&v49, 0x34u);
          }
          else
          {
            v34 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &qword_1EB262E78) + 8);
            if (!os_log_type_enabled(v34, OS_LOG_TYPE_ERROR)) {
              goto LABEL_25;
            }
            v16 = v34;
            v35 = (objc_class *)objc_opt_class();
            int64_t v18 = NSStringFromClass(v35);
            v36 = self->_pageControl;
            v37 = [(_UIPageIndicatorFeed *)self activeQueue];
            v38 = [v37 firstObject];
            uint64_t v39 = [v38 page];
            v40 = [(_UIPageIndicatorFeed *)self activeQueue];
            v41 = [v40 lastObject];
            int v49 = 138413314;
            v50 = v18;
            __int16 v51 = 2048;
            v52 = v36;
            __int16 v53 = 2048;
            int64_t v54 = a3;
            __int16 v55 = 2048;
            uint64_t v56 = v39;
            __int16 v57 = 2048;
            uint64_t v58 = [v41 page];
            _os_log_impl(&dword_1853B0000, v16, OS_LOG_TYPE_ERROR, "<%@ %p>: Attempting to fetch indicator outside of queue bound. Asked for %ld, bound is in %ld..<%ld. This is a UIKit bug.", (uint8_t *)&v49, 0x34u);
          }

          goto LABEL_22;
        }
      }
      v25 = [(_UIPageIndicatorFeed *)self activeQueue];
    }
    v42 = v25;
    [v25 addObject:v13];
  }
  else
  {
    int64_t v12 = [(_UIPageIndicatorFeed *)self activeQueue];
    unint64_t v13 = [v12 objectAtIndexedSubscript:v9];

    LODWORD(v12) = os_variant_has_internal_diagnostics();
    uint64_t v14 = [v13 page];
    if (v12)
    {
      if (v14 != a3)
      {
        v16 = __UIFaultDebugAssertLog();
        if (!os_log_type_enabled(v16, OS_LOG_TYPE_FAULT)) {
          goto LABEL_14;
        }
        v44 = (objc_class *)objc_opt_class();
        int64_t v18 = NSStringFromClass(v44);
        v45 = self->_pageControl;
        int v49 = 138413058;
        v50 = v18;
        __int16 v51 = 2048;
        v52 = v45;
        __int16 v53 = 2048;
        int64_t v54 = a3;
        __int16 v55 = 2048;
        uint64_t v56 = [v13 page];
        _os_log_fault_impl(&dword_1853B0000, v16, OS_LOG_TYPE_FAULT, "<%@ %p>: There is an inconsistency in the page control's reuse queue, expected (%ld) found (%ld). This is a UIKit bug.", (uint8_t *)&v49, 0x2Au);
        goto LABEL_22;
      }
    }
    else if (v14 != a3)
    {
      unint64_t v15 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &_MergedGlobals_1218) + 8);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        v16 = v15;
        v17 = (objc_class *)objc_opt_class();
        int64_t v18 = NSStringFromClass(v17);
        id v19 = self->_pageControl;
        int v49 = 138413058;
        v50 = v18;
        __int16 v51 = 2048;
        v52 = v19;
        __int16 v53 = 2048;
        int64_t v54 = a3;
        __int16 v55 = 2048;
        uint64_t v56 = [v13 page];
        _os_log_impl(&dword_1853B0000, v16, OS_LOG_TYPE_ERROR, "<%@ %p>: There is an inconsistency in the page control's reuse queue, expected (%ld) found (%ld). This is a UIKit bug.", (uint8_t *)&v49, 0x2Au);
LABEL_22:

        goto LABEL_14;
      }
    }
  }
LABEL_25:
  return v13;
}

- (NSMutableArray)activeQueue
{
  return self->_activeQueue;
}

- (_UIPageIndicatorFeedDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (_UIPageIndicatorFeedDelegate *)WeakRetained;
}

- (CGSize)indicatorSizeForCustomImage:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(_UIPageIndicatorFeed *)self reuseQueue];
  v6 = [v5 lastObject];

  if (v6)
  {
    v7 = [(_UIPageIndicatorFeed *)self reuseQueue];
    BOOL v8 = [v7 lastObject];
  }
  else
  {
    BOOL v8 = objc_opt_new();
    v7 = [(_UIPageIndicatorFeed *)self reuseQueue];
    [v7 addObject:v8];
  }

  [v8 invalidate];
  unint64_t v9 = [(_UIPageIndicatorFeed *)self activeQueue];
  objc_super v10 = [v9 firstObject];
  unint64_t v11 = [v10 traitCollection];

  [v8 sizeForImage:v4 traits:v11];
  double v13 = v12;
  double v15 = v14;

  double v16 = v13;
  double v17 = v15;
  result.height = v17;
  result.width = v16;
  return result;
}

- (NSMutableArray)reuseQueue
{
  return self->_reuseQueue;
}

- (void)reloadIndicatorImageForPage:(int64_t)a3
{
  if (-[_UIPageIndicatorFeed _isPageWithinActiveBounds:](self, "_isPageWithinActiveBounds:"))
  {
    id v6 = [(_UIPageIndicatorFeed *)self indicatorForPage:a3];
    BOOL v5 = [(_UIPageIndicatorFeed *)self delegate];
    objc_msgSend(v5, "configureIndicatorImagesForIndicator:atPage:", v6, objc_msgSend(v6, "page"));

    [v6 sizeToFit];
  }
}

- (void)invalidateIndicators
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  v3 = [(_UIPageIndicatorFeed *)self activeQueue];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(v3);
        }
        BOOL v8 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        [v8 invalidate];
        [v8 removeFromSuperview];
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v5);
  }

  unint64_t v9 = [(_UIPageIndicatorFeed *)self reuseQueue];
  objc_super v10 = [(_UIPageIndicatorFeed *)self activeQueue];
  [v9 addObjectsFromArray:v10];

  unint64_t v11 = [(_UIPageIndicatorFeed *)self activeQueue];
  [v11 removeAllObjects];
}

- (void)reloadIndicatorImages
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v3 = [(_UIPageIndicatorFeed *)self activeQueue];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v11;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v3);
        }
        BOOL v8 = *(void **)(*((void *)&v10 + 1) + 8 * v7);
        unint64_t v9 = [(_UIPageIndicatorFeed *)self delegate];
        objc_msgSend(v9, "configureIndicatorImagesForIndicator:atPage:", v8, objc_msgSend(v8, "page"));

        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v5);
  }
}

- (CGSize)indicatorSizeForPage:(int64_t)a3
{
  v3 = [(_UIPageIndicatorFeed *)self indicatorForPage:a3 forSizeOnly:1];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;

  double v8 = v5;
  double v9 = v7;
  result.height = v9;
  result.width = v8;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reuseQueue, 0);
  objc_storeStrong((id *)&self->_activeQueue, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end