@interface RawDFNetworkCommon
+ (id)platformIdentifier;
+ (id)rawDFnetworkTypeToString:(int)a3;
+ (int)allocateBuffersForNetwork:(id *)a3 bindMode:(int)a4 bindBuffers:(BOOL)a5 descriptions:(const NameAndSize *)a6 textures:(id *)a7 pixelBuffers:(__CVBuffer *)a8 numBuffers:(unint64_t)a9 pixelFormat:(unsigned int)a10 metalContext:(id)a11;
+ (int)loadEspressoNetworkFromPath:(id)a3 andStoreNetwork:(id *)a4 andPlan:(void *)a5 espressoContext:(void *)a6;
@end

@implementation RawDFNetworkCommon

+ (int)allocateBuffersForNetwork:(id *)a3 bindMode:(int)a4 bindBuffers:(BOOL)a5 descriptions:(const NameAndSize *)a6 textures:(id *)a7 pixelBuffers:(__CVBuffer *)a8 numBuffers:(unint64_t)a9 pixelFormat:(unsigned int)a10 metalContext:(id)a11
{
  BOOL v14 = a5;
  v30[20] = *MEMORY[0x263EF8340];
  id v15 = a11;
  if (!a9)
  {
    CVReturn v20 = 0;
    goto LABEL_17;
  }
  uint64_t v16 = 0;
  CFAllocatorRef v17 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  uint64_t v28 = *MEMORY[0x263F04130];
  p_var2 = &a6->var2;
  while (v14)
  {
    CVReturn v19 = espresso_network_bind_buffer();
    if (v19) {
      goto LABEL_19;
    }
    if (*a8) {
      goto LABEL_23;
    }
    CVReturn v20 = CVPixelBufferCreateWithIOSurface(v17, 0, 0, a8);
    if (IOSurfaceGetWidth(0) != *(p_var2 - 1) || IOSurfaceGetHeight(0) != *p_var2) {
      goto LABEL_23;
    }
    v21 = *a8;
LABEL_13:
    v24 = [v15 bindPixelBufferToMTL2DTexture:v21 pixelFormat:25 usage:7 plane:0];
    id v25 = *a7;
    *a7 = v24;

    if (!*a7) {
      goto LABEL_23;
    }
    --v16;
    ++a8;
    ++a7;
    p_var2 += 3;
    if (-(uint64_t)a9 == v16) {
      goto LABEL_17;
    }
  }
  if (!*a8)
  {
    size_t v22 = *(p_var2 - 1);
    size_t v23 = *p_var2;
    uint64_t v29 = v28;
    v30[0] = MEMORY[0x263EFFA78];
    CVReturn v19 = CVPixelBufferCreate(v17, v22, v23, a10, (CFDictionaryRef)[NSDictionary dictionaryWithObjects:v30 forKeys:&v29 count:1], a8);
    if (v19)
    {
LABEL_19:
      CVReturn v20 = v19;
      v27 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT);
      goto LABEL_24;
    }
    v21 = *a8;
    if (*a8)
    {
      CVReturn v20 = 0;
      goto LABEL_13;
    }
  }
LABEL_23:
  v27 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
  os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT);
  CVReturn v20 = -73319;
LABEL_24:
  fig_log_call_emit_and_clean_up_after_send_and_compose();

LABEL_17:
  return v20;
}

+ (int)loadEspressoNetworkFromPath:(id)a3 andStoreNetwork:(id *)a4 andPlan:(void *)a5 espressoContext:(void *)a6
{
  id v7 = a3;
  plan = (void *)espresso_create_plan();
  *a5 = plan;
  if (!plan)
  {
    v12 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();

    int v10 = -73319;
    goto LABEL_4;
  }
  [v7 UTF8String];
  int v9 = espresso_plan_add_network();
  if (v9)
  {
    int v10 = v9;
    v13 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);
LABEL_8:
    fig_log_call_emit_and_clean_up_after_send_and_compose();

    goto LABEL_4;
  }
  int v10 = espresso_plan_build();
  if (v10)
  {
    v13 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);
    goto LABEL_8;
  }
LABEL_4:

  return v10;
}

+ (id)platformIdentifier
{
  v2 = (void *)FigCapturePlatformIdentifierString();

  return v2;
}

+ (id)rawDFnetworkTypeToString:(int)a3
{
  v3 = @"Low Light";
  if (a3 == 1) {
    v3 = @"Bright Light";
  }
  if (a3 == 2) {
    return @"Not loaded";
  }
  else {
    return v3;
  }
}

@end