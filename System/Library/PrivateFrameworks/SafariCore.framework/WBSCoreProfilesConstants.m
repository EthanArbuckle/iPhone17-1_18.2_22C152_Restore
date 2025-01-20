@interface WBSCoreProfilesConstants
+ (NSArray)availableSymbolImageNames;
+ (NSArray)orderedProfileColorOptions;
+ (NSString)defaultPersonalProfileSymbolImage;
+ (WBSNamedColorOption)defaultPersonalProfileColor;
+ (id)_availableSymbolImageNamesToAccessibilityLabels;
+ (id)accessibilityLabelForSymbol:(id)a3;
@end

@implementation WBSCoreProfilesConstants

void __75__WBSCoreProfilesConstants__availableSymbolImageNamesToAccessibilityLabels__block_invoke()
{
  v0 = objc_alloc_init(WBSMutableOrderedDictionary);
  v1 = (void *)_availableSymbolImageNamesToAccessibilityLabels_availableSymbolImageNamesToAccessibilityLabels;
  _availableSymbolImageNamesToAccessibilityLabels_availableSymbolImageNamesToAccessibilityLabels = (uint64_t)v0;

  v2 = (void *)_availableSymbolImageNamesToAccessibilityLabels_availableSymbolImageNamesToAccessibilityLabels;
  v3 = _WBSLocalizedString(@"Lanyard Card icon", &_WBSLocalizableStringsBundleOnceToken, &_WBSLocalizableStringsBundle);
  [v2 setObject:v3 forKey:@"person.lanyardcard.fill"];

  v4 = (void *)_availableSymbolImageNamesToAccessibilityLabels_availableSymbolImageNamesToAccessibilityLabels;
  v5 = _WBSLocalizedString(@"Graduation Cap icon", &_WBSLocalizableStringsBundleOnceToken, &_WBSLocalizableStringsBundle);
  [v4 setObject:v5 forKey:@"graduationcap.fill"];

  v6 = (void *)_availableSymbolImageNamesToAccessibilityLabels_availableSymbolImageNamesToAccessibilityLabels;
  v7 = _WBSLocalizedString(@"Bag icon", &_WBSLocalizableStringsBundleOnceToken, &_WBSLocalizableStringsBundle);
  [v6 setObject:v7 forKey:@"bag.fill"];

  v8 = (void *)_availableSymbolImageNamesToAccessibilityLabels_availableSymbolImageNamesToAccessibilityLabels;
  v9 = _WBSLocalizedString(@"Hammer icon", &_WBSLocalizableStringsBundleOnceToken, &_WBSLocalizableStringsBundle);
  [v8 setObject:v9 forKey:@"hammer.fill"];

  v10 = (void *)_availableSymbolImageNamesToAccessibilityLabels_availableSymbolImageNamesToAccessibilityLabels;
  v11 = _WBSLocalizedString(@"Building icon", &_WBSLocalizableStringsBundleOnceToken, &_WBSLocalizableStringsBundle);
  [v10 setObject:v11 forKey:@"building.2.fill"];

  v12 = (void *)_availableSymbolImageNamesToAccessibilityLabels_availableSymbolImageNamesToAccessibilityLabels;
  v13 = _WBSLocalizedString(@"Emoji icon", &_WBSLocalizableStringsBundleOnceToken, &_WBSLocalizableStringsBundle);
  [v12 setObject:v13 forKey:@"emoji.face.grinning"];

  v14 = (void *)_availableSymbolImageNamesToAccessibilityLabels_availableSymbolImageNamesToAccessibilityLabels;
  v15 = _WBSLocalizedString(@"Books icon", &_WBSLocalizableStringsBundleOnceToken, &_WBSLocalizableStringsBundle);
  [v14 setObject:v15 forKey:@"books.vertical.fill"];

  v16 = (void *)_availableSymbolImageNamesToAccessibilityLabels_availableSymbolImageNamesToAccessibilityLabels;
  v17 = _WBSLocalizedString(@"Rocket icon", &_WBSLocalizableStringsBundleOnceToken, &_WBSLocalizableStringsBundle);
  [v16 setObject:v17 forKey:@"rocket.fill"];

  v18 = (void *)_availableSymbolImageNamesToAccessibilityLabels_availableSymbolImageNamesToAccessibilityLabels;
  v19 = _WBSLocalizedString(@"Gift icon", &_WBSLocalizableStringsBundleOnceToken, &_WBSLocalizableStringsBundle);
  [v18 setObject:v19 forKey:@"gift.fill"];

  v20 = (void *)_availableSymbolImageNamesToAccessibilityLabels_availableSymbolImageNamesToAccessibilityLabels;
  v21 = _WBSLocalizedString(@"Doc icon", &_WBSLocalizableStringsBundleOnceToken, &_WBSLocalizableStringsBundle);
  [v20 setObject:v21 forKey:@"doc.fill"];

  v22 = (void *)_availableSymbolImageNamesToAccessibilityLabels_availableSymbolImageNamesToAccessibilityLabels;
  v23 = _WBSLocalizedString(@"Book icon", &_WBSLocalizableStringsBundleOnceToken, &_WBSLocalizableStringsBundle);
  [v22 setObject:v23 forKey:@"book.closed.fill"];

  v24 = (void *)_availableSymbolImageNamesToAccessibilityLabels_availableSymbolImageNamesToAccessibilityLabels;
  v25 = _WBSLocalizedString(@"Credit Card icon", &_WBSLocalizableStringsBundleOnceToken, &_WBSLocalizableStringsBundle);
  [v24 setObject:v25 forKey:@"creditcard.fill"];

  v26 = (void *)_availableSymbolImageNamesToAccessibilityLabels_availableSymbolImageNamesToAccessibilityLabels;
  v27 = _WBSLocalizedString(@"Fork icon", &_WBSLocalizableStringsBundleOnceToken, &_WBSLocalizableStringsBundle);
  [v26 setObject:v27 forKey:@"fork.knife"];

  v28 = (void *)_availableSymbolImageNamesToAccessibilityLabels_availableSymbolImageNamesToAccessibilityLabels;
  v29 = _WBSLocalizedString(@"Pills icon", &_WBSLocalizableStringsBundleOnceToken, &_WBSLocalizableStringsBundle);
  [v28 setObject:v29 forKey:@"pills.fill"];

  v30 = (void *)_availableSymbolImageNamesToAccessibilityLabels_availableSymbolImageNamesToAccessibilityLabels;
  v31 = _WBSLocalizedString(@"Stethoscope icon", &_WBSLocalizableStringsBundleOnceToken, &_WBSLocalizableStringsBundle);
  [v30 setObject:v31 forKey:@"stethoscope"];

  v32 = (void *)_availableSymbolImageNamesToAccessibilityLabels_availableSymbolImageNamesToAccessibilityLabels;
  v33 = _WBSLocalizedString(@"House icon", &_WBSLocalizableStringsBundleOnceToken, &_WBSLocalizableStringsBundle);
  [v32 setObject:v33 forKey:@"house.fill"];

  v34 = (void *)_availableSymbolImageNamesToAccessibilityLabels_availableSymbolImageNamesToAccessibilityLabels;
  v35 = _WBSLocalizedString(@"Building Columns icon", &_WBSLocalizableStringsBundleOnceToken, &_WBSLocalizableStringsBundle);
  [v34 setObject:v35 forKey:@"building.columns.fill"];

  v36 = (void *)_availableSymbolImageNamesToAccessibilityLabels_availableSymbolImageNamesToAccessibilityLabels;
  v37 = _WBSLocalizedString(@"TV icon", &_WBSLocalizableStringsBundleOnceToken, &_WBSLocalizableStringsBundle);
  [v36 setObject:v37 forKey:@"tv.fill"];

  v38 = (void *)_availableSymbolImageNamesToAccessibilityLabels_availableSymbolImageNamesToAccessibilityLabels;
  v39 = _WBSLocalizedString(@"Headphones icon", &_WBSLocalizableStringsBundleOnceToken, &_WBSLocalizableStringsBundle);
  [v38 setObject:v39 forKey:@"headphones"];

  v40 = (void *)_availableSymbolImageNamesToAccessibilityLabels_availableSymbolImageNamesToAccessibilityLabels;
  v41 = _WBSLocalizedString(@"Leaf icon", &_WBSLocalizableStringsBundleOnceToken, &_WBSLocalizableStringsBundle);
  [v40 setObject:v41 forKey:@"leaf.fill"];

  v42 = (void *)_availableSymbolImageNamesToAccessibilityLabels_availableSymbolImageNamesToAccessibilityLabels;
  v43 = _WBSLocalizedString(@"Figure icon", &_WBSLocalizableStringsBundleOnceToken, &_WBSLocalizableStringsBundle);
  [v42 setObject:v43 forKey:@"figure.stand"];

  v44 = (void *)_availableSymbolImageNamesToAccessibilityLabels_availableSymbolImageNamesToAccessibilityLabels;
  v45 = _WBSLocalizedString(@"Pawprint icon", &_WBSLocalizableStringsBundleOnceToken, &_WBSLocalizableStringsBundle);
  [v44 setObject:v45 forKey:@"pawprint.fill"];

  v46 = (void *)_availableSymbolImageNamesToAccessibilityLabels_availableSymbolImageNamesToAccessibilityLabels;
  v47 = _WBSLocalizedString(@"Cart icon", &_WBSLocalizableStringsBundleOnceToken, &_WBSLocalizableStringsBundle);
  [v46 setObject:v47 forKey:@"cart.fill"];

  v48 = (void *)_availableSymbolImageNamesToAccessibilityLabels_availableSymbolImageNamesToAccessibilityLabels;
  v49 = _WBSLocalizedString(@"Shipping Box icon", &_WBSLocalizableStringsBundleOnceToken, &_WBSLocalizableStringsBundle);
  [v48 setObject:v49 forKey:@"shippingbox.fill"];

  v50 = (void *)_availableSymbolImageNamesToAccessibilityLabels_availableSymbolImageNamesToAccessibilityLabels;
  v51 = _WBSLocalizedString(@"Tram icon", &_WBSLocalizableStringsBundleOnceToken, &_WBSLocalizableStringsBundle);
  [v50 setObject:v51 forKey:@"tram.fill"];

  v52 = (void *)_availableSymbolImageNamesToAccessibilityLabels_availableSymbolImageNamesToAccessibilityLabels;
  v53 = _WBSLocalizedString(@"Snowflake icon", &_WBSLocalizableStringsBundleOnceToken, &_WBSLocalizableStringsBundle);
  [v52 setObject:v53 forKey:@"snowflake"];

  v54 = (void *)_availableSymbolImageNamesToAccessibilityLabels_availableSymbolImageNamesToAccessibilityLabels;
  v55 = _WBSLocalizedString(@"Flame icon", &_WBSLocalizableStringsBundleOnceToken, &_WBSLocalizableStringsBundle);
  [v54 setObject:v55 forKey:@"flame.fill"];

  v56 = (void *)_availableSymbolImageNamesToAccessibilityLabels_availableSymbolImageNamesToAccessibilityLabels;
  v57 = _WBSLocalizedString(@"Wrench icon", &_WBSLocalizableStringsBundleOnceToken, &_WBSLocalizableStringsBundle);
  [v56 setObject:v57 forKey:@"wrench.and.screwdriver.fill"];

  v58 = (void *)_availableSymbolImageNamesToAccessibilityLabels_availableSymbolImageNamesToAccessibilityLabels;
  v59 = _WBSLocalizedString(@"Scissors icon", &_WBSLocalizableStringsBundleOnceToken, &_WBSLocalizableStringsBundle);
  [v58 setObject:v59 forKey:@"scissors"];

  v60 = (void *)_availableSymbolImageNamesToAccessibilityLabels_availableSymbolImageNamesToAccessibilityLabels;
  v61 = _WBSLocalizedString(@"Curly Braces icon", &_WBSLocalizableStringsBundleOnceToken, &_WBSLocalizableStringsBundle);
  [v60 setObject:v61 forKey:@"curlybraces"];

  v62 = (void *)_availableSymbolImageNamesToAccessibilityLabels_availableSymbolImageNamesToAccessibilityLabels;
  v63 = _WBSLocalizedString(@"Lightbulb icon", &_WBSLocalizableStringsBundleOnceToken, &_WBSLocalizableStringsBundle);
  [v62 setObject:v63 forKey:@"lightbulb.fill"];

  v64 = (void *)_availableSymbolImageNamesToAccessibilityLabels_availableSymbolImageNamesToAccessibilityLabels;
  v65 = _WBSLocalizedString(@"Star of Life icon", &_WBSLocalizableStringsBundleOnceToken, &_WBSLocalizableStringsBundle);
  [v64 setObject:v65 forKey:@"staroflife.fill"];

  v66 = (void *)_availableSymbolImageNamesToAccessibilityLabels_availableSymbolImageNamesToAccessibilityLabels;
  v67 = _WBSLocalizedString(@"Square icon", &_WBSLocalizableStringsBundleOnceToken, &_WBSLocalizableStringsBundle);
  [v66 setObject:v67 forKey:@"square.fill"];

  v68 = (void *)_availableSymbolImageNamesToAccessibilityLabels_availableSymbolImageNamesToAccessibilityLabels;
  v69 = _WBSLocalizedString(@"Triangle icon", &_WBSLocalizableStringsBundleOnceToken, &_WBSLocalizableStringsBundle);
  [v68 setObject:v69 forKey:@"triangle.fill"];

  v70 = (void *)_availableSymbolImageNamesToAccessibilityLabels_availableSymbolImageNamesToAccessibilityLabels;
  v71 = _WBSLocalizedString(@"Diamond icon", &_WBSLocalizableStringsBundleOnceToken, &_WBSLocalizableStringsBundle);
  [v70 setObject:v71 forKey:@"diamond.fill"];

  v72 = (void *)_availableSymbolImageNamesToAccessibilityLabels_availableSymbolImageNamesToAccessibilityLabels;
  v73 = _WBSLocalizedString(@"Heart icon", &_WBSLocalizableStringsBundleOnceToken, &_WBSLocalizableStringsBundle);
  [v72 setObject:v73 forKey:@"heart.fill"];

  v74 = (void *)_availableSymbolImageNamesToAccessibilityLabels_availableSymbolImageNamesToAccessibilityLabels;
  v75 = _WBSLocalizedString(@"Star icon", &_WBSLocalizableStringsBundleOnceToken, &_WBSLocalizableStringsBundle);
  [v74 setObject:v75 forKey:@"star.fill"];

  v76 = (void *)_availableSymbolImageNamesToAccessibilityLabels_availableSymbolImageNamesToAccessibilityLabels;
  v77 = _WBSLocalizedString(@"Guitars icon", &_WBSLocalizableStringsBundleOnceToken, &_WBSLocalizableStringsBundle);
  [v76 setObject:v77 forKey:@"guitars.fill"];

  v78 = (void *)_availableSymbolImageNamesToAccessibilityLabels_availableSymbolImageNamesToAccessibilityLabels;
  v79 = _WBSLocalizedString(@"Paint Palette icon", &_WBSLocalizableStringsBundleOnceToken, &_WBSLocalizableStringsBundle);
  [v78 setObject:v79 forKey:@"paintpalette.fill"];

  v80 = (void *)_availableSymbolImageNamesToAccessibilityLabels_availableSymbolImageNamesToAccessibilityLabels;
  v81 = _WBSLocalizedString(@"Globe icon", &_WBSLocalizableStringsBundleOnceToken, &_WBSLocalizableStringsBundle);
  [v80 setObject:v81 forKey:@"globe.americas.fill"];

  v82 = (void *)_availableSymbolImageNamesToAccessibilityLabels_availableSymbolImageNamesToAccessibilityLabels;
  v83 = _WBSLocalizedString(@"Pencil icon", &_WBSLocalizableStringsBundleOnceToken, &_WBSLocalizableStringsBundle);
  [v82 setObject:v83 forKey:@"pencil"];

  v84 = (void *)_availableSymbolImageNamesToAccessibilityLabels_availableSymbolImageNamesToAccessibilityLabels;
  v85 = _WBSLocalizedString(@"Bicycle icon", &_WBSLocalizableStringsBundleOnceToken, &_WBSLocalizableStringsBundle);
  [v84 setObject:v85 forKey:@"bicycle"];

  v86 = (void *)_availableSymbolImageNamesToAccessibilityLabels_availableSymbolImageNamesToAccessibilityLabels;
  v87 = _WBSLocalizedString(@"Sunrise icon", &_WBSLocalizableStringsBundleOnceToken, &_WBSLocalizableStringsBundle);
  [v86 setObject:v87 forKey:@"sunrise.fill"];

  v88 = (void *)_availableSymbolImageNamesToAccessibilityLabels_availableSymbolImageNamesToAccessibilityLabels;
  v89 = _WBSLocalizedString(@"Sunset icon", &_WBSLocalizableStringsBundleOnceToken, &_WBSLocalizableStringsBundle);
  [v88 setObject:v89 forKey:@"sunset.fill"];

  v90 = (void *)_availableSymbolImageNamesToAccessibilityLabels_availableSymbolImageNamesToAccessibilityLabels;
  v91 = _WBSLocalizedString(@"Mindfulness icon", &_WBSLocalizableStringsBundleOnceToken, &_WBSLocalizableStringsBundle);
  [v90 setObject:v91 forKey:@"apple.mindfulness"];

  v92 = (void *)_availableSymbolImageNamesToAccessibilityLabels_availableSymbolImageNamesToAccessibilityLabels;
  v93 = _WBSLocalizedString(@"Airplane icon", &_WBSLocalizableStringsBundleOnceToken, &_WBSLocalizableStringsBundle);
  [v92 setObject:v93 forKey:@"airplane.departure"];

  v94 = (void *)_availableSymbolImageNamesToAccessibilityLabels_availableSymbolImageNamesToAccessibilityLabels;
  _WBSLocalizedString(@"Person icon", &_WBSLocalizableStringsBundleOnceToken, &_WBSLocalizableStringsBundle);
  id v95 = (id)objc_claimAutoreleasedReturnValue();
  [v94 setObject:v95 forKey:@"person.fill"];
}

