@interface NNCComplicationDataSource
+ (id)_complicationTitle;
+ (id)_loadingStoriesLargeString;
+ (id)_loadingStoriesShortString;
+ (id)_noNewStoriesLargeString;
+ (id)_noNewStoriesShortString;
+ (id)_oneLineHeadlineTextProviderForResult:(id)a3;
+ (id)_templateForFamily:(int64_t)a3 newsStoryResult:(id)a4 compact:(BOOL)a5;
+ (id)fullColorImageProviderWithName:(id)a3;
+ (id)imageProviderWithForegroundName:(id)a3 compact:(BOOL)a4;
+ (id)newsTintColor;
+ (id)staticTemplateForFamily:(int64_t)a3 compact:(BOOL)a4;
@end

@implementation NNCComplicationDataSource

+ (id)staticTemplateForFamily:(int64_t)a3 compact:(BOOL)a4
{
  BOOL v4 = a4;
  v7 = objc_alloc_init(NNCLastNewsStoryResult);
  v8 = NSSNewsWidgetMessageForStaticNewsSection();
  [(NNCLastNewsStoryResult *)v7 setSourceName:v8];

  v9 = NSSNewsWidgetMessageForStaticNewsHeadlineTitle();
  [(NNCLastNewsStoryResult *)v7 setHeadlineTitle:v9];

  [(NNCLastNewsStoryResult *)v7 setHeadlineIndex:0];
  [(NNCLastNewsStoryResult *)v7 setTotalHeadlineCount:0];
  [(NNCLastNewsStoryResult *)v7 setFamily:a3];
  v10 = [a1 _templateForFamily:a3 newsStoryResult:v7 compact:v4];

  return v10;
}

+ (id)newsTintColor
{
  return (id)[MEMORY[0x263F1C550] colorWithRed:0.988235294 green:0.301960784 blue:0.37254902 alpha:1.0];
}

+ (id)_loadingStoriesShortString
{
  return &stru_26E10C4C8;
}

+ (id)_loadingStoriesLargeString
{
  return &stru_26E10C4C8;
}

+ (id)_noNewStoriesLargeString
{
  return &stru_26E10C4C8;
}

+ (id)_noNewStoriesShortString
{
  return &stru_26E10C4C8;
}

+ (id)_complicationTitle
{
  return &stru_26E10C4C8;
}

+ (id)_oneLineHeadlineTextProviderForResult:(id)a3
{
  if (a3)
  {
    BOOL v4 = [a3 headlineTitle];
    v5 = v4;
    if (v4)
    {
      id v6 = v4;
    }
    else
    {
      id v6 = [a1 _noNewStoriesShortString];
    }
    v8 = v6;

    v9 = (void *)MEMORY[0x263EFD200];
  }
  else
  {
    v7 = (void *)MEMORY[0x263EFD200];
    v8 = [a1 _loadingStoriesShortString];
    v9 = v7;
  }
  v10 = [v9 textProviderWithText:v8];

  return v10;
}

