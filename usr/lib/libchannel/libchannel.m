double CASPage::allocate(CASPage *this)
{
  kern_return_t v1;
  mach_error_t v2;
  double result;
  _OWORD *v4;
  mach_vm_address_t address;

  address = 0;
  v1 = mach_vm_allocate(*MEMORY[0x263EF8960], &address, *MEMORY[0x263EF8AF8], 1);
  if (v1)
  {
    v2 = v1;
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      CASPage::allocate(v2);
    }
  }
  else
  {
    v4 = (_OWORD *)address;
    result = 0.0;
    *(_OWORD *)address = 0u;
    v4[1] = 0u;
    v4[2] = 0u;
    v4[3] = 0u;
    v4[4] = 0u;
    v4[5] = 0u;
    v4[6] = 0u;
    v4[7] = 0u;
    v4[8] = 0u;
    v4[9] = 0u;
    v4[10] = 0u;
    v4[11] = 0u;
    v4[12] = 0u;
    v4[13] = 0u;
    v4[14] = 0u;
    v4[15] = 0u;
  }
  return result;
}

uint64_t CASPage::free(mach_vm_address_t address)
{
  return mach_vm_deallocate(*MEMORY[0x263EF8960], address, *MEMORY[0x263EF8AF8]);
}

unint64_t AbsTime::nano_time(AbsTime *this)
{
  mach_timebase_info(&info);
  return *(void *)this * (unint64_t)info.numer / info.denom;
}

unint64_t AbsTime::nano_time(AbsTime *this, mach_timebase_info a2)
{
  return *(void *)this * (unint64_t)a2.numer / a2.denom;
}

void *channel_retain(void *object)
{
  if (object) {
    return os_retain(object);
  }
  return object;
}

void channel_release(void *object)
{
  if (object) {
    os_release(object);
  }
}

void AssertableValue::AssertableValue(AssertableValue *this)
{
  *(void *)this = 0;
}

void AssertableValue::AssertableValue(AssertableValue *this, uint64_t a2)
{
  *(void *)this = a2;
}

uint64_t AssertableValue::is_wait_asserted(AssertableValue *this)
{
  return *(_DWORD *)this & 1;
}

unint64_t AssertableValue::value(AssertableValue *this)
{
  return *(void *)this & 0xFFFFFFFFFFFFFFFELL;
}

uint64_t AssertableValue::assert_wait(AssertableValue *this)
{
  return *(void *)this | 1;
}

BOOL assert_wait(atomic_ullong *a1, unint64_t *a2)
{
  unint64_t v2 = *a2;
  unint64_t v3 = *a2 | 1;
  unint64_t v4 = *a2;
  atomic_compare_exchange_strong(a1, &v4, v3);
  BOOL result = v4 == v2;
  if (v4 == v2) {
    unint64_t v6 = v3;
  }
  else {
    unint64_t v6 = v4;
  }
  *a2 = v6;
  return result;
}

BOOL release_wait(atomic_ullong *a1, unint64_t *a2)
{
  unint64_t v2 = *a2;
  unint64_t v3 = *a2 & 0xFFFFFFFFFFFFFFFELL;
  unint64_t v4 = *a2;
  atomic_compare_exchange_strong(a1, &v4, v3);
  BOOL result = v4 == v2;
  if (v4 == v2) {
    unint64_t v6 = v3;
  }
  else {
    unint64_t v6 = v4;
  }
  *a2 = v6;
  return result;
}

uint64_t channel_endpoint_obj_alloc(uint64_t a1)
{
  uint64_t v2 = objc_opt_class();

  return MEMORY[0x270ED80E0](v2, a1);
}

uint64_t channel_endpoint_class()
{
  return objc_opt_class();
}

uint64_t channel_obj_alloc(uint64_t a1)
{
  uint64_t v2 = objc_opt_class();

  return MEMORY[0x270ED80E0](v2, a1);
}

uint64_t channel_class()
{
  return objc_opt_class();
}

uint64_t channel_dispatch_obj_alloc(uint64_t a1)
{
  uint64_t v2 = objc_opt_class();

  return MEMORY[0x270ED80E0](v2, a1);
}

uint64_t channel_dispatch_class()
{
  return objc_opt_class();
}

uint64_t channel_rt_obj_alloc(uint64_t a1)
{
  uint64_t v2 = objc_opt_class();

  return MEMORY[0x270ED80E0](v2, a1);
}

uint64_t channel_rt_class()
{
  return objc_opt_class();
}

uint64_t DispatchChannel::DispatchChannel(uint64_t a1, int a2, uint64_t a3, long long *a4, uint64_t a5, int a6, int a7, int a8, int a9, void *a10, uint64_t a11)
{
  id v19 = a10;
  long long v34 = *(_OWORD *)a3;
  uint64_t v35 = *(void *)(a3 + 16);
  long long v32 = *a4;
  uint64_t v33 = *((void *)a4 + 2);
  Channel::Channel(a1, a2, &v34, (uint64_t)&v32, a5, a6, a7, a8, a9);
  v20 = v19;
  *(void *)(a1 + 88) = v20;
  *(void *)(a1 + 96) = 0;
  *(void *)(a1 + 104) = 0;
  *(void *)(a1 + 112) = a11;
  *(_WORD *)(a1 + 120) = 0;
  uintptr_t v21 = atomic_load((unsigned int *)(a1 + 72));
  v22 = (const dispatch_source_type_s *)MEMORY[0x263EF83C8];
  dispatch_source_t v23 = dispatch_source_create(MEMORY[0x263EF83C8], v21, 0, v20);
  v24 = *(void **)(a1 + 96);
  *(void *)(a1 + 96) = v23;

  dispatch_source_t v25 = dispatch_source_create(v22, *(unsigned int *)(a1 + 84), 0, *(dispatch_queue_t *)(a1 + 88));
  v26 = *(void **)(a1 + 104);
  *(void *)(a1 + 104) = v25;

  object_retain_internal();
  handler[5] = MEMORY[0x263EF8330];
  handler[6] = 3321888768;
  handler[7] = ___ZN15DispatchChannelC2Eb17MessageRingBufferS0_P7CASPagejjjjPU28objcproto17OS_dispatch_queue8NSObjectPv_block_invoke;
  handler[8] = &__block_descriptor_48_ea8_32c111_ZTSKZN15DispatchChannelC1Eb17MessageRingBufferS0_P7CASPagejjjjPU28objcproto17OS_dispatch_queue8NSObjectPvE3__0_e5_v8__0l;
  handler[9] = a1;
  int v31 = a7;
  dispatch_source_set_mandatory_cancel_handler();
  v27 = *(NSObject **)(a1 + 96);
  handler[0] = MEMORY[0x263EF8330];
  handler[1] = 3321888768;
  handler[2] = ___ZN15DispatchChannelC2Eb17MessageRingBufferS0_P7CASPagejjjjPU28objcproto17OS_dispatch_queue8NSObjectPv_block_invoke_1;
  handler[3] = &__block_descriptor_40_ea8_32c111_ZTSKZN15DispatchChannelC1Eb17MessageRingBufferS0_P7CASPagejjjjPU28objcproto17OS_dispatch_queue8NSObjectPvE3__1_e5_v8__0l;
  handler[4] = a1;
  dispatch_source_set_event_handler(v27, handler);
  object_retain_internal();
  DispatchChannel::set_msg_source_mandatory_cancel_handler(a1, 0);
  AssertableValue::AssertableValue((AssertableValue *)&explicit);
  do
    unint64_t explicit = atomic_load_explicit(*(atomic_ullong *volatile *)(a1 + 64), memory_order_acquire);
  while (!assert_wait(*(atomic_ullong **)(a1 + 64), &explicit));

  return a1;
}

{
  return DispatchChannel::DispatchChannel(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11);
}

void __clang_call_terminate(void *a1)
{
}

uint64_t ___ZN15DispatchChannelC2Eb17MessageRingBufferS0_P7CASPagejjjjPU28objcproto17OS_dispatch_queue8NSObjectPv_block_invoke(uint64_t a1)
{
  mach_port_mod_refs(*MEMORY[0x263EF8960], *(_DWORD *)(a1 + 40), 1u, -1);

  return object_release_internal();
}

uint64_t __copy_helper_block_ea8_32c111_ZTSKZN15DispatchChannelC1Eb17MessageRingBufferS0_P7CASPagejjjjPU28objcproto17OS_dispatch_queue8NSObjectPvE3__0(uint64_t result, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 32);
  *(_DWORD *)(result + 40) = *(_DWORD *)(a2 + 40);
  *(void *)(result + 32) = v2;
  return result;
}

