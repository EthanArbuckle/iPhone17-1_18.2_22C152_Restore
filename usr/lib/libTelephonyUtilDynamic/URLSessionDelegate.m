@interface URLSessionDelegate
- (id).cxx_construct;
- (shared_ptr<SessionTaskContext>)getContext:(int64_t)a3;
- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveData:(id)a5;
- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveResponse:(id)a5 completionHandler:(id)a6;
- (void)URLSession:(id)a3 task:(id)a4 didCompleteWithError:(id)a5;
- (void)URLSession:(id)a3 task:(id)a4 didReceiveChallenge:(id)a5 completionHandler:(id)a6;
- (void)URLSession:(id)a3 task:(id)a4 didSendBodyData:(int64_t)a5 totalBytesSent:(int64_t)a6 totalBytesExpectedToSend:(int64_t)a7;
- (void)URLSession:(id)a3 task:(id)a4 willPerformHTTPRedirection:(id)a5 newRequest:(id)a6 completionHandler:(id)a7;
- (void)addCallbackHandler:(shared_ptr<ctu:(int64_t)a4 :Http::HttpRequestCallbackHandler>)a3 for:;
- (void)dealloc;
- (void)removeCallbackFor:(int64_t)a3;
@end

@implementation URLSessionDelegate

- (void)addCallbackHandler:(shared_ptr<ctu:(int64_t)a4 :Http::HttpRequestCallbackHandler>)a3 for:
{
  var1 = a3.var1;
  var0 = a3.var0;
  v7 = (std::__shared_weak_count_vtbl *)operator new(0x30uLL);
  v8 = v7;
  v9 = *(void (__cdecl **)(std::__shared_weak_count *__hidden))var0;
  v10 = (std::__shared_weak_count *)*((void *)var0 + 1);
  if (v10)
  {
    atomic_fetch_add_explicit(&v10->__shared_weak_owners_, 1uLL, memory_order_relaxed);
    v7->~__shared_weak_count = v9;
    v7->~__shared_weak_count_0 = (void (__cdecl *)(std::__shared_weak_count *__hidden))v10;
    atomic_fetch_add_explicit(&v10->__shared_weak_owners_, 1uLL, memory_order_relaxed);
  }
  else
  {
    v7->~__shared_weak_count = v9;
    v7->~__shared_weak_count_0 = 0;
  }
  v7->__on_zero_shared_weak = 0;
  v7[1].~__shared_weak_count = 0;
  v7->__on_zero_shared = (void (__cdecl *)(std::__shared_count *__hidden))objc_opt_new();
  v8->__get_deleter = (const void *(__cdecl *)(const std::__shared_weak_count *__hidden, const std::type_info *))objc_opt_new();
  v11 = (std::__shared_weak_count *)operator new(0x20uLL);
  v11->__shared_owners_ = 0;
  v11->__vftable = (std::__shared_weak_count_vtbl *)&unk_1EE2F8C38;
  v11->__shared_weak_owners_ = 0;
  v11[1].__vftable = v8;
  if (v10) {
    std::__shared_weak_count::__release_weak(v10);
  }
  atomic_fetch_add_explicit(&v11->__shared_owners_, 1uLL, memory_order_relaxed);
  p_pair1 = &self->fTaskHandlers.__tree_.__pair1_;
  left = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned long, std::shared_ptr<SessionTaskContext>>, void *>>> *)self->fTaskHandlers.__tree_.__pair1_.__value_.__left_;
  if (left)
  {
    while (1)
    {
      while (1)
      {
        v14 = left;
        unint64_t v15 = (unint64_t)left[4].__value_.__left_;
        if (v15 <= (unint64_t)var1) {
          break;
        }
        left = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned long, std::shared_ptr<SessionTaskContext>>, void *>>> *)v14->__value_.__left_;
        p_pair1 = v14;
        if (!v14->__value_.__left_) {
          goto LABEL_14;
        }
      }
      if (v15 >= (unint64_t)var1) {
        break;
      }
      left = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned long, std::shared_ptr<SessionTaskContext>>, void *>>> *)v14[1].__value_.__left_;
      if (!left)
      {
        p_pair1 = v14 + 1;
        goto LABEL_14;
      }
    }
    std::__shared_weak_count::__release_shared[abi:ne180100](v11);
  }
  else
  {
    v14 = &self->fTaskHandlers.__tree_.__pair1_;
LABEL_14:
    v16 = (uint64_t *)operator new(0x38uLL);
    v16[4] = (uint64_t)var1;
    v16[5] = (uint64_t)v8;
    v16[6] = (uint64_t)v11;
    uint64_t *v16 = 0;
    v16[1] = 0;
    v16[2] = (uint64_t)v14;
    p_pair1->__value_.__left_ = v16;
    v17 = *(void **)self->fTaskHandlers.__tree_.__begin_node_;
    if (v17)
    {
      self->fTaskHandlers.__tree_.__begin_node_ = v17;
      v16 = (uint64_t *)p_pair1->__value_.__left_;
    }
    std::__tree_balance_after_insert[abi:ne180100]<std::__tree_node_base<void *> *>((uint64_t *)self->fTaskHandlers.__tree_.__pair1_.__value_.__left_, v16);
    ++self->fTaskHandlers.__tree_.__pair3_.__value_;
  }

  std::__shared_weak_count::__release_shared[abi:ne180100](v11);
}

