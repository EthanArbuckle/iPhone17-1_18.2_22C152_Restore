void __wd_kickoff_ping_block_invoke(uint64_t a1)
{
  __uint64_t v2;
  uint64_t v3;

  v2 = clock_gettime_nsec_np(_CLOCK_UPTIME_RAW);
  v3 = *(void *)(a1 + 32);
  atomic_compare_exchange_strong(&wd_endpoint[2 * *(int *)(a1 + 40) + 28], (unint64_t *)&v3, v2 + 1);
}

void wd_server_handler(uint64_t a1, uint64_t a2)
{
  if (a2 != 1)
  {
    if (a2 != 2) {
      wd_server_handler_cold_1();
    }
    if ((dispatch_mach_mig_demux() & 1) == 0)
    {
      msg = (mach_msg_header_t *)dispatch_mach_msg_get_msg();
      mach_msg_destroy(msg);
    }
  }
}

uint64_t _XPollIsAlive(uint64_t result, uint64_t a2)
{
  if ((*(_DWORD *)result & 0x80000000) != 0 && *(_DWORD *)(result + 24) == 1 && *(_DWORD *)(result + 4) == 64)
  {
    if (*(unsigned __int16 *)(result + 38) << 16 == 1179648)
    {
      result = _WDOGClient_PollIsAlive(*(unsigned int *)(result + 12), *(void *)(result + 48), *(void *)(result + 56), *(_DWORD *)(result + 28));
      *(_DWORD *)(a2 + 32) = result;
      return result;
    }
    int v3 = -300;
  }
  else
  {
    int v3 = -304;
  }
  *(_DWORD *)(a2 + 32) = v3;
  *(void *)(a2 + 24) = *MEMORY[0x263EF80C8];
  return result;
}

uint64_t _WDOGClient_PollIsAlive(uint64_t a1, uint64_t a2, uint64_t a3, unsigned int a4)
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  bzero(v41, 0x400uLL);
  bzero(v40, 0x400uLL);
  bzero(__str, 0x400uLL);
  uint64_t v28 = 0;
  os_unfair_lock_lock((os_unfair_lock_t)&dword_26AA74E70);
  uint64_t v7 = qword_26AA750C8;
  if (!qword_26AA750C8) {
    _WDOGClient_PollIsAlive_cold_1();
  }
  if (dword_26AA750D0 < 1)
  {
    int v9 = 1;
  }
  else
  {
    uint64_t v8 = 0;
    int v9 = 1;
    v10 = (unint64_t *)&unk_26AA74F30;
    do
    {
      unint64_t v11 = atomic_load(v10);
      if (v11 == v7)
      {
        if (v41[0]) {
          __strlcat_chk();
        }
        dispatch_queue_get_label((dispatch_queue_t)*(v10 - 1));
        __strlcat_chk();
        int v9 = 0;
      }
      ++v8;
      v10 += 2;
    }
    while (v8 < dword_26AA750D0);
    if (v41[0]) {
      snprintf(__str, 0x400uLL, "unresponsive dispatch queue(s): %s ", v41);
    }
  }
  if (dword_26AA750D4 >= 1)
  {
    uint64_t v12 = 0;
    v13 = (unint64_t *)&unk_26AA74FE0;
    do
    {
      unint64_t v14 = atomic_load(v13);
      if (v14 == v7)
      {
        if (v40[0]) {
          __strlcat_chk();
        }
        __strlcat_chk();
        int v9 = 0;
      }
      v13 += 3;
      ++v12;
    }
    while (v12 < dword_26AA750D4);
  }
  if (v40[0])
  {
    v29[0] = 0;
    asprintf(v29, "unresponsive work processor(s): %s ", v40);
    __strlcat_chk();
    free(v29[0]);
  }
  if (qword_26AA750C0)
  {
    v29[0] = 0;
    if (((*(uint64_t (**)(void))(qword_26AA750C0 + 16))() & 1) == 0)
    {
      v27 = 0;
      if (v29[0])
      {
        asprintf(&v27, "is_alive_func returned unhealthy : %s", v29[0]);
        free(v29[0]);
      }
      else
      {
        asprintf(&v27, "is_alive_func returned unhealthy");
      }
      __strlcat_chk();
      free(v27);
      int v9 = 0;
    }
  }
  wd_kickoff_ping();
  if (byte_26AA74E74 && (int v15 = dword_26AA74E78) != 0)
  {
    long long v37 = 0u;
    long long v38 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    *(_OWORD *)v29 = 0u;
    long long v30 = 0u;
    if (dword_26AA74E78 < 1)
    {
      unsigned int v17 = 0;
    }
    else
    {
      uint64_t v16 = 0;
      unsigned int v17 = 0;
      v18 = (const char *)&unk_26AA74E7C;
      do
      {
        if (v18[32])
        {
          strlcpy((char *)&v29[4 * (int)v17++], v18, 0x20uLL);
          int v15 = dword_26AA74E78;
        }
        ++v16;
        v18 += 33;
      }
      while (v16 < v15);
    }
    uint64_t v19 = v28;
    v24 = v29;
    unsigned int v20 = a4;
    uint64_t v21 = a2;
    uint64_t v22 = a3;
    int v23 = v9;
    unsigned int v25 = v17;
  }
  else
  {
    uint64_t v19 = v28;
    unsigned int v20 = a4;
    uint64_t v21 = a2;
    uint64_t v22 = a3;
    int v23 = v9;
    v24 = 0;
    unsigned int v25 = 0;
  }
  _WDOGClient_ReplyIsAlive(v20, v21, v22, v23, __str, v19, v24, v25);
  os_unfair_lock_unlock((os_unfair_lock_t)&dword_26AA74E70);
  return 0;
}

