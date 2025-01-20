@interface MOContextStringMO
+ (id)fetchRequest;
+ (id)managedObjectWithContextString:(id)a3 inManagedObjectContext:(id)a4;
+ (void)updateManagedObject:(id)a3 withContextString:(id)a4 inManagedObjectContext:(id)a5;
@end

@implementation MOContextStringMO

+ (id)fetchRequest
{
  return +[NSFetchRequest fetchRequestWithEntityName:@"MOContextStringMO"];
}

+ (id)managedObjectWithContextString:(id)a3 inManagedObjectContext:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = [[MOContextStringMO alloc] initWithContext:v5];
  +[MOContextStringMO updateManagedObject:v7 withContextString:v6 inManagedObjectContext:v5];

  return v7;
}

+ (void)updateManagedObject:(id)a3 withContextString:(id)a4 inManagedObjectContext:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  v10 = [v8 stringIdentifier];
  [v7 setStringIdentifier:v10];

  v11 = [v8 textString];
  [v7 setTextString:v11];

  objc_msgSend(v7, "setSource:", objc_msgSend(v8, "source"));
  objc_msgSend(v7, "setContentType:", objc_msgSend(v8, "contentType"));
  objc_msgSend(v7, "setPromptIndex:", objc_msgSend(v8, "promptIndex"));
  [v8 totalScore];
  objc_msgSend(v7, "setTotalScore:");
  [v7 setContextDimensions:0];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  v12 = objc_msgSend(v8, "contextDimensions", 0);
  id v13 = [v12 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v13)
  {
    id v14 = v13;
    uint64_t v15 = *(void *)v19;
    do
    {
      v16 = 0;
      do
      {
        if (*(void *)v19 != v15) {
          objc_enumerationMutation(v12);
        }
        v17 = +[MOContextDimensionMO managedObjectWithContextDimension:*(void *)(*((void *)&v18 + 1) + 8 * (void)v16) inManagedObjectContext:v9];
        [v7 addContextDimensionsObject:v17];

        v16 = (char *)v16 + 1;
      }
      while (v14 != v16);
      id v14 = [v12 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v14);
  }
}

@end