- (void)removeCallbackFor:(int64_t)a3
{
  left = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned long, std::shared_ptr<SessionTaskContext>>, void *>>> *)self->fTaskHandlers.__tree_.__pair1_.__value_.__left_;
  if (!left) {
    return;
  }
  p_pair1 = &self->fTaskHandlers.__tree_.__pair1_;
  v5 = (char *)self->fTaskHandlers.__tree_.__pair1_.__value_.__left_;
  do
  {
    unint64_t v6 = *((void *)v5 + 4);
    BOOL v7 = v6 >= a3;
    if (v6 >= a3) {
      v8 = (char **)v5;
    }
    else {
      v8 = (char **)(v5 + 8);
    }
    if (v7) {
      p_pair1 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned long, std::shared_ptr<SessionTaskContext>>, void *>>> *)v5;
    }
    v5 = *v8;
  }
  while (*v8);
  if (p_pair1 == &self->fTaskHandlers.__tree_.__pair1_ || p_pair1[4].__value_.__left_ > (void *)a3) {
    return;
  }
  v9 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned long, std::shared_ptr<SessionTaskContext>>, void *>>> *)p_pair1[1].__value_.__left_;
  if (v9)
  {
    do
    {
      v10 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned long, std::shared_ptr<SessionTaskContext>>, void *>>> **)v9;
      v9 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned long, std::shared_ptr<SessionTaskContext>>, void *>>> *)v9->__value_.__left_;
    }
    while (v9);
  }
  else
  {
    v11 = p_pair1;
    do
    {
      v10 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned long, std::shared_ptr<SessionTaskContext>>, void *>>> **)v11[2].__value_.__left_;
      BOOL v31 = *v10 == v11;
      v11 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned long, std::shared_ptr<SessionTaskContext>>, void *>>> *)v10;
    }
    while (!v31);
  }
  if (self->fTaskHandlers.__tree_.__begin_node_ == p_pair1) {
    self->fTaskHandlers.__tree_.__begin_node_ = v10;
  }
  --self->fTaskHandlers.__tree_.__pair3_.__value_;
  v12 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned long, std::shared_ptr<SessionTaskContext>>, void *>>> *)p_pair1->__value_.__left_;
  v13 = p_pair1;
  if (p_pair1->__value_.__left_)
  {
    v14 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned long, std::shared_ptr<SessionTaskContext>>, void *>>> *)p_pair1[1].__value_.__left_;
    if (!v14)
    {
      v13 = p_pair1;
      goto LABEL_27;
    }
    do
    {
      v13 = v14;
      v14 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned long, std::shared_ptr<SessionTaskContext>>, void *>>> *)v14->__value_.__left_;
    }
    while (v14);
  }
  v12 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned long, std::shared_ptr<SessionTaskContext>>, void *>>> *)v13[1].__value_.__left_;
  if (v12)
  {
LABEL_27:
    int v15 = 0;
    v12[2].__value_.__left_ = v13[2].__value_.__left_;
    goto LABEL_28;
  }
  int v15 = 1;
