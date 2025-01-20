@interface PassType
+ (id)_insertionDictionaryWithPassTypeID:(id)a3 teamID:(id)a4;
+ (id)_passTypeIDPredicate:(id)a3;
+ (id)_passTypeIdentifierHashPredicate:(id)a3;
+ (id)anyInDatabase:(id)a3 withPassTypeID:(id)a4;
+ (id)anyInDatabase:(id)a3 withPassTypeIdentifierHash:(id)a4;
+ (id)associationPropertyForEntityClass:(Class)a3;
+ (id)databaseTable;
+ (id)insertPassTypeWithPassTypeID:(id)a3 teamID:(id)a4 inDatabase:(id)a5;
+ (void)addJoinClausesForProperty:(id)a3 toJoins:(id)a4;
- (PassType)initWithPassTypeID:(id)a3 teamID:(id)a4 inDatabase:(id)a5;
- (double)frequencyScore;
- (id)identifierHash;
- (id)lastPushDate;
- (id)lastUpdateDate;
- (id)passTypeID;
- (id)teamID;
- (void)updateFrequencyScore:(double)a3;
- (void)updateIdentifierHash;
- (void)updateLastPushDate:(id)a3;
- (void)updateLastUpdateDate:(id)a3;
@end

@implementation PassType

+ (id)databaseTable
{
  return @"pass_type";
}

+ (id)associationPropertyForEntityClass:(Class)a3
{
  CFStringRef v4 = @"pid";
  if ((Class)objc_opt_class() != a3 && (Class)objc_opt_class() != a3) {
    return 0;
  }
  return (id)v4;
}

+ (void)addJoinClausesForProperty:(id)a3 toJoins:(id)a4
{
  id v5 = a4;
  v9[0] = @"pass.pid";
  v9[1] = @"pass.template";
  id v6 = a3;
  v7 = +[NSArray arrayWithObjects:v9 count:2];
  unsigned int v8 = [v7 containsObject:v6];

  if (v8) {
    [v5 addObject:@"JOIN pass ON pass_type.pid = pass.pass_type_pid"];
  }
}

+ (id)_insertionDictionaryWithPassTypeID:(id)a3 teamID:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = +[NSMutableDictionary dictionary];
  unsigned int v8 = [v6 dataUsingEncoding:4];
  v9 = [v8 SHA256Hash];
  v10 = [v9 hexEncoding];

  [v7 setObjectOrNull:v10 forKey:@"identifier_hash"];
  [v7 setObjectOrNull:v6 forKey:@"identifier"];

  [v7 setObjectOrNull:v5 forKey:@"team_identifier"];
  return v7;
}

- (PassType)initWithPassTypeID:(id)a3 teamID:(id)a4 inDatabase:(id)a5
{
  id v8 = a5;
  v9 = +[PassType _insertionDictionaryWithPassTypeID:a3 teamID:a4];
  v10 = [(SQLiteEntity *)self initWithPropertyValues:v9 inDatabase:v8];

  return v10;
}

- (id)lastPushDate
{
  v2 = [(SQLiteEntity *)self valueForProperty:@"last_push_date"];
  v3 = (void *)_DateForSQLValue();

  return v3;
}

- (id)lastUpdateDate
{
  v2 = [(SQLiteEntity *)self valueForProperty:@"last_update_date"];
  v3 = (void *)_DateForSQLValue();

  return v3;
}

- (double)frequencyScore
{
  v2 = [(SQLiteEntity *)self valueForProperty:@"push_frequency_score"];
  [v2 doubleValue];
  double v4 = v3;

  return v4;
}

- (id)passTypeID
{
  return [(SQLiteEntity *)self valueForProperty:@"identifier"];
}

- (id)teamID
{
  return [(SQLiteEntity *)self valueForProperty:@"team_identifier"];
}

- (id)identifierHash
{
  return [(SQLiteEntity *)self valueForProperty:@"identifier_hash"];
}

- (void)updateLastPushDate:(id)a3
{
}

- (void)updateLastUpdateDate:(id)a3
{
}

- (void)updateFrequencyScore:(double)a3
{
  id v4 = +[NSNumber numberWithDouble:a3];
  [(SQLiteEntity *)self setValue:v4 forProperty:@"push_frequency_score"];
}

- (void)updateIdentifierHash
{
  double v3 = [(PassType *)self passTypeID];
  id v4 = [v3 dataUsingEncoding:4];
  id v5 = [v4 SHA256Hash];
  id v6 = [v5 hexEncoding];

  [(SQLiteEntity *)self setValue:v6 forProperty:@"identifier_hash"];
}

+ (id)insertPassTypeWithPassTypeID:(id)a3 teamID:(id)a4 inDatabase:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [objc_alloc((Class)a1) initWithPassTypeID:v10 teamID:v9 inDatabase:v8];

  return v11;
}

+ (id)_passTypeIDPredicate:(id)a3
{
  return +[SQLiteComparisonPredicate predicateWithProperty:@"identifier" equalToValue:a3];
}

+ (id)_passTypeIdentifierHashPredicate:(id)a3
{
  return +[SQLiteComparisonPredicate predicateWithProperty:@"identifier_hash" equalToValue:a3];
}

+ (id)anyInDatabase:(id)a3 withPassTypeID:(id)a4
{
  id v6 = a3;
  v7 = [a1 _passTypeIDPredicate:a4];
  id v8 = [a1 anyInDatabase:v6 predicate:v7];

  return v8;
}

+ (id)anyInDatabase:(id)a3 withPassTypeIdentifierHash:(id)a4
{
  id v6 = a3;
  v7 = [a1 _passTypeIdentifierHashPredicate:a4];
  id v8 = [a1 anyInDatabase:v6 predicate:v7];

  return v8;
}

@end