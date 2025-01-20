@interface _UIStatusBarCycleAnimation
- (BOOL)stopsAfterReversing;
- (BOOL)visible;
- (NSArray)layerAnimations;
- (NSArray)stoppingLayerAnimations;
- (NSMutableArray)completionHandlers;
- (NSString)description;
- (_UIStatusBarCycleAnimation)initWithLayerAnimations:(id)a3;
- (_UIStatusBarCycleLayerAnimation)mainLayerAnimation;
- (int64_t)state;
- (void)_sendCompletionsWithFinished:(BOOL)a3;
- (void)_startAnimations;
- (void)_stopAnimations;
- (void)_stopStoppingAnimations;
- (void)animationDidStop:(id)a3 finished:(BOOL)a4;
- (void)dealloc;
- (void)pausePersistentAnimation;
- (void)resumePersistentAnimation;
- (void)setCompletionHandlers:(id)a3;
- (void)setStoppingLayerAnimations:(id)a3;
- (void)setStopsAfterReversing:(BOOL)a3;
- (void)setVisible:(BOOL)a3;
- (void)start;
- (void)stopWithCompletionHandler:(id)a3;
@end

@implementation _UIStatusBarCycleAnimation

- (_UIStatusBarCycleAnimation)initWithLayerAnimations:(id)a3
{
  v5 = (NSArray *)a3;
  v13.receiver = self;
  v13.super_class = (Class)_UIStatusBarCycleAnimation;
  v6 = [(_UIStatusBarCycleAnimation *)&v13 init];
  if (![(NSArray *)v5 count])
  {
    v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2 object:v6 file:@"_UIStatusBarCycleAnimation.m" lineNumber:67 description:@"There must be at least one animation"];
  }
  layerAnimations = v6->_layerAnimations;
  v6->_layerAnimations = v5;
  v8 = v5;

  uint64_t v9 = [MEMORY[0x1E4F1CA48] array];
  completionHandlers = v6->_completionHandlers;
  v6->_completionHandlers = (NSMutableArray *)v9;

  v6->_visible = 1;
  return v6;
}

- (void)dealloc
{
  [(_UIStatusBarCycleAnimation *)self _stopAnimations];
  v3.receiver = self;
  v3.super_class = (Class)_UIStatusBarCycleAnimation;
  [(_UIStatusBarCycleAnimation *)&v3 dealloc];
}

- (_UIStatusBarCycleLayerAnimation)mainLayerAnimation
{
  return (_UIStatusBarCycleLayerAnimation *)[(NSArray *)self->_layerAnimations firstObject];
}

- (void)start
{
  if (self->_visible)
  {
    int64_t state = self->_state;
    if (state == 2)
    {
      [(_UIStatusBarCycleAnimation *)self _stopStoppingAnimations];
      v4 = [(_UIStatusBarCycleAnimation *)self mainLayerAnimation];
      v5 = [v4 animation];
      v6 = [v4 layer];
      v7 = [v4 key];
      [v6 removeAnimationForKey:v7];
      [v6 addAnimation:v5 forKey:v7];
      [(_UIStatusBarCycleAnimation *)self _sendCompletionsWithFinished:0];
    }
    else if (!state)
    {
      [(_UIStatusBarCycleAnimation *)self _startAnimations];
    }
  }
  self->_int64_t state = 1;
}

