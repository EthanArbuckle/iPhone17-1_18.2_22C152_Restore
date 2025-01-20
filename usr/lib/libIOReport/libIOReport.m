uint64_t IOReportHistogramGetBucketCount(const __CFDictionary *a1)
{
  int ChannelType;
  uint64_t result;
  unint64_t v3;

  if (!a1) {
    return 0xFFFFFFFFLL;
  }
  v3 = 0;
  ChannelType = getChannelType(a1, &v3);
  result = 0xFFFFFFFFLL;
  if (!ChannelType && v3 == 3) {
    return WORD2(v3);
  }
  return result;
}

void _iterSubDicts(CFTypeRef cf, const void *a2, uint64_t a3)
{
  if (!*(unsigned char *)(a3 + 60) || (*(unsigned char *)(a3 + 56) & 1) == 0)
  {
    if (cf)
    {
      if (a2)
      {
        CFTypeID v6 = CFGetTypeID(cf);
        if (v6 == CFStringGetTypeID())
        {
          CFTypeID v7 = CFGetTypeID(a2);
          if (v7 == CFDictionaryGetTypeID())
          {
            CFDictionaryRef v8 = *(const __CFDictionary **)(a3 + 48);
            if (v8) {
              CFDictionaryGetValue(v8, cf);
            }
            uint64_t v9 = *(void *)(a3 + 40);
            int v10 = _iterate((CFDictionaryRef)a2);
            if (*(unsigned char *)(a3 + 60)) {
              v10 |= *(_DWORD *)(a3 + 56);
            }
            *(_DWORD *)(a3 + 56) = v10;
            if ((v10 & 1) == 0)
            {
              if (v9)
              {
                *(_DWORD *)(a3 + 56) = 273;
              }
              else
              {
                v11 = *(__CFDictionary **)(a3 + 40);
                if (v11)
                {
                  CFDictionarySetValue(v11, cf, 0);
                }
                else if (*(void *)(a3 + 32))
                {
                  if (!CFDictionaryGetCount((CFDictionaryRef)a2)) {
                    CFArrayAppendValue(*(CFMutableArrayRef *)(a3 + 32), cf);
                  }
                }
              }
            }
          }
        }
      }
    }
  }
}

unint64_t IOReportHistogramGetBucketHits(const __CFDictionary *a1, int a2)
{
  memset(v3, 0, sizeof(v3));
  if (_getHistogramValues(a1, a2, v3)) {
    return 0x8000000000000000;
  }
  else {
    return *(void *)&v3[0];
  }
}

uint64_t _getHistogramValues(const __CFDictionary *a1, int a2, _OWORD *a3)
{
  uint64_t v3 = 3758097084;
  unsigned __int16 v13 = 0;
  if (a1)
  {
    RawElements = getRawElements(a1, &v13, 3);
    if (RawElements)
    {
      CFDictionaryRef v8 = RawElements;
      int v9 = v13;
      unint64_t v14 = 0;
      if (!getChannelType(a1, &v14) && v14 == 3 && WORD2(v14) == v9 && v13 >= a2)
      {
        uint64_t v3 = 0;
        int v10 = &v8[64 * (uint64_t)a2];
        long long v11 = *((_OWORD *)v10 + 3);
        *a3 = *((_OWORD *)v10 + 2);
        a3[1] = v11;
      }
    }
  }
  return v3;
}

const void *IOReportChannelGetUnitLabel(const __CFDictionary *a1)
{
  Value = CFDictionaryGetValue(a1, @"UnitLabel");
  if (!Value)
  {
    unint64_t Unit = IOReportChannelGetUnit(a1);
    if (Unit == 0x8000000000000000)
    {
      return 0;
    }
    else
    {
      Value = copyUnitLabel(Unit);
      if (Value)
      {
        CFDictionarySetValue(a1, @"UnitLabel", Value);
        CFRelease(Value);
      }
    }
  }
  return Value;
}

unint64_t IOReportChannelGetUnit(const __CFDictionary *a1)
{
  if (!a1) {
    return 0x8000000000000000;
  }
  CFDictionaryRef ChannelConfigDict = (const __CFDictionary *)_getChannelConfigDict(a1);
  if (!ChannelConfigDict) {
    return 0x8000000000000000;
  }
  Value = CFDictionaryGetValue(ChannelConfigDict, @"IOReportChannelUnit");

  return _validateInt(Value);
}

const void *_getChannelConfigDict(const __CFDictionary *a1)
{
  result = CFDictionaryGetValue(a1, @"IOReportChannelInfo");
  if (result)
  {
    v2 = result;
    CFTypeID v3 = CFGetTypeID(result);
    if (v3 == CFDictionaryGetTypeID()) {
      return v2;
    }
    else {
      return 0;
    }
  }
  return result;
}

CFStringRef copyUnitLabel(unint64_t a1)
{
  int v6 = 0;
  if (a1 == 0x8000000000000000) {
    return 0;
  }
  uint64_t v3 = a1 & 0xFFFFFFFFFFFFFFLL;
  if ((a1 & 0xFFFFFFFFFFFFFFLL) <= 0x8BFFFFFFFFFFLL)
  {
    if ((a1 & 0xFFFFFFFFFFFFFFLL) > 0x7BFFFFFFFFLL)
    {
      if ((a1 & 0xFFFFFFFFFFFFFFLL) > 0x87FFFFFFFFLL)
      {
        if (v3 == 0x8800000000 || v3 == 0x8B00000000 || v3 == 0x890000000000) {
          goto LABEL_52;
        }
      }
      else if (v3 == 0x7C00000000 || v3 == 0x8200000000 || v3 == 0x8500000000)
      {
        goto LABEL_52;
      }
LABEL_53:
      unint64_t v5 = HIBYTE(a1);
      v4 = "";
      switch(HIBYTE(a1))
      {
        case 0u:
          return CFStringCreateWithFormat(0, 0, @"%s%s", &v6, v4);
        case 1u:
          v4 = "s";
          break;
        case 2u:
          v4 = "W";
          break;
        case 3u:
          v4 = "J";
          break;
        case 4u:
          v4 = "A";
          break;
        case 5u:
          v4 = "V";
          break;
        case 6u:
          v4 = "F";
          break;
        case 7u:
          v4 = "H";
          break;
        case 8u:
          v4 = "Hz";
          break;
        case 9u:
          if (!v3) {
            v4 = "b";
          }
          if (v3 == 0x820000000000) {
            v4 = "B";
          }
          break;
        case 0xAu:
          v4 = "C";
          break;
        default:
          if (v5 == 100)
          {
            v4 = "events";
          }
          else if (v5 == 101)
          {
            v4 = "packets";
          }
          else
          {
            v4 = "??";
          }
          break;
      }
      return CFStringCreateWithFormat(0, 0, @"%s%s", &v6, v4);
    }
    if ((a1 & 0xFFFFFFFFFFFFFFLL) <= 0x7600000000)
    {
      if (v3 == 0x7300000000 || v3 == 0x7600000000) {
        goto LABEL_52;
      }
      goto LABEL_53;
    }
    if (v3 == 0x7600000001) {
      goto LABEL_44;
    }
    if (v3 != 0x7900000000)
    {
      if (v3 != 0x7980000018) {
        goto LABEL_53;
      }
LABEL_44:
      __strlcat_chk();
      v4 = "ticks";
      return CFStringCreateWithFormat(0, 0, @"%s%s", &v6, v4);
    }
LABEL_52:
    __strlcat_chk();
    goto LABEL_53;
  }
  if ((a1 & 0xFFFFFFFFFFFFFFLL) <= 0x9CFFFFFFFFFFLL)
  {
    if ((a1 & 0xFFFFFFFFFFFFFFLL) <= 0x8C0000000007)
    {
      if (v3 == 0x8C0000000000 || v3 == 0x8C0000000004) {
        goto LABEL_52;
      }
    }
    else if (v3 == 0x8C0000000008 || v3 == 0x930000000000 || v3 == 0x960000000000)
    {
      goto LABEL_52;
    }
    goto LABEL_53;
  }
  if ((a1 & 0xFFFFFFFFFFFFFFLL) <= 0xA9FFFFFFFFFFLL)
  {
    if (v3 == 0x9D0000000000 || v3 == 0xA00000000000 || v3 == 0xA70000000000) {
      goto LABEL_52;
    }
    goto LABEL_53;
  }
  switch(v3)
  {
    case 0xAA0000000000:
      goto LABEL_52;
    case 0x1000000000000:
      v4 = "hwticks?";
      break;
    case 0x2000000000000:
      v4 = "hwpage?";
      break;
    default:
      goto LABEL_53;
  }
  return CFStringCreateWithFormat(0, 0, @"%s%s", &v6, v4);
}

__CFDictionary *IOReportCreateSamplesDelta(const __CFDictionary *a1, const __CFDictionary *a2, uint64_t a3)
{
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 0x40000000;
  v4[2] = __IOReportCreateSamplesDelta_block_invoke;
  v4[3] = &__block_descriptor_tmp_2;
  v4[4] = a3;
  return compareAggregates(a1, a2, (uint64_t)v4);
}

__CFDictionary *compareAggregates(const __CFDictionary *a1, CFDictionaryRef theDict, uint64_t a3)
{
  int v10 = 0;
  uint64_t v9 = 0;
  long long v7 = 0u;
  long long v8 = 0u;
  long long v4 = 0u;
  uint64_t v5 = 0;
  uint64_t v6 = a3;
  if (_iterate(theDict, a1, &v4, &v10)) {
    return 0;
  }
  else {
    return v10;
  }
}

uint64_t IOReportIterate(const __CFDictionary *a1, uint64_t a2)
{
  long long v6 = 0u;
  long long v7 = 0u;
  long long v4 = 0u;
  long long v5 = 0u;
  uint64_t v3 = a2;
  return _iterate(a1, 0, &v3, 0);
}

unint64_t IOReportStateGetInTransitions(const __CFDictionary *a1, int a2)
{
  memset(v3, 0, sizeof(v3));
  if (_getStateValues(a1, a2, v3)) {
    return 0x8000000000000000;
  }
  else {
    return *((void *)&v3[0] + 1);
  }
}

__CFDictionary *IOReportCreateSamples(uint64_t a1, const __CFDictionary *a2, CFErrorRef *a3)
{
  if (a1 && a2)
  {
    if (_updateKernelBuffer(a1, a3)
      || (CFDataRef v7 = CFDataCreateWithBytesNoCopy(0, *(const UInt8 **)(a1 + 32), *(void *)(a1 + 40), (CFAllocatorRef)*MEMORY[0x263EFFB28])) == 0)
    {
      SamplesRaw = 0;
      if (!a3) {
        return SamplesRaw;
      }
    }
    else
    {
      CFDataRef v8 = v7;
      SamplesRaw = IOReportCreateSamplesRaw(a2, v7, a3);
      CFRelease(v8);
      if (!a3) {
        return SamplesRaw;
      }
    }
  }
  else
  {
    if (!a3) {
      return 0;
    }
    SamplesRaw = 0;
    *a3 = createCFErr(-536870206, 0);
    if (!a3) {
      return SamplesRaw;
    }
  }
  if (!SamplesRaw)
  {
    if (!*a3)
    {
      SamplesRaw = 0;
      *a3 = createCFErr(-536870212, "unknown error");
      return SamplesRaw;
    }
    return 0;
  }
  return SamplesRaw;
}

uint64_t _updateKernelBuffer(uint64_t a1, CFErrorRef *a2)
{
  uint64_t v3 = IOConnectCallMethod(*(_DWORD *)(a1 + 16), 3u, (const uint64_t *)(a1 + 24), 1u, 0, 0, 0, 0, 0, 0);
  uint64_t v4 = v3;
  if (a2 && v3) {
    *a2 = createCFErr((int)v3, "_updateKernelBuffer() failed");
  }
  return v4;
}

__CFDictionary *IOReportCreateSamplesRaw(const __CFDictionary *a1, CFDataRef theData, CFErrorRef *a3)
{
  long long v5 = 0;
  uint64_t v15 = 0;
  v16 = &v15;
  uint64_t v17 = 0x4800000000;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  CFIndex v6 = -536870206;
  if (!a1 || !theData)
  {
LABEL_5:
    if (!a3) {
      goto LABEL_16;
    }
    goto LABEL_13;
  }
  if (CFDataGetLength(theData) < 64)
  {
    long long v5 = 0;
    CFIndex v6 = -536870206;
    goto LABEL_5;
  }
  CFIndex Length = CFDataGetLength(theData);
  if (Length >= 0) {
    CFIndex v9 = Length;
  }
  else {
    CFIndex v9 = Length + 63;
  }
  BytePtr = CFDataGetBytePtr(theData);
  long long v11 = v16;
  v16[3] = (uint64_t)BytePtr;
  v11[4] = (uint64_t)&BytePtr[v9 & 0xFFFFFFFFFFFFFFC0];
  *((_DWORD *)v11 + 15) = 0;
  *((_DWORD *)v11 + 16) = 0;
  uint64_t v12 = MEMORY[0x263EF8330];
  v11[5] = 0;
  v11[6] = 0;
  *((unsigned char *)v11 + 56) = 0;
  v14[0] = v12;
  v14[1] = 0x40000000;
  v14[2] = __IOReportCreateSamplesRaw_block_invoke;
  v14[3] = &unk_264131560;
  v14[4] = &v15;
  v14[5] = a3;
  long long v5 = cloneAggregate(a1, (unint64_t)v14);
  if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEBUG)) {
    IOReportIterateSamplesRaw_cold_1();
  }
  CFIndex v6 = -536870212;
  if (a3)
  {
LABEL_13:
    if (!v5 && !*a3) {
      *a3 = createCFErr(v6, "couldn't create samples");
    }
  }
LABEL_16:
  _Block_object_dispose(&v15, 8);
  return v5;
}

__CFDictionary *cloneAggregate(const __CFDictionary *a1, unint64_t a2)
{
  CFIndex v6 = 0;
  uint64_t v5 = 0;
  _OWORD v3[2] = 0u;
  long long v4 = 0u;
  v3[0] = 0u;
  BYTE12(v4) = 1;
  v3[1] = a2;
  if (_iterate(a1, 0, v3, &v6)) {
    return 0;
  }
  else {
    return v6;
  }
}

unint64_t IOReportStateGetResidency(const __CFDictionary *a1, int a2)
{
  long long v3 = 0u;
  long long v4 = 0u;
  if (_getStateValues(a1, a2, &v3)) {
    return 0x8000000000000000;
  }
  else {
    return v4;
  }
}

double IOReportStateGetDutyCycle(const __CFDictionary *a1, int a2)
{
  if (!a1) {
    return NAN;
  }
  long long v8 = 0u;
  long long v9 = 0u;
  unint64_t v10 = 0;
  if (!getChannelType(a1, &v10) && v10 == 2)
  {
    int v4 = WORD2(v10);
    if (WORD2(v10))
    {
      unint64_t v5 = 0;
      int v6 = 0;
      while (!_getStateValues(a1, v6, &v8))
      {
        v5 += v9;
        if (v4 == ++v6)
        {
          if (v5 && !_getStateValues(a1, a2, &v8)) {
            return (double)(unint64_t)v9 / (double)v5;
          }
          return NAN;
        }
      }
    }
  }
  return NAN;
}

__CFString *IOReportChannelGetChannelName(const __CFDictionary *a1)
{
  Value = (__CFString *)CFDictionaryGetValue(a1, @"ChannelName");
  if (!Value)
  {
    ChDetail = _getChDetail(a1, 2u);
    int v4 = (__CFString *)_validateStr(ChDetail);
    if (v4)
    {
      Value = v4;
      CFDictionarySetValue(a1, @"ChannelName", v4);
    }
    else
    {
      unint64_t v5 = _getChDetail(a1, 0);
      unint64_t v6 = _validateInt(v5);
      CFStringRef v7 = copyPrintableIDString(v6);
      CFStringRef v8 = v7;
      Value = @"<unknown>";
      if (v7) {
        long long v9 = (__CFString *)v7;
      }
      else {
        long long v9 = @"<unknown>";
      }
      CFDictionarySetValue(a1, @"ChannelName", v9);
      if (v8)
      {
        CFRelease(v8);
        return (__CFString *)v8;
      }
    }
  }
  return Value;
}

const void *_validateStr(const void *result)
{
  if (result)
  {
    v1 = result;
    CFTypeID v2 = CFGetTypeID(result);
    if (v2 == CFStringGetTypeID()) {
      return v1;
    }
    else {
      return 0;
    }
  }
  return result;
}

