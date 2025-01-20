@interface SSSQLiteQuery
- (void)enumerateSSVDirectUploadsUsingBlock:(id)a3;
@end

@implementation SSSQLiteQuery

- (void)enumerateSSVDirectUploadsUsingBlock:(id)a3
{
  v8[0] = @"category_name";
  v8[1] = @"error_code";
  v8[2] = @"error_domain";
  v8[3] = @"error_message";
  v8[4] = @"is_explicit";
  v8[5] = @"state";
  v8[6] = @"subtitle";
  v8[7] = @"thumbnail_url";
  v8[8] = @"title";
  v8[9] = @"kind";
  v8[10] = @"uti";
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100101540;
  v6[3] = &unk_1003A67F8;
  id v4 = a3;
  id v7 = v4;
  [(SSSQLiteQuery *)self enumeratePersistentIDsAndProperties:v8 count:11 usingBlock:v6];

  for (uint64_t i = 10; i != -1; --i)
}

@end