@interface WorldRegion
+ (BOOL)hasMultipleRegionsOfType:(unint64_t)a3 localeIdentifier:(id)a4 inDatabase:(id)a5;
+ (BOOL)hasRegionsMissingLocalizedContentForLocaleIdentifier:(id)a3 inDatabase:(id)a4;
+ (id)_predicateForCode:(id)a3;
+ (id)_predicateForIdentifier:(id)a3;
+ (id)_predicateForLatitude:(double)a3;
+ (id)_predicateForLocaleIdentifier:(id)a3;
+ (id)_predicateForLocalizedContent;
+ (id)_predicateForLongitude:(double)a3;
+ (id)_predicateForMUID:(id)a3;
+ (id)_predicateForName:(id)a3;
+ (id)_predicateForNamePattern:(id)a3;
+ (id)_predicateForPID:(id)a3;
+ (id)_predicateForParentPID:(id)a3;
+ (id)_predicateForTransaction:(id)a3;
+ (id)_predicateForType:(unint64_t)a3;
+ (id)anyInDatabase:(id)a3 withIdentifier:(id)a4;
+ (id)anyInDatabase:(id)a3 withPID:(id)a4;
+ (id)databaseTable;
+ (id)disambiguatedSQLForProperty:(id)a3;
+ (id)insertOrUpdateRegion:(id)a3 inDatabase:(id)a4;
+ (id)insertOrUpdateRegion:(id)a3 single:(BOOL)a4 inDatabase:(id)a5;
+ (id)lastRegionErrorForTransaction:(id)a3 inDatabase:(id)a4;
+ (id)regionWithIdentifier:(id)a3 localeIdentifier:(id)a4 inDatabase:(id)a5;
+ (id)regionsForTransactionPID:(int64_t)a3 localeIdentifier:(id)a4 inDatabase:(id)a5;
+ (id)regionsFromQuery:(id)a3;
+ (id)regionsFromQuery:(id)a3 additionalProperties:(id)a4;
+ (id)regionsMatchingName:(id)a3 types:(id)a4 localeIdentifier:(id)a5 inDatabase:(id)a6;
+ (id)regionsMissingLocalizedContentForLocaleIdentifier:(id)a3 inDatabase:(id)a4;
+ (id)regionsOfType:(unint64_t)a3 localeIdentifier:(id)a4 inDatabase:(id)a5;
+ (id)updateSingleRegion:(id)a3 inDatabase:(id)a4;
+ (void)addJoinClausesForProperty:(id)a3 toJoins:(id)a4;
+ (void)associateTransaction:(id)a3 withWorldRegion:(id)a4 inDatabase:(id)a5;
+ (void)deleteAllRegionsInDatabase:(id)a3;
+ (void)deleteRegionsWithNoMatchingTransactionsInDatabase:(id)a3;
+ (void)failedToAssociateTransaction:(id)a3 error:(id)a4 inDatabase:(id)a5;
+ (void)resetCoordinatesForAllRegionsInDatabase:(id)a3;
@end

@implementation WorldRegion

+ (id)databaseTable
{
  return @"world_region";
}

+ (id)anyInDatabase:(id)a3 withPID:(id)a4
{
  id v6 = a3;
  v7 = [a1 _predicateForPID:a4];
  v8 = [a1 anyInDatabase:v6 predicate:v7];

  return v8;
}

+ (id)anyInDatabase:(id)a3 withIdentifier:(id)a4
{
  id v6 = a3;
  v7 = [a1 _predicateForIdentifier:a4];
  v8 = [a1 anyInDatabase:v6 predicate:v7];

  return v8;
}

