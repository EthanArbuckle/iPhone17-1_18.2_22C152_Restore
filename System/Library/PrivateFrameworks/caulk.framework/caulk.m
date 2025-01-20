unsigned int *caulk::pooled_semaphore_mutex::_unlock(caulk::pooled_semaphore_mutex *this)
{
  return caulk::pooled_semaphore_mutex::unlock_impl((unsigned int *)this, 0);
}

unint64_t caulk::pooled_semaphore_mutex::_lock(caulk::pooled_semaphore_mutex *this)
{
  return caulk::pooled_semaphore_mutex::lock_impl((unint64_t)this, 0);
}

void *__destroy_helper_block_ea8_32c60_ZTSKZN5caulk3xpc22reply_watchdog_factory10make_timerEiE3__0(uint64_t a1)
{
  return std::__function::__value_func<void ()(void)>::~__value_func[abi:ne180100]((void *)(a1 + 32));
}

uint64_t __copy_helper_block_ea8_32c60_ZTSKZN5caulk3xpc22reply_watchdog_factory10make_timerEiE3__0(uint64_t a1, uint64_t a2)
{
  return std::__function::__value_func<void ()(void)>::__value_func[abi:ne180100](a1 + 32, a2 + 32);
}

unint64_t *caulk::alloc::exported_resource<caulk::alloc::darwin_resource<caulk::alloc::dsw_allocator2<true>,caulk::alloc::rt_safe_memory_resource>,caulk::alloc::rt_safe_memory_resource,caulk::rt_safe_memory_resource>::do_allocate(uint64_t a1, unint64_t a2, unint64_t a3)
{
  return caulk::alloc::tiered_allocator<caulk::alloc::size_range_tier<0ul,1008ul,caulk::alloc::tree_allocator<caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,16ul,6ul>>>,caulk::alloc::size_range_tier<1009ul,16128ul,caulk::alloc::tree_allocator<caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,256ul,6ul>>>,caulk::alloc::tracking_allocator<caulk::alloc::global_page_cache>>::allocate(a1 + 32, a2, a3);
}

void caulk::alloc::exported_resource<caulk::alloc::darwin_resource<caulk::alloc::dsw_allocator2<true>,caulk::alloc::rt_safe_memory_resource>,caulk::alloc::rt_safe_memory_resource,caulk::rt_safe_memory_resource>::do_deallocate(uint64_t a1, caulk::mach::vm_block *a2, unint64_t a3)
{
}

uint64_t caulk::alloc::darwin_resource<caulk::alloc::caching_page_allocator<16384ul>,caulk::alloc::memory_resource>::zone_size_for_ptr()
{
  return 0;
}

atomic_ullong *caulk::concurrent::messenger::enqueue(atomic_ullong **this, caulk::concurrent::message *a2)
{
  return caulk::concurrent::details::messenger_servicer::enqueue(*this, (unint64_t)a2);
}

unsigned int *caulk::pooled_semaphore_mutex::unlock_impl(unsigned int *this, char a2)
{
  if ((a2 & 1) == 0) {
    __dmb(0xBu);
  }
  LODWORD(v4) = *this;
  if ((unsigned __int16)*this)
  {
    uint64_t v5 = *this;
    while (1)
    {
      v2 = (caulk::details::semaphore_pool *)WORD1(v5);
      unsigned __int16 v6 = v4 - 1;
      v3 = (unsigned __int16)v4 == 1 ? 0 : (caulk::details::semaphore_pool *)v2;
      uint64_t v4 = v5;
      atomic_compare_exchange_strong((atomic_uint *volatile)this, (unsigned int *)&v4, v6 | ((unsigned __int16)v3 << 16));
      if (v4 == v5) {
        break;
      }
      uint64_t v5 = v4;
      if (!(_WORD)v4) {
        goto LABEL_10;
      }
    }
  }
  else
  {
LABEL_10:
    __break(1u);
  }
  if (v3)
  {
    if ((a2 & 1) == 0)
    {
      caulk::details::semaphore_pool::instance((caulk::details::semaphore_pool *)this);
      this = (unsigned int *)caulk::details::semaphore_pool::sema_ref_to_bank(v3);
      if ((atomic_fetch_add_explicit((atomic_uint *volatile)&this[4 * (unsigned __int16)((_WORD)v3 - *(_WORD *)this) + 3], 1u, memory_order_release) & 0x80000000) != 0)
      {
        JUMPOUT(0x2166752E0);
      }
    }
  }
  else if (v2)
  {
    caulk::details::semaphore_pool::instance((caulk::details::semaphore_pool *)this);
    this = (unsigned int *)caulk::details::semaphore_pool::sema_ref_to_bank(v2);
    atomic_fetch_and((atomic_ullong *volatile)this + 130, ~(1 << (v2 - *(_WORD *)this)));
  }
  return this;
}

uint64_t caulk::concurrent::details::lf_read_sync_write_impl::begin_access(atomic_uint *this)
{
  LODWORD(v1) = *this;
  LODWORD(v2) = *this + 1;
  __int16 v3 = v2 & 0x7FFF;
  if ((v2 & 0x7FFF) != 0)
  {
    uint64_t v2 = *this;
    while (1)
    {
      unsigned int v4 = v2 & 0xFFFF0000 | (unsigned __int16)(v3 | v1 & 0x8000);
      uint64_t v1 = v2;
      atomic_compare_exchange_strong(this, (unsigned int *)&v1, v4);
      if (v1 == v2) {
        break;
      }
      uint64_t v2 = v1;
      __int16 v3 = (v1 + 1) & 0x7FFF;
      if (!v3) {
        goto LABEL_5;
      }
    }
  }
  else
  {
LABEL_5:
    __break(1u);
  }
  __dmb(9u);
  return (v2 >> 15) & 1;
}

uint64_t caulk::xpc::reply_watchdog_factory::reply_watchdog_factory(uint64_t this)
{
  *(unsigned char *)this = 0;
  *(_DWORD *)(this + 4) = 0;
  *(void *)(this + 32) = 0;
  return this;
}

{
  *(unsigned char *)this = 0;
  *(_DWORD *)(this + 4) = 0;
  *(void *)(this + 32) = 0;
  return this;
}

unint64_t caulk::pooled_semaphore_mutex::lock_impl(unint64_t this, double *a2)
{
  __int16 v3 = (atomic_uint *)this;
  unint64_t v4 = 0;
  uint64_t v5 = *(unsigned int *)this;
  while (1)
  {
    if ((unsigned __int16)v5 == 1 && WORD1(v5) == 0)
    {
      if ((_WORD)v4)
      {
        LOWORD(v7) = 2;
        this = v4;
      }
      else
      {
        caulk::details::semaphore_pool::instance((caulk::details::semaphore_pool *)this);
        LOWORD(v7) = 2;
        this = caulk::details::semaphore_pool::acquire(v8);
        LOWORD(v4) = this;
      }
    }
    else
    {
      if ((_WORD)v4)
      {
        caulk::details::semaphore_pool::instance((caulk::details::semaphore_pool *)this);
        this = caulk::details::semaphore_pool::sema_ref_to_bank((caulk::details::semaphore_pool *)(unsigned __int16)v4);
        atomic_fetch_and((atomic_ullong *volatile)(this + 1040), ~(1 << (v4 - *(_WORD *)this)));
      }
      int v7 = (unsigned __int16)v5 + 1;
      if ((v7 & 0x10000) != 0)
      {
        __break(1u);
        return this;
      }
      this = 0;
      LODWORD(v4) = WORD1(v5);
    }
    uint64_t v9 = v5;
    atomic_compare_exchange_strong(v3, (unsigned int *)&v9, (unsigned __int16)v7 | ((unsigned __int16)v4 << 16));
    if (v9 == v5) {
      break;
    }
    uint64_t v5 = v9;
    unint64_t v4 = this;
  }
  if ((_WORD)v4)
  {
    caulk::details::semaphore_pool::instance((caulk::details::semaphore_pool *)this);
    v10 = (_WORD *)caulk::details::semaphore_pool::sema_ref_to_bank((caulk::details::semaphore_pool *)(unsigned __int16)v4);
    v11 = (atomic_uint *)&v10[8 * (unsigned __int16)(v4 - *v10) + 2];
    if (a2)
    {
      if (!caulk::semaphore::timed_wait(v11, *a2))
      {
        caulk::pooled_semaphore_mutex::unlock_impl((unsigned int *)v3, 1);
        return 0;
      }
    }
    else
    {
      caulk::semaphore::timed_wait(v11, -1.0);
    }
  }
  __dmb(9u);
  return 1;
}

void caulk::alloc::exported_resource<caulk::alloc::darwin_resource<caulk::alloc::audio_allocator,caulk::alloc::memory_resource>,caulk::alloc::memory_resource,caulk::memory_resource>::do_deallocate(uint64_t a1, unint64_t a2, unint64_t a3)
{
}

uint64_t caulk::rt_safe_memory_resource::rt_allocate(caulk::rt_safe_memory_resource *this)
{
  return (*(uint64_t (**)(void))(*(void *)this + 16))();
}

uint64_t caulk::pooled_semaphore_mutex::try_lock(atomic_uint *this)
{
  unsigned int explicit = atomic_load_explicit(this, memory_order_acquire);
  if ((_WORD)explicit) {
    return 0;
  }
  unsigned int v2 = explicit;
  atomic_compare_exchange_strong(this, &v2, 1u);
  if (v2 != explicit) {
    return 0;
  }
  __dmb(9u);
  return 1;
}

uint64_t caulk::rt_safe_memory_resource::rt_deallocate(caulk::rt_safe_memory_resource *this, void *a2)
{
  return (*(uint64_t (**)(caulk::rt_safe_memory_resource *, void *))(*(void *)this + 24))(this, a2);
}

atomic_uint *caulk::concurrent::details::lf_read_sync_write_impl::end_access(atomic_uint *this)
{
  LODWORD(v3) = *this;
  if ((*this & 0x7FFF) != 0)
  {
    uint64_t v4 = *this;
    while (1)
    {
      unsigned int v2 = (caulk::details::semaphore_pool *)WORD1(v4);
      int v5 = ((_WORD)v3 - 1) & 0x7FFF;
      int v6 = v5 | v3 & 0x8000;
      unsigned int v1 = v5 ? WORD1(v4) : 0;
      unsigned int v7 = v6 | (v1 << 16);
      uint64_t v3 = v4;
      atomic_compare_exchange_strong(this, (unsigned int *)&v3, v7);
      if (v3 == v4) {
        break;
      }
      uint64_t v4 = v3;
      if ((v3 & 0x7FFF) == 0) {
        goto LABEL_8;
      }
    }
  }
  else
  {
LABEL_8:
    __break(1u);
  }
  if (v2 && !v1)
  {
    caulk::details::semaphore_pool::instance((caulk::details::semaphore_pool *)this);
    this = (atomic_uint *)caulk::details::semaphore_pool::sema_ref_to_bank(v2);
    v8 = &this[4 * (unsigned __int16)((_WORD)v2 - *(_WORD *)this)];
    if ((atomic_fetch_add_explicit(v8 + 3, 1u, memory_order_release) & 0x80000000) != 0) {
      return (atomic_uint *)MEMORY[0x2166752E0](v8[1]);
    }
  }
  return this;
}

uint64_t caulk::audio_buffer_resource(caulk *this)
{
  caulk::alloc::_audio_buffer_resource(this);
  if (v1) {
    return v1;
  }
  _os_assert_log();
  uint64_t result = _os_crash();
  __break(1u);
  return result;
}

uint64_t caulk::alloc::_audio_buffer_resource(caulk::alloc *this)
{
  {
    if (v2)
    {
      caulk::alloc::_audio_buffer_resource(void)::global = (uint64_t)caulk::alloc::make_audio_buffer_resource(v2);
      caulk::alloc::_audio_buffer_resource(void)::global = v3;
    }
  }
  return caulk::alloc::_audio_buffer_resource(void)::global;
}

void sub_21086628C(_Unwind_Exception *a1)
{
}

caulk::pooled_semaphore_mutex *caulk::pooled_semaphore_mutex::pooled_semaphore_mutex(caulk::pooled_semaphore_mutex *this)
{
  *(_DWORD *)this = 0;
  caulk::details::semaphore_pool::instance(this);
  return this;
}

{
  *(_DWORD *)this = 0;
  caulk::details::semaphore_pool::instance(this);
  return this;
}

caulk::concurrent::details::lf_read_sync_write_impl *caulk::concurrent::details::lf_read_sync_write_impl::lf_read_sync_write_impl(caulk::concurrent::details::lf_read_sync_write_impl *this)
{
  *(void *)this = 0;
  caulk::details::semaphore_pool::instance(this);
  return this;
}

{
  *(void *)this = 0;
  caulk::details::semaphore_pool::instance(this);
  return this;
}

void caulk::details::semaphore_pool::instance(caulk::details::semaphore_pool *this)
{
  {
    if (v1)
    {
      caulk::details::semaphore_pool::semaphore_pool(v1);
    }
  }
}

void sub_210866364(_Unwind_Exception *a1)
{
}

uint64_t caulk::ipc::mapped_memory::mapped_memory(uint64_t a1, xpc_object_t *a2)
{
  *(void *)a1 = 0;
  *(void *)(a1 + 8) = 0;
  *(unsigned char *)(a1 + 16) = 0;
  if (!*a2)
  {
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::runtime_error::runtime_error(exception, "no object");
    goto LABEL_9;
  }
  if (MEMORY[0x2166753F0]() != MEMORY[0x263EF8790])
  {
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::runtime_error::runtime_error(exception, "not a shared memory object");
    goto LABEL_9;
  }
  size_t v4 = xpc_shmem_map(*a2, (void **)a1);
  *(void *)(a1 + 8) = v4;
  if (!*(void *)a1 || !v4)
  {
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::runtime_error::runtime_error(exception, "failed to map in shared memory");
LABEL_9:
    __cxa_throw(exception, MEMORY[0x263F8C1F0], MEMORY[0x263F8C070]);
  }
  return a1;
}

void sub_210866454(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

uint64_t caulk::xpc::reply_watchdog_factory::init2(uint64_t a1, int a2, uint64_t a3)
{
  int v6 = (caulk *)getpid();
  *(unsigned char *)a1 = caulk::is_debugger_attached(v6);
  *(_DWORD *)(a1 + 4) = a2;
  uint64_t v7 = a1 + 8;
  uint64_t v10 = *(void *)(a1 + 32);
  uint64_t v9 = (void *)(a1 + 32);
  uint64_t result = v10;
  *uint64_t v9 = 0;
  if (v10 == v7)
  {
    uint64_t result = (*(uint64_t (**)(uint64_t))(*(void *)v7 + 32))(v7);
  }
  else if (result)
  {
    uint64_t result = (*(uint64_t (**)(uint64_t))(*(void *)result + 40))(result);
  }
  v11 = (void *)(a3 + 24);
  uint64_t v12 = *(void *)(a3 + 24);
  if (!v12)
  {
    v11 = v9;
    goto LABEL_9;
  }
  if (v12 != a3)
  {
    *uint64_t v9 = v12;
LABEL_9:
    void *v11 = 0;
    return result;
  }
  *uint64_t v9 = v7;
  return (*(uint64_t (**)(void, uint64_t))(*(void *)*v11 + 24))(*v11, v7);
}

uint64_t caulk::is_debugger_attached(caulk *this)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  *(void *)int v5 = 0xE00000001;
  int v6 = 1;
  int v7 = (int)this;
  size_t v2 = 648;
  unsigned int v4 = 0;
  sysctl(v5, 4u, v3, &v2, 0, 0);
  return (v4 >> 11) & 1;
}

uint64_t caulk::thread::start(uint64_t a1, uint64_t a2, void *(__cdecl *a3)(void *), void *a4)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  if (pthread_attr_init(&__attr))
  {
    _os_assert_log();
    _os_crash();
    __break(1u);
    goto LABEL_28;
  }
  if (*(unsigned char *)(a2 + 52))
  {
    int v8 = *(_DWORD *)(a2 + 48);
    if (v8 == -1) {
      uint64_t v9 = -1;
    }
    else {
      uint64_t v9 = *(unsigned int *)(a2 + 48);
    }
    if (v9 == 2)
    {
      if (v8 == 2)
      {
        sched_param v15 = 0;
        pthread_attr_getschedparam(&__attr, &v15);
        v15.sched_priority = *(_DWORD *)(a2 + 32);
        pthread_attr_setschedparam(&__attr, &v15);
        if (*(unsigned char *)(a2 + 36)) {
          pthread_attr_setschedpolicy(&__attr, 4);
        }
        goto LABEL_14;
      }
    }
    else
    {
      if (v9 == 1)
      {
        sched_param v15 = 0;
        pthread_attr_getschedparam(&__attr, &v15);
        v15.sched_priority = 63;
        pthread_attr_setschedparam(&__attr, &v15);
        goto LABEL_17;
      }
      if (v9) {
        goto LABEL_17;
      }
      if (!v8)
      {
        pthread_attr_set_qos_class_np(&__attr, *(qos_class_t *)(a2 + 32), *(_DWORD *)(a2 + 36));
LABEL_14:
        if (*(unsigned char *)(a2 + 52)) {
          *(unsigned char *)(a2 + 52) = 0;
        }
        goto LABEL_17;
      }
    }
    std::__throw_bad_variant_access[abi:ne180100]();
  }
LABEL_17:
  if (*(unsigned char *)(a2 + 60))
  {
    int v10 = *(_DWORD *)(a2 + 56);
    if (v10 == 1) {
      int v11 = 2;
    }
    else {
      int v11 = 1;
    }
    pthread_attr_setdetachstate(&__attr, v11);
    sched_param v15 = 0;
    int v12 = pthread_create((pthread_t *)&v15, &__attr, a3, a4);
    if (v10 == 1) {
      goto LABEL_25;
    }
  }
  else
  {
    sched_param v15 = 0;
    int v12 = pthread_create((pthread_t *)&v15, &__attr, a3, a4);
  }
  sched_param v13 = v15;
  *(sched_param *)a1 = v15;
  if (!*(void *)&v13) {
    goto LABEL_29;
  }
LABEL_25:
  atomic_store(1u, (unsigned __int8 *)(a1 + 8));
  uint64_t result = pthread_attr_destroy(&__attr);
  if (v12)
  {
LABEL_28:
    _os_assert_log();
    _os_crash();
    __break(1u);
LABEL_29:
    _os_assert_log();
    _os_crash();
    __break(1u);
  }
  return result;
}

uint64_t caulk::mach::os_workgroup_managed::join(caulk::mach::os_workgroup_managed *this)
{
  if (*((unsigned char *)this + 56)) {
    return 1;
  }
  if (!*((void *)this + 1)) {
    return 2;
  }
  uint64_t result = os_workgroup_join_self();
  *((unsigned char *)this + 56) = result == 0;
  return result;
}

void caulk::mach::os_workgroup_interval_managed::~os_workgroup_interval_managed(caulk::mach::details **this, void *a2)
{
  *this = (caulk::mach::details *)&unk_26C2AB808;
  caulk::mach::details::release_os_object(this[1], a2);
}

{
  uint64_t vars8;

  *this = (caulk::mach::details *)&unk_26C2AB808;
  caulk::mach::details::release_os_object(this[1], a2);

  JUMPOUT(0x216674B00);
}

{
  *this = (caulk::mach::details *)&unk_26C2AB808;
  caulk::mach::details::release_os_object(this[1], a2);
}

void caulk::mach::os_workgroup_managed::~os_workgroup_managed(caulk::mach::details **this, void *a2)
{
  *this = (caulk::mach::details *)&unk_26C2AB808;
  caulk::mach::details::release_os_object(this[1], a2);
}

{
  uint64_t vars8;

  *this = (caulk::mach::details *)&unk_26C2AB808;
  caulk::mach::details::release_os_object(this[1], a2);

  JUMPOUT(0x216674B00);
}

{
  *this = (caulk::mach::details *)&unk_26C2AB808;
  caulk::mach::details::release_os_object(this[1], a2);
}

void caulk::mach::details::release_os_object(caulk::mach::details *this, void *a2)
{
  if (this) {
    os_release(this);
  }
}

OS_os_workgroup *caulk::mach::os_workgroup_managed::copy_mach_port(caulk::mach::os_workgroup_managed *this)
{
  uint64_t result = (OS_os_workgroup *)*((void *)this + 1);
  if (result)
  {
    mach_port_t mach_port_out = 0;
    if (os_workgroup_copy_port(result, &mach_port_out)) {
      return 0;
    }
    else {
      return (OS_os_workgroup *)mach_port_out;
    }
  }
  return result;
}

void *caulk::mach::details::retain_os_object(void *this, void *a2)
{
  if (this) {
    return os_retain(this);
  }
  return this;
}

void caulk::platform::process_name(caulk::platform *this@<X0>, std::string *a2@<X8>)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  a2->__r_.__value_.__r.__words[0] = 0;
  a2->__r_.__value_.__l.__size_ = 0;
  a2->__r_.__value_.__r.__words[2] = 0;
  size_t v3 = 648;
  *(void *)unsigned int v4 = 0xE00000001;
  int v5 = 1;
  int v6 = (int)this;
  if (sysctl(v4, 4u, v7, &v3, 0, 0) == -1)
  {
    perror("sysctl");
  }
  else if (v3)
  {
    std::string::__assign_external(a2, v8);
  }
}

void sub_210866A20(_Unwind_Exception *exception_object)
{
  if (*(char *)(v1 + 23) < 0) {
    operator delete(*(void **)v1);
  }
  _Unwind_Resume(exception_object);
}

std::string *__cdecl std::string::__assign_external(std::string *this, const std::string::value_type *__s, std::string::size_type __n)
{
  LODWORD(v6) = SHIBYTE(this->__r_.__value_.__r.__words[2]);
  if ((v6 & 0x80000000) != 0)
  {
    unint64_t v10 = this->__r_.__value_.__r.__words[2];
    unint64_t v9 = (v10 & 0x7FFFFFFFFFFFFFFFLL) - 1;
    if (v9 < __n)
    {
      std::string::size_type size = this->__r_.__value_.__l.__size_;
      goto LABEL_6;
    }
    unint64_t v6 = HIBYTE(v10);
    int v7 = (std::string *)this->__r_.__value_.__r.__words[0];
  }
  else
  {
    int v7 = this;
    if (__n > 0x16)
    {
      std::string::size_type size = HIBYTE(this->__r_.__value_.__r.__words[2]);
      unint64_t v9 = 22;
LABEL_6:
      std::string::__grow_by_and_replace(this, v9, __n - v9, size, 0, size, __n, __s);
      return this;
    }
  }
  if (__n)
  {
    memmove(v7, __s, __n);
    LOBYTE(v6) = *((unsigned char *)&this->__r_.__value_.__s + 23);
  }
  if ((v6 & 0x80) != 0) {
    this->__r_.__value_.__l.__size_ = __n;
  }
  else {
    *((unsigned char *)&this->__r_.__value_.__s + 23) = __n & 0x7F;
  }
  v7->__r_.__value_.__s.__data_[__n] = 0;
  return this;
}

std::string *__cdecl std::string::__assign_external(std::string *this, const std::string::value_type *__s)
{
  size_t v4 = strlen(__s);

  return std::string::__assign_external(this, __s, v4);
}

semaphore_t *caulk::semaphore::semaphore(semaphore_t *this, semaphore_t a2)
{
  uint64_t result = caulk::mach::semaphore::semaphore(this);
  result[2] = a2;
  result[3] = a2;
  return result;
}

{
  semaphore_t *result;

  uint64_t result = caulk::mach::semaphore::semaphore(this);
  result[2] = a2;
  result[3] = a2;
  return result;
}

void caulk::concurrent::details::messenger_servicer::drain(atomic_ullong *this)
{
  caulk::mach::semaphore::semaphore((semaphore_t *)&v8);
  uint64_t v9 = 0;
  unint64_t v2 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)caulk::alloc::realtime_safe_resource + 16))(caulk::alloc::realtime_safe_resource, 40, 8);
  *(_DWORD *)(v2 + 16) = 0;
  *(void *)(v2 + 24) = &v8;
  *(void *)unint64_t v2 = &unk_26C2AB6F8;
  *(void *)(v2 + 8) = 0;
  caulk::concurrent::details::messenger_servicer::enqueue(this, v2);
  do
  {
    if ((*(unsigned int (**)(atomic_ullong *))(*this + 24))(this))
    {
      while (1)
      {
        unint64_t v3 = this[9];
        if (!v3)
        {
          unint64_t v6 = atomic_exchange_explicit(this + 1, 0, memory_order_acquire);
          if (!v6) {
            goto LABEL_11;
          }
          unint64_t v3 = 0;
          do
          {
            unint64_t v4 = v3;
            unint64_t v3 = v6;
            int v5 = (unint64_t *)(v6 + 8);
            unint64_t v6 = atomic_load((unint64_t *)(v6 + 8));
            atomic_store(v4, v5);
          }
          while (v6);
          this[9] = v3;
        }
        unint64_t v7 = atomic_load((unint64_t *)(v3 + 8));
        this[9] = v7;
        atomic_store(0, (unsigned int *)(v3 + 16));
      }
    }
  }
  while (!caulk::semaphore::timed_wait(&v8, 0.5));
LABEL_11:
  caulk::semaphore::~semaphore((caulk::semaphore *)&v8);
}

void sub_210866C98(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

unint64_t *caulk::alloc::darwin_resource<caulk::alloc::dsw_allocator2<true>,caulk::alloc::rt_safe_memory_resource>::do_allocate(uint64_t a1, unint64_t a2, unint64_t a3)
{
  int v5 = caulk::alloc::tiered_allocator<caulk::alloc::size_range_tier<0ul,1008ul,caulk::alloc::tree_allocator<caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,16ul,6ul>>>,caulk::alloc::size_range_tier<1009ul,16128ul,caulk::alloc::tree_allocator<caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,256ul,6ul>>>,caulk::alloc::tracking_allocator<caulk::alloc::global_page_cache>>::allocate(a1 + 16, a2, a3);
  if (!v5)
  {
    exception = (std::bad_alloc *)__cxa_allocate_exception(8uLL);
    unint64_t v10 = std::bad_alloc::bad_alloc(exception);
    __cxa_throw(v10, MEMORY[0x263F8C218], MEMORY[0x263F8C170]);
  }
  unint64_t v6 = v5;
  unint64_t v7 = *(void (**)(uint64_t, uint64_t, unint64_t, void, unint64_t *, void))(a1 + 1600);
  if (v7) {
    v7(10, *(void *)(a1 + 1584) + 8, a2, 0, v5, 0);
  }
  return v6;
}

atomic_ullong *caulk::concurrent::details::messenger_servicer::enqueue(atomic_ullong *result, unint64_t a2)
{
  if (atomic_fetch_or((atomic_uint *volatile)(a2 + 16), 1u))
  {
    __break(1u);
  }
  else
  {
    unint64_t v2 = result[1];
    atomic_store(v2, (unint64_t *)(a2 + 8));
    unint64_t v3 = v2;
    atomic_compare_exchange_strong(result + 1, &v3, a2);
    if (v3 != v2)
    {
      unint64_t v4 = v3;
      do
      {
        atomic_store(v3, (unint64_t *)(a2 + 8));
        atomic_compare_exchange_strong(result + 1, &v4, a2);
        BOOL v5 = v4 == v3;
        unint64_t v3 = v4;
      }
      while (!v5);
    }
    __dmb(0xBu);
    return (atomic_ullong *)(*(uint64_t (**)(void))(*result + 16))();
  }
  return result;
}

uint64_t non-virtual thunk to'caulk::concurrent::details::service_thread::messenger_signal_wakeup(uint64_t this)
{
  if ((atomic_fetch_add_explicit((atomic_uint *volatile)(this - 16), 1u, memory_order_release) & 0x80000000) != 0) {
    JUMPOUT(0x2166752E0);
  }
  return this;
}

semaphore_t *caulk::mach::semaphore::semaphore(semaphore_t *semaphore)
{
  *semaphore = 0;
  *((unsigned char *)semaphore + 4) = 0;
  unint64_t v2 = (const char *)semaphore_create(*MEMORY[0x263EF8960], semaphore, 0, 0);
  caulk::mach::throw_if_mach_error((uint64_t)"semaphore_create", v2);
  *((unsigned char *)semaphore + 4) = 1;
  return semaphore;
}

uint64_t caulk::mach::throw_if_mach_error(uint64_t this, const char *a2)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  if (a2)
  {
    *(void *)unint64_t v6 = &unk_26C2AB7C0;
    MEMORY[0x2166748E0](v5, a2, v6, this);
    std::error_category::~error_category((std::error_category *)v6);
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
    {
      unint64_t v2 = std::runtime_error::what(v5);
      *(_DWORD *)unint64_t v6 = 136315138;
      *(void *)&v6[4] = v2;
      _os_log_error_impl(&dword_210865000, &_os_log_internal, OS_LOG_TYPE_ERROR, "Throwing: %s", v6, 0xCu);
    }
    exception = (std::runtime_error *)__cxa_allocate_exception(0x20uLL);
    unint64_t v4 = std::runtime_error::runtime_error(exception, v5);
    v4->__vftable = (std::runtime_error_vtbl *)(MEMORY[0x263F8C2E8] + 16);
    v4[1] = v5[1];
    __cxa_throw(v4, MEMORY[0x263F8C1A8], MEMORY[0x263F8C0D8]);
  }
  return this;
}

void sub_210866F70(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, std::runtime_error a9, uint64_t a10, uint64_t a11, std::error_category a12)
{
}

uint64_t non-virtual thunk to'caulk::concurrent::details::service_thread::messenger_is_terminating_with_error(caulk::concurrent::details::service_thread *this)
{
  unsigned __int8 v1 = atomic_load((unsigned __int8 *)this - 8);
  return v1 & 1;
}

void caulk::semaphore::~semaphore(caulk::semaphore *this)
{
  signed int v1 = atomic_load((unsigned int *)this + 2);
  if (v1 < *((_DWORD *)this + 3))
  {
    _os_assert_log();
    _os_crash();
    __break(1u);
  }
  else
  {
    caulk::mach::semaphore::~semaphore((semaphore_t *)this);
  }
}

void caulk::mach::semaphore::~semaphore(semaphore_t *this)
{
  if (*((unsigned char *)this + 4))
  {
    if (*this) {
      semaphore_destroy(*MEMORY[0x263EF8960], *this);
    }
  }
}

void caulk::alloc::tiered_allocator<caulk::alloc::size_range_tier<0ul,1008ul,caulk::alloc::tree_allocator<caulk::alloc::chunk_allocator<caulk::alloc::page_allocator,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,16ul,6ul>>>,caulk::alloc::size_range_tier<1009ul,256000ul,caulk::alloc::guarded_edges_allocator<caulk::alloc::consolidating_free_map<caulk::alloc::page_allocator,10485760ul>,4ul>>,caulk::alloc::tracking_allocator<caulk::alloc::page_allocator>>::deallocate(uint64_t a1, unint64_t a2, unint64_t a3)
{
  if (a3 <= 0x3F0)
  {
    unint64_t v23 = a1 + 784;
    uint64_t v24 = a1 + 944;
    caulk::concurrent::details::node_allocator<void *,caulk::alloc::detail::tracked_block,10ul,(caulk::concurrent::skiplist_options)0>::begin_traversal();
    uint64_t owner = caulk::alloc::tree_allocator<caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,16ul,6ul>>::find_owner(&v23, a2);
    if (owner)
    {
      uint64_t v7 = owner;
      atomic_uint v8 = (unsigned int *)(owner + 16);
      caulk::alloc::bitmap_allocator<caulk::alloc::embed_block_memory,16368ul,16ul,6ul>::deallocate((caulk::alloc::base_allocator *)(owner + 16), a2, a3);
      unint64_t v9 = atomic_load((unsigned int *)(v7 + 4));
      if (v9 == -1)
      {
        unint64_t v9 = atomic_load(v8);
        if (v9 >= 0xFC)
        {
          unint64_t v9 = atomic_exchange((atomic_uchar *volatile)v7, 1u);
          if ((v9 & 1) == 0)
          {
            uint64_t v25 = v7;
            caulk::concurrent::skiplist<unsigned long,caulk::alloc::chunk_allocator<caulk::alloc::page_allocator,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,16ul,6ul>::node_impl<caulk::alloc::tree_allocator<caulk::alloc::chunk_allocator<caulk::alloc::page_allocator,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,16ul,6ul>>::node_header,caulk::alloc::embed_block_memory> *,5,(caulk::concurrent::skiplist_options)1>::emplace<caulk::alloc::chunk_allocator<caulk::alloc::page_allocator,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,16ul,6ul>::node_impl<caulk::alloc::tree_allocator<caulk::alloc::chunk_allocator<caulk::alloc::page_allocator,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,16ul,6ul>>::node_header,caulk::alloc::embed_block_memory> *>((unint64_t *)(a1 + 1072), v7 + 288, &v25);
            unint64_t v9 = v7 + 4;
            atomic_store(0, (unsigned int *)(v7 + 4));
            atomic_store(0, (unsigned __int8 *)v7);
          }
        }
      }
      caulk::concurrent::details::node_allocator<unsigned long,caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,256ul,6ul>::node_impl<caulk::alloc::tree_allocator<caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,256ul,6ul>>::node_header,caulk::alloc::embed_block_memory> *,5ul,(caulk::concurrent::skiplist_options)1>::end_traversal(v24, v9);
      return;
    }
LABEL_31:
    caulk::alloc::base_allocator::bad_dealloc((caulk::alloc::base_allocator *)owner);
  }
  if (a3 - 1009 <= 0x3E40F)
  {
    uint64_t v10 = 0;
    uint64_t v11 = a1 + 352;
    uint64_t v12 = a2 ^ a3 ^ 0x3E9E8527D393999FLL;
    unint64_t v13 = a2 - 32;
    while (*(void *)(v13 + v10) == v12)
    {
      if (*(void *)(a2 + ((a3 + 7) & 0xFFFFFFFFFFFFFFF8) + v10) != v12) {
        goto LABEL_29;
      }
      v10 += 8;
      if (v10 == 32)
      {
        v14 = (os_unfair_lock_s *)(a1 + 704);
        os_unfair_lock_lock((os_unfair_lock_t)(a1 + 704));
        if (!caulk::alloc::consolidating_free_map<caulk::alloc::page_allocator,10485760ul>::size(v11, a2 - 32)) {
          caulk::alloc::base_allocator::bad_dealloc(0);
        }
        uint64_t v15 = a2 - 64;
        unint64_t v16 = *(void *)(a2 - 40);
        unint64_t v17 = *(void *)(a2 - 48) | 1;
        *(void *)(a2 - 48) = v17;
        if ((v16 & 1) == 0)
        {
          uint64_t v18 = v13 + (v16 >> 1);
          if (*(unsigned char *)(v18 + 16))
          {
            caulk::alloc::consolidating_free_map<caulk::alloc::page_allocator,10485760ul>::remove_freemap_entry(v11, (uint64_t *)v18);
            caulk::alloc::consolidating_free_map<caulk::alloc::page_allocator,10485760ul>::consolidate_free(a2 - 64, v18);
            unint64_t v17 = *(void *)(a2 - 48);
          }
        }
        if (v17 >= 2 && (unint64_t v19 = v15 - (v17 >> 1), (*(unsigned char *)(v19 - 16) & 1) != 0))
        {
          v20 = (void *)(v19 - 32);
          caulk::alloc::consolidating_free_map<caulk::alloc::page_allocator,10485760ul>::remove_freemap_entry(v11, (uint64_t *)(v19 - 32));
          caulk::alloc::consolidating_free_map<caulk::alloc::page_allocator,10485760ul>::consolidate_free((uint64_t)v20, v15);
        }
        else
        {
          v20 = (void *)(a2 - 64);
        }
        uint64_t v22 = caulk::alloc::consolidating_free_map<caulk::alloc::page_allocator,10485760ul>::add_freemap_node(v11, v20);
        caulk::alloc::page_allocator::advise_free(v22, (uint64_t)(v20 + 4), v20[3] >> 1);
        os_unfair_lock_unlock(v14);
        return;
      }
    }
    _os_assert_log();
    _os_crash();
    __break(1u);
LABEL_29:
    _os_assert_log();
    _os_crash();
    __break(1u);
    goto LABEL_30;
  }
  if ((caulk::concurrent::skiplist<void *,caulk::alloc::detail::tracked_block,10,(caulk::concurrent::skiplist_options)0>::remove(a1 + 16, a2) & 1) == 0)
  {
LABEL_30:
    _os_assert_log();
    uint64_t owner = _os_crash();
    __break(1u);
    goto LABEL_31;
  }
  size_t v21 = (a3 + *MEMORY[0x263EF8AF8] - 1) & -*MEMORY[0x263EF8AF8];

  caulk::mach::vm_block::dealloc((caulk::mach::vm_block *)a2, v21);
}

void sub_2108672E8(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void caulk::alloc::consolidating_free_map<caulk::alloc::page_allocator,10485760ul>::remove_freemap_entry(uint64_t a1, uint64_t *a2)
{
  unint64_t v3 = *(void **)(a1 + 368);
  if (!v3) {
    goto LABEL_12;
  }
  BOOL v5 = (uint64_t **)(a1 + 360);
  unint64_t v6 = (unint64_t)a2[3] >> 1;
  uint64_t v7 = (uint64_t *)(a1 + 368);
  unint64_t v2 = v7;
  do
  {
    unint64_t v8 = v3[4];
    BOOL v9 = v8 >= v6;
    if (v8 >= v6) {
      uint64_t v10 = v3;
    }
    else {
      uint64_t v10 = v3 + 1;
    }
    if (v9) {
      unint64_t v2 = v3;
    }
    unint64_t v3 = (void *)*v10;
  }
  while (*v10);
  if (v2 == v7 || v2[4] > v6)
  {
LABEL_12:
    _os_assert_log();
    BOOL v5 = (uint64_t **)_os_crash();
    __break(1u);
  }
  uint64_t v11 = *a2;
  if (*a2)
  {
    uint64_t v12 = (void *)a2[1];
    *(void *)(v11 + 8) = v12;
    if (v12) {
      *uint64_t v12 = v11;
    }
    if (!v2[6])
    {
      std::__tree<std::__value_type<unsigned long,caulk::alloc::consolidating_free_map<caulk::alloc::page_allocator,10485760ul>::FreelistOfSize>,std::__map_value_compare<unsigned long,std::__value_type<unsigned long,caulk::alloc::consolidating_free_map<caulk::alloc::page_allocator,10485760ul>::FreelistOfSize>,std::less<unsigned long>,true>,std::allocator<std::__value_type<unsigned long,caulk::alloc::consolidating_free_map<caulk::alloc::page_allocator,10485760ul>::FreelistOfSize>>>::__remove_node_pointer(v5, v2);
      operator delete(v2);
    }
  }
  else
  {
    _os_assert_log();
    _os_crash();
    __break(1u);
  }
}

uint64_t caulk::alloc::consolidating_free_map<caulk::alloc::page_allocator,10485760ul>::consolidate_free(uint64_t result, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 24) & 1;
  unint64_t v3 = *(void *)(result + 24);
  unint64_t v4 = v3 >> 1;
  unint64_t v5 = v3 & 0xFFFFFFFFFFFFFFFELL | v2;
  *(void *)(result + 24) = v5;
  uint64_t v6 = v4 + (*(void *)(a2 + 24) >> 1) + 32;
  *(void *)(result + 24) = v5 & 1 | (2 * v6);
  if ((v2 & 1) == 0) {
    *(void *)(result + (v6 & 0x7FFFFFFFFFFFFFFFLL) + 48) = *(void *)(result + (v6 & 0x7FFFFFFFFFFFFFFFLL) + 48) & 1 | (2 * v6);
  }
  return result;
}

unint64_t caulk::alloc::page_allocator::advise_free(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t result = (unint64_t)(a2 + *MEMORY[0x263EF8AF8] - 1) / *MEMORY[0x263EF8AF8] * *MEMORY[0x263EF8AF8];
  unint64_t v4 = (unint64_t)(a2 + a3) / *MEMORY[0x263EF8AF8] * *MEMORY[0x263EF8AF8];
  if (v4 > result) {
    return madvise((void *)result, v4 - result, 5);
  }
  return result;
}

void *caulk::alloc::exported_resource<caulk::alloc::darwin_resource<caulk::alloc::audio_allocator,caulk::alloc::memory_resource>,caulk::alloc::memory_resource,caulk::memory_resource>::do_allocate(uint64_t a1, unint64_t a2, unint64_t a3)
{
  unint64_t v3 = (void *)caulk::alloc::tiered_allocator<caulk::alloc::size_range_tier<0ul,1008ul,caulk::alloc::tree_allocator<caulk::alloc::chunk_allocator<caulk::alloc::page_allocator,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,16ul,6ul>>>,caulk::alloc::size_range_tier<1009ul,256000ul,caulk::alloc::guarded_edges_allocator<caulk::alloc::consolidating_free_map<caulk::alloc::page_allocator,10485760ul>,4ul>>,caulk::alloc::tracking_allocator<caulk::alloc::page_allocator>>::allocate(a1 + 32, a2, a3);
  unint64_t v5 = v3;
  if (v3) {
    bzero(v3, v4);
  }
  return v5;
}

uint64_t caulk::alloc::darwin_resource<caulk::alloc::dsw_allocator2<true>,caulk::alloc::rt_safe_memory_resource>::zone_size_for_ptr(uint64_t a1, unint64_t a2)
{
  uint64_t v3 = *(void *)(a1 - 8);
  unint64_t v13 = v3 + 992;
  uint64_t v14 = v3 + 1152;
  caulk::concurrent::details::node_allocator<void *,caulk::alloc::detail::tracked_block,10ul,(caulk::concurrent::skiplist_options)0>::begin_traversal();
  uint64_t owner = caulk::alloc::tree_allocator<caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,16ul,6ul>>::find_owner(&v13, a2);
  if (owner) {
    uint64_t v6 = caulk::alloc::bitmap_allocator<caulk::alloc::embed_block_memory,16368ul,16ul,6ul>::size(owner + 16, a2);
  }
  else {
    uint64_t v6 = 0;
  }
  caulk::concurrent::details::node_allocator<unsigned long,caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,256ul,6ul>::node_impl<caulk::alloc::tree_allocator<caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,256ul,6ul>>::node_header,caulk::alloc::embed_block_memory> *,5ul,(caulk::concurrent::skiplist_options)1>::end_traversal(v3 + 1152, v5);
  if (!v6)
  {
    unint64_t v13 = v3 + 384;
    uint64_t v14 = v3 + 544;
    caulk::concurrent::details::node_allocator<void *,caulk::alloc::detail::tracked_block,10ul,(caulk::concurrent::skiplist_options)0>::begin_traversal();
    uint64_t v7 = caulk::alloc::tree_allocator<caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,256ul,6ul>>::find_owner(&v13, a2);
    uint64_t v6 = v7
       ? caulk::alloc::bitmap_allocator<caulk::alloc::embed_block_memory,16368ul,256ul,6ul>::size(v7 + 16, a2)
       : 0;
    caulk::concurrent::details::node_allocator<unsigned long,caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,256ul,6ul>::node_impl<caulk::alloc::tree_allocator<caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,256ul,6ul>>::node_header,caulk::alloc::embed_block_memory> *,5ul,(caulk::concurrent::skiplist_options)1>::end_traversal(v3 + 544, v8);
    if (!v6)
    {
      caulk::concurrent::details::node_allocator<void *,caulk::alloc::detail::tracked_block,10ul,(caulk::concurrent::skiplist_options)0>::begin_traversal();
      unint64_t v13 = a2;
      unint64_t v9 = caulk::concurrent::skiplist<void *,caulk::alloc::detail::tracked_block,10,(caulk::concurrent::skiplist_options)0>::search_to_level<caulk::concurrent::skiplist<void *,caulk::alloc::detail::tracked_block,10,(caulk::concurrent::skiplist_options)0>::key_le>(v3 + 32, &v13, 0);
      if (*(void *)(v9 + 16) != a2)
      {
        if (*(unsigned char *)(v10 + 26) == 2) {
          unint64_t v9 = v3 + 232;
        }
        else {
          unint64_t v9 = v10;
        }
      }
      unint64_t v11 = v3 + 232;
      if (v9 == v3 + 232
        || (unint64_t v11 = *(unsigned __int8 *)(v9 + 26), v11 == 2)
        || (unint64_t v11 = atomic_load((unint64_t *)(v9 + 40)), (v11 & 1) != 0)
        || (unint64_t v11 = *(void *)(v9 + 16), v11 != a2))
      {
        uint64_t v6 = 0;
      }
      else
      {
        uint64_t v6 = *(void *)v9;
      }
      caulk::concurrent::details::node_allocator<void *,caulk::alloc::detail::tracked_block,10ul,(caulk::concurrent::skiplist_options)0>::end_traversal(v3 + 288, v11);
    }
  }
  return v6;
}

void caulk::alloc::tiered_allocator<caulk::alloc::size_range_tier<0ul,1008ul,caulk::alloc::tree_allocator<caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,16ul,6ul>>>,caulk::alloc::size_range_tier<1009ul,16128ul,caulk::alloc::tree_allocator<caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,256ul,6ul>>>,caulk::alloc::tracking_allocator<caulk::alloc::global_page_cache>>::deallocate(uint64_t a1, caulk::mach::vm_block *a2, unint64_t a3)
{
  if (a3 <= 0x3F0)
  {
    unint64_t v20 = a1 + 976;
    uint64_t v21 = a1 + 1136;
    caulk::concurrent::details::node_allocator<void *,caulk::alloc::detail::tracked_block,10ul,(caulk::concurrent::skiplist_options)0>::begin_traversal();
    uint64_t owner = caulk::alloc::tree_allocator<caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,16ul,6ul>>::find_owner(&v20, (unint64_t)a2);
    if (owner)
    {
      unint64_t v7 = owner;
      unint64_t v8 = (unsigned int *)(owner + 16);
      caulk::alloc::bitmap_allocator<caulk::alloc::embed_block_memory,16368ul,16ul,6ul>::deallocate((caulk::alloc::base_allocator *)(owner + 16), (unint64_t)a2, a3);
      unint64_t v9 = atomic_load((unsigned int *)(v7 + 4));
      if (v9 == -1)
      {
        unint64_t v9 = atomic_load(v8);
        if (v9 >= 0xFC)
        {
          unint64_t v9 = atomic_exchange((atomic_uchar *volatile)v7, 1u);
          if ((v9 & 1) == 0)
          {
            unint64_t v18 = v7;
            caulk::concurrent::skiplist<unsigned long,caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,16ul,6ul>::node_impl<caulk::alloc::tree_allocator<caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,16ul,6ul>>::node_header,caulk::alloc::embed_block_memory> *,5,(caulk::concurrent::skiplist_options)1>::emplace<caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,16ul,6ul>::node_impl<caulk::alloc::tree_allocator<caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,16ul,6ul>>::node_header,caulk::alloc::embed_block_memory> *>((unint64_t *)(a1 + 1264), v7 + 288, &v18);
            unint64_t v9 = v7 + 4;
            atomic_store(0, (unsigned int *)(v7 + 4));
            atomic_store(0, (unsigned __int8 *)v7);
          }
        }
      }
      caulk::concurrent::details::node_allocator<unsigned long,caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,256ul,6ul>::node_impl<caulk::alloc::tree_allocator<caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,256ul,6ul>>::node_header,caulk::alloc::embed_block_memory> *,5ul,(caulk::concurrent::skiplist_options)1>::end_traversal(v21, v9);
      return;
    }
LABEL_23:
    caulk::alloc::base_allocator::bad_dealloc((caulk::alloc::base_allocator *)owner);
  }
  if ((a3 - 1009) >> 4 > 0x3B0)
  {
    if ((caulk::concurrent::skiplist<void *,caulk::alloc::detail::tracked_block,10,(caulk::concurrent::skiplist_options)0>::remove(a1 + 16, (uint64_t)a2) & 1) == 0)
    {
      _os_assert_log();
      uint64_t owner = _os_crash();
      __break(1u);
      goto LABEL_23;
    }
    unint64_t v17 = *(void **)a1;
    caulk::alloc::details::caching_page_allocator_base::deallocate(v17, a2, a3);
  }
  else
  {
    unint64_t v18 = a1 + 368;
    uint64_t v19 = a1 + 528;
    caulk::concurrent::details::node_allocator<void *,caulk::alloc::detail::tracked_block,10ul,(caulk::concurrent::skiplist_options)0>::begin_traversal();
    unint64_t v10 = (caulk::alloc::base_allocator *)caulk::alloc::tree_allocator<caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,256ul,6ul>>::find_owner(&v18, (unint64_t)a2);
    if (!v10) {
      caulk::alloc::base_allocator::bad_dealloc(0);
    }
    unint64_t v11 = (unint64_t)v10;
    unint64_t v12 = (unint64_t)v10 + 256;
    if ((caulk::alloc::base_allocator *)((char *)v10 + 256) > a2
      || (unint64_t v13 = (unint64_t)a2 - v12, (((unint64_t)a2 - v12) >> 8) >= 0x3FuLL))
    {
      caulk::alloc::base_allocator::bad_dealloc(v10);
    }
    unint64_t v14 = (a3 + 255) >> 8;
    uint64_t v15 = (atomic_uint *)((char *)v10 + 16);
    unint64_t v20 = (unint64_t)v10 + 24;
    uint64_t v21 = 2;
    caulk::alloc::detail::state_bit_span::deallocate(&v20, v13 >> 8, v14);
    atomic_fetch_add(v15, v14);
    unint64_t v16 = atomic_load((unsigned int *)(v11 + 4));
    if (v16 == -1)
    {
      unint64_t v16 = atomic_load((unsigned int *)v15);
      if (v16 >= 0x10)
      {
        unint64_t v16 = atomic_exchange((atomic_uchar *volatile)v11, 1u);
        if ((v16 & 1) == 0)
        {
          unint64_t v20 = v11;
          caulk::concurrent::skiplist<unsigned long,caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,256ul,6ul>::node_impl<caulk::alloc::tree_allocator<caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,256ul,6ul>>::node_header,caulk::alloc::embed_block_memory> *,5,(caulk::concurrent::skiplist_options)1>::emplace<caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,256ul,6ul>::node_impl<caulk::alloc::tree_allocator<caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,256ul,6ul>>::node_header,caulk::alloc::embed_block_memory> *>((unint64_t *)(a1 + 656), v12, &v20);
          unint64_t v16 = v11 + 4;
          atomic_store(0, (unsigned int *)(v11 + 4));
          atomic_store(0, (unsigned __int8 *)v11);
        }
      }
    }
    caulk::concurrent::details::node_allocator<unsigned long,caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,256ul,6ul>::node_impl<caulk::alloc::tree_allocator<caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,256ul,6ul>>::node_header,caulk::alloc::embed_block_memory> *,5ul,(caulk::concurrent::skiplist_options)1>::end_traversal(v19, v16);
  }
}

void sub_210867834(_Unwind_Exception *a1@<X0>, unint64_t a2@<X8>)
{
  caulk::concurrent::details::node_allocator<unsigned long,caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,256ul,6ul>::node_impl<caulk::alloc::tree_allocator<caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,256ul,6ul>>::node_header,caulk::alloc::embed_block_memory> *,5ul,(caulk::concurrent::skiplist_options)1>::end_traversal(v2, a2);
  _Unwind_Resume(a1);
}

void *caulk::alloc::bitmap_allocator<caulk::alloc::embed_block_memory,16368ul,16ul,6ul>::deallocate(caulk::alloc::base_allocator *a1, unint64_t a2, uint64_t a3)
{
  if ((unint64_t)a1 + 272 > a2 || (unint64_t v3 = a2 - ((void)a1 + 272), ((v3 >> 5) & 0x7FFFFFFF) > 0x1F6)) {
    caulk::alloc::base_allocator::bad_dealloc(a1);
  }
  unint64_t v5 = v3 >> 4;
  if (!a3) {
    a3 = caulk::alloc::bitmap_allocator<caulk::alloc::embed_block_memory,16368ul,16ul,6ul>::size((uint64_t)a1, a2);
  }
  unint64_t v6 = (unint64_t)(a3 + 15) >> 4;
  v8[0] = (char *)a1 + 8;
  v8[1] = 32;
  unint64_t result = caulk::alloc::detail::state_bit_span::deallocate(v8, v5, v6);
  atomic_fetch_add((atomic_uint *volatile)a1, v6);
  if (*((_DWORD *)a1 + 1) > v5) {
    *((_DWORD *)a1 + 1) = v5;
  }
  return result;
}

void *caulk::alloc::detail::state_bit_span::deallocate(void *this, unint64_t a2, unsigned int a3)
{
  unint64_t v3 = a2 >> 5;
  size_t v4 = (unint64_t *)this[1];
  if ((unint64_t)v4 > v3)
  {
    size_t v4 = (unint64_t *)(*this + 8 * v3);
    unint64_t v5 = atomic_load(v4);
    uint64_t v6 = 1 << (a2 & 0x1F | 0x20);
    if ((v5 & v6) != 0)
    {
      char v7 = a2 & 0x1F;
      unsigned int v8 = 32 - (a2 & 0x1F);
      int v9 = v8 >= a3 ? a3 : 32 - (a2 & 0x1F);
      if (v9)
      {
        int v10 = 0;
        unint64_t v11 = v5 & ~v6;
        unint64_t v12 = (unint64_t *)(*this + 8 * v3 + 8);
        do
        {
          unint64_t v13 = 0xFFFFFFFFFFFFFFFFLL >> ~(v9 - 1) << v7;
          a2 = v13 | (v13 << 32);
          if ((a2 & v11) != v13) {
            break;
          }
          a2 = (v10 + 1);
          v16[v10] = ~(v13 | v6);
          if (a3 <= v8) {
            goto LABEL_16;
          }
          if (v12 == (unint64_t *)(*this + 8 * this[1])) {
            break;
          }
          uint64_t v6 = 0;
          char v7 = 0;
          a3 -= v9;
          unint64_t v11 = atomic_load(v12);
          unsigned int v8 = 32;
          int v9 = a3 >= 0x20 ? 32 : a3;
          ++v12;
          ++v10;
        }
        while (v9);
      }
    }
  }
  __break(1u);
LABEL_16:
  if (a2)
  {
    unint64_t v14 = a2 - 1;
    do
      atomic_fetch_and((atomic_ullong *volatile)&v4[v14], v16[v14]);
    while ((unint64_t)v14--);
  }
  return this;
}

uint64_t caulk::alloc::tiered_allocator<caulk::alloc::size_range_tier<0ul,1008ul,caulk::alloc::tree_allocator<caulk::alloc::chunk_allocator<caulk::alloc::page_allocator,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,16ul,6ul>>>,caulk::alloc::size_range_tier<1009ul,256000ul,caulk::alloc::guarded_edges_allocator<caulk::alloc::consolidating_free_map<caulk::alloc::page_allocator,10485760ul>,4ul>>,caulk::alloc::tracking_allocator<caulk::alloc::page_allocator>>::allocate(uint64_t a1, unint64_t a2, unint64_t a3)
{
  if (a2 <= 0x3F0 && a3 <= 0x10)
  {
    uint64_t v60 = a1 + 944;
    caulk::concurrent::details::node_allocator<void *,caulk::alloc::detail::tracked_block,10ul,(caulk::concurrent::skiplist_options)0>::begin_traversal();
    size_t v4 = (unint64_t *)(a1 + 1072);
    uint64_t v61 = a1 + 1232;
    caulk::concurrent::details::node_allocator<void *,caulk::alloc::detail::tracked_block,10ul,(caulk::concurrent::skiplist_options)0>::begin_traversal();
    unint64_t v5 = *(char **)(a1 + 1360);
    if (v5)
    {
      v64 = *(char **)(a1 + 1360);
      unint64_t v7 = caulk::concurrent::skiplist<unsigned long,caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,256ul,6ul>::node_impl<caulk::alloc::tree_allocator<caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,256ul,6ul>>::node_header,caulk::alloc::embed_block_memory> *,5,(caulk::concurrent::skiplist_options)1>::search_to_level<caulk::concurrent::skiplist<unsigned long,caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,256ul,6ul>::node_impl<caulk::alloc::tree_allocator<caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,256ul,6ul>>::node_header,caulk::alloc::embed_block_memory> *,5,(caulk::concurrent::skiplist_options)1>::key_le>(a1 + 1072, &v64, 0);
      if (*(char **)v7 != v5)
      {
        if (*(unsigned char *)(v6 + 18) == 2) {
          unint64_t v7 = a1 + 1184;
        }
        else {
          unint64_t v7 = v6;
        }
      }
    }
    else
    {
      unint64_t v32 = atomic_load((unint64_t *)(a1 + 1104));
      unint64_t v7 = v32 & 0xFFFFFFFFFFFFFFFCLL;
    }
    v62 = (unint64_t *)a1;
    unint64_t v33 = a1 + 1184;
    if (a1 + 1184 != v7)
    {
      unint64_t v34 = v7;
      do
      {
        if (*(unsigned char *)(v34 + 18) != 2)
        {
          char v35 = atomic_load((unint64_t *)(v34 + 32));
          if ((v35 & 1) == 0)
          {
            uint64_t v37 = *(void *)v34;
            v36 = *(char **)(v34 + 8);
            if ((atomic_exchange(v36, 1u) & 1) == 0)
            {
              uint64_t v38 = caulk::alloc::bitmap_allocator<caulk::alloc::embed_block_memory,16368ul,16ul,6ul>::allocate((unsigned int *)v36 + 4, a2);
              if (v38) {
                goto LABEL_83;
              }
              atomic_store(0xFFFFFFFF, (unsigned int *)v36 + 1);
              caulk::concurrent::skiplist<unsigned long,caulk::alloc::chunk_allocator<caulk::alloc::page_allocator,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,16ul,6ul>::node_impl<caulk::alloc::tree_allocator<caulk::alloc::chunk_allocator<caulk::alloc::page_allocator,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,16ul,6ul>>::node_header,caulk::alloc::embed_block_memory> *,5,(caulk::concurrent::skiplist_options)1>::remove((unint64_t)v4, v37);
              atomic_store(0, (unsigned __int8 *)v36);
            }
          }
        }
        unint64_t v39 = atomic_load((unint64_t *)(v34 + 32));
        unint64_t v34 = v39 & 0xFFFFFFFFFFFFFFFCLL;
      }
      while (v33 != (v39 & 0xFFFFFFFFFFFFFFFCLL));
    }
    if (*(unsigned char *)(v7 + 18) == 2 || (char v40 = atomic_load((unint64_t *)(v7 + 32)), (v40 & 1) != 0))
    {
      if (v5)
      {
        v64 = v5;
        unint64_t v7 = caulk::concurrent::skiplist<unsigned long,caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,256ul,6ul>::node_impl<caulk::alloc::tree_allocator<caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,256ul,6ul>>::node_header,caulk::alloc::embed_block_memory> *,5,(caulk::concurrent::skiplist_options)1>::search_to_level<caulk::concurrent::skiplist<unsigned long,caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,256ul,6ul>::node_impl<caulk::alloc::tree_allocator<caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,256ul,6ul>>::node_header,caulk::alloc::embed_block_memory> *,5,(caulk::concurrent::skiplist_options)1>::key_le>((unint64_t)v4, &v64, 0);
        if (*(char **)v7 != v5)
        {
          if (*(unsigned char *)(v41 + 18) == 2) {
            unint64_t v7 = v33;
          }
          else {
            unint64_t v7 = v41;
          }
        }
      }
      else
      {
        unint64_t v42 = atomic_load(v62 + 138);
        unint64_t v7 = v42 & 0xFFFFFFFFFFFFFFFCLL;
      }
    }
    unint64_t v43 = atomic_load(v62 + 138);
    unint64_t v44 = v43 & 0xFFFFFFFFFFFFFFFCLL;
    if (v7 != (v43 & 0xFFFFFFFFFFFFFFFCLL) && v33 != v44)
    {
      do
      {
        if (*(unsigned char *)(v44 + 18) != 2)
        {
          char v46 = atomic_load((unint64_t *)(v44 + 32));
          if ((v46 & 1) == 0)
          {
            uint64_t v37 = *(void *)v44;
            v36 = *(char **)(v44 + 8);
            if ((atomic_exchange(v36, 1u) & 1) == 0)
            {
              uint64_t v38 = caulk::alloc::bitmap_allocator<caulk::alloc::embed_block_memory,16368ul,16ul,6ul>::allocate((unsigned int *)v36 + 4, a2);
              if (v38) {
                goto LABEL_83;
              }
              atomic_store(0xFFFFFFFF, (unsigned int *)v36 + 1);
              caulk::concurrent::skiplist<unsigned long,caulk::alloc::chunk_allocator<caulk::alloc::page_allocator,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,16ul,6ul>::node_impl<caulk::alloc::tree_allocator<caulk::alloc::chunk_allocator<caulk::alloc::page_allocator,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,16ul,6ul>>::node_header,caulk::alloc::embed_block_memory> *,5,(caulk::concurrent::skiplist_options)1>::remove((unint64_t)v4, v37);
              atomic_store(0, (unsigned __int8 *)v36);
            }
          }
        }
        unint64_t v47 = atomic_load((unint64_t *)(v44 + 32));
        unint64_t v44 = v47 & 0xFFFFFFFFFFFFFFFCLL;
      }
      while (v7 != (v47 & 0xFFFFFFFFFFFFFFFCLL) && v33 != v44);
    }
    while (1)
    {
      do
      {
        v36 = (char *)caulk::alloc::page_allocator::allocate((caulk::alloc::page_allocator *)(v62 + 95), 0x4000, 0x10uLL);
        char *v36 = 0;
        *((_DWORD *)v36 + 1) = 0;
        *((_OWORD *)v36 + 1) = 0u;
        *((void *)v36 + 1) = v49;
        uint64_t v37 = (uint64_t)(v36 + 288);
        *((_OWORD *)v36 + 2) = 0u;
        *((_OWORD *)v36 + 3) = 0u;
        *((_OWORD *)v36 + 4) = 0u;
        *((_OWORD *)v36 + 5) = 0u;
        *((_OWORD *)v36 + 6) = 0u;
        *((_OWORD *)v36 + 7) = 0u;
        *((_OWORD *)v36 + 8) = 0u;
        *((_OWORD *)v36 + 9) = 0u;
        *((_OWORD *)v36 + 10) = 0u;
        *((_OWORD *)v36 + 11) = 0u;
        *((_OWORD *)v36 + 12) = 0u;
        *((_OWORD *)v36 + 13) = 0u;
        *((_OWORD *)v36 + 14) = 0u;
        *((_OWORD *)v36 + 15) = 0u;
        *((_OWORD *)v36 + 16) = 0u;
        *((void *)v36 + 34) = 0;
        caulk::alloc::base_allocator::assert_aligned((uint64_t)(v36 + 288), 16);
        *(_OWORD *)(v36 + 248) = 0u;
        *(_OWORD *)(v36 + 232) = 0u;
        *(_OWORD *)(v36 + 216) = 0u;
        *(_OWORD *)(v36 + 200) = 0u;
        *(_OWORD *)(v36 + 184) = 0u;
        *(_OWORD *)(v36 + 168) = 0u;
        *(_OWORD *)(v36 + 152) = 0u;
        *(_OWORD *)(v36 + 136) = 0u;
        *(_OWORD *)(v36 + 120) = 0u;
        *(_OWORD *)(v36 + 104) = 0u;
        *(_OWORD *)(v36 + 88) = 0u;
        *(_OWORD *)(v36 + 72) = 0u;
        *(_OWORD *)(v36 + 56) = 0u;
        *(_OWORD *)(v36 + 40) = 0u;
        *(_OWORD *)(v36 + 24) = 0u;
        *(_OWORD *)(v36 + 264) = 0u;
        atomic_store(0x3EEu, (unsigned int *)v36 + 4);
        atomic_store(0, (unsigned int *)v36 + 5);
        v64 = v36;
        caulk::concurrent::skiplist<unsigned long,caulk::alloc::chunk_allocator<caulk::alloc::page_allocator,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,16ul,6ul>::node_impl<caulk::alloc::tree_allocator<caulk::alloc::chunk_allocator<caulk::alloc::page_allocator,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,16ul,6ul>>::node_header,caulk::alloc::embed_block_memory> *,5,(caulk::concurrent::skiplist_options)1>::emplace<caulk::alloc::chunk_allocator<caulk::alloc::page_allocator,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,16ul,6ul>::node_impl<caulk::alloc::tree_allocator<caulk::alloc::chunk_allocator<caulk::alloc::page_allocator,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,16ul,6ul>>::node_header,caulk::alloc::embed_block_memory> *>(v62 + 98, (unint64_t)(v36 + 288), &v64);
        v64 = v36;
        caulk::concurrent::skiplist<unsigned long,caulk::alloc::chunk_allocator<caulk::alloc::page_allocator,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,16ul,6ul>::node_impl<caulk::alloc::tree_allocator<caulk::alloc::chunk_allocator<caulk::alloc::page_allocator,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,16ul,6ul>>::node_header,caulk::alloc::embed_block_memory> *,5,(caulk::concurrent::skiplist_options)1>::emplace<caulk::alloc::chunk_allocator<caulk::alloc::page_allocator,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,16ul,6ul>::node_impl<caulk::alloc::tree_allocator<caulk::alloc::chunk_allocator<caulk::alloc::page_allocator,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,16ul,6ul>>::node_header,caulk::alloc::embed_block_memory> *>(v4, (unint64_t)(v36 + 288), &v64);
      }
      while ((atomic_exchange(v36, 1u) & 1) != 0);
      uint64_t v38 = caulk::alloc::bitmap_allocator<caulk::alloc::embed_block_memory,16368ul,16ul,6ul>::allocate((unsigned int *)v36 + 4, a2);
      if (v38) {
        break;
      }
      atomic_store(0xFFFFFFFF, (unsigned int *)v36 + 1);
      caulk::concurrent::skiplist<unsigned long,caulk::alloc::chunk_allocator<caulk::alloc::page_allocator,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,16ul,6ul>::node_impl<caulk::alloc::tree_allocator<caulk::alloc::chunk_allocator<caulk::alloc::page_allocator,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,16ul,6ul>>::node_header,caulk::alloc::embed_block_memory> *,5,(caulk::concurrent::skiplist_options)1>::remove((unint64_t)v4, v37);
      atomic_store(0, (unsigned __int8 *)v36);
    }
LABEL_83:
    uint64_t v10 = v38;
    uint64_t v50 = v61;
    unint64_t v51 = (unint64_t)v62;
    v62[170] = v37;
    atomic_store(0, (unsigned __int8 *)v36);
    caulk::concurrent::details::node_allocator<unsigned long,caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,256ul,6ul>::node_impl<caulk::alloc::tree_allocator<caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,256ul,6ul>>::node_header,caulk::alloc::embed_block_memory> *,5ul,(caulk::concurrent::skiplist_options)1>::end_traversal(v50, v51);
    caulk::concurrent::details::node_allocator<unsigned long,caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,256ul,6ul>::node_impl<caulk::alloc::tree_allocator<caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,256ul,6ul>>::node_header,caulk::alloc::embed_block_memory> *,5ul,(caulk::concurrent::skiplist_options)1>::end_traversal(v60, v52);
    return v10;
  }
  if (a2 - 1009 > 0x3E40F || a3 > 0x10)
  {
    return caulk::alloc::tracking_allocator<caulk::alloc::page_allocator>::allocate((caulk::alloc::page_allocator *)a1, a2, a3);
  }
  unint64_t v8 = (a2 + 7) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v9 = (v8 + 79) & 0xFFFFFFFFFFFFFFF0;
  if ((uint64_t)v9 < 1) {
    return 0;
  }
  uint64_t v10 = 0;
  unint64_t v11 = (void *)MEMORY[0x263EF8AF8];
  if (v9 + 32 > ((unint64_t)(*MEMORY[0x263EF8AF8] + 10485759) & -*MEMORY[0x263EF8AF8])) {
    return v10;
  }
  unint64_t v12 = v8 + 64;
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 704));
  unint64_t v13 = *(void **)(a1 + 720);
  if (!v13) {
    goto LABEL_85;
  }
  unint64_t v14 = (uint64_t *)(a1 + 720);
  uint64_t v15 = (uint64_t *)(a1 + 720);
  unint64_t v16 = *(void **)(a1 + 720);
  do
  {
    unint64_t v17 = v16[4];
    BOOL v18 = v17 >= v9;
    if (v17 >= v9) {
      uint64_t v19 = v16;
    }
    else {
      uint64_t v19 = v16 + 1;
    }
    if (v18) {
      uint64_t v15 = v16;
    }
    unint64_t v16 = (void *)*v19;
  }
  while (*v19);
  if (v15 == v14) {
    goto LABEL_85;
  }
  unint64_t v20 = v15[4];
  if (v20 >= 2 * v9 || v20 - v9 <= v20 >> 3) {
    goto LABEL_41;
  }
  unint64_t v22 = 2 * v9;
  unint64_t v23 = (uint64_t *)(a1 + 720);
  do
  {
    unint64_t v24 = v13[4];
    BOOL v25 = v24 >= v22;
    if (v24 >= v22) {
      v26 = v13;
    }
    else {
      v26 = v13 + 1;
    }
    if (v25) {
      unint64_t v23 = v13;
    }
    unint64_t v13 = (void *)*v26;
  }
  while (*v26);
  if (v23 == v14 || ((unint64_t v27 = v23[4], v27 < v22) ? (v28 = v27 - v9 > v27 >> 3) : (v28 = 0), v28)) {
LABEL_41:
  }
    unint64_t v23 = v15;
  if (v23 == v14)
  {
LABEL_85:
    v53 = (void *)caulk::alloc::tracking_allocator<caulk::alloc::page_allocator>::allocate((caulk::alloc::page_allocator *)(a1 + 352), (*v11 + 10485759) & -*v11, 0x1000uLL);
    v55 = v53;
    if (v53)
    {
      *(void *)(a1 + 736) += v54;
      void *v53 = 0;
      v53[1] = 0;
      v53[2] = 0;
      v53[3] = 2 * v54 - 63;
      caulk::alloc::consolidating_free_map<caulk::alloc::page_allocator,10485760ul>::maybe_create_free_node(a1 + 352, (uint64_t)v53, v9);
      uint64_t v56 = (uint64_t)(v55 + 4);
    }
    else
    {
      uint64_t v56 = 0;
      unint64_t v12 = 0;
    }
    goto LABEL_91;
  }
  uint64_t v29 = v23[6];
  if (v29)
  {
    v30 = *(void **)(v29 + 8);
    v23[6] = (uint64_t)v30;
    if (v30)
    {
      void *v30 = v23 + 5;
    }
    else
    {
      std::__tree<std::__value_type<unsigned long,caulk::alloc::consolidating_free_map<caulk::alloc::page_allocator,10485760ul>::FreelistOfSize>,std::__map_value_compare<unsigned long,std::__value_type<unsigned long,caulk::alloc::consolidating_free_map<caulk::alloc::page_allocator,10485760ul>::FreelistOfSize>,std::less<unsigned long>,true>,std::allocator<std::__value_type<unsigned long,caulk::alloc::consolidating_free_map<caulk::alloc::page_allocator,10485760ul>::FreelistOfSize>>>::__remove_node_pointer((uint64_t **)(a1 + 712), v23);
      operator delete(v23);
    }
    caulk::alloc::consolidating_free_map<caulk::alloc::page_allocator,10485760ul>::maybe_create_free_node(a1 + 352, v29, v9);
    *(void *)(v29 + 16) &= ~1uLL;
    uint64_t v56 = v29 + 32;
LABEL_91:
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 704));
    if (v56) {
      uint64_t v10 = v56 + 32;
    }
    else {
      uint64_t v10 = 0;
    }
    if (v56) {
      unint64_t v57 = a2;
    }
    else {
      unint64_t v57 = v12;
    }
    if (v56)
    {
      uint64_t v58 = 0;
      uint64_t v59 = v10 ^ v57 ^ 0x3E9E8527D393999FLL;
      do
      {
        *(void *)(v10 - 32 + v58) = v59;
        *(void *)(v10 + ((v57 + 7) & 0xFFFFFFFFFFFFFFF8) + v58) = v59;
        v58 += 8;
      }
      while (v58 != 32);
    }
    return v10;
  }
  _os_assert_log();
  uint64_t result = _os_crash();
  __break(1u);
  return result;
}

void sub_210868020(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11)
{
  os_unfair_lock_unlock(v11);
  _Unwind_Resume(a1);
}

unint64_t *caulk::alloc::tiered_allocator<caulk::alloc::size_range_tier<0ul,1008ul,caulk::alloc::tree_allocator<caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,16ul,6ul>>>,caulk::alloc::size_range_tier<1009ul,16128ul,caulk::alloc::tree_allocator<caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,256ul,6ul>>>,caulk::alloc::tracking_allocator<caulk::alloc::global_page_cache>>::allocate(uint64_t a1, unint64_t a2, unint64_t a3)
{
  if (a2 <= 0x3F0 && a3 <= 0x10)
  {
    caulk::concurrent::details::node_allocator<void *,caulk::alloc::detail::tracked_block,10ul,(caulk::concurrent::skiplist_options)0>::begin_traversal();
    unint64_t v3 = (unint64_t *)(a1 + 1264);
    caulk::concurrent::details::node_allocator<void *,caulk::alloc::detail::tracked_block,10ul,(caulk::concurrent::skiplist_options)0>::begin_traversal();
    uint64_t v7 = *(void *)(a1 + 1552);
    uint64_t v57 = a1 + 1136;
    uint64_t v59 = a1 + 1424;
    uint64_t v56 = v7;
    if (v7)
    {
      *(void *)&long long v60 = *(void *)(a1 + 1552);
      unint64_t v9 = caulk::concurrent::skiplist<unsigned long,caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,256ul,6ul>::node_impl<caulk::alloc::tree_allocator<caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,256ul,6ul>>::node_header,caulk::alloc::embed_block_memory> *,5,(caulk::concurrent::skiplist_options)1>::search_to_level<caulk::concurrent::skiplist<unsigned long,caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,256ul,6ul>::node_impl<caulk::alloc::tree_allocator<caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,256ul,6ul>>::node_header,caulk::alloc::embed_block_memory> *,5,(caulk::concurrent::skiplist_options)1>::key_le>(a1 + 1264, &v60, 0);
      if (*(void *)v9 != v7)
      {
        if (*(unsigned char *)(v8 + 18) == 2) {
          unint64_t v9 = a1 + 1376;
        }
        else {
          unint64_t v9 = v8;
        }
      }
      goto LABEL_19;
    }
LABEL_18:
    unint64_t v15 = atomic_load((unint64_t *)(a1 + 1296));
    unint64_t v9 = v15 & 0xFFFFFFFFFFFFFFFCLL;
LABEL_19:
    uint64_t v16 = a1 + 1376;
    if (a1 + 1376 != v9)
    {
      unint64_t v17 = v9;
      do
      {
        if (*(unsigned char *)(v17 + 18) != 2)
        {
          char v18 = atomic_load((unint64_t *)(v17 + 32));
          if ((v18 & 1) == 0)
          {
            uint64_t v20 = *(void *)v17;
            uint64_t v19 = *(unint64_t **)(v17 + 8);
            if ((atomic_exchange((atomic_uchar *volatile)v19, 1u) & 1) == 0)
            {
              uint64_t v21 = caulk::alloc::bitmap_allocator<caulk::alloc::embed_block_memory,16368ul,16ul,6ul>::allocate((unsigned int *)v19 + 4, a2);
              if (v21) {
                goto LABEL_52;
              }
              atomic_store(0xFFFFFFFF, (unsigned int *)v19 + 1);
              caulk::concurrent::skiplist<unsigned long,caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,16ul,6ul>::node_impl<caulk::alloc::tree_allocator<caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,16ul,6ul>>::node_header,caulk::alloc::embed_block_memory> *,5,(caulk::concurrent::skiplist_options)1>::remove((unint64_t)v3, v20);
              atomic_store(0, (unsigned __int8 *)v19);
            }
          }
        }
        unint64_t v23 = atomic_load((unint64_t *)(v17 + 32));
        unint64_t v17 = v23 & 0xFFFFFFFFFFFFFFFCLL;
      }
      while (v16 != (v23 & 0xFFFFFFFFFFFFFFFCLL));
    }
    if (*(unsigned char *)(v9 + 18) == 2 || (char v24 = atomic_load((unint64_t *)(v9 + 32)), (v24 & 1) != 0))
    {
      if (v56)
      {
        *(void *)&long long v60 = v56;
        unint64_t v9 = caulk::concurrent::skiplist<unsigned long,caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,256ul,6ul>::node_impl<caulk::alloc::tree_allocator<caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,256ul,6ul>>::node_header,caulk::alloc::embed_block_memory> *,5,(caulk::concurrent::skiplist_options)1>::search_to_level<caulk::concurrent::skiplist<unsigned long,caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,256ul,6ul>::node_impl<caulk::alloc::tree_allocator<caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,256ul,6ul>>::node_header,caulk::alloc::embed_block_memory> *,5,(caulk::concurrent::skiplist_options)1>::key_le>((unint64_t)v3, &v60, 0);
        if (*(void *)v9 != v56)
        {
          if (*(unsigned char *)(v25 + 18) == 2) {
            unint64_t v9 = a1 + 1376;
          }
          else {
            unint64_t v9 = v25;
          }
        }
      }
      else
      {
        unint64_t v26 = atomic_load((unint64_t *)(a1 + 1296));
        unint64_t v9 = v26 & 0xFFFFFFFFFFFFFFFCLL;
      }
    }
    unint64_t v27 = atomic_load((unint64_t *)(a1 + 1296));
    unint64_t v28 = v27 & 0xFFFFFFFFFFFFFFFCLL;
    if (v9 != (v27 & 0xFFFFFFFFFFFFFFFCLL) && v16 != v28)
    {
      do
      {
        if (*(unsigned char *)(v28 + 18) != 2)
        {
          char v30 = atomic_load((unint64_t *)(v28 + 32));
          if ((v30 & 1) == 0)
          {
            uint64_t v20 = *(void *)v28;
            uint64_t v19 = *(unint64_t **)(v28 + 8);
            if ((atomic_exchange((atomic_uchar *volatile)v19, 1u) & 1) == 0)
            {
              uint64_t v21 = caulk::alloc::bitmap_allocator<caulk::alloc::embed_block_memory,16368ul,16ul,6ul>::allocate((unsigned int *)v19 + 4, a2);
              if (v21) {
                goto LABEL_52;
              }
              atomic_store(0xFFFFFFFF, (unsigned int *)v19 + 1);
              caulk::concurrent::skiplist<unsigned long,caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,16ul,6ul>::node_impl<caulk::alloc::tree_allocator<caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,16ul,6ul>>::node_header,caulk::alloc::embed_block_memory> *,5,(caulk::concurrent::skiplist_options)1>::remove((unint64_t)v3, v20);
              atomic_store(0, (unsigned __int8 *)v19);
            }
          }
        }
        unint64_t v31 = atomic_load((unint64_t *)(v28 + 32));
        unint64_t v28 = v31 & 0xFFFFFFFFFFFFFFFCLL;
      }
      while (v9 != (v31 & 0xFFFFFFFFFFFFFFFCLL) && v16 != v28);
    }
    while (1)
    {
      do
      {
        uint64_t v19 = caulk::alloc::details::caching_page_allocator_base::allocate(*(caulk::alloc::details::caching_page_allocator_base **)(a1 + 968), 0x4000, 0x10uLL);
        *(unsigned char *)uint64_t v19 = 0;
        *((_DWORD *)v19 + 1) = 0;
        *((_OWORD *)v19 + 1) = 0u;
        v19[1] = v33;
        uint64_t v20 = (uint64_t)(v19 + 36);
        *((_OWORD *)v19 + 2) = 0u;
        *((_OWORD *)v19 + 3) = 0u;
        *((_OWORD *)v19 + 4) = 0u;
        *((_OWORD *)v19 + 5) = 0u;
        *((_OWORD *)v19 + 6) = 0u;
        *((_OWORD *)v19 + 7) = 0u;
        *((_OWORD *)v19 + 8) = 0u;
        *((_OWORD *)v19 + 9) = 0u;
        *((_OWORD *)v19 + 10) = 0u;
        *((_OWORD *)v19 + 11) = 0u;
        *((_OWORD *)v19 + 12) = 0u;
        *((_OWORD *)v19 + 13) = 0u;
        *((_OWORD *)v19 + 14) = 0u;
        *((_OWORD *)v19 + 15) = 0u;
        *((_OWORD *)v19 + 16) = 0u;
        v19[34] = 0;
        caulk::alloc::base_allocator::assert_aligned((uint64_t)(v19 + 36), 16);
        *(_OWORD *)(v19 + 31) = 0u;
        *(_OWORD *)(v19 + 29) = 0u;
        *(_OWORD *)(v19 + 27) = 0u;
        *(_OWORD *)(v19 + 25) = 0u;
        *(_OWORD *)(v19 + 23) = 0u;
        *(_OWORD *)(v19 + 21) = 0u;
        *(_OWORD *)(v19 + 19) = 0u;
        *(_OWORD *)(v19 + 17) = 0u;
        *(_OWORD *)(v19 + 15) = 0u;
        *(_OWORD *)(v19 + 13) = 0u;
        *(_OWORD *)(v19 + 11) = 0u;
        *(_OWORD *)(v19 + 9) = 0u;
        *(_OWORD *)(v19 + 7) = 0u;
        *(_OWORD *)(v19 + 5) = 0u;
        *(_OWORD *)(v19 + 3) = 0u;
        *(_OWORD *)(v19 + 33) = 0u;
        atomic_store(0x3EEu, (unsigned int *)v19 + 4);
        atomic_store(0, (unsigned int *)v19 + 5);
        *(void *)&long long v60 = v19;
        caulk::concurrent::skiplist<unsigned long,caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,16ul,6ul>::node_impl<caulk::alloc::tree_allocator<caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,16ul,6ul>>::node_header,caulk::alloc::embed_block_memory> *,5,(caulk::concurrent::skiplist_options)1>::emplace<caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,16ul,6ul>::node_impl<caulk::alloc::tree_allocator<caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,16ul,6ul>>::node_header,caulk::alloc::embed_block_memory> *>((unint64_t *)(a1 + 976), (unint64_t)(v19 + 36), &v60);
        *(void *)&long long v60 = v19;
        caulk::concurrent::skiplist<unsigned long,caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,16ul,6ul>::node_impl<caulk::alloc::tree_allocator<caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,16ul,6ul>>::node_header,caulk::alloc::embed_block_memory> *,5,(caulk::concurrent::skiplist_options)1>::emplace<caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,16ul,6ul>::node_impl<caulk::alloc::tree_allocator<caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,16ul,6ul>>::node_header,caulk::alloc::embed_block_memory> *>(v3, (unint64_t)(v19 + 36), &v60);
      }
      while ((atomic_exchange((atomic_uchar *volatile)v19, 1u) & 1) != 0);
      uint64_t v21 = caulk::alloc::bitmap_allocator<caulk::alloc::embed_block_memory,16368ul,16ul,6ul>::allocate((unsigned int *)v19 + 4, a2);
      if (v21) {
        break;
      }
      atomic_store(0xFFFFFFFF, (unsigned int *)v19 + 1);
      caulk::concurrent::skiplist<unsigned long,caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,16ul,6ul>::node_impl<caulk::alloc::tree_allocator<caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,16ul,6ul>>::node_header,caulk::alloc::embed_block_memory> *,5,(caulk::concurrent::skiplist_options)1>::remove((unint64_t)v3, v20);
      atomic_store(0, (unsigned __int8 *)v19);
    }
LABEL_52:
    unint64_t v14 = (unint64_t *)v21;
    *(void *)(a1 + 1552) = v20;
    atomic_store(0, (unsigned __int8 *)v19);
    caulk::concurrent::details::node_allocator<unsigned long,caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,256ul,6ul>::node_impl<caulk::alloc::tree_allocator<caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,256ul,6ul>>::node_header,caulk::alloc::embed_block_memory> *,5ul,(caulk::concurrent::skiplist_options)1>::end_traversal(v59, v22);
    caulk::concurrent::details::node_allocator<unsigned long,caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,256ul,6ul>::node_impl<caulk::alloc::tree_allocator<caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,256ul,6ul>>::node_header,caulk::alloc::embed_block_memory> *,5ul,(caulk::concurrent::skiplist_options)1>::end_traversal(v57, v34);
    return v14;
  }
  if ((a2 - 1009) >> 4 > 0x3B0 || a3 > 0x100)
  {
    unint64_t v14 = caulk::alloc::details::caching_page_allocator_base::allocate(*(caulk::alloc::details::caching_page_allocator_base **)a1, a2, a3);
    if (!v14) {
      return v14;
    }
    *(void *)&long long v60 = v13;
    *((void *)&v60 + 1) = a3;
    if (caulk::concurrent::skiplist<void *,caulk::alloc::detail::tracked_block,10,(caulk::concurrent::skiplist_options)0>::emplace<caulk::alloc::detail::tracked_block>(a1 + 16, (unint64_t)v14, &v60))return v14; {
    _os_assert_log();
    }
    _os_crash();
    __break(1u);
    goto LABEL_18;
  }
  uint64_t v58 = a1 + 528;
  caulk::concurrent::details::node_allocator<void *,caulk::alloc::detail::tracked_block,10ul,(caulk::concurrent::skiplist_options)0>::begin_traversal();
  caulk::concurrent::details::node_allocator<void *,caulk::alloc::detail::tracked_block,10ul,(caulk::concurrent::skiplist_options)0>::begin_traversal();
  uint64_t v10 = *(void *)(a1 + 944);
  if (v10)
  {
    *(void *)&long long v60 = *(void *)(a1 + 944);
    unint64_t v12 = caulk::concurrent::skiplist<unsigned long,caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,256ul,6ul>::node_impl<caulk::alloc::tree_allocator<caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,256ul,6ul>>::node_header,caulk::alloc::embed_block_memory> *,5,(caulk::concurrent::skiplist_options)1>::search_to_level<caulk::concurrent::skiplist<unsigned long,caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,256ul,6ul>::node_impl<caulk::alloc::tree_allocator<caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,256ul,6ul>>::node_header,caulk::alloc::embed_block_memory> *,5,(caulk::concurrent::skiplist_options)1>::key_le>(a1 + 656, &v60, 0);
    if (*(void *)v12 != v10)
    {
      if (*(unsigned char *)(v11 + 18) == 2) {
        unint64_t v12 = a1 + 768;
      }
      else {
        unint64_t v12 = v11;
      }
    }
  }
  else
  {
    unint64_t v35 = atomic_load((unint64_t *)(a1 + 688));
    unint64_t v12 = v35 & 0xFFFFFFFFFFFFFFFCLL;
  }
  uint64_t v36 = a1 + 768;
  if (a1 + 768 != v12)
  {
    unint64_t v37 = v12;
    do
    {
      if (*(unsigned char *)(v37 + 18) != 2)
      {
        char v38 = atomic_load((unint64_t *)(v37 + 32));
        if ((v38 & 1) == 0)
        {
          uint64_t v40 = *(void *)v37;
          unint64_t v39 = *(unint64_t **)(v37 + 8);
          if ((atomic_exchange((atomic_uchar *volatile)v39, 1u) & 1) == 0)
          {
            unint64_t v41 = caulk::alloc::bitmap_allocator<caulk::alloc::embed_block_memory,16368ul,256ul,6ul>::allocate((unsigned int *)v39 + 4, a2);
            if (v41) {
              goto LABEL_87;
            }
            atomic_store(0xFFFFFFFF, (unsigned int *)v39 + 1);
            caulk::concurrent::skiplist<unsigned long,caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,256ul,6ul>::node_impl<caulk::alloc::tree_allocator<caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,256ul,6ul>>::node_header,caulk::alloc::embed_block_memory> *,5,(caulk::concurrent::skiplist_options)1>::remove(a1 + 656, v40);
            atomic_store(0, (unsigned __int8 *)v39);
          }
        }
      }
      unint64_t v43 = atomic_load((unint64_t *)(v37 + 32));
      unint64_t v37 = v43 & 0xFFFFFFFFFFFFFFFCLL;
    }
    while (v36 != (v43 & 0xFFFFFFFFFFFFFFFCLL));
  }
  if (*(unsigned char *)(v12 + 18) == 2 || (char v44 = atomic_load((unint64_t *)(v12 + 32)), (v44 & 1) != 0))
  {
    if (v10)
    {
      *(void *)&long long v60 = v10;
      unint64_t v12 = caulk::concurrent::skiplist<unsigned long,caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,256ul,6ul>::node_impl<caulk::alloc::tree_allocator<caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,256ul,6ul>>::node_header,caulk::alloc::embed_block_memory> *,5,(caulk::concurrent::skiplist_options)1>::search_to_level<caulk::concurrent::skiplist<unsigned long,caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,256ul,6ul>::node_impl<caulk::alloc::tree_allocator<caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,256ul,6ul>>::node_header,caulk::alloc::embed_block_memory> *,5,(caulk::concurrent::skiplist_options)1>::key_le>(a1 + 656, &v60, 0);
      if (*(void *)v12 != v10)
      {
        if (*(unsigned char *)(v45 + 18) == 2) {
          unint64_t v12 = a1 + 768;
        }
        else {
          unint64_t v12 = v45;
        }
      }
    }
    else
    {
      unint64_t v46 = atomic_load((unint64_t *)(a1 + 688));
      unint64_t v12 = v46 & 0xFFFFFFFFFFFFFFFCLL;
    }
  }
  unint64_t v47 = atomic_load((unint64_t *)(a1 + 688));
  unint64_t v48 = v47 & 0xFFFFFFFFFFFFFFFCLL;
  if (v12 != (v47 & 0xFFFFFFFFFFFFFFFCLL) && v36 != v48)
  {
    do
    {
      if (*(unsigned char *)(v48 + 18) != 2)
      {
        char v50 = atomic_load((unint64_t *)(v48 + 32));
        if ((v50 & 1) == 0)
        {
          uint64_t v40 = *(void *)v48;
          unint64_t v39 = *(unint64_t **)(v48 + 8);
          if ((atomic_exchange((atomic_uchar *volatile)v39, 1u) & 1) == 0)
          {
            unint64_t v41 = caulk::alloc::bitmap_allocator<caulk::alloc::embed_block_memory,16368ul,256ul,6ul>::allocate((unsigned int *)v39 + 4, a2);
            if (v41) {
              goto LABEL_87;
            }
            atomic_store(0xFFFFFFFF, (unsigned int *)v39 + 1);
            caulk::concurrent::skiplist<unsigned long,caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,256ul,6ul>::node_impl<caulk::alloc::tree_allocator<caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,256ul,6ul>>::node_header,caulk::alloc::embed_block_memory> *,5,(caulk::concurrent::skiplist_options)1>::remove(a1 + 656, v40);
            atomic_store(0, (unsigned __int8 *)v39);
          }
        }
      }
      unint64_t v51 = atomic_load((unint64_t *)(v48 + 32));
      unint64_t v48 = v51 & 0xFFFFFFFFFFFFFFFCLL;
    }
    while (v12 != (v51 & 0xFFFFFFFFFFFFFFFCLL) && v36 != v48);
  }
  while (1)
  {
    do
    {
      unint64_t v39 = caulk::alloc::details::caching_page_allocator_base::allocate(*(caulk::alloc::details::caching_page_allocator_base **)(a1 + 360), 0x4000, 0x10uLL);
      *(unsigned char *)unint64_t v39 = 0;
      *((_DWORD *)v39 + 1) = 0;
      v39[1] = v53;
      *((_OWORD *)v39 + 1) = 0u;
      uint64_t v40 = (uint64_t)(v39 + 32);
      *((_OWORD *)v39 + 2) = 0u;
      *((_OWORD *)v39 + 3) = 0u;
      *((_OWORD *)v39 + 4) = 0u;
      *((_OWORD *)v39 + 5) = 0u;
      *((_OWORD *)v39 + 6) = 0u;
      *((_OWORD *)v39 + 7) = 0u;
      *((_OWORD *)v39 + 8) = 0u;
      *((_OWORD *)v39 + 9) = 0u;
      *((_OWORD *)v39 + 10) = 0u;
      *((_OWORD *)v39 + 11) = 0u;
      *((_OWORD *)v39 + 12) = 0u;
      *((_OWORD *)v39 + 13) = 0u;
      *((_OWORD *)v39 + 14) = 0u;
      v39[30] = 0;
      caulk::alloc::base_allocator::assert_aligned((uint64_t)(v39 + 32), 256);
      v39[3] = 0;
      v39[4] = 0;
      atomic_store(0x3Fu, (unsigned int *)v39 + 4);
      atomic_store(0, (unsigned int *)v39 + 5);
      *(void *)&long long v60 = v39;
      caulk::concurrent::skiplist<unsigned long,caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,256ul,6ul>::node_impl<caulk::alloc::tree_allocator<caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,256ul,6ul>>::node_header,caulk::alloc::embed_block_memory> *,5,(caulk::concurrent::skiplist_options)1>::emplace<caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,256ul,6ul>::node_impl<caulk::alloc::tree_allocator<caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,256ul,6ul>>::node_header,caulk::alloc::embed_block_memory> *>((unint64_t *)(a1 + 368), (unint64_t)(v39 + 32), &v60);
      *(void *)&long long v60 = v39;
      caulk::concurrent::skiplist<unsigned long,caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,256ul,6ul>::node_impl<caulk::alloc::tree_allocator<caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,256ul,6ul>>::node_header,caulk::alloc::embed_block_memory> *,5,(caulk::concurrent::skiplist_options)1>::emplace<caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,256ul,6ul>::node_impl<caulk::alloc::tree_allocator<caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,256ul,6ul>>::node_header,caulk::alloc::embed_block_memory> *>((unint64_t *)(a1 + 656), (unint64_t)(v39 + 32), &v60);
    }
    while ((atomic_exchange((atomic_uchar *volatile)v39, 1u) & 1) != 0);
    unint64_t v41 = caulk::alloc::bitmap_allocator<caulk::alloc::embed_block_memory,16368ul,256ul,6ul>::allocate((unsigned int *)v39 + 4, a2);
    if (v41) {
      break;
    }
    atomic_store(0xFFFFFFFF, (unsigned int *)v39 + 1);
    caulk::concurrent::skiplist<unsigned long,caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,256ul,6ul>::node_impl<caulk::alloc::tree_allocator<caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,256ul,6ul>>::node_header,caulk::alloc::embed_block_memory> *,5,(caulk::concurrent::skiplist_options)1>::remove(a1 + 656, v40);
    atomic_store(0, (unsigned __int8 *)v39);
  }
LABEL_87:
  unint64_t v14 = (unint64_t *)v41;
  *(void *)(a1 + 944) = v40;
  atomic_store(0, (unsigned __int8 *)v39);
  caulk::concurrent::details::node_allocator<unsigned long,caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,256ul,6ul>::node_impl<caulk::alloc::tree_allocator<caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,256ul,6ul>>::node_header,caulk::alloc::embed_block_memory> *,5ul,(caulk::concurrent::skiplist_options)1>::end_traversal(a1 + 816, v42);
  caulk::concurrent::details::node_allocator<unsigned long,caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,256ul,6ul>::node_impl<caulk::alloc::tree_allocator<caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,256ul,6ul>>::node_header,caulk::alloc::embed_block_memory> *,5ul,(caulk::concurrent::skiplist_options)1>::end_traversal(v58, v54);
  return v14;
}

void sub_2108686EC(_Unwind_Exception *a1@<X0>, unint64_t a2@<X8>, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  caulk::concurrent::details::node_allocator<unsigned long,caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,256ul,6ul>::node_impl<caulk::alloc::tree_allocator<caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,256ul,6ul>>::node_header,caulk::alloc::embed_block_memory> *,5ul,(caulk::concurrent::skiplist_options)1>::end_traversal(a6, a2);
  caulk::concurrent::details::node_allocator<unsigned long,caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,256ul,6ul>::node_impl<caulk::alloc::tree_allocator<caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,256ul,6ul>>::node_header,caulk::alloc::embed_block_memory> *,5ul,(caulk::concurrent::skiplist_options)1>::end_traversal(a5, v7);
  _Unwind_Resume(a1);
}

void caulk::concurrent::details::node_allocator<void *,caulk::alloc::detail::tracked_block,10ul,(caulk::concurrent::skiplist_options)0>::begin_traversal()
{
  _X4 = 0;
  _X5 = 0;
  __asm { CASPAL          X4, X5, X4, X5, [X0] }
  _X6 = _X4;
  _X3 = 0;
  __asm { CASPAL          X2, X3, X6, X7, [X0] }
  if (_X2 != _X4)
  {
    do
    {
      _X4 = _X2;
      _X7 = 0;
      __asm { CASPAL          X6, X7, X4, X5, [X0] }
      uint64_t v13 = _X6 ^ _X2;
      _X2 = _X6;
    }
    while (v13);
  }
}

uint64_t caulk::concurrent::details::node_allocator<unsigned long,caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,256ul,6ul>::node_impl<caulk::alloc::tree_allocator<caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,256ul,6ul>>::node_header,caulk::alloc::embed_block_memory> *,5ul,(caulk::concurrent::skiplist_options)1>::end_traversal@<X0>(uint64_t result@<X0>, unint64_t a2@<X8>)
{
  _X2 = 0;
  _X3 = 0;
  __asm { CASPAL          X2, X3, X2, X3, [X0] }
  unint64_t v9 = 0;
  for (uint64_t i = _X2; ; uint64_t i = _X2)
  {
    uint64_t v11 = (_X3 - 1);
    a2 = a2 & 0xFFFFFFFF00000000 | v11;
    _X6 = (int)_X3 <= 1 ? 0 : i;
    _X3 = _X3 | (v9 << 32);
    __asm { CASPAL          X2, X3, X6, X7, [X0] }
    if (_X2 == i) {
      break;
    }
    unint64_t v9 = HIDWORD(_X3);
  }
  if (!v11)
  {
    if (i) {
      return caulk::concurrent::details::node_allocator<unsigned long,caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,256ul,6ul>::node_impl<caulk::alloc::tree_allocator<caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,256ul,6ul>>::node_header,caulk::alloc::embed_block_memory> *,5ul,(caulk::concurrent::skiplist_options)1>::free_node_chain(result, i);
    }
  }
  return result;
}

uint64_t caulk::alloc::tree_allocator<caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,16ul,6ul>>::find_owner(unint64_t *a1, unint64_t a2)
{
  unint64_t v4 = *a1;
  unint64_t v10 = a2;
  unint64_t v5 = caulk::concurrent::skiplist<unsigned long,caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,256ul,6ul>::node_impl<caulk::alloc::tree_allocator<caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,256ul,6ul>>::node_header,caulk::alloc::embed_block_memory> *,5,(caulk::concurrent::skiplist_options)1>::search_to_level<caulk::concurrent::skiplist<unsigned long,caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,256ul,6ul>::node_impl<caulk::alloc::tree_allocator<caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,256ul,6ul>>::node_header,caulk::alloc::embed_block_memory> *,5,(caulk::concurrent::skiplist_options)1>::key_le>(v4, &v10, 0);
  if (*(unsigned char *)(v5 + 18) == 1) {
    uint64_t v6 = *a1 + 112;
  }
  else {
    uint64_t v6 = v5;
  }
  if (*a1 + 112 == v6) {
    return 0;
  }
  if (*(unsigned char *)(v6 + 18) == 2) {
    return 0;
  }
  char v7 = atomic_load((unint64_t *)(v6 + 32));
  if (v7) {
    return 0;
  }
  uint64_t result = *(void *)(v6 + 8);
  if (a2 < result + 288 || a2 >= result + 0x4000) {
    return 0;
  }
  return result;
}

unint64_t caulk::concurrent::skiplist<unsigned long,caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,256ul,6ul>::node_impl<caulk::alloc::tree_allocator<caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,256ul,6ul>>::node_header,caulk::alloc::embed_block_memory> *,5,(caulk::concurrent::skiplist_options)1>::search_to_level<caulk::concurrent::skiplist<unsigned long,caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,256ul,6ul>::node_impl<caulk::alloc::tree_allocator<caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,256ul,6ul>>::node_header,caulk::alloc::embed_block_memory> *,5,(caulk::concurrent::skiplist_options)1>::key_le>(unint64_t a1, void *a2, unint64_t a3)
{
  unint64_t v6 = -1;
  uint64_t v7 = 48;
  do
  {
    do
    {
      ++v6;
      unint64_t v8 = atomic_load((unint64_t *)(a1 + v7));
      v7 += 16;
    }
    while (v6 < a3);
  }
  while (*(unsigned char *)((v8 & 0xFFFFFFFFFFFFFFFCLL) + 18) != 2);
  unint64_t v9 = a1;
  if (v6 > a3)
  {
    unint64_t v9 = a1;
    do
      unint64_t v9 = caulk::concurrent::skiplist<unsigned long,caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,256ul,6ul>::node_impl<caulk::alloc::tree_allocator<caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,256ul,6ul>>::node_header,caulk::alloc::embed_block_memory> *,5,(caulk::concurrent::skiplist_options)1>::search_right<caulk::concurrent::skiplist<unsigned long,caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,256ul,6ul>::node_impl<caulk::alloc::tree_allocator<caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,256ul,6ul>>::node_header,caulk::alloc::embed_block_memory> *,5,(caulk::concurrent::skiplist_options)1>::key_le &>(a1, v6--, v9, a2);
    while (v6 > a3);
  }

  return caulk::concurrent::skiplist<unsigned long,caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,256ul,6ul>::node_impl<caulk::alloc::tree_allocator<caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,256ul,6ul>>::node_header,caulk::alloc::embed_block_memory> *,5,(caulk::concurrent::skiplist_options)1>::search_right<caulk::concurrent::skiplist<unsigned long,caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,256ul,6ul>::node_impl<caulk::alloc::tree_allocator<caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,256ul,6ul>>::node_header,caulk::alloc::embed_block_memory> *,5,(caulk::concurrent::skiplist_options)1>::key_le &>(a1, a3, v9, a2);
}

unint64_t caulk::concurrent::skiplist<unsigned long,caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,256ul,6ul>::node_impl<caulk::alloc::tree_allocator<caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,256ul,6ul>>::node_header,caulk::alloc::embed_block_memory> *,5,(caulk::concurrent::skiplist_options)1>::search_right<caulk::concurrent::skiplist<unsigned long,caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,256ul,6ul>::node_impl<caulk::alloc::tree_allocator<caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,256ul,6ul>>::node_header,caulk::alloc::embed_block_memory> *,5,(caulk::concurrent::skiplist_options)1>::key_le &>(unint64_t a1, uint64_t a2, unint64_t a3, void *a4)
{
  unint64_t v4 = a3;
  unint64_t v5 = atomic_load((unint64_t *)(a3 + 16 * a2 + 32));
  unint64_t v6 = v5 & 0xFFFFFFFFFFFFFFFCLL;
  if (*a4 >= *(void *)(v5 & 0xFFFFFFFFFFFFFFFCLL))
  {
    do
    {
      char v10 = atomic_load((unint64_t *)(v6 + 32));
      if (v10)
      {
        unint64_t v4 = caulk::concurrent::skiplist<unsigned long,caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,256ul,6ul>::node_impl<caulk::alloc::tree_allocator<caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,256ul,6ul>>::node_header,caulk::alloc::embed_block_memory> *,5,(caulk::concurrent::skiplist_options)1>::try_flag_node(a1, a2, v4, v6);
        if (!v11) {
          caulk::concurrent::skiplist<unsigned long,caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,256ul,6ul>::node_impl<caulk::alloc::tree_allocator<caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,256ul,6ul>>::node_header,caulk::alloc::embed_block_memory> *,5,(caulk::concurrent::skiplist_options)1>::help_flagged(a1, a2, v4, v6);
        }
      }
      else
      {
        unint64_t v4 = v6;
      }
      unint64_t v12 = atomic_load((unint64_t *)(v4 + 16 * a2 + 32));
      unint64_t v6 = v12 & 0xFFFFFFFFFFFFFFFCLL;
    }
    while (*a4 >= *(void *)(v12 & 0xFFFFFFFFFFFFFFFCLL));
  }
  return v4;
}

uint64_t caulk::alloc::bitmap_allocator<caulk::alloc::embed_block_memory,16368ul,16ul,6ul>::allocate(unsigned int *a1, uint64_t a2)
{
  unint64_t v2 = (unint64_t)(a2 + 15) >> 4;
  unsigned int v3 = atomic_load(a1);
  if (v3 < v2) {
    return 0;
  }
  unsigned int v5 = a1[1];
  uint64_t v6 = (uint64_t)(a1 + 2);
  do
  {
    unsigned int v7 = v5;
    int v8 = caulk::alloc::detail::state_bit_span::allocate(v6, 0x20uLL, v5, 0x3EDu, v2, 0x3EEu);
    if (!v7) {
      break;
    }
    unsigned int v5 = 0;
  }
  while (v8 == -1);
  if (v8 < 0) {
    return 0;
  }
  atomic_fetch_add((atomic_uint *volatile)a1, -(int)v2);
  unsigned int v9 = v8 + v2;
  if ((v8 + v2) > 0x3ED) {
    unsigned int v9 = 0;
  }
  if (v9 != v7) {
    a1[1] = v9;
  }
  return (uint64_t)&a1[4 * v8 + 68];
}

uint64_t caulk::alloc::detail::state_bit_span::allocate(uint64_t this, unint64_t a2, unsigned int a3, unsigned int a4, unsigned int a5, unsigned int a6)
{
  if (a3 > a4 || (unint64_t v6 = a3 >> 5, v6 >= a2) || (v7 = a4 >> 5, v7 >= a2))
  {
LABEL_45:
    __break(1u);
    return this;
  }
  uint64_t v8 = this;
  this = 0xFFFFFFFFLL;
  if (v6 <= v7)
  {
    unsigned int v9 = 0;
    unsigned int v10 = 0;
    atomic_ullong v11 = 0;
    atomic_ullong v12 = 0;
    unsigned int v13 = a3 & 0xFFFFFFE0;
    unint64_t v14 = v8 + 8 * v7;
    unint64_t v15 = (atomic_ullong *)(v8 + 8 * v6);
    while (1)
    {
      atomic_ullong v16 = *v15;
      this = __clz(__rbit32(*v15));
      BOOL v17 = !this || v9 == 0;
      if (!v17 && v9 + v10 + this >= a5) {
        break;
      }
      if (a5 <= 0x20)
      {
        int v20 = 0;
        unsigned int v21 = 0xFFFFFFFF >> -(char)a5;
        while ((v21 & v16) != 0)
        {
          signed int v22 = __clz(v21 & v16);
          v21 <<= 32 - v22 - v20;
          int v20 = 32 - v22;
          if (v22 < (int)a5)
          {
            if (v16) {
              goto LABEL_15;
            }
            goto LABEL_20;
          }
        }
        this = v20 + v13;
        if (this + a5 >= a6) {
          return 0xFFFFFFFFLL;
        }
        unint64_t v23 = (~(-1 << a5) << v20) | v16 | (1 << (v20 + 32));
        atomic_ullong v24 = *v15;
        atomic_compare_exchange_strong(v15, (unint64_t *)&v24, v23);
        if (v24 != v16)
        {
          unsigned int v9 = 0;
          unsigned int v19 = 0;
          atomic_ullong v16 = v24;
          goto LABEL_21;
        }
        return this;
      }
      if (v16)
      {
LABEL_15:
        unsigned int v9 = 0;
        unsigned int v19 = __clz(v16);
      }
      else
      {
LABEL_20:
        unsigned int v19 = 32;
      }
LABEL_21:
      unsigned int v10 = v9;
      atomic_ullong v12 = v11;
      ++v15;
      v13 += 32;
      unsigned int v9 = v19;
      atomic_ullong v11 = v16;
      if ((unint64_t)v15 > v14) {
        return 0xFFFFFFFFLL;
      }
    }
    unsigned int v25 = a5 - (v9 + v10);
    if (!v25 || v25 > this) {
      goto LABEL_45;
    }
    if (v10)
    {
      this = v13 - v10 - 32;
      if (this + a5 >= a6) {
        return 0xFFFFFFFFLL;
      }
      unint64_t v26 = -(1 << -(char)v10) | ((unint64_t)(1 << -(char)v10) << 32);
      atomic_ullong v27 = v12;
      atomic_compare_exchange_strong(v15 - 2, (unint64_t *)&v27, v26 | v12);
      if (v27 != v12)
      {
LABEL_41:
        unsigned int v9 = 0;
        unsigned int v19 = 0;
        goto LABEL_21;
      }
    }
    else
    {
      this = v13 - v9;
      if (this + a5 >= a6) {
        return 0xFFFFFFFFLL;
      }
      unint64_t v26 = 0;
    }
    uint64_t v28 = (1 << -(char)v9);
    uint64_t v29 = -(int)v28;
    uint64_t v30 = v28 << 32;
    if (v10) {
      uint64_t v30 = 0;
    }
    uint64_t v31 = v30 | v29;
    atomic_ullong v32 = v11;
    atomic_compare_exchange_strong(v15 - 1, (unint64_t *)&v32, v31 | v11);
    if (v32 == v11)
    {
      unint64_t v33 = v16 | (0xFFFFFFFF >> -(char)v25);
      atomic_ullong v34 = v16;
      atomic_compare_exchange_strong(v15, (unint64_t *)&v34, v33);
      if (v34 == v16) {
        return this;
      }
      atomic_fetch_and(v15 - 1, ~v31);
      atomic_ullong v16 = v34;
    }
    else
    {
      atomic_ullong v11 = v32;
    }
    if (v10)
    {
      unsigned int v9 = 0;
      unsigned int v19 = 0;
      atomic_fetch_and(v15 - 2, ~v26);
      goto LABEL_21;
    }
    goto LABEL_41;
  }
  return this;
}

uint64_t caulk::alloc::darwin_resource<caulk::alloc::audio_allocator,caulk::alloc::memory_resource>::zone_size_for_ptr(uint64_t a1, unint64_t a2)
{
  uint64_t v3 = *(void *)(a1 - 8);
  v12[0] = v3 + 800;
  v12[1] = v3 + 960;
  caulk::concurrent::details::node_allocator<void *,caulk::alloc::detail::tracked_block,10ul,(caulk::concurrent::skiplist_options)0>::begin_traversal();
  uint64_t owner = caulk::alloc::tree_allocator<caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,16ul,6ul>>::find_owner(v12, a2);
  if (owner) {
    uint64_t v6 = caulk::alloc::bitmap_allocator<caulk::alloc::embed_block_memory,16368ul,16ul,6ul>::size(owner + 16, a2);
  }
  else {
    uint64_t v6 = 0;
  }
  caulk::concurrent::details::node_allocator<unsigned long,caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,256ul,6ul>::node_impl<caulk::alloc::tree_allocator<caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,256ul,6ul>>::node_header,caulk::alloc::embed_block_memory> *,5ul,(caulk::concurrent::skiplist_options)1>::end_traversal(v3 + 960, v5);
  if (!v6)
  {
    uint64_t v7 = caulk::alloc::consolidating_free_map<caulk::alloc::page_allocator,10485760ul>::size(v3 + 368, a2 - 32);
    if ((v7 & 0x7FFFFFFFFFFFFFBFLL) != 0)
    {
      return v7 - 64;
    }
    else
    {
      caulk::concurrent::details::node_allocator<void *,caulk::alloc::detail::tracked_block,10ul,(caulk::concurrent::skiplist_options)0>::begin_traversal();
      v12[0] = a2;
      unint64_t v8 = caulk::concurrent::skiplist<void *,caulk::alloc::detail::tracked_block,10,(caulk::concurrent::skiplist_options)0>::search_to_level<caulk::concurrent::skiplist<void *,caulk::alloc::detail::tracked_block,10,(caulk::concurrent::skiplist_options)0>::key_le>(v3 + 32, v12, 0);
      if (*(void *)(v8 + 16) != a2)
      {
        if (*(unsigned char *)(v9 + 26) == 2) {
          unint64_t v8 = v3 + 232;
        }
        else {
          unint64_t v8 = v9;
        }
      }
      unint64_t v10 = v3 + 232;
      if (v8 == v3 + 232
        || (unint64_t v10 = *(unsigned __int8 *)(v8 + 26), v10 == 2)
        || (unint64_t v10 = atomic_load((unint64_t *)(v8 + 40)), (v10 & 1) != 0)
        || (unint64_t v10 = *(void *)(v8 + 16), v10 != a2))
      {
        uint64_t v6 = 0;
      }
      else
      {
        uint64_t v6 = *(void *)v8;
      }
      caulk::concurrent::details::node_allocator<void *,caulk::alloc::detail::tracked_block,10ul,(caulk::concurrent::skiplist_options)0>::end_traversal(v3 + 288, v10);
    }
  }
  return v6;
}

uint64_t caulk::alloc::consolidating_free_map<caulk::alloc::page_allocator,10485760ul>::size(uint64_t a1, unint64_t a2)
{
  unint64_t v4 = a1 + 16;
  unint64_t v5 = a1 + 272;
  caulk::concurrent::details::node_allocator<void *,caulk::alloc::detail::tracked_block,10ul,(caulk::concurrent::skiplist_options)0>::begin_traversal();
  unint64_t v15 = a2;
  unint64_t v6 = caulk::concurrent::skiplist<void *,caulk::alloc::detail::tracked_block,10,(caulk::concurrent::skiplist_options)0>::search_to_level<caulk::concurrent::skiplist<void *,caulk::alloc::detail::tracked_block,10,(caulk::concurrent::skiplist_options)0>::key_le>(v4, &v15, 0);
  unint64_t v7 = 0;
  unint64_t v8 = 0;
  if (*(unsigned char *)(v6 + 26) == 1) {
    unint64_t v9 = a1 + 216;
  }
  else {
    unint64_t v9 = v6;
  }
  if (*(unsigned char *)(v9 + 26) != 2)
  {
    unint64_t v7 = 0;
    char v10 = atomic_load((unint64_t *)(v9 + 40));
    if (v10)
    {
      unint64_t v8 = 0;
    }
    else
    {
      unint64_t v8 = 0;
      if (a1 + 216 != v9)
      {
        unint64_t v11 = *(void *)(v9 + 16);
        unint64_t v9 = *(void *)v9;
        BOOL v13 = v11 > a2 || v11 + v9 < a2;
        if (v13) {
          unint64_t v8 = 0;
        }
        else {
          unint64_t v8 = v9;
        }
        if (v13) {
          unint64_t v7 = 0;
        }
        else {
          unint64_t v7 = v11;
        }
      }
    }
  }
  caulk::concurrent::details::node_allocator<void *,caulk::alloc::detail::tracked_block,10ul,(caulk::concurrent::skiplist_options)0>::end_traversal(v5, v9);
  uint64_t result = 0;
  if (v7 && v7 + 32 <= a2 && v7 + v8 - 32 > a2)
  {
    if (*(void *)(a2 - 16)) {
      return 0;
    }
    else {
      return *(void *)(a2 - 8) >> 1;
    }
  }
  return result;
}

unint64_t caulk::concurrent::skiplist<void *,caulk::alloc::detail::tracked_block,10,(caulk::concurrent::skiplist_options)0>::search_right<caulk::concurrent::skiplist<void *,caulk::alloc::detail::tracked_block,10,(caulk::concurrent::skiplist_options)0>::key_le &>(unint64_t a1, uint64_t a2, unint64_t a3, void *a4)
{
  unint64_t v4 = a3;
  unint64_t v5 = atomic_load((unint64_t *)(a3 + 16 * a2 + 40));
  unint64_t v6 = v5 & 0xFFFFFFFFFFFFFFFCLL;
  if (*a4 >= *(void *)((v5 & 0xFFFFFFFFFFFFFFFCLL) + 16))
  {
    do
    {
      char v10 = atomic_load((unint64_t *)(v6 + 40));
      if (v10)
      {
        unint64_t v4 = caulk::concurrent::skiplist<void *,caulk::alloc::detail::tracked_block,10,(caulk::concurrent::skiplist_options)0>::try_flag_node(a1, a2, v4, v6);
        if (!v11) {
          caulk::concurrent::skiplist<void *,caulk::alloc::detail::tracked_block,10,(caulk::concurrent::skiplist_options)0>::help_flagged(a1, a2, v4, v6);
        }
      }
      else
      {
        unint64_t v4 = v6;
      }
      unint64_t v12 = atomic_load((unint64_t *)(v4 + 16 * a2 + 40));
      unint64_t v6 = v12 & 0xFFFFFFFFFFFFFFFCLL;
    }
    while (*a4 >= *(void *)((v12 & 0xFFFFFFFFFFFFFFFCLL) + 16));
  }
  return v4;
}

unint64_t caulk::concurrent::skiplist<void *,caulk::alloc::detail::tracked_block,10,(caulk::concurrent::skiplist_options)0>::search_to_level<caulk::concurrent::skiplist<void *,caulk::alloc::detail::tracked_block,10,(caulk::concurrent::skiplist_options)0>::key_le>(unint64_t a1, void *a2, unint64_t a3)
{
  unint64_t v6 = -1;
  uint64_t v7 = 56;
  do
  {
    do
    {
      ++v6;
      unint64_t v8 = atomic_load((unint64_t *)(a1 + v7));
      v7 += 16;
    }
    while (v6 < a3);
  }
  while (*(unsigned char *)((v8 & 0xFFFFFFFFFFFFFFFCLL) + 26) != 2);
  unint64_t v9 = a1;
  if (v6 > a3)
  {
    unint64_t v9 = a1;
    do
      unint64_t v9 = caulk::concurrent::skiplist<void *,caulk::alloc::detail::tracked_block,10,(caulk::concurrent::skiplist_options)0>::search_right<caulk::concurrent::skiplist<void *,caulk::alloc::detail::tracked_block,10,(caulk::concurrent::skiplist_options)0>::key_le &>(a1, v6--, v9, a2);
    while (v6 > a3);
  }

  return caulk::concurrent::skiplist<void *,caulk::alloc::detail::tracked_block,10,(caulk::concurrent::skiplist_options)0>::search_right<caulk::concurrent::skiplist<void *,caulk::alloc::detail::tracked_block,10,(caulk::concurrent::skiplist_options)0>::key_le &>(a1, a3, v9, a2);
}

unint64_t caulk::concurrent::details::node_allocator<void *,caulk::alloc::detail::tracked_block,10ul,(caulk::concurrent::skiplist_options)0>::end_traversal@<X0>(unint64_t result@<X0>, unint64_t a2@<X8>)
{
  _X2 = 0;
  _X3 = 0;
  __asm { CASPAL          X2, X3, X2, X3, [X0] }
  unint64_t v9 = 0;
  for (unint64_t i = _X2; ; unint64_t i = _X2)
  {
    uint64_t v11 = (_X3 - 1);
    a2 = a2 & 0xFFFFFFFF00000000 | v11;
    _X6 = (int)_X3 <= 1 ? 0 : i;
    _X3 = _X3 | (v9 << 32);
    __asm { CASPAL          X2, X3, X6, X7, [X0] }
    if (_X2 == i) {
      break;
    }
    unint64_t v9 = HIDWORD(_X3);
  }
  if (!v11)
  {
    if (i) {
      return caulk::concurrent::details::node_allocator<void *,caulk::alloc::detail::tracked_block,10ul,(caulk::concurrent::skiplist_options)0>::free_node_chain_now(result, i);
    }
  }
  return result;
}

uint64_t caulk::alloc::tree_allocator<caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,256ul,6ul>>::find_owner(unint64_t *a1, unint64_t a2)
{
  unint64_t v4 = *a1;
  unint64_t v10 = a2;
  unint64_t v5 = caulk::concurrent::skiplist<unsigned long,caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,256ul,6ul>::node_impl<caulk::alloc::tree_allocator<caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,256ul,6ul>>::node_header,caulk::alloc::embed_block_memory> *,5,(caulk::concurrent::skiplist_options)1>::search_to_level<caulk::concurrent::skiplist<unsigned long,caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,256ul,6ul>::node_impl<caulk::alloc::tree_allocator<caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,256ul,6ul>>::node_header,caulk::alloc::embed_block_memory> *,5,(caulk::concurrent::skiplist_options)1>::key_le>(v4, &v10, 0);
  if (*(unsigned char *)(v5 + 18) == 1) {
    uint64_t v6 = *a1 + 112;
  }
  else {
    uint64_t v6 = v5;
  }
  if (*a1 + 112 == v6) {
    return 0;
  }
  if (*(unsigned char *)(v6 + 18) == 2) {
    return 0;
  }
  char v7 = atomic_load((unint64_t *)(v6 + 32));
  if (v7) {
    return 0;
  }
  uint64_t result = *(void *)(v6 + 8);
  if (a2 < result + 256 || a2 >= result + 0x4000) {
    return 0;
  }
  return result;
}

uint64_t **std::__tree<std::__value_type<unsigned long,caulk::alloc::consolidating_free_map<caulk::alloc::page_allocator,10485760ul>::FreelistOfSize>,std::__map_value_compare<unsigned long,std::__value_type<unsigned long,caulk::alloc::consolidating_free_map<caulk::alloc::page_allocator,10485760ul>::FreelistOfSize>,std::less<unsigned long>,true>,std::allocator<std::__value_type<unsigned long,caulk::alloc::consolidating_free_map<caulk::alloc::page_allocator,10485760ul>::FreelistOfSize>>>::__remove_node_pointer(uint64_t **result, uint64_t *a2)
{
  unint64_t v2 = (uint64_t *)a2[1];
  if (v2)
  {
    do
    {
      uint64_t v3 = v2;
      unint64_t v2 = (uint64_t *)*v2;
    }
    while (v2);
  }
  else
  {
    unint64_t v4 = a2;
    do
    {
      uint64_t v3 = (uint64_t *)v4[2];
      BOOL v25 = *v3 == (void)v4;
      unint64_t v4 = v3;
    }
    while (!v25);
  }
  if (*result == a2) {
    *uint64_t result = v3;
  }
  unint64_t v5 = result[1];
  result[2] = (uint64_t *)((char *)result[2] - 1);
  uint64_t v6 = *a2;
  char v7 = a2;
  if (*a2)
  {
    unint64_t v8 = (uint64_t *)a2[1];
    if (!v8)
    {
      char v7 = a2;
      goto LABEL_15;
    }
    do
    {
      char v7 = v8;
      unint64_t v8 = (uint64_t *)*v8;
    }
    while (v8);
  }
  uint64_t v6 = v7[1];
  if (v6)
  {
LABEL_15:
    int v9 = 0;
    *(void *)(v6 + 16) = v7[2];
    goto LABEL_16;
  }
  int v9 = 1;
LABEL_16:
  unint64_t v10 = (uint64_t **)v7[2];
  uint64_t v11 = *v10;
  if (*v10 == v7)
  {
    caulk::alloc::base_allocator *v10 = (uint64_t *)v6;
    if (v7 == v5)
    {
      uint64_t v11 = 0;
      unint64_t v5 = (uint64_t *)v6;
    }
    else
    {
      uint64_t v11 = v10[1];
    }
  }
  else
  {
    v10[1] = (uint64_t *)v6;
  }
  int v12 = *((unsigned __int8 *)v7 + 24);
  if (v7 != a2)
  {
    uint64_t v13 = a2[2];
    v7[2] = v13;
    *(void *)(v13 + 8 * (*(void *)a2[2] != (void)a2)) = v7;
    uint64_t v15 = *a2;
    uint64_t v14 = a2[1];
    *(void *)(v15 + 16) = v7;
    *char v7 = v15;
    v7[1] = v14;
    if (v14) {
      *(void *)(v14 + 16) = v7;
    }
    *((unsigned char *)v7 + 24) = *((unsigned char *)a2 + 24);
    if (v5 == a2) {
      unint64_t v5 = v7;
    }
  }
  if (!v12 || !v5) {
    return result;
  }
  if (!v9)
  {
    *(unsigned char *)(v6 + 24) = 1;
    return result;
  }
  while (1)
  {
    uint64_t v16 = v11[2];
    if (*(uint64_t **)v16 != v11) {
      break;
    }
    if (!*((unsigned char *)v11 + 24))
    {
      *((unsigned char *)v11 + 24) = 1;
      *(unsigned char *)(v16 + 24) = 0;
      uint64_t v22 = v11[1];
      *(void *)uint64_t v16 = v22;
      if (v22) {
        *(void *)(v22 + 16) = v16;
      }
      v11[2] = *(void *)(v16 + 16);
      *(void *)(*(void *)(v16 + 16) + 8 * (**(void **)(v16 + 16) != v16)) = v11;
      v11[1] = v16;
      *(void *)(v16 + 16) = v11;
      if (v5 == (uint64_t *)v16) {
        unint64_t v5 = v11;
      }
      uint64_t v11 = *(uint64_t **)v16;
    }
    unint64_t v23 = (void *)*v11;
    if (*v11 && !*((unsigned char *)v23 + 24)) {
      goto LABEL_76;
    }
    atomic_ullong v24 = (uint64_t *)v11[1];
    if (v24 && !*((unsigned char *)v24 + 24))
    {
      if (v23 && !*((unsigned char *)v23 + 24))
      {
LABEL_76:
        atomic_ullong v24 = v11;
      }
      else
      {
        *((unsigned char *)v24 + 24) = 1;
        *((unsigned char *)v11 + 24) = 0;
        uint64_t v30 = *v24;
        v11[1] = *v24;
        if (v30) {
          *(void *)(v30 + 16) = v11;
        }
        v24[2] = v11[2];
        *(void *)(v11[2] + 8 * (*(void *)v11[2] != (void)v11)) = v24;
        *atomic_ullong v24 = (uint64_t)v11;
        v11[2] = (uint64_t)v24;
        unint64_t v23 = v11;
      }
      uint64_t v27 = v24[2];
      *((unsigned char *)v24 + 24) = *(unsigned char *)(v27 + 24);
      *(unsigned char *)(v27 + 24) = 1;
      *((unsigned char *)v23 + 24) = 1;
      uint64_t v28 = *(uint64_t **)v27;
      uint64_t v31 = *(void *)(*(void *)v27 + 8);
      *(void *)uint64_t v27 = v31;
      if (v31) {
        *(void *)(v31 + 16) = v27;
      }
      v28[2] = *(void *)(v27 + 16);
      *(void *)(*(void *)(v27 + 16) + 8 * (**(void **)(v27 + 16) != v27)) = v28;
      v28[1] = v27;
      goto LABEL_80;
    }
    *((unsigned char *)v11 + 24) = 0;
    unsigned int v21 = (uint64_t *)v11[2];
    if (*((unsigned char *)v21 + 24)) {
      BOOL v25 = v21 == v5;
    }
    else {
      BOOL v25 = 1;
    }
    if (v25) {
      goto LABEL_61;
    }
LABEL_57:
    uint64_t v11 = *(uint64_t **)(v21[2] + 8 * (*(void *)v21[2] == (void)v21));
  }
  if (!*((unsigned char *)v11 + 24))
  {
    *((unsigned char *)v11 + 24) = 1;
    *(unsigned char *)(v16 + 24) = 0;
    BOOL v17 = *(uint64_t **)(v16 + 8);
    uint64_t v18 = *v17;
    *(void *)(v16 + 8) = *v17;
    if (v18) {
      *(void *)(v18 + 16) = v16;
    }
    v17[2] = *(void *)(v16 + 16);
    *(void *)(*(void *)(v16 + 16) + 8 * (**(void **)(v16 + 16) != v16)) = v17;
    *BOOL v17 = v16;
    *(void *)(v16 + 16) = v17;
    if (v5 == (uint64_t *)*v11) {
      unint64_t v5 = v11;
    }
    uint64_t v11 = *(uint64_t **)(*v11 + 8);
  }
  unsigned int v19 = (void *)*v11;
  if (!*v11 || *((unsigned char *)v19 + 24))
  {
    int v20 = (uint64_t *)v11[1];
    if (v20 && !*((unsigned char *)v20 + 24)) {
      goto LABEL_67;
    }
    *((unsigned char *)v11 + 24) = 0;
    unsigned int v21 = (uint64_t *)v11[2];
    if (v21 == v5)
    {
      unsigned int v21 = v5;
LABEL_61:
      *((unsigned char *)v21 + 24) = 1;
      return result;
    }
    if (!*((unsigned char *)v21 + 24)) {
      goto LABEL_61;
    }
    goto LABEL_57;
  }
  int v20 = (uint64_t *)v11[1];
  if (v20 && !*((unsigned char *)v20 + 24))
  {
LABEL_67:
    unsigned int v19 = v11;
  }
  else
  {
    *((unsigned char *)v19 + 24) = 1;
    *((unsigned char *)v11 + 24) = 0;
    uint64_t v26 = v19[1];
    uint64_t *v11 = v26;
    if (v26) {
      *(void *)(v26 + 16) = v11;
    }
    v19[2] = v11[2];
    *(void *)(v11[2] + 8 * (*(void *)v11[2] != (void)v11)) = v19;
    v19[1] = v11;
    v11[2] = (uint64_t)v19;
    int v20 = v11;
  }
  uint64_t v27 = v19[2];
  *((unsigned char *)v19 + 24) = *(unsigned char *)(v27 + 24);
  *(unsigned char *)(v27 + 24) = 1;
  *((unsigned char *)v20 + 24) = 1;
  uint64_t v28 = *(uint64_t **)(v27 + 8);
  uint64_t v29 = *v28;
  *(void *)(v27 + 8) = *v28;
  if (v29) {
    *(void *)(v29 + 16) = v27;
  }
  v28[2] = *(void *)(v27 + 16);
  *(void *)(*(void *)(v27 + 16) + 8 * (**(void **)(v27 + 16) != v27)) = v28;
  *uint64_t v28 = v27;
LABEL_80:
  *(void *)(v27 + 16) = v28;
  return result;
}

uint64_t caulk::alloc::consolidating_free_map<caulk::alloc::page_allocator,10485760ul>::add_freemap_node(uint64_t result, void *a2)
{
  uint64_t v3 = result;
  unint64_t v4 = a2[3] >> 1;
  unint64_t v5 = (uint64_t **)(result + 368);
  uint64_t v6 = *(uint64_t **)(result + 368);
  if (!v6)
  {
    int v12 = (uint64_t **)(result + 368);
LABEL_19:
    char v7 = (uint64_t *)operator new(0x38uLL);
    v7[5] = 0;
    v7[6] = 0;
    v7[4] = v4;
    *char v7 = 0;
    v7[1] = 0;
    v7[2] = (uint64_t)v12;
    *unint64_t v5 = v7;
    uint64_t v14 = **(void **)(v3 + 360);
    uint64_t v15 = v7;
    if (v14)
    {
      *(void *)(v3 + 360) = v14;
      uint64_t v15 = *v5;
    }
    uint64_t result = (uint64_t)std::__tree_balance_after_insert[abi:ne180100]<std::__tree_node_base<void *> *>(*(uint64_t **)(v3 + 368), v15);
    ++*(void *)(v3 + 376);
    goto LABEL_22;
  }
  char v7 = (uint64_t *)(result + 368);
  unint64_t v8 = *(void **)(result + 368);
  do
  {
    unint64_t v9 = v8[4];
    BOOL v10 = v9 >= v4;
    if (v9 >= v4) {
      uint64_t v11 = v8;
    }
    else {
      uint64_t v11 = v8 + 1;
    }
    if (v10) {
      char v7 = v8;
    }
    unint64_t v8 = (void *)*v11;
  }
  while (*v11);
  if (v7 != (uint64_t *)v5 && v7[4] <= v4)
  {
LABEL_22:
    uint64_t v16 = (void *)v7[6];
    *a2 = v7 + 5;
    a2[1] = v16;
    if (v16) {
      *uint64_t v16 = a2;
    }
    v7[6] = (uint64_t)a2;
    return result;
  }
  while (1)
  {
    while (1)
    {
      int v12 = (uint64_t **)v6;
      unint64_t v13 = v6[4];
      if (v13 <= v4) {
        break;
      }
      uint64_t v6 = *v12;
      unint64_t v5 = v12;
      if (!*v12) {
        goto LABEL_19;
      }
    }
    if (v13 >= v4) {
      break;
    }
    uint64_t v6 = v12[1];
    if (!v6)
    {
      unint64_t v5 = v12 + 1;
      goto LABEL_19;
    }
  }
  _os_assert_log();
  uint64_t result = _os_crash();
  __break(1u);
  return result;
}

uint64_t caulk::mach::os_workgroup_interval_managed::finish(caulk::mach::os_workgroup_interval_managed *this, os_workgroup_interval_data_opaque_s *a2)
{
  if (!*((unsigned char *)this + 56) || !*((unsigned char *)this + 57)) {
    return 1;
  }
  uint64_t result = os_workgroup_interval_finish(*((os_workgroup_interval_t *)this + 1), a2);
  *((unsigned char *)this + 57) = 0;
  return result;
}

uint64_t caulk::mach::os_workgroup_interval_managed::start(caulk::mach::os_workgroup_interval_managed *this, uint64_t a2, uint64_t a3, os_workgroup_interval_data_opaque_s *a4)
{
  if (!*((unsigned char *)this + 56) || *((unsigned char *)this + 57)) {
    return 1;
  }
  uint64_t v9 = mach_absolute_time();
  if (a2 >= v9) {
    uint64_t v10 = v9;
  }
  else {
    uint64_t v10 = a2;
  }
  if (v9 <= a3) {
    uint64_t v11 = a3;
  }
  else {
    uint64_t v11 = v9;
  }
  if (v10 == v11) {
    return 22;
  }
  uint64_t result = os_workgroup_interval_start(*((os_workgroup_interval_t *)this + 1), v10, v11, a4);
  *((unsigned char *)this + 57) = result == 0;
  return result;
}

void caulk::xpc::reply_watchdog_factory::make_timer(caulk::xpc::reply_watchdog_factory *this@<X0>, int a2@<W1>, dispatch_source_t *a3@<X8>)
{
  int v3 = a2;
  v12[4] = *MEMORY[0x263EF8340];
  if (!a2) {
    int v3 = *((_DWORD *)this + 1);
  }
  uint64_t v6 = dispatch_get_global_queue(0, 0);
  dispatch_source_t v7 = dispatch_source_create(MEMORY[0x263EF8400], 0, 0, v6);
  *a3 = v7;
  applesauce::dispatch::v1::source::operator*(v7);
  objc_claimAutoreleasedReturnValue();
  handler[0] = MEMORY[0x263EF8330];
  handler[1] = 3321888768;
  handler[2] = ___ZN5caulk3xpc22reply_watchdog_factory10make_timerEi_block_invoke;
  handler[3] = &__block_descriptor_64_ea8_32c60_ZTSKZN5caulk3xpc22reply_watchdog_factory10make_timerEiE3__0_e5_v8__0l;
  std::__function::__value_func<void ()(void)>::__value_func[abi:ne180100]((uint64_t)v10, (uint64_t)this + 8);
  std::__function::__value_func<void ()(void)>::__value_func[abi:ne180100]((uint64_t)v12, (uint64_t)v10);
  dispatch_source_set_event_handler(v7, handler);
  std::__function::__value_func<void ()(void)>::~__value_func[abi:ne180100](v10);

  unint64_t v8 = applesauce::dispatch::v1::source::operator*(v7);
  dispatch_resume(v8);

  applesauce::dispatch::v1::source::operator*(v7);
  objc_claimAutoreleasedReturnValue();
  dispatch_time_t v9 = dispatch_time(0, 1000000 * v3);
  dispatch_source_set_timer(v7, v9, 0xFFFFFFFFFFFFFFFFLL, 0xF4240uLL);

  std::__function::__value_func<void ()(void)>::~__value_func[abi:ne180100](v12);
}

void sub_21086993C(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  std::__function::__value_func<void ()(void)>::~__value_func[abi:ne180100]((uint64_t *)va);

  applesauce::dispatch::v1::source::~source(v4);
  _Unwind_Resume(a1);
}

uint64_t std::__function::__value_func<void ()(void)>::__value_func[abi:ne180100](uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 24);
  if (v3)
  {
    if (v3 == a2)
    {
      *(void *)(a1 + 24) = a1;
      (*(void (**)(void, uint64_t))(**(void **)(a2 + 24) + 24))(*(void *)(a2 + 24), a1);
    }
    else
    {
      *(void *)(a1 + 24) = (*(uint64_t (**)(uint64_t))(*(void *)v3 + 16))(v3);
    }
  }
  else
  {
    *(void *)(a1 + 24) = 0;
  }
  return a1;
}

void *std::__function::__value_func<void ()(void)>::~__value_func[abi:ne180100](void *a1)
{
  unint64_t v2 = (void *)a1[3];
  if (v2 == a1)
  {
    (*(void (**)(void *))(*a1 + 32))(a1);
  }
  else if (v2)
  {
    (*(void (**)(void *))(*v2 + 40))(v2);
  }
  return a1;
}

uint64_t *std::__tree_balance_after_insert[abi:ne180100]<std::__tree_node_base<void *> *>(uint64_t *result, uint64_t *a2)
{
  *((unsigned char *)a2 + 24) = a2 == result;
  if (a2 != result)
  {
    do
    {
      unint64_t v2 = (uint64_t *)a2[2];
      if (*((unsigned char *)v2 + 24)) {
        return result;
      }
      uint64_t v3 = (uint64_t *)v2[2];
      unint64_t v4 = (uint64_t *)*v3;
      if ((uint64_t *)*v3 == v2)
      {
        uint64_t v7 = v3[1];
        if (!v7 || (v8 = *(unsigned __int8 *)(v7 + 24), unint64_t v5 = (unsigned char *)(v7 + 24), v8))
        {
          if ((uint64_t *)*v2 == a2)
          {
            dispatch_time_t v9 = (uint64_t **)a2[2];
          }
          else
          {
            dispatch_time_t v9 = (uint64_t **)v2[1];
            uint64_t v10 = *v9;
            v2[1] = (uint64_t)*v9;
            if (v10)
            {
              v10[2] = (uint64_t)v2;
              uint64_t v3 = (uint64_t *)v2[2];
            }
            v9[2] = v3;
            *(void *)(v2[2] + 8 * (*(void *)v2[2] != (void)v2)) = v9;
            *dispatch_time_t v9 = v2;
            v2[2] = (uint64_t)v9;
            uint64_t v3 = v9[2];
            unint64_t v2 = (uint64_t *)*v3;
          }
          *((unsigned char *)v9 + 24) = 1;
          *((unsigned char *)v3 + 24) = 0;
          uint64_t v13 = v2[1];
          uint64_t *v3 = v13;
          if (v13) {
            *(void *)(v13 + 16) = v3;
          }
          v2[2] = v3[2];
          *(void *)(v3[2] + 8 * (*(void *)v3[2] != (void)v3)) = v2;
          v2[1] = (uint64_t)v3;
          goto LABEL_27;
        }
      }
      else if (!v4 || (v6 = *((unsigned __int8 *)v4 + 24), unint64_t v5 = v4 + 3, v6))
      {
        if ((uint64_t *)*v2 == a2)
        {
          uint64_t v11 = a2[1];
          uint64_t *v2 = v11;
          if (v11)
          {
            *(void *)(v11 + 16) = v2;
            uint64_t v3 = (uint64_t *)v2[2];
          }
          a2[2] = (uint64_t)v3;
          *(void *)(v2[2] + 8 * (*(void *)v2[2] != (void)v2)) = a2;
          a2[1] = (uint64_t)v2;
          v2[2] = (uint64_t)a2;
          uint64_t v3 = (uint64_t *)a2[2];
        }
        else
        {
          a2 = (uint64_t *)a2[2];
        }
        *((unsigned char *)a2 + 24) = 1;
        *((unsigned char *)v3 + 24) = 0;
        unint64_t v2 = (uint64_t *)v3[1];
        uint64_t v12 = *v2;
        v3[1] = *v2;
        if (v12) {
          *(void *)(v12 + 16) = v3;
        }
        v2[2] = v3[2];
        *(void *)(v3[2] + 8 * (*(void *)v3[2] != (void)v3)) = v2;
        uint64_t *v2 = (uint64_t)v3;
LABEL_27:
        v3[2] = (uint64_t)v2;
        return result;
      }
      *((unsigned char *)v2 + 24) = 1;
      a2 = v3;
      *((unsigned char *)v3 + 24) = v3 == result;
      *unint64_t v5 = 1;
    }
    while (v3 != result);
  }
  return result;
}

uint64_t caulk::alloc::consolidating_free_map<caulk::alloc::page_allocator,10485760ul>::maybe_create_free_node(uint64_t result, uint64_t a2, uint64_t a3)
{
  unint64_t v3 = *(void *)(a2 + 24);
  unint64_t v4 = (v3 >> 1) - a3;
  if (v4 >= 0x21)
  {
    uint64_t v6 = a2 + a3;
    uint64_t v7 = (void *)(a2 + a3 + 32);
    *(void *)(v6 + 48) = (2 * a3) | 1;
    *(void *)(v6 + 56) = (v3 & 1 | (2 * v4)) - 64;
    *(void *)(a2 + 24) = 2 * a3;
    unint64_t v8 = *(void *)(v6 + 56);
    if ((v8 & 1) == 0) {
      *(void *)((char *)v7 + (v8 >> 1) + 48) = v8 & 0xFFFFFFFFFFFFFFFELL | *(void *)((char *)v7 + (v8 >> 1) + 48) & 1;
    }
    return caulk::alloc::consolidating_free_map<caulk::alloc::page_allocator,10485760ul>::add_freemap_node(result, v7);
  }
  return result;
}

unint64_t *caulk::concurrent::skiplist<unsigned long,caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,16ul,6ul>::node_impl<caulk::alloc::tree_allocator<caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,16ul,6ul>>::node_header,caulk::alloc::embed_block_memory> *,5,(caulk::concurrent::skiplist_options)1>::emplace<caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,16ul,6ul>::node_impl<caulk::alloc::tree_allocator<caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,16ul,6ul>>::node_header,caulk::alloc::embed_block_memory> *>(unint64_t *result, unint64_t a2, void *a3)
{
  if (*result >= a2 || (unint64_t v4 = (unint64_t)result, result[14] <= a2))
  {
    __break(1u);
    return result;
  }
  uint64_t v5 = (uint64_t)(result + 20);
  caulk::concurrent::details::node_allocator<void *,caulk::alloc::detail::tracked_block,10ul,(caulk::concurrent::skiplist_options)0>::begin_traversal();
  unint64_t v35 = a2;
  uint64_t v6 = (unint64_t *)caulk::concurrent::skiplist<unsigned long,caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,256ul,6ul>::node_impl<caulk::alloc::tree_allocator<caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,256ul,6ul>>::node_header,caulk::alloc::embed_block_memory> *,5,(caulk::concurrent::skiplist_options)1>::search_to_level<caulk::concurrent::skiplist<unsigned long,caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,256ul,6ul>::node_impl<caulk::alloc::tree_allocator<caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,256ul,6ul>>::node_header,caulk::alloc::embed_block_memory> *,5,(caulk::concurrent::skiplist_options)1>::key_le>(v4, &v35, 0);
  unint64_t v8 = *v6;
  if (*v6 == a2) {
    return (unint64_t *)caulk::concurrent::details::node_allocator<unsigned long,caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,256ul,6ul>::node_impl<caulk::alloc::tree_allocator<caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,256ul,6ul>>::node_header,caulk::alloc::embed_block_memory> *,5ul,(caulk::concurrent::skiplist_options)1>::end_traversal(v5, v8);
  }
  dispatch_time_t v9 = v6;
  unint64_t v10 = v7;
  int v11 = 0;
  int value = 0;
  for (uint64_t i = 1; i != 4; ++i)
  {
    if (i == 1)
    {
      caulk::concurrent::skiplist<unsigned long,caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,16ul,6ul>::node_impl<caulk::alloc::tree_allocator<caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,16ul,6ul>>::node_header,caulk::alloc::embed_block_memory> *,5,(caulk::concurrent::skiplist_options)1>::random_engine();
      int value = caulk::multi_simple_random<unsigned int,4ul,std::uniform_int_distribution<unsigned int>,std::mersenne_twister_engine<unsigned int,32ul,624ul,397ul,31ul,2567483615u,11ul,4294967295u,7ul,2636928640u,15ul,4022730752u,18ul,1812433253u>>::next_value((uint64_t)&caulk::concurrent::skiplist<unsigned long,caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,16ul,6ul>::node_impl<caulk::alloc::tree_allocator<caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,16ul,6ul>>::node_header,caulk::alloc::embed_block_memory> *,5,(caulk::concurrent::skiplist_options)1>::random_engine(void)::engine);
      int v11 = 3;
    }
    if ((v11 & ~value) != 0) {
      break;
    }
    v11 *= 4;
  }
  uint64_t v14 = 0;
  uint64_t v15 = *(void *)(v4 + 176);
  while (1)
  {
    unint64_t v16 = *(void *)&caulk::concurrent::details::node_allocator<unsigned long,caulk::alloc::chunk_allocator<caulk::alloc::page_allocator,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,16ul,6ul>::node_impl<caulk::alloc::tree_allocator<caulk::alloc::chunk_allocator<caulk::alloc::page_allocator,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,16ul,6ul>>::node_header,caulk::alloc::embed_block_memory> *,5ul,(caulk::concurrent::skiplist_options)1>::node_sizes[8 * v14];
    if (v16 >= *(void *)&caulk::concurrent::details::node_allocator<unsigned long,caulk::alloc::chunk_allocator<caulk::alloc::page_allocator,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,16ul,6ul>::node_impl<caulk::alloc::tree_allocator<caulk::alloc::chunk_allocator<caulk::alloc::page_allocator,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,16ul,6ul>>::node_header,caulk::alloc::embed_block_memory> *,5ul,(caulk::concurrent::skiplist_options)1>::node_sizes[8 * i - 8]) {
      break;
    }
    if (++v14 == 5)
    {
      unint64_t v17 = 0;
      goto LABEL_17;
    }
  }
  uint64_t v18 = v15 + 64 + 32 * v14;
  unsigned int v19 = caulk::concurrent::stack<caulk::alloc::free_block,caulk::concurrent::intrusive_single_link_node<caulk::alloc::free_block>>::pop();
  if (v19)
  {
    unint64_t v17 = (unint64_t)v19;
    atomic_fetch_add((atomic_ullong *volatile)(v18 + 16), 0xFFFFFFFFFFFFFFFFLL);
  }
  else
  {
    unint64_t v17 = caulk::alloc::cascading_allocator<caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::serial_allocator,caulk::alloc::embed_block_memory,16384ul>>::allocate(v15, v16);
  }
  uint64_t v5 = v4 + 160;
LABEL_17:
  *(unsigned char *)(v17 + 16) = i;
  *(_WORD *)(v17 + 17) = 1;
  *(unsigned char *)(v17 + 19) = i;
  *(void *)unint64_t v17 = a2;
  *(void *)(v17 + 8) = 0;
  *(void *)(v17 + 8) = *a3;
  *(void *)(v17 + 32) = 0;
  *(void *)(v17 + 40) = 0;
  *(void *)(v17 + 24) = 0;
  if ((_BYTE)i)
  {
    int v20 = (unint64_t *)(v17 + 40);
    uint64_t v21 = i;
    do
    {
      atomic_store(0, v20 - 1);
      atomic_store(0, v20);
      v20 += 2;
      --v21;
    }
    while (v21);
  }
  unint64_t v22 = 0;
  __dmb(0xBu);
  while (2)
  {
    if (*v9 == *(void *)v17)
    {
LABEL_37:
      unint64_t v32 = 0;
      goto LABEL_38;
    }
    while (1)
    {
      unint64_t v23 = &v9[2 * v22 + 4];
      unint64_t v24 = atomic_load(v23);
      if ((v24 & 2) == 0) {
        break;
      }
      caulk::concurrent::skiplist<unsigned long,caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,256ul,6ul>::node_impl<caulk::alloc::tree_allocator<caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,256ul,6ul>>::node_header,caulk::alloc::embed_block_memory> *,5,(caulk::concurrent::skiplist_options)1>::help_flagged(v4, v22, (unint64_t)v9, v24 & 0xFFFFFFFFFFFFFFFCLL);
LABEL_30:
      unint64_t v28 = *(void *)v17;
      while (1)
      {
        unint64_t v29 = atomic_load(&v9[2 * v22 + 4]);
        unint64_t v10 = v29 & 0xFFFFFFFFFFFFFFFCLL;
        if (v28 < *(void *)(v29 & 0xFFFFFFFFFFFFFFFCLL)) {
          break;
        }
        char v30 = atomic_load((unint64_t *)(v10 + 32));
        if (v30)
        {
          dispatch_time_t v9 = (void *)caulk::concurrent::skiplist<unsigned long,caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,256ul,6ul>::node_impl<caulk::alloc::tree_allocator<caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,256ul,6ul>>::node_header,caulk::alloc::embed_block_memory> *,5,(caulk::concurrent::skiplist_options)1>::try_flag_node(v4, v22, (unint64_t)v9, v10);
          if (!v31) {
            caulk::concurrent::skiplist<unsigned long,caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,256ul,6ul>::node_impl<caulk::alloc::tree_allocator<caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,256ul,6ul>>::node_header,caulk::alloc::embed_block_memory> *,5,(caulk::concurrent::skiplist_options)1>::help_flagged(v4, v22, (unint64_t)v9, v10);
          }
        }
        else
        {
          dispatch_time_t v9 = (void *)v10;
        }
      }
      if (*v9 == *(void *)v17) {
        goto LABEL_37;
      }
    }
    atomic_store(v10, (unint64_t *)(v17 + 16 * v22 + 32));
    unint64_t v25 = v10;
    atomic_compare_exchange_strong((atomic_ullong *volatile)v23, &v25, v17);
    if (v25 != v10)
    {
      if ((v25 & 2) != 0) {
        caulk::concurrent::skiplist<unsigned long,caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,256ul,6ul>::node_impl<caulk::alloc::tree_allocator<caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,256ul,6ul>>::node_header,caulk::alloc::embed_block_memory> *,5,(caulk::concurrent::skiplist_options)1>::help_flagged(v4, v22, (unint64_t)v9, v25 & 0xFFFFFFFFFFFFFFFCLL);
      }
      char v26 = atomic_load(v23);
      if (v26)
      {
        do
        {
          dispatch_time_t v9 = (void *)atomic_load(&v9[2 * v22 + 5]);
          char v27 = atomic_load(&v9[2 * v22 + 4]);
        }
        while ((v27 & 1) != 0);
      }
      goto LABEL_30;
    }
    unint64_t v32 = v17;
LABEL_38:
    if (v32 | v22)
    {
      unint64_t v8 = atomic_load((unint64_t *)(v17 + 32));
      if ((v8 & 1) == 0 && ++v22 != i)
      {
        unint64_t v35 = a2;
        dispatch_time_t v9 = (void *)caulk::concurrent::skiplist<unsigned long,caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,256ul,6ul>::node_impl<caulk::alloc::tree_allocator<caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,256ul,6ul>>::node_header,caulk::alloc::embed_block_memory> *,5,(caulk::concurrent::skiplist_options)1>::search_to_level<caulk::concurrent::skiplist<unsigned long,caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,256ul,6ul>::node_impl<caulk::alloc::tree_allocator<caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,256ul,6ul>>::node_header,caulk::alloc::embed_block_memory> *,5,(caulk::concurrent::skiplist_options)1>::key_le>(v4, &v35, v22);
        unint64_t v10 = v33;
        continue;
      }
    }
    else
    {
      caulk::alloc::multi_free_list<caulk::alloc::cascading_allocator<caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::serial_allocator,caulk::alloc::embed_block_memory,16384ul>>,caulk::concurrent::details::node_allocator<unsigned long,caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,256ul,6ul>::node_impl<caulk::alloc::tree_allocator<caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,256ul,6ul>::node_impl>::node_header,caulk::alloc::embed_block_memory> *,5ul,(caulk::concurrent::skiplist_options)1>::size_generator,8ul,1ul,-1l>::deallocate(*(caulk::alloc::base_allocator **)(v4 + 176), (unint64_t *)v17, *(void *)&caulk::concurrent::details::node_allocator<unsigned long,caulk::alloc::chunk_allocator<caulk::alloc::page_allocator,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,16ul,6ul>::node_impl<caulk::alloc::tree_allocator<caulk::alloc::chunk_allocator<caulk::alloc::page_allocator,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,16ul,6ul>>::node_header,caulk::alloc::embed_block_memory> *,5ul,(caulk::concurrent::skiplist_options)1>::node_sizes[8 * *(unsigned __int8 *)(v17 + 16) - 8]);
    }
    return (unint64_t *)caulk::concurrent::details::node_allocator<unsigned long,caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,256ul,6ul>::node_impl<caulk::alloc::tree_allocator<caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,256ul,6ul>>::node_header,caulk::alloc::embed_block_memory> *,5ul,(caulk::concurrent::skiplist_options)1>::end_traversal(v5, v8);
  }
}

unint64_t *caulk::alloc::details::caching_page_allocator_base::allocate(caulk::alloc::details::caching_page_allocator_base *this, uint64_t a2, unint64_t a3)
{
  if (*MEMORY[0x263EF8AF8] >= a3)
  {
    if (*((void *)this + 2) == a2)
    {
      uint64_t v6 = (atomic_uint *)((char *)this + 108);
      atomic_fetch_add((atomic_uint *volatile)this + 27, 1u);
      unint64_t v7 = caulk::concurrent::stack<caulk::alloc::free_block,caulk::concurrent::intrusive_single_link_node<caulk::alloc::free_block>>::pop();
      if (v7)
      {
        unint64_t v8 = v7;
        atomic_fetch_add((atomic_ullong *volatile)this + 6, 0xFFFFFFFFFFFFFFFFLL);
        atomic_fetch_add(v6, 0xFFFFFFFF);
        uint64_t v9 = *((void *)this + 11);
        if (v9) {
          std::function<void ()(unsigned long,unsigned long)>::operator()(v9, *((void *)this + 2), *((void *)this + 6));
        }
        return v8;
      }
      atomic_fetch_add(v6, 0xFFFFFFFF);
      atomic_fetch_add((atomic_uint *volatile)this + 26, 1u);
    }
    return (unint64_t *)caulk::alloc::page_allocator::allocate(this, a2, a3);
  }
  _os_assert_log();
  uint64_t result = (unint64_t *)_os_crash();
  __break(1u);
  return result;
}

unint64_t *caulk::concurrent::stack<caulk::alloc::free_block,caulk::concurrent::intrusive_single_link_node<caulk::alloc::free_block>>::pop()
{
  _X0 = 0;
  _X1 = 0;
  __asm { CASPAL          X0, X1, X0, X1, [X8] }
  if (result)
  {
    unint64_t v7 = result;
    do
    {
      _X6 = atomic_load(result);
      _X5 = 0;
      __asm { CASPAL          X4, X5, X6, X7, [X8] }
      if (_X4 == v7) {
        break;
      }
      uint64_t result = _X4;
      unint64_t v7 = _X4;
    }
    while (_X4);
  }
  return result;
}

void *caulk::alloc::page_allocator::allocate(caulk::alloc::page_allocator *this, uint64_t a2, unint64_t a3)
{
  if (*MEMORY[0x263EF8AF8] >= a3) {
    return caulk::mach::vm_block::alloc((a2 + *MEMORY[0x263EF8AF8] - 1) & -*MEMORY[0x263EF8AF8], *(_DWORD *)this);
  }
  _os_assert_log();
  uint64_t result = (void *)_os_crash();
  __break(1u);
  return result;
}

void *caulk::mach::vm_block::alloc(size_t this, int a2)
{
  if (a2) {
    int v2 = a2 << 24;
  }
  else {
    int v2 = -1;
  }
  uint64_t result = mmap(0, this, 3, 4098, v2, 0);
  if ((unint64_t)result + 1 <= 1)
  {
    exception = (std::bad_alloc *)__cxa_allocate_exception(8uLL);
    uint64_t v5 = std::bad_alloc::bad_alloc(exception);
    __cxa_throw(v5, MEMORY[0x263F8C218], MEMORY[0x263F8C170]);
  }
  return result;
}

uint64_t caulk::multi_simple_random<unsigned int,4ul,std::uniform_int_distribution<unsigned int>,std::mersenne_twister_engine<unsigned int,32ul,624ul,397ul,31ul,2567483615u,11ul,4294967295u,7ul,2636928640u,15ul,4022730752u,18ul,1812433253u>>::next_value(uint64_t a1)
{
  uint64_t v2 = 0;
  while (1)
  {
    unint64_t v3 = (atomic_uchar *)(a1 + 2512 * v2 + 2504);
    if ((atomic_exchange(v3, 1u) & 1) == 0) {
      break;
    }
    if (v2 == 3) {
      uint64_t v2 = 0;
    }
    else {
      ++v2;
    }
  }
  uint64_t result = *(unsigned int *)(a1 + 10052);
  int v5 = result - *(_DWORD *)(a1 + 10048);
  if (v5)
  {
    uint64_t v6 = (std::mersenne_twister_engine<unsigned int, 32, 624, 397, 31, 2567483615, 11, 4294967295, 7, 2636928640, 15, 4022730752, 18, 1812433253> *)(a1 + 2512 * v2);
    unsigned int v7 = v5 + 1;
    if (v5 == -1)
    {
      uint64_t result = std::mersenne_twister_engine<unsigned int,32ul,624ul,397ul,31ul,2567483615u,11ul,4294967295u,7ul,2636928640u,15ul,4022730752u,18ul,1812433253u>::operator()((std::mersenne_twister_engine<unsigned int, 32, 624, 397, 31, 2567483615, 11, 4294967295, 7, 2636928640, 15, 4022730752, 18, 1812433253> *)(a1 + 2512 * v2));
    }
    else
    {
      uint64_t v8 = __clz(v7);
      uint64_t v9 = 31;
      if (((v7 << v8) & 0x7FFFFFFF) != 0) {
        uint64_t v9 = 32;
      }
      unint64_t v10 = v9 - v8;
      unint64_t v11 = v10 >> 5;
      if ((v10 & 0x1F) != 0) {
        ++v11;
      }
      if (v11 <= v10) {
        unsigned int v12 = 0xFFFFFFFF >> -(v10 / v11);
      }
      else {
        unsigned int v12 = 0;
      }
      do
        std::mersenne_twister_engine<unsigned int, 32, 624, 397, 31, 2567483615, 11, 4294967295, 7, 2636928640, 15, 4022730752, 18, 1812433253>::result_type v13 = std::mersenne_twister_engine<unsigned int,32ul,624ul,397ul,31ul,2567483615u,11ul,4294967295u,7ul,2636928640u,15ul,4022730752u,18ul,1812433253u>::operator()(v6) & v12;
      while (v13 >= v7);
      uint64_t result = *(_DWORD *)(a1 + 10048) + v13;
    }
  }
  atomic_store(0, (unsigned __int8 *)v3);
  return result;
}

std::mersenne_twister_engine<unsigned int, 32, 624, 397, 31, 2567483615, 11, 4294967295, 7, 2636928640, 15, 4022730752, 18, 1812433253>::result_type std::mersenne_twister_engine<unsigned int,32ul,624ul,397ul,31ul,2567483615u,11ul,4294967295u,7ul,2636928640u,15ul,4022730752u,18ul,1812433253u>::operator()(std::mersenne_twister_engine<unsigned int, 32, 624, 397, 31, 2567483615, 11, 4294967295, 7, 2636928640, 15, 4022730752, 18, 1812433253> *this)
{
  size_t i = this->__i_;
  size_t v2 = (i + 1) % 0x270;
  std::mersenne_twister_engine<unsigned int, 32, 624, 397, 31, 2567483615, 11, 4294967295, 7, 2636928640, 15, 4022730752, 18, 1812433253>::result_type v3 = this->__x_[(i + 397) % 0x270] ^ ((this->__x_[v2] & 0x7FFFFFFE | this->__x_[i] & 0x80000000) >> 1) ^ ((int)(this->__x_[v2] << 31) >> 31) & 0x9908B0DF;
  this->__x_[i] = v3;
  this->__i_ = v2;
  LODWORD(i) = ((v3 ^ (v3 >> 11)) << 7) & 0x9D2C5680 ^ v3 ^ (v3 >> 11);
  return (i << 15) & 0xEFC60000 ^ i ^ (((i << 15) & 0xEFC60000 ^ i) >> 18);
}

void caulk::concurrent::skiplist<unsigned long,caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,16ul,6ul>::node_impl<caulk::alloc::tree_allocator<caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,16ul,6ul>>::node_header,caulk::alloc::embed_block_memory> *,5,(caulk::concurrent::skiplist_options)1>::random_engine()
{
  {
    caulk::multi_simple_random<unsigned int,4ul,std::uniform_int_distribution<unsigned int>,std::mersenne_twister_engine<unsigned int,32ul,624ul,397ul,31ul,2567483615u,11ul,4294967295u,7ul,2636928640u,15ul,4022730752u,18ul,1812433253u>>::multi_simple_random((uint64_t)&caulk::concurrent::skiplist<unsigned long,caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,16ul,6ul>::node_impl<caulk::alloc::tree_allocator<caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,16ul,6ul>>::node_header,caulk::alloc::embed_block_memory> *,5,(caulk::concurrent::skiplist_options)1>::random_engine(void)::engine);
  }
}

void sub_21086A3BC(_Unwind_Exception *a1)
{
}

void caulk::concurrent::messenger::drain(atomic_ullong **this)
{
}

uint64_t caulk::concurrent::details::lf_read_sync_write_impl::begin_mutate(atomic_uint *this)
{
  return (atomic_load_explicit(this, memory_order_acquire) >> 15) & 1;
}

uint64_t ___ZN5caulk10concurrent7details17dispatch_receiverC2EN10applesauce8dispatch2v15queueE_block_invoke(uint64_t a1)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  uint64_t v1 = *(void *)(a1 + 32);
  mach_port_t v2 = *(_DWORD *)(v1 + 88);
  v4.msgh_bits = 0;
  v4.msgh_remote_port = 0;
  v4.msgh_local_port = v2;
  *(void *)&v4.msgh_voucher_port = 0;
  mach_msg(&v4, 2, 0, 0x28u, v2, 0, 0);
  atomic_store(0, (unsigned __int8 *)(v1 + 104));
  do
    uint64_t result = caulk::concurrent::details::messenger_servicer::check_dequeue((caulk::concurrent::details::messenger_servicer *)v1);
  while ((result & 1) != 0);
  return result;
}

uint64_t caulk::concurrent::details::worker_thread::run(caulk::concurrent::details::worker_thread *this)
{
  mach_port_t v2 = (atomic_uint *)((char *)this + 32);
  do
  {
    caulk::semaphore::timed_wait(v2, -1.0);
    uint64_t result = (*(uint64_t (**)(caulk::concurrent::details::worker_thread *))(*(void *)this + 16))(this);
    unsigned __int8 v4 = atomic_load((unsigned __int8 *)this + 49);
  }
  while ((v4 & 1) == 0);
  return result;
}

void sub_21086A4E4(void *a1)
{
  __cxa_begin_catch(a1);
  atomic_store(1u, (unsigned __int8 *)(v1 + 48));
  __cxa_end_catch();
}

uint64_t caulk::concurrent::details::messenger_servicer::check_dequeue(caulk::concurrent::details::messenger_servicer *this)
{
  unint64_t v1 = *((void *)this + 9);
  if (!v1)
  {
    unint64_t v2 = atomic_exchange_explicit((atomic_ullong *volatile)this + 1, 0, memory_order_acquire);
    if (!v2) {
      return 0;
    }
    unint64_t v1 = 0;
    do
    {
      unint64_t v3 = v1;
      unint64_t v1 = v2;
      unsigned __int8 v4 = (unint64_t *)(v2 + 8);
      unint64_t v2 = atomic_load((unint64_t *)(v2 + 8));
      atomic_store(v3, v4);
    }
    while (v2);
    *((void *)this + 9) = v1;
  }
  unint64_t v5 = atomic_load((unint64_t *)(v1 + 8));
  *((void *)this + 9) = v5;
  atomic_store(0, (unsigned int *)(v1 + 16));
  __dmb(9u);
  (*(void (**)(unint64_t))(*(void *)v1 + 16))(v1);
  return 1;
}

BOOL caulk::semaphore::timed_wait(atomic_uint *this, double a2)
{
  unint64_t v3 = this + 2;
  if (a2 == 0.0)
  {
    int explicit = atomic_load_explicit(v3, memory_order_acquire);
    if (explicit >= 1)
    {
      for (i = explicit; i >= 1; int explicit = i)
      {
        atomic_compare_exchange_strong(this + 2, (unsigned int *)&i, explicit - 1);
        BOOL result = i == explicit;
        if (i == explicit) {
          break;
        }
      }
      return result;
    }
    return 0;
  }
  add_int explicit = atomic_fetch_add_explicit(v3, 0xFFFFFFFF, memory_order_acquire);
  if ((int)add_explicit > 0) {
    return 1;
  }
  if (a2 > 0.0)
  {
    unint64_t v11 = caulk::mach::semaphore::timed_wait_or_error((semaphore_t *)this, a2, add_explicit);
    if (!HIDWORD(v11)) {
      return 0;
    }
    caulk::expected<BOOL,int>::value((uint64_t)&v11);
    if ((_BYTE)v11) {
      return 1;
    }
    unsigned int v8 = atomic_load((unsigned int *)this + 2);
    if ((v8 & 0x80000000) != 0)
    {
      unsigned int v9 = v8;
      while (1)
      {
        atomic_compare_exchange_strong_explicit(this + 2, &v9, v8 + 1, memory_order_relaxed, memory_order_relaxed);
        if (v9 == v8) {
          return 0;
        }
        unsigned int v8 = v9;
        if ((v9 & 0x80000000) == 0) {
          goto LABEL_17;
        }
      }
    }
  }
  do
LABEL_17:
    int v10 = MEMORY[0x216675320](*this);
  while (v10 == 14);
  return v10 == 0;
}

uint64_t caulk::concurrent::details::service_thread::wake(caulk::concurrent::details::service_thread *this)
{
  return caulk::concurrent::details::messenger_servicer::check_dequeue((caulk::concurrent::details::service_thread *)((char *)this + 56));
}

uint64_t caulk::expected<BOOL,int>::value(uint64_t result)
{
  if (!*(unsigned char *)(result + 4))
  {
    unint64_t v1 = (int *)result;
    exception = __cxa_allocate_exception(0x10uLL);
    int v3 = *v1;
    *(void *)exception = &unk_26C2AB778;
    exception[2] = v3;
  }
  return result;
}

uint64_t caulk::mach::semaphore::timed_wait_or_error@<X0>(semaphore_t *this@<X0>, double a2@<D0>, uint64_t a3@<X8>)
{
  kern_return_t v6;
  uint64_t v7;
  uint64_t v8;
  unsigned int v9;
  int v10;
  int v11;
  unsigned int v12;

  LODWORD(a3) = vcvtmd_u64_f64(a2);
  unint64_t v4 = a3 | ((unint64_t)(int)((a2 - floor(a2)) * 1000000000.0) << 32);
  do
  {
    mach_timespec_t v5 = (mach_timespec_t)v4;
    uint64_t v6 = semaphore_timedwait(*this, v5);
  }
  while (v6 == 14);
  unsigned int v7 = 0x100000000;
  unsigned int v8 = 0x100000000;
  unsigned int v9 = v6 & 0xFFFFFF00;
  int v10 = v6;
  if (v6 == 49) {
    int v10 = 0;
  }
  else {
    unsigned int v8 = 0;
  }
  if (v6 == 49) {
    unsigned int v9 = 0;
  }
  if (v6)
  {
    unsigned int v7 = v8;
    unint64_t v11 = v10;
  }
  else
  {
    unint64_t v11 = 1;
  }
  if (v6) {
    unsigned int v12 = v9;
  }
  else {
    unsigned int v12 = 0;
  }
  return v7 | v12 | v11;
}

caulk::concurrent::message **caulk::concurrent::details::rt_message_call<caulk::concurrent::details::messenger_servicer::drain(void)::{lambda(void)#1} &&>::perform(caulk::concurrent::message *a1)
{
  int v3 = a1;
  unint64_t v1 = (atomic_uint *)*((void *)a1 + 3);
  if ((atomic_fetch_add_explicit(v1 + 2, 1u, memory_order_release) & 0x80000000) != 0) {
    MEMORY[0x2166752E0](*v1);
  }
  return caulk::concurrent::details::rt_message_call<caulk::concurrent::details::messenger_servicer::drain(void)::{lambda(void)#1} &&>::rt_cleanup::~rt_cleanup(&v3);
}

void sub_21086A7F8(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  caulk::concurrent::details::rt_message_call<caulk::concurrent::details::messenger_servicer::drain(void)::{lambda(void)#1} &&>::rt_cleanup::~rt_cleanup((caulk::concurrent::message **)va);
  _Unwind_Resume(a1);
}

caulk::concurrent::message **caulk::concurrent::details::rt_message_call<caulk::concurrent::details::messenger_servicer::drain(void)::{lambda(void)#1} &&>::rt_cleanup::~rt_cleanup(caulk::concurrent::message **a1)
{
  unint64_t v2 = *a1;
  caulk::concurrent::message::~message(*a1);
  (*(void (**)(uint64_t, caulk::concurrent::message *, uint64_t, uint64_t))(*(void *)caulk::alloc::realtime_safe_resource
                                                                                  + 24))(caulk::alloc::realtime_safe_resource, v2, 40, 8);
  return a1;
}

void caulk::concurrent::message::~message(caulk::concurrent::message *this)
{
  *(void *)this = &unk_26C2AB750;
  if (atomic_load((unsigned int *)this + 4))
  {
    _os_assert_log();
    _os_crash();
    __break(1u);
  }
}

void caulk::alloc::darwin_resource<caulk::alloc::dsw_allocator2<true>,caulk::alloc::rt_safe_memory_resource>::do_deallocate(uint64_t a1, caulk::mach::vm_block *a2, unint64_t a3)
{
  uint64_t v6 = *(void (**)(uint64_t, uint64_t, caulk::mach::vm_block *, void, void, void))(a1 + 1600);
  if (v6) {
    v6(12, *(void *)(a1 + 1584) + 8, a2, 0, 0, 0);
  }

  caulk::alloc::tiered_allocator<caulk::alloc::size_range_tier<0ul,1008ul,caulk::alloc::tree_allocator<caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,16ul,6ul>>>,caulk::alloc::size_range_tier<1009ul,16128ul,caulk::alloc::tree_allocator<caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,256ul,6ul>>>,caulk::alloc::tracking_allocator<caulk::alloc::global_page_cache>>::deallocate(a1 + 16, a2, a3);
}

uint64_t caulk::concurrent::details::dispatch_receiver::messenger_signal_wakeup(uint64_t this)
{
  if ((atomic_exchange((atomic_uchar *volatile)(this + 104), 1u) & 1) == 0)
  {
    uint64_t v1 = 0x1C00000013;
    int v2 = *(_DWORD *)(this + 88);
    uint64_t v4 = 0;
    uint64_t v3 = 0;
    return mach_msg((mach_msg_header_t *)&v1, 1, 0x1Cu, 0, 0, 0, 0);
  }
  return this;
}

uint64_t caulk::mach::thread::priority_realtime::apply_to_thread(integer_t *this, pthread_t a2)
{
  thread_act_t v3 = pthread_mach_thread_np(a2);
  return thread_policy_set(v3, 2u, this, 4u);
}

uint64_t caulk::ipc::mapped_memory::reset(caulk::ipc::mapped_memory *this)
{
  uint64_t result = *(void *)this;
  if (result)
  {
    size_t v3 = *((void *)this + 1);
    if (v3) {
      uint64_t result = munmap((void *)result, v3);
    }
  }
  *(void *)this = 0;
  *((void *)this + 1) = 0;
  return result;
}

uint64_t caulk::mach::thread::priority_realtime::apply_to_this_thread(integer_t *this)
{
  int v2 = pthread_self();

  return caulk::mach::thread::priority_realtime::apply_to_thread(this, v2);
}

uint64_t caulk::mach::this_thread::set_priority(caulk::mach::thread::priority_absolute *a1)
{
  int v1 = *((_DWORD *)a1 + 4);
  if (v1 == -1) {
    uint64_t v2 = -1;
  }
  else {
    uint64_t v2 = *((unsigned int *)a1 + 4);
  }
  if (v2 == 2)
  {
    if (v1 != 2) {
      goto LABEL_20;
    }
    return caulk::mach::thread::priority_absolute::apply_to_this_thread(a1);
  }
  else
  {
    if (v2 != 1)
    {
      if (v2) {
        return 0xFFFFFFFFLL;
      }
      if (!v1)
      {
        return caulk::mach::thread::priority_qos::apply_to_this_thread(a1);
      }
LABEL_20:
      std::__throw_bad_variant_access[abi:ne180100]();
    }
    if (v1 != 1) {
      goto LABEL_20;
    }
    return caulk::mach::thread::priority_realtime::apply_to_this_thread((integer_t *)a1);
  }
}

double caulk::mach::os_workgroup_managed::make@<D0>(const char *a1@<X0>, mach_port_t a2@<W1>, uint64_t a3@<X8>)
{
  if (a1[23] < 0) {
    a1 = *(const char **)a1;
  }
  os_workgroup_t v4 = os_workgroup_create_with_port(a1, a2);
  *(void *)a3 = &unk_26C2AB808;
  *(void *)(a3 + 8) = v4;
  double result = 0.0;
  *(_OWORD *)(a3 + 16) = 0u;
  *(_OWORD *)(a3 + 32) = 0u;
  *(_OWORD *)(a3 + 41) = 0u;
  return result;
}

uint64_t caulk::thread::attributes::apply_to_this_thread(uint64_t this)
{
  uint64_t v1 = this;
  if (*(unsigned char *)(this + 24))
  {
    if (*(char *)(this + 23) < 0) {
      this = *(void *)this;
    }
    this = pthread_setname_np((const char *)this);
  }
  if (*(unsigned char *)(v1 + 52))
  {
    return caulk::mach::this_thread::set_priority((caulk::mach::thread::priority_absolute *)(v1 + 32));
  }
  return this;
}

atomic_ullong *caulk::concurrent::details::lf_read_sync_write_impl::end_mutate(atomic_ullong *this, __int16 a2)
{
  uint64_t v2 = (atomic_uint *)this;
  size_t v3 = 0;
  __dmb(0xBu);
  uint64_t v4 = *(unsigned int *)this;
  __int16 v5 = a2 << 15;
  while (1)
  {
    if ((v4 & 0x7FFF) != 0)
    {
      uint64_t v6 = v3;
      if (!(_WORD)v3)
      {
        caulk::details::semaphore_pool::instance((caulk::details::semaphore_pool *)this);
        this = (atomic_ullong *)caulk::details::semaphore_pool::acquire(v7);
        LOWORD(v3) = (_WORD)this;
        uint64_t v6 = this;
      }
    }
    else
    {
      if ((_WORD)v3)
      {
        caulk::details::semaphore_pool::instance((caulk::details::semaphore_pool *)this);
        this = (atomic_ullong *)caulk::details::semaphore_pool::sema_ref_to_bank((caulk::details::semaphore_pool *)(unsigned __int16)v3);
        uint64_t v6 = 0;
        atomic_fetch_and(this + 130, ~(1 << (v3 - *(_WORD *)this)));
      }
      else
      {
        uint64_t v6 = 0;
      }
      LODWORD(v3) = WORD1(v4);
    }
    uint64_t v8 = v4;
    atomic_compare_exchange_strong(v2, (unsigned int *)&v8, (unsigned __int16)(v4 & 0x7FFF | v5) | ((unsigned __int16)v3 << 16));
    if (v8 == v4) {
      break;
    }
    uint64_t v4 = v8;
    size_t v3 = v6;
  }
  if ((_WORD)v6)
  {
    caulk::details::semaphore_pool::instance((caulk::details::semaphore_pool *)this);
    unsigned int v9 = (_WORD *)caulk::details::semaphore_pool::sema_ref_to_bank((caulk::details::semaphore_pool *)(unsigned __int16)v6);
    BOOL v10 = caulk::semaphore::timed_wait((atomic_uint *)&v9[8 * (unsigned __int16)((_WORD)v6 - *v9) + 2], -1.0);
    caulk::details::semaphore_pool::instance((caulk::details::semaphore_pool *)v10);
    this = (atomic_ullong *)caulk::details::semaphore_pool::sema_ref_to_bank((caulk::details::semaphore_pool *)(unsigned __int16)v6);
    atomic_fetch_and(this + 130, ~(1 << (v6 - *(_WORD *)this)));
  }
  return this;
}

caulk::concurrent::messenger *caulk::concurrent::messenger::messenger(caulk::concurrent::messenger *a1, int a2, uint64_t a3)
{
  *(void *)a1 = 0;
  *((void *)a1 + 1) = 0;
  if (a2 == 1)
  {
    __int16 v5 = operator new(0xE0uLL);
    v5[1] = 0;
    std::runtime_error v5[2] = 0;
    *__int16 v5 = &unk_26C2ABC88;
    caulk::concurrent::details::service_thread::service_thread((caulk::concurrent::details::service_thread *)(v5 + 3), (const caulk::thread::attributes *)a3);
  }
  memset(&v35, 0, sizeof(v35));
  if (!*(unsigned char *)(a3 + 52))
  {
    _os_assert_log();
    _os_crash();
    __break(1u);
    goto LABEL_56;
  }
  uint64_t v6 = (unsigned int *)(a3 + 32);
  caulk::concurrent::messenger::shared_high_priority(a1);
  uint64_t v7 = *(unsigned int *)(a3 + 48);
  BOOL v8 = dword_26AA5D268 != v7 || dword_26AA5D268 == -1;
  int v9 = !v8;
  if (v7 == -1 || v9 == 0)
  {
    BOOL v11 = dword_26AA5D268 == -1;
    if (v7 != -1) {
      BOOL v11 = v9;
    }
    if (!v11)
    {
LABEL_21:
      if (!v7)
      {
        std::to_string(&__p, *v6);
        std::string v35 = __p;
        goto LABEL_24;
      }
LABEL_56:
      _os_assert_log();
      _os_crash();
      __break(1u);
      std::vector<std::weak_ptr<caulk::lifetime_observed<std::unique_ptr<caulk::concurrent::details::service_thread>,caulk::shared_instance_manager<caulk::concurrent::details::service_thread>::observer>>>::__throw_length_error[abi:ne180100]();
    }
  }
  else
  {
    __p.__r_.__value_.__r.__words[0] = (std::string::size_type)&v34;
    if (((unsigned int (*)(std::string *, uint64_t, uint64_t *))*(&off_26C2ABE50 + v7))(&__p, a3 + 32, &qword_26AA5D258))
    {
      LODWORD(v7) = *(_DWORD *)(a3 + 48);
      goto LABEL_21;
    }
  }
  *((unsigned char *)&v35.__r_.__value_.__s + 23) = 4;
  strcpy((char *)&v35, "high");
LABEL_24:
  std::operator+<char>();
  if (SHIBYTE(v34.__r_.__value_.__r.__words[2]) < 0) {
    std::string::__init_copy_ctor_external(&__p, v34.__r_.__value_.__l.__data_, v34.__r_.__value_.__l.__size_);
  }
  else {
    std::string __p = v34;
  }
  char v28 = 1;
  long long v29 = *(_OWORD *)v6;
  int v30 = *(_DWORD *)(a3 + 48);
  char v31 = 1;
  char v32 = 0;
  char v33 = 0;
  os_unfair_lock_lock((os_unfair_lock_t)&caulk::concurrent::details::service_thread::sharedMgr(void)::global);
  std::mersenne_twister_engine<unsigned int, 32, 624, 397, 31, 2567483615, 11, 4294967295, 7, 2636928640, 15, 4022730752, 18, 1812433253>::result_type v13 = std::remove_if[abi:ne180100]<std::__wrap_iter<std::weak_ptr<caulk::lifetime_observed<std::unique_ptr<caulk::concurrent::details::service_thread>,caulk::shared_instance_manager<caulk::concurrent::details::service_thread>::observer>> *>,caulk::shared_instance_manager<caulk::concurrent::details::service_thread>::remove_expired(void)::{lambda(std::__wrap_iter<std::weak_ptr<caulk::lifetime_observed<std::unique_ptr<caulk::concurrent::details::service_thread>,caulk::shared_instance_manager<caulk::concurrent::details::service_thread>::observer>> *> const&)#1}>((uint64_t *)qword_26AA5D280, (uint64_t *)qword_26AA5D288);
  std::vector<std::weak_ptr<caulk::lifetime_observed<std::unique_ptr<caulk::concurrent::details::service_thread>,caulk::shared_instance_manager<caulk::concurrent::details::service_thread>::observer>>>::erase((uint64_t)&qword_26AA5D280, (uint64_t)v13, qword_26AA5D288);
  uint64_t v14 = (void *)qword_26AA5D280;
  uint64_t v15 = qword_26AA5D288;
  if (qword_26AA5D280 == qword_26AA5D288) {
LABEL_42:
  }
    operator new();
  while (1)
  {
    unint64_t v16 = (std::__shared_weak_count *)v14[1];
    if (!v16) {
      goto LABEL_41;
    }
    unint64_t v17 = std::__shared_weak_count::lock(v16);
    if (!v17) {
      goto LABEL_41;
    }
    uint64_t v18 = v17;
    if (*v14)
    {
      uint64_t v19 = *(void *)(*v14 + 16);
      BOOL v20 = (*(unsigned char *)(a3 + 52) != 0) == (*(unsigned char *)(v19 + 188) != 0);
      if (*(unsigned char *)(a3 + 52) && *(unsigned char *)(v19 + 188))
      {
        uint64_t v21 = *(unsigned int *)(a3 + 48);
        int v22 = *(_DWORD *)(v19 + 184);
        BOOL v23 = v22 == v21;
        BOOL v8 = v22 == -1;
        BOOL v20 = v22 == -1;
        if (v8) {
          BOOL v23 = 0;
        }
        if (v21 != -1)
        {
          BOOL v20 = v23;
          if (v23)
          {
            unint64_t v37 = &v36;
            if (((uint64_t (*)(char **, uint64_t, uint64_t))*(&off_26C2ABE68 + v21))(&v37, a3 + 32, v19 + 168)) {
              break;
            }
            goto LABEL_40;
          }
        }
      }
      if (v20) {
        break;
      }
    }
LABEL_40:
    std::__shared_weak_count::__release_shared[abi:ne180100](v18);
LABEL_41:
    v14 += 2;
    if (v14 == (void *)v15) {
      goto LABEL_42;
    }
  }
  atomic_fetch_add_explicit(&v18->__shared_owners_, 1uLL, memory_order_relaxed);
  std::__shared_weak_count::__release_shared[abi:ne180100](v18);
  os_unfair_lock_unlock((os_unfair_lock_t)&caulk::concurrent::details::service_thread::sharedMgr(void)::global);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__p.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(v34.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v34.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(v35.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v35.__r_.__value_.__l.__data_);
  }
  uint64_t v24 = v19 + 56;
  atomic_fetch_add_explicit(&v18->__shared_owners_, 1uLL, memory_order_relaxed);
  unint64_t v25 = (std::__shared_weak_count *)*((void *)a1 + 1);
  if (!v19) {
    uint64_t v24 = 0;
  }
  *(void *)a1 = v24;
  *((void *)a1 + 1) = v18;
  if (v25) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v25);
  }
  caulk::alloc::init_realtime_safe_resource((caulk::alloc *)v25);
  std::__shared_weak_count::__release_shared[abi:ne180100](v18);
  return a1;
}

void sub_21086B220(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *a9, uint64_t a10, int a11, __int16 a12, char a13, char a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,void *__p,uint64_t a22,int a23,__int16 a24,char a25,char a26,void *a27,uint64_t a28,int a29,__int16 a30,char a31,char a32)
{
  if (a26 < 0) {
    operator delete(__p);
  }
  if (a32 < 0) {
    operator delete(a27);
  }
  std::string v34 = *(std::__shared_weak_count **)(v32 + 8);
  if (v34) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v34);
  }
  _Unwind_Resume(exception_object);
}

void std::__shared_weak_count::__release_shared[abi:ne180100](std::__shared_weak_count *a1)
{
  if (!atomic_fetch_add(&a1->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))a1->__on_zero_shared)(a1);
    std::__shared_weak_count::__release_weak(a1);
  }
}

uint64_t *std::remove_if[abi:ne180100]<std::__wrap_iter<std::weak_ptr<caulk::lifetime_observed<std::unique_ptr<caulk::concurrent::details::service_thread>,caulk::shared_instance_manager<caulk::concurrent::details::service_thread>::observer>> *>,caulk::shared_instance_manager<caulk::concurrent::details::service_thread>::remove_expired(void)::{lambda(std::__wrap_iter<std::weak_ptr<caulk::lifetime_observed<std::unique_ptr<caulk::concurrent::details::service_thread>,caulk::shared_instance_manager<caulk::concurrent::details::service_thread>::observer>> *> const&)#1}>(uint64_t *a1, uint64_t *a2)
{
  if (a1 == a2) {
    return a2;
  }
  size_t v3 = a1;
  while (1)
  {
    uint64_t v4 = v3[1];
    if (!v4 || *(void *)(v4 + 8) == -1) {
      break;
    }
    v3 += 2;
    if (v3 == a2) {
      return a2;
    }
  }
  if (v3 != a2)
  {
    for (int i = v3 + 2; i != a2; i += 2)
    {
      uint64_t v7 = i[1];
      if (v7 && *(void *)(v7 + 8) != -1)
      {
        uint64_t v8 = *i;
        *int i = 0;
        i[1] = 0;
        int v9 = (std::__shared_weak_count *)v3[1];
        uint64_t *v3 = v8;
        v3[1] = v7;
        if (v9) {
          std::__shared_weak_count::__release_weak(v9);
        }
        v3 += 2;
      }
    }
  }
  return v3;
}

void std::vector<std::weak_ptr<caulk::lifetime_observed<std::unique_ptr<caulk::concurrent::details::service_thread>,caulk::shared_instance_manager<caulk::concurrent::details::service_thread>::observer>>>::erase(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2 != a3)
  {
    uint64_t v3 = a3;
    uint64_t v4 = a2;
    uint64_t v6 = *(void *)(a1 + 8);
    if (a3 != v6)
    {
      uint64_t v7 = 16 * ((a3 - a2) >> 4);
      do
      {
        uint64_t v8 = (void *)(v4 + v7);
        long long v9 = *(_OWORD *)(v4 + v7);
        void *v8 = 0;
        v8[1] = 0;
        BOOL v10 = *(std::__shared_weak_count **)(v4 + 8);
        *(_OWORD *)uint64_t v4 = v9;
        if (v10) {
          std::__shared_weak_count::__release_weak(v10);
        }
        v4 += 16;
      }
      while (v4 + v7 != v6);
      uint64_t v3 = *(void *)(a1 + 8);
    }
    while (v3 != v4)
    {
      BOOL v11 = *(std::__shared_weak_count **)(v3 - 8);
      if (v11) {
        std::__shared_weak_count::__release_weak(v11);
      }
      v3 -= 16;
    }
    *(void *)(a1 + 8) = v4;
  }
}

BOOL std::__variant_detail::__visitation::__base::__dispatcher<0ul,0ul>::__dispatch[abi:ne180100]<std::__variant_detail::__visitation::__variant::__value_visitor<std::__convert_to_BOOL<std::equal_to<void>>> &&,std::__variant_detail::__base<(std::__variant_detail::_Trait)0,caulk::mach::thread::priority_qos,caulk::mach::priority_realtime,caulk::mach::priority_absolute> const&,std::__variant_detail::__base<(std::__variant_detail::_Trait)0,caulk::mach::thread::priority_qos,caulk::mach::priority_realtime,caulk::mach::priority_absolute> const>(uint64_t a1, _DWORD *a2, _DWORD *a3)
{
  return *a2 == *a3 && a2[1] == a3[1];
}

void std::string::__init_copy_ctor_external(std::string *this, const std::string::value_type *__s, std::string::size_type __sz)
{
  __int16 v5 = this;
  if (__sz > 0x16)
  {
    if (__sz >= 0x7FFFFFFFFFFFFFF8) {
      std::string::__throw_length_error[abi:ne180100]();
    }
    std::string::size_type v6 = (__sz & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((__sz | 7) != 0x17) {
      std::string::size_type v6 = __sz | 7;
    }
    std::string::size_type v7 = v6 + 1;
    uint64_t v8 = (std::string *)operator new(v6 + 1);
    v5->__r_.__value_.__l.__size_ = __sz;
    v5->__r_.__value_.__r.__words[2] = v7 | 0x8000000000000000;
    v5->__r_.__value_.__r.__words[0] = (std::string::size_type)v8;
    __int16 v5 = v8;
  }
  else
  {
    *((unsigned char *)&this->__r_.__value_.__s + 23) = __sz;
  }

  memmove(v5, __s, __sz + 1);
}

uint64_t caulk::alloc::init_realtime_safe_resource(caulk::alloc *this)
{
  v13[4] = *MEMORY[0x263EF8340];
  uint64_t v1 = (caulk::alloc::global_page_cache *)os_unfair_recursive_lock_lock_with_options();
  int v2 = caulk::alloc::init_realtime_safe_resource(void)::state;
  caulk::alloc::init_realtime_safe_resource(void)::state = 1;
  if (!v2)
  {
    if (byte_26AA55BD0)
    {
      qword_26AA55570 = (uint64_t)&unk_26C2AA398;
      qword_26AA55580 = (uint64_t)&unk_26C2AA248;
      uint64_t v3 = qword_26AA55BB0;
      qword_26AA55BB0 = 0;
      if (v3) {
        std::default_delete<caulk::alloc::darwin_resource<caulk::alloc::dsw_allocator2<true>,caulk::alloc::rt_safe_memory_resource>::zone_plus>::operator()[abi:ne180100](v3);
      }
      caulk::alloc::tree_allocator<caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,16ul,6ul>>::~tree_allocator((uint64_t)&unk_26AA55950);
      caulk::alloc::tree_allocator<caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,256ul,6ul>>::~tree_allocator((uint64_t)&unk_26AA556F0);
      caulk::alloc::tracking_allocator<caulk::alloc::global_page_cache>::~tracking_allocator((uint64_t)&qword_26AA55590);
      std::pmr::memory_resource::~memory_resource((std::pmr::memory_resource *)&qword_26AA55570);
      byte_26AA55BD0 = 0;
    }
    qword_26AA55570 = (uint64_t)&unk_26C2AA398;
    *(void *)algn_26AA55578 = 0;
    qword_26AA55590 = 0;
    caulk::alloc::global_page_cache::instance(v1);
    qword_26AA55590 = (uint64_t)&unk_26AA5D890;
    uint64_t v4 = (caulk::alloc::global_page_cache *)caulk::concurrent::skiplist<void *,caulk::alloc::detail::tracked_block,10,(caulk::concurrent::skiplist_options)0>::skiplist((uint64_t)&unk_26AA555A0);
    qword_26AA556F8 = 0;
    caulk::alloc::global_page_cache::instance(v4);
    qword_26AA556F8 = (uint64_t)&unk_26AA5D890;
    caulk::concurrent::skiplist<unsigned long,caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,256ul,6ul>::node_impl<caulk::alloc::tree_allocator<caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,256ul,6ul>>::node_header,caulk::alloc::embed_block_memory> *,5,(caulk::concurrent::skiplist_options)1>::skiplist((uint64_t)&unk_26AA55700);
    caulk::concurrent::skiplist<unsigned long,caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,256ul,6ul>::node_impl<caulk::alloc::tree_allocator<caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,256ul,6ul>>::node_header,caulk::alloc::embed_block_memory> *,5,(caulk::concurrent::skiplist_options)1>::skiplist((uint64_t)&qword_26AA557C8[11]);
    qword_26AA55940 = 0;
    BOOL v10 = &caulk::inplace_function_detail::vtable<void,caulk::concurrent::details::skiplist_node<unsigned long,caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,256ul,6ul>::node_impl<caulk::alloc::tree_allocator<caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,256ul,6ul>>::node_header,caulk::alloc::embed_block_memory> *>::layout_kv const&>::empty;
    v11[0] = &unk_26AA556F0;
    unsigned int v12 = _ZN5caulk16inplace_functionIFvRKNS_10concurrent7details13skiplist_nodeImPNS_5alloc15chunk_allocatorINS4_17global_page_cacheENS4_16bitmap_allocatorENS4_18embed_block_memoryELm16384EJLm256ELm6EEE9node_implINS4_14tree_allocatorIS9_E11node_headerES8_EEE9layout_kvEELm32ELm8ENS_23inplace_function_detail6vtableEE16k_wrapper_vtableIZNSC_C1EvEUlRKT_E_EE;
    _ZZN5caulk23inplace_function_detail6vtableIvJRKNS_10concurrent7details13skiplist_nodeImPNS_5alloc15chunk_allocatorINS5_17global_page_cacheENS5_16bitmap_allocatorENS5_18embed_block_memoryELm16384EJLm256ELm6EEE9node_implINS5_14tree_allocatorISA_E11node_headerES9_EEE9layout_kvEEEC1IZNSD_C1EvEUlRKT_E_EENS0_7wrapperISN_EEENUlPvST_E0_8__invokeEST_ST_(v13, v11);
    (*(void (**)(void *))(qword_26AA557C0 + 24))(qword_26AA557C8);
    uint64_t v5 = (uint64_t)v12;
    unsigned int v12 = (uint64_t (**)())&caulk::inplace_function_detail::vtable<void,caulk::concurrent::details::skiplist_node<unsigned long,caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,256ul,6ul>::node_impl<caulk::alloc::tree_allocator<caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,256ul,6ul>>::node_header,caulk::alloc::embed_block_memory> *>::layout_kv const&>::empty;
    qword_26AA557C0 = v5;
    (*(void (**)(void *, void *))(v5 + 16))(qword_26AA557C8, v13);
    ((void (*)(void *))v12[3])(v13);
    ((void (*)(void *))off_26C2A9A78)(v11);
    v9[0] = &unk_26AA556F0;
    unsigned int v12 = caulk::inplace_function<void ()(void),32ul,8ul,caulk::inplace_function_detail::vtable>::k_wrapper_vtable<caulk::alloc::tree_allocator<caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,256ul,6ul>>::tree_allocator(void)::{lambda(void)#1}>;
    caulk::inplace_function_detail::vtable<void>::vtable<caulk::alloc::tree_allocator<caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,256ul,6ul>>::tree_allocator(void)::{lambda(void)#1}>(caulk::inplace_function_detail::wrapper<caulk::alloc::tree_allocator<caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,256ul,6ul>>::tree_allocator(void)::{lambda(void)#1}>)::{lambda(void *,void *)#2}::__invoke(v13, v9);
    caulk::inplace_function<void ()(void),32ul,8ul,caulk::inplace_function_detail::vtable>::operator=(&qword_26AA557C8[40], (uint64_t *)&v12);
    ((void (*)(void *))v12[3])(v13);
    std::string::size_type v6 = (caulk::alloc::global_page_cache *)((uint64_t (*)(void *))off_26C2A99D8)(v9);
    qword_26AA55958 = 0;
    caulk::alloc::global_page_cache::instance(v6);
    qword_26AA55958 = (uint64_t)&unk_26AA5D890;
    caulk::concurrent::skiplist<unsigned long,caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,16ul,6ul>::node_impl<caulk::alloc::tree_allocator<caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,16ul,6ul>>::node_header,caulk::alloc::embed_block_memory> *,5,(caulk::concurrent::skiplist_options)1>::skiplist((uint64_t)&unk_26AA55960);
    caulk::concurrent::skiplist<unsigned long,caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,16ul,6ul>::node_impl<caulk::alloc::tree_allocator<caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,16ul,6ul>>::node_header,caulk::alloc::embed_block_memory> *,5,(caulk::concurrent::skiplist_options)1>::skiplist((uint64_t)&qword_26AA55A28[11]);
    qword_26AA55BA0 = 0;
    BOOL v10 = &caulk::inplace_function_detail::vtable<void,caulk::concurrent::details::skiplist_node<unsigned long,caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,16ul,6ul>::node_impl<caulk::alloc::tree_allocator<caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,16ul,6ul>>::node_header,caulk::alloc::embed_block_memory> *>::layout_kv const&>::empty;
    v11[0] = &unk_26AA55950;
    unsigned int v12 = _ZN5caulk16inplace_functionIFvRKNS_10concurrent7details13skiplist_nodeImPNS_5alloc15chunk_allocatorINS4_17global_page_cacheENS4_16bitmap_allocatorENS4_18embed_block_memoryELm16384EJLm16ELm6EEE9node_implINS4_14tree_allocatorIS9_E11node_headerES8_EEE9layout_kvEELm32ELm8ENS_23inplace_function_detail6vtableEE16k_wrapper_vtableIZNSC_C1EvEUlRKT_E_EE;
    _ZZN5caulk23inplace_function_detail6vtableIvJRKNS_10concurrent7details13skiplist_nodeImPNS_5alloc15chunk_allocatorINS5_17global_page_cacheENS5_16bitmap_allocatorENS5_18embed_block_memoryELm16384EJLm16ELm6EEE9node_implINS5_14tree_allocatorISA_E11node_headerES9_EEE9layout_kvEEEC1IZNSD_C1EvEUlRKT_E_EENS0_7wrapperISN_EEENUlPvST_E0_8__invokeEST_ST_(v13, v11);
    (*(void (**)(void *))(qword_26AA55A20 + 24))(qword_26AA55A28);
    uint64_t v7 = (uint64_t)v12;
    unsigned int v12 = (uint64_t (**)())&caulk::inplace_function_detail::vtable<void,caulk::concurrent::details::skiplist_node<unsigned long,caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,16ul,6ul>::node_impl<caulk::alloc::tree_allocator<caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,16ul,6ul>>::node_header,caulk::alloc::embed_block_memory> *>::layout_kv const&>::empty;
    qword_26AA55A20 = v7;
    (*(void (**)(void *, void *))(v7 + 16))(qword_26AA55A28, v13);
    ((void (*)(void *))v12[3])(v13);
    v9[0] = &unk_26AA55950;
    unsigned int v12 = caulk::inplace_function<void ()(void),32ul,8ul,caulk::inplace_function_detail::vtable>::k_wrapper_vtable<caulk::alloc::tree_allocator<caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,16ul,6ul>>::tree_allocator(void)::{lambda(void)#1}>;
    caulk::inplace_function_detail::vtable<void>::vtable<caulk::alloc::tree_allocator<caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,16ul,6ul>>::tree_allocator(void)::{lambda(void)#1}>(caulk::inplace_function_detail::wrapper<caulk::alloc::tree_allocator<caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,16ul,6ul>>::tree_allocator(void)::{lambda(void)#1}>)::{lambda(void *,void *)#2}::__invoke(v13, v9);
    caulk::inplace_function<void ()(void),32ul,8ul,caulk::inplace_function_detail::vtable>::operator=(&qword_26AA55A28[40], (uint64_t *)&v12);
    ((void (*)(void *))v12[3])(v13);
    qword_26AA55580 = (uint64_t)&unk_26C2AA248;
    operator new();
  }

  return os_unfair_recursive_lock_unlock();
}

void sub_21086BA50(_Unwind_Exception *a1)
{
}

char *caulk::concurrent::messenger::shared_high_priority(caulk::concurrent::messenger *this)
{
  {
    caulk::concurrent::messenger::shared_high_priority(void)::global = 0;
    byte_26AA5D250 = 0;
    qword_26AA5D258 = 0x100000037;
    dword_26AA5D268 = 2;
    byte_26AA5D26C = 1;
    byte_26AA5D270 = 0;
    byte_26AA5D274 = 0;
  }
  return &caulk::concurrent::messenger::shared_high_priority(void)::global;
}

uint64_t *caulk::alloc::global_page_cache::instance(caulk::alloc::global_page_cache *this)
{
  {
    caulk::alloc::darwin_resource<caulk::alloc::caching_page_allocator<16384ul>,caulk::alloc::memory_resource>::darwin_resource();
  }
  return &caulk::alloc::global_page_cache::instance(void)::global;
}

void sub_21086BBDC(_Unwind_Exception *a1)
{
}

void caulk::alloc::darwin_resource<caulk::alloc::caching_page_allocator<16384ul>,caulk::alloc::memory_resource>::darwin_resource()
{
}

void sub_21086BD68(_Unwind_Exception *a1)
{
  MEMORY[0x216674B00](v1, 0x10F0C40DEC95547);
  caulk::alloc::details::caching_page_allocator_base::~caching_page_allocator_base((caulk::alloc::details::caching_page_allocator_base *)&unk_26AA5D890);
  _Unwind_Resume(a1);
}

void caulk::alloc::details::caching_page_allocator_base::caching_page_allocator_base(caulk::alloc::details::caching_page_allocator_base *this, uint64_t a2)
{
  *(_DWORD *)this = 0;
  *((void *)this + 1) = 0;
  *((void *)this + 2) = a2;
  *((void *)this + 5) = 0;
  *((void *)this + 6) = 0;
  *((void *)this + 4) = 0;
  *((void *)this + 11) = 0;
  operator new();
}

void sub_21086BE74(_Unwind_Exception *a1)
{
  uint64_t v4 = v3;
  std::__shared_weak_count::__release_shared[abi:ne180100](v4);
  MEMORY[0x216674B00](v2, 0x20C40A759441BLL);
  std::__function::__value_func<void ()(unsigned long,unsigned long)>::~__value_func[abi:ne180100]((void *)(v1 + 64));
  _Unwind_Resume(a1);
}

double caulk::mach::os_workgroup_interval_managed::make_with_workload_id@<D0>(uint64_t a1@<X8>)
{
  if (os_workgroup_attr_set_interval_type())
  {
    *(void *)(a1 + 56) = 0;
    double result = 0.0;
    *(_OWORD *)(a1 + 40) = 0u;
    *(_OWORD *)(a1 + 24) = 0u;
    *(_OWORD *)(a1 + 8) = 0u;
    *(void *)a1 = &unk_26C2AB848;
  }
  else
  {
    uint64_t v3 = os_workgroup_interval_create_with_workload_id();
    double result = 0.0;
    *(_OWORD *)(a1 + 16) = 0u;
    *(_OWORD *)(a1 + 32) = 0u;
    *(_OWORD *)(a1 + 41) = 0u;
    *(void *)a1 = &unk_26C2AB848;
    *(void *)(a1 + 8) = v3;
    *(unsigned char *)(a1 + 57) = 0;
  }
  return result;
}

{
  return caulk::mach::os_workgroup_interval_managed::make_with_workload_id(a1);
}

atomic_ullong *std::__function::__func<caulk::alloc::page_cache_monitor_impl::page_cache_monitor_impl(caulk::alloc::page_cache_monitor &,caulk::shared_ptr_mutex<caulk::mach::unfair_lock> &,unsigned long)::$_1,std::allocator<caulk::alloc::page_cache_monitor_impl::page_cache_monitor_impl(caulk::alloc::page_cache_monitor &,caulk::shared_ptr_mutex<caulk::mach::unfair_lock> &,unsigned long)::$_1>,void ()(unsigned long,unsigned long)>::operator()(atomic_ullong *result, uint64_t a2, unint64_t *a3)
{
  unint64_t v3 = *a3;
  atomic_ullong v4 = result[1];
  unint64_t v5 = atomic_load((unint64_t *)(v4 + 160));
  if (v5 > v3 && (atomic_exchange((atomic_uchar *volatile)(v4 + 112), 1u) & 1) == 0) {
    return caulk::concurrent::details::messenger_servicer::enqueue(**(atomic_ullong ***)(v4 + 104), v4 + 80);
  }
  return result;
}

void std::__function::__func<caulk::alloc::page_cache_monitor_impl::page_cache_monitor_impl(caulk::alloc::page_cache_monitor &,caulk::shared_ptr_mutex<caulk::mach::unfair_lock> &,unsigned long)::$_0,std::allocator<caulk::alloc::page_cache_monitor_impl::page_cache_monitor_impl(caulk::alloc::page_cache_monitor &,caulk::shared_ptr_mutex<caulk::mach::unfair_lock> &,unsigned long)::$_0>,void ()(void)>::operator()(uint64_t a1)
{
  caulk::lifetime_guard<caulk::alloc::page_cache_monitor,caulk::shared_ptr_mutex<caulk::mach::unfair_lock>>::weak_ref::lock(&v4, (uint64_t *)(a1 + 8));
  uint64_t v1 = v4;
  if (v4)
  {
    os_unfair_lock_lock(*(os_unfair_lock_t *)(v4 + 24));
    uint64_t v2 = *(uint64_t ***)(v1 + 40);
    if (v2) {
      caulk::alloc::page_cache_monitor_impl::evaluate_reservations(v2);
    }
    os_unfair_lock_unlock(*(os_unfair_lock_t *)(v1 + 24));
  }
  unint64_t v3 = v5;
  if (v5)
  {
    std::__shared_weak_count::__release_shared[abi:ne180100](v3);
  }
}

void sub_21086C048(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, std::__shared_weak_count *a10)
{
  uint64_t v11 = v10;
  os_unfair_lock_unlock(*(os_unfair_lock_t *)(v11 + 24));
  if (a10) {
    std::__shared_weak_count::__release_shared[abi:ne180100](a10);
  }
  _Unwind_Resume(a1);
}

uint64_t std::function<void ()(unsigned long,unsigned long)>::operator()(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = a3;
  uint64_t v5 = a2;
  if (!a1) {
    std::__throw_bad_function_call[abi:ne180100]();
  }
  return (*(uint64_t (**)(uint64_t, uint64_t *, uint64_t *))(*(void *)a1 + 48))(a1, &v5, &v4);
}

void caulk::lifetime_guard<caulk::alloc::page_cache_monitor,caulk::shared_ptr_mutex<caulk::mach::unfair_lock>>::weak_ref::lock(void *a1, uint64_t *a2)
{
  unint64_t v3 = (std::__shared_weak_count *)a2[1];
  if (v3)
  {
    while (1)
    {
      uint64_t v5 = std::__shared_weak_count::lock(v3);
      if (!v5) {
        goto LABEL_6;
      }
      std::string::size_type v6 = v5;
      uint64_t v7 = *a2;
      if (!*a2) {
        break;
      }
      uint64_t v8 = *(os_unfair_lock_t **)(*(void *)(v7 + 16) + 48);
      if (os_unfair_lock_trylock(*v8))
      {
        *a1 = **(void **)(v7 + 16);
        a1[1] = v6;
        atomic_fetch_add_explicit(&v6->__shared_owners_, 1uLL, memory_order_relaxed);
        os_unfair_lock_unlock(*v8);
        goto LABEL_9;
      }
      std::__shared_weak_count::__release_shared[abi:ne180100](v6);
      std::this_thread::sleep_for[abi:ne180100]<long long,std::ratio<1l,1000l>>(5);
      unint64_t v3 = (std::__shared_weak_count *)a2[1];
      if (!v3) {
        goto LABEL_6;
      }
    }
    *a1 = 0;
    a1[1] = 0;
LABEL_9:
    std::__shared_weak_count::__release_shared[abi:ne180100](v6);
    return;
  }
LABEL_6:
  *a1 = 0;
  a1[1] = 0;
}

unint64_t caulk::alloc::details::caching_page_allocator_base::preallocate(unint64_t this, unint64_t a2, unint64_t a3)
{
  if (a3)
  {
    uint64_t v4 = (atomic_ullong *)this;
    if (*(void *)(this + 16) == a2)
    {
      if (0xFFFFFFFFFFFFFFFFLL / a3 <= a2)
      {
        _os_assert_log();
        this = _os_crash();
        __break(1u);
      }
      else
      {
        for (uint64_t i = 0; i != a3; ++i)
        {
          _X22 = caulk::alloc::page_allocator::allocate((caulk::alloc::page_allocator *)v4, a2, 0x1000uLL);
          madvise(_X22, v8, 3);
          _X2 = 0;
          _X3 = 0;
          __asm { CASPAL          X2, X3, X2, X3, [X8] }
          atomic_store(_X2, (unint64_t *)_X22);
          _X1 = 0;
          __asm { CASPAL          X0, X1, X22, X23, [X8] }
          if (this != _X2)
          {
            do
            {
              atomic_store(this, (unint64_t *)_X22);
              _X3 = 0;
              __asm { CASPAL          X2, X3, X22, X23, [X8] }
              uint64_t v19 = _X2 ^ this;
              this = _X2;
            }
            while (v19);
          }
          atomic_fetch_add(v4 + 6, 1uLL);
        }
      }
    }
  }
  return this;
}

uint64_t caulk::alloc::page_cache_monitor_impl::evaluate_reservations(uint64_t **this)
{
  unint64_t v2 = (unint64_t)this[19];
  unint64_t v3 = this[21];
  uint64_t v4 = this[22];
  while (v3 != v4)
  {
    uint64_t v5 = (std::__shared_weak_count *)v3[1];
    if (v5)
    {
      std::string::size_type v6 = std::__shared_weak_count::lock(v5);
      if (v6)
      {
        if (*v3)
        {
          if (*(void *)(*v3 + 32) > v2) {
            unint64_t v2 = *(void *)(*v3 + 32);
          }
        }
        std::__shared_weak_count::__release_shared[abi:ne180100](v6);
      }
    }
    v3 += 2;
  }
  atomic_store(v2, (unint64_t *)this + 20);
  uint64_t result = **this;
  unint64_t v8 = *(void *)(result + 48);
  if (v2 > v8)
  {
    unint64_t v9 = *(void *)(result + 16);
    return caulk::alloc::details::caching_page_allocator_base::preallocate(result, v9, v2 - v8);
  }
  return result;
}

uint64_t caulk::alloc::cascading_allocator<caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::serial_allocator,caulk::alloc::embed_block_memory,16384ul>>::allocate(uint64_t a1, unint64_t a2)
{
  atomic_fetch_add((atomic_uint *volatile)(a1 + 40), 0x801u);
  unint64_t v3 = *(unint64_t **)(a1 + 24);
  if (!v3) {
    unint64_t v3 = *(unint64_t **)(a1 + 16);
  }
  int v4 = 0;
  unint64_t v5 = (a2 + 7) & 0xFFFFFFFFFFFFFFF8;
  if (v5) {
    BOOL v6 = a2 > 0x3FF0;
  }
  else {
    BOOL v6 = 1;
  }
  while (!v3)
  {
LABEL_19:
    if (os_unfair_lock_trylock((os_unfair_lock_t)(a1 + 32)))
    {
      uint64_t v15 = caulk::alloc::details::caching_page_allocator_base::allocate(*(caulk::alloc::details::caching_page_allocator_base **)(a1 + 8), 0x4000, 0x10uLL);
      unint64_t v3 = v15;
      *uint64_t v15 = 0;
      v15[1] = v16;
      v15[2] = 0;
      __dmb(0xBu);
      unint64_t v17 = *(void *)(a1 + 16);
      atomic_store(v17, v15);
      unint64_t v18 = v17;
      atomic_compare_exchange_strong((atomic_ullong *volatile)(a1 + 16), &v18, (unint64_t)v15);
      if (v18 != v17)
      {
        unint64_t v19 = v18;
        do
        {
          atomic_store(v18, v15);
          atomic_compare_exchange_strong((atomic_ullong *volatile)(a1 + 16), &v19, (unint64_t)v15);
          BOOL v14 = v19 == v18;
          unint64_t v18 = v19;
        }
        while (!v14);
      }
      os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 32));
    }
    else if (++v4 == 100)
    {
      sched_yield();
      int v4 = 0;
    }
  }
  unint64_t v7 = (unint64_t)v3;
  while (1)
  {
    if (!v6)
    {
      uint64_t v8 = *(void *)(v7 + 16);
      uint64_t v9 = ~((_BYTE)v7 + 39 + (_BYTE)v8) & 7;
      unint64_t v10 = v8 + v5 + v9;
      if (v10 <= 0x3FE0) {
        break;
      }
    }
LABEL_10:
    unint64_t v7 = atomic_load((unint64_t *)v7);
    if (!v7) {
      unint64_t v7 = *(void *)(a1 + 16);
    }
    if (v3 == (unint64_t *)v7) {
      goto LABEL_19;
    }
  }
  uint64_t v11 = *(void *)(v7 + 16);
  atomic_compare_exchange_strong((atomic_ullong *volatile)(v7 + 16), (unint64_t *)&v11, v10);
  if (v11 != v8)
  {
    do
    {
      uint64_t v9 = ~((_BYTE)v7 + 39 + (_BYTE)v11) & 7;
      unint64_t v12 = v11 + v5 + v9;
      if (v12 > 0x3FE0) {
        goto LABEL_10;
      }
      uint64_t v8 = v11;
      uint64_t v13 = v11;
      atomic_compare_exchange_strong((atomic_ullong *volatile)(v7 + 16), (unint64_t *)&v13, v12);
      BOOL v14 = v13 == v11;
      uint64_t v11 = v13;
    }
    while (!v14);
  }
  uint64_t v20 = v7 + 32 + v8 + v9;
  caulk::alloc::base_allocator::assert_aligned(v20, 8);
  *(void *)(a1 + 24) = v7;
  atomic_fetch_add((atomic_uint *volatile)(a1 + 40), 0xFFFFFFFF);
  return v20;
}

void sub_21086C500(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v2);
  atomic_fetch_add((atomic_uint *volatile)(v1 + 40), 0xFFFFFFFF);
  _Unwind_Resume(a1);
}

uint64_t caulk::alloc::base_allocator::assert_aligned(uint64_t this, uint64_t a2)
{
  if (((a2 - 1) & this) != 0)
  {
    _os_assert_log();
    this = _os_crash();
    __break(1u);
  }
  return this;
}

uint64_t caulk::mach::os_workgroup_managed::leave(caulk::mach::os_workgroup_managed *this)
{
  if (!*((unsigned char *)this + 56)) {
    return 1;
  }
  if (!*((void *)this + 1)) {
    return 2;
  }
  os_workgroup_leave_self();
  uint64_t result = 0;
  *((unsigned char *)this + 56) = 0;
  return result;
}

uint64_t caulk::concurrent::condition_message::perform(caulk::concurrent::condition_message *this)
{
  atomic_store(0, (unsigned __int8 *)this + 32);
  uint64_t v1 = *((void *)this + 8);
  if (!v1) {
    std::__throw_bad_function_call[abi:ne180100]();
  }
  unint64_t v2 = *(uint64_t (**)(void))(*(void *)v1 + 48);

  return v2();
}

uint64_t caulk::mach::this_thread::set_name(caulk::mach::this_thread *this, const char *a2)
{
  return pthread_setname_np((const char *)this);
}

void __clang_call_terminate(void *a1)
{
}

uint64_t caulk::mach::thread::priority_qos::apply_to_this_thread(caulk::mach::thread::priority_qos *this)
{
  return pthread_set_qos_class_self_np(*(qos_class_t *)this, *((_DWORD *)this + 1));
}

void std::__throw_bad_variant_access[abi:ne180100]()
{
  exception = __cxa_allocate_exception(8uLL);
  void *exception = MEMORY[0x263F8C3A8] + 16;
  __cxa_throw(exception, MEMORY[0x263F8C1F8], (void (*)(void *))std::bad_variant_access::~bad_variant_access);
}

uint64_t caulk::mach::thread::priority_absolute::apply_to_this_thread(caulk::mach::thread::priority_absolute *this)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  unint64_t v2 = pthread_self();
  thread_act_t v3 = pthread_mach_thread_np(v2);
  thread_act_t v4 = v3;
  if (!v3) {
    return 0xFFFFFFFFLL;
  }
  integer_t policy_info = *((unsigned __int8 *)this + 4);
  uint64_t result = thread_policy_set(v3, 1u, &policy_info, 1u);
  if (!result)
  {
    pid_t v6 = getpid();
    int v7 = proc_pidinfo(v6, 2, 0, buffer, 232);
    int v8 = v12;
    if (v7 <= 0) {
      int v8 = 0;
    }
    integer_t v9 = *(_DWORD *)this - v8;
    return thread_policy_set(v4, 3u, &v9, 1u);
  }
  return result;
}

void sub_21086C780(_Unwind_Exception *a1, int a2)
{
  if (!a2) {
    _Unwind_Resume(a1);
  }
  __clang_call_terminate(a1);
}

_opaque_pthread_t *caulk::mach::thread::get_base_priority(_opaque_pthread_t *this, _opaque_pthread_t *a2)
{
  return get_priority(this, 0);
}

_opaque_pthread_t *get_priority(_opaque_pthread_t *result, int a2)
{
  if (result)
  {
    thread_inspect_t v3 = pthread_mach_thread_np(result);
    mach_msg_type_number_t thread_info_outCnt = 10;
    if (thread_info(v3, 3u, thread_info_out, &thread_info_outCnt)) {
      return 0;
    }
    switch(v9)
    {
      case 4:
        mach_msg_type_number_t thread_info_outCnt = 4;
        if (thread_info(v3, 0xCu, v7, &thread_info_outCnt)) {
          return 0;
        }
        if (v7[2] && a2) {
          return (_opaque_pthread_t *)v7[3];
        }
        else {
          return (_opaque_pthread_t *)v7[1];
        }
      case 2:
        mach_msg_type_number_t thread_info_outCnt = 5;
        if (thread_info(v3, 0xBu, v6, &thread_info_outCnt)) {
          return 0;
        }
        if (v6[3] && a2) {
          return (_opaque_pthread_t *)v6[4];
        }
        else {
          return (_opaque_pthread_t *)v6[1];
        }
      case 1:
        mach_msg_type_number_t thread_info_outCnt = 5;
        if (thread_info(v3, 0xAu, v5, &thread_info_outCnt)) {
          return 0;
        }
        if (a2) {
          return (_opaque_pthread_t *)v5[2];
        }
        else {
          return (_opaque_pthread_t *)v5[1];
        }
      default:
        return 0;
    }
  }
  return result;
}

_opaque_pthread_t *caulk::mach::thread::get_scheduled_priority(_opaque_pthread_t *this, _opaque_pthread_t *a2)
{
  return get_priority(this, 1);
}

void *caulk::mach::thread::get_name@<X0>(_opaque_pthread_t *this@<X0>, void *a2@<X8>)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  memset(v6, 0, sizeof(v6));
  int v4 = pthread_getname_np(this, (char *)v6, 0x100uLL);
  check_posix_error((uint64_t)"pthread_getname_np failed", v4);
  return std::string::basic_string[abi:ne180100]<0>(a2, (char *)v6);
}

uint64_t check_posix_error(uint64_t result, int a2)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  if (a2)
  {
    uint64_t v2 = result;
    uint64_t v3 = *__error();
    int v4 = std::generic_category();
    MEMORY[0x2166748E0](v8, v3, v4, v2);
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
    {
      unint64_t v5 = std::runtime_error::what(v8);
      *(_DWORD *)buf = 136315138;
      unint64_t v10 = v5;
      _os_log_error_impl(&dword_210865000, &_os_log_internal, OS_LOG_TYPE_ERROR, "%s", buf, 0xCu);
    }
    exception = (std::runtime_error *)__cxa_allocate_exception(0x20uLL);
    uint64_t v7 = std::runtime_error::runtime_error(exception, v8);
    v7->__vftable = (std::runtime_error_vtbl *)(MEMORY[0x263F8C2E8] + 16);
    v7[1] = v8[1];
    __cxa_throw(v7, MEMORY[0x263F8C1A8], MEMORY[0x263F8C0D8]);
  }
  return result;
}

void sub_21086CA84(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, std::runtime_error a9)
{
}

void *std::string::basic_string[abi:ne180100]<0>(void *a1, char *__s)
{
  size_t v4 = strlen(__s);
  if (v4 >= 0x7FFFFFFFFFFFFFF8) {
    std::string::__throw_length_error[abi:ne180100]();
  }
  size_t v5 = v4;
  if (v4 >= 0x17)
  {
    uint64_t v7 = (v4 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v4 | 7) != 0x17) {
      uint64_t v7 = v4 | 7;
    }
    uint64_t v8 = v7 + 1;
    pid_t v6 = operator new(v7 + 1);
    a1[1] = v5;
    a1[2] = v8 | 0x8000000000000000;
    *a1 = v6;
  }
  else
  {
    *((unsigned char *)a1 + 23) = v4;
    pid_t v6 = a1;
    if (!v4) {
      goto LABEL_9;
    }
  }
  memmove(v6, __s, v5);
LABEL_9:
  *((unsigned char *)v6 + v5) = 0;
  return a1;
}

void std::string::__throw_length_error[abi:ne180100]()
{
}

void std::__throw_length_error[abi:ne180100](const char *a1)
{
  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  std::length_error::length_error[abi:ne180100](exception, a1);
  __cxa_throw(exception, (struct type_info *)off_26413A948, MEMORY[0x263F8C060]);
}

void sub_21086CBB0(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

std::logic_error *std::length_error::length_error[abi:ne180100](std::logic_error *a1, const char *a2)
{
  uint64_t result = std::logic_error::logic_error(a1, a2);
  result->__vftable = (std::logic_error_vtbl *)(MEMORY[0x263F8C388] + 16);
  return result;
}

uint64_t caulk::mach::thread::get_qos_class(_opaque_pthread_t *this, _opaque_pthread_t *a2)
{
  *(void *)__qos_class = 21;
  int qos_class_np = pthread_get_qos_class_np(this, __qos_class, (int *)&__qos_class[1]);
  check_posix_error((uint64_t)"pthread_get_qos_class_np failed", qos_class_np);
  return *(void *)__qos_class;
}

BOOL caulk::memory_resource::do_is_equal(uint64_t a1, uint64_t a2)
{
  return a1 == a2;
}

uint64_t caulk::alloc::memory_resource::malloc_zone(caulk::alloc::memory_resource *this)
{
  return 0;
}

uint64_t *caulk::alloc::base_allocator::log(caulk::alloc::base_allocator *this)
{
  {
    qword_26AA5D868 = 0;
    caulk::alloc::base_allocator::log(void)::global = (uint64_t)os_log_create("com.apple.audio.caulk", "alloc");
  }
  return &caulk::alloc::base_allocator::log(void)::global;
}

uint64_t *caulk::alloc::get_default_resource(caulk::alloc *this)
{
  {
    caulk::alloc::get_default_resource(void)::global = (uint64_t)&unk_26C2AA4B0;
  }
  return &caulk::alloc::get_default_resource(void)::global;
}

void caulk::alloc::resource<caulk::alloc::malloc_allocator,caulk::alloc::memory_resource>::reserve(void *a1@<X8>)
{
  *a1 = 0;
  a1[1] = 0;
}

uint64_t caulk::alloc::resource<caulk::alloc::malloc_allocator,caulk::alloc::memory_resource>::compact()
{
  return 0;
}

void *caulk::alloc::resource<caulk::alloc::malloc_allocator,caulk::alloc::memory_resource>::print(caulk::alloc::malloc_allocator *a1, uint64_t a2, int a3)
{
  void v9[4] = *MEMORY[0x263EF8340];
  uint64_t v6 = a2;
  int v7 = 0;
  char v8 = 0;
  uint64_t result = caulk::alloc::malloc_allocator::describe(a1, (caulk::alloc::base_allocator::formatter *)&v6);
  if (a3)
  {
    v9[0] = &unk_26C2AA928;
    v9[1] = a2;
    v9[3] = v9;
    return std::__function::__value_func<void ()(caulk::alloc::region_usage,caulk::alloc::block)>::~__value_func[abi:ne180100](v9);
  }
  return result;
}

void *std::__function::__value_func<void ()(caulk::alloc::region_usage,caulk::alloc::block)>::~__value_func[abi:ne180100](void *a1)
{
  uint64_t v2 = (void *)a1[3];
  if (v2 == a1)
  {
    (*(void (**)(void *))(*a1 + 32))(a1);
  }
  else if (v2)
  {
    (*(void (**)(void *))(*v2 + 40))(v2);
  }
  return a1;
}

void *std::__function::__func<void caulk::alloc::print_allocator<caulk::alloc::resource<caulk::alloc::malloc_allocator,caulk::alloc::memory_resource>>(caulk::alloc::resource<caulk::alloc::malloc_allocator,caulk::alloc::memory_resource> &,std::ostream &,BOOL)::{lambda(caulk::alloc::region_usage,caulk::alloc::block)#1},std::allocator<void caulk::alloc::print_allocator<caulk::alloc::resource<caulk::alloc::malloc_allocator,caulk::alloc::memory_resource>>(caulk::alloc::resource<caulk::alloc::malloc_allocator,caulk::alloc::memory_resource> &,std::ostream &,BOOL)::{lambda(caulk::alloc::region_usage,caulk::alloc::block)#1}>,void ()(caulk::alloc::region_usage,caulk::alloc::block)>::target_type()
{
}

uint64_t std::__function::__func<void caulk::alloc::print_allocator<caulk::alloc::resource<caulk::alloc::malloc_allocator,caulk::alloc::memory_resource>>(caulk::alloc::resource<caulk::alloc::malloc_allocator,caulk::alloc::memory_resource> &,std::ostream &,BOOL)::{lambda(caulk::alloc::region_usage,caulk::alloc::block)#1},std::allocator<void caulk::alloc::print_allocator<caulk::alloc::resource<caulk::alloc::malloc_allocator,caulk::alloc::memory_resource>>(caulk::alloc::resource<caulk::alloc::malloc_allocator,caulk::alloc::memory_resource> &,std::ostream &,BOOL)::{lambda(caulk::alloc::region_usage,caulk::alloc::block)#1}>,void ()(caulk::alloc::region_usage,caulk::alloc::block)>::target(uint64_t a1, uint64_t a2)
{
  if (std::type_info::operator==[abi:ne180100](*(void *)(a2 + 8), (uint64_t)"ZN5caulk5alloc15print_allocatorINS0_8resourceINS0_16malloc_allocatorENS0_15memory_resourceEEEEEvRT_RNSt3__113basic_ostreamIcNS8_11char_traitsIcEEEEbEUlNS0_12region_usageENS0_5blockEE_"))
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

BOOL std::type_info::operator==[abi:ne180100](uint64_t a1, uint64_t a2)
{
  if (a1 == a2) {
    return 1;
  }
  if ((a2 & a1) < 0 != __OFSUB__(a1, a2)) {
    return strcmp((const char *)(a1 & 0x7FFFFFFFFFFFFFFFLL), (const char *)(a2 & 0x7FFFFFFFFFFFFFFFLL)) == 0;
  }
  return 0;
}

uint64_t std::__function::__func<void caulk::alloc::print_allocator<caulk::alloc::resource<caulk::alloc::malloc_allocator,caulk::alloc::memory_resource>>(caulk::alloc::resource<caulk::alloc::malloc_allocator,caulk::alloc::memory_resource> &,std::ostream &,BOOL)::{lambda(caulk::alloc::region_usage,caulk::alloc::block)#1},std::allocator<void caulk::alloc::print_allocator<caulk::alloc::resource<caulk::alloc::malloc_allocator,caulk::alloc::memory_resource>>(caulk::alloc::resource<caulk::alloc::malloc_allocator,caulk::alloc::memory_resource> &,std::ostream &,BOOL)::{lambda(caulk::alloc::region_usage,caulk::alloc::block)#1}>,void ()(caulk::alloc::region_usage,caulk::alloc::block)>::operator()(uint64_t a1, int *a2)
{
  return caulk::alloc::describe_block(*(void *)(a1 + 8), *a2);
}

uint64_t caulk::alloc::describe_block(uint64_t a1, int a2)
{
  if ((a2 - 1) > 3) {
    uint64_t v2 = "?";
  }
  else {
    uint64_t v2 = off_26413AA48[a2 - 1];
  }
  uint64_t v3 = (void *)std::ostream::operator<<();
  char v10 = 58;
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v3, (uint64_t)&v10, 1);
  size_t v4 = (void *)std::ostream::operator<<();
  char v11 = 32;
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v4, (uint64_t)&v11, 1);
  size_t v5 = strlen(v2);
  uint64_t v6 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v4, (uint64_t)v2, v5);
  char v12 = 32;
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v6, (uint64_t)&v12, 1);
  int v7 = (void *)std::ostream::operator<<();
  std::ios_base::getloc((const std::ios_base *)((char *)v7 + *(void *)(*v7 - 24)));
  char v8 = std::locale::use_facet(&v13, MEMORY[0x263F8C108]);
  ((void (*)(const std::locale::facet *, uint64_t))v8->__vftable[2].~facet_0)(v8, 10);
  std::locale::~locale(&v13);
  std::ostream::put();
  return std::ostream::flush();
}

void sub_21086D094(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, std::locale a10)
{
}

void *std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(void *a1, uint64_t a2, uint64_t a3)
{
  MEMORY[0x216674960](v23, a1);
  if (v23[0])
  {
    uint64_t v6 = (char *)a1 + *(void *)(*a1 - 24);
    uint64_t v7 = *((void *)v6 + 5);
    int v8 = *((_DWORD *)v6 + 2);
    int v9 = *((_DWORD *)v6 + 36);
    if (v9 == -1)
    {
      std::ios_base::getloc((const std::ios_base *)((char *)a1 + *(void *)(*a1 - 24)));
      char v10 = std::locale::use_facet(&__b, MEMORY[0x263F8C108]);
      int v9 = ((uint64_t (*)(const std::locale::facet *, uint64_t))v10->__vftable[2].~facet_0)(v10, 32);
      std::locale::~locale(&__b);
      *((_DWORD *)v6 + 36) = v9;
    }
    uint64_t v11 = a2 + a3;
    if ((v8 & 0xB0) == 0x20) {
      uint64_t v12 = a2 + a3;
    }
    else {
      uint64_t v12 = a2;
    }
    if (!v7) {
      goto LABEL_29;
    }
    uint64_t v13 = *((void *)v6 + 3);
    BOOL v14 = v13 <= a3;
    uint64_t v15 = v13 - a3;
    size_t v16 = v14 ? 0 : v15;
    if (v12 - a2 >= 1
      && (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)v7 + 96))(v7, a2, v12 - a2) != v12 - a2)
    {
      goto LABEL_29;
    }
    if ((uint64_t)v16 >= 1)
    {
      if (v16 >= 0x7FFFFFFFFFFFFFF8) {
        std::string::__throw_length_error[abi:ne180100]();
      }
      if (v16 >= 0x17)
      {
        uint64_t v18 = (v16 & 0xFFFFFFFFFFFFFFF8) + 8;
        if ((v16 | 7) != 0x17) {
          uint64_t v18 = v16 | 7;
        }
        uint64_t v19 = v18 + 1;
        p_b = (std::locale::__imp *)operator new(v18 + 1);
        size_t v25 = v16;
        int64_t v26 = v19 | 0x8000000000000000;
        __b.__locale_ = p_b;
      }
      else
      {
        HIBYTE(v26) = v16;
        p_b = (std::locale::__imp *)&__b;
      }
      memset(p_b, v9, v16);
      *((unsigned char *)p_b + v16) = 0;
      uint64_t v20 = v26 >= 0 ? &__b : (std::locale *)__b.__locale_;
      uint64_t v21 = (*(uint64_t (**)(uint64_t, std::locale *, size_t))(*(void *)v7 + 96))(v7, v20, v16);
      if (SHIBYTE(v26) < 0) {
        operator delete(__b.__locale_);
      }
      if (v21 != v16) {
        goto LABEL_29;
      }
    }
    if (v11 - v12 < 1
      || (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)v7 + 96))(v7, v12, v11 - v12) == v11 - v12)
    {
      *((void *)v6 + 3) = 0;
    }
    else
    {
LABEL_29:
      std::ios_base::clear((std::ios_base *)((char *)a1 + *(void *)(*a1 - 24)), *(_DWORD *)((char *)a1 + *(void *)(*a1 - 24) + 32) | 5);
    }
  }
  MEMORY[0x216674970](v23);
  return a1;
}

void sub_21086D344(void *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, uint64_t a11, void *__p, uint64_t a13, int a14, __int16 a15, char a16, char a17)
{
  if (a17 < 0) {
    operator delete(__p);
  }
  MEMORY[0x216674970](&a10);
  __cxa_begin_catch(a1);
  std::ios_base::__set_badbit_and_consider_rethrow((std::ios_base *)((char *)v17 + *(void *)(*v17 - 24)));
  __cxa_end_catch();
  JUMPOUT(0x21086D318);
}

void sub_21086D3B0(_Unwind_Exception *a1)
{
}

uint64_t std::__function::__func<void caulk::alloc::print_allocator<caulk::alloc::resource<caulk::alloc::malloc_allocator,caulk::alloc::memory_resource>>(caulk::alloc::resource<caulk::alloc::malloc_allocator,caulk::alloc::memory_resource> &,std::ostream &,BOOL)::{lambda(caulk::alloc::region_usage,caulk::alloc::block)#1},std::allocator<void caulk::alloc::print_allocator<caulk::alloc::resource<caulk::alloc::malloc_allocator,caulk::alloc::memory_resource>>(caulk::alloc::resource<caulk::alloc::malloc_allocator,caulk::alloc::memory_resource> &,std::ostream &,BOOL)::{lambda(caulk::alloc::region_usage,caulk::alloc::block)#1}>,void ()(caulk::alloc::region_usage,caulk::alloc::block)>::__clone(uint64_t result, void *a2)
{
  uint64_t v2 = *(void *)(result + 8);
  *a2 = &unk_26C2AA928;
  a2[1] = v2;
  return result;
}

void *std::__function::__func<void caulk::alloc::print_allocator<caulk::alloc::resource<caulk::alloc::malloc_allocator,caulk::alloc::memory_resource>>(caulk::alloc::resource<caulk::alloc::malloc_allocator,caulk::alloc::memory_resource> &,std::ostream &,BOOL)::{lambda(caulk::alloc::region_usage,caulk::alloc::block)#1},std::allocator<void caulk::alloc::print_allocator<caulk::alloc::resource<caulk::alloc::malloc_allocator,caulk::alloc::memory_resource>>(caulk::alloc::resource<caulk::alloc::malloc_allocator,caulk::alloc::memory_resource> &,std::ostream &,BOOL)::{lambda(caulk::alloc::region_usage,caulk::alloc::block)#1}>,void ()(caulk::alloc::region_usage,caulk::alloc::block)>::__clone(uint64_t a1)
{
  uint64_t result = operator new(0x10uLL);
  uint64_t v3 = *(void *)(a1 + 8);
  *uint64_t result = &unk_26C2AA928;
  result[1] = v3;
  return result;
}

void std::__function::__func<void caulk::alloc::print_allocator<caulk::alloc::resource<caulk::alloc::malloc_allocator,caulk::alloc::memory_resource>>(caulk::alloc::resource<caulk::alloc::malloc_allocator,caulk::alloc::memory_resource> &,std::ostream &,BOOL)::{lambda(caulk::alloc::region_usage,caulk::alloc::block)#1},std::allocator<void caulk::alloc::print_allocator<caulk::alloc::resource<caulk::alloc::malloc_allocator,caulk::alloc::memory_resource>>(caulk::alloc::resource<caulk::alloc::malloc_allocator,caulk::alloc::memory_resource> &,std::ostream &,BOOL)::{lambda(caulk::alloc::region_usage,caulk::alloc::block)#1}>,void ()(caulk::alloc::region_usage,caulk::alloc::block)>::~__func()
{
}

BOOL caulk::alloc::resource<caulk::alloc::malloc_allocator,caulk::alloc::memory_resource>::do_is_equal(uint64_t a1, uint64_t a2)
{
  return a1 == a2;
}

void caulk::alloc::resource<caulk::alloc::malloc_allocator,caulk::alloc::memory_resource>::do_deallocate(int a1, void *a2)
{
}

void *caulk::alloc::resource<caulk::alloc::malloc_allocator,caulk::alloc::memory_resource>::do_allocate(caulk::alloc::malloc_allocator *a1, size_t a2, size_t a3)
{
  uint64_t result = caulk::alloc::malloc_allocator::allocate(a1, a2, a3);
  if (!result)
  {
    exception = (std::bad_alloc *)__cxa_allocate_exception(8uLL);
    size_t v5 = std::bad_alloc::bad_alloc(exception);
    __cxa_throw(v5, MEMORY[0x263F8C218], MEMORY[0x263F8C170]);
  }
  return result;
}

void caulk::alloc::resource<caulk::alloc::malloc_allocator,caulk::alloc::memory_resource>::~resource()
{
}

void caulk::alloc::create_malloc_zone_resource(caulk::alloc *this, const char *a2)
{
}

void sub_21086D550(_Unwind_Exception *a1)
{
  (*(void (**)(uint64_t))(*(void *)v1 + 8))(v1);
  _Unwind_Resume(a1);
}

uint64_t caulk::alloc::resource_with_zone<caulk::alloc::malloc_zone_allocator>::malloc_zone(uint64_t a1)
{
  return *(void *)(a1 + 16);
}

void caulk::alloc::resource<caulk::alloc::malloc_zone_allocator,caulk::alloc::memory_resource>::reserve(void *a1@<X8>)
{
  *a1 = 0;
  a1[1] = 0;
}

uint64_t caulk::alloc::resource<caulk::alloc::malloc_zone_allocator,caulk::alloc::memory_resource>::compact()
{
  return 0;
}

void *caulk::alloc::resource<caulk::alloc::malloc_zone_allocator,caulk::alloc::memory_resource>::print(uint64_t a1, uint64_t a2, int a3)
{
  void v9[4] = *MEMORY[0x263EF8340];
  uint64_t v6 = a2;
  int v7 = 0;
  char v8 = 0;
  uint64_t result = caulk::alloc::malloc_zone_allocator::describe((malloc_zone_t **)(a1 + 8), (caulk::alloc::base_allocator::formatter *)&v6);
  if (a3)
  {
    v9[0] = &unk_26C2AA9D8;
    v9[1] = a2;
    v9[3] = v9;
    return std::__function::__value_func<void ()(caulk::alloc::region_usage,caulk::alloc::block)>::~__value_func[abi:ne180100](v9);
  }
  return result;
}

void *std::__function::__func<void caulk::alloc::print_allocator<caulk::alloc::resource<caulk::alloc::malloc_zone_allocator,caulk::alloc::memory_resource>>(caulk::alloc::resource<caulk::alloc::malloc_zone_allocator,caulk::alloc::memory_resource> &,std::ostream &,BOOL)::{lambda(caulk::alloc::region_usage,caulk::alloc::block)#1},std::allocator<void caulk::alloc::print_allocator<caulk::alloc::resource<caulk::alloc::malloc_zone_allocator,caulk::alloc::memory_resource>>(caulk::alloc::resource<caulk::alloc::malloc_zone_allocator,caulk::alloc::memory_resource> &,std::ostream &,BOOL)::{lambda(caulk::alloc::region_usage,caulk::alloc::block)#1}>,void ()(caulk::alloc::region_usage,caulk::alloc::block)>::target_type()
{
}

uint64_t std::__function::__func<void caulk::alloc::print_allocator<caulk::alloc::resource<caulk::alloc::malloc_zone_allocator,caulk::alloc::memory_resource>>(caulk::alloc::resource<caulk::alloc::malloc_zone_allocator,caulk::alloc::memory_resource> &,std::ostream &,BOOL)::{lambda(caulk::alloc::region_usage,caulk::alloc::block)#1},std::allocator<void caulk::alloc::print_allocator<caulk::alloc::resource<caulk::alloc::malloc_zone_allocator,caulk::alloc::memory_resource>>(caulk::alloc::resource<caulk::alloc::malloc_zone_allocator,caulk::alloc::memory_resource> &,std::ostream &,BOOL)::{lambda(caulk::alloc::region_usage,caulk::alloc::block)#1}>,void ()(caulk::alloc::region_usage,caulk::alloc::block)>::target(uint64_t a1, uint64_t a2)
{
  if (std::type_info::operator==[abi:ne180100](*(void *)(a2 + 8), (uint64_t)"ZN5caulk5alloc15print_allocatorINS0_8resourceINS0_21malloc_zone_allocatorENS0_15memory_resourceEEEEEvRT_RNSt3__113basic_ostreamIcNS8_11char_traitsIcEEEEbEUlNS0_12region_usageENS0_5blockEE_"))
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

uint64_t std::__function::__func<void caulk::alloc::print_allocator<caulk::alloc::resource<caulk::alloc::malloc_zone_allocator,caulk::alloc::memory_resource>>(caulk::alloc::resource<caulk::alloc::malloc_zone_allocator,caulk::alloc::memory_resource> &,std::ostream &,BOOL)::{lambda(caulk::alloc::region_usage,caulk::alloc::block)#1},std::allocator<void caulk::alloc::print_allocator<caulk::alloc::resource<caulk::alloc::malloc_zone_allocator,caulk::alloc::memory_resource>>(caulk::alloc::resource<caulk::alloc::malloc_zone_allocator,caulk::alloc::memory_resource> &,std::ostream &,BOOL)::{lambda(caulk::alloc::region_usage,caulk::alloc::block)#1}>,void ()(caulk::alloc::region_usage,caulk::alloc::block)>::operator()(uint64_t a1, int *a2)
{
  return caulk::alloc::describe_block(*(void *)(a1 + 8), *a2);
}

uint64_t std::__function::__func<void caulk::alloc::print_allocator<caulk::alloc::resource<caulk::alloc::malloc_zone_allocator,caulk::alloc::memory_resource>>(caulk::alloc::resource<caulk::alloc::malloc_zone_allocator,caulk::alloc::memory_resource> &,std::ostream &,BOOL)::{lambda(caulk::alloc::region_usage,caulk::alloc::block)#1},std::allocator<void caulk::alloc::print_allocator<caulk::alloc::resource<caulk::alloc::malloc_zone_allocator,caulk::alloc::memory_resource>>(caulk::alloc::resource<caulk::alloc::malloc_zone_allocator,caulk::alloc::memory_resource> &,std::ostream &,BOOL)::{lambda(caulk::alloc::region_usage,caulk::alloc::block)#1}>,void ()(caulk::alloc::region_usage,caulk::alloc::block)>::__clone(uint64_t result, void *a2)
{
  uint64_t v2 = *(void *)(result + 8);
  *a2 = &unk_26C2AA9D8;
  a2[1] = v2;
  return result;
}

void *std::__function::__func<void caulk::alloc::print_allocator<caulk::alloc::resource<caulk::alloc::malloc_zone_allocator,caulk::alloc::memory_resource>>(caulk::alloc::resource<caulk::alloc::malloc_zone_allocator,caulk::alloc::memory_resource> &,std::ostream &,BOOL)::{lambda(caulk::alloc::region_usage,caulk::alloc::block)#1},std::allocator<void caulk::alloc::print_allocator<caulk::alloc::resource<caulk::alloc::malloc_zone_allocator,caulk::alloc::memory_resource>>(caulk::alloc::resource<caulk::alloc::malloc_zone_allocator,caulk::alloc::memory_resource> &,std::ostream &,BOOL)::{lambda(caulk::alloc::region_usage,caulk::alloc::block)#1}>,void ()(caulk::alloc::region_usage,caulk::alloc::block)>::__clone(uint64_t a1)
{
  uint64_t result = operator new(0x10uLL);
  uint64_t v3 = *(void *)(a1 + 8);
  *uint64_t result = &unk_26C2AA9D8;
  result[1] = v3;
  return result;
}

void std::__function::__func<void caulk::alloc::print_allocator<caulk::alloc::resource<caulk::alloc::malloc_zone_allocator,caulk::alloc::memory_resource>>(caulk::alloc::resource<caulk::alloc::malloc_zone_allocator,caulk::alloc::memory_resource> &,std::ostream &,BOOL)::{lambda(caulk::alloc::region_usage,caulk::alloc::block)#1},std::allocator<void caulk::alloc::print_allocator<caulk::alloc::resource<caulk::alloc::malloc_zone_allocator,caulk::alloc::memory_resource>>(caulk::alloc::resource<caulk::alloc::malloc_zone_allocator,caulk::alloc::memory_resource> &,std::ostream &,BOOL)::{lambda(caulk::alloc::region_usage,caulk::alloc::block)#1}>,void ()(caulk::alloc::region_usage,caulk::alloc::block)>::~__func()
{
}

BOOL caulk::alloc::resource<caulk::alloc::malloc_zone_allocator,caulk::alloc::memory_resource>::do_is_equal(uint64_t a1, uint64_t a2)
{
  return a1 == a2;
}

void caulk::alloc::resource<caulk::alloc::malloc_zone_allocator,caulk::alloc::memory_resource>::do_deallocate(uint64_t a1, void *a2)
{
}

void *caulk::alloc::resource<caulk::alloc::malloc_zone_allocator,caulk::alloc::memory_resource>::do_allocate(uint64_t a1, size_t a2, size_t a3)
{
  uint64_t result = caulk::alloc::malloc_zone_allocator::allocate((malloc_zone_t **)(a1 + 8), a2, a3);
  if (!result)
  {
    exception = (std::bad_alloc *)__cxa_allocate_exception(8uLL);
    size_t v5 = std::bad_alloc::bad_alloc(exception);
    __cxa_throw(v5, MEMORY[0x263F8C218], MEMORY[0x263F8C170]);
  }
  return result;
}

void caulk::alloc::resource_with_zone<caulk::alloc::malloc_zone_allocator>::~resource_with_zone(uint64_t a1)
{
  caulk::alloc::malloc_zone_allocator::~malloc_zone_allocator((malloc_zone_t **)(a1 + 8));

  JUMPOUT(0x216674B00);
}

uint64_t caulk::alloc::resource_with_zone<caulk::alloc::malloc_zone_allocator>::~resource_with_zone(uint64_t a1)
{
  return a1;
}

uint64_t caulk::alloc::get_realtime_safe_resource(caulk::alloc *this)
{
  uint64_t result = caulk::alloc::realtime_safe_resource;
  if (!caulk::alloc::realtime_safe_resource)
  {
    caulk::alloc::init_realtime_safe_resource(0);
    return caulk::alloc::realtime_safe_resource;
  }
  return result;
}

void caulk::alloc::registerAllocatorStateDump(caulk::alloc *this, caulk::alloc::memory_resource *a2, const char *a3, const char *a4)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  int out_token = 0;
  global_queue = dispatch_get_global_queue(0, 0);
  handler[0] = MEMORY[0x263EF8330];
  handler[1] = 0x40000000;
  handler[2] = ___ZN5caulk5allocL26registerAllocatorStateDumpEPNS0_15memory_resourceEPKcS4__block_invoke;
  handler[3] = &__block_descriptor_tmp;
  void handler[4] = a3;
  handler[5] = this;
  char v8 = (caulk::alloc::base_allocator *)notify_register_dispatch((const char *)a2, &out_token, global_queue, handler);
  int v9 = (int)v8;
  caulk::alloc::base_allocator::log(v8);
  char v10 = caulk::alloc::base_allocator::log(void)::global;
  if (os_log_type_enabled((os_log_t)caulk::alloc::base_allocator::log(void)::global, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    BOOL v14 = a2;
    __int16 v15 = 1024;
    int v16 = v9;
    _os_log_impl(&dword_210865000, v10, OS_LOG_TYPE_DEFAULT, "Registered notify signal %s (%u)", buf, 0x12u);
  }
}

void ___ZN5caulk5allocL26registerAllocatorStateDumpEPNS0_15memory_resourceEPKcS4__block_invoke(uint64_t a1)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  std::string::basic_string[abi:ne180100]<0>(&v23, "/tmp/");
  size_t v2 = strlen(*(const char **)(a1 + 32));
  uint64_t v3 = std::string::append(&v23, *(const std::string::value_type **)(a1 + 32), v2);
  long long v4 = *(_OWORD *)&v3->__r_.__value_.__l.__data_;
  v21.__r_.__value_.__r.__words[2] = v3->__r_.__value_.__r.__words[2];
  *(_OWORD *)&v21.__r_.__value_.__l.__data_ = v4;
  v3->__r_.__value_.__l.__size_ = 0;
  v3->__r_.__value_.__r.__words[2] = 0;
  v3->__r_.__value_.__r.__words[0] = 0;
  pid_t v5 = getpid();
  std::to_string(&v18, v5);
  if ((v18.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    uint64_t v6 = &v18;
  }
  else {
    uint64_t v6 = (std::string *)v18.__r_.__value_.__r.__words[0];
  }
  if ((v18.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    std::string::size_type size = HIBYTE(v18.__r_.__value_.__r.__words[2]);
  }
  else {
    std::string::size_type size = v18.__r_.__value_.__l.__size_;
  }
  char v8 = std::string::append(&v21, (const std::string::value_type *)v6, size);
  long long v9 = *(_OWORD *)&v8->__r_.__value_.__l.__data_;
  int64_t v20 = v8->__r_.__value_.__r.__words[2];
  *(_OWORD *)std::string __p = v9;
  v8->__r_.__value_.__l.__size_ = 0;
  v8->__r_.__value_.__r.__words[2] = 0;
  v8->__r_.__value_.__r.__words[0] = 0;
  if (SHIBYTE(v18.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v18.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(v21.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v21.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(v23.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v23.__r_.__value_.__l.__data_);
  }
  uint64_t v10 = MEMORY[0x263F8C310] + 64;
  v22[0] = MEMORY[0x263F8C310] + 64;
  uint64_t v11 = (std::string::size_type *)MEMORY[0x263F8C2B0];
  std::string::size_type v12 = *(void *)(MEMORY[0x263F8C2B0] + 16);
  v21.__r_.__value_.__r.__words[0] = *(void *)(MEMORY[0x263F8C2B0] + 8);
  *(std::string::size_type *)((char *)v21.__r_.__value_.__r.__words + *(void *)(v21.__r_.__value_.__r.__words[0] - 24)) = v12;
  uint64_t v13 = (std::ios_base *)((char *)&v21 + *(void *)(v21.__r_.__value_.__r.__words[0] - 24));
  std::ios_base::init(v13, &v21.__r_.__value_.__r.__words[1]);
  uint64_t v14 = MEMORY[0x263F8C310] + 24;
  v13[1].__vftable = 0;
  v13[1].__fmtflags_ = -1;
  v21.__r_.__value_.__r.__words[0] = v14;
  v22[0] = v10;
  MEMORY[0x216674910](&v21.__r_.__value_.__r.__words[1]);
  if (!std::filebuf::open()) {
    std::ios_base::clear((std::ios_base *)((char *)&v21 + *(void *)(v21.__r_.__value_.__r.__words[0] - 24)), *(_DWORD *)((char *)&v21 + *(void *)(v21.__r_.__value_.__r.__words[0] - 24) + 32) | 4);
  }
  __int16 v15 = (caulk::alloc::base_allocator *)(*(uint64_t (**)(void, std::string *, void))(**(void **)(a1 + 40)
                                                                                                 + 48))(*(void *)(a1 + 40), &v21, 0);
  caulk::alloc::base_allocator::log(v15);
  int v16 = caulk::alloc::base_allocator::log(void)::global;
  if (os_log_type_enabled((os_log_t)caulk::alloc::base_allocator::log(void)::global, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v17 = __p;
    if (v20 < 0) {
      uint64_t v17 = (void **)__p[0];
    }
    LODWORD(v23.__r_.__value_.__l.__data_) = 136315138;
    *(std::string::size_type *)((char *)v23.__r_.__value_.__r.__words + 4) = (std::string::size_type)v17;
    _os_log_impl(&dword_210865000, v16, OS_LOG_TYPE_DEFAULT, "Wrote %s", (uint8_t *)&v23, 0xCu);
  }
  v21.__r_.__value_.__r.__words[0] = *v11;
  *(std::string::size_type *)((char *)v21.__r_.__value_.__r.__words + *(void *)(v21.__r_.__value_.__r.__words[0] - 24)) = v11[3];
  MEMORY[0x216674920](&v21.__r_.__value_.__r.__words[1]);
  std::ostream::~ostream();
  MEMORY[0x216674A80](v22);
  if (SHIBYTE(v20) < 0) {
    operator delete(__p[0]);
  }
}

void sub_21086DD4C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *__p, uint64_t a17, int a18, __int16 a19, char a20,char a21,uint64_t a22,void *a23,uint64_t a24,int a25,__int16 a26,char a27,char a28)
{
  if (a21 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(a1);
}

void *std::ofstream::~ofstream(void *a1)
{
  uint64_t v2 = MEMORY[0x263F8C2B0];
  uint64_t v3 = *MEMORY[0x263F8C2B0];
  *a1 = *MEMORY[0x263F8C2B0];
  *(void *)((char *)a1 + *(void *)(v3 - 24)) = *(void *)(v2 + 24);
  MEMORY[0x216674920](a1 + 1);
  std::ostream::~ostream();
  MEMORY[0x216674A80](a1 + 52);
  return a1;
}

uint64_t caulk::alloc::resource<caulk::alloc::dsw_allocator2<true>,caulk::alloc::rt_safe_memory_resource>::~resource()
{
  caulk::alloc::tree_allocator<caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,16ul,6ul>>::~tree_allocator((uint64_t)&unk_26AA55950);
  caulk::alloc::tree_allocator<caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,256ul,6ul>>::~tree_allocator((uint64_t)&unk_26AA556F0);

  return caulk::alloc::tracking_allocator<caulk::alloc::global_page_cache>::~tracking_allocator((uint64_t)&qword_26AA55590);
}

uint64_t caulk::alloc::tree_allocator<caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,16ul,6ul>>::~tree_allocator(uint64_t a1)
{
  unint64_t v2 = a1 + 304;
  caulk::concurrent::skiplist<unsigned long,caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,16ul,6ul>::node_impl<caulk::alloc::tree_allocator<caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,16ul,6ul>>::node_header,caulk::alloc::embed_block_memory> *,5,(caulk::concurrent::skiplist_options)1>::clear(a1 + 304);
  caulk::concurrent::skiplist<unsigned long,caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,16ul,6ul>::node_impl<caulk::alloc::tree_allocator<caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,16ul,6ul>>::node_header,caulk::alloc::embed_block_memory> *,5,(caulk::concurrent::skiplist_options)1>::clear(a1 + 16);
  caulk::concurrent::skiplist<unsigned long,caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,16ul,6ul>::node_impl<caulk::alloc::tree_allocator<caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,16ul,6ul>>::node_header,caulk::alloc::embed_block_memory> *,5,(caulk::concurrent::skiplist_options)1>::clear(v2);
  caulk::concurrent::details::node_allocator<unsigned long,caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,16ul,6ul>::node_impl<caulk::alloc::tree_allocator<caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,16ul,6ul>>::node_header,caulk::alloc::embed_block_memory> *,5ul,(caulk::concurrent::skiplist_options)1>::~node_allocator((void *)(a1 + 464));
  caulk::concurrent::skiplist<unsigned long,caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,16ul,6ul>::node_impl<caulk::alloc::tree_allocator<caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,16ul,6ul>>::node_header,caulk::alloc::embed_block_memory> *,5,(caulk::concurrent::skiplist_options)1>::clear(a1 + 16);
  caulk::concurrent::details::node_allocator<unsigned long,caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,16ul,6ul>::node_impl<caulk::alloc::tree_allocator<caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,16ul,6ul>>::node_header,caulk::alloc::embed_block_memory> *,5ul,(caulk::concurrent::skiplist_options)1>::~node_allocator((void *)(a1 + 176));
  return a1;
}

uint64_t caulk::alloc::tree_allocator<caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,256ul,6ul>>::~tree_allocator(uint64_t a1)
{
  unint64_t v2 = a1 + 304;
  caulk::concurrent::skiplist<unsigned long,caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,256ul,6ul>::node_impl<caulk::alloc::tree_allocator<caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,256ul,6ul>>::node_header,caulk::alloc::embed_block_memory> *,5,(caulk::concurrent::skiplist_options)1>::clear(a1 + 304);
  caulk::concurrent::skiplist<unsigned long,caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,256ul,6ul>::node_impl<caulk::alloc::tree_allocator<caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,256ul,6ul>>::node_header,caulk::alloc::embed_block_memory> *,5,(caulk::concurrent::skiplist_options)1>::clear(a1 + 16);
  caulk::concurrent::skiplist<unsigned long,caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,256ul,6ul>::node_impl<caulk::alloc::tree_allocator<caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,256ul,6ul>>::node_header,caulk::alloc::embed_block_memory> *,5,(caulk::concurrent::skiplist_options)1>::clear(v2);
  caulk::concurrent::details::node_allocator<unsigned long,caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,256ul,6ul>::node_impl<caulk::alloc::tree_allocator<caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,256ul,6ul>>::node_header,caulk::alloc::embed_block_memory> *,5ul,(caulk::concurrent::skiplist_options)1>::~node_allocator((void *)(a1 + 464));
  caulk::concurrent::skiplist<unsigned long,caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,256ul,6ul>::node_impl<caulk::alloc::tree_allocator<caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,256ul,6ul>>::node_header,caulk::alloc::embed_block_memory> *,5,(caulk::concurrent::skiplist_options)1>::clear(a1 + 16);
  caulk::concurrent::details::node_allocator<unsigned long,caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,256ul,6ul>::node_impl<caulk::alloc::tree_allocator<caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,256ul,6ul>>::node_header,caulk::alloc::embed_block_memory> *,5ul,(caulk::concurrent::skiplist_options)1>::~node_allocator((void *)(a1 + 176));
  return a1;
}

uint64_t caulk::alloc::tracking_allocator<caulk::alloc::global_page_cache>::~tracking_allocator(uint64_t a1)
{
  unint64_t v2 = a1 + 272;
  caulk::concurrent::details::node_allocator<void *,caulk::alloc::detail::tracked_block,10ul,(caulk::concurrent::skiplist_options)0>::begin_traversal();
  for (unint64_t i = atomic_load((unint64_t *)(a1 + 56)); ; unint64_t i = atomic_load((unint64_t *)(v4 + 40)))
  {
    unint64_t v4 = i & 0xFFFFFFFFFFFFFFFCLL;
    if (a1 + 216 == (i & 0xFFFFFFFFFFFFFFFCLL)) {
      break;
    }
    if (*(unsigned char *)(v4 + 26) != 2)
    {
      char v5 = atomic_load((unint64_t *)(v4 + 40));
      if ((v5 & 1) == 0) {
        caulk::alloc::details::caching_page_allocator_base::deallocate(*(void **)a1, *(caulk::mach::vm_block **)(v4 + 16), *(void *)v4);
      }
    }
  }
  caulk::concurrent::details::node_allocator<void *,caulk::alloc::detail::tracked_block,10ul,(caulk::concurrent::skiplist_options)0>::end_traversal(v2, i);
  caulk::concurrent::skiplist<void *,caulk::alloc::detail::tracked_block,10,(caulk::concurrent::skiplist_options)0>::clear(a1 + 16);
  caulk::concurrent::skiplist<void *,caulk::alloc::detail::tracked_block,10,(caulk::concurrent::skiplist_options)0>::clear(a1 + 16);
  caulk::concurrent::details::node_allocator<void *,caulk::alloc::detail::tracked_block,10ul,(caulk::concurrent::skiplist_options)0>::~node_allocator(v2);
  return a1;
}

void sub_21086E078(void *a1@<X0>, unint64_t a2@<X8>)
{
  caulk::concurrent::details::node_allocator<void *,caulk::alloc::detail::tracked_block,10ul,(caulk::concurrent::skiplist_options)0>::end_traversal(v2, a2);
  __clang_call_terminate(a1);
}

unint64_t caulk::concurrent::skiplist<void *,caulk::alloc::detail::tracked_block,10,(caulk::concurrent::skiplist_options)0>::clear(unint64_t a1)
{
  unint64_t v2 = a1 + 256;
  caulk::concurrent::details::node_allocator<void *,caulk::alloc::detail::tracked_block,10ul,(caulk::concurrent::skiplist_options)0>::begin_traversal();
  for (unint64_t i = atomic_load((unint64_t *)(a1 + 40)); ; unint64_t i = atomic_load((unint64_t *)(v4 + 40)))
  {
    unint64_t v4 = i & 0xFFFFFFFFFFFFFFFCLL;
    if (a1 + 200 == (i & 0xFFFFFFFFFFFFFFFCLL)) {
      break;
    }
    if (*(unsigned char *)(v4 + 26) != 2)
    {
      char v5 = atomic_load((unint64_t *)(v4 + 40));
      if ((v5 & 1) == 0) {
        caulk::concurrent::skiplist<void *,caulk::alloc::detail::tracked_block,10,(caulk::concurrent::skiplist_options)0>::remove(a1, *(void *)(v4 + 16));
      }
    }
  }
  return caulk::concurrent::details::node_allocator<void *,caulk::alloc::detail::tracked_block,10ul,(caulk::concurrent::skiplist_options)0>::end_traversal(v2, i);
}

unint64_t caulk::concurrent::details::node_allocator<void *,caulk::alloc::detail::tracked_block,10ul,(caulk::concurrent::skiplist_options)0>::~node_allocator(unint64_t a1)
{
  _X2 = 0;
  _X3 = 0;
  __asm { CASPAL          X2, X3, X2, X3, [X0] }
  if (_X2) {
    caulk::concurrent::details::node_allocator<void *,caulk::alloc::detail::tracked_block,10ul,(caulk::concurrent::skiplist_options)0>::free_node_chain_now(a1, _X2);
  }
  (*(void (**)(unint64_t))(*(void *)(a1 + 32) + 24))(a1 + 40);
  long long v9 = *(std::__shared_weak_count **)(a1 + 24);
  if (v9) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v9);
  }
  return a1;
}

unint64_t caulk::concurrent::details::node_allocator<void *,caulk::alloc::detail::tracked_block,10ul,(caulk::concurrent::skiplist_options)0>::free_node_chain_now(unint64_t result, unint64_t a2)
{
  if (a2)
  {
    unint64_t v2 = a2;
    unint64_t v3 = result;
    unint64_t v4 = result + 40;
    do
    {
      unint64_t v5 = atomic_load((unint64_t *)(v2 + 32));
      uint64_t v6 = *(void *)(v3 + 32);
      if (*(unsigned char *)(v6 + 32))
      {
        if (!*(unsigned char *)(v2 + 26)) {
          (*(void (**)(unint64_t, unint64_t))v6)(v4, v2);
        }
      }
      uint64_t result = caulk::alloc::multi_free_list<caulk::alloc::cascading_allocator<caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::serial_allocator,caulk::alloc::embed_block_memory,16384ul>>,caulk::concurrent::details::node_allocator<void *,caulk::alloc::detail::tracked_block,10ul,(caulk::concurrent::skiplist_options)0>::size_generator,8ul,1ul,-1l>::deallocate(*(caulk::alloc::base_allocator **)(v3 + 16), (unint64_t *)v2, *(void *)&caulk::alloc::multi_free_list<caulk::alloc::cascading_allocator<caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::serial_allocator,caulk::alloc::embed_block_memory,16384ul>>,caulk::concurrent::details::node_allocator<void *,caulk::alloc::detail::tracked_block,10ul,(caulk::concurrent::skiplist_options)0>::size_generator,8ul,1ul,-1l>::Sizes[8 * *(unsigned __int8 *)(v2 + 24) - 8]);
      unint64_t v2 = v5;
    }
    while (v5);
  }
  return result;
}

unint64_t caulk::alloc::multi_free_list<caulk::alloc::cascading_allocator<caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::serial_allocator,caulk::alloc::embed_block_memory,16384ul>>,caulk::concurrent::details::node_allocator<void *,caulk::alloc::detail::tracked_block,10ul,(caulk::concurrent::skiplist_options)0>::size_generator,8ul,1ul,-1l>::deallocate(caulk::alloc::base_allocator *a1, unint64_t *a2, unint64_t a3)
{
  _X4 = a2;
  uint64_t v4 = 0;
  while (*(void *)&caulk::alloc::multi_free_list<caulk::alloc::cascading_allocator<caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::serial_allocator,caulk::alloc::embed_block_memory,16384ul>>,caulk::concurrent::details::node_allocator<void *,caulk::alloc::detail::tracked_block,10ul,(caulk::concurrent::skiplist_options)0>::size_generator,8ul,1ul,-1l>::Sizes[8 * v4] < a3)
  {
    if (++v4 == 10) {
      caulk::alloc::base_allocator::bad_dealloc(a1);
    }
  }
  _X2 = 0;
  _X3 = 0;
  uint64_t v7 = (uint64_t)a1 + 32 * v4 + 64;
  __asm { CASPAL          X2, X3, X2, X3, [X8] }
  atomic_store(_X2, a2);
  _X1 = 0;
  __asm { CASPAL          X0, X1, X4, X5, [X8] }
  if (result != _X2)
  {
    do
    {
      atomic_store(result, _X4);
      _X3 = 0;
      __asm { CASPAL          X2, X3, X4, X5, [X8] }
      unint64_t v17 = _X2 ^ result;
      unint64_t result = _X2;
    }
    while (v17);
  }
  atomic_fetch_add((atomic_ullong *volatile)(v7 + 16), 1uLL);
  return result;
}

void caulk::alloc::base_allocator::bad_dealloc(caulk::alloc::base_allocator *this)
{
  exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
  caulk::alloc::alloc_error::alloc_error(exception, v2);
}

void sub_21086E2FC(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

std::runtime_error *caulk::alloc::alloc_error::alloc_error(std::runtime_error *this, const char *a2)
{
  unint64_t result = std::runtime_error::runtime_error(this, "deallocate() called for unowned block");
  result->__vftable = (std::runtime_error_vtbl *)&unk_26C2AAFF8;
  return result;
}

void caulk::alloc::alloc_error::~alloc_error(std::runtime_error *this)
{
  std::runtime_error::~runtime_error(this);

  JUMPOUT(0x216674B00);
}

uint64_t caulk::concurrent::skiplist<void *,caulk::alloc::detail::tracked_block,10,(caulk::concurrent::skiplist_options)0>::remove(unint64_t a1, uint64_t a2)
{
  unint64_t v4 = a1 + 256;
  caulk::concurrent::details::node_allocator<void *,caulk::alloc::detail::tracked_block,10ul,(caulk::concurrent::skiplist_options)0>::begin_traversal();
  uint64_t v18 = a2;
  uint64_t v5 = -1;
  uint64_t v6 = 56;
  do
  {
    unint64_t v7 = atomic_load((unint64_t *)(a1 + v6));
    ++v5;
    v6 += 16;
  }
  while (*(unsigned char *)((v7 & 0xFFFFFFFFFFFFFFFCLL) + 26) != 2);
  unint64_t v8 = a1;
  if (v5)
  {
    unint64_t v8 = a1;
    do
      unint64_t v8 = caulk::concurrent::skiplist<void *,caulk::alloc::detail::tracked_block,10,(caulk::concurrent::skiplist_options)0>::search_right<caulk::concurrent::skiplist<void *,caulk::alloc::detail::tracked_block,10,(caulk::concurrent::skiplist_options)0>::key_lt &>(a1, v5--, v8, &v18);
    while (v5);
  }
  unint64_t v9 = caulk::concurrent::skiplist<void *,caulk::alloc::detail::tracked_block,10,(caulk::concurrent::skiplist_options)0>::search_right<caulk::concurrent::skiplist<void *,caulk::alloc::detail::tracked_block,10,(caulk::concurrent::skiplist_options)0>::key_lt &>(a1, 0, v8, &v18);
  unint64_t v11 = *(void *)(v10 + 16);
  if (v11 == a2)
  {
    uint64_t v13 = v10;
    unint64_t v14 = caulk::concurrent::skiplist<void *,caulk::alloc::detail::tracked_block,10,(caulk::concurrent::skiplist_options)0>::try_flag_node(a1, 0, v9, v10);
    uint64_t v16 = v15;
    if (!v15) {
      caulk::concurrent::skiplist<void *,caulk::alloc::detail::tracked_block,10,(caulk::concurrent::skiplist_options)0>::help_flagged(a1, 0, v14, v13);
    }
    uint64_t v12 = 0;
    if ((v16 & 0xFF00000000) != 0 && v13)
    {
      uint64_t v18 = a2;
      caulk::concurrent::skiplist<void *,caulk::alloc::detail::tracked_block,10,(caulk::concurrent::skiplist_options)0>::search_to_level<caulk::concurrent::skiplist<void *,caulk::alloc::detail::tracked_block,10,(caulk::concurrent::skiplist_options)0>::key_le>(a1, &v18, 0);
      uint64_t v12 = 1;
    }
  }
  else
  {
    uint64_t v12 = 0;
  }
  caulk::concurrent::details::node_allocator<void *,caulk::alloc::detail::tracked_block,10ul,(caulk::concurrent::skiplist_options)0>::end_traversal(v4, v11);
  return v12;
}

unint64_t caulk::concurrent::skiplist<void *,caulk::alloc::detail::tracked_block,10,(caulk::concurrent::skiplist_options)0>::try_flag_node(unint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  unint64_t v8 = a4 | 2;
  do
  {
    unint64_t v9 = (unint64_t *)(a3 + 16 * a2 + 40);
    unint64_t v10 = atomic_load(v9);
    if (v10 == v8) {
      break;
    }
    uint64_t v11 = a4;
    atomic_compare_exchange_strong((atomic_ullong *volatile)v9, (unint64_t *)&v11, v8);
    if (v11 == a4 || v11 == v8) {
      break;
    }
    char v12 = atomic_load(v9);
    if (v12)
    {
      do
      {
        a3 = atomic_load((unint64_t *)(a3 + 16 * a2 + 48));
        char v13 = atomic_load((unint64_t *)(a3 + 16 * a2 + 40));
      }
      while ((v13 & 1) != 0);
    }
    unint64_t v14 = *(void *)(a4 + 16);
    while (1)
    {
      unint64_t v15 = atomic_load((unint64_t *)(a3 + 16 * a2 + 40));
      unint64_t v16 = v15 & 0xFFFFFFFFFFFFFFFCLL;
      if (v14 <= *(void *)((v15 & 0xFFFFFFFFFFFFFFFCLL) + 16)) {
        break;
      }
      char v17 = atomic_load((unint64_t *)(v16 + 40));
      if (v17)
      {
        a3 = caulk::concurrent::skiplist<void *,caulk::alloc::detail::tracked_block,10,(caulk::concurrent::skiplist_options)0>::try_flag_node(a1, a2, a3, v16);
        if (!v18) {
          caulk::concurrent::skiplist<void *,caulk::alloc::detail::tracked_block,10,(caulk::concurrent::skiplist_options)0>::help_flagged(a1, a2, a3, v16);
        }
      }
      else
      {
        a3 = v16;
      }
    }
  }
  while (v16 == a4);
  return a3;
}

unint64_t caulk::concurrent::skiplist<void *,caulk::alloc::detail::tracked_block,10,(caulk::concurrent::skiplist_options)0>::help_flagged(unint64_t result, uint64_t a2, unint64_t a3, uint64_t a4)
{
  _X20 = a4;
  unint64_t v7 = result;
  uint64_t v8 = a4 + 16 * a2;
  unint64_t v9 = (unint64_t *)(v8 + 40);
  atomic_store(a3, (unint64_t *)(v8 + 48));
  while (1)
  {
    char v10 = atomic_load(v9);
    if (v10) {
      break;
    }
    unint64_t v11 = atomic_load(v9);
    unint64_t v12 = v11 & 0xFFFFFFFFFFFFFFFCLL;
    atomic_compare_exchange_strong((atomic_ullong *volatile)v9, &v12, v12 | 1);
    if ((v12 & 2) != 0) {
      unint64_t result = caulk::concurrent::skiplist<void *,caulk::alloc::detail::tracked_block,10,(caulk::concurrent::skiplist_options)0>::help_flagged(v7, a2, _X20, v12 & 0xFFFFFFFFFFFFFFFCLL);
    }
  }
  unint64_t v13 = atomic_load(v9);
  uint64_t v14 = _X20 | 2;
  atomic_compare_exchange_strong((atomic_ullong *volatile)(a3 + 16 * a2 + 40), (unint64_t *)&v14, v13 & 0xFFFFFFFFFFFFFFFCLL);
  if (v14 == (_X20 | 2) && atomic_fetch_add((atomic_uchar *volatile)(_X20 + 27), 0xFFu) == 1)
  {
    _X2 = 0;
    _X3 = 0;
    __asm { CASPAL          X2, X3, X2, X3, [X8] }
    atomic_store(_X2, (unint64_t *)(_X20 + 32));
    _X1 = 0;
    __asm { CASPAL          X0, X1, X20, X21, [X8] }
    if (result != _X2)
    {
      do
      {
        atomic_store(result, (unint64_t *)(_X20 + 32));
        _X3 = 0;
        __asm { CASPAL          X2, X3, X20, X21, [X8] }
        unint64_t v25 = _X2 ^ result;
        unint64_t result = _X2;
      }
      while (v25);
    }
  }
  return result;
}

unint64_t caulk::concurrent::skiplist<void *,caulk::alloc::detail::tracked_block,10,(caulk::concurrent::skiplist_options)0>::search_right<caulk::concurrent::skiplist<void *,caulk::alloc::detail::tracked_block,10,(caulk::concurrent::skiplist_options)0>::key_lt &>(unint64_t a1, uint64_t a2, unint64_t a3, void *a4)
{
  unint64_t v4 = a3;
  unint64_t v5 = atomic_load((unint64_t *)(a3 + 16 * a2 + 40));
  unint64_t v6 = v5 & 0xFFFFFFFFFFFFFFFCLL;
  if (*a4 > *(void *)((v5 & 0xFFFFFFFFFFFFFFFCLL) + 16))
  {
    do
    {
      char v10 = atomic_load((unint64_t *)(v6 + 40));
      if (v10)
      {
        unint64_t v4 = caulk::concurrent::skiplist<void *,caulk::alloc::detail::tracked_block,10,(caulk::concurrent::skiplist_options)0>::try_flag_node(a1, a2, v4, v6);
        if (!v11) {
          caulk::concurrent::skiplist<void *,caulk::alloc::detail::tracked_block,10,(caulk::concurrent::skiplist_options)0>::help_flagged(a1, a2, v4, v6);
        }
      }
      else
      {
        unint64_t v4 = v6;
      }
      unint64_t v12 = atomic_load((unint64_t *)(v4 + 16 * a2 + 40));
      unint64_t v6 = v12 & 0xFFFFFFFFFFFFFFFCLL;
    }
    while (*a4 > *(void *)((v12 & 0xFFFFFFFFFFFFFFFCLL) + 16));
  }
  return v4;
}

uint64_t caulk::concurrent::skiplist<unsigned long,caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,256ul,6ul>::node_impl<caulk::alloc::tree_allocator<caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,256ul,6ul>>::node_header,caulk::alloc::embed_block_memory> *,5,(caulk::concurrent::skiplist_options)1>::clear(unint64_t a1)
{
  uint64_t v2 = a1 + 160;
  caulk::concurrent::details::node_allocator<void *,caulk::alloc::detail::tracked_block,10ul,(caulk::concurrent::skiplist_options)0>::begin_traversal();
  for (unint64_t i = atomic_load((unint64_t *)(a1 + 32)); ; unint64_t i = atomic_load((unint64_t *)(v4 + 32)))
  {
    unint64_t v4 = i & 0xFFFFFFFFFFFFFFFCLL;
    if (a1 + 112 == (i & 0xFFFFFFFFFFFFFFFCLL)) {
      break;
    }
    if (*(unsigned char *)(v4 + 18) != 2)
    {
      char v5 = atomic_load((unint64_t *)(v4 + 32));
      if ((v5 & 1) == 0) {
        caulk::concurrent::skiplist<unsigned long,caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,256ul,6ul>::node_impl<caulk::alloc::tree_allocator<caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,256ul,6ul>>::node_header,caulk::alloc::embed_block_memory> *,5,(caulk::concurrent::skiplist_options)1>::remove(a1, *(void *)v4);
      }
    }
  }
  return caulk::concurrent::details::node_allocator<unsigned long,caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,256ul,6ul>::node_impl<caulk::alloc::tree_allocator<caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,256ul,6ul>>::node_header,caulk::alloc::embed_block_memory> *,5ul,(caulk::concurrent::skiplist_options)1>::end_traversal(v2, i);
}

void *caulk::concurrent::details::node_allocator<unsigned long,caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,256ul,6ul>::node_impl<caulk::alloc::tree_allocator<caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,256ul,6ul>>::node_header,caulk::alloc::embed_block_memory> *,5ul,(caulk::concurrent::skiplist_options)1>::~node_allocator(void *a1)
{
  _X2 = 0;
  _X3 = 0;
  __asm { CASPAL          X2, X3, X2, X3, [X0] }
  if (_X2) {
    caulk::concurrent::details::node_allocator<unsigned long,caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,256ul,6ul>::node_impl<caulk::alloc::tree_allocator<caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,256ul,6ul>>::node_header,caulk::alloc::embed_block_memory> *,5ul,(caulk::concurrent::skiplist_options)1>::free_node_chain((uint64_t)a1, _X2);
  }
  caulk::concurrent::details::node_allocator<unsigned long,caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,256ul,6ul>::node_impl<caulk::alloc::tree_allocator<caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,256ul,6ul>>::node_header,caulk::alloc::embed_block_memory> *,5ul,(caulk::concurrent::skiplist_options)1>::perform_deferred_deletions<true,(BOOL *)0>((uint64_t)a1);
  (*(void (**)(void *))(a1[9] + 24))(a1 + 10);
  (*(void (**)(void *))(a1[4] + 24))(a1 + 5);
  unint64_t v9 = (std::__shared_weak_count *)a1[3];
  if (v9) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v9);
  }
  return a1;
}

uint64_t caulk::concurrent::details::node_allocator<unsigned long,caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,256ul,6ul>::node_impl<caulk::alloc::tree_allocator<caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,256ul,6ul>>::node_header,caulk::alloc::embed_block_memory> *,5ul,(caulk::concurrent::skiplist_options)1>::free_node_chain(uint64_t result, uint64_t a2)
{
  _X2 = a2;
  _X6 = 0;
  _X7 = 0;
  __asm { CASPAL          X6, X7, X6, X7, [X8] }
  atomic_store(_X6, (unint64_t *)(a2 + 40));
  _X5 = 0;
  __asm { CASPAL          X4, X5, X2, X3, [X8] }
  if (_X4 != _X6)
  {
    do
    {
      atomic_store(_X4, (unint64_t *)(a2 + 40));
      _X7 = 0;
      __asm { CASPAL          X6, X7, X2, X3, [X8] }
      unint64_t v14 = _X6 ^ _X4;
      _X4 = _X6;
    }
    while (v14);
  }
  uint64_t v15 = *(void *)(result + 72);
  if (*(unsigned char *)(v15 + 32)) {
    return (*(uint64_t (**)(uint64_t))v15)(result + 80);
  }
  return result;
}

unint64_t caulk::concurrent::details::node_allocator<unsigned long,caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,256ul,6ul>::node_impl<caulk::alloc::tree_allocator<caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,256ul,6ul>>::node_header,caulk::alloc::embed_block_memory> *,5ul,(caulk::concurrent::skiplist_options)1>::perform_deferred_deletions<true,(BOOL *)0>(uint64_t a1)
{
  uint64_t v2 = a1 + 40;
  while (1)
  {
    _X0 = 0;
    _X1 = 0;
    __asm { CASPAL          X0, X1, X0, X1, [X8] }
    if (!result) {
      break;
    }
    unint64_t v10 = result;
    unint64_t v11 = result;
    while (1)
    {
      _X4 = atomic_load((unint64_t *)(v10 + 40));
      _X1 = 0;
      __asm { CASPAL          X0, X1, X4, X5, [X8] }
      if (result == v11) {
        break;
      }
      unint64_t v10 = result;
      unint64_t v11 = result;
      if (!result) {
        return result;
      }
    }
    do
    {
      unint64_t v14 = atomic_load((unint64_t *)(v10 + 24));
      uint64_t v15 = *(void *)(a1 + 32);
      if (*(unsigned char *)(v15 + 32))
      {
        if (!*(unsigned char *)(v10 + 18)) {
          (*(void (**)(uint64_t, unint64_t))v15)(v2, v10);
        }
      }
      caulk::alloc::multi_free_list<caulk::alloc::cascading_allocator<caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::serial_allocator,caulk::alloc::embed_block_memory,16384ul>>,caulk::concurrent::details::node_allocator<unsigned long,caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,256ul,6ul>::node_impl<caulk::alloc::tree_allocator<caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,256ul,6ul>::node_impl>::node_header,caulk::alloc::embed_block_memory> *,5ul,(caulk::concurrent::skiplist_options)1>::size_generator,8ul,1ul,-1l>::deallocate(*(caulk::alloc::base_allocator **)(a1 + 16), (unint64_t *)v10, *(void *)&caulk::concurrent::details::node_allocator<unsigned long,caulk::alloc::chunk_allocator<caulk::alloc::page_allocator,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,16ul,6ul>::node_impl<caulk::alloc::tree_allocator<caulk::alloc::chunk_allocator<caulk::alloc::page_allocator,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,16ul,6ul>>::node_header,caulk::alloc::embed_block_memory> *,5ul,(caulk::concurrent::skiplist_options)1>::node_sizes[8 * *(unsigned __int8 *)(v10 + 16) - 8]);
      unint64_t v10 = v14;
    }
    while (v14);
  }
  return result;
}

unint64_t caulk::alloc::multi_free_list<caulk::alloc::cascading_allocator<caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::serial_allocator,caulk::alloc::embed_block_memory,16384ul>>,caulk::concurrent::details::node_allocator<unsigned long,caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,256ul,6ul>::node_impl<caulk::alloc::tree_allocator<caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,256ul,6ul>::node_impl>::node_header,caulk::alloc::embed_block_memory> *,5ul,(caulk::concurrent::skiplist_options)1>::size_generator,8ul,1ul,-1l>::deallocate(caulk::alloc::base_allocator *a1, unint64_t *a2, unint64_t a3)
{
  _X4 = a2;
  uint64_t v4 = 0;
  while (*(void *)&caulk::concurrent::details::node_allocator<unsigned long,caulk::alloc::chunk_allocator<caulk::alloc::page_allocator,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,16ul,6ul>::node_impl<caulk::alloc::tree_allocator<caulk::alloc::chunk_allocator<caulk::alloc::page_allocator,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,16ul,6ul>>::node_header,caulk::alloc::embed_block_memory> *,5ul,(caulk::concurrent::skiplist_options)1>::node_sizes[8 * v4] < a3)
  {
    if (++v4 == 5) {
      caulk::alloc::base_allocator::bad_dealloc(a1);
    }
  }
  _X2 = 0;
  _X3 = 0;
  uint64_t v7 = (uint64_t)a1 + 32 * v4 + 64;
  __asm { CASPAL          X2, X3, X2, X3, [X8] }
  atomic_store(_X2, a2);
  _X1 = 0;
  __asm { CASPAL          X0, X1, X4, X5, [X8] }
  if (result != _X2)
  {
    do
    {
      atomic_store(result, _X4);
      _X3 = 0;
      __asm { CASPAL          X2, X3, X4, X5, [X8] }
      unint64_t v17 = _X2 ^ result;
      unint64_t result = _X2;
    }
    while (v17);
  }
  atomic_fetch_add((atomic_ullong *volatile)(v7 + 16), 1uLL);
  return result;
}

uint64_t caulk::concurrent::skiplist<unsigned long,caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,256ul,6ul>::node_impl<caulk::alloc::tree_allocator<caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,256ul,6ul>>::node_header,caulk::alloc::embed_block_memory> *,5,(caulk::concurrent::skiplist_options)1>::remove(unint64_t a1, uint64_t a2)
{
  uint64_t v4 = a1 + 160;
  caulk::concurrent::details::node_allocator<void *,caulk::alloc::detail::tracked_block,10ul,(caulk::concurrent::skiplist_options)0>::begin_traversal();
  uint64_t v17 = a2;
  uint64_t v5 = -1;
  uint64_t v6 = 48;
  do
  {
    unint64_t v7 = atomic_load((unint64_t *)(a1 + v6));
    ++v5;
    v6 += 16;
  }
  while (*(unsigned char *)((v7 & 0xFFFFFFFFFFFFFFFCLL) + 18) != 2);
  unint64_t v8 = a1;
  if (v5)
  {
    unint64_t v8 = a1;
    do
      unint64_t v8 = caulk::concurrent::skiplist<unsigned long,caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,256ul,6ul>::node_impl<caulk::alloc::tree_allocator<caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,256ul,6ul>>::node_header,caulk::alloc::embed_block_memory> *,5,(caulk::concurrent::skiplist_options)1>::search_right<caulk::concurrent::skiplist<unsigned long,caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,256ul,6ul>::node_impl<caulk::alloc::tree_allocator<caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,256ul,6ul>>::node_header,caulk::alloc::embed_block_memory> *,5,(caulk::concurrent::skiplist_options)1>::key_lt &>(a1, v5--, v8, &v17);
    while (v5);
  }
  unint64_t v9 = caulk::concurrent::skiplist<unsigned long,caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,256ul,6ul>::node_impl<caulk::alloc::tree_allocator<caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,256ul,6ul>>::node_header,caulk::alloc::embed_block_memory> *,5,(caulk::concurrent::skiplist_options)1>::search_right<caulk::concurrent::skiplist<unsigned long,caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,256ul,6ul>::node_impl<caulk::alloc::tree_allocator<caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,256ul,6ul>>::node_header,caulk::alloc::embed_block_memory> *,5,(caulk::concurrent::skiplist_options)1>::key_lt &>(a1, 0, v8, &v17);
  unint64_t v11 = *v10;
  if (*v10 == a2)
  {
    uint64_t v12 = (uint64_t)v10;
    unint64_t v13 = caulk::concurrent::skiplist<unsigned long,caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,256ul,6ul>::node_impl<caulk::alloc::tree_allocator<caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,256ul,6ul>>::node_header,caulk::alloc::embed_block_memory> *,5,(caulk::concurrent::skiplist_options)1>::try_flag_node(a1, 0, v9, (unint64_t)v10);
    uint64_t v15 = v14;
    if (!v14) {
      caulk::concurrent::skiplist<unsigned long,caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,256ul,6ul>::node_impl<caulk::alloc::tree_allocator<caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,256ul,6ul>>::node_header,caulk::alloc::embed_block_memory> *,5,(caulk::concurrent::skiplist_options)1>::help_flagged(a1, 0, v13, v12);
    }
    if ((v15 & 0xFF00000000) != 0)
    {
      uint64_t v17 = a2;
      caulk::concurrent::skiplist<unsigned long,caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,256ul,6ul>::node_impl<caulk::alloc::tree_allocator<caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,256ul,6ul>>::node_header,caulk::alloc::embed_block_memory> *,5,(caulk::concurrent::skiplist_options)1>::search_to_level<caulk::concurrent::skiplist<unsigned long,caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,256ul,6ul>::node_impl<caulk::alloc::tree_allocator<caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,256ul,6ul>>::node_header,caulk::alloc::embed_block_memory> *,5,(caulk::concurrent::skiplist_options)1>::key_le>(a1, &v17, 0);
    }
  }
  return caulk::concurrent::details::node_allocator<unsigned long,caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,256ul,6ul>::node_impl<caulk::alloc::tree_allocator<caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,256ul,6ul>>::node_header,caulk::alloc::embed_block_memory> *,5ul,(caulk::concurrent::skiplist_options)1>::end_traversal(v4, v11);
}

unint64_t caulk::concurrent::skiplist<unsigned long,caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,256ul,6ul>::node_impl<caulk::alloc::tree_allocator<caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,256ul,6ul>>::node_header,caulk::alloc::embed_block_memory> *,5,(caulk::concurrent::skiplist_options)1>::try_flag_node(unint64_t a1, uint64_t a2, unint64_t a3, unint64_t a4)
{
  unint64_t v8 = a4 | 2;
  do
  {
    unint64_t v9 = (unint64_t *)(a3 + 16 * a2 + 32);
    unint64_t v10 = atomic_load(v9);
    if (v10 == v8) {
      break;
    }
    unint64_t v11 = (void *)a4;
    atomic_compare_exchange_strong((atomic_ullong *volatile)v9, (unint64_t *)&v11, v8);
    if (v11 == (void *)a4 || v11 == (void *)v8) {
      break;
    }
    char v12 = atomic_load(v9);
    if (v12)
    {
      do
      {
        a3 = atomic_load((unint64_t *)(a3 + 16 * a2 + 40));
        char v13 = atomic_load((unint64_t *)(a3 + 16 * a2 + 32));
      }
      while ((v13 & 1) != 0);
    }
    unint64_t v14 = *(void *)a4;
    while (1)
    {
      unint64_t v15 = atomic_load((unint64_t *)(a3 + 16 * a2 + 32));
      unint64_t v16 = v15 & 0xFFFFFFFFFFFFFFFCLL;
      if (v14 <= *(void *)(v15 & 0xFFFFFFFFFFFFFFFCLL)) {
        break;
      }
      char v17 = atomic_load((unint64_t *)(v16 + 32));
      if (v17)
      {
        a3 = caulk::concurrent::skiplist<unsigned long,caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,256ul,6ul>::node_impl<caulk::alloc::tree_allocator<caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,256ul,6ul>>::node_header,caulk::alloc::embed_block_memory> *,5,(caulk::concurrent::skiplist_options)1>::try_flag_node(a1, a2, a3, v16);
        if (!v18) {
          caulk::concurrent::skiplist<unsigned long,caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,256ul,6ul>::node_impl<caulk::alloc::tree_allocator<caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,256ul,6ul>>::node_header,caulk::alloc::embed_block_memory> *,5,(caulk::concurrent::skiplist_options)1>::help_flagged(a1, a2, a3, v16);
        }
      }
      else
      {
        a3 = v16;
      }
    }
  }
  while (v16 == a4);
  return a3;
}

unint64_t caulk::concurrent::skiplist<unsigned long,caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,256ul,6ul>::node_impl<caulk::alloc::tree_allocator<caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,256ul,6ul>>::node_header,caulk::alloc::embed_block_memory> *,5,(caulk::concurrent::skiplist_options)1>::help_flagged(unint64_t result, uint64_t a2, unint64_t a3, uint64_t a4)
{
  _X20 = a4;
  unint64_t v7 = result;
  uint64_t v8 = a4 + 16 * a2;
  unint64_t v9 = (unint64_t *)(v8 + 32);
  atomic_store(a3, (unint64_t *)(v8 + 40));
  while (1)
  {
    char v10 = atomic_load(v9);
    if (v10) {
      break;
    }
    unint64_t v11 = atomic_load(v9);
    unint64_t v12 = v11 & 0xFFFFFFFFFFFFFFFCLL;
    atomic_compare_exchange_strong((atomic_ullong *volatile)v9, &v12, v12 | 1);
    if ((v12 & 2) != 0) {
      unint64_t result = caulk::concurrent::skiplist<unsigned long,caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,256ul,6ul>::node_impl<caulk::alloc::tree_allocator<caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,256ul,6ul>>::node_header,caulk::alloc::embed_block_memory> *,5,(caulk::concurrent::skiplist_options)1>::help_flagged(v7, a2, _X20, v12 & 0xFFFFFFFFFFFFFFFCLL);
    }
  }
  unint64_t v13 = atomic_load(v9);
  uint64_t v14 = _X20 | 2;
  atomic_compare_exchange_strong((atomic_ullong *volatile)(a3 + 16 * a2 + 32), (unint64_t *)&v14, v13 & 0xFFFFFFFFFFFFFFFCLL);
  if (v14 == (_X20 | 2) && atomic_fetch_add((atomic_uchar *volatile)(_X20 + 19), 0xFFu) == 1)
  {
    _X2 = 0;
    _X3 = 0;
    __asm { CASPAL          X2, X3, X2, X3, [X8] }
    atomic_store(_X2, (unint64_t *)(_X20 + 24));
    _X1 = 0;
    __asm { CASPAL          X0, X1, X20, X21, [X8] }
    if (result != _X2)
    {
      do
      {
        atomic_store(result, (unint64_t *)(_X20 + 24));
        _X3 = 0;
        __asm { CASPAL          X2, X3, X20, X21, [X8] }
        unint64_t v25 = _X2 ^ result;
        unint64_t result = _X2;
      }
      while (v25);
    }
  }
  return result;
}

unint64_t caulk::concurrent::skiplist<unsigned long,caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,256ul,6ul>::node_impl<caulk::alloc::tree_allocator<caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,256ul,6ul>>::node_header,caulk::alloc::embed_block_memory> *,5,(caulk::concurrent::skiplist_options)1>::search_right<caulk::concurrent::skiplist<unsigned long,caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,256ul,6ul>::node_impl<caulk::alloc::tree_allocator<caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,256ul,6ul>>::node_header,caulk::alloc::embed_block_memory> *,5,(caulk::concurrent::skiplist_options)1>::key_lt &>(unint64_t a1, uint64_t a2, unint64_t a3, void *a4)
{
  unint64_t v4 = a3;
  unint64_t v5 = atomic_load((unint64_t *)(a3 + 16 * a2 + 32));
  unint64_t v6 = v5 & 0xFFFFFFFFFFFFFFFCLL;
  if (*a4 > *(void *)(v5 & 0xFFFFFFFFFFFFFFFCLL))
  {
    do
    {
      char v10 = atomic_load((unint64_t *)(v6 + 32));
      if (v10)
      {
        unint64_t v4 = caulk::concurrent::skiplist<unsigned long,caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,256ul,6ul>::node_impl<caulk::alloc::tree_allocator<caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,256ul,6ul>>::node_header,caulk::alloc::embed_block_memory> *,5,(caulk::concurrent::skiplist_options)1>::try_flag_node(a1, a2, v4, v6);
        if (!v11) {
          caulk::concurrent::skiplist<unsigned long,caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,256ul,6ul>::node_impl<caulk::alloc::tree_allocator<caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,256ul,6ul>>::node_header,caulk::alloc::embed_block_memory> *,5,(caulk::concurrent::skiplist_options)1>::help_flagged(a1, a2, v4, v6);
        }
      }
      else
      {
        unint64_t v4 = v6;
      }
      unint64_t v12 = atomic_load((unint64_t *)(v4 + 16 * a2 + 32));
      unint64_t v6 = v12 & 0xFFFFFFFFFFFFFFFCLL;
    }
    while (*a4 > *(void *)(v12 & 0xFFFFFFFFFFFFFFFCLL));
  }
  return v4;
}

uint64_t caulk::concurrent::skiplist<unsigned long,caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,16ul,6ul>::node_impl<caulk::alloc::tree_allocator<caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,16ul,6ul>>::node_header,caulk::alloc::embed_block_memory> *,5,(caulk::concurrent::skiplist_options)1>::clear(unint64_t a1)
{
  uint64_t v2 = a1 + 160;
  caulk::concurrent::details::node_allocator<void *,caulk::alloc::detail::tracked_block,10ul,(caulk::concurrent::skiplist_options)0>::begin_traversal();
  for (unint64_t i = atomic_load((unint64_t *)(a1 + 32)); ; unint64_t i = atomic_load((unint64_t *)(v4 + 32)))
  {
    unint64_t v4 = i & 0xFFFFFFFFFFFFFFFCLL;
    if (a1 + 112 == (i & 0xFFFFFFFFFFFFFFFCLL)) {
      break;
    }
    if (*(unsigned char *)(v4 + 18) != 2)
    {
      char v5 = atomic_load((unint64_t *)(v4 + 32));
      if ((v5 & 1) == 0) {
        caulk::concurrent::skiplist<unsigned long,caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,16ul,6ul>::node_impl<caulk::alloc::tree_allocator<caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,16ul,6ul>>::node_header,caulk::alloc::embed_block_memory> *,5,(caulk::concurrent::skiplist_options)1>::remove(a1, *(void *)v4);
      }
    }
  }
  return caulk::concurrent::details::node_allocator<unsigned long,caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,256ul,6ul>::node_impl<caulk::alloc::tree_allocator<caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,256ul,6ul>>::node_header,caulk::alloc::embed_block_memory> *,5ul,(caulk::concurrent::skiplist_options)1>::end_traversal(v2, i);
}

void *caulk::concurrent::details::node_allocator<unsigned long,caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,16ul,6ul>::node_impl<caulk::alloc::tree_allocator<caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,16ul,6ul>>::node_header,caulk::alloc::embed_block_memory> *,5ul,(caulk::concurrent::skiplist_options)1>::~node_allocator(void *a1)
{
  _X2 = 0;
  _X3 = 0;
  __asm { CASPAL          X2, X3, X2, X3, [X0] }
  if (_X2) {
    caulk::concurrent::details::node_allocator<unsigned long,caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,256ul,6ul>::node_impl<caulk::alloc::tree_allocator<caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,256ul,6ul>>::node_header,caulk::alloc::embed_block_memory> *,5ul,(caulk::concurrent::skiplist_options)1>::free_node_chain((uint64_t)a1, _X2);
  }
  caulk::concurrent::details::node_allocator<unsigned long,caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,256ul,6ul>::node_impl<caulk::alloc::tree_allocator<caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,256ul,6ul>>::node_header,caulk::alloc::embed_block_memory> *,5ul,(caulk::concurrent::skiplist_options)1>::perform_deferred_deletions<true,(BOOL *)0>((uint64_t)a1);
  (*(void (**)(void *))(a1[9] + 24))(a1 + 10);
  (*(void (**)(void *))(a1[4] + 24))(a1 + 5);
  unint64_t v9 = (std::__shared_weak_count *)a1[3];
  if (v9) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v9);
  }
  return a1;
}

uint64_t caulk::concurrent::skiplist<unsigned long,caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,16ul,6ul>::node_impl<caulk::alloc::tree_allocator<caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,16ul,6ul>>::node_header,caulk::alloc::embed_block_memory> *,5,(caulk::concurrent::skiplist_options)1>::remove(unint64_t a1, uint64_t a2)
{
  uint64_t v4 = a1 + 160;
  caulk::concurrent::details::node_allocator<void *,caulk::alloc::detail::tracked_block,10ul,(caulk::concurrent::skiplist_options)0>::begin_traversal();
  uint64_t v17 = a2;
  uint64_t v5 = -1;
  uint64_t v6 = 48;
  do
  {
    unint64_t v7 = atomic_load((unint64_t *)(a1 + v6));
    ++v5;
    v6 += 16;
  }
  while (*(unsigned char *)((v7 & 0xFFFFFFFFFFFFFFFCLL) + 18) != 2);
  unint64_t v8 = a1;
  if (v5)
  {
    unint64_t v8 = a1;
    do
      unint64_t v8 = caulk::concurrent::skiplist<unsigned long,caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,256ul,6ul>::node_impl<caulk::alloc::tree_allocator<caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,256ul,6ul>>::node_header,caulk::alloc::embed_block_memory> *,5,(caulk::concurrent::skiplist_options)1>::search_right<caulk::concurrent::skiplist<unsigned long,caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,256ul,6ul>::node_impl<caulk::alloc::tree_allocator<caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,256ul,6ul>>::node_header,caulk::alloc::embed_block_memory> *,5,(caulk::concurrent::skiplist_options)1>::key_lt &>(a1, v5--, v8, &v17);
    while (v5);
  }
  unint64_t v9 = caulk::concurrent::skiplist<unsigned long,caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,256ul,6ul>::node_impl<caulk::alloc::tree_allocator<caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,256ul,6ul>>::node_header,caulk::alloc::embed_block_memory> *,5,(caulk::concurrent::skiplist_options)1>::search_right<caulk::concurrent::skiplist<unsigned long,caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,256ul,6ul>::node_impl<caulk::alloc::tree_allocator<caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,256ul,6ul>>::node_header,caulk::alloc::embed_block_memory> *,5,(caulk::concurrent::skiplist_options)1>::key_lt &>(a1, 0, v8, &v17);
  unint64_t v11 = *v10;
  if (*v10 == a2)
  {
    uint64_t v12 = (uint64_t)v10;
    unint64_t v13 = caulk::concurrent::skiplist<unsigned long,caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,256ul,6ul>::node_impl<caulk::alloc::tree_allocator<caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,256ul,6ul>>::node_header,caulk::alloc::embed_block_memory> *,5,(caulk::concurrent::skiplist_options)1>::try_flag_node(a1, 0, v9, (unint64_t)v10);
    uint64_t v15 = v14;
    if (!v14) {
      caulk::concurrent::skiplist<unsigned long,caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,256ul,6ul>::node_impl<caulk::alloc::tree_allocator<caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,256ul,6ul>>::node_header,caulk::alloc::embed_block_memory> *,5,(caulk::concurrent::skiplist_options)1>::help_flagged(a1, 0, v13, v12);
    }
    if ((v15 & 0xFF00000000) != 0)
    {
      uint64_t v17 = a2;
      caulk::concurrent::skiplist<unsigned long,caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,256ul,6ul>::node_impl<caulk::alloc::tree_allocator<caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,256ul,6ul>>::node_header,caulk::alloc::embed_block_memory> *,5,(caulk::concurrent::skiplist_options)1>::search_to_level<caulk::concurrent::skiplist<unsigned long,caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,256ul,6ul>::node_impl<caulk::alloc::tree_allocator<caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,256ul,6ul>>::node_header,caulk::alloc::embed_block_memory> *,5,(caulk::concurrent::skiplist_options)1>::key_le>(a1, &v17, 0);
    }
  }
  return caulk::concurrent::details::node_allocator<unsigned long,caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,256ul,6ul>::node_impl<caulk::alloc::tree_allocator<caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,256ul,6ul>>::node_header,caulk::alloc::embed_block_memory> *,5ul,(caulk::concurrent::skiplist_options)1>::end_traversal(v4, v11);
}

uint64_t caulk::alloc::darwin_resource<caulk::alloc::dsw_allocator2<true>,caulk::alloc::rt_safe_memory_resource>::zone_locked()
{
  return 0;
}

double caulk::alloc::darwin_resource<caulk::alloc::dsw_allocator2<true>,caulk::alloc::rt_safe_memory_resource>::zone_statistics(uint64_t a1, _OWORD *a2)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  uint64_t v3 = *(void *)(a1 - 8);
  long long v8 = 0u;
  long long v9 = 0u;
  v10[0] = &unk_26C2AAD48;
  v10[1] = &v8;
  v10[3] = v10;
  v11[0] = &unk_26C2AAA88;
  v11[1] = v10;
  v11[3] = v11;
  int v12 = 7;
  v13[0] = &unk_26C2AB948;
  v13[1] = caulk::alloc::introspector::local_reader;
  uint64_t v14 = v13;
  std::__function::__value_func<void ()(caulk::alloc::region_usage,unsigned long,unsigned long)>::__value_func[abi:ne180100]((uint64_t)v15, (uint64_t)v11);
  char v16 = 1;
  std::__function::__value_func<void ()(caulk::alloc::region_usage,unsigned long,unsigned long)>::~__value_func[abi:ne180100](v11);
  uint64_t v4 = std::function<void * ()(unsigned long,unsigned long)>::operator()((uint64_t)v14, v3, 1616);
  caulk::alloc::tiered_allocator<caulk::alloc::size_range_tier<0ul,1008ul,caulk::alloc::tree_allocator<caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,16ul,6ul>>>,caulk::alloc::size_range_tier<1009ul,16128ul,caulk::alloc::tree_allocator<caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,256ul,6ul>>>,caulk::alloc::tracking_allocator<caulk::alloc::global_page_cache>>::introspect(v4 + 16, v3, (uint64_t)&v12);
  std::__function::__value_func<void ()(caulk::alloc::region_usage,unsigned long,unsigned long)>::~__value_func[abi:ne180100](v15);
  std::__function::__value_func<void * ()(unsigned long,unsigned long)>::~__value_func[abi:ne180100](v13);
  std::__function::__value_func<void ()(caulk::alloc::region_usage,caulk::alloc::block)>::~__value_func[abi:ne180100](v10);
  uint64_t v5 = *((void *)&v8 + 1);
  if (*(void *)(v3 + 1592) > *((void *)&v8 + 1)) {
    uint64_t v5 = *(void *)(v3 + 1592);
  }
  *(void *)&long long v9 = v5;
  *((void *)&v9 + 1) += *((void *)&v8 + 1);
  *(void *)(v3 + 1592) = v5;
  double result = *(double *)&v8;
  long long v7 = v9;
  *a2 = v8;
  a2[1] = v7;
  return result;
}

void sub_21086F2C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, ...)
{
  va_start(va, a6);
  std::__function::__value_func<void ()(caulk::alloc::region_usage,unsigned long,unsigned long)>::~__value_func[abi:ne180100](v7);
  std::__function::__value_func<void * ()(unsigned long,unsigned long)>::~__value_func[abi:ne180100](v6);
  std::__function::__value_func<void ()(caulk::alloc::region_usage,caulk::alloc::block)>::~__value_func[abi:ne180100]((uint64_t *)va);
  _Unwind_Resume(a1);
}

uint64_t std::__function::__value_func<void ()(caulk::alloc::region_usage,unsigned long,unsigned long)>::__value_func[abi:ne180100](uint64_t a1, uint64_t a2)
{
  uint64_t v3 = (void *)(a2 + 24);
  uint64_t v4 = *(void *)(a2 + 24);
  if (v4)
  {
    if (v4 == a2)
    {
      *(void *)(a1 + 24) = a1;
      (*(void (**)(void, uint64_t))(*(void *)*v3 + 24))(*v3, a1);
      return a1;
    }
    *(void *)(a1 + 24) = v4;
  }
  else
  {
    uint64_t v3 = (void *)(a1 + 24);
  }
  void *v3 = 0;
  return a1;
}

void *std::__function::__value_func<void ()(caulk::alloc::region_usage,unsigned long,unsigned long)>::~__value_func[abi:ne180100](void *a1)
{
  uint64_t v2 = (void *)a1[3];
  if (v2 == a1)
  {
    (*(void (**)(void *))(*a1 + 32))(a1);
  }
  else if (v2)
  {
    (*(void (**)(void *))(*v2 + 40))(v2);
  }
  return a1;
}

uint64_t std::function<void * ()(unsigned long,unsigned long)>::operator()(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = a3;
  uint64_t v5 = a2;
  if (!a1) {
    std::__throw_bad_function_call[abi:ne180100]();
  }
  return (*(uint64_t (**)(uint64_t, uint64_t *, uint64_t *))(*(void *)a1 + 48))(a1, &v5, &v4);
}

uint64_t caulk::alloc::tiered_allocator<caulk::alloc::size_range_tier<0ul,1008ul,caulk::alloc::tree_allocator<caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,16ul,6ul>>>,caulk::alloc::size_range_tier<1009ul,16128ul,caulk::alloc::tree_allocator<caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,256ul,6ul>>>,caulk::alloc::tracking_allocator<caulk::alloc::global_page_cache>>::introspect(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v19[5] = *MEMORY[0x263EF8340];
  LOBYTE(v14) = 0;
  char v16 = 0;
  if (*(unsigned char *)(a3 + 72))
  {
    uint64_t v14 = a1 + 976;
    uint64_t v15 = a1 + 1136;
    caulk::concurrent::details::node_allocator<void *,caulk::alloc::detail::tracked_block,10ul,(caulk::concurrent::skiplist_options)0>::begin_traversal();
    char v16 = 1;
  }
  for (uint64_t i = a1 + 976;
        ;
        uint64_t i = std::function<void * ()(unsigned long,unsigned long)>::operator()(*(void *)(a3 + 32), v6 & 0xFFFFFFFFFFFFFFFCLL, 48))
  {
    unint64_t v6 = atomic_load((unint64_t *)(i + 32));
    if (!*(unsigned char *)(i + 18))
    {
      uint64_t v7 = *(void *)(i + 8);
      uint64_t v8 = std::function<void * ()(unsigned long,unsigned long)>::operator()(*(void *)(a3 + 32), v7, 0x4000);
      caulk::alloc::bitmap_allocator<caulk::alloc::embed_block_memory,16368ul,16ul,6ul>::introspect(v8 + 16, v7 + 16, a3);
    }
    if ((v6 & 0xFFFFFFFFFFFFFFFCLL) == 0) {
      break;
    }
  }
  caulk::alloc::introspector::copy_with_types((uint64_t)&v17, a3);
  std::__function::__value_func<void ()(caulk::alloc::region_usage,unsigned long,unsigned long)>::~__value_func[abi:ne180100](v19);
  std::__function::__value_func<void * ()(unsigned long,unsigned long)>::~__value_func[abi:ne180100](v18);
  std::__optional_destruct_base<caulk::concurrent::skiplist<unsigned long,caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,16ul,6ul>::node_impl<caulk::alloc::tree_allocator<caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,16ul,6ul>>::node_header,caulk::alloc::embed_block_memory> *,5,(caulk::concurrent::skiplist_options)1>::iteration,false>::~__optional_destruct_base[abi:ne180100]((uint64_t)&v14);
  LOBYTE(v14) = 0;
  char v16 = 0;
  if (*(unsigned char *)(a3 + 72))
  {
    uint64_t v14 = a1 + 368;
    uint64_t v15 = a1 + 528;
    caulk::concurrent::details::node_allocator<void *,caulk::alloc::detail::tracked_block,10ul,(caulk::concurrent::skiplist_options)0>::begin_traversal();
    char v16 = 1;
  }
  for (uint64_t j = a1 + 368;
        ;
        uint64_t j = std::function<void * ()(unsigned long,unsigned long)>::operator()(*(void *)(a3 + 32), v10 & 0xFFFFFFFFFFFFFFFCLL, 48))
  {
    unint64_t v10 = atomic_load((unint64_t *)(j + 32));
    if (!*(unsigned char *)(j + 18))
    {
      uint64_t v11 = *(void *)(j + 8);
      uint64_t v12 = std::function<void * ()(unsigned long,unsigned long)>::operator()(*(void *)(a3 + 32), v11, 0x4000);
      caulk::alloc::bitmap_allocator<caulk::alloc::embed_block_memory,16368ul,256ul,6ul>::introspect(v12 + 16, v11 + 16, a3);
    }
    if ((v10 & 0xFFFFFFFFFFFFFFFCLL) == 0) {
      break;
    }
  }
  caulk::alloc::introspector::copy_with_types((uint64_t)&v17, a3);
  std::__function::__value_func<void ()(caulk::alloc::region_usage,unsigned long,unsigned long)>::~__value_func[abi:ne180100](v19);
  std::__function::__value_func<void * ()(unsigned long,unsigned long)>::~__value_func[abi:ne180100](v18);
  std::__optional_destruct_base<caulk::concurrent::skiplist<unsigned long,caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,256ul,6ul>::node_impl<caulk::alloc::tree_allocator<caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,256ul,6ul>>::node_header,caulk::alloc::embed_block_memory> *,5,(caulk::concurrent::skiplist_options)1>::iteration,false>::~__optional_destruct_base[abi:ne180100]((uint64_t)&v14);
  uint64_t v14 = a3;
  uint64_t v17 = (int **)&v14;
  return caulk::concurrent::skiplist<void *,caulk::alloc::detail::tracked_block,10,(caulk::concurrent::skiplist_options)0>::introspect<void caulk::alloc::tracking_allocator<caulk::alloc::global_page_cache>::introspect_foreach<caulk::alloc::tracking_allocator<caulk::alloc::global_page_cache>::introspect(unsigned long,caulk::alloc::introspector const&)::{lambda(void *,unsigned long)#1}>(caulk::alloc::introspector const&,caulk::alloc::tracking_allocator<caulk::alloc::global_page_cache>::introspect(unsigned long,caulk::alloc::introspector const&)::{lambda(void *,unsigned long)#1} &&)::{lambda(caulk::alloc::tracking_allocator<caulk::alloc::global_page_cache>::introspect(unsigned long,caulk::alloc::introspector const&)::{lambda(void *,unsigned long)#1} const&)#1}>(a1 + 16, a3 + 8, &v17);
}

void sub_21086F5F8(_Unwind_Exception *exception_object)
{
}

void *std::__function::__value_func<void * ()(unsigned long,unsigned long)>::~__value_func[abi:ne180100](void *a1)
{
  uint64_t v2 = (void *)a1[3];
  if (v2 == a1)
  {
    (*(void (**)(void *))(*a1 + 32))(a1);
  }
  else if (v2)
  {
    (*(void (**)(void *))(*v2 + 40))(v2);
  }
  return a1;
}

uint64_t caulk::concurrent::skiplist<void *,caulk::alloc::detail::tracked_block,10,(caulk::concurrent::skiplist_options)0>::introspect<void caulk::alloc::tracking_allocator<caulk::alloc::global_page_cache>::introspect_foreach<caulk::alloc::tracking_allocator<caulk::alloc::global_page_cache>::introspect(unsigned long,caulk::alloc::introspector const&)::{lambda(void *,unsigned long)#1}>(caulk::alloc::introspector const&,caulk::alloc::tracking_allocator<caulk::alloc::global_page_cache>::introspect(unsigned long,caulk::alloc::introspector const&)::{lambda(void *,unsigned long)#1} &&)::{lambda(caulk::alloc::tracking_allocator<caulk::alloc::global_page_cache>::introspect(unsigned long,caulk::alloc::introspector const&)::{lambda(void *,unsigned long)#1} const&)#1}>(uint64_t result, uint64_t a2, int ***a3)
{
  uint64_t v5 = (void *)MEMORY[0x263EF8AF8];
  while (1)
  {
    unint64_t v6 = atomic_load((unint64_t *)(result + 40));
    if (!*(unsigned char *)(result + 26))
    {
      uint64_t v7 = *a3;
      uint64_t v8 = *(void *)(result + 16);
      uint64_t v9 = (*(void *)result + *v5 - 1) & -*v5;
      unint64_t v10 = **a3;
      int v11 = *v10;
      if ((*v10 & 2) != 0)
      {
        double result = std::function<void ()(caulk::alloc::region_usage,unsigned long,unsigned long)>::operator()(*((void *)v10 + 8), 2, v8, v9);
        unint64_t v10 = *v7;
        int v11 = **v7;
      }
      if (v11) {
        double result = std::function<void ()(caulk::alloc::region_usage,unsigned long,unsigned long)>::operator()(*((void *)v10 + 8), 1, v8, v9);
      }
    }
    if ((v6 & 0xFFFFFFFFFFFFFFFCLL) == 0) {
      break;
    }
    double result = std::function<void * ()(unsigned long,unsigned long)>::operator()(*(void *)(a2 + 24), v6 & 0xFFFFFFFFFFFFFFFCLL, 56);
  }
  return result;
}

uint64_t std::function<void ()(caulk::alloc::region_usage,unsigned long,unsigned long)>::operator()(uint64_t a1, int a2, uint64_t a3, uint64_t a4)
{
  int v7 = a2;
  uint64_t v5 = a4;
  uint64_t v6 = a3;
  if (!a1) {
    std::__throw_bad_function_call[abi:ne180100]();
  }
  return (*(uint64_t (**)(uint64_t, int *, uint64_t *, uint64_t *))(*(void *)a1 + 48))(a1, &v7, &v6, &v5);
}

void std::__throw_bad_function_call[abi:ne180100]()
{
  exception = __cxa_allocate_exception(8uLL);
}

void std::bad_function_call::~bad_function_call(std::bad_function_call *this)
{
  std::exception::~exception(this);

  JUMPOUT(0x216674B00);
}

uint64_t caulk::alloc::introspector::copy_with_types(uint64_t a1, uint64_t a2)
{
  *(_DWORD *)a1 = *(_DWORD *)a2;
  uint64_t v4 = a1 + 40;
  std::__function::__value_func<void * ()(unsigned long,unsigned long)>::__value_func[abi:ne180100](a1 + 8, a2 + 8);
  uint64_t result = *(void *)(a2 + 64);
  if (result)
  {
    if (result == a2 + 40)
    {
      *(void *)(a1 + 64) = v4;
      uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)result + 24))(result, v4);
      goto LABEL_6;
    }
    uint64_t result = (*(uint64_t (**)(uint64_t))(*(void *)result + 16))(result);
  }
  *(void *)(a1 + 64) = result;
LABEL_6:
  *(unsigned char *)(a1 + 72) = *(unsigned char *)(a2 + 72);
  *(_DWORD *)a1 = 6;
  return result;
}

void sub_21086F920(_Unwind_Exception *a1)
{
  std::__function::__value_func<void * ()(unsigned long,unsigned long)>::~__value_func[abi:ne180100](v1);
  _Unwind_Resume(a1);
}

uint64_t std::__optional_destruct_base<caulk::concurrent::skiplist<unsigned long,caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,256ul,6ul>::node_impl<caulk::alloc::tree_allocator<caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,256ul,6ul>>::node_header,caulk::alloc::embed_block_memory> *,5,(caulk::concurrent::skiplist_options)1>::iteration,false>::~__optional_destruct_base[abi:ne180100](uint64_t a1)
{
  if (*(unsigned char *)(a1 + 16)) {
    caulk::concurrent::details::node_allocator<unsigned long,caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,256ul,6ul>::node_impl<caulk::alloc::tree_allocator<caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,256ul,6ul>>::node_header,caulk::alloc::embed_block_memory> *,5ul,(caulk::concurrent::skiplist_options)1>::end_traversal(*(void *)(a1 + 8), *(unsigned __int8 *)(a1 + 16));
  }
  return a1;
}

uint64_t std::__function::__value_func<void * ()(unsigned long,unsigned long)>::__value_func[abi:ne180100](uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 24);
  if (v3)
  {
    if (v3 == a2)
    {
      *(void *)(a1 + 24) = a1;
      (*(void (**)(void, uint64_t))(**(void **)(a2 + 24) + 24))(*(void *)(a2 + 24), a1);
    }
    else
    {
      *(void *)(a1 + 24) = (*(uint64_t (**)(uint64_t))(*(void *)v3 + 16))(v3);
    }
  }
  else
  {
    *(void *)(a1 + 24) = 0;
  }
  return a1;
}

{
  void *v3;
  uint64_t v4;

  uint64_t v3 = (void *)(a2 + 24);
  uint64_t v4 = *(void *)(a2 + 24);
  if (v4)
  {
    if (v4 == a2)
    {
      *(void *)(a1 + 24) = a1;
      (*(void (**)(void, uint64_t))(*(void *)*v3 + 24))(*v3, a1);
      return a1;
    }
    *(void *)(a1 + 24) = v4;
  }
  else
  {
    uint64_t v3 = (void *)(a1 + 24);
  }
  void *v3 = 0;
  return a1;
}

uint64_t *caulk::alloc::bitmap_allocator<caulk::alloc::embed_block_memory,16368ul,256ul,6ul>::introspect(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if ((*(unsigned char *)a3 & 4) != 0) {
    std::function<void ()(caulk::alloc::region_usage,unsigned long,unsigned long)>::operator()(*(void *)(a3 + 64), 4, a2, 240);
  }

  return caulk::alloc::detail::state_bit_span::introspect((uint64_t *)(a1 + 8), 2, (const caulk::alloc::introspector *)(a2 + 240), a3, 0x100u, 0x3Fu);
}

uint64_t *caulk::alloc::detail::state_bit_span::introspect(uint64_t *this, uint64_t a2, const caulk::alloc::introspector *a3, uint64_t a4, unsigned int a5, unsigned int a6)
{
  if (!a2) {
    return this;
  }
  uint64_t v9 = this;
  unsigned int v10 = 0;
  int v11 = 0;
  uint64_t v12 = 0;
  int v13 = 1;
  uint64_t v14 = &this[a2];
  unint64_t v25 = v14;
  do
  {
    uint64_t v15 = *v9;
    if (v10 >= a6) {
      goto LABEL_27;
    }
    unsigned int v16 = 0;
    uint64_t v17 = 1;
    int v18 = v13;
    do
    {
      int v13 = ((v15 & (v17 << 32)) != 0) | (2 * ((v17 & v15) != 0));
      switch(v13)
      {
        case 0:
          if ((v18 - 2) >= 2)
          {
            if (v18)
            {
              uint64_t v12 = a3;
              int v11 = 0;
            }
            break;
          }
          if (*(unsigned char *)a4)
          {
            uint64_t v19 = v11 * a5;
            uint64_t v20 = *(void *)(a4 + 64);
            int v21 = 1;
LABEL_22:
            this = (uint64_t *)std::function<void ()(caulk::alloc::region_usage,unsigned long,unsigned long)>::operator()(v20, v21, (uint64_t)v12, v19);
            goto LABEL_23;
          }
          goto LABEL_23;
        case 3:
          if ((v18 - 2) >= 2)
          {
            if (v18 || (*(unsigned char *)a4 & 2) == 0) {
              goto LABEL_23;
            }
            int v21 = 2;
            goto LABEL_21;
          }
          if (*(unsigned char *)a4)
          {
            int v21 = 1;
LABEL_21:
            uint64_t v19 = v11 * a5;
            uint64_t v20 = *(void *)(a4 + 64);
            goto LABEL_22;
          }
LABEL_23:
          int v11 = 0;
          uint64_t v12 = a3;
          break;
        case 1:
          __break(1u);
          return this;
      }
      ++v11;
      a3 = (const caulk::alloc::introspector *)((char *)a3 + a5);
      unsigned int v22 = v16 + 1;
      if (v16 > 0x1E) {
        break;
      }
      v17 *= 2;
      ++v16;
      int v18 = v13;
    }
    while (v22 + v10 < a6);
    v10 += v22;
    uint64_t v14 = v25;
LABEL_27:
    ++v9;
  }
  while (v9 != v14);
  if ((v13 - 2) >= 2)
  {
    if (!v13 && (*(unsigned char *)a4 & 2) != 0)
    {
      int v23 = 2;
LABEL_35:
      uint64_t v24 = *(void *)(a4 + 64);
      return (uint64_t *)std::function<void ()(caulk::alloc::region_usage,unsigned long,unsigned long)>::operator()(v24, v23, (uint64_t)v12, v11 * a5);
    }
  }
  else if (*(unsigned char *)a4)
  {
    int v23 = 1;
    goto LABEL_35;
  }
  return this;
}

uint64_t std::__optional_destruct_base<caulk::concurrent::skiplist<unsigned long,caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,16ul,6ul>::node_impl<caulk::alloc::tree_allocator<caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,16ul,6ul>>::node_header,caulk::alloc::embed_block_memory> *,5,(caulk::concurrent::skiplist_options)1>::iteration,false>::~__optional_destruct_base[abi:ne180100](uint64_t a1)
{
  if (*(unsigned char *)(a1 + 16)) {
    caulk::concurrent::details::node_allocator<unsigned long,caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,256ul,6ul>::node_impl<caulk::alloc::tree_allocator<caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,256ul,6ul>>::node_header,caulk::alloc::embed_block_memory> *,5ul,(caulk::concurrent::skiplist_options)1>::end_traversal(*(void *)(a1 + 8), *(unsigned __int8 *)(a1 + 16));
  }
  return a1;
}

uint64_t *caulk::alloc::bitmap_allocator<caulk::alloc::embed_block_memory,16368ul,16ul,6ul>::introspect(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if ((*(unsigned char *)a3 & 4) != 0) {
    std::function<void ()(caulk::alloc::region_usage,unsigned long,unsigned long)>::operator()(*(void *)(a3 + 64), 4, a2, 272);
  }

  return caulk::alloc::detail::state_bit_span::introspect((uint64_t *)(a1 + 8), 32, (const caulk::alloc::introspector *)(a2 + 272), a3, 0x10u, 0x3EEu);
}

void *std::__function::__func<void * (*)(unsigned long,unsigned long),std::allocator<void * (*)(unsigned long,unsigned long)>,void * ()(unsigned long,unsigned long)>::target_type()
{
}

uint64_t std::__function::__func<void * (*)(unsigned long,unsigned long),std::allocator<void * (*)(unsigned long,unsigned long)>,void * ()(unsigned long,unsigned long)>::target(uint64_t a1, uint64_t a2)
{
  if (std::type_info::operator==[abi:ne180100](*(void *)(a2 + 8), 0x800000021088A210)) {
    return a1 + 8;
  }
  else {
    return 0;
  }
}

uint64_t std::__function::__func<void * (*)(unsigned long,unsigned long),std::allocator<void * (*)(unsigned long,unsigned long)>,void * ()(unsigned long,unsigned long)>::operator()(uint64_t a1, void *a2, void *a3)
{
  return (*(uint64_t (**)(void, void))(a1 + 8))(*a2, *a3);
}

uint64_t std::__function::__func<void * (*)(unsigned long,unsigned long),std::allocator<void * (*)(unsigned long,unsigned long)>,void * ()(unsigned long,unsigned long)>::__clone(uint64_t result, void *a2)
{
  uint64_t v2 = *(void *)(result + 8);
  *a2 = &unk_26C2AB948;
  a2[1] = v2;
  return result;
}

void *std::__function::__func<void * (*)(unsigned long,unsigned long),std::allocator<void * (*)(unsigned long,unsigned long)>,void * ()(unsigned long,unsigned long)>::__clone(uint64_t a1)
{
  uint64_t result = operator new(0x10uLL);
  uint64_t v3 = *(void *)(a1 + 8);
  *uint64_t result = &unk_26C2AB948;
  result[1] = v3;
  return result;
}

void std::__function::__func<void * (*)(unsigned long,unsigned long),std::allocator<void * (*)(unsigned long,unsigned long)>,void * ()(unsigned long,unsigned long)>::~__func()
{
}

void *std::__function::__func<void caulk::alloc::allocator_enumerate<caulk::alloc::darwin_resource<caulk::alloc::dsw_allocator2<true>,caulk::alloc::rt_safe_memory_resource>>(caulk::alloc::darwin_resource<caulk::alloc::dsw_allocator2<true>,caulk::alloc::rt_safe_memory_resource> &,caulk::option_set<caulk::alloc::region_usage,unsigned int>,std::function<void ()(caulk::alloc::region_usage,caulk::alloc::block)> const&)::{lambda(caulk::alloc::region_usage,unsigned long,unsigned long)#1},std::allocator<void caulk::alloc::allocator_enumerate<caulk::alloc::darwin_resource<caulk::alloc::dsw_allocator2<true>,caulk::alloc::rt_safe_memory_resource>>(caulk::alloc::darwin_resource<caulk::alloc::dsw_allocator2<true>,caulk::alloc::rt_safe_memory_resource> &,caulk::option_set<caulk::alloc::region_usage,unsigned int>,std::function<void ()(caulk::alloc::region_usage,caulk::alloc::block)> const&)::{lambda(caulk::alloc::region_usage,unsigned long,unsigned long)#1}>,void ()(caulk::alloc::region_usage,unsigned long,unsigned long)>::target_type()
{
}

uint64_t std::__function::__func<void caulk::alloc::allocator_enumerate<caulk::alloc::darwin_resource<caulk::alloc::dsw_allocator2<true>,caulk::alloc::rt_safe_memory_resource>>(caulk::alloc::darwin_resource<caulk::alloc::dsw_allocator2<true>,caulk::alloc::rt_safe_memory_resource> &,caulk::option_set<caulk::alloc::region_usage,unsigned int>,std::function<void ()(caulk::alloc::region_usage,caulk::alloc::block)> const&)::{lambda(caulk::alloc::region_usage,unsigned long,unsigned long)#1},std::allocator<void caulk::alloc::allocator_enumerate<caulk::alloc::darwin_resource<caulk::alloc::dsw_allocator2<true>,caulk::alloc::rt_safe_memory_resource>>(caulk::alloc::darwin_resource<caulk::alloc::dsw_allocator2<true>,caulk::alloc::rt_safe_memory_resource> &,caulk::option_set<caulk::alloc::region_usage,unsigned int>,std::function<void ()(caulk::alloc::region_usage,caulk::alloc::block)> const&)::{lambda(caulk::alloc::region_usage,unsigned long,unsigned long)#1}>,void ()(caulk::alloc::region_usage,unsigned long,unsigned long)>::target(uint64_t a1, uint64_t a2)
{
  if (std::type_info::operator==[abi:ne180100](*(void *)(a2 + 8), (uint64_t)"ZN5caulk5alloc19allocator_enumerateINS0_15darwin_resourceINS0_14dsw_allocator2ILb1EEENS0_23rt_safe_memory_resourceEEEEEvRT_NS_10option_setINS0_12region_usageEjEERKNSt3__18functionIFvSA_NS0_5blockEEEEEUlSA_mmE_"))
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

uint64_t std::__function::__func<void caulk::alloc::allocator_enumerate<caulk::alloc::darwin_resource<caulk::alloc::dsw_allocator2<true>,caulk::alloc::rt_safe_memory_resource>>(caulk::alloc::darwin_resource<caulk::alloc::dsw_allocator2<true>,caulk::alloc::rt_safe_memory_resource> &,caulk::option_set<caulk::alloc::region_usage,unsigned int>,std::function<void ()(caulk::alloc::region_usage,caulk::alloc::block)> const&)::{lambda(caulk::alloc::region_usage,unsigned long,unsigned long)#1},std::allocator<void caulk::alloc::allocator_enumerate<caulk::alloc::darwin_resource<caulk::alloc::dsw_allocator2<true>,caulk::alloc::rt_safe_memory_resource>>(caulk::alloc::darwin_resource<caulk::alloc::dsw_allocator2<true>,caulk::alloc::rt_safe_memory_resource> &,caulk::option_set<caulk::alloc::region_usage,unsigned int>,std::function<void ()(caulk::alloc::region_usage,caulk::alloc::block)> const&)::{lambda(caulk::alloc::region_usage,unsigned long,unsigned long)#1}>,void ()(caulk::alloc::region_usage,unsigned long,unsigned long)>::operator()(uint64_t a1, int *a2, uint64_t *a3, uint64_t *a4)
{
  return std::function<void ()(caulk::alloc::region_usage,caulk::alloc::block)>::operator()(*(void *)(*(void *)(a1 + 8) + 24), *a2, *a3, *a4);
}

uint64_t std::function<void ()(caulk::alloc::region_usage,caulk::alloc::block)>::operator()(uint64_t a1, int a2, uint64_t a3, uint64_t a4)
{
  v6[0] = a3;
  v6[1] = a4;
  int v5 = a2;
  if (!a1) {
    std::__throw_bad_function_call[abi:ne180100]();
  }
  return (*(uint64_t (**)(uint64_t, int *, void *))(*(void *)a1 + 48))(a1, &v5, v6);
}

uint64_t std::__function::__func<void caulk::alloc::allocator_enumerate<caulk::alloc::darwin_resource<caulk::alloc::dsw_allocator2<true>,caulk::alloc::rt_safe_memory_resource>>(caulk::alloc::darwin_resource<caulk::alloc::dsw_allocator2<true>,caulk::alloc::rt_safe_memory_resource> &,caulk::option_set<caulk::alloc::region_usage,unsigned int>,std::function<void ()(caulk::alloc::region_usage,caulk::alloc::block)> const&)::{lambda(caulk::alloc::region_usage,unsigned long,unsigned long)#1},std::allocator<void caulk::alloc::allocator_enumerate<caulk::alloc::darwin_resource<caulk::alloc::dsw_allocator2<true>,caulk::alloc::rt_safe_memory_resource>>(caulk::alloc::darwin_resource<caulk::alloc::dsw_allocator2<true>,caulk::alloc::rt_safe_memory_resource> &,caulk::option_set<caulk::alloc::region_usage,unsigned int>,std::function<void ()(caulk::alloc::region_usage,caulk::alloc::block)> const&)::{lambda(caulk::alloc::region_usage,unsigned long,unsigned long)#1}>,void ()(caulk::alloc::region_usage,unsigned long,unsigned long)>::__clone(uint64_t result, void *a2)
{
  uint64_t v2 = *(void *)(result + 8);
  *a2 = &unk_26C2AAA88;
  a2[1] = v2;
  return result;
}

void *std::__function::__func<void caulk::alloc::allocator_enumerate<caulk::alloc::darwin_resource<caulk::alloc::dsw_allocator2<true>,caulk::alloc::rt_safe_memory_resource>>(caulk::alloc::darwin_resource<caulk::alloc::dsw_allocator2<true>,caulk::alloc::rt_safe_memory_resource> &,caulk::option_set<caulk::alloc::region_usage,unsigned int>,std::function<void ()(caulk::alloc::region_usage,caulk::alloc::block)> const&)::{lambda(caulk::alloc::region_usage,unsigned long,unsigned long)#1},std::allocator<void caulk::alloc::allocator_enumerate<caulk::alloc::darwin_resource<caulk::alloc::dsw_allocator2<true>,caulk::alloc::rt_safe_memory_resource>>(caulk::alloc::darwin_resource<caulk::alloc::dsw_allocator2<true>,caulk::alloc::rt_safe_memory_resource> &,caulk::option_set<caulk::alloc::region_usage,unsigned int>,std::function<void ()(caulk::alloc::region_usage,caulk::alloc::block)> const&)::{lambda(caulk::alloc::region_usage,unsigned long,unsigned long)#1}>,void ()(caulk::alloc::region_usage,unsigned long,unsigned long)>::__clone(uint64_t a1)
{
  uint64_t result = operator new(0x10uLL);
  uint64_t v3 = *(void *)(a1 + 8);
  *uint64_t result = &unk_26C2AAA88;
  result[1] = v3;
  return result;
}

void std::__function::__func<void caulk::alloc::allocator_enumerate<caulk::alloc::darwin_resource<caulk::alloc::dsw_allocator2<true>,caulk::alloc::rt_safe_memory_resource>>(caulk::alloc::darwin_resource<caulk::alloc::dsw_allocator2<true>,caulk::alloc::rt_safe_memory_resource> &,caulk::option_set<caulk::alloc::region_usage,unsigned int>,std::function<void ()(caulk::alloc::region_usage,caulk::alloc::block)> const&)::{lambda(caulk::alloc::region_usage,unsigned long,unsigned long)#1},std::allocator<void caulk::alloc::allocator_enumerate<caulk::alloc::darwin_resource<caulk::alloc::dsw_allocator2<true>,caulk::alloc::rt_safe_memory_resource>>(caulk::alloc::darwin_resource<caulk::alloc::dsw_allocator2<true>,caulk::alloc::rt_safe_memory_resource> &,caulk::option_set<caulk::alloc::region_usage,unsigned int>,std::function<void ()(caulk::alloc::region_usage,caulk::alloc::block)> const&)::{lambda(caulk::alloc::region_usage,unsigned long,unsigned long)#1}>,void ()(caulk::alloc::region_usage,unsigned long,unsigned long)>::~__func()
{
}

void *std::__function::__func<malloc_statistics_t caulk::alloc::allocator_statistics<caulk::alloc::darwin_resource<caulk::alloc::dsw_allocator2<true>,caulk::alloc::rt_safe_memory_resource>>(caulk::alloc::darwin_resource<caulk::alloc::dsw_allocator2<true>,caulk::alloc::rt_safe_memory_resource> &)::{lambda(caulk::alloc::region_usage,caulk::alloc::block)#1},std::allocator<malloc_statistics_t caulk::alloc::allocator_statistics<caulk::alloc::darwin_resource<caulk::alloc::dsw_allocator2<true>,caulk::alloc::rt_safe_memory_resource>>(caulk::alloc::darwin_resource<caulk::alloc::dsw_allocator2<true>,caulk::alloc::rt_safe_memory_resource> &)::{lambda(caulk::alloc::region_usage,caulk::alloc::block)#1}>,void ()(caulk::alloc::region_usage,caulk::alloc::block)>::target_type()
{
}

uint64_t std::__function::__func<malloc_statistics_t caulk::alloc::allocator_statistics<caulk::alloc::darwin_resource<caulk::alloc::dsw_allocator2<true>,caulk::alloc::rt_safe_memory_resource>>(caulk::alloc::darwin_resource<caulk::alloc::dsw_allocator2<true>,caulk::alloc::rt_safe_memory_resource> &)::{lambda(caulk::alloc::region_usage,caulk::alloc::block)#1},std::allocator<malloc_statistics_t caulk::alloc::allocator_statistics<caulk::alloc::darwin_resource<caulk::alloc::dsw_allocator2<true>,caulk::alloc::rt_safe_memory_resource>>(caulk::alloc::darwin_resource<caulk::alloc::dsw_allocator2<true>,caulk::alloc::rt_safe_memory_resource> &)::{lambda(caulk::alloc::region_usage,caulk::alloc::block)#1}>,void ()(caulk::alloc::region_usage,caulk::alloc::block)>::target(uint64_t a1, uint64_t a2)
{
  if (std::type_info::operator==[abi:ne180100](*(void *)(a2 + 8), (uint64_t)"ZN5caulk5alloc20allocator_statisticsINS0_15darwin_resourceINS0_14dsw_allocator2ILb1EEENS0_23rt_safe_memory_resourceEEEEE19malloc_statistics_tRT_EUlNS0_12region_usageENS0_5blockEE_"))
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

uint64_t std::__function::__func<malloc_statistics_t caulk::alloc::allocator_statistics<caulk::alloc::darwin_resource<caulk::alloc::dsw_allocator2<true>,caulk::alloc::rt_safe_memory_resource>>(caulk::alloc::darwin_resource<caulk::alloc::dsw_allocator2<true>,caulk::alloc::rt_safe_memory_resource> &)::{lambda(caulk::alloc::region_usage,caulk::alloc::block)#1},std::allocator<malloc_statistics_t caulk::alloc::allocator_statistics<caulk::alloc::darwin_resource<caulk::alloc::dsw_allocator2<true>,caulk::alloc::rt_safe_memory_resource>>(caulk::alloc::darwin_resource<caulk::alloc::dsw_allocator2<true>,caulk::alloc::rt_safe_memory_resource> &)::{lambda(caulk::alloc::region_usage,caulk::alloc::block)#1}>,void ()(caulk::alloc::region_usage,caulk::alloc::block)>::operator()(uint64_t result, int *a2, uint64_t a3)
{
  int v3 = *a2;
  uint64_t v4 = *(void *)(a3 + 8);
  if (*a2 == 4 || v3 == 2)
  {
    uint64_t v6 = (void *)(*(void *)(result + 8) + 24);
  }
  else
  {
    if (v3 != 1) {
      return result;
    }
    int v7 = *(_DWORD **)(result + 8);
    ++*v7;
    uint64_t v6 = v7 + 2;
  }
  *v6 += v4;
  return result;
}

uint64_t std::__function::__func<malloc_statistics_t caulk::alloc::allocator_statistics<caulk::alloc::darwin_resource<caulk::alloc::dsw_allocator2<true>,caulk::alloc::rt_safe_memory_resource>>(caulk::alloc::darwin_resource<caulk::alloc::dsw_allocator2<true>,caulk::alloc::rt_safe_memory_resource> &)::{lambda(caulk::alloc::region_usage,caulk::alloc::block)#1},std::allocator<malloc_statistics_t caulk::alloc::allocator_statistics<caulk::alloc::darwin_resource<caulk::alloc::dsw_allocator2<true>,caulk::alloc::rt_safe_memory_resource>>(caulk::alloc::darwin_resource<caulk::alloc::dsw_allocator2<true>,caulk::alloc::rt_safe_memory_resource> &)::{lambda(caulk::alloc::region_usage,caulk::alloc::block)#1}>,void ()(caulk::alloc::region_usage,caulk::alloc::block)>::__clone(uint64_t result, void *a2)
{
  uint64_t v2 = *(void *)(result + 8);
  *a2 = &unk_26C2AAD48;
  a2[1] = v2;
  return result;
}

void *std::__function::__func<malloc_statistics_t caulk::alloc::allocator_statistics<caulk::alloc::darwin_resource<caulk::alloc::dsw_allocator2<true>,caulk::alloc::rt_safe_memory_resource>>(caulk::alloc::darwin_resource<caulk::alloc::dsw_allocator2<true>,caulk::alloc::rt_safe_memory_resource> &)::{lambda(caulk::alloc::region_usage,caulk::alloc::block)#1},std::allocator<malloc_statistics_t caulk::alloc::allocator_statistics<caulk::alloc::darwin_resource<caulk::alloc::dsw_allocator2<true>,caulk::alloc::rt_safe_memory_resource>>(caulk::alloc::darwin_resource<caulk::alloc::dsw_allocator2<true>,caulk::alloc::rt_safe_memory_resource> &)::{lambda(caulk::alloc::region_usage,caulk::alloc::block)#1}>,void ()(caulk::alloc::region_usage,caulk::alloc::block)>::__clone(uint64_t a1)
{
  uint64_t result = operator new(0x10uLL);
  uint64_t v3 = *(void *)(a1 + 8);
  *uint64_t result = &unk_26C2AAD48;
  result[1] = v3;
  return result;
}

void std::__function::__func<malloc_statistics_t caulk::alloc::allocator_statistics<caulk::alloc::darwin_resource<caulk::alloc::dsw_allocator2<true>,caulk::alloc::rt_safe_memory_resource>>(caulk::alloc::darwin_resource<caulk::alloc::dsw_allocator2<true>,caulk::alloc::rt_safe_memory_resource> &)::{lambda(caulk::alloc::region_usage,caulk::alloc::block)#1},std::allocator<malloc_statistics_t caulk::alloc::allocator_statistics<caulk::alloc::darwin_resource<caulk::alloc::dsw_allocator2<true>,caulk::alloc::rt_safe_memory_resource>>(caulk::alloc::darwin_resource<caulk::alloc::dsw_allocator2<true>,caulk::alloc::rt_safe_memory_resource> &)::{lambda(caulk::alloc::region_usage,caulk::alloc::block)#1}>,void ()(caulk::alloc::region_usage,caulk::alloc::block)>::~__func()
{
}

uint64_t caulk::alloc::darwin_resource<caulk::alloc::dsw_allocator2<true>,caulk::alloc::rt_safe_memory_resource>::zone_print(uint64_t a1, int a2)
{
  return (*(uint64_t (**)(void, void, BOOL))(**(void **)(a1 - 8) + 48))(*(void *)(a1 - 8), MEMORY[0x263F8C100], a2 != 0);
}

uint64_t caulk::alloc::darwin_resource<caulk::alloc::dsw_allocator2<true>,caulk::alloc::rt_safe_memory_resource>::zone_check()
{
  return 1;
}

uint64_t caulk::alloc::darwin_resource<caulk::alloc::dsw_allocator2<true>,caulk::alloc::rt_safe_memory_resource>::zone_good_size(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t caulk::alloc::darwin_resource<caulk::alloc::dsw_allocator2<true>,caulk::alloc::rt_safe_memory_resource>::zone_enumerate(unsigned int a1, uint64_t a2, int a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  v17[0] = &unk_26C2AA6C0;
  v17[1] = a5;
  v17[2] = a1;
  v17[3] = v17;
  int v11 = operator new(0x20uLL);
  void *v11 = &unk_26C2AA668;
  v11[1] = a6;
  *((_DWORD *)v11 + 4) = a1;
  v11[3] = a2;
  void v16[3] = v11;
  int v18 = a3;
  std::__function::__value_func<void * ()(unsigned long,unsigned long)>::__value_func[abi:ne180100]((uint64_t)v19, (uint64_t)v17);
  std::__function::__value_func<void ()(caulk::alloc::region_usage,unsigned long,unsigned long)>::__value_func[abi:ne180100]((uint64_t)v21, (uint64_t)v16);
  char v22 = 0;
  std::__function::__value_func<void ()(caulk::alloc::region_usage,unsigned long,unsigned long)>::~__value_func[abi:ne180100](v16);
  std::__function::__value_func<void * ()(unsigned long,unsigned long)>::~__value_func[abi:ne180100](v17);
  uint64_t v12 = (void *)std::function<void * ()(unsigned long,unsigned long)>::operator()(v20, a4 - 8, 208);
  if (*v12) {
    uint64_t v13 = *v12 + 16;
  }
  else {
    uint64_t v13 = 0;
  }
  uint64_t v14 = std::function<void * ()(unsigned long,unsigned long)>::operator()(v20, v13, 1568);
  caulk::alloc::tiered_allocator<caulk::alloc::size_range_tier<0ul,1008ul,caulk::alloc::tree_allocator<caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,16ul,6ul>>>,caulk::alloc::size_range_tier<1009ul,16128ul,caulk::alloc::tree_allocator<caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,256ul,6ul>>>,caulk::alloc::tracking_allocator<caulk::alloc::global_page_cache>>::introspect(v14, v13, (uint64_t)&v18);
  std::__function::__value_func<void ()(caulk::alloc::region_usage,unsigned long,unsigned long)>::~__value_func[abi:ne180100](v21);
  std::__function::__value_func<void * ()(unsigned long,unsigned long)>::~__value_func[abi:ne180100](v19);
  return 0;
}

void sub_210870208(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, char a14)
{
  if (a2 == 1)
  {
    __cxa_begin_catch(a1);
    __cxa_end_catch();
    JUMPOUT(0x2108701C0);
  }
  std::__function::__value_func<void ()(caulk::alloc::region_usage,unsigned long,unsigned long)>::~__value_func[abi:ne180100](v15);
  std::__function::__value_func<void * ()(unsigned long,unsigned long)>::~__value_func[abi:ne180100](v14);
  _Unwind_Resume(a1);
}

void *std::__function::__func<caulk::alloc::darwin_resource<caulk::alloc::dsw_allocator2<true>,caulk::alloc::rt_safe_memory_resource>::zone_enumerate(unsigned int,void *,unsigned int,unsigned long,int (*)(unsigned int,unsigned long,unsigned long,void **),void (*)(unsigned int,void *,unsigned int,vm_range_t *,unsigned int))::{lambda(caulk::alloc::region_usage,unsigned long,unsigned long)#1},std::allocator<caulk::alloc::darwin_resource<caulk::alloc::dsw_allocator2<true>,caulk::alloc::rt_safe_memory_resource>::zone_enumerate(unsigned int,void *,unsigned int,unsigned long,int (*)(unsigned int,unsigned long,unsigned long,void **),void (*)(unsigned int,void *,unsigned int,vm_range_t *,unsigned int))::{lambda(caulk::alloc::region_usage,unsigned long,unsigned long)#1}>,void ()(caulk::alloc::region_usage,unsigned long,unsigned long)>::target_type()
{
}

uint64_t std::__function::__func<caulk::alloc::darwin_resource<caulk::alloc::dsw_allocator2<true>,caulk::alloc::rt_safe_memory_resource>::zone_enumerate(unsigned int,void *,unsigned int,unsigned long,int (*)(unsigned int,unsigned long,unsigned long,void **),void (*)(unsigned int,void *,unsigned int,vm_range_t *,unsigned int))::{lambda(caulk::alloc::region_usage,unsigned long,unsigned long)#1},std::allocator<caulk::alloc::darwin_resource<caulk::alloc::dsw_allocator2<true>,caulk::alloc::rt_safe_memory_resource>::zone_enumerate(unsigned int,void *,unsigned int,unsigned long,int (*)(unsigned int,unsigned long,unsigned long,void **),void (*)(unsigned int,void *,unsigned int,vm_range_t *,unsigned int))::{lambda(caulk::alloc::region_usage,unsigned long,unsigned long)#1}>,void ()(caulk::alloc::region_usage,unsigned long,unsigned long)>::target(uint64_t a1, uint64_t a2)
{
  if (std::type_info::operator==[abi:ne180100](*(void *)(a2 + 8), (uint64_t)"ZN5caulk5alloc15darwin_resourceINS0_14dsw_allocator2ILb1EEENS0_23rt_safe_memory_resourceEE14zone_enumerateEjPvjmPFijmmPS6_EPFvjS6_jP10vm_range_tjEEUlNS0_12region_usageEmmE_"))
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

uint64_t std::__function::__func<caulk::alloc::darwin_resource<caulk::alloc::dsw_allocator2<true>,caulk::alloc::rt_safe_memory_resource>::zone_enumerate(unsigned int,void *,unsigned int,unsigned long,int (*)(unsigned int,unsigned long,unsigned long,void **),void (*)(unsigned int,void *,unsigned int,vm_range_t *,unsigned int))::{lambda(caulk::alloc::region_usage,unsigned long,unsigned long)#1},std::allocator<caulk::alloc::darwin_resource<caulk::alloc::dsw_allocator2<true>,caulk::alloc::rt_safe_memory_resource>::zone_enumerate(unsigned int,void *,unsigned int,unsigned long,int (*)(unsigned int,unsigned long,unsigned long,void **),void (*)(unsigned int,void *,unsigned int,vm_range_t *,unsigned int))::{lambda(caulk::alloc::region_usage,unsigned long,unsigned long)#1}>,void ()(caulk::alloc::region_usage,unsigned long,unsigned long)>::operator()(uint64_t a1, unsigned int *a2, void *a3, uint64_t *a4)
{
  uint64_t v4 = *a2;
  uint64_t v5 = *a4;
  v7[0] = *a3;
  v7[1] = v5;
  return (*(uint64_t (**)(void, void, uint64_t, void *, uint64_t))(a1 + 8))(*(unsigned int *)(a1 + 16), *(void *)(a1 + 24), v4, v7, 1);
}

__n128 std::__function::__func<caulk::alloc::darwin_resource<caulk::alloc::dsw_allocator2<true>,caulk::alloc::rt_safe_memory_resource>::zone_enumerate(unsigned int,void *,unsigned int,unsigned long,int (*)(unsigned int,unsigned long,unsigned long,void **),void (*)(unsigned int,void *,unsigned int,vm_range_t *,unsigned int))::{lambda(caulk::alloc::region_usage,unsigned long,unsigned long)#1},std::allocator<caulk::alloc::darwin_resource<caulk::alloc::dsw_allocator2<true>,caulk::alloc::rt_safe_memory_resource>::zone_enumerate(unsigned int,void *,unsigned int,unsigned long,int (*)(unsigned int,unsigned long,unsigned long,void **),void (*)(unsigned int,void *,unsigned int,vm_range_t *,unsigned int))::{lambda(caulk::alloc::region_usage,unsigned long,unsigned long)#1}>,void ()(caulk::alloc::region_usage,unsigned long,unsigned long)>::__clone(uint64_t a1, uint64_t a2)
{
  *(void *)a2 = &unk_26C2AA668;
  __n128 result = *(__n128 *)(a1 + 8);
  *(void *)(a2 + 24) = *(void *)(a1 + 24);
  *(__n128 *)(a2 + 8) = result;
  return result;
}

__n128 std::__function::__func<caulk::alloc::darwin_resource<caulk::alloc::dsw_allocator2<true>,caulk::alloc::rt_safe_memory_resource>::zone_enumerate(unsigned int,void *,unsigned int,unsigned long,int (*)(unsigned int,unsigned long,unsigned long,void **),void (*)(unsigned int,void *,unsigned int,vm_range_t *,unsigned int))::{lambda(caulk::alloc::region_usage,unsigned long,unsigned long)#1},std::allocator<caulk::alloc::darwin_resource<caulk::alloc::dsw_allocator2<true>,caulk::alloc::rt_safe_memory_resource>::zone_enumerate(unsigned int,void *,unsigned int,unsigned long,int (*)(unsigned int,unsigned long,unsigned long,void **),void (*)(unsigned int,void *,unsigned int,vm_range_t *,unsigned int))::{lambda(caulk::alloc::region_usage,unsigned long,unsigned long)#1}>,void ()(caulk::alloc::region_usage,unsigned long,unsigned long)>::__clone(uint64_t a1)
{
  uint64_t v2 = (char *)operator new(0x20uLL);
  *(void *)uint64_t v2 = &unk_26C2AA668;
  __n128 result = *(__n128 *)(a1 + 8);
  *(__n128 *)(v2 + 8) = result;
  *((void *)v2 + 3) = *(void *)(a1 + 24);
  return result;
}

void std::__function::__func<caulk::alloc::darwin_resource<caulk::alloc::dsw_allocator2<true>,caulk::alloc::rt_safe_memory_resource>::zone_enumerate(unsigned int,void *,unsigned int,unsigned long,int (*)(unsigned int,unsigned long,unsigned long,void **),void (*)(unsigned int,void *,unsigned int,vm_range_t *,unsigned int))::{lambda(caulk::alloc::region_usage,unsigned long,unsigned long)#1},std::allocator<caulk::alloc::darwin_resource<caulk::alloc::dsw_allocator2<true>,caulk::alloc::rt_safe_memory_resource>::zone_enumerate(unsigned int,void *,unsigned int,unsigned long,int (*)(unsigned int,unsigned long,unsigned long,void **),void (*)(unsigned int,void *,unsigned int,vm_range_t *,unsigned int))::{lambda(caulk::alloc::region_usage,unsigned long,unsigned long)#1}>,void ()(caulk::alloc::region_usage,unsigned long,unsigned long)>::~__func()
{
}

void *std::__function::__func<caulk::alloc::darwin_resource<caulk::alloc::dsw_allocator2<true>,caulk::alloc::rt_safe_memory_resource>::zone_enumerate(unsigned int,void *,unsigned int,unsigned long,int (*)(unsigned int,unsigned long,unsigned long,void **),void (*)(unsigned int,void *,unsigned int,vm_range_t *,unsigned int))::{lambda(unsigned long,unsigned long)#1},std::allocator<caulk::alloc::darwin_resource<caulk::alloc::dsw_allocator2<true>,caulk::alloc::rt_safe_memory_resource>::zone_enumerate(unsigned int,void *,unsigned int,unsigned long,int (*)(unsigned int,unsigned long,unsigned long,void **),void (*)(unsigned int,void *,unsigned int,vm_range_t *,unsigned int))::{lambda(unsigned long,unsigned long)#1}>,void * ()(unsigned long,unsigned long)>::target_type()
{
}

uint64_t std::__function::__func<caulk::alloc::darwin_resource<caulk::alloc::dsw_allocator2<true>,caulk::alloc::rt_safe_memory_resource>::zone_enumerate(unsigned int,void *,unsigned int,unsigned long,int (*)(unsigned int,unsigned long,unsigned long,void **),void (*)(unsigned int,void *,unsigned int,vm_range_t *,unsigned int))::{lambda(unsigned long,unsigned long)#1},std::allocator<caulk::alloc::darwin_resource<caulk::alloc::dsw_allocator2<true>,caulk::alloc::rt_safe_memory_resource>::zone_enumerate(unsigned int,void *,unsigned int,unsigned long,int (*)(unsigned int,unsigned long,unsigned long,void **),void (*)(unsigned int,void *,unsigned int,vm_range_t *,unsigned int))::{lambda(unsigned long,unsigned long)#1}>,void * ()(unsigned long,unsigned long)>::target(uint64_t a1, uint64_t a2)
{
  if (std::type_info::operator==[abi:ne180100](*(void *)(a2 + 8), (uint64_t)"ZN5caulk5alloc15darwin_resourceINS0_14dsw_allocator2ILb1EEENS0_23rt_safe_memory_resourceEE14zone_enumerateEjPvjmPFijmmPS6_EPFvjS6_jP10vm_range_tjEEUlmmE_"))
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

uint64_t std::__function::__func<caulk::alloc::darwin_resource<caulk::alloc::dsw_allocator2<true>,caulk::alloc::rt_safe_memory_resource>::zone_enumerate(unsigned int,void *,unsigned int,unsigned long,int (*)(unsigned int,unsigned long,unsigned long,void **),void (*)(unsigned int,void *,unsigned int,vm_range_t *,unsigned int))::{lambda(unsigned long,unsigned long)#1},std::allocator<caulk::alloc::darwin_resource<caulk::alloc::dsw_allocator2<true>,caulk::alloc::rt_safe_memory_resource>::zone_enumerate(unsigned int,void *,unsigned int,unsigned long,int (*)(unsigned int,unsigned long,unsigned long,void **),void (*)(unsigned int,void *,unsigned int,vm_range_t *,unsigned int))::{lambda(unsigned long,unsigned long)#1}>,void * ()(unsigned long,unsigned long)>::operator()(uint64_t a1, uint64_t *a2, uint64_t *a3)
{
  uint64_t v3 = *a2;
  uint64_t v4 = *a3;
  uint64_t v7 = 0;
  uint64_t v5 = (const char *)(*(uint64_t (**)(void, uint64_t, uint64_t, uint64_t *))(a1 + 8))(*(unsigned int *)(a1 + 16), v3, v4, &v7);
  caulk::mach::throw_if_mach_error((uint64_t)"reader failed", v5);
  return v7;
}

void caulk::mach::error_category::message(caulk::mach::error_category *this@<X0>, mach_error_t a2@<W1>, std::string *a3@<X8>)
{
  uint64_t v5 = (char *)(*(uint64_t (**)(caulk::mach::error_category *))(*(void *)this + 16))(this);
  std::string::basic_string[abi:ne180100]<0>(&v11, v5);
  uint64_t v6 = std::string::append(&v11, ": ", 2uLL);
  long long v7 = *(_OWORD *)&v6->__r_.__value_.__l.__data_;
  v12.__r_.__value_.__r.__words[2] = v6->__r_.__value_.__r.__words[2];
  *(_OWORD *)&v12.__r_.__value_.__l.__data_ = v7;
  v6->__r_.__value_.__l.__size_ = 0;
  v6->__r_.__value_.__r.__words[2] = 0;
  v6->__r_.__value_.__r.__words[0] = 0;
  uint64_t v8 = mach_error_string(a2);
  size_t v9 = strlen(v8);
  unsigned int v10 = std::string::append(&v12, v8, v9);
  *a3 = *v10;
  v10->__r_.__value_.__l.__size_ = 0;
  v10->__r_.__value_.__r.__words[2] = 0;
  v10->__r_.__value_.__r.__words[0] = 0;
  if (SHIBYTE(v12.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v12.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(v11.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v11.__r_.__value_.__l.__data_);
  }
}

void sub_210870580(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *a16, uint64_t a17, int a18, __int16 a19, char a20,char a21)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

const char *caulk::mach::error_category::name(caulk::mach::error_category *this)
{
  return "Mach";
}

void caulk::mach::error_category::~error_category(std::error_category *this)
{
  std::error_category::~error_category(this);

  JUMPOUT(0x216674B00);
}

__n128 std::__function::__func<caulk::alloc::darwin_resource<caulk::alloc::dsw_allocator2<true>,caulk::alloc::rt_safe_memory_resource>::zone_enumerate(unsigned int,void *,unsigned int,unsigned long,int (*)(unsigned int,unsigned long,unsigned long,void **),void (*)(unsigned int,void *,unsigned int,vm_range_t *,unsigned int))::{lambda(unsigned long,unsigned long)#1},std::allocator<caulk::alloc::darwin_resource<caulk::alloc::dsw_allocator2<true>,caulk::alloc::rt_safe_memory_resource>::zone_enumerate(unsigned int,void *,unsigned int,unsigned long,int (*)(unsigned int,unsigned long,unsigned long,void **),void (*)(unsigned int,void *,unsigned int,vm_range_t *,unsigned int))::{lambda(unsigned long,unsigned long)#1}>,void * ()(unsigned long,unsigned long)>::__clone(uint64_t a1, uint64_t a2)
{
  *(void *)a2 = &unk_26C2AA6C0;
  __n128 result = *(__n128 *)(a1 + 8);
  *(__n128 *)(a2 + 8) = result;
  return result;
}

__n128 std::__function::__func<caulk::alloc::darwin_resource<caulk::alloc::dsw_allocator2<true>,caulk::alloc::rt_safe_memory_resource>::zone_enumerate(unsigned int,void *,unsigned int,unsigned long,int (*)(unsigned int,unsigned long,unsigned long,void **),void (*)(unsigned int,void *,unsigned int,vm_range_t *,unsigned int))::{lambda(unsigned long,unsigned long)#1},std::allocator<caulk::alloc::darwin_resource<caulk::alloc::dsw_allocator2<true>,caulk::alloc::rt_safe_memory_resource>::zone_enumerate(unsigned int,void *,unsigned int,unsigned long,int (*)(unsigned int,unsigned long,unsigned long,void **),void (*)(unsigned int,void *,unsigned int,vm_range_t *,unsigned int))::{lambda(unsigned long,unsigned long)#1}>,void * ()(unsigned long,unsigned long)>::__clone(uint64_t a1)
{
  uint64_t v2 = (char *)operator new(0x18uLL);
  *(void *)uint64_t v2 = &unk_26C2AA6C0;
  __n128 result = *(__n128 *)(a1 + 8);
  *(__n128 *)(v2 + 8) = result;
  return result;
}

void std::__function::__func<caulk::alloc::darwin_resource<caulk::alloc::dsw_allocator2<true>,caulk::alloc::rt_safe_memory_resource>::zone_enumerate(unsigned int,void *,unsigned int,unsigned long,int (*)(unsigned int,unsigned long,unsigned long,void **),void (*)(unsigned int,void *,unsigned int,vm_range_t *,unsigned int))::{lambda(unsigned long,unsigned long)#1},std::allocator<caulk::alloc::darwin_resource<caulk::alloc::dsw_allocator2<true>,caulk::alloc::rt_safe_memory_resource>::zone_enumerate(unsigned int,void *,unsigned int,unsigned long,int (*)(unsigned int,unsigned long,unsigned long,void **),void (*)(unsigned int,void *,unsigned int,vm_range_t *,unsigned int))::{lambda(unsigned long,unsigned long)#1}>,void * ()(unsigned long,unsigned long)>::~__func()
{
}

uint64_t caulk::alloc::darwin_resource<caulk::alloc::dsw_allocator2<true>,caulk::alloc::rt_safe_memory_resource>::zone_pressure_relief(uint64_t a1)
{
  return (*(uint64_t (**)(void))(**(void **)(a1 - 8) + 72))();
}

unint64_t caulk::alloc::bitmap_allocator<caulk::alloc::embed_block_memory,16368ul,256ul,6ul>::size(uint64_t a1, unint64_t a2)
{
  if (a1 + 240 > a2) {
    return 0;
  }
  unint64_t v4 = a2 - (a1 + 240);
  if ((v4 >> 8) > 0x3EuLL) {
    return 0;
  }
  void v6[2] = v2;
  v6[3] = v3;
  v6[0] = a1 + 8;
  v6[1] = 2;
  return (unint64_t)caulk::alloc::detail::state_bit_span::allocatedSlotsAtIndex(v6, v4 >> 8) << 8;
}

void *caulk::alloc::detail::state_bit_span::allocatedSlotsAtIndex(void *this, unsigned int a2)
{
  unint64_t v2 = a2 >> 5;
  if (this[1] <= v2)
  {
    __break(1u);
    return this;
  }
  uint64_t v3 = (unint64_t *)(*this + 8 * v2);
  unint64_t v4 = atomic_load(v3);
  int v5 = a2 & 0x1F;
  if ((((1 << (a2 & 0x1F | 0x20)) | (1 << (a2 & 0x1F))) & ~v4) != 0) {
    return 0;
  }
  int v6 = 0;
  long long v7 = v3 + 1;
  int v8 = 1;
  while (1)
  {
    unsigned int v9 = v8 + v5;
    if (v9 > 0x1F) {
      goto LABEL_7;
    }
    unsigned int v10 = ~v4 >> v9;
    unint64_t v11 = HIDWORD(v4);
    if (v10) {
      break;
    }
    unsigned int v12 = v11 >> v9;
    if (v12)
    {
      int v13 = __clz(__rbit32(v12)) + v9;
      return (void *)(v6 - v5 + v13);
    }
LABEL_7:
    if (v7 == (unint64_t *)(*this + 8 * this[1]))
    {
      int v13 = 32;
      return (void *)(v6 - v5 + v13);
    }
    int v8 = 0;
    unint64_t v4 = atomic_load(v7);
    int v6 = v6 - v5 + 32;
    ++v7;
    int v5 = 0;
  }
  unsigned int v14 = __clz(__rbit32(v10)) + v9;
  unsigned int v15 = v11 >> v9;
  unsigned int v16 = __clz(__rbit32(v15)) + v9;
  if (v16 >= v14) {
    unsigned int v16 = v14;
  }
  if (v15) {
    int v13 = v16;
  }
  else {
    int v13 = v14;
  }
  return (void *)(v6 - v5 + v13);
}

uint64_t caulk::alloc::bitmap_allocator<caulk::alloc::embed_block_memory,16368ul,16ul,6ul>::size(uint64_t a1, unint64_t a2)
{
  if (a1 + 272 > a2) {
    return 0;
  }
  unint64_t v4 = a2 - (a1 + 272);
  if (((v4 >> 5) & 0x7FFFFFFF) > 0x1F6) {
    return 0;
  }
  void v6[2] = v2;
  v6[3] = v3;
  v6[0] = a1 + 8;
  v6[1] = 32;
  return 16 * caulk::alloc::detail::state_bit_span::allocatedSlotsAtIndex(v6, v4 >> 4);
}

uint64_t caulk::alloc::darwin_resource<caulk::alloc::dsw_allocator2<true>,caulk::alloc::rt_safe_memory_resource>::malloc_zone(uint64_t a1)
{
  return *(void *)(a1 + 1584) + 8;
}

void caulk::alloc::resource<caulk::alloc::dsw_allocator2<true>,caulk::alloc::rt_safe_memory_resource>::reserve(void *a1@<X8>)
{
  *a1 = 0;
  a1[1] = 0;
}

unint64_t caulk::alloc::resource<caulk::alloc::dsw_allocator2<true>,caulk::alloc::rt_safe_memory_resource>::compact(uint64_t a1, unint64_t a2)
{
  uint64_t v4 = a1 + 1440;
  caulk::concurrent::details::node_allocator<void *,caulk::alloc::detail::tracked_block,10ul,(caulk::concurrent::skiplist_options)0>::begin_traversal();
  unint64_t v5 = atomic_load((unint64_t *)(a1 + 1312));
  unint64_t v6 = v5 & 0xFFFFFFFFFFFFFFFCLL;
  if (a1 + 1392 == (v5 & 0xFFFFFFFFFFFFFFFCLL))
  {
    unint64_t v7 = 0;
  }
  else
  {
    unint64_t v7 = 0;
    do
    {
      if (*(unsigned char *)(v6 + 18) != 2)
      {
        char v8 = atomic_load((unint64_t *)(v6 + 32));
        if ((v8 & 1) == 0)
        {
          uint64_t v9 = *(void *)(v6 + 8);
          if ((atomic_exchange((atomic_uchar *volatile)v9, 1u) & 1) == 0)
          {
            unsigned int v10 = atomic_load((unsigned int *)(v9 + 16));
            if (v10 == 1006)
            {
              v7 += *(void *)(v9 + 8);
              caulk::concurrent::skiplist<unsigned long,caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,16ul,6ul>::node_impl<caulk::alloc::tree_allocator<caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,16ul,6ul>>::node_header,caulk::alloc::embed_block_memory> *,5,(caulk::concurrent::skiplist_options)1>::remove(a1 + 1280, *(void *)v6);
              caulk::concurrent::skiplist<unsigned long,caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,16ul,6ul>::node_impl<caulk::alloc::tree_allocator<caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,16ul,6ul>>::node_header,caulk::alloc::embed_block_memory> *,5,(caulk::concurrent::skiplist_options)1>::remove(a1 + 992, *(void *)v6);
              if (a2 - 1 < v7) {
                break;
              }
            }
            else
            {
              atomic_store(0, (unsigned __int8 *)v9);
            }
          }
        }
      }
      unint64_t v5 = atomic_load((unint64_t *)(v6 + 32));
      unint64_t v6 = v5 & 0xFFFFFFFFFFFFFFFCLL;
    }
    while (a1 + 1392 != (v5 & 0xFFFFFFFFFFFFFFFCLL));
  }
  caulk::concurrent::details::node_allocator<unsigned long,caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,256ul,6ul>::node_impl<caulk::alloc::tree_allocator<caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,256ul,6ul>>::node_header,caulk::alloc::embed_block_memory> *,5ul,(caulk::concurrent::skiplist_options)1>::end_traversal(v4, v5);
  caulk::concurrent::details::node_allocator<unsigned long,caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,256ul,6ul>::node_impl<caulk::alloc::tree_allocator<caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,256ul,6ul>>::node_header,caulk::alloc::embed_block_memory> *,5ul,(caulk::concurrent::skiplist_options)1>::perform_deferred_deletions<true,(BOOL *)0>(a1 + 1152);
  if (a2 - 1 >= v7)
  {
    if (a2 >= v7) {
      unint64_t v11 = a2 - v7;
    }
    else {
      unint64_t v11 = 0;
    }
    caulk::concurrent::details::node_allocator<void *,caulk::alloc::detail::tracked_block,10ul,(caulk::concurrent::skiplist_options)0>::begin_traversal();
    unint64_t v12 = atomic_load((unint64_t *)(a1 + 704));
    unint64_t v13 = v12 & 0xFFFFFFFFFFFFFFFCLL;
    if (a1 + 784 == (v12 & 0xFFFFFFFFFFFFFFFCLL))
    {
      unint64_t v14 = 0;
    }
    else
    {
      unint64_t v14 = 0;
      do
      {
        if (*(unsigned char *)(v13 + 18) != 2)
        {
          char v15 = atomic_load((unint64_t *)(v13 + 32));
          if ((v15 & 1) == 0)
          {
            uint64_t v16 = *(void *)(v13 + 8);
            if ((atomic_exchange((atomic_uchar *volatile)v16, 1u) & 1) == 0)
            {
              unsigned int v17 = atomic_load((unsigned int *)(v16 + 16));
              if (v17 == 63)
              {
                v14 += *(void *)(v16 + 8);
                caulk::concurrent::skiplist<unsigned long,caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,256ul,6ul>::node_impl<caulk::alloc::tree_allocator<caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,256ul,6ul>>::node_header,caulk::alloc::embed_block_memory> *,5,(caulk::concurrent::skiplist_options)1>::remove(a1 + 672, *(void *)v13);
                caulk::concurrent::skiplist<unsigned long,caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,256ul,6ul>::node_impl<caulk::alloc::tree_allocator<caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,256ul,6ul>>::node_header,caulk::alloc::embed_block_memory> *,5,(caulk::concurrent::skiplist_options)1>::remove(a1 + 384, *(void *)v13);
                if (v11 - 1 < v14) {
                  break;
                }
              }
              else
              {
                atomic_store(0, (unsigned __int8 *)v16);
              }
            }
          }
        }
        unint64_t v12 = atomic_load((unint64_t *)(v13 + 32));
        unint64_t v13 = v12 & 0xFFFFFFFFFFFFFFFCLL;
      }
      while (a1 + 784 != (v12 & 0xFFFFFFFFFFFFFFFCLL));
    }
    caulk::concurrent::details::node_allocator<unsigned long,caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,256ul,6ul>::node_impl<caulk::alloc::tree_allocator<caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,256ul,6ul>>::node_header,caulk::alloc::embed_block_memory> *,5ul,(caulk::concurrent::skiplist_options)1>::end_traversal(a1 + 832, v12);
    caulk::concurrent::details::node_allocator<unsigned long,caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,256ul,6ul>::node_impl<caulk::alloc::tree_allocator<caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,256ul,6ul>>::node_header,caulk::alloc::embed_block_memory> *,5ul,(caulk::concurrent::skiplist_options)1>::perform_deferred_deletions<true,(BOOL *)0>(a1 + 544);
    if (v11 - 1 >= v14)
    {
      if (v11 >= v14) {
        uint64_t v18 = v11 - v14;
      }
      else {
        uint64_t v18 = 0;
      }
      v14 += caulk::alloc::details::caching_page_allocator_base::compact(*(caulk::alloc::details::caching_page_allocator_base **)(a1 + 16), v18);
    }
    v7 += v14;
  }
  return v7;
}

void *caulk::alloc::resource<caulk::alloc::dsw_allocator2<true>,caulk::alloc::rt_safe_memory_resource>::enumerate(uint64_t a1, int a2, uint64_t a3)
{
  return caulk::alloc::allocator_enumerate<caulk::alloc::resource<caulk::alloc::dsw_allocator2<true>,caulk::alloc::rt_safe_memory_resource>>(a1, a2, a3);
}

void *caulk::alloc::allocator_enumerate<caulk::alloc::resource<caulk::alloc::dsw_allocator2<true>,caulk::alloc::rt_safe_memory_resource>>(uint64_t a1, int a2, uint64_t a3)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  v6[0] = &unk_26C2AAC40;
  v6[1] = a3;
  v6[3] = v6;
  int v7 = a2;
  v8[0] = &unk_26C2AB948;
  v8[1] = caulk::alloc::introspector::local_reader;
  uint64_t v9 = v8;
  std::__function::__value_func<void ()(caulk::alloc::region_usage,unsigned long,unsigned long)>::__value_func[abi:ne180100]((uint64_t)v10, (uint64_t)v6);
  char v11 = 1;
  std::__function::__value_func<void ()(caulk::alloc::region_usage,unsigned long,unsigned long)>::~__value_func[abi:ne180100](v6);
  uint64_t v4 = std::function<void * ()(unsigned long,unsigned long)>::operator()((uint64_t)v9, a1, 1584);
  caulk::alloc::tiered_allocator<caulk::alloc::size_range_tier<0ul,1008ul,caulk::alloc::tree_allocator<caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,16ul,6ul>>>,caulk::alloc::size_range_tier<1009ul,16128ul,caulk::alloc::tree_allocator<caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,256ul,6ul>>>,caulk::alloc::tracking_allocator<caulk::alloc::global_page_cache>>::introspect(v4 + 16, a1, (uint64_t)&v7);
  std::__function::__value_func<void ()(caulk::alloc::region_usage,unsigned long,unsigned long)>::~__value_func[abi:ne180100](v10);
  return std::__function::__value_func<void * ()(unsigned long,unsigned long)>::~__value_func[abi:ne180100](v8);
}

void sub_210870BD0(_Unwind_Exception *a1)
{
  std::__function::__value_func<void ()(caulk::alloc::region_usage,unsigned long,unsigned long)>::~__value_func[abi:ne180100](v2);
  std::__function::__value_func<void * ()(unsigned long,unsigned long)>::~__value_func[abi:ne180100](v1);
  _Unwind_Resume(a1);
}

void *std::__function::__func<void caulk::alloc::allocator_enumerate<caulk::alloc::resource<caulk::alloc::dsw_allocator2<true>,caulk::alloc::rt_safe_memory_resource>>(caulk::alloc::resource<caulk::alloc::dsw_allocator2<true>,caulk::alloc::rt_safe_memory_resource> &,caulk::option_set<caulk::alloc::region_usage,unsigned int>,std::function<void ()(caulk::alloc::region_usage,caulk::alloc::block)> const&)::{lambda(caulk::alloc::region_usage,unsigned long,unsigned long)#1},std::allocator<void caulk::alloc::allocator_enumerate<caulk::alloc::resource<caulk::alloc::dsw_allocator2<true>,caulk::alloc::rt_safe_memory_resource>>(caulk::alloc::resource<caulk::alloc::dsw_allocator2<true>,caulk::alloc::rt_safe_memory_resource> &,caulk::option_set<caulk::alloc::region_usage,unsigned int>,std::function<void ()(caulk::alloc::region_usage,caulk::alloc::block)> const&)::{lambda(caulk::alloc::region_usage,unsigned long,unsigned long)#1}>,void ()(caulk::alloc::region_usage,unsigned long,unsigned long)>::target_type()
{
}

uint64_t std::__function::__func<void caulk::alloc::allocator_enumerate<caulk::alloc::resource<caulk::alloc::dsw_allocator2<true>,caulk::alloc::rt_safe_memory_resource>>(caulk::alloc::resource<caulk::alloc::dsw_allocator2<true>,caulk::alloc::rt_safe_memory_resource> &,caulk::option_set<caulk::alloc::region_usage,unsigned int>,std::function<void ()(caulk::alloc::region_usage,caulk::alloc::block)> const&)::{lambda(caulk::alloc::region_usage,unsigned long,unsigned long)#1},std::allocator<void caulk::alloc::allocator_enumerate<caulk::alloc::resource<caulk::alloc::dsw_allocator2<true>,caulk::alloc::rt_safe_memory_resource>>(caulk::alloc::resource<caulk::alloc::dsw_allocator2<true>,caulk::alloc::rt_safe_memory_resource> &,caulk::option_set<caulk::alloc::region_usage,unsigned int>,std::function<void ()(caulk::alloc::region_usage,caulk::alloc::block)> const&)::{lambda(caulk::alloc::region_usage,unsigned long,unsigned long)#1}>,void ()(caulk::alloc::region_usage,unsigned long,unsigned long)>::target(uint64_t a1, uint64_t a2)
{
  if (std::type_info::operator==[abi:ne180100](*(void *)(a2 + 8), (uint64_t)"ZN5caulk5alloc19allocator_enumerateINS0_8resourceINS0_14dsw_allocator2ILb1EEENS0_23rt_safe_memory_resourceEEEEEvRT_NS_10option_setINS0_12region_usageEjEERKNSt3__18functionIFvSA_NS0_5blockEEEEEUlSA_mmE_"))
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

uint64_t std::__function::__func<void caulk::alloc::allocator_enumerate<caulk::alloc::resource<caulk::alloc::dsw_allocator2<true>,caulk::alloc::rt_safe_memory_resource>>(caulk::alloc::resource<caulk::alloc::dsw_allocator2<true>,caulk::alloc::rt_safe_memory_resource> &,caulk::option_set<caulk::alloc::region_usage,unsigned int>,std::function<void ()(caulk::alloc::region_usage,caulk::alloc::block)> const&)::{lambda(caulk::alloc::region_usage,unsigned long,unsigned long)#1},std::allocator<void caulk::alloc::allocator_enumerate<caulk::alloc::resource<caulk::alloc::dsw_allocator2<true>,caulk::alloc::rt_safe_memory_resource>>(caulk::alloc::resource<caulk::alloc::dsw_allocator2<true>,caulk::alloc::rt_safe_memory_resource> &,caulk::option_set<caulk::alloc::region_usage,unsigned int>,std::function<void ()(caulk::alloc::region_usage,caulk::alloc::block)> const&)::{lambda(caulk::alloc::region_usage,unsigned long,unsigned long)#1}>,void ()(caulk::alloc::region_usage,unsigned long,unsigned long)>::operator()(uint64_t a1, int *a2, uint64_t *a3, uint64_t *a4)
{
  return std::function<void ()(caulk::alloc::region_usage,caulk::alloc::block)>::operator()(*(void *)(*(void *)(a1 + 8) + 24), *a2, *a3, *a4);
}

uint64_t std::__function::__func<void caulk::alloc::allocator_enumerate<caulk::alloc::resource<caulk::alloc::dsw_allocator2<true>,caulk::alloc::rt_safe_memory_resource>>(caulk::alloc::resource<caulk::alloc::dsw_allocator2<true>,caulk::alloc::rt_safe_memory_resource> &,caulk::option_set<caulk::alloc::region_usage,unsigned int>,std::function<void ()(caulk::alloc::region_usage,caulk::alloc::block)> const&)::{lambda(caulk::alloc::region_usage,unsigned long,unsigned long)#1},std::allocator<void caulk::alloc::allocator_enumerate<caulk::alloc::resource<caulk::alloc::dsw_allocator2<true>,caulk::alloc::rt_safe_memory_resource>>(caulk::alloc::resource<caulk::alloc::dsw_allocator2<true>,caulk::alloc::rt_safe_memory_resource> &,caulk::option_set<caulk::alloc::region_usage,unsigned int>,std::function<void ()(caulk::alloc::region_usage,caulk::alloc::block)> const&)::{lambda(caulk::alloc::region_usage,unsigned long,unsigned long)#1}>,void ()(caulk::alloc::region_usage,unsigned long,unsigned long)>::__clone(uint64_t result, void *a2)
{
  uint64_t v2 = *(void *)(result + 8);
  *a2 = &unk_26C2AAC40;
  a2[1] = v2;
  return result;
}

void *std::__function::__func<void caulk::alloc::allocator_enumerate<caulk::alloc::resource<caulk::alloc::dsw_allocator2<true>,caulk::alloc::rt_safe_memory_resource>>(caulk::alloc::resource<caulk::alloc::dsw_allocator2<true>,caulk::alloc::rt_safe_memory_resource> &,caulk::option_set<caulk::alloc::region_usage,unsigned int>,std::function<void ()(caulk::alloc::region_usage,caulk::alloc::block)> const&)::{lambda(caulk::alloc::region_usage,unsigned long,unsigned long)#1},std::allocator<void caulk::alloc::allocator_enumerate<caulk::alloc::resource<caulk::alloc::dsw_allocator2<true>,caulk::alloc::rt_safe_memory_resource>>(caulk::alloc::resource<caulk::alloc::dsw_allocator2<true>,caulk::alloc::rt_safe_memory_resource> &,caulk::option_set<caulk::alloc::region_usage,unsigned int>,std::function<void ()(caulk::alloc::region_usage,caulk::alloc::block)> const&)::{lambda(caulk::alloc::region_usage,unsigned long,unsigned long)#1}>,void ()(caulk::alloc::region_usage,unsigned long,unsigned long)>::__clone(uint64_t a1)
{
  __n128 result = operator new(0x10uLL);
  uint64_t v3 = *(void *)(a1 + 8);
  *__n128 result = &unk_26C2AAC40;
  result[1] = v3;
  return result;
}

void std::__function::__func<void caulk::alloc::allocator_enumerate<caulk::alloc::resource<caulk::alloc::dsw_allocator2<true>,caulk::alloc::rt_safe_memory_resource>>(caulk::alloc::resource<caulk::alloc::dsw_allocator2<true>,caulk::alloc::rt_safe_memory_resource> &,caulk::option_set<caulk::alloc::region_usage,unsigned int>,std::function<void ()(caulk::alloc::region_usage,caulk::alloc::block)> const&)::{lambda(caulk::alloc::region_usage,unsigned long,unsigned long)#1},std::allocator<void caulk::alloc::allocator_enumerate<caulk::alloc::resource<caulk::alloc::dsw_allocator2<true>,caulk::alloc::rt_safe_memory_resource>>(caulk::alloc::resource<caulk::alloc::dsw_allocator2<true>,caulk::alloc::rt_safe_memory_resource> &,caulk::option_set<caulk::alloc::region_usage,unsigned int>,std::function<void ()(caulk::alloc::region_usage,caulk::alloc::block)> const&)::{lambda(caulk::alloc::region_usage,unsigned long,unsigned long)#1}>,void ()(caulk::alloc::region_usage,unsigned long,unsigned long)>::~__func()
{
}

void caulk::alloc::resource<caulk::alloc::dsw_allocator2<true>,caulk::alloc::rt_safe_memory_resource>::print(uint64_t a1, void *a2, int a3)
{
  uint64_t v68 = *MEMORY[0x263EF8340];
  unint64_t v48 = a2;
  int v49 = 0;
  char v50 = 0;
  caulk::alloc::base_allocator::formatter::emit_string(&v48, "dsw_allocator2 @ ");
  caulk::alloc::base_allocator::formatter::check_line_start(&v48);
  char v44 = (caulk::alloc::details::caching_page_allocator_base **)(a1 + 16);
  std::ostream::operator<<();
  caulk::alloc::base_allocator::formatter::check_line_start(&v48);
  v63.__r_.__value_.__s.__data_[0] = 10;
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v48, (uint64_t)&v63, 1);
  v49 += 2;
  caulk::alloc::base_allocator::formatter::emit_string(&v48, "[tier ");
  caulk::alloc::base_allocator::formatter::emit_string(&v48, "sizes ");
  caulk::alloc::base_allocator::formatter::check_line_start(&v48);
  std::ostream::operator<<();
  caulk::alloc::base_allocator::formatter::emit_string(&v48, "-");
  caulk::alloc::base_allocator::formatter::check_line_start(&v48);
  std::ostream::operator<<();
  caulk::alloc::base_allocator::formatter::emit_string(&v48, "] ");
  caulk::alloc::base_allocator::formatter::emit_string(&v48, "tree_allocator @ ");
  caulk::alloc::base_allocator::formatter::check_line_start(&v48);
  std::ostream::operator<<();
  caulk::alloc::base_allocator::formatter::emit_string(&v48, "\n");
  caulk::concurrent::details::node_allocator<void *,caulk::alloc::detail::tracked_block,10ul,(caulk::concurrent::skiplist_options)0>::begin_traversal();
  unint64_t v4 = atomic_load((unint64_t *)(a1 + 1024));
  unint64_t v5 = v4 & 0xFFFFFFFFFFFFFFFCLL;
  if (a1 + 1104 == (v4 & 0xFFFFFFFFFFFFFFFCLL))
  {
    uint64_t v6 = 0;
  }
  else
  {
    uint64_t v6 = 0;
    uint64_t v7 = 0;
    do
    {
      if (*(unsigned char *)(v5 + 18) != 2)
      {
        char v8 = atomic_load((unint64_t *)(v5 + 32));
        if ((v8 & 1) == 0)
        {
          uint64_t v9 = *(void *)(v5 + 8);
          int v10 = atomic_load((unsigned int *)(v9 + 4));
          std::string::basic_string[abi:ne180100]<0>(&v61, "availability ");
          std::to_string(&v59, v10);
          if ((v59.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
            char v11 = &v59;
          }
          else {
            char v11 = (std::string *)v59.__r_.__value_.__r.__words[0];
          }
          if ((v59.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
            std::string::size_type size = HIBYTE(v59.__r_.__value_.__r.__words[2]);
          }
          else {
            std::string::size_type size = v59.__r_.__value_.__l.__size_;
          }
          unint64_t v13 = std::string::append(&v61, (const std::string::value_type *)v11, size);
          std::string v63 = *v13;
          v13->__r_.__value_.__l.__size_ = 0;
          v13->__r_.__value_.__r.__words[2] = 0;
          v13->__r_.__value_.__r.__words[0] = 0;
          if (SHIBYTE(v59.__r_.__value_.__r.__words[2]) < 0) {
            operator delete(v59.__r_.__value_.__l.__data_);
          }
          if (SHIBYTE(v61.__r_.__value_.__r.__words[2]) < 0) {
            operator delete(v61.__r_.__value_.__l.__data_);
          }
          caulk::alloc::base_allocator::formatter::print_allocator<caulk::alloc::bitmap_allocator<caulk::alloc::embed_block_memory,16368ul,16ul,6ul>>((caulk::alloc::base_allocator::formatter *)&v48, (uint64_t)&v63, v9 + 16);
          unsigned int v14 = atomic_load((unsigned int *)(v9 + 16));
          if (SHIBYTE(v63.__r_.__value_.__r.__words[2]) < 0) {
            operator delete(v63.__r_.__value_.__l.__data_);
          }
          ++v6;
          v7 += 16 * v14;
        }
      }
      unint64_t v4 = atomic_load((unint64_t *)(v5 + 32));
      unint64_t v5 = v4 & 0xFFFFFFFFFFFFFFFCLL;
    }
    while (a1 + 1104 != (v4 & 0xFFFFFFFFFFFFFFFCLL));
  }
  caulk::concurrent::details::node_allocator<unsigned long,caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,256ul,6ul>::node_impl<caulk::alloc::tree_allocator<caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,256ul,6ul>>::node_header,caulk::alloc::embed_block_memory> *,5ul,(caulk::concurrent::skiplist_options)1>::end_traversal(a1 + 1152, v4);
  v49 += 2;
  caulk::alloc::base_allocator::formatter::check_line_start(&v48);
  std::ostream::operator<<();
  caulk::alloc::base_allocator::formatter::emit_string(&v48, " nodes, total capacity ");
  caulk::alloc::base_allocator::formatter::check_line_start(&v48);
  std::ostream::operator<<();
  caulk::alloc::base_allocator::formatter::emit_string(&v48, ", free capacity ");
  caulk::alloc::base_allocator::formatter::check_line_start(&v48);
  std::ostream::operator<<();
  if (16096 * v6)
  {
    caulk::alloc::base_allocator::formatter::emit_string(&v48, " (");
    caulk::alloc::base_allocator::formatter::check_line_start(&v48);
    std::ostream::operator<<();
    caulk::alloc::base_allocator::formatter::emit_string(&v48, "%)");
  }
  caulk::alloc::base_allocator::formatter::emit_string(&v48, "\n");
  v49 -= 2;
  std::string::basic_string[abi:ne180100]<0>(&v63, "super");
  caulk::alloc::base_allocator::formatter::print_allocator<caulk::alloc::global_page_cache>((caulk::alloc::base_allocator::formatter *)&v48, (uint64_t)&v63, (caulk::alloc::details::caching_page_allocator_base **)(a1 + 984));
  if (SHIBYTE(v63.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v63.__r_.__value_.__l.__data_);
  }
  caulk::alloc::base_allocator::formatter::emit_string(&v48, "[tier ");
  caulk::alloc::base_allocator::formatter::emit_string(&v48, "sizes ");
  caulk::alloc::base_allocator::formatter::check_line_start(&v48);
  std::ostream::operator<<();
  caulk::alloc::base_allocator::formatter::emit_string(&v48, "-");
  caulk::alloc::base_allocator::formatter::check_line_start(&v48);
  std::ostream::operator<<();
  caulk::alloc::base_allocator::formatter::emit_string(&v48, "] ");
  caulk::alloc::base_allocator::formatter::emit_string(&v48, "tree_allocator @ ");
  caulk::alloc::base_allocator::formatter::check_line_start(&v48);
  std::ostream::operator<<();
  caulk::alloc::base_allocator::formatter::emit_string(&v48, "\n");
  caulk::concurrent::details::node_allocator<void *,caulk::alloc::detail::tracked_block,10ul,(caulk::concurrent::skiplist_options)0>::begin_traversal();
  unint64_t v15 = atomic_load((unint64_t *)(a1 + 416));
  uint64_t v43 = a1;
  unint64_t v16 = v15 & 0xFFFFFFFFFFFFFFFCLL;
  if (a1 + 496 != (v15 & 0xFFFFFFFFFFFFFFFCLL))
  {
    uint64_t v17 = 0;
    uint64_t v18 = 0;
    while (1)
    {
      if (*(unsigned char *)(v16 + 18) != 2)
      {
        char v19 = atomic_load((unint64_t *)(v16 + 32));
        if ((v19 & 1) == 0) {
          break;
        }
      }
LABEL_62:
      unint64_t v15 = atomic_load((unint64_t *)(v16 + 32));
      unint64_t v16 = v15 & 0xFFFFFFFFFFFFFFFCLL;
      if (a1 + 496 == (v15 & 0xFFFFFFFFFFFFFFFCLL)) {
        goto LABEL_65;
      }
    }
    uint64_t v20 = *(void *)(v16 + 8);
    int v21 = atomic_load((unsigned int *)(v20 + 4));
    std::string::basic_string[abi:ne180100]<0>(&v63, "availability ");
    std::to_string(&v61, v21);
    if ((v61.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      char v22 = &v61;
    }
    else {
      char v22 = (std::string *)v61.__r_.__value_.__r.__words[0];
    }
    if ((v61.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      std::string::size_type v23 = HIBYTE(v61.__r_.__value_.__r.__words[2]);
    }
    else {
      std::string::size_type v23 = v61.__r_.__value_.__l.__size_;
    }
    uint64_t v24 = std::string::append(&v63, (const std::string::value_type *)v22, v23);
    std::string::size_type v25 = v24->__r_.__value_.__l.__size_;
    __s = (std::string::value_type *)v24->__r_.__value_.__r.__words[0];
    LODWORD(v52) = v24->__r_.__value_.__r.__words[2];
    *(_DWORD *)((char *)&v52 + 3) = *(_DWORD *)((char *)&v24->__r_.__value_.__r.__words[2] + 3);
    int v47 = SHIBYTE(v24->__r_.__value_.__r.__words[2]);
    v24->__r_.__value_.__l.__size_ = 0;
    v24->__r_.__value_.__r.__words[2] = 0;
    v24->__r_.__value_.__r.__words[0] = 0;
    if (SHIBYTE(v61.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v61.__r_.__value_.__l.__data_);
    }
    if (SHIBYTE(v63.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v63.__r_.__value_.__l.__data_);
    }
    v49 += 2;
    if (v47 < 0)
    {
      if (v25)
      {
        std::string::__init_copy_ctor_external(&v51, __s, v25);
LABEL_44:
        caulk::alloc::base_allocator::formatter::operator<<<std::string>(&v48, (uint64_t)&v51);
        caulk::alloc::base_allocator::formatter::emit_string(&v48, ": ");
        if (SHIBYTE(v51.__r_.__value_.__r.__words[2]) < 0) {
          operator delete(v51.__r_.__value_.__l.__data_);
        }
      }
    }
    else if (v47)
    {
      v51.__r_.__value_.__r.__words[0] = (std::string::size_type)__s;
      v51.__r_.__value_.__l.__size_ = v25;
      LODWORD(v51.__r_.__value_.__r.__words[2]) = v52;
      *(_DWORD *)((char *)&v51.__r_.__value_.__r.__words[2] + 3) = *(_DWORD *)((char *)&v52 + 3);
      *((unsigned char *)&v51.__r_.__value_.__s + 23) = v47;
      goto LABEL_44;
    }
    caulk::alloc::base_allocator::formatter::emit_string(&v48, "bitmap_allocator @ ");
    caulk::alloc::base_allocator::formatter::check_line_start(&v48);
    std::ostream::operator<<();
    caulk::alloc::base_allocator::formatter::emit_string(&v48, ", block size ");
    caulk::alloc::base_allocator::formatter::check_line_start(&v48);
    std::ostream::operator<<();
    caulk::alloc::base_allocator::formatter::emit_string(&v48, ", slot size ");
    caulk::alloc::base_allocator::formatter::check_line_start(&v48);
    std::ostream::operator<<();
    caulk::alloc::base_allocator::formatter::emit_string(&v48, ", ");
    caulk::alloc::base_allocator::formatter::check_line_start(&v48);
    std::ostream::operator<<();
    caulk::alloc::base_allocator::formatter::emit_string(&v48, " slots, ");
    caulk::alloc::base_allocator::formatter::emit_string(&v48, "max size ");
    caulk::alloc::base_allocator::formatter::check_line_start(&v48);
    std::ostream::operator<<();
    caulk::alloc::base_allocator::formatter::emit_string(&v48, ", memory ");
    caulk::alloc::base_allocator::formatter::check_line_start(&v48);
    std::ostream::operator<<();
    caulk::alloc::base_allocator::formatter::emit_string(&v48, ":");
    caulk::alloc::base_allocator::formatter::check_line_start(&v48);
    std::ostream::operator<<();
    caulk::alloc::base_allocator::formatter::emit_string(&v48, "\n");
    v49 += 2;
    caulk::alloc::base_allocator::formatter::emit_string(&v48, "state bits:  ");
    caulk::alloc::base_allocator::formatter::hexdump((caulk::alloc::base_allocator::formatter *)&v48, (char *)(v20 + 24), 0x10uLL);
    caulk::alloc::base_allocator::formatter::emit_string(&v48, "search hint: ");
    atomic_load((unsigned int *)(v20 + 20));
    caulk::alloc::base_allocator::formatter::check_line_start(&v48);
    std::ostream::operator<<();
    caulk::alloc::base_allocator::formatter::emit_string(&v48, "\n");
    uint64_t v56 = 0;
    uint64_t v57 = 0;
    uint64_t v54 = 0;
    v55 = &v56;
    uint64_t v58 = 0;
    uint64_t v53 = 0;
    int64_t v26 = operator new(0x28uLL);
    void *v26 = &unk_26C2AA610;
    v26[1] = &v55;
    v26[2] = &v58;
    v26[3] = &v54;
    v26[4] = &v53;
    long long v60 = v26;
    v61.__r_.__value_.__r.__words[0] = (std::string::size_type)&unk_26C2AABE8;
    v61.__r_.__value_.__l.__size_ = (std::string::size_type)&v59;
    v62 = &v61;
    LODWORD(v63.__r_.__value_.__l.__data_) = 7;
    v63.__r_.__value_.__l.__size_ = (std::string::size_type)&unk_26C2AB948;
    v63.__r_.__value_.__r.__words[2] = (std::string::size_type)caulk::alloc::introspector::local_reader;
    p_std::string::size_type size = &v63.__r_.__value_.__l.__size_;
    std::__function::__value_func<void ()(caulk::alloc::region_usage,unsigned long,unsigned long)>::__value_func[abi:ne180100]((uint64_t)v66, (uint64_t)&v61);
    char v67 = 1;
    std::__function::__value_func<void ()(caulk::alloc::region_usage,unsigned long,unsigned long)>::~__value_func[abi:ne180100](&v61);
    uint64_t v27 = std::function<void * ()(unsigned long,unsigned long)>::operator()((uint64_t)p_size, v20 + 16, 16368);
    caulk::alloc::bitmap_allocator<caulk::alloc::embed_block_memory,16368ul,256ul,6ul>::introspect(v27, v20 + 16, (uint64_t)&v63);
    std::__function::__value_func<void ()(caulk::alloc::region_usage,unsigned long,unsigned long)>::~__value_func[abi:ne180100](v66);
    std::__function::__value_func<void * ()(unsigned long,unsigned long)>::~__value_func[abi:ne180100](&v63.__r_.__value_.__l.__size_);
    std::__function::__value_func<void ()(caulk::alloc::region_usage,caulk::alloc::block)>::~__value_func[abi:ne180100](&v59);
    caulk::alloc::base_allocator::formatter::check_line_start(&v48);
    *(_DWORD *)((char *)v48 + *(void *)(*v48 - 24) + 8) = *(_DWORD *)((unsigned char *)v48 + *(void *)(*v48 - 24) + 8) & 0xFFFFFFB5 | 2;
    caulk::alloc::base_allocator::formatter::check_line_start(&v48);
    std::ostream::operator<<();
    caulk::alloc::base_allocator::formatter::emit_string(&v48, " allocations for ");
    caulk::alloc::base_allocator::formatter::check_line_start(&v48);
    std::ostream::operator<<();
    caulk::alloc::base_allocator::formatter::emit_string(&v48, " bytes");
    caulk::alloc::base_allocator::formatter::emit_string(&v48, " (");
    caulk::alloc::base_allocator::formatter::check_line_start(&v48);
    std::ostream::operator<<();
    caulk::alloc::base_allocator::formatter::emit_string(&v48, "%)");
    caulk::alloc::base_allocator::formatter::emit_string(&v48, "; ");
    caulk::alloc::base_allocator::formatter::check_line_start(&v48);
    std::ostream::operator<<();
    caulk::alloc::base_allocator::formatter::emit_string(&v48, " bytes free\n");
    if (v57)
    {
      caulk::alloc::base_allocator::formatter::emit_string(&v48, "sizes:");
      uint64_t v45 = v18;
      char v28 = v55;
      if (v55 != &v56)
      {
        char v29 = 0;
        do
        {
          if ((v29 & 1) == 0 && (v28[4] & 0x8000000000000000) != 0)
          {
            caulk::alloc::base_allocator::formatter::emit_string(&v48, "\n");
            caulk::alloc::base_allocator::formatter::emit_string(&v48, "free sizes:");
            char v29 = 1;
          }
          caulk::alloc::base_allocator::formatter::emit_string(&v48, " ");
          caulk::alloc::base_allocator::formatter::check_line_start(&v48);
          std::ostream::operator<<();
          caulk::alloc::base_allocator::formatter::emit_string(&v48, caulk::alloc::base_allocator::formatter::summarize_blocks_by_size<caulk::alloc::tracking_allocator<caulk::alloc::page_allocator>>(caulk::alloc::tracking_allocator<caulk::alloc::page_allocator> &,unsigned long)::sizeLabels[(v28[4] >> 61) & 3]);
          caulk::alloc::base_allocator::formatter::emit_string(&v48, "[");
          caulk::alloc::base_allocator::formatter::check_line_start(&v48);
          std::ostream::operator<<();
          caulk::alloc::base_allocator::formatter::emit_string(&v48, "]");
          int v30 = (void *)v28[1];
          if (v30)
          {
            do
            {
              char v31 = (void **)v30;
              int v30 = (void *)*v30;
            }
            while (v30);
          }
          else
          {
            do
            {
              char v31 = (void **)v28[2];
              BOOL v32 = *v31 == v28;
              char v28 = v31;
            }
            while (!v32);
          }
          char v28 = v31;
        }
        while (v31 != &v56);
      }
      caulk::alloc::base_allocator::formatter::emit_string(&v48, "\n");
      uint64_t v18 = v45;
    }
    std::__tree<std::__value_type<unsigned long long,unsigned int>,std::__map_value_compare<unsigned long long,std::__value_type<unsigned long long,unsigned int>,std::less<unsigned long long>,true>,std::allocator<std::__value_type<unsigned long long,unsigned int>>>::destroy(v56);
    v49 -= 4;
    uint64_t v33 = atomic_load((unsigned int *)(v20 + 16));
    if (v47 < 0) {
      operator delete(__s);
    }
    ++v17;
    v18 += v33 << 8;
    goto LABEL_62;
  }
  uint64_t v17 = 0;
LABEL_65:
  caulk::concurrent::details::node_allocator<unsigned long,caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,256ul,6ul>::node_impl<caulk::alloc::tree_allocator<caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,256ul,6ul>>::node_header,caulk::alloc::embed_block_memory> *,5ul,(caulk::concurrent::skiplist_options)1>::end_traversal(a1 + 544, v15);
  v49 += 2;
  caulk::alloc::base_allocator::formatter::check_line_start(&v48);
  uint64_t v34 = a1;
  std::ostream::operator<<();
  caulk::alloc::base_allocator::formatter::emit_string(&v48, " nodes, total capacity ");
  caulk::alloc::base_allocator::formatter::check_line_start(&v48);
  std::ostream::operator<<();
  caulk::alloc::base_allocator::formatter::emit_string(&v48, ", free capacity ");
  caulk::alloc::base_allocator::formatter::check_line_start(&v48);
  std::ostream::operator<<();
  if (16128 * v17)
  {
    caulk::alloc::base_allocator::formatter::emit_string(&v48, " (");
    caulk::alloc::base_allocator::formatter::check_line_start(&v48);
    std::ostream::operator<<();
    caulk::alloc::base_allocator::formatter::emit_string(&v48, "%)");
  }
  caulk::alloc::base_allocator::formatter::emit_string(&v48, "\n");
  v49 -= 2;
  std::string::basic_string[abi:ne180100]<0>(&v63, "super");
  caulk::alloc::base_allocator::formatter::print_allocator<caulk::alloc::global_page_cache>((caulk::alloc::base_allocator::formatter *)&v48, (uint64_t)&v63, (caulk::alloc::details::caching_page_allocator_base **)(a1 + 376));
  if (SHIBYTE(v63.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v63.__r_.__value_.__l.__data_);
  }
  caulk::alloc::base_allocator::formatter::emit_string(&v48, "[tier] ");
  caulk::alloc::base_allocator::formatter::emit_string(&v48, "[tracking] ");
  caulk::alloc::global_page_cache::describe(v44, (caulk::alloc::base_allocator::formatter *)&v48);
  v49 += 2;
  uint64_t v56 = 0;
  uint64_t v57 = 0;
  uint64_t v54 = 0;
  v55 = &v56;
  uint64_t v52 = 0;
  uint64_t v53 = 0;
  std::string v35 = operator new(0x28uLL);
  *std::string v35 = &unk_26C2ABA50;
  v35[1] = &v55;
  v35[2] = &v54;
  v35[3] = &v53;
  v35[4] = &v52;
  long long v60 = v35;
  v61.__r_.__value_.__r.__words[0] = (std::string::size_type)&unk_26C2ABB58;
  v61.__r_.__value_.__l.__size_ = (std::string::size_type)&v59;
  v62 = &v61;
  LODWORD(v63.__r_.__value_.__l.__data_) = 7;
  v63.__r_.__value_.__l.__size_ = (std::string::size_type)&unk_26C2AB948;
  v63.__r_.__value_.__r.__words[2] = (std::string::size_type)caulk::alloc::introspector::local_reader;
  p_std::string::size_type size = &v63.__r_.__value_.__l.__size_;
  std::__function::__value_func<void ()(caulk::alloc::region_usage,unsigned long,unsigned long)>::__value_func[abi:ne180100]((uint64_t)v66, (uint64_t)&v61);
  char v67 = 1;
  std::__function::__value_func<void ()(caulk::alloc::region_usage,unsigned long,unsigned long)>::~__value_func[abi:ne180100](&v61);
  uint64_t v36 = std::function<void * ()(unsigned long,unsigned long)>::operator()((uint64_t)p_size, (uint64_t)v44, 352);
  uint64_t v58 = &v63;
  v51.__r_.__value_.__r.__words[0] = (std::string::size_type)&v58;
  caulk::concurrent::skiplist<void *,caulk::alloc::detail::tracked_block,10,(caulk::concurrent::skiplist_options)0>::introspect<void caulk::alloc::tracking_allocator<caulk::alloc::global_page_cache>::introspect_foreach<caulk::alloc::tracking_allocator<caulk::alloc::global_page_cache>::introspect(unsigned long,caulk::alloc::introspector const&)::{lambda(void *,unsigned long)#1}>(caulk::alloc::introspector const&,caulk::alloc::tracking_allocator<caulk::alloc::global_page_cache>::introspect(unsigned long,caulk::alloc::introspector const&)::{lambda(void *,unsigned long)#1} &&)::{lambda(caulk::alloc::tracking_allocator<caulk::alloc::global_page_cache>::introspect(unsigned long,caulk::alloc::introspector const&)::{lambda(void *,unsigned long)#1} const&)#1}>(v36 + 16, (uint64_t)&v63.__r_.__value_.__l.__size_, (int ***)&v51);
  std::__function::__value_func<void ()(caulk::alloc::region_usage,unsigned long,unsigned long)>::~__value_func[abi:ne180100](v66);
  std::__function::__value_func<void * ()(unsigned long,unsigned long)>::~__value_func[abi:ne180100](&v63.__r_.__value_.__l.__size_);
  std::__function::__value_func<void ()(caulk::alloc::region_usage,caulk::alloc::block)>::~__value_func[abi:ne180100](&v59);
  caulk::alloc::base_allocator::formatter::check_line_start(&v48);
  *(_DWORD *)((char *)v48 + *(void *)(*v48 - 24) + 8) = *(_DWORD *)((unsigned char *)v48 + *(void *)(*v48 - 24) + 8) & 0xFFFFFFB5 | 2;
  caulk::alloc::base_allocator::formatter::check_line_start(&v48);
  std::ostream::operator<<();
  caulk::alloc::base_allocator::formatter::emit_string(&v48, " allocations for ");
  caulk::alloc::base_allocator::formatter::check_line_start(&v48);
  std::ostream::operator<<();
  caulk::alloc::base_allocator::formatter::emit_string(&v48, " bytes");
  caulk::alloc::base_allocator::formatter::emit_string(&v48, "; ");
  caulk::alloc::base_allocator::formatter::check_line_start(&v48);
  std::ostream::operator<<();
  caulk::alloc::base_allocator::formatter::emit_string(&v48, " bytes free\n");
  if (v57)
  {
    caulk::alloc::base_allocator::formatter::emit_string(&v48, "sizes:");
    unint64_t v37 = v55;
    if (v55 != &v56)
    {
      char v38 = 0;
      do
      {
        if ((v38 & 1) == 0 && (v37[4] & 0x8000000000000000) != 0)
        {
          caulk::alloc::base_allocator::formatter::emit_string(&v48, "\n");
          caulk::alloc::base_allocator::formatter::emit_string(&v48, "free sizes:");
          char v38 = 1;
        }
        caulk::alloc::base_allocator::formatter::emit_string(&v48, " ");
        caulk::alloc::base_allocator::formatter::check_line_start(&v48);
        std::ostream::operator<<();
        caulk::alloc::base_allocator::formatter::emit_string(&v48, caulk::alloc::base_allocator::formatter::summarize_blocks_by_size<caulk::alloc::tracking_allocator<caulk::alloc::page_allocator>>(caulk::alloc::tracking_allocator<caulk::alloc::page_allocator> &,unsigned long)::sizeLabels[(v37[4] >> 61) & 3]);
        caulk::alloc::base_allocator::formatter::emit_string(&v48, "[");
        caulk::alloc::base_allocator::formatter::check_line_start(&v48);
        std::ostream::operator<<();
        caulk::alloc::base_allocator::formatter::emit_string(&v48, "]");
        unint64_t v39 = (void *)v37[1];
        if (v39)
        {
          do
          {
            uint64_t v40 = (void **)v39;
            unint64_t v39 = (void *)*v39;
          }
          while (v39);
        }
        else
        {
          do
          {
            uint64_t v40 = (void **)v37[2];
            BOOL v32 = *v40 == v37;
            unint64_t v37 = v40;
          }
          while (!v32);
        }
        unint64_t v37 = v40;
      }
      while (v40 != &v56);
    }
    caulk::alloc::base_allocator::formatter::emit_string(&v48, "\n");
    uint64_t v34 = v43;
  }
  std::__tree<std::__value_type<unsigned long long,unsigned int>,std::__map_value_compare<unsigned long long,std::__value_type<unsigned long long,unsigned int>,std::less<unsigned long long>,true>,std::allocator<std::__value_type<unsigned long long,unsigned int>>>::destroy(v56);
  v49 -= 4;
  if (a3)
  {
    v63.__r_.__value_.__r.__words[0] = (std::string::size_type)&unk_26C2AA878;
    v63.__r_.__value_.__l.__size_ = (std::string::size_type)a2;
    v64 = &v63;
    caulk::alloc::allocator_enumerate<caulk::alloc::resource<caulk::alloc::dsw_allocator2<true>,caulk::alloc::rt_safe_memory_resource>>(v34, 7, (uint64_t)&v63);
    std::__function::__value_func<void ()(caulk::alloc::region_usage,caulk::alloc::block)>::~__value_func[abi:ne180100](&v63);
  }
}

void sub_210871C64(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, void *__p, uint64_t a19, int a20,int a21,uint64_t a22,uint64_t a23,void *a24,uint64_t a25,int a26,__int16 a27,char a28,char a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,void *a37,uint64_t a38,int a39,__int16 a40,char a41,char a42)
{
  std::__function::__value_func<void ()(caulk::alloc::region_usage,caulk::alloc::block)>::~__value_func[abi:ne180100]((void *)(v42 - 176));
  _Unwind_Resume(a1);
}

void *std::__function::__func<void caulk::alloc::print_allocator<caulk::alloc::resource<caulk::alloc::dsw_allocator2<true>,caulk::alloc::rt_safe_memory_resource>>(caulk::alloc::resource<caulk::alloc::dsw_allocator2<true>,caulk::alloc::rt_safe_memory_resource> &,std::ostream &,BOOL)::{lambda(caulk::alloc::region_usage,caulk::alloc::block)#1},std::allocator<void caulk::alloc::print_allocator<caulk::alloc::resource<caulk::alloc::dsw_allocator2<true>,caulk::alloc::rt_safe_memory_resource>>(caulk::alloc::resource<caulk::alloc::dsw_allocator2<true>,caulk::alloc::rt_safe_memory_resource> &,std::ostream &,BOOL)::{lambda(caulk::alloc::region_usage,caulk::alloc::block)#1}>,void ()(caulk::alloc::region_usage,caulk::alloc::block)>::target_type()
{
}

uint64_t std::__function::__func<void caulk::alloc::print_allocator<caulk::alloc::resource<caulk::alloc::dsw_allocator2<true>,caulk::alloc::rt_safe_memory_resource>>(caulk::alloc::resource<caulk::alloc::dsw_allocator2<true>,caulk::alloc::rt_safe_memory_resource> &,std::ostream &,BOOL)::{lambda(caulk::alloc::region_usage,caulk::alloc::block)#1},std::allocator<void caulk::alloc::print_allocator<caulk::alloc::resource<caulk::alloc::dsw_allocator2<true>,caulk::alloc::rt_safe_memory_resource>>(caulk::alloc::resource<caulk::alloc::dsw_allocator2<true>,caulk::alloc::rt_safe_memory_resource> &,std::ostream &,BOOL)::{lambda(caulk::alloc::region_usage,caulk::alloc::block)#1}>,void ()(caulk::alloc::region_usage,caulk::alloc::block)>::target(uint64_t a1, uint64_t a2)
{
  if (std::type_info::operator==[abi:ne180100](*(void *)(a2 + 8), (uint64_t)"ZN5caulk5alloc15print_allocatorINS0_8resourceINS0_14dsw_allocator2ILb1EEENS0_23rt_safe_memory_resourceEEEEEvRT_RNSt3__113basic_ostreamIcNS9_11char_traitsIcEEEEbEUlNS0_12region_usageENS0_5blockEE_"))
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

uint64_t std::__function::__func<void caulk::alloc::print_allocator<caulk::alloc::resource<caulk::alloc::dsw_allocator2<true>,caulk::alloc::rt_safe_memory_resource>>(caulk::alloc::resource<caulk::alloc::dsw_allocator2<true>,caulk::alloc::rt_safe_memory_resource> &,std::ostream &,BOOL)::{lambda(caulk::alloc::region_usage,caulk::alloc::block)#1},std::allocator<void caulk::alloc::print_allocator<caulk::alloc::resource<caulk::alloc::dsw_allocator2<true>,caulk::alloc::rt_safe_memory_resource>>(caulk::alloc::resource<caulk::alloc::dsw_allocator2<true>,caulk::alloc::rt_safe_memory_resource> &,std::ostream &,BOOL)::{lambda(caulk::alloc::region_usage,caulk::alloc::block)#1}>,void ()(caulk::alloc::region_usage,caulk::alloc::block)>::operator()(uint64_t a1, int *a2)
{
  return caulk::alloc::describe_block(*(void *)(a1 + 8), *a2);
}

uint64_t std::__function::__func<void caulk::alloc::print_allocator<caulk::alloc::resource<caulk::alloc::dsw_allocator2<true>,caulk::alloc::rt_safe_memory_resource>>(caulk::alloc::resource<caulk::alloc::dsw_allocator2<true>,caulk::alloc::rt_safe_memory_resource> &,std::ostream &,BOOL)::{lambda(caulk::alloc::region_usage,caulk::alloc::block)#1},std::allocator<void caulk::alloc::print_allocator<caulk::alloc::resource<caulk::alloc::dsw_allocator2<true>,caulk::alloc::rt_safe_memory_resource>>(caulk::alloc::resource<caulk::alloc::dsw_allocator2<true>,caulk::alloc::rt_safe_memory_resource> &,std::ostream &,BOOL)::{lambda(caulk::alloc::region_usage,caulk::alloc::block)#1}>,void ()(caulk::alloc::region_usage,caulk::alloc::block)>::__clone(uint64_t result, void *a2)
{
  uint64_t v2 = *(void *)(result + 8);
  *a2 = &unk_26C2AA878;
  a2[1] = v2;
  return result;
}

void *std::__function::__func<void caulk::alloc::print_allocator<caulk::alloc::resource<caulk::alloc::dsw_allocator2<true>,caulk::alloc::rt_safe_memory_resource>>(caulk::alloc::resource<caulk::alloc::dsw_allocator2<true>,caulk::alloc::rt_safe_memory_resource> &,std::ostream &,BOOL)::{lambda(caulk::alloc::region_usage,caulk::alloc::block)#1},std::allocator<void caulk::alloc::print_allocator<caulk::alloc::resource<caulk::alloc::dsw_allocator2<true>,caulk::alloc::rt_safe_memory_resource>>(caulk::alloc::resource<caulk::alloc::dsw_allocator2<true>,caulk::alloc::rt_safe_memory_resource> &,std::ostream &,BOOL)::{lambda(caulk::alloc::region_usage,caulk::alloc::block)#1}>,void ()(caulk::alloc::region_usage,caulk::alloc::block)>::__clone(uint64_t a1)
{
  __n128 result = operator new(0x10uLL);
  uint64_t v3 = *(void *)(a1 + 8);
  *__n128 result = &unk_26C2AA878;
  result[1] = v3;
  return result;
}

void std::__function::__func<void caulk::alloc::print_allocator<caulk::alloc::resource<caulk::alloc::dsw_allocator2<true>,caulk::alloc::rt_safe_memory_resource>>(caulk::alloc::resource<caulk::alloc::dsw_allocator2<true>,caulk::alloc::rt_safe_memory_resource> &,std::ostream &,BOOL)::{lambda(caulk::alloc::region_usage,caulk::alloc::block)#1},std::allocator<void caulk::alloc::print_allocator<caulk::alloc::resource<caulk::alloc::dsw_allocator2<true>,caulk::alloc::rt_safe_memory_resource>>(caulk::alloc::resource<caulk::alloc::dsw_allocator2<true>,caulk::alloc::rt_safe_memory_resource> &,std::ostream &,BOOL)::{lambda(caulk::alloc::region_usage,caulk::alloc::block)#1}>,void ()(caulk::alloc::region_usage,caulk::alloc::block)>::~__func()
{
}

void *caulk::alloc::base_allocator::formatter::emit_string(void *this, char *a2)
{
  if (*a2)
  {
    uint64_t v2 = a2;
    uint64_t v3 = (uint64_t)this;
    while (1)
    {
      caulk::alloc::base_allocator::formatter::check_line_start((void *)v3);
      unint64_t v4 = strchr(v2, 10);
      if (!v4) {
        break;
      }
      unint64_t v5 = v4;
      uint64_t v6 = v4 + 1;
      this = (void *)std::ostream::write();
      *(unsigned char *)(v3 + 12) = 1;
      uint64_t v2 = v6;
      if (!v5[1]) {
        return this;
      }
    }
    size_t v7 = strlen(v2);
    char v8 = *(void **)v3;
    return std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v8, (uint64_t)v2, v7);
  }
  return this;
}

void *caulk::alloc::base_allocator::formatter::check_line_start(void *this)
{
  if (*((unsigned char *)this + 12))
  {
    uint64_t v1 = (uint64_t)this;
    int v2 = *((_DWORD *)this + 2);
    if (v2 >= 1)
    {
      unsigned int v3 = v2 + 1;
      do
      {
        unint64_t v4 = *(void **)v1;
        char v5 = 32;
        this = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v4, (uint64_t)&v5, 1);
        --v3;
      }
      while (v3 > 1);
    }
    *(unsigned char *)(v1 + 12) = 0;
  }
  return this;
}

void *caulk::alloc::global_page_cache::describe(caulk::alloc::details::caching_page_allocator_base **this, caulk::alloc::base_allocator::formatter *a2)
{
  caulk::alloc::base_allocator::formatter::emit_string(a2, "[global] ");
  caulk::alloc::base_allocator::formatter::emit_string(a2, "[ref] ");
  unint64_t v4 = *this;

  return caulk::alloc::details::caching_page_allocator_base::describe(v4, a2);
}

void std::__tree<std::__value_type<unsigned long long,unsigned int>,std::__map_value_compare<unsigned long long,std::__value_type<unsigned long long,unsigned int>,std::less<unsigned long long>,true>,std::allocator<std::__value_type<unsigned long long,unsigned int>>>::destroy(void *a1)
{
  if (a1)
  {
    std::__tree<std::__value_type<unsigned long long,unsigned int>,std::__map_value_compare<unsigned long long,std::__value_type<unsigned long long,unsigned int>,std::less<unsigned long long>,true>,std::allocator<std::__value_type<unsigned long long,unsigned int>>>::destroy(*a1);
    std::__tree<std::__value_type<unsigned long long,unsigned int>,std::__map_value_compare<unsigned long long,std::__value_type<unsigned long long,unsigned int>,std::less<unsigned long long>,true>,std::allocator<std::__value_type<unsigned long long,unsigned int>>>::destroy(a1[1]);
    operator delete(a1);
  }
}

void *std::__function::__func<void caulk::alloc::allocator_enumerate<caulk::alloc::tracking_allocator<caulk::alloc::global_page_cache>>(caulk::alloc::tracking_allocator<caulk::alloc::global_page_cache> &,caulk::option_set<caulk::alloc::region_usage,unsigned int>,std::function<void ()(caulk::alloc::region_usage,caulk::alloc::block)> const&)::{lambda(caulk::alloc::region_usage,unsigned long,unsigned long)#1},std::allocator<void caulk::alloc::allocator_enumerate<caulk::alloc::tracking_allocator<caulk::alloc::global_page_cache>>(caulk::alloc::tracking_allocator<caulk::alloc::global_page_cache> &,caulk::option_set<caulk::alloc::region_usage,unsigned int>,std::function<void ()(caulk::alloc::region_usage,caulk::alloc::block)> const&)::{lambda(caulk::alloc::region_usage,unsigned long,unsigned long)#1}>,void ()(caulk::alloc::region_usage,unsigned long,unsigned long)>::target_type()
{
}

uint64_t std::__function::__func<void caulk::alloc::allocator_enumerate<caulk::alloc::tracking_allocator<caulk::alloc::global_page_cache>>(caulk::alloc::tracking_allocator<caulk::alloc::global_page_cache> &,caulk::option_set<caulk::alloc::region_usage,unsigned int>,std::function<void ()(caulk::alloc::region_usage,caulk::alloc::block)> const&)::{lambda(caulk::alloc::region_usage,unsigned long,unsigned long)#1},std::allocator<void caulk::alloc::allocator_enumerate<caulk::alloc::tracking_allocator<caulk::alloc::global_page_cache>>(caulk::alloc::tracking_allocator<caulk::alloc::global_page_cache> &,caulk::option_set<caulk::alloc::region_usage,unsigned int>,std::function<void ()(caulk::alloc::region_usage,caulk::alloc::block)> const&)::{lambda(caulk::alloc::region_usage,unsigned long,unsigned long)#1}>,void ()(caulk::alloc::region_usage,unsigned long,unsigned long)>::target(uint64_t a1, uint64_t a2)
{
  if (std::type_info::operator==[abi:ne180100](*(void *)(a2 + 8), (uint64_t)"ZN5caulk5alloc19allocator_enumerateINS0_18tracking_allocatorINS0_17global_page_cacheEEEEEvRT_NS_10option_setINS0_12region_usageEjEERKNSt3__18functionIFvS8_NS0_5blockEEEEEUlS8_mmE_"))
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

uint64_t std::__function::__func<void caulk::alloc::allocator_enumerate<caulk::alloc::tracking_allocator<caulk::alloc::global_page_cache>>(caulk::alloc::tracking_allocator<caulk::alloc::global_page_cache> &,caulk::option_set<caulk::alloc::region_usage,unsigned int>,std::function<void ()(caulk::alloc::region_usage,caulk::alloc::block)> const&)::{lambda(caulk::alloc::region_usage,unsigned long,unsigned long)#1},std::allocator<void caulk::alloc::allocator_enumerate<caulk::alloc::tracking_allocator<caulk::alloc::global_page_cache>>(caulk::alloc::tracking_allocator<caulk::alloc::global_page_cache> &,caulk::option_set<caulk::alloc::region_usage,unsigned int>,std::function<void ()(caulk::alloc::region_usage,caulk::alloc::block)> const&)::{lambda(caulk::alloc::region_usage,unsigned long,unsigned long)#1}>,void ()(caulk::alloc::region_usage,unsigned long,unsigned long)>::operator()(uint64_t a1, int *a2, uint64_t *a3, uint64_t *a4)
{
  return std::function<void ()(caulk::alloc::region_usage,caulk::alloc::block)>::operator()(*(void *)(*(void *)(a1 + 8) + 24), *a2, *a3, *a4);
}

uint64_t std::__function::__func<void caulk::alloc::allocator_enumerate<caulk::alloc::tracking_allocator<caulk::alloc::global_page_cache>>(caulk::alloc::tracking_allocator<caulk::alloc::global_page_cache> &,caulk::option_set<caulk::alloc::region_usage,unsigned int>,std::function<void ()(caulk::alloc::region_usage,caulk::alloc::block)> const&)::{lambda(caulk::alloc::region_usage,unsigned long,unsigned long)#1},std::allocator<void caulk::alloc::allocator_enumerate<caulk::alloc::tracking_allocator<caulk::alloc::global_page_cache>>(caulk::alloc::tracking_allocator<caulk::alloc::global_page_cache> &,caulk::option_set<caulk::alloc::region_usage,unsigned int>,std::function<void ()(caulk::alloc::region_usage,caulk::alloc::block)> const&)::{lambda(caulk::alloc::region_usage,unsigned long,unsigned long)#1}>,void ()(caulk::alloc::region_usage,unsigned long,unsigned long)>::__clone(uint64_t result, void *a2)
{
  uint64_t v2 = *(void *)(result + 8);
  *a2 = &unk_26C2ABB58;
  a2[1] = v2;
  return result;
}

void *std::__function::__func<void caulk::alloc::allocator_enumerate<caulk::alloc::tracking_allocator<caulk::alloc::global_page_cache>>(caulk::alloc::tracking_allocator<caulk::alloc::global_page_cache> &,caulk::option_set<caulk::alloc::region_usage,unsigned int>,std::function<void ()(caulk::alloc::region_usage,caulk::alloc::block)> const&)::{lambda(caulk::alloc::region_usage,unsigned long,unsigned long)#1},std::allocator<void caulk::alloc::allocator_enumerate<caulk::alloc::tracking_allocator<caulk::alloc::global_page_cache>>(caulk::alloc::tracking_allocator<caulk::alloc::global_page_cache> &,caulk::option_set<caulk::alloc::region_usage,unsigned int>,std::function<void ()(caulk::alloc::region_usage,caulk::alloc::block)> const&)::{lambda(caulk::alloc::region_usage,unsigned long,unsigned long)#1}>,void ()(caulk::alloc::region_usage,unsigned long,unsigned long)>::__clone(uint64_t a1)
{
  __n128 result = operator new(0x10uLL);
  uint64_t v3 = *(void *)(a1 + 8);
  *__n128 result = &unk_26C2ABB58;
  result[1] = v3;
  return result;
}

void std::__function::__func<void caulk::alloc::allocator_enumerate<caulk::alloc::tracking_allocator<caulk::alloc::global_page_cache>>(caulk::alloc::tracking_allocator<caulk::alloc::global_page_cache> &,caulk::option_set<caulk::alloc::region_usage,unsigned int>,std::function<void ()(caulk::alloc::region_usage,caulk::alloc::block)> const&)::{lambda(caulk::alloc::region_usage,unsigned long,unsigned long)#1},std::allocator<void caulk::alloc::allocator_enumerate<caulk::alloc::tracking_allocator<caulk::alloc::global_page_cache>>(caulk::alloc::tracking_allocator<caulk::alloc::global_page_cache> &,caulk::option_set<caulk::alloc::region_usage,unsigned int>,std::function<void ()(caulk::alloc::region_usage,caulk::alloc::block)> const&)::{lambda(caulk::alloc::region_usage,unsigned long,unsigned long)#1}>,void ()(caulk::alloc::region_usage,unsigned long,unsigned long)>::~__func()
{
}

void *std::__function::__func<void caulk::alloc::base_allocator::formatter::summarize_blocks_by_size<caulk::alloc::tracking_allocator<caulk::alloc::global_page_cache>>(caulk::alloc::tracking_allocator<caulk::alloc::global_page_cache> &,unsigned long)::{lambda(caulk::alloc::region_usage,caulk::alloc::block)#1},std::allocator<void caulk::alloc::base_allocator::formatter::summarize_blocks_by_size<caulk::alloc::tracking_allocator<caulk::alloc::global_page_cache>>(caulk::alloc::tracking_allocator<caulk::alloc::global_page_cache> &,unsigned long)::{lambda(caulk::alloc::region_usage,caulk::alloc::block)#1}>,void ()(caulk::alloc::region_usage,caulk::alloc::block)>::target_type()
{
}

uint64_t std::__function::__func<void caulk::alloc::base_allocator::formatter::summarize_blocks_by_size<caulk::alloc::tracking_allocator<caulk::alloc::global_page_cache>>(caulk::alloc::tracking_allocator<caulk::alloc::global_page_cache> &,unsigned long)::{lambda(caulk::alloc::region_usage,caulk::alloc::block)#1},std::allocator<void caulk::alloc::base_allocator::formatter::summarize_blocks_by_size<caulk::alloc::tracking_allocator<caulk::alloc::global_page_cache>>(caulk::alloc::tracking_allocator<caulk::alloc::global_page_cache> &,unsigned long)::{lambda(caulk::alloc::region_usage,caulk::alloc::block)#1}>,void ()(caulk::alloc::region_usage,caulk::alloc::block)>::target(uint64_t a1, uint64_t a2)
{
  if (std::type_info::operator==[abi:ne180100](*(void *)(a2 + 8), (uint64_t)"ZN5caulk5alloc14base_allocator9formatter24summarize_blocks_by_sizeINS0_18tracking_allocatorINS0_17global_page_cacheEEEEEvRT_mEUlNS0_12region_usageENS0_5blockEE_"))
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

uint64_t **std::__function::__func<void caulk::alloc::base_allocator::formatter::summarize_blocks_by_size<caulk::alloc::tracking_allocator<caulk::alloc::global_page_cache>>(caulk::alloc::tracking_allocator<caulk::alloc::global_page_cache> &,unsigned long)::{lambda(caulk::alloc::region_usage,caulk::alloc::block)#1},std::allocator<void caulk::alloc::base_allocator::formatter::summarize_blocks_by_size<caulk::alloc::tracking_allocator<caulk::alloc::global_page_cache>>(caulk::alloc::tracking_allocator<caulk::alloc::global_page_cache> &,unsigned long)::{lambda(caulk::alloc::region_usage,caulk::alloc::block)#1}>,void ()(caulk::alloc::region_usage,caulk::alloc::block)>::operator()(uint64_t **result, int *a2, uint64_t a3)
{
  int v3 = *a2;
  if ((*a2 - 3) >= 0xFFFFFFFE)
  {
    unint64_t v4 = result;
    unint64_t v5 = *(void *)(a3 + 8);
    unint64_t v6 = v5 & 0x1FFFFFFFFFFFFFFFLL;
    unint64_t v7 = (v5 >> 4) & 0x1FFFFFFFFFFFFFFLL;
    if (v6 <= 0xF423F) {
      unint64_t v8 = ((v6 + 1023) >> 10) | 0x2000000000000000;
    }
    else {
      unint64_t v8 = ((v6 + 0xFFFFF) >> 20) | 0x4000000000000000;
    }
    if (v7 >= 0x271) {
      unint64_t v9 = v8;
    }
    else {
      unint64_t v9 = v6;
    }
    char v11 = (uint64_t *)(v9 | ((unint64_t)(v3 == 2) << 63));
    __n128 result = std::__tree<std::__value_type<unsigned long long,unsigned int>,std::__map_value_compare<unsigned long long,std::__value_type<unsigned long long,unsigned int>,std::less<unsigned long long>,true>,std::allocator<std::__value_type<unsigned long long,unsigned int>>>::__emplace_unique_key_args<unsigned long long,std::piecewise_construct_t const&,std::tuple<unsigned long long const&>,std::tuple<>>((uint64_t **)result[1], (unint64_t)v11, &v11);
    ++*((_DWORD *)result + 10);
    if (v3 == 2)
    {
      int v10 = v4 + 4;
    }
    else
    {
      ++*v4[2];
      int v10 = v4 + 3;
    }
    **v10 += v6;
  }
  return result;
}

uint64_t **std::__tree<std::__value_type<unsigned long long,unsigned int>,std::__map_value_compare<unsigned long long,std::__value_type<unsigned long long,unsigned int>,std::less<unsigned long long>,true>,std::allocator<std::__value_type<unsigned long long,unsigned int>>>::__emplace_unique_key_args<unsigned long long,std::piecewise_construct_t const&,std::tuple<unsigned long long const&>,std::tuple<>>(uint64_t **a1, unint64_t a2, uint64_t **a3)
{
  unint64_t v6 = a1 + 1;
  unint64_t v5 = a1[1];
  if (v5)
  {
    while (1)
    {
      while (1)
      {
        unint64_t v7 = (uint64_t **)v5;
        unint64_t v8 = v5[4];
        if (v8 <= a2) {
          break;
        }
        unint64_t v5 = *v7;
        unint64_t v6 = v7;
        if (!*v7) {
          goto LABEL_9;
        }
      }
      if (v8 >= a2) {
        break;
      }
      unint64_t v5 = v7[1];
      if (!v5)
      {
        unint64_t v6 = v7 + 1;
        goto LABEL_9;
      }
    }
  }
  else
  {
    unint64_t v7 = a1 + 1;
LABEL_9:
    unint64_t v9 = (uint64_t *)v7;
    unint64_t v7 = (uint64_t **)operator new(0x30uLL);
    integer_t v7[4] = *a3;
    *((_DWORD *)v7 + 10) = 0;
    *unint64_t v7 = 0;
    v7[1] = 0;
    void v7[2] = v9;
    *unint64_t v6 = (uint64_t *)v7;
    int v10 = (uint64_t *)**a1;
    char v11 = (uint64_t *)v7;
    if (v10)
    {
      *a1 = v10;
      char v11 = *v6;
    }
    std::__tree_balance_after_insert[abi:ne180100]<std::__tree_node_base<void *> *>(a1[1], v11);
    a1[2] = (uint64_t *)((char *)a1[2] + 1);
  }
  return v7;
}

__n128 std::__function::__func<void caulk::alloc::base_allocator::formatter::summarize_blocks_by_size<caulk::alloc::tracking_allocator<caulk::alloc::global_page_cache>>(caulk::alloc::tracking_allocator<caulk::alloc::global_page_cache> &,unsigned long)::{lambda(caulk::alloc::region_usage,caulk::alloc::block)#1},std::allocator<void caulk::alloc::base_allocator::formatter::summarize_blocks_by_size<caulk::alloc::tracking_allocator<caulk::alloc::global_page_cache>>(caulk::alloc::tracking_allocator<caulk::alloc::global_page_cache> &,unsigned long)::{lambda(caulk::alloc::region_usage,caulk::alloc::block)#1}>,void ()(caulk::alloc::region_usage,caulk::alloc::block)>::__clone(uint64_t a1, uint64_t a2)
{
  *(void *)a2 = &unk_26C2ABA50;
  __n128 result = *(__n128 *)(a1 + 8);
  *(_OWORD *)(a2 + 24) = *(_OWORD *)(a1 + 24);
  *(__n128 *)(a2 + 8) = result;
  return result;
}

__n128 std::__function::__func<void caulk::alloc::base_allocator::formatter::summarize_blocks_by_size<caulk::alloc::tracking_allocator<caulk::alloc::global_page_cache>>(caulk::alloc::tracking_allocator<caulk::alloc::global_page_cache> &,unsigned long)::{lambda(caulk::alloc::region_usage,caulk::alloc::block)#1},std::allocator<void caulk::alloc::base_allocator::formatter::summarize_blocks_by_size<caulk::alloc::tracking_allocator<caulk::alloc::global_page_cache>>(caulk::alloc::tracking_allocator<caulk::alloc::global_page_cache> &,unsigned long)::{lambda(caulk::alloc::region_usage,caulk::alloc::block)#1}>,void ()(caulk::alloc::region_usage,caulk::alloc::block)>::__clone(uint64_t a1)
{
  uint64_t v2 = (char *)operator new(0x28uLL);
  *(void *)uint64_t v2 = &unk_26C2ABA50;
  *(_OWORD *)(v2 + 8) = *(_OWORD *)(a1 + 8);
  __n128 result = *(__n128 *)(a1 + 24);
  *(__n128 *)(v2 + 24) = result;
  return result;
}

void std::__function::__func<void caulk::alloc::base_allocator::formatter::summarize_blocks_by_size<caulk::alloc::tracking_allocator<caulk::alloc::global_page_cache>>(caulk::alloc::tracking_allocator<caulk::alloc::global_page_cache> &,unsigned long)::{lambda(caulk::alloc::region_usage,caulk::alloc::block)#1},std::allocator<void caulk::alloc::base_allocator::formatter::summarize_blocks_by_size<caulk::alloc::tracking_allocator<caulk::alloc::global_page_cache>>(caulk::alloc::tracking_allocator<caulk::alloc::global_page_cache> &,unsigned long)::{lambda(caulk::alloc::region_usage,caulk::alloc::block)#1}>,void ()(caulk::alloc::region_usage,caulk::alloc::block)>::~__func()
{
}

void *caulk::alloc::base_allocator::formatter::print_allocator<caulk::alloc::global_page_cache>(caulk::alloc::base_allocator::formatter *a1, uint64_t a2, caulk::alloc::details::caching_page_allocator_base **this)
{
  *((_DWORD *)a1 + 2) += 2;
  if (*(char *)(a2 + 23) < 0)
  {
    std::string::size_type v5 = *(void *)(a2 + 8);
    if (!v5) {
      goto LABEL_8;
    }
    std::string::__init_copy_ctor_external(&__p, *(const std::string::value_type **)a2, v5);
  }
  else
  {
    if (!*(unsigned char *)(a2 + 23)) {
      goto LABEL_8;
    }
    std::string __p = *(std::string *)a2;
  }
  caulk::alloc::base_allocator::formatter::operator<<<std::string>(a1, (uint64_t)&__p);
  caulk::alloc::base_allocator::formatter::emit_string(a1, ": ");
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__p.__r_.__value_.__l.__data_);
  }
LABEL_8:
  __n128 result = caulk::alloc::global_page_cache::describe(this, a1);
  *((_DWORD *)a1 + 2) -= 2;
  return result;
}

void sub_2108724EC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14)
{
  if (a14 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void *caulk::alloc::base_allocator::formatter::operator<<<std::string>(void *a1, uint64_t a2)
{
  caulk::alloc::base_allocator::formatter::check_line_start(a1);
  int v4 = *(char *)(a2 + 23);
  if (v4 >= 0) {
    uint64_t v5 = a2;
  }
  else {
    uint64_t v5 = *(void *)a2;
  }
  if (v4 >= 0) {
    uint64_t v6 = *(unsigned __int8 *)(a2 + 23);
  }
  else {
    uint64_t v6 = *(void *)(a2 + 8);
  }
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>((void *)*a1, v5, v6);
  return a1;
}

void *caulk::alloc::base_allocator::formatter::hexdump(caulk::alloc::base_allocator::formatter *this, char *a2, unint64_t a3)
{
  unint64_t v5 = a3 >> 2;
  caulk::alloc::base_allocator::formatter::check_line_start(this);
  uint64_t v6 = *(void *)this + *(void *)(**(void **)this - 24);
  *(_DWORD *)(v6 + 8) = *(_DWORD *)(v6 + 8) & 0xFFFFFFB5 | 8;
  caulk::alloc::base_allocator::formatter::check_line_start(this);
  std::operator<<[abi:ne180100]<std::char_traits<char>>(*(void **)this, 48);
  unsigned int v7 = v5 + 1;
  do
  {
    caulk::alloc::base_allocator::formatter::check_line_start(this);
    unint64_t v8 = *(void **)this;
    char v11 = 32;
    std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v8, (uint64_t)&v11, 1);
    caulk::alloc::base_allocator::formatter::check_line_start(this);
    *(void *)(*(void *)this + *(void *)(**(void **)this - 24) + 24) = 8;
    a2 += 4;
    caulk::alloc::base_allocator::formatter::check_line_start(this);
    std::ostream::operator<<();
    --v7;
  }
  while (v7 > 1);
  caulk::alloc::base_allocator::formatter::check_line_start(this);
  uint64_t v9 = *(void *)this + *(void *)(**(void **)this - 24);
  *(_DWORD *)(v9 + 8) = *(_DWORD *)(v9 + 8) & 0xFFFFFFB5 | 2;
  caulk::alloc::base_allocator::formatter::check_line_start(this);
  std::operator<<[abi:ne180100]<std::char_traits<char>>(*(void **)this, 32);
  return caulk::alloc::base_allocator::formatter::emit_string(this, "\n");
}

void *std::__function::__func<void caulk::alloc::allocator_enumerate<caulk::alloc::bitmap_allocator<caulk::alloc::embed_block_memory,16368ul,256ul,6ul>>(caulk::alloc::bitmap_allocator<caulk::alloc::embed_block_memory,16368ul,256ul,6ul> &,caulk::option_set<caulk::alloc::region_usage,unsigned int>,std::function<void ()(caulk::alloc::region_usage,caulk::alloc::block)> const&)::{lambda(caulk::alloc::region_usage,unsigned long,unsigned long)#1},std::allocator<void caulk::alloc::allocator_enumerate<caulk::alloc::bitmap_allocator<caulk::alloc::embed_block_memory,16368ul,256ul,6ul>>(caulk::alloc::bitmap_allocator<caulk::alloc::embed_block_memory,16368ul,256ul,6ul> &,caulk::option_set<caulk::alloc::region_usage,unsigned int>,std::function<void ()(caulk::alloc::region_usage,caulk::alloc::block)> const&)::{lambda(caulk::alloc::region_usage,unsigned long,unsigned long)#1}>,void ()(caulk::alloc::region_usage,unsigned long,unsigned long)>::target_type()
{
}

uint64_t std::__function::__func<void caulk::alloc::allocator_enumerate<caulk::alloc::bitmap_allocator<caulk::alloc::embed_block_memory,16368ul,256ul,6ul>>(caulk::alloc::bitmap_allocator<caulk::alloc::embed_block_memory,16368ul,256ul,6ul> &,caulk::option_set<caulk::alloc::region_usage,unsigned int>,std::function<void ()(caulk::alloc::region_usage,caulk::alloc::block)> const&)::{lambda(caulk::alloc::region_usage,unsigned long,unsigned long)#1},std::allocator<void caulk::alloc::allocator_enumerate<caulk::alloc::bitmap_allocator<caulk::alloc::embed_block_memory,16368ul,256ul,6ul>>(caulk::alloc::bitmap_allocator<caulk::alloc::embed_block_memory,16368ul,256ul,6ul> &,caulk::option_set<caulk::alloc::region_usage,unsigned int>,std::function<void ()(caulk::alloc::region_usage,caulk::alloc::block)> const&)::{lambda(caulk::alloc::region_usage,unsigned long,unsigned long)#1}>,void ()(caulk::alloc::region_usage,unsigned long,unsigned long)>::target(uint64_t a1, uint64_t a2)
{
  if (std::type_info::operator==[abi:ne180100](*(void *)(a2 + 8), (uint64_t)"ZN5caulk5alloc19allocator_enumerateINS0_16bitmap_allocatorINS0_18embed_block_memoryELm16368ELm256ELm6EEEEEvRT_NS_10option_setINS0_12region_usageEjEERKNSt3__18functionIFvS8_NS0_5blockEEEEEUlS8_mmE_"))
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

uint64_t std::__function::__func<void caulk::alloc::allocator_enumerate<caulk::alloc::bitmap_allocator<caulk::alloc::embed_block_memory,16368ul,256ul,6ul>>(caulk::alloc::bitmap_allocator<caulk::alloc::embed_block_memory,16368ul,256ul,6ul> &,caulk::option_set<caulk::alloc::region_usage,unsigned int>,std::function<void ()(caulk::alloc::region_usage,caulk::alloc::block)> const&)::{lambda(caulk::alloc::region_usage,unsigned long,unsigned long)#1},std::allocator<void caulk::alloc::allocator_enumerate<caulk::alloc::bitmap_allocator<caulk::alloc::embed_block_memory,16368ul,256ul,6ul>>(caulk::alloc::bitmap_allocator<caulk::alloc::embed_block_memory,16368ul,256ul,6ul> &,caulk::option_set<caulk::alloc::region_usage,unsigned int>,std::function<void ()(caulk::alloc::region_usage,caulk::alloc::block)> const&)::{lambda(caulk::alloc::region_usage,unsigned long,unsigned long)#1}>,void ()(caulk::alloc::region_usage,unsigned long,unsigned long)>::operator()(uint64_t a1, int *a2, uint64_t *a3, uint64_t *a4)
{
  return std::function<void ()(caulk::alloc::region_usage,caulk::alloc::block)>::operator()(*(void *)(*(void *)(a1 + 8) + 24), *a2, *a3, *a4);
}

uint64_t std::__function::__func<void caulk::alloc::allocator_enumerate<caulk::alloc::bitmap_allocator<caulk::alloc::embed_block_memory,16368ul,256ul,6ul>>(caulk::alloc::bitmap_allocator<caulk::alloc::embed_block_memory,16368ul,256ul,6ul> &,caulk::option_set<caulk::alloc::region_usage,unsigned int>,std::function<void ()(caulk::alloc::region_usage,caulk::alloc::block)> const&)::{lambda(caulk::alloc::region_usage,unsigned long,unsigned long)#1},std::allocator<void caulk::alloc::allocator_enumerate<caulk::alloc::bitmap_allocator<caulk::alloc::embed_block_memory,16368ul,256ul,6ul>>(caulk::alloc::bitmap_allocator<caulk::alloc::embed_block_memory,16368ul,256ul,6ul> &,caulk::option_set<caulk::alloc::region_usage,unsigned int>,std::function<void ()(caulk::alloc::region_usage,caulk::alloc::block)> const&)::{lambda(caulk::alloc::region_usage,unsigned long,unsigned long)#1}>,void ()(caulk::alloc::region_usage,unsigned long,unsigned long)>::__clone(uint64_t result, void *a2)
{
  uint64_t v2 = *(void *)(result + 8);
  *a2 = &unk_26C2AABE8;
  a2[1] = v2;
  return result;
}

void *std::__function::__func<void caulk::alloc::allocator_enumerate<caulk::alloc::bitmap_allocator<caulk::alloc::embed_block_memory,16368ul,256ul,6ul>>(caulk::alloc::bitmap_allocator<caulk::alloc::embed_block_memory,16368ul,256ul,6ul> &,caulk::option_set<caulk::alloc::region_usage,unsigned int>,std::function<void ()(caulk::alloc::region_usage,caulk::alloc::block)> const&)::{lambda(caulk::alloc::region_usage,unsigned long,unsigned long)#1},std::allocator<void caulk::alloc::allocator_enumerate<caulk::alloc::bitmap_allocator<caulk::alloc::embed_block_memory,16368ul,256ul,6ul>>(caulk::alloc::bitmap_allocator<caulk::alloc::embed_block_memory,16368ul,256ul,6ul> &,caulk::option_set<caulk::alloc::region_usage,unsigned int>,std::function<void ()(caulk::alloc::region_usage,caulk::alloc::block)> const&)::{lambda(caulk::alloc::region_usage,unsigned long,unsigned long)#1}>,void ()(caulk::alloc::region_usage,unsigned long,unsigned long)>::__clone(uint64_t a1)
{
  __n128 result = operator new(0x10uLL);
  uint64_t v3 = *(void *)(a1 + 8);
  *__n128 result = &unk_26C2AABE8;
  result[1] = v3;
  return result;
}

void std::__function::__func<void caulk::alloc::allocator_enumerate<caulk::alloc::bitmap_allocator<caulk::alloc::embed_block_memory,16368ul,256ul,6ul>>(caulk::alloc::bitmap_allocator<caulk::alloc::embed_block_memory,16368ul,256ul,6ul> &,caulk::option_set<caulk::alloc::region_usage,unsigned int>,std::function<void ()(caulk::alloc::region_usage,caulk::alloc::block)> const&)::{lambda(caulk::alloc::region_usage,unsigned long,unsigned long)#1},std::allocator<void caulk::alloc::allocator_enumerate<caulk::alloc::bitmap_allocator<caulk::alloc::embed_block_memory,16368ul,256ul,6ul>>(caulk::alloc::bitmap_allocator<caulk::alloc::embed_block_memory,16368ul,256ul,6ul> &,caulk::option_set<caulk::alloc::region_usage,unsigned int>,std::function<void ()(caulk::alloc::region_usage,caulk::alloc::block)> const&)::{lambda(caulk::alloc::region_usage,unsigned long,unsigned long)#1}>,void ()(caulk::alloc::region_usage,unsigned long,unsigned long)>::~__func()
{
}

void *std::__function::__func<void caulk::alloc::base_allocator::formatter::summarize_blocks_by_size<caulk::alloc::bitmap_allocator<caulk::alloc::embed_block_memory,16368ul,256ul,6ul>>(caulk::alloc::bitmap_allocator<caulk::alloc::embed_block_memory,16368ul,256ul,6ul> &,unsigned long)::{lambda(caulk::alloc::region_usage,caulk::alloc::block)#1},std::allocator<void caulk::alloc::base_allocator::formatter::summarize_blocks_by_size<caulk::alloc::bitmap_allocator<caulk::alloc::embed_block_memory,16368ul,256ul,6ul>>(caulk::alloc::bitmap_allocator<caulk::alloc::embed_block_memory,16368ul,256ul,6ul> &,unsigned long)::{lambda(caulk::alloc::region_usage,caulk::alloc::block)#1}>,void ()(caulk::alloc::region_usage,caulk::alloc::block)>::target_type()
{
}

uint64_t std::__function::__func<void caulk::alloc::base_allocator::formatter::summarize_blocks_by_size<caulk::alloc::bitmap_allocator<caulk::alloc::embed_block_memory,16368ul,256ul,6ul>>(caulk::alloc::bitmap_allocator<caulk::alloc::embed_block_memory,16368ul,256ul,6ul> &,unsigned long)::{lambda(caulk::alloc::region_usage,caulk::alloc::block)#1},std::allocator<void caulk::alloc::base_allocator::formatter::summarize_blocks_by_size<caulk::alloc::bitmap_allocator<caulk::alloc::embed_block_memory,16368ul,256ul,6ul>>(caulk::alloc::bitmap_allocator<caulk::alloc::embed_block_memory,16368ul,256ul,6ul> &,unsigned long)::{lambda(caulk::alloc::region_usage,caulk::alloc::block)#1}>,void ()(caulk::alloc::region_usage,caulk::alloc::block)>::target(uint64_t a1, uint64_t a2)
{
  if (std::type_info::operator==[abi:ne180100](*(void *)(a2 + 8), (uint64_t)"ZN5caulk5alloc14base_allocator9formatter24summarize_blocks_by_sizeINS0_16bitmap_allocatorINS0_18embed_block_memoryELm16368ELm256ELm6EEEEEvRT_mEUlNS0_12region_usageENS0_5blockEE_"))
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

uint64_t **std::__function::__func<void caulk::alloc::base_allocator::formatter::summarize_blocks_by_size<caulk::alloc::bitmap_allocator<caulk::alloc::embed_block_memory,16368ul,256ul,6ul>>(caulk::alloc::bitmap_allocator<caulk::alloc::embed_block_memory,16368ul,256ul,6ul> &,unsigned long)::{lambda(caulk::alloc::region_usage,caulk::alloc::block)#1},std::allocator<void caulk::alloc::base_allocator::formatter::summarize_blocks_by_size<caulk::alloc::bitmap_allocator<caulk::alloc::embed_block_memory,16368ul,256ul,6ul>>(caulk::alloc::bitmap_allocator<caulk::alloc::embed_block_memory,16368ul,256ul,6ul> &,unsigned long)::{lambda(caulk::alloc::region_usage,caulk::alloc::block)#1}>,void ()(caulk::alloc::region_usage,caulk::alloc::block)>::operator()(uint64_t **result, int *a2, uint64_t a3)
{
  int v3 = *a2;
  if ((*a2 - 3) >= 0xFFFFFFFE)
  {
    int v4 = result;
    unint64_t v5 = *(void *)(a3 + 8);
    unint64_t v6 = v5 & 0x1FFFFFFFFFFFFFFFLL;
    unint64_t v7 = (v5 >> 4) & 0x1FFFFFFFFFFFFFFLL;
    if (v6 <= 0xF423F) {
      unint64_t v8 = ((v6 + 1023) >> 10) | 0x2000000000000000;
    }
    else {
      unint64_t v8 = ((v6 + 0xFFFFF) >> 20) | 0x4000000000000000;
    }
    if (v7 >= 0x271) {
      unint64_t v9 = v8;
    }
    else {
      unint64_t v9 = v6;
    }
    char v11 = (uint64_t *)(v9 | ((unint64_t)(v3 == 2) << 63));
    __n128 result = std::__tree<std::__value_type<unsigned long long,unsigned int>,std::__map_value_compare<unsigned long long,std::__value_type<unsigned long long,unsigned int>,std::less<unsigned long long>,true>,std::allocator<std::__value_type<unsigned long long,unsigned int>>>::__emplace_unique_key_args<unsigned long long,std::piecewise_construct_t const&,std::tuple<unsigned long long const&>,std::tuple<>>((uint64_t **)result[1], (unint64_t)v11, &v11);
    ++*((_DWORD *)result + 10);
    if (v3 == 2)
    {
      int v10 = v4 + 4;
    }
    else
    {
      ++*v4[2];
      int v10 = v4 + 3;
    }
    **v10 += v6;
  }
  return result;
}

__n128 std::__function::__func<void caulk::alloc::base_allocator::formatter::summarize_blocks_by_size<caulk::alloc::bitmap_allocator<caulk::alloc::embed_block_memory,16368ul,256ul,6ul>>(caulk::alloc::bitmap_allocator<caulk::alloc::embed_block_memory,16368ul,256ul,6ul> &,unsigned long)::{lambda(caulk::alloc::region_usage,caulk::alloc::block)#1},std::allocator<void caulk::alloc::base_allocator::formatter::summarize_blocks_by_size<caulk::alloc::bitmap_allocator<caulk::alloc::embed_block_memory,16368ul,256ul,6ul>>(caulk::alloc::bitmap_allocator<caulk::alloc::embed_block_memory,16368ul,256ul,6ul> &,unsigned long)::{lambda(caulk::alloc::region_usage,caulk::alloc::block)#1}>,void ()(caulk::alloc::region_usage,caulk::alloc::block)>::__clone(uint64_t a1, uint64_t a2)
{
  *(void *)a2 = &unk_26C2AA610;
  __n128 result = *(__n128 *)(a1 + 8);
  *(_OWORD *)(a2 + 24) = *(_OWORD *)(a1 + 24);
  *(__n128 *)(a2 + 8) = result;
  return result;
}

__n128 std::__function::__func<void caulk::alloc::base_allocator::formatter::summarize_blocks_by_size<caulk::alloc::bitmap_allocator<caulk::alloc::embed_block_memory,16368ul,256ul,6ul>>(caulk::alloc::bitmap_allocator<caulk::alloc::embed_block_memory,16368ul,256ul,6ul> &,unsigned long)::{lambda(caulk::alloc::region_usage,caulk::alloc::block)#1},std::allocator<void caulk::alloc::base_allocator::formatter::summarize_blocks_by_size<caulk::alloc::bitmap_allocator<caulk::alloc::embed_block_memory,16368ul,256ul,6ul>>(caulk::alloc::bitmap_allocator<caulk::alloc::embed_block_memory,16368ul,256ul,6ul> &,unsigned long)::{lambda(caulk::alloc::region_usage,caulk::alloc::block)#1}>,void ()(caulk::alloc::region_usage,caulk::alloc::block)>::__clone(uint64_t a1)
{
  uint64_t v2 = (char *)operator new(0x28uLL);
  *(void *)uint64_t v2 = &unk_26C2AA610;
  *(_OWORD *)(v2 + 8) = *(_OWORD *)(a1 + 8);
  __n128 result = *(__n128 *)(a1 + 24);
  *(__n128 *)(v2 + 24) = result;
  return result;
}

void std::__function::__func<void caulk::alloc::base_allocator::formatter::summarize_blocks_by_size<caulk::alloc::bitmap_allocator<caulk::alloc::embed_block_memory,16368ul,256ul,6ul>>(caulk::alloc::bitmap_allocator<caulk::alloc::embed_block_memory,16368ul,256ul,6ul> &,unsigned long)::{lambda(caulk::alloc::region_usage,caulk::alloc::block)#1},std::allocator<void caulk::alloc::base_allocator::formatter::summarize_blocks_by_size<caulk::alloc::bitmap_allocator<caulk::alloc::embed_block_memory,16368ul,256ul,6ul>>(caulk::alloc::bitmap_allocator<caulk::alloc::embed_block_memory,16368ul,256ul,6ul> &,unsigned long)::{lambda(caulk::alloc::region_usage,caulk::alloc::block)#1}>,void ()(caulk::alloc::region_usage,caulk::alloc::block)>::~__func()
{
}

void *std::operator<<[abi:ne180100]<std::char_traits<char>>(void *a1, char a2)
{
  int v4 = (char *)a1 + *(void *)(*a1 - 24);
  if (*((_DWORD *)v4 + 36) == -1)
  {
    std::ios_base::getloc((const std::ios_base *)((char *)a1 + *(void *)(*a1 - 24)));
    unint64_t v5 = std::locale::use_facet(&v8, MEMORY[0x263F8C108]);
    int v6 = ((uint64_t (*)(const std::locale::facet *, uint64_t))v5->__vftable[2].~facet_0)(v5, 32);
    std::locale::~locale(&v8);
    *((_DWORD *)v4 + 36) = v6;
  }
  *((_DWORD *)v4 + 36) = a2;
  return a1;
}

void sub_210872A18(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, std::locale a10)
{
}

void caulk::alloc::base_allocator::formatter::print_allocator<caulk::alloc::bitmap_allocator<caulk::alloc::embed_block_memory,16368ul,16ul,6ul>>(caulk::alloc::base_allocator::formatter *this, uint64_t a2, uint64_t a3)
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  *((_DWORD *)this + 2) += 2;
  if (*(char *)(a2 + 23) < 0)
  {
    std::string::size_type v5 = *(void *)(a2 + 8);
    if (!v5) {
      goto LABEL_8;
    }
    std::string::__init_copy_ctor_external(&__p, *(const std::string::value_type **)a2, v5);
  }
  else
  {
    if (!*(unsigned char *)(a2 + 23)) {
      goto LABEL_8;
    }
    std::string __p = *(std::string *)a2;
  }
  caulk::alloc::base_allocator::formatter::operator<<<std::string>(this, (uint64_t)&__p);
  caulk::alloc::base_allocator::formatter::emit_string(this, ": ");
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__p.__r_.__value_.__l.__data_);
  }
LABEL_8:
  caulk::alloc::base_allocator::formatter::emit_string(this, "bitmap_allocator @ ");
  caulk::alloc::base_allocator::formatter::check_line_start(this);
  std::ostream::operator<<();
  caulk::alloc::base_allocator::formatter::emit_string(this, ", block size ");
  caulk::alloc::base_allocator::formatter::check_line_start(this);
  std::ostream::operator<<();
  caulk::alloc::base_allocator::formatter::emit_string(this, ", slot size ");
  caulk::alloc::base_allocator::formatter::check_line_start(this);
  std::ostream::operator<<();
  caulk::alloc::base_allocator::formatter::emit_string(this, ", ");
  caulk::alloc::base_allocator::formatter::check_line_start(this);
  std::ostream::operator<<();
  caulk::alloc::base_allocator::formatter::emit_string(this, " slots, ");
  caulk::alloc::base_allocator::formatter::emit_string(this, "max size ");
  caulk::alloc::base_allocator::formatter::check_line_start(this);
  std::ostream::operator<<();
  caulk::alloc::base_allocator::formatter::emit_string(this, ", memory ");
  caulk::alloc::base_allocator::formatter::check_line_start(this);
  std::ostream::operator<<();
  caulk::alloc::base_allocator::formatter::emit_string(this, ":");
  caulk::alloc::base_allocator::formatter::check_line_start(this);
  std::ostream::operator<<();
  caulk::alloc::base_allocator::formatter::emit_string(this, "\n");
  *((_DWORD *)this + 2) += 2;
  caulk::alloc::base_allocator::formatter::emit_string(this, "state bits:  ");
  caulk::alloc::base_allocator::formatter::hexdump(this, (char *)(a3 + 8), 0x100uLL);
  caulk::alloc::base_allocator::formatter::emit_string(this, "search hint: ");
  atomic_load((unsigned int *)(a3 + 4));
  caulk::alloc::base_allocator::formatter::check_line_start(this);
  std::ostream::operator<<();
  caulk::alloc::base_allocator::formatter::emit_string(this, "\n");
  char v19 = 0;
  uint64_t v20 = 0;
  uint64_t v17 = 0;
  uint64_t v18 = &v19;
  uint64_t v15 = 0;
  uint64_t v16 = 0;
  int v6 = operator new(0x28uLL);
  *int v6 = &unk_26C2AA5B8;
  v6[1] = &v18;
  void v6[2] = &v17;
  v6[3] = &v16;
  void v6[4] = &v15;
  v21[3] = v6;
  v22[0] = &unk_26C2AAB90;
  v22[1] = v21;
  v22[3] = v22;
  int v23 = 7;
  v24[0] = &unk_26C2AB948;
  v24[1] = caulk::alloc::introspector::local_reader;
  std::string::size_type v25 = v24;
  std::__function::__value_func<void ()(caulk::alloc::region_usage,unsigned long,unsigned long)>::__value_func[abi:ne180100]((uint64_t)v26, (uint64_t)v22);
  char v27 = 1;
  std::__function::__value_func<void ()(caulk::alloc::region_usage,unsigned long,unsigned long)>::~__value_func[abi:ne180100](v22);
  uint64_t v7 = std::function<void * ()(unsigned long,unsigned long)>::operator()((uint64_t)v25, a3, 16368);
  caulk::alloc::bitmap_allocator<caulk::alloc::embed_block_memory,16368ul,16ul,6ul>::introspect(v7, a3, (uint64_t)&v23);
  std::__function::__value_func<void ()(caulk::alloc::region_usage,unsigned long,unsigned long)>::~__value_func[abi:ne180100](v26);
  std::__function::__value_func<void * ()(unsigned long,unsigned long)>::~__value_func[abi:ne180100](v24);
  std::__function::__value_func<void ()(caulk::alloc::region_usage,caulk::alloc::block)>::~__value_func[abi:ne180100](v21);
  caulk::alloc::base_allocator::formatter::check_line_start(this);
  uint64_t v8 = *(void *)this + *(void *)(**(void **)this - 24);
  *(_DWORD *)(v8 + 8) = *(_DWORD *)(v8 + 8) & 0xFFFFFFB5 | 2;
  caulk::alloc::base_allocator::formatter::check_line_start(this);
  std::ostream::operator<<();
  caulk::alloc::base_allocator::formatter::emit_string(this, " allocations for ");
  caulk::alloc::base_allocator::formatter::check_line_start(this);
  std::ostream::operator<<();
  caulk::alloc::base_allocator::formatter::emit_string(this, " bytes");
  caulk::alloc::base_allocator::formatter::emit_string(this, " (");
  caulk::alloc::base_allocator::formatter::check_line_start(this);
  std::ostream::operator<<();
  caulk::alloc::base_allocator::formatter::emit_string(this, "%)");
  caulk::alloc::base_allocator::formatter::emit_string(this, "; ");
  caulk::alloc::base_allocator::formatter::check_line_start(this);
  std::ostream::operator<<();
  caulk::alloc::base_allocator::formatter::emit_string(this, " bytes free\n");
  if (v20)
  {
    caulk::alloc::base_allocator::formatter::emit_string(this, "sizes:");
    unint64_t v9 = v18;
    if (v18 != &v19)
    {
      char v10 = 0;
      do
      {
        if ((v10 & 1) == 0 && (v9[4] & 0x8000000000000000) != 0)
        {
          caulk::alloc::base_allocator::formatter::emit_string(this, "\n");
          caulk::alloc::base_allocator::formatter::emit_string(this, "free sizes:");
          char v10 = 1;
        }
        caulk::alloc::base_allocator::formatter::emit_string(this, " ");
        caulk::alloc::base_allocator::formatter::check_line_start(this);
        std::ostream::operator<<();
        caulk::alloc::base_allocator::formatter::emit_string(this, caulk::alloc::base_allocator::formatter::summarize_blocks_by_size<caulk::alloc::tracking_allocator<caulk::alloc::page_allocator>>(caulk::alloc::tracking_allocator<caulk::alloc::page_allocator> &,unsigned long)::sizeLabels[(v9[4] >> 61) & 3]);
        caulk::alloc::base_allocator::formatter::emit_string(this, "[");
        caulk::alloc::base_allocator::formatter::check_line_start(this);
        std::ostream::operator<<();
        caulk::alloc::base_allocator::formatter::emit_string(this, "]");
        char v11 = (void *)v9[1];
        if (v11)
        {
          do
          {
            uint64_t v12 = (void **)v11;
            char v11 = (void *)*v11;
          }
          while (v11);
        }
        else
        {
          do
          {
            uint64_t v12 = (void **)v9[2];
            BOOL v13 = *v12 == v9;
            unint64_t v9 = v12;
          }
          while (!v13);
        }
        unint64_t v9 = v12;
      }
      while (v12 != &v19);
    }
    caulk::alloc::base_allocator::formatter::emit_string(this, "\n");
  }
  std::__tree<std::__value_type<unsigned long long,unsigned int>,std::__map_value_compare<unsigned long long,std::__value_type<unsigned long long,unsigned int>,std::less<unsigned long long>,true>,std::allocator<std::__value_type<unsigned long long,unsigned int>>>::destroy(v19);
  *((_DWORD *)this + 2) -= 4;
}

void sub_210872FF8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, void *a20,uint64_t a21,char a22)
{
}

void *std::__function::__func<void caulk::alloc::allocator_enumerate<caulk::alloc::bitmap_allocator<caulk::alloc::embed_block_memory,16368ul,16ul,6ul>>(caulk::alloc::bitmap_allocator<caulk::alloc::embed_block_memory,16368ul,16ul,6ul> &,caulk::option_set<caulk::alloc::region_usage,unsigned int>,std::function<void ()(caulk::alloc::region_usage,caulk::alloc::block)> const&)::{lambda(caulk::alloc::region_usage,unsigned long,unsigned long)#1},std::allocator<void caulk::alloc::allocator_enumerate<caulk::alloc::bitmap_allocator<caulk::alloc::embed_block_memory,16368ul,16ul,6ul>>(caulk::alloc::bitmap_allocator<caulk::alloc::embed_block_memory,16368ul,16ul,6ul> &,caulk::option_set<caulk::alloc::region_usage,unsigned int>,std::function<void ()(caulk::alloc::region_usage,caulk::alloc::block)> const&)::{lambda(caulk::alloc::region_usage,unsigned long,unsigned long)#1}>,void ()(caulk::alloc::region_usage,unsigned long,unsigned long)>::target_type()
{
}

uint64_t std::__function::__func<void caulk::alloc::allocator_enumerate<caulk::alloc::bitmap_allocator<caulk::alloc::embed_block_memory,16368ul,16ul,6ul>>(caulk::alloc::bitmap_allocator<caulk::alloc::embed_block_memory,16368ul,16ul,6ul> &,caulk::option_set<caulk::alloc::region_usage,unsigned int>,std::function<void ()(caulk::alloc::region_usage,caulk::alloc::block)> const&)::{lambda(caulk::alloc::region_usage,unsigned long,unsigned long)#1},std::allocator<void caulk::alloc::allocator_enumerate<caulk::alloc::bitmap_allocator<caulk::alloc::embed_block_memory,16368ul,16ul,6ul>>(caulk::alloc::bitmap_allocator<caulk::alloc::embed_block_memory,16368ul,16ul,6ul> &,caulk::option_set<caulk::alloc::region_usage,unsigned int>,std::function<void ()(caulk::alloc::region_usage,caulk::alloc::block)> const&)::{lambda(caulk::alloc::region_usage,unsigned long,unsigned long)#1}>,void ()(caulk::alloc::region_usage,unsigned long,unsigned long)>::target(uint64_t a1, uint64_t a2)
{
  if (std::type_info::operator==[abi:ne180100](*(void *)(a2 + 8), (uint64_t)"ZN5caulk5alloc19allocator_enumerateINS0_16bitmap_allocatorINS0_18embed_block_memoryELm16368ELm16ELm6EEEEEvRT_NS_10option_setINS0_12region_usageEjEERKNSt3__18functionIFvS8_NS0_5blockEEEEEUlS8_mmE_"))
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

uint64_t std::__function::__func<void caulk::alloc::allocator_enumerate<caulk::alloc::bitmap_allocator<caulk::alloc::embed_block_memory,16368ul,16ul,6ul>>(caulk::alloc::bitmap_allocator<caulk::alloc::embed_block_memory,16368ul,16ul,6ul> &,caulk::option_set<caulk::alloc::region_usage,unsigned int>,std::function<void ()(caulk::alloc::region_usage,caulk::alloc::block)> const&)::{lambda(caulk::alloc::region_usage,unsigned long,unsigned long)#1},std::allocator<void caulk::alloc::allocator_enumerate<caulk::alloc::bitmap_allocator<caulk::alloc::embed_block_memory,16368ul,16ul,6ul>>(caulk::alloc::bitmap_allocator<caulk::alloc::embed_block_memory,16368ul,16ul,6ul> &,caulk::option_set<caulk::alloc::region_usage,unsigned int>,std::function<void ()(caulk::alloc::region_usage,caulk::alloc::block)> const&)::{lambda(caulk::alloc::region_usage,unsigned long,unsigned long)#1}>,void ()(caulk::alloc::region_usage,unsigned long,unsigned long)>::operator()(uint64_t a1, int *a2, uint64_t *a3, uint64_t *a4)
{
  return std::function<void ()(caulk::alloc::region_usage,caulk::alloc::block)>::operator()(*(void *)(*(void *)(a1 + 8) + 24), *a2, *a3, *a4);
}

uint64_t std::__function::__func<void caulk::alloc::allocator_enumerate<caulk::alloc::bitmap_allocator<caulk::alloc::embed_block_memory,16368ul,16ul,6ul>>(caulk::alloc::bitmap_allocator<caulk::alloc::embed_block_memory,16368ul,16ul,6ul> &,caulk::option_set<caulk::alloc::region_usage,unsigned int>,std::function<void ()(caulk::alloc::region_usage,caulk::alloc::block)> const&)::{lambda(caulk::alloc::region_usage,unsigned long,unsigned long)#1},std::allocator<void caulk::alloc::allocator_enumerate<caulk::alloc::bitmap_allocator<caulk::alloc::embed_block_memory,16368ul,16ul,6ul>>(caulk::alloc::bitmap_allocator<caulk::alloc::embed_block_memory,16368ul,16ul,6ul> &,caulk::option_set<caulk::alloc::region_usage,unsigned int>,std::function<void ()(caulk::alloc::region_usage,caulk::alloc::block)> const&)::{lambda(caulk::alloc::region_usage,unsigned long,unsigned long)#1}>,void ()(caulk::alloc::region_usage,unsigned long,unsigned long)>::__clone(uint64_t result, void *a2)
{
  uint64_t v2 = *(void *)(result + 8);
  *a2 = &unk_26C2AAB90;
  a2[1] = v2;
  return result;
}

void *std::__function::__func<void caulk::alloc::allocator_enumerate<caulk::alloc::bitmap_allocator<caulk::alloc::embed_block_memory,16368ul,16ul,6ul>>(caulk::alloc::bitmap_allocator<caulk::alloc::embed_block_memory,16368ul,16ul,6ul> &,caulk::option_set<caulk::alloc::region_usage,unsigned int>,std::function<void ()(caulk::alloc::region_usage,caulk::alloc::block)> const&)::{lambda(caulk::alloc::region_usage,unsigned long,unsigned long)#1},std::allocator<void caulk::alloc::allocator_enumerate<caulk::alloc::bitmap_allocator<caulk::alloc::embed_block_memory,16368ul,16ul,6ul>>(caulk::alloc::bitmap_allocator<caulk::alloc::embed_block_memory,16368ul,16ul,6ul> &,caulk::option_set<caulk::alloc::region_usage,unsigned int>,std::function<void ()(caulk::alloc::region_usage,caulk::alloc::block)> const&)::{lambda(caulk::alloc::region_usage,unsigned long,unsigned long)#1}>,void ()(caulk::alloc::region_usage,unsigned long,unsigned long)>::__clone(uint64_t a1)
{
  __n128 result = operator new(0x10uLL);
  uint64_t v3 = *(void *)(a1 + 8);
  *__n128 result = &unk_26C2AAB90;
  result[1] = v3;
  return result;
}

void std::__function::__func<void caulk::alloc::allocator_enumerate<caulk::alloc::bitmap_allocator<caulk::alloc::embed_block_memory,16368ul,16ul,6ul>>(caulk::alloc::bitmap_allocator<caulk::alloc::embed_block_memory,16368ul,16ul,6ul> &,caulk::option_set<caulk::alloc::region_usage,unsigned int>,std::function<void ()(caulk::alloc::region_usage,caulk::alloc::block)> const&)::{lambda(caulk::alloc::region_usage,unsigned long,unsigned long)#1},std::allocator<void caulk::alloc::allocator_enumerate<caulk::alloc::bitmap_allocator<caulk::alloc::embed_block_memory,16368ul,16ul,6ul>>(caulk::alloc::bitmap_allocator<caulk::alloc::embed_block_memory,16368ul,16ul,6ul> &,caulk::option_set<caulk::alloc::region_usage,unsigned int>,std::function<void ()(caulk::alloc::region_usage,caulk::alloc::block)> const&)::{lambda(caulk::alloc::region_usage,unsigned long,unsigned long)#1}>,void ()(caulk::alloc::region_usage,unsigned long,unsigned long)>::~__func()
{
}

void *std::__function::__func<void caulk::alloc::base_allocator::formatter::summarize_blocks_by_size<caulk::alloc::bitmap_allocator<caulk::alloc::embed_block_memory,16368ul,16ul,6ul>>(caulk::alloc::bitmap_allocator<caulk::alloc::embed_block_memory,16368ul,16ul,6ul> &,unsigned long)::{lambda(caulk::alloc::region_usage,caulk::alloc::block)#1},std::allocator<void caulk::alloc::base_allocator::formatter::summarize_blocks_by_size<caulk::alloc::bitmap_allocator<caulk::alloc::embed_block_memory,16368ul,16ul,6ul>>(caulk::alloc::bitmap_allocator<caulk::alloc::embed_block_memory,16368ul,16ul,6ul> &,unsigned long)::{lambda(caulk::alloc::region_usage,caulk::alloc::block)#1}>,void ()(caulk::alloc::region_usage,caulk::alloc::block)>::target_type()
{
}

uint64_t std::__function::__func<void caulk::alloc::base_allocator::formatter::summarize_blocks_by_size<caulk::alloc::bitmap_allocator<caulk::alloc::embed_block_memory,16368ul,16ul,6ul>>(caulk::alloc::bitmap_allocator<caulk::alloc::embed_block_memory,16368ul,16ul,6ul> &,unsigned long)::{lambda(caulk::alloc::region_usage,caulk::alloc::block)#1},std::allocator<void caulk::alloc::base_allocator::formatter::summarize_blocks_by_size<caulk::alloc::bitmap_allocator<caulk::alloc::embed_block_memory,16368ul,16ul,6ul>>(caulk::alloc::bitmap_allocator<caulk::alloc::embed_block_memory,16368ul,16ul,6ul> &,unsigned long)::{lambda(caulk::alloc::region_usage,caulk::alloc::block)#1}>,void ()(caulk::alloc::region_usage,caulk::alloc::block)>::target(uint64_t a1, uint64_t a2)
{
  if (std::type_info::operator==[abi:ne180100](*(void *)(a2 + 8), (uint64_t)"ZN5caulk5alloc14base_allocator9formatter24summarize_blocks_by_sizeINS0_16bitmap_allocatorINS0_18embed_block_memoryELm16368ELm16ELm6EEEEEvRT_mEUlNS0_12region_usageENS0_5blockEE_"))
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

uint64_t **std::__function::__func<void caulk::alloc::base_allocator::formatter::summarize_blocks_by_size<caulk::alloc::bitmap_allocator<caulk::alloc::embed_block_memory,16368ul,16ul,6ul>>(caulk::alloc::bitmap_allocator<caulk::alloc::embed_block_memory,16368ul,16ul,6ul> &,unsigned long)::{lambda(caulk::alloc::region_usage,caulk::alloc::block)#1},std::allocator<void caulk::alloc::base_allocator::formatter::summarize_blocks_by_size<caulk::alloc::bitmap_allocator<caulk::alloc::embed_block_memory,16368ul,16ul,6ul>>(caulk::alloc::bitmap_allocator<caulk::alloc::embed_block_memory,16368ul,16ul,6ul> &,unsigned long)::{lambda(caulk::alloc::region_usage,caulk::alloc::block)#1}>,void ()(caulk::alloc::region_usage,caulk::alloc::block)>::operator()(uint64_t **result, int *a2, uint64_t a3)
{
  int v3 = *a2;
  if ((*a2 - 3) >= 0xFFFFFFFE)
  {
    int v4 = result;
    unint64_t v5 = *(void *)(a3 + 8);
    unint64_t v6 = v5 & 0x1FFFFFFFFFFFFFFFLL;
    unint64_t v7 = (v5 >> 4) & 0x1FFFFFFFFFFFFFFLL;
    if (v6 <= 0xF423F) {
      unint64_t v8 = ((v6 + 1023) >> 10) | 0x2000000000000000;
    }
    else {
      unint64_t v8 = ((v6 + 0xFFFFF) >> 20) | 0x4000000000000000;
    }
    if (v7 >= 0x271) {
      unint64_t v9 = v8;
    }
    else {
      unint64_t v9 = v6;
    }
    char v11 = (uint64_t *)(v9 | ((unint64_t)(v3 == 2) << 63));
    __n128 result = std::__tree<std::__value_type<unsigned long long,unsigned int>,std::__map_value_compare<unsigned long long,std::__value_type<unsigned long long,unsigned int>,std::less<unsigned long long>,true>,std::allocator<std::__value_type<unsigned long long,unsigned int>>>::__emplace_unique_key_args<unsigned long long,std::piecewise_construct_t const&,std::tuple<unsigned long long const&>,std::tuple<>>((uint64_t **)result[1], (unint64_t)v11, &v11);
    ++*((_DWORD *)result + 10);
    if (v3 == 2)
    {
      char v10 = v4 + 4;
    }
    else
    {
      ++*v4[2];
      char v10 = v4 + 3;
    }
    **v10 += v6;
  }
  return result;
}

__n128 std::__function::__func<void caulk::alloc::base_allocator::formatter::summarize_blocks_by_size<caulk::alloc::bitmap_allocator<caulk::alloc::embed_block_memory,16368ul,16ul,6ul>>(caulk::alloc::bitmap_allocator<caulk::alloc::embed_block_memory,16368ul,16ul,6ul> &,unsigned long)::{lambda(caulk::alloc::region_usage,caulk::alloc::block)#1},std::allocator<void caulk::alloc::base_allocator::formatter::summarize_blocks_by_size<caulk::alloc::bitmap_allocator<caulk::alloc::embed_block_memory,16368ul,16ul,6ul>>(caulk::alloc::bitmap_allocator<caulk::alloc::embed_block_memory,16368ul,16ul,6ul> &,unsigned long)::{lambda(caulk::alloc::region_usage,caulk::alloc::block)#1}>,void ()(caulk::alloc::region_usage,caulk::alloc::block)>::__clone(uint64_t a1, uint64_t a2)
{
  *(void *)a2 = &unk_26C2AA5B8;
  __n128 result = *(__n128 *)(a1 + 8);
  *(_OWORD *)(a2 + 24) = *(_OWORD *)(a1 + 24);
  *(__n128 *)(a2 + 8) = result;
  return result;
}

__n128 std::__function::__func<void caulk::alloc::base_allocator::formatter::summarize_blocks_by_size<caulk::alloc::bitmap_allocator<caulk::alloc::embed_block_memory,16368ul,16ul,6ul>>(caulk::alloc::bitmap_allocator<caulk::alloc::embed_block_memory,16368ul,16ul,6ul> &,unsigned long)::{lambda(caulk::alloc::region_usage,caulk::alloc::block)#1},std::allocator<void caulk::alloc::base_allocator::formatter::summarize_blocks_by_size<caulk::alloc::bitmap_allocator<caulk::alloc::embed_block_memory,16368ul,16ul,6ul>>(caulk::alloc::bitmap_allocator<caulk::alloc::embed_block_memory,16368ul,16ul,6ul> &,unsigned long)::{lambda(caulk::alloc::region_usage,caulk::alloc::block)#1}>,void ()(caulk::alloc::region_usage,caulk::alloc::block)>::__clone(uint64_t a1)
{
  uint64_t v2 = (char *)operator new(0x28uLL);
  *(void *)uint64_t v2 = &unk_26C2AA5B8;
  *(_OWORD *)(v2 + 8) = *(_OWORD *)(a1 + 8);
  __n128 result = *(__n128 *)(a1 + 24);
  *(__n128 *)(v2 + 24) = result;
  return result;
}

void std::__function::__func<void caulk::alloc::base_allocator::formatter::summarize_blocks_by_size<caulk::alloc::bitmap_allocator<caulk::alloc::embed_block_memory,16368ul,16ul,6ul>>(caulk::alloc::bitmap_allocator<caulk::alloc::embed_block_memory,16368ul,16ul,6ul> &,unsigned long)::{lambda(caulk::alloc::region_usage,caulk::alloc::block)#1},std::allocator<void caulk::alloc::base_allocator::formatter::summarize_blocks_by_size<caulk::alloc::bitmap_allocator<caulk::alloc::embed_block_memory,16368ul,16ul,6ul>>(caulk::alloc::bitmap_allocator<caulk::alloc::embed_block_memory,16368ul,16ul,6ul> &,unsigned long)::{lambda(caulk::alloc::region_usage,caulk::alloc::block)#1}>,void ()(caulk::alloc::region_usage,caulk::alloc::block)>::~__func()
{
}

BOOL caulk::alloc::resource<caulk::alloc::dsw_allocator2<true>,caulk::alloc::rt_safe_memory_resource>::do_is_equal(uint64_t a1, uint64_t a2)
{
  return a1 == a2;
}

unint64_t *caulk::concurrent::skiplist<unsigned long,caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,256ul,6ul>::node_impl<caulk::alloc::tree_allocator<caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,256ul,6ul>>::node_header,caulk::alloc::embed_block_memory> *,5,(caulk::concurrent::skiplist_options)1>::emplace<caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,256ul,6ul>::node_impl<caulk::alloc::tree_allocator<caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,256ul,6ul>>::node_header,caulk::alloc::embed_block_memory> *>(unint64_t *result, unint64_t a2, void *a3)
{
  if (*result >= a2 || (unint64_t v4 = (unint64_t)result, result[14] <= a2))
  {
    __break(1u);
    return result;
  }
  uint64_t v5 = (uint64_t)(result + 20);
  caulk::concurrent::details::node_allocator<void *,caulk::alloc::detail::tracked_block,10ul,(caulk::concurrent::skiplist_options)0>::begin_traversal();
  unint64_t v35 = a2;
  unint64_t v6 = (unint64_t *)caulk::concurrent::skiplist<unsigned long,caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,256ul,6ul>::node_impl<caulk::alloc::tree_allocator<caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,256ul,6ul>>::node_header,caulk::alloc::embed_block_memory> *,5,(caulk::concurrent::skiplist_options)1>::search_to_level<caulk::concurrent::skiplist<unsigned long,caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,256ul,6ul>::node_impl<caulk::alloc::tree_allocator<caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,256ul,6ul>>::node_header,caulk::alloc::embed_block_memory> *,5,(caulk::concurrent::skiplist_options)1>::key_le>(v4, &v35, 0);
  unint64_t v8 = *v6;
  if (*v6 == a2) {
    return (unint64_t *)caulk::concurrent::details::node_allocator<unsigned long,caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,256ul,6ul>::node_impl<caulk::alloc::tree_allocator<caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,256ul,6ul>>::node_header,caulk::alloc::embed_block_memory> *,5ul,(caulk::concurrent::skiplist_options)1>::end_traversal(v5, v8);
  }
  unint64_t v9 = v6;
  unint64_t v10 = v7;
  int v11 = 0;
  int value = 0;
  for (uint64_t i = 1; i != 4; ++i)
  {
    if (i == 1)
    {
      caulk::concurrent::skiplist<unsigned long,caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,256ul,6ul>::node_impl<caulk::alloc::tree_allocator<caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,256ul,6ul>>::node_header,caulk::alloc::embed_block_memory> *,5,(caulk::concurrent::skiplist_options)1>::random_engine();
      int value = caulk::multi_simple_random<unsigned int,4ul,std::uniform_int_distribution<unsigned int>,std::mersenne_twister_engine<unsigned int,32ul,624ul,397ul,31ul,2567483615u,11ul,4294967295u,7ul,2636928640u,15ul,4022730752u,18ul,1812433253u>>::next_value((uint64_t)&caulk::concurrent::skiplist<unsigned long,caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,256ul,6ul>::node_impl<caulk::alloc::tree_allocator<caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,256ul,6ul>>::node_header,caulk::alloc::embed_block_memory> *,5,(caulk::concurrent::skiplist_options)1>::random_engine(void)::engine);
      int v11 = 3;
    }
    if ((v11 & ~value) != 0) {
      break;
    }
    v11 *= 4;
  }
  uint64_t v14 = 0;
  uint64_t v15 = *(void *)(v4 + 176);
  while (1)
  {
    unint64_t v16 = *(void *)&caulk::concurrent::details::node_allocator<unsigned long,caulk::alloc::chunk_allocator<caulk::alloc::page_allocator,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,16ul,6ul>::node_impl<caulk::alloc::tree_allocator<caulk::alloc::chunk_allocator<caulk::alloc::page_allocator,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,16ul,6ul>>::node_header,caulk::alloc::embed_block_memory> *,5ul,(caulk::concurrent::skiplist_options)1>::node_sizes[8 * v14];
    if (v16 >= *(void *)&caulk::concurrent::details::node_allocator<unsigned long,caulk::alloc::chunk_allocator<caulk::alloc::page_allocator,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,16ul,6ul>::node_impl<caulk::alloc::tree_allocator<caulk::alloc::chunk_allocator<caulk::alloc::page_allocator,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,16ul,6ul>>::node_header,caulk::alloc::embed_block_memory> *,5ul,(caulk::concurrent::skiplist_options)1>::node_sizes[8 * i - 8]) {
      break;
    }
    if (++v14 == 5)
    {
      unint64_t v17 = 0;
      goto LABEL_17;
    }
  }
  uint64_t v18 = v15 + 64 + 32 * v14;
  char v19 = caulk::concurrent::stack<caulk::alloc::free_block,caulk::concurrent::intrusive_single_link_node<caulk::alloc::free_block>>::pop();
  if (v19)
  {
    unint64_t v17 = (unint64_t)v19;
    atomic_fetch_add((atomic_ullong *volatile)(v18 + 16), 0xFFFFFFFFFFFFFFFFLL);
  }
  else
  {
    unint64_t v17 = caulk::alloc::cascading_allocator<caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::serial_allocator,caulk::alloc::embed_block_memory,16384ul>>::allocate(v15, v16);
  }
  uint64_t v5 = v4 + 160;
LABEL_17:
  *(unsigned char *)(v17 + 16) = i;
  *(_WORD *)(v17 + 17) = 1;
  *(unsigned char *)(v17 + 19) = i;
  *(void *)unint64_t v17 = a2;
  *(void *)(v17 + 8) = 0;
  *(void *)(v17 + 8) = *a3;
  *(void *)(v17 + 32) = 0;
  *(void *)(v17 + 40) = 0;
  *(void *)(v17 + 24) = 0;
  if ((_BYTE)i)
  {
    uint64_t v20 = (unint64_t *)(v17 + 40);
    uint64_t v21 = i;
    do
    {
      atomic_store(0, v20 - 1);
      atomic_store(0, v20);
      v20 += 2;
      --v21;
    }
    while (v21);
  }
  unint64_t v22 = 0;
  __dmb(0xBu);
  while (2)
  {
    if (*v9 == *(void *)v17)
    {
LABEL_37:
      unint64_t v32 = 0;
      goto LABEL_38;
    }
    while (1)
    {
      int v23 = &v9[2 * v22 + 4];
      unint64_t v24 = atomic_load(v23);
      if ((v24 & 2) == 0) {
        break;
      }
      caulk::concurrent::skiplist<unsigned long,caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,256ul,6ul>::node_impl<caulk::alloc::tree_allocator<caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,256ul,6ul>>::node_header,caulk::alloc::embed_block_memory> *,5,(caulk::concurrent::skiplist_options)1>::help_flagged(v4, v22, (unint64_t)v9, v24 & 0xFFFFFFFFFFFFFFFCLL);
LABEL_30:
      unint64_t v28 = *(void *)v17;
      while (1)
      {
        unint64_t v29 = atomic_load(&v9[2 * v22 + 4]);
        unint64_t v10 = v29 & 0xFFFFFFFFFFFFFFFCLL;
        if (v28 < *(void *)(v29 & 0xFFFFFFFFFFFFFFFCLL)) {
          break;
        }
        char v30 = atomic_load((unint64_t *)(v10 + 32));
        if (v30)
        {
          unint64_t v9 = (void *)caulk::concurrent::skiplist<unsigned long,caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,256ul,6ul>::node_impl<caulk::alloc::tree_allocator<caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,256ul,6ul>>::node_header,caulk::alloc::embed_block_memory> *,5,(caulk::concurrent::skiplist_options)1>::try_flag_node(v4, v22, (unint64_t)v9, v10);
          if (!v31) {
            caulk::concurrent::skiplist<unsigned long,caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,256ul,6ul>::node_impl<caulk::alloc::tree_allocator<caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,256ul,6ul>>::node_header,caulk::alloc::embed_block_memory> *,5,(caulk::concurrent::skiplist_options)1>::help_flagged(v4, v22, (unint64_t)v9, v10);
          }
        }
        else
        {
          unint64_t v9 = (void *)v10;
        }
      }
      if (*v9 == *(void *)v17) {
        goto LABEL_37;
      }
    }
    atomic_store(v10, (unint64_t *)(v17 + 16 * v22 + 32));
    unint64_t v25 = v10;
    atomic_compare_exchange_strong((atomic_ullong *volatile)v23, &v25, v17);
    if (v25 != v10)
    {
      if ((v25 & 2) != 0) {
        caulk::concurrent::skiplist<unsigned long,caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,256ul,6ul>::node_impl<caulk::alloc::tree_allocator<caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,256ul,6ul>>::node_header,caulk::alloc::embed_block_memory> *,5,(caulk::concurrent::skiplist_options)1>::help_flagged(v4, v22, (unint64_t)v9, v25 & 0xFFFFFFFFFFFFFFFCLL);
      }
      char v26 = atomic_load(v23);
      if (v26)
      {
        do
        {
          unint64_t v9 = (void *)atomic_load(&v9[2 * v22 + 5]);
          char v27 = atomic_load(&v9[2 * v22 + 4]);
        }
        while ((v27 & 1) != 0);
      }
      goto LABEL_30;
    }
    unint64_t v32 = v17;
LABEL_38:
    if (v32 | v22)
    {
      unint64_t v8 = atomic_load((unint64_t *)(v17 + 32));
      if ((v8 & 1) == 0 && ++v22 != i)
      {
        unint64_t v35 = a2;
        unint64_t v9 = (void *)caulk::concurrent::skiplist<unsigned long,caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,256ul,6ul>::node_impl<caulk::alloc::tree_allocator<caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,256ul,6ul>>::node_header,caulk::alloc::embed_block_memory> *,5,(caulk::concurrent::skiplist_options)1>::search_to_level<caulk::concurrent::skiplist<unsigned long,caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,256ul,6ul>::node_impl<caulk::alloc::tree_allocator<caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,256ul,6ul>>::node_header,caulk::alloc::embed_block_memory> *,5,(caulk::concurrent::skiplist_options)1>::key_le>(v4, &v35, v22);
        unint64_t v10 = v33;
        continue;
      }
    }
    else
    {
      caulk::alloc::multi_free_list<caulk::alloc::cascading_allocator<caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::serial_allocator,caulk::alloc::embed_block_memory,16384ul>>,caulk::concurrent::details::node_allocator<unsigned long,caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,256ul,6ul>::node_impl<caulk::alloc::tree_allocator<caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,256ul,6ul>::node_impl>::node_header,caulk::alloc::embed_block_memory> *,5ul,(caulk::concurrent::skiplist_options)1>::size_generator,8ul,1ul,-1l>::deallocate(*(caulk::alloc::base_allocator **)(v4 + 176), (unint64_t *)v17, *(void *)&caulk::concurrent::details::node_allocator<unsigned long,caulk::alloc::chunk_allocator<caulk::alloc::page_allocator,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,16ul,6ul>::node_impl<caulk::alloc::tree_allocator<caulk::alloc::chunk_allocator<caulk::alloc::page_allocator,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,16ul,6ul>>::node_header,caulk::alloc::embed_block_memory> *,5ul,(caulk::concurrent::skiplist_options)1>::node_sizes[8 * *(unsigned __int8 *)(v17 + 16) - 8]);
    }
    return (unint64_t *)caulk::concurrent::details::node_allocator<unsigned long,caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,256ul,6ul>::node_impl<caulk::alloc::tree_allocator<caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,256ul,6ul>>::node_header,caulk::alloc::embed_block_memory> *,5ul,(caulk::concurrent::skiplist_options)1>::end_traversal(v5, v8);
  }
}

void caulk::concurrent::skiplist<unsigned long,caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,256ul,6ul>::node_impl<caulk::alloc::tree_allocator<caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,256ul,6ul>>::node_header,caulk::alloc::embed_block_memory> *,5,(caulk::concurrent::skiplist_options)1>::random_engine()
{
  {
    caulk::multi_simple_random<unsigned int,4ul,std::uniform_int_distribution<unsigned int>,std::mersenne_twister_engine<unsigned int,32ul,624ul,397ul,31ul,2567483615u,11ul,4294967295u,7ul,2636928640u,15ul,4022730752u,18ul,1812433253u>>::multi_simple_random((uint64_t)&caulk::concurrent::skiplist<unsigned long,caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,256ul,6ul>::node_impl<caulk::alloc::tree_allocator<caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,256ul,6ul>>::node_header,caulk::alloc::embed_block_memory> *,5,(caulk::concurrent::skiplist_options)1>::random_engine(void)::engine);
  }
}

void sub_2108736C0(_Unwind_Exception *a1)
{
}

uint64_t caulk::multi_simple_random<unsigned int,4ul,std::uniform_int_distribution<unsigned int>,std::mersenne_twister_engine<unsigned int,32ul,624ul,397ul,31ul,2567483615u,11ul,4294967295u,7ul,2636928640u,15ul,4022730752u,18ul,1812433253u>>::multi_simple_random(uint64_t a1)
{
  uint64_t v2 = 0;
  uint64_t v3 = a1;
  do
  {
    uint64_t v4 = a1 + 2512 * v2;
    unsigned int v5 = 5489;
    *(_DWORD *)uint64_t v4 = 5489;
    for (uint64_t i = 1; i != 624; ++i)
    {
      unsigned int v5 = i + 1812433253 * (v5 ^ (v5 >> 30));
      *(_DWORD *)(v3 + 4 * i) = v5;
    }
    *(void *)(v4 + 2496) = 0;
    *(unsigned char *)(a1 + 2512 * v2++ + 2504) = 0;
    v3 += 2512;
  }
  while (v2 != 4);
  uint64_t v7 = 0;
  *(void *)(a1 + 10048) = 0xFFFFFFFF00000000;
  uint64_t v8 = a1;
  do
  {
    unsigned int v9 = mach_absolute_time();
    *(_DWORD *)uint64_t v8 = v9;
    for (uint64_t j = 1; j != 624; ++j)
    {
      unsigned int v9 = j + 1812433253 * (v9 ^ (v9 >> 30));
      *(_DWORD *)(v8 + 4 * j) = v9;
    }
    *(void *)(v8 + 2496) = 0;
    ++v7;
    v8 += 2512;
  }
  while (v7 != 4);
  return a1;
}

unint64_t caulk::concurrent::skiplist<void *,caulk::alloc::detail::tracked_block,10,(caulk::concurrent::skiplist_options)0>::emplace<caulk::alloc::detail::tracked_block>(unint64_t result, unint64_t a2, _OWORD *a3)
{
  if (*(void *)(result + 16) >= a2 || (unint64_t v4 = result, *(void *)(result + 216) <= a2))
  {
    __break(1u);
    return result;
  }
  unint64_t v6 = result + 256;
  caulk::concurrent::details::node_allocator<void *,caulk::alloc::detail::tracked_block,10ul,(caulk::concurrent::skiplist_options)0>::begin_traversal();
  unint64_t v37 = a2;
  unint64_t v7 = caulk::concurrent::skiplist<void *,caulk::alloc::detail::tracked_block,10,(caulk::concurrent::skiplist_options)0>::search_to_level<caulk::concurrent::skiplist<void *,caulk::alloc::detail::tracked_block,10,(caulk::concurrent::skiplist_options)0>::key_le>(v4, &v37, 0);
  unint64_t v9 = *(void *)(v7 + 16);
  if (v9 == a2)
  {
LABEL_45:
    uint64_t v35 = 0;
    goto LABEL_46;
  }
  unint64_t v10 = v7;
  unint64_t v11 = v8;
  uint64_t v36 = a3;
  int v12 = 0;
  int value = 0;
  for (uint64_t i = 1; i != 9; ++i)
  {
    if (i == 1)
    {
      caulk::concurrent::skiplist<void *,caulk::alloc::detail::tracked_block,10,(caulk::concurrent::skiplist_options)0>::random_engine();
      int value = caulk::multi_simple_random<unsigned int,4ul,std::uniform_int_distribution<unsigned int>,std::mersenne_twister_engine<unsigned int,32ul,624ul,397ul,31ul,2567483615u,11ul,4294967295u,7ul,2636928640u,15ul,4022730752u,18ul,1812433253u>>::next_value((uint64_t)&caulk::concurrent::skiplist<void *,caulk::alloc::detail::tracked_block,10,(caulk::concurrent::skiplist_options)0>::random_engine(void)::engine);
      int v12 = 3;
    }
    if ((v12 & ~value) != 0) {
      break;
    }
    v12 *= 4;
  }
  uint64_t v15 = 0;
  uint64_t v16 = *(void *)(v4 + 272);
  while (1)
  {
    unint64_t v17 = *(void *)&caulk::alloc::multi_free_list<caulk::alloc::cascading_allocator<caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::serial_allocator,caulk::alloc::embed_block_memory,16384ul>>,caulk::concurrent::details::node_allocator<void *,caulk::alloc::detail::tracked_block,10ul,(caulk::concurrent::skiplist_options)0>::size_generator,8ul,1ul,-1l>::Sizes[8 * v15];
    if (v17 >= *(void *)&caulk::alloc::multi_free_list<caulk::alloc::cascading_allocator<caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::serial_allocator,caulk::alloc::embed_block_memory,16384ul>>,caulk::concurrent::details::node_allocator<void *,caulk::alloc::detail::tracked_block,10ul,(caulk::concurrent::skiplist_options)0>::size_generator,8ul,1ul,-1l>::Sizes[8 * i - 8]) {
      break;
    }
    if (++v15 == 10)
    {
      unint64_t v18 = 0;
      goto LABEL_17;
    }
  }
  uint64_t v19 = v16 + 64 + 32 * v15;
  uint64_t v20 = caulk::concurrent::stack<caulk::alloc::free_block,caulk::concurrent::intrusive_single_link_node<caulk::alloc::free_block>>::pop();
  if (v20)
  {
    unint64_t v18 = (unint64_t)v20;
    atomic_fetch_add((atomic_ullong *volatile)(v19 + 16), 0xFFFFFFFFFFFFFFFFLL);
  }
  else
  {
    unint64_t v18 = caulk::alloc::cascading_allocator<caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::serial_allocator,caulk::alloc::embed_block_memory,16384ul>>::allocate(v16, v17);
  }
  unint64_t v6 = v4 + 256;
LABEL_17:
  *(void *)unint64_t v18 = 0;
  *(void *)(v18 + 8) = 0;
  *(unsigned char *)(v18 + 24) = i;
  *(_WORD *)(v18 + 25) = 1;
  *(unsigned char *)(v18 + 27) = i;
  *(void *)(v18 + 16) = a2;
  *(_OWORD *)unint64_t v18 = *v36;
  *(void *)(v18 + 40) = 0;
  *(void *)(v18 + 48) = 0;
  *(void *)(v18 + 32) = 0;
  if ((_BYTE)i)
  {
    uint64_t v21 = (unint64_t *)(v18 + 48);
    uint64_t v22 = i;
    do
    {
      atomic_store(0, v21 - 1);
      atomic_store(0, v21);
      v21 += 2;
      --v22;
    }
    while (v22);
  }
  unint64_t v23 = 0;
  __dmb(0xBu);
  while (2)
  {
    if (*(void *)(v10 + 16) == *(void *)(v18 + 16))
    {
LABEL_37:
      unint64_t v33 = 0;
      goto LABEL_39;
    }
    while (1)
    {
      unint64_t v24 = (unint64_t *)(v10 + 16 * v23 + 40);
      unint64_t v25 = atomic_load(v24);
      if ((v25 & 2) == 0) {
        break;
      }
      caulk::concurrent::skiplist<void *,caulk::alloc::detail::tracked_block,10,(caulk::concurrent::skiplist_options)0>::help_flagged(v4, v23, v10, v25 & 0xFFFFFFFFFFFFFFFCLL);
LABEL_30:
      unint64_t v29 = *(void *)(v18 + 16);
      while (1)
      {
        unint64_t v30 = atomic_load((unint64_t *)(v10 + 16 * v23 + 40));
        unint64_t v11 = v30 & 0xFFFFFFFFFFFFFFFCLL;
        if (v29 < *(void *)((v30 & 0xFFFFFFFFFFFFFFFCLL) + 16)) {
          break;
        }
        char v31 = atomic_load((unint64_t *)(v11 + 40));
        if (v31)
        {
          unint64_t v10 = caulk::concurrent::skiplist<void *,caulk::alloc::detail::tracked_block,10,(caulk::concurrent::skiplist_options)0>::try_flag_node(v4, v23, v10, v11);
          if (!v32) {
            caulk::concurrent::skiplist<void *,caulk::alloc::detail::tracked_block,10,(caulk::concurrent::skiplist_options)0>::help_flagged(v4, v23, v10, v11);
          }
        }
        else
        {
          unint64_t v10 = v11;
        }
      }
      if (*(void *)(v10 + 16) == *(void *)(v18 + 16)) {
        goto LABEL_37;
      }
    }
    atomic_store(v11, (unint64_t *)(v18 + 16 * v23 + 40));
    unint64_t v26 = v11;
    atomic_compare_exchange_strong((atomic_ullong *volatile)v24, &v26, v18);
    if (v26 != v11)
    {
      if ((v26 & 2) != 0) {
        caulk::concurrent::skiplist<void *,caulk::alloc::detail::tracked_block,10,(caulk::concurrent::skiplist_options)0>::help_flagged(v4, v23, v10, v26 & 0xFFFFFFFFFFFFFFFCLL);
      }
      char v27 = atomic_load(v24);
      if (v27)
      {
        do
        {
          unint64_t v10 = atomic_load((unint64_t *)(v10 + 16 * v23 + 48));
          char v28 = atomic_load((unint64_t *)(v10 + 16 * v23 + 40));
        }
        while ((v28 & 1) != 0);
      }
      goto LABEL_30;
    }
    unint64_t v33 = v18;
LABEL_39:
    if (!(v33 | v23))
    {
      caulk::alloc::multi_free_list<caulk::alloc::cascading_allocator<caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::serial_allocator,caulk::alloc::embed_block_memory,16384ul>>,caulk::concurrent::details::node_allocator<void *,caulk::alloc::detail::tracked_block,10ul,(caulk::concurrent::skiplist_options)0>::size_generator,8ul,1ul,-1l>::deallocate(*(caulk::alloc::base_allocator **)(v4 + 272), (unint64_t *)v18, *(void *)&caulk::alloc::multi_free_list<caulk::alloc::cascading_allocator<caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::serial_allocator,caulk::alloc::embed_block_memory,16384ul>>,caulk::concurrent::details::node_allocator<void *,caulk::alloc::detail::tracked_block,10ul,(caulk::concurrent::skiplist_options)0>::size_generator,8ul,1ul,-1l>::Sizes[8 * *(unsigned __int8 *)(v18 + 24) - 8]);
      goto LABEL_45;
    }
    unint64_t v9 = atomic_load((unint64_t *)(v18 + 40));
    if ((v9 & 1) == 0 && ++v23 != i)
    {
      unint64_t v37 = a2;
      unint64_t v10 = caulk::concurrent::skiplist<void *,caulk::alloc::detail::tracked_block,10,(caulk::concurrent::skiplist_options)0>::search_to_level<caulk::concurrent::skiplist<void *,caulk::alloc::detail::tracked_block,10,(caulk::concurrent::skiplist_options)0>::key_le>(v4, &v37, v23);
      unint64_t v11 = v34;
      continue;
    }
    break;
  }
  uint64_t v35 = 1;
LABEL_46:
  caulk::concurrent::details::node_allocator<void *,caulk::alloc::detail::tracked_block,10ul,(caulk::concurrent::skiplist_options)0>::end_traversal(v6, v9);
  return v35;
}

void caulk::concurrent::skiplist<void *,caulk::alloc::detail::tracked_block,10,(caulk::concurrent::skiplist_options)0>::random_engine()
{
  {
    caulk::multi_simple_random<unsigned int,4ul,std::uniform_int_distribution<unsigned int>,std::mersenne_twister_engine<unsigned int,32ul,624ul,397ul,31ul,2567483615u,11ul,4294967295u,7ul,2636928640u,15ul,4022730752u,18ul,1812433253u>>::multi_simple_random((uint64_t)&caulk::concurrent::skiplist<void *,caulk::alloc::detail::tracked_block,10,(caulk::concurrent::skiplist_options)0>::random_engine(void)::engine);
  }
}

void sub_210873B64(_Unwind_Exception *a1)
{
}

unint64_t caulk::alloc::bitmap_allocator<caulk::alloc::embed_block_memory,16368ul,256ul,6ul>::allocate(unsigned int *a1, unint64_t a2)
{
  if (a2 > 0x4000) {
    return 0;
  }
  unint64_t v3 = (a2 + 255) >> 8;
  unsigned int v4 = atomic_load(a1);
  if (v4 < v3) {
    return 0;
  }
  unsigned int v5 = caulk::alloc::detail::state_bit_span::allocate((uint64_t)(a1 + 2), 2uLL, 0, 0x3Eu, v3, 0x3Fu);
  if ((v5 & 0x80000000) != 0) {
    return 0;
  }
  atomic_fetch_add((atomic_uint *volatile)a1, -(int)v3);
  return (unint64_t)&a1[64 * (unint64_t)v5 + 60];
}

void caulk::alloc::darwin_resource<caulk::alloc::dsw_allocator2<true>,caulk::alloc::rt_safe_memory_resource>::~darwin_resource(void *a1)
{
  *a1 = &unk_26C2AA248;
  uint64_t v2 = a1[198];
  a1[198] = 0;
  if (v2) {
    std::default_delete<caulk::alloc::darwin_resource<caulk::alloc::dsw_allocator2<true>,caulk::alloc::rt_safe_memory_resource>::zone_plus>::operator()[abi:ne180100](v2);
  }
  caulk::alloc::tree_allocator<caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,16ul,6ul>>::~tree_allocator((uint64_t)(a1 + 122));
  caulk::alloc::tree_allocator<caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,256ul,6ul>>::~tree_allocator((uint64_t)(a1 + 46));
  caulk::alloc::tracking_allocator<caulk::alloc::global_page_cache>::~tracking_allocator((uint64_t)(a1 + 2));

  JUMPOUT(0x216674B00);
}

void std::default_delete<caulk::alloc::darwin_resource<caulk::alloc::dsw_allocator2<true>,caulk::alloc::rt_safe_memory_resource>::zone_plus>::operator()[abi:ne180100](uint64_t a1)
{
  malloc_zone_unregister((malloc_zone_t *)(a1 + 8));

  JUMPOUT(0x216674B00);
}

void *caulk::alloc::darwin_resource<caulk::alloc::dsw_allocator2<true>,caulk::alloc::rt_safe_memory_resource>::~darwin_resource(void *a1)
{
  *a1 = &unk_26C2AA248;
  uint64_t v2 = a1[198];
  a1[198] = 0;
  if (v2) {
    std::default_delete<caulk::alloc::darwin_resource<caulk::alloc::dsw_allocator2<true>,caulk::alloc::rt_safe_memory_resource>::zone_plus>::operator()[abi:ne180100](v2);
  }
  caulk::alloc::tree_allocator<caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,16ul,6ul>>::~tree_allocator((uint64_t)(a1 + 122));
  caulk::alloc::tree_allocator<caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,256ul,6ul>>::~tree_allocator((uint64_t)(a1 + 46));
  caulk::alloc::tracking_allocator<caulk::alloc::global_page_cache>::~tracking_allocator((uint64_t)(a1 + 2));
  return a1;
}

uint64_t caulk::concurrent::skiplist<void *,caulk::alloc::detail::tracked_block,10,(caulk::concurrent::skiplist_options)0>::skiplist(uint64_t a1)
{
  *(_OWORD *)(a1 + 256) = 0u;
  *(_OWORD *)(a1 + 272) = 0u;
  *(_OWORD *)(a1 + 224) = 0u;
  *(_OWORD *)(a1 + 240) = 0u;
  *(_OWORD *)(a1 + 192) = 0u;
  *(_OWORD *)(a1 + 208) = 0u;
  *(_OWORD *)(a1 + 160) = 0u;
  *(_OWORD *)(a1 + 176) = 0u;
  *(_OWORD *)(a1 + 128) = 0u;
  *(_OWORD *)(a1 + 144) = 0u;
  *(_OWORD *)(a1 + 96) = 0u;
  *(_OWORD *)(a1 + 112) = 0u;
  *(_OWORD *)(a1 + 64) = 0u;
  *(_OWORD *)(a1 + 80) = 0u;
  *(_OWORD *)(a1 + 32) = 0u;
  *(_OWORD *)(a1 + 48) = 0u;
  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  os_unfair_lock_lock((os_unfair_lock_t)&caulk::alloc::shared_allocator<caulk::alloc::multi_free_list<caulk::alloc::cascading_allocator<caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::serial_allocator,caulk::alloc::embed_block_memory,16384ul>>,caulk::concurrent::details::node_allocator<void *,caulk::alloc::detail::tracked_block,10ul,(caulk::concurrent::skiplist_options)0>::size_generator,8ul,1ul,-1l>>::shared_instance(void)::global);
  if (qword_26AA5D220)
  {
    uint64_t v2 = std::__shared_weak_count::lock((std::__shared_weak_count *)qword_26AA5D220);
    if (v2)
    {
      unint64_t v3 = v2;
      uint64_t p_shared_owners = qword_26AA5D218;
      if (qword_26AA5D218) {
        goto LABEL_9;
      }
      std::__shared_weak_count::__release_shared[abi:ne180100](v2);
    }
  }
  unint64_t v3 = (std::__shared_weak_count *)operator new(0x1A0uLL);
  v3->__shared_owners_ = 0;
  v3->__shared_weak_owners_ = 0;
  *(_OWORD *)&v3[1].__shared_owners_ = 0u;
  uint64_t p_shared_owners = (uint64_t)&v3[1].__shared_owners_;
  v3->__vftable = (std::__shared_weak_count_vtbl *)&unk_26C2AAF00;
  v3[2].std::__shared_count = 0u;
  *(_OWORD *)&v3[2].__shared_weak_owners_ = 0u;
  *(_OWORD *)&v3[3].__shared_owners_ = 0u;
  v3[4].std::__shared_count = 0u;
  *(_OWORD *)&v3[4].__shared_weak_owners_ = 0u;
  *(_OWORD *)&v3[5].__shared_owners_ = 0u;
  v3[6].std::__shared_count = 0u;
  *(_OWORD *)&v3[6].__shared_weak_owners_ = 0u;
  *(_OWORD *)&v3[7].__shared_owners_ = 0u;
  v3[8].std::__shared_count = 0u;
  *(_OWORD *)&v3[8].__shared_weak_owners_ = 0u;
  *(_OWORD *)&v3[9].__shared_owners_ = 0u;
  v3[10].std::__shared_count = 0u;
  *(_OWORD *)&v3[10].__shared_weak_owners_ = 0u;
  *(_OWORD *)&v3[11].__shared_owners_ = 0u;
  v3[12].std::__shared_count = 0u;
  *(_OWORD *)&v3[12].__shared_weak_owners_ = 0u;
  *(_OWORD *)&v3[13].__shared_owners_ = 0u;
  v3[14].std::__shared_count = 0u;
  *(_OWORD *)&v3[14].__shared_weak_owners_ = 0u;
  *(_OWORD *)&v3[15].__shared_owners_ = 0u;
  v3[16].std::__shared_count = 0u;
  *(_OWORD *)&v3[16].__shared_weak_owners_ = 0u;
  caulk::alloc::global_page_cache::instance((caulk::alloc::global_page_cache *)v3);
  v3[3].__shared_owners_ = 0;
  v3[1].__shared_weak_owners_ = (uint64_t)&unk_26AA5D890;
  v3[2].__vftable = 0;
  v3[2].__shared_owners_ = 0;
  v3[2].__shared_weak_owners_ = 0;
  LODWORD(v3[3].__vftable) = 0;
  for (uint64_t i = 96; i != 416; i += 32)
  {
    unint64_t v6 = (std::__shared_weak_count_vtbl **)((char *)&v3->__vftable + i);
    *unint64_t v6 = 0;
    v6[1] = 0;
    void v6[2] = 0;
  }
  atomic_fetch_add_explicit(&v3->__shared_weak_owners_, 1uLL, memory_order_relaxed);
  unint64_t v7 = (std::__shared_weak_count *)qword_26AA5D220;
  qword_26AA5D218 = (uint64_t)&v3[1].__shared_owners_;
  qword_26AA5D220 = (uint64_t)v3;
  if (v7) {
    std::__shared_weak_count::__release_weak(v7);
  }
LABEL_9:
  os_unfair_lock_unlock((os_unfair_lock_t)&caulk::alloc::shared_allocator<caulk::alloc::multi_free_list<caulk::alloc::cascading_allocator<caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::serial_allocator,caulk::alloc::embed_block_memory,16384ul>>,caulk::concurrent::details::node_allocator<void *,caulk::alloc::detail::tracked_block,10ul,(caulk::concurrent::skiplist_options)0>::size_generator,8ul,1ul,-1l>>::shared_instance(void)::global);
  atomic_fetch_add_explicit(&v3->__shared_owners_, 1uLL, memory_order_relaxed);
  unint64_t v8 = *(std::__shared_weak_count **)(a1 + 280);
  *(void *)(a1 + 272) = p_shared_owners;
  *(void *)(a1 + 280) = v3;
  if (v8) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v8);
  }
  std::__shared_weak_count::__release_shared[abi:ne180100](v3);
  *(void *)(a1 + 288) = &caulk::inplace_function_detail::vtable<void,caulk::concurrent::details::skiplist_node<void *,caulk::alloc::detail::tracked_block>::layout_vk const&>::empty;
  caulk::concurrent::skiplist<void *,caulk::alloc::detail::tracked_block,10,(caulk::concurrent::skiplist_options)0>::random_engine();
  uint64_t v9 = 0;
  unint64_t v10 = (void *)(a1 + 200);
  *(void *)a1 = 0;
  *(void *)(a1 + 8) = 0;
  *(_DWORD *)(a1 + 24) = 167837706;
  *(void *)(a1 + 16) = 0;
  *(void *)(a1 + 40) = 0;
  *(void *)(a1 + 48) = 0;
  *(void *)(a1 + 32) = 0;
  do
  {
    atomic_store(0, (unint64_t *)(a1 + v9 + 40));
    atomic_store(0, (unint64_t *)(a1 + v9 + 48));
    v9 += 16;
  }
  while (v9 != 160);
  void *v10 = 0;
  *(void *)(a1 + 208) = 0;
  *(void *)(a1 + 248) = 0;
  *(_DWORD *)(a1 + 224) = 16908289;
  *(void *)(a1 + 216) = -1;
  *(void *)(a1 + 232) = 0;
  *(void *)(a1 + 240) = 0;
  atomic_store(0, (unint64_t *)(a1 + 240));
  atomic_store(0, (unint64_t *)(a1 + 248));
  for (uint64_t j = 40; j != 200; j += 16)
    atomic_store((unint64_t)v10, (unint64_t *)(a1 + j));
  __dmb(0xBu);
  return a1;
}

void sub_210873F74(void *a1)
{
  std::__shared_weak_count::~__shared_weak_count(v2);
  operator delete(v4);
  os_unfair_lock_unlock((os_unfair_lock_t)&caulk::alloc::shared_allocator<caulk::alloc::multi_free_list<caulk::alloc::cascading_allocator<caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::serial_allocator,caulk::alloc::embed_block_memory,16384ul>>,caulk::concurrent::details::node_allocator<void *,caulk::alloc::detail::tracked_block,10ul,(caulk::concurrent::skiplist_options)0>::size_generator,8ul,1ul,-1l>>::shared_instance(void)::global);
  unsigned int v5 = *(std::__shared_weak_count **)(v1 + 280);
  if (v5) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v5);
  }
  __clang_call_terminate(a1);
}

uint64_t caulk::concurrent::skiplist<unsigned long,caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,16ul,6ul>::node_impl<caulk::alloc::tree_allocator<caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,16ul,6ul>>::node_header,caulk::alloc::embed_block_memory> *,5,(caulk::concurrent::skiplist_options)1>::skiplist(uint64_t a1)
{
  *(_OWORD *)(a1 + 112) = 0u;
  unint64_t v2 = a1 + 112;
  *(_OWORD *)(a1 + 160) = 0u;
  *(_OWORD *)(a1 + 176) = 0u;
  *(_OWORD *)(a1 + 128) = 0u;
  *(_OWORD *)(a1 + 144) = 0u;
  *(_OWORD *)(a1 + 80) = 0u;
  *(_OWORD *)(a1 + 96) = 0u;
  *(_OWORD *)(a1 + 48) = 0u;
  *(_OWORD *)(a1 + 64) = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_OWORD *)(a1 + 32) = 0u;
  *(_OWORD *)a1 = 0u;
  os_unfair_lock_lock((os_unfair_lock_t)&caulk::alloc::shared_allocator<caulk::alloc::multi_free_list<caulk::alloc::cascading_allocator<caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::serial_allocator,caulk::alloc::embed_block_memory,16384ul>>,caulk::concurrent::details::node_allocator<unsigned long,caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,16ul,6ul>::node_impl<caulk::alloc::tree_allocator<caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,16ul,6ul>::node_impl>::node_header,caulk::alloc::embed_block_memory> *,5ul,(caulk::concurrent::skiplist_options)1>::size_generator,8ul,1ul,-1l>>::shared_instance(void)::global);
  if (qword_26AA5AAB0)
  {
    unint64_t v3 = std::__shared_weak_count::lock((std::__shared_weak_count *)qword_26AA5AAB0);
    if (v3)
    {
      unsigned int v4 = v3;
      uint64_t p_shared_owners = qword_26AA5AAA8;
      if (qword_26AA5AAA8) {
        goto LABEL_9;
      }
      std::__shared_weak_count::__release_shared[abi:ne180100](v3);
    }
  }
  unsigned int v4 = (std::__shared_weak_count *)operator new(0x100uLL);
  v4->__shared_owners_ = 0;
  v4->__shared_weak_owners_ = 0;
  v4->__vftable = (std::__shared_weak_count_vtbl *)&unk_26C2AAF70;
  *(_OWORD *)&v4[1].__shared_owners_ = 0u;
  uint64_t p_shared_owners = (uint64_t)&v4[1].__shared_owners_;
  v4[2].std::__shared_count = 0u;
  *(_OWORD *)&v4[2].__shared_weak_owners_ = 0u;
  *(_OWORD *)&v4[3].__shared_owners_ = 0u;
  v4[4].std::__shared_count = 0u;
  *(_OWORD *)&v4[4].__shared_weak_owners_ = 0u;
  *(_OWORD *)&v4[5].__shared_owners_ = 0u;
  v4[6].std::__shared_count = 0u;
  *(_OWORD *)&v4[6].__shared_weak_owners_ = 0u;
  *(_OWORD *)&v4[7].__shared_owners_ = 0u;
  v4[8].std::__shared_count = 0u;
  *(_OWORD *)&v4[8].__shared_weak_owners_ = 0u;
  *(_OWORD *)&v4[9].__shared_owners_ = 0u;
  v4[10].std::__shared_count = 0u;
  caulk::alloc::global_page_cache::instance((caulk::alloc::global_page_cache *)v4);
  v4[3].__shared_owners_ = 0;
  v4[1].__shared_weak_owners_ = (uint64_t)&unk_26AA5D890;
  v4[2].__vftable = 0;
  v4[2].__shared_owners_ = 0;
  v4[2].__shared_weak_owners_ = 0;
  LODWORD(v4[3].__vftable) = 0;
  for (uint64_t i = 96; i != 256; i += 32)
  {
    unint64_t v7 = (std::__shared_weak_count_vtbl **)((char *)&v4->__vftable + i);
    *unint64_t v7 = 0;
    v7[1] = 0;
    void v7[2] = 0;
  }
  atomic_fetch_add_explicit(&v4->__shared_weak_owners_, 1uLL, memory_order_relaxed);
  unint64_t v8 = (std::__shared_weak_count *)qword_26AA5AAB0;
  qword_26AA5AAA8 = (uint64_t)&v4[1].__shared_owners_;
  qword_26AA5AAB0 = (uint64_t)v4;
  if (v8) {
    std::__shared_weak_count::__release_weak(v8);
  }
LABEL_9:
  os_unfair_lock_unlock((os_unfair_lock_t)&caulk::alloc::shared_allocator<caulk::alloc::multi_free_list<caulk::alloc::cascading_allocator<caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::serial_allocator,caulk::alloc::embed_block_memory,16384ul>>,caulk::concurrent::details::node_allocator<unsigned long,caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,16ul,6ul>::node_impl<caulk::alloc::tree_allocator<caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,16ul,6ul>::node_impl>::node_header,caulk::alloc::embed_block_memory> *,5ul,(caulk::concurrent::skiplist_options)1>::size_generator,8ul,1ul,-1l>>::shared_instance(void)::global);
  atomic_fetch_add_explicit(&v4->__shared_owners_, 1uLL, memory_order_relaxed);
  uint64_t v9 = *(std::__shared_weak_count **)(a1 + 184);
  *(void *)(a1 + 176) = p_shared_owners;
  *(void *)(a1 + 184) = v4;
  if (v9) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v9);
  }
  std::__shared_weak_count::__release_shared[abi:ne180100](v4);
  *(void *)(a1 + 192) = &caulk::inplace_function_detail::vtable<void,caulk::concurrent::details::skiplist_node<unsigned long,caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,16ul,6ul>::node_impl<caulk::alloc::tree_allocator<caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,16ul,6ul>>::node_header,caulk::alloc::embed_block_memory> *>::layout_kv const&>::empty;
  *(void *)(a1 + 232) = &caulk::inplace_function_detail::vtable<void>::empty;
  *(void *)(a1 + 272) = 0;
  *(void *)(a1 + 280) = 0;
  caulk::concurrent::skiplist<unsigned long,caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,16ul,6ul>::node_impl<caulk::alloc::tree_allocator<caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,16ul,6ul>>::node_header,caulk::alloc::embed_block_memory> *,5,(caulk::concurrent::skiplist_options)1>::random_engine();
  uint64_t v10 = 0;
  *(_DWORD *)(a1 + 16) = 83951621;
  *(_OWORD *)a1 = 0u;
  *(void *)(a1 + 24) = 0;
  *(_OWORD *)(a1 + 32) = 0u;
  do
  {
    atomic_store(0, (unint64_t *)(a1 + v10 + 32));
    atomic_store(0, (unint64_t *)(a1 + v10 + 40));
    v10 += 16;
  }
  while (v10 != 80);
  *(void *)(a1 + 152) = 0;
  *(_DWORD *)(a1 + 128) = 16908289;
  *(_OWORD *)(a1 + 112) = xmmword_210885C20;
  *(void *)(a1 + 136) = 0;
  *(void *)(a1 + 144) = 0;
  atomic_store(0, (unint64_t *)(a1 + 144));
  atomic_store(0, (unint64_t *)(a1 + 152));
  for (uint64_t j = 32; j != 112; j += 16)
    atomic_store(v2, (unint64_t *)(a1 + j));
  __dmb(0xBu);
  return a1;
}

void sub_2108741CC(void *a1)
{
  std::__shared_weak_count::~__shared_weak_count(v2);
  operator delete(v4);
  os_unfair_lock_unlock((os_unfair_lock_t)&caulk::alloc::shared_allocator<caulk::alloc::multi_free_list<caulk::alloc::cascading_allocator<caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::serial_allocator,caulk::alloc::embed_block_memory,16384ul>>,caulk::concurrent::details::node_allocator<unsigned long,caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,16ul,6ul>::node_impl<caulk::alloc::tree_allocator<caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,16ul,6ul>::node_impl>::node_header,caulk::alloc::embed_block_memory> *,5ul,(caulk::concurrent::skiplist_options)1>::size_generator,8ul,1ul,-1l>>::shared_instance(void)::global);
  unsigned int v5 = *(std::__shared_weak_count **)(v1 + 184);
  if (v5) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v5);
  }
  __clang_call_terminate(a1);
}

uint64_t *caulk::inplace_function<void ()(void),32ul,8ul,caulk::inplace_function_detail::vtable>::operator=(uint64_t *a1, uint64_t *a2)
{
  if (a1 != a2)
  {
    (*(void (**)(uint64_t *))(*a1 + 24))(a1 + 1);
    uint64_t v4 = *a2;
    *a2 = (uint64_t)&caulk::inplace_function_detail::vtable<void>::empty;
    *a1 = v4;
    (*(void (**)(uint64_t *, uint64_t *))(v4 + 16))(a1 + 1, a2 + 1);
  }
  return a1;
}

void caulk::inplace_function_detail::vtable<void>::vtable(void)::{lambda(void *)#1}::__invoke()
{
  exception = __cxa_allocate_exception(8uLL);
}

void *caulk::inplace_function_detail::vtable<void>::vtable<caulk::alloc::tree_allocator<caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,16ul,6ul>>::tree_allocator(void)::{lambda(void)#1}>(caulk::inplace_function_detail::wrapper<caulk::alloc::tree_allocator<caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,16ul,6ul>>::tree_allocator(void)::{lambda(void)#1}>)::{lambda(void *,void *)#2}::__invoke(void *result, void *a2)
{
  *__n128 result = *a2;
  return result;
}

void *caulk::inplace_function_detail::vtable<void>::vtable<caulk::alloc::tree_allocator<caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,16ul,6ul>>::tree_allocator(void)::{lambda(void)#1}>(caulk::inplace_function_detail::wrapper<caulk::alloc::tree_allocator<caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,16ul,6ul>>::tree_allocator(void)::{lambda(void)#1}>)::{lambda(void *,void *)#1}::__invoke(void *result, void *a2)
{
  *__n128 result = *a2;
  return result;
}

unint64_t caulk::inplace_function_detail::vtable<void>::vtable<caulk::alloc::tree_allocator<caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,16ul,6ul>>::tree_allocator(void)::{lambda(void)#1}>(caulk::inplace_function_detail::wrapper<caulk::alloc::tree_allocator<caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,16ul,6ul>>::tree_allocator(void)::{lambda(void)#1}>)::{lambda(void *)#1}::__invoke(void *a1)
{
  return caulk::concurrent::details::node_allocator<unsigned long,caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,256ul,6ul>::node_impl<caulk::alloc::tree_allocator<caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,256ul,6ul>>::node_header,caulk::alloc::embed_block_memory> *,5ul,(caulk::concurrent::skiplist_options)1>::perform_deferred_deletions<true,(BOOL *)0>(*a1 + 464);
}

void caulk::inplace_function_detail::vtable<void,caulk::concurrent::details::skiplist_node<unsigned long,caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,16ul,6ul>::node_impl<caulk::alloc::tree_allocator<caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,16ul,6ul>>::node_header,caulk::alloc::embed_block_memory> *>::layout_kv const&>::vtable(void)::{lambda(void *,caulk::concurrent::details::skiplist_node<unsigned long,caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,16ul,6ul>::node_impl<caulk::alloc::tree_allocator<caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,16ul,6ul>>::node_header,caulk::alloc::embed_block_memory> *>::layout_kv const&)#1}::__invoke()
{
  exception = __cxa_allocate_exception(8uLL);
}

void *_ZZN5caulk23inplace_function_detail6vtableIvJRKNS_10concurrent7details13skiplist_nodeImPNS_5alloc15chunk_allocatorINS5_17global_page_cacheENS5_16bitmap_allocatorENS5_18embed_block_memoryELm16384EJLm16ELm6EEE9node_implINS5_14tree_allocatorISA_E11node_headerES9_EEE9layout_kvEEEC1IZNSD_C1EvEUlRKT_E_EENS0_7wrapperISN_EEENUlPvST_E0_8__invokeEST_ST_(void *result, void *a2)
{
  *__n128 result = *a2;
  return result;
}

void *_ZZN5caulk23inplace_function_detail6vtableIvJRKNS_10concurrent7details13skiplist_nodeImPNS_5alloc15chunk_allocatorINS5_17global_page_cacheENS5_16bitmap_allocatorENS5_18embed_block_memoryELm16384EJLm16ELm6EEE9node_implINS5_14tree_allocatorISA_E11node_headerES9_EEE9layout_kvEEEC1IZNSD_C1EvEUlRKT_E_EENS0_7wrapperISN_EEENUlPvST_E_8__invokeEST_ST_(void *result, void *a2)
{
  *__n128 result = *a2;
  return result;
}

void _ZZN5caulk23inplace_function_detail6vtableIvJRKNS_10concurrent7details13skiplist_nodeImPNS_5alloc15chunk_allocatorINS5_17global_page_cacheENS5_16bitmap_allocatorENS5_18embed_block_memoryELm16384EJLm16ELm6EEE9node_implINS5_14tree_allocatorISA_E11node_headerES9_EEE9layout_kvEEEC1IZNSD_C1EvEUlRKT_E_EENS0_7wrapperISN_EEENUlPvSK_E_8__invokeEST_SK_(uint64_t a1, uint64_t a2)
{
}

void std::__shared_ptr_emplace<caulk::alloc::multi_free_list<caulk::alloc::cascading_allocator<caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::serial_allocator,caulk::alloc::embed_block_memory,16384ul>>,caulk::concurrent::details::node_allocator<unsigned long,caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,16ul,6ul>::node_impl<caulk::alloc::tree_allocator<caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,16ul,6ul>::node_impl>::node_header,caulk::alloc::embed_block_memory> *,5ul,(caulk::concurrent::skiplist_options)1>::size_generator,8ul,1ul,-1l>>::__on_zero_shared(uint64_t a1)
{
  uint64_t v1 = 0;
  uint64_t v2 = a1 + 32;
  uint64_t v3 = a1 + 96;
  do
  {
    for (uint64_t i = *(void *)&caulk::concurrent::details::node_allocator<unsigned long,caulk::alloc::chunk_allocator<caulk::alloc::page_allocator,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,16ul,6ul>::node_impl<caulk::alloc::tree_allocator<caulk::alloc::chunk_allocator<caulk::alloc::page_allocator,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,16ul,6ul>>::node_header,caulk::alloc::embed_block_memory> *,5ul,(caulk::concurrent::skiplist_options)1>::node_sizes[8 * v1];
          ;
          caulk::alloc::cascading_allocator<caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::serial_allocator,caulk::alloc::embed_block_memory,16384ul>>::deallocate(v2, (unint64_t)v5, i))
    {
      unsigned int v5 = caulk::concurrent::stack<caulk::alloc::free_block,caulk::concurrent::intrusive_single_link_node<caulk::alloc::free_block>>::pop();
      if (!v5) {
        break;
      }
      atomic_fetch_add((atomic_ullong *volatile)(v3 + 32 * v1 + 16), 0xFFFFFFFFFFFFFFFFLL);
    }
    ++v1;
  }
  while (v1 != 5);
  caulk::alloc::cascading_allocator<caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::serial_allocator,caulk::alloc::embed_block_memory,16384ul>>::self_deallocate_all(v2);
}

void caulk::alloc::cascading_allocator<caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::serial_allocator,caulk::alloc::embed_block_memory,16384ul>>::self_deallocate_all(uint64_t a1)
{
  unint64_t v1 = *(void *)(a1 + 16);
  if (v1)
  {
    do
    {
      unint64_t v3 = atomic_load((unint64_t *)v1);
      caulk::alloc::details::caching_page_allocator_base::deallocate(*(void **)(a1 + 8), (caulk::mach::vm_block *)v1, *(void *)(v1 + 8));
      unint64_t v1 = v3;
    }
    while (v3);
  }
}

uint64_t caulk::alloc::cascading_allocator<caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::serial_allocator,caulk::alloc::embed_block_memory,16384ul>>::deallocate(uint64_t result, unint64_t a2, uint64_t a3)
{
  atomic_fetch_add((atomic_uint *volatile)(result + 40), 0x801u);
  unint64_t v3 = *(unint64_t **)(result + 16);
  if (v3)
  {
    while ((unint64_t)(v3 + 4) > a2 || a2 + a3 > (unint64_t)(v3 + 2048))
    {
      unint64_t v3 = (unint64_t *)atomic_load(v3);
      if (!v3) {
        goto LABEL_8;
      }
    }
  }
  else
  {
LABEL_8:
    unint64_t v3 = (unint64_t *)atomic_load((unint64_t *)(result + 48));
    if (v3) {
      BOOL v5 = (unint64_t)(v3 + 4) > a2;
    }
    else {
      BOOL v5 = 1;
    }
    if (v5 || a2 + a3 > (unint64_t)(v3 + 2048)) {
LABEL_19:
    }
      caulk::alloc::base_allocator::bad_dealloc((caulk::alloc::base_allocator *)result);
  }
  if (!v3) {
    goto LABEL_19;
  }
  if ((unint64_t)(v3 + 4) > a2 || a2 + a3 > (unint64_t)(v3 + 2048)) {
    caulk::alloc::base_allocator::bad_dealloc((caulk::alloc::base_allocator *)result);
  }
  atomic_fetch_add((atomic_uint *volatile)(result + 40), 0xFFFFFFFF);
  return result;
}

void sub_210874518(_Unwind_Exception *a1)
{
  atomic_fetch_add((atomic_uint *volatile)(v1 + 40), 0xFFFFFFFF);
  _Unwind_Resume(a1);
}

void std::__shared_ptr_emplace<caulk::alloc::multi_free_list<caulk::alloc::cascading_allocator<caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::serial_allocator,caulk::alloc::embed_block_memory,16384ul>>,caulk::concurrent::details::node_allocator<unsigned long,caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,16ul,6ul>::node_impl<caulk::alloc::tree_allocator<caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,16ul,6ul>::node_impl>::node_header,caulk::alloc::embed_block_memory> *,5ul,(caulk::concurrent::skiplist_options)1>::size_generator,8ul,1ul,-1l>>::~__shared_ptr_emplace(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)&unk_26C2AAF70;
  std::__shared_weak_count::~__shared_weak_count(a1);

  JUMPOUT(0x216674B00);
}

void std::__shared_ptr_emplace<caulk::alloc::multi_free_list<caulk::alloc::cascading_allocator<caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::serial_allocator,caulk::alloc::embed_block_memory,16384ul>>,caulk::concurrent::details::node_allocator<unsigned long,caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,16ul,6ul>::node_impl<caulk::alloc::tree_allocator<caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,16ul,6ul>::node_impl>::node_header,caulk::alloc::embed_block_memory> *,5ul,(caulk::concurrent::skiplist_options)1>::size_generator,8ul,1ul,-1l>>::~__shared_ptr_emplace(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&unk_26C2AAF70;
  std::__shared_weak_count::~__shared_weak_count(this);
}

uint64_t caulk::concurrent::skiplist<unsigned long,caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,256ul,6ul>::node_impl<caulk::alloc::tree_allocator<caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,256ul,6ul>>::node_header,caulk::alloc::embed_block_memory> *,5,(caulk::concurrent::skiplist_options)1>::skiplist(uint64_t a1)
{
  *(_OWORD *)(a1 + 112) = 0u;
  unint64_t v2 = a1 + 112;
  *(_OWORD *)(a1 + 160) = 0u;
  *(_OWORD *)(a1 + 176) = 0u;
  *(_OWORD *)(a1 + 128) = 0u;
  *(_OWORD *)(a1 + 144) = 0u;
  *(_OWORD *)(a1 + 80) = 0u;
  *(_OWORD *)(a1 + 96) = 0u;
  *(_OWORD *)(a1 + 48) = 0u;
  *(_OWORD *)(a1 + 64) = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_OWORD *)(a1 + 32) = 0u;
  *(_OWORD *)a1 = 0u;
  os_unfair_lock_lock((os_unfair_lock_t)&caulk::alloc::shared_allocator<caulk::alloc::multi_free_list<caulk::alloc::cascading_allocator<caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::serial_allocator,caulk::alloc::embed_block_memory,16384ul>>,caulk::concurrent::details::node_allocator<unsigned long,caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,256ul,6ul>::node_impl<caulk::alloc::tree_allocator<caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,256ul,6ul>::node_impl>::node_header,caulk::alloc::embed_block_memory> *,5ul,(caulk::concurrent::skiplist_options)1>::size_generator,8ul,1ul,-1l>>::shared_instance(void)::global);
  if (qword_26AA58338)
  {
    unint64_t v3 = std::__shared_weak_count::lock((std::__shared_weak_count *)qword_26AA58338);
    if (v3)
    {
      uint64_t v4 = v3;
      uint64_t p_shared_owners = qword_26AA58330;
      if (qword_26AA58330) {
        goto LABEL_9;
      }
      std::__shared_weak_count::__release_shared[abi:ne180100](v3);
    }
  }
  uint64_t v4 = (std::__shared_weak_count *)operator new(0x100uLL);
  v4->__shared_owners_ = 0;
  v4->__shared_weak_owners_ = 0;
  v4->__vftable = (std::__shared_weak_count_vtbl *)&unk_26C2AAFA8;
  *(_OWORD *)&v4[1].__shared_owners_ = 0u;
  uint64_t p_shared_owners = (uint64_t)&v4[1].__shared_owners_;
  v4[2].std::__shared_count = 0u;
  *(_OWORD *)&v4[2].__shared_weak_owners_ = 0u;
  *(_OWORD *)&v4[3].__shared_owners_ = 0u;
  v4[4].std::__shared_count = 0u;
  *(_OWORD *)&v4[4].__shared_weak_owners_ = 0u;
  *(_OWORD *)&v4[5].__shared_owners_ = 0u;
  v4[6].std::__shared_count = 0u;
  *(_OWORD *)&v4[6].__shared_weak_owners_ = 0u;
  *(_OWORD *)&v4[7].__shared_owners_ = 0u;
  v4[8].std::__shared_count = 0u;
  *(_OWORD *)&v4[8].__shared_weak_owners_ = 0u;
  *(_OWORD *)&v4[9].__shared_owners_ = 0u;
  v4[10].std::__shared_count = 0u;
  caulk::alloc::global_page_cache::instance((caulk::alloc::global_page_cache *)v4);
  v4[3].__shared_owners_ = 0;
  v4[1].__shared_weak_owners_ = (uint64_t)&unk_26AA5D890;
  v4[2].__vftable = 0;
  v4[2].__shared_owners_ = 0;
  v4[2].__shared_weak_owners_ = 0;
  LODWORD(v4[3].__vftable) = 0;
  for (uint64_t i = 96; i != 256; i += 32)
  {
    unint64_t v7 = (std::__shared_weak_count_vtbl **)((char *)&v4->__vftable + i);
    *unint64_t v7 = 0;
    v7[1] = 0;
    void v7[2] = 0;
  }
  atomic_fetch_add_explicit(&v4->__shared_weak_owners_, 1uLL, memory_order_relaxed);
  unint64_t v8 = (std::__shared_weak_count *)qword_26AA58338;
  qword_26AA58330 = (uint64_t)&v4[1].__shared_owners_;
  qword_26AA58338 = (uint64_t)v4;
  if (v8) {
    std::__shared_weak_count::__release_weak(v8);
  }
LABEL_9:
  os_unfair_lock_unlock((os_unfair_lock_t)&caulk::alloc::shared_allocator<caulk::alloc::multi_free_list<caulk::alloc::cascading_allocator<caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::serial_allocator,caulk::alloc::embed_block_memory,16384ul>>,caulk::concurrent::details::node_allocator<unsigned long,caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,256ul,6ul>::node_impl<caulk::alloc::tree_allocator<caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,256ul,6ul>::node_impl>::node_header,caulk::alloc::embed_block_memory> *,5ul,(caulk::concurrent::skiplist_options)1>::size_generator,8ul,1ul,-1l>>::shared_instance(void)::global);
  atomic_fetch_add_explicit(&v4->__shared_owners_, 1uLL, memory_order_relaxed);
  uint64_t v9 = *(std::__shared_weak_count **)(a1 + 184);
  *(void *)(a1 + 176) = p_shared_owners;
  *(void *)(a1 + 184) = v4;
  if (v9) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v9);
  }
  std::__shared_weak_count::__release_shared[abi:ne180100](v4);
  *(void *)(a1 + 192) = &caulk::inplace_function_detail::vtable<void,caulk::concurrent::details::skiplist_node<unsigned long,caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,256ul,6ul>::node_impl<caulk::alloc::tree_allocator<caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,256ul,6ul>>::node_header,caulk::alloc::embed_block_memory> *>::layout_kv const&>::empty;
  *(void *)(a1 + 232) = &caulk::inplace_function_detail::vtable<void>::empty;
  *(void *)(a1 + 272) = 0;
  *(void *)(a1 + 280) = 0;
  caulk::concurrent::skiplist<unsigned long,caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,256ul,6ul>::node_impl<caulk::alloc::tree_allocator<caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,256ul,6ul>>::node_header,caulk::alloc::embed_block_memory> *,5,(caulk::concurrent::skiplist_options)1>::random_engine();
  uint64_t v10 = 0;
  *(_DWORD *)(a1 + 16) = 83951621;
  *(_OWORD *)a1 = 0u;
  *(void *)(a1 + 24) = 0;
  *(_OWORD *)(a1 + 32) = 0u;
  do
  {
    atomic_store(0, (unint64_t *)(a1 + v10 + 32));
    atomic_store(0, (unint64_t *)(a1 + v10 + 40));
    v10 += 16;
  }
  while (v10 != 80);
  *(void *)(a1 + 152) = 0;
  *(_DWORD *)(a1 + 128) = 16908289;
  *(_OWORD *)(a1 + 112) = xmmword_210885C20;
  *(void *)(a1 + 136) = 0;
  *(void *)(a1 + 144) = 0;
  atomic_store(0, (unint64_t *)(a1 + 144));
  atomic_store(0, (unint64_t *)(a1 + 152));
  for (uint64_t j = 32; j != 112; j += 16)
    atomic_store(v2, (unint64_t *)(a1 + j));
  __dmb(0xBu);
  return a1;
}

void sub_2108747B8(void *a1)
{
  std::__shared_weak_count::~__shared_weak_count(v2);
  operator delete(v4);
  os_unfair_lock_unlock((os_unfair_lock_t)&caulk::alloc::shared_allocator<caulk::alloc::multi_free_list<caulk::alloc::cascading_allocator<caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::serial_allocator,caulk::alloc::embed_block_memory,16384ul>>,caulk::concurrent::details::node_allocator<unsigned long,caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,256ul,6ul>::node_impl<caulk::alloc::tree_allocator<caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,256ul,6ul>::node_impl>::node_header,caulk::alloc::embed_block_memory> *,5ul,(caulk::concurrent::skiplist_options)1>::size_generator,8ul,1ul,-1l>>::shared_instance(void)::global);
  BOOL v5 = *(std::__shared_weak_count **)(v1 + 184);
  if (v5) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v5);
  }
  __clang_call_terminate(a1);
}

void *caulk::inplace_function_detail::vtable<void>::vtable<caulk::alloc::tree_allocator<caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,256ul,6ul>>::tree_allocator(void)::{lambda(void)#1}>(caulk::inplace_function_detail::wrapper<caulk::alloc::tree_allocator<caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,256ul,6ul>>::tree_allocator(void)::{lambda(void)#1}>)::{lambda(void *,void *)#2}::__invoke(void *result, void *a2)
{
  *__n128 result = *a2;
  return result;
}

void *caulk::inplace_function_detail::vtable<void>::vtable<caulk::alloc::tree_allocator<caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,256ul,6ul>>::tree_allocator(void)::{lambda(void)#1}>(caulk::inplace_function_detail::wrapper<caulk::alloc::tree_allocator<caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,256ul,6ul>>::tree_allocator(void)::{lambda(void)#1}>)::{lambda(void *,void *)#1}::__invoke(void *result, void *a2)
{
  *__n128 result = *a2;
  return result;
}

unint64_t caulk::inplace_function_detail::vtable<void>::vtable<caulk::alloc::tree_allocator<caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,256ul,6ul>>::tree_allocator(void)::{lambda(void)#1}>(caulk::inplace_function_detail::wrapper<caulk::alloc::tree_allocator<caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,256ul,6ul>>::tree_allocator(void)::{lambda(void)#1}>)::{lambda(void *)#1}::__invoke(void *a1)
{
  return caulk::concurrent::details::node_allocator<unsigned long,caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,256ul,6ul>::node_impl<caulk::alloc::tree_allocator<caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,256ul,6ul>>::node_header,caulk::alloc::embed_block_memory> *,5ul,(caulk::concurrent::skiplist_options)1>::perform_deferred_deletions<true,(BOOL *)0>(*a1 + 464);
}

void caulk::inplace_function_detail::vtable<void,caulk::concurrent::details::skiplist_node<unsigned long,caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,256ul,6ul>::node_impl<caulk::alloc::tree_allocator<caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,256ul,6ul>>::node_header,caulk::alloc::embed_block_memory> *>::layout_kv const&>::vtable(void)::{lambda(void *,caulk::concurrent::details::skiplist_node<unsigned long,caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,256ul,6ul>::node_impl<caulk::alloc::tree_allocator<caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,256ul,6ul>>::node_header,caulk::alloc::embed_block_memory> *>::layout_kv const&)#1}::__invoke()
{
  exception = __cxa_allocate_exception(8uLL);
}

void *_ZZN5caulk23inplace_function_detail6vtableIvJRKNS_10concurrent7details13skiplist_nodeImPNS_5alloc15chunk_allocatorINS5_17global_page_cacheENS5_16bitmap_allocatorENS5_18embed_block_memoryELm16384EJLm256ELm6EEE9node_implINS5_14tree_allocatorISA_E11node_headerES9_EEE9layout_kvEEEC1IZNSD_C1EvEUlRKT_E_EENS0_7wrapperISN_EEENUlPvST_E0_8__invokeEST_ST_(void *result, void *a2)
{
  *__n128 result = *a2;
  return result;
}

void *_ZZN5caulk23inplace_function_detail6vtableIvJRKNS_10concurrent7details13skiplist_nodeImPNS_5alloc15chunk_allocatorINS5_17global_page_cacheENS5_16bitmap_allocatorENS5_18embed_block_memoryELm16384EJLm256ELm6EEE9node_implINS5_14tree_allocatorISA_E11node_headerES9_EEE9layout_kvEEEC1IZNSD_C1EvEUlRKT_E_EENS0_7wrapperISN_EEENUlPvST_E_8__invokeEST_ST_(void *result, void *a2)
{
  *__n128 result = *a2;
  return result;
}

void _ZZN5caulk23inplace_function_detail6vtableIvJRKNS_10concurrent7details13skiplist_nodeImPNS_5alloc15chunk_allocatorINS5_17global_page_cacheENS5_16bitmap_allocatorENS5_18embed_block_memoryELm16384EJLm256ELm6EEE9node_implINS5_14tree_allocatorISA_E11node_headerES9_EEE9layout_kvEEEC1IZNSD_C1EvEUlRKT_E_EENS0_7wrapperISN_EEENUlPvSK_E_8__invokeEST_SK_(uint64_t a1, uint64_t a2)
{
}

void std::__shared_ptr_emplace<caulk::alloc::multi_free_list<caulk::alloc::cascading_allocator<caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::serial_allocator,caulk::alloc::embed_block_memory,16384ul>>,caulk::concurrent::details::node_allocator<unsigned long,caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,256ul,6ul>::node_impl<caulk::alloc::tree_allocator<caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,256ul,6ul>::node_impl>::node_header,caulk::alloc::embed_block_memory> *,5ul,(caulk::concurrent::skiplist_options)1>::size_generator,8ul,1ul,-1l>>::__on_zero_shared(uint64_t a1)
{
  uint64_t v1 = 0;
  uint64_t v2 = a1 + 32;
  uint64_t v3 = a1 + 96;
  do
  {
    for (uint64_t i = *(void *)&caulk::concurrent::details::node_allocator<unsigned long,caulk::alloc::chunk_allocator<caulk::alloc::page_allocator,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,16ul,6ul>::node_impl<caulk::alloc::tree_allocator<caulk::alloc::chunk_allocator<caulk::alloc::page_allocator,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,16ul,6ul>>::node_header,caulk::alloc::embed_block_memory> *,5ul,(caulk::concurrent::skiplist_options)1>::node_sizes[8 * v1];
          ;
          caulk::alloc::cascading_allocator<caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::serial_allocator,caulk::alloc::embed_block_memory,16384ul>>::deallocate(v2, (unint64_t)v5, i))
    {
      BOOL v5 = caulk::concurrent::stack<caulk::alloc::free_block,caulk::concurrent::intrusive_single_link_node<caulk::alloc::free_block>>::pop();
      if (!v5) {
        break;
      }
      atomic_fetch_add((atomic_ullong *volatile)(v3 + 32 * v1 + 16), 0xFFFFFFFFFFFFFFFFLL);
    }
    ++v1;
  }
  while (v1 != 5);
  caulk::alloc::cascading_allocator<caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::serial_allocator,caulk::alloc::embed_block_memory,16384ul>>::self_deallocate_all(v2);
}

void std::__shared_ptr_emplace<caulk::alloc::multi_free_list<caulk::alloc::cascading_allocator<caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::serial_allocator,caulk::alloc::embed_block_memory,16384ul>>,caulk::concurrent::details::node_allocator<unsigned long,caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,256ul,6ul>::node_impl<caulk::alloc::tree_allocator<caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,256ul,6ul>::node_impl>::node_header,caulk::alloc::embed_block_memory> *,5ul,(caulk::concurrent::skiplist_options)1>::size_generator,8ul,1ul,-1l>>::~__shared_ptr_emplace(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)&unk_26C2AAFA8;
  std::__shared_weak_count::~__shared_weak_count(a1);

  JUMPOUT(0x216674B00);
}

void std::__shared_ptr_emplace<caulk::alloc::multi_free_list<caulk::alloc::cascading_allocator<caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::serial_allocator,caulk::alloc::embed_block_memory,16384ul>>,caulk::concurrent::details::node_allocator<unsigned long,caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,256ul,6ul>::node_impl<caulk::alloc::tree_allocator<caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,256ul,6ul>::node_impl>::node_header,caulk::alloc::embed_block_memory> *,5ul,(caulk::concurrent::skiplist_options)1>::size_generator,8ul,1ul,-1l>>::~__shared_ptr_emplace(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&unk_26C2AAFA8;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void caulk::inplace_function_detail::vtable<void,caulk::concurrent::details::skiplist_node<void *,caulk::alloc::detail::tracked_block>::layout_vk const&>::vtable(void)::{lambda(void *,caulk::concurrent::details::skiplist_node<void *,caulk::alloc::detail::tracked_block>::layout_vk const&)#1}::__invoke()
{
  exception = __cxa_allocate_exception(8uLL);
}

void std::__shared_ptr_emplace<caulk::alloc::multi_free_list<caulk::alloc::cascading_allocator<caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::serial_allocator,caulk::alloc::embed_block_memory,16384ul>>,caulk::concurrent::details::node_allocator<void *,caulk::alloc::detail::tracked_block,10ul,(caulk::concurrent::skiplist_options)0>::size_generator,8ul,1ul,-1l>>::__on_zero_shared(uint64_t a1)
{
  uint64_t v1 = 0;
  uint64_t v2 = a1 + 32;
  uint64_t v3 = a1 + 96;
  do
  {
    for (uint64_t i = *(void *)&caulk::alloc::multi_free_list<caulk::alloc::cascading_allocator<caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::serial_allocator,caulk::alloc::embed_block_memory,16384ul>>,caulk::concurrent::details::node_allocator<void *,caulk::alloc::detail::tracked_block,10ul,(caulk::concurrent::skiplist_options)0>::size_generator,8ul,1ul,-1l>::Sizes[8 * v1];
          ;
          caulk::alloc::cascading_allocator<caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::serial_allocator,caulk::alloc::embed_block_memory,16384ul>>::deallocate(v2, (unint64_t)v5, i))
    {
      BOOL v5 = caulk::concurrent::stack<caulk::alloc::free_block,caulk::concurrent::intrusive_single_link_node<caulk::alloc::free_block>>::pop();
      if (!v5) {
        break;
      }
      atomic_fetch_add((atomic_ullong *volatile)(v3 + 32 * v1 + 16), 0xFFFFFFFFFFFFFFFFLL);
    }
    ++v1;
  }
  while (v1 != 10);
  caulk::alloc::cascading_allocator<caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::serial_allocator,caulk::alloc::embed_block_memory,16384ul>>::self_deallocate_all(v2);
}

void std::__shared_ptr_emplace<caulk::alloc::multi_free_list<caulk::alloc::cascading_allocator<caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::serial_allocator,caulk::alloc::embed_block_memory,16384ul>>,caulk::concurrent::details::node_allocator<void *,caulk::alloc::detail::tracked_block,10ul,(caulk::concurrent::skiplist_options)0>::size_generator,8ul,1ul,-1l>>::~__shared_ptr_emplace(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)&unk_26C2AAF00;
  std::__shared_weak_count::~__shared_weak_count(a1);

  JUMPOUT(0x216674B00);
}

void std::__shared_ptr_emplace<caulk::alloc::multi_free_list<caulk::alloc::cascading_allocator<caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::serial_allocator,caulk::alloc::embed_block_memory,16384ul>>,caulk::concurrent::details::node_allocator<void *,caulk::alloc::detail::tracked_block,10ul,(caulk::concurrent::skiplist_options)0>::size_generator,8ul,1ul,-1l>>::~__shared_ptr_emplace(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&unk_26C2AAF00;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void caulk::alloc::exported_resource<caulk::alloc::darwin_resource<caulk::alloc::dsw_allocator2<true>,caulk::alloc::rt_safe_memory_resource>,caulk::alloc::rt_safe_memory_resource,caulk::rt_safe_memory_resource>::~exported_resource(std::pmr::memory_resource *a1)
{
  *(void *)a1 = &unk_26C2AA398;
  *((void *)a1 + 2) = &unk_26C2AA248;
  uint64_t v2 = *((void *)a1 + 200);
  *((void *)a1 + 200) = 0;
  if (v2) {
    std::default_delete<caulk::alloc::darwin_resource<caulk::alloc::dsw_allocator2<true>,caulk::alloc::rt_safe_memory_resource>::zone_plus>::operator()[abi:ne180100](v2);
  }
  caulk::alloc::tree_allocator<caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,16ul,6ul>>::~tree_allocator((uint64_t)a1 + 992);
  caulk::alloc::tree_allocator<caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,256ul,6ul>>::~tree_allocator((uint64_t)a1 + 384);
  caulk::alloc::tracking_allocator<caulk::alloc::global_page_cache>::~tracking_allocator((uint64_t)a1 + 32);
  std::pmr::memory_resource::~memory_resource(a1);

  JUMPOUT(0x216674B00);
}

{
  uint64_t v2;
  uint64_t vars8;

  *(void *)a1 = &unk_26C2AA398;
  *((void *)a1 + 2) = &unk_26C2AA248;
  uint64_t v2 = *((void *)a1 + 200);
  *((void *)a1 + 200) = 0;
  if (v2) {
    std::default_delete<caulk::alloc::darwin_resource<caulk::alloc::dsw_allocator2<true>,caulk::alloc::rt_safe_memory_resource>::zone_plus>::operator()[abi:ne180100](v2);
  }
  caulk::alloc::tree_allocator<caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,16ul,6ul>>::~tree_allocator((uint64_t)a1 + 992);
  caulk::alloc::tree_allocator<caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,256ul,6ul>>::~tree_allocator((uint64_t)a1 + 384);
  caulk::alloc::tracking_allocator<caulk::alloc::global_page_cache>::~tracking_allocator((uint64_t)a1 + 32);

  std::pmr::memory_resource::~memory_resource(a1);
}

uint64_t *caulk::alloc::make_audio_buffer_resource(caulk::alloc *this)
{
  zone_name = malloc_get_zone_name(*(malloc_zone_t **)*MEMORY[0x263EF8980]);
  if (zone_name && !strcmp(zone_name, "ProbGuardMallocZone")) {
    operator new();
  }
  {
    caulk::alloc::exported_resource<caulk::alloc::darwin_resource<caulk::alloc::audio_allocator,caulk::alloc::memory_resource>,caulk::alloc::memory_resource,caulk::memory_resource>::exported_resource<char const*>();
  }
  dword_26AA5D5C8 = 1;
  dword_26AA5D430 = 1;
  dword_26AA5D2D0 = 1;
  caulk::alloc::registerAllocatorStateDump((caulk::alloc *)&qword_26AA5D2C0, (caulk::alloc::memory_resource *)"com.apple.caulk.alloc.audiodump", "caulk_audio_alloc.", v2);
  return &qword_26AA5D2C0;
}

void sub_210874DA0(_Unwind_Exception *a1)
{
}

void caulk::alloc::exported_resource<caulk::alloc::darwin_resource<caulk::alloc::audio_allocator,caulk::alloc::memory_resource>,caulk::alloc::memory_resource,caulk::memory_resource>::exported_resource<char const*>()
{
  v4[4] = *MEMORY[0x263EF8340];
  caulk::alloc::make_audio_buffer_resource(void)::global = (uint64_t)&unk_26C2AA3D0;
  *(void *)algn_26AA5D2B8 = 0;
  dword_26AA5D2D0 = 0;
  qword_26AA5D2D8 = 0;
  caulk::concurrent::skiplist<void *,caulk::alloc::detail::tracked_block,10,(caulk::concurrent::skiplist_options)0>::skiplist((uint64_t)&unk_26AA5D2E0);
  dword_26AA5D430 = 0;
  qword_26AA5D438 = 0;
  caulk::concurrent::skiplist<void *,caulk::alloc::detail::tracked_block,10,(caulk::concurrent::skiplist_options)0>::skiplist((uint64_t)&unk_26AA5D440);
  dword_26AA5D590 = 0;
  qword_26AA5D5A0 = 0;
  qword_26AA5D5B0 = 0;
  qword_26AA5D5A8 = 0;
  qword_26AA5D598 = (uint64_t)&qword_26AA5D5A0;
  dword_26AA5D5C8 = 0;
  qword_26AA5D5D0 = 0;
  caulk::concurrent::skiplist<unsigned long,caulk::alloc::chunk_allocator<caulk::alloc::page_allocator,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,16ul,6ul>::node_impl<caulk::alloc::tree_allocator<caulk::alloc::chunk_allocator<caulk::alloc::page_allocator,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,16ul,6ul>>::node_header,caulk::alloc::embed_block_memory> *,5,(caulk::concurrent::skiplist_options)1>::skiplist((uint64_t)&unk_26AA5D5E0);
  caulk::concurrent::skiplist<unsigned long,caulk::alloc::chunk_allocator<caulk::alloc::page_allocator,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,16ul,6ul>::node_impl<caulk::alloc::tree_allocator<caulk::alloc::chunk_allocator<caulk::alloc::page_allocator,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,16ul,6ul>>::node_header,caulk::alloc::embed_block_memory> *,5,(caulk::concurrent::skiplist_options)1>::skiplist((uint64_t)&qword_26AA5D6A8[11]);
  qword_26AA5D820 = 0;
  v1[4] = &caulk::inplace_function_detail::vtable<void,caulk::concurrent::details::skiplist_node<unsigned long,caulk::alloc::chunk_allocator<caulk::alloc::page_allocator,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,16ul,6ul>::node_impl<caulk::alloc::tree_allocator<caulk::alloc::chunk_allocator<caulk::alloc::page_allocator,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,16ul,6ul>>::node_header,caulk::alloc::embed_block_memory> *>::layout_kv const&>::empty;
  uint64_t v2 = &unk_26AA5D5C0;
  uint64_t v3 = _ZN5caulk16inplace_functionIFvRKNS_10concurrent7details13skiplist_nodeImPNS_5alloc15chunk_allocatorINS4_14page_allocatorENS4_16bitmap_allocatorENS4_18embed_block_memoryELm16384EJLm16ELm6EEE9node_implINS4_14tree_allocatorIS9_E11node_headerES8_EEE9layout_kvEELm32ELm8ENS_23inplace_function_detail6vtableEE16k_wrapper_vtableIZNSC_C1EvEUlRKT_E_EE;
  _ZZN5caulk23inplace_function_detail6vtableIvJRKNS_10concurrent7details13skiplist_nodeImPNS_5alloc15chunk_allocatorINS5_14page_allocatorENS5_16bitmap_allocatorENS5_18embed_block_memoryELm16384EJLm16ELm6EEE9node_implINS5_14tree_allocatorISA_E11node_headerES9_EEE9layout_kvEEEC1IZNSD_C1EvEUlRKT_E_EENS0_7wrapperISN_EEENUlPvST_E0_8__invokeEST_ST_(v4, &v2);
  (*(void (**)(void *))(qword_26AA5D6A0 + 24))(qword_26AA5D6A8);
  uint64_t v0 = (uint64_t)v3;
  uint64_t v3 = (uint64_t (**)())&caulk::inplace_function_detail::vtable<void,caulk::concurrent::details::skiplist_node<unsigned long,caulk::alloc::chunk_allocator<caulk::alloc::page_allocator,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,16ul,6ul>::node_impl<caulk::alloc::tree_allocator<caulk::alloc::chunk_allocator<caulk::alloc::page_allocator,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,16ul,6ul>>::node_header,caulk::alloc::embed_block_memory> *>::layout_kv const&>::empty;
  qword_26AA5D6A0 = v0;
  (*(void (**)(void *, void *))(v0 + 16))(qword_26AA5D6A8, v4);
  ((void (*)(void *))v3[3])(v4);
  v1[0] = &unk_26AA5D5C0;
  uint64_t v3 = caulk::inplace_function<void ()(void),32ul,8ul,caulk::inplace_function_detail::vtable>::k_wrapper_vtable<caulk::alloc::tree_allocator<caulk::alloc::chunk_allocator<caulk::alloc::page_allocator,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,16ul,6ul>>::tree_allocator(void)::{lambda(void)#1}>;
  caulk::inplace_function_detail::vtable<void>::vtable<caulk::alloc::tree_allocator<caulk::alloc::chunk_allocator<caulk::alloc::page_allocator,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,16ul,6ul>>::tree_allocator(void)::{lambda(void)#1}>(caulk::inplace_function_detail::wrapper<caulk::alloc::tree_allocator<caulk::alloc::chunk_allocator<caulk::alloc::page_allocator,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,16ul,6ul>>::tree_allocator(void)::{lambda(void)#1}>)::{lambda(void *,void *)#2}::__invoke(v4, v1);
  caulk::inplace_function<void ()(void),32ul,8ul,caulk::inplace_function_detail::vtable>::operator=(&qword_26AA5D6A8[40], (uint64_t *)&v3);
  ((void (*)(void *))v3[3])(v4);
  qword_26AA5D2C0 = (uint64_t)&unk_26C2AA2B8;
  operator new();
}

void sub_2108750C0(_Unwind_Exception *a1)
{
  MEMORY[0x216674B00](v2, 0x10F0C40DEC95547);
  caulk::alloc::resource<caulk::alloc::audio_allocator,caulk::alloc::memory_resource>::~resource((uint64_t)v1 + 16);
  std::pmr::memory_resource::~memory_resource(v1);
  _Unwind_Resume(a1);
}

uint64_t caulk::alloc::resource<caulk::alloc::audio_allocator,caulk::alloc::memory_resource>::~resource(uint64_t a1)
{
  uint64_t v2 = a1 + 16;
  unint64_t v3 = a1 + 1088;
  caulk::concurrent::skiplist<unsigned long,caulk::alloc::chunk_allocator<caulk::alloc::page_allocator,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,16ul,6ul>::node_impl<caulk::alloc::tree_allocator<caulk::alloc::chunk_allocator<caulk::alloc::page_allocator,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,16ul,6ul>>::node_header,caulk::alloc::embed_block_memory> *,5,(caulk::concurrent::skiplist_options)1>::clear(a1 + 1088);
  caulk::concurrent::skiplist<unsigned long,caulk::alloc::chunk_allocator<caulk::alloc::page_allocator,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,16ul,6ul>::node_impl<caulk::alloc::tree_allocator<caulk::alloc::chunk_allocator<caulk::alloc::page_allocator,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,16ul,6ul>>::node_header,caulk::alloc::embed_block_memory> *,5,(caulk::concurrent::skiplist_options)1>::clear(a1 + 800);
  caulk::concurrent::skiplist<unsigned long,caulk::alloc::chunk_allocator<caulk::alloc::page_allocator,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,16ul,6ul>::node_impl<caulk::alloc::tree_allocator<caulk::alloc::chunk_allocator<caulk::alloc::page_allocator,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,16ul,6ul>>::node_header,caulk::alloc::embed_block_memory> *,5,(caulk::concurrent::skiplist_options)1>::clear(v3);
  caulk::concurrent::details::node_allocator<unsigned long,caulk::alloc::chunk_allocator<caulk::alloc::page_allocator,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,16ul,6ul>::node_impl<caulk::alloc::tree_allocator<caulk::alloc::chunk_allocator<caulk::alloc::page_allocator,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,16ul,6ul>>::node_header,caulk::alloc::embed_block_memory> *,5ul,(caulk::concurrent::skiplist_options)1>::~node_allocator((void *)(a1 + 1248));
  caulk::concurrent::skiplist<unsigned long,caulk::alloc::chunk_allocator<caulk::alloc::page_allocator,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,16ul,6ul>::node_impl<caulk::alloc::tree_allocator<caulk::alloc::chunk_allocator<caulk::alloc::page_allocator,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,16ul,6ul>>::node_header,caulk::alloc::embed_block_memory> *,5,(caulk::concurrent::skiplist_options)1>::clear(a1 + 800);
  caulk::concurrent::details::node_allocator<unsigned long,caulk::alloc::chunk_allocator<caulk::alloc::page_allocator,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,16ul,6ul>::node_impl<caulk::alloc::tree_allocator<caulk::alloc::chunk_allocator<caulk::alloc::page_allocator,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,16ul,6ul>>::node_header,caulk::alloc::embed_block_memory> *,5ul,(caulk::concurrent::skiplist_options)1>::~node_allocator((void *)(a1 + 960));
  std::__tree<std::__value_type<unsigned long long,unsigned int>,std::__map_value_compare<unsigned long long,std::__value_type<unsigned long long,unsigned int>,std::less<unsigned long long>,true>,std::allocator<std::__value_type<unsigned long long,unsigned int>>>::destroy(*(void **)(a1 + 736));
  caulk::alloc::tracking_allocator<caulk::alloc::page_allocator>::~tracking_allocator(a1 + 368);
  caulk::alloc::tracking_allocator<caulk::alloc::page_allocator>::~tracking_allocator(v2);
  return a1;
}

uint64_t caulk::alloc::tracking_allocator<caulk::alloc::page_allocator>::~tracking_allocator(uint64_t a1)
{
  unint64_t v2 = a1 + 272;
  caulk::concurrent::details::node_allocator<void *,caulk::alloc::detail::tracked_block,10ul,(caulk::concurrent::skiplist_options)0>::begin_traversal();
  unint64_t v3 = atomic_load((unint64_t *)(a1 + 56));
  unint64_t v4 = v3 & 0xFFFFFFFFFFFFFFFCLL;
  if (a1 + 216 != (v3 & 0xFFFFFFFFFFFFFFFCLL))
  {
    BOOL v5 = (void *)MEMORY[0x263EF8AF8];
    do
    {
      if (*(unsigned char *)(v4 + 26) != 2)
      {
        char v6 = atomic_load((unint64_t *)(v4 + 40));
        if ((v6 & 1) == 0) {
          caulk::mach::vm_block::dealloc(*(caulk::mach::vm_block **)(v4 + 16), (*(void *)v4 + *v5 - 1) & -*v5);
        }
      }
      unint64_t v3 = atomic_load((unint64_t *)(v4 + 40));
      unint64_t v4 = v3 & 0xFFFFFFFFFFFFFFFCLL;
    }
    while (a1 + 216 != (v3 & 0xFFFFFFFFFFFFFFFCLL));
  }
  caulk::concurrent::details::node_allocator<void *,caulk::alloc::detail::tracked_block,10ul,(caulk::concurrent::skiplist_options)0>::end_traversal(v2, v3);
  caulk::concurrent::skiplist<void *,caulk::alloc::detail::tracked_block,10,(caulk::concurrent::skiplist_options)0>::clear(a1 + 16);
  caulk::concurrent::skiplist<void *,caulk::alloc::detail::tracked_block,10,(caulk::concurrent::skiplist_options)0>::clear(a1 + 16);
  caulk::concurrent::details::node_allocator<void *,caulk::alloc::detail::tracked_block,10ul,(caulk::concurrent::skiplist_options)0>::~node_allocator(v2);
  return a1;
}

void sub_210875270(void *a1@<X0>, unint64_t a2@<X8>)
{
  caulk::concurrent::details::node_allocator<void *,caulk::alloc::detail::tracked_block,10ul,(caulk::concurrent::skiplist_options)0>::end_traversal(v2, a2);
  __clang_call_terminate(a1);
}

uint64_t caulk::concurrent::skiplist<unsigned long,caulk::alloc::chunk_allocator<caulk::alloc::page_allocator,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,16ul,6ul>::node_impl<caulk::alloc::tree_allocator<caulk::alloc::chunk_allocator<caulk::alloc::page_allocator,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,16ul,6ul>>::node_header,caulk::alloc::embed_block_memory> *,5,(caulk::concurrent::skiplist_options)1>::clear(unint64_t a1)
{
  uint64_t v2 = a1 + 160;
  caulk::concurrent::details::node_allocator<void *,caulk::alloc::detail::tracked_block,10ul,(caulk::concurrent::skiplist_options)0>::begin_traversal();
  for (unint64_t i = atomic_load((unint64_t *)(a1 + 32)); ; unint64_t i = atomic_load((unint64_t *)(v4 + 32)))
  {
    unint64_t v4 = i & 0xFFFFFFFFFFFFFFFCLL;
    if (a1 + 112 == (i & 0xFFFFFFFFFFFFFFFCLL)) {
      break;
    }
    if (*(unsigned char *)(v4 + 18) != 2)
    {
      char v5 = atomic_load((unint64_t *)(v4 + 32));
      if ((v5 & 1) == 0) {
        caulk::concurrent::skiplist<unsigned long,caulk::alloc::chunk_allocator<caulk::alloc::page_allocator,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,16ul,6ul>::node_impl<caulk::alloc::tree_allocator<caulk::alloc::chunk_allocator<caulk::alloc::page_allocator,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,16ul,6ul>>::node_header,caulk::alloc::embed_block_memory> *,5,(caulk::concurrent::skiplist_options)1>::remove(a1, *(void *)v4);
      }
    }
  }
  return caulk::concurrent::details::node_allocator<unsigned long,caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,256ul,6ul>::node_impl<caulk::alloc::tree_allocator<caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,256ul,6ul>>::node_header,caulk::alloc::embed_block_memory> *,5ul,(caulk::concurrent::skiplist_options)1>::end_traversal(v2, i);
}

void *caulk::concurrent::details::node_allocator<unsigned long,caulk::alloc::chunk_allocator<caulk::alloc::page_allocator,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,16ul,6ul>::node_impl<caulk::alloc::tree_allocator<caulk::alloc::chunk_allocator<caulk::alloc::page_allocator,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,16ul,6ul>>::node_header,caulk::alloc::embed_block_memory> *,5ul,(caulk::concurrent::skiplist_options)1>::~node_allocator(void *a1)
{
  _X2 = 0;
  _X3 = 0;
  __asm { CASPAL          X2, X3, X2, X3, [X0] }
  if (_X2) {
    caulk::concurrent::details::node_allocator<unsigned long,caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,256ul,6ul>::node_impl<caulk::alloc::tree_allocator<caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,256ul,6ul>>::node_header,caulk::alloc::embed_block_memory> *,5ul,(caulk::concurrent::skiplist_options)1>::free_node_chain((uint64_t)a1, _X2);
  }
  caulk::concurrent::details::node_allocator<unsigned long,caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,256ul,6ul>::node_impl<caulk::alloc::tree_allocator<caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,256ul,6ul>>::node_header,caulk::alloc::embed_block_memory> *,5ul,(caulk::concurrent::skiplist_options)1>::perform_deferred_deletions<true,(BOOL *)0>((uint64_t)a1);
  (*(void (**)(void *))(a1[9] + 24))(a1 + 10);
  (*(void (**)(void *))(a1[4] + 24))(a1 + 5);
  uint64_t v9 = (std::__shared_weak_count *)a1[3];
  if (v9) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v9);
  }
  return a1;
}

uint64_t caulk::concurrent::skiplist<unsigned long,caulk::alloc::chunk_allocator<caulk::alloc::page_allocator,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,16ul,6ul>::node_impl<caulk::alloc::tree_allocator<caulk::alloc::chunk_allocator<caulk::alloc::page_allocator,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,16ul,6ul>>::node_header,caulk::alloc::embed_block_memory> *,5,(caulk::concurrent::skiplist_options)1>::remove(unint64_t a1, uint64_t a2)
{
  uint64_t v4 = a1 + 160;
  caulk::concurrent::details::node_allocator<void *,caulk::alloc::detail::tracked_block,10ul,(caulk::concurrent::skiplist_options)0>::begin_traversal();
  uint64_t v17 = a2;
  uint64_t v5 = -1;
  uint64_t v6 = 48;
  do
  {
    unint64_t v7 = atomic_load((unint64_t *)(a1 + v6));
    ++v5;
    v6 += 16;
  }
  while (*(unsigned char *)((v7 & 0xFFFFFFFFFFFFFFFCLL) + 18) != 2);
  unint64_t v8 = a1;
  if (v5)
  {
    unint64_t v8 = a1;
    do
      unint64_t v8 = caulk::concurrent::skiplist<unsigned long,caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,256ul,6ul>::node_impl<caulk::alloc::tree_allocator<caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,256ul,6ul>>::node_header,caulk::alloc::embed_block_memory> *,5,(caulk::concurrent::skiplist_options)1>::search_right<caulk::concurrent::skiplist<unsigned long,caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,256ul,6ul>::node_impl<caulk::alloc::tree_allocator<caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,256ul,6ul>>::node_header,caulk::alloc::embed_block_memory> *,5,(caulk::concurrent::skiplist_options)1>::key_lt &>(a1, v5--, v8, &v17);
    while (v5);
  }
  unint64_t v9 = caulk::concurrent::skiplist<unsigned long,caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,256ul,6ul>::node_impl<caulk::alloc::tree_allocator<caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,256ul,6ul>>::node_header,caulk::alloc::embed_block_memory> *,5,(caulk::concurrent::skiplist_options)1>::search_right<caulk::concurrent::skiplist<unsigned long,caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,256ul,6ul>::node_impl<caulk::alloc::tree_allocator<caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,256ul,6ul>>::node_header,caulk::alloc::embed_block_memory> *,5,(caulk::concurrent::skiplist_options)1>::key_lt &>(a1, 0, v8, &v17);
  unint64_t v11 = *v10;
  if (*v10 == a2)
  {
    uint64_t v12 = (uint64_t)v10;
    unint64_t v13 = caulk::concurrent::skiplist<unsigned long,caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,256ul,6ul>::node_impl<caulk::alloc::tree_allocator<caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,256ul,6ul>>::node_header,caulk::alloc::embed_block_memory> *,5,(caulk::concurrent::skiplist_options)1>::try_flag_node(a1, 0, v9, (unint64_t)v10);
    uint64_t v15 = v14;
    if (!v14) {
      caulk::concurrent::skiplist<unsigned long,caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,256ul,6ul>::node_impl<caulk::alloc::tree_allocator<caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,256ul,6ul>>::node_header,caulk::alloc::embed_block_memory> *,5,(caulk::concurrent::skiplist_options)1>::help_flagged(a1, 0, v13, v12);
    }
    if ((v15 & 0xFF00000000) != 0)
    {
      uint64_t v17 = a2;
      caulk::concurrent::skiplist<unsigned long,caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,256ul,6ul>::node_impl<caulk::alloc::tree_allocator<caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,256ul,6ul>>::node_header,caulk::alloc::embed_block_memory> *,5,(caulk::concurrent::skiplist_options)1>::search_to_level<caulk::concurrent::skiplist<unsigned long,caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,256ul,6ul>::node_impl<caulk::alloc::tree_allocator<caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,256ul,6ul>>::node_header,caulk::alloc::embed_block_memory> *,5,(caulk::concurrent::skiplist_options)1>::key_le>(a1, &v17, 0);
    }
  }
  return caulk::concurrent::details::node_allocator<unsigned long,caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,256ul,6ul>::node_impl<caulk::alloc::tree_allocator<caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,256ul,6ul>>::node_header,caulk::alloc::embed_block_memory> *,5ul,(caulk::concurrent::skiplist_options)1>::end_traversal(v4, v11);
}

uint64_t caulk::alloc::darwin_resource<caulk::alloc::audio_allocator,caulk::alloc::memory_resource>::zone_locked()
{
  return 0;
}

double caulk::alloc::darwin_resource<caulk::alloc::audio_allocator,caulk::alloc::memory_resource>::zone_statistics(uint64_t a1, _OWORD *a2)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  uint64_t v3 = *(void *)(a1 - 8);
  long long v8 = 0u;
  long long v9 = 0u;
  v10[0] = &unk_26C2AADA0;
  v10[1] = &v8;
  v10[3] = v10;
  v11[0] = &unk_26C2AAAE0;
  v11[1] = v10;
  v11[3] = v11;
  int v12 = 7;
  v13[0] = &unk_26C2AB948;
  v13[1] = caulk::alloc::introspector::local_reader;
  uint64_t v14 = v13;
  std::__function::__value_func<void ()(caulk::alloc::region_usage,unsigned long,unsigned long)>::__value_func[abi:ne180100]((uint64_t)v15, (uint64_t)v11);
  char v16 = 1;
  std::__function::__value_func<void ()(caulk::alloc::region_usage,unsigned long,unsigned long)>::~__value_func[abi:ne180100](v11);
  uint64_t v4 = std::function<void * ()(unsigned long,unsigned long)>::operator()((uint64_t)v14, v3, 1424);
  caulk::alloc::tiered_allocator<caulk::alloc::size_range_tier<0ul,1008ul,caulk::alloc::tree_allocator<caulk::alloc::chunk_allocator<caulk::alloc::page_allocator,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,16ul,6ul>>>,caulk::alloc::size_range_tier<1009ul,256000ul,caulk::alloc::guarded_edges_allocator<caulk::alloc::consolidating_free_map<caulk::alloc::page_allocator,10485760ul>,4ul>>,caulk::alloc::tracking_allocator<caulk::alloc::page_allocator>>::introspect(v4 + 16, v3, (uint64_t)&v12);
  std::__function::__value_func<void ()(caulk::alloc::region_usage,unsigned long,unsigned long)>::~__value_func[abi:ne180100](v15);
  std::__function::__value_func<void * ()(unsigned long,unsigned long)>::~__value_func[abi:ne180100](v13);
  std::__function::__value_func<void ()(caulk::alloc::region_usage,caulk::alloc::block)>::~__value_func[abi:ne180100](v10);
  uint64_t v5 = *((void *)&v8 + 1);
  if (*(void *)(v3 + 1400) > *((void *)&v8 + 1)) {
    uint64_t v5 = *(void *)(v3 + 1400);
  }
  *(void *)&long long v9 = v5;
  *((void *)&v9 + 1) += *((void *)&v8 + 1);
  *(void *)(v3 + 1400) = v5;
  double result = *(double *)&v8;
  long long v7 = v9;
  *a2 = v8;
  a2[1] = v7;
  return result;
}

void sub_210875620(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, ...)
{
  va_start(va, a6);
  std::__function::__value_func<void ()(caulk::alloc::region_usage,unsigned long,unsigned long)>::~__value_func[abi:ne180100](v7);
  std::__function::__value_func<void * ()(unsigned long,unsigned long)>::~__value_func[abi:ne180100](v6);
  std::__function::__value_func<void ()(caulk::alloc::region_usage,caulk::alloc::block)>::~__value_func[abi:ne180100]((uint64_t *)va);
  _Unwind_Resume(a1);
}

uint64_t caulk::alloc::tiered_allocator<caulk::alloc::size_range_tier<0ul,1008ul,caulk::alloc::tree_allocator<caulk::alloc::chunk_allocator<caulk::alloc::page_allocator,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,16ul,6ul>>>,caulk::alloc::size_range_tier<1009ul,256000ul,caulk::alloc::guarded_edges_allocator<caulk::alloc::consolidating_free_map<caulk::alloc::page_allocator,10485760ul>,4ul>>,caulk::alloc::tracking_allocator<caulk::alloc::page_allocator>>::introspect(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  LOBYTE(v13) = 0;
  char v15 = 0;
  if (*(unsigned char *)(a3 + 72))
  {
    unint64_t v13 = (int **)(a1 + 784);
    uint64_t v14 = a1 + 944;
    caulk::concurrent::details::node_allocator<void *,caulk::alloc::detail::tracked_block,10ul,(caulk::concurrent::skiplist_options)0>::begin_traversal();
    char v15 = 1;
  }
  for (uint64_t i = a1 + 784;
        ;
        uint64_t i = std::function<void * ()(unsigned long,unsigned long)>::operator()(*(void *)(a3 + 32), v6 & 0xFFFFFFFFFFFFFFFCLL, 48))
  {
    unint64_t v6 = atomic_load((unint64_t *)(i + 32));
    if (!*(unsigned char *)(i + 18))
    {
      uint64_t v7 = *(void *)(i + 8);
      uint64_t v8 = std::function<void * ()(unsigned long,unsigned long)>::operator()(*(void *)(a3 + 32), v7, 0x4000);
      caulk::alloc::bitmap_allocator<caulk::alloc::embed_block_memory,16368ul,16ul,6ul>::introspect(v8 + 16, v7 + 16, a3);
    }
    if ((v6 & 0xFFFFFFFFFFFFFFFCLL) == 0) {
      break;
    }
  }
  std::__optional_destruct_base<caulk::concurrent::skiplist<unsigned long,caulk::alloc::chunk_allocator<caulk::alloc::page_allocator,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,16ul,6ul>::node_impl<caulk::alloc::tree_allocator<caulk::alloc::chunk_allocator<caulk::alloc::page_allocator,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,16ul,6ul>>::node_header,caulk::alloc::embed_block_memory> *,5,(caulk::concurrent::skiplist_options)1>::iteration,false>::~__optional_destruct_base[abi:ne180100]((uint64_t)&v13);
  v12[0] = &unk_26C2ABC08;
  v12[1] = a3;
  v12[3] = v12;
  LODWORD(v13) = *(_DWORD *)a3;
  std::__function::__value_func<void * ()(unsigned long,unsigned long)>::__value_func[abi:ne180100]((uint64_t)&v14, a3 + 8);
  std::__function::__value_func<void ()(caulk::alloc::region_usage,unsigned long,unsigned long)>::__value_func[abi:ne180100]((uint64_t)v16, (uint64_t)v12);
  char v17 = *(unsigned char *)(a3 + 72);
  std::__function::__value_func<void ()(caulk::alloc::region_usage,unsigned long,unsigned long)>::~__value_func[abi:ne180100](v12);
  uint64_t v10 = &v13;
  unint64_t v11 = &v10;
  caulk::concurrent::skiplist<void *,caulk::alloc::detail::tracked_block,10,(caulk::concurrent::skiplist_options)0>::introspect<void caulk::alloc::tracking_allocator<caulk::alloc::page_allocator>::introspect_foreach<caulk::alloc::consolidating_free_map<caulk::alloc::page_allocator,10485760ul>::introspect(unsigned long,caulk::alloc::introspector const&)::{lambda(void *,unsigned long)#1}>(caulk::alloc::introspector const&,caulk::alloc::consolidating_free_map<caulk::alloc::page_allocator,10485760ul>::introspect(unsigned long,caulk::alloc::introspector const&)::{lambda(void *,unsigned long)#1} &&)::{lambda(caulk::alloc::consolidating_free_map<caulk::alloc::page_allocator,10485760ul>::introspect(unsigned long,caulk::alloc::introspector const&)::{lambda(void *,unsigned long)#1} const&)#1}>(a1 + 368, (uint64_t)&v14, (int ***)&v11);
  std::__function::__value_func<void ()(caulk::alloc::region_usage,unsigned long,unsigned long)>::~__value_func[abi:ne180100](v16);
  std::__function::__value_func<void * ()(unsigned long,unsigned long)>::~__value_func[abi:ne180100](&v14);
  v12[0] = a3;
  unint64_t v13 = (int **)v12;
  return caulk::concurrent::skiplist<void *,caulk::alloc::detail::tracked_block,10,(caulk::concurrent::skiplist_options)0>::introspect<void caulk::alloc::tracking_allocator<caulk::alloc::global_page_cache>::introspect_foreach<caulk::alloc::tracking_allocator<caulk::alloc::global_page_cache>::introspect(unsigned long,caulk::alloc::introspector const&)::{lambda(void *,unsigned long)#1}>(caulk::alloc::introspector const&,caulk::alloc::tracking_allocator<caulk::alloc::global_page_cache>::introspect(unsigned long,caulk::alloc::introspector const&)::{lambda(void *,unsigned long)#1} &&)::{lambda(caulk::alloc::tracking_allocator<caulk::alloc::global_page_cache>::introspect(unsigned long,caulk::alloc::introspector const&)::{lambda(void *,unsigned long)#1} const&)#1}>(a1 + 16, a3 + 8, &v13);
}

void sub_2108757DC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, char a12, uint64_t a13, uint64_t a14, uint64_t a15, char a16)
{
}

void caulk::concurrent::skiplist<void *,caulk::alloc::detail::tracked_block,10,(caulk::concurrent::skiplist_options)0>::introspect<void caulk::alloc::tracking_allocator<caulk::alloc::page_allocator>::introspect_foreach<caulk::alloc::consolidating_free_map<caulk::alloc::page_allocator,10485760ul>::introspect(unsigned long,caulk::alloc::introspector const&)::{lambda(void *,unsigned long)#1}>(caulk::alloc::introspector const&,caulk::alloc::consolidating_free_map<caulk::alloc::page_allocator,10485760ul>::introspect(unsigned long,caulk::alloc::introspector const&)::{lambda(void *,unsigned long)#1} &&)::{lambda(caulk::alloc::consolidating_free_map<caulk::alloc::page_allocator,10485760ul>::introspect(unsigned long,caulk::alloc::introspector const&)::{lambda(void *,unsigned long)#1} const&)#1}>(uint64_t a1, uint64_t a2, int ***a3)
{
  while (1)
  {
    unint64_t v5 = atomic_load((unint64_t *)(a1 + 40));
    if (!*(unsigned char *)(a1 + 26))
    {
      unint64_t v6 = *a3;
      uint64_t v7 = *(void *)(a1 + 16);
      uint64_t v8 = (*(void *)a1 + *MEMORY[0x263EF8AF8] - 1) & -*MEMORY[0x263EF8AF8];
      unint64_t v9 = std::function<void * ()(unsigned long,unsigned long)>::operator()(*((void *)**a3 + 4), v7, v8);
      unint64_t v10 = v7 - v9;
      unint64_t v11 = v8 + v9;
      unint64_t v12 = v9;
      while (v12 >= v9 && v11 > v12)
      {
        unint64_t v13 = *v6;
        int v14 = **v6;
        if ((v14 & 4) != 0)
        {
          std::function<void ()(caulk::alloc::region_usage,unsigned long,unsigned long)>::operator()(*((void *)v13 + 8), 4, v10 + v12, 32);
          unint64_t v13 = *v6;
          int v14 = **v6;
        }
        unint64_t v15 = *(void *)(v12 + 24);
        if (*(void *)(v12 + 16)) {
          int v16 = 2;
        }
        else {
          int v16 = 1;
        }
        if ((v16 & v14) != 0)
        {
          std::function<void ()(caulk::alloc::region_usage,unsigned long,unsigned long)>::operator()(*((void *)v13 + 8), v16, v10 + v12 + 32, v15 >> 1);
          unint64_t v15 = *(void *)(v12 + 24);
        }
        v12 += (v15 >> 1) + 32;
        if (v15) {
          goto LABEL_16;
        }
      }
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)char v17 = 0;
        _os_log_fault_impl(&dword_210865000, &_os_log_internal, OS_LOG_TYPE_FAULT, "consolidating_free_map::introspect: walked past end of slab; target process's memory may be corrupt",
          v17,
          2u);
      }
    }
LABEL_16:
    if ((v5 & 0xFFFFFFFFFFFFFFFCLL) == 0) {
      break;
    }
    a1 = std::function<void * ()(unsigned long,unsigned long)>::operator()(*(void *)(a2 + 24), v5 & 0xFFFFFFFFFFFFFFFCLL, 56);
  }
}

void *std::__function::__func<void caulk::alloc::affix_allocator<caulk::alloc::consolidating_free_map<caulk::alloc::page_allocator,10485760ul>,std::array<unsigned long long,4ul>,std::array<unsigned long long,4ul>>::introspect<true,(BOOL *)0>(unsigned long,caulk::alloc::introspector const&)::{lambda(caulk::alloc::region_usage,unsigned long,unsigned long)#1},std::allocator<void caulk::alloc::affix_allocator<caulk::alloc::consolidating_free_map<caulk::alloc::page_allocator,10485760ul>,std::array<unsigned long long,4ul>,std::array<unsigned long long,4ul>>::introspect<true,(BOOL *)0>(unsigned long,caulk::alloc::introspector const&)::{lambda(caulk::alloc::region_usage,unsigned long,unsigned long)#1}>,void ()(caulk::alloc::region_usage,unsigned long,unsigned long)>::target_type()
{
}

uint64_t std::__function::__func<void caulk::alloc::affix_allocator<caulk::alloc::consolidating_free_map<caulk::alloc::page_allocator,10485760ul>,std::array<unsigned long long,4ul>,std::array<unsigned long long,4ul>>::introspect<true,(BOOL *)0>(unsigned long,caulk::alloc::introspector const&)::{lambda(caulk::alloc::region_usage,unsigned long,unsigned long)#1},std::allocator<void caulk::alloc::affix_allocator<caulk::alloc::consolidating_free_map<caulk::alloc::page_allocator,10485760ul>,std::array<unsigned long long,4ul>,std::array<unsigned long long,4ul>>::introspect<true,(BOOL *)0>(unsigned long,caulk::alloc::introspector const&)::{lambda(caulk::alloc::region_usage,unsigned long,unsigned long)#1}>,void ()(caulk::alloc::region_usage,unsigned long,unsigned long)>::target(uint64_t a1, uint64_t a2)
{
  if (std::type_info::operator==[abi:ne180100](*(void *)(a2 + 8), (uint64_t)"ZNK5caulk5alloc15affix_allocatorINS0_22consolidating_free_mapINS0_14page_allocatorELm10485760EEENSt3__15arrayIyLm4EEES7_E10introspectILb1ELPb0EEEvmRKNS0_12introspectorEEUlNS0_12region_usageEmmE_"))
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

uint64_t std::__function::__func<void caulk::alloc::affix_allocator<caulk::alloc::consolidating_free_map<caulk::alloc::page_allocator,10485760ul>,std::array<unsigned long long,4ul>,std::array<unsigned long long,4ul>>::introspect<true,(BOOL *)0>(unsigned long,caulk::alloc::introspector const&)::{lambda(caulk::alloc::region_usage,unsigned long,unsigned long)#1},std::allocator<void caulk::alloc::affix_allocator<caulk::alloc::consolidating_free_map<caulk::alloc::page_allocator,10485760ul>,std::array<unsigned long long,4ul>,std::array<unsigned long long,4ul>>::introspect<true,(BOOL *)0>(unsigned long,caulk::alloc::introspector const&)::{lambda(caulk::alloc::region_usage,unsigned long,unsigned long)#1}>,void ()(caulk::alloc::region_usage,unsigned long,unsigned long)>::operator()(uint64_t result, int *a2, uint64_t *a3, uint64_t *a4)
{
  int v4 = *a2;
  uint64_t v5 = *a3;
  uint64_t v6 = *a4;
  uint64_t v7 = *(int **)(result + 8);
  int v8 = *v7;
  if (v4 == 1)
  {
    if ((v8 & 1) == 0) {
      return result;
    }
    v6 -= 64;
    v5 += 32;
    uint64_t v9 = *((void *)v7 + 8);
    int v4 = 1;
    return std::function<void ()(caulk::alloc::region_usage,unsigned long,unsigned long)>::operator()(v9, v4, v5, v6);
  }
  if ((v8 & v4) != 0)
  {
    uint64_t v9 = *((void *)v7 + 8);
    return std::function<void ()(caulk::alloc::region_usage,unsigned long,unsigned long)>::operator()(v9, v4, v5, v6);
  }
  return result;
}

uint64_t std::__function::__func<void caulk::alloc::affix_allocator<caulk::alloc::consolidating_free_map<caulk::alloc::page_allocator,10485760ul>,std::array<unsigned long long,4ul>,std::array<unsigned long long,4ul>>::introspect<true,(BOOL *)0>(unsigned long,caulk::alloc::introspector const&)::{lambda(caulk::alloc::region_usage,unsigned long,unsigned long)#1},std::allocator<void caulk::alloc::affix_allocator<caulk::alloc::consolidating_free_map<caulk::alloc::page_allocator,10485760ul>,std::array<unsigned long long,4ul>,std::array<unsigned long long,4ul>>::introspect<true,(BOOL *)0>(unsigned long,caulk::alloc::introspector const&)::{lambda(caulk::alloc::region_usage,unsigned long,unsigned long)#1}>,void ()(caulk::alloc::region_usage,unsigned long,unsigned long)>::__clone(uint64_t result, void *a2)
{
  uint64_t v2 = *(void *)(result + 8);
  *a2 = &unk_26C2ABC08;
  a2[1] = v2;
  return result;
}

void *std::__function::__func<void caulk::alloc::affix_allocator<caulk::alloc::consolidating_free_map<caulk::alloc::page_allocator,10485760ul>,std::array<unsigned long long,4ul>,std::array<unsigned long long,4ul>>::introspect<true,(BOOL *)0>(unsigned long,caulk::alloc::introspector const&)::{lambda(caulk::alloc::region_usage,unsigned long,unsigned long)#1},std::allocator<void caulk::alloc::affix_allocator<caulk::alloc::consolidating_free_map<caulk::alloc::page_allocator,10485760ul>,std::array<unsigned long long,4ul>,std::array<unsigned long long,4ul>>::introspect<true,(BOOL *)0>(unsigned long,caulk::alloc::introspector const&)::{lambda(caulk::alloc::region_usage,unsigned long,unsigned long)#1}>,void ()(caulk::alloc::region_usage,unsigned long,unsigned long)>::__clone(uint64_t a1)
{
  double result = operator new(0x10uLL);
  uint64_t v3 = *(void *)(a1 + 8);
  *double result = &unk_26C2ABC08;
  result[1] = v3;
  return result;
}

void std::__function::__func<void caulk::alloc::affix_allocator<caulk::alloc::consolidating_free_map<caulk::alloc::page_allocator,10485760ul>,std::array<unsigned long long,4ul>,std::array<unsigned long long,4ul>>::introspect<true,(BOOL *)0>(unsigned long,caulk::alloc::introspector const&)::{lambda(caulk::alloc::region_usage,unsigned long,unsigned long)#1},std::allocator<void caulk::alloc::affix_allocator<caulk::alloc::consolidating_free_map<caulk::alloc::page_allocator,10485760ul>,std::array<unsigned long long,4ul>,std::array<unsigned long long,4ul>>::introspect<true,(BOOL *)0>(unsigned long,caulk::alloc::introspector const&)::{lambda(caulk::alloc::region_usage,unsigned long,unsigned long)#1}>,void ()(caulk::alloc::region_usage,unsigned long,unsigned long)>::~__func()
{
}

uint64_t std::__optional_destruct_base<caulk::concurrent::skiplist<unsigned long,caulk::alloc::chunk_allocator<caulk::alloc::page_allocator,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,16ul,6ul>::node_impl<caulk::alloc::tree_allocator<caulk::alloc::chunk_allocator<caulk::alloc::page_allocator,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,16ul,6ul>>::node_header,caulk::alloc::embed_block_memory> *,5,(caulk::concurrent::skiplist_options)1>::iteration,false>::~__optional_destruct_base[abi:ne180100](uint64_t a1)
{
  if (*(unsigned char *)(a1 + 16)) {
    caulk::concurrent::details::node_allocator<unsigned long,caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,256ul,6ul>::node_impl<caulk::alloc::tree_allocator<caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,256ul,6ul>>::node_header,caulk::alloc::embed_block_memory> *,5ul,(caulk::concurrent::skiplist_options)1>::end_traversal(*(void *)(a1 + 8), *(unsigned __int8 *)(a1 + 16));
  }
  return a1;
}

void *std::__function::__func<void caulk::alloc::allocator_enumerate<caulk::alloc::darwin_resource<caulk::alloc::audio_allocator,caulk::alloc::memory_resource>>(caulk::alloc::darwin_resource<caulk::alloc::audio_allocator,caulk::alloc::memory_resource> &,caulk::option_set<caulk::alloc::region_usage,unsigned int>,std::function<void ()(caulk::alloc::region_usage,caulk::alloc::block)> const&)::{lambda(caulk::alloc::region_usage,unsigned long,unsigned long)#1},std::allocator<void caulk::alloc::allocator_enumerate<caulk::alloc::darwin_resource<caulk::alloc::audio_allocator,caulk::alloc::memory_resource>>(caulk::alloc::darwin_resource<caulk::alloc::audio_allocator,caulk::alloc::memory_resource> &,caulk::option_set<caulk::alloc::region_usage,unsigned int>,std::function<void ()(caulk::alloc::region_usage,caulk::alloc::block)> const&)::{lambda(caulk::alloc::region_usage,unsigned long,unsigned long)#1}>,void ()(caulk::alloc::region_usage,unsigned long,unsigned long)>::target_type()
{
}

uint64_t std::__function::__func<void caulk::alloc::allocator_enumerate<caulk::alloc::darwin_resource<caulk::alloc::audio_allocator,caulk::alloc::memory_resource>>(caulk::alloc::darwin_resource<caulk::alloc::audio_allocator,caulk::alloc::memory_resource> &,caulk::option_set<caulk::alloc::region_usage,unsigned int>,std::function<void ()(caulk::alloc::region_usage,caulk::alloc::block)> const&)::{lambda(caulk::alloc::region_usage,unsigned long,unsigned long)#1},std::allocator<void caulk::alloc::allocator_enumerate<caulk::alloc::darwin_resource<caulk::alloc::audio_allocator,caulk::alloc::memory_resource>>(caulk::alloc::darwin_resource<caulk::alloc::audio_allocator,caulk::alloc::memory_resource> &,caulk::option_set<caulk::alloc::region_usage,unsigned int>,std::function<void ()(caulk::alloc::region_usage,caulk::alloc::block)> const&)::{lambda(caulk::alloc::region_usage,unsigned long,unsigned long)#1}>,void ()(caulk::alloc::region_usage,unsigned long,unsigned long)>::target(uint64_t a1, uint64_t a2)
{
  if (std::type_info::operator==[abi:ne180100](*(void *)(a2 + 8), (uint64_t)"ZN5caulk5alloc19allocator_enumerateINS0_15darwin_resourceINS0_15audio_allocatorENS0_15memory_resourceEEEEEvRT_NS_10option_setINS0_12region_usageEjEERKNSt3__18functionIFvS9_NS0_5blockEEEEEUlS9_mmE_"))
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

uint64_t std::__function::__func<void caulk::alloc::allocator_enumerate<caulk::alloc::darwin_resource<caulk::alloc::audio_allocator,caulk::alloc::memory_resource>>(caulk::alloc::darwin_resource<caulk::alloc::audio_allocator,caulk::alloc::memory_resource> &,caulk::option_set<caulk::alloc::region_usage,unsigned int>,std::function<void ()(caulk::alloc::region_usage,caulk::alloc::block)> const&)::{lambda(caulk::alloc::region_usage,unsigned long,unsigned long)#1},std::allocator<void caulk::alloc::allocator_enumerate<caulk::alloc::darwin_resource<caulk::alloc::audio_allocator,caulk::alloc::memory_resource>>(caulk::alloc::darwin_resource<caulk::alloc::audio_allocator,caulk::alloc::memory_resource> &,caulk::option_set<caulk::alloc::region_usage,unsigned int>,std::function<void ()(caulk::alloc::region_usage,caulk::alloc::block)> const&)::{lambda(caulk::alloc::region_usage,unsigned long,unsigned long)#1}>,void ()(caulk::alloc::region_usage,unsigned long,unsigned long)>::operator()(uint64_t a1, int *a2, uint64_t *a3, uint64_t *a4)
{
  return std::function<void ()(caulk::alloc::region_usage,caulk::alloc::block)>::operator()(*(void *)(*(void *)(a1 + 8) + 24), *a2, *a3, *a4);
}

uint64_t std::__function::__func<void caulk::alloc::allocator_enumerate<caulk::alloc::darwin_resource<caulk::alloc::audio_allocator,caulk::alloc::memory_resource>>(caulk::alloc::darwin_resource<caulk::alloc::audio_allocator,caulk::alloc::memory_resource> &,caulk::option_set<caulk::alloc::region_usage,unsigned int>,std::function<void ()(caulk::alloc::region_usage,caulk::alloc::block)> const&)::{lambda(caulk::alloc::region_usage,unsigned long,unsigned long)#1},std::allocator<void caulk::alloc::allocator_enumerate<caulk::alloc::darwin_resource<caulk::alloc::audio_allocator,caulk::alloc::memory_resource>>(caulk::alloc::darwin_resource<caulk::alloc::audio_allocator,caulk::alloc::memory_resource> &,caulk::option_set<caulk::alloc::region_usage,unsigned int>,std::function<void ()(caulk::alloc::region_usage,caulk::alloc::block)> const&)::{lambda(caulk::alloc::region_usage,unsigned long,unsigned long)#1}>,void ()(caulk::alloc::region_usage,unsigned long,unsigned long)>::__clone(uint64_t result, void *a2)
{
  uint64_t v2 = *(void *)(result + 8);
  *a2 = &unk_26C2AAAE0;
  a2[1] = v2;
  return result;
}

void *std::__function::__func<void caulk::alloc::allocator_enumerate<caulk::alloc::darwin_resource<caulk::alloc::audio_allocator,caulk::alloc::memory_resource>>(caulk::alloc::darwin_resource<caulk::alloc::audio_allocator,caulk::alloc::memory_resource> &,caulk::option_set<caulk::alloc::region_usage,unsigned int>,std::function<void ()(caulk::alloc::region_usage,caulk::alloc::block)> const&)::{lambda(caulk::alloc::region_usage,unsigned long,unsigned long)#1},std::allocator<void caulk::alloc::allocator_enumerate<caulk::alloc::darwin_resource<caulk::alloc::audio_allocator,caulk::alloc::memory_resource>>(caulk::alloc::darwin_resource<caulk::alloc::audio_allocator,caulk::alloc::memory_resource> &,caulk::option_set<caulk::alloc::region_usage,unsigned int>,std::function<void ()(caulk::alloc::region_usage,caulk::alloc::block)> const&)::{lambda(caulk::alloc::region_usage,unsigned long,unsigned long)#1}>,void ()(caulk::alloc::region_usage,unsigned long,unsigned long)>::__clone(uint64_t a1)
{
  double result = operator new(0x10uLL);
  uint64_t v3 = *(void *)(a1 + 8);
  *double result = &unk_26C2AAAE0;
  result[1] = v3;
  return result;
}

void std::__function::__func<void caulk::alloc::allocator_enumerate<caulk::alloc::darwin_resource<caulk::alloc::audio_allocator,caulk::alloc::memory_resource>>(caulk::alloc::darwin_resource<caulk::alloc::audio_allocator,caulk::alloc::memory_resource> &,caulk::option_set<caulk::alloc::region_usage,unsigned int>,std::function<void ()(caulk::alloc::region_usage,caulk::alloc::block)> const&)::{lambda(caulk::alloc::region_usage,unsigned long,unsigned long)#1},std::allocator<void caulk::alloc::allocator_enumerate<caulk::alloc::darwin_resource<caulk::alloc::audio_allocator,caulk::alloc::memory_resource>>(caulk::alloc::darwin_resource<caulk::alloc::audio_allocator,caulk::alloc::memory_resource> &,caulk::option_set<caulk::alloc::region_usage,unsigned int>,std::function<void ()(caulk::alloc::region_usage,caulk::alloc::block)> const&)::{lambda(caulk::alloc::region_usage,unsigned long,unsigned long)#1}>,void ()(caulk::alloc::region_usage,unsigned long,unsigned long)>::~__func()
{
}

void *std::__function::__func<malloc_statistics_t caulk::alloc::allocator_statistics<caulk::alloc::darwin_resource<caulk::alloc::audio_allocator,caulk::alloc::memory_resource>>(caulk::alloc::darwin_resource<caulk::alloc::audio_allocator,caulk::alloc::memory_resource> &)::{lambda(caulk::alloc::region_usage,caulk::alloc::block)#1},std::allocator<malloc_statistics_t caulk::alloc::allocator_statistics<caulk::alloc::darwin_resource<caulk::alloc::audio_allocator,caulk::alloc::memory_resource>>(caulk::alloc::darwin_resource<caulk::alloc::audio_allocator,caulk::alloc::memory_resource> &)::{lambda(caulk::alloc::region_usage,caulk::alloc::block)#1}>,void ()(caulk::alloc::region_usage,caulk::alloc::block)>::target_type()
{
}

uint64_t std::__function::__func<malloc_statistics_t caulk::alloc::allocator_statistics<caulk::alloc::darwin_resource<caulk::alloc::audio_allocator,caulk::alloc::memory_resource>>(caulk::alloc::darwin_resource<caulk::alloc::audio_allocator,caulk::alloc::memory_resource> &)::{lambda(caulk::alloc::region_usage,caulk::alloc::block)#1},std::allocator<malloc_statistics_t caulk::alloc::allocator_statistics<caulk::alloc::darwin_resource<caulk::alloc::audio_allocator,caulk::alloc::memory_resource>>(caulk::alloc::darwin_resource<caulk::alloc::audio_allocator,caulk::alloc::memory_resource> &)::{lambda(caulk::alloc::region_usage,caulk::alloc::block)#1}>,void ()(caulk::alloc::region_usage,caulk::alloc::block)>::target(uint64_t a1, uint64_t a2)
{
  if (std::type_info::operator==[abi:ne180100](*(void *)(a2 + 8), (uint64_t)"ZN5caulk5alloc20allocator_statisticsINS0_15darwin_resourceINS0_15audio_allocatorENS0_15memory_resourceEEEEE19malloc_statistics_tRT_EUlNS0_12region_usageENS0_5blockEE_"))
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

uint64_t std::__function::__func<malloc_statistics_t caulk::alloc::allocator_statistics<caulk::alloc::darwin_resource<caulk::alloc::audio_allocator,caulk::alloc::memory_resource>>(caulk::alloc::darwin_resource<caulk::alloc::audio_allocator,caulk::alloc::memory_resource> &)::{lambda(caulk::alloc::region_usage,caulk::alloc::block)#1},std::allocator<malloc_statistics_t caulk::alloc::allocator_statistics<caulk::alloc::darwin_resource<caulk::alloc::audio_allocator,caulk::alloc::memory_resource>>(caulk::alloc::darwin_resource<caulk::alloc::audio_allocator,caulk::alloc::memory_resource> &)::{lambda(caulk::alloc::region_usage,caulk::alloc::block)#1}>,void ()(caulk::alloc::region_usage,caulk::alloc::block)>::operator()(uint64_t result, int *a2, uint64_t a3)
{
  int v3 = *a2;
  uint64_t v4 = *(void *)(a3 + 8);
  if (*a2 == 4 || v3 == 2)
  {
    uint64_t v6 = (void *)(*(void *)(result + 8) + 24);
  }
  else
  {
    if (v3 != 1) {
      return result;
    }
    uint64_t v7 = *(_DWORD **)(result + 8);
    ++*v7;
    uint64_t v6 = v7 + 2;
  }
  *v6 += v4;
  return result;
}

uint64_t std::__function::__func<malloc_statistics_t caulk::alloc::allocator_statistics<caulk::alloc::darwin_resource<caulk::alloc::audio_allocator,caulk::alloc::memory_resource>>(caulk::alloc::darwin_resource<caulk::alloc::audio_allocator,caulk::alloc::memory_resource> &)::{lambda(caulk::alloc::region_usage,caulk::alloc::block)#1},std::allocator<malloc_statistics_t caulk::alloc::allocator_statistics<caulk::alloc::darwin_resource<caulk::alloc::audio_allocator,caulk::alloc::memory_resource>>(caulk::alloc::darwin_resource<caulk::alloc::audio_allocator,caulk::alloc::memory_resource> &)::{lambda(caulk::alloc::region_usage,caulk::alloc::block)#1}>,void ()(caulk::alloc::region_usage,caulk::alloc::block)>::__clone(uint64_t result, void *a2)
{
  uint64_t v2 = *(void *)(result + 8);
  *a2 = &unk_26C2AADA0;
  a2[1] = v2;
  return result;
}

void *std::__function::__func<malloc_statistics_t caulk::alloc::allocator_statistics<caulk::alloc::darwin_resource<caulk::alloc::audio_allocator,caulk::alloc::memory_resource>>(caulk::alloc::darwin_resource<caulk::alloc::audio_allocator,caulk::alloc::memory_resource> &)::{lambda(caulk::alloc::region_usage,caulk::alloc::block)#1},std::allocator<malloc_statistics_t caulk::alloc::allocator_statistics<caulk::alloc::darwin_resource<caulk::alloc::audio_allocator,caulk::alloc::memory_resource>>(caulk::alloc::darwin_resource<caulk::alloc::audio_allocator,caulk::alloc::memory_resource> &)::{lambda(caulk::alloc::region_usage,caulk::alloc::block)#1}>,void ()(caulk::alloc::region_usage,caulk::alloc::block)>::__clone(uint64_t a1)
{
  double result = operator new(0x10uLL);
  uint64_t v3 = *(void *)(a1 + 8);
  *double result = &unk_26C2AADA0;
  result[1] = v3;
  return result;
}

void std::__function::__func<malloc_statistics_t caulk::alloc::allocator_statistics<caulk::alloc::darwin_resource<caulk::alloc::audio_allocator,caulk::alloc::memory_resource>>(caulk::alloc::darwin_resource<caulk::alloc::audio_allocator,caulk::alloc::memory_resource> &)::{lambda(caulk::alloc::region_usage,caulk::alloc::block)#1},std::allocator<malloc_statistics_t caulk::alloc::allocator_statistics<caulk::alloc::darwin_resource<caulk::alloc::audio_allocator,caulk::alloc::memory_resource>>(caulk::alloc::darwin_resource<caulk::alloc::audio_allocator,caulk::alloc::memory_resource> &)::{lambda(caulk::alloc::region_usage,caulk::alloc::block)#1}>,void ()(caulk::alloc::region_usage,caulk::alloc::block)>::~__func()
{
}

uint64_t caulk::alloc::darwin_resource<caulk::alloc::audio_allocator,caulk::alloc::memory_resource>::zone_print(uint64_t a1, int a2)
{
  return (*(uint64_t (**)(void, void, BOOL))(**(void **)(a1 - 8) + 48))(*(void *)(a1 - 8), MEMORY[0x263F8C100], a2 != 0);
}

uint64_t caulk::alloc::darwin_resource<caulk::alloc::audio_allocator,caulk::alloc::memory_resource>::zone_check()
{
  return 1;
}

uint64_t caulk::alloc::darwin_resource<caulk::alloc::audio_allocator,caulk::alloc::memory_resource>::zone_good_size(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t caulk::alloc::darwin_resource<caulk::alloc::audio_allocator,caulk::alloc::memory_resource>::zone_enumerate(unsigned int a1, uint64_t a2, int a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  v17[0] = &unk_26C2AA770;
  v17[1] = a5;
  v17[2] = a1;
  v17[3] = v17;
  unint64_t v11 = operator new(0x20uLL);
  void *v11 = &unk_26C2AA718;
  v11[1] = a6;
  *((_DWORD *)v11 + 4) = a1;
  v11[3] = a2;
  void v16[3] = v11;
  int v18 = a3;
  std::__function::__value_func<void * ()(unsigned long,unsigned long)>::__value_func[abi:ne180100]((uint64_t)v19, (uint64_t)v17);
  std::__function::__value_func<void ()(caulk::alloc::region_usage,unsigned long,unsigned long)>::__value_func[abi:ne180100]((uint64_t)v21, (uint64_t)v16);
  char v22 = 0;
  std::__function::__value_func<void ()(caulk::alloc::region_usage,unsigned long,unsigned long)>::~__value_func[abi:ne180100](v16);
  std::__function::__value_func<void * ()(unsigned long,unsigned long)>::~__value_func[abi:ne180100](v17);
  unint64_t v12 = (void *)std::function<void * ()(unsigned long,unsigned long)>::operator()(v20, a4 - 8, 208);
  if (*v12) {
    uint64_t v13 = *v12 + 16;
  }
  else {
    uint64_t v13 = 0;
  }
  uint64_t v14 = std::function<void * ()(unsigned long,unsigned long)>::operator()(v20, v13, 1376);
  caulk::alloc::tiered_allocator<caulk::alloc::size_range_tier<0ul,1008ul,caulk::alloc::tree_allocator<caulk::alloc::chunk_allocator<caulk::alloc::page_allocator,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,16ul,6ul>>>,caulk::alloc::size_range_tier<1009ul,256000ul,caulk::alloc::guarded_edges_allocator<caulk::alloc::consolidating_free_map<caulk::alloc::page_allocator,10485760ul>,4ul>>,caulk::alloc::tracking_allocator<caulk::alloc::page_allocator>>::introspect(v14, v13, (uint64_t)&v18);
  std::__function::__value_func<void ()(caulk::alloc::region_usage,unsigned long,unsigned long)>::~__value_func[abi:ne180100](v21);
  std::__function::__value_func<void * ()(unsigned long,unsigned long)>::~__value_func[abi:ne180100](v19);
  return 0;
}

void sub_210875EA4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, char a14)
{
  if (a2 == 1)
  {
    __cxa_begin_catch(a1);
    __cxa_end_catch();
    JUMPOUT(0x210875E5CLL);
  }
  std::__function::__value_func<void ()(caulk::alloc::region_usage,unsigned long,unsigned long)>::~__value_func[abi:ne180100](v15);
  std::__function::__value_func<void * ()(unsigned long,unsigned long)>::~__value_func[abi:ne180100](v14);
  _Unwind_Resume(a1);
}

void *std::__function::__func<caulk::alloc::darwin_resource<caulk::alloc::audio_allocator,caulk::alloc::memory_resource>::zone_enumerate(unsigned int,void *,unsigned int,unsigned long,int (*)(unsigned int,unsigned long,unsigned long,void **),void (*)(unsigned int,void *,unsigned int,vm_range_t *,unsigned int))::{lambda(caulk::alloc::region_usage,unsigned long,unsigned long)#1},std::allocator<caulk::alloc::darwin_resource<caulk::alloc::audio_allocator,caulk::alloc::memory_resource>::zone_enumerate(unsigned int,void *,unsigned int,unsigned long,int (*)(unsigned int,unsigned long,unsigned long,void **),void (*)(unsigned int,void *,unsigned int,vm_range_t *,unsigned int))::{lambda(caulk::alloc::region_usage,unsigned long,unsigned long)#1}>,void ()(caulk::alloc::region_usage,unsigned long,unsigned long)>::target_type()
{
}

uint64_t std::__function::__func<caulk::alloc::darwin_resource<caulk::alloc::audio_allocator,caulk::alloc::memory_resource>::zone_enumerate(unsigned int,void *,unsigned int,unsigned long,int (*)(unsigned int,unsigned long,unsigned long,void **),void (*)(unsigned int,void *,unsigned int,vm_range_t *,unsigned int))::{lambda(caulk::alloc::region_usage,unsigned long,unsigned long)#1},std::allocator<caulk::alloc::darwin_resource<caulk::alloc::audio_allocator,caulk::alloc::memory_resource>::zone_enumerate(unsigned int,void *,unsigned int,unsigned long,int (*)(unsigned int,unsigned long,unsigned long,void **),void (*)(unsigned int,void *,unsigned int,vm_range_t *,unsigned int))::{lambda(caulk::alloc::region_usage,unsigned long,unsigned long)#1}>,void ()(caulk::alloc::region_usage,unsigned long,unsigned long)>::target(uint64_t a1, uint64_t a2)
{
  if (std::type_info::operator==[abi:ne180100](*(void *)(a2 + 8), (uint64_t)"ZN5caulk5alloc15darwin_resourceINS0_15audio_allocatorENS0_15memory_resourceEE14zone_enumerateEjPvjmPFijmmPS5_EPFvjS5_jP10vm_range_tjEEUlNS0_12region_usageEmmE_"))
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

uint64_t std::__function::__func<caulk::alloc::darwin_resource<caulk::alloc::audio_allocator,caulk::alloc::memory_resource>::zone_enumerate(unsigned int,void *,unsigned int,unsigned long,int (*)(unsigned int,unsigned long,unsigned long,void **),void (*)(unsigned int,void *,unsigned int,vm_range_t *,unsigned int))::{lambda(caulk::alloc::region_usage,unsigned long,unsigned long)#1},std::allocator<caulk::alloc::darwin_resource<caulk::alloc::audio_allocator,caulk::alloc::memory_resource>::zone_enumerate(unsigned int,void *,unsigned int,unsigned long,int (*)(unsigned int,unsigned long,unsigned long,void **),void (*)(unsigned int,void *,unsigned int,vm_range_t *,unsigned int))::{lambda(caulk::alloc::region_usage,unsigned long,unsigned long)#1}>,void ()(caulk::alloc::region_usage,unsigned long,unsigned long)>::operator()(uint64_t a1, unsigned int *a2, void *a3, uint64_t *a4)
{
  uint64_t v4 = *a2;
  uint64_t v5 = *a4;
  v7[0] = *a3;
  v7[1] = v5;
  return (*(uint64_t (**)(void, void, uint64_t, void *, uint64_t))(a1 + 8))(*(unsigned int *)(a1 + 16), *(void *)(a1 + 24), v4, v7, 1);
}

__n128 std::__function::__func<caulk::alloc::darwin_resource<caulk::alloc::audio_allocator,caulk::alloc::memory_resource>::zone_enumerate(unsigned int,void *,unsigned int,unsigned long,int (*)(unsigned int,unsigned long,unsigned long,void **),void (*)(unsigned int,void *,unsigned int,vm_range_t *,unsigned int))::{lambda(caulk::alloc::region_usage,unsigned long,unsigned long)#1},std::allocator<caulk::alloc::darwin_resource<caulk::alloc::audio_allocator,caulk::alloc::memory_resource>::zone_enumerate(unsigned int,void *,unsigned int,unsigned long,int (*)(unsigned int,unsigned long,unsigned long,void **),void (*)(unsigned int,void *,unsigned int,vm_range_t *,unsigned int))::{lambda(caulk::alloc::region_usage,unsigned long,unsigned long)#1}>,void ()(caulk::alloc::region_usage,unsigned long,unsigned long)>::__clone(uint64_t a1, uint64_t a2)
{
  *(void *)a2 = &unk_26C2AA718;
  __n128 result = *(__n128 *)(a1 + 8);
  *(void *)(a2 + 24) = *(void *)(a1 + 24);
  *(__n128 *)(a2 + 8) = result;
  return result;
}

__n128 std::__function::__func<caulk::alloc::darwin_resource<caulk::alloc::audio_allocator,caulk::alloc::memory_resource>::zone_enumerate(unsigned int,void *,unsigned int,unsigned long,int (*)(unsigned int,unsigned long,unsigned long,void **),void (*)(unsigned int,void *,unsigned int,vm_range_t *,unsigned int))::{lambda(caulk::alloc::region_usage,unsigned long,unsigned long)#1},std::allocator<caulk::alloc::darwin_resource<caulk::alloc::audio_allocator,caulk::alloc::memory_resource>::zone_enumerate(unsigned int,void *,unsigned int,unsigned long,int (*)(unsigned int,unsigned long,unsigned long,void **),void (*)(unsigned int,void *,unsigned int,vm_range_t *,unsigned int))::{lambda(caulk::alloc::region_usage,unsigned long,unsigned long)#1}>,void ()(caulk::alloc::region_usage,unsigned long,unsigned long)>::__clone(uint64_t a1)
{
  uint64_t v2 = (char *)operator new(0x20uLL);
  *(void *)uint64_t v2 = &unk_26C2AA718;
  __n128 result = *(__n128 *)(a1 + 8);
  *(__n128 *)(v2 + 8) = result;
  *((void *)v2 + 3) = *(void *)(a1 + 24);
  return result;
}

void std::__function::__func<caulk::alloc::darwin_resource<caulk::alloc::audio_allocator,caulk::alloc::memory_resource>::zone_enumerate(unsigned int,void *,unsigned int,unsigned long,int (*)(unsigned int,unsigned long,unsigned long,void **),void (*)(unsigned int,void *,unsigned int,vm_range_t *,unsigned int))::{lambda(caulk::alloc::region_usage,unsigned long,unsigned long)#1},std::allocator<caulk::alloc::darwin_resource<caulk::alloc::audio_allocator,caulk::alloc::memory_resource>::zone_enumerate(unsigned int,void *,unsigned int,unsigned long,int (*)(unsigned int,unsigned long,unsigned long,void **),void (*)(unsigned int,void *,unsigned int,vm_range_t *,unsigned int))::{lambda(caulk::alloc::region_usage,unsigned long,unsigned long)#1}>,void ()(caulk::alloc::region_usage,unsigned long,unsigned long)>::~__func()
{
}

void *std::__function::__func<caulk::alloc::darwin_resource<caulk::alloc::audio_allocator,caulk::alloc::memory_resource>::zone_enumerate(unsigned int,void *,unsigned int,unsigned long,int (*)(unsigned int,unsigned long,unsigned long,void **),void (*)(unsigned int,void *,unsigned int,vm_range_t *,unsigned int))::{lambda(unsigned long,unsigned long)#1},std::allocator<caulk::alloc::darwin_resource<caulk::alloc::audio_allocator,caulk::alloc::memory_resource>::zone_enumerate(unsigned int,void *,unsigned int,unsigned long,int (*)(unsigned int,unsigned long,unsigned long,void **),void (*)(unsigned int,void *,unsigned int,vm_range_t *,unsigned int))::{lambda(unsigned long,unsigned long)#1}>,void * ()(unsigned long,unsigned long)>::target_type()
{
}

uint64_t std::__function::__func<caulk::alloc::darwin_resource<caulk::alloc::audio_allocator,caulk::alloc::memory_resource>::zone_enumerate(unsigned int,void *,unsigned int,unsigned long,int (*)(unsigned int,unsigned long,unsigned long,void **),void (*)(unsigned int,void *,unsigned int,vm_range_t *,unsigned int))::{lambda(unsigned long,unsigned long)#1},std::allocator<caulk::alloc::darwin_resource<caulk::alloc::audio_allocator,caulk::alloc::memory_resource>::zone_enumerate(unsigned int,void *,unsigned int,unsigned long,int (*)(unsigned int,unsigned long,unsigned long,void **),void (*)(unsigned int,void *,unsigned int,vm_range_t *,unsigned int))::{lambda(unsigned long,unsigned long)#1}>,void * ()(unsigned long,unsigned long)>::target(uint64_t a1, uint64_t a2)
{
  if (std::type_info::operator==[abi:ne180100](*(void *)(a2 + 8), (uint64_t)"ZN5caulk5alloc15darwin_resourceINS0_15audio_allocatorENS0_15memory_resourceEE14zone_enumerateEjPvjmPFijmmPS5_EPFvjS5_jP10vm_range_tjEEUlmmE_"))
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

uint64_t std::__function::__func<caulk::alloc::darwin_resource<caulk::alloc::audio_allocator,caulk::alloc::memory_resource>::zone_enumerate(unsigned int,void *,unsigned int,unsigned long,int (*)(unsigned int,unsigned long,unsigned long,void **),void (*)(unsigned int,void *,unsigned int,vm_range_t *,unsigned int))::{lambda(unsigned long,unsigned long)#1},std::allocator<caulk::alloc::darwin_resource<caulk::alloc::audio_allocator,caulk::alloc::memory_resource>::zone_enumerate(unsigned int,void *,unsigned int,unsigned long,int (*)(unsigned int,unsigned long,unsigned long,void **),void (*)(unsigned int,void *,unsigned int,vm_range_t *,unsigned int))::{lambda(unsigned long,unsigned long)#1}>,void * ()(unsigned long,unsigned long)>::operator()(uint64_t a1, uint64_t *a2, uint64_t *a3)
{
  uint64_t v3 = *a2;
  uint64_t v4 = *a3;
  uint64_t v7 = 0;
  uint64_t v5 = (const char *)(*(uint64_t (**)(void, uint64_t, uint64_t, uint64_t *))(a1 + 8))(*(unsigned int *)(a1 + 16), v3, v4, &v7);
  caulk::mach::throw_if_mach_error((uint64_t)"reader failed", v5);
  return v7;
}

__n128 std::__function::__func<caulk::alloc::darwin_resource<caulk::alloc::audio_allocator,caulk::alloc::memory_resource>::zone_enumerate(unsigned int,void *,unsigned int,unsigned long,int (*)(unsigned int,unsigned long,unsigned long,void **),void (*)(unsigned int,void *,unsigned int,vm_range_t *,unsigned int))::{lambda(unsigned long,unsigned long)#1},std::allocator<caulk::alloc::darwin_resource<caulk::alloc::audio_allocator,caulk::alloc::memory_resource>::zone_enumerate(unsigned int,void *,unsigned int,unsigned long,int (*)(unsigned int,unsigned long,unsigned long,void **),void (*)(unsigned int,void *,unsigned int,vm_range_t *,unsigned int))::{lambda(unsigned long,unsigned long)#1}>,void * ()(unsigned long,unsigned long)>::__clone(uint64_t a1, uint64_t a2)
{
  *(void *)a2 = &unk_26C2AA770;
  __n128 result = *(__n128 *)(a1 + 8);
  *(__n128 *)(a2 + 8) = result;
  return result;
}

__n128 std::__function::__func<caulk::alloc::darwin_resource<caulk::alloc::audio_allocator,caulk::alloc::memory_resource>::zone_enumerate(unsigned int,void *,unsigned int,unsigned long,int (*)(unsigned int,unsigned long,unsigned long,void **),void (*)(unsigned int,void *,unsigned int,vm_range_t *,unsigned int))::{lambda(unsigned long,unsigned long)#1},std::allocator<caulk::alloc::darwin_resource<caulk::alloc::audio_allocator,caulk::alloc::memory_resource>::zone_enumerate(unsigned int,void *,unsigned int,unsigned long,int (*)(unsigned int,unsigned long,unsigned long,void **),void (*)(unsigned int,void *,unsigned int,vm_range_t *,unsigned int))::{lambda(unsigned long,unsigned long)#1}>,void * ()(unsigned long,unsigned long)>::__clone(uint64_t a1)
{
  uint64_t v2 = (char *)operator new(0x18uLL);
  *(void *)uint64_t v2 = &unk_26C2AA770;
  __n128 result = *(__n128 *)(a1 + 8);
  *(__n128 *)(v2 + 8) = result;
  return result;
}

void std::__function::__func<caulk::alloc::darwin_resource<caulk::alloc::audio_allocator,caulk::alloc::memory_resource>::zone_enumerate(unsigned int,void *,unsigned int,unsigned long,int (*)(unsigned int,unsigned long,unsigned long,void **),void (*)(unsigned int,void *,unsigned int,vm_range_t *,unsigned int))::{lambda(unsigned long,unsigned long)#1},std::allocator<caulk::alloc::darwin_resource<caulk::alloc::audio_allocator,caulk::alloc::memory_resource>::zone_enumerate(unsigned int,void *,unsigned int,unsigned long,int (*)(unsigned int,unsigned long,unsigned long,void **),void (*)(unsigned int,void *,unsigned int,vm_range_t *,unsigned int))::{lambda(unsigned long,unsigned long)#1}>,void * ()(unsigned long,unsigned long)>::~__func()
{
}

uint64_t caulk::alloc::darwin_resource<caulk::alloc::audio_allocator,caulk::alloc::memory_resource>::zone_pressure_relief(uint64_t a1)
{
  return (*(uint64_t (**)(void))(**(void **)(a1 - 8) + 72))();
}

uint64_t caulk::alloc::darwin_resource<caulk::alloc::audio_allocator,caulk::alloc::memory_resource>::malloc_zone(uint64_t a1)
{
  return *(void *)(a1 + 1392) + 8;
}

void caulk::alloc::resource<caulk::alloc::audio_allocator,caulk::alloc::memory_resource>::reserve(void *a1@<X8>)
{
  *a1 = 0;
  a1[1] = 0;
}

unint64_t caulk::alloc::resource<caulk::alloc::audio_allocator,caulk::alloc::memory_resource>::compact(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = a1 + 1248;
  caulk::concurrent::details::node_allocator<void *,caulk::alloc::detail::tracked_block,10ul,(caulk::concurrent::skiplist_options)0>::begin_traversal();
  unint64_t v5 = atomic_load((unint64_t *)(a1 + 1120));
  unint64_t v6 = v5 & 0xFFFFFFFFFFFFFFFCLL;
  if (a1 + 1200 == (v5 & 0xFFFFFFFFFFFFFFFCLL))
  {
    unint64_t v7 = 0;
  }
  else
  {
    unint64_t v7 = 0;
    unint64_t v8 = a2 - 1;
    do
    {
      if (*(unsigned char *)(v6 + 18) != 2)
      {
        char v9 = atomic_load((unint64_t *)(v6 + 32));
        if ((v9 & 1) == 0)
        {
          uint64_t v10 = *(void *)(v6 + 8);
          if ((atomic_exchange((atomic_uchar *volatile)v10, 1u) & 1) == 0)
          {
            unsigned int v11 = atomic_load((unsigned int *)(v10 + 16));
            if (v11 == 1006)
            {
              v7 += *(void *)(v10 + 8);
              caulk::concurrent::skiplist<unsigned long,caulk::alloc::chunk_allocator<caulk::alloc::page_allocator,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,16ul,6ul>::node_impl<caulk::alloc::tree_allocator<caulk::alloc::chunk_allocator<caulk::alloc::page_allocator,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,16ul,6ul>>::node_header,caulk::alloc::embed_block_memory> *,5,(caulk::concurrent::skiplist_options)1>::remove(a1 + 1088, *(void *)v6);
              caulk::concurrent::skiplist<unsigned long,caulk::alloc::chunk_allocator<caulk::alloc::page_allocator,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,16ul,6ul>::node_impl<caulk::alloc::tree_allocator<caulk::alloc::chunk_allocator<caulk::alloc::page_allocator,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,16ul,6ul>>::node_header,caulk::alloc::embed_block_memory> *,5,(caulk::concurrent::skiplist_options)1>::remove(a1 + 800, *(void *)v6);
              if (v8 < v7) {
                break;
              }
            }
            else
            {
              atomic_store(0, (unsigned __int8 *)v10);
            }
          }
        }
      }
      unint64_t v5 = atomic_load((unint64_t *)(v6 + 32));
      unint64_t v6 = v5 & 0xFFFFFFFFFFFFFFFCLL;
    }
    while (a1 + 1200 != (v5 & 0xFFFFFFFFFFFFFFFCLL));
  }
  caulk::concurrent::details::node_allocator<unsigned long,caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,256ul,6ul>::node_impl<caulk::alloc::tree_allocator<caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,256ul,6ul>>::node_header,caulk::alloc::embed_block_memory> *,5ul,(caulk::concurrent::skiplist_options)1>::end_traversal(v4, v5);
  caulk::concurrent::details::node_allocator<unsigned long,caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,256ul,6ul>::node_impl<caulk::alloc::tree_allocator<caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,256ul,6ul>>::node_header,caulk::alloc::embed_block_memory> *,5ul,(caulk::concurrent::skiplist_options)1>::perform_deferred_deletions<true,(BOOL *)0>(a1 + 960);
  return v7;
}

void *caulk::alloc::resource<caulk::alloc::audio_allocator,caulk::alloc::memory_resource>::enumerate(uint64_t a1, int a2, uint64_t a3)
{
  return caulk::alloc::allocator_enumerate<caulk::alloc::resource<caulk::alloc::audio_allocator,caulk::alloc::memory_resource>>(a1, a2, a3);
}

void *caulk::alloc::allocator_enumerate<caulk::alloc::resource<caulk::alloc::audio_allocator,caulk::alloc::memory_resource>>(uint64_t a1, int a2, uint64_t a3)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  v6[0] = &unk_26C2AAC98;
  v6[1] = a3;
  v6[3] = v6;
  int v7 = a2;
  v8[0] = &unk_26C2AB948;
  v8[1] = caulk::alloc::introspector::local_reader;
  char v9 = v8;
  std::__function::__value_func<void ()(caulk::alloc::region_usage,unsigned long,unsigned long)>::__value_func[abi:ne180100]((uint64_t)v10, (uint64_t)v6);
  char v11 = 1;
  std::__function::__value_func<void ()(caulk::alloc::region_usage,unsigned long,unsigned long)>::~__value_func[abi:ne180100](v6);
  uint64_t v4 = std::function<void * ()(unsigned long,unsigned long)>::operator()((uint64_t)v9, a1, 1392);
  caulk::alloc::tiered_allocator<caulk::alloc::size_range_tier<0ul,1008ul,caulk::alloc::tree_allocator<caulk::alloc::chunk_allocator<caulk::alloc::page_allocator,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,16ul,6ul>>>,caulk::alloc::size_range_tier<1009ul,256000ul,caulk::alloc::guarded_edges_allocator<caulk::alloc::consolidating_free_map<caulk::alloc::page_allocator,10485760ul>,4ul>>,caulk::alloc::tracking_allocator<caulk::alloc::page_allocator>>::introspect(v4 + 16, a1, (uint64_t)&v7);
  std::__function::__value_func<void ()(caulk::alloc::region_usage,unsigned long,unsigned long)>::~__value_func[abi:ne180100](v10);
  return std::__function::__value_func<void * ()(unsigned long,unsigned long)>::~__value_func[abi:ne180100](v8);
}

void sub_2108763C8(_Unwind_Exception *a1)
{
  std::__function::__value_func<void ()(caulk::alloc::region_usage,unsigned long,unsigned long)>::~__value_func[abi:ne180100](v2);
  std::__function::__value_func<void * ()(unsigned long,unsigned long)>::~__value_func[abi:ne180100](v1);
  _Unwind_Resume(a1);
}

void *std::__function::__func<void caulk::alloc::allocator_enumerate<caulk::alloc::resource<caulk::alloc::audio_allocator,caulk::alloc::memory_resource>>(caulk::alloc::resource<caulk::alloc::audio_allocator,caulk::alloc::memory_resource> &,caulk::option_set<caulk::alloc::region_usage,unsigned int>,std::function<void ()(caulk::alloc::region_usage,caulk::alloc::block)> const&)::{lambda(caulk::alloc::region_usage,unsigned long,unsigned long)#1},std::allocator<void caulk::alloc::allocator_enumerate<caulk::alloc::resource<caulk::alloc::audio_allocator,caulk::alloc::memory_resource>>(caulk::alloc::resource<caulk::alloc::audio_allocator,caulk::alloc::memory_resource> &,caulk::option_set<caulk::alloc::region_usage,unsigned int>,std::function<void ()(caulk::alloc::region_usage,caulk::alloc::block)> const&)::{lambda(caulk::alloc::region_usage,unsigned long,unsigned long)#1}>,void ()(caulk::alloc::region_usage,unsigned long,unsigned long)>::target_type()
{
}

uint64_t std::__function::__func<void caulk::alloc::allocator_enumerate<caulk::alloc::resource<caulk::alloc::audio_allocator,caulk::alloc::memory_resource>>(caulk::alloc::resource<caulk::alloc::audio_allocator,caulk::alloc::memory_resource> &,caulk::option_set<caulk::alloc::region_usage,unsigned int>,std::function<void ()(caulk::alloc::region_usage,caulk::alloc::block)> const&)::{lambda(caulk::alloc::region_usage,unsigned long,unsigned long)#1},std::allocator<void caulk::alloc::allocator_enumerate<caulk::alloc::resource<caulk::alloc::audio_allocator,caulk::alloc::memory_resource>>(caulk::alloc::resource<caulk::alloc::audio_allocator,caulk::alloc::memory_resource> &,caulk::option_set<caulk::alloc::region_usage,unsigned int>,std::function<void ()(caulk::alloc::region_usage,caulk::alloc::block)> const&)::{lambda(caulk::alloc::region_usage,unsigned long,unsigned long)#1}>,void ()(caulk::alloc::region_usage,unsigned long,unsigned long)>::target(uint64_t a1, uint64_t a2)
{
  if (std::type_info::operator==[abi:ne180100](*(void *)(a2 + 8), (uint64_t)"ZN5caulk5alloc19allocator_enumerateINS0_8resourceINS0_15audio_allocatorENS0_15memory_resourceEEEEEvRT_NS_10option_setINS0_12region_usageEjEERKNSt3__18functionIFvS9_NS0_5blockEEEEEUlS9_mmE_"))
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

uint64_t std::__function::__func<void caulk::alloc::allocator_enumerate<caulk::alloc::resource<caulk::alloc::audio_allocator,caulk::alloc::memory_resource>>(caulk::alloc::resource<caulk::alloc::audio_allocator,caulk::alloc::memory_resource> &,caulk::option_set<caulk::alloc::region_usage,unsigned int>,std::function<void ()(caulk::alloc::region_usage,caulk::alloc::block)> const&)::{lambda(caulk::alloc::region_usage,unsigned long,unsigned long)#1},std::allocator<void caulk::alloc::allocator_enumerate<caulk::alloc::resource<caulk::alloc::audio_allocator,caulk::alloc::memory_resource>>(caulk::alloc::resource<caulk::alloc::audio_allocator,caulk::alloc::memory_resource> &,caulk::option_set<caulk::alloc::region_usage,unsigned int>,std::function<void ()(caulk::alloc::region_usage,caulk::alloc::block)> const&)::{lambda(caulk::alloc::region_usage,unsigned long,unsigned long)#1}>,void ()(caulk::alloc::region_usage,unsigned long,unsigned long)>::operator()(uint64_t a1, int *a2, uint64_t *a3, uint64_t *a4)
{
  return std::function<void ()(caulk::alloc::region_usage,caulk::alloc::block)>::operator()(*(void *)(*(void *)(a1 + 8) + 24), *a2, *a3, *a4);
}

uint64_t std::__function::__func<void caulk::alloc::allocator_enumerate<caulk::alloc::resource<caulk::alloc::audio_allocator,caulk::alloc::memory_resource>>(caulk::alloc::resource<caulk::alloc::audio_allocator,caulk::alloc::memory_resource> &,caulk::option_set<caulk::alloc::region_usage,unsigned int>,std::function<void ()(caulk::alloc::region_usage,caulk::alloc::block)> const&)::{lambda(caulk::alloc::region_usage,unsigned long,unsigned long)#1},std::allocator<void caulk::alloc::allocator_enumerate<caulk::alloc::resource<caulk::alloc::audio_allocator,caulk::alloc::memory_resource>>(caulk::alloc::resource<caulk::alloc::audio_allocator,caulk::alloc::memory_resource> &,caulk::option_set<caulk::alloc::region_usage,unsigned int>,std::function<void ()(caulk::alloc::region_usage,caulk::alloc::block)> const&)::{lambda(caulk::alloc::region_usage,unsigned long,unsigned long)#1}>,void ()(caulk::alloc::region_usage,unsigned long,unsigned long)>::__clone(uint64_t result, void *a2)
{
  uint64_t v2 = *(void *)(result + 8);
  *a2 = &unk_26C2AAC98;
  a2[1] = v2;
  return result;
}

void *std::__function::__func<void caulk::alloc::allocator_enumerate<caulk::alloc::resource<caulk::alloc::audio_allocator,caulk::alloc::memory_resource>>(caulk::alloc::resource<caulk::alloc::audio_allocator,caulk::alloc::memory_resource> &,caulk::option_set<caulk::alloc::region_usage,unsigned int>,std::function<void ()(caulk::alloc::region_usage,caulk::alloc::block)> const&)::{lambda(caulk::alloc::region_usage,unsigned long,unsigned long)#1},std::allocator<void caulk::alloc::allocator_enumerate<caulk::alloc::resource<caulk::alloc::audio_allocator,caulk::alloc::memory_resource>>(caulk::alloc::resource<caulk::alloc::audio_allocator,caulk::alloc::memory_resource> &,caulk::option_set<caulk::alloc::region_usage,unsigned int>,std::function<void ()(caulk::alloc::region_usage,caulk::alloc::block)> const&)::{lambda(caulk::alloc::region_usage,unsigned long,unsigned long)#1}>,void ()(caulk::alloc::region_usage,unsigned long,unsigned long)>::__clone(uint64_t a1)
{
  __n128 result = operator new(0x10uLL);
  uint64_t v3 = *(void *)(a1 + 8);
  *__n128 result = &unk_26C2AAC98;
  result[1] = v3;
  return result;
}

void std::__function::__func<void caulk::alloc::allocator_enumerate<caulk::alloc::resource<caulk::alloc::audio_allocator,caulk::alloc::memory_resource>>(caulk::alloc::resource<caulk::alloc::audio_allocator,caulk::alloc::memory_resource> &,caulk::option_set<caulk::alloc::region_usage,unsigned int>,std::function<void ()(caulk::alloc::region_usage,caulk::alloc::block)> const&)::{lambda(caulk::alloc::region_usage,unsigned long,unsigned long)#1},std::allocator<void caulk::alloc::allocator_enumerate<caulk::alloc::resource<caulk::alloc::audio_allocator,caulk::alloc::memory_resource>>(caulk::alloc::resource<caulk::alloc::audio_allocator,caulk::alloc::memory_resource> &,caulk::option_set<caulk::alloc::region_usage,unsigned int>,std::function<void ()(caulk::alloc::region_usage,caulk::alloc::block)> const&)::{lambda(caulk::alloc::region_usage,unsigned long,unsigned long)#1}>,void ()(caulk::alloc::region_usage,unsigned long,unsigned long)>::~__func()
{
}

void caulk::alloc::resource<caulk::alloc::audio_allocator,caulk::alloc::memory_resource>::print(uint64_t a1, void *a2, int a3)
{
  uint64_t v55 = *MEMORY[0x263EF8340];
  uint64_t v35 = a2;
  int v36 = 0;
  char v37 = 0;
  caulk::alloc::base_allocator::formatter::emit_string(&v35, "audio_allocator @ ");
  caulk::alloc::base_allocator::formatter::check_line_start(&v35);
  unint64_t v34 = (caulk::alloc::page_allocator *)(a1 + 16);
  std::ostream::operator<<();
  caulk::alloc::base_allocator::formatter::check_line_start(&v35);
  v50.__r_.__value_.__s.__data_[0] = 10;
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v35, (uint64_t)&v50, 1);
  v36 += 2;
  caulk::alloc::base_allocator::formatter::emit_string(&v35, "[zeroing] ");
  caulk::alloc::base_allocator::formatter::emit_string(&v35, "[tier ");
  caulk::alloc::base_allocator::formatter::emit_string(&v35, "sizes ");
  caulk::alloc::base_allocator::formatter::check_line_start(&v35);
  std::ostream::operator<<();
  caulk::alloc::base_allocator::formatter::emit_string(&v35, "-");
  caulk::alloc::base_allocator::formatter::check_line_start(&v35);
  std::ostream::operator<<();
  caulk::alloc::base_allocator::formatter::emit_string(&v35, "] ");
  caulk::alloc::base_allocator::formatter::emit_string(&v35, "tree_allocator @ ");
  caulk::alloc::base_allocator::formatter::check_line_start(&v35);
  std::ostream::operator<<();
  caulk::alloc::base_allocator::formatter::emit_string(&v35, "\n");
  uint64_t v4 = a1 + 960;
  caulk::concurrent::details::node_allocator<void *,caulk::alloc::detail::tracked_block,10ul,(caulk::concurrent::skiplist_options)0>::begin_traversal();
  unint64_t v5 = atomic_load((unint64_t *)(a1 + 832));
  uint64_t v33 = a1;
  uint64_t v6 = a1 + 912;
  unint64_t v7 = v5 & 0xFFFFFFFFFFFFFFFCLL;
  if (v6 == (v5 & 0xFFFFFFFFFFFFFFFCLL))
  {
    uint64_t v8 = 0;
  }
  else
  {
    uint64_t v8 = 0;
    uint64_t v9 = 0;
    do
    {
      if (*(unsigned char *)(v7 + 18) != 2)
      {
        char v10 = atomic_load((unint64_t *)(v7 + 32));
        if ((v10 & 1) == 0)
        {
          uint64_t v11 = *(void *)(v7 + 8);
          int v12 = atomic_load((unsigned int *)(v11 + 4));
          std::string::basic_string[abi:ne180100]<0>(&v48, "availability ");
          std::to_string(&v46, v12);
          if ((v46.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
            uint64_t v13 = &v46;
          }
          else {
            uint64_t v13 = (std::string *)v46.__r_.__value_.__r.__words[0];
          }
          if ((v46.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
            std::string::size_type size = HIBYTE(v46.__r_.__value_.__r.__words[2]);
          }
          else {
            std::string::size_type size = v46.__r_.__value_.__l.__size_;
          }
          unint64_t v15 = std::string::append(&v48, (const std::string::value_type *)v13, size);
          std::string v50 = *v15;
          v15->__r_.__value_.__l.__size_ = 0;
          v15->__r_.__value_.__r.__words[2] = 0;
          v15->__r_.__value_.__r.__words[0] = 0;
          if (SHIBYTE(v46.__r_.__value_.__r.__words[2]) < 0) {
            operator delete(v46.__r_.__value_.__l.__data_);
          }
          if (SHIBYTE(v48.__r_.__value_.__r.__words[2]) < 0) {
            operator delete(v48.__r_.__value_.__l.__data_);
          }
          caulk::alloc::base_allocator::formatter::print_allocator<caulk::alloc::bitmap_allocator<caulk::alloc::embed_block_memory,16368ul,16ul,6ul>>((caulk::alloc::base_allocator::formatter *)&v35, (uint64_t)&v50, v11 + 16);
          unsigned int v16 = atomic_load((unsigned int *)(v11 + 16));
          if (SHIBYTE(v50.__r_.__value_.__r.__words[2]) < 0) {
            operator delete(v50.__r_.__value_.__l.__data_);
          }
          ++v8;
          v9 += 16 * v16;
        }
      }
      unint64_t v5 = atomic_load((unint64_t *)(v7 + 32));
      unint64_t v7 = v5 & 0xFFFFFFFFFFFFFFFCLL;
    }
    while (v6 != (v5 & 0xFFFFFFFFFFFFFFFCLL));
  }
  caulk::concurrent::details::node_allocator<unsigned long,caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,256ul,6ul>::node_impl<caulk::alloc::tree_allocator<caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,256ul,6ul>>::node_header,caulk::alloc::embed_block_memory> *,5ul,(caulk::concurrent::skiplist_options)1>::end_traversal(v4, v5);
  v36 += 2;
  caulk::alloc::base_allocator::formatter::check_line_start(&v35);
  std::ostream::operator<<();
  caulk::alloc::base_allocator::formatter::emit_string(&v35, " nodes, total capacity ");
  caulk::alloc::base_allocator::formatter::check_line_start(&v35);
  std::ostream::operator<<();
  caulk::alloc::base_allocator::formatter::emit_string(&v35, ", free capacity ");
  caulk::alloc::base_allocator::formatter::check_line_start(&v35);
  std::ostream::operator<<();
  if (16096 * v8)
  {
    caulk::alloc::base_allocator::formatter::emit_string(&v35, " (");
    caulk::alloc::base_allocator::formatter::check_line_start(&v35);
    std::ostream::operator<<();
    caulk::alloc::base_allocator::formatter::emit_string(&v35, "%)");
  }
  caulk::alloc::base_allocator::formatter::emit_string(&v35, "\n");
  v36 -= 2;
  std::string::basic_string[abi:ne180100]<0>(&v48, "super");
  v36 += 2;
  if (SHIBYTE(v48.__r_.__value_.__r.__words[2]) < 0)
  {
    if (!v48.__r_.__value_.__l.__size_) {
      goto LABEL_30;
    }
    std::string::__init_copy_ctor_external(&v50, v48.__r_.__value_.__l.__data_, v48.__r_.__value_.__l.__size_);
  }
  else
  {
    if (!*((unsigned char *)&v48.__r_.__value_.__s + 23)) {
      goto LABEL_30;
    }
    std::string v50 = v48;
  }
  caulk::alloc::base_allocator::formatter::operator<<<std::string>(&v35, (uint64_t)&v50);
  caulk::alloc::base_allocator::formatter::emit_string(&v35, ": ");
  if (SHIBYTE(v50.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v50.__r_.__value_.__l.__data_);
  }
LABEL_30:
  caulk::alloc::page_allocator::describe((caulk::alloc::page_allocator *)(v33 + 776), (caulk::alloc::base_allocator::formatter *)&v35, 0);
  v36 -= 2;
  if (SHIBYTE(v48.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v48.__r_.__value_.__l.__data_);
  }
  caulk::alloc::base_allocator::formatter::emit_string(&v35, "[tier ");
  caulk::alloc::base_allocator::formatter::emit_string(&v35, "sizes ");
  caulk::alloc::base_allocator::formatter::check_line_start(&v35);
  std::ostream::operator<<();
  caulk::alloc::base_allocator::formatter::emit_string(&v35, "-");
  caulk::alloc::base_allocator::formatter::check_line_start(&v35);
  std::ostream::operator<<();
  caulk::alloc::base_allocator::formatter::emit_string(&v35, "] ");
  caulk::alloc::base_allocator::formatter::emit_string(&v35, "guarded_edges_allocator<");
  caulk::alloc::base_allocator::formatter::check_line_start(&v35);
  std::ostream::operator<<();
  caulk::alloc::base_allocator::formatter::emit_string(&v35, "> @ ");
  caulk::alloc::base_allocator::formatter::check_line_start(&v35);
  std::ostream::operator<<();
  caulk::alloc::base_allocator::formatter::emit_string(&v35, "\n");
  v36 += 2;
  os_unfair_lock_lock((os_unfair_lock_t)(v33 + 720));
  caulk::alloc::base_allocator::formatter::emit_string(&v35, "consolidating_free_map @ ");
  caulk::alloc::base_allocator::formatter::check_line_start(&v35);
  std::ostream::operator<<();
  caulk::alloc::base_allocator::formatter::emit_string(&v35, "\n");
  v36 += 2;
  uint64_t v17 = *(void *)(v33 + 752);
  uint64_t v42 = 0;
  uint64_t v43 = 0;
  uint64_t v40 = 0;
  unint64_t v41 = &v42;
  uint64_t v38 = 0;
  uint64_t v39 = 0;
  int v18 = operator new(0x28uLL);
  *int v18 = &unk_26C2ABAA8;
  v18[1] = &v41;
  v18[2] = &v40;
  v18[3] = &v39;
  void v18[4] = &v38;
  int v47 = v18;
  v48.__r_.__value_.__r.__words[0] = (std::string::size_type)&unk_26C2ABBB0;
  v48.__r_.__value_.__l.__size_ = (std::string::size_type)&v46;
  int v49 = &v48;
  LODWORD(v50.__r_.__value_.__l.__data_) = 7;
  v50.__r_.__value_.__l.__size_ = (std::string::size_type)&unk_26C2AB948;
  v50.__r_.__value_.__r.__words[2] = (std::string::size_type)caulk::alloc::introspector::local_reader;
  p_std::string::size_type size = &v50.__r_.__value_.__l.__size_;
  std::__function::__value_func<void ()(caulk::alloc::region_usage,unsigned long,unsigned long)>::__value_func[abi:ne180100]((uint64_t)v53, (uint64_t)&v48);
  char v54 = 1;
  std::__function::__value_func<void ()(caulk::alloc::region_usage,unsigned long,unsigned long)>::~__value_func[abi:ne180100](&v48);
  uint64_t v19 = std::function<void * ()(unsigned long,unsigned long)>::operator()((uint64_t)p_size, v33 + 368, 400);
  char v44 = &v50;
  uint64_t v45 = &v44;
  caulk::concurrent::skiplist<void *,caulk::alloc::detail::tracked_block,10,(caulk::concurrent::skiplist_options)0>::introspect<void caulk::alloc::tracking_allocator<caulk::alloc::page_allocator>::introspect_foreach<caulk::alloc::consolidating_free_map<caulk::alloc::page_allocator,10485760ul>::introspect(unsigned long,caulk::alloc::introspector const&)::{lambda(void *,unsigned long)#1}>(caulk::alloc::introspector const&,caulk::alloc::consolidating_free_map<caulk::alloc::page_allocator,10485760ul>::introspect(unsigned long,caulk::alloc::introspector const&)::{lambda(void *,unsigned long)#1} &&)::{lambda(caulk::alloc::consolidating_free_map<caulk::alloc::page_allocator,10485760ul>::introspect(unsigned long,caulk::alloc::introspector const&)::{lambda(void *,unsigned long)#1} const&)#1}>(v19 + 16, (uint64_t)&v50.__r_.__value_.__l.__size_, (int ***)&v45);
  std::__function::__value_func<void ()(caulk::alloc::region_usage,unsigned long,unsigned long)>::~__value_func[abi:ne180100](v53);
  std::__function::__value_func<void * ()(unsigned long,unsigned long)>::~__value_func[abi:ne180100](&v50.__r_.__value_.__l.__size_);
  std::__function::__value_func<void ()(caulk::alloc::region_usage,caulk::alloc::block)>::~__value_func[abi:ne180100](&v46);
  caulk::alloc::base_allocator::formatter::check_line_start(&v35);
  *(_DWORD *)((char *)v35 + *(void *)(*v35 - 24) + 8) = *(_DWORD *)((unsigned char *)v35 + *(void *)(*v35 - 24) + 8) & 0xFFFFFFB5 | 2;
  caulk::alloc::base_allocator::formatter::check_line_start(&v35);
  std::ostream::operator<<();
  caulk::alloc::base_allocator::formatter::emit_string(&v35, " allocations for ");
  caulk::alloc::base_allocator::formatter::check_line_start(&v35);
  std::ostream::operator<<();
  caulk::alloc::base_allocator::formatter::emit_string(&v35, " bytes");
  if (v17)
  {
    caulk::alloc::base_allocator::formatter::emit_string(&v35, " (");
    caulk::alloc::base_allocator::formatter::check_line_start(&v35);
    std::ostream::operator<<();
    caulk::alloc::base_allocator::formatter::emit_string(&v35, "%)");
  }
  caulk::alloc::base_allocator::formatter::emit_string(&v35, "; ");
  caulk::alloc::base_allocator::formatter::check_line_start(&v35);
  std::ostream::operator<<();
  caulk::alloc::base_allocator::formatter::emit_string(&v35, " bytes free\n");
  if (v43)
  {
    caulk::alloc::base_allocator::formatter::emit_string(&v35, "sizes:");
    uint64_t v20 = v41;
    if (v41 != &v42)
    {
      char v21 = 0;
      do
      {
        if ((v21 & 1) == 0 && (v20[4] & 0x8000000000000000) != 0)
        {
          caulk::alloc::base_allocator::formatter::emit_string(&v35, "\n");
          caulk::alloc::base_allocator::formatter::emit_string(&v35, "free sizes:");
          char v21 = 1;
        }
        caulk::alloc::base_allocator::formatter::emit_string(&v35, " ");
        caulk::alloc::base_allocator::formatter::check_line_start(&v35);
        std::ostream::operator<<();
        caulk::alloc::base_allocator::formatter::emit_string(&v35, caulk::alloc::base_allocator::formatter::summarize_blocks_by_size<caulk::alloc::tracking_allocator<caulk::alloc::page_allocator>>(caulk::alloc::tracking_allocator<caulk::alloc::page_allocator> &,unsigned long)::sizeLabels[(v20[4] >> 61) & 3]);
        caulk::alloc::base_allocator::formatter::emit_string(&v35, "[");
        caulk::alloc::base_allocator::formatter::check_line_start(&v35);
        std::ostream::operator<<();
        caulk::alloc::base_allocator::formatter::emit_string(&v35, "]");
        char v22 = (void *)v20[1];
        if (v22)
        {
          do
          {
            uint64_t v23 = (void **)v22;
            char v22 = (void *)*v22;
          }
          while (v22);
        }
        else
        {
          do
          {
            uint64_t v23 = (void **)v20[2];
            BOOL v24 = *v23 == v20;
            uint64_t v20 = v23;
          }
          while (!v24);
        }
        uint64_t v20 = v23;
      }
      while (v23 != &v42);
    }
    caulk::alloc::base_allocator::formatter::emit_string(&v35, "\n");
  }
  std::__tree<std::__value_type<unsigned long long,unsigned int>,std::__map_value_compare<unsigned long long,std::__value_type<unsigned long long,unsigned int>,std::less<unsigned long long>,true>,std::allocator<std::__value_type<unsigned long long,unsigned int>>>::destroy(v42);
  v36 -= 2;
  os_unfair_lock_unlock((os_unfair_lock_t)(v33 + 720));
  v36 -= 2;
  caulk::alloc::base_allocator::formatter::emit_string(&v35, "[tier] ");
  caulk::alloc::base_allocator::formatter::emit_string(&v35, "[tracking] ");
  caulk::alloc::page_allocator::describe(v34, (caulk::alloc::base_allocator::formatter *)&v35, 0);
  v36 += 2;
  uint64_t v42 = 0;
  uint64_t v43 = 0;
  uint64_t v40 = 0;
  unint64_t v41 = &v42;
  uint64_t v38 = 0;
  uint64_t v39 = 0;
  unint64_t v25 = operator new(0x28uLL);
  *unint64_t v25 = &unk_26C2AB9F8;
  v25[1] = &v41;
  v25[2] = &v40;
  v25[3] = &v39;
  v25[4] = &v38;
  int v47 = v25;
  v48.__r_.__value_.__r.__words[0] = (std::string::size_type)&unk_26C2ABB00;
  v48.__r_.__value_.__l.__size_ = (std::string::size_type)&v46;
  int v49 = &v48;
  LODWORD(v50.__r_.__value_.__l.__data_) = 7;
  v50.__r_.__value_.__l.__size_ = (std::string::size_type)&unk_26C2AB948;
  v50.__r_.__value_.__r.__words[2] = (std::string::size_type)caulk::alloc::introspector::local_reader;
  p_std::string::size_type size = &v50.__r_.__value_.__l.__size_;
  std::__function::__value_func<void ()(caulk::alloc::region_usage,unsigned long,unsigned long)>::__value_func[abi:ne180100]((uint64_t)v53, (uint64_t)&v48);
  char v54 = 1;
  std::__function::__value_func<void ()(caulk::alloc::region_usage,unsigned long,unsigned long)>::~__value_func[abi:ne180100](&v48);
  uint64_t v26 = std::function<void * ()(unsigned long,unsigned long)>::operator()((uint64_t)p_size, (uint64_t)v34, 352);
  char v44 = &v50;
  uint64_t v45 = &v44;
  caulk::concurrent::skiplist<void *,caulk::alloc::detail::tracked_block,10,(caulk::concurrent::skiplist_options)0>::introspect<void caulk::alloc::tracking_allocator<caulk::alloc::global_page_cache>::introspect_foreach<caulk::alloc::tracking_allocator<caulk::alloc::global_page_cache>::introspect(unsigned long,caulk::alloc::introspector const&)::{lambda(void *,unsigned long)#1}>(caulk::alloc::introspector const&,caulk::alloc::tracking_allocator<caulk::alloc::global_page_cache>::introspect(unsigned long,caulk::alloc::introspector const&)::{lambda(void *,unsigned long)#1} &&)::{lambda(caulk::alloc::tracking_allocator<caulk::alloc::global_page_cache>::introspect(unsigned long,caulk::alloc::introspector const&)::{lambda(void *,unsigned long)#1} const&)#1}>(v26 + 16, (uint64_t)&v50.__r_.__value_.__l.__size_, (int ***)&v45);
  std::__function::__value_func<void ()(caulk::alloc::region_usage,unsigned long,unsigned long)>::~__value_func[abi:ne180100](v53);
  std::__function::__value_func<void * ()(unsigned long,unsigned long)>::~__value_func[abi:ne180100](&v50.__r_.__value_.__l.__size_);
  std::__function::__value_func<void ()(caulk::alloc::region_usage,caulk::alloc::block)>::~__value_func[abi:ne180100](&v46);
  caulk::alloc::base_allocator::formatter::check_line_start(&v35);
  *(_DWORD *)((char *)v35 + *(void *)(*v35 - 24) + 8) = *(_DWORD *)((unsigned char *)v35 + *(void *)(*v35 - 24) + 8) & 0xFFFFFFB5 | 2;
  caulk::alloc::base_allocator::formatter::check_line_start(&v35);
  std::ostream::operator<<();
  caulk::alloc::base_allocator::formatter::emit_string(&v35, " allocations for ");
  caulk::alloc::base_allocator::formatter::check_line_start(&v35);
  std::ostream::operator<<();
  caulk::alloc::base_allocator::formatter::emit_string(&v35, " bytes");
  caulk::alloc::base_allocator::formatter::emit_string(&v35, "; ");
  caulk::alloc::base_allocator::formatter::check_line_start(&v35);
  std::ostream::operator<<();
  caulk::alloc::base_allocator::formatter::emit_string(&v35, " bytes free\n");
  if (v43)
  {
    caulk::alloc::base_allocator::formatter::emit_string(&v35, "sizes:");
    char v27 = v41;
    if (v41 != &v42)
    {
      char v28 = 0;
      do
      {
        if ((v28 & 1) == 0 && (v27[4] & 0x8000000000000000) != 0)
        {
          caulk::alloc::base_allocator::formatter::emit_string(&v35, "\n");
          caulk::alloc::base_allocator::formatter::emit_string(&v35, "free sizes:");
          char v28 = 1;
        }
        caulk::alloc::base_allocator::formatter::emit_string(&v35, " ");
        caulk::alloc::base_allocator::formatter::check_line_start(&v35);
        std::ostream::operator<<();
        caulk::alloc::base_allocator::formatter::emit_string(&v35, caulk::alloc::base_allocator::formatter::summarize_blocks_by_size<caulk::alloc::tracking_allocator<caulk::alloc::page_allocator>>(caulk::alloc::tracking_allocator<caulk::alloc::page_allocator> &,unsigned long)::sizeLabels[(v27[4] >> 61) & 3]);
        caulk::alloc::base_allocator::formatter::emit_string(&v35, "[");
        caulk::alloc::base_allocator::formatter::check_line_start(&v35);
        std::ostream::operator<<();
        caulk::alloc::base_allocator::formatter::emit_string(&v35, "]");
        unint64_t v29 = (void *)v27[1];
        if (v29)
        {
          do
          {
            unint64_t v30 = (void **)v29;
            unint64_t v29 = (void *)*v29;
          }
          while (v29);
        }
        else
        {
          do
          {
            unint64_t v30 = (void **)v27[2];
            BOOL v24 = *v30 == v27;
            char v27 = v30;
          }
          while (!v24);
        }
        char v27 = v30;
      }
      while (v30 != &v42);
    }
    caulk::alloc::base_allocator::formatter::emit_string(&v35, "\n");
  }
  std::__tree<std::__value_type<unsigned long long,unsigned int>,std::__map_value_compare<unsigned long long,std::__value_type<unsigned long long,unsigned int>,std::less<unsigned long long>,true>,std::allocator<std::__value_type<unsigned long long,unsigned int>>>::destroy(v42);
  v36 -= 4;
  if (a3)
  {
    v50.__r_.__value_.__r.__words[0] = (std::string::size_type)&unk_26C2AA8D0;
    v50.__r_.__value_.__l.__size_ = (std::string::size_type)a2;
    std::string v51 = &v50;
    caulk::alloc::allocator_enumerate<caulk::alloc::resource<caulk::alloc::audio_allocator,caulk::alloc::memory_resource>>(v33, 7, (uint64_t)&v50);
    std::__function::__value_func<void ()(caulk::alloc::region_usage,caulk::alloc::block)>::~__value_func[abi:ne180100](&v50);
  }
}

void sub_210877150(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,void *a25,uint64_t a26,int a27,__int16 a28,char a29,char a30,uint64_t a31,void *__p,uint64_t a33,int a34,__int16 a35,char a36,char a37)
{
  std::__function::__value_func<void ()(caulk::alloc::region_usage,caulk::alloc::block)>::~__value_func[abi:ne180100]((void *)(v37 - 176));
  _Unwind_Resume(a1);
}

void *std::__function::__func<void caulk::alloc::print_allocator<caulk::alloc::resource<caulk::alloc::audio_allocator,caulk::alloc::memory_resource>>(caulk::alloc::resource<caulk::alloc::audio_allocator,caulk::alloc::memory_resource> &,std::ostream &,BOOL)::{lambda(caulk::alloc::region_usage,caulk::alloc::block)#1},std::allocator<void caulk::alloc::print_allocator<caulk::alloc::resource<caulk::alloc::audio_allocator,caulk::alloc::memory_resource>>(caulk::alloc::resource<caulk::alloc::audio_allocator,caulk::alloc::memory_resource> &,std::ostream &,BOOL)::{lambda(caulk::alloc::region_usage,caulk::alloc::block)#1}>,void ()(caulk::alloc::region_usage,caulk::alloc::block)>::target_type()
{
}

uint64_t std::__function::__func<void caulk::alloc::print_allocator<caulk::alloc::resource<caulk::alloc::audio_allocator,caulk::alloc::memory_resource>>(caulk::alloc::resource<caulk::alloc::audio_allocator,caulk::alloc::memory_resource> &,std::ostream &,BOOL)::{lambda(caulk::alloc::region_usage,caulk::alloc::block)#1},std::allocator<void caulk::alloc::print_allocator<caulk::alloc::resource<caulk::alloc::audio_allocator,caulk::alloc::memory_resource>>(caulk::alloc::resource<caulk::alloc::audio_allocator,caulk::alloc::memory_resource> &,std::ostream &,BOOL)::{lambda(caulk::alloc::region_usage,caulk::alloc::block)#1}>,void ()(caulk::alloc::region_usage,caulk::alloc::block)>::target(uint64_t a1, uint64_t a2)
{
  if (std::type_info::operator==[abi:ne180100](*(void *)(a2 + 8), (uint64_t)"ZN5caulk5alloc15print_allocatorINS0_8resourceINS0_15audio_allocatorENS0_15memory_resourceEEEEEvRT_RNSt3__113basic_ostreamIcNS8_11char_traitsIcEEEEbEUlNS0_12region_usageENS0_5blockEE_"))
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

uint64_t std::__function::__func<void caulk::alloc::print_allocator<caulk::alloc::resource<caulk::alloc::audio_allocator,caulk::alloc::memory_resource>>(caulk::alloc::resource<caulk::alloc::audio_allocator,caulk::alloc::memory_resource> &,std::ostream &,BOOL)::{lambda(caulk::alloc::region_usage,caulk::alloc::block)#1},std::allocator<void caulk::alloc::print_allocator<caulk::alloc::resource<caulk::alloc::audio_allocator,caulk::alloc::memory_resource>>(caulk::alloc::resource<caulk::alloc::audio_allocator,caulk::alloc::memory_resource> &,std::ostream &,BOOL)::{lambda(caulk::alloc::region_usage,caulk::alloc::block)#1}>,void ()(caulk::alloc::region_usage,caulk::alloc::block)>::operator()(uint64_t a1, int *a2)
{
  return caulk::alloc::describe_block(*(void *)(a1 + 8), *a2);
}

uint64_t std::__function::__func<void caulk::alloc::print_allocator<caulk::alloc::resource<caulk::alloc::audio_allocator,caulk::alloc::memory_resource>>(caulk::alloc::resource<caulk::alloc::audio_allocator,caulk::alloc::memory_resource> &,std::ostream &,BOOL)::{lambda(caulk::alloc::region_usage,caulk::alloc::block)#1},std::allocator<void caulk::alloc::print_allocator<caulk::alloc::resource<caulk::alloc::audio_allocator,caulk::alloc::memory_resource>>(caulk::alloc::resource<caulk::alloc::audio_allocator,caulk::alloc::memory_resource> &,std::ostream &,BOOL)::{lambda(caulk::alloc::region_usage,caulk::alloc::block)#1}>,void ()(caulk::alloc::region_usage,caulk::alloc::block)>::__clone(uint64_t result, void *a2)
{
  uint64_t v2 = *(void *)(result + 8);
  *a2 = &unk_26C2AA8D0;
  a2[1] = v2;
  return result;
}

void *std::__function::__func<void caulk::alloc::print_allocator<caulk::alloc::resource<caulk::alloc::audio_allocator,caulk::alloc::memory_resource>>(caulk::alloc::resource<caulk::alloc::audio_allocator,caulk::alloc::memory_resource> &,std::ostream &,BOOL)::{lambda(caulk::alloc::region_usage,caulk::alloc::block)#1},std::allocator<void caulk::alloc::print_allocator<caulk::alloc::resource<caulk::alloc::audio_allocator,caulk::alloc::memory_resource>>(caulk::alloc::resource<caulk::alloc::audio_allocator,caulk::alloc::memory_resource> &,std::ostream &,BOOL)::{lambda(caulk::alloc::region_usage,caulk::alloc::block)#1}>,void ()(caulk::alloc::region_usage,caulk::alloc::block)>::__clone(uint64_t a1)
{
  __n128 result = operator new(0x10uLL);
  uint64_t v3 = *(void *)(a1 + 8);
  *__n128 result = &unk_26C2AA8D0;
  result[1] = v3;
  return result;
}

void std::__function::__func<void caulk::alloc::print_allocator<caulk::alloc::resource<caulk::alloc::audio_allocator,caulk::alloc::memory_resource>>(caulk::alloc::resource<caulk::alloc::audio_allocator,caulk::alloc::memory_resource> &,std::ostream &,BOOL)::{lambda(caulk::alloc::region_usage,caulk::alloc::block)#1},std::allocator<void caulk::alloc::print_allocator<caulk::alloc::resource<caulk::alloc::audio_allocator,caulk::alloc::memory_resource>>(caulk::alloc::resource<caulk::alloc::audio_allocator,caulk::alloc::memory_resource> &,std::ostream &,BOOL)::{lambda(caulk::alloc::region_usage,caulk::alloc::block)#1}>,void ()(caulk::alloc::region_usage,caulk::alloc::block)>::~__func()
{
}

void *std::__function::__func<void caulk::alloc::allocator_enumerate<caulk::alloc::tracking_allocator<caulk::alloc::page_allocator>>(caulk::alloc::tracking_allocator<caulk::alloc::page_allocator> &,caulk::option_set<caulk::alloc::region_usage,unsigned int>,std::function<void ()(caulk::alloc::region_usage,caulk::alloc::block)> const&)::{lambda(caulk::alloc::region_usage,unsigned long,unsigned long)#1},std::allocator<void caulk::alloc::allocator_enumerate<caulk::alloc::tracking_allocator<caulk::alloc::page_allocator>>(caulk::alloc::tracking_allocator<caulk::alloc::page_allocator> &,caulk::option_set<caulk::alloc::region_usage,unsigned int>,std::function<void ()(caulk::alloc::region_usage,caulk::alloc::block)> const&)::{lambda(caulk::alloc::region_usage,unsigned long,unsigned long)#1}>,void ()(caulk::alloc::region_usage,unsigned long,unsigned long)>::target_type()
{
}

uint64_t std::__function::__func<void caulk::alloc::allocator_enumerate<caulk::alloc::tracking_allocator<caulk::alloc::page_allocator>>(caulk::alloc::tracking_allocator<caulk::alloc::page_allocator> &,caulk::option_set<caulk::alloc::region_usage,unsigned int>,std::function<void ()(caulk::alloc::region_usage,caulk::alloc::block)> const&)::{lambda(caulk::alloc::region_usage,unsigned long,unsigned long)#1},std::allocator<void caulk::alloc::allocator_enumerate<caulk::alloc::tracking_allocator<caulk::alloc::page_allocator>>(caulk::alloc::tracking_allocator<caulk::alloc::page_allocator> &,caulk::option_set<caulk::alloc::region_usage,unsigned int>,std::function<void ()(caulk::alloc::region_usage,caulk::alloc::block)> const&)::{lambda(caulk::alloc::region_usage,unsigned long,unsigned long)#1}>,void ()(caulk::alloc::region_usage,unsigned long,unsigned long)>::target(uint64_t a1, uint64_t a2)
{
  if (std::type_info::operator==[abi:ne180100](*(void *)(a2 + 8), (uint64_t)"ZN5caulk5alloc19allocator_enumerateINS0_18tracking_allocatorINS0_14page_allocatorEEEEEvRT_NS_10option_setINS0_12region_usageEjEERKNSt3__18functionIFvS8_NS0_5blockEEEEEUlS8_mmE_"))
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

uint64_t std::__function::__func<void caulk::alloc::allocator_enumerate<caulk::alloc::tracking_allocator<caulk::alloc::page_allocator>>(caulk::alloc::tracking_allocator<caulk::alloc::page_allocator> &,caulk::option_set<caulk::alloc::region_usage,unsigned int>,std::function<void ()(caulk::alloc::region_usage,caulk::alloc::block)> const&)::{lambda(caulk::alloc::region_usage,unsigned long,unsigned long)#1},std::allocator<void caulk::alloc::allocator_enumerate<caulk::alloc::tracking_allocator<caulk::alloc::page_allocator>>(caulk::alloc::tracking_allocator<caulk::alloc::page_allocator> &,caulk::option_set<caulk::alloc::region_usage,unsigned int>,std::function<void ()(caulk::alloc::region_usage,caulk::alloc::block)> const&)::{lambda(caulk::alloc::region_usage,unsigned long,unsigned long)#1}>,void ()(caulk::alloc::region_usage,unsigned long,unsigned long)>::operator()(uint64_t a1, int *a2, uint64_t *a3, uint64_t *a4)
{
  return std::function<void ()(caulk::alloc::region_usage,caulk::alloc::block)>::operator()(*(void *)(*(void *)(a1 + 8) + 24), *a2, *a3, *a4);
}

uint64_t std::__function::__func<void caulk::alloc::allocator_enumerate<caulk::alloc::tracking_allocator<caulk::alloc::page_allocator>>(caulk::alloc::tracking_allocator<caulk::alloc::page_allocator> &,caulk::option_set<caulk::alloc::region_usage,unsigned int>,std::function<void ()(caulk::alloc::region_usage,caulk::alloc::block)> const&)::{lambda(caulk::alloc::region_usage,unsigned long,unsigned long)#1},std::allocator<void caulk::alloc::allocator_enumerate<caulk::alloc::tracking_allocator<caulk::alloc::page_allocator>>(caulk::alloc::tracking_allocator<caulk::alloc::page_allocator> &,caulk::option_set<caulk::alloc::region_usage,unsigned int>,std::function<void ()(caulk::alloc::region_usage,caulk::alloc::block)> const&)::{lambda(caulk::alloc::region_usage,unsigned long,unsigned long)#1}>,void ()(caulk::alloc::region_usage,unsigned long,unsigned long)>::__clone(uint64_t result, void *a2)
{
  uint64_t v2 = *(void *)(result + 8);
  *a2 = &unk_26C2ABB00;
  a2[1] = v2;
  return result;
}

void *std::__function::__func<void caulk::alloc::allocator_enumerate<caulk::alloc::tracking_allocator<caulk::alloc::page_allocator>>(caulk::alloc::tracking_allocator<caulk::alloc::page_allocator> &,caulk::option_set<caulk::alloc::region_usage,unsigned int>,std::function<void ()(caulk::alloc::region_usage,caulk::alloc::block)> const&)::{lambda(caulk::alloc::region_usage,unsigned long,unsigned long)#1},std::allocator<void caulk::alloc::allocator_enumerate<caulk::alloc::tracking_allocator<caulk::alloc::page_allocator>>(caulk::alloc::tracking_allocator<caulk::alloc::page_allocator> &,caulk::option_set<caulk::alloc::region_usage,unsigned int>,std::function<void ()(caulk::alloc::region_usage,caulk::alloc::block)> const&)::{lambda(caulk::alloc::region_usage,unsigned long,unsigned long)#1}>,void ()(caulk::alloc::region_usage,unsigned long,unsigned long)>::__clone(uint64_t a1)
{
  __n128 result = operator new(0x10uLL);
  uint64_t v3 = *(void *)(a1 + 8);
  *__n128 result = &unk_26C2ABB00;
  result[1] = v3;
  return result;
}

void std::__function::__func<void caulk::alloc::allocator_enumerate<caulk::alloc::tracking_allocator<caulk::alloc::page_allocator>>(caulk::alloc::tracking_allocator<caulk::alloc::page_allocator> &,caulk::option_set<caulk::alloc::region_usage,unsigned int>,std::function<void ()(caulk::alloc::region_usage,caulk::alloc::block)> const&)::{lambda(caulk::alloc::region_usage,unsigned long,unsigned long)#1},std::allocator<void caulk::alloc::allocator_enumerate<caulk::alloc::tracking_allocator<caulk::alloc::page_allocator>>(caulk::alloc::tracking_allocator<caulk::alloc::page_allocator> &,caulk::option_set<caulk::alloc::region_usage,unsigned int>,std::function<void ()(caulk::alloc::region_usage,caulk::alloc::block)> const&)::{lambda(caulk::alloc::region_usage,unsigned long,unsigned long)#1}>,void ()(caulk::alloc::region_usage,unsigned long,unsigned long)>::~__func()
{
}

void *std::__function::__func<void caulk::alloc::base_allocator::formatter::summarize_blocks_by_size<caulk::alloc::tracking_allocator<caulk::alloc::page_allocator>>(caulk::alloc::tracking_allocator<caulk::alloc::page_allocator> &,unsigned long)::{lambda(caulk::alloc::region_usage,caulk::alloc::block)#1},std::allocator<void caulk::alloc::base_allocator::formatter::summarize_blocks_by_size<caulk::alloc::tracking_allocator<caulk::alloc::page_allocator>>(caulk::alloc::tracking_allocator<caulk::alloc::page_allocator> &,unsigned long)::{lambda(caulk::alloc::region_usage,caulk::alloc::block)#1}>,void ()(caulk::alloc::region_usage,caulk::alloc::block)>::target_type()
{
}

uint64_t std::__function::__func<void caulk::alloc::base_allocator::formatter::summarize_blocks_by_size<caulk::alloc::tracking_allocator<caulk::alloc::page_allocator>>(caulk::alloc::tracking_allocator<caulk::alloc::page_allocator> &,unsigned long)::{lambda(caulk::alloc::region_usage,caulk::alloc::block)#1},std::allocator<void caulk::alloc::base_allocator::formatter::summarize_blocks_by_size<caulk::alloc::tracking_allocator<caulk::alloc::page_allocator>>(caulk::alloc::tracking_allocator<caulk::alloc::page_allocator> &,unsigned long)::{lambda(caulk::alloc::region_usage,caulk::alloc::block)#1}>,void ()(caulk::alloc::region_usage,caulk::alloc::block)>::target(uint64_t a1, uint64_t a2)
{
  if (std::type_info::operator==[abi:ne180100](*(void *)(a2 + 8), (uint64_t)"ZN5caulk5alloc14base_allocator9formatter24summarize_blocks_by_sizeINS0_18tracking_allocatorINS0_14page_allocatorEEEEEvRT_mEUlNS0_12region_usageENS0_5blockEE_"))
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

uint64_t **std::__function::__func<void caulk::alloc::base_allocator::formatter::summarize_blocks_by_size<caulk::alloc::tracking_allocator<caulk::alloc::page_allocator>>(caulk::alloc::tracking_allocator<caulk::alloc::page_allocator> &,unsigned long)::{lambda(caulk::alloc::region_usage,caulk::alloc::block)#1},std::allocator<void caulk::alloc::base_allocator::formatter::summarize_blocks_by_size<caulk::alloc::tracking_allocator<caulk::alloc::page_allocator>>(caulk::alloc::tracking_allocator<caulk::alloc::page_allocator> &,unsigned long)::{lambda(caulk::alloc::region_usage,caulk::alloc::block)#1}>,void ()(caulk::alloc::region_usage,caulk::alloc::block)>::operator()(uint64_t **result, int *a2, uint64_t a3)
{
  int v3 = *a2;
  if ((*a2 - 3) >= 0xFFFFFFFE)
  {
    uint64_t v4 = result;
    unint64_t v5 = *(void *)(a3 + 8);
    unint64_t v6 = v5 & 0x1FFFFFFFFFFFFFFFLL;
    unint64_t v7 = (v5 >> 4) & 0x1FFFFFFFFFFFFFFLL;
    if (v6 <= 0xF423F) {
      unint64_t v8 = ((v6 + 1023) >> 10) | 0x2000000000000000;
    }
    else {
      unint64_t v8 = ((v6 + 0xFFFFF) >> 20) | 0x4000000000000000;
    }
    if (v7 >= 0x271) {
      unint64_t v9 = v8;
    }
    else {
      unint64_t v9 = v6;
    }
    uint64_t v11 = (uint64_t *)(v9 | ((unint64_t)(v3 == 2) << 63));
    __n128 result = std::__tree<std::__value_type<unsigned long long,unsigned int>,std::__map_value_compare<unsigned long long,std::__value_type<unsigned long long,unsigned int>,std::less<unsigned long long>,true>,std::allocator<std::__value_type<unsigned long long,unsigned int>>>::__emplace_unique_key_args<unsigned long long,std::piecewise_construct_t const&,std::tuple<unsigned long long const&>,std::tuple<>>((uint64_t **)result[1], (unint64_t)v11, &v11);
    ++*((_DWORD *)result + 10);
    if (v3 == 2)
    {
      char v10 = v4 + 4;
    }
    else
    {
      ++*v4[2];
      char v10 = v4 + 3;
    }
    **v10 += v6;
  }
  return result;
}

__n128 std::__function::__func<void caulk::alloc::base_allocator::formatter::summarize_blocks_by_size<caulk::alloc::tracking_allocator<caulk::alloc::page_allocator>>(caulk::alloc::tracking_allocator<caulk::alloc::page_allocator> &,unsigned long)::{lambda(caulk::alloc::region_usage,caulk::alloc::block)#1},std::allocator<void caulk::alloc::base_allocator::formatter::summarize_blocks_by_size<caulk::alloc::tracking_allocator<caulk::alloc::page_allocator>>(caulk::alloc::tracking_allocator<caulk::alloc::page_allocator> &,unsigned long)::{lambda(caulk::alloc::region_usage,caulk::alloc::block)#1}>,void ()(caulk::alloc::region_usage,caulk::alloc::block)>::__clone(uint64_t a1, uint64_t a2)
{
  *(void *)a2 = &unk_26C2AB9F8;
  __n128 result = *(__n128 *)(a1 + 8);
  *(_OWORD *)(a2 + 24) = *(_OWORD *)(a1 + 24);
  *(__n128 *)(a2 + 8) = result;
  return result;
}

__n128 std::__function::__func<void caulk::alloc::base_allocator::formatter::summarize_blocks_by_size<caulk::alloc::tracking_allocator<caulk::alloc::page_allocator>>(caulk::alloc::tracking_allocator<caulk::alloc::page_allocator> &,unsigned long)::{lambda(caulk::alloc::region_usage,caulk::alloc::block)#1},std::allocator<void caulk::alloc::base_allocator::formatter::summarize_blocks_by_size<caulk::alloc::tracking_allocator<caulk::alloc::page_allocator>>(caulk::alloc::tracking_allocator<caulk::alloc::page_allocator> &,unsigned long)::{lambda(caulk::alloc::region_usage,caulk::alloc::block)#1}>,void ()(caulk::alloc::region_usage,caulk::alloc::block)>::__clone(uint64_t a1)
{
  uint64_t v2 = (char *)operator new(0x28uLL);
  *(void *)uint64_t v2 = &unk_26C2AB9F8;
  *(_OWORD *)(v2 + 8) = *(_OWORD *)(a1 + 8);
  __n128 result = *(__n128 *)(a1 + 24);
  *(__n128 *)(v2 + 24) = result;
  return result;
}

void std::__function::__func<void caulk::alloc::base_allocator::formatter::summarize_blocks_by_size<caulk::alloc::tracking_allocator<caulk::alloc::page_allocator>>(caulk::alloc::tracking_allocator<caulk::alloc::page_allocator> &,unsigned long)::{lambda(caulk::alloc::region_usage,caulk::alloc::block)#1},std::allocator<void caulk::alloc::base_allocator::formatter::summarize_blocks_by_size<caulk::alloc::tracking_allocator<caulk::alloc::page_allocator>>(caulk::alloc::tracking_allocator<caulk::alloc::page_allocator> &,unsigned long)::{lambda(caulk::alloc::region_usage,caulk::alloc::block)#1}>,void ()(caulk::alloc::region_usage,caulk::alloc::block)>::~__func()
{
}

void *std::__function::__func<void caulk::alloc::allocator_enumerate<caulk::alloc::consolidating_free_map<caulk::alloc::page_allocator,10485760ul>>(caulk::alloc::consolidating_free_map<caulk::alloc::page_allocator,10485760ul> &,caulk::option_set<caulk::alloc::region_usage,unsigned int>,std::function<void ()(caulk::alloc::region_usage,caulk::alloc::block)> const&)::{lambda(caulk::alloc::region_usage,unsigned long,unsigned long)#1},std::allocator<void caulk::alloc::allocator_enumerate<caulk::alloc::consolidating_free_map<caulk::alloc::page_allocator,10485760ul>>(caulk::alloc::consolidating_free_map<caulk::alloc::page_allocator,10485760ul> &,caulk::option_set<caulk::alloc::region_usage,unsigned int>,std::function<void ()(caulk::alloc::region_usage,caulk::alloc::block)> const&)::{lambda(caulk::alloc::region_usage,unsigned long,unsigned long)#1}>,void ()(caulk::alloc::region_usage,unsigned long,unsigned long)>::target_type()
{
}

uint64_t std::__function::__func<void caulk::alloc::allocator_enumerate<caulk::alloc::consolidating_free_map<caulk::alloc::page_allocator,10485760ul>>(caulk::alloc::consolidating_free_map<caulk::alloc::page_allocator,10485760ul> &,caulk::option_set<caulk::alloc::region_usage,unsigned int>,std::function<void ()(caulk::alloc::region_usage,caulk::alloc::block)> const&)::{lambda(caulk::alloc::region_usage,unsigned long,unsigned long)#1},std::allocator<void caulk::alloc::allocator_enumerate<caulk::alloc::consolidating_free_map<caulk::alloc::page_allocator,10485760ul>>(caulk::alloc::consolidating_free_map<caulk::alloc::page_allocator,10485760ul> &,caulk::option_set<caulk::alloc::region_usage,unsigned int>,std::function<void ()(caulk::alloc::region_usage,caulk::alloc::block)> const&)::{lambda(caulk::alloc::region_usage,unsigned long,unsigned long)#1}>,void ()(caulk::alloc::region_usage,unsigned long,unsigned long)>::target(uint64_t a1, uint64_t a2)
{
  if (std::type_info::operator==[abi:ne180100](*(void *)(a2 + 8), (uint64_t)"ZN5caulk5alloc19allocator_enumerateINS0_22consolidating_free_mapINS0_14page_allocatorELm10485760EEEEEvRT_NS_10option_setINS0_12region_usageEjEERKNSt3__18functionIFvS8_NS0_5blockEEEEEUlS8_mmE_"))
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

uint64_t std::__function::__func<void caulk::alloc::allocator_enumerate<caulk::alloc::consolidating_free_map<caulk::alloc::page_allocator,10485760ul>>(caulk::alloc::consolidating_free_map<caulk::alloc::page_allocator,10485760ul> &,caulk::option_set<caulk::alloc::region_usage,unsigned int>,std::function<void ()(caulk::alloc::region_usage,caulk::alloc::block)> const&)::{lambda(caulk::alloc::region_usage,unsigned long,unsigned long)#1},std::allocator<void caulk::alloc::allocator_enumerate<caulk::alloc::consolidating_free_map<caulk::alloc::page_allocator,10485760ul>>(caulk::alloc::consolidating_free_map<caulk::alloc::page_allocator,10485760ul> &,caulk::option_set<caulk::alloc::region_usage,unsigned int>,std::function<void ()(caulk::alloc::region_usage,caulk::alloc::block)> const&)::{lambda(caulk::alloc::region_usage,unsigned long,unsigned long)#1}>,void ()(caulk::alloc::region_usage,unsigned long,unsigned long)>::operator()(uint64_t a1, int *a2, uint64_t *a3, uint64_t *a4)
{
  return std::function<void ()(caulk::alloc::region_usage,caulk::alloc::block)>::operator()(*(void *)(*(void *)(a1 + 8) + 24), *a2, *a3, *a4);
}

uint64_t std::__function::__func<void caulk::alloc::allocator_enumerate<caulk::alloc::consolidating_free_map<caulk::alloc::page_allocator,10485760ul>>(caulk::alloc::consolidating_free_map<caulk::alloc::page_allocator,10485760ul> &,caulk::option_set<caulk::alloc::region_usage,unsigned int>,std::function<void ()(caulk::alloc::region_usage,caulk::alloc::block)> const&)::{lambda(caulk::alloc::region_usage,unsigned long,unsigned long)#1},std::allocator<void caulk::alloc::allocator_enumerate<caulk::alloc::consolidating_free_map<caulk::alloc::page_allocator,10485760ul>>(caulk::alloc::consolidating_free_map<caulk::alloc::page_allocator,10485760ul> &,caulk::option_set<caulk::alloc::region_usage,unsigned int>,std::function<void ()(caulk::alloc::region_usage,caulk::alloc::block)> const&)::{lambda(caulk::alloc::region_usage,unsigned long,unsigned long)#1}>,void ()(caulk::alloc::region_usage,unsigned long,unsigned long)>::__clone(uint64_t result, void *a2)
{
  uint64_t v2 = *(void *)(result + 8);
  *a2 = &unk_26C2ABBB0;
  a2[1] = v2;
  return result;
}

void *std::__function::__func<void caulk::alloc::allocator_enumerate<caulk::alloc::consolidating_free_map<caulk::alloc::page_allocator,10485760ul>>(caulk::alloc::consolidating_free_map<caulk::alloc::page_allocator,10485760ul> &,caulk::option_set<caulk::alloc::region_usage,unsigned int>,std::function<void ()(caulk::alloc::region_usage,caulk::alloc::block)> const&)::{lambda(caulk::alloc::region_usage,unsigned long,unsigned long)#1},std::allocator<void caulk::alloc::allocator_enumerate<caulk::alloc::consolidating_free_map<caulk::alloc::page_allocator,10485760ul>>(caulk::alloc::consolidating_free_map<caulk::alloc::page_allocator,10485760ul> &,caulk::option_set<caulk::alloc::region_usage,unsigned int>,std::function<void ()(caulk::alloc::region_usage,caulk::alloc::block)> const&)::{lambda(caulk::alloc::region_usage,unsigned long,unsigned long)#1}>,void ()(caulk::alloc::region_usage,unsigned long,unsigned long)>::__clone(uint64_t a1)
{
  __n128 result = operator new(0x10uLL);
  uint64_t v3 = *(void *)(a1 + 8);
  *__n128 result = &unk_26C2ABBB0;
  result[1] = v3;
  return result;
}

void std::__function::__func<void caulk::alloc::allocator_enumerate<caulk::alloc::consolidating_free_map<caulk::alloc::page_allocator,10485760ul>>(caulk::alloc::consolidating_free_map<caulk::alloc::page_allocator,10485760ul> &,caulk::option_set<caulk::alloc::region_usage,unsigned int>,std::function<void ()(caulk::alloc::region_usage,caulk::alloc::block)> const&)::{lambda(caulk::alloc::region_usage,unsigned long,unsigned long)#1},std::allocator<void caulk::alloc::allocator_enumerate<caulk::alloc::consolidating_free_map<caulk::alloc::page_allocator,10485760ul>>(caulk::alloc::consolidating_free_map<caulk::alloc::page_allocator,10485760ul> &,caulk::option_set<caulk::alloc::region_usage,unsigned int>,std::function<void ()(caulk::alloc::region_usage,caulk::alloc::block)> const&)::{lambda(caulk::alloc::region_usage,unsigned long,unsigned long)#1}>,void ()(caulk::alloc::region_usage,unsigned long,unsigned long)>::~__func()
{
}

void *std::__function::__func<void caulk::alloc::base_allocator::formatter::summarize_blocks_by_size<caulk::alloc::consolidating_free_map<caulk::alloc::page_allocator,10485760ul>>(caulk::alloc::consolidating_free_map<caulk::alloc::page_allocator,10485760ul> &,unsigned long)::{lambda(caulk::alloc::region_usage,caulk::alloc::block)#1},std::allocator<void caulk::alloc::base_allocator::formatter::summarize_blocks_by_size<caulk::alloc::consolidating_free_map<caulk::alloc::page_allocator,10485760ul>>(caulk::alloc::consolidating_free_map<caulk::alloc::page_allocator,10485760ul> &,unsigned long)::{lambda(caulk::alloc::region_usage,caulk::alloc::block)#1}>,void ()(caulk::alloc::region_usage,caulk::alloc::block)>::target_type()
{
}

uint64_t std::__function::__func<void caulk::alloc::base_allocator::formatter::summarize_blocks_by_size<caulk::alloc::consolidating_free_map<caulk::alloc::page_allocator,10485760ul>>(caulk::alloc::consolidating_free_map<caulk::alloc::page_allocator,10485760ul> &,unsigned long)::{lambda(caulk::alloc::region_usage,caulk::alloc::block)#1},std::allocator<void caulk::alloc::base_allocator::formatter::summarize_blocks_by_size<caulk::alloc::consolidating_free_map<caulk::alloc::page_allocator,10485760ul>>(caulk::alloc::consolidating_free_map<caulk::alloc::page_allocator,10485760ul> &,unsigned long)::{lambda(caulk::alloc::region_usage,caulk::alloc::block)#1}>,void ()(caulk::alloc::region_usage,caulk::alloc::block)>::target(uint64_t a1, uint64_t a2)
{
  if (std::type_info::operator==[abi:ne180100](*(void *)(a2 + 8), (uint64_t)"ZN5caulk5alloc14base_allocator9formatter24summarize_blocks_by_sizeINS0_22consolidating_free_mapINS0_14page_allocatorELm10485760EEEEEvRT_mEUlNS0_12region_usageENS0_5blockEE_"))
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

uint64_t **std::__function::__func<void caulk::alloc::base_allocator::formatter::summarize_blocks_by_size<caulk::alloc::consolidating_free_map<caulk::alloc::page_allocator,10485760ul>>(caulk::alloc::consolidating_free_map<caulk::alloc::page_allocator,10485760ul> &,unsigned long)::{lambda(caulk::alloc::region_usage,caulk::alloc::block)#1},std::allocator<void caulk::alloc::base_allocator::formatter::summarize_blocks_by_size<caulk::alloc::consolidating_free_map<caulk::alloc::page_allocator,10485760ul>>(caulk::alloc::consolidating_free_map<caulk::alloc::page_allocator,10485760ul> &,unsigned long)::{lambda(caulk::alloc::region_usage,caulk::alloc::block)#1}>,void ()(caulk::alloc::region_usage,caulk::alloc::block)>::operator()(uint64_t **result, int *a2, uint64_t a3)
{
  int v3 = *a2;
  if ((*a2 - 3) >= 0xFFFFFFFE)
  {
    uint64_t v4 = result;
    unint64_t v5 = *(void *)(a3 + 8);
    unint64_t v6 = v5 & 0x1FFFFFFFFFFFFFFFLL;
    unint64_t v7 = (v5 >> 4) & 0x1FFFFFFFFFFFFFFLL;
    if (v6 <= 0xF423F) {
      unint64_t v8 = ((v6 + 1023) >> 10) | 0x2000000000000000;
    }
    else {
      unint64_t v8 = ((v6 + 0xFFFFF) >> 20) | 0x4000000000000000;
    }
    if (v7 >= 0x271) {
      unint64_t v9 = v8;
    }
    else {
      unint64_t v9 = v6;
    }
    uint64_t v11 = (uint64_t *)(v9 | ((unint64_t)(v3 == 2) << 63));
    __n128 result = std::__tree<std::__value_type<unsigned long long,unsigned int>,std::__map_value_compare<unsigned long long,std::__value_type<unsigned long long,unsigned int>,std::less<unsigned long long>,true>,std::allocator<std::__value_type<unsigned long long,unsigned int>>>::__emplace_unique_key_args<unsigned long long,std::piecewise_construct_t const&,std::tuple<unsigned long long const&>,std::tuple<>>((uint64_t **)result[1], (unint64_t)v11, &v11);
    ++*((_DWORD *)result + 10);
    if (v3 == 2)
    {
      char v10 = v4 + 4;
    }
    else
    {
      ++*v4[2];
      char v10 = v4 + 3;
    }
    **v10 += v6;
  }
  return result;
}

__n128 std::__function::__func<void caulk::alloc::base_allocator::formatter::summarize_blocks_by_size<caulk::alloc::consolidating_free_map<caulk::alloc::page_allocator,10485760ul>>(caulk::alloc::consolidating_free_map<caulk::alloc::page_allocator,10485760ul> &,unsigned long)::{lambda(caulk::alloc::region_usage,caulk::alloc::block)#1},std::allocator<void caulk::alloc::base_allocator::formatter::summarize_blocks_by_size<caulk::alloc::consolidating_free_map<caulk::alloc::page_allocator,10485760ul>>(caulk::alloc::consolidating_free_map<caulk::alloc::page_allocator,10485760ul> &,unsigned long)::{lambda(caulk::alloc::region_usage,caulk::alloc::block)#1}>,void ()(caulk::alloc::region_usage,caulk::alloc::block)>::__clone(uint64_t a1, uint64_t a2)
{
  *(void *)a2 = &unk_26C2ABAA8;
  __n128 result = *(__n128 *)(a1 + 8);
  *(_OWORD *)(a2 + 24) = *(_OWORD *)(a1 + 24);
  *(__n128 *)(a2 + 8) = result;
  return result;
}

__n128 std::__function::__func<void caulk::alloc::base_allocator::formatter::summarize_blocks_by_size<caulk::alloc::consolidating_free_map<caulk::alloc::page_allocator,10485760ul>>(caulk::alloc::consolidating_free_map<caulk::alloc::page_allocator,10485760ul> &,unsigned long)::{lambda(caulk::alloc::region_usage,caulk::alloc::block)#1},std::allocator<void caulk::alloc::base_allocator::formatter::summarize_blocks_by_size<caulk::alloc::consolidating_free_map<caulk::alloc::page_allocator,10485760ul>>(caulk::alloc::consolidating_free_map<caulk::alloc::page_allocator,10485760ul> &,unsigned long)::{lambda(caulk::alloc::region_usage,caulk::alloc::block)#1}>,void ()(caulk::alloc::region_usage,caulk::alloc::block)>::__clone(uint64_t a1)
{
  uint64_t v2 = (char *)operator new(0x28uLL);
  *(void *)uint64_t v2 = &unk_26C2ABAA8;
  *(_OWORD *)(v2 + 8) = *(_OWORD *)(a1 + 8);
  __n128 result = *(__n128 *)(a1 + 24);
  *(__n128 *)(v2 + 24) = result;
  return result;
}

void std::__function::__func<void caulk::alloc::base_allocator::formatter::summarize_blocks_by_size<caulk::alloc::consolidating_free_map<caulk::alloc::page_allocator,10485760ul>>(caulk::alloc::consolidating_free_map<caulk::alloc::page_allocator,10485760ul> &,unsigned long)::{lambda(caulk::alloc::region_usage,caulk::alloc::block)#1},std::allocator<void caulk::alloc::base_allocator::formatter::summarize_blocks_by_size<caulk::alloc::consolidating_free_map<caulk::alloc::page_allocator,10485760ul>>(caulk::alloc::consolidating_free_map<caulk::alloc::page_allocator,10485760ul> &,unsigned long)::{lambda(caulk::alloc::region_usage,caulk::alloc::block)#1}>,void ()(caulk::alloc::region_usage,caulk::alloc::block)>::~__func()
{
}

BOOL caulk::alloc::resource<caulk::alloc::audio_allocator,caulk::alloc::memory_resource>::do_is_equal(uint64_t a1, uint64_t a2)
{
  return a1 == a2;
}

void caulk::alloc::darwin_resource<caulk::alloc::audio_allocator,caulk::alloc::memory_resource>::do_deallocate(uint64_t a1, unint64_t a2, unint64_t a3)
{
  unint64_t v6 = *(void (**)(uint64_t, uint64_t, unint64_t, void, void, void))(a1 + 1408);
  if (v6) {
    v6(12, *(void *)(a1 + 1392) + 8, a2, 0, 0, 0);
  }

  caulk::alloc::tiered_allocator<caulk::alloc::size_range_tier<0ul,1008ul,caulk::alloc::tree_allocator<caulk::alloc::chunk_allocator<caulk::alloc::page_allocator,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,16ul,6ul>>>,caulk::alloc::size_range_tier<1009ul,256000ul,caulk::alloc::guarded_edges_allocator<caulk::alloc::consolidating_free_map<caulk::alloc::page_allocator,10485760ul>,4ul>>,caulk::alloc::tracking_allocator<caulk::alloc::page_allocator>>::deallocate(a1 + 16, a2, a3);
}

unint64_t *caulk::concurrent::skiplist<unsigned long,caulk::alloc::chunk_allocator<caulk::alloc::page_allocator,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,16ul,6ul>::node_impl<caulk::alloc::tree_allocator<caulk::alloc::chunk_allocator<caulk::alloc::page_allocator,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,16ul,6ul>>::node_header,caulk::alloc::embed_block_memory> *,5,(caulk::concurrent::skiplist_options)1>::emplace<caulk::alloc::chunk_allocator<caulk::alloc::page_allocator,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,16ul,6ul>::node_impl<caulk::alloc::tree_allocator<caulk::alloc::chunk_allocator<caulk::alloc::page_allocator,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,16ul,6ul>>::node_header,caulk::alloc::embed_block_memory> *>(unint64_t *result, unint64_t a2, void *a3)
{
  if (*result >= a2 || (unint64_t v4 = (unint64_t)result, result[14] <= a2))
  {
    __break(1u);
    return result;
  }
  uint64_t v5 = (uint64_t)(result + 20);
  caulk::concurrent::details::node_allocator<void *,caulk::alloc::detail::tracked_block,10ul,(caulk::concurrent::skiplist_options)0>::begin_traversal();
  unint64_t v35 = a2;
  unint64_t v6 = (unint64_t *)caulk::concurrent::skiplist<unsigned long,caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,256ul,6ul>::node_impl<caulk::alloc::tree_allocator<caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,256ul,6ul>>::node_header,caulk::alloc::embed_block_memory> *,5,(caulk::concurrent::skiplist_options)1>::search_to_level<caulk::concurrent::skiplist<unsigned long,caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,256ul,6ul>::node_impl<caulk::alloc::tree_allocator<caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,256ul,6ul>>::node_header,caulk::alloc::embed_block_memory> *,5,(caulk::concurrent::skiplist_options)1>::key_le>(v4, &v35, 0);
  unint64_t v8 = *v6;
  if (*v6 == a2) {
    return (unint64_t *)caulk::concurrent::details::node_allocator<unsigned long,caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,256ul,6ul>::node_impl<caulk::alloc::tree_allocator<caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,256ul,6ul>>::node_header,caulk::alloc::embed_block_memory> *,5ul,(caulk::concurrent::skiplist_options)1>::end_traversal(v5, v8);
  }
  unint64_t v9 = v6;
  unint64_t v10 = v7;
  int v11 = 0;
  int value = 0;
  for (uint64_t i = 1; i != 4; ++i)
  {
    if (i == 1)
    {
      caulk::concurrent::skiplist<unsigned long,caulk::alloc::chunk_allocator<caulk::alloc::page_allocator,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,16ul,6ul>::node_impl<caulk::alloc::tree_allocator<caulk::alloc::chunk_allocator<caulk::alloc::page_allocator,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,16ul,6ul>>::node_header,caulk::alloc::embed_block_memory> *,5,(caulk::concurrent::skiplist_options)1>::random_engine();
      int value = caulk::multi_simple_random<unsigned int,4ul,std::uniform_int_distribution<unsigned int>,std::mersenne_twister_engine<unsigned int,32ul,624ul,397ul,31ul,2567483615u,11ul,4294967295u,7ul,2636928640u,15ul,4022730752u,18ul,1812433253u>>::next_value((uint64_t)&caulk::concurrent::skiplist<unsigned long,caulk::alloc::chunk_allocator<caulk::alloc::page_allocator,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,16ul,6ul>::node_impl<caulk::alloc::tree_allocator<caulk::alloc::chunk_allocator<caulk::alloc::page_allocator,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,16ul,6ul>>::node_header,caulk::alloc::embed_block_memory> *,5,(caulk::concurrent::skiplist_options)1>::random_engine(void)::engine);
      int v11 = 3;
    }
    if ((v11 & ~value) != 0) {
      break;
    }
    v11 *= 4;
  }
  uint64_t v14 = 0;
  uint64_t v15 = *(void *)(v4 + 176);
  while (1)
  {
    unint64_t v16 = *(void *)&caulk::concurrent::details::node_allocator<unsigned long,caulk::alloc::chunk_allocator<caulk::alloc::page_allocator,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,16ul,6ul>::node_impl<caulk::alloc::tree_allocator<caulk::alloc::chunk_allocator<caulk::alloc::page_allocator,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,16ul,6ul>>::node_header,caulk::alloc::embed_block_memory> *,5ul,(caulk::concurrent::skiplist_options)1>::node_sizes[8 * v14];
    if (v16 >= *(void *)&caulk::concurrent::details::node_allocator<unsigned long,caulk::alloc::chunk_allocator<caulk::alloc::page_allocator,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,16ul,6ul>::node_impl<caulk::alloc::tree_allocator<caulk::alloc::chunk_allocator<caulk::alloc::page_allocator,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,16ul,6ul>>::node_header,caulk::alloc::embed_block_memory> *,5ul,(caulk::concurrent::skiplist_options)1>::node_sizes[8 * i - 8]) {
      break;
    }
    if (++v14 == 5)
    {
      unint64_t v17 = 0;
      goto LABEL_17;
    }
  }
  uint64_t v18 = v15 + 64 + 32 * v14;
  uint64_t v19 = caulk::concurrent::stack<caulk::alloc::free_block,caulk::concurrent::intrusive_single_link_node<caulk::alloc::free_block>>::pop();
  if (v19)
  {
    unint64_t v17 = (unint64_t)v19;
    atomic_fetch_add((atomic_ullong *volatile)(v18 + 16), 0xFFFFFFFFFFFFFFFFLL);
  }
  else
  {
    unint64_t v17 = caulk::alloc::cascading_allocator<caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::serial_allocator,caulk::alloc::embed_block_memory,16384ul>>::allocate(v15, v16);
  }
  uint64_t v5 = v4 + 160;
LABEL_17:
  *(unsigned char *)(v17 + 16) = i;
  *(_WORD *)(v17 + 17) = 1;
  *(unsigned char *)(v17 + 19) = i;
  *(void *)unint64_t v17 = a2;
  *(void *)(v17 + 8) = 0;
  *(void *)(v17 + 8) = *a3;
  *(void *)(v17 + 32) = 0;
  *(void *)(v17 + 40) = 0;
  *(void *)(v17 + 24) = 0;
  if ((_BYTE)i)
  {
    uint64_t v20 = (unint64_t *)(v17 + 40);
    uint64_t v21 = i;
    do
    {
      atomic_store(0, v20 - 1);
      atomic_store(0, v20);
      v20 += 2;
      --v21;
    }
    while (v21);
  }
  unint64_t v22 = 0;
  __dmb(0xBu);
  while (2)
  {
    if (*v9 == *(void *)v17)
    {
LABEL_37:
      unint64_t v32 = 0;
      goto LABEL_38;
    }
    while (1)
    {
      uint64_t v23 = &v9[2 * v22 + 4];
      unint64_t v24 = atomic_load(v23);
      if ((v24 & 2) == 0) {
        break;
      }
      caulk::concurrent::skiplist<unsigned long,caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,256ul,6ul>::node_impl<caulk::alloc::tree_allocator<caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,256ul,6ul>>::node_header,caulk::alloc::embed_block_memory> *,5,(caulk::concurrent::skiplist_options)1>::help_flagged(v4, v22, (unint64_t)v9, v24 & 0xFFFFFFFFFFFFFFFCLL);
LABEL_30:
      unint64_t v28 = *(void *)v17;
      while (1)
      {
        unint64_t v29 = atomic_load(&v9[2 * v22 + 4]);
        unint64_t v10 = v29 & 0xFFFFFFFFFFFFFFFCLL;
        if (v28 < *(void *)(v29 & 0xFFFFFFFFFFFFFFFCLL)) {
          break;
        }
        char v30 = atomic_load((unint64_t *)(v10 + 32));
        if (v30)
        {
          unint64_t v9 = (void *)caulk::concurrent::skiplist<unsigned long,caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,256ul,6ul>::node_impl<caulk::alloc::tree_allocator<caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,256ul,6ul>>::node_header,caulk::alloc::embed_block_memory> *,5,(caulk::concurrent::skiplist_options)1>::try_flag_node(v4, v22, (unint64_t)v9, v10);
          if (!v31) {
            caulk::concurrent::skiplist<unsigned long,caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,256ul,6ul>::node_impl<caulk::alloc::tree_allocator<caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,256ul,6ul>>::node_header,caulk::alloc::embed_block_memory> *,5,(caulk::concurrent::skiplist_options)1>::help_flagged(v4, v22, (unint64_t)v9, v10);
          }
        }
        else
        {
          unint64_t v9 = (void *)v10;
        }
      }
      if (*v9 == *(void *)v17) {
        goto LABEL_37;
      }
    }
    atomic_store(v10, (unint64_t *)(v17 + 16 * v22 + 32));
    unint64_t v25 = v10;
    atomic_compare_exchange_strong((atomic_ullong *volatile)v23, &v25, v17);
    if (v25 != v10)
    {
      if ((v25 & 2) != 0) {
        caulk::concurrent::skiplist<unsigned long,caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,256ul,6ul>::node_impl<caulk::alloc::tree_allocator<caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,256ul,6ul>>::node_header,caulk::alloc::embed_block_memory> *,5,(caulk::concurrent::skiplist_options)1>::help_flagged(v4, v22, (unint64_t)v9, v25 & 0xFFFFFFFFFFFFFFFCLL);
      }
      char v26 = atomic_load(v23);
      if (v26)
      {
        do
        {
          unint64_t v9 = (void *)atomic_load(&v9[2 * v22 + 5]);
          char v27 = atomic_load(&v9[2 * v22 + 4]);
        }
        while ((v27 & 1) != 0);
      }
      goto LABEL_30;
    }
    unint64_t v32 = v17;
LABEL_38:
    if (v32 | v22)
    {
      unint64_t v8 = atomic_load((unint64_t *)(v17 + 32));
      if ((v8 & 1) == 0 && ++v22 != i)
      {
        unint64_t v35 = a2;
        unint64_t v9 = (void *)caulk::concurrent::skiplist<unsigned long,caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,256ul,6ul>::node_impl<caulk::alloc::tree_allocator<caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,256ul,6ul>>::node_header,caulk::alloc::embed_block_memory> *,5,(caulk::concurrent::skiplist_options)1>::search_to_level<caulk::concurrent::skiplist<unsigned long,caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,256ul,6ul>::node_impl<caulk::alloc::tree_allocator<caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,256ul,6ul>>::node_header,caulk::alloc::embed_block_memory> *,5,(caulk::concurrent::skiplist_options)1>::key_le>(v4, &v35, v22);
        unint64_t v10 = v33;
        continue;
      }
    }
    else
    {
      caulk::alloc::multi_free_list<caulk::alloc::cascading_allocator<caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::serial_allocator,caulk::alloc::embed_block_memory,16384ul>>,caulk::concurrent::details::node_allocator<unsigned long,caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,256ul,6ul>::node_impl<caulk::alloc::tree_allocator<caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,256ul,6ul>::node_impl>::node_header,caulk::alloc::embed_block_memory> *,5ul,(caulk::concurrent::skiplist_options)1>::size_generator,8ul,1ul,-1l>::deallocate(*(caulk::alloc::base_allocator **)(v4 + 176), (unint64_t *)v17, *(void *)&caulk::concurrent::details::node_allocator<unsigned long,caulk::alloc::chunk_allocator<caulk::alloc::page_allocator,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,16ul,6ul>::node_impl<caulk::alloc::tree_allocator<caulk::alloc::chunk_allocator<caulk::alloc::page_allocator,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,16ul,6ul>>::node_header,caulk::alloc::embed_block_memory> *,5ul,(caulk::concurrent::skiplist_options)1>::node_sizes[8 * *(unsigned __int8 *)(v17 + 16) - 8]);
    }
    return (unint64_t *)caulk::concurrent::details::node_allocator<unsigned long,caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,256ul,6ul>::node_impl<caulk::alloc::tree_allocator<caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,256ul,6ul>>::node_header,caulk::alloc::embed_block_memory> *,5ul,(caulk::concurrent::skiplist_options)1>::end_traversal(v5, v8);
  }
}

void caulk::concurrent::skiplist<unsigned long,caulk::alloc::chunk_allocator<caulk::alloc::page_allocator,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,16ul,6ul>::node_impl<caulk::alloc::tree_allocator<caulk::alloc::chunk_allocator<caulk::alloc::page_allocator,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,16ul,6ul>>::node_header,caulk::alloc::embed_block_memory> *,5,(caulk::concurrent::skiplist_options)1>::random_engine()
{
  {
    caulk::multi_simple_random<unsigned int,4ul,std::uniform_int_distribution<unsigned int>,std::mersenne_twister_engine<unsigned int,32ul,624ul,397ul,31ul,2567483615u,11ul,4294967295u,7ul,2636928640u,15ul,4022730752u,18ul,1812433253u>>::multi_simple_random((uint64_t)&caulk::concurrent::skiplist<unsigned long,caulk::alloc::chunk_allocator<caulk::alloc::page_allocator,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,16ul,6ul>::node_impl<caulk::alloc::tree_allocator<caulk::alloc::chunk_allocator<caulk::alloc::page_allocator,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,16ul,6ul>>::node_header,caulk::alloc::embed_block_memory> *,5,(caulk::concurrent::skiplist_options)1>::random_engine(void)::engine);
  }
}

void sub_210877D14(_Unwind_Exception *a1)
{
}

void *caulk::alloc::darwin_resource<caulk::alloc::audio_allocator,caulk::alloc::memory_resource>::do_allocate(uint64_t a1, unint64_t a2, unint64_t a3)
{
  uint64_t v5 = (void *)caulk::alloc::tiered_allocator<caulk::alloc::size_range_tier<0ul,1008ul,caulk::alloc::tree_allocator<caulk::alloc::chunk_allocator<caulk::alloc::page_allocator,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,16ul,6ul>>>,caulk::alloc::size_range_tier<1009ul,256000ul,caulk::alloc::guarded_edges_allocator<caulk::alloc::consolidating_free_map<caulk::alloc::page_allocator,10485760ul>,4ul>>,caulk::alloc::tracking_allocator<caulk::alloc::page_allocator>>::allocate(a1 + 16, a2, a3);
  if (!v5)
  {
    exception = (std::bad_alloc *)__cxa_allocate_exception(8uLL);
    int v11 = std::bad_alloc::bad_alloc(exception);
    __cxa_throw(v11, MEMORY[0x263F8C218], MEMORY[0x263F8C170]);
  }
  unint64_t v7 = v5;
  bzero(v5, v6);
  unint64_t v8 = *(void (**)(uint64_t, uint64_t, unint64_t, void, void *, void))(a1 + 1408);
  if (v8) {
    v8(10, *(void *)(a1 + 1392) + 8, a2, 0, v7, 0);
  }
  return v7;
}

uint64_t caulk::alloc::tracking_allocator<caulk::alloc::page_allocator>::allocate(caulk::alloc::page_allocator *a1, uint64_t a2, unint64_t a3)
{
  size_t v6 = caulk::alloc::page_allocator::allocate(a1, a2, a3);
  if (!v6) {
    return (uint64_t)v6;
  }
  *(void *)&long long v8 = v5;
  *((void *)&v8 + 1) = a3;
  if (caulk::concurrent::skiplist<void *,caulk::alloc::detail::tracked_block,10,(caulk::concurrent::skiplist_options)0>::emplace<caulk::alloc::detail::tracked_block>((unint64_t)a1 + 16, (unint64_t)v6, &v8))return (uint64_t)v6; {
  _os_assert_log();
  }
  uint64_t result = _os_crash();
  __break(1u);
  return result;
}

void caulk::alloc::darwin_resource<caulk::alloc::audio_allocator,caulk::alloc::memory_resource>::~darwin_resource(void *a1)
{
  *a1 = &unk_26C2AA2B8;
  uint64_t v2 = a1[174];
  a1[174] = 0;
  if (v2) {
    std::default_delete<caulk::alloc::darwin_resource<caulk::alloc::audio_allocator,caulk::alloc::memory_resource>::zone_plus>::operator()[abi:ne180100](v2);
  }
  caulk::alloc::resource<caulk::alloc::audio_allocator,caulk::alloc::memory_resource>::~resource((uint64_t)a1);

  JUMPOUT(0x216674B00);
}

void std::default_delete<caulk::alloc::darwin_resource<caulk::alloc::audio_allocator,caulk::alloc::memory_resource>::zone_plus>::operator()[abi:ne180100](uint64_t a1)
{
  malloc_zone_unregister((malloc_zone_t *)(a1 + 8));

  JUMPOUT(0x216674B00);
}

uint64_t caulk::alloc::darwin_resource<caulk::alloc::audio_allocator,caulk::alloc::memory_resource>::~darwin_resource(void *a1)
{
  *a1 = &unk_26C2AA2B8;
  uint64_t v2 = a1[174];
  a1[174] = 0;
  if (v2) {
    std::default_delete<caulk::alloc::darwin_resource<caulk::alloc::audio_allocator,caulk::alloc::memory_resource>::zone_plus>::operator()[abi:ne180100](v2);
  }

  return caulk::alloc::resource<caulk::alloc::audio_allocator,caulk::alloc::memory_resource>::~resource((uint64_t)a1);
}

uint64_t caulk::concurrent::skiplist<unsigned long,caulk::alloc::chunk_allocator<caulk::alloc::page_allocator,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,16ul,6ul>::node_impl<caulk::alloc::tree_allocator<caulk::alloc::chunk_allocator<caulk::alloc::page_allocator,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,16ul,6ul>>::node_header,caulk::alloc::embed_block_memory> *,5,(caulk::concurrent::skiplist_options)1>::skiplist(uint64_t a1)
{
  *(_OWORD *)(a1 + 112) = 0u;
  unint64_t v2 = a1 + 112;
  *(_OWORD *)(a1 + 160) = 0u;
  *(_OWORD *)(a1 + 176) = 0u;
  *(_OWORD *)(a1 + 128) = 0u;
  *(_OWORD *)(a1 + 144) = 0u;
  *(_OWORD *)(a1 + 80) = 0u;
  *(_OWORD *)(a1 + 96) = 0u;
  *(_OWORD *)(a1 + 48) = 0u;
  *(_OWORD *)(a1 + 64) = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_OWORD *)(a1 + 32) = 0u;
  *(_OWORD *)a1 = 0u;
  os_unfair_lock_lock((os_unfair_lock_t)&caulk::alloc::shared_allocator<caulk::alloc::multi_free_list<caulk::alloc::cascading_allocator<caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::serial_allocator,caulk::alloc::embed_block_memory,16384ul>>,caulk::concurrent::details::node_allocator<unsigned long,caulk::alloc::chunk_allocator<caulk::alloc::page_allocator,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,16ul,6ul>::node_impl<caulk::alloc::tree_allocator<caulk::alloc::chunk_allocator<caulk::alloc::page_allocator,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,16ul,6ul>::node_impl>::node_header,caulk::alloc::embed_block_memory> *,5ul,(caulk::concurrent::skiplist_options)1>::size_generator,8ul,1ul,-1l>>::shared_instance(void)::global);
  if (qword_26AA55528)
  {
    int v3 = std::__shared_weak_count::lock((std::__shared_weak_count *)qword_26AA55528);
    if (v3)
    {
      unint64_t v4 = v3;
      uint64_t p_shared_owners = qword_26AA55520;
      if (qword_26AA55520) {
        goto LABEL_9;
      }
      std::__shared_weak_count::__release_shared[abi:ne180100](v3);
    }
  }
  unint64_t v4 = (std::__shared_weak_count *)operator new(0x100uLL);
  v4->__shared_owners_ = 0;
  v4->__shared_weak_owners_ = 0;
  v4->__vftable = (std::__shared_weak_count_vtbl *)&unk_26C2AAF38;
  *(_OWORD *)&v4[1].__shared_owners_ = 0u;
  uint64_t p_shared_owners = (uint64_t)&v4[1].__shared_owners_;
  v4[2].std::__shared_count = 0u;
  *(_OWORD *)&v4[2].__shared_weak_owners_ = 0u;
  *(_OWORD *)&v4[3].__shared_owners_ = 0u;
  v4[4].std::__shared_count = 0u;
  *(_OWORD *)&v4[4].__shared_weak_owners_ = 0u;
  *(_OWORD *)&v4[5].__shared_owners_ = 0u;
  v4[6].std::__shared_count = 0u;
  *(_OWORD *)&v4[6].__shared_weak_owners_ = 0u;
  *(_OWORD *)&v4[7].__shared_owners_ = 0u;
  v4[8].std::__shared_count = 0u;
  *(_OWORD *)&v4[8].__shared_weak_owners_ = 0u;
  *(_OWORD *)&v4[9].__shared_owners_ = 0u;
  v4[10].std::__shared_count = 0u;
  caulk::alloc::global_page_cache::instance((caulk::alloc::global_page_cache *)v4);
  v4[3].__shared_owners_ = 0;
  v4[1].__shared_weak_owners_ = (uint64_t)&unk_26AA5D890;
  v4[2].__vftable = 0;
  v4[2].__shared_owners_ = 0;
  v4[2].__shared_weak_owners_ = 0;
  LODWORD(v4[3].__vftable) = 0;
  for (uint64_t i = 96; i != 256; i += 32)
  {
    unint64_t v7 = (std::__shared_weak_count_vtbl **)((char *)&v4->__vftable + i);
    *unint64_t v7 = 0;
    v7[1] = 0;
    void v7[2] = 0;
  }
  atomic_fetch_add_explicit(&v4->__shared_weak_owners_, 1uLL, memory_order_relaxed);
  long long v8 = (std::__shared_weak_count *)qword_26AA55528;
  qword_26AA55520 = (uint64_t)&v4[1].__shared_owners_;
  qword_26AA55528 = (uint64_t)v4;
  if (v8) {
    std::__shared_weak_count::__release_weak(v8);
  }
LABEL_9:
  os_unfair_lock_unlock((os_unfair_lock_t)&caulk::alloc::shared_allocator<caulk::alloc::multi_free_list<caulk::alloc::cascading_allocator<caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::serial_allocator,caulk::alloc::embed_block_memory,16384ul>>,caulk::concurrent::details::node_allocator<unsigned long,caulk::alloc::chunk_allocator<caulk::alloc::page_allocator,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,16ul,6ul>::node_impl<caulk::alloc::tree_allocator<caulk::alloc::chunk_allocator<caulk::alloc::page_allocator,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,16ul,6ul>::node_impl>::node_header,caulk::alloc::embed_block_memory> *,5ul,(caulk::concurrent::skiplist_options)1>::size_generator,8ul,1ul,-1l>>::shared_instance(void)::global);
  atomic_fetch_add_explicit(&v4->__shared_owners_, 1uLL, memory_order_relaxed);
  unint64_t v9 = *(std::__shared_weak_count **)(a1 + 184);
  *(void *)(a1 + 176) = p_shared_owners;
  *(void *)(a1 + 184) = v4;
  if (v9) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v9);
  }
  std::__shared_weak_count::__release_shared[abi:ne180100](v4);
  *(void *)(a1 + 192) = &caulk::inplace_function_detail::vtable<void,caulk::concurrent::details::skiplist_node<unsigned long,caulk::alloc::chunk_allocator<caulk::alloc::page_allocator,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,16ul,6ul>::node_impl<caulk::alloc::tree_allocator<caulk::alloc::chunk_allocator<caulk::alloc::page_allocator,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,16ul,6ul>>::node_header,caulk::alloc::embed_block_memory> *>::layout_kv const&>::empty;
  *(void *)(a1 + 232) = &caulk::inplace_function_detail::vtable<void>::empty;
  *(void *)(a1 + 272) = 0;
  *(void *)(a1 + 280) = 0;
  caulk::concurrent::skiplist<unsigned long,caulk::alloc::chunk_allocator<caulk::alloc::page_allocator,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,16ul,6ul>::node_impl<caulk::alloc::tree_allocator<caulk::alloc::chunk_allocator<caulk::alloc::page_allocator,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,16ul,6ul>>::node_header,caulk::alloc::embed_block_memory> *,5,(caulk::concurrent::skiplist_options)1>::random_engine();
  uint64_t v10 = 0;
  *(_DWORD *)(a1 + 16) = 83951621;
  *(_OWORD *)a1 = 0u;
  *(void *)(a1 + 24) = 0;
  *(_OWORD *)(a1 + 32) = 0u;
  do
  {
    atomic_store(0, (unint64_t *)(a1 + v10 + 32));
    atomic_store(0, (unint64_t *)(a1 + v10 + 40));
    v10 += 16;
  }
  while (v10 != 80);
  *(void *)(a1 + 152) = 0;
  *(_DWORD *)(a1 + 128) = 16908289;
  *(_OWORD *)(a1 + 112) = xmmword_210885C20;
  *(void *)(a1 + 136) = 0;
  *(void *)(a1 + 144) = 0;
  atomic_store(0, (unint64_t *)(a1 + 144));
  atomic_store(0, (unint64_t *)(a1 + 152));
  for (uint64_t j = 32; j != 112; j += 16)
    atomic_store(v2, (unint64_t *)(a1 + j));
  __dmb(0xBu);
  return a1;
}

void sub_210878170(void *a1)
{
  std::__shared_weak_count::~__shared_weak_count(v2);
  operator delete(v4);
  os_unfair_lock_unlock((os_unfair_lock_t)&caulk::alloc::shared_allocator<caulk::alloc::multi_free_list<caulk::alloc::cascading_allocator<caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::serial_allocator,caulk::alloc::embed_block_memory,16384ul>>,caulk::concurrent::details::node_allocator<unsigned long,caulk::alloc::chunk_allocator<caulk::alloc::page_allocator,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,16ul,6ul>::node_impl<caulk::alloc::tree_allocator<caulk::alloc::chunk_allocator<caulk::alloc::page_allocator,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,16ul,6ul>::node_impl>::node_header,caulk::alloc::embed_block_memory> *,5ul,(caulk::concurrent::skiplist_options)1>::size_generator,8ul,1ul,-1l>>::shared_instance(void)::global);
  uint64_t v5 = *(std::__shared_weak_count **)(v1 + 184);
  if (v5) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v5);
  }
  __clang_call_terminate(a1);
}

void *caulk::inplace_function_detail::vtable<void>::vtable<caulk::alloc::tree_allocator<caulk::alloc::chunk_allocator<caulk::alloc::page_allocator,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,16ul,6ul>>::tree_allocator(void)::{lambda(void)#1}>(caulk::inplace_function_detail::wrapper<caulk::alloc::tree_allocator<caulk::alloc::chunk_allocator<caulk::alloc::page_allocator,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,16ul,6ul>>::tree_allocator(void)::{lambda(void)#1}>)::{lambda(void *,void *)#2}::__invoke(void *result, void *a2)
{
  *uint64_t result = *a2;
  return result;
}

void *caulk::inplace_function_detail::vtable<void>::vtable<caulk::alloc::tree_allocator<caulk::alloc::chunk_allocator<caulk::alloc::page_allocator,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,16ul,6ul>>::tree_allocator(void)::{lambda(void)#1}>(caulk::inplace_function_detail::wrapper<caulk::alloc::tree_allocator<caulk::alloc::chunk_allocator<caulk::alloc::page_allocator,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,16ul,6ul>>::tree_allocator(void)::{lambda(void)#1}>)::{lambda(void *,void *)#1}::__invoke(void *result, void *a2)
{
  *uint64_t result = *a2;
  return result;
}

unint64_t caulk::inplace_function_detail::vtable<void>::vtable<caulk::alloc::tree_allocator<caulk::alloc::chunk_allocator<caulk::alloc::page_allocator,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,16ul,6ul>>::tree_allocator(void)::{lambda(void)#1}>(caulk::inplace_function_detail::wrapper<caulk::alloc::tree_allocator<caulk::alloc::chunk_allocator<caulk::alloc::page_allocator,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,16ul,6ul>>::tree_allocator(void)::{lambda(void)#1}>)::{lambda(void *)#1}::__invoke(void *a1)
{
  return caulk::concurrent::details::node_allocator<unsigned long,caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,256ul,6ul>::node_impl<caulk::alloc::tree_allocator<caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,256ul,6ul>>::node_header,caulk::alloc::embed_block_memory> *,5ul,(caulk::concurrent::skiplist_options)1>::perform_deferred_deletions<true,(BOOL *)0>(*a1 + 480);
}

void caulk::inplace_function_detail::vtable<void,caulk::concurrent::details::skiplist_node<unsigned long,caulk::alloc::chunk_allocator<caulk::alloc::page_allocator,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,16ul,6ul>::node_impl<caulk::alloc::tree_allocator<caulk::alloc::chunk_allocator<caulk::alloc::page_allocator,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,16ul,6ul>>::node_header,caulk::alloc::embed_block_memory> *>::layout_kv const&>::vtable(void)::{lambda(void *,caulk::concurrent::details::skiplist_node<unsigned long,caulk::alloc::chunk_allocator<caulk::alloc::page_allocator,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,16ul,6ul>::node_impl<caulk::alloc::tree_allocator<caulk::alloc::chunk_allocator<caulk::alloc::page_allocator,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,16ul,6ul>>::node_header,caulk::alloc::embed_block_memory> *>::layout_kv const&)#1}::__invoke()
{
  exception = __cxa_allocate_exception(8uLL);
}

void *_ZZN5caulk23inplace_function_detail6vtableIvJRKNS_10concurrent7details13skiplist_nodeImPNS_5alloc15chunk_allocatorINS5_14page_allocatorENS5_16bitmap_allocatorENS5_18embed_block_memoryELm16384EJLm16ELm6EEE9node_implINS5_14tree_allocatorISA_E11node_headerES9_EEE9layout_kvEEEC1IZNSD_C1EvEUlRKT_E_EENS0_7wrapperISN_EEENUlPvST_E0_8__invokeEST_ST_(void *result, void *a2)
{
  *uint64_t result = *a2;
  return result;
}

void *_ZZN5caulk23inplace_function_detail6vtableIvJRKNS_10concurrent7details13skiplist_nodeImPNS_5alloc15chunk_allocatorINS5_14page_allocatorENS5_16bitmap_allocatorENS5_18embed_block_memoryELm16384EJLm16ELm6EEE9node_implINS5_14tree_allocatorISA_E11node_headerES9_EEE9layout_kvEEEC1IZNSD_C1EvEUlRKT_E_EENS0_7wrapperISN_EEENUlPvST_E_8__invokeEST_ST_(void *result, void *a2)
{
  *uint64_t result = *a2;
  return result;
}

void _ZZN5caulk23inplace_function_detail6vtableIvJRKNS_10concurrent7details13skiplist_nodeImPNS_5alloc15chunk_allocatorINS5_14page_allocatorENS5_16bitmap_allocatorENS5_18embed_block_memoryELm16384EJLm16ELm6EEE9node_implINS5_14tree_allocatorISA_E11node_headerES9_EEE9layout_kvEEEC1IZNSD_C1EvEUlRKT_E_EENS0_7wrapperISN_EEENUlPvSK_E_8__invokeEST_SK_(uint64_t a1, uint64_t a2)
{
}

void std::__shared_ptr_emplace<caulk::alloc::multi_free_list<caulk::alloc::cascading_allocator<caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::serial_allocator,caulk::alloc::embed_block_memory,16384ul>>,caulk::concurrent::details::node_allocator<unsigned long,caulk::alloc::chunk_allocator<caulk::alloc::page_allocator,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,16ul,6ul>::node_impl<caulk::alloc::tree_allocator<caulk::alloc::chunk_allocator<caulk::alloc::page_allocator,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,16ul,6ul>::node_impl>::node_header,caulk::alloc::embed_block_memory> *,5ul,(caulk::concurrent::skiplist_options)1>::size_generator,8ul,1ul,-1l>>::__on_zero_shared(uint64_t a1)
{
  uint64_t v1 = 0;
  uint64_t v2 = a1 + 32;
  uint64_t v3 = a1 + 96;
  do
  {
    for (uint64_t i = *(void *)&caulk::concurrent::details::node_allocator<unsigned long,caulk::alloc::chunk_allocator<caulk::alloc::page_allocator,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,16ul,6ul>::node_impl<caulk::alloc::tree_allocator<caulk::alloc::chunk_allocator<caulk::alloc::page_allocator,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,16ul,6ul>>::node_header,caulk::alloc::embed_block_memory> *,5ul,(caulk::concurrent::skiplist_options)1>::node_sizes[8 * v1];
          ;
          caulk::alloc::cascading_allocator<caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::serial_allocator,caulk::alloc::embed_block_memory,16384ul>>::deallocate(v2, (unint64_t)v5, i))
    {
      uint64_t v5 = caulk::concurrent::stack<caulk::alloc::free_block,caulk::concurrent::intrusive_single_link_node<caulk::alloc::free_block>>::pop();
      if (!v5) {
        break;
      }
      atomic_fetch_add((atomic_ullong *volatile)(v3 + 32 * v1 + 16), 0xFFFFFFFFFFFFFFFFLL);
    }
    ++v1;
  }
  while (v1 != 5);
  caulk::alloc::cascading_allocator<caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::serial_allocator,caulk::alloc::embed_block_memory,16384ul>>::self_deallocate_all(v2);
}

void std::__shared_ptr_emplace<caulk::alloc::multi_free_list<caulk::alloc::cascading_allocator<caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::serial_allocator,caulk::alloc::embed_block_memory,16384ul>>,caulk::concurrent::details::node_allocator<unsigned long,caulk::alloc::chunk_allocator<caulk::alloc::page_allocator,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,16ul,6ul>::node_impl<caulk::alloc::tree_allocator<caulk::alloc::chunk_allocator<caulk::alloc::page_allocator,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,16ul,6ul>::node_impl>::node_header,caulk::alloc::embed_block_memory> *,5ul,(caulk::concurrent::skiplist_options)1>::size_generator,8ul,1ul,-1l>>::~__shared_ptr_emplace(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)&unk_26C2AAF38;
  std::__shared_weak_count::~__shared_weak_count(a1);

  JUMPOUT(0x216674B00);
}

void std::__shared_ptr_emplace<caulk::alloc::multi_free_list<caulk::alloc::cascading_allocator<caulk::alloc::chunk_allocator<caulk::alloc::global_page_cache,caulk::alloc::serial_allocator,caulk::alloc::embed_block_memory,16384ul>>,caulk::concurrent::details::node_allocator<unsigned long,caulk::alloc::chunk_allocator<caulk::alloc::page_allocator,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,16ul,6ul>::node_impl<caulk::alloc::tree_allocator<caulk::alloc::chunk_allocator<caulk::alloc::page_allocator,caulk::alloc::bitmap_allocator,caulk::alloc::embed_block_memory,16384ul,16ul,6ul>::node_impl>::node_header,caulk::alloc::embed_block_memory> *,5ul,(caulk::concurrent::skiplist_options)1>::size_generator,8ul,1ul,-1l>>::~__shared_ptr_emplace(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&unk_26C2AAF38;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void caulk::alloc::exported_resource<caulk::alloc::darwin_resource<caulk::alloc::audio_allocator,caulk::alloc::memory_resource>,caulk::alloc::memory_resource,caulk::memory_resource>::~exported_resource(std::pmr::memory_resource *a1)
{
  *(void *)a1 = &unk_26C2AA3D0;
  uint64_t v2 = (uint64_t)a1 + 16;
  *((void *)a1 + 2) = &unk_26C2AA2B8;
  uint64_t v3 = *((void *)a1 + 176);
  *((void *)a1 + 176) = 0;
  if (v3) {
    std::default_delete<caulk::alloc::darwin_resource<caulk::alloc::audio_allocator,caulk::alloc::memory_resource>::zone_plus>::operator()[abi:ne180100](v3);
  }
  caulk::alloc::resource<caulk::alloc::audio_allocator,caulk::alloc::memory_resource>::~resource(v2);
  std::pmr::memory_resource::~memory_resource(a1);

  JUMPOUT(0x216674B00);
}

{
  uint64_t v2;
  uint64_t v3;
  uint64_t vars8;

  *(void *)a1 = &unk_26C2AA3D0;
  uint64_t v2 = (uint64_t)a1 + 16;
  *((void *)a1 + 2) = &unk_26C2AA2B8;
  uint64_t v3 = *((void *)a1 + 176);
  *((void *)a1 + 176) = 0;
  if (v3) {
    std::default_delete<caulk::alloc::darwin_resource<caulk::alloc::audio_allocator,caulk::alloc::memory_resource>::zone_plus>::operator()[abi:ne180100](v3);
  }
  caulk::alloc::resource<caulk::alloc::audio_allocator,caulk::alloc::memory_resource>::~resource(v2);

  std::pmr::memory_resource::~memory_resource(a1);
}

void caulk::alloc::resource<caulk::alloc::zeroing_allocator<caulk::alloc::malloc_zone_allocator>,caulk::alloc::memory_resource>::reserve(void *a1@<X8>)
{
  *a1 = 0;
  a1[1] = 0;
}

uint64_t caulk::alloc::resource<caulk::alloc::zeroing_allocator<caulk::alloc::malloc_zone_allocator>,caulk::alloc::memory_resource>::compact()
{
  return 0;
}

void *caulk::alloc::resource<caulk::alloc::zeroing_allocator<caulk::alloc::malloc_zone_allocator>,caulk::alloc::memory_resource>::print(uint64_t a1, uint64_t a2, int a3)
{
  void v10[4] = *MEMORY[0x263EF8340];
  uint64_t v7 = a2;
  int v8 = 0;
  char v9 = 0;
  caulk::alloc::base_allocator::formatter::emit_string(&v7, "[zeroing] ");
  uint64_t result = caulk::alloc::malloc_zone_allocator::describe((malloc_zone_t **)(a1 + 8), (caulk::alloc::base_allocator::formatter *)&v7);
  if (a3)
  {
    v10[0] = &unk_26C2AA980;
    v10[1] = a2;
    v10[3] = v10;
    return std::__function::__value_func<void ()(caulk::alloc::region_usage,caulk::alloc::block)>::~__value_func[abi:ne180100](v10);
  }
  return result;
}

void *std::__function::__func<void caulk::alloc::print_allocator<caulk::alloc::resource<caulk::alloc::zeroing_allocator<caulk::alloc::malloc_zone_allocator>,caulk::alloc::memory_resource>>(caulk::alloc::resource<caulk::alloc::zeroing_allocator<caulk::alloc::malloc_zone_allocator>,caulk::alloc::memory_resource> &,std::ostream &,BOOL)::{lambda(caulk::alloc::region_usage,caulk::alloc::block)#1},std::allocator<void caulk::alloc::print_allocator<caulk::alloc::resource<caulk::alloc::zeroing_allocator<caulk::alloc::malloc_zone_allocator>,caulk::alloc::memory_resource>>(caulk::alloc::resource<caulk::alloc::zeroing_allocator<caulk::alloc::malloc_zone_allocator>,caulk::alloc::memory_resource> &,std::ostream &,BOOL)::{lambda(caulk::alloc::region_usage,caulk::alloc::block)#1}>,void ()(caulk::alloc::region_usage,caulk::alloc::block)>::target_type()
{
}

uint64_t std::__function::__func<void caulk::alloc::print_allocator<caulk::alloc::resource<caulk::alloc::zeroing_allocator<caulk::alloc::malloc_zone_allocator>,caulk::alloc::memory_resource>>(caulk::alloc::resource<caulk::alloc::zeroing_allocator<caulk::alloc::malloc_zone_allocator>,caulk::alloc::memory_resource> &,std::ostream &,BOOL)::{lambda(caulk::alloc::region_usage,caulk::alloc::block)#1},std::allocator<void caulk::alloc::print_allocator<caulk::alloc::resource<caulk::alloc::zeroing_allocator<caulk::alloc::malloc_zone_allocator>,caulk::alloc::memory_resource>>(caulk::alloc::resource<caulk::alloc::zeroing_allocator<caulk::alloc::malloc_zone_allocator>,caulk::alloc::memory_resource> &,std::ostream &,BOOL)::{lambda(caulk::alloc::region_usage,caulk::alloc::block)#1}>,void ()(caulk::alloc::region_usage,caulk::alloc::block)>::target(uint64_t a1, uint64_t a2)
{
  if (std::type_info::operator==[abi:ne180100](*(void *)(a2 + 8), (uint64_t)"ZN5caulk5alloc15print_allocatorINS0_8resourceINS0_17zeroing_allocatorINS0_21malloc_zone_allocatorEEENS0_15memory_resourceEEEEEvRT_RNSt3__113basic_ostreamIcNSA_11char_traitsIcEEEEbEUlNS0_12region_usageENS0_5blockEE_"))
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

uint64_t std::__function::__func<void caulk::alloc::print_allocator<caulk::alloc::resource<caulk::alloc::zeroing_allocator<caulk::alloc::malloc_zone_allocator>,caulk::alloc::memory_resource>>(caulk::alloc::resource<caulk::alloc::zeroing_allocator<caulk::alloc::malloc_zone_allocator>,caulk::alloc::memory_resource> &,std::ostream &,BOOL)::{lambda(caulk::alloc::region_usage,caulk::alloc::block)#1},std::allocator<void caulk::alloc::print_allocator<caulk::alloc::resource<caulk::alloc::zeroing_allocator<caulk::alloc::malloc_zone_allocator>,caulk::alloc::memory_resource>>(caulk::alloc::resource<caulk::alloc::zeroing_allocator<caulk::alloc::malloc_zone_allocator>,caulk::alloc::memory_resource> &,std::ostream &,BOOL)::{lambda(caulk::alloc::region_usage,caulk::alloc::block)#1}>,void ()(caulk::alloc::region_usage,caulk::alloc::block)>::operator()(uint64_t a1, int *a2)
{
  return caulk::alloc::describe_block(*(void *)(a1 + 8), *a2);
}

uint64_t std::__function::__func<void caulk::alloc::print_allocator<caulk::alloc::resource<caulk::alloc::zeroing_allocator<caulk::alloc::malloc_zone_allocator>,caulk::alloc::memory_resource>>(caulk::alloc::resource<caulk::alloc::zeroing_allocator<caulk::alloc::malloc_zone_allocator>,caulk::alloc::memory_resource> &,std::ostream &,BOOL)::{lambda(caulk::alloc::region_usage,caulk::alloc::block)#1},std::allocator<void caulk::alloc::print_allocator<caulk::alloc::resource<caulk::alloc::zeroing_allocator<caulk::alloc::malloc_zone_allocator>,caulk::alloc::memory_resource>>(caulk::alloc::resource<caulk::alloc::zeroing_allocator<caulk::alloc::malloc_zone_allocator>,caulk::alloc::memory_resource> &,std::ostream &,BOOL)::{lambda(caulk::alloc::region_usage,caulk::alloc::block)#1}>,void ()(caulk::alloc::region_usage,caulk::alloc::block)>::__clone(uint64_t result, void *a2)
{
  uint64_t v2 = *(void *)(result + 8);
  *a2 = &unk_26C2AA980;
  a2[1] = v2;
  return result;
}

void *std::__function::__func<void caulk::alloc::print_allocator<caulk::alloc::resource<caulk::alloc::zeroing_allocator<caulk::alloc::malloc_zone_allocator>,caulk::alloc::memory_resource>>(caulk::alloc::resource<caulk::alloc::zeroing_allocator<caulk::alloc::malloc_zone_allocator>,caulk::alloc::memory_resource> &,std::ostream &,BOOL)::{lambda(caulk::alloc::region_usage,caulk::alloc::block)#1},std::allocator<void caulk::alloc::print_allocator<caulk::alloc::resource<caulk::alloc::zeroing_allocator<caulk::alloc::malloc_zone_allocator>,caulk::alloc::memory_resource>>(caulk::alloc::resource<caulk::alloc::zeroing_allocator<caulk::alloc::malloc_zone_allocator>,caulk::alloc::memory_resource> &,std::ostream &,BOOL)::{lambda(caulk::alloc::region_usage,caulk::alloc::block)#1}>,void ()(caulk::alloc::region_usage,caulk::alloc::block)>::__clone(uint64_t a1)
{
  uint64_t result = operator new(0x10uLL);
  uint64_t v3 = *(void *)(a1 + 8);
  *uint64_t result = &unk_26C2AA980;
  result[1] = v3;
  return result;
}

void std::__function::__func<void caulk::alloc::print_allocator<caulk::alloc::resource<caulk::alloc::zeroing_allocator<caulk::alloc::malloc_zone_allocator>,caulk::alloc::memory_resource>>(caulk::alloc::resource<caulk::alloc::zeroing_allocator<caulk::alloc::malloc_zone_allocator>,caulk::alloc::memory_resource> &,std::ostream &,BOOL)::{lambda(caulk::alloc::region_usage,caulk::alloc::block)#1},std::allocator<void caulk::alloc::print_allocator<caulk::alloc::resource<caulk::alloc::zeroing_allocator<caulk::alloc::malloc_zone_allocator>,caulk::alloc::memory_resource>>(caulk::alloc::resource<caulk::alloc::zeroing_allocator<caulk::alloc::malloc_zone_allocator>,caulk::alloc::memory_resource> &,std::ostream &,BOOL)::{lambda(caulk::alloc::region_usage,caulk::alloc::block)#1}>,void ()(caulk::alloc::region_usage,caulk::alloc::block)>::~__func()
{
}

BOOL caulk::alloc::resource<caulk::alloc::zeroing_allocator<caulk::alloc::malloc_zone_allocator>,caulk::alloc::memory_resource>::do_is_equal(uint64_t a1, uint64_t a2)
{
  return a1 == a2;
}

void caulk::alloc::resource<caulk::alloc::zeroing_allocator<caulk::alloc::malloc_zone_allocator>,caulk::alloc::memory_resource>::do_deallocate(uint64_t a1, void *a2)
{
}

void caulk::alloc::resource<caulk::alloc::zeroing_allocator<caulk::alloc::malloc_zone_allocator>,caulk::alloc::memory_resource>::do_allocate(uint64_t a1, size_t a2, size_t a3)
{
  uint64_t v3 = caulk::alloc::malloc_zone_allocator::allocate((malloc_zone_t **)(a1 + 8), a2, a3);
  if (!v3)
  {
    exception = (std::bad_alloc *)__cxa_allocate_exception(8uLL);
    size_t v6 = std::bad_alloc::bad_alloc(exception);
    __cxa_throw(v6, MEMORY[0x263F8C218], MEMORY[0x263F8C170]);
  }

  bzero(v3, v4);
}

void caulk::alloc::resource<caulk::alloc::zeroing_allocator<caulk::alloc::malloc_zone_allocator>,caulk::alloc::memory_resource>::~resource(uint64_t a1)
{
  caulk::alloc::malloc_zone_allocator::~malloc_zone_allocator((malloc_zone_t **)(a1 + 8));

  JUMPOUT(0x216674B00);
}

uint64_t caulk::alloc::resource<caulk::alloc::zeroing_allocator<caulk::alloc::malloc_zone_allocator>,caulk::alloc::memory_resource>::~resource(uint64_t a1)
{
  return a1;
}

void caulk::alloc::exported_resource<caulk::alloc::resource<caulk::alloc::zeroing_allocator<caulk::alloc::malloc_zone_allocator>,caulk::alloc::memory_resource>,caulk::alloc::memory_resource,caulk::memory_resource>::do_deallocate(uint64_t a1, void *a2)
{
}

void *caulk::alloc::exported_resource<caulk::alloc::resource<caulk::alloc::zeroing_allocator<caulk::alloc::malloc_zone_allocator>,caulk::alloc::memory_resource>,caulk::alloc::memory_resource,caulk::memory_resource>::do_allocate(uint64_t a1, size_t a2, size_t a3)
{
  uint64_t v3 = caulk::alloc::malloc_zone_allocator::allocate((malloc_zone_t **)(a1 + 24), a2, a3);
  uint64_t v5 = v3;
  if (v3) {
    bzero(v3, v4);
  }
  return v5;
}

void caulk::alloc::exported_resource<caulk::alloc::resource<caulk::alloc::zeroing_allocator<caulk::alloc::malloc_zone_allocator>,caulk::alloc::memory_resource>,caulk::alloc::memory_resource,caulk::memory_resource>::~exported_resource(malloc_zone_t **a1)
{
  *a1 = (malloc_zone_t *)&unk_26C2AA408;
  caulk::alloc::malloc_zone_allocator::~malloc_zone_allocator(a1 + 3);
  std::pmr::memory_resource::~memory_resource((std::pmr::memory_resource *)a1);

  JUMPOUT(0x216674B00);
}

{
  uint64_t vars8;

  *a1 = (malloc_zone_t *)&unk_26C2AA408;
  caulk::alloc::malloc_zone_allocator::~malloc_zone_allocator(a1 + 3);

  std::pmr::memory_resource::~memory_resource((std::pmr::memory_resource *)a1);
}

caulk::autorelease_pool *caulk::autorelease_pool::autorelease_pool(caulk::autorelease_pool *this)
{
  *(void *)this = objc_alloc_init(MEMORY[0x263F086B0]);
  return this;
}

{
  *(void *)this = objc_alloc_init(MEMORY[0x263F086B0]);
  return this;
}

void caulk::autorelease_pool::~autorelease_pool(id *this)
{
}

{
}

uint64_t caulk::semaphore::signal(uint64_t this)
{
  if ((atomic_fetch_add_explicit((atomic_uint *volatile)(this + 8), 1u, memory_order_release) & 0x80000000) != 0) {
    JUMPOUT(0x2166752E0);
  }
  return this;
}

void caulk::bad_expected_access<int>::~bad_expected_access(std::exception *a1)
{
  std::exception::~exception(a1);

  JUMPOUT(0x216674B00);
}

void caulk::mach::os_workgroup::~os_workgroup(caulk::mach::details **this, void *a2)
{
  *this = (caulk::mach::details *)&unk_26C2AB7A0;
  caulk::mach::details::release_os_object(this[1], a2);

  JUMPOUT(0x216674B00);
}

{
  *this = (caulk::mach::details *)&unk_26C2AB7A0;
  caulk::mach::details::release_os_object(this[1], a2);
}

{
  *this = (caulk::mach::details *)&unk_26C2AB7A0;
  caulk::mach::details::release_os_object(this[1], a2);
}

void caulk::mach::os_workgroup_interval::~os_workgroup_interval(caulk::mach::details **this, void *a2)
{
  *this = (caulk::mach::details *)&unk_26C2AB7A0;
  caulk::mach::details::release_os_object(this[1], a2);

  JUMPOUT(0x216674B00);
}

{
  *this = (caulk::mach::details *)&unk_26C2AB7A0;
  caulk::mach::details::release_os_object(this[1], a2);
}

{
  *this = (caulk::mach::details *)&unk_26C2AB7A0;
  caulk::mach::details::release_os_object(this[1], a2);
}

void caulk::mach::os_workgroup::make(void *a1@<X8>)
{
  os_workgroup_attr_set_flags();
  uint64_t v2 = (void *)os_workgroup_create();
  size_t v4 = caulk::mach::details::retain_os_object(v2, v3);
  *a1 = &unk_26C2AB7A0;
  a1[1] = v4;
  caulk::mach::details::release_os_object((caulk::mach::details *)v2, v5);
}

void sub_210878CDC(_Unwind_Exception *a1, int a2)
{
  if (!a2) {
    _Unwind_Resume(a1);
  }
  __clang_call_terminate(a1);
}

os_workgroup_t caulk::mach::os_workgroup::make@<X0>(const char *a1@<X0>, mach_port_t a2@<W1>, void *a3@<X8>)
{
  if (a1[23] < 0) {
    a1 = *(const char **)a1;
  }
  os_workgroup_t result = os_workgroup_create_with_port(a1, a2);
  *a3 = &unk_26C2AB7A0;
  a3[1] = result;
  return result;
}

uint64_t caulk::mach::os_workgroup::make_with_workload_id@<X0>(void *a1@<X8>)
{
  uint64_t result = os_workgroup_create_with_workload_id_and_port();
  *a1 = &unk_26C2AB7A0;
  a1[1] = result;
  return result;
}

OS_os_workgroup *caulk::mach::os_workgroup::copy_mach_port(caulk::mach::os_workgroup *this)
{
  uint64_t result = (OS_os_workgroup *)*((void *)this + 1);
  if (result)
  {
    mach_port_t mach_port_out = 0;
    if (os_workgroup_copy_port(result, &mach_port_out)) {
      return 0;
    }
    else {
      return (OS_os_workgroup *)mach_port_out;
    }
  }
  return result;
}

uint64_t caulk::mach::os_workgroup::join(caulk::mach::os_workgroup *this, os_workgroup_join_token_opaque_s *a2)
{
  if (*((void *)this + 1)) {
    return os_workgroup_join_self();
  }
  else {
    return 2;
  }
}

uint64_t caulk::mach::os_workgroup_interval::make@<X0>(void *a1@<X8>)
{
  uint64_t result = os_workgroup_attr_set_interval_type();
  if (result)
  {
    a1[1] = 0;
  }
  else
  {
    uint64_t result = os_workgroup_interval_create();
    a1[1] = result;
  }
  *a1 = &unk_26C2AB828;
  return result;
}

void sub_210878F38(_Unwind_Exception *a1, int a2)
{
  if (!a2) {
    _Unwind_Resume(a1);
  }
  __clang_call_terminate(a1);
}

uint64_t caulk::mach::os_workgroup_interval::make_with_workload_id@<X0>(void *a1@<X8>)
{
  uint64_t result = os_workgroup_attr_set_interval_type();
  if (result)
  {
    a1[1] = 0;
  }
  else
  {
    uint64_t result = os_workgroup_interval_create_with_workload_id();
    a1[1] = result;
  }
  *a1 = &unk_26C2AB828;
  return result;
}

void sub_210879044(_Unwind_Exception *a1, int a2)
{
  if (!a2) {
    _Unwind_Resume(a1);
  }
  __clang_call_terminate(a1);
}

double caulk::mach::os_workgroup_managed::make_with_workload_id@<D0>(uint64_t a1@<X8>)
{
  uint64_t v2 = os_workgroup_create_with_workload_id_and_port();
  *(void *)a1 = &unk_26C2AB808;
  *(void *)(a1 + 8) = v2;
  double result = 0.0;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_OWORD *)(a1 + 32) = 0u;
  *(_OWORD *)(a1 + 41) = 0u;
  return result;
}

double caulk::mach::os_workgroup_interval_managed::make@<D0>(uint64_t a1@<X8>)
{
  if (os_workgroup_attr_set_interval_type())
  {
    *(void *)(a1 + 56) = 0;
    double result = 0.0;
    *(_OWORD *)(a1 + 40) = 0u;
    *(_OWORD *)(a1 + 24) = 0u;
    *(_OWORD *)(a1 + 8) = 0u;
    *(void *)a1 = &unk_26C2AB848;
  }
  else
  {
    uint64_t v3 = os_workgroup_interval_create();
    double result = 0.0;
    *(_OWORD *)(a1 + 16) = 0u;
    *(_OWORD *)(a1 + 32) = 0u;
    *(_OWORD *)(a1 + 41) = 0u;
    *(void *)a1 = &unk_26C2AB848;
    *(void *)(a1 + 8) = v3;
    *(unsigned char *)(a1 + 57) = 0;
  }
  return result;
}

void sub_210879250(_Unwind_Exception *a1, int a2)
{
  if (!a2) {
    _Unwind_Resume(a1);
  }
  __clang_call_terminate(a1);
}

uint64_t caulk::mach::os_workgroup_interval_managed::start(caulk::mach::os_workgroup_interval_managed *this, uint64_t a2, uint64_t a3)
{
  return caulk::mach::os_workgroup_interval_managed::start(this, a2, a3, 0);
}

uint64_t caulk::mach::os_workgroup_interval_managed::update_deadline(os_workgroup_interval_t *this, uint64_t a2, os_workgroup_interval_data_opaque_s *a3)
{
  if (*((unsigned char *)this + 56) && *((unsigned char *)this + 57)) {
    return os_workgroup_interval_update(this[1], a2, a3);
  }
  else {
    return 1;
  }
}

uint64_t caulk::mach::os_workgroup_interval_managed::update_deadline(os_workgroup_interval_t *this, uint64_t a2)
{
  return caulk::mach::os_workgroup_interval_managed::update_deadline(this, a2, 0);
}

uint64_t caulk::mach::os_workgroup_interval_managed::finish(caulk::mach::os_workgroup_interval_managed *this)
{
  return caulk::mach::os_workgroup_interval_managed::finish(this, 0);
}

BOOL caulk::platform::is_virtual_machine(caulk::platform *this)
{
  int v3 = 0;
  size_t v2 = 4;
  if (sysctlbyname("kern.hv_vmm_present", &v3, &v2, 0, 0)) {
    perror("sysctlbyname");
  }
  return v3 != 0;
}

void caulk::shared_semaphore_mutex::~shared_semaphore_mutex(caulk::shared_semaphore_mutex *this)
{
  uint64_t v1 = *(void *)this;
  if ((*(void *)this & 0x1FFFFFLL) != 0)
  {
    _os_assert_log();
    _os_crash();
    __break(1u);
    goto LABEL_7;
  }
  if ((v1 & 0x3FFFFE00000) != 0)
  {
LABEL_7:
    _os_assert_log();
    _os_crash();
    __break(1u);
    goto LABEL_8;
  }
  if ((v1 & 0x7FFFFC0000000000) != 0)
  {
LABEL_8:
    _os_assert_log();
    _os_crash();
    __break(1u);
    goto LABEL_9;
  }
  if ((v1 & 0x8000000000000000) == 0)
  {
    caulk::semaphore::~semaphore((caulk::shared_semaphore_mutex *)((char *)this + 24));
    caulk::semaphore::~semaphore((caulk::shared_semaphore_mutex *)((char *)this + 8));
    return;
  }
LABEL_9:
  _os_assert_log();
  _os_crash();
  __break(1u);
}

uint64_t caulk::shared_semaphore_mutex::_lock_shared(atomic_ullong *this, char a2)
{
  unint64_t explicit = *this;
  uint64_t v5 = (atomic_uint *)(this + 1);
  while ((explicit & 0x8000000000000000) != 0)
  {
    if (a2) {
      return (explicit & 0x8000000000000000) == 0;
    }
    if ((((explicit >> 21) + 1) & 0x1FFFFF) == 0x1FFFFFLL) {
      goto LABEL_13;
    }
    unint64_t v8 = explicit;
    atomic_compare_exchange_strong(this, &v8, explicit & 0xFFFFFC00001FFFFFLL | ((((explicit >> 21) + 1) & 0x1FFFFFLL) << 21));
    if (v8 == explicit)
    {
      caulk::semaphore::timed_wait(v5, -1.0);
      unint64_t explicit = atomic_load_explicit(this, memory_order_acquire);
    }
    else
    {
LABEL_10:
      unint64_t explicit = v8;
    }
  }
  uint64_t v6 = (explicit + 1) & 0x1FFFFF;
  if (v6 != 0x1FFFFF)
  {
    unint64_t v7 = v6 | explicit & 0xFFFFFFFFFFE00000;
    unint64_t v8 = explicit;
    atomic_compare_exchange_strong(this, &v8, v7);
    if (v8 == explicit)
    {
      __dmb(9u);
      return (explicit & 0x8000000000000000) == 0;
    }
    goto LABEL_10;
  }
  _os_assert_log();
  _os_crash();
  __break(1u);
LABEL_13:
  _os_assert_log();
  uint64_t result = _os_crash();
  __break(1u);
  return result;
}

uint64_t caulk::shared_semaphore_mutex::lock_shared(atomic_ullong *this)
{
  return caulk::shared_semaphore_mutex::_lock_shared(this, 0);
}

uint64_t caulk::shared_semaphore_mutex::try_lock_shared(atomic_ullong *this)
{
  return caulk::shared_semaphore_mutex::_lock_shared(this, 1);
}

uint64_t caulk::shared_semaphore_mutex::unlock_shared(uint64_t this)
{
  __dmb(0xBu);
  atomic_ullong v1 = *(void *)this;
  uint64_t v2 = *(void *)this & 0x1FFFFFLL;
  if ((*(_DWORD *)this & 0x1FFFFF) != 0)
  {
    atomic_ullong v3 = *(void *)this;
    while (1)
    {
      BOOL v4 = (v1 & 0x7FFFFC0000000000) != 0 && v2 == 1;
      BOOL v5 = !v4;
      unint64_t v6 = v4
         ? v1 & 0x800003FFFFE00000 | ((int)v1 - 1) & 0x1FFFFFLL | ((((unint64_t)(v1 + 0x7FFFFC0000000000) >> 42) & 0x1FFFFF) << 42)
         : v1 & 0xFFFFFFFFFFE00000 | (v1 - 1) & 0x1FFFFF;
      atomic_compare_exchange_strong((atomic_ullong *volatile)this, (unint64_t *)&v3, v6);
      if (v3 == v1) {
        break;
      }
      atomic_ullong v1 = v3;
      LODWORD(v2) = v3 & 0x1FFFFF;
      if ((v3 & 0x1FFFFF) == 0) {
        goto LABEL_14;
      }
    }
  }
  else
  {
LABEL_14:
    _os_assert_log();
    this = _os_crash();
    __break(1u);
  }
  if (!v5
    && (atomic_fetch_add_explicit((atomic_uint *volatile)(this + 32), 1u, memory_order_release) & 0x80000000) != 0)
  {
    JUMPOUT(0x2166752E0);
  }
  return this;
}

uint64_t caulk::shared_semaphore_mutex::lock(uint64_t this)
{
  atomic_ullong v1 = (atomic_ullong *)this;
  unint64_t explicit = *(void *)this;
  atomic_ullong v3 = (atomic_uint *)(this + 24);
  while (1)
  {
    while ((explicit & 0x80000000001FFFFFLL) == 0)
    {
      unint64_t v4 = explicit;
      atomic_compare_exchange_strong(v1, &v4, explicit | 0x8000000000000000);
      if (v4 == explicit)
      {
        __dmb(9u);
        return this;
      }
LABEL_7:
      unint64_t explicit = v4;
    }
    if ((((explicit >> 42) + 1) & 0x1FFFFF) == 0x1FFFFF) {
      break;
    }
    unint64_t v4 = explicit;
    atomic_compare_exchange_strong(v1, &v4, explicit & 0x800003FFFFFFFFFFLL | ((((explicit >> 42) + 1) & 0x1FFFFFLL) << 42));
    if (v4 != explicit) {
      goto LABEL_7;
    }
    this = caulk::semaphore::timed_wait(v3, -1.0);
    unint64_t explicit = atomic_load_explicit(v1, memory_order_acquire);
  }
  _os_assert_log();
  this = _os_crash();
  __break(1u);
  return this;
}

uint64_t caulk::shared_semaphore_mutex::try_lock(atomic_ullong *this)
{
  atomic_ullong v1 = *this;
  if ((*this & 0x80000000001FFFFFLL) != 0) {
    return 0;
  }
  atomic_ullong v2 = *this;
  while (1)
  {
    atomic_compare_exchange_strong(this, (unint64_t *)&v2, v1 | 0x8000000000000000);
    if (v2 == v1) {
      break;
    }
    atomic_ullong v1 = v2;
    if ((v2 & 0x80000000001FFFFFLL) != 0) {
      return 0;
    }
  }
  __dmb(9u);
  return 1;
}

atomic_ullong *caulk::shared_semaphore_mutex::unlock(atomic_ullong *this)
{
  __dmb(0xBu);
  atomic_ullong v1 = *this;
  while (v1 < 0)
  {
    if ((v1 & 0x7FFFFC0000000000) != 0)
    {
      atomic_ullong v2 = v1;
      atomic_compare_exchange_strong(this, (unint64_t *)&v2, (v1 + 0x7FFFFC0000000000) & 0x7FFFFC0000000000 | v1 & 0x3FFFFFFFFFFLL);
      BOOL v3 = v2 == v1;
      atomic_ullong v1 = v2;
      if (v3) {
        goto LABEL_11;
      }
    }
    else
    {
      unint64_t v4 = v1 & 0x7FFFFFFFFFFFFFFFLL;
      uint64_t v5 = v1 & 0x3FFFFE00000;
      if ((v1 & 0x3FFFFE00000) != 0) {
        unint64_t v4 = (v1 + 0x3FFFFE00000) & 0x3FFFFE00000 | v1 & 0x7FFFFC00001FFFFFLL;
      }
      atomic_ullong v6 = v1;
      atomic_compare_exchange_strong(this, (unint64_t *)&v6, v4);
      BOOL v3 = v6 == v1;
      atomic_ullong v1 = v6;
      if (v3)
      {
        if (v5)
        {
          unint64_t v7 = this + 1;
          goto LABEL_14;
        }
        return this;
      }
    }
  }
  _os_assert_log();
  this = (atomic_ullong *)_os_crash();
  __break(1u);
LABEL_11:
  unint64_t v7 = this + 3;
LABEL_14:
  if ((atomic_fetch_add_explicit((atomic_uint *volatile)v7 + 2, 1u, memory_order_release) & 0x80000000) != 0)
  {
    JUMPOUT(0x2166752E0);
  }
  return this;
}

unint64_t caulk::details::semaphore_pool::semaphore_pool(caulk::details::semaphore_pool *this)
{
  for (uint64_t i = 0; i != 8; i += 2)
  {
    atomic_ullong v2 = &caulk::details::semaphore_pool::instance(void)::global[i];
    void *v2 = 0;
    v2[1] = 0;
  }
  uint64_t v3 = 0;
  dword_26AA5D968 = 0;
  do
  {
    this = (caulk::details::semaphore_pool *)caulk::details::semaphore_pool::acquire(this);
    *(_WORD *)&v7[v3] = (_WORD)this;
    v3 += 2;
  }
  while (v3 != 16);
  for (uint64_t j = 0; j != 16; j += 2)
  {
    unsigned __int16 v5 = *(_WORD *)&v7[j];
    unint64_t result = caulk::details::semaphore_pool::sema_ref_to_bank((caulk::details::semaphore_pool *)v5);
    atomic_fetch_and((atomic_ullong *volatile)(result + 1040), ~(1 << (v5 - *(_WORD *)result)));
  }
  return result;
}

uint64_t caulk::details::semaphore_pool::acquire(caulk::details::semaphore_pool *this)
{
  uint64_t v1 = 0;
  int v2 = 1;
  while (1)
  {
    uint64_t v3 = caulk::details::semaphore_pool::instance(void)::global[v1];
    if (!v3)
    {
      os_unfair_lock_lock((os_unfair_lock_t)&dword_26AA5D968);
      uint64_t v3 = caulk::details::semaphore_pool::instance(void)::global[v1];
      if (!v3) {
        operator new();
      }
      os_unfair_lock_unlock((os_unfair_lock_t)&dword_26AA5D968);
    }
    uint64_t v4 = *(void *)(v3 + 1040);
    if (v4 != -1)
    {
      unint64_t v5 = __clz(__rbit64(~v4));
      uint64_t v6 = *(void *)(v3 + 1040);
      while (1)
      {
        unint64_t v7 = 1 << v5;
        atomic_compare_exchange_strong((atomic_ullong *volatile)(v3 + 1040), (unint64_t *)&v6, (1 << v5) | v4);
        if (v6 == v4) {
          break;
        }
        unint64_t v5 = __clz(__rbit64(~v6));
        uint64_t v4 = v6;
        if (v6 == -1) {
          goto LABEL_14;
        }
      }
      unint64_t v8 = atomic_load((unint64_t *)(v3 + 1032));
      if ((v8 & v7) == 0)
      {
        char v9 = (semaphore_t *)(v3 + 16 * v5);
        caulk::mach::semaphore::semaphore(v9 + 1);
        v9[3] = 0;
        void v9[4] = 0;
        atomic_fetch_or((atomic_ullong *volatile)(v3 + 1032), v7);
      }
      if (*(_WORD *)v3 + (_WORD)v5) {
        return (unsigned __int16)(*(_WORD *)v3 + v5);
      }
    }
LABEL_14:
    v2 += 64;
    if (++v1 == 8)
    {
      int v2 = 1;
      std::this_thread::sleep_for[abi:ne180100]<long long,std::ratio<1l,1000l>>(1);
      uint64_t v1 = 0;
    }
  }
}

void sub_2108799B0(_Unwind_Exception *a1)
{
}

unint64_t caulk::details::semaphore_pool::sema_ref_to_bank(caulk::details::semaphore_pool *this)
{
  unint64_t v1 = this - 1;
  if (v1 >= 0x200) {
LABEL_5:
  }
    std::__throw_out_of_range[abi:ne180100]();
  int v2 = &caulk::details::semaphore_pool::instance(void)::global[v1 >> 6];
  if (!atomic_load(v2))
  {
    _os_assert_log();
    _os_crash();
    __break(1u);
    goto LABEL_5;
  }
  return atomic_load(v2);
}

void std::__throw_out_of_range[abi:ne180100]()
{
  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  std::out_of_range::out_of_range[abi:ne180100](exception);
  __cxa_throw(exception, (struct type_info *)off_26413A950, MEMORY[0x263F8C068]);
}

void sub_210879A5C(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

std::logic_error *std::out_of_range::out_of_range[abi:ne180100](std::logic_error *a1)
{
  unint64_t result = std::logic_error::logic_error(a1, "array::at");
  result->__vftable = (std::logic_error_vtbl *)(MEMORY[0x263F8C390] + 16);
  return result;
}

void std::this_thread::sleep_for[abi:ne180100]<long long,std::ratio<1l,1000l>>(uint64_t a1)
{
  if (a1 >= 1)
  {
    uint64_t v7 = v1;
    uint64_t v8 = v2;
    if (a1 == 0x8637BD057A0) {
      int v3 = 0;
    }
    else {
      int v3 = -127;
    }
    if ((unint64_t)a1 > 0x8637BD057A0) {
      int v3 = 1;
    }
    if ((unint64_t)a1 < 0x8637BD057A0) {
      int v3 = -1;
    }
    BOOL v4 = v3 >= 0 || v3 == -127;
    std::chrono::duration<long long, std::ratio<1, 1000000000>>::rep v5 = 1000000 * a1;
    if (v4) {
      std::chrono::duration<long long, std::ratio<1, 1000000000>>::rep v5 = 0x7FFFFFFFFFFFFFFFLL;
    }
    __ns.__rep_ = v5;
    std::this_thread::sleep_for (&__ns);
  }
}

caulk::alloc::malloc_zone_allocator *caulk::alloc::malloc_zone_allocator::malloc_zone_allocator(caulk::alloc::malloc_zone_allocator *this)
{
  *(void *)this = malloc_create_zone(0, 0);
  return this;
}

{
  *(void *)this = malloc_create_zone(0, 0);
  return this;
}

void *caulk::alloc::malloc_zone_allocator::malloc_zone_allocator(void *this, _malloc_zone_t *a2)
{
  *this = a2;
  return this;
}

{
  *this = a2;
  return this;
}

void caulk::alloc::malloc_zone_allocator::~malloc_zone_allocator(malloc_zone_t **this)
{
  *this = 0;
}

void *caulk::alloc::malloc_zone_allocator::allocate(malloc_zone_t **this, size_t size, size_t alignment)
{
  if (alignment <= 0x10) {
    return malloc_type_zone_malloc(*this, size, 0xBCA753B2uLL);
  }
  BOOL v4 = *this;
  if (alignment > 0x1000) {
    return malloc_type_zone_valloc(v4, size, 0x33AAA77DuLL);
  }
  else {
    return malloc_type_zone_memalign(v4, alignment, size, 0x8E3CAEBuLL);
  }
}

void caulk::alloc::malloc_zone_allocator::deallocate(malloc_zone_t **a1, void *a2)
{
}

void *caulk::alloc::malloc_zone_allocator::describe(malloc_zone_t **this, caulk::alloc::base_allocator::formatter *a2)
{
  zone_name = malloc_get_zone_name(*this);
  caulk::alloc::base_allocator::formatter::emit_string(a2, "malloc_zone_allocator @");
  caulk::alloc::base_allocator::formatter::check_line_start(a2);
  std::ostream::operator<<();
  caulk::alloc::base_allocator::formatter::emit_string(a2, ", zone ");
  caulk::alloc::base_allocator::formatter::check_line_start(a2);
  std::ostream::operator<<();
  caulk::alloc::base_allocator::formatter::emit_string(a2, ", \"");
  if (zone_name) {
    BOOL v4 = (char *)zone_name;
  }
  else {
    BOOL v4 = "(null)";
  }
  caulk::alloc::base_allocator::formatter::emit_string(a2, v4);

  return caulk::alloc::base_allocator::formatter::emit_string(a2, "\"\n");
}

void caulk::alloc::details::caching_page_allocator_base::~caching_page_allocator_base(caulk::alloc::details::caching_page_allocator_base *this)
{
  for (uint64_t i = (void *)MEMORY[0x263EF8AF8];
        ;
        caulk::mach::vm_block::dealloc((caulk::mach::vm_block *)v3, (*((void *)this + 2) + *i - 1) & -*i))
  {
    int v3 = caulk::concurrent::stack<caulk::alloc::free_block,caulk::concurrent::intrusive_single_link_node<caulk::alloc::free_block>>::pop();
    if (!v3) {
      break;
    }
    atomic_fetch_add((atomic_ullong *volatile)this + 6, 0xFFFFFFFFFFFFFFFFLL);
  }
  BOOL v4 = (void *)*((void *)this + 12);
  *((void *)this + 12) = 0;
  if (v4)
  {
    std::unique_ptr<caulk::alloc::page_cache_monitor_impl>::reset[abi:ne180100](v4 + 5, 0);
    std::chrono::duration<long long, std::ratio<1, 1000000000>>::rep v5 = (std::__shared_weak_count *)v4[4];
    if (v5) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v5);
    }
    uint64_t v6 = (std::__shared_weak_count *)v4[2];
    if (v6) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v6);
    }
    MEMORY[0x216674B00](v4, 0x20C40A759441BLL);
  }
  std::__function::__value_func<void ()(unsigned long,unsigned long)>::~__value_func[abi:ne180100]((void *)this + 8);
}

void *std::__function::__value_func<void ()(unsigned long,unsigned long)>::~__value_func[abi:ne180100](void *a1)
{
  uint64_t v2 = (void *)a1[3];
  if (v2 == a1)
  {
    (*(void (**)(void *))(*a1 + 32))(a1);
  }
  else if (v2)
  {
    (*(void (**)(void *))(*v2 + 40))(v2);
  }
  return a1;
}

uint64_t *std::unique_ptr<caulk::alloc::page_cache_monitor_impl>::reset[abi:ne180100](uint64_t *result, uint64_t a2)
{
  uint64_t v2 = *result;
  *unint64_t result = a2;
  if (v2)
  {
    if (*(void *)(v2 + 16))
    {
      if (*(unsigned char *)(v2 + 48))
      {
        caulk::semaphore::~semaphore((caulk::semaphore *)(v2 + 32));
        *(unsigned char *)(v2 + 48) = 0;
      }
      caulk::mach::semaphore::semaphore((semaphore_t *)(v2 + 32));
      *(void *)(v2 + 40) = 0;
      *(unsigned char *)(v2 + 48) = 1;
      int v3 = *(std::__shared_weak_count **)(v2 + 24);
      *(void *)(v2 + 16) = 0;
      *(void *)(v2 + 24) = 0;
      if (v3) {
        std::__shared_weak_count::__release_shared[abi:ne180100](v3);
      }
      caulk::semaphore::timed_wait((atomic_uint *)(v2 + 32), -1.0);
      __dmb(9u);
    }
    BOOL v4 = (void **)(v2 + 168);
    std::vector<std::weak_ptr<caulk::alloc::preallocation_reservation>>::__destroy_vector::operator()[abi:ne180100](&v4);
    *(void *)(v2 + 80) = &unk_26C2AB640;
    std::__function::__value_func<void ()(void)>::~__value_func[abi:ne180100]((void *)(v2 + 120));
    caulk::concurrent::message::~message((caulk::concurrent::message *)(v2 + 80));
    caulk::concurrent::messenger::~messenger((atomic_ullong **)(v2 + 64));
    caulk::details::lifetime_guard_base<caulk::alloc::page_cache_monitor>::~lifetime_guard_base(v2 + 8);
    JUMPOUT(0x216674B00);
  }
  return result;
}

void std::vector<std::weak_ptr<caulk::alloc::preallocation_reservation>>::__destroy_vector::operator()[abi:ne180100](void ***a1)
{
  uint64_t v1 = *a1;
  uint64_t v2 = (char *)**a1;
  if (v2)
  {
    BOOL v4 = (char *)v1[1];
    std::chrono::duration<long long, std::ratio<1, 1000000000>>::rep v5 = **a1;
    if (v4 != v2)
    {
      do
      {
        uint64_t v6 = (std::__shared_weak_count *)*((void *)v4 - 1);
        if (v6) {
          std::__shared_weak_count::__release_weak(v6);
        }
        v4 -= 16;
      }
      while (v4 != v2);
      std::chrono::duration<long long, std::ratio<1, 1000000000>>::rep v5 = **a1;
    }
    v1[1] = v2;
    operator delete(v5);
  }
}

uint64_t caulk::details::lifetime_guard_base<caulk::alloc::page_cache_monitor>::~lifetime_guard_base(uint64_t a1)
{
  if (*(void *)(a1 + 8))
  {
    _os_assert_log();
    uint64_t result = _os_crash();
    __break(1u);
  }
  else
  {
    if (*(unsigned char *)(a1 + 40)) {
      caulk::semaphore::~semaphore((caulk::semaphore *)(a1 + 24));
    }
    uint64_t v2 = *(std::__shared_weak_count **)(a1 + 16);
    if (v2) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v2);
    }
    return a1;
  }
  return result;
}

void caulk::concurrent::condition_message::~condition_message(caulk::concurrent::condition_message *this)
{
  *(void *)this = &unk_26C2AB640;
  std::__function::__value_func<void ()(void)>::~__value_func[abi:ne180100]((void *)this + 5);
  caulk::concurrent::message::~message(this);

  JUMPOUT(0x216674B00);
}

{
  uint64_t vars8;

  *(void *)this = &unk_26C2AB640;
  std::__function::__value_func<void ()(void)>::~__value_func[abi:ne180100]((void *)this + 5);

  caulk::concurrent::message::~message(this);
}

uint64_t caulk::alloc::darwin_resource<caulk::alloc::caching_page_allocator<16384ul>,caulk::alloc::memory_resource>::zone_locked()
{
  return 0;
}

double caulk::alloc::darwin_resource<caulk::alloc::caching_page_allocator<16384ul>,caulk::alloc::memory_resource>::zone_statistics(uint64_t a1, _OWORD *a2)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  uint64_t v3 = *(void *)(a1 - 8);
  long long v9 = 0u;
  long long v10 = 0u;
  v11[0] = &unk_26C2AADF8;
  v11[1] = &v9;
  v11[3] = v11;
  v12[0] = &unk_26C2AAB38;
  v12[1] = v11;
  v12[3] = v12;
  int v13 = 7;
  v14[0] = &unk_26C2AB948;
  v14[1] = caulk::alloc::introspector::local_reader;
  uint64_t v15 = v14;
  std::__function::__value_func<void ()(caulk::alloc::region_usage,unsigned long,unsigned long)>::__value_func[abi:ne180100]((uint64_t)v16, (uint64_t)v12);
  char v17 = 1;
  std::__function::__value_func<void ()(caulk::alloc::region_usage,unsigned long,unsigned long)>::~__value_func[abi:ne180100](v12);
  uint64_t v4 = std::function<void * ()(unsigned long,unsigned long)>::operator()((uint64_t)v15, v3, 160);
  caulk::alloc::details::caching_page_allocator_base::introspect((unint64_t *)(v4 + 16), v5, (const caulk::alloc::introspector *)&v13);
  std::__function::__value_func<void ()(caulk::alloc::region_usage,unsigned long,unsigned long)>::~__value_func[abi:ne180100](v16);
  std::__function::__value_func<void * ()(unsigned long,unsigned long)>::~__value_func[abi:ne180100](v14);
  std::__function::__value_func<void ()(caulk::alloc::region_usage,caulk::alloc::block)>::~__value_func[abi:ne180100](v11);
  uint64_t v6 = *((void *)&v9 + 1);
  if (*(void *)(v3 + 136) > *((void *)&v9 + 1)) {
    uint64_t v6 = *(void *)(v3 + 136);
  }
  *(void *)&long long v10 = v6;
  *((void *)&v10 + 1) += *((void *)&v9 + 1);
  *(void *)(v3 + 136) = v6;
  double result = *(double *)&v9;
  long long v8 = v10;
  *a2 = v9;
  a2[1] = v8;
  return result;
}

void sub_21087A290(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, ...)
{
  va_start(va, a6);
  std::__function::__value_func<void ()(caulk::alloc::region_usage,unsigned long,unsigned long)>::~__value_func[abi:ne180100](v7);
  std::__function::__value_func<void * ()(unsigned long,unsigned long)>::~__value_func[abi:ne180100](v6);
  std::__function::__value_func<void ()(caulk::alloc::region_usage,caulk::alloc::block)>::~__value_func[abi:ne180100]((uint64_t *)va);
  _Unwind_Resume(a1);
}

unint64_t *caulk::alloc::details::caching_page_allocator_base::introspect(unint64_t *this, unint64_t a2, const caulk::alloc::introspector *a3)
{
  uint64_t v3 = this[4];
  if (v3)
  {
    unint64_t v5 = this;
    do
    {
      if ((*(unsigned char *)a3 & 2) != 0) {
        std::function<void ()(caulk::alloc::region_usage,unsigned long,unsigned long)>::operator()(*((void *)a3 + 8), 2, v3, v5[2]);
      }
      this = (unint64_t *)std::function<void * ()(unsigned long,unsigned long)>::operator()(*((void *)a3 + 4), v3, 8);
      uint64_t v3 = atomic_load(this);
    }
    while (v3);
  }
  return this;
}

void *std::__function::__func<void caulk::alloc::allocator_enumerate<caulk::alloc::darwin_resource<caulk::alloc::caching_page_allocator<16384ul>,caulk::alloc::memory_resource>>(caulk::alloc::darwin_resource<caulk::alloc::caching_page_allocator<16384ul>,caulk::alloc::memory_resource> &,caulk::option_set<caulk::alloc::region_usage,unsigned int>,std::function<void ()(caulk::alloc::region_usage,caulk::alloc::block)> const&)::{lambda(caulk::alloc::region_usage,unsigned long,unsigned long)#1},std::allocator<void caulk::alloc::allocator_enumerate<caulk::alloc::darwin_resource<caulk::alloc::caching_page_allocator<16384ul>,caulk::alloc::memory_resource>>(caulk::alloc::darwin_resource<caulk::alloc::caching_page_allocator<16384ul>,caulk::alloc::memory_resource> &,caulk::option_set<caulk::alloc::region_usage,unsigned int>,std::function<void ()(caulk::alloc::region_usage,caulk::alloc::block)> const&)::{lambda(caulk::alloc::region_usage,unsigned long,unsigned long)#1}>,void ()(caulk::alloc::region_usage,unsigned long,unsigned long)>::target_type()
{
}

uint64_t std::__function::__func<void caulk::alloc::allocator_enumerate<caulk::alloc::darwin_resource<caulk::alloc::caching_page_allocator<16384ul>,caulk::alloc::memory_resource>>(caulk::alloc::darwin_resource<caulk::alloc::caching_page_allocator<16384ul>,caulk::alloc::memory_resource> &,caulk::option_set<caulk::alloc::region_usage,unsigned int>,std::function<void ()(caulk::alloc::region_usage,caulk::alloc::block)> const&)::{lambda(caulk::alloc::region_usage,unsigned long,unsigned long)#1},std::allocator<void caulk::alloc::allocator_enumerate<caulk::alloc::darwin_resource<caulk::alloc::caching_page_allocator<16384ul>,caulk::alloc::memory_resource>>(caulk::alloc::darwin_resource<caulk::alloc::caching_page_allocator<16384ul>,caulk::alloc::memory_resource> &,caulk::option_set<caulk::alloc::region_usage,unsigned int>,std::function<void ()(caulk::alloc::region_usage,caulk::alloc::block)> const&)::{lambda(caulk::alloc::region_usage,unsigned long,unsigned long)#1}>,void ()(caulk::alloc::region_usage,unsigned long,unsigned long)>::target(uint64_t a1, uint64_t a2)
{
  if (std::type_info::operator==[abi:ne180100](*(void *)(a2 + 8), (uint64_t)"ZN5caulk5alloc19allocator_enumerateINS0_15darwin_resourceINS0_22caching_page_allocatorILm16384EEENS0_15memory_resourceEEEEEvRT_NS_10option_setINS0_12region_usageEjEERKNSt3__18functionIFvSA_NS0_5blockEEEEEUlSA_mmE_"))
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

uint64_t std::__function::__func<void caulk::alloc::allocator_enumerate<caulk::alloc::darwin_resource<caulk::alloc::caching_page_allocator<16384ul>,caulk::alloc::memory_resource>>(caulk::alloc::darwin_resource<caulk::alloc::caching_page_allocator<16384ul>,caulk::alloc::memory_resource> &,caulk::option_set<caulk::alloc::region_usage,unsigned int>,std::function<void ()(caulk::alloc::region_usage,caulk::alloc::block)> const&)::{lambda(caulk::alloc::region_usage,unsigned long,unsigned long)#1},std::allocator<void caulk::alloc::allocator_enumerate<caulk::alloc::darwin_resource<caulk::alloc::caching_page_allocator<16384ul>,caulk::alloc::memory_resource>>(caulk::alloc::darwin_resource<caulk::alloc::caching_page_allocator<16384ul>,caulk::alloc::memory_resource> &,caulk::option_set<caulk::alloc::region_usage,unsigned int>,std::function<void ()(caulk::alloc::region_usage,caulk::alloc::block)> const&)::{lambda(caulk::alloc::region_usage,unsigned long,unsigned long)#1}>,void ()(caulk::alloc::region_usage,unsigned long,unsigned long)>::operator()(uint64_t a1, int *a2, uint64_t *a3, uint64_t *a4)
{
  return std::function<void ()(caulk::alloc::region_usage,caulk::alloc::block)>::operator()(*(void *)(*(void *)(a1 + 8) + 24), *a2, *a3, *a4);
}

uint64_t std::__function::__func<void caulk::alloc::allocator_enumerate<caulk::alloc::darwin_resource<caulk::alloc::caching_page_allocator<16384ul>,caulk::alloc::memory_resource>>(caulk::alloc::darwin_resource<caulk::alloc::caching_page_allocator<16384ul>,caulk::alloc::memory_resource> &,caulk::option_set<caulk::alloc::region_usage,unsigned int>,std::function<void ()(caulk::alloc::region_usage,caulk::alloc::block)> const&)::{lambda(caulk::alloc::region_usage,unsigned long,unsigned long)#1},std::allocator<void caulk::alloc::allocator_enumerate<caulk::alloc::darwin_resource<caulk::alloc::caching_page_allocator<16384ul>,caulk::alloc::memory_resource>>(caulk::alloc::darwin_resource<caulk::alloc::caching_page_allocator<16384ul>,caulk::alloc::memory_resource> &,caulk::option_set<caulk::alloc::region_usage,unsigned int>,std::function<void ()(caulk::alloc::region_usage,caulk::alloc::block)> const&)::{lambda(caulk::alloc::region_usage,unsigned long,unsigned long)#1}>,void ()(caulk::alloc::region_usage,unsigned long,unsigned long)>::__clone(uint64_t result, void *a2)
{
  uint64_t v2 = *(void *)(result + 8);
  *a2 = &unk_26C2AAB38;
  a2[1] = v2;
  return result;
}

void *std::__function::__func<void caulk::alloc::allocator_enumerate<caulk::alloc::darwin_resource<caulk::alloc::caching_page_allocator<16384ul>,caulk::alloc::memory_resource>>(caulk::alloc::darwin_resource<caulk::alloc::caching_page_allocator<16384ul>,caulk::alloc::memory_resource> &,caulk::option_set<caulk::alloc::region_usage,unsigned int>,std::function<void ()(caulk::alloc::region_usage,caulk::alloc::block)> const&)::{lambda(caulk::alloc::region_usage,unsigned long,unsigned long)#1},std::allocator<void caulk::alloc::allocator_enumerate<caulk::alloc::darwin_resource<caulk::alloc::caching_page_allocator<16384ul>,caulk::alloc::memory_resource>>(caulk::alloc::darwin_resource<caulk::alloc::caching_page_allocator<16384ul>,caulk::alloc::memory_resource> &,caulk::option_set<caulk::alloc::region_usage,unsigned int>,std::function<void ()(caulk::alloc::region_usage,caulk::alloc::block)> const&)::{lambda(caulk::alloc::region_usage,unsigned long,unsigned long)#1}>,void ()(caulk::alloc::region_usage,unsigned long,unsigned long)>::__clone(uint64_t a1)
{
  double result = operator new(0x10uLL);
  uint64_t v3 = *(void *)(a1 + 8);
  *double result = &unk_26C2AAB38;
  result[1] = v3;
  return result;
}

void std::__function::__func<void caulk::alloc::allocator_enumerate<caulk::alloc::darwin_resource<caulk::alloc::caching_page_allocator<16384ul>,caulk::alloc::memory_resource>>(caulk::alloc::darwin_resource<caulk::alloc::caching_page_allocator<16384ul>,caulk::alloc::memory_resource> &,caulk::option_set<caulk::alloc::region_usage,unsigned int>,std::function<void ()(caulk::alloc::region_usage,caulk::alloc::block)> const&)::{lambda(caulk::alloc::region_usage,unsigned long,unsigned long)#1},std::allocator<void caulk::alloc::allocator_enumerate<caulk::alloc::darwin_resource<caulk::alloc::caching_page_allocator<16384ul>,caulk::alloc::memory_resource>>(caulk::alloc::darwin_resource<caulk::alloc::caching_page_allocator<16384ul>,caulk::alloc::memory_resource> &,caulk::option_set<caulk::alloc::region_usage,unsigned int>,std::function<void ()(caulk::alloc::region_usage,caulk::alloc::block)> const&)::{lambda(caulk::alloc::region_usage,unsigned long,unsigned long)#1}>,void ()(caulk::alloc::region_usage,unsigned long,unsigned long)>::~__func()
{
}

void *std::__function::__func<malloc_statistics_t caulk::alloc::allocator_statistics<caulk::alloc::darwin_resource<caulk::alloc::caching_page_allocator<16384ul>,caulk::alloc::memory_resource>>(caulk::alloc::darwin_resource<caulk::alloc::caching_page_allocator<16384ul>,caulk::alloc::memory_resource> &)::{lambda(caulk::alloc::region_usage,caulk::alloc::block)#1},std::allocator<malloc_statistics_t caulk::alloc::allocator_statistics<caulk::alloc::darwin_resource<caulk::alloc::caching_page_allocator<16384ul>,caulk::alloc::memory_resource>>(caulk::alloc::darwin_resource<caulk::alloc::caching_page_allocator<16384ul>,caulk::alloc::memory_resource> &)::{lambda(caulk::alloc::region_usage,caulk::alloc::block)#1}>,void ()(caulk::alloc::region_usage,caulk::alloc::block)>::target_type()
{
}

uint64_t std::__function::__func<malloc_statistics_t caulk::alloc::allocator_statistics<caulk::alloc::darwin_resource<caulk::alloc::caching_page_allocator<16384ul>,caulk::alloc::memory_resource>>(caulk::alloc::darwin_resource<caulk::alloc::caching_page_allocator<16384ul>,caulk::alloc::memory_resource> &)::{lambda(caulk::alloc::region_usage,caulk::alloc::block)#1},std::allocator<malloc_statistics_t caulk::alloc::allocator_statistics<caulk::alloc::darwin_resource<caulk::alloc::caching_page_allocator<16384ul>,caulk::alloc::memory_resource>>(caulk::alloc::darwin_resource<caulk::alloc::caching_page_allocator<16384ul>,caulk::alloc::memory_resource> &)::{lambda(caulk::alloc::region_usage,caulk::alloc::block)#1}>,void ()(caulk::alloc::region_usage,caulk::alloc::block)>::target(uint64_t a1, uint64_t a2)
{
  if (std::type_info::operator==[abi:ne180100](*(void *)(a2 + 8), (uint64_t)"ZN5caulk5alloc20allocator_statisticsINS0_15darwin_resourceINS0_22caching_page_allocatorILm16384EEENS0_15memory_resourceEEEEE19malloc_statistics_tRT_EUlNS0_12region_usageENS0_5blockEE_"))
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

uint64_t std::__function::__func<malloc_statistics_t caulk::alloc::allocator_statistics<caulk::alloc::darwin_resource<caulk::alloc::caching_page_allocator<16384ul>,caulk::alloc::memory_resource>>(caulk::alloc::darwin_resource<caulk::alloc::caching_page_allocator<16384ul>,caulk::alloc::memory_resource> &)::{lambda(caulk::alloc::region_usage,caulk::alloc::block)#1},std::allocator<malloc_statistics_t caulk::alloc::allocator_statistics<caulk::alloc::darwin_resource<caulk::alloc::caching_page_allocator<16384ul>,caulk::alloc::memory_resource>>(caulk::alloc::darwin_resource<caulk::alloc::caching_page_allocator<16384ul>,caulk::alloc::memory_resource> &)::{lambda(caulk::alloc::region_usage,caulk::alloc::block)#1}>,void ()(caulk::alloc::region_usage,caulk::alloc::block)>::operator()(uint64_t result, int *a2, uint64_t a3)
{
  int v3 = *a2;
  uint64_t v4 = *(void *)(a3 + 8);
  if (*a2 == 4 || v3 == 2)
  {
    uint64_t v6 = (void *)(*(void *)(result + 8) + 24);
  }
  else
  {
    if (v3 != 1) {
      return result;
    }
    uint64_t v7 = *(_DWORD **)(result + 8);
    ++*v7;
    uint64_t v6 = v7 + 2;
  }
  *v6 += v4;
  return result;
}

uint64_t std::__function::__func<malloc_statistics_t caulk::alloc::allocator_statistics<caulk::alloc::darwin_resource<caulk::alloc::caching_page_allocator<16384ul>,caulk::alloc::memory_resource>>(caulk::alloc::darwin_resource<caulk::alloc::caching_page_allocator<16384ul>,caulk::alloc::memory_resource> &)::{lambda(caulk::alloc::region_usage,caulk::alloc::block)#1},std::allocator<malloc_statistics_t caulk::alloc::allocator_statistics<caulk::alloc::darwin_resource<caulk::alloc::caching_page_allocator<16384ul>,caulk::alloc::memory_resource>>(caulk::alloc::darwin_resource<caulk::alloc::caching_page_allocator<16384ul>,caulk::alloc::memory_resource> &)::{lambda(caulk::alloc::region_usage,caulk::alloc::block)#1}>,void ()(caulk::alloc::region_usage,caulk::alloc::block)>::__clone(uint64_t result, void *a2)
{
  uint64_t v2 = *(void *)(result + 8);
  *a2 = &unk_26C2AADF8;
  a2[1] = v2;
  return result;
}

void *std::__function::__func<malloc_statistics_t caulk::alloc::allocator_statistics<caulk::alloc::darwin_resource<caulk::alloc::caching_page_allocator<16384ul>,caulk::alloc::memory_resource>>(caulk::alloc::darwin_resource<caulk::alloc::caching_page_allocator<16384ul>,caulk::alloc::memory_resource> &)::{lambda(caulk::alloc::region_usage,caulk::alloc::block)#1},std::allocator<malloc_statistics_t caulk::alloc::allocator_statistics<caulk::alloc::darwin_resource<caulk::alloc::caching_page_allocator<16384ul>,caulk::alloc::memory_resource>>(caulk::alloc::darwin_resource<caulk::alloc::caching_page_allocator<16384ul>,caulk::alloc::memory_resource> &)::{lambda(caulk::alloc::region_usage,caulk::alloc::block)#1}>,void ()(caulk::alloc::region_usage,caulk::alloc::block)>::__clone(uint64_t a1)
{
  double result = operator new(0x10uLL);
  uint64_t v3 = *(void *)(a1 + 8);
  *double result = &unk_26C2AADF8;
  result[1] = v3;
  return result;
}

void std::__function::__func<malloc_statistics_t caulk::alloc::allocator_statistics<caulk::alloc::darwin_resource<caulk::alloc::caching_page_allocator<16384ul>,caulk::alloc::memory_resource>>(caulk::alloc::darwin_resource<caulk::alloc::caching_page_allocator<16384ul>,caulk::alloc::memory_resource> &)::{lambda(caulk::alloc::region_usage,caulk::alloc::block)#1},std::allocator<malloc_statistics_t caulk::alloc::allocator_statistics<caulk::alloc::darwin_resource<caulk::alloc::caching_page_allocator<16384ul>,caulk::alloc::memory_resource>>(caulk::alloc::darwin_resource<caulk::alloc::caching_page_allocator<16384ul>,caulk::alloc::memory_resource> &)::{lambda(caulk::alloc::region_usage,caulk::alloc::block)#1}>,void ()(caulk::alloc::region_usage,caulk::alloc::block)>::~__func()
{
}

uint64_t caulk::alloc::darwin_resource<caulk::alloc::caching_page_allocator<16384ul>,caulk::alloc::memory_resource>::zone_print(uint64_t a1, int a2)
{
  return (*(uint64_t (**)(void, void, BOOL))(**(void **)(a1 - 8) + 48))(*(void *)(a1 - 8), MEMORY[0x263F8C100], a2 != 0);
}

uint64_t caulk::alloc::darwin_resource<caulk::alloc::caching_page_allocator<16384ul>,caulk::alloc::memory_resource>::zone_check()
{
  return 1;
}

uint64_t caulk::alloc::darwin_resource<caulk::alloc::caching_page_allocator<16384ul>,caulk::alloc::memory_resource>::zone_good_size(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t caulk::alloc::darwin_resource<caulk::alloc::caching_page_allocator<16384ul>,caulk::alloc::memory_resource>::zone_enumerate(unsigned int a1, uint64_t a2, int a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  v18[0] = &unk_26C2AA820;
  v18[1] = a5;
  v18[2] = a1;
  v18[3] = v18;
  int v11 = operator new(0x20uLL);
  void *v11 = &unk_26C2AA7C8;
  v11[1] = a6;
  *((_DWORD *)v11 + 4) = a1;
  v11[3] = a2;
  v17[3] = v11;
  int v19 = a3;
  std::__function::__value_func<void * ()(unsigned long,unsigned long)>::__value_func[abi:ne180100]((uint64_t)v20, (uint64_t)v18);
  std::__function::__value_func<void ()(caulk::alloc::region_usage,unsigned long,unsigned long)>::__value_func[abi:ne180100]((uint64_t)v22, (uint64_t)v17);
  char v23 = 0;
  std::__function::__value_func<void ()(caulk::alloc::region_usage,unsigned long,unsigned long)>::~__value_func[abi:ne180100](v17);
  std::__function::__value_func<void * ()(unsigned long,unsigned long)>::~__value_func[abi:ne180100](v18);
  int v12 = (void *)std::function<void * ()(unsigned long,unsigned long)>::operator()(v21, a4 - 8, 208);
  if (*v12) {
    uint64_t v13 = *v12 + 16;
  }
  else {
    uint64_t v13 = 0;
  }
  uint64_t v14 = (unint64_t *)std::function<void * ()(unsigned long,unsigned long)>::operator()(v21, v13, 112);
  caulk::alloc::details::caching_page_allocator_base::introspect(v14, v15, (const caulk::alloc::introspector *)&v19);
  std::__function::__value_func<void ()(caulk::alloc::region_usage,unsigned long,unsigned long)>::~__value_func[abi:ne180100](v22);
  std::__function::__value_func<void * ()(unsigned long,unsigned long)>::~__value_func[abi:ne180100](v20);
  return 0;
}

void sub_21087A6C8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, char a14)
{
  if (a2 == 1)
  {
    __cxa_begin_catch(a1);
    __cxa_end_catch();
    JUMPOUT(0x21087A680);
  }
  std::__function::__value_func<void ()(caulk::alloc::region_usage,unsigned long,unsigned long)>::~__value_func[abi:ne180100](v15);
  std::__function::__value_func<void * ()(unsigned long,unsigned long)>::~__value_func[abi:ne180100](v14);
  _Unwind_Resume(a1);
}

void *std::__function::__func<caulk::alloc::darwin_resource<caulk::alloc::caching_page_allocator<16384ul>,caulk::alloc::memory_resource>::zone_enumerate(unsigned int,void *,unsigned int,unsigned long,int (*)(unsigned int,unsigned long,unsigned long,void **),void (*)(unsigned int,void *,unsigned int,vm_range_t *,unsigned int))::{lambda(caulk::alloc::region_usage,unsigned long,unsigned long)#1},std::allocator<caulk::alloc::darwin_resource<caulk::alloc::caching_page_allocator<16384ul>,caulk::alloc::memory_resource>::zone_enumerate(unsigned int,void *,unsigned int,unsigned long,int (*)(unsigned int,unsigned long,unsigned long,void **),void (*)(unsigned int,void *,unsigned int,vm_range_t *,unsigned int))::{lambda(caulk::alloc::region_usage,unsigned long,unsigned long)#1}>,void ()(caulk::alloc::region_usage,unsigned long,unsigned long)>::target_type()
{
}

uint64_t std::__function::__func<caulk::alloc::darwin_resource<caulk::alloc::caching_page_allocator<16384ul>,caulk::alloc::memory_resource>::zone_enumerate(unsigned int,void *,unsigned int,unsigned long,int (*)(unsigned int,unsigned long,unsigned long,void **),void (*)(unsigned int,void *,unsigned int,vm_range_t *,unsigned int))::{lambda(caulk::alloc::region_usage,unsigned long,unsigned long)#1},std::allocator<caulk::alloc::darwin_resource<caulk::alloc::caching_page_allocator<16384ul>,caulk::alloc::memory_resource>::zone_enumerate(unsigned int,void *,unsigned int,unsigned long,int (*)(unsigned int,unsigned long,unsigned long,void **),void (*)(unsigned int,void *,unsigned int,vm_range_t *,unsigned int))::{lambda(caulk::alloc::region_usage,unsigned long,unsigned long)#1}>,void ()(caulk::alloc::region_usage,unsigned long,unsigned long)>::target(uint64_t a1, uint64_t a2)
{
  if (std::type_info::operator==[abi:ne180100](*(void *)(a2 + 8), (uint64_t)"ZN5caulk5alloc15darwin_resourceINS0_22caching_page_allocatorILm16384EEENS0_15memory_resourceEE14zone_enumerateEjPvjmPFijmmPS6_EPFvjS6_jP10vm_range_tjEEUlNS0_12region_usageEmmE_"))
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

uint64_t std::__function::__func<caulk::alloc::darwin_resource<caulk::alloc::caching_page_allocator<16384ul>,caulk::alloc::memory_resource>::zone_enumerate(unsigned int,void *,unsigned int,unsigned long,int (*)(unsigned int,unsigned long,unsigned long,void **),void (*)(unsigned int,void *,unsigned int,vm_range_t *,unsigned int))::{lambda(caulk::alloc::region_usage,unsigned long,unsigned long)#1},std::allocator<caulk::alloc::darwin_resource<caulk::alloc::caching_page_allocator<16384ul>,caulk::alloc::memory_resource>::zone_enumerate(unsigned int,void *,unsigned int,unsigned long,int (*)(unsigned int,unsigned long,unsigned long,void **),void (*)(unsigned int,void *,unsigned int,vm_range_t *,unsigned int))::{lambda(caulk::alloc::region_usage,unsigned long,unsigned long)#1}>,void ()(caulk::alloc::region_usage,unsigned long,unsigned long)>::operator()(uint64_t a1, unsigned int *a2, void *a3, uint64_t *a4)
{
  uint64_t v4 = *a2;
  uint64_t v5 = *a4;
  v7[0] = *a3;
  v7[1] = v5;
  return (*(uint64_t (**)(void, void, uint64_t, void *, uint64_t))(a1 + 8))(*(unsigned int *)(a1 + 16), *(void *)(a1 + 24), v4, v7, 1);
}

__n128 std::__function::__func<caulk::alloc::darwin_resource<caulk::alloc::caching_page_allocator<16384ul>,caulk::alloc::memory_resource>::zone_enumerate(unsigned int,void *,unsigned int,unsigned long,int (*)(unsigned int,unsigned long,unsigned long,void **),void (*)(unsigned int,void *,unsigned int,vm_range_t *,unsigned int))::{lambda(caulk::alloc::region_usage,unsigned long,unsigned long)#1},std::allocator<caulk::alloc::darwin_resource<caulk::alloc::caching_page_allocator<16384ul>,caulk::alloc::memory_resource>::zone_enumerate(unsigned int,void *,unsigned int,unsigned long,int (*)(unsigned int,unsigned long,unsigned long,void **),void (*)(unsigned int,void *,unsigned int,vm_range_t *,unsigned int))::{lambda(caulk::alloc::region_usage,unsigned long,unsigned long)#1}>,void ()(caulk::alloc::region_usage,unsigned long,unsigned long)>::__clone(uint64_t a1, uint64_t a2)
{
  *(void *)a2 = &unk_26C2AA7C8;
  __n128 result = *(__n128 *)(a1 + 8);
  *(void *)(a2 + 24) = *(void *)(a1 + 24);
  *(__n128 *)(a2 + 8) = result;
  return result;
}

__n128 std::__function::__func<caulk::alloc::darwin_resource<caulk::alloc::caching_page_allocator<16384ul>,caulk::alloc::memory_resource>::zone_enumerate(unsigned int,void *,unsigned int,unsigned long,int (*)(unsigned int,unsigned long,unsigned long,void **),void (*)(unsigned int,void *,unsigned int,vm_range_t *,unsigned int))::{lambda(caulk::alloc::region_usage,unsigned long,unsigned long)#1},std::allocator<caulk::alloc::darwin_resource<caulk::alloc::caching_page_allocator<16384ul>,caulk::alloc::memory_resource>::zone_enumerate(unsigned int,void *,unsigned int,unsigned long,int (*)(unsigned int,unsigned long,unsigned long,void **),void (*)(unsigned int,void *,unsigned int,vm_range_t *,unsigned int))::{lambda(caulk::alloc::region_usage,unsigned long,unsigned long)#1}>,void ()(caulk::alloc::region_usage,unsigned long,unsigned long)>::__clone(uint64_t a1)
{
  uint64_t v2 = (char *)operator new(0x20uLL);
  *(void *)uint64_t v2 = &unk_26C2AA7C8;
  __n128 result = *(__n128 *)(a1 + 8);
  *(__n128 *)(v2 + 8) = result;
  *((void *)v2 + 3) = *(void *)(a1 + 24);
  return result;
}

void std::__function::__func<caulk::alloc::darwin_resource<caulk::alloc::caching_page_allocator<16384ul>,caulk::alloc::memory_resource>::zone_enumerate(unsigned int,void *,unsigned int,unsigned long,int (*)(unsigned int,unsigned long,unsigned long,void **),void (*)(unsigned int,void *,unsigned int,vm_range_t *,unsigned int))::{lambda(caulk::alloc::region_usage,unsigned long,unsigned long)#1},std::allocator<caulk::alloc::darwin_resource<caulk::alloc::caching_page_allocator<16384ul>,caulk::alloc::memory_resource>::zone_enumerate(unsigned int,void *,unsigned int,unsigned long,int (*)(unsigned int,unsigned long,unsigned long,void **),void (*)(unsigned int,void *,unsigned int,vm_range_t *,unsigned int))::{lambda(caulk::alloc::region_usage,unsigned long,unsigned long)#1}>,void ()(caulk::alloc::region_usage,unsigned long,unsigned long)>::~__func()
{
}

void *std::__function::__func<caulk::alloc::darwin_resource<caulk::alloc::caching_page_allocator<16384ul>,caulk::alloc::memory_resource>::zone_enumerate(unsigned int,void *,unsigned int,unsigned long,int (*)(unsigned int,unsigned long,unsigned long,void **),void (*)(unsigned int,void *,unsigned int,vm_range_t *,unsigned int))::{lambda(unsigned long,unsigned long)#1},std::allocator<caulk::alloc::darwin_resource<caulk::alloc::caching_page_allocator<16384ul>,caulk::alloc::memory_resource>::zone_enumerate(unsigned int,void *,unsigned int,unsigned long,int (*)(unsigned int,unsigned long,unsigned long,void **),void (*)(unsigned int,void *,unsigned int,vm_range_t *,unsigned int))::{lambda(unsigned long,unsigned long)#1}>,void * ()(unsigned long,unsigned long)>::target_type()
{
}

uint64_t std::__function::__func<caulk::alloc::darwin_resource<caulk::alloc::caching_page_allocator<16384ul>,caulk::alloc::memory_resource>::zone_enumerate(unsigned int,void *,unsigned int,unsigned long,int (*)(unsigned int,unsigned long,unsigned long,void **),void (*)(unsigned int,void *,unsigned int,vm_range_t *,unsigned int))::{lambda(unsigned long,unsigned long)#1},std::allocator<caulk::alloc::darwin_resource<caulk::alloc::caching_page_allocator<16384ul>,caulk::alloc::memory_resource>::zone_enumerate(unsigned int,void *,unsigned int,unsigned long,int (*)(unsigned int,unsigned long,unsigned long,void **),void (*)(unsigned int,void *,unsigned int,vm_range_t *,unsigned int))::{lambda(unsigned long,unsigned long)#1}>,void * ()(unsigned long,unsigned long)>::target(uint64_t a1, uint64_t a2)
{
  if (std::type_info::operator==[abi:ne180100](*(void *)(a2 + 8), (uint64_t)"ZN5caulk5alloc15darwin_resourceINS0_22caching_page_allocatorILm16384EEENS0_15memory_resourceEE14zone_enumerateEjPvjmPFijmmPS6_EPFvjS6_jP10vm_range_tjEEUlmmE_"))
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

uint64_t std::__function::__func<caulk::alloc::darwin_resource<caulk::alloc::caching_page_allocator<16384ul>,caulk::alloc::memory_resource>::zone_enumerate(unsigned int,void *,unsigned int,unsigned long,int (*)(unsigned int,unsigned long,unsigned long,void **),void (*)(unsigned int,void *,unsigned int,vm_range_t *,unsigned int))::{lambda(unsigned long,unsigned long)#1},std::allocator<caulk::alloc::darwin_resource<caulk::alloc::caching_page_allocator<16384ul>,caulk::alloc::memory_resource>::zone_enumerate(unsigned int,void *,unsigned int,unsigned long,int (*)(unsigned int,unsigned long,unsigned long,void **),void (*)(unsigned int,void *,unsigned int,vm_range_t *,unsigned int))::{lambda(unsigned long,unsigned long)#1}>,void * ()(unsigned long,unsigned long)>::operator()(uint64_t a1, uint64_t *a2, uint64_t *a3)
{
  uint64_t v3 = *a2;
  uint64_t v4 = *a3;
  uint64_t v7 = 0;
  uint64_t v5 = (const char *)(*(uint64_t (**)(void, uint64_t, uint64_t, uint64_t *))(a1 + 8))(*(unsigned int *)(a1 + 16), v3, v4, &v7);
  caulk::mach::throw_if_mach_error((uint64_t)"reader failed", v5);
  return v7;
}

__n128 std::__function::__func<caulk::alloc::darwin_resource<caulk::alloc::caching_page_allocator<16384ul>,caulk::alloc::memory_resource>::zone_enumerate(unsigned int,void *,unsigned int,unsigned long,int (*)(unsigned int,unsigned long,unsigned long,void **),void (*)(unsigned int,void *,unsigned int,vm_range_t *,unsigned int))::{lambda(unsigned long,unsigned long)#1},std::allocator<caulk::alloc::darwin_resource<caulk::alloc::caching_page_allocator<16384ul>,caulk::alloc::memory_resource>::zone_enumerate(unsigned int,void *,unsigned int,unsigned long,int (*)(unsigned int,unsigned long,unsigned long,void **),void (*)(unsigned int,void *,unsigned int,vm_range_t *,unsigned int))::{lambda(unsigned long,unsigned long)#1}>,void * ()(unsigned long,unsigned long)>::__clone(uint64_t a1, uint64_t a2)
{
  *(void *)a2 = &unk_26C2AA820;
  __n128 result = *(__n128 *)(a1 + 8);
  *(__n128 *)(a2 + 8) = result;
  return result;
}

__n128 std::__function::__func<caulk::alloc::darwin_resource<caulk::alloc::caching_page_allocator<16384ul>,caulk::alloc::memory_resource>::zone_enumerate(unsigned int,void *,unsigned int,unsigned long,int (*)(unsigned int,unsigned long,unsigned long,void **),void (*)(unsigned int,void *,unsigned int,vm_range_t *,unsigned int))::{lambda(unsigned long,unsigned long)#1},std::allocator<caulk::alloc::darwin_resource<caulk::alloc::caching_page_allocator<16384ul>,caulk::alloc::memory_resource>::zone_enumerate(unsigned int,void *,unsigned int,unsigned long,int (*)(unsigned int,unsigned long,unsigned long,void **),void (*)(unsigned int,void *,unsigned int,vm_range_t *,unsigned int))::{lambda(unsigned long,unsigned long)#1}>,void * ()(unsigned long,unsigned long)>::__clone(uint64_t a1)
{
  uint64_t v2 = (char *)operator new(0x18uLL);
  *(void *)uint64_t v2 = &unk_26C2AA820;
  __n128 result = *(__n128 *)(a1 + 8);
  *(__n128 *)(v2 + 8) = result;
  return result;
}

void std::__function::__func<caulk::alloc::darwin_resource<caulk::alloc::caching_page_allocator<16384ul>,caulk::alloc::memory_resource>::zone_enumerate(unsigned int,void *,unsigned int,unsigned long,int (*)(unsigned int,unsigned long,unsigned long,void **),void (*)(unsigned int,void *,unsigned int,vm_range_t *,unsigned int))::{lambda(unsigned long,unsigned long)#1},std::allocator<caulk::alloc::darwin_resource<caulk::alloc::caching_page_allocator<16384ul>,caulk::alloc::memory_resource>::zone_enumerate(unsigned int,void *,unsigned int,unsigned long,int (*)(unsigned int,unsigned long,unsigned long,void **),void (*)(unsigned int,void *,unsigned int,vm_range_t *,unsigned int))::{lambda(unsigned long,unsigned long)#1}>,void * ()(unsigned long,unsigned long)>::~__func()
{
}

uint64_t caulk::alloc::darwin_resource<caulk::alloc::caching_page_allocator<16384ul>,caulk::alloc::memory_resource>::zone_pressure_relief(uint64_t a1)
{
  return (*(uint64_t (**)(void))(**(void **)(a1 - 8) + 72))();
}

uint64_t caulk::alloc::darwin_resource<caulk::alloc::caching_page_allocator<16384ul>,caulk::alloc::memory_resource>::malloc_zone(uint64_t a1)
{
  return *(void *)(a1 + 128) + 8;
}

void caulk::alloc::resource<caulk::alloc::caching_page_allocator<16384ul>,caulk::alloc::memory_resource>::reserve(uint64_t a1@<X0>, uint64_t a2@<X1>, caulk::alloc::page_cache_monitor *a3@<X8>)
{
  caulk::alloc::page_cache_monitor::enable_preallocation(*(caulk::alloc::page_cache_monitor **)(a1 + 112), 1);
  uint64_t v6 = *(void *)(a1 + 112);

  caulk::alloc::page_cache_monitor::reserve(a3, v6, a2);
}

void caulk::alloc::page_cache_monitor::reserve(caulk::alloc::page_cache_monitor *this, uint64_t a2, uint64_t a3)
{
  os_unfair_lock_lock(*(os_unfair_lock_t *)(a2 + 24));
  uint64_t v6 = *(uint64_t ***)(a2 + 40);
  if (!v6)
  {
    os_unfair_lock_unlock(*(os_unfair_lock_t *)(a2 + 24));
    *(void *)this = 0;
    *((void *)this + 1) = 0;
    return;
  }
  unint64_t v7 = *(void *)(**v6 + 16);
  long long v8 = *((_OWORD *)v6 + 1);
  long long v28 = v8;
  if (*((void *)&v8 + 1)) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(*((void *)&v8 + 1) + 16), 1uLL, memory_order_relaxed);
  }
  long long v9 = (char *)operator new(0x40uLL);
  *((void *)v9 + 2) = 0;
  *((void *)v9 + 1) = 0;
  *(void *)long long v9 = &unk_26C2ABD68;
  *((void *)v9 + 4) = 0;
  *((void *)v9 + 3) = 0;
  *(_OWORD *)(v9 + 40) = v28;
  *((void *)v9 + 7) = (a3 + v7 - 1) / v7;
  *(void *)this = v9 + 24;
  *((void *)this + 1) = v9;
  atomic_fetch_add_explicit((atomic_ullong *volatile)v9 + 1, 1uLL, memory_order_relaxed);
  atomic_fetch_add_explicit((atomic_ullong *volatile)v9 + 2, 1uLL, memory_order_relaxed);
  *((void *)v9 + 3) = v9 + 24;
  *((void *)v9 + 4) = v9;
  std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)v9);
  long long v10 = *(_OWORD *)this;
  uint64_t v11 = *((void *)this + 1);
  if (v11) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v11 + 16), 1uLL, memory_order_relaxed);
  }
  uint64_t v13 = v6[22];
  int v12 = v6[23];
  if (v13 >= v12)
  {
    unint64_t v16 = v6[21];
    uint64_t v17 = ((char *)v13 - (char *)v16) >> 4;
    unint64_t v18 = v17 + 1;
    if ((unint64_t)(v17 + 1) >> 60) {
      std::vector<std::weak_ptr<caulk::lifetime_observed<std::unique_ptr<caulk::concurrent::details::service_thread>,caulk::shared_instance_manager<caulk::concurrent::details::service_thread>::observer>>>::__throw_length_error[abi:ne180100]();
    }
    long long v29 = v10;
    uint64_t v19 = (char *)v12 - (char *)v16;
    if (v19 >> 3 > v18) {
      unint64_t v18 = v19 >> 3;
    }
    if ((unint64_t)v19 >= 0x7FFFFFFFFFFFFFF0) {
      unint64_t v20 = 0xFFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v20 = v18;
    }
    if (v20 >> 60) {
      std::__throw_bad_array_new_length[abi:ne180100]();
    }
    uint64_t v21 = (char *)operator new(16 * v20);
    unint64_t v22 = (uint64_t *)&v21[16 * v17];
    char v23 = (uint64_t *)&v21[16 * v20];
    *(_OWORD *)unint64_t v22 = v29;
    unint64_t v15 = v22 + 2;
    if (v13 == v16)
    {
      v6[21] = v22;
      v6[22] = v15;
      v6[23] = v23;
      if (!v13) {
        goto LABEL_25;
      }
    }
    else
    {
      do
      {
        long long v24 = *((_OWORD *)v13 - 1);
        v13 -= 2;
        *((_OWORD *)v22 - 1) = v24;
        v22 -= 2;
        *uint64_t v13 = 0;
        v13[1] = 0;
      }
      while (v13 != v16);
      unint64_t v25 = v6[21];
      uint64_t v13 = v6[22];
      v6[21] = v22;
      v6[22] = v15;
      v6[23] = v23;
      if (v13 != v25)
      {
        do
        {
          char v26 = (std::__shared_weak_count *)*(v13 - 1);
          if (v26) {
            std::__shared_weak_count::__release_weak(v26);
          }
          v13 -= 2;
        }
        while (v13 != v25);
        uint64_t v13 = v25;
      }
      if (!v13) {
        goto LABEL_25;
      }
    }
    operator delete(v13);
  }
  else
  {
    *(_OWORD *)uint64_t v13 = v10;
    uint64_t v14 = v13 + 2;
    v6[22] = v14;
    unint64_t v15 = v14;
  }
LABEL_25:
  v6[22] = v15;
  caulk::alloc::page_cache_monitor_impl::evaluate_reservations(v6);
  char v27 = *(os_unfair_lock_s **)(a2 + 24);

  os_unfair_lock_unlock(v27);
}

void sub_21087AC5C(_Unwind_Exception *a1)
{
  uint64_t v4 = *(std::__shared_weak_count **)(v2 + 8);
  if (v4) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v4);
  }
  os_unfair_lock_unlock(*(os_unfair_lock_t *)(v1 + 24));
  _Unwind_Resume(a1);
}

unint64_t caulk::alloc::resource<caulk::alloc::caching_page_allocator<16384ul>,caulk::alloc::memory_resource>::compact(uint64_t a1, uint64_t a2)
{
  return caulk::alloc::details::caching_page_allocator_base::compact((caulk::alloc::details::caching_page_allocator_base *)(a1 + 16), a2);
}

unint64_t caulk::alloc::details::caching_page_allocator_base::compact(caulk::alloc::details::caching_page_allocator_base *this, uint64_t a2)
{
  if ((atomic_fetch_or((atomic_uint *volatile)this + 27, 0x80000000) & 0x80000000) != 0) {
    return 0;
  }
  uint64_t v4 = *((void *)this + 12);
  os_unfair_lock_lock(*(os_unfair_lock_t *)(v4 + 24));
  uint64_t v5 = *(void *)(v4 + 40);
  if (v5) {
    unint64_t v6 = atomic_load((unint64_t *)(v5 + 160));
  }
  else {
    unint64_t v6 = 0;
  }
  os_unfair_lock_unlock(*(os_unfair_lock_t *)(v4 + 24));
  if (*((void *)this + 6) <= v6)
  {
    unint64_t v7 = 0;
  }
  else
  {
    unint64_t v7 = 0;
    unint64_t v8 = a2 - 1;
    long long v9 = (void *)MEMORY[0x263EF8AF8];
    do
    {
      long long v10 = caulk::concurrent::stack<caulk::alloc::free_block,caulk::concurrent::intrusive_single_link_node<caulk::alloc::free_block>>::pop();
      if (v10)
      {
        uint64_t v11 = (caulk::mach::vm_block *)v10;
        atomic_fetch_add((atomic_ullong *volatile)this + 6, 0xFFFFFFFFFFFFFFFFLL);
        while (1)
        {
          unsigned int v12 = atomic_load((unsigned int *)this + 27);
          if ((v12 & 0x7FFFFFFF) == 0) {
            break;
          }
          std::this_thread::sleep_for[abi:ne180100]<long long,std::ratio<1l,1000l>>(1);
        }
        caulk::mach::vm_block::dealloc(v11, (*((void *)this + 2) + *v9 - 1) & -*v9);
        v7 += *((void *)this + 2);
        if (v8 < v7) {
          break;
        }
      }
    }
    while (*((void *)this + 6) > v6);
  }
  atomic_fetch_and((atomic_uint *volatile)this + 27, 0x7FFFFFFFu);
  return v7;
}

void *caulk::alloc::resource<caulk::alloc::caching_page_allocator<16384ul>,caulk::alloc::memory_resource>::enumerate(uint64_t a1, int a2, uint64_t a3)
{
  return caulk::alloc::allocator_enumerate<caulk::alloc::resource<caulk::alloc::caching_page_allocator<16384ul>,caulk::alloc::memory_resource>>(a1, a2, a3);
}

void *caulk::alloc::allocator_enumerate<caulk::alloc::resource<caulk::alloc::caching_page_allocator<16384ul>,caulk::alloc::memory_resource>>(uint64_t a1, int a2, uint64_t a3)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  v7[0] = &unk_26C2AACF0;
  v7[1] = a3;
  v7[3] = v7;
  int v8 = a2;
  v9[0] = &unk_26C2AB948;
  v9[1] = caulk::alloc::introspector::local_reader;
  long long v10 = v9;
  std::__function::__value_func<void ()(caulk::alloc::region_usage,unsigned long,unsigned long)>::__value_func[abi:ne180100]((uint64_t)v11, (uint64_t)v7);
  char v12 = 1;
  std::__function::__value_func<void ()(caulk::alloc::region_usage,unsigned long,unsigned long)>::~__value_func[abi:ne180100](v7);
  uint64_t v4 = std::function<void * ()(unsigned long,unsigned long)>::operator()((uint64_t)v10, a1, 128);
  caulk::alloc::details::caching_page_allocator_base::introspect((unint64_t *)(v4 + 16), v5, (const caulk::alloc::introspector *)&v8);
  std::__function::__value_func<void ()(caulk::alloc::region_usage,unsigned long,unsigned long)>::~__value_func[abi:ne180100](v11);
  return std::__function::__value_func<void * ()(unsigned long,unsigned long)>::~__value_func[abi:ne180100](v9);
}

void sub_21087AEE8(_Unwind_Exception *a1)
{
  std::__function::__value_func<void ()(caulk::alloc::region_usage,unsigned long,unsigned long)>::~__value_func[abi:ne180100](v2);
  std::__function::__value_func<void * ()(unsigned long,unsigned long)>::~__value_func[abi:ne180100](v1);
  _Unwind_Resume(a1);
}

void *std::__function::__func<void caulk::alloc::allocator_enumerate<caulk::alloc::resource<caulk::alloc::caching_page_allocator<16384ul>,caulk::alloc::memory_resource>>(caulk::alloc::resource<caulk::alloc::caching_page_allocator<16384ul>,caulk::alloc::memory_resource> &,caulk::option_set<caulk::alloc::region_usage,unsigned int>,std::function<void ()(caulk::alloc::region_usage,caulk::alloc::block)> const&)::{lambda(caulk::alloc::region_usage,unsigned long,unsigned long)#1},std::allocator<void caulk::alloc::allocator_enumerate<caulk::alloc::resource<caulk::alloc::caching_page_allocator<16384ul>,caulk::alloc::memory_resource>>(caulk::alloc::resource<caulk::alloc::caching_page_allocator<16384ul>,caulk::alloc::memory_resource> &,caulk::option_set<caulk::alloc::region_usage,unsigned int>,std::function<void ()(caulk::alloc::region_usage,caulk::alloc::block)> const&)::{lambda(caulk::alloc::region_usage,unsigned long,unsigned long)#1}>,void ()(caulk::alloc::region_usage,unsigned long,unsigned long)>::target_type()
{
}

uint64_t std::__function::__func<void caulk::alloc::allocator_enumerate<caulk::alloc::resource<caulk::alloc::caching_page_allocator<16384ul>,caulk::alloc::memory_resource>>(caulk::alloc::resource<caulk::alloc::caching_page_allocator<16384ul>,caulk::alloc::memory_resource> &,caulk::option_set<caulk::alloc::region_usage,unsigned int>,std::function<void ()(caulk::alloc::region_usage,caulk::alloc::block)> const&)::{lambda(caulk::alloc::region_usage,unsigned long,unsigned long)#1},std::allocator<void caulk::alloc::allocator_enumerate<caulk::alloc::resource<caulk::alloc::caching_page_allocator<16384ul>,caulk::alloc::memory_resource>>(caulk::alloc::resource<caulk::alloc::caching_page_allocator<16384ul>,caulk::alloc::memory_resource> &,caulk::option_set<caulk::alloc::region_usage,unsigned int>,std::function<void ()(caulk::alloc::region_usage,caulk::alloc::block)> const&)::{lambda(caulk::alloc::region_usage,unsigned long,unsigned long)#1}>,void ()(caulk::alloc::region_usage,unsigned long,unsigned long)>::target(uint64_t a1, uint64_t a2)
{
  if (std::type_info::operator==[abi:ne180100](*(void *)(a2 + 8), (uint64_t)"ZN5caulk5alloc19allocator_enumerateINS0_8resourceINS0_22caching_page_allocatorILm16384EEENS0_15memory_resourceEEEEEvRT_NS_10option_setINS0_12region_usageEjEERKNSt3__18functionIFvSA_NS0_5blockEEEEEUlSA_mmE_"))
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

uint64_t std::__function::__func<void caulk::alloc::allocator_enumerate<caulk::alloc::resource<caulk::alloc::caching_page_allocator<16384ul>,caulk::alloc::memory_resource>>(caulk::alloc::resource<caulk::alloc::caching_page_allocator<16384ul>,caulk::alloc::memory_resource> &,caulk::option_set<caulk::alloc::region_usage,unsigned int>,std::function<void ()(caulk::alloc::region_usage,caulk::alloc::block)> const&)::{lambda(caulk::alloc::region_usage,unsigned long,unsigned long)#1},std::allocator<void caulk::alloc::allocator_enumerate<caulk::alloc::resource<caulk::alloc::caching_page_allocator<16384ul>,caulk::alloc::memory_resource>>(caulk::alloc::resource<caulk::alloc::caching_page_allocator<16384ul>,caulk::alloc::memory_resource> &,caulk::option_set<caulk::alloc::region_usage,unsigned int>,std::function<void ()(caulk::alloc::region_usage,caulk::alloc::block)> const&)::{lambda(caulk::alloc::region_usage,unsigned long,unsigned long)#1}>,void ()(caulk::alloc::region_usage,unsigned long,unsigned long)>::operator()(uint64_t a1, int *a2, uint64_t *a3, uint64_t *a4)
{
  return std::function<void ()(caulk::alloc::region_usage,caulk::alloc::block)>::operator()(*(void *)(*(void *)(a1 + 8) + 24), *a2, *a3, *a4);
}

uint64_t std::__function::__func<void caulk::alloc::allocator_enumerate<caulk::alloc::resource<caulk::alloc::caching_page_allocator<16384ul>,caulk::alloc::memory_resource>>(caulk::alloc::resource<caulk::alloc::caching_page_allocator<16384ul>,caulk::alloc::memory_resource> &,caulk::option_set<caulk::alloc::region_usage,unsigned int>,std::function<void ()(caulk::alloc::region_usage,caulk::alloc::block)> const&)::{lambda(caulk::alloc::region_usage,unsigned long,unsigned long)#1},std::allocator<void caulk::alloc::allocator_enumerate<caulk::alloc::resource<caulk::alloc::caching_page_allocator<16384ul>,caulk::alloc::memory_resource>>(caulk::alloc::resource<caulk::alloc::caching_page_allocator<16384ul>,caulk::alloc::memory_resource> &,caulk::option_set<caulk::alloc::region_usage,unsigned int>,std::function<void ()(caulk::alloc::region_usage,caulk::alloc::block)> const&)::{lambda(caulk::alloc::region_usage,unsigned long,unsigned long)#1}>,void ()(caulk::alloc::region_usage,unsigned long,unsigned long)>::__clone(uint64_t result, void *a2)
{
  uint64_t v2 = *(void *)(result + 8);
  *a2 = &unk_26C2AACF0;
  a2[1] = v2;
  return result;
}

void *std::__function::__func<void caulk::alloc::allocator_enumerate<caulk::alloc::resource<caulk::alloc::caching_page_allocator<16384ul>,caulk::alloc::memory_resource>>(caulk::alloc::resource<caulk::alloc::caching_page_allocator<16384ul>,caulk::alloc::memory_resource> &,caulk::option_set<caulk::alloc::region_usage,unsigned int>,std::function<void ()(caulk::alloc::region_usage,caulk::alloc::block)> const&)::{lambda(caulk::alloc::region_usage,unsigned long,unsigned long)#1},std::allocator<void caulk::alloc::allocator_enumerate<caulk::alloc::resource<caulk::alloc::caching_page_allocator<16384ul>,caulk::alloc::memory_resource>>(caulk::alloc::resource<caulk::alloc::caching_page_allocator<16384ul>,caulk::alloc::memory_resource> &,caulk::option_set<caulk::alloc::region_usage,unsigned int>,std::function<void ()(caulk::alloc::region_usage,caulk::alloc::block)> const&)::{lambda(caulk::alloc::region_usage,unsigned long,unsigned long)#1}>,void ()(caulk::alloc::region_usage,unsigned long,unsigned long)>::__clone(uint64_t a1)
{
  __n128 result = operator new(0x10uLL);
  uint64_t v3 = *(void *)(a1 + 8);
  *__n128 result = &unk_26C2AACF0;
  result[1] = v3;
  return result;
}

void std::__function::__func<void caulk::alloc::allocator_enumerate<caulk::alloc::resource<caulk::alloc::caching_page_allocator<16384ul>,caulk::alloc::memory_resource>>(caulk::alloc::resource<caulk::alloc::caching_page_allocator<16384ul>,caulk::alloc::memory_resource> &,caulk::option_set<caulk::alloc::region_usage,unsigned int>,std::function<void ()(caulk::alloc::region_usage,caulk::alloc::block)> const&)::{lambda(caulk::alloc::region_usage,unsigned long,unsigned long)#1},std::allocator<void caulk::alloc::allocator_enumerate<caulk::alloc::resource<caulk::alloc::caching_page_allocator<16384ul>,caulk::alloc::memory_resource>>(caulk::alloc::resource<caulk::alloc::caching_page_allocator<16384ul>,caulk::alloc::memory_resource> &,caulk::option_set<caulk::alloc::region_usage,unsigned int>,std::function<void ()(caulk::alloc::region_usage,caulk::alloc::block)> const&)::{lambda(caulk::alloc::region_usage,unsigned long,unsigned long)#1}>,void ()(caulk::alloc::region_usage,unsigned long,unsigned long)>::~__func()
{
}

void *caulk::alloc::resource<caulk::alloc::caching_page_allocator<16384ul>,caulk::alloc::memory_resource>::print(uint64_t a1, uint64_t a2, int a3)
{
  void v10[4] = *MEMORY[0x263EF8340];
  uint64_t v7 = a2;
  int v8 = 0;
  char v9 = 0;
  __n128 result = caulk::alloc::details::caching_page_allocator_base::describe((caulk::alloc::details::caching_page_allocator_base *)(a1 + 16), (caulk::alloc::base_allocator::formatter *)&v7);
  if (a3)
  {
    v10[0] = &unk_26C2AAA30;
    v10[1] = a2;
    v10[3] = v10;
    caulk::alloc::allocator_enumerate<caulk::alloc::resource<caulk::alloc::caching_page_allocator<16384ul>,caulk::alloc::memory_resource>>(a1, 7, (uint64_t)v10);
    return std::__function::__value_func<void ()(caulk::alloc::region_usage,caulk::alloc::block)>::~__value_func[abi:ne180100](v10);
  }
  return result;
}

void sub_21087B0AC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, ...)
{
  va_start(va, a4);
  std::__function::__value_func<void ()(caulk::alloc::region_usage,caulk::alloc::block)>::~__value_func[abi:ne180100]((uint64_t *)va);
  _Unwind_Resume(a1);
}

void *caulk::alloc::details::caching_page_allocator_base::describe(caulk::alloc::details::caching_page_allocator_base *this, caulk::alloc::base_allocator::formatter *a2)
{
  caulk::alloc::page_allocator::describe(this, a2, "caching_page_allocator");
  caulk::alloc::base_allocator::formatter::emit_string(a2, "  free stack: ");
  caulk::alloc::base_allocator::formatter::check_line_start(a2);
  std::ostream::operator<<();
  caulk::alloc::base_allocator::formatter::emit_string(a2, " x ");
  caulk::alloc::base_allocator::formatter::check_line_start(a2);
  std::ostream::operator<<();
  caulk::alloc::base_allocator::formatter::emit_string(a2, ", ");
  atomic_load((unsigned int *)this + 26);
  caulk::alloc::base_allocator::formatter::check_line_start(a2);
  std::ostream::operator<<();
  caulk::alloc::base_allocator::formatter::emit_string(a2, " cache misses");

  return caulk::alloc::base_allocator::formatter::emit_string(a2, "\n");
}

void *std::__function::__func<void caulk::alloc::print_allocator<caulk::alloc::resource<caulk::alloc::caching_page_allocator<16384ul>,caulk::alloc::memory_resource>>(caulk::alloc::resource<caulk::alloc::caching_page_allocator<16384ul>,caulk::alloc::memory_resource> &,std::ostream &,BOOL)::{lambda(caulk::alloc::region_usage,caulk::alloc::block)#1},std::allocator<void caulk::alloc::print_allocator<caulk::alloc::resource<caulk::alloc::caching_page_allocator<16384ul>,caulk::alloc::memory_resource>>(caulk::alloc::resource<caulk::alloc::caching_page_allocator<16384ul>,caulk::alloc::memory_resource> &,std::ostream &,BOOL)::{lambda(caulk::alloc::region_usage,caulk::alloc::block)#1}>,void ()(caulk::alloc::region_usage,caulk::alloc::block)>::target_type()
{
}

uint64_t std::__function::__func<void caulk::alloc::print_allocator<caulk::alloc::resource<caulk::alloc::caching_page_allocator<16384ul>,caulk::alloc::memory_resource>>(caulk::alloc::resource<caulk::alloc::caching_page_allocator<16384ul>,caulk::alloc::memory_resource> &,std::ostream &,BOOL)::{lambda(caulk::alloc::region_usage,caulk::alloc::block)#1},std::allocator<void caulk::alloc::print_allocator<caulk::alloc::resource<caulk::alloc::caching_page_allocator<16384ul>,caulk::alloc::memory_resource>>(caulk::alloc::resource<caulk::alloc::caching_page_allocator<16384ul>,caulk::alloc::memory_resource> &,std::ostream &,BOOL)::{lambda(caulk::alloc::region_usage,caulk::alloc::block)#1}>,void ()(caulk::alloc::region_usage,caulk::alloc::block)>::target(uint64_t a1, uint64_t a2)
{
  if (std::type_info::operator==[abi:ne180100](*(void *)(a2 + 8), (uint64_t)"ZN5caulk5alloc15print_allocatorINS0_8resourceINS0_22caching_page_allocatorILm16384EEENS0_15memory_resourceEEEEEvRT_RNSt3__113basic_ostreamIcNS9_11char_traitsIcEEEEbEUlNS0_12region_usageENS0_5blockEE_"))
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

uint64_t std::__function::__func<void caulk::alloc::print_allocator<caulk::alloc::resource<caulk::alloc::caching_page_allocator<16384ul>,caulk::alloc::memory_resource>>(caulk::alloc::resource<caulk::alloc::caching_page_allocator<16384ul>,caulk::alloc::memory_resource> &,std::ostream &,BOOL)::{lambda(caulk::alloc::region_usage,caulk::alloc::block)#1},std::allocator<void caulk::alloc::print_allocator<caulk::alloc::resource<caulk::alloc::caching_page_allocator<16384ul>,caulk::alloc::memory_resource>>(caulk::alloc::resource<caulk::alloc::caching_page_allocator<16384ul>,caulk::alloc::memory_resource> &,std::ostream &,BOOL)::{lambda(caulk::alloc::region_usage,caulk::alloc::block)#1}>,void ()(caulk::alloc::region_usage,caulk::alloc::block)>::operator()(uint64_t a1, int *a2)
{
  return caulk::alloc::describe_block(*(void *)(a1 + 8), *a2);
}

uint64_t std::__function::__func<void caulk::alloc::print_allocator<caulk::alloc::resource<caulk::alloc::caching_page_allocator<16384ul>,caulk::alloc::memory_resource>>(caulk::alloc::resource<caulk::alloc::caching_page_allocator<16384ul>,caulk::alloc::memory_resource> &,std::ostream &,BOOL)::{lambda(caulk::alloc::region_usage,caulk::alloc::block)#1},std::allocator<void caulk::alloc::print_allocator<caulk::alloc::resource<caulk::alloc::caching_page_allocator<16384ul>,caulk::alloc::memory_resource>>(caulk::alloc::resource<caulk::alloc::caching_page_allocator<16384ul>,caulk::alloc::memory_resource> &,std::ostream &,BOOL)::{lambda(caulk::alloc::region_usage,caulk::alloc::block)#1}>,void ()(caulk::alloc::region_usage,caulk::alloc::block)>::__clone(uint64_t result, void *a2)
{
  uint64_t v2 = *(void *)(result + 8);
  *a2 = &unk_26C2AAA30;
  a2[1] = v2;
  return result;
}

void *std::__function::__func<void caulk::alloc::print_allocator<caulk::alloc::resource<caulk::alloc::caching_page_allocator<16384ul>,caulk::alloc::memory_resource>>(caulk::alloc::resource<caulk::alloc::caching_page_allocator<16384ul>,caulk::alloc::memory_resource> &,std::ostream &,BOOL)::{lambda(caulk::alloc::region_usage,caulk::alloc::block)#1},std::allocator<void caulk::alloc::print_allocator<caulk::alloc::resource<caulk::alloc::caching_page_allocator<16384ul>,caulk::alloc::memory_resource>>(caulk::alloc::resource<caulk::alloc::caching_page_allocator<16384ul>,caulk::alloc::memory_resource> &,std::ostream &,BOOL)::{lambda(caulk::alloc::region_usage,caulk::alloc::block)#1}>,void ()(caulk::alloc::region_usage,caulk::alloc::block)>::__clone(uint64_t a1)
{
  __n128 result = operator new(0x10uLL);
  uint64_t v3 = *(void *)(a1 + 8);
  *__n128 result = &unk_26C2AAA30;
  result[1] = v3;
  return result;
}

void std::__function::__func<void caulk::alloc::print_allocator<caulk::alloc::resource<caulk::alloc::caching_page_allocator<16384ul>,caulk::alloc::memory_resource>>(caulk::alloc::resource<caulk::alloc::caching_page_allocator<16384ul>,caulk::alloc::memory_resource> &,std::ostream &,BOOL)::{lambda(caulk::alloc::region_usage,caulk::alloc::block)#1},std::allocator<void caulk::alloc::print_allocator<caulk::alloc::resource<caulk::alloc::caching_page_allocator<16384ul>,caulk::alloc::memory_resource>>(caulk::alloc::resource<caulk::alloc::caching_page_allocator<16384ul>,caulk::alloc::memory_resource> &,std::ostream &,BOOL)::{lambda(caulk::alloc::region_usage,caulk::alloc::block)#1}>,void ()(caulk::alloc::region_usage,caulk::alloc::block)>::~__func()
{
}

void *caulk::alloc::page_allocator::describe(caulk::alloc::page_allocator *this, caulk::alloc::base_allocator::formatter *a2, char *a3)
{
  if (a3) {
    unint64_t v5 = a3;
  }
  else {
    unint64_t v5 = "page_allocator";
  }
  caulk::alloc::base_allocator::formatter::emit_string(a2, v5);
  if (*(_DWORD *)this)
  {
    caulk::alloc::base_allocator::formatter::emit_string(a2, ", VM tag ");
    caulk::alloc::base_allocator::formatter::check_line_start(a2);
    std::ostream::operator<<();
  }

  return caulk::alloc::base_allocator::formatter::emit_string(a2, "\n");
}

BOOL caulk::alloc::resource<caulk::alloc::caching_page_allocator<16384ul>,caulk::alloc::memory_resource>::do_is_equal(uint64_t a1, uint64_t a2)
{
  return a1 == a2;
}

void caulk::alloc::darwin_resource<caulk::alloc::caching_page_allocator<16384ul>,caulk::alloc::memory_resource>::do_deallocate(void *a1, caulk::mach::vm_block *this, uint64_t a3)
{
  unint64_t v6 = (void (*)(uint64_t, uint64_t, caulk::mach::vm_block *, void, void, void))a1[18];
  if (v6) {
    v6(12, a1[16] + 8, this, 0, 0, 0);
  }

  caulk::alloc::details::caching_page_allocator_base::deallocate(a1 + 2, this, a3);
}

void caulk::alloc::details::caching_page_allocator_base::deallocate(void *a1, caulk::mach::vm_block *this, uint64_t a3)
{
  if (a3)
  {
    _X4 = this;
    if (a3 == a1[2])
    {
      _X6 = 0;
      _X7 = 0;
      __asm { CASPAL          X6, X7, X6, X7, [X8] }
      atomic_store(_X6, (unint64_t *)this);
      _X3 = 0;
      __asm { CASPAL          X2, X3, X4, X5, [X8] }
      if (_X2 != _X6)
      {
        do
        {
          atomic_store(_X2, (unint64_t *)this);
          _X7 = 0;
          __asm { CASPAL          X6, X7, X4, X5, [X8] }
          unint64_t v15 = _X6 ^ _X2;
          _X2 = _X6;
        }
        while (v15);
      }
      atomic_fetch_add(a1 + 6, 1uLL);
      if (a1[11])
      {
        uint64_t v16 = a1[2];
        uint64_t v17 = a1[6];
        uint64_t v18 = a1[11];
        std::function<void ()(unsigned long,unsigned long)>::operator()(v18, v16, v17);
      }
    }
    else
    {
      size_t v19 = (a3 + *MEMORY[0x263EF8AF8] - 1) & -*MEMORY[0x263EF8AF8];
      caulk::mach::vm_block::dealloc(_X4, v19);
    }
  }
  else
  {
    _os_assert_log();
    _os_crash();
    __break(1u);
  }
}

unint64_t *caulk::alloc::darwin_resource<caulk::alloc::caching_page_allocator<16384ul>,caulk::alloc::memory_resource>::do_allocate(void *a1, uint64_t a2, unint64_t a3)
{
  unint64_t v5 = caulk::alloc::details::caching_page_allocator_base::allocate((caulk::alloc::details::caching_page_allocator_base *)(a1 + 2), a2, a3);
  if (!v5)
  {
    exception = (std::bad_alloc *)__cxa_allocate_exception(8uLL);
    long long v10 = std::bad_alloc::bad_alloc(exception);
    __cxa_throw(v10, MEMORY[0x263F8C218], MEMORY[0x263F8C170]);
  }
  unint64_t v6 = v5;
  uint64_t v7 = (void (*)(uint64_t, uint64_t, uint64_t, void, unint64_t *, void))a1[18];
  if (v7) {
    v7(10, a1[16] + 8, a2, 0, v5, 0);
  }
  return v6;
}

void caulk::alloc::darwin_resource<caulk::alloc::caching_page_allocator<16384ul>,caulk::alloc::memory_resource>::~darwin_resource(void *a1)
{
  *a1 = &unk_26C2AA328;
  uint64_t v2 = a1[16];
  a1[16] = 0;
  if (v2) {
    std::default_delete<caulk::alloc::darwin_resource<caulk::alloc::caching_page_allocator<16384ul>,caulk::alloc::memory_resource>::zone_plus>::operator()[abi:ne180100](v2);
  }
  caulk::alloc::details::caching_page_allocator_base::~caching_page_allocator_base((caulk::alloc::details::caching_page_allocator_base *)(a1 + 2));

  JUMPOUT(0x216674B00);
}

void std::default_delete<caulk::alloc::darwin_resource<caulk::alloc::caching_page_allocator<16384ul>,caulk::alloc::memory_resource>::zone_plus>::operator()[abi:ne180100](uint64_t a1)
{
  malloc_zone_unregister((malloc_zone_t *)(a1 + 8));

  JUMPOUT(0x216674B00);
}

void *caulk::alloc::darwin_resource<caulk::alloc::caching_page_allocator<16384ul>,caulk::alloc::memory_resource>::~darwin_resource(void *a1)
{
  *a1 = &unk_26C2AA328;
  uint64_t v2 = a1[16];
  a1[16] = 0;
  if (v2) {
    std::default_delete<caulk::alloc::darwin_resource<caulk::alloc::caching_page_allocator<16384ul>,caulk::alloc::memory_resource>::zone_plus>::operator()[abi:ne180100](v2);
  }
  caulk::alloc::details::caching_page_allocator_base::~caching_page_allocator_base((caulk::alloc::details::caching_page_allocator_base *)(a1 + 2));
  return a1;
}

void std::__shared_ptr_emplace<caulk::mach::unfair_lock>::~__shared_ptr_emplace(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)&unk_26C2ABD30;
  std::__shared_weak_count::~__shared_weak_count(a1);

  JUMPOUT(0x216674B00);
}

void std::__shared_ptr_emplace<caulk::mach::unfair_lock>::~__shared_ptr_emplace(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&unk_26C2ABD30;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void caulk::alloc::page_allocator::deallocate(int a1, caulk::mach::vm_block *this, uint64_t a3)
{
}

void *caulk::alloc::guarded_page_allocator::describe(caulk::alloc::guarded_page_allocator *this, caulk::alloc::base_allocator::formatter *a2)
{
  return caulk::alloc::page_allocator::describe(this, a2, "guarded_page_allocator");
}

char *caulk::alloc::guarded_page_allocator::allocate(caulk::alloc::guarded_page_allocator *this, uint64_t a2, unint64_t a3)
{
  uint64_t v3 = (size_t *)MEMORY[0x263EF8AF8];
  if (*MEMORY[0x263EF8AF8] < a3)
  {
    _os_assert_log();
    __n128 result = (char *)_os_crash();
    __break(1u);
  }
  else
  {
    uint64_t v6 = ((a2 + *MEMORY[0x263EF8AF8] - 1) & -*MEMORY[0x263EF8AF8]) + 2 * *MEMORY[0x263EF8AF8];
    uint64_t v7 = (char *)caulk::alloc::page_allocator::allocate(this, v6, a3);
    int v8 = mprotect(v7, *v3, 0);
    if (v8 | mprotect(&v7[v6 - *v3], *v3, 0) && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
    {
      v15[0] = 0;
      _os_log_error_impl(&dword_210865000, &_os_log_internal, OS_LOG_TYPE_ERROR, "couldn't protect region", (uint8_t *)v15, 2u);
    }
    unint64_t v9 = a3 + ((*v3 - 1) & a2) - 1;
    unint64_t v10 = v9 % a3 - v9 + *v3;
    uint64_t v11 = &v7[*v3];
    if (v10 >= 4)
    {
      uint64_t v12 = v10 >> 2;
      if (v10 >> 2 <= 1) {
        uint64_t v12 = 1;
      }
      uint64_t v13 = &v7[*v3];
      do
      {
        *(_DWORD *)uint64_t v13 = -267262961;
        v13 += 4;
        --v12;
      }
      while (v12);
    }
    return &v11[v10];
  }
  return result;
}

void caulk::alloc::guarded_page_allocator::deallocate(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  uint64_t v4 = *MEMORY[0x263EF8AF8];
  uint64_t v5 = *MEMORY[0x263EF8AF8] - 1;
  unint64_t v6 = a4 + ((a3 - 2 * *MEMORY[0x263EF8AF8]) & v5) - 1;
  unint64_t v7 = v6 % a4 - v6 + *MEMORY[0x263EF8AF8];
  uint64_t v8 = a2 - v7;
  if (v7 < 4)
  {
LABEL_6:
    caulk::mach::vm_block::dealloc((caulk::mach::vm_block *)(v8 - v4), (v5 + a3) & -v4);
  }
  else
  {
    uint64_t v9 = 0;
    unint64_t v10 = v7 >> 2;
    if (v10 <= 1) {
      unint64_t v10 = 1;
    }
    while (*(_DWORD *)(v8 + 4 * v9) == -267262961)
    {
      ++v9;
      if (!--v10) {
        goto LABEL_6;
      }
    }
    _os_assert_log();
    _os_crash();
    __break(1u);
  }
}

void caulk::alloc::details::caching_page_allocator_base::enable_preallocation(caulk::alloc::page_cache_monitor **this, uint64_t a2)
{
}

void caulk::alloc::details::caching_page_allocator_base::enable_preallocation(caulk::alloc::page_cache_monitor **this, int a2)
{
}

unint64_t caulk::alloc::details::caching_page_allocator_base::compact(caulk::alloc::details::caching_page_allocator_base *this)
{
  return caulk::alloc::details::caching_page_allocator_base::compact(this, 0);
}

void caulk::alloc::details::caching_page_allocator_base::reserve(caulk::alloc::page_cache_monitor **this@<X0>, uint64_t a2@<X1>, caulk::alloc::page_cache_monitor *a3@<X8>)
{
  caulk::alloc::page_cache_monitor::enable_preallocation(this[12], 1);
  uint64_t v6 = (uint64_t)this[12];

  caulk::alloc::page_cache_monitor::reserve(a3, v6, a2);
}

uint64_t caulk::execution_queue::global_executor@<X0>(uint64_t a1@<X8>)
{
  {
    caulk::execution_queue::global_executor(void)::global = (uint64_t)&unk_26C2AB9A0;
    qword_26776D1A0 = (uint64_t)&caulk::execution_queue::global_executor(void)::global;
  }
  uint64_t result = qword_26776D1A0;
  if (qword_26776D1A0)
  {
    if ((uint64_t *)qword_26776D1A0 == &caulk::execution_queue::global_executor(void)::global)
    {
      *(void *)(a1 + 24) = a1;
      uint64_t v4 = *(uint64_t (**)(uint64_t *, uint64_t))(caulk::execution_queue::global_executor(void)::global + 24);
      return v4(&caulk::execution_queue::global_executor(void)::global, a1);
    }
    else
    {
      uint64_t result = (*(uint64_t (**)(void))(*(void *)qword_26776D1A0 + 16))();
      *(void *)(a1 + 24) = result;
    }
  }
  else
  {
    *(void *)(a1 + 24) = 0;
  }
  return result;
}

void *std::__function::__func<caulk::execution_queue::global_executor(void)::$_0,std::allocator<caulk::execution_queue::global_executor(void)::$_0>,void ()(caulk::v1::task<void ()(void)>)>::target_type()
{
}

uint64_t std::__function::__func<caulk::execution_queue::global_executor(void)::$_0,std::allocator<caulk::execution_queue::global_executor(void)::$_0>,void ()(caulk::v1::task<void ()(void)>)>::target(uint64_t a1, uint64_t a2)
{
  if (std::type_info::operator==[abi:ne180100](*(void *)(a2 + 8), (uint64_t)"ZN5caulk15execution_queue15global_executorEvE3$_0"))
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

void std::__function::__func<caulk::execution_queue::global_executor(void)::$_0,std::allocator<caulk::execution_queue::global_executor(void)::$_0>,void ()(caulk::v1::task<void ()(void)>)>::operator()(uint64_t a1, uint64_t *a2)
{
  v4[31] = *MEMORY[0x263EF8340];
  uint64_t v2 = *a2;
  (*(void (**)(uint64_t *, void *))(v2 + 8))(a2 + 1, v3);
  v3[31] = v2;
  (*(void (**)(void *, void *))(v2 + 8))(v3, v4);
  operator new();
}

void sub_21087BC00(_Unwind_Exception *a1, int a2)
{
  if (a2) {
    __clang_call_terminate(a1);
  }
  _Unwind_Resume(a1);
}

void (****std::unique_ptr<caulk::execution_queue::global_executor(void)::$_0::operator() const(caulk::v1::task<void ()(void)>)::{lambda(void)#1},std::default_delete<caulk::execution_queue::global_executor(void)::$_0::operator() const(caulk::v1::task<void ()(void)>)::{lambda(void)#1}>>::~unique_ptr[abi:ne180100](void (****a1)(uint64_t)))(uint64_t)
{
  uint64_t v2 = *a1;
  *a1 = 0;
  if (v2)
  {
    (**v2)((uint64_t)(v2 + 1));
    MEMORY[0x216674B00](v2, 0x1060C404CFE1F30);
  }
  return a1;
}

void (****applesauce::dispatch::v1::async<caulk::execution_queue::global_executor(void)::$_0::operator() const(caulk::v1::task<void ()(void)>)::{lambda(void)#1}>(dispatch_queue_s *,caulk::execution_queue::global_executor(void)::$_0::operator() const(caulk::v1::task<void ()(void)>)::{lambda(void)#1} &&)::{lambda(void *)#1}::__invoke(void (***a1)(uint64_t)))(uint64_t)
{
  uint64_t v2 = a1;
  (*a1)[2]((uint64_t)(a1 + 1));
  return std::unique_ptr<caulk::execution_queue::global_executor(void)::$_0::operator() const(caulk::v1::task<void ()(void)>)::{lambda(void)#1},std::default_delete<caulk::execution_queue::global_executor(void)::$_0::operator() const(caulk::v1::task<void ()(void)>)::{lambda(void)#1}>>::~unique_ptr[abi:ne180100](&v2);
}

void sub_21087BCB0(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  std::unique_ptr<caulk::execution_queue::global_executor(void)::$_0::operator() const(caulk::v1::task<void ()(void)>)::{lambda(void)#1},std::default_delete<caulk::execution_queue::global_executor(void)::$_0::operator() const(caulk::v1::task<void ()(void)>)::{lambda(void)#1}>>::~unique_ptr[abi:ne180100]((void (****)(uint64_t))va);
  _Unwind_Resume(a1);
}

void std::__function::__func<caulk::execution_queue::global_executor(void)::$_0,std::allocator<caulk::execution_queue::global_executor(void)::$_0>,void ()(caulk::v1::task<void ()(void)>)>::__clone(uint64_t a1, void *a2)
{
  *a2 = &unk_26C2AB9A0;
}

void *std::__function::__func<caulk::execution_queue::global_executor(void)::$_0,std::allocator<caulk::execution_queue::global_executor(void)::$_0>,void ()(caulk::v1::task<void ()(void)>)>::__clone()
{
  uint64_t result = operator new(0x10uLL);
  *uint64_t result = &unk_26C2AB9A0;
  return result;
}

void std::__function::__func<caulk::execution_queue::global_executor(void)::$_0,std::allocator<caulk::execution_queue::global_executor(void)::$_0>,void ()(caulk::v1::task<void ()(void)>)>::~__func()
{
}

uint64_t caulk::execution_queue::execution_queue(uint64_t result, void *a2)
{
  *(unsigned char *)uint64_t result = 0;
  *(void *)(result + 8) = *a2;
  *a2 = 0;
  *(_DWORD *)(result + 16) = 0;
  return result;
}

{
  *(unsigned char *)uint64_t result = 0;
  *(void *)(result + 8) = *a2;
  *a2 = 0;
  *(_DWORD *)(result + 16) = 0;
  return result;
}

void caulk::execution_queue::~execution_queue(caulk::execution_queue *this)
{
  unsigned __int8 v2 = atomic_load((unsigned __int8 *)this);
  if ((v2 & 1) == 0) {
    caulk::execution_queue::invalidate((dispatch_queue_t *)this);
  }
  uint64_t v3 = *((void *)this + 1);
  if (v3) {
    dispatch_release(v3);
  }
}

uint64_t caulk::execution_queue::invalidate(dispatch_queue_t *this)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  dispatch_assert_queue_not_V2(this[1]);
  atomic_store(1u, (unsigned __int8 *)this);
  dispatch_sync_f(this[1], this, (dispatch_function_t)caulk::execution_queue::drain);
  uint64_t v2 = *((unsigned int *)this + 4);
  if (v2 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    label = dispatch_queue_get_label(this[1]);
    int v5 = 136315394;
    uint64_t v6 = label;
    __int16 v7 = 1024;
    int v8 = v2;
    _os_log_impl(&dword_210865000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "%s: discarded %d message(s) post-invalidation", (uint8_t *)&v5, 0x12u);
    return *((unsigned int *)this + 4);
  }
  return v2;
}

void sub_21087BE9C(_Unwind_Exception *a1, int a2)
{
  if (!a2) {
    _Unwind_Resume(a1);
  }
  __clang_call_terminate(a1);
}

void caulk::execution_queue::async_task(unsigned __int8 *a1, uint64_t a2)
{
  v3[31] = *MEMORY[0x263EF8340];
  unsigned __int8 v2 = atomic_load(a1);
  if ((v2 & 1) == 0)
  {
    (*(void (**)(uint64_t, void *))(*(void *)a2 + 8))(a2 + 8, v3);
    operator new();
  }
  _os_assert_log();
  _os_crash();
  __break(1u);
}

void sub_21087BFC8(_Unwind_Exception *a1, int a2)
{
  if (a2) {
    __clang_call_terminate(a1);
  }
  _Unwind_Resume(a1);
}

uint64_t *std::unique_ptr<caulk::execution_queue::async_task(caulk::v1::task<void ()(void)> &&)::$_0,std::default_delete<caulk::v1::task<void ()(void)> &&>>::~unique_ptr[abi:ne180100](uint64_t *a1)
{
  uint64_t v2 = *a1;
  *a1 = 0;
  if (v2)
  {
    (**(void (***)(uint64_t))(v2 + 8))(v2 + 16);
    MEMORY[0x216674B00](v2, 0x1060C40B185B547);
  }
  return a1;
}

uint64_t *applesauce::dispatch::v1::async<caulk::execution_queue::async_task(caulk::v1::task<void ()(void)> &&)::$_0>(dispatch_queue_s *,caulk::execution_queue::async_task(caulk::v1::task<void ()(void)> &&)::$_0 &&)::{lambda(void *)#1}::__invoke(uint64_t *a1)
{
  uint64_t v2 = a1;
  caulk::execution_queue::execute_internal(*a1, (uint64_t)(a1 + 1));
  return std::unique_ptr<caulk::execution_queue::async_task(caulk::v1::task<void ()(void)> &&)::$_0,std::default_delete<caulk::v1::task<void ()(void)> &&>>::~unique_ptr[abi:ne180100]((uint64_t *)&v2);
}

void sub_21087C074(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  std::unique_ptr<caulk::execution_queue::async_task(caulk::v1::task<void ()(void)> &&)::$_0,std::default_delete<caulk::v1::task<void ()(void)> &&>>::~unique_ptr[abi:ne180100]((uint64_t *)va);
  _Unwind_Resume(a1);
}

uint64_t caulk::execution_queue::execute_internal(uint64_t result, uint64_t a2)
{
  unsigned __int8 v2 = atomic_load((unsigned __int8 *)result);
  if ((v2 & 1) == 0) {
    return (*(uint64_t (**)(uint64_t))(*(void *)a2 + 16))(a2 + 8);
  }
  ++*(_DWORD *)(result + 16);
  return result;
}

void sub_21087C104(_Unwind_Exception *a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, long long a9)
{
  if (a2)
  {
    __cxa_begin_catch(a1);
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
    {
      label = dispatch_queue_get_label(*(dispatch_queue_t *)(v9 + 8));
      LODWORD(a9) = 136315138;
      *(void *)((char *)&a9 + 4) = label;
      _os_log_error_impl(&dword_210865000, &_os_log_internal, OS_LOG_TYPE_ERROR, "%s: caught exception", (uint8_t *)&a9, 0xCu);
    }
    __cxa_end_catch();
    JUMPOUT(0x21087C0D8);
  }
  _Unwind_Resume(a1);
}

uint64_t caulk::execution_queue::sync_task(uint64_t a1, uint64_t *a2)
{
  v10[31] = *MEMORY[0x263EF8340];
  unsigned __int8 v2 = atomic_load((unsigned __int8 *)a1);
  if (v2)
  {
    _os_assert_log();
    _os_crash();
    __break(1u);
  }
  uint64_t v4 = *a2;
  uint64_t v8 = a1;
  uint64_t v9 = (uint64_t (**)(void *))v4;
  (*(void (**)(uint64_t *, void *))(v4 + 8))(a2 + 1, v10);
  int v5 = *(NSObject **)(a1 + 8);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 0x40000000;
  block[2] = ___ZN10applesauce8dispatch2v19sync_implIZN5caulk15execution_queue9sync_taskEONS3_2v14taskIFvvEEEE3__0EEvP16dispatch_queue_sOT_NSt3__117integral_constantIbLb1EEE_block_invoke;
  block[3] = &__block_descriptor_tmp_76;
  block[4] = &v8;
  dispatch_sync(v5, block);
  return (*v9)(v10);
}

void sub_21087C26C(_Unwind_Exception *a1, int a2)
{
  if (a2) {
    __clang_call_terminate(a1);
  }
  _Unwind_Resume(a1);
}

uint64_t ___ZN10applesauce8dispatch2v19sync_implIZN5caulk15execution_queue9sync_taskEONS3_2v14taskIFvvEEEE3__0EEvP16dispatch_queue_sOT_NSt3__117integral_constantIbLb1EEE_block_invoke(uint64_t a1)
{
  return caulk::execution_queue::execute_internal(**(void **)(a1 + 32), *(void *)(a1 + 32) + 8);
}

CFTypeRef caulk::xstring::assign(caulk::xstring *this, CFTypeRef cf)
{
  uint64_t v4 = (const void *)*((void *)this + 1);
  if (v4) {
    CFRelease(v4);
  }
  *((void *)this + 1) = cf;

  return CFRetain(cf);
}

void caulk::xstring::clear(caulk::xstring *this)
{
  unsigned __int8 v2 = (const void *)*((void *)this + 1);
  if (v2)
  {
    CFRelease(v2);
    *((void *)this + 1) = 0;
  }
}

CFStringRef caulk::xstring::assign(caulk::xstring *this, const char *cStr)
{
  uint64_t v4 = (const void *)*((void *)this + 1);
  if (v4)
  {
    CFRelease(v4);
    *((void *)this + 1) = 0;
  }
  CFStringRef result = CFStringCreateWithCString((CFAllocatorRef)*MEMORY[0x263EFFB08], cStr, 0x8000100u);
  *((void *)this + 1) = result;
  return result;
}

CFStringRef caulk::xstring::assign(caulk::xstring *this, UInt8 *bytes, CFIndex numBytes)
{
  uint64_t v6 = (const void *)*((void *)this + 1);
  if (v6)
  {
    CFRelease(v6);
    *((void *)this + 1) = 0;
  }
  CFStringRef result = CFStringCreateWithBytes((CFAllocatorRef)*MEMORY[0x263EFFB08], bytes, numBytes, 0x8000100u, 0);
  *((void *)this + 1) = result;
  return result;
}

CFStringRef caulk::xstring::assign(caulk::xstring *a1, UInt8 *a2)
{
  CFIndex v2 = *((void *)a2 + 1);
  if ((a2[23] & 0x80u) == 0)
  {
    CFIndex v3 = a2[23];
  }
  else
  {
    a2 = *(UInt8 **)a2;
    CFIndex v3 = v2;
  }
  return caulk::xstring::assign(a1, a2, v3);
}

CFTypeRef caulk::xstring::assign(caulk::xstring *this, const caulk::xstring *a2)
{
  uint64_t v4 = (const void *)*((void *)this + 1);
  if (v4)
  {
    CFRelease(v4);
    *((void *)this + 1) = 0;
  }
  CFTypeRef result = (CFTypeRef)*((void *)a2 + 1);
  if (result)
  {
    *((void *)this + 1) = result;
    return CFRetain(result);
  }
  return result;
}

void caulk::xstring::move(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(const void **)(a1 + 8);
  if (v4)
  {
    CFRelease(v4);
    *(void *)(a1 + 8) = 0;
  }
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a2 + 8) = 0;
}

uint64_t caulk::xstring::swap(uint64_t this, caulk::xstring *a2)
{
  uint64_t v2 = *(void *)(this + 8);
  *(void *)(this + 8) = *((void *)a2 + 1);
  *((void *)a2 + 1) = v2;
  return this;
}

const char *caulk::xstring::c_str(caulk::xstring *this)
{
  CFStringRef v2 = (const __CFString *)*((void *)this + 1);
  if (!v2) {
    return "";
  }
  CFTypeRef result = CFStringGetCStringPtr(v2, 0x8000100u);
  if (!result)
  {
    id v4 = *((id *)this + 1);
    return (const char *)[v4 UTF8String];
  }
  return result;
}

BOOL caulk::xstring::empty(caulk::xstring *this)
{
  return *caulk::xstring::c_str(this) == 0;
}

size_t caulk::xstring::size(caulk::xstring *this)
{
  uint64_t v1 = caulk::xstring::c_str(this);

  return strlen(v1);
}

CFComparisonResult caulk::xstring::compare(caulk::xstring *this, const caulk::xstring *a2)
{
  CFStringRef v2 = (const __CFString *)*((void *)this + 1);
  CFStringRef v3 = (const __CFString *)*((void *)a2 + 1);
  if (!v2) {
    return (unint64_t)(v3 == 0);
  }
  if (v3) {
    return CFStringCompare(v2, v3, 0);
  }
  return 0;
}

__CFString *caulk::xstring::materialize_cfstring(caulk::xstring *this)
{
  if (*((void *)this + 1)) {
    return (__CFString *)*((void *)this + 1);
  }
  else {
    return &stru_26C2ABE80;
  }
}

uint64_t caulk::details::log_msg::perform(caulk::details::log_msg *this)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  uint64_t v2 = *((void *)this + 3);
  uint64_t v3 = *(void *)(v2 + 32);
  if (*((unsigned char *)this + 22) == 2) {
    uint64_t v4 = -1;
  }
  else {
    uint64_t v4 = 0;
  }
  uint64_t v5 = *(void *)(v2 + 32);
  atomic_compare_exchange_strong((atomic_ullong *volatile)(v2 + 32), (unint64_t *)&v5, (v3 - *((unsigned __int16 *)this + 10)) | (v3 + (v4 << 32)) & 0xFFFFFFFF00000000);
  if (v5 != v3)
  {
    uint64_t v6 = v4 << 32;
    uint64_t v7 = v5;
    do
    {
      atomic_compare_exchange_strong((atomic_ullong *volatile)(v2 + 32), (unint64_t *)&v7, (v5 - *((unsigned __int16 *)this + 10)) | (v5 + v6) & 0xFFFFFFFF00000000);
      BOOL v8 = v7 == v5;
      uint64_t v5 = v7;
    }
    while (!v8);
  }
  os_log_pack_send();
  if (*(_DWORD *)(v2 + 40))
  {
    unsigned int v9 = atomic_exchange((atomic_uint *volatile)(v2 + 40), 0);
    unint64_t v10 = *(NSObject **)(v2 + 24);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v13[0] = 67109120;
      v13[1] = v9;
      _os_log_error_impl(&dword_210865000, v10, OS_LOG_TYPE_ERROR, "%u messages were dropped due to log throttling", (uint8_t *)v13, 8u);
    }
  }
  (**(void (***)(caulk::details::log_msg *))this)(this);
  if (!caulk::g_realtime_safe_resource) {
    __break(1u);
  }
  uint64_t v11 = *(uint64_t (**)(void))(*(void *)caulk::g_realtime_safe_resource + 24);

  return v11();
}

void caulk::details::log_msg::~log_msg(caulk::details::log_msg *this)
{
  *(void *)this = &unk_26C2AA590;
  uint64_t v2 = (std::__shared_weak_count *)*((void *)this + 4);
  if (v2) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v2);
  }
  caulk::concurrent::message::~message(this);

  JUMPOUT(0x216674B00);
}

{
  std::__shared_weak_count *v2;
  uint64_t vars8;

  *(void *)this = &unk_26C2AA590;
  uint64_t v2 = (std::__shared_weak_count *)*((void *)this + 4);
  if (v2) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v2);
  }

  caulk::concurrent::message::~message(this);
}

void caulk::deferred_logger::create_v(caulk::deferred_logger *this, void *a2)
{
}

void sub_21087C9EC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *a16, uint64_t a17, int a18, __int16 a19, char a20,char a21,char a22)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  long long v24 = *(std::__shared_weak_count **)(v22 + 8);
  if (v24) {
    std::__shared_weak_count::__release_weak(v24);
  }
  MEMORY[0x216674B00](v22, 0x10A0C404BBAD8CELL);
  _Unwind_Resume(a1);
}

uint64_t std::default_delete<caulk::deferred_logger>::operator()[abi:ne180100](uint64_t result)
{
  if (result)
  {
    uint64_t v1 = *(std::__shared_weak_count **)(result + 8);
    if (v1) {
      std::__shared_weak_count::__release_weak(v1);
    }
    JUMPOUT(0x216674B00);
  }
  return result;
}

uint64_t std::__shared_ptr_pointer<caulk::deferred_logger *,std::shared_ptr<caulk::deferred_logger>::__shared_ptr_default_delete<caulk::deferred_logger,caulk::deferred_logger>,std::allocator<caulk::deferred_logger>>::__get_deleter(uint64_t a1, uint64_t a2)
{
  if (std::type_info::operator==[abi:ne180100](*(void *)(a2 + 8), (uint64_t)"NSt3__110shared_ptrIN5caulk15deferred_loggerEE27__shared_ptr_default_deleteIS2_S2_EE"))
  {
    return a1 + 24;
  }
  else
  {
    return 0;
  }
}

uint64_t std::__shared_ptr_pointer<caulk::deferred_logger *,std::shared_ptr<caulk::deferred_logger>::__shared_ptr_default_delete<caulk::deferred_logger,caulk::deferred_logger>,std::allocator<caulk::deferred_logger>>::__on_zero_shared(uint64_t a1)
{
  return std::default_delete<caulk::deferred_logger>::operator()[abi:ne180100](*(void *)(a1 + 24));
}

void std::__shared_ptr_pointer<caulk::deferred_logger *,std::shared_ptr<caulk::deferred_logger>::__shared_ptr_default_delete<caulk::deferred_logger,caulk::deferred_logger>,std::allocator<caulk::deferred_logger>>::~__shared_ptr_pointer(std::__shared_weak_count *a1)
{
  std::__shared_weak_count::~__shared_weak_count(a1);

  JUMPOUT(0x216674B00);
}

void caulk::deferred_logger::~deferred_logger(caulk::deferred_logger *this)
{
  uint64_t v1 = (std::__shared_weak_count *)*((void *)this + 1);
  if (v1) {
    std::__shared_weak_count::__release_weak(v1);
  }
}

{
  std::__shared_weak_count *v1;

  uint64_t v1 = (std::__shared_weak_count *)*((void *)this + 1);
  if (v1) {
    std::__shared_weak_count::__release_weak(v1);
  }
}

uint64_t caulk::deferred_logger::create_message(caulk::deferred_logger *this, unint64_t a2, int a3)
{
  if (a2 >= 0x10000)
  {
    exception = __cxa_allocate_exception(8uLL);
    void *exception = &unk_26C2AB618;
  }
  char v3 = a3;
  unsigned __int16 v4 = a2;
  uint64_t v5 = *((void *)this + 4);
  unsigned int v6 = a2 + v5;
  if (a3 == 2) {
    uint64_t v7 = (HIDWORD(v5) + 1);
  }
  else {
    uint64_t v7 = HIDWORD(v5);
  }
  if (v6 > 0x10000 && v7 == 0)
  {
LABEL_16:
    uint64_t v11 = 0;
    atomic_fetch_add((atomic_uint *volatile)this + 10, 1u);
  }
  else
  {
    uint64_t v9 = *((void *)this + 4);
    while (1)
    {
      atomic_compare_exchange_strong((atomic_ullong *volatile)this + 4, (unint64_t *)&v9, v6 | (unint64_t)(v7 << 32));
      if (v9 == v5) {
        break;
      }
      unsigned int v6 = a2 + v9;
      uint64_t v7 = HIDWORD(v9) + (a3 == 2);
      BOOL v10 = (a2 + v9) > 0x10000 && v7 == 0;
      uint64_t v5 = v9;
      if (v10) {
        goto LABEL_16;
      }
    }
    uint64_t v13 = *(void *)this;
    uint64_t v12 = (std::__shared_weak_count *)*((void *)this + 1);
    v18[0] = v13;
    if (!v12 || (uint64_t v14 = std::__shared_weak_count::lock(v12), (v18[1] = v14) == 0)) {
      std::__throw_bad_weak_ptr[abi:ne180100]();
    }
    unint64_t v15 = v14;
    uint64_t v11 = caulk::details::log_msg::create(v18, v4, v3);
    std::__shared_weak_count::__release_shared[abi:ne180100](v15);
  }
  return v11;
}

uint64_t caulk::details::log_msg::create(void *a1, unsigned int a2, char a3)
{
  uint64_t result = caulk::g_realtime_safe_resource;
  if (caulk::g_realtime_safe_resource)
  {
    __int16 v6 = a2;
    uint64_t result = (*(uint64_t (**)(uint64_t, void, uint64_t))(*(void *)caulk::g_realtime_safe_resource + 16))(caulk::g_realtime_safe_resource, a2, 8);
    *(_DWORD *)(result + 16) = 0;
    *(void *)uint64_t result = &unk_26C2AA590;
    *(void *)(result + 8) = 0;
    *(_WORD *)(result + 20) = v6;
    *(unsigned char *)(result + 22) = a3;
    uint64_t v7 = a1[1];
    *(void *)(result + 24) = *a1;
    *(void *)(result + 32) = v7;
    if (v7) {
      atomic_fetch_add_explicit((atomic_ullong *volatile)(v7 + 8), 1uLL, memory_order_relaxed);
    }
  }
  else
  {
    __break(1u);
  }
  return result;
}

void std::__throw_bad_weak_ptr[abi:ne180100]()
{
  exception = __cxa_allocate_exception(8uLL);
  void *exception = MEMORY[0x263F8C2D8] + 16;
  __cxa_throw(exception, MEMORY[0x263F8C198], MEMORY[0x263F8C0A0]);
}

void gsl::narrowing_error::~narrowing_error(std::exception *this)
{
  std::exception::~exception(this);

  JUMPOUT(0x216674B00);
}

uint64_t caulk::xpc::reply_watchdog_factory::reply_watchdog_factory(uint64_t a1, int a2, void *a3)
{
  v9[1] = *MEMORY[0x263EF8340];
  *(unsigned char *)a1 = 0;
  *(_DWORD *)(a1 + 4) = 0;
  *(void *)(a1 + 32) = 0;
  uint64_t v5 = a3 + 3;
  __int16 v6 = (void *)a3[3];
  if (v6)
  {
    if (v6 == a3)
    {
      v9[0] = v8;
      (*(void (**)(void *, void *))(*a3 + 24))(a3, v8);
      goto LABEL_7;
    }
    v9[0] = a3[3];
  }
  else
  {
    uint64_t v5 = v9;
  }
  *uint64_t v5 = 0;
LABEL_7:
  caulk::xpc::reply_watchdog_factory::init2(a1, a2, (uint64_t)v8);
  std::__function::__value_func<void ()(void)>::~__value_func[abi:ne180100](v8);
  return a1;
}

void sub_21087CF10(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10)
{
  if (a2) {
    __clang_call_terminate(exception_object);
  }
  _Unwind_Resume(exception_object);
}

uint64_t ___ZN5caulk3xpc22reply_watchdog_factory10make_timerEi_block_invoke(uint64_t a1)
{
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)unsigned __int16 v4 = 0;
    _os_log_impl(&dword_210865000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "XPC timeout", v4, 2u);
  }
  uint64_t v2 = *(void *)(a1 + 56);
  if (!v2) {
    std::__throw_bad_function_call[abi:ne180100]();
  }
  return (*(uint64_t (**)(uint64_t))(*(void *)v2 + 48))(v2);
}

void applesauce::dispatch::v1::source::~source(id *this)
{
  id v2 = *this;
  *this = 0;
}

void caulk::thread::thread(uint64_t a1, void *a2)
{
  *(void *)a1 = 0;
  *(void *)a1 = *a2;
  *(unsigned char *)(a1 + 8) = 0;
  *a2 = 0;
  id v2 = (unsigned __int8 *)(a2 + 1);
  unsigned __int8 v3 = atomic_load(v2);
  atomic_store(v3 & 1, (unsigned __int8 *)(a1 + 8));
  unsigned __int8 v4 = atomic_load(v2);
  atomic_store(v4 & 1, (unsigned __int8 *)(a1 + 8));
}

{
  unsigned __int8 *v2;
  unsigned __int8 v3;
  unsigned __int8 v4;

  *(void *)a1 = 0;
  *(void *)a1 = *a2;
  *(unsigned char *)(a1 + 8) = 0;
  *a2 = 0;
  id v2 = (unsigned __int8 *)(a2 + 1);
  unsigned __int8 v3 = atomic_load(v2);
  atomic_store(v3 & 1, (unsigned __int8 *)(a1 + 8));
  unsigned __int8 v4 = atomic_load(v2);
  atomic_store(v4 & 1, (unsigned __int8 *)(a1 + 8));
}

void caulk::thread::operator=(unsigned __int8 *a1, unsigned __int8 *a2)
{
  uint64_t v2 = *(void *)a1;
  *(void *)a1 = *(void *)a2;
  *(void *)a2 = v2;
  LOBYTE(v2) = atomic_load(a2 + 8);
  atomic_store(v2 & 1, a1 + 8);
}

void caulk::thread::~thread(caulk::thread *this)
{
  if (*(void *)this) {
    std::terminate();
  }
}

{
  if (*(void *)this) {
    std::terminate();
  }
}

uint64_t caulk::thread::join(pthread_t *this)
{
  if (!*this)
  {
    _os_assert_log();
    _os_crash();
    __break(1u);
    goto LABEL_6;
  }
  if (pthread_self() == *this)
  {
LABEL_6:
    _os_assert_log();
    _os_crash();
    __break(1u);
    goto LABEL_7;
  }
  uint64_t result = pthread_join(*this, 0);
  if (!result)
  {
    *this = 0;
    return result;
  }
LABEL_7:
  _os_assert_log();
  uint64_t result = _os_crash();
  __break(1u);
  return result;
}

uint64_t caulk::thread::detach(_opaque_pthread_t **this)
{
  uint64_t v2 = *this;
  if (v2)
  {
    uint64_t result = pthread_detach(v2);
    if (!result)
    {
      *this = 0;
      return result;
    }
  }
  else
  {
    _os_assert_log();
    _os_crash();
    __break(1u);
  }
  _os_assert_log();
  uint64_t result = _os_crash();
  __break(1u);
  return result;
}

void caulk::mach::os_eventlink::make(void **a1@<X8>)
{
  uint64_t v2 = (void *)os_eventlink_create();
  if (v2)
  {
    if (os_eventlink_activate())
    {
      os_release(v2);
      uint64_t v2 = 0;
    }
    std::this_thread::sleep_for[abi:ne180100]<long long,std::ratio<1l,1000l>>(1);
    *a1 = caulk::mach::details::retain_os_object(v2, v3);
    caulk::mach::details::release_os_object((caulk::mach::details *)v2, v4);
  }
  else
  {
    *a1 = 0;
  }
}

void caulk::mach::os_eventlink::make(void *a1@<X8>)
{
  uint64_t v2 = (void *)os_eventlink_create_with_port();
  if (v2 && os_eventlink_activate())
  {
    os_release(v2);
    uint64_t v2 = 0;
  }
  *a1 = v2;
}

uint64_t caulk::mach::os_eventlink::copy_mach_port(caulk::mach::os_eventlink *this)
{
  uint64_t result = *(void *)this;
  if (result)
  {
    if (os_eventlink_extract_remote_port()) {
      return 0;
    }
    else {
      return 0;
    }
  }
  return result;
}

uint64_t caulk::mach::os_eventlink::associate(caulk::mach::os_eventlink *this)
{
  if (*(void *)this) {
    return os_eventlink_associate();
  }
  else {
    return 22;
  }
}

uint64_t caulk::mach::os_eventlink::dissociate(caulk::mach::os_eventlink *this)
{
  if (*(void *)this) {
    return os_eventlink_disassociate();
  }
  else {
    return 22;
  }
}

uint64_t caulk::mach::os_eventlink::signal_or_error(caulk::mach::os_eventlink *this)
{
  if (*(void *)this)
  {
    __dmb(0xBu);
    int v1 = os_eventlink_signal();
    uint64_t v2 = 0x100000000;
    unsigned int v3 = v1 & 0xFFFFFF00;
    int v4 = v1;
    if (v1) {
      uint64_t v2 = 0;
    }
    else {
      int v4 = 0;
    }
    if (!v1) {
      unsigned int v3 = 0;
    }
  }
  else
  {
    uint64_t v2 = 0;
    unsigned int v3 = 0;
    int v4 = 22;
  }
  return v2 | v3 | v4;
}

uint64_t caulk::mach::os_eventlink::wait_or_error(caulk::mach::os_eventlink *this)
{
  if (*(void *)this)
  {
    int v1 = os_eventlink_wait();
    if (v1)
    {
      uint64_t v2 = 0;
      unsigned int v3 = v1 & 0xFFFFFF00;
    }
    else
    {
      unsigned int v3 = 0;
      __dmb(9u);
      uint64_t v2 = 0x100000000;
    }
    int v4 = v1;
  }
  else
  {
    uint64_t v2 = 0;
    unsigned int v3 = 0;
    int v4 = 22;
  }
  return v2 & 0x100000000 | v3 & 0xFFFFFF00 | v4;
}

uint64_t caulk::mach::os_eventlink::timed_wait_or_error(caulk::mach::os_eventlink *this, double a2)
{
  if (*(void *)this)
  {
    int v2 = os_eventlink_wait_until();
    if (v2 && v2 != 60)
    {
      uint64_t v4 = 0;
      unsigned int v3 = v2 & 0xFFFFFF00;
    }
    else
    {
      unsigned int v3 = 0;
      __dmb(9u);
      LOBYTE(v2) = 0;
      uint64_t v4 = 0x100000000;
    }
  }
  else
  {
    uint64_t v4 = 0;
    unsigned int v3 = 0;
    LOBYTE(v2) = 22;
  }
  return v4 & 0x100000000 | v3 & 0xFFFFFF00 | v2;
}

uint64_t caulk::mach::os_eventlink::wait_signal_or_error(caulk::mach::os_eventlink *this)
{
  if (*(void *)this)
  {
    __dmb(0xBu);
    int v1 = os_eventlink_signal_and_wait();
    if (v1)
    {
      uint64_t v2 = 0;
      unsigned int v3 = v1 & 0xFFFFFF00;
    }
    else
    {
      unsigned int v3 = 0;
      __dmb(9u);
      uint64_t v2 = 0x100000000;
    }
    int v4 = v1;
  }
  else
  {
    uint64_t v2 = 0;
    unsigned int v3 = 0;
    int v4 = 22;
  }
  return v2 & 0x100000000 | v3 & 0xFFFFFF00 | v4;
}

uint64_t caulk::mach::os_eventlink::timed_wait_signal_or_error(caulk::mach::os_eventlink *this, double a2)
{
  if (*(void *)this)
  {
    __dmb(0xBu);
    int v2 = os_eventlink_signal_and_wait_until();
    if (v2 && v2 != 60)
    {
      uint64_t v4 = 0;
      unsigned int v3 = v2 & 0xFFFFFF00;
    }
    else
    {
      unsigned int v3 = 0;
      __dmb(9u);
      LOBYTE(v2) = 0;
      uint64_t v4 = 0x100000000;
    }
  }
  else
  {
    uint64_t v4 = 0;
    unsigned int v3 = 0;
    LOBYTE(v2) = 22;
  }
  return v4 & 0x100000000 | v3 & 0xFFFFFF00 | v2;
}

unint64_t caulk::pooled_semaphore_mutex::_try_lock_for (caulk::pooled_semaphore_mutex *this, double a2)
{
  double v3 = a2;
  return caulk::pooled_semaphore_mutex::lock_impl((unint64_t)this, &v3);
}

caulk::ipc::mapped_memory *caulk::ipc::mapped_memory::mapped_memory(caulk::ipc::mapped_memory *this, uint64_t a2, int a3)
{
  size_t v5 = (a2 + 0x3FFF) & 0xFFFFFFFFFFFFC000;
  if (a3) {
    int v6 = a3 << 24;
  }
  else {
    int v6 = -1;
  }
  uint64_t v7 = mmap(0, (a2 + 0x3FFF) & 0xFFFFFFFFFFFFC000, 3, 4097, v6, 0);
  *(void *)this = v7;
  *((void *)this + 1) = v5;
  *((unsigned char *)this + 16) = 1;
  if (!a2)
  {
    _os_assert_log();
    _os_crash();
    __break(1u);
LABEL_8:
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::runtime_error::runtime_error(exception, "failed to create shared memory");
    __cxa_throw(exception, MEMORY[0x263F8C1F0], MEMORY[0x263F8C070]);
  }
  if ((unint64_t)v7 + 1 <= 1) {
    goto LABEL_8;
  }
  bzero(v7, v5);
  return this;
}

void sub_21087D6C8(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void *caulk::ipc::mapped_memory::create_xpc_object@<X0>(caulk::ipc::mapped_memory *this@<X0>, void *a2@<X8>)
{
  if (*((unsigned char *)this + 16))
  {
    uint64_t result = *(void **)this;
    if (result)
    {
      size_t v5 = *((void *)this + 1);
      if (v5) {
        uint64_t result = xpc_shmem_create(result, v5);
      }
      else {
        uint64_t result = 0;
      }
    }
    *a2 = result;
  }
  else
  {
    _os_assert_log();
    uint64_t result = (void *)_os_crash();
    __break(1u);
  }
  return result;
}

uint64_t caulk::mach::vm_block::alloc_at(caulk::mach::vm_block *this)
{
  return 0;
}

void caulk::mach::vm_block::dealloc(caulk::mach::vm_block *this, size_t a2)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  int v2 = munmap(this, a2);
  if (v2)
  {
    int v3 = v2;
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
    {
      v4[0] = 67109120;
      v4[1] = v3;
      _os_log_error_impl(&dword_210865000, &_os_log_internal, OS_LOG_TYPE_ERROR, "munmap failed! %d", (uint8_t *)v4, 8u);
    }
  }
}

const void *caulk::mach::vm_block::lock(const void *this, size_t a2)
{
  if (this && a2)
  {
    int v2 = (const char *)mlock(this, a2);
    return (const void *)caulk::mach::throw_if_mach_error((uint64_t)"mlock failed", v2);
  }
  return this;
}

const void *caulk::mach::vm_block::unlock(const void *this, size_t a2)
{
  if (this && a2)
  {
    int v2 = (const char *)munlock(this, a2);
    return (const void *)caulk::mach::throw_if_mach_error((uint64_t)"munlock failed", v2);
  }
  return this;
}

caulk::mach::vm_block *caulk::mach::vm_block::vm_block(caulk::mach::vm_block *this, size_t a2)
{
  *(void *)this = (a2 + *MEMORY[0x263EF8AF8] - 1) & -*MEMORY[0x263EF8AF8];
  *((void *)this + 1) = caulk::mach::vm_block::alloc(a2, 0);
  return this;
}

{
  *(void *)this = (a2 + *MEMORY[0x263EF8AF8] - 1) & -*MEMORY[0x263EF8AF8];
  *((void *)this + 1) = caulk::mach::vm_block::alloc(a2, 0);
  return this;
}

caulk::mach::vm_block *caulk::mach::vm_block::vm_block(caulk::mach::vm_block *this, size_t a2, int a3)
{
  *(void *)this = (a2 + *MEMORY[0x263EF8AF8] - 1) & -*MEMORY[0x263EF8AF8];
  *((void *)this + 1) = caulk::mach::vm_block::alloc(a2, a3);
  return this;
}

{
  *(void *)this = (a2 + *MEMORY[0x263EF8AF8] - 1) & -*MEMORY[0x263EF8AF8];
  *((void *)this + 1) = caulk::mach::vm_block::alloc(a2, a3);
  return this;
}

void *caulk::mach::vm_block::vm_block(void *result, uint64_t *a2)
{
  uint64_t v2 = *a2;
  uint64_t v3 = a2[1];
  *a2 = 0;
  a2[1] = 0;
  *uint64_t result = v2;
  result[1] = v3;
  return result;
}

{
  uint64_t v2;
  uint64_t v3;

  uint64_t v2 = *a2;
  uint64_t v3 = a2[1];
  *a2 = 0;
  a2[1] = 0;
  *uint64_t result = v2;
  result[1] = v3;
  return result;
}

uint64_t *caulk::mach::vm_block::operator=(uint64_t *result, uint64_t *a2)
{
  uint64_t v3 = *result;
  uint64_t v2 = result[1];
  uint64_t v4 = a2[1];
  *uint64_t result = *a2;
  result[1] = v4;
  *a2 = v3;
  a2[1] = v2;
  return result;
}

void caulk::mach::vm_block::destroy(caulk::mach::vm_block *this)
{
  uint64_t v2 = (caulk::mach::vm_block *)*((void *)this + 1);
  if (v2)
  {
    caulk::mach::vm_block::dealloc(v2, *(void *)this);
    *(void *)this = 0;
    *((void *)this + 1) = 0;
  }
}

void caulk::mach::vm_block::~vm_block(caulk::mach::vm_block *this)
{
  uint64_t v2 = (caulk::mach::vm_block *)*((void *)this + 1);
  if (v2)
  {
    caulk::mach::vm_block::dealloc(v2, *(void *)this);
    *(void *)this = 0;
    *((void *)this + 1) = 0;
  }
}

double caulk::mach::vm_scanner::vm_scanner(caulk::mach::vm_scanner *this, uint64_t a2)
{
  *(void *)this = a2;
  double result = 0.0;
  *(_OWORD *)((char *)this + 8) = 0u;
  *(_OWORD *)((char *)this + 24) = 0u;
  *(_OWORD *)((char *)this + 40) = 0u;
  *((_DWORD *)this + 14) = 0;
  return result;
}

{
  double result;

  *(void *)this = a2;
  double result = 0.0;
  *(_OWORD *)((char *)this + 8) = 0u;
  *(_OWORD *)((char *)this + 24) = 0u;
  *(_OWORD *)((char *)this + 40) = 0u;
  *((_DWORD *)this + 14) = 0;
  return result;
}

void *caulk::mach::vm_scanner::next_region(caulk::mach::vm_scanner *this)
{
  kern_return_t v4;
  mach_port_t object_name;
  mach_msg_type_number_t infoCnt;

  *((void *)this + 1) = *(void *)this;
  uint64_t v2 = (void *)((char *)this + 8);
  *((void *)this + 2) = 0;
  uint64_t v3 = (void *)((char *)this + 16);
  object_name = 0;
  infoCnt = 9;
  uint64_t v4 = vm_region_64(*MEMORY[0x263EF8960], (vm_address_t *)this + 1, (vm_size_t *)this + 2, 13, (vm_region_info_t)this + 6, &infoCnt, &object_name);
  *(void *)this = *v3 + *v2;
  if (v4) {
    return 0;
  }
  else {
    return v2;
  }
}

caulk::mach *caulk::mach::find_unused_vm_address_range(caulk::mach *this, uint64_t a2)
{
  uint64_t v3 = this;
  uint64_t v7 = this;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  int v11 = 0;
  while (1)
  {
    region = caulk::mach::vm_scanner::next_region((caulk::mach::vm_scanner *)&v7);
    if (!region) {
      break;
    }
    unint64_t v5 = *region;
    if (v3)
    {
      if (v5 >= (unint64_t)v3 + a2) {
        break;
      }
    }
    uint64_t v3 = (caulk::mach *)(region[1] + v5);
  }
  return v3;
}

char *caulk::concurrent::messenger::shared_logging_priority(caulk::concurrent::messenger *this)
{
  {
    caulk::concurrent::messenger::shared_logging_priority(void)::global = 0;
    byte_26AA52D78 = 0;
    qword_26AA52D80 = 21;
    dword_26AA52D90 = 0;
    byte_26AA52D94 = 1;
    byte_26AA52D98 = 0;
    byte_26AA52D9C = 0;
  }
  return &caulk::concurrent::messenger::shared_logging_priority(void)::global;
}

void caulk::concurrent::details::service_thread::service_thread(caulk::concurrent::details::service_thread *this, const caulk::thread::attributes *a2)
{
  *(void *)this = &unk_26C2AB668;
  *((unsigned char *)this + 8) = 0;
  *((unsigned char *)this + 24) = 0;
  caulk::mach::semaphore::semaphore((semaphore_t *)this + 8);
  *((void *)this + 16) = 0;
  *((void *)this + 5) = 0;
  *((_WORD *)this + 24) = 0;
  *(void *)this = &unk_26C2AB690;
  *((void *)this + 7) = &unk_26C2AB6C8;
  *((void *)this + 8) = 0;
  std::__optional_copy_base<std::string,false>::__optional_copy_base[abi:ne180100]((std::string *)((char *)this + 136), (long long *)a2);
  long long v4 = *((_OWORD *)a2 + 2);
  *(_OWORD *)((char *)this + 181) = *(_OWORD *)((char *)a2 + 45);
  *(_OWORD *)((char *)this + 168) = v4;
  uint64_t v5 = 0;
  char v6 = 0;
  operator new();
}

void std::vector<std::weak_ptr<caulk::lifetime_observed<std::unique_ptr<caulk::concurrent::details::service_thread>,caulk::shared_instance_manager<caulk::concurrent::details::service_thread>::observer>>>::__throw_length_error[abi:ne180100]()
{
}

void std::__throw_bad_array_new_length[abi:ne180100]()
{
  exception = (std::bad_array_new_length *)__cxa_allocate_exception(8uLL);
  int v1 = std::bad_array_new_length::bad_array_new_length(exception);
  __cxa_throw(v1, MEMORY[0x263F8C208], MEMORY[0x263F8C090]);
}

void std::__shared_ptr_emplace<caulk::lifetime_observed<std::unique_ptr<caulk::concurrent::details::service_thread>,caulk::shared_instance_manager<caulk::concurrent::details::service_thread>::observer>>::__on_zero_shared(void *a1)
{
  uint64_t v2 = a1[6];
  if (os_unfair_lock_trylock((os_unfair_lock_t)v2))
  {
    uint64_t v3 = std::remove_if[abi:ne180100]<std::__wrap_iter<std::weak_ptr<caulk::lifetime_observed<std::unique_ptr<caulk::concurrent::details::service_thread>,caulk::shared_instance_manager<caulk::concurrent::details::service_thread>::observer>> *>,caulk::shared_instance_manager<caulk::concurrent::details::service_thread>::remove_expired(void)::{lambda(std::__wrap_iter<std::weak_ptr<caulk::lifetime_observed<std::unique_ptr<caulk::concurrent::details::service_thread>,caulk::shared_instance_manager<caulk::concurrent::details::service_thread>::observer>> *> const&)#1}>(*(uint64_t **)(v2 + 8), *(uint64_t **)(v2 + 16));
    std::vector<std::weak_ptr<caulk::lifetime_observed<std::unique_ptr<caulk::concurrent::details::service_thread>,caulk::shared_instance_manager<caulk::concurrent::details::service_thread>::observer>>>::erase(v2 + 8, (uint64_t)v3, *(void *)(v2 + 16));
    os_unfair_lock_unlock((os_unfair_lock_t)v2);
  }
  uint64_t v4 = a1[5];
  a1[5] = 0;
  if (v4) {
    (*(void (**)(uint64_t))(*(void *)v4 + 8))(v4);
  }
  uint64_t v5 = (std::__shared_weak_count *)a1[4];
  if (v5)
  {
    std::__shared_weak_count::__release_weak(v5);
  }
}

void std::__shared_ptr_emplace<caulk::lifetime_observed<std::unique_ptr<caulk::concurrent::details::service_thread>,caulk::shared_instance_manager<caulk::concurrent::details::service_thread>::observer>>::~__shared_ptr_emplace(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)&unk_26C2ABCF8;
  std::__shared_weak_count::~__shared_weak_count(a1);

  JUMPOUT(0x216674B00);
}

void std::__shared_ptr_emplace<caulk::lifetime_observed<std::unique_ptr<caulk::concurrent::details::service_thread>,caulk::shared_instance_manager<caulk::concurrent::details::service_thread>::observer>>::~__shared_ptr_emplace(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&unk_26C2ABCF8;
  std::__shared_weak_count::~__shared_weak_count(this);
}

std::string *std::__optional_copy_base<std::string,false>::__optional_copy_base[abi:ne180100](std::string *this, long long *a2)
{
  this->__r_.__value_.__s.__data_[0] = 0;
  this[1].__r_.__value_.__s.__data_[0] = 0;
  if (*((unsigned char *)a2 + 24))
  {
    if (*((char *)a2 + 23) < 0)
    {
      std::string::__init_copy_ctor_external(this, *(const std::string::value_type **)a2, *((void *)a2 + 1));
    }
    else
    {
      long long v3 = *a2;
      this->__r_.__value_.__r.__words[2] = *((void *)a2 + 2);
      *(_OWORD *)&this->__r_.__value_.__l.__data_ = v3;
    }
    this[1].__r_.__value_.__s.__data_[0] = 1;
  }
  return this;
}

void sub_21087E040(_Unwind_Exception *exception_object)
{
  if (*(unsigned char *)(v1 + 24))
  {
    if (*(char *)(v1 + 23) < 0) {
      operator delete(*(void **)v1);
    }
  }
  _Unwind_Resume(exception_object);
}

void caulk::concurrent::details::worker_thread::~worker_thread(caulk::concurrent::details::worker_thread *this)
{
  *(void *)this = &unk_26C2AB668;
  caulk::semaphore::~semaphore((caulk::concurrent::details::worker_thread *)((char *)this + 32));
  if (*((unsigned char *)this + 24))
  {
    if (*((void *)this + 1)) {
      std::terminate();
    }
  }
}

uint64_t std::default_delete<std::tuple<caulk::thread::attributes,void (caulk::concurrent::details::worker_thread::*)(void),std::tuple<caulk::concurrent::details::worker_thread*>>>::operator()[abi:ne180100](uint64_t result)
{
  if (result)
  {
    if (*(unsigned char *)(result + 24) && *(char *)(result + 23) < 0) {
      operator delete(*(void **)result);
    }
    JUMPOUT(0x216674B00);
  }
  return result;
}

uint64_t caulk::thread_proxy<std::tuple<caulk::thread::attributes,void (caulk::concurrent::details::worker_thread::*)(void),std::tuple<caulk::concurrent::details::worker_thread*>>>(void *a1)
{
  caulk::thread::attributes::apply_to_this_thread((uint64_t)a1);
  uint64_t v2 = a1[9];
  long long v3 = (void (*)(void *))a1[8];
  uint64_t v4 = (void *)(a1[10] + (v2 >> 1));
  if (v2) {
    long long v3 = *(void (**)(void *))(*v4 + v3);
  }
  v3(v4);
  std::default_delete<std::tuple<caulk::thread::attributes,void (caulk::concurrent::details::worker_thread::*)(void),std::tuple<caulk::concurrent::details::worker_thread*>>>::operator()[abi:ne180100]((uint64_t)a1);
  return 0;
}

void sub_21087E1A0(_Unwind_Exception *a1)
{
  std::default_delete<std::tuple<caulk::thread::attributes,void (caulk::concurrent::details::worker_thread::*)(void),std::tuple<caulk::concurrent::details::worker_thread*>>>::operator()[abi:ne180100](v1);
  _Unwind_Resume(a1);
}

void non-virtual thunk to'caulk::concurrent::details::service_thread::~service_thread(caulk::concurrent::details::service_thread *this)
{
  caulk::concurrent::details::service_thread::~service_thread((caulk::concurrent::details::service_thread *)((char *)this - 56));

  JUMPOUT(0x216674B00);
}

{
  caulk::concurrent::details::service_thread::~service_thread((caulk::concurrent::details::service_thread *)((char *)this - 56));
}

void caulk::concurrent::details::service_thread::~service_thread(caulk::concurrent::details::service_thread *this)
{
  *(void *)this = &unk_26C2AB690;
  *((void *)this + 7) = &unk_26C2AB6C8;
  caulk::concurrent::details::messenger_servicer::drain((atomic_ullong *)this + 7);
  unsigned __int8 v2 = atomic_load((unsigned __int8 *)this + 48);
  if ((v2 & 1) == 0)
  {
    atomic_store(1u, (unsigned __int8 *)this + 49);
    if ((atomic_fetch_add_explicit((atomic_uint *volatile)this + 10, 1u, memory_order_release) & 0x80000000) != 0) {
      MEMORY[0x2166752E0](*((unsigned int *)this + 8));
    }
  }
  if (*((unsigned char *)this + 24) && *((void *)this + 1)) {
    caulk::thread::join((pthread_t *)this + 1);
  }
  if (*((unsigned char *)this + 160) && *((char *)this + 159) < 0) {
    operator delete(*((void **)this + 17));
  }

  caulk::concurrent::details::worker_thread::~worker_thread(this);
}

{
  uint64_t vars8;

  caulk::concurrent::details::service_thread::~service_thread(this);

  JUMPOUT(0x216674B00);
}

void caulk::concurrent::details::rt_message_call<caulk::concurrent::details::messenger_servicer::drain(void)::{lambda(void)#1} &&>::~rt_message_call(caulk::concurrent::message *a1)
{
  caulk::concurrent::message::~message(a1);

  JUMPOUT(0x216674B00);
}

uint64_t caulk::concurrent::details::service_thread::messenger_is_terminating_with_error(caulk::concurrent::details::service_thread *this)
{
  unsigned __int8 v1 = atomic_load((unsigned __int8 *)this + 48);
  return v1 & 1;
}

uint64_t caulk::concurrent::details::service_thread::messenger_signal_wakeup(uint64_t this)
{
  if ((atomic_fetch_add_explicit((atomic_uint *volatile)(this + 40), 1u, memory_order_release) & 0x80000000) != 0) {
    JUMPOUT(0x2166752E0);
  }
  return this;
}

BOOL std::__variant_detail::__visitation::__base::__dispatcher<2ul,2ul>::__dispatch[abi:ne180100]<std::__variant_detail::__visitation::__variant::__value_visitor<std::__convert_to_BOOL<std::equal_to<void>>> &&,std::__variant_detail::__base<(std::__variant_detail::_Trait)0,caulk::mach::thread::priority_qos,caulk::mach::priority_realtime,caulk::mach::priority_absolute> const&,std::__variant_detail::__base<(std::__variant_detail::_Trait)0,caulk::mach::thread::priority_qos,caulk::mach::priority_realtime,caulk::mach::priority_absolute> const>(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return *(_DWORD *)a2 == *(_DWORD *)a3 && *(unsigned __int8 *)(a2 + 4) == *(unsigned __int8 *)(a3 + 4);
}

BOOL std::__variant_detail::__visitation::__base::__dispatcher<1ul,1ul>::__dispatch[abi:ne180100]<std::__variant_detail::__visitation::__variant::__value_visitor<std::__convert_to_BOOL<std::equal_to<void>>> &&,std::__variant_detail::__base<(std::__variant_detail::_Trait)0,caulk::mach::thread::priority_qos,caulk::mach::priority_realtime,caulk::mach::priority_absolute> const&,std::__variant_detail::__base<(std::__variant_detail::_Trait)0,caulk::mach::thread::priority_qos,caulk::mach::priority_realtime,caulk::mach::priority_absolute> const>(uint64_t a1, void *a2, void *a3)
{
  return *a2 == *a3 && a2[1] == a3[1];
}

BOOL std::__variant_detail::__visitation::__base::__dispatcher<2ul,2ul>::__dispatch[abi:ne180100]<std::__variant_detail::__visitation::__variant::__value_visitor<std::__convert_to_BOOL<std::not_equal_to<void>>> &&,std::__variant_detail::__base<(std::__variant_detail::_Trait)0,caulk::mach::thread::priority_qos,caulk::mach::priority_realtime,caulk::mach::priority_absolute> const&,std::__variant_detail::__base<(std::__variant_detail::_Trait)0,caulk::mach::thread::priority_qos,caulk::mach::priority_realtime,caulk::mach::priority_absolute> const>(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return *(_DWORD *)a2 != *(_DWORD *)a3 || *(unsigned __int8 *)(a2 + 4) != *(unsigned __int8 *)(a3 + 4);
}

BOOL std::__variant_detail::__visitation::__base::__dispatcher<1ul,1ul>::__dispatch[abi:ne180100]<std::__variant_detail::__visitation::__variant::__value_visitor<std::__convert_to_BOOL<std::not_equal_to<void>>> &&,std::__variant_detail::__base<(std::__variant_detail::_Trait)0,caulk::mach::thread::priority_qos,caulk::mach::priority_realtime,caulk::mach::priority_absolute> const&,std::__variant_detail::__base<(std::__variant_detail::_Trait)0,caulk::mach::thread::priority_qos,caulk::mach::priority_realtime,caulk::mach::priority_absolute> const>(uint64_t a1, _DWORD *a2, _DWORD *a3)
{
  return *a2 != *a3 || a2[1] != a3[1] || a2[2] != a3[2] || a2[3] != a3[3];
}

BOOL std::__variant_detail::__visitation::__base::__dispatcher<0ul,0ul>::__dispatch[abi:ne180100]<std::__variant_detail::__visitation::__variant::__value_visitor<std::__convert_to_BOOL<std::not_equal_to<void>>> &&,std::__variant_detail::__base<(std::__variant_detail::_Trait)0,caulk::mach::thread::priority_qos,caulk::mach::priority_realtime,caulk::mach::priority_absolute> const&,std::__variant_detail::__base<(std::__variant_detail::_Trait)0,caulk::mach::thread::priority_qos,caulk::mach::priority_realtime,caulk::mach::priority_absolute> const>(uint64_t a1, _DWORD *a2, _DWORD *a3)
{
  return *a2 != *a3 || a2[1] != a3[1];
}

uint64_t std::__shared_ptr_emplace<caulk::concurrent::details::service_thread>::__on_zero_shared(uint64_t a1)
{
  return (**(uint64_t (***)(void))(a1 + 24))();
}

void std::__shared_ptr_emplace<caulk::concurrent::details::service_thread>::~__shared_ptr_emplace(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)&unk_26C2ABC88;
  std::__shared_weak_count::~__shared_weak_count(a1);

  JUMPOUT(0x216674B00);
}

void std::__shared_ptr_emplace<caulk::concurrent::details::service_thread>::~__shared_ptr_emplace(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&unk_26C2ABC88;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void *caulk::concurrent::messenger::messenger(void *a1, dispatch_object_t *a2)
{
  *a1 = 0;
  a1[1] = 0;
  uint64_t v4 = (char *)operator new(0x88uLL);
  *((void *)v4 + 1) = 0;
  *((void *)v4 + 2) = 0;
  *(void *)uint64_t v4 = &unk_26C2ABCC0;
  dispatch_object_t v5 = *a2;
  if (*a2) {
    dispatch_retain(*a2);
  }
  *((_DWORD *)v4 + 28) = 0;
  char v6 = (mach_port_name_t *)(v4 + 112);
  *((void *)v4 + 12) = 0;
  *((void *)v4 + 13) = v5;
  *((void *)v4 + 3) = &unk_26C2AB720;
  *((void *)v4 + 4) = 0;
  *((void *)v4 + 15) = 0;
  v4[128] = 0;
  uint64_t v7 = (ipc_space_t *)MEMORY[0x263EF8960];
  long long v8 = (const char *)mach_port_allocate(*MEMORY[0x263EF8960], 1u, (mach_port_name_t *)v4 + 28);
  caulk::mach::throw_if_mach_error((uint64_t)"mach_port_allocate failed", v8);
  inserted = (const char *)mach_port_insert_right(*v7, *v6, *v6, 0x14u);
  if (inserted)
  {
    mach_port_mod_refs(*v7, *v6, 1u, -1);
    *char v6 = 0;
    caulk::mach::throw_if_mach_error((uint64_t)"mach_port_insert_right failed", inserted);
  }
  long long v10 = dispatch_source_create(MEMORY[0x263EF83C8], *((unsigned int *)v4 + 28), 0, *((dispatch_queue_t *)v4 + 13));
  int v11 = *((void *)v4 + 15);
  *((void *)v4 + 15) = v10;
  if (v11)
  {
    dispatch_release(v11);
    long long v10 = *((void *)v4 + 15);
  }
  handler[0] = MEMORY[0x263EF8330];
  handler[1] = 0x40000000;
  handler[2] = ___ZN5caulk10concurrent7details17dispatch_receiverC2EN10applesauce8dispatch2v15queueE_block_invoke;
  handler[3] = &__block_descriptor_tmp_123;
  void handler[4] = v4 + 24;
  dispatch_source_set_event_handler(v10, handler);
  dispatch_resume(*((dispatch_object_t *)v4 + 15));
  atomic_fetch_add_explicit((atomic_ullong *volatile)v4 + 1, 1uLL, memory_order_relaxed);
  uint64_t v12 = (std::__shared_weak_count *)a1[1];
  *a1 = v4 + 24;
  a1[1] = v4;
  if (v12) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v12);
  }
  caulk::alloc::init_realtime_safe_resource((caulk::alloc *)v12);
  std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)v4);
  return a1;
}

void sub_21087E694(_Unwind_Exception *a1)
{
  std::__shared_weak_count::__release_shared[abi:ne180100](v2);
  uint64_t v4 = *(std::__shared_weak_count **)(v1 + 8);
  if (v4) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v4);
  }
  _Unwind_Resume(a1);
}

uint64_t caulk::concurrent::details::dispatch_receiver::messenger_is_terminating_with_error(caulk::concurrent::details::dispatch_receiver *this)
{
  return 0;
}

void caulk::concurrent::details::dispatch_receiver::~dispatch_receiver(caulk::concurrent::details::dispatch_receiver *this)
{
  caulk::concurrent::details::dispatch_receiver::~dispatch_receiver(this);

  JUMPOUT(0x216674B00);
}

{
  ipc_space_t *v2;
  NSObject *v3;
  NSObject *v4;

  *(void *)this = &unk_26C2AB720;
  dispatch_source_cancel(*((dispatch_source_t *)this + 12));
  dispatch_sync(*((dispatch_queue_t *)this + 10), &__block_literal_global);
  unsigned __int8 v2 = (ipc_space_t *)MEMORY[0x263EF8960];
  mach_port_mod_refs(*MEMORY[0x263EF8960], *((_DWORD *)this + 22), 1u, -1);
  mach_port_deallocate(*v2, *((_DWORD *)this + 22));
  long long v3 = *((void *)this + 12);
  if (v3) {
    dispatch_release(v3);
  }
  uint64_t v4 = *((void *)this + 10);
  if (v4) {
    dispatch_release(v4);
  }
}

uint64_t std::__shared_ptr_emplace<caulk::concurrent::details::dispatch_receiver>::__on_zero_shared(uint64_t a1)
{
  return (**(uint64_t (***)(void))(a1 + 24))();
}

void std::__shared_ptr_emplace<caulk::concurrent::details::dispatch_receiver>::~__shared_ptr_emplace(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)&unk_26C2ABCC0;
  std::__shared_weak_count::~__shared_weak_count(a1);

  JUMPOUT(0x216674B00);
}

void std::__shared_ptr_emplace<caulk::concurrent::details::dispatch_receiver>::~__shared_ptr_emplace(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&unk_26C2ABCC0;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void caulk::concurrent::messenger::~messenger(atomic_ullong **this)
{
  caulk::concurrent::details::messenger_servicer::drain(*this);
  unsigned __int8 v2 = (std::__shared_weak_count *)this[1];
  if (v2) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v2);
  }
}

void caulk::ipc::synchronous_messenger::semaphore_sender::create_connection_info(caulk::ipc::synchronous_messenger::semaphore_sender *this@<X0>, void *a2@<X8>)
{
  xpc_object_t v4 = xpc_dictionary_create(0, 0, 0);
  *a2 = v4;
  if (!v4)
  {
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::runtime_error::runtime_error(exception, "failed to allocate dictionary");
    __cxa_throw(exception, MEMORY[0x263F8C1F0], MEMORY[0x263F8C070]);
  }
  caulk::ipc::mapped_memory::create_xpc_object(this, &value);
  dispatch_object_t v5 = (caulk::mach::details *)value;
  if (!value)
  {
    uint64_t v12 = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::runtime_error::runtime_error(v12, "failed to create payload object");
    __cxa_throw(v12, MEMORY[0x263F8C1F0], MEMORY[0x263F8C070]);
  }
  xpc_dictionary_set_value(v4, "payload", value);
  caulk::ipc::mapped_memory::create_xpc_object((caulk::ipc::synchronous_messenger::semaphore_sender *)((char *)this + 24), &v16);
  char v6 = (caulk::mach::details *)v16;
  if (!v16)
  {
    uint64_t v13 = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::runtime_error::runtime_error(v13, "failed to create control object");
    __cxa_throw(v13, MEMORY[0x263F8C1F0], MEMORY[0x263F8C070]);
  }
  xpc_dictionary_set_value(v4, "control", v16);
  uint64_t v7 = (void *)xpc_mach_send_create();
  if (!v7)
  {
    uint64_t v14 = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::runtime_error::runtime_error(v14, "failed to create send semaphore object");
    __cxa_throw(v14, MEMORY[0x263F8C1F0], MEMORY[0x263F8C070]);
  }
  xpc_dictionary_set_value(v4, "send semaphore", v7);
  long long v8 = (void *)xpc_mach_send_create();
  if (!v8)
  {
    unint64_t v15 = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::runtime_error::runtime_error(v15, "failed to create receive semaphore object");
    __cxa_throw(v15, MEMORY[0x263F8C1F0], MEMORY[0x263F8C070]);
  }
  xpc_dictionary_set_value(v4, "receive semaphore", v8);
  os_release(v8);
  os_release(v7);
  caulk::mach::details::release_os_object(v6, v9);

  caulk::mach::details::release_os_object(v5, v10);
}

void sub_21087EAF8(_Unwind_Exception *a1)
{
  __cxa_free_exception(v5);
  caulk::mach::details::release_os_object(v4, v7);
  caulk::mach::details::release_os_object(v3, v8);
  caulk::mach::details::release_os_object(v2, v9);
  caulk::mach::details::release_os_object(v1, v10);
  _Unwind_Resume(a1);
}

void sub_21087EB9C()
{
}

uint64_t caulk::ipc::synchronous_messenger::semaphore_sender::start(semaphore_t *this, double a2)
{
  if (!caulk::ipc::synchronous_messenger::semaphore_sender::is_valid((caulk::ipc::synchronous_messenger::semaphore_sender *)this)
    || *((unsigned char *)this + 64)
    || (xpc_object_t v4 = (unsigned int *)caulk::ipc::mapped_memory::get_ptr<caulk::ipc::synchronous_messenger::details::flow_control>((void *)this + 3),
        uint64_t v5 = *v4,
        v5))
  {
    uint64_t v6 = 0;
    uint64_t v7 = 0;
    uint64_t v8 = 22;
  }
  else
  {
    long long v10 = v4;
    while (1)
    {
      uint64_t v11 = caulk::mach::semaphore::timed_wait_or_error(this + 12, a2, v5);
      int v12 = v11;
      if ((v11 & 0x100000000) == 0)
      {
        uint64_t v6 = 0;
        uint64_t v7 = v11 & 0xFFFFFF00;
        uint64_t v8 = v11;
        return v7 | v8 | v6;
      }
      if (!(_BYTE)v11) {
        break;
      }
      __dmb(9u);
      uint64_t v5 = v10[1];
      if (v5 == 1)
      {
        uint64_t v8 = 1;
        _DWORD *v10 = 1;
        __dmb(0xBu);
        MEMORY[0x2166752E0](this[14]);
        uint64_t v7 = v12 & 0xFFFFFF00;
        *((unsigned char *)this + 64) = 1;
        uint64_t v6 = 0x100000000;
        return v7 | v8 | v6;
      }
    }
    uint64_t v8 = 0;
    uint64_t v6 = v11 & 0x100000000;
    uint64_t v7 = v11 & 0xFFFFFF00;
  }
  return v7 | v8 | v6;
}

BOOL caulk::ipc::synchronous_messenger::semaphore_sender::is_valid(caulk::ipc::synchronous_messenger::semaphore_sender *this)
{
  return *(void *)this
      && *((void *)this + 1)
      && *((void *)this + 3)
      && *((void *)this + 4)
      && *((_DWORD *)this + 12)
      && *((_DWORD *)this + 14) != 0;
}

uint64_t caulk::ipc::mapped_memory::get_ptr<caulk::ipc::synchronous_messenger::details::flow_control>(void *a1)
{
  if (a1[1] > 7uLL) {
    return *a1;
  }
  _os_assert_log();
  uint64_t result = _os_crash();
  __break(1u);
  return result;
}

uint64_t caulk::ipc::synchronous_messenger::semaphore_sender::send(semaphore_t *this, double a2)
{
  if (!caulk::ipc::synchronous_messenger::semaphore_sender::is_valid((caulk::ipc::synchronous_messenger::semaphore_sender *)this)
    || !*((unsigned char *)this + 64))
  {
    goto LABEL_8;
  }
  xpc_object_t v4 = (_DWORD *)caulk::ipc::mapped_memory::get_ptr<caulk::ipc::synchronous_messenger::details::flow_control>((void *)this + 3);
  if (*v4 != 1 || (uint64_t v5 = v4[1], !v5))
  {
    caulk::ipc::synchronous_messenger::semaphore_sender::reset_messaging((caulk::ipc::synchronous_messenger::semaphore_sender *)this, a2);
LABEL_8:
    uint64_t v8 = 0;
    uint64_t v9 = 0;
    LOBYTE(v7) = 22;
    return v8 | v9 | v7;
  }
  __dmb(0xBu);
  unint64_t v6 = caulk::mach::semaphore::timed_wait_signal_or_error(this + 12, this + 14, a2, v5);
  unint64_t v7 = v6;
  if (!HIDWORD(v6))
  {
    caulk::ipc::synchronous_messenger::semaphore_sender::reset_messaging((caulk::ipc::synchronous_messenger::semaphore_sender *)this, a2);
LABEL_12:
    uint64_t v8 = v7 & 0x100000000;
    uint64_t v9 = v7 & 0xFFFFFF00;
    return v8 | v9 | v7;
  }
  if (!(_BYTE)v6) {
    goto LABEL_12;
  }
  uint64_t v9 = 0;
  __dmb(9u);
  uint64_t v8 = 0x100000000;
  LOBYTE(v7) = 1;
  return v8 | v9 | v7;
}

void caulk::ipc::synchronous_messenger::semaphore_sender::reset_messaging(caulk::ipc::synchronous_messenger::semaphore_sender *this, double a2)
{
  xpc_object_t v4 = (_DWORD *)caulk::ipc::mapped_memory::get_ptr<caulk::ipc::synchronous_messenger::details::flow_control>((void *)this + 3);
  *xpc_object_t v4 = 0;
  __dmb(0xBu);
  MEMORY[0x2166752E0](*((unsigned int *)this + 14));
  do
  {
    unint64_t v6 = caulk::mach::semaphore::timed_wait_or_error((semaphore_t *)this + 12, a2, v5);
    if (!HIDWORD(v6)) {
      break;
    }
    if (!(_BYTE)v6) {
      break;
    }
    __dmb(9u);
    uint64_t v5 = v4[1];
  }
  while (v5);
  *((unsigned char *)this + 64) = 0;
  std::string::basic_string[abi:ne180100]<0>(&__p, "semaphore_sender::reset_messaging: wait out the sender semaphore to clear things out for next time S-1");
  caulk::ipc::synchronous_messenger::details::drain_semaphore((semaphore_t *)this + 12);
  if (v8 < 0) {
    operator delete(__p);
  }
}

unint64_t caulk::ipc::synchronous_messenger::details::drain_semaphore(semaphore_t *this)
{
  char v2 = 0;
  long long v3 = &unk_210885000;
  do
  {
    unint64_t result = caulk::mach::semaphore::timed_wait_or_error(this, 0.000001, (uint64_t)v3);
    long long v3 = (void *)HIDWORD(result);
    if (HIDWORD(result)) {
      BOOL v5 = v2 == 0;
    }
    else {
      BOOL v5 = 1;
    }
    if (v5)
    {
      if (!v3) {
        break;
      }
      if (!v2) {
        char v2 = BYTE4(result);
      }
      if (!v2) {
        break;
      }
    }
  }
  while ((_BYTE)result);
  __dmb(9u);
  return result;
}

uint64_t caulk::ipc::synchronous_messenger::semaphore_sender::resynch(caulk::ipc::synchronous_messenger::semaphore_sender *this)
{
  if (caulk::ipc::synchronous_messenger::semaphore_sender::is_valid(this) && *((unsigned char *)this + 64))
  {
    char v2 = (_DWORD *)caulk::ipc::mapped_memory::get_ptr<caulk::ipc::synchronous_messenger::details::flow_control>((void *)this + 3);
    _DWORD *v2 = 2;
    __dmb(0xBu);
    MEMORY[0x2166752E0](*((unsigned int *)this + 14));
    long long v3 = (unsigned int *)((char *)this + 48);
    while (1)
    {
      do
        int v4 = MEMORY[0x216675320](*v3);
      while (v4 == 14);
      if (v4) {
        break;
      }
      __dmb(9u);
      if (v2[1] == 2)
      {
        _DWORD *v2 = 1;
        __dmb(0xBu);
        MEMORY[0x2166752E0](*((unsigned int *)this + 14));
        while (1)
        {
          do
            int v4 = MEMORY[0x216675320](*v3);
          while (v4 == 14);
          if (v4) {
            break;
          }
          __dmb(9u);
          if (v2[1] == 1)
          {
            std::string::basic_string[abi:ne180100]<0>(&__p, "semaphore_sender::resynch: wait out the sender semaphore to clear things out for next time S-1");
            caulk::ipc::synchronous_messenger::details::drain_semaphore((semaphore_t *)this + 12);
            if (v10 < 0) {
              operator delete(__p);
            }
            unsigned __int8 v5 = 0;
            uint64_t v6 = 0;
            uint64_t v7 = 0x100000000;
            return v6 | v7 | v5;
          }
        }
        break;
      }
    }
    uint64_t v7 = 0;
    unsigned __int8 v5 = v4;
    uint64_t v6 = v4 & 0xFFFFFF00;
  }
  else
  {
    uint64_t v7 = 0;
    uint64_t v6 = 0;
    unsigned __int8 v5 = 22;
  }
  return v6 | v7 | v5;
}

uint64_t caulk::ipc::synchronous_messenger::semaphore_sender::resynch(caulk::ipc::synchronous_messenger::semaphore_sender *this, double a2)
{
  if (caulk::ipc::synchronous_messenger::semaphore_sender::is_valid(this) && *((unsigned char *)this + 64))
  {
    int v4 = (_DWORD *)caulk::ipc::mapped_memory::get_ptr<caulk::ipc::synchronous_messenger::details::flow_control>((void *)this + 3);
    *int v4 = 2;
    __dmb(0xBu);
    MEMORY[0x2166752E0](*((unsigned int *)this + 14));
    while (1)
    {
      unint64_t v6 = caulk::mach::semaphore::timed_wait_or_error((semaphore_t *)this + 12, a2, v5);
      unint64_t v7 = v6;
      uint64_t v8 = HIDWORD(v6);
      if (!HIDWORD(v6)) {
        goto LABEL_16;
      }
      if (!(_BYTE)v6) {
        break;
      }
      __dmb(9u);
      uint64_t v5 = v4[1];
      if (v5 == 2)
      {
        *int v4 = 1;
        __dmb(0xBu);
        MEMORY[0x2166752E0](*((unsigned int *)this + 14));
        while (1)
        {
          unint64_t v10 = caulk::mach::semaphore::timed_wait_or_error((semaphore_t *)this + 12, a2, v9);
          unint64_t v7 = v10;
          uint64_t v8 = HIDWORD(v10);
          if (!HIDWORD(v10)) {
            break;
          }
          if (!(_BYTE)v10) {
            goto LABEL_17;
          }
          __dmb(9u);
          uint64_t v9 = v4[1];
          if (v9 == 1)
          {
            std::string::basic_string[abi:ne180100]<0>(&__p, "semaphore_sender::resynch: wait out the sender semaphore to clear things out for next time S-1");
            caulk::ipc::synchronous_messenger::details::drain_semaphore((semaphore_t *)this + 12);
            uint64_t v11 = v7 & 0xFFFFFF00;
            if (v14 < 0) {
              operator delete(__p);
            }
            uint64_t v8 = 0x100000000;
            LOBYTE(v7) = 1;
            return v11 | v8 | v7;
          }
        }
LABEL_16:
        uint64_t v11 = v7 & 0xFFFFFF00;
        return v11 | v8 | v7;
      }
    }
LABEL_17:
    uint64_t v11 = v7 & 0xFFFFFF00;
    uint64_t v8 = v7 & 0x100000000;
    LOBYTE(v7) = 0;
  }
  else
  {
    uint64_t v8 = 0;
    uint64_t v11 = 0;
    LOBYTE(v7) = 22;
  }
  return v11 | v8 | v7;
}

void caulk::ipc::synchronous_messenger::semaphore_sender::stop(caulk::ipc::synchronous_messenger::semaphore_sender *this, double a2)
{
  if (caulk::ipc::synchronous_messenger::semaphore_sender::is_valid(this) && *((unsigned char *)this + 64))
  {
    caulk::ipc::synchronous_messenger::semaphore_sender::reset_messaging(this, a2);
  }
}

void caulk::ipc::synchronous_messenger::semaphore_receiver::ingest_connection_info(uint64_t a1, xpc_object_t *a2)
{
  if (!*a2)
  {
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::runtime_error::runtime_error(exception, "no connection info");
    goto LABEL_10;
  }
  if (MEMORY[0x2166753F0]() != MEMORY[0x263EF8708])
  {
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::runtime_error::runtime_error(exception, "no dictionary");
LABEL_10:
    __cxa_throw(exception, MEMORY[0x263F8C1F0], MEMORY[0x263F8C070]);
  }
  xpc_object_t value = xpc_dictionary_get_value(*a2, "payload");
  unint64_t v6 = caulk::mach::details::retain_os_object(value, v5);
  xpc_object_t v35 = v6;
  if (!v6)
  {
    unint64_t v25 = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::runtime_error::runtime_error(v25, "no payload");
    __cxa_throw(v25, MEMORY[0x263F8C1F0], MEMORY[0x263F8C070]);
  }
  caulk::ipc::mapped_memory::mapped_memory((uint64_t)&v32, &v35);
  unint64_t v7 = *(void **)(a1 + 16);
  uint64_t v8 = *(void *)(a1 + 24);
  uint64_t v9 = v33;
  *(void *)(a1 + 16) = v32;
  *(void *)(a1 + 24) = v9;
  unint64_t v32 = v7;
  uint64_t v33 = v8;
  LOBYTE(v7) = *(unsigned char *)(a1 + 32);
  *(unsigned char *)(a1 + 32) = v34;
  char v34 = (char)v7;
  caulk::ipc::mapped_memory::reset((caulk::ipc::mapped_memory *)&v32);
  xpc_object_t v10 = xpc_dictionary_get_value(*a2, "control");
  int v12 = caulk::mach::details::retain_os_object(v10, v11);
  xpc_object_t v31 = v12;
  if (!v12)
  {
    char v26 = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::runtime_error::runtime_error(v26, "no control");
    __cxa_throw(v26, MEMORY[0x263F8C1F0], MEMORY[0x263F8C070]);
  }
  caulk::ipc::mapped_memory::mapped_memory((uint64_t)&v32, &v31);
  uint64_t v13 = *(void **)(a1 + 40);
  uint64_t v14 = *(void *)(a1 + 48);
  uint64_t v15 = v33;
  *(void *)(a1 + 40) = v32;
  *(void *)(a1 + 48) = v15;
  unint64_t v32 = v13;
  uint64_t v33 = v14;
  LOBYTE(v13) = *(unsigned char *)(a1 + 56);
  *(unsigned char *)(a1 + 56) = v34;
  char v34 = (char)v13;
  caulk::ipc::mapped_memory::reset((caulk::ipc::mapped_memory *)&v32);
  xpc_object_t v16 = xpc_dictionary_get_value(*a2, "send semaphore");
  uint64_t v18 = caulk::mach::details::retain_os_object(v16, v17);
  unint64_t v32 = v18;
  if (!v18)
  {
    char v27 = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::runtime_error::runtime_error(v27, "no send semaphore");
    __cxa_throw(v27, MEMORY[0x263F8C1F0], MEMORY[0x263F8C070]);
  }
  caulk::ipc::synchronous_messenger::details::make_semaphore((uint64_t)&v30, &v32);
  caulk::mach::semaphore::operator=(a1 + 64, (int *)&v30);
  caulk::mach::semaphore::~semaphore((semaphore_t *)&v30);
  xpc_object_t v19 = xpc_dictionary_get_value(*a2, "receive semaphore");
  uint64_t v21 = caulk::mach::details::retain_os_object(v19, v20);
  char v30 = v21;
  if (!v21)
  {
    long long v28 = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::runtime_error::runtime_error(v28, "no receive semaphore");
    __cxa_throw(v28, MEMORY[0x263F8C1F0], MEMORY[0x263F8C070]);
  }
  caulk::ipc::synchronous_messenger::details::make_semaphore((uint64_t)&v29, &v30);
  caulk::mach::semaphore::operator=(a1 + 72, &v29);
  caulk::mach::semaphore::~semaphore((semaphore_t *)&v29);
  os_release(v21);
  os_release(v18);
  caulk::mach::details::release_os_object((caulk::mach::details *)v12, v22);
  caulk::mach::details::release_os_object((caulk::mach::details *)v6, v23);
}

void sub_21087F4D4(_Unwind_Exception *a1, void *a2)
{
  caulk::mach::details::release_os_object(v5, a2);
  caulk::mach::details::release_os_object(v4, v7);
  caulk::mach::details::release_os_object(v3, v8);
  caulk::mach::details::release_os_object(v2, v9);
  _Unwind_Resume(a1);
}

uint64_t caulk::ipc::synchronous_messenger::details::make_semaphore(uint64_t a1, void *a2)
{
  if (!*a2)
  {
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::runtime_error::runtime_error(exception, "no object");
    goto LABEL_6;
  }
  if (MEMORY[0x2166753F0]() != MEMORY[0x263EF8748])
  {
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::runtime_error::runtime_error(exception, "object is not a mach send right");
LABEL_6:
    __cxa_throw(exception, MEMORY[0x263F8C1F0], MEMORY[0x263F8C070]);
  }
  uint64_t result = xpc_mach_send_copy_right();
  *(_DWORD *)a1 = result;
  *(unsigned char *)(a1 + 4) = 0;
  return result;
}

void sub_21087F634(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

uint64_t caulk::ipc::synchronous_messenger::semaphore_receiver::start(caulk::ipc::synchronous_messenger::semaphore_receiver *this, double a2, const caulk::thread::attributes *a3)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  unint64_t v6 = &unk_26C2AB808;
  *(_OWORD *)unint64_t v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  uint64_t v10 = 0;
  uint64_t v3 = caulk::ipc::synchronous_messenger::semaphore_receiver::start((uint64_t)this, (uint64_t)a3, (uint64_t)&v6, a2);
  unint64_t v6 = &unk_26C2AB808;
  caulk::mach::details::release_os_object(v7[0], v4);
  return v3;
}

uint64_t caulk::ipc::synchronous_messenger::semaphore_receiver::start(uint64_t a1, uint64_t a2, uint64_t a3, double a4)
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  if (caulk::ipc::synchronous_messenger::semaphore_receiver::is_valid((caulk::ipc::synchronous_messenger::semaphore_receiver *)a1))
  {
    std::__optional_copy_base<std::string,false>::__optional_copy_base[abi:ne180100](&__p, (long long *)a2);
    long long v13 = *(_OWORD *)(a2 + 32);
    uint64_t v14 = *(void *)(a2 + 48);
    int v15 = 1;
    char v16 = 1;
    *(_WORD *)(a1 + 184) = 0;
    LODWORD(v17) = 1;
    BYTE4(v17) = 0;
    caulk::mach::semaphore::semaphore(&semaphore);
    __dmb(0xBu);
    std::shared_ptr<caulk::ipc::synchronous_messenger::semaphore_receiver>::shared_ptr[abi:ne180100]<caulk::ipc::synchronous_messenger::semaphore_receiver,void>(&v18, *(void *)a1, *(std::__shared_weak_count **)(a1 + 8));
    double v19 = a4;
    unint64_t v20 = &v17;
    p_semaphore_t semaphore = &semaphore;
    uint64_t v22 = &unk_26C2AB808;
    char v23 = (caulk::mach::details *)caulk::mach::details::retain_os_object(*(void **)(a3 + 8), v8);
    long long v9 = *(_OWORD *)(a3 + 32);
    long long v24 = *(_OWORD *)(a3 + 16);
    *(_OWORD *)unint64_t v25 = v9;
    *(_OWORD *)&v25[9] = *(_OWORD *)(a3 + 41);
    operator new();
  }
  LODWORD(v17) = 22;
  BYTE4(v17) = 0;
  return v17;
}

{
  void *v8;
  long long v10;
  double v11;
  uint64_t *v12;
  semaphore_t *p_semaphore;
  void *v14;
  caulk::mach::details *v15;
  uint64_t v16;
  char v17;
  semaphore_t semaphore;
  std::string __p;
  long long v20;
  uint64_t v21;
  int v22;
  char v23;
  uint64_t v24;

  if (caulk::ipc::synchronous_messenger::semaphore_receiver::is_valid((caulk::ipc::synchronous_messenger::semaphore_receiver *)a1))
  {
    std::__optional_copy_base<std::string,false>::__optional_copy_base[abi:ne180100](&__p, (long long *)a2);
    unint64_t v20 = *(_OWORD *)(a2 + 32);
    uint64_t v21 = *(void *)(a2 + 48);
    uint64_t v22 = 1;
    char v23 = 1;
    *(_WORD *)(a1 + 184) = 0;
    LODWORD(v24) = 1;
    BYTE4(v24) = 0;
    caulk::mach::semaphore::semaphore(&semaphore);
    __dmb(0xBu);
    std::shared_ptr<caulk::ipc::synchronous_messenger::semaphore_receiver>::shared_ptr[abi:ne180100]<caulk::ipc::synchronous_messenger::semaphore_receiver,void>(&v10, *(void *)a1, *(std::__shared_weak_count **)(a1 + 8));
    uint64_t v11 = a4;
    int v12 = &v24;
    p_semaphore_t semaphore = &semaphore;
    uint64_t v14 = &unk_26C2AB7A0;
    int v15 = (caulk::mach::details *)caulk::mach::details::retain_os_object(*(void **)(a3 + 8), v8);
    char v16 = 0;
    uint64_t v17 = 0;
    operator new();
  }
  LODWORD(v24) = 22;
  BYTE4(v24) = 0;
  return v24;
}

void sub_21087FA04(_Unwind_Exception *exception_object, void *a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22)
{
  if (a2)
  {
    std::unique_ptr<std::tuple<caulk::thread::attributes,caulk::ipc::synchronous_messenger::semaphore_receiver::start(double,caulk::thread::attributes const&,caulk::mach::os_workgroup_managed)::$_0,std::tuple<>>>::~unique_ptr[abi:ne180100](&a22, a2);
    __clang_call_terminate(exception_object);
  }
  _Unwind_Resume(exception_object);
}

BOOL caulk::ipc::synchronous_messenger::semaphore_receiver::is_valid(caulk::ipc::synchronous_messenger::semaphore_receiver *this)
{
  return *((void *)this + 2)
      && *((void *)this + 3)
      && *((void *)this + 5)
      && *((void *)this + 6)
      && *((_DWORD *)this + 16)
      && *((_DWORD *)this + 18) != 0;
}

void *std::shared_ptr<caulk::ipc::synchronous_messenger::semaphore_receiver>::shared_ptr[abi:ne180100]<caulk::ipc::synchronous_messenger::semaphore_receiver,void>(void *a1, uint64_t a2, std::__shared_weak_count *this)
{
  *a1 = a2;
  if (!this)
  {
    a1[1] = 0;
LABEL_5:
    std::__throw_bad_weak_ptr[abi:ne180100]();
  }
  int v4 = std::__shared_weak_count::lock(this);
  a1[1] = v4;
  if (!v4) {
    goto LABEL_5;
  }
  return a1;
}

uint64_t *std::unique_ptr<std::tuple<caulk::thread::attributes,caulk::ipc::synchronous_messenger::semaphore_receiver::start(double,caulk::thread::attributes const&,caulk::mach::os_workgroup_managed)::$_0,std::tuple<>>>::~unique_ptr[abi:ne180100](uint64_t *a1, void *a2)
{
  uint64_t v3 = *a1;
  *a1 = 0;
  if (v3)
  {
    *(void *)(v3 + 104) = &unk_26C2AB808;
    caulk::mach::details::release_os_object(*(caulk::mach::details **)(v3 + 112), a2);
    int v4 = *(std::__shared_weak_count **)(v3 + 72);
    if (v4) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v4);
    }
    if (*(unsigned char *)(v3 + 24) && *(char *)(v3 + 23) < 0) {
      operator delete(*(void **)v3);
    }
    MEMORY[0x216674B00](v3, 0x10B2C406107703FLL);
  }
  return a1;
}

uint64_t caulk::thread_proxy<std::tuple<caulk::thread::attributes,caulk::ipc::synchronous_messenger::semaphore_receiver::start(double,caulk::thread::attributes const&,caulk::mach::os_workgroup_managed)::$_0,std::tuple<>>>(uint64_t a1)
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  uint64_t v18 = a1;
  caulk::thread::attributes::apply_to_this_thread(a1);
  uint64_t v2 = *(void *)(a1 + 64);
  double v3 = *(double *)(a1 + 80);
  int v4 = *(char **)(a1 + 88);
  uint64_t v5 = *(unsigned int **)(a1 + 96);
  uint64_t v21 = &unk_26C2AB808;
  uint64_t v22 = (caulk::mach::details *)caulk::mach::details::retain_os_object(*(void **)(a1 + 112), v6);
  long long v7 = *(_OWORD *)(a1 + 136);
  long long v23 = *(_OWORD *)(a1 + 120);
  v24[0] = v7;
  *(_OWORD *)((char *)v24 + 9) = *(_OWORD *)(a1 + 145);
  uint64_t v8 = *(void *)(v2 + 112);
  if (v8) {
    (*(void (**)(uint64_t))(*(void *)v8 + 48))(v8);
  }
  int v9 = caulk::mach::os_workgroup_managed::join((caulk::mach::os_workgroup_managed *)&v21);
  uint64_t started = caulk::ipc::synchronous_messenger::semaphore_receiver::start_handshake((caulk::ipc::synchronous_messenger::semaphore_receiver *)v2, v10, v3);
  int v19 = started;
  char v20 = BYTE4(started);
  caulk::expected<BOOL,int>::swap((char *)&v19, v4);
  if (v4[4])
  {
    caulk::expected<BOOL,int>::value((uint64_t)v4);
    BOOL v12 = *v4 != 0;
  }
  else
  {
    BOOL v12 = 0;
  }
  __dmb(0xBu);
  MEMORY[0x2166752E0](*v5);
  if (v12) {
    caulk::ipc::synchronous_messenger::semaphore_receiver::message_loop(v2, v13);
  }
  if (*(unsigned char *)(v2 + 185))
  {
    if (v9) {
      goto LABEL_13;
    }
  }
  else
  {
    caulk::ipc::synchronous_messenger::semaphore_receiver::stop_handshake((caulk::ipc::synchronous_messenger::semaphore_receiver *)v2, v13);
    if (v9) {
      goto LABEL_13;
    }
  }
  caulk::mach::os_workgroup_managed::leave((caulk::mach::os_workgroup_managed *)&v21);
LABEL_13:
  uint64_t v14 = *(void *)(v2 + 176);
  if (v14) {
    (*(void (**)(uint64_t))(*(void *)v14 + 48))(v14);
  }
  __dmb(0xBu);
  MEMORY[0x2166752E0](*(unsigned int *)(v2 + 80));
  uint64_t v21 = &unk_26C2AB808;
  caulk::mach::details::release_os_object(v22, v15);
  std::unique_ptr<std::tuple<caulk::thread::attributes,caulk::ipc::synchronous_messenger::semaphore_receiver::start(double,caulk::thread::attributes const&,caulk::mach::os_workgroup_managed)::$_0,std::tuple<>>>::~unique_ptr[abi:ne180100](&v18, v16);
  return 0;
}

void sub_21087FD5C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, char a12)
{
  if (a2)
  {
    __cxa_begin_catch(exception_object);
    __cxa_end_catch();
    JUMPOUT(0x21087FD00);
  }
  _Unwind_Resume(exception_object);
}

uint64_t caulk::ipc::synchronous_messenger::semaphore_receiver::start_handshake(caulk::ipc::synchronous_messenger::semaphore_receiver *this, caulk::ipc::synchronous_messenger::semaphore_receiver *a2, double a3)
{
  if (caulk::ipc::synchronous_messenger::semaphore_receiver::is_valid(this)
    && (uint64_t v5 = caulk::ipc::mapped_memory::get_ptr<caulk::ipc::synchronous_messenger::details::flow_control>((void *)this + 5),
        !*(_DWORD *)(v5 + 4)))
  {
    uint64_t v10 = (unsigned int *)v5;
    *(_DWORD *)(v5 + 4) = 1;
    __dmb(0xBu);
    MEMORY[0x2166752E0](*((unsigned int *)this + 16));
    BOOL v12 = (semaphore_t *)((char *)this + 72);
    while (1)
    {
      uint64_t v13 = caulk::mach::semaphore::timed_wait_or_error(v12, a3, v11);
      if ((v13 & 0x100000000) == 0)
      {
        uint64_t v6 = 0;
        uint64_t v7 = v13 & 0xFFFFFF00;
        uint64_t v8 = v13;
        return v7 | v8 | v6;
      }
      if (!(_BYTE)v13) {
        break;
      }
      __dmb(9u);
      uint64_t v11 = *v10;
      if (v11 == 1)
      {
        uint64_t v7 = v13 & 0xFFFFFF00;
        uint64_t v6 = 0x100000000;
        uint64_t v8 = 1;
        return v7 | v8 | v6;
      }
    }
    uint64_t v8 = 0;
    uint64_t v6 = v13 & 0x100000000;
    uint64_t v7 = v13 & 0xFFFFFF00;
  }
  else
  {
    uint64_t v6 = 0;
    uint64_t v7 = 0;
    uint64_t v8 = 22;
  }
  return v7 | v8 | v6;
}

char *caulk::expected<BOOL,int>::swap(char *result, char *a2)
{
  if (result[4]) {
    BOOL v2 = a2[4] == 0;
  }
  else {
    BOOL v2 = 1;
  }
  if (!v2)
  {
    char v4 = *result;
    *uint64_t result = *a2;
    *a2 = v4;
    return result;
  }
  if (result[4])
  {
    if (!a2[4])
    {
      int v3 = *(_DWORD *)a2;
      *a2 = *result;
      *(_DWORD *)uint64_t result = v3;
      LOBYTE(v3) = result[4];
      result[4] = 0;
      a2[4] = v3;
      return result;
    }
  }
  else if (a2[4])
  {
    char v5 = *a2;
    *(_DWORD *)a2 = *(_DWORD *)result;
    *uint64_t result = v5;
    result[4] = a2[4];
    a2[4] = 0;
    return result;
  }
  int v6 = *(_DWORD *)result;
  *(_DWORD *)uint64_t result = *(_DWORD *)a2;
  *(_DWORD *)a2 = v6;
  return result;
}

uint64_t caulk::ipc::synchronous_messenger::semaphore_receiver::message_loop(uint64_t this, caulk::ipc::synchronous_messenger::semaphore_receiver *a2)
{
  if (!*(unsigned char *)(this + 184))
  {
    uint64_t v2 = this;
    char v3 = 0;
    char v4 = (void *)(this + 40);
    char v5 = (semaphore_t *)(this + 72);
    uint64_t v6 = this + 16;
    while (1)
    {
      uint64_t v7 = (int *)caulk::ipc::mapped_memory::get_ptr<caulk::ipc::synchronous_messenger::details::flow_control>(v4);
      if (v3)
      {
        __dmb(0xBu);
        do
          this = MEMORY[0x216675330](*(unsigned int *)(v2 + 72), *(unsigned int *)(v2 + 64));
        while (this == 14);
      }
      else
      {
        do
          this = MEMORY[0x216675320](*v5);
        while (this == 14);
      }
      if (this) {
        return this;
      }
      __dmb(9u);
      if (*(unsigned char *)(v2 + 184)) {
        return this;
      }
      this = *(void *)(v2 + 144);
      if (!this) {
        goto LABEL_14;
      }
      int v8 = *v7;
      if (*v7 == 1) {
        break;
      }
LABEL_15:
      switch(v8)
      {
        case 1:
          char v3 = 1;
          break;
        case 2:
          this = caulk::ipc::synchronous_messenger::semaphore_receiver::is_valid((caulk::ipc::synchronous_messenger::semaphore_receiver *)v2);
          if (this)
          {
            int v9 = (_DWORD *)caulk::ipc::mapped_memory::get_ptr<caulk::ipc::synchronous_messenger::details::flow_control>(v4);
            v9[1] = 2;
            __dmb(0xBu);
            MEMORY[0x2166752E0](*(unsigned int *)(v2 + 64));
            while (1)
            {
              do
                this = MEMORY[0x216675320](*v5);
              while (this == 14);
              if (this) {
                break;
              }
              __dmb(9u);
              if (*v9 == 1)
              {
                std::string::basic_string[abi:ne180100]<0>(&__p, "semaphore_receiver::reynch_handshake: wait out the receiver semaphore to clear things out for next time R-1");
                caulk::ipc::synchronous_messenger::details::drain_semaphore(v5);
                if (v11 < 0) {
                  operator delete(__p);
                }
                v9[1] = 1;
                __dmb(0xBu);
                this = MEMORY[0x2166752E0](*(unsigned int *)(v2 + 64));
                break;
              }
            }
          }
          char v3 = 0;
          break;
        case 0:
          return this;
      }
      if (*(unsigned char *)(v2 + 184)) {
        return this;
      }
    }
    this = (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)this + 48))(this, v6);
LABEL_14:
    int v8 = *v7;
    goto LABEL_15;
  }
  return this;
}

void sub_2108800D0(void *a1)
{
}

uint64_t caulk::ipc::synchronous_messenger::semaphore_receiver::stop_handshake(caulk::ipc::synchronous_messenger::semaphore_receiver *this, caulk::ipc::synchronous_messenger::semaphore_receiver *a2)
{
  uint64_t result = caulk::ipc::synchronous_messenger::semaphore_receiver::is_valid(this);
  if (result)
  {
    uint64_t result = caulk::ipc::mapped_memory::get_ptr<caulk::ipc::synchronous_messenger::details::flow_control>((void *)this + 5);
    if (*(_DWORD *)(result + 4) == 1)
    {
      *(_DWORD *)(result + 4) = 0;
      __dmb(0xBu);
      return MEMORY[0x2166752E0](*((unsigned int *)this + 16));
    }
  }
  return result;
}

void sub_2108803A8(void *a1, void *a2)
{
  std::unique_ptr<std::tuple<caulk::thread::attributes,caulk::ipc::synchronous_messenger::semaphore_receiver::start(double,caulk::thread::attributes const&,caulk::mach::os_workgroup)::$_0,std::tuple<>>>::~unique_ptr[abi:ne180100]((uint64_t *)(v2 - 72), a2);
  __clang_call_terminate(a1);
}

uint64_t *std::unique_ptr<std::tuple<caulk::thread::attributes,caulk::ipc::synchronous_messenger::semaphore_receiver::start(double,caulk::thread::attributes const&,caulk::mach::os_workgroup)::$_0,std::tuple<>>>::~unique_ptr[abi:ne180100](uint64_t *a1, void *a2)
{
  uint64_t v3 = *a1;
  *a1 = 0;
  if (v3)
  {
    *(void *)(v3 + 104) = &unk_26C2AB7A0;
    caulk::mach::details::release_os_object(*(caulk::mach::details **)(v3 + 112), a2);
    char v4 = *(std::__shared_weak_count **)(v3 + 72);
    if (v4) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v4);
    }
    if (*(unsigned char *)(v3 + 24) && *(char *)(v3 + 23) < 0) {
      operator delete(*(void **)v3);
    }
    MEMORY[0x216674B00](v3, 0x10B2C40C95379B2);
  }
  return a1;
}

uint64_t caulk::thread_proxy<std::tuple<caulk::thread::attributes,caulk::ipc::synchronous_messenger::semaphore_receiver::start(double,caulk::thread::attributes const&,caulk::mach::os_workgroup)::$_0,std::tuple<>>>(uint64_t a1)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  uint64_t v16 = a1;
  caulk::thread::attributes::apply_to_this_thread(a1);
  uint64_t v2 = *(void *)(a1 + 64);
  double v3 = *(double *)(a1 + 80);
  char v4 = *(char **)(a1 + 88);
  char v5 = *(unsigned int **)(a1 + 96);
  uint64_t v17 = &unk_26C2AB7A0;
  uint64_t v18 = (caulk::mach::details *)caulk::mach::details::retain_os_object(*(void **)(a1 + 112), v6);
  uint64_t v7 = *(void *)(v2 + 112);
  if (v7) {
    (*(void (**)(uint64_t))(*(void *)v7 + 48))(v7);
  }
  uint64_t v21 = &v17;
  memset(&v22, 0, sizeof(v22));
  int v23 = caulk::mach::os_workgroup::join((caulk::mach::os_workgroup *)&v17, &v22);
  uint64_t started = caulk::ipc::synchronous_messenger::semaphore_receiver::start_handshake((caulk::ipc::synchronous_messenger::semaphore_receiver *)v2, v8, v3);
  int v19 = started;
  char v20 = BYTE4(started);
  caulk::expected<BOOL,int>::swap((char *)&v19, v4);
  if (v4[4])
  {
    caulk::expected<BOOL,int>::value((uint64_t)v4);
    BOOL v10 = *v4 != 0;
  }
  else
  {
    BOOL v10 = 0;
  }
  __dmb(0xBu);
  MEMORY[0x2166752E0](*v5);
  if (v10) {
    caulk::ipc::synchronous_messenger::semaphore_receiver::message_loop(v2, v11);
  }
  if (!*(unsigned char *)(v2 + 185)) {
    caulk::ipc::synchronous_messenger::semaphore_receiver::stop_handshake((caulk::ipc::synchronous_messenger::semaphore_receiver *)v2, v11);
  }
  if (!v23) {
    caulk::mach::os_workgroup::leave((uint64_t)v21[1], &v22);
  }
  uint64_t v12 = *(void *)(v2 + 176);
  if (v12) {
    (*(void (**)(uint64_t))(*(void *)v12 + 48))(v12);
  }
  __dmb(0xBu);
  MEMORY[0x2166752E0](*(unsigned int *)(v2 + 80));
  uint64_t v17 = &unk_26C2AB7A0;
  caulk::mach::details::release_os_object(v18, v13);
  std::unique_ptr<std::tuple<caulk::thread::attributes,caulk::ipc::synchronous_messenger::semaphore_receiver::start(double,caulk::thread::attributes const&,caulk::mach::os_workgroup)::$_0,std::tuple<>>>::~unique_ptr[abi:ne180100](&v16, v14);
  return 0;
}

void sub_21088067C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, int a19)
{
  if (a2)
  {
    __cxa_begin_catch(exception_object);
    __cxa_end_catch();
    JUMPOUT(0x21088061CLL);
  }
  _Unwind_Resume(exception_object);
}

uint64_t caulk::mach::os_workgroup::leave(uint64_t this, os_workgroup_join_token_opaque_s *a2)
{
  if (this) {
    return os_workgroup_leave_self();
  }
  return this;
}

void caulk::ipc::synchronous_messenger::semaphore_receiver::stop(caulk::ipc::synchronous_messenger::semaphore_receiver *this, double a2)
{
  if (caulk::ipc::synchronous_messenger::semaphore_receiver::is_valid(this))
  {
    *((unsigned char *)this + 184) = 1;
    __dmb(0xBu);
    MEMORY[0x2166752E0](*((unsigned int *)this + 18));
    caulk::mach::semaphore::timed_wait_or_error((semaphore_t *)this + 20, a2, v4);
    std::string::basic_string[abi:ne180100]<0>(&__p, "semaphore_receiver::stop: wait out the receiver semaphore to clear things out for next time R-1");
    caulk::ipc::synchronous_messenger::details::drain_semaphore((semaphore_t *)this + 18);
    if (v6 < 0) {
      operator delete(__p);
    }
  }
}

void caulk::ipc::synchronous_messenger::semaphore_receiver::simulate_crash_for_testing(caulk::ipc::synchronous_messenger::semaphore_receiver *this, double a2)
{
  if (caulk::ipc::synchronous_messenger::semaphore_receiver::is_valid(this))
  {
    *((_WORD *)this + 92) = 257;
    __dmb(0xBu);
    MEMORY[0x2166752E0](*((unsigned int *)this + 18));
    caulk::mach::semaphore::timed_wait_or_error((semaphore_t *)this + 20, a2, v4);
    std::string::basic_string[abi:ne180100]<0>(&__p, "semaphore_receiver::stop: wait out the receiver semaphore to clear things out for next time R-1");
    caulk::ipc::synchronous_messenger::details::drain_semaphore((semaphore_t *)this + 18);
    if (v6 < 0) {
      operator delete(__p);
    }
  }
}

void caulk::ipc::synchronous_messenger::eventlink_sender::create_connection_info(caulk::ipc::synchronous_messenger::eventlink_sender *this@<X0>, void *a2@<X8>)
{
  xpc_object_t v4 = xpc_dictionary_create(0, 0, 0);
  *a2 = v4;
  if (!v4)
  {
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::runtime_error::runtime_error(exception, "failed to allocate dictionary");
    __cxa_throw(exception, MEMORY[0x263F8C1F0], MEMORY[0x263F8C070]);
  }
  caulk::ipc::mapped_memory::create_xpc_object(this, &value);
  char v5 = (caulk::mach::details *)value;
  if (!value)
  {
    char v11 = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::runtime_error::runtime_error(v11, "failed to create payload object");
    __cxa_throw(v11, MEMORY[0x263F8C1F0], MEMORY[0x263F8C070]);
  }
  xpc_dictionary_set_value(v4, "payload", value);
  caulk::ipc::mapped_memory::create_xpc_object((caulk::ipc::synchronous_messenger::eventlink_sender *)((char *)this + 24), &v16);
  char v6 = (caulk::mach::details *)v16;
  if (!v16)
  {
    uint64_t v12 = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::runtime_error::runtime_error(v12, "failed to create control object");
    __cxa_throw(v12, MEMORY[0x263F8C1F0], MEMORY[0x263F8C070]);
  }
  xpc_dictionary_set_value(v4, "control", v16);
  mach_port_name_t v15 = caulk::mach::os_eventlink::copy_mach_port((caulk::ipc::synchronous_messenger::eventlink_sender *)((char *)this + 48));
  if (!v15)
  {
    uint64_t v13 = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::runtime_error::runtime_error(v13, "failed to create eventlink port");
    __cxa_throw(v13, MEMORY[0x263F8C1F0], MEMORY[0x263F8C070]);
  }
  uint64_t v7 = (void *)xpc_mach_send_create();
  if (!v7)
  {
    uint64_t v14 = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::runtime_error::runtime_error(v14, "failed to create eventlink object");
    __cxa_throw(v14, MEMORY[0x263F8C1F0], MEMORY[0x263F8C070]);
  }
  xpc_dictionary_set_value(v4, "eventlink", v7);
  os_release(v7);
  caulk::mach::mach_port::~mach_port(&v15);
  caulk::mach::details::release_os_object(v6, v8);
  caulk::mach::details::release_os_object(v5, v9);
}

void sub_210880A50(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, int a10, mach_port_name_t a11)
{
  __cxa_free_exception(v14);
  caulk::mach::mach_port::~mach_port(&a11);
  caulk::mach::details::release_os_object(v13, v16);
  caulk::mach::details::release_os_object(v12, v17);
  caulk::mach::details::release_os_object(v11, v18);
  _Unwind_Resume(a1);
}

void caulk::mach::mach_port::~mach_port(mach_port_name_t *this)
{
  if (*this) {
    mach_port_deallocate(*MEMORY[0x263EF8960], *this);
  }
}

uint64_t caulk::ipc::synchronous_messenger::eventlink_sender::associate(caulk::ipc::synchronous_messenger::eventlink_sender *this)
{
  if (*(void *)this
    && *((void *)this + 1)
    && *((void *)this + 3)
    && *((void *)this + 4)
    && (v2 = *((void *)this + 6), uint64_t v1 = (caulk::ipc::synchronous_messenger::eventlink_sender *)((char *)this + 48), v2))
  {
    return caulk::mach::os_eventlink::associate(v1);
  }
  else
  {
    return 22;
  }
}

uint64_t caulk::ipc::synchronous_messenger::eventlink_sender::dissociate(caulk::ipc::synchronous_messenger::eventlink_sender *this)
{
  if (*(void *)this
    && *((void *)this + 1)
    && *((void *)this + 3)
    && *((void *)this + 4)
    && (v2 = *((void *)this + 6), uint64_t v1 = (caulk::ipc::synchronous_messenger::eventlink_sender *)((char *)this + 48), v2))
  {
    return caulk::mach::os_eventlink::dissociate(v1);
  }
  else
  {
    return 22;
  }
}

unint64_t caulk::ipc::synchronous_messenger::eventlink_sender::start(caulk::ipc::synchronous_messenger::eventlink_sender *this, double a2, int a3)
{
  if (*(void *)this
    && *((void *)this + 1)
    && (xpc_object_t v4 = (void *)((char *)this + 24), *((void *)this + 3))
    && *((void *)this + 4)
    && (char v5 = (caulk::ipc::synchronous_messenger::eventlink_sender *)((char *)this + 48), *((void *)this + 6))
    && !*((unsigned char *)this + 56)
    && (int v8 = (_DWORD *)caulk::ipc::mapped_memory::get_ptr<caulk::ipc::synchronous_messenger::details::flow_control>(v4),
        !*v8))
  {
    uint64_t v13 = v8;
    if (a3
      && (unsigned int v14 = caulk::mach::os_eventlink::associate((caulk::ipc::synchronous_messenger::eventlink_sender *)((char *)this + 48))) != 0)
    {
      LOBYTE(v11) = v14;
      LOBYTE(v9) = 0;
      unsigned int v10 = v14 >> 8;
    }
    else
    {
      while (1)
      {
        unint64_t v15 = caulk::mach::os_eventlink::timed_wait_or_error((caulk::ipc::synchronous_messenger::eventlink_sender *)((char *)this + 48), a2);
        unsigned int v16 = v15;
        unint64_t v9 = HIDWORD(v15);
        if (!HIDWORD(v15)) {
          break;
        }
        if (!(_BYTE)v15)
        {
          unsigned int v10 = v15 >> 8;
          if (a3) {
            caulk::mach::os_eventlink::dissociate(v5);
          }
          LOBYTE(v11) = 0;
          return v11 | (v10 << 8) | ((unint64_t)v9 << 32);
        }
        __dmb(9u);
        if (v13[1] == 1)
        {
          *uint64_t v13 = 1;
          __dmb(0xBu);
          caulk::mach::os_eventlink::signal_or_error((caulk::ipc::synchronous_messenger::eventlink_sender *)((char *)this + 48));
          unint64_t v17 = caulk::mach::os_eventlink::timed_wait_or_error((caulk::ipc::synchronous_messenger::eventlink_sender *)((char *)this + 48), a2);
          unint64_t v9 = HIDWORD(v17);
          if (HIDWORD(v17))
          {
            *((unsigned char *)this + 56) = 1;
            LOBYTE(v9) = 1;
            LOBYTE(v11) = 1;
            unsigned int v10 = v16 >> 8;
          }
          else
          {
            unsigned int v11 = v17;
            if (a3) {
              caulk::mach::os_eventlink::dissociate((caulk::ipc::synchronous_messenger::eventlink_sender *)((char *)this + 48));
            }
            unsigned int v10 = v11 >> 8;
          }
          return v11 | (v10 << 8) | ((unint64_t)v9 << 32);
        }
      }
      LOBYTE(v11) = v15;
      unsigned int v10 = v15 >> 8;
      if (a3) {
        caulk::mach::os_eventlink::dissociate(v5);
      }
      LOBYTE(v9) = 0;
    }
  }
  else
  {
    LOBYTE(v9) = 0;
    unsigned int v10 = 0;
    LOBYTE(v11) = 22;
  }
  return v11 | (v10 << 8) | ((unint64_t)v9 << 32);
}

uint64_t caulk::ipc::synchronous_messenger::eventlink_sender::send(caulk::ipc::synchronous_messenger::eventlink_sender *this, double a2)
{
  uint64_t v2 = *(void *)this;
  if (!*(void *)this) {
    goto LABEL_13;
  }
  uint64_t v2 = *((void *)this + 1);
  if (!v2) {
    goto LABEL_13;
  }
  xpc_object_t v4 = (void *)((char *)this + 24);
  uint64_t v2 = *((void *)this + 3);
  if (!v2) {
    goto LABEL_13;
  }
  uint64_t v2 = *((void *)this + 4);
  if (!v2) {
    goto LABEL_13;
  }
  uint64_t v2 = *((void *)this + 6);
  if (!v2) {
    goto LABEL_13;
  }
  if (!*((unsigned char *)this + 56))
  {
LABEL_12:
    uint64_t v2 = 0;
LABEL_13:
    uint64_t v9 = 0;
    LOBYTE(v8) = 22;
    return v2 | v9 | v8;
  }
  char v6 = (_DWORD *)caulk::ipc::mapped_memory::get_ptr<caulk::ipc::synchronous_messenger::details::flow_control>(v4);
  if (*v6 != 1 || !v6[1])
  {
    caulk::ipc::synchronous_messenger::eventlink_sender::reset_messaging(this, a2);
    goto LABEL_12;
  }
  unint64_t v7 = caulk::mach::os_eventlink::timed_wait_signal_or_error((caulk::ipc::synchronous_messenger::eventlink_sender *)((char *)this + 48), a2);
  unint64_t v8 = v7;
  if (HIDWORD(v7))
  {
    uint64_t v2 = 0x100000000;
    if ((_BYTE)v7) {
      LOBYTE(v8) = 1;
    }
    else {
      uint64_t v2 = v7 & 0x100000000;
    }
    if ((_BYTE)v7) {
      uint64_t v9 = 0;
    }
    else {
      uint64_t v9 = v7 & 0xFFFFFF00;
    }
  }
  else
  {
    caulk::ipc::synchronous_messenger::eventlink_sender::reset_messaging(this, a2);
    uint64_t v2 = v8 & 0x100000000;
    uint64_t v9 = v8 & 0xFFFFFF00;
  }
  return v2 | v9 | v8;
}

void caulk::ipc::synchronous_messenger::eventlink_sender::reset_messaging(caulk::ipc::synchronous_messenger::eventlink_sender *this, double a2)
{
  xpc_object_t v4 = (_DWORD *)caulk::ipc::mapped_memory::get_ptr<caulk::ipc::synchronous_messenger::details::flow_control>((void *)this + 3);
  *xpc_object_t v4 = 0;
  caulk::mach::os_eventlink::signal_or_error((caulk::ipc::synchronous_messenger::eventlink_sender *)((char *)this + 48));
  do
    unint64_t v5 = caulk::mach::os_eventlink::timed_wait_or_error((caulk::ipc::synchronous_messenger::eventlink_sender *)((char *)this + 48), a2);
  while (HIDWORD(v5) && (_BYTE)v5 && v4[1]);
  *((unsigned char *)this + 56) = 0;
  std::string::basic_string[abi:ne180100]<0>(&__p, "eventlink_sender::reset_messaging: wait out the eventlink to clear things out for next time S-1");
  caulk::ipc::synchronous_messenger::details::drain_eventlink((caulk::ipc::synchronous_messenger::eventlink_sender *)((char *)this + 48));
  if (v7 < 0) {
    operator delete(__p);
  }
}

unint64_t caulk::ipc::synchronous_messenger::details::drain_eventlink(caulk::mach::os_eventlink *this)
{
  char v2 = 0;
  do
  {
    unint64_t result = caulk::mach::os_eventlink::timed_wait_or_error(this, 0.000001);
    if (HIDWORD(result)) {
      BOOL v4 = v2 == 0;
    }
    else {
      BOOL v4 = 1;
    }
    if (v4)
    {
      if (!HIDWORD(result)) {
        break;
      }
      if (!v2) {
        char v2 = BYTE4(result);
      }
      if (!v2) {
        break;
      }
    }
  }
  while ((_BYTE)result);
  __dmb(9u);
  return result;
}

uint64_t caulk::ipc::synchronous_messenger::eventlink_sender::resynch(caulk::ipc::synchronous_messenger::eventlink_sender *this)
{
  uint64_t v1 = *(void *)this;
  if (!*(void *)this) {
    goto LABEL_17;
  }
  uint64_t v1 = *((void *)this + 1);
  if (!v1) {
    goto LABEL_17;
  }
  if (!*((void *)this + 3)
    || !*((void *)this + 4)
    || (char v2 = (caulk::ipc::synchronous_messenger::eventlink_sender *)((char *)this + 48), !*((void *)this + 6))
    || !*((unsigned char *)this + 56))
  {
    uint64_t v1 = 0;
LABEL_17:
    uint64_t v7 = 0;
    LOBYTE(v6) = 22;
    return v7 | v1 | v6;
  }
  double v3 = (_DWORD *)caulk::ipc::mapped_memory::get_ptr<caulk::ipc::synchronous_messenger::details::flow_control>((void *)this + 3);
  _DWORD *v3 = 2;
  caulk::mach::os_eventlink::signal_or_error(v2);
  do
  {
    unint64_t v4 = caulk::mach::os_eventlink::wait_or_error(v2);
    uint64_t v1 = HIDWORD(v4);
    if (!HIDWORD(v4))
    {
      int v6 = v4;
      goto LABEL_20;
    }
  }
  while (v3[1] != 2);
  _DWORD *v3 = 1;
  caulk::mach::os_eventlink::signal_or_error(v2);
  while (1)
  {
    unint64_t v5 = caulk::mach::os_eventlink::wait_or_error(v2);
    int v6 = v5;
    uint64_t v1 = HIDWORD(v5);
    if (!HIDWORD(v5)) {
      break;
    }
    if (v3[1] == 1)
    {
      std::string::basic_string[abi:ne180100]<0>(&__p, "eventlink_sender::reset_messaging: wait out the sender eventlink to clear things out for next time S-1");
      uint64_t v7 = v6 & 0xFFFFFF00;
      caulk::ipc::synchronous_messenger::details::drain_eventlink(v2);
      if (v10 < 0) {
        operator delete(__p);
      }
      LOBYTE(v6) = 0;
      uint64_t v1 = 0x100000000;
      return v7 | v1 | v6;
    }
  }
LABEL_20:
  uint64_t v7 = v6 & 0xFFFFFF00;
  return v7 | v1 | v6;
}

uint64_t caulk::ipc::synchronous_messenger::eventlink_sender::resynch(caulk::ipc::synchronous_messenger::eventlink_sender *this, double a2)
{
  uint64_t v2 = *(void *)this;
  if (!*(void *)this) {
    goto LABEL_19;
  }
  uint64_t v2 = *((void *)this + 1);
  if (!v2) {
    goto LABEL_19;
  }
  if (!*((void *)this + 3)
    || !*((void *)this + 4)
    || (double v3 = (caulk::ipc::synchronous_messenger::eventlink_sender *)((char *)this + 48), !*((void *)this + 6))
    || !*((unsigned char *)this + 56))
  {
    uint64_t v2 = 0;
LABEL_19:
    uint64_t v9 = 0;
    LOBYTE(v7) = 22;
    return v9 | v2 | v7;
  }
  unint64_t v5 = (_DWORD *)caulk::ipc::mapped_memory::get_ptr<caulk::ipc::synchronous_messenger::details::flow_control>((void *)this + 3);
  *unint64_t v5 = 2;
  caulk::mach::os_eventlink::signal_or_error(v3);
  while (1)
  {
    unint64_t v6 = caulk::mach::os_eventlink::timed_wait_or_error(v3, a2);
    unint64_t v7 = v6;
    uint64_t v2 = HIDWORD(v6);
    if (!HIDWORD(v6)) {
      goto LABEL_21;
    }
    if (!(_BYTE)v6) {
      break;
    }
    if (v5[1] == 2)
    {
      *unint64_t v5 = 1;
      caulk::mach::os_eventlink::signal_or_error(v3);
      while (1)
      {
        unint64_t v8 = caulk::mach::os_eventlink::timed_wait_or_error(v3, a2);
        unint64_t v7 = v8;
        uint64_t v2 = HIDWORD(v8);
        if (!HIDWORD(v8)) {
          break;
        }
        if (!(_BYTE)v8) {
          goto LABEL_22;
        }
        if (v5[1] == 1)
        {
          std::string::basic_string[abi:ne180100]<0>(&__p, "eventlink_sender::reset_messaging: wait out the sender semaphore to clear things out for next time S-1");
          uint64_t v9 = v7 & 0xFFFFFF00;
          caulk::ipc::synchronous_messenger::details::drain_eventlink(v3);
          if (v12 < 0) {
            operator delete(__p);
          }
          uint64_t v2 = 0x100000000;
          LOBYTE(v7) = 1;
          return v9 | v2 | v7;
        }
      }
LABEL_21:
      uint64_t v9 = v7 & 0xFFFFFF00;
      return v9 | v2 | v7;
    }
  }
LABEL_22:
  uint64_t v9 = v7 & 0xFFFFFF00;
  uint64_t v2 = v7 & 0x100000000;
  LOBYTE(v7) = 0;
  return v9 | v2 | v7;
}

void caulk::ipc::synchronous_messenger::eventlink_sender::stop(caulk::ipc::synchronous_messenger::eventlink_sender *this, double a2, int a3)
{
  if (*(void *)this)
  {
    if (*((void *)this + 1))
    {
      if (*((void *)this + 3))
      {
        if (*((void *)this + 4))
        {
          double v3 = (caulk::ipc::synchronous_messenger::eventlink_sender *)((char *)this + 48);
          if (*((void *)this + 6))
          {
            if (*((unsigned char *)this + 56))
            {
              caulk::ipc::synchronous_messenger::eventlink_sender::reset_messaging(this, a2);
              if (a3)
              {
                caulk::mach::os_eventlink::dissociate(v3);
              }
            }
          }
        }
      }
    }
  }
}

void caulk::ipc::synchronous_messenger::eventlink_receiver::ingest_connection_info(uint64_t a1, uint64_t a2, xpc_object_t *a3)
{
  if (!*a3)
  {
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::runtime_error::runtime_error(exception, "no connection info");
    goto LABEL_10;
  }
  if (MEMORY[0x2166753F0]() != MEMORY[0x263EF8708])
  {
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::runtime_error::runtime_error(exception, "no dictionary");
LABEL_10:
    __cxa_throw(exception, MEMORY[0x263F8C1F0], MEMORY[0x263F8C070]);
  }
  xpc_object_t value = xpc_dictionary_get_value(*a3, "payload");
  unint64_t v7 = caulk::mach::details::retain_os_object(value, v6);
  xpc_object_t v34 = v7;
  if (!v7)
  {
    uint64_t v26 = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::runtime_error::runtime_error(v26, "no payload");
    __cxa_throw(v26, MEMORY[0x263F8C1F0], MEMORY[0x263F8C070]);
  }
  caulk::ipc::mapped_memory::mapped_memory((uint64_t)&v31, &v34);
  uint64_t v8 = *(void *)(a1 + 16);
  uint64_t v9 = *(void *)(a1 + 24);
  uint64_t v10 = v32;
  *(void *)(a1 + 16) = v31;
  *(void *)(a1 + 24) = v10;
  uint64_t v31 = v8;
  uint64_t v32 = v9;
  LOBYTE(v8) = *(unsigned char *)(a1 + 32);
  *(unsigned char *)(a1 + 32) = v33;
  char v33 = v8;
  caulk::ipc::mapped_memory::reset((caulk::ipc::mapped_memory *)&v31);
  xpc_object_t v11 = xpc_dictionary_get_value(*a3, "control");
  uint64_t v13 = caulk::mach::details::retain_os_object(v11, v12);
  xpc_object_t v30 = v13;
  if (!v13)
  {
    char v27 = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::runtime_error::runtime_error(v27, "no control");
    __cxa_throw(v27, MEMORY[0x263F8C1F0], MEMORY[0x263F8C070]);
  }
  caulk::ipc::mapped_memory::mapped_memory((uint64_t)&v31, &v30);
  uint64_t v14 = *(void *)(a1 + 40);
  uint64_t v15 = *(void *)(a1 + 48);
  uint64_t v16 = v32;
  *(void *)(a1 + 40) = v31;
  *(void *)(a1 + 48) = v16;
  uint64_t v31 = v14;
  uint64_t v32 = v15;
  LOBYTE(v14) = *(unsigned char *)(a1 + 56);
  *(unsigned char *)(a1 + 56) = v33;
  char v33 = v14;
  caulk::ipc::mapped_memory::reset((caulk::ipc::mapped_memory *)&v31);
  xpc_object_t v17 = xpc_dictionary_get_value(*a3, "eventlink");
  int v19 = caulk::mach::details::retain_os_object(v17, v18);
  char v20 = v19;
  if (!v19)
  {
    long long v28 = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::runtime_error::runtime_error(v28, "no eventlink");
    __cxa_throw(v28, MEMORY[0x263F8C1F0], MEMORY[0x263F8C070]);
  }
  if (MEMORY[0x2166753F0](v19) != MEMORY[0x263EF8748])
  {
    int v29 = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::runtime_error::runtime_error(v29, "object is not a mach send right");
    __cxa_throw(v29, MEMORY[0x263F8C1F0], MEMORY[0x263F8C070]);
  }
  xpc_mach_send_copy_right();
  caulk::mach::os_eventlink::make(&v31);
  uint64_t v21 = *(caulk::mach::details **)(a1 + 64);
  *(void *)(a1 + 64) = v31;
  caulk::mach::details::release_os_object(v21, v22);
  os_release(v20);
  caulk::mach::details::release_os_object((caulk::mach::details *)v13, v23);
  caulk::mach::details::release_os_object((caulk::mach::details *)v7, v24);
}

void sub_2108814F8(_Unwind_Exception *a1)
{
  __cxa_free_exception(v3);
  caulk::mach::details::release_os_object(v4, v6);
  caulk::mach::details::release_os_object(v2, v7);
  caulk::mach::details::release_os_object(v1, v8);
  _Unwind_Resume(a1);
}

uint64_t caulk::ipc::synchronous_messenger::eventlink_receiver::start(caulk::ipc::synchronous_messenger::eventlink_receiver *this, double a2, const caulk::thread::attributes *a3)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  unint64_t v6 = &unk_26C2AB808;
  *(_OWORD *)unint64_t v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  uint64_t v10 = 0;
  uint64_t v3 = caulk::ipc::synchronous_messenger::eventlink_receiver::start((uint64_t)this, (uint64_t)a3, (uint64_t)&v6, a2);
  unint64_t v6 = &unk_26C2AB808;
  caulk::mach::details::release_os_object(v7[0], v4);
  return v3;
}

uint64_t caulk::ipc::synchronous_messenger::eventlink_receiver::start(uint64_t a1, uint64_t a2, uint64_t a3, double a4)
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  if (*(void *)(a1 + 16)
    && *(void *)(a1 + 24)
    && *(void *)(a1 + 40)
    && *(void *)(a1 + 48)
    && *(void *)(a1 + 64))
  {
    std::__optional_copy_base<std::string,false>::__optional_copy_base[abi:ne180100](&__p, (long long *)a2);
    long long v13 = *(_OWORD *)(a2 + 32);
    uint64_t v14 = *(void *)(a2 + 48);
    int v15 = 1;
    char v16 = 1;
    *(_WORD *)(a1 + 184) = 0;
    LODWORD(v17) = 1;
    BYTE4(v17) = 0;
    caulk::mach::semaphore::semaphore(&semaphore);
    std::shared_ptr<caulk::ipc::synchronous_messenger::semaphore_receiver>::shared_ptr[abi:ne180100]<caulk::ipc::synchronous_messenger::semaphore_receiver,void>(&v18, *(void *)a1, *(std::__shared_weak_count **)(a1 + 8));
    double v19 = a4;
    char v20 = &v17;
    p_semaphore_t semaphore = &semaphore;
    os_workgroup_join_token_opaque_s v22 = &unk_26C2AB808;
    int v23 = (caulk::mach::details *)caulk::mach::details::retain_os_object(*(void **)(a3 + 8), v8);
    long long v9 = *(_OWORD *)(a3 + 32);
    long long v24 = *(_OWORD *)(a3 + 16);
    *(_OWORD *)uint64_t v25 = v9;
    *(_OWORD *)&v25[9] = *(_OWORD *)(a3 + 41);
    operator new();
  }
  LODWORD(v17) = 22;
  BYTE4(v17) = 0;
  return v17;
}

{
  void *v8;
  long long v10;
  double v11;
  uint64_t *v12;
  semaphore_t *p_semaphore;
  void *v14;
  caulk::mach::details *v15;
  uint64_t v16;
  char v17;
  semaphore_t semaphore;
  std::string __p;
  long long v20;
  uint64_t v21;
  int v22;
  char v23;
  uint64_t v24;

  if (*(void *)(a1 + 16)
    && *(void *)(a1 + 24)
    && *(void *)(a1 + 40)
    && *(void *)(a1 + 48)
    && *(void *)(a1 + 64))
  {
    std::__optional_copy_base<std::string,false>::__optional_copy_base[abi:ne180100](&__p, (long long *)a2);
    char v20 = *(_OWORD *)(a2 + 32);
    uint64_t v21 = *(void *)(a2 + 48);
    os_workgroup_join_token_opaque_s v22 = 1;
    int v23 = 1;
    *(_WORD *)(a1 + 184) = 0;
    LODWORD(v24) = 1;
    BYTE4(v24) = 0;
    caulk::mach::semaphore::semaphore(&semaphore);
    std::shared_ptr<caulk::ipc::synchronous_messenger::semaphore_receiver>::shared_ptr[abi:ne180100]<caulk::ipc::synchronous_messenger::semaphore_receiver,void>(&v10, *(void *)a1, *(std::__shared_weak_count **)(a1 + 8));
    uint64_t v11 = a4;
    char v12 = &v24;
    p_semaphore_t semaphore = &semaphore;
    uint64_t v14 = &unk_26C2AB7A0;
    int v15 = (caulk::mach::details *)caulk::mach::details::retain_os_object(*(void **)(a3 + 8), v8);
    char v16 = 0;
    uint64_t v17 = 0;
    operator new();
  }
  LODWORD(v24) = 22;
  BYTE4(v24) = 0;
  return v24;
}

void sub_210881958(_Unwind_Exception *exception_object, void *a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22)
{
  if (a2)
  {
    std::unique_ptr<std::tuple<caulk::thread::attributes,caulk::ipc::synchronous_messenger::semaphore_receiver::start(double,caulk::thread::attributes const&,caulk::mach::os_workgroup_managed)::$_0,std::tuple<>>>::~unique_ptr[abi:ne180100](&a22, a2);
    __clang_call_terminate(exception_object);
  }
  _Unwind_Resume(exception_object);
}

uint64_t caulk::thread_proxy<std::tuple<caulk::thread::attributes,caulk::ipc::synchronous_messenger::eventlink_receiver::start(double,caulk::thread::attributes const&,caulk::mach::os_workgroup_managed)::$_0,std::tuple<>>>(uint64_t a1)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  uint64_t v17 = a1;
  caulk::thread::attributes::apply_to_this_thread(a1);
  unint64_t v2 = *(void *)(a1 + 64);
  double v3 = *(double *)(a1 + 80);
  unint64_t v4 = *(char **)(a1 + 88);
  unint64_t v5 = *(unsigned int **)(a1 + 96);
  char v20 = &unk_26C2AB808;
  uint64_t v21 = (caulk::mach::details *)caulk::mach::details::retain_os_object(*(void **)(a1 + 112), v6);
  long long v7 = *(_OWORD *)(a1 + 136);
  long long v22 = *(_OWORD *)(a1 + 120);
  v23[0] = v7;
  *(_OWORD *)((char *)v23 + 9) = *(_OWORD *)(a1 + 145);
  caulk::mach::os_eventlink::associate((caulk::mach::os_eventlink *)(v2 + 64));
  uint64_t v8 = *(void *)(v2 + 104);
  if (v8) {
    (*(void (**)(uint64_t))(*(void *)v8 + 48))(v8);
  }
  int v9 = caulk::mach::os_workgroup_managed::join((caulk::mach::os_workgroup_managed *)&v20);
  uint64_t started = caulk::ipc::synchronous_messenger::eventlink_receiver::start_handshake(v2, v3);
  int v18 = started;
  char v19 = BYTE4(started);
  caulk::expected<BOOL,int>::swap((char *)&v18, v4);
  if (v4[4])
  {
    caulk::expected<BOOL,int>::value((uint64_t)v4);
    BOOL v11 = *v4 != 0;
  }
  else
  {
    BOOL v11 = 0;
  }
  MEMORY[0x2166752E0](*v5);
  if (v11) {
    caulk::ipc::synchronous_messenger::eventlink_receiver::message_loop(v2, v12);
  }
  if (*(unsigned char *)(v2 + 185))
  {
    if (v9) {
      goto LABEL_13;
    }
  }
  else
  {
    caulk::ipc::synchronous_messenger::eventlink_receiver::stop_handshake(v2);
    if (v9) {
      goto LABEL_13;
    }
  }
  caulk::mach::os_workgroup_managed::leave((caulk::mach::os_workgroup_managed *)&v20);
LABEL_13:
  uint64_t v13 = *(void *)(v2 + 168);
  if (v13) {
    (*(void (**)(uint64_t))(*(void *)v13 + 48))(v13);
  }
  caulk::mach::os_eventlink::dissociate((caulk::mach::os_eventlink *)(v2 + 64));
  MEMORY[0x2166752E0](*(unsigned int *)(v2 + 72));
  char v20 = &unk_26C2AB808;
  caulk::mach::details::release_os_object(v21, v14);
  std::unique_ptr<std::tuple<caulk::thread::attributes,caulk::ipc::synchronous_messenger::semaphore_receiver::start(double,caulk::thread::attributes const&,caulk::mach::os_workgroup_managed)::$_0,std::tuple<>>>::~unique_ptr[abi:ne180100](&v17, v15);
  return 0;
}

void sub_210881BAC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, char a12)
{
  if (a2)
  {
    __cxa_begin_catch(exception_object);
    __cxa_end_catch();
    JUMPOUT(0x210881B48);
  }
  _Unwind_Resume(exception_object);
}

uint64_t caulk::ipc::synchronous_messenger::eventlink_receiver::start_handshake(uint64_t a1, double a2)
{
  uint64_t v4 = *(void *)(a1 + 40);
  unint64_t v2 = (void *)(a1 + 40);
  uint64_t v3 = v4;
  unint64_t v5 = (caulk::mach::os_eventlink *)(v2 + 3);
  if (*(v2 - 3)) {
    BOOL v6 = *(v2 - 2) == 0;
  }
  else {
    BOOL v6 = 1;
  }
  BOOL v9 = v6 || v3 == 0 || v2[1] == 0 || v2[3] == 0;
  if (v9
    || (uint64_t v11 = caulk::ipc::mapped_memory::get_ptr<caulk::ipc::synchronous_messenger::details::flow_control>(v2),
        *(_DWORD *)(v11 + 4)))
  {
    uint64_t v12 = 0;
    uint64_t v13 = 0;
    uint64_t v14 = 22;
  }
  else
  {
    char v16 = (_DWORD *)v11;
    *(_DWORD *)(v11 + 4) = 1;
    caulk::mach::os_eventlink::signal_or_error(v5);
    while (1)
    {
      uint64_t v17 = caulk::mach::os_eventlink::timed_wait_or_error(v5, a2);
      if ((v17 & 0x100000000) == 0)
      {
        uint64_t v12 = 0;
        uint64_t v13 = v17 & 0xFFFFFF00;
        uint64_t v14 = v17;
        return v13 | v14 | v12;
      }
      if (!(_BYTE)v17) {
        break;
      }
      if (*v16 == 1)
      {
        uint64_t v13 = v17 & 0xFFFFFF00;
        caulk::mach::os_eventlink::signal_or_error(v5);
        uint64_t v12 = 0x100000000;
        uint64_t v14 = 1;
        return v13 | v14 | v12;
      }
    }
    uint64_t v14 = 0;
    uint64_t v12 = v17 & 0x100000000;
    uint64_t v13 = v17 & 0xFFFFFF00;
  }
  return v13 | v14 | v12;
}

unint64_t caulk::ipc::synchronous_messenger::eventlink_receiver::message_loop(unint64_t this, caulk::ipc::synchronous_messenger::eventlink_receiver *a2)
{
  if (!*(unsigned char *)(this + 184))
  {
    unint64_t v2 = this;
    BOOL v3 = 0;
    uint64_t v4 = (void *)(this + 40);
    unint64_t v5 = (caulk::mach::os_eventlink *)(this + 64);
    unint64_t v6 = this + 16;
    while (1)
    {
      long long v7 = (int *)caulk::ipc::mapped_memory::get_ptr<caulk::ipc::synchronous_messenger::details::flow_control>(v4);
      int v14 = 1;
      unsigned __int8 v15 = 0;
      double v8 = *(double *)(v2 + 176);
      if (!v3) {
        break;
      }
      this = caulk::mach::os_eventlink::timed_wait_signal_or_error(v5, v8);
      int v9 = v15;
      if (HIDWORD(this)) {
        BOOL v10 = v15 == 0;
      }
      else {
        BOOL v10 = 1;
      }
      if (!v10) {
        goto LABEL_21;
      }
      if (!HIDWORD(this)) {
        goto LABEL_19;
      }
      if (v15) {
        goto LABEL_23;
      }
      LOBYTE(v14) = this;
      int v9 = BYTE4(this);
      unsigned __int8 v15 = BYTE4(this);
LABEL_24:
      if (*(unsigned char *)(v2 + 184) || !v9) {
        return this;
      }
      this = caulk::expected<BOOL,int>::value((uint64_t)&v14);
      if (!(_BYTE)v14) {
        goto LABEL_30;
      }
      this = *(void *)(v2 + 136);
      if (!this) {
        goto LABEL_30;
      }
      int v12 = *v7;
      if (*v7 == 1)
      {
        this = (*(uint64_t (**)(unint64_t, unint64_t))(*(void *)this + 48))(this, v6);
LABEL_30:
        int v12 = *v7;
      }
      switch(v12)
      {
        case 1:
          this = caulk::expected<BOOL,int>::value((uint64_t)&v14);
          BOOL v3 = (_BYTE)v14 != 0;
          break;
        case 2:
          BOOL v3 = 0;
          if (*(void *)(v2 + 16)
            && *(void *)(v2 + 24)
            && *(void *)(v2 + 40)
            && *(void *)(v2 + 48)
            && *(void *)(v2 + 64))
          {
            uint64_t v13 = (_DWORD *)caulk::ipc::mapped_memory::get_ptr<caulk::ipc::synchronous_messenger::details::flow_control>(v4);
            v13[1] = 2;
            caulk::mach::os_eventlink::signal_or_error(v5);
            while (1)
            {
              this = caulk::mach::os_eventlink::wait_or_error(v5);
              if (!HIDWORD(this)) {
                break;
              }
              if (*v13 == 1)
              {
                std::string::basic_string[abi:ne180100]<0>(&__p, "eventlink_receiver::reynch_handshake: wait out the eventlink to clear things out for next time R-1");
                caulk::ipc::synchronous_messenger::details::drain_eventlink(v5);
                if (v17 < 0) {
                  operator delete(__p);
                }
                v13[1] = 1;
                this = caulk::mach::os_eventlink::signal_or_error(v5);
                break;
              }
            }
            BOOL v3 = 0;
          }
          break;
        case 0:
          return this;
      }
      if (*(unsigned char *)(v2 + 184)) {
        return this;
      }
    }
    this = caulk::mach::os_eventlink::timed_wait_or_error(v5, v8);
    int v9 = v15;
    if (HIDWORD(this)) {
      BOOL v11 = v15 == 0;
    }
    else {
      BOOL v11 = 1;
    }
    if (v11)
    {
      if (HIDWORD(this))
      {
        if (!v15)
        {
          LOBYTE(v14) = this;
          int v9 = BYTE4(this);
          unsigned __int8 v15 = BYTE4(this);
          goto LABEL_24;
        }
      }
      else
      {
LABEL_19:
        if (v9) {
          return this;
        }
      }
LABEL_23:
      int v14 = this;
      goto LABEL_24;
    }
LABEL_21:
    LOBYTE(v14) = this;
    int v9 = 1;
    goto LABEL_24;
  }
  return this;
}

void sub_210881F30(void *a1)
{
}

uint64_t caulk::ipc::synchronous_messenger::eventlink_receiver::stop_handshake(uint64_t a1)
{
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t result = a1 + 40;
  uint64_t v2 = v3;
  uint64_t v4 = (caulk::mach::os_eventlink *)(result + 24);
  if (*(void *)(result - 24)) {
    BOOL v5 = *(void *)(result - 16) == 0;
  }
  else {
    BOOL v5 = 1;
  }
  if (!v5 && v2 != 0 && *(void *)(result + 8) != 0 && *(void *)(result + 24) != 0)
  {
    uint64_t result = caulk::ipc::mapped_memory::get_ptr<caulk::ipc::synchronous_messenger::details::flow_control>((void *)result);
    if (*(_DWORD *)(result + 4) == 1)
    {
      *(_DWORD *)(result + 4) = 0;
      return caulk::mach::os_eventlink::signal_or_error(v4);
    }
  }
  return result;
}

void sub_21088223C(void *a1, void *a2)
{
  std::unique_ptr<std::tuple<caulk::thread::attributes,caulk::ipc::synchronous_messenger::semaphore_receiver::start(double,caulk::thread::attributes const&,caulk::mach::os_workgroup)::$_0,std::tuple<>>>::~unique_ptr[abi:ne180100]((uint64_t *)(v2 - 72), a2);
  __clang_call_terminate(a1);
}

uint64_t caulk::thread_proxy<std::tuple<caulk::thread::attributes,caulk::ipc::synchronous_messenger::eventlink_receiver::start(double,caulk::thread::attributes const&,caulk::mach::os_workgroup)::$_0,std::tuple<>>>(uint64_t a1)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  uint64_t v15 = a1;
  caulk::thread::attributes::apply_to_this_thread(a1);
  unint64_t v2 = *(void *)(a1 + 64);
  double v3 = *(double *)(a1 + 80);
  uint64_t v4 = *(char **)(a1 + 88);
  BOOL v5 = *(unsigned int **)(a1 + 96);
  char v16 = &unk_26C2AB7A0;
  char v17 = (caulk::mach::details *)caulk::mach::details::retain_os_object(*(void **)(a1 + 112), v6);
  caulk::mach::os_eventlink::associate((caulk::mach::os_eventlink *)(v2 + 64));
  uint64_t v7 = *(void *)(v2 + 104);
  if (v7) {
    (*(void (**)(uint64_t))(*(void *)v7 + 48))(v7);
  }
  char v20 = &v16;
  memset(&v21, 0, sizeof(v21));
  int v22 = caulk::mach::os_workgroup::join((caulk::mach::os_workgroup *)&v16, &v21);
  uint64_t started = caulk::ipc::synchronous_messenger::eventlink_receiver::start_handshake(v2, v3);
  int v18 = started;
  char v19 = BYTE4(started);
  caulk::expected<BOOL,int>::swap((char *)&v18, v4);
  if (v4[4])
  {
    caulk::expected<BOOL,int>::value((uint64_t)v4);
    BOOL v9 = *v4 != 0;
  }
  else
  {
    BOOL v9 = 0;
  }
  MEMORY[0x2166752E0](*v5);
  if (v9) {
    caulk::ipc::synchronous_messenger::eventlink_receiver::message_loop(v2, v10);
  }
  if (!*(unsigned char *)(v2 + 185)) {
    caulk::ipc::synchronous_messenger::eventlink_receiver::stop_handshake(v2);
  }
  if (!v22) {
    caulk::mach::os_workgroup::leave((uint64_t)v20[1], &v21);
  }
  uint64_t v11 = *(void *)(v2 + 168);
  if (v11) {
    (*(void (**)(uint64_t))(*(void *)v11 + 48))(v11);
  }
  caulk::mach::os_eventlink::dissociate((caulk::mach::os_eventlink *)(v2 + 64));
  MEMORY[0x2166752E0](*(unsigned int *)(v2 + 72));
  char v16 = &unk_26C2AB7A0;
  caulk::mach::details::release_os_object(v17, v12);
  std::unique_ptr<std::tuple<caulk::thread::attributes,caulk::ipc::synchronous_messenger::semaphore_receiver::start(double,caulk::thread::attributes const&,caulk::mach::os_workgroup)::$_0,std::tuple<>>>::~unique_ptr[abi:ne180100](&v15, v13);
  return 0;
}

void sub_210882488(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, int a19)
{
  if (a2)
  {
    __cxa_begin_catch(exception_object);
    __cxa_end_catch();
    JUMPOUT(0x210882424);
  }
  _Unwind_Resume(exception_object);
}

void caulk::ipc::synchronous_messenger::eventlink_receiver::stop(caulk::ipc::synchronous_messenger::eventlink_receiver *this, double a2)
{
  if (*((void *)this + 2))
  {
    if (*((void *)this + 3))
    {
      if (*((void *)this + 5))
      {
        if (*((void *)this + 6))
        {
          unint64_t v2 = (caulk::ipc::synchronous_messenger::eventlink_receiver *)((char *)this + 64);
          if (*((void *)this + 8))
          {
            *((unsigned char *)this + 184) = 1;
            caulk::mach::semaphore::timed_wait_or_error((semaphore_t *)this + 18, a2, 1);
            std::string::basic_string[abi:ne180100]<0>(&__p, "eventlink_receiver::stop: wait out the eventlink to clear things out for next time R-1");
            caulk::ipc::synchronous_messenger::details::drain_eventlink(v2);
            if (v4 < 0) {
              operator delete(__p);
            }
          }
        }
      }
    }
  }
}

void caulk::ipc::synchronous_messenger::eventlink_receiver::simulate_crash_for_testing(caulk::ipc::synchronous_messenger::eventlink_receiver *this, double a2)
{
  if (*((void *)this + 2))
  {
    if (*((void *)this + 3))
    {
      if (*((void *)this + 5))
      {
        if (*((void *)this + 6))
        {
          unint64_t v2 = (caulk::ipc::synchronous_messenger::eventlink_receiver *)((char *)this + 64);
          if (*((void *)this + 8))
          {
            *((_WORD *)this + 92) = 257;
            caulk::mach::semaphore::timed_wait_or_error((semaphore_t *)this + 18, a2, 257);
            std::string::basic_string[abi:ne180100]<0>(&__p, "eventlink_receiver::simulate_crash_for_testing: wait out the eventlink to clear things out for next time R-1");
            caulk::ipc::synchronous_messenger::details::drain_eventlink(v2);
            if (v4 < 0) {
              operator delete(__p);
            }
          }
        }
      }
    }
  }
}

void *caulk::alloc::malloc_allocator::allocate(caulk::alloc::malloc_allocator *this, size_t size, size_t alignment)
{
  if (alignment <= 0x10) {
    return malloc_type_malloc(size, 0x8D4B67A0uLL);
  }
  if (alignment > 0x1000) {
    return malloc_type_valloc(size, 0xBAC9A18BuLL);
  }
  memptr = 0;
  if (malloc_type_posix_memalign(&memptr, alignment, size, 0x68A64878uLL)) {
    return 0;
  }
  else {
    return memptr;
  }
}

void caulk::alloc::malloc_allocator::deallocate(int a1, void *a2)
{
}

void *caulk::alloc::malloc_allocator::describe(caulk::alloc::malloc_allocator *this, caulk::alloc::base_allocator::formatter *a2)
{
  caulk::alloc::base_allocator::formatter::emit_string(a2, "malloc_allocator @");
  caulk::alloc::base_allocator::formatter::check_line_start(a2);
  std::ostream::operator<<();

  return caulk::alloc::base_allocator::formatter::emit_string(a2, "\n");
}

void *std::__function::__func<caulk::alloc::page_cache_monitor_impl::page_cache_monitor_impl(caulk::alloc::page_cache_monitor &,caulk::shared_ptr_mutex<caulk::mach::unfair_lock> &,unsigned long)::$_1,std::allocator<caulk::alloc::page_cache_monitor_impl::page_cache_monitor_impl(caulk::alloc::page_cache_monitor &,caulk::shared_ptr_mutex<caulk::mach::unfair_lock> &,unsigned long)::$_1>,void ()(unsigned long,unsigned long)>::target_type()
{
}

uint64_t std::__function::__func<caulk::alloc::page_cache_monitor_impl::page_cache_monitor_impl(caulk::alloc::page_cache_monitor &,caulk::shared_ptr_mutex<caulk::mach::unfair_lock> &,unsigned long)::$_1,std::allocator<caulk::alloc::page_cache_monitor_impl::page_cache_monitor_impl(caulk::alloc::page_cache_monitor &,caulk::shared_ptr_mutex<caulk::mach::unfair_lock> &,unsigned long)::$_1>,void ()(unsigned long,unsigned long)>::target(uint64_t a1, uint64_t a2)
{
  if (std::type_info::operator==[abi:ne180100](*(void *)(a2 + 8), (uint64_t)"ZN5caulk5alloc23page_cache_monitor_implC1ERNS0_18page_cache_monitorERNS_16shared_ptr_mutexINS_4mach11unfair_lockEEEmE3$_1"))
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

uint64_t std::__function::__func<caulk::alloc::page_cache_monitor_impl::page_cache_monitor_impl(caulk::alloc::page_cache_monitor &,caulk::shared_ptr_mutex<caulk::mach::unfair_lock> &,unsigned long)::$_1,std::allocator<caulk::alloc::page_cache_monitor_impl::page_cache_monitor_impl(caulk::alloc::page_cache_monitor &,caulk::shared_ptr_mutex<caulk::mach::unfair_lock> &,unsigned long)::$_1>,void ()(unsigned long,unsigned long)>::__clone(uint64_t result, void *a2)
{
  uint64_t v2 = *(void *)(result + 8);
  *a2 = &unk_26C2AAEA8;
  a2[1] = v2;
  return result;
}

void *std::__function::__func<caulk::alloc::page_cache_monitor_impl::page_cache_monitor_impl(caulk::alloc::page_cache_monitor &,caulk::shared_ptr_mutex<caulk::mach::unfair_lock> &,unsigned long)::$_1,std::allocator<caulk::alloc::page_cache_monitor_impl::page_cache_monitor_impl(caulk::alloc::page_cache_monitor &,caulk::shared_ptr_mutex<caulk::mach::unfair_lock> &,unsigned long)::$_1>,void ()(unsigned long,unsigned long)>::__clone(uint64_t a1)
{
  uint64_t result = operator new(0x10uLL);
  uint64_t v3 = *(void *)(a1 + 8);
  *uint64_t result = &unk_26C2AAEA8;
  result[1] = v3;
  return result;
}

void std::__function::__func<caulk::alloc::page_cache_monitor_impl::page_cache_monitor_impl(caulk::alloc::page_cache_monitor &,caulk::shared_ptr_mutex<caulk::mach::unfair_lock> &,unsigned long)::$_1,std::allocator<caulk::alloc::page_cache_monitor_impl::page_cache_monitor_impl(caulk::alloc::page_cache_monitor &,caulk::shared_ptr_mutex<caulk::mach::unfair_lock> &,unsigned long)::$_1>,void ()(unsigned long,unsigned long)>::~__func()
{
}

void *std::__function::__func<caulk::alloc::page_cache_monitor_impl::page_cache_monitor_impl(caulk::alloc::page_cache_monitor &,caulk::shared_ptr_mutex<caulk::mach::unfair_lock> &,unsigned long)::$_0,std::allocator<caulk::alloc::page_cache_monitor_impl::page_cache_monitor_impl(caulk::alloc::page_cache_monitor &,caulk::shared_ptr_mutex<caulk::mach::unfair_lock> &,unsigned long)::$_0>,void ()(void)>::target_type()
{
}

uint64_t std::__function::__func<caulk::alloc::page_cache_monitor_impl::page_cache_monitor_impl(caulk::alloc::page_cache_monitor &,caulk::shared_ptr_mutex<caulk::mach::unfair_lock> &,unsigned long)::$_0,std::allocator<caulk::alloc::page_cache_monitor_impl::page_cache_monitor_impl(caulk::alloc::page_cache_monitor &,caulk::shared_ptr_mutex<caulk::mach::unfair_lock> &,unsigned long)::$_0>,void ()(void)>::target(uint64_t a1, uint64_t a2)
{
  if (std::type_info::operator==[abi:ne180100](*(void *)(a2 + 8), (uint64_t)"ZN5caulk5alloc23page_cache_monitor_implC1ERNS0_18page_cache_monitorERNS_16shared_ptr_mutexINS_4mach11unfair_lockEEEmE3$_0"))
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

void std::__function::__func<caulk::alloc::page_cache_monitor_impl::page_cache_monitor_impl(caulk::alloc::page_cache_monitor &,caulk::shared_ptr_mutex<caulk::mach::unfair_lock> &,unsigned long)::$_0,std::allocator<caulk::alloc::page_cache_monitor_impl::page_cache_monitor_impl(caulk::alloc::page_cache_monitor &,caulk::shared_ptr_mutex<caulk::mach::unfair_lock> &,unsigned long)::$_0>,void ()(void)>::destroy_deallocate(void *__p)
{
  uint64_t v2 = (std::__shared_weak_count *)__p[2];
  if (v2) {
    std::__shared_weak_count::__release_weak(v2);
  }

  operator delete(__p);
}

void std::__function::__func<caulk::alloc::page_cache_monitor_impl::page_cache_monitor_impl(caulk::alloc::page_cache_monitor &,caulk::shared_ptr_mutex<caulk::mach::unfair_lock> &,unsigned long)::$_0,std::allocator<caulk::alloc::page_cache_monitor_impl::page_cache_monitor_impl(caulk::alloc::page_cache_monitor &,caulk::shared_ptr_mutex<caulk::mach::unfair_lock> &,unsigned long)::$_0>,void ()(void)>::destroy(uint64_t a1)
{
  uint64_t v1 = *(std::__shared_weak_count **)(a1 + 16);
  if (v1) {
    std::__shared_weak_count::__release_weak(v1);
  }
}

uint64_t std::__function::__func<caulk::alloc::page_cache_monitor_impl::page_cache_monitor_impl(caulk::alloc::page_cache_monitor &,caulk::shared_ptr_mutex<caulk::mach::unfair_lock> &,unsigned long)::$_0,std::allocator<caulk::alloc::page_cache_monitor_impl::page_cache_monitor_impl(caulk::alloc::page_cache_monitor &,caulk::shared_ptr_mutex<caulk::mach::unfair_lock> &,unsigned long)::$_0>,void ()(void)>::__clone(uint64_t result, void *a2)
{
  uint64_t v3 = *(void *)(result + 8);
  uint64_t v2 = *(void *)(result + 16);
  *a2 = &unk_26C2AAE50;
  a2[1] = v3;
  a2[2] = v2;
  if (v2) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v2 + 16), 1uLL, memory_order_relaxed);
  }
  return result;
}

void *std::__function::__func<caulk::alloc::page_cache_monitor_impl::page_cache_monitor_impl(caulk::alloc::page_cache_monitor &,caulk::shared_ptr_mutex<caulk::mach::unfair_lock> &,unsigned long)::$_0,std::allocator<caulk::alloc::page_cache_monitor_impl::page_cache_monitor_impl(caulk::alloc::page_cache_monitor &,caulk::shared_ptr_mutex<caulk::mach::unfair_lock> &,unsigned long)::$_0>,void ()(void)>::__clone(uint64_t a1)
{
  uint64_t result = operator new(0x18uLL);
  uint64_t v4 = *(void *)(a1 + 8);
  uint64_t v3 = *(void *)(a1 + 16);
  *uint64_t result = &unk_26C2AAE50;
  result[1] = v4;
  result[2] = v3;
  if (v3) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v3 + 16), 1uLL, memory_order_relaxed);
  }
  return result;
}

void std::__function::__func<caulk::alloc::page_cache_monitor_impl::page_cache_monitor_impl(caulk::alloc::page_cache_monitor &,caulk::shared_ptr_mutex<caulk::mach::unfair_lock> &,unsigned long)::$_0,std::allocator<caulk::alloc::page_cache_monitor_impl::page_cache_monitor_impl(caulk::alloc::page_cache_monitor &,caulk::shared_ptr_mutex<caulk::mach::unfair_lock> &,unsigned long)::$_0>,void ()(void)>::~__func(void *a1)
{
  *a1 = &unk_26C2AAE50;
  uint64_t v1 = (std::__shared_weak_count *)a1[2];
  if (v1) {
    std::__shared_weak_count::__release_weak(v1);
  }

  JUMPOUT(0x216674B00);
}

void *std::__function::__func<caulk::alloc::page_cache_monitor_impl::page_cache_monitor_impl(caulk::alloc::page_cache_monitor &,caulk::shared_ptr_mutex<caulk::mach::unfair_lock> &,unsigned long)::$_0,std::allocator<caulk::alloc::page_cache_monitor_impl::page_cache_monitor_impl(caulk::alloc::page_cache_monitor &,caulk::shared_ptr_mutex<caulk::mach::unfair_lock> &,unsigned long)::$_0>,void ()(void)>::~__func(void *a1)
{
  *a1 = &unk_26C2AAE50;
  uint64_t v2 = (std::__shared_weak_count *)a1[2];
  if (v2) {
    std::__shared_weak_count::__release_weak(v2);
  }
  return a1;
}

void std::__shared_ptr_emplace<caulk::details::lifetime_guard_base<caulk::alloc::page_cache_monitor>::control_block,std::allocator<caulk::details::lifetime_guard_base<caulk::alloc::page_cache_monitor>::control_block>>::__on_zero_shared(uint64_t a1)
{
  __dmb(0xBu);
  uint64_t v2 = *(void *)(a1 + 40);
  if ((atomic_fetch_add_explicit((atomic_uint *volatile)(v2 + 32), 1u, memory_order_release) & 0x80000000) != 0) {
    MEMORY[0x2166752E0](*(unsigned int *)(v2 + 24));
  }
  uint64_t v3 = *(std::__shared_weak_count **)(a1 + 32);
  if (v3)
  {
    std::__shared_weak_count::__release_weak(v3);
  }
}

void std::__shared_ptr_emplace<caulk::details::lifetime_guard_base<caulk::alloc::page_cache_monitor>::control_block,std::allocator<caulk::details::lifetime_guard_base<caulk::alloc::page_cache_monitor>::control_block>>::~__shared_ptr_emplace(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)&unk_26C2ABDA0;
  std::__shared_weak_count::~__shared_weak_count(a1);

  JUMPOUT(0x216674B00);
}

void std::__shared_ptr_emplace<caulk::details::lifetime_guard_base<caulk::alloc::page_cache_monitor>::control_block,std::allocator<caulk::details::lifetime_guard_base<caulk::alloc::page_cache_monitor>::control_block>>::~__shared_ptr_emplace(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&unk_26C2ABDA0;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void std::__shared_ptr_emplace<caulk::alloc::preallocation_reservation>::__on_zero_shared(void *a1)
{
  caulk::lifetime_guard<caulk::alloc::page_cache_monitor,caulk::shared_ptr_mutex<caulk::mach::unfair_lock>>::weak_ref::lock(&v14, a1 + 5);
  uint64_t v2 = v14;
  if (v14)
  {
    os_unfair_lock_lock(*(os_unfair_lock_t *)(v14 + 24));
    uint64_t v3 = *(uint64_t ***)(v2 + 40);
    if (v3)
    {
      uint64_t v4 = v3[21];
      BOOL v5 = v3[22];
      while (v4 != v5)
      {
        uint64_t v6 = v4[1];
        if (!v6 || *(void *)(v6 + 8) == -1)
        {
          if (v4 != v5)
          {
            uint64_t v7 = v4 + 2;
            if (v4 + 2 != v5)
            {
              do
              {
                uint64_t v8 = v7[1];
                if (v8 && *(void *)(v8 + 8) != -1)
                {
                  uint64_t v9 = *v7;
                  *uint64_t v7 = 0;
                  v7[1] = 0;
                  BOOL v10 = (std::__shared_weak_count *)v4[1];
                  *uint64_t v4 = v9;
                  v4[1] = v8;
                  if (v10) {
                    std::__shared_weak_count::__release_weak(v10);
                  }
                  v4 += 2;
                }
                v7 += 2;
              }
              while (v7 != v5);
              BOOL v5 = v3[22];
            }
          }
          if (v4 != v5)
          {
            while (v5 != v4)
            {
              uint64_t v11 = (std::__shared_weak_count *)*(v5 - 1);
              if (v11) {
                std::__shared_weak_count::__release_weak(v11);
              }
              v5 -= 2;
            }
            v3[22] = v4;
          }
          break;
        }
        v4 += 2;
      }
      caulk::alloc::page_cache_monitor_impl::evaluate_reservations(v3);
    }
    os_unfair_lock_unlock(*(os_unfair_lock_t *)(v2 + 24));
  }
  if (v15) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v15);
  }
  int v12 = (std::__shared_weak_count *)a1[6];
  if (v12) {
    std::__shared_weak_count::__release_weak(v12);
  }
  uint64_t v13 = (std::__shared_weak_count *)a1[4];
  if (v13)
  {
    std::__shared_weak_count::__release_weak(v13);
  }
}

void sub_210882C50(void *a1)
{
  os_unfair_lock_unlock(*(os_unfair_lock_t *)(v1 + 24));
  __clang_call_terminate(a1);
}

void std::__shared_ptr_emplace<caulk::alloc::preallocation_reservation>::~__shared_ptr_emplace(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)&unk_26C2ABD68;
  std::__shared_weak_count::~__shared_weak_count(a1);

  JUMPOUT(0x216674B00);
}

void std::__shared_ptr_emplace<caulk::alloc::preallocation_reservation>::~__shared_ptr_emplace(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&unk_26C2ABD68;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void caulk::alloc::page_cache_monitor::enable_preallocation(caulk::alloc::page_cache_monitor *this, uint64_t a2)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  caulk::alloc::init_realtime_safe_resource(this);
  os_unfair_lock_lock(*((os_unfair_lock_t *)this + 3));
  if (a2)
  {
    if (!*((void *)this + 5)) {
      operator new();
    }
  }
  else
  {
    std::unique_ptr<caulk::alloc::page_cache_monitor_impl>::reset[abi:ne180100]((uint64_t *)this + 5, 0);
  }
  uint64_t v4 = (os_unfair_lock_s *)*((void *)this + 3);

  os_unfair_lock_unlock(v4);
}

void sub_210883158(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13)
{
  if (a2) {
    __clang_call_terminate(exception_object);
  }
  _Unwind_Resume(exception_object);
}

uint64_t caulk::mach::semaphore::semaphore(uint64_t this, int a2)
{
  *(_DWORD *)this = a2;
  *(unsigned char *)(this + 4) = 0;
  return this;
}

{
  *(_DWORD *)this = a2;
  *(unsigned char *)(this + 4) = 0;
  return this;
}

uint64_t caulk::mach::semaphore::semaphore(uint64_t result, int *a2)
{
  *(_DWORD *)uint64_t result = 0;
  *(unsigned char *)(result + 4) = 0;
  int v2 = *a2;
  *a2 = 0;
  *(_DWORD *)uint64_t result = v2;
  LOBYTE(v2) = *((unsigned char *)a2 + 4);
  *((unsigned char *)a2 + 4) = 0;
  *(unsigned char *)(result + 4) = v2;
  return result;
}

{
  int v2;

  *(_DWORD *)uint64_t result = 0;
  *(unsigned char *)(result + 4) = 0;
  int v2 = *a2;
  *a2 = 0;
  *(_DWORD *)uint64_t result = v2;
  LOBYTE(v2) = *((unsigned char *)a2 + 4);
  *((unsigned char *)a2 + 4) = 0;
  *(unsigned char *)(result + 4) = v2;
  return result;
}

uint64_t caulk::mach::semaphore::operator=(uint64_t a1, int *a2)
{
  if (*(unsigned char *)(a1 + 4) && *(_DWORD *)a1) {
    semaphore_destroy(*MEMORY[0x263EF8960], *(_DWORD *)a1);
  }
  int v4 = *a2;
  *a2 = 0;
  *(_DWORD *)a1 = v4;
  LOBYTE(v4) = *((unsigned char *)a2 + 4);
  *((unsigned char *)a2 + 4) = 0;
  *(unsigned char *)(a1 + 4) = v4;
  return a1;
}

BOOL caulk::mach::semaphore::signal(caulk::mach::semaphore *this)
{
  return MEMORY[0x2166752E0](*(unsigned int *)this) == 0;
}

unint64_t caulk::mach::semaphore::signal_or_error(caulk::mach::semaphore *this)
{
  unsigned int v1 = MEMORY[0x2166752E0](*(unsigned int *)this);
  return v1 | ((unint64_t)(v1 == 0) << 32);
}

unint64_t caulk::mach::semaphore::signal_all_or_error(caulk::mach::semaphore *this)
{
  unsigned int v1 = MEMORY[0x2166752F0](*(unsigned int *)this);
  return v1 | ((unint64_t)(v1 == 0) << 32);
}

BOOL caulk::mach::semaphore::timed_wait@<W0>(semaphore_t *this@<X0>, double a2@<D0>, uint64_t a3@<X8>)
{
  LODWORD(a3) = vcvtmd_u64_f64(a2);
  unint64_t v4 = a3 | ((unint64_t)(int)((a2 - floor(a2)) * 1000000000.0) << 32);
  do
  {
    mach_timespec_t v5 = (mach_timespec_t)v4;
    uint64_t v6 = (const char *)semaphore_timedwait(*this, v5);
  }
  while (v6 == 14);
  int v7 = (int)v6;
  if (v6 == 49) {
    return 0;
  }
  caulk::mach::throw_if_mach_error((uint64_t)"semaphore::timed_wait failed", v6);
  return v7 == 0;
}

BOOL caulk::mach::semaphore::wait(caulk::mach::semaphore *this)
{
  do
    int v2 = MEMORY[0x216675320](*(unsigned int *)this);
  while (v2 == 14);
  return v2 == 0;
}

uint64_t caulk::mach::semaphore::wait_or_error(caulk::mach::semaphore *this)
{
  do
    LODWORD(result) = MEMORY[0x216675320](*(unsigned int *)this);
  while (result == 14);
  if (result) {
    return result;
  }
  else {
    return 0x100000000;
  }
}

BOOL caulk::mach::semaphore::timed_wait_signal@<W0>(semaphore_t *this@<X0>, semaphore_t *a2@<X1>, double a3@<D0>, uint64_t a4@<X8>)
{
  LODWORD(a4) = vcvtmd_u64_f64(a3);
  unint64_t v6 = a4 | ((unint64_t)(int)((a3 - floor(a3)) * 1000000000.0) << 32);
  do
  {
    mach_timespec_t v7 = (mach_timespec_t)v6;
    uint64_t v8 = (const char *)semaphore_timedwait_signal(*this, *a2, v7);
  }
  while (v8 == 14);
  int v9 = (int)v8;
  if (v8 == 49) {
    return 0;
  }
  caulk::mach::throw_if_mach_error((uint64_t)"semaphore::timed_wait_signal failed", v8);
  return v9 == 0;
}

uint64_t caulk::mach::semaphore::timed_wait_signal_or_error@<X0>(semaphore_t *this@<X0>, semaphore_t *a2@<X1>, double a3@<D0>, uint64_t a4@<X8>)
{
  kern_return_t v8;
  uint64_t v9;
  uint64_t v10;
  unsigned int v11;
  int v12;
  int v13;
  unsigned int v14;

  LODWORD(a4) = vcvtmd_u64_f64(a3);
  unint64_t v6 = a4 | ((unint64_t)(int)((a3 - floor(a3)) * 1000000000.0) << 32);
  do
  {
    mach_timespec_t v7 = (mach_timespec_t)v6;
    uint64_t v8 = semaphore_timedwait_signal(*this, *a2, v7);
  }
  while (v8 == 14);
  int v9 = 0x100000000;
  BOOL v10 = 0x100000000;
  uint64_t v11 = v8 & 0xFFFFFF00;
  int v12 = v8;
  if (v8 == 49) {
    int v12 = 0;
  }
  else {
    BOOL v10 = 0;
  }
  if (v8 == 49) {
    uint64_t v11 = 0;
  }
  if (v8)
  {
    int v9 = v10;
    uint64_t v13 = v12;
  }
  else
  {
    uint64_t v13 = 1;
  }
  if (v8) {
    uint64_t v14 = v11;
  }
  else {
    uint64_t v14 = 0;
  }
  return v9 | v14 | v13;
}

BOOL caulk::mach::semaphore::wait_signal(caulk::mach::semaphore *this, caulk::mach::semaphore *a2)
{
  do
    int v4 = MEMORY[0x216675330](*(unsigned int *)this, *(unsigned int *)a2);
  while (v4 == 14);
  return v4 == 0;
}

uint64_t caulk::mach::semaphore::wait_signal_or_error(caulk::mach::semaphore *this, caulk::mach::semaphore *a2)
{
  do
    LODWORD(result) = MEMORY[0x216675330](*(unsigned int *)this, *(unsigned int *)a2);
  while (result == 14);
  if (result) {
    return result;
  }
  else {
    return 0x100000000;
  }
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x270EE4E10](cf);
}

CFComparisonResult CFStringCompare(CFStringRef theString1, CFStringRef theString2, CFStringCompareFlags compareOptions)
{
  return MEMORY[0x270EE5048](theString1, theString2, compareOptions);
}

CFStringRef CFStringCreateWithBytes(CFAllocatorRef alloc, const UInt8 *bytes, CFIndex numBytes, CFStringEncoding encoding, Boolean isExternalRepresentation)
{
  return (CFStringRef)MEMORY[0x270EE50D0](alloc, bytes, numBytes, *(void *)&encoding, isExternalRepresentation);
}

CFStringRef CFStringCreateWithCString(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding)
{
  return (CFStringRef)MEMORY[0x270EE50E0](alloc, cStr, *(void *)&encoding);
}

const char *__cdecl CFStringGetCStringPtr(CFStringRef theString, CFStringEncoding encoding)
{
  return (const char *)MEMORY[0x270EE5180](theString, *(void *)&encoding);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

const char *__cdecl std::runtime_error::what(const std::runtime_error *this)
{
  return (const char *)MEMORY[0x270F98200](this);
}

const std::locale::facet *__cdecl std::locale::use_facet(const std::locale *this, std::locale::id *a2)
{
  return (const std::locale::facet *)MEMORY[0x270F982E8](this, a2);
}

std::locale std::ios_base::getloc(const std::ios_base *this)
{
  return (std::locale)MEMORY[0x270F982F8](this);
}

const char *__cdecl std::exception::what(const std::exception *this)
{
  return (const char *)MEMORY[0x270F98310](this);
}

std::logic_error *__cdecl std::logic_error::logic_error(std::logic_error *this, const char *a2)
{
  return (std::logic_error *)MEMORY[0x270F98330](this, a2);
}

std::runtime_error *__cdecl std::runtime_error::runtime_error(std::runtime_error *this, const char *a2)
{
  return (std::runtime_error *)MEMORY[0x270F983B0](this, a2);
}

{
  return (std::runtime_error *)MEMORY[0x270F983C8](this, a2);
}

std::runtime_error *__cdecl std::runtime_error::runtime_error(std::runtime_error *this, const std::runtime_error *a2)
{
  return (std::runtime_error *)MEMORY[0x270F983D8](this, a2);
}

void std::runtime_error::~runtime_error(std::runtime_error *this)
{
}

std::bad_array_new_length *__cdecl std::bad_array_new_length::bad_array_new_length(std::bad_array_new_length *this)
{
  return (std::bad_array_new_length *)MEMORY[0x270F98428](this);
}

void std::this_thread::sleep_for (const std::chrono::nanoseconds *__ns)
{
}

void std::string::__grow_by_and_replace(std::string *this, std::string::size_type __old_cap, std::string::size_type __delta_cap, std::string::size_type __old_sz, std::string::size_type __n_copy, std::string::size_type __n_del, std::string::size_type __n_add, const std::string::value_type *__p_new_stuff)
{
}

std::string *__cdecl std::string::append(std::string *this, const std::string::value_type *__s, std::string::size_type __n)
{
  return (std::string *)MEMORY[0x270F984A0](this, __s, __n);
}

std::system_error *__cdecl std::system_error::system_error(std::system_error *this, int __ev, const std::error_category *__ecat, const char *__what_arg)
{
  return (std::system_error *)MEMORY[0x270F98610](this, *(void *)&__ev, __ecat, __what_arg);
}

void std::system_error::~system_error(std::system_error *this)
{
}

uint64_t std::filebuf::open()
{
  return MEMORY[0x270F98638]();
}

uint64_t std::filebuf::basic_filebuf()
{
  return MEMORY[0x270F98650]();
}

uint64_t std::filebuf::~filebuf()
{
  return MEMORY[0x270F98658]();
}

uint64_t std::ostream::put()
{
  return MEMORY[0x270F98740]();
}

uint64_t std::ostream::flush()
{
  return MEMORY[0x270F98748]();
}

uint64_t std::ostream::write()
{
  return MEMORY[0x270F98750]();
}

uint64_t std::ostream::sentry::sentry()
{
  return MEMORY[0x270F98758]();
}

uint64_t std::ostream::sentry::~sentry()
{
  return MEMORY[0x270F98760]();
}

uint64_t std::ostream::~ostream()
{
  return MEMORY[0x270F98770]();
}

uint64_t std::ostream::operator<<()
{
  return MEMORY[0x270F98778]();
}

{
  return MEMORY[0x270F987A8]();
}

{
  return MEMORY[0x270F987B0]();
}

{
  return MEMORY[0x270F987C0]();
}

{
  return MEMORY[0x270F987E0]();
}

void std::error_category::~error_category(std::error_category *this)
{
}

const std::error_category *std::generic_category(void)
{
  return (const std::error_category *)MEMORY[0x270F98918]();
}

void std::__shared_weak_count::__release_weak(std::__shared_weak_count *this)
{
}

std::__shared_weak_count *__cdecl std::__shared_weak_count::lock(std::__shared_weak_count *this)
{
  return (std::__shared_weak_count *)MEMORY[0x270F989E8](this);
}

void std::__shared_weak_count::~__shared_weak_count(std::__shared_weak_count *this)
{
}

void std::pmr::memory_resource::~memory_resource(std::pmr::memory_resource *this)
{
}

void std::locale::~locale(std::locale *this)
{
}

void std::ios_base::__set_badbit_and_consider_rethrow(std::ios_base *this)
{
}

void std::ios_base::init(std::ios_base *this, void *__sb)
{
}

void std::ios_base::clear(std::ios_base *this, std::ios_base::iostate __state)
{
}

uint64_t std::ios::~ios()
{
  return MEMORY[0x270F98DE8]();
}

std::string *__cdecl std::to_string(std::string *__return_ptr retstr, int __val)
{
  return (std::string *)MEMORY[0x270F98E08](retstr, *(void *)&__val);
}

std::string *__cdecl std::to_string(std::string *__return_ptr retstr, unsigned int __val)
{
  return (std::string *)MEMORY[0x270F98E10](retstr, *(void *)&__val);
}

uint64_t std::operator+<char>()
{
  return MEMORY[0x270F98E38]();
}

std::bad_alloc *__cdecl std::bad_alloc::bad_alloc(std::bad_alloc *this)
{
  return (std::bad_alloc *)MEMORY[0x270F98E58](this);
}

void std::exception::~exception(std::exception *this)
{
}

void std::terminate(void)
{
}

void operator delete(void *__p)
{
  while (1)
    ;
}

void operator delete()
{
  while (1)
    ;
}

void *__cdecl operator new(size_t __sz)
{
  while (1)
    ;
}

void operator new()
{
  while (1)
    ;
}

void *__cxa_allocate_exception(size_t thrown_size)
{
  return (void *)MEMORY[0x270F98EC0](thrown_size);
}

void *__cxa_begin_catch(void *a1)
{
  return (void *)MEMORY[0x270F98ED8](a1);
}

void __cxa_end_catch(void)
{
}

void __cxa_free_exception(void *a1)
{
}

void __cxa_guard_abort(__guard *a1)
{
}

int __cxa_guard_acquire(__guard *a1)
{
  return MEMORY[0x270F98F10](a1);
}

void __cxa_guard_release(__guard *a1)
{
}

void __cxa_throw(void *a1, struct type_info *lptinfo, void (*a3)(void *))
{
}

int *__error(void)
{
  return (int *)MEMORY[0x270ED7DC0]();
}

uint64_t _os_assert_log()
{
  return MEMORY[0x270ED8050]();
}

uint64_t _os_crash()
{
  return MEMORY[0x270ED8060]();
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void bzero(void *a1, size_t a2)
{
}

void dispatch_assert_queue_not_V2(dispatch_queue_t queue)
{
}

void dispatch_async_f(dispatch_queue_t queue, void *context, dispatch_function_t work)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x270ED9318](identifier, flags);
}

const char *__cdecl dispatch_queue_get_label(dispatch_queue_t queue)
{
  return (const char *)MEMORY[0x270ED9470](queue);
}

void dispatch_release(dispatch_object_t object)
{
}

void dispatch_resume(dispatch_object_t object)
{
}

void dispatch_retain(dispatch_object_t object)
{
}

void dispatch_source_cancel(dispatch_source_t source)
{
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x270ED9510](type, handle, mask, queue);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

void dispatch_source_set_timer(dispatch_source_t source, dispatch_time_t start, uint64_t interval, uint64_t leeway)
{
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_sync_f(dispatch_queue_t queue, void *context, dispatch_function_t work)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x270ED95A8](when, delta);
}

void free(void *a1)
{
}

pid_t getpid(void)
{
  return MEMORY[0x270ED9CE0]();
}

uint64_t mach_absolute_time(void)
{
  return MEMORY[0x270EDA138]();
}

char *__cdecl mach_error_string(mach_error_t error_value)
{
  return (char *)MEMORY[0x270EDA168](*(void *)&error_value);
}

mach_msg_return_t mach_msg(mach_msg_header_t *msg, mach_msg_option_t option, mach_msg_size_t send_size, mach_msg_size_t rcv_size, mach_port_name_t rcv_name, mach_msg_timeout_t timeout, mach_port_name_t notify)
{
  return MEMORY[0x270EDA190](msg, *(void *)&option, *(void *)&send_size, *(void *)&rcv_size, *(void *)&rcv_name, *(void *)&timeout, *(void *)&notify);
}

kern_return_t mach_port_allocate(ipc_space_t task, mach_port_right_t right, mach_port_name_t *name)
{
  return MEMORY[0x270EDA1B0](*(void *)&task, *(void *)&right, name);
}

kern_return_t mach_port_deallocate(ipc_space_t task, mach_port_name_t name)
{
  return MEMORY[0x270EDA1C8](*(void *)&task, *(void *)&name);
}

kern_return_t mach_port_insert_right(ipc_space_t task, mach_port_name_t name, mach_port_t poly, mach_msg_type_name_t polyPoly)
{
  return MEMORY[0x270EDA200](*(void *)&task, *(void *)&name, *(void *)&poly, *(void *)&polyPoly);
}

kern_return_t mach_port_mod_refs(ipc_space_t task, mach_port_name_t name, mach_port_right_t right, mach_port_delta_t delta)
{
  return MEMORY[0x270EDA210](*(void *)&task, *(void *)&name, *(void *)&right, *(void *)&delta);
}

int madvise(void *a1, size_t a2, int a3)
{
  return MEMORY[0x270EDA320](a1, a2, *(void *)&a3);
}

malloc_zone_t *__cdecl malloc_create_zone(vm_size_t start_size, unsigned int flags)
{
  return (malloc_zone_t *)MEMORY[0x270EDA330](start_size, *(void *)&flags);
}

void malloc_destroy_zone(malloc_zone_t *zone)
{
}

const char *__cdecl malloc_get_zone_name(malloc_zone_t *zone)
{
  return (const char *)MEMORY[0x270EDA350](zone);
}

void malloc_set_zone_name(malloc_zone_t *zone, const char *name)
{
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA390](size, type_id);
}

int malloc_type_posix_memalign(void **memptr, size_t alignment, size_t size, malloc_type_id_t type_id)
{
  return MEMORY[0x270EDA398](memptr, alignment, size, type_id);
}

void *__cdecl malloc_type_valloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA3A8](size, type_id);
}

void *__cdecl malloc_type_zone_malloc(malloc_zone_t *zone, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA3B8](zone, size, type_id);
}

void *__cdecl malloc_type_zone_memalign(malloc_zone_t *zone, size_t alignment, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA3C0](zone, alignment, size, type_id);
}

void *__cdecl malloc_type_zone_valloc(malloc_zone_t *zone, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA3D0](zone, size, type_id);
}

void malloc_zone_free(malloc_zone_t *zone, void *ptr)
{
}

void malloc_zone_register(malloc_zone_t *zone)
{
}

void malloc_zone_unregister(malloc_zone_t *zone)
{
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x270EDA488](__dst, __src, __len);
}

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return (void *)MEMORY[0x270EDA498](__b, *(void *)&__c, __len);
}

int mlock(const void *a1, size_t a2)
{
  return MEMORY[0x270EDA590](a1, a2);
}

void *__cdecl mmap(void *a1, size_t a2, int a3, int a4, int a5, off_t a6)
{
  return (void *)MEMORY[0x270EDA598](a1, a2, *(void *)&a3, *(void *)&a4, *(void *)&a5, a6);
}

int mprotect(void *a1, size_t a2, int a3)
{
  return MEMORY[0x270EDA5C0](a1, a2, *(void *)&a3);
}

int munlock(const void *a1, size_t a2)
{
  return MEMORY[0x270EDA5E8](a1, a2);
}

int munmap(void *a1, size_t a2)
{
  return MEMORY[0x270EDA5F8](a1, a2);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return MEMORY[0x270EDA770](name, out_token, queue, handler);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x270F9A540]();
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x270F9A5A8]();
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x270F9A880](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A888](a1);
}

uint64_t os_eventlink_activate()
{
  return MEMORY[0x270EDA930]();
}

uint64_t os_eventlink_associate()
{
  return MEMORY[0x270EDA938]();
}

uint64_t os_eventlink_create()
{
  return MEMORY[0x270EDA948]();
}

uint64_t os_eventlink_create_with_port()
{
  return MEMORY[0x270EDA950]();
}

uint64_t os_eventlink_disassociate()
{
  return MEMORY[0x270EDA958]();
}

uint64_t os_eventlink_extract_remote_port()
{
  return MEMORY[0x270EDA960]();
}

uint64_t os_eventlink_signal()
{
  return MEMORY[0x270EDA968]();
}

uint64_t os_eventlink_signal_and_wait()
{
  return MEMORY[0x270EDA970]();
}

uint64_t os_eventlink_signal_and_wait_until()
{
  return MEMORY[0x270EDA978]();
}

uint64_t os_eventlink_wait()
{
  return MEMORY[0x270EDA980]();
}

uint64_t os_eventlink_wait_until()
{
  return MEMORY[0x270EDA988]();
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x270EDA9A0](subsystem, category);
}

uint64_t os_log_pack_send()
{
  return MEMORY[0x270EDA9B0]();
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

void os_release(void *object)
{
}

void *__cdecl os_retain(void *object)
{
  return (void *)MEMORY[0x270EDAA50](object);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

BOOL os_unfair_lock_trylock(os_unfair_lock_t lock)
{
  return MEMORY[0x270EDAAD8](lock);
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

uint64_t os_unfair_recursive_lock_lock_with_options()
{
  return MEMORY[0x270EDAAF0]();
}

uint64_t os_unfair_recursive_lock_unlock()
{
  return MEMORY[0x270EDAB08]();
}

uint64_t os_workgroup_attr_set_flags()
{
  return MEMORY[0x270EDAB68]();
}

uint64_t os_workgroup_attr_set_interval_type()
{
  return MEMORY[0x270EDAB70]();
}

int os_workgroup_copy_port(os_workgroup_t wg, mach_port_t *mach_port_out)
{
  return MEMORY[0x270EDAB80](wg, mach_port_out);
}

uint64_t os_workgroup_create()
{
  return MEMORY[0x270EDAB88]();
}

os_workgroup_t os_workgroup_create_with_port(const char *name, mach_port_t mach_port)
{
  return (os_workgroup_t)MEMORY[0x270EDAB90](name, *(void *)&mach_port);
}

uint64_t os_workgroup_create_with_workload_id_and_port()
{
  return MEMORY[0x270EDAB98]();
}

uint64_t os_workgroup_interval_create()
{
  return MEMORY[0x270EDABA0]();
}

uint64_t os_workgroup_interval_create_with_workload_id()
{
  return MEMORY[0x270EDABA8]();
}

int os_workgroup_interval_finish(os_workgroup_interval_t wg, os_workgroup_interval_data_t data)
{
  return MEMORY[0x270EDABB0](wg, data);
}

int os_workgroup_interval_start(os_workgroup_interval_t wg, uint64_t start, uint64_t deadline, os_workgroup_interval_data_t data)
{
  return MEMORY[0x270EDABB8](wg, start, deadline, data);
}

int os_workgroup_interval_update(os_workgroup_interval_t wg, uint64_t deadline, os_workgroup_interval_data_t data)
{
  return MEMORY[0x270EDABC0](wg, deadline, data);
}

uint64_t os_workgroup_join_self()
{
  return MEMORY[0x270EDABD0]();
}

uint64_t os_workgroup_leave_self()
{
  return MEMORY[0x270EDABE0]();
}

void perror(const char *a1)
{
}

int proc_pidinfo(int pid, int flavor, uint64_t arg, void *buffer, int buffersize)
{
  return MEMORY[0x270EDAD78](*(void *)&pid, *(void *)&flavor, arg, buffer, *(void *)&buffersize);
}

int pthread_attr_destroy(pthread_attr_t *a1)
{
  return MEMORY[0x270EDADF8](a1);
}

int pthread_attr_getschedparam(const pthread_attr_t *a1, sched_param *a2)
{
  return MEMORY[0x270EDAE00](a1, a2);
}

int pthread_attr_init(pthread_attr_t *a1)
{
  return MEMORY[0x270EDAE10](a1);
}

int pthread_attr_set_qos_class_np(pthread_attr_t *__attr, qos_class_t __qos_class, int __relative_priority)
{
  return MEMORY[0x270EDAE18](__attr, *(void *)&__qos_class, *(void *)&__relative_priority);
}

int pthread_attr_setdetachstate(pthread_attr_t *a1, int a2)
{
  return MEMORY[0x270EDAE20](a1, *(void *)&a2);
}

int pthread_attr_setschedparam(pthread_attr_t *a1, const sched_param *a2)
{
  return MEMORY[0x270EDAE30](a1, a2);
}

int pthread_attr_setschedpolicy(pthread_attr_t *a1, int a2)
{
  return MEMORY[0x270EDAE38](a1, *(void *)&a2);
}

int pthread_create(pthread_t *a1, const pthread_attr_t *a2, void *(__cdecl *a3)(void *), void *a4)
{
  return MEMORY[0x270EDAEA0](a1, a2, a3, a4);
}

int pthread_detach(pthread_t a1)
{
  return MEMORY[0x270EDAEA8](a1);
}

int pthread_get_qos_class_np(pthread_t __pthread, qos_class_t *__qos_class, int *__relative_priority)
{
  return MEMORY[0x270EDAEC8](__pthread, __qos_class, __relative_priority);
}

int pthread_getname_np(pthread_t a1, char *a2, size_t a3)
{
  return MEMORY[0x270EDAEE0](a1, a2, a3);
}

int pthread_join(pthread_t a1, void **a2)
{
  return MEMORY[0x270EDAF10](a1, a2);
}

mach_port_t pthread_mach_thread_np(pthread_t a1)
{
  return MEMORY[0x270EDAF38](a1);
}

pthread_t pthread_self(void)
{
  return (pthread_t)MEMORY[0x270EDB010]();
}

int pthread_set_qos_class_self_np(qos_class_t __qos_class, int __relative_priority)
{
  return MEMORY[0x270EDB020](*(void *)&__qos_class, *(void *)&__relative_priority);
}

int pthread_setname_np(const char *a1)
{
  return MEMORY[0x270EDB038](a1);
}

int sched_yield(void)
{
  return MEMORY[0x270EDB320]();
}

kern_return_t semaphore_create(task_t task, semaphore_t *semaphore, int policy, int value)
{
  return MEMORY[0x270EDB370](*(void *)&task, semaphore, *(void *)&policy, *(void *)&value);
}

kern_return_t semaphore_destroy(task_t task, semaphore_t semaphore)
{
  return MEMORY[0x270EDB378](*(void *)&task, *(void *)&semaphore);
}

kern_return_t semaphore_signal(semaphore_t semaphore)
{
  return MEMORY[0x270EDB380](*(void *)&semaphore);
}

kern_return_t semaphore_signal_all(semaphore_t semaphore)
{
  return MEMORY[0x270EDB388](*(void *)&semaphore);
}

kern_return_t semaphore_timedwait(semaphore_t semaphore, mach_timespec_t wait_time)
{
  return ((uint64_t (*)(void, void))MEMORY[0x270EDB390])(*(void *)&semaphore, wait_time);
}

kern_return_t semaphore_timedwait_signal(semaphore_t wait_semaphore, semaphore_t signal_semaphore, mach_timespec_t wait_time)
{
  return ((uint64_t (*)(void, void, void))MEMORY[0x270EDB398])(*(void *)&wait_semaphore, *(void *)&signal_semaphore, wait_time);
}

kern_return_t semaphore_wait(semaphore_t semaphore)
{
  return MEMORY[0x270EDB3A0](*(void *)&semaphore);
}

kern_return_t semaphore_wait_signal(semaphore_t wait_semaphore, semaphore_t signal_semaphore)
{
  return MEMORY[0x270EDB3A8](*(void *)&wait_semaphore, *(void *)&signal_semaphore);
}

char *__cdecl strchr(char *__s, int __c)
{
  return (char *)MEMORY[0x270EDB5A8](__s, *(void *)&__c);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x270EDB5B0](__s1, __s2);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x270EDB610](__s);
}

int sysctl(int *a1, u_int a2, void *a3, size_t *a4, void *a5, size_t a6)
{
  return MEMORY[0x270EDB7D0](a1, *(void *)&a2, a3, a4, a5, a6);
}

int sysctlbyname(const char *a1, void *a2, size_t *a3, void *a4, size_t a5)
{
  return MEMORY[0x270EDB7D8](a1, a2, a3, a4, a5);
}

kern_return_t thread_info(thread_inspect_t target_act, thread_flavor_t flavor, thread_info_t thread_info_out, mach_msg_type_number_t *thread_info_outCnt)
{
  return MEMORY[0x270EDB8F8](*(void *)&target_act, *(void *)&flavor, thread_info_out, thread_info_outCnt);
}

kern_return_t thread_policy_set(thread_act_t thread, thread_policy_flavor_t flavor, thread_policy_t policy_info, mach_msg_type_number_t policy_infoCnt)
{
  return MEMORY[0x270EDB908](*(void *)&thread, *(void *)&flavor, policy_info, *(void *)&policy_infoCnt);
}

kern_return_t vm_region_64(vm_map_read_t target_task, vm_address_t *address, vm_size_t *size, vm_region_flavor_t flavor, vm_region_info_t info, mach_msg_type_number_t *infoCnt, mach_port_t *object_name)
{
  return MEMORY[0x270EDBAC0](*(void *)&target_task, address, size, *(void *)&flavor, info, infoCnt, object_name);
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return (xpc_object_t)MEMORY[0x270EDC008](keys, values, count);
}

xpc_object_t xpc_dictionary_get_value(xpc_object_t xdict, const char *key)
{
  return (xpc_object_t)MEMORY[0x270EDC0C0](xdict, key);
}

void xpc_dictionary_set_value(xpc_object_t xdict, const char *key, xpc_object_t value)
{
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return (xpc_type_t)MEMORY[0x270EDC200](object);
}

uint64_t xpc_mach_send_copy_right()
{
  return MEMORY[0x270EDC260]();
}

uint64_t xpc_mach_send_create()
{
  return MEMORY[0x270EDC268]();
}

xpc_object_t xpc_shmem_create(void *region, size_t length)
{
  return (xpc_object_t)MEMORY[0x270EDC3B0](region, length);
}

size_t xpc_shmem_map(xpc_object_t xshmem, void **region)
{
  return MEMORY[0x270EDC3C0](xshmem, region);
}