uint64_t _iterate(CFDictionaryRef theDict, const __CFDictionary *a2, void *a3, __CFDictionary **a4)
{
  if (!theDict || !a2 && a3[3]) {
    goto LABEL_4;
  }
  if (*((_OWORD *)a3 + 1) == 0)
  {
    Mutable = 0;
  }
  else
  {
    Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
    if (!Mutable)
    {
LABEL_4:
      unsigned int v8 = 0;
      unsigned int v9 = 273;
      goto LABEL_5;
    }
  }
  CFArrayRef v12 = (const __CFArray *)CFDictionaryGetValue(theDict, @"IOReportChannels");
  if (v12)
  {
    CFArrayRef v13 = v12;
    CFTypeID v14 = CFGetTypeID(v12);
    if (v14 != CFArrayGetTypeID())
    {
LABEL_17:
      unsigned int v8 = 0;
LABEL_93:
      unsigned int v9 = 273;
      goto LABEL_94;
    }
    if (a2)
    {
      CFArrayRef v15 = (const __CFArray *)CFDictionaryGetValue(a2, @"IOReportChannels");
      if (!v15) {
        goto LABEL_17;
      }
      CFArrayRef v16 = v15;
      CFTypeID v17 = CFGetTypeID(v15);
      if (v17 != CFArrayGetTypeID()) {
        goto LABEL_17;
      }
    }
    else
    {
      CFArrayRef v16 = 0;
    }
    CFArrayRef theArray = v16;
    uint64_t Count = CFArrayGetCount(v13);
    if (a3[2] || a3[3])
    {
      long long v19 = CFArrayCreateMutable(0, Count, MEMORY[0x263EFFF70]);
      if (!v19)
      {
        unsigned int v9 = 273;
        unsigned int v8 = 273;
        goto LABEL_94;
      }
    }
    else
    {
      long long v19 = 0;
    }
    if (Count >= 1)
    {
      CFIndex v37 = 0;
      CFArrayRef v38 = v13;
      CFIndex v20 = 0;
      CFMutableDictionaryRef value = 0;
      unsigned int v8 = 0;
      CFMutableArrayRef v41 = v19;
      while (1)
      {
        CFIndex v43 = Count;
        CFDictionaryRef ChannelAtIndex = (const __CFDictionary *)_getChannelAtIndex(v13, v20);
        if (!ChannelAtIndex)
        {
          unsigned int v8 = 273;
          goto LABEL_85;
        }
        CFDictionaryRef v22 = ChannelAtIndex;
        if (v19)
        {
          CFMutableDictionaryRef value = CFDictionaryCreateMutableCopy(0, 0, ChannelAtIndex);
          if (!value)
          {
            CFMutableDictionaryRef v35 = 0;
            unsigned int v8 = 273;
            goto LABEL_86;
          }
        }
        CFDictionaryRef v23 = theArray;
        if (theArray)
        {
          if (v20 >= CFArrayGetCount(theArray))
          {
            CFDictionaryRef v23 = 0;
          }
          else
          {
            unint64_t v45 = 0;
            unint64_t v46 = 0;
            CFDictionaryRef v24 = (const __CFDictionary *)_getChannelAtIndex(theArray, v20);
            if (!v24) {
              goto LABEL_81;
            }
            CFDictionaryRef v23 = v24;
            if (getChannelType(v22, &v46)) {
              goto LABEL_81;
            }
            unint64_t ChannelID = IOReportChannelGetChannelID(v22);
            unint64_t DriverID = IOReportChannelGetDriverID(v22);
            if (getChannelType(v23, &v45)) {
              goto LABEL_81;
            }
            unint64_t v25 = IOReportChannelGetChannelID(v23);
            unint64_t v26 = IOReportChannelGetDriverID(v23);
            if (v45 != v46 || v25 != ChannelID || v26 != DriverID)
            {
              unint64_t v36 = v26;
              CFIndex v27 = v37;
              if (!v37) {
                CFIndex v27 = v20 + 1;
              }
              CFArrayRef v28 = theArray;
              CFIndex v37 = v27;
              if (v27 < CFArrayGetCount(theArray))
              {
                while (1)
                {
                  CFDictionaryRef v29 = (const __CFDictionary *)_getChannelAtIndex(v28, v27);
                  if (!v29) {
                    break;
                  }
                  CFDictionaryRef v23 = v29;
                  if (getChannelType(v29, &v45)) {
                    break;
                  }
                  unint64_t v30 = IOReportChannelGetChannelID(v23);
                  if (v45 == v46 && v30 == ChannelID && v36 == DriverID)
                  {
                    CFIndex v37 = v27 + 1;
                    goto LABEL_54;
                  }
                  ++v27;
                  CFArrayRef v28 = theArray;
                  if (v27 >= CFArrayGetCount(theArray)) {
                    goto LABEL_53;
                  }
                }
LABEL_81:
                unsigned int v8 = 273;
                CFArrayRef v13 = v38;
LABEL_82:
                long long v19 = v41;
                goto LABEL_85;
              }
LABEL_53:
              CFDictionaryRef v23 = 0;
            }
LABEL_54:
            CFArrayRef v13 = v38;
          }
        }
        if (*a3) {
          break;
        }
        uint64_t v33 = a3[1];
        if (!v33)
        {
          uint64_t v34 = a3[2];
          if (v34)
          {
            unsigned int v31 = (*(uint64_t (**)(uint64_t, const __CFDictionary *, CFMutableDictionaryRef))(v34 + 16))(v34, v22, value);
          }
          else
          {
            if (!a3[3]) {
              goto LABEL_98;
            }
            if (!v23)
            {
              long long v19 = v41;
              if (!v41)
              {
                unsigned int v32 = 0;
                goto LABEL_67;
              }
LABEL_62:
              CFArrayAppendValue(v19, value);
              unsigned int v32 = 0;
LABEL_66:
              CFRelease(value);
              CFMutableDictionaryRef value = 0;
              goto LABEL_67;
            }
            if (cloneElements(value, v23, 1))
            {
LABEL_98:
              unsigned int v8 = 273;
              goto LABEL_82;
            }
            unsigned int v31 = (*(uint64_t (**)(void))(a3[3] + 16))();
          }
          goto LABEL_58;
        }
        unsigned int v32 = (*(uint64_t (**)(uint64_t, const __CFDictionary *))(v33 + 16))(v33, v22);
        if (v32 == 16)
        {
          CFArrayRemoveValueAtIndex(v13, v20--);
          --v43;
          long long v19 = v41;
          if (v41) {
            goto LABEL_66;
          }
          goto LABEL_67;
        }
LABEL_59:
        long long v19 = v41;
        if (v32)
        {
          unsigned int v8 = v32;
          goto LABEL_85;
        }
        if (v41)
        {
          if (!v32) {
            goto LABEL_62;
          }
          goto LABEL_66;
        }
LABEL_67:
        v8 |= v32;
        ++v20;
        uint64_t Count = v43;
        if (v20 >= v43) {
          goto LABEL_79;
        }
      }
      unsigned int v31 = (*(uint64_t (**)(void, const __CFDictionary *))(*a3 + 16))(*a3, v22);
LABEL_58:
      unsigned int v32 = v31;
      goto LABEL_59;
    }
    unsigned int v8 = 0;
    CFMutableDictionaryRef value = 0;
LABEL_79:
    if (Mutable) {
      CFDictionarySetValue(Mutable, @"IOReportChannels", v19);
    }
LABEL_85:
    CFMutableDictionaryRef v35 = value;
    if (v19) {
LABEL_86:
    }
      CFRelease(v19);
    if (v35) {
      CFRelease(v35);
    }
    if (v8) {
      goto LABEL_93;
    }
    if (a3[1] && !CFArrayGetCount(v13)) {
      CFDictionaryRemoveValue(theDict, @"IOReportChannels");
    }
  }
  else
  {
    unsigned int v8 = 0;
  }
  v8 |= _iterSubDictsForKey(theDict, @"IOReportDrivers", Mutable, a2, (uint64_t)a3);
  if (v8) {
    goto LABEL_93;
  }
  v8 |= _iterSubDictsForKey(theDict, @"IOReportChannelGroups", Mutable, a2, (uint64_t)a3);
  if (v8) {
    goto LABEL_93;
  }
  if (!Mutable)
  {
    unsigned int v9 = v8;
    goto LABEL_5;
  }
  if (!a4) {
    goto LABEL_93;
  }
  *a4 = Mutable;
  unsigned int v9 = v8;
LABEL_94:
  if (Mutable && (v9 & 1) != 0) {
    CFRelease(Mutable);
  }
LABEL_5:
  if (v8) {
    return v8;
  }
  else {
    return v9;
  }
}

uint64_t getChannelType(const __CFDictionary *a1, unint64_t *a2)
{
  ChDetail = _getChDetail(a1, 1u);
  unint64_t v4 = _validateInt(ChDetail);
  if (v4 == 0x8000000000000000) {
    return 3758097084;
  }
  unint64_t v6 = v4;
  uint64_t result = 0;
  *a2 = v6;
  return result;
}

unint64_t _validateInt(const void *a1)
{
  if (!a1) {
    return 0x8000000000000000;
  }
  CFTypeID v2 = CFGetTypeID(a1);
  unint64_t v3 = 0x8000000000000000;
  if (v2 == CFNumberGetTypeID())
  {
    uint64_t valuePtr = 0;
    if (CFNumberGetValue((CFNumberRef)a1, kCFNumberLongLongType, &valuePtr)) {
      return valuePtr;
    }
  }
  return v3;
}

const void *_getChDetail(const __CFDictionary *a1, unsigned int a2)
{
  CFArrayRef Value = (const __CFArray *)CFDictionaryGetValue(a1, @"LegendChannel");
  if (!Value) {
    return 0;
  }
  CFArrayRef v4 = Value;
  CFTypeID v5 = CFGetTypeID(Value);
  if (v5 != CFArrayGetTypeID() || CFArrayGetCount(v4) <= a2) {
    return 0;
  }

  return CFArrayGetValueAtIndex(v4, a2);
}

const void *_getChannelAtIndex(const __CFArray *a1, CFIndex a2)
{
  if (CFArrayGetCount(a1) <= a2) {
    return 0;
  }
  ValueAtIndex = CFArrayGetValueAtIndex(a1, a2);
  CFTypeID v5 = CFGetTypeID(ValueAtIndex);
  if (v5 == CFDictionaryGetTypeID()) {
    return ValueAtIndex;
  }
  else {
    return 0;
  }
}

unint64_t IOReportChannelGetChannelID(const __CFDictionary *a1)
{
  ChDetail = _getChDetail(a1, 0);

  return _validateInt(ChDetail);
}

unint64_t IOReportChannelGetDriverID(const __CFDictionary *a1)
{
  CFArrayRef Value = CFDictionaryGetValue(a1, @"DriverID");

  return _validateInt(Value);
}

uint64_t _visitSample(const __CFDictionary *a1, const __CFDictionary *a2, int a3, unint64_t *a4, CFErrorRef *a5)
{
  unint64_t DriverID = IOReportChannelGetDriverID(a1);
  unint64_t ChannelID = IOReportChannelGetChannelID(a1);
  unint64_t v12 = a4[2];
  if (!v12)
  {
    unint64_t v12 = *a4;
    a4[2] = *a4;
  }
  a4[3] = v12;
  *((unsigned char *)a4 + 32) = 0;
  ++*((_DWORD *)a4 + 10);
  unint64_t v13 = a4[1];
  if (v12 >= v13) {
    return 16;
  }
  int v14 = 0;
  int v15 = *((_DWORD *)a4 + 9);
  while (1)
  {
    uint64_t v16 = *(unsigned __int16 *)(v12 + 20);
    if (*(_WORD *)(v12 + 20))
    {
      if (*(void *)v12 == DriverID && *(void *)(v12 + 8) == ChannelID) {
        break;
      }
    }
    if (v16 <= 1) {
      uint64_t v17 = 1;
    }
    else {
      uint64_t v17 = *(unsigned __int16 *)(v12 + 20);
    }
    v12 += v17 << 6;
    a4[2] = v12;
    if (v12 == v13)
    {
      unint64_t v12 = *a4;
      a4[2] = *a4;
      int v14 = 1;
      *((unsigned char *)a4 + 32) = 1;
      long long v18 = a4 + 3;
    }
    else if (v14)
    {
      long long v18 = a4 + 3;
    }
    else
    {
      long long v18 = a4 + 1;
    }
    ++v15;
    if (v12 >= *v18)
    {
      *((_DWORD *)a4 + 9) = v15;
      return 16;
    }
  }
  *((_DWORD *)a4 + 9) = v15 + 1;
  if (!IOReportChannelGetFormat(a1)) {
    setChannelType(a2, (const void *)(v12 + 16));
  }
  if (v12 + (v16 << 6) > a4[1])
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_FAULT))
    {
      _visitSample_cold_1(a1);
      if (a5)
      {
LABEL_25:
        if (!*a5) {
          *a5 = createCFErr(-536870212, "absurd element count");
        }
      }
    }
    else if (a5)
    {
      goto LABEL_25;
    }
    a4[2] = 0;
    return 273;
  }
  if (a3)
  {
    Mutable = CFDataCreateMutable(0, v16 << 6);
    CFDataAppendBytes(Mutable, (const UInt8 *)v12, v16 << 6);
  }
  else
  {
    Mutable = CFDataCreateWithBytesNoCopy(0, (const UInt8 *)v12, v16 << 6, (CFAllocatorRef)*MEMORY[0x263EFFB28]);
  }
  CFDictionarySetValue(a2, @"RawElements", Mutable);
  CFRelease(Mutable);
  unint64_t v22 = a4[1];
  unint64_t v21 = a4[2];
  if (*(unsigned __int16 *)(v21 + 20) <= 1u) {
    uint64_t v23 = 1;
  }
  else {
    uint64_t v23 = *(unsigned __int16 *)(v21 + 20);
  }
  unint64_t v24 = v21 + (v23 << 6);
  a4[2] = v24;
  uint64_t result = 0;
  if (v24 == v22)
  {
    a4[2] = *a4;
    *((unsigned char *)a4 + 32) = 1;
  }
  return result;
}

uint64_t __IOReportCreateSamplesRaw_block_invoke(uint64_t a1, const __CFDictionary *a2, const __CFDictionary *a3)
{
  return _visitSample(a2, a3, 1, (unint64_t *)(*(void *)(*(void *)(a1 + 32) + 8) + 24), *(CFErrorRef **)(a1 + 40));
}

uint64_t cloneElements(__CFDictionary *a1, CFDictionaryRef theDict, char a3)
{
  uint64_t v3 = 3758097084;
  unint64_t v14 = 0x8000000000000000;
  if (a1)
  {
    if (theDict)
    {
      CFDataRef Value = (const __CFData *)CFDictionaryGetValue(theDict, @"RawElements");
      if (Value)
      {
        CFMutableDataRef MutableCopy = CFDataCreateMutableCopy(0, 0, Value);
        if (MutableCopy)
        {
          CFMutableDataRef v8 = MutableCopy;
          unsigned __int16 v15 = 0;
          CFDictionarySetValue(a1, @"RawElements", MutableCopy);
          uint64_t v3 = 0;
          if (a3)
          {
            int Format = IOReportChannelGetFormat(a1);
            RawElements = getRawElements(a1, &v15, Format);
            uint64_t v3 = 3758097084;
            if (RawElements)
            {
              if (v15)
              {
                long long v11 = RawElements;
                unint64_t v12 = &RawElements[64 * (unint64_t)v15];
                do
                {
                  memset_pattern8(v11 + 32, &v14, 0x20uLL);
                  v11 += 64;
                }
                while (v11 < v12);
              }
              uint64_t v3 = 0;
            }
          }
          CFRelease(v8);
        }
      }
    }
  }
  return v3;
}

uint64_t _compareSamples(const __CFDictionary *a1, const __CFDictionary *a2, const __CFDictionary *a3, CFErrorRef *a4)
{
  uint64_t v8 = 3758097084;
  int Format = IOReportChannelGetFormat(a1);
  int v10 = IOReportChannelGetFormat(a2);
  long long v11 = 0;
  uint64_t v12 = 3758097090;
  if (Format && v10)
  {
    if (Format == v10)
    {
      switch(Format)
      {
        case 1:
          IntegerCFDataRef Value = IOReportSimpleGetIntegerValue(a1, 0);
          if (IntegerValue != 0x8000000000000000)
          {
            unint64_t v14 = IntegerValue;
            unint64_t v15 = IOReportSimpleGetIntegerValue(a2, 0);
            if (v15 != 0x8000000000000000)
            {
              unint64_t v16 = v15;
              LOWORD(v46) = 0;
              RawElements = getRawElements(a3, &v46, 1);
              if (RawElements)
              {
                if ((unsigned __int16)v46 == 1)
                {
                  uint64_t v8 = 0;
                  *((void *)RawElements + 4) = v16 - v14;
                }
              }
            }
          }
          long long v11 = 0;
          uint64_t v12 = v8;
          goto LABEL_64;
        case 2:
          unsigned __int16 v48 = 0;
          unsigned __int16 v45 = 0;
          long long v18 = getRawElements(a3, &v48, 2);
          if (!v18) {
            goto LABEL_62;
          }
          long long v19 = v18;
          int v20 = v48;
          if (IOReportStateGetCount(a3) != v20) {
            goto LABEL_62;
          }
          unint64_t v21 = getRawElements(a2, &v45, 2);
          if (!v21 || v45 != v48) {
            goto LABEL_62;
          }
          memcpy(v19, v21, (unint64_t)v45 << 6);
          if (!v48) {
            goto LABEL_61;
          }
          unint64_t v22 = 0;
          uint64_t v23 = v19 + 48;
          do
          {
            long long v46 = 0u;
            long long v47 = 0u;
            uint64_t v12 = 1;
            if (_getStateValues(a1, v22, &v46)) {
              break;
            }
            uint64_t v24 = *((void *)&v46 + 1);
            if (*((void *)&v46 + 1) == 0x8000000000000000) {
              break;
            }
            long long v46 = 0u;
            long long v47 = 0u;
            uint64_t v12 = 1;
            if (_getStateValues(a2, v22, &v46)) {
              break;
            }
            if (*((void *)&v46 + 1) == 0x8000000000000000) {
              break;
            }
            *(v23 - 1) = *((void *)&v46 + 1) - v24;
            long long v46 = 0u;
            long long v47 = 0u;
            uint64_t v12 = 1;
            if (_getStateValues(a1, v22, &v46)) {
              break;
            }
            uint64_t v25 = v47;
            if ((void)v47 == 0x8000000000000000) {
              break;
            }
            long long v46 = 0u;
            long long v47 = 0u;
            uint64_t v12 = 1;
            if (_getStateValues(a2, v22, &v46)) {
              break;
            }
            if ((void)v47 == 0x8000000000000000) {
              break;
            }
            uint64_t v12 = 0;
            *uint64_t v23 = v47 - v25;
            v23 += 8;
            ++v22;
          }
          while (v22 < v48);
          goto LABEL_63;
        case 3:
          unsigned __int16 v48 = 0;
          unsigned __int16 v45 = 0;
          unint64_t v26 = getRawElements(a3, &v48, 3);
          if (!v26) {
            goto LABEL_62;
          }
          CFIndex v27 = v26;
          int v28 = v48;
          if (IOReportHistogramGetBucketCount(a3) != v28) {
            goto LABEL_62;
          }
          CFDictionaryRef v29 = getRawElements(a2, &v45, 3);
          if (!v29 || v45 != v48) {
            goto LABEL_62;
          }
          memcpy(v27, v29, (unint64_t)v45 << 6);
          if (!v48) {
            goto LABEL_61;
          }
          unint64_t v30 = 0;
          unsigned int v31 = v27 + 56;
          break;
        case 4:
          LOWORD(v46) = 0;
          unsigned __int16 v48 = 0;
          uint64_t v34 = getRawElements(a3, &v46, 4);
          if (v34 && (CFMutableDictionaryRef v35 = v34, (v36 = getRawElements(a2, &v48, 4)) != 0) && v48 == (unsigned __int16)v46)
          {
            memcpy(v35, v36, (unint64_t)v48 << 6);
            if ((_WORD)v46)
            {
              int v37 = 0;
              unint64_t v38 = 0;
              v39 = (char *)(v35 + 32);
              do
              {
                for (uint64_t i = 0; i != 4; ++i)
                {
                  unint64_t ValueAtIndex = IOReportArrayGetValueAtIndex(a1, v37 + (int)i);
                  unint64_t v42 = IOReportArrayGetValueAtIndex(a2, v37 + (int)i);
                  unint64_t v43 = v42 - ValueAtIndex;
                  if (v42 == 0x8000000000000000) {
                    unint64_t v43 = ValueAtIndex;
                  }
                  if (ValueAtIndex == 0x8000000000000000) {
                    unint64_t v43 = v42;
                  }
                  *(void *)&v39[8 * i] = v43;
                }
                ++v38;
                v39 += 64;
                v37 += 4;
              }
              while (v38 < (unsigned __int16)v46);
            }
LABEL_61:
            uint64_t v12 = 0;
          }
          else
          {
LABEL_62:
            uint64_t v12 = 1;
          }
          goto LABEL_63;
        default:
          uint64_t v12 = 3758097126;
          long long v11 = "unknown report format";
          goto LABEL_64;
      }
      do
      {
        long long v46 = 0u;
        long long v47 = 0u;
        uint64_t v12 = 1;
        if (_getHistogramValues(a1, v30, &v46)) {
          break;
        }
        uint64_t v32 = v46;
        if ((void)v46 == 0x8000000000000000) {
          break;
        }
        long long v46 = 0u;
        long long v47 = 0u;
        uint64_t v12 = 1;
        if (_getHistogramValues(a2, v30, &v46) || (void)v46 == 0x8000000000000000) {
          break;
        }
        uint64_t v33 = v46 - v32;
        *(v31 - 3) = v46 - v32;
        if (v33)
        {
          long long v46 = 0u;
          long long v47 = 0u;
          uint64_t v12 = 1;
          if (_getHistogramValues(a2, v30, &v46) || *((void *)&v47 + 1) == 0x8000000000000000) {
            break;
          }
          *unsigned int v31 = *((void *)&v47 + 1);
          if (v32)
          {
            long long v46 = 0u;
            long long v47 = 0u;
            uint64_t v12 = 1;
            if (_getHistogramValues(a1, v30, &v46) || *((void *)&v47 + 1) == 0x8000000000000000) {
              break;
            }
            *v31 -= *((void *)&v47 + 1);
          }
        }
        else
        {
          *unsigned int v31 = 0x8000000000000000;
        }
        uint64_t v12 = 0;
        ++v30;
        v31 += 8;
      }
      while (v30 < v48);
LABEL_63:
      long long v11 = 0;
    }
    else
    {
      uint64_t v12 = 3758097090;
      long long v11 = "mismatched formats";
    }
  }
LABEL_64:
  if (a4 && v12) {
    *a4 = createCFErr((int)v12, v11);
  }
  return v12;
}

