@interface TileDescriptor
+ (id)_createDescriptorForPID:(int64_t)a3 withProperties:(id)a4 values:(const void *)a5 propertySetters:(id)a6 indices:(id)a7 inDatabase:(id)a8;
+ (id)_createDescriptorStatePairForPID:(int64_t)a3 withProperties:(id)a4 values:(const void *)a5 propertySetters:(id)a6 indices:(id)a7 inDatabase:(id)a8 supportGroups:(BOOL)a9;
+ (id)_createUpdatedDescriptorPairForPID:(int64_t)a3 transform:(id)a4 withProperties:(id)a5 values:(const void *)a6 propertySetters:(id)a7 indices:(id)a8 inDatabase:(id)a9 updated:(BOOL *)a10 supportGroups:(BOOL)a11;
+ (id)_predicateForContext:(int64_t)a3;
+ (id)_predicateForGroupDescriptorPID:(unint64_t)a3;
+ (id)_predicateForNullGroupID;
+ (id)_predicateForPassPID:(unint64_t)a3;
+ (id)_predicateForPassUniqueID:(id)a3;
+ (id)_propertySettersWithProperties:(id)a3 effectiveProperties:(id *)a4 indices:(id *)a5;
+ (id)_tileDescriptorQueryWithPredicate:(id)a3 inDatabase:(id)a4;
+ (id)databaseTable;
+ (id)descriptorsInDatabase:(id)a3 forPassUniqueID:(id)a4 context:(int64_t)a5;
+ (id)insertDescriptor:(id)a3 groupDescriptor:(id)a4 withState:(id)a5 order:(int64_t)a6 forPass:(id)a7 inDatabase:(id)a8;
+ (id)updatePassTileDescriptorStatesInDatabase:(id)a3 forPassUniqueID:(id)a4 forContext:(int64_t)a5 withTransform:(id)a6;
+ (void)_deleteEntitiesForGroupDescriptor:(id)a3 inDatabase:(id)a4;
+ (void)addJoinClausesForProperty:(id)a3 toJoins:(id)a4;
+ (void)deleteEntitiesForPassPID:(unint64_t)a3 inDatabase:(id)a4;
- (BOOL)deleteFromDatabase;
- (TileDescriptor)initWithDescriptor:(id)a3 groupDescriptor:(id)a4 metadata:(id)a5 state:(id)a6 order:(int64_t)a7 forPass:(id)a8 inDatabase:(id)a9;
- (id)metadata;
- (id)state;
@end

@implementation TileDescriptor

+ (id)databaseTable
{
  return @"pass_tile_descriptor";
}

+ (void)addJoinClausesForProperty:(id)a3 toJoins:(id)a4
{
  id v7 = a3;
  id v5 = a4;
  if ([v7 isEqualToString:@"pass.unique_id"])
  {
    CFStringRef v6 = @"JOIN pass ON pass_tile_descriptor.pass_pid = pass.pid";
  }
  else
  {
    if (![v7 isEqualToString:@"pass_tile_metadata.context_identifier"]) {
      goto LABEL_6;
    }
    CFStringRef v6 = @"JOIN pass_tile_metadata ON pass_tile_descriptor.metadata_pid = pass_tile_metadata.pid";
  }
  [v5 addObject:v6];
LABEL_6:
}

- (TileDescriptor)initWithDescriptor:(id)a3 groupDescriptor:(id)a4 metadata:(id)a5 state:(id)a6 order:(int64_t)a7 forPass:(id)a8 inDatabase:(id)a9
{
  id v14 = a9;
  id v15 = a8;
  id v16 = a6;
  id v17 = a5;
  id v18 = a4;
  id v19 = a3;
  id v20 = objc_alloc_init((Class)NSMutableDictionary);
  [v20 setEntityPIDOrNull:v17 forKey:@"metadata_pid"];

  [v20 setEntityPIDOrNull:v16 forKey:@"state_pid"];
  [v20 setEntityPIDOrNull:v15 forKey:@"pass_pid"];

  [v20 setEntityPIDOrNull:v18 forKey:@"group_descriptor_pid"];
  v21 = [v19 defaultStateIdentifier];
  [v20 setObjectOrNull:v21 forKey:@"default_state_identifier"];

  id v22 = [v19 isDefaultEnabled];
  [v20 setBool:v22 forKey:@"default_state_enabled"];
  [v20 setInteger:a7 forKey:@"internal_tile_order"];
  v23 = [(SQLiteEntity *)self initWithPropertyValues:v20 inDatabase:v14];

  return v23;
}

