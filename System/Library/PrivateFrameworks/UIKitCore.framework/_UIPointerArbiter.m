@interface _UIPointerArbiter
+ (id)sharedArbiter;
- (_UIPointerArbiter)init;
- (id)obtainPointerUpdatePauseAssertion;
- (int64_t)pointerState;
- (void)applyStyle:(id)a3 forRegion:(id)a4 effectSourceHandler:(id)a5 completion:(id)a6;
- (void)beginScrollingWithRegion:(id)a3;
- (void)endScrollingWithRegion:(id)a3;
- (void)exitRegion:(id)a3 removeStyle:(BOOL)a4 completion:(id)a5;
@end

@implementation _UIPointerArbiter

+ (id)sharedArbiter
{
  if (_MergedGlobals_1157 != -1) {
    dispatch_once(&_MergedGlobals_1157, &__block_literal_global_384);
  }
  v2 = (void *)qword_1EB261DE0;
  return v2;
}

- (_UIPointerArbiter)init
{
  v6.receiver = self;
  v6.super_class = (Class)_UIPointerArbiter;
  v2 = [(_UIPointerArbiter *)&v6 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    core = v2->_core;
    v2->_core = (_UIPointerArbitrating *)v3;
  }
  return v2;
}

- (void)applyStyle:(id)a3 forRegion:(id)a4 effectSourceHandler:(id)a5 completion:(id)a6
{
}

- (void)exitRegion:(id)a3 removeStyle:(BOOL)a4 completion:(id)a5
{
}

- (int64_t)pointerState
{
  return [(_UIPointerArbitrating *)self->_core pointerState];
}

- (void)beginScrollingWithRegion:(id)a3
{
}

- (void)endScrollingWithRegion:(id)a3
{
}

- (id)obtainPointerUpdatePauseAssertion
{
  return (id)[(_UIPointerArbitrating *)self->_core obtainPointerUpdatePauseAssertion];
}

- (void).cxx_destruct
{
}

@end