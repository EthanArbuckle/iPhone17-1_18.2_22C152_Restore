@interface MORankingParamsMO
+ (id)fetchRequest;
+ (id)managedObjectWithObject:(id)a3 inManagedObjectContext:(id)a4 forContext:(id)a5 forEvergreenScore:(BOOL)a6;
+ (void)_updateRankingParamsMO:(id)a3 with:(id)a4 forEvergreenScore:(BOOL)a5;
- (id)rankingParams;
@end

@implementation MORankingParamsMO

+ (id)fetchRequest
{
  return +[NSFetchRequest fetchRequestWithEntityName:@"MORankingParamsMO"];
}

- (id)rankingParams
{
  v3 = objc_alloc_init(MORankingParams);
  v4 = [(MORankingParamsMO *)self engagementScoreParamsUpdateDate];
  [(MORankingParams *)v3 setEngagementScoreParamsUpdateDate:v4];

  [(MORankingParamsMO *)self activityInterfaceTypeEngagementWeight];
  -[MORankingParams setActivityInterfaceTypeEngagementWeight:](v3, "setActivityInterfaceTypeEngagementWeight:");
  [(MORankingParamsMO *)self outingInterfaceTypeEngagementWeight];
  -[MORankingParams setOutingInterfaceTypeEngagementWeight:](v3, "setOutingInterfaceTypeEngagementWeight:");
  [(MORankingParamsMO *)self photoMomentInterfaceTypeEngagementWeight];
  -[MORankingParams setPhotoMomentInterfaceTypeEngagementWeight:](v3, "setPhotoMomentInterfaceTypeEngagementWeight:");
  [(MORankingParamsMO *)self significantContactInterfaceTypeEngagementWeight];
  -[MORankingParams setSignificantContactInterfaceTypeEngagementWeight:](v3, "setSignificantContactInterfaceTypeEngagementWeight:");
  [(MORankingParamsMO *)self yourMediaInterfaceTypeEngagementWeight];
  -[MORankingParams setYourMediaInterfaceTypeEngagementWeight:](v3, "setYourMediaInterfaceTypeEngagementWeight:");
  [(MORankingParamsMO *)self yourSharedContentInterfaceTypeEngagementWeight];
  -[MORankingParams setYourSharedContentInterfaceTypeEngagementWeight:](v3, "setYourSharedContentInterfaceTypeEngagementWeight:");
  [(MORankingParamsMO *)self yourTimeAtHomeInterfaceTypeEngagementWeight];
  -[MORankingParams setYourTimeAtHomeInterfaceTypeEngagementWeight:](v3, "setYourTimeAtHomeInterfaceTypeEngagementWeight:");
  [(MORankingParamsMO *)self topicsOfInterestInterfaceTypeEngagementWeight];
  -[MORankingParams setTopicsOfInterestInterfaceTypeEngagementWeight:](v3, "setTopicsOfInterestInterfaceTypeEngagementWeight:");
  [(MORankingParamsMO *)self trendInterfaceTypeEngagementWeight];
  -[MORankingParams setTrendInterfaceTypeEngagementWeight:](v3, "setTrendInterfaceTypeEngagementWeight:");
  [(MORankingParamsMO *)self photoMemoryInterfaceTypeEngagementWeight];
  -[MORankingParams setPhotoMemoryInterfaceTypeEngagementWeight:](v3, "setPhotoMemoryInterfaceTypeEngagementWeight:");
  [(MORankingParamsMO *)self evergreenInterfaceTypeEngagementWeight];
  -[MORankingParams setEvergreenInterfaceTypeEngagementWeight:](v3, "setEvergreenInterfaceTypeEngagementWeight:");
  [(MORankingParamsMO *)self timeContextInterfaceTypeEngagementWeight];
  -[MORankingParams setTimeContextInterfaceTypeEngagementWeight:](v3, "setTimeContextInterfaceTypeEngagementWeight:");
  [(MORankingParamsMO *)self tripInterfaceTypeEngagementWeight];
  -[MORankingParams setTripInterfaceTypeEngagementWeight:](v3, "setTripInterfaceTypeEngagementWeight:");
  [(MORankingParamsMO *)self stateOfMindInterfaceTypeEngagementWeight];
  -[MORankingParams setStateOfMindInterfaceTypeEngagementWeight:](v3, "setStateOfMindInterfaceTypeEngagementWeight:");
  [(MORankingParamsMO *)self clusteringInterfaceTypeEngagementWeight];
  -[MORankingParams setClusteringInterfaceTypeEngagementWeight:](v3, "setClusteringInterfaceTypeEngagementWeight:");
  [(MORankingParams *)v3 setIsParamsUpdateOnHold:[(MORankingParamsMO *)self isParamsUpdateOnHold]];
  v5 = [(MORankingParamsMO *)self evergreenEngagementScoreParamsUpdateDate];
  [(MORankingParams *)v3 setEvergreenEngagementScoreParamsUpdateDate:v5];

  [(MORankingParams *)v3 setIsEvergreenEngagementScoreParamsUpdateOnHold:[(MORankingParamsMO *)self isEvergreenEngagementScoreParamsUpdateOnHold]];
  [(MORankingParamsMO *)self wisdomEvergreenTypeEngagementWeight];
  -[MORankingParams setWisdomEvergreenTypeEngagementWeight:](v3, "setWisdomEvergreenTypeEngagementWeight:");
  [(MORankingParamsMO *)self gratitudeEvergreenTypeEngagementWeight];
  -[MORankingParams setGratitudeEvergreenTypeEngagementWeight:](v3, "setGratitudeEvergreenTypeEngagementWeight:");
  [(MORankingParamsMO *)self kindnessEvergreenTypeEngagementWeight];
  -[MORankingParams setKindnessEvergreenTypeEngagementWeight:](v3, "setKindnessEvergreenTypeEngagementWeight:");
  [(MORankingParamsMO *)self purposeEvergreenTypeEngagementWeight];
  -[MORankingParams setPurposeEvergreenTypeEngagementWeight:](v3, "setPurposeEvergreenTypeEngagementWeight:");
  [(MORankingParamsMO *)self resilienceEvergreenTypeEngagementWeight];
  -[MORankingParams setResilienceEvergreenTypeEngagementWeight:](v3, "setResilienceEvergreenTypeEngagementWeight:");
  [(MORankingParamsMO *)self creativityEvergreenTypeEngagementWeight];
  -[MORankingParams setCreativityEvergreenTypeEngagementWeight:](v3, "setCreativityEvergreenTypeEngagementWeight:");

  return v3;
}

