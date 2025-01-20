@interface TUIElementMediaBackdrop
+ (Class)builderClass;
+ (Class)objectClass;
+ (unint64_t)definesScopes;
+ (void)configureBox:(id)a3 withNode:(id)a4 attributes:(id)a5 context:(id)a6;
@end

@implementation TUIElementMediaBackdrop

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

+ (void)configureBox:(id)a3 withNode:(id)a4 attributes:(id)a5 context:(id)a6
{
  id v24 = a3;
  id v9 = a5;
  id v10 = a6;
  uint64_t var0 = a4.var0;
  v12 = [v9 stringForAttribute:173 node:a4.var0];
  [v24 setLoad:TUIResourceLoadFromString(v12)];

  v13 = [v9 stringForAttribute:86 node:var0];
  v14 = +[TUIBox layerContentsGravityFromString:v13];
  [v24 setContentsGravity:v14];

  [v9 floatForAttribute:60 node:var0];
  [v24 setCornerRadius:];
  [v24 setContinuousCorners:[v9 BOOLForAttribute:59 withDefault:1 node:var0]];
  v15 = [v9 colorForAttribute:80 node:var0];
  [v24 setFallbackColor:v15];

  [v24 setCrossfadesContents:[v9 BOOLForAttribute:63 node:var0]];
  [v24 setShouldRasterize:[v9 BOOLForAttribute:162 node:var0]];
  [v9 floatForAttribute:146 withDefault:var0 node:1.0];
  double v17 = fmin(v16, 1.0);
  if (v17 < 0.0) {
    double v17 = 0.0;
  }
  [v24 setOpacity:v17];
  v18 = [v9 stringForAttribute:37 node:var0];
  v19 = +[TUIBox blendModeFromString:v18];
  [v24 setBlendMode:v19];

  v20 = [v9 stringForAttribute:213 node:var0];
  if (v20)
  {
    [v24 setUrlString:v20];
    v21 = [v10 baseURLForNode:var0];
    [v24 setBaseURL:v21];
  }
  else
  {
    v22 = [v9 stringForAttribute:172 node:var0];
    [v24 setResourceKind:v22];

    v23 = [v9 objectForAttribute:171 node:var0];
    [v24 setResourceInstance:v23];

    v21 = [v9 objectForAttribute:174 node:var0];
    [v24 setResourceOptions:v21];
  }
}

@end