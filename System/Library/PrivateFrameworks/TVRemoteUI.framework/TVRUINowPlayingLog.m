@interface TVRUINowPlayingLog
@end

@implementation TVRUINowPlayingLog

uint64_t ___TVRUINowPlayingLog_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.TVRemoteUI", "NowPlaying");
  uint64_t v1 = _TVRUINowPlayingLog_log;
  _TVRUINowPlayingLog_log = (uint64_t)v0;
  return MEMORY[0x270F9A758](v0, v1);
}

@end