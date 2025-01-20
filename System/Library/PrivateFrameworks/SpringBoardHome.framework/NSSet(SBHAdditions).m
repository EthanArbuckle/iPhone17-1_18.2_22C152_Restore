@interface NSSet(SBHAdditions)
- (id)sbh_diffWithSet:()SBHAdditions;
- (id)sbh_map:()SBHAdditions;
@end

@implementation NSSet(SBHAdditions)

- (id)sbh_diffWithSet:()SBHAdditions
{
  return +[SBHSetDiff diffFromSet:a1 toSet:a3];
}

- (id)sbh_map:()SBHAdditions
{
  id v4 = a3;
  v5 = objc_opt_new();
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __31__NSSet_SBHAdditions__sbh_map___block_invoke;
  v11[3] = &unk_1E6AB5840;
  id v6 = v5;
  id v12 = v6;
  id v13 = v4;
  id v7 = v4;
  [a1 enumerateObjectsUsingBlock:v11];
  v8 = v13;
  id v9 = v6;

  return v9;
}

@end