+ (id)regionsMatchingName:(id)a3 types:(id)a4 localeIdentifier:(id)a5 inDatabase:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v34 = a5;
  id v33 = a6;
  id v12 = objc_alloc_init((Class)NSMutableArray);
  p_superclass = (__objc2_class **)(&OBJC_METACLASS___PaymentTransactionTag + 8);
  if ([v11 count])
  {
    id v14 = objc_alloc_init((Class)NSMutableArray);
    long long v35 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    id v15 = v11;
    id v16 = [v15 countByEnumeratingWithState:&v35 objects:v43 count:16];
    if (v16)
    {
      id v17 = v16;
      uint64_t v18 = *(void *)v36;
      do
      {
        for (i = 0; i != v17; i = (char *)i + 1)
        {
          if (*(void *)v36 != v18) {
            objc_enumerationMutation(v15);
          }
          v20 = objc_msgSend(a1, "_predicateForType:", objc_msgSend(*(id *)(*((void *)&v35 + 1) + 8 * i), "integerValue"));
          [v14 addObject:v20];
        }
        id v17 = [v15 countByEnumeratingWithState:&v35 objects:v43 count:16];
      }
      while (v17);
    }

    p_superclass = &OBJC_METACLASS___PaymentTransactionTag.superclass;
    v21 = +[SQLiteCompoundPredicate predicateMatchingAnyPredicates:v14];
    [v12 addObject:v21];
  }
  if (v10)
  {
    v22 = [a1 _predicateForNamePattern:v10];
    [v12 addObject:v22];
  }
  v23 = [a1 _predicateForLocalizedContent];
  [v12 addObject:v23];

  v24 = [a1 _predicateForLocaleIdentifier:v34];
  [v12 addObject:v24];

  v25 = [p_superclass + 69 predicateMatchingAllPredicates:v12];
  CFStringRef v42 = @"count";
  v26 = +[NSArray arrayWithObjects:&v42 count:1];
  CFStringRef v41 = @"DESC";
  v27 = +[NSArray arrayWithObjects:&v41 count:1];
  CFStringRef v40 = @"pid";
  v28 = +[NSArray arrayWithObjects:&v40 count:1];
  v29 = [a1 queryWithDatabase:v33 predicate:v25 orderingProperties:v26 orderingDirections:v27 limit:0 groupingProperties:v28];

  v39[0] = @"world_region_mapping.world_region_pid";
  v39[1] = @"COUNT(*) as count";
  v30 = +[NSArray arrayWithObjects:v39 count:2];
  v31 = [a1 regionsFromQuery:v29 additionalProperties:v30];

  return v31;
}

+ (BOOL)hasMultipleRegionsOfType:(unint64_t)a3 localeIdentifier:(id)a4 inDatabase:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = objc_alloc_init((Class)NSMutableArray);
  id v11 = [a1 _predicateForType:a3];
  [v10 addObject:v11];

  id v12 = [a1 _predicateForLocalizedContent];
  [v10 addObject:v12];

  v13 = [a1 _predicateForLocaleIdentifier:v9];

  [v10 addObject:v13];
  id v14 = +[SQLiteCompoundPredicate predicateMatchingAllPredicates:v10];
  id v15 = [a1 queryWithDatabase:v8 predicate:v14];

  LOBYTE(v8) = (uint64_t)[v15 countOfEntities] > 1;
  return (char)v8;
}

+ (id)regionsOfType:(unint64_t)a3 localeIdentifier:(id)a4 inDatabase:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = objc_alloc_init((Class)NSMutableArray);
  id v11 = [a1 _predicateForType:a3];
  [v10 addObject:v11];

  id v12 = [a1 _predicateForLocalizedContent];
  [v10 addObject:v12];

  v13 = [a1 _predicateForLocaleIdentifier:v9];

  [v10 addObject:v13];
  id v14 = +[SQLiteCompoundPredicate predicateMatchingAllPredicates:v10];
  id v15 = [a1 queryWithDatabase:v8 predicate:v14];

  id v16 = [a1 regionsFromQuery:v15];

  return v16;
}

+ (id)updateSingleRegion:(id)a3 inDatabase:(id)a4
{
  return _[a1 insertOrUpdateRegion:a3 single:1 inDatabase:a4];
}

+ (id)insertOrUpdateRegion:(id)a3 inDatabase:(id)a4
{
  return _[a1 insertOrUpdateRegion:a3 single:0 inDatabase:a4];
}

