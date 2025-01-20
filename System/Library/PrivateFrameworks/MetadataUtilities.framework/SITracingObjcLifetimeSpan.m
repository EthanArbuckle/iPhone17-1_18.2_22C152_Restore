@interface SITracingObjcLifetimeSpan
- (id)init:(SITracingSpan *)a3 kind:(char)a4 what:(const char *)a5;
- (void)dealloc;
@end

@implementation SITracingObjcLifetimeSpan

- (id)init:(SITracingSpan *)a3 kind:(char)a4 what:(const char *)a5
{
  unint64_t traceid = a3->traceid;
  unint64_t add_explicit = atomic_fetch_add_explicit(&next_spanid, 1uLL, memory_order_relaxed);
  self->_mySpan.unint64_t traceid = traceid;
  self->_mySpan.spanid = add_explicit + 1;
  self->_mySpan.parentid = a3->spanid;
  self->_mySpan.queryid = a3->queryid;
  self->_mySpan.kind = a4;
  self->_mySpan.what = (char *)a5;
  if (init_once != -1) {
    dispatch_once(&init_once, &__block_literal_global_1);
  }
  return self;
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  if (self->_mySpan.traceid && init_once != -1) {
    dispatch_once(&init_once, &__block_literal_global_1);
  }
  v3.receiver = self;
  v3.super_class = (Class)SITracingObjcLifetimeSpan;
  [(SITracingObjcLifetimeSpan *)&v3 dealloc];
}

@end