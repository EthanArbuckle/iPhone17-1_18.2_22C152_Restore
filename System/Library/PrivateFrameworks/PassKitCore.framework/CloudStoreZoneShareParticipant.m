@interface CloudStoreZoneShareParticipant
+ (id)_predicateForCloudStoreZonePID:(int64_t)a3;
+ (id)_predicateForParticipantHandle:(id)a3;
+ (id)_predicateForParticipantHandle:(id)a3 cloudStoreZonePID:(int64_t)a4;
+ (id)_propertySettersForCloudStoreZoneShareParticipant;
+ (id)_zoneShareParticipantWithHandle:(id)a3 forCloudStoreZone:(id)a4 inDatabase:(id)a5;
+ (id)anyInDatabase:(id)a3 withShareParticipant:(id)a4 inCloudStoreZone:(id)a5;
+ (id)databaseTable;
+ (id)insertOrUpdateCloudStoreZoneShareParticipant:(id)a3 forCloudStoreZone:(id)a4 inDatabase:(id)a5;
+ (id)shareParticipantsForCloudStoreZonePID:(int64_t)a3 inDatabase:(id)a4;
+ (void)deleteEntitiesForCloudStoreZone:(id)a3 inDatabase:(id)a4;
+ (void)updateShareParticipants:(id)a3 forCloudStoreZone:(id)a4 inDatabase:(id)a5;
- (CloudStoreZoneShareParticipant)initWithCloudStoreZoneShareParticipant:(id)a3 forCloudStoreZone:(id)a4 inDatabase:(id)a5;
- (id)_commonDictionaryForCloudStoreZoneShareParticipant:(id)a3;
- (id)cloudStoreZoneShareParticipant;
- (void)updateWithCloudStoreZoneShareParticipant:(id)a3;
@end

@implementation CloudStoreZoneShareParticipant

+ (id)databaseTable
{
  return @"cloud_store_zone_share_participant";
}

+ (id)insertOrUpdateCloudStoreZoneShareParticipant:(id)a3 forCloudStoreZone:(id)a4 inDatabase:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = [v8 participantHandle];
  id v12 = [a1 _zoneShareParticipantWithHandle:v11 forCloudStoreZone:v9 inDatabase:v10];

  if (v12) {
    [v12 updateWithCloudStoreZoneShareParticipant:v8];
  }
  else {
    id v12 = [objc_alloc((Class)a1) initWithCloudStoreZoneShareParticipant:v8 forCloudStoreZone:v9 inDatabase:v10];
  }

  return v12;
}

- (CloudStoreZoneShareParticipant)initWithCloudStoreZoneShareParticipant:(id)a3 forCloudStoreZone:(id)a4 inDatabase:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = [(CloudStoreZoneShareParticipant *)self _commonDictionaryForCloudStoreZoneShareParticipant:a3];
  id v11 = [v8 persistentID];

  id v12 = +[NSNumber numberWithLongLong:v11];
  [v10 setObjectOrNull:v12 forKey:@"cloud_store_zone_pid"];

  v13 = [(SQLiteEntity *)self initWithPropertyValues:v10 inDatabase:v9];
  return v13;
}

+ (void)updateShareParticipants:(id)a3 forCloudStoreZone:(id)a4 inDatabase:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = objc_alloc_init((Class)NSMutableSet);
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id obj = v8;
  id v12 = [obj countByEnumeratingWithState:&v26 objects:v31 count:16];
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v27;
    do
    {
      v15 = 0;
      do
      {
        if (*(void *)v27 != v14) {
          objc_enumerationMutation(obj);
        }
        v16 = [a1 insertOrUpdateCloudStoreZoneShareParticipant:*(void *)(*((void *)&v26 + 1) + 8 * (void)v15) forCloudStoreZone:v9 inDatabase:v10];
        v17 = +[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", [v16 persistentID]);
        [v11 addObject:v17];

        v15 = (char *)v15 + 1;
      }
      while (v13 != v15);
      id v13 = [obj countByEnumeratingWithState:&v26 objects:v31 count:16];
    }
    while (v13);
  }

  v18 = +[SQLiteContainsPredicate doesNotContainPredicateWithProperty:@"pid" values:v11];
  v30[0] = v18;
  v19 = objc_msgSend(a1, "_predicateForCloudStoreZonePID:", objc_msgSend(v9, "persistentID"));
  v30[1] = v19;
  v20 = +[NSArray arrayWithObjects:v30 count:2];
  v21 = +[SQLiteCompoundPredicate predicateMatchingAllPredicates:v20];

  id v22 = a1;
  v23 = v10;
  v24 = [v22 queryWithDatabase:v10 predicate:v21];
  [v24 deleteAllEntities];
}