uint64_t IOReportChannelGetFormat(const __CFDictionary *a1)
{
  unint64_t v4 = 0;
  int ChannelType = getChannelType(a1, &v4);
  unsigned __int8 v2 = v4;
  if (ChannelType) {
    return 0;
  }
  return v2;
}

unint64_t IOReportSimpleGetIntegerValue(const __CFDictionary *a1, unint64_t *a2)
{
  __int16 v7 = 0;
  if (!a1) {
    return 0x8000000000000000;
  }
  RawElements = getRawElements(a1, &v7, 1);
  unint64_t v5 = 0x8000000000000000;
  if (RawElements)
  {
    if (v7 == 1 && RawElements[16] == 1)
    {
      unint64_t v5 = *((void *)RawElements + 4);
      if (a2) {
        *a2 = IOReportChannelGetUnit(a1);
      }
    }
  }
  return v5;
}

UInt8 *getRawElements(const __CFDictionary *a1, _WORD *a2, int a3)
{
  uint64_t v3 = 0;
  if (a1 && a2)
  {
    CFDataRef Value = (const __CFData *)CFDictionaryGetValue(a1, @"RawElements");
    if (Value
      && (CFDataRef v7 = Value, v8 = CFGetTypeID(Value), v8 == CFDataGetTypeID())
      && (unint64_t)CFDataGetLength(v7) >= 0x40
      && (MutableBytePtr = CFDataGetMutableBytePtr(v7), MutableBytePtr[16] == a3))
    {
      uint64_t v3 = MutableBytePtr;
      *a2 = (unint64_t)CFDataGetLength(v7) >> 6;
    }
    else
    {
      return 0;
    }
  }
  return v3;
}

uint64_t _getStateValues(const __CFDictionary *a1, int a2, _OWORD *a3)
{
  uint64_t v3 = 3758097084;
  unsigned __int16 v13 = 0;
  if (a1)
  {
    RawElements = getRawElements(a1, &v13, 2);
    if (RawElements)
    {
      CFTypeID v8 = RawElements;
      int v9 = v13;
      unint64_t v14 = 0;
      if (!getChannelType(a1, &v14)
        && v14 == 2
        && (a2 & 0x80000000) == 0
        && WORD2(v14) == v9
        && v13 >= a2)
      {
        uint64_t v3 = 0;
        int v10 = &v8[64 * (unint64_t)a2];
        long long v11 = *((_OWORD *)v10 + 3);
        *a3 = *((_OWORD *)v10 + 2);
        a3[1] = v11;
      }
    }
  }
  return v3;
}

BOOL __IOReportCreateSamplesDelta_block_invoke(uint64_t a1, const __CFDictionary *a2, const __CFDictionary *a3, const __CFDictionary *a4)
{
  return _compareSamples(a2, a3, a4, *(CFErrorRef **)(a1 + 32)) != 0;
}

uint64_t _iterSubDictsForKey(CFDictionaryRef theDict, void *key, __CFDictionary *a3, const __CFDictionary *a4, uint64_t a5)
{
  long long v26 = *(_OWORD *)(a5 + 48);
  uint64_t v10 = *(void *)(a5 + 64);
  long long v11 = *(_OWORD *)(a5 + 16);
  v23[0] = *(_OWORD *)a5;
  v23[1] = v11;
  CFArrayRef theArray = 0;
  CFMutableDictionaryRef value = 0;
  uint64_t v27 = v10;
  *(void *)&long long v26 = 0;
  LODWORD(v27) = *(_DWORD *)(a5 + 64) + 2;
  if (*(unsigned char *)(a5 + 60)) {
    DWORD2(v26) = 0;
  }
  CFDictionaryRef v12 = (const __CFDictionary *)CFDictionaryGetValue(theDict, key);
  if (v12)
  {
    CFDictionaryRef v13 = v12;
    CFTypeID v14 = CFGetTypeID(v12);
    if (v14 == CFDictionaryGetTypeID()
      && (!a3 || (CFMutableDictionaryRef value = CFDictionaryCreateMutable(0, 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90])) != 0)
      && (!a4 || (*(void *)&long long v26 = CFDictionaryGetValue(a4, key), (void)v26))
      && (!*(void *)(a5 + 8)
       || (CFIndex v15 = CFDictionaryGetCount(v13), (theArray = CFArrayCreateMutable(0, v15, MEMORY[0x263EFFF70])) != 0)))
    {
      if (*(unsigned char *)(a5 + 60)) {
        int v16 = 0;
      }
      else {
        int v16 = 273;
      }
      DWORD2(v26) = v16;
      CFDictionaryApplyFunction(v13, (CFDictionaryApplierFunction)_iterSubDicts, v23);
      uint64_t v17 = DWORD2(v26);
      CFArrayRef v18 = theArray;
      if ((BYTE8(v26) & 1) == 0)
      {
        if (theArray)
        {
          CFIndex Count = CFArrayGetCount(theArray);
          if (Count >= 1)
          {
            unint64_t v20 = Count + 1;
            do
            {
              unint64_t ValueAtIndex = CFArrayGetValueAtIndex(theArray, v20 - 2);
              CFDictionaryRemoveValue(v13, ValueAtIndex);
              --v20;
            }
            while (v20 > 1);
          }
        }
        if (a3)
        {
          CFDictionarySetValue(a3, key, value);
        }
        else if (*(void *)(a5 + 8) && !CFDictionaryGetCount(v13))
        {
          CFDictionaryRemoveValue(theDict, key);
        }
        uint64_t v17 = DWORD2(v26);
        CFArrayRef v18 = theArray;
      }
      if (v18) {
        CFRelease(v18);
      }
    }
    else
    {
      uint64_t v17 = 273;
    }
  }
  else
  {
    uint64_t v17 = 0;
  }
  if (value) {
    CFRelease(value);
  }
  return v17;
}

uint64_t __IOReportUpdateSamplesRaw_block_invoke(void *a1, const __CFDictionary *a2)
{
  CFMutableDictionaryRef value = 0;
  unint64_t DriverID = IOReportChannelGetDriverID(a2);
  unint64_t ChannelID = IOReportChannelGetChannelID(a2);
  unint64_t v7 = a1[5];
  unint64_t v6 = a1[6];
  while (1)
  {
    if (v7 >= v6) {
      goto LABEL_22;
    }
    uint64_t v8 = *(unsigned __int16 *)(v7 + 20);
    if (!*(_WORD *)(v7 + 20)) {
      break;
    }
    if (*(void *)v7 == DriverID && *(void *)(v7 + 8) == ChannelID)
    {
      if (v7 + (v8 << 6) > v6)
      {
        if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_FAULT)) {
          _visitSample_cold_1(a2);
        }
        long long v11 = (void *)a1[7];
        if (v11 && !*v11)
        {
          CFIndex v12 = *(int *)(*(void *)(a1[4] + 8) + 24);
          CFDictionaryRef v13 = "absurd element count from provider";
          goto LABEL_46;
        }
        return 1;
      }
      if (CFDictionaryGetValueIfPresent(a2, @"RawElements", (const void **)&value))
      {
        if (value && (CFTypeID v14 = CFGetTypeID(value), v14 == CFDataGetTypeID()))
        {
          CFIndex Length = CFDataGetLength((CFDataRef)value);
          if (Length == v8 << 6)
          {
            v21.length = Length;
            v21.location = 0;
            CFDataReplaceBytes((CFMutableDataRef)value, v21, (const UInt8 *)v7, v21.length);
            unint64_t v6 = a1[6];
LABEL_22:
            if (v7 != v6) {
              return 0;
            }
            if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
              __IOReportUpdateSamplesRaw_block_invoke_cold_4(a2);
            }
            int v16 = (void *)a1[7];
            if (v16 && !*v16) {
              *(void *)a1[7] = createCFErr(*(int *)(*(void *)(a1[4] + 8) + 24), "Didn't find provider_id channel_id match for samplesDict channel");
            }
            *(_DWORD *)(*(void *)(a1[4] + 8) + 24) = -536870160;
            return 1;
          }
          if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
            __IOReportUpdateSamplesRaw_block_invoke_cold_5(a2);
          }
          long long v19 = (void *)a1[7];
          if (!v19 || *v19) {
            return 1;
          }
          CFIndex v12 = *(int *)(*(void *)(a1[4] + 8) + 24);
          CFDictionaryRef v13 = "Stale samplesDict, IOReporter elements count changed";
        }
        else
        {
          if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_FAULT)) {
            __IOReportUpdateSamplesRaw_block_invoke_cold_3(a2);
          }
          uint64_t v17 = (void *)a1[7];
          if (!v17 || *v17) {
            return 1;
          }
          CFIndex v12 = *(int *)(*(void *)(a1[4] + 8) + 24);
          CFDictionaryRef v13 = "samplesDict has bad elemsData error";
        }
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_FAULT)) {
          __IOReportUpdateSamplesRaw_block_invoke_cold_2(a2);
        }
        CFArrayRef v18 = (void *)a1[7];
        if (!v18 || *v18) {
          return 1;
        }
        CFIndex v12 = *(int *)(*(void *)(a1[4] + 8) + 24);
        CFDictionaryRef v13 = "Couldn't find kIOReportRawElementsKey in samplesDict";
      }
LABEL_46:
      *(void *)a1[7] = createCFErr(v12, v13);
      return 1;
    }
    v7 += v8 << 6;
  }
  int v9 = (void *)a1[7];
  if (v9 && !*v9) {
    *(void *)a1[7] = createCFErr(*(int *)(*(void *)(a1[4] + 8) + 24), "bad raw data from provider");
  }
  return 16;
}

__CFArray *IOReportStateGetNameForIndex(const __CFDictionary *a1, unsigned int a2)
{
  CFDataRef Value = (__CFArray *)CFDictionaryGetValue(a1, @"StateNames");
  if (Value)
  {
    unint64_t v5 = Value;
    CFTypeID v6 = CFGetTypeID(Value);
    if (v6 != CFArrayGetTypeID() || (a2 & 0x80000000) != 0) {
      return 0;
    }
  }
  else
  {
    unsigned int Count = IOReportStateGetCount(a1);
    if ((Count & 0x80000000) != 0) {
      return 0;
    }
    unsigned int v11 = Count;
    uint64_t result = CFArrayCreateMutable(0, Count, MEMORY[0x263EFFF70]);
    if (!result) {
      return result;
    }
    unint64_t v5 = result;
    if (v11)
    {
      int v12 = 0;
      while (1)
      {
        memset(v15, 0, sizeof(v15));
        if (_getStateValues(a1, v12, v15)) {
          break;
        }
        if (*(void *)&v15[0] == 0x8000000000000000) {
          break;
        }
        CFStringRef v13 = copyPrintableIDString(*(unint64_t *)&v15[0]);
        if (!v13) {
          break;
        }
        CFStringRef v14 = v13;
        CFArrayAppendValue(v5, v13);
        CFRelease(v14);
        if (v11 == ++v12) {
          goto LABEL_17;
        }
      }
      CFRelease(v5);
      return 0;
    }
LABEL_17:
    CFDictionarySetValue(a1, @"StateNames", v5);
    CFRelease(v5);
    if ((a2 & 0x80000000) != 0) {
      return 0;
    }
  }
  if (CFArrayGetCount(v5) <= a2) {
    return 0;
  }
  uint64_t result = (__CFArray *)CFArrayGetValueAtIndex(v5, a2);
  if (result)
  {
    uint64_t v8 = result;
    CFTypeID v9 = CFGetTypeID(result);
    if (v9 == CFStringGetTypeID()) {
      return v8;
    }
    else {
      return 0;
    }
  }
  return result;
}

uint64_t IOReportStateGetCount(const __CFDictionary *a1)
{
  if (!a1) {
    return 0xFFFFFFFFLL;
  }
  unint64_t v3 = 0;
  int ChannelType = getChannelType(a1, &v3);
  uint64_t result = 0xFFFFFFFFLL;
  if (!ChannelType && v3 == 2) {
    return WORD2(v3);
  }
  return result;
}

CFStringRef copyPrintableIDString(unint64_t a1)
{
  uint64_t v2 = 0;
  uint64_t v11 = *MEMORY[0x263EF8340];
  char v10 = 0;
  *(void *)cStr = 0;
  int v3 = 8;
  uint64_t v4 = MEMORY[0x263EF8318];
LABEL_2:
  uint64_t v5 = 8 * v3 - 8;
  while (v3 >= 1)
  {
    --v3;
    unint64_t v6 = a1 >> (v5 & 0xF8);
    v5 -= 8;
    if ((_BYTE)v6)
    {
      char v7 = v6;
      if ((char)v6 < 0)
      {
        if (!__maskrune((char)v6, 0x40000uLL)) {
          return 0;
        }
      }
      else if ((*(_DWORD *)(v4 + 4 * (char)v6 + 60) & 0x40000) == 0)
      {
        return 0;
      }
      cStr[v2++] = v7;
      goto LABEL_2;
    }
  }
  if (v2 && (cStr[v2] = 0, !v3)) {
    return CFStringCreateWithCString(0, cStr, 0x8000100u);
  }
  else {
    return 0;
  }
}

unint64_t IOReportArrayGetValueAtIndex(const __CFDictionary *a1, unsigned int a2)
{
  if ((a2 & 0x80000000) != 0) {
    return 0x8000000000000000;
  }
  unsigned __int16 v9 = 0;
  if (!a1) {
    return 0x8000000000000000;
  }
  RawElements = getRawElements(a1, &v9, 4);
  if (!RawElements) {
    return 0x8000000000000000;
  }
  uint64_t v4 = a2 >> 2;
  if (v4 >= v9) {
    return 0x8000000000000000;
  }
  uint64_t v5 = &RawElements[64 * v4];
  long long v6 = *((_OWORD *)v5 + 3);
  v8[0] = *((_OWORD *)v5 + 2);
  v8[1] = v6;
  return *((void *)v8 + (a2 & 3));
}

const void *IOReportChannelGetSubGroup(const __CFDictionary *a1)
{
  CFDataRef Value = CFDictionaryGetValue(a1, @"IOReportSubGroupName");

  return _validateStr(Value);
}

const void *IOReportChannelGetGroup(const __CFDictionary *a1)
{
  CFDataRef Value = CFDictionaryGetValue(a1, @"IOReportGroupName");

  return _validateStr(Value);
}

double IOReportScaleValue(unint64_t a1, unint64_t a2, unint64_t a3)
{
  if (HIBYTE(a2) != HIBYTE(a3)) {
    return NAN;
  }
  v11[5] = v3;
  v11[6] = v4;
  unint64_t v10 = 0;
  v11[0] = 0;
  if (getFactorsFromScale(a2 & 0xFFFFFFFFFFFFFFLL, v11, (uint64_t *)&v10)) {
    return NAN;
  }
  unint64_t v7 = v10;
  unint64_t v8 = v11[0];
  if (getFactorsFromScale(a3 & 0xFFFFFFFFFFFFFFLL, v11, (uint64_t *)&v10)) {
    return NAN;
  }
  else {
    return (double)a1 * (double)v8 / (double)v7 / (double)(unint64_t)v11[0] * (double)v10;
  }
}

uint64_t getFactorsFromScale(uint64_t a1, uint64_t *a2, uint64_t *a3)
{
  if ((a1 & 0xFF000000000000) != 0) {
    return 3758097090;
  }
  uint64_t v4 = a1 & 0x7FFFFFFF;
  if ((a1 & 0x80000000) != 0) {
    uint64_t v4 = 1;
  }
  uint64_t v5 = a1 & 0x7FFFFFFF;
  if ((a1 & 0x7FFFFFFF) != 0) {
    uint64_t v6 = v4;
  }
  else {
    uint64_t v6 = 1;
  }
  if ((a1 & 0x80000000) == 0 || v5 == 0) {
    uint64_t v5 = 1;
  }
  if (BYTE4(a1))
  {
    int v8 = (char)(BYTE4(a1) - 127);
    if (SBYTE4(a1) > -2)
    {
      uint64_t v10 = 1;
      if (BYTE4(a1) != 127)
      {
        do
          v10 *= 10;
        while (!__CFADD__(v8++, 1));
      }
      v5 *= v10;
    }
    else
    {
      uint64_t v9 = 1;
      do
      {
        v9 *= 10;
        --v8;
      }
      while (v8);
      v6 *= v9;
    }
  }
  uint64_t v3 = 0;
  uint64_t v12 = v5 << (127 - BYTE5(a1));
  uint64_t v13 = v6 << (BYTE5(a1) - 127);
  if (SBYTE5(a1) <= -2) {
    uint64_t v12 = v5;
  }
  else {
    uint64_t v13 = v6;
  }
  if (BYTE5(a1))
  {
    uint64_t v6 = v13;
    uint64_t v5 = v12;
  }
  *a2 = v6;
  *a3 = v5;
  return v3;
}

