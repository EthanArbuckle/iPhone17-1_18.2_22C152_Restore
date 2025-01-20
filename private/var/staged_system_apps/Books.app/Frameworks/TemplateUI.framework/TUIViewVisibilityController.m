@interface TUIViewVisibilityController
- (BOOL)isVisible;
- (CGRect)_computeClippingBoundsForObserver:(id)a3;
- (TUIViewVisibilityController)initWithView:(id)a3 scrollView:(id)a4;
- (double)_updateVisibilityWithTime:(double)a3;
- (id)observeNavigationBarView:(id)a3 options:(id)a4 block:(id)a5;
- (id)observeView:(id)a3 options:(id)a4 block:(id)a5;
- (void)_addObserver:(id)a3;
- (void)_removeObserver:(id)a3;
- (void)_scheduleUpdateAtTime:(double)a3;
- (void)_timeCheck;
- (void)_updateVisibilityForObserver:(id)a3 time:(double)a4;
- (void)setVisible:(BOOL)a3;
- (void)updatePopoverLayout;
- (void)updateView;
- (void)updatedVisibleBoundsOfScrollView:(id)a3;
@end

@implementation TUIViewVisibilityController

- (TUIViewVisibilityController)initWithView:(id)a3 scrollView:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v18.receiver = self;
  v18.super_class = (Class)TUIViewVisibilityController;
  v9 = [(TUIViewVisibilityController *)&v18 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_view, a3);
    objc_storeStrong((id *)&v10->_scrollView, a4);
    [v7 frame];
    v10->_frame.origin.x = v11;
    v10->_frame.origin.y = v12;
    v10->_frame.size.width = v13;
    v10->_frame.size.height = v14;
    uint64_t v15 = +[NSHashTable hashTableWithOptions:512];
    observers = v10->_observers;
    v10->_observers = (NSHashTable *)v15;
  }
  return v10;
}

- (void)updateView
{
  [(UIView *)self->_view frame];
  v11.origin.x = v3;
  v11.origin.y = v4;
  v11.size.width = v5;
  v11.size.height = v6;
  if (!CGRectEqualToRect(self->_frame, v11))
  {
    id v7 = +[NSDate now];
    [v7 timeIntervalSinceReferenceDate];
    double v9 = v8;

    [(TUIViewVisibilityController *)self _updateVisibilityWithTime:v9];
    -[TUIViewVisibilityController _scheduleUpdateAtTime:](self, "_scheduleUpdateAtTime:");
  }
}

- (void)updatePopoverLayout
{
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  v2 = self->_observers;
  id v3 = [(NSHashTable *)v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      CGFloat v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        [*(id *)(*((void *)&v7 + 1) + 8 * (void)v6) updatePopoverLayout:v7];
        CGFloat v6 = (char *)v6 + 1;
      }
      while (v4 != v6);
      id v4 = [(NSHashTable *)v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

- (id)observeView:(id)a3 options:(id)a4 block:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  CGRect v11 = [[_TUIViewVisibilityObserver alloc] initWithView:v8 options:v9 kind:0 block:v10];
  [(TUIViewVisibilityController *)self _addObserver:v11];
  CGFloat v12 = +[NSDate now];
  [v12 timeIntervalSinceReferenceDate];
  double v14 = v13;

  [(TUIViewVisibilityController *)self _updateVisibilityForObserver:v11 time:v14];
  if ([(_TUIViewVisibilityObserver *)v11 needsTimer])
  {
    uint64_t v15 = [(_TUIViewVisibilityObserver *)v11 options];
    [v15 duration];
    [(TUIViewVisibilityController *)self _scheduleUpdateAtTime:v14 + v16];
  }
  objc_initWeak(&location, self);
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_1798C;
  v20[3] = &unk_251A78;
  objc_copyWeak(&v22, &location);
  v17 = v11;
  v21 = v17;
  id v18 = +[TUICancellable newWithCancelBlock:v20];

  objc_destroyWeak(&v22);
  objc_destroyWeak(&location);

  return v18;
}

- (id)observeNavigationBarView:(id)a3 options:(id)a4 block:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  CGRect v11 = [[_TUIViewVisibilityObserver alloc] initWithView:v8 options:v9 kind:1 block:v10];
  [(TUIViewVisibilityController *)self _addObserver:v11];
  CGFloat v12 = +[NSDate now];
  [v12 timeIntervalSinceReferenceDate];
  double v14 = v13;

  [(TUIViewVisibilityController *)self _updateVisibilityForObserver:v11 time:v14];
  if ([(_TUIViewVisibilityObserver *)v11 needsTimer])
  {
    uint64_t v15 = [(_TUIViewVisibilityObserver *)v11 options];
    [v15 duration];
    [(TUIViewVisibilityController *)self _scheduleUpdateAtTime:v14 + v16];
  }
  objc_initWeak(&location, self);
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_17BA8;
  v20[3] = &unk_251A78;
  objc_copyWeak(&v22, &location);
  v17 = v11;
  v21 = v17;
  id v18 = +[TUICancellable newWithCancelBlock:v20];

  objc_destroyWeak(&v22);
  objc_destroyWeak(&location);

  return v18;
}