- (void)updateWithCloudStoreZoneShareParticipant:(id)a3
{
  id v4 = a3;
  id v6 = [(CloudStoreZoneShareParticipant *)self _commonDictionaryForCloudStoreZoneShareParticipant:v4];
  v5 = [v4 invitationToken];

  if (!v5) {
    [v6 removeObjectForKey:@"invitation_token"];
  }
  [(SQLiteEntity *)self setValuesWithDictionary:v6];
}

+ (id)_zoneShareParticipantWithHandle:(id)a3 forCloudStoreZone:(id)a4 inDatabase:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  id v10 = objc_msgSend(a1, "_predicateForParticipantHandle:cloudStoreZonePID:", v9, objc_msgSend(a4, "persistentID"));

  id v11 = [a1 anyInDatabase:v8 predicate:v10];

  return v11;
}

+ (id)anyInDatabase:(id)a3 withShareParticipant:(id)a4 inCloudStoreZone:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  id v10 = [a4 participantHandle];
  id v11 = [v8 persistentID];

  id v12 = [a1 _predicateForParticipantHandle:v10 cloudStoreZonePID:v11];
  id v13 = [a1 anyInDatabase:v9 predicate:v12];

  return v13;
}

+ (id)shareParticipantsForCloudStoreZonePID:(int64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v7 = objc_alloc_init((Class)NSMutableSet);
  id v8 = [a1 _predicateForCloudStoreZonePID:a3];
  id v9 = [a1 queryWithDatabase:v6 predicate:v8];

  uint64_t v14 = _NSConcreteStackBlock;
  uint64_t v15 = 3221225472;
  v16 = sub_1003C03E0;
  v17 = &unk_10072ED00;
  id v18 = v6;
  id v19 = v7;
  id v10 = v7;
  id v11 = v6;
  [v9 enumeratePersistentIDsAndProperties:0 usingBlock:&v14];
  id v12 = objc_msgSend(v10, "copy", v14, v15, v16, v17);

  return v12;
}

+ (id)_predicateForParticipantHandle:(id)a3
{
  return +[SQLiteComparisonPredicate predicateWithProperty:@"participant_handle" equalToValue:a3];
}

+ (id)_predicateForCloudStoreZonePID:(int64_t)a3
{
  v3 = +[NSNumber numberWithLongLong:a3];
  id v4 = +[SQLiteComparisonPredicate predicateWithProperty:@"cloud_store_zone_pid" equalToValue:v3];

  return v4;
}

+ (id)_predicateForParticipantHandle:(id)a3 cloudStoreZonePID:(int64_t)a4
{
  id v6 = [a1 _predicateForParticipantHandle:a3];
  v11[0] = v6;
  id v7 = [a1 _predicateForCloudStoreZonePID:a4];
  v11[1] = v7;
  id v8 = +[NSArray arrayWithObjects:v11 count:2];
  id v9 = +[SQLiteCompoundPredicate predicateMatchingAllPredicates:v8];

  return v9;
}

+ (void)deleteEntitiesForCloudStoreZone:(id)a3 inDatabase:(id)a4
{
  id v6 = a4;
  objc_msgSend(a1, "_predicateForCloudStoreZonePID:", objc_msgSend(a3, "persistentID"));
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  id v7 = [a1 queryWithDatabase:v6 predicate:v8];

  [v7 deleteAllEntities];
}

- (id)cloudStoreZoneShareParticipant
{
  id v3 = objc_alloc_init((Class)PKCloudStoreZoneShareParticipant);
  id v4 = +[CloudStoreZoneShareParticipant _propertySettersForCloudStoreZoneShareParticipant];
  v5 = [v4 allKeys];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  void v11[2] = sub_1003C0758;
  v11[3] = &unk_10072DDD8;
  v11[4] = self;
  id v12 = v4;
  id v6 = v3;
  id v13 = v6;
  id v7 = v4;
  [(SQLiteEntity *)self getValuesForProperties:v5 withApplier:v11];

  id v8 = v13;
  id v9 = v6;

  return v9;
}

- (id)_commonDictionaryForCloudStoreZoneShareParticipant:(id)a3
{
  id v3 = a3;
  id v4 = +[NSMutableDictionary dictionary];
  v5 = [v3 participantHandle];
  [v4 setObjectOrNull:v5 forKey:@"participant_handle"];

  id v6 = [v3 lookupInfoData];
  [v4 setObjectOrNull:v6 forKey:@"lookup_info"];

  id v7 = [v3 invitationTokenData];

  [v4 setObjectOrNull:v7 forKey:@"invitation_token"];
  return v4;
}

+ (id)_propertySettersForCloudStoreZoneShareParticipant
{
  v4[0] = @"participant_handle";
  v4[1] = @"lookup_info";
  v5[0] = &stru_10074E880;
  v5[1] = &stru_10074E8A0;
  v4[2] = @"invitation_token";
  v5[2] = &stru_10074E8C0;
  v2 = +[NSDictionary dictionaryWithObjects:v5 forKeys:v4 count:3];
  return v2;
}

@end