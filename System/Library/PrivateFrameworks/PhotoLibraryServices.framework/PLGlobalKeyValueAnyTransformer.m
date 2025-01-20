@interface PLGlobalKeyValueAnyTransformer
+ (id)allowedTopLevelClasses;
@end

@implementation PLGlobalKeyValueAnyTransformer

+ (id)allowedTopLevelClasses
{
  v2 = (void *)MEMORY[0x1E4F1CA80];
  v8.receiver = a1;
  v8.super_class = (Class)&OBJC_METACLASS___PLGlobalKeyValueAnyTransformer;
  v3 = objc_msgSendSuper2(&v8, sel_allowedTopLevelClasses);
  v4 = [v2 setWithArray:v3];

  v5 = +[PLGlobalKeyValue allDecodeClasses];
  [v4 unionSet:v5];

  v6 = [v4 allObjects];

  return v6;
}

@end