- (void)_addObserver:(id)a3
{
}

- (void)_removeObserver:(id)a3
{
}

- (void)updatedVisibleBoundsOfScrollView:(id)a3
{
  id v4 = a3;
  if ([v4 isDescendantOfView:self->_view])
  {
    uint64_t v5 = +[NSDate now];
    [v5 timeIntervalSinceReferenceDate];
    double v7 = v6;

    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v8 = self->_observers;
    id v9 = [(NSHashTable *)v8 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = *(void *)v21;
      double v12 = INFINITY;
      do
      {
        for (i = 0; i != v10; i = (char *)i + 1)
        {
          if (*(void *)v21 != v11) {
            objc_enumerationMutation(v8);
          }
          double v14 = *(void **)(*((void *)&v20 + 1) + 8 * i);
          if (objc_msgSend(v14, "kind", (void)v20) != (char *)&def_141F14 + 1)
          {
            uint64_t v15 = [v14 view];
            unsigned int v16 = [v15 isDescendantOfView:v4];

            if (!v16) {
              continue;
            }
          }
          [(TUIViewVisibilityController *)self _updateVisibilityForObserver:v14 time:v7];
          if ([v14 needsTimer])
          {
            v17 = [v14 options];
            [v17 duration];
            double v19 = v7 + v18;

            double v12 = fmin(v12, v19);
          }
        }
        id v10 = [(NSHashTable *)v8 countByEnumeratingWithState:&v20 objects:v24 count:16];
      }
      while (v10);
    }
    else
    {
      double v12 = INFINITY;
    }

    [(TUIViewVisibilityController *)self _scheduleUpdateAtTime:v12];
  }
}

- (double)_updateVisibilityWithTime:(double)a3
{
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v5 = self->_observers;
  id v6 = [(NSHashTable *)v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v17;
    double v9 = INFINITY;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v11 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        -[TUIViewVisibilityController _updateVisibilityForObserver:time:](self, "_updateVisibilityForObserver:time:", v11, a3, (void)v16);
        if ([v11 needsTimer])
        {
          double v12 = [v11 options];
          [v12 duration];
          double v14 = v13 + a3;

          double v9 = fmin(v9, v14);
        }
      }
      id v7 = [(NSHashTable *)v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v7);
  }
  else
  {
    double v9 = INFINITY;
  }

  return v9;
}

