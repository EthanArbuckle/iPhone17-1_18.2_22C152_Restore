@interface BSUIElementDailyReading
+ (BOOL)supportAttribute:(unsigned __int16)a3 feature:(id)a4;
+ (Class)builderClass;
+ (Class)objectClass;
+ (id)_buildDetailTextModel:(id)a3 service:(id)a4 context:(id)a5 goalCompleted:(BOOL)a6 writingDirection:(BOOL)a7;
+ (id)_buildTimeTextModel:(id)a3 service:(id)a4 context:(id)a5 writingDirection:(BOOL)a6;
+ (id)_buildTitleTextModel:(id)a3 service:(id)a4 context:(id)a5 writingDirection:(BOOL)a6;
+ (id)supportedAttributes;
+ (unint64_t)definesScopes;
+ (void)configureBox:(id)a3 withNode:(id)a4 attributes:(id)a5 context:(id)a6;
+ (void)configureObject:(id)a3 withBuilder:(id)a4 context:(id)a5;
@end

@implementation BSUIElementDailyReading

+ (unint64_t)definesScopes
{
  return 0;
}

+ (id)supportedAttributes
{
  return +[BSUIDailyReadingMetrics supportedAttributes];
}

+ (Class)objectClass
{
  return (Class)objc_opt_class();
}

+ (Class)builderClass
{
  return (Class)objc_opt_class();
}

+ (BOOL)supportAttribute:(unsigned __int16)a3 feature:(id)a4
{
  id v4 = a4;
  if (([v4 isEqualToString:@"supportsWidgetFormat"] & 1) != 0
    || ([v4 isEqualToString:@"supportsWidgetFormatV3"] & 1) != 0)
  {
    unsigned __int8 v5 = 1;
  }
  else
  {
    unsigned __int8 v5 = [v4 isEqualToString:@"supportsSymbolImages"];
  }

  return v5;
}

+ (void)configureObject:(id)a3 withBuilder:(id)a4 context:(id)a5
{
  id v41 = a3;
  id v8 = a5;
  id v9 = a4;
  id v10 = objc_alloc((Class)TUIConfiguration);
  v11 = [v9 finalizeWidgetWithParent:v41];

  id v12 = [v10 initWithData:v11];
  [v41 setConfiguration:v12];

  v13 = [v41 dailyReadingMetrics];
  v14 = [v41 configuration];
  [v13 updateWithConfiguration:v14 context:v8];

  id v15 = objc_alloc_init((Class)NSMutableArray);
  if (([v13 iconMode] & 1) == 0)
  {
    v16 = [v8 serviceConformingToProtocol:&OBJC_PROTOCOL___TUIWPService];
    v17 = [v13 rightToLeft];
    id v18 = [v17 BOOLValue];

    objc_opt_class();
    v19 = [v41 configuration];
    v20 = [v19 boxForKey:@"title-text-box"];
    BUDynamicCast();
    id v21 = (id)objc_claimAutoreleasedReturnValue();

    if (!v21)
    {
      v22 = [a1 _buildTitleTextModel:v13 service:v16 context:v8 writingDirection:v18];
      id v21 = [objc_alloc((Class)TUIWPBox) initWithTextModel:v22];
    }
    v23 = [v41 identifier];
    v24 = [v23 tui_identifierByAppendingIndex:0];
    [v21 setIdentifier:v24];

    [v15 addObject:v21];
    objc_opt_class();
    v25 = [v41 configuration];
    v26 = [v25 boxForKey:@"time-text-box"];
    BUDynamicCast();
    id v27 = (id)objc_claimAutoreleasedReturnValue();

    if (!v27)
    {
      v28 = [a1 _buildTimeTextModel:v13 service:v16 context:v8 writingDirection:v18];
      id v27 = [objc_alloc((Class)TUIWPBox) initWithTextModel:v28];
    }
    unsigned int v40 = v18;
    v29 = [v41 identifier];
    v30 = [v29 tui_identifierByAppendingIndex:1];
    [v27 setIdentifier:v30];

    [v15 addObject:v27];
    objc_opt_class();
    v31 = [v41 configuration];
    v32 = [v31 boxForKey:@"detail-text-box"];
    BUDynamicCast();
    id v33 = (id)objc_claimAutoreleasedReturnValue();

    if (!v33)
    {
      v34 = [a1 _buildDetailTextModel:v13 service:v16 context:v8 goalCompleted:[v13 goalCompleted] writingDirection:v40];
      id v33 = [objc_alloc((Class)TUIWPBox) initWithTextModel:v34];
    }
    v35 = [v41 identifier];
    v36 = [v35 tui_identifierByAppendingIndex:2];
    [v33 setIdentifier:v36];

    [v15 addObject:v33];
    id v37 = objc_alloc_init((Class)TUIVSpacer);
    v38 = [v41 identifier];
    v39 = [v38 tui_identifierByAppendingIndex:3];
    [v37 setIdentifier:v39];

    [v15 addObject:v37];
  }
  [v41 updateModelChildren:v15];
}

