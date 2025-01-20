void sub_22153229C(int a1, UInt8 *a2, uint64_t a3)
{
  CFNumberRef v5;
  CFDataRef Value;
  CFDataRef v7;
  CFDataRef v8;
  void v9[5];
  int valuePtr;
  CFRange v11;

  valuePtr = a1;
  v5 = CFNumberCreate(0, kCFNumberIntType, &valuePtr);
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 0x40000000;
  v9[2] = sub_2215323A8;
  v9[3] = &unk_2645B76C8;
  v9[4] = a3;
  dispatch_sync((dispatch_queue_t)qword_26AD52928, v9);
  dispatch_semaphore_wait((dispatch_semaphore_t)qword_26AD52918, 0xFFFFFFFFFFFFFFFFLL);
  Value = (const __CFData *)CFDictionaryGetValue((CFDictionaryRef)qword_26AD52920, v5);
  if (Value)
  {
    v7 = Value;
    CFRetain(Value);
    dispatch_semaphore_signal((dispatch_semaphore_t)qword_26AD52918);
    CFRelease(v5);
    v11.location = 0;
    v11.length = 40;
    CFDataGetBytes(v7, v11, a2);
    v8 = v7;
  }
  else
  {
    dispatch_semaphore_signal((dispatch_semaphore_t)qword_26AD52918);
    v8 = v5;
  }
  CFRelease(v8);
}

intptr_t sub_2215323A8(intptr_t result)
{
  uint64_t v1 = *(void *)(result + 32);
  if (v1)
  {
    if ((unint64_t)(v1 - qword_267F54190) < 0x3B9ACA00) {
      return result;
    }
    qword_267F54190 = *(void *)(result + 32);
  }
  NStatManagerQueryAllSources();
  v2 = qword_26AD528D0;

  return dispatch_semaphore_wait(v2, 0xFFFFFFFFFFFFFFFFLL);
}

void sub_22153241C(uint64_t a1, int a2)
{
  NStatManagerQueryAllSources();
  dispatch_semaphore_wait((dispatch_semaphore_t)qword_26AD528D0, 0xFFFFFFFFFFFFFFFFLL);
  if (a1)
  {
    dispatch_semaphore_wait((dispatch_semaphore_t)qword_26AD52918, 0xFFFFFFFFFFFFFFFFLL);
    size_t Count = CFDictionaryGetCount((CFDictionaryRef)qword_26AD52920);
    v5 = (const void **)malloc_type_malloc(8 * Count, 0x6004044C4A2DFuLL);
    CFDictionaryGetKeysAndValues((CFDictionaryRef)qword_26AD52920, 0, v5);
    qsort_b(v5, Count, 8uLL, &unk_26D39B9E0);
    if (Count)
    {
      uint64_t v6 = 0;
      int v7 = 0;
      for (i = 0; i < Count; uint64_t v6 = i)
      {
        BytePtr = CFDataGetBytePtr((CFDataRef)v5[v6]);
        if (v7 < a2 && (int v10 = *(_DWORD *)(a1 + 440 * v7), *(_DWORD *)BytePtr >= v10))
        {
          if (*(_DWORD *)BytePtr != v10)
          {
            ++v7;
            continue;
          }
          v13.location = 0;
          v13.length = 40;
          CFDataGetBytes((CFDataRef)v5[v6], v13, (UInt8 *)(a1 + 440 * v7++ + 184));
        }
        else
        {
          CFNumberRef v11 = CFNumberCreate(0, kCFNumberIntType, BytePtr);
          CFDictionaryRemoveValue((CFMutableDictionaryRef)qword_26AD52920, v11);
          CFRelease(v11);
        }
        ++i;
      }
    }
    dispatch_semaphore_signal((dispatch_semaphore_t)qword_26AD52918);
    free(v5);
  }
}

uint64_t sub_2215325C8(uint64_t a1, CFDataRef *a2, CFDataRef *a3)
{
  int v4 = *(_DWORD *)CFDataGetBytePtr(*a2);
  return (v4 - *(_DWORD *)CFDataGetBytePtr(*a3));
}

