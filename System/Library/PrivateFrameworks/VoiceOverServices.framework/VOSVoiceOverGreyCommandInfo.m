@interface VOSVoiceOverGreyCommandInfo
+ (BOOL)_isStingSupported;
+ (BOOL)isVoiceOverGreyFeatureOn;
+ (id)_pairedDevice;
+ (id)defaultActions;
+ (id)defaultCustomizeGestures;
+ (id)nameForAction:(id)a3;
+ (id)symbolNameForAction:(id)a3;
@end

@implementation VOSVoiceOverGreyCommandInfo

+ (id)defaultCustomizeGestures
{
  v5[4] = *MEMORY[0x263EF8340];
  v4[0] = &unk_26CC93858;
  v4[1] = &unk_26CC93870;
  v5[0] = kVOTEventCommandSimpleTap;
  v5[1] = kVOTEventCommandActivateHomeButton;
  v4[2] = &unk_26CC93888;
  v4[3] = &unk_26CC938A0;
  v5[2] = kVOTEventCommandNextElement;
  v5[3] = kVOTEventCommandPreviousElement;
  v2 = [NSDictionary dictionaryWithObjects:v5 forKeys:v4 count:4];

  return v2;
}

+ (id)defaultActions
{
  v5[6] = *MEMORY[0x263EF8340];
  v5[0] = kVOTEventCommandActivateHomeButton;
  v5[1] = kVOTEventCommandSimpleTap;
  v5[2] = kVOTEventCommandNextElement;
  v5[3] = kVOTEventCommandPreviousElement;
  v5[4] = kVOTEventCommandWatchWakeDoubleTap;
  void v5[5] = kVOTEventCommandStartStopToggle;
  v2 = [MEMORY[0x263EFF8C0] arrayWithObjects:v5 count:6];
  v3 = (void *)[v2 mutableCopy];

  if (+[VOSVoiceOverGreyCommandInfo _isStingSupported])
  {
    [v3 insertObject:kVOTEventCommandStingKeycordPress atIndex:1];
    [v3 insertObject:kVOTEventCommandStingPress atIndex:1];
  }

  return v3;
}

+ (id)nameForAction:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:kVOTEventCommandActivateHomeButton])
  {
    v4 = @"action.digital.crown.press";
  }
  else if ([v3 isEqualToString:kVOTEventCommandSimpleTap])
  {
    v4 = @"action.double.tap";
  }
  else if ([v3 isEqualToString:kVOTEventCommandNextElement])
  {
    v4 = @"action.swipe.left";
  }
  else if ([v3 isEqualToString:kVOTEventCommandPreviousElement])
  {
    v4 = @"action.swipe.right";
  }
  else if ([v3 isEqualToString:kVOTEventCommandWatchWakeDoubleTap])
  {
    v4 = @"action.taptic.time";
  }
  else if ([v3 isEqualToString:kVOTEventCommandStartStopToggle])
  {
    v4 = @"action.magic.tap";
  }
  else if ([v3 isEqualToString:kVOTEventCommandStingPress])
  {
    v4 = @"action.sting.press";
  }
  else if ([v3 isEqualToString:kVOTEventCommandStingKeycordPress])
  {
    v4 = @"action.sting.keycord.press";
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

+ (id)symbolNameForAction:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:kVOTEventCommandActivateHomeButton])
  {
    v4 = @"applewatch.crown.fill.arrow.up";
  }
  else if ([v3 isEqualToString:kVOTEventCommandSimpleTap])
  {
    v4 = @"hand.tap.fill";
  }
  else if ([v3 isEqualToString:kVOTEventCommandNextElement])
  {
    v4 = @"chevron.left.circle.fill";
  }
  else if ([v3 isEqualToString:kVOTEventCommandPreviousElement])
  {
    v4 = @"chevron.right.circle.fill";
  }
  else if ([v3 isEqualToString:kVOTEventCommandWatchWakeDoubleTap])
  {
    v4 = @"applewatch.radiowaves.left.and.right";
  }
  else if ([v3 isEqualToString:kVOTEventCommandStartStopToggle])
  {
    v4 = @"playpause.fill";
  }
  else
  {
    v4 = @"watchdock.applewatch.case";
    if (([v3 isEqualToString:kVOTEventCommandStingPress] & 1) == 0
      && ![v3 isEqualToString:kVOTEventCommandStingKeycordPress])
    {
      v4 = 0;
    }
  }

  return v4;
}

+ (BOOL)isVoiceOverGreyFeatureOn
{
  char v2 = _os_feature_enabled_impl();
  id v3 = [(id)objc_opt_class() _pairedDevice];
  v4 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:@"1FD8E157-2B7C-45B6-B939-FFB8BE14E27F"];
  char v5 = [v3 supportsCapability:v4];

  return v2 & v5;
}

+ (id)_pairedDevice
{
  char v2 = [MEMORY[0x263F57730] sharedInstance];
  id v3 = [MEMORY[0x263F57730] activePairedDeviceSelectorBlock];
  v4 = [v2 getAllDevicesWithArchivedAltAccountDevicesMatching:v3];
  char v5 = [v4 firstObject];

  v6 = [v5 valueForProperty:*MEMORY[0x263F575B8]];
  if ([v6 BOOLValue]) {
    v7 = 0;
  }
  else {
    v7 = v5;
  }
  id v8 = v7;

  return v8;
}

+ (BOOL)_isStingSupported
{
  char v2 = [(id)objc_opt_class() _pairedDevice];
  id v3 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:@"15BF559D-D50B-44FE-AC84-DFBA323EC985"];
  char v4 = [v2 supportsCapability:v3];

  return v4;
}

@end