void wd_kickoff_ping()
{
  os_unfair_lock_assert_owner((const os_unfair_lock *)&dword_26AA74E70);
  if (!byte_26AA750D8) {
    _WDOGClient_PollIsAlive_cold_1();
  }
  __uint64_t v0 = clock_gettime_nsec_np(_CLOCK_UPTIME_RAW);
  qword_26AA750C8 = v0;
  dword_26AA750D0 = dword_26AA74F24;
  int v1 = dword_26AA74FC8;
  dword_26AA750D4 = dword_26AA74FC8;
  if (dword_26AA74F24 >= 1)
  {
    uint64_t v2 = 0;
    uint64_t v3 = MEMORY[0x263EF8330];
    v4 = (unint64_t *)&unk_26AA74F30;
    do
    {
      atomic_store(v0, v4);
      v5 = *(v4 - 1);
      block[0] = v3;
      block[1] = 0x40000000;
      block[2] = __wd_kickoff_ping_block_invoke;
      block[3] = &__block_descriptor_tmp;
      block[4] = v0;
      int v13 = v2;
      dispatch_async(v5, block);
      ++v2;
      v4 += 2;
    }
    while (v2 < dword_26AA750D0);
    int v1 = dword_26AA750D4;
  }
  if (v1 >= 1)
  {
    uint64_t v6 = 0;
    uint64_t v7 = MEMORY[0x263EF8330];
    uint64_t v8 = (unint64_t *)&unk_26AA74FE0;
    do
    {
      atomic_store(v0, v8);
      int v9 = (void (*)(void *))*(v8 - 2);
      v10[0] = v7;
      v10[1] = 0x40000000;
      v10[2] = __wd_kickoff_ping_block_invoke_2;
      v10[3] = &__block_descriptor_tmp_6;
      v10[4] = v0;
      int v11 = v6;
      v9(v10);
      ++v6;
      v8 += 3;
    }
    while (v6 < dword_26AA750D4);
  }
}

