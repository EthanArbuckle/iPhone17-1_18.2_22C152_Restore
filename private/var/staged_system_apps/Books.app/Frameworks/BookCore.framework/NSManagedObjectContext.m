@interface NSManagedObjectContext
+ (id)mergePredicate:(id)a3 andPredicate:(id)a4;
- (id)copyEntityPropertiesArray:(id)a3 fromEntityName:(id)a4 withPredicate:(id)a5 sortBy:(id)a6 ascending:(BOOL)a7;
- (id)copyEntityPropertiesArray:(id)a3 fromEntityName:(id)a4 withPredicate:(id)a5 sortBy:(id)a6 ascending:(BOOL)a7 distinct:(BOOL)a8;
- (id)copyEntityProperty:(id)a3 fromEntityName:(id)a4 withPredicate:(id)a5;
- (id)copyEntityPropertyArray:(id)a3 fromEntityName:(id)a4 withPredicate:(id)a5 sortBy:(id)a6 ascending:(BOOL)a7;
- (id)entity:(id)a3 withPredicate:(id)a4;
- (id)entity:(id)a3 withPredicate:(id)a4 sortBy:(id)a5 ascending:(BOOL)a6 fetchLimit:(unint64_t)a7;
- (id)entity:(id)a3 withPredicate:(id)a4 sortBy:(id)a5 ascending:(BOOL)a6 fetchLimit:(unint64_t)a7 prefetchRelationships:(id)a8;
- (id)entity:(id)a3 withPredicate:(id)a4 sortDescriptors:(id)a5 fetchLimit:(unint64_t)a6 prefetchRelationships:(id)a7;
- (id)newByClass:(Class)a3;
- (id)objectIDsWithPredicate:(id)a3 forEntity:(id)a4;
- (id)unbatchedObjectsWithPredicate:(id)a3 forEntity:(id)a4;
- (unint64_t)countEntity:(id)a3 withPredicate:(id)a4;
- (void)batchDeleteEntity:(id)a3 matching:(id)a4 prefetchRelationships:(id)a5;
- (void)im_performSafeAccess:(id)a3;
@end

@implementation NSManagedObjectContext

+ (id)mergePredicate:(id)a3 andPredicate:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = v6;
  if (v5 && v6)
  {
    id v8 = [objc_alloc((Class)NSArray) initWithObjects:v5, v6, 0];
    id v9 = +[NSCompoundPredicate andPredicateWithSubpredicates:v8];
  }
  else
  {
    if (v5) {
      v10 = v5;
    }
    else {
      v10 = v6;
    }
    id v9 = v10;
  }

  return v9;
}

- (unint64_t)countEntity:(id)a3 withPredicate:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = objc_alloc_init((Class)NSFetchRequest);
  id v9 = +[NSEntityDescription entityForName:v7 inManagedObjectContext:self];

  [v8 setEntity:v9];
  [v8 setPredicate:v6];

  id v14 = 0;
  unint64_t v10 = [(NSManagedObjectContext *)self countForFetchRequest:v8 error:&v14];
  id v11 = v14;
  v12 = v11;
  if (v11) {
    [v11 logRecursively];
  }
  if (v10 == 0x7FFFFFFFFFFFFFFFLL) {
    unint64_t v10 = 0;
  }

  return v10;
}