uint64_t IOReportHistogramGetBucketBounds(const __CFDictionary *a1, int a2, void *a3, void *a4)
{
  uint64_t v4 = 3758097084;
  if (!a1) {
    return v4;
  }
  if (!CFDictionaryContainsKey(a1, @"ProcessedChannelConfig"))
  {
    unint64_t valuePtr = 0;
    CFIndex capacity = 0;
    if (getChannelType(a1, (unint64_t *)&capacity)) {
      return v4;
    }
    if (capacity != 3) {
      return v4;
    }
    CFDataRef ChannelConfig = getChannelConfig(a1);
    if (!ChannelConfig) {
      return v4;
    }
    CFDataRef v19 = ChannelConfig;
    unint64_t Length = CFDataGetLength(ChannelConfig);
    unint64_t v21 = Length >> 4;
    if (!(Length >> 4)) {
      return v4;
    }
    unint64_t v22 = Length;
    BytePtr = CFDataGetBytePtr(v19);
    if (!BytePtr) {
      return v4;
    }
    uint64_t v24 = BytePtr;
    CFArrayRef theArray = CFArrayCreateMutable(0, WORD2(capacity), MEMORY[0x263EFFF70]);
    if (!theArray) {
      return v4;
    }
    if ((int)v21 >= 1)
    {
      uint64_t v25 = 0;
      unint64_t v26 = 0;
      int v27 = 0;
      CFAllocatorRef allocator = (const __CFAllocator *)*MEMORY[0x263EFFB08];
      uint64_t v37 = (v22 >> 4);
      unint64_t v38 = v24;
      while (1)
      {
        uint64_t v39 = v25;
        int v28 = &v24[16 * v25];
        unint64_t v43 = v28 + 12;
        if (*((int *)v28 + 3) >= 1) {
          break;
        }
        unint64_t v32 = v26;
LABEL_38:
        uint64_t v24 = v38;
        uint64_t v25 = v39 + 1;
        unint64_t v26 = v32;
        if (v39 + 1 == v37) {
          goto LABEL_39;
        }
      }
      int v29 = 0;
      CFMutableArrayRef v41 = v28;
      unint64_t v42 = v28 + 4;
      int v30 = -1;
      while (v27 < WORD2(capacity))
      {
        if (*v42)
        {
          int v31 = v30;
          unint64_t v32 = 1;
          do
            v32 *= *(unsigned int *)v41;
          while (!__CFADD__(v31++, 1));
        }
        else
        {
          unint64_t v32 = (*(_DWORD *)v41 + *(_DWORD *)v41 * v29);
        }
        unint64_t valuePtr = v32;
        if (v26 >= v32) {
          break;
        }
        CFNumberRef v34 = CFNumberCreate(allocator, kCFNumberLongLongType, &valuePtr);
        if (!v34) {
          break;
        }
        CFNumberRef v35 = v34;
        ++v27;
        CFArrayAppendValue(theArray, v34);
        CFRelease(v35);
        ++v29;
        --v30;
        unint64_t v26 = v32;
        if (v29 >= *v43) {
          goto LABEL_38;
        }
      }
      CFRelease(theArray);
      return v4;
    }
LABEL_39:
    CFDictionarySetValue(a1, @"ProcessedChannelConfig", theArray);
    CFRelease(theArray);
  }
  CFArrayRef Value = (const __CFArray *)CFDictionaryGetValue(a1, @"ProcessedChannelConfig");
  if (Value)
  {
    CFArrayRef v10 = Value;
    CFTypeID v11 = CFGetTypeID(Value);
    if (v11 == CFArrayGetTypeID() && CFArrayGetCount(v10) >= a2)
    {
      if (a4)
      {
        CFNumberRef ValueAtIndex = (const __CFNumber *)CFArrayGetValueAtIndex(v10, a2);
        if (!ValueAtIndex) {
          return v4;
        }
        CFNumberRef v13 = ValueAtIndex;
        CFTypeID v14 = CFGetTypeID(ValueAtIndex);
        if (v14 != CFNumberGetTypeID()) {
          return v4;
        }
        CFNumberGetValue(v13, kCFNumberLongLongType, a4);
      }
      if (!a3) {
        return 0;
      }
      if (!a2)
      {
        uint64_t v4 = 0;
        *a3 = 0;
        return v4;
      }
      CFNumberRef v15 = (const __CFNumber *)CFArrayGetValueAtIndex(v10, a2 - 1);
      if (v15)
      {
        CFNumberRef v16 = v15;
        CFTypeID v17 = CFGetTypeID(v15);
        if (v17 == CFNumberGetTypeID())
        {
          CFNumberGetValue(v16, kCFNumberLongLongType, a3);
          return 0;
        }
      }
    }
  }
  return v4;
}

uint64_t updateAggregate(const __CFDictionary *a1, uint64_t a2)
{
  long long v6 = 0u;
  long long v7 = 0u;
  long long v4 = 0u;
  long long v5 = 0u;
  uint64_t v3 = a2;
  return _iterate(a1, 0, &v3, 0);
}

BOOL IOReportUpdateSamplesRaw(const __CFDictionary *a1, CFDataRef theData, uint64_t a3)
{
  uint64_t v13 = 0;
  CFTypeID v14 = &v13;
  uint64_t v3 = &v16;
  uint64_t v15 = 0x2000000000;
  int v16 = -536870212;
  if (!a1 || !theData) {
    goto LABEL_5;
  }
  if (CFDataGetLength(theData) <= 63)
  {
    uint64_t v3 = (int *)(v14 + 3);
LABEL_5:
    BOOL v7 = 0;
    *uint64_t v3 = -536870206;
    goto LABEL_9;
  }
  BytePtr = CFDataGetBytePtr(theData);
  CFIndex Length = CFDataGetLength(theData);
  CFIndex v10 = Length + 63;
  if (Length >= 0) {
    CFIndex v10 = Length;
  }
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 0x40000000;
  v12[2] = __IOReportUpdateSamplesRaw_block_invoke;
  v12[3] = &unk_264131588;
  v12[6] = &BytePtr[v10 & 0xFFFFFFFFFFFFFFC0];
  v12[7] = a3;
  v12[4] = &v13;
  v12[5] = BytePtr;
  BOOL v7 = updateAggregate(a1, (uint64_t)v12) == 0;
LABEL_9:
  _Block_object_dispose(&v13, 8);
  return v7;
}

BOOL IOReportUpdateSamples(const __CFDictionary *a1, uint64_t a2, CFErrorRef *a3)
{
  if (a1 && a2)
  {
    if (_updateKernelBuffer(a2, a3)
      || (CFDataRef v7 = CFDataCreateWithBytesNoCopy(0, *(const UInt8 **)(a2 + 32), *(void *)(a2 + 40), (CFAllocatorRef)*MEMORY[0x263EFFB28])) == 0)
    {
      BOOL updated = 0;
      if (!a3) {
        return updated;
      }
    }
    else
    {
      CFDataRef v8 = v7;
      BOOL updated = IOReportUpdateSamplesRaw(a1, v7, (uint64_t)a3);
      CFRelease(v8);
      if (!a3) {
        return updated;
      }
    }
  }
  else
  {
    if (!a3) {
      return 0;
    }
    BOOL updated = 0;
    *a3 = createCFErr(-536870206, 0);
    if (!a3) {
      return updated;
    }
  }
  if (!updated)
  {
    if (!*a3)
    {
      BOOL updated = 0;
      *a3 = createCFErr(-536870212, "unknown error");
      return updated;
    }
    return 0;
  }
  return updated;
}

CFErrorRef createCFErr(CFIndex a1, const char *a2)
{
  userInfoKeys[1] = *(void **)MEMORY[0x263EF8340];
  uint64_t v3 = (void *)*MEMORY[0x263EFFC78];
  userInfoValues = 0;
  userInfoKeys[0] = v3;
  if (a2)
  {
    userInfoValues = (void *)CFStringCreateWithCString(0, a2, 0x600u);
    if (!userInfoValues) {
      return 0;
    }
    CFIndex v4 = 1;
  }
  else
  {
    CFIndex v4 = 0;
  }
  CFErrorRef v5 = CFErrorCreateWithUserInfoKeysAndValues(0, (CFErrorDomain)*MEMORY[0x263EFFC50], a1, (const void *const *)userInfoKeys, (const void *const *)&userInfoValues, v4);
  if (userInfoValues) {
    CFRelease(userInfoValues);
  }
  return v5;
}

void iorErrLog(int a1, __CFString *a2, CFErrorRef err)
{
  if ((a1 & 0x80000000) == 0) {
    return;
  }
  if (a2) {
    CFIndex v4 = a2;
  }
  else {
    CFIndex v4 = @"<unknown> function";
  }
  if (!err)
  {
    CFStringRef v7 = CFStringCreateWithFormat(0, 0, @"%@: %s", v4, "<unknown> error");
    goto LABEL_12;
  }
  CFStringRef v5 = CFErrorCopyFailureReason(err);
  if (v5)
  {
    CFStringRef v6 = v5;
    CFStringRef v7 = CFStringCreateWithFormat(0, 0, @"%@: %@", v4, v5);
  }
  else
  {
    CFStringRef v6 = CFErrorCopyDescription(err);
    CFStringRef v7 = CFStringCreateWithFormat(0, 0, @"%@: %@", v4, v6);
    if (!v6) {
      goto LABEL_12;
    }
  }
  CFRelease(v6);
LABEL_12:
  if (v7)
  {
    CFShow(v7);
    CFRelease(v7);
  }
}

uint64_t IOReportGetChannelCount(const __CFDictionary *a1)
{
  uint64_t v4 = 0;
  CFStringRef v5 = &v4;
  uint64_t v6 = 0x2000000000;
  int v7 = 0;
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 0x40000000;
  _OWORD v3[2] = __IOReportGetChannelCount_block_invoke;
  _OWORD v3[3] = &unk_2641314D0;
  v3[4] = &v4;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  CFDataRef v8 = v3;
  if (_iterate(a1, 0, &v8, 0)) {
    uint64_t v1 = 0xFFFFFFFFLL;
  }
  else {
    uint64_t v1 = *((unsigned int *)v5 + 6);
  }
  _Block_object_dispose(&v4, 8);
  return v1;
}

uint64_t __IOReportGetChannelCount_block_invoke(uint64_t a1)
{
  return 0;
}

uint64_t IOReportPrune(const __CFDictionary *a1, uint64_t a2)
{
  uint64_t v7 = 0;
  long long v5 = 0u;
  long long v6 = 0u;
  v3[0] = 0;
  long long v4 = 0u;
  v3[1] = a2;
  return _iterate(a1, 0, v3, 0);
}

uint64_t IOReportCreateSubscription(uint64_t a1, const __CFDictionary *a2, __CFDictionary **a3, uint64_t a4, CFErrorRef *a5)
{
  kern_return_t v8;
  const char *v9;
  unsigned int ChannelCount;
  size_t v13;
  _DWORD *v14;
  uint64_t Instance;
  uint64_t v16;
  CFDictionaryRef v17;
  io_service_t MatchingService;
  io_object_t v19;
  unsigned int *v20;
  io_connect_t v21;
  const char *v22;
  uint64_t result;
  kern_return_t v24;
  kern_return_t v25;
  uint32_t outputCnt;
  io_connect_t connect[2];
  uint64_t v28;
  uint64_t (*v29)(uint64_t, const __CFDictionary *);
  void *v30;
  uint64_t *v31;
  _DWORD *v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  int v36;

  LOBYTE(v6) = 0;
  uint64_t v7 = 0;
  outputCnt = 1;
  CFDataRef v8 = -536870206;
  long long v9 = "bad arguments";
  if (a2 && a3)
  {
    Channelunsigned int Count = IOReportGetChannelCount(a2);
    CFDataRef v8 = -536870206;
    if ((ChannelCount & 0x80000000) != 0)
    {
      uint64_t v7 = 0;
      LOBYTE(v6) = 0;
      long long v9 = "iteration error";
      goto LABEL_20;
    }
    unsigned int v6 = ChannelCount;
    if (!ChannelCount)
    {
      uint64_t v7 = 0;
      long long v9 = "no channels";
      goto LABEL_20;
    }
    CFDataRef v8 = -536870211;
    uint64_t v33 = 0;
    CFNumberRef v34 = &v33;
    CFNumberRef v35 = 0x2000000000;
    unint64_t v36 = 0;
    if (ChannelCount <= 0x555554D)
    {
      uint64_t v13 = 24 * ChannelCount + 8;
      CFTypeID v14 = malloc_type_malloc(v13, 0xB42E60BFuLL);
      if (v14)
      {
        uint64_t v7 = v14;
        *CFTypeID v14 = v6;
        *(void *)connect = MEMORY[0x263EF8330];
        int v28 = 0x40000000;
        int v29 = ___createInterestList_block_invoke;
        int v30 = &unk_2641315B0;
        int v31 = &v33;
        unint64_t v32 = v14;
        if (!IOReportIterate(a2, (uint64_t)connect) && *((_DWORD *)v34 + 6) == v6)
        {
          _Block_object_dispose(&v33, 8);
          if (IOReportCreateSubscription_cfOnce != -1) {
            dispatch_once(&IOReportCreateSubscription_cfOnce, &__block_literal_global);
          }
          Instance = _CFRuntimeCreateInstance();
          if (!Instance)
          {
            LOBYTE(v6) = 0;
            long long v9 = 0;
            goto LABEL_20;
          }
          int v16 = Instance;
          connect[0] = 0;
          CFTypeID v17 = IOServiceMatching("IOReportHub");
          if (v17)
          {
            MatchingService = IOServiceGetMatchingService(*MEMORY[0x263F0EC88], v17);
            CFDataRef v19 = MatchingService;
            if (MatchingService)
            {
              unint64_t v20 = (unsigned int *)MEMORY[0x263EF8960];
              CFDataRef v8 = IOServiceOpen(MatchingService, *MEMORY[0x263EF8960], 0, connect);
              unint64_t v21 = connect[0];
              if (v8)
              {
                unint64_t v22 = "Could not open IOReportHub";
              }
              else
              {
                CFDataRef v8 = IOConnectCallScalarMethod(connect[0], 0, 0, 0, 0, 0);
                unint64_t v21 = connect[0];
                if (!v8)
                {
                  *(_DWORD *)(v16 + 16) = connect[0];
                  IOObjectRelease(v19);
                  uint64_t v24 = IOConnectCallMethod(*(_DWORD *)(v16 + 16), 2u, 0, 0, v7, v13, (uint64_t *)(v16 + 24), &outputCnt, 0, 0);
                  if (v24)
                  {
                    CFDataRef v8 = v24;
                    LOBYTE(v6) = 0;
                    long long v9 = "kIOReportUserClientConfigureInterests failed";
                  }
                  else
                  {
                    uint64_t v25 = MEMORY[0x210570600](*(unsigned int *)(v16 + 16), *(unsigned int *)(v16 + 24), *v20, v16 + 32, v16 + 40, 1);
                    if (!v25)
                    {
                      *a3 = cloneAggregate(a2, (unint64_t)&__block_literal_global_10);
LABEL_24:
                      free(v7);
                      return v16;
                    }
                    CFDataRef v8 = v25;
                    LOBYTE(v6) = 0;
                    long long v9 = "IOConnectMapMemory() failed";
                  }
                  goto LABEL_38;
                }
                unint64_t v22 = "kIOReportUserClientOpen failed";
              }
              if (v21) {
                IOServiceClose(v21);
              }
            }
            else
            {
              unint64_t v22 = 0;
              CFDataRef v8 = -536870160;
            }
          }
          else
          {
            CFDataRef v19 = 0;
            unint64_t v22 = 0;
          }
          if (a5) {
            *a5 = createCFErr(v8, v22);
          }
          if (v19) {
            IOObjectRelease(v19);
          }
          long long v9 = 0;
          LOBYTE(v6) = 1;
LABEL_38:
          CFRelease((CFTypeRef)v16);
          goto LABEL_20;
        }
        free(v7);
      }
    }
    _Block_object_dispose(&v33, 8);
    uint64_t v7 = 0;
    LOBYTE(v6) = 0;
    long long v9 = "createInterestList() failed";
  }
LABEL_20:
  if (a5)
  {
    if ((v6 & 1) == 0) {
      *a5 = createCFErr(v8, v9);
    }
  }
  int v16 = 0;
  uint64_t result = 0;
  if (v7) {
    goto LABEL_24;
  }
  return result;
}

uint64_t __IOReportCreateSubscription_block_invoke()
{
  uint64_t result = _CFRuntimeRegisterClass();
  __IOReportSubscriptionTypeID = result;
  return result;
}

uint64_t __IOReportCreateSubscription_block_invoke_2()
{
  return 0;
}

uint64_t IOReportIterateSamplesRaw(const __CFDictionary *a1, CFDataRef theData, CFErrorRef *a3, uint64_t a4)
{
  CFIndex v5 = -536870206;
  uint64_t v18 = 0;
  CFDataRef v19 = &v18;
  uint64_t v20 = 0x4800000000;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  if (!a1 || !theData || CFDataGetLength(theData) < 64) {
    goto LABEL_10;
  }
  CFIndex Length = CFDataGetLength(theData);
  if (Length >= 0) {
    CFIndex v10 = Length;
  }
  else {
    CFIndex v10 = Length + 63;
  }
  BytePtr = CFDataGetBytePtr(theData);
  long long v12 = v19;
  v19[3] = (uint64_t)BytePtr;
  v12[4] = (uint64_t)&BytePtr[v10 & 0xFFFFFFFFFFFFFFC0];
  *((_DWORD *)v12 + 15) = 0;
  *((_DWORD *)v12 + 16) = 0;
  uint64_t v13 = MEMORY[0x263EF8330];
  v12[5] = 0;
  v12[6] = 0;
  *((unsigned char *)v12 + 56) = 0;
  v17[0] = v13;
  v17[1] = 0x40000000;
  v17[2] = __IOReportIterateSamplesRaw_block_invoke;
  v17[3] = &unk_264131538;
  v17[5] = &v18;
  v17[6] = a3;
  v17[4] = a4;
  int updated = updateAggregate(a1, (uint64_t)v17);
  if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEBUG))
  {
    IOReportIterateSamplesRaw_cold_1();
    if (updated) {
      goto LABEL_9;
    }
LABEL_16:
    uint64_t v15 = 0;
    goto LABEL_14;
  }
  if (!updated) {
    goto LABEL_16;
  }
LABEL_9:
  CFIndex v5 = -536870212;
LABEL_10:
  if (a3 && !*a3) {
    *a3 = createCFErr(v5, "couldn't iterate samples");
  }
  uint64_t v15 = 1;
LABEL_14:
  _Block_object_dispose(&v18, 8);
  return v15;
}