LABEL_28:
  v16 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned long, std::shared_ptr<SessionTaskContext>>, void *>>> **)v13[2].__value_.__left_;
  v17 = *v16;
  if (*v16 == v13)
  {
    uint64_t *v16 = v12;
    if (v13 == left)
    {
      v17 = 0;
      left = v12;
    }
    else
    {
      v17 = v16[1];
    }
  }
  else
  {
    v16[1] = v12;
  }
  int left_low = LOBYTE(v13[3].__value_.__left_);
  if (v13 != p_pair1)
  {
    v19 = p_pair1[2].__value_.__left_;
    v13[2].__value_.__left_ = v19;
    *((void *)v19 + (*(void *)p_pair1[2].__value_.__left_ != (void)p_pair1)) = v13;
    v21 = p_pair1->__value_.__left_;
    v20 = p_pair1[1].__value_.__left_;
    v21[2] = v13;
    v13->__value_.__left_ = v21;
    v13[1].__value_.__left_ = v20;
    if (v20) {
      *((void *)v20 + 2) = v13;
    }
    LOBYTE(v13[3].__value_.__left_) = p_pair1[3].__value_.__left_;
    if (left == p_pair1) {
      left = v13;
    }
  }
  if (!left_low || !left) {
    goto LABEL_92;
  }
  if (!v15)
  {
    LOBYTE(v12[3].__value_.__left_) = 1;
    goto LABEL_92;
  }
  while (1)
  {
    v22 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned long, std::shared_ptr<SessionTaskContext>>, void *>>> *)v17[2].__value_.__left_;
    if (v22->__value_.__left_ != v17) {
      break;
    }
    if (!LOBYTE(v17[3].__value_.__left_))
    {
      LOBYTE(v17[3].__value_.__left_) = 1;
      LOBYTE(v22[3].__value_.__left_) = 0;
      v28 = v17[1].__value_.__left_;
      v22->__value_.__left_ = v28;
      if (v28) {
        v28[2] = v22;
      }
      v17[2].__value_.__left_ = v22[2].__value_.__left_;
      *((void *)v22[2].__value_.__left_ + (*(void *)v22[2].__value_.__left_ != (void)v22)) = v17;
      v17[1].__value_.__left_ = v22;
      v22[2].__value_.__left_ = v17;
      if (left == v22) {
        left = v17;
      }
      v17 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned long, std::shared_ptr<SessionTaskContext>>, void *>>> *)v22->__value_.__left_;
    }
    v29 = v17->__value_.__left_;
    if (v17->__value_.__left_ && !v29[24]) {
      goto LABEL_87;
    }
    v30 = (uint64_t *)v17[1].__value_.__left_;
    if (v30 && !*((unsigned char *)v30 + 24))
    {
      if (v29 && !v29[24])
      {
LABEL_87:
        v30 = (uint64_t *)v17;
      }
      else
      {
        *((unsigned char *)v30 + 24) = 1;
        LOBYTE(v17[3].__value_.__left_) = 0;
        uint64_t v36 = *v30;
        v17[1].__value_.__left_ = (void *)*v30;
        if (v36) {
          *(void *)(v36 + 16) = v17;
        }
        v30[2] = (uint64_t)v17[2].__value_.__left_;
        *((void *)v17[2].__value_.__left_ + (*(void *)v17[2].__value_.__left_ != (void)v17)) = v30;
        uint64_t *v30 = (uint64_t)v17;
        v17[2].__value_.__left_ = v30;
        v29 = v17;
      }
      uint64_t v33 = v30[2];
      *((unsigned char *)v30 + 24) = *(unsigned char *)(v33 + 24);
      *(unsigned char *)(v33 + 24) = 1;
      v29[24] = 1;
      v34 = *(uint64_t **)v33;
      uint64_t v37 = *(void *)(*(void *)v33 + 8);
      *(void *)uint64_t v33 = v37;
      if (v37) {
        *(void *)(v37 + 16) = v33;
      }
      v34[2] = *(void *)(v33 + 16);
      *(void *)(*(void *)(v33 + 16) + 8 * (**(void **)(v33 + 16) != v33)) = v34;
      v34[1] = v33;
      goto LABEL_91;
    }
    LOBYTE(v17[3].__value_.__left_) = 0;
    v27 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned long, std::shared_ptr<SessionTaskContext>>, void *>>> *)v17[2].__value_.__left_;
    if (LOBYTE(v27[3].__value_.__left_)) {
      BOOL v31 = v27 == left;
    }
    else {
      BOOL v31 = 1;
    }
    if (v31) {
      goto LABEL_72;
    }
