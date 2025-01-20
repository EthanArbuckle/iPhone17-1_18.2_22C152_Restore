@interface NACVolumeController
+ (id)demoVolumeControllerWithAudioCategory:(id)a3;
+ (id)localVolumeControllerWithAudioCategory:(id)a3;
+ (id)localVolumeControllerWithRoute:(id)a3;
+ (id)proxyVolumeControllerWithAudioCategory:(id)a3;
+ (id)proxyVolumeControllerWithTarget:(id)a3;
@end

@implementation NACVolumeController

+ (id)localVolumeControllerWithAudioCategory:(id)a3
{
  id v3 = a3;
  v4 = [[NACVolumeControllerLocal alloc] initWithAudioCategory:v3];

  return v4;
}

+ (id)localVolumeControllerWithRoute:(id)a3
{
  id v3 = a3;
  v4 = [[NACVolumeControllerLocal alloc] initWithRoute:v3];

  return v4;
}

+ (id)proxyVolumeControllerWithAudioCategory:(id)a3
{
  id v3 = a3;
  NACCategoryStringWithRouteCategory(v3);
  v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  int v5 = [v3 isEqualToString:@"Ringtone"];

  if (v5)
  {
    v6 = [MEMORY[0x263F57730] sharedInstance];
    v7 = [v6 getActivePairedDevice];
    v8 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:@"F917CEA4-4001-46AF-8291-CA74CF9178BE"];
    char v9 = [v7 supportsCapability:v8];

    if ((v9 & 1) == 0)
    {

      v4 = @"RingtonePreview";
    }
  }
  v10 = +[NACProxyVolumeControlTarget volumeControlTargetWithCategory:v4];
  v11 = [[NACVolumeControllerProxy alloc] initWithVolumeControlTarget:v10];

  return v11;
}

+ (id)proxyVolumeControllerWithTarget:(id)a3
{
  id v3 = a3;
  if ([v3 isPairedDevice])
  {
    v4 = [v3 category];
    if ([v4 isEqual:@"Ringtone"])
    {

LABEL_5:
      v7 = [[NACVolumeControllerProxy alloc] initWithVolumeControlTarget:v3];
      goto LABEL_9;
    }
    int v5 = [v3 category];
    char v6 = [v5 isEqual:@"RingtonePreview"];

    if (v6) {
      goto LABEL_5;
    }
  }
  v8 = NMLogForCategory(4);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
    +[NACVolumeController proxyVolumeControllerWithTarget:]((uint64_t)v3, v8);
  }

  v7 = 0;
LABEL_9:

  return v7;
}

+ (id)demoVolumeControllerWithAudioCategory:(id)a3
{
  id v3 = a3;
  v4 = [[NACVolumeControllerDemo alloc] initWithAudioCategory:v3];

  return v4;
}

+ (void)proxyVolumeControllerWithTarget:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_237CD4000, a2, OS_LOG_TYPE_ERROR, "Failed to create proxy NACVolumeController with invalid target: %@", (uint8_t *)&v2, 0xCu);
}

@end