- (void)_updateVisibilityForObserver:(id)a3 time:(double)a4
{
  id v47 = a3;
  [(TUIViewVisibilityController *)self _computeClippingBoundsForObserver:v47];
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  CGFloat v12 = v11;
  double v13 = [v47 options];
  double v14 = [v47 view];
  [v14 bounds];
  CGFloat v16 = v15;
  CGFloat v18 = v17;
  double v20 = v19;
  double v22 = v21;

  if (!self->_visible) {
    goto LABEL_4;
  }
  v49.origin.x = v16;
  v49.origin.y = v18;
  v49.size.width = v20;
  v49.size.height = v22;
  v52.origin.x = v6;
  v52.origin.y = v8;
  v52.size.width = v10;
  v52.size.height = v12;
  if (!CGRectIntersectsRect(v49, v52)) {
    goto LABEL_4;
  }
  [(UIScrollView *)self->_scrollView bounds];
  double v43 = v23;
  double v45 = v24;
  [(UIScrollView *)self->_scrollView adjustedContentInset];
  double v29 = fmin(v20, v43 - (v25 + v26));
  double v42 = fmin(v22, v45 - (v27 + v28));
  double v44 = v29;
  v50.origin.x = v16;
  v50.origin.y = v18;
  v50.size.width = v20;
  v50.size.height = v22;
  v53.origin.x = v6;
  v53.origin.y = v8;
  v53.size.width = v10;
  v53.size.height = v12;
  CGRect v51 = CGRectIntersection(v50, v53);
  CGFloat v30 = v51.size.width * v51.size.height / (v44 * v42);
  [v13 fraction];
  if (v30 < v31)
  {
LABEL_4:
    uint64_t v32 = 0;
LABEL_5:
    v33 = v47;
    double v34 = a4;
    goto LABEL_6;
  }
  if (([v13 flags] & 1) == 0)
  {
    uint64_t v32 = 1;
    goto LABEL_5;
  }
  if ([v47 kind] == (char *)&def_141F14 + 1)
  {
    if ([(UIScrollView *)self->_scrollView isDragging]) {
      unsigned int v35 = 1;
    }
    else {
      unsigned int v35 = [(UIScrollView *)self->_scrollView isDecelerating];
    }
  }
  else
  {
    uint64_t v36 = [v47 view];
    if (v36)
    {
      v37 = (UIView *)v36;
      while (v37 != self->_view)
      {
        uint64_t v38 = objc_opt_class();
        v39 = TUIDynamicCast(v38, v37);
        v40 = v39;
        if (v39)
        {
          if ([v39 isDragging]) {
            unsigned int v35 = 1;
          }
          else {
            unsigned int v35 = [v40 isDecelerating];
          }
        }
        else
        {
          unsigned int v35 = 0;
        }
        v41 = [(UIView *)v37 superview];

        if ((v35 & 1) == 0)
        {
          v37 = v41;
          if (v41) {
            continue;
          }
        }
        goto LABEL_28;
      }
      unsigned int v35 = 0;
      v41 = v37;
LABEL_28:
    }
    else
    {
      unsigned int v35 = 0;
    }
  }
  v33 = v47;
  double v34 = a4;
  uint64_t v32 = v35 ^ 1;
LABEL_6:
  [v33 updateVisible:v32 time:v34 *(void *)&v42 *(void *)&v44];
}

- (void)_scheduleUpdateAtTime:(double)a3
{
  if (fabs(a3) != INFINITY && (!self->_queuedTimeCheck || self->_earliestTimeCheck > a3))
  {
    self->_queuedTimeCheck = 1;
    self->_earliestTimeCheck = a3;
    double v5 = +[NSDate now];
    [v5 timeIntervalSinceReferenceDate];
    double v7 = a3 - v6;

    double v8 = v7 * 1000000000.0;
    if (v7 <= 0.0) {
      double v8 = 0.0;
    }
    dispatch_time_t v9 = dispatch_time(0, (uint64_t)v8);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_182CC;
    block[3] = &unk_251990;
    block[4] = self;
    dispatch_after(v9, (dispatch_queue_t)&_dispatch_main_q, block);
  }
}

- (void)_timeCheck
{
  id v3 = +[NSDate now];
  [v3 timeIntervalSinceReferenceDate];
  double v5 = v4;

  [(TUIViewVisibilityController *)self _updateVisibilityWithTime:v5];

  -[TUIViewVisibilityController _scheduleUpdateAtTime:](self, "_scheduleUpdateAtTime:");
}

- (void)setVisible:(BOOL)a3
{
  if (self->_visible != a3)
  {
    self->_visible = a3;
    double v4 = +[NSDate now];
    [v4 timeIntervalSinceReferenceDate];
    double v6 = v5;

    [(TUIViewVisibilityController *)self _updateVisibilityWithTime:v6];
    -[TUIViewVisibilityController _scheduleUpdateAtTime:](self, "_scheduleUpdateAtTime:");
  }
}

