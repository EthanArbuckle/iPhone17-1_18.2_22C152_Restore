@interface _UIWTCProofreadingInteraction
- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4;
- (BOOL)gestureRecognizerShouldBegin:(id)a3;
- (UIView)view;
- (_UIWTCProofreadingInteraction)initWithDelegate:(id)a3;
- (_UIWTCProofreadingInteractionDelegate)delegate;
- (id)proofreadingTapCreateIfNecessary;
- (void)didMoveToView:(id)a3;
- (void)setDelegate:(id)a3;
- (void)tapInteraction:(id)a3;
- (void)willMoveToView:(id)a3;
@end

@implementation _UIWTCProofreadingInteraction

- (_UIWTCProofreadingInteraction)initWithDelegate:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)_UIWTCProofreadingInteraction;
  v5 = [(_UIWTCProofreadingInteraction *)&v8 init];
  v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_delegate, v4);
  }

  return v6;
}

- (void)willMoveToView:(id)a3
{
  id obj = a3;
  if (self->_proofreadingTap)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_view);
    [WeakRetained removeGestureRecognizer:self->_proofreadingTap];
  }
  objc_storeWeak((id *)&self->_view, obj);
}

- (void)didMoveToView:(id)a3
{
  id v4 = a3;
  id v5 = [(_UIWTCProofreadingInteraction *)self proofreadingTapCreateIfNecessary];
  [v4 addGestureRecognizer:v5];
}

- (id)proofreadingTapCreateIfNecessary
{
  proofreadingTap = self->_proofreadingTap;
  if (!proofreadingTap)
  {
    id v4 = [[UITapGestureRecognizer alloc] initWithTarget:self action:sel_tapInteraction_];
    id v5 = self->_proofreadingTap;
    self->_proofreadingTap = v4;

    [(UITapGestureRecognizer *)self->_proofreadingTap setNumberOfTapsRequired:1];
    [(UITapGestureRecognizer *)self->_proofreadingTap setNumberOfTouchesRequired:1];
    [(UIGestureRecognizer *)self->_proofreadingTap setDelegate:self];
    proofreadingTap = self->_proofreadingTap;
  }
  [(UIGestureRecognizer *)proofreadingTap setEnabled:1];
  v6 = self->_proofreadingTap;
  return v6;
}

- (void)tapInteraction:(id)a3
{
  id v6 = a3;
  if ([v6 state] == 3)
  {
    id v4 = [(_UIWTCProofreadingInteraction *)self delegate];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_view);
    [v6 locationInView:WeakRetained];
    objc_msgSend(v4, "proofreadingInteraction:receivedTapAtLocation:", self);
  }
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  id v4 = a3;
  id v5 = [(_UIWTCProofreadingInteraction *)self delegate];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_view);
  [v4 locationInView:WeakRetained];
  double v8 = v7;
  double v10 = v9;

  LOBYTE(self) = objc_msgSend(v5, "proofreadingInteraction:shouldRespondToTapAtPoint:", self, v8, v10);
  return (char)self;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  return 1;
}

- (UIView)view
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_view);
  return (UIView *)WeakRetained;
}

- (_UIWTCProofreadingInteractionDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (_UIWTCProofreadingInteractionDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_view);
  objc_storeStrong((id *)&self->_proofreadingTap, 0);
}

@end