@interface _UIContentViewAnimationStateUpdatingLayer
+ (BOOL)needsDisplayForKey:(id)a3;
+ (id)layerForView:(id)a3 withUpdateHandler:(id)a4 completionHandler:(id)a5;
- (_UIContentViewAnimationStateUpdatingLayer)initWithLayer:(id)a3;
- (double)progress;
- (void)_updateWithAnimationProgress:(double)a3 completed:;
- (void)animationCompletedWithPosition:(int64_t)a3;
- (void)drawInContext:(CGContext *)a3;
- (void)setProgress:(double)a3;
@end

@implementation _UIContentViewAnimationStateUpdatingLayer

+ (id)layerForView:(id)a3 withUpdateHandler:(id)a4 completionHandler:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v12 = v11;
  if (v10)
  {
    if (v11) {
      goto LABEL_3;
    }
  }
  else
  {
    v23 = [MEMORY[0x1E4F28B00] currentHandler];
    [v23 handleFailureInMethod:a2, a1, @"_UIContentViewShared.m", 232, @"Invalid parameter not satisfying: %@", @"updateHandler != NULL" object file lineNumber description];

    if (v12) {
      goto LABEL_3;
    }
  }
  v24 = [MEMORY[0x1E4F28B00] currentHandler];
  [v24 handleFailureInMethod:a2, a1, @"_UIContentViewShared.m", 233, @"Invalid parameter not satisfying: %@", @"completionHandler != NULL" object file lineNumber description];

LABEL_3:
  v32.receiver = a1;
  v32.super_class = (Class)&OBJC_METACLASS____UIContentViewAnimationStateUpdatingLayer;
  v13 = objc_msgSendSuper2(&v32, sel_layer);
  if (v13)
  {
    v31[0] = 0;
    v31[1] = v31;
    v31[2] = 0x2020000000;
    v31[3] = 1;
    v30[0] = 0;
    v30[1] = v30;
    v30[2] = 0x2020000000;
    v30[3] = 1;
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __94___UIContentViewAnimationStateUpdatingLayer_layerForView_withUpdateHandler_completionHandler___block_invoke;
    aBlock[3] = &unk_1E530EC08;
    v28 = v30;
    v29 = v31;
    id v26 = v10;
    id v27 = v12;
    v14 = _Block_copy(aBlock);
    v15 = (void *)v13[4];
    v13[4] = v14;

    objc_msgSend(v13, "setFrame:", -1.0, -1.0, 1.0, 1.0);
    v16 = [v9 layer];
    [v16 addSublayer:v13];

    v17 = [MEMORY[0x1E4F39B48] animationWithKeyPath:@"progress"];
    [v17 setFromValue:&unk_1ED3F28A8];
    [v17 setToValue:&unk_1ED3F28B8];
    [v17 setRemovedOnCompletion:0];
    v18 = +[UIView _currentViewAnimationState];
    [v18 setAnimationAttributes:v17 skipDelegateAssignment:0 customCurve:0];
    if (+[UIView _shouldTrackAnimationsWithAnimator])
    {
      v19 = +[UIViewPropertyAnimator _trackNonAdditiveAnimationWithAnimator:v17 forLayer:v13 forKey:@"progress"];
      v20 = [v17 toValue];
      [v19 _setOriginalToValue:v20 forKey:@"progress" inLayer:v13];
    }
    else if (+[UIView _isAnimationTracking])
    {
      [v18 _trackAnimation:v17 withAnimationKey:@"progress" forKeyPath:@"progress" inLayer:v13];
    }
    v21 = [v17 keyPath];
    [v13 addAnimation:v17 forKey:v21];

    v13[5] = 0x3FF0000000000000;
    _Block_object_dispose(v30, 8);
    _Block_object_dispose(v31, 8);
  }

  return v13;
}

- (_UIContentViewAnimationStateUpdatingLayer)initWithLayer:(id)a3
{
  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2, self, @"_UIContentViewShared.m", 282, @"Unexpected layer class: %@", v5 object file lineNumber description];
  }
  v14.receiver = self;
  v14.super_class = (Class)_UIContentViewAnimationStateUpdatingLayer;
  v6 = [(_UIContentViewAnimationStateUpdatingLayer *)&v14 initWithLayer:v5];
  v7 = v6;
  if (v6)
  {
    v6->_progress = (double)v5[5];
    v8 = (void *)v5[4];
    id v9 = v5;
    uint64_t v10 = [v8 copy];
    id progressHandler = v7->_progressHandler;
    v7->_id progressHandler = (id)v10;
  }
  return v7;
}

+ (BOOL)needsDisplayForKey:(id)a3
{
  id v4 = a3;
  if ([v4 isEqualToString:@"progress"])
  {
    unsigned __int8 v5 = 1;
  }
  else
  {
    v7.receiver = a1;
    v7.super_class = (Class)&OBJC_METACLASS____UIContentViewAnimationStateUpdatingLayer;
    unsigned __int8 v5 = objc_msgSendSuper2(&v7, sel_needsDisplayForKey_, v4);
  }

  return v5;
}

- (void)drawInContext:(CGContext *)a3
{
}

- (void)_updateWithAnimationProgress:(double)a3 completed:
{
  if (a1)
  {
    unsigned __int8 v5 = _Block_copy(*(const void **)(a1 + 32));
    if (v5)
    {
      id v6 = v5;
      (*((void (**)(void *, uint64_t, double))v5 + 2))(v5, a2, a3);
      unsigned __int8 v5 = v6;
    }
  }
}

- (void)animationCompletedWithPosition:(int64_t)a3
{
  double v4 = 0.0;
  if (!a3) {
    double v4 = 1.0;
  }
  self->_progress = v4;
  -[_UIContentViewAnimationStateUpdatingLayer _updateWithAnimationProgress:completed:]((uint64_t)self, 1, v4);
  id progressHandler = self->_progressHandler;
  self->_id progressHandler = 0;

  [(_UIContentViewAnimationStateUpdatingLayer *)self removeFromSuperlayer];
}

- (double)progress
{
  return self->_progress;
}

- (void)setProgress:(double)a3
{
  self->_progress = a3;
}

- (void).cxx_destruct
{
}

@end