@interface TUIElementImagePlain
+ (Class)builderClass;
+ (Class)objectClass;
+ (id)requiredBuilderProtocol;
+ (unint64_t)definesScopes;
+ (void)addObject:(id)a3 toContainingBuilder:(id)a4 context:(id)a5;
+ (void)configureObject:(id)a3 withNode:(id)a4 attributes:(id)a5 context:(id)a6;
@end

@implementation TUIElementImagePlain

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
  id v47 = a5;
  uint64_t var0 = a4.var0;
  id v10 = a6;
  id v11 = a3;
  v12 = [v47 stringForAttribute:213 node:a4.var0];
  v13 = [v10 baseURLForNode:a4.var0];
  [v47 sizeForAttribute:192 node:var0];
  double v15 = v14;
  double v17 = v16;
  v18 = [v47 stringForAttribute:167 node:var0];
  int64_t v19 = +[TUIBox imageRenderingModeFromString:v18];

  [v47 insetsForAttribute:3 node:var0];
  double v21 = v20;
  double v23 = v22;
  double v25 = v24;
  double v27 = v26;
  v28 = [v10 identifierWithNode:var0];

  if (!v12)
  {
    v33 = 0;
    v32 = 0;
    goto LABEL_19;
  }
  v29 = +[NSURL URLWithString:v12];
  v30 = v29;
  if (!v29
    || ([v29 isFileURL] & 1) == 0
    && ([v30 scheme], v31 = objc_claimAutoreleasedReturnValue(), v31, v31))
  {
    v32 = -[TUIImageModel initWithIdentifier:urlString:baseURL:size:renderMode:alignmentRectInsets:]([TUIImageModel alloc], "initWithIdentifier:urlString:baseURL:size:renderMode:alignmentRectInsets:", v28, v12, v13, v19, v15, v17, v21, v23, v25, v27);
    v33 = v30;
    goto LABEL_19;
  }
  v33 = +[NSURL URLWithString:v12 relativeToURL:v13];

  if (!v33)
  {
    v34 = 0;
LABEL_17:
    v32 = 0;
    goto LABEL_18;
  }
  v34 = +[NSData dataWithContentsOfURL:v33];
  v35 = [v33 lastPathComponent];
  v36 = [v35 stringByDeletingPathExtension];

  v37 = (char *)[v36 rangeOfString:@"@" options:4];
  double v38 = 1.0;
  if (v37 != (char *)0x7FFFFFFFFFFFFFFFLL)
  {
    v39 = [v36 substringWithRange:v37 + 1, 1];
    v46 = v34;
    id v40 = [v39 integerValue];

    unint64_t v41 = (unint64_t)(double)(uint64_t)v40;
    BOOL v42 = v40 == 0;
    v34 = v46;
    if (v42) {
      unint64_t v41 = 1;
    }
    double v38 = (double)v41;
  }

  if (!v34) {
    goto LABEL_17;
  }
  uint64_t v43 = +[UIImage imageWithData:v34 scale:v38];
  if (!v43) {
    goto LABEL_17;
  }
  v44 = (void *)v43;
  v32 = -[TUIImageModel initWithIdentifier:image:size:renderMode:alignmentRectInsets:]([TUIImageModel alloc], "initWithIdentifier:image:size:renderMode:alignmentRectInsets:", v28, v43, v19, v15, v17, v21, v23, v25, v27);

LABEL_18:
LABEL_19:
  [v11 setImageModel:v32, v46];
  v45 = [v47 stringForAttribute:176 node:var0];
  [v11 setRole:v45];
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