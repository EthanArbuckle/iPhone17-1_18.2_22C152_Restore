@interface _UIBarItemAppearance
+ (id)_appearanceForClass:(Class)a3 withContainerList:(id)a4;
+ (id)_rootAppearancesNode;
- (void)_handleGetterInvocation:(id)a3;
- (void)_handleSetterInvocation:(id)a3;
- (void)dealloc;
@end

@implementation _UIBarItemAppearance

+ (id)_rootAppearancesNode
{
  id result = (id)_rootAppearancesNode_appearances;
  if (!_rootAppearancesNode_appearances)
  {
    id result = (id)[objc_alloc(MEMORY[0x1E4F28E10]) initWithKeyOptions:0 valueOptions:0 capacity:0];
    _rootAppearancesNode_appearances = (uint64_t)result;
  }
  return result;
}

+ (id)_appearanceForClass:(Class)a3 withContainerList:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v17.receiver = a1;
  v17.super_class = (Class)&OBJC_METACLASS____UIBarItemAppearance;
  v6 = (id *)objc_msgSendSuper2(&v17, sel__appearanceForClass_withContainerList_);
  if (!v6[5])
  {
    v7 = (void *)[(objc_class *)a3 _appearanceBlindViewClasses];
    v6[5] = (id)objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v7, "count"));
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v13 objects:v18 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v14;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v14 != v10) {
            objc_enumerationMutation(v7);
          }
          objc_msgSend(v6[5], "addObject:", +[_UIAppearance _appearanceWithClassInfo:containerList:](_UIAppearance, "_appearanceWithClassInfo:containerList:", +[_UIAppearanceCustomizableClassInfo _customizableClassInfoForViewClass:withGuideClass:](_UIAppearanceCustomizableClassInfo, "_customizableClassInfoForViewClass:withGuideClass:", *(void *)(*((void *)&v13 + 1) + 8 * v11++), a3), a4));
        }
        while (v9 != v11);
        uint64_t v9 = [v7 countByEnumeratingWithState:&v13 objects:v18 count:16];
      }
      while (v9);
    }
  }
  return v6;
}

- (void)_handleSetterInvocation:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  blindViewAppearances = self->_blindViewAppearances;
  uint64_t v5 = [(NSArray *)blindViewAppearances countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(blindViewAppearances);
        }
        [*(id *)(*((void *)&v9 + 1) + 8 * i) _handleSetterInvocation:a3];
      }
      uint64_t v6 = [(NSArray *)blindViewAppearances countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (void)_handleGetterInvocation:(id)a3
{
  id v4 = [(NSArray *)self->_blindViewAppearances lastObject];
  [v4 _handleGetterInvocation:a3];
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)_UIBarItemAppearance;
  [(_UIAppearance *)&v3 dealloc];
}

@end