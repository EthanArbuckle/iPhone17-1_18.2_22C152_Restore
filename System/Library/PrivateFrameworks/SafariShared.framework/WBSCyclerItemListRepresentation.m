@interface WBSCyclerItemListRepresentation
+ (BOOL)supportsSecureCoding;
- (BOOL)_tryToDeleteDescendant:(id)a3;
- (BOOL)containsChild:(id)a3;
- (BOOL)containsChildPassingTest:(id)a3;
- (BOOL)containsDescendant:(id)a3;
- (BOOL)isEquivalent:(id)a3;
- (WBSCyclerItemListRepresentation)initWithCoder:(id)a3;
- (WBSCyclerItemListRepresentation)initWithTitle:(id)a3 uniqueIdentifier:(id)a4;
- (id)allDescendantsPassingTest:(id)a3;
- (id)childAtIndex:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)descendantWithUniqueIdentifier:(id)a3;
- (id)pairsOfItemsWithDifferingExtraAttributesComparedTo:(id)a3;
- (id)randomChildPassingTest:(id)a3;
- (id)randomDescendant;
- (id)randomDescendantPassingTest:(id)a3;
- (id)randomListDescendant;
- (id)randomProfileDescendant;
- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5;
- (unint64_t)numberOfChildren;
- (void)addChild:(id)a3;
- (void)deleteAllChildren;
- (void)deleteChild:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)insertChild:(id)a3 atIndex:(unint64_t)a4;
@end

@implementation WBSCyclerItemListRepresentation

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (WBSCyclerItemListRepresentation)initWithTitle:(id)a3 uniqueIdentifier:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)WBSCyclerItemListRepresentation;
  v4 = [(WBSCyclerItemRepresentation *)&v9 initWithTitle:a3 uniqueIdentifier:a4];
  if (v4)
  {
    uint64_t v5 = [MEMORY[0x1E4F1CA48] array];
    children = v4->_children;
    v4->_children = (NSMutableArray *)v5;

    v7 = v4;
  }

  return v4;
}

- (WBSCyclerItemListRepresentation)initWithCoder:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)WBSCyclerItemListRepresentation;
  uint64_t v5 = [(WBSCyclerItemRepresentation *)&v16 initWithCoder:v4];
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = objc_opt_class();
    uint64_t v9 = objc_opt_class();
    v10 = objc_msgSend(v6, "setWithObjects:", v7, v8, v9, objc_opt_class(), 0);
    v11 = [v4 decodeObjectOfClasses:v10 forKey:@"Children"];
    uint64_t v12 = [v11 mutableCopy];
    children = v5->_children;
    v5->_children = (NSMutableArray *)v12;

    v14 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)WBSCyclerItemListRepresentation;
  id v4 = a3;
  [(WBSCyclerItemRepresentation *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_children, @"Children", v5.receiver, v5.super_class);
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = [WBSCyclerItemListRepresentation alloc];
  objc_super v5 = [(WBSCyclerItemRepresentation *)self title];
  v6 = [(WBSCyclerItemRepresentation *)self uniqueIdentifier];
  uint64_t v7 = [(WBSCyclerItemListRepresentation *)v4 initWithTitle:v5 uniqueIdentifier:v6];

  uint64_t v8 = [(WBSCyclerItemRepresentation *)self extraAttributes];
  [(WBSCyclerItemRepresentation *)v7 setExtraAttributes:v8];

  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v9 = self->_children;
  uint64_t v10 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v17;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v17 != v12) {
          objc_enumerationMutation(v9);
        }
        v14 = objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * v13), "copy", (void)v16);
        [(WBSCyclerItemListRepresentation *)v7 addChild:v14];

        ++v13;
      }
      while (v11 != v13);
      uint64_t v11 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v11);
  }

  return v7;
}