uint64_t _WDOGClient_ReplyIsAlive(unsigned int a1, uint64_t a2, uint64_t a3, int a4, char *src, uint64_t a6, const void *a7, unsigned int a8)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  long long v20 = 0u;
  memset(v21, 0, 464);
  long long v18 = 0u;
  long long v19 = 0u;
  *((void *)&v19 + 1) = *MEMORY[0x263EF80C8];
  *(void *)&long long v20 = a2;
  *((void *)&v20 + 1) = a3;
  LODWORD(v21[0]) = a4;
  if (MEMORY[0x263EF89D0]) {
    int v12 = mig_strncpy_zerofill((char *)v21 + 12, src, 1024);
  }
  else {
    int v12 = mig_strncpy((char *)v21 + 12, src, 1024);
  }
  DWORD1(v21[0]) = 0;
  DWORD2(v21[0]) = v12;
  uint64_t v13 = (v12 + 3) & 0xFFFFFFFC;
  unint64_t v14 = (char *)&v18 + v13;
  *(void *)((char *)v21 + v13 + 12) = a6;
  if (a8 > 5) {
    return 4294966989;
  }
  uint64_t v16 = v14 - 1024;
  memcpy(v14 + 72, a7, 32 * a8);
  *((_DWORD *)v16 + 273) = a8;
  mach_msg_size_t v17 = v13 + 32 * a8 + 72;
  LODWORD(v18) = 18;
  *((void *)&v18 + 1) = a1;
  *(void *)&long long v19 = 0x5BB0A800000000;
  if (MEMORY[0x263EF8B00]) {
    voucher_mach_msg_set((mach_msg_header_t *)&v18);
  }
  return mach_msg((mach_msg_header_t *)&v18, 1, v17, 0, 0, 0, 0);
}

void __wd_kickoff_ping_block_invoke_2(uint64_t a1)
{
  __uint64_t v2 = clock_gettime_nsec_np(_CLOCK_UPTIME_RAW);
  uint64_t v3 = *(void *)(a1 + 32);
  atomic_compare_exchange_strong(&wd_endpoint[3 * *(int *)(a1 + 40) + 50], (unint64_t *)&v3, v2 + 1);
}

char *wd_endpoint_register(const char *a1)
{
  if (!a1) {
    _WDOGClient_PollIsAlive_cold_1();
  }
  if (wd_endpoint) {
    _WDOGClient_PollIsAlive_cold_1();
  }
  result = strdup(a1);
  wd_endpoint = (uint64_t)result;
  if (!result) {
    _WDOGClient_PollIsAlive_cold_1();
  }
  dword_26AA74E70 = 0;
  return result;
}

void wd_endpoint_add_queue(NSObject *a1)
{
  if (!a1) {
    _WDOGClient_PollIsAlive_cold_1();
  }
  label = dispatch_queue_get_label(a1);
  if (!label) {
    _WDOGClient_PollIsAlive_cold_1();
  }
  if (!*label) {
    _WDOGClient_PollIsAlive_cold_1();
  }
  os_unfair_lock_lock((os_unfair_lock_t)&dword_26AA74E70);
  if (!wd_endpoint[0]) {
    _WDOGClient_PollIsAlive_cold_1();
  }
  int v3 = dword_26AA74F24;
  if (dword_26AA74FC8 + dword_26AA74F24 >= 10) {
    _WDOGClient_PollIsAlive_cold_1();
  }
  wd_endpoint[2 * dword_26AA74F24 + 27] = (uint64_t)a1;
  dword_26AA74F24 = v3 + 1;
  os_unfair_lock_unlock((os_unfair_lock_t)&dword_26AA74E70);
}

