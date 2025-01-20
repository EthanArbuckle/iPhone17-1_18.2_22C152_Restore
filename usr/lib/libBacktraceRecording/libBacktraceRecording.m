uint64_t __introspection_dispatch_get_queues(int a1, mach_vm_address_t *a2, mach_vm_size_t *a3)
{
  int *v3;
  uint64_t v4;
  mach_vm_size_t v5;
  int v6;
  unsigned int v7;
  unsigned int v8;
  unsigned int *v9;
  int v10;
  int v11;
  int v12;
  unsigned int v13;
  unsigned int v14;
  mach_vm_address_t v16;
  int *v17;
  unsigned int v18;
  unsigned int v19;
  unsigned int *v20;
  int v21;
  unsigned int v22;
  unsigned int v23;
  uint64_t v24;
  unsigned int v25;
  unsigned int v26;
  unsigned int v27;
  size_t v28;
  int v29;
  size_t v30;
  int v31;
  size_t v32;
  char *v33;
  int v34;
  uint64_t v35;
  int v38;
  _DWORD *v39;
  mach_vm_address_t address;

  *a2 = 0;
  *a3 = 0;
  v3 = off_C090;
  if (!off_C090) {
    return 0;
  }
  v4 = 0;
  v5 = 0;
  v6 = a1 - 1;
  do
  {
    switch(v6)
    {
      case 0:
        goto LABEL_10;
      case 1:
        v7 = atomic_load((unsigned int *)v3 + 11);
        v8 = atomic_load((unsigned int *)v3 + 12);
        if (!(((int)(v8 + v7) < 0) ^ __OFADD__(v8, v7) | (v8 + v7 == 0))) {
          goto LABEL_10;
        }
        break;
      case 2:
        v9 = (unsigned int *)(v3 + 12);
        goto LABEL_9;
      case 3:
        v9 = (unsigned int *)(v3 + 11);
LABEL_9:
        v10 = atomic_load(v9);
        if (v10 > 0) {
          goto LABEL_10;
        }
        break;
      case 4:
        v13 = atomic_load((unsigned int *)v3 + 11);
        v14 = atomic_load((unsigned int *)v3 + 12);
        if (v13 + v14) {
          break;
        }
LABEL_10:
        v11 = strlen((const char *)v3 + 52) + 33;
        v12 = 8 - (v11 & 7);
        ++v4;
        if ((v11 & 7) == 0) {
          v12 = 0;
        }
        v5 += (v12 + v11);
        break;
      default:
        break;
    }
    v3 = *(int **)v3;
  }
  while (v3);
  if (v4)
  {
    address = 0;
    if (mach_vm_allocate(mach_task_self_, &address, v5, 1))
    {
      fwrite("libBacktraceRecording: can't allocate VM for dispatch queues list\n", 0x42uLL, 1uLL, __stderrp);
      return 0;
    }
    v16 = address;
    v17 = off_C090;
    if (off_C090)
    {
      do
      {
        switch(v6)
        {
          case 0:
            goto LABEL_32;
          case 1:
            v18 = atomic_load((unsigned int *)v17 + 11);
            v19 = atomic_load((unsigned int *)v17 + 12);
            if (!(((int)(v19 + v18) < 0) ^ __OFADD__(v19, v18) | (v19 + v18 == 0))) {
              goto LABEL_32;
            }
            break;
          case 2:
            v20 = (unsigned int *)(v17 + 12);
            goto LABEL_29;
          case 3:
            v20 = (unsigned int *)(v17 + 11);
LABEL_29:
            v21 = atomic_load(v20);
            if (v21 <= 0) {
              break;
            }
            goto LABEL_32;
          case 4:
            v22 = atomic_load((unsigned int *)v17 + 11);
            v23 = atomic_load((unsigned int *)v17 + 12);
            if (!(v22 + v23))
            {
LABEL_32:
              v24 = *((void *)v17 + 4);
              *(void *)(v16 + 8) = *((void *)v17 + 3);
              *(void *)(v16 + 16) = v24;
              LODWORD(v24) = atomic_load((unsigned int *)v17 + 11);
              if ((v24 & 0x80000000) != 0) {
                v25 = 0;
              }
              else {
                v25 = atomic_load((unsigned int *)v17 + 11);
              }
              *(_DWORD *)(v16 + 24) = v25;
              v26 = atomic_load((unsigned int *)v17 + 12);
              if ((v26 & 0x80000000) != 0) {
                v27 = 0;
              }
              else {
                v27 = atomic_load((unsigned int *)v17 + 12);
              }
              *(_DWORD *)(v16 + 28) = v27;
              v28 = strlen((const char *)v17 + 52);
              v29 = v28 + 33;
              v30 = 8 - ((v28 + 33) & 7u);
              v31 = (v28 + 33) & 7;
              v32 = v28 + 1;
              v39 = (_DWORD *)v16;
              v33 = (char *)(v16 + 32);
              if (v31) {
                v34 = 8 - ((v28 + 33) & 7);
              }
              else {
                v34 = 0;
              }
              v38 = v34;
              memcpy(v33, v17 + 13, v32);
              if (v31) {
                bzero(&v33[v32], v30);
              }
              v35 = (v38 + v29);
              *v39 = v35;
              v16 = (mach_vm_address_t)v39 + v35;
            }
            break;
          default:
            break;
        }
        v17 = *(int **)v17;
      }
      while (v17);
      v16 = address;
    }
    *a2 = v16;
    *a3 = v5;
  }
  return v4;
}

uint64_t __introspection_dispatch_queue_get_pending_items(uint64_t a1, mach_vm_address_t *a2, uint64_t *a3)
{
  *a2 = 0;
  *a3 = 0;
  uint64_t v5 = dispatch_queue_serialnum(a1);
  v6 = off_C0F8;
  if (!off_C0F8) {
    return 0;
  }
  uint64_t v7 = v5;
  uint64_t v8 = 0;
  do
  {
    if (*(void *)(*((void *)v6 + 15) + 32) == v5) {
      ++v8;
    }
    v6 = *(int **)v6;
  }
  while (v6);
  if (v8)
  {
    mach_vm_address_t address = 0;
    if (mach_vm_allocate(mach_task_self_, &address, (16 * v8) | 8, 1))
    {
      fwrite("libBacktraceRecording: can't allocate VM for work items list\n", 0x3DuLL, 1uLL, __stderrp);
      return 0;
    }
    mach_vm_address_t v10 = address;
    *(void *)mach_vm_address_t address = 0x1000000001;
    v11 = off_C0F8;
    if (off_C0F8)
    {
      v12 = (int **)(v10 + 8);
      do
      {
        if (*(void *)(*((void *)v11 + 15) + 32) == v7)
        {
          *v12 = v11;
          v12[1] = (int *)*((void *)v11 + 7);
          v12 += 2;
        }
        v11 = *(int **)v11;
      }
      while (v11);
    }
    *a2 = v10;
    *a3 = (16 * v8) | 8;
  }
  return v8;
}

void *__introspection_dispatch_queue_item_get_info(void *result, mach_vm_address_t *a2, mach_vm_size_t *a3)
{
  *a2 = 0;
  *a3 = 0;
  if (result)
  {
    uint64_t v5 = result;
    uint64_t v6 = *((unsigned int *)result + 23);
    size_t v7 = strlen((const char *)(result[13] + 40)) + 1;
    size_t v8 = strlen((const char *)(v5[14] + 52)) + 1;
    size_t v9 = strlen((const char *)(v5[15] + 52)) + 1;
    mach_vm_size_t v10 = v7 + 8 * v6 + v8 + v9 + 56;
    mach_vm_address_t address = 0;
    if (mach_vm_allocate(mach_task_self_, &address, v10, 1))
    {
      return (void *)fwrite("libBacktraceRecording: can't allocate VM for item info\n", 0x37uLL, 1uLL, __stderrp);
    }
    else
    {
      mach_vm_address_t v11 = address;
      *(void *)mach_vm_address_t address = v5[16];
      *(void *)(v11 + 8) = v5[7];
      *(_DWORD *)(v11 + 44) = *((_DWORD *)v5 + 36);
      uint64_t v12 = v5[14];
      *(void *)(v11 + 16) = *(void *)(v5[13] + 24);
      *(void *)(v11 + 24) = *(void *)(v12 + 32);
      *(void *)(v11 + 32) = *(void *)(v5[15] + 32);
      *(_DWORD *)(v11 + 40) = *((_DWORD *)v5 + 23);
      *(_DWORD *)(v11 + 48) = *((_DWORD *)v5 + 34);
      *(_DWORD *)(v11 + 52) = *((_DWORD *)v5 + 35);
      ptrSized_stack_frames_for_uniqued_stack(backtrace_uniquing_table, v5[12], v11 + 56, *((unsigned int *)v5 + 23));
      memcpy((void *)(v11 + 56 + 8 * v6), (const void *)(v5[13] + 40), v7);
      v13 = (char *)(v11 + 56 + 8 * v6 + v7);
      memcpy(v13, (const void *)(v5[14] + 52), v8);
      result = memcpy(&v13[v8], (const void *)(v5[15] + 52), v9);
      *a2 = v11;
      *a3 = v10;
    }
  }
  return result;
}

void *__introspection_dispatch_thread_get_item_info(void *result, mach_vm_address_t *a2, mach_vm_size_t *a3)
{
  *a2 = 0;
  *a3 = 0;
  v3 = &qword_C028;
  while (1)
  {
    v3 = (uint64_t *)*v3;
    if (!v3) {
      break;
    }
    if ((void *)v3[3] == result)
    {
      result = (void *)v3[14];
      if (result) {
        return __introspection_dispatch_queue_item_get_info(result, a2, a3);
      }
      return result;
    }
  }
  return result;
}

uint64_t active_work_item()
{
  return *((void *)current_thread_info() + 14);
}

atomic_uint *current_thread_info()
{
  result = (atomic_uint *)pthread_getspecific(thread_info_key);
  if (!result)
  {
    return add_thread_info_to_list();
  }
  return result;
}

void *dispatch_queue_label()
{
  result = (void *)dispatch_queue_get_label_ptr();
  if (!result) {
    return &unk_66B2;
  }
  return result;
}

uint64_t dispatch_queue_serialnum(uint64_t a1)
{
  int v1 = *(unsigned __int16 *)(dispatch_queue_offsets + 12);
  if (v1 == 8) {
    return *(void *)(a1 + *(unsigned __int16 *)(dispatch_queue_offsets + 10));
  }
  if (v1 == 4) {
    return *(unsigned int *)(a1 + *(unsigned __int16 *)(dispatch_queue_offsets + 10));
  }
  return 0;
}

atomic_uint *add_thread_info_to_list()
{
  kern_return_t v3;
  uint64_t v4;
  void *v5;
  const void *v6;
  FILE *v7;
  pid_t v8;
  mach_msg_type_number_t thread_info_outCnt;
  integer_t thread_info_out[2];
  uint64_t v12;
  uint64_t v13;
  long long __src;
  long long v15;
  _OWORD v16[4];
  long long v17;
  uint64_t v18;

  entry_from_free_list = (atomic_uint *)pthread_getspecific(thread_info_key);
  if (!entry_from_free_list)
  {
    v18 = 0;
    v17 = 0u;
    v15 = 0u;
    memset(v16, 0, sizeof(v16));
    __src = 0u;
    int v1 = pthread_self();
    *(void *)&v16[0] = v1;
    BYTE8(v16[0]) = 0;
    pthread_getname_np(v1, (char *)v16 + 8, 0x40uLL);
    *(void *)thread_info_out = 0;
    uint64_t v12 = 0;
    v13 = 0;
    thread_info_outCnt = 6;
    thread_inspect_t v2 = pthread_mach_thread_np(v1);
    v3 = thread_info(v2, 4u, thread_info_out, &thread_info_outCnt);
    v4 = *(void *)thread_info_out;
    if (v3) {
      v4 = 0;
    }
    *((void *)&v15 + 1) = v4;
    *((void *)&v17 + 1) = 0;
    v18 = 0;
    entry_from_free_list = (atomic_uint *)get_entry_from_free_list((uint64_t)&thread_lists, &__src, 1);
    atomic_fetch_add(entry_from_free_list + 5, 1u);
    if (debug_printing)
    {
      uint64_t v5 = pthread_getspecific(thread_info_key);
      if (v5)
      {
        uint64_t v6 = v5;
        size_t v7 = __stderrp;
        size_t v8 = getpid();
        fprintf(v7, "pid %d add_thread_info_to_list() called for thread %p;  thread_info should be NULL but is %p\n",
          v8,
          v1,
          v6);
      }
    }
    pthread_setspecific(thread_info_key, entry_from_free_list);
    if (debug_trace_threads) {
      print_thread_summary((uint64_t)entry_from_free_list, "thread added to list: ", (const char *)&unk_66B2);
    }
  }
  return entry_from_free_list;
}

unsigned int *get_entry_from_free_list(uint64_t a1, void *__src, int a3)
{
  if (a3) {
    os_unfair_lock_lock_with_options();
  }
  uint64_t v6 = *(unsigned int **)(a1 + 80);
  if (!v6)
  {
    mach_vm_address_t address = 0;
    unint64_t v7 = *(void *)(a1 + 8);
    vm_size_t v8 = (vm_page_size + (v7 << 7) - 1) & -(uint64_t)vm_page_size;
    if (mach_vm_allocate(mach_task_self_, &address, v8, 167772161)) {
      get_entry_from_free_list_cold_1();
    }
    vm_size_t v9 = v8 / v7;
    *(void *)(a1 + 16) += v8;
    mach_vm_address_t v10 = address;
    *(_DWORD *)(a1 + 96) += v8 / v7;
    if ((v8 / v7))
    {
      uint64_t v11 = *(void *)(a1 + 8);
      uint64_t v12 = *(void **)(a1 + 88);
      do
      {
        *(_DWORD *)(v10 + 16) = 0;
        *(void *)mach_vm_address_t v10 = 0;
        *(void *)(v10 + 8) = v12;
        *uint64_t v12 = v10;
        uint64_t v12 = (void *)v10;
        *(void *)(a1 + 88) = v10;
        v10 += v11;
        LODWORD(v9) = v9 - 1;
      }
      while (v9);
    }
    uint64_t v6 = *(unsigned int **)(a1 + 80);
  }
  uint64_t v13 = *(void *)v6;
  v14 = (void *)*((void *)v6 + 1);
  if (*(void *)v6)
  {
    *(void *)(v13 + 8) = v14;
    v14 = (void *)*((void *)v6 + 1);
  }
  else
  {
    *(void *)(a1 + 88) = v14;
  }
  void *v14 = v13;
  --*(_DWORD *)(a1 + 96);
  memcpy(v6, __src, *(void *)(a1 + 8));
  v6[4] = 1;
  atomic_store(0, v6 + 5);
  v15 = *(unsigned int ***)(a1 + 40);
  *(void *)uint64_t v6 = 0;
  *((void *)v6 + 1) = v15;
  *v15 = v6;
  *(void *)(a1 + 40) = v6;
  ++*(_DWORD *)(a1 + 48);
  if (a3) {
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 24));
  }
  return v6;
}

