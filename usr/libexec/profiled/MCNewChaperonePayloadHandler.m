@interface MCNewChaperonePayloadHandler
- (BOOL)installWithInstaller:(id)a3 options:(id)a4 interactionClient:(id)a5 outError:(id *)a6;
- (BOOL)isInstalled;
- (void)didInstallOldGlobalRestrictions:(id)a3 newGlobalRestrictions:(id)a4;
@end

@implementation MCNewChaperonePayloadHandler

- (BOOL)installWithInstaller:(id)a3 options:(id)a4 interactionClient:(id)a5 outError:(id *)a6
{
  if (a6)
  {
    uint64_t v7 = MCInstallationErrorDomain;
    v8 = MCErrorArray();
    +[NSError MCErrorWithDomain:code:descriptionArray:errorType:](NSError, "MCErrorWithDomain:code:descriptionArray:errorType:", v7, 4024, v8, MCErrorTypeFatal, 0);
    *a6 = (id)objc_claimAutoreleasedReturnValue();
  }
  return 0;
}

- (BOOL)isInstalled
{
  return 1;
}

- (void)didInstallOldGlobalRestrictions:(id)a3 newGlobalRestrictions:(id)a4
{
  CFPreferencesSetAppValue(@"com.apple.purplebuddy", kCFBooleanTrue, @"SetupDone");

  CFPreferencesAppSynchronize(@"com.apple.purplebuddy");
}

@end