void ___ZN15DispatchChannelC2Eb17MessageRingBufferS0_P7CASPagejjjjPU28objcproto17OS_dispatch_queue8NSObjectPv_block_invoke_1(uint64_t a1)
{
  v1 = *(DispatchChannel **)(a1 + 32);
  if (Channel::poll_dead_name_notification(v1))
  {
    DispatchChannel::cancel(v1);
  }
}

uint64_t __copy_helper_block_ea8_32c111_ZTSKZN15DispatchChannelC1Eb17MessageRingBufferS0_P7CASPagejjjjPU28objcproto17OS_dispatch_queue8NSObjectPvE3__1(uint64_t result, uint64_t a2)
{
  *(void *)(result + 32) = *(void *)(a2 + 32);
  return result;
}

void DispatchChannel::set_msg_source_mandatory_cancel_handler(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = (void *)MEMORY[0x263E6DA00](a2);
  unint64_t v3 = (void *)MEMORY[0x263E6DA00]();
  dispatch_source_set_mandatory_cancel_handler();
}

uint64_t ___ZN15DispatchChannel39set_msg_source_mandatory_cancel_handlerEU13block_pointerFvvE_block_invoke(uint64_t a1)
{
  mach_port_mod_refs(*MEMORY[0x263EF8960], *(_DWORD *)(*(void *)(a1 + 32) + 84), 1u, -1);
  object_release_internal();
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    unint64_t v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

uint64_t __copy_helper_block_ea8_32c91_ZTSKZN15DispatchChannel39set_msg_source_mandatory_cancel_handlerEU13block_pointerFvvEE3__0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  uint64_t result = MEMORY[0x263E6DA00](v3);
  *(void *)(a1 + 40) = result;
  return result;
}

void __destroy_helper_block_ea8_32c91_ZTSKZN15DispatchChannel39set_msg_source_mandatory_cancel_handlerEU13block_pointerFvvEE3__0(uint64_t a1)
{
}

void DispatchChannel::cancel(DispatchChannel *this)
{
  atomic_exchange((atomic_uint *volatile)this + 18, 0);
  dispatch_source_cancel(*((dispatch_source_t *)this + 12));
  dispatch_source_cancel(*((dispatch_source_t *)this + 13));
  dispatch_activate(*((dispatch_object_t *)this + 12));
  uint64_t v2 = *((void *)this + 13);

  dispatch_activate(v2);
}

void DispatchChannel::activate_no_check(dispatch_object_t *this)
{
  dispatch_activate(this[12]);
  uint64_t v2 = this[13];

  dispatch_activate(v2);
}

void DispatchChannel::try_activate(dispatch_object_t *this)
{
  if (*((unsigned char *)this + 120) && *((unsigned char *)this + 121))
  {
    dispatch_activate(this[12]);
    uint64_t v2 = this[13];
    dispatch_activate(v2);
  }
}

uint64_t DispatchChannel::set_message_handler(uint64_t a1, uint64_t a2)
{
  if (a2) {
    BOOL v2 = *(unsigned char *)(a1 + 120) == 0;
  }
  else {
    BOOL v2 = 0;
  }
  uint64_t v3 = v2;
  if (v2)
  {
    *(unsigned char *)(a1 + 120) = 1;
    v5 = *(NSObject **)(a1 + 104);
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3321888768;
    v8[2] = ___ZN15DispatchChannel19set_message_handlerEU13block_pointerFvPvmjE_block_invoke;
    v8[3] = &__block_descriptor_48_ea8_32c74_ZTSKZN15DispatchChannel19set_message_handlerEU13block_pointerFvPvmjEE3__0_e5_v8__0l;
    unint64_t v6 = (void *)MEMORY[0x263E6DA00](a2);
    v8[4] = a1;
    id v9 = (id)MEMORY[0x263E6DA00]();
    dispatch_source_set_event_handler(v5, v8);
  }
  return v3;
}

void ___ZN15DispatchChannel19set_message_handlerEU13block_pointerFvPvmjE_block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  int v3 = Channel::msg_wait((Channel *)v2, 0);
  if (v3 != 14 && v3 != 37)
  {
    AssertableValue::AssertableValue((AssertableValue *)&v7);
    while (1)
    {
      BOOL v6 = 0;
      while (1)
      {
        Channel::receive_message((Channel *)v2, (AssertableValue *)&v7, &v6, (uint64_t)&v4);
        if (!v5) {
          break;
        }
        (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
        if (!atomic_load_explicit((atomic_uint *volatile)(v2 + 72), memory_order_acquire)) {
          return;
        }
      }
      if (v6) {
        break;
      }
      if (assert_wait(*(atomic_ullong **)(v2 + 64), &v7)) {
        return;
      }
    }
    DispatchChannel::cancel((DispatchChannel *)v2);
  }
}

uint64_t __copy_helper_block_ea8_32c74_ZTSKZN15DispatchChannel19set_message_handlerEU13block_pointerFvPvmjEE3__0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  uint64_t result = MEMORY[0x263E6DA00](v3);
  *(void *)(a1 + 40) = result;
  return result;
}

void __destroy_helper_block_ea8_32c74_ZTSKZN15DispatchChannel19set_message_handlerEU13block_pointerFvPvmjEE3__0(uint64_t a1)
{
}

uint64_t DispatchChannel::set_close_handler(uint64_t a1, uint64_t a2)
{
  if (a2) {
    BOOL v2 = *(unsigned char *)(a1 + 121) == 0;
  }
  else {
    BOOL v2 = 0;
  }
  uint64_t v3 = v2;
  if (v2)
  {
    *(unsigned char *)(a1 + 121) = 1;
    DispatchChannel::set_msg_source_mandatory_cancel_handler(a1, a2);
  }
  return v3;
}

BOOL channel_seqlock_read_try_start(atomic_ullong *a1, unint64_t *a2)
{
  unint64_t explicit = atomic_load_explicit(a1, memory_order_acquire);
  if ((explicit & 1) == 0) {
    *a2 = explicit;
  }
  return (explicit & 1) == 0;
}

BOOL channel_seqlock_read_try_end(atomic_ullong *a1, uint64_t a2)
{
  return atomic_load_explicit(a1, memory_order_acquire) == a2;
}

unint64_t channel_seqlock_write_start(atomic_ullong *a1)
{
  return atomic_fetch_add(a1, 1uLL);
}

atomic_ullong *channel_seqlock_write_end(atomic_ullong *result)
{
  return result;
}

void RTChannel::~RTChannel(RTChannel *this)
{
  RTChannel::close((uint64_t)this);

  Channel::~Channel(this);
}

uint64_t RTChannel::close(uint64_t this)
{
  mach_port_name_t v1 = atomic_exchange((atomic_uint *volatile)(this + 72), 0);
  if (v1)
  {
    uint64_t v2 = this;
    realtime_runtime_check_push_authorization();
    ipc_space_t v3 = *MEMORY[0x263EF8960];
    mach_port_mod_refs(*MEMORY[0x263EF8960], v1, 1u, -1);
    mach_port_mod_refs(v3, *(_DWORD *)(v2 + 84), 1u, -1);
    return realtime_runtime_check_pop_authorization();
  }
  return this;
}

void sub_2638CCC3C(_Unwind_Exception *a1)
{
}

uint64_t RTChannel::pop_message@<X0>(RTChannel *this@<X0>, unsigned char *a2@<X8>)
{
  AssertableValue::AssertableValue((AssertableValue *)v6);
  BOOL v5 = 0;
  uint64_t result = Channel::receive_message(this, (AssertableValue *)v6, &v5, (uint64_t)a2);
  if (!a2[24])
  {
    if (v5) {
      uint64_t result = RTChannel::close((uint64_t)this);
    }
    *a2 = 0;
    a2[24] = 0;
  }
  return result;
}

unint64_t RTChannel::receive_message@<X0>(atomic_ullong **this@<X0>, int a2@<W1>, unsigned char *a3@<X8>)
{
  LODWORD(v3) = a2;
  AssertableValue::AssertableValue((AssertableValue *)&v12);
  BOOL v11 = 0;
  unint64_t result = Channel::receive_message((Channel *)this, (AssertableValue *)&v12, &v11, (uint64_t)a3);
  if (!a3[24])
  {
    if (v11)
    {
LABEL_3:
      unint64_t result = RTChannel::close((uint64_t)this);
    }
    else if (v3)
    {
      uint64_t v7 = AbsTime::now();
      uint64_t v10 = 1000000 * v3;
      unint64_t result = NanoTime::abs_time((NanoTime *)&v10);
      unint64_t v8 = result + v7;
      if (v7 < result + v7)
      {
        do
        {
          if (assert_wait(this[8], &v12))
          {
            if (Channel::msg_wait((Channel *)this, v3) == 14) {
              RTChannel::close((uint64_t)this);
            }
            unint64_t result = release_wait(this[8], &v12);
            if (result) {
              break;
            }
          }
          unint64_t result = Channel::receive_message((Channel *)this, (AssertableValue *)&v12, &v11, (uint64_t)a3);
          if (a3[24]) {
            return result;
          }
          if (v11) {
            goto LABEL_3;
          }
          uint64_t v9 = AbsTime::now();
          uint64_t v10 = v8 - v9;
          unint64_t result = AbsTime::nano_time((AbsTime *)&v10);
          unint64_t v3 = result / 0xF4240;
        }
        while (v8 > v9);
      }
    }
    *a3 = 0;
    a3[24] = 0;
  }
  return result;
}

