@interface MOPersonMO
+ (id)fetchRequest;
+ (id)managedObjectWithObject:(id)a3 inManagedObjectContext:(id)a4;
- (id)clonedObjectWithContext:(id)a3;
@end

@implementation MOPersonMO

+ (id)managedObjectWithObject:(id)a3 inManagedObjectContext:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = [[MOPersonMO alloc] initWithContext:v6];
  v8 = [v5 localIdentifier];
  [(MOPersonMO *)v7 setIdentifier:v8];

  v9 = [v5 name];
  [(MOPersonMO *)v7 setName:v9];

  v10 = [v5 contactIdentifier];
  [(MOPersonMO *)v7 setContactIdentifier:v10];

  -[MOPersonMO setIsPHPersonTypeImportant:](v7, "setIsPHPersonTypeImportant:", [v5 isPHPersonTypeImportant]);
  -[MOPersonMO setIsMePerson:](v7, "setIsMePerson:", [v5 isMePerson]);
  -[MOPersonMO setMePersonIdentified:](v7, "setMePersonIdentified:", [v5 mePersonIdentified]);
  [(MOPersonMO *)v7 setPersonRelationships:0];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  v11 = [v5 personRelationships];
  id v12 = [v11 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v20;
    do
    {
      for (i = 0; i != v13; i = (char *)i + 1)
      {
        if (*(void *)v20 != v14) {
          objc_enumerationMutation(v11);
        }
        v16 = +[MOPersonRelationshipMO managedObjectWithObject:*(void *)(*((void *)&v19 + 1) + 8 * i) inManagedObjectContext:v6];
        [(MOPersonMO *)v7 addPersonRelationshipsObject:v16];
      }
      id v13 = [v11 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v13);
  }

  [v5 significanceScore];
  -[MOPersonMO setSignificanceScore:](v7, "setSignificanceScore:");
  [v5 priorityScore];
  -[MOPersonMO setPriorityScore:](v7, "setPriorityScore:");
  -[MOPersonMO setSourceEventAccessType:](v7, "setSourceEventAccessType:", [v5 sourceEventAccessType]);
  v17 = [v5 sourceEventIdentifier];
  [(MOPersonMO *)v7 setSourceEventIdentifier:v17];

  return v7;
}

- (id)clonedObjectWithContext:(id)a3
{
  id v4 = a3;
  id v5 = [[MOPerson alloc] initWithPersonMO:self];
  id v6 = +[MOPersonMO managedObjectWithObject:v5 inManagedObjectContext:v4];

  return v6;
}

+ (id)fetchRequest
{
  return +[NSFetchRequest fetchRequestWithEntityName:@"MOPersonMO"];
}

@end