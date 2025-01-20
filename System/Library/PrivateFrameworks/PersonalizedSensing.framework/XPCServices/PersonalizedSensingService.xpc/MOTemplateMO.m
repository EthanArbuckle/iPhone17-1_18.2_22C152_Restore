@interface MOTemplateMO
+ (id)fetchRequest;
+ (id)managedObjectWithTemplate:(id)a3 inManagedObjectContext:(id)a4;
+ (void)updateManagedObject:(id)a3 withTemplate:(id)a4 inManagedObjectContext:(id)a5;
@end

@implementation MOTemplateMO

+ (id)fetchRequest
{
  return +[NSFetchRequest fetchRequestWithEntityName:@"MOTemplateMO"];
}

+ (id)managedObjectWithTemplate:(id)a3 inManagedObjectContext:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = [[MOTemplateMO alloc] initWithContext:v5];
  +[MOTemplateMO updateManagedObject:v7 withTemplate:v6 inManagedObjectContext:v5];

  return v7;
}

+ (void)updateManagedObject:(id)a3 withTemplate:(id)a4 inManagedObjectContext:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  v10 = [v8 templateIdentifier];
  [v7 setTemplateIdentifier:v10];

  v11 = [v8 templateString];
  [v7 setTemplateString:v11];

  objc_msgSend(v7, "setPatternType:", objc_msgSend(v8, "patternType"));
  objc_msgSend(v7, "setActivityType:", objc_msgSend(v8, "activityType"));
  objc_msgSend(v7, "setPlaceType:", objc_msgSend(v8, "placeType"));
  objc_msgSend(v7, "setTime:", objc_msgSend(v8, "time"));
  objc_msgSend(v7, "setBundleType:", objc_msgSend(v8, "bundleType"));
  objc_msgSend(v7, "setPeopleClassification:", objc_msgSend(v8, "peopleClassification"));
  objc_msgSend(v7, "setHasPersonName:", objc_msgSend(v8, "hasPersonName"));
  objc_msgSend(v7, "setHasPlaceName:", objc_msgSend(v8, "hasPlaceName"));
  objc_msgSend(v7, "setHasCityName:", objc_msgSend(v8, "hasCityName"));
  objc_msgSend(v7, "setHasTimeReference:", objc_msgSend(v8, "hasTimeReference"));
  objc_msgSend(v7, "setPhotoTrait:", objc_msgSend(v8, "photoTrait"));
  [v8 utility];
  objc_msgSend(v7, "setUtility:");
  [v8 accuracy];
  objc_msgSend(v7, "setAccuracy:");
  [v8 satisfaction];
  objc_msgSend(v7, "setSatisfaction:");
  [v8 generalizability];
  objc_msgSend(v7, "setGeneralizability:");
  objc_msgSend(v7, "setPromptIndex:", objc_msgSend(v8, "promptIndex"));
  [v8 totalScore];
  objc_msgSend(v7, "setTotalScore:");
  [v7 setGlobalTraits:0];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  v12 = objc_msgSend(v8, "globalTraits", 0);
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
        v17 = +[MOGlobalTraitMO managedObjectWithGlobalTrait:*(void *)(*((void *)&v18 + 1) + 8 * (void)v16) inManagedObjectContext:v9];
        [v7 addGlobalTraitsObject:v17];

        v16 = (char *)v16 + 1;
      }
      while (v14 != v16);
      id v14 = [v12 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v14);
  }
}

@end