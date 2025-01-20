void power_set_handler(NSObject *a1, void *refcon)
{
  io_object_t notifier;

  if (qword_45C0) {
    sub_2E14();
  }
  notifier = 0;
  dword_45C8 = IORegisterForSystemPower(refcon, (IONotificationPortRef *)&qword_45C0, (IOServiceInterestCallback)sub_DE0, &notifier);
  if (!dword_45C8) {
    sub_2E14();
  }
  IONotificationPortSetDispatchQueue((IONotificationPortRef)qword_45C0, a1);
}

void sub_DE0(uint64_t (*a1)(uint64_t, uint64_t, int *, uint64_t *, void **), uint64_t a2, int a3, intptr_t a4)
{
  int v10 = 0;
  v8 = 0;
  uint64_t v9 = 0;
  switch(a3)
  {
    case -536870288:
      v6 = (void *)a1(3758097008, 0, &v10, &v9, &v8);
      v5 = v6;
      if (!v6) {
        goto LABEL_8;
      }
      string_ptr = xpc_string_get_string_ptr(v6);
      if (!string_ptr || strcmp(string_ptr, "CancelSleep")) {
        goto LABEL_8;
      }
      if (IOCancelPowerChange(dword_45C8, a4)) {
LABEL_9:
      }
        _os_assumes_log();
      break;
    case -536870144:
      v5 = (void *)a1(3758097152, 31, &v10, &v9, &v8);
      break;
    case -536870272:
      v5 = (void *)a1(3758097024, 0, &v10, &v9, &v8);
LABEL_8:
      if (!IOAllowPowerChange(dword_45C8, a4)) {
        break;
      }
      goto LABEL_9;
    default:
      goto LABEL_13;
  }
  if (v5) {
    xpc_release(v5);
  }
LABEL_13:
  free(v8);
}

uint64_t power_is_ac()
{
  return _IOPSDrawingUnlimitedPower();
}

uint64_t sub_F20(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v3 = *(void *)(a2 + 32);
  unint64_t v4 = *(void *)(a3 + 32);
  BOOL v5 = v3 > v4;
  if (v3 >= v4) {
    unsigned int v6 = 0;
  }
  else {
    unsigned int v6 = -1;
  }
  if (v5) {
    return 1;
  }
  else {
    return v6;
  }
}

uint64_t sub_F38(uint64_t a1, uint64_t a2, unint64_t *a3)
{
  unint64_t v3 = *(void *)(a2 + 32);
  BOOL v4 = v3 > *a3;
  if (v3 >= *a3) {
    unsigned int v5 = 0;
  }
  else {
    unsigned int v5 = -1;
  }
  if (v4) {
    return 1;
  }
  else {
    return v5;
  }
}

void init_alarm_module(uint64_t a1)
{
  qword_45D0 = a1;
  xpc_event_provider_create();
}

void sub_1128(uint64_t a1, uint64_t a2, void *a3)
{
  if (a1 == 2)
  {
    v13 = (void **)sub_2268(a2, 0);
    if (v13)
    {
      v14 = v13;
      v15 = qword_45E8;
      if (os_log_type_enabled((os_log_t)qword_45E8, OS_LOG_TYPE_INFO))
      {
        v16 = (const char *)v14[2];
        if (!v16) {
          v16 = "NULL";
        }
        *(_DWORD *)buf = 136446466;
        *(void *)&buf[4] = v16;
        *(_WORD *)&buf[12] = 2048;
        *(void *)&buf[14] = a2;
        _os_log_impl(&dword_0, v15, OS_LOG_TYPE_INFO, "Received request to remove alarm \"%{public}s\" with token %llu\n", buf, 0x16u);
      }
      free(v14[2]);
      free(v14);
    }
    else
    {
      sub_2F64(a2);
    }
    goto LABEL_15;
  }
  if (a1 == 1)
  {
    unsigned int v5 = malloc_type_calloc(1uLL, 0x48uLL, 0x1090040BA257DB1uLL);
    uint64_t v6 = qword_45B8++;
    void *v5 = a2;
    v5[1] = v6;
    xpc_object_t value = xpc_dictionary_get_value(a3, "Date");
    if (!value)
    {
      if (os_log_type_enabled((os_log_t)qword_45E8, OS_LOG_TYPE_ERROR)) {
        sub_2E30();
      }
      goto LABEL_43;
    }
    v8 = value;
    string = xpc_dictionary_get_string(a3, "Type");
    if (string) {
      int v10 = string;
    }
    else {
      int v10 = "Walltime";
    }
    xpc_object_t v11 = xpc_dictionary_get_value(a3, "ShouldWake");
    if (v11) {
      BOOL v12 = xpc_BOOL_get_value(v11);
    }
    else {
      BOOL v12 = 1;
    }
    *((unsigned char *)v5 + 25) = v12;
    if (!strcasecmp(v10, "Walltime") && xpc_get_type(v8) == (xpc_type_t)&_xpc_type_date)
    {
      *((_DWORD *)v5 + 7) = 0;
      uint64_t v20 = xpc_date_get_value(v8);
    }
    else
    {
      if (!strcasecmp(v10, "Uptime") && xpc_get_type(v8) == (xpc_type_t)&_xpc_type_uint64)
      {
        *((_DWORD *)v5 + 7) = 1;
        v5[4] = xpc_uint64_get_value(v8);
        *((unsigned char *)v5 + 25) = 0;
LABEL_34:
        *((unsigned char *)v5 + 24) = xpc_dictionary_get_BOOL(a3, "UserVisible");
        long long v39 = 0u;
        long long v40 = 0u;
        long long v37 = 0u;
        long long v38 = 0u;
        long long v35 = 0u;
        long long v36 = 0u;
        memset(buf, 0, sizeof(buf));
        if (!xpc_get_event_name())
        {
          v29 = qword_45E8;
          if (os_log_type_enabled((os_log_t)qword_45E8, OS_LOG_TYPE_ERROR)) {
            sub_2E64(a2, v29);
          }
          goto LABEL_43;
        }
        v21 = strdup((const char *)buf);
        v5[2] = v21;
        v22 = qword_45E8;
        if (os_log_type_enabled((os_log_t)qword_45E8, OS_LOG_TYPE_DEFAULT))
        {
          __uint64_t v23 = sub_2118(*((unsigned int *)v5 + 7));
          __uint64_t v24 = v5[4];
          unint64_t v25 = (v24 - v23) / 0x3B9ACA00;
          BOOL v26 = v23 > v24;
          unint64_t v27 = (v23 - v24) / 0x3B9ACA00;
          if (v26) {
            unint64_t v28 = -(uint64_t)v27;
          }
          else {
            unint64_t v28 = v25;
          }
          int v30 = 136446466;
          v31 = v21;
          __int16 v32 = 2048;
          unint64_t v33 = v28;
          _os_log_impl(&dword_0, v22, OS_LOG_TYPE_DEFAULT, "Registering job \"%{public}s\" due in %lld seconds.", (uint8_t *)&v30, 0x16u);
        }
        sub_2190((uint64_t)v5);
        goto LABEL_15;
      }
      if (strcasecmp(v10, "Monotonic") || xpc_get_type(v8) != (xpc_type_t)&_xpc_type_uint64)
      {
        v18 = xpc_copy_description(v8);
        v19 = qword_45E8;
        if (os_log_type_enabled((os_log_t)qword_45E8, OS_LOG_TYPE_ERROR)) {
          sub_2EDC((uint64_t)v10, (uint64_t)v18, v19);
        }
        free(v18);
LABEL_43:
        free(v5);
        return;
      }
      *((_DWORD *)v5 + 7) = 2;
      uint64_t v20 = xpc_uint64_get_value(v8);
    }
    v5[4] = v20;
    goto LABEL_34;
  }
LABEL_15:
  __uint64_t v17 = 0;
  do
  {
    sub_1530(v17, 0);
    __uint64_t v17 = (v17 + 1);
  }
  while (v17 != 3);
}