- (BOOL)isEquivalent:(id)a3
{
  id v4 = (id *)a3;
  v13.receiver = self;
  v13.super_class = (Class)WBSCyclerItemListRepresentation;
  if ([(WBSCyclerItemRepresentation *)&v13 isEquivalent:v4]
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v5 = v4[5];
    unint64_t v6 = [v5 count];
    if (v6 == [(NSMutableArray *)self->_children count])
    {
      if (v6)
      {
        BOOL v7 = 0;
        for (i = 0; i != v6; BOOL v7 = i >= v6)
        {
          uint64_t v9 = [v5 objectAtIndexedSubscript:i];
          uint64_t v10 = [(NSMutableArray *)self->_children objectAtIndexedSubscript:i];
          char v11 = [v9 isEquivalent:v10];

          if ((v11 & 1) == 0) {
            break;
          }
          ++i;
        }
      }
      else
      {
        BOOL v7 = 1;
      }
    }
    else
    {
      BOOL v7 = 0;
    }
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (id)pairsOfItemsWithDifferingExtraAttributesComparedTo:(id)a3
{
  id v4 = (id *)a3;
  id v5 = v4[5];
  uint64_t v6 = [v5 count];
  v14.receiver = self;
  v14.super_class = (Class)WBSCyclerItemListRepresentation;
  BOOL v7 = [(WBSCyclerItemRepresentation *)&v14 pairsOfItemsWithDifferingExtraAttributesComparedTo:v4];
  uint64_t v8 = (void *)[v7 mutableCopy];

  if (v6)
  {
    for (uint64_t i = 0; i != v6; ++i)
    {
      uint64_t v10 = [(NSMutableArray *)self->_children objectAtIndexedSubscript:i];
      char v11 = [v5 objectAtIndexedSubscript:i];
      uint64_t v12 = [v10 pairsOfItemsWithDifferingExtraAttributesComparedTo:v11];
      [v8 addObjectsFromArray:v12];
    }
  }

  return v8;
}

- (unint64_t)numberOfChildren
{
  return [(NSMutableArray *)self->_children count];
}

- (void)addChild:(id)a3
{
}

- (void)insertChild:(id)a3 atIndex:(unint64_t)a4
{
}

- (void)deleteChild:(id)a3
{
}

- (void)deleteAllChildren
{
}

- (BOOL)containsChild:(id)a3
{
  return [(NSMutableArray *)self->_children containsObject:a3];
}

- (BOOL)containsChildPassingTest:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = (uint64_t (**)(id, void))a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v5 = self->_children;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v11;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v5);
        }
        if (v4[2](v4, *(void *)(*((void *)&v10 + 1) + 8 * i)))
        {
          LOBYTE(v6) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

- (BOOL)containsDescendant:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([(WBSCyclerItemListRepresentation *)self containsChild:v4])
  {
    LOBYTE(v5) = 1;
  }
  else
  {
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    uint64_t v6 = self->_children;
    uint64_t v5 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v5)
    {
      uint64_t v7 = *(void *)v12;
      while (2)
      {
        for (uint64_t i = 0; i != v5; ++i)
        {
          if (*(void *)v12 != v7) {
            objc_enumerationMutation(v6);
          }
          uint64_t v9 = *(void **)(*((void *)&v11 + 1) + 8 * i);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0
            && (objc_msgSend(v9, "containsDescendant:", v4, (void)v11) & 1) != 0)
          {
            LOBYTE(v5) = 1;
            goto LABEL_14;
          }
        }
        uint64_t v5 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
        if (v5) {
          continue;
        }
        break;
      }
    }
LABEL_14:
  }
  return v5;
}

- (id)childAtIndex:(unint64_t)a3
{
  if ([(WBSCyclerItemListRepresentation *)self numberOfChildren] <= a3)
  {
    uint64_t v5 = 0;
  }
  else
  {
    uint64_t v5 = [(NSMutableArray *)self->_children objectAtIndex:a3];
  }
  return v5;
}

