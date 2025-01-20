@interface UIAccessibilityHitTestOptions
+ (id)defaultOptions;
+ (id)dwellControlElementHighlightOptions;
- (BOOL)shouldHitTestUserTestingChildren;
- (NSArray)outOfBoundsHitTestElements;
- (id)fallbackPredicate;
- (id)isEligibleElement;
- (id)leafNodePredicate;
- (void)setFallbackPredicate:(id)a3;
- (void)setIsEligibleElement:(id)a3;
- (void)setLeafNodePredicate:(id)a3;
- (void)setOutOfBoundsHitTestElements:(id)a3;
- (void)setShouldHitTestUserTestingChildren:(BOOL)a3;
@end

@implementation UIAccessibilityHitTestOptions

+ (id)defaultOptions
{
  id v2 = objc_alloc_init((Class)a1);
  [v2 setLeafNodePredicate:&__block_literal_global_17];
  [v2 setFallbackPredicate:&__block_literal_global_267_0];
  [v2 setIsEligibleElement:&__block_literal_global_269_0];

  return v2;
}

uint64_t __47__UIAccessibilityHitTestOptions_defaultOptions__block_invoke(uint64_t a1, void *a2)
{
  return [a2 isAccessibilityElement];
}

uint64_t __47__UIAccessibilityHitTestOptions_defaultOptions__block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 _accessibilityIsTouchContainer];
}

uint64_t __47__UIAccessibilityHitTestOptions_defaultOptions__block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (([v2 isAccessibilityElement] & 1) != 0
    || ([v2 _accessibilityIsTouchContainer] & 1) != 0)
  {
    uint64_t v3 = 1;
  }
  else
  {
    uint64_t v3 = [v2 accessibilityViewIsModal];
  }

  return v3;
}

+ (id)dwellControlElementHighlightOptions
{
  id v3 = objc_alloc_init((Class)a1);
  [v3 setShouldHitTestUserTestingChildren:1];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __68__UIAccessibilityHitTestOptions_dwellControlElementHighlightOptions__block_invoke_2;
  v10[3] = &unk_1E59B9218;
  id v11 = &__block_literal_global_271_0;
  [v3 setLeafNodePredicate:v10];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __68__UIAccessibilityHitTestOptions_dwellControlElementHighlightOptions__block_invoke_4;
  v7[3] = &unk_1E59B9D20;
  id v8 = &__block_literal_global_271_0;
  id v9 = a1;
  [v3 setFallbackPredicate:v7];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __68__UIAccessibilityHitTestOptions_dwellControlElementHighlightOptions__block_invoke_6;
  v5[3] = &unk_1E59B9218;
  id v6 = &__block_literal_global_271_0;
  [v3 setIsEligibleElement:v5];

  return v3;
}

BOOL __68__UIAccessibilityHitTestOptions_dwellControlElementHighlightOptions__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 isAccessibilityElement]
    && [v2 accessibilityRespondsToUserInteraction])
  {
    uint64_t v3 = [v2 accessibilityTraits];
    BOOL v4 = ((*MEMORY[0x1E4F434E0] | UIAccessibilityTraitIsEditing) & v3) == 0;
  }
  else
  {
    BOOL v4 = 0;
  }

  return v4;
}

BOOL __68__UIAccessibilityHitTestOptions_dwellControlElementHighlightOptions__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ((*(unsigned int (**)(void))(*(void *)(a1 + 32) + 16))())
  {
    NSClassFromString(&cfstr_SwiftuiAccessi.isa);
    if (objc_opt_isKindOfClass())
    {
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      v9[2] = __68__UIAccessibilityHitTestOptions_dwellControlElementHighlightOptions__block_invoke_3;
      v9[3] = &unk_1E59B9218;
      id v10 = *(id *)(a1 + 32);
      BOOL v4 = [v3 _accessibilityFindAncestor:v9 startWithSelf:0];

      if (v4)
      {
        uint64_t v5 = *MEMORY[0x1E4F48C40] | *MEMORY[0x1E4F48BA8] | *MEMORY[0x1E4F48C90] | *MEMORY[0x1E4F48B60] | *MEMORY[0x1E4F48CE8];
        BOOL v6 = ([v3 accessibilityTraits] & v5) != 0;
        id v7 = v10;
LABEL_8:

        goto LABEL_9;
      }
    }
    id v7 = [v3 automationElements];
    BOOL v6 = [v7 count] == 0;
    goto LABEL_8;
  }
  BOOL v6 = 0;
LABEL_9:

  return v6;
}

uint64_t __68__UIAccessibilityHitTestOptions_dwellControlElementHighlightOptions__block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __68__UIAccessibilityHitTestOptions_dwellControlElementHighlightOptions__block_invoke_4(uint64_t a1)
{
  unsigned int v2 = (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __68__UIAccessibilityHitTestOptions_dwellControlElementHighlightOptions__block_invoke_5;
  v7[3] = &unk_1E59B9218;
  id v3 = *(void **)(a1 + 40);
  id v8 = *(id *)(a1 + 32);
  BOOL v4 = [v3 _accessibilityFindAncestor:v7 startWithSelf:0];

  if (v4) {
    uint64_t v5 = 0;
  }
  else {
    uint64_t v5 = v2;
  }

  return v5;
}

uint64_t __68__UIAccessibilityHitTestOptions_dwellControlElementHighlightOptions__block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __68__UIAccessibilityHitTestOptions_dwellControlElementHighlightOptions__block_invoke_6(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ((*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))()) {
    uint64_t v4 = 1;
  }
  else {
    uint64_t v4 = [v3 _accessibilityIsRemoteElement];
  }

  return v4;
}

- (id)leafNodePredicate
{
  return self->_leafNodePredicate;
}

- (void)setLeafNodePredicate:(id)a3
{
}

- (id)fallbackPredicate
{
  return self->_fallbackPredicate;
}

- (void)setFallbackPredicate:(id)a3
{
}

- (id)isEligibleElement
{
  return self->_isEligibleElement;
}

- (void)setIsEligibleElement:(id)a3
{
}

- (BOOL)shouldHitTestUserTestingChildren
{
  return self->_shouldHitTestUserTestingChildren;
}

- (void)setShouldHitTestUserTestingChildren:(BOOL)a3
{
  self->_shouldHitTestUserTestingChildren = a3;
}

- (NSArray)outOfBoundsHitTestElements
{
  return self->_outOfBoundsHitTestElements;
}

- (void)setOutOfBoundsHitTestElements:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_outOfBoundsHitTestElements, 0);
  objc_storeStrong(&self->_isEligibleElement, 0);
  objc_storeStrong(&self->_fallbackPredicate, 0);

  objc_storeStrong(&self->_leafNodePredicate, 0);
}

@end