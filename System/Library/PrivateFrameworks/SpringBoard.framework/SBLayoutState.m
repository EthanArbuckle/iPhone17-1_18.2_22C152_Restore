@interface SBLayoutState
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqual:(id)a3 withRole:(int64_t)a4;
- (BOOL)isMeaningfullyDifferentFromLayoutState:(id)a3;
- (BOOL)layoutContainsRole:(int64_t)a3;
- (NSDictionary)interfaceOrientationByLayoutElementIdentifier;
- (NSSet)elements;
- (NSString)description;
- (SBLayoutState)init;
- (id)_initWithLayoutElements:(id)a3 interfaceOrientation:(int64_t)a4 interfaceOrientationByLayoutElement:(id)a5;
- (id)appLayout;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)elementWithIdentifier:(id)a3;
- (id)elementWithRole:(int64_t)a3;
- (id)floatingAppLayout;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (int64_t)_defaultInterfaceOrientation;
- (int64_t)_interfaceOrientationForElementIdentifier:(id)a3 unknownAllowed:(BOOL)a4;
- (int64_t)interfaceOrientation;
- (int64_t)interfaceOrientationForElementIdentifier:(id)a3;
- (int64_t)interfaceOrientationForLayoutElement:(id)a3;
- (int64_t)interfaceOrientationForLayoutElement:(id)a3 unknownAllowed:(BOOL)a4;
- (int64_t)interfaceOrientationForLayoutRole:(int64_t)a3;
- (unint64_t)hash;
- (void)setInterfaceOrientation:(int64_t)a3;
- (void)setInterfaceOrientationByLayoutElementIdentifier:(id)a3;
@end

@implementation SBLayoutState

- (BOOL)layoutContainsRole:(int64_t)a3
{
  v3 = [(SBLayoutState *)self elementWithRole:a3];
  BOOL v4 = v3 != 0;

  return v4;
}

- (int64_t)interfaceOrientation
{
  if (self->_interfaceOrientation) {
    return self->_interfaceOrientation;
  }
  else {
    return [(SBLayoutState *)self _defaultInterfaceOrientation];
  }
}

