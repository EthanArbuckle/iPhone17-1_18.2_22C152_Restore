@interface NSManagedObject(MTAdditions)
+ (id)aggregateOperation:()MTAdditions attribute:predicate:managedObjectContext:;
- (id)dictionaryRepresentationWithNullAttributeValueProvider:()MTAdditions;
- (id)dictionaryRepresentationWithObjectId;
- (uint64_t)dictionaryRepresentation;
@end

@implementation NSManagedObject(MTAdditions)

- (uint64_t)dictionaryRepresentation
{
  return [a1 dictionaryRepresentationWithNullAttributeValueProvider:&__block_literal_global_14];
}

- (id)dictionaryRepresentationWithNullAttributeValueProvider:()MTAdditions
{
  id v4 = a3;
  v5 = objc_opt_new();
  v6 = [a1 entity];
  v7 = [v6 attributesByName];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __87__NSManagedObject_MTAdditions__dictionaryRepresentationWithNullAttributeValueProvider___block_invoke;
  v13[3] = &unk_1E5E63000;
  v13[4] = a1;
  id v15 = v4;
  id v8 = v5;
  id v14 = v8;
  id v9 = v4;
  [v7 enumerateKeysAndObjectsUsingBlock:v13];

  v10 = v14;
  id v11 = v8;

  return v11;
}

- (id)dictionaryRepresentationWithObjectId
{
  v2 = [a1 dictionaryRepresentation];
  v3 = [a1 objectID];
  [v2 setObject:v3 forKey:@"objectID"];

  return v2;
}

+ (id)aggregateOperation:()MTAdditions attribute:predicate:managedObjectContext:
{
  id v9 = a5;
  v10 = (void *)MEMORY[0x1E4F28C68];
  id v11 = (void *)MEMORY[0x1E4F1C978];
  id v12 = a6;
  id v13 = a3;
  id v14 = [v10 expressionForKeyPath:a4];
  id v15 = [v11 arrayWithObject:v14];
  v16 = [v10 expressionForFunction:v13 arguments:v15];

  id v17 = objc_alloc_init(MEMORY[0x1E4F1C0B8]);
  [v17 setName:@"result"];
  [v17 setExpression:v16];
  [v17 setExpressionResultType:300];
  v18 = [MEMORY[0x1E4F1C978] arrayWithObject:v17];
  id v19 = objc_alloc_init(MEMORY[0x1E4F1C0D0]);
  [v19 setPropertiesToFetch:v18];
  [v19 setResultType:2];
  if (v9) {
    [v19 setPredicate:v9];
  }
  v20 = (void *)MEMORY[0x1E4F1C0A8];
  v21 = (objc_class *)objc_opt_class();
  v22 = NSStringFromClass(v21);
  v23 = [v20 entityForName:v22 inManagedObjectContext:v12];

  [v19 setEntity:v23];
  v24 = [v12 executeFetchRequest:v19 error:0];

  v25 = [v24 lastObject];
  v26 = [v25 objectForKey:@"result"];

  return v26;
}

@end