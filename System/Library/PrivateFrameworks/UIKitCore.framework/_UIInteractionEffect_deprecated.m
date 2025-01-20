@interface _UIInteractionEffect_deprecated
- (CGAffineTransform)preferredContentTransform;
- (CGRect)bounds;
- (_UIInteractionEffect_deprecated)init;
- (double)forceFactor;
- (double)progress;
- (id)updateBlock;
- (void)_prepareAnimatorIfNeeded;
- (void)_stopAnimations;
- (void)_updateAnimatorIfNeeded;
- (void)_updateFromTransformer:(id)a3;
- (void)setForceFactor:(double)a3;
- (void)setUpdateBlock:(id)a3;
@end

@implementation _UIInteractionEffect_deprecated

- (_UIInteractionEffect_deprecated)init
{
  v8.receiver = self;
  v8.super_class = (Class)_UIInteractionEffect_deprecated;
  v2 = [(_UIInteractionEffect_deprecated *)&v8 init];
  v3 = v2;
  if (v2)
  {
    *(_OWORD *)&v2->_damping = xmmword_186B9B580;
    *(_OWORD *)&v2->_density = xmmword_186B9B590;
    v2->_forceFactor = 0.0;
    uint64_t v4 = MEMORY[0x1E4F1DAB8];
    long long v5 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
    *(_OWORD *)&v2->_preferredContentTransform.a = *MEMORY[0x1E4F1DAB8];
    *(_OWORD *)&v2->_preferredContentTransform.c = v5;
    *(_OWORD *)&v2->_preferredContentTransform.tx = *(_OWORD *)(v4 + 32);
    [(_UIInteractionEffect_deprecated *)v2 _prepareAnimatorIfNeeded];
    v6 = v3;
  }

  return v3;
}

- (void)setForceFactor:(double)a3
{
  if (self->_forceFactor != a3)
  {
    self->_forceFactor = a3;
    [(_UIInteractionEffect_deprecated *)self _updateAnimatorIfNeeded];
  }
}

- (CGAffineTransform)preferredContentTransform
{
  long long v3 = *(_OWORD *)&self[2].a;
  *(_OWORD *)&retstr->a = *(_OWORD *)&self[1].tx;
  *(_OWORD *)&retstr->c = v3;
  *(_OWORD *)&retstr->tx = *(_OWORD *)&self[2].c;
  return self;
}

- (double)progress
{
  return self->_progress;
}

- (CGRect)bounds
{
  double v2 = 320.0;
  double v3 = 480.0;
  double v4 = 0.0;
  double v5 = 0.0;
  result.size.height = v3;
  result.size.width = v2;
  result.origin.y = v5;
  result.origin.x = v4;
  return result;
}

