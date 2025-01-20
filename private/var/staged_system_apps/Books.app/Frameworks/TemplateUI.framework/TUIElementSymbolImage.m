@interface TUIElementSymbolImage
+ (BOOL)supportAttribute:(unsigned __int16)a3 feature:(id)a4;
+ (Class)objectClass;
+ (unint64_t)definesScopes;
+ (void)configureBox:(id)a3 withNode:(id)a4 attributes:(id)a5 context:(id)a6;
@end

@implementation TUIElementSymbolImage

+ (unint64_t)definesScopes
{
  return 0;
}

+ (Class)objectClass
{
  return (Class)objc_opt_class();
}

+ (BOOL)supportAttribute:(unsigned __int16)a3 feature:(id)a4
{
  return [a4 isEqualToString:@"multicolor"];
}

+ (void)configureBox:(id)a3 withNode:(id)a4 attributes:(id)a5 context:(id)a6
{
  id v8 = a3;
  id v9 = a5;
  uint64_t var0 = a4.var0;
  v11 = [v9 fontSpecForNode:a4.var0];
  v12 = [v9 stringForAttribute:137 node:var0];
  [v8 setName:v12];

  v13 = [v9 stringForAttribute:192 node:var0];
  [v8 setScale:[TUISymbolImageBox scaleFromString:v13]];

  v14 = [v9 stringForAttribute:222 node:var0];
  [v11 weight];
  [v8 setWeight:[TUISymbolImageBox weightFromString:v14 withDefault:UIImageSymbolWeightForFontWeight(v15)]];

  if (v11) {
    [v11 pointSize];
  }
  else {
    double v16 = 17.0;
  }
  [v8 setFontSize:v16];
  v17 = [v9 stringForAttribute:167 node:var0];
  [v8 setRenderingMode:[TUISymbolImageBox renderingModeFromString:v17]];

  v18 = [v11 foregroundColor];
  if (v18)
  {
    v19 = [v11 foregroundColor];
    v23 = v19;
    v20 = +[NSArray arrayWithObjects:&v23 count:1];
    [v8 setColors:v20];
  }
  else
  {
    v19 = [v9 colorArrayForAttribute:51 node:var0];
    [v8 setColors:v19];
  }

  [v8 setBaseline:[v9 BOOLForAttribute:33 withDefault:1 node:var0]];
  [v9 insetsForAttribute:112 withDefault:var0 node:NAN, NAN, NAN, NAN];
  [v8 setInsets:];
  [v8 setHflipForRTL:[v9 BOOLForAttribute:99 node:var0]];
  v21 = [v9 stringForAttribute:37 node:var0];
  v22 = +[TUIBox blendModeFromString:v21];
  [v8 setBlendMode:v22];
}

@end