+ (id)insertDescriptor:(id)a3 groupDescriptor:(id)a4 withState:(id)a5 order:(int64_t)a6 forPass:(id)a7 inDatabase:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a7;
  id v18 = a8;
  if (v17)
  {
    uint64_t v30 = 0;
    v31 = &v30;
    uint64_t v32 = 0x3032000000;
    v33 = sub_100020DBC;
    v34 = sub_1000211D0;
    id v35 = 0;
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_100428648;
    v21[3] = &unk_100750908;
    id v22 = v14;
    id v23 = v18;
    id v24 = v16;
    v27 = &v30;
    id v28 = a1;
    id v25 = v15;
    int64_t v29 = a6;
    id v26 = v17;
    sub_10000817C((uint64_t)v23, v21);
    id v19 = (id)v31[5];

    _Block_object_dispose(&v30, 8);
  }
  else
  {
    id v19 = 0;
  }

  return v19;
}

+ (id)descriptorsInDatabase:(id)a3 forPassUniqueID:(id)a4 context:(int64_t)a5
{
  id v8 = a3;
  id v22 = a4;
  id v36 = 0;
  long long v35 = 0uLL;
  CFStringRef v38 = @"state_pid";
  v9 = +[NSArray arrayWithObjects:&v38 count:1];
  v10 = +[TileDescriptor _propertySettersWithProperties:v9 effectiveProperties:&v36 indices:&v35];

  v11 = [a1 _predicateForPassUniqueID:v22];
  v37[0] = v11;
  v12 = [a1 _predicateForNullGroupID];
  v37[1] = v12;
  v13 = [a1 _predicateForContext:a5];
  v37[2] = v13;
  id v14 = +[NSArray arrayWithObjects:v37 count:3];
  id v15 = +[SQLiteCompoundPredicate predicateMatchingAllPredicates:v14];

  id v16 = [a1 _tileDescriptorQueryWithPredicate:v15 inDatabase:v8];
  uint64_t v29 = 0;
  uint64_t v30 = &v29;
  uint64_t v31 = 0x3032000000;
  uint64_t v32 = sub_100020DBC;
  v33 = sub_1000211D0;
  id v34 = 0;
  id v17 = v36;
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_100428A4C;
  v23[3] = &unk_100740CD8;
  id v26 = &v29;
  id v27 = a1;
  id v18 = v10;
  id v24 = v18;
  long long v28 = v35;
  id v19 = v8;
  id v25 = v19;
  [v16 enumeratePersistentIDsAndProperties:v17 usingBlock:v23];
  id v20 = [(id)v30[5] copy];

  _Block_object_dispose(&v29, 8);
  return v20;
}

+ (id)updatePassTileDescriptorStatesInDatabase:(id)a3 forPassUniqueID:(id)a4 forContext:(int64_t)a5 withTransform:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  uint64_t v28 = 0;
  uint64_t v29 = &v28;
  uint64_t v30 = 0x3032000000;
  uint64_t v31 = sub_100020DBC;
  uint64_t v32 = sub_1000211D0;
  id v33 = 0;
  id v18 = _NSConcreteStackBlock;
  uint64_t v19 = 3221225472;
  id v20 = sub_100428CB4;
  v21 = &unk_100750958;
  id v26 = a1;
  id v13 = v11;
  id v22 = v13;
  int64_t v27 = a5;
  id v14 = v10;
  id v23 = v14;
  id v25 = &v28;
  id v15 = v12;
  id v24 = v15;
  sub_10000817C((uint64_t)v14, &v18);
  id v16 = objc_msgSend((id)v29[5], "copy", v18, v19, v20, v21);

  _Block_object_dispose(&v28, 8);
  return v16;
}

