@interface MOTopicAnnotationManager
- (id)annotateBaseEvents:(id)a3 dateInterval:(id)a4;
- (id)getBaseEvents:(id)a3;
@end

@implementation MOTopicAnnotationManager

- (id)getBaseEvents:(id)a3
{
  id v3 = a3;
  v4 = +[NSPredicate predicateWithFormat:@"%K = %lu", @"category", 7];
  v5 = [v3 filteredArrayUsingPredicate:v4];

  return v5;
}

- (id)annotateBaseEvents:(id)a3 dateInterval:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (v5 && [v5 count] && (unint64_t)objc_msgSend(v5, "count") <= 1)
  {
    v9 = [MOEventBundle alloc];
    v10 = +[NSUUID UUID];
    v11 = +[NSDate date];
    v7 = [(MOEventBundle *)v9 initWithBundleIdentifier:v10 creationDate:v11];

    [(MOEventBundle *)v7 setInterfaceType:8];
    v12 = [[MOAction alloc] initWithActionName:@"Topic of Interest" actionType:1 actionSubtype:2];
    [(MOEventBundle *)v7 setAction:v12];

    v13 = [v5 firstObject];
    v14 = [v13 eventIdentifier];
    v15 = [(MOEventBundle *)v7 action];
    [v15 setSourceEventIdentifier:v14];

    v16 = [v5 firstObject];
    v17 = [v5 firstObject];
    v18 = [v17 scoredTopics];
    v19 = [v16 displayNameOfScoredTopics:v18];

    v35 = v19;
    id v20 = [v19 keysSortedByValueUsingComparator:&__block_literal_global_44];
    v21 = v20;
    if ((unint64_t)[v20 count] >= 4)
    {
      v21 = [v20 subarrayWithRange:0, 3];
    }
    v34 = v20;
    v33 = [v21 componentsJoinedByString:@","];
    v22 = +[NSString stringWithFormat:@"%@: %@", @"Topic of Interest", v33];
    [(MOEventBundle *)v7 setPromptLanguage:v22];

    v23 = objc_opt_new();
    long long v36 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    id v24 = v21;
    id v25 = [v24 countByEnumeratingWithState:&v36 objects:v40 count:16];
    if (v25)
    {
      id v26 = v25;
      uint64_t v27 = *(void *)v37;
      do
      {
        for (i = 0; i != v26; i = (char *)i + 1)
        {
          if (*(void *)v37 != v27) {
            objc_enumerationMutation(v24);
          }
          v29 = [[MOResource alloc] initWithName:*(void *)(*((void *)&v36 + 1) + 8 * i) type:8];
          [v23 addObject:v29];
        }
        id v26 = [v24 countByEnumeratingWithState:&v36 objects:v40 count:16];
      }
      while (v26);
    }

    id v30 = [v23 copy];
    [(MOEventBundle *)v7 setResources:v30];

    [(MOEventBundle *)v7 setEvents:v5];
    [(MOEventBundle *)v7 setPropertiesBasedOnEvents];
    v31 = [v6 startDate];
    [(MOEventBundle *)v7 setStartDate:v31];

    v32 = [v6 endDate];
    [(MOEventBundle *)v7 setEndDate:v32];
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

int64_t __60__MOTopicAnnotationManager_annotateBaseEvents_dateInterval___block_invoke(id a1, id a2, id a3)
{
  return (int64_t)[a3 compare:a2];
}

@end