+ (id)insertOrUpdateRegion:(id)a3 single:(BOOL)a4 inDatabase:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = a5;
  id v10 = [v8 identifier];
  if (!v10)
  {
    [v8 displayRegion];
    double v14 = v17;
    double v16 = v18;
    if (v6 && CLLocationCoordinate2DIsValid(*(CLLocationCoordinate2D *)&v17))
    {
      v19 = [a1 _predicateForLatitude:v14];
      v76[0] = v19;
      v20 = [a1 _predicateForLongitude:v16];
      v76[1] = v20;
      v21 = objc_msgSend(a1, "_predicateForType:", objc_msgSend(v8, "type"));
      v76[2] = v21;
      v22 = +[NSArray arrayWithObjects:v76 count:3];
      v23 = +[SQLiteCompoundPredicate predicateMatchingAllPredicates:v22];

      id v12 = [a1 anyInDatabase:v9 predicate:v23];
    }
    else
    {
      id v12 = 0;
    }
LABEL_8:
    v24 = objc_alloc_init((Class)NSMutableDictionary);
    v25 = [v8 parentRegion];
    if (v6)
    {
      if (!v12)
      {
        v26 = PKLogFacilityTypeGetObject();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          id v78 = v8;
          _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "No matching result for region %@ during single update", buf, 0xCu);
        }
        v27 = 0;
        goto LABEL_46;
      }
    }
    else if (!v12)
    {
      id v28 = objc_alloc_init((Class)NSMutableArray);
      if (v25)
      {
        v29 = [a1 insertOrUpdateRegion:v25 inDatabase:v9];
        v30 = v29;
        if (v29)
        {
          v31 = +[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", [v29 persistentID]);
          [a1 _predicateForParentPID:v31];
          id v33 = v32 = v25;
          [v28 addObject:v33];

          v25 = v32;
          [v24 setObjectOrNull:v31 forKey:@"parent_pid"];
        }
      }
      id v34 = [v8 abbreviationCode];

      if (v34)
      {
        long long v35 = [v8 abbreviationCode];
        [a1 _predicateForCode:v35];
      }
      else
      {
        long long v35 = [v8 localizedName];
        [a1 _predicateForName:v35];
      long long v36 = };
      [v28 addObject:v36];

      long long v37 = [v8 localeIdentifier];
      long long v38 = [a1 _predicateForLocaleIdentifier:v37];
      [v28 addObject:v38];

      v39 = objc_msgSend(a1, "_predicateForType:", objc_msgSend(v8, "type"));
      [v28 addObject:v39];

      CFStringRef v40 = +[SQLiteCompoundPredicate predicateMatchingAllPredicates:v28];
      id v12 = [a1 anyInDatabase:v9 predicate:v40];
    }
    CFStringRef v41 = [v8 abbreviationCode];
    [v24 setObjectOrNull:v41 forKey:@"abbreviation_code"];

    CFStringRef v42 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v8 type]);
    [v24 setObjectOrNull:v42 forKey:@"type"];

    [v8 displayRegion];
    double v44 = v43;
    double v46 = v45;
    p_cache = (void **)(&OBJC_METACLASS___WorldRegionLocalizedContent + 16);
    if (!v12)
    {
      v65 = +[NSUUID UUID];
      v66 = [v65 UUIDString];
      [v24 setObjectOrNull:v66 forKey:@"identifier"];

      v67 = +[NSNumber numberWithDouble:v14];
      [v24 setObjectOrNull:v67 forKey:@"latitude"];

      v68 = +[NSNumber numberWithDouble:v16];
      [v24 setObjectOrNull:v68 forKey:@"longitude"];

      v69 = +[NSNumber numberWithDouble:v44];
      [v24 setObjectOrNull:v69 forKey:@"latitude_delta"];

      v70 = +[NSNumber numberWithDouble:v46];
      [v24 setObjectOrNull:v70 forKey:@"longitude_delta"];

      v71 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", [v8 muid]);
      [v24 setObjectOrNull:v71 forKey:@"muid"];

      v72 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v8 resultProviderIdentifier]);
      [v24 setObjectOrNull:v72 forKey:@"result_provider_identifier"];

      id v12 = [objc_alloc((Class)a1) initWithPropertyValues:v24 inDatabase:v9];
      id v54 = [v8 localizedName];
LABEL_45:
      v73 = [v8 localeIdentifier];
      objc_msgSend(p_cache + 3, "insertName:localeIdentifier:forWorldRegionPID:inDatabase:", v54, v73, objc_msgSend(v12, "persistentID"), v9);

      v26 = v12;
      v27 = v26;