+ (id)managedObjectWithObject:(id)a3 inManagedObjectContext:(id)a4 forContext:(id)a5 forEvergreenScore:(BOOL)a6
{
  BOOL v6 = a6;
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  if (v13)
  {
    v14 = +[MORankingParamsMO fetchRequest];
    [v14 setFetchLimit:1];
    [v14 setReturnsObjectsAsFaults:0];
    id v26 = 0;
    v15 = [v12 executeFetchRequest:v14 error:&v26];
    id v16 = v26;
    if (v16)
    {
      v17 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleStore);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
        +[MORankingParamsMO managedObjectWithObject:inManagedObjectContext:forContext:forEvergreenScore:]((uint64_t)v16, v17);
      }

      v18 = [[MORankingParamsMO alloc] initWithContext:v12];
      [a1 _updateRankingParamsMO:v18 with:v11 forEvergreenScore:1];
      [(MORankingParamsMO *)v18 setIsEvergreenEngagementScoreParamsUpdateOnHold:1];
      [a1 _updateRankingParamsMO:v18 with:v11 forEvergreenScore:0];
      [(MORankingParamsMO *)v18 setIsParamsUpdateOnHold:1];
    }
    else
    {
      if (![v15 count])
      {
        v19 = _mo_log_facility_get_os_log(&MOLogFacilityGeneral);
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
          +[MORankingParamsMO managedObjectWithObject:inManagedObjectContext:forContext:forEvergreenScore:](v19);
        }

        v20 = +[NSAssertionHandler currentHandler];
        [v20 handleFailureInMethod:a2 object:a1 file:@"MORankingParamsMO+CoreDataClass.m" lineNumber:37 description:@"Ranking params array size is 0 (in %s:%d)", "+[MORankingParamsMO managedObjectWithObject:inManagedObjectContext:forContext:forEvergreenScore:]", 37];
      }
      v21 = [v15 objectAtIndexedSubscript:0];
      [a1 _updateRankingParamsMO:v21 with:v11 forEvergreenScore:v6];

      if (v6)
      {
        id v22 = [v13 isEvergreenEngagementScoreParamsUpdateOnHold];
        v23 = [v15 objectAtIndexedSubscript:0];
        [v23 setIsEvergreenEngagementScoreParamsUpdateOnHold:v22];
      }
      else
      {
        id v24 = [v13 isParamsUpdateOnHold];
        v23 = [v15 objectAtIndexedSubscript:0];
        [v23 setIsParamsUpdateOnHold:v24];
      }

      v18 = [v15 objectAtIndexedSubscript:0];
    }
  }
  else
  {
    v18 = [[MORankingParamsMO alloc] initWithContext:v12];
    [a1 _updateRankingParamsMO:v18 with:v11 forEvergreenScore:1];
    [(MORankingParamsMO *)v18 setIsEvergreenEngagementScoreParamsUpdateOnHold:1];
    [a1 _updateRankingParamsMO:v18 with:v11 forEvergreenScore:0];
    [(MORankingParamsMO *)v18 setIsParamsUpdateOnHold:1];
  }

  return v18;
}