- (void)stopWithCompletionHandler:(id)a3
{
  uint64_t v74 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = v4;
  if (!self->_visible)
  {
    self->_int64_t state = 0;
LABEL_7:
    (*((void (**)(id, uint64_t))v4 + 2))(v4, 1);
    goto LABEL_31;
  }
  int64_t state = self->_state;
  if (state == 2)
  {
    completionHandlers = self->_completionHandlers;
    v8 = _Block_copy(v4);
    [(NSMutableArray *)completionHandlers addObject:v8];

    goto LABEL_31;
  }
  if (state != 1)
  {
    if (state) {
      goto LABEL_31;
    }
    goto LABEL_7;
  }
  v41 = [(_UIStatusBarCycleAnimation *)self mainLayerAnimation];
  uint64_t v9 = [v41 animation];
  v40 = [v41 layer];
  v39 = [v41 key];
  v10 = (void *)[v9 copy];
  [v9 beginTime];
  double v12 = v11;
  double v13 = CACurrentMediaTime();
  [v9 duration];
  double v15 = v14;
  uint64_t v68 = 0;
  v69 = (double *)&v68;
  uint64_t v70 = 0x2020000000;
  double v71 = (v13 - v12) / v14;
  uint64_t v64 = 0;
  v65 = (double *)&v64;
  uint64_t v66 = 0x2020000000;
  uint64_t v67 = 0;
  uint64_t v60 = 0;
  v61 = (double *)&v60;
  uint64_t v62 = 0x2020000000;
  uint64_t v63 = 0;
  v50[0] = MEMORY[0x1E4F143A8];
  v50[1] = 3221225472;
  v51 = __56___UIStatusBarCycleAnimation_stopWithCompletionHandler___block_invoke;
  v52 = &unk_1E5307670;
  v55 = &v64;
  v56 = &v68;
  double v58 = v14;
  id v38 = v9;
  id v53 = v38;
  v54 = self;
  v57 = &v60;
  double v59 = v12;
  long long v46 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  v16 = self->_stoppingLayerAnimations;
  uint64_t v17 = [(NSArray *)v16 countByEnumeratingWithState:&v46 objects:v73 count:16];
  if (v17)
  {
    uint64_t v18 = *(void *)v47;
    double v19 = 0.0;
    do
    {
      for (uint64_t i = 0; i != v17; ++i)
      {
        if (*(void *)v47 != v18) {
          objc_enumerationMutation(v16);
        }
        v21 = objc_msgSend(*(id *)(*((void *)&v46 + 1) + 8 * i), "originalAnimation", v38);
        [v21 duration];
        double v23 = v22;

        if (v19 < v23) {
          double v19 = v23;
        }
      }
      uint64_t v17 = [(NSArray *)v16 countByEnumeratingWithState:&v46 objects:v73 count:16];
    }
    while (v17);
  }
  else
  {
    double v19 = 0.0;
  }

  v51((uint64_t)v50);
  if (v19 > 0.0)
  {
    double v24 = v19 - (v61[3] - v13);
    if (v24 > 0.0)
    {
      v69[3] = ceil(v24 / v15) + v69[3];
      v51((uint64_t)v50);
    }
  }
  long long v44 = 0u;
  long long v45 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  v25 = self->_stoppingLayerAnimations;
  uint64_t v26 = [(NSArray *)v25 countByEnumeratingWithState:&v42 objects:v72 count:16];
  if (v26)
  {
    uint64_t v27 = *(void *)v43;
    do
    {
      for (uint64_t j = 0; j != v26; ++j)
      {
        if (*(void *)v43 != v27) {
          objc_enumerationMutation(v25);
        }
        v29 = *(void **)(*((void *)&v42 + 1) + 8 * j);
        v30 = objc_msgSend(v29, "originalAnimation", v38);
        double v31 = v61[3];
        [v30 duration];
        [v30 setBeginTime:v31 - v32];
        v33 = [v29 layer];
        v34 = [v29 key];
        [v33 addAnimation:v30 forKey:v34];
      }
      uint64_t v26 = [(NSArray *)v25 countByEnumeratingWithState:&v42 objects:v72 count:16];
    }
    while (v26);
  }

  double v35 = v65[3];
  *(float *)&double v35 = v35;
  [v10 setRepeatCount:v35];
  [v10 setDelegate:self];
  [v40 removeAnimationForKey:v39];
  [v40 addAnimation:v10 forKey:v39];
  v36 = self->_completionHandlers;
  v37 = _Block_copy(v5);
  [(NSMutableArray *)v36 addObject:v37];

  self->_int64_t state = 2;
  _Block_object_dispose(&v60, 8);
  _Block_object_dispose(&v64, 8);
  _Block_object_dispose(&v68, 8);

LABEL_31:
}

