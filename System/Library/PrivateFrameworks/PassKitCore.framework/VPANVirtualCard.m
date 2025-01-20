@interface VPANVirtualCard
+ (id)_predicateForVirtualCardIdentifier:(id)a3;
+ (id)anyInDatabase:(id)a3 withVirtualCardIdentifier:(id)a4;
+ (id)databaseTable;
+ (id)insertVPANVirtualCardMetadataWithIdentifier:(id)a3 cardholderNameFromSafari:(id)a4 inDatabase:(id)a5;
+ (id)insertVPANVirtualCardMetadataWithIdentifier:(id)a3 dateLastUsedBySafari:(id)a4 inDatabase:(id)a5;
+ (void)updateVirtualCard:(id)a3 fromDatabase:(id)a4;
- (VPANVirtualCard)initWithVirtualCardIdentifier:(id)a3 inDatabase:(id)a4;
- (void)updateCardholderNameFromSafari:(id)a3;
- (void)updateDateLastUsedBySafari:(id)a3;
- (void)updateVirtualCard:(id)a3;
@end

@implementation VPANVirtualCard

- (VPANVirtualCard)initWithVirtualCardIdentifier:(id)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = +[NSMutableDictionary dictionary];
  [v8 setObjectOrNull:v7 forKey:@"a"];

  v9 = [(SQLiteEntity *)self initWithPropertyValues:v8 inDatabase:v6];
  return v9;
}

+ (id)insertVPANVirtualCardMetadataWithIdentifier:(id)a3 dateLastUsedBySafari:(id)a4 inDatabase:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [objc_alloc((Class)a1) initWithVirtualCardIdentifier:v10 inDatabase:v8];

  [v11 updateDateLastUsedBySafari:v9];
  return v11;
}

+ (id)insertVPANVirtualCardMetadataWithIdentifier:(id)a3 cardholderNameFromSafari:(id)a4 inDatabase:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [objc_alloc((Class)a1) initWithVirtualCardIdentifier:v10 inDatabase:v8];

  [v11 updateCardholderNameFromSafari:v9];
  return v11;
}

+ (id)anyInDatabase:(id)a3 withVirtualCardIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = [a1 _predicateForVirtualCardIdentifier:a4];
  id v8 = [a1 anyInDatabase:v6 predicate:v7];

  return v8;
}

- (void)updateDateLastUsedBySafari:(id)a3
{
  id v4 = a3;
  id v6 = objc_alloc_init((Class)NSMutableDictionary);
  v5 = (void *)_SQLValueForDate();

  [v6 setObjectOrNull:v5 forKey:@"b"];
  [(SQLiteEntity *)self setValuesWithDictionary:v6];
}

- (void)updateCardholderNameFromSafari:(id)a3
{
  id v4 = a3;
  id v6 = objc_alloc_init((Class)NSMutableDictionary);
  v5 = (void *)_SQLValueForString();

  [v6 setObjectOrNull:v5 forKey:@"c"];
  [(SQLiteEntity *)self setValuesWithDictionary:v6];
}

+ (void)updateVirtualCard:(id)a3 fromDatabase:(id)a4
{
  id v8 = a3;
  id v5 = a4;
  if ([v8 type] == (id)2)
  {
    id v6 = [v8 identifier];
    id v7 = +[VPANVirtualCard anyInDatabase:v5 withVirtualCardIdentifier:v6];

    [v7 updateVirtualCard:v8];
  }
}

- (void)updateVirtualCard:(id)a3
{
  id v7 = a3;
  if ([v7 type] == (id)2)
  {
    id v4 = [(SQLiteEntity *)self valueForProperty:@"b"];
    id v5 = (void *)_DateForSQLValue();

    [v7 setLastAutoFilledBySafari:v5];
    id v6 = [(SQLiteEntity *)self valueForProperty:@"c"];
    [v7 setNameFromSafari:v6];
  }
}

+ (id)databaseTable
{
  return @"melomakarono";
}

+ (id)_predicateForVirtualCardIdentifier:(id)a3
{
  return +[SQLiteComparisonPredicate predicateWithProperty:@"a" equalToValue:a3];
}

@end