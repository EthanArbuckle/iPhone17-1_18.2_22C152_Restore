@interface NACDaemonServer
+ (id)companionServer;
+ (id)gizmoServer;
@end

@implementation NACDaemonServer

+ (id)gizmoServer
{
  if (gizmoServer_onceToken != -1) {
    dispatch_once(&gizmoServer_onceToken, &__block_literal_global_2);
  }
  v2 = (void *)gizmoServer_server;

  return v2;
}

uint64_t __30__NACDaemonServer_gizmoServer__block_invoke()
{
  v7[1] = *MEMORY[0x263EF8340];
  uint64_t v0 = objc_opt_new();
  v1 = (void *)gizmoServer_server;
  gizmoServer_server = v0;

  v2 = [NACIDSServer alloc];
  v7[0] = @"Ringtone";
  v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v7 count:1];
  uint64_t v4 = [(NACIDSServer *)v2 initWithVolumeAudioCategories:v3];
  v5 = *(void **)(gizmoServer_server + 8);
  *(void *)(gizmoServer_server + 8) = v4;

  [*(id *)(gizmoServer_server + 8) beginObservingHapticState];
  return [*(id *)(gizmoServer_server + 8) beginObservingSystemMutedState];
}

+ (id)companionServer
{
  if (companionServer_onceToken != -1) {
    dispatch_once(&companionServer_onceToken, &__block_literal_global_5);
  }
  v2 = (void *)companionServer_server;

  return v2;
}

void __34__NACDaemonServer_companionServer__block_invoke()
{
  v6[1] = *MEMORY[0x263EF8340];
  uint64_t v0 = objc_opt_new();
  v1 = (void *)companionServer_server;
  companionServer_server = v0;

  v2 = [NACIDSServer alloc];
  v6[0] = @"Audio/Video";
  v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:1];
  uint64_t v4 = [(NACIDSServer *)v2 initWithVolumeAudioCategories:v3];
  v5 = *(void **)(companionServer_server + 8);
  *(void *)(companionServer_server + 8) = v4;
}

- (void).cxx_destruct
{
}

@end