size_t __library_initializer()
{
  kern_return_t v8;
  void *dli_saddr;
  mach_vm_address_t v10;
  char *v11;
  int v12;
  Dl_info v13;
  mach_port_t object_name;
  mach_msg_type_number_t infoCnt;
  int info[4];
  long long v17;
  int v18;
  mach_vm_size_t size;
  mach_vm_address_t address;
  uint64_t vars8;

  v0 = dlopen("/usr/lib/system/introspection/libdispatch.dylib", 16);
  if (v0)
  {
    int v1 = v0;
    thread_inspect_t v2 = dlsym(v0, "dispatch_introspection_versions");
    if (v2 && v2[1] > 1uLL)
    {
      gcd_hook_install_ptr = (uint64_t (*)(void))dlsym(v1, "dispatch_introspection_hooks_install");
      if (gcd_hook_install_ptr)
      {
        dispatch_get_current_queue_ptr = (uint64_t (*)(void))dlsym(v1, "dispatch_get_current_queue");
        dispatch_queue_get_label_ptr = (uint64_t (*)(void))dlsym(v1, "dispatch_queue_get_label");
        dispatch_queue_offsets = (uint64_t)dlsym(v1, "dispatch_queue_offsets");
        size = 0;
        mach_vm_address_t address = (mach_vm_address_t)dispatch_get_current_queue_ptr;
        v18 = 0;
        *(_OWORD *)info = 0u;
        v17 = 0u;
        object_name = 0;
        infoCnt = 9;
        vm_size_t v8 = mach_vm_region(mach_task_self_, &address, &size, 9, info, &infoCnt, &object_name);
        dli_saddr = 0;
        if (!v8)
        {
          mach_vm_address_t v10 = address;
          uint64_t v11 = (char *)(address + size - 1);
          if ((unint64_t)v11 >= address)
          {
            do
            {
              memset(&v13, 0, sizeof(v13));
              if (dladdr(v11, &v13))
              {
                if (!v13.dli_sname) {
                  break;
                }
                uint64_t v12 = strcmp(v13.dli_sname, "_dispatch_queue_override_invoke_owning");
                dli_saddr = v13.dli_saddr;
                if (!v12) {
                  goto LABEL_20;
                }
                uint64_t v11 = (char *)v13.dli_saddr - 2;
              }
              else
              {
                --v11;
              }
            }
            while ((unint64_t)v11 >= v10);
          }
          dli_saddr = 0;
        }
LABEL_20:
        _dispatch_queue_override_invoke_owning_ptr = (uint64_t)dli_saddr;
        pthread_atfork((void (*)(void))fork_prepare_handler, fork_parent_process_handler, fork_child_process_handler);
        enable_hooks = 1;
        dispatch_introspection_hooks = (uint64_t (*)(void))gcd_queue_create_hook;
        off_C1A8 = (uint64_t (*)(void))gcd_queue_dispose_hook;
        off_C1B0 = (uint64_t (*)(void, void))gcd_queue_item_enqueue_hook;
        off_C1B8 = (uint64_t (*)(void, void))gcd_queue_item_dequeue_hook;
        off_C1C0 = (uint64_t (*)(void))gcd_queue_item_complete_hook;
        gcd_hook_install_ptr();
        previous_pthread_hook = (uint64_t (*)(void, void, void, void))pthread_introspection_hook_install((pthread_introspection_hook_t)pthread_introspection_hook);
        if (debug_printing) {
          initialize_debug_printing();
        }
        pthread_key_create((pthread_key_t *)&thread_info_key, (void (__cdecl *)(void *))thread_terminating);
        resetDyldInsertLibraries("libBacktraceRecording.dylib");
        backtrace_uniquing_table = (uint64_t)create_backtrace_uniquing_table(0x4000u, 4);
        return dlclose(v1);
      }
      fwrite("dlsym did not find dispatch_introspection_hooks_install() in /usr/lib/system/introspection/libdispatch.dylib\n", 0x6DuLL, 1uLL, __stderrp);
      v3 = __stderrp;
      v4 = "Process must be launched with DYLD_LIBRARY_PATH=/usr/lib/system/introspection to get libdispatch introspection\n";
      size_t v5 = 111;
    }
    else
    {
      v3 = __stderrp;
      v4 = "Need a more recent version of /usr/lib/system/introspection/libdispatch.dylib -- missing suppport for the que"
           "ue_item_complete hook function.\n";
      size_t v5 = 141;
    }
    fwrite(v4, v5, 1uLL, v3);
    return dlclose(v1);
  }
  unint64_t v7 = __stderrp;

  return fwrite("Process must be launched with DYLD_LIBRARY_PATH=/usr/lib/system/introspection to get libdispatch introspection\n", 0x6FuLL, 1uLL, v7);
}

uint64_t fork_prepare_handler()
{
  os_unfair_lock_lock_with_options();
  os_unfair_lock_lock_with_options();
  uint64_t result = os_unfair_lock_lock_with_options();
  enable_hooks = 0;
  return result;
}

void fork_parent_process_handler()
{
  enable_hooks = 1;
  os_unfair_lock_unlock((os_unfair_lock_t)&dword_C020);
  os_unfair_lock_unlock((os_unfair_lock_t)&dword_C088);

  os_unfair_lock_unlock((os_unfair_lock_t)&dword_C0F0);
}

void fork_child_process_handler()
{
  enable_hooks = 0;
  dword_C020 = 0;
  dword_C088 = 0;
  dword_C0F0 = 0;
}

atomic_uint *pthread_introspection_hook(atomic_uint *result, atomic_uint *a2, uint64_t a3, uint64_t a4)
{
  int v5 = (int)result;
  if (previous_pthread_hook) {
    uint64_t result = (atomic_uint *)previous_pthread_hook(result, a2, a3, a4);
  }
  if (enable_hooks == 1)
  {
    if (debug_printing) {
      uint64_t result = (atomic_uint *)print_pthread_event();
    }
    switch(v5)
    {
      case 4:
        uint64_t result = (atomic_uint *)pthread_self();
        if (result == a2)
        {
          pthread_key_t v6 = thread_info_key;
          return (atomic_uint *)pthread_getspecific(v6);
        }
        break;
      case 3:
        uint64_t result = (atomic_uint *)pthread_getspecific(thread_info_key);
        if (result)
        {
          unint64_t v7 = result;
          if (debug_trace_threads)
          {
            vm_size_t v8 = __stderrp;
            pid_t v9 = getpid();
            fprintf(v8, "pid %d PTHREAD_INTROSPECTION_THREAD_TERMINATE event received for thread %p;  thread_info would normally be"
              " NULL but is %p  thread_id %llu\n",
              v9,
              a2,
              v7,
              *((void *)v7 + 3));
          }
          thread_terminating((uint64_t)v7);
          pthread_key_t v10 = thread_info_key;
          return (atomic_uint *)pthread_setspecific(v10, 0);
        }
        break;
      case 2:
        return add_thread_info_to_list();
    }
  }
  return result;
}