+ (NSArray)availableSymbolImageNames
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __53__WBSCoreProfilesConstants_availableSymbolImageNames__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (availableSymbolImageNames_onceToken != -1) {
    dispatch_once(&availableSymbolImageNames_onceToken, block);
  }
  v2 = (void *)availableSymbolImageNames_orderedSymbolImageNames;
  return (NSArray *)v2;
}

void __53__WBSCoreProfilesConstants_availableSymbolImageNames__block_invoke(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) _availableSymbolImageNamesToAccessibilityLabels];
  uint64_t v1 = [v3 orderedKeys];
  v2 = (void *)availableSymbolImageNames_orderedSymbolImageNames;
  availableSymbolImageNames_orderedSymbolImageNames = v1;
}

+ (id)_availableSymbolImageNamesToAccessibilityLabels
{
  if (_availableSymbolImageNamesToAccessibilityLabels_onceToken != -1) {
    dispatch_once(&_availableSymbolImageNamesToAccessibilityLabels_onceToken, &__block_literal_global_7);
  }
  v2 = (void *)_availableSymbolImageNamesToAccessibilityLabels_availableSymbolImageNamesToAccessibilityLabels;
  return v2;
}

+ (id)accessibilityLabelForSymbol:(id)a3
{
  id v4 = a3;
  v5 = [a1 _availableSymbolImageNamesToAccessibilityLabels];
  v6 = [v5 objectForKey:v4];

  return v6;
}

