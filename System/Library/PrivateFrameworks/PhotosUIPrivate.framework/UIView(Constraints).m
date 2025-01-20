@interface UIView(Constraints)
- (BOOL)pu_hasConstraintForKey:()Constraints;
- (id)_pu_associatedConstraints;
- (id)pu_constraintsForKey:()Constraints;
- (void)pu_addConstraint:()Constraints forKey:;
- (void)pu_addConstraints:()Constraints forKey:;
- (void)pu_clearAllConstraintsForKey:()Constraints;
- (void)pu_removeAllConstraintsForKey:()Constraints;
@end

@implementation UIView(Constraints)

- (id)pu_constraintsForKey:()Constraints
{
  id v4 = a3;
  v5 = objc_msgSend(a1, "_pu_associatedConstraints");
  v6 = [v5 objectForKeyedSubscript:v4];

  return v6;
}

- (void)pu_clearAllConstraintsForKey:()Constraints
{
  id v4 = a3;
  objc_msgSend(a1, "_pu_associatedConstraints");
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [v5 removeObjectForKey:v4];
}

- (void)pu_removeAllConstraintsForKey:()Constraints
{
  id v6 = a3;
  id v4 = objc_msgSend(a1, "_pu_associatedConstraints");
  id v5 = [v4 objectForKeyedSubscript:v6];
  if (v5)
  {
    [a1 removeConstraints:v5];
    [v4 removeObjectForKey:v6];
  }
}

- (void)pu_addConstraints:()Constraints forKey:
{
  id v9 = a3;
  id v6 = a4;
  if ([v9 count])
  {
    v7 = objc_msgSend(a1, "_pu_associatedConstraints");
    id v8 = [v7 objectForKeyedSubscript:v6];
    if (!v8)
    {
      id v8 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      [v7 setObject:v8 forKeyedSubscript:v6];
    }
    [v8 addObjectsFromArray:v9];
    [a1 addConstraints:v9];
  }
}

- (void)pu_addConstraint:()Constraints forKey:
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  v10 = a3;
  id v6 = (void *)MEMORY[0x1E4F1C978];
  id v7 = a4;
  id v8 = a3;
  id v9 = [v6 arrayWithObjects:&v10 count:1];

  objc_msgSend(a1, "pu_addConstraints:forKey:", v9, v7, v10, v11);
}

- (BOOL)pu_hasConstraintForKey:()Constraints
{
  id v4 = a3;
  id v5 = objc_msgSend(a1, "_pu_associatedConstraints");
  id v6 = [v5 objectForKeyedSubscript:v4];

  if (v6) {
    BOOL v7 = [v6 count] != 0;
  }
  else {
    BOOL v7 = 0;
  }

  return v7;
}

- (id)_pu_associatedConstraints
{
  objc_getAssociatedObject(a1, @"PUConstraintDictionaryKey");
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
    id v2 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    objc_setAssociatedObject(a1, @"PUConstraintDictionaryKey", v2, (void *)1);
  }
  return v2;
}

@end