LABEL_69:
    v17 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned long, std::shared_ptr<SessionTaskContext>>, void *>>> *)*((void *)v27[2].__value_.__left_ + (*(void *)v27[2].__value_.__left_ == (void)v27));
  }
  if (!LOBYTE(v17[3].__value_.__left_))
  {
    LOBYTE(v17[3].__value_.__left_) = 1;
    LOBYTE(v22[3].__value_.__left_) = 0;
    v23 = (uint64_t *)v22[1].__value_.__left_;
    uint64_t v24 = *v23;
    v22[1].__value_.__left_ = (void *)*v23;
    if (v24) {
      *(void *)(v24 + 16) = v22;
    }
    v23[2] = (uint64_t)v22[2].__value_.__left_;
    *((void *)v22[2].__value_.__left_ + (*(void *)v22[2].__value_.__left_ != (void)v22)) = v23;
    uint64_t *v23 = (uint64_t)v22;
    v22[2].__value_.__left_ = v23;
    if (left == v17->__value_.__left_) {
      left = v17;
    }
    v17 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned long, std::shared_ptr<SessionTaskContext>>, void *>>> *)*((void *)v17->__value_.__left_ + 1);
  }
  v25.__value_.__left_ = v17->__value_.__left_;
  if (!v17->__value_.__left_ || *((unsigned char *)v25.__value_.__left_ + 24))
  {
    v26 = v17[1].__value_.__left_;
    if (v26 && !v26[24]) {
      goto LABEL_78;
    }
    LOBYTE(v17[3].__value_.__left_) = 0;
    v27 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned long, std::shared_ptr<SessionTaskContext>>, void *>>> *)v17[2].__value_.__left_;
    if (v27 == left)
    {
      v27 = left;
LABEL_72:
      LOBYTE(v27[3].__value_.__left_) = 1;
      goto LABEL_92;
    }
    if (!LOBYTE(v27[3].__value_.__left_)) {
      goto LABEL_72;
    }
    goto LABEL_69;
  }
  v26 = v17[1].__value_.__left_;
  if (v26 && !v26[24])
  {
LABEL_78:
    v25.__value_.__left_ = v17;
  }
  else
  {
    *((unsigned char *)v25.__value_.__left_ + 24) = 1;
    LOBYTE(v17[3].__value_.__left_) = 0;
    v32 = (void *)*((void *)v25.__value_.__left_ + 1);
    v17->__value_.__left_ = v32;
    if (v32) {
      v32[2] = v17;
    }
    *((__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned long, std::shared_ptr<SessionTaskContext>>, void *>>> *)v25.__value_.__left_
    + 2) = v17[2];
    *((__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned long, std::shared_ptr<SessionTaskContext>>, void *>>> *)v17[2].__value_.__left_
    + (*(void *)v17[2].__value_.__left_ != (void)v17)) = v25;
    *((void *)v25.__value_.__left_ + 1) = v17;
    v17[2].__value_.__left_ = v25.__value_.__left_;
    v26 = v17;
  }
  uint64_t v33 = *((void *)v25.__value_.__left_ + 2);
  *((unsigned char *)v25.__value_.__left_ + 24) = *(unsigned char *)(v33 + 24);
  *(unsigned char *)(v33 + 24) = 1;
  v26[24] = 1;
  v34 = *(uint64_t **)(v33 + 8);
  uint64_t v35 = *v34;
  *(void *)(v33 + 8) = *v34;
  if (v35) {
    *(void *)(v35 + 16) = v33;
  }
  v34[2] = *(void *)(v33 + 16);
  *(void *)(*(void *)(v33 + 16) + 8 * (**(void **)(v33 + 16) != v33)) = v34;
  uint64_t *v34 = v33;
LABEL_91:
  *(void *)(v33 + 16) = v34;
LABEL_92:
  v38 = (std::__shared_weak_count *)p_pair1[6].__value_.__left_;
  if (v38) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v38);
  }

  operator delete(p_pair1);
}