- (void)_prepareAnimatorIfNeeded
{
  v33[1] = *MEMORY[0x1E4F143B8];
  double v3 = [[UIDynamicAnimator alloc] initWithReferenceSystem:self];
  [(_UIInteractionEffect_deprecated *)self bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  objc_initWeak(&location, self);
  v12 = [_UIDynamicTransformer alloc];
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __59___UIInteractionEffect_deprecated__prepareAnimatorIfNeeded__block_invoke;
  v29[3] = &unk_1E5300698;
  objc_copyWeak(&v30, &location);
  v13 = [(_UIDynamicTransformer *)v12 initWithActionBlock:v29];
  double v14 = v5 + v9 * 0.5;
  double v15 = v7 + v11 * 0.5;
  -[_UIDynamicTransformer setCenter:](v13, "setCenter:", v14, v15);
  objc_destroyWeak(&v30);
  objc_destroyWeak(&location);
  transformer = self->_transformer;
  self->_transformer = v13;

  v17 = v13;
  v18 = -[_UISpringBehavior initWithItem:anchorPoint:]([_UISpringBehavior alloc], "initWithItem:anchorPoint:", v17, v14, v15);
  [(_UISpringBehavior *)v18 setDamping:self->_damping];
  [(_UISpringBehavior *)v18 setFrequency:self->_frequency];
  [(UIDynamicAnimator *)v3 addBehavior:v18];
  springBehavior = self->_springBehavior;
  self->_springBehavior = v18;

  v20 = [UIPushBehavior alloc];
  v33[0] = v17;
  v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:v33 count:1];
  v22 = [(UIPushBehavior *)v20 initWithItems:v21 mode:0];

  [(UIPushBehavior *)v22 setMagnitude:0.0];
  -[UIPushBehavior setPushDirection:](v22, "setPushDirection:", 0.0, 1.0);
  [(UIDynamicAnimator *)v3 addBehavior:v22];
  forceBehavior = self->_forceBehavior;
  self->_forceBehavior = v22;

  v24 = [UIDynamicItemBehavior alloc];
  v32 = v17;
  v25 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v32 count:1];
  v26 = [(UIDynamicItemBehavior *)v24 initWithItems:v25];

  [(UIDynamicItemBehavior *)v26 setDensity:self->_density];
  [(UIDynamicItemBehavior *)v26 setResistance:self->_resistance];
  [(UIDynamicAnimator *)v3 addBehavior:v26];
  itemProperties = self->_itemProperties;
  self->_itemProperties = v26;

  animator = self->_animator;
  self->_animator = v3;

  [(_UIInteractionEffect_deprecated *)self _updateAnimatorIfNeeded];
}

- (void)_updateAnimatorIfNeeded
{
  [(UIPushBehavior *)self->_forceBehavior setMagnitude:fmin(self->_forceFactor * 100.0, 120.0)];
  [(_UIInteractionEffect_deprecated *)self bounds];
  double v5 = v4 + v3 * 0.5;
  double v8 = v7 + v6 * 0.5;
  springBehavior = self->_springBehavior;
  -[_UISpringBehavior setAnchorPoint:](springBehavior, "setAnchorPoint:", v5, v8);
}

- (void)_updateFromTransformer:(id)a3
{
  [a3 center];
  double v5 = v4;
  [(_UIInteractionEffect_deprecated *)self bounds];
  double v8 = v5 - (v7 + v6 * 0.5);
  CGFloat v9 = floor((1.0 - v8 + v8 * 1.03) * 1000.0) / 1000.0;
  CGAffineTransformMakeScale(&v12, v9, v9);
  long long v10 = *(_OWORD *)&v12.c;
  *(_OWORD *)&self->_preferredContentTransform.a = *(_OWORD *)&v12.a;
  *(_OWORD *)&self->_preferredContentTransform.c = v10;
  *(_OWORD *)&self->_preferredContentTransform.tx = *(_OWORD *)&v12.tx;
  self->_progress = v8;
  updateBlock = (void (**)(id, _UIInteractionEffect_deprecated *))self->_updateBlock;
  if (updateBlock) {
    updateBlock[2](updateBlock, self);
  }
}

- (void)_stopAnimations
{
  [(UIDynamicAnimator *)self->_animator removeBehavior:self->_springBehavior];
  [(UIDynamicAnimator *)self->_animator removeBehavior:self->_forceBehavior];
  animator = self->_animator;
  itemProperties = self->_itemProperties;
  [(UIDynamicAnimator *)animator removeBehavior:itemProperties];
}

- (double)forceFactor
{
  return self->_forceFactor;
}

- (id)updateBlock
{
  return self->_updateBlock;
}

- (void)setUpdateBlock:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_updateBlock, 0);
  objc_storeStrong((id *)&self->_itemProperties, 0);
  objc_storeStrong((id *)&self->_forceBehavior, 0);
  objc_storeStrong((id *)&self->_springBehavior, 0);
  objc_storeStrong((id *)&self->_transformer, 0);
  objc_storeStrong((id *)&self->_animator, 0);
}

@end