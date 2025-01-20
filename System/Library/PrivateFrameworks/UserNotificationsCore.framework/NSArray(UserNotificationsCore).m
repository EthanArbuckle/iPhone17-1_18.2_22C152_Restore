@interface NSArray(UserNotificationsCore)
- (id)unc_map:()UserNotificationsCore usingLibrarian:;
@end

@implementation NSArray(UserNotificationsCore)

- (id)unc_map:()UserNotificationsCore usingLibrarian:
{
  id v6 = a3;
  id v7 = a4;
  v8 = [MEMORY[0x263EFF980] array];
  v9 = v8;
  if (v6)
  {
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __57__NSArray_UserNotificationsCore__unc_map_usingLibrarian___block_invoke;
    v11[3] = &unk_265568268;
    id v12 = v8;
    id v14 = v6;
    id v13 = v7;
    objc_msgSend(a1, "bs_each:", v11);
  }
  else
  {
    [v8 addObjectsFromArray:a1];
  }

  return v9;
}

@end