- (void)dealloc
{
  p_pair1 = &self->fTaskHandlers.__tree_.__pair1_;
  std::__tree<std::__value_type<unsigned long,std::shared_ptr<SessionTaskContext>>,std::__map_value_compare<unsigned long,std::__value_type<unsigned long,std::shared_ptr<SessionTaskContext>>,std::less<unsigned long>,true>,std::allocator<std::__value_type<unsigned long,std::shared_ptr<SessionTaskContext>>>>::destroy((void *)self->fTaskHandlers.__tree_.__pair1_.__value_.__left_);
  self->fTaskHandlers.__tree_.__begin_node_ = p_pair1;
  self->fTaskHandlers.__tree_.__pair3_.__value_ = 0;
  p_pair1->__value_.__left_ = 0;
  v4.receiver = self;
  v4.super_class = (Class)URLSessionDelegate;
  [(URLSessionDelegate *)&v4 dealloc];
}

- (shared_ptr<SessionTaskContext>)getContext:(int64_t)a3
{
  left = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned long, std::shared_ptr<SessionTaskContext>>, void *>>> *)self->fTaskHandlers.__tree_.__pair1_.__value_.__left_;
  p_pair1 = &self->fTaskHandlers.__tree_.__pair1_;
  v5 = left;
  if (!left) {
    goto LABEL_12;
  }
  BOOL v7 = p_pair1;
  do
  {
    unint64_t v8 = (unint64_t)v5[4].__value_.__left_;
    BOOL v9 = v8 >= a3;
    if (v8 >= a3) {
      v10 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned long, std::shared_ptr<SessionTaskContext>>, void *>>> **)v5;
    }
    else {
      v10 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned long, std::shared_ptr<SessionTaskContext>>, void *>>> **)&v5[1];
    }
    if (v9) {
      BOOL v7 = v5;
    }
    v5 = *v10;
  }
  while (*v10);
  if (v7 != p_pair1 && v7[4].__value_.__left_ <= (void *)a3)
  {
    v12 = v7[5].__value_.__left_;
    v11 = (atomic_ullong *)v7[6].__value_.__left_;
    void *v3 = v12;
    v3[1] = v11;
    if (v11) {
      atomic_fetch_add_explicit(v11 + 1, 1uLL, memory_order_relaxed);
    }
  }
  else
  {
LABEL_12:
    void *v3 = 0;
    v3[1] = 0;
  }
  result.var1 = (__shared_weak_count *)a2;
  result.var0 = (SessionTaskContext *)p_pair1;
  return result;
}

- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveResponse:(id)a5 completionHandler:(id)a6
{
  v12 = (std::__shared_weak_count *)0xAAAAAAAAAAAAAAAALL;
  uint64_t v10 = [a4 taskIdentifier:a3];
  if (self)
  {
    [(URLSessionDelegate *)self getContext:v10];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v11 = (ctu::Http::HttpResponseConcrete *)operator new(0x68uLL);
      ctu::Http::HttpResponseConcrete::HttpResponseConcrete(v11, (NSHTTPURLResponse *)a5);
      *((_WORD *)v11 + 48) = [a4 _TLSNegotiatedCipherSuite];
      std::shared_ptr<ctu::Http::HttpResponse>::reset[abi:ne180100]<ctu::Http::HttpResponseConcrete,void>((void *)0xAAAAAAAAAAAAAACALL, (uint64_t)v11);
    }
  }
  else
  {
    v12 = 0;
  }
  (*((void (**)(id, uint64_t))a6 + 2))(a6, 1);
  if (v12) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v12);
  }
}