BOOL RTChannel::probe_message(atomic_ullong *volatile *this)
{
  Channel::assert_recv_sane((Channel *)this);
  unint64_t v2 = *(void *)(*((void *)this + 2) + 256);
  unint64_t explicit = atomic_load_explicit(this[8], memory_order_acquire);
  return v2 < AssertableValue::value((AssertableValue *)&explicit);
}

uint64_t RTChannel::wait_message(RTChannel *this, int a2)
{
  LODWORD(v2) = a2;
  Channel::assert_recv_sane(this);
  unint64_t v4 = *(void *)(*((void *)this + 2) + 256);
  unint64_t explicit = atomic_load_explicit(*((atomic_ullong *volatile *)this + 8), memory_order_acquire);
  if (v4 < AssertableValue::value((AssertableValue *)&explicit)) {
    return 1;
  }
  if (v2)
  {
    uint64_t v6 = AbsTime::now();
    uint64_t v12 = 1000000 * v2;
    unint64_t v7 = NanoTime::abs_time((NanoTime *)&v12);
    unint64_t v8 = v7 + v6;
    if (v6 < v7 + v6)
    {
      while (atomic_load_explicit((atomic_uint *volatile)this + 18, memory_order_acquire))
      {
        if (assert_wait(*((atomic_ullong **)this + 8), &explicit))
        {
          int v9 = Channel::msg_wait(this, v2);
          if (v9 == 14) {
            RTChannel::close((uint64_t)this);
          }
          if (release_wait(*((atomic_ullong **)this + 8), &explicit)) {
            return 0;
          }
        }
        else
        {
          int v9 = 0;
        }
        unint64_t explicit = atomic_load_explicit(*((atomic_ullong *volatile *)this + 8), memory_order_acquire);
        if (v4 < AssertableValue::value((AssertableValue *)&explicit)) {
          return 1;
        }
        uint64_t result = 0;
        if (v9 != 14 && v9 != 37)
        {
          uint64_t v10 = AbsTime::now();
          uint64_t v12 = v8 - v10;
          unint64_t v11 = AbsTime::nano_time((AbsTime *)&v12);
          uint64_t result = 0;
          unint64_t v2 = v11 / 0xF4240;
          if (v8 > v10) {
            continue;
          }
        }
        return result;
      }
    }
  }
  return 0;
}

BOOL RTChannel::poll_closed(atomic_uint *this)
{
  mach_port_name_t v1 = this + 18;
  if (atomic_load_explicit(this + 18, memory_order_acquire)
    && Channel::poll_dead_name_notification((Channel *)this))
  {
    RTChannel::close((uint64_t)this);
  }
  return atomic_load_explicit(v1, memory_order_acquire) == 0;
}

BOOL RTChannel::wire(const void **this)
{
  BOOL result = MessageRingBuffer::wire(this);
  if (result)
  {
    if (MessageRingBuffer::wire(this + 3))
    {
      return 1;
    }
    else
    {
      MessageRingBuffer::unwire(this);
      return 0;
    }
  }
  return result;
}

uint64_t RTChannel::unwire(const void **this)
{
  BOOL v2 = MessageRingBuffer::unwire(this);
  return v2 & MessageRingBuffer::unwire(this + 3);
}

unint64_t NanoTime::abs_time(NanoTime *this)
{
  mach_timebase_info(&info);
  return *(void *)this * (unint64_t)info.denom / info.numer;
}

void *MessageRingBuffer::allocate(MessageRingBuffer *this)
{
  BOOL result = MessageRingBufferSharedMemory::allocate(this);
  if (result) {
    operator new();
  }
  return result;
}

void *MessageRingBufferSharedMemory::allocate(MessageRingBufferSharedMemory *this)
{
  kern_return_t v8;
  mach_error_t v9;
  void *result;
  mach_vm_address_t v11;
  kern_return_t v12;
  mach_error_t v13;
  vm_prot_t cur_protection[2];
  mach_vm_address_t target_address;
  mach_vm_address_t address;

  int v1 = (int)this;
  BOOL v2 = (void *)MEMORY[0x263EF8AF8];
  uint64_t v3 = *MEMORY[0x263EF8AF8];
  if (!is_mul_ok(this, *MEMORY[0x263EF8AF8]))
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      MessageRingBufferSharedMemory::allocate(v1);
    }
    return 0;
  }
  mach_vm_size_t v4 = this * v3;
  mach_vm_size_t v5 = v3 + 2 * v4;
  BOOL v6 = __CFADD__(v3, 2 * v4);
  if ((v4 & 0x8000000000000000) != 0 || v6)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      MessageRingBufferSharedMemory::allocate(v1);
    }
    return 0;
  }
  address = 0;
  unint64_t v7 = (vm_map_t *)MEMORY[0x263EF8960];
  unint64_t v8 = mach_vm_allocate(*MEMORY[0x263EF8960], &address, v5, 1);
  if (v8)
  {
    int v9 = v8;
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      MessageRingBufferSharedMemory::allocate(v9, v5);
    }
    return 0;
  }
  unint64_t v11 = *v2 + address;
  *(void *)cur_protection = 0;
  target_address = v11 + v4;
  uint64_t v12 = mach_vm_remap(*v7, &target_address, v4, 0, 0x4000, *v7, v11, 0, &cur_protection[1], cur_protection, 2u);
  if (v12)
  {
    v13 = v12;
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      MessageRingBufferSharedMemory::allocate(v13);
    }
    mach_vm_deallocate(*v7, address, v5);
    return 0;
  }
  BOOL result = (void *)address;
  *(void *)address = 0xFEAB12399321BEAFLL;
  result[16] = 0;
  result[32] = 0;
  result[48] = 0;
  return result;
}

uint64_t MessageRingBuffer::from_xpc(void *a1)
{
  id v1 = a1;
  BOOL v2 = v1;
  if (!v1) {
    goto LABEL_6;
  }
  region = 0;
  uint64_t v3 = (char *)xpc_shmem_map(v1, &region);
  uint64_t v4 = 0;
  if (v3)
  {
    if (region)
    {
      uint64_t v4 = MessageRingBuffer::from_shared_region((MessageRingBuffer *)region, v3);
      if (!v4)
      {
        mach_vm_deallocate(*MEMORY[0x263EF8960], (mach_vm_address_t)region, (mach_vm_size_t)v3);
LABEL_6:
        uint64_t v4 = 0;
      }
    }
  }

  return v4;
}

void sub_2638CD34C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t MessageRingBuffer::from_shared_region(MessageRingBuffer *this, char *a2)
{
  uint64_t result = 0;
  unint64_t v4 = *MEMORY[0x263EF8AF8];
  unint64_t v5 = (unint64_t)&a2[-*MEMORY[0x263EF8AF8]];
  if ((unint64_t)a2 >= *MEMORY[0x263EF8AF8] && (unint64_t)a2 >= 0x280 && v4 >= 0x280)
  {
    if ((v5 & 1) == 0
      && !(v5 % v4)
      && ((v4 - 1) & (unint64_t)this) == 0
      && *(void *)this == 0xFEAB12399321BEAFLL)
    {
      unint64_t v6 = atomic_load((unint64_t *)this + 16);
      unint64_t v7 = atomic_load((unint64_t *)this + 32);
      if (v6 <= v7)
      {
        unint64_t v8 = atomic_load((unint64_t *)this + 32);
        unint64_t v9 = atomic_load((unint64_t *)this + 48);
        if (v8 <= v9) {
          operator new();
        }
      }
    }
    return 0;
  }
  return result;
}

BOOL MessageRingBufferSharedMemory::is_valid(MessageRingBufferSharedMemory *this)
{
  if (((*MEMORY[0x263EF8AF8] - 1) & (unint64_t)this) != 0) {
    return 0;
  }
  if (*(void *)this != 0xFEAB12399321BEAFLL) {
    return 0;
  }
  unint64_t v1 = atomic_load((unint64_t *)this + 16);
  unint64_t v2 = atomic_load((unint64_t *)this + 32);
  if (v1 > v2) {
    return 0;
  }
  unint64_t v4 = atomic_load((unint64_t *)this + 32);
  unint64_t v5 = atomic_load((unint64_t *)this + 48);
  return v4 <= v5;
}