- (void)pausePersistentAnimation
{
  self->_visible = 0;
  [(_UIStatusBarCycleAnimation *)self _stopAnimations];
}

- (void)resumePersistentAnimation
{
  self->_visible = 1;
  if (self->_state == 1) {
    [(_UIStatusBarCycleAnimation *)self _startAnimations];
  }
}

- (void)animationDidStop:(id)a3 finished:(BOOL)a4
{
  [(_UIStatusBarCycleAnimation *)self _stopAnimations];
  if (self->_state == 2)
  {
    self->_int64_t state = 0;
    [(_UIStatusBarCycleAnimation *)self _sendCompletionsWithFinished:1];
  }
}

- (void)_startAnimations
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  v2 = self->_layerAnimations;
  uint64_t v3 = [(NSArray *)v2 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v13 != v5) {
          objc_enumerationMutation(v2);
        }
        v7 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        v8 = objc_msgSend(v7, "animation", (void)v12);
        [v8 setBeginTime:CACurrentMediaTime()];
        LODWORD(v9) = 2139095040;
        [v8 setRepeatCount:v9];
        v10 = [v7 layer];
        double v11 = [v7 key];
        [v10 addAnimation:v8 forKey:v11];
      }
      uint64_t v4 = [(NSArray *)v2 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v4);
  }
}

- (void)_stopAnimations
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v3 = self->_layerAnimations;
  uint64_t v4 = [(NSArray *)v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v3);
        }
        v8 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        double v9 = objc_msgSend(v8, "layer", (void)v11);
        v10 = [v8 key];
        [v9 removeAnimationForKey:v10];
      }
      uint64_t v5 = [(NSArray *)v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v5);
  }

  [(_UIStatusBarCycleAnimation *)self _stopStoppingAnimations];
}

- (void)_stopStoppingAnimations
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v3 = self->_stoppingLayerAnimations;
  uint64_t v4 = [(NSArray *)v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
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
        v8 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        double v9 = objc_msgSend(v8, "layer", (void)v12);
        v10 = [v8 key];
        [v9 removeAnimationForKey:v10];
      }
      uint64_t v5 = [(NSArray *)v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v5);
  }

  stoppingLayerAnimations = self->_stoppingLayerAnimations;
  self->_stoppingLayerAnimations = (NSArray *)MEMORY[0x1E4F1CBF0];
}

- (void)_sendCompletionsWithFinished:(BOOL)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v4 = self->_completionHandlers;
  uint64_t v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
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
        (*(void (**)(void))(*(void *)(*((void *)&v9 + 1) + 8 * v8) + 16))(*(void *)(*((void *)&v9 + 1) + 8 * v8));
        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }

  [(NSMutableArray *)self->_completionHandlers removeAllObjects];
}

- (NSString)description
{
  v8[2] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = NSStringFromSelector(sel_state);
  v8[0] = v3;
  uint64_t v4 = NSStringFromSelector(sel_layerAnimations);
  v8[1] = v4;
  uint64_t v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:2];
  uint64_t v6 = +[UIDescriptionBuilder descriptionForObject:self keys:v5];

  return (NSString *)v6;
}

- (NSArray)layerAnimations
{
  return self->_layerAnimations;
}

- (int64_t)state
{
  return self->_state;
}

- (BOOL)stopsAfterReversing
{
  return self->_stopsAfterReversing;
}

- (void)setStopsAfterReversing:(BOOL)a3
{
  self->_stopsAfterReversing = a3;
}

- (NSArray)stoppingLayerAnimations
{
  return self->_stoppingLayerAnimations;
}

- (void)setStoppingLayerAnimations:(id)a3
{
}

- (BOOL)visible
{
  return self->_visible;
}

- (void)setVisible:(BOOL)a3
{
  self->_visible = a3;
}

- (NSMutableArray)completionHandlers
{
  return self->_completionHandlers;
}

- (void)setCompletionHandlers:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_completionHandlers, 0);
  objc_storeStrong((id *)&self->_stoppingLayerAnimations, 0);
  objc_storeStrong((id *)&self->_layerAnimations, 0);
}

@end