+ (id)_templateForFamily:(int64_t)a3 newsStoryResult:(id)a4 compact:(BOOL)a5
{
  BOOL v5 = a5;
  v70[1] = *MEMORY[0x263EF8340];
  id v8 = a4;
  uint64_t v61 = 0;
  v62 = &v61;
  uint64_t v63 = 0x2020000000;
  v9 = (void *)getNTKComplicationFamilyUtilitarianLargeNarrowSymbolLoc_ptr;
  uint64_t v64 = getNTKComplicationFamilyUtilitarianLargeNarrowSymbolLoc_ptr;
  if (!getNTKComplicationFamilyUtilitarianLargeNarrowSymbolLoc_ptr)
  {
    v60[0] = MEMORY[0x263EF8330];
    v60[1] = 3221225472;
    v60[2] = __getNTKComplicationFamilyUtilitarianLargeNarrowSymbolLoc_block_invoke;
    v60[3] = &unk_2649A9088;
    v60[4] = &v61;
    __getNTKComplicationFamilyUtilitarianLargeNarrowSymbolLoc_block_invoke((uint64_t)v60);
    v9 = (void *)v62[3];
  }
  _Block_object_dispose(&v61, 8);
  if (!v9)
  {
    +[NNCComplicationDataSource _templateForFamily:newsStoryResult:compact:]();
    __break(1u);
  }
  if (*v9 == a3) {
    int64_t v10 = 3;
  }
  else {
    int64_t v10 = a3;
  }
  if (v10 == *MEMORY[0x263EFCF28])
  {
    v11 = [(id)objc_opt_class() imageProviderWithForegroundName:@"victory" compact:v5];
    v12 = objc_opt_new();
    [v12 setImageProvider:v11];
  }
  else
  {
    v12 = 0;
  }
  switch(v10)
  {
    case 0:
      v13 = [(id)objc_opt_class() imageProviderWithForegroundName:@"modularsmall-simple" compact:v5];
      id v14 = (id)objc_opt_new();
      [v14 setImageProvider:v13];

      break;
    case 1:
      id v14 = (id)objc_opt_new();
      v15 = [(id)objc_opt_class() imageProviderWithForegroundName:@"modularlarge-standardbody" compact:v5];
      [v14 setHeaderImageProvider:v15];
      if (!v8) {
        goto LABEL_30;
      }
      v32 = [v8 headlineTitle];
      BOOL v33 = v32 == 0;

      v18 = (void *)MEMORY[0x263EFD200];
      if (v33) {
        goto LABEL_31;
      }
      v34 = [v8 sourceName];
      v20 = [v18 textProviderWithText:v34];

      [v14 setHeaderTextProvider:v20];
      v35 = (void *)MEMORY[0x263EFD200];
      v23 = [v8 headlineTitle];
      v36 = [v35 textProviderWithText:v23];
      [v14 setBody1TextProvider:v36];

      goto LABEL_32;
    case 2:
      v25 = [(id)objc_opt_class() imageProviderWithForegroundName:@"utilitariansmall-square" compact:v5];
      id v14 = (id)objc_opt_new();
      [v14 setImageProvider:v25];

      break;
    case 3:
      id v14 = (id)objc_opt_new();
      v42 = [(id)objc_opt_class() imageProviderWithForegroundName:@"utilitarianlarge-flat" compact:1];
      [v14 setImageProvider:v42];
      v43 = [(id)objc_opt_class() _oneLineHeadlineTextProviderForResult:v8];
      [v14 setTextProvider:v43];

      break;
    case 4:
      v44 = [(id)objc_opt_class() imageProviderWithForegroundName:@"circularsmall-simple" compact:v5];
      id v14 = (id)objc_opt_new();
      [v14 setImageProvider:v44];

      break;
    case 6:
      id v14 = (id)objc_opt_new();
      v26 = [(id)objc_opt_class() imageProviderWithForegroundName:@"utilitariansmall-flat" compact:v5];
      [v14 setImageProvider:v26];
      v27 = [MEMORY[0x263EFD200] textProviderWithText:&stru_26E10C4C8];
      [v14 setTextProvider:v27];

      break;
    case 7:
      id v14 = (id)objc_opt_new();
      v37 = [(id)objc_opt_class() imageProviderWithForegroundName:@"extralarge-simple" compact:v5];
      [v14 setImageProvider:v37];

      break;
    case 8:
      id v14 = objc_alloc_init(MEMORY[0x263EFD068]);
      v38 = [a1 fullColorImageProviderWithName:@"circularsmall-simple"];
      [v14 setImageProvider:v38];

      v69 = @"NTKRichComplicationViewBackgroundColorKey";
      v39 = [a1 newsTintColor];
      v40 = [v39 colorWithAlphaComponent:0.2];
      v70[0] = v40;
      v41 = [NSDictionary dictionaryWithObjects:v70 forKeys:&v69 count:1];
      [v14 setMetadata:v41];

      break;
    case 9:
      id v14 = objc_alloc_init(MEMORY[0x263EFD010]);
      v49 = [(id)objc_opt_class() _oneLineHeadlineTextProviderForResult:v8];
      [v14 setTextProvider:v49];

      v50 = [a1 _templateForFamily:10 newsStoryResult:v8 compact:v5];
      [v14 setCircularTemplate:v50];

      break;
    case 10:
      id v14 = objc_alloc_init(MEMORY[0x263EFD028]);
      v45 = [a1 fullColorImageProviderWithName:@"circularsmall-simple"];
      [v14 setImageProvider:v45];

      v67 = @"NTKRichComplicationViewBackgroundColorKey";
      v46 = [a1 newsTintColor];
      v47 = [v46 colorWithAlphaComponent:0.2];
      v68 = v47;
      v48 = [NSDictionary dictionaryWithObjects:&v68 forKeys:&v67 count:1];
      [v14 setMetadata:v48];

      break;
    case 11:
      id v14 = (id)objc_opt_new();
      v15 = [(id)objc_opt_class() fullColorImageProviderWithName:@"modularlarge-standardbody"];
      [v14 setHeaderImageProvider:v15];
      if (v8)
      {
        v16 = [v8 headlineTitle];
        BOOL v17 = v16 == 0;

        v18 = (void *)MEMORY[0x263EFD200];
        if (v17)
        {
LABEL_31:
          v55 = [a1 _complicationTitle];
          v20 = [v18 textProviderWithText:v55];

          [v14 setHeaderTextProvider:v20];
          v56 = (void *)MEMORY[0x263EFD200];
          v57 = [a1 _noNewStoriesLargeString];
          v23 = [v56 textProviderWithText:v57];

          [v14 setBody1TextProvider:v23];
        }
        else
        {
          v19 = [v8 sourceName];
          v20 = [v18 textProviderWithText:v19];

          v21 = [a1 newsTintColor];
          [v20 setTintColor:v21];

          [v14 setHeaderTextProvider:v20];
          v22 = (void *)MEMORY[0x263EFD200];
          v23 = [v8 headlineTitle];
          v24 = [v22 textProviderWithText:v23];
          [v14 setBody1TextProvider:v24];
        }
      }
      else
      {
LABEL_30:
        v51 = (void *)MEMORY[0x263EFD200];
        v52 = [a1 _complicationTitle];
        v20 = [v51 textProviderWithText:v52];

        [v14 setHeaderTextProvider:v20];
        v53 = (void *)MEMORY[0x263EFD200];
        v23 = [a1 _loadingStoriesLargeString];
        v54 = [v53 textProviderWithText:v23];
        [v14 setBody1TextProvider:v54];
      }
LABEL_32:

      break;
    case 12:
      id v14 = (id)objc_opt_new();
      v28 = [a1 fullColorImageProviderWithName:@"graphiclarge"];
      [v14 setImageProvider:v28];

      v65 = @"NTKRichComplicationViewBackgroundColorKey";
      v29 = [a1 newsTintColor];
      v30 = [v29 colorWithAlphaComponent:0.2];
      v66 = v30;
      v31 = [NSDictionary dictionaryWithObjects:&v66 forKeys:&v65 count:1];
      [v14 setMetadata:v31];

      break;
    default:
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        +[NNCComplicationDataSource _templateForFamily:newsStoryResult:compact:](v10);
      }
      id v14 = v12;
      break;
  }
  v58 = [(id)objc_opt_class() newsTintColor];
  [v14 setTintColor:v58];

  return v14;
}