- (void)URLSession:(id)a3 task:(id)a4 didCompleteWithError:(id)a5
{
  uint64_t v24 = (void *)0xAAAAAAAAAAAAAAAALL;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned long, std::shared_ptr<SessionTaskContext>>, void *>>> v25 = (std::__shared_weak_count *)0xAAAAAAAAAAAAAAAALL;
  uint64_t v7 = [a4 taskIdentifier:a3];
  if (self)
  {
    [(URLSessionDelegate *)self getContext:v7];
    unint64_t v8 = (std::__shared_weak_count *)v24[1];
    if (v8)
    {
      BOOL v9 = std::__shared_weak_count::lock(v8);
      if (v9)
      {
        uint64_t v10 = v9;
        uint64_t v11 = *v24;
        if (*v24)
        {
          v12 = v24;
          v13 = (const void *)v24[4];
          if ((v13 {
             || (v14 = (ctu::Http::HttpResponseConcrete *)operator new(0x68uLL),
          }
                 ctu::Http::HttpResponseConcrete::HttpResponseConcrete(v14, 0),
          {
            v16 = v15;
            v17 = (std::__shared_weak_count *)v12[5];
            if (v17) {
              atomic_fetch_add_explicit(&v17->__shared_owners_, 1uLL, memory_order_relaxed);
            }
            if (a5)
            {
              v18 = (void *)[a5 domain];
              if ([v18 isEqualToString:*MEMORY[0x1E4F289A0]]
                && (uint64_t v19 = [a5 code], (unint64_t)(v19 + 1009) <= 9))
              {
                int v20 = *((_DWORD *)&unk_1920C0078 + v19 + 1009);
              }
              else
              {
                int v20 = 0;
              }
              *((_DWORD *)v16 + 2) = v20;
              v16[6] = (const void *)[a5 code];
              id v26 = a5;
              ctu::cf::CFSharedRef<__CFError>::operator=(v16 + 11, (CFTypeRef *)&v26);
            }
            else
            {
              id v26 = (id)v12[2];
              ctu::cf::CFSharedRef<__CFData const>::operator=(v15 + 10, (CFTypeRef *)&v26);
              *((_DWORD *)v16 + 2) = 1;
            }
          }
          else
          {
            v17 = 0;
          }
          v21 = (std::__shared_weak_count *)v24[5];
          uint64_t v22 = v24[4];
          v23 = v21;
          if (v21) {
            atomic_fetch_add_explicit(&v21->__shared_owners_, 1uLL, memory_order_relaxed);
          }
          (*(void (**)(uint64_t, uint64_t *))(*(void *)v11 + 16))(v11, &v22);
          if (v23) {
            std::__shared_weak_count::__release_shared[abi:ne180100](v23);
          }
          if (v17) {
            std::__shared_weak_count::__release_shared[abi:ne180100](v17);
          }
        }
        std::__shared_weak_count::__release_shared[abi:ne180100](v10);
      }
    }
  }
  else
  {
    uint64_t v24 = 0;
    __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned long, std::shared_ptr<SessionTaskContext>>, void *>>> v25 = 0;
  }
  if (v25) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v25);
  }
}

- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveData:(id)a5
{
  uint64_t v10 = (std::__shared_weak_count *)0xAAAAAAAAAAAAAAAALL;
  uint64_t v7 = [a4 taskIdentifier:a3];
  if (self)
  {
    [(URLSessionDelegate *)self getContext:v7];
    if (a5)
    {
      [MEMORY[0xAAAAAAAAAAAAAABA] appendData:a5];
      if (MEMORY[0xAAAAAAAAAAAAAAB2])
      {
        unint64_t v8 = std::__shared_weak_count::lock(MEMORY[0xAAAAAAAAAAAAAAB2]);
        if (v8)
        {
          BOOL v9 = v8;
          if (MEMORY[0xAAAAAAAAAAAAAAAA]) {
            (*(void (**)(void, uint64_t, uint64_t))(*MEMORY[0xAAAAAAAAAAAAAAAA] + 32))(MEMORY[0xAAAAAAAAAAAAAAAA], [a5 length], [MEMORY[0xAAAAAAAAAAAAAABA] length]);
          }
          std::__shared_weak_count::__release_shared[abi:ne180100](v9);
        }
      }
    }
  }
  else
  {
    uint64_t v10 = 0;
  }
  if (v10) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v10);
  }
}

- (void)URLSession:(id)a3 task:(id)a4 didSendBodyData:(int64_t)a5 totalBytesSent:(int64_t)a6 totalBytesExpectedToSend:(int64_t)a7
{
  v14 = (std::__shared_weak_count *)0xAAAAAAAAAAAAAAAALL;
  uint64_t v11 = [a4 taskIdentifier:a3];
  if (self)
  {
    [(URLSessionDelegate *)self getContext:v11];
    if (MEMORY[0xAAAAAAAAAAAAAAB2])
    {
      v12 = std::__shared_weak_count::lock(MEMORY[0xAAAAAAAAAAAAAAB2]);
      if (v12)
      {
        v13 = v12;
        if (MEMORY[0xAAAAAAAAAAAAAAAA]) {
          (*(void (**)(void, int64_t, int64_t, int64_t))(*MEMORY[0xAAAAAAAAAAAAAAAA]
        }
                                                                                         + 40))(MEMORY[0xAAAAAAAAAAAAAAAA], a5, a6, a7);
        std::__shared_weak_count::__release_shared[abi:ne180100](v13);
      }
    }
  }
  else
  {
    v14 = 0;
  }
  if (v14) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v14);
  }
}