intptr_t sub_221532604()
{
  qword_26AD528D0 = (uint64_t)dispatch_semaphore_create(0);
  qword_26AD52918 = (uint64_t)dispatch_semaphore_create(1);
  qword_26AD52908 = (uint64_t)dispatch_queue_create("netstats sample queue", 0);
  qword_26AD52928 = (uint64_t)dispatch_queue_create("netstats update queue", 0);
  qword_26AD52920 = (uint64_t)CFDictionaryCreateMutable(0, 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
  qword_26AD528D8 = NStatManagerCreate();
  NStatManagerAddAllTCP();
  NStatManagerAddAllUDP();
  NStatManagerQueryAllSources();
  v0 = qword_26AD528D0;

  return dispatch_semaphore_wait(v0, 0xFFFFFFFFFFFFFFFFLL);
}

void sub_2215326EC()
{
}

intptr_t sub_221532700()
{
  return dispatch_semaphore_signal((dispatch_semaphore_t)qword_26AD528D0);
}

uint64_t sub_22153270C(int a1, CFTypeRef cf)
{
  return NStatSourceSetDescriptionBlock();
}

void sub_221532830(uint64_t a1, const __CFDictionary *a2)
{
  uint64_t v3 = NStatSourceCopyCounts();
  if (v3)
  {
    CFDictionaryRef v4 = (const __CFDictionary *)v3;
    unint64_t v16 = 0;
    *(_OWORD *)buffer = 0u;
    long long v15 = 0u;
    unint64_t valuePtr = 0;
    CFNumberRef Value = (const __CFNumber *)CFDictionaryGetValue(a2, (const void *)*MEMORY[0x263F58288]);
    if (Value)
    {
      CFNumberRef v6 = Value;
      CFDataRef v7 = (const __CFData *)CFDictionaryGetValue((CFDictionaryRef)qword_26AD52920, Value);
      if (v7)
      {
        v17.location = 0;
        v17.length = 40;
        CFDataGetBytes(v7, v17, buffer);
      }
      else
      {
        unint64_t v16 = 0;
        *(_OWORD *)buffer = 0u;
        long long v15 = 0u;
      }
      CFNumberGetValue(v6, kCFNumberIntType, buffer);
      CFNumberRef v8 = (const __CFNumber *)CFDictionaryGetValue(v4, (const void *)*MEMORY[0x263F582A0]);
      CFNumberGetValue(v8, kCFNumberLongLongType, &valuePtr);
      if (valuePtr > *(void *)&buffer[8]) {
        *(void *)&buffer[8] = valuePtr;
      }
      CFNumberRef v9 = (const __CFNumber *)CFDictionaryGetValue(v4, (const void *)*MEMORY[0x263F58298]);
      CFNumberGetValue(v9, kCFNumberLongLongType, &valuePtr);
      if (valuePtr > *((void *)&v15 + 1)) {
        *((void *)&v15 + 1) = valuePtr;
      }
      CFNumberRef v10 = (const __CFNumber *)CFDictionaryGetValue(v4, (const void *)*MEMORY[0x263F582B0]);
      CFNumberGetValue(v10, kCFNumberLongLongType, &valuePtr);
      if (valuePtr > (unint64_t)v15) {
        *(void *)&long long v15 = valuePtr;
      }
      CFNumberRef v11 = (const __CFNumber *)CFDictionaryGetValue(v4, (const void *)*MEMORY[0x263F582A8]);
      CFNumberGetValue(v11, kCFNumberLongLongType, &valuePtr);
      if (valuePtr > v16) {
        unint64_t v16 = valuePtr;
      }
      CFDataRef v12 = CFDataCreate(0, buffer, 40);
      dispatch_semaphore_wait((dispatch_semaphore_t)qword_26AD52918, 0xFFFFFFFFFFFFFFFFLL);
      CFDictionarySetValue((CFMutableDictionaryRef)qword_26AD52920, v6, v12);
      dispatch_semaphore_signal((dispatch_semaphore_t)qword_26AD52918);
      CFRelease(v12);
    }
    CFRelease(v4);
  }
}

void sub_221532A04(uint64_t a1)
{
  uint64_t v2 = NStatSourceCopyProperties();
  if (v2)
  {
    uint64_t v3 = (const void *)v2;
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
    CFRelease(v3);
  }
  CFDictionaryRef v4 = *(const void **)(a1 + 40);

  CFRelease(v4);
}

void sub_221532A64()
{
}

uint64_t pm_sample_pid_version()
{
  return sub_221532A8C();
}

uint64_t sub_221532A8C()
{
  v0 = (char *)MEMORY[0x270FA5388]();
  int v2 = v1;
  CFDictionaryRef v4 = v3;
  uint64_t v6 = v5;
  char v8 = v7;
  uint64_t v10 = v9;
  CFNumberRef v11 = v0;
  uint64_t v69 = *MEMORY[0x263EF8340];
  if (v1 == 1) {
    size_t v12 = 408;
  }
  else {
    size_t v12 = 440;
  }
  bzero(v0, v12);
  mach_port_name_t tn = 0;
  *(_OWORD *)task_info_out = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  uint64_t v38 = 0;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  memset(v56, 0, sizeof(v56));
  long long v57 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  long long v60 = 0u;
  long long v61 = 0u;
  long long v62 = 0u;
  long long v63 = 0u;
  long long v64 = 0u;
  long long v65 = 0u;
  long long v66 = 0u;
  long long v67 = 0u;
  long long v68 = 0u;
  mach_msg_type_number_t task_info_outCnt = 0;
  *(_DWORD *)CFNumberRef v11 = v6;
  if (v8)
  {
    if (v6)
    {
      CFRange v13 = (char *)proc_pidpath(v6, buffer, 0x1000u);
      if ((int)v13 <= 0)
      {
        v21 = (FILE *)*MEMORY[0x263EF8348];
        uint64_t v29 = v6;
        v30 = v13;
        v19 = "proc_pidpath %u failed(%u)\n";
        goto LABEL_30;
      }
      strrchr(buffer, 47);
    }
    __strlcpy_chk();
  }
  if ((v8 & 0x24) != 0)
  {
    p_mach_port_name_t tn = v4;
    if (!v4)
    {
      p_mach_port_name_t tn = &tn;
      uint64_t v22 = task_name_for_pid(*MEMORY[0x263EF8960], v6, &tn);
      if (v22)
      {
        CFRange v17 = (FILE *)*MEMORY[0x263EF8348];
        uint64_t v29 = v22;
        v30 = mach_error_string(v22);
        v19 = "task_name_for_pid failed %u %s\n";
        goto LABEL_24;
      }
    }
    uint64_t v38 = 0;
    long long v36 = 0u;
    long long v37 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    *(_OWORD *)task_info_out = 0u;
    long long v33 = 0u;
    mach_msg_type_number_t task_info_outCnt = 26;
    uint64_t v15 = task_info(*p_tn, 0x1Au, task_info_out, &task_info_outCnt);
    uint64_t v16 = v15;
    if (v4)
    {
      if (v15)
      {
LABEL_13:
        CFRange v17 = (FILE *)*MEMORY[0x263EF8348];
        uint64_t v29 = v16;
        v30 = mach_error_string(v16);
LABEL_18:
        v19 = "task_info failed %u %s\n";
LABEL_24:
        v23 = v17;
LABEL_31:
        fprintf(v23, v19, v29, v30);
        return 0xFFFFFFFFLL;
      }
    }
    else
    {
      mach_port_deallocate(*MEMORY[0x263EF8960], *p_tn);
      if (v16) {
        goto LABEL_13;
      }
    }
    if ((v8 & 4) != 0)
    {
      long long v25 = v33;
      *(_OWORD *)(v11 + 132) = *(_OWORD *)task_info_out;
      *(_OWORD *)(v11 + 148) = v25;
      long long v26 = v37;
      *(_OWORD *)(v11 + 164) = v34;
      *((_OWORD *)v11 + 23) = v26;
      *((void *)v11 + 48) = v38;
      if ((v8 & 0x20) != 0) {
LABEL_33:
      }
        *((void *)v11 + 42) = v35;
    }
    else if ((v8 & 0x20) != 0)
    {
      goto LABEL_33;
    }
  }
  else
  {
    p_mach_port_name_t tn = v4;
  }
  if (v8 < 0)
  {
    mach_msg_type_number_t task_info_outCnt = 8;
    uint64_t v18 = task_info(*p_tn, 0x19u, (task_info_t)v11 + 56, &task_info_outCnt);
    if (v18)
    {
      CFRange v17 = (FILE *)*MEMORY[0x263EF8348];
      uint64_t v29 = v18;
      v30 = mach_error_string(v18);
      goto LABEL_18;
    }
  }
  if ((v8 & 0x16) != 0)
  {
    long long v67 = 0u;
    long long v68 = 0u;
    long long v65 = 0u;
    long long v66 = 0u;
    long long v63 = 0u;
    long long v64 = 0u;
    long long v61 = 0u;
    long long v62 = 0u;
    long long v59 = 0u;
    long long v60 = 0u;
    long long v57 = 0u;
    long long v58 = 0u;
    memset(v56, 0, sizeof(v56));
    long long v54 = 0u;
    long long v55 = 0u;
    long long v52 = 0u;
    long long v53 = 0u;
    long long v50 = 0u;
    long long v51 = 0u;
    long long v48 = 0u;
    long long v49 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    long long v41 = 0u;
    v20 = (char *)proc_pid_rusage(v6, 6, (rusage_info_t *)&v41);
    if (v20)
    {
      v21 = (FILE *)*MEMORY[0x263EF8348];
      uint64_t v29 = v6;
      v30 = v20;
      v19 = "proc_pid_rusage %u failed(%u)\n";
LABEL_30:
      v23 = v21;
      goto LABEL_31;
    }
    if ((v8 & 4) != 0)
    {
      long long v27 = v52;
      *((_OWORD *)v11 + 16) = v51;
      *((_OWORD *)v11 + 17) = v27;
      *((_OWORD *)v11 + 18) = v53;
      *((void *)v11 + 38) = v54;
      if (v2 >= 2)
      {
        long long v28 = v60;
        *(_OWORD *)(v11 + 408) = *(_OWORD *)&v56[1];
        *(_OWORD *)(v11 + 424) = v28;
      }
    }
    if ((v8 & 0x10) != 0)
    {
      *(_OWORD *)(v11 + 312) = v50;
      *((void *)v11 + 41) = v44;
    }
    if ((v8 & 2) != 0)
    {
      if (!v10) {
        uint64_t v10 = mach_absolute_time();
      }
      *((void *)v11 + 49) = v10 - v46;
    }
  }
  if ((v8 & 8) != 0)
  {
    if (!v10) {
      uint64_t v10 = mach_absolute_time();
    }
    if (qword_26AD528E0 != -1) {
      dispatch_once(&qword_26AD528E0, &unk_26D39BA00);
    }
    sub_22153229C(v6, (UInt8 *)v11 + 184, v10);
  }
  return 0;
}

uint64_t pm_sample_pid()
{
  return sub_221532A8C();
}

uint64_t pm_sample_task_and_pid_version()
{
  return sub_221532A8C();
}

uint64_t pm_sample_task_and_pid()
{
  return sub_221532A8C();
}

uint64_t pm_sample_task_version(mach_port_name_t a1)
{
  x[0] = 0;
  x[1] = a1;
  if (pid_for_task(a1, x)) {
    return 0xFFFFFFFFLL;
  }
  else {
    return sub_221532A8C();
  }
}

uint64_t pm_sample_task(mach_port_name_t a1)
{
  return pm_sample_task_version(a1);
}

void *pm_samples_init_version(uint64_t a1)
{
  if (geteuid())
  {
    fwrite("pm_samples_init: Must be run as root!\n", 0x26uLL, 1uLL, (FILE *)*MEMORY[0x263EF8348]);
    int v2 = __error();
    result = 0;
    int *v2 = 13;
  }
  else
  {
    result = malloc_type_malloc(0x20uLL, 0x1030040C323FB7DuLL);
    if (result)
    {
      void *result = 0;
      result[1] = a1;
      uint64_t v4 = MEMORY[0x263EF8330];
      result[2] = 0;
      result[3] = 0;
      block[0] = v4;
      block[1] = 0x40000000;
      block[2] = sub_2215330C8;
      block[3] = &unk_2645B77D0;
      block[4] = a1;
      if (qword_267F54198 != -1)
      {
        uint64_t v5 = result;
        dispatch_once(&qword_267F54198, block);
        return v5;
      }
    }
  }
  return result;
}

uint64_t sub_2215330C8(uint64_t a1)
{
  if ((*(unsigned char *)(a1 + 32) & 8) != 0 && qword_26AD528E0 != -1) {
    dispatch_once(&qword_26AD528E0, &unk_26D39BA00);
  }
  host_priv_t v1 = MEMORY[0x223C83FD0]();
  dword_26AD52910 = v1;
  if (!v1) {
    abort();
  }
  uint64_t result = host_processor_sets(v1, (processor_set_name_array_t *)&qword_26AD52900, (mach_msg_type_number_t *)&dword_26AD528E8);
  if (result) {
    sub_2215331AC(result, v3, v4, v5, v6, v7, v8, v9, result);
  }
  if (dword_26AD528E8)
  {
    unint64_t v10 = 0;
    CFNumberRef v11 = (processor_set_t *)&unk_26AD528EC;
    do
    {
      uint64_t result = host_processor_set_priv(dword_26AD52910, *(_DWORD *)(qword_26AD52900 + 4 * v10), v11);
      if (result) {
        sub_2215337B8(result);
      }
      ++v10;
      ++v11;
    }
    while (v10 < dword_26AD528E8);
  }
  return result;
}

void sub_2215331AC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  vsnprintf(__str, 0x400uLL, "host_processor_sets returned %u", &a9);
  qword_267F54158 = (uint64_t)__str;
  abort();
}