void MessageRingBuffer::free(mach_vm_size_t *a1)
{
  mach_vm_deallocate(*MEMORY[0x263EF8960], a1[2], *a1);
  a1[2] = 0;

  JUMPOUT(0x263E6D780);
}

uint64_t MessageRingBuffer::free_shared_memory(MessageRingBuffer *this)
{
  uint64_t result = mach_vm_deallocate(*MEMORY[0x263EF8960], *((void *)this + 2), *(void *)this);
  *((void *)this + 2) = 0;
  return result;
}

BOOL MessageRingBuffer::wire(const void **this)
{
  return mlock(this[2], (size_t)*this) == 0;
}

BOOL MessageRingBuffer::unwire(const void **this)
{
  return munlock(this[2], (size_t)*this) == 0;
}

void MessageRingBufferSharedMemory::MessageRingBufferSharedMemory(MessageRingBufferSharedMemory *this)
{
  *(void *)this = 0xFEAB12399321BEAFLL;
  *((void *)this + 16) = 0;
  *((void *)this + 32) = 0;
  *((void *)this + 48) = 0;
}

uint64_t Channel::Channel(uint64_t result, int a2, long long *a3, uint64_t a4, uint64_t a5, int a6, int a7, int a8, int a9)
{
  long long v9 = *a3;
  *(void *)(result + 16) = *((void *)a3 + 2);
  *(_OWORD *)uint64_t result = v9;
  uint64_t v10 = *(void *)(a4 + 16);
  *(_OWORD *)(result + 24) = *(_OWORD *)a4;
  *(void *)(result + 40) = v10;
  *(void *)(result + 48) = a5;
  *(_DWORD *)(result + 72) = a7;
  *(_DWORD *)(result + 76) = a6;
  *(_DWORD *)(result + 80) = a8;
  *(_DWORD *)(result + 84) = a9;
  uint64_t v11 = a5 + 128;
  if (a2) {
    uint64_t v12 = a5;
  }
  else {
    uint64_t v12 = a5 + 128;
  }
  if (!a2) {
    uint64_t v11 = a5;
  }
  *(void *)(result + 56) = v12;
  *(void *)(result + 64) = v11;
  return result;
}

void Channel::~Channel(Channel *this)
{
  MessageRingBuffer::free_shared_memory(this);
  MessageRingBuffer::free_shared_memory((Channel *)((char *)this + 24));
  CASPage::free(*((void *)this + 6));
  disarm_deadname_notification(*((_DWORD *)this + 19));
  disarm_deadname_notification(*((_DWORD *)this + 20));
  unint64_t v2 = (ipc_space_t *)MEMORY[0x263EF8960];
  mach_port_deallocate(*MEMORY[0x263EF8960], *((_DWORD *)this + 19));
  mach_port_deallocate(*v2, *((_DWORD *)this + 20));
}

uint64_t disarm_deadname_notification(mach_port_name_t name)
{
  mach_port_t previous = 0;
  unint64_t v2 = (ipc_space_t *)MEMORY[0x263EF8960];
  mach_port_request_notification(*MEMORY[0x263EF8960], name, 72, 0, 0, 0x15u, &previous);
  if (previous) {
    mach_port_name_t v3 = previous;
  }
  else {
    mach_port_name_t v3 = name;
  }
  return mach_port_deallocate(*v2, v3);
}

unint64_t Channel::receive_message@<X0>(Channel *this@<X0>, AssertableValue *a2@<X1>, BOOL *a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v7 = *MEMORY[0x263EF8AF8];
  unint64_t v8 = *((void *)this + 4);
  uint64_t v9 = *((void *)this + 5);
  uint64_t v10 = *((void *)this + 2);
  unint64_t v11 = *(void *)(v10 + 128);
  unint64_t v12 = *(void *)(v10 + 256);
  *(void *)a2 = atomic_load_explicit(*((atomic_ullong *volatile *)this + 8), memory_order_acquire);
  unint64_t result = AssertableValue::value(a2);
  if (v11 <= v12) {
    unint64_t v17 = v12;
  }
  else {
    unint64_t v17 = v11;
  }
  if (v12 >= result)
  {
    char v24 = 0;
    LOBYTE(v18) = 0;
    int v23 = 0;
LABEL_20:
    *(void *)(*((void *)this + 2) + 256) = v12;
    atomic_store(v17, (unint64_t *)(*((void *)this + 2) + 128));
    *a3 = 0;
    *(_DWORD *)a4 = v23 | v18;
    *(_DWORD *)(a4 + 4) = v15;
    *(unsigned char *)(a4 + 8) = v16;
    *(_DWORD *)(a4 + 9) = *(_DWORD *)v26;
    *(_DWORD *)(a4 + 12) = *(_DWORD *)&v26[3];
    *(void *)(a4 + 16) = v14;
    *(unsigned char *)(a4 + 24) = v24;
    *(_DWORD *)(a4 + 25) = *(_DWORD *)v25;
    *(_DWORD *)(a4 + 28) = *(_DWORD *)&v25[3];
  }
  else
  {
    while (1)
    {
      v14 = (unsigned int *)(v7 + v9 + v12 % v8);
      unint64_t v18 = *v14;
      BOOL v19 = v18 >= 8 && v8 >= v18;
      v12 += v18;
      if (!v19 || v12 > result) {
        break;
      }
      unsigned int v21 = v14[1];
      int v15 = v21 & 0x3FFFFFFF;
      unsigned int v16 = v21 >> 30;
      if (v16 != 3 && v15 != 0)
      {
        int v23 = v18 & 0xFFFFFF00;
        char v24 = 1;
        goto LABEL_20;
      }
      v17 += v18;
      if (v12 >= result)
      {
        char v24 = 0;
        int v23 = v18 & 0xFFFFFF00;
        goto LABEL_20;
      }
    }
    *a3 = 1;
    *(unsigned char *)a4 = 0;
    *(unsigned char *)(a4 + 24) = 0;
  }
  return result;
}

_DWORD *Channel::reserve_message(atomic_uint *this, int a2, uint64_t a3, uint64_t a4)
{
  if (!atomic_load_explicit(this + 18, memory_order_acquire)) {
    return 0;
  }
  unint64_t result = 0;
  unint64_t v6 = *(void *)(*((void *)this + 2) + 384);
  unint64_t explicit = atomic_load_explicit((atomic_ullong *volatile)(*((void *)this + 5) + 128), memory_order_acquire);
  uint64_t v10 = (char *)(this + 2);
  unint64_t v8 = *((void *)this + 1);
  uint64_t v9 = *((void *)v10 + 1);
  uint64_t v11 = *MEMORY[0x263EF8AF8] + v9;
  unint64_t v12 = (_DWORD *)(v6 % v8 + v11);
  uint64_t v13 = ((unint64_t)v12 + a4 + 7) & -a4;
  unint64_t v14 = (a3 + v13 + 7) & 0xFFFFFFFFFFFFFFF8;
  if (v14 - (unint64_t)v12 <= explicit - v6 + v8)
  {
    int v15 = (_DWORD *)(v13 - 8);
    if (v15 != v12)
    {
      *unint64_t v12 = v15 - v12;
      v12[1] = 0x40000000;
    }
    *int v15 = v14 - v15;
    v15[1] = a2 & 0x3FFFFFFF;
    unint64_t v16 = v11 + v8;
    uint64_t v17 = (uint64_t)v15 - v8;
    if ((unint64_t)v15 <= v16) {
      unint64_t result = v15;
    }
    else {
      unint64_t result = (_DWORD *)v17;
    }
    *(void *)(v9 + 384) = v14 - (void)v12 + v6;
  }
  return result;
}

