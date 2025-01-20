@interface PKApplicationMessageView_RemovedSubviewContainer
- (PKApplicationMessageView_RemovedSubviewContainer)init;
- (id)initWithView:(void *)a3 index:(int)a4 layoutMode:(void *)a5 commitAnimation:;
- (void)_finishFromDealloc:(uint64_t)a1;
- (void)dealloc;
@end

@implementation PKApplicationMessageView_RemovedSubviewContainer

- (PKApplicationMessageView_RemovedSubviewContainer)init
{
  return 0;
}

- (id)initWithView:(void *)a3 index:(int)a4 layoutMode:(void *)a5 commitAnimation:
{
  id v10 = a2;
  id v11 = a5;
  if (a1 && v10)
  {
    v22.receiver = a1;
    v22.super_class = (Class)PKApplicationMessageView_RemovedSubviewContainer;
    v12 = (id *)objc_msgSendSuper2(&v22, sel_init);
    v13 = v12;
    if (v12)
    {
      v14 = v12 + 4;
      objc_storeStrong(v12 + 4, a2);
      v13[5] = a3;
      v13[6] = a3;
      *((_DWORD *)v13 + 7) = a4;
      *((unsigned char *)v13 + 24) = 0;
      v15 = _Block_copy(v11);
      id v16 = v13[1];
      v13[1] = v15;

      [v13[4] setUserInteractionEnabled:0];
      v17 = [v13[4] traitCollection];
      v18 = v17;
      if (v17)
      {
        v19 = [v17 preferredContentSizeCategory];
        if (UIContentSizeCategoryCompareToCategory(v19, (UIContentSizeCategory)*MEMORY[0x1E4FB27F0]))
        {
          [*v14 setMinimumContentSizeCategory:v19];
          [*v14 setMaximumContentSizeCategory:v19];
        }
      }
    }
    a1 = v13;
    v20 = a1;
  }
  else
  {
    v20 = 0;
  }

  return v20;
}

- (void)dealloc
{
  if (self->_commitFlag == 1) {
    -[PKApplicationMessageView_RemovedSubviewContainer _finishFromDealloc:]((uint64_t)self, 1);
  }
  v3.receiver = self;
  v3.super_class = (Class)PKApplicationMessageView_RemovedSubviewContainer;
  [(PKApplicationMessageView_RemovedSubviewContainer *)&v3 dealloc];
}

- (void)_finishFromDealloc:(uint64_t)a1
{
  if (a1)
  {
    if (*(unsigned char *)(a1 + 24) == 1)
    {
      *(unsigned char *)(a1 + 24) = 2;
      uint64_t v3 = *(void *)(a1 + 16);
      if (v3)
      {
        if (a2) {
          uint64_t v4 = 0;
        }
        else {
          uint64_t v4 = a1;
        }
        (*(void (**)(uint64_t, uint64_t))(v3 + 16))(v3, v4);
        v5 = *(void **)(a1 + 16);
        *(void *)(a1 + 16) = 0;
      }
    }
    else
    {
      __break(1u);
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_view, 0);
  objc_storeStrong(&self->_commitCompletion, 0);

  objc_storeStrong(&self->_commitAnimation, 0);
}

@end