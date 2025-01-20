@interface TUIElementComponent
+ (BOOL)instantiateChildren;
+ (Class)objectClass;
+ (id)attributesToIgnoreWhenResolving;
+ (id)containerAttributes;
+ (id)requiredBuilderProtocol;
+ (unint64_t)definesScopes;
+ (void)configureObject:(id)a3 withNode:(id)a4 attributes:(id)a5 context:(id)a6;
+ (void)instantiateNode:(id)a3 withObject:(id)a4 context:(id)a5;
@end

@implementation TUIElementComponent

+ (id)containerAttributes
{
  if (qword_2DF568 != -1) {
    dispatch_once(&qword_2DF568, &stru_2548C0);
  }
  v2 = (void *)qword_2DF560;

  return v2;
}

+ (Class)objectClass
{
  return (Class)objc_opt_class();
}

+ (unint64_t)definesScopes
{
  return 0;
}

+ (id)requiredBuilderProtocol
{
  return 0;
}

+ (id)attributesToIgnoreWhenResolving
{
  if (qword_2DF578 != -1) {
    dispatch_once(&qword_2DF578, &stru_2548E0);
  }
  v2 = (void *)qword_2DF570;

  return v2;
}

+ (BOOL)instantiateChildren
{
  return 0;
}

+ (void)configureObject:(id)a3 withNode:(id)a4 attributes:(id)a5 context:(id)a6
{
  uint64_t var0 = a4.var0;
  id v8 = a3;
  [v8 setNameReference:[a5 nameReferenceForAttribute:137 node:var0]];
}

+ (void)instantiateNode:(id)a3 withObject:(id)a4 context:(id)a5
{
  id v7 = a5;
  [v7 instantiateComponentWithReference:[a4 nameReference] withChildrenOfNode:a3.var0];
}

@end