void wd_endpoint_add_work_processor(uint64_t a1, const char *a2)
{
  if (!a1) {
    _WDOGClient_PollIsAlive_cold_1();
  }
  if (!a2) {
    _WDOGClient_PollIsAlive_cold_1();
  }
  if (!*a2) {
    _WDOGClient_PollIsAlive_cold_1();
  }
  os_unfair_lock_lock((os_unfair_lock_t)&dword_26AA74E70);
  if (!wd_endpoint[0]) {
    _WDOGClient_PollIsAlive_cold_1();
  }
  int v4 = dword_26AA74FC8;
  if (dword_26AA74FC8 + dword_26AA74F24 >= 10) {
    _WDOGClient_PollIsAlive_cold_1();
  }
  v5 = &wd_endpoint[3 * dword_26AA74FC8];
  v5[48] = a1;
  uint64_t v6 = strdup(a2);
  v5[49] = (uint64_t)v6;
  if (!v6) {
    _WDOGClient_PollIsAlive_cold_1();
  }
  dword_26AA74FC8 = v4 + 1;
  os_unfair_lock_unlock((os_unfair_lock_t)&dword_26AA74E70);
}

void wd_endpoint_set_alive_func(const void *a1)
{
  if (!a1) {
    _WDOGClient_PollIsAlive_cold_1();
  }
  os_unfair_lock_lock((os_unfair_lock_t)&dword_26AA74E70);
  if (!wd_endpoint[0]) {
    _WDOGClient_PollIsAlive_cold_1();
  }
  if (qword_26AA750C0) {
    _WDOGClient_PollIsAlive_cold_1();
  }
  qword_26AA750C0 = (uint64_t)_Block_copy(a1);
  os_unfair_lock_unlock((os_unfair_lock_t)&dword_26AA74E70);
}

uint64_t wd_endpoint_activate()
{
  os_unfair_lock_lock((os_unfair_lock_t)&dword_26AA74E70);
  if (!wd_endpoint[0]) {
    _WDOGClient_PollIsAlive_cold_1();
  }
  if (byte_26AA750D8) {
    _WDOGClient_PollIsAlive_cold_1();
  }
  if (dword_26AA74F24 <= 0 && dword_26AA74FC8 <= 0 && qword_26AA750C0 == 0) {
    _WDOGClient_PollIsAlive_cold_1();
  }
  byte_26AA750D8 = 1;
  wd_kickoff_ping();
  os_unfair_lock_unlock((os_unfair_lock_t)&dword_26AA74E70);
  if (qword_26AA74E68) {
    _WDOGClient_PollIsAlive_cold_1();
  }
  if (!wd_endpoint[0]) {
    _WDOGClient_PollIsAlive_cold_1();
  }
  __uint64_t v2 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
  qword_26AA74E68 = (uint64_t)dispatch_queue_create("com.apple.watchdog.framework", v2);
  if (!qword_26AA74E68) {
    _WDOGClient_PollIsAlive_cold_1();
  }
  if (bootstrap_check_in(*MEMORY[0x263EF87F0], (const char *__attribute__((__org_typedef(name_t))))wd_endpoint[0], (mach_port_t *)&dword_26AA74E58))
  {
    _WDOGClient_PollIsAlive_cold_1();
  }
  int v4 = 1;
  if (MEMORY[0x216672620](*MEMORY[0x263EF8960], dword_26AA74E58, 1, &v4, 1))_WDOGClient_PollIsAlive_cold_1(); {
  qword_26AA74E60 = dispatch_mach_create_f();
  }
  return dispatch_mach_connect();
}

void wd_endpoint_set_platform_controller()
{
  os_unfair_lock_lock((os_unfair_lock_t)&dword_26AA74E70);
  byte_26AA74E74 = 1;
  os_unfair_lock_unlock((os_unfair_lock_t)&dword_26AA74E70);
}

