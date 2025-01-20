@interface PVEnvironment
+ (BOOL)PVHighlightHDRRegions;
+ (BOOL)PV_APPLY_AVF_RENDER_TRANSFORM_TO_OUTPUT;
+ (BOOL)PV_CLAMP_XR_INPUTS_TO_FILTERS;
+ (BOOL)PV_DEBUG_COLOR_NO_SOURCE_TRACK_NODE;
+ (BOOL)PV_DEBUG_COLOR_OUT_OF_RANGE_EFFECTS;
+ (BOOL)PV_DISABLE_PROXY_RENDERING;
+ (BOOL)PV_DISABLE_TIMELINE_SCROLLING;
+ (BOOL)PV_DISABLE_YCBCR_INPUTS;
+ (BOOL)PV_ENABLE_420V_OUTPUT;
+ (BOOL)PV_ENABLE_AVF_COLOR_CONFORM_INPUTS;
+ (BOOL)PV_ENABLE_BGRA_OUTPUT_EXPORT;
+ (BOOL)PV_ENABLE_CHECK_PASSTHRUS;
+ (BOOL)PV_ENABLE_ENV_LOGS;
+ (BOOL)PV_HIGHLIGHT_OUT_OF_GAMUT;
+ (BOOL)PV_MULTI_SOURCE_PLAYBACK_FPS;
+ (BOOL)PV_SERIALIZE_EXPORT_REQUESTS;
+ (BOOL)PV_THROTTLE_EXPORT_ON_MEM_WARNING;
+ (float)PVExportPrefilterValue;
+ (float)PV_TEXTURE_POOL_FINISH_SIZE_RATIO;
+ (id)versionInfo;
+ (int)PV_NUM_RENDER_PASSES;
+ (int)PV_PERFORMANCE_LOG_FORMAT;
+ (int)PV_PERFORMANCE_LOG_LEVEL;
+ (int)PV_PERFORMANCE_LOG_OUTPUT;
+ (int)PV_RENDER_PASS_TEST_TYPE;
+ (int)PV_RENDER_THREAD_PRIORITY;
+ (int)PV_TEXTURE_BORDER_WIDTH;
+ (int)PV_TEXTURE_POOL_SIZE_MB;
+ (unsigned)PVPageSize;
+ (unsigned)PVPageSizeBackgrounded;
+ (unsigned)PVPageSizeLowMemExport;
+ (unsigned)PV_HG_POOL_OBSERVER_INTERVAL;
+ (unsigned)PV_MAX_EXPECTED_LIVE_COMPOSITORS;
+ (unsigned)PV_METAL_COMMAND_Q_COMMAND_BUFFER_COUNT_MAX;
+ (unsigned)PV_METAL_COMMAND_Q_COMMAND_BUFFER_COUNT_MIN;
+ (unsigned)PV_METAL_COMMAND_Q_MEM_USAGE;
+ (unsigned)PV_TEXTURE_CLUSTER_PADDING_CLUMPING;
+ (unsigned)PV_TEXTURE_CLUSTER_PADDING_CUSHIONING;
+ (unsigned)PV_TEXTURE_CLUSTER_PADDING_REMEMBRANCE;
+ (unsigned)PV_THROTTLE_AVF_EXPORT_REQUEST_HANDLING_MS;
+ (void)Initialize;
@end

@implementation PVEnvironment

+ (void)Initialize
{
  if (+[PVEnvironment Initialize]::once != -1) {
    dispatch_once(&+[PVEnvironment Initialize]::once, &__block_literal_global_4);
  }
}

