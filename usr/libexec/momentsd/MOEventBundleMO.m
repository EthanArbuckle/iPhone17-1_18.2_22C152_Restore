@interface MOEventBundleMO
+ (id)fetchRequest;
+ (id)managedObjectWithEventBundle:(id)a3 inManagedObjectContext:(id)a4;
+ (void)updateManagedObject:(id)a3 eventBundle:(id)a4 inManagedObjectContext:(id)a5;
@end

@implementation MOEventBundleMO

+ (id)managedObjectWithEventBundle:(id)a3 inManagedObjectContext:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = [[MOEventBundleMO alloc] initWithContext:v5];
  +[MOEventBundleMO updateManagedObject:v7 eventBundle:v6 inManagedObjectContext:v5];

  return v7;
}

+ (void)updateManagedObject:(id)a3 eventBundle:(id)a4 inManagedObjectContext:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  v10 = [v8 bundleIdentifier];
  [v7 setBundleIdentifier:v10];

  v11 = [v8 suggestionID];
  [v7 setSuggestionID:v11];

  v12 = [v8 creationDate];
  [v7 setCreationDate:v12];

  v13 = [v8 firstCreationDate];
  [v7 setFirstCreationDate:v13];

  v14 = [v8 endDate];
  [v7 setEndDate:v14];

  v15 = [v8 startDate];
  [v7 setStartDate:v15];

  v16 = [v8 expirationDate];
  [v7 setExpirationDate:v16];

  v17 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v8 source]);
  [v7 setSource:v17];

  v18 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v8 interfaceType]);
  [v7 setInterfaceType:v18];

  [v7 setFiltered:[v8 filtered]];
  v19 = [v8 promptLanguage];
  [v7 setPromptLanguage:v19];

  v20 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v8 photoSource]);
  [v7 setPhotoSource:v20];

  [v7 setIsAggregatedAndSuppressed:[v8 isAggregatedAndSuppressed]];
  v21 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v8 summarizationGranularity]);
  [v7 setSummarizationGranularity:v21];

  v22 = [v8 subBundleIDs];
  [v7 setSubBundleIDs:v22];

  v23 = [v8 subSuggestionIDs];
  [v7 setSubSuggestionIDs:v23];

  [v7 setIncludedInSummaryBundleOnly:[v8 includedInSummaryBundleOnly]];
  v24 = [v8 visitEventsRejectedByWatchLocation];
  [v7 setVisitEventsRejectedByWatchLocation:v24];

  v25 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v8 bundleSubType]);
  [v7 setBundleSubType:v25];

  v26 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v8 bundleSuperType]);
  [v7 setBundleSuperType:v26];

  [v7 setAction:0];
  v27 = [v8 action];

  if (v27)
  {
    v28 = [v8 action];
    v29 = +[MOActionMO managedObjectWithObject:v28 inManagedObjectContext:v9];
    [v7 setAction:v29];
  }
  [v7 setConcurrentMediaAction:0];
  v30 = [v8 concurrentMediaAction];

  if (v30)
  {
    v31 = [v8 concurrentMediaAction];
    v32 = +[MOActionMO managedObjectWithObject:v31 inManagedObjectContext:v9];
    [v7 setConcurrentMediaAction:v32];
  }
  [v7 setActions:0];
  long long v116 = 0u;
  long long v117 = 0u;
  long long v114 = 0u;
  long long v115 = 0u;
  v33 = [v8 actions];
  id v34 = [v33 countByEnumeratingWithState:&v114 objects:v123 count:16];
  if (v34)
  {
    id v35 = v34;
    uint64_t v36 = *(void *)v115;
    do
    {
      for (i = 0; i != v35; i = (char *)i + 1)
      {
        if (*(void *)v115 != v36) {
          objc_enumerationMutation(v33);
        }
        v38 = +[MOActionMO managedObjectWithObject:*(void *)(*((void *)&v114 + 1) + 8 * i) inManagedObjectContext:v9];
        [v7 addActionsObject:v38];
      }
      id v35 = [v33 countByEnumeratingWithState:&v114 objects:v123 count:16];
    }
    while (v35);
  }

  [v7 setPersons:0];
  long long v112 = 0u;
  long long v113 = 0u;
  long long v110 = 0u;
  long long v111 = 0u;
  v39 = [v8 persons];
  id v40 = [v39 countByEnumeratingWithState:&v110 objects:v122 count:16];
  if (v40)
  {
    id v41 = v40;
    uint64_t v42 = *(void *)v111;
    do
    {
      for (j = 0; j != v41; j = (char *)j + 1)
      {
        if (*(void *)v111 != v42) {
          objc_enumerationMutation(v39);
        }
        v44 = +[MOPersonMO managedObjectWithObject:*(void *)(*((void *)&v110 + 1) + 8 * (void)j) inManagedObjectContext:v9];
        [v7 addPersonsObject:v44];
      }
      id v41 = [v39 countByEnumeratingWithState:&v110 objects:v122 count:16];
    }
    while (v41);
  }

  [v7 setPlace:0];
  v45 = [v8 place];

  if (v45)
  {
    v46 = [v8 place];
    v47 = +[MOPlaceMO managedObjectWithObject:v46 inManagedObjectContext:v9];
    [v7 setPlace:v47];
  }
  [v7 setPredominantWeather:0];
  v48 = [v8 predominantWeather];

  if (v48)
  {
    v49 = [v8 predominantWeather];
    v50 = +[MOWeatherMO managedObjectWithObject:v49 inManagedObjectContext:v9];
    [v7 setPredominantWeather:v50];
  }
  [v7 setTime:0];
  v51 = [v8 time];

  if (v51)
  {
    v52 = [v8 time];
    v53 = +[MOTimeMO managedObjectWithObject:v52 inManagedObjectContext:v9];
    [v7 setTime:v53];
  }
  v54 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v8 timeAtHomeSubType]);
  [v7 setTimeAtHomeSubType:v54];

  [v7 setResources:0];
  long long v108 = 0u;
  long long v109 = 0u;
  long long v106 = 0u;
  long long v107 = 0u;
  v91 = v8;
  v55 = [v8 resources];
  id v56 = [v55 countByEnumeratingWithState:&v106 objects:v121 count:16];
  if (v56)
  {
    id v57 = v56;
    uint64_t v58 = *(void *)v107;
    do
    {
      for (k = 0; k != v57; k = (char *)k + 1)
      {
        if (*(void *)v107 != v58) {
          objc_enumerationMutation(v55);
        }
        v60 = +[MOResourceMO managedObjectWithObject:*(void *)(*((void *)&v106 + 1) + 8 * (void)k) inManagedObjectContext:v9];
        [v7 addResourcesObject:v60];
      }
      id v57 = [v55 countByEnumeratingWithState:&v106 objects:v121 count:16];
    }
    while (v57);
  }

  [v7 setPlaces:0];
  long long v104 = 0u;
  long long v105 = 0u;
  long long v102 = 0u;
  long long v103 = 0u;
  v61 = [v91 places];
  id v62 = [v61 countByEnumeratingWithState:&v102 objects:v120 count:16];
  if (v62)
  {
    id v63 = v62;
    uint64_t v64 = *(void *)v103;
    do
    {
      for (m = 0; m != v63; m = (char *)m + 1)
      {
        if (*(void *)v103 != v64) {
          objc_enumerationMutation(v61);
        }
        v66 = +[MOPlaceMO managedObjectWithObject:*(void *)(*((void *)&v102 + 1) + 8 * (void)m) inManagedObjectContext:v9];
        [v7 addPlacesObject:v66];
      }
      id v63 = [v61 countByEnumeratingWithState:&v102 objects:v120 count:16];
    }
    while (v63);
  }

  [v7 setPhotoTraits:0];
  long long v100 = 0u;
  long long v101 = 0u;
  long long v98 = 0u;
  long long v99 = 0u;
  v67 = [v91 photoTraits];
  id v68 = [v67 countByEnumeratingWithState:&v98 objects:v119 count:16];
  if (v68)
  {
    id v69 = v68;
    uint64_t v70 = *(void *)v99;
    do
    {
      for (n = 0; n != v69; n = (char *)n + 1)
      {
        if (*(void *)v99 != v70) {
          objc_enumerationMutation(v67);
        }
        v72 = +[MOPhotoTraitMO managedObjectWithObject:*(void *)(*((void *)&v98 + 1) + 8 * (void)n) inManagedObjectContext:v9];
        [v7 addPhotoTraitsObject:v72];
      }
      id v69 = [v67 countByEnumeratingWithState:&v98 objects:v119 count:16];
    }
    while (v69);
  }

  v73 = [v91 metaDataForRank];
  [v7 setMetaDataForRank:v73];

  [v7 setEvents:0];
  long long v96 = 0u;
  long long v97 = 0u;
  long long v94 = 0u;
  long long v95 = 0u;
  id obj = [v91 events];
  id v74 = [obj countByEnumeratingWithState:&v94 objects:v118 count:16];
  if (v74)
  {
    id v75 = v74;
    uint64_t v76 = *(void *)v95;
    do
    {
      for (ii = 0; ii != v75; ii = (char *)ii + 1)
      {
        if (*(void *)v95 != v76) {
          objc_enumerationMutation(obj);
        }
        v78 = *(void **)(*((void *)&v94 + 1) + 8 * (void)ii);
        v79 = +[MOEventMO fetchRequest];
        [v79 setFetchLimit:1];
        [v79 setReturnsObjectsAsFaults:0];
        v80 = [v78 eventIdentifier];
        v81 = +[NSPredicate predicateWithFormat:@"eventIdentifier = %@", v80];
        [v79 setPredicate:v81];

        uint64_t v93 = 0;
        v82 = [v79 execute:&v93];
        uint64_t v83 = v93;
        v84 = [v82 firstObject];

        if (!v83 && v84) {
          [v7 addEventsObject:v84];
        }
      }
      id v75 = [obj countByEnumeratingWithState:&v94 objects:v118 count:16];
    }
    while (v75);
  }

  v85 = [v7 events];
  v86 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v85 count]);
  [v7 setEventCount:v86];

  v87 = [v91 clusterMetadata];
  v88 = +[MOClusterMetadataMO managedObjectWithObject:v87 inManagedObjectContext:v9];
  [v7 setClusterMetadata:v88];

  v89 = [v91 outlierMetadata];
  v90 = +[MOOutlierMetadataMO managedObjectWithObject:v89 inManagedObjectContext:v9];
  [v7 setOutlierMetadata:v90];
}

+ (id)fetchRequest
{
  return +[NSFetchRequest fetchRequestWithEntityName:@"MOEventBundleMO"];
}

@end