+ (void)deleteEntitiesForPassPID:(unint64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v8 = [a1 _predicateForPassPID:a3];
  id v7 = +[SQLiteEntity queryWithDatabase:v6 predicate:v8];

  [v7 deleteAllEntities];
}

- (BOOL)deleteFromDatabase
{
  v3 = [(TileDescriptor *)self metadata];
  [v3 deleteFromDatabase];

  v4 = [(TileDescriptor *)self state];
  [v4 deleteFromDatabase];

  +[TileState deleteEntitiesForDescriptor:self inDatabase:self->super._database];
  +[TileDescriptor _deleteEntitiesForGroupDescriptor:self inDatabase:self->super._database];
  v6.receiver = self;
  v6.super_class = (Class)TileDescriptor;
  return [(SQLiteEntity *)&v6 deleteFromDatabase];
}

+ (void)_deleteEntitiesForGroupDescriptor:(id)a3 inDatabase:(id)a4
{
  id v6 = a4;
  objc_msgSend(a1, "_predicateForGroupDescriptorPID:", objc_msgSend(a3, "persistentID"));
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  id v7 = +[SQLiteEntity queryWithDatabase:v6 predicate:v8];

  [v7 deleteAllEntities];
}

- (id)metadata
{
  v3 = [(SQLiteEntity *)self valueForProperty:@"metadata_pid"];
  if (v3) {
    v4 = -[SQLiteEntity initWithPersistentID:inDatabase:]([TileMetadata alloc], "initWithPersistentID:inDatabase:", [v3 longLongValue], self->super._database);
  }
  else {
    v4 = 0;
  }

  return v4;
}

- (id)state
{
  v3 = [(SQLiteEntity *)self valueForProperty:@"state_pid"];
  if (v3) {
    v4 = -[SQLiteEntity initWithPersistentID:inDatabase:]([TileDescriptorState alloc], "initWithPersistentID:inDatabase:", [v3 longLongValue], self->super._database);
  }
  else {
    v4 = 0;
  }

  return v4;
}

+ (id)_predicateForPassPID:(unint64_t)a3
{
  v3 = +[NSNumber numberWithUnsignedLongLong:a3];
  v4 = +[SQLiteComparisonPredicate predicateWithProperty:@"pass_pid" equalToValue:v3];

  return v4;
}

+ (id)_predicateForPassUniqueID:(id)a3
{
  return +[SQLiteComparisonPredicate predicateWithProperty:@"pass.unique_id" equalToValue:a3];
}

+ (id)_predicateForNullGroupID
{
  return +[SQLiteNullPredicate isNullPredicateWithProperty:@"group_descriptor_pid"];
}

+ (id)_predicateForGroupDescriptorPID:(unint64_t)a3
{
  v3 = +[NSNumber numberWithUnsignedLongLong:a3];
  v4 = +[SQLiteComparisonPredicate predicateWithProperty:@"group_descriptor_pid" equalToValue:v3];

  return v4;
}

+ (id)_predicateForContext:(int64_t)a3
{
  id v5 = PKPassTileContextToString();
  id v6 = objc_alloc_init((Class)NSMutableArray);
  if (a3 == 1)
  {
    id v7 = [a1 _predicateForNullGroupID];
    v16[0] = v7;
    id v8 = +[SQLiteNullPredicate isNullPredicateWithProperty:@"pass_tile_metadata.context_identifier"];
    v16[1] = v8;
    v9 = +[NSArray arrayWithObjects:v16 count:2];
    id v10 = +[SQLiteCompoundPredicate predicateMatchingAllPredicates:v9];
    [v6 addObject:v10];
  }
  id v11 = +[SQLiteComparisonPredicate predicateWithProperty:@"pass_tile_metadata.context_identifier" equalToValue:v5];
  id v15 = v11;
  id v12 = +[NSArray arrayWithObjects:&v15 count:1];
  [v6 addObjectsFromArray:v12];

  id v13 = +[SQLiteCompoundPredicate predicateMatchingAnyPredicates:v6];

  return v13;
}