unint64_t Channel::advance_commit_assert_head(Channel *this)
{
  uint64_t v2 = *MEMORY[0x263EF8AF8];
  unint64_t v3 = *((void *)this + 1);
  uint64_t v4 = *((void *)this + 2);
  unint64_t explicit = atomic_load_explicit(*((atomic_ullong *volatile *)this + 7), memory_order_acquire);
  unint64_t v5 = AssertableValue::value((AssertableValue *)&explicit);
  unint64_t v6 = *(void *)(*((void *)this + 2) + 384);
  while (v5 < v6)
  {
    uint64_t v7 = (unsigned int *)(v2 + v4 + v5 % v3);
    unsigned int v8 = v7[1] >> 30;
    BOOL v9 = v8 == 1 || v8 == 3;
    if (v9)
    {
      v5 += *v7;
    }
    else if (!v8)
    {
      break;
    }
  }
  unint64_t result = AssertableValue::value((AssertableValue *)&explicit);
  if (v5 > result)
  {
    unint64_t v11 = AssertableValue::value((AssertableValue *)&explicit);
    AssertableValue::AssertableValue((AssertableValue *)&v16, v11);
    AssertableValue::AssertableValue((AssertableValue *)&v15, v5);
    uint64_t v12 = v16;
    uint64_t v13 = v16;
    atomic_compare_exchange_strong(*((atomic_ullong *volatile *)this + 7), (unint64_t *)&v13, v15);
    if (v13 != v12)
    {
      uint64_t v14 = v13;
      do
      {
        uint64_t v16 = v13;
        atomic_compare_exchange_strong(*((atomic_ullong *volatile *)this + 7), (unint64_t *)&v14, v15);
        BOOL v9 = v14 == v13;
        uint64_t v13 = v14;
      }
      while (!v9);
    }
    unint64_t result = AssertableValue::is_wait_asserted((AssertableValue *)&v16);
    if (result) {
      return Channel::msg_notify(this);
    }
  }
  return result;
}

uint64_t Channel::msg_notify(Channel *this)
{
  *(void *)&msg.msgh_bits = 0x1800000013;
  msg.msgh_remote_port = *((_DWORD *)this + 20);
  msg.msgh_local_port = 0;
  *(void *)&msg.msgh_voucher_port = 0;
  realtime_runtime_check_push_authorization();
  uint64_t v1 = mach_msg(&msg, 17, 0x18u, 0, 0, 0, 0);
  realtime_runtime_check_pop_authorization();
  return v1;
}

void sub_2638CDAAC(_Unwind_Exception *a1)
{
}

unint64_t Channel::commit_message(Channel *this, uint64_t a2)
{
  *(_DWORD *)(a2 + 4) = *(_DWORD *)(a2 + 4) & 0x3FFFFFFF | 0x40000000;
  return Channel::advance_commit_assert_head(this);
}

unint64_t Channel::abandon_message(Channel *this, uint64_t a2)
{
  *(_DWORD *)(a2 + 4) |= 0xC0000000;
  return Channel::advance_commit_assert_head(this);
}

uint64_t Channel::msg_wait(Channel *this, mach_msg_timeout_t a2)
{
  mach_msg_return_t v4;
  mach_msg_header_t msg;

  realtime_runtime_check_push_authorization();
  uint64_t v4 = mach_msg(&msg, 258, 0, 0x30u, *((_DWORD *)this + 21), a2, 0);
  realtime_runtime_check_pop_authorization();
  if (v4 > 268451842) {
    return 0;
  }
  if (v4)
  {
    if (v4 == 268451842) {
      return 37;
    }
    return 0;
  }
  if (msg.msgh_id == 72) {
    return 14;
  }
  else {
    return 0;
  }
}

void sub_2638CDBAC(_Unwind_Exception *a1)
{
}

uint64_t Channel::poll_dead_name_notification(Channel *this)
{
  mach_msg_return_t v2;
  uint64_t result;
  uint64_t v4;
  mach_msg_header_t msg;
  int v6;
  mach_msg_return_t v7;
  long long v8;
  long long v9;
  long long v10;
  long long v11;
  long long v12;
  uint64_t v13;

  uint64_t v13 = *MEMORY[0x263EF8340];
  mach_port_name_t v1 = *((_DWORD *)this + 18);
  if (!v1) {
    return 1;
  }
  realtime_runtime_check_push_authorization();
  uint64_t v2 = mach_msg(&msg, 258, 0, 0x2Cu, v1, 0, 0);
  realtime_runtime_check_pop_authorization();
  unint64_t result = 1;
  if ((v2 - 268451842) <= 7 && ((1 << (v2 - 2)) & 0x93) != 0) {
    return 0;
  }
  if (v2)
  {
    realtime_runtime_check_push_authorization();
    unint64_t v11 = 0u;
    uint64_t v12 = 0u;
    BOOL v9 = 0u;
    uint64_t v10 = 0u;
    unsigned int v8 = 0u;
    os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR);
    unint64_t v6 = 67109120;
    uint64_t v7 = v2;
    _os_log_send_and_compose_impl();
    uint64_t v4 = _os_crash_msg();
    Channel::poll_dead_name_notification(v4);
  }
  return result;
}

void sub_2638CDD40(_Unwind_Exception *a1)
{
}

void Endpoint::Endpoint(Endpoint *this, MessageRingBuffer *a2, int a3)
{
  *(unsigned char *)this = 1;
  *((_DWORD *)this + 1) = a3;
  uint64_t v4 = (CASPage *)MessageRingBuffer::allocate(a2);
  *((void *)this + 1) = v4;
  *((void *)this + 2) = 0;
  CASPage::allocate(v4);
  *((void *)this + 3) = v5;
  *((_DWORD *)this + 8) = 0;
  *((_DWORD *)this + 9) = allocate_recv_right();
  *((unsigned char *)this + 40) = 0;
  *((_DWORD *)this + 11) = allocate_recv_right();
  *((_DWORD *)this + 12) = 0;
}

uint64_t allocate_recv_right(void)
{
  kern_return_t v0;
  mach_error_t v1;
  mach_port_name_t name;

  name = 0;
  v0 = mach_port_allocate(*MEMORY[0x263EF8960], 1u, &name);
  if (v0)
  {
    mach_port_name_t v1 = v0;
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      allocate_recv_right(v1);
    }
  }
  return name;
}

uint64_t Endpoint::Endpoint(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (!xpc_dictionary_get_BOOL(v3, "CHChannelEndpointRequestV2"))
  {
    *(void *)(a1 + 8) = 0;
    *(void *)(a1 + 16) = 0;
    Endpoint::release((Endpoint *)a1);
    goto LABEL_15;
  }
  *(unsigned char *)a1 = 0;
  uint64 = (MessageRingBuffer *)xpc_dictionary_get_uint64(v3, "CHChannelEndpointRingBufferPagesV2");
  *(_DWORD *)(a1 + 4) = uint64;
  *(void *)(a1 + 8) = MessageRingBuffer::allocate(uint64);
  uint64_t v5 = xpc_dictionary_get_value(v3, "CHChannelEndpointRingBufferV2");
  *(void *)(a1 + 16) = MessageRingBuffer::from_xpc(v5);

  uint64_t v6 = xpc_dictionary_get_value(v3, "CHChannelEndpointCASPageV2");
  uint64_t v7 = (void *)v6;
  unsigned int v8 = (vm_map_t *)MEMORY[0x263EF8960];
  if (v6)
  {
    if (MEMORY[0x263E6DB30](v6) == MEMORY[0x263EF8790])
    {
      region = 0;
      size_t v13 = xpc_shmem_map(v7, &region);
      if (v13)
      {
        if (v13 >= 0x100 && v13 == *MEMORY[0x263EF8AF8])
        {
          BOOL v9 = region;
          goto LABEL_7;
        }
        mach_vm_deallocate(*v8, (mach_vm_address_t)region, v13);
      }
    }
    else if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR))
    {
      Endpoint::Endpoint();
    }
  }
  BOOL v9 = 0;
LABEL_7:

  *(void *)(a1 + 24) = v9;
  *(_DWORD *)(a1 + 36) = allocate_recv_right();
  *(_DWORD *)(a1 + 32) = xpc_dictionary_copy_mach_send();
  *(_DWORD *)(a1 + 44) = allocate_recv_right();
  *(_DWORD *)(a1 + 48) = xpc_dictionary_copy_mach_send();
  mach_port_t previous = 0;
  *(unsigned char *)(a1 + 40) = mach_port_request_notification(*v8, *(_DWORD *)(a1 + 32), 72, 1u, *(_DWORD *)(a1 + 36), 0x15u, &previous) == 0;
  if (mach_port_request_notification(*v8, *(_DWORD *)(a1 + 48), 72, 1u, *(_DWORD *)(a1 + 44), 0x15u, &previous)) {
    BOOL v10 = 1;
  }
  else {
    BOOL v10 = *(unsigned char *)(a1 + 40) == 0;
  }
  char v11 = !v10;
  *(unsigned char *)(a1 + 40) = v11;
LABEL_15:

  return a1;
}

