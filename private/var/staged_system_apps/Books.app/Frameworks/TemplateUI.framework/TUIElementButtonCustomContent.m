@interface TUIElementButtonCustomContent
+ (Class)builderClass;
+ (Class)objectClass;
+ (id)requiredBuilderProtocol;
+ (unint64_t)definesScopes;
+ (void)addObject:(id)a3 toContainingBuilder:(id)a4 context:(id)a5;
+ (void)configureObject:(id)a3 withBuilder:(id)a4 context:(id)a5;
@end

@implementation TUIElementButtonCustomContent

+ (unint64_t)definesScopes
{
  return 63;
}

+ (Class)objectClass
{
  return (Class)objc_opt_class();
}

+ (Class)builderClass
{
  return (Class)objc_opt_class();
}

+ (id)requiredBuilderProtocol
{
  return &OBJC_PROTOCOL___TUIButtonCustomContentBuilding;
}

+ (void)configureObject:(id)a3 withBuilder:(id)a4 context:(id)a5
{
  id v10 = a3;
  id v7 = a5;
  v8 = [a4 finalizeModelsWithParent:0 box:0 context:v7];
  if ([v8 count] == (char *)&def_141F14 + 1)
  {
    v9 = [v8 firstObject];
    [v10 setModel:v9];
  }
  else
  {
    [v7 reportError:1021];
  }
}

+ (void)addObject:(id)a3 toContainingBuilder:(id)a4 context:(id)a5
{
  id v9 = a3;
  id v6 = a4;
  id v7 = [v9 model];

  if (v7)
  {
    v8 = [v9 model];
    [v6 addContentModel:v8];
  }
}

@end