+ (id)_tileDescriptorQueryWithPredicate:(id)a3 inDatabase:(id)a4
{
  CFStringRef v12 = @"internal_tile_order";
  id v5 = a4;
  id v6 = a3;
  id v7 = +[NSArray arrayWithObjects:&v12 count:1];
  CFStringRef v11 = @"ASC";
  id v8 = +[NSArray arrayWithObjects:&v11 count:1];
  v9 = +[SQLiteEntity queryWithDatabase:v5 predicate:v6 orderingProperties:v7 orderingDirections:v8];

  return v9;
}

+ (id)_propertySettersWithProperties:(id)a3 effectiveProperties:(id *)a4 indices:(id *)a5
{
  id v7 = a3;
  id v8 = 0;
  if (a4 && a5)
  {
    v26[0] = @"default_state_identifier";
    v26[1] = @"default_state_enabled";
    v27[0] = &stru_100750998;
    v27[1] = &stru_1007509B8;
    id v8 = +[NSDictionary dictionaryWithObjects:v27 forKeys:v26 count:2];
    v9 = [v8 allKeys];
    id v10 = [v9 mutableCopy];

    a5->var0 = (unint64_t)[v10 count];
    [v10 addObject:@"metadata_pid"];
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id v20 = v7;
    id v11 = v7;
    id v12 = [v11 countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v12)
    {
      id v13 = v12;
      uint64_t v14 = *(void *)v22;
      do
      {
        for (i = 0; i != v13; i = (char *)i + 1)
        {
          if (*(void *)v22 != v14) {
            objc_enumerationMutation(v11);
          }
          uint64_t v16 = *(void *)(*((void *)&v21 + 1) + 8 * i);
          if ([v10 indexOfObject:v16] == (id)0x7FFFFFFFFFFFFFFFLL) {
            [v10 addObject:v16];
          }
        }
        id v13 = [v11 countByEnumeratingWithState:&v21 objects:v25 count:16];
      }
      while (v13);
    }

    a5->var1 = (unint64_t)[v10 indexOfObject:@"state_pid"];
    id v17 = [v10 copy];
    id v18 = *a4;
    *a4 = v17;

    id v7 = v20;
  }

  return v8;
}

