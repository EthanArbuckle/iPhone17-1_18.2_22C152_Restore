@interface SBHAppPredictionsElement
+ (id)elementIdentifier;
+ (id)elementKind;
- (BOOL)iconShouldIgnoreOtherDataSources:(id)a3;
- (id)displayName;
- (id)icon:(id)a3 imageWithInfo:(SBIconImageInfo *)a4;
- (id)supportedGridSizeClasses;
@end

@implementation SBHAppPredictionsElement

+ (id)elementIdentifier
{
  return @"com.apple.proactive.appprediction.panel";
}

+ (id)elementKind
{
  return @"SBHSpecialAvocadoDescriptorKindAppPredictions";
}

- (id)displayName
{
  v2 = SBHBundle();
  v3 = [v2 localizedStringForKey:@"PROACTIVE_SUGGESTIONS_WIDGET_COLLECTION_NAME" value:&stru_1F2FA0300 table:@"SpringBoardHome"];

  return v3;
}

- (id)icon:(id)a3 imageWithInfo:(SBIconImageInfo *)a4
{
  double v7 = v6;
  double v8 = v5;
  double v9 = v4;
  id v10 = a3;
  uint64_t v16 = 0;
  v17 = &v16;
  uint64_t v18 = 0x2050000000;
  v11 = (void *)getAPUIAppPredictionViewControllerClass_softClass;
  uint64_t v19 = getAPUIAppPredictionViewControllerClass_softClass;
  if (!getAPUIAppPredictionViewControllerClass_softClass)
  {
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __getAPUIAppPredictionViewControllerClass_block_invoke;
    v15[3] = &unk_1E6AAD648;
    v15[4] = &v16;
    __getAPUIAppPredictionViewControllerClass_block_invoke((uint64_t)v15);
    v11 = (void *)v17[3];
  }
  id v12 = v11;
  _Block_object_dispose(&v16, 8);
  v13 = objc_msgSend(v12, "imageForIconSize:scale:", v9, v8, v7);

  return v13;
}

- (BOOL)iconShouldIgnoreOtherDataSources:(id)a3
{
  return 1;
}

- (id)supportedGridSizeClasses
{
  v2 = [[SBHIconGridSizeClassSet alloc] initWithGridSizeClass:@"SBHIconGridSizeClassMedium"];
  return v2;
}

@end