- (void)URLSession:(id)a3 task:(id)a4 didReceiveChallenge:(id)a5 completionHandler:(id)a6
{
  theDict[1] = *(CFDictionaryRef *)MEMORY[0x1E4F143B8];
  v32 = (uint64_t *)0xAAAAAAAAAAAAAAAALL;
  uint64_t v33 = (std::__shared_weak_count *)0xAAAAAAAAAAAAAAAALL;
  uint64_t v9 = [a4 taskIdentifier:a3];
  if (!self)
  {
    Value = 0;
    v32 = 0;
    uint64_t v33 = 0;
LABEL_30:
    uint64_t v18 = 1;
    goto LABEL_31;
  }
  [(URLSessionDelegate *)self getContext:v9];
  uint64_t v10 = [objc_msgSend(a5, "protectionSpace") authenticationMethod];
  if (![v10 isEqualToString:*MEMORY[0x1E4F28968]])
  {
    if ([v10 isEqualToString:*MEMORY[0x1E4F28988]])
    {
      uint64_t v19 = (std::__shared_weak_count *)v32[1];
      if (v19)
      {
        int v20 = std::__shared_weak_count::lock(v19);
        if (v20)
        {
          v13 = v20;
          uint64_t v21 = *v32;
          if (*v32)
          {
            (*(void (**)(CFDictionaryRef *__return_ptr, uint64_t))(*(void *)v21 + 56))(theDict, v21);
            if (theDict[0]) {
              uint64_t v22 = ctu::SharedRef<__CFArray const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFArray const>::get;
            }
            else {
              uint64_t v22 = 0;
            }
            if (!v22)
            {
              ctu::SharedRef<__CFArray const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFArray const>::~SharedRef((const void **)theDict);
              goto LABEL_39;
            }
            (*(void (**)(CFArrayRef *__return_ptr, uint64_t))(*(void *)v21 + 56))(&theArray, v21);
            CFIndex Count = CFArrayGetCount(theArray);
            ctu::SharedRef<__CFArray const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFArray const>::~SharedRef((const void **)&theArray);
            ctu::SharedRef<__CFArray const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFArray const>::~SharedRef((const void **)theDict);
            if (Count)
            {
              uint64_t v24 = (__SecTrust *)[a5 protectionSpace].serverTrust;
              if ((*(uint64_t (**)(uint64_t, __SecTrust *))(*(void *)v21 + 64))(v21, v24))
              {
                (*(void (**)(CFDictionaryRef *__return_ptr, uint64_t))(*(void *)v21 + 56))(theDict, v21);
                OSStatus v25 = SecTrustSetAnchorCertificates(v24, theDict[0]);
                ctu::SharedRef<__CFArray const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFArray const>::~SharedRef((const void **)theDict);
                if (v25) {
                  goto LABEL_39;
                }
                LODWORD(theArray) = -1431655766;
                int v26 = MEMORY[0x192FECE10](v24, &theArray);
                if (v26)
                {
                  if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG)) {
                    goto LABEL_39;
                  }
                  LODWORD(theDict[0]) = 67109120;
                  HIDWORD(theDict[0]) = v26;
                  v27 = MEMORY[0x1E4F14500];
                  v28 = "Server pinned certs' trust evaluation failed due to STATUS code: %d";
                }
                else
                {
                  int v30 = (int)theArray;
                  if (theArray == 4 || theArray == 1)
                  {
                    Value = (const void *)[MEMORY[0x1E4F29098] credentialForTrust:[objc_msgSend((id)objc_msgSend(a5, "protectionSpace"), "serverTrust")]];
                    uint64_t v18 = 0;
                    goto LABEL_40;
                  }
                  if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG)) {
                    goto LABEL_39;
                  }
                  LODWORD(theDict[0]) = 67109120;
                  HIDWORD(theDict[0]) = v30;
                  v27 = MEMORY[0x1E4F14500];
                  v28 = "DEBUG: Server pinned certs' trust evaluation failed due to RESULT code: %u";
                }
                uint32_t v29 = 8;
              }
              else
              {
                if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG)) {
                  goto LABEL_39;
                }
                LOWORD(theDict[0]) = 0;
                v27 = MEMORY[0x1E4F14500];
                v28 = "DEBUG: Failed to validate certs.";
                uint32_t v29 = 2;
              }
              _os_log_debug_impl(&dword_192046000, v27, OS_LOG_TYPE_DEBUG, v28, (uint8_t *)theDict, v29);
            }
          }
