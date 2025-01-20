@interface TUIElementChart
+ (Class)objectClass;
+ (id)supportedAttributes;
+ (unint64_t)definesScopes;
+ (void)configureBox:(id)a3 withNode:(id)a4 attributes:(id)a5 context:(id)a6;
@end

@implementation TUIElementChart

+ (unint64_t)definesScopes
{
  return 63;
}

+ (id)supportedAttributes
{
  if (qword_2DF350 != -1) {
    dispatch_once(&qword_2DF350, &stru_252CF8);
  }
  v2 = (void *)qword_2DF348;

  return v2;
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
  id v26 = [v8 stringForAttribute:49 node:var0];
  v10 = [v8 stringForAttribute:204 node:var0];
  v11 = [v8 stringForAttribute:200 node:var0];
  [v8 floatForAttribute:52 node:var0];
  uint64_t v13 = (uint64_t)fmax(v12, 1.0);
  [v8 floatForAttribute:60 node:var0];
  double v15 = v14;
  [v8 floatForAttribute:157 node:var0];
  double v17 = v16;
  [v8 floatForAttribute:193 node:var0];
  double v19 = v18;
  v20 = [v8 colorForAttribute:51 node:var0];
  v21 = [v8 colorForAttribute:30 node:var0];
  v22 = [v8 colorForAttribute:185 node:var0];
  v23 = [v8 fontSpecForNode:var0];

  v24 = [v23 attributesForAttributedString];
  [v9 setChartType:v26];
  [v9 setTitle:v10];
  [v9 setFooter:v11];
  [v9 setColumns:v13];
  [v9 setCornerRadius:v15];
  [v9 setProgress:v17];
  [v9 setSpacing:v19];
  [v9 setColor:v20];
  [v9 setBackgroundColor:v21];
  [v9 setShadowColor:v22];
  [v9 setFontSpec:v23];
  v25 = [v24 attributes];
  [v9 setFontAttributes:v25];
}

@end