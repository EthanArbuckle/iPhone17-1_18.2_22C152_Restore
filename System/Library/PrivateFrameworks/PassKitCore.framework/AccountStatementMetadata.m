@interface AccountStatementMetadata
+ (id)_commonDictionaryForStatementMetadata:(id)a3;
+ (id)_predicateForAccountIdentifier:(id)a3;
+ (id)_predicateForPID:(int64_t)a3;
+ (id)_predicateForStatementIdentifier:(id)a3;
+ (id)_predicateForStatementIdentifier:(id)a3 accountIdentifier:(id)a4;
+ (id)_propertySettersForAccountStatementTransactionMetadata;
+ (id)_statementMetadataWithQuery:(id)a3;
+ (id)accountStatementMetadataForAccountIdentifier:(id)a3 inDatabase:(id)a4;
+ (id)anyInDatabase:(id)a3 forPID:(int64_t)a4;
+ (id)anyInDatabase:(id)a3 forStatementIdentifier:(id)a4 accountIdentifier:(id)a5;
+ (id)databaseTable;
+ (id)insertOrUpdateAccountStatementMetadata:(id)a3 inDatabase:(id)a4;
+ (id)latestStatementIdentifierThatNeedsMetadataProcessingForAccountIdentifier:(id)a3 tableName:(id)a4 statementIdentifierColumn:(id)a5 accountIdentifierColumn:(id)a6 openingDateColumn:(id)a7 maxProcessedAttemptCount:(int64_t)a8 inDatabase:(id)a9;
+ (void)addJoinClausesForProperty:(id)a3 toJoins:(id)a4;
+ (void)deleteAccountStatementMetadataForStatementIdentifier:(id)a3 accountIdentifier:(id)a4 inDatabase:(id)a5;
+ (void)openingDate:(id *)a3 closingDate:(id *)a4 statementIdentifier:(id)a5 accountIdentifier:(id)a6 accountType:(unint64_t)a7 inDatabase:(id)a8;
- (AccountStatementMetadata)initWithStatementMetadata:(id)a3 inDatabase:(id)a4;
- (BOOL)deleteFromDatabase;
- (id)accountIdentifier;
- (id)accountStatementMetadata;
- (id)statementIdentifier;
- (int64_t)reportCount;
- (unint64_t)accountType;
- (void)markStatementMetadataItems:(id)a3 processed:(BOOL)a4 error:(unint64_t)a5;
- (void)updateWithAccountStatementMetadata:(id)a3;
- (void)updateWithReport:(id)a3 reportDate:(id)a4;
@end

@implementation AccountStatementMetadata

+ (id)databaseTable
{
  return @"account_statement_metadata";
}

+ (void)addJoinClausesForProperty:(id)a3 toJoins:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = (__CFString *)v5;
  v9 = v7;
  if (v7 == @"pears.c"
    || v7 && (unsigned int v8 = [@"pears.c" isEqualToString:v7], v9, v8))
  {
    [v6 addObject:@"JOIN pears ON pears.a = account_statement_metadata.account_identifier"];
  }
}

- (AccountStatementMetadata)initWithStatementMetadata:(id)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  unsigned int v8 = [(id)objc_opt_class() _commonDictionaryForStatementMetadata:v7];

  v9 = [(SQLiteEntity *)self initWithPropertyValues:v8 inDatabase:v6];
  return v9;
}

+ (id)insertOrUpdateAccountStatementMetadata:(id)a3 inDatabase:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  unsigned int v8 = [v6 statementIdentifier];
  v9 = [v6 accountIdentifier];
  id v10 = [a1 anyInDatabase:v7 forStatementIdentifier:v8 accountIdentifier:v9];

  if (v10) {
    [v10 updateWithAccountStatementMetadata:v6];
  }
  else {
    id v10 = [objc_alloc((Class)objc_opt_class()) initWithStatementMetadata:v6 inDatabase:v7];
  }
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_100145C14;
  v17[3] = &unk_100734FC8;
  id v11 = v10;
  id v18 = v11;
  id v19 = v6;
  id v20 = v7;
  id v21 = a1;
  id v12 = v7;
  id v13 = v6;
  sub_10000817C((uint64_t)v12, v17);
  v14 = v20;
  id v15 = v11;

  return v15;
}

+ (void)deleteAccountStatementMetadataForStatementIdentifier:(id)a3 accountIdentifier:(id)a4 inDatabase:(id)a5
{
  id v8 = a5;
  id v10 = [a1 _predicateForStatementIdentifier:a3 accountIdentifier:a4];
  v9 = [a1 queryWithDatabase:v8 predicate:v10];

  [v9 deleteAllEntities];
}

- (BOOL)deleteFromDatabase
{
  int64_t v3 = [(SQLiteEntity *)self persistentID];
  v4 = [(SQLiteEntity *)self database];
  +[AccountStatementMetadataItem deleteAccountStatementMetadataItemsForStatementMetadataPID:v3 inDatabase:v4];

  v6.receiver = self;
  v6.super_class = (Class)AccountStatementMetadata;
  return [(SQLiteEntity *)&v6 deleteFromDatabase];
}

