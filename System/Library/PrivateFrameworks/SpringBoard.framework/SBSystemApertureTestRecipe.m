@interface SBSystemApertureTestRecipe
- (SBSystemApertureTestRecipe)init;
- (id)title;
- (void)handleVolumeDecrease;
- (void)handleVolumeIncrease;
@end

@implementation SBSystemApertureTestRecipe

- (SBSystemApertureTestRecipe)init
{
  v12[3] = *MEMORY[0x1E4F143B8];
  v11.receiver = self;
  v11.super_class = (Class)SBSystemApertureTestRecipe;
  v2 = [(SBSystemApertureTestRecipe *)&v11 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F1CA48] array];
    elementAssertions = v2->_elementAssertions;
    v2->_elementAssertions = (NSMutableArray *)v3;

    v5 = self;
    v12[0] = v5;
    v6 = self;
    v12[1] = v6;
    v7 = self;
    v12[2] = v7;
    uint64_t v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:3];
    prototypeElementClasses = v2->_prototypeElementClasses;
    v2->_prototypeElementClasses = (NSArray *)v8;
  }
  return v2;
}

- (id)title
{
  return @"Jindo Elements";
}

- (void)handleVolumeIncrease
{
  uint64_t v3 = [(NSArray *)self->_prototypeElementClasses objectAtIndex:self->_elementClassToInsertIndex];
  v4 = [(id)SBApp systemApertureControllerForMainDisplay];
  id v5 = objc_alloc_init(v3);
  v6 = [v4 registerElement:v5];

  objc_initWeak(&location, self);
  uint64_t v8 = MEMORY[0x1E4F143A8];
  uint64_t v9 = 3221225472;
  v10 = __50__SBSystemApertureTestRecipe_handleVolumeIncrease__block_invoke;
  objc_super v11 = &unk_1E6AFFF18;
  objc_copyWeak(&v12, &location);
  [v6 addInvalidationBlock:&v8];
  if (v6)
  {
    -[NSMutableArray addObject:](self->_elementAssertions, "addObject:", v6, v8, v9, v10, v11);
    int64_t elementClassToInsertIndex = self->_elementClassToInsertIndex;
    self->_int64_t elementClassToInsertIndex = (elementClassToInsertIndex + 1)
                                     % [(NSArray *)self->_prototypeElementClasses count];
  }
  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

void __50__SBSystemApertureTestRecipe_handleVolumeIncrease__block_invoke(uint64_t a1, void *a2)
{
  id v9 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v5 = [*((id *)WeakRetained + 2) indexOfObject:v9];
    if (v5 != 0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v6 = v5;
      v7 = (void *)v4[2];
      uint64_t v8 = [MEMORY[0x1E4F1CA98] null];
      [v7 replaceObjectAtIndex:v6 withObject:v8];
    }
  }
}

- (void)handleVolumeDecrease
{
  uint64_t v3 = [(NSMutableArray *)self->_elementAssertions lastObject];
  uint64_t v6 = v3;
  if (v3)
  {
    [(NSMutableArray *)self->_elementAssertions removeObject:v3];
    char v4 = objc_opt_respondsToSelector();
    uint64_t v3 = v6;
    if (v4)
    {
      [v6 invalidateWithReason:@"volume decrease"];
      uint64_t v3 = v6;
    }
  }
  int64_t elementClassToInsertIndex = self->_elementClassToInsertIndex;
  if (elementClassToInsertIndex <= 0)
  {
    int64_t elementClassToInsertIndex = [(NSArray *)self->_prototypeElementClasses count];
    uint64_t v3 = v6;
  }
  self->_int64_t elementClassToInsertIndex = elementClassToInsertIndex - 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_elementAssertions, 0);
  objc_storeStrong((id *)&self->_prototypeElementClasses, 0);
}

@end