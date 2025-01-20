@interface TUIElementImage
+ (Class)objectClass;
+ (id)supportedAttributes;
+ (unint64_t)definesScopes;
+ (void)configureBox:(id)a3 withNode:(id)a4 attributes:(id)a5 context:(id)a6;
@end

@implementation TUIElementImage

+ (id)supportedAttributes
{
  if (qword_2DF6F0 != -1) {
    dispatch_once(&qword_2DF6F0, &stru_255578);
  }
  v2 = (void *)qword_2DF6E8;

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
  id v29 = a3;
  id v9 = a5;
  id v10 = a6;
  v11 = [v9 stringForAttribute:173 node:a4.var0];
  [v29 setLoad:TUIResourceLoadFromString(v11)];

  v12 = [v9 stringForAttribute:87 node:a4.var0];
  [v29 setFilter:v12];

  v13 = [v9 stringForAttribute:86 node:a4.var0];
  v14 = +[TUIBox layerContentsGravityFromString:v13];
  [v29 setContentsGravity:v14];

  id v15 = [v9 lengthForAttribute:115 node:a4.var0];
  [v29 setIntrinsicWidth:v15, v16];
  id v17 = [v9 lengthForAttribute:114 node:a4.var0];
  [v29 setIntrinsicHeight:v17, v18];
  v19 = [v9 colorForAttribute:126 node:a4.var0];
  [v29 setMaskColor:v19];

  [v9 floatForAttribute:60 node:a4.var0];
  [v29 setCornerRadius:];
  [v29 setContinuousCorners:[v9 BOOLForAttribute:59 withDefault:1 node:a4.var0]];
  v20 = [v9 colorForAttribute:80 node:a4.var0];
  [v29 setFallbackColor:v20];

  [v29 setHflipForRTL:[v9 BOOLForAttribute:99 node:a4.var0]];
  [v29 setCrossfadesContents:[v9 BOOLForAttribute:63 node:a4.var0]];
  [v29 setShouldRasterize:[v9 BOOLForAttribute:162 node:a4.var0]];
  [v9 floatForAttribute:146 withDefault:a4.var0 node:1.0];
  double v22 = fmin(v21, 1.0);
  if (v22 < 0.0) {
    double v22 = 0.0;
  }
  [v29 setOpacity:v22];
  v23 = [v9 stringForAttribute:37 node:a4.var0];
  v24 = +[TUIBox blendModeFromString:v23];
  [v29 setBlendMode:v24];

  [v9 floatForAttribute:127 withDefault:a4.var0 node:NAN];
  [v29 setMaxAspectRatio:];
  v25 = [v9 stringForAttribute:213 node:a4.var0];
  if (v25)
  {
    [v29 setUrlString:v25];
    v26 = [v10 baseURLForNode:a4.var0];
    [v29 setBaseURL:v26];
  }
  else
  {
    v27 = [v9 stringForAttribute:172 node:a4.var0];
    [v29 setResourceKind:v27];

    v28 = [v9 objectForAttribute:171 node:a4.var0];
    [v29 setResourceInstance:v28];

    v26 = [v9 objectForAttribute:174 node:a4.var0];
    [v29 setResourceOptions:v26];
  }
}

@end