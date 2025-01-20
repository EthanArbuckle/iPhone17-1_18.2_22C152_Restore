@interface TUIElementLinkEntity
+ (Class)builderClass;
+ (Class)objectClass;
+ (id)requiredBuilderProtocol;
+ (unint64_t)definesScopes;
+ (void)addObject:(id)a3 toContainingBuilder:(id)a4 context:(id)a5;
+ (void)configureObject:(id)a3 withNode:(id)a4 attributes:(id)a5 context:(id)a6;
@end

@implementation TUIElementLinkEntity

+ (unint64_t)definesScopes
{
  return 0;
}

+ (id)requiredBuilderProtocol
{
  return &OBJC_PROTOCOL___TUILinkEntityConsuming;
}

+ (Class)objectClass
{
  return (Class)objc_opt_class();
}

+ (Class)builderClass
{
  return (Class)objc_opt_class();
}

+ (void)configureObject:(id)a3 withNode:(id)a4 attributes:(id)a5 context:(id)a6
{
  uint64_t var0 = a4.var0;
  id v8 = a5;
  id v9 = a3;
  v10 = [v8 stringForAttribute:212 node:var0];
  [v9 setType:v10];

  v11 = [v8 stringForAttribute:104 node:var0];
  [v9 setIdentifier:v11];

  id v12 = [v8 stringForAttribute:204 node:var0];

  [v9 setTitle:v12];
}

+ (void)addObject:(id)a3 toContainingBuilder:(id)a4 context:(id)a5
{
  id v8 = a4;
  v7 = [a3 finalizeLinkEntityWithContext:a5];
  if (v7) {
    [v8 addLinkEntity:v7];
  }
}

@end