void thread_terminating(uint64_t a1)
{
  os_unfair_lock_lock_with_options();
  move_entry_to_completed_list((uint64_t)&thread_lists, (uint64_t *)a1);
  int v2 = decrement_entry_refcount((uint64_t)&thread_lists, (atomic_uint *)a1);
  if (debug_trace_threads)
  {
    if (v2)
    {
      strcpy(__str, "  removed from list");
      print_thread_summary(a1, "thread terminating ", __str);
    }
    else
    {
      unsigned int v3 = atomic_load((unsigned int *)(a1 + 20));
      snprintf(__str, 0x100uLL, "  NOT removed from list - refcount %d", v3);
      print_thread_summary(a1, "thread terminating ", __str);
      if (dword_C050 > thread_terminating_max_remaining)
      {
        thread_terminating_max_remaining = dword_C050;
        fprintf(__stderrp, "    %u threads completed but still referenced:\n", dword_C050);
        print_list(0, &qword_C040, (uint64_t)&__block_literal_global_59);
      }
    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&dword_C020);
}

unsigned int *gcd_queue_create_hook(unsigned int *result)
{
  int v1 = result;
  if (dispatch_introspection_hooks) {
    uint64_t result = (unsigned int *)dispatch_introspection_hooks(result);
  }
  if (enable_hooks == 1)
  {
    if (debug_printing) {
      print_gcd_queue_create_dispose();
    }
    int v2 = (char *)*((void *)v1 + 2);
    if (!v2 || (uint64_t result = (unsigned int *)strcmp(*((const char **)v1 + 2), "source"), result))
    {
      uint64_t v3 = *(void *)v1;
      unint64_t v4 = *((void *)v1 + 3);
      return add_queue_info_to_list(v3, v4, v2, 1);
    }
  }
  return result;
}

void gcd_queue_dispose_hook(uint64_t a1)
{
  if (off_C1A8) {
    off_C1A8(a1);
  }
  if (enable_hooks == 1)
  {
    if (debug_printing) {
      print_gcd_queue_create_dispose();
    }
    os_unfair_lock_lock_with_options();
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 0x40000000;
    pthread_key_t v6 = __gcd_queue_dispose_hook_block_invoke;
    unint64_t v7 = &__block_descriptor_tmp;
    uint64_t v8 = a1;
    int v2 = &off_C090;
    while (1)
    {
      int v2 = (int **)*v2;
      if (!v2) {
        break;
      }
      if (((unsigned int (*)(void *, int **))v6)(v5, v2))
      {
        move_entry_to_completed_list((uint64_t)&queue_lists, (uint64_t *)v2);
        int v3 = decrement_entry_refcount((uint64_t)&queue_lists, (atomic_uint *)v2);
        if (debug_trace_queues)
        {
          if (v3)
          {
            strcpy(__str, "  removed from list");
            print_queue_summary((uint64_t)v2, "queue disposed: ", __str);
          }
          else
          {
            unsigned int v4 = atomic_load((unsigned int *)v2 + 5);
            snprintf(__str, 0x100uLL, "  NOT removed from list - refcount %d", v4);
            print_queue_summary((uint64_t)v2, "queue disposed: ", __str);
            if (dword_C0B8 > gcd_queue_dispose_hook_max_remaining)
            {
              gcd_queue_dispose_hook_max_remaining = dword_C0B8;
              fprintf(__stderrp, "    %u queues completed but still referenced:\n", dword_C0B8);
              print_list(0, &qword_C0A8, (uint64_t)&__block_literal_global);
            }
          }
        }
        break;
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)&dword_C088);
  }
}

void gcd_queue_item_enqueue_hook()
{
  uint64_t v0 = __chkstk_darwin();
  uint64_t v2 = v1;
  int v3 = (const void *)v0;
  if (off_C1B0) {
    off_C1B0(v0, v1);
  }
  if (enable_hooks == 1)
  {
    if (is_interesting_event((uint64_t)v3, v2))
    {
      os_unfair_lock_lock_with_options();
      v31[0] = _NSConcreteStackBlock;
      v31[1] = 0x40000000;
      v32 = __gcd_queue_item_enqueue_hook_block_invoke;
      v33 = &__block_descriptor_tmp_39;
      uint64_t v34 = v2;
      unsigned int v4 = &off_C0F8;
      do
      {
        unsigned int v4 = (int **)*v4;
        BOOL v5 = v4 != 0;
      }
      while (v4 && !((unsigned int (*)(void *, int **))v32)(v31, v4));
      BOOL v6 = v4 == 0;
      os_unfair_lock_unlock((os_unfair_lock_t)&dword_C0F0);
    }
    else
    {
      BOOL v5 = 0;
      BOOL v6 = 0;
    }
    if (debug_printing) {
      print_gcd_queue_item_enqueue_dequeue("enqueued", v3, (uint64_t *)v2, v6, v5);
    }
    if (v6)
    {
      uint64_t v7 = os_unfair_lock_lock_with_options();
      uint64_t current_queue_ptr = dispatch_get_current_queue_ptr(v7);
      queue_info = (unsigned int *)*((void *)current_thread_info() + 13);
      if (!queue_info || *((void *)queue_info + 3) != current_queue_ptr) {
        queue_info = find_or_create_queue_info(current_queue_ptr, 0);
      }
      atomic_fetch_add((atomic_uint *volatile)queue_info + 5, 1u);
      uint64_t v10 = *(void *)(v2 + 16);
      uint64_t v11 = queue_info;
      if (v10 != current_queue_ptr) {
        uint64_t v11 = find_or_create_queue_info(v10, 0);
      }
      atomic_fetch_add((atomic_uint *volatile)v11 + 5, 1u);
      os_unfair_lock_unlock((os_unfair_lock_t)&dword_C088);
      memset(&v26[16], 0, 64);
      long long v29 = 0u;
      long long v27 = 0u;
      long long v28 = 0u;
      long long __src = 0u;
      *(_OWORD *)v26 = 0u;
      long long v12 = *(_OWORD *)(v2 + 16);
      *(_OWORD *)&v26[8] = *(_OWORD *)v2;
      *(_OWORD *)&v26[24] = v12;
      long long v13 = *(_OWORD *)(v2 + 48);
      *(_OWORD *)&v26[40] = *(_OWORD *)(v2 + 32);
      uint64_t v30 = 0;
      *(_OWORD *)&v26[56] = v13;
      if (*((unsigned char *)queue_info + 40) && (*((unsigned char *)v11 + 40) || *((unsigned char *)v11 + 41))
        || *((unsigned char *)queue_info + 41) && *((unsigned char *)v11 + 40))
      {
        v26[74] = 1;
      }
      memset(v37, 0, 496);
      *(_OWORD *)v36 = 0u;
      int v14 = backtrace(v36, 512);
      uint64_t v15 = v14 - 1;
      if ((unint64_t)v36[v15] >= vm_page_size) {
        LODWORD(v15) = v14;
      }
      if ((int)v15 <= 2) {
        LODWORD(v15) = 2;
      }
      int v16 = v15 - 2;
      uint64_t v24 = 0;
      enter_ptrSized_stack_in_backtrace_uniquing_table(backtrace_uniquing_table, &v24, v37, (v15 - 2));
      *(_DWORD *)&v26[76] = v16;
      *(void *)&long long v27 = v24;
      *((void *)&v27 + 1) = current_thread_info();
      *(void *)&long long v28 = queue_info;
      atomic_fetch_add((atomic_uint *volatile)(*((void *)&v27 + 1) + 20), 1u);
      *((void *)&v28 + 1) = v11;
      long long v29 = 0uLL;
      LODWORD(v30) = 0;
      v17 = current_thread_info();
      uint64_t v18 = *((void *)v17 + 14);
      if (v18)
      {
        unsigned int v19 = 0;
        uint64_t v20 = *((void *)v17 + 14);
        do
        {
          ++v19;
          uint64_t v20 = *(void *)(v20 + 128);
        }
        while (v20);
        int v21 = debug_maxlevels;
        if (debug_maxlevels) {
          BOOL v22 = v19 > gcd_queue_item_enqueue_hook_max_levels;
        }
        else {
          BOOL v22 = 0;
        }
        if (v22)
        {
          gcd_queue_item_enqueue_hook_max_levels = v19;
          print_logical_backtrace((const char *)&unk_66B2);
          int v21 = debug_maxlevels;
        }
        if (v19 < 0x33 || v21)
        {
          *(void *)&long long v29 = v18;
          atomic_fetch_add((atomic_uint *volatile)(v18 + 20), 1u);
        }
        else
        {
          int v23 = 0;
          *(void *)&long long v29 = 0;
          do
          {
            v23 += *(_DWORD *)(v18 + 136) + *(_DWORD *)(v18 + 140) + 1;
            uint64_t v18 = *(void *)(v18 + 128);
          }
          while (v18);
          HIDWORD(v29) = v23;
          if (debug_printing && (gcd_queue_item_enqueue_hook_printed & 1) == 0)
          {
            gcd_queue_item_enqueue_hook_printed = 1;
            fwrite("PLEASE FILE A BUG REPORT AGAINST libBacktraceRecording / X WITH THE FOLLOWING BACKTRACE OUTPUT\n", 0x5FuLL, 1uLL, __stderrp);
            snprintf(__str, 0x400uLL, "Cutting long chain of %u unique enqueuings (non-repeating, non-looping), %u total elided\n", v19, v23);
            print_logical_backtrace(__str);
          }
        }
      }
      atomic_fetch_add((atomic_uint *volatile)get_entry_from_free_list((uint64_t)&work_item_lists, &__src, 1) + 5, 1u);
      atomic_fetch_add((atomic_uint *volatile)v11 + 12, 1u);
      if (debug_printing)
      {
        if (dword_C108 > gcd_queue_item_enqueue_hook_max_enqueued)
        {
          gcd_queue_item_enqueue_hook_max_enqueued = dword_C108;
          locked_print_dispatch_info();
        }
      }
    }
  }
}

void gcd_queue_item_dequeue_hook(const void *a1, uint64_t *a2)
{
  if (off_C1B8) {
    off_C1B8(a1, a2);
  }
  if (enable_hooks == 1)
  {
    if (is_interesting_event((uint64_t)a1, (uint64_t)a2))
    {
      uint64_t v4 = *((void *)current_thread_info() + 14);
      if (v4)
      {
        uint64_t v5 = *(void *)(v4 + 32);
        uint64_t v6 = a2[1];
        BOOL v7 = v5 == v6;
        BOOL v8 = v5 != v6;
      }
      else
      {
        BOOL v7 = 0;
        BOOL v8 = 1;
      }
    }
    else
    {
      uint64_t v4 = 0;
      BOOL v7 = 0;
      BOOL v8 = 0;
    }
    if (debug_printing) {
      print_gcd_queue_item_enqueue_dequeue("dequeued", a1, a2, v8, v7);
    }
    if (v8)
    {
      v14[0] = _NSConcreteStackBlock;
      v14[1] = 0x40000000;
      uint64_t v15 = __gcd_queue_item_dequeue_hook_block_invoke;
      int v16 = &__block_descriptor_tmp_46;
      v17 = a2;
      os_unfair_lock_lock_with_options();
      pid_t v9 = &off_C0F8;
      while (1)
      {
        pid_t v9 = (int **)*v9;
        if (!v9) {
          break;
        }
        if (((uint64_t (*)(void *, int **))v15)(v14, v9))
        {
          move_entry_to_completed_list((uint64_t)&work_item_lists, (uint64_t *)v9);
          os_unfair_lock_unlock((os_unfair_lock_t)&dword_C0F0);
          if (v4)
          {
            if (debug_printing) {
              print_gcd_item_conflict();
            }
            gcd_queue_item_complete_hook(*(void *)(v4 + 32));
          }
          *((_DWORD *)v9 + 4) = 2;
          atomic_fetch_add(v9[15] + 12, 0xFFFFFFFF);
          atomic_fetch_add(v9[15] + 11, 1u);
          uint64_t current_queue_ptr = dispatch_get_current_queue_ptr(v10);
          queue_info = (unsigned int *)v9[15];
          if (*((void *)queue_info + 3) != current_queue_ptr) {
            queue_info = find_or_create_queue_info(current_queue_ptr, 1);
          }
          long long v13 = current_thread_info();
          *((void *)v13 + 13) = queue_info;
          *((void *)v13 + 14) = v9;
          collapse_enqueuing_recursion((uint64_t)v9);
          return;
        }
      }
      os_unfair_lock_unlock((os_unfair_lock_t)&dword_C0F0);
      if (showEnqueueDequeue) {
        fprintf(__stderrp, "LOGICAL ERROR!! dequeued continuation %p that was not enqueued\n", (const void *)a2[1]);
      }
    }
  }
}

void gcd_queue_item_complete_hook(uint64_t a1)
{
  if (off_C1C0) {
    off_C1C0(a1);
  }
  if (enable_hooks == 1)
  {
    uint64_t v1 = *((void *)current_thread_info() + 14);
    if (v1)
    {
      if ((unint64_t)(*(void *)(v1 + 24) - 17) <= 1)
      {
        if (debug_printing) {
          print_gcd_queue_item_complete();
        }
        atomic_fetch_add((atomic_uint *volatile)(*(void *)(v1 + 120) + 44), 0xFFFFFFFF);
        uint64_t v2 = current_thread_info();
        *((void *)v2 + 13) = 0;
        *((void *)v2 + 14) = 0;
        *(_DWORD *)(v1 + 16) = 3;
        int v3 = atomic_load((unsigned int *)(v1 + 20));
        if (v3 >= 2 && *(unsigned char *)(v1 + 89)) {
          collapse_enqueuing_recursion(v1);
        }
        os_unfair_lock_lock_with_options();
        decrement_work_item_refcount(v1);
        os_unfair_lock_unlock((os_unfair_lock_t)&dword_C0F0);
      }
    }
  }
}

unsigned int *add_queue_info_to_list(uint64_t a1, unint64_t a2, char *__s1, int a4)
{
  uint64_t v16 = 0;
  memset(v15, 0, sizeof(v15));
  uint64_t v12 = 0;
  long long v11 = 0u;
  uint64_t v13 = a1;
  long long v14 = a2;
  atomic_store(0, (unsigned int *)&v14 + 3);
  atomic_store(0, (unsigned int *)v15);
  if (*(unsigned __int16 *)dispatch_queue_offsets <= 4u)
  {
    if (is_root_dispatch_queue_prefix_length) {
      size_t v6 = 22;
    }
    else {
      size_t v6 = 0;
    }
    if ((is_root_dispatch_queue_prefix_length & 1) == 0)
    {
      is_root_dispatch_queue_prefix_length = 1;
      size_t v6 = 22;
    }
    if (!__s1)
    {
      WORD4(v14) = 0;
LABEL_19:
      BYTE4(v15[0]) = 0;
      goto LABEL_20;
    }
    BYTE9(v14) = strncmp(__s1, "com.apple.root.", v6) == 0;
    BYTE8(v14) = 0;
  }
  else
  {
    BYTE9(v14) = *(void *)(a1 + *(unsigned __int16 *)(dispatch_queue_offsets + 26)) == 0;
    BYTE8(v14) = 0;
    if (!__s1) {
      goto LABEL_19;
    }
  }
  __strlcpy_chk();
  if (add_queue_info_to_list_prefix_length) {
    size_t v7 = 22;
  }
  else {
    size_t v7 = 0;
  }
  if ((add_queue_info_to_list_prefix_length & 1) == 0)
  {
    add_queue_info_to_list_prefix_length = 1;
    size_t v7 = 22;
  }
  if (!strncmp((const char *)v15 + 4, "com.apple.libdispatch-", v7)) {
    BYTE8(v14) = 1;
  }
LABEL_20:
  entry_from_free_list = get_entry_from_free_list((uint64_t)&queue_lists, &v11, a4);
  pid_t v9 = entry_from_free_list;
  atomic_fetch_add((atomic_uint *volatile)entry_from_free_list + 5, 1u);
  if (debug_trace_queues) {
    print_queue_summary((uint64_t)entry_from_free_list, "queue added to list: ", (const char *)&unk_66B2);
  }
  return v9;
}

BOOL __gcd_queue_dispose_hook_block_invoke(uint64_t a1, uint64_t a2)
{
  return *(void *)(a2 + 24) == **(void **)(a1 + 32);
}

uint64_t move_entry_to_completed_list(uint64_t result, uint64_t *a2)
{
  uint64_t v2 = *a2;
  int v3 = (void *)a2[1];
  if (*a2)
  {
    *(void *)(v2 + 8) = v3;
    int v3 = (void *)a2[1];
  }
  else
  {
    *(void *)(result + 40) = v3;
  }
  void *v3 = v2;
  --*(_DWORD *)(result + 48);
  *((_DWORD *)a2 + 4) = 3;
  uint64_t v4 = *(void **)(result + 64);
  *a2 = 0;
  a2[1] = (uint64_t)v4;
  void *v4 = a2;
  *(void *)(result + 64) = a2;
  ++*(_DWORD *)(result + 72);
  return result;
}

uint64_t decrement_entry_refcount(uint64_t a1, atomic_uint *a2)
{
  if (atomic_fetch_add(a2 + 5, 0xFFFFFFFF) != 1 || a2[4] != 3) {
    return 0;
  }
  uint64_t v2 = *(void *)a2;
  int v3 = (void *)*((void *)a2 + 1);
  if (*(void *)a2)
  {
    *(void *)(v2 + 8) = v3;
    int v3 = (void *)*((void *)a2 + 1);
  }
  else
  {
    *(void *)(a1 + 64) = v3;
  }
  void *v3 = v2;
  uint64_t v6 = *(void *)(a1 + 80);
  uint64_t v5 = a1 + 80;
  --*(_DWORD *)(v5 - 8);
  a2[4] = 0;
  *(void *)a2 = v6;
  size_t v7 = (atomic_uint **)(v6 + 8);
  if (v6) {
    BOOL v8 = v7;
  }
  else {
    BOOL v8 = (atomic_uint **)(v5 + 8);
  }
  *BOOL v8 = a2;
  *(void *)uint64_t v5 = a2;
  *((void *)a2 + 1) = v5;
  ++*(_DWORD *)(v5 + 16);
  return 1;
}

void __gcd_queue_dispose_hook_block_invoke_2(id a1, generic_introspection_info_s *a2)
{
}

uint64_t is_interesting_event(uint64_t a1, uint64_t a2)
{
  if ((unint64_t)(*(void *)a2 - 17) > 1 || (*(unsigned char *)(a2 + 56) & 2) != 0) {
    return 0;
  }
  uint64_t result = 0;
  if ((*(unsigned char *)(a2 + 56) & 4) != 0 || *(void *)(a2 + 48)) {
    return result;
  }
  uint64_t v5 = libdispatchManagerQueue;
  if (!libdispatchManagerQueue)
  {
    label_ptr = (const char *)dispatch_queue_get_label_ptr(a1);
    if (!label_ptr) {
      label_ptr = (const char *)&unk_66B2;
    }
    uint64_t result = strcmp(label_ptr, "com.apple.libdispatch-manager");
    if (!result)
    {
      libdispatchManagerQueue = a1;
      return result;
    }
    BOOL v8 = (const char *)dispatch_queue_get_label_ptr(*(void *)(a2 + 16));
    if (!v8) {
      BOOL v8 = (const char *)&unk_66B2;
    }
    if (!strcmp(v8, "com.apple.libdispatch-manager"))
    {
      uint64_t v5 = *(void *)(a2 + 16);
      libdispatchManagerQueue = v5;
    }
    else
    {
      uint64_t v5 = libdispatchManagerQueue;
    }
  }
  if (v5 == a1
    || *(void *)(a2 + 16) == v5
    || *(void *)a2 == 18
    && _dispatch_queue_override_invoke_owning_ptr
    && *(void *)(a2 + 32) == _dispatch_queue_override_invoke_owning_ptr)
  {
    return 0;
  }
  uint64_t v6 = (const char *)dispatch_queue_get_label_ptr(a1);
  if (!v6) {
    uint64_t v6 = (const char *)&unk_66B2;
  }
  return strcmp(v6, "source") != 0;
}

BOOL __gcd_queue_item_enqueue_hook_block_invoke(uint64_t a1, uint64_t a2)
{
  return *(void *)(a2 + 32) == *(void *)(*(void *)(a1 + 32) + 8);
}

unsigned int *find_or_create_queue_info(uint64_t a1, int a2)
{
  if (a2) {
    os_unfair_lock_lock_with_options();
  }
  int v4 = *(unsigned __int16 *)(dispatch_queue_offsets + 12);
  if (v4 == 8)
  {
    unint64_t v5 = *(void *)(a1 + *(unsigned __int16 *)(dispatch_queue_offsets + 10));
  }
  else if (v4 == 4)
  {
    unint64_t v5 = *(unsigned int *)(a1 + *(unsigned __int16 *)(dispatch_queue_offsets + 10));
  }
  else
  {
    unint64_t v5 = 0;
  }
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 0x40000000;
  long long v11 = __find_or_create_queue_info_block_invoke;
  uint64_t v12 = &__block_descriptor_tmp_44;
  unint64_t v13 = v5;
  uint64_t v6 = (unsigned int *)&off_C090;
  while (1)
  {
    uint64_t v6 = *(unsigned int **)v6;
    if (!v6) {
      break;
    }
    if (((uint64_t (*)(void *, unsigned int *))v11)(v10, v6))
    {
      if (!a2) {
        return v6;
      }
      goto LABEL_12;
    }
  }
  uint64_t label_ptr = dispatch_queue_get_label_ptr(a1);
  if (label_ptr) {
    pid_t v9 = (char *)label_ptr;
  }
  else {
    pid_t v9 = (char *)&unk_66B2;
  }
  uint64_t v6 = add_queue_info_to_list(a1, v5, v9, 0);
  if (a2) {
LABEL_12:
  }
    os_unfair_lock_unlock((os_unfair_lock_t)&dword_C088);
  return v6;
}

BOOL __find_or_create_queue_info_block_invoke(uint64_t a1, uint64_t a2)
{
  return *(void *)(a2 + 32) == *(void *)(a1 + 32);
}

BOOL __gcd_queue_item_dequeue_hook_block_invoke(uint64_t a1, uint64_t a2)
{
  return *(void *)(a2 + 32) == *(void *)(*(void *)(a1 + 32) + 8);
}

void collapse_enqueuing_recursion(uint64_t a1)
{
  *(unsigned char *)(a1 + 89) = 0;
  uint64_t v1 = *(void *)(a1 + 128);
  if (v1)
  {
    int v3 = 0;
    for (int i = 1; ; ++i)
    {
      if (*(_DWORD *)(v1 + 16) != 3 && !*(unsigned char *)(v1 + 90))
      {
        *(unsigned char *)(a1 + 89) = 1;
        return;
      }
      v3 += *(_DWORD *)(v1 + 140) + *(_DWORD *)(v1 + 136) + 1;
      if (i == 1)
      {
        if (*(unsigned char *)(v1 + 90)) {
          break;
        }
      }
      if (*(void *)(a1 + 56) == *(void *)(v1 + 56) && *(void *)(a1 + 96) == *(void *)(v1 + 96)) {
        break;
      }
      uint64_t v1 = *(void *)(v1 + 128);
      if (!v1) {
        return;
      }
    }
    os_unfair_lock_lock_with_options();
    if (debug_recursion)
    {
      fputc(10, __stderrp);
      if (*(unsigned char *)(v1 + 90)) {
        unint64_t v5 = "INTERNAL ITEM";
      }
      else {
        unint64_t v5 = (const char *)&unk_66B2;
      }
      snprintf(__str, 0x80uLL, "RECURSION COLLAPSING -- WILL REPARENT %u LEVELS  %s\n", i, v5);
      print_logical_backtrace(__str);
    }
    if (i == 1 && !*(unsigned char *)(v1 + 90))
    {
      int v6 = *(_DWORD *)(v1 + 136) + 1;
      v3 -= v6;
      *(_DWORD *)(a1 + 136) += v6;
    }
    *(_DWORD *)(a1 + 140) += v3;
    uint64_t v7 = *(void *)(a1 + 128);
    uint64_t v8 = *(void *)(v1 + 128);
    *(void *)(a1 + 128) = v8;
    if (v8) {
      atomic_fetch_add((atomic_uint *volatile)(v8 + 20), 1u);
    }
    decrement_work_item_refcount(v7);
    if (debug_recursion)
    {
      *(unsigned char *)(a1 + 88) = 0;
      snprintf(__str, 0x80uLL, "RECURSION COLLAPSING -- DID REPARENT %u LEVELS\n", i);
      print_logical_backtrace(__str);
    }
    os_unfair_lock_unlock((os_unfair_lock_t)&dword_C0F0);
  }
}

void decrement_work_item_refcount(uint64_t a1)
{
  if (a1)
  {
    uint64_t v1 = a1;
    do
    {
      if (!decrement_entry_refcount((uint64_t)&work_item_lists, (atomic_uint *)v1)) {
        break;
      }
      remove_stack_from_backtrace_uniquing_table(backtrace_uniquing_table, *(void *)(v1 + 96));
      os_unfair_lock_lock_with_options();
      uint64_t v2 = *(atomic_uint **)(v1 + 104);
      int v3 = decrement_entry_refcount((uint64_t)&thread_lists, v2);
      if (debug_trace_threads) {
        BOOL v4 = v3 == 0;
      }
      else {
        BOOL v4 = 1;
      }
      if (!v4) {
        print_thread_summary((uint64_t)v2, "thread became unreferenced, moved to free list: ", (const char *)&unk_66B2);
      }
      os_unfair_lock_unlock((os_unfair_lock_t)&dword_C020);
      os_unfair_lock_lock_with_options();
      unint64_t v5 = *(atomic_uint **)(v1 + 112);
      if (v5)
      {
        int v6 = decrement_entry_refcount((uint64_t)&queue_lists, v5);
        if (debug_trace_queues)
        {
          if (v6) {
            print_queue_summary(*(void *)(v1 + 112), "queue became unreferenced, moved to free list: ", (const char *)&unk_66B2);
          }
        }
      }
      int v7 = decrement_entry_refcount((uint64_t)&queue_lists, *(atomic_uint **)(v1 + 120));
      if (debug_trace_queues)
      {
        if (v7) {
          print_queue_summary(*(void *)(v1 + 120), "queue became unreferenced, moved to free list: ", (const char *)&unk_66B2);
        }
      }
      uint64_t v8 = *(void *)(v1 + 128);
      *(void *)(v1 + 128) = 0;
      os_unfair_lock_unlock((os_unfair_lock_t)&dword_C088);
      uint64_t v1 = v8;
    }
    while (v8);
  }
}

void __thread_terminating_block_invoke(id a1, generic_introspection_info_s *a2)
{
}

char *resetDyldInsertLibraries(const char *a1)
{
  uint64_t result = getenv("DYLD_INSERT_LIBRARIES");
  if (result)
  {
    int v3 = result;
    strlen(result);
    BOOL v4 = (char *)&v17 - ((__chkstk_darwin() + 16) & 0xFFFFFFFFFFFFFFF0);
    bzero(v4, v5);
    int v6 = *(unsigned __int8 *)v3;
    if (!*v3) {
      return (char *)unsetenv("DYLD_INSERT_LIBRARIES");
    }
    int v7 = v4;
    do
    {
      size_t v8 = 0;
      for (int i = v6; i; int i = v3[++v8])
      {
        if (i == 58) {
          break;
        }
      }
      if (v8)
      {
        size_t v10 = v8;
        while (v3[v10] != 47)
        {
          if (!--v10) {
            goto LABEL_11;
          }
        }
        long long v11 = &v3[v10];
        int v6 = 47;
      }
      else
      {
LABEL_11:
        long long v11 = v3;
      }
      BOOL v12 = v6 == 47;
      BOOL v13 = v6 == 47;
      if (v12) {
        long long v14 = v11 + 1;
      }
      else {
        long long v14 = v11;
      }
      if (&v3[v8] != v14 && strncmp(v14, a1, v3 - v11 - v13 + v8))
      {
        uint64_t v15 = v4;
        if (v7 != v4)
        {
          *int v7 = 58;
          uint64_t v15 = v7 + 1;
        }
        int v7 = stpncpy(v15, v3, v8);
        int i = v3[v8];
      }
      if (i == 58) {
        uint64_t v16 = v3 + 1;
      }
      else {
        uint64_t v16 = v3;
      }
      int v3 = &v16[v8];
      int v6 = v16[v8];
    }
    while (v6);
    if (v7 > v4)
    {
      *int v7 = 0;
      return (char *)setenv("DYLD_INSERT_LIBRARIES", v4, 1);
    }
    else
    {
      return (char *)unsetenv("DYLD_INSERT_LIBRARIES");
    }
  }
  return result;
}

uint64_t print_thread_summary(uint64_t a1, const char *a2, const char *a3)
{
  __str[0] = 0;
  int v6 = atomic_load((unsigned int *)(a1 + 20));
  if (v6 >= 1)
  {
    unsigned int v7 = atomic_load((unsigned int *)(a1 + 20));
    snprintf(__str, 0x100uLL, " refcount %d", v7);
  }
  size_t v8 = __stderrp;
  pid_t v9 = getpid();
  size_t v10 = (const char *)&unk_66B2;
  if (a2) {
    long long v11 = a2;
  }
  else {
    long long v11 = (const char *)&unk_66B2;
  }
  if (a3) {
    size_t v10 = a3;
  }
  return fprintf(v8, "pid %d %sthread %p thread_id %llu;  thread_info %p  %s%s%s\n",
           v9,
           v11,
           *(const void **)(a1 + 32),
           *(void *)(a1 + 24),
           (const void *)a1,
           (const char *)(a1 + 40),
           __str,
           v10);
}

uint64_t print_queue_summary(uint64_t a1, const char *a2, const char *a3)
{
  __str[0] = 0;
  int v6 = atomic_load((unsigned int *)(a1 + 20));
  if (v6 >= 1)
  {
    unsigned int v7 = atomic_load((unsigned int *)(a1 + 20));
    snprintf(__str, 0x100uLL, " refcount %d", v7);
  }
  size_t v8 = (const char *)&unk_66B2;
  if (a2) {
    pid_t v9 = a2;
  }
  else {
    pid_t v9 = (const char *)&unk_66B2;
  }
  if (a3) {
    size_t v8 = a3;
  }
  return fprintf(__stderrp, "%squeue_info %p  queue %p serialnum %llu %s%s%s\n", v9, (const void *)a1, *(const void **)(a1 + 24), *(void *)(a1 + 32), (const char *)(a1 + 52), __str, v8);
}

uint64_t print_logical_backtrace(const char *a1)
{
  uint64_t result = active_work_item();
  if (!result) {
    return result;
  }
  uint64_t v3 = result;
  if ((unint64_t)(*(void *)(result + 24) - 17) > 1
    || (showAll & 1) == 0 && *(void *)(result + 40) == libdispatchManagerQueue)
  {
    return result;
  }
  if (*(unsigned char *)(result + 88)) {
    return result;
  }
  pthread_setspecific(allow_malloc_logging_key, 0);
  BOOL v4 = backtrace_contains_function();
  if (v4)
  {
    print_logical_backtrace_address_of_os_trace_function = (uint64_t)v4;
    pthread_key_t v5 = allow_malloc_logging_key;
    return pthread_setspecific(v5, (char *)&dword_0 + 1);
  }
  LODWORD(v6) = 0;
  unint64_t v7 = 0;
  *(unsigned char *)(v3 + 88) = 1;
  uint64_t v8 = v3;
  do
  {
    uint64_t v8 = *(void *)(v8 + 128);
    ++v7;
    size_t v6 = (v6 + 0x8000);
  }
  while (v8);
  atomic_fetch_add_explicit(print_logical_backtrace_logical_backtrace_count, 1u, memory_order_relaxed);
  atomic_fetch_add_explicit(&print_logical_backtrace_total_enqueuing_levels, v7, memory_order_relaxed);
  pid_t v9 = (char *)malloc_type_malloc(v6, 0xF06D5922uLL);
  unsigned int v10 = atomic_load((unsigned int *)print_logical_backtrace_logical_backtrace_count);
  uint64_t v11 = atomic_load((unint64_t *)&print_logical_backtrace_total_enqueuing_levels);
  float v12 = (float)v11;
  size_t v13 = v6 - 1;
  LODWORD(v11) = atomic_load((unsigned int *)print_logical_backtrace_logical_backtrace_count);
  unsigned int v14 = snprintf(v9, v13, "logical backtrace %d  depth %d  average depth %.1f\n", v10, v7, (float)(v12 / (float)(int)v11));
  if ((v14 & 0x80000000) != 0 || v13 <= v14)
  {
    fprintf(__stderrp, "BUFSIZ CHECK FAILED bufsiz %zu printed_count %d\n\n\n", v13, v14);
    uint64_t v15 = v9;
  }
  else
  {
    uint64_t v15 = &v9[v14];
    v13 -= v14;
  }
  if ((int)v7 - 1 >= print_logical_backtrace_max_levels)
  {
    print_logical_backtrace_max_levels = v7;
    unsigned int v16 = snprintf(v15, v13, "NEW MAX ENQUEUING LEVEL: %d\n", v7);
    if ((v16 & 0x80000000) != 0 || v13 <= v16)
    {
      fprintf(__stderrp, "BUFSIZ CHECK FAILED bufsiz %zu printed_count %d\n\n\n", v13, v16);
    }
    else
    {
      v15 += v16;
      v13 -= v16;
    }
  }
  v40[0] = 0;
  uint64_t v17 = pthread_self();
  pthread_getname_np(v17, v40, 0x40uLL);
  uint64_t v18 = (const char *)dispatch_queue_label();
  if (v18) {
    unsigned int v19 = v18;
  }
  else {
    unsigned int v19 = (const char *)&unk_66B2;
  }
  uint64_t v20 = *(void *)(v3 + 24);
  if (v20 <= 65)
  {
    if (v20 == 17)
    {
      int v21 = "block";
      goto LABEL_37;
    }
    if (v20 == 18)
    {
      int v21 = "function";
      goto LABEL_37;
    }
  }
  else
  {
    switch(v20)
    {
      case 66:
        int v21 = "source";
        goto LABEL_37;
      case 256:
        int v21 = "object";
        goto LABEL_37;
      case 257:
        int v21 = "queue";
        goto LABEL_37;
    }
  }
  int v21 = "unknown-type";
LABEL_37:
  pthread_t v22 = pthread_self();
  unsigned int v23 = snprintf(v15, v13, "%s  %s on pthread %p %s  queue %p %s\n", a1, v21, v22, v40, *(const void **)(v3 + 40), v19);
  if ((v23 & 0x80000000) == 0 && v13 > v23)
  {
    v15 += v23;
    v13 -= v23;
    unsigned int v23 = get_and_print_backtrace();
    if ((v23 & 0x80000000) == 0 && v13 > v23)
    {
      v15 += v23;
      v13 -= v23;
      int v24 = 1;
      while (1)
      {
        __str[0] = 0;
        snprintf(__str, 0x40uLL, "  (LEVEL %d)", v24);
        v25 = (const char *)&unk_66B2;
        if (v24 == 1) {
          v26 = (const char *)&unk_66B2;
        }
        else {
          v26 = "----\n";
        }
        uint64_t v27 = *(int *)(v3 + 16);
        if (v27 <= 3) {
          v25 = off_8490[v27];
        }
        long long v28 = *(const void **)(v3 + 56);
        memset(&v38, 0, sizeof(v38));
        int v29 = dladdr(v28, &v38);
        dli_sname = v38.dli_sname;
        if (!v29) {
          dli_sname = 0;
        }
        if (!dli_sname) {
          dli_sname = (const char *)&unk_66B2;
        }
        unsigned int v31 = atomic_load((unsigned int *)(v3 + 20));
        uint64_t v33 = *(void *)(v3 + 112);
        uint64_t v32 = *(void *)(v3 + 120);
        uint64_t v34 = *(const void **)(v32 + 24);
        v35 = (const char *)(v32 + 52);
        LODWORD(v32) = atomic_load((unsigned int *)(v32 + 20));
        v36 = *(const void **)(v33 + 24);
        v37 = (const char *)(v33 + 52);
        LODWORD(v33) = atomic_load((unsigned int *)(v33 + 20));
        unsigned int v23 = snprintf(v15, v13, "%sITEM_INFO %p %s block/function %p %s refcount %d  %s\n    TARGET QUEUE %p %s refcount %d\n      FROM QUEUE %p %s refcount %d\n", v26, (const void *)v3, v25, v28, dli_sname, v31, __str, v34, v35, v32, v36, v37, v33);
        if ((v23 & 0x80000000) != 0 || v13 <= v23) {
          break;
        }
        v15 += v23;
        v13 -= v23;
        if (*(_DWORD *)(v3 + 136))
        {
          unsigned int v23 = snprintf(v15, v13, "    repeated_enqueuings_count: %u\n", *(_DWORD *)(v3 + 136));
          if ((v23 & 0x80000000) != 0 || v13 <= v23) {
            break;
          }
          v15 += v23;
          v13 -= v23;
        }
        if (*(_DWORD *)(v3 + 140))
        {
          unsigned int v23 = snprintf(v15, v13, "    elided_enqueuings_count: %u\n", *(_DWORD *)(v3 + 140));
          if ((v23 & 0x80000000) != 0 || v13 <= v23) {
            break;
          }
          v15 += v23;
          v13 -= v23;
        }
        if (showAll == 1)
        {
          unsigned int v23 = print_queue_item(v15, v13, v3 + 24, (const char *)(*(void *)(v3 + 120) + 52));
          if ((v23 & 0x80000000) != 0 || v13 <= v23) {
            break;
          }
          v15 += v23;
          v13 -= v23;
        }
        unsigned int v23 = print_item_backtrace();
        if ((v23 & 0x80000000) != 0 || v13 <= v23) {
          break;
        }
        v15 += v23;
        v13 -= v23;
        uint64_t v3 = *(void *)(v3 + 128);
        ++v24;
        if (!v3) {
          goto LABEL_70;
        }
      }
    }
  }
  fprintf(__stderrp, "BUFSIZ CHECK FAILED bufsiz %zu printed_count %d\n\n\n", v13, v23);
LABEL_70:
  snprintf(v15, v13 + 1, "\n");
  fputs(v9, __stderrp);
  free(v9);
  return pthread_setspecific(allow_malloc_logging_key, (char *)&dword_0 + 1);
}

void *backtrace_contains_function()
{
  uint64_t v0 = __chkstk_darwin();
  uint64_t v2 = v1;
  uint64_t v3 = (const char *)v0;
  long long v45 = 0u;
  long long v44 = 0u;
  long long v43 = 0u;
  long long v42 = 0u;
  long long v41 = 0u;
  long long v40 = 0u;
  long long v39 = 0u;
  long long v38 = 0u;
  long long v37 = 0u;
  long long v36 = 0u;
  long long v35 = 0u;
  long long v34 = 0u;
  long long v33 = 0u;
  long long v32 = 0u;
  long long v31 = 0u;
  long long v30 = 0u;
  long long v29 = 0u;
  long long v28 = 0u;
  long long v27 = 0u;
  long long v26 = 0u;
  long long v25 = 0u;
  long long v24 = 0u;
  long long v23 = 0u;
  long long v22 = 0u;
  long long v21 = 0u;
  long long v20 = 0u;
  long long v19 = 0u;
  long long v18 = 0u;
  long long v17 = 0u;
  long long v16 = 0u;
  long long v15 = 0u;
  *(_OWORD *)unsigned int v14 = 0u;
  int v4 = backtrace(v14, 512);
  int v5 = v4;
  if (v2)
  {
    if (v4 >= 1)
    {
      uint64_t v6 = v4;
      for (int i = v14; *i != v2; ++i)
      {
        if (!--v6) {
          return 0;
        }
      }
      return v2;
    }
    return 0;
  }
  snprintf(__str, 0x400uLL, " %s + ", v3);
  uint64_t v8 = backtrace_symbols(v14, v5);
  if (v5 < 1) {
    return 0;
  }
  pid_t v9 = v8;
  uint64_t v10 = v5;
  uint64_t v11 = v14;
  while (!strstr(*v9, __str))
  {
    ++v11;
    ++v9;
    if (!--v10) {
      return 0;
    }
  }
  return *v11;
}

uint64_t get_and_print_backtrace()
{
  uint64_t v0 = __chkstk_darwin();
  char v2 = v1;
  int v4 = v3;
  size_t v6 = v5;
  unint64_t v7 = (char *)v0;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  *(_OWORD *)uint64_t v10 = 0u;
  long long v11 = 0u;
  int v8 = backtrace(v10, 512);
  if (v8 <= v4) {
    return snprintf(v7, v6, "NO BACKTRACE (%d frames after skipping %d)\n", v8 - v4, v4);
  }
  else {
    return print_backtrace(v7, v6, &v10[v4], v8 - v4, v2);
  }
}

uint64_t print_queue_item(char *__str, size_t __size, uint64_t a3, const char *a4)
{
  uint64_t v8 = *(void *)a3;
  if (*(uint64_t *)a3 <= 65)
  {
    if (v8 == 17)
    {
      long long v30 = *(const void **)(a3 + 8);
      long long v31 = *(const void **)(a3 + 16);
      long long v32 = *(const void **)(a3 + 24);
      memset(&v64, 0, sizeof(v64));
      int v33 = dladdr(v32, &v64);
      dli_sname = v64.dli_sname;
      if (!v33) {
        dli_sname = 0;
      }
      long long v35 = *(const void **)(a3 + 32);
      if (dli_sname) {
        long long v36 = dli_sname;
      }
      else {
        long long v36 = (const char *)&unk_66B2;
      }
      memset(&v64, 0, sizeof(v64));
      int v37 = dladdr(v35, &v64);
      long long v38 = v64.dli_sname;
      if (!v37) {
        long long v38 = 0;
      }
      if (!v38) {
        long long v38 = (const char *)&unk_66B2;
      }
      uint64_t v39 = snprintf(__str, __size, "    BLOCK continuation %p\n    target_queue %p %s\n    block %p %s\n    block_invoke %p %s\n", v30, v31, a4, v32, v36, v35, v38);
      uint64_t v10 = v39;
      if ((v39 & 0x80000000) != 0 || __size <= v39)
      {
        long long v44 = __stderrp;
LABEL_56:
        fprintf(v44, "BUFSIZ CHECK FAILED bufsiz %zu printed_count %d\n\n\n");
        return v10;
      }
      long long v40 = &__str[v39];
      size_t v41 = __size - v39;
      if (*(void *)(a3 + 40))
      {
        unsigned int v42 = snprintf(v40, v41, "    group %p\n", *(const void **)(a3 + 40));
        uint64_t v10 = v42 + v10;
        if ((v42 & 0x80000000) != 0) {
          goto LABEL_92;
        }
      }
      else
      {
        unsigned int v42 = 0;
      }
      if (v41 > v42)
      {
        v54 = &v40[v42];
        size_t v55 = v41 - v42;
        if (*(void *)(a3 + 48))
        {
          unsigned int v56 = snprintf(v54, v55, "    waiter %p\n", *(const void **)(a3 + 48));
          uint64_t v10 = v56 + v10;
          if ((v56 & 0x80000000) != 0) {
            goto LABEL_92;
          }
        }
        else
        {
          unsigned int v56 = 0;
        }
        if (v55 > v56)
        {
          size_t v57 = v55 - v56;
          if ((*(unsigned char *)(a3 + 56) & 7) != 0)
          {
            v58 = &v54[v56];
            v59 = "BARRIER   ";
            if ((*(unsigned char *)(a3 + 56) & 1) == 0) {
              v59 = (const char *)&unk_66B2;
            }
            v60 = "SYNC   ";
            if ((*(unsigned char *)(a3 + 56) & 2) == 0) {
              v60 = (const char *)&unk_66B2;
            }
            if ((*(unsigned char *)(a3 + 56) & 4) != 0) {
              v61 = "APPLY   ";
            }
            else {
              v61 = (const char *)&unk_66B2;
            }
LABEL_88:
            unsigned int v62 = snprintf(v58, v57, "    %s%s%s\n", v59, v60, v61);
            uint64_t v10 = v62 + v10;
            if ((v62 & 0x80000000) != 0) {
              goto LABEL_92;
            }
            goto LABEL_91;
          }
LABEL_90:
          unsigned int v62 = 0;
LABEL_91:
          if (v57 > v62) {
            return v10;
          }
        }
      }
    }
    else
    {
      if (v8 != 18) {
        goto LABEL_41;
      }
      long long v12 = *(const void **)(a3 + 8);
      long long v13 = *(const void **)(a3 + 16);
      long long v15 = *(const void **)(a3 + 24);
      long long v14 = *(const void **)(a3 + 32);
      memset(&v64, 0, sizeof(v64));
      int v16 = dladdr(v14, &v64);
      long long v17 = v64.dli_sname;
      if (!v16) {
        long long v17 = 0;
      }
      if (!v17) {
        long long v17 = (const char *)&unk_66B2;
      }
      uint64_t v18 = snprintf(__str, __size, "    FUNCTION continuation %p\n    target_queue %p %s\n    context %p\n    function %p %s\n", v12, v13, a4, v15, v14, v17);
      uint64_t v10 = v18;
      if ((v18 & 0x80000000) != 0 || __size <= v18)
      {
LABEL_55:
        long long v44 = __stderrp;
        goto LABEL_56;
      }
      long long v19 = &__str[v18];
      size_t v20 = __size - v18;
      if (*(void *)(a3 + 40))
      {
        unsigned int v21 = snprintf(v19, v20, "    group %p\n", *(const void **)(a3 + 40));
        uint64_t v10 = v21 + v10;
        if ((v21 & 0x80000000) != 0) {
          goto LABEL_92;
        }
      }
      else
      {
        unsigned int v21 = 0;
      }
      if (v20 > v21)
      {
        v51 = &v19[v21];
        size_t v52 = v20 - v21;
        if (*(void *)(a3 + 48))
        {
          unsigned int v53 = snprintf(v51, v52, "    waiter %p\n", *(const void **)(a3 + 48));
          uint64_t v10 = v53 + v10;
          if ((v53 & 0x80000000) != 0) {
            goto LABEL_92;
          }
        }
        else
        {
          unsigned int v53 = 0;
        }
        if (v52 > v53)
        {
          size_t v57 = v52 - v53;
          if ((*(unsigned char *)(a3 + 56) & 7) != 0)
          {
            v58 = &v51[v53];
            v59 = "BARRIER   ";
            if ((*(unsigned char *)(a3 + 56) & 1) == 0) {
              v59 = (const char *)&unk_66B2;
            }
            v60 = "SYNC   ";
            if ((*(unsigned char *)(a3 + 56) & 2) == 0) {
              v60 = (const char *)&unk_66B2;
            }
            if ((*(unsigned char *)(a3 + 56) & 4) != 0) {
              v61 = "APPLY   ";
            }
            else {
              v61 = (const char *)&unk_66B2;
            }
            goto LABEL_88;
          }
          goto LABEL_90;
        }
      }
    }
LABEL_92:
    fprintf(__stderrp, "BUFSIZ CHECK FAILED bufsiz %zu printed_count %d\n\n\n");
    return v10;
  }
  switch(v8)
  {
    case 66:
      long long v22 = *(const void **)(a3 + 8);
      uint64_t v23 = *(void *)(a3 + 24);
      v63 = *(const void **)(a3 + 16);
      if ((unint64_t)(v23 + 22) > 0x28) {
        long long v24 = "unknown type";
      }
      else {
        long long v24 = off_8328[v23 + 22];
      }
      uint64_t v46 = *(void *)(a3 + 32);
      long long v45 = *(const void **)(a3 + 40);
      v47 = *(const void **)(a3 + 48);
      memset(&v64, 0, sizeof(v64));
      int v48 = dladdr(v47, &v64);
      v49 = v64.dli_sname;
      if (!v48) {
        v49 = 0;
      }
      if (!v49) {
        v49 = (const char *)&unk_66B2;
      }
      uint64_t v50 = snprintf(__str, __size, "    SOURCE %p\n    target_queue %p %s\n    type (kevent filter) %ld  %s\n    handle %lu\n    context %p\n    handler %p %s\n    suspend_count %u\n", v22, v63, a4, v23, v24, v46, v45, v47, v49, *(_DWORD *)(a3 + 56));
      uint64_t v10 = v50;
      if ((v50 & 0x80000000) == 0 && __size > v50)
      {
        if ((*(unsigned char *)(a3 + 60) & 0xF) != 0)
        {
          int v11 = snprintf(&__str[v50], __size - v50, "    %s%s%s%s\n");
          return (v11 + v10);
        }
        return v10;
      }
      goto LABEL_55;
    case 256:
      long long v25 = *(const void **)(a3 + 8);
      long long v26 = *(const void **)(a3 + 16);
      long long v27 = *(const void **)(a3 + 24);
      memset(&v64, 0, sizeof(v64));
      int v28 = dladdr(v27, &v64);
      long long v29 = v64.dli_sname;
      if (!v28) {
        long long v29 = 0;
      }
      if (!v29) {
        long long v29 = (const char *)&unk_66B2;
      }
      return snprintf(__str, __size, "    OBJECT %p\n    target_queue %p %s\n    type %p %s\n    kind %s\n", v25, v26, a4, v27, v29, *(const char **)(a3 + 32));
    case 257:
      uint64_t v9 = snprintf(__str, __size, "    QUEUE %p %s\n    target_queue %p %s\n    serialnum %lu\n    width %u\n    suspend_count %u\n", *(const void **)(a3 + 8), (const char *)&unk_66B2, *(const void **)(a3 + 16), a4, *(void *)(a3 + 32), *(_DWORD *)(a3 + 40), *(_DWORD *)(a3 + 44));
      uint64_t v10 = v9;
      if ((v9 & 0x80000000) == 0 && __size > v9)
      {
        if ((*(unsigned char *)(a3 + 48) & 0x1F) != 0)
        {
          int v11 = snprintf(&__str[v9], __size - v9, "    %s%s%s%s%s\n");
          return (v11 + v10);
        }
        return v10;
      }
      goto LABEL_55;
  }
LABEL_41:

  return snprintf(__str, __size, "    unknown dispatch introspection item!!!\n");
}

uint64_t print_item_backtrace()
{
  uint64_t v0 = __chkstk_darwin();
  size_t v3 = v2;
  int v4 = (char *)v0;
  memset(v9, 0, 512);
  unsigned int v5 = *(_DWORD *)(v1 + 92);
  if (v5 >= 0x200) {
    uint64_t v6 = 512;
  }
  else {
    uint64_t v6 = v5;
  }
  int v7 = ptrSized_stack_frames_for_uniqued_stack(backtrace_uniquing_table, *(void *)(v1 + 96), v9, v6);
  return print_backtrace(v4, v3, (void **)v9, v7, 1);
}

uint64_t print_queue_item_and_current_backtrace(char *__str, size_t __size, uint64_t a3, const char *a4)
{
  if (!a4) {
    a4 = (const char *)dispatch_queue_label();
  }
  uint64_t v7 = print_queue_item(__str, __size, a3, a4);
  uint64_t v8 = v7;
  if ((v7 & 0x80000000) == 0 && __size > v7) {
    return get_and_print_backtrace() + v7;
  }
  fprintf(__stderrp, "BUFSIZ CHECK FAILED bufsiz %zu printed_count %d\n\n\n", __size, v7);
  return v8;
}

uint64_t print_gcd_queue_create_dispose()
{
  uint64_t result = __chkstk_darwin();
  if (showLogicalBacktraces == 1)
  {
    size_t v2 = (const void **)v1;
    size_t v3 = (const char *)result;
    if (*(void *)(v1 + 16)) {
      int v4 = *(const char **)(v1 + 16);
    }
    else {
      int v4 = (const char *)&unk_66B2;
    }
    if (showAll)
    {
      pthread_setspecific(allow_malloc_logging_key, 0);
      unsigned int v5 = *v2;
      pthread_t v6 = pthread_self();
      unsigned int v7 = snprintf(__str, 0x3FFFuLL, "%s queue %p %s  (on pthread %p)\n", v3, v5, v4, v6);
      if (v7 >= 0x3FFF)
      {
        unint64_t v9 = 0x3FFFLL;
        fprintf(__stderrp, "BUFSIZ CHECK FAILED bufsiz %zu printed_count %d\n\n\n", 0x3FFFuLL, v7);
        uint64_t v8 = __str;
      }
      else
      {
        uint64_t v8 = &__str[v7];
        unint64_t v9 = 0x3FFFLL - v7;
        unsigned int v10 = get_and_print_backtrace();
        if ((v10 & 0x80000000) != 0 || v9 <= v10)
        {
          fprintf(__stderrp, "BUFSIZ CHECK FAILED bufsiz %zu printed_count %d\n\n\n", v9, v10);
        }
        else
        {
          v8 += v10;
          v9 -= v10;
        }
      }
      snprintf(v8, v9 + 1, "\n");
      fputs(__str, __stderrp);
      return pthread_setspecific(allow_malloc_logging_key, (char *)&dword_0 + 1);
    }
    else
    {
      uint64_t result = active_work_item();
      if (result)
      {
        snprintf(__str, 0x4000uLL, "%s queue %p %s", v3, *v2, v4);
        return print_logical_backtrace(__str);
      }
    }
  }
  return result;
}

const char *print_gcd_queue_item_enqueue_dequeue(const char *result, const void *a2, uint64_t *a3, int a4, int a5)
{
  unint64_t v9 = result;
  if ((showAll & 1) == 0 && (!showEnqueueDequeue || a4 == 0)) {
    return result;
  }
  pthread_setspecific(allow_malloc_logging_key, 0);
  int v11 = (char *)malloc_type_malloc(0x20000uLL, 0x2732A774uLL);
  long long v12 = "IGNORING ";
  if (a5) {
    long long v12 = "IGNORING BECAUSE ALREADY HAPPENED ";
  }
  if (a4) {
    long long v13 = (const char *)&unk_66B2;
  }
  else {
    long long v13 = v12;
  }
  uint64_t v14 = *a3;
  if (*a3 <= 65)
  {
    if (v14 == 17)
    {
      long long v15 = "block";
      goto LABEL_25;
    }
    if (v14 == 18)
    {
      long long v15 = "function";
      goto LABEL_25;
    }
LABEL_24:
    long long v15 = "unknown-type";
    goto LABEL_25;
  }
  if (v14 == 66)
  {
    long long v15 = "source";
    goto LABEL_25;
  }
  if (v14 == 256)
  {
    long long v15 = "object";
    goto LABEL_25;
  }
  if (v14 != 257) {
    goto LABEL_24;
  }
  long long v15 = "queue";
LABEL_25:
  int v16 = (const char *)dispatch_queue_label();
  pthread_t v17 = pthread_self();
  unsigned int v18 = snprintf(v11, 0x1FFFFuLL, "%s%s %s %p on queue %p %s  (on pthread %p)\n", v13, v9, v15, a3, a2, v16, v17);
  if (v18 >= 0x1FFFF)
  {
    size_t v20 = 0x1FFFFLL;
    fprintf(__stderrp, "BUFSIZ CHECK FAILED bufsiz %zu printed_count %d\n\n\n", 0x1FFFFuLL, v18);
    long long v19 = v11;
  }
  else
  {
    long long v19 = &v11[v18];
    size_t v20 = 0x1FFFFLL - v18;
    uint64_t active = active_work_item();
    if (active)
    {
      uint64_t v22 = active;
      if (*(void *)(active + 32) != a3[1]
        && ((showAll & 1) != 0 || *(void *)(active + 40) != libdispatchManagerQueue))
      {
        unsigned int v23 = snprintf(v19, v20, "EVENT OCCURRED WHILE AN ASYNC OPERATION IS EXECUTING;  DETAILS OF THAT OPERATION:\n");
        if ((v23 & 0x80000000) != 0
          || v20 <= v23
          || (v19 += v23,
              v20 -= v23,
              unsigned int v23 = print_queue_item(v19, v20, v22 + 24, (const char *)(*(void *)(v22 + 120) + 52)),
              (v23 & 0x80000000) != 0)
          || v20 <= v23
          || (v19 += v23, v20 -= v23, unsigned int v23 = snprintf(v19, v20, "DETAILS FOR NEW EVENT:\n"), (v23 & 0x80000000) != 0)
          || v20 <= v23)
        {
          fprintf(__stderrp, "BUFSIZ CHECK FAILED bufsiz %zu printed_count %d\n\n\n", v20, v23);
        }
        else
        {
          v19 += v23;
          v20 -= v23;
        }
      }
    }
    unsigned int v24 = print_queue_item_and_current_backtrace(v19, v20, (uint64_t)a3, 0);
    if ((v24 & 0x80000000) != 0 || v20 <= v24)
    {
      fprintf(__stderrp, "BUFSIZ CHECK FAILED bufsiz %zu printed_count %d\n\n\n", v20, v24);
    }
    else
    {
      v19 += v24;
      v20 -= v24;
    }
  }
  snprintf(v19, v20 + 1, "\n");
  fputs(v11, __stderrp);
  free(v11);
  pthread_key_t v25 = allow_malloc_logging_key;

  return (const char *)pthread_setspecific(v25, (char *)&dword_0 + 1);
}

uint64_t print_gcd_item_conflict()
{
  uint64_t v0 = __chkstk_darwin();
  size_t v2 = v1;
  size_t v3 = (void *)v0;
  v11[0] = 0;
  int v4 = pthread_self();
  pthread_getname_np(v4, v11, 0x40uLL);
  pthread_t v5 = pthread_self();
  unsigned int v6 = snprintf(__str, 0x7FFFuLL, "LOGICAL ERROR! new work item %p conflicts with currently-running %p on pthread %p %s\n", v3, v2, v5, v11);
  if (v6 >= 0x7FFF)
  {
    size_t v8 = 0x7FFFLL;
    fprintf(__stderrp, "BUFSIZ CHECK FAILED bufsiz %zu printed_count %d\n\n\n", 0x7FFFuLL, v6);
    unsigned int v7 = __str;
  }
  else
  {
    unsigned int v7 = &__str[v6];
    size_t v8 = 0x7FFFLL - v6;
    unsigned int v9 = snprintf(v7, v8, "NEW WORK ITEM %p:\n", v3);
    if ((v9 & 0x80000000) != 0) {
      goto LABEL_16;
    }
    if (v8 <= v9) {
      goto LABEL_16;
    }
    v7 += v9;
    v8 -= v9;
    unsigned int v9 = print_queue_item(v7, v8, (uint64_t)(v3 + 3), (const char *)(v3[15] + 52));
    if ((v9 & 0x80000000) != 0) {
      goto LABEL_16;
    }
    if (v8 <= v9) {
      goto LABEL_16;
    }
    v7 += v9;
    v8 -= v9;
    unsigned int v9 = print_item_backtrace();
    if ((v9 & 0x80000000) != 0) {
      goto LABEL_16;
    }
    if (v8 <= v9) {
      goto LABEL_16;
    }
    v7 += v9;
    v8 -= v9;
    unsigned int v9 = snprintf(v7, v8, "PREVIOUS (CURRENTLY RUNNING) ITEM %p:\n", v2);
    if ((v9 & 0x80000000) != 0
      || v8 <= v9
      || (v7 += v9,
          v8 -= v9,
          unsigned int v9 = print_queue_item(v7, v8, (uint64_t)(v2 + 3), (const char *)(v2[15] + 52)),
          (v9 & 0x80000000) != 0)
      || v8 <= v9
      || (v7 += v9, v8 -= v9, unsigned int v9 = print_item_backtrace(), (v9 & 0x80000000) != 0)
      || v8 <= v9)
    {
LABEL_16:
      fprintf(__stderrp, "BUFSIZ CHECK FAILED bufsiz %zu printed_count %d\n\n\n", v8, v9);
    }
    else
    {
      v7 += v9;
      v8 -= v9;
    }
  }
  snprintf(v7, v8 + 1, "\n");
  return fputs(__str, __stderrp);
}

uint64_t print_gcd_queue_item_complete()
{
  uint64_t v0 = __chkstk_darwin();
  uint64_t v2 = v1;
  size_t v3 = (const void *)v0;
  pthread_setspecific(allow_malloc_logging_key, 0);
  if (showLogicalBacktraces == 1)
  {
    int v4 = *(const void **)(v2 + 32);
    if (v4 != v3)
    {
      uint64_t v5 = *(int *)(v2 + 16);
      if (v5 > 3) {
        unsigned int v6 = (const char *)&unk_66B2;
      }
      else {
        unsigned int v6 = off_8490[v5];
      }
      long long v13 = *(const void **)(v2 + 48);
      uint64_t v14 = *(const void **)(v2 + 56);
      pthread_t v15 = pthread_self();
      unsigned int v16 = snprintf(__str, 0x3FFFuLL, "LOGICAL ERROR!! irrelevant(?) continuation %p complete;  item_info %p  state %s, continuation %p, context "
              "%p function %p  NO MATCH (on pthread %p)\n",
              v3,
              (const void *)v2,
              v6,
              v4,
              v13,
              v14,
              v15);
      int v9 = v16;
      if (v16 >= 0x3FFF)
      {
        size_t v11 = 0x3FFFLL;
        fprintf(__stderrp, "BUFSIZ CHECK FAILED bufsiz %zu printed_count %d\n\n\n", 0x3FFFuLL, v16);
        unsigned int v10 = __str;
      }
      else
      {
        unsigned int v10 = &__str[v16];
        size_t v11 = 0x3FFFLL - v16;
        unsigned int v17 = print_queue_item_and_current_backtrace(v10, v11, v2 + 24, (const char *)(*(void *)(v2 + 120) + 52));
        int v9 = v17;
        if ((v17 & 0x80000000) != 0 || v11 <= v17)
        {
          fprintf(__stderrp, "BUFSIZ CHECK FAILED bufsiz %zu printed_count %d\n\n\n", v11, v17);
        }
        else
        {
          v10 += v17;
          v11 -= v17;
        }
      }
      if (*(_DWORD *)(v2 + 16) != 2) {
        goto LABEL_22;
      }
      unsigned int v12 = snprintf(v10, v11, "    marking item_info %p as complete\n", (const void *)v2);
      goto LABEL_18;
    }
  }
  if (!showEnqueueDequeue) {
    return pthread_setspecific(allow_malloc_logging_key, (char *)&dword_0 + 1);
  }
  pthread_t v7 = pthread_self();
  unsigned int v8 = snprintf(__str, 0x3FFFuLL, "queue item %p complete;  completed_continuation %p  MATCHED, SO CLEARING  (on pthread %p)\n",
         (const void *)v2,
         v3,
         v7);
  int v9 = v8;
  if (v8 < 0x3FFF)
  {
    unsigned int v10 = &__str[v8];
    size_t v11 = 0x3FFFLL - v8;
    unsigned int v12 = get_and_print_backtrace();
LABEL_18:
    int v9 = v12;
    if ((v12 & 0x80000000) != 0 || v11 <= v12)
    {
      fprintf(__stderrp, "BUFSIZ CHECK FAILED bufsiz %zu printed_count %d\n\n\n", v11, v12);
    }
    else
    {
      v10 += v12;
      v11 -= v12;
    }
    goto LABEL_22;
  }
  size_t v11 = 0x3FFFLL;
  fprintf(__stderrp, "BUFSIZ CHECK FAILED bufsiz %zu printed_count %d\n\n\n", 0x3FFFuLL, v8);
  unsigned int v10 = __str;
LABEL_22:
  if (v9 >= 1)
  {
    snprintf(v10, v11 + 1, "\n");
    fputs(__str, __stderrp);
  }
  return pthread_setspecific(allow_malloc_logging_key, (char *)&dword_0 + 1);
}

uint64_t print_pthread_event()
{
  uint64_t result = __chkstk_darwin();
  if (showLogicalBacktraces == 1)
  {
    uint64_t v4 = v3;
    uint64_t v5 = v2;
    unsigned int v6 = v1;
    int v7 = result;
    if (showAll)
    {
      pthread_setspecific(allow_malloc_logging_key, 0);
      unsigned int v8 = v7 - 1;
      if (v8 > 3) {
        int v9 = "pthread unknown event";
      }
      else {
        int v9 = off_8470[v8];
      }
      pthread_t v11 = pthread_self();
      unsigned int v12 = snprintf(__str, 0x3FFFuLL, "%s: pthread %p, stack %p-%p[%zx]  (on pthread %p)\n", v9, v6, v5, &v5[v4], v4, v11);
      if (v12 >= 0x3FFF)
      {
        unint64_t v14 = 0x3FFFLL;
        fprintf(__stderrp, "BUFSIZ CHECK FAILED bufsiz %zu printed_count %d\n\n\n", 0x3FFFuLL, v12);
        long long v13 = __str;
      }
      else
      {
        long long v13 = &__str[v12];
        unint64_t v14 = 0x3FFFLL - v12;
        unsigned int v15 = get_and_print_backtrace();
        if ((v15 & 0x80000000) != 0 || v14 <= v15)
        {
          fprintf(__stderrp, "BUFSIZ CHECK FAILED bufsiz %zu printed_count %d\n\n\n", v14, v15);
        }
        else
        {
          v13 += v15;
          v14 -= v15;
        }
      }
      snprintf(v13, v14 + 1, "\n");
      fputs(__str, __stderrp);
      return pthread_setspecific(allow_malloc_logging_key, (char *)&dword_0 + 1);
    }
    else
    {
      uint64_t result = (uint64_t)pthread_self();
      if ((const void *)result != v6)
      {
        uint64_t result = active_work_item();
        if (result)
        {
          if ((v7 - 1) > 3) {
            unsigned int v10 = "pthread unknown event";
          }
          else {
            unsigned int v10 = off_8470[v7 - 1];
          }
          snprintf(__str, 0x4000uLL, "%s: pthread %p, stack %p-%p[%zx]", v10, v6, v5, &v5[v4], v4);
          return print_logical_backtrace(__str);
        }
      }
    }
  }
  return result;
}

uint64_t print_list(const char *a1, void **a2, uint64_t a3)
{
  if (a1) {
    fprintf(__stderrp, "%s:\n", a1);
  }
  uint64_t v5 = *a2;
  if (v5)
  {
    int v6 = 0;
    do
    {
      int v7 = v6 + 1;
      fprintf(__stderrp, "%4u  ", v6);
      (*(void (**)(uint64_t, void *))(a3 + 16))(a3, v5);
      uint64_t v5 = (void *)*v5;
      int v6 = v7;
    }
    while (v5);
  }
  unsigned int v8 = __stderrp;

  return fputc(10, v8);
}

void locked_print_dispatch_info()
{
  if (exerciseAPI == 1 && os_unfair_lock_trylock((os_unfair_lock_t)&dword_C020))
  {
    if (os_unfair_lock_trylock((os_unfair_lock_t)&dword_C088))
    {
      if (os_unfair_lock_trylock((os_unfair_lock_t)&dword_C0F0))
      {
        print_dispatch_info();
        os_unfair_lock_unlock((os_unfair_lock_t)&dword_C0F0);
      }
      os_unfair_lock_unlock((os_unfair_lock_t)&dword_C088);
    }
    os_unfair_lock_unlock((os_unfair_lock_t)&dword_C020);
  }
}

const char *initialize_debug_printing()
{
  uint64_t result = getenv("BacktraceRecordingOptions");
  if (result)
  {
    uint64_t v1 = result;
    if (strcasestr(result, "api")) {
      exerciseAPI = 1;
    }
    if (strcasestr(v1, "logical")) {
      showLogicalBacktraces = 1;
    }
    if (strcasestr(v1, "all")) {
      showAll = 1;
    }
    if (strcasestr(v1, "nocompress")) {
      nocompress = 1;
    }
    if (strcasestr(v1, "enqueue")) {
      showEnqueueDequeue = 1;
    }
    if (strcasestr(v1, "threads")) {
      debug_trace_threads = 1;
    }
    if (strcasestr(v1, "queues")) {
      debug_trace_queues = 1;
    }
    if (strcasestr(v1, "recursion")) {
      debug_recursion = 1;
    }
    if (strcasestr(v1, "maxlevels")) {
      debug_maxlevels = 1;
    }
    uint64_t result = strcasestr(v1, "none");
    if (result) {
      debug_printing = 0;
    }
    if (showAll == 1) {
      showEnqueueDequeue = 1;
    }
  }
  if (showLogicalBacktraces == 1)
  {
    pthread_key_create((pthread_key_t *)&allow_malloc_logging_key, 0);
    uint64_t result = (const char *)pthread_setspecific(allow_malloc_logging_key, (char *)&dword_0 + 1);
    previous_malloc_logger = (uint64_t (*)(void))malloc_logger;
    malloc_logger = my_malloc_logger;
  }
  return result;
}

void *my_malloc_logger(void *result)
{
  int v1 = (int)result;
  if (previous_malloc_logger) {
    uint64_t result = (void *)previous_malloc_logger(result);
  }
  if (v1 == 10)
  {
    uint64_t result = pthread_getspecific(allow_malloc_logging_key);
    if (result)
    {
      pthread_setspecific(allow_malloc_logging_key, 0);
      if (my_malloc_logger_finished_setlocale)
      {
LABEL_6:
        snprintf(__str, 0x80uLL, "malloc_logger event type %u", 10);
        print_logical_backtrace(__str);
        return (void *)pthread_setspecific(allow_malloc_logging_key, (char *)&dword_0 + 1);
      }
      uint64_t v2 = backtrace_contains_function();
      if (!v2)
      {
        int v4 = my_malloc_logger_malloc_count;
        int v5 = ++my_malloc_logger_malloc_count;
        if (v4 >= 1000)
        {
          fprintf(__stderrp, "setting finished_setlocale, malloc_count %d\n", v5);
          my_malloc_logger_finished_setlocale = 1;
        }
        goto LABEL_6;
      }
      if ((my_malloc_logger_printed & 1) == 0) {
        my_malloc_logger_printed = 1;
      }
      my_malloc_logger_address_of_setlocale_function = (uint64_t)v2;
      pthread_key_t v3 = allow_malloc_logging_key;
      return (void *)pthread_setspecific(v3, (char *)&dword_0 + 1);
    }
  }
  return result;
}

uint64_t print_backtrace(char *__str, size_t __size, void **a3, int a4, char a5)
{
  size_t v5 = __size;
  int v6 = __str;
  if (a4 <= 0) {
    return snprintf(__str, __size, "NO BACKTRACE (%d frames)\n", a4);
  }
  char v7 = a5 & ~nocompress;
  if ((unint64_t)a3[a4 - 1] >= 0x1000) {
    int v8 = a4;
  }
  else {
    int v8 = a4 - 1;
  }
  int v9 = backtrace_symbols(a3, v8);
  uint64_t v10 = (v8 - 3);
  char v11 = v7 ^ 1;
  if (v8 < 3) {
    char v11 = 1;
  }
  if (v11)
  {
LABEL_12:
    int v12 = v8;
  }
  else
  {
    int v12 = v8 - 2;
    while (strstr(v9[v10], " libdispatch.dylib "))
    {
      --v12;
      if (v10-- <= 0) {
        goto LABEL_12;
      }
    }
  }
  if (v8 < 1)
  {
    uint64_t v15 = 0;
    goto LABEL_36;
  }
  int v14 = 0;
  uint64_t v15 = 0;
  while (1)
  {
    if (v7)
    {
      if (strstr(v9[v14], " libdispatch.dylib "))
      {
        char v7 = 1;
        goto LABEL_31;
      }
      if (v14 >= 1) {
        break;
      }
    }
LABEL_22:
    unsigned int v16 = snprintf(v6, v5, "%s\n", v9[v14]);
    if ((v16 & 0x80000000) != 0 || v5 <= v16) {
      goto LABEL_35;
    }
    v6 += v16;
    v5 -= v16;
    uint64_t v15 = v16 + v15;
    if (v14 == v12)
    {
      if (v12 >= v8 - 2)
      {
        char v7 = 0;
        int v14 = v12;
      }
      else
      {
        unsigned int v16 = snprintf(v6, v5, "...");
        if ((v16 & 0x80000000) != 0 || v5 <= v16) {
          goto LABEL_35;
        }
        char v7 = 0;
        v6 += v16;
        v5 -= v16;
        uint64_t v15 = v16 + v15;
        int v14 = v8 - 2;
      }
    }
    else
    {
      char v7 = 0;
    }
LABEL_31:
    if (++v14 >= v8) {
      goto LABEL_36;
    }
  }
  unsigned int v16 = snprintf(v6, v5, "%s\n", v9[v14 - 1]);
  if ((v16 & 0x80000000) == 0 && v5 > v16)
  {
    v6 += v16;
    v5 -= v16;
    uint64_t v15 = v16 + v15;
    goto LABEL_22;
  }
LABEL_35:
  fprintf(__stderrp, "BUFSIZ CHECK FAILED bufsiz %zu printed_count %d\n\n\n", v5, v16);
LABEL_36:
  free(v9);
  return v15;
}

_DWORD *create_backtrace_uniquing_table(unsigned int a1, int a2)
{
  int v4 = malloc_type_calloc(1uLL, 0x108uLL, 0x1080040AD5D41FBuLL);
  size_t v5 = v4;
  if ((a2 & 2) != 0) {
    unint64_t v6 = 24;
  }
  else {
    unint64_t v6 = 16;
  }
  v4[10] = v6;
  if (a1)
  {
    if (a1 <= 0x400) {
      int v7 = 1024;
    }
    else {
      int v7 = a1;
    }
    uint64_t v8 = (v6 * v7);
    vm_size_t v9 = vm_page_size;
    uint64_t v10 = (((v8 + vm_page_size - 1) & -(uint64_t)vm_page_size) / vm_page_size);
  }
  else
  {
    vm_size_t v9 = vm_page_size;
    uint64_t v10 = 512;
  }
  *((void *)v4 + 1) = v10;
  *((void *)v4 + 2) = (v9 * v10 / v6) & 0xFFFFFFFFFFFFFFELL;
  *((void *)v4 + 3) = v9 * v10;
  mach_vm_address_t address = 0;
  if (mach_vm_allocate(mach_task_self_, &address, v9 * v10, 167772161)) {
    create_backtrace_uniquing_table_cold_1();
  }
  *(void *)size_t v5 = address;
  *((void *)v5 + 4) = 0;
  v5[14] = ((a2 & 6) == 0) | a2;
  v5[11] = 10;
  unint64_t v11 = *((void *)v5 + 2);
  if (v11 >= 0x401)
  {
    int v12 = 10;
    do
    {
      v11 >>= 2;
      v12 += 3;
    }
    while (v11 > 0x400);
    v5[11] = v12;
  }
  pthread_rwlock_init((pthread_rwlock_t *)(v5 + 16), 0);
  return v5;
}

uint64_t enter_stack_in_backtrace_uniquing_table()
{
  uint64_t v0 = __chkstk_darwin();
  unsigned int v2 = v1;
  uint64_t v4 = v3;
  unint64_t v6 = v5;
  uint64_t v7 = v0;
  uint64_t v32 = 0;
  uint64_t v8 = (pthread_rwlock_t *)(v0 + 64);
  pthread_rwlock_wrlock((pthread_rwlock_t *)(v0 + 64));
  int v9 = _enter_frames_in_table_while_locked(v7, &v32, v4, v2);
  pthread_rwlock_unlock(v8);
  if (v9)
  {
    uint64_t result = 1;
  }
  else
  {
    uint64_t v30 = v4;
    unsigned int v31 = v2;
    while (1)
    {
      uint64_t v11 = 4 * *(void *)(v7 + 8);
      int v12 = *(_DWORD *)(v7 + 44);
      pthread_rwlock_wrlock(v8);
      uint64_t v13 = *(void *)(v7 + 16);
      vm_size_t v14 = vm_page_size * v11;
      vm_size_t v15 = vm_page_size * v11 / *(unsigned int *)(v7 + 40);
      unint64_t v16 = v15 & 0xFFFFFFFFFFFFFFFELL;
      if (HIDWORD(v15))
      {
        fprintf(__stderrp, "can't expand backtrace uniquing table from %llu nodes to %llu nodes (exceeds maximum %u)\n", v13, v16, -1);
        goto LABEL_32;
      }
      unsigned int v17 = v8;
      mach_vm_address_t v18 = *(void *)v7;
      mach_vm_size_t v19 = *(void *)(v7 + 24);
      address[0] = 0;
      if (mach_vm_allocate(mach_task_self_, address, vm_page_size * v11, 167772161)) {
        create_backtrace_uniquing_table_cold_1();
      }
      mach_vm_address_t v20 = address[0];
      if (!address[0]) {
        break;
      }
      *(void *)uint64_t v7 = address[0];
      *(void *)(v7 + 8) = v11;
      *(void *)(v7 + 16) = v16;
      *(void *)(v7 + 24) = v14;
      *(void *)(v7 + 32) = v13;
      *(_DWORD *)(v7 + 44) = v12 + 3;
      int v21 = *(_DWORD *)(v7 + 56);
      if (v21)
      {
        *(void *)(v7 + 48) = 0;
      }
      else if ((v21 & 4) != 0)
      {
        if (mach_vm_copy(mach_task_self_, v18, v19, v20)) {
          printf("(BacktraceUniquing) expandUniquingTable(): VMCopyFailed");
        }
      }
      else if ((v21 & 2) != 0)
      {
        *(void *)(v7 + 48) = 0;
        if (v13)
        {
          for (uint64_t i = 0; i != v13; ++i)
          {
            uint64_t v23 = *(unsigned int *)(v7 + 40);
            mach_vm_address_t v24 = v18 + i * v23;
            uint64_t v25 = *(void *)(v24 + 16);
            if (v25)
            {
              int v26 = *(_DWORD *)(v24 + 8);
              if (v26 == -1)
              {
                int v28 = 0;
              }
              else
              {
                int v27 = 0;
                do
                {
                  address[v27] = *(void *)v24;
                  int v28 = v27 + 1;
                  mach_vm_address_t v24 = v18 + (v26 * v23);
                  int v26 = *(_DWORD *)(v24 + 8);
                  ++v27;
                }
                while (v26 != -1);
              }
              address[v28] = *(void *)v24;
              uint64_t v33 = 0;
              if (_enter_frames_in_table_while_locked(v7, &v33, (uint64_t)address, v28 + 1)) {
                *(void *)(*(void *)v7 + v33 * *(unsigned int *)(v7 + 40) + 16) = v25;
              }
              else {
                fwrite("unable to reinsert node when expanding backtrace uniquing table - bad hashing function?\n", 0x58uLL, 1uLL, __stderrp);
              }
            }
          }
        }
      }
      if (mach_vm_deallocate(mach_task_self_, v18, v19)) {
        printf("(BacktraceUniquing) expandUniquingTable(): mach_vm_deallocate failed. [%p]\n", *(const void **)v7);
      }
      uint64_t v8 = v17;
      pthread_rwlock_unlock(v17);
      pthread_rwlock_wrlock(v17);
      int v29 = _enter_frames_in_table_while_locked(v7, &v32, v30, v31);
      pthread_rwlock_unlock(v17);
      if (v29)
      {
        uint64_t result = 1;
        goto LABEL_33;
      }
    }
    fprintf(__stderrp, "failed to expand uniquing table to %llu bytes\n", v14);
    uint64_t v8 = v17;
LABEL_32:
    pthread_rwlock_unlock(v8);
    uint64_t result = 0;
    uint64_t v32 = -1;
  }
LABEL_33:
  uint64_t *v6 = v32;
  return result;
}

uint64_t remove_stack_from_backtrace_uniquing_table(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = (pthread_rwlock_t *)(a1 + 64);
  pthread_rwlock_wrlock((pthread_rwlock_t *)(a1 + 64));
  if (a2 != -1)
  {
    int v5 = a2;
    do
    {
      size_t v6 = *(unsigned int *)(a1 + 40);
      uint64_t v7 = (_DWORD *)(*(void *)a1 + (v6 * v5));
      int v8 = v7[2];
      if (*(void *)v7) {
        BOOL v9 = 0;
      }
      else {
        BOOL v9 = v8 == 0;
      }
      if (v9) {
        break;
      }
      int v10 = v7[3];
      if (v10 != -1)
      {
        int v11 = v10 - 1;
        v7[3] = v11;
        if (!v11)
        {
          bzero(v7, v6);
          --*(_DWORD *)(a1 + 48);
          if (v5 == a2) {
            --*(_DWORD *)(a1 + 52);
          }
        }
      }
      int v5 = v8;
    }
    while (v8 != -1);
  }

  return pthread_rwlock_unlock(v4);
}

uint64_t stack_frames_for_uniqued_stack(uint64_t a1, int a2, uint64_t a3, int a4)
{
  int v8 = (pthread_rwlock_t *)(a1 + 64);
  pthread_rwlock_rdlock((pthread_rwlock_t *)(a1 + 64));
  uint64_t v9 = 0;
  if (a4 && a2 != -1)
  {
    uint64_t v9 = 0;
    int v10 = *(_DWORD *)(a1 + 40);
    vm_size_t v11 = vm_page_size;
    while (1)
    {
      if (v11 * *(void *)(a1 + 8) <= (v10 + v10 * a2))
      {
        fprintf(__stderrp, "(BacktraceUniquing): Invalid parent node %#x\n");
        goto LABEL_14;
      }
      uint64_t v12 = *(void *)a1 + (v10 * a2);
      a2 = *(_DWORD *)(v12 + 8);
      if (!*(void *)v12 && a2 == 0) {
        break;
      }
      *(void *)(a3 + 8 * v9) = *(void *)v12;
      int v14 = v9++;
      if (a4 - 1 == v14 || a2 == -1) {
        goto LABEL_14;
      }
    }
    fprintf(__stderrp, "(BacktraceUniquing): Invalid PC 0x%llx\n");
  }
LABEL_14:
  pthread_rwlock_unlock(v8);
  return v9;
}

uint64_t _enter_frames_in_table_while_locked(uint64_t a1, void *a2, uint64_t a3, unsigned int a4)
{
  unint64_t v4 = *(void *)(a1 + 16);
  uint64_t v5 = *(void *)(a1 + 32);
  uint64_t v6 = *(int *)(a1 + 44);
  unint64_t v7 = (v4 - v5) / ((2 * v6) | 1uLL);
  uint64_t v8 = a4;
  unsigned int v9 = -1;
  while (1)
  {
    unsigned int v10 = v9;
    if ((int)v8 < 1) {
      break;
    }
    if (v6)
    {
      --v8;
      unint64_t v11 = *(void *)(a3 + 8 * v8);
      unsigned int v9 = ((16 * v9) ^ (v11 >> 2)) % (v4 - v5 - 1) + v5;
      int v12 = (v6 - 1) * v7 + 1;
      int v13 = v6;
      while (1)
      {
        uint64_t v14 = *(void *)a1 + *(_DWORD *)(a1 + 40) * v9;
        if (!*(void *)v14 && !*(_DWORD *)(v14 + 8)) {
          break;
        }
        if (*(void *)v14 == v11 && *(_DWORD *)(v14 + 8) == v10)
        {
          int v19 = *(_DWORD *)(v14 + 12);
          mach_vm_address_t v18 = (_DWORD *)(v14 + 12);
          int v17 = v19;
          if (v19 == -1) {
            goto LABEL_19;
          }
          goto LABEL_18;
        }
        unint64_t v15 = v9 + v12;
        if (v4 <= v15) {
          int v16 = v5 - v4;
        }
        else {
          int v16 = 0;
        }
        v12 -= v7;
        unsigned int v9 = v15 + v16;
        if (!--v13) {
          return 0;
        }
      }
      *(void *)uint64_t v14 = v11;
      *(_DWORD *)(v14 + 8) = v10;
      *(_DWORD *)(v14 + 12) = 1;
      ++*(_DWORD *)(a1 + 48);
      if (v8) {
        goto LABEL_19;
      }
      int v17 = *(_DWORD *)(a1 + 52);
      mach_vm_address_t v18 = (_DWORD *)(a1 + 52);
LABEL_18:
      *mach_vm_address_t v18 = v17 + 1;
LABEL_19:
      if (v13 >= 1) {
        continue;
      }
    }
    return 0;
  }
  *a2 = v9;
  return 1;
}

uint64_t print_dispatch_info()
{
  thread_act_array_t act_list = 0;
  act_listCnt[0] = 0;
  if (!task_threads(mach_task_self_, &act_list, act_listCnt))
  {
    if (act_listCnt[0])
    {
      unint64_t v0 = 0;
      do
      {
        unsigned int v1 = pthread_from_mach_thread_np(act_list[v0]);
        print_logical_backtrace_0(0, v1);
        ++v0;
      }
      while (v0 < act_listCnt[0]);
      if (act_listCnt[0])
      {
        unint64_t v2 = 0;
        do
          mach_port_deallocate(mach_task_self_, act_list[v2++]);
        while (v2 < act_listCnt[0]);
        mach_vm_deallocate(mach_task_self_, (mach_vm_address_t)act_list, 4 * act_listCnt[0]);
      }
    }
    fflush(__stdoutp);
  }
  *(void *)act_listCnt = 0;
  thread_act_array_t act_list = 0;
  uint64_t result = __introspection_dispatch_get_queues(3, (mach_vm_address_t *)&act_list, (mach_vm_size_t *)act_listCnt);
  if (result)
  {
    uint64_t v4 = result;
    puts("--------------------------------------------------------------------------------");
    printf("NUMBER OF QUEUES WITH PENDING ITEMS:  %llu\n", v4);
    putchar(10);
    uint64_t v5 = 0;
    thread_act_array_t v6 = act_list;
    do
    {
      mach_vm_size_t size = 0;
      mach_vm_address_t address = 0;
      uint64_t pending_items = __introspection_dispatch_queue_get_pending_items(*((void *)v6 + 1), &address, (uint64_t *)&size);
      printf("QUEUE %p SERIALNUM %llu %s\n", *((const void **)v6 + 1), *((void *)v6 + 2), (const char *)v6 + 32);
      printf("number of pending items in list: %llu   recorded pending count: %d  running count: %d\n", pending_items, v6[7], v6[6]);
      if (address)
      {
        printf("pending items array version %u  pending items array entry size %u\n", *(_DWORD *)address, *(_DWORD *)(address + 4));
        mach_vm_address_t v8 = address;
        if (pending_items)
        {
          uint64_t v9 = 0;
          unsigned int v10 = (const void **)(address + 8);
          do
          {
            printf("QUEUE %p PENDING ITEM %zu:  item_ref %p  function_or_block %p\n", *((const void **)v6 + 1), v9, *v10, v10[1]);
            unint64_t v11 = (unint64_t)*v10;
            v10 += 2;
            print_logical_backtrace_0(v11, 0);
            ++v9;
          }
          while (pending_items != v9);
          mach_vm_address_t v8 = address;
        }
        mach_vm_deallocate(mach_task_self_, v8, size);
      }
      thread_act_array_t v6 = (thread_act_array_t)((char *)v6 + *v6);
      ++v5;
    }
    while (v5 != v4);
    mach_vm_deallocate(mach_task_self_, (mach_vm_address_t)act_list, *(mach_vm_size_t *)act_listCnt);
    return fflush(__stdoutp);
  }
  return result;
}

void *print_logical_backtrace_0(unint64_t a1, pthread_t a2)
{
  mach_vm_address_t v2 = (mach_vm_address_t)a2;
  mach_vm_size_t v23 = 0;
  mach_vm_address_t v24 = 0;
  if (a2)
  {
    __uint64_t v22 = 0;
    pthread_threadid_np(a2, &v22);
    uint64_t result = __introspection_dispatch_thread_get_item_info((void *)v22, &v24, &v23);
    if (!v24) {
      return result;
    }
    LOBYTE(v25.dli_fname) = 0;
    pthread_getname_np((pthread_t)v2, (char *)&v25, 0x40uLL);
    puts("================================================================================");
    printf("THREAD WITH ACTIVE ITEM:  ID %llu %s\n", v22, (const char *)&v25);
    mach_vm_address_t v2 = v24;
  }
  BOOL v5 = a1 != 0;
  if (a1 | v2)
  {
    int v6 = 0;
    do
    {
      if (v5)
      {
        __introspection_dispatch_queue_item_get_info((void *)a1, &v24, &v23);
        mach_vm_address_t v2 = v24;
      }
      printf("  LEVEL %d:\n", v6);
      unint64_t v7 = *(const void **)(v2 + 8);
      memset(&v25, 0, sizeof(v25));
      int v8 = dladdr(v7, &v25);
      dli_sname = v25.dli_sname;
      if (!v8) {
        dli_sname = 0;
      }
      if (!dli_sname) {
        dli_sname = (const char *)&unk_66B2;
      }
      printf("    Target function/block %p %s\n", v7, dli_sname);
      mach_vm_address_t v10 = v2 + (unsigned __int16)__introspection_dispatch_item_info_data_offset;
      unint64_t v11 = (const char *)(v10 + 8 * *(unsigned int *)(v2 + 40));
      int v12 = &v11[strlen(v11) + 1];
      size_t v13 = strlen(v12);
      printf("    Target queue serialnum %llu %s\n", *(void *)(v2 + 32), &v12[v13 + 1]);
      printf("    Enqueuing thread id %llu %s\n", *(void *)(v2 + 16), v11);
      printf("    Enqueuing queue serialnum %llu %s\n", *(void *)(v2 + 24), v12);
      printf("    stop_id %u\n", *(_DWORD *)(v2 + 44));
      if (*(_DWORD *)(v2 + 48)) {
        printf("    repeated_enqueuings_count %u\n", *(_DWORD *)(v2 + 48));
      }
      if (*(_DWORD *)(v2 + 52)) {
        printf("    elided_enqueuings_count %u\n", *(_DWORD *)(v2 + 52));
      }
      if (*(_DWORD *)(v2 + 40))
      {
        unint64_t v14 = 0;
        do
        {
          unint64_t v15 = *(const void **)(v10 + 8 * v14);
          memset(&v25, 0, sizeof(v25));
          int v16 = dladdr(v15, &v25);
          int v17 = v25.dli_sname;
          if (!v16) {
            int v17 = 0;
          }
          mach_vm_address_t v18 = *(const void **)(v10 + 8 * v14);
          if (v17) {
            int v19 = v17;
          }
          else {
            int v19 = (const char *)&unk_66B2;
          }
          memset(&v25, 0, sizeof(v25));
          if (dladdr(v18, &v25)) {
            BOOL v20 = v25.dli_fname == 0;
          }
          else {
            BOOL v20 = 1;
          }
          int v21 = (const char *)&unk_66B2;
          if (!v20) {
            int v21 = strrchr((char *)v25.dli_fname, 47) + 1;
          }
          printf("    %3d  %p %s (in %s)\n", v14++, v15, v19, v21);
        }
        while (v14 < *(unsigned int *)(v2 + 40));
      }
      a1 = *(void *)v2;
      ++v6;
      mach_vm_deallocate(mach_task_self_, v24, v23);
      mach_vm_address_t v2 = 0;
      mach_vm_address_t v24 = 0;
      BOOL v5 = 1;
    }
    while (a1);
  }
  return (void *)putchar(10);
}

void get_entry_from_free_list_cold_1()
{
}

void create_backtrace_uniquing_table_cold_1()
{
}

uint64_t __strlcpy_chk()
{
  return ___strlcpy_chk();
}

void abort(void)
{
}

int backtrace(void **a1, int a2)
{
  return _backtrace(a1, a2);
}

char **__cdecl backtrace_symbols(void *const *a1, int a2)
{
  return _backtrace_symbols(a1, a2);
}

void bzero(void *a1, size_t a2)
{
}

int dladdr(const void *a1, Dl_info *a2)
{
  return _dladdr(a1, a2);
}

int dlclose(void *__handle)
{
  return _dlclose(__handle);
}

void *__cdecl dlopen(const char *__path, int __mode)
{
  return _dlopen(__path, __mode);
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return _dlsym(__handle, __symbol);
}

int fflush(FILE *a1)
{
  return _fflush(a1);
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return _fprintf(a1, a2);
}

int fputc(int a1, FILE *a2)
{
  return _fputc(a1, a2);
}

int fputs(const char *a1, FILE *a2)
{
  return _fputs(a1, a2);
}

void free(void *a1)
{
}

size_t fwrite(const void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return _fwrite(__ptr, __size, __nitems, __stream);
}

char *__cdecl getenv(const char *a1)
{
  return _getenv(a1);
}

pid_t getpid(void)
{
  return _getpid();
}

kern_return_t mach_port_deallocate(ipc_space_t task, mach_port_name_t name)
{
  return _mach_port_deallocate(task, name);
}

kern_return_t mach_vm_allocate(vm_map_t target, mach_vm_address_t *address, mach_vm_size_t size, int flags)
{
  return _mach_vm_allocate(target, address, size, flags);
}

kern_return_t mach_vm_copy(vm_map_t target_task, mach_vm_address_t source_address, mach_vm_size_t size, mach_vm_address_t dest_address)
{
  return _mach_vm_copy(target_task, source_address, size, dest_address);
}

kern_return_t mach_vm_deallocate(vm_map_t target, mach_vm_address_t address, mach_vm_size_t size)
{
  return _mach_vm_deallocate(target, address, size);
}

kern_return_t mach_vm_region(vm_map_read_t target_task, mach_vm_address_t *address, mach_vm_size_t *size, vm_region_flavor_t flavor, vm_region_info_t info, mach_msg_type_number_t *infoCnt, mach_port_t *object_name)
{
  return _mach_vm_region(target_task, address, size, flavor, info, infoCnt, object_name);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return _malloc_type_calloc(count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return _malloc_type_malloc(size, type_id);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return _memcpy(__dst, __src, __n);
}

uint64_t os_unfair_lock_lock_with_options()
{
  return _os_unfair_lock_lock_with_options();
}

BOOL os_unfair_lock_trylock(os_unfair_lock_t lock)
{
  return _os_unfair_lock_trylock(lock);
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

int printf(const char *a1, ...)
{
  return _printf(a1);
}

int pthread_atfork(void (*a1)(void), void (*a2)(void), void (*a3)(void))
{
  return _pthread_atfork(a1, a2, a3);
}

pthread_t pthread_from_mach_thread_np(mach_port_t a1)
{
  return _pthread_from_mach_thread_np(a1);
}

int pthread_getname_np(pthread_t a1, char *a2, size_t a3)
{
  return _pthread_getname_np(a1, a2, a3);
}

void *__cdecl pthread_getspecific(pthread_key_t a1)
{
  return _pthread_getspecific(a1);
}

pthread_introspection_hook_t pthread_introspection_hook_install(pthread_introspection_hook_t hook)
{
  return _pthread_introspection_hook_install(hook);
}

int pthread_key_create(pthread_key_t *a1, void (__cdecl *a2)(void *))
{
  return _pthread_key_create(a1, a2);
}

mach_port_t pthread_mach_thread_np(pthread_t a1)
{
  return _pthread_mach_thread_np(a1);
}

int pthread_rwlock_init(pthread_rwlock_t *a1, const pthread_rwlockattr_t *a2)
{
  return _pthread_rwlock_init(a1, a2);
}

int pthread_rwlock_rdlock(pthread_rwlock_t *a1)
{
  return _pthread_rwlock_rdlock(a1);
}

int pthread_rwlock_unlock(pthread_rwlock_t *a1)
{
  return _pthread_rwlock_unlock(a1);
}

int pthread_rwlock_wrlock(pthread_rwlock_t *a1)
{
  return _pthread_rwlock_wrlock(a1);
}

pthread_t pthread_self(void)
{
  return _pthread_self();
}

int pthread_setspecific(pthread_key_t a1, const void *a2)
{
  return _pthread_setspecific(a1, a2);
}

int pthread_threadid_np(pthread_t a1, __uint64_t *a2)
{
  return _pthread_threadid_np(a1, a2);
}

int putchar(int a1)
{
  return _putchar(a1);
}

int puts(const char *a1)
{
  return _puts(a1);
}

int setenv(const char *__name, const char *__value, int __overwrite)
{
  return _setenv(__name, __value, __overwrite);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return _snprintf(__str, __size, __format);
}

char *__cdecl stpncpy(char *__dst, const char *__src, size_t __n)
{
  return _stpncpy(__dst, __src, __n);
}

char *__cdecl strcasestr(const char *__big, const char *__little)
{
  return _strcasestr(__big, __little);
}

int strcmp(const char *__s1, const char *__s2)
{
  return _strcmp(__s1, __s2);
}

size_t strlen(const char *__s)
{
  return _strlen(__s);
}

int strncmp(const char *__s1, const char *__s2, size_t __n)
{
  return _strncmp(__s1, __s2, __n);
}

char *__cdecl strrchr(char *__s, int __c)
{
  return _strrchr(__s, __c);
}

char *__cdecl strstr(char *__s1, const char *__s2)
{
  return _strstr(__s1, __s2);
}

kern_return_t task_threads(task_inspect_t target_task, thread_act_array_t *act_list, mach_msg_type_number_t *act_listCnt)
{
  return _task_threads(target_task, act_list, act_listCnt);
}

kern_return_t thread_info(thread_inspect_t target_act, thread_flavor_t flavor, thread_info_t thread_info_out, mach_msg_type_number_t *thread_info_outCnt)
{
  return _thread_info(target_act, flavor, thread_info_out, thread_info_outCnt);
}

int unsetenv(const char *a1)
{
  return _unsetenv(a1);
}