void sub_2638CE040(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t Endpoint::release(Endpoint *this)
{
  *(unsigned char *)this = 0;
  uint64_t v2 = *((void *)this + 1);
  if (v2) {
    MEMORY[0x263E6D780](v2, 0x1020C403ED2C137);
  }
  uint64_t result = *((void *)this + 2);
  *((void *)this + 1) = 0;
  *((_DWORD *)this + 1) = 0;
  if (result) {
    uint64_t result = MEMORY[0x263E6D780](result, 0x1020C403ED2C137);
  }
  *((_DWORD *)this + 11) = 0;
  *((_DWORD *)this + 12) = 0;
  *((void *)this + 3) = 0;
  *((void *)this + 4) = 0;
  *((void *)this + 2) = 0;
  *((unsigned char *)this + 40) = 0;
  return result;
}

void Endpoint::Endpoint(uint64_t a1, Endpoint *this)
{
  *(unsigned char *)a1 = *(unsigned char *)this;
  *(_DWORD *)(a1 + 4) = *((_DWORD *)this + 1);
  *(_OWORD *)(a1 + 8) = *(_OWORD *)((char *)this + 8);
  *(void *)(a1 + 24) = *((void *)this + 3);
  *(void *)(a1 + 32) = *((void *)this + 4);
  *(unsigned char *)(a1 + 40) = *((unsigned char *)this + 40);
  *(void *)(a1 + 44) = *(void *)((char *)this + 44);
  *((void *)this + 1) = 0;
  *((void *)this + 2) = 0;
  Endpoint::release(this);
}

void Endpoint::~Endpoint(Endpoint *this)
{
  uint64_t v2 = (mach_vm_size_t *)*((void *)this + 1);
  if (v2)
  {
    MessageRingBuffer::free(v2);
    *((void *)this + 1) = 0;
  }
  id v3 = (mach_vm_size_t *)*((void *)this + 2);
  if (v3)
  {
    MessageRingBuffer::free(v3);
    *((void *)this + 2) = 0;
  }
  mach_vm_address_t v4 = *((void *)this + 3);
  if (v4) {
    CASPage::free(v4);
  }
  mach_port_name_t v5 = *((_DWORD *)this + 9);
  uint64_t v6 = (ipc_space_t *)MEMORY[0x263EF8960];
  if (v5) {
    mach_port_mod_refs(*MEMORY[0x263EF8960], v5, 1u, -1);
  }
  mach_port_name_t v7 = *((_DWORD *)this + 8);
  if (v7) {
    mach_port_deallocate(*v6, v7);
  }
  mach_port_name_t v8 = *((_DWORD *)this + 11);
  if (v8) {
    mach_port_mod_refs(*v6, v8, 1u, -1);
  }
  mach_port_name_t v9 = *((_DWORD *)this + 12);
  if (v9) {
    mach_port_deallocate(*v6, v9);
  }
}

uint64_t Endpoint::encode(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (!*(unsigned char *)a1)
  {
    if (is_open((Endpoint *)a1))
    {
      readonly = (void *)xpc_shmem_create_readonly();
      mach_port_name_t v8 = (void *)xpc_mach_send_create_with_disposition();
      uint64_t v16 = xpc_mach_send_create_with_disposition();
      mach_port_name_t v9 = (void *)v16;
      if (readonly) {
        BOOL v17 = v8 == 0;
      }
      else {
        BOOL v17 = 1;
      }
      BOOL v18 = v17 || v16 == 0;
      uint64_t v15 = !v18;
      if (!v18)
      {
        xpc_dictionary_set_BOOL(v3, "CHChannelEndpointReplyV2", 1);
        xpc_dictionary_set_value(v3, "CHChannelEndpointRingBufferV2", readonly);
        xpc_dictionary_set_value(v3, "CHChannelEndpointDeadNameNotifyPortV2", v8);
        xpc_dictionary_set_value(v3, "CHChannelEndpointMsgNotifyPortV2", v9);
        uint64_t v15 = 1;
      }
      goto LABEL_40;
    }
LABEL_41:
    uint64_t v15 = 0;
    goto LABEL_42;
  }
  if (*(_DWORD *)(a1 + 4)) {
    BOOL v4 = *(void *)(a1 + 8) == 0;
  }
  else {
    BOOL v4 = 1;
  }
  BOOL v6 = v4 || *(void *)(a1 + 24) == 0 || *(_DWORD *)(a1 + 36) == 0;
  if (v6 || !*(_DWORD *)(a1 + 44)) {
    goto LABEL_41;
  }
  readonly = (void *)xpc_shmem_create_readonly();
  mach_port_name_t v8 = xpc_shmem_create(*(void **)(a1 + 24), *MEMORY[0x263EF8AF8]);
  mach_port_name_t v9 = (void *)xpc_mach_send_create_with_disposition();
  uint64_t v10 = xpc_mach_send_create_with_disposition();
  char v11 = (void *)v10;
  if (readonly) {
    BOOL v12 = v8 == 0;
  }
  else {
    BOOL v12 = 1;
  }
  BOOL v14 = v12 || v9 == 0 || v10 == 0;
  uint64_t v15 = !v14;
  if (!v14)
  {
    xpc_dictionary_set_BOOL(v3, "CHChannelEndpointRequestV2", 1);
    xpc_dictionary_set_value(v3, "CHChannelEndpointRingBufferV2", readonly);
    xpc_dictionary_set_uint64(v3, "CHChannelEndpointRingBufferPagesV2", *(unsigned int *)(a1 + 4));
    xpc_dictionary_set_value(v3, "CHChannelEndpointCASPageV2", v8);
    xpc_dictionary_set_value(v3, "CHChannelEndpointDeadNameNotifyPortV2", v9);
    xpc_dictionary_set_value(v3, "CHChannelEndpointMsgNotifyPortV2", v11);
  }

LABEL_40:
LABEL_42:

  return v15;
}

void sub_2638CE418(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

BOOL is_open(Endpoint *a1)
{
  if (*((_DWORD *)a1 + 1)) {
    BOOL v1 = *((void *)a1 + 1) == 0;
  }
  else {
    BOOL v1 = 1;
  }
  BOOL v4 = v1 || *((void *)a1 + 3) == 0 || *((_DWORD *)a1 + 9) == 0 || *((_DWORD *)a1 + 11) == 0;
  uint64_t v5 = 0;
  if (!v4)
  {
    if (*((void *)a1 + 2)) {
      BOOL v6 = *((_DWORD *)a1 + 8) == 0;
    }
    else {
      BOOL v6 = 1;
    }
    if (!v6 && *((unsigned char *)a1 + 40) != 0) {
      return *((_DWORD *)a1 + 12) != 0;
    }
  }
  return v5;
}

BOOL Endpoint::decode_reply(uint64_t a1, void *a2)
{
  id v3 = a2;
  BOOL v4 = v3;
  if (*(unsigned char *)a1 && xpc_dictionary_get_BOOL(v3, "CHChannelEndpointReplyV2"))
  {
    uint64_t v5 = xpc_dictionary_get_value(v4, "CHChannelEndpointRingBufferV2");
    *(void *)(a1 + 16) = MessageRingBuffer::from_xpc(v5);

    *(_DWORD *)(a1 + 32) = xpc_dictionary_copy_mach_send();
    *(_DWORD *)(a1 + 48) = xpc_dictionary_copy_mach_send();
    mach_port_t previous = 0;
    BOOL v6 = (ipc_space_t *)MEMORY[0x263EF8960];
    *(unsigned char *)(a1 + 40) = mach_port_request_notification(*MEMORY[0x263EF8960], *(_DWORD *)(a1 + 32), 72, 1u, *(_DWORD *)(a1 + 36), 0x15u, &previous) == 0;
    if (mach_port_request_notification(*v6, *(_DWORD *)(a1 + 48), 72, 1u, *(_DWORD *)(a1 + 44), 0x15u, &previous)) {
      BOOL v7 = 1;
    }
    else {
      BOOL v7 = *(unsigned char *)(a1 + 40) == 0;
    }
    char v8 = !v7;
    *(unsigned char *)(a1 + 40) = v8;
  }
  BOOL v9 = is_open((Endpoint *)a1);

  return v9;
}

void sub_2638CE5F0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t object_retain_internal()
{
  return MEMORY[0x270ED8108]();
}

uint64_t object_release_internal()
{
  return MEMORY[0x270ED80F8]();
}

void channel_endpoint_dispose(uint64_t a1)
{
}

void channel_rt_dispose(uint64_t a1)
{
}

void channel_dispatch_dispose(id *a1)
{
  uint64_t v2 = (Channel *)(a1 + 3);

  Channel::~Channel(v2);
}

void channel_dispatch_xref_dispose(uint64_t a1)
{
}

uint64_t channel_create_asymmetric_endpoint_and_request(unsigned int a1, unsigned int a2, void *a3)
{
  id v5 = a3;
  BOOL v6 = v5;
  uint64_t v7 = 0;
  if (a1 && a2 && v5)
  {
    if (MEMORY[0x263E6DB30](v5) == MEMORY[0x263EF8708])
    {
      Endpoint::Endpoint((Endpoint *)v9, a1, a2);
      if (Endpoint::encode((uint64_t)v9, v6))
      {
        uint64_t v7 = channel_endpoint_obj_alloc(72);
        Endpoint::Endpoint(v7 + 16, v9);
      }
      else
      {
        uint64_t v7 = 0;
      }
      Endpoint::~Endpoint((Endpoint *)v9);
    }
    else
    {
      uint64_t v7 = 0;
    }
  }

  return v7;
}

void sub_2638CE73C(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  Endpoint::~Endpoint((Endpoint *)va);

  _Unwind_Resume(a1);
}

uint64_t channel_rt_create_from_request(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  if (!v3) {
    goto LABEL_10;
  }
  uint64_t v5 = MEMORY[0x263E6DB30](v3);
  uint64_t v6 = 0;
  if (!v4) {
    goto LABEL_9;
  }
  uint64_t v7 = MEMORY[0x263EF8708];
  if (v5 != MEMORY[0x263EF8708]) {
    goto LABEL_9;
  }
  if (MEMORY[0x263E6DB30](v4) != v7)
  {
LABEL_10:
    uint64_t v6 = 0;
    goto LABEL_9;
  }
  Endpoint::Endpoint(v12, v3);
  if (Endpoint::encode((uint64_t)v12, v4))
  {
    uint64_t v6 = channel_rt_obj_alloc(112);
    uint64_t v8 = *(void *)(v13 + 16);
    long long v10 = *v14;
    uint64_t v11 = *((void *)v14 + 2);
    long long v22 = *(_OWORD *)v13;
    uint64_t v23 = v8;
    long long v20 = v10;
    uint64_t v21 = v11;
    *(void *)(v6 + 16) = Channel::Channel(v6 + 24, 0, &v22, (uint64_t)&v20, v15, v16, v17, v19, v18);
    Endpoint::release((Endpoint *)v12);
  }
  else
  {
    uint64_t v6 = 0;
  }
  Endpoint::~Endpoint((Endpoint *)v12);
LABEL_9:

  return v6;
}

void sub_2638CE890(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  va_start(va, a10);
  Endpoint::~Endpoint((Endpoint *)va);

  _Unwind_Resume(a1);
}

uint64_t channel_rt_create_from_reply(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = v3;
  uint64_t v5 = 0;
  if (a1 && v3)
  {
    if (MEMORY[0x263E6DB30](v3) == MEMORY[0x263EF8708] && Endpoint::decode_reply(a1 + 16, v4))
    {
      uint64_t v5 = channel_rt_obj_alloc(112);
      uint64_t v6 = *(void *)(a1 + 24);
      uint64_t v7 = *(long long **)(a1 + 32);
      uint64_t v15 = *(void *)(v6 + 16);
      long long v13 = *v7;
      uint64_t v14 = *((void *)v7 + 2);
      uint64_t v8 = *(void *)(a1 + 40);
      int v9 = *(_DWORD *)(a1 + 48);
      int v10 = *(_DWORD *)(a1 + 52);
      LODWORD(v7) = *(_DWORD *)(a1 + 60);
      int v11 = *(_DWORD *)(a1 + 64);
      long long v18 = *(_OWORD *)v6;
      uint64_t v19 = v15;
      long long v16 = v13;
      uint64_t v17 = v14;
      *(void *)(v5 + 16) = Channel::Channel(v5 + 24, 1, &v18, (uint64_t)&v16, v8, v9, v10, v11, (int)v7);
      Endpoint::release((Endpoint *)(a1 + 16));
    }
    else
    {
      uint64_t v5 = 0;
    }
  }

  return v5;
}

void sub_2638CE9B4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void channel_dispatch_cancel(uint64_t a1)
{
}

uint64_t channel_rt_close(uint64_t a1)
{
  return RTChannel::close(a1 + 24);
}

BOOL channel_rt_poll_closed(uint64_t a1)
{
  return RTChannel::poll_closed((atomic_uint *)(a1 + 24));
}

BOOL channel_dispatch_is_closed(uint64_t a1)
{
  return atomic_load_explicit((atomic_uint *volatile)(a1 + 96), memory_order_acquire) == 0;
}

BOOL channel_rt_receive_message(uint64_t a1, int a2, void *a3, void *a4, _DWORD *a5)
{
  RTChannel::receive_message((atomic_ullong **)(a1 + 24), a2, v12);
  int v8 = v14;
  if (v14)
  {
    uint64_t v9 = v13 + 8;
    int v10 = v12[1];
    *a4 = (v12[0] - 8);
    *a5 = v10;
  }
  else
  {
    uint64_t v9 = 0;
  }
  BOOL result = v8 != 0;
  *a3 = v9;
  return result;
}

BOOL channel_rt_pop_message(uint64_t a1, void *a2, void *a3, _DWORD *a4)
{
  RTChannel::pop_message((RTChannel *)(a1 + 24), v11);
  int v7 = v13;
  if (v13)
  {
    uint64_t v8 = v12 + 8;
    int v9 = v11[1];
    *a3 = (v11[0] - 8);
    *a4 = v9;
  }
  else
  {
    uint64_t v8 = 0;
  }
  BOOL result = v7 != 0;
  *a2 = v8;
  return result;
}

uint64_t channel_rt_wait_message(uint64_t a1, int a2)
{
  return RTChannel::wait_message((RTChannel *)(a1 + 24), a2);
}

BOOL channel_rt_probe_message(uint64_t a1)
{
  return RTChannel::probe_message((atomic_ullong *volatile *)(a1 + 24));
}

BOOL channel_rt_wire(uint64_t a1)
{
  return RTChannel::wire((const void **)(a1 + 24));
}

uint64_t channel_rt_unwire(uint64_t a1)
{
  return RTChannel::unwire((const void **)(a1 + 24));
}

_DWORD *channel_reserve_aligned_message(uint64_t a1, int a2, uint64_t a3, uint64_t a4)
{
  if ((a2 - 0x40000000) < 0xC0000400 || a4 == 0) {
    return 0;
  }
  uint64_t v5 = Channel::reserve_message(*(atomic_uint **)(a1 + 16), a2, a3, a4);
  if (v5) {
    return v5 + 2;
  }
  else {
    return 0;
  }
}

unint64_t channel_commit_message(uint64_t a1, uint64_t a2)
{
  return Channel::commit_message(*(Channel **)(a1 + 16), a2 - 8);
}

unint64_t channel_abandon_message(uint64_t a1, uint64_t a2)
{
  return Channel::abandon_message(*(Channel **)(a1 + 16), a2 - 8);
}

uint64_t channel_get_readwrite_shared_memory(uint64_t a1, void *a2, void *a3)
{
  *a3 = *MEMORY[0x263EF8AF8] - 512;
  *a2 = *(void *)(*(void *)(a1 + 16) + 16) + 512;
  return 1;
}

uint64_t channel_get_readonly_shared_memory(uint64_t a1, void *a2, void *a3)
{
  *a3 = *MEMORY[0x263EF8AF8] - 512;
  *a2 = *(void *)(*(void *)(a1 + 16) + 40) + 512;
  return 1;
}

unint64_t channel_bytes_sent(uint64_t a1)
{
  uint64_t v2 = **(void **)(*(void *)(a1 + 16) + 56);
  return AssertableValue::value((AssertableValue *)&v2);
}

uint64_t channel_bytes_received(uint64_t a1)
{
  return *(void *)(*(void *)(*(void *)(a1 + 16) + 16) + 256);
}

uint64_t channel_dispatch_create_from_request(void *a1, void *a2, void *a3)
{
  id v5 = a1;
  id v6 = a2;
  id v7 = a3;
  if (v5)
  {
    uint64_t v8 = MEMORY[0x263E6DB30](v5);
    uint64_t v9 = 0;
    if (v6)
    {
      uint64_t v10 = MEMORY[0x263EF8708];
      if (v8 == MEMORY[0x263EF8708])
      {
        uint64_t v11 = MEMORY[0x263E6DB30](v6);
        uint64_t v9 = 0;
        if (v7)
        {
          if (v11 == v10)
          {
            Endpoint::Endpoint(v19, v5);
            if (Endpoint::encode((uint64_t)v19, v6))
            {
              uint64_t v9 = channel_dispatch_obj_alloc(152);
              uint64_t v12 = *((void *)v20 + 2);
              long long v17 = *v20;
              uint64_t v18 = v12;
              uint64_t v13 = *(void *)(v21 + 16);
              long long v15 = *(_OWORD *)v21;
              uint64_t v16 = v13;
              *(void *)(v9 + 16) = DispatchChannel::DispatchChannel(v9 + 24, 0, (uint64_t)&v17, &v15, v22, v23, v24, v26, v25, v7, v9);
              Endpoint::release((Endpoint *)v19);
            }
            else
            {
              uint64_t v9 = 0;
            }
            Endpoint::~Endpoint((Endpoint *)v19);
          }
        }
      }
    }
  }
  else
  {
    uint64_t v9 = 0;
  }

  return v9;
}

void sub_2638CED44(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, ...)
{
  va_start(va, a12);
  Endpoint::~Endpoint((Endpoint *)va);

  _Unwind_Resume(a1);
}

uint64_t channel_dispatch_create_from_reply(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = 0;
  if (a1)
  {
    if (v5)
    {
      uint64_t v8 = MEMORY[0x263E6DB30](v5);
      uint64_t v7 = 0;
      if (v6)
      {
        if (v8 == MEMORY[0x263EF8708])
        {
          if (Endpoint::decode_reply(a1 + 16, v5))
          {
            uint64_t v7 = channel_dispatch_obj_alloc(152);
            uint64_t v9 = *(long long **)(a1 + 24);
            uint64_t v10 = *(void *)(a1 + 32);
            uint64_t v11 = *((void *)v9 + 2);
            long long v16 = *v9;
            uint64_t v17 = v11;
            uint64_t v12 = *(void *)(v10 + 16);
            long long v14 = *(_OWORD *)v10;
            uint64_t v15 = v12;
            *(void *)(v7 + 16) = DispatchChannel::DispatchChannel(v7 + 24, 1, (uint64_t)&v16, &v14, *(void *)(a1 + 40), *(_DWORD *)(a1 + 48), *(_DWORD *)(a1 + 52), *(_DWORD *)(a1 + 64), *(_DWORD *)(a1 + 60), v6, v7);
            Endpoint::release((Endpoint *)(a1 + 16));
          }
          else
          {
            uint64_t v7 = 0;
          }
        }
      }
    }
  }

  return v7;
}

void sub_2638CEE78(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void channel_dispatch_activate(uint64_t a1)
{
}

void channel_dispatch_try_activate(uint64_t a1)
{
}

uint64_t channel_dispatch_set_message_handler(uint64_t a1, uint64_t a2)
{
  return DispatchChannel::set_message_handler(a1 + 24, a2);
}

uint64_t channel_dispatch_set_cancel_handler(uint64_t a1, uint64_t a2)
{
  return DispatchChannel::set_close_handler(a1 + 24, a2);
}

void CASPage::allocate(mach_error_t a1)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  int v1 = 136315138;
  uint64_t v2 = mach_error_string(a1);
  _os_log_error_impl(&dword_2638CB000, MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR, "CASPage::allocate failed: %s", (uint8_t *)&v1, 0xCu);
}

void MessageRingBufferSharedMemory::allocate(int a1)
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  v1[0] = 67109120;
  v1[1] = a1;
  _os_log_error_impl(&dword_2638CB000, MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR, "message_pages value of %u is too large - data_size overflowed. Not allocating ringbuffer", (uint8_t *)v1, 8u);
}

{
  _DWORD v1[2];
  uint64_t v2;

  uint64_t v2 = *MEMORY[0x263EF8340];
  v1[0] = 67109120;
  v1[1] = a1;
  _os_log_error_impl(&dword_2638CB000, MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR, "message_pages value of %u is too large - virtual_size overflowed. Not allocating ringbuffer", (uint8_t *)v1, 8u);
}

void MessageRingBufferSharedMemory::allocate(mach_error_t a1)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  int v1 = 136315138;
  uint64_t v2 = mach_error_string(a1);
  _os_log_error_impl(&dword_2638CB000, MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR, "MessageRingBuffer ringbuffer mach_vm_remap failed: %s", (uint8_t *)&v1, 0xCu);
}

