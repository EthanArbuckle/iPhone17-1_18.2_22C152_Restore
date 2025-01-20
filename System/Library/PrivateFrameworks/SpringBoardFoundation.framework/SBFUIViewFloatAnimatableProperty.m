@interface SBFUIViewFloatAnimatableProperty
+ (id)sbf_animatablePropertyWithProgressMilestonesToBlocks:(id)a3;
- (void)invalidate;
@end

@implementation SBFUIViewFloatAnimatableProperty

+ (id)sbf_animatablePropertyWithProgressMilestonesToBlocks:(id)a3
{
  id v4 = a3;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __89__SBFUIViewFloatAnimatableProperty_sbf_animatablePropertyWithProgressMilestonesToBlocks___block_invoke;
  v12[3] = &unk_1E548DCB8;
  id v5 = v4;
  id v13 = v5;
  v6 = (void *)MEMORY[0x18C133210](v12);
  v7 = (void *)MEMORY[0x1E4F1CAD0];
  v8 = [v5 allKeys];
  v9 = [v7 setWithArray:v8];
  objc_msgSend(a1, "sbf_animatablePropertyWithProgressMilestones:block:", v9, v6);
  v10 = (id *)objc_claimAutoreleasedReturnValue();

  if (v5) {
    [v10[4] removeObjectForKey:&unk_1ED89F108];
  }

  return v10;
}

void __89__SBFUIViewFloatAnimatableProperty_sbf_animatablePropertyWithProgressMilestonesToBlocks___block_invoke(uint64_t a1, void *a2, double a3, double a4)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  uint64_t v8 = objc_opt_class();
  id v9 = v7;
  if (v8)
  {
    if (objc_opt_isKindOfClass()) {
      v10 = v9;
    }
    else {
      v10 = 0;
    }
  }
  else
  {
    v10 = 0;
  }
  id v11 = v10;

  if (v9)
  {
    if (!*((unsigned char *)v11 + 24))
    {
      uint64_t v12 = [*(id *)(a1 + 32) mutableCopy];
      id v13 = (void *)*((void *)v11 + 4);
      *((void *)v11 + 4) = v12;

      *((unsigned char *)v11 + 24) = 1;
    }
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    v14 = objc_msgSend(*((id *)v11 + 4), "allKeys", 0);
    uint64_t v15 = [v14 countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v22;
      do
      {
        for (uint64_t i = 0; i != v16; ++i)
        {
          if (*(void *)v22 != v17) {
            objc_enumerationMutation(v14);
          }
          v19 = *(void **)(*((void *)&v21 + 1) + 8 * i);
          objc_msgSend(v19, "bs_CGFloatValue");
          if (BSFloatApproximatelyEqualToFloat())
          {
            v20 = [*((id *)v11 + 4) objectForKey:v19];
            [*((id *)v11 + 4) removeObjectForKey:v19];
            ((void (**)(void, id, void, double, double))v20)[2](v20, v11, 0, a3, a4);
          }
        }
        uint64_t v16 = [v14 countByEnumeratingWithState:&v21 objects:v25 count:16];
      }
      while (v16);
    }
  }
}

- (void)invalidate
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  [(UIViewFloatAnimatableProperty *)self presentationValue];
  v14.receiver = self;
  v14.super_class = (Class)SBFUIViewFloatAnimatableProperty;
  [(UIAnimatablePropertyWrapper *)&v14 invalidate];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v3 = [(NSMutableDictionary *)self->_mutableMilestonesToBlocks allKeys];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v10 objects:v15 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void **)(*((void *)&v10 + 1) + 8 * i);
        id v9 = [(NSMutableDictionary *)self->_mutableMilestonesToBlocks objectForKey:v8];
        if (v9)
        {
          objc_msgSend(v8, "bs_CGFloatValue");
          ((void (**)(void, SBFUIViewFloatAnimatableProperty *, uint64_t))v9)[2](v9, self, 1);
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v10 objects:v15 count:16];
    }
    while (v5);
  }

  [(NSMutableDictionary *)self->_mutableMilestonesToBlocks removeAllObjects];
}

- (void).cxx_destruct
{
}

@end