uint64_t __IOReportIterateSamplesRaw_block_invoke(uint64_t a1, CFDictionaryRef theDict)
{
  CFDictionaryRef MutableCopy = CFDictionaryCreateMutableCopy(0, 0, theDict);
  uint64_t v5 = _visitSample(theDict, MutableCopy, 0, (unint64_t *)(*(void *)(*(void *)(a1 + 40) + 8) + 24), *(CFErrorRef **)(a1 + 48));
  if (!v5) {
    uint64_t v5 = (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  CFRelease(MutableCopy);
  return v5;
}

CFDataRef IOReportCreateNewRawSamplesBuffer(uint64_t a1, uint64_t a2, CFErrorRef *a3)
{
  if (!a1 || !a2)
  {
    if (a3) {
      *a3 = createCFErr(-536870206, 0);
    }
    return 0;
  }
  if (_updateKernelBuffer(a1, a3)) {
    return 0;
  }
  long long v4 = *(const UInt8 **)(a1 + 32);
  CFIndex v5 = *(void *)(a1 + 40);

  return CFDataCreate(0, v4, v5);
}

uint64_t IOReportIterateNewSamples(uint64_t a1, const __CFDictionary *a2, CFErrorRef *a3, uint64_t a4)
{
  if (a1 && a2)
  {
    if (!_updateKernelBuffer(a1, a3))
    {
      CFDataRef v8 = CFDataCreateWithBytesNoCopy(0, *(const UInt8 **)(a1 + 32), *(void *)(a1 + 40), (CFAllocatorRef)*MEMORY[0x263EFFB28]);
      if (v8)
      {
        CFDataRef v9 = v8;
        uint64_t v10 = IOReportIterateSamplesRaw(a2, v8, a3, a4);
        CFRelease(v9);
        return v10;
      }
    }
  }
  else if (a3)
  {
    *a3 = createCFErr(-536870206, 0);
  }
  return 1;
}

uint64_t ___createInterestList_block_invoke(uint64_t a1, const __CFDictionary *a2)
{
  unint64_t DriverID = IOReportChannelGetDriverID(a2);
  unint64_t ChannelID = IOReportChannelGetChannelID(a2);
  uint64_t result = 1;
  if (DriverID != 0x8000000000000000 && ChannelID != 0x8000000000000000)
  {
    unint64_t v8 = 0;
    uint64_t result = getChannelType(a2, &v8);
    if (result)
    {
      return 1;
    }
    else
    {
      uint64_t v7 = *(void *)(a1 + 40) + 8;
      *(void *)(v7 + 24 * *(int *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) = DriverID;
      *(void *)(v7 + 24 * *(int *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) + 8) = ChannelID;
      *(void *)(v7 + 24 * (int)(*(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))++ + 16) = v8;
    }
  }
  return result;
}

uint64_t _deallocSubscription(uint64_t a1)
{
  MEMORY[0x210570610](*(unsigned int *)(a1 + 16), *(unsigned int *)(a1 + 24), *MEMORY[0x263EF8960], *(void *)(a1 + 32));
  uint64_t result = *(unsigned int *)(a1 + 16);
  if (result)
  {
    return IOServiceClose(result);
  }
  return result;
}

const void *OUTLINED_FUNCTION_3()
{
  return IOReportChannelGetGroup(v0);
}

__CFString *OUTLINED_FUNCTION_4()
{
  return IOReportChannelGetChannelName(v0);
}

const void *OUTLINED_FUNCTION_5()
{
  return IOReportChannelGetSubGroup(v0);
}

__CFDictionary *IOReportCopyChannelsForDrivers(const void *a1, int a2, CFErrorRef *a3)
{
  int v5 = -536870211;
  Aggregate = IOReportCreateAggregate(a2);
  if (Aggregate)
  {
    uint64_t v7 = Aggregate;
    BOOL v8 = a1 == 0;
    if (a1)
    {
      v12[0] = MEMORY[0x263EF8330];
      v12[1] = 0x40000000;
      v12[2] = __IOReportCopyChannelsForDrivers_block_invoke;
      v12[3] = &__block_descriptor_tmp_1;
      v12[4] = a3;
      v12[5] = Aggregate;
      int v9 = _iterateMatches(a1, (uint64_t)v12);
      if (!v9) {
        return v7;
      }
      int v5 = v9;
      uint64_t v10 = 0;
    }
    else
    {
      int v5 = -536870206;
      uint64_t v10 = "no matching dict";
    }
    CFRelease(v7);
  }
  else
  {
    BOOL v8 = 1;
    uint64_t v10 = "couldn't make dict";
  }
  uint64_t v7 = 0;
  if (a3 && v8)
  {
    uint64_t v7 = 0;
    *a3 = createCFErr(v5, v10);
  }
  return v7;
}

__CFDictionary *IOReportCreateAggregate(int a1)
{
  int valuePtr = a1;
  Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
  if (Mutable)
  {
    CFNumberRef v2 = CFNumberCreate(0, kCFNumberIntType, &valuePtr);
    if (v2)
    {
      CFNumberRef v3 = v2;
      CFDictionarySetValue(Mutable, @"QueryOpts", v2);
    }
    else
    {
      CFNumberRef v3 = Mutable;
      Mutable = 0;
    }
    CFRelease(v3);
  }
  return Mutable;
}

uint64_t _iterateMatches(const void *a1, uint64_t a2)
{
  io_iterator_t existing = 0;
  CFRetain(a1);
  uint64_t MatchingServices = IOServiceGetMatchingServices(*MEMORY[0x263F0EC88], (CFDictionaryRef)a1, &existing);
  if (!MatchingServices)
  {
    if (IOIteratorIsValid(existing))
    {
      while (IOIteratorIsValid(existing))
      {
        while (1)
        {
          uint64_t v6 = IOIteratorNext(existing);
          if (!v6) {
            break;
          }
          io_object_t v7 = v6;
          uint64_t MatchingServices = (*(uint64_t (**)(uint64_t, uint64_t))(a2 + 16))(a2, v6);
          IOObjectRelease(v7);
          if (MatchingServices) {
            goto LABEL_2;
          }
        }
        uint64_t MatchingServices = 0;
        if (IOIteratorIsValid(existing)) {
          goto LABEL_2;
        }
      }
      uint64_t MatchingServices = 3758097131;
    }
    else
    {
      uint64_t MatchingServices = 0;
    }
  }
LABEL_2:
  if (existing) {
    IOObjectRelease(existing);
  }
  return MatchingServices;
}

uint64_t __IOReportCopyChannelsForDrivers_block_invoke(uint64_t a1, uint64_t a2)
{
  CFNumberRef v3 = _IOReportCopyChannelsForDriver(a2, 0, 0, *(CFErrorRef **)(a1 + 32));
  if (!v3) {
    return 3758097084;
  }
  long long v4 = v3;
  uint64_t v5 = IOReportMergeChannels(*(const __CFDictionary **)(a1 + 40), v3, *(CFErrorRef **)(a1 + 32));
  CFRelease(v4);
  return v5;
}

__CFDictionary *IOReportCopyChannelsForDriver(uint64_t a1, int a2, CFErrorRef *a3)
{
  return _IOReportCopyChannelsForDriver(a1, a2, 0, a3);
}

uint64_t IOReportMergeChannels(const __CFDictionary *a1, const __CFDictionary *a2, CFErrorRef *a3)
{
  BOOL v4 = 0;
  uint64_t v5 = 273;
  if (a2 != a1 && a1 && a2)
  {
    unsigned int AggregateOpts = _getAggregateOpts(a1);
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 0x40000000;
    v10[2] = __IOReportMergeChannels_block_invoke;
    v10[3] = &__block_descriptor_tmp_31;
    unsigned int v11 = AggregateOpts;
    v10[4] = a1;
    v10[5] = a3;
    uint64_t v5 = IOReportIterate(a2, (uint64_t)v10);
    BOOL v4 = v5 != 0;
  }
  if (a3 && v5 && !v4) {
    *a3 = createCFErr(-536870206, "bad argument");
  }
  return v5;
}

__CFDictionary *IOReportCopyChannelsInCategories(__int16 a1, int a2, CFErrorRef *a3)
{
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 0x40000000;
  v4[2] = __IOReportCopyChannelsInCategories_block_invoke;
  v4[3] = &__block_descriptor_tmp_4;
  __int16 v5 = a1;
  return IOReportCopyFilteredChannels(a2, a3, (uint64_t)v4);
}

__CFDictionary *IOReportCopyFilteredChannels(int a1, CFErrorRef *a2, uint64_t a3)
{
  keys = @"IOReportLegendPublic";
  CFAllocatorRef v6 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  values = CFDictionaryCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], (const void **)&keys, MEMORY[0x263EFFB40], 1, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
  if (!values)
  {
    CFDictionaryRef v7 = 0;
    uint64_t v10 = "prop create failed";
    if (!a2) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }
  keys = @"IOPropertyMatch";
  CFDictionaryRef v7 = CFDictionaryCreate(v6, (const void **)&keys, (const void **)&values, 1, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
  if (!v7)
  {
    uint64_t v10 = "dict create failed";
    if (!a2) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }
  Aggregate = IOReportCreateAggregate(a1);
  if (!Aggregate)
  {
    uint64_t v10 = "couldn't make dict";
    if (!a2)
    {
LABEL_10:
      int v9 = 0;
      unsigned int v11 = 0;
      if (!v7) {
        goto LABEL_12;
      }
      goto LABEL_11;
    }
LABEL_9:
    *a2 = createCFErr(-536870211, v10);
    goto LABEL_10;
  }
  int v9 = Aggregate;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 0x40000000;
  v13[2] = __IOReportCopyFilteredChannels_block_invoke;
  v13[3] = &unk_2641316F8;
  int v14 = a1;
  v13[4] = a3;
  v13[5] = Aggregate;
  v13[6] = a2;
  if (_iterateMatches(v7, (uint64_t)v13))
  {
    CFRelease(v9);
    int v9 = 0;
  }
LABEL_11:
  CFRelease(v7);
  unsigned int v11 = v9;
LABEL_12:
  if (values) {
    CFRelease(values);
  }
  return v11;
}

uint64_t __IOReportCopyChannelsInCategories_block_invoke(uint64_t a1, const __CFDictionary *a2)
{
  unint64_t v6 = 0;
  int ChannelType = getChannelType(a2, &v6);
  __int16 v4 = WORD1(v6);
  if (ChannelType) {
    __int16 v4 = -1;
  }
  return 16 * ((unsigned __int16)(v4 & *(_WORD *)(a1 + 32)) == 0);
}

uint64_t IOReportChannelGetCategories(const __CFDictionary *a1)
{
  unint64_t v4 = 0;
  int ChannelType = getChannelType(a1, &v4);
  unsigned __int16 v2 = WORD1(v4);
  if (ChannelType) {
    return (unsigned __int16)-1;
  }
  return v2;
}

__CFDictionary *IOReportCopyChannelsOfFormat(char a1, int a2, CFErrorRef *a3)
{
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 0x40000000;
  v4[2] = __IOReportCopyChannelsOfFormat_block_invoke;
  v4[3] = &__block_descriptor_tmp_5;
  char v5 = a1;
  return IOReportCopyFilteredChannels(a2, a3, (uint64_t)v4);
}

uint64_t __IOReportCopyChannelsOfFormat_block_invoke(uint64_t a1, const __CFDictionary *a2)
{
  unint64_t v6 = 0;
  int ChannelType = getChannelType(a2, &v6);
  unsigned __int8 v4 = v6;
  if (ChannelType) {
    unsigned __int8 v4 = 0;
  }
  return 16 * (*(unsigned __int8 *)(a1 + 32) != v4);
}

__CFDictionary *IOReportCopyChannelsInGroup(uint64_t a1, uint64_t a2, int a3, CFErrorRef *a4)
{
  if (a1 | a2)
  {
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 0x40000000;
    v7[2] = __IOReportCopyChannelsInGroup_block_invoke;
    v7[3] = &__block_descriptor_tmp_7;
    v7[4] = a1;
    v7[5] = a2;
    return IOReportCopyFilteredChannels(a3, a4, (uint64_t)v7);
  }
  else if (a4)
  {
    CFErrorRef CFErr = createCFErr(-536870206, "no group or subgroup!");
    uint64_t result = 0;
    *a4 = CFErr;
  }
  else
  {
    return 0;
  }
  return result;
}

uint64_t __IOReportCopyChannelsInGroup_block_invoke(uint64_t a1, CFDictionaryRef theDict)
{
  CFArrayRef Value = CFDictionaryGetValue(theDict, @"IOReportGroupName");
  char v5 = _validateStr(Value);
  unint64_t v6 = CFDictionaryGetValue(theDict, @"IOReportSubGroupName");
  CFDictionaryRef v7 = _validateStr(v6);
  BOOL v8 = *(const void **)(a1 + 32);
  if ((!v8 || v5 && CFEqual(v8, v5)) && ((int v9 = *(const void **)(a1 + 40)) == 0 || v7 && CFEqual(v9, v7))) {
    return 0;
  }
  else {
    return 16;
  }
}

uint64_t IOReportSelectChannelsInGroup(const __CFDictionary *a1, uint64_t a2, uint64_t a3, CFErrorRef *a4)
{
  if (a2 && !a3)
  {
    unint64_t v6 = v12;
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 0x40000000;
    v12[2] = __IOReportSelectChannelsInGroup_block_invoke;
    v12[3] = &__block_descriptor_tmp_8_0;
    v12[4] = a2;
    goto LABEL_10;
  }
  if (!a2 && a3)
  {
    unint64_t v6 = v11;
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 0x40000000;
    v11[2] = __IOReportSelectChannelsInGroup_block_invoke_2;
    v11[3] = &__block_descriptor_tmp_9;
    v11[4] = a3;
    goto LABEL_10;
  }
  if (a2 && a3)
  {
    unint64_t v6 = v10;
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 0x40000000;
    v10[2] = __IOReportSelectChannelsInGroup_block_invoke_3;
    v10[3] = &__block_descriptor_tmp_10;
    v10[4] = a2;
    v10[5] = a3;
LABEL_10:
    uint64_t result = IOReportPrune(a1, (uint64_t)v6);
    if ((result & 1) == 0) {
      return result;
    }
    if (a4)
    {
      BOOL v8 = "channel pruning failed";
      CFIndex v9 = -536870212;
LABEL_15:
      *a4 = createCFErr(v9, v8);
      return 1;
    }
    return 1;
  }
  if (a4)
  {
    CFIndex v9 = -536870206;
    BOOL v8 = "no group or subgroup!";
    goto LABEL_15;
  }
  return 1;
}

uint64_t __IOReportSelectChannelsInGroup_block_invoke(uint64_t a1, CFDictionaryRef theDict)
{
  CFArrayRef Value = CFDictionaryGetValue(theDict, @"IOReportGroupName");
  unsigned __int8 v4 = _validateStr(Value);
  if (v4 && CFEqual(v4, *(CFTypeRef *)(a1 + 32))) {
    return 0;
  }
  else {
    return 16;
  }
}

uint64_t __IOReportSelectChannelsInGroup_block_invoke_2(uint64_t a1, CFDictionaryRef theDict)
{
  CFArrayRef Value = CFDictionaryGetValue(theDict, @"IOReportSubGroupName");
  unsigned __int8 v4 = _validateStr(Value);
  if (v4 && CFEqual(v4, *(CFTypeRef *)(a1 + 32))) {
    return 0;
  }
  else {
    return 16;
  }
}

uint64_t __IOReportSelectChannelsInGroup_block_invoke_3(uint64_t a1, CFDictionaryRef theDict)
{
  CFArrayRef Value = CFDictionaryGetValue(theDict, @"IOReportGroupName");
  char v5 = _validateStr(Value);
  unint64_t v6 = CFDictionaryGetValue(theDict, @"IOReportSubGroupName");
  CFDictionaryRef v7 = _validateStr(v6);
  if (v5) {
    BOOL v8 = v7 == 0;
  }
  else {
    BOOL v8 = 1;
  }
  if (!v8 && (CFIndex v9 = v7, CFEqual(v5, *(CFTypeRef *)(a1 + 32))) && CFEqual(v9, *(CFTypeRef *)(a1 + 40))) {
    return 0;
  }
  else {
    return 16;
  }
}

__CFDictionary *IOReportCopyChannelsWithUnit(uint64_t a1, int a2, CFErrorRef *a3)
{
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 0x40000000;
  v4[2] = __IOReportCopyChannelsWithUnit_block_invoke;
  v4[3] = &__block_descriptor_tmp_12_0;
  void v4[4] = a1;
  return IOReportCopyFilteredChannels(a2, a3, (uint64_t)v4);
}

uint64_t __IOReportCopyChannelsWithUnit_block_invoke(uint64_t a1, const __CFDictionary *a2)
{
  return 16 * (IOReportChannelGetUnit(a2) != *(void *)(a1 + 32));
}

uint64_t IOReportAddChannelDescription(const __CFDictionary *a1, uint64_t a2, const void *a3, uint64_t a4, uint64_t a5, const void *a6, const void *a7, const void *a8, const void *a9, CFErrorRef *a10)
{
  uint64_t v15 = 3758097084;
  LegendChannel = _createLegendChannel(a4, a5, a6, a10);
  if (LegendChannel)
  {
    CFTypeID v17 = LegendChannel;
    Channel = _createChannel(a2, a3, LegendChannel, a7, a8, a9, a10);
    if (Channel)
    {
      CFDataRef v19 = Channel;
      char AggregateOpts = _getAggregateOpts(a1);
      uint64_t v15 = _addChannel(a1, v19, AggregateOpts, a10);
      CFRelease(v19);
    }
    CFRelease(v17);
  }
  return v15;
}

__CFArray *_createLegendChannel(uint64_t a1, uint64_t a2, const void *a3, CFErrorRef *a4)
{
  uint64_t v13 = a2;
  uint64_t valuePtr = a1;
  CFMutableArrayRef Mutable = CFArrayCreateMutable(0, 0, MEMORY[0x263EFFF70]);
  if (Mutable)
  {
    CFDictionaryRef v7 = Mutable;
    CFNumberRef v8 = CFNumberCreate(0, kCFNumberLongLongType, &valuePtr);
    if (v8)
    {
      CFNumberRef v9 = v8;
      CFArraySetValueAtIndex(v7, 0, v8);
      CFRelease(v9);
      CFNumberRef v10 = CFNumberCreate(0, kCFNumberLongLongType, &v13);
      if (v10)
      {
        CFNumberRef v11 = v10;
        CFArraySetValueAtIndex(v7, 1, v10);
        CFRelease(v11);
        if (a3) {
          CFArraySetValueAtIndex(v7, 2, a3);
        }
        return v7;
      }
    }
    CFRelease(v7);
  }
  CFDictionaryRef v7 = 0;
  if (a4) {
    *a4 = createCFErr(-536870211, "couldn't create channel legend");
  }
  return v7;
}

__CFDictionary *_createChannel(uint64_t a1, const void *a2, CFArrayRef theArray, const void *a4, const void *a5, const void *a6, CFErrorRef *a7)
{
  uint64_t valuePtr = a1;
  if (CFArrayGetCount(theArray) < 2) {
    goto LABEL_2;
  }
  CFNumberRef ValueAtIndex = CFArrayGetValueAtIndex(theArray, 0);
  uint64_t v15 = CFArrayGetValueAtIndex(theArray, 1);
  unint64_t v16 = _validateInt(ValueAtIndex);
  CFNumberRef v13 = 0;
  if (v16 != 0x8000000000000000)
  {
    if (_validateInt(v15) == 0x8000000000000000)
    {
LABEL_2:
      CFNumberRef v13 = 0;
      goto LABEL_4;
    }
    CFNumberRef v13 = CFNumberCreate(0, kCFNumberLongLongType, &valuePtr);
    if (v13)
    {
      CFMutableArrayRef Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
      if (Mutable)
      {
        CFTypeID v17 = Mutable;
        CFDictionarySetValue(Mutable, @"DriverID", v13);
        CFDictionarySetValue(v17, @"DriverName", a2);
        CFDictionarySetValue(v17, @"LegendChannel", theArray);
        if (a4) {
          CFDictionarySetValue(v17, @"IOReportGroupName", a4);
        }
        if (a5) {
          CFDictionarySetValue(v17, @"IOReportSubGroupName", a5);
        }
        if (a6) {
          CFDictionarySetValue(v17, @"IOReportChannelInfo", a6);
        }
        goto LABEL_7;
      }
    }
  }
LABEL_4:
  if (a7) {
    *a7 = createCFErr(-536870212, "couldn't create channel");
  }
  CFTypeID v17 = 0;
  uint64_t result = 0;
  if (v13)
  {
LABEL_7:
    CFRelease(v13);
    return v17;
  }
  return result;
}

uint64_t _addChannel(const __CFDictionary *a1, const void *a2, char a3, CFErrorRef *a4)
{
  uint64_t v5 = 3758097090;
  if (!a1) {
    goto LABEL_19;
  }
  if (!a2) {
    goto LABEL_19;
  }
  CFDictionaryRef v8 = a1;
  CFTypeID v9 = CFGetTypeID(a1);
  uint64_t v5 = 3758097090;
  if (v9 != CFDictionaryGetTypeID()) {
    goto LABEL_19;
  }
  CFTypeID v10 = CFGetTypeID(a2);
  if (v10 != CFDictionaryGetTypeID()) {
    goto LABEL_19;
  }
  if (a3)
  {
    CFMutableDictionaryRef AddDict = _findAddDict(v8, @"IOReportDrivers");
    if (!AddDict) {
      goto LABEL_18;
    }
    CFDictionaryRef v23 = AddDict;
    CFArrayRef Value = CFDictionaryGetValue((CFDictionaryRef)a2, @"DriverName");
    if (!Value) {
      goto LABEL_18;
    }
    CFDictionaryRef v8 = _findAddDict(v23, Value);
    if (!v8) {
      goto LABEL_18;
    }
  }
  if ((a3 & 2) != 0)
  {
    CFNumberRef v11 = CFDictionaryGetValue((CFDictionaryRef)a2, @"IOReportGroupName");
    long long v12 = _validateStr(v11);
    if (v12)
    {
      CFNumberRef v13 = v12;
      CFDictionaryRef v14 = _findAddDict(v8, @"IOReportChannelGroups");
      if (!v14) {
        goto LABEL_18;
      }
      CFDictionaryRef v8 = _findAddDict(v14, v13);
      uint64_t v15 = CFDictionaryGetValue((CFDictionaryRef)a2, @"IOReportSubGroupName");
      unint64_t v16 = _validateStr(v15);
      if (v16)
      {
        CFTypeID v17 = v16;
        CFDictionaryRef v18 = _findAddDict(v8, @"IOReportChannelGroups");
        if (v18)
        {
          CFDictionaryRef v8 = _findAddDict(v18, v17);
          goto LABEL_12;
        }
LABEL_18:
        uint64_t v5 = 3758097084;
        goto LABEL_19;
      }
    }
  }
LABEL_12:
  CFDataRef v19 = (__CFArray *)CFDictionaryGetValue(v8, @"IOReportChannels");
  if (v19)
  {
    uint64_t v20 = v19;
    CFTypeID v21 = CFGetTypeID(v19);
    uint64_t v5 = 3758097084;
    if (v21 != CFArrayGetTypeID()) {
      goto LABEL_19;
    }
LABEL_24:
    CFArrayAppendValue(v20, a2);
    return 0;
  }
  CFMutableArrayRef Mutable = CFArrayCreateMutable(0, 0, MEMORY[0x263EFFF70]);
  uint64_t v5 = 3758097084;
  if (Mutable)
  {
    uint64_t v20 = Mutable;
    CFDictionarySetValue(v8, @"IOReportChannels", Mutable);
    CFRelease(v20);
    goto LABEL_24;
  }
LABEL_19:
  if (a4) {
    *a4 = createCFErr((int)v5, "_addChannel() failed");
  }
  return v5;
}

CFNumberRef _getAggregateOpts(const __CFDictionary *a1)
{
  CFNumberRef result = (const __CFNumber *)CFDictionaryGetValue(a1, @"QueryOpts");
  if (result)
  {
    CFNumberRef v2 = result;
    CFTypeID v3 = CFGetTypeID(result);
    if (v3 == CFNumberGetTypeID())
    {
      unsigned int valuePtr = 0;
      if (CFNumberGetValue(v2, kCFNumberIntType, &valuePtr)) {
        return (const __CFNumber *)valuePtr;
      }
      else {
        return 0;
      }
    }
    else
    {
      return 0;
    }
  }
  return result;
}

__CFDictionary *IOReportCreateUnitInfo(uint64_t a1)
{
  uint64_t valuePtr = a1;
  CFMutableArrayRef Mutable = CFDictionaryCreateMutable(0, 1, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
  if (Mutable)
  {
    CFNumberRef v2 = CFNumberCreate(0, kCFNumberLongLongType, &valuePtr);
    if (v2)
    {
      CFNumberRef v3 = v2;
      CFDictionarySetValue(Mutable, @"IOReportChannelUnit", v2);
    }
    else
    {
      CFNumberRef v3 = Mutable;
      CFMutableArrayRef Mutable = 0;
    }
    CFRelease(v3);
  }
  return Mutable;
}

CFStringRef IOReportCopyDriverName(uint64_t a1)
{
  kern_return_t RegistryEntryID;
  CFStringRef result;
  uint64_t entryID;
  _OWORD v5[8];
  uint64_t v6;

  unint64_t v6 = *MEMORY[0x263EF8340];
  memset(v5, 0, sizeof(v5));
  entryID = 0;
  RegistryEntryID = IORegistryEntryGetRegistryEntryID(a1, &entryID);
  CFNumberRef result = 0;
  if (!RegistryEntryID)
  {
    if (MEMORY[0x210570670](a1, v5)) {
      return 0;
    }
    else {
      return CFStringCreateWithFormat(0, 0, @"%s <id %#llx>", v5, entryID);
    }
  }
  return result;
}

CFStringRef IOReportCopyCurrentProcessName()
{
  CFDictionaryRef v0 = getprogname();
  uint64_t v1 = getpid();
  return CFStringCreateWithFormat(0, 0, @"%s <pid %d>", v0, v1);
}

__CFDictionary *IOReportCopyChannelsWithID(const void *a1, uint64_t a2, CFErrorRef *a3)
{
  if (!a1) {
    return 0;
  }
  Aggregate = IOReportCreateAggregate(0);
  if (Aggregate)
  {
    CFDictionaryRef v7 = Aggregate;
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 0x40000000;
    v9[2] = __IOReportCopyChannelsWithID_block_invoke;
    v9[3] = &__block_descriptor_tmp_20;
    v9[4] = a2;
    v9[5] = a3;
    v9[6] = Aggregate;
    if (_iterateMatches(a1, (uint64_t)v9))
    {
      CFRelease(v7);
      return 0;
    }
  }
  else
  {
    if (!a3) {
      return 0;
    }
    CFDictionaryRef v7 = 0;
    *a3 = createCFErr(-536870211, "couldn't make dict");
  }
  return v7;
}

uint64_t __IOReportCopyChannelsWithID_block_invoke(uint64_t a1, uint64_t a2)
{
  LegendChannel = _createLegendChannel(*(void *)(a1 + 32), 0, 0, *(CFErrorRef **)(a1 + 40));
  if (!LegendChannel) {
    return 3758097084;
  }
  uint64_t v5 = LegendChannel;
  DriverChannel = _createDriverChannel(a2, LegendChannel, 0, 0, 0, 0, *(CFErrorRef **)(a1 + 40));
  CFRelease(v5);
  if (!DriverChannel) {
    return 3758097084;
  }
  uint64_t v7 = _addChannel(*(const __CFDictionary **)(a1 + 48), DriverChannel, 0, *(CFErrorRef **)(a1 + 40));
  CFRelease(DriverChannel);
  return v7;
}

__CFDictionary *_createDriverChannel(uint64_t a1, const __CFArray *a2, const void *a3, const void *a4, const void *a5, uint64_t a6, CFErrorRef *a7)
{
  kern_return_t RegistryEntryID;
  __CFDictionary *v15;
  CFStringRef v16;
  CFStringRef v17;
  __CFDictionary *Channel;
  int v19;
  uint64_t entryID;

  entryID = 0;
  RegistryEntryID = IORegistryEntryGetRegistryEntryID(a1, &entryID);
  if (RegistryEntryID)
  {
    if (a7)
    {
      uint64_t v15 = 0;
      *a7 = createCFErr(RegistryEntryID, "error extracting driver info");
      return v15;
    }
    return 0;
  }
  unint64_t v16 = IOReportCopyDriverName(a1);
  if (!v16) {
    return 0;
  }
  CFTypeID v17 = v16;
  Channel = _createChannel(entryID, v16, a2, a3, a4, a5, a7);
  uint64_t v15 = Channel;
  if (a6)
  {
    if (Channel)
    {
      CFDataRef v19 = (*(uint64_t (**)(uint64_t, __CFDictionary *))(a6 + 16))(a6, Channel);
      if (v19)
      {
        if (a7 && v19 != 16) {
          *a7 = createCFErr(5, "channel filter returned an error");
        }
        CFRelease(v15);
        uint64_t v15 = 0;
      }
    }
  }
  CFRelease(v17);
  return v15;
}

__CFDictionary *_IOReportCopyChannelsForDriver(uint64_t a1, int a2, uint64_t a3, CFErrorRef *a4)
{
  int64_t v5 = 0xE00002C200000000;
  if (!a1 || !IOObjectGetUserRetainCount(a1))
  {
    CFNumberRef v13 = 0;
    uint64_t v39 = "invalid driver";
    goto LABEL_39;
  }
  Aggregate = IOReportCreateAggregate(a2);
  if (!Aggregate)
  {
    CFNumberRef v13 = 0;
    int64_t v5 = 0xE00002BD00000000;
    uint64_t v39 = "could not allocate collection";
    goto LABEL_39;
  }
  CFTypeID v10 = Aggregate;
  CFTypeRef CFProperty = IORegistryEntryCreateCFProperty(a1, @"IOReportLegendPublic", 0, 0);
  if (!CFProperty) {
    return v10;
  }
  CFRelease(CFProperty);
  CFTypeRef v12 = IORegistryEntryCreateCFProperty(a1, @"IOReportLegend", (CFAllocatorRef)*MEMORY[0x263EFFB08], 0);
  CFNumberRef v13 = v12;
  if (!v12)
  {
    uint64_t v39 = "no legend";
    uint64_t v41 = 0x2F000000000;
LABEL_51:
    int64_t v5 = v41 & 0xFFFFFFFFFFFFLL | 0xE000000000000000;
    CFRelease(v10);
LABEL_39:
    if (a4 && !*a4)
    {
      CFTypeID v10 = 0;
      *a4 = createCFErr(v5 >> 32, v39);
      if (!v13) {
        return v10;
      }
      goto LABEL_43;
    }
    CFTypeID v10 = 0;
    goto LABEL_42;
  }
  CFTypeID v14 = CFGetTypeID(v12);
  if (v14 != CFArrayGetTypeID())
  {
    CFRelease(v13);
    CFNumberRef v13 = 0;
    uint64_t v39 = "bad legend";
    uint64_t v41 = 0x2C900000000;
    goto LABEL_51;
  }
  uint64_t v47 = 0;
  if (a4) {
    uint64_t v15 = a4;
  }
  else {
    uint64_t v15 = (CFErrorRef *)&v47;
  }
  if (CFArrayGetCount((CFArrayRef)v13) < 1) {
    goto LABEL_43;
  }
  char v43 = a2;
  v44 = v15;
  uint64_t v45 = a3;
  CFIndex v16 = 0;
  do
  {
    CFDictionaryRef ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex((CFArrayRef)v13, v16);
    if (!ValueAtIndex) {
      break;
    }
    CFDictionaryRef v18 = ValueAtIndex;
    CFTypeID v19 = CFGetTypeID(ValueAtIndex);
    if (v19 != CFDictionaryGetTypeID()) {
      break;
    }
    CFArrayRef Value = CFDictionaryGetValue(v18, @"IOReportGroupName");
    if (!Value || (v21 = Value, CFTypeID v22 = CFGetTypeID(Value), v22 != CFStringGetTypeID())) {
      CFTypeID v21 = 0;
    }
    CFDictionaryRef v23 = CFDictionaryGetValue(v18, @"IOReportSubGroupName");
    uint64_t v24 = v23;
    if (v23)
    {
      CFTypeID v25 = CFGetTypeID(v23);
      if (v25 == CFStringGetTypeID())
      {
        if (!v21) {
          break;
        }
      }
      else
      {
        uint64_t v24 = 0;
      }
    }
    unint64_t v26 = CFDictionaryGetValue(v18, @"IOReportChannelInfo");
    if (!v26 || (int v27 = v26, v28 = CFGetTypeID(v26), v28 != CFDictionaryGetTypeID())) {
      int v27 = 0;
    }
    CFArrayRef v29 = (const __CFArray *)CFDictionaryGetValue(v18, @"IOReportChannels");
    if (!v29) {
      break;
    }
    CFArrayRef v30 = v29;
    CFTypeID v31 = CFGetTypeID(v29);
    if (v31 != CFArrayGetTypeID()) {
      break;
    }
    long long v46 = v21;
    CFIndex v42 = v16;
    if (CFArrayGetCount(v30) >= 1)
    {
      CFIndex v32 = 0;
      do
      {
        CFArrayRef v33 = (const __CFArray *)CFArrayGetValueAtIndex(v30, v32);
        if (!v33) {
          break;
        }
        CFArrayRef v34 = v33;
        CFTypeID v35 = CFGetTypeID(v33);
        if (v35 != CFArrayGetTypeID()) {
          break;
        }
        DriverChannel = _createDriverChannel(a1, v34, v46, v24, v27, v45, v44);
        if (DriverChannel)
        {
          uint64_t v37 = DriverChannel;
          int v38 = _addChannel(v10, DriverChannel, v43, v44);
          CFRelease(v37);
          if (v38) {
            goto LABEL_50;
          }
        }
        else if (*v44)
        {
LABEL_50:
          uint64_t v39 = 0;
          uint64_t v41 = 0x2BC00000000;
          goto LABEL_51;
        }
      }
      while (++v32 < CFArrayGetCount(v30));
    }
    CFIndex v16 = v42 + 1;
  }
  while (v42 + 1 < CFArrayGetCount((CFArrayRef)v13));
LABEL_42:
  if (v13) {
LABEL_43:
  }
    CFRelease(v13);
  return v10;
}

__CFDictionary *IOReportCopyAllChannels(int a1, CFErrorRef *a2)
{
  return IOReportCopyFilteredChannels(a1, a2, 0);
}

uint64_t __IOReportCopyFilteredChannels_block_invoke(uint64_t a1, uint64_t a2)
{
  CFTypeRef cf = 0;
  unsigned __int8 v4 = _IOReportCopyChannelsForDriver(a2, *(_DWORD *)(a1 + 56), *(void *)(a1 + 32), (CFErrorRef *)&cf);
  if (v4)
  {
    int64_t v5 = (__CFString *)v4;
    uint64_t v6 = IOReportMergeChannels(*(const __CFDictionary **)(a1 + 40), v4, *(CFErrorRef **)(a1 + 48));
  }
  else
  {
    int64_t v5 = (__CFString *)IOReportCopyDriverName(a2);
    iorErrLog(*(_DWORD *)(a1 + 56), v5, (CFErrorRef)cf);
    uint64_t v6 = 0;
    uint64_t v7 = 0;
    if (!v5) {
      goto LABEL_5;
    }
  }
  CFRelease(v5);
  uint64_t v7 = v6;
LABEL_5:
  if (cf) {
    CFRelease(cf);
  }
  return v7;
}

BOOL __IOReportMergeChannels_block_invoke(uint64_t a1, const void *a2)
{
  return _addChannel(*(const __CFDictionary **)(a1 + 32), a2, *(_DWORD *)(a1 + 48), *(CFErrorRef **)(a1 + 40)) != 0;
}

uint64_t setChannelType(const __CFDictionary *a1, const void *a2)
{
  uint64_t v3 = 3758097084;
  CFArrayRef Value = (__CFArray *)CFDictionaryGetValue(a1, @"LegendChannel");
  if (Value)
  {
    int64_t v5 = Value;
    CFTypeID v6 = CFGetTypeID(Value);
    if (v6 == CFArrayGetTypeID())
    {
      CFNumberRef v7 = CFNumberCreate(0, kCFNumberLongLongType, a2);
      if (v7)
      {
        CFNumberRef v8 = v7;
        CFArraySetValueAtIndex(v5, 1, v7);
        CFRelease(v8);
        return 0;
      }
    }
  }
  return v3;
}

CFDictionaryRef getChannelConfig(const __CFDictionary *result)
{
  if (result)
  {
    CFNumberRef result = (const __CFDictionary *)_getChannelConfigDict(result);
    if (result)
    {
      CFNumberRef result = (const __CFDictionary *)CFDictionaryGetValue(result, @"IOReportChannelConfig");
      if (result)
      {
        CFDictionaryRef v1 = result;
        CFTypeID v2 = CFGetTypeID(result);
        if (v2 == CFDataGetTypeID()) {
          return v1;
        }
        else {
          return 0;
        }
      }
    }
  }
  return result;
}

CFDictionaryRef IOReportChannelCopyDescription(const __CFDictionary *result, uint64_t a2, const char *a3)
{
  if (result)
  {
    CFDictionaryRef v4 = result;
    unint64_t v18 = 0;
    CFArrayRef Value = CFDictionaryGetValue(result, @"DriverName");
    ChDetail = _getChDetail(v4, 0);
    unint64_t v7 = _validateInt(ChDetail);
    int ChannelType = getChannelType(v4, &v18);
    CFNumberRef result = 0;
    if (!ChannelType)
    {
      ChannelName = IOReportChannelGetChannelName(v4);
      UnitLabel = IOReportChannelGetUnitLabel(v4);
      CFNumberRef v11 = CFDictionaryGetValue(v4, @"IOReportGroupName");
      CFTypeRef v12 = (__CFString *)_validateStr(v11);
      CFNumberRef v13 = CFDictionaryGetValue(v4, @"IOReportSubGroupName");
      CFTypeID v14 = (__CFString *)_validateStr(v13);
      uint64_t v15 = "";
      if (a3) {
        uint64_t v15 = a3;
      }
      CFIndex v16 = @"(none)";
      if (v12) {
        CFTypeID v17 = v12;
      }
      else {
        CFTypeID v17 = @"(none)";
      }
      if (v14) {
        CFIndex v16 = v14;
      }
      return (const __CFDictionary *)CFStringCreateWithFormat(0, 0, @"%s%@ %@ < %#llx (%@) | G/g %@/%@ | cat %#04x | format %#04x | elts %u >\n", v15, Value, ChannelName, v7, UnitLabel, v17, v16, WORD1(v18), v18, WORD2(v18));
    }
  }
  return result;
}

CFDictionaryRef IOReportChannelGetDriverName(const __CFDictionary *result)
{
  if (result) {
    return (const __CFDictionary *)CFDictionaryGetValue(result, @"DriverName");
  }
  return result;
}

CFMutableDictionaryRef _findAddDict(const __CFDictionary *a1, const void *a2)
{
  CFArrayRef Value = (__CFDictionary *)CFDictionaryGetValue(a1, a2);
  if (Value)
  {
    CFMutableDictionaryRef Mutable = Value;
    CFTypeID v6 = CFGetTypeID(Value);
    if (v6 != CFDictionaryGetTypeID()) {
      return 0;
    }
  }
  else
  {
    CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
    if (Mutable)
    {
      CFDictionarySetValue(a1, a2, Mutable);
      CFRelease(Mutable);
    }
  }
  return Mutable;
}

unint64_t IOReportHistogramGetBucketMinValue(const __CFDictionary *a1, int a2)
{
  memset(v3, 0, sizeof(v3));
  if (_getHistogramValues(a1, a2, v3)) {
    return 0x8000000000000000;
  }
  else {
    return *((void *)&v3[0] + 1);
  }
}

unint64_t IOReportHistogramGetBucketMaxValue(const __CFDictionary *a1, int a2)
{
  long long v3 = 0u;
  long long v4 = 0u;
  if (_getHistogramValues(a1, a2, &v3)) {
    return 0x8000000000000000;
  }
  else {
    return v4;
  }
}

unint64_t IOReportHistogramGetBucketSum(const __CFDictionary *a1, int a2)
{
  long long v3 = 0u;
  long long v4 = 0u;
  if (_getHistogramValues(a1, a2, &v3)) {
    return 0x8000000000000000;
  }
  else {
    return *((void *)&v4 + 1);
  }
}

unint64_t IOReportHistogramGetMinValue(const __CFDictionary *a1)
{
  Bucketunsigned int Count = IOReportHistogramGetBucketCount(a1);
  if (BucketCount < 1) {
    return 0x8000000000000000;
  }
  int v3 = BucketCount;
  int v4 = 0;
  while (1)
  {
    long long v6 = 0u;
    long long v7 = 0u;
    if (_getHistogramValues(a1, v4, &v6) || (void)v6) {
      break;
    }
    if (v3 == ++v4) {
      return 0x8000000000000000;
    }
  }
  long long v6 = 0u;
  long long v7 = 0u;
  if (_getHistogramValues(a1, v4, &v6)) {
    return 0x8000000000000000;
  }
  else {
    return *((void *)&v6 + 1);
  }
}

unint64_t IOReportHistogramGetMaxValue(const __CFDictionary *a1)
{
  Bucketunsigned int Count = IOReportHistogramGetBucketCount(a1);
  do
  {
    if (!BucketCount) {
      return 0x8000000000000000;
    }
    --BucketCount;
    long long v4 = 0u;
    long long v5 = 0u;
  }
  while (!_getHistogramValues(a1, BucketCount, &v4) && !(void)v4);
  long long v4 = 0u;
  long long v5 = 0u;
  if (_getHistogramValues(a1, BucketCount, &v4)) {
    return 0x8000000000000000;
  }
  else {
    return v5;
  }
}

unint64_t IOReportStateGetIDForIndex(const __CFDictionary *a1, int a2)
{
  memset(v3, 0, sizeof(v3));
  if (_getStateValues(a1, a2, v3)) {
    return 0x8000000000000000;
  }
  else {
    return *(void *)&v3[0];
  }
}

uint64_t IOReportStateGetIndexForID(const __CFDictionary *a1, uint64_t a2)
{
  int Count = IOReportStateGetCount(a1);
  if ((Count & 0x80000000) == 0)
  {
    LODWORD(v5) = Count;
    while (v5)
    {
      uint64_t v5 = (v5 - 1);
      memset(v9, 0, sizeof(v9));
      int StateValues = _getStateValues(a1, v5, v9);
      unint64_t v7 = *(void *)&v9[0];
      if (StateValues) {
        unint64_t v7 = 0x8000000000000000;
      }
      if (v7 == a2) {
        return v5;
      }
    }
  }
  return 0xFFFFFFFFLL;
}

uint64_t IOReportStateGetCurrent(const __CFDictionary *a1)
{
  unsigned __int16 v12 = 0;
  if (!a1) {
    return 0xFFFFFFFFLL;
  }
  RawElements = getRawElements(a1, &v12, 2);
  if (!RawElements) {
    return 0xFFFFFFFFLL;
  }
  int v3 = RawElements;
  int v4 = v12;
  unint64_t v13 = 0;
  if (getChannelType(a1, &v13) || v13 != 2 || WORD2(v13) != v4 || !v12) {
    return 0xFFFFFFFFLL;
  }
  uint64_t v5 = 0;
  unint64_t v6 = 0;
  unint64_t v7 = (unint64_t *)(v3 + 24);
  LODWORD(result) = -1;
  do
  {
    unint64_t v10 = *v7;
    v7 += 8;
    unint64_t v9 = v10;
    BOOL v11 = v10 > v6;
    if (v10 <= v6) {
      uint64_t result = result;
    }
    else {
      uint64_t result = v5;
    }
    if (v11) {
      unint64_t v6 = v9;
    }
    ++v5;
  }
  while (v12 != v5);
  return result;
}

CFMutableDictionaryRef IOReportSampleCreateDelta(CFDictionaryRef theDict, const __CFDictionary *a2, CFErrorRef *a3)
{
  CFMutableDictionaryRef MutableCopy = CFDictionaryCreateMutableCopy(0, 0, theDict);
  if (_compareSamples(theDict, a2, MutableCopy, a3))
  {
    CFRelease(MutableCopy);
    return 0;
  }
  return MutableCopy;
}

__CFString *IOReportSampleCopyDescription(const __CFDictionary *a1, char a2, const char *a3)
{
  uint64_t v63 = *MEMORY[0x263EF8340];
  unsigned __int16 v56 = 0;
  strcpy(__str, "<unknown>");
  uint64_t v5 = "";
  if (a3) {
    uint64_t v5 = a3;
  }
  v53 = v5;
  CFMutableStringRef Mutable = CFStringCreateMutable(0, 0);
  if (!Mutable)
  {
    unint64_t v13 = 0;
    CFTypeID v14 = 0;
    if ((a2 & 1) == 0)
    {
LABEL_64:
      unint64_t v7 = 0;
      goto LABEL_65;
    }
    goto LABEL_9;
  }
  unint64_t v7 = Mutable;
  int Format = IOReportChannelGetFormat(a1);
  RawElements = getRawElements(a1, &v56, Format);
  ChannelName = IOReportChannelGetChannelName(a1);
  if (!ChannelName)
  {
    unint64_t v13 = 0;
    goto LABEL_14;
  }
  CFStringRef v11 = ChannelName;
  CStringPtr = CFStringGetCStringPtr(ChannelName, 0x8000100u);
  if (!CStringPtr)
  {
    unint64_t v13 = _copyUTF8Chars(v11);
    if (v13)
    {
LABEL_16:
      CFTypeID v14 = v13;
      if (!RawElements) {
        goto LABEL_63;
      }
      goto LABEL_17;
    }
LABEL_14:
    if (RawElements)
    {
      unint64_t v13 = __str;
      snprintf(__str, 0xAuLL, "%#llx", *((void *)RawElements + 1));
      CFTypeID v14 = 0;
      goto LABEL_17;
    }
    goto LABEL_16;
  }
  unint64_t v13 = (void *)CStringPtr;
  CFTypeID v14 = 0;
  if (!RawElements)
  {
LABEL_63:
    CFRelease(v7);
    if ((a2 & 1) == 0) {
      goto LABEL_64;
    }
LABEL_9:
    uint64_t v15 = "???";
    if (v13) {
      uint64_t v15 = (const char *)v13;
    }
    unint64_t v7 = (__CFString *)CFStringCreateWithFormat(0, 0, @"%s%32s =  %s \n", v53, v15, "error");
    goto LABEL_65;
  }
LABEL_17:
  UnitLabel = IOReportChannelGetUnitLabel(a1);
  if (v56)
  {
    CFTypeID v17 = UnitLabel;
    v52 = v14;
    char v51 = a2;
    uint64_t v18 = 0;
    unint64_t v19 = 0;
    uint64_t v20 = RawElements + 32;
    while (2)
    {
      uint64_t v54 = 0;
      uint64_t v55 = 0;
      *(void *)buffer = 0;
      uint64_t v60 = 0;
      int v61 = 0;
      switch(IOReportChannelGetFormat(a1))
      {
        case 1u:
          IntegerCFArrayRef Value = IOReportSimpleGetIntegerValue(a1, 0);
          CFStringRef v21 = CFStringCreateWithFormat(0, 0, @"%s%32s = { %12lld %@ }\n", v53, v13, IntegerValue, v17, v43, v44, v45, v47, v48);
          goto LABEL_57;
        case 2u:
          NameForIndex = IOReportStateGetNameForIndex(a1, v19);
          if (!NameForIndex
            || (CFStringRef v23 = (const __CFString *)NameForIndex,
                (uint64_t v24 = (void *)CFStringGetCStringPtr((CFStringRef)NameForIndex, 0x8000100u)) == 0)
            && (uint64_t v24 = buffer, !CFStringGetCString(v23, buffer, 20, 0x8000100u)))
          {
            long long v57 = 0u;
            long long v58 = 0u;
            int StateValues = _getStateValues(a1, v19, &v57);
            unint64_t v26 = v57;
            if (StateValues) {
              unint64_t v26 = 0x8000000000000000;
            }
            uint64_t v24 = buffer;
            snprintf(buffer, 0x14uLL, "%#llx", v26);
          }
          long long v57 = 0u;
          long long v58 = 0u;
          if (_getStateValues(a1, v19, &v57)) {
            unint64_t v27 = 0x8000000000000000;
          }
          else {
            unint64_t v27 = *((void *)&v57 + 1);
          }
          long long v57 = 0u;
          long long v58 = 0u;
          if (_getStateValues(a1, v19, &v57)) {
            unint64_t v28 = 0x8000000000000000;
          }
          else {
            unint64_t v28 = v58;
          }
          unint64_t Unit = IOReportChannelGetUnit(a1);
          double v30 = IOReportScaleValue(v28, Unit, 0x100000000000000uLL);
          double v46 = IOReportStateGetDutyCycle(a1, v19) * 100.0;
          CFStringRef v21 = CFStringCreateWithFormat(0, 0, @"%s%20s[%8s] = { # %-8llu %9.3e %s / %4.1f%% }\n", v53, v13, v24, v27, *(void *)&v30, "s", *(void *)&v46, v47, v48);
          goto LABEL_57;
        case 3u:
          if (IOReportHistogramGetBucketBounds(a1, v19, &v55, &v54)) {
            goto LABEL_62;
          }
          long long v57 = 0u;
          long long v58 = 0u;
          if (_getHistogramValues(a1, v19, &v57)) {
            unint64_t v31 = 0x8000000000000000;
          }
          else {
            unint64_t v31 = v57;
          }
          if (v31)
          {
            if (v31 == 0x8000000000000000) {
              goto LABEL_62;
            }
            uint64_t v49 = v54;
            uint64_t v50 = v55;
            long long v57 = 0u;
            long long v58 = 0u;
            if (_getHistogramValues(a1, v19, &v57)) {
              unint64_t v32 = 0x8000000000000000;
            }
            else {
              unint64_t v32 = *((void *)&v57 + 1);
            }
            long long v57 = 0u;
            long long v58 = 0u;
            if (_getHistogramValues(a1, v19, &v57)) {
              unint64_t v33 = 0x8000000000000000;
            }
            else {
              unint64_t v33 = v58;
            }
            long long v57 = 0u;
            long long v58 = 0u;
            int HistogramValues = _getHistogramValues(a1, v19, &v57);
            unint64_t v35 = *((void *)&v58 + 1);
            if (HistogramValues) {
              unint64_t v35 = 0x8000000000000000;
            }
            CFStringRef v21 = CFStringCreateWithFormat(0, 0, @"%s%20s[%12lld - %12lld %@] = { m %12lld; M %12lld; s %12lld; # %12llu }\n",
                    v53,
                    v13,
                    v50,
                    v49,
                    v17,
                    v32,
                    v33,
                    v35,
                    v31);
          }
          else
          {
            CFStringRef v21 = CFStringCreateWithFormat(0, 0, @"%s%20s[%12lld - %12lld %@] = { <no hits>; # 0 }\n",
                    v53,
                    v13,
                    v55,
                    v54,
                    v17,
                    v44,
                    v45,
                    v47,
                    v48);
          }
LABEL_57:
          uint64_t v37 = (__CFString *)v21;
LABEL_58:
          if (!v37)
          {
LABEL_62:
            a2 = v51;
            CFTypeID v14 = v52;
            goto LABEL_63;
          }
          CFStringAppend(v7, v37);
          CFRelease(v37);
          ++v19;
          v18 += 4;
          v20 += 64;
          if (v19 < v56) {
            continue;
          }
          CFTypeID v14 = v52;
          break;
        case 4u:
          CFMutableStringRef v36 = CFStringCreateMutable(0, 0);
          if (!v36) {
            goto LABEL_62;
          }
          uint64_t v37 = v36;
          uint64_t v38 = 0;
          while (2)
          {
            if (*(void *)&v20[8 * v38] == 0x8000000000000000) {
              goto LABEL_54;
            }
            CFStringRef v39 = CFStringCreateWithFormat(0, 0, @"%s%28s[%4d] = { %12lld %@ }\n", v53, v13, v18 + v38, *(void *)&v20[8 * v38], v17);
            if (v39)
            {
              CFStringRef v40 = v39;
              CFStringAppend(v37, v39);
              CFRelease(v40);
LABEL_54:
              if (++v38 == 4) {
                goto LABEL_58;
              }
              continue;
            }
            break;
          }
          CFRelease(v37);
          goto LABEL_62;
        default:
          goto LABEL_62;
      }
      break;
    }
  }
LABEL_65:
  if (v14) {
    free(v14);
  }
  return v7;
}

void *_copyUTF8Chars(const __CFString *a1)
{
  CFIndex Length = CFStringGetLength(a1);
  size_t MaximumSizeForEncoding = CFStringGetMaximumSizeForEncoding(Length, 0x8000100u);
  if (!MaximumSizeForEncoding) {
    return 0;
  }
  CFIndex v4 = MaximumSizeForEncoding;
  uint64_t v5 = malloc_type_malloc(MaximumSizeForEncoding, 0x68F1A396uLL);
  if (v5 && !CFStringGetCString(a1, (char *)v5, v4, 0x8000100u))
  {
    free(v5);
    return 0;
  }
  return v5;
}

uint64_t IOReportWriteStringUTF8(int a1, CFStringRef theString)
{
  if (!theString) {
    return 3758097090;
  }
  CStringPtr = CFStringGetCStringPtr(theString, 0x8000100u);
  if (CStringPtr)
  {
    uint64_t v5 = CStringPtr;
    unint64_t v6 = 0;
  }
  else
  {
    uint64_t v5 = (const char *)_copyUTF8Chars(theString);
    unint64_t v6 = (char *)v5;
    if (!v5) {
      return 3758097085;
    }
  }
  size_t v8 = strlen(v5);
  ssize_t v9 = write(a1, v5, v8);
  unsigned int v10 = -536870169;
  if (v9 == v8) {
    int v11 = 0;
  }
  else {
    int v11 = -536870212;
  }
  if (v9 >= v8) {
    unsigned int v10 = v11;
  }
  if (v9 >= 0) {
    uint64_t v7 = v10;
  }
  else {
    uint64_t v7 = 3758097098;
  }
  if (v6) {
    free(v6);
  }
  return v7;
}

CFDictionaryRef IOReportCreateSamplesProcessed(CFDictionaryRef theDict, CFErrorRef *a2)
{
  CFDictionaryRef MutableCopy = CFDictionaryCreateMutableCopy(0, 0, theDict);
  CFDictionaryRef v4 = MutableCopy;
  if (MutableCopy)
  {
    uint64_t v9 = 0;
    unsigned int v10 = &v9;
    uint64_t v11 = 0x2000000000;
    uint64_t v12 = 0;
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 0x40000000;
    _OWORD v8[2] = ___processSamples_block_invoke;
    v8[3] = &unk_264131760;
    v8[4] = &v9;
    int v5 = IOReportIterate(MutableCopy, (uint64_t)v8);
    int v6 = v5;
    if (a2 && v5)
    {
      *a2 = createCFErr(v5, (const char *)v10[3]);
      _Block_object_dispose(&v9, 8);
LABEL_6:
      CFRelease(v4);
      return 0;
    }
    _Block_object_dispose(&v9, 8);
    if (v6) {
      goto LABEL_6;
    }
  }
  return v4;
}

uint64_t ___processSamples_block_invoke(uint64_t a1, const __CFDictionary *a2)
{
  ChannelName = IOReportChannelGetChannelName(a2);
  CFDictionaryAddValue(a2, @"ChannelName", ChannelName);
  int Format = IOReportChannelGetFormat(a2);
  if (Format == 3)
  {
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = "error processing histogram report sample";
    Bucketint Count = IOReportHistogramGetBucketCount(a2);
    CFAllocatorRef v10 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
    CFMutableArrayRef Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, MEMORY[0x263EFFF70]);
    if (Mutable)
    {
      uint64_t v12 = Mutable;
      uint64_t v35 = 0;
      uint64_t v36 = 0;
      CFDictionaryAddValue(a2, @"Format", @"HistogramReport");
      if (BucketCount >= 1)
      {
        uint64_t v13 = 0;
        do
        {
          CFTypeID v14 = CFDictionaryCreateMutable(v10, 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
          if (!v14) {
            goto LABEL_26;
          }
          uint64_t v15 = v14;
          _add_uint64_val(v14, @"BucketIndex", v13);
          IOReportHistogramGetBucketBounds(a2, v13, &v36, &v35);
          _add_uint64_val(v15, @"LowBound", v36);
          _add_uint64_val(v15, @"HighBound", v35);
          unint64_t BucketHits = IOReportHistogramGetBucketHits(a2, v13);
          _add_uint64_val(v15, @"BucketHits", BucketHits);
          BucketMinCFArrayRef Value = IOReportHistogramGetBucketMinValue(a2, v13);
          _add_uint64_val(v15, @"BucketMin", BucketMinValue);
          BucketMaxCFArrayRef Value = IOReportHistogramGetBucketMaxValue(a2, v13);
          _add_uint64_val(v15, @"BucketMax", BucketMaxValue);
          unint64_t BucketSum = IOReportHistogramGetBucketSum(a2, v13);
          _add_uint64_val(v15, @"BucketSum", BucketSum);
          CFArrayAppendValue(v12, v15);
          CFRelease(v15);
        }
        while (BucketCount != ++v13);
      }
      if (CFArrayGetCount(v12))
      {
        uint64_t v20 = @"HistogramReport";
LABEL_22:
        CFDictionaryAddValue(a2, v20, v12);
      }
LABEL_23:
      _processUnit(a2);
      _cleanup_sample(a2);
      uint64_t v8 = 0;
LABEL_27:
      CFRelease(v12);
      return v8;
    }
    return 1;
  }
  if (Format == 2)
  {
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = "error processing state report sample";
    int Count = IOReportStateGetCount(a2);
    CFAllocatorRef v22 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
    CFMutableArrayRef v23 = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, MEMORY[0x263EFFF70]);
    if (v23)
    {
      uint64_t v12 = v23;
      CFDictionaryAddValue(a2, @"Format", @"StateReport");
      if (Count >= 1)
      {
        int v24 = 0;
        CFTypeID v25 = (const CFDictionaryValueCallBacks *)MEMORY[0x263EFFF90];
        while (1)
        {
          CFMutableDictionaryRef v26 = CFDictionaryCreateMutable(v22, 0, MEMORY[0x263EFFF88], v25);
          if (!v26) {
            break;
          }
          unint64_t v27 = v26;
          unint64_t v28 = IOReportStateGetInTransitions(a2, v24);
          _add_uint64_val(v27, @"InTransitions", v28);
          double DutyCycle = IOReportStateGetDutyCycle(a2, v24);
          _add_double_val(v27, @"DutyCycle", DutyCycle);
          unint64_t Residency = IOReportStateGetResidency(a2, v24);
          _add_uint64_val(v27, @"Residency", Residency);
          unint64_t IDForIndex = IOReportStateGetIDForIndex(a2, v24);
          _add_uint64_val(v27, @"StateID", IDForIndex);
          CFStringRef v32 = copyPrintableIDString(IDForIndex);
          if (v32)
          {
            CFStringRef v33 = v32;
            CFDictionaryAddValue(v27, @"StateName", v32);
            CFRelease(v33);
          }
          CFArrayAppendValue(v12, v27);
          CFRelease(v27);
          if (Count == ++v24) {
            goto LABEL_20;
          }
        }
LABEL_26:
        uint64_t v8 = 1;
        goto LABEL_27;
      }
LABEL_20:
      if (CFArrayGetCount(v12))
      {
        uint64_t v20 = @"StateReport";
        goto LABEL_22;
      }
      goto LABEL_23;
    }
    return 1;
  }
  if (Format != 1) {
    return 16;
  }
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = "error processing simple report sample";
  IntegerCFArrayRef Value = IOReportSimpleGetIntegerValue(a2, 0);
  if (IntegerValue == 0x8000000000000000) {
    return 1;
  }
  uint64_t v7 = IntegerValue;
  CFDictionaryAddValue(a2, @"Format", @"SimpleReport");
  _add_uint64_val(a2, @"SimpleReport", v7);
  _processUnit(a2);
  _cleanup_sample(a2);
  return 0;
}

void _processUnit(const __CFDictionary *a1)
{
  unint64_t Unit = IOReportChannelGetUnit(a1);
  if ((Unit & 0x7FFFFFFFFFFFFFFFLL) != 0)
  {
    unint64_t v3 = Unit;
    CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
    if (Mutable)
    {
      int v5 = Mutable;
      UnitLabel = IOReportChannelGetUnitLabel(a1);
      if (UnitLabel) {
        CFDictionaryAddValue(v5, @"UnitLabel", UnitLabel);
      }
      unint64_t v9 = 0;
      unint64_t v10 = 0;
      if (!getFactorsFromScale(v3 & 0xFFFFFFFFFFFFFFLL, (uint64_t *)&v10, (uint64_t *)&v9)) {
        _add_double_val(v5, @"UnitScale", (double)v10 / (double)v9);
      }
      CFStringRef v7 = copyUnitLabel(v3 & 0xFF00000000000000);
      if (v7)
      {
        CFStringRef v8 = v7;
        CFDictionaryAddValue(v5, @"BaseUnitLabel", v7);
        CFRelease(v8);
      }
      CFDictionaryAddValue(a1, @"Unit", v5);
      CFDictionaryAddValue(a1, @"Units", v5);
      CFRelease(v5);
    }
  }
}

void _cleanup_sample(__CFDictionary *a1)
{
  CFDictionaryRemoveValue(a1, @"IOReportChannelInfo");
  CFDictionaryRemoveValue(a1, @"DriverID");
  CFDictionaryRemoveValue(a1, @"LegendChannel");
  CFDictionaryRemoveValue(a1, @"ProcessedChannelConfig");

  CFDictionaryRemoveValue(a1, @"RawElements");
}

void _add_uint64_val(__CFDictionary *a1, const void *a2, uint64_t a3)
{
  uint64_t valuePtr = a3;
  CFNumberRef v5 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], kCFNumberLongLongType, &valuePtr);
  if (v5)
  {
    CFNumberRef v6 = v5;
    CFDictionaryAddValue(a1, a2, v5);
    CFRelease(v6);
  }
}

void _add_double_val(__CFDictionary *a1, const void *a2, double a3)
{
  double valuePtr = a3;
  CFNumberRef v5 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], kCFNumberDoubleType, &valuePtr);
  if (v5)
  {
    CFNumberRef v6 = v5;
    CFDictionaryAddValue(a1, a2, v5);
    CFRelease(v6);
  }
}

