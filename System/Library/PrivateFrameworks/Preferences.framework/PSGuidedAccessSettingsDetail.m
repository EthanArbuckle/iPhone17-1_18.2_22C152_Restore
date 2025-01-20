@interface PSGuidedAccessSettingsDetail
+ (BOOL)guidedAccessHasPasscode;
+ (id)iconImage;
+ (id)preferencesURL;
+ (unint64_t)guidedAccessAvailability;
+ (void)enterGuidedAccessMode;
+ (void)setGuidedAccessSwitchEnabled:(BOOL)a3;
@end

@implementation PSGuidedAccessSettingsDetail

+ (id)preferencesURL
{
  return (id)[MEMORY[0x1E4F1CB10] URLWithString:@"prefs:root=ACCESSIBILITY&path=GUIDED_ACCESS_TITLE"];
}

+ (id)iconImage
{
  return (id)objc_msgSend(MEMORY[0x1E4F42A80], "ps_synchronousIconWithTypeIdentifier:", @"com.apple.graphic-icon.accessibility");
}

+ (BOOL)guidedAccessHasPasscode
{
  return _AXSGuidedAccessHasPasscode() != 0;
}

+ (void)setGuidedAccessSwitchEnabled:(BOOL)a3
{
}

+ (void)enterGuidedAccessMode
{
  if (+[PSGuidedAccessSettingsDetail guidedAccessHasPasscode])
  {
    MEMORY[0x1F4178B28]();
  }
}

+ (unint64_t)guidedAccessAvailability
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x2020000000;
  v2 = (uint64_t (*)(void))getAXGuidedAccessGetAvailabilitySymbolLoc_ptr;
  v9 = getAXGuidedAccessGetAvailabilitySymbolLoc_ptr;
  if (!getAXGuidedAccessGetAvailabilitySymbolLoc_ptr)
  {
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __getAXGuidedAccessGetAvailabilitySymbolLoc_block_invoke;
    v5[3] = &unk_1E5C5D4D8;
    v5[4] = &v6;
    __getAXGuidedAccessGetAvailabilitySymbolLoc_block_invoke((uint64_t)v5);
    v2 = (uint64_t (*)(void))v7[3];
  }
  _Block_object_dispose(&v6, 8);
  if (!v2)
  {
    v4 = (_Unwind_Exception *)-[PSContactsAuthorizationLevelController dealloc]();
    _Block_object_dispose(&v6, 8);
    _Unwind_Resume(v4);
  }
  return v2();
}

@end