@interface SecureElementPassFieldForeignReferenceIdentifier
+ (id)databaseTable;
+ (id)dbIdentifiersForSecureElementPassField:(id)a3 inDatabase:(id)a4;
+ (id)identifiersForSecureElementPassField:(id)a3 inDatabase:(id)a4;
+ (id)insertForeignReferenceIdentifier:(id)a3 forPaymentPassField:(id)a4 inDatabase:(id)a5;
+ (id)insertForeignReferenceIdentifiers:(id)a3 forSecureElementPassField:(id)a4 inDatabase:(id)a5;
+ (id)queryForForeignReferenceIdentifiersWithFieldPID:(int64_t)a3 inDatabase:(id)a4;
+ (void)deleteForeignReferenceIdentifiersInDatabase:(id)a3 forFieldPID:(int64_t)a4;
@end

@implementation SecureElementPassFieldForeignReferenceIdentifier

+ (id)databaseTable
{
  return @"secure_element_pass_field_foreign_identifier";
}

+ (id)insertForeignReferenceIdentifiers:(id)a3 forSecureElementPassField:(id)a4 inDatabase:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", objc_msgSend(v8, "count"));
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v12 = v8;
  id v13 = [v12 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v13)
  {
    id v14 = v13;
    uint64_t v15 = *(void *)v20;
    do
    {
      for (i = 0; i != v14; i = (char *)i + 1)
      {
        if (*(void *)v20 != v15) {
          objc_enumerationMutation(v12);
        }
        v17 = objc_msgSend(a1, "insertForeignReferenceIdentifier:forPaymentPassField:inDatabase:", *(void *)(*((void *)&v19 + 1) + 8 * i), v9, v10, (void)v19);
        [v11 safelyAddObject:v17];
      }
      id v14 = [v12 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v14);
  }

  return v11;
}

+ (id)insertForeignReferenceIdentifier:(id)a3 forPaymentPassField:(id)a4 inDatabase:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  id v10 = objc_alloc_init((Class)NSMutableDictionary);
  [v10 setEntityPIDOrNull:v8 forKey:@"field_pid"];

  [v10 setObjectOrNull:v9 forKey:@"foreign_reference_identifier"];
  id v11 = [(SQLiteEntity *)[SecureElementPassFieldForeignReferenceIdentifier alloc] initWithPropertyValues:v10 inDatabase:v7];

  return v11;
}

+ (id)queryForForeignReferenceIdentifiersWithFieldPID:(int64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v7 = +[NSNumber numberWithLongLong:a3];
  id v8 = +[SQLiteComparisonPredicate predicateWithProperty:@"field_pid" equalToValue:v7];

  id v9 = [a1 queryWithDatabase:v6 predicate:v8];

  return v9;
}

+ (id)dbIdentifiersForSecureElementPassField:(id)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = objc_alloc_init((Class)NSMutableSet);
  id v9 = [v7 persistentID];

  id v10 = [a1 queryForForeignReferenceIdentifiersWithFieldPID:v9 inDatabase:v6];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_1003BCC0C;
  v15[3] = &unk_1007396C8;
  id v17 = v8;
  id v18 = a1;
  id v16 = v6;
  id v11 = v8;
  id v12 = v6;
  [v10 enumeratePersistentIDsUsingBlock:v15];
  id v13 = [v11 copy];

  return v13;
}

+ (id)identifiersForSecureElementPassField:(id)a3 inDatabase:(id)a4
{
  v4 = [a1 dbIdentifiersForSecureElementPassField:a3 inDatabase:a4];
  id v5 = objc_msgSend(objc_alloc((Class)NSMutableSet), "initWithCapacity:", objc_msgSend(v4, "count"));
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v6 = v4;
  id v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * i), "valueForProperty:", @"foreign_reference_identifier", (void)v14);
        if (v11) {
          [v5 addObject:v11];
        }
      }
      id v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }

  id v12 = [v5 copy];
  return v12;
}

+ (void)deleteForeignReferenceIdentifiersInDatabase:(id)a3 forFieldPID:(int64_t)a4
{
  id v4 = [a1 queryForForeignReferenceIdentifiersWithFieldPID:a4 inDatabase:a3];
  [v4 deleteAllEntities];
}

@end