void IOReportIterateSamplesRaw_cold_1()
{
  uint64_t v1 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_2();
  _os_log_debug_impl(&dword_2104DE000, MEMORY[0x263EF8438], OS_LOG_TYPE_DEBUG, "iterated %d channels with %d iterations", v0, 0xEu);
}

void _visitSample_cold_1(const __CFDictionary *a1)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  IOReportChannelGetDriverName(a1);
  IOReportChannelGetGroup(a1);
  IOReportChannelGetSubGroup(a1);
  IOReportChannelGetChannelName(a1);
  OUTLINED_FUNCTION_1();
  _os_log_fault_impl(&dword_2104DE000, MEMORY[0x263EF8438], OS_LOG_TYPE_FAULT, "absurd element count! nelems=%d, %@ -- %@ -- %@ -- %@", v2, 0x30u);
}

void __IOReportUpdateSamplesRaw_block_invoke_cold_2(const __CFDictionary *a1)
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  IOReportChannelGetDriverName(a1);
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0();
  _os_log_fault_impl(&dword_2104DE000, MEMORY[0x263EF8438], OS_LOG_TYPE_FAULT, "Couldn't find kIOReportRawElementsKey, %@ -- %@ -- %@ -- %@", v1, 0x2Au);
}

void __IOReportUpdateSamplesRaw_block_invoke_cold_3(const __CFDictionary *a1)
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  IOReportChannelGetDriverName(a1);
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0();
  _os_log_fault_impl(&dword_2104DE000, MEMORY[0x263EF8438], OS_LOG_TYPE_FAULT, "samplesDict has bad elemsData error, %@ -- %@ -- %@ -- %@", v1, 0x2Au);
}