void pm_samples_destroy_version(int *a1)
{
  int v2 = (void *)*((void *)a1 + 2);
  if (v2) {
    free(v2);
  }
  if (a1[1] >= 1)
  {
    uint64_t v3 = (void *)*((void *)a1 + 3);
    if (v3) {
      free(v3);
    }
  }

  free(a1);
}

uint64_t pm_samples_num_tasks_version(unsigned int *a1)
{
  return *a1;
}

uint64_t pm_samples_num_tasks(unsigned int *a1)
{
  return *a1;
}

uint64_t pm_samples_get_version(uint64_t a1, unsigned int a2)
{
  if ((a2 & 0x80000000) != 0 || *(_DWORD *)a1 <= (signed int)a2) {
    return 0;
  }
  else {
    return *(void *)(a1 + 16) + 440 * a2;
  }
}

uint64_t pm_samples_get(uint64_t a1, unsigned int a2)
{
  if ((a2 & 0x80000000) != 0 || *(_DWORD *)a1 <= (signed int)a2) {
    return 0;
  }
  else {
    return *(void *)(a1 + 16) + 440 * a2;
  }
}

void *pm_samples_to_array_version(unsigned int *a1, void *__dst)
{
  return memcpy(__dst, *((const void **)a1 + 2), 440 * *a1);
}

