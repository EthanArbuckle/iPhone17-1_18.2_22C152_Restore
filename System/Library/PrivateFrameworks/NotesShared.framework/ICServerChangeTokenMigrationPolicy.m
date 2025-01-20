@interface ICServerChangeTokenMigrationPolicy
- (BOOL)createDestinationInstancesForSourceInstance:(id)a3 entityMapping:(id)a4 manager:(id)a5 error:(id *)a6;
@end

@implementation ICServerChangeTokenMigrationPolicy

- (BOOL)createDestinationInstancesForSourceInstance:(id)a3 entityMapping:(id)a4 manager:(id)a5 error:(id *)a6
{
  v23[1] = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v22.receiver = self;
  v22.super_class = (Class)ICServerChangeTokenMigrationPolicy;
  BOOL v13 = [(NSEntityMigrationPolicy *)&v22 createDestinationInstancesForSourceInstance:v10 entityMapping:v11 manager:v12 error:a6];
  if (v13)
  {
    v14 = [v11 name];
    v23[0] = v10;
    v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:1];
    v16 = [v12 destinationInstancesForEntityMappingNamed:v14 sourceInstances:v15];
    v17 = [v16 firstObject];

    v18 = [v10 valueForKey:@"ckServerChangeToken"];
    v19 = v18;
    if (v18)
    {
      v20 = [v18 data];
      [v17 setValue:v20 forKey:@"ckServerChangeTokenData"];
    }
  }

  return v13;
}

@end