- (CGRect)_computeClippingBoundsForObserver:(id)a3
{
  id v4 = a3;
  double v5 = self->_view;
  double v6 = [v4 view];
  if ([v4 kind] == (char *)&def_141F14 + 1)
  {
    uint64_t v7 = [(UIView *)self->_view window];

    double v5 = (UIView *)v7;
  }
  CGFloat x = CGRectInfinite.origin.x;
  CGFloat y = CGRectInfinite.origin.y;
  CGFloat width = CGRectInfinite.size.width;
  CGFloat height = CGRectInfinite.size.height;
  if (v5) {
    BOOL v12 = v6 == 0;
  }
  else {
    BOOL v12 = 1;
  }
  if (!v12 && v5 != v6)
  {
    uint64_t v14 = [(UIView *)v6 superview];
    if (v14)
    {
      double v15 = (UIView *)v14;
      do
      {
        if ([(UIView *)v15 clipsToBounds])
        {
          [(UIView *)v15 bounds];
          double v17 = v16;
          double v19 = v18;
          double v21 = v20;
          double v23 = v22;
          if (objc_opt_respondsToSelector())
          {
            [(UIView *)v15 adjustedContentInset];
            double v17 = v17 + v24;
            double v19 = v19 + v25;
            double v21 = v21 - (v24 + v26);
            double v23 = v23 - (v25 + v27);
          }
          v47.origin.CGFloat x = x;
          v47.origin.CGFloat y = y;
          v47.size.CGFloat width = width;
          v47.size.CGFloat height = height;
          BOOL IsInfinite = CGRectIsInfinite(v47);
          -[UIView convertRect:toView:](v15, "convertRect:toView:", v6, v17, v19, v21, v23);
          CGFloat v30 = v29;
          CGFloat v32 = v31;
          CGFloat v34 = v33;
          CGFloat v36 = v35;
          if (!IsInfinite)
          {
            v48.origin.CGFloat x = x;
            v48.origin.CGFloat y = y;
            v48.size.CGFloat width = width;
            v48.size.CGFloat height = height;
            CGRect v49 = CGRectIntersection(v48, *(CGRect *)&v30);
            CGFloat v30 = v49.origin.x;
            CGFloat v32 = v49.origin.y;
            CGFloat v34 = v49.size.width;
            CGFloat v36 = v49.size.height;
          }
          CGFloat x = v30;
          CGFloat y = v32;
          CGFloat width = v34;
          CGFloat height = v36;
          v50.origin.CGFloat x = v30;
          v50.origin.CGFloat y = v32;
          v50.size.CGFloat width = v34;
          v50.size.CGFloat height = v36;
          if (CGRectIsEmpty(v50)) {
            break;
          }
        }
        if (v15 == v5)
        {
          double v15 = v5;
          break;
        }
        uint64_t v37 = [(UIView *)v15 superview];

        double v15 = (UIView *)v37;
      }
      while (v37);
    }
  }
  uint64_t v38 = [(UIView *)self->_view window];
  if (v38)
  {
    v51.origin.CGFloat x = x;
    v51.origin.CGFloat y = y;
    v51.size.CGFloat width = width;
    v51.size.CGFloat height = height;
    if (!CGRectIsEmpty(v51))
    {
      [v38 bounds];
      [v38 convertRect:v6];
      v55.origin.CGFloat x = v39;
      v55.origin.CGFloat y = v40;
      v55.size.CGFloat width = v41;
      v55.size.CGFloat height = v42;
      v52.origin.CGFloat x = x;
      v52.origin.CGFloat y = y;
      v52.size.CGFloat width = width;
      v52.size.CGFloat height = height;
      CGRect v53 = CGRectIntersection(v52, v55);
      CGFloat x = v53.origin.x;
      CGFloat y = v53.origin.y;
      CGFloat width = v53.size.width;
      CGFloat height = v53.size.height;
    }
  }

  double v43 = x;
  double v44 = y;
  double v45 = width;
  double v46 = height;
  result.size.CGFloat height = v46;
  result.size.CGFloat width = v45;
  result.origin.CGFloat y = v44;
  result.origin.CGFloat x = v43;
  return result;
}

- (BOOL)isVisible
{
  return self->_visible;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_scrollView, 0);

  objc_storeStrong((id *)&self->_view, 0);
}

@end