void MessageRingBufferSharedMemory::allocate(mach_error_t a1, uint64_t a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  int v2 = 134218242;
  uint64_t v3 = a2;
  __int16 v4 = 2080;
  id v5 = mach_error_string(a1);
  _os_log_error_impl(&dword_2638CB000, MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR, "MessageRingBuffer mach_vm_allocate %llu bytes failed: %s", (uint8_t *)&v2, 0x16u);
}

void allocate_recv_right(mach_error_t a1)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  int v1 = 136315138;
  int v2 = mach_error_string(a1);
  _os_log_error_impl(&dword_2638CB000, MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR, "Unable to allocate mach receive right %s", (uint8_t *)&v1, 0xCu);
}

void Endpoint::Endpoint()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  int v0 = 136315138;
  int v1 = "CHChannelEndpointCASPageV2";
  _os_log_error_impl(&dword_2638CB000, MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR, "Item at key (%s) was not a XPC_TYPE_SHMEM, not retrieving", (uint8_t *)&v0, 0xCu);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void std::terminate(void)
{
}

void operator delete()
{
  while (1)
    ;
}

void operator new()
{
  while (1)
    ;
}

void *__cxa_begin_catch(void *a1)
{
  return (void *)MEMORY[0x270F98ED8](a1);
}

uint64_t _os_crash_msg()
{
  return MEMORY[0x270ED8068]();
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _os_log_send_and_compose_impl()
{
  return MEMORY[0x270ED80B0]();
}

void dispatch_activate(dispatch_object_t object)
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

uint64_t dispatch_source_set_mandatory_cancel_handler()
{
  return MEMORY[0x270ED9560]();
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

kern_return_t mach_port_mod_refs(ipc_space_t task, mach_port_name_t name, mach_port_right_t right, mach_port_delta_t delta)
{
  return MEMORY[0x270EDA210](*(void *)&task, *(void *)&name, *(void *)&right, *(void *)&delta);
}

kern_return_t mach_port_request_notification(ipc_space_t task, mach_port_name_t name, mach_msg_id_t msgid, mach_port_mscount_t sync, mach_port_t notify, mach_msg_type_name_t notifyPoly, mach_port_t *previous)
{
  return MEMORY[0x270EDA220](*(void *)&task, *(void *)&name, *(void *)&msgid, *(void *)&sync, *(void *)&notify, *(void *)&notifyPoly, previous);
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return MEMORY[0x270EDA288](info);
}

kern_return_t mach_vm_allocate(vm_map_t target, mach_vm_address_t *address, mach_vm_size_t size, int flags)
{
  return MEMORY[0x270EDA290](*(void *)&target, address, size, *(void *)&flags);
}

kern_return_t mach_vm_deallocate(vm_map_t target, mach_vm_address_t address, mach_vm_size_t size)
{
  return MEMORY[0x270EDA298](*(void *)&target, address, size);
}

kern_return_t mach_vm_remap(vm_map_t target_task, mach_vm_address_t *target_address, mach_vm_size_t size, mach_vm_offset_t mask, int flags, vm_map_t src_task, mach_vm_address_t src_address, BOOLean_t copy, vm_prot_t *cur_protection, vm_prot_t *max_protection, vm_inherit_t inheritance)
{
  return MEMORY[0x270EDA2D8](*(void *)&target_task, target_address, size, mask, *(void *)&flags, *(void *)&src_task, src_address, *(void *)&copy);
}

int mlock(const void *a1, size_t a2)
{
  return MEMORY[0x270EDA590](a1, a2);
}

int munlock(const void *a1, size_t a2)
{
  return MEMORY[0x270EDA5E8](a1, a2);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x270F9A5A8]();
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6E8](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x270F9A6F8]();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x270F9A870](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x270F9A898](a1);
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