- (id)copyEntityPropertiesArray:(id)a3 fromEntityName:(id)a4 withPredicate:(id)a5 sortBy:(id)a6 ascending:(BOOL)a7 distinct:(BOOL)a8
{
  BOOL v8 = a8;
  BOOL v9 = a7;
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = objc_alloc_init((Class)NSFetchRequest);
  v19 = +[NSEntityDescription entityForName:v15 inManagedObjectContext:self];
  [v18 setEntity:v19];
  if ([v14 count] != (char *)&def_7D91C + 1) {
    goto LABEL_4;
  }
  [v14 objectAtIndex:0];
  id v36 = v14;
  v20 = v19;
  id v21 = v17;
  v22 = self;
  BOOL v23 = v8;
  id v24 = v16;
  id v25 = v15;
  v27 = BOOL v26 = v9;
  unsigned int v28 = [v27 isEqualToString:@"objectID"];

  BOOL v9 = v26;
  id v15 = v25;
  id v16 = v24;
  BOOL v8 = v23;
  self = v22;
  id v17 = v21;
  v19 = v20;
  id v14 = v36;
  if (v28)
  {
    [v18 setResultType:1];
  }
  else
  {
LABEL_4:
    [v18 setPropertiesToFetch:v14];
    [v18 setResultType:2];
    if (v8) {
      [v18 setReturnsDistinctResults:1];
    }
  }
  [v18 setPredicate:v16];
  if (v17)
  {
    id v29 = [objc_alloc((Class)NSSortDescriptor) initWithKey:v17 ascending:v9];
    id v30 = [objc_alloc((Class)NSArray) initWithObjects:v29, 0];
    [v18 setSortDescriptors:v30];
  }
  id v38 = 0;
  v31 = [(NSManagedObjectContext *)self executeFetchRequest:v18 error:&v38];
  id v32 = v38;
  v33 = v32;
  if (v32) {
    [v32 logRecursively];
  }

  id v34 = [v31 copy];

  return v34;
}

- (id)copyEntityPropertiesArray:(id)a3 fromEntityName:(id)a4 withPredicate:(id)a5 sortBy:(id)a6 ascending:(BOOL)a7
{
  return [(NSManagedObjectContext *)self copyEntityPropertiesArray:a3 fromEntityName:a4 withPredicate:a5 sortBy:a6 ascending:a7 distinct:0];
}

- (id)copyEntityPropertyArray:(id)a3 fromEntityName:(id)a4 withPredicate:(id)a5 sortBy:(id)a6 ascending:(BOOL)a7
{
  BOOL v7 = a7;
  id v12 = a6;
  id v13 = a5;
  id v14 = a4;
  id v15 = +[NSArray arrayWithObject:a3];
  id v16 = [(NSManagedObjectContext *)self copyEntityPropertiesArray:v15 fromEntityName:v14 withPredicate:v13 sortBy:v12 ascending:v7];

  return v16;
}

- (id)copyEntityProperty:(id)a3 fromEntityName:(id)a4 withPredicate:(id)a5
{
  id v5 = [(NSManagedObjectContext *)self copyEntityPropertyArray:a3 fromEntityName:a4 withPredicate:a5 sortBy:0 ascending:0];
  if ([v5 count] == (char *)&def_7D91C + 1 || (unint64_t)objc_msgSend(v5, "count") >= 2)
  {
    id v6 = [v5 lastObject];
  }
  else
  {
    id v6 = 0;
  }
  id v7 = [v6 copy];

  return v7;
}

- (id)newByClass:(Class)a3
{
  v4 = NSStringFromClass(a3);
  id v5 = +[NSEntityDescription insertNewObjectForEntityForName:v4 inManagedObjectContext:self];

  return v5;
}

- (id)objectIDsWithPredicate:(id)a3 forEntity:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v9 = objc_alloc_init((Class)NSFetchRequest);
  unint64_t v10 = +[NSEntityDescription entityForName:v7 inManagedObjectContext:self];
  [v9 setEntity:v10];

  [v9 setPredicate:v6];
  [v9 setResultType:1];
  [v9 setIncludesPropertyValues:0];
  id v15 = 0;
  id v11 = [(NSManagedObjectContext *)self executeFetchRequest:v9 error:&v15];
  id v12 = v15;
  id v13 = v12;
  if (v12) {
    [v12 logRecursively];
  }

  return v11;
}

