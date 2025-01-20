@interface WFContextualActionFilteringBehavior
+ (BOOL)supportsSecureCoding;
+ (WFContextualActionFilteringBehavior)matchAllFiles;
+ (id)filteringWithMatchingTypes:(id)a3 predicate:(id)a4;
+ (id)filteringWithMatchingTypes:(id)a3 predicate:(id)a4 daemonPredicate:(id)a5;
- (BOOL)isEqual:(id)a3;
- (NSPredicate)daemonPredicate;
- (NSPredicate)inClientPredicate;
- (NSSet)matchingTypes;
- (WFContextualActionFilteringBehavior)initWithCoder:(id)a3;
- (WFContextualActionFilteringBehavior)initWithMatchingTypes:(id)a3 inClientPredicate:(id)a4 daemonPredicate:(id)a5;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation WFContextualActionFilteringBehavior

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_daemonPredicate, 0);
  objc_storeStrong((id *)&self->_inClientPredicate, 0);
  objc_storeStrong((id *)&self->_matchingTypes, 0);
}

- (NSPredicate)daemonPredicate
{
  return self->_daemonPredicate;
}

- (NSPredicate)inClientPredicate
{
  return self->_inClientPredicate;
}

- (NSSet)matchingTypes
{
  return self->_matchingTypes;
}

- (void)encodeWithCoder:(id)a3
{
  matchingTypes = self->_matchingTypes;
  id v5 = a3;
  [v5 encodeObject:matchingTypes forKey:@"matchingTypes"];
  [v5 encodeObject:self->_inClientPredicate forKey:@"inClientPredicate"];
  [v5 encodeObject:self->_daemonPredicate forKey:@"daemonPredicate"];
}