uint64_t realtime_runtime_check_pop_authorization()
{
  return MEMORY[0x270F9B1B8]();
}

uint64_t realtime_runtime_check_push_authorization()
{
  return MEMORY[0x270F9B1C0]();
}

uint64_t xpc_dictionary_copy_mach_send()
{
  return MEMORY[0x270EDC000]();
}

BOOL xpc_dictionary_get_BOOL(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x270EDC050](xdict, key);
}

uint64_t xpc_dictionary_get_uint64(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x270EDC0B0](xdict, key);
}

xpc_object_t xpc_dictionary_get_value(xpc_object_t xdict, const char *key)
{
  return (xpc_object_t)MEMORY[0x270EDC0C0](xdict, key);
}

void xpc_dictionary_set_BOOL(xpc_object_t xdict, const char *key, BOOL value)
{
}

void xpc_dictionary_set_uint64(xpc_object_t xdict, const char *key, uint64_t value)
{
}

void xpc_dictionary_set_value(xpc_object_t xdict, const char *key, xpc_object_t value)
{
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return (xpc_type_t)MEMORY[0x270EDC200](object);
}

uint64_t xpc_mach_send_create_with_disposition()
{
  return MEMORY[0x270EDC270]();
}

xpc_object_t xpc_shmem_create(void *region, size_t length)
{
  return (xpc_object_t)MEMORY[0x270EDC3B0](region, length);
}

uint64_t xpc_shmem_create_readonly()
{
  return MEMORY[0x270EDC3B8]();
}