LABEL_46:

      goto LABEL_47;
    }
    v82.latitude = v14;
    v82.longitude = v16;
    if (CLLocationCoordinate2DIsValid(v82))
    {
      v48 = +[NSNumber numberWithDouble:v14];
      [v24 setObjectOrNull:v48 forKey:@"latitude"];

      v49 = +[NSNumber numberWithDouble:v16];
      [v24 setObjectOrNull:v49 forKey:@"longitude"];

      v50 = +[NSNumber numberWithDouble:v44];
      [v24 setObjectOrNull:v50 forKey:@"latitude_delta"];

      v51 = +[NSNumber numberWithDouble:v46];
      [v24 setObjectOrNull:v51 forKey:@"longitude_delta"];
    }
    if ([v8 muid])
    {
      v52 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", [v8 muid]);
      [v24 setObjectOrNull:v52 forKey:@"muid"];

      v53 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v8 resultProviderIdentifier]);
      [v24 setObjectOrNull:v53 forKey:@"result_provider_identifier"];
    }
    [v12 setValuesWithDictionary:v24];
    id v54 = [v8 localizedName];
    v55 = [v8 abbreviationCode];
    id v56 = [v55 length];

    if (!v56)
    {
LABEL_44:
      p_cache = &OBJC_METACLASS___WorldRegionLocalizedContent.cache;
      goto LABEL_45;
    }
    v75 = v25;
    v57 = [v12 valueForProperty:@"pid"];
    id v58 = [v57 longLongValue];
    v59 = [v8 localeIdentifier];
    v60 = +[WorldRegionLocalizedContent localizedNameForWorldRegionPID:v58 localeIdentifier:v59 inDatabase:v9];

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0 || ![v60 length])
    {
LABEL_43:

      v25 = v75;
      goto LABEL_44;
    }
    v61 = [v8 abbreviationCode];
    id v54 = v54;
    id v62 = v61;
    if (v54 == v62)
    {
    }
    else
    {
      v63 = v62;
      if (!v54 || !v62)
      {

        goto LABEL_42;
      }
      unsigned int v64 = [v54 isEqualToString:v62];

      if (!v64) {
        goto LABEL_43;
      }
    }
    v63 = v54;
    id v54 = v60;
LABEL_42:

    goto LABEL_43;
  }
  id v11 = [a1 _predicateForIdentifier:v10];
  id v12 = [a1 anyInDatabase:v9 predicate:v11];

  if (v12)
  {
    [v8 displayRegion];
    double v14 = v13;
    double v16 = v15;
    goto LABEL_8;
  }
  v24 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v78 = v10;
    __int16 v79 = 2048;
    id v80 = [v8 type];
    _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "No matching region for ID %@, type: %lu", buf, 0x16u);
  }
  v27 = 0;
LABEL_47:

  return v27;
}

+ (BOOL)hasRegionsMissingLocalizedContentForLocaleIdentifier:(id)a3 inDatabase:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v13 = 0;
  double v14 = &v13;
  uint64_t v15 = 0x2020000000;
  char v16 = 0;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10035B504;
  v10[3] = &unk_100732630;
  id v7 = v5;
  id v11 = v7;
  id v12 = &v13;
  sub_1000128B8((uint64_t)v6, @"SELECT world_region.pid FROM world_region WHERE world_region.type != 2 EXCEPT SELECT world_region.pid FROM world_region JOIN world_region_localized_content AS lc ON lc.world_region_pid = world_region.pid WHERE world_region.type != 2 AND lc.locale_identifier = ? AND (lc.status == 1 OR (lc.status == 0 AND (world_region.abbreviation_code IS NULL AND lc.name IS NOT NULL) OR (world_region.abbreviation_code IS NOT NULL AND lc.name != world_region.abbreviation_code))) LIMIT ?", 1, v10);
  char v8 = *((unsigned char *)v14 + 24);

  _Block_object_dispose(&v13, 8);
  return v8;
}