+ (NSArray)orderedProfileColorOptions
{
  if (orderedProfileColorOptions_onceToken != -1) {
    dispatch_once(&orderedProfileColorOptions_onceToken, &__block_literal_global_309);
  }
  v2 = (void *)orderedProfileColorOptions_colors;
  return (NSArray *)v2;
}

void __54__WBSCoreProfilesConstants_orderedProfileColorOptions__block_invoke()
{
  v50[16] = *MEMORY[0x1E4F143B8];
  v0 = [WBSNamedColorOption alloc];
  v49 = _WBSLocalizedString(@"no color", &_WBSLocalizableStringsBundleOnceToken, &_WBSLocalizableStringsBundle);
  v48 = [(WBSNamedColorOption *)v0 initWithColorName:@"clear" red:v49 green:0.0 blue:0.0 alpha:0.0 accessibilityName:0.0];
  v50[0] = v48;
  uint64_t v1 = [WBSNamedColorOption alloc];
  v47 = _WBSLocalizedString(@"Teal Blue", &_WBSLocalizableStringsBundleOnceToken, &_WBSLocalizableStringsBundle);
  v46 = [(WBSNamedColorOption *)v1 initWithColorName:@"lightSkyBlue" red:v47 green:0.307263 blue:0.782123 alpha:0.912477 accessibilityName:1.0];
  v50[1] = v46;
  v2 = [WBSNamedColorOption alloc];
  v45 = _WBSLocalizedString(@"Purple", &_WBSLocalizableStringsBundleOnceToken, &_WBSLocalizableStringsBundle);
  v44 = [(WBSNamedColorOption *)v2 initWithColorName:@"violet" red:v45 green:0.82 blue:0.35 alpha:0.99 accessibilityName:1.0];
  v50[2] = v44;
  id v3 = [WBSNamedColorOption alloc];
  v43 = _WBSLocalizedString(@"Amber", &_WBSLocalizableStringsBundleOnceToken, &_WBSLocalizableStringsBundle);
  v42 = [(WBSNamedColorOption *)v3 initWithColorName:@"orange" red:v43 green:0.987167 blue:0.641658 alpha:0.483712 accessibilityName:1.0];
  v50[3] = v42;
  id v4 = [WBSNamedColorOption alloc];
  v41 = _WBSLocalizedString(@"Teal", &_WBSLocalizableStringsBundleOnceToken, &_WBSLocalizableStringsBundle);
  v40 = [(WBSNamedColorOption *)v4 initWithColorName:@"heatherBlue" red:v41 green:0.62 blue:0.72 alpha:0.74 accessibilityName:1.0];
  v50[4] = v40;
  v5 = [WBSNamedColorOption alloc];
  v39 = _WBSLocalizedString(@"Cool Grey", &_WBSLocalizableStringsBundleOnceToken, &_WBSLocalizableStringsBundle);
  v38 = [(WBSNamedColorOption *)v5 initWithColorName:@"lolaViolet" red:v39 green:0.72 blue:0.65 alpha:0.72 accessibilityName:1.0];
  v50[5] = v38;
  v6 = [WBSNamedColorOption alloc];
  v37 = _WBSLocalizedString(@"Light Blue", &_WBSLocalizableStringsBundleOnceToken, &_WBSLocalizableStringsBundle);
  v36 = [(WBSNamedColorOption *)v6 initWithColorName:@"mayaBlue" red:v37 green:0.46 blue:0.65 alpha:1.0 accessibilityName:1.0];
  v50[6] = v36;
  v7 = [WBSNamedColorOption alloc];
  v35 = _WBSLocalizedString(@"Pink", &_WBSLocalizableStringsBundleOnceToken, &_WBSLocalizableStringsBundle);
  v34 = [(WBSNamedColorOption *)v7 initWithColorName:@"paleVioletRed" red:v35 green:0.93 blue:0.44 alpha:0.62 accessibilityName:1.0];
  v50[7] = v34;
  v8 = [WBSNamedColorOption alloc];
  v33 = _WBSLocalizedString(@"Orange", &_WBSLocalizableStringsBundleOnceToken, &_WBSLocalizableStringsBundle);
  v32 = [(WBSNamedColorOption *)v8 initWithColorName:@"goldenYellow" red:v33 green:0.874891 blue:0.743657 alpha:0.40245 accessibilityName:1.0];
  v50[8] = v32;
  v9 = [WBSNamedColorOption alloc];
  v31 = _WBSLocalizedString(@"Green", &_WBSLocalizableStringsBundleOnceToken, &_WBSLocalizableStringsBundle);
  v30 = [(WBSNamedColorOption *)v9 initWithColorName:@"raineeGreen" red:v31 green:0.69 blue:0.76 alpha:0.67 accessibilityName:1.0];
  v50[9] = v30;
  v10 = [WBSNamedColorOption alloc];
  v29 = _WBSLocalizedString(@"Warm Grey", &_WBSLocalizableStringsBundleOnceToken, &_WBSLocalizableStringsBundle);
  v28 = [(WBSNamedColorOption *)v10 initWithColorName:@"tideBrown" red:v29 green:0.73 blue:0.69 alpha:0.65 accessibilityName:1.0];
  v50[10] = v28;
  v11 = [WBSNamedColorOption alloc];
  v27 = _WBSLocalizedString(@"Mauve", &_WBSLocalizableStringsBundleOnceToken, &_WBSLocalizableStringsBundle);
  v12 = [(WBSNamedColorOption *)v11 initWithColorName:@"mediumSlateBlue" red:v27 green:0.69 blue:0.55 alpha:0.99 accessibilityName:1.0];
  v50[11] = v12;
  v13 = [WBSNamedColorOption alloc];
  v14 = _WBSLocalizedString(@"Red", &_WBSLocalizableStringsBundleOnceToken, &_WBSLocalizableStringsBundle);
  v15 = [(WBSNamedColorOption *)v13 initWithColorName:@"sweetPink" red:v14 green:1.0 blue:0.56 alpha:0.51 accessibilityName:1.0];
  v50[12] = v15;
  v16 = [WBSNamedColorOption alloc];
  v17 = _WBSLocalizedString(@"Yellow", &_WBSLocalizableStringsBundleOnceToken, &_WBSLocalizableStringsBundle);
  v18 = [(WBSNamedColorOption *)v16 initWithColorName:@"jonquilGreen" red:v17 green:0.767932 blue:0.801688 alpha:0.472574 accessibilityName:1.0];
  v50[13] = v18;
  v19 = [WBSNamedColorOption alloc];
  v20 = _WBSLocalizedString(@"Light Green", &_WBSLocalizableStringsBundleOnceToken, &_WBSLocalizableStringsBundle);
  v21 = [(WBSNamedColorOption *)v19 initWithColorName:@"green" red:v20 green:0.646673 blue:0.805998 alpha:0.515464 accessibilityName:1.0];
  v50[14] = v21;
  v22 = [WBSNamedColorOption alloc];
  v23 = _WBSLocalizedString(@"Grey", &_WBSLocalizableStringsBundleOnceToken, &_WBSLocalizableStringsBundle);
  v24 = [(WBSNamedColorOption *)v22 initWithColorName:@"grey" red:v23 green:0.5 blue:0.5 alpha:0.5 accessibilityName:1.0];
  v50[15] = v24;
  uint64_t v25 = [MEMORY[0x1E4F1C978] arrayWithObjects:v50 count:16];
  v26 = (void *)orderedProfileColorOptions_colors;
  orderedProfileColorOptions_colors = v25;
}

+ (NSString)defaultPersonalProfileSymbolImage
{
  return (NSString *)@"person.fill";
}

+ (WBSNamedColorOption)defaultPersonalProfileColor
{
  v2 = [a1 orderedProfileColorOptions];
  id v3 = [v2 objectAtIndexedSubscript:0];

  return (WBSNamedColorOption *)v3;
}

@end