void __27__PVEnvironment_Initialize__block_invoke()
{
  id v51 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  v0 = getenv("PV_DISABLE_PROXY_RENDERING");
  if (v0 && atoi(v0)) {
    s_disableProxyRendering = 1;
  }
  v1 = getenv("PV_DISABLE_TIMELINE_SCROLLING");
  if (v1 && atoi(v1)) {
    s_disableTimelineScrolling = 1;
  }
  v2 = getenv("PV_DISABLE_YCBCR_INPUTS");
  if (v2 && atoi(v2)) {
    s_disableYCbCrInputs = 1;
  }
  v3 = getenv("PV_PERFORMANCE_LOG_LEVEL");
  if (v3)
  {
    int v4 = atoi(v3);
  }
  else
  {
    v5 = [v51 objectForKey:@"PV_PERFORMANCE_LOG_LEVEL"];

    if (!v5) {
      goto LABEL_15;
    }
    int v4 = [v51 integerForKey:@"PV_PERFORMANCE_LOG_LEVEL"];
  }
  PVPerfStats::_logLevel = v4;
LABEL_15:
  v6 = getenv("PV_PERFORMANCE_LOG_FORMAT");
  if (v6)
  {
    int v7 = atoi(v6);
  }
  else
  {
    v8 = [v51 objectForKey:@"PV_PERFORMANCE_LOG_FORMAT"];

    if (!v8) {
      goto LABEL_20;
    }
    int v7 = [v51 integerForKey:@"PV_PERFORMANCE_LOG_FORMAT"];
  }
  PVPerfStats::_logFormat = v7;
LABEL_20:
  v9 = getenv("PV_PERFORMANCE_LOG_OUTPUT");
  if (v9)
  {
    int v10 = atoi(v9);
  }
  else
  {
    v11 = [v51 objectForKey:@"PV_PERFORMANCE_LOG_OUTPUT"];

    if (!v11) {
      goto LABEL_25;
    }
    int v10 = [v51 integerForKey:@"PV_PERFORMANCE_LOG_OUTPUT"];
  }
  PVPerfStats::_logOutput = v10;
LABEL_25:
  v12 = getenv("PV_TEXTURE_BORDER_WIDTH");
  if (v12)
  {
    int v13 = atoi(v12);
    s_textureBorderWidth = v13 & ~(v13 >> 31);
  }
  v14 = getenv("PV_TEXTURE_POOL_SIZE_MB");
  if (v14) {
    int v15 = atoi(v14);
  }
  else {
    int v15 = (int)((double)((unint64_t)+[PVDeviceCharacteristics actualMemory] >> 20)* 0.2);
  }
  s_texturePoolSizeMB = v15;
  v16 = getenv("PV_TEXTURE_POOL_FINISH_SIZE_RATIO");
  if (v16)
  {
    *(float *)&int v17 = atof(v16);
    s_texturePoolFinishSizeRatio = v17;
  }
  v18 = getenv("PV_TEXTURE_CLUSTER_PADDING_REMEMBRANCE");
  if (v18) {
    int v19 = atoi(v18);
  }
  else {
    int v19 = 20;
  }
  s_textureClusterPaddingRemembrance = v19;
  v20 = getenv("PV_TEXTURE_CLUSTER_PADDING_CUSHIONING");
  if (v20) {
    int v21 = atoi(v20);
  }
  else {
    int v21 = 32;
  }
  s_textureClusterPaddingCushioning = v21;
  v22 = getenv("PV_TEXTURE_CLUSTER_PADDING_CLUMPING");
  if (v22) {
    int v23 = atoi(v22);
  }
  else {
    int v23 = 64;
  }
  s_textureClusterPaddingClumping = v23;
  v24 = getenv("PV_ENABLE_CHECK_PASSTHRUS");
  if (v24) {
    BOOL v25 = atoi(v24) != 0;
  }
  else {
    BOOL v25 = 0;
  }
  s_enableCheckPassthrus = v25;
  v26 = getenv("PV_MULTI_SOURCE_PLAYBACK_FPS");
  if (v26 && atoi(v26)) {
    s_enableMultiSourcePlaybackFPS = 1;
  }
  v27 = [v51 objectForKey:@"PV_MULTI_SOURCE_PLAYBACK_FPS"];
  if (v27)
  {
    int v28 = [v51 BOOLForKey:@"PV_MULTI_SOURCE_PLAYBACK_FPS"];

    if (v28) {
      s_enableMultiSourcePlaybackFPS = 1;
    }
  }
  v29 = getenv("PV_NUM_RENDER_PASSES");
  if (v29) {
    s_numRenderPasses = atoi(v29);
  }
  v30 = getenv("PV_RENDER_PASS_TEST_TYPE");
  if (v30) {
    s_renderPassTestType = atoi(v30);
  }
  v31 = getenv("PV_ENABLE_420V_OUTPUT");
  if (v31 && atoi(v31)) {
    s_enable420vOutput = 1;
  }
  v32 = getenv("PV_ENABLE_BGRA_OUTPUT_EXPORT");
  if (v32 && atoi(v32)) {
    s_enableBGRAOutputExport = 1;
  }
  v33 = getenv("PV_ENABLE_AVF_COLOR_CONFORM_INPUTS");
  if (v33 && atoi(v33)) {
    s_enableAVFColorConformInputs = 1;
  }
  v34 = getenv("PV_APPLY_AVF_RENDER_TRANSFORM_TO_OUTPUT");
  if (v34 && atoi(v34)) {
    s_applyAVFRenderTransformToOutput = 1;
  }
  v35 = getenv("PV_RENDER_THREAD_PRIORITY");
  if (v35) {
    s_renderThreadPriority = atoi(v35);
  }
  v36 = getenv("PV_SERIALIZE_EXPORT_REQUESTS");
  if (v36 && atoi(v36)
    || +[PVDeviceCharacteristics isLowMemDevice])
  {
    s_serializeExportRequests = 1;
  }
  v37 = [v51 objectForKey:@"PVExportPrefilterValue"];

  if (v37)
  {
    unint64_t v38 = [v51 integerForKey:@"PVExportPrefilterValue"];
    if (v38 < 5) {
      s_exportPrefilterValue = dword_1B7E73648[v38];
    }
  }
  v39 = getenv("PV_THROTTLE_AVF_EXPORT_REQUEST_HANDLING_MS");
  if (v39) {
    s_throttleAVFExportRequestReturnMS = atoi(v39);
  }
  v40 = getenv("PV_THROTTLE_EXPORT_ON_MEM_WARNING");
  if (v40 && !atoi(v40)) {
    s_throttleExportOnMemWarning = 1;
  }
  v41 = getenv("PV_DEBUG_COLOR_OUT_OF_RANGE_EFFECTS");
  if (v41 && atoi(v41)) {
    s_debugColorOutOfRangeEffects = 1;
  }
  v42 = getenv("PV_DEBUG_COLOR_NO_SOURCE_TRACK_NODE");
  if (v42 && atoi(v42)) {
    s_debugColorNoSourceTrackNode = 1;
  }
  v43 = getenv("PV_ENABLE_ENV_LOGS");
  if (v43 && atoi(v43)) {
    s_enableEnvLogs = 1;
  }
  v44 = getenv("PV_MAX_EXPECTED_LIVE_COMPOSITORS");
  if (v44) {
    s_maxExpectedLiveCompositors = atoi(v44);
  }
  v45 = getenv("PV_HIGHLIGHT_OUT_OF_GAMUT");
  if (v45 && atoi(v45)) {
    s_highlightOutOfGamut = 1;
  }
  v46 = getenv("PV_CLAMP_XR_INPUTS_TO_FILTERS");
  if (v46 && !atoi(v46)) {
    s_clampInputsToFilters = 1;
  }
  v47 = getenv("PV_HG_POOL_OBSERVER_INTERVAL");
  if (v47) {
    s_hgPoolObserverInterval = atoi(v47);
  }
  v48 = getenv("PV_METAL_COMMAND_Q_COMMAND_BUFFER_COUNT_MIN");
  if (v48) {
    s_metalCommandQCommandBufferCountMin = atoi(v48);
  }
  v49 = getenv("PV_METAL_COMMAND_Q_COMMAND_BUFFER_COUNT_MAX");
  if (v49) {
    s_metalCommandQCommandBufferCountMax = atoi(v49);
  }
  v50 = getenv("PV_METAL_COMMAND_Q_MEM_USAGE");
  if (v50) {
    s_metalCommandQMemUsage = atoi(v50);
  }
}

