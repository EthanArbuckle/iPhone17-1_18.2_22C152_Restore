@interface PDRSignposts
+ (id)instance;
- (OS_os_log)traceLog;
- (PDRSignposts)init;
- (os_unfair_lock_s)lock;
- (unint64_t)intervalStart;
- (void)beginFetchIntervalTrace;
- (void)cancelFetchIntervalTrace;
- (void)endFetchIntervalTrace;
- (void)setIntervalStart:(unint64_t)a3;
- (void)setLock:(os_unfair_lock_s)a3;
- (void)setTraceLog:(id)a3;
@end

@implementation PDRSignposts

- (PDRSignposts)init
{
  v5.receiver = self;
  v5.super_class = (Class)PDRSignposts;
  v2 = [(PDRSignposts *)&v5 init];
  if (v2)
  {
    if (os_variant_has_internal_diagnostics())
    {
      os_log_t v3 = os_log_create("com.apple.watch.nanoregistry.trace", "signposts");
      [(PDRSignposts *)v2 setTraceLog:v3];
    }
    [(PDRSignposts *)v2 setIntervalStart:0];
    [(PDRSignposts *)v2 setLock:0];
  }
  return v2;
}

+ (id)instance
{
  if (instance_onceToken != -1) {
    dispatch_once(&instance_onceToken, &__block_literal_global_0);
  }
  v2 = (void *)instance_instance;
  return v2;
}

uint64_t __24__PDRSignposts_instance__block_invoke()
{
  instance_instance = objc_alloc_init(PDRSignposts);
  return MEMORY[0x270F9A758]();
}

- (void)beginFetchIntervalTrace
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  uint64_t v4 = [(PDRSignposts *)self traceLog];
  if (v4)
  {
    objc_super v5 = (void *)v4;
    unint64_t v6 = [(PDRSignposts *)self intervalStart];

    if (!v6) {
      [(PDRSignposts *)self setIntervalStart:mach_continuous_time()];
    }
  }
  os_unfair_lock_unlock(p_lock);
}

- (void)endFetchIntervalTrace
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  uint64_t v4 = [(PDRSignposts *)self traceLog];
  if (v4)
  {
    objc_super v5 = (void *)v4;
    unint64_t v6 = [(PDRSignposts *)self intervalStart];

    if (v6)
    {
      v7 = [(PDRSignposts *)self traceLog];
      if (os_signpost_enabled(v7))
      {
        int v8 = 134349056;
        unint64_t v9 = [(PDRSignposts *)self intervalStart];
        _os_signpost_emit_with_name_impl(&dword_258700000, v7, OS_SIGNPOST_EVENT, 0xB8AB62A7B18D7940, "nanoregistry.pdr.slowFetch", "%{public, signpost.description:begin_time}llu", (uint8_t *)&v8, 0xCu);
      }
    }
  }
  [(PDRSignposts *)self setIntervalStart:0];
  os_unfair_lock_unlock(p_lock);
}

- (void)cancelFetchIntervalTrace
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  [(PDRSignposts *)self setIntervalStart:0];
  os_unfair_lock_unlock(p_lock);
}

- (OS_os_log)traceLog
{
  return self->_traceLog;
}

- (void)setTraceLog:(id)a3
{
}

- (unint64_t)intervalStart
{
  return self->_intervalStart;
}

- (void)setIntervalStart:(unint64_t)a3
{
  self->_intervalStart = a3;
}

- (os_unfair_lock_s)lock
{
  return self->_lock;
}

- (void)setLock:(os_unfair_lock_s)a3
{
  self->_lock = a3;
}

- (void).cxx_destruct
{
}

@end