@interface TUIElementStruct
+ (Class)builderClass;
+ (Class)objectClass;
+ (id)attributesToIgnoreWhenResolving;
+ (id)builderWithNode:(id)a3 object:(id)a4 attributes:(id)a5 context:(id)a6;
+ (id)requiredBuilderProtocol;
+ (unint64_t)definesScopes;
+ (void)configureObject:(id)a3 withBuilder:(id)a4 context:(id)a5;
@end

@implementation TUIElementStruct

+ (unint64_t)definesScopes
{
  return 0;
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
  return 0;
}

+ (id)attributesToIgnoreWhenResolving
{
  if (qword_2DF470 != -1) {
    dispatch_once(&qword_2DF470, &stru_253EA8);
  }
  v2 = (void *)qword_2DF468;

  return v2;
}

+ (id)builderWithNode:(id)a3 object:(id)a4 attributes:(id)a5 context:(id)a6
{
  id v8 = a5;
  id v9 = a6;
  unsigned int v10 = [v8 constantNameForAttribute:137 node:a3.var0];
  unsigned int v11 = [v8 closureForNode:a3.var0];
  v12 = [v8 structForAttribute:32 node:a3.var0];
  v13 = [[_TUIElementStructBuilder alloc] initWithName:v10 closure:v11 basedOn:v12 context:v9];

  return v13;
}

+ (void)configureObject:(id)a3 withBuilder:(id)a4 context:(id)a5
{
  id v8 = a4;
  id v6 = a5;
  v7 = [v8 finalizeStruct];
  [v6 defineStruct:v7 withName:[v8 name]];
}

@end