+ (BOOL)PV_DISABLE_PROXY_RENDERING
{
  return s_disableProxyRendering;
}

+ (BOOL)PV_DISABLE_TIMELINE_SCROLLING
{
  return s_disableTimelineScrolling;
}

+ (BOOL)PV_DISABLE_YCBCR_INPUTS
{
  return s_disableYCbCrInputs;
}

+ (int)PV_PERFORMANCE_LOG_LEVEL
{
  return PVPerfStats::_logLevel;
}

+ (int)PV_PERFORMANCE_LOG_FORMAT
{
  return PVPerfStats::_logFormat;
}

+ (int)PV_PERFORMANCE_LOG_OUTPUT
{
  return PVPerfStats::_logOutput;
}

+ (int)PV_TEXTURE_BORDER_WIDTH
{
  return s_textureBorderWidth;
}

+ (int)PV_TEXTURE_POOL_SIZE_MB
{
  return s_texturePoolSizeMB;
}

+ (float)PV_TEXTURE_POOL_FINISH_SIZE_RATIO
{
  return *(float *)&s_texturePoolFinishSizeRatio;
}

+ (unsigned)PV_TEXTURE_CLUSTER_PADDING_REMEMBRANCE
{
  return s_textureClusterPaddingRemembrance;
}

+ (unsigned)PV_TEXTURE_CLUSTER_PADDING_CUSHIONING
{
  return s_textureClusterPaddingCushioning;
}

