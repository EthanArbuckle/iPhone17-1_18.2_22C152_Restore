@interface _UIAsyncDragInteraction
- (BOOL)_itemsForAddingToSession:(id)a3 atPoint:(CAPoint3D)a4 completion:(id)a5;
- (BOOL)_supportsAddingItemsAsynchronously;
- (_UIAsyncDragInteraction)initWithDelegate:(id)a3;
- (void)_prepareForSession:(id)a3 completion:(id)a4;
@end

@implementation _UIAsyncDragInteraction

- (_UIAsyncDragInteraction)initWithDelegate:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)_UIAsyncDragInteraction;
  v5 = [(UIDragInteraction *)&v10 initWithDelegate:v4];
  if (v5)
  {
    *(unsigned char *)&v5->_char delegateImplements = *(unsigned char *)&v5->_delegateImplements & 0xFE | objc_opt_respondsToSelector() & 1;
    char v6 = objc_opt_respondsToSelector();
    char delegateImplements = (char)v5->_delegateImplements;
    if (v6) {
      char v8 = 2;
    }
    else {
      char v8 = 0;
    }
    *(unsigned char *)&v5->_char delegateImplements = delegateImplements & 0xFD | v8;
    if (delegateImplements)
    {
      [(UIDragInteraction *)v5 _setLiftDelay:0.65];
      [(UIDragInteraction *)v5 _setAllowsPointerDragBeforeLiftDelay:0];
    }
  }

  return v5;
}

- (void)_prepareForSession:(id)a3 completion:(id)a4
{
  id v6 = a4;
  if (*(unsigned char *)&self->_delegateImplements)
  {
    id v8 = a3;
    v9 = [_UIBurnableBlock alloc];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __57___UIAsyncDragInteraction__prepareForSession_completion___block_invoke;
    v16[3] = &unk_1E52FADE0;
    id v17 = v6;
    objc_super v10 = [(_UIBurnableBlock *)v9 initWithTimeout:v16 block:&__block_literal_global_347 defaultInputProvider:0.5];
    v11 = [(UIDragInteraction *)self delegate];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __57___UIAsyncDragInteraction__prepareForSession_completion___block_invoke_3;
    v14[3] = &unk_1E52DA6B0;
    v15 = v10;
    v12 = v10;
    [v11 _asyncDragInteraction:self prepareDragSession:v8 completion:v14];

    id v7 = v17;
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)_UIAsyncDragInteraction;
    id v7 = a3;
    [(UIDragInteraction *)&v13 _prepareForSession:v7 completion:v6];
  }
}

- (BOOL)_itemsForAddingToSession:(id)a3 atPoint:(CAPoint3D)a4 completion:(id)a5
{
  double z = a4.z;
  double y = a4.y;
  double x = a4.x;
  id v10 = a5;
  if ((*(unsigned char *)&self->_delegateImplements & 2) != 0)
  {
    id v13 = a3;
    v14 = [_UIBurnableBlock alloc];
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __71___UIAsyncDragInteraction__itemsForAddingToSession_atPoint_completion___block_invoke;
    v22[3] = &unk_1E52E3E60;
    id v23 = v10;
    v15 = [(_UIBurnableBlock *)v14 initWithTimeout:v22 block:&__block_literal_global_12_4 defaultInputProvider:0.5];
    v16 = [(UIDragInteraction *)self delegate];
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __71___UIAsyncDragInteraction__itemsForAddingToSession_atPoint_completion___block_invoke_3;
    v20[3] = &unk_1E52FBD18;
    v21 = v15;
    id v17 = v15;
    objc_msgSend(v16, "_asyncDragInteraction:itemsForAddingToSession:withTouchAtPoint:completion:", self, v13, v20, x, y);

    BOOL v12 = 1;
    id v11 = v23;
  }
  else
  {
    v19.receiver = self;
    v19.super_class = (Class)_UIAsyncDragInteraction;
    id v11 = a3;
    BOOL v12 = -[UIDragInteraction _itemsForAddingToSession:atPoint:completion:](&v19, sel__itemsForAddingToSession_atPoint_completion_, v11, v10, x, y, z);
  }

  return v12;
}

- (BOOL)_supportsAddingItemsAsynchronously
{
  return (*(unsigned char *)&self->_delegateImplements >> 1) & 1;
}

@end