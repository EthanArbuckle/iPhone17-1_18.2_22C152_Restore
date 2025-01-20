@interface NFMemoryObserver
- (void)start;
- (void)stop;
@end

@implementation NFMemoryObserver

- (void)start
{
  v3 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E4F14468], 0, 7uLL, MEMORY[0x1E4F14428]);
  source = self->_source;
  self->_source = v3;

  v5 = self->_source;
  handler[0] = MEMORY[0x1E4F143A8];
  handler[1] = 3221225472;
  handler[2] = __25__NFMemoryObserver_start__block_invoke;
  handler[3] = &unk_1E65ABE00;
  handler[4] = self;
  dispatch_source_set_event_handler(v5, handler);
  dispatch_resume((dispatch_object_t)self->_source);
}

void __25__NFMemoryObserver_start__block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if (dispatch_source_get_data(*(dispatch_source_t *)(*(void *)(a1 + 32) + 8)) == 4)
  {
    v1 = kNFLOG_DISPATCH_SPECIFIC_KEY;
    specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    if ((unint64_t)specific >= 4) {
      __assert_rtn("NFLogGetLogger", "NFSharedLog.c", 216, "category < NFLogCategoryMax");
    }
    v3 = (void (*)(uint64_t, const char *, ...))*(&_NFLogCustomLoggers + (void)specific);
    if (v3)
    {
      v3(4, "%s:%i Memory Pressure Critical - Jetsam?", "-[NFMemoryObserver start]_block_invoke", 39);
      v1 = kNFLOG_DISPATCH_SPECIFIC_KEY;
    }
    v4 = dispatch_get_specific(v1);
    if (NFSharedLogInitialize_onceToken != -1) {
      dispatch_once(&NFSharedLogInitialize_onceToken, &__block_literal_global_3);
    }
    v5 = (id)_NFSharedLogClient[(void)v4];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      v7 = "-[NFMemoryObserver start]_block_invoke";
      __int16 v8 = 1024;
      int v9 = 39;
      _os_log_impl(&dword_1CA51A000, v5, OS_LOG_TYPE_ERROR, "%{public}s:%i Memory Pressure Critical - Jetsam?", buf, 0x12u);
    }
  }
}

- (void)stop
{
}

- (void).cxx_destruct
{
}

@end