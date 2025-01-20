@interface TUIElementStructStruct
+ (Class)builderClass;
+ (Class)objectClass;
+ (id)attributesToIgnoreWhenResolving;
+ (id)builderWithNode:(id)a3 object:(id)a4 attributes:(id)a5 context:(id)a6;
+ (id)requiredBuilderProtocol;
+ (unint64_t)definesScopes;
+ (void)addObject:(id)a3 toContainingBuilder:(id)a4 context:(id)a5;
@end

@implementation TUIElementStructStruct

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
  return &OBJC_PROTOCOL___TUIStructBuilding;
}

+ (id)attributesToIgnoreWhenResolving
{
  if (qword_2DF480 != -1) {
    dispatch_once(&qword_2DF480, &stru_253EC8);
  }
  v2 = (void *)qword_2DF478;

  return v2;
}

+ (id)builderWithNode:(id)a3 object:(id)a4 attributes:(id)a5 context:(id)a6
{
  id v8 = a5;
  id v9 = a6;
  unsigned __int16 v10 = (unsigned __int16)[v8 propertyNameForAttribute:137 node:a3.var0];
  unsigned int v11 = [v8 closureForNode:a3.var0];
  v12 = [v8 structForAttribute:32 node:a3.var0];
  v13 = [[_TUIElementStructStructBuilder alloc] initWithName:v10 closure:v11 basedOn:v12 context:v9];

  return v13;
}

+ (void)addObject:(id)a3 toContainingBuilder:(id)a4 context:(id)a5
{
  id v8 = a3;
  id v6 = a4;
  v7 = [v8 finalizeStruct];
  [v6 setStructValue:v7 forKey:(unsigned __int16)[v8 name]];
}

@end