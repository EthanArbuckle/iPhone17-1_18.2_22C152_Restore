@interface TSKHideOnTouchOutsideViewGestureRecognizer
+ (BOOL)isInFlight;
- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4;
- (TSKHideOnTouchOutsideViewGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4 watchView:(id)a5;
- (UIView)watchView;
- (void)addTarget:(id)a3 action:(SEL)a4;
- (void)dealloc;
- (void)removeTarget:(id)a3 action:(SEL)a4;
- (void)setWatchView:(id)a3;
- (void)touchesBegan:(id)a3 withEvent:(id)a4;
- (void)touchesEnded:(id)a3 withEvent:(id)a4;
@end

@implementation TSKHideOnTouchOutsideViewGestureRecognizer

+ (BOOL)isInFlight
{
  return sGestureInFlight;
}

- (TSKHideOnTouchOutsideViewGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4 watchView:(id)a5
{
  v11.receiver = self;
  v11.super_class = (Class)TSKHideOnTouchOutsideViewGestureRecognizer;
  v8 = [(TSKHideOnTouchOutsideViewGestureRecognizer *)&v11 initWithTarget:0 action:0];
  v9 = v8;
  if (v8)
  {
    v8->mWatchView = (UIView *)a5;
    v8->mTargets = (NSMutableSet *)objc_alloc_init(MEMORY[0x263EFF9C0]);
    [(TSKHideOnTouchOutsideViewGestureRecognizer *)v9 setDelegate:v9];
    [(TSKHideOnTouchOutsideViewGestureRecognizer *)v9 addTarget:a3 action:a4];
  }
  return v9;
}

- (void)dealloc
{
  sGestureInFlight = 0;

  self->mTargets = 0;
  self->mWatchView = 0;
  v3.receiver = self;
  v3.super_class = (Class)TSKHideOnTouchOutsideViewGestureRecognizer;
  [(TSKHideOnTouchOutsideViewGestureRecognizer *)&v3 dealloc];
}

- (void)addTarget:(id)a3 action:(SEL)a4
{
  v7 = objc_alloc_init(TSKHideOnTouchOutsideViewGestureRecognizerTarget);
  [(TSKHideOnTouchOutsideViewGestureRecognizerTarget *)v7 setTarget:a3];
  [(TSKHideOnTouchOutsideViewGestureRecognizerTarget *)v7 setAction:a4];
  [(NSMutableSet *)self->mTargets addObject:v7];
}

- (void)removeTarget:(id)a3 action:(SEL)a4
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  v7 = (void *)[MEMORY[0x263EFF9C0] set];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  mTargets = self->mTargets;
  uint64_t v9 = [(NSMutableSet *)mTargets countByEnumeratingWithState:&v22 objects:v27 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v23 != v11) {
          objc_enumerationMutation(mTargets);
        }
        v13 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        if ((!a3 || (id)[*(id *)(*((void *)&v22 + 1) + 8 * i) target] == a3)
          && (!a4 || (SEL)[v13 action] == a4))
        {
          [v7 addObject:v13];
        }
      }
      uint64_t v10 = [(NSMutableSet *)mTargets countByEnumeratingWithState:&v22 objects:v27 count:16];
    }
    while (v10);
  }
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v14 = [v7 countByEnumeratingWithState:&v18 objects:v26 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v19;
    do
    {
      for (uint64_t j = 0; j != v15; ++j)
      {
        if (*(void *)v19 != v16) {
          objc_enumerationMutation(v7);
        }
        [(NSMutableSet *)self->mTargets removeObject:*(void *)(*((void *)&v18 + 1) + 8 * j)];
      }
      uint64_t v15 = [v7 countByEnumeratingWithState:&v18 objects:v26 count:16];
    }
    while (v15);
  }
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  uint64_t v50 = *MEMORY[0x263EF8340];
  sGestureInFlight = 1;
  if (![(TSKHideOnTouchOutsideViewGestureRecognizer *)self watchView]) {
    goto LABEL_12;
  }
  [(UIView *)[(TSKHideOnTouchOutsideViewGestureRecognizer *)self watchView] bounds];
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  CGFloat v12 = v11;
  CGFloat v14 = v13;
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  uint64_t v15 = [a3 countByEnumeratingWithState:&v43 objects:v49 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    char v17 = 0;
    uint64_t v18 = *(void *)v44;
    do
    {
      for (uint64_t i = 0; i != v16; ++i)
      {
        if (*(void *)v44 != v18) {
          objc_enumerationMutation(a3);
        }
        objc_msgSend(*(id *)(*((void *)&v43 + 1) + 8 * i), "locationInView:", -[TSKHideOnTouchOutsideViewGestureRecognizer watchView](self, "watchView"));
        v51.x = v20;
        v51.y = v21;
        v52.origin.x = v8;
        v52.origin.y = v10;
        v52.size.width = v12;
        v52.size.height = v14;
        if (CGRectContainsPoint(v52, v51)) {
          char v17 = 1;
        }
      }
      uint64_t v16 = [a3 countByEnumeratingWithState:&v43 objects:v49 count:16];
    }
    while (v16);
    int v22 = v17 & 1;
  }
  else
  {
LABEL_12:
    int v22 = 0;
  }
  long long v41 = 0u;
  long long v42 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v23 = (void *)[a4 allTouches];
  uint64_t v24 = [v23 countByEnumeratingWithState:&v39 objects:v48 count:16];
  if (v24)
  {
    uint64_t v25 = v24;
    int v26 = 0;
    uint64_t v27 = *(void *)v40;
    do
    {
      for (uint64_t j = 0; j != v25; ++j)
      {
        if (*(void *)v40 != v27) {
          objc_enumerationMutation(v23);
        }
        v26 |= [a3 containsObject:*(void *)(*((void *)&v39 + 1) + 8 * j)] ^ 1;
      }
      uint64_t v25 = [v23 countByEnumeratingWithState:&v39 objects:v48 count:16];
    }
    while (v25);
  }
  else
  {
    int v26 = 0;
  }
  if (((v22 | v26) & 1) == 0)
  {
    long long v37 = 0u;
    long long v38 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    mTargets = self->mTargets;
    uint64_t v30 = [(NSMutableSet *)mTargets countByEnumeratingWithState:&v35 objects:v47 count:16];
    if (v30)
    {
      uint64_t v31 = v30;
      uint64_t v32 = *(void *)v36;
      do
      {
        for (uint64_t k = 0; k != v31; ++k)
        {
          if (*(void *)v36 != v32) {
            objc_enumerationMutation(mTargets);
          }
          objc_msgSend((id)objc_msgSend(*(id *)(*((void *)&v35 + 1) + 8 * k), "target"), "performSelector:withObject:", objc_msgSend(*(id *)(*((void *)&v35 + 1) + 8 * k), "action"), self);
        }
        uint64_t v31 = [(NSMutableSet *)mTargets countByEnumeratingWithState:&v35 objects:v47 count:16];
      }
      while (v31);
    }
  }
  if (v22 & 1 | ((v26 & 1) == 0)) {
    uint64_t v34 = 5;
  }
  else {
    uint64_t v34 = 1;
  }
  [(TSKHideOnTouchOutsideViewGestureRecognizer *)self setState:v34];
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  sGestureInFlight = 0;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  return 0;
}

- (UIView)watchView
{
  return self->mWatchView;
}

- (void)setWatchView:(id)a3
{
  self->mWatchView = (UIView *)a3;
}

@end