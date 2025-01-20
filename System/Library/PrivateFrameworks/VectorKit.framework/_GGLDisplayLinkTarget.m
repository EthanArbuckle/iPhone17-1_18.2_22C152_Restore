@interface _GGLDisplayLinkTarget
- (_GGLDisplayLinkTarget)initWithCallbacker:(weak_ptr<ggl::RunLoop::_RunLoopCallbacker>)a3;
- (id).cxx_construct;
- (void)displayLinkFired:(id)a3;
@end

@implementation _GGLDisplayLinkTarget

- (void)displayLinkFired:(id)a3
{
  id v8 = a3;
  cntrl = self->_callbacker.__cntrl_;
  if (cntrl)
  {
    v5 = std::__shared_weak_count::lock((std::__shared_weak_count *)cntrl);
    if (v5)
    {
      v6 = v5;
      ptr = self->_callbacker.__ptr_;
      if (ptr)
      {
        [v8 targetTimestamp];
        (*(void (**)(void))(**(void **)ptr + 40))();
        (*(void (**)(void))(**(void **)ptr + 24))();
      }
      if (!atomic_fetch_add(&v6->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
      {
        ((void (*)(std::__shared_weak_count *))v6->__on_zero_shared)(v6);
        std::__shared_weak_count::__release_weak(v6);
      }
    }
  }
}

- (id).cxx_construct
{
  *((void *)self + 1) = 0;
  *((void *)self + 2) = 0;
  return self;
}

- (_GGLDisplayLinkTarget)initWithCallbacker:(weak_ptr<ggl::RunLoop::_RunLoopCallbacker>)a3
{
  ptr = a3.__ptr_;
  v11.receiver = self;
  v11.super_class = (Class)_GGLDisplayLinkTarget;
  v4 = [(_GGLDisplayLinkTarget *)&v11 init];
  v5 = v4;
  if (v4)
  {
    v7 = *(_RunLoopCallbacker **)ptr;
    uint64_t v6 = *((void *)ptr + 1);
    if (v6) {
      atomic_fetch_add_explicit((atomic_ullong *volatile)(v6 + 16), 1uLL, memory_order_relaxed);
    }
    cntrl = (std::__shared_weak_count *)v4->_callbacker.__cntrl_;
    v5->_callbacker.__ptr_ = v7;
    v5->_callbacker.__cntrl_ = (__shared_weak_count *)v6;
    if (cntrl) {
      std::__shared_weak_count::__release_weak(cntrl);
    }
    v9 = v5;
  }

  return v5;
}

- (void).cxx_destruct
{
  cntrl = self->_callbacker.__cntrl_;
  if (cntrl) {
    std::__shared_weak_count::__release_weak((std::__shared_weak_count *)cntrl);
  }
}

@end