void *pm_samples_to_array(unsigned int *a1, void *__dst)
{
  return memcpy(__dst, *((const void **)a1 + 2), 440 * *a1);
}

uint64_t pm_samples_sample_version(uint64_t a1)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  if (!dword_26AD528E8) {
    sub_2215337F4();
  }
  unint64_t v2 = 0;
  uint64_t v3 = *(void *)(a1 + 8);
  *(_OWORD *)task_list = 0u;
  long long v22 = 0u;
  uint64_t v4 = task_listCnt;
  uint64_t v5 = task_list;
  do
  {
    mach_error_t v6 = processor_set_tasks_with_flavor(dword_26AD528EC[v2], 2u, v5, v4);
    if (v6) {
      sub_221533850(v6);
    }
    ++v2;
    uint64_t v7 = dword_26AD528E8;
    ++v4;
    ++v5;
  }
  while (v2 < dword_26AD528E8);
  uint64_t v8 = 0;
  if (dword_26AD528E8)
  {
    uint64_t v9 = task_listCnt;
    do
    {
      int v10 = *v9++;
      uint64_t v8 = (v10 + v8);
      --v7;
    }
    while (v7);
  }
  if (*(_DWORD *)(a1 + 4) < (int)v8)
  {
    CFNumberRef v11 = *(void **)(a1 + 16);
    if (v11) {
      free(v11);
    }
    size_t v12 = *(void **)(a1 + 24);
    if (v12 && *(_DWORD *)(a1 + 4)) {
      free(v12);
    }
    CFRange v13 = malloc_type_malloc(440 * (int)v8, 0x10800403F4B461DuLL);
    *(void *)(a1 + 16) = v13;
    if (!v13) {
      sub_221533820();
    }
    if (*(void *)(a1 + 24))
    {
      v14 = malloc_type_malloc(4 * (int)v8, 0x100004052888210uLL);
      *(void *)(a1 + 24) = v14;
      if (!v14) {
        sub_221533820();
      }
    }
    *(_DWORD *)(a1 + 4) = v8;
  }
  mach_absolute_time();
  if (dword_26AD528E8)
  {
    unint64_t v15 = 0;
    int v16 = 0;
    do
    {
      if (task_listCnt[v15])
      {
        unint64_t v17 = 0;
        do
        {
          if ((pm_sample_task_version(task_list[v15][v17]) & 0x80000000) != 0)
          {
            *(_DWORD *)(*(void *)(a1 + 16) + 440 * v16) = -1;
            uint64_t v8 = (v8 - 1);
            mach_port_deallocate(*MEMORY[0x263EF8960], task_list[v15][v17]);
          }
          else
          {
            uint64_t v18 = *(void *)(a1 + 24);
            if (v18)
            {
              *(_DWORD *)(v18 + 4 * v16) = task_list[v15][v17];
              *(void *)(*(void *)(a1 + 16) + 440 * v16 + 400) = v18 + 4 * v16;
            }
            else
            {
              mach_port_deallocate(*MEMORY[0x263EF8960], task_list[v15][v17]);
            }
            ++v16;
          }
          ++v17;
          unint64_t v19 = task_listCnt[v15];
        }
        while (v17 < v19);
      }
      else
      {
        unint64_t v19 = 0;
      }
      mach_vm_deallocate(*MEMORY[0x263EF8960], (mach_vm_address_t)task_list[v15++], 4 * v19);
    }
    while (v15 < dword_26AD528E8);
  }
  qsort_b(*(void **)(a1 + 16), (int)v8, 0x1B8uLL, &unk_26D39BA60);
  if ((v3 & 8) != 0) {
    sub_22153241C(*(void *)(a1 + 16), v8);
  }
  *(_DWORD *)a1 = v8;
  return v8;
}

