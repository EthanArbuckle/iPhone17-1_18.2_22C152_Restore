@interface SFCapsuleContentViewRegistration
- (SFCapsuleContentViewRegistration)initWithCreateViewBlock:(id)a3;
- (id)createOrDequeueViewWithExistingView:(id)a3;
- (void)discardView:(id)a3;
- (void)enqueueView:(id)a3;
@end

@implementation SFCapsuleContentViewRegistration

- (id)createOrDequeueViewWithExistingView:(id)a3
{
  id v4 = a3;
  views = self->_views;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __72__SFCapsuleContentViewRegistration_createOrDequeueViewWithExistingView___block_invoke;
  v12[3] = &unk_1E54EA318;
  id v6 = v4;
  id v13 = v6;
  v7 = [(NSMutableSet *)views objectsPassingTest:v12];
  if ([v7 containsObject:v6])
  {
    id v8 = v6;
    [(NSMutableSet *)self->_views removeObject:v8];
  }
  else
  {
    if ([v7 count])
    {
      id v9 = [v7 anyObject];
      [(NSMutableSet *)self->_views removeObject:v9];
    }
    else
    {
      (*((void (**)(void))self->_createViewBlock + 2))();
      id v9 = (id)objc_claimAutoreleasedReturnValue();
    }
    id v8 = v6;
    if (v9 != v6)
    {
      if (objc_opt_respondsToSelector()) {
        [v9 prepareForReuse];
      }
      id v8 = v9;
    }
  }
  id v10 = v8;

  return v10;
}

- (void)enqueueView:(id)a3
{
}

BOOL __72__SFCapsuleContentViewRegistration_createOrDequeueViewWithExistingView___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = objc_msgSend(v3, "_sf_firstAncestorViewOfClass:", objc_opt_class());
  v5 = v4;
  BOOL v6 = !v4 || ([v4 isHidden] & 1) != 0 || *(void *)(a1 + 32) == (void)v3;

  return v6;
}

- (SFCapsuleContentViewRegistration)initWithCreateViewBlock:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)SFCapsuleContentViewRegistration;
  v5 = [(SFCapsuleContentViewRegistration *)&v12 init];
  if (v5)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA80] set];
    views = v5->_views;
    v5->_views = (NSMutableSet *)v6;

    id v8 = _Block_copy(v4);
    id createViewBlock = v5->_createViewBlock;
    v5->_id createViewBlock = v8;

    id v10 = v5;
  }

  return v5;
}

- (void)discardView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_createViewBlock, 0);

  objc_storeStrong((id *)&self->_views, 0);
}

@end