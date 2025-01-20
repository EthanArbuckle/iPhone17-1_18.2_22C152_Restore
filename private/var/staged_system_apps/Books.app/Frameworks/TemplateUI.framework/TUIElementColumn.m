@interface TUIElementColumn
+ (Class)objectClass;
+ (unint64_t)definesScopes;
+ (void)configureBox:(id)a3 withNode:(id)a4 attributes:(id)a5 context:(id)a6;
@end

@implementation TUIElementColumn

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
  id v12 = a3;
  v9 = [v8 objectForAttribute:55 node:var0];
  [v12 setColumnSpan:v9];

  [v8 floatForAttribute:57 withDefault:var0 node:NAN];
  double v11 = v10;

  [v12 setContainerFraction:v11];
}

@end