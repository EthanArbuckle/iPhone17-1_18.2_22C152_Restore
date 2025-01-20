@interface SPUITapToRadarView
+ (BOOL)shouldDisplayTapToRadar;
+ (id)generateComponentQueryItems;
+ (void)openTapToRadarWithQuery:(id)a3 sections:(id)a4 rankingDebugLog:(id)a5;
- (SPUITapToRadarView)initWithTarget:(id)a3 action:(SEL)a4;
- (void)updateImage;
@end

@implementation SPUITapToRadarView

+ (BOOL)shouldDisplayTapToRadar
{
  if (shouldDisplayTapToRadar_onceToken != -1) {
    dispatch_once(&shouldDisplayTapToRadar_onceToken, &__block_literal_global_5);
  }
  return shouldDisplayTapToRadar_shouldDisplayTapToRadar;
}

void __45__SPUITapToRadarView_shouldDisplayTapToRadar__block_invoke()
{
  [@"com.apple.spotlightui" cStringUsingEncoding:1];
  if (os_variant_has_internal_diagnostics())
  {
    id v0 = [MEMORY[0x263EFFA40] standardUserDefaults];
    shouldDisplayTapToRadar_shouldDisplayTapToRadar = [v0 BOOLForKey:*MEMORY[0x263F67538]] ^ 1;
  }
  else
  {
    shouldDisplayTapToRadar_shouldDisplayTapToRadar = 0;
  }
}

- (SPUITapToRadarView)initWithTarget:(id)a3 action:(SEL)a4
{
  v15[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  v14.receiver = self;
  v14.super_class = (Class)SPUITapToRadarView;
  v7 = [(SPUITapToRadarView *)&v14 init];
  if (v7)
  {
    v8 = objc_opt_new();
    [v8 setProminence:2];
    [v8 setTitle:@"Tap-to-Radar"];
    v9 = [MEMORY[0x263F81708] preferredFontForTextStyle:*MEMORY[0x263F83580]];
    [v8 setFont:v9];

    v10 = [v8 titleLabel];
    [v10 setAdjustsFontForContentSizeCategory:1];

    objc_msgSend(v8, "setMinimumLayoutSize:", 44.0, 44.0);
    -[SPUITapToRadarView setLayoutMargins:](v7, "setLayoutMargins:", 16.0, 0.0, 16.0, 0.0);
    [(SPUITapToRadarView *)v7 setLayoutMarginsRelativeArrangement:1];
    [(NUIContainerBoxView *)v7 setHorizontalAlignment:3];
    [v8 addTarget:v6 action:a4];
    v15[0] = v8;
    v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:v15 count:1];
    [(SPUITapToRadarView *)v7 setArrangedSubviews:v11];

    [(SPUITapToRadarView *)v7 updateImage];
    v12 = [MEMORY[0x263F08A00] defaultCenter];
    [v12 addObserver:v7 selector:sel_updateImage name:*MEMORY[0x263F83428] object:0];
  }
  return v7;
}

- (void)updateImage
{
  v2 = [(SPUITapToRadarView *)self arrangedSubviews];
  id v6 = [v2 firstObject];

  v3 = (void *)MEMORY[0x263F67C70];
  v4 = [v6 font];
  v5 = [v3 uiImageWithSymbolName:@"ant.fill" font:v4 scale:1];
  [v6 setImage:v5 forState:0];
}