+ (id)anyInDatabase:(id)a3 forStatementIdentifier:(id)a4 accountIdentifier:(id)a5
{
  id v8 = a3;
  v9 = [a1 _predicateForStatementIdentifier:a4 accountIdentifier:a5];
  id v10 = [a1 anyInDatabase:v8 predicate:v9];

  return v10;
}

+ (id)anyInDatabase:(id)a3 forPID:(int64_t)a4
{
  id v6 = a3;
  id v7 = [a1 _predicateForPID:a4];
  id v8 = [a1 anyInDatabase:v6 predicate:v7];

  return v8;
}

+ (id)accountStatementMetadataForAccountIdentifier:(id)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v7 = [a1 _predicateForAccountIdentifier:a3];
  id v8 = [a1 queryWithDatabase:v6 predicate:v7];

  v9 = [a1 _statementMetadataWithQuery:v8];

  return v9;
}

+ (id)_statementMetadataWithQuery:(id)a3
{
  id v7 = _NSConcreteStackBlock;
  uint64_t v8 = 3221225472;
  v9 = sub_100146144;
  id v10 = &unk_100730E38;
  id v11 = a3;
  id v3 = objc_alloc_init((Class)NSMutableArray);
  id v12 = v3;
  id v4 = v11;
  [v4 enumeratePersistentIDsUsingBlock:&v7];
  if (objc_msgSend(v3, "count", v7, v8, v9, v10)) {
    id v5 = [v3 copy];
  }
  else {
    id v5 = 0;
  }

  return v5;
}

+ (id)latestStatementIdentifierThatNeedsMetadataProcessingForAccountIdentifier:(id)a3 tableName:(id)a4 statementIdentifierColumn:(id)a5 accountIdentifierColumn:(id)a6 openingDateColumn:(id)a7 maxProcessedAttemptCount:(int64_t)a8 inDatabase:(id)a9
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a9;
  id v20 = objc_alloc_init(PDSQLiteDatabaseBinding);
  id v21 = +[NSString stringWithFormat:@"    SELECT DISTINCT        %@ AS statement_identifier    FROM        %@    LEFT JOIN       account_statement_metadata       ON account_statement_metadata.statement_identifier = %@       AND account_statement_metadata.account_identifier = ?       AND account_statement_metadata.account_identifier = %@    LEFT JOIN       account_statement_metadata_item       ON account_statement_metadata_item.account_statement_metadata_pid = account_statement_metadata.pid    WHERE        account_statement_metadata.statement_identifier IS NULL        OR account_statement_metadata_item.has_been_processed = 0        OR account_statement_metadata_item.has_been_processed IS NULL        AND       (           account_statement_metadata_item.processed_attempt_count < ?            OR account_statement_metadata_item.processed_attempt_count IS NULL       )        AND       (           account_statement_metadata.has_been_processed = 0            OR account_statement_metadata.has_been_processed IS NULL       )    ORDER BY %@ DESC    LIMIT 1    ", v16, v15, v16, v17, v18];
  [(PDSQLiteDatabaseBinding *)v20 addTextBinding:v14];
  [(PDSQLiteDatabaseBinding *)v20 addIntBinding:a8];
  uint64_t v32 = 0;
  v33 = &v32;
  uint64_t v34 = 0x3032000000;
  v35 = sub_1000208FC;
  v36 = sub_100020F70;
  id v37 = 0;
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472;
  v27[2] = sub_1001463FC;
  v27[3] = &unk_100739CF0;
  id v22 = v19;
  id v28 = v22;
  id v23 = v21;
  id v29 = v23;
  v24 = v20;
  v30 = v24;
  v31 = &v32;
  sub_10000817C((uint64_t)v22, v27);
  id v25 = (id)v33[5];

  _Block_object_dispose(&v32, 8);
  return v25;
}

- (void)updateWithAccountStatementMetadata:(id)a3
{
  id v4 = a3;
  id v5 = [(id)objc_opt_class() _commonDictionaryForStatementMetadata:v4];

  [(SQLiteEntity *)self setValuesWithDictionary:v5];
}

- (void)markStatementMetadataItems:(id)a3 processed:(BOOL)a4 error:(unint64_t)a5
{
  id v8 = a3;
  [(SQLiteEntity *)self database];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100146658;
  v11[3] = &unk_100739D18;
  v11[4] = self;
  id v12 = v8;
  BOOL v15 = a4;
  id v13 = (id)objc_claimAutoreleasedReturnValue();
  unint64_t v14 = a5;
  id v9 = v13;
  id v10 = v8;
  sub_10000817C((uint64_t)v9, v11);
}

- (void)updateWithReport:(id)a3 reportDate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [(SQLiteEntity *)self database];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1001467E0;
  v11[3] = &unk_100733638;
  v11[4] = self;
  id v12 = v7;
  id v13 = v6;
  id v14 = (id)objc_claimAutoreleasedReturnValue();
  id v8 = v14;
  id v9 = v6;
  id v10 = v7;
  sub_10000817C((uint64_t)v8, v11);
}

