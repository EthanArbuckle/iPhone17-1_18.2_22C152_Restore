@interface DirectUploadDatabaseSchema
+ (id)databasePath;
- (void)createSchemaInDatabase:(id)a3;
@end

@implementation DirectUploadDatabaseSchema

+ (id)databasePath
{
  v2 = NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, 1uLL, 1);
  v3 = [v2 firstObject];

  id v4 = objc_msgSend(objc_alloc((Class)NSArray), "initWithObjects:", v3, @"com.apple.itunesstored", @"uploads.sqlitedb", 0);
  v5 = +[NSString pathWithComponents:v4];

  return v5;
}

- (void)createSchemaInDatabase:(id)a3
{
  id v10 = a3;
  uint64_t v3 = (uint64_t)[v10 userVersion];
  if (v3)
  {
    if (v3 > 12) {
      goto LABEL_19;
    }
    id v4 = v10;
    while (2)
    {
      switch(v3)
      {
        case 1:
          id v5 = v10;
          [v5 executeSQL:@"CREATE TABLE IF NOT EXISTS content_item (pid INTEGER,post_id INTEGER NOT NULL,item_id TEXT,type TEXT,PRIMARY KEY (pid));"];
          [v5 executeSQL:@"ALTER TABLE post ADD COLUMN author_type TEXT;"];

          id v4 = v10;
          uint64_t v3 = 2;
          continue;
        case 2:
          [v4 executeSQL:@"ALTER TABLE upload ADD COLUMN failure_count INTEGER DEFAULT 0;"];
          id v4 = v10;
          uint64_t v3 = 3;
          continue;
        case 3:
          [v4 executeSQL:@"ALTER TABLE upload ADD COLUMN asset_token_type TEXT;"];
          id v4 = v10;
          uint64_t v3 = 4;
          continue;
        case 4:
          [v4 executeSQL:@"ALTER TABLE upload ADD COLUMN owns_asset INTEGER DEFAULT 0;"];
          id v4 = v10;
          uint64_t v3 = 5;
          continue;
        case 5:
          id v6 = v10;
          [v6 executeSQL:@"ALTER TABLE upload ADD COLUMN parent_relationship_type TEXT;"];
          [v6 executeSQL:@"ALTER TABLE upload ADD COLUMN parent_upload_id INTEGER DEFAULT 0;"];

          id v4 = v10;
          uint64_t v3 = 6;
          continue;
        case 6:
          id v7 = v10;
          [v7 executeSQL:@"ALTER TABLE upload ADD COLUMN preview_frame_time DOUBLE DEFAULT 0;"];
          [v7 executeSQL:@"ALTER TABLE upload ADD COLUMN upload_time DOUBLE;"];

          id v4 = v10;
          uint64_t v3 = 7;
          continue;
        case 7:
          [v4 executeSQL:@"ALTER TABLE post ADD COLUMN is_failed INTEGER DEFAULT 0;"];
          id v4 = v10;
          uint64_t v3 = 8;
          continue;
        case 8:
          [v4 executeSQL:@"ALTER TABLE upload ADD COLUMN album_id TEXT;"];
          id v4 = v10;
          uint64_t v3 = 9;
          continue;
        case 9:
          [v4 executeSQL:@"ALTER TABLE artist ADD COLUMN order_index INTEGER DEFAULT 0;"];
          id v4 = v10;
          uint64_t v3 = 10;
          continue;
        case 10:
          [v4 executeSQL:@"ALTER TABLE post ADD COLUMN is_attributed INTEGER DEFAULT 0;"];
          id v4 = v10;
          uint64_t v3 = 11;
          continue;
        case 11:
          id v8 = v10;
          [v8 executeSQL:@"ALTER TABLE post ADD COLUMN activity_id TEXT;"];
          [v8 executeSQL:@"ALTER TABLE post ADD COLUMN poll_count INTEGER DEFAULT 0;"];
          [v8 executeSQL:@"ALTER TABLE post ADD COLUMN poll_interval DOUBLE DEFAULT 0;"];

          id v4 = v10;
          uint64_t v3 = 12;
          continue;
        case 12:
          CFStringRef v9 = @"ALTER TABLE post ADD COLUMN poll_duration DOUBLE DEFAULT 10800;";
          break;
        default:
          continue;
      }
      break;
    }
  }
  else
  {
    [v10 executeSQL:@"CREATE TABLE IF NOT EXISTS artist (pid INTEGER,upload_id INTEGER NOT NULL,artist_id TEXT,order_index INTEGER DEFAULT 0,name TEXT,PRIMARY KEY (pid));"];
    [v10 executeSQL:@"CREATE TABLE IF NOT EXISTS content_item (pid INTEGER,post_id INTEGER NOT NULL,item_id TEXT,type TEXT,PRIMARY KEY (pid));"];
    [v10 executeSQL:@"CREATE TABLE IF NOT EXISTS external_target (pid INTEGER,access_token TEXT,page_access_token TEXT,page_id TEXT,post_id INTEGER NOT NULL,service_type INTEGER NOT NULL,PRIMARY KEY (pid));"];
    [v10 executeSQL:@"CREATE TABLE IF NOT EXISTS post (pid INTEGER,account_id INTEGER NOT NULL,activity_id TEXT,author_id TEXT,author_type TEXT,creation_time DOUBLE,failure_count INTEGER DEFAULT 0,is_attributed INTEGER DEFAULT 0,is_failed INTEGER DEFAULT 0,message TEXT,poll_count INTEGER DEFAULT 0,poll_interval DOUBLE DEFAULT 0,poll_duration DOUBLE DEFAULT 10800,source_app TEXT,PRIMARY KEY (pid));"];
    CFStringRef v9 = @"CREATE TABLE IF NOT EXISTS upload (pid INTEGER,album_id TEXT,asset_token TEXT,asset_token_type TEXT,asset_url TEXT NOT NULL,category_name TEXT,creation_time DOUBLE,description TEXT,error_code INTEGER,error_domain TEXT,error_message TEXT,failure_count INTEGER DEFAULT 0,is_explicit INTEGER DEFAULT 0,kind TEXT,owns_asset INTEGER DEFAULT 0,parent_relationship_type TEXT,parent_upload_id INTEGER DEFAULT 0,preview_frame_time DOUBLE DEFAULT 0,post_id INTEGER,source_app TEXT,state INTEGER DEFAULT 0,subtitle TEXT,thumbnail_url TEXT,title TEXT,upload_time DOUBLE,uti TEXT NOT NULL,PRIMARY KEY (pid));";
  }
  [v10 executeSQL:v9];
  [v10 setUserVersion:13];
LABEL_19:
}

@end