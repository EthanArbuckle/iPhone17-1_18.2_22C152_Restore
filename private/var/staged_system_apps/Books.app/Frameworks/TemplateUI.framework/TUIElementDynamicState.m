@interface TUIElementDynamicState
+ (Class)objectClass;
+ (id)attributesToIgnoreWhenResolving;
+ (id)builderProtocols;
+ (id)requiredBuilderProtocol;
+ (id)supportedAttributes;
+ (unint64_t)definesScopes;
+ (void)configureObject:(id)a3 withNode:(id)a4 attributes:(id)a5 context:(id)a6;
+ (void)instantiateChildrenOfNode:(id)a3 object:(id)a4 containingBuilder:(id)a5 context:(id)a6 block:(id)a7;
@end

@implementation TUIElementDynamicState

+ (id)supportedAttributes
{
  if (qword_2DF290 != -1) {
    dispatch_once(&qword_2DF290, &stru_252728);
  }
  v2 = (void *)qword_2DF288;

  return v2;
}

+ (unint64_t)definesScopes
{
  return 63;
}

+ (Class)objectClass
{
  return (Class)objc_opt_class();
}

+ (id)builderProtocols
{
  v4 = &OBJC_PROTOCOL___TUIBoxBuilding;
  v2 = +[NSArray arrayWithObjects:&v4 count:1];

  return v2;
}

+ (id)requiredBuilderProtocol
{
  return &OBJC_PROTOCOL___TUIBoxBuilding;
}

+ (id)attributesToIgnoreWhenResolving
{
  if (qword_2DF2A0 != -1) {
    dispatch_once(&qword_2DF2A0, &stru_252748);
  }
  v2 = (void *)qword_2DF298;

  return v2;
}

+ (void)configureObject:(id)a3 withNode:(id)a4 attributes:(id)a5 context:(id)a6
{
  uint64_t var0 = a4.var0;
  id v8 = a5;
  id v9 = a3;
  [v9 setBinding:[v8 bindingNameForAttribute:36 node:var0]];
  v10 = [v8 stringForAttribute:116 node:var0];
  [v9 setKind:v10];

  v11 = [v8 objectForAttribute:113 node:var0];
  [v9 setInstance:v11];

  id v12 = [v8 objectForAttribute:150 node:var0];

  [v9 setParameters:v12];
}

+ (void)instantiateChildrenOfNode:(id)a3 object:(id)a4 containingBuilder:(id)a5 context:(id)a6 block:(id)a7
{
  id v17 = a5;
  id v10 = a6;
  id v11 = a4;
  id v12 = [v11 kind];
  v13 = [v11 instance];
  v14 = [v11 parameters];
  v15 = [v10 dynamicStateForKind:v12 instance:v13 parameters:v14];

  LODWORD(v12) = [v11 binding];
  v16 = [v10 instantiateBinding:v12 withDynamicProvider:v15 childrenOfNode:a3.var0];

  if (v16) {
    [v17 addModel:v16];
  }
}

@end