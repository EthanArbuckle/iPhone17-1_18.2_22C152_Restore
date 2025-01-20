@interface NSUserActivity(UINSItemProvider)
+ (id)objectWithItemProviderData:()UINSItemProvider typeIdentifier:error:;
+ (id)readableTypeIdentifiersForItemProvider;
+ (id)writableTypeIdentifiersForItemProvider;
- (id)initWithItemProviderData:()UINSItemProvider typeIdentifier:error:;
- (uint64_t)loadDataWithTypeIdentifier:()UINSItemProvider forItemProviderCompletionHandler:;
@end

@implementation NSUserActivity(UINSItemProvider)

+ (id)readableTypeIdentifiersForItemProvider
{
  v2[1] = *MEMORY[0x1E4F143B8];
  v2[0] = @"com.apple.uikit.useractivity";
  v0 = [MEMORY[0x1E4F1C978] arrayWithObjects:v2 count:1];
  return v0;
}

+ (id)objectWithItemProviderData:()UINSItemProvider typeIdentifier:error:
{
  id v7 = a3;
  v8 = [MEMORY[0x1E4F442D8] _typeWithIdentifier:a4 allowUndeclared:1];
  v9 = [MEMORY[0x1E4F442D8] _typeWithIdentifier:@"com.apple.uikit.useractivity" allowUndeclared:1];
  if ([v8 conformsToType:v9])
  {

LABEL_4:
    v12 = (void *)[objc_alloc((Class)objc_opt_class()) _initWithUserActivityData:v7];
    id v13 = 0;
    goto LABEL_5;
  }
  v10 = [MEMORY[0x1E4F442D8] _typeWithIdentifier:@"com.apple.uikit.scene" allowUndeclared:1];
  int v11 = [v8 conformsToType:v10];

  if (v11) {
    goto LABEL_4;
  }
  v15 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F281F8] code:1024 userInfo:0];
  id v13 = v15;
  v12 = 0;
  if (a5 && v15)
  {
    id v13 = v15;
    v12 = 0;
    *a5 = v13;
  }
LABEL_5:

  return v12;
}

- (id)initWithItemProviderData:()UINSItemProvider typeIdentifier:error:
{
  uint64_t v8 = *MEMORY[0x1E4F28AC0];
  id v9 = a4;
  id v10 = a3;
  int v11 = (void *)[a1 initWithActivityType:v8];
  v12 = [(id)objc_opt_class() objectWithItemProviderData:v10 typeIdentifier:v9 error:a5];

  id v13 = v12;
  return v13;
}

+ (id)writableTypeIdentifiersForItemProvider
{
  v2[1] = *MEMORY[0x1E4F143B8];
  v2[0] = @"com.apple.uikit.useractivity";
  v0 = [MEMORY[0x1E4F1C978] arrayWithObjects:v2 count:1];
  return v0;
}

- (uint64_t)loadDataWithTypeIdentifier:()UINSItemProvider forItemProviderCompletionHandler:
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    if (([v6 isEqualToString:@"com.apple.uikit.useractivity"] & 1) != 0
      || [v6 isEqualToString:@"com.apple.uikit.scene"])
    {
      id v8 = a1;
      id v9 = v7;
      id v10 = dispatch_get_global_queue(0, 0);
      v13[0] = MEMORY[0x1E4F143A8];
      v13[1] = 3221225472;
      v13[2] = __createDataWithCompletion_block_invoke;
      v13[3] = &unk_1E52DA160;
      id v14 = v8;
      id v15 = v9;
      id v11 = v8;
      dispatch_async(v10, v13);
    }
    else
    {
      (*((void (**)(id, void, void))v7 + 2))(v7, 0, 0);
    }
  }

  return 0;
}

@end