- (id)unbatchedObjectsWithPredicate:(id)a3 forEntity:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v9 = objc_alloc_init((Class)NSFetchRequest);
  unint64_t v10 = +[NSEntityDescription entityForName:v7 inManagedObjectContext:self];
  [v9 setEntity:v10];

  [v9 setPredicate:v6];
  [v9 setIncludesPropertyValues:1];
  id v15 = 0;
  id v11 = [(NSManagedObjectContext *)self executeFetchRequest:v9 error:&v15];
  id v12 = v15;
  id v13 = v12;
  if (v12) {
    [v12 logRecursively];
  }

  return v11;
}

- (id)entity:(id)a3 withPredicate:(id)a4 sortDescriptors:(id)a5 fetchLimit:(unint64_t)a6 prefetchRelationships:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a7;
  id v17 = objc_alloc_init((Class)NSFetchRequest);
  id v18 = +[NSEntityDescription entityForName:v12 inManagedObjectContext:self];
  [v17 setEntity:v18];

  [v17 setPredicate:v13];
  [v17 setSortDescriptors:v14];
  if ([v15 count]) {
    [v17 setRelationshipKeyPathsForPrefetching:v15];
  }
  if (a6)
  {
    if (a6 <= 0xA) {
      [v17 setReturnsObjectsAsFaults:0];
    }
    [v17 setFetchLimit:a6];
  }
  else
  {
    [v17 setFetchBatchSize:100];
  }
  id v23 = 0;
  v19 = [(NSManagedObjectContext *)self executeFetchRequest:v17 error:&v23];
  id v20 = v23;
  id v21 = v20;
  if (v20) {
    [v20 logRecursively];
  }

  return v19;
}

- (id)entity:(id)a3 withPredicate:(id)a4 sortBy:(id)a5 ascending:(BOOL)a6 fetchLimit:(unint64_t)a7 prefetchRelationships:(id)a8
{
  BOOL v10 = a6;
  id v14 = a3;
  id v15 = a4;
  id v16 = a8;
  if (a5)
  {
    id v17 = a5;
    id v18 = [objc_alloc((Class)NSSortDescriptor) initWithKey:v17 ascending:v10];

    id v19 = [objc_alloc((Class)NSArray) initWithObjects:v18];
  }
  else
  {
    id v19 = 0;
  }
  id v20 = [(NSManagedObjectContext *)self entity:v14 withPredicate:v15 sortDescriptors:v19 fetchLimit:a7 prefetchRelationships:v16];

  return v20;
}

- (id)entity:(id)a3 withPredicate:(id)a4 sortBy:(id)a5 ascending:(BOOL)a6 fetchLimit:(unint64_t)a7
{
  return [(NSManagedObjectContext *)self entity:a3 withPredicate:a4 sortBy:a5 ascending:a6 fetchLimit:a7 prefetchRelationships:0];
}

- (id)entity:(id)a3 withPredicate:(id)a4
{
  return [(NSManagedObjectContext *)self entity:a3 withPredicate:a4 sortBy:0 ascending:0 fetchLimit:0];
}

- (void)im_performSafeAccess:(id)a3
{
  v4 = (void (**)(void))a3;
  [(NSManagedObjectContext *)self im_pushSafeAccessState];
  v4[2]();
  [(NSManagedObjectContext *)self im_popSafeAccessState];
}

- (void)batchDeleteEntity:(id)a3 matching:(id)a4 prefetchRelationships:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  [(NSManagedObjectContext *)self unbatchedObjectsWithPredicate:v9 forEntity:v8];
  uint64_t v17 = 0;
  id v18 = &v17;
  uint64_t v19 = 0x2020000000;
  int v20 = 0;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_5F10C;
  v13[3] = &unk_2C4720;
  id v12 = (id)objc_claimAutoreleasedReturnValue();
  id v14 = v12;
  id v15 = self;
  id v16 = &v17;
  [(NSManagedObjectContext *)self im_performSafeAccess:v13];
  if (*((_DWORD *)v18 + 6)) {
    [(NSManagedObjectContext *)self save:0];
  }

  _Block_object_dispose(&v17, 8);
}

@end