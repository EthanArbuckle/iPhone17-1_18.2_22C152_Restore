@interface TUIElementComponentRender
+ (BOOL)instantiateChildren;
+ (BOOL)resolveAttributes;
+ (Class)objectClass;
+ (id)attributesToIgnoreWhenResolving;
+ (id)builderProtocols;
+ (id)containerAttributes;
+ (id)requiredBuilderProtocol;
+ (unint64_t)definesScopes;
+ (void)configureObject:(id)a3 withNode:(id)a4 attributes:(id)a5 context:(id)a6;
+ (void)instantiateNode:(id)a3 withObject:(id)a4 context:(id)a5;
@end

@implementation TUIElementComponentRender

+ (id)containerAttributes
{
  if (qword_2DF5A8 != -1) {
    dispatch_once(&qword_2DF5A8, &stru_254940);
  }
  v2 = (void *)qword_2DF5A0;

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
  return &OBJC_PROTOCOL___TUIModelBuilding;
}

+ (id)builderProtocols
{
  return 0;
}

+ (BOOL)resolveAttributes
{
  return 1;
}

+ (id)attributesToIgnoreWhenResolving
{
  if (qword_2DF5B8 != -1) {
    dispatch_once(&qword_2DF5B8, &stru_254960);
  }
  v2 = (void *)qword_2DF5B0;

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
  id v10 = a4;
  id v7 = a5;
  unsigned int v8 = [v10 nameReference];
  [v7 instantiateRender:v8 withChildrenOfNode:a3.var0];
}

@end