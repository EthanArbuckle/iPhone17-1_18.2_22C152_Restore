@interface SBHIconStateBuilder
+ (id)iconStateByReplacingTodayListsInIconState:(id)a3 withTodayListsFromIconState:(id)a4;
+ (id)iconStateFolderWithName:(id)a3 iconLists:(id)a4;
+ (id)iconStateWithIconLists:(id)a3;
+ (id)iconStateWithIconLists:(id)a3 dock:(id)a4;
@end

@implementation SBHIconStateBuilder

+ (id)iconStateWithIconLists:(id)a3 dock:(id)a4
{
  v11[2] = *MEMORY[0x1E4F143B8];
  v10[0] = @"iconLists";
  v10[1] = @"buttonBar";
  v11[0] = a3;
  v11[1] = a4;
  v5 = (void *)MEMORY[0x1E4F1C9E8];
  id v6 = a4;
  id v7 = a3;
  v8 = [v5 dictionaryWithObjects:v11 forKeys:v10 count:2];

  return v8;
}

+ (id)iconStateWithIconLists:(id)a3
{
  v8[1] = *MEMORY[0x1E4F143B8];
  id v7 = @"iconLists";
  v8[0] = a3;
  v3 = (void *)MEMORY[0x1E4F1C9E8];
  id v4 = a3;
  v5 = [v3 dictionaryWithObjects:v8 forKeys:&v7 count:1];

  return v5;
}

+ (id)iconStateFolderWithName:(id)a3 iconLists:(id)a4
{
  void v11[3] = *MEMORY[0x1E4F143B8];
  v10[0] = @"listType";
  v10[1] = @"displayName";
  v11[0] = @"folder";
  v11[1] = a3;
  void v10[2] = @"iconLists";
  v11[2] = a4;
  v5 = (void *)MEMORY[0x1E4F1C9E8];
  id v6 = a4;
  id v7 = a3;
  v8 = [v5 dictionaryWithObjects:v11 forKeys:v10 count:3];

  return v8;
}

+ (id)iconStateByReplacingTodayListsInIconState:(id)a3 withTodayListsFromIconState:(id)a4
{
  id v5 = a4;
  id v6 = (void *)[a3 mutableCopy];
  id v7 = [v5 objectForKey:@"today"];
  if (v7) {
    [v6 setObject:v7 forKey:@"today"];
  }
  v8 = [v5 objectForKey:@"favoriteToday"];
  if (v8) {
    [v6 setObject:v8 forKey:@"favoriteToday"];
  }

  return v6;
}

@end