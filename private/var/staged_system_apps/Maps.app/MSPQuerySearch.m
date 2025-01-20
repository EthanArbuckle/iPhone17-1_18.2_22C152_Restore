@interface MSPQuerySearch
+ (id)querySearchWithDisplayQuery:(id)a3 locationDisplayString:(id)a4 mapRegion:(id)a5;
@end

@implementation MSPQuerySearch

+ (id)querySearchWithDisplayQuery:(id)a3 locationDisplayString:(id)a4 mapRegion:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  id v10 = objc_alloc_init((Class)MSPQuerySearch);
  id v11 = [v9 copy];

  [v10 setQuery:v11];
  id v12 = [v8 copy];

  [v10 setLocationDisplayString:v12];
  id v13 = [v7 copy];

  [v10 setMapRegion:v13];

  return v10;
}

@end