@interface NSArray
+ (NSArray)arrayWithXPCArray:(id)a3;
- (NSArray)initWithXPCArray:(id)a3;
- (id)xpcArrayFromArray;
@end

@implementation NSArray

+ (NSArray)arrayWithXPCArray:(id)a3
{
  id v3 = a3;
  id v4 = [objc_alloc((Class)NSArray) initWithXPCArray:v3];

  return (NSArray *)v4;
}

- (NSArray)initWithXPCArray:(id)a3
{
  id v4 = a3;
  uint64_t v15 = 0;
  v16[0] = &v15;
  v16[1] = 0x3032000000;
  v16[2] = sub_1000A223C;
  v16[3] = sub_1000A224C;
  id v17 = +[NSMutableArray array];
  v9 = _NSConcreteStackBlock;
  uint64_t v10 = 3221225472;
  v11 = sub_1000A2254;
  v12 = &unk_100153B20;
  v14 = &v15;
  v5 = self;
  v13 = v5;
  if (xpc_array_apply(v4, &v9))
  {
    v6 = sub_100068600();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      sub_1000DB12C((uint64_t)v16, v6);
    }

    v5 = -[NSArray initWithArray:](v5, "initWithArray:", *(void *)(v16[0] + 40), v9, v10, v11, v12);
    v7 = v5;
  }
  else
  {
    v7 = 0;
  }

  _Block_object_dispose(&v15, 8);
  return v7;
}

- (id)xpcArrayFromArray
{
  uint64_t v9 = 0;
  uint64_t v10 = &v9;
  uint64_t v11 = 0x2020000000;
  char v12 = 1;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000A261C;
  v6[3] = &unk_100153B48;
  xpc_object_t v3 = xpc_array_create(0, 0);
  id v7 = v3;
  v8 = &v9;
  [(NSArray *)self enumerateObjectsUsingBlock:v6];
  if (*((unsigned char *)v10 + 24)) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }

  _Block_object_dispose(&v9, 8);

  return v4;
}

@end