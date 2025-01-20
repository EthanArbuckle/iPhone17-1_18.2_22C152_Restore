void start()
{
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;

  _set_user_dir_suffix();
  if (!CelestialIsAudioAccessory())
  {
    getpid();
    memorystatus_control();
  }
  FigCommonMediaProcessInitialization();
  if (gGMFigKTraceEnabled == 1) {
    kdebug_trace();
  }
  os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
  os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
  fig_log_call_emit_and_clean_up_after_send_and_compose();
  FigAudioSessionInitializeVTFigAudioSession();
  VTDecompressionSessionServerStartXPC();
  VTDecompressionSessionServerStart();
  if (VTVideoCodecService_ShouldUseSeparateCodecProcessForEncode()) {
    VTCompressionSessionServerStart();
  }
  if (gGMFigKTraceEnabled == 1) {
    kdebug_trace();
  }
  dispatch_main();
}

uint64_t CelestialIsAudioAccessory()
{
  return _CelestialIsAudioAccessory();
}

uint64_t FigAudioSessionInitializeVTFigAudioSession()
{
  return _FigAudioSessionInitializeVTFigAudioSession();
}

uint64_t FigCommonMediaProcessInitialization()
{
  return _FigCommonMediaProcessInitialization();
}

uint64_t VTCompressionSessionServerStart()
{
  return _VTCompressionSessionServerStart();
}

uint64_t VTDecompressionSessionServerStart()
{
  return _VTDecompressionSessionServerStart();
}

uint64_t VTDecompressionSessionServerStartXPC()
{
  return _VTDecompressionSessionServerStartXPC();
}

uint64_t VTVideoCodecService_ShouldUseSeparateCodecProcessForEncode()
{
  return _VTVideoCodecService_ShouldUseSeparateCodecProcessForEncode();
}

uint64_t _os_log_send_and_compose_impl()
{
  return __os_log_send_and_compose_impl();
}

uint64_t _set_user_dir_suffix()
{
  return __set_user_dir_suffix();
}

void dispatch_main(void)
{
}

uint64_t fig_log_call_emit_and_clean_up_after_send_and_compose()
{
  return _fig_log_call_emit_and_clean_up_after_send_and_compose();
}

uint64_t fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type()
{
  return _fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
}

pid_t getpid(void)
{
  return _getpid();
}

uint64_t kdebug_trace()
{
  return _kdebug_trace();
}

uint64_t memorystatus_control()
{
  return _memorystatus_control();
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}