- (BOOL)isEqual:(id)a3
{
  v7 = (SBLayoutState *)a3;
  if (self == v7)
  {
    char v10 = 1;
    goto LABEL_19;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    char v10 = 0;
    goto LABEL_19;
  }
  v8 = [(SBLayoutState *)self elements];
  if (v8 || ([(SBLayoutState *)v7 elements], (v3 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    BOOL v4 = [(SBLayoutState *)self elements];
    v5 = [(SBLayoutState *)v7 elements];
    if (([v4 isEqualToSet:v5] & 1) == 0)
    {

      char v10 = 0;
      goto LABEL_16;
    }
    int v9 = 1;
  }
  else
  {
    int v9 = 0;
  }
  int64_t v11 = [(SBLayoutState *)self interfaceOrientation];
  if (v11 == [(SBLayoutState *)v7 interfaceOrientation])
  {
    v12 = [(SBLayoutState *)self interfaceOrientationByLayoutElementIdentifier];
    v13 = [(SBLayoutState *)v7 interfaceOrientationByLayoutElementIdentifier];
    char v10 = SBEqualObjects(v12, v13);

    if (!v9) {
      goto LABEL_16;
    }
    goto LABEL_15;
  }
  char v10 = 0;
  if (v9)
  {
LABEL_15:
  }
LABEL_16:
  if (!v8) {

  }
LABEL_19:
  return v10;
}

- (id)elementWithRole:(int64_t)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  BOOL v4 = [(SBLayoutState *)self elements];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        int v9 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        if ([v9 layoutRole] == a3)
        {
          id v10 = v9;
          goto LABEL_11;
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  id v10 = 0;
LABEL_11:

  return v10;
}

- (NSSet)elements
{
  return self->_elements;
}

- (NSDictionary)interfaceOrientationByLayoutElementIdentifier
{
  return self->_interfaceOrientationByLayoutElementIdentifier;
}

- (int64_t)interfaceOrientationForLayoutElement:(id)a3
{
  BOOL v4 = [a3 uniqueIdentifier];
  int64_t v5 = [(SBLayoutState *)self interfaceOrientationForElementIdentifier:v4];

  return v5;
}

- (int64_t)_interfaceOrientationForElementIdentifier:(id)a3 unknownAllowed:(BOOL)a4
{
  id v7 = a3;
  v8 = [(SBLayoutState *)self elementWithIdentifier:v7];
  if (!v8
    || (interfaceOrientationByLayoutElementIdentifier = self->_interfaceOrientationByLayoutElementIdentifier,
        v8,
        !interfaceOrientationByLayoutElementIdentifier))
  {
    int64_t v11 = 0;
LABEL_8:
    if (!a4) {
      int64_t v11 = [(SBLayoutState *)self _defaultInterfaceOrientation];
    }
    goto LABEL_10;
  }
  id v10 = [(NSDictionary *)self->_interfaceOrientationByLayoutElementIdentifier objectForKey:v7];
  if (!v10)
  {
    long long v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2 object:self file:@"SBLayoutState.m" lineNumber:80 description:@"Layout state element is known but its orientation is not mapped."];
  }
  int64_t v11 = [v10 integerValue];

  if (!v11) {
    goto LABEL_8;
  }
LABEL_10:

  return v11;
}

- (id)elementWithIdentifier:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  int64_t v5 = [(SBLayoutState *)self elements];
  id v6 = (id)[v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v14;
    while (2)
    {
      for (uint64_t i = 0; i != v6; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v5);
        }
        int v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        id v10 = [v9 uniqueIdentifier];
        char v11 = [v10 isEqualToString:v4];

        if (v11)
        {
          id v6 = v9;
          goto LABEL_11;
        }
      }
      id v6 = (id)[v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

- (int64_t)interfaceOrientationForElementIdentifier:(id)a3
{
  return [(SBLayoutState *)self _interfaceOrientationForElementIdentifier:a3 unknownAllowed:0];
}

- (int64_t)interfaceOrientationForLayoutRole:(int64_t)a3
{
  id v4 = [(SBLayoutState *)self elementWithRole:a3];
  int64_t v5 = [(SBLayoutState *)self interfaceOrientationForLayoutElement:v4];

  return v5;
}

- (int64_t)interfaceOrientationForLayoutElement:(id)a3 unknownAllowed:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = [a3 uniqueIdentifier];
  int64_t v7 = [(SBLayoutState *)self _interfaceOrientationForElementIdentifier:v6 unknownAllowed:v4];

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_interfaceOrientationByLayoutElementIdentifier, 0);
  objc_storeStrong((id *)&self->_elements, 0);
}

- (id)succinctDescription
{
  v2 = [(SBLayoutState *)self succinctDescriptionBuilder];
  v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  v3 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  BOOL v4 = [(SBLayoutState *)self elements];
  id v5 = (id)objc_msgSend(v3, "appendUnsignedInteger:withName:", objc_msgSend(v4, "count"), @"elements");

  return v3;
}

- (BOOL)isMeaningfullyDifferentFromLayoutState:(id)a3
{
  BOOL v4 = [a3 elements];
  id v5 = objc_msgSend(v4, "bs_filter:", &__block_literal_global_179);

  id v6 = [(SBLayoutState *)self elements];
  int64_t v7 = objc_msgSend(v6, "bs_filter:", &__block_literal_global_179);

  LOBYTE(v6) = [v5 isEqual:v7] ^ 1;
  return (char)v6;
}

BOOL __73__SBLayoutState_SwitcherSupport__isMeaningfullyDifferentFromLayoutState___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  BOOL v3 = [v2 layoutRole] != 3 && objc_msgSend(v2, "layoutRole") != 4;

  return v3;
}

