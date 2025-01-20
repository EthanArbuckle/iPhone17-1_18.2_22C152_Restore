@interface TUIInstantiateContextSnapshot
- (TUIInstantiateContextSnapshot)initWithContextSnapshot:(shared_ptr<const TUI::Evaluation::Context::Snapshot>)a3;
- (id).cxx_construct;
- (shared_ptr<const)contextSnapshot;
@end

@implementation TUIInstantiateContextSnapshot

- (TUIInstantiateContextSnapshot)initWithContextSnapshot:(shared_ptr<const TUI::Evaluation::Context::Snapshot>)a3
{
  ptr = a3.__ptr_;
  v10.receiver = self;
  v10.super_class = (Class)TUIInstantiateContextSnapshot;
  v4 = [(TUIInstantiateContextSnapshot *)&v10 init];
  v5 = v4;
  if (v4)
  {
    v7 = *(Snapshot **)ptr;
    uint64_t v6 = *((void *)ptr + 1);
    if (v6) {
      atomic_fetch_add_explicit((atomic_ullong *volatile)(v6 + 8), 1uLL, memory_order_relaxed);
    }
    cntrl = (std::__shared_weak_count *)v4->_contextSnapshot.__cntrl_;
    v5->_contextSnapshot.__ptr_ = v7;
    v5->_contextSnapshot.__cntrl_ = (__shared_weak_count *)v6;
    if (cntrl) {
      sub_123E4(cntrl);
    }
  }
  return v5;
}

- (shared_ptr<const)contextSnapshot
{
  cntrl = self->_contextSnapshot.__cntrl_;
  *v2 = self->_contextSnapshot.__ptr_;
  v2[1] = (Snapshot *)cntrl;
  if (cntrl) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)cntrl + 1, 1uLL, memory_order_relaxed);
  }
  result.__cntrl_ = (__shared_weak_count *)a2;
  result.__ptr_ = (Snapshot *)self;
  return result;
}

- (void).cxx_destruct
{
  cntrl = self->_contextSnapshot.__cntrl_;
  if (cntrl) {
    sub_123E4((std::__shared_weak_count *)cntrl);
  }
}

- (id).cxx_construct
{
  *((void *)self + 1) = 0;
  *((void *)self + 2) = 0;
  return self;
}

@end