+ (unsigned)PV_TEXTURE_CLUSTER_PADDING_CLUMPING
{
  return s_textureClusterPaddingClumping;
}

+ (BOOL)PV_ENABLE_CHECK_PASSTHRUS
{
  return s_enableCheckPassthrus;
}

+ (BOOL)PV_MULTI_SOURCE_PLAYBACK_FPS
{
  return s_enableMultiSourcePlaybackFPS;
}

+ (int)PV_NUM_RENDER_PASSES
{
  return s_numRenderPasses;
}

+ (int)PV_RENDER_PASS_TEST_TYPE
{
  return s_renderPassTestType;
}

+ (BOOL)PV_ENABLE_420V_OUTPUT
{
  return s_enable420vOutput;
}

+ (BOOL)PV_ENABLE_BGRA_OUTPUT_EXPORT
{
  return s_enableBGRAOutputExport;
}

+ (BOOL)PV_ENABLE_AVF_COLOR_CONFORM_INPUTS
{
  return s_enableAVFColorConformInputs;
}

+ (BOOL)PV_APPLY_AVF_RENDER_TRANSFORM_TO_OUTPUT
{
  return s_applyAVFRenderTransformToOutput;
}

+ (int)PV_RENDER_THREAD_PRIORITY
{
  return s_renderThreadPriority;
}

+ (BOOL)PV_SERIALIZE_EXPORT_REQUESTS
{
  return s_serializeExportRequests;
}

+ (unsigned)PV_THROTTLE_AVF_EXPORT_REQUEST_HANDLING_MS
{
  return s_throttleAVFExportRequestReturnMS;
}

+ (BOOL)PV_THROTTLE_EXPORT_ON_MEM_WARNING
{
  return (s_throttleExportOnMemWarning & 1) == 0;
}

+ (BOOL)PV_DEBUG_COLOR_OUT_OF_RANGE_EFFECTS
{
  return s_debugColorOutOfRangeEffects;
}

+ (BOOL)PV_DEBUG_COLOR_NO_SOURCE_TRACK_NODE
{
  return s_debugColorNoSourceTrackNode;
}

+ (BOOL)PV_ENABLE_ENV_LOGS
{
  return s_enableEnvLogs;
}

+ (unsigned)PV_MAX_EXPECTED_LIVE_COMPOSITORS
{
  return s_maxExpectedLiveCompositors;
}

+ (BOOL)PV_HIGHLIGHT_OUT_OF_GAMUT
{
  return s_highlightOutOfGamut;
}

+ (BOOL)PV_CLAMP_XR_INPUTS_TO_FILTERS
{
  return (s_clampInputsToFilters & 1) == 0;
}

+ (unsigned)PV_HG_POOL_OBSERVER_INTERVAL
{
  return s_hgPoolObserverInterval;
}

+ (unsigned)PV_METAL_COMMAND_Q_COMMAND_BUFFER_COUNT_MIN
{
  return s_metalCommandQCommandBufferCountMin;
}

+ (unsigned)PV_METAL_COMMAND_Q_COMMAND_BUFFER_COUNT_MAX
{
  return s_metalCommandQCommandBufferCountMax;
}

+ (unsigned)PV_METAL_COMMAND_Q_MEM_USAGE
{
  return s_metalCommandQMemUsage;
}

+ (float)PVExportPrefilterValue
{
  return *(float *)&s_exportPrefilterValue;
}

+ (BOOL)PVHighlightHDRRegions
{
  v2 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  v3 = [v2 valueForKey:@"PVHighlightHDRRegions"];
  int v4 = v3;
  if (v3) {
    BOOL v5 = [v3 intValue] != 0;
  }
  else {
    BOOL v5 = 0;
  }

  return v5;
}

+ (unsigned)PVPageSize
{
  return 2048;
}

+ (unsigned)PVPageSizeBackgrounded
{
  return 1024;
}

+ (unsigned)PVPageSizeLowMemExport
{
  return 512;
}

+ (id)versionInfo
{
  qmemcpy(v3, "@(#)PROG@(#)PROG@(#)PROG@(#)PROG@(#)PROG@(#)PROG@(#)PROG@(#)PROG@(#)PROG@(#)PROG@(#)PROG", sizeof(v3));
  return (id)objc_msgSend(NSString, "stringWithFormat:", @"%s\n%s\n%s\n%s\n%s\n%s\n%s\n%s\n%s\n%s\n%s\n%s\n", 0x3FF0000000000000, v3[0], v3[1], v3[2], v3[3], v3[4], v3[5], v3[6], v3[7], v3[8], v3[9], v3[10]);
}

@end