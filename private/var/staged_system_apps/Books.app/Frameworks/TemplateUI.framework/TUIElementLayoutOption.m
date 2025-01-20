@interface TUIElementLayoutOption
+ (Class)objectClass;
+ (unint64_t)definesScopes;
+ (void)configureBox:(id)a3 withNode:(id)a4 attributes:(id)a5 context:(id)a6;
@end

@implementation TUIElementLayoutOption

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
  id v11 = a3;
  [v8 floatForAttribute:135 withDefault:var0 node:NAN];
  [v11 setMinScale:];
  [v8 floatForAttribute:131 withDefault:var0 node:NAN];
  double v10 = v9;

  [v11 setMaxScale:v10];
}

@end