uint64_t pm_samples_sample(uint64_t a1)
{
  return pm_samples_sample_version(a1);
}

void *pm_samples_copy_version(uint64_t a1, const void **a2)
{
  int v4 = *(_DWORD *)a2;
  int v5 = *(_DWORD *)(a1 + 4);
  mach_error_t v6 = *(void **)(a1 + 16);
  if (*(_DWORD *)a2 > v5)
  {
    mach_error_t v6 = malloc_type_realloc(v6, 440 * v4, 0x10800403F4B461DuLL);
    *(void *)(a1 + 16) = v6;
    if (!v6) {
      sub_22153388C();
    }
    int v4 = *(_DWORD *)a2;
    *(_DWORD *)(a1 + 4) = *(_DWORD *)a2;
  }
  uint64_t result = memcpy(v6, a2[2], 440 * v4);
  *(_DWORD *)a1 = *(_DWORD *)a2;
  return result;
}

int *pm_samples_delta_version(int *result, uint64_t a2, uint64_t a3)
{
  int v3 = *result;
  int v4 = *(_DWORD *)(a3 + 4);
  if (v4 < 0) {
    sub_2215338B8();
  }
  uint64_t v7 = result;
  int v8 = *result;
  if (v3 > v4)
  {
    uint64_t result = (int *)malloc_type_realloc(*(void **)(a3 + 16), 440 * v3, 0x10800403F4B461DuLL);
    *(void *)(a3 + 16) = result;
    if (!result) {
      sub_2215338E4();
    }
    *(_DWORD *)(a3 + 4) = v3;
    int v8 = *v7;
  }
  if (v8 >= 1)
  {
    int v9 = 0;
    int v10 = 0;
    do
    {
      uint64_t v11 = *((void *)v7 + 2);
      if (v9 < *(_DWORD *)a2
        && (result = (int *)(v11 + 440 * v10), int v12 = *(_DWORD *)(*(void *)(a2 + 16) + 440 * v9), *result >= v12))
      {
        if (*result == v12)
        {
          uint64_t result = (int *)pm_task_subtract_version();
          ++v10;
        }
        ++v9;
      }
      else
      {
        uint64_t result = (int *)memcpy((void *)(*(void *)(a3 + 16) + 440 * v10), (const void *)(v11 + 440 * v10), 0x1B8uLL);
        ++v10;
      }
    }
    while (v10 < *v7);
  }
  *(_DWORD *)a3 = v3;
  return result;
}

