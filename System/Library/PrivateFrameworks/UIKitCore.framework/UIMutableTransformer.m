@interface UIMutableTransformer
- (UIMutableTransformerDelegate)_delegate;
- (id)copyWithZone:(_NSZone *)a3;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (void)_ensureTransformsStructuresExists;
- (void)_setDelegate:(id)a3;
- (void)_updateTransform;
- (void)addTransform:(id)a3 reason:(id)a4;
- (void)removeAll;
- (void)removeTransform:(id)a3;
- (void)replaceTransform:(id)a3 withTransform:(id)a4 reason:(id)a5;
@end

@implementation UIMutableTransformer

- (void)addTransform:(id)a3 reason:(id)a4
{
  id v11 = a3;
  id v7 = a4;
  if (!v11)
  {
    v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"UITransform.m", 252, @"Invalid parameter not satisfying: %@", @"transform" object file lineNumber description];
  }
  [(UIMutableTransformer *)self _ensureTransformsStructuresExists];
  [(NSMutableArray *)self->super._transforms addObject:v11];
  transformReasonAssociations = self->super._transformReasonAssociations;
  v9 = +[_UITransformToReasonAssociation association:v11 reason:v7];
  [(NSMutableArray *)transformReasonAssociations addObject:v9];

  [(UIMutableTransformer *)self _updateTransform];
}

- (void)replaceTransform:(id)a3 withTransform:(id)a4 reason:(id)a5
{
  id v17 = a3;
  id v9 = a4;
  id v10 = a5;
  if (!v17)
  {
    v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2, self, @"UITransform.m", 262, @"Invalid parameter not satisfying: %@", @"priorTransform" object file lineNumber description];

    if (v9) {
      goto LABEL_3;
    }
LABEL_10:
    v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2, self, @"UITransform.m", 263, @"Invalid parameter not satisfying: %@", @"newTransform" object file lineNumber description];

    goto LABEL_3;
  }
  if (!v9) {
    goto LABEL_10;
  }
LABEL_3:
  unint64_t v11 = [(NSMutableArray *)self->super._transforms indexOfObject:v17];
  if (v11 != 0x7FFFFFFFFFFFFFFFLL)
  {
    unint64_t v12 = v11;
    if (v11 < [(NSMutableArray *)self->super._transforms count])
    {
      [(NSMutableArray *)self->super._transforms replaceObjectAtIndex:v12 withObject:v9];
      transformReasonAssociations = self->super._transformReasonAssociations;
      v14 = +[_UITransformToReasonAssociation association:v9 reason:v10];
      [(NSMutableArray *)transformReasonAssociations replaceObjectAtIndex:v12 withObject:v14];

      [(UIMutableTransformer *)self _updateTransform];
    }
  }
}

- (void)removeTransform:(id)a3
{
  id v5 = a3;
  id v9 = v5;
  if (!v5)
  {
    v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"UITransform.m", 277, @"Invalid parameter not satisfying: %@", @"transform" object file lineNumber description];

    id v5 = 0;
  }
  unint64_t v6 = [(NSMutableArray *)self->super._transforms indexOfObject:v5];
  if (v6 != 0x7FFFFFFFFFFFFFFFLL)
  {
    unint64_t v7 = v6;
    if (v6 < [(NSMutableArray *)self->super._transforms count])
    {
      [(NSMutableArray *)self->super._transforms removeObjectAtIndex:v7];
      [(NSMutableArray *)self->super._transformReasonAssociations removeObjectAtIndex:v7];
      [(UIMutableTransformer *)self _updateTransform];
    }
  }
}

- (void)removeAll
{
  if ([(NSMutableArray *)self->super._transforms count])
  {
    [(NSMutableArray *)self->super._transforms removeAllObjects];
    [(NSMutableArray *)self->super._transformReasonAssociations removeAllObjects];
    [(UIMutableTransformer *)self _updateTransform];
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [UITransformer alloc];
  return [(UITransformer *)v4 _initWithTransformer:self];
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  v12.receiver = self;
  v12.super_class = (Class)UIMutableTransformer;
  v4 = [(UITransformer *)&v12 descriptionBuilderWithMultilinePrefix:a3];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __62__UIMutableTransformer_descriptionBuilderWithMultilinePrefix___block_invoke;
  v9[3] = &unk_1E52D9F98;
  id v5 = v4;
  id v10 = v5;
  unint64_t v11 = self;
  id v6 = (id)[v5 modifyBody:v9];
  id v7 = v5;

  return v7;
}

void __62__UIMutableTransformer_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 72));
  id v2 = (id)[v1 appendObject:WeakRetained withName:@"delegate"];
}

- (void)_ensureTransformsStructuresExists
{
  if (!self->super._transforms)
  {
    v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    transforms = self->super._transforms;
    self->super._transforms = v3;

    id v5 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    transformReasonAssociations = self->super._transformReasonAssociations;
    self->super._transformReasonAssociations = v5;
  }
}

- (void)_updateTransform
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  long long v3 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  *(_OWORD *)&v20.a = *MEMORY[0x1E4F1DAB8];
  *(_OWORD *)&v20.c = v3;
  *(_OWORD *)&v20.tx = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  v4 = self->super._transforms;
  uint64_t v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v16 objects:v21 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v17;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v17 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = *(void **)(*((void *)&v16 + 1) + 8 * v8);
        if (v9) {
          [v9 transform];
        }
        else {
          memset(&t2, 0, sizeof(t2));
        }
        CGAffineTransform t1 = v20;
        CGAffineTransformConcat(&v20, &t1, &t2);
        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v16 objects:v21 count:16];
    }
    while (v6);
  }

  long long v10 = *(_OWORD *)&self->super.super._transform.c;
  *(_OWORD *)&t1.a = *(_OWORD *)&self->super.super._transform.a;
  *(_OWORD *)&t1.c = v10;
  *(_OWORD *)&t1.tx = *(_OWORD *)&self->super.super._transform.tx;
  CGAffineTransform v13 = v20;
  if (!CGAffineTransformEqualToTransform(&t1, &v13))
  {
    long long v11 = *(_OWORD *)&v20.c;
    *(_OWORD *)&self->super.super._transform.a = *(_OWORD *)&v20.a;
    *(_OWORD *)&self->super.super._transform.c = v11;
    *(_OWORD *)&self->super.super._transform.tx = *(_OWORD *)&v20.tx;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained transformsDidChange:self];
  }
}

- (UIMutableTransformerDelegate)_delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (UIMutableTransformerDelegate *)WeakRetained;
}

- (void)_setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end