- (id)_initWithLayoutElements:(id)a3 interfaceOrientation:(int64_t)a4 interfaceOrientationByLayoutElement:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v16.receiver = self;
  v16.super_class = (Class)SBLayoutState;
  id v10 = [(SBLayoutState *)&v16 init];
  if (v10)
  {
    uint64_t v11 = [v8 copy];
    elements = v10->_elements;
    v10->_elements = (NSSet *)v11;

    v10->_interfaceOrientation = a4;
    uint64_t v13 = [v9 copy];
    interfaceOrientationByLayoutElementIdentifier = v10->_interfaceOrientationByLayoutElementIdentifier;
    v10->_interfaceOrientationByLayoutElementIdentifier = (NSDictionary *)v13;
  }
  return v10;
}

- (void)setInterfaceOrientationByLayoutElementIdentifier:(id)a3
{
}

- (void)setInterfaceOrientation:(int64_t)a3
{
  self->_interfaceOrientation = a3;
}

- (SBLayoutState)init
{
  BOOL v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3A8];
  id v5 = (objc_class *)objc_opt_class();
  id v6 = NSStringFromClass(v5);
  [v3 raise:v4, @"%@ does not support initialization.", v6 format];

  int64_t v7 = [MEMORY[0x1E4F1CAD0] set];
  id v8 = [(SBLayoutState *)self _initWithLayoutElements:v7 interfaceOrientation:0 interfaceOrientationByLayoutElement:MEMORY[0x1E4F1CC08]];

  return v8;
}

- (int64_t)_defaultInterfaceOrientation
{
  return 1;
}

- (BOOL)isEqual:(id)a3 withRole:(int64_t)a4
{
  id v6 = (SBLayoutState *)a3;
  if (self == v6)
  {
    char v14 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int64_t v7 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"layoutRole == %d", a4);
      id v8 = [(SBLayoutState *)self elements];
      id v9 = [v8 filteredSetUsingPredicate:v7];
      uint64_t v10 = [v9 anyObject];

      uint64_t v11 = [(SBLayoutState *)v6 elements];
      long long v12 = [v11 filteredSetUsingPredicate:v7];
      uint64_t v13 = [v12 anyObject];

      if (v10 | v13)
      {
        char v14 = 0;
        if (v10 && v13)
        {
          long long v15 = [(id)v10 uniqueIdentifier];
          objc_super v16 = [(id)v13 uniqueIdentifier];
          char v14 = [v15 isEqualToString:v16];
        }
      }
      else
      {
        char v14 = 1;
      }
    }
    else
    {
      char v14 = 0;
    }
  }

  return v14;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  BOOL v3 = [(SBLayoutState *)self descriptionBuilderWithMultilinePrefix:a3];
  uint64_t v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4 = a3;
  id v5 = [(SBLayoutState *)self succinctDescriptionBuilder];
  id v6 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  int64_t v7 = [(SBLayoutState *)self interfaceOrientationByLayoutElementIdentifier];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __55__SBLayoutState_descriptionBuilderWithMultilinePrefix___block_invoke;
  v14[3] = &unk_1E6B02D80;
  id v15 = v6;
  id v8 = v6;
  objc_msgSend(v7, "bs_each:", v14);

  if ([(SBLayoutState *)self interfaceOrientation] == 1)
  {
    id v9 = @"UIInterfaceOrientationPortrait";
  }
  else if ([(SBLayoutState *)self interfaceOrientation] == 4)
  {
    id v9 = @"UIInterfaceOrientationLandscapeLeft";
  }
  else if ([(SBLayoutState *)self interfaceOrientation] == 3)
  {
    id v9 = @"UIInterfaceOrientationLandscapeRight";
  }
  else if ([(SBLayoutState *)self interfaceOrientation] == 2)
  {
    id v9 = @"UIInterfaceOrientationPortraitUpsideDown";
  }
  else
  {
    id v9 = 0;
  }
  id v10 = (id)[v5 appendObject:v9 withName:@"interfaceOrientation"];
  [v5 appendDictionarySection:v8 withName:@"interfaceOrientationByLayoutElement" skipIfEmpty:0];
  uint64_t v11 = [(SBLayoutState *)self elements];
  long long v12 = [v11 allObjects];
  [v5 appendArraySection:v12 withName:@"elements" multilinePrefix:v4 skipIfEmpty:1];

  return v5;
}