- (id)descendantWithUniqueIdentifier:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(WBSCyclerItemRepresentation *)self uniqueIdentifier];
  int v6 = [v5 isEqualToString:v4];

  if (v6)
  {
    uint64_t v7 = self;
  }
  else
  {
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    uint64_t v8 = self->_children;
    uint64_t v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v19;
      while (2)
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v19 != v11) {
            objc_enumerationMutation(v8);
          }
          long long v13 = *(void **)(*((void *)&v18 + 1) + 8 * i);
          long long v14 = objc_msgSend(v13, "uniqueIdentifier", (void)v18);
          int v15 = [v14 isEqualToString:v4];

          if (v15)
          {
            uint64_t v16 = v13;
LABEL_15:
            uint64_t v7 = v16;

            goto LABEL_16;
          }
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            uint64_t v16 = [v13 descendantWithUniqueIdentifier:v4];
            if (v16) {
              goto LABEL_15;
            }
          }
        }
        uint64_t v10 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
        if (v10) {
          continue;
        }
        break;
      }
    }

    uint64_t v7 = 0;
  }
LABEL_16:

  return v7;
}

- (id)randomDescendantPassingTest:(id)a3
{
  v3 = [(WBSCyclerItemListRepresentation *)self allDescendantsPassingTest:a3];
  if ([v3 count])
  {
    id v4 = +[WBSCyclerRandomnessUtilities randomElementOfArray:v3];
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- (id)randomChildPassingTest:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = (uint64_t (**)(id, void *))a3;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v5 = self->_children;
  id v6 = (id)[(NSMutableArray *)v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v12;
    while (2)
    {
      for (uint64_t i = 0; i != v6; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v5);
        }
        uint64_t v9 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        if (v4[2](v4, v9))
        {
          id v6 = v9;
          goto LABEL_11;
        }
      }
      id v6 = (id)[(NSMutableArray *)v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

- (id)allDescendantsPassingTest:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = (unsigned int (**)(id, WBSCyclerItemListRepresentation *))a3;
  uint64_t v5 = [MEMORY[0x1E4F1CA48] array];
  if (v4[2](v4, self)) {
    [v5 addObject:self];
  }
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v6 = self;
  uint64_t v7 = [(WBSCyclerItemListRepresentation *)v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        long long v11 = *(WBSCyclerItemListRepresentation **)(*((void *)&v14 + 1) + 8 * i);
        if (v4[2](v4, v11)) {
          objc_msgSend(v5, "addObject:", v11, (void)v14);
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          long long v12 = [(WBSCyclerItemListRepresentation *)v11 allDescendantsPassingTest:v4];
          [v5 addObjectsFromArray:v12];
        }
      }
      uint64_t v8 = [(WBSCyclerItemListRepresentation *)v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }

  return v5;
}

- (id)randomDescendant
{
  return [(WBSCyclerItemListRepresentation *)self randomDescendantPassingTest:&__block_literal_global_39];
}

uint64_t __51__WBSCyclerItemListRepresentation_randomDescendant__block_invoke()
{
  return 1;
}

- (id)randomListDescendant
{
  return [(WBSCyclerItemListRepresentation *)self randomDescendantPassingTest:&__block_literal_global_18];
}

uint64_t __55__WBSCyclerItemListRepresentation_randomListDescendant__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (id)randomProfileDescendant
{
  return [(WBSCyclerItemListRepresentation *)self randomChildPassingTest:&__block_literal_global_20];
}

uint64_t __58__WBSCyclerItemListRepresentation_randomProfileDescendant__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  return [(NSMutableArray *)self->_children countByEnumeratingWithState:a3 objects:a4 count:a5];
}

- (BOOL)_tryToDeleteDescendant:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([(WBSCyclerItemListRepresentation *)self containsChild:v4])
  {
    [(WBSCyclerItemListRepresentation *)self deleteChild:v4];
LABEL_14:
    BOOL v11 = 1;
  }
  else
  {
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    uint64_t v5 = self->_children;
    uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v14;
      while (2)
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v14 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v10 = *(void **)(*((void *)&v13 + 1) + 8 * i);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0
            && (objc_msgSend(v10, "_tryToDeleteDescendant:", v4, (void)v13) & 1) != 0)
          {

            goto LABEL_14;
          }
        }
        uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
        if (v7) {
          continue;
        }
        break;
      }
    }

    BOOL v11 = 0;
  }

  return v11;
}

- (void).cxx_destruct
{
}

@end