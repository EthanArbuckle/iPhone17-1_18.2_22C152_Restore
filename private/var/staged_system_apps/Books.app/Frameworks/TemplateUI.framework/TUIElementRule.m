@interface TUIElementRule
+ (Class)objectClass;
+ (unint64_t)definesScopes;
+ (void)configureBox:(id)a3 withNode:(id)a4 attributes:(id)a5 context:(id)a6;
@end

@implementation TUIElementRule

+ (unint64_t)definesScopes
{
  return 0;
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
  v10 = [v8 colorForAttribute:51 node:var0];
  [v9 setColor:v10];

  id v11 = [v8 stringForAttribute:16 node:var0];

  [v9 setAxis:[TUIBox axisFromString:v11]];
}

@end