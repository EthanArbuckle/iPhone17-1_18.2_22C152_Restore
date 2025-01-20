@interface SSWishlistDatabaseSchema
+ (id)databasePathWithAccountIdentifier:(int64_t)a3;
+ (void)_migrate7000to7001InDatabase:(id)a3;
+ (void)_migrate7001to7002InDatabase:(id)a3;
+ (void)createSchemaInDatabase:(id)a3;
@end

@implementation SSWishlistDatabaseSchema

+ (void)createSchemaInDatabase:(id)a3
{
  [a3 executeSQL:@"PRAGMA legacy_file_format = 0;"];
  [a3 executeSQL:@"CREATE TABLE IF NOT EXISTS item (pid INTEGER, item_id INTEGER, sort_order INTEGER DEFAULT 0, state INTEGER DEFAULT 0, item_kind TEXT NOT NULL, item_data BLOB, PRIMARY KEY (pid));"];
  [a3 executeSQL:@"CREATE TABLE IF NOT EXISTS properties (key TEXT, value TEXT, PRIMARY KEY (key));"];
  [a3 executeSQL:@"CREATE INDEX IF NOT EXISTS item_item_id ON item (item_id);"];
  [a3 executeSQL:@"CREATE INDEX IF NOT EXISTS item_state ON item (state);"];
  uint64_t v5 = [a3 userVersion];
  if (v5 == 7001)
  {
    [a1 _migrate7001to7002InDatabase:a3];
  }
  else if (v5 == 7000)
  {
    [a1 _migrate7000to7001InDatabase:a3];
  }
  [a3 setUserVersion:7002];
}

+ (id)databasePathWithAccountIdentifier:(int64_t)a3
{
  v3 = objc_msgSend([NSString alloc], "initWithFormat:", @"%lld.sqlitedb", a3);
  v4 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C978]), "initWithObjects:", CPSharedResourcesDirectory(), @"Library", @"com.apple.itunesstored", @"Wishlists", v3, 0);
  uint64_t v5 = (void *)[NSString pathWithComponents:v4];

  return v5;
}

+ (void)_migrate7000to7001InDatabase:(id)a3
{
}

+ (void)_migrate7001to7002InDatabase:(id)a3
{
}

@end