+ (void)openTapToRadarWithQuery:(id)a3 sections:(id)a4 rankingDebugLog:(id)a5
{
  uint64_t v76 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  v63 = (__CFString *)a5;
  v9 = [NSString stringWithFormat:@"<Build>"];
  v10 = [MEMORY[0x263F08AB0] processInfo];
  v11 = [v10 operatingSystemVersionString];

  v60 = v11;
  if (v11)
  {
    uint64_t v12 = objc_msgSend(v11, "rangeOfString:", @"(Build ");
    if (v12 != 0x7FFFFFFFFFFFFFFFLL)
    {
      id v14 = [v11 substringFromIndex:v12 + v13];
      uint64_t v15 = [v14 rangeOfString:@""]);
      if (v15 != 0x7FFFFFFFFFFFFFFFLL)
      {
        v16 = [v14 substringToIndex:v15];

        id v14 = v16;
        v9 = v14;
      }
    }
  }
  v17 = [MEMORY[0x263F089D8] string];
  v62 = v9;
  [v17 appendFormat:@"Build: %@\n\n", v9];
  v61 = v7;
  [v17 appendFormat:@"Query: %@\n\n", v7];
  [v17 appendString:@"Results:\n"];
  long long v71 = 0u;
  long long v72 = 0u;
  long long v69 = 0u;
  long long v70 = 0u;
  obuint64_t j = v8;
  uint64_t v18 = [obj countByEnumeratingWithState:&v69 objects:v75 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v20 = *(void *)v70;
    do
    {
      for (uint64_t i = 0; i != v19; ++i)
      {
        if (*(void *)v70 != v20) {
          objc_enumerationMutation(obj);
        }
        v22 = *(void **)(*((void *)&v69 + 1) + 8 * i);
        long long v65 = 0u;
        long long v66 = 0u;
        long long v67 = 0u;
        long long v68 = 0u;
        v23 = [v22 results];
        uint64_t v24 = [v23 countByEnumeratingWithState:&v65 objects:v74 count:16];
        if (v24)
        {
          uint64_t v25 = v24;
          uint64_t v26 = *(void *)v66;
          do
          {
            for (uint64_t j = 0; j != v25; ++j)
            {
              if (*(void *)v66 != v26) {
                objc_enumerationMutation(v23);
              }
              v28 = [*(id *)(*((void *)&v65 + 1) + 8 * j) debugDescription];
              [v17 appendString:v28];

              [v17 appendString:@"\n"];
            }
            uint64_t v25 = [v23 countByEnumeratingWithState:&v65 objects:v74 count:16];
          }
          while (v25);
        }
      }
      uint64_t v19 = [obj countByEnumeratingWithState:&v69 objects:v75 count:16];
    }
    while (v19);
  }

  id v29 = objc_alloc_init(MEMORY[0x263F08BA0]);
  [v29 setScheme:@"tap-to-radar"];
  v58 = v29;
  [v29 setHost:@"new"];
  v30 = [MEMORY[0x263EFF980] arrayWithCapacity:8];
  v31 = [a1 generateComponentQueryItems];
  [v30 addObjectsFromArray:v31];

  v32 = SSExtensionIdentifiersForSections();
  v33 = (void *)MEMORY[0x263F08BD0];
  v57 = v32;
  v56 = [v32 componentsJoinedByString:@","];
  v55 = [v33 queryItemWithName:@"ExtensionIdentifiers" value:v56];
  v73[0] = v55;
  v34 = [MEMORY[0x263F08BD0] queryItemWithName:@"Classification" value:@"Other Bug"];
  v73[1] = v34;
  v35 = [MEMORY[0x263F08BD0] queryItemWithName:@"Reproducibility" value:@"I Didn't Try"];
  v73[2] = v35;
  v36 = (void *)MEMORY[0x263F08BD0];
  v37 = [NSString stringWithFormat:@"%@: ", v62];
  v38 = [v36 queryItemWithName:@"Title" value:v37];
  v73[3] = v38;
  v39 = (void *)MEMORY[0x263F08BD0];
  v40 = NSString;
  uint64_t v41 = [MEMORY[0x263F79168] internalReleaseAgreementText];
  v42 = (void *)v41;
  v43 = &stru_26F104E28;
  if (v63) {
    v43 = v63;
  }
  v44 = [v40 stringWithFormat:@"Summary: \n\n\n*** Note: Debug info contains the titles of items in the UI. Please review for confidential information.  %@ ***\n\n===  DEBUG INFO  ===\n\n%@\n\n%@", v41, v17, v43];
  v45 = [v39 queryItemWithName:@"Description" value:v44];
  v73[4] = v45;
  v46 = [MEMORY[0x263EFF8C0] arrayWithObjects:v73 count:5];
  [v30 addObjectsFromArray:v46];

  v47 = [MEMORY[0x263EFF980] arrayWithCapacity:2];
  v48 = [MEMORY[0x263F79168] filePathForCapturedScreenshot];
  if (v48) {
    [v47 addObject:v48];
  }
  v49 = [v47 componentsJoinedByString:@","];
  v50 = [MEMORY[0x263F08BD0] queryItemWithName:@"Attachments" value:v49];
  [v30 addObject:v50];

  [v58 setQueryItems:v30];
  v51 = (void *)MEMORY[0x263F67C78];
  v52 = (void *)MEMORY[0x263F679B0];
  v53 = [v58 URL];
  v54 = [v52 punchoutWithURL:v53];
  [v51 openPunchout:v54];
}

+ (id)generateComponentQueryItems
{
  v7[3] = *MEMORY[0x263EF8340];
  v2 = [MEMORY[0x263F08BD0] queryItemWithName:@"ComponentName" value:@"Spotlight (New Bugs)"];
  v3 = objc_msgSend(MEMORY[0x263F08BD0], "queryItemWithName:value:", @"ComponentVersion", @"iOS", v2);
  v7[1] = v3;
  v4 = [MEMORY[0x263F08BD0] queryItemWithName:@"ComponentID" value:@"312963"];
  v7[2] = v4;
  v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:v7 count:3];

  return v5;
}

@end