+ (id)regionsMissingLocalizedContentForLocaleIdentifier:(id)a3 inDatabase:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v13 = _NSConcreteStackBlock;
  uint64_t v14 = 3221225472;
  uint64_t v15 = sub_10035B69C;
  char v16 = &unk_10074ADD0;
  id v17 = v6;
  id v18 = objc_alloc_init((Class)NSMutableArray);
  id v19 = v7;
  id v20 = a1;
  id v8 = v7;
  id v9 = v18;
  id v10 = v6;
  sub_1000128B8((uint64_t)v8, @"SELECT world_region.pid FROM world_region WHERE world_region.type != 2 EXCEPT SELECT world_region.pid FROM world_region JOIN world_region_localized_content AS lc ON lc.world_region_pid = world_region.pid WHERE world_region.type != 2 AND lc.locale_identifier = ? AND (lc.status == 1 OR (lc.status == 0 AND (world_region.abbreviation_code IS NULL AND lc.name IS NOT NULL) OR (world_region.abbreviation_code IS NOT NULL AND lc.name != world_region.abbreviation_code)))", 1, &v13);
  id v11 = objc_msgSend(v9, "copy", v13, v14, v15, v16);

  return v11;
}

+ (id)regionsForTransactionPID:(int64_t)a3 localeIdentifier:(id)a4 inDatabase:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  +[NSNumber numberWithLongLong:a3];
  if (v8) {
    id v10 = {;
  }
    id v11 = [a1 _predicateForTransaction:v10];
    v19[0] = v11;
    id v12 = [a1 _predicateForLocaleIdentifier:v8];
    v19[1] = v12;
    uint64_t v13 = +[NSArray arrayWithObjects:v19 count:2];
    uint64_t v14 = +[SQLiteCompoundPredicate predicateMatchingAllPredicates:v13];
  }
  else {
    uint64_t v15 = {;
  }
    uint64_t v14 = [a1 _predicateForTransaction:v15];
  }
  char v16 = [a1 queryWithDatabase:a5 predicate:v14];

  id v17 = [a1 regionsFromQuery:v16];

  return v17;
}

+ (id)regionWithIdentifier:(id)a3 localeIdentifier:(id)a4 inDatabase:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = objc_alloc_init((Class)NSMutableArray);
  if (v9)
  {
    id v12 = [a1 _predicateForLocaleIdentifier:v9];
    [v11 addObject:v12];
  }
  uint64_t v13 = [a1 _predicateForIdentifier:v8];
  [v11 addObject:v13];

  uint64_t v14 = +[SQLiteCompoundPredicate predicateMatchingAllPredicates:v11];
  uint64_t v15 = [a1 queryWithDatabase:v10 predicate:v14];

  char v16 = [a1 regionsFromQuery:v15];
  id v17 = [v16 firstObject];

  return v17;
}

+ (id)regionsFromQuery:(id)a3
{
  return [a1 regionsFromQuery:a3 additionalProperties:0];
}

+ (id)regionsFromQuery:(id)a3 additionalProperties:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v22[0] = @"type";
  v22[1] = @"latitude";
  v22[2] = @"longitude";
  v22[3] = @"latitude_delta";
  v22[4] = @"longitude_delta";
  v22[5] = @"abbreviation_code";
  v22[6] = @"world_region_localized_content.name";
  v22[7] = @"world_region_localized_content.locale_identifier";
  v22[8] = @"identifier";
  v22[9] = @"parent_pid";
  id v8 = +[NSArray arrayWithObjects:v22 count:10];
  if ([v7 count])
  {
    uint64_t v9 = [v8 arrayByAddingObjectsFromArray:v7];

    id v8 = (void *)v9;
  }
  uint64_t v15 = _NSConcreteStackBlock;
  uint64_t v16 = 3221225472;
  id v17 = sub_10035BC60;
  id v18 = &unk_10072EAD8;
  id v20 = objc_alloc_init((Class)NSMutableArray);
  id v21 = a1;
  id v19 = v6;
  id v10 = v20;
  id v11 = v6;
  [v11 enumeratePersistentIDsAndProperties:v8 usingBlock:&v15];
  if (objc_msgSend(v10, "count", v15, v16, v17, v18)) {
    id v12 = v10;
  }
  else {
    id v12 = 0;
  }
  id v13 = v12;

  return v13;
}

+ (id)lastRegionErrorForTransaction:(id)a3 inDatabase:(id)a4
{
  id v5 = a4;
  id v6 = +[WorldRegionMapping errorForTransactionPID:inDatabase:](WorldRegionMapping, "errorForTransactionPID:inDatabase:", [a3 persistentID], v5);

  return v6;
}

