@interface _UIGravityWellAdaptorEffect
+ (id)effectWithAdaptedClickEffect:(id)a3;
- (_UIClickHighlightEffect)adaptedEffect;
- (_UIGravityWellAdaptorInteraction)adaptorInteraction;
- (double)maxProgress;
- (id)previewForContinuingToEffectWithPreview:(id)a3;
- (id)secondaryBodyPreviews;
- (void)addCompletion:(id)a3;
- (void)begin;
- (void)end;
- (void)endForHandOff;
- (void)setAdaptedEffect:(id)a3;
- (void)setAdaptorInteraction:(id)a3;
- (void)setMaxProgress:(double)a3;
- (void)updateWithProgress:(double)a3;
@end

@implementation _UIGravityWellAdaptorEffect

+ (id)effectWithAdaptedClickEffect:(id)a3
{
  id v3 = a3;
  v4 = objc_opt_new();
  [v4 setAdaptedEffect:v3];

  v5 = objc_opt_new();
  [v4 setAdaptorInteraction:v5];

  [v4 setMaxProgress:1.0];
  return v4;
}

- (id)secondaryBodyPreviews
{
  return 0;
}

- (void)begin
{
  id v5 = (id)objc_opt_new();
  id v3 = [(_UIGravityWellAdaptorEffect *)self adaptedEffect];
  v4 = [(_UIGravityWellAdaptorEffect *)self adaptorInteraction];
  [v3 interaction:v4 didChangeWithContext:v5];
}

- (void)updateWithProgress:(double)a3
{
  id v7 = (id)objc_opt_new();
  [v7 setProgress:a3];
  [(_UIGravityWellAdaptorEffect *)self maxProgress];
  objc_msgSend(v7, "setMaximumProgress:");
  id v5 = [(_UIGravityWellAdaptorEffect *)self adaptedEffect];
  v6 = [(_UIGravityWellAdaptorEffect *)self adaptorInteraction];
  [v5 interaction:v6 didChangeWithContext:v7];
}

- (void)end
{
  id v5 = (id)objc_opt_new();
  [v5 setProgress:0.0];
  [v5 setEnded:1];
  id v3 = [(_UIGravityWellAdaptorEffect *)self adaptedEffect];
  v4 = [(_UIGravityWellAdaptorEffect *)self adaptorInteraction];
  [v3 interaction:v4 didChangeWithContext:v5];
}

- (void)endForHandOff
{
  id v3 = objc_opt_new();
  [v3 setProgress:0.0];
  [v3 setEnded:1];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __44___UIGravityWellAdaptorEffect_endForHandOff__block_invoke;
  v5[3] = &unk_1E52D9F98;
  v5[4] = self;
  id v6 = v3;
  id v4 = v3;
  +[UIView performWithoutAnimation:v5];
}

- (id)previewForContinuingToEffectWithPreview:(id)a3
{
  id v3 = [(_UIGravityWellAdaptorEffect *)self adaptedEffect];
  id v4 = [v3 targetedPreviewForEffectContinuation];

  return v4;
}

- (void)addCompletion:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)_UIGravityWellAdaptorEffect;
  [(_UIGravityWellEffect *)&v11 addCompletion:v4];
  id v5 = [(_UIGravityWellAdaptorEffect *)self adaptedEffect];
  id v6 = [v5 completionBlock];

  if (!v6)
  {
    objc_initWeak(&location, self);
    uint64_t v8 = MEMORY[0x1E4F143A8];
    objc_copyWeak(&v9, &location);
    id v7 = [(_UIGravityWellAdaptorEffect *)self adaptedEffect];
    [v7 setCompletionBlock:&v8];

    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }
}

- (double)maxProgress
{
  return self->_maxProgress;
}

- (void)setMaxProgress:(double)a3
{
  self->_maxProgress = a3;
}

- (_UIClickHighlightEffect)adaptedEffect
{
  return self->_adaptedEffect;
}

- (void)setAdaptedEffect:(id)a3
{
}

- (_UIGravityWellAdaptorInteraction)adaptorInteraction
{
  return self->_adaptorInteraction;
}

- (void)setAdaptorInteraction:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_adaptorInteraction, 0);
  objc_storeStrong((id *)&self->_adaptedEffect, 0);
}

@end