int *pm_samples_delta(int *result, uint64_t a2, uint64_t a3)
{
  return pm_samples_delta_version(result, a2, a3);
}

uint64_t sub_22153378C(uint64_t a1, int *a2, _DWORD *a3)
{
  int v3 = *a2;
  int v4 = *a2 - *a3;
  if (*a3 == -1) {
    int v4 = -1;
  }
  if (v3 == -1) {
    unsigned int v5 = 1;
  }
  else {
    unsigned int v5 = v4;
  }
  if (v3 == *a3) {
    return 0;
  }
  else {
    return v5;
  }
}

void sub_2215337B8(mach_error_t a1)
{
  host_priv_t v1 = (FILE *)*MEMORY[0x263EF8348];
  unint64_t v2 = mach_error_string(a1);
  fprintf(v1, "Error in host_processor_set_priv(): %s", v2);
  abort();
}

void sub_2215337F4()
{
}

void sub_221533820()
{
}

void sub_221533850(mach_error_t a1)
{
  host_priv_t v1 = (FILE *)*MEMORY[0x263EF8348];
  unint64_t v2 = mach_error_string(a1);
  fprintf(v1, "Error in processor_set_tasks_with_flavor(): %s", v2);
  abort();
}

void sub_22153388C()
{
}

void sub_2215338B8()
{
  __assert_rtn("pm_samples_delta_version", "pmsample.c", 469, "delta_samp->max_tasks>=0");
}

