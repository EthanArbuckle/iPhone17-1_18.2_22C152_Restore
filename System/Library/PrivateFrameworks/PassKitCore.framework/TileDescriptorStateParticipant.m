@interface TileDescriptorStateParticipant
+ (BOOL)removeParticipantsForPassUniqueID:(id)a3 inDatabase:(id)a4;
+ (BOOL)setPassTileDescriptorStateParticipantIDs:(id)a3 forPassUniqueID:(id)a4 inDatabase:(id)a5;
+ (id)_predicateForParticipantID:(id)a3;
+ (id)_predicateForPassUniqueID:(id)a3;
+ (id)databaseTable;
+ (id)passUniqueIdentifiersForTileDescriptorStateParticipantWithIdentifier:(id)a3 inDatabase:(id)a4;
+ (id)passUniqueIdentifiersInDatabase:(id)a3;
+ (void)addJoinClausesForProperty:(id)a3 toJoins:(id)a4;
- (id)_initWitParticipantID:(id)a3 forPass:(id)a4 inDatabase:(id)a5;
@end

@implementation TileDescriptorStateParticipant

+ (id)databaseTable
{
  return @"pass_tile_descriptor_state_participant";
}

+ (void)addJoinClausesForProperty:(id)a3 toJoins:(id)a4
{
  id v5 = a4;
  if ([a3 isEqualToString:@"pass.unique_id"]) {
    [v5 addObject:@"JOIN pass ON pass_tile_descriptor_state_participant.pass_pid = pass.pid"];
  }
}

- (id)_initWitParticipantID:(id)a3 forPass:(id)a4 inDatabase:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = objc_alloc_init((Class)NSMutableDictionary);
  [v11 setObjectOrNull:v10 forKey:@"participant_identifier"];

  [v11 setEntityPIDOrNull:v9 forKey:@"pass_pid"];
  v12 = [(SQLiteEntity *)self initWithPropertyValues:v11 inDatabase:v8];

  return v12;
}

+ (id)passUniqueIdentifiersInDatabase:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init((Class)NSMutableSet);
  v6 = [a1 queryWithDatabase:v4 predicate:0];

  CFStringRef v13 = @"pass.unique_id";
  v7 = +[NSArray arrayWithObjects:&v13 count:1];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100089EE4;
  v11[3] = &unk_1007329C0;
  id v8 = v5;
  id v12 = v8;
  [v6 enumerateProperties:v7 usingBlock:v11];

  if ([v8 count]) {
    id v9 = [v8 copy];
  }
  else {
    id v9 = 0;
  }

  return v9;
}

+ (id)passUniqueIdentifiersForTileDescriptorStateParticipantWithIdentifier:(id)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = objc_alloc_init((Class)NSMutableSet);
  id v9 = [a1 _predicateForParticipantID:v7];

  id v10 = [a1 queryWithDatabase:v6 predicate:v9];

  CFStringRef v17 = @"pass.unique_id";
  id v11 = +[NSArray arrayWithObjects:&v17 count:1];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10008A084;
  v15[3] = &unk_1007329C0;
  id v12 = v8;
  id v16 = v12;
  [v10 enumerateProperties:v11 usingBlock:v15];

  if ([v12 count]) {
    id v13 = [v12 copy];
  }
  else {
    id v13 = 0;
  }

  return v13;
}

+ (BOOL)setPassTileDescriptorStateParticipantIDs:(id)a3 forPassUniqueID:(id)a4 inDatabase:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v20 = 0;
  v21 = &v20;
  uint64_t v22 = 0x2020000000;
  char v23 = 0;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_10008A1C8;
  v14[3] = &unk_10072E090;
  id v10 = a5;
  id v15 = v10;
  id v11 = v9;
  id v16 = v11;
  id v19 = a1;
  id v12 = v8;
  id v17 = v12;
  v18 = &v20;
  sub_10000817C((uint64_t)v10, v14);
  LOBYTE(v8) = *((unsigned char *)v21 + 24);

  _Block_object_dispose(&v20, 8);
  return (char)v8;
}

+ (BOOL)removeParticipantsForPassUniqueID:(id)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v7 = [a1 _predicateForPassUniqueID:a3];
  id v8 = [a1 queryWithDatabase:v6 predicate:v7];

  LOBYTE(v6) = [v8 deleteAllEntities];
  return (char)v6;
}

+ (id)_predicateForParticipantID:(id)a3
{
  return +[SQLiteComparisonPredicate predicateWithProperty:@"participant_identifier" equalToValue:a3];
}

+ (id)_predicateForPassUniqueID:(id)a3
{
  return +[SQLiteComparisonPredicate predicateWithProperty:@"pass.unique_id" equalToValue:a3];
}

@end