+ (id)imageProviderWithForegroundName:(id)a3 compact:(BOOL)a4
{
  BOOL v5 = [NSString stringWithFormat:@"complication-%@", a4, a3];
  id v6 = (void *)MEMORY[0x263F1C6B0];
  v7 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v8 = [v6 imageNamed:v5 inBundle:v7 compatibleWithTraitCollection:0];

  if (v8)
  {
    v9 = [MEMORY[0x263EFD1C8] imageProviderWithOnePieceImage:v8];
    int64_t v10 = [a1 newsTintColor];
    [v9 setTintColor:v10];
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

+ (id)fullColorImageProviderWithName:(id)a3
{
  id v4 = a3;
  BOOL v5 = (void *)MEMORY[0x230F7E100]();
  id v6 = [NSString stringWithFormat:@"complication-%@", v4];
  v7 = (void *)MEMORY[0x263F1C6B0];
  id v8 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v9 = [v7 imageNamed:v6 inBundle:v8 compatibleWithTraitCollection:0];

  if (v9)
  {
    int64_t v10 = [MEMORY[0x263F1C688] preferredFormat];
    [v9 scale];
    objc_msgSend(v10, "setScale:");
    [v10 setPreferredRange:2];
    [v9 size];
    double v12 = v11;
    double v14 = v13;
    v15 = objc_msgSend(objc_alloc(MEMORY[0x263F1C680]), "initWithSize:format:", v10, v11, v13);
    v16 = [a1 newsTintColor];
    v21[0] = MEMORY[0x263EF8330];
    v21[1] = 3221225472;
    v21[2] = __60__NNCComplicationDataSource_fullColorImageProviderWithName___block_invoke;
    v21[3] = &unk_2649A9060;
    id v22 = v16;
    double v24 = v12;
    double v25 = v14;
    id v23 = v9;
    id v17 = v16;
    v18 = [v15 imageWithActions:v21];
    v19 = [MEMORY[0x263EFD1A0] providerWithFullColorImage:v18 monochromeFilterType:1];
  }
  else
  {
    v19 = 0;
  }

  return v19;
}

uint64_t __60__NNCComplicationDataSource_fullColorImageProviderWithName___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setFill];
  double v2 = *(double *)(a1 + 48);
  double v3 = *(double *)(a1 + 56);
  v7.origin.x = 0.0;
  v7.origin.y = 0.0;
  v7.size.width = v2;
  v7.size.height = v3;
  UIRectFill(v7);
  id v4 = *(void **)(a1 + 40);
  return objc_msgSend(v4, "drawInRect:blendMode:alpha:", 22, 0.0, 0.0, v2, v3, 1.0);
}

+ (uint64_t)_templateForFamily:newsStoryResult:compact:.cold.1()
{
  dlerror();
  uint64_t v0 = abort_report_np();
  return +[NNCComplicationDataSource _templateForFamily:newsStoryResult:compact:](v0);
}

+ (void)_templateForFamily:(uint64_t)a1 newsStoryResult:compact:.cold.2(uint64_t a1)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  int v1 = 136315394;
  double v2 = "+[NNCComplicationDataSource _templateForFamily:newsStoryResult:compact:]";
  __int16 v3 = 2048;
  uint64_t v4 = a1;
  _os_log_error_impl(&dword_22D3D0000, &_os_log_internal, OS_LOG_TYPE_ERROR, "%s Unsupported family: %ld", (uint8_t *)&v1, 0x16u);
}

@end