LABEL_39:
          Value = 0;
          uint64_t v18 = 1;
          goto LABEL_40;
        }
      }
    }
    goto LABEL_29;
  }
  uint64_t v11 = (std::__shared_weak_count *)v32[1];
  if (!v11 || (v12 = std::__shared_weak_count::lock(v11)) == 0)
  {
LABEL_29:
    Value = 0;
    goto LABEL_30;
  }
  v13 = v12;
  uint64_t v14 = *v32;
  if (!*v32) {
    goto LABEL_39;
  }
  theDict[0] = (CFDictionaryRef)0xAAAAAAAAAAAAAAAALL;
  (*(void (**)(CFDictionaryRef *__return_ptr))(*(void *)v14 + 48))(theDict);
  if (theDict[0]) {
    int v15 = ctu::SharedRef<__CFDictionary const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary const>::get;
  }
  else {
    int v15 = 0;
  }
  if (!v15) {
    goto LABEL_34;
  }
  Value = CFDictionaryGetValue(theDict[0], (const void *)*MEMORY[0x1E4F3B9F0]);
  if (!Value)
  {
LABEL_35:
    uint64_t v18 = 1;
    goto LABEL_36;
  }
  CFTypeID TypeID = SecIdentityGetTypeID();
  if (TypeID != CFGetTypeID(Value))
  {
LABEL_34:
    Value = 0;
    goto LABEL_35;
  }
  Value = (const void *)[MEMORY[0x1E4F29098] credentialWithIdentity:Value certificates:0 persistence:0];
  uint64_t v18 = 0;
LABEL_36:
  ctu::SharedRef<__CFDictionary const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary const>::~SharedRef((const void **)theDict);
LABEL_40:
  std::__shared_weak_count::__release_shared[abi:ne180100](v13);
LABEL_31:
  (*((void (**)(id, uint64_t, const void *))a6 + 2))(a6, v18, Value);
  if (v33) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v33);
  }
}

- (void)URLSession:(id)a3 task:(id)a4 willPerformHTTPRedirection:(id)a5 newRequest:(id)a6 completionHandler:(id)a7
{
  int v15 = (std::__shared_weak_count *)0xAAAAAAAAAAAAAAAALL;
  uint64_t v11 = [a4 taskIdentifier:a3];
  if (self)
  {
    [(URLSessionDelegate *)self getContext:v11];
    if (MEMORY[0xAAAAAAAAAAAAAAB2] && (v12 = std::__shared_weak_count::lock(MEMORY[0xAAAAAAAAAAAAAAB2])) != 0)
    {
      v13 = v12;
      if (MEMORY[0xAAAAAAAAAAAAAAAA]) {
        uint64_t v14 = (*(uint64_t (**)(void, id, id))(*MEMORY[0xAAAAAAAAAAAAAAAA] + 24))(MEMORY[0xAAAAAAAAAAAAAAAA], a6, a5);
      }
      else {
        uint64_t v14 = 0;
      }
      std::__shared_weak_count::__release_shared[abi:ne180100](v13);
    }
    else
    {
      uint64_t v14 = 0;
    }
  }
  else
  {
    uint64_t v14 = 0;
    int v15 = 0;
  }
  (*((void (**)(id, uint64_t))a7 + 2))(a7, v14);
  if (v15) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v15);
  }
}

- (void).cxx_destruct
{
}

- (id).cxx_construct
{
  *((void *)self + 3) = 0;
  *((void *)self + 2) = 0;
  *((void *)self + 1) = (char *)self + 16;
  return self;
}

@end