void sub_2215338E4()
{
}

CFDataRef CFDataCreate(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length)
{
  return (CFDataRef)MEMORY[0x270EE47C8](allocator, bytes, length);
}

const UInt8 *__cdecl CFDataGetBytePtr(CFDataRef theData)
{
  return (const UInt8 *)MEMORY[0x270EE4808](theData);
}

void CFDataGetBytes(CFDataRef theData, CFRange range, UInt8 *buffer)
{
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x270EE4920](allocator, capacity, keyCallBacks, valueCallBacks);
}

CFIndex CFDictionaryGetCount(CFDictionaryRef theDict)
{
  return MEMORY[0x270EE4930](theDict);
}

void CFDictionaryGetKeysAndValues(CFDictionaryRef theDict, const void **keys, const void **values)
{
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x270EE4958](theDict, key);
}

void CFDictionaryRemoveValue(CFMutableDictionaryRef theDict, const void *key)
{
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

CFNumberRef CFNumberCreate(CFAllocatorRef allocator, CFNumberType theType, const void *valuePtr)
{
  return (CFNumberRef)MEMORY[0x270EE4BE8](allocator, theType, valuePtr);
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return MEMORY[0x270EE4C70](number, theType, valuePtr);
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x270EE4E10](cf);
}

uint64_t NStatManagerAddAllTCP()
{
  return MEMORY[0x270F4DCE8]();
}

uint64_t NStatManagerAddAllUDP()
{
  return MEMORY[0x270F4DCF0]();
}

uint64_t NStatManagerCreate()
{
  return MEMORY[0x270F4DCF8]();
}

uint64_t NStatManagerQueryAllSources()
{
  return MEMORY[0x270F4DD08]();
}

uint64_t NStatSourceCopyCounts()
{
  return MEMORY[0x270F4DD10]();
}

uint64_t NStatSourceCopyProperties()
{
  return MEMORY[0x270F4DD18]();
}

uint64_t NStatSourceQueryDescription()
{
  return MEMORY[0x270F4DD28]();
}