+ (id)_createDescriptorStatePairForPID:(int64_t)a3 withProperties:(id)a4 values:(const void *)a5 propertySetters:(id)a6 indices:(id)a7 inDatabase:(id)a8 supportGroups:(BOOL)a9
{
  unint64_t var1 = a7.var1;
  unint64_t var0 = a7.var0;
  id v14 = a4;
  id v15 = a6;
  id v16 = a8;
  id v17 = (void *)a5[var1];
  if (v17)
  {
    id v18 = v17;
    uint64_t v19 = -[SQLiteEntity initWithPersistentID:inDatabase:]([TileDescriptorState alloc], "initWithPersistentID:inDatabase:", [v18 longLongValue], v16);
  }
  else
  {
    uint64_t v19 = 0;
  }
  CFStringRef v38 = v14;
  id v20 = v15;
  id v21 = objc_msgSend(a1, "_createDescriptorForPID:withProperties:values:propertySetters:indices:inDatabase:", a3, v14, a5, v15, var0, var1, v16);
  long long v22 = v19;
  long long v23 = [(TileDescriptorState *)v19 passTileDescriptorState];
  long long v24 = v23;
  if (v23)
  {
    id v25 = v23;
  }
  else
  {
    id v26 = objc_alloc((Class)PKPassTileDescriptorState);
    int64_t v27 = [v21 metadata];
    id v25 = objc_msgSend(v26, "initForType:", objc_msgSend(v27, "type"));

    id v20 = v15;
  }

  uint64_t v54 = 0;
  v55 = &v54;
  uint64_t v56 = 0x2020000000;
  char v57 = 0;
  uint64_t v48 = 0;
  v49 = &v48;
  uint64_t v50 = 0x3032000000;
  v51 = sub_100020DBC;
  v52 = sub_1000211D0;
  id v53 = 0;
  uint64_t v28 = [v21 metadata];
  uint64_t v29 = v22;
  uint64_t v30 = v25;
  unsigned int v31 = [v28 isGroupType];

  if (!v31) {
    goto LABEL_11;
  }
  if (!a9) {
    goto LABEL_10;
  }
  uint64_t v32 = [a1 _predicateForGroupDescriptorPID:a3];
  id v33 = [a1 _tileDescriptorQueryWithPredicate:v32 inDatabase:v16];

  v40[0] = _NSConcreteStackBlock;
  v40[1] = 3221225472;
  v40[2] = sub_100429D28;
  v40[3] = &unk_1007509E0;
  v43 = &v48;
  id v45 = a1;
  id v41 = v20;
  unint64_t v46 = var0;
  unint64_t v47 = var1;
  id v42 = v16;
  v44 = &v54;
  [v33 enumeratePersistentIDsAndProperties:v38 usingBlock:v40];
  LODWORD(v32) = *((unsigned __int8 *)v55 + 24);

  if (v32)
  {
LABEL_10:
    id v34 = 0;
  }
  else
  {
LABEL_11:
    long long v35 = [PDPassTileDescriptorDescriptorStatePair alloc];
    id v36 = [(id)v49[5] copy];
    id v34 = sub_1001355B8((id *)&v35->super.isa, v21, v30, v36);
  }
  _Block_object_dispose(&v48, 8);

  _Block_object_dispose(&v54, 8);
  return v34;
}