void sub_1524(uint64_t a1)
{
}

void sub_1530(__uint64_t a1, int a2)
{
  uint64_t v4 = a1;
  unsigned int v5 = (rb_tree_t *)((char *)&unk_45F0 + 64 * (unint64_t)a1);
  if (rb_tree_count(v5))
  {
    uint64_t v49 = v4;
    int v48 = a1;
    __uint64_t v51 = sub_2118(a1);
    node_leq = (const char **)rb_tree_find_node_leq(v5, &v51);
    v50 = node_leq;
    if (node_leq)
    {
      v7 = 0;
      do
      {
        if (!*((unsigned char *)node_leq + 40))
        {
          v8 = qword_45E8;
          if (os_log_type_enabled((os_log_t)qword_45E8, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v9 = node_leq[2];
            int v10 = node_leq[4];
            __uint64_t v11 = sub_2118(*((unsigned int *)node_leq + 7));
            unint64_t v12 = (v11 - (unint64_t)v10) / 0x3B9ACA00;
            *(_DWORD *)buf = 136446466;
            *(void *)&buf[4] = v9;
            if ((unint64_t)v10 > v11) {
              unint64_t v12 = -(uint64_t)((unint64_t)&v10[-v11] / 0x3B9ACA00);
            }
            *(_WORD *)&buf[12] = 2048;
            *(void *)&buf[14] = v12;
            _os_log_impl(&dword_0, v8, OS_LOG_TYPE_DEFAULT, "Firing event \"%{public}s\" which was due %lld sec ago.", buf, 0x16u);
          }
          *((unsigned char *)node_leq + 40) = 1;
          v14 = *node_leq;
          v13 = node_leq[1];
          v15 = strdup(node_leq[2]);
          AssertionID[0] = 0;
          CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
          if (Mutable)
          {
            __uint64_t v17 = Mutable;
            v18 = CFStringCreateWithCString(0, v15, 0x8000100u);
            if (v18)
            {
              CFDictionarySetValue(v17, @"AssertName", v18);
              CFRelease(v18);
              CFDictionarySetValue(v17, @"PlugInBundleID", @"com.apple.alarm");
              CFDictionarySetValue(v17, @"AssertType", @"PreventUserIdleSystemSleep");
              CFDictionarySetValue(v17, @"TimeoutAction", @"TimeoutActionTurnOff");
              LODWORD(valuePtr[0]) = 30;
              v18 = CFNumberCreate(0, kCFNumberIntType, valuePtr);
              if (v18)
              {
                CFDictionarySetValue(v17, @"TimeoutSeconds", v18);
                CFRelease(v18);
                LODWORD(valuePtr[0]) = 255;
                v18 = CFNumberCreate(0, kCFNumberIntType, valuePtr);
                if (v18)
                {
                  CFDictionarySetValue(v17, @"AssertLevel", v18);
                  CFRelease(v18);
                  LODWORD(v18) = IOPMAssertionCreateWithProperties(v17, AssertionID);
                  if (v18) {
                    AssertionID[0] = 0;
                  }
                }
              }
            }
            v19 = qword_45E8;
            if (os_log_type_enabled((os_log_t)qword_45E8, OS_LOG_TYPE_INFO))
            {
              v61[0] = 136315650;
              *(void *)&v61[1] = v15;
              __int16 v62 = 1024;
              int v63 = (int)v18;
              __int16 v64 = 1024;
              IOPMAssertionID v65 = AssertionID[0];
              _os_log_impl(&dword_0, v19, OS_LOG_TYPE_INFO, "power_create_temporary_fire_assertion: name %s, ret: %x, id: %d", (uint8_t *)v61, 0x18u);
            }
            CFRelease(v17);
            IOPMAssertionID v20 = AssertionID[0];
          }
          else
          {
            IOPMAssertionID v20 = 0;
          }
          *(void *)buf = _NSConcreteStackBlock;
          *(void *)&buf[8] = 0x40000000;
          *(void *)&buf[16] = sub_23A0;
          v56 = &unk_42C8;
          IOPMAssertionID v60 = v20;
          v57 = v14;
          v58 = v13;
          v59 = v15;
          valuePtr[0] = 0;
          valuePtr[1] = valuePtr;
          valuePtr[2] = 0x2000000000;
          char v54 = 0;
          xpc_event_provider_get_queue();
        }
        if (a2 && *((unsigned char *)node_leq + 25)) {
          v7 = node_leq;
        }
        node_leq = (const char **)rb_tree_iterate(v5, node_leq, 0);
      }
      while (node_leq);
      node_leq = v50;
      if (v7)
      {
        v21 = qword_45E8;
        if (os_log_type_enabled((os_log_t)qword_45E8, OS_LOG_TYPE_DEFAULT))
        {
          v22 = v7[2];
          __uint64_t v23 = v7[4];
          *(_DWORD *)buf = 136446466;
          *(void *)&buf[4] = v22;
          *(_WORD *)&buf[12] = 2048;
          *(void *)&buf[14] = v23;
          _os_log_impl(&dword_0, v21, OS_LOG_TYPE_DEFAULT, "System woke up due to \"%{public}s\" which was due at: %lld", buf, 0x16u);
        }
      }
    }
    __uint64_t v24 = rb_tree_iterate(v5, node_leq, 1u);
    if (v24)
    {
      unint64_t v25 = v24;
      do
      {
        if (*((unsigned char *)v25 + 40))
        {
          BOOL v26 = qword_45E8;
          if (os_log_type_enabled((os_log_t)qword_45E8, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v27 = v25[2];
            unint64_t v28 = v25[4];
            __uint64_t v29 = sub_2118(*((unsigned int *)v25 + 7));
            unint64_t v30 = (v29 - v28) / 0x3B9ACA00;
            *(_DWORD *)buf = 136446466;
            *(void *)&buf[4] = v27;
            if (v28 > v29) {
              unint64_t v30 = -(uint64_t)((v28 - v29) / 0x3B9ACA00);
            }
            *(_WORD *)&buf[12] = 2048;
            *(void *)&buf[14] = v30;
            _os_log_impl(&dword_0, v26, OS_LOG_TYPE_DEFAULT, "Un-firing event \"%{public}s\" which is due in %lld sec.", buf, 0x16u);
          }
          *((unsigned char *)v25 + 40) = 0;
        }
        unint64_t v25 = rb_tree_iterate(v5, v25, 1u);
      }
      while (v25);
    }
    v31 = rb_tree_iterate(v5, v50, 1u);
    if (!v31)
    {
      dispatch_source_set_timer(qword_46B0[v49], 0xFFFFFFFFFFFFFFFFLL, 0, 0);
      uint64_t v47 = qword_45E8;
      if (!os_log_type_enabled((os_log_t)qword_45E8, OS_LOG_TYPE_INFO)) {
        return;
      }
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&buf[4] = v48;
      v43 = "Clearing dispatch timer of type %d";
      v44 = v47;
      uint32_t v45 = 8;
      goto LABEL_54;
    }
    unint64_t v33 = v31;
    unint64_t v34 = v31[4];
    __uint64_t v35 = v51;
    int64_t v36 = v34 - v51;
    if ((((v34 - __PAIR128__(v32, v51)) >> 64) & 1) != (v34 - v51) >> 63)
    {
      long long v37 = qword_45E8;
      if (os_log_type_enabled((os_log_t)qword_45E8, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_0, v37, OS_LOG_TYPE_ERROR, "Detected subtraction overflow while setting dispatch timer.", buf, 2u);
        unint64_t v34 = v33[4];
        __uint64_t v35 = v51;
      }
      if (v34 > v35) {
        int64_t v36 = 0x7FFFFFFFFFFFFFFFLL;
      }
      else {
        int64_t v36 = 0x8000000000000000;
      }
    }
    dispatch_time_t v38 = dispatch_time(qword_36D0[v49], v36);
    dispatch_source_set_timer(qword_46B0[v49], v38, 0xFFFFFFFFFFFFFFFFLL, 0xB2D05E00uLL);
    uint64_t v39 = qword_45E8;
    if (os_log_type_enabled((os_log_t)qword_45E8, OS_LOG_TYPE_INFO))
    {
      uint64_t v40 = v33[2];
      unint64_t v41 = v33[4];
      if (v51 > v41) {
        unint64_t v42 = -(uint64_t)((v51 - v41) / 0x3B9ACA00);
      }
      else {
        unint64_t v42 = (v41 - v51) / 0x3B9ACA00;
      }
      *(_DWORD *)buf = 136446466;
      *(void *)&buf[4] = v40;
      *(_WORD *)&buf[12] = 2048;
      *(void *)&buf[14] = v42;
      v43 = "Setting timer for \"%{public}s\" in %lld seconds.";
      v44 = v39;
      uint32_t v45 = 22;
LABEL_54:
      _os_log_impl(&dword_0, v44, OS_LOG_TYPE_INFO, v43, buf, v45);
    }
  }
  else
  {
    v46 = qword_46B0[v4];
    dispatch_source_set_timer(v46, 0xFFFFFFFFFFFFFFFFLL, 0, 0);
  }
}

unint64_t *sub_1D58(int a1, int a2)
{
  uint64_t v4 = qword_45E8;
  if (os_log_type_enabled((os_log_t)qword_45E8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109376;
    LODWORD(v21[0]) = a1;
    WORD2(v21[0]) = 1024;
    *(_DWORD *)((char *)v21 + 6) = a2;
    _os_log_impl(&dword_0, v4, OS_LOG_TYPE_INFO, "power_event, msg: %u caps: %u", buf, 0xEu);
  }
  __uint64_t v5 = 0;
  do
  {
    sub_1530(v5, a1 == -536870144);
    __uint64_t v5 = (v5 + 1);
  }
  while (v5 != 3);
  if (a1 == -536870288)
  {
    uint64_t v6 = 0;
    char v7 = 0;
    do
    {
      v8 = rb_tree_iterate((rb_tree_t *)&unk_45F0 + v6, 0, 0);
      if (v8)
      {
        uint64_t v9 = v8;
        while (!*((unsigned char *)v9 + 40))
        {
          uint64_t v9 = rb_tree_iterate((rb_tree_t *)&unk_45F0 + v6, v9, 0);
          if (!v9) {
            goto LABEL_18;
          }
        }
        int v10 = qword_45E8;
        if (os_log_type_enabled((os_log_t)qword_45E8, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v11 = *((void *)v9 + 2);
          *(_DWORD *)buf = 136446210;
          v21[0] = v11;
          _os_log_impl(&dword_0, v10, OS_LOG_TYPE_DEFAULT, "Alarm event \"%{public}s\" is fired and active.", buf, 0xCu);
        }
        char v7 = 1;
      }
LABEL_18:
      ++v6;
    }
    while (v6 != 3);
    if (v7) {
      return (unint64_t *)xpc_string_create("CancelSleep");
    }
  }
  else if (a1 != -536870080 || (IOPMIsASleep() & 1) == 0)
  {
    return 0;
  }
  double v13 = CFAbsoluteTimeGetCurrent() + 30.0;
  if (*(double *)&qword_46C8 >= v13)
  {
    CFDateRef v14 = CFDateCreate(0, *(CFAbsoluteTime *)&qword_46C8);
    if (IOPMCancelScheduledPowerEvent(v14, (CFStringRef)qword_46D0, @"wake")
      && os_log_type_enabled((os_log_t)qword_45E8, OS_LOG_TYPE_ERROR))
    {
      sub_3088();
      if (!v14) {
        goto LABEL_26;
      }
    }
    else if (!v14)
    {
LABEL_26:
      qword_46C8 = 0;
      if (qword_46D0) {
        CFRelease((CFTypeRef)qword_46D0);
      }
      qword_46D0 = 0;
      goto LABEL_29;
    }
    CFRelease(v14);
    goto LABEL_26;
  }
LABEL_29:
  if (*(double *)&qword_46D8 < v13) {
    goto LABEL_38;
  }
  CFDateRef v15 = CFDateCreate(0, *(CFAbsoluteTime *)&qword_46D8);
  IOReturn v16 = IOPMCancelScheduledPowerEvent(v15, (CFStringRef)qword_46E0, @"wake");
  if (v16 && (v16 & 0xE00002F0) == 0 && os_log_type_enabled((os_log_t)qword_45E8, OS_LOG_TYPE_ERROR))
  {
    sub_300C();
    if (!v15) {
      goto LABEL_35;
    }
    goto LABEL_34;
  }
  if (v15) {
LABEL_34:
  }
    CFRelease(v15);
LABEL_35:
  qword_46D8 = 0;
  if (qword_46E0) {
    CFRelease((CFTypeRef)qword_46E0);
  }
  qword_46E0 = 0;
LABEL_38:
  __uint64_t v17 = sub_2764(0);
  if (v17)
  {
    v18 = v17;
    sub_2840((uint64_t)v17);
    if (!*((unsigned char *)v18 + 24))
    {
      result = sub_2764(1);
      if (!result) {
        return result;
      }
      sub_2840((uint64_t)result);
    }
  }
  else
  {
    v19 = qword_45E8;
    if (os_log_type_enabled((os_log_t)qword_45E8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_0, v19, OS_LOG_TYPE_INFO, "No upcoming events, not scheduling wake.", buf, 2u);
    }
  }
  return 0;
}

void sub_20E0()
{
  __uint64_t v0 = 0;
  do
  {
    sub_1530(v0, 0);
    __uint64_t v0 = (v0 + 1);
  }
  while (v0 != 3);
}

__uint64_t sub_2118(__uint64_t result)
{
  switch(result)
  {
    case 2:
      clockid_t v4 = _CLOCK_MONOTONIC_RAW;
      return clock_gettime_nsec_np(v4);
    case 1:
      clockid_t v4 = _CLOCK_UPTIME_RAW;
      return clock_gettime_nsec_np(v4);
    case 0:
      xpc_object_t v2 = xpc_date_create_from_current();
      int64_t value = xpc_date_get_value(v2);
      xpc_release(v2);
      return value;
  }
  return result;
}

void *sub_2190(uint64_t a1)
{
  xpc_object_t v2 = qword_45E8;
  if (os_log_type_enabled((os_log_t)qword_45E8, OS_LOG_TYPE_INFO))
  {
    uint64_t v3 = *(void *)(a1 + 16);
    int v6 = 136446210;
    uint64_t v7 = v3;
    _os_log_impl(&dword_0, v2, OS_LOG_TYPE_INFO, "Adding alarm \"%{public}s\"", (uint8_t *)&v6, 0xCu);
  }
  for (uint64_t i = *(unsigned int *)(a1 + 28); ; uint64_t i = *(unsigned int *)(a1 + 28))
  {
    result = rb_tree_insert_node((rb_tree_t *)&unk_45F0 + i, (void *)a1);
    if (result == (void *)a1) {
      break;
    }
    --*(void *)(a1 + 32);
  }
  return result;
}

void *sub_2268(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = 0;
  while (1)
  {
    __uint64_t v5 = rb_tree_iterate((rb_tree_t *)&unk_45F0 + v4, 0, 1u);
    if (v5) {
      break;
    }
LABEL_8:
    if (++v4 == 3) {
      return 0;
    }
  }
  int v6 = v5;
  while (*v6 != a1 || a2 && v6[1] != a2)
  {
    int v6 = rb_tree_iterate((rb_tree_t *)&unk_45F0 + v4, v6, 1u);
    if (!v6) {
      goto LABEL_8;
    }
  }
  uint64_t v7 = qword_45E8;
  if (os_log_type_enabled((os_log_t)qword_45E8, OS_LOG_TYPE_INFO))
  {
    uint64_t v8 = v6[2];
    int v10 = 136446210;
    uint64_t v11 = v8;
    _os_log_impl(&dword_0, v7, OS_LOG_TYPE_INFO, "Removing alarm \"%{public}s\"", (uint8_t *)&v10, 0xCu);
  }
  rb_tree_remove_node((rb_tree_t *)&unk_45F0 + v4, v6);
  return v6;
}

void sub_23A0(uint64_t a1, uint64_t a2, int a3)
{
  IOPMAssertionID v5 = *(_DWORD *)(a1 + 56);
  int v6 = qword_45E8;
  if (os_log_type_enabled((os_log_t)qword_45E8, OS_LOG_TYPE_INFO))
  {
    int v28 = 67109120;
    LODWORD(v29) = v5;
    _os_log_impl(&dword_0, v6, OS_LOG_TYPE_INFO, "release power assertion %d", (uint8_t *)&v28, 8u);
  }
  IOPMAssertionRelease(v5);
  uint64_t v7 = sub_2268(*(void *)(a1 + 32), *(void *)(a1 + 40));
  if (v7)
  {
    uint64_t v8 = (uint64_t)v7;
    int v9 = *((unsigned __int8 *)v7 + 40);
    *((unsigned char *)v7 + 40) = 0;
    __uint64_t v10 = sub_2118(*((unsigned int *)v7 + 7));
    __uint64_t v11 = v10;
    if (*(void *)(v8 + 32) <= v10)
    {
      *(void *)(v8 + 32) = v10 + 60000000000;
      if (v10 >= 0xFFFFFFF207B8A800)
      {
        if (os_log_type_enabled((os_log_t)qword_45E8, OS_LOG_TYPE_ERROR)) {
          sub_3104();
        }
        *(void *)(v8 + 32) = -1;
      }
    }
    sub_2190(v8);
    unint64_t v12 = qword_45E8;
    if (os_log_type_enabled((os_log_t)qword_45E8, OS_LOG_TYPE_INFO))
    {
      double v13 = "fired";
      if (!v9) {
        double v13 = "unfired";
      }
      uint64_t v14 = *(void *)(v8 + 16);
      unint64_t v15 = *(void *)(v8 + 32);
      int v28 = 136315650;
      __uint64_t v29 = v13;
      if (v11 > v15) {
        unint64_t v16 = -(uint64_t)((v11 - v15) / 0x3B9ACA00);
      }
      else {
        unint64_t v16 = (v15 - v11) / 0x3B9ACA00;
      }
      __int16 v30 = 2082;
      uint64_t v31 = v14;
      __int16 v32 = 2048;
      unint64_t v33 = v16;
      _os_log_impl(&dword_0, v12, OS_LOG_TYPE_INFO, "Resetting %s job \"%{public}s\", now due in %lld seconds.", (uint8_t *)&v28, 0x20u);
    }
    uint64_t v17 = 0;
    do
    {
      sub_1530(v17, 0);
      uint64_t v17 = (v17 + 1);
    }
    while (v17 != 3);
    if (a3)
    {
      v18 = qword_45E8;
      if (os_log_type_enabled((os_log_t)qword_45E8, OS_LOG_TYPE_FAULT))
      {
        unint64_t v20 = *(void *)(a1 + 40);
        v19 = *(const char **)(a1 + 48);
        uint64_t v21 = *(void *)(a1 + 32);
        int v22 = *(_DWORD *)(a1 + 56);
        int v28 = 136315906;
        __uint64_t v29 = v19;
        __int16 v30 = 2048;
        uint64_t v31 = v21;
        __int16 v32 = 2048;
        unint64_t v33 = v20;
        __int16 v34 = 1024;
        int v35 = v22;
        _os_log_fault_impl(&dword_0, v18, OS_LOG_TYPE_FAULT, "No reply received for alarm '%s' %lld/%lld with power assertion %d. Client may not have an event stream handler set up, or their event handler's queue may be blocked.", (uint8_t *)&v28, 0x26u);
      }
      goto LABEL_24;
    }
  }
  else if (a3)
  {
    goto LABEL_24;
  }
  __uint64_t v23 = qword_45E8;
  if (os_log_type_enabled((os_log_t)qword_45E8, OS_LOG_TYPE_INFO))
  {
    unint64_t v25 = *(void *)(a1 + 40);
    __uint64_t v24 = *(const char **)(a1 + 48);
    uint64_t v26 = *(void *)(a1 + 32);
    int v27 = *(_DWORD *)(a1 + 56);
    int v28 = 136315906;
    __uint64_t v29 = v24;
    __int16 v30 = 2048;
    uint64_t v31 = v26;
    __int16 v32 = 2048;
    unint64_t v33 = v25;
    __int16 v34 = 1024;
    int v35 = v27;
    _os_log_impl(&dword_0, v23, OS_LOG_TYPE_INFO, "Reply received for alarm '%s' %lld/%lld with power assertion %d.", (uint8_t *)&v28, 0x26u);
  }
LABEL_24:
  free(*(void **)(a1 + 48));
}

uint64_t sub_2698(uint64_t result)
{
  if (!*(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24))
  {
    uint64_t v1 = result;
    result = (*(uint64_t (**)(void))(*(void *)(result + 32) + 16))();
    *(unsigned char *)(*(void *)(*(void *)(v1 + 40) + 8) + 24) = 1;
  }
  return result;
}

void sub_26F0(void *a1)
{
  if (!*(unsigned char *)(*(void *)(a1[6] + 8) + 24))
  {
    (*(void (**)(void))(a1[4] + 16))();
    *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = 1;
    xpc_object_t v2 = (void *)a1[5];
    dispatch_block_cancel(v2);
  }
}

unint64_t *sub_2764(int a1)
{
  __uint64_t v2 = 0;
  uint64_t v3 = 0;
  unint64_t v4 = -1;
  do
  {
    if (v2 != 1)
    {
      __uint64_t v9 = 0;
      __uint64_t v9 = sub_2118(v2);
      node_geq = (unint64_t *)rb_tree_find_node_geq((rb_tree_t *)&unk_45F0 + v2, &v9);
      if (node_geq)
      {
        int v6 = node_geq;
        while (!*((unsigned char *)v6 + 25) || a1 && !*((unsigned char *)v6 + 24))
        {
          int v6 = (unint64_t *)rb_tree_iterate((rb_tree_t *)&unk_45F0 + v2, v6, 1u);
          if (!v6) {
            goto LABEL_12;
          }
        }
        unint64_t v7 = sub_2B28(v2, v6[4]);
        if (v7 < v4)
        {
          uint64_t v3 = v6;
          unint64_t v4 = v7;
        }
      }
    }
LABEL_12:
    ++v2;
  }
  while (v2 != 3);
  return v3;
}

void sub_2840(uint64_t a1)
{
  double v2 = (double)(sub_2B28(*(unsigned int *)(a1 + 28), *(void *)(a1 + 32)) / 0x3B9ACA00uLL) + -978307200.0;
  CFDateRef v3 = CFDateCreate(0, v2);
  if (*(unsigned char *)(a1 + 24)) {
    CFBooleanRef v4 = kCFBooleanTrue;
  }
  else {
    CFBooleanRef v4 = kCFBooleanFalse;
  }
  if (v4 == kCFBooleanTrue) {
    CFStringRef v5 = @"com.apple.alarm.user-visible";
  }
  else {
    CFStringRef v5 = @"com.apple.alarm.user-invisible";
  }
  MutableCopy = CFStringCreateMutableCopy(0, 0, v5);
  unint64_t v7 = *(const char **)(a1 + 16);
  if (v7)
  {
    CFStringRef v8 = CFStringCreateWithCString(0, v7, 0x8000100u);
    if (v8)
    {
      CFStringRef v9 = v8;
      CFStringAppend(MutableCopy, @"-");
      CFStringAppend(MutableCopy, v9);
      CFRelease(v9);
    }
  }
  if (v4 == kCFBooleanTrue)
  {
    qword_46D8 = *(void *)&v2;
    __uint64_t v10 = &qword_46E0;
  }
  else
  {
    qword_46C8 = *(void *)&v2;
    __uint64_t v10 = &qword_46D0;
  }
  if (*v10)
  {
    CFRelease((CFTypeRef)*v10);
    *__uint64_t v10 = 0;
  }
  *__uint64_t v10 = (uint64_t)CFRetain(MutableCopy);
  CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(Mutable, @"time", v3);
  CFDictionaryAddValue(Mutable, @"scheduledby", MutableCopy);
  CFDictionaryAddValue(Mutable, @"UserVisible", v4);
  int v12 = IOPMRequestSysWake();
  double v13 = qword_45E8;
  if (v12)
  {
    int v14 = v12;
    if (os_log_type_enabled((os_log_t)qword_45E8, OS_LOG_TYPE_ERROR))
    {
      CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
      uint64_t v16 = *(void *)(a1 + 16);
      int v19 = 134218498;
      double v20 = v2 - Current;
      __int16 v21 = 2082;
      uint64_t v22 = v16;
      __int16 v23 = 1024;
      int v24 = v14;
      _os_log_error_impl(&dword_0, v13, OS_LOG_TYPE_ERROR, "Unable to schedule wake for %.1fs on behalf of \"%{public}s\", IOPMRequestSysWake() returned %d.", (uint8_t *)&v19, 0x1Cu);
    }
  }
  else if (os_log_type_enabled((os_log_t)qword_45E8, OS_LOG_TYPE_INFO))
  {
    CFAbsoluteTime v17 = CFAbsoluteTimeGetCurrent();
    uint64_t v18 = *(void *)(a1 + 16);
    int v19 = 134218242;
    double v20 = v2 - v17;
    __int16 v21 = 2082;
    uint64_t v22 = v18;
    _os_log_impl(&dword_0, v13, OS_LOG_TYPE_INFO, "Scheduled wake for %.1fs on behalf of \"%{public}s\".", (uint8_t *)&v19, 0x16u);
  }
  if (v3) {
    CFRelease(v3);
  }
  if (MutableCopy) {
    CFRelease(MutableCopy);
  }
  if (Mutable) {
    CFRelease(Mutable);
  }
}

uint64_t sub_2B28(__uint64_t a1, unint64_t a2)
{
  if ((a1 - 1) <= 1)
  {
    xpc_object_t v4 = xpc_date_create_from_current();
    int64_t value = xpc_date_get_value(v4);
    xpc_release(v4);
    __uint64_t v6 = sub_2118(a1);
    unint64_t v8 = a2 - v6;
    uint64_t v9 = (uint64_t)(a2 - v6) >> 63;
    if ((((a2 - __PAIR128__(v7, v6)) >> 64) ^ v9))
    {
      __uint64_t v10 = v6;
      if (os_log_type_enabled((os_log_t)qword_45E8, OS_LOG_TYPE_ERROR)) {
        sub_316C();
      }
      if (v10 < a2) {
        unint64_t v8 = 0x7FFFFFFFFFFFFFFFLL;
      }
      else {
        unint64_t v8 = 0x8000000000000000;
      }
      if (v10 < a2) {
        uint64_t v9 = 0;
      }
      else {
        uint64_t v9 = -1;
      }
    }
    uint64_t v11 = v9 << 63 >> 63;
    a2 = value + v8;
    if (__CFADD__(value, v8)) {
      uint64_t v12 = v11 + 1;
    }
    else {
      uint64_t v12 = v11;
    }
    uint64_t v13 = v12 << 63 >> 63;
    if (v13 != v12 || v13 < 0)
    {
      if (os_log_type_enabled((os_log_t)qword_45E8, OS_LOG_TYPE_ERROR)) {
        sub_3138();
      }
      return (uint64_t)~v8 >> 63;
    }
  }
  return a2;
}

void sub_2C1C(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

uint64_t clock_set_handler(dispatch_queue_t queue, uint64_t a2)
{
  int out_token = 0;
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 0x40000000;
  handler[2] = sub_2D6C;
  handler[3] = &unk_4338;
  handler[4] = a2;
  if (notify_register_dispatch("com.apple.system.timezone", &out_token, queue, handler)) {
    _os_assumes_log();
  }
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 0x40000000;
  v5[2] = sub_2D74;
  v5[3] = &unk_4358;
  v5[4] = a2;
  uint64_t result = notify_register_dispatch("com.apple.system.clock_set", &out_token, queue, v5);
  if (result) {
    return _os_assumes_log();
  }
  return result;
}

uint64_t sub_2D6C(uint64_t a1)
{
  return (*(uint64_t (**)(void))(a1 + 32))();
}

uint64_t sub_2D74(uint64_t a1)
{
  return (*(uint64_t (**)(void))(a1 + 32))();
}

double clock_mach_time_dilation()
{
  if (qword_46E8 != -1) {
    dispatch_once(&qword_46E8, &stru_4398);
  }
  return *(double *)&qword_46F0;
}

void sub_2DC0(id a1)
{
  mach_timebase_info info = 0;
  if (mach_timebase_info(&info))
  {
    _os_assumes_log();
    double v3 = 1.0;
  }
  else
  {
    LODWORD(v1) = info.numer;
    LODWORD(v2) = info.denom;
    double v3 = (double)v1 / (double)v2;
  }
  qword_46F0 = *(void *)&v3;
}

void sub_2E14()
{
}

void sub_2E30()
{
  sub_2C50();
  sub_2C1C(&dword_0, v0, v1, "Alarm registration is missing required field Date", v2, v3, v4, v5, v6);
}

void sub_2E64(uint64_t a1, NSObject *a2)
{
  int v2 = 134217984;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_0, a2, OS_LOG_TYPE_ERROR, "Failed to get event name for alarm registration with token %llu", (uint8_t *)&v2, 0xCu);
}

void sub_2EDC(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3 = 136446466;
  uint64_t v4 = a1;
  __int16 v5 = 2082;
  uint64_t v6 = a2;
  _os_log_error_impl(&dword_0, log, OS_LOG_TYPE_ERROR, "Unsupported alarm (Type: \"%{public}s\", Date: \"%{public}s\")", (uint8_t *)&v3, 0x16u);
}

void sub_2F64(uint64_t a1)
{
  _os_assumes_log();
  int v2 = qword_45E8;
  if (os_log_type_enabled((os_log_t)qword_45E8, OS_LOG_TYPE_INFO))
  {
    int v3 = 134217984;
    uint64_t v4 = a1;
    _os_log_impl(&dword_0, v2, OS_LOG_TYPE_INFO, "Received request to remove alarm with token %llu\n", (uint8_t *)&v3, 0xCu);
  }
}

void sub_300C()
{
  sub_2C38();
  _os_log_error_impl(&dword_0, v0, OS_LOG_TYPE_ERROR, "Unable to cancel user-visible wake for %.1f, IOPMCancelScheduledPowerEvent() returned 0x%x.", v1, 0x12u);
}

void sub_3088()
{
  sub_2C38();
  _os_log_error_impl(&dword_0, v0, OS_LOG_TYPE_ERROR, "Unable to cancel wake for %.1f, IOPMCancelScheduledPowerEvent() returned 0x%x.", v1, 0x12u);
}

void sub_3104()
{
  sub_2C50();
  sub_2C1C(&dword_0, v0, v1, "Detected addition overflow while throttling alarm.", v2, v3, v4, v5, v6);
}

void sub_3138()
{
  sub_2C50();
  sub_2C1C(&dword_0, v0, v1, "Detected addition overflow while calculating walltime.", v2, v3, v4, v5, v6);
}

void sub_316C()
{
  sub_2C50();
  sub_2C1C(&dword_0, v0, v1, "Detected subtraction overflow while calculating walltime.", v2, v3, v4, v5, v6);
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  return _CFAbsoluteTimeGetCurrent();
}

CFDateRef CFDateCreate(CFAllocatorRef allocator, CFAbsoluteTime at)
{
  return _CFDateCreate(allocator, at);
}

void CFDictionaryAddValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return _CFDictionaryCreateMutable(allocator, capacity, keyCallBacks, valueCallBacks);
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

CFNumberRef CFNumberCreate(CFAllocatorRef allocator, CFNumberType theType, const void *valuePtr)
{
  return _CFNumberCreate(allocator, theType, valuePtr);
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return _CFRetain(cf);
}

void CFStringAppend(CFMutableStringRef theString, CFStringRef appendedString)
{
}

CFMutableStringRef CFStringCreateMutableCopy(CFAllocatorRef alloc, CFIndex maxLength, CFStringRef theString)
{
  return _CFStringCreateMutableCopy(alloc, maxLength, theString);
}

CFStringRef CFStringCreateWithCString(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding)
{
  return _CFStringCreateWithCString(alloc, cStr, encoding);
}

IOReturn IOAllowPowerChange(io_connect_t kernelPort, intptr_t notificationID)
{
  return _IOAllowPowerChange(kernelPort, notificationID);
}

IOReturn IOCancelPowerChange(io_connect_t kernelPort, intptr_t notificationID)
{
  return _IOCancelPowerChange(kernelPort, notificationID);
}

void IONotificationPortSetDispatchQueue(IONotificationPortRef notify, dispatch_queue_t queue)
{
}

IOReturn IOPMAssertionCreateWithProperties(CFDictionaryRef AssertionProperties, IOPMAssertionID *AssertionID)
{
  return _IOPMAssertionCreateWithProperties(AssertionProperties, AssertionID);
}

IOReturn IOPMAssertionRelease(IOPMAssertionID AssertionID)
{
  return _IOPMAssertionRelease(AssertionID);
}

IOReturn IOPMCancelScheduledPowerEvent(CFDateRef time_to_wake, CFStringRef my_id, CFStringRef type)
{
  return _IOPMCancelScheduledPowerEvent(time_to_wake, my_id, type);
}

uint64_t IOPMIsASleep()
{
  return _IOPMIsASleep();
}

uint64_t IOPMRequestSysWake()
{
  return _IOPMRequestSysWake();
}

io_connect_t IORegisterForSystemPower(void *refcon, IONotificationPortRef *thePortRef, IOServiceInterestCallback callback, io_object_t *notifier)
{
  return _IORegisterForSystemPower(refcon, thePortRef, callback, notifier);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Block_release(const void *aBlock)
{
}

uint64_t _os_assert_log()
{
  return __os_assert_log();
}

uint64_t _os_assumes_log()
{
  return __os_assumes_log();
}

uint64_t _os_crash()
{
  return __os_crash();
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

__uint64_t clock_gettime_nsec_np(clockid_t __clock_id)
{
  return _clock_gettime_nsec_np(__clock_id);
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_block_cancel(dispatch_block_t block)
{
}

dispatch_block_t dispatch_block_create(dispatch_block_flags_t flags, dispatch_block_t block)
{
  return _dispatch_block_create(flags, block);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

void dispatch_resume(dispatch_object_t object)
{
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return _dispatch_source_create(type, handle, mask, queue);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

void dispatch_source_set_timer(dispatch_source_t source, dispatch_time_t start, uint64_t interval, uint64_t leeway)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return _dispatch_time(when, delta);
}

void free(void *a1)
{
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return _mach_timebase_info(info);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return _malloc_type_calloc(count, size, type_id);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return _notify_register_dispatch(name, out_token, queue, handler);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return _os_log_create(subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

size_t rb_tree_count(rb_tree_t *a1)
{
  return _rb_tree_count(a1);
}

void *__cdecl rb_tree_find_node_geq(rb_tree_t *a1, const void *a2)
{
  return _rb_tree_find_node_geq(a1, a2);
}

void *__cdecl rb_tree_find_node_leq(rb_tree_t *a1, const void *a2)
{
  return _rb_tree_find_node_leq(a1, a2);
}

void rb_tree_init(rb_tree_t *a1, const rb_tree_ops_t *a2)
{
}

void *__cdecl rb_tree_insert_node(rb_tree_t *a1, void *a2)
{
  return _rb_tree_insert_node(a1, a2);
}

void *__cdecl rb_tree_iterate(rb_tree_t *a1, void *a2, const unsigned int a3)
{
  return _rb_tree_iterate(a1, a2, a3);
}

void rb_tree_remove_node(rb_tree_t *a1, void *a2)
{
}

int strcasecmp(const char *a1, const char *a2)
{
  return _strcasecmp(a1, a2);
}

int strcmp(const char *__s1, const char *__s2)
{
  return _strcmp(__s1, __s2);
}

char *__cdecl strdup(const char *__s1)
{
  return _strdup(__s1);
}

BOOL xpc_BOOL_get_value(xpc_object_t xBOOL)
{
  return _xpc_BOOL_get_value(xBOOL);
}

char *__cdecl xpc_copy_description(xpc_object_t object)
{
  return _xpc_copy_description(object);
}

xpc_object_t xpc_date_create_from_current(void)
{
  return _xpc_date_create_from_current();
}

int64_t xpc_date_get_value(xpc_object_t xdate)
{
  return _xpc_date_get_value(xdate);
}

BOOL xpc_dictionary_get_BOOL(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_BOOL(xdict, key);
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_string(xdict, key);
}

xpc_object_t xpc_dictionary_get_value(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_value(xdict, key);
}

void xpc_event_provider_create()
{
  while (1)
    ;
}

void xpc_event_provider_get_queue()
{
  while (1)
    ;
}

void xpc_event_provider_token_fire_with_reply()
{
  while (1)
    ;
}

uint64_t xpc_get_event_name()
{
  return _xpc_get_event_name();
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return _xpc_get_type(object);
}

void xpc_release(xpc_object_t object)
{
}

xpc_object_t xpc_string_create(const char *string)
{
  return _xpc_string_create(string);
}

const char *__cdecl xpc_string_get_string_ptr(xpc_object_t xstring)
{
  return _xpc_string_get_string_ptr(xstring);
}

uint64_t xpc_uint64_get_value(xpc_object_t xuint)
{
  return _xpc_uint64_get_value(xuint);
}