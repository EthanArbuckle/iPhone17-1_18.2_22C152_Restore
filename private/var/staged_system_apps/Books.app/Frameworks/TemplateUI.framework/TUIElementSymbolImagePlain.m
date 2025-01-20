@interface TUIElementSymbolImagePlain
+ (Class)builderClass;
+ (Class)objectClass;
+ (id)requiredBuilderProtocol;
+ (unint64_t)definesScopes;
+ (void)addObject:(id)a3 toContainingBuilder:(id)a4 context:(id)a5;
+ (void)configureObject:(id)a3 withNode:(id)a4 attributes:(id)a5 context:(id)a6;
@end

@implementation TUIElementSymbolImagePlain

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

+ (id)requiredBuilderProtocol
{
  return &OBJC_PROTOCOL___TUIPlainImageConsuming;
}

+ (void)configureObject:(id)a3 withNode:(id)a4 attributes:(id)a5 context:(id)a6
{
  id v9 = a5;
  id v10 = a6;
  uint64_t var0 = a4.var0;
  id v12 = a3;
  v13 = v10;
  id v49 = v12;
  v14 = [v9 fontSpecForNode:a4.var0];
  v15 = [v10 environment];
  v16 = [v14 mappedSpecIfNeededWithEnvironment:v15];

  v50 = [v9 stringForAttribute:137 node:var0];
  v17 = [v9 stringForAttribute:192 node:var0];
  int64_t v18 = +[TUISymbolImageBox scaleFromString:v17];

  v19 = [v9 stringForAttribute:222 node:var0];
  [v16 weight];
  int64_t v21 = +[TUISymbolImageBox weightFromString:v19 withDefault:UIImageSymbolWeightForFontWeight(v20)];

  v22 = [v9 stringForAttribute:167 node:var0];
  unint64_t v23 = +[TUISymbolImageBox renderingModeFromString:v22];

  uint64_t v24 = [v9 colorForAttribute:51 node:var0];
  v48 = (void *)v24;
  if (v24)
  {
    uint64_t v51 = v24;
    uint64_t v25 = +[NSArray arrayWithObjects:&v51 count:1];
  }
  else
  {
    uint64_t v25 = [v9 colorArrayForAttribute:51 node:var0];
  }
  v26 = (void *)v25;
  [v16 pointSize];
  v27 = +[UIImageSymbolConfiguration tui_configurationWithPointSize:weight:scale:renderingMode:colors:](UIImageSymbolConfiguration, "tui_configurationWithPointSize:weight:scale:renderingMode:colors:", v21, v18, v23, v26);
  v28 = +[UIImage _systemImageNamed:v50 withConfiguration:v27];
  if (!v28)
  {
    [v10 manager];
    v29 = v47 = v16;
    v30 = [v29 imageResourceCache];
    v31 = [v30 customImageBundle];
    v28 = +[UIImage imageNamed:v50 inBundle:v31 withConfiguration:v27];

    v13 = v10;
    v16 = v47;
  }
  if ((objc_msgSend(v28, "tui_isMulticolorSymbolWithSymbolRenderingMode:", v23) & 1) == 0
    && [v26 count])
  {
    v32 = [v26 firstObject];
    [v28 imageWithTintColor:v32];
    uint64_t v34 = v33 = v16;

    v28 = (void *)v34;
    v16 = v33;
  }
  if ([v9 BOOLForAttribute:99 node:var0])
  {
    uint64_t v35 = [v28 imageFlippedForRightToLeftLayoutDirection];

    v28 = (void *)v35;
  }
  if (v28)
  {
    v36 = [v13 identifierWithNode:var0];
    v37 = v16;
    v38 = [TUIImageModel alloc];
    [v28 size];
    double v40 = v39;
    double v42 = v41;
    id v43 = [v28 renderingMode];
    v44 = v38;
    v16 = v37;
    v45 = -[TUIImageModel initWithIdentifier:image:size:renderMode:alignmentRectInsets:](v44, "initWithIdentifier:image:size:renderMode:alignmentRectInsets:", v36, v28, v43, v40, v42, UIEdgeInsetsZero.top, UIEdgeInsetsZero.left, UIEdgeInsetsZero.bottom, UIEdgeInsetsZero.right);
  }
  else
  {
    v45 = 0;
  }
  [v49 setImageModel:v45];
  v46 = [v9 stringForAttribute:176 node:var0];
  [v49 setRole:v46];
}

+ (void)addObject:(id)a3 toContainingBuilder:(id)a4 context:(id)a5
{
  id v6 = a4;
  id v7 = a3;
  id v9 = [v7 imageModel];
  v8 = [v7 role];

  [v6 addImageModel:v9 forRole:v8];
}

@end