+ (void)associateTransaction:(id)a3 withWorldRegion:(id)a4 inDatabase:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  +[WorldRegionMapping insertMatchForWorldRegion:transactionPID:inDatabase:](WorldRegionMapping, "insertMatchForWorldRegion:transactionPID:inDatabase:", v8, [a3 persistentID], v7);
}

+ (void)failedToAssociateTransaction:(id)a3 error:(id)a4 inDatabase:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  +[WorldRegionMapping increaseFailureCountForTransactionPID:error:inDatabase:](WorldRegionMapping, "increaseFailureCountForTransactionPID:error:inDatabase:", [a3 persistentID], v8, v7);
}

+ (void)deleteAllRegionsInDatabase:(id)a3
{
  id v4 = a3;
  id v5 = +[SQLiteBooleanPredicate truePredicate];
  id v6 = [a1 queryWithDatabase:v4 predicate:v5];

  [v6 deleteAllEntities];
}

+ (void)resetCoordinatesForAllRegionsInDatabase:(id)a3
{
  CLLocationCoordinate2D v4 = kCLLocationCoordinate2DInvalid;
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_10035C180;
  v3[3] = &unk_10074ADF0;
  sub_100012DC8((uint64_t)a3, @"UPDATE world_region SET latitude=?, longitude=?", v3);
}

+ (void)deleteRegionsWithNoMatchingTransactionsInDatabase:(id)a3
{
  sub_10000C100((BOOL)a3, @"DELETE FROM world_region WHERE pid IN (SELECT world_region.pid from world_region LEFT JOIN world_region AS world_region2 ON world_region.pid = world_region2.parent_pid LEFT JOIN world_region_mapping AS map ON map.world_region_pid = world_region.pid WHERE world_region2.pid IS NULL AND map.pid IS NULL)");
}

+ (void)addJoinClausesForProperty:(id)a3 toJoins:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = (__CFString *)v5;
  v22 = v7;
  if (v7 == @"world_region_localized_content.name") {
    goto LABEL_8;
  }
  if (!v7) {
    goto LABEL_10;
  }
  unsigned __int8 v8 = [(__CFString *)v7 isEqualToString:@"world_region_localized_content.name"];

  if (v8) {
    goto LABEL_8;
  }
  uint64_t v9 = v22;
  if (v9 == @"world_region_localized_content.locale_identifier"
    || (id v10 = v9,
        unsigned __int8 v11 = [(__CFString *)v9 isEqualToString:@"world_region_localized_content.locale_identifier"], v10, (v11 & 1) != 0)|| (v12 = v10, v12 == @"world_region_localized_content.status")|| (v13 = v12, v14 = [(__CFString *)v12 isEqualToString:@"world_region_localized_content.status"], v13, (v14 & 1) != 0))
  {
LABEL_8:
    CFStringRef v15 = @"JOIN world_region_localized_content ON world_region_localized_content.world_region_pid = world_region.pid";
LABEL_9:
    [v6 addObject:v15];
    goto LABEL_10;
  }
  uint64_t v16 = v13;
  if (v16 == @"world_region_mapping.payment_transaction_pid"
    || (id v17 = v16,
        unsigned __int8 v18 = [(__CFString *)v16 isEqualToString:@"world_region_mapping.payment_transaction_pid"], v17, (v18 & 1) != 0))
  {
    CFStringRef v15 = @"JOIN world_region_mapping ON world_region_mapping.world_region_pid = world_region.pid";
    goto LABEL_9;
  }
  id v19 = v17;
  if (v19 == @"world_region_mapping.world_region_pid"
    || (id v20 = v19,
        unsigned int v21 = [(__CFString *)v19 isEqualToString:@"world_region_mapping.world_region_pid"], v20, v21))
  {
    CFStringRef v15 = @"LEFT JOIN world_region_mapping ON world_region_mapping.world_region_pid = world_region.pid";
    goto LABEL_9;
  }
LABEL_10:
}