void __IOReportUpdateSamplesRaw_block_invoke_cold_4(const __CFDictionary *a1)
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  IOReportChannelGetDriverName(a1);
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0();
  _os_log_error_impl(&dword_2104DE000, MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR, "Didn't find provider_id channel_id match for samplesDict channel %@ -- %@ -- %@ -- %@", v1, 0x2Au);
}

void __IOReportUpdateSamplesRaw_block_invoke_cold_5(const __CFDictionary *a1)
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  IOReportChannelGetDriverName(a1);
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0();
  _os_log_error_impl(&dword_2104DE000, MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR, "Stale samplesDict, IOReporter elements count changed %@ -- %@ -- %@ -- %@", v1, 0x2Au);
}

void CFArrayAppendValue(CFMutableArrayRef theArray, const void *value)
{
}

CFMutableArrayRef CFArrayCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFArrayCallBacks *callBacks)
{
  return (CFMutableArrayRef)MEMORY[0x270EE4300](allocator, capacity, callBacks);
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x270EE4320](theArray);
}

CFTypeID CFArrayGetTypeID(void)
{
  return MEMORY[0x270EE4348]();
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return (const void *)MEMORY[0x270EE4360](theArray, idx);
}

void CFArrayRemoveValueAtIndex(CFMutableArrayRef theArray, CFIndex idx)
{
}

