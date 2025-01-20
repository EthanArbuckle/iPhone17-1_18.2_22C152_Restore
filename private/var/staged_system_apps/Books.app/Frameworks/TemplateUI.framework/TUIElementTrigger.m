@interface TUIElementTrigger
+ (BOOL)instantiateChildren;
+ (Class)objectClass;
+ (id)supportedAttributes;
+ (unint64_t)definesScopes;
+ (void)configureBox:(id)a3 withNode:(id)a4 attributes:(id)a5 context:(id)a6;
@end

@implementation TUIElementTrigger

+ (id)supportedAttributes
{
  if (qword_2DF5E8 != -1) {
    dispatch_once(&qword_2DF5E8, &stru_254F60);
  }
  v2 = (void *)qword_2DF5E0;

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

+ (void)configureBox:(id)a3 withNode:(id)a4 attributes:(id)a5 context:(id)a6
{
  uint64_t var0 = a4.var0;
  id v8 = a5;
  id v9 = a3;
  [v8 floatForAttribute:210 node:var0];
  [v9 setAnchorOffset:];
  v10 = [v8 stringForAttribute:138 node:var0];
  [v9 setName:v10];

  id v11 = [v8 stringForAttribute:141 node:var0];

  [v9 setObservationMode:[TUITriggerBox observationModeFromString:v11]];
}

+ (BOOL)instantiateChildren
{
  return 0;
}

@end