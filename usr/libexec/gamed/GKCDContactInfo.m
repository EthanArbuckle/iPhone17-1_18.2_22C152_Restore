@interface GKCDContactInfo
+ (id)_gkObjectsMatchingHandles:(id)a3 withContext:(id)a4;
+ (id)_gkUpdateWithContact:(id)a3 withContext:(id)a4;
+ (id)fetchRequest;
+ (void)_gkDeleteObjectsWithContactIdentifier:(id)a3 withContext:(id)a4;
- (void)_gkUpdateEntryWithHandle:(id)a3 fromContact:(id)a4;
@end

@implementation GKCDContactInfo

- (void)_gkUpdateEntryWithHandle:(id)a3 fromContact:(id)a4
{
  id v6 = a4;
  [(GKCDContactInfo *)self setHandle:a3];
  v7 = [v6 identifier];
  [(GKCDContactInfo *)self setContactID:v7];

  v8 = [v6 givenName];
  [(GKCDContactInfo *)self setGivenName:v8];

  v9 = [v6 familyName];
  [(GKCDContactInfo *)self setFamilyName:v9];

  v10 = [v6 nickname];
  [(GKCDContactInfo *)self setNickname:v10];

  v11 = [v6 nameSuffix];
  [(GKCDContactInfo *)self setNameSuffix:v11];

  id v12 = [v6 namePrefix];

  [(GKCDContactInfo *)self setNamePrefix:v12];
}

+ (id)_gkUpdateWithContact:(id)a3 withContext:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [v6 identifier];
  [a1 _gkDeleteObjectsWithContactIdentifier:v8 withContext:v7];

  [v6 _gkAllHandles];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  id v9 = [obj countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v20;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v20 != v11) {
          objc_enumerationMutation(obj);
        }
        uint64_t v13 = *(void *)(*((void *)&v19 + 1) + 8 * i);
        v14 = [GKCDContactInfo alloc];
        v15 = [a1 entity];
        v16 = [(GKCDContactInfo *)v14 initWithEntity:v15 insertIntoManagedObjectContext:v7];

        [(GKCDContactInfo *)v16 _gkUpdateEntryWithHandle:v13 fromContact:v6];
      }
      id v10 = [obj countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v10);
  }

  return obj;
}

+ (void)_gkDeleteObjectsWithContactIdentifier:(id)a3 withContext:(id)a4
{
  id v5 = a4;
  +[NSPredicate predicateWithFormat:@"contactID == %@", a3];
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  id v6 = +[GKCDContactInfo _gkObjectsMatchingPredicate:v7 withContext:v5];
  [v5 _gkDeleteObjects:v6];
}

+ (id)_gkObjectsMatchingHandles:(id)a3 withContext:(id)a4
{
  id v6 = a4;
  id v7 = +[NSPredicate predicateWithFormat:@"handle IN %@", a3];
  v8 = [a1 _gkObjectsMatchingPredicate:v7 withContext:v6];

  return v8;
}

+ (id)fetchRequest
{
  return +[NSFetchRequest fetchRequestWithEntityName:@"ContactInfo"];
}

@end