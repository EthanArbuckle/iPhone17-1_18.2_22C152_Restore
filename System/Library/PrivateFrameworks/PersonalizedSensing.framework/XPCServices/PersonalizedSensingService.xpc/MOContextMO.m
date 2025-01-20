@interface MOContextMO
+ (id)fetchRequest;
+ (id)managedObjectWithContext:(id)a3 inManagedObjectContext:(id)a4;
+ (void)updateManagedObject:(id)a3 withContext:(id)a4 inManagedObjectContext:(id)a5;
@end

@implementation MOContextMO

+ (id)fetchRequest
{
  return +[NSFetchRequest fetchRequestWithEntityName:@"MOContextMO"];
}

+ (id)managedObjectWithContext:(id)a3 inManagedObjectContext:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = [[MOContextMO alloc] initWithContext:v5];
  +[MOContextMO updateManagedObject:v7 withContext:v6 inManagedObjectContext:v5];

  return v7;
}

+ (void)updateManagedObject:(id)a3 withContext:(id)a4 inManagedObjectContext:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  v10 = [v8 contextIdentifier];
  [v7 setContextIdentifier:v10];

  v11 = [v8 contextCreationTimestamp];
  [v7 setContextCreationTimestamp:v11];

  objc_msgSend(v7, "setAssociatedPatternType:", objc_msgSend(v8, "associatedPatternType"));
  objc_msgSend(v7, "setActionType:", objc_msgSend(v8, "actionType"));
  v12 = [v8 associatedRequestID];
  [v7 setAssociatedRequestID:v12];

  v13 = [v8 associatedBundleID];
  [v7 setAssociatedBundleID:v13];

  v14 = [v8 associatedSuggestionID];
  [v7 setAssociatedSuggestionID:v14];

  v15 = [v8 bundleContentIdentifier];
  [v7 setBundleContentIdentifier:v15];

  [v7 setContextStrings:0];
  v16 = [v8 contextStrings];
  id v17 = [v16 count];

  if (v17)
  {
    long long v74 = 0u;
    long long v75 = 0u;
    long long v72 = 0u;
    long long v73 = 0u;
    v18 = [v8 contextStrings];
    id v19 = [v18 countByEnumeratingWithState:&v72 objects:v80 count:16];
    if (v19)
    {
      id v20 = v19;
      uint64_t v21 = *(void *)v73;
      do
      {
        v22 = 0;
        do
        {
          if (*(void *)v73 != v21) {
            objc_enumerationMutation(v18);
          }
          v23 = +[MOContextStringMO managedObjectWithContextString:*(void *)(*((void *)&v72 + 1) + 8 * (void)v22) inManagedObjectContext:v9];
          [v7 addContextStringsObject:v23];

          v22 = (char *)v22 + 1;
        }
        while (v20 != v22);
        id v20 = [v18 countByEnumeratingWithState:&v72 objects:v80 count:16];
      }
      while (v20);
    }
  }
  [v7 setAssociatedLocations:0];
  v24 = [v8 associatedLocations];
  id v25 = [v24 count];

  if (v25)
  {
    long long v70 = 0u;
    long long v71 = 0u;
    long long v68 = 0u;
    long long v69 = 0u;
    v26 = [v8 associatedLocations];
    id v27 = [v26 countByEnumeratingWithState:&v68 objects:v79 count:16];
    if (v27)
    {
      id v28 = v27;
      uint64_t v29 = *(void *)v69;
      do
      {
        v30 = 0;
        do
        {
          if (*(void *)v69 != v29) {
            objc_enumerationMutation(v26);
          }
          v31 = +[MOContextLocationMetaDataMO managedObjectWithObject:*(void *)(*((void *)&v68 + 1) + 8 * (void)v30) inManagedObjectContext:v9];
          [v7 addAssociatedLocationsObject:v31];

          v30 = (char *)v30 + 1;
        }
        while (v28 != v30);
        id v28 = [v26 countByEnumeratingWithState:&v68 objects:v79 count:16];
      }
      while (v28);
    }
  }
  [v7 setAssociatedContacts:0];
  v32 = [v8 associatedContacts];
  id v33 = [v32 count];

  if (v33)
  {
    long long v66 = 0u;
    long long v67 = 0u;
    long long v64 = 0u;
    long long v65 = 0u;
    v34 = [v8 associatedContacts];
    id v35 = [v34 countByEnumeratingWithState:&v64 objects:v78 count:16];
    if (v35)
    {
      id v36 = v35;
      uint64_t v37 = *(void *)v65;
      do
      {
        v38 = 0;
        do
        {
          if (*(void *)v65 != v37) {
            objc_enumerationMutation(v34);
          }
          v39 = +[MOContextContactMetaDataMO managedObjectWithObject:*(void *)(*((void *)&v64 + 1) + 8 * (void)v38) inManagedObjectContext:v9];
          [v7 addAssociatedContactsObject:v39];

          v38 = (char *)v38 + 1;
        }
        while (v36 != v38);
        id v36 = [v34 countByEnumeratingWithState:&v64 objects:v78 count:16];
      }
      while (v36);
    }
  }
  [v7 setAssociatedTime:0];
  v40 = [v8 associatedTime];
  id v41 = [v40 count];

  if (v41)
  {
    long long v62 = 0u;
    long long v63 = 0u;
    long long v60 = 0u;
    long long v61 = 0u;
    v42 = [v8 associatedTime];
    id v43 = [v42 countByEnumeratingWithState:&v60 objects:v77 count:16];
    if (v43)
    {
      id v44 = v43;
      uint64_t v45 = *(void *)v61;
      do
      {
        v46 = 0;
        do
        {
          if (*(void *)v61 != v45) {
            objc_enumerationMutation(v42);
          }
          v47 = +[MOContextTimeMetaDataMO managedObjectWithObject:*(void *)(*((void *)&v60 + 1) + 8 * (void)v46) inManagedObjectContext:v9];
          [v7 addAssociatedTimeObject:v47];

          v46 = (char *)v46 + 1;
        }
        while (v44 != v46);
        id v44 = [v42 countByEnumeratingWithState:&v60 objects:v77 count:16];
      }
      while (v44);
    }
  }
  [v7 setAssociatedMusic:0];
  v48 = [v8 associatedMusic];
  id v49 = [v48 count];

  if (v49)
  {
    long long v58 = 0u;
    long long v59 = 0u;
    long long v56 = 0u;
    long long v57 = 0u;
    v50 = objc_msgSend(v8, "associatedMusic", 0);
    id v51 = [v50 countByEnumeratingWithState:&v56 objects:v76 count:16];
    if (v51)
    {
      id v52 = v51;
      uint64_t v53 = *(void *)v57;
      do
      {
        v54 = 0;
        do
        {
          if (*(void *)v57 != v53) {
            objc_enumerationMutation(v50);
          }
          v55 = +[MOContextMusicMetaDataMO managedObjectWithObject:*(void *)(*((void *)&v56 + 1) + 8 * (void)v54) inManagedObjectContext:v9];
          [v7 addAssociatedMusicObject:v55];

          v54 = (char *)v54 + 1;
        }
        while (v52 != v54);
        id v52 = [v50 countByEnumeratingWithState:&v56 objects:v76 count:16];
      }
      while (v52);
    }
  }
}

@end