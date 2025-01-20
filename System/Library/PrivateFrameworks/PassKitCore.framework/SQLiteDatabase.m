@interface SQLiteDatabase
- (SQLiteDatabase)init;
- (void)dealloc;
@end

@implementation SQLiteDatabase

- (SQLiteDatabase)init
{
  return 0;
}

- (void)dealloc
{
  sub_10035CCC4((sqlite3 *)self);
  v3.receiver = self;
  v3.super_class = (Class)SQLiteDatabase;
  [(SQLiteDatabase *)&v3 dealloc];
}

@end