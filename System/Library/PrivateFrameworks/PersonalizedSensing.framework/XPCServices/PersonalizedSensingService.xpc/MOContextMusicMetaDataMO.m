@interface MOContextMusicMetaDataMO
+ (id)fetchRequest;
+ (id)managedObjectWithObject:(id)a3 inManagedObjectContext:(id)a4;
@end

@implementation MOContextMusicMetaDataMO

+ (id)fetchRequest
{
  return +[NSFetchRequest fetchRequestWithEntityName:@"MOContextMusicMetaDataMO"];
}

+ (id)managedObjectWithObject:(id)a3 inManagedObjectContext:(id)a4
{
  v4 = (MOContextMusicMetaDataMO *)a3;
  if (a3)
  {
    id v5 = a4;
    v6 = v4;
    v4 = [[MOContextMusicMetaDataMO alloc] initWithContext:v5];

    v7 = [(MOContextMusicMetaDataMO *)v6 musicString];

    [(MOContextMusicMetaDataMO *)v4 setMusicString:v7];
  }
  return v4;
}

@end