void wd_endpoint_begin_watchdog_monitoring_for_service(const char *a1)
{
  if (!a1) {
    _WDOGClient_PollIsAlive_cold_1();
  }
  size_t v2 = strlen(a1);
  if (!v2) {
    _WDOGClient_PollIsAlive_cold_1();
  }
  if (v2 >= 0x20) {
    _WDOGClient_PollIsAlive_cold_1();
  }
  os_unfair_lock_assert_not_owner((const os_unfair_lock *)&dword_26AA74E70);
  os_unfair_lock_lock((os_unfair_lock_t)&dword_26AA74E70);
  if (!byte_26AA74E74) {
    _WDOGClient_PollIsAlive_cold_1();
  }
  int v3 = dword_26AA74E78;
  if (dword_26AA74E78 >= 1)
  {
    size_t v4 = strlen(a1);
    v5 = (const char *)&unk_26AA74E7C;
    uint64_t v6 = dword_26AA74E78;
    do
    {
      if (strlen(v5) == v4 && !strcmp(v5, a1))
      {
        *((unsigned char *)v5 + 32) = 1;
        goto LABEL_13;
      }
      v5 += 33;
      --v6;
    }
    while (v6);
    if (v3 >= 5) {
      _WDOGClient_PollIsAlive_cold_1();
    }
  }
  __strlcpy_chk();
  *((unsigned char *)&wd_endpoint[9] + 33 * v3 + 4) = 1;
  ++dword_26AA74E78;
LABEL_13:
  os_unfair_lock_unlock((os_unfair_lock_t)&dword_26AA74E70);
}

void wd_endpoint_disable_monitoring_for_service(const char *a1)
{
  if (!a1) {
    _WDOGClient_PollIsAlive_cold_1();
  }
  if (!*a1) {
    _WDOGClient_PollIsAlive_cold_1();
  }
  os_unfair_lock_assert_not_owner((const os_unfair_lock *)&dword_26AA74E70);
  os_unfair_lock_lock((os_unfair_lock_t)&dword_26AA74E70);
  if (!byte_26AA74E74) {
    _WDOGClient_PollIsAlive_cold_1();
  }
  uint64_t v2 = dword_26AA74E78;
  if (dword_26AA74E78 >= 1)
  {
    size_t v3 = strlen(a1);
    size_t v4 = (const char *)&unk_26AA74E7C;
    while (strlen(v4) != v3 || strcmp(v4, a1))
    {
      v4 += 33;
      if (!--v2) {
        goto LABEL_11;
      }
    }
    *((unsigned char *)v4 + 32) = 0;
  }
LABEL_11:
  os_unfair_lock_unlock((os_unfair_lock_t)&dword_26AA74E70);
}

uint64_t (*WatchdogServicePing_server_routine(uint64_t a1))(uint64_t result, uint64_t a2)
{
  if (*(_DWORD *)(a1 + 20) == 6010000) {
    return _XPollIsAlive;
  }
  else {
    return 0;
  }
}

uint64_t WatchdogServicePing_server(uint64_t a1, uint64_t a2)
{
  unsigned int v2 = *(_DWORD *)(a1 + 8);
  *(_DWORD *)a2 = *(_DWORD *)a1 & 0x1F;
  *(_DWORD *)(a2 + 4) = 36;
  int v3 = *(_DWORD *)(a1 + 20) + 100;
  *(void *)(a2 + 8) = v2;
  *(_DWORD *)(a2 + 16) = 0;
  *(_DWORD *)(a2 + 20) = v3;
  if (*(_DWORD *)(a1 + 20) != 6010000)
  {
    uint64_t result = 0;
    *(void *)(a2 + 24) = *MEMORY[0x263EF80C8];
    *(_DWORD *)(a2 + 32) = -303;
    return result;
  }
  if ((*(_DWORD *)a1 & 0x80000000) == 0 || *(_DWORD *)(a1 + 24) != 1 || *(_DWORD *)(a1 + 4) != 64)
  {
    int v5 = -304;
LABEL_9:
    *(_DWORD *)(a2 + 32) = v5;
    *(void *)(a2 + 24) = *MEMORY[0x263EF80C8];
    return 1;
  }
  if (*(unsigned __int16 *)(a1 + 38) << 16 != 1179648)
  {
    int v5 = -300;
    goto LABEL_9;
  }
  *(_DWORD *)(a2 + 32) = _WDOGClient_PollIsAlive(*(unsigned int *)(a1 + 12), *(void *)(a1 + 48), *(void *)(a1 + 56), *(_DWORD *)(a1 + 28));
  return 1;
}