- (WFContextualActionFilteringBehavior)initWithCoder:(id)a3
{
  v4 = (void *)MEMORY[0x1E4F1CAD0];
  id v5 = a3;
  uint64_t v6 = objc_opt_class();
  v7 = objc_msgSend(v4, "setWithObjects:", v6, objc_opt_class(), 0);
  v8 = [v5 decodeObjectOfClasses:v7 forKey:@"matchingTypes"];

  v9 = [v5 decodeObjectOfClass:objc_opt_class() forKey:@"inClientPredicate"];
  v10 = [v5 decodeObjectOfClass:objc_opt_class() forKey:@"daemonPredicate"];

  if (v8)
  {
    self = [(WFContextualActionFilteringBehavior *)self initWithMatchingTypes:v8 inClientPredicate:v9 daemonPredicate:v10];
    v11 = self;
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (WFContextualActionFilteringBehavior *)a3;
  id v5 = v4;
  if (v4 != self)
  {
    uint64_t v6 = v4;
    if (!v6 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      LOBYTE(v12) = 0;
LABEL_27:

      goto LABEL_28;
    }
    v7 = [(WFContextualActionFilteringBehavior *)v6 matchingTypes];
    v8 = [(WFContextualActionFilteringBehavior *)self matchingTypes];
    id v9 = v7;
    id v10 = v8;
    v11 = v10;
    if (v9 == v10)
    {
    }
    else
    {
      LOBYTE(v12) = 0;
      v13 = v10;
      id v14 = v9;
      if (!v9 || !v10) {
        goto LABEL_25;
      }
      int v15 = [v9 isEqualToSet:v10];

      if (!v15)
      {
        LOBYTE(v12) = 0;
LABEL_26:

        goto LABEL_27;
      }
    }
    v16 = [(WFContextualActionFilteringBehavior *)v6 inClientPredicate];
    v17 = [(WFContextualActionFilteringBehavior *)self inClientPredicate];
    id v14 = v16;
    id v18 = v17;
    v13 = v18;
    if (v14 == v18)
    {
    }
    else
    {
      LOBYTE(v12) = 0;
      v19 = v18;
      id v20 = v14;
      if (!v14 || !v18)
      {
LABEL_24:

LABEL_25:
        goto LABEL_26;
      }
      int v12 = [v14 isEqual:v18];

      if (!v12) {
        goto LABEL_25;
      }
    }
    v21 = [(WFContextualActionFilteringBehavior *)v6 daemonPredicate];
    v22 = [(WFContextualActionFilteringBehavior *)self daemonPredicate];
    id v20 = v21;
    id v23 = v22;
    v19 = v23;
    if (v20 == v23)
    {
      LOBYTE(v12) = 1;
    }
    else
    {
      LOBYTE(v12) = 0;
      if (v20 && v23) {
        LOBYTE(v12) = [v20 isEqual:v23];
      }
    }

    goto LABEL_24;
  }
  LOBYTE(v12) = 1;
LABEL_28:

  return v12;
}

- (unint64_t)hash
{
  v3 = objc_opt_new();
  v4 = [(WFContextualActionFilteringBehavior *)self matchingTypes];

  if (v4)
  {
    id v5 = [(WFContextualActionFilteringBehavior *)self matchingTypes];
    id v6 = (id)[v3 combine:v5];
  }
  v7 = [(WFContextualActionFilteringBehavior *)self inClientPredicate];

  if (v7)
  {
    v8 = [(WFContextualActionFilteringBehavior *)self inClientPredicate];
    id v9 = (id)[v3 combine:v8];
  }
  id v10 = [(WFContextualActionFilteringBehavior *)self daemonPredicate];

  if (v10)
  {
    v11 = [(WFContextualActionFilteringBehavior *)self daemonPredicate];
    id v12 = (id)[v3 combine:v11];
  }
  unint64_t v13 = [v3 finalize];

  return v13;
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  id v6 = [(WFContextualActionFilteringBehavior *)self matchingTypes];
  v7 = [(WFContextualActionFilteringBehavior *)self inClientPredicate];
  v8 = [(WFContextualActionFilteringBehavior *)self daemonPredicate];
  id v9 = [v3 stringWithFormat:@"<%@ %p types=%@, files predicate=%@, thorough filtering predicate=%@>", v5, self, v6, v7, v8];

  return v9;
}

- (WFContextualActionFilteringBehavior)initWithMatchingTypes:(id)a3 inClientPredicate:(id)a4 daemonPredicate:(id)a5
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (!v10)
  {
    v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:a2, self, @"WFContextualActionFilteringBehavior.m", 17, @"Invalid parameter not satisfying: %@", @"matchingTypes" object file lineNumber description];
  }
  v18.receiver = self;
  v18.super_class = (Class)WFContextualActionFilteringBehavior;
  unint64_t v13 = [(WFContextualActionFilteringBehavior *)&v18 init];
  id v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_matchingTypes, a3);
    objc_storeStrong((id *)&v14->_inClientPredicate, a4);
    objc_storeStrong((id *)&v14->_daemonPredicate, a5);
    int v15 = v14;
  }

  return v14;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)filteringWithMatchingTypes:(id)a3 predicate:(id)a4 daemonPredicate:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (!v11)
  {
    id v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2, a1, @"WFContextualActionFilteringBehavior.m", 38, @"Invalid parameter not satisfying: %@", @"daemonPredicate" object file lineNumber description];
  }
  id v12 = (void *)[objc_alloc((Class)a1) initWithMatchingTypes:v9 inClientPredicate:v10 daemonPredicate:v11];

  return v12;
}

+ (id)filteringWithMatchingTypes:(id)a3 predicate:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = (void *)[objc_alloc((Class)a1) initWithMatchingTypes:v7 inClientPredicate:v6 daemonPredicate:0];

  return v8;
}

+ (WFContextualActionFilteringBehavior)matchAllFiles
{
  id v2 = objc_alloc((Class)a1);
  v3 = [MEMORY[0x1E4F1CAD0] setWithObject:*MEMORY[0x1E4F44408]];
  v4 = (void *)[v2 initWithMatchingTypes:v3 inClientPredicate:0 daemonPredicate:0];

  return (WFContextualActionFilteringBehavior *)v4;
}

@end