+ (id)_createUpdatedDescriptorPairForPID:(int64_t)a3 transform:(id)a4 withProperties:(id)a5 values:(const void *)a6 propertySetters:(id)a7 indices:(id)a8 inDatabase:(id)a9 updated:(BOOL *)a10 supportGroups:(BOOL)a11
{
  id v16 = (void (**)(id, id, id))a4;
  id v17 = a5;
  id v48 = a7;
  id v18 = a9;
  uint64_t v19 = (void *)a6[a8.var1];
  if (v19)
  {
    id v20 = v19;
    id v21 = -[SQLiteEntity initWithPersistentID:inDatabase:]([TileDescriptorState alloc], "initWithPersistentID:inDatabase:", [v20 longLongValue], v18);
  }
  else
  {
    id v21 = 0;
  }
  unint64_t v47 = v17;
  id v22 = objc_msgSend(a1, "_createDescriptorForPID:withProperties:values:propertySetters:indices:inDatabase:", a3, v17, a6, v48, a8.var0, a8.var1, v18);
  long long v23 = [(TileDescriptorState *)v21 passTileDescriptorState];
  long long v24 = v23;
  if (v23)
  {
    id v25 = v23;
  }
  else
  {
    id v26 = objc_alloc((Class)PKPassTileDescriptorState);
    int64_t v27 = [v22 metadata];
    id v25 = objc_msgSend(v26, "initForType:", objc_msgSend(v27, "type"));
  }
  uint64_t v28 = v16[2](v16, v22, v25);
  uint64_t v29 = (void *)v28;
  if (v28) {
    uint64_t v30 = (void *)v28;
  }
  else {
    uint64_t v30 = v25;
  }
  id v31 = v30;

  if (v25 != v31 && ([v25 isEqualToUnresolvedState:v31] & 1) == 0)
  {
    if (v21 && ![(TileDescriptorState *)v21 deleteFromDatabase])
    {
      v37 = 0;
      unint64_t v46 = v21;
      goto LABEL_22;
    }
    id v41 = +[TileDescriptorState insertState:v31 inDatabase:v18];

    if (v41)
    {
      id v45 = a1;
      id v42 = [(SQLiteEntity *)[TileDescriptor alloc] initWithPersistentID:a3 inDatabase:v18];
      unint64_t v46 = v41;
      v43 = +[NSNumber numberWithLongLong:[(SQLiteEntity *)v41 persistentID]];
      unsigned int v44 = [(SQLiteEntity *)v42 setValue:v43 forProperty:@"state_pid"];

      if (v44)
      {
        if (a10) {
          *a10 = 1;
        }

        a1 = v45;
        goto LABEL_13;
      }
    }
    else
    {
      unint64_t v46 = 0;
    }
    v37 = 0;
    goto LABEL_22;
  }
  unint64_t v46 = v21;
LABEL_13:
  uint64_t v66 = 0;
  v67 = &v66;
  uint64_t v68 = 0x3032000000;
  v69 = sub_100020DBC;
  v70 = sub_1000211D0;
  id v71 = 0;
  uint64_t v32 = [v22 metadata];
  unsigned int v33 = [v32 isGroupType];

  if (!v33) {
    goto LABEL_20;
  }
  if (!a11) {
    goto LABEL_19;
  }
  id v34 = [a1 _predicateForGroupDescriptorPID:a3];
  long long v35 = [a1 _tileDescriptorQueryWithPredicate:v34 inDatabase:v18];

  uint64_t v62 = 0;
  v63 = &v62;
  uint64_t v64 = 0x2020000000;
  char v65 = 0;
  uint64_t v58 = 0;
  v59 = &v58;
  uint64_t v60 = 0x2020000000;
  char v61 = 0;
  v49[0] = _NSConcreteStackBlock;
  v49[1] = 3221225472;
  v49[2] = sub_10042A304;
  v49[3] = &unk_100750930;
  id v53 = &v66;
  id v56 = a1;
  v52 = v16;
  id v50 = v48;
  $7DEDF3842AEFB7F1E6DF5AF62E424A02 v57 = a8;
  id v51 = v18;
  uint64_t v54 = &v58;
  v55 = &v62;
  [v35 enumeratePersistentIDsAndProperties:v47 usingBlock:v49];
  int v36 = *((unsigned __int8 *)v63 + 24);
  if (a10 && !*((unsigned char *)v63 + 24)) {
    *a10 |= *((unsigned char *)v59 + 24);
  }

  _Block_object_dispose(&v58, 8);
  _Block_object_dispose(&v62, 8);

  if (v36)
  {
LABEL_19:
    v37 = 0;
  }
  else
  {
LABEL_20:
    CFStringRef v38 = [PDPassTileDescriptorDescriptorStatePair alloc];
    id v39 = [(id)v67[5] copy];
    v37 = sub_1001355B8((id *)&v38->super.isa, v22, v31, v39);
  }
  _Block_object_dispose(&v66, 8);

LABEL_22:
  return v37;
}

+ (id)_createDescriptorForPID:(int64_t)a3 withProperties:(id)a4 values:(const void *)a5 propertySetters:(id)a6 indices:(id)a7 inDatabase:(id)a8
{
  unint64_t var0 = a7.var0;
  id v13 = a8;
  id v14 = a6;
  id v15 = a4;
  id v16 = [objc_alloc((Class)PKPassTileDescriptor) _init];
  +[SQLiteEntity applyPropertySetters:v14 toObject:v16 withProperties:v15 values:a5];

  id v17 = (id)a5[var0];
  if (v17)
  {
    id v18 = v17;
    uint64_t v19 = +[NSNull null];

    if (v18 != v19)
    {
      id v20 = -[SQLiteEntity initWithPersistentID:inDatabase:]([TileMetadata alloc], "initWithPersistentID:inDatabase:", [v18 longLongValue], v13);
      id v21 = [(TileMetadata *)v20 metadata];
      [v16 setMetadata:v21];
    }
  }
  id v22 = +[TileState statesForDescriptorPID:a3 inDatabase:v13];
  [v16 setStates:v22];

  return v16;
}

@end