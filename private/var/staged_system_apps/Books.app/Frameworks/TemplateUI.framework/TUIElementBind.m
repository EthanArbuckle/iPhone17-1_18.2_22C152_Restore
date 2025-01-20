@interface TUIElementBind
+ (Class)objectClass;
+ (id)attributesToIgnoreWhenResolving;
+ (id)builderProtocols;
+ (id)requiredBuilderProtocols;
+ (id)supportedAttributes;
+ (unint64_t)definesScopes;
+ (void)configureObject:(id)a3 withNode:(id)a4 attributes:(id)a5 context:(id)a6;
+ (void)instantiateChildrenOfNode:(id)a3 object:(id)a4 containingBuilder:(id)a5 context:(id)a6 block:(id)a7;
@end

@implementation TUIElementBind

+ (id)supportedAttributes
{
  if (qword_2DFAC0 != -1) {
    dispatch_once(&qword_2DFAC0, &stru_257510);
  }
  v2 = (void *)qword_2DFAB8;

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
  return 0;
}

+ (id)requiredBuilderProtocols
{
  return 0;
}

+ (void)configureObject:(id)a3 withNode:(id)a4 attributes:(id)a5 context:(id)a6
{
  uint64_t var0 = a4.var0;
  id v8 = a5;
  id v9 = a3;
  [v9 setSelect:[v8 enumeratorWithAttribute:183 node:var0]];
  id v10 = [v8 unsignedIntegerForAttribute:85 withDefault:0x7FFFFFFFFFFFFFFFLL node:var0];
  id v11 = [v8 unsignedIntegerForAttribute:83 withDefault:0x7FFFFFFFFFFFFFFFLL node:var0];
  id v12 = [v8 unsignedIntegerForAttribute:82 withDefault:0x7FFFFFFFFFFFFFFFLL node:var0];
  id v13 = [v8 unsignedIntegerForAttribute:84 withDefault:0x7FFFFFFFFFFFFFFFLL node:var0];
  LODWORD(var0) = [v8 unconditionalValueForAttribute:70 node:var0];

  id v14 = +[TUIDynamicInstantiateOptions optionsWithFetchWindow:v10 fetchInitial:v11 fetchDelta:v12 fetchPadding:v13 uniqueID:var0];
  [v9 setOptions:v14];
}

+ (id)attributesToIgnoreWhenResolving
{
  if (qword_2DFAD0 != -1) {
    dispatch_once(&qword_2DFAD0, &stru_257530);
  }
  v2 = (void *)qword_2DFAC8;

  return v2;
}

+ (void)instantiateChildrenOfNode:(id)a3 object:(id)a4 containingBuilder:(id)a5 context:(id)a6 block:(id)a7
{
  id v14 = a5;
  id v10 = a6;
  id v11 = a4;
  LODWORD(a4) = [v11 select];
  id v12 = [v11 options];

  id v13 = [v10 instantiateEnumerator:a4 withChildrenOfNode:a3.var0 options:v12];

  if (v13) {
    [v14 addModel:v13];
  }
}

@end