@interface _TUIElementWithClosure
- ($738B17BD11CC339B30296C0EA03CEC2B)node;
- (Ref<TUI::Evaluation::Variables::_NamedElement>)ref;
- (_TUIElementWithClosure)initWithParsedElement:(id)a3 closureAndCapture:()pair<TUIClosure;
- (_TUIElementWithClosure)initWithRef:(Ref<TUI:(void *)a4 :Evaluation::Variables::_NamedElement>)a3 context:;
- (id).cxx_construct;
- (id)parsedElement;
- (pair<TUIClosure,)closureAndCapture;
@end

@implementation _TUIElementWithClosure

- (_TUIElementWithClosure)initWithRef:(Ref<TUI:(void *)a4 :Evaluation::Variables::_NamedElement>)a3 context:
{
  unint64_t index = a3._index;
  resolver = a3._resolver;
  v14.receiver = self;
  v14.super_class = (Class)_TUIElementWithClosure;
  v6 = [(_TUIElementWithClosure *)&v14 init];
  v7 = v6;
  if (v6)
  {
    v6->_ref._resolver = resolver;
    v6->_ref._unint64_t index = index;
    uint64_t v8 = (*(uint64_t (**)(RefResolving *, unint64_t))(*(void *)resolver + 72))(resolver, index);
    objc_storeStrong((id *)&v7->_element._parsedElement, *(id *)v8);
    v7->_element.var0.unint64_t index = *(_DWORD *)(v8 + 8);
    (*(void (**)(uint64_t *__return_ptr, RefResolving *, unint64_t))(*(void *)resolver + 112))(&v12, resolver, index);
    v7->_closureAndCapture.first.unint64_t index = v12;
    shared_ptr<const TUI::Evaluation::Variables::Capture> v9 = v13;
    shared_ptr<const TUI::Evaluation::Variables::Capture> v13 = (shared_ptr<const TUI::Evaluation::Variables::Capture>)0;
    cntrl = (std::__shared_weak_count *)v7->_closureAndCapture.second.__cntrl_;
    v7->_closureAndCapture.second = v9;
    if (cntrl)
    {
      sub_123E4(cntrl);
      if (v13.__cntrl_) {
        sub_123E4((std::__shared_weak_count *)v13.__cntrl_);
      }
    }
  }
  return v7;
}

- (_TUIElementWithClosure)initWithParsedElement:(id)a3 closureAndCapture:()pair<TUIClosure
{
  id v7 = a3;
  v12.receiver = self;
  v12.super_class = (Class)_TUIElementWithClosure;
  uint64_t v8 = [(_TUIElementWithClosure *)&v12 init];
  shared_ptr<const TUI::Evaluation::Variables::Capture> v9 = v8;
  if (v8)
  {
    int v10 = TUIElementNodeNil;
    objc_storeStrong((id *)&v8->_element._parsedElement, a3);
    v9->_element.var0.unint64_t index = v10;
    sub_42AA4((uint64_t)&v9->_closureAndCapture, (uint64_t)a4);
  }

  return v9;
}

- (id)parsedElement
{
  return self->_element._parsedElement;
}

- ($738B17BD11CC339B30296C0EA03CEC2B)node
{
  return ($738B17BD11CC339B30296C0EA03CEC2B)self->_element.var0.index;
}

- (pair<TUIClosure,)closureAndCapture
{
  retstr->first.unint64_t index = self[1].second.__cntrl_;
  ptr = self[2].second.__ptr_;
  retstr->second.__ptr_ = *(Capture **)&self[2].first.index;
  retstr->second.__cntrl_ = (__shared_weak_count *)ptr;
  if (ptr) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)ptr + 1, 1uLL, memory_order_relaxed);
  }
  return self;
}

- (Ref<TUI::Evaluation::Variables::_NamedElement>)ref
{
  unint64_t index = self->_ref._index;
  resolver = self->_ref._resolver;
  result._unint64_t index = index;
  result._resolver = resolver;
  return result;
}

- (void).cxx_destruct
{
  cntrl = self->_closureAndCapture.second.__cntrl_;
  if (cntrl) {
    sub_123E4((std::__shared_weak_count *)cntrl);
  }
  parsedElement = self->_element._parsedElement;
}

- (id).cxx_construct
{
  *((void *)self + 1) = 0;
  *((_DWORD *)self + 4) = TUIElementNodeNil;
  *((void *)self + 3) = 0;
  *((void *)self + 4) = -1;
  *((_DWORD *)self + 10) = 0;
  *((void *)self + 6) = 0;
  *((void *)self + 7) = 0;
  return self;
}

@end