+ (void)configureBox:(id)a3 withNode:(id)a4 attributes:(id)a5 context:(id)a6
{
  id v32 = a3;
  id v10 = a6;
  id v11 = a5;
  id v12 = [[BSUIDailyReadingMetrics alloc] initWithNode:a4.var0 attributes:v11 context:v10];

  if (![(BSUIDailyReadingMetrics *)v12 iconMode])
  {
    id v13 = objc_alloc_init((Class)NSMutableArray);
    v14 = [v10 serviceConformingToProtocol:&OBJC_PROTOCOL___TUIWPService];
    id v15 = [(BSUIDailyReadingMetrics *)v12 rightToLeft];
    id v16 = [v15 BOOLValue];

    v31 = [a1 _buildTitleTextModel:v12 service:v14 context:v10 writingDirection:v16];
    id v30 = [objc_alloc((Class)TUIWPBox) initWithTextModel:v31];
    v17 = [v32 identifier];
    id v18 = [v17 tui_identifierByAppendingIndex:0];
    [v30 setIdentifier:v18];

    [v13 addObject:v30];
    v29 = [a1 _buildTimeTextModel:v12 service:v14 context:v10 writingDirection:v16];
    id v19 = [objc_alloc((Class)TUIWPBox) initWithTextModel:v29];
    v20 = [v32 identifier];
    id v21 = [v20 tui_identifierByAppendingIndex:1];
    [v19 setIdentifier:v21];

    [v13 addObject:v19];
    v22 = [a1 _buildDetailTextModel:v12 service:v14 context:v10 goalCompleted:[v12 goalCompleted] writingDirection:v16];
    id v23 = [objc_alloc((Class)TUIWPBox) initWithTextModel:v22];
    v24 = [v32 identifier];
    v25 = [v24 tui_identifierByAppendingIndex:2];
    [v23 setIdentifier:v25];

    [v13 addObject:v23];
    id v26 = objc_alloc_init((Class)TUIVSpacer);
    id v27 = [v32 identifier];
    v28 = [v27 tui_identifierByAppendingIndex:3];
    [v26 setIdentifier:v28];

    [v13 addObject:v26];
    [v32 updateModelChildren:v13];
  }
  [v32 setDailyReadingMetrics:v12, v29];
}

+ (id)_buildTitleTextModel:(id)a3 service:(id)a4 context:(id)a5 writingDirection:(BOOL)a6
{
  BOOL v6 = a6;
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  uint64_t v12 = [v11 title];
  id v13 = (void *)v12;
  v14 = &stru_39B8B0;
  if (v12) {
    v14 = (__CFString *)v12;
  }
  id v15 = v14;

  id v16 = [v11 titleFontSpec];
  v17 = [v11 textColor];

  id v18 = [v9 environment];
  id v19 = [v18 language];
  LOBYTE(v23) = 0;
  v20 = +[TUIWPBox textModelBuilderWithFontSpec:v16 style:0 color:v17 alignment:1 writingDirection:v6 language:v19 shouldHyphenate:v23 service:v10];

  [v20 appendString:v15];
  id v21 = [v20 finalizeTextModelWithContext:v9];

  return v21;
}

+ (id)_buildTimeTextModel:(id)a3 service:(id)a4 context:(id)a5 writingDirection:(BOOL)a6
{
  BOOL v6 = a6;
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  uint64_t v12 = [v11 timeDisplayedText];
  id v13 = (void *)v12;
  v14 = &stru_39B8B0;
  if (v12) {
    v14 = (__CFString *)v12;
  }
  id v15 = v14;

  id v16 = [v11 timeFontSpec];
  v17 = [v11 textColor];

  id v18 = [v9 environment];
  id v19 = [v18 language];
  LOBYTE(v23) = 0;
  v20 = +[TUIWPBox textModelBuilderWithFontSpec:v16 style:0 color:v17 alignment:1 writingDirection:v6 language:v19 shouldHyphenate:v23 service:v10];

  [v20 appendString:v15];
  id v21 = [v20 finalizeTextModelWithContext:v9];

  return v21;
}

+ (id)_buildDetailTextModel:(id)a3 service:(id)a4 context:(id)a5 goalCompleted:(BOOL)a6 writingDirection:(BOOL)a7
{
  BOOL v7 = a7;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  uint64_t v14 = [v13 detailText];
  id v15 = (void *)v14;
  id v16 = &stru_39B8B0;
  if (v14) {
    id v16 = (__CFString *)v14;
  }
  v17 = v16;

  if (a6) {
    [v13 progressColor];
  }
  else {
  id v18 = [v13 textColor];
  }
  id v19 = [v13 detailFontSpec];

  v20 = [v11 environment];
  id v21 = [v20 language];
  LOBYTE(v25) = 0;
  v22 = +[TUIWPBox textModelBuilderWithFontSpec:v19 style:0 color:v18 alignment:1 writingDirection:v7 language:v21 shouldHyphenate:v25 service:v12];

  [v22 appendString:v17];
  uint64_t v23 = [v22 finalizeTextModelWithContext:v11];

  return v23;
}

@end