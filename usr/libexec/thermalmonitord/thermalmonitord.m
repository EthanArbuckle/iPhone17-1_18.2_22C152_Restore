uint64_t sub_1000052E4()
{
  return byte_1000AA21C;
}

uint64_t sub_1000053F0(uint64_t a1)
{
  uint64_t ChannelID = IOReportChannelGetChannelID();
  uint64_t IntegerValue = IOReportSimpleGetIntegerValue();
  if (ChannelID == 0x505A454E47414745) {
    *(float *)(*(void *)(a1 + 32) + 96) = (float)(unint64_t)IntegerValue
  }
                                            / (float)*(unint64_t *)(a1 + 40);
  return 0;
}

CFNumberRef sub_100005654(__CFDictionary *a1, const void *a2, CFNumberType theType, void *valuePtr)
{
  if (a1 && a2 && valuePtr)
  {
    CFNumberRef result = CFNumberCreate(kCFAllocatorDefault, theType, valuePtr);
    if (result)
    {
      CFNumberRef v7 = result;
      CFDictionarySetValue(a1, a2, result);
      CFRelease(v7);
      return (CFNumberRef)1;
    }
  }
  else
  {
    CFNumberRef result = (CFNumberRef)os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_ERROR);
    if (result)
    {
      sub_1000588A8();
      return 0;
    }
  }
  return result;
}

uint64_t sub_100005994(io_registry_entry_t a1, const __CFString *a2, void *a3)
{
  uint64_t valuePtr = 0;
  CFTypeRef CFProperty = IORegistryEntryCreateCFProperty(a1, a2, kCFAllocatorDefault, 0);
  if (CFProperty)
  {
    v6 = CFProperty;
    CFTypeID TypeID = CFNumberGetTypeID();
    if (TypeID == CFGetTypeID(v6))
    {
      if (CFNumberGetValue((CFNumberRef)v6, kCFNumberSInt64Type, &valuePtr))
      {
        *a3 = valuePtr;
        uint64_t v8 = 1;
LABEL_14:
        CFRelease(v6);
        return v8;
      }
      if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_ERROR)) {
        sub_100058A48();
      }
    }
    else if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_ERROR))
    {
      sub_1000589E0();
    }
    uint64_t v8 = 0;
    goto LABEL_14;
  }
  if (!byte_1000AA7A0) {
    return 0;
  }
  v9 = qword_1000AABC0;
  uint64_t v8 = 0;
  if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    CFStringRef v13 = a2;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "<Notice> could not find %@ property", buf, 0xCu);
    return 0;
  }
  return v8;
}

float sub_100005B24(const char *a1)
{
  v1 = fopen(a1, "r");
  if (v1)
  {
    v2 = v1;
    fseek(v1, 0, 2);
    float v3 = (float)ftell(v2) / 1000000.0;
    fclose(v2);
  }
  else
  {
    puts("File Not Found!");
    return -1.0;
  }
  return v3;
}

BOOL sub_100005BA0()
{
  CFBooleanRef v0 = (const __CFBoolean *)MGCopyAnswer();
  if (!v0) {
    return 0;
  }
  CFBooleanRef v1 = v0;
  CFTypeID v2 = CFGetTypeID(v0);
  BOOL v3 = v2 == CFBooleanGetTypeID() && CFBooleanGetValue(v1) != 0;
  CFRelease(v1);
  return v3;
}

void sub_1000067E4(uint64_t a1)
{
  if (a1 == 1)
  {
    CFAllocatorRef v2 = kCFAllocatorDefault;
    CFStringRef v3 = @"Time, Epoch Time, Mach Absolute Time, TestCase Number, TestCase Name, Gas gauge average power, Battery capacity, ";
  }
  else
  {
    time_t v17 = time(0);
    v4 = ctime(&v17);
    v4[24] = 0;
    CFAllocatorRef v2 = kCFAllocatorDefault;
    time_t v5 = v17;
    uint64_t v6 = mach_absolute_time();
    uint64_t v7 = dword_1000AA288;
    uint64_t v8 = sub_10000A4C8();
    uint64_t v9 = sub_10000A624();
    CFStringRef v10 = CFStringCreateWithFormat(kCFAllocatorDefault, 0, @"%s, %ld, %llu, %d, %s, %lld, %d", v4, v5, v6, v7, &byte_1000AA28C, v8, v9);
    if (!v10) {
      return;
    }
    CFStringRef v3 = v10;
  }
  CFStringRef v11 = CFStringCreateWithFormat(v2, 0, @"%@%@", v3, [(id)qword_1000AA0E8 getTGraphData:a1]);
  CFRelease(v3);
  if (v11)
  {
    CFDataRef ExternalRepresentation = CFStringCreateExternalRepresentation(v2, v11, 0, 0x3Fu);
    if (ExternalRepresentation)
    {
      CFDataRef v13 = ExternalRepresentation;
      int v14 = dword_1000A2528;
      BytePtr = CFDataGetBytePtr(ExternalRepresentation);
      size_t Length = CFDataGetLength(v13);
      if (write(v14, BytePtr, Length) < 0 && os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_ERROR)) {
        sub_100057D44();
      }
      write(dword_1000A2528, "\n", 1uLL);
      CFRelease(v13);
    }
    CFRelease(v11);
  }
}

void sub_100007380(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 176), 8);
  _Unwind_Resume(a1);
}

void sub_1000073E8()
{
  if (dword_1000AA374 >= 1)
  {
    qword_1000AA248 = mach_absolute_time();
    unsigned int v0 = [(id)qword_1000AA0E8 canaryTempSensorIndex];
    if ((v0 & 0x80000000) == 0)
    {
      unsigned int v1 = v0;
      CFAllocatorRef v2 = [+[HidSensors sharedInstance] hidSensorKeys];
      if (v2)
      {
        ValueAtIndex = CFArrayGetValueAtIndex(v2, v1);
        if (ValueAtIndex)
        {
          int v4 = [+[HidSensors sharedInstance] temperatureForKey:ValueAtIndex];
          if (byte_1000AA7A0)
          {
            time_t v5 = qword_1000AABC0;
            if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 136315394;
              *(void *)&uint8_t buf[4] = "timerCallBackHID";
              *(_WORD *)&buf[12] = 1024;
              *(_DWORD *)&buf[14] = v4;
              _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "<Notice> %s: canary %d", buf, 0x12u);
            }
          }
          if (v4 > (int)[(id)qword_1000AA0E8 canaryTempThreshold])
          {
            [(id)qword_1000AA0E8 canaryModeExitEarly:dword_1000AA374];
            dword_1000AA374 = 0;
            goto LABEL_16;
          }
        }
        else if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_ERROR))
        {
          sub_100057DE0();
        }
      }
      else if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_ERROR))
      {
        sub_100057DAC();
      }
    }
    if (dword_1000AA374 >= 1)
    {
      --dword_1000AA374;
      return;
    }
  }
LABEL_16:
  [+[SensorDispatcherHelper sharedInstance] readKeysFromSensorDispatcher];
  uint64_t v6 = [+[HidSensors sharedInstance] getHIDSensorDict];
  if (v6)
  {
    CFDictionaryRef v7 = v6;
    uint64_t v8 = [+[HidSensors sharedInstance] hidSensorKeys];
    if (v8 && (CFArrayRef v9 = v8, v10 = CFGetTypeID(v8), v10 == CFArrayGetTypeID()))
    {
      BOOL v34 = sub_10000A668();
      CFIndex Count = CFArrayGetCount(v9);
      if (Count >= 1)
      {
        CFIndex v13 = Count;
        CFIndex v14 = 0;
        *(void *)&long long v12 = 138412290;
        long long v33 = v12;
        do
        {
          v15 = (void *)CFArrayGetValueAtIndex(v9, v14);
          if ([+[HidSensors sharedInstance] isPowerSensor:v15])
          {
            *(void *)buf = 0;
            sub_100008280(v7, v15, kCFNumberDoubleType, buf);
            unsigned int v16 = [+[HidSensors sharedInstance] getPowerSensorIndex:v15];
            dbl_1000AB0E8[v16] = *(double *)buf;
          }
          else
          {
            CFNumberRef Value = (const __CFNumber *)CFDictionaryGetValue(v7, v15);
            if (Value)
            {
              *(_DWORD *)buf = 0;
              CFNumberGetValue(Value, kCFNumberSInt32Type, buf);
              int v18 = [(id)qword_1000AA0E8 useTcalAdjust:v14];
              sub_100007AD8(v14, *(unsigned int *)buf, v18);
            }
            else
            {
              v19 = qword_1000AABC0;
              if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = v33;
                *(void *)&uint8_t buf[4] = v15;
                _os_log_error_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "<Error> Could not get value for %@", buf, 0xCu);
              }
            }
          }
          ++v14;
        }
        while (v13 != v14);
      }
      uint64_t v20 = qword_1000AA270;
      uint64_t v21 = qword_1000AA278;
      uint64_t v22 = qword_1000AA238;
      if ((qword_1000AA278 & qword_1000AA270) == qword_1000AA238)
      {
        if (byte_1000AA7A0)
        {
          v23 = qword_1000AABC0;
          if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_DEFAULT))
          {
            sub_100034CA8(dword_1000AA204);
            *(_DWORD *)buf = 136315138;
            *(void *)&uint8_t buf[4] = byte_1000AA378;
            _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "<Notice> sensors: %s", buf, 0xCu);
          }
        }
        dword_1000AA370 = 0;
        qword_1000AA248 = mach_absolute_time();
        [(id)qword_1000AA0E8 updateSystemLoad:v34];
        [(id)qword_1000AA0E8 probeAllSupervisorControlLoadingIndex];
        sub_10000A06C();
        int v24 = [(id)qword_1000AA0E8 desiredLoopInterval];
        if (v24 >= 1)
        {
          unsigned int v25 = v24 / 5u;
          if ((int)(v24 / 5u) <= 1) {
            unsigned int v25 = 1;
          }
          unsigned int v26 = v25 - 1;
          dword_1000AA374 = v25 - 1;
          if (byte_1000AA7A0)
          {
            v27 = qword_1000AABC0;
            if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 136315394;
              *(void *)&uint8_t buf[4] = "timerCallBackHID";
              *(_WORD *)&buf[12] = 1024;
              *(_DWORD *)&buf[14] = v26;
              _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "<Notice> %s: setting numCanaryOnlyPeriodsRemaining to %d", buf, 0x12u);
            }
          }
        }
      }
      else
      {
        int v28 = dword_1000AA370 + 1;
        dword_1000AA370 = v28;
        if ((v28 & 3) == 0)
        {
          v29 = qword_1000AABC0;
          if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 67109888;
            *(_DWORD *)&uint8_t buf[4] = v28;
            *(_WORD *)&buf[8] = 2048;
            *(void *)&buf[10] = v20;
            __int16 v36 = 2048;
            uint64_t v37 = v21;
            __int16 v38 = 2048;
            uint64_t v39 = v22;
            _os_log_error_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_ERROR, "<Error> partial sensors: count %d, current %llx, mask %llx, expected %llx", buf, 0x26u);
          }
          [+[HidSensors sharedInstance] resetHIDSensorDictionary];
        }
      }
      [objc_msgSend((id)qword_1000AA0E8, "hintComponentControlTakeAction", v33);
      [+[ContextAwareThermalManager sharedInstance] iterateAndUpdateContexts];
      if (byte_1000AB0E0)
      {
        [+[SensorExchangeHelper sharedInstance] updateAllSensorExchangeData];
        [+[SensorExchangeHelper sharedInstance] sendSensorExchangeDataToSMC];
      }
      if (byte_1000AA21C == 1) {
        sub_1000067E4(2);
      }
      [+[TGraphSampler sharedInstance] logToPowerlog];
      if (byte_1000AA231 == 1)
      {
        CStringPtr = CFStringGetCStringPtr(@"/var/log/tgraph.csv", 0);
        if (sub_100005B24(CStringPtr) > 5.0)
        {
          v31 = (const std::__fs::filesystem::path *)CFStringGetCStringPtr(@"/var/log/tgraph.csv", 0);
          remove(v31, v32);
          sub_1000330F0((const __SCPreferences *)qword_1000AADD8);
        }
      }
    }
    else if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_ERROR))
    {
      sub_100057D78();
    }
  }
}

uint64_t sub_1000079F4(uint64_t result, int a2, int a3, int a4)
{
  qword_1000AA270 |= 1 << result;
  if (dword_1000AA0F0 == result)
  {
    dword_1000AA0F8 = dword_1000AA0F4 - a2;
  }
  else if (a4)
  {
    a2 += dword_1000AA0F8;
  }
  if (byte_1000AA0FC) {
    int v4 = a3;
  }
  else {
    int v4 = a2;
  }
  if (byte_1000AABC8) {
    dword_1000AABCC[(int)result] = v4;
  }
  else {
    a3 = v4;
  }
  if (byte_1000AA7B0)
  {
    uint64_t v5 = (int)result;
    if ((qword_1000AADD0 & (1 << result)) != 0) {
      a3 = *((_DWORD *)&qword_1000AACCC + (int)result);
    }
    else {
      *((_DWORD *)&qword_1000AACCC + (int)result) = a3;
    }
  }
  else
  {
    uint64_t v5 = (int)result;
    *((_DWORD *)&qword_1000AACCC + (int)result) = a3;
  }
  dword_1000AA100[v5] = a3;
  return result;
}

uint64_t sub_100007AD8(uint64_t a1, unsigned int a2, int a3)
{
  unsigned int v4 = a2;
  if (!qword_1000AA208) {
    goto LABEL_14;
  }
  int v5 = *(_DWORD *)(qword_1000AA208 + 8 * (int)a1);
  if (!v5) {
    goto LABEL_14;
  }
  uint64_t v6 = qword_1000AA208 + 8 * (int)a1;
  int v9 = *(_DWORD *)(v6 + 4);
  CFDictionaryRef v7 = (int *)(v6 + 4);
  int v8 = v9;
  if (v9 == 0x80000000)
  {
    if (dword_1000AA0F0 == a1)
    {
      if (dword_1000AA218)
      {
        ++dword_1000AA210;
        dword_1000AA214 += a2;
      }
      else
      {
        unsigned int v4 = dword_1000AA0F4;
      }
    }
    goto LABEL_13;
  }
  if (dword_1000AA0F0 == a1)
  {
    int v10 = dword_1000AA210;
    if (dword_1000AA210 < dword_1000AA218)
    {
      ++dword_1000AA210;
      dword_1000AA214 += a2;
      unsigned int v4 = dword_1000AA214 / (v10 + 1);
LABEL_13:
      *CFDictionaryRef v7 = v4 << 16;
LABEL_14:
      int v12 = v4;
      return sub_1000079F4(a1, v12, v4, a3);
    }
  }
  int v11 = v8 + (unsigned __int16)(327680 / (v5 + 5)) * (a2 - (v8 >> 16));
  *CFDictionaryRef v7 = v11;
  int v12 = v11 >> 16;
  return sub_1000079F4(a1, v12, v4, a3);
}

uint64_t sub_100007C5C(uint64_t a1)
{
  ChannelName = (void *)IOReportChannelGetChannelName();
  uint64_t IntegerValue = IOReportSimpleGetIntegerValue();
  if ([ChannelName isEqualToString:@"power"])
  {
    *(float *)&int v4 = (float)(unint64_t)IntegerValue / *(double *)(a1 + 32) / 1000.0;
    dword_1000AAE20 = v4;
  }
  return 0;
}

uint64_t sub_100008280(CFDictionaryRef theDict, void *key, CFNumberType a3, void *a4)
{
  uint64_t result = 0;
  if (theDict)
  {
    if (key)
    {
      if (a4)
      {
        uint64_t result = CFDictionaryContainsKey(theDict, key);
        if (result)
        {
          CFNumberRef Value = (const __CFNumber *)CFDictionaryGetValue(theDict, key);
          if (Value && (CFNumberRef v10 = Value, v11 = CFGetTypeID(Value), v11 == CFNumberGetTypeID()))
          {
            return CFNumberGetValue(v10, a3, a4) != 0;
          }
          else
          {
            uint64_t result = os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_ERROR);
            if (result)
            {
              sub_100058770();
              return 0;
            }
          }
        }
      }
    }
  }
  return result;
}

CFTypeRef sub_100008350(CFStringRef key, io_registry_entry_t entry)
{
  return IORegistryEntryCreateCFProperty(entry, key, kCFAllocatorDefault, 0);
}

void sub_100008A14(__CFArray *a1, CFStringRef format, uint64_t a3)
{
  CFStringRef v4 = CFStringCreateWithFormat(kCFAllocatorDefault, 0, format, a3);
  CFArrayAppendValue(a1, v4);
  if (v4)
  {
    CFRelease(v4);
  }
}

uint64_t sub_100009188(void *a1, int *a2, int a3)
{
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v6 = [a1 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (!v6) {
    return 4294934528;
  }
  id v7 = v6;
  uint64_t v8 = *(void *)v17;
  LODWORD(v9) = -32768;
  do
  {
    for (i = 0; i != v7; i = (char *)i + 1)
    {
      if (*(void *)v17 != v8) {
        objc_enumerationMutation(a1);
      }
      signed int v11 = [*(id *)(*((void *)&v16 + 1) + 8 * i) intValue];
      if (a3) {
        int v12 = dword_1000AABCC;
      }
      else {
        int v12 = a2;
      }
      int v13 = v12[v11];
      if ((int)v9 <= v13) {
        unsigned int v14 = v13;
      }
      else {
        unsigned int v14 = v9;
      }
      if (v13 == 3000) {
        uint64_t v9 = v9;
      }
      else {
        uint64_t v9 = v14;
      }
    }
    id v7 = [a1 countByEnumeratingWithState:&v16 objects:v20 count:16];
  }
  while (v7);
  return v9;
}

uint64_t sub_1000094A4(io_registry_entry_t a1, const __CFString *a2, _DWORD *a3)
{
  Mutable = CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFNumberRef v7 = CFNumberCreate(0, kCFNumberSInt32Type, a3);
  if (v7
    && (CFNumberRef v8 = v7, CFDictionaryAddValue(Mutable, a2, v7), CFRelease(v8), !IORegistryEntrySetCFProperties(a1, Mutable)))
  {
    uint64_t v9 = sub_100009568(a1, a2, a3, 1);
  }
  else
  {
    uint64_t v9 = 0;
  }
  CFRelease(Mutable);
  return v9;
}

uint64_t sub_100009568(io_registry_entry_t a1, const __CFString *a2, _DWORD *a3, uint64_t a4)
{
  int valuePtr = 0;
  CFStringRef CFProperty = (const __CFString *)IORegistryEntryCreateCFProperty(a1, a2, kCFAllocatorDefault, 0);
  if (CFProperty)
  {
    CFStringRef v8 = CFProperty;
    CFTypeID TypeID = CFNumberGetTypeID();
    if (TypeID == CFGetTypeID(v8))
    {
      if (CFNumberGetValue((CFNumberRef)v8, kCFNumberSInt32Type, &valuePtr))
      {
        *a3 = valuePtr;
        a4 = 1;
LABEL_23:
        CFRelease(v8);
        return a4;
      }
      uint64_t v14 = qword_1000AABC0;
      if (a4)
      {
        if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_ERROR)) {
          sub_100058978();
        }
        goto LABEL_22;
      }
      if (!os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_23;
      }
      *(_DWORD *)buf = 138412290;
      CFStringRef v18 = a2;
      int v12 = "<Notice> %@ could not be converted to kCFNumberSInt32Type";
      int v13 = v14;
    }
    else
    {
      uint64_t v11 = qword_1000AABC0;
      if (a4)
      {
        if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_ERROR)) {
          sub_1000589E0();
        }
        goto LABEL_22;
      }
      if (!os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_23;
      }
      *(_DWORD *)buf = 138412290;
      CFStringRef v18 = v8;
      int v12 = "<Notice> %@ not a CFNumber";
      int v13 = v11;
    }
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, v12, buf, 0xCu);
LABEL_22:
    a4 = 0;
    goto LABEL_23;
  }
  CFNumberRef v10 = qword_1000AABC0;
  if (a4)
  {
    if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_ERROR)) {
      sub_100058910();
    }
    return 0;
  }
  if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    CFStringRef v18 = a2;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "<Notice> could not find %@ property", buf, 0xCu);
    return 0;
  }
  return a4;
}

void sub_10000A06C()
{
  if ((int)qword_1000AA798 < 12)
  {
    sub_10000A328();
    CFStringRef v3 = (const __CFString *)qword_1000AA228;
    sub_10000A808(0, v3, @"wake", (CFTimeInterval *)&qword_1000AA220);
  }
  else
  {
    double Current = CFAbsoluteTimeGetCurrent();
    if (*(double *)&qword_1000AA220 >= Current + 60.0)
    {
      if (byte_1000AA7A0)
      {
        CFStringRef v4 = qword_1000AABC0;
        if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_DEFAULT))
        {
          int v9 = 138412290;
          CFNumberRef v10 = 0;
          _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "<Notice> not setting timer: already set to wake at %@", (uint8_t *)&v9, 0xCu);
        }
      }
    }
    else
    {
      *(double *)&qword_1000AA220 = Current + 600.0;
      if (byte_1000AA7A0)
      {
        unsigned int v1 = qword_1000AABC0;
        if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_DEFAULT))
        {
          if (byte_1000A2510) {
            CFAllocatorRef v2 = "";
          }
          else {
            CFAllocatorRef v2 = "Disabled: ";
          }
          int v9 = 136315394;
          CFNumberRef v10 = v2;
          __int16 v11 = 1024;
          int v12 = 600;
          _os_log_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_DEFAULT, "<Notice> %ssetting wake up timer for %d secs from now", (uint8_t *)&v9, 0x12u);
        }
      }
      if (byte_1000A2510) {
        sub_100038174(0, (const __CFString *)qword_1000AA228, @"wake", *(CFAbsoluteTime *)&qword_1000AA220);
      }
    }
    if ((int)qword_1000AA798 < 16)
    {
      sub_10000A328();
    }
    else
    {
      int v5 = qword_1000AABC0;
      BOOL v6 = os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_DEFAULT);
      int v7 = byte_1000A2510;
      if (v6)
      {
        if (byte_1000A2510) {
          CFStringRef v8 = "";
        }
        else {
          CFStringRef v8 = "Disabled: ";
        }
        int v9 = 136315138;
        CFNumberRef v10 = v8;
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "<Notice> %sthermal status level critical -- cooling down", (uint8_t *)&v9, 0xCu);
        int v7 = byte_1000A2510;
      }
      if (v7)
      {
        qword_1000AA270 = 0;
        if (byte_1000AA7B0)
        {
          byte_1000AA7B0 = 0;
          qword_1000AADD0 = 0;
        }
        if (byte_1000AB0E1) {
          byte_1000AB0E1 = 0;
        }
        sub_1000380DC();
      }
    }
  }
}

void sub_10000A328()
{
  if (dword_1000AA284)
  {
    IOReturn v0 = IOPMAssertionRelease(dword_1000AA284);
    if (v0)
    {
      int v1 = v0;
      CFAllocatorRef v2 = qword_1000AABC0;
      if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_ERROR)) {
        sub_100057594(v1, v2);
      }
    }
    else if (byte_1000AA7A0)
    {
      CFStringRef v3 = qword_1000AABC0;
      if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_DEFAULT))
      {
        v4[0] = 67109120;
        v4[1] = dword_1000AA284;
        _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "<Notice> cleared idle sleep assertion: 0x%08x", (uint8_t *)v4, 8u);
      }
    }
    dword_1000AA284 = 0;
  }
}

void sub_10000A424()
{
  if (!dword_1000AA6C0)
  {
    dword_1000AA6C0 = sub_100037CD4("IOPMPowerSource", 0, 0);
    if (!dword_1000AA6C0)
    {
      if (byte_1000AA7A0)
      {
        IOReturn v0 = qword_1000AABC0;
        if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)int v1 = 0;
          _os_log_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEFAULT, "<Notice> initPowerSource: Failed to Match IOPMPowerSource", v1, 2u);
        }
      }
    }
  }
}

uint64_t sub_10000A4C8()
{
  LOWORD(result) = (unsigned __int16)[+[SensorDispatcherHelper sharedInstance] getValueFromSMCForKey:@"B0AP"];
  if ((_WORD)result != 0xFFFF) {
    return (__int16)result;
  }
  sub_10000A424();
  int v5 = 0;
  uint64_t v4 = 0;
  if (sub_100009568(dword_1000AA6C0, @"Voltage", &v5, 1))
  {
    if (sub_100005994(dword_1000AA6C0, @"InstantAmperage", &v4)) {
      return v4 * v5 / 1000;
    }
    if (!byte_1000AA7A0) {
      return 0;
    }
    int v1 = qword_1000AABC0;
    if (!os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_DEFAULT)) {
      return 0;
    }
    *(_WORD *)CFStringRef v3 = 0;
    CFAllocatorRef v2 = "<Notice> getGasGaugeAveragePower: Failed to find InstantAmperage";
  }
  else
  {
    if (!byte_1000AA7A0) {
      return 0;
    }
    int v1 = qword_1000AABC0;
    if (!os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_DEFAULT)) {
      return 0;
    }
    *(_WORD *)CFStringRef v3 = 0;
    CFAllocatorRef v2 = "<Notice> getGasGaugeAveragePower: Failed to find Voltage";
  }
  _os_log_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_DEFAULT, v2, v3, 2u);
  return 0;
}

uint64_t sub_10000A624()
{
  uint64_t result = dword_1000A2590;
  if (dword_1000A2590 == -1)
  {
    IOPSGetPercentRemaining();
    return 0xFFFFFFFFLL;
  }
  return result;
}

BOOL sub_10000A668()
{
  time_t v0 = time(0);
  if (v0 == -1) {
    return 0;
  }
  uint64_t v1 = v0;
  uint64_t v2 = qword_1000A2520;
  BOOL v4 = v0 < qword_1000A2520 || v0 > qword_1000A2520 + 59;
  if (v4)
  {
    uint64_t v5 = dword_1000AA204;
    if (dword_1000AA204 >= 1)
    {
      uint64_t v6 = 0;
      int v7 = byte_1000AA7B0;
      CFStringRef v8 = (_DWORD *)(qword_1000AA208 + 4);
      unint64_t v9 = qword_1000AADD0;
      do
      {
        if (!v7 || ((v9 >> v6) & 1) == 0)
        {
          *((_DWORD *)&qword_1000AACCC + v6) = -32768;
          dword_1000AABCC[v6] = -32768;
          *CFStringRef v8 = 0x80000000;
        }
        dword_1000AA100[v6] = *((_DWORD *)&qword_1000AACCC + v6);
        ++v6;
        v8 += 2;
      }
      while (v5 != v6);
    }
    qword_1000AA270 = 0;
    dword_1000AA210 = 0;
    dword_1000AA214 = 0;
    if (byte_1000AA7A0)
    {
      CFNumberRef v10 = qword_1000AABC0;
      if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_DEFAULT))
      {
        int v12 = 134218240;
        uint64_t v13 = v1;
        __int16 v14 = 2048;
        uint64_t v15 = v2;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "<Notice> resetting temps: now = %ld, last update = %ld", (uint8_t *)&v12, 0x16u);
      }
    }
  }
  qword_1000A2520 = v1;
  return v4;
}

CFTimeInterval sub_10000A808(const __CFDate *a1, const __CFString *a2, const __CFString *a3, CFTimeInterval *a4)
{
  if (a1)
  {
    if (IOPMCancelScheduledPowerEvent(a1, a2, a3))
    {
      if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_ERROR)) {
        sub_100058C2C();
      }
    }
    CFRelease(a1);
    CFTimeInterval result = -kCFAbsoluteTimeIntervalSince1970;
    *a4 = -kCFAbsoluteTimeIntervalSince1970;
  }
  return result;
}

id sub_10000A888(uint64_t a1)
{
  return [*(id *)(a1 + 32) updateInternal];
}

void sub_10000A890(uint64_t a1)
{
  int v2 = PLShouldLogRegisteredEvent();
  if (v2 || *(unsigned char *)(*(void *)(a1 + 32) + 49))
  {
    v8.tv_sec = 0;
    *(void *)&v8.tv_usec = 0;
    if (!gettimeofday(&v8, 0))
    {
      CFStringRef v3 = CFStringCreateWithFormat(0, 0, @"%0.2f", (double)v8.tv_usec / 1000000.0 + (double)v8.tv_sec);
      if (v3)
      {
        CFStringRef v4 = v3;
        if (v2)
        {
          uint64_t v5 = *(void *)(a1 + 32);
          if (*(unsigned char *)(v5 + 48))
          {
            [(id)v5 updateSubkeyController:*(void *)(v5 + 328) forControlList:*(void *)(v5 + 24)];
            [*(id *)(a1 + 32) updateSubkeyController:*(void *)(*(void *)(a1 + 32) + 336) forControlList:*(void *)(*(void *)(a1 + 32) + 16)];
            [*(id *)(*(void *)(a1 + 32) + 328) logToPowerlog:v4];
            [*(id *)(*(void *)(a1 + 32) + 336) logToPowerlog:v4];
            [*(id *)(*(void *)(a1 + 32) + 352) logToPowerlog:v4];
            uint64_t v5 = *(void *)(a1 + 32);
          }
          [(id)v5 updatePowerLogDictionaryForSensors];
          [*(id *)(*(void *)(a1 + 32) + 344) logToPowerlog:v4];
          [*(id *)(*(void *)(a1 + 32) + 360) logToPowerlog:v4];
        }
        uint64_t v6 = *(void *)(a1 + 32);
        if (*(unsigned char *)(v6 + 49))
        {
          [*(id *)(v6 + 384) logToPowerlog:v4];
          *(unsigned char *)(*(void *)(a1 + 32) + 49) = 0;
        }
        CFRelease(v4);
      }
    }
  }
  else if (byte_1000AA7A0)
  {
    int v7 = qword_1000AABC0;
    if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(v8.tv_sec) = 136315138;
      *(__darwin_time_t *)((char *)&v8.tv_sec + 4) = (__darwin_time_t)"-[TGraphSampler logToPowerlog]_block_invoke_2";
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "<Notice> %s: denied", (uint8_t *)&v8, 0xCu);
    }
  }
}

id sub_10000AA7C(void *a1)
{
  id result = [[objc_msgSend(*(id *)(a1[4] + 368), "cacheArray") count];
  if (a1[5]) {
    BOOL v3 = result == 0;
  }
  else {
    BOOL v3 = 1;
  }
  if (!v3)
  {
    id result = [*(id *)(a1[4] + 368) logToPowerlogLite];
    *(void *)(a1[4] + 56) = a1[6];
  }
  return result;
}

id sub_10000AAD4(uint64_t a1)
{
  id result = [*(id *)(*(void *)(a1 + 32) + 392) isEqualToArray:*(void *)(*(void *)(a1 + 32) + 400)];
  if ((result & 1) == 0)
  {
    id v3 = [objc_alloc((Class)NSMutableArray) initWithObjects:&off_10008D118, @"ThermalMiscState", 0];
    [v3 addObjectsFromArray:*(void *)(*(void *)(a1 + 32) + 392)];
    logEventForAppleCare();
    if (byte_1000AA7A0)
    {
      CFStringRef v4 = qword_1000AABC0;
      if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v6 = v3;
        _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "<Notice> Logged for AC: %@", buf, 0xCu);
      }
    }

    id result = [*(id *)(*(void *)(a1 + 32) + 392) copy];
    *(void *)(*(void *)(a1 + 32) + 400) = result;
  }
  return result;
}

NSDictionary *sub_10000D11C(uint64_t a1)
{
  v3[0] = @"TG0B";
  v4[0] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 32)];
  v3[1] = @"PMU_Tdev1";
  v4[1] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 36)];
  v3[2] = @"PMU_Tdev2";
  _DWORD v4[2] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 40)];
  v3[3] = @"PMU_Tdev3";
  v4[3] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 44)];
  v3[4] = @"PMU_Tdev5";
  v4[4] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 48)];
  v3[5] = @"PMU2_Tdev1";
  v4[5] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 52)];
  v3[6] = @"PMU2_Tdev2";
  v4[6] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 56)];
  v3[7] = @"PMU2_Tdev3";
  v4[7] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 60)];
  v3[8] = @"TSBM";
  v4[8] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 64)];
  v3[9] = @"TSFD";
  v4[9] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 68)];
  v3[10] = @"TSBQ";
  v4[10] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 72)];
  v3[11] = @"Die_Temp_MaxAverage";
  v4[11] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 76)];
  v3[12] = @"Die_Temp_MaxMax";
  v4[12] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 80)];
  v3[13] = @"maxLI_PackagePower";
  v4[13] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 84)];
  v3[14] = @"maxLI_Speaker";
  v4[14] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 88)];
  v3[15] = @"BackLight_maxLI";
  v4[15] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 92)];
  uint8_t v3[16] = @"Solar_Context";
  v4[16] = +[NSNumber numberWithInt:*(unsigned __int8 *)(a1 + 112)];
  v3[17] = @"Pressure_Level";
  v4[17] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 96)];
  v3[18] = @"Gas_Gauge_avg_Power";
  v4[18] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 100)];
  v3[19] = @"Charger_State";
  v4[19] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 104)];
  v3[20] = @"Package_Power";
  v4[20] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 108)];
  return +[NSDictionary dictionaryWithObjects:v4 forKeys:v3 count:21];
}

NSDictionary *sub_10000D6A0(uint64_t a1)
{
  v3[0] = @"TG0B";
  v4[0] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 32)];
  v3[1] = @"PMU_Tdev1";
  v4[1] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 36)];
  v3[2] = @"PMU_Tdev2";
  _DWORD v4[2] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 40)];
  v3[3] = @"PMU_Tdev3";
  v4[3] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 44)];
  v3[4] = @"PMU_Tdev4";
  v4[4] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 48)];
  v3[5] = @"PMU_Tdev5";
  v4[5] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 52)];
  v3[6] = @"PMU2_Tdev1";
  v4[6] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 56)];
  v3[7] = @"PMU2_Tdev2";
  v4[7] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 60)];
  v3[8] = @"PMU2_Tdev3";
  v4[8] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 64)];
  v3[9] = @"TSBM";
  v4[9] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 68)];
  v3[10] = @"TSFD";
  v4[10] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 72)];
  v3[11] = @"TSBQ";
  v4[11] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 76)];
  v3[12] = @"TSBR";
  v4[12] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 80)];
  v3[13] = @"Die_Temp_MaxAverage";
  v4[13] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 84)];
  v3[14] = @"Die_Temp_MaxMax";
  v4[14] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 88)];
  v3[15] = @"maxLI_PackagePower";
  v4[15] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 92)];
  uint8_t v3[16] = @"maxLI_Speaker";
  v4[16] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 96)];
  v3[17] = @"BackLight_maxLI";
  v4[17] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 100)];
  v3[18] = @"Solar_Context";
  v4[18] = +[NSNumber numberWithInt:*(unsigned __int8 *)(a1 + 120)];
  v3[19] = @"Pressure_Level";
  v4[19] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 104)];
  v3[20] = @"Gas_Gauge_avg_Power";
  v4[20] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 108)];
  void v3[21] = @"Charger_State";
  void v4[21] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 112)];
  v3[22] = @"Package_Power";
  v4[22] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 116)];
  return +[NSDictionary dictionaryWithObjects:v4 forKeys:v3 count:23];
}

void sub_10000DB04(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 80), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10000DB20(uint64_t a1, int token)
{
  uint64_t state64 = 0;
  uint64_t result = notify_get_state(token, &state64);
  if (!result) {
    return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  return result;
}

uint64_t sub_10000DB74(uint64_t a1)
{
  return notify_cancel(*(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24));
}

NSDictionary *sub_10000DE48(uint64_t a1)
{
  v3[0] = @"TG0B";
  v4[0] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 32)];
  v3[1] = @"PMU_Tdev2";
  v4[1] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 36)];
  v3[2] = @"PMU_Tdev3";
  _DWORD v4[2] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 40)];
  v3[3] = @"PMU_Tdev5";
  v4[3] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 44)];
  v3[4] = @"TSFD";
  v4[4] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 48)];
  v3[5] = @"TSBH";
  v4[5] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 52)];
  v3[6] = @"Die_Temp_MaxAverage";
  v4[6] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 56)];
  v3[7] = @"maxLI_PackagePower";
  v4[7] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 60)];
  v3[8] = @"Solar_Context";
  v4[8] = +[NSNumber numberWithInt:*(unsigned __int8 *)(a1 + 68)];
  v3[9] = @"Pressure_Level";
  v4[9] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 64)];
  return +[NSDictionary dictionaryWithObjects:v4 forKeys:v3 count:10];
}

NSDictionary *sub_10000E1C0(uint64_t a1)
{
  v3[0] = @"TG0B";
  v4[0] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 32)];
  v3[1] = @"PMU_Tdev1";
  v4[1] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 36)];
  v3[2] = @"PMU_Tdev2";
  _DWORD v4[2] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 40)];
  v3[3] = @"PMU_Tdev3";
  v4[3] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 44)];
  v3[4] = @"PMU_Tdev5";
  v4[4] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 48)];
  v3[5] = @"TSBH";
  v4[5] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 52)];
  v3[6] = @"TSFD";
  v4[6] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 56)];
  v3[7] = @"Die_Temp_MaxAverage";
  v4[7] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 60)];
  v3[8] = @"maxLI_PackagePower";
  v4[8] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 64)];
  v3[9] = @"Solar_Context";
  v4[9] = +[NSNumber numberWithInt:*(unsigned __int8 *)(a1 + 72)];
  void v3[10] = @"Pressure_Level";
  void v4[10] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 68)];
  return +[NSDictionary dictionaryWithObjects:v4 forKeys:v3 count:11];
}

NSDictionary *sub_10000E5A0(uint64_t a1)
{
  v3[0] = @"TSBM";
  v4[0] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 32)];
  v3[1] = @"TSFD";
  v4[1] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 36)];
  v3[2] = @"TSFL";
  _DWORD v4[2] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 40)];
  v3[3] = @"TSFG";
  v4[3] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 44)];
  v3[4] = @"TSBQ";
  v4[4] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 48)];
  v3[5] = @"TS1B";
  v4[5] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 52)];
  v3[6] = @"TR1d";
  v4[6] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 56)];
  v3[7] = @"TSBR";
  v4[7] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 60)];
  v3[8] = @"Die_Temp_MaxAverage";
  v4[8] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 64)];
  v3[9] = @"Die_Temp_MaxMax";
  v4[9] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 68)];
  void v3[10] = @"Package_Power";
  void v4[10] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 72)];
  void v3[11] = @"Gas_Gauge_avg_Power";
  void v4[11] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 76)];
  v3[12] = @"Charger_State";
  v4[12] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 80)];
  v3[13] = @"Solar_Context";
  v4[13] = +[NSNumber numberWithInt:*(unsigned __int8 *)(a1 + 84)];
  return +[NSDictionary dictionaryWithObjects:v4 forKeys:v3 count:14];
}

NSDictionary *sub_10000E994(uint64_t a1)
{
  v3[0] = @"TG0B";
  v4[0] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 32)];
  v3[1] = @"PMU_Tdev4";
  v4[1] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 36)];
  v3[2] = @"PMU_Tdev7";
  _DWORD v4[2] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 40)];
  v3[3] = @"PMU_Tdev8";
  v4[3] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 44)];
  v3[4] = @"TSFD";
  v4[4] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 48)];
  v3[5] = @"TSBH";
  v4[5] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 52)];
  v3[6] = @"TSBR";
  v4[6] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 56)];
  v3[7] = @"Die_Temp_MaxAverage";
  v4[7] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 60)];
  v3[8] = @"maxLI_PackagePower";
  v4[8] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 64)];
  v3[9] = @"Solar_Context";
  v4[9] = +[NSNumber numberWithInt:*(unsigned __int8 *)(a1 + 72)];
  void v3[10] = @"Pressure_Level";
  void v4[10] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 68)];
  return +[NSDictionary dictionaryWithObjects:v4 forKeys:v3 count:11];
}

NSDictionary *sub_10000EF90(uint64_t a1)
{
  v3[0] = @"TG0B";
  v4[0] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 32)];
  v3[1] = @"TSFD";
  v4[1] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 36)];
  v3[2] = @"TSFL";
  _DWORD v4[2] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 40)];
  v3[3] = @"TSBQ";
  v4[3] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 44)];
  v3[4] = @"TSBM";
  v4[4] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 48)];
  v3[5] = @"TSBR";
  v4[5] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 52)];
  v3[6] = @"TP4d";
  v4[6] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 56)];
  v3[7] = @"TP5d";
  v4[7] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 60)];
  v3[8] = @"batteryVT";
  v4[8] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 64)];
  v3[9] = @"Die_Temp_MaxAverage";
  v4[9] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 68)];
  void v3[10] = @"Die_Temp_MaxMax";
  void v4[10] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 72)];
  void v3[11] = @"maxLI_CPU";
  void v4[11] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 76)];
  v3[12] = @"maxLI_GPU";
  v4[12] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 80)];
  v3[13] = @"Gas_Gauge_avg_Power";
  v4[13] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 84)];
  void v3[14] = @"Charger_State";
  void v4[14] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 88)];
  v3[15] = @"Solar_Context";
  v4[15] = +[NSNumber numberWithInt:*(unsigned __int8 *)(a1 + 92)];
  return +[NSDictionary dictionaryWithObjects:v4 forKeys:v3 count:16];
}

NSDictionary *sub_10000F3D0(uint64_t a1)
{
  v3[0] = @"TSBM";
  v4[0] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 32)];
  v3[1] = @"TSFD";
  v4[1] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 36)];
  v3[2] = @"TSFL";
  _DWORD v4[2] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 40)];
  v3[3] = @"TSFG";
  v4[3] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 44)];
  v3[4] = @"TSBQ";
  v4[4] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 48)];
  v3[5] = @"TS1B";
  v4[5] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 52)];
  v3[6] = @"TP5d";
  v4[6] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 56)];
  v3[7] = @"TSBR";
  v4[7] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 60)];
  v3[8] = @"Die_Temp_MaxAverage";
  v4[8] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 64)];
  v3[9] = @"Die_Temp_MaxMax";
  v4[9] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 68)];
  void v3[10] = @"Charger_State";
  void v4[10] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 72)];
  void v3[11] = @"Solar_Context";
  void v4[11] = +[NSNumber numberWithInt:*(unsigned __int8 *)(a1 + 80)];
  v3[12] = @"Pressure_Level";
  v4[12] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 76)];
  return +[NSDictionary dictionaryWithObjects:v4 forKeys:v3 count:13];
}

void sub_10000F95C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v5);
  objc_destroyWeak(v4);
  objc_destroyWeak(v3);
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v6 - 120));
  _Unwind_Resume(a1);
}

float sub_10000F9BC(uint64_t a1, uint64_t a2)
{
  uint64_t state64 = 0;
  id Weak = objc_loadWeak((id *)(a1 + 32));
  [Weak handleStateChangeNotification:a2 temperatureSensorIndex:[Weak rearCameraSensorIdx]];
  if (!notify_get_state(a2, &state64))
  {
    float result = (float)(int)state64;
    *(float *)&dword_1000AAE2C = (float)(int)state64;
  }
  return result;
}

id sub_10000FA2C(uint64_t a1, uint64_t a2)
{
  id Weak = objc_loadWeak((id *)(a1 + 32));
  id v4 = [Weak rearCameraSensorIdx];

  return [Weak handleTemperatureChangeNotification:a2 temperatureSensorIndex:v4];
}

float sub_10000FA78(uint64_t a1, uint64_t a2)
{
  uint64_t state64 = 0;
  id Weak = objc_loadWeak((id *)(a1 + 32));
  [Weak handleStateChangeNotification:a2 temperatureSensorIndex:[Weak frontCameraSensorIdx]];
  if (!notify_get_state(a2, &state64))
  {
    float result = (float)(int)state64;
    *(float *)&dword_1000AAE38 = (float)(int)state64;
  }
  return result;
}

id sub_10000FAE8(uint64_t a1, uint64_t a2)
{
  id Weak = objc_loadWeak((id *)(a1 + 32));
  id v4 = [Weak frontCameraSensorIdx];

  return [Weak handleTemperatureChangeNotification:a2 temperatureSensorIndex:v4];
}

id sub_10000FB34(uint64_t a1, int a2)
{
  id Weak = objc_loadWeak((id *)(a1 + 32));
  uint64_t state64 = 0;
  id result = (id)notify_get_state(a2, &state64);
  if (!result)
  {
    [Weak setTorchState:state64];
    *(float *)&dword_1000AAE00 = (float)(int)state64;
    uint64_t v5 = +[TGraphSampler sharedInstance];
    if (state64) {
      uint64_t v6 = 100;
    }
    else {
      uint64_t v6 = 0;
    }
    return [(TGraphSampler *)v5 updatePowerlogMiscState:4 value:v6];
  }
  return result;
}

void sub_10000FD00(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 72));
  _Unwind_Resume(a1);
}

float sub_10000FD2C(uint64_t a1, uint64_t a2)
{
  uint64_t state64 = 0;
  id Weak = objc_loadWeak((id *)(a1 + 32));
  [Weak handleStateChangeNotification:a2 temperatureSensorIndex:[Weak rearCameraTeleSensorIdx]];
  if (!notify_get_state(a2, &state64))
  {
    float result = (float)(int)state64;
    *(float *)&dword_1000AAE30 = (float)(int)state64;
  }
  return result;
}

id sub_10000FD9C(uint64_t a1, uint64_t a2)
{
  id Weak = objc_loadWeak((id *)(a1 + 32));
  id v4 = [Weak rearCameraTeleSensorIdx];

  return [Weak handleTemperatureChangeNotification:a2 temperatureSensorIndex:v4];
}

void sub_10000FF28(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 72));
  _Unwind_Resume(a1);
}

float sub_10000FF54(uint64_t a1, uint64_t a2)
{
  uint64_t state64 = 0;
  id Weak = objc_loadWeak((id *)(a1 + 32));
  [Weak handleStateChangeNotification:a2 temperatureSensorIndex:[Weak rearCameraSuperWideSensorIdx]];
  if (!notify_get_state(a2, &state64))
  {
    float result = (float)(int)state64;
    *(float *)&dword_1000AAE34 = (float)(int)state64;
  }
  return result;
}

id sub_10000FFC4(uint64_t a1, uint64_t a2)
{
  id Weak = objc_loadWeak((id *)(a1 + 32));
  id v4 = [Weak rearCameraSuperWideSensorIdx];

  return [Weak handleTemperatureChangeNotification:a2 temperatureSensorIndex:v4];
}

void sub_100010150(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 72));
  _Unwind_Resume(a1);
}

float sub_10001017C(uint64_t a1, uint64_t a2)
{
  uint64_t state64 = 0;
  id Weak = objc_loadWeak((id *)(a1 + 32));
  [Weak handleStateChangeNotification:a2 temperatureSensorIndex:[Weak rearCameraJasperSensorIdx]];
  if (!notify_get_state(a2, &state64))
  {
    float result = (float)(int)state64;
    *(float *)&dword_1000AAE3C = (float)(int)state64;
  }
  return result;
}

id sub_1000101EC(uint64_t a1, uint64_t a2)
{
  id Weak = objc_loadWeak((id *)(a1 + 32));
  id v4 = [Weak rearCameraJasperSensorIdx];

  return [Weak handleTemperatureChangeNotification:a2 temperatureSensorIndex:v4];
}

void sub_100010378(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 72));
  _Unwind_Resume(a1);
}

id sub_1000103A4(uint64_t a1, uint64_t a2)
{
  id Weak = objc_loadWeak((id *)(a1 + 32));
  id v4 = [Weak frontIRCameraSensorIdx];

  return [Weak handleTemperatureChangeNotification:a2 temperatureSensorIndex:v4];
}

id sub_1000103F0(uint64_t a1, uint64_t a2)
{
  id Weak = objc_loadWeak((id *)(a1 + 32));
  id v4 = [Weak frontIRCameraSensorIdx];

  return [Weak handleStateChangeNotification:a2 temperatureSensorIndex:v4];
}

void sub_10001057C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 72));
  _Unwind_Resume(a1);
}

id sub_1000105A8(uint64_t a1, uint64_t a2)
{
  id Weak = objc_loadWeak((id *)(a1 + 32));
  id v4 = [Weak frontRomeoNTCSensorIdx];

  return [Weak handleTemperatureChangeNotification:a2 temperatureSensorIndex:v4];
}

id sub_1000105F4(uint64_t a1, uint64_t a2)
{
  id Weak = objc_loadWeak((id *)(a1 + 32));
  id v4 = [Weak frontRomeoNTCSensorIdx];

  return [Weak handleStateChangeNotification:a2 temperatureSensorIndex:v4];
}

void sub_100010780(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 72));
  _Unwind_Resume(a1);
}

id sub_1000107AC(uint64_t a1, uint64_t a2)
{
  id Weak = objc_loadWeak((id *)(a1 + 32));
  id v4 = [Weak frontRigelDieSensorIdx];

  return [Weak handleTemperatureChangeNotification:a2 temperatureSensorIndex:v4];
}

id sub_1000107F8(uint64_t a1, uint64_t a2)
{
  id Weak = objc_loadWeak((id *)(a1 + 32));
  id v4 = [Weak frontRigelDieSensorIdx];

  return [Weak handleStateChangeNotification:a2 temperatureSensorIndex:v4];
}

id sub_100010B78(void *a1, uint64_t a2, uint64_t a3)
{
  if (IOHIDEventGetType() == 15 || (id result = (id)IOHIDEventGetType(), result == 31))
  {
    IOHIDEventGetFloatValue();
    return [a1 handleTemperatureEvent:(int)(v6 * 100.0) service:a3];
  }
  return result;
}

void sub_100010C0C(id a1)
{
  qword_1000A2690 = objc_alloc_init(HidSensors);
}

void sub_10001196C(id a1)
{
  dword_1000A26A0 = sub_100037CD4("AppleVTempDispatcher", 0, 0);
  if (!dword_1000A26A0)
  {
    uint64_t v1 = qword_1000AABC0;
    if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_ERROR)) {
      sub_100054498(v1, v2, v3, v4, v5, v6, v7, v8);
    }
  }
}

BOOL sub_100012060(uint64_t a1, IOHIDServiceClientRef service)
{
  CFTypeRef v4 = IOHIDServiceClientCopyProperty(service, @"Product");
  int valuePtr = -1;
  CFNumberRef v5 = (const __CFNumber *)IOHIDServiceClientCopyProperty(service, @"LocationID");
  if (v5)
  {
    CFNumberRef v6 = v5;
    CFTypeID v7 = CFGetTypeID(v5);
    if (v7 == CFNumberGetTypeID())
    {
      CFNumberGetValue(v6, kCFNumberSInt32Type, &valuePtr);
      CFRelease(v6);
      if (valuePtr != -1) {
        [*(id *)(a1 + 32) addObject:sub_100037F5C(valuePtr)];
      }
    }
  }
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  uint64_t v8 = *(void **)(a1 + 40);
  id v9 = [v8 countByEnumeratingWithState:&v26 objects:v35 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v27;
LABEL_7:
    uint64_t v12 = 0;
    while (1)
    {
      if (*(void *)v27 != v11) {
        objc_enumerationMutation(v8);
      }
      uint64_t v13 = *(void **)(*((void *)&v26 + 1) + 8 * v12);
      if (v4)
      {
        CFTypeID v14 = CFGetTypeID(v4);
        if (v14 == CFStringGetTypeID() && ([v13 isEqualToString:v4] & 1) != 0) {
          goto LABEL_23;
        }
      }
      if ([v13 length] == (id)4)
      {
        uint64_t v15 = (const char *)[v13 cStringUsingEncoding:4];
        if (v15)
        {
          long long v16 = v15;
          if (strlen(v15) == 4)
          {
            uint64_t v17 = 0;
            int v18 = 0;
            do
              int v18 = v16[v17++] + (v18 << 8);
            while (v17 != 4);
            if (v18 == valuePtr) {
              goto LABEL_22;
            }
          }
        }
      }
      if ((id)++v12 == v10)
      {
        id v10 = [v8 countByEnumeratingWithState:&v26 objects:v35 count:16];
        if (v10) {
          goto LABEL_7;
        }
        break;
      }
    }
  }
  uint64_t v13 = 0;
LABEL_22:
  if (v4) {
LABEL_23:
  }
    CFRelease(v4);
  if (v13)
  {
    CFDictionaryAddValue(*(CFMutableDictionaryRef *)(*(void *)(a1 + 48) + 672), service, v13);
    id v19 = [*(id *)(a1 + 48) callbackSensorInterval:v13];
    if ((int)v19 >= 1)
    {
      id v20 = v19;
      uint64_t v21 = qword_1000AABC0;
      if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        v32 = v13;
        __int16 v33 = 1024;
        int v34 = (int)v20;
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "<Notice> callback interval for %@: %d", buf, 0x12u);
      }
      IOHIDServiceClientSetProperty(service, @"ReportInterval", +[NSNumber numberWithInt:v20]);
      uint64_t v22 = *(void *)(a1 + 48);
      v23 = *(NSObject **)(v22 + 104);
      if (v23)
      {
        v25[0] = _NSConcreteStackBlock;
        v25[1] = 3221225472;
        v25[2] = sub_100012380;
        v25[3] = &unk_100085188;
        v25[4] = v22;
        v25[5] = v13;
        dispatch_async(v23, v25);
      }
    }
  }
  return v13 != 0;
}

CFNumberRef sub_100012380(uint64_t a1)
{
  int valuePtr = -12700;
  if ([+[HidSensors sharedInstance] readFailuresExpected:*(void *)(a1 + 40)])
  {
    int valuePtr = 3000;
  }
  return sub_100005654(*(__CFDictionary **)(*(void *)(a1 + 32) + 80), *(const void **)(a1 + 40), kCFNumberSInt32Type, &valuePtr);
}

void sub_1000123E4(uint64_t a1)
{
  sub_100008280(*(CFDictionaryRef *)(*(void *)(a1 + 32) + 80), *(void **)(a1 + 48), kCFNumberSInt32Type, (void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24));
  uint64_t v2 = *(__CFDictionary **)(*(void *)(a1 + 32) + 80);
  uint64_t v3 = *(const void **)(a1 + 48);

  CFDictionaryRemoveValue(v2, v3);
}

CFNumberRef sub_10001281C(uint64_t a1)
{
  CFNumberRef result = (CFNumberRef)CFDictionaryGetValue(*(CFDictionaryRef *)(*(void *)(a1 + 32) + 672), *(const void **)(a1 + 40));
  if (result)
  {
    CFNumberRef v3 = result;
    CFTypeRef v4 = *(__CFDictionary **)(*(void *)(a1 + 32) + 80);
    return sub_100005654(v4, v3, kCFNumberSInt32Type, (void *)(a1 + 48));
  }
  return result;
}

void sub_100012C1C(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void sub_100012C38(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 2u);
}

unsigned char *sub_100012C50(unsigned char *result, unsigned char *a2)
{
  *CFNumberRef result = 0;
  *a2 = 0;
  return result;
}

void sub_100012C6C(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

NSDictionary *sub_100013114(uint64_t a1)
{
  v3[0] = @"TSBM";
  v4[0] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 32)];
  v3[1] = @"TSFD";
  v4[1] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 36)];
  v3[2] = @"TSFL";
  _DWORD v4[2] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 40)];
  v3[3] = @"TSFG";
  v4[3] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 44)];
  v3[4] = @"TSBQ";
  v4[4] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 48)];
  v3[5] = @"TS1B";
  v4[5] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 52)];
  v3[6] = @"TP5d";
  v4[6] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 56)];
  v3[7] = @"Die_Temp_MaxAverage";
  v4[7] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 60)];
  v3[8] = @"Die_Temp_MaxMax";
  v4[8] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 64)];
  v3[9] = @"Charger_State";
  v4[9] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 68)];
  void v3[10] = @"Solar_Context";
  void v4[10] = +[NSNumber numberWithInt:*(unsigned __int8 *)(a1 + 76)];
  void v3[11] = @"Pressure_Level";
  void v4[11] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 72)];
  return +[NSDictionary dictionaryWithObjects:v4 forKeys:v3 count:12];
}

_UNKNOWN **sub_100013AB8(uint64_t a1)
{
  CFNumberRef result = &off_10008D7C0;
  *(void *)(*(void *)(a1 + 32) + 424) = result;
  return result;
}

_UNKNOWN **sub_100013B94(uint64_t a1)
{
  CFNumberRef result = &off_10008D7D8;
  *(void *)(*(void *)(a1 + 32) + 432) = result;
  return result;
}

NSDictionary *sub_10001412C(uint64_t a1)
{
  v3[0] = @"TG0B";
  v4[0] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 32)];
  v3[1] = @"PMU_Tdev1";
  v4[1] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 36)];
  v3[2] = @"PMU_Tdev2";
  _DWORD v4[2] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 40)];
  v3[3] = @"Die_Temp_MaxAverage";
  v4[3] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 44)];
  v3[4] = @"Die_Temp_MaxMax";
  v4[4] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 48)];
  v3[5] = @"TSFC";
  v4[5] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 52)];
  v3[6] = @"TSBR";
  v4[6] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 56)];
  v3[7] = @"TS0A";
  v4[7] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 60)];
  v3[8] = @"TSFD";
  v4[8] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 64)];
  v3[9] = @"TSRM";
  v4[9] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 68)];
  void v3[10] = @"TSFG";
  void v4[10] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 72)];
  void v3[11] = @"Charger_State";
  void v4[11] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 76)];
  void v3[12] = @"Solar_Context";
  void v4[12] = +[NSNumber numberWithInt:*(unsigned __int8 *)(a1 + 84)];
  void v3[13] = @"Pressure_Level";
  void v4[13] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 80)];
  return +[NSDictionary dictionaryWithObjects:v4 forKeys:v3 count:14];
}

NSDictionary *sub_100014A5C(uint64_t a1)
{
  v3[0] = @"TG0B";
  v4[0] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 32)];
  v3[1] = @"PMU_Tdev4";
  v4[1] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 36)];
  v3[2] = @"PMU_Tdev7";
  _DWORD v4[2] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 40)];
  v3[3] = @"PMU_Tdev8";
  v4[3] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 44)];
  v3[4] = @"TSFD";
  v4[4] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 48)];
  v3[5] = @"TSBH";
  v4[5] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 52)];
  v3[6] = @"Die_Temp_MaxAverage";
  v4[6] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 56)];
  v3[7] = @"maxLI_PackagePower";
  v4[7] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 60)];
  v3[8] = @"Solar_Context";
  v4[8] = +[NSNumber numberWithInt:*(unsigned __int8 *)(a1 + 68)];
  v3[9] = @"Pressure_Level";
  v4[9] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 64)];
  return +[NSDictionary dictionaryWithObjects:v4 forKeys:v3 count:10];
}

void sub_1000156B8(void *a1, int a2, os_log_t log, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, a5, 2u);
}

void sub_100017B3C(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

NSDictionary *sub_100017DE0(uint64_t a1)
{
  v3[0] = @"TT7D";
  v4[0] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 32)];
  v3[1] = @"TG0B";
  v4[1] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 36)];
  v3[2] = @"TSFD";
  _DWORD v4[2] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 40)];
  v3[3] = @"TSFL";
  v4[3] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 44)];
  v3[4] = @"TSFG";
  v4[4] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 48)];
  v3[5] = @"TSBH";
  v4[5] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 52)];
  v3[6] = @"TSBR";
  v4[6] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 56)];
  v3[7] = @"Die_Temp_MaxAverage";
  v4[7] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 60)];
  v3[8] = @"Die_Temp_MaxMax";
  v4[8] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 64)];
  v3[9] = @"maxLI_CPU";
  v4[9] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 68)];
  void v3[10] = @"maxLI_GPU";
  void v4[10] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 72)];
  void v3[11] = @"maxLI_RR";
  void v4[11] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 76)];
  void v3[12] = @"Gas_Gauge_avg_Power";
  void v4[12] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 80)];
  void v3[13] = @"Charger_State";
  void v4[13] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 84)];
  void v3[14] = @"Solar_Context";
  void v4[14] = +[NSNumber numberWithInt:*(unsigned __int8 *)(a1 + 88)];
  return +[NSDictionary dictionaryWithObjects:v4 forKeys:v3 count:15];
}

NSDictionary *sub_10001A33C(uint64_t a1)
{
  v3[0] = @"TG0B";
  v4[0] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 32)];
  v3[1] = @"TG0V";
  v4[1] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 36)];
  v3[2] = @"PMU_Tdev1";
  _DWORD v4[2] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 40)];
  v3[3] = @"PMU_Tdev2";
  v4[3] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 44)];
  v3[4] = @"TSBR";
  v4[4] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 48)];
  v3[5] = @"TSBE";
  v4[5] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 52)];
  v3[6] = @"TSRR";
  v4[6] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 56)];
  v3[7] = @"TSRM";
  v4[7] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 60)];
  v3[8] = @"TSFL";
  v4[8] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 64)];
  v3[9] = @"TSFC";
  v4[9] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 68)];
  void v3[10] = @"TSFD";
  void v4[10] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 72)];
  void v3[11] = @"TSBQ";
  void v4[11] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 76)];
  void v3[12] = @"Die_Temp_MaxAverage";
  void v4[12] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 80)];
  void v3[13] = @"Die_Temp_MaxMax";
  void v4[13] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 84)];
  void v3[14] = @"Package_Power";
  void v4[14] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 88)];
  void v3[15] = @"Charger_State";
  void v4[15] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 92)];
  void v3[16] = @"Solar_Context";
  void v4[16] = +[NSNumber numberWithInt:*(unsigned __int8 *)(a1 + 100)];
  v3[17] = @"Pressure_Level";
  v4[17] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 96)];
  v3[18] = @"Accessory";
  v4[18] = +[NSNumber numberWithInt:*(unsigned __int8 *)(a1 + 101)];
  return +[NSDictionary dictionaryWithObjects:v4 forKeys:v3 count:19];
}

void sub_10001A5C8(id a1)
{
  if (byte_1000AB14A) {
    qword_1000A26D0 = objc_alloc_init(PowerZoneTelemetry);
  }
}

_UNKNOWN **sub_10001B280(uint64_t a1)
{
  CFNumberRef result = &off_10008D820;
  *(void *)(*(void *)(a1 + 32) + 400) = result;
  return result;
}

_UNKNOWN **sub_10001B35C(uint64_t a1)
{
  CFNumberRef result = &off_10008D838;
  *(void *)(*(void *)(a1 + 32) + 408) = result;
  return result;
}

NSDictionary *sub_10001B530(uint64_t a1)
{
  v3[0] = @"TT7D";
  v4[0] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 32)];
  v3[1] = @"TG0B";
  v4[1] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 36)];
  v3[2] = @"TSFD";
  _DWORD v4[2] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 40)];
  v3[3] = @"TSFL";
  v4[3] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 44)];
  v3[4] = @"TSFG";
  v4[4] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 48)];
  v3[5] = @"TSBH";
  v4[5] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 52)];
  v3[6] = @"Die_Temp_MaxAverage";
  v4[6] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 56)];
  v3[7] = @"Die_Temp_MaxMax";
  v4[7] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 60)];
  v3[8] = @"maxLI_CPU";
  v4[8] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 64)];
  v3[9] = @"maxLI_GPU";
  v4[9] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 68)];
  void v3[10] = @"maxLI_RR";
  void v4[10] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 72)];
  void v3[11] = @"Gas_Gauge_avg_Power";
  void v4[11] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 76)];
  void v3[12] = @"Charger_State";
  void v4[12] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 80)];
  void v3[13] = @"Solar_Context";
  void v4[13] = +[NSNumber numberWithInt:*(unsigned __int8 *)(a1 + 84)];
  return +[NSDictionary dictionaryWithObjects:v4 forKeys:v3 count:14];
}

NSDictionary *sub_10001BFC0(uint64_t a1)
{
  v3[0] = @"TG0B";
  v4[0] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 32)];
  v3[1] = @"TSFD";
  v4[1] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 36)];
  v3[2] = @"TSFL";
  _DWORD v4[2] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 40)];
  v3[3] = @"TSBQ";
  v4[3] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 44)];
  v3[4] = @"TSBM";
  v4[4] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 48)];
  v3[5] = @"TSBR";
  v4[5] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 52)];
  v3[6] = @"TP4d";
  v4[6] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 56)];
  v3[7] = @"TP5d";
  v4[7] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 60)];
  v3[8] = @"batteryVT";
  v4[8] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 64)];
  v3[9] = @"Die_Temp_MaxAverage";
  v4[9] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 68)];
  void v3[10] = @"Die_Temp_MaxMax";
  void v4[10] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 72)];
  void v3[11] = @"maxLI_CPU";
  void v4[11] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 76)];
  void v3[12] = @"maxLI_GPU";
  void v4[12] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 80)];
  void v3[13] = @"Gas_Gauge_avg_Power";
  void v4[13] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 84)];
  void v3[14] = @"Charger_State";
  void v4[14] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 88)];
  void v3[15] = @"Solar_Context";
  void v4[15] = +[NSNumber numberWithInt:*(unsigned __int8 *)(a1 + 92)];
  return +[NSDictionary dictionaryWithObjects:v4 forKeys:v3 count:16];
}

NSDictionary *sub_10001C3D0(uint64_t a1)
{
  v3[0] = @"TG0B";
  v4[0] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 32)];
  v3[1] = @"PMU_Tdev3";
  v4[1] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 36)];
  v3[2] = @"PMU_Tdev4";
  _DWORD v4[2] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 40)];
  v3[3] = @"PMU_Tdev5";
  v4[3] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 44)];
  v3[4] = @"PMU_Tdev7";
  v4[4] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 48)];
  v3[5] = @"Die_Temp_MaxAverage";
  v4[5] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 52)];
  v3[6] = @"TSFD";
  v4[6] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 56)];
  v3[7] = @"TSBH";
  v4[7] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 60)];
  v3[8] = @"TSBR";
  v4[8] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 64)];
  v3[9] = @"Solar_Context";
  v4[9] = +[NSNumber numberWithInt:*(unsigned __int8 *)(a1 + 72)];
  void v3[10] = @"Pressure_Level";
  void v4[10] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 68)];
  return +[NSDictionary dictionaryWithObjects:v4 forKeys:v3 count:11];
}

void sub_10001C574(id a1)
{
  qword_1000A26F8 = objc_alloc_init(CPMSHelper);
}

void sub_10001C7EC(void *a1, uint64_t a2, int a3, uint64_t a4)
{
  if (a3 == -528318202)
  {
    if (byte_1000AA7A0)
    {
      uint64_t v8 = qword_1000AABC0;
      if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        uint64_t v13 = a4;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "<Notice> CPMS Helper, peak pressure %lld", buf, 0xCu);
      }
    }
    CFNumberRef v6 = [a1 cpmsHelperQueue];
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_10001D53C;
    v9[3] = &unk_100085188;
    v9[4] = a1;
    v9[5] = a4;
    CFTypeID v7 = v9;
  }
  else
  {
    if (a3 != -528318205) {
      return;
    }
    CFNumberRef v6 = [a1 cpmsHelperQueue];
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_10001D3E0;
    v10[3] = &unk_1000858E0;
    char v11 = a4;
    v10[4] = a1;
    CFTypeID v7 = v10;
  }
  dispatch_async(v6, v7);
}

void sub_10001D0E4(void *a1, uint64_t a2, unsigned __int8 *a3, int a4)
{
  if (a4 == 4)
  {
    if (a2)
    {
      uint64_t v5 = qword_1000AABC0;
      if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_ERROR)) {
        sub_100055834(a2, v5, v6, v7, v8, v9, v10, v11);
      }
    }
    else
    {
      unsigned int v16 = [a1 getMitigationTypeForClientID:*a3];
      if (v16 != -1)
      {
        unsigned int v17 = v16;
        int v18 = (void *)a1[63];
        if (v18)
        {
          uint64_t v19 = *(int *)&byte_100085728[24 * v17 + 16];
          id v20 = [v18 findComponent:];
          uint64_t v21 = *(void *)&a3[8 * v19];
          [v20 setCurrentPower:v21];
        }
      }
    }
  }
  else
  {
    uint64_t v13 = qword_1000AABC0;
    if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_ERROR)) {
      sub_1000558A0(a4, v13);
    }
  }
}

void *sub_10001D3E0(void *result, __n128 a2)
{
  uint64_t v2 = result;
  uint64_t v3 = 0;
  CFTypeRef v4 = &off_100085730;
  a2.n128_u64[0] = 67109634;
  __n128 v9 = a2;
  do
  {
    if (*((unsigned __int8 *)v4 - 8) == *((unsigned __int8 *)v2 + 40))
    {
      CFNumberRef result = [*(id *)(v2[4] + 504) findComponent:v3];
      if (result)
      {
        uint64_t v5 = result;
        if (byte_1000AA7A0)
        {
          uint64_t v6 = qword_1000AABC0;
          if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_DEFAULT))
          {
            int v7 = *((unsigned __int8 *)v2 + 40);
            uint64_t v8 = *v4;
            *(_DWORD *)buf = v9.n128_u32[0];
            int v11 = v7;
            __int16 v12 = 1024;
            int v13 = v3;
            __int16 v14 = 2080;
            uint64_t v15 = v8;
            _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "<Notice> registration call back for clientID: %u MitigationType:%d clientName:%s", buf, 0x18u);
          }
        }
        CFNumberRef result = [v5 setCPMSMitigationState:[v5 isCPMSControlEnabled]];
      }
    }
    v4 += 3;
    ++v3;
  }
  while (v3 != 18);
  return result;
}

void sub_10001D53C(uint64_t a1)
{
  if (byte_1000A2510)
  {
    [+[TGraphSampler sharedInstance] updateAppleCareState:4 value:*(unsigned int *)(a1 + 40)];
    if (notify_set_state(*(_DWORD *)(*(void *)(a1 + 32) + 512), *(void *)(a1 + 40)))
    {
      uint64_t v2 = qword_1000AABC0;
      if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_ERROR)) {
        sub_1000559F4(v2, v3, v4, v5, v6, v7, v8, v9);
      }
    }
    else if (notify_post("com.apple.system.peakpowerpressurelevel"))
    {
      uint64_t v10 = qword_1000AABC0;
      if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_ERROR)) {
        sub_1000559BC(v10, v11, v12, v13, v14, v15, v16, v17);
      }
    }
  }
}

void sub_10001D5F4(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 8u);
}

void sub_10001D610(uint64_t a1@<X8>)
{
  *(void *)(v1 - 8) = a1;
}

NSDictionary *sub_10001E530(uint64_t a1)
{
  v3[0] = @"TG0B";
  v4[0] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 32)];
  v3[1] = @"PMU_Tdev1";
  v4[1] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 36)];
  v3[2] = @"PMU_Tdev2";
  _DWORD v4[2] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 40)];
  v3[3] = @"Die_Temp_MaxAverage";
  v4[3] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 44)];
  v3[4] = @"Die_Temp_MaxMax";
  v4[4] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 48)];
  v3[5] = @"TSFC";
  v4[5] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 52)];
  v3[6] = @"TSRR";
  v4[6] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 56)];
  v3[7] = @"TSFD";
  v4[7] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 60)];
  v3[8] = @"TSRM";
  v4[8] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 64)];
  v3[9] = @"Charger_State";
  v4[9] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 68)];
  void v3[10] = @"Solar_Context";
  void v4[10] = +[NSNumber numberWithInt:*(unsigned __int8 *)(a1 + 76)];
  void v3[11] = @"Pressure_Level";
  void v4[11] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 72)];
  return +[NSDictionary dictionaryWithObjects:v4 forKeys:v3 count:12];
}

_UNKNOWN **sub_10001FA74(uint64_t a1)
{
  CFNumberRef result = &off_10008D850;
  *(void *)(*(void *)(a1 + 32) + 408) = result;
  return result;
}

_UNKNOWN **sub_10001FB50(uint64_t a1)
{
  CFNumberRef result = &off_10008D868;
  *(void *)(*(void *)(a1 + 32) + 416) = result;
  return result;
}

NSDictionary *sub_100020350(uint64_t a1)
{
  v5[0] = @"TG0B";
  v6[0] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 40)];
  v5[1] = @"TG0V";
  v6[1] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 44)];
  v5[2] = @"PMU_Tdev1";
  v6[2] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 48)];
  v5[3] = @"PMU_Tdev2";
  v6[3] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 52)];
  v5[4] = @"TSRR";
  v6[4] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 56)];
  v5[5] = @"TSBR";
  v6[5] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 60)];
  v5[6] = @"TSRM";
  v6[6] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 64)];
  v5[7] = @"TSFL";
  v6[7] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 68)];
  v5[8] = @"TSFC";
  v6[8] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 72)];
  v5[9] = @"TSFD";
  v6[9] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 76)];
  v5[10] = @"mic2";
  v6[10] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 80)];
  v5[11] = @"TSBQ";
  v6[11] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 84)];
  v5[12] = @"TSFG";
  v6[12] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 88)];
  v5[13] = @"Die_Temp_MaxAverage";
  v6[13] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 92)];
  v5[14] = @"Die_Temp_MaxMax";
  v6[14] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 96)];
  v5[15] = @"Package_Power";
  v6[15] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 100)];
  v5[16] = @"Charger_State";
  v6[16] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 104)];
  v5[17] = @"Solar_Context";
  v6[17] = +[NSNumber numberWithInt:*(unsigned __int8 *)(a1 + 112)];
  v5[18] = @"Pressure_Level";
  uint64_t v2 = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 108)];
  v5[19] = @"Device_Activity";
  uint64_t v3 = *(void *)(a1 + 32);
  v6[18] = v2;
  v6[19] = v3;
  return +[NSDictionary dictionaryWithObjects:v6 forKeys:v5 count:20];
}

NSDictionary *sub_100020A4C(uint64_t a1)
{
  v3[0] = @"TSBM";
  v4[0] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 32)];
  v3[1] = @"TSFD";
  v4[1] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 36)];
  v3[2] = @"TSFL";
  _DWORD v4[2] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 40)];
  v3[3] = @"TSFG";
  v4[3] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 44)];
  v3[4] = @"TSBQ";
  v4[4] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 48)];
  v3[5] = @"TS1B";
  v4[5] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 52)];
  v3[6] = @"TP5d";
  v4[6] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 56)];
  v3[7] = @"Die_Temp_MaxAverage";
  v4[7] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 60)];
  v3[8] = @"Die_Temp_MaxMax";
  v4[8] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 64)];
  v3[9] = @"Charger_State";
  v4[9] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 68)];
  void v3[10] = @"Solar_Context";
  void v4[10] = +[NSNumber numberWithInt:*(unsigned __int8 *)(a1 + 76)];
  void v3[11] = @"Pressure_Level";
  void v4[11] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 72)];
  return +[NSDictionary dictionaryWithObjects:v4 forKeys:v3 count:12];
}

void sub_100021574(id a1)
{
  qword_1000AA060 = objc_alloc_init(TGraphSampler);
}

void sub_100022074(__CFArray *a1, CFStringRef format, double a3)
{
  CFStringRef v4 = CFStringCreateWithFormat(kCFAllocatorDefault, 0, format, *(void *)&a3);
  CFArrayAppendValue(a1, v4);
  if (v4)
  {
    CFRelease(v4);
  }
}

id sub_100022270(uint64_t a1)
{
  return [*(id *)(a1 + 32) setIntValue:*(unsigned int *)(a1 + 48) forKey:*(void *)(a1 + 40)];
}

id sub_100022394(uint64_t a1)
{
  id v2 = [*(id *)(*(void *)(a1 + 32) + 368) cacheArray];
  uint64_t v3 = *(void *)(a1 + 40);

  return [v2 addObject:v3];
}

id sub_1000224E8(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 376) logHIPStatusToPowerlogLite:*(void *)(a1 + 40)];
}

id sub_100022634(uint64_t a1)
{
  id v2 = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 44)];
  uint64_t v3 = *(void **)(*(void *)(a1 + 32) + 392);
  uint64_t v4 = *(unsigned int *)(a1 + 40);

  return [v3 setObject:v2 atIndexedSubscript:v4];
}

NSDictionary *sub_10002362C(uint64_t a1)
{
  v3[0] = @"TG0B";
  v4[0] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 32)];
  v3[1] = @"TG0V";
  v4[1] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 36)];
  v3[2] = @"PMU_Tdev1";
  _DWORD v4[2] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 40)];
  v3[3] = @"PMU_Tdev2";
  v4[3] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 44)];
  v3[4] = @"TSBR";
  v4[4] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 48)];
  v3[5] = @"TSBE";
  v4[5] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 52)];
  v3[6] = @"TSRR";
  v4[6] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 56)];
  v3[7] = @"TSRM";
  v4[7] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 60)];
  v3[8] = @"TSFL";
  v4[8] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 64)];
  v3[9] = @"TSFC";
  v4[9] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 68)];
  void v3[10] = @"TSFD";
  void v4[10] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 72)];
  void v3[11] = @"TSBQ";
  void v4[11] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 76)];
  void v3[12] = @"Die_Temp_MaxAverage";
  void v4[12] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 80)];
  void v3[13] = @"Die_Temp_MaxMax";
  void v4[13] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 84)];
  void v3[14] = @"Package_Power";
  void v4[14] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 88)];
  void v3[15] = @"Charger_State";
  void v4[15] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 92)];
  void v3[16] = @"Solar_Context";
  void v4[16] = +[NSNumber numberWithInt:*(unsigned __int8 *)(a1 + 100)];
  v3[17] = @"Pressure_Level";
  v4[17] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 96)];
  v3[18] = @"Accessory";
  v4[18] = +[NSNumber numberWithInt:*(unsigned __int8 *)(a1 + 101)];
  return +[NSDictionary dictionaryWithObjects:v4 forKeys:v3 count:19];
}

NSDictionary *sub_100023B64(uint64_t a1)
{
  v3[0] = @"TG0B";
  v4[0] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 32)];
  v3[1] = @"TSFD";
  v4[1] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 36)];
  v3[2] = @"TS0A";
  _DWORD v4[2] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 40)];
  v3[3] = @"TSBH";
  v4[3] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 44)];
  v3[4] = @"TP6D";
  v4[4] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 48)];
  v3[5] = @"Die_Temp_MaxAverage";
  v4[5] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 52)];
  v3[6] = @"Die_Temp_MaxMax";
  v4[6] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 56)];
  v3[7] = @"maxLI_CPU";
  v4[7] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 60)];
  v3[8] = @"maxLI_GPU";
  v4[8] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 64)];
  v3[9] = @"maxLI_RR";
  v4[9] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 68)];
  void v3[10] = @"Gas_Gauge_avg_Power";
  void v4[10] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 72)];
  void v3[11] = @"Charger_State";
  void v4[11] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 76)];
  void v3[12] = @"Solar_Context";
  void v4[12] = +[NSNumber numberWithInt:*(unsigned __int8 *)(a1 + 80)];
  return +[NSDictionary dictionaryWithObjects:v4 forKeys:v3 count:13];
}

NSDictionary *sub_1000243FC(uint64_t a1)
{
  v3[0] = @"TSBM";
  v4[0] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 32)];
  v3[1] = @"TSFD";
  v4[1] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 36)];
  v3[2] = @"TSFL";
  _DWORD v4[2] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 40)];
  v3[3] = @"TSFG";
  v4[3] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 44)];
  v3[4] = @"TSBQ";
  v4[4] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 48)];
  v3[5] = @"TS1B";
  v4[5] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 52)];
  v3[6] = @"TP5d";
  v4[6] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 56)];
  v3[7] = @"Die_Temp_MaxAverage";
  v4[7] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 60)];
  v3[8] = @"Die_Temp_MaxMax";
  v4[8] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 64)];
  v3[9] = @"Package_Power";
  v4[9] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 68)];
  void v3[10] = @"Gas_Gauge_avg_Power";
  void v4[10] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 72)];
  void v3[11] = @"Charger_State";
  void v4[11] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 76)];
  void v3[12] = @"Solar_Context";
  void v4[12] = +[NSNumber numberWithInt:*(unsigned __int8 *)(a1 + 80)];
  return +[NSDictionary dictionaryWithObjects:v4 forKeys:v3 count:13];
}

NSDictionary *sub_10002521C(uint64_t a1)
{
  v3[0] = @"TSBM";
  v4[0] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 32)];
  v3[1] = @"TSFD";
  v4[1] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 36)];
  v3[2] = @"TSFL";
  _DWORD v4[2] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 40)];
  v3[3] = @"TSFG";
  v4[3] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 44)];
  v3[4] = @"TSBQ";
  v4[4] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 48)];
  v3[5] = @"TS1B";
  v4[5] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 52)];
  v3[6] = @"TR1d";
  v4[6] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 56)];
  v3[7] = @"Die_Temp_MaxAverage";
  v4[7] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 60)];
  v3[8] = @"Die_Temp_MaxMax";
  v4[8] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 64)];
  v3[9] = @"Package_Power";
  v4[9] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 68)];
  void v3[10] = @"Gas_Gauge_avg_Power";
  void v4[10] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 72)];
  void v3[11] = @"Charger_State";
  void v4[11] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 76)];
  void v3[12] = @"Solar_Context";
  void v4[12] = +[NSNumber numberWithInt:*(unsigned __int8 *)(a1 + 80)];
  return +[NSDictionary dictionaryWithObjects:v4 forKeys:v3 count:13];
}

void sub_1000258EC(id a1)
{
  qword_1000AA078 = (uint64_t)os_log_create("com.apple.thermalmonitor", "agingcontroller");
}

void sub_1000261E4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100026214(uint64_t a1, uint64_t a2)
{
}

void sub_100026224(uint64_t a1)
{
}

void sub_100026230(uint64_t a1)
{
  uint64_t v1 = a1 + 32;
  id v2 = [(id)objc_opt_class() log];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v3 = [*(id *)(*(void *)(*(void *)v1 + 8) + 40) mitigationState];
    int v6 = 136315394;
    uint64_t v7 = "-[AgingController initWithParams:currentWRa:currentUPOCount:]_block_invoke";
    __int16 v8 = 1024;
    unsigned int v9 = v3;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "%s Notification callback called. Mitigation state %d\n", (uint8_t *)&v6, 0x12u);
  }
  if ([*(id *)(*(void *)(*(void *)v1 + 8) + 40) mitigationState] != (id)1)
  {
    uint64_t v4 = [(id)objc_opt_class() log];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_1000560D8(v1, v4);
    }
  }
  [*(id *)(*(void *)(*(void *)v1 + 8) + 40) updateMitigationStateAndNotify:3];
  [objc_msgSend(*(id *)(*(void *)(*(void *)v1 + 8) + 40), "defaults") setObject:[+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(*(id *)(*(void *)(*(void *)v1 + 8) + 40), "mitigationState")) forKey:@"MitigationState"];
  uint64_t v5 = [(id)objc_opt_class() log];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    sub_100056030(v1);
  }
}

void sub_100026AA0(uint64_t a1)
{
  CFDictionaryRef v2 = IOServiceMatching("ApplePPM");
  *(_DWORD *)(*(void *)(a1 + 32) + 16) = IOServiceGetMatchingService(kIOMainPortDefault, v2);
  if (!*(_DWORD *)(*(void *)(a1 + 32) + 16))
  {
    unsigned int v3 = [(id)objc_opt_class() log];
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      sub_100056694();
    }
  }
}

void sub_100026B90(uint64_t a1)
{
  CFDictionaryRef v2 = [(id)objc_opt_class() log];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    sub_100056730(v2, v3, v4, v5, v6, v7, v8, v9);
  }
  mach_service = xpc_connection_create_mach_service("com.apple.thermalMonitor.displayMitigationsEnabledNote", *(dispatch_queue_t *)(*(void *)(a1 + 32) + 32), 2uLL);
  xpc_object_t v11 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_BOOL(v11, "postNotification", 1);
  uint64_t v12 = dispatch_semaphore_create(0);
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_100026D84;
  handler[3] = &unk_100085B58;
  handler[4] = *(void *)(a1 + 32);
  xpc_connection_set_event_handler(mach_service, handler);
  uint64_t v13 = *(void *)(a1 + 32);
  uint64_t v14 = *(NSObject **)(v13 + 32);
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_100026DE0;
  v17[3] = &unk_100085B80;
  v17[4] = v12;
  v17[5] = v13;
  xpc_connection_send_message_with_reply(mach_service, v11, v14, v17);
  xpc_connection_activate(mach_service);
  uint64_t v15 = [(id)objc_opt_class() log];
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
    sub_1000566FC();
  }
  dispatch_semaphore_wait(v12, 0xFFFFFFFFFFFFFFFFLL);
  uint64_t v16 = [(id)objc_opt_class() log];
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
    sub_1000566C8();
  }
  xpc_connection_cancel(mach_service);
  if (v11) {
    xpc_release(v11);
  }
  if (v12) {
    dispatch_release(v12);
  }
  if (mach_service) {
    xpc_release(mach_service);
  }
}

void sub_100026D84(uint64_t a1, void *a2)
{
  if (a2 == &_xpc_error_connection_interrupted)
  {
    CFDictionaryRef v2 = [(id)objc_opt_class() log];
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
      sub_1000567A8();
    }
  }
}

void sub_100026DE0(uint64_t a1)
{
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
  uint64_t v1 = [(id)objc_opt_class() log];
  if (os_log_type_enabled(v1, OS_LOG_TYPE_DEBUG)) {
    sub_1000567DC();
  }
}

void sub_100026F3C(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 2u);
}

void sub_100026F58(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void sub_1000270D4(uint64_t a1)
{
  [*(id *)(a1 + 32) handleCurrentTopOffStatusWithContext:*(void *)(a1 + 40)];
  CFDictionaryRef v2 = [*(id *)(a1 + 32) inPocketQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100027164;
  block[3] = &unk_100085248;
  block[4] = *(void *)(a1 + 32);
  dispatch_async(v2, block);
}

id sub_100027164(uint64_t a1)
{
  return [*(id *)(a1 + 32) updateContextActiveState];
}

void sub_100027514(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 80), 8);
  _Unwind_Resume(a1);
}

id sub_10002752C(uint64_t a1)
{
  return [*(id *)(a1 + 32) registerForTopOffStatusChanges];
}

uint64_t sub_1000276F0(void *a1, io_iterator_t iterator)
{
  uint64_t result = IOIteratorNext(iterator);
  if (result)
  {
    uint64_t v5 = result;
    do
    {
      if (a1)
      {
        [a1 setPmuPowerService:v5];
        io_object_t notification = 0;
        IOServiceAddInterestNotification((IONotificationPortRef)[a1 notificationPort], (io_service_t)[a1 pmuPowerService], "IOGeneralInterest", (IOServiceInterestCallback)sub_100028F1C, a1, &notification);
        [a1 setNotification:notification];
        double Current = CFRunLoopGetCurrent();
        RunLoopSource = IONotificationPortGetRunLoopSource((IONotificationPortRef)[a1 notificationPort]);
        CFRunLoopAddSource(Current, RunLoopSource, kCFRunLoopDefaultMode);
        uint64_t v8 = [a1 inPocketQueue];
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = sub_100028FAC;
        block[3] = &unk_100085248;
        block[4] = a1;
        dispatch_async(v8, block);
      }
      uint64_t result = IOIteratorNext(iterator);
      uint64_t v5 = result;
    }
    while (result);
  }
  return result;
}

void sub_100027914(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id sub_100027930(uint64_t a1, int a2)
{
  id Weak = objc_loadWeak((id *)(a1 + 32));
  uint64_t state64 = 0;
  id result = (id)notify_get_state(a2, &state64);
  if (!result)
  {
    [Weak setAudioIsOn:state64 != 0];
    return [Weak updateContextActiveState];
  }
  return result;
}

void sub_100027A64(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100027A80(uint64_t a1, int a2)
{
  id Weak = objc_loadWeak((id *)(a1 + 32));
  uint64_t state64 = 0;
  if (notify_get_state(a2, &state64)) {
    uint64_t v4 = 0;
  }
  else {
    uint64_t v4 = state64;
  }
  [Weak setUncapRequestClientID:v4];
  [Weak setStockholmFieldDetectInProgressUntilTime:dispatch_time(0, 5000000000)];
  [Weak updateContextActiveState];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100027B6C;
  v5[3] = &unk_100085248;
  v5[4] = Weak;
  dispatch_after((dispatch_time_t)[Weak stockholmFieldDetectInProgressUntilTime], (dispatch_queue_t)[Weak inPocketQueue], v5);
}

id sub_100027B6C(uint64_t a1)
{
  return [*(id *)(a1 + 32) updateContextActiveState];
}

id sub_100028364(uint64_t a1)
{
  if (([*(id *)(a1 + 32) powerIsOn] & 1) == 0 && *(unsigned char *)(a1 + 40))
  {
    [*(id *)(a1 + 32) setWakeInProgressUntilTime:dispatch_time(0, 1000000000)];
    id v2 = [*(id *)(a1 + 32) wakeInProgressUntilTime];
    uint64_t v3 = [*(id *)(a1 + 32) inPocketQueue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000284D0;
    block[3] = &unk_100085248;
    block[4] = *(void *)(a1 + 32);
    dispatch_after((dispatch_time_t)v2, v3, block);
  }
  if (byte_1000AA7A0)
  {
    uint64_t v4 = qword_1000AABC0;
    if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_DEFAULT))
    {
      int v5 = *(unsigned __int8 *)(a1 + 40);
      *(_DWORD *)buf = 67109120;
      int v9 = v5;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "<Notice> UpdateSystemPower: Updare Power State to %d", buf, 8u);
    }
  }
  [*(id *)(a1 + 32) setPowerIsOn:*(unsigned __int8 *)(a1 + 40)];
  return [*(id *)(a1 + 32) updateContextActiveState];
}

id sub_1000284D0(uint64_t a1)
{
  if (byte_1000AA7A0)
  {
    id v2 = qword_1000AABC0;
    if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v4 = 0;
      _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "<Notice> UpdateSystemPower: WakeInProgress Reset", v4, 2u);
    }
  }
  return [*(id *)(a1 + 32) updateContextActiveState];
}

void sub_100028724(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100028740(uint64_t a1, uint64_t a2)
{
  id Weak = objc_loadWeak((id *)(a1 + 40));
  int v5 = qword_1000AABC0;
  if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v6 = [*(id *)(a1 + 32) backlightIsOn];
    *(_DWORD *)buf = 67109376;
    unsigned int v9 = v6;
    __int16 v10 = 1024;
    int v11 = a2;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "<Notice> Backlight Status changed %d -> %d", buf, 0xEu);
  }
  [Weak setBacklightIsOn:a2];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100028874;
  block[3] = &unk_100085248;
  block[4] = Weak;
  dispatch_async((dispatch_queue_t)[Weak inPocketQueue], block);
}

id sub_100028874(uint64_t a1)
{
  return [*(id *)(a1 + 32) updateContextActiveState];
}

id sub_100028900(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 24) = [*(id *)(*(void *)(a1 + 32) + 16) currentSession] != 0;
  id v2 = *(void **)(a1 + 32);

  return [v2 updateContextActiveState];
}

id sub_1000289E4(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 24) = [*(id *)(*(void *)(a1 + 32) + 16) currentSession] != 0;
  id v2 = *(void **)(a1 + 32);

  return [v2 updateContextActiveState];
}

void sub_100028D48(uint64_t a1, uint64_t a2)
{
}

void sub_100028D58(uint64_t a1)
{
}

Class sub_100028D64(uint64_t a1)
{
  v4[0] = 0;
  if (!qword_1000AA0A0)
  {
    v4[1] = _NSConcreteStackBlock;
    _DWORD v4[2] = 3221225472;
    v4[3] = sub_100028EA8;
    v4[4] = &unk_100085C30;
    v4[5] = v4;
    long long v5 = off_100085C18;
    uint64_t v6 = 0;
    qword_1000AA0A0 = _sl_dlopen();
    id v2 = (void *)v4[0];
    if (!qword_1000AA0A0)
    {
      abort_report_np();
      goto LABEL_7;
    }
    if (v4[0]) {
      goto LABEL_8;
    }
  }
  while (1)
  {
    Class result = objc_getClass("CARSessionStatus");
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = result;
    if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40)) {
      break;
    }
LABEL_7:
    id v2 = (void *)sub_100056894();
LABEL_8:
    free(v2);
  }
  qword_1000AA098 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  return result;
}

uint64_t sub_100028EA8()
{
  uint64_t result = _sl_dlopen();
  qword_1000AA0A0 = result;
  return result;
}

void sub_100028F1C(void *a1, uint64_t a2, int a3)
{
  if (a3 == -536723200)
  {
    block[7] = v3;
    block[8] = v4;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100028FAC;
    block[3] = &unk_100085248;
    block[4] = a1;
    dispatch_async((dispatch_queue_t)[a1 inPocketQueue], block);
  }
}

id sub_100028FAC(uint64_t a1)
{
  [*(id *)(a1 + 32) setConnectedExternally:sub_100038064((io_registry_entry_t)objc_msgSend(*(id *)(a1 + 32), "pmuPowerService"), @"ExternalConnected")];
  id v2 = *(void **)(a1 + 32);

  return [v2 updateContextActiveState];
}

id sub_10002914C(uint64_t a1)
{
  for (uint64_t i = 0; i != 17; ++i)
  {
    id result = [*(id *)(a1 + 32) getReleaseRateForComponent:i];
    *(_DWORD *)(*(void *)(a1 + 32) + 4 * i + 60) = result;
  }
  return result;
}

NSDictionary *sub_1000294B4(uint64_t a1)
{
  v3[0] = @"TG0B";
  v4[0] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 32)];
  v3[1] = @"TP4H";
  v4[1] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 36)];
  v3[2] = @"TSFD";
  _DWORD v4[2] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 40)];
  v3[3] = @"TSFL";
  v4[3] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 44)];
  v3[4] = @"TSBQ";
  v4[4] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 48)];
  v3[5] = @"TSBM";
  v4[5] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 52)];
  v3[6] = @"TSBR";
  void v4[6] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 56)];
  v3[7] = @"batteryVT";
  v4[7] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 60)];
  v3[8] = @"TP5d";
  v4[8] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 64)];
  v3[9] = @"maxLI_PackagePower";
  v4[9] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 68)];
  void v3[10] = @"Die_Temp_MaxAverage";
  void v4[10] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 72)];
  void v3[11] = @"Charger_State";
  void v4[11] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 76)];
  void v3[12] = @"Solar_Context";
  void v4[12] = +[NSNumber numberWithInt:*(unsigned __int8 *)(a1 + 80)];
  return +[NSDictionary dictionaryWithObjects:v4 forKeys:v3 count:13];
}

CFNumberRef sub_10002ACC8(uint64_t a1)
{
  return sub_100005654(*(__CFDictionary **)(*(void *)(a1 + 32) + 140), kCTThermalTxBackoff, kCFNumberSInt32Type, (void *)(*(void *)(a1 + 32) + 172));
}

id sub_10002AF70(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  unsigned int v2 = *(_DWORD *)(v1 + 84) & ~(*(int *)(v1 + 84) >> 31);
  if (v2 >= 0x64) {
    unsigned int v2 = 100;
  }
  *(_DWORD *)(v1 + 172) = dword_1000689BC[v2];
  return [*(id *)(a1 + 32) calculateAdditionalRadioMitigations];
}

void sub_10002B158(int a1, CFStringRef theString1, uint64_t a3, void *a4)
{
  if (CFStringCompare(theString1, kCTDaemonReadyNotification, 0))
  {
    uint64_t v6 = qword_1000AABC0;
    if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_ERROR)) {
      sub_100056CA0((uint64_t)theString1, v6);
    }
  }
  else
  {
    if (byte_1000AA7A0)
    {
      uint64_t v7 = qword_1000AABC0;
      if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)uint64_t v8 = 0;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "<Notice> CoreTelephony is ready", v8, 2u);
      }
    }
    [a4 initializeRadio];
  }
}

void sub_10002B374(uint64_t a1)
{
  sub_100037EA0(*(__CFDictionary **)(*(void *)(a1 + 32) + 140), kCTThermalTxBackoff, kCFNumberSInt32Type, (const void *)(*(void *)(a1 + 32) + 172));
  [*(id *)(a1 + 32) setAdditionalRadioMitigations];
  uint64_t v2 = _CTServerConnectionConfigMaxRadioPower();
  if (v2)
  {
    uint64_t v3 = qword_1000AABC0;
    if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_ERROR)) {
      sub_100056D4C(v2, SHIDWORD(v2), v3);
    }
  }
}

id sub_10002BA74(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) handleBrightnessClientNotification:a2 value:a3];
}

id sub_10002BBCC(uint64_t a1)
{
  return [*(id *)(a1 + 32) processPotentialSolarStateChange:1];
}

float sub_10002BC58(uint64_t a1)
{
  *(_DWORD *)(*(void *)(a1 + 32) + 28) = *(_DWORD *)(a1 + 40);
  if (byte_1000AA7A0)
  {
    uint64_t v2 = qword_1000AABC0;
    if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_DEFAULT))
    {
      int v3 = *(_DWORD *)(*(void *)(a1 + 32) + 28);
      v5[0] = 67109120;
      v5[1] = v3;
      _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "<Notice> _currentSemanticAmbientLightLevel %d", (uint8_t *)v5, 8u);
    }
  }
  [*(id *)(a1 + 32) processPotentialSolarStateChange:0];
  float result = (float)*(unsigned int *)(*(void *)(a1 + 32) + 28);
  *(float *)&dword_1000AAE10 = result;
  return result;
}

void sub_10002C258(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 48), 8);
  _Unwind_Resume(a1);
}

id sub_10002C27C(void *a1, uint64_t a2, void *a3)
{
  id result = [a3 BOOLValue];
  uint64_t v5 = *(void *)(a1[5] + 8);
  if (*(unsigned __int8 *)(v5 + 24) != result || !*(unsigned char *)(*(void *)(a1[6] + 8) + 24))
  {
    *(unsigned char *)(v5 + 24) = (_BYTE)result;
    *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = 1;
    uint64_t v6 = *(uint64_t (**)(void))(a1[4] + 16);
    return (id)v6();
  }
  return result;
}

id sub_10002C3E0(uint64_t a1)
{
  return [*(id *)(a1 + 32) unregisterNotificationForKeys:*(void *)(a1 + 40)];
}

uint64_t sub_10002C4DC(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void, BOOL))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), a2 != 0);
}

void sub_10002C504(id a1)
{
  qword_1000AA0C0 = objc_alloc_init(ContextAwareThermalManager);
}

NSDictionary *sub_10002CA48(uint64_t a1)
{
  v3[0] = @"TG0B";
  v4[0] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 32)];
  v3[1] = @"PMU_Tdev1";
  v4[1] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 36)];
  v3[2] = @"PMU_Tdev2";
  _DWORD v4[2] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 40)];
  v3[3] = @"PMU_Tdev3";
  v4[3] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 44)];
  v3[4] = @"PMU_Tdev4";
  v4[4] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 48)];
  v3[5] = @"PMU_Tdev5";
  v4[5] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 52)];
  v3[6] = @"PMU2_Tdev1";
  void v4[6] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 56)];
  v3[7] = @"PMU2_Tdev2";
  v4[7] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 60)];
  v3[8] = @"PMU2_Tdev3";
  v4[8] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 64)];
  v3[9] = @"TSBM";
  v4[9] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 68)];
  void v3[10] = @"TSFD";
  void v4[10] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 72)];
  void v3[11] = @"TSBQ";
  void v4[11] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 76)];
  void v3[12] = @"TSBR";
  void v4[12] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 80)];
  void v3[13] = @"Die_Temp_MaxAverage";
  void v4[13] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 84)];
  void v3[14] = @"Die_Temp_MaxMax";
  void v4[14] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 88)];
  void v3[15] = @"maxLI_PackagePower";
  void v4[15] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 92)];
  void v3[16] = @"maxLI_Speaker";
  uint8_t v4[16] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 96)];
  v3[17] = @"BackLight_maxLI";
  v4[17] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 100)];
  v3[18] = @"Solar_Context";
  v4[18] = +[NSNumber numberWithInt:*(unsigned __int8 *)(a1 + 120)];
  void v3[19] = @"Pressure_Level";
  void v4[19] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 104)];
  v3[20] = @"Gas_Gauge_avg_Power";
  v4[20] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 108)];
  void v3[21] = @"Charger_State";
  void v4[21] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 112)];
  v3[22] = @"Package_Power";
  v4[22] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 116)];
  return +[NSDictionary dictionaryWithObjects:v4 forKeys:v3 count:23];
}

uint64_t sub_10002DA68(uint64_t result)
{
  *(void *)id result = 0;
  *(void *)(result + 8) = 0;
  *(unsigned char *)(result + 16) = 0;
  return result;
}

uint64_t sub_10002DA74(uint64_t a1)
{
  dispatch_release(*(dispatch_object_t *)(a1 + 24));
  uint64_t v2 = *(std::__shared_weak_count **)(a1 + 8);
  if (v2) {
    sub_10002E848(v2);
  }
  return a1;
}

void sub_10002DAB0(uint64_t *a1, uint64_t a2)
{
  uint64_t v4 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  a1[3] = (uint64_t)dispatch_queue_create("com.apple.ThermalMonitor.radioSensorQueue", v4);
  sub_10002E6B8(__p, "cltm");
  abm::client::CreateManager();
  long long v5 = *(_OWORD *)v23;
  v23[0] = 0;
  v23[1] = 0;
  uint64_t v6 = (std::__shared_weak_count *)a1[1];
  *(_OWORD *)a1 = v5;
  if (v6)
  {
    sub_10002E848(v6);
    if (v23[1]) {
      sub_10002E848((std::__shared_weak_count *)v23[1]);
    }
  }
  if (v21 < 0) {
    operator delete(__p[0]);
  }
  uint64_t v7 = (std::__shared_weak_count *)a1[1];
  uint64_t v33 = *a1;
  int v34 = v7;
  if (v7) {
    atomic_fetch_add_explicit(&v7->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  sub_10002E6B8(__p, abm::kEventBasebandBootStateChange);
  long long v27 = _NSConcreteStackBlock;
  uint64_t v28 = 0x40000000;
  long long v29 = sub_10002DD78;
  v30 = &unk_100085D88;
  uint64_t v31 = a2;
  v32 = a1;
  abm::client::RegisterEventHandler();
  if (v21 < 0) {
    operator delete(__p[0]);
  }
  if (v34) {
    sub_10002E848(v34);
  }
  uint64_t v8 = (std::__shared_weak_count *)a1[1];
  uint64_t v25 = *a1;
  long long v26 = v8;
  if (v8) {
    atomic_fetch_add_explicit(&v8->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  abm::client::EventsOn();
  if (v26) {
    sub_10002E848(v26);
  }
  v23[0] = 0;
  v23[1] = 0;
  uint64_t v24 = 0;
  uint64_t v9 = (std::__shared_weak_count *)a1[1];
  uint64_t v19 = v9;
  if (v9) {
    atomic_fetch_add_explicit(&v9->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  abm::client::GetBasebandBootState();
  if (v19) {
    sub_10002E848(v19);
  }
  if (LODWORD(__p[0]))
  {
    BOOL v10 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v10) {
      sub_100057034(v10, v11, v12, v13, v14, v15, v16, v17);
    }
  }
  else
  {
    if (v24 >= 0) {
      int v18 = v23;
    }
    else {
      int v18 = (void **)v23[0];
    }
    if (!strcmp((const char *)v18, abm::kBasebandBootStateIsReady)) {
      *((unsigned char *)a1 + 16) = 1;
    }
  }
  if (*((unsigned char *)a1 + 16)) {
    (*(void (**)(uint64_t, uint64_t))(a2 + 16))(a2, 1);
  }
  if (v22 < 0) {
    operator delete(__p[1]);
  }
  if (SHIBYTE(v24) < 0) {
    operator delete(v23[0]);
  }
}

void sub_10002DCE8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *a11, void *__p, int a13, __int16 a14, char a15, char a16, int a17, __int16 a18, char a19, char a20,void *a21,uint64_t a22,int a23,__int16 a24,char a25,char a26,uint64_t a27,uint64_t a28,uint64_t a29)
{
  if (a20 < 0) {
    operator delete(__p);
  }
  if (a26 < 0) {
    operator delete(a21);
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_10002DD78(uint64_t a1, xpc_object_t xdict)
{
  uint64_t v3 = *(void *)(a1 + 40);
  string = xpc_dictionary_get_string(xdict, abm::kKeyBasebandBootState);
  if (!strcmp(string, abm::kBasebandBootStateIsReady))
  {
    *(unsigned char *)(v3 + 16) = 1;
    sub_10002DE7C((uint64_t *)v3);
    long long v5 = *(std::__shared_weak_count **)(v3 + 8);
    uint64_t v9 = v5;
    if (v5) {
      atomic_fetch_add_explicit(&v5->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    abm::client::EventsOff();
    if (v9) {
      sub_10002E848(v9);
    }
    uint64_t v6 = *(std::__shared_weak_count **)(v3 + 8);
    uint64_t v8 = v6;
    if (v6) {
      atomic_fetch_add_explicit(&v6->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    abm::client::EventsOn();
    if (v8) {
      sub_10002E848(v8);
    }
  }
  else
  {
    *(unsigned char *)(v3 + 16) = 0;
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32));
}

void sub_10002DE54(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, std::__shared_weak_count *a10, uint64_t a11, uint64_t a12)
{
  if (a10) {
    sub_10002E848(a10);
  }
  _Unwind_Resume(exception_object);
}

void sub_10002DE7C(uint64_t *a1)
{
  keys = (char *)abm::kKeyFrequency;
  xpc_object_t values = xpc_int64_create(5000);
  if (xpc_dictionary_create((const char *const *)&keys, &values, 1uLL))
  {
    uint64_t v2 = (std::__shared_weak_count *)a1[1];
    uint64_t v13 = *a1;
    uint64_t v14 = v2;
    if (v2) {
      atomic_fetch_add_explicit(&v2->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    sub_10002E6B8(&__p, abm::kConfigThermalReportFrequency);
    abm::client::PerformCommand();
    if (v12 < 0) {
      operator delete(__p);
    }
    if (v14) {
      sub_10002E848(v14);
    }
  }
  else
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_100057070(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

void sub_10002DF80(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, uint64_t a15, std::__shared_weak_count *a16)
{
  if (a14 < 0) {
    operator delete(__p);
  }
  if (a16) {
    sub_10002E848(a16);
  }
  _Unwind_Resume(exception_object);
}

void sub_10002DFB8(uint64_t *a1)
{
  uint64_t v1 = (std::__shared_weak_count *)a1[1];
  uint64_t v4 = *a1;
  uint64_t v5 = v1;
  if (v1) {
    atomic_fetch_add_explicit(&v1->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  sub_10002E6B8(&__p, abm::kQueryThermalIDs);
  abm::client::PerformCommand();
  if (v3 < 0) {
    operator delete(__p);
  }
  if (v5) {
    sub_10002E848(v5);
  }
}

void sub_10002E084(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *__p, uint64_t a15, int a16, __int16 a17, char a18, char a19)
{
  if (a19 < 0) {
    operator delete(__p);
  }
  char v21 = *(std::__shared_weak_count **)(v19 - 24);
  if (v21) {
    sub_10002E848(v21);
  }
  _Unwind_Resume(exception_object);
}

void sub_10002E0B4(uint64_t a1, int *a2, xpc_object_t object)
{
  if (!object || *a2)
  {
    BOOL v16 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v16) {
      sub_100057124(v16, v17, v18, v19, v20, v21, v22, v23);
    }
    uint64_t v24 = *(void *)(a1 + 32);
    uint64_t v52 = 0;
    uint64_t v53 = 0;
    uint64_t v51 = 0;
    (*(void (**)(void))(v24 + 16))();
  }
  else
  {
    xpc_object_t v5 = xpc_retain(object);
    if (v5)
    {
      uint64_t v6 = v5;
      if (xpc_get_type(v5) == (xpc_type_t)&_xpc_type_dictionary)
      {
        xpc_object_t value = xpc_dictionary_get_value(v6, abm::kKeyThermalIDs);
        bytes_ptr = (char *)xpc_data_get_bytes_ptr(value);
        size_t length = xpc_data_get_length(value);
        v42 = 0;
        v43 = 0;
        uint64_t v44 = 0;
        sub_10002E8BC((uint64_t)&v42, 0, bytes_ptr, &bytes_ptr[length], length);
        uint64_t v37 = *(void *)(a1 + 32);
        int v38 = *a2;
        v40 = 0;
        uint64_t v41 = 0;
        __p = 0;
        sub_10002EABC(&__p, v42, (uint64_t)v43, v43 - (unsigned char *)v42);
        (*(void (**)(uint64_t, BOOL, void **))(v37 + 16))(v37, v38 == 0, &__p);
        if (__p)
        {
          v40 = __p;
          operator delete(__p);
        }
        if (v42)
        {
          v43 = v42;
          operator delete(v42);
        }
      }
      else
      {
        BOOL v7 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
        if (v7) {
          sub_1000570E8(v7, v8, v9, v10, v11, v12, v13, v14);
        }
        uint64_t v15 = *(void *)(a1 + 32);
        uint64_t v46 = 0;
        uint64_t v47 = 0;
        uint64_t v45 = 0;
        (*(void (**)(void))(v15 + 16))();
      }
    }
    else
    {
      BOOL v25 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
      if (v25) {
        sub_1000570AC(v25, v26, v27, v28, v29, v30, v31, v32);
      }
      uint64_t v33 = *(void *)(a1 + 32);
      uint64_t v49 = 0;
      uint64_t v50 = 0;
      uint64_t v48 = 0;
      (*(void (**)(void))(v33 + 16))();
    }
  }
}

void sub_10002E2A0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, uint64_t a12, void *a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20)
{
  if (__p) {
    operator delete(__p);
  }
  if (a13) {
    operator delete(a13);
  }
  _Unwind_Resume(exception_object);
}

void sub_10002E314(id a1, Result *a2)
{
  if (a2->var0)
  {
    BOOL v2 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v2) {
      sub_100057160(v2, v3, v4, v5, v6, v7, v8, v9);
    }
  }
}

void sub_10002E34C(uint64_t *a1)
{
  BOOL v2 = (std::__shared_weak_count *)a1[1];
  uint64_t v9 = *a1;
  uint64_t v10 = v2;
  if (v2) {
    atomic_fetch_add_explicit(&v2->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  sub_10002E6B8(&v7, abm::kEventThermalReport);
  abm::client::RegisterEventHandler();
  if (v8 < 0) {
    operator delete(v7);
  }
  if (v10) {
    sub_10002E848(v10);
  }
  uint64_t v3 = (std::__shared_weak_count *)a1[1];
  uint64_t v6 = v3;
  if (v3) {
    atomic_fetch_add_explicit(&v3->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  abm::client::EventsOff();
  if (v6) {
    sub_10002E848(v6);
  }
  uint64_t v4 = (std::__shared_weak_count *)a1[1];
  uint64_t v5 = v4;
  if (v4) {
    atomic_fetch_add_explicit(&v4->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  abm::client::EventsOn();
  if (v5) {
    sub_10002E848(v5);
  }
}

void sub_10002E470(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, std::__shared_weak_count *a10, uint64_t a11, uint64_t a12)
{
  if (a10) {
    sub_10002E848(a10);
  }
  _Unwind_Resume(exception_object);
}

void sub_10002E4C0(uint64_t a1, xpc_object_t object)
{
  xpc_object_t v3 = xpc_retain(object);
  if (v3)
  {
    uint64_t v4 = v3;
    if (xpc_get_type(v3) == (xpc_type_t)&_xpc_type_dictionary)
    {
      xpc_object_t value = xpc_dictionary_get_value(v4, abm::kKeyThermalData);
      bytes_ptr = (char *)xpc_data_get_bytes_ptr(value);
      int64_t length = xpc_data_get_length(value);
      uint64_t v30 = 0;
      uint64_t v31 = 0;
      uint64_t v32 = 0;
      sub_10002EB7C((uint64_t)&v30, 0, bytes_ptr, &bytes_ptr[length & 0xFFFFFFFFFFFFFFF8], length >> 3);
      uint64_t v26 = *(void *)(a1 + 32);
      uint64_t v28 = 0;
      uint64_t v29 = 0;
      __p = 0;
      sub_10002EE8C(&__p, v30, (uint64_t)v31, (v31 - (unsigned char *)v30) >> 3);
      (*(void (**)(uint64_t, uint64_t, void **))(v26 + 16))(v26, 1, &__p);
      if (__p)
      {
        uint64_t v28 = __p;
        operator delete(__p);
      }
      if (v30)
      {
        uint64_t v31 = v30;
        operator delete(v30);
      }
    }
    else
    {
      BOOL v5 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
      if (v5) {
        sub_1000570E8(v5, v6, v7, v8, v9, v10, v11, v12);
      }
      uint64_t v13 = *(void *)(a1 + 32);
      uint64_t v34 = 0;
      uint64_t v35 = 0;
      uint64_t v33 = 0;
      (*(void (**)(void))(v13 + 16))();
    }
  }
  else
  {
    BOOL v14 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v14) {
      sub_1000570AC(v14, v15, v16, v17, v18, v19, v20, v21);
    }
    uint64_t v22 = *(void *)(a1 + 32);
    uint64_t v37 = 0;
    uint64_t v38 = 0;
    uint64_t v36 = 0;
    (*(void (**)(void))(v22 + 16))();
  }
}

void sub_10002E650(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, uint64_t a11, void *a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16)
{
  if (__p) {
    operator delete(__p);
  }
  if (a12) {
    operator delete(a12);
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_10002E6B0(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 16);
}

void *sub_10002E6B8(void *a1, char *__s)
{
  size_t v4 = strlen(__s);
  if (v4 >= 0x7FFFFFFFFFFFFFF8) {
    sub_10002E76C();
  }
  size_t v5 = v4;
  if (v4 >= 0x17)
  {
    uint64_t v7 = (v4 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v4 | 7) != 0x17) {
      uint64_t v7 = v4 | 7;
    }
    uint64_t v8 = v7 + 1;
    uint64_t v6 = operator new(v7 + 1);
    a1[1] = v5;
    a1[2] = v8 | 0x8000000000000000;
    *a1 = v6;
  }
  else
  {
    *((unsigned char *)a1 + 23) = v4;
    uint64_t v6 = a1;
    if (!v4) {
      goto LABEL_9;
    }
  }
  memmove(v6, __s, v5);
LABEL_9:
  *((unsigned char *)v6 + v5) = 0;
  return a1;
}

void sub_10002E76C()
{
}

void sub_10002E784(const char *a1)
{
  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  sub_10002E7E0(exception, a1);
}

void sub_10002E7CC(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

std::logic_error *sub_10002E7E0(std::logic_error *a1, const char *a2)
{
  id result = std::logic_error::logic_error(a1, a2);
  return result;
}

void sub_10002E814()
{
  exception = (std::bad_array_new_length *)__cxa_allocate_exception(8uLL);
  uint64_t v1 = std::bad_array_new_length::bad_array_new_length(exception);
}

void sub_10002E848(std::__shared_weak_count *a1)
{
  if (!atomic_fetch_add(&a1->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))a1->__on_zero_shared)(a1);
    std::__shared_weak_count::__release_weak(a1);
  }
}

char *sub_10002E8BC(uint64_t a1, char *__dst, char *__src, char *a4, int64_t a5)
{
  size_t v5 = __dst;
  if (a5 < 1) {
    return v5;
  }
  uint64_t v10 = *(char **)(a1 + 8);
  uint64_t v9 = *(void *)(a1 + 16);
  if (v9 - (uint64_t)v10 < a5)
  {
    uint64_t v11 = *(char **)a1;
    uint64_t v12 = (uint64_t)&v10[a5 - *(void *)a1];
    if (v12 < 0) {
      sub_10002EAA4();
    }
    BOOL v14 = (char *)(__dst - v11);
    unint64_t v15 = v9 - (void)v11;
    if (2 * v15 > v12) {
      uint64_t v12 = 2 * v15;
    }
    if (v15 >= 0x3FFFFFFFFFFFFFFFLL) {
      size_t v16 = 0x7FFFFFFFFFFFFFFFLL;
    }
    else {
      size_t v16 = v12;
    }
    if (v16)
    {
      size_t v17 = v16;
      uint64_t v18 = (char *)operator new(v16);
    }
    else
    {
      size_t v17 = 0;
      uint64_t v18 = 0;
    }
    uint64_t v28 = &v14[(void)v18];
    memcpy(&v14[(void)v18], __src, a5);
    uint64_t v29 = &v14[(void)v18];
    size_t v30 = v17;
    if (v11 != v5)
    {
      do
      {
        v14[(void)v18 - 1] = v14[(void)(v11 - 1)];
        --v14;
      }
      while (v14);
      uint64_t v29 = v18;
    }
    uint64_t v31 = &v28[a5];
    uint64_t v32 = &v18[v30];
    if (v10 != v5) {
      memmove(v31, v5, v10 - v5);
    }
    *(void *)a1 = v29;
    *(void *)(a1 + 8) = &v31[v10 - v5];
    *(void *)(a1 + 16) = v32;
    if (v11) {
      operator delete(v11);
    }
    return v28;
  }
  uint64_t v19 = v10 - __dst;
  if (v10 - __dst >= a5)
  {
    uint64_t v20 = &__src[a5];
    uint64_t v22 = *(char **)(a1 + 8);
LABEL_17:
    uint64_t v23 = &v5[a5];
    uint64_t v24 = &v22[-a5];
    BOOL v25 = v22;
    if (&v22[-a5] < v10)
    {
      int64_t v26 = &v10[a5] - v22;
      BOOL v25 = v22;
      do
      {
        char v27 = *v24++;
        *v25++ = v27;
        --v26;
      }
      while (v26);
    }
    *(void *)(a1 + 8) = v25;
    if (v22 != v23) {
      memmove(&v5[a5], v5, v22 - v23);
    }
    if (v20 != __src) {
      memmove(v5, __src, v20 - __src);
    }
    return v5;
  }
  uint64_t v20 = &__src[v19];
  int64_t v21 = a4 - &__src[v19];
  if (a4 != &__src[v19]) {
    memmove(*(void **)(a1 + 8), &__src[v19], a4 - &__src[v19]);
  }
  uint64_t v22 = &v10[v21];
  *(void *)(a1 + 8) = &v10[v21];
  if (v19 >= 1) {
    goto LABEL_17;
  }
  return v5;
}

void sub_10002EAA4()
{
}

void *sub_10002EABC(void *result, const void *a2, uint64_t a3, size_t __sz)
{
  if (__sz)
  {
    uint64_t v6 = result;
    id result = sub_10002EB38(result, __sz);
    uint64_t v7 = v6[1];
    size_t v8 = a3 - (void)a2;
    if (v8) {
      id result = memmove((void *)v6[1], a2, v8);
    }
    v6[1] = v7 + v8;
  }
  return result;
}

void sub_10002EB1C(_Unwind_Exception *exception_object)
{
  xpc_object_t v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

char *sub_10002EB38(void *a1, size_t __sz)
{
  if ((__sz & 0x8000000000000000) != 0) {
    sub_10002EAA4();
  }
  id result = (char *)operator new(__sz);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[__sz];
  return result;
}

char *sub_10002EB7C(uint64_t a1, uint64_t __dst, char *__src, char *a4, uint64_t a5)
{
  size_t v5 = (char *)__dst;
  if (a5 < 1) {
    return v5;
  }
  uint64_t v7 = __src;
  uint64_t v11 = *(void *)(a1 + 16);
  uint64_t v9 = a1 + 16;
  uint64_t v10 = v11;
  unint64_t v12 = *(void *)(v9 - 8);
  if (a5 > (uint64_t)(v11 - v12) >> 3)
  {
    uint64_t v13 = *(void **)a1;
    unint64_t v14 = a5 + ((uint64_t)(v12 - *(void *)a1) >> 3);
    if (v14 >> 61) {
      sub_10002EAA4();
    }
    uint64_t v15 = (__dst - (uint64_t)v13) >> 3;
    uint64_t v16 = v10 - (void)v13;
    if (v16 >> 2 > v14) {
      unint64_t v14 = v16 >> 2;
    }
    if ((unint64_t)v16 >= 0x7FFFFFFFFFFFFFF8) {
      unint64_t v17 = 0x1FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v17 = v14;
    }
    uint64_t v37 = v9;
    if (v17) {
      uint64_t v18 = (char *)sub_10002EE54(v9, v17);
    }
    else {
      uint64_t v18 = 0;
    }
    uint64_t v28 = &v18[8 * v15];
    __p = v18;
    uint64_t v34 = v28;
    uint64_t v36 = &v18[8 * v17];
    uint64_t v29 = 8 * a5;
    size_t v30 = &v28[8 * a5];
    do
    {
      uint64_t v31 = *(void *)v7;
      v7 += 8;
      *(void *)uint64_t v28 = v31;
      v28 += 8;
      v29 -= 8;
    }
    while (v29);
    uint64_t v35 = v30;
    size_t v5 = sub_10002ED8C((void **)a1, (uint64_t)&__p, v5);
    if (v35 != v34) {
      v35 += (v34 - v35 + 7) & 0xFFFFFFFFFFFFFFF8;
    }
    if (__p) {
      operator delete(__p);
    }
    return v5;
  }
  uint64_t v19 = v12 - __dst;
  uint64_t v20 = (uint64_t)(v12 - __dst) >> 3;
  if (v20 >= a5)
  {
    int64_t v21 = &__src[8 * a5];
    uint64_t v23 = *(char **)(v9 - 8);
LABEL_17:
    uint64_t v24 = &v5[8 * a5];
    BOOL v25 = &v23[-8 * a5];
    int64_t v26 = v23;
    if ((unint64_t)v25 < v12)
    {
      int64_t v26 = v23;
      do
      {
        uint64_t v27 = *(void *)v25;
        v25 += 8;
        *(void *)int64_t v26 = v27;
        v26 += 8;
      }
      while ((unint64_t)v25 < v12);
    }
    *(void *)(a1 + 8) = v26;
    if (v23 != v24) {
      memmove(&v23[-8 * ((v23 - v24) >> 3)], v5, v23 - v24);
    }
    if (v21 != v7) {
      memmove(v5, v7, v21 - v7);
    }
    return v5;
  }
  int64_t v21 = &__src[8 * v20];
  int64_t v22 = a4 - v21;
  if (a4 != v21) {
    memmove(*(void **)(v9 - 8), &__src[8 * v20], a4 - v21);
  }
  uint64_t v23 = (char *)(v12 + v22);
  *(void *)(a1 + 8) = v12 + v22;
  if (v19 >= 1) {
    goto LABEL_17;
  }
  return v5;
}

void sub_10002ED54(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, uint64_t a12)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

char *sub_10002ED8C(void **a1, uint64_t a2, char *__src)
{
  size_t v5 = *(char **)(a2 + 8);
  uint64_t v6 = (char *)*a1;
  uint64_t v7 = v5;
  if (*a1 != __src)
  {
    size_t v8 = __src;
    uint64_t v7 = *(char **)(a2 + 8);
    do
    {
      uint64_t v9 = *((void *)v8 - 1);
      v8 -= 8;
      *((void *)v7 - 1) = v9;
      v7 -= 8;
    }
    while (v8 != v6);
  }
  *(void *)(a2 + 8) = v7;
  uint64_t v10 = a1[1];
  uint64_t v11 = *(void *)(a2 + 16);
  int64_t v12 = v10 - __src;
  if (v10 != __src)
  {
    memmove(*(void **)(a2 + 16), __src, v10 - __src);
    uint64_t v7 = *(char **)(a2 + 8);
  }
  *(void *)(a2 + 16) = v11 + v12;
  uint64_t v13 = (char *)*a1;
  *a1 = v7;
  *(void *)(a2 + 8) = v13;
  unint64_t v14 = a1[1];
  a1[1] = *(void **)(a2 + 16);
  *(void *)(a2 + 16) = v14;
  uint64_t v15 = a1[2];
  a1[2] = *(void **)(a2 + 24);
  *(void *)(a2 + 24) = v15;
  *(void *)a2 = *(void *)(a2 + 8);
  return v5;
}

void *sub_10002EE54(uint64_t a1, unint64_t a2)
{
  if (a2 >> 61) {
    sub_10002E814();
  }
  return operator new(8 * a2);
}

void *sub_10002EE8C(void *result, const void *a2, uint64_t a3, unint64_t a4)
{
  if (a4)
  {
    uint64_t v6 = result;
    id result = sub_10002EF08(result, a4);
    uint64_t v7 = v6[1];
    size_t v8 = a3 - (void)a2;
    if (v8) {
      id result = memmove((void *)v6[1], a2, v8);
    }
    v6[1] = v7 + v8;
  }
  return result;
}

void sub_10002EEEC(_Unwind_Exception *exception_object)
{
  xpc_object_t v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

char *sub_10002EF08(void *a1, unint64_t a2)
{
  if (a2 >> 61) {
    sub_10002EAA4();
  }
  id result = (char *)sub_10002EE54((uint64_t)(a1 + 2), a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[8 * v4];
  return result;
}

void sub_10002F2C8(id a1)
{
  qword_1000AA0D0 = objc_alloc_init(RadioTS);
}

void sub_10002F494(uint64_t a1, int a2)
{
  if (byte_1000AA7A0)
  {
    uint64_t v4 = qword_1000AABC0;
    if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_DEFAULT))
    {
      CFStringRef v5 = @"not ";
      if (a2) {
        CFStringRef v5 = &stru_100089390;
      }
      int v6 = 138412290;
      CFStringRef v7 = v5;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "<Notice> Baseband is %@ready", (uint8_t *)&v6, 0xCu);
    }
  }
  if (a2) {
    [*(id *)(a1 + 32) queryThermalSensorInfo];
  }
}

void sub_10002F630(uint64_t a1, int a2, unsigned __int8 **a3)
{
  if (!a2 || (xpc_object_t v3 = *a3, v4 = a3[1], *a3 == v4))
  {
    if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_ERROR)) {
      sub_100057238();
    }
  }
  else
  {
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    CFStringRef v7 = sub_10002F6FC;
    size_t v8 = &unk_100085E88;
    uint64_t v9 = *(void *)(a1 + 32);
    do
    {
      int v5 = *v3++;
      v7((uint64_t)v6, v5);
    }
    while (v3 != v4);
  }
}

void sub_10002F6FC(uint64_t a1, int a2)
{
  if (byte_1000AA7A0)
  {
    uint64_t v4 = qword_1000AABC0;
    if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_DEFAULT))
    {
      v5[0] = 67109120;
      v5[1] = a2;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "<Notice> Got info for Baseband Thermal ID: %d", (uint8_t *)v5, 8u);
    }
  }
  if (a2 != 255) {
    *(unsigned char *)(*(void *)(a1 + 32) + 20) = 1;
  }
}

void sub_10002F840(uint64_t a1, int a2, unint64_t **a3)
{
  if (!a2 || (xpc_object_t v3 = *a3, v4 = a3[1], *a3 == v4))
  {
    if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_ERROR)) {
      sub_10005726C();
    }
  }
  else
  {
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    CFStringRef v7 = sub_10002F90C;
    size_t v8 = &unk_100085ED8;
    uint64_t v9 = *(void *)(a1 + 32);
    do
    {
      unint64_t v5 = *v3++;
      v7((uint64_t)v6, v5);
    }
    while (v3 != v4);
  }
}

void sub_10002F90C(uint64_t a1, unint64_t a2)
{
  unsigned __int8 v2 = a2;
  uint64_t v4 = HIDWORD(a2);
  if (byte_1000AA7A0)
  {
    unint64_t v5 = qword_1000AABC0;
    if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_DEFAULT))
    {
      v7[0] = 67109376;
      v7[1] = v2;
      __int16 v8 = 1024;
      int v9 = v4;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "<Notice> Baseband sensor ID: %d temperature %d", (uint8_t *)v7, 0xEu);
    }
  }
  switch(v2)
  {
    case 2u:
      uint64_t v6 = *(unsigned int *)(*(void *)(a1 + 32) + 16);
      if ((v6 & 0x80000000) != 0) {
        return;
      }
      goto LABEL_10;
    case 1u:
      uint64_t v6 = *(unsigned int *)(*(void *)(a1 + 32) + 12);
      if ((v6 & 0x80000000) != 0) {
        return;
      }
      goto LABEL_10;
    case 0u:
      uint64_t v6 = *(unsigned int *)(*(void *)(a1 + 32) + 8);
      if ((v6 & 0x80000000) == 0) {
LABEL_10:
      }
        sub_100031714(v6, v4);
      break;
  }
}

NSDictionary *sub_100030064(uint64_t a1)
{
  v3[0] = @"TG0B";
  v4[0] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 32)];
  v3[1] = @"PMU_Tdev1";
  v4[1] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 36)];
  v3[2] = @"PMU_Tdev2";
  _DWORD v4[2] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 40)];
  v3[3] = @"Die_Temp_MaxAverage";
  v4[3] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 44)];
  v3[4] = @"Die_Temp_MaxMax";
  v4[4] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 48)];
  v3[5] = @"TSFC";
  v4[5] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 52)];
  v3[6] = @"TSRR";
  void v4[6] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 56)];
  v3[7] = @"TSFD";
  v4[7] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 60)];
  v3[8] = @"TSRM";
  v4[8] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 64)];
  v3[9] = @"Charger_State";
  v4[9] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 68)];
  void v3[10] = @"Solar_Context";
  void v4[10] = +[NSNumber numberWithInt:*(unsigned __int8 *)(a1 + 76)];
  void v3[11] = @"Pressure_Level";
  void v4[11] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 72)];
  return +[NSDictionary dictionaryWithObjects:v4 forKeys:v3 count:12];
}

NSDictionary *sub_100030468(uint64_t a1)
{
  v3[0] = @"TG0B";
  v4[0] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 32)];
  v3[1] = @"PMU_Tdev3";
  v4[1] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 36)];
  v3[2] = @"PMU_Tdev4";
  _DWORD v4[2] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 40)];
  v3[3] = @"PMU_Tdev5";
  v4[3] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 44)];
  v3[4] = @"PMU_Tdev7";
  v4[4] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 48)];
  v3[5] = @"Die_Temp_MaxAverage";
  v4[5] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 52)];
  v3[6] = @"TSFD";
  void v4[6] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 56)];
  v3[7] = @"TSBH";
  v4[7] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 60)];
  v3[8] = @"Solar_Context";
  v4[8] = +[NSNumber numberWithInt:*(unsigned __int8 *)(a1 + 68)];
  v3[9] = @"Pressure_Level";
  v4[9] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 64)];
  return +[NSDictionary dictionaryWithObjects:v4 forKeys:v3 count:10];
}

NSDictionary *sub_100030C98(uint64_t a1)
{
  v5[0] = @"TG0B";
  v6[0] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 40)];
  v5[1] = @"TG0V";
  v6[1] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 44)];
  _DWORD v5[2] = @"PMU_Tdev1";
  void v6[2] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 48)];
  v5[3] = @"PMU_Tdev2";
  v6[3] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 52)];
  v5[4] = @"TSRR";
  v6[4] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 56)];
  void v5[5] = @"TSBR";
  v6[5] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 60)];
  v5[6] = @"TSRM";
  v6[6] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 64)];
  v5[7] = @"TSFL";
  v6[7] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 68)];
  v5[8] = @"TSFC";
  v6[8] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 72)];
  v5[9] = @"TSFD";
  v6[9] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 76)];
  v5[10] = @"mic2";
  v6[10] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 80)];
  v5[11] = @"TSBQ";
  v6[11] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 84)];
  v5[12] = @"Die_Temp_MaxAverage";
  v6[12] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 88)];
  v5[13] = @"Die_Temp_MaxMax";
  v6[13] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 92)];
  v5[14] = @"Package_Power";
  v6[14] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 96)];
  v5[15] = @"Charger_State";
  v6[15] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 100)];
  v5[16] = @"Solar_Context";
  v6[16] = +[NSNumber numberWithInt:*(unsigned __int8 *)(a1 + 108)];
  v5[17] = @"Pressure_Level";
  unsigned __int8 v2 = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 104)];
  v5[18] = @"Device_Activity";
  uint64_t v3 = *(void *)(a1 + 32);
  v6[17] = v2;
  v6[18] = v3;
  return +[NSDictionary dictionaryWithObjects:v6 forKeys:v5 count:19];
}

void sub_100030F18(id a1)
{
  qword_1000AA0E0 = objc_alloc_init(SensorExchangeHelper);
}

void sub_1000314E4(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0xEu);
}

void *sub_100031510()
{
  size_t v7 = 1024;
  int v0 = sysctlbyname("kern.bootargs", &unk_1000AA7C0, &v7, 0, 0);
  uint64_t v1 = qword_1000AABC0;
  BOOL v2 = os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_DEFAULT);
  if (v0)
  {
    if (v2)
    {
      uint64_t v3 = __error();
      uint64_t v4 = strerror(*v3);
      *(_DWORD *)buf = 136315138;
      int v9 = v4;
      _os_log_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_DEFAULT, "<Notice> could not retrieve device boot-args, failed with error: %s", buf, 0xCu);
    }
    return &unk_100068C64;
  }
  else
  {
    unint64_t v5 = &unk_1000AA7C0;
    if (v2)
    {
      *(_DWORD *)buf = 136315138;
      int v9 = (char *)&unk_1000AA7C0;
      _os_log_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_DEFAULT, "<Notice> retrieved current device boot-args: %s", buf, 0xCu);
    }
  }
  return v5;
}

id sub_100031638(uint64_t a1)
{
  [(id)qword_1000AA7A8 updateNotifyTokens];
  id v2 = [(id)qword_1000AA0E8 getMaxSensorValue];
  [(id)qword_1000AA7A8 updateMaxValueToken:v2];
  uint64_t v3 = (void *)qword_1000AA7A8;

  return [v3 updateThermalNotification:a1];
}

id sub_100031694(uint64_t a1)
{
  id v2 = (void *)qword_1000AA7A8;
  id v3 = [(id)qword_1000AA0E8 getPotentialForcedThermalPressureLevel];

  return [v2 updateThermalPressureLevelNotification:a1 shouldForceThermalPressure:v3];
}

id sub_1000316E4(uint64_t a1)
{
  return [(id)qword_1000AA7A8 setThermalPressureLevelNotification:a1];
}

id sub_1000316F4(uint64_t a1)
{
  return [(id)qword_1000AA7A8 updateThermalNotification:a1];
}

id sub_100031704(uint64_t a1)
{
  return [(id)qword_1000AA7A8 sendRadioNotification:a1];
}

uint64_t sub_100031714(uint64_t a1, uint64_t a2)
{
  return a2;
}

BOOL sub_100031760(CFStringRef key, const char *a2)
{
  io_registry_entry_t v4 = dword_1000AA200;
  if (!dword_1000AA200)
  {
    io_registry_entry_t v4 = sub_100037CD4(a2, 0, 0);
    dword_1000AA200 = v4;
    if (!v4)
    {
      if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_ERROR)) {
        sub_100057560();
      }
      return 0;
    }
  }
  CFBooleanRef v5 = (const __CFBoolean *)sub_100008350(key, v4);
  if (!v5) {
    return 0;
  }
  CFBooleanRef v6 = v5;
  CFTypeID v7 = CFGetTypeID(v5);
  BOOL v9 = v7 == CFBooleanGetTypeID() && kCFBooleanTrue == v6;
  CFRelease(v6);
  return v9;
}

uint64_t sub_100031818()
{
  return byte_1000AA7BA;
}

id sub_100031824()
{
  if (byte_1000AA230) {
    uint64_t v0 = 0;
  }
  else {
    uint64_t v0 = byte_1000AA21C;
  }
  [+[HidSensors sharedInstance] setInfoOnlySensorsActive:v0];
  uint64_t v1 = +[ContextAwareThermalManager sharedInstance];

  return [(ContextAwareThermalManager *)v1 setInfoOnlySensorsActive:v0];
}

uint64_t sub_10003188C()
{
  return 0;
}

void sub_100031894(const __SCPreferences *a1)
{
  if (SCPreferencesGetValue(a1, @"thermalUseRawValuesPersistentlyEnabled") != kCFBooleanTrue) {
    SCPreferencesSetValue(a1, @"thermalUseRawValues", kCFBooleanFalse);
  }
  if (SCPreferencesGetValue(a1, @"forceSkipInfoOnlySensorsPersistentlyEnabled") != kCFBooleanTrue) {
    SCPreferencesSetValue(a1, @"forceSkipInfoOnlySensors", kCFBooleanFalse);
  }
  if (SCPreferencesGetValue(a1, @"hipPersistentlyEnabled") != kCFBooleanTrue) {
    SCPreferencesSetValue(a1, @"hipOverride", kCFBooleanTrue);
  }
  SCPreferencesSetValue(a1, @"simulateHip", kCFBooleanFalse);
  SCPreferencesSetValue(a1, @"forceHIPWhenConnected", kCFBooleanFalse);
  SCPreferencesSetValue(a1, @"BacklightStatus", kCFBooleanTrue);
  if (SCPreferencesGetValue(a1, @"sunlightOverridePersistentlyEnabled") != kCFBooleanTrue) {
    SCPreferencesRemoveValue(a1, @"sunlightOverride");
  }
  if (SCPreferencesGetValue(a1, @"OSThermalNotificationPersistentlyEnabled") != kCFBooleanTrue) {
    SCPreferencesSetValue(a1, @"OSThermalNotificationEnabled", kCFBooleanTrue);
  }
  if (SCPreferencesGetValue(a1, @"candidateControlLoopsEnabledPersistentlyEnabled") != kCFBooleanTrue) {
    SCPreferencesSetValue(a1, @"candidateControlLoopsEnabled", kCFBooleanFalse);
  }
  if (SCPreferencesGetValue(a1, @"engageBehaviorPersistentlyEnabled") != kCFBooleanTrue) {
    SCPreferencesSetValue(a1, @"engageBehavior", kCFBooleanTrue);
  }
  if (SCPreferencesGetValue(a1, @"overrideControlEffortPersistentlyEnabled") != kCFBooleanTrue) {
    SCPreferencesSetValue(a1, @"overrideControlEffort", kCFBooleanFalse);
  }
  if (SCPreferencesGetValue(a1, @"overrideSensorLIPersistentlyEnabled") != kCFBooleanTrue) {
    SCPreferencesSetValue(a1, @"overrideSensorLI", kCFBooleanFalse);
  }
  if (SCPreferencesGetValue(a1, @"overrideTxMaxLimitPersistentlyEnabled") != kCFBooleanTrue) {
    SCPreferencesSetValue(a1, @"overrideTxMaxLimitKey", kCFBooleanFalse);
  }
  if (SCPreferencesGetValue(a1, @"tGraphTestCaseNumberPersistentlyEnabled") != kCFBooleanTrue) {
    SCPreferencesRemoveValue(a1, @"tGraphTestCaseNumber");
  }
  if (SCPreferencesGetValue(a1, @"tGraphTestCaseNamePersistentlyEnabled") != kCFBooleanTrue) {
    SCPreferencesRemoveValue(a1, @"tGraphTestCaseName");
  }
  if (SCPreferencesGetValue(a1, @"LifetimeServoIntegratorState_P_PersistentlyEnabled") != kCFBooleanTrue) {
    SCPreferencesRemoveValue(a1, @"LifetimeServoIntegratorState_P");
  }
  if (SCPreferencesGetValue(a1, @"LifetimeServoDieTempMaxMaxPersistentlyEnabled") != kCFBooleanTrue) {
    SCPreferencesRemoveValue(a1, @"LifetimeServoDieTempMaxMax");
  }
  if (SCPreferencesGetValue(a1, @"LifetimeServoDieTempMaxAveragePersistentlyEnabled") != kCFBooleanTrue) {
    SCPreferencesRemoveValue(a1, @"LifetimeServoDieTempMaxAverage");
  }
  if (SCPreferencesGetValue(a1, @"LifetimeServoInstantaneousAF_P_PersistentlyEnabled") != kCFBooleanTrue) {
    SCPreferencesRemoveValue(a1, @"LifetimeServoInstantaneousAF_P");
  }
  if (SCPreferencesGetValue(a1, @"LifetimeServoIntegratorState_E_PersistentlyEnabled") != kCFBooleanTrue) {
    SCPreferencesRemoveValue(a1, @"LifetimeServoIntegratorState_E");
  }
  if (SCPreferencesGetValue(a1, @"LifetimeServoInstantaneousAF_E_PersistentlyEnabled") != kCFBooleanTrue) {
    SCPreferencesRemoveValue(a1, @"LifetimeServoInstantaneousAF_E");
  }
  if (SCPreferencesGetValue(a1, @"LifetimeServoIntegratorState_G_PersistentlyEnabled") != kCFBooleanTrue) {
    SCPreferencesRemoveValue(a1, @"LifetimeServoIntegratorState_G");
  }
  if (SCPreferencesGetValue(a1, @"LifetimeServoInstantaneousAF_G_PersistentlyEnabled") != kCFBooleanTrue) {
    SCPreferencesRemoveValue(a1, @"LifetimeServoInstantaneousAF_G");
  }
  if (SCPreferencesGetValue(a1, @"LifetimeServoDieTempTarget_PersistentlyEnabled") != kCFBooleanTrue) {
    SCPreferencesRemoveValue(a1, @"LifetimeServoDieTempTarget");
  }
  if (SCPreferencesGetValue(a1, @"ArcModuleThresholdKeyPersistentlyEnabled") != kCFBooleanTrue) {
    SCPreferencesRemoveValue(a1, @"ArcModuleThresholdKey");
  }
  if (SCPreferencesGetValue(a1, @"ArcVirtualThresholdKeyPersistentlyEnabled") != kCFBooleanTrue) {
    SCPreferencesRemoveValue(a1, @"ArcVirtualThresholdKey");
  }
  if (SCPreferencesGetValue(a1, @"OSThermalNotificationLoggingEnabledPersistentlyEnabled") != kCFBooleanTrue) {
    SCPreferencesSetValue(a1, @"OSThermalNotificationLoggingEnabled", kCFBooleanFalse);
  }
  id v2 = (char *)sub_100031510();
  if (strstr(v2, "default_tgraph_disabled"))
  {
    id v3 = a1;
LABEL_58:
    SCPreferencesRemoveValue(v3, @"tGraphLogFile");
    goto LABEL_59;
  }
  if (!sub_100005BA0())
  {
    id v3 = a1;
    goto LABEL_58;
  }
  CFStringRef Value = (const __CFString *)SCPreferencesGetValue(a1, @"tGraphLogFile");
  if (!Value
    || (CFStringRef v5 = Value, v6 = CFGetTypeID(Value), v6 != CFStringGetTypeID())
    || SCPreferencesGetValue(a1, @"tGraphLogFilePersistentlyEnabled") != kCFBooleanTrue
    || CFEqual(v5, @"/var/log/tgraph.csv"))
  {
    SCPreferencesSetValue(a1, @"tGraphLogFilePersistentlyEnabled", kCFBooleanTrue);
    SCPreferencesSetValue(a1, @"tGraphLogFile", @"/var/log/tgraph.csv");
    SCPreferencesSetValue(a1, @"forceSkipInfoOnlySensors", kCFBooleanTrue);
    char v7 = 1;
    goto LABEL_60;
  }
LABEL_59:
  char v7 = 0;
LABEL_60:
  byte_1000AA231 = v7;
  CFBooleanRef v8 = (const __CFBoolean *)SCPreferencesGetValue(a1, @"OSThermalNotificationLoggingEnabled");
  byte_1000AA7A0 = v8 == kCFBooleanTrue;
  if (v8 == kCFBooleanTrue)
  {
    BOOL v9 = qword_1000AABC0;
    if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 136315138;
      uint64_t v11 = "en";
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "<Notice> sensor status logging %sabled", (uint8_t *)&v10, 0xCu);
    }
  }
  if (!SCPreferencesCommitChanges(a1) && os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_ERROR)) {
    sub_100054C90();
  }
}

void sub_100031FB0(SCPreferencesRef prefs, uint64_t a2, int a3)
{
  CFStringRef v5 = &byte_1000A2700[30976];
  if (a3)
  {
    byte_1000AA7A0 = SCPreferencesGetValue(prefs, @"OSThermalNotificationLoggingEnabled") == kCFBooleanTrue;
    if (byte_1000AA7A0)
    {
      CFTypeID v6 = qword_1000AABC0;
      if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        *(void *)&uint8_t buf[4] = "en";
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "<Notice> sensor status logging %sabled", buf, 0xCu);
      }
    }
    CFBooleanRef Value = (CFBooleanRef)SCPreferencesGetValue(prefs, @"overrideSensor");
    int v8 = Value == kCFBooleanTrue;
    byte_1000AA7B0 = Value == kCFBooleanTrue;
    if (byte_1000AA7A0)
    {
      CFBooleanRef v9 = Value;
      int v10 = qword_1000AABC0;
      if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v11 = "dis";
        if (v9 == kCFBooleanTrue) {
          uint64_t v11 = "en";
        }
        *(_DWORD *)buf = 136315138;
        *(void *)&uint8_t buf[4] = v11;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "<Notice> sensor status thermalOverrideSensor %sabled", buf, 0xCu);
        int v8 = byte_1000AA7B0;
      }
    }
    if (v8)
    {
      LODWORD(valuePtr) = 0;
      LODWORD(values) = 0;
      CFPropertyListRef v12 = SCPreferencesGetValue(prefs, @"setSensorID");
      CFBooleanRef v13 = (const __CFBoolean *)SCPreferencesGetValue(prefs, @"overrideSensorPersistentlyEnabled");
      if (v12)
      {
        CFBooleanRef v14 = v13;
        CFTypeID v15 = CFGetTypeID(v12);
        if (v15 == CFArrayGetTypeID() && CFArrayGetCount((CFArrayRef)v12) == 2)
        {
          CFNumberRef ValueAtIndex = (const __CFNumber *)CFArrayGetValueAtIndex((CFArrayRef)v12, 0);
          CFNumberGetValue(ValueAtIndex, kCFNumberIntType, &valuePtr);
          CFNumberRef v17 = (const __CFNumber *)CFArrayGetValueAtIndex((CFArrayRef)v12, 1);
          CFNumberGetValue(v17, kCFNumberIntType, &values);
          int v18 = (int)valuePtr;
          if (valuePtr <= 0x3F)
          {
            int v19 = (int)values;
            *((_DWORD *)&qword_1000AACCC + valuePtr) = values;
            uint64_t v20 = qword_1000AADD0 | (1 << v18);
            qword_1000AADD0 = v20;
            log = qword_1000AABC0;
            if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 67109632;
              *(_DWORD *)&uint8_t buf[4] = v18;
              *(_WORD *)&buf[8] = 1024;
              *(_DWORD *)&buf[10] = v19;
              *(_WORD *)&buf[14] = 2048;
              *(void *)&long long v106 = v20;
              _os_log_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEFAULT, "<Notice> sensor ID: %d set with temperature: %d - Overridemask %llx", buf, 0x18u);
            }
          }
          if (v14 != kCFBooleanTrue)
          {
            SCPreferencesRemoveValue(prefs, @"setSensorID");
            if (!SCPreferencesCommitChanges(prefs) && os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_ERROR)) {
              sub_100054C90();
            }
          }
        }
      }
      CFPropertyListRef v21 = SCPreferencesGetValue(prefs, @"setSensor4CCID");
      CFPropertyListRef v22 = SCPreferencesGetValue(prefs, @"setSensor4CCVAL");
      if (v21)
      {
        uint64_t v23 = v22;
        CFTypeID v24 = CFGetTypeID(v21);
        if (v24 == CFStringGetTypeID() && v23 != 0)
        {
          CFTypeID v26 = CFGetTypeID(v23);
          if (v26 == CFNumberGetTypeID())
          {
            CFNumberGetValue((CFNumberRef)v23, kCFNumberIntType, &values);
            sub_1000387C0((uint64_t)v21, (int)values);
            if (SCPreferencesGetValue(prefs, @"override4CCPersistentlyEnabled") != kCFBooleanTrue)
            {
              SCPreferencesRemoveValue(prefs, @"setSensor4CCID");
              SCPreferencesRemoveValue(prefs, @"setSensor4CCVAL");
              if (!SCPreferencesCommitChanges(prefs)
                && os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_ERROR))
              {
                sub_100054C90();
              }
            }
          }
        }
      }
      CFStringRef v5 = byte_1000A2700 + 30976;
    }
    else
    {
      sub_1000388DC();
    }
  }
  CFBooleanRef v27 = (CFBooleanRef)SCPreferencesGetValue(prefs, @"hipOverride");
  byte_1000A2511 = v27 != kCFBooleanFalse;
  if (byte_1000AA7A0)
  {
    CFBooleanRef v28 = v27;
    uint64_t v29 = *((void *)v5 + 376);
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      size_t v30 = "dis";
      if (v28 != kCFBooleanFalse) {
        size_t v30 = "en";
      }
      *(_DWORD *)buf = 136315138;
      *(void *)&uint8_t buf[4] = v30;
      _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "<Notice> HIP feature %sabled", buf, 0xCu);
    }
  }
  CFBooleanRef v31 = (CFBooleanRef)SCPreferencesGetValue(prefs, @"simulateHip");
  byte_1000AA7B1 = v31 != kCFBooleanFalse;
  if (byte_1000AA7A0)
  {
    CFBooleanRef v32 = v31;
    uint64_t v33 = *((void *)v5 + 376);
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v34 = "dis";
      if (v32 != kCFBooleanFalse) {
        uint64_t v34 = "en";
      }
      *(_DWORD *)buf = 136315138;
      *(void *)&uint8_t buf[4] = v34;
      _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, "<Notice> HIP simulation %sabled", buf, 0xCu);
    }
  }
  CFBooleanRef v35 = (CFBooleanRef)SCPreferencesGetValue(prefs, @"forceHIPWhenConnected");
  byte_1000AA7B2 = v35 != kCFBooleanFalse;
  if (byte_1000AA7A0)
  {
    CFBooleanRef v36 = v35;
    uint64_t v37 = *((void *)v5 + 376);
    if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v38 = "dis";
      if (v36 != kCFBooleanFalse) {
        uint64_t v38 = "en";
      }
      *(_DWORD *)buf = 136315138;
      *(void *)&uint8_t buf[4] = v38;
      _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEFAULT, "<Notice> HIP force when connected %sabled", buf, 0xCu);
    }
  }
  CFBooleanRef v39 = (CFBooleanRef)SCPreferencesGetValue(prefs, @"engageBehavior");
  byte_1000A2510 = v39 != kCFBooleanFalse;
  if (byte_1000AA7A0)
  {
    CFBooleanRef v40 = v39;
    uint64_t v41 = *((void *)v5 + 376);
    if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
    {
      v42 = "dis";
      if (v40 != kCFBooleanFalse) {
        v42 = "en";
      }
      *(_DWORD *)buf = 136315138;
      *(void *)&uint8_t buf[4] = v42;
      _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_DEFAULT, "<Notice> mitigation behavior %sabled", buf, 0xCu);
    }
  }
  CFBooleanRef v43 = (CFBooleanRef)SCPreferencesGetValue(prefs, @"candidateControlLoopsEnabled");
  byte_1000AA7BA = v43 == kCFBooleanTrue;
  if (byte_1000AA7A0)
  {
    CFBooleanRef v44 = v43;
    uint64_t v45 = *((void *)v5 + 376);
    if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v46 = "dis";
      if (v44 == kCFBooleanTrue) {
        uint64_t v46 = "en";
      }
      *(_DWORD *)buf = 136315138;
      *(void *)&uint8_t buf[4] = v46;
      _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_DEFAULT, "<Notice> candidate control loops %sabled", buf, 0xCu);
    }
  }
  CFBooleanRef v47 = (const __CFBoolean *)SCPreferencesGetValue(prefs, @"OSThermalNotificationEnabled");
  if (byte_1000AA7A0)
  {
    CFBooleanRef v48 = v47;
    uint64_t v49 = *((void *)v5 + 376);
    if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v50 = "dis";
      if (v48 == kCFBooleanTrue) {
        uint64_t v50 = "en";
      }
      *(_DWORD *)buf = 136315138;
      *(void *)&uint8_t buf[4] = v50;
      _os_log_impl((void *)&_mh_execute_header, v49, OS_LOG_TYPE_DEFAULT, "<Notice> thermal monitoring %sabled", buf, 0xCu);
    }
  }
  if (a3)
  {
    CFNumberRef v51 = (const __CFNumber *)SCPreferencesGetValue(prefs, @"tGraphTestCaseNumber");
    CFStringRef v52 = (const __CFString *)SCPreferencesGetValue(prefs, @"tGraphTestCaseName");
    if (v51 && (CFTypeID v53 = CFGetTypeID(v51), v53 == CFNumberGetTypeID()))
    {
      CFNumberGetValue(v51, kCFNumberIntType, &dword_1000AA288);
      if (!v52) {
        goto LABEL_73;
      }
    }
    else
    {
      dword_1000AA288 = 0;
      if (!v52) {
        goto LABEL_73;
      }
    }
    if (CFStringGetCString(v52, &byte_1000AA28C, 32, 0))
    {
LABEL_74:
      sub_1000330F0(prefs);
      v54 = +[TGraphSampler sharedInstance];
      if (byte_1000A2510) {
        uint64_t v55 = 100;
      }
      else {
        uint64_t v55 = 0;
      }
      [(TGraphSampler *)v54 updatePowerlogMiscState:5 value:v55];
      goto LABEL_78;
    }
    if (os_log_type_enabled(*((os_log_t *)v5 + 376), OS_LOG_TYPE_ERROR)) {
      sub_100057770();
    }
LABEL_73:
    byte_1000AA28C = 0;
    goto LABEL_74;
  }
LABEL_78:
  CFBooleanRef v56 = (const __CFBoolean *)SCPreferencesGetValue(prefs, @"sunlightOverride");
  if (!v56)
  {
    int v59 = 0;
LABEL_84:
    dword_1000AA7BC = v59;
    goto LABEL_85;
  }
  CFBooleanRef v57 = v56;
  CFTypeID v58 = CFGetTypeID(v56);
  if (v58 == CFBooleanGetTypeID())
  {
    if (v57 == kCFBooleanTrue) {
      int v59 = 1;
    }
    else {
      int v59 = -1;
    }
    goto LABEL_84;
  }
LABEL_85:
  if (byte_1000AA7A0)
  {
    v60 = *((void *)v5 + 376);
    if (os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&uint8_t buf[4] = dword_1000AA7BC;
      _os_log_impl((void *)&_mh_execute_header, v60, OS_LOG_TYPE_DEFAULT, "<Notice> sunlight override: %d", buf, 8u);
    }
  }
  CFBooleanRef v61 = (CFBooleanRef)SCPreferencesGetValue(prefs, @"thermalUseRawValues");
  byte_1000AA0FC = v61 == kCFBooleanTrue;
  if (byte_1000AA7A0)
  {
    CFBooleanRef v62 = v61;
    v63 = *((void *)v5 + 376);
    if (os_log_type_enabled(v63, OS_LOG_TYPE_DEFAULT))
    {
      v64 = "dis";
      if (v62 == kCFBooleanTrue) {
        v64 = "en";
      }
      *(_DWORD *)buf = 136315138;
      *(void *)&uint8_t buf[4] = v64;
      _os_log_impl((void *)&_mh_execute_header, v63, OS_LOG_TYPE_DEFAULT, "<Notice> Raw Value Mode %sabled", buf, 0xCu);
    }
  }
  CFBooleanRef v65 = (CFBooleanRef)SCPreferencesGetValue(prefs, @"forceSkipInfoOnlySensors");
  if (v65)
  {
    CFBooleanRef v66 = v65;
    int v67 = v65 == kCFBooleanTrue;
    byte_1000AA230 = v65 == kCFBooleanTrue;
    if (byte_1000AA7A0)
    {
      v68 = *((void *)v5 + 376);
      if (os_log_type_enabled(v68, OS_LOG_TYPE_DEFAULT))
      {
        v69 = "off";
        if (v66 == kCFBooleanTrue) {
          v69 = "on";
        }
        *(_DWORD *)buf = 136315138;
        *(void *)&uint8_t buf[4] = v69;
        _os_log_impl((void *)&_mh_execute_header, v68, OS_LOG_TYPE_DEFAULT, "<Notice> Force Skip Info Only Sensors %s", buf, 0xCu);
        int v67 = byte_1000AA230;
      }
    }
    if (v67) {
      uint64_t v70 = 0;
    }
    else {
      uint64_t v70 = byte_1000AA21C;
    }
    [+[HidSensors sharedInstance] setInfoOnlySensorsActive:v70];
    [+[ContextAwareThermalManager sharedInstance] setInfoOnlySensorsActive:v70];
  }
  if (!byte_1000A2510 || !notify_post(kOSThermalNotificationName))
  {
    CFNumberRef v71 = (const __CFNumber *)SCPreferencesGetValue(prefs, @"setExpectedSensorMask");
    if (v71)
    {
      CFNumberRef v72 = v71;
      CFTypeID v73 = CFGetTypeID(v71);
      if (v73 == CFNumberGetTypeID())
      {
        v74 = *((void *)v5 + 376);
        if (os_log_type_enabled(v74, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134217984;
          *(void *)&uint8_t buf[4] = qword_1000AA238;
          _os_log_impl((void *)&_mh_execute_header, v74, OS_LOG_TYPE_DEFAULT, "<Notice> Old Expected Sensor Mask: %llx ", buf, 0xCu);
        }
        CFNumberGetValue(v72, kCFNumberLongLongType, &qword_1000AA238);
        v75 = *((void *)v5 + 376);
        if (os_log_type_enabled(v75, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134217984;
          *(void *)&uint8_t buf[4] = qword_1000AA238;
          _os_log_impl((void *)&_mh_execute_header, v75, OS_LOG_TYPE_DEFAULT, "<Notice> New Expected Sensor Mask: %llx ", buf, 0xCu);
        }
        if (SCPreferencesGetValue(prefs, @"setExpectedSensorMaskPersistentlyEnabled") != kCFBooleanTrue)
        {
          SCPreferencesRemoveValue(prefs, @"setExpectedSensorMask");
          if (!SCPreferencesCommitChanges(prefs) && os_log_type_enabled(*((os_log_t *)v5 + 376), OS_LOG_TYPE_ERROR)) {
            sub_100054C90();
          }
        }
      }
    }
    if (SCPreferencesGetValue(prefs, @"getCurrentSensorSet") == kCFBooleanTrue)
    {
      SCPreferencesSetValue(prefs, @"getCurrentSensorSet", kCFBooleanFalse);
      *(void *)buf = qword_1000AA250;
      CFNumberRef v76 = CFNumberCreate(kCFAllocatorDefault, kCFNumberLongLongType, buf);
      SCPreferencesSetValue(prefs, @"expectedSensorMaskValue", v76);
      if (!SCPreferencesCommitChanges(prefs) && os_log_type_enabled(*((os_log_t *)v5 + 376), OS_LOG_TYPE_ERROR)) {
        sub_100054C90();
      }
      CFRelease(v76);
    }
    if (SCPreferencesGetValue(prefs, @"hipStates") == kCFBooleanTrue)
    {
      SCPreferencesSetValue(prefs, @"hipStates", kCFBooleanFalse);
      CFBooleanRef v77 = byte_1000AA7B3 ? kCFBooleanTrue : kCFBooleanFalse;
      SCPreferencesSetValue(prefs, @"BacklightStatus", v77);
      CFBooleanRef v78 = byte_1000AA7B4 ? kCFBooleanTrue : kCFBooleanFalse;
      SCPreferencesSetValue(prefs, @"ConnectedExternallyStatus", v78);
      CFBooleanRef v79 = byte_1000AA7B5 ? kCFBooleanTrue : kCFBooleanFalse;
      SCPreferencesSetValue(prefs, @"SystemToppingOffStatus", v79);
      CFBooleanRef v80 = byte_1000AA7B6 ? kCFBooleanTrue : kCFBooleanFalse;
      SCPreferencesSetValue(prefs, @"AaudioStatus", v80);
      CFBooleanRef v81 = byte_1000AA7B7 ? kCFBooleanTrue : kCFBooleanFalse;
      SCPreferencesSetValue(prefs, @"CarSessionStatus", v81);
      CFBooleanRef v82 = byte_1000AA7B8 ? kCFBooleanTrue : kCFBooleanFalse;
      SCPreferencesSetValue(prefs, @"WakeInProgressStatus", v82);
      CFBooleanRef v83 = byte_1000AA7B9 ? kCFBooleanTrue : kCFBooleanFalse;
      SCPreferencesSetValue(prefs, @"StockholmFieldDetectInProgressStatus", v83);
      if (!SCPreferencesCommitChanges(prefs) && os_log_type_enabled(*((os_log_t *)v5 + 376), OS_LOG_TYPE_ERROR)) {
        sub_100054C90();
      }
    }
    CFBooleanRef v84 = (const __CFBoolean *)SCPreferencesGetValue(prefs, @"overrideTxMaxLimitKey");
    if (byte_1000AA7A0)
    {
      v85 = *((void *)v5 + 376);
      if (os_log_type_enabled(v85, OS_LOG_TYPE_DEFAULT))
      {
        v86 = "dis";
        if (v84 == kCFBooleanTrue) {
          v86 = "en";
        }
        *(_DWORD *)buf = 136315138;
        *(void *)&uint8_t buf[4] = v86;
        _os_log_impl((void *)&_mh_execute_header, v85, OS_LOG_TYPE_DEFAULT, "<Notice> Override Tx Max Limit %sabled", buf, 0xCu);
      }
    }
    if (v84 != kCFBooleanTrue) {
      goto LABEL_153;
    }
    CFArrayRef v87 = (const __CFArray *)SCPreferencesGetValue(prefs, @"setTxMaxLimit");
    if (!v87) {
      goto LABEL_153;
    }
    CFArrayRef v88 = v87;
    CFTypeID v89 = CFGetTypeID(v87);
    if (v89 != CFArrayGetTypeID()) {
      goto LABEL_153;
    }
    int v100 = 0;
    int v101 = 0;
    CFNumberRef v90 = (const __CFNumber *)CFArrayGetValueAtIndex(v88, 0);
    CFNumberGetValue(v90, kCFNumberIntType, &v101);
    CFNumberRef v91 = (const __CFNumber *)CFArrayGetValueAtIndex(v88, 1);
    CFNumberGetValue(v91, kCFNumberIntType, &v100);
    int v92 = v101;
    int v102 = v100;
    xpc_object_t values = CFNumberCreate(kCFAllocatorDefault, kCFNumberSInt32Type, &v102);
    switch(v92)
    {
      case 0:
        int v93 = 0;
        int valuePtr = (const void *)kCTMaxTransmitPowerPercentage2G;
        break;
      case 1:
        int valuePtr = (const void *)kCTMaxTransmitPowerPercentageC2K;
        int v93 = 1;
        break;
      case 2:
        int valuePtr = (const void *)kCTMaxTransmitPowerPercentageUMTS;
        int v93 = 2;
        break;
      case 4:
        int valuePtr = (const void *)kCTMaxTransmitPowerPercentageUTRAN2;
        int v93 = 4;
        break;
      case 5:
        int valuePtr = (const void *)kCTMaxThroughputPercentageUTRAN3;
        int v93 = 5;
        break;
      case 6:
        int valuePtr = (const void *)kCTThermalTxBackoff;
        int v93 = 6;
        break;
      case 7:
        int valuePtr = (const void *)kCTThermalTxDutyCycle;
        int v93 = 7;
        break;
      default:
        int valuePtr = (const void *)kCTMaxThroughputPercentageLTE;
        int v93 = 3;
        break;
    }
    CFDictionaryRef v94 = CFDictionaryCreate(kCFAllocatorDefault, &valuePtr, (const void **)&values, 1, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
    CFRelease(values);
    uint64_t v107 = 0;
    *(_OWORD *)buf = 0u;
    long long v106 = 0u;
    v95 = (const void *)_CTServerConnectionCreateWithIdentifier();
    if (!v95) {
      fwrite("_CTServerConnectionCreate() failed", 0x22uLL, 1uLL, __stderrp);
    }
    uint64_t v96 = _CTServerConnectionConfigMaxRadioPower();
    v97 = *((void *)v5 + 376);
    BOOL v98 = os_log_type_enabled(v97, OS_LOG_TYPE_ERROR);
    if (v96)
    {
      if (v98)
      {
        sub_1000576AC(v96, SHIDWORD(v96));
        if (!v95) {
          goto LABEL_175;
        }
        goto LABEL_174;
      }
    }
    else if (v98)
    {
      sub_100057620(&v102, v93, v97);
      if (!v95) {
        goto LABEL_175;
      }
      goto LABEL_174;
    }
    if (!v95)
    {
LABEL_175:
      CFRelease(v94);
      if (SCPreferencesGetValue(prefs, @"overrideTxMaxLimitPersistentlyEnabled") != kCFBooleanTrue)
      {
        SCPreferencesRemoveValue(prefs, @"setTxMaxLimit");
        if (!SCPreferencesCommitChanges(prefs) && os_log_type_enabled(*((os_log_t *)v5 + 376), OS_LOG_TYPE_ERROR)) {
          sub_100054C90();
        }
      }
LABEL_153:
      SCPreferencesSynchronize(prefs);
      return;
    }
LABEL_174:
    CFRelease(v95);
    goto LABEL_175;
  }
  if (os_log_type_enabled(*((os_log_t *)v5 + 376), OS_LOG_TYPE_ERROR)) {
    sub_10005773C();
  }
}

void sub_1000330F0(const __SCPreferences *a1)
{
  CFStringRef Value = (const __CFString *)SCPreferencesGetValue(a1, @"tGraphLogFile");
  memset(&v13, 0, sizeof(v13));
  if (!Value)
  {
    int v6 = dword_1000A2528;
    if (dword_1000A2528 < 0)
    {
      if (byte_1000AA7A0)
      {
        int v8 = qword_1000AABC0;
        if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buffer = 0;
          _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "<Notice> no tGraph log", buffer, 2u);
        }
      }
    }
    else
    {
      if (byte_1000AA7A0)
      {
        char v7 = qword_1000AABC0;
        if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buffer = 0;
          _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "<Notice> Closing tGraph log file", buffer, 2u);
          int v6 = dword_1000A2528;
        }
      }
      byte_1000AA21C = 0;
      close(v6);
      dword_1000A2528 = -1;
    }
LABEL_31:
    if (byte_1000AA230) {
      uint64_t v10 = 0;
    }
    else {
      uint64_t v10 = byte_1000AA21C;
    }
    [+[HidSensors sharedInstance] setInfoOnlySensorsActive:v10];
    [+[ContextAwareThermalManager sharedInstance] setInfoOnlySensorsActive:v10];
    if (byte_1000AA7A0)
    {
      uint64_t v11 = qword_1000AABC0;
      if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_DEFAULT))
      {
        if (byte_1000AA21C) {
          CFPropertyListRef v12 = "en";
        }
        else {
          CFPropertyListRef v12 = "dis";
        }
        *(_DWORD *)buf = 136315138;
        CFTypeID v15 = v12;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "<Notice> tGraph log %sabled", buf, 0xCu);
      }
    }
    return;
  }
  if (CFStringGetFileSystemRepresentation(Value, (char *)buffer, 1024))
  {
    int v2 = open((const char *)buffer, 522, 420);
    if ((v2 & 0x80000000) == 0)
    {
      int v3 = v2;
      if (fstat(v2, &v13) < 0)
      {
        if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_ERROR)) {
          sub_100057858();
        }
        goto LABEL_25;
      }
      int v4 = dword_1000A2528;
      if ((dword_1000A2528 & 0x80000000) == 0)
      {
        if (*(_DWORD *)byte_1000AA2B0 == v13.st_dev && *(void *)&byte_1000AA2B0[8] == v13.st_ino)
        {
          if (byte_1000AA7A0)
          {
            CFStringRef v5 = qword_1000AABC0;
            if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "<Notice> tGraph log to same file", buf, 2u);
            }
          }
LABEL_25:
          close(v3);
          return;
        }
        if (byte_1000AA7A0)
        {
          CFBooleanRef v9 = qword_1000AABC0;
          if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "<Notice> tGraph log to new file", buf, 2u);
            int v4 = dword_1000A2528;
          }
        }
        close(v4);
      }
      dword_1000A2528 = v3;
      *(stat *)byte_1000AA2B0 = v13;
      byte_1000AA21C = 1;
      sub_1000067E4(1);
      goto LABEL_31;
    }
    if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_ERROR)) {
      sub_1000577D8();
    }
  }
  else if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_ERROR))
  {
    sub_1000577A4();
  }
}

uint64_t getThermalSensorSet()
{
  return qword_1000AA250;
}

uint64_t getThermalWatchdogState()
{
  return qword_1000AA240;
}

uint64_t getThermalUpdateTime()
{
  if (byte_1000A2512) {
    return qword_1000AA248;
  }
  else {
    return 0;
  }
}

const char *sub_1000334F8(char *a1)
{
  int v2 = qword_1000AABC0;
  if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315138;
    int v6 = a1;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "<Notice> Model name = %s", (uint8_t *)&v5, 0xCu);
  }
  int v3 = "mac";
  if (!strstr(a1, "Mac") && strcmp(a1, "eperm-d995af6e429c4224")) {
    return "";
  }
  return v3;
}

void thermalMonitor_init()
{
  size_t v46 = 64;
  qword_1000AADD8 = (uint64_t)SCPreferencesCreate(0, @"OSThermalStatus", @"OSThermalStatus.plist");
  if (qword_1000AADD8)
  {
    if (sysctlbyname("hw.model", cStr, &v46, 0, 0) < 0)
    {
      if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_ERROR)) {
        sub_10005790C();
      }
    }
    else
    {
      uint64_t v0 = os_log_create("com.apple.cltm", "thermalmonitor");
      qword_1000AABC0 = (uint64_t)v0;
      if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
      {
        LODWORD(buf.version) = 136315138;
        *(CFIndex *)((char *)&buf.version + 4) = (CFIndex)cStr;
        _os_log_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEFAULT, "<Notice> Model name = %s", (uint8_t *)&buf, 0xCu);
      }
      unint64_t v1 = 0;
      BOOL v2 = 1;
      while (v1 > 0x3C || cStr[v1] != 68 || cStr[v1 + 1] != 69 || cStr[v1 + 2] != 86)
      {
        BOOL v2 = v1++ < 0x3F;
        if (v1 == 64) {
          goto LABEL_11;
        }
      }
      strcpy(&cStr[v1], "AP");
      if (v2)
      {
        byte_1000AA7A2 = 1;
        CFBooleanRef v39 = qword_1000AABC0;
        if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(buf.version) = 0;
          _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_DEFAULT, "<Notice> Detected Dev board.", (uint8_t *)&buf, 2u);
        }
      }
LABEL_11:
      int v3 = +[NSDictionary dictionaryWithContentsOfFile:](NSDictionary, "dictionaryWithContentsOfFile:", [@"/System/Library/ThermalMonitor/" stringByAppendingString:[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", cStr)]);
      if (v3) {
        int v3 = v3;
      }
      qword_1000AA258 = (uint64_t)v3;
      *(_OWORD *)&buf.version = xmmword_100068C30;
      *(_OWORD *)&buf.retain = xmmword_100068C40;
      buf.copyDescription = (CFStringRef (__cdecl *)(const void *))0x100000000CLL;
      Mutable = CFArrayCreateMutable(kCFAllocatorDefault, 0, &kCFTypeArrayCallBacks);
      for (uint64_t i = 0; i != 40; i += 4)
      {
        CFNumberRef v6 = CFNumberCreate(kCFAllocatorDefault, kCFNumberIntType, (char *)&buf + i);
        CFArrayAppendValue(Mutable, v6);
        if (v6) {
          CFRelease(v6);
        }
      }
      if (Mutable)
      {
        CFTypeID v7 = CFGetTypeID(Mutable);
        if (v7 == CFArrayGetTypeID())
        {
          CFIndex Count = CFArrayGetCount(Mutable);
          if (Count >= 1)
          {
            CFIndex v9 = Count;
            CFIndex v10 = 0;
            int v11 = 0;
            uint64_t v12 = 0;
            do
            {
              int valuePtr = -1;
              CFNumberRef ValueAtIndex = CFArrayGetValueAtIndex(Mutable, v10);
              CFTypeID v14 = CFGetTypeID(ValueAtIndex);
              if (v14 == CFNumberGetTypeID()
                && (CFNumberGetValue((CFNumberRef)ValueAtIndex, kCFNumberIntType, &valuePtr),
                    _OSThermalNotificationSetLevelForBehavior(),
                    int v15 = _OSThermalNotificationLevelForBehavior(),
                    int v16 = valuePtr,
                    v15 != valuePtr))
              {
                int v18 = qword_1000AABC0;
                if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_ERROR))
                {
                  LODWORD(v51.version) = 67109376;
                  HIDWORD(v51.version) = v11;
                  LOWORD(v51.info) = 1024;
                  *(_DWORD *)((char *)&v51.info + 2) = v16;
                  _os_log_error_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "<Error> Failed to set OSThermalNotificationLevel %d with %d", (uint8_t *)&v51, 0xEu);
                }
                uint64_t v17 = (v12 + 1);
                if ((int)v12 > 10)
                {
                  int v19 = qword_1000AABC0;
                  if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_ERROR)) {
                    sub_100057B88(&v47, v48, v19);
                  }
                }
                else
                {
                  --v11;
                }
              }
              else
              {
                uint64_t v17 = v12;
              }
              CFIndex v10 = ++v11;
              uint64_t v12 = v17;
            }
            while (v9 > v11);
          }
          if (byte_1000AA7A0)
          {
            uint64_t v20 = qword_1000AABC0;
            if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_DEFAULT))
            {
              LODWORD(v51.version) = 138412290;
              *(CFIndex *)((char *)&v51.version + 4) = (CFIndex)Mutable;
              _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "<Notice> mitigation levels: %@", (uint8_t *)&v51, 0xCu);
            }
          }
        }
        CFRelease(Mutable);
      }
      uint64_t v21 = qword_1000AA258;
      if (qword_1000AA258)
      {
        CFStringRef v22 = CFStringCreateWithCStringNoCopy(0, cStr, 0x8000100u, kCFAllocatorNull);
        if (v22)
        {
          CFStringRef v23 = v22;
          CFIndex Length = CFStringGetLength(v22);
          if (Length < 1)
          {
            uint64_t v27 = 0;
          }
          else
          {
            CFIndex v25 = Length;
            CFIndex v26 = 0;
            LODWORD(v27) = 0;
            char v28 = 1;
            do
            {
              char CharacterAtIndex = CFStringGetCharacterAtIndex(v23, v26);
              if (v28) {
                uint64_t v27 = (v27 + CharacterAtIndex);
              }
              else {
                uint64_t v27 = (CharacterAtIndex * v27);
              }
              v28 ^= 1u;
              ++v26;
            }
            while (v25 != v26);
          }
          CFRelease(v23);
          qword_1000AA0E8 = [[ThermalManager alloc] initWithConfig:v21];
          [(id)qword_1000AA0E8 SaveProductString:v27];
          sub_100034128(3);
        }
        if (byte_1000AA7A2) {
          qword_1000AA240 = -1;
        }
        CFBooleanRef v31 = (char *)sub_100031510();
        byte_1000A2512 = strstr(v31, "wdt_test=thermal") == 0;
        qword_1000AA228 = (uint64_t)off_1000A2518;
        CFRunLoopRef Current = CFRunLoopGetCurrent();
        qword_1000AA790 = (uint64_t)CFRetain(Current);
        sub_100031894((const __SCPreferences *)qword_1000AADD8);
        memset(&v51, 0, sizeof(v51));
        if (SCPreferencesSetCallback((SCPreferencesRef)qword_1000AADD8, (SCPreferencesCallBack)sub_10003495C, &v51))
        {
          if (SCPreferencesScheduleWithRunLoop((SCPreferencesRef)qword_1000AADD8, (CFRunLoopRef)qword_1000AA790, kCFRunLoopDefaultMode))
          {
            *(double *)&qword_1000AA220 = -kCFAbsoluteTimeIntervalSince1970;
            [(id)qword_1000AA0E8 updatePrefs:qword_1000AADD8 :0];
            [(id)qword_1000AA0E8 createNewProduct:qword_1000AA790];
            [(id)qword_1000AA0E8 initDataCollection];
            sub_1000330F0((const __SCPreferences *)qword_1000AADD8);
            uint64_t v33 = +[TGraphSampler sharedInstance];
            if (byte_1000A2510) {
              uint64_t v34 = 100;
            }
            else {
              uint64_t v34 = 0;
            }
            [(TGraphSampler *)v33 updatePowerlogMiscState:5 value:v34];
            if (dword_1000AA340)
            {
              if (byte_1000AA7A0)
              {
                CFBooleanRef v35 = qword_1000AABC0;
                if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_DEFAULT))
                {
                  LOWORD(buf.version) = 0;
                  _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, "<Notice> deregistering for wake notification before re-registering", (uint8_t *)&buf, 2u);
                }
              }
              if (qword_1000AA358)
              {
                CFRunLoopRemoveSource((CFRunLoopRef)qword_1000AA790, (CFRunLoopSourceRef)qword_1000AA358, kCFRunLoopDefaultMode);
                qword_1000AA358 = 0;
              }
              if (dword_1000AA350)
              {
                IODeregisterForSystemPower((io_object_t *)&dword_1000AA350);
                dword_1000AA350 = 0;
              }
              if (dword_1000AA340)
              {
                IOServiceClose(dword_1000AA340);
                dword_1000AA340 = 0;
              }
              if (qword_1000AA348)
              {
                IONotificationPortDestroy((IONotificationPortRef)qword_1000AA348);
                qword_1000AA348 = 0;
              }
              if (byte_1000AA7A0)
              {
                CFBooleanRef v36 = qword_1000AABC0;
                if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_DEFAULT))
                {
                  LOWORD(buf.version) = 0;
                  _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEFAULT, "<Notice> deregistered for wake notification", (uint8_t *)&buf, 2u);
                }
              }
              sub_10000A328();
            }
            dword_1000AA340 = IORegisterForSystemPower(0, (IONotificationPortRef *)&qword_1000AA348, (IOServiceInterestCallback)sub_1000349A4, (io_object_t *)&dword_1000AA350);
            if (dword_1000AA340 && qword_1000AA348)
            {
              qword_1000AA358 = (uint64_t)IONotificationPortGetRunLoopSource((IONotificationPortRef)qword_1000AA348);
              CFRunLoopAddSource((CFRunLoopRef)qword_1000AA790, (CFRunLoopSourceRef)qword_1000AA358, kCFRunLoopDefaultMode);
              if (byte_1000AA7A0)
              {
                uint64_t v37 = qword_1000AABC0;
                if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_DEFAULT))
                {
                  LOWORD(buf.version) = 0;
                  _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEFAULT, "<Notice> registered for wake notification", (uint8_t *)&buf, 2u);
                }
              }
            }
            else if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_ERROR))
            {
              sub_100057B54();
            }
            [(id)qword_1000AA0E8 createConnectionToCT];
            int v38 = [(id)qword_1000AA0E8 getProductTotalSensors];
            dword_1000AA204 = v38;
            if (v38)
            {
              if (v38 >= 65 && os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_ERROR)) {
                sub_100057B20();
              }
            }
            else if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_ERROR))
            {
              sub_100057AEC();
            }
            if ((int)[(id)qword_1000AA0E8 getProductTotalPowerSensors] >= 11
              && os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_ERROR))
            {
              sub_100057AB8();
            }
            qword_1000AADD0 = 0;
            dword_1000AA360 = dword_1000AA204 - 1;
            if (dword_1000AA204 >= 1)
            {
              size_t v40 = 4 * dword_1000AA204;
              memset_pattern16(&qword_1000AACCC, &unk_100068C50, v40);
              memset_pattern16(dword_1000AABCC, &unk_100068C50, v40);
              memset_pattern16(dword_1000AA100, &unk_100068C50, v40);
            }
            qword_1000AA238 = [+[HidSensors sharedInstance] getWatchDogMask];
            qword_1000AA278 = qword_1000AA238;
            dword_1000AA0F0 = [(id)qword_1000AA0E8 getProductCalibrationSensorID];
            dword_1000AA0F4 = [(id)qword_1000AA0E8 getProductCalibrationDefault];
            dword_1000AA218 = [(id)qword_1000AA0E8 getRequiredCalibrationResistorSamples];
            qword_1000AA208 = (uint64_t)[(id)qword_1000AA0E8 getProductFilterValues];
            if (!qword_1000AA208 && os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_ERROR)) {
              sub_100057A84();
            }
            if (!byte_1000AA7A2) {
              qword_1000AA240 = 1;
            }
            BOOL v41 = [+[ContextAwareThermalManager sharedInstance] getContextState:0] != -1;
            id v42 = [(id)qword_1000AA0E8 getModeratePressureVersion];
            CFBooleanRef v43 = [NotificationManager alloc];
            qword_1000AA7A8 = [(NotificationManager *)v43 init:dword_1000AA360 withSolarInfo:v41 withModeratePressureVersion:v42];
            [(id)qword_1000AA0E8 initializeReadPrefs:qword_1000AADD8];
            sub_100039944(@"/Library/Preferences/SystemConfiguration/OSThermalStatus.plist");
            CFBooleanRef v44 = (void *)qword_1000AA0E8;
            CFAbsoluteTime v45 = CFAbsoluteTimeGetCurrent();
            buf.version = 0;
            memset(&buf.retain, 0, 24);
            buf.info = v44;
            if (qword_1000AA368)
            {
              CFRunLoopTimerInvalidate((CFRunLoopTimerRef)qword_1000AA368);
              CFRelease((CFTypeRef)qword_1000AA368);
            }
            qword_1000AA368 = (uint64_t)CFRunLoopTimerCreate(kCFAllocatorDefault, v45, 5.0, 0, 0, (CFRunLoopTimerCallBack)sub_1000073E8, &buf);
            CFRunLoopAddTimer((CFRunLoopRef)qword_1000AA790, (CFRunLoopTimerRef)qword_1000AA368, kCFRunLoopDefaultMode);
          }
          else if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_ERROR))
          {
            sub_100057A08();
          }
        }
        else if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_ERROR))
        {
          sub_10005798C();
        }
      }
      else
      {
        size_t v30 = qword_1000AABC0;
        if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(buf.version) = 0;
          _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "<Notice> no thermal model for device", (uint8_t *)&buf, 2u);
        }
        qword_1000AA240 = -1;
        sub_100034128(0);

        qword_1000AABC0 = 0;
      }
    }
  }
  else if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_ERROR))
  {
    sub_1000578D8();
  }
}

uint64_t sub_100034128(int a1)
{
  int valuePtr = a1;
  CFNumberRef v1 = CFNumberCreate(kCFAllocatorDefault, kCFNumberIntType, &valuePtr);
  if (v1)
  {
    CFNumberRef v2 = v1;
    SCPreferencesSetValue((SCPreferencesRef)qword_1000AADD8, @"CLTMStatus", v1);
    CFRelease(v2);
  }
  return SCPreferencesCommitChanges((SCPreferencesRef)qword_1000AADD8);
}

uint64_t sub_10003419C()
{
  objc_alloc_init((Class)NSMutableArray);
  mach_timebase_info((mach_timebase_info_t)&dword_1000AA264);
  uint64_t v0 = (char *)sub_100031510();
  if (strstr(v0, "tmd_disable_111276880")) {
    byte_1000AA260 = 1;
  }
  wd_endpoint_register();
  wd_endpoint_add_queue();
  wd_endpoint_set_alive_func();
  return wd_endpoint_activate();
}

uint64_t sub_100034268(uint64_t a1, char **a2)
{
  if (byte_1000AA7A0)
  {
    int v4 = qword_1000AABC0;
    if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf) = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "<Notice> wd_endpoint getalive_func\n", (uint8_t *)&buf, 2u);
    }
  }
  qword_1000AA250 = qword_1000AA270;
  if (qword_1000AA240 != 1 || (qword_1000AA278 & qword_1000AA270) == qword_1000AA238)
  {
    byte_1000AA280 = 0;
    uint64_t result = 1;
LABEL_43:
    qword_1000AA270 = 0;
    return result;
  }
  if (byte_1000AA260)
  {
LABEL_28:
    unint64_t v33 = qword_1000AA270;
    unint64_t v34 = qword_1000AA238;
    CFIndex Count = CFArrayGetCount([+[HidSensors sharedInstance] sensorFourCharCode]);
    if (Count >= 1)
    {
      CFIndex v36 = Count;
      for (CFIndex i = 0; i != v36; ++i)
      {
        if ((v34 & 1) != 0 && (v33 & 1) == 0) {
          [*(id *)(a1 + 32) addObject:[CFArrayGetValueAtIndex(-[HidSensors sensorFourCharCode](+[HidSensors sharedInstance](HidSensors, "sharedInstance"), "sensorFourCharCode"), i)];
        }
        v33 >>= 1;
        v34 >>= 1;
      }
    }
    unsigned int v38 = [*(id *)(a1 + 32) count];
    int v39 = v38;
    if (v38)
    {
      size_t v40 = (char *)malloc_type_malloc((int)(5 * v38) + 1, 0x528C4C82uLL);
      if (v40)
      {
        BOOL v41 = v40;
        char *v40 = 0;
        if (v39 >= 1)
        {
          for (uint64_t j = 0; j != v39; ++j)
          {
            CFBooleanRef v43 = strcat(v41, (const char *)[objc_msgSend(*(id *)(a1 + 32), "objectAtIndex:", j) cStringUsingEncoding:4]);
            *(_WORD *)&v41[strlen(v43)] = 32;
          }
        }
        WORD4(buf) = 0;
        *(void *)&long long buf = 540689491;
        [+[HidSensors sharedInstance] isSensorDataValid];
        __strcat_chk();
        __int16 v58 = 0;
        uint64_t v57 = 540689218;
        sub_100039CFC();
        __strcat_chk();
        int v44 = sub_10003A04C();
        int v45 = sub_10003A07C();
        asprintf(a2, "current %llx, mask %llx, expected %llx. %s %s RC: %d BS: %d, Missing sensor(s): %s", qword_1000AA270, qword_1000AA278, qword_1000AA238, (const char *)&buf, (const char *)&v57, v44, v45, v41);
        free(v41);
      }
      else if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_ERROR))
      {
        sub_100057BC8();
      }
    }
    [*(id *)(a1 + 32) removeAllObjects];
    uint64_t result = 0;
    goto LABEL_43;
  }
  size_t v55 = 8;
  uint64_t v56 = 0;
  if (sysctlbyname("kern.wake_abs_time", &v56, &v55, 0, 0))
  {
    CFNumberRef v6 = __error();
    CFTypeID v7 = qword_1000AABC0;
    if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_ERROR)) {
      sub_100057CD4((uint64_t)v6, v7, v8, v9, v10, v11, v12, v13);
    }
  }
  uint64_t WakeTime = IOPMGetLastWakeTime();
  if (WakeTime)
  {
    uint64_t v15 = WakeTime;
    int v16 = qword_1000AABC0;
    if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_ERROR)) {
      sub_100057C68(v15, v16, v17, v18, v19, v20, v21, v22);
    }
  }
  else
  {
    uint64_t v24 = v56;
    if (v56)
    {
      unint64_t v25 = (unint64_t)(0.0 * 1000000000.0) * *(unsigned int *)algn_1000AA268 / dword_1000AA264;
      *(void *)&long long buf = 0;
      uint64_t v57 = 0;
      mach_get_times();
      unint64_t v23 = v25 - (v24 + v57) + buf;
      goto LABEL_17;
    }
    uint64_t v57 = 0;
    long long buf = 0uLL;
    uint64_t times = mach_get_times();
    if (!times)
    {
      unint64_t v23 = (unint64_t)(((double)(uint64_t)buf
                              - kCFAbsoluteTimeIntervalSince1970
                              + (double)*((uint64_t *)&buf + 1) / 1000000000.0
                              - 0.0)
                             * (double)(1000000000
                                      * (unint64_t)*(unsigned int *)algn_1000AA268
                                      / dword_1000AA264))
          - v57;
      goto LABEL_17;
    }
    uint64_t v47 = times;
    CFBooleanRef v48 = qword_1000AABC0;
    if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_ERROR)) {
      sub_100057BFC(v47, v48, v49, v50, v51, v52, v53, v54);
    }
  }
  unint64_t v23 = 0;
LABEL_17:
  uint64_t v26 = mach_continuous_time();
  uint64_t v28 = dword_1000AA264;
  unint64_t v27 = *(unsigned int *)algn_1000AA268;
  int v29 = byte_1000AA280;
  size_t v30 = qword_1000AABC0;
  BOOL v31 = os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_DEFAULT);
  if ((v29 & 1) != 0 || (unint64_t v32 = (v26 + v23) * v28 / v27, v32 > 0x2540BE3FFLL))
  {
    if (v29)
    {
      if (v31)
      {
        LOWORD(buf) = 0;
        _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "<Notice> thermalmonitord: found previous error sensor result, do not ignore", (uint8_t *)&buf, 2u);
      }
    }
    else
    {
      if (v31)
      {
        LOWORD(buf) = 0;
        _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "<Notice> thermalmonitord: found error sensor result", (uint8_t *)&buf, 2u);
      }
      byte_1000AA280 = 1;
    }
    goto LABEL_28;
  }
  if (v31)
  {
    LODWORD(buf) = 134217984;
    *(void *)((char *)&buf + 4) = v32 / 0x3B9ACA00;
    _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "<Notice> thermalmonitord: ignore current sensor result cause system just woke up %lld second(s)ago", (uint8_t *)&buf, 0xCu);
  }
  return 1;
}

void start()
{
  pthread_set_qos_class_self_np(QOS_CLASS_USER_INITIATED, 0);
  sub_10003419C();
  thermalMonitor_init();
  xpc_set_event_stream_handler("com.apple.notifyd.matching", (dispatch_queue_t)&_dispatch_main_q, &stru_100085FC0);
  CFRunLoopRun();
  CFNumberRef v1 = qword_1000AABC0;
  if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)CFNumberRef v2 = 0;
    _os_log_error_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_ERROR, "<Error> main thread exiting", v2, 2u);
  }
  exit(0);
}

void sub_1000348B4(id a1, OS_xpc_object *a2)
{
  if (a2)
  {
    string = xpc_dictionary_get_string(a2, _xpc_event_key_name);
    if (string)
    {
      if (!strcasecmp("com.apple.ManagedConfiguration.profileListChanged", string))
      {
        sleep(2u);
        int v3 = (const __SCPreferences *)qword_1000AADD8;
        sub_100031894(v3);
      }
    }
  }
}

uint64_t sub_100034924(uint64_t a1, const void *a2)
{
  return fprintf(__stderrp, "unknown CT notification: %p", a2);
}

void sub_10003495C(const __SCPreferences *a1)
{
  [(id)qword_1000AA0E8 updatePrefs:a1 :1];

  SCPreferencesSynchronize(a1);
}

void sub_1000349A4(uint64_t a1, uint64_t a2, int a3, intptr_t a4)
{
  HIDWORD(v6) = a3;
  LODWORD(v6) = a3 + 536870288;
  int v5 = v6 >> 4;
  if (v5)
  {
    if (v5 == 11)
    {
      uint64_t v10 = qword_1000AABC0;
      if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v24) = 0;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "<Notice> <PMCallback> System Will Power On", (uint8_t *)&v24, 2u);
      }
      if ((int)qword_1000AA798 >= 12)
      {
        int v11 = dword_1000AA284;
        if (dword_1000AA284)
        {
          uint64_t v12 = qword_1000AABC0;
          if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_DEFAULT))
          {
            int v24 = 67109120;
            int v25 = v11;
            _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "<Notice> clearing orphaned sleep assertion: 0x%08x", (uint8_t *)&v24, 8u);
          }
          sub_10000A328();
        }
        uint64_t v13 = IOPMAssertionCreateWithName(@"NoIdleSleepAssertion", 0xFFu, (CFStringRef)qword_1000AA228, (IOPMAssertionID *)&dword_1000AA284);
        if (v13)
        {
          uint64_t v14 = v13;
          uint64_t v15 = qword_1000AABC0;
          if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_ERROR)) {
            sub_100057E14(v14, v15, v16, v17, v18, v19, v20, v21);
          }
        }
        else if (byte_1000AA7A0)
        {
          unint64_t v23 = qword_1000AABC0;
          if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_DEFAULT))
          {
            int v24 = 67109120;
            int v25 = dword_1000AA284;
            _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "<Notice> created idle sleep assertion 0x%08x", (uint8_t *)&v24, 8u);
          }
        }
      }
      [(id)qword_1000AA0E8 updateSystemPowerState:1];
    }
    else if (v5 == 1)
    {
      CFTypeID v7 = qword_1000AABC0;
      if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v24) = 0;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "<Notice> <PMCallback> System Will Sleep", (uint8_t *)&v24, 2u);
      }
      [(id)qword_1000AA0E8 updateSystemPowerState:0];
LABEL_10:
      IOAllowPowerChange(dword_1000AA340, a4);
    }
  }
  else
  {
    unsigned int v8 = [(id)qword_1000AA0E8 canSystemSleep];
    uint64_t v9 = qword_1000AABC0;
    if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_DEFAULT))
    {
      int v24 = 67109120;
      int v25 = v8;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "<Notice> <PMCallback> Can System Sleep (reply: %d)", (uint8_t *)&v24, 8u);
    }
    if (v8) {
      goto LABEL_10;
    }
    if (byte_1000AA7A0)
    {
      uint64_t v22 = qword_1000AABC0;
      if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v24) = 0;
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "<Notice> Preventing system sleep", (uint8_t *)&v24, 2u);
      }
    }
    IOCancelPowerChange(dword_1000AA340, a4);
  }
}

size_t sub_100034CA8(int a1)
{
  CFNumberRef v2 = &byte_1000AA378[__sprintf_chk(byte_1000AA378, 0, 0x340uLL, "[")];
  int v3 = &v2[sprintf(v2, "%d", dword_1000AA100[0])];
  if (a1 >= 2)
  {
    uint64_t v4 = a1 - 1;
    int v5 = &dword_1000AA104;
    do
    {
      strcpy(v3, ", ");
      int v6 = *v5++;
      v3 += sprintf(v3 + 2, "%d", v6) + 2;
      --v4;
    }
    while (v4);
  }
  size_t result = strlen(v3);
  *(_WORD *)&v3[result] = 93;
  return result;
}

id sub_100035550(uint64_t a1, void *a2)
{
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id result = [a2 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (result)
  {
    id v5 = result;
    int v6 = 0;
    uint64_t v7 = *(void *)v12;
    do
    {
      unsigned int v8 = 0;
      int v9 = v6;
      uint64_t v10 = a1 + 4 * v6;
      do
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(a2);
        }
        *(_DWORD *)(v10 + 4 * (void)v8) = [*(id *)(*((void *)&v11 + 1) + 8 * (void)v8) intValue];
        unsigned int v8 = (char *)v8 + 1;
      }
      while (v5 != v8);
      id result = [a2 countByEnumeratingWithState:&v11 objects:v15 count:16];
      id v5 = result;
      int v6 = v9 + v8;
    }
    while (result);
  }
  return result;
}

id sub_100035654(uint64_t a1, void *a2)
{
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id result = [a2 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (result)
  {
    id v5 = result;
    int v6 = 0;
    uint64_t v7 = *(void *)v13;
    do
    {
      unsigned int v8 = 0;
      int v9 = v6;
      uint64_t v10 = a1 + 4 * v6;
      do
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(a2);
        }
        [*(id *)(*((void *)&v12 + 1) + 8 * (void)v8) floatValue];
        *(_DWORD *)(v10 + 4 * (void)v8) = v11;
        unsigned int v8 = (char *)v8 + 1;
      }
      while (v5 != v8);
      id result = [a2 countByEnumeratingWithState:&v12 objects:v16 count:16];
      id v5 = result;
      int v6 = v9 + v8;
    }
    while (result);
  }
  return result;
}

void sub_100035CDC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  objc_destroyWeak(v21);
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

float sub_100035D18(uint64_t a1, int a2)
{
  uint64_t state64 = 0;
  id Weak = objc_loadWeak((id *)(a1 + 32));
  if (!notify_get_state(a2, &state64))
  {
    [Weak setPowerSaveActive:state64 != 0];
    float result = (float)[Weak powerSaveActive];
    *(float *)&dword_1000AAE28 = result;
  }
  return result;
}

float sub_100035D8C(uint64_t a1, int a2)
{
  uint64_t state64 = 0;
  id Weak = objc_loadWeak((id *)(a1 + 32));
  if (!notify_get_state(a2, &state64))
  {
    [Weak setProModeActive:state64 != 0];
    float result = (float)[Weak proModeActive];
    *(float *)&dword_1000AAE4C = result;
  }
  return result;
}

void sub_10003614C(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v2 + 229))
  {
    *(unsigned char *)(*(void *)(a1 + 32) + 329) = [+[ContextAwareThermalManager sharedInstance] isContextTriggered:1];
    uint64_t v3 = *(void *)(a1 + 32);
    int v4 = 100;
    uint64_t v5 = 64;
    do
    {
      if (v4 >= *(_DWORD *)(v3 + v5)) {
        int v4 = *(_DWORD *)(v3 + v5);
      }
      v5 += 4;
    }
    while (v5 != 88);
    int v6 = 0;
    uint64_t v7 = 136;
    do
    {
      if (v6 <= *(_DWORD *)(v3 + v7)) {
        int v6 = *(_DWORD *)(v3 + v7);
      }
      v7 += 4;
    }
    while (v7 != 160);
    if (v4 <= v6) {
      uint64_t v8 = v6;
    }
    else {
      uint64_t v8 = v4;
    }
    if (*(unsigned char *)(v3 + 296))
    {
      int v9 = *(NSObject **)(v3 + 320);
      v20[0] = _NSConcreteStackBlock;
      v20[1] = 3221225472;
      v20[2] = sub_1000364E0;
      v20[3] = &unk_100085C80;
      v20[4] = v3;
      int v21 = v8;
      dispatch_async(v9, v20);
      return;
    }
    if (*(unsigned char *)(v3 + 209)) {
      uint64_t v11 = *(unsigned int *)(v3 + 216);
    }
    else {
      uint64_t v11 = 65000;
    }
    [(id)v3 setCPULowPowerTarget:v11];
    uint64_t v19 = *(void *)(a1 + 32);
    if (v8 != *(_DWORD *)(v19 + 336))
    {
      *(_DWORD *)(v19 + 336) = v8;
      [*(id *)(a1 + 32) setCPUPowerZoneTarget:v8];
    }
  }
  else
  {
    if (*(unsigned char *)(v2 + 209)) {
      int v10 = *(_DWORD *)(v2 + 212);
    }
    else {
      int v10 = 101;
    }
    uint64_t v12 = 0;
    signed int v13 = 0;
    *(_DWORD *)(v2 + 288) = v10;
    uint64_t v14 = *(void *)(a1 + 32);
    do
    {
      if (v13 <= *(_DWORD *)(v14 + 136 + v12)) {
        signed int v13 = *(_DWORD *)(v14 + 136 + v12);
      }
      v12 += 4;
    }
    while (v12 != 24);
    *(_DWORD *)(v14 + 332) = 101;
    uint64_t v15 = &stru_100000100.sectname[12];
    do
    {
      uint64_t v16 = *(unsigned int **)(a1 + 32);
      unsigned int v17 = *(unsigned int *)((char *)v16 + v15 - 4);
      if ((int)v17 <= v13) {
        uint64_t v18 = v13;
      }
      else {
        uint64_t v18 = v17;
      }
      if ((int)v16[83] > (int)v18)
      {
        v16[83] = v18;
        uint64_t v16 = *(unsigned int **)(a1 + 32);
      }
      if (*(unsigned int *)((char *)v16 + v15) != v18)
      {
        [v16 setServiceProperty:v16[8] key:*(__CFString **)((char *)&off_100085FE0[-33] + v15 - 4) value:v18 scaleToFixedPoint:1];
        *(_DWORD *)(*(void *)(a1 + 32) + v15) = v18;
      }
      v15 += 8;
    }
    while (v15 != 300);
    kdebug_trace();
  }

  kdebug_trace();
}

uint64_t sub_100036498(int *a1, int a2, uint64_t a3)
{
  if (a2 >= 1)
  {
    do
    {
      int v4 = *a1++;
      unsigned int v3 = v4;
      if ((int)a3 >= v4) {
        a3 = v3;
      }
      else {
        a3 = a3;
      }
      --a2;
    }
    while (a2);
  }
  return a3;
}

uint64_t sub_1000364BC(int *a1, int a2, uint64_t a3)
{
  if (a2 >= 1)
  {
    do
    {
      int v4 = *a1++;
      unsigned int v3 = v4;
      if ((int)a3 <= v4) {
        a3 = v3;
      }
      else {
        a3 = a3;
      }
      --a2;
    }
    while (a2);
  }
  return a3;
}

uint64_t sub_1000364E0(uint64_t a1)
{
  [*(id *)(a1 + 32) setPackageLowPowerTarget];
  int v2 = *(_DWORD *)(a1 + 40);
  uint64_t v3 = *(void *)(a1 + 32);
  if (v2 != *(_DWORD *)(v3 + 336))
  {
    *(_DWORD *)(v3 + 336) = v2;
    [*(id *)(a1 + 32) setPackagePowerZoneTarget];
  }

  return kdebug_trace();
}

void sub_1000365E0(uint64_t a1)
{
  uint64_t v1 = 0;
  uint64_t v2 = *(void *)(a1 + 32);
  int v3 = 100;
  do
  {
    if (v3 >= *(_DWORD *)(v2 + 88 + v1)) {
      int v3 = *(_DWORD *)(v2 + 88 + v1);
    }
    v1 += 4;
  }
  while (v1 != 24);
  uint64_t v4 = 0;
  int v5 = 0;
  do
  {
    if (v5 <= *(_DWORD *)(v2 + 160 + v4)) {
      int v5 = *(_DWORD *)(v2 + 160 + v4);
    }
    v4 += 4;
  }
  while (v4 != 24);
  if (v3 <= v5) {
    int v3 = v5;
  }
  if (*(unsigned char *)(v2 + 209) && v3 >= *(_DWORD *)(v2 + 220)) {
    int v3 = *(_DWORD *)(v2 + 220);
  }
  if (v3 != *(_DWORD *)(v2 + 340))
  {
    *(_DWORD *)(v2 + 340) = v3;
    uint64_t v6 = *(void *)(a1 + 32);
    if (*(unsigned char *)(v6 + 229))
    {
      if (*(unsigned char *)(v6 + 296))
      {
        uint64_t v7 = *(NSObject **)(v6 + 320);
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = sub_100036760;
        block[3] = &unk_100085248;
        block[4] = v6;
        dispatch_async(v7, block);
      }
      else
      {
        [(id)v6 setGPUPowerZoneTarget:*(unsigned int *)(v6 + 340)];
        kdebug_trace();
      }
    }
    else
    {
      uint64_t v8 = *(unsigned int *)(v6 + 340);
      [(id)v6 setDieTempControllerProperty:@"GPUMaxPower" level:v8 scaleToFixedPoint:0];
    }
  }
}

uint64_t sub_100036760(uint64_t a1)
{
  [*(id *)(a1 + 32) setPackagePowerZoneTarget];

  return kdebug_trace();
}

id sub_100036BE4(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 329) = [+[ContextAwareThermalManager sharedInstance] isContextTriggered:1];
  uint64_t v2 = *(char **)(a1 + 32);
  int v3 = 65000;
  uint64_t v4 = 112;
  do
  {
    if (v3 >= *(_DWORD *)&v2[v4]) {
      int v3 = *(_DWORD *)&v2[v4];
    }
    v4 += 4;
  }
  while (v4 != 136);
  int v5 = 0;
  uint64_t v6 = 184;
  do
  {
    if (v5 <= *(_DWORD *)&v2[v6]) {
      int v5 = *(_DWORD *)&v2[v6];
    }
    v6 += 4;
  }
  while (v6 != 208);
  if (v3 <= v5) {
    uint64_t v7 = v5;
  }
  else {
    uint64_t v7 = v3;
  }
  id result = [v2 setPackageLowPowerTarget];
  uint64_t v10 = *(void *)(a1 + 32);
  if (v7 != *(_DWORD *)(v10 + 308))
  {
    if (byte_1000AA7A0)
    {
      uint64_t v11 = qword_1000AABC0;
      if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_DEFAULT))
      {
        v14[0] = 67109120;
        v14[1] = v7;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "<Notice> New Package power target: %d", (uint8_t *)v14, 8u);
        uint64_t v10 = *(void *)(a1 + 32);
      }
    }
    LODWORD(v9) = vcvtd_n_s64_f64((double)(int)v7 / 1000.0, 0x18uLL);
    if (*(unsigned char *)(v10 + 329) && *(_DWORD *)(v10 + 244) != v7)
    {
      int v12 = v7;
    }
    else
    {
      if (*(unsigned char *)(v10 + 328)) {
        [+[CPMSHelper sharedInstance] addToCPMSMitigationArray:v7 forComponent:13];
      }
      else {
      signed int v13 = *(unsigned int **)(a1 + 32);
      }
      if (v13[61] == 65000) {
        goto LABEL_25;
      }
      int v12 = 65000;
    }
    *(_DWORD *)(*(void *)(a1 + 32) + 244) = v12;
LABEL_25:
    *(_DWORD *)(*(void *)(a1 + 32) + 308) = v7;
    return (id)kdebug_trace();
  }
  return result;
}

void sub_100037CB8(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xEu);
}

CFMutableDictionaryRef sub_100037CD4(const char *a1, void *a2, const void *a3)
{
  uint64_t v7 = a3;
  keys = a2;
  CFMutableDictionaryRef result = IOServiceMatching(a1);
  if (result)
  {
    int v5 = result;
    if (a2)
    {
      CFDictionaryRef v6 = CFDictionaryCreate(kCFAllocatorDefault, (const void **)&keys, &v7, 1, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
      CFDictionarySetValue(v5, @"IOPropertyMatch", v6);
      CFRelease(v6);
    }
    return (CFMutableDictionaryRef)IOServiceGetMatchingService(kIOMainPortDefault, v5);
  }
  return result;
}

BOOL sub_100037D70(const __CFDictionary *a1, const void *a2)
{
  return sub_100037D8C(a1, a2, 0);
}

BOOL sub_100037D8C(const __CFDictionary *a1, const void *a2, uint64_t a3)
{
  if (a1)
  {
    if (CFDictionaryContainsKey(a1, a2))
    {
      CFBooleanRef Value = (const __CFBoolean *)CFDictionaryGetValue(a1, a2);
      if (Value)
      {
        CFBooleanRef v7 = Value;
        CFTypeID v8 = CFGetTypeID(Value);
        if (v8 == CFBooleanGetTypeID()) {
          return CFBooleanGetValue(v7) != 0;
        }
      }
    }
  }
  return a3;
}

uint64_t sub_100037E04(const __CFDictionary *a1, const void *a2, void *a3)
{
  uint64_t result = CFDictionaryContainsKey(a1, a2);
  if (result)
  {
    CFBooleanRef Value = CFDictionaryGetValue(a1, a2);
    if (Value && (CFTypeID v8 = Value, v9 = CFGetTypeID(Value), v9 == CFStringGetTypeID()))
    {
      *a3 = v8;
      return 1;
    }
    else
    {
      uint64_t result = os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_ERROR);
      if (result)
      {
        sub_1000587D8();
        return 0;
      }
    }
  }
  return result;
}

CFNumberRef sub_100037EA0(__CFDictionary *a1, void *key, CFNumberType a3, const void *a4)
{
  if (a1 && key && (int v8 = CFDictionaryContainsKey(a1, key), a4) && v8)
  {
    CFNumberRef result = CFNumberCreate(kCFAllocatorDefault, a3, a4);
    if (result)
    {
      CFNumberRef v10 = result;
      CFDictionaryReplaceValue(a1, key, result);
      CFRelease(v10);
      return (CFNumberRef)1;
    }
  }
  else
  {
    CFNumberRef result = (CFNumberRef)os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_ERROR);
    if (result)
    {
      sub_100058840();
      return 0;
    }
  }
  return result;
}

CFStringRef sub_100037F5C(int a1)
{
  for (uint64_t i = 3; i != -1; --i)
  {
    cStr[i] = a1;
    a1 >>= 8;
  }
  cStr[4] = 0;
  return CFStringCreateWithCString(kCFAllocatorDefault, cStr, 0x8000100u);
}

uint64_t sub_100037FB4(io_registry_entry_t a1, const __CFString *a2, void *a3, id a4)
{
  uint64_t result = (uint64_t)IORegistryEntryCreateCFProperty(a1, a2, kCFAllocatorDefault, 0);
  if (result)
  {
    CFBooleanRef v7 = (void *)result;
    if ([(id)result length] == a4)
    {
      memcpy(a3, [v7 bytes], (size_t)a4);
      CFRelease(v7);
      return 1;
    }
    else
    {
      int v8 = qword_1000AABC0;
      uint64_t result = os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_ERROR);
      if (result)
      {
        sub_100058AB0(v7, (uint64_t)a4, v8);
        return 0;
      }
    }
  }
  return result;
}

BOOL sub_100038064(io_registry_entry_t a1, const __CFString *a2)
{
  CFBooleanRef CFProperty = (const __CFBoolean *)IORegistryEntryCreateCFProperty(a1, a2, kCFAllocatorDefault, 0);
  if (!CFProperty) {
    return 0;
  }
  CFBooleanRef v3 = CFProperty;
  CFTypeID v4 = CFGetTypeID(CFProperty);
  BOOL v5 = v4 == CFBooleanGetTypeID() && CFBooleanGetValue(v3) != 0;
  CFRelease(v3);
  return v5;
}

void sub_1000380DC()
{
  io_connect_t v0 = IOPMFindPowerManagement(kIOMainPortDefault);
  if (v0)
  {
    io_connect_t v1 = v0;
    if (IOPMSleepSystem(v0))
    {
      if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_ERROR)) {
        sub_100058B90();
      }
    }
    IOServiceClose(v1);
  }
  else if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_ERROR))
  {
    sub_100058B5C();
  }
}

void sub_100038174(const void *a1, const __CFString *a2, const __CFString *a3, CFAbsoluteTime a4)
{
  CFDateRef v7 = CFDateCreate(0, a4);
  if (v7)
  {
    CFDateRef v8 = v7;
    if (IOPMSchedulePowerEvent(v7, a2, a3) && os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_ERROR))
    {
      sub_100058BF8();
      if (!a1) {
        goto LABEL_6;
      }
    }
    else if (!a1)
    {
LABEL_6:
      CFRelease(v8);
      return;
    }
    CFRelease(a1);
    goto LABEL_6;
  }
  if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_ERROR)) {
    sub_100058BC4();
  }
}

void sub_100038230(int a1, int a2, IOHIDServiceClientRef service)
{
  CFNumberRef RegistryID = (const __CFNumber *)IOHIDServiceClientGetRegistryID(service);
  uint64_t valuePtr = 0;
  if (RegistryID)
  {
    CFNumberRef v5 = RegistryID;
    CFTypeID v6 = CFGetTypeID(RegistryID);
    if (v6 == CFNumberGetTypeID()) {
      CFNumberGetValue(v5, kCFNumberSInt64Type, &valuePtr);
    }
  }
  CFStringRef v7 = (const __CFString *)IOHIDServiceClientCopyProperty(service, @"Product");
  CFStringRef v8 = v7;
  if (!v7 || (CFTypeID v9 = CFGetTypeID(v7), v9 != CFStringGetTypeID()))
  {
    if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_ERROR))
    {
      sub_100058CF0();
      if (!v8) {
        goto LABEL_9;
      }
    }
    else if (!v8)
    {
LABEL_9:
      CFStringRef v8 = @"unknown Sensor";
      goto LABEL_10;
    }
    CFRelease(v8);
    goto LABEL_9;
  }
LABEL_10:
  if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_ERROR)) {
    sub_100058C60(v8);
  }
  CFRelease(v8);
}

void sub_100038338()
{
  if (!dword_1000AA6C4)
  {
    dword_1000AA6C4 = sub_100037CD4("AppleC26Charger", 0, 0);
    if (!dword_1000AA6C4)
    {
      if (byte_1000AA7A0)
      {
        io_connect_t v0 = qword_1000AABC0;
        if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)io_connect_t v1 = 0;
          _os_log_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEFAULT, "<Notice> initC26Service: Failed to Match AppleC26Charger", v1, 2u);
        }
      }
    }
  }
}

uint64_t sub_1000383DC()
{
  unsigned int valuePtr = 0;
  sub_10000A424();
  if (dword_1000AA6C0)
  {
    CFNumberRef CFProperty = (const __CFNumber *)IORegistryEntryCreateCFProperty(dword_1000AA6C0, @"Temperature", kCFAllocatorDefault, 0);
    if (CFProperty)
    {
      CFNumberRef v1 = CFProperty;
      CFNumberGetValue(CFProperty, kCFNumberIntType, &valuePtr);
      CFRelease(v1);
      return valuePtr;
    }
    uint64_t result = os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_ERROR);
    if (result)
    {
      sub_100058D58();
      return 0;
    }
  }
  else
  {
    uint64_t result = os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_ERROR);
    if (result)
    {
      sub_100058D24();
      return 0;
    }
  }
  return result;
}

uint64_t sub_1000384A4(uint64_t result)
{
  dword_1000A2590 = result;
  return result;
}

void sub_1000384B0()
{
  dword_1000A2590 = -1;
}

uint64_t sub_1000384C0()
{
  uint64_t valuePtr = 0;
  sub_10000A424();
  if (!dword_1000AA6C0)
  {
    if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_ERROR)) {
      sub_100058D24();
    }
    return 0;
  }
  CFTypeRef CFProperty = IORegistryEntryCreateCFProperty(dword_1000AA6C0, @"AppleRawCurrentCapacity", kCFAllocatorDefault, 0);
  if (!CFProperty)
  {
    if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_ERROR)) {
      sub_100058D8C();
    }
    return 0;
  }
  CFNumberRef v1 = CFProperty;
  CFNumberRef v2 = (const __CFNumber *)IORegistryEntryCreateCFProperty(dword_1000AA6C0, @"AppleRawMaxCapacity", kCFAllocatorDefault, 0);
  if (!v2)
  {
    if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_ERROR)) {
      sub_100058DC0();
    }
    CFRelease(v1);
    return 0;
  }
  CFNumberRef v3 = v2;
  CFNumberGetValue((CFNumberRef)v1, kCFNumberIntType, (char *)&valuePtr + 4);
  CFNumberGetValue(v3, kCFNumberIntType, &valuePtr);
  int v4 = valuePtr;
  if ((int)valuePtr < 1) {
    unsigned int v5 = 0;
  }
  else {
    unsigned int v5 = (int)((double)SHIDWORD(valuePtr) * 100.0 / (double)(int)valuePtr + 0.5);
  }
  if (dword_1000A2594 == -1) {
    uint64_t v6 = v5;
  }
  else {
    uint64_t v6 = dword_1000A2594;
  }
  if (byte_1000AA7A0)
  {
    CFStringRef v7 = qword_1000AABC0;
    if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 67109632;
      int v11 = HIDWORD(valuePtr);
      __int16 v12 = 1024;
      int v13 = v4;
      __int16 v14 = 1024;
      int v15 = v6;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "<Notice> raw current %d, raw max %d ==> raw SOC %d", buf, 0x14u);
    }
  }
  CFRelease(v1);
  CFRelease(v3);
  return v6;
}

void sub_1000386FC(int a1)
{
  CFNumberRef v2 = qword_1000AABC0;
  if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_DEFAULT))
  {
    v3[0] = 67109120;
    v3[1] = a1;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "<Notice> Overiding chemical state of charge to %d\n", (uint8_t *)v3, 8u);
  }
}

uint64_t sub_1000387A4(uint64_t result)
{
  dword_1000A2594 = result;
  return result;
}

void sub_1000387B0()
{
  dword_1000A2594 = -1;
}

void sub_1000387C0(uint64_t a1, int a2)
{
  unsigned int v3 = [+[HidSensors sharedInstance] getSensorIndexFrom4CC:a1];
  if (v3 <= 0x3F)
  {
    unsigned int v4 = v3;
    byte_1000AA7B0 = 1;
    *((_DWORD *)&qword_1000AACCC + v3) = a2;
    uint64_t v5 = qword_1000AADD0 | (1 << v3);
    qword_1000AADD0 = v5;
    uint64_t v6 = qword_1000AABC0;
    if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_DEFAULT))
    {
      v7[0] = 67109632;
      v7[1] = v4;
      __int16 v8 = 1024;
      int v9 = a2;
      __int16 v10 = 2048;
      uint64_t v11 = v5;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "<Notice> sensor ID: %d set with temperature: %d - Overridemask %llx", (uint8_t *)v7, 0x18u);
    }
  }
}

void sub_1000388DC()
{
  qword_1000AADD0 = 0;
  byte_1000AA7B0 = 0;
}

CFTypeRef sub_1000388F8()
{
  sub_10000A424();
  if (!dword_1000AA6C0)
  {
    if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_ERROR)) {
      sub_100058D24();
    }
    return 0;
  }
  CFTypeRef result = IORegistryEntryCreateCFProperty(dword_1000AA6C0, @"BatteryData", kCFAllocatorDefault, 0);
  if (!result)
  {
    if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_ERROR)) {
      sub_100058DF4();
    }
    return 0;
  }
  return result;
}

uint64_t sub_10003899C(const void *a1)
{
  unsigned int valuePtr = 0;
  if (!a1)
  {
    uint64_t result = os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_ERROR);
    if (!result) {
      return result;
    }
    sub_100058E28();
    return 0;
  }
  CFDictionaryRef v2 = (const __CFDictionary *)sub_1000388F8();
  if (!v2)
  {
    uint64_t v6 = qword_1000AABC0;
    uint64_t result = os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_ERROR);
    if (!result) {
      return result;
    }
    sub_100058E5C(v6, v7, v8, v9, v10, v11, v12, v13);
    return 0;
  }
  CFDictionaryRef v3 = v2;
  CFNumberRef Value = (const __CFNumber *)CFDictionaryGetValue(v2, a1);
  if (Value)
  {
    CFNumberGetValue(Value, kCFNumberIntType, &valuePtr);
  }
  else if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_ERROR))
  {
    sub_100058ED4();
  }
  CFRelease(v3);
  return valuePtr;
}

uint64_t sub_100038A84(void *a1)
{
  uint64_t v2 = sub_10003899C(a1);
  if (byte_1000AA7A0)
  {
    CFDictionaryRef v3 = qword_1000AABC0;
    if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_DEFAULT))
    {
      int v5 = 136315394;
      id v6 = [a1 UTF8String];
      __int16 v7 = 1024;
      int v8 = v2;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "<Notice> %s %d", (uint8_t *)&v5, 0x12u);
    }
  }
  return v2;
}

uint64_t sub_100038B60()
{
  uint64_t result = sub_100038A84(@"AlgoChemID");
  if (!result)
  {
    return sub_100038A84(@"ChemID");
  }
  return result;
}

uint64_t sub_100038BA4()
{
  unsigned int valuePtr = 0;
  uint64_t result = dword_1000A2598;
  if (dword_1000A2598 == -1)
  {
    CFDictionaryRef v1 = (const __CFDictionary *)sub_1000388F8();
    if (v1)
    {
      CFDictionaryRef v2 = v1;
      CFArrayRef Value = (const __CFArray *)CFDictionaryGetValue(v1, @"WeightedRa");
      CFTypeID TypeID = CFArrayGetTypeID();
      if (Value && CFGetTypeID(Value) == TypeID)
      {
        CFNumberRef ValueAtIndex = (const __CFNumber *)CFArrayGetValueAtIndex(Value, 0);
        CFTypeID v6 = CFNumberGetTypeID();
        if (ValueAtIndex && CFGetTypeID(ValueAtIndex) == v6)
        {
          CFNumberGetValue(ValueAtIndex, kCFNumberIntType, &valuePtr);
          if (byte_1000AA7A0)
          {
            __int16 v7 = qword_1000AABC0;
            if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)long long buf = 67109120;
              unsigned int v18 = valuePtr;
              _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "<Notice> Weighted Ra %d", buf, 8u);
            }
          }
        }
        else if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_ERROR))
        {
          sub_100058FE8();
        }
      }
      else if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_ERROR))
      {
        sub_100058FB4();
      }
      CFRelease(v2);
      return valuePtr;
    }
    else
    {
      int v8 = qword_1000AABC0;
      uint64_t result = os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_ERROR);
      if (result)
      {
        sub_100058F3C(v8, v9, v10, v11, v12, v13, v14, v15);
        return 0;
      }
    }
  }
  return result;
}

uint64_t sub_100038D74()
{
  unsigned int valuePtr = -1;
  CFDictionaryRef v0 = (const __CFDictionary *)sub_1000388F8();
  if (v0)
  {
    CFDictionaryRef v1 = v0;
    CFArrayRef Value = CFDictionaryGetValue(v0, @"RaTableRaw");
    CFTypeID TypeID = CFArrayGetTypeID();
    if (!Value || CFGetTypeID(Value) != TypeID)
    {
      if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_ERROR)) {
        sub_100059094();
      }
      goto LABEL_18;
    }
    CFDataRef ValueAtIndex = (const __CFData *)CFArrayGetValueAtIndex((CFArrayRef)Value, 0);
    if (ValueAtIndex)
    {
      CFDataRef v5 = ValueAtIndex;
      int Length = CFDataGetLength(ValueAtIndex);
      if (Length != 32)
      {
        uint64_t v22 = qword_1000AABC0;
        if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_ERROR)) {
          sub_100059130(Length, v22);
        }
        goto LABEL_18;
      }
      BytePtr = CFDataGetBytePtr(v5);
      uint64_t v8 = 0;
      signed int v9 = -1;
      do
      {
        unsigned int v10 = *(unsigned __int16 *)&BytePtr[v8];
        if (v9 < (int)(bswap32(v10) >> 16))
        {
          signed int v9 = __rev16(v10);
          unsigned int valuePtr = v9;
        }
        v8 += 2;
      }
      while (v8 != 18);
    }
    else
    {
      CFDictionaryRef v11 = (const __CFDictionary *)CFDictionaryGetValue(v1, @"LifetimeData");
      if (!v11)
      {
        if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_ERROR)) {
          sub_1000590C8();
        }
        goto LABEL_18;
      }
      CFNumberRef v12 = (const __CFNumber *)CFDictionaryGetValue(v11, @"MaximumRa0-8");
      if (!v12)
      {
        if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_ERROR)) {
          sub_1000590FC();
        }
        goto LABEL_18;
      }
      CFNumberGetValue(v12, kCFNumberIntType, &valuePtr);
    }
    if (dword_1000A259C != -1) {
      unsigned int valuePtr = dword_1000A259C;
    }
LABEL_18:
    CFRelease(v1);
    return valuePtr;
  }
  uint64_t v14 = qword_1000AABC0;
  if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_ERROR)) {
    sub_10005901C(v14, v15, v16, v17, v18, v19, v20, v21);
  }
  return 0xFFFFFFFFLL;
}

void sub_100038F60(int a1)
{
  CFDictionaryRef v2 = qword_1000AABC0;
  if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_DEFAULT))
  {
    v3[0] = 67109120;
    v3[1] = a1;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "<Notice> Overriding Ra to %d", (uint8_t *)v3, 8u);
  }
  dword_1000A259C = a1;
}

void sub_10003900C()
{
  dword_1000A259C = -1;
}

void sub_10003901C(int a1)
{
  CFDictionaryRef v2 = qword_1000AABC0;
  if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_DEFAULT))
  {
    v3[0] = 67109120;
    v3[1] = a1;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "<Notice> Overriding Weighted Ra to %d", (uint8_t *)v3, 8u);
  }
  dword_1000A2598 = a1;
}

void sub_1000390C8()
{
  dword_1000A2598 = -1;
}

uint64_t sub_1000390D8()
{
  unsigned int v8 = 0;
  io_registry_entry_t v0 = dword_1000AA6EC;
  if (!dword_1000AA6EC)
  {
    CFMutableDictionaryRef v1 = IOServiceMatching("IOService");
    if (v1)
    {
      CFDictionaryRef v2 = v1;
      int valuePtr = 0;
      qword_1000AA6F0 = (uint64_t)CFNumberCreate(kCFAllocatorDefault, kCFNumberSInt32Type, &valuePtr);
      CFDictionaryRef v3 = CFDictionaryCreate(kCFAllocatorDefault, (const void **)&off_1000A25B0, (const void **)&qword_1000AA6F0, 1, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
      if (v3)
      {
        CFDictionaryRef v4 = v3;
        CFDictionarySetValue(v2, @"IOPropertyMatch", v3);
        CFRelease(v4);
        dword_1000AA6EC = IOServiceGetMatchingService(kIOMainPortDefault, v2);
      }
      else
      {
        CFRelease(v2);
      }
    }
    io_registry_entry_t v0 = dword_1000AA6EC;
    if (!dword_1000AA6EC)
    {
      uint64_t result = os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_ERROR);
      if (!result) {
        return result;
      }
      sub_1000591A8();
      return 0;
    }
  }
  CFNumberRef CFProperty = (const __CFNumber *)IORegistryEntryCreateCFProperty(v0, @"IOPMUBootUPOCounter", kCFAllocatorDefault, 0);
  if (!CFProperty)
  {
    uint64_t result = os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_ERROR);
    if (!result) {
      return result;
    }
    sub_1000591DC();
    return 0;
  }
  CFNumberRef v6 = CFProperty;
  CFNumberGetValue(CFProperty, kCFNumberIntType, &v8);
  if (dword_1000A25A0 != -1) {
    unsigned int v8 = dword_1000A25A0;
  }
  CFRelease(v6);
  return v8;
}

uint64_t sub_100039264(uint64_t result)
{
  dword_1000A25A0 = result;
  return result;
}

uint64_t sub_100039270()
{
  return byte_1000AA6C8;
}

uint64_t sub_10003927C(uint64_t result)
{
  byte_1000AA6C8 = result;
  return result;
}

uint64_t sub_100039288(uint64_t result)
{
  byte_1000A25A4 = result;
  return result;
}

uint64_t sub_100039294()
{
  return byte_1000A25A4;
}

uint64_t sub_1000392A0()
{
  return byte_1000AA6C9;
}

uint64_t sub_1000392AC(uint64_t result)
{
  byte_1000AA6C9 = result;
  return result;
}

uint64_t sub_1000392B8(io_registry_entry_t a1)
{
  if (dword_1000A25A8 != -1) {
    return dword_1000A25A8 != 0;
  }
  if (a1) {
    return sub_100038064(a1, @"ExternalConnected");
  }
  return 1;
}

uint64_t sub_1000392EC(uint64_t result)
{
  dword_1000A25A8 = result;
  return result;
}

void sub_1000392F8(uint64_t a1, const __CFArray *cf)
{
  if (a1 && cf && (CFTypeID v4 = CFGetTypeID(cf), v4 == CFArrayGetTypeID()))
  {
    if (CFArrayGetCount(cf) >= 1)
    {
      CFIndex v5 = 0;
      do
      {
        CFDataRef ValueAtIndex = CFArrayGetValueAtIndex(cf, v5);
        CFTypeID v7 = CFGetTypeID(ValueAtIndex);
        if (v7 == CFNumberGetTypeID())
        {
          char valuePtr = 0;
          CFNumberGetValue((CFNumberRef)ValueAtIndex, kCFNumberCharType, &valuePtr);
          *(unsigned char *)(a1 + v5) = valuePtr;
        }
        ++v5;
      }
      while (CFArrayGetCount(cf) > v5);
    }
  }
  else
  {
    unsigned int v8 = qword_1000AABC0;
    if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_ERROR)) {
      sub_100059210(v8, v9, v10, v11, v12, v13, v14, v15);
    }
  }
}

BOOL sub_1000393E8()
{
  CFBooleanRef v0 = (const __CFBoolean *)MGCopyAnswer();
  if (!v0) {
    return 0;
  }
  CFBooleanRef v1 = v0;
  CFTypeID v2 = CFGetTypeID(v0);
  BOOL v3 = v2 == CFBooleanGetTypeID() && CFBooleanGetValue(v1) != 0;
  CFRelease(v1);
  return v3;
}

uint64_t sub_10003945C()
{
  uint64_t v0 = MGGetSInt32Answer();
  if (v0 == -1 && os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_ERROR)) {
    sub_100059288();
  }
  return v0;
}

BOOL sub_1000394C0()
{
  int v0 = sub_10003945C();
  char v1 = v0 - 12;
  if (v0 - 12) < 0x18 && ((0xC2C033u >> v1)) {
    return (0x7DBFDEu >> v1) & 1;
  }
  CFTypeID v2 = qword_1000AABC0;
  BOOL result = os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_ERROR);
  if (result)
  {
    sub_1000592BC(v0, v2);
    return 0;
  }
  return result;
}

BOOL sub_100039540(char *a1, const char *a2, size_t a3)
{
  size_t v6 = strlen(a1);
  size_t v7 = v6 + strlen(a2) + 1;
  if (v7 > a3)
  {
    if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_ERROR)) {
      sub_100059334();
    }
  }
  else
  {
    strcat(a1, a2);
  }
  return v7 <= a3;
}

uint64_t sub_1000395E0()
{
  return MGGetSInt32Answer();
}

uint64_t sub_1000395F0(char *name, int *out_token, NSObject *a3, void *a4)
{
  if (a3 && name && out_token && a4)
  {
    if (notify_register_check(name, out_token))
    {
      uint64_t v17 = qword_1000AABC0;
      if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_ERROR)) {
        sub_100059420(v17, v18, v19, v20, v21, v22, v23, v24);
      }
    }
    else
    {
      if (!notify_register_dispatch(name, out_token, a3, a4))
      {
        v33[0] = _NSConcreteStackBlock;
        v33[1] = 3221225472;
        v33[2] = sub_10003973C;
        v33[3] = &unk_1000860B8;
        v33[4] = a4;
        v33[5] = out_token;
        dispatch_async(a3, v33);
        return 0;
      }
      int v25 = qword_1000AABC0;
      if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_ERROR)) {
        sub_1000593A8(v25, v26, v27, v28, v29, v30, v31, v32);
      }
    }
  }
  else
  {
    uint64_t v9 = qword_1000AABC0;
    if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_ERROR)) {
      sub_100059498(v9, v10, v11, v12, v13, v14, v15, v16);
    }
  }
  return -1;
}

uint64_t sub_10003973C(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), **(unsigned int **)(a1 + 40));
}

uint64_t sub_100039754(uint64_t a1, uint64_t a2)
{
  if ((a2 & 0x8000000000000000) == 0 || (unint64_t v2 = 0x8000000000000000, (uint64_t)(0x8000000000000000 - a2) <= a1))
  {
    BOOL v3 = (a2 ^ 0x7FFFFFFFFFFFFFFFLL) >= a1 || a2 <= 0;
    unint64_t v2 = a2 + a1;
    if (!v3) {
      return 0x7FFFFFFFFFFFFFFFLL;
    }
  }
  return v2;
}

CFDictionaryRef sub_100039788(int a1, int a2)
{
  int v4 = a2;
  int valuePtr = a1;
  *(_OWORD *)keys = *(_OWORD *)&off_1000860D8;
  xpc_object_t values = CFNumberCreate(kCFAllocatorDefault, kCFNumberSInt32Type, &valuePtr);
  CFTypeRef cf = CFNumberCreate(kCFAllocatorDefault, kCFNumberSInt32Type, &v4);
  CFDictionaryRef v2 = CFDictionaryCreate(kCFAllocatorDefault, (const void **)keys, (const void **)&values, 2, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFRelease(values);
  CFRelease(cf);
  return v2;
}

uint64_t sub_10003985C(__IOHIDServiceClient *a1, const __CFString *a2)
{
  unsigned int valuePtr = 0;
  CFNumberRef v2 = (const __CFNumber *)IOHIDServiceClientCopyProperty(a1, a2);
  CFNumberRef v3 = v2;
  if (v2)
  {
    CFTypeID v4 = CFGetTypeID(v2);
    if (v4 == CFNumberGetTypeID())
    {
      if (!CFNumberGetValue(v3, kCFNumberSInt32Type, &valuePtr)
        && os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_ERROR))
      {
        sub_100059578();
      }
      goto LABEL_8;
    }
  }
  if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_ERROR))
  {
    sub_100059510();
    if (v3) {
      goto LABEL_8;
    }
  }
  else if (v3)
  {
LABEL_8:
    CFRelease(v3);
    return valuePtr;
  }
  return 0;
}

void sub_100039944(uint64_t a1)
{
  char v1 = +[NSURL fileURLWithPath:a1];
  uint64_t v2 = 0;
  if (![(NSURL *)v1 setResourceValue:+[NSNumber numberWithBool:1] forKey:NSURLIsExcludedFromBackupKey error:&v2]&& os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_ERROR))
  {
    sub_1000595E0(v1);
  }
}

id sub_1000399E0()
{
  CFDictionaryRef v0 = IOServiceMatching("IOPMPowerSource");
  io_service_t MatchingService = IOServiceGetMatchingService(kIOMainPortDefault, v0);
  CFMutableDictionaryRef properties = 0;
  IORegistryEntryCreateCFProperties(MatchingService, &properties, 0, 0);
  CFMutableDictionaryRef v2 = properties;
  id v3 = [[properties objectForKeyedSubscript:@"BatteryShutdownReason"] copy];

  return v3;
}

void sub_100039A60(unsigned int *a1, unsigned int *a2)
{
  id v8 = sub_1000399E0();
  id v4 = [v8 objectForKeyedSubscript:@"uiSOC"];
  id v5 = [v8 objectForKeyedSubscript:@"temperature"];
  if (a1)
  {
    if (v4) {
      unsigned int v6 = [v4 intValue];
    }
    else {
      unsigned int v6 = -1;
    }
    *a1 = v6;
  }
  if (a2)
  {
    if (v5) {
      unsigned int v7 = [v5 intValue];
    }
    else {
      unsigned int v7 = -1;
    }
    *a2 = v7;
  }
}

void sub_100039B0C(int a1)
{
  int valuePtr = a1;
  if (qword_1000AA6D0 != -1) {
    dispatch_once(&qword_1000AA6D0, &stru_1000860E8);
  }
  CFNumberRef v1 = CFNumberCreate(kCFAllocatorDefault, kCFNumberIntType, &valuePtr);
  if (dword_1000AA6D8
    && IORegistryEntrySetCFProperty(dword_1000AA6D8, @"UseBaselineSystemCapability", v1)
    && os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_ERROR))
  {
    sub_10005966C();
    if (!v1) {
      return;
    }
  }
  else if (!v1)
  {
    return;
  }
  CFRelease(v1);
}

void sub_100039BD0(id a1)
{
  dword_1000AA6D8 = sub_100037CD4("ApplePPM", 0, 0);
}

uint64_t sub_100039C00()
{
  unsigned int v1 = 0;
  sub_100038338();
  if ((sub_100009568(dword_1000AA6C4, @"ThermalProfile", &v1, 1) & 1) == 0
    && os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_ERROR))
  {
    sub_1000596A0();
  }
  return v1;
}

float sub_100039C78()
{
  [+[SensorExchangeHelper sharedInstance] registerCLTMSensorIndex:0 forSMCKey:@"zETN" atSMCIndex:0];
  [+[SensorExchangeHelper sharedInstance] registerCLTMSensorIndex:1 forSMCKey:@"zETN" atSMCIndex:1];
  *(float *)dword_1000AAEE0 = (float)(int)MGGetSInt32Answer();
  float result = (float)sub_1000394C0();
  *(float *)&dword_1000AAEE4 = result;
  return result;
}

uint64_t sub_100039CFC()
{
  if ((byte_1000AA6DC & 1) == 0)
  {
    uint64_t v0 = IOReportCopyChannelsInGroup();
    if (v0)
    {
      unsigned int v1 = (const void *)v0;
      Subscription = (const void *)IOReportCreateSubscription();
      CFRelease(v1);
      if (Subscription) {
        CFRelease(Subscription);
      }
    }
    else if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_ERROR))
    {
      sub_1000596D4();
    }
  }
  return dword_1000AA6E0;
}

int sub_100039E0C(id a1, __CFDictionary *a2)
{
  ChannelName = (void *)IOReportChannelGetChannelName();
  dword_1000AA6E0 = IOReportSimpleGetIntegerValue();
  int result = [ChannelName isEqualToString:@"BatteryIDChanged"];
  if (result)
  {
    byte_1000AA6DC = 1;
    return dword_1000AA6E0;
  }
  return result;
}

void sub_100039E70()
{
  uint64_t v0 = (__IOHIDEventSystemClient *)IOHIDEventSystemClientCreateWithType();
  CFArrayRef theArray = IOHIDEventSystemClientCopyServices(v0);
  if (theArray && CFArrayGetCount(theArray))
  {
    unsigned int v1 = qword_1000AABC0;
    if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_DEFAULT, "<Notice> IOHID Event System State", buf, 2u);
    }
    uint64_t v2 = 0;
    uint64_t v12 = v0;
    do
    {
      CFArrayRef v3 = (const __CFArray *)IOHIDEventSystemClientCopyProperty(v0, off_100086148[v2]);
      if (v3)
      {
        CFArrayRef v4 = v3;
        CFTypeID v5 = CFGetTypeID(v3);
        if (v5 == CFArrayGetTypeID())
        {
          CFIndex Count = CFArrayGetCount(v4);
          if (Count >= 1)
          {
            CFIndex v7 = Count;
            for (CFIndex i = 0; i != v7; ++i)
            {
              CFDataRef ValueAtIndex = CFArrayGetValueAtIndex(v4, i);
              uint64_t v10 = qword_1000AABC0;
              if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)long long buf = 138412290;
                uint64_t v14 = ValueAtIndex;
                _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "<Notice> dict: %@", buf, 0xCu);
              }
            }
          }
          CFRelease(v4);
          uint64_t v0 = v12;
        }
      }
      ++v2;
    }
    while (v2 != 3);
  }
  if (v0) {
    CFRelease(v0);
  }
  if (theArray) {
    CFRelease(theArray);
  }
}

uint64_t sub_10003A04C()
{
  return ([+[SensorDispatcherHelper sharedInstance] getValueFromSMCForKey:@"GGRC"] >> 24);
}

uint64_t sub_10003A07C()
{
  if (byte_1000AA6E4) {
    return dword_1000AA6E8;
  }
  CFMutableDictionaryRef v1 = IOServiceMatching("IOPMPowerSource");
  CFMutableDictionaryRef v2 = IOServiceMatching("AppleAuthCPRelay");
  CFDictionaryRef v3 = v2;
  if (!v2 || !v1)
  {
    if (v2) {
      CFRelease(v2);
    }
    if (v1) {
      CFRelease(v1);
    }
LABEL_16:
    uint64_t result = 0xFFFFFFFFLL;
    dword_1000AA6E8 = -1;
    return result;
  }
  CFDictionarySetValue(v2, @"IOParentMatch", v1);
  CFRelease(v1);
  io_service_t MatchingService = IOServiceGetMatchingService(kIOMainPortDefault, v3);
  if (!MatchingService) {
    return dword_1000AA6E8;
  }
  CFMutableDictionaryRef properties = 0;
  IORegistryEntryCreateCFProperties(MatchingService, &properties, 0, 0);
  CFTypeID v5 = (id)CFMakeCollectable(properties);
  if (!v5) {
    goto LABEL_16;
  }
  unsigned int v6 = v5;
  if (![v5 objectForKey:@"isTrustedForUI"]) {
    goto LABEL_16;
  }
  if (objc_msgSend(objc_msgSend(v6, "objectForKey:", @"isTrustedForUI"), "BOOLValue")) {
    uint64_t result = 1;
  }
  else {
    uint64_t result = 2;
  }
  dword_1000AA6E8 = result;
  byte_1000AA6E4 = 1;
  return result;
}

void sub_10003A1A8(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x16u);
}

void sub_10003A1E0(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

NSDictionary *sub_10003A690(uint64_t a1)
{
  v3[0] = @"TG0B";
  v4[0] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 32)];
  v3[1] = @"PMU_Tdev1";
  v4[1] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 36)];
  _DWORD v3[2] = @"PMU_Tdev2";
  _DWORD v4[2] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 40)];
  v3[3] = @"PMU_Tdev3";
  v4[3] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 44)];
  v3[4] = @"PMU_Tdev5";
  v4[4] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 48)];
  v3[5] = @"PMU2_Tdev1";
  v4[5] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 52)];
  v3[6] = @"PMU2_Tdev2";
  void v4[6] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 56)];
  v3[7] = @"PMU2_Tdev3";
  v4[7] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 60)];
  v3[8] = @"TSBM";
  v4[8] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 64)];
  v3[9] = @"TSFD";
  v4[9] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 68)];
  void v3[10] = @"TSBQ";
  void v4[10] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 72)];
  void v3[11] = @"Die_Temp_MaxAverage";
  void v4[11] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 76)];
  void v3[12] = @"Die_Temp_MaxMax";
  void v4[12] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 80)];
  void v3[13] = @"maxLI_PackagePower";
  void v4[13] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 84)];
  void v3[14] = @"maxLI_Speaker";
  void v4[14] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 88)];
  void v3[15] = @"BackLight_maxLI";
  void v4[15] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 92)];
  void v3[16] = @"Solar_Context";
  uint8_t v4[16] = +[NSNumber numberWithInt:*(unsigned __int8 *)(a1 + 112)];
  v3[17] = @"Pressure_Level";
  v4[17] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 96)];
  v3[18] = @"Gas_Gauge_avg_Power";
  v4[18] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 100)];
  void v3[19] = @"Charger_State";
  void v4[19] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 104)];
  v3[20] = @"Package_Power";
  v4[20] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 108)];
  return +[NSDictionary dictionaryWithObjects:v4 forKeys:v3 count:21];
}

_UNKNOWN **sub_10003AF58(uint64_t a1)
{
  uint64_t result = &off_10008D8C8;
  *(void *)(*(void *)(a1 + 32) + 400) = result;
  return result;
}

_UNKNOWN **sub_10003B034(uint64_t a1)
{
  uint64_t result = &off_10008D8E0;
  *(void *)(*(void *)(a1 + 32) + 408) = result;
  return result;
}

NSDictionary *sub_10003B8A4(uint64_t a1)
{
  v5[0] = @"TG0B";
  v6[0] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 40)];
  v5[1] = @"TG0V";
  v6[1] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 44)];
  _DWORD v5[2] = @"PMU_Tdev1";
  void v6[2] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 48)];
  v5[3] = @"PMU_Tdev2";
  v6[3] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 52)];
  v5[4] = @"TSRR";
  v6[4] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 56)];
  void v5[5] = @"TSBR";
  v6[5] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 60)];
  v5[6] = @"TSFL";
  v6[6] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 64)];
  v5[7] = @"TSRM";
  v6[7] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 68)];
  v5[8] = @"TSFC";
  v6[8] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 72)];
  v5[9] = @"TSFD";
  v6[9] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 76)];
  v5[10] = @"mic2";
  v6[10] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 80)];
  v5[11] = @"TSBQ";
  v6[11] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 84)];
  v5[12] = @"TSFG";
  v6[12] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 88)];
  v5[13] = @"Die_Temp_MaxAverage";
  v6[13] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 92)];
  v5[14] = @"Die_Temp_MaxMax";
  v6[14] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 96)];
  v5[15] = @"Package_Power";
  v6[15] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 100)];
  v5[16] = @"Charger_State";
  v6[16] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 104)];
  v5[17] = @"Solar_Context";
  v6[17] = +[NSNumber numberWithInt:*(unsigned __int8 *)(a1 + 112)];
  v5[18] = @"Pressure_Level";
  CFMutableDictionaryRef v2 = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 108)];
  void v5[19] = @"Device_Activity";
  uint64_t v3 = *(void *)(a1 + 32);
  v6[18] = v2;
  void v6[19] = v3;
  return +[NSDictionary dictionaryWithObjects:v6 forKeys:v5 count:20];
}

NSDictionary *sub_10003CBF4(uint64_t a1)
{
  v3[0] = @"TG0B";
  v4[0] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 32)];
  v3[1] = @"TG0V";
  v4[1] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 36)];
  _DWORD v3[2] = @"PMU_Tdev1";
  _DWORD v4[2] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 40)];
  v3[3] = @"PMU_Tdev2";
  v4[3] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 44)];
  v3[4] = @"TSBR";
  v4[4] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 48)];
  v3[5] = @"TSBE";
  v4[5] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 52)];
  v3[6] = @"TSRR";
  void v4[6] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 56)];
  v3[7] = @"TSRM";
  v4[7] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 60)];
  v3[8] = @"TSFL";
  v4[8] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 64)];
  v3[9] = @"TSFC";
  v4[9] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 68)];
  void v3[10] = @"TSFD";
  void v4[10] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 72)];
  void v3[11] = @"TSBQ";
  void v4[11] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 76)];
  void v3[12] = @"Die_Temp_MaxAverage";
  void v4[12] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 80)];
  void v3[13] = @"Die_Temp_MaxMax";
  void v4[13] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 84)];
  void v3[14] = @"Package_Power";
  void v4[14] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 88)];
  void v3[15] = @"Charger_State";
  void v4[15] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 92)];
  void v3[16] = @"Solar_Context";
  uint8_t v4[16] = +[NSNumber numberWithInt:*(unsigned __int8 *)(a1 + 100)];
  v3[17] = @"Pressure_Level";
  v4[17] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 96)];
  v3[18] = @"Accessory";
  v4[18] = +[NSNumber numberWithInt:*(unsigned __int8 *)(a1 + 101)];
  return +[NSDictionary dictionaryWithObjects:v4 forKeys:v3 count:19];
}

void sub_10003D1D0(uint64_t a1)
{
  CFMutableDictionaryRef v2 = qword_1000AABC0;
  if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "<Notice> Arc control: AVAudioSession reset", buf, 2u);
  }
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(NSObject **)(v3 + 16);
  if (v4)
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10003D298;
    block[3] = &unk_100085248;
    block[4] = v3;
    dispatch_async(v4, block);
  }
}

uint64_t sub_10003D298(uint64_t result)
{
  *(_DWORD *)(*(void *)(result + 32) + 24) = -1;
  return result;
}

id sub_10003D320(uint64_t a1)
{
  return [*(id *)(a1 + 32) updateInternal];
}

void sub_10003E2D8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,id a23)
{
  objc_destroyWeak(v24);
  objc_destroyWeak(&location);
  objc_destroyWeak(v23);
  objc_destroyWeak(&a23);
  _Unwind_Resume(a1);
}

id sub_10003E314(uint64_t a1, int a2)
{
  id Weak = objc_loadWeak((id *)(a1 + 32));
  uint64_t state64 = 0;
  id result = (id)notify_get_state(a2, &state64);
  if (!result) {
    return [Weak handleRearCameraPowerStateNotification:state64];
  }
  return result;
}

id sub_10003E368(uint64_t a1, int a2)
{
  id Weak = objc_loadWeak((id *)(a1 + 32));
  uint64_t state64 = 0;
  id result = (id)notify_get_state(a2, &state64);
  if (!result) {
    return [Weak handleFrontCameraPowerStateNotification:state64];
  }
  return result;
}

void sub_10003EBB0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x12u);
}

NSDictionary *sub_10003F0B0(uint64_t a1)
{
  v3[0] = @"TG0B";
  v4[0] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 32)];
  v3[1] = @"TSFD";
  v4[1] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 36)];
  _DWORD v3[2] = @"TSFL";
  _DWORD v4[2] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 40)];
  v3[3] = @"TSBQ";
  v4[3] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 44)];
  v3[4] = @"TSBM";
  v4[4] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 48)];
  v3[5] = @"TP4d";
  v4[5] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 52)];
  v3[6] = @"TP5d";
  void v4[6] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 56)];
  v3[7] = @"batteryVT";
  v4[7] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 60)];
  v3[8] = @"Die_Temp_MaxAverage";
  v4[8] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 64)];
  v3[9] = @"Die_Temp_MaxMax";
  v4[9] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 68)];
  void v3[10] = @"maxLI_CPU";
  void v4[10] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 72)];
  void v3[11] = @"maxLI_GPU";
  void v4[11] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 76)];
  void v3[12] = @"Gas_Gauge_avg_Power";
  void v4[12] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 80)];
  void v3[13] = @"Charger_State";
  void v4[13] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 84)];
  void v3[14] = @"Solar_Context";
  void v4[14] = +[NSNumber numberWithInt:*(unsigned __int8 *)(a1 + 88)];
  return +[NSDictionary dictionaryWithObjects:v4 forKeys:v3 count:15];
}

NSDictionary *sub_10003F4EC(uint64_t a1)
{
  v3[0] = @"TSBM";
  v4[0] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 32)];
  v3[1] = @"TSFD";
  v4[1] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 36)];
  _DWORD v3[2] = @"TSFL";
  _DWORD v4[2] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 40)];
  v3[3] = @"TSFG";
  v4[3] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 44)];
  v3[4] = @"TSBQ";
  v4[4] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 48)];
  v3[5] = @"TS1B";
  v4[5] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 52)];
  v3[6] = @"TP5d";
  void v4[6] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 56)];
  v3[7] = @"TSBR";
  v4[7] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 60)];
  v3[8] = @"Die_Temp_MaxAverage";
  v4[8] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 64)];
  v3[9] = @"Die_Temp_MaxMax";
  v4[9] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 68)];
  void v3[10] = @"Charger_State";
  void v4[10] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 72)];
  void v3[11] = @"Solar_Context";
  void v4[11] = +[NSNumber numberWithInt:*(unsigned __int8 *)(a1 + 80)];
  void v3[12] = @"Pressure_Level";
  void v4[12] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 76)];
  return +[NSDictionary dictionaryWithObjects:v4 forKeys:v3 count:13];
}

NSDictionary *sub_100041C14(uint64_t a1)
{
  v3[0] = @"TG0B";
  v4[0] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 32)];
  v3[1] = @"PMU_Tdev1";
  v4[1] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 36)];
  _DWORD v3[2] = @"PMU_Tdev2";
  _DWORD v4[2] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 40)];
  v3[3] = @"Die_Temp_MaxAverage";
  v4[3] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 44)];
  v3[4] = @"Die_Temp_MaxMax";
  v4[4] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 48)];
  v3[5] = @"TSFC";
  v4[5] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 52)];
  v3[6] = @"TSBR";
  void v4[6] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 56)];
  v3[7] = @"TS0A";
  v4[7] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 60)];
  v3[8] = @"TSFD";
  v4[8] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 64)];
  v3[9] = @"TSRM";
  v4[9] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 68)];
  void v3[10] = @"TSFL";
  void v4[10] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 72)];
  void v3[11] = @"Charger_State";
  void v4[11] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 76)];
  void v3[12] = @"Solar_Context";
  void v4[12] = +[NSNumber numberWithInt:*(unsigned __int8 *)(a1 + 84)];
  void v3[13] = @"Pressure_Level";
  void v4[13] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 80)];
  return +[NSDictionary dictionaryWithObjects:v4 forKeys:v3 count:14];
}

NSDictionary *sub_100042028(uint64_t a1)
{
  v3[0] = @"TSBM";
  v4[0] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 32)];
  v3[1] = @"TSFD";
  v4[1] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 36)];
  _DWORD v3[2] = @"TSFL";
  _DWORD v4[2] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 40)];
  v3[3] = @"TSFG";
  v4[3] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 44)];
  v3[4] = @"TSBQ";
  v4[4] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 48)];
  v3[5] = @"TS1B";
  v4[5] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 52)];
  v3[6] = @"TP5d";
  void v4[6] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 56)];
  v3[7] = @"TSBR";
  v4[7] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 60)];
  v3[8] = @"Die_Temp_MaxAverage";
  v4[8] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 64)];
  v3[9] = @"Die_Temp_MaxMax";
  v4[9] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 68)];
  void v3[10] = @"Package_Power";
  void v4[10] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 72)];
  void v3[11] = @"Gas_Gauge_avg_Power";
  void v4[11] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 76)];
  void v3[12] = @"Charger_State";
  void v4[12] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 80)];
  void v3[13] = @"Solar_Context";
  void v4[13] = +[NSNumber numberWithInt:*(unsigned __int8 *)(a1 + 84)];
  return +[NSDictionary dictionaryWithObjects:v4 forKeys:v3 count:14];
}

NSDictionary *sub_100042AA0(uint64_t a1)
{
  v3[0] = @"TG0B";
  v4[0] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 32)];
  v3[1] = @"TSFD";
  v4[1] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 36)];
  _DWORD v3[2] = @"TS0A";
  _DWORD v4[2] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 40)];
  v3[3] = @"TSBH";
  v4[3] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 44)];
  v3[4] = @"TP6D";
  v4[4] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 48)];
  v3[5] = @"TSBR";
  v4[5] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 52)];
  v3[6] = @"Die_Temp_MaxAverage";
  void v4[6] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 56)];
  v3[7] = @"Die_Temp_MaxMax";
  v4[7] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 60)];
  v3[8] = @"maxLI_CPU";
  v4[8] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 64)];
  v3[9] = @"maxLI_GPU";
  v4[9] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 68)];
  void v3[10] = @"maxLI_RR";
  void v4[10] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 72)];
  void v3[11] = @"Gas_Gauge_avg_Power";
  void v4[11] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 76)];
  void v3[12] = @"Charger_State";
  void v4[12] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 80)];
  void v3[13] = @"Solar_Context";
  void v4[13] = +[NSNumber numberWithInt:*(unsigned __int8 *)(a1 + 84)];
  return +[NSDictionary dictionaryWithObjects:v4 forKeys:v3 count:14];
}

void sub_100043878(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) copyUpdatedLTSState];
  if (v2)
  {
    id v3 = v2;
    [*(id *)(a1 + 32) saveLTSStateToNand:v2];
    uint64_t v4 = *(void **)(a1 + 32);
    [v4 safeFreeUpdatedLTSState:v3];
  }
  else if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_ERROR))
  {
    sub_10005A790();
  }
}

id sub_10004866C(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 24) updatePersistedState];
  [*(id *)(*(void *)(a1 + 32) + 32) updatePersistedState];
  id v2 = *(void **)(*(void *)(a1 + 32) + 40);

  return [v2 updatePersistedState];
}

uint64_t sub_10004939C(uint64_t a1)
{
  int Count = IOReportStateGetCount();
  int v4 = Count;
  if (Count < 17)
  {
    if (Count < 1) {
      return 0;
    }
  }
  else if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_ERROR))
  {
    sub_10005BDB4();
  }
  int v5 = 0;
  *(void *)&long long v3 = 138412546;
  long long v15 = v3;
  do
  {
    IOReportStateGetDutyCycle();
    if (v6 > 0.0)
    {
      double v7 = v6;
      CFStringRef NameForIndex = (const __CFString *)IOReportStateGetNameForIndex();
      if (NameForIndex)
      {
        uint64_t v9 = (__CFString *)NameForIndex;
        if (CFStringGetCharacterAtIndex(NameForIndex, 0) == 86)
        {
          if (byte_1000AA7A0)
          {
            uint64_t v10 = qword_1000AABC0;
            if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)long long buf = v15;
              uint64_t v17 = v9;
              __int16 v18 = 2048;
              double v19 = v7;
              _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "<Notice> LSController: %@, fraction %f", buf, 0x16u);
            }
          }
          int v11 = [[-[__CFString substringFromIndex:](v9, "substringFromIndex:", 1, v15) stringByAppendingPathComponent:@"DBCShutdownCookie"];
          unsigned int v12 = v11 & ~(v11 >> 31);
          if (v12 >= 0xF) {
            unsigned int v12 = 15;
          }
          float v13 = v7;
          *(float *)(*(void *)(a1 + 32) + 4 * v12 + 136) = v13;
        }
      }
    }
    ++v5;
  }
  while (v4 != v5);
  return 0;
}

uint64_t sub_10004962C(uint64_t a1)
{
  int Count = IOReportStateGetCount();
  int v4 = Count;
  if (Count < 17)
  {
    if (Count < 1) {
      return 0;
    }
  }
  else if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_ERROR))
  {
    sub_10005BE28();
  }
  int v5 = 0;
  *(void *)&long long v3 = 138412546;
  long long v15 = v3;
  do
  {
    IOReportStateGetDutyCycle();
    if (v6 > 0.0)
    {
      double v7 = v6;
      CFStringRef NameForIndex = (const __CFString *)IOReportStateGetNameForIndex();
      if (NameForIndex)
      {
        uint64_t v9 = (__CFString *)NameForIndex;
        if (CFStringGetCharacterAtIndex(NameForIndex, 0) == 80)
        {
          if (byte_1000AA7A0)
          {
            uint64_t v10 = qword_1000AABC0;
            if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)long long buf = v15;
              uint64_t v17 = v9;
              __int16 v18 = 2048;
              double v19 = v7;
              _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "<Notice> LSController: %@, fraction %f", buf, 0x16u);
            }
          }
          int v11 = [[-[__CFString substringFromIndex:](v9, "substringFromIndex:", 1, v15) stringByAppendingPathComponent:@"DBCShutdownCookie"];
          unsigned int v12 = v11 & ~(v11 >> 31);
          if (v12 >= 0xF) {
            unsigned int v12 = 15;
          }
          float v13 = v7;
          *(float *)(*(void *)(a1 + 32) + 4 * v12 + 296) = v13;
        }
      }
    }
    ++v5;
  }
  while (v4 != v5);
  return 0;
}

NSDictionary *sub_100049EF8(uint64_t a1)
{
  v3[0] = @"ECore_Die_Temp_Target";
  v4[0] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [*(id *)(*(void *)(a1 + 32) + 24) dieTempTarget]);
  v3[1] = @"PCore_Die_Temp_Target";
  v4[1] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [*(id *)(*(void *)(a1 + 32) + 32) dieTempTarget]);
  _DWORD v3[2] = @"GCore_Die_Temp_Target";
  _DWORD v4[2] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [*(id *)(*(void *)(a1 + 32) + 40) dieTempTarget]);
  v3[3] = @"ECore_Die_Temp_Delta";
  v4[3] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 40)];
  v3[4] = @"PCore_Die_Temp_Delta";
  v4[4] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 44)];
  v3[5] = @"GCore_Die_Temp_Delta";
  v4[5] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 48)];
  v3[6] = @"Fast_Die_Engaged";
  void v4[6] = +[NSNumber numberWithInt:*(unsigned __int8 *)(a1 + 52)];
  return +[NSDictionary dictionaryWithObjects:v4 forKeys:v3 count:7];
}

void sub_10004A0F4(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x12u);
}

void sub_10004A12C(uint64_t a1@<X8>)
{
  *(void *)(v1 - 8) = a1;
}

_UNKNOWN **sub_10004B380(uint64_t a1)
{
  id result = &off_10008D958;
  *(void *)(*(void *)(a1 + 32) + 416) = result;
  return result;
}

_UNKNOWN **sub_10004B45C(uint64_t a1)
{
  id result = &off_10008D970;
  *(void *)(*(void *)(a1 + 32) + 424) = result;
  return result;
}

NSDictionary *sub_10004B9A0(uint64_t a1)
{
  v3[0] = @"TG0B";
  v4[0] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 32)];
  v3[1] = @"PMU_Tdev1";
  v4[1] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 36)];
  _DWORD v3[2] = @"PMU_Tdev2";
  _DWORD v4[2] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 40)];
  v3[3] = @"Die_Temp_MaxAverage";
  v4[3] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 44)];
  v3[4] = @"Die_Temp_MaxMax";
  v4[4] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 48)];
  v3[5] = @"TSFC";
  v4[5] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 52)];
  v3[6] = @"TSBR";
  void v4[6] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 56)];
  void v3[7] = @"TS0A";
  void v4[7] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 60)];
  v3[8] = @"TSFD";
  v4[8] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 64)];
  v3[9] = @"TSRM";
  v4[9] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 68)];
  void v3[10] = @"TSFG";
  void v4[10] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 72)];
  void v3[11] = @"Charger_State";
  void v4[11] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 76)];
  void v3[12] = @"Solar_Context";
  void v4[12] = +[NSNumber numberWithInt:*(unsigned __int8 *)(a1 + 84)];
  void v3[13] = @"Pressure_Level";
  void v4[13] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 80)];
  return +[NSDictionary dictionaryWithObjects:v4 forKeys:v3 count:14];
}

id sub_10004DB18(uint64_t a1)
{
  id result = [objc_alloc((Class)NSUserDefaults) initWithSuiteName:@"com.apple.cltm"];
  *(void *)(*(void *)(a1 + 32) + 392) = result;
  return result;
}

void sub_10004E7D0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id sub_10004E7EC(uint64_t a1, int a2)
{
  id Weak = objc_loadWeak((id *)(a1 + 32));
  uint64_t state64 = 0;
  notify_get_state(a2, &state64);
  return [Weak setIsBackLightOn:state64 != 0];
}

void sub_10004E904(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_10004E920(uint64_t a1)
{
  id Weak = objc_loadWeak((id *)(a1 + 32));
  int valuePtr = 0;
  CFDictionaryRef v2 = IOPSCopyExternalPowerAdapterDetails();
  if (!v2)
  {
    uint64_t v5 = 0;
    goto LABEL_10;
  }
  CFDictionaryRef v3 = v2;
  if (!CFDictionaryContainsKey(v2, @"FamilyCode"))
  {
LABEL_8:
    uint64_t v5 = 0;
    goto LABEL_9;
  }
  CFArrayRef Value = CFDictionaryGetValue(v3, @"FamilyCode");
  uint64_t v5 = (uint64_t)Value;
  if (Value)
  {
    CFTypeID v6 = CFGetTypeID(Value);
    if (v6 == CFNumberGetTypeID())
    {
      CFNumberGetValue((CFNumberRef)v5, kCFNumberIntType, &valuePtr);
      if ((valuePtr + 536723455) > 7) {
        uint64_t v5 = 10;
      }
      else {
        uint64_t v5 = *((unsigned int *)&unk_100069270 + valuePtr + 536723455);
      }
      goto LABEL_9;
    }
    goto LABEL_8;
  }
LABEL_9:
  CFRelease(v3);
LABEL_10:
  [Weak setChargerState:v5];
  double v7 = qword_1000AABC0;
  if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 67109120;
    int v10 = v5;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "<Notice> Charger type is %d", buf, 8u);
  }
}

void sub_10004F520(id a1)
{
  byte_1000AA754 = MGGetBoolAnswer();
}

id sub_10004F768(uint64_t a1)
{
  int v2 = *(_DWORD *)(a1 + 44);
  uint64_t v3 = (*(_DWORD *)(a1 + 40) + *(_DWORD *)(a1 + 48) * v2);
  if (byte_1000AA7A0)
  {
    uint64_t v4 = qword_1000AABC0;
    if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_DEFAULT))
    {
      v6[0] = 67109376;
      v6[1] = v2;
      __int16 v7 = 1024;
      int v8 = v3;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "<Notice> TSFD blend %d, %d", (uint8_t *)v6, 0xEu);
    }
  }
  return [*(id *)(a1 + 32) writeAllCornerTemperatures:v3];
}

NSDictionary *sub_100051054(uint64_t a1)
{
  v3[0] = @"TG0B";
  v4[0] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 32)];
  v3[1] = @"TP4H";
  v4[1] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 36)];
  _DWORD v3[2] = @"TSFD";
  _DWORD v4[2] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 40)];
  v3[3] = @"TSFL";
  v4[3] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 44)];
  v3[4] = @"TSBQ";
  v4[4] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 48)];
  v3[5] = @"TSBM";
  v4[5] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 52)];
  v3[6] = @"batteryVT";
  void v4[6] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 56)];
  void v3[7] = @"TP5d";
  void v4[7] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 60)];
  v3[8] = @"maxLI_PackagePower";
  v4[8] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 64)];
  v3[9] = @"Die_Temp_MaxAverage";
  v4[9] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 68)];
  void v3[10] = @"Charger_State";
  void v4[10] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 72)];
  void v3[11] = @"Solar_Context";
  void v4[11] = +[NSNumber numberWithInt:*(unsigned __int8 *)(a1 + 76)];
  return +[NSDictionary dictionaryWithObjects:v4 forKeys:v3 count:12];
}

void sub_100051214(id a1)
{
  qword_1000AA768 = objc_alloc_init(SensorDispatcherHelper);
}

void sub_100051538(void *a1, io_iterator_t iterator)
{
  if (a1)
  {
    io_object_t v4 = IOIteratorNext(iterator);
    if (v4)
    {
      io_object_t v5 = v4;
      do
      {
        [a1 updateKeyboardState];
        IOObjectRelease(v5);
        io_object_t v5 = IOIteratorNext(iterator);
      }
      while (v5);
    }
  }
  else
  {
    CFTypeID v6 = qword_1000AABC0;
    if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_ERROR)) {
      sub_10005C988(v6, v7, v8, v9, v10, v11, v12, v13);
    }
  }
}

id sub_100051BC8(void *a1)
{
  id result = (id)IOHIDEventGetType();
  if (result == 3)
  {
    uint64_t IntegerValue = IOHIDEventGetIntegerValue();
    id result = (id)IOHIDEventGetIntegerValue();
    if (IntegerValue == 65289 && result == (id)17)
    {
      BOOL v4 = IOHIDEventGetIntegerValue() == 1;
      return [a1 updateFolioState:v4];
    }
  }
  return result;
}

NSDictionary *sub_100052634(uint64_t a1)
{
  v3[0] = @"TG0B";
  v4[0] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 32)];
  v3[1] = @"TSFD";
  v4[1] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 36)];
  _DWORD v3[2] = @"TSFL";
  _DWORD v4[2] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 40)];
  v3[3] = @"TSBQ";
  v4[3] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 44)];
  v3[4] = @"TSBM";
  v4[4] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 48)];
  v3[5] = @"TP4d";
  v4[5] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 52)];
  v3[6] = @"TP5d";
  void v4[6] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 56)];
  void v3[7] = @"batteryVT";
  void v4[7] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 60)];
  v3[8] = @"Die_Temp_MaxAverage";
  v4[8] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 64)];
  v3[9] = @"Die_Temp_MaxMax";
  v4[9] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 68)];
  void v3[10] = @"maxLI_CPU";
  void v4[10] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 72)];
  void v3[11] = @"maxLI_GPU";
  void v4[11] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 76)];
  void v3[12] = @"Gas_Gauge_avg_Power";
  void v4[12] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 80)];
  void v3[13] = @"Charger_State";
  void v4[13] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 84)];
  void v3[14] = @"Solar_Context";
  void v4[14] = +[NSNumber numberWithInt:*(unsigned __int8 *)(a1 + 88)];
  return +[NSDictionary dictionaryWithObjects:v4 forKeys:v3 count:15];
}

void sub_100054260(int a1, NSObject *a2)
{
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "<Error> Bad camera sensor index %d", (uint8_t *)v2, 8u);
}

void sub_1000542D8()
{
  sub_100012C60();
  sub_100012C1C((void *)&_mh_execute_header, v0, v1, "<Error> Empty 4CC list", v2, v3, v4, v5, v6);
}

void sub_10005430C(unsigned char *a1, unsigned char *a2)
{
  sub_100012C50(a1, a2);
  sub_100012C38((void *)&_mh_execute_header, v2, (uint64_t)v2, "<Error> Incorrect type in 4CC list", v3);
}

void sub_10005433C()
{
  sub_100012C60();
  sub_100012C1C((void *)&_mh_execute_header, v0, v1, "<Error> Bad working dictionaries", v2, v3, v4, v5, v6);
}

void sub_100054370()
{
  sub_100012C60();
  sub_100012C1C((void *)&_mh_execute_header, v0, v1, "<Error> callback queue NULL", v2, v3, v4, v5, v6);
}

void sub_1000543A4(unsigned char *a1, unsigned char *a2)
{
  sub_100012C50(a1, a2);
  sub_100012C38((void *)&_mh_execute_header, v2, (uint64_t)v2, "<Error> Not a valid sensor record", v3);
}

void sub_1000543D4(unsigned char *a1, unsigned char *a2)
{
  sub_100012C50(a1, a2);
  sub_100012C38((void *)&_mh_execute_header, v2, (uint64_t)v2, "<Error> Could not get value for filterParams", v3);
}

void sub_100054404(unsigned char *a1, unsigned char *a2)
{
  sub_100012C50(a1, a2);
  sub_100012C38((void *)&_mh_execute_header, v2, (uint64_t)v2, "<Error> Could not get value for matchName", v3);
}

void sub_100054434(unsigned char *a1, unsigned char *a2)
{
  sub_100012C50(a1, a2);
  sub_100012C38((void *)&_mh_execute_header, v2, (uint64_t)v2, "<Error> Could not get value for 4CC", v3);
}

void sub_100054464()
{
  sub_100012C60();
  sub_100012C1C((void *)&_mh_execute_header, v0, v1, "<Error> Bad working dictionary", v2, v3, v4, v5, v6);
}

void sub_100054498(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100054510(mach_error_t a1, NSObject *a2)
{
  int v3 = 136315138;
  uint64_t v4 = mach_error_string(a1);
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "<Error> Could not send temperature %s", (uint8_t *)&v3, 0xCu);
}

void sub_10005459C(uint8_t *buf, void *a2, os_log_t log)
{
  *(_DWORD *)long long buf = 136315138;
  *a2 = "-[HidSensors indexForTempSensorKey:]";
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "<Error> %s: null service", buf, 0xCu);
}

void sub_1000545EC(uint8_t *buf, void *a2, os_log_t log)
{
  *(_DWORD *)long long buf = 136315138;
  *a2 = "-[HidSensors indexForTempSensorKey:]";
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "<Error> %s: key not found", buf, 0xCu);
}

void sub_10005463C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000546B4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10005472C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000547A4(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100054810(uint64_t a1, int a2, os_log_t log)
{
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 1024;
  int v6 = a2;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "<Error> sensor: %@, xpc_object_t value = %d out of bounds", (uint8_t *)&v3, 0x12u);
}

void sub_100054898()
{
  sub_100012C60();
  sub_100012C1C((void *)&_mh_execute_header, v0, v1, "<Error> empty temperature sensor array", v2, v3, v4, v5, v6);
}

void sub_1000548CC()
{
  sub_100012C60();
  sub_100012C1C((void *)&_mh_execute_header, v0, v1, "<Error> empty filtered sensor set", v2, v3, v4, v5, v6);
}

void sub_100054900()
{
  sub_100012C60();
  sub_100012C1C((void *)&_mh_execute_header, v0, v1, "<Error> Could not discover all sensors in HID", v2, v3, v4, v5, v6);
}

void sub_100054934()
{
  sub_100012C60();
  sub_100012C1C((void *)&_mh_execute_header, v0, v1, "<Error> no HID client", v2, v3, v4, v5, v6);
}

void sub_100054968()
{
  sub_100012C60();
  sub_100012C1C((void *)&_mh_execute_header, v0, v1, "<Error> bad HID dict", v2, v3, v4, v5, v6);
}

void sub_10005499C(os_log_t log)
{
  v1[0] = 67109120;
  v1[1] = 5;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "<Error> no HID services (%d)", (uint8_t *)v1, 8u);
}

void sub_100054A1C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100054A54(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100054A8C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100054AC4(unsigned char *a1, unsigned char *a2)
{
  sub_100012C50(a1, a2);
  sub_1000156B8((void *)&_mh_execute_header, v2, v3, "<Error> Failed to find display params", v4);
}

void sub_100054AF0(unsigned char *a1, unsigned char *a2)
{
  sub_100012C50(a1, a2);
  sub_1000156B8((void *)&_mh_execute_header, v2, v3, "<Error> Failed to find nit params", v4);
}

void sub_100054B1C(unsigned char *a1, unsigned char *a2)
{
  sub_100012C50(a1, a2);
  sub_1000156B8((void *)&_mh_execute_header, v2, v3, "<Error> Failed to find nit values", v4);
}

void sub_100054B48(unsigned char *a1, unsigned char *a2)
{
  sub_100012C50(a1, a2);
  sub_1000156B8((void *)&_mh_execute_header, v2, v3, "<Error> Failed to find slider params", v4);
}

void sub_100054B74(unsigned char *a1, unsigned char *a2)
{
  sub_100012C50(a1, a2);
  sub_1000156B8((void *)&_mh_execute_header, v2, v3, "<Error> Failed to find slider values", v4);
}

void sub_100054BA0(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "<Error> brightness set %@ failed for Icon", (uint8_t *)&v2, 0xCu);
}

void sub_100054C18(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "<Error> brightness set %@ failed for Siri", (uint8_t *)&v2, 0xCu);
}

void sub_100054C90()
{
  int v0 = SCError();
  SCErrorString(v0);
  sub_100017B5C();
  sub_100017B3C((void *)&_mh_execute_header, v1, v2, "<Error> SCPreferencesCommitChanges() failed: %s", v3, v4, v5, v6, v7);
}

void sub_100054D0C()
{
  sub_100012C60();
  sub_100012C1C((void *)&_mh_execute_header, v0, v1, "<Error> notify_register_check(kSunlightState) failed", v2, v3, v4, v5, v6);
}

void sub_100054D40()
{
  sub_100012C60();
  sub_100012C1C((void *)&_mh_execute_header, v0, v1, "<Error> No ALS service", v2, v3, v4, v5, v6);
}

void sub_100054D74()
{
  sub_100012C60();
  sub_100012C1C((void *)&_mh_execute_header, v0, v1, "<Error> No ALS Event", v2, v3, v4, v5, v6);
}

void sub_100054DA8()
{
  sub_100012C60();
  sub_100012C1C((void *)&_mh_execute_header, v0, v1, "<Error> notify_set_state(thermalSunlightStateToken) failed", v2, v3, v4, v5, v6);
}

void sub_100054DDC(os_log_t log)
{
  v1[0] = 67109120;
  v1[1] = 4;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "<Error> no HID services (%d)", (uint8_t *)v1, 8u);
}

void sub_100054E5C()
{
  sub_100012C60();
  sub_100012C1C((void *)&_mh_execute_header, v0, v1, "<Error> notify_post(kOSThermalNotificationPressureLevelName) failed", v2, v3, v4, v5, v6);
}

void sub_100054E90()
{
  sub_100012C60();
  sub_100012C1C((void *)&_mh_execute_header, v0, v1, "<Error> notify_set_state(thermalPressureLevelToken) failed", v2, v3, v4, v5, v6);
}

void sub_100054EC4()
{
  sub_100012C60();
  sub_100012C1C((void *)&_mh_execute_header, v0, v1, "<Error> notify_register_check(com.apple.cltm.radioNotification) failed", v2, v3, v4, v5, v6);
}

void sub_100054EF8()
{
  sub_100012C60();
  sub_100012C1C((void *)&_mh_execute_header, v0, v1, "<Error> notify_register_check(com.apple.system.thermalmitigation) failed", v2, v3, v4, v5, v6);
}

void sub_100054F2C()
{
  sub_100012C60();
  sub_100012C1C((void *)&_mh_execute_header, v0, v1, "<Error> notify_register_check(com.apple.thermal.mitigationReasonCode) failed", v2, v3, v4, v5, v6);
}

void sub_100054F60()
{
  sub_100012C60();
  sub_100012C1C((void *)&_mh_execute_header, v0, v1, "<Error> notify_register_check(com.apple.thermal.timeToMitigate) failed", v2, v3, v4, v5, v6);
}

void sub_100054F94()
{
  sub_100012C60();
  sub_100012C1C((void *)&_mh_execute_header, v0, v1, "<Error> notify_register_check(kOSThermalNotificationPressureLevelName) failed", v2, v3, v4, v5, v6);
}

void sub_100054FC8()
{
  sub_100012C60();
  sub_100012C1C((void *)&_mh_execute_header, v0, v1, "<Error> notify_register_check(kOSThermalNotificationName) failed", v2, v3, v4, v5, v6);
}

void sub_100054FFC(uint8_t *buf, unsigned char *a2, os_log_t log)
{
  *long long buf = 0;
  *a2 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "<Error> notify_register_check failed", buf, 2u);
}

void sub_10005503C()
{
  sub_100012C60();
  sub_100012C1C((void *)&_mh_execute_header, v0, v1, "<Error> notify_register_check failed", v2, v3, v4, v5, v6);
}

void sub_100055070()
{
  sub_100012C60();
  sub_100012C1C((void *)&_mh_execute_header, v0, v1, "<Error> notify_set_state MaxToken failed", v2, v3, v4, v5, v6);
}

void sub_1000550A4()
{
  sub_100012C60();
  sub_100012C1C((void *)&_mh_execute_header, v0, v1, "<Error> notify_set_state failed", v2, v3, v4, v5, v6);
}

void sub_1000550D8()
{
  sub_100012C60();
  sub_100012C1C((void *)&_mh_execute_header, v0, v1, "<Error> notify_post(kOSThermalNotificationName) failed", v2, v3, v4, v5, v6);
}

void sub_10005510C()
{
  sub_100012C60();
  sub_100012C1C((void *)&_mh_execute_header, v0, v1, "<Error> notify_set_state(thermalStatusToken) failed", v2, v3, v4, v5, v6);
}

void sub_100055140()
{
  sub_100012C60();
  sub_100012C1C((void *)&_mh_execute_header, v0, v1, "<Error> notify_post(com.apple.cltm.radioNotification) failed", v2, v3, v4, v5, v6);
}

void sub_100055174()
{
  sub_100012C60();
  sub_100012C1C((void *)&_mh_execute_header, v0, v1, "<Error> notify_set_state(com.apple.cltm.radioNotification) failed", v2, v3, v4, v5, v6);
}

void sub_1000551A8()
{
  sub_100012C60();
  sub_100012C1C((void *)&_mh_execute_header, v0, v1, "<Error> notify_post(com.apple.thermal.mitigationReasonCode) failed", v2, v3, v4, v5, v6);
}

void sub_1000551DC()
{
  sub_100012C60();
  sub_100012C1C((void *)&_mh_execute_header, v0, v1, "<Error> notify_set_state(com.apple.thermal.mitigationReasonCode) failed", v2, v3, v4, v5, v6);
}

void sub_100055210()
{
  sub_100012C60();
  sub_100012C1C((void *)&_mh_execute_header, v0, v1, "<Error> notify_post(com.apple.thermal.timeToMitigate) failed", v2, v3, v4, v5, v6);
}

void sub_100055244()
{
  sub_100012C60();
  sub_100012C1C((void *)&_mh_execute_header, v0, v1, "<Error> notify_set_state(com.apple.thermal.timeToMitigate) failed", v2, v3, v4, v5, v6);
}

void sub_100055278()
{
  sub_100012C60();
  sub_100012C1C((void *)&_mh_execute_header, v0, v1, "<Error> notify_post(com.apple.system.thermalmitigation) failed", v2, v3, v4, v5, v6);
}

void sub_1000552AC()
{
  sub_100012C60();
  sub_100012C1C((void *)&_mh_execute_header, v0, v1, "<Error> notify_set_state(com.apple.system.thermalmitigation) failed", v2, v3, v4, v5, v6);
}

void sub_1000552E0()
{
  sub_100012C60();
  sub_100012C1C((void *)&_mh_execute_header, v0, v1, "<Error> Failed to get AppleCLPC service.", v2, v3, v4, v5, v6);
}

void sub_100055314()
{
  sub_100012C60();
  sub_100012C1C((void *)&_mh_execute_header, v0, v1, "<Error> CLPC Output Length is less than minimum size of incoming structs.", v2, v3, v4, v5, v6);
}

void sub_100055348()
{
  sub_100012C60();
  sub_100012C1C((void *)&_mh_execute_header, v0, v1, "<Error> Incorrect response ID from AppleCLPC", v2, v3, v4, v5, v6);
}

void sub_10005537C()
{
  sub_100012C60();
  sub_100012C1C((void *)&_mh_execute_header, v0, v1, "<Error> Failed to get GPU channels", v2, v3, v4, v5, v6);
}

void sub_1000553B0()
{
  sub_100012C60();
  sub_100012C1C((void *)&_mh_execute_header, v0, v1, "<Error> Mismatch between CLPC header struct length and response length.", v2, v3, v4, v5, v6);
}

void sub_1000553E4()
{
  sub_100012C60();
  sub_100012C1C((void *)&_mh_execute_header, v0, v1, "<Error> Failed to call AppleCLPC getSeedingInfo user client method.", v2, v3, v4, v5, v6);
}

void sub_100055418()
{
  sub_100012C60();
  sub_100012C1C((void *)&_mh_execute_header, v0, v1, "<Error> Failed to connect to AppleCLPC service. This is likely due to this device running Legacy CLPC.", v2, v3, v4, v5, v6);
}

void sub_10005544C()
{
  sub_100012C60();
  sub_100012C1C((void *)&_mh_execute_header, v0, v1, "<Error> Failed to GPU read sample", v2, v3, v4, v5, v6);
}

void sub_100055480(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000554F8(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100055530(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10005559C(int a1, NSObject *a2)
{
  uint64_t v2 = &byte_100085728[24 * a1];
  int v3 = *v2;
  uint64_t v4 = *((void *)v2 + 1);
  v5[0] = 67109634;
  v5[1] = v3;
  __int16 v6 = 1024;
  int v7 = a1;
  __int16 v8 = 2080;
  uint64_t v9 = v4;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "<Error> Cannot add mitigations for supported clientID: %u of mitigation type: %u (%s)", (uint8_t *)v5, 0x18u);
}

void sub_100055644(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000556B0()
{
  sub_10001D610(__stack_chk_guard);
  sub_10001D61C();
  sub_100012C6C((void *)&_mh_execute_header, v0, v1, "<Error> Unable to determine max power for clientID:%s", v2, v3, v4, v5, 2u);
}

void sub_100055728()
{
  sub_10001D610(__stack_chk_guard);
  sub_10001D61C();
  sub_100012C6C((void *)&_mh_execute_header, v0, v1, "<Error> Unable to determine min power for clientID:%s", v2, v3, v4, v5, 2u);
}

void sub_1000557A0()
{
  sub_10001D610(__stack_chk_guard);
  sub_10001D61C();
  int v3 = 134218242;
  uint64_t v4 = v0;
  __int16 v5 = 2080;
  uint64_t v6 = v1;
  _os_log_error_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_ERROR, "<Error> Client id: %llu is invalid for client name:%s", (uint8_t *)&v3, 0x16u);
}

void sub_100055834(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_10001D5F4((void *)&_mh_execute_header, a2, a3, "<Error> Unexpected return value 0x%08x\n", a5, a6, a7, a8, 0);
}

void sub_1000558A0(int a1, NSObject *a2)
{
  v2[0] = 67109376;
  v2[1] = 4;
  __int16 v3 = 1024;
  int v4 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "<Error> called with unexpected number of arguments. Expected %d, received %d\n", (uint8_t *)v2, 0xEu);
}

void sub_100055928()
{
  sub_10001D610(__stack_chk_guard);
  sub_10001D61C();
  int v3 = 136315394;
  uint64_t v4 = v0;
  __int16 v5 = 1024;
  int v6 = v1;
  _os_log_error_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_ERROR, "<Error> Could not get CPMS client state for clientID %s. Error code 0x%x", (uint8_t *)&v3, 0x12u);
}

void sub_1000559BC(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000559F4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100055A2C(int a1, NSObject *a2)
{
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "<Error> Unable to set the refresh rate %x", (uint8_t *)v2, 8u);
}

void sub_100055AA4(os_log_t log)
{
  *(_WORD *)int v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "<Error> sensor dispatcher indicating bad VT", v1, 2u);
}

void sub_100055AE8(os_log_t log)
{
  *(_WORD *)int v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "<Error> CC: Failed to find pmu power source", v1, 2u);
}

void sub_100055B2C(int a1, NSObject *a2)
{
  int v2 = 136315394;
  int v3 = "-[LinkChargerCC updateCloakingState:]";
  __int16 v4 = 1024;
  int v5 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "<Error> %s: IORegistryEntrySetCFProperties(0x%08x)\n", (uint8_t *)&v2, 0x12u);
}

void sub_100055BB8(os_log_t log)
{
  *(_WORD *)int v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "<Error> Error creating WiFiManager client", v1, 2u);
}

void sub_100055BFC(int a1, NSObject *a2)
{
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "<Error> Read a bad maxLI value from the WiFi Manager %d", (uint8_t *)v2, 8u);
}

void sub_100055C74(os_log_t log)
{
  *(_WORD *)int v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "<Error> getTGraphData: invalid key", v1, 2u);
}

void sub_100055CB8(os_log_t log)
{
  int v1 = 136315138;
  int v2 = "-[TGraphSampler genTGraphData]";
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "<Error> %s: could not create fieldValues array", (uint8_t *)&v1, 0xCu);
}

void sub_100055D3C(os_log_t log)
{
  *(_WORD *)int v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "<Error> Error in getting cpu statistics", v1, 2u);
}

void sub_100055D80(os_log_t log)
{
  int v1 = 136315138;
  int v2 = "-[CpuPiecewiseCC initWithParams:listID:needspowerZones:]";
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "<Error> %s: data array size mismatch", (uint8_t *)&v1, 0xCu);
}

void sub_100055E04(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100055E7C()
{
  sub_100012C60();
  sub_100012C1C((void *)&_mh_execute_header, v0, v1, "<Error> No fallback value found for mitigation threshold\n", v2, v3, v4, v5, v6);
}

void sub_100055EB0(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100055F28(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100055FA0(uint64_t *a1, NSObject *a2)
{
  uint64_t v2 = *a1;
  int v3 = 136315394;
  uint64_t v4 = "-[AgingController initWithParams:currentWRa:currentUPOCount:]";
  __int16 v5 = 1024;
  int v6 = v2;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "%s Mitigation State %d\n", (uint8_t *)&v3, 0x12u);
}

void sub_100056030(uint64_t a1)
{
  [objc_msgSend(*(id *)(*(void *)(*(void *)a1 + 8) + 40), "defaults") dictionaryRepresentation];
  sub_100026F74();
  _os_log_debug_impl(v1, v2, v3, v4, v5, 0x16u);
}

void sub_1000560D8(uint64_t a1, NSObject *a2)
{
  id v3 = [*(id *)(*(void *)(*(void *)a1 + 8) + 40) mitigationState];
  int v4 = 136315650;
  __int16 v5 = "-[AgingController initWithParams:currentWRa:currentUPOCount:]_block_invoke";
  __int16 v6 = 2048;
  uint64_t v7 = 1;
  __int16 v8 = 2048;
  id v9 = v3;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, " %s <Error> Inconsistent mitigation state. Expected %lu, found %lu\n", (uint8_t *)&v4, 0x20u);
}

void sub_100056190(int a1, NSObject *a2)
{
  int v2 = 136315394;
  id v3 = "-[AgingController takeActionOnUPO:forWRa:]";
  __int16 v4 = 1024;
  int v5 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "%s <Error> Weighted Ra %d is not a valid value. Returning early\n", (uint8_t *)&v2, 0x12u);
}

void sub_10005621C(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100056288(int *a1, int a2, os_log_t log)
{
  int v3 = *a1;
  v4[0] = 67109376;
  v4[1] = a2;
  __int16 v5 = 1024;
  int v6 = v3;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "Current WRa %d less than threshold %d. Skipping UPO\n", (uint8_t *)v4, 0xEu);
}

void sub_100056314(int a1, NSObject *a2)
{
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "Unchanged upo count %d. Skipping UPO\x10\x10.\n", (uint8_t *)v2, 8u);
}

void sub_10005638C(int a1, int a2, os_log_t log)
{
  v3[0] = 67109376;
  v3[1] = a1;
  __int16 v4 = 1024;
  int v5 = a2;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "<Error> Saved upo count %d > new UPO Count %d. Resetting state\n", (uint8_t *)v3, 0xEu);
}

void sub_100056414(void *a1)
{
  [a1 mitigationState];
  sub_100026F84();
  sub_100026F74();
  _os_log_debug_impl(v1, v2, v3, v4, v5, 0x12u);
}

void sub_1000564A0(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100056518(void *a1)
{
  [a1 mitigationState];
  sub_100026F84();
  sub_100026F74();
  _os_log_debug_impl(v1, v2, v3, v4, v5, 0x18u);
}

void sub_1000565B0()
{
  sub_100012C60();
  sub_100026F3C((void *)&_mh_execute_header, v0, v1, "Succeeded\n", v2, v3, v4, v5, v6);
}

void sub_1000565E4()
{
  sub_100012C60();
  sub_100012C1C((void *)&_mh_execute_header, v0, v1, "<Error> Setting PPM EnableBatteryAgingModel failed\n", v2, v3, v4, v5, v6);
}

void sub_100056618(int *a1, NSObject *a2)
{
  int v2 = *a1;
  v3[0] = 67109120;
  v3[1] = v2;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "Setting PPM property EnableBatteryAgingModel to %d\n", (uint8_t *)v3, 8u);
}

void sub_100056694()
{
  sub_100012C60();
  sub_100012C1C((void *)&_mh_execute_header, v0, v1, "<Error> Couldn't open PPM service\n", v2, v3, v4, v5, v6);
}

void sub_1000566C8()
{
  sub_100012C60();
  sub_100026F3C((void *)&_mh_execute_header, v0, v1, "Canceling connection", v2, v3, v4, v5, v6);
}

void sub_1000566FC()
{
  sub_100012C60();
  sub_100026F3C((void *)&_mh_execute_header, v0, v1, "Waiting for response", v2, v3, v4, v5, v6);
}

void sub_100056730(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000567A8()
{
  sub_100012C60();
  sub_100012C1C((void *)&_mh_execute_header, v0, v1, "<Error> Connection interrupted. Remote service exited prematurely\n", v2, v3, v4, v5, v6);
}

void sub_1000567DC()
{
  sub_100012C60();
  sub_100026F3C((void *)&_mh_execute_header, v0, v1, "Signalled semaphore\n", v2, v3, v4, v5, v6);
}

void sub_100056810(os_log_t log)
{
  int v1 = 136315138;
  uint64_t v2 = "-[ContextInPocket initWithParams:]";
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "<Error> %s: failed to create dispatch queue", (uint8_t *)&v1, 0xCu);
}

uint64_t sub_100056894()
{
  uint64_t v0 = abort_report_np();
  return sub_1000568BC(v0);
}

void sub_1000568BC(os_log_t log)
{
  *(_WORD *)int v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "<Error> LifetimeServoAFLUT cannot hold all data columns", v1, 2u);
}

void sub_100056900(uint8_t *buf, unsigned char *a2, os_log_t log)
{
  *long long buf = 0;
  *a2 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "<Error> LifetimeServoAFLUT data improperly sorted", buf, 2u);
}

void sub_100056940(os_log_t log)
{
  *(_WORD *)int v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "<Error> Required power parameters missing!", v1, 2u);
}

void sub_100056984(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000569BC(int *a1, NSObject *a2)
{
  int v2 = *a1;
  v3[0] = 67109120;
  v3[1] = v2;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "<Error> ArcPowerCC: Failed allocate NSNumber for %d", (uint8_t *)v3, 8u);
}

void sub_100056A38(int *a1, NSObject *a2)
{
  int v2 = *a1;
  v3[0] = 67109120;
  v3[1] = v2;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "<Error> ArcPowerCC: Failed to set the target to %d", (uint8_t *)v3, 8u);
}

void sub_100056AB4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100056AEC(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100056B24()
{
  sub_100012C60();
  sub_100012C1C((void *)&_mh_execute_header, v0, v1, "<Error> notify_register_check(kRadioThermalNotificationName) failed", v2, v3, v4, v5, v6);
}

void sub_100056B58()
{
  sub_100012C60();
  sub_100012C1C((void *)&_mh_execute_header, v0, v1, "<Error> Could not parse componentNameDetail", v2, v3, v4, v5, v6);
}

void sub_100056B8C()
{
  sub_100012C60();
  sub_100012C1C((void *)&_mh_execute_header, v0, v1, "<Error> notify_post(kRadioThermalNotificationName) failed", v2, v3, v4, v5, v6);
}

void sub_100056BC0()
{
  sub_100012C60();
  sub_100012C1C((void *)&_mh_execute_header, v0, v1, "<Error> notify_set_state(kRadioThermalNotificationName) failed", v2, v3, v4, v5, v6);
}

void sub_100056BF4(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "<Error> could not register for %@", (uint8_t *)&v2, 0xCu);
}

void sub_100056C6C()
{
  sub_100012C60();
  sub_100012C1C((void *)&_mh_execute_header, v0, v1, "<Error> CT connection failed", v2, v3, v4, v5, v6);
}

void sub_100056CA0(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "<Error> unknown CT notification: %@", (uint8_t *)&v2, 0xCu);
}

void sub_100056D18()
{
  sub_100012C60();
  sub_100012C1C((void *)&_mh_execute_header, v0, v1, "<Error> CT bad drop limit", v2, v3, v4, v5, v6);
}

void sub_100056D4C(int a1, int __errnum, NSObject *a3)
{
  if (a1 == 1) {
    uint64_t v4 = strerror(__errnum);
  }
  else {
    uint64_t v4 = mach_error_string(__errnum);
  }
  int v5 = 136315138;
  uint8_t v6 = v4;
  _os_log_error_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_ERROR, "<Error> CT max Tx power failed: %s", (uint8_t *)&v5, 0xCu);
}

void sub_100056DF0()
{
  sub_100012C60();
  sub_100012C1C((void *)&_mh_execute_header, v0, v1, "<Error> Should not be called from base class", v2, v3, v4, v5, v6);
}

void sub_100056E24(os_log_t log)
{
  int v1 = 136315138;
  uint64_t v2 = "-[SolarDetectorSemantic init]";
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "<Error> %s:: brightnessSystemClient nil", (uint8_t *)&v1, 0xCu);
}

void sub_100056EA8(os_log_t log)
{
  *(_WORD *)int v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "<Error> notify_register_check(kSunlightState) failed", v1, 2u);
}

void sub_100056EEC(os_log_t log)
{
  *(_WORD *)int v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "<Error> notify_set_state(thermalSunlightStateToken) failed", v1, 2u);
}

void sub_100056F30(char a1, NSObject *a2)
{
  v2[0] = 67109120;
  v2[1] = a1 & 1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "<Error> Could not create solar context (%d)", (uint8_t *)v2, 8u);
}

void sub_100056FAC(os_log_t log)
{
  *(_WORD *)int v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "<Error> Could not create pocket context", v1, 2u);
}

void sub_100056FF0(os_log_t log)
{
  *(_WORD *)int v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "<Error> Should not be using Default Action", v1, 2u);
}

void sub_100057034(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100057070(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000570AC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000570E8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100057124(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100057160(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10005719C()
{
  sub_100012C60();
  sub_100012C1C((void *)&_mh_execute_header, v0, v1, "<Error> Sensor TB1R index not set!", v2, v3, v4, v5, v6);
}

void sub_1000571D0()
{
  sub_100012C60();
  sub_100012C1C((void *)&_mh_execute_header, v0, v1, "<Error> Sensor TB0R index not set!", v2, v3, v4, v5, v6);
}

void sub_100057204()
{
  sub_100012C60();
  sub_100012C1C((void *)&_mh_execute_header, v0, v1, "<Error> Baseband not ready, when trying to query sensor info", v2, v3, v4, v5, v6);
}

void sub_100057238()
{
  sub_100012C60();
  sub_100012C1C((void *)&_mh_execute_header, v0, v1, "<Error> Failed to query the thermal IDs from the baseband", v2, v3, v4, v5, v6);
}

void sub_10005726C()
{
  sub_100012C60();
  sub_100012C1C((void *)&_mh_execute_header, v0, v1, "<Error> Failed obtain thermal sensor report from baseband", v2, v3, v4, v5, v6);
}

void sub_1000572A0(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "<Error> \n mutex init has failed\n", v1, 2u);
}

void sub_1000572E4(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "<Error> SMC connection not open", v1, 2u);
}

void sub_100057328(int a1, NSObject *a2)
{
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "<Error> Could not write sensor data. Error: 0x%x", (uint8_t *)v2, 8u);
}

void sub_1000573A0(int a1, NSObject *a2)
{
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "<Error> Couldn't connect to smc! error: 0x%x", (uint8_t *)v2, 8u);
}

void sub_100057418(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "<Error> Unable to find sensor group for key %@", (uint8_t *)&v2, 0xCu);
}

void sub_100057490()
{
  sub_1000314CC();
  sub_1000314E4((void *)&_mh_execute_header, v0, v1, "<Error> smcIndex:%d greater than allow numer of sensors for group:%u", v2, v3);
}

void sub_1000574F8()
{
  sub_1000314CC();
  sub_1000314E4((void *)&_mh_execute_header, v0, v1, "<Error> Invalid indices. cltmIndex:%d smcIndex:%d", v2, v3);
}

void sub_100057560()
{
  sub_100012C60();
  sub_100012C1C((void *)&_mh_execute_header, v0, v1, "<Error> could not find camera service", v2, v3, v4, v5, v6);
}

void sub_100057594(int a1, NSObject *a2)
{
  v2[0] = 67109376;
  v2[1] = dword_1000AA284;
  __int16 v3 = 1024;
  int v4 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "<Error> IOPMAssertionRelease(0x%08x) failed: %d", (uint8_t *)v2, 0xEu);
}

void sub_100057620(int *a1, int a2, os_log_t log)
{
  int v3 = *a1;
  v4[0] = 67109376;
  v4[1] = a2;
  __int16 v5 = 1024;
  int v6 = v3;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "<Error> Setting CTServerConnectionConfigMaxRadioPower Tech %d level %d\n", (uint8_t *)v4, 0xEu);
}

void sub_1000576AC(int a1, int __errnum)
{
  if (a1 == 1) {
    strerror(__errnum);
  }
  else {
    mach_error_string(__errnum);
  }
  sub_100017B5C();
  sub_100017B3C((void *)&_mh_execute_header, v2, v3, "<Error> CTServerConnectionConfigMaxRadioPower() failed: %s", v4, v5, v6, v7, v8);
}

void sub_10005773C()
{
  sub_100012C60();
  sub_100012C1C((void *)&_mh_execute_header, v0, v1, "<Error> notify_post(kOSThermalNotificationName) failed", v2, v3, v4, v5, v6);
}

void sub_100057770()
{
  sub_100012C60();
  sub_100012C1C((void *)&_mh_execute_header, v0, v1, "<Error> no TestCase Name", v2, v3, v4, v5, v6);
}

void sub_1000577A4()
{
  sub_100012C60();
  sub_100012C1C((void *)&_mh_execute_header, v0, v1, "<Error> no representation for tGraphLogFile", v2, v3, v4, v5, v6);
}

void sub_1000577D8()
{
  uint64_t v0 = __error();
  strerror(*v0);
  sub_100017B5C();
  sub_100017B3C((void *)&_mh_execute_header, v1, v2, "<Error> tGraph open: %s", v3, v4, v5, v6, v7);
}

void sub_100057858()
{
  uint64_t v0 = __error();
  strerror(*v0);
  sub_100017B5C();
  sub_100017B3C((void *)&_mh_execute_header, v1, v2, "<Error> tGraph fstat: %s", v3, v4, v5, v6, v7);
}

void sub_1000578D8()
{
  sub_100012C60();
  sub_100012C1C((void *)&_mh_execute_header, v0, v1, "<Error> could not create OSThermalStatus prefs.", v2, v3, v4, v5, v6);
}

void sub_10005790C()
{
  uint64_t v0 = __error();
  strerror(*v0);
  sub_100017B5C();
  sub_100017B3C((void *)&_mh_execute_header, v1, v2, "<Error> sysctlbyname(hw.model) failed: %s", v3, v4, v5, v6, v7);
}

void sub_10005798C()
{
  int v0 = SCError();
  SCErrorString(v0);
  sub_100017B5C();
  sub_100017B3C((void *)&_mh_execute_header, v1, v2, "<Error> SCPreferencesSetCallBack() failed: %s", v3, v4, v5, v6, v7);
}

void sub_100057A08()
{
  int v0 = SCError();
  SCErrorString(v0);
  sub_100017B5C();
  sub_100017B3C((void *)&_mh_execute_header, v1, v2, "<Error> SCPreferencesScheduleWithRunLoop() failed: %s", v3, v4, v5, v6, v7);
}

void sub_100057A84()
{
  sub_100012C60();
  sub_100012C1C((void *)&_mh_execute_header, v0, v1, "<Error> filterParams NULL", v2, v3, v4, v5, v6);
}

void sub_100057AB8()
{
  sub_100012C60();
  sub_100012C1C((void *)&_mh_execute_header, v0, v1, "<Error> Total Power Sensors > Allowed", v2, v3, v4, v5, v6);
}

void sub_100057AEC()
{
  sub_100012C60();
  sub_100012C1C((void *)&_mh_execute_header, v0, v1, "<Error> No sensors found", v2, v3, v4, v5, v6);
}

void sub_100057B20()
{
  sub_100012C60();
  sub_100012C1C((void *)&_mh_execute_header, v0, v1, "<Error> sensorCount > Allowed", v2, v3, v4, v5, v6);
}

void sub_100057B54()
{
  sub_100012C60();
  sub_100012C1C((void *)&_mh_execute_header, v0, v1, "<Error> could not register for system power notifications", v2, v3, v4, v5, v6);
}

void sub_100057B88(uint8_t *buf, unsigned char *a2, os_log_t log)
{
  *long long buf = 0;
  *a2 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "<Error> Failed SetLevel 10 times", buf, 2u);
}

void sub_100057BC8()
{
  sub_100012C60();
  sub_100012C1C((void *)&_mh_execute_header, v0, v1, "<Error> Unable to allocate memory for missing sensor string", v2, v3, v4, v5, v6);
}

void sub_100057BFC(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100057C68(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100057CD4(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100057D44()
{
  sub_100012C60();
  sub_100012C1C((void *)&_mh_execute_header, v0, v1, "<Error> tGraph write failed", v2, v3, v4, v5, v6);
}

void sub_100057D78()
{
  sub_100012C60();
  sub_100012C1C((void *)&_mh_execute_header, v0, v1, "<Error> could not get hidSensorKeys", v2, v3, v4, v5, v6);
}

void sub_100057DAC()
{
  sub_100012C60();
  sub_100012C1C((void *)&_mh_execute_header, v0, v1, "<Error> no sensor keys", v2, v3, v4, v5, v6);
}

void sub_100057DE0()
{
  sub_100012C60();
  sub_100012C1C((void *)&_mh_execute_header, v0, v1, "<Error> no canary key", v2, v3, v4, v5, v6);
}

void sub_100057E14(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100057E80()
{
  sub_100012C60();
  sub_100012C1C((void *)&_mh_execute_header, v0, v1, "<Error> FanCC: Could not open connection to PMP service", v2, v3, v4, v5, v6);
}

void sub_100057EB4()
{
  sub_100012C60();
  sub_100012C1C((void *)&_mh_execute_header, v0, v1, "<Error> FanCC: NULL PMPService", v2, v3, v4, v5, v6);
}

void sub_100057EE8()
{
  sub_100012C60();
  sub_100012C1C((void *)&_mh_execute_header, v0, v1, "<Error> FanCC: maxRPM key not defined in the fan controller", v2, v3, v4, v5, v6);
}

void sub_100057F1C()
{
  sub_100012C60();
  sub_100012C1C((void *)&_mh_execute_header, v0, v1, "<Error> FanCC: minRPM key not defined in the fan controller", v2, v3, v4, v5, v6);
}

void sub_100057F50()
{
  sub_100012C60();
  sub_100012C1C((void *)&_mh_execute_header, v0, v1, "<Error> FanCC: RPM cannot be negative", v2, v3, v4, v5, v6);
}

void sub_100057F84()
{
  sub_100012C60();
  sub_100012C1C((void *)&_mh_execute_header, v0, v1, "<Error> FanCC: failed to set fan RPM", v2, v3, v4, v5, v6);
}

void sub_100057FB8()
{
  sub_100012C60();
  sub_100012C1C((void *)&_mh_execute_header, v0, v1, "<Error> Could not find PMGR service", v2, v3, v4, v5, v6);
}

void sub_100057FEC()
{
  sub_100012C60();
  sub_100012C1C((void *)&_mh_execute_header, v0, v1, "<Error> Could not find CLPC service", v2, v3, v4, v5, v6);
}

void sub_100058020(const __CFString *a1)
{
  CFStringGetCStringPtr(a1, 0x8000100u);
  sub_100017B3C((void *)&_mh_execute_header, v1, v2, "<Error> Failed to read %s", v3, v4, v5, v6, 2u);
}

void sub_1000580A4()
{
  sub_100012C60();
  sub_100012C1C((void *)&_mh_execute_header, v0, v1, "<Error> No CLPC service!", v2, v3, v4, v5, v6);
}

void sub_1000580D8()
{
  CFStringGetCStringPtr(@"~pkg-power-split-cpu-fraction", 0x8000100u);
  sub_100017B3C((void *)&_mh_execute_header, v0, v1, "<Error> Failed to read %s", v2, v3, v4, v5, 2u);
}

void sub_100058164()
{
  sub_100012C60();
  sub_100012C1C((void *)&_mh_execute_header, v0, v1, "<Error> Cannot Get GPU Power", v2, v3, v4, v5, v6);
}

void sub_100058198(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100058210(int a1, NSObject *a2)
{
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "<Error> Could not set SGX Max power to %d\n", (uint8_t *)v2, 8u);
}

void sub_100058288()
{
  sub_100012C60();
  sub_100012C1C((void *)&_mh_execute_header, v0, v1, "<Error> clpc service not present when setting max power target!", v2, v3, v4, v5, v6);
}

double sub_1000582BC(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100012C6C((void *)&_mh_execute_header, a2, a3, "<Error> Could not set CPU Max power to %f\n", a5, a6, a7, a8, 0);
  return result;
}

double sub_100058334(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100012C6C((void *)&_mh_execute_header, a2, a3, "<Error> Could not set CPU low power target to %f\n", a5, a6, a7, a8, 0);
  return result;
}

void sub_1000583AC(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100058424(uint64_t a1, int *a2, os_log_t log)
{
  int v3 = *a2;
  int v4 = 138412546;
  uint64_t v5 = a1;
  __int16 v6 = 1024;
  int v7 = v3;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "<Error> Could not create number from %@ dithering level %d", (uint8_t *)&v4, 0x12u);
}

void sub_1000584B0(uint64_t a1, mach_error_t error_value, NSObject *a3)
{
  int v4 = 138412546;
  uint64_t v5 = a1;
  __int16 v6 = 2080;
  int v7 = mach_error_string(error_value);
  _os_log_error_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_ERROR, "<Error> Could not set %@ dithering level: %s", (uint8_t *)&v4, 0x16u);
}

void sub_100058550()
{
  sub_100037CA4();
  sub_100037CB8((void *)&_mh_execute_header, v0, v1, "<Error> Clamp: Ra thresholds %d above max %d", v2, v3, v4, v5, v6);
}

void sub_1000585C0()
{
  sub_100037CA4();
  sub_100037CB8((void *)&_mh_execute_header, v0, v1, "<Error> Clamp: charge thresholds %d above max %d", v2, v3, v4, v5, v6);
}

void sub_100058630()
{
  sub_100037CA4();
  sub_100037CB8((void *)&_mh_execute_header, v0, v1, "<Error> Clamp: temp thresholds %d above max %d", v2, v3, v4, v5, v6);
}

void sub_1000586A0()
{
  sub_100012C60();
  sub_100012C1C((void *)&_mh_execute_header, v0, v1, "<Error> Clamp: bad inputs", v2, v3, v4, v5, v6);
}

void sub_1000586D4()
{
  sub_100012C60();
  sub_100012C1C((void *)&_mh_execute_header, v0, v1, "<Error> Clamp: null array", v2, v3, v4, v5, v6);
}

void sub_100058708()
{
  sub_100012C60();
  sub_100012C1C((void *)&_mh_execute_header, v0, v1, "<Error> Clamp: bad array sorting", v2, v3, v4, v5, v6);
}

void sub_10005873C()
{
  sub_100012C60();
  sub_100012C1C((void *)&_mh_execute_header, v0, v1, "<Error> Clamp: bad element count", v2, v3, v4, v5, v6);
}

void sub_100058770()
{
  sub_100017B5C();
  sub_100012C6C((void *)&_mh_execute_header, v0, v1, "<Error> Could not get number value for %@", v2, v3, v4, v5, v6);
}

void sub_1000587D8()
{
  sub_100017B5C();
  sub_100012C6C((void *)&_mh_execute_header, v0, v1, "<Error> Could not get string value for %@", v2, v3, v4, v5, v6);
}

void sub_100058840()
{
  sub_100017B5C();
  sub_100012C6C((void *)&_mh_execute_header, v0, v1, "<Error> Could not replace dictionary value for %@", v2, v3, v4, v5, v6);
}

void sub_1000588A8()
{
  sub_100017B5C();
  sub_100012C6C((void *)&_mh_execute_header, v0, v1, "<Error> Could not set dictionary value for %@", v2, v3, v4, v5, v6);
}

void sub_100058910()
{
  sub_100017B5C();
  sub_100012C6C((void *)&_mh_execute_header, v0, v1, "<Error> could not find %@ property", v2, v3, v4, v5, v6);
}

void sub_100058978()
{
  sub_100017B5C();
  sub_100012C6C((void *)&_mh_execute_header, v0, v1, "<Error> %@ could not be converted to kCFNumberSInt32Type", v2, v3, v4, v5, v6);
}

void sub_1000589E0()
{
  sub_100017B5C();
  sub_100012C6C((void *)&_mh_execute_header, v0, v1, "<Error> %@ not a CFNumber", v2, v3, v4, v5, v6);
}

void sub_100058A48()
{
  sub_100017B5C();
  sub_100012C6C((void *)&_mh_execute_header, v0, v1, "<Error> %@ could not be converted to kCFNumberSInt64Type", v2, v3, v4, v5, v6);
}

void sub_100058AB0(void *a1, uint64_t a2, NSObject *a3)
{
  int v5 = 136315650;
  uint8_t v6 = "bytes_from_service";
  __int16 v7 = 2048;
  id v8 = [a1 length];
  __int16 v9 = 2048;
  uint64_t v10 = a2;
  _os_log_error_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_ERROR, "<Error> %s: data byte count (%zu) does not match expected (%zu)", (uint8_t *)&v5, 0x20u);
}

void sub_100058B5C()
{
  sub_100012C60();
  sub_100012C1C((void *)&_mh_execute_header, v0, v1, "<Error> could not connect to power management domain", v2, v3, v4, v5, v6);
}

void sub_100058B90()
{
  sub_100012C60();
  sub_100012C1C((void *)&_mh_execute_header, v0, v1, "<Error> could not sleep system", v2, v3, v4, v5, v6);
}

void sub_100058BC4()
{
  sub_100012C60();
  sub_100012C1C((void *)&_mh_execute_header, v0, v1, "<Error> could not create date for sleep timer", v2, v3, v4, v5, v6);
}

void sub_100058BF8()
{
  sub_100012C60();
  sub_100012C1C((void *)&_mh_execute_header, v0, v1, "<Error> could not schedule wakeup event", v2, v3, v4, v5, v6);
}

void sub_100058C2C()
{
  sub_100012C60();
  sub_100012C1C((void *)&_mh_execute_header, v0, v1, "<Error> could not cancel wakeup event", v2, v3, v4, v5, v6);
}

void sub_100058C60(const __CFString *a1)
{
  CFStringGetCStringPtr(a1, 0);
  sub_100017B5C();
  sub_10003A1E0((void *)&_mh_execute_header, v1, v2, "<Error> Sensor %s removed (%llx)", v3, v4, v5, v6, v7);
}

void sub_100058CF0()
{
  sub_100012C60();
  sub_100012C1C((void *)&_mh_execute_header, v0, v1, "<Error> service removal, no key", v2, v3, v4, v5, v6);
}

void sub_100058D24()
{
  sub_100012C60();
  sub_100012C1C((void *)&_mh_execute_header, v0, v1, "<Error> powerService NULL", v2, v3, v4, v5, v6);
}

void sub_100058D58()
{
  sub_100012C60();
  sub_100012C1C((void *)&_mh_execute_header, v0, v1, "<Error> batteryTemperatureRef NULL", v2, v3, v4, v5, v6);
}

void sub_100058D8C()
{
  sub_100012C60();
  sub_100012C1C((void *)&_mh_execute_header, v0, v1, "<Error> batteryRawCurrentCapacityRef NULL", v2, v3, v4, v5, v6);
}

void sub_100058DC0()
{
  sub_100012C60();
  sub_100012C1C((void *)&_mh_execute_header, v0, v1, "<Error> batteryRawMaxCapacityRef NULL", v2, v3, v4, v5, v6);
}

void sub_100058DF4()
{
  sub_100012C60();
  sub_100012C1C((void *)&_mh_execute_header, v0, v1, "<Error> batteryData NULL", v2, v3, v4, v5, v6);
}

void sub_100058E28()
{
  sub_100012C60();
  sub_100012C1C((void *)&_mh_execute_header, v0, v1, "<Error> nil key string\n", v2, v3, v4, v5, v6);
}

void sub_100058E5C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100058ED4()
{
  sub_100017B5C();
  sub_100012C6C((void *)&_mh_execute_header, v0, v1, "<Error> %@ NULL", v2, v3, v4, v5, v6);
}

void sub_100058F3C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100058FB4()
{
  sub_100012C60();
  sub_100012C1C((void *)&_mh_execute_header, v0, v1, "<Error> WeightedRa array NULL", v2, v3, v4, v5, v6);
}

void sub_100058FE8()
{
  sub_100012C60();
  sub_100012C1C((void *)&_mh_execute_header, v0, v1, "<Error> WeightedRa value NULL", v2, v3, v4, v5, v6);
}

void sub_10005901C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100059094()
{
  sub_100012C60();
  sub_100012C1C((void *)&_mh_execute_header, v0, v1, "<Error> batteryRaTable array NULL", v2, v3, v4, v5, v6);
}

void sub_1000590C8()
{
  sub_100012C60();
  sub_100012C1C((void *)&_mh_execute_header, v0, v1, "<Error> lifetimeData NULL", v2, v3, v4, v5, v6);
}

void sub_1000590FC()
{
  sub_100012C60();
  sub_100012C1C((void *)&_mh_execute_header, v0, v1, "<Error> Ra values both NULL", v2, v3, v4, v5, v6);
}

void sub_100059130(int a1, NSObject *a2)
{
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "<Error> batteryRaTableRawData bad size %d", (uint8_t *)v2, 8u);
}

void sub_1000591A8()
{
  sub_100012C60();
  sub_100012C1C((void *)&_mh_execute_header, v0, v1, "<Error> pmuService NULL", v2, v3, v4, v5, v6);
}

void sub_1000591DC()
{
  sub_100012C60();
  sub_100012C1C((void *)&_mh_execute_header, v0, v1, "<Error> batteryUPOCountRef NULL", v2, v3, v4, v5, v6);
}

void sub_100059210(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100059288()
{
  sub_100012C60();
  sub_100012C1C((void *)&_mh_execute_header, v0, v1, "<Error> Unable to get valid ScreenClass value", v2, v3, v4, v5, v6);
}

void sub_1000592BC(int a1, NSObject *a2)
{
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "<Error> Screen class: %d not determinate. defaulting to FALSE", (uint8_t *)v2, 8u);
}

void sub_100059334()
{
  sub_100017B5C();
  WORD2(v3) = 2080;
  HIWORD(v3) = v0;
  sub_10003A1A8((void *)&_mh_execute_header, v0, v1, "<Error> %s + %s length too long", v2, v3);
}

void sub_1000593A8(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100059420(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100059498(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100059510()
{
  sub_10003A1C8();
  sub_10003A1A8((void *)&_mh_execute_header, v0, v1, "<Error> service %p: no %@");
}

void sub_100059578()
{
  sub_10003A1C8();
  sub_10003A1A8((void *)&_mh_execute_header, v0, v1, "<Error> service %p: bad %@");
}

void sub_1000595E0(void *a1)
{
  [a1 lastPathComponent];
  sub_100017B5C();
  sub_10003A1E0((void *)&_mh_execute_header, v1, v2, "<Error> Error excluding %@ from backup %@", v3, v4, v5, v6, v7);
}

void sub_10005966C()
{
  sub_100012C60();
  sub_100012C1C((void *)&_mh_execute_header, v0, v1, "<Error> Could not set PPM property", v2, v3, v4, v5, v6);
}

void sub_1000596A0()
{
  sub_100012C60();
  sub_100012C1C((void *)&_mh_execute_header, v0, v1, "<Error> Failed to read ThermalProfile", v2, v3, v4, v5, v6);
}

void sub_1000596D4()
{
  sub_100012C60();
  sub_100012C1C((void *)&_mh_execute_header, v0, v1, "<Error> Failed to get Battery channels", v2, v3, v4, v5, v6);
}

void sub_100059708(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100059740(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100059778(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000597B0()
{
  sub_100012C60();
  sub_100012C1C((void *)&_mh_execute_header, v0, v1, "<Error> Clamp: notify_register_check failed (peak)", v2, v3, v4, v5, v6);
}

void sub_1000597E4()
{
  sub_100012C60();
  sub_100012C1C((void *)&_mh_execute_header, v0, v1, "<Error> Clamp: notify_register_check failed (cold)", v2, v3, v4, v5, v6);
}

void sub_100059818()
{
  sub_100012C60();
  sub_100012C1C((void *)&_mh_execute_header, v0, v1, "<Error> Clamp: no params", v2, v3, v4, v5, v6);
}

void sub_10005984C()
{
  sub_100012C60();
  sub_100012C1C((void *)&_mh_execute_header, v0, v1, "<Error> Clamp: no notification params", v2, v3, v4, v5, v6);
}

void sub_100059880()
{
  sub_100012C60();
  sub_100012C1C((void *)&_mh_execute_header, v0, v1, "<Error> Clamp: could not find charger service", v2, v3, v4, v5, v6);
}

void sub_1000598B4()
{
  sub_100012C60();
  sub_100012C1C((void *)&_mh_execute_header, v0, v1, "<Error> Clamp: could not find PPM service", v2, v3, v4, v5, v6);
}

void sub_1000598E8()
{
  sub_100012C60();
  sub_100012C1C((void *)&_mh_execute_header, v0, v1, "<Error> Clamp: could not find strobe service", v2, v3, v4, v5, v6);
}

void sub_10005991C()
{
  sub_100026F84();
  sub_10003EBB0((void *)&_mh_execute_header, v0, v1, "<Error> Failed to set state on notify string %s. status:%d\n", v2, v3, v4, v5, 2u);
}

void sub_100059990()
{
  sub_100026F84();
  sub_10003EBB0((void *)&_mh_execute_header, v0, v1, "<Error> Failed to create notify token for %s. status:%d\n", v2, v3, v4, v5, 2u);
}

void sub_100059A04()
{
  sub_100026F84();
  sub_10003EBB0((void *)&_mh_execute_header, v0, v1, "<Error> Failed to set state on notify string %s. status:%d\n", v2, v3, v4, v5, 2u);
}

void sub_100059A78()
{
  sub_100026F84();
  sub_10003EBB0((void *)&_mh_execute_header, v0, v1, "<Error> Failed to create notify token for %s. status:%d\n", v2, v3, v4, v5, 2u);
}

void sub_100059AEC(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100059B58(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100059BC4(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100059C30()
{
  sub_100012C60();
  sub_100012C1C((void *)&_mh_execute_header, v0, v1, "<Error> Clamp: set max strobe failed", v2, v3, v4, v5, v6);
}

void sub_100059C64()
{
  sub_100012C60();
  sub_100012C1C((void *)&_mh_execute_header, v0, v1, "<Error> Clamp: notify_post failed", v2, v3, v4, v5, v6);
}

void sub_100059C98()
{
  sub_100012C60();
  sub_100012C1C((void *)&_mh_execute_header, v0, v1, "<Error> Clamp: notify_set_state failed", v2, v3, v4, v5, v6);
}

void sub_100059CCC(uint64_t a1, NSObject *a2)
{
  int v2 = 134217984;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "<Error> Clamp: unexpected cold state %lld", (uint8_t *)&v2, 0xCu);
}

void sub_100059D44(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100059D7C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100059DB4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100059DEC(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "<Error> No properties available for endpoint: %@", (uint8_t *)&v2, 0xCu);
}

void sub_100059E64()
{
  sub_100012C60();
  sub_100012C1C((void *)&_mh_execute_header, v0, v1, "<Error> No backlight power level table defined!", v2, v3, v4, v5, v6);
}

void sub_100059E98()
{
  sub_100012C60();
  sub_100012C1C((void *)&_mh_execute_header, v0, v1, "<Error> brightness client nil", v2, v3, v4, v5, v6);
}

void sub_100059ECC()
{
  sub_100012C60();
  sub_100012C1C((void *)&_mh_execute_header, v0, v1, "<Error> Failed to find display power source", v2, v3, v4, v5, v6);
}

void sub_100059F00(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "<Error> brightness set %@ failed", (uint8_t *)&v2, 0xCu);
}

void sub_100059F78()
{
  sub_100012C60();
  sub_100012C1C((void *)&_mh_execute_header, v0, v1, "<Error> Power level array is invalid! Using default values", v2, v3, v4, v5, v6);
}

void sub_100059FAC()
{
  sub_100012C60();
  sub_100012C1C((void *)&_mh_execute_header, v0, v1, "<Error> Should not call base findBacklightServices method", v2, v3, v4, v5, v6);
}

void sub_100059FE0()
{
  sub_100012C60();
  sub_100012C1C((void *)&_mh_execute_header, v0, v1, "<Error> Failed to get display IOReporting channels", v2, v3, v4, v5, v6);
}

void sub_10005A014(int a1, NSObject *a2)
{
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "<Error> IOMFB Failure: 0x%x", (uint8_t *)v2, 8u);
}

void sub_10005A08C()
{
  sub_100012C60();
  sub_100012C1C((void *)&_mh_execute_header, v0, v1, "<Error> Failed to display read sample", v2, v3, v4, v5, v6);
}

void sub_10005A0C0()
{
  sub_100012C60();
  sub_100012C1C((void *)&_mh_execute_header, v0, v1, "<Error> Failed to find display params", v2, v3, v4, v5, v6);
}

void sub_10005A0F4()
{
  sub_100012C60();
  sub_100012C1C((void *)&_mh_execute_header, v0, v1, "<Error> Failed to find nit params", v2, v3, v4, v5, v6);
}

void sub_10005A128()
{
  sub_100012C60();
  sub_100012C1C((void *)&_mh_execute_header, v0, v1, "<Error> Failed to find nit values", v2, v3, v4, v5, v6);
}

void sub_10005A15C()
{
  sub_100012C60();
  sub_100012C1C((void *)&_mh_execute_header, v0, v1, "<Error> Failed to find slider params", v2, v3, v4, v5, v6);
}

void sub_10005A190()
{
  sub_100012C60();
  sub_100012C1C((void *)&_mh_execute_header, v0, v1, "<Error> Failed to find slider values", v2, v3, v4, v5, v6);
}

void sub_10005A1C4(void *a1)
{
  [a1 nameofComponent];
  sub_100017B3C((void *)&_mh_execute_header, v1, v2, "<Error> No detail string available for %@", v3, v4, v5, v6, 2u);
}

void sub_10005A240(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3 = 134218242;
  uint64_t v4 = a2;
  __int16 v5 = 2112;
  uint64_t v6 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "<Error> Invalid detail string length (%llu) for detail string: %@", (uint8_t *)&v3, 0x16u);
}

void sub_10005A2C8(void *a1)
{
  [a1 nameofComponent];
  sub_100017B3C((void *)&_mh_execute_header, v1, v2, "<Error> Should not be using Default Action in %@, will retry", v3, v4, v5, v6, 2u);
}

void sub_10005A344(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "<Error> Arc control: set gain failed", v1, 2u);
}

void sub_10005A388(os_log_t log, double a2)
{
  int v2 = 134217984;
  double v3 = a2;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "<Error> Invalid haptic gain value: %f", (uint8_t *)&v2, 0xCu);
}

void sub_10005A404()
{
  sub_10004A174();
  sub_10003A1A8((void *)&_mh_execute_header, v0, v1, "<Error> Failed to write to file %@ err:%@");
}

void sub_10005A470()
{
  sub_10004A174();
  sub_10003A1A8((void *)&_mh_execute_header, v0, v1, "<Error> Failed to read from file %@. err:%@");
}

void sub_10005A4DC()
{
  sub_100017B5C();
  sub_100012C6C((void *)&_mh_execute_header, v0, v1, "<Error> Unexpected data format in file %@", v2, v3, v4, v5, v6);
}

void sub_10005A544()
{
  sub_100017B5C();
  sub_100012C6C((void *)&_mh_execute_header, v0, v1, "<Error> Detected unexpected file at %@", v2, v3, v4, v5, v6);
}

void sub_10005A5AC(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10005A61C(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10005A68C()
{
  sub_10004A198();
  sub_10001D5F4((void *)&_mh_execute_header, v0, v1, "<Error> Failed to get system UUID. rc:%d", v2, v3, v4, v5, v6);
}

void sub_10005A6F4()
{
  sub_100012C60();
  sub_100012C1C((void *)&_mh_execute_header, v0, v1, "<Error> LifetimeServoStatePersistence init failed\n", v2, v3, v4, v5, v6);
}

void sub_10005A728()
{
  sub_100012C60();
  sub_100012C1C((void *)&_mh_execute_header, v0, v1, "<Error> Failed to create filer", v2, v3, v4, v5, v6);
}

void sub_10005A75C()
{
  sub_100012C60();
  sub_100012C1C((void *)&_mh_execute_header, v0, v1, "<Error> LSController: NULL queue", v2, v3, v4, v5, v6);
}

void sub_10005A790()
{
  sub_100012C60();
  sub_100012C1C((void *)&_mh_execute_header, v0, v1, "<Error> Failed to get updated LTS state\n", v2, v3, v4, v5, v6);
}

void sub_10005A7C4()
{
  sub_100017B5C();
  sub_100012C6C((void *)&_mh_execute_header, v0, v1, "<Error> LSController: unknown override %@", v2, v3, v4, v5, v6);
}

void sub_10005A82C()
{
  sub_100012C60();
  sub_100012C1C((void *)&_mh_execute_header, v0, v1, "<Error> Failed to save LTS data to file", v2, v3, v4, v5, v6);
}

void sub_10005A860()
{
  sub_100012C60();
  sub_100012C1C((void *)&_mh_execute_header, v0, v1, "<Error> Failed to save counter\n", v2, v3, v4, v5, v6);
}

void sub_10005A894()
{
  sub_1000314CC();
  sub_1000314E4((void *)&_mh_execute_header, v0, v1, "<Error> Failed to create key for die %u loop %u\n", v2, v3);
}

void sub_10005A8FC()
{
  sub_100012C60();
  sub_100012C1C((void *)&_mh_execute_header, v0, v1, "<Error> Failed to save loop count\n", v2, v3, v4, v5, v6);
}

void sub_10005A930()
{
  sub_100012C60();
  sub_100012C1C((void *)&_mh_execute_header, v0, v1, "<Error> Failed to save die count\n", v2, v3, v4, v5, v6);
}

void sub_10005A964()
{
  sub_100012C60();
  sub_100012C1C((void *)&_mh_execute_header, v0, v1, "<Error> Failed to save version\n", v2, v3, v4, v5, v6);
}

void sub_10005A998()
{
  sub_100012C60();
  sub_100012C1C((void *)&_mh_execute_header, v0, v1, "<Error> ERROR: readNVRAM requested on non-NVRAM supported device!", v2, v3, v4, v5, v6);
}

void sub_10005A9CC()
{
  sub_100012C60();
  sub_100012C1C((void *)&_mh_execute_header, v0, v1, "<Error> ERROR: readNVRAM requested but path to NVRAM does not exist!", v2, v3, v4, v5, v6);
}

void sub_10005AA00()
{
  sub_100012C60();
  sub_100012C1C((void *)&_mh_execute_header, v0, v1, "<Error> readNVRAM: Failed to read LTS State from NVRam", v2, v3, v4, v5, v6);
}

void sub_10005AA34()
{
  sub_100012C60();
  sub_100012C1C((void *)&_mh_execute_header, v0, v1, "<Error> ERROR: readNVRAM Could not create LTS State Common struct copy", v2, v3, v4, v5, v6);
}

void sub_10005AA68()
{
  sub_100012C60();
  sub_100012C1C((void *)&_mh_execute_header, v0, v1, "<Error> ERROR: readNVRAM Could not create LTS State IS copy", v2, v3, v4, v5, v6);
}

void sub_10005AA9C()
{
  sub_100012C60();
  sub_100012C1C((void *)&_mh_execute_header, v0, v1, "<Error> ERROR: readNVRAM Could not create LTS State IS Rev copy", v2, v3, v4, v5, v6);
}

void sub_10005AAD0()
{
  sub_100012C60();
  sub_100012C1C((void *)&_mh_execute_header, v0, v1, "<Error> ERROR: nvramUpgradeStateV3 requested on non-NVRAM supported device", v2, v3, v4, v5, v6);
}

void sub_10005AB04()
{
  sub_100012C60();
  sub_100012C1C((void *)&_mh_execute_header, v0, v1, "<Error> ERROR: nvramUpgradeStateV3 Could not create LTS State IS Rev copy", v2, v3, v4, v5, v6);
}

void sub_10005AB38()
{
  sub_100012C60();
  sub_100012C1C((void *)&_mh_execute_header, v0, v1, "<Error> ERROR: getNVRAMVer requested on non-NVRAM supported device", v2, v3, v4, v5, v6);
}

void sub_10005AB6C()
{
  sub_100012C60();
  sub_100012C1C((void *)&_mh_execute_header, v0, v1, "<Error> ERROR: getNVRAMCounter requested on non-NVRAM supported device", v2, v3, v4, v5, v6);
}

void sub_10005ABA0()
{
  sub_100012C60();
  sub_100012C1C((void *)&_mh_execute_header, v0, v1, "<Error> ERROR: nvramDataValid requested on non-NVRAM supported device", v2, v3, v4, v5, v6);
}

void sub_10005ABD4()
{
  sub_100012C60();
  sub_100012C1C((void *)&_mh_execute_header, v0, v1, "<Error> initializeLTSPersistence: Failed to update persistence files!", v2, v3, v4, v5, v6);
}

void sub_10005AC08()
{
  sub_100012C60();
  sub_100012C1C((void *)&_mh_execute_header, v0, v1, "<Error> initializeLTSPersistence: Failed to reset Persistence Counter", v2, v3, v4, v5, v6);
}

void sub_10005AC3C()
{
  sub_10004A198();
  sub_10001D5F4((void *)&_mh_execute_header, v0, v1, "<Error> Unknown Persistence version %d! Will revert to current supported version", v2, v3, v4, v5, v6);
}

void sub_10005ACA4()
{
  sub_100012C60();
  sub_100012C1C((void *)&_mh_execute_header, v0, v1, "<Error> Failed to read loop count from persistant LTS Stats", v2, v3, v4, v5, v6);
}

void sub_10005ACD8()
{
  sub_100012C60();
  sub_100012C1C((void *)&_mh_execute_header, v0, v1, "<Error> Failed to read die count from persistant LTS Stats", v2, v3, v4, v5, v6);
}

void sub_10005AD0C()
{
  sub_100012C60();
  sub_100012C1C((void *)&_mh_execute_header, v0, v1, "<Error> LSController: cannot find path to persistant storage", v2, v3, v4, v5, v6);
}

void sub_10005AD40()
{
  sub_100017B5C();
  sub_100012C6C((void *)&_mh_execute_header, v0, v1, "<Error> Failed to get path to srvo folder. resp:%ld", v2, v3, v4, v5, v6);
}

void sub_10005ADA8()
{
  sub_100012C60();
  sub_100012C1C((void *)&_mh_execute_header, v0, v1, "<Error> Failed to create NVRam persistence path", v2, v3, v4, v5, v6);
}

void sub_10005ADDC()
{
  sub_100012C60();
  sub_100012C1C((void *)&_mh_execute_header, v0, v1, "<Error> NVRam persistence path is null", v2, v3, v4, v5, v6);
}

void sub_10005AE10(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10005AE88()
{
  sub_100012C60();
  sub_100012C1C((void *)&_mh_execute_header, v0, v1, "<Error> Persistent NVRAM  missing!", v2, v3, v4, v5, v6);
}

void sub_10005AEBC()
{
  sub_100012C60();
  sub_100012C1C((void *)&_mh_execute_header, v0, v1, "<Error> Persistent data is corrupted\n", v2, v3, v4, v5, v6);
}

void sub_10005AEF0()
{
  sub_100012C60();
  sub_100012C1C((void *)&_mh_execute_header, v0, v1, "<Error> Failed to write persistent data\n", v2, v3, v4, v5, v6);
}

void sub_10005AF24(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10005AF9C()
{
  sub_100017B5C();
  sub_100012C6C((void *)&_mh_execute_header, v0, v1, "<Error> Failed to read key %@", v2, v3, v4, v5, v6);
}

void sub_10005B004(const __CFData *a1, uint64_t a2, NSObject *a3)
{
  CFDataGetLength(a1);
  sub_100017B5C();
  __int16 v6 = 2112;
  uint64_t v7 = a2;
  _os_log_error_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_ERROR, "<Error> Unexpected data size %ld bytes for key %@\n", v5, 0x16u);
}

void sub_10005B09C()
{
  sub_100017B5C();
  sub_100012C6C((void *)&_mh_execute_header, v0, v1, "<Error> Unexpected data type for key %@\n", v2, v3, v4, v5, v6);
}

void sub_10005B104()
{
  sub_100017B5C();
  sub_100012C6C((void *)&_mh_execute_header, v0, v1, "<Error> Failed to send data for key %@ to PMP", v2, v3, v4, v5, v6);
}

void sub_10005B16C()
{
  sub_100012C60();
  sub_100012C1C((void *)&_mh_execute_header, v0, v1, "<Error> Failed to allocate memory for integrator State\n", v2, v3, v4, v5, v6);
}

void sub_10005B1A0()
{
  sub_100012C60();
  sub_100012C1C((void *)&_mh_execute_header, v0, v1, "<Error> Failed to allocate memory for integrator State Revision\n", v2, v3, v4, v5, v6);
}

void sub_10005B1D4()
{
  sub_1000314CC();
  sub_1000314E4((void *)&_mh_execute_header, v0, v1, "<Error> Failed to create revision key for die %u loop %u\n", v2, v3);
}

void sub_10005B23C()
{
  sub_100012C60();
  sub_100012C1C((void *)&_mh_execute_header, v0, v1, "<Error> Failed to read die count for registry\n", v2, v3, v4, v5, v6);
}

void sub_10005B270()
{
  sub_100012C60();
  sub_100012C1C((void *)&_mh_execute_header, v0, v1, "<Error> Failed to read loop count for registry\n", v2, v3, v4, v5, v6);
}

void sub_10005B2A4()
{
  sub_100012C60();
  sub_100012C1C((void *)&_mh_execute_header, v0, v1, "<Error> Failed to update! Cleaning up ltsStateData", v2, v3, v4, v5, v6);
}

void sub_10005B2D8()
{
  sub_100012C60();
  sub_100012C1C((void *)&_mh_execute_header, v0, v1, "<Error> Failed to allocate memory for ltsStateV3 struct\n", v2, v3, v4, v5, v6);
}

void sub_10005B30C()
{
  sub_100012C60();
  sub_100012C1C((void *)&_mh_execute_header, v0, v1, "<Error> Failed to allocate memory for ltsStateCommon struct\n", v2, v3, v4, v5, v6);
}

void sub_10005B340()
{
  sub_100012C60();
  sub_100012C1C((void *)&_mh_execute_header, v0, v1, "<Error> Failed to update LTS Integrator State Revision!\n", v2, v3, v4, v5, v6);
}

void sub_10005B374()
{
  sub_100012C60();
  sub_100012C1C((void *)&_mh_execute_header, v0, v1, "<Error> Failed to update LTS Integrator State!\n", v2, v3, v4, v5, v6);
}

void sub_10005B3A8()
{
  sub_100012C60();
  sub_100012C1C((void *)&_mh_execute_header, v0, v1, "<Error> ERROR: Persistence LTS Counter uninitialized after reset.", v2, v3, v4, v5, v6);
}

void sub_10005B3DC()
{
  sub_100012C60();
  sub_100012C1C((void *)&_mh_execute_header, v0, v1, "<Error> Failed to update the LTS State Common Struct from PMP\n", v2, v3, v4, v5, v6);
}

void sub_10005B410()
{
  sub_100012C60();
  sub_100012C1C((void *)&_mh_execute_header, v0, v1, "<Error> Failed saving LTS state to NVRam", v2, v3, v4, v5, v6);
}

void sub_10005B444()
{
  sub_100012C60();
  sub_100012C1C((void *)&_mh_execute_header, v0, v1, "<Error> updatePersistenceLTSState: Failed to get updated LTS state", v2, v3, v4, v5, v6);
}

void sub_10005B478()
{
  sub_100012C60();
  sub_100012C1C((void *)&_mh_execute_header, v0, v1, "<Error> LSControlLoop: nil params", v2, v3, v4, v5, v6);
}

void sub_10005B4AC()
{
  sub_10004A15C();
  __int16 v3 = v0;
  int v4 = 16;
  _os_log_error_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_ERROR, "<Error> LSControlLoop %d: perf state count %d, max %d", v2, 0x14u);
}

void sub_10005B534()
{
  sub_10004A18C();
  sub_10001D5F4((void *)&_mh_execute_header, v0, v1, "<Error> LSControlLoop %d: target params out of order", v2, v3, v4, v5, v6);
}

void sub_10005B5A0()
{
  sub_10004A198();
  sub_10001D5F4((void *)&_mh_execute_header, v0, v1, "<Error> LSControlLoop %d: unknown type", v2, v3, v4, v5, v6);
}

void sub_10005B608()
{
  sub_10004A18C();
  sub_10001D5F4((void *)&_mh_execute_header, v0, v1, "<Error> LSControlLoop %d: NULL keysToFetch", v2, v3, v4, v5, v6);
}

void sub_10005B674()
{
  sub_10004A18C();
  sub_10001D5F4((void *)&_mh_execute_header, v0, v1, "<Error> LSControlLoop %d: NULL persistedState", v2, v3, v4, v5, v6);
}

void sub_10005B6E0()
{
  sub_10004A12C(__stack_chk_guard);
  sub_10004A114();
  sub_10004A0F4((void *)&_mh_execute_header, v0, v1, "<Error> LSControlLoop %d: NULL key %@");
}

void sub_10005B748()
{
  sub_10004A18C();
  sub_10001D5F4((void *)&_mh_execute_header, v0, v1, "<Error> LSControlLoop %d: NULL keysToSet", v2, v3, v4, v5, v6);
}

void sub_10005B7B4()
{
  sub_10004A15C();
  sub_1000314E4((void *)&_mh_execute_header, v0, v1, "<Error> LSControlLoop %d: no voltage for state %d residency", v2, v3);
}

void sub_10005B820()
{
  sub_100012C60();
  sub_100012C1C((void *)&_mh_execute_header, v0, v1, "<Error> LSController: NULL queue", v2, v3, v4, v5, v6);
}

void sub_10005B854()
{
  sub_10004A198();
  sub_10001D5F4((void *)&_mh_execute_header, v0, v1, "<Error> LSController: bad variant %d", v2, v3, v4, v5, v6);
}

void sub_10005B8BC()
{
  sub_100012C60();
  sub_100012C1C((void *)&_mh_execute_header, v0, v1, "<Error> Failed to create persistence folder.", v2, v3, v4, v5, v6);
}

void sub_10005B8F0()
{
  sub_100012C60();
  sub_100012C1C((void *)&_mh_execute_header, v0, v1, "<Error> LSController: could not init sleep time", v2, v3, v4, v5, v6);
}

void sub_10005B924()
{
  sub_100012C60();
  sub_100012C1C((void *)&_mh_execute_header, v0, v1, "<Error> LSController: NULL _gpuDieTempCtlService", v2, v3, v4, v5, v6);
}

void sub_10005B958()
{
  sub_100012C60();
  sub_100012C1C((void *)&_mh_execute_header, v0, v1, "<Error> LSController: NULL _cpuDieTempCtlService", v2, v3, v4, v5, v6);
}

void sub_10005B98C()
{
  sub_100017B5C();
  WORD2(v3) = 2048;
  HIWORD(v3) = v0;
  sub_10003A1A8((void *)&_mh_execute_header, v0, v1, "<Error> LSController: NULL dict for %s (ID %lld)", v2, v3);
}

void sub_10005BA00()
{
  sub_100012C60();
  sub_100012C1C((void *)&_mh_execute_header, v0, v1, "<Error> LSController: no CPU channels", v2, v3, v4, v5, v6);
}

void sub_10005BA34()
{
  sub_100012C60();
  sub_100012C1C((void *)&_mh_execute_header, v0, v1, "<Error> LSController: NULL CPU subscription", v2, v3, v4, v5, v6);
}

void sub_10005BA68()
{
  sub_100012C60();
  sub_100012C1C((void *)&_mh_execute_header, v0, v1, "<Error> LSController: no GPU channels", v2, v3, v4, v5, v6);
}

void sub_10005BA9C()
{
  sub_100012C60();
  sub_100012C1C((void *)&_mh_execute_header, v0, v1, "<Error> LSController: NULL GPU subscriptionL", v2, v3, v4, v5, v6);
}

void sub_10005BAD0()
{
  sub_100017B5C();
  sub_100012C6C((void *)&_mh_execute_header, v0, v1, "<Error> LSController: couldn't create path for %s", v2, v3, v4, v5, v6);
}

void sub_10005BB38()
{
  sub_100017B5C();
  sub_100012C6C((void *)&_mh_execute_header, v0, v1, "<Error> LSController: path too long for %s", v2, v3, v4, v5, v6);
}

void sub_10005BBA0()
{
  sub_100017B5C();
  sub_100012C6C((void *)&_mh_execute_header, v0, v1, "<Error> LSController: no ioreg entry for %s", v2, v3, v4, v5, v6);
}

void sub_10005BC08()
{
  sub_100017B5C();
  sub_100012C6C((void *)&_mh_execute_header, v0, v1, "<Error> LSController: NULL voltageData for %@", v2, v3, v4, v5, v6);
}

void sub_10005BC70()
{
  sub_1000314CC();
  sub_1000314E4((void *)&_mh_execute_header, v0, v1, "<Error> LSController: %d perf states, %d max", v2, v3);
}

void sub_10005BCD8()
{
  sub_100012C60();
  sub_100012C1C((void *)&_mh_execute_header, v0, v1, "<Error> LSController: NULL service", v2, v3, v4, v5, v6);
}

void sub_10005BD0C()
{
  sub_100012C60();
  sub_100012C1C((void *)&_mh_execute_header, v0, v1, "<Error> LSController: could not create number", v2, v3, v4, v5, v6);
}

void sub_10005BD40()
{
  sub_100017B5C();
  sub_10004A0F4((void *)&_mh_execute_header, v0, v1, "<Error> LSController: setting %@ returned %x");
}

void sub_10005BDB4()
{
  sub_10004A140();
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "<Error> LSController: %d CPU perf states, %d max", v1, 0xEu);
}

void sub_10005BE28()
{
  sub_10004A140();
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "<Error> LSController: %d GPU perf states, %d max", v1, 0xEu);
}

void sub_10005BE9C()
{
  sub_100012C60();
  sub_100012C1C((void *)&_mh_execute_header, v0, v1, "<Error> LSController: could not update time", v2, v3, v4, v5, v6);
}

void sub_10005BED0()
{
  sub_100012C60();
  sub_100012C1C((void *)&_mh_execute_header, v0, v1, "<Error> LSController: retrograde update", v2, v3, v4, v5, v6);
}

void sub_10005BF04()
{
  sub_100012C60();
  sub_100012C1C((void *)&_mh_execute_header, v0, v1, "<Error> LSController: could not update sleep time", v2, v3, v4, v5, v6);
}

void sub_10005BF38()
{
  sub_100012C60();
  sub_100012C1C((void *)&_mh_execute_header, v0, v1, "<Error> PowerSourceCC: misformed table", v2, v3, v4, v5, v6);
}

void sub_10005BF6C()
{
  sub_100012C60();
  sub_100012C1C((void *)&_mh_execute_header, v0, v1, "<Error> CC: Failed to find pmu power source", v2, v3, v4, v5, v6);
}

void sub_10005BFA0()
{
  sub_100012C60();
  sub_100012C1C((void *)&_mh_execute_header, v0, v1, "<Error> pmuPowerService is NULL!", v2, v3, v4, v5, v6);
}

void sub_10005BFD4(int *a1, NSObject *a2)
{
  int v2 = *a1;
  v3[0] = 67109120;
  v3[1] = v2;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "<Error> Could not create number from charge rate index %d", (uint8_t *)v3, 8u);
}

void sub_10005C050()
{
  sub_100012C60();
  sub_100012C1C((void *)&_mh_execute_header, v0, v1, "<Error> Could not set charge rate index", v2, v3, v4, v5, v6);
}

void sub_10005C084(os_log_t log, float a2)
{
  int v2 = 134217984;
  double v3 = a2;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "<Error> Invalid speaker gain: %f", (uint8_t *)&v2, 0xCu);
}

void sub_10005C104(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "<Error> SpeakerCC: setSpeakerThermalGain failed", v1, 2u);
}

void sub_10005C148(os_log_t log, double a2)
{
  int v2 = 134217984;
  double v3 = a2;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "<Error> Invalid speaker gain value: %f", (uint8_t *)&v2, 0xCu);
}

void sub_10005C1C4()
{
  sub_100012C60();
  sub_100012C1C((void *)&_mh_execute_header, v0, v1, "<Error> Could not find Arc control parameters", v2, v3, v4, v5, v6);
}

void sub_10005C1F8()
{
  sub_100012C60();
  sub_100012C1C((void *)&_mh_execute_header, v0, v1, "<Error> Could not find contextual clamp parameters", v2, v3, v4, v5, v6);
}

void sub_10005C22C()
{
  sub_100012C60();
  sub_100012C1C((void *)&_mh_execute_header, v0, v1, "<Error> No TSFD channel", v2, v3, v4, v5, v6);
}

void sub_10005C260(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10005C2CC()
{
  sub_100012C60();
  sub_100012C1C((void *)&_mh_execute_header, v0, v1, "<Error> Could not find LSController parameters", v2, v3, v4, v5, v6);
}

void sub_10005C300()
{
  sub_100012C60();
  sub_100012C1C((void *)&_mh_execute_header, v0, v1, "<Error> Could not find camera sensor channel(s)", v2, v3, v4, v5, v6);
}

void sub_10005C334()
{
  sub_100012C60();
  sub_100012C1C((void *)&_mh_execute_header, v0, v1, "<Error> Could not find calibration resistor sensor channel", v2, v3, v4, v5, v6);
}

void sub_10005C368(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10005C3D4()
{
  sub_100012C60();
  sub_100012C1C((void *)&_mh_execute_header, v0, v1, "<Error> failed to create keyboardHelper object", v2, v3, v4, v5, v6);
}

void sub_10005C408()
{
  sub_100012C60();
  sub_100012C1C((void *)&_mh_execute_header, v0, v1, "<Error> Unknown level requested for thermalSimulationMode", v2, v3, v4, v5, v6);
}

void sub_10005C43C()
{
  sub_100012C60();
  sub_100012C1C((void *)&_mh_execute_header, v0, v1, "<Error> Null dictionary for ppm simuation override", v2, v3, v4, v5, v6);
}

void sub_10005C470()
{
  sub_100012C60();
  sub_100012C1C((void *)&_mh_execute_header, v0, v1, "<Error> Should not call base updateAllThermalLoad", v2, v3, v4, v5, v6);
}

void sub_10005C4A4()
{
  sub_100012C60();
  sub_100012C1C((void *)&_mh_execute_header, v0, v1, "<Error> Should not call base compute2DGridTemps", v2, v3, v4, v5, v6);
}

void sub_10005C4D8()
{
  sub_100012C60();
  sub_100012C1C((void *)&_mh_execute_header, v0, v1, "<Error> Should not call base computeMaxCGTemp", v2, v3, v4, v5, v6);
}

void sub_10005C50C(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10005C578(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "<Error> bad TSFD seed %@", (uint8_t *)&v2, 0xCu);
}

void sub_10005C5F0(uint64_t a1, NSObject *a2)
{
  int v3 = 138412290;
  uint64_t v4 = +[NSNumber numberWithInt:a1];
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "<Error> Unable to create power assertion for TSFD blend. Error: %@", (uint8_t *)&v3, 0xCu);
}

void sub_10005C688()
{
  sub_100012C60();
  sub_100012C1C((void *)&_mh_execute_header, v0, v1, "<Error> Failed to send max temp to the display driver", v2, v3, v4, v5, v6);
}

void sub_10005C6BC()
{
  sub_100012C60();
  sub_100012C1C((void *)&_mh_execute_header, v0, v1, "<Error> Failed to send 2D gridVT to the display driver", v2, v3, v4, v5, v6);
}

void sub_10005C6F0()
{
  sub_100012C60();
  sub_100012C1C((void *)&_mh_execute_header, v0, v1, "<Error> Framebuffer is NULL", v2, v3, v4, v5, v6);
}

void sub_10005C724()
{
  sub_100012C60();
  sub_100012C1C((void *)&_mh_execute_header, v0, v1, "<Error> Failed to send grid to the display driver", v2, v3, v4, v5, v6);
}

void sub_10005C758()
{
  sub_100012C60();
  sub_100012C1C((void *)&_mh_execute_header, v0, v1, "<Error> Should not call base class getGridX", v2, v3, v4, v5, v6);
}

void sub_10005C78C()
{
  sub_100012C60();
  sub_100012C1C((void *)&_mh_execute_header, v0, v1, "<Error> Should not call base class getGridY", v2, v3, v4, v5, v6);
}

void sub_10005C7C0(uint8_t *buf, unsigned char *a2, os_log_t log)
{
  *long long buf = 0;
  *a2 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "<Error> no FContext value", buf, 2u);
}

void sub_10005C800(uint8_t *buf, unsigned char *a2, os_log_t log)
{
  *long long buf = 0;
  *a2 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "<Error> bad FContext value", buf, 2u);
}

void sub_10005C840()
{
  sub_100012C60();
  sub_100012C1C((void *)&_mh_execute_header, v0, v1, "<Error> Failed to get 4CC info from SMC\n", v2, v3, v4, v5, v6);
}

void sub_10005C874()
{
  sub_100012C60();
  sub_100012C1C((void *)&_mh_execute_header, v0, v1, "<Error> Failed to get sensorCount\n", v2, v3, v4, v5, v6);
}

void sub_10005C8A8()
{
  sub_100012C60();
  sub_100012C1C((void *)&_mh_execute_header, v0, v1, "<Error> Could not open connection with AppleSMCSensorDispatcher", v2, v3, v4, v5, v6);
}

void sub_10005C8DC()
{
  sub_100012C60();
  sub_100012C1C((void *)&_mh_execute_header, v0, v1, "<Error> Failed to query data from SensorDispatcher", v2, v3, v4, v5, v6);
}

void sub_10005C910(int a1, NSObject *a2)
{
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "<Error> Failed to write data to SensorDispatcher = 0x%x", (uint8_t *)v2, 8u);
}

void sub_10005C988(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10005CA00()
{
  sub_100017B5C();
  sub_100012C6C((void *)&_mh_execute_header, v0, v1, "<Error> Error creating CLPC client %@", v2, v3, v4, v5, v6);
}

void sub_10005CA68()
{
  sub_100012C60();
  sub_100012C1C((void *)&_mh_execute_header, v0, v1, "<Error> Unable to get keyboard notification ports", v2, v3, v4, v5, v6);
}

void sub_10005CA9C()
{
  sub_100012C60();
  sub_100012C1C((void *)&_mh_execute_header, v0, v1, "<Error> Unable to get runLoops for keyboard connect/disconnect", v2, v3, v4, v5, v6);
}

void sub_10005CAD0()
{
  sub_100012C60();
  sub_100012C1C((void *)&_mh_execute_header, v0, v1, "<Error> Unable to get HID services for folio detection", v2, v3, v4, v5, v6);
}

void sub_10005CB04(uint8_t *buf, unsigned char *a2, os_log_t log)
{
  *long long buf = 0;
  *a2 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "<Error> Failed to copy keyboard event from client", buf, 2u);
}

void sub_10005CB44(uint8_t *buf, unsigned char *a2, os_log_t log)
{
  *long long buf = 0;
  *a2 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "<Error> Unable to create eventRef for keyboard event", buf, 2u);
}

void sub_10005CB84(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10005CBFC(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10005CC74()
{
  sub_100017B5C();
  sub_100012C6C((void *)&_mh_execute_header, v0, v1, "<Error> Error setting dock mode to false in CLPC client %@", v2, v3, v4, v5, v6);
}

void sub_10005CCDC()
{
  sub_100017B5C();
  sub_100012C6C((void *)&_mh_execute_header, v0, v1, "<Error> Error setting dock mode to True with keyboard attached %@", v2, v3, v4, v5, v6);
}

void sub_10005CD44()
{
  sub_100017B5C();
  sub_100012C6C((void *)&_mh_execute_header, v0, v1, "<Error> Error setting dock mode to True with folio attached %@", v2, v3, v4, v5, v6);
}

void sub_10005CDAC()
{
  sub_100012C60();
  sub_100012C1C((void *)&_mh_execute_header, v0, v1, "<Error> Couldn't create hidEventSystem", v2, v3, v4, v5, v6);
}

void sub_10005CDE0()
{
  sub_100012C60();
  sub_100012C1C((void *)&_mh_execute_header, v0, v1, "<Error> Unexpected DT data count", v2, v3, v4, v5, v6);
}

void sub_10005CE14()
{
  sub_100012C60();
  sub_100012C1C((void *)&_mh_execute_header, v0, v1, "<Error> Piecewise DT table too small", v2, v3, v4, v5, v6);
}

void sub_10005CE48()
{
  sub_100012C60();
  sub_100012C1C((void *)&_mh_execute_header, v0, v1, "<Error> Piecewise DT table too large", v2, v3, v4, v5, v6);
}

void sub_10005CE7C()
{
  sub_100012C60();
  sub_100012C1C((void *)&_mh_execute_header, v0, v1, "<Error> Piecewise DT table bad bounds", v2, v3, v4, v5, v6);
}

void sub_10005CEB0()
{
  sub_100012C60();
  sub_100012C1C((void *)&_mh_execute_header, v0, v1, "<Error> Piecewise DT table count mismatch", v2, v3, v4, v5, v6);
}

void sub_10005CEE4()
{
  sub_100012C60();
  sub_100012C1C((void *)&_mh_execute_header, v0, v1, "<Error> Piecewise DT interpolation failure", v2, v3, v4, v5, v6);
}

void sub_10005CF18(unsigned char *a1, unsigned char *a2)
{
  sub_100012C50(a1, a2);
  sub_1000156B8((void *)&_mh_execute_header, v2, v3, "<Error> Invalid DT section format", v4);
}

void sub_10005CF44(unsigned char *a1, unsigned char *a2)
{
  sub_100012C50(a1, a2);
  sub_1000156B8((void *)&_mh_execute_header, v2, v3, "<Error> Invalid DT section dictionary type", v4);
}

void sub_10005CF70(unsigned char *a1, unsigned char *a2)
{
  sub_100012C50(a1, a2);
  sub_1000156B8((void *)&_mh_execute_header, v2, v3, "<Error> Unknown DT section representation", v4);
}

void sub_10005CF9C()
{
  sub_100012C60();
  sub_100012C1C((void *)&_mh_execute_header, v0, v1, "<Error> Unexpected value for seeding source", v2, v3, v4, v5, v6);
}

uint64_t AnalyticsSendEventLazy()
{
  return _AnalyticsSendEventLazy();
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  return _CFAbsoluteTimeGetCurrent();
}

void CFArrayAppendValue(CFMutableArrayRef theArray, const void *value)
{
}

CFArrayRef CFArrayCreate(CFAllocatorRef allocator, const void **values, CFIndex numValues, const CFArrayCallBacks *callBacks)
{
  return _CFArrayCreate(allocator, values, numValues, callBacks);
}

CFArrayRef CFArrayCreateCopy(CFAllocatorRef allocator, CFArrayRef theArray)
{
  return _CFArrayCreateCopy(allocator, theArray);
}

CFMutableArrayRef CFArrayCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFArrayCallBacks *callBacks)
{
  return _CFArrayCreateMutable(allocator, capacity, callBacks);
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return _CFArrayGetCount(theArray);
}

CFTypeID CFArrayGetTypeID(void)
{
  return _CFArrayGetTypeID();
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return _CFArrayGetValueAtIndex(theArray, idx);
}

void CFArrayReplaceValues(CFMutableArrayRef theArray, CFRange range, const void **newValues, CFIndex newCount)
{
}

CFTypeID CFBooleanGetTypeID(void)
{
  return _CFBooleanGetTypeID();
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return _CFBooleanGetValue(BOOLean);
}

CFDataRef CFDataCreate(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length)
{
  return _CFDataCreate(allocator, bytes, length);
}

const UInt8 *__cdecl CFDataGetBytePtr(CFDataRef theData)
{
  return _CFDataGetBytePtr(theData);
}

CFIndex CFDataGetLength(CFDataRef theData)
{
  return _CFDataGetLength(theData);
}

CFTypeID CFDataGetTypeID(void)
{
  return _CFDataGetTypeID();
}

CFDateRef CFDateCreate(CFAllocatorRef allocator, CFAbsoluteTime at)
{
  return _CFDateCreate(allocator, at);
}

void CFDictionaryAddValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

Boolean CFDictionaryContainsKey(CFDictionaryRef theDict, const void *key)
{
  return _CFDictionaryContainsKey(theDict, key);
}

CFDictionaryRef CFDictionaryCreate(CFAllocatorRef allocator, const void **keys, const void **values, CFIndex numValues, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return _CFDictionaryCreate(allocator, keys, values, numValues, keyCallBacks, valueCallBacks);
}

CFDictionaryRef CFDictionaryCreateCopy(CFAllocatorRef allocator, CFDictionaryRef theDict)
{
  return _CFDictionaryCreateCopy(allocator, theDict);
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return _CFDictionaryCreateMutable(allocator, capacity, keyCallBacks, valueCallBacks);
}

CFIndex CFDictionaryGetCount(CFDictionaryRef theDict)
{
  return _CFDictionaryGetCount(theDict);
}

CFTypeID CFDictionaryGetTypeID(void)
{
  return _CFDictionaryGetTypeID();
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return _CFDictionaryGetValue(theDict, key);
}

void CFDictionaryRemoveAllValues(CFMutableDictionaryRef theDict)
{
}

void CFDictionaryRemoveValue(CFMutableDictionaryRef theDict, const void *key)
{
}

void CFDictionaryReplaceValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return _CFGetTypeID(cf);
}

CFTypeRef CFMakeCollectable(CFTypeRef cf)
{
  return _CFMakeCollectable(cf);
}

CFNumberRef CFNumberCreate(CFAllocatorRef allocator, CFNumberType theType, const void *valuePtr)
{
  return _CFNumberCreate(allocator, theType, valuePtr);
}

CFTypeID CFNumberGetTypeID(void)
{
  return _CFNumberGetTypeID();
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return _CFNumberGetValue(number, theType, valuePtr);
}

Boolean CFPreferencesAppSynchronize(CFStringRef applicationID)
{
  return _CFPreferencesAppSynchronize(applicationID);
}

CFDictionaryRef CFPreferencesCopyMultiple(CFArrayRef keysToFetch, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return _CFPreferencesCopyMultiple(keysToFetch, applicationID, userName, hostName);
}

CFPropertyListRef CFPreferencesCopyValue(CFStringRef key, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return _CFPreferencesCopyValue(key, applicationID, userName, hostName);
}

void CFPreferencesSetMultiple(CFDictionaryRef keysToSet, CFArrayRef keysToRemove, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
}

void CFPreferencesSetValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return _CFRetain(cf);
}

void CFRunLoopAddSource(CFRunLoopRef rl, CFRunLoopSourceRef source, CFRunLoopMode mode)
{
}

void CFRunLoopAddTimer(CFRunLoopRef rl, CFRunLoopTimerRef timer, CFRunLoopMode mode)
{
}

CFRunLoopRef CFRunLoopGetCurrent(void)
{
  return _CFRunLoopGetCurrent();
}

void CFRunLoopRemoveSource(CFRunLoopRef rl, CFRunLoopSourceRef source, CFRunLoopMode mode)
{
}

void CFRunLoopRun(void)
{
}

CFRunLoopTimerRef CFRunLoopTimerCreate(CFAllocatorRef allocator, CFAbsoluteTime fireDate, CFTimeInterval interval, CFOptionFlags flags, CFIndex order, CFRunLoopTimerCallBack callout, CFRunLoopTimerContext *context)
{
  return _CFRunLoopTimerCreate(allocator, fireDate, interval, flags, order, callout, context);
}

void CFRunLoopTimerInvalidate(CFRunLoopTimerRef timer)
{
}

void CFStringAppend(CFMutableStringRef theString, CFStringRef appendedString)
{
}

void CFStringAppendFormat(CFMutableStringRef theString, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
}

CFComparisonResult CFStringCompare(CFStringRef theString1, CFStringRef theString2, CFStringCompareFlags compareOptions)
{
  return _CFStringCompare(theString1, theString2, compareOptions);
}

CFStringRef CFStringCreateByCombiningStrings(CFAllocatorRef alloc, CFArrayRef theArray, CFStringRef separatorString)
{
  return _CFStringCreateByCombiningStrings(alloc, theArray, separatorString);
}

CFDataRef CFStringCreateExternalRepresentation(CFAllocatorRef alloc, CFStringRef theString, CFStringEncoding encoding, UInt8 lossByte)
{
  return _CFStringCreateExternalRepresentation(alloc, theString, encoding, lossByte);
}

CFMutableStringRef CFStringCreateMutableCopy(CFAllocatorRef alloc, CFIndex maxLength, CFStringRef theString)
{
  return _CFStringCreateMutableCopy(alloc, maxLength, theString);
}

CFStringRef CFStringCreateWithCString(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding)
{
  return _CFStringCreateWithCString(alloc, cStr, encoding);
}

CFStringRef CFStringCreateWithCStringNoCopy(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding, CFAllocatorRef contentsDeallocator)
{
  return _CFStringCreateWithCStringNoCopy(alloc, cStr, encoding, contentsDeallocator);
}

CFStringRef CFStringCreateWithFormat(CFAllocatorRef alloc, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
  return _CFStringCreateWithFormat(alloc, formatOptions, format);
}

Boolean CFStringGetCString(CFStringRef theString, char *buffer, CFIndex bufferSize, CFStringEncoding encoding)
{
  return _CFStringGetCString(theString, buffer, bufferSize, encoding);
}

const char *__cdecl CFStringGetCStringPtr(CFStringRef theString, CFStringEncoding encoding)
{
  return _CFStringGetCStringPtr(theString, encoding);
}

UniChar CFStringGetCharacterAtIndex(CFStringRef theString, CFIndex idx)
{
  return _CFStringGetCharacterAtIndex(theString, idx);
}

Boolean CFStringGetFileSystemRepresentation(CFStringRef string, char *buffer, CFIndex maxBufLen)
{
  return _CFStringGetFileSystemRepresentation(string, buffer, maxBufLen);
}

CFIndex CFStringGetLength(CFStringRef theString)
{
  return _CFStringGetLength(theString);
}

CFTypeID CFStringGetTypeID(void)
{
  return _CFStringGetTypeID();
}

CFUUIDRef CFUUIDGetConstantUUIDWithBytes(CFAllocatorRef alloc, UInt8 byte0, UInt8 byte1, UInt8 byte2, UInt8 byte3, UInt8 byte4, UInt8 byte5, UInt8 byte6, UInt8 byte7, UInt8 byte8, UInt8 byte9, UInt8 byte10, UInt8 byte11, UInt8 byte12, UInt8 byte13, UInt8 byte14, UInt8 byte15)
{
  return _CFUUIDGetConstantUUIDWithBytes(alloc, byte0, byte1, byte2, byte3, byte4, byte5, byte6, byte7, byte8, byte9, byte10, byte11, byte12, byte13, byte14, byte15);
}

uint64_t GetThermalState()
{
  return _GetThermalState();
}

IOReturn IOAllowPowerChange(io_connect_t kernelPort, intptr_t notificationID)
{
  return _IOAllowPowerChange(kernelPort, notificationID);
}

IOReturn IOCancelPowerChange(io_connect_t kernelPort, intptr_t notificationID)
{
  return _IOCancelPowerChange(kernelPort, notificationID);
}

kern_return_t IOConnectCallAsyncScalarMethod(mach_port_t connection, uint32_t selector, mach_port_t wake_port, uint64_t *reference, uint32_t referenceCnt, const uint64_t *input, uint32_t inputCnt, uint64_t *output, uint32_t *outputCnt)
{
  return _IOConnectCallAsyncScalarMethod(connection, selector, wake_port, reference, referenceCnt, input, inputCnt, output, outputCnt);
}

kern_return_t IOConnectCallMethod(mach_port_t connection, uint32_t selector, const uint64_t *input, uint32_t inputCnt, const void *inputStruct, size_t inputStructCnt, uint64_t *output, uint32_t *outputCnt, void *outputStruct, size_t *outputStructCnt)
{
  return _IOConnectCallMethod(connection, selector, input, inputCnt, inputStruct, inputStructCnt, output, outputCnt, outputStruct, outputStructCnt);
}

kern_return_t IOConnectCallScalarMethod(mach_port_t connection, uint32_t selector, const uint64_t *input, uint32_t inputCnt, uint64_t *output, uint32_t *outputCnt)
{
  return _IOConnectCallScalarMethod(connection, selector, input, inputCnt, output, outputCnt);
}

kern_return_t IOConnectCallStructMethod(mach_port_t connection, uint32_t selector, const void *inputStruct, size_t inputStructCnt, void *outputStruct, size_t *outputStructCnt)
{
  return _IOConnectCallStructMethod(connection, selector, inputStruct, inputStructCnt, outputStruct, outputStructCnt);
}

IOReturn IODeregisterForSystemPower(io_object_t *notifier)
{
  return _IODeregisterForSystemPower(notifier);
}

uint64_t IOHIDEventCreateKeyboardEvent()
{
  return _IOHIDEventCreateKeyboardEvent();
}

uint64_t IOHIDEventGetFloatValue()
{
  return _IOHIDEventGetFloatValue();
}

uint64_t IOHIDEventGetIntegerValue()
{
  return _IOHIDEventGetIntegerValue();
}

uint64_t IOHIDEventGetTimeStamp()
{
  return _IOHIDEventGetTimeStamp();
}

uint64_t IOHIDEventGetType()
{
  return _IOHIDEventGetType();
}

CFTypeRef IOHIDEventSystemClientCopyProperty(IOHIDEventSystemClientRef client, CFStringRef key)
{
  return _IOHIDEventSystemClientCopyProperty(client, key);
}

CFArrayRef IOHIDEventSystemClientCopyServices(IOHIDEventSystemClientRef client)
{
  return _IOHIDEventSystemClientCopyServices(client);
}

uint64_t IOHIDEventSystemClientCreate()
{
  return _IOHIDEventSystemClientCreate();
}

uint64_t IOHIDEventSystemClientCreateWithType()
{
  return _IOHIDEventSystemClientCreateWithType();
}

uint64_t IOHIDEventSystemClientRegisterEventCallback()
{
  return _IOHIDEventSystemClientRegisterEventCallback();
}

uint64_t IOHIDEventSystemClientScheduleWithRunLoop()
{
  return _IOHIDEventSystemClientScheduleWithRunLoop();
}

uint64_t IOHIDEventSystemClientSetMatching()
{
  return _IOHIDEventSystemClientSetMatching();
}

uint64_t IOHIDEventSystemClientSetMatchingMultiple()
{
  return _IOHIDEventSystemClientSetMatchingMultiple();
}

uint64_t IOHIDEventSystemClientUnscheduleWithRunLoop()
{
  return _IOHIDEventSystemClientUnscheduleWithRunLoop();
}

uint64_t IOHIDEventSystemCopyEvent()
{
  return _IOHIDEventSystemCopyEvent();
}

uint64_t IOHIDEventSystemCreate()
{
  return _IOHIDEventSystemCreate();
}

uint64_t IOHIDServiceClientCopyEvent()
{
  return _IOHIDServiceClientCopyEvent();
}

CFTypeRef IOHIDServiceClientCopyProperty(IOHIDServiceClientRef service, CFStringRef key)
{
  return _IOHIDServiceClientCopyProperty(service, key);
}

CFTypeRef IOHIDServiceClientGetRegistryID(IOHIDServiceClientRef service)
{
  return _IOHIDServiceClientGetRegistryID(service);
}

uint64_t IOHIDServiceClientRegisterRemovalCallback()
{
  return _IOHIDServiceClientRegisterRemovalCallback();
}

Boolean IOHIDServiceClientSetProperty(IOHIDServiceClientRef service, CFStringRef key, CFTypeRef property)
{
  return _IOHIDServiceClientSetProperty(service, key, property);
}

io_object_t IOIteratorNext(io_iterator_t iterator)
{
  return _IOIteratorNext(iterator);
}

uint64_t IOMobileFramebufferCopyProperty()
{
  return _IOMobileFramebufferCopyProperty();
}

uint64_t IOMobileFramebufferGetMainDisplay()
{
  return _IOMobileFramebufferGetMainDisplay();
}

uint64_t IOMobileFramebufferGetServiceObject()
{
  return _IOMobileFramebufferGetServiceObject();
}

uint64_t IOMobileFramebufferSetBlock()
{
  return _IOMobileFramebufferSetBlock();
}

uint64_t IOMobileFramebufferSetParameter()
{
  return _IOMobileFramebufferSetParameter();
}

IONotificationPortRef IONotificationPortCreate(mach_port_t mainPort)
{
  return _IONotificationPortCreate(mainPort);
}

void IONotificationPortDestroy(IONotificationPortRef notify)
{
}

mach_port_t IONotificationPortGetMachPort(IONotificationPortRef notify)
{
  return _IONotificationPortGetMachPort(notify);
}

CFRunLoopSourceRef IONotificationPortGetRunLoopSource(IONotificationPortRef notify)
{
  return _IONotificationPortGetRunLoopSource(notify);
}

kern_return_t IOObjectRelease(io_object_t object)
{
  return _IOObjectRelease(object);
}

IOReturn IOPMAssertionCreateWithDescription(CFStringRef AssertionType, CFStringRef Name, CFStringRef Details, CFStringRef HumanReadableReason, CFStringRef LocalizationBundlePath, CFTimeInterval Timeout, CFStringRef TimeoutAction, IOPMAssertionID *AssertionID)
{
  return _IOPMAssertionCreateWithDescription(AssertionType, Name, Details, HumanReadableReason, LocalizationBundlePath, Timeout, TimeoutAction, AssertionID);
}

IOReturn IOPMAssertionCreateWithName(CFStringRef AssertionType, IOPMAssertionLevel AssertionLevel, CFStringRef AssertionName, IOPMAssertionID *AssertionID)
{
  return _IOPMAssertionCreateWithName(AssertionType, AssertionLevel, AssertionName, AssertionID);
}

IOReturn IOPMAssertionRelease(IOPMAssertionID AssertionID)
{
  return _IOPMAssertionRelease(AssertionID);
}

IOReturn IOPMCancelScheduledPowerEvent(CFDateRef time_to_wake, CFStringRef my_id, CFStringRef type)
{
  return _IOPMCancelScheduledPowerEvent(time_to_wake, my_id, type);
}

io_connect_t IOPMFindPowerManagement(mach_port_t master_device_port)
{
  return _IOPMFindPowerManagement(master_device_port);
}

uint64_t IOPMGetLastWakeTime()
{
  return _IOPMGetLastWakeTime();
}

IOReturn IOPMSchedulePowerEvent(CFDateRef time_to_wake, CFStringRef my_id, CFStringRef type)
{
  return _IOPMSchedulePowerEvent(time_to_wake, my_id, type);
}

IOReturn IOPMSleepSystem(io_connect_t fb)
{
  return _IOPMSleepSystem(fb);
}

CFDictionaryRef IOPSCopyExternalPowerAdapterDetails(void)
{
  return _IOPSCopyExternalPowerAdapterDetails();
}

uint64_t IOPSGetPercentRemaining()
{
  return _IOPSGetPercentRemaining();
}

io_connect_t IORegisterForSystemPower(void *refcon, IONotificationPortRef *thePortRef, IOServiceInterestCallback callback, io_object_t *notifier)
{
  return _IORegisterForSystemPower(refcon, thePortRef, callback, notifier);
}

kern_return_t IORegistryEntryCreateCFProperties(io_registry_entry_t entry, CFMutableDictionaryRef *properties, CFAllocatorRef allocator, IOOptionBits options)
{
  return _IORegistryEntryCreateCFProperties(entry, properties, allocator, options);
}

CFTypeRef IORegistryEntryCreateCFProperty(io_registry_entry_t entry, CFStringRef key, CFAllocatorRef allocator, IOOptionBits options)
{
  return _IORegistryEntryCreateCFProperty(entry, key, allocator, options);
}

io_registry_entry_t IORegistryEntryFromPath(mach_port_t mainPort, const io_string_t path)
{
  return _IORegistryEntryFromPath(mainPort, path);
}

kern_return_t IORegistryEntrySetCFProperties(io_registry_entry_t entry, CFTypeRef properties)
{
  return _IORegistryEntrySetCFProperties(entry, properties);
}

kern_return_t IORegistryEntrySetCFProperty(io_registry_entry_t entry, CFStringRef propertyName, CFTypeRef property)
{
  return _IORegistryEntrySetCFProperty(entry, propertyName, property);
}

uint64_t IOReportChannelGetChannelID()
{
  return _IOReportChannelGetChannelID();
}

uint64_t IOReportChannelGetChannelName()
{
  return _IOReportChannelGetChannelName();
}

uint64_t IOReportCopyChannelsInGroup()
{
  return _IOReportCopyChannelsInGroup();
}

uint64_t IOReportCopyChannelsWithID()
{
  return _IOReportCopyChannelsWithID();
}

uint64_t IOReportCreateSamples()
{
  return _IOReportCreateSamples();
}

uint64_t IOReportCreateSamplesDelta()
{
  return _IOReportCreateSamplesDelta();
}

uint64_t IOReportCreateSubscription()
{
  return _IOReportCreateSubscription();
}

uint64_t IOReportIterate()
{
  return _IOReportIterate();
}

uint64_t IOReportSimpleGetIntegerValue()
{
  return _IOReportSimpleGetIntegerValue();
}

uint64_t IOReportStateGetCount()
{
  return _IOReportStateGetCount();
}

uint64_t IOReportStateGetDutyCycle()
{
  return _IOReportStateGetDutyCycle();
}

uint64_t IOReportStateGetNameForIndex()
{
  return _IOReportStateGetNameForIndex();
}

kern_return_t IOServiceAddInterestNotification(IONotificationPortRef notifyPort, io_service_t service, const io_name_t interestType, IOServiceInterestCallback callback, void *refCon, io_object_t *notification)
{
  return _IOServiceAddInterestNotification(notifyPort, service, interestType, callback, refCon, notification);
}

kern_return_t IOServiceAddMatchingNotification(IONotificationPortRef notifyPort, const io_name_t notificationType, CFDictionaryRef matching, IOServiceMatchingCallback callback, void *refCon, io_iterator_t *notification)
{
  return _IOServiceAddMatchingNotification(notifyPort, notificationType, matching, callback, refCon, notification);
}

kern_return_t IOServiceClose(io_connect_t connect)
{
  return _IOServiceClose(connect);
}

io_service_t IOServiceGetMatchingService(mach_port_t mainPort, CFDictionaryRef matching)
{
  return _IOServiceGetMatchingService(mainPort, matching);
}

kern_return_t IOServiceGetMatchingServices(mach_port_t mainPort, CFDictionaryRef matching, io_iterator_t *existing)
{
  return _IOServiceGetMatchingServices(mainPort, matching, existing);
}

CFMutableDictionaryRef IOServiceMatching(const char *name)
{
  return _IOServiceMatching(name);
}

CFMutableDictionaryRef IOServiceNameMatching(const char *name)
{
  return _IOServiceNameMatching(name);
}

kern_return_t IOServiceOpen(io_service_t service, task_port_t owningTask, uint32_t type, io_connect_t *connect)
{
  return _IOServiceOpen(service, owningTask, type, connect);
}

uint64_t MGCopyAnswer()
{
  return _MGCopyAnswer();
}

uint64_t MGGetBoolAnswer()
{
  return _MGGetBoolAnswer();
}

uint64_t MGGetSInt32Answer()
{
  return _MGGetSInt32Answer();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return _NSStringFromClass(aClass);
}

uint64_t PLLogRegisteredEvent()
{
  return _PLLogRegisteredEvent();
}

uint64_t PLShouldLogRegisteredEvent()
{
  return _PLShouldLogRegisteredEvent();
}

int SCError(void)
{
  return _SCError();
}

const char *__cdecl SCErrorString(int status)
{
  return _SCErrorString(status);
}

Boolean SCPreferencesCommitChanges(SCPreferencesRef prefs)
{
  return _SCPreferencesCommitChanges(prefs);
}

SCPreferencesRef SCPreferencesCreate(CFAllocatorRef allocator, CFStringRef name, CFStringRef prefsID)
{
  return _SCPreferencesCreate(allocator, name, prefsID);
}

CFPropertyListRef SCPreferencesGetValue(SCPreferencesRef prefs, CFStringRef key)
{
  return _SCPreferencesGetValue(prefs, key);
}

Boolean SCPreferencesRemoveValue(SCPreferencesRef prefs, CFStringRef key)
{
  return _SCPreferencesRemoveValue(prefs, key);
}

Boolean SCPreferencesScheduleWithRunLoop(SCPreferencesRef prefs, CFRunLoopRef runLoop, CFStringRef runLoopMode)
{
  return _SCPreferencesScheduleWithRunLoop(prefs, runLoop, runLoopMode);
}

Boolean SCPreferencesSetCallback(SCPreferencesRef prefs, SCPreferencesCallBack callout, SCPreferencesContext *context)
{
  return _SCPreferencesSetCallback(prefs, callout, context);
}

Boolean SCPreferencesSetValue(SCPreferencesRef prefs, CFStringRef key, CFPropertyListRef value)
{
  return _SCPreferencesSetValue(prefs, key, value);
}

void SCPreferencesSynchronize(SCPreferencesRef prefs)
{
}

uint64_t WiFiManagerClientCreate()
{
  return _WiFiManagerClientCreate();
}

uint64_t WiFiManagerClientGetThermalIndex()
{
  return _WiFiManagerClientGetThermalIndex();
}

uint64_t WiFiManagerClientSetThermalIndex()
{
  return _WiFiManagerClientSetThermalIndex();
}

void _Block_object_assign(void *a1, const void *a2, const int a3)
{
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

uint64_t _CTServerConnectionAddToRunLoop()
{
  return __CTServerConnectionAddToRunLoop();
}

uint64_t _CTServerConnectionConfigMaxRadioPower()
{
  return __CTServerConnectionConfigMaxRadioPower();
}

uint64_t _CTServerConnectionCreateWithIdentifier()
{
  return __CTServerConnectionCreateWithIdentifier();
}

uint64_t _CTServerConnectionRegisterForNotification()
{
  return __CTServerConnectionRegisterForNotification();
}

uint64_t _CTServerConnectionSetMaxTemperature()
{
  return __CTServerConnectionSetMaxTemperature();
}

uint64_t _OSThermalNotificationLevelForBehavior()
{
  return __OSThermalNotificationLevelForBehavior();
}

uint64_t _OSThermalNotificationSetLevelForBehavior()
{
  return __OSThermalNotificationSetLevelForBehavior();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

uint64_t abm::client::CreateManager()
{
  return abm::client::CreateManager();
}

uint64_t abm::client::PerformCommand()
{
  return abm::client::PerformCommand();
}

uint64_t abm::client::GetBasebandBootState()
{
  return abm::client::GetBasebandBootState();
}

uint64_t abm::client::RegisterEventHandler()
{
  return abm::client::RegisterEventHandler();
}

uint64_t abm::client::EventsOn()
{
  return abm::client::EventsOn();
}

uint64_t abm::client::EventsOff()
{
  return abm::client::EventsOff();
}

std::logic_error *__cdecl std::logic_error::logic_error(std::logic_error *this, const char *a2)
{
  return std::logic_error::logic_error(this, a2);
}

std::bad_array_new_length *__cdecl std::bad_array_new_length::bad_array_new_length(std::bad_array_new_length *this)
{
  return std::bad_array_new_length::bad_array_new_length(this);
}

void std::__shared_weak_count::__release_weak(std::__shared_weak_count *this)
{
}

void operator delete(void *__p)
{
  while (1)
    ;
}

void *__cdecl operator new(size_t __sz)
{
  while (1)
    ;
}

void *__cxa_allocate_exception(size_t thrown_size)
{
  return ___cxa_allocate_exception(thrown_size);
}

void __cxa_free_exception(void *a1)
{
}

void __cxa_throw(void *a1, struct type_info *lptinfo, void (*a3)(void *))
{
}

int *__error(void)
{
  return ___error();
}

int __sprintf_chk(char *a1, int a2, size_t a3, const char *a4, ...)
{
  return ___sprintf_chk(a1, a2, a3, a4);
}

uint64_t __strcat_chk()
{
  return ___strcat_chk();
}

uint64_t _os_feature_enabled_impl()
{
  return __os_feature_enabled_impl();
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _sl_dlopen()
{
  return __sl_dlopen();
}

uint64_t abort_report_np()
{
  return _abort_report_np();
}

int asprintf(char **a1, const char *a2, ...)
{
  return _asprintf(a1, a2);
}

void bzero(void *a1, size_t a2)
{
}

int clock_gettime(clockid_t __clock_id, timespec *__tp)
{
  return _clock_gettime(__clock_id, __tp);
}

__uint64_t clock_gettime_nsec_np(clockid_t __clock_id)
{
  return _clock_gettime_nsec_np(__clock_id);
}

int close(int a1)
{
  return _close(a1);
}

char *__cdecl ctime(const time_t *a1)
{
  return _ctime(a1);
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return _dispatch_queue_attr_make_with_autorelease_frequency(attr, frequency);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return _dispatch_queue_create(label, attr);
}

void dispatch_release(dispatch_object_t object)
{
}

void dispatch_resume(dispatch_object_t object)
{
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return _dispatch_semaphore_create(value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return _dispatch_semaphore_signal(dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return _dispatch_semaphore_wait(dsema, timeout);
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

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return _dispatch_time(when, delta);
}

void exit(int a1)
{
}

int fclose(FILE *a1)
{
  return _fclose(a1);
}

FILE *__cdecl fopen(const char *__filename, const char *__mode)
{
  return _fopen(__filename, __mode);
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return _fprintf(a1, a2);
}

void free(void *a1)
{
}

int fseek(FILE *a1, uint64_t a2, int a3)
{
  return _fseek(a1, a2, a3);
}

int fstat(int a1, stat *a2)
{
  return _fstat(a1, a2);
}

uint64_t ftell(FILE *a1)
{
  return _ftell(a1);
}

size_t fwrite(const void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return _fwrite(__ptr, __size, __nitems, __stream);
}

int gethostuuid(uuid_t a1, const timespec *a2)
{
  return _gethostuuid(a1, a2);
}

int gettimeofday(timeval *a1, void *a2)
{
  return _gettimeofday(a1, a2);
}

kern_return_t host_statistics(host_t host_priv, host_flavor_t flavor, host_info_t host_info_out, mach_msg_type_number_t *host_info_outCnt)
{
  return _host_statistics(host_priv, flavor, host_info_out, host_info_outCnt);
}

uint64_t kdebug_trace()
{
  return _kdebug_trace();
}

uint64_t logEventForAppleCare()
{
  return _logEventForAppleCare();
}

uint64_t lookupPathForPersistentData()
{
  return _lookupPathForPersistentData();
}

uint64_t mach_absolute_time(void)
{
  return _mach_absolute_time();
}

uint64_t mach_continuous_time(void)
{
  return _mach_continuous_time();
}

char *__cdecl mach_error_string(mach_error_t error_value)
{
  return _mach_error_string(error_value);
}

uint64_t mach_get_times()
{
  return _mach_get_times();
}

mach_port_t mach_host_self(void)
{
  return _mach_host_self();
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return _mach_timebase_info(info);
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

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return _memmove(__dst, __src, __len);
}

void memset_pattern16(void *__b, const void *__pattern16, size_t __len)
{
}

uint32_t notify_cancel(int token)
{
  return _notify_cancel(token);
}

uint32_t notify_get_state(int token, uint64_t *state64)
{
  return _notify_get_state(token, state64);
}

uint32_t notify_post(const char *name)
{
  return _notify_post(name);
}

uint32_t notify_register_check(const char *name, int *out_token)
{
  return _notify_register_check(name, out_token);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return _notify_register_dispatch(name, out_token, queue, handler);
}

uint32_t notify_set_state(int token, uint64_t state64)
{
  return _notify_set_state(token, state64);
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

uint64_t objc_alloc_init()
{
  return _objc_alloc_init();
}

id objc_autorelease(id a1)
{
  return _objc_autorelease(a1);
}

{
}

{
}

void objc_copyWeak(id *to, id *from)
{
}

void objc_destroyWeak(id *location)
{
}

void objc_enumerationMutation(id obj)
{
}

Class objc_getClass(const char *name)
{
  return _objc_getClass(name);
}

id objc_initWeak(id *location, id val)
{
  return _objc_initWeak(location, val);
}

id objc_loadWeak(id *location)
{
  return _objc_loadWeak(location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return [super a2];
}

uint64_t objc_opt_class()
{
  return _objc_opt_class();
}

uint64_t objc_opt_isKindOfClass()
{
  return _objc_opt_isKindOfClass();
}

uint64_t objc_opt_new()
{
  return _objc_opt_new();
}

uint64_t objc_opt_respondsToSelector()
{
  return _objc_opt_respondsToSelector();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return _objc_retain(a1);
}

void objc_setProperty_nonatomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

int open(const char *a1, int a2, ...)
{
  return _open(a1, a2);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return _os_log_create(subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

int pthread_mutex_init(pthread_mutex_t *a1, const pthread_mutexattr_t *a2)
{
  return _pthread_mutex_init(a1, a2);
}

int pthread_mutex_lock(pthread_mutex_t *a1)
{
  return _pthread_mutex_lock(a1);
}

int pthread_mutex_unlock(pthread_mutex_t *a1)
{
  return _pthread_mutex_unlock(a1);
}

int pthread_set_qos_class_self_np(qos_class_t __qos_class, int __relative_priority)
{
  return _pthread_set_qos_class_self_np(__qos_class, __relative_priority);
}

int puts(const char *a1)
{
  return _puts(a1);
}

BOOL remove(const std::__fs::filesystem::path *__p, std::error_code *__ec)
{
  return _remove(__p, __ec);
}

unsigned int sleep(unsigned int a1)
{
  return _sleep(a1);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return _snprintf(__str, __size, __format);
}

int sprintf(char *a1, const char *a2, ...)
{
  return _sprintf(a1, a2);
}

int strcasecmp(const char *a1, const char *a2)
{
  return _strcasecmp(a1, a2);
}

char *__cdecl strcat(char *__s1, const char *__s2)
{
  return _strcat(__s1, __s2);
}

int strcmp(const char *__s1, const char *__s2)
{
  return _strcmp(__s1, __s2);
}

char *__cdecl strdup(const char *__s1)
{
  return _strdup(__s1);
}

char *__cdecl strerror(int __errnum)
{
  return _strerror(__errnum);
}

size_t strlen(const char *__s)
{
  return _strlen(__s);
}

int strncmp(const char *__s1, const char *__s2, size_t __n)
{
  return _strncmp(__s1, __s2, __n);
}

char *__cdecl strstr(char *__s1, const char *__s2)
{
  return _strstr(__s1, __s2);
}

int sysctlbyname(const char *a1, void *a2, size_t *a3, void *a4, size_t a5)
{
  return _sysctlbyname(a1, a2, a3, a4, a5);
}

time_t time(time_t *a1)
{
  return _time(a1);
}

kern_return_t vm_deallocate(vm_map_t target_task, vm_address_t address, vm_size_t size)
{
  return _vm_deallocate(target_task, address, size);
}

uint64_t wd_endpoint_activate()
{
  return _wd_endpoint_activate();
}

uint64_t wd_endpoint_add_queue()
{
  return _wd_endpoint_add_queue();
}

uint64_t wd_endpoint_register()
{
  return _wd_endpoint_register();
}

uint64_t wd_endpoint_set_alive_func()
{
  return _wd_endpoint_set_alive_func();
}

ssize_t write(int __fd, const void *__buf, size_t __nbyte)
{
  return _write(__fd, __buf, __nbyte);
}

void xpc_connection_activate(xpc_connection_t connection)
{
}

void xpc_connection_cancel(xpc_connection_t connection)
{
}

xpc_connection_t xpc_connection_create_mach_service(const char *name, dispatch_queue_t targetq, uint64_t flags)
{
  return _xpc_connection_create_mach_service(name, targetq, flags);
}

void xpc_connection_send_message_with_reply(xpc_connection_t connection, xpc_object_t message, dispatch_queue_t replyq, xpc_handler_t handler)
{
}

void xpc_connection_set_event_handler(xpc_connection_t connection, xpc_handler_t handler)
{
}

const void *__cdecl xpc_data_get_bytes_ptr(xpc_object_t xdata)
{
  return _xpc_data_get_bytes_ptr(xdata);
}

size_t xpc_data_get_length(xpc_object_t xdata)
{
  return _xpc_data_get_length(xdata);
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return _xpc_dictionary_create(keys, values, count);
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_string(xdict, key);
}

xpc_object_t xpc_dictionary_get_value(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_value(xdict, key);
}

void xpc_dictionary_set_BOOL(xpc_object_t xdict, const char *key, BOOL value)
{
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return _xpc_get_type(object);
}

xpc_object_t xpc_int64_create(int64_t value)
{
  return _xpc_int64_create(value);
}

void xpc_release(xpc_object_t object)
{
}

xpc_object_t xpc_retain(xpc_object_t object)
{
  return _xpc_retain(object);
}

void xpc_set_event_stream_handler(const char *stream, dispatch_queue_t targetq, xpc_handler_t handler)
{
}

id objc_msgSend_CPULevel(void *a1, const char *a2, ...)
{
  return [a1 CPULevel];
}

id objc_msgSend_DVD1Level(void *a1, const char *a2, ...)
{
  return [a1 DVD1Level];
}

id objc_msgSend_SGXLevel(void *a1, const char *a2, ...)
{
  return [a1 SGXLevel];
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return [a1 UTF8String];
}

id objc_msgSend__acquireBacklightAssertion(void *a1, const char *a2, ...)
{
  return [a1 _acquireBacklightAssertion];
}

id objc_msgSend_accConnectionInfo(void *a1, const char *a2, ...)
{
  return [a1 accConnectionInfo];
}

id objc_msgSend_addRadioMitigations(void *a1, const char *a2, ...)
{
  return [a1 addRadioMitigations];
}

id objc_msgSend_allKeys(void *a1, const char *a2, ...)
{
  return [a1 allKeys];
}

id objc_msgSend_alloc(void *a1, const char *a2, ...)
{
  return [a1 alloc];
}

id objc_msgSend_allocDefaults(void *a1, const char *a2, ...)
{
  return [a1 allocDefaults];
}

id objc_msgSend_arcModuleTemperature(void *a1, const char *a2, ...)
{
  return [a1 arcModuleTemperature];
}

id objc_msgSend_arcVirtualTemperature(void *a1, const char *a2, ...)
{
  return [a1 arcVirtualTemperature];
}

id objc_msgSend_audioIsOn(void *a1, const char *a2, ...)
{
  return [a1 audioIsOn];
}

id objc_msgSend_backlightIsOn(void *a1, const char *a2, ...)
{
  return [a1 backlightIsOn];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_brightnessSystemMonitor(void *a1, const char *a2, ...)
{
  return [a1 brightnessSystemMonitor];
}

id objc_msgSend_bytes(void *a1, const char *a2, ...)
{
  return [a1 bytes];
}

id objc_msgSend_cacheArray(void *a1, const char *a2, ...)
{
  return [a1 cacheArray];
}

id objc_msgSend_calculateAdditionalRadioMitigations(void *a1, const char *a2, ...)
{
  return [a1 calculateAdditionalRadioMitigations];
}

id objc_msgSend_calculateMitigation(void *a1, const char *a2, ...)
{
  return [a1 calculateMitigation];
}

id objc_msgSend_calculateTargetDifference(void *a1, const char *a2, ...)
{
  return [a1 calculateTargetDifference];
}

id objc_msgSend_canSystemSleep(void *a1, const char *a2, ...)
{
  return [a1 canSystemSleep];
}

id objc_msgSend_canaryTempSensorIndex(void *a1, const char *a2, ...)
{
  return [a1 canaryTempSensorIndex];
}

id objc_msgSend_canaryTempThreshold(void *a1, const char *a2, ...)
{
  return [a1 canaryTempThreshold];
}

id objc_msgSend_charValue(void *a1, const char *a2, ...)
{
  return [a1 charValue];
}

id objc_msgSend_chooseEffectiveSeedingSource(void *a1, const char *a2, ...)
{
  return [a1 chooseEffectiveSeedingSource];
}

id objc_msgSend_clearControlEffortOverrides(void *a1, const char *a2, ...)
{
  return [a1 clearControlEffortOverrides];
}

id objc_msgSend_clearLoadingIndexOverrides(void *a1, const char *a2, ...)
{
  return [a1 clearLoadingIndexOverrides];
}

id objc_msgSend_close(void *a1, const char *a2, ...)
{
  return [a1 close];
}

id objc_msgSend_compute2DGridTemps(void *a1, const char *a2, ...)
{
  return [a1 compute2DGridTemps];
}

id objc_msgSend_computeMaxCGTemp(void *a1, const char *a2, ...)
{
  return [a1 computeMaxCGTemp];
}

id objc_msgSend_computePackageCurrentSeedPower(void *a1, const char *a2, ...)
{
  return [a1 computePackageCurrentSeedPower];
}

id objc_msgSend_computePowerTarget(void *a1, const char *a2, ...)
{
  return [a1 computePowerTarget];
}

id objc_msgSend_connectedEndpoints(void *a1, const char *a2, ...)
{
  return [a1 connectedEndpoints];
}

id objc_msgSend_connectedExternally(void *a1, const char *a2, ...)
{
  return [a1 connectedExternally];
}

id objc_msgSend_contextIsActive(void *a1, const char *a2, ...)
{
  return [a1 contextIsActive];
}

id objc_msgSend_controlEffort(void *a1, const char *a2, ...)
{
  return [a1 controlEffort];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return [a1 copy];
}

id objc_msgSend_copyDictionaryFromFile(void *a1, const char *a2, ...)
{
  return [a1 copyDictionaryFromFile];
}

id objc_msgSend_copyFiler(void *a1, const char *a2, ...)
{
  return [a1 copyFiler];
}

id objc_msgSend_copySensorArray(void *a1, const char *a2, ...)
{
  return [a1 copySensorArray];
}

id objc_msgSend_copyUpdatedLTSState(void *a1, const char *a2, ...)
{
  return [a1 copyUpdatedLTSState];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_cpmsHelperQueue(void *a1, const char *a2, ...)
{
  return [a1 cpmsHelperQueue];
}

id objc_msgSend_createConnectionToCT(void *a1, const char *a2, ...)
{
  return [a1 createConnectionToCT];
}

id objc_msgSend_createHIDEventSystemObject(void *a1, const char *a2, ...)
{
  return [a1 createHIDEventSystemObject];
}

id objc_msgSend_createServerConnection(void *a1, const char *a2, ...)
{
  return [a1 createServerConnection];
}

id objc_msgSend_ctxType(void *a1, const char *a2, ...)
{
  return [a1 ctxType];
}

id objc_msgSend_currentBootSessionUUID(void *a1, const char *a2, ...)
{
  return [a1 currentBootSessionUUID];
}

id objc_msgSend_currentLoadingIndex(void *a1, const char *a2, ...)
{
  return [a1 currentLoadingIndex];
}

id objc_msgSend_currentSession(void *a1, const char *a2, ...)
{
  return [a1 currentSession];
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return [a1 date];
}

id objc_msgSend_defaultAction(void *a1, const char *a2, ...)
{
  return [a1 defaultAction];
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return [a1 defaultCenter];
}

id objc_msgSend_defaultDieTempTarget(void *a1, const char *a2, ...)
{
  return [a1 defaultDieTempTarget];
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return [a1 defaultManager];
}

id objc_msgSend_defaults(void *a1, const char *a2, ...)
{
  return [a1 defaults];
}

id objc_msgSend_desiredLoopInterval(void *a1, const char *a2, ...)
{
  return [a1 desiredLoopInterval];
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return [a1 dictionary];
}

id objc_msgSend_dictionaryRepresentation(void *a1, const char *a2, ...)
{
  return [a1 dictionaryRepresentation];
}

id objc_msgSend_didWeCrossTargetTemp(void *a1, const char *a2, ...)
{
  return [a1 didWeCrossTargetTemp];
}

id objc_msgSend_dieTempFilteredMaxAverage(void *a1, const char *a2, ...)
{
  return [a1 dieTempFilteredMaxAverage];
}

id objc_msgSend_dieTempMaxAverage(void *a1, const char *a2, ...)
{
  return [a1 dieTempMaxAverage];
}

id objc_msgSend_dieTempMaxMax(void *a1, const char *a2, ...)
{
  return [a1 dieTempMaxMax];
}

id objc_msgSend_dieTempTarget(void *a1, const char *a2, ...)
{
  return [a1 dieTempTarget];
}

id objc_msgSend_enableDispatchVirtualTemp(void *a1, const char *a2, ...)
{
  return [a1 enableDispatchVirtualTemp];
}

id objc_msgSend_enableSending2DTempGridToDisplayDriver(void *a1, const char *a2, ...)
{
  return [a1 enableSending2DTempGridToDisplayDriver];
}

id objc_msgSend_enableSendingMaxTempToDisplayDriver(void *a1, const char *a2, ...)
{
  return [a1 enableSendingMaxTempToDisplayDriver];
}

id objc_msgSend_evaluateDecisionTree(void *a1, const char *a2, ...)
{
  return [a1 evaluateDecisionTree];
}

id objc_msgSend_findBacklightServices(void *a1, const char *a2, ...)
{
  return [a1 findBacklightServices];
}

id objc_msgSend_floatValue(void *a1, const char *a2, ...)
{
  return [a1 floatValue];
}

id objc_msgSend_frontCameraSensorIdx(void *a1, const char *a2, ...)
{
  return [a1 frontCameraSensorIdx];
}

id objc_msgSend_frontIRCameraSensorIdx(void *a1, const char *a2, ...)
{
  return [a1 frontIRCameraSensorIdx];
}

id objc_msgSend_frontRigelDieSensorIdx(void *a1, const char *a2, ...)
{
  return [a1 frontRigelDieSensorIdx];
}

id objc_msgSend_frontRomeoNTCSensorIdx(void *a1, const char *a2, ...)
{
  return [a1 frontRomeoNTCSensorIdx];
}

id objc_msgSend_gasGaugeBatteryTemperature(void *a1, const char *a2, ...)
{
  return [a1 gasGaugeBatteryTemperature];
}

id objc_msgSend_genTGraphData(void *a1, const char *a2, ...)
{
  return [a1 genTGraphData];
}

id objc_msgSend_genTGraphHeader(void *a1, const char *a2, ...)
{
  return [a1 genTGraphHeader];
}

id objc_msgSend_getAdaptorPMUValue(void *a1, const char *a2, ...)
{
  return [a1 getAdaptorPMUValue];
}

id objc_msgSend_getCLPCPackagePowerCPUSplitFraction(void *a1, const char *a2, ...)
{
  return [a1 getCLPCPackagePowerCPUSplitFraction];
}

id objc_msgSend_getCPUTargetPower(void *a1, const char *a2, ...)
{
  return [a1 getCPUTargetPower];
}

id objc_msgSend_getChargerState(void *a1, const char *a2, ...)
{
  return [a1 getChargerState];
}

id objc_msgSend_getContextState(void *a1, const char *a2, ...)
{
  return [a1 getContextState];
}

id objc_msgSend_getCpuPowerZoneLimited(void *a1, const char *a2, ...)
{
  return [a1 getCpuPowerZoneLimited];
}

id objc_msgSend_getCurrentCPUPower(void *a1, const char *a2, ...)
{
  return [a1 getCurrentCPUPower];
}

id objc_msgSend_getCurrentGPUPower(void *a1, const char *a2, ...)
{
  return [a1 getCurrentGPUPower];
}

id objc_msgSend_getCurrentPackagePower(void *a1, const char *a2, ...)
{
  return [a1 getCurrentPackagePower];
}

id objc_msgSend_getFastDieEngagementStatus(void *a1, const char *a2, ...)
{
  return [a1 getFastDieEngagementStatus];
}

id objc_msgSend_getGPUTargetPower(void *a1, const char *a2, ...)
{
  return [a1 getGPUTargetPower];
}

id objc_msgSend_getGpuPowerZoneLimited(void *a1, const char *a2, ...)
{
  return [a1 getGpuPowerZoneLimited];
}

id objc_msgSend_getGridX(void *a1, const char *a2, ...)
{
  return [a1 getGridX];
}

id objc_msgSend_getGridY(void *a1, const char *a2, ...)
{
  return [a1 getGridY];
}

id objc_msgSend_getHIDSensorDict(void *a1, const char *a2, ...)
{
  return [a1 getHIDSensorDict];
}

id objc_msgSend_getHighestSkinTemp(void *a1, const char *a2, ...)
{
  return [a1 getHighestSkinTemp];
}

id objc_msgSend_getMaxSensorValue(void *a1, const char *a2, ...)
{
  return [a1 getMaxSensorValue];
}

id objc_msgSend_getModeratePressureVersion(void *a1, const char *a2, ...)
{
  return [a1 getModeratePressureVersion];
}

id objc_msgSend_getNANDCounter(void *a1, const char *a2, ...)
{
  return [a1 getNANDCounter];
}

id objc_msgSend_getNANDVer(void *a1, const char *a2, ...)
{
  return [a1 getNANDVer];
}

id objc_msgSend_getNVRAMCounter(void *a1, const char *a2, ...)
{
  return [a1 getNVRAMCounter];
}

id objc_msgSend_getNVRAMVer(void *a1, const char *a2, ...)
{
  return [a1 getNVRAMVer];
}

id objc_msgSend_getPMPSvc(void *a1, const char *a2, ...)
{
  return [a1 getPMPSvc];
}

id objc_msgSend_getPackageCPUPowerTarget(void *a1, const char *a2, ...)
{
  return [a1 getPackageCPUPowerTarget];
}

id objc_msgSend_getPackageGPUPowerTarget(void *a1, const char *a2, ...)
{
  return [a1 getPackageGPUPowerTarget];
}

id objc_msgSend_getPackagePowerZoneLimited(void *a1, const char *a2, ...)
{
  return [a1 getPackagePowerZoneLimited];
}

id objc_msgSend_getPackagePowerZoneMetric(void *a1, const char *a2, ...)
{
  return [a1 getPackagePowerZoneMetric];
}

id objc_msgSend_getPackageTargetPower(void *a1, const char *a2, ...)
{
  return [a1 getPackageTargetPower];
}

id objc_msgSend_getPotentialForcedThermalPressureLevel(void *a1, const char *a2, ...)
{
  return [a1 getPotentialForcedThermalPressureLevel];
}

id objc_msgSend_getPowerlogFieldCurrentValue(void *a1, const char *a2, ...)
{
  return [a1 getPowerlogFieldCurrentValue];
}

id objc_msgSend_getPowerlogKey(void *a1, const char *a2, ...)
{
  return [a1 getPowerlogKey];
}

id objc_msgSend_getProductCalibrationDefault(void *a1, const char *a2, ...)
{
  return [a1 getProductCalibrationDefault];
}

id objc_msgSend_getProductCalibrationSensorID(void *a1, const char *a2, ...)
{
  return [a1 getProductCalibrationSensorID];
}

id objc_msgSend_getProductFilterValues(void *a1, const char *a2, ...)
{
  return [a1 getProductFilterValues];
}

id objc_msgSend_getProductTotalPowerSensors(void *a1, const char *a2, ...)
{
  return [a1 getProductTotalPowerSensors];
}

id objc_msgSend_getProductTotalSensors(void *a1, const char *a2, ...)
{
  return [a1 getProductTotalSensors];
}

id objc_msgSend_getReleaseMaxLI(void *a1, const char *a2, ...)
{
  return [a1 getReleaseMaxLI];
}

id objc_msgSend_getRequiredCalibrationResistorSamples(void *a1, const char *a2, ...)
{
  return [a1 getRequiredCalibrationResistorSamples];
}

id objc_msgSend_getThermalStateofHotspot(void *a1, const char *a2, ...)
{
  return [a1 getThermalStateofHotspot];
}

id objc_msgSend_getUserUsage(void *a1, const char *a2, ...)
{
  return [a1 getUserUsage];
}

id objc_msgSend_getWatchDogMask(void *a1, const char *a2, ...)
{
  return [a1 getWatchDogMask];
}

id objc_msgSend_handleMCSThermalPressure(void *a1, const char *a2, ...)
{
  return [a1 handleMCSThermalPressure];
}

id objc_msgSend_hapticThermalGain(void *a1, const char *a2, ...)
{
  return [a1 hapticThermalGain];
}

id objc_msgSend_hidSensorKeys(void *a1, const char *a2, ...)
{
  return [a1 hidSensorKeys];
}

id objc_msgSend_hintComponentControlTakeAction(void *a1, const char *a2, ...)
{
  return [a1 hintComponentControlTakeAction];
}

id objc_msgSend_hotspotTemperature(void *a1, const char *a2, ...)
{
  return [a1 hotspotTemperature];
}

id objc_msgSend_inPocketQueue(void *a1, const char *a2, ...)
{
  return [a1 inPocketQueue];
}

id objc_msgSend_includeSolarInfo(void *a1, const char *a2, ...)
{
  return [a1 includeSolarInfo];
}

id objc_msgSend_init(void *a1, const char *a2, ...)
{
  return [a1 init];
}

id objc_msgSend_initAudioHandling(void *a1, const char *a2, ...)
{
  return [a1 initAudioHandling];
}

id objc_msgSend_initDataCollection(void *a1, const char *a2, ...)
{
  return [a1 initDataCollection];
}

id objc_msgSend_initHIDServices(void *a1, const char *a2, ...)
{
  return [a1 initHIDServices];
}

id objc_msgSend_initLocationStrings(void *a1, const char *a2, ...)
{
  return [a1 initLocationStrings];
}

id objc_msgSend_initPerfStateReportingCPU(void *a1, const char *a2, ...)
{
  return [a1 initPerfStateReportingCPU];
}

id objc_msgSend_initPerfStateReportingGPU(void *a1, const char *a2, ...)
{
  return [a1 initPerfStateReportingGPU];
}

id objc_msgSend_initPerfStateVoltagesCPU(void *a1, const char *a2, ...)
{
  return [a1 initPerfStateVoltagesCPU];
}

id objc_msgSend_initPerfStateVoltagesGPU(void *a1, const char *a2, ...)
{
  return [a1 initPerfStateVoltagesGPU];
}

id objc_msgSend_initPowerHandling(void *a1, const char *a2, ...)
{
  return [a1 initPowerHandling];
}

id objc_msgSend_initStockholmHandling(void *a1, const char *a2, ...)
{
  return [a1 initStockholmHandling];
}

id objc_msgSend_initializeLTSPersistence(void *a1, const char *a2, ...)
{
  return [a1 initializeLTSPersistence];
}

id objc_msgSend_initializeLifetimeServoStateAsPersisted(void *a1, const char *a2, ...)
{
  return [a1 initializeLifetimeServoStateAsPersisted];
}

id objc_msgSend_initializeRadio(void *a1, const char *a2, ...)
{
  return [a1 initializeRadio];
}

id objc_msgSend_initializeSemanticBrightnessHandling(void *a1, const char *a2, ...)
{
  return [a1 initializeSemanticBrightnessHandling];
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return [a1 intValue];
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return [a1 integerValue];
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return [a1 invalidate];
}

id objc_msgSend_isAccessoryAttached(void *a1, const char *a2, ...)
{
  return [a1 isAccessoryAttached];
}

id objc_msgSend_isBackLightOn(void *a1, const char *a2, ...)
{
  return [a1 isBackLightOn];
}

id objc_msgSend_isCPMSControlEnabled(void *a1, const char *a2, ...)
{
  return [a1 isCPMSControlEnabled];
}

id objc_msgSend_isContextTriggered(void *a1, const char *a2, ...)
{
  return [a1 isContextTriggered];
}

id objc_msgSend_isHotspotFirstEngaged(void *a1, const char *a2, ...)
{
  return [a1 isHotspotFirstEngaged];
}

id objc_msgSend_isIntegratorAtMin(void *a1, const char *a2, ...)
{
  return [a1 isIntegratorAtMin];
}

id objc_msgSend_isKeyboardConnected(void *a1, const char *a2, ...)
{
  return [a1 isKeyboardConnected];
}

id objc_msgSend_isNandDataValid(void *a1, const char *a2, ...)
{
  return [a1 isNandDataValid];
}

id objc_msgSend_isNvramDataValid(void *a1, const char *a2, ...)
{
  return [a1 isNvramDataValid];
}

id objc_msgSend_isR18xKeyboardAttached(void *a1, const char *a2, ...)
{
  return [a1 isR18xKeyboardAttached];
}

id objc_msgSend_isSending2DTempGridToDisplayDriverEnabled(void *a1, const char *a2, ...)
{
  return [a1 isSending2DTempGridToDisplayDriverEnabled];
}

id objc_msgSend_isSendingMaxTempToDisplayDriverEnabled(void *a1, const char *a2, ...)
{
  return [a1 isSendingMaxTempToDisplayDriverEnabled];
}

id objc_msgSend_isSensorDataValid(void *a1, const char *a2, ...)
{
  return [a1 isSensorDataValid];
}

id objc_msgSend_isVirtualTempDispatchEnabled(void *a1, const char *a2, ...)
{
  return [a1 isVirtualTempDispatchEnabled];
}

id objc_msgSend_iterateAndUpdateContexts(void *a1, const char *a2, ...)
{
  return [a1 iterateAndUpdateContexts];
}

id objc_msgSend_keyPathForInUseStatus(void *a1, const char *a2, ...)
{
  return [a1 keyPathForInUseStatus];
}

id objc_msgSend_lastPathComponent(void *a1, const char *a2, ...)
{
  return [a1 lastPathComponent];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_listOfSupervisorControl(void *a1, const char *a2, ...)
{
  return [a1 listOfSupervisorControl];
}

id objc_msgSend_listofComponentControl(void *a1, const char *a2, ...)
{
  return [a1 listofComponentControl];
}

id objc_msgSend_localMainRunloop(void *a1, const char *a2, ...)
{
  return [a1 localMainRunloop];
}

id objc_msgSend_log(void *a1, const char *a2, ...)
{
  return [a1 log];
}

id objc_msgSend_logToPowerlog(void *a1, const char *a2, ...)
{
  return [a1 logToPowerlog];
}

id objc_msgSend_logToPowerlogLite(void *a1, const char *a2, ...)
{
  return [a1 logToPowerlogLite];
}

id objc_msgSend_loopIsActive(void *a1, const char *a2, ...)
{
  return [a1 loopIsActive];
}

id objc_msgSend_mainQueue(void *a1, const char *a2, ...)
{
  return [a1 mainQueue];
}

id objc_msgSend_maxControlEffort(void *a1, const char *a2, ...)
{
  return [a1 maxControlEffort];
}

id objc_msgSend_migrateDefaultsPlist(void *a1, const char *a2, ...)
{
  return [a1 migrateDefaultsPlist];
}

id objc_msgSend_mitigationControllerListID(void *a1, const char *a2, ...)
{
  return [a1 mitigationControllerListID];
}

id objc_msgSend_mitigationDetails(void *a1, const char *a2, ...)
{
  return [a1 mitigationDetails];
}

id objc_msgSend_mitigationState(void *a1, const char *a2, ...)
{
  return [a1 mitigationState];
}

id objc_msgSend_mitigationType(void *a1, const char *a2, ...)
{
  return [a1 mitigationType];
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return [a1 mutableCopy];
}

id objc_msgSend_nameofComponent(void *a1, const char *a2, ...)
{
  return [a1 nameofComponent];
}

id objc_msgSend_notificationPort(void *a1, const char *a2, ...)
{
  return [a1 notificationPort];
}

id objc_msgSend_numberOfFields(void *a1, const char *a2, ...)
{
  return [a1 numberOfFields];
}

id objc_msgSend_nvramUpgradeStateV2toV3(void *a1, const char *a2, ...)
{
  return [a1 nvramUpgradeStateV2toV3];
}

id objc_msgSend_open(void *a1, const char *a2, ...)
{
  return [a1 open];
}

id objc_msgSend_pmuPowerService(void *a1, const char *a2, ...)
{
  return [a1 pmuPowerService];
}

id objc_msgSend_powerIsOn(void *a1, const char *a2, ...)
{
  return [a1 powerIsOn];
}

id objc_msgSend_powerSaveActive(void *a1, const char *a2, ...)
{
  return [a1 powerSaveActive];
}

id objc_msgSend_powerSensors(void *a1, const char *a2, ...)
{
  return [a1 powerSensors];
}

id objc_msgSend_powerTarget(void *a1, const char *a2, ...)
{
  return [a1 powerTarget];
}

id objc_msgSend_predictSignal(void *a1, const char *a2, ...)
{
  return [a1 predictSignal];
}

id objc_msgSend_proModeActive(void *a1, const char *a2, ...)
{
  return [a1 proModeActive];
}

id objc_msgSend_probeAllSupervisorControlLoadingIndex(void *a1, const char *a2, ...)
{
  return [a1 probeAllSupervisorControlLoadingIndex];
}

id objc_msgSend_publishDetailedMitigationArrayToCPMS(void *a1, const char *a2, ...)
{
  return [a1 publishDetailedMitigationArrayToCPMS];
}

id objc_msgSend_queryThermalSensorInfo(void *a1, const char *a2, ...)
{
  return [a1 queryThermalSensorInfo];
}

id objc_msgSend_readKeysFromSensorDispatcher(void *a1, const char *a2, ...)
{
  return [a1 readKeysFromSensorDispatcher];
}

id objc_msgSend_readNVRAM(void *a1, const char *a2, ...)
{
  return [a1 readNVRAM];
}

id objc_msgSend_readReleaseRateForAllComponents(void *a1, const char *a2, ...)
{
  return [a1 readReleaseRateForAllComponents];
}

id objc_msgSend_rearCameraJasperSensorIdx(void *a1, const char *a2, ...)
{
  return [a1 rearCameraJasperSensorIdx];
}

id objc_msgSend_rearCameraSensorIdx(void *a1, const char *a2, ...)
{
  return [a1 rearCameraSensorIdx];
}

id objc_msgSend_rearCameraSuperWideSensorIdx(void *a1, const char *a2, ...)
{
  return [a1 rearCameraSuperWideSensorIdx];
}

id objc_msgSend_rearCameraTeleSensorIdx(void *a1, const char *a2, ...)
{
  return [a1 rearCameraTeleSensorIdx];
}

id objc_msgSend_refreshCPMSTGraphTelemetry(void *a1, const char *a2, ...)
{
  return [a1 refreshCPMSTGraphTelemetry];
}

id objc_msgSend_refreshFunctionalTelemetry(void *a1, const char *a2, ...)
{
  return [a1 refreshFunctionalTelemetry];
}

id objc_msgSend_refreshTGraphTelemetry(void *a1, const char *a2, ...)
{
  return [a1 refreshTGraphTelemetry];
}

id objc_msgSend_registerChargerNotification(void *a1, const char *a2, ...)
{
  return [a1 registerChargerNotification];
}

id objc_msgSend_registerDefaultsDomain(void *a1, const char *a2, ...)
{
  return [a1 registerDefaultsDomain];
}

id objc_msgSend_registerDisplayNotification(void *a1, const char *a2, ...)
{
  return [a1 registerDisplayNotification];
}

id objc_msgSend_registerForFolioEvents(void *a1, const char *a2, ...)
{
  return [a1 registerForFolioEvents];
}

id objc_msgSend_registerForKeyboardEvents(void *a1, const char *a2, ...)
{
  return [a1 registerForKeyboardEvents];
}

id objc_msgSend_registerForThermalReport(void *a1, const char *a2, ...)
{
  return [a1 registerForThermalReport];
}

id objc_msgSend_releaseMaxLI(void *a1, const char *a2, ...)
{
  return [a1 releaseMaxLI];
}

id objc_msgSend_removeAllObjects(void *a1, const char *a2, ...)
{
  return [a1 removeAllObjects];
}

id objc_msgSend_removeHotspotTargetOverrides(void *a1, const char *a2, ...)
{
  return [a1 removeHotspotTargetOverrides];
}

id objc_msgSend_removeLightPressureOverride(void *a1, const char *a2, ...)
{
  return [a1 removeLightPressureOverride];
}

id objc_msgSend_requestListID(void *a1, const char *a2, ...)
{
  return [a1 requestListID];
}

id objc_msgSend_resetCPMSMitigationState(void *a1, const char *a2, ...)
{
  return [a1 resetCPMSMitigationState];
}

id objc_msgSend_resetHIDSensorDictionary(void *a1, const char *a2, ...)
{
  return [a1 resetHIDSensorDictionary];
}

id objc_msgSend_resetTargetTemperature(void *a1, const char *a2, ...)
{
  return [a1 resetTargetTemperature];
}

id objc_msgSend_resetVTFilterState(void *a1, const char *a2, ...)
{
  return [a1 resetVTFilterState];
}

id objc_msgSend_resolvePersistentLTSState(void *a1, const char *a2, ...)
{
  return [a1 resolvePersistentLTSState];
}

id objc_msgSend_seedControlEffort(void *a1, const char *a2, ...)
{
  return [a1 seedControlEffort];
}

id objc_msgSend_sendLTSStateToPMP(void *a1, const char *a2, ...)
{
  return [a1 sendLTSStateToPMP];
}

id objc_msgSend_sendRadioNotification(void *a1, const char *a2, ...)
{
  return [a1 sendRadioNotification];
}

id objc_msgSend_sendSensorExchangeDataToSMC(void *a1, const char *a2, ...)
{
  return [a1 sendSensorExchangeDataToSMC];
}

id objc_msgSend_sensorFourCharCode(void *a1, const char *a2, ...)
{
  return [a1 sensorFourCharCode];
}

id objc_msgSend_setAdditionalRadioMitigations(void *a1, const char *a2, ...)
{
  return [a1 setAdditionalRadioMitigations];
}

id objc_msgSend_setMaxTransmitPower(void *a1, const char *a2, ...)
{
  return [a1 setMaxTransmitPower];
}

id objc_msgSend_setPackageLowPowerTarget(void *a1, const char *a2, ...)
{
  return [a1 setPackageLowPowerTarget];
}

id objc_msgSend_setPackagePowerZoneTarget(void *a1, const char *a2, ...)
{
  return [a1 setPackagePowerZoneTarget];
}

id objc_msgSend_setup2DGridDisplayDriver(void *a1, const char *a2, ...)
{
  return [a1 setup2DGridDisplayDriver];
}

id objc_msgSend_sharedAVSystemController(void *a1, const char *a2, ...)
{
  return [a1 sharedAVSystemController];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return [a1 sharedInstance];
}

id objc_msgSend_shouldDoCPMSActions(void *a1, const char *a2, ...)
{
  return [a1 shouldDoCPMSActions];
}

id objc_msgSend_shouldEnforceLightThermalPressure(void *a1, const char *a2, ...)
{
  return [a1 shouldEnforceLightThermalPressure];
}

id objc_msgSend_shouldSuppressMitigations(void *a1, const char *a2, ...)
{
  return [a1 shouldSuppressMitigations];
}

id objc_msgSend_simulateLightThermalPressure(void *a1, const char *a2, ...)
{
  return [a1 simulateLightThermalPressure];
}

id objc_msgSend_solarBehaviorSuppressed(void *a1, const char *a2, ...)
{
  return [a1 solarBehaviorSuppressed];
}

id objc_msgSend_speakerThermalGain(void *a1, const char *a2, ...)
{
  return [a1 speakerThermalGain];
}

id objc_msgSend_stockholmFieldDetectInProgressUntilTime(void *a1, const char *a2, ...)
{
  return [a1 stockholmFieldDetectInProgressUntilTime];
}

id objc_msgSend_stringValue(void *a1, const char *a2, ...)
{
  return [a1 stringValue];
}

id objc_msgSend_suppressStandardBehaviors(void *a1, const char *a2, ...)
{
  return [a1 suppressStandardBehaviors];
}

id objc_msgSend_synchContext(void *a1, const char *a2, ...)
{
  return [a1 synchContext];
}

id objc_msgSend_synchronize(void *a1, const char *a2, ...)
{
  return [a1 synchronize];
}

id objc_msgSend_synchronizeToFile(void *a1, const char *a2, ...)
{
  return [a1 synchronizeToFile];
}

id objc_msgSend_synthSensorKeys(void *a1, const char *a2, ...)
{
  return [a1 synthSensorKeys];
}

id objc_msgSend_targetQueue(void *a1, const char *a2, ...)
{
  return [a1 targetQueue];
}

id objc_msgSend_testLoadingIndexLevel(void *a1, const char *a2, ...)
{
  return [a1 testLoadingIndexLevel];
}

id objc_msgSend_thermalPressureLevel(void *a1, const char *a2, ...)
{
  return [a1 thermalPressureLevel];
}

id objc_msgSend_thermalState(void *a1, const char *a2, ...)
{
  return [a1 thermalState];
}

id objc_msgSend_torchState(void *a1, const char *a2, ...)
{
  return [a1 torchState];
}

id objc_msgSend_totalSensors(void *a1, const char *a2, ...)
{
  return [a1 totalSensors];
}

id objc_msgSend_unsignedIntValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedIntValue];
}

id objc_msgSend_unsignedIntegerValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedIntegerValue];
}

id objc_msgSend_unsignedLongLongValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedLongLongValue];
}

id objc_msgSend_update(void *a1, const char *a2, ...)
{
  return [a1 update];
}

id objc_msgSend_updateAllSensorExchangeData(void *a1, const char *a2, ...)
{
  return [a1 updateAllSensorExchangeData];
}

id objc_msgSend_updateCPU(void *a1, const char *a2, ...)
{
  return [a1 updateCPU];
}

id objc_msgSend_updateContextActiveState(void *a1, const char *a2, ...)
{
  return [a1 updateContextActiveState];
}

id objc_msgSend_updateContextualClamp(void *a1, const char *a2, ...)
{
  return [a1 updateContextualClamp];
}

id objc_msgSend_updateCoreAnalyticsInfo(void *a1, const char *a2, ...)
{
  return [a1 updateCoreAnalyticsInfo];
}

id objc_msgSend_updateDieTempTarget(void *a1, const char *a2, ...)
{
  return [a1 updateDieTempTarget];
}

id objc_msgSend_updateGPU(void *a1, const char *a2, ...)
{
  return [a1 updateGPU];
}

id objc_msgSend_updateKeyboardState(void *a1, const char *a2, ...)
{
  return [a1 updateKeyboardState];
}

id objc_msgSend_updateLifetimeServo(void *a1, const char *a2, ...)
{
  return [a1 updateLifetimeServo];
}

id objc_msgSend_updateLiteModePowerLogDictionaryForSensors(void *a1, const char *a2, ...)
{
  return [a1 updateLiteModePowerLogDictionaryForSensors];
}

id objc_msgSend_updateMaxLIFloorsAndCeilings(void *a1, const char *a2, ...)
{
  return [a1 updateMaxLIFloorsAndCeilings];
}

id objc_msgSend_updateNotifyTokens(void *a1, const char *a2, ...)
{
  return [a1 updateNotifyTokens];
}

id objc_msgSend_updatePackage(void *a1, const char *a2, ...)
{
  return [a1 updatePackage];
}

id objc_msgSend_updatePerfStateReportingCPU(void *a1, const char *a2, ...)
{
  return [a1 updatePerfStateReportingCPU];
}

id objc_msgSend_updatePerfStateReportingGPU(void *a1, const char *a2, ...)
{
  return [a1 updatePerfStateReportingGPU];
}

id objc_msgSend_updatePersistedState(void *a1, const char *a2, ...)
{
  return [a1 updatePersistedState];
}

id objc_msgSend_updatePowerLogDictionaryForSensors(void *a1, const char *a2, ...)
{
  return [a1 updatePowerLogDictionaryForSensors];
}

id objc_msgSend_updatePowerzoneTelemetry(void *a1, const char *a2, ...)
{
  return [a1 updatePowerzoneTelemetry];
}

id objc_msgSend_updateSensorExchangeTelemetry(void *a1, const char *a2, ...)
{
  return [a1 updateSensorExchangeTelemetry];
}

id objc_msgSend_userContext(void *a1, const char *a2, ...)
{
  return [a1 userContext];
}

id objc_msgSend_usesPackagePowerControl(void *a1, const char *a2, ...)
{
  return [a1 usesPackagePowerControl];
}

id objc_msgSend_voltage(void *a1, const char *a2, ...)
{
  return [a1 voltage];
}

id objc_msgSend_wakeInProgressUntilTime(void *a1, const char *a2, ...)
{
  return [a1 wakeInProgressUntilTime];
}

id objc_msgSend_xpcNotifyForMitigationsUI(void *a1, const char *a2, ...)
{
  return [a1 xpcNotifyForMitigationsUI];
}