void __55__SBLayoutState_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v5 = a3;
  id v6 = *(void **)(a1 + 32);
  if ([v5 integerValue] == 1)
  {
    int64_t v7 = @"UIInterfaceOrientationPortrait";
  }
  else if ([v5 integerValue] == 4)
  {
    int64_t v7 = @"UIInterfaceOrientationLandscapeLeft";
  }
  else if ([v5 integerValue] == 3)
  {
    int64_t v7 = @"UIInterfaceOrientationLandscapeRight";
  }
  else if ([v5 integerValue] == 2)
  {
    int64_t v7 = @"UIInterfaceOrientationPortraitUpsideDown";
  }
  else
  {
    int64_t v7 = 0;
  }
  [v6 setObject:v7 forKey:v8];
}

- (unint64_t)hash
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F4F758]);
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v4 = [(SBLayoutState *)self elements];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v14;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = (id)[v3 appendObject:*(void *)(*((void *)&v13 + 1) + 8 * v8++)];
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v6);
  }

  id v10 = (id)objc_msgSend(v3, "appendUnsignedInteger:", -[SBLayoutState interfaceOrientation](self, "interfaceOrientation"));
  unint64_t v11 = [v3 hash];

  return v11;
}

- (NSString)description
{
  return (NSString *)[(SBLayoutState *)self descriptionWithMultilinePrefix:0];
}

- (id)appLayout
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v3 = [(SBLayoutState *)self elementWithRole:1];
  if (v3)
  {
    id v4 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    uint64_t v5 = +[SBDisplayItem displayItemForLayoutElement:v3];
    uint64_t v6 = [NSNumber numberWithInteger:1];
    [v4 setObject:v5 forKeyedSubscript:v6];

    uint64_t v7 = [(SBLayoutState *)self elementWithRole:2];
    v26 = (void *)v7;
    if (v7)
    {
      uint64_t v8 = +[SBDisplayItem displayItemForLayoutElement:v7];
      id v9 = [NSNumber numberWithInteger:2];
      [v4 setObject:v8 forKeyedSubscript:v9];

      uint64_t v10 = 3;
    }
    else
    {
      uint64_t v10 = 1;
    }
    uint64_t v25 = v10;
    long long v12 = [(SBLayoutState *)self elementWithRole:4];
    if (v12)
    {
      long long v13 = +[SBDisplayItem displayItemForLayoutElement:v12];
      long long v14 = [NSNumber numberWithInteger:4];
      [v4 setObject:v13 forKeyedSubscript:v14];

      uint64_t v24 = 1;
    }
    else
    {
      uint64_t v24 = 0;
    }
    long long v15 = objc_opt_new();
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    id v16 = v4;
    uint64_t v17 = [v16 countByEnumeratingWithState:&v27 objects:v31 count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v19 = *(void *)v28;
      do
      {
        for (uint64_t i = 0; i != v18; ++i)
        {
          if (*(void *)v28 != v19) {
            objc_enumerationMutation(v16);
          }
          v21 = [v16 objectForKey:*(void *)(*((void *)&v27 + 1) + 8 * i)];
          v22 = objc_alloc_init(SBDisplayItemLayoutAttributes);
          [v15 setObject:v22 forKey:v21];
        }
        uint64_t v18 = [v16 countByEnumeratingWithState:&v27 objects:v31 count:16];
      }
      while (v18);
    }

    unint64_t v11 = [[SBAppLayout alloc] initWithItemsForLayoutRoles:v16 configuration:v25 itemsToLayoutAttributes:v15 centerConfiguration:v24 environment:1 hidden:0 preferredDisplayOrdinal:0];
  }
  else
  {
    unint64_t v11 = 0;
  }

  return v11;
}

- (id)floatingAppLayout
{
  return 0;
}

@end