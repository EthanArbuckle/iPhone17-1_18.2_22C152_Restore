@interface NAMutableTreeNode
- (void)addChild:(id)a3;
- (void)addChildren:(id)a3;
- (void)removeChild:(id)a3;
- (void)removeChildrenPassingTest:(id)a3;
- (void)setChildNodes:(id)a3;
@end

@implementation NAMutableTreeNode

- (void)setChildNodes:(id)a3
{
  id v4 = a3;
  id v5 = [(NATreeNode *)self internalChildNodes];
  [v5 setSet:v4];
}

- (void)addChild:(id)a3
{
  id v4 = a3;
  id v5 = [(NATreeNode *)self internalChildNodes];
  objc_msgSend(v5, "na_safeAddObject:", v4);
}

- (void)addChildren:(id)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __33__NAMutableTreeNode_addChildren___block_invoke;
  v3[3] = &unk_1E6109A20;
  v3[4] = self;
  [a3 enumerateObjectsUsingBlock:v3];
}

uint64_t __33__NAMutableTreeNode_addChildren___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addChild:a2];
}

- (void)removeChild:(id)a3
{
  id v4 = a3;
  id v5 = [(NATreeNode *)self internalChildNodes];
  [v5 removeObject:v4];
}

- (void)removeChildrenPassingTest:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = (unsigned int (**)(id, void *))a3;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v5 = [(NATreeNode *)self shallowNodeEnumerator];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        if (v4[2](v4, v10)) {
          [(NAMutableTreeNode *)self removeChild:v10];
        }
        else {
          [v10 removeChildrenPassingTest:v4];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }
}

@end