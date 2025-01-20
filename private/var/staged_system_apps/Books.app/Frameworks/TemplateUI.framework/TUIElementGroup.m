@interface TUIElementGroup
+ (Class)builderClass;
+ (Class)objectClass;
+ (id)requiredBuilderProtocol;
+ (unint64_t)definesScopes;
+ (void)addObject:(id)a3 toContainingBuilder:(id)a4 context:(id)a5;
+ (void)configureObject:(id)a3 withBuilder:(id)a4 context:(id)a5;
+ (void)configureObject:(id)a3 withNode:(id)a4 attributes:(id)a5 context:(id)a6;
@end

@implementation TUIElementGroup

+ (unint64_t)definesScopes
{
  return 63;
}

+ (Class)builderClass
{
  return (Class)objc_opt_class();
}

+ (id)requiredBuilderProtocol
{
  return &OBJC_PROTOCOL___TUIBoxBuilding;
}

+ (Class)objectClass
{
  return (Class)objc_opt_class();
}

+ (void)configureObject:(id)a3 withNode:(id)a4 attributes:(id)a5 context:(id)a6
{
  uint64_t v7 = *(void *)&a4.var0;
  id v14 = a3;
  id v8 = a5;
  uint64_t v9 = v7;
  v10 = [v8 stringForAttribute:96 node:v7];
  [v14 setHalign:[TUIBox halignFromString:v10]];

  v11 = [v8 stringForAttribute:216 node:v7];
  [v14 setValign:[TUIBox valignFromString:v11]];

  v12 = [v8 objectForAttribute:104 node:v7];
  if (v12)
  {
    [v14 setIdentifier:v12];
  }
  else
  {
    v13 = +[NSNumber numberWithUnsignedInt:v7];
    [v14 setIdentifier:v13];
  }
  [v14 setSpan:[v8 unsignedIntegerForAttribute:194 withDefault:1 node:v9]];
}

+ (void)configureObject:(id)a3 withBuilder:(id)a4 context:(id)a5
{
}

+ (void)addObject:(id)a3 toContainingBuilder:(id)a4 context:(id)a5
{
}

@end