+ (id)disambiguatedSQLForProperty:(id)a3
{
  CLLocationCoordinate2D v4 = (__CFString *)a3;
  id v5 = v4;
  if (v4 == @"count"
    || v4
    && ((unsigned __int8 v6 = [(__CFString *)v4 isEqualToString:@"count"],
         v5,
         (v6 & 1) != 0)
     || (id v7 = v5, v7 == @"COUNT(*) as count")
     || (unsigned __int8 v8 = v7,
         unsigned int v9 = [(__CFString *)v7 isEqualToString:@"COUNT(*) as count"],
         v8,
         v9)))
  {
    id v10 = v5;
  }
  else
  {
    v13.receiver = a1;
    v13.super_class = (Class)&OBJC_METACLASS___WorldRegion;
    objc_msgSendSuper2(&v13, "disambiguatedSQLForProperty:", v5);
    id v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  unsigned __int8 v11 = v10;

  return v11;
}

+ (id)_predicateForIdentifier:(id)a3
{
  return +[SQLiteComparisonPredicate predicateWithProperty:@"identifier" equalToValue:a3];
}

+ (id)_predicateForPID:(id)a3
{
  return +[SQLiteComparisonPredicate predicateWithProperty:@"pid" equalToValue:a3];
}

+ (id)_predicateForParentPID:(id)a3
{
  return +[SQLiteComparisonPredicate predicateWithProperty:@"parent_pid" equalToValue:a3];
}

+ (id)_predicateForMUID:(id)a3
{
  return +[SQLiteComparisonPredicate predicateWithProperty:@"muid" equalToValue:a3];
}

+ (id)_predicateForType:(unint64_t)a3
{
  v3 = +[NSNumber numberWithUnsignedInteger:a3];
  CLLocationCoordinate2D v4 = +[SQLiteComparisonPredicate predicateWithProperty:@"type" equalToValue:v3];

  return v4;
}

+ (id)_predicateForLatitude:(double)a3
{
  v3 = +[NSNumber numberWithDouble:a3];
  CLLocationCoordinate2D v4 = +[SQLiteComparisonPredicate predicateWithProperty:@"latitude" equalToValue:v3];

  return v4;
}

+ (id)_predicateForLongitude:(double)a3
{
  v3 = +[NSNumber numberWithDouble:a3];
  CLLocationCoordinate2D v4 = +[SQLiteComparisonPredicate predicateWithProperty:@"longitude" equalToValue:v3];

  return v4;
}

+ (id)_predicateForCode:(id)a3
{
  return +[SQLiteComparisonPredicate predicateWithProperty:@"abbreviation_code" equalToValue:a3];
}

+ (id)_predicateForLocalizedContent
{
  return +[SQLiteComparisonPredicate predicateWithProperty:@"world_region_localized_content.status" equalToValue:&off_10078B7A8];
}

+ (id)_predicateForName:(id)a3
{
  return +[SQLiteComparisonPredicate predicateWithProperty:@"world_region_localized_content.name" equalToValue:a3];
}

+ (id)_predicateForNamePattern:(id)a3
{
  id v3 = a3;
  if ([v3 length])
  {
    CLLocationCoordinate2D v4 = +[NSString stringWithFormat:@"%@%%", v3];
    id v5 = +[SQLiteStringLikePredicate predicateWithProperty:@"world_region_localized_content.name" matchingPattern:v4];

    unsigned __int8 v6 = +[NSString stringWithFormat:@"%% %@%%", v3];
    id v7 = +[SQLiteStringLikePredicate predicateWithProperty:@"world_region_localized_content.name" matchingPattern:v6];

    v11[0] = v5;
    v11[1] = v7;
    unsigned __int8 v8 = +[NSArray arrayWithObjects:v11 count:2];
    unsigned int v9 = +[SQLiteCompoundPredicate predicateMatchingAnyPredicates:v8];
  }
  else
  {
    unsigned int v9 = +[SQLiteBooleanPredicate truePredicate];
  }

  return v9;
}

+ (id)_predicateForLocaleIdentifier:(id)a3
{
  return +[SQLiteComparisonPredicate predicateWithProperty:@"world_region_localized_content.locale_identifier" equalToValue:a3];
}

+ (id)_predicateForTransaction:(id)a3
{
  return +[SQLiteComparisonPredicate predicateWithProperty:@"world_region_mapping.payment_transaction_pid" equalToValue:a3];
}

@end