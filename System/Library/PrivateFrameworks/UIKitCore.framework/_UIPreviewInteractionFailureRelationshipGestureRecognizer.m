@interface _UIPreviewInteractionFailureRelationshipGestureRecognizer
- (UIPreviewInteraction)previewInteraction;
- (_UIPreviewInteractionFailureRelationshipGestureRecognizer)initWithPreviewInteraction:(id)a3;
- (void)_gestureRecognizerFailed:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setPreviewInteraction:(id)a3;
- (void)setStateToFailed;
- (void)setStateToRecognized;
@end

@implementation _UIPreviewInteractionFailureRelationshipGestureRecognizer

- (_UIPreviewInteractionFailureRelationshipGestureRecognizer)initWithPreviewInteraction:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_UIPreviewInteractionFailureRelationshipGestureRecognizer;
  v5 = [(UIGestureRecognizer *)&v9 initWithTarget:0 action:0];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_previewInteraction, v4);
    [(_UIPreviewInteractionFailureRelationshipGestureRecognizer *)v6 setDelegate:v6];
    v7 = v6;
  }

  return v6;
}

- (void)setStateToFailed
{
}

- (void)setStateToRecognized
{
}

- (void)setDelegate:(id)a3
{
  v5 = (_UIPreviewInteractionFailureRelationshipGestureRecognizer *)a3;
  if (v5 != self)
  {
    v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2, self, @"_UIPreviewInteractionFailureRelationshipGestureRecognizer.m", 49, @"Invalid parameter not satisfying: %@", @"delegate == self" object file lineNumber description];
  }
  v7.receiver = self;
  v7.super_class = (Class)_UIPreviewInteractionFailureRelationshipGestureRecognizer;
  [(UIGestureRecognizer *)&v7 setDelegate:v5];
}

- (void)_gestureRecognizerFailed:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_previewInteraction);
  [WeakRetained cancelInteraction];
}

- (UIPreviewInteraction)previewInteraction
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_previewInteraction);
  return (UIPreviewInteraction *)WeakRetained;
}

- (void)setPreviewInteraction:(id)a3
{
}

- (void).cxx_destruct
{
}

@end