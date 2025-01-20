@interface CaptureInterposerInit
@end

@implementation CaptureInterposerInit

void __CaptureInterposerInit_block_invoke(id a1)
{
  GTCoreLogInit("com.apple.gputools.capture", (uint64_t)&unk_221540, 4);
  hideMemory = 1;
  GTMTLCaptureEnvironment_init();
  GTMTLTelemetryEnvironment_init();
  s_logUsingOsLog = (qword_2501C8 & 0x20000) == 0;
  apr_initialize();
  apr_pool_create_ex(&newpool, 0, 0, 0);
  g_loadURLAsMemHeader = 1;
  g_ctx = GTTraceContext_create();
  CaptureMTLInit();
  CaptureCA();
  _objc_addWillInitializeClassFunc();
  GTMTLCaptureManager_init();
  GTCaptureBoundaryTracker_init(g_ctx);
  if (GTTelemetry_init::onceToken != -1) {
    dispatch_once(&GTTelemetry_init::onceToken, &__block_literal_global_10928);
  }
  g_guestAppClientMTL = (uint64_t)GTMTLGuestAppClient_interposeCommonInit();
}

@end