@interface VMSharedJetsamAssertion
- (VMSharedJetsamAssertion)initWithJetsamAssertion:(shared_ptr<VMJetsamAssertion>)a3;
- (id).cxx_construct;
- (id)description;
- (void)dealloc;
@end

@implementation VMSharedJetsamAssertion

- (VMSharedJetsamAssertion)initWithJetsamAssertion:(shared_ptr<VMJetsamAssertion>)a3
{
  ptr = a3.__ptr_;
  v17.receiver = self;
  v17.super_class = (Class)VMSharedJetsamAssertion;
  v4 = [(VMSharedJetsamAssertion *)&v17 init];
  v5 = v4;
  if (v4)
  {
    v6 = *(VMJetsamAssertion **)ptr;
    uint64_t v7 = *((void *)ptr + 1);
    if (v7) {
      atomic_fetch_add_explicit((atomic_ullong *volatile)(v7 + 8), 1uLL, memory_order_relaxed);
    }
    cntrl = (std::__shared_weak_count *)v4->jetsam.__cntrl_;
    v5->jetsam.__ptr_ = v6;
    v5->jetsam.__cntrl_ = (__shared_weak_count *)v7;
    if (cntrl)
    {
      sub_10006C2BC(cntrl);
      v6 = v5->jetsam.__ptr_;
    }
    v9 = sub_100020EE0(*((id **)v6 + 3));
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v10 = *((void *)v5->jetsam.__ptr_ + 1);
      v11 = objc_opt_class();
      v12 = v5->jetsam.__ptr_;
      uint64_t v13 = *((void *)v12 + 2);
      uint64_t v14 = *(void *)v12;
      *(_DWORD *)buf = 136316418;
      uint64_t v19 = v10;
      __int16 v20 = 2080;
      v21 = " ";
      __int16 v22 = 2112;
      v23 = v11;
      __int16 v24 = 2048;
      uint64_t v25 = v13;
      __int16 v26 = 2080;
      uint64_t v27 = v14;
      __int16 v28 = 2048;
      v29 = v5;
      id v15 = v11;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "#I %s%s%@ [%lu, %s, %p] created", buf, 0x3Eu);
    }
  }
  return v5;
}

- (void)dealloc
{
  v3 = sub_100020EE0(*((id **)self->jetsam.__ptr_ + 3));
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = *((void *)self->jetsam.__ptr_ + 1);
    v5 = objc_opt_class();
    ptr = self->jetsam.__ptr_;
    uint64_t v7 = *((void *)ptr + 2);
    uint64_t v8 = *(void *)ptr;
    *(_DWORD *)buf = 136316418;
    uint64_t v12 = v4;
    __int16 v13 = 2080;
    uint64_t v14 = " ";
    __int16 v15 = 2112;
    v16 = v5;
    __int16 v17 = 2048;
    uint64_t v18 = v7;
    __int16 v19 = 2080;
    uint64_t v20 = v8;
    __int16 v21 = 2048;
    __int16 v22 = self;
    id v9 = v5;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "#I %s%s%@ [%lu, %s, %p] deleted", buf, 0x3Eu);
  }
  v10.receiver = self;
  v10.super_class = (Class)VMSharedJetsamAssertion;
  [(VMSharedJetsamAssertion *)&v10 dealloc];
}

- (id)description
{
  id v3 = objc_alloc_init((Class)NSMutableString);
  [v3 appendFormat:@"<%@ %p ", objc_opt_class(), self];
  [v3 appendFormat:@"jetsam=[%lu, %s]", *((void *)self->jetsam.__ptr_ + 2), *(void *)self->jetsam.__ptr_];
  [v3 appendFormat:@">"];
  return v3;
}

- (void).cxx_destruct
{
  cntrl = self->jetsam.__cntrl_;
  if (cntrl) {
    sub_10006C2BC((std::__shared_weak_count *)cntrl);
  }
}

- (id).cxx_construct
{
  *((void *)self + 1) = 0;
  *((void *)self + 2) = 0;
  return self;
}

@end