- (id)accountStatementMetadata
{
  id v3 = [(id)objc_opt_class() _propertySettersForAccountStatementTransactionMetadata];
  id v4 = objc_alloc_init((Class)PKAccountStatementMetadata);
  id v5 = [v3 allKeys];
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_100146A08;
  v14[3] = &unk_10072DDD8;
  v14[4] = self;
  id v15 = v3;
  id v6 = v4;
  id v16 = v6;
  id v7 = v3;
  [(SQLiteEntity *)self getValuesForProperties:v5 withApplier:v14];

  int64_t v8 = [(SQLiteEntity *)self persistentID];
  id v9 = [(SQLiteEntity *)self database];
  id v10 = +[AccountStatementMetadataItem accountStatementMetadataItemsForStatementMetadataPID:v8 inDatabase:v9];
  [v6 setItems:v10];

  id v11 = v16;
  id v12 = v6;

  return v12;
}

- (unint64_t)accountType
{
  v2 = [(SQLiteEntity *)self valueForProperty:@"pears.c"];
  id v3 = [v2 integerValue];

  return (unint64_t)v3;
}

- (id)statementIdentifier
{
  return [(SQLiteEntity *)self valueForProperty:@"statement_identifier"];
}

- (id)accountIdentifier
{
  return [(SQLiteEntity *)self valueForProperty:@"account_identifier"];
}

- (int64_t)reportCount
{
  v2 = [(SQLiteEntity *)self valueForProperty:@"report_count"];
  id v3 = [v2 integerValue];

  return (int64_t)v3;
}

+ (void)openingDate:(id *)a3 closingDate:(id *)a4 statementIdentifier:(id)a5 accountIdentifier:(id)a6 accountType:(unint64_t)a7 inDatabase:(id)a8
{
  id v19 = a5;
  id v13 = a6;
  id v14 = a8;
  if (a7 == 4)
  {
    id v15 = +[SavingsAccountStatement anyInDatabase:v14 withStatementIdentifier:v19 accountIdentifier:v13];
LABEL_5:
    id v16 = v15;
    id v17 = [v15 openingDate];
    id v18 = [v16 closingDate];

    if (!a3) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (a7 == 1)
  {
    id v15 = +[CreditAccountStatement creditAccountStatementWithIdentifier:v19 inDatabase:v14];
    goto LABEL_5;
  }
  id v18 = 0;
  id v17 = 0;
  if (a3) {
LABEL_6:
  }
    *a3 = v17;
LABEL_7:
  if (a4) {
    *a4 = v18;
  }
}

+ (id)_predicateForStatementIdentifier:(id)a3
{
  return +[SQLiteComparisonPredicate predicateWithProperty:@"statement_identifier" equalToValue:a3];
}

+ (id)_predicateForAccountIdentifier:(id)a3
{
  return +[SQLiteComparisonPredicate predicateWithProperty:@"account_identifier" equalToValue:a3];
}

+ (id)_predicateForPID:(int64_t)a3
{
  id v3 = +[NSNumber numberWithLongLong:a3];
  id v4 = +[SQLiteComparisonPredicate predicateWithProperty:@"pid" equalToValue:v3];

  return v4;
}

+ (id)_predicateForStatementIdentifier:(id)a3 accountIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = [a1 _predicateForAccountIdentifier:a4];
  v12[0] = v7;
  int64_t v8 = [a1 _predicateForStatementIdentifier:v6];

  v12[1] = v8;
  id v9 = +[NSArray arrayWithObjects:v12 count:2];
  id v10 = +[SQLiteCompoundPredicate predicateMatchingAllPredicates:v9];

  return v10;
}

+ (id)_propertySettersForAccountStatementTransactionMetadata
{
  v4[0] = @"statement_identifier";
  v4[1] = @"account_identifier";
  v5[0] = &stru_100739D58;
  v5[1] = &stru_100739D78;
  v4[2] = @"opening_date";
  v4[3] = @"closing_date";
  v5[2] = &stru_100739D98;
  v5[3] = &stru_100739DB8;
  v4[4] = @"has_been_processed";
  v4[5] = @"last_report_date";
  v5[4] = &stru_100739DD8;
  v5[5] = &stru_100739DF8;
  v4[6] = @"report_count";
  v4[7] = @"pears.c";
  v5[6] = &stru_100739E18;
  v5[7] = &stru_100739E38;
  v2 = +[NSDictionary dictionaryWithObjects:v5 forKeys:v4 count:8];
  return v2;
}

+ (id)_commonDictionaryForStatementMetadata:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init((Class)NSMutableDictionary);
  id v5 = [v3 accountIdentifier];
  [v4 setObjectOrNull:v5 forKey:@"account_identifier"];

  id v6 = [v3 statementIdentifier];
  [v4 setObjectOrNull:v6 forKey:@"statement_identifier"];

  id v7 = [v3 lastReportDate];
  int64_t v8 = (void *)_SQLValueForDate();
  [v4 setObjectOrNull:v8 forKey:@"last_report_date"];

  id v9 = [v3 reportCount];
  id v10 = +[NSNumber numberWithInteger:v9];
  [v4 setObjectOrNull:v10 forKey:@"report_count"];

  return v4;
}

@end