uint64_t NStatSourceSetCountsBlock()
{
  return MEMORY[0x270F4DD38]();
}

uint64_t NStatSourceSetDescriptionBlock()
{
  return MEMORY[0x270F4DD40]();
}

uint64_t NStatSourceSetRemovedBlock()
{
  return MEMORY[0x270F4DD48]();
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
}

int *__error(void)
{
  return (int *)MEMORY[0x270ED7DC0]();
}

uint64_t __strlcpy_chk()
{
  return MEMORY[0x270ED7EE0]();
}

void abort(void)
{
}

void bzero(void *a1, size_t a2)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x270ED9460](label, attr);
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x270ED94B8](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x270ED94C8](dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x270ED94D0](dsema, timeout);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return MEMORY[0x270ED9A08](a1, a2);
}

void free(void *a1)
{
}

size_t fwrite(const void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x270ED9B88](__ptr, __size, __nitems, __stream);
}

uid_t geteuid(void)
{
  return MEMORY[0x270ED9BF0]();
}

kern_return_t host_processor_set_priv(host_priv_t host_priv, processor_set_name_t set_name, processor_set_t *set)
{
  return MEMORY[0x270ED9E30](*(void *)&host_priv, *(void *)&set_name, set);
}

kern_return_t host_processor_sets(host_priv_t host_priv, processor_set_name_array_t *processor_sets, mach_msg_type_number_t *processor_setsCnt)
{
  return MEMORY[0x270ED9E38](*(void *)&host_priv, processor_sets, processor_setsCnt);
}

uint64_t mach_absolute_time(void)
{
  return MEMORY[0x270EDA138]();
}

char *__cdecl mach_error_string(mach_error_t error_value)
{
  return (char *)MEMORY[0x270EDA168](*(void *)&error_value);
}

mach_port_t mach_host_self(void)
{
  return MEMORY[0x270EDA178]();
}

kern_return_t mach_port_deallocate(ipc_space_t task, mach_port_name_t name)
{
  return MEMORY[0x270EDA1C8](*(void *)&task, *(void *)&name);
}

kern_return_t mach_vm_deallocate(vm_map_t target, mach_vm_address_t address, mach_vm_size_t size)
{
  return MEMORY[0x270EDA298](*(void *)&target, address, size);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA390](size, type_id);
}

void *__cdecl malloc_type_realloc(void *ptr, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA3A0](ptr, size, type_id);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x270EDA470](__dst, __src, __n);
}

kern_return_t pid_for_task(mach_port_name_t t, int *x)
{
  return MEMORY[0x270EDAC18](*(void *)&t, x);
}

uint64_t pm_task_subtract_version()
{
  return MEMORY[0x270F9ABF0]();
}

int proc_pid_rusage(int pid, int flavor, rusage_info_t *buffer)
{
  return MEMORY[0x270EDAD68](*(void *)&pid, *(void *)&flavor, buffer);
}

int proc_pidpath(int pid, void *buffer, uint32_t buffersize)
{
  return MEMORY[0x270EDAD88](*(void *)&pid, buffer, *(void *)&buffersize);
}

kern_return_t processor_set_tasks_with_flavor(processor_set_t processor_set, mach_task_flavor_t flavor, task_array_t *task_list, mach_msg_type_number_t *task_listCnt)
{
  return MEMORY[0x270EDADE8](*(void *)&processor_set, *(void *)&flavor, task_list, task_listCnt);
}

void qsort_b(void *__base, size_t __nel, size_t __width, void *__compar)
{
}

char *__cdecl strrchr(char *__s, int __c)
{
  return (char *)MEMORY[0x270EDB680](__s, *(void *)&__c);
}

kern_return_t task_info(task_name_t target_task, task_flavor_t flavor, task_info_t task_info_out, mach_msg_type_number_t *task_info_outCnt)
{
  return MEMORY[0x270EDB868](*(void *)&target_task, *(void *)&flavor, task_info_out, task_info_outCnt);
}

kern_return_t task_name_for_pid(mach_port_name_t target_tport, int pid, mach_port_name_t *tn)
{
  return MEMORY[0x270EDB878](*(void *)&target_tport, *(void *)&pid, tn);
}