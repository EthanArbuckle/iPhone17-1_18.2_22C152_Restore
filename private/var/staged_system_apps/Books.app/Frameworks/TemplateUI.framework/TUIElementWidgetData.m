@interface TUIElementWidgetData
+ (id)requiredBuilderProtocol;
+ (unint64_t)definesScopes;
+ (void)configureContainingBuilder:(id)a3 withNode:(id)a4 attributes:(id)a5 context:(id)a6;
@end

@implementation TUIElementWidgetData

+ (unint64_t)definesScopes
{
  return 0;
}

+ (id)requiredBuilderProtocol
{
  return &OBJC_PROTOCOL___TUIWidgetBuilding;
}

+ (void)configureContainingBuilder:(id)a3 withNode:(id)a4 attributes:(id)a5 context:(id)a6
{
  id v11 = a3;
  id v8 = a5;
  v9 = [v8 stringForAttribute:137 node:a4.var0];
  v10 = [v8 objectForAttribute:215 node:a4.var0];

  if (v9 && v10) {
    [v11 addWidgetData:v10 withKey:v9];
  }
}

@end