@interface DMDCommandPayloadMetadata
+ (id)commandsWithPayloadDictionaries:(id)a3 organizationIdentifier:(id)a4 context:(id)a5 error:(id *)a6;
+ (id)fetchRequestForCommandsFromOrganizationWithIdentifier:(id)a3;
+ (id)fetchRequestForCommandsFromOrganizationWithIdentifier:(id)a3 matchingPredicate:(id)a4;
+ (id)fetchRequestForCommandsPendingDeleteFromOrganizationWithIdentifier:(id)a3;
+ (id)fetchRequestForCommandsPendingExecutionFromOrganizationWithIdentifier:(id)a3;
+ (id)fetchRequestForCommandsPendingRemovalFromOrganizationWithIdentifier:(id)a3;
@end

@implementation DMDCommandPayloadMetadata

+ (id)commandsWithPayloadDictionaries:(id)a3 organizationIdentifier:(id)a4 context:(id)a5 error:(id *)a6
{
  id v9 = a3;
  id v30 = a4;
  id v29 = a5;
  v10 = objc_opt_new();
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id v11 = v9;
  id v12 = [v11 countByEnumeratingWithState:&v31 objects:v39 count:16];
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v32;
    uint64_t v15 = DMFCommandPayloadStatusKey;
    uint64_t v16 = DMFCommandStatusQueued;
    id obj = v11;
    while (2)
    {
      for (i = 0; i != v13; i = (char *)i + 1)
      {
        if (*(void *)v32 != v14) {
          objc_enumerationMutation(obj);
        }
        v18 = +[DMDPayloadMetadata metadataWithPayloadDictionary:*(void *)(*((void *)&v31 + 1) + 8 * i) organizationIdentifier:v30 context:v29 error:a6];
        v19 = v18;
        if (!v18) {
          goto LABEL_13;
        }
        v20 = [v18 identifier];
        v21 = [v10 objectForKeyedSubscript:v20];

        if (v21)
        {
          if (a6)
          {
            uint64_t v37 = DMFConfigurationPayloadIdentifierErrorKey;
            v25 = [v19 identifier];
            v38 = v25;
            v26 = +[NSDictionary dictionaryWithObjects:&v38 forKeys:&v37 count:1];
            DMFErrorWithCodeAndUserInfo();
            *a6 = (id)objc_claimAutoreleasedReturnValue();
          }
LABEL_13:

          id v11 = obj;
          id v24 = 0;
          goto LABEL_14;
        }
        uint64_t v35 = v15;
        uint64_t v36 = v16;
        v22 = +[NSDictionary dictionaryWithObjects:&v36 forKeys:&v35 count:1];
        [v19 setStateDictionary:v22];

        v23 = [v19 identifier];
        [v10 setObject:v19 forKeyedSubscript:v23];
      }
      id v11 = obj;
      id v13 = [obj countByEnumeratingWithState:&v31 objects:v39 count:16];
      if (v13) {
        continue;
      }
      break;
    }
  }

  id v24 = v10;
LABEL_14:

  return v24;
}

+ (id)fetchRequestForCommandsFromOrganizationWithIdentifier:(id)a3 matchingPredicate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = objc_opt_new();
  if (v6)
  {
    id v9 = +[NSPredicate predicateWithFormat:@"%K = %@", @"organization.identifier", v6];
    [v8 addObject:v9];
  }
  if (v7) {
    [v8 addObject:v7];
  }
  v10 = [a1 fetchRequest];
  id v11 = +[NSCompoundPredicate andPredicateWithSubpredicates:v8];
  [v10 setPredicate:v11];

  return v10;
}

+ (id)fetchRequestForCommandsFromOrganizationWithIdentifier:(id)a3
{
  return [a1 fetchRequestForCommandsFromOrganizationWithIdentifier:a3 matchingPredicate:0];
}

+ (id)fetchRequestForCommandsPendingExecutionFromOrganizationWithIdentifier:(id)a3
{
  id v4 = a3;
  v5 = +[NSPredicate predicateWithFormat:@"%K = %@", @"available", &__kCFBooleanTrue];
  v11[0] = v5;
  id v6 = +[NSPredicate predicateWithFormat:@"%K = %@", @"installed", &__kCFBooleanFalse];
  v11[1] = v6;
  id v7 = +[NSArray arrayWithObjects:v11 count:2];
  v8 = +[NSCompoundPredicate andPredicateWithSubpredicates:v7];
  id v9 = [a1 fetchRequestForCommandsFromOrganizationWithIdentifier:v4 matchingPredicate:v8];

  return v9;
}

+ (id)fetchRequestForCommandsPendingRemovalFromOrganizationWithIdentifier:(id)a3
{
  id v4 = a3;
  v5 = +[NSPredicate predicateWithFormat:@"%K = %@", @"available", &__kCFBooleanFalse];
  v11[0] = v5;
  id v6 = +[NSPredicate predicateWithFormat:@"%K = %@", @"installed", &__kCFBooleanFalse];
  v11[1] = v6;
  id v7 = +[NSArray arrayWithObjects:v11 count:2];
  v8 = +[NSCompoundPredicate andPredicateWithSubpredicates:v7];
  id v9 = [a1 fetchRequestForCommandsFromOrganizationWithIdentifier:v4 matchingPredicate:v8];

  return v9;
}

+ (id)fetchRequestForCommandsPendingDeleteFromOrganizationWithIdentifier:(id)a3
{
  id v4 = a3;
  v5 = +[NSPredicate predicateWithFormat:@"%K = %@", @"installed", &__kCFBooleanTrue];
  v11[0] = v5;
  id v6 = +[NSPredicate predicateWithFormat:@"%K = %@", @"pendingStatusUpdate", &__kCFBooleanFalse];
  v11[1] = v6;
  id v7 = +[NSArray arrayWithObjects:v11 count:2];
  v8 = +[NSCompoundPredicate andPredicateWithSubpredicates:v7];
  id v9 = [a1 fetchRequestForCommandsFromOrganizationWithIdentifier:v4 matchingPredicate:v8];

  return v9;
}

@end