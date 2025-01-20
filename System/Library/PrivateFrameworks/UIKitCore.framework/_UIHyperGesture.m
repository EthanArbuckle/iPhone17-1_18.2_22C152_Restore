@interface _UIHyperGesture
- (_UIHyperGesture)init;
- (_UIHyperGesture)initWithInteractor:(id)a3;
- (_UIHyperGestureDelegate)_delegate;
- (_UIHyperInteractor)_interactor;
- (void)_handleGesture:(id)a3;
- (void)_setDelegate:(id)a3;
- (void)_setInteractor:(id)a3;
@end

@implementation _UIHyperGesture

- (_UIHyperGesture)init
{
  v3 = [[_UIHyperInteractor alloc] initWithDimensions:1];
  v4 = [(_UIHyperGesture *)self initWithInteractor:v3];

  return v4;
}

- (_UIHyperGesture)initWithInteractor:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_UIHyperGesture;
  v6 = [(_UIHyperGesture *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->__interactor, a3);
  }

  return v7;
}

- (void)_handleGesture:(id)a3
{
  id v4 = a3;
  id v5 = [(_UIHyperGesture *)self _delegate];
  uint64_t v6 = [v4 state];

  if ((unint64_t)(v6 - 3) < 2)
  {
    v10 = [(_UIHyperGesture *)self _interactor];
    uint64_t v12 = MEMORY[0x1E4F143A8];
    uint64_t v13 = 3221225472;
    v14 = __34___UIHyperGesture__handleGesture___block_invoke_4;
    v15 = &unk_1E52D9F98;
    id v11 = v5;
    id v16 = v11;
    v17 = self;
    [v10 _interactionEndedMutatingState:&v12];

    if (objc_opt_respondsToSelector()) {
      objc_msgSend(v11, "_hyperGestureInteractionDidEnd:", self, v12, v13, v14, v15);
    }
    objc_super v9 = v16;
    goto LABEL_10;
  }
  if (v6 == 2)
  {
LABEL_6:
    v8 = [(_UIHyperGesture *)self _interactor];
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __34___UIHyperGesture__handleGesture___block_invoke;
    v22[3] = &unk_1E52DB3A0;
    v22[4] = self;
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __34___UIHyperGesture__handleGesture___block_invoke_2;
    v21[3] = &unk_1E52DB3A0;
    v21[4] = self;
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __34___UIHyperGesture__handleGesture___block_invoke_3;
    v18[3] = &unk_1E52D9F98;
    id v19 = v5;
    v20 = self;
    [v8 _interactionChangedMutatingTranslation:v22 velocity:v21 mutatingState:v18];

    objc_super v9 = v19;
LABEL_10:

    goto LABEL_11;
  }
  if (v6 == 1)
  {
    v7 = [(_UIHyperGesture *)self _interactor];
    [v7 _interactionBegan];

    if (objc_opt_respondsToSelector()) {
      [v5 _hyperGestureInteractionDidBegin:self];
    }
    goto LABEL_6;
  }
LABEL_11:
}

- (_UIHyperInteractor)_interactor
{
  return self->__interactor;
}

- (void)_setInteractor:(id)a3
{
}

- (_UIHyperGestureDelegate)_delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->__delegate);
  return (_UIHyperGestureDelegate *)WeakRetained;
}

- (void)_setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->__delegate);
  objc_storeStrong((id *)&self->__interactor, 0);
}

@end