void CFArraySetValueAtIndex(CFMutableArrayRef theArray, CFIndex idx, const void *value)
{
}

void CFDataAppendBytes(CFMutableDataRef theData, const UInt8 *bytes, CFIndex length)
{
}

CFDataRef CFDataCreate(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length)
{
  return (CFDataRef)MEMORY[0x270EE47C8](allocator, bytes, length);
}

CFMutableDataRef CFDataCreateMutable(CFAllocatorRef allocator, CFIndex capacity)
{
  return (CFMutableDataRef)MEMORY[0x270EE47E0](allocator, capacity);
}

CFMutableDataRef CFDataCreateMutableCopy(CFAllocatorRef allocator, CFIndex capacity, CFDataRef theData)
{
  return (CFMutableDataRef)MEMORY[0x270EE47E8](allocator, capacity, theData);
}

CFDataRef CFDataCreateWithBytesNoCopy(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length, CFAllocatorRef bytesDeallocator)
{
  return (CFDataRef)MEMORY[0x270EE47F0](allocator, bytes, length, bytesDeallocator);
}

const UInt8 *__cdecl CFDataGetBytePtr(CFDataRef theData)
{
  return (const UInt8 *)MEMORY[0x270EE4808](theData);
}

CFIndex CFDataGetLength(CFDataRef theData)
{
  return MEMORY[0x270EE4820](theData);
}

UInt8 *__cdecl CFDataGetMutableBytePtr(CFMutableDataRef theData)
{
  return (UInt8 *)MEMORY[0x270EE4830](theData);
}

CFTypeID CFDataGetTypeID(void)
{
  return MEMORY[0x270EE4838]();
}

void CFDataReplaceBytes(CFMutableDataRef theData, CFRange range, const UInt8 *newBytes, CFIndex newLength)
{
}

void CFDictionaryAddValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

void CFDictionaryApplyFunction(CFDictionaryRef theDict, CFDictionaryApplierFunction applier, void *context)
{
}

Boolean CFDictionaryContainsKey(CFDictionaryRef theDict, const void *key)
{
  return MEMORY[0x270EE48F0](theDict, key);
}

CFDictionaryRef CFDictionaryCreate(CFAllocatorRef allocator, const void **keys, const void **values, CFIndex numValues, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFDictionaryRef)MEMORY[0x270EE4908](allocator, keys, values, numValues, keyCallBacks, valueCallBacks);
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x270EE4920](allocator, capacity, keyCallBacks, valueCallBacks);
}

CFMutableDictionaryRef CFDictionaryCreateMutableCopy(CFAllocatorRef allocator, CFIndex capacity, CFDictionaryRef theDict)
{
  return (CFMutableDictionaryRef)MEMORY[0x270EE4928](allocator, capacity, theDict);
}

CFIndex CFDictionaryGetCount(CFDictionaryRef theDict)
{
  return MEMORY[0x270EE4930](theDict);
}

CFTypeID CFDictionaryGetTypeID(void)
{
  return MEMORY[0x270EE4948]();
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x270EE4958](theDict, key);
}

Boolean CFDictionaryGetValueIfPresent(CFDictionaryRef theDict, const void *key, const void **value)
{
  return MEMORY[0x270EE4968](theDict, key, value);
}

void CFDictionaryRemoveValue(CFMutableDictionaryRef theDict, const void *key)
{
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return MEMORY[0x270EE4998](cf1, cf2);
}

CFStringRef CFErrorCopyDescription(CFErrorRef err)
{
  return (CFStringRef)MEMORY[0x270EE49A0](err);
}

CFStringRef CFErrorCopyFailureReason(CFErrorRef err)
{
  return (CFStringRef)MEMORY[0x270EE49A8](err);
}

CFErrorRef CFErrorCreateWithUserInfoKeysAndValues(CFAllocatorRef allocator, CFErrorDomain domain, CFIndex code, const void *const *userInfoKeys, const void *const *userInfoValues, CFIndex numUserInfoValues)
{
  return (CFErrorRef)MEMORY[0x270EE49C8](allocator, domain, code, userInfoKeys, userInfoValues, numUserInfoValues);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x270EE4A30](cf);
}

CFNumberRef CFNumberCreate(CFAllocatorRef allocator, CFNumberType theType, const void *valuePtr)
{
  return (CFNumberRef)MEMORY[0x270EE4BE8](allocator, theType, valuePtr);
}

CFTypeID CFNumberGetTypeID(void)
{
  return MEMORY[0x270EE4C58]();
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

void CFShow(CFTypeRef obj)
{
}

void CFStringAppend(CFMutableStringRef theString, CFStringRef appendedString)
{
}

CFMutableStringRef CFStringCreateMutable(CFAllocatorRef alloc, CFIndex maxLength)
{
  return (CFMutableStringRef)MEMORY[0x270EE50B0](alloc, maxLength);
}

CFStringRef CFStringCreateWithCString(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding)
{
  return (CFStringRef)MEMORY[0x270EE50E0](alloc, cStr, *(void *)&encoding);
}

CFStringRef CFStringCreateWithFormat(CFAllocatorRef alloc, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
  return (CFStringRef)MEMORY[0x270EE5110](alloc, formatOptions, format);
}

Boolean CFStringGetCString(CFStringRef theString, char *buffer, CFIndex bufferSize, CFStringEncoding encoding)
{
  return MEMORY[0x270EE5178](theString, buffer, bufferSize, *(void *)&encoding);
}

const char *__cdecl CFStringGetCStringPtr(CFStringRef theString, CFStringEncoding encoding)
{
  return (const char *)MEMORY[0x270EE5180](theString, *(void *)&encoding);
}

CFIndex CFStringGetLength(CFStringRef theString)
{
  return MEMORY[0x270EE51D8](theString);
}

CFIndex CFStringGetMaximumSizeForEncoding(CFIndex length, CFStringEncoding encoding)
{
  return MEMORY[0x270EE51E0](length, *(void *)&encoding);
}

CFTypeID CFStringGetTypeID(void)
{
  return MEMORY[0x270EE5218]();
}

kern_return_t IOConnectCallMethod(mach_port_t connection, uint32_t selector, const uint64_t *input, uint32_t inputCnt, const void *inputStruct, size_t inputStructCnt, uint64_t *output, uint32_t *outputCnt, void *outputStruct, size_t *outputStructCnt)
{
  return MEMORY[0x270EF3F30](*(void *)&connection, *(void *)&selector, input, *(void *)&inputCnt, inputStruct, inputStructCnt, output, outputCnt);
}

kern_return_t IOConnectCallScalarMethod(mach_port_t connection, uint32_t selector, const uint64_t *input, uint32_t inputCnt, uint64_t *output, uint32_t *outputCnt)
{
  return MEMORY[0x270EF3F38](*(void *)&connection, *(void *)&selector, input, *(void *)&inputCnt, output, outputCnt);
}

kern_return_t IOConnectMapMemory(io_connect_t connect, uint32_t memoryType, task_port_t intoTask, mach_vm_address_t *atAddress, mach_vm_size_t *ofSize, IOOptionBits options)
{
  return MEMORY[0x270EF3F50](*(void *)&connect, *(void *)&memoryType, *(void *)&intoTask, atAddress, ofSize, *(void *)&options);
}

kern_return_t IOConnectUnmapMemory(io_connect_t connect, uint32_t memoryType, task_port_t fromTask, mach_vm_address_t atAddress)
{
  return MEMORY[0x270EF3FB8](*(void *)&connect, *(void *)&memoryType, *(void *)&fromTask, atAddress);
}

BOOLean_t IOIteratorIsValid(io_iterator_t iterator)
{
  return MEMORY[0x270EF4788](*(void *)&iterator);
}

io_object_t IOIteratorNext(io_iterator_t iterator)
{
  return MEMORY[0x270EF4790](*(void *)&iterator);
}

uint32_t IOObjectGetUserRetainCount(io_object_t object)
{
  return MEMORY[0x270EF4810](*(void *)&object);
}

kern_return_t IOObjectRelease(io_object_t object)
{
  return MEMORY[0x270EF4820](*(void *)&object);
}

CFTypeRef IORegistryEntryCreateCFProperty(io_registry_entry_t entry, CFStringRef key, CFAllocatorRef allocator, IOOptionBits options)
{
  return (CFTypeRef)MEMORY[0x270EF49D8](*(void *)&entry, key, allocator, *(void *)&options);
}

kern_return_t IORegistryEntryGetName(io_registry_entry_t entry, io_name_t name)
{
  return MEMORY[0x270EF4A08](*(void *)&entry, name);
}

kern_return_t IORegistryEntryGetRegistryEntryID(io_registry_entry_t entry, uint64_t *entryID)
{
  return MEMORY[0x270EF4A38](*(void *)&entry, entryID);
}

kern_return_t IOServiceClose(io_connect_t connect)
{
  return MEMORY[0x270EF4A98](*(void *)&connect);
}

io_service_t IOServiceGetMatchingService(mach_port_t mainPort, CFDictionaryRef matching)
{
  return MEMORY[0x270EF4AB0](*(void *)&mainPort, matching);
}

kern_return_t IOServiceGetMatchingServices(mach_port_t mainPort, CFDictionaryRef matching, io_iterator_t *existing)
{
  return MEMORY[0x270EF4AB8](*(void *)&mainPort, matching, existing);
}

CFMutableDictionaryRef IOServiceMatching(const char *name)
{
  return (CFMutableDictionaryRef)MEMORY[0x270EF4AD0](name);
}

kern_return_t IOServiceOpen(io_service_t service, task_port_t owningTask, uint32_t type, io_connect_t *connect)
{
  return MEMORY[0x270EF4AE0](*(void *)&service, *(void *)&owningTask, *(void *)&type, connect);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

uint64_t _CFRuntimeCreateInstance()
{
  return MEMORY[0x270EE56F0]();
}

uint64_t _CFRuntimeRegisterClass()
{
  return MEMORY[0x270EE5700]();
}

int __maskrune(__darwin_ct_rune_t a1, unint64_t a2)
{
  return MEMORY[0x270ED7E28](*(void *)&a1, a2);
}

uint64_t __strlcat_chk()
{
  return MEMORY[0x270ED7ED8]();
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

void free(void *a1)
{
}

pid_t getpid(void)
{
  return MEMORY[0x270ED9CE0]();
}

const char *getprogname(void)
{
  return (const char *)MEMORY[0x270ED9D00]();
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA390](size, type_id);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x270EDA470](__dst, __src, __n);
}

void memset_pattern8(void *__b, const void *__pattern8, size_t __len)
{
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x270EDB510](__str, __size, __format);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x270EDB610](__s);
}