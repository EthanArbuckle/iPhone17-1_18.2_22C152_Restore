@interface MOResourceMO
+ (id)fetchRequest;
+ (id)managedObjectWithObject:(id)a3 inManagedObjectContext:(id)a4;
- (id)clonedObjectWithContext:(id)a3;
- (id)description;
- (id)getDedupeKeyError:(id *)a3;
@end

@implementation MOResourceMO

+ (id)managedObjectWithObject:(id)a3 inManagedObjectContext:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = [[MOResourceMO alloc] initWithContext:v5];

  v8 = [v6 identifier];
  [(MOResourceMO *)v7 setIdentifier:v8];

  [v6 value];
  -[MOResourceMO setValue:](v7, "setValue:");
  v9 = [v6 name];
  [(MOResourceMO *)v7 setName:v9];

  v10 = [v6 assets];
  [(MOResourceMO *)v7 setAssets:v10];

  v11 = [v6 data];
  [(MOResourceMO *)v7 setData:v11];

  -[MOResourceMO setType:](v7, "setType:", [v6 type]);
  [v6 priorityScore];
  -[MOResourceMO setPriorityScore:](v7, "setPriorityScore:");
  v12 = [v6 photoCurationScore];
  [(MOResourceMO *)v7 setPhotoCurationScore:v12];

  -[MOResourceMO setPhotoFaceCount:](v7, "setPhotoFaceCount:", [v6 photoFaceCount]);
  -[MOResourceMO setPhotoAssetMediaType:](v7, "setPhotoAssetMediaType:", [v6 photoAssetMediaType]);
  -[MOResourceMO setSourceEventAccessType:](v7, "setSourceEventAccessType:", [v6 sourceEventAccessType]);
  v13 = [v6 sourceEventIdentifier];

  [(MOResourceMO *)v7 setSourceEventIdentifier:v13];

  return v7;
}

- (id)clonedObjectWithContext:(id)a3
{
  id v4 = a3;
  id v5 = [[MOResource alloc] initWithResourceMO:self];
  id v6 = +[MOResourceMO managedObjectWithObject:v5 inManagedObjectContext:v4];

  return v6;
}

+ (id)fetchRequest
{
  return +[NSFetchRequest fetchRequestWithEntityName:@"MOResourceMO"];
}

- (id)description
{
  id v4 = [(MOResourceMO *)self identifier];
  id v5 = [(MOResourceMO *)self name];
  id v6 = +[MOResource getStringTypeForResources:[(MOResourceMO *)self type]];
  v7 = [(MOResourceMO *)self assets];
  v8 = [(MOResourceMO *)self getDedupeKeyError:0];
  v9 = [(MOResourceMO *)self data];
  id v10 = [v9 length];
  [(MOResourceMO *)self value];
  uint64_t v12 = v11;
  v13 = [(MOResourceMO *)self sourceEventIdentifier];
  v14 = +[NSString stringWithFormat:@"<MOResourceMO identifier, %@, name, %@, type, %@, assets, %@, dedupe key, %@, data.length, %lu, value, %f, sourceEventIdentifier, %@", v4, v5, v6, v7, v8, v10, v12, v13];

  return v14;
}

- (id)getDedupeKeyError:(id *)a3
{
  id v6 = [(MOResourceMO *)self data];
  id v10 = 0;
  v7 = +[MOResource getDedupeKeyForResourceData:v6 type:[(MOResourceMO *)self type] error:&v10];
  id v8 = v10;

  if (a3) {
    *a3 = v8;
  }

  return v7;
}

@end