+ (void)_updateRankingParamsMO:(id)a3 with:(id)a4 forEvergreenScore:(BOOL)a5
{
  BOOL v5 = a5;
  id v7 = a4;
  id v8 = a3;
  v9 = +[NSDate date];
  if (v5)
  {
    [v8 setEvergreenEngagementScoreParamsUpdateDate:v9];

    v10 = [v7 evergreenEngagementScoreParameterDict];
    id v11 = [v10 objectForKeyedSubscript:@"WISDOM"];
    [v11 floatValue];
    [v8 setWisdomEvergreenTypeEngagementWeight:];

    id v12 = [v7 evergreenEngagementScoreParameterDict];
    id v13 = [v12 objectForKeyedSubscript:@"GRATITUDE"];
    [v13 floatValue];
    [v8 setGratitudeEvergreenTypeEngagementWeight:];

    v14 = [v7 evergreenEngagementScoreParameterDict];
    v15 = [v14 objectForKeyedSubscript:@"KINDNESS"];
    [v15 floatValue];
    [v8 setKindnessEvergreenTypeEngagementWeight:];

    id v16 = [v7 evergreenEngagementScoreParameterDict];
    v17 = [v16 objectForKeyedSubscript:@"PURPOSE"];
    [v17 floatValue];
    [v8 setPurposeEvergreenTypeEngagementWeight:];

    v18 = [v7 evergreenEngagementScoreParameterDict];
    v19 = [v18 objectForKeyedSubscript:@"RESILIENCE"];
    [v19 floatValue];
    [v8 setResilienceEvergreenTypeEngagementWeight:];

    id v49 = [v7 evergreenEngagementScoreParameterDict];

    v20 = [v49 objectForKeyedSubscript:@"CREATIVITY"];
    [v20 floatValue];
    [v8 setCreativityEvergreenTypeEngagementWeight:];
  }
  else
  {
    [v8 setEngagementScoreParamsUpdateDate:v9];

    v21 = [v7 dynamicModelParameterDict];
    id v22 = [v21 objectForKeyedSubscript:&off_1002F5A08];
    [v22 floatValue];
    [v8 setActivityInterfaceTypeEngagementWeight];

    v23 = [v7 dynamicModelParameterDict];
    id v24 = [v23 objectForKeyedSubscript:&off_1002F5A20];
    [v24 floatValue];
    [v8 setOutingInterfaceTypeEngagementWeight:];

    v25 = [v7 dynamicModelParameterDict];
    id v26 = [v25 objectForKeyedSubscript:&off_1002F5A38];
    [v26 floatValue];
    [v8 setPhotoMomentInterfaceTypeEngagementWeight];

    v27 = [v7 dynamicModelParameterDict];
    v28 = [v27 objectForKeyedSubscript:&off_1002F5A50];
    [v28 floatValue];
    [v8 setSignificantContactInterfaceTypeEngagementWeight:];

    v29 = [v7 dynamicModelParameterDict];
    v30 = [v29 objectForKeyedSubscript:&off_1002F5A68];
    [v30 floatValue];
    [v8 setYourMediaInterfaceTypeEngagementWeight:];

    v31 = [v7 dynamicModelParameterDict];
    v32 = [v31 objectForKeyedSubscript:&off_1002F5A80];
    [v32 floatValue];
    [v8 setYourSharedContentInterfaceTypeEngagementWeight:];

    v33 = [v7 dynamicModelParameterDict];
    v34 = [v33 objectForKeyedSubscript:&off_1002F5A98];
    [v34 floatValue];
    [v8 setYourTimeAtHomeInterfaceTypeEngagementWeight];

    v35 = [v7 dynamicModelParameterDict];
    v36 = [v35 objectForKeyedSubscript:&off_1002F5AB0];
    [v36 floatValue];
    [v8 setTopicsOfInterestInterfaceTypeEngagementWeight:];

    v37 = [v7 dynamicModelParameterDict];
    v38 = [v37 objectForKeyedSubscript:&off_1002F5AC8];
    [v38 floatValue];
    [v8 setTrendInterfaceTypeEngagementWeight:];

    v39 = [v7 dynamicModelParameterDict];
    v40 = [v39 objectForKeyedSubscript:&off_1002F5AE0];
    [v40 floatValue];
    [v8 setPhotoMemoryInterfaceTypeEngagementWeight:];

    v41 = [v7 dynamicModelParameterDict];
    v42 = [v41 objectForKeyedSubscript:&off_1002F5AF8];
    [v42 floatValue];
    [v8 setEvergreenInterfaceTypeEngagementWeight:];

    v43 = [v7 dynamicModelParameterDict];
    v44 = [v43 objectForKeyedSubscript:&off_1002F5B10];
    [v44 floatValue];
    [v8 setTimeContextInterfaceTypeEngagementWeight:];

    v45 = [v7 dynamicModelParameterDict];
    v46 = [v45 objectForKeyedSubscript:&off_1002F5B28];
    [v46 floatValue];
    [v8 setTripInterfaceTypeEngagementWeight:];

    v47 = [v7 dynamicModelParameterDict];
    v48 = [v47 objectForKeyedSubscript:&off_1002F5B40];
    [v48 floatValue];
    [v8 setStateOfMindInterfaceTypeEngagementWeight:];

    id v49 = [v7 dynamicModelParameterDict];

    v20 = [v49 objectForKeyedSubscript:&off_1002F5B58];
    [v20 floatValue];
    [v8 setClusteringInterfaceTypeEngagementWeight:];
  }
}

+ (void)managedObjectWithObject:(os_log_t)log inManagedObjectContext:forContext:forEvergreenScore:.cold.1(os_log_t log)
{
  int v1 = 136315394;
  v2 = "+[MORankingParamsMO managedObjectWithObject:inManagedObjectContext:forContext:forEvergreenScore:]";
  __int16 v3 = 1024;
  int v4 = 37;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Ranking params array size is 0 (in %s:%d)", (uint8_t *)&v1, 0x12u);
}

+ (void)managedObjectWithObject:(uint64_t)a1 inManagedObjectContext:(NSObject *)a2 forContext:forEvergreenScore:.cold.2(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Error reading ranking core data, %@", (uint8_t *)&v2, 0xCu);
}

@end