void _WDOGClient_PollIsAlive_cold_1()
{
}

void wd_server_handler_cold_1()
{
  __uint64_t v0 = (const void *)_os_crash();
  __break(1u);
  _Block_copy(v0);
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x270ED7CD8](aBlock);
}

uint64_t __strlcat_chk()
{
  return MEMORY[0x270ED7ED8]();
}

uint64_t __strlcpy_chk()
{
  return MEMORY[0x270ED7EE0]();
}

uint64_t _os_assert_log()
{
  return MEMORY[0x270ED8050]();
}

uint64_t _os_crash()
{
  return MEMORY[0x270ED8060]();
}

int asprintf(char **a1, const char *a2, ...)
{
  return MEMORY[0x270ED8688](a1, a2);
}

kern_return_t bootstrap_check_in(mach_port_t bp, const name_t service_name, mach_port_t *sp)
{
  return MEMORY[0x270ED8768](*(void *)&bp, service_name, sp);
}

void bzero(void *a1, size_t a2)
{
}

__uint64_t clock_gettime_nsec_np(clockid_t __clock_id)
{
  return MEMORY[0x270ED8EF8](*(void *)&__clock_id);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

uint64_t dispatch_mach_connect()
{
  return MEMORY[0x270ED93D0]();
}

uint64_t dispatch_mach_create_f()
{
  return MEMORY[0x270ED93E0]();
}

uint64_t dispatch_mach_mig_demux()
{
  return MEMORY[0x270ED93E8]();
}

uint64_t dispatch_mach_msg_get_msg()
{
  return MEMORY[0x270ED93F8]();
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x270ED9458](attr, *(void *)&qos_class, *(void *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x270ED9460](label, attr);
}

const char *__cdecl dispatch_queue_get_label(dispatch_queue_t queue)
{
  return (const char *)MEMORY[0x270ED9470](queue);
}

void free(void *a1)
{
}

mach_msg_return_t mach_msg(mach_msg_header_t *msg, mach_msg_option_t option, mach_msg_size_t send_size, mach_msg_size_t rcv_size, mach_port_name_t rcv_name, mach_msg_timeout_t timeout, mach_port_name_t notify)
{
  return MEMORY[0x270EDA190](msg, *(void *)&option, *(void *)&send_size, *(void *)&rcv_size, *(void *)&rcv_name, *(void *)&timeout, *(void *)&notify);
}

void mach_msg_destroy(mach_msg_header_t *a1)
{
}

kern_return_t mach_port_set_attributes(ipc_space_t task, mach_port_name_t name, mach_port_flavor_t flavor, mach_port_info_t port_info, mach_msg_type_number_t port_infoCnt)
{
  return MEMORY[0x270EDA228](*(void *)&task, *(void *)&name, *(void *)&flavor, port_info, *(void *)&port_infoCnt);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x270EDA470](__dst, __src, __n);
}

int mig_strncpy(char *dest, const char *src, int len)
{
  return MEMORY[0x270EDA500](dest, src, *(void *)&len);
}

int mig_strncpy_zerofill(char *dest, const char *src, int len)
{
  return MEMORY[0x270EDA508](dest, src, *(void *)&len);
}

void os_unfair_lock_assert_not_owner(const os_unfair_lock *lock)
{
}

void os_unfair_lock_assert_owner(const os_unfair_lock *lock)
{
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x270EDB510](__str, __size, __format);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x270EDB5B0](__s1, __s2);
}

char *__cdecl strdup(const char *__s1)
{
  return (char *)MEMORY[0x270EDB5D0](__s1);
}

size_t strlcpy(char *__dst, const char *__source, size_t __size)
{
  return MEMORY[0x270EDB600](__dst, __source, __size);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x270EDB610](__s);
}