@interface NAUILayoutConstraintSet
- (BOOL)isActive;
- (NAUILayoutConstraintSet)initWithOwningView:(id)a3 constraintBuilder:(id)a4;
- (NSArray)constraints;
- (UIView)owningView;
- (id)builder;
- (void)activateIfNeeded;
- (void)invalidate;
- (void)setConstraints:(id)a3;
- (void)updateConstraintConstants;
@end

@implementation NAUILayoutConstraintSet

- (NAUILayoutConstraintSet)initWithOwningView:(id)a3 constraintBuilder:(id)a4
{
  objc_initWeak(&location, a3);
  id v6 = a4;
  v12.receiver = self;
  v12.super_class = (Class)NAUILayoutConstraintSet;
  v7 = [(NAUILayoutConstraintSet *)&v12 init];
  if (v7)
  {
    id v8 = objc_loadWeakRetained(&location);
    objc_storeWeak((id *)&v7->_owningView, v8);

    uint64_t v9 = MEMORY[0x223C9CEC0](v6);
    id builder = v7->_builder;
    v7->_id builder = (id)v9;
  }
  objc_destroyWeak(&location);
  return v7;
}

- (BOOL)isActive
{
  v2 = [(NAUILayoutConstraintSet *)self constraints];
  BOOL v3 = v2 != 0;

  return v3;
}

- (void)activateIfNeeded
{
  if (![(NAUILayoutConstraintSet *)self isActive])
  {
    BOOL v3 = [(NAUILayoutConstraintSet *)self owningView];

    if (v3)
    {
      v4 = [(NAUILayoutConstraintSet *)self builder];
      v5 = [(NAUILayoutConstraintSet *)self owningView];
      uint64_t v6 = ((void (**)(void, void *))v4)[2](v4, v5);
      v7 = (void *)v6;
      if (v6) {
        uint64_t v8 = v6;
      }
      else {
        uint64_t v8 = MEMORY[0x263EFFA68];
      }
      [(NAUILayoutConstraintSet *)self setConstraints:v8];

      uint64_t v9 = (void *)MEMORY[0x263F34230];
      id v10 = [(NAUILayoutConstraintSet *)self constraints];
      [v9 activateConstraints:v10];
    }
  }
}

- (void)invalidate
{
  if ([(NAUILayoutConstraintSet *)self isActive])
  {
    BOOL v3 = (void *)MEMORY[0x263F34230];
    v4 = [(NAUILayoutConstraintSet *)self constraints];
    [v3 deactivateConstraints:v4];

    [(NAUILayoutConstraintSet *)self setConstraints:0];
    id v5 = [(NAUILayoutConstraintSet *)self owningView];
    [v5 setNeedsUpdateConstraints];
  }
}

- (void)updateConstraintConstants
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  uint64_t v3 = [(NAUILayoutConstraintSet *)self owningView];
  if (v3)
  {
    v4 = (void *)v3;
    BOOL v5 = [(NAUILayoutConstraintSet *)self isActive];

    if (v5)
    {
      uint64_t v6 = [(NAUILayoutConstraintSet *)self builder];
      v7 = [(NAUILayoutConstraintSet *)self owningView];
      uint64_t v8 = ((void (**)(void, void *))v6)[2](v6, v7);
      uint64_t v9 = (void *)v8;
      id v10 = (void *)MEMORY[0x263EFFA68];
      if (v8) {
        id v10 = (void *)v8;
      }
      id v11 = v10;

      long long v24 = 0u;
      long long v25 = 0u;
      long long v22 = 0u;
      long long v23 = 0u;
      id obj = v11;
      uint64_t v12 = [obj countByEnumeratingWithState:&v22 objects:v26 count:16];
      if (v12)
      {
        uint64_t v13 = v12;
        uint64_t v14 = *(void *)v23;
        do
        {
          uint64_t v15 = 0;
          do
          {
            if (*(void *)v23 != v14) {
              objc_enumerationMutation(obj);
            }
            v16 = *(void **)(*((void *)&v22 + 1) + 8 * v15);
            v17 = [(NAUILayoutConstraintSet *)self constraints];
            v21[0] = MEMORY[0x263EF8330];
            v21[1] = 3221225472;
            v21[2] = __52__NAUILayoutConstraintSet_updateConstraintConstants__block_invoke;
            v21[3] = &unk_264627E48;
            v21[4] = v16;
            v18 = objc_msgSend(v17, "na_firstObjectPassingTest:", v21);

            if (v18)
            {
              [v16 constant];
              objc_msgSend(v18, "setConstant:");
            }
            else
            {
              v19 = [(NAUILayoutConstraintSet *)self constraints];
              NSLog(&cfstr_FoundNewConstr.isa, v16, "-[NAUILayoutConstraintSet updateConstraintConstants]", v19);
            }
            ++v15;
          }
          while (v13 != v15);
          uint64_t v13 = [obj countByEnumeratingWithState:&v22 objects:v26 count:16];
        }
        while (v13);
      }
    }
  }
}

BOOL __52__NAUILayoutConstraintSet_updateConstraintConstants__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [*(id *)(a1 + 32) firstAnchor];
  BOOL v5 = [v3 firstAnchor];
  if ([v4 isEqual:v5])
  {
    uint64_t v6 = [*(id *)(a1 + 32) secondAnchor];
    v7 = [v3 secondAnchor];
    id v8 = v6;
    id v9 = v7;
    id v10 = v9;
    if (v8 == v9)
    {
    }
    else
    {
      if (!v8)
      {

        goto LABEL_12;
      }
      int v11 = [v8 isEqual:v9];

      if (!v11) {
        goto LABEL_12;
      }
    }
    uint64_t v13 = [*(id *)(a1 + 32) relation];
    if (v13 == [v3 relation])
    {
      [*(id *)(a1 + 32) multiplier];
      double v15 = v14;
      [v3 multiplier];
      if (NACGFloatEqualToFloat(v15, v16))
      {
        [*(id *)(a1 + 32) priority];
        float v18 = v17;
        [v3 priority];
        BOOL v12 = v18 == v19;
LABEL_13:

        goto LABEL_14;
      }
    }
LABEL_12:
    BOOL v12 = 0;
    goto LABEL_13;
  }
  BOOL v12 = 0;
LABEL_14:

  return v12;
}

- (UIView)owningView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_owningView);
  return (UIView *)WeakRetained;
}

- (id)builder
{
  return self->_builder;
}

- (NSArray)constraints
{
  return self->_constraints;
}

- (void)setConstraints:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_constraints, 0);
  objc_storeStrong(&self->_builder, 0);
  objc_destroyWeak((id *)&self->_owningView);
}

@end