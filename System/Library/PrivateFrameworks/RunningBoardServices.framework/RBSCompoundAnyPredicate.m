@interface RBSCompoundAnyPredicate
+ (BOOL)supportsRBSXPCSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)matchesProcess:(id)a3;
- (RBSCompoundAnyPredicate)initWithRBSXPCCoder:(id)a3;
- (id)description;
- (id)processIdentifier;
- (id)processIdentifiers;
- (void)encodeWithRBSXPCCoder:(id)a3;
- (void)initWithPredicates:(void *)a1;
@end

@implementation RBSCompoundAnyPredicate

- (BOOL)matchesProcess:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([(NSSet *)self->_predicates count])
  {
    long long v12 = 0u;
    long long v13 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    v5 = self->_predicates;
    uint64_t v6 = [(NSSet *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
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
          if (objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * i), "matchesProcess:", v4, (void)v10))
          {
            LOBYTE(v6) = 1;
            goto LABEL_12;
          }
        }
        uint64_t v6 = [(NSSet *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
        if (v6) {
          continue;
        }
        break;
      }
    }
LABEL_12:
  }
  else
  {
    LOBYTE(v6) = 0;
  }

  return v6;
}

- (void)initWithPredicates:(void *)a1
{
  id v3 = a2;
  if (a1)
  {
    v7.receiver = a1;
    v7.super_class = (Class)RBSCompoundAnyPredicate;
    a1 = objc_msgSendSuper2(&v7, sel_init);
    if (a1)
    {
      uint64_t v4 = [MEMORY[0x1E4F1CAD0] setWithArray:v3];
      v5 = (void *)a1[1];
      a1[1] = v4;
    }
  }

  return a1;
}

- (id)processIdentifier
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  v2 = self->_predicates;
  uint64_t v3 = [(NSSet *)v2 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    id v5 = 0;
    uint64_t v6 = *(void *)v15;
    while (2)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v15 != v6) {
          objc_enumerationMutation(v2);
        }
        v8 = [*(id *)(*((void *)&v14 + 1) + 8 * i) processIdentifier];
        v9 = v8;
        if (v8)
        {
          if (v5)
          {
            long long v10 = rbs_general_log();
            if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)long long v13 = 0;
              _os_log_impl(&dword_191FE8000, v10, OS_LOG_TYPE_DEFAULT, "Failed to get processIdentifier for predicate with multiple possibilities", v13, 2u);
            }

            long long v11 = 0;
            goto LABEL_17;
          }
          id v5 = v8;
        }
      }
      uint64_t v4 = [(NSSet *)v2 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
  else
  {
    id v5 = 0;
  }

  id v5 = v5;
  long long v11 = v5;
LABEL_17:

  return v11;
}

- (id)processIdentifiers
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  v2 = self->_predicates;
  uint64_t v3 = [(NSSet *)v2 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    id v5 = 0;
    uint64_t v6 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(v2);
        }
        v8 = objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * i), "processIdentifiers", (void)v12);
        v9 = v8;
        if (v8)
        {
          if (v5)
          {
            uint64_t v10 = [v5 setByAddingObjectsFromSet:v8];

            id v5 = (id)v10;
          }
          else
          {
            id v5 = v8;
          }
        }
      }
      uint64_t v4 = [(NSSet *)v2 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v4);
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

+ (BOOL)supportsRBSXPCSecureCoding
{
  return 1;
}

- (void)encodeWithRBSXPCCoder:(id)a3
{
}

- (RBSCompoundAnyPredicate)initWithRBSXPCCoder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)RBSCompoundAnyPredicate;
  id v5 = [(RBSCompoundAnyPredicate *)&v10 init];
  if (v5)
  {
    uint64_t v6 = objc_opt_class();
    uint64_t v7 = [v4 decodeCollectionOfClass:v6 containingClass:objc_opt_class() forKey:@"_predicates"];
    predicates = v5->_predicates;
    v5->_predicates = (NSSet *)v7;
  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (RBSCompoundAnyPredicate *)a3;
  if (self == v4) {
    goto LABEL_11;
  }
  uint64_t v5 = objc_opt_class();
  if (v5 != objc_opt_class()) {
    goto LABEL_3;
  }
  predicates = self->_predicates;
  CFSetRef v8 = (const __CFSet *)v4->_predicates;
  if (predicates == (NSSet *)v8)
  {
LABEL_11:
    char v6 = 1;
    goto LABEL_12;
  }
  if (predicates) {
    BOOL v9 = v8 == 0;
  }
  else {
    BOOL v9 = 1;
  }
  if (!v9)
  {
    CFIndex Count = CFSetGetCount((CFSetRef)predicates);
    if (Count == CFSetGetCount(v8))
    {
      char v6 = [(NSSet *)predicates isEqualToSet:v8];
      goto LABEL_12;
    }
  }
LABEL_3:
  char v6 = 0;
LABEL_12:

  return v6;
}

- (id)description
{
  id v3 = [NSString alloc];
  id v4 = [(id)objc_opt_class() description];
  uint64_t v5 = [(NSSet *)self->_predicates allObjects];
  char v6 = [v5 componentsJoinedByString:@", "];
  uint64_t v7 = (void *)[v3 initWithFormat:@"<%@ [%@]>", v4, v6];

  return v7;
}

- (void).cxx_destruct
{
}

@end