@interface ZOTSystemInterface
+ (id)applicationWorkspace;
+ (id)runningApplications;
+ (id)topApplicationBundleId;
+ (void)initialize;
+ (void)sendUserEventOccurred;
@end

@implementation ZOTSystemInterface

+ (void)initialize
{
  uint64_t v2 = NSClassFromString(@"AXBackBoardGlue");
  v3 = (void *)AXBackboardGlue;
  AXBackboardGlue = v2;

  id v4 = +[AXValidationManager sharedInstance];
  [v4 performValidations:&__block_literal_global_1 withPreValidationHandler:&__block_literal_global_305 postValidationHandler:0];
}

BOOL __32__ZOTSystemInterface_initialize__block_invoke(id a1, AXValidationManager *a2)
{
  uint64_t v2 = a2;
  [(AXValidationManager *)v2 validateClass:@"AXBackBoardGlue", @"sendUserEventOccurred", "v", 0 hasClassMethod withFullSignature];
  [(AXValidationManager *)v2 validateClass:@"AXBackBoardGlue", @"topApplicationBundleId", "@", 0 hasClassMethod withFullSignature];
  [(AXValidationManager *)v2 validateClass:@"AXBackBoardGlue", @"runningApplications", "@", 0 hasClassMethod withFullSignature];
  [(AXValidationManager *)v2 validateClass:@"AXBackBoardGlue", @"applicationWorkspace", "@", 0 hasClassMethod withFullSignature];
  [(AXValidationManager *)v2 validateClass:@"BKApplication" hasInstanceVariable:@"_activationSettings" withType:"BKSApplicationActivationSettings"];
  [(AXValidationManager *)v2 validateClass:@"BKSApplicationActivationSettings", @"classic", "B", 0 hasInstanceMethod withFullSignature];
  [(AXValidationManager *)v2 validateClass:@"BKApplication", @"noteSuspended:", "v", "^{__GSEvent=}", 0 hasInstanceMethod withFullSignature];
  [(AXValidationManager *)v2 validateClass:@"BKApplication", @"noteSuspensionSettingsUpdated:", "v", "^{__GSEvent=}", 0 hasInstanceMethod withFullSignature];

  return 1;
}

BOOL __32__ZOTSystemInterface_initialize__block_invoke_2(id a1, AXValidationManager *a2)
{
  uint64_t v2 = a2;
  [(AXValidationManager *)v2 setValidationTargetName:@"ZoomTouch"];
  [(AXValidationManager *)v2 setOverrideProcessName:@"ZoomTouch"];

  return _AXPerformValidationChecks();
}

+ (void)sendUserEventOccurred
{
  id v2 = +[AXUserEventTimer sharedInstance];
  [v2 userEventOccurred];
}

+ (id)topApplicationBundleId
{
  return [(id)AXBackboardGlue safeValueForKey:@"topApplicationBundleId"];
}

+ (id)runningApplications
{
  return [(id)AXBackboardGlue safeValueForKey:@"runningApplications"];
}

+ (id)applicationWorkspace
{
  return [(id)AXBackboardGlue safeValueForKey:@"applicationWorkspace"];
}

@end