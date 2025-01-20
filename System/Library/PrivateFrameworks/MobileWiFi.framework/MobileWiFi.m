uint64_t WiFiDeviceClientRegisterScanUpdateCallback(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;

  *(void *)(a1 + 256) = a2;
  *(void *)(a1 + 264) = a4;
  v4 = 128;
  if (a3 == 1) {
    v4 = 256;
  }
  if (a2) {
    v5 = *(void *)(a1 + 64) | v4;
  }
  else {
    v5 = *(void *)(a1 + 64) & ~v4;
  }
  *(void *)(a1 + 64) = v5;
  return _WiFiDeviceClientSendEventMaskToServer(a1);
}

uint64_t _WiFiDeviceClientSendEventMaskToServer(uint64_t a1)
{
  int v2 = *(_DWORD *)(a1 + 16);
  BytePtr = CFDataGetBytePtr(*(CFDataRef *)(a1 + 48));
  int Length = CFDataGetLength(*(CFDataRef *)(a1 + 48));
  uint64_t v5 = *(void *)(a1 + 64);

  return wifi_device_set_event_mask(v2, (uint64_t)BytePtr, Length, v5);
}

uint64_t wifi_device_set_event_mask(int a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v8 = a2;
  int v9 = 27918592;
  int v10 = a3;
  uint64_t v11 = *MEMORY[0x1E4F14068];
  int v12 = a3;
  uint64_t v13 = a4;
  unint64_t v5 = 0xAAAAAAAA80000013;
  int v6 = a1;
  long long v7 = xmmword_1BF21A300;
  if (MEMORY[0x1E4F14B18]) {
    voucher_mach_msg_set((mach_msg_header_t *)&v5);
  }
  return mach_msg((mach_msg_header_t *)&v5, 2097153, 0x40u, 0, 0, 0, 0);
}

void WiFiManagerClientSetType(uint64_t a1, int a2)
{
  *(_DWORD *)(a1 + 16) = a2;
  v3 = __WiFiManagerClientGetOrReconnectServerPort(a1, 0);
  if (v3)
  {
    v4 = (mach_port_name_t *)v3;
    wifi_manager_set_client_type(v3[1], a2);
    WiFiSendRightRelease(v4);
  }
}

uint64_t wifi_manager_set_client_type(mach_port_t a1, int a2)
{
  uint64_t v4 = *MEMORY[0x1E4F14068];
  int v5 = a2;
  *(void *)&msg.msgh_bits = 0xAAAAAAAA00000013;
  msg.msgh_voucher_port = 0;
  msg.msgh_id = 69730;
  msg.msgh_remote_port = a1;
  msg.msgh_local_port = 0;
  if (MEMORY[0x1E4F14B18]) {
    voucher_mach_msg_set(&msg);
  }
  return mach_msg(&msg, 2097153, 0x24u, 0, 0, 0, 0);
}

uint64_t WiFiManagerClientIsMfpCapableDevice(uint64_t a1)
{
  int v4 = 0;
  v1 = __WiFiManagerClientGetOrReconnectServerPort(a1, 0);
  int v2 = (mach_port_name_t *)v1;
  if (v1) {
    wifi_manager_is_mfp_capable_device(v1[1], &v4);
  }
  WiFiSendRightRelease(v2);
  return v4;
}

uint64_t wifi_manager_is_mfp_capable_device(int a1, _DWORD *a2)
{
  *(void *)&long long v4 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v4 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)&rcv_name_12[16] = v4;
  *(_OWORD *)&rcv_name_12[4] = v4;
  int rcv_name = -1431655766;
  mach_port_name_t special_reply_port = mig_get_special_reply_port();
  int rcv_name_4 = a1;
  mach_port_name_t rcv_name_8 = special_reply_port;
  int v10 = 5395;
  *(void *)rcv_name_12 = 0x110AA00000000;
  if (MEMORY[0x1E4F14B18])
  {
    voucher_mach_msg_set((mach_msg_header_t *)&v10);
    mach_port_name_t special_reply_port = rcv_name_8;
  }
  uint64_t v6 = mach_msg((mach_msg_header_t *)&v10, 3162115, 0x18u, 0x30u, special_reply_port, 0, 0);
  uint64_t v7 = v6;
  if ((v6 - 268435458) > 0xE || ((1 << (v6 - 2)) & 0x4003) == 0)
  {
    if (!v6)
    {
      if (*(_DWORD *)&rcv_name_12[4] == 71)
      {
        uint64_t v7 = 4294966988;
      }
      else if (*(_DWORD *)&rcv_name_12[4] == 69902)
      {
        if ((v10 & 0x80000000) == 0)
        {
          if (rcv_name == 40)
          {
            if (!rcv_name_4)
            {
              uint64_t v7 = *(unsigned int *)&rcv_name_12[16];
              if (!*(_DWORD *)&rcv_name_12[16])
              {
                *a2 = *(_DWORD *)&rcv_name_12[20];
                return v7;
              }
              goto LABEL_22;
            }
          }
          else if (rcv_name == 36)
          {
            if (rcv_name_4) {
              BOOL v8 = 1;
            }
            else {
              BOOL v8 = *(_DWORD *)&rcv_name_12[16] == 0;
            }
            if (v8) {
              uint64_t v7 = 4294966996;
            }
            else {
              uint64_t v7 = *(unsigned int *)&rcv_name_12[16];
            }
            goto LABEL_22;
          }
        }
        uint64_t v7 = 4294966996;
      }
      else
      {
        uint64_t v7 = 4294966995;
      }
LABEL_22:
      mach_msg_destroy((mach_msg_header_t *)&v10);
      return v7;
    }
    mig_dealloc_special_reply_port();
  }
  return v7;
}

uint64_t WiFiManagerClientIsManagedAppleID(uint64_t a1)
{
  int v4 = 0;
  v1 = __WiFiManagerClientGetOrReconnectServerPort(a1, 0);
  int v2 = (mach_port_name_t *)v1;
  if (v1) {
    wifi_manager_is_managed_apple_id(v1[1], &v4);
  }
  WiFiSendRightRelease(v2);
  return v4;
}

uint64_t wifi_manager_is_managed_apple_id(int a1, _DWORD *a2)
{
  *(void *)&long long v4 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v4 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)&rcv_name_12[16] = v4;
  *(_OWORD *)&rcv_name_12[4] = v4;
  int rcv_name = -1431655766;
  mach_port_name_t special_reply_port = mig_get_special_reply_port();
  int rcv_name_4 = a1;
  mach_port_name_t rcv_name_8 = special_reply_port;
  int v10 = 5395;
  *(void *)rcv_name_12 = 0x110B800000000;
  if (MEMORY[0x1E4F14B18])
  {
    voucher_mach_msg_set((mach_msg_header_t *)&v10);
    mach_port_name_t special_reply_port = rcv_name_8;
  }
  uint64_t v6 = mach_msg((mach_msg_header_t *)&v10, 3162115, 0x18u, 0x30u, special_reply_port, 0, 0);
  uint64_t v7 = v6;
  if ((v6 - 268435458) > 0xE || ((1 << (v6 - 2)) & 0x4003) == 0)
  {
    if (!v6)
    {
      if (*(_DWORD *)&rcv_name_12[4] == 71)
      {
        uint64_t v7 = 4294966988;
      }
      else if (*(_DWORD *)&rcv_name_12[4] == 69916)
      {
        if ((v10 & 0x80000000) == 0)
        {
          if (rcv_name == 40)
          {
            if (!rcv_name_4)
            {
              uint64_t v7 = *(unsigned int *)&rcv_name_12[16];
              if (!*(_DWORD *)&rcv_name_12[16])
              {
                *a2 = *(_DWORD *)&rcv_name_12[20];
                return v7;
              }
              goto LABEL_22;
            }
          }
          else if (rcv_name == 36)
          {
            if (rcv_name_4) {
              BOOL v8 = 1;
            }
            else {
              BOOL v8 = *(_DWORD *)&rcv_name_12[16] == 0;
            }
            if (v8) {
              uint64_t v7 = 4294966996;
            }
            else {
              uint64_t v7 = *(unsigned int *)&rcv_name_12[16];
            }
            goto LABEL_22;
          }
        }
        uint64_t v7 = 4294966996;
      }
      else
      {
        uint64_t v7 = 4294966995;
      }
LABEL_22:
      mach_msg_destroy((mach_msg_header_t *)&v10);
      return v7;
    }
    mig_dealloc_special_reply_port();
  }
  return v7;
}

uint64_t WiFiManagerClientIsWPA3EnterpriseSupported(uint64_t a1)
{
  int v4 = 0;
  v1 = __WiFiManagerClientGetOrReconnectServerPort(a1, 0);
  int v2 = (mach_port_name_t *)v1;
  if (v1) {
    wifi_manager_is_wpa3_enterprise_supported(v1[1], &v4);
  }
  WiFiSendRightRelease(v2);
  return v4;
}

uint64_t wifi_manager_is_wpa3_enterprise_supported(int a1, _DWORD *a2)
{
  *(void *)&long long v4 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v4 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)&rcv_name_12[16] = v4;
  *(_OWORD *)&rcv_name_12[4] = v4;
  int rcv_name = -1431655766;
  mach_port_name_t special_reply_port = mig_get_special_reply_port();
  int rcv_name_4 = a1;
  mach_port_name_t rcv_name_8 = special_reply_port;
  int v10 = 5395;
  *(void *)rcv_name_12 = 0x110A900000000;
  if (MEMORY[0x1E4F14B18])
  {
    voucher_mach_msg_set((mach_msg_header_t *)&v10);
    mach_port_name_t special_reply_port = rcv_name_8;
  }
  uint64_t v6 = mach_msg((mach_msg_header_t *)&v10, 3162115, 0x18u, 0x30u, special_reply_port, 0, 0);
  uint64_t v7 = v6;
  if ((v6 - 268435458) > 0xE || ((1 << (v6 - 2)) & 0x4003) == 0)
  {
    if (!v6)
    {
      if (*(_DWORD *)&rcv_name_12[4] == 71)
      {
        uint64_t v7 = 4294966988;
      }
      else if (*(_DWORD *)&rcv_name_12[4] == 69901)
      {
        if ((v10 & 0x80000000) == 0)
        {
          if (rcv_name == 40)
          {
            if (!rcv_name_4)
            {
              uint64_t v7 = *(unsigned int *)&rcv_name_12[16];
              if (!*(_DWORD *)&rcv_name_12[16])
              {
                *a2 = *(_DWORD *)&rcv_name_12[20];
                return v7;
              }
              goto LABEL_22;
            }
          }
          else if (rcv_name == 36)
          {
            if (rcv_name_4) {
              BOOL v8 = 1;
            }
            else {
              BOOL v8 = *(_DWORD *)&rcv_name_12[16] == 0;
            }
            if (v8) {
              uint64_t v7 = 4294966996;
            }
            else {
              uint64_t v7 = *(unsigned int *)&rcv_name_12[16];
            }
            goto LABEL_22;
          }
        }
        uint64_t v7 = 4294966996;
      }
      else
      {
        uint64_t v7 = 4294966995;
      }
LABEL_22:
      mach_msg_destroy((mach_msg_header_t *)&v10);
      return v7;
    }
    mig_dealloc_special_reply_port();
  }
  return v7;
}

uint64_t WiFiManagerClientIsRestrictionPolicyActive(uint64_t a1)
{
  int v4 = 0;
  v1 = __WiFiManagerClientGetOrReconnectServerPort(a1, 0);
  int v2 = (mach_port_name_t *)v1;
  if (v1) {
    wifi_manager_is_restriction_policy_active(v1[1], &v4);
  }
  WiFiSendRightRelease(v2);
  return v4;
}

uint64_t wifi_manager_is_restriction_policy_active(int a1, _DWORD *a2)
{
  *(void *)&long long v4 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v4 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)&rcv_name_12[16] = v4;
  *(_OWORD *)&rcv_name_12[4] = v4;
  int rcv_name = -1431655766;
  mach_port_name_t special_reply_port = mig_get_special_reply_port();
  int rcv_name_4 = a1;
  mach_port_name_t rcv_name_8 = special_reply_port;
  int v10 = 5395;
  *(void *)rcv_name_12 = 0x1108E00000000;
  if (MEMORY[0x1E4F14B18])
  {
    voucher_mach_msg_set((mach_msg_header_t *)&v10);
    mach_port_name_t special_reply_port = rcv_name_8;
  }
  uint64_t v6 = mach_msg((mach_msg_header_t *)&v10, 3162115, 0x18u, 0x30u, special_reply_port, 0, 0);
  uint64_t v7 = v6;
  if ((v6 - 268435458) > 0xE || ((1 << (v6 - 2)) & 0x4003) == 0)
  {
    if (!v6)
    {
      if (*(_DWORD *)&rcv_name_12[4] == 71)
      {
        uint64_t v7 = 4294966988;
      }
      else if (*(_DWORD *)&rcv_name_12[4] == 69874)
      {
        if ((v10 & 0x80000000) == 0)
        {
          if (rcv_name == 40)
          {
            if (!rcv_name_4)
            {
              uint64_t v7 = *(unsigned int *)&rcv_name_12[16];
              if (!*(_DWORD *)&rcv_name_12[16])
              {
                *a2 = *(_DWORD *)&rcv_name_12[20];
                return v7;
              }
              goto LABEL_22;
            }
          }
          else if (rcv_name == 36)
          {
            if (rcv_name_4) {
              BOOL v8 = 1;
            }
            else {
              BOOL v8 = *(_DWORD *)&rcv_name_12[16] == 0;
            }
            if (v8) {
              uint64_t v7 = 4294966996;
            }
            else {
              uint64_t v7 = *(unsigned int *)&rcv_name_12[16];
            }
            goto LABEL_22;
          }
        }
        uint64_t v7 = 4294966996;
      }
      else
      {
        uint64_t v7 = 4294966995;
      }
LABEL_22:
      mach_msg_destroy((mach_msg_header_t *)&v10);
      return v7;
    }
    mig_dealloc_special_reply_port();
  }
  return v7;
}

uint64_t WiFiManagerClientIsWPA3PersonalSupported(uint64_t a1)
{
  int v4 = 0;
  v1 = __WiFiManagerClientGetOrReconnectServerPort(a1, 0);
  int v2 = (mach_port_name_t *)v1;
  if (v1) {
    wifi_manager_is_wpa3_personal_supported(v1[1], &v4);
  }
  WiFiSendRightRelease(v2);
  return v4;
}

uint64_t wifi_manager_is_wpa3_personal_supported(int a1, _DWORD *a2)
{
  *(void *)&long long v4 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v4 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)&rcv_name_12[16] = v4;
  *(_OWORD *)&rcv_name_12[4] = v4;
  int rcv_name = -1431655766;
  mach_port_name_t special_reply_port = mig_get_special_reply_port();
  int rcv_name_4 = a1;
  mach_port_name_t rcv_name_8 = special_reply_port;
  int v10 = 5395;
  *(void *)rcv_name_12 = 0x110A700000000;
  if (MEMORY[0x1E4F14B18])
  {
    voucher_mach_msg_set((mach_msg_header_t *)&v10);
    mach_port_name_t special_reply_port = rcv_name_8;
  }
  uint64_t v6 = mach_msg((mach_msg_header_t *)&v10, 3162115, 0x18u, 0x30u, special_reply_port, 0, 0);
  uint64_t v7 = v6;
  if ((v6 - 268435458) > 0xE || ((1 << (v6 - 2)) & 0x4003) == 0)
  {
    if (!v6)
    {
      if (*(_DWORD *)&rcv_name_12[4] == 71)
      {
        uint64_t v7 = 4294966988;
      }
      else if (*(_DWORD *)&rcv_name_12[4] == 69899)
      {
        if ((v10 & 0x80000000) == 0)
        {
          if (rcv_name == 40)
          {
            if (!rcv_name_4)
            {
              uint64_t v7 = *(unsigned int *)&rcv_name_12[16];
              if (!*(_DWORD *)&rcv_name_12[16])
              {
                *a2 = *(_DWORD *)&rcv_name_12[20];
                return v7;
              }
              goto LABEL_22;
            }
          }
          else if (rcv_name == 36)
          {
            if (rcv_name_4) {
              BOOL v8 = 1;
            }
            else {
              BOOL v8 = *(_DWORD *)&rcv_name_12[16] == 0;
            }
            if (v8) {
              uint64_t v7 = 4294966996;
            }
            else {
              uint64_t v7 = *(unsigned int *)&rcv_name_12[16];
            }
            goto LABEL_22;
          }
        }
        uint64_t v7 = 4294966996;
      }
      else
      {
        uint64_t v7 = 4294966995;
      }
LABEL_22:
      mach_msg_destroy((mach_msg_header_t *)&v10);
      return v7;
    }
    mig_dealloc_special_reply_port();
  }
  return v7;
}

__CFArray *WiFiManagerClientCopyDevices(uint64_t a1)
{
  v9[1] = *MEMORY[0x1E4F143B8];
  os_unfair_recursive_lock_lock_with_options();
  CFDictionaryRef v2 = *(const __CFDictionary **)(a1 + 64);
  if (v2 && (CFIndex Count = CFDictionaryGetCount(v2)) != 0)
  {
    uint64_t v4 = Count;
    MEMORY[0x1F4188790]();
    uint64_t v6 = (const void **)((char *)v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0));
    memset(v6, 170, v5);
    CFDictionaryGetKeysAndValues(*(CFDictionaryRef *)(a1 + 64), 0, v6);
    Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, MEMORY[0x1E4F1D510]);
    if (v4 >= 1)
    {
      do
      {
        if (!WiFiDeviceClientGetInterfaceRoleIndex((uint64_t)*v6)) {
          CFArrayAppendValue(Mutable, *v6);
        }
        ++v6;
        --v4;
      }
      while (v4);
    }
  }
  else
  {
    Mutable = 0;
  }
  os_unfair_recursive_lock_unlock();
  return Mutable;
}

uint64_t WiFiDeviceClientGetInterfaceRoleIndex(uint64_t a1)
{
  return *(void *)(a1 + 40);
}

BOOL WiFiNetworkIsCaptive(uint64_t a1)
{
  return MEMORY[0x1E4F57E00]
      && CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 16), (const void *)*MEMORY[0x1E4F57E38]) == (const void *)*MEMORY[0x1E4F1CFD0];
}

CFPropertyListRef WiFiDeviceClientCopyProperty(uint64_t a1, const void *a2)
{
  CFPropertyListRef v2 = 0;
  memset(length, 0, sizeof(length));
  if (a1 && a2)
  {
    CFDataRef BinaryData = (const __CFData *)_CFPropertyListCreateBinaryData((CFAllocatorRef)*MEMORY[0x1E4F1CF80], a2);
    CFDataRef v5 = BinaryData;
    if (BinaryData)
    {
      BytePtr = CFDataGetBytePtr(BinaryData);
      int v7 = CFDataGetLength(v5);
    }
    else
    {
      BytePtr = 0;
      int v7 = 0;
    }
    mach_port_t v8 = *(_DWORD *)(a1 + 16);
    int v9 = CFDataGetBytePtr(*(CFDataRef *)(a1 + 48));
    int v10 = CFDataGetLength(*(CFDataRef *)(a1 + 48));
    wifi_device_copy_property(v8, (uint64_t)v9, v10, (uint64_t)BytePtr, v7, &length[1], length);
    CFPropertyListRef v2 = 0;
    if (*(void *)&length[1] && length[0]) {
      CFPropertyListRef v2 = _WiFiCopyUnserialized(*(UInt8 **)&length[1], length[0]);
    }
    if (v5) {
      CFRelease(v5);
    }
  }
  _WiFiVMDealloc(*(uint64_t *)&length[1], length[0]);
  return v2;
}

uint64_t wifi_device_copy_property(mach_port_t a1, uint64_t a2, int a3, uint64_t a4, int a5, void *a6, _DWORD *a7)
{
  int v16 = 2;
  uint64_t v17 = a2;
  int v18 = 27918592;
  int v19 = a3;
  uint64_t v20 = a4;
  int v21 = 27918592;
  int v22 = a5;
  uint64_t v23 = *MEMORY[0x1E4F14068];
  int v24 = a3;
  int v25 = a5;
  mach_port_t special_reply_port = mig_get_special_reply_port();
  *(void *)&v15.msgh_bits = 0xAAAAAAAA80001513;
  v15.msgh_remote_port = a1;
  v15.msgh_local_port = special_reply_port;
  *(void *)&v15.msgh_voucher_port = 0x1106B00000000;
  if (MEMORY[0x1E4F14B18])
  {
    voucher_mach_msg_set(&v15);
    mach_port_t special_reply_port = v15.msgh_local_port;
  }
  uint64_t v11 = mach_msg(&v15, 3162115, 0x4Cu, 0x40u, special_reply_port, 0, 0);
  uint64_t v12 = v11;
  if ((v11 - 268435458) > 0xE || ((1 << (v11 - 2)) & 0x4003) == 0)
  {
    if (!v11)
    {
      if (v15.msgh_id == 71)
      {
        uint64_t v12 = 4294966988;
      }
      else if (v15.msgh_id == 69839)
      {
        if ((v15.msgh_bits & 0x80000000) == 0)
        {
          if (v15.msgh_size == 36)
          {
            uint64_t v12 = 4294966996;
            if (HIDWORD(v17))
            {
              if (v15.msgh_remote_port) {
                uint64_t v12 = 4294966996;
              }
              else {
                uint64_t v12 = HIDWORD(v17);
              }
            }
          }
          else
          {
            uint64_t v12 = 4294966996;
          }
          goto LABEL_23;
        }
        uint64_t v12 = 4294966996;
        if (v16 == 1 && *(void *)&v15.msgh_size == 56 && HIBYTE(v18) == 1)
        {
          int v13 = v19;
          if (v19 == v21)
          {
            uint64_t v12 = 0;
            *a6 = v17;
            *a7 = v13;
            return v12;
          }
        }
      }
      else
      {
        uint64_t v12 = 4294966995;
      }
LABEL_23:
      mach_msg_destroy(&v15);
      return v12;
    }
    mig_dealloc_special_reply_port();
  }
  return v12;
}

void WiFiManagerClientScheduleWithRunLoop(uint64_t a1, __CFRunLoop *a2, const __CFString *a3)
{
  uint64_t v6 = __WiFiManagerClientGetOrReconnectServerPort(a1, 0);
  *(void *)(a1 + 48) = a2;
  *(void *)(a1 + 56) = a3;
  WiFiMIGMachPortScheduleWithRunLoop(*(void *)(a1 + 40), a2, a3);
  if (!v6)
  {
    mach_port_t notify_port = -1431655766;
    if (!notify_register_mach_port("com.apple.wifi.manager.available", &notify_port, 0, (int *)(a1 + 88)))
    {
      CFAllocatorRef v7 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
      mach_port_t v8 = (__CFMachPort *)_CFMachPortCreateWithPort();
      *(void *)(a1 + 96) = v8;
      if (v8)
      {
        RunLoopSource = CFMachPortCreateRunLoopSource(v7, v8, 0);
        *(void *)(a1 + 104) = RunLoopSource;
        if (RunLoopSource) {
          CFRunLoopAddSource(a2, RunLoopSource, a3);
        }
      }
    }
  }
  WiFiSendRightRelease((mach_port_name_t *)v6);
}

void WiFiMIGMachPortScheduleWithRunLoop(uint64_t a1, CFRunLoopRef rl, CFRunLoopMode mode)
{
  *(void *)(a1 + 32) = rl;
  *(void *)(a1 + 40) = mode;
  RunLoopSource = *(__CFRunLoopSource **)(a1 + 48);
  if (RunLoopSource
    || (RunLoopSource = CFMachPortCreateRunLoopSource((CFAllocatorRef)*MEMORY[0x1E4F1CF80], *(CFMachPortRef *)(a1 + 56), 1), (*(void *)(a1 + 48) = RunLoopSource) != 0))
  {
    CFRunLoopAddSource(rl, RunLoopSource, mode);
  }
}

void __WiFiNetworkRelease(void *a1)
{
  if (a1)
  {
    CFTypeID v2 = CFGetTypeID(a1);
    uint64_t v3 = __kWiFiNetworkTypeID;
    if (!__kWiFiNetworkTypeID)
    {
      pthread_once(&__wifiNetworkTypeInit, (void (*)(void))__WiFiNetworkRegister);
      uint64_t v3 = __kWiFiNetworkTypeID;
    }
    if (v2 == v3)
    {
      uint64_t v4 = (const void *)a1[2];
      if (v4)
      {
        CFRelease(v4);
        a1[2] = 0;
      }
    }
  }
}

CFNumberRef WiFiNetworkGetPhyMode(uint64_t a1)
{
  CFNumberRef Property = (const __CFNumber *)WiFiNetworkGetProperty(a1, @"PHY_MODE");
  return _CFTypeGetIntValue(Property);
}

const void *WiFiNetworkGetProperty(uint64_t a1, void *key)
{
  if (!a1 || (CFDictionaryRef v3 = *(const __CFDictionary **)(a1 + 16)) == 0)
  {
    return 0;
  }
  CFArrayRef v5 = (const __CFArray *)__eapKeys;
  if (__eapKeys)
  {
    v10.length = CFArrayGetCount((CFArrayRef)__eapKeys);
    v10.location = 0;
    int v6 = CFArrayContainsValue(v5, v10, key);
    CFDictionaryRef v3 = *(const __CFDictionary **)(a1 + 16);
    if (v6)
    {
      CFDictionaryRef Value = (const __CFDictionary *)CFDictionaryGetValue(v3, @"EnterpriseProfile");
      if (!Value) {
        return 0;
      }
      CFDictionaryRef v3 = (const __CFDictionary *)CFDictionaryGetValue(Value, @"EAPClientConfiguration");
      if (!v3) {
        return 0;
      }
    }
  }

  return CFDictionaryGetValue(v3, key);
}

CFNumberRef _CFTypeGetIntValue(const __CFNumber *result)
{
  uint64_t valuePtr = 0;
  if (result)
  {
    CFNumberRef v1 = result;
    CFTypeID v2 = CFGetTypeID(result);
    if (v2 == CFNumberGetTypeID())
    {
      CFNumberGetValue(v1, kCFNumberCFIndexType, &valuePtr);
      return (const __CFNumber *)valuePtr;
    }
    else
    {
      CFTypeID v3 = CFGetTypeID(v1);
      if (v3 == CFBooleanGetTypeID()) {
        return (const __CFNumber *)(*MEMORY[0x1E4F1CFD0] == (void)v1);
      }
      else {
        return 0;
      }
    }
  }
  return result;
}

uint64_t WiFiDeviceClientScanAsync(uint64_t a1, const void *a2, uint64_t a3, uint64_t a4)
{
  if (!a2) {
    return 4294963396;
  }
  unsigned int v20 = -1431655766;
  if (!WiFiManagerClientIsUserInteractive(*(void *)(a1 + 56)))
  {
    double v8 = vabdd_f64(CFAbsoluteTimeGetCurrent(), *(double *)&WiFiDeviceClientScanAsync_timeBetweenCalls);
    if (v8 < 0.02)
    {
      NSLog(&cfstr_SCalled02fsAgo.isa, "WiFiDeviceClientScanAsync", *(void *)&v8, 0x3F947AE147AE147BLL);
      return 4294963366;
    }
    WiFiDeviceClientScanAsync_timeBetweenCalls = CFAbsoluteTimeGetCurrent();
  }
  *(void *)(a1 + 160) = a3;
  *(void *)(a1 + 168) = a4;
  CFDataRef BinaryData = (const __CFData *)_CFPropertyListCreateBinaryData((CFAllocatorRef)*MEMORY[0x1E4F1CF80], a2);
  if (BinaryData)
  {
    CFDataRef v10 = BinaryData;
    BytePtr = CFDataGetBytePtr(BinaryData);
    int Length = CFDataGetLength(v10);
    mach_port_t v13 = *(_DWORD *)(a1 + 16);
    v14 = CFDataGetBytePtr(*(CFDataRef *)(a1 + 48));
    int v15 = CFDataGetLength(*(CFDataRef *)(a1 + 48));
    wifi_device_scan_async(v13, (uint64_t)v14, v15, (uint64_t)BytePtr, Length, (int *)&v20);
    CFRelease(v10);
  }
  else
  {
    mach_port_t v17 = *(_DWORD *)(a1 + 16);
    int v18 = CFDataGetBytePtr(*(CFDataRef *)(a1 + 48));
    int v19 = CFDataGetLength(*(CFDataRef *)(a1 + 48));
    wifi_device_scan_async(v17, (uint64_t)v18, v19, 0, 0, (int *)&v20);
  }
  return v20;
}

uint64_t wifi_device_scan_async(mach_port_t a1, uint64_t a2, int a3, uint64_t a4, int a5, int *a6)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  int v14 = 2;
  uint64_t v15 = a2;
  int v16 = 27918592;
  int v17 = a3;
  uint64_t v18 = a4;
  int v19 = 27918592;
  int v20 = a5;
  uint64_t v21 = *MEMORY[0x1E4F14068];
  int v22 = a3;
  int v23 = a5;
  mach_port_t special_reply_port = mig_get_special_reply_port();
  *(void *)&msg.msgh_bits = 0xAAAAAAAA80001513;
  msg.msgh_remote_port = a1;
  msg.msgh_local_port = special_reply_port;
  *(void *)&msg.msgh_voucher_port = 0x1107300000000;
  if (MEMORY[0x1E4F14B18])
  {
    voucher_mach_msg_set(&msg);
    mach_port_t special_reply_port = msg.msgh_local_port;
  }
  uint64_t v9 = mach_msg(&msg, 3162115, 0x4Cu, 0x30u, special_reply_port, 0, 0);
  uint64_t v10 = v9;
  if ((v9 - 268435458) > 0xE || ((1 << (v9 - 2)) & 0x4003) == 0)
  {
    if (!v9)
    {
      if (msg.msgh_id == 71)
      {
        uint64_t v10 = 4294966988;
      }
      else if (msg.msgh_id == 69847)
      {
        if ((msg.msgh_bits & 0x80000000) == 0)
        {
          if (msg.msgh_size == 40)
          {
            if (!msg.msgh_remote_port)
            {
              uint64_t v10 = HIDWORD(v15);
              if (!HIDWORD(v15))
              {
                *a6 = v16;
                return v10;
              }
              goto LABEL_22;
            }
          }
          else if (msg.msgh_size == 36)
          {
            if (msg.msgh_remote_port) {
              BOOL v11 = 1;
            }
            else {
              BOOL v11 = HIDWORD(v15) == 0;
            }
            if (v11) {
              uint64_t v10 = 4294966996;
            }
            else {
              uint64_t v10 = HIDWORD(v15);
            }
            goto LABEL_22;
          }
        }
        uint64_t v10 = 4294966996;
      }
      else
      {
        uint64_t v10 = 4294966995;
      }
LABEL_22:
      mach_msg_destroy(&msg);
      return v10;
    }
    mig_dealloc_special_reply_port();
  }
  return v10;
}

BOOL WiFiManagerClientIsUserInteractive(BOOL result)
{
  if (result) {
    return *(unsigned char *)(result + 81) != 0;
  }
  return result;
}

CFPropertyListRef WiFiManagerClientCopyProperty(uint64_t a1, const void *a2)
{
  memset(length, 0, sizeof(length));
  uint64_t v4 = __WiFiManagerClientGetOrReconnectServerPort(a1, 0);
  if (!v4) {
    return 0;
  }
  CFArrayRef v5 = v4;
  if (CFEqual(a2, @"SignalStrengthThreshold")
    || CFEqual(a2, @"deviceCapabilities")
    || CFEqual(a2, @"deviceSupportsWoW"))
  {
    uint64_t RootDevice = __WiFiManagerClientGetRootDevice(a1);
    if (RootDevice) {
      CFPropertyListRef v7 = WiFiDeviceClientCopyProperty(RootDevice, a2);
    }
    else {
      CFPropertyListRef v7 = 0;
    }
  }
  else
  {
    CFDataRef BinaryData = (const __CFData *)_CFPropertyListCreateBinaryData((CFAllocatorRef)*MEMORY[0x1E4F1CF80], a2);
    CFDataRef v10 = BinaryData;
    if (BinaryData)
    {
      BytePtr = CFDataGetBytePtr(BinaryData);
      int v12 = CFDataGetLength(v10);
    }
    else
    {
      BytePtr = 0;
      int v12 = 0;
    }
    wifi_manager_copy_property(v5[1], (uint64_t)BytePtr, v12, &length[1], length);
    CFPropertyListRef v7 = 0;
    if (*(void *)&length[1] && length[0]) {
      CFPropertyListRef v7 = _WiFiCopyUnserialized(*(UInt8 **)&length[1], length[0]);
    }
    if (v10) {
      CFRelease(v10);
    }
  }
  _WiFiVMDealloc(*(uint64_t *)&length[1], length[0]);
  WiFiSendRightRelease((mach_port_name_t *)v5);
  return v7;
}

uint64_t __WiFiManagerClientAddDevice(uint64_t a1, const void *a2, uint64_t a3, __CFArray *a4)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  if (!a2 || !*(void *)(a1 + 64)) {
    return 0;
  }
  os_unfair_recursive_lock_lock_with_options();
  uint64_t v8 = __WiFiManagerClientGetOrReconnectServerPort(a1, 0);
  if (!v8)
  {
LABEL_10:
    WiFiSendRightRelease((mach_port_name_t *)v8);
    os_unfair_recursive_lock_unlock();
    return 0;
  }
  if (CFDictionaryContainsKey(*(CFDictionaryRef *)(a1 + 64), a2))
  {
    CFDictionaryRef Value = CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 64), a2);
    if (Value)
    {
      uint64_t v10 = (uint64_t)Value;
      int ServerPort = _WiFiDeviceClientGetServerPort((uint64_t)Value);
      int v12 = *(_DWORD *)(v8 + 4);
      if (ServerPort != v12)
      {
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
        {
          int v17 = _WiFiDeviceClientGetServerPort(v10);
          int v18 = *(_DWORD *)(v8 + 4);
          int v19 = 136315906;
          int v20 = "__WiFiManagerClientAddDevice";
          __int16 v21 = 2112;
          int v22 = a2;
          __int16 v23 = 1024;
          int v24 = v17;
          __int16 v25 = 1024;
          int v26 = v18;
          _os_log_error_impl(&dword_1BF1E6000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%s: for device [%@] updating server port from [%d] to [%d]", (uint8_t *)&v19, 0x22u);
          int v12 = *(_DWORD *)(v8 + 4);
        }
        _WiFiDeviceClientSetServerPort(v10, v12);
        _WiFiDeviceClientSendEventMaskToServer(v10);
        _WiFiDeviceClientDispatchAssociationResult(v10, 0, 0, 5);
      }
    }
    goto LABEL_10;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
    __WiFiManagerClientAddDevice_cold_2();
  }
  int v14 = (const void *)_WiFiDeviceClientCreate(*MEMORY[0x1E4F1CF80], a1, *(_DWORD *)(v8 + 4), a2, a3);
  if (!v14) {
    goto LABEL_10;
  }
  uint64_t v15 = v14;
  CFDictionarySetValue(*(CFMutableDictionaryRef *)(a1 + 64), a2, v14);
  if ((*(unsigned char *)(a1 + 72) & 4) != 0)
  {
    uint64_t v16 = *(void *)(a1 + 128);
    WiFiSendRightRelease((mach_port_name_t *)v8);
    os_unfair_recursive_lock_unlock();
    if (!a3 && v16)
    {
      if (a4)
      {
        CFArrayAppendValue(a4, v15);
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG)) {
          __WiFiManagerClientAddDevice_cold_1();
        }
      }
      else
      {
        (*(void (**)(uint64_t, const void *, void))(a1 + 128))(a1, v15, *(void *)(a1 + 136));
      }
    }
  }
  else
  {
    WiFiSendRightRelease((mach_port_name_t *)v8);
    os_unfair_recursive_lock_unlock();
  }
  CFRelease(v15);
  return 1;
}

void WiFiSendRightRelease(mach_port_name_t *a1)
{
  if (a1 && atomic_fetch_add_explicit((atomic_uint *volatile)a1, 0xFFFFFFFF, memory_order_relaxed) == 1)
  {
    mach_port_deallocate(*MEMORY[0x1E4F14960], a1[1]);
    free(a1);
  }
}

atomic_uint *__WiFiManagerClientGetOrReconnectServerPort(uint64_t a1, int a2)
{
  error[3] = *(CFErrorRef *)MEMORY[0x1E4F143B8];
  mach_port_t v81 = 0;
  mach_port_t sp = 0;
  mach_port_t previous = -1431655766;
  int v80 = -1431655766;
  os_unfair_recursive_lock_lock_with_options();
  uint64_t v4 = *(atomic_uint **)(a1 + 32);
  if (a2)
  {
    WiFiSendRightRelease(*(mach_port_name_t **)(a1 + 32));
    *(void *)(a1 + 32) = 0;
  }
  else if (v4)
  {
    atomic_fetch_add_explicit(v4, 1u, memory_order_relaxed);
    os_unfair_recursive_lock_unlock();
    return v4;
  }
  error[0] = 0;
  CFAllocatorRef v5 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  int v6 = SecTaskCreateFromSelf((CFAllocatorRef)*MEMORY[0x1E4F1CF80]);
  if (!v6) {
    goto LABEL_38;
  }
  CFPropertyListRef v7 = v6;
  CFTypeRef v8 = SecTaskCopyValueForEntitlement(v6, @"com.apple.wifi.manager-access", error);
  BOOL v10 = 1;
  if (v8)
  {
    CFTypeID TypeID = CFBooleanGetTypeID();
    if (TypeID == CFGetTypeID(v8))
    {
      if (CFEqual(v8, (CFTypeRef)*MEMORY[0x1E4F1CFD0])) {
        BOOL v10 = 0;
      }
    }
  }
  if (error[0])
  {
    CFRelease(error[0]);
    error[0] = 0;
  }
  if (v8) {
    CFRelease(v8);
  }
  CFRelease(v7);
  if (v10)
  {
LABEL_38:
    BOOL v31 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR);
    if (v31) {
      __WiFiManagerClientGetOrReconnectServerPort_cold_1(v31, v32, v33, v34, v35, v36, v37, v38);
    }
    goto LABEL_51;
  }
  if (bootstrap_look_up(*MEMORY[0x1E4F14638], "com.apple.wifi.manager", &sp))
  {
    BOOL v39 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR);
    if (v39) {
      __WiFiManagerClientGetOrReconnectServerPort_cold_7(v39, v40, v41, v42, v43, v44, v45, v46);
    }
    goto LABEL_51;
  }
  if (!sp)
  {
    BOOL v47 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR);
    if (v47) {
      __WiFiManagerClientGetOrReconnectServerPort_cold_2(v47, v48, v49, v50, v51, v52, v53, v54);
    }
    goto LABEL_51;
  }
  mach_port_name_t Port = WiFiMIGMachPortGetPort(*(void *)(a1 + 40));
  int v12 = (ipc_space_t *)MEMORY[0x1E4F14960];
  mach_port_insert_right(*MEMORY[0x1E4F14960], Port, Port, 0x14u);
  if (mach_port_request_notification(*v12, Port, 70, 0, Port, 0x15u, &previous))
  {
    BOOL v55 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR);
    if (v55) {
      __WiFiManagerClientGetOrReconnectServerPort_cold_6(v55, v56, v57, v58, v59, v60, v61, v62);
    }
    goto LABEL_51;
  }
  mach_port_t v13 = sp;
  int v14 = *(_DWORD *)(a1 + 16);
  pid_t v15 = getpid();
  wifi_manager_open(v13, v14, v15, Port, &v81, &v80);
  mach_port_deallocate(*v12, sp);
  if (v80 == 1)
  {
    BOOL v63 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR);
    if (v63) {
      __WiFiManagerClientGetOrReconnectServerPort_cold_3(v63, v64, v65, v66, v67, v68, v69, v70);
    }
    goto LABEL_51;
  }
  mach_port_t v16 = v81;
  if (!v81)
  {
    BOOL v71 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR);
    if (v71) {
      __WiFiManagerClientGetOrReconnectServerPort_cold_4(v71, v72, v73, v74, v75, v76, v77, v78);
    }
LABEL_51:
    os_unfair_recursive_lock_unlock();
    return 0;
  }
  uint64_t v4 = (atomic_uint *)malloc_type_malloc(8uLL, 0x100004000313F17uLL);
  atomic_uint *v4 = 1;
  v4[1] = v16;
  *(void *)(a1 + 32) = v4;
  wifi_manager_set_event_mask(v81, *(void *)(a1 + 72));
  Mutable = CFArrayCreateMutable(v5, 0, MEMORY[0x1E4F1D510]);
  memset(length, 0, sizeof(length));
  wifi_manager_copy_devices(v81, &length[1], length);
  if (*(void *)&length[1])
  {
    if (length[0])
    {
      CFArrayRef v18 = (const __CFArray *)_WiFiCopyUnserialized(*(UInt8 **)&length[1], length[0]);
      if (v18)
      {
        CFArrayRef v19 = v18;
        error[0] = 0;
        CFIndex Count = CFArrayGetCount(v18);
        if (Count >= 1)
        {
          CFIndex v21 = Count;
          for (CFIndex i = 0; i != v21; ++i)
          {
            CFDictionaryRef ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(v19, i);
            if (ValueAtIndex)
            {
              CFDictionaryRef v24 = ValueAtIndex;
              CFDictionaryRef Value = CFDictionaryGetValue(ValueAtIndex, @"VIRT_IF_NAME");
              CFNumberRef v26 = (const __CFNumber *)CFDictionaryGetValue(v24, @"VIRT_IF_ROLE");
              CFNumberGetValue(v26, kCFNumberLongType, error);
              if (Value) {
                __WiFiManagerClientAddDevice(a1, Value, (uint64_t)error[0], Mutable);
              }
            }
          }
        }
        CFRelease(v19);
      }
    }
  }
  _WiFiVMDealloc(*(uint64_t *)&length[1], length[0]);
  atomic_fetch_add_explicit(v4, 1u, memory_order_relaxed);
  os_unfair_recursive_lock_unlock();
  if (Mutable)
  {
    if (CFArrayGetCount(Mutable) >= 1)
    {
      CFIndex v27 = 0;
      v28 = MEMORY[0x1E4F14500];
      do
      {
        v29 = CFArrayGetValueAtIndex(Mutable, v27);
        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG)) {
          __WiFiManagerClientGetOrReconnectServerPort_cold_5((uint8_t *)error, (CFErrorRef *)((char *)error + 4));
        }
        (*(void (**)(uint64_t, const void *, void))(a1 + 128))(a1, v29, *(void *)(a1 + 136));
        ++v27;
      }
      while (CFArrayGetCount(Mutable) > v27);
    }
    CFRelease(Mutable);
  }
  return v4;
}

void __WiFiManagerClientAddDevice_cold_2()
{
  OUTLINED_FUNCTION_2();
  _os_log_error_impl(v0, v1, v2, v3, v4, 0x1Cu);
}

uint64_t _WiFiDeviceClientCreate(uint64_t a1, uint64_t a2, int a3, const void *a4, uint64_t a5)
{
  uint64_t v5 = 0;
  if (a3 && a4)
  {
    if (!__wiFiDeviceTypeID) {
      pthread_once(&__wiFiDeviceTypeInit, (void (*)(void))__WiFiDeviceClientRegister);
    }
    uint64_t Instance = _CFRuntimeCreateInstance();
    uint64_t v5 = Instance;
    if (Instance)
    {
      bzero((void *)(Instance + 16), 0x290uLL);
      *(void *)(v5 + 56) = a2;
      *(_DWORD *)(v5 + 16) = a3;
      CFTypeRef v11 = CFRetain(a4);
      *(void *)(v5 + 24) = v11;
      CFTypeRef BinaryData = _CFPropertyListCreateBinaryData((CFAllocatorRef)*MEMORY[0x1E4F1CF80], v11);
      *(void *)(v5 + 48) = BinaryData;
      if (BinaryData)
      {
        *(void *)(v5 + 40) = a5;
      }
      else
      {
        CFRelease((CFTypeRef)v5);
        return 0;
      }
    }
  }
  return v5;
}

uint64_t WiFiDeviceClientSetCoexParameters(uint64_t a1, const void *a2, const void *a3)
{
  unsigned int v18 = -3902;
  CFAllocatorRef v5 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  CFDataRef BinaryData = (const __CFData *)_CFPropertyListCreateBinaryData((CFAllocatorRef)*MEMORY[0x1E4F1CF80], a2);
  CFDataRef v7 = BinaryData;
  if (BinaryData)
  {
    BytePtr = CFDataGetBytePtr(BinaryData);
    int Length = CFDataGetLength(v7);
  }
  else
  {
    BytePtr = 0;
    int Length = 0;
  }
  CFDataRef v10 = (const __CFData *)_CFPropertyListCreateBinaryData(v5, a3);
  CFDataRef v11 = v10;
  if (v10)
  {
    int v12 = CFDataGetBytePtr(v10);
    int v13 = CFDataGetLength(v11);
  }
  else
  {
    int v12 = 0;
    int v13 = 0;
  }
  mach_port_t v14 = *(_DWORD *)(a1 + 16);
  pid_t v15 = CFDataGetBytePtr(*(CFDataRef *)(a1 + 48));
  int v16 = CFDataGetLength(*(CFDataRef *)(a1 + 48));
  wifi_device_set_coex_parameters(v14, (uint64_t)v15, v16, (uint64_t)BytePtr, Length, (uint64_t)v12, v13, (int *)&v18);
  if (v7) {
    CFRelease(v7);
  }
  if (v11) {
    CFRelease(v11);
  }
  return v18;
}

CFTypeRef _CFPropertyListCreateBinaryData(CFAllocatorRef bufferAllocator, const void *a2)
{
  CFTypeID v3 = CFWriteStreamCreateWithAllocatedBuffers(bufferAllocator, bufferAllocator);
  if (!v3) {
    return 0;
  }
  uint64_t v4 = v3;
  if (CFWriteStreamOpen(v3))
  {
    CFErrorRef error = 0;
    CFPropertyListWrite(a2, v4, kCFPropertyListBinaryFormat_v1_0, 0, &error);
    CFWriteStreamClose(v4);
    if (error)
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
        _CFPropertyListCreateBinaryData_cold_1();
      }
      CFRelease(error);
    }
    CFTypeRef v5 = CFWriteStreamCopyProperty(v4, (CFStreamPropertyKey)*MEMORY[0x1E4F1D440]);
  }
  else
  {
    CFTypeRef v5 = 0;
  }
  CFRelease(v4);
  return v5;
}

uint64_t wifi_device_set_coex_parameters(mach_port_t a1, uint64_t a2, int a3, uint64_t a4, int a5, uint64_t a6, int a7, int *a8)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  int v16 = 3;
  uint64_t v17 = a2;
  int v18 = 27918592;
  int v19 = a3;
  uint64_t v20 = a4;
  int v21 = 27918592;
  int v22 = a5;
  uint64_t v23 = a6;
  int v24 = 27918592;
  int v25 = a7;
  uint64_t v26 = *MEMORY[0x1E4F14068];
  int v27 = a3;
  int v28 = a5;
  int v29 = a7;
  mach_port_t special_reply_port = mig_get_special_reply_port();
  *(void *)&msg.msgh_bits = 0xAAAAAAAA80001513;
  msg.msgh_remote_port = a1;
  msg.msgh_local_port = special_reply_port;
  *(void *)&msg.msgh_voucher_port = 0x1106D00000000;
  if (MEMORY[0x1E4F14B18])
  {
    voucher_mach_msg_set(&msg);
    mach_port_t special_reply_port = msg.msgh_local_port;
  }
  uint64_t v11 = mach_msg(&msg, 3162115, 0x60u, 0x30u, special_reply_port, 0, 0);
  uint64_t v12 = v11;
  if ((v11 - 268435458) > 0xE || ((1 << (v11 - 2)) & 0x4003) == 0)
  {
    if (!v11)
    {
      if (msg.msgh_id == 71)
      {
        uint64_t v12 = 4294966988;
      }
      else if (msg.msgh_id == 69841)
      {
        if ((msg.msgh_bits & 0x80000000) == 0)
        {
          if (msg.msgh_size == 40)
          {
            if (!msg.msgh_remote_port)
            {
              uint64_t v12 = HIDWORD(v17);
              if (!HIDWORD(v17))
              {
                *a8 = v18;
                return v12;
              }
              goto LABEL_22;
            }
          }
          else if (msg.msgh_size == 36)
          {
            if (msg.msgh_remote_port) {
              BOOL v13 = 1;
            }
            else {
              BOOL v13 = HIDWORD(v17) == 0;
            }
            if (v13) {
              uint64_t v12 = 4294966996;
            }
            else {
              uint64_t v12 = HIDWORD(v17);
            }
            goto LABEL_22;
          }
        }
        uint64_t v12 = 4294966996;
      }
      else
      {
        uint64_t v12 = 4294966995;
      }
LABEL_22:
      mach_msg_destroy(&msg);
      return v12;
    }
    mig_dealloc_special_reply_port();
  }
  return v12;
}

void __WiFiManagerClientOrEventMask(uint64_t a1, uint64_t a2)
{
  *(void *)(a1 + 72) |= a2;
  CFTypeID v3 = __WiFiManagerClientGetOrReconnectServerPort(a1, 0);
  uint64_t v4 = (mach_port_name_t *)v3;
  if (v3) {
    wifi_manager_set_event_mask(v3[1], *(void *)(a1 + 72));
  }

  WiFiSendRightRelease(v4);
}

uint64_t wifi_manager_set_event_mask(mach_port_t a1, uint64_t a2)
{
  uint64_t v4 = *MEMORY[0x1E4F14068];
  uint64_t v5 = a2;
  *(void *)&msg.msgh_bits = 0xAAAAAAAA00000013;
  msg.msgh_voucher_port = 0;
  msg.msgh_id = 69731;
  msg.msgh_remote_port = a1;
  msg.msgh_local_port = 0;
  if (MEMORY[0x1E4F14B18]) {
    voucher_mach_msg_set(&msg);
  }
  return mach_msg(&msg, 2097153, 0x28u, 0, 0, 0, 0);
}

uint64_t wifi_manager_copy_property(int a1, uint64_t a2, int a3, void *a4, _DWORD *a5)
{
  *(void *)&long long v8 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v8 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(void *)&rcv_name[16] = 0x1AAAAAAAALL;
  *(_DWORD *)int v19 = -1431655766;
  *(_OWORD *)&v19[4] = v8;
  *(_OWORD *)int rcv_name = v8;
  uint64_t v16 = a2;
  int v17 = 27918592;
  int v18 = a3;
  *(void *)int v19 = *MEMORY[0x1E4F14068];
  *(_DWORD *)&v19[8] = a3;
  mach_port_name_t special_reply_port = mig_get_special_reply_port();
  *(_DWORD *)&rcv_name[4] = a1;
  *(_DWORD *)&rcv_name[8] = special_reply_port;
  int v14 = -2147478253;
  *(void *)&rcv_name[12] = 0x1103E00000000;
  if (MEMORY[0x1E4F14B18])
  {
    voucher_mach_msg_set((mach_msg_header_t *)&v14);
    mach_port_name_t special_reply_port = *(_DWORD *)&rcv_name[8];
  }
  uint64_t v10 = mach_msg((mach_msg_header_t *)&v14, 3162115, 0x38u, 0x40u, special_reply_port, 0, 0);
  uint64_t v11 = v10;
  if ((v10 - 268435458) > 0xE || ((1 << (v10 - 2)) & 0x4003) == 0)
  {
    if (!v10)
    {
      if (*(_DWORD *)&rcv_name[16] == 71)
      {
        uint64_t v11 = 4294966988;
      }
      else if (*(_DWORD *)&rcv_name[16] == 69794)
      {
        if ((v14 & 0x80000000) == 0)
        {
          if (*(_DWORD *)rcv_name == 36)
          {
            uint64_t v11 = 4294966996;
            if (HIDWORD(v16))
            {
              if (*(_DWORD *)&rcv_name[4]) {
                uint64_t v11 = 4294966996;
              }
              else {
                uint64_t v11 = HIDWORD(v16);
              }
            }
          }
          else
          {
            uint64_t v11 = 4294966996;
          }
          goto LABEL_24;
        }
        uint64_t v11 = 4294966996;
        if (*(_DWORD *)&rcv_name[20] == 1 && *(_DWORD *)rcv_name == 56 && !*(_DWORD *)&rcv_name[4] && HIBYTE(v17) == 1)
        {
          int v12 = v18;
          if (v18 == *(_DWORD *)&v19[8])
          {
            uint64_t v11 = 0;
            *a4 = v16;
            *a5 = v12;
            return v11;
          }
        }
      }
      else
      {
        uint64_t v11 = 4294966995;
      }
LABEL_24:
      mach_msg_destroy((mach_msg_header_t *)&v14);
      return v11;
    }
    mig_dealloc_special_reply_port();
  }
  return v11;
}

uint64_t wifi_manager_open(int a1, int a2, int a3, int a4, _DWORD *a5, _DWORD *a6)
{
  *(void *)&long long v9 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v9 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)&msg[20] = v9;
  long long v16 = v9;
  unint64_t v17 = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)&msg[4] = v9;
  *(_DWORD *)&msg[24] = 1;
  *(_DWORD *)&msg[28] = a4;
  LODWORD(v16) = 1157802;
  *(void *)((char *)&v16 + 4) = *MEMORY[0x1E4F14068];
  HIDWORD(v16) = a2;
  LODWORD(v17) = a3;
  mach_port_name_t special_reply_port = mig_get_special_reply_port();
  *(_DWORD *)&msg[8] = a1;
  *(_DWORD *)&msg[12] = special_reply_port;
  *(_DWORD *)mach_msg_header_t msg = -2147478253;
  *(void *)&msg[16] = 0x1103A00000000;
  if (MEMORY[0x1E4F14B18])
  {
    voucher_mach_msg_set((mach_msg_header_t *)msg);
    mach_port_name_t special_reply_port = *(_DWORD *)&msg[12];
  }
  uint64_t v11 = mach_msg((mach_msg_header_t *)msg, 3162115, 0x38u, 0x3Cu, special_reply_port, 0, 0);
  uint64_t v12 = v11;
  if ((v11 - 268435458) > 0xE || ((1 << (v11 - 2)) & 0x4003) == 0)
  {
    if (!v11)
    {
      if (*(_DWORD *)&msg[20] == 71)
      {
        uint64_t v12 = 4294966988;
      }
      else if (*(_DWORD *)&msg[20] == 69790)
      {
        if ((*(_DWORD *)msg & 0x80000000) == 0)
        {
          if (*(_DWORD *)&msg[4] == 36)
          {
            uint64_t v12 = 4294966996;
            if (*(_DWORD *)&msg[32])
            {
              if (*(_DWORD *)&msg[8]) {
                uint64_t v12 = 4294966996;
              }
              else {
                uint64_t v12 = *(unsigned int *)&msg[32];
              }
            }
          }
          else
          {
            uint64_t v12 = 4294966996;
          }
          goto LABEL_23;
        }
        uint64_t v12 = 4294966996;
        if (*(_DWORD *)&msg[24] == 1 && *(_DWORD *)&msg[4] == 52 && !*(_DWORD *)&msg[8] && WORD1(v16) << 16 == 1114112)
        {
          uint64_t v12 = 0;
          int v13 = HIDWORD(v16);
          *a5 = *(_DWORD *)&msg[28];
          *a6 = v13;
          return v12;
        }
      }
      else
      {
        uint64_t v12 = 4294966995;
      }
LABEL_23:
      mach_msg_destroy((mach_msg_header_t *)msg);
      return v12;
    }
    mig_dealloc_special_reply_port();
  }
  return v12;
}

uint64_t wifi_manager_copy_devices(int a1, void *a2, _DWORD *a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  *(void *)&long long v6 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v6 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)&v13[12] = v6;
  *(_OWORD *)int v13 = v6;
  *(_OWORD *)&msg[20] = v6;
  *(_DWORD *)&msg[4] = -1431655766;
  mach_port_name_t special_reply_port = mig_get_special_reply_port();
  *(_DWORD *)&msg[8] = a1;
  *(_DWORD *)&msg[12] = special_reply_port;
  *(_DWORD *)mach_msg_header_t msg = 5395;
  *(void *)&msg[16] = 0x1103C00000000;
  if (MEMORY[0x1E4F14B18])
  {
    voucher_mach_msg_set((mach_msg_header_t *)msg);
    mach_port_name_t special_reply_port = *(_DWORD *)&msg[12];
  }
  uint64_t v8 = mach_msg((mach_msg_header_t *)msg, 3162115, 0x18u, 0x40u, special_reply_port, 0, 0);
  uint64_t v9 = v8;
  if ((v8 - 268435458) > 0xE || ((1 << (v8 - 2)) & 0x4003) == 0)
  {
    if (!v8)
    {
      if (*(_DWORD *)&msg[20] == 71)
      {
        uint64_t v9 = 4294966988;
      }
      else if (*(_DWORD *)&msg[20] == 69792)
      {
        if ((*(_DWORD *)msg & 0x80000000) == 0)
        {
          if (*(_DWORD *)&msg[4] == 36)
          {
            uint64_t v9 = 4294966996;
            if (*(_DWORD *)&msg[32])
            {
              if (*(_DWORD *)&msg[8]) {
                uint64_t v9 = 4294966996;
              }
              else {
                uint64_t v9 = *(unsigned int *)&msg[32];
              }
            }
          }
          else
          {
            uint64_t v9 = 4294966996;
          }
          goto LABEL_24;
        }
        uint64_t v9 = 4294966996;
        if (*(_DWORD *)&msg[24] == 1 && *(_DWORD *)&msg[4] == 56 && !*(_DWORD *)&msg[8] && v13[3] == 1)
        {
          int v10 = *(_DWORD *)&v13[4];
          if (*(_DWORD *)&v13[4] == *(_DWORD *)&v13[16])
          {
            uint64_t v9 = 0;
            *a2 = *(void *)&msg[28];
            *a3 = v10;
            return v9;
          }
        }
      }
      else
      {
        uint64_t v9 = 4294966995;
      }
LABEL_24:
      mach_msg_destroy((mach_msg_header_t *)msg);
      return v9;
    }
    mig_dealloc_special_reply_port();
  }
  return v9;
}

uint64_t WiFiManagerClientCreate(uint64_t a1, int a2)
{
  uint64_t v3 = *MEMORY[0x1E4F14960];
  mach_msg_type_number_t port_info_outCnt = 1;
  if (!__wiFiManagerTypeID) {
    pthread_once(&__wiFiManagerTypeInit, (void (*)(void))__WiFiManagerClientRegister);
  }
  uint64_t Instance = (_OWORD *)_CFRuntimeCreateInstance();
  uint64_t v5 = (uint64_t)Instance;
  if (!Instance) {
    return v5;
  }
  mach_port_name_t name = -1431655766;
  integer_t port_info_out = -1431655766;
  Instance[1] = 0u;
  Instance[2] = 0u;
  Instance[3] = 0u;
  Instance[4] = 0u;
  Instance[5] = 0u;
  Instance[6] = 0u;
  Instance[7] = 0u;
  Instance[8] = 0u;
  Instance[9] = 0u;
  Instance[10] = 0u;
  Instance[11] = 0u;
  Instance[12] = 0u;
  Instance[13] = 0u;
  Instance[14] = 0u;
  Instance[15] = 0u;
  Instance[16] = 0u;
  Instance[17] = 0u;
  Instance[18] = 0u;
  Instance[19] = 0u;
  Instance[20] = 0u;
  Instance[21] = 0u;
  CFAllocatorRef v6 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
  *(void *)(v5 + 64) = Mutable;
  if (!Mutable)
  {
    BOOL v18 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR);
    if (v18) {
      WiFiManagerClientCreate_cold_1(v18, v19, v20, v21, v22, v23, v24, v25);
    }
    goto LABEL_21;
  }
  *(_DWORD *)(v5 + 20) = 0;
  *(_DWORD *)(v5 + 24) = 0;
  mach_port_allocate(v3, 1u, &name);
  uint64_t v8 = WiFiMIGMachPortCreate((uint64_t)v6, dword_1F1A778C0, name, 1);
  *(void *)(v5 + 40) = v8;
  if (!v8)
  {
    BOOL v26 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR);
    if (v26) {
      WiFiManagerClientCreate_cold_2(v26, v27, v28, v29, v30, v31, v32, v33);
    }
    goto LABEL_21;
  }
  mach_port_name_t Port = WiFiMIGMachPortGetPort((uint64_t)v8);
  if (mach_port_get_attributes(v3, Port, 1, &port_info_out, &port_info_outCnt))
  {
    BOOL v34 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR);
    if (v34) {
      WiFiManagerClientCreate_cold_4(v34, v35, v36, v37, v38, v39, v40, v41);
    }
    goto LABEL_21;
  }
  integer_t port_info_out = 32;
  uint64_t v10 = WiFiMIGMachPortGetPort(*(void *)(v5 + 40));
  if (MEMORY[0x1C18A5120](v3, v10, 1, &port_info_out, port_info_outCnt))
  {
    BOOL v42 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR);
    if (v42) {
      WiFiManagerClientCreate_cold_3(v42, v43, v44, v45, v46, v47, v48, v49);
    }
LABEL_21:
    CFArrayRef ArrayBySeparatingStrings = (CFArrayRef)v5;
    uint64_t v5 = 0;
LABEL_11:
    CFRelease(ArrayBySeparatingStrings);
    return v5;
  }
  WiFiMIGMachPortRegisterDemuxCallback(*(void *)(v5 + 40), (uint64_t)__WiFiManagerClientMIGDemuxCallback, v5);
  WiFiMIGMachPortRegisterTerminationCallback(*(void *)(v5 + 40), (uint64_t)__WiFiManagerClientServerTerminationCallback, v5);
  unsigned int v11 = WiFiMIGMachPortGetPort(*(void *)(v5 + 40));
  WiFiPortCacheAdd(v11, (const void *)v5);
  *(_DWORD *)(v5 + 16) = a2;
  uint64_t v12 = __WiFiManagerClientGetOrReconnectServerPort(v5, 1);
  WiFiSendRightRelease((mach_port_name_t *)v12);
  *(unsigned char *)(v5 + 80) = 0;
  CFArrayRef ArrayBySeparatingStrings = CFStringCreateArrayBySeparatingStrings(v6, @"Preferences SpringBoard Carousel WiFiPickerExtens Setup budd sharingd demod BundledIntentHandler SiriViewService assistantd assistant_service Siri SettingsIntentExtension NanoSettings PineBoard TVSettings SoundBoard RealityControlCenter MuseBuddyApp mobilewifitool WirelessStress coreautomationd wifiutil NanoWiFiViewService ATKWiFiFramework WiFiViewService hQT XCTestInternalAngel HPSetup AirPlaySenderUIApp TVSetup deviceaccessd AccessorySetupUI", @" ");
  uint64_t v14 = getprogname();
  CFStringEncoding SystemEncoding = CFStringGetSystemEncoding();
  CFStringRef v16 = CFStringCreateWithCString(v6, v14, SystemEncoding);
  v53.length = CFArrayGetCount(ArrayBySeparatingStrings);
  v53.location = 0;
  *(unsigned char *)(v5 + 81) = CFArrayContainsValue(ArrayBySeparatingStrings, v53, v16) != 0;
  *(_DWORD *)(v5 + 336) = 0;
  if (v16) {
    CFRelease(v16);
  }
  if (ArrayBySeparatingStrings) {
    goto LABEL_11;
  }
  return v5;
}

uint64_t WiFiMIGMachPortGetPort(uint64_t a1)
{
  return *(unsigned int *)(a1 + 16);
}

uint64_t WiFiPortCacheAdd(unsigned int a1, const void *a2)
{
  pthread_mutex_lock(&__wifiPortCacheLock);
  if (__wifiPortCache) {
    CFDictionarySetValue((CFMutableDictionaryRef)__wifiPortCache, (const void *)a1, a2);
  }

  return pthread_mutex_unlock(&__wifiPortCacheLock);
}

uint64_t WiFiMIGMachPortRegisterTerminationCallback(uint64_t result, uint64_t a2, uint64_t a3)
{
  *(void *)(result + 96) = a2;
  *(void *)(result + 104) = a3;
  return result;
}

uint64_t WiFiMIGMachPortRegisterDemuxCallback(uint64_t result, uint64_t a2, uint64_t a3)
{
  *(void *)(result + 80) = a2;
  *(void *)(result + 88) = a3;
  return result;
}

void *WiFiMIGMachPortCreate(uint64_t a1, uint64_t a2, int a3, int a4)
{
  if (a2 < 1) {
    return 0;
  }
  if (!__WiFiMIGMachPortTypeID) {
    pthread_once(&__WiFiMIGMachPortTypeInit, (void (*)(void))__WiFiMIGMachPortRegister);
  }
  uint64_t Instance = (_OWORD *)_CFRuntimeCreateInstance();
  uint64_t v8 = Instance;
  if (Instance)
  {
    Instance[5] = 0u;
    Instance[6] = 0u;
    Instance[3] = 0u;
    Instance[4] = 0u;
    Instance[1] = 0u;
    Instance[2] = 0u;
    *((_DWORD *)Instance + 4) = a3;
    if (!a4
      || ((v11.version = 0, memset(&v11.retain, 0, 24), v11.info = Instance, !a3)
        ? (uint64_t v9 = (uint64_t)CFMachPortCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], (CFMachPortCallBack)__WiFiMIGMachPortCFPortCallback, &v11, 0)): (uint64_t v9 = _CFMachPortCreateWithPort()), (v8[7] = v9) != 0))
    {
      v8[3] = a2;
      return v8;
    }
    CFRelease(v8);
    return 0;
  }
  return v8;
}

uint64_t _CFMachPortCreateWithPort()
{
  return MEMORY[0x1F4102130]("WiFiManager/base");
}

void __WiFiMIGMachPortCFPortCallback(int a1, mach_msg_header_t *a2, int a3, CFIndex *cf)
{
  if (!cf) {
    return;
  }
  CFRetain(cf);
  CFAllocatorRef v6 = (mach_msg_header_t *)CFAllocatorAllocate(0, cf[3], 0);
  if (v6)
  {
    CFDataRef v7 = v6;
    mach_port_t msgh_remote_port = a2->msgh_remote_port;
    v6->msgh_bits = a2->msgh_bits & 0x1F;
    v6->msgh_size = 36;
    *(void *)&v6->mach_port_t msgh_remote_port = msgh_remote_port;
    v6->msgh_id = a2->msgh_id + 100;
    if (a2->msgh_id == 70)
    {
      v6->msgh_bits = 0;
      v6->mach_port_t msgh_remote_port = 0;
      v6[1].mach_port_t msgh_remote_port = 0;
      p_mach_port_t msgh_remote_port = &v6[1].msgh_remote_port;
      uint64_t v10 = (void (*)(CFIndex *, CFIndex))cf[12];
      if (v10) {
        v10(cf, cf[13]);
      }
    }
    else
    {
      uint64_t v11 = *MEMORY[0x1E4F14068];
      v6[1].mach_port_t msgh_remote_port = -303;
      p_mach_port_t msgh_remote_port = &v6[1].msgh_remote_port;
      *(void *)&v6[1].msgh_bits = v11;
      uint64_t v12 = (void (*)(CFIndex *, mach_msg_header_t *, mach_msg_header_t *, CFIndex))cf[10];
      if (v12) {
        v12(cf, a2, v6, cf[11]);
      }
    }
    if ((v7->msgh_bits & 0x80000000) == 0 && *p_msgh_remote_port)
    {
      if (*p_msgh_remote_port == -305) {
        goto LABEL_18;
      }
      a2->mach_port_t msgh_remote_port = 0;
      mach_msg_destroy(a2);
    }
    if (v7->msgh_remote_port)
    {
      if ((v7->msgh_bits & 0x1F) == 0x12) {
        mach_msg_option_t v13 = 1;
      }
      else {
        mach_msg_option_t v13 = 17;
      }
      if ((mach_msg(v7, v13, v7->msgh_size, 0, 0, 0, 0) - 268435459) > 1) {
        goto LABEL_18;
      }
    }
    else if ((v7->msgh_bits & 0x80000000) == 0)
    {
      goto LABEL_18;
    }
    mach_msg_destroy(v7);
LABEL_18:
    CFAllocatorDeallocate(0, v7);
  }

  CFRelease(cf);
}

uint64_t __WiFiManagerClientMIGDemuxCallback(uint64_t a1, _DWORD *a2, uint64_t a3)
{
  int v3 = a2[5];
  if (v3 >= dword_1F1A778B8 && v3 < unk_1F1A778BC) {
    LOBYTE(result) = wifi_manager_client_server(a2, a3);
  }
  else {
    LOBYTE(result) = 0;
  }
  return result;
}

uint64_t wifi_manager_client_server(_DWORD *a1, uint64_t a2)
{
  int v2 = a1[2];
  *(_DWORD *)a2 = *a1 & 0x1F;
  *(_DWORD *)(a2 + 4) = 36;
  int v3 = a1[5] + 100;
  *(_DWORD *)(a2 + 8) = v2;
  *(_DWORD *)(a2 + 12) = 0;
  *(_DWORD *)(a2 + 16) = 0;
  *(_DWORD *)(a2 + 20) = v3;
  int v4 = a1[5];
  if ((v4 - 96974) >= 0xFFFFFFF2
    && (uint64_t v5 = (void (*)(void))*(&_wifi_manager_client_subsystem + 5 * (v4 - 96960) + 5)) != 0)
  {
    v5();
    return 1;
  }
  else
  {
    uint64_t result = 0;
    *(void *)(a2 + 24) = *MEMORY[0x1E4F14068];
    *(_DWORD *)(a2 + 32) = -303;
  }
  return result;
}

uint64_t _Xwifi_manager_client_dispatch_event(uint64_t result, uint64_t a2)
{
  if ((*(_DWORD *)result & 0x80000000) != 0 && *(_DWORD *)(result + 24) == 2 && *(_DWORD *)(result + 4) == 84)
  {
    if (*(unsigned char *)(result + 39) == 1 && *(unsigned char *)(result + 55) == 1)
    {
      unsigned int v3 = *(_DWORD *)(result + 40);
      if (v3 == *(_DWORD *)(result + 68))
      {
        unsigned int v4 = *(_DWORD *)(result + 56);
        if (v4 == *(_DWORD *)(result + 80))
        {
          uint64_t result = _wifi_manager_client_dispatch_event(*(_DWORD *)(result + 12), *(UInt8 **)(result + 28), v3, *(void *)(result + 72), *(UInt8 **)(result + 44), v4);
          *(_DWORD *)(a2 + 32) = result;
          return result;
        }
      }
    }
    int v5 = -300;
  }
  else
  {
    int v5 = -304;
  }
  *(_DWORD *)(a2 + 32) = v5;
  *(void *)(a2 + 24) = *MEMORY[0x1E4F14068];
  return result;
}

_WORD *WiFiDeviceClientCopyCurrentNetwork(uint64_t a1)
{
  memset(length, 0, sizeof(length));
  int v2 = getprogname();
  if (!strncmp("SpringBoard", v2, 0xBuLL) && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
    WiFiDeviceClientCopyCurrentNetwork_cold_1(a1);
  }
  int v3 = *(_DWORD *)(a1 + 16);
  BytePtr = CFDataGetBytePtr(*(CFDataRef *)(a1 + 48));
  int v5 = CFDataGetLength(*(CFDataRef *)(a1 + 48));
  wifi_device_copy_current_network(v3, (uint64_t)BytePtr, v5, &length[1], length);
  CFPropertyListRef v6 = _WiFiCopyUnserialized(*(UInt8 **)&length[1], length[0]);
  if (v6)
  {
    CFDataRef v7 = v6;
    uint64_t v8 = WiFiNetworkCreate(*MEMORY[0x1E4F1CF80], v6);
    CFRelease(v7);
  }
  else
  {
    uint64_t v8 = 0;
  }
  _WiFiVMDealloc(*(uint64_t *)&length[1], length[0]);
  return v8;
}

uint64_t _wifi_manager_client_dispatch_event(unsigned int a1, UInt8 *a2, unsigned int a3, uint64_t a4, UInt8 *a5, unsigned int a6)
{
  uint64_t v11 = WiFiPortCacheCopy(a1);
  if (v11)
  {
    uint64_t v12 = v11;
    CFStringRef v13 = (const __CFString *)_WiFiCopyUnserialized(a2, a3);
    if (v13) {
      Device = WiFiManagerClientGetDevice((uint64_t)v12, v13);
    }
    else {
      Device = 0;
    }
    CFDictionaryRef v15 = (const __CFDictionary *)_WiFiCopyUnserialized(a5, a6);
    CFArrayRef v16 = v15;
    switch(a4)
    {
      case 0:
        if (Device) {
          _WiFiDeviceClientDispatchPowerEvent((uint64_t)Device);
        }
        goto LABEL_80;
      case 1:
        if (Device) {
          _WiFiDeviceClientDispatchLinkEvent((uint64_t)Device, v15);
        }
        goto LABEL_80;
      case 2:
        unint64_t v17 = v12;
        CFStringRef v18 = v13;
        int v19 = 0;
        goto LABEL_33;
      case 3:
        if (Device) {
          _WiFiDeviceClientDispatchRemovalEvent(Device);
        }
        goto LABEL_80;
      case 4:
        goto LABEL_80;
      case 6:
        if (Device) {
          _WiFiDeviceClientDispatchScanCacheUpdateEvent(Device, v15);
        }
        goto LABEL_80;
      case 7:
      case 8:
        if (Device) {
          _WiFiDeviceClientDispatchScanUpdateEvent((uint64_t)Device, v15);
        }
        goto LABEL_80;
      case 9:
        uint64_t v20 = WiFiManagerClientGetDevice((uint64_t)v12, v13);
        uint64_t v21 = (void (*)(void *, const void *, void, uint64_t))v12[20];
        if (!v21) {
          goto LABEL_80;
        }
        uint64_t v22 = v20;
        if (v16)
        {
          NetworksFromRecords = _WiFiCreateNetworksFromRecords(v16);
          ((void (*)(void *, const void *, __CFArray *, void))v12[20])(v12, v22, NetworksFromRecords, v12[21]);
          goto LABEL_42;
        }
        uint64_t v33 = v12[21];
        goto LABEL_88;
      case 10:
        if (Device)
        {
          uint64_t v24 = WiFiNetworkCreate(*MEMORY[0x1E4F1CF80], v15);
          _WiFiDeviceClientDispatchBssidEvent((uint64_t)Device, (uint64_t)v24);
          if (v24) {
            CFRelease(v24);
          }
        }
        goto LABEL_80;
      case 11:
        if (Device) {
          _WiFiDeviceClientDispatchResumeScanEvent((uint64_t)Device);
        }
        goto LABEL_80;
      case 12:
        if (Device)
        {
          uint64_t valuePtr = 0;
          CFNumberGetValue(v15, kCFNumberCFIndexType, &valuePtr);
          _WiFiDeviceClientDispatchBgScanSuspendResumeEvent((uint64_t)Device, valuePtr == 1);
        }
        goto LABEL_80;
      case 14:
        if (Device) {
          _WiFiDeviceClientDispatchLQMEvent((uint64_t)Device, (uint64_t)v15);
        }
        goto LABEL_80;
      case 15:
        if (Device) {
          _WiFiDeviceClientDispatchDiagnosticsStartEvent((uint64_t)Device, (uint64_t)v15);
        }
        goto LABEL_80;
      case 17:
        unint64_t v17 = v12;
        CFStringRef v18 = (const __CFString *)v16;
        int v19 = 1;
LABEL_33:
        WiFiManagerClientDispatchAttachmentEvent(v17, v18, v19);
        goto LABEL_80;
      case 18:
        uint64_t v25 = (uint64_t)v12;
        CFArrayRef v26 = v16;
        int v27 = 0;
        goto LABEL_75;
      case 19:
        if (Device) {
          _WiFiDeviceClientDispatchHostApStateChangedEvent((uint64_t)Device, (uint64_t)v15);
        }
        goto LABEL_80;
      case 20:
        if (Device) {
          _WiFiDeviceClientDispatchDeviceAvailableEvent((uint64_t)Device, (uint64_t)v15);
        }
        goto LABEL_80;
      case 21:
        uint64_t v28 = WiFiManagerClientGetDevice((uint64_t)v12, v13);
        uint64_t v21 = (void (*)(void *, const void *, void, uint64_t))v12[22];
        if (!v21) {
          goto LABEL_80;
        }
        uint64_t v22 = v28;
        if (v16)
        {
          NetworksFromRecords = _WiFiCreateNetworksFromRecords(v16);
          ((void (*)(void *, const void *, __CFArray *, void))v12[22])(v12, v22, NetworksFromRecords, v12[23]);
LABEL_42:
          if (NetworksFromRecords) {
            CFRelease(NetworksFromRecords);
          }
LABEL_81:
          CFRelease(v16);
LABEL_82:
          if (v13) {
LABEL_83:
          }
            CFRelease(v13);
        }
        else
        {
          uint64_t v33 = v12[23];
LABEL_88:
          v21(v12, v22, 0, v33);
          if (v13) {
            goto LABEL_83;
          }
        }
        CFRelease(v12);
        break;
      case 22:
        if (Device) {
          _WiFiDeviceClientDispatchVirtInterfaceStateChangeEvent((uint64_t)Device, v15);
        }
        goto LABEL_80;
      case 23:
        if (Device) {
          _WiFiDeviceClientDispatchAutoJoinNotification((uint64_t)Device, v15);
        }
        goto LABEL_80;
      case 24:
        if (Device) {
          _WiFiDeviceClientDispatchRangingReportEvent((uint64_t)Device, (uint64_t)v15);
        }
        goto LABEL_80;
      case 25:
        uint64_t v29 = WiFiManagerClientGetDevice((uint64_t)v12, v13);
        uint64_t v30 = (void (*)(void *, const void *, const __CFArray *, void))v12[24];
        if (v30) {
          v30(v12, v29, v16, v12[25]);
        }
        goto LABEL_80;
      case 30:
        if (Device) {
          _WiFiDeviceClientDispatchRoamStatusEvent((uint64_t)Device, (uint64_t)v15);
        }
        goto LABEL_80;
      case 31:
        if (Device) {
          _WiFiDeviceClientDispatchWeightAvgLQMEvent((uint64_t)Device, (uint64_t)v15);
        }
        goto LABEL_80;
      case 34:
        if (Device) {
          _WiFiDeviceClientDispatchUserJoinNotification((uint64_t)Device, v15);
        }
        goto LABEL_80;
      case 35:
        if (Device) {
          _WiFiDeviceClientDispatchBTScanIntervalRelaxEvent((uint64_t)Device, (uint64_t)v15);
        }
        goto LABEL_80;
      case 37:
        if (Device)
        {
          LODWORD(valuePtr) = -1;
          CFNumberGetValue(v15, kCFNumberSInt32Type, &valuePtr);
          _WiFiDeviceClientDispatchCarPlayNetworkTypeChangeEvent((uint64_t)Device, valuePtr);
        }
        goto LABEL_80;
      case 38:
        if (Device)
        {
          BOOL v31 = CFBooleanGetValue(v15) != 0;
          _WiFiDeviceClientDispatch24GHzNetworkInCriticalStateEvent((uint64_t)Device, v31);
        }
        goto LABEL_80;
      case 39:
        if (Device)
        {
          LODWORD(valuePtr) = 0;
          CFNumberGetValue(v15, kCFNumberSInt32Type, &valuePtr);
          _WiFiDeviceClientDispatchM1M4Handshake24GHzCountEvent((uint64_t)Device, valuePtr);
        }
        goto LABEL_80;
      case 40:
        if (Device) {
          _WiFiDeviceClientDispatchCatsUpdateEvent((uint64_t)Device, (uint64_t)v15);
        }
        goto LABEL_80;
      case 41:
        if (Device) {
          _WiFiDeviceClientDispatchP2pThreadCoexEvent((uint64_t)Device, (uint64_t)v15);
        }
        goto LABEL_80;
      case 42:
        if (Device) {
          _WiFiDeviceClientDispatchBTCoexStatsEvent((uint64_t)Device, (uint64_t)v15);
        }
        goto LABEL_80;
      case 43:
        if (Device) {
          _WiFiDeviceClientDispatchBSPEvent((uint64_t)Device, (uint64_t)v15);
        }
        goto LABEL_80;
      case 44:
        uint64_t v25 = (uint64_t)v12;
        CFArrayRef v26 = v16;
        int v27 = 1;
LABEL_75:
        WiFiManagerClientRemoveDevice(v25, v26, 1, v27);
        goto LABEL_80;
      case 45:
        if (Device) {
          _WiFiDeviceClientDispatchUCMEvent((uint64_t)Device, (uint64_t)v15);
        }
        goto LABEL_80;
      case 46:
        if (Device) {
          _WiFiDeviceClientDispatchTdConfirmedEvent((uint64_t)Device, (uint64_t)v15);
        }
        goto LABEL_80;
      default:
LABEL_80:
        if (v16) {
          goto LABEL_81;
        }
        goto LABEL_82;
    }
  }
  _WiFiVMDealloc((uint64_t)a2, a3);
  _WiFiVMDealloc((uint64_t)a5, a6);
  return 0;
}

CFPropertyListRef _WiFiCopyUnserialized(UInt8 *bytes, CFIndex length)
{
  if (!bytes || !length)
  {
    BOOL v6 = bytes != 0;
    if (length)
    {
      BOOL v6 = 0;
      BOOL v7 = bytes == 0;
    }
    else
    {
      BOOL v7 = 0;
    }
    if ((v7 || v6) && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      _WiFiCopyUnserialized_cold_2();
    }
    return 0;
  }
  CFAllocatorRef v2 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  CFDataRef v3 = CFDataCreateWithBytesNoCopy((CFAllocatorRef)*MEMORY[0x1E4F1CF80], bytes, length, (CFAllocatorRef)*MEMORY[0x1E4F1CFA0]);
  if (!v3) {
    return 0;
  }
  CFDataRef v4 = v3;
  CFErrorRef error = 0;
  CFPropertyListRef v5 = CFPropertyListCreateWithData(v2, v3, 1uLL, 0, &error);
  if (error)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      _WiFiCopyUnserialized_cold_1();
    }
    CFRelease(error);
  }
  CFRelease(v4);
  return v5;
}

uint64_t _WiFiVMDealloc(uint64_t result, uint64_t a2)
{
  if (result)
  {
    if (a2) {
      JUMPOUT(0x1C18A5370);
    }
  }
  return result;
}

const void *WiFiPortCacheCopy(unsigned int a1)
{
  pthread_mutex_lock(&__wifiPortCacheLock);
  if (__wifiPortCache)
  {
    CFDictionaryRef Value = CFDictionaryGetValue((CFDictionaryRef)__wifiPortCache, (const void *)a1);
    CFDataRef v3 = Value;
    if (Value) {
      CFRetain(Value);
    }
  }
  else
  {
    CFDataRef v3 = 0;
  }
  pthread_mutex_unlock(&__wifiPortCacheLock);
  return v3;
}

const void *WiFiManagerClientGetDevice(uint64_t a1, const void *a2)
{
  os_unfair_recursive_lock_lock_with_options();
  CFDictionaryRef Value = CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 64), a2);
  if (!Value && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
    WiFiManagerClientGetDevice_cold_1();
  }
  os_unfair_recursive_lock_unlock();
  return Value;
}

uint64_t _WiFiDeviceClientDispatchLQMEvent(uint64_t result, uint64_t a2)
{
  CFAllocatorRef v2 = *(uint64_t (**)(uint64_t, uint64_t, void))(result + 304);
  if (v2) {
    return v2(result, a2, *(void *)(result + 312));
  }
  return result;
}

_WORD *WiFiNetworkCreate(int a1, CFTypeRef cf)
{
  if (cf)
  {
    CFTypeID v3 = CFGetTypeID(cf);
    if (v3 != CFDictionaryGetTypeID()) {
      goto LABEL_25;
    }
    CFStringRef Value = (const __CFString *)CFDictionaryGetValue((CFDictionaryRef)cf, @"SSID_STR");
    if (Value)
    {
      CFTypeID TypeID = CFStringGetTypeID();
      if (TypeID != CFGetTypeID(Value)) {
        return 0;
      }
    }
    if (!WiFiNetworkIsSSIDLengthValid(Value) && !CFDictionaryGetValue((CFDictionaryRef)cf, @"DomainName"))
    {
LABEL_25:
      return 0;
    }
    BOOL v6 = CFDictionaryGetValue((CFDictionaryRef)cf, @"SSID");
    if (v6)
    {
      BOOL v7 = v6;
      CFTypeID v8 = CFDataGetTypeID();
      if (v8 != CFGetTypeID(v7)) {
        return 0;
      }
    }
  }
  if (!__kWiFiNetworkTypeID) {
    pthread_once(&__wifiNetworkTypeInit, (void (*)(void))__WiFiNetworkRegister);
  }
  uint64_t Instance = _CFRuntimeCreateInstance();
  uint64_t v10 = (_WORD *)Instance;
  if (Instance)
  {
    *(void *)(Instance + 16) = 0;
    *(void *)(Instance + 24) = 0;
    uint64_t v11 = (CFMutableDictionaryRef *)(Instance + 16);
    CFAllocatorRef v12 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
    if (cf) {
      CFDictionaryRef MutableCopy = CFDictionaryCreateMutableCopy(v12, 0, (CFDictionaryRef)cf);
    }
    else {
      CFDictionaryRef MutableCopy = CFDictionaryCreateMutable(v12, 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
    }
    *uint64_t v11 = MutableCopy;
    if (MutableCopy)
    {
      uint64_t v14 = CFDictionaryGetValue(MutableCopy, @"HIDDEN_NETWORK");
      if (v14) {
        BOOL v15 = v14 == (const void *)*MEMORY[0x1E4F1CFD0];
      }
      else {
        BOOL v15 = 0;
      }
      if (v15)
      {
        CFArrayRef v16 = v14;
        CFDictionaryRemoveValue(*v11, @"HIDDEN_NETWORK");
        CFDictionarySetValue(*v11, @"UserDirected", v16);
      }
      v10[12] = -1;
      return v10;
    }
    CFRelease(v10);
    return 0;
  }
  return v10;
}

BOOL WiFiNetworkIsSSIDLengthValid(const __CFString *a1)
{
  if (!a1) {
    return 1;
  }
  if (CFEqual(a1, @"_AppleWi-FiInternetTetheringSSID_")) {
    return 1;
  }
  return CFStringGetLength(a1) < 33;
}

uint64_t wifi_device_copy_current_network(int a1, uint64_t a2, int a3, void *a4, _DWORD *a5)
{
  *(void *)&long long v8 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v8 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(void *)&rcv_name[16] = 0x1AAAAAAAALL;
  *(_DWORD *)int v19 = -1431655766;
  *(_OWORD *)&v19[4] = v8;
  *(_OWORD *)int rcv_name = v8;
  uint64_t v16 = a2;
  int v17 = 27918592;
  int v18 = a3;
  *(void *)int v19 = *MEMORY[0x1E4F14068];
  *(_DWORD *)&v19[8] = a3;
  mach_port_name_t special_reply_port = mig_get_special_reply_port();
  *(_DWORD *)&rcv_name[4] = a1;
  *(_DWORD *)&rcv_name[8] = special_reply_port;
  int v14 = -2147478253;
  *(void *)&rcv_name[12] = 0x1107000000000;
  if (MEMORY[0x1E4F14B18])
  {
    voucher_mach_msg_set((mach_msg_header_t *)&v14);
    mach_port_name_t special_reply_port = *(_DWORD *)&rcv_name[8];
  }
  uint64_t v10 = mach_msg((mach_msg_header_t *)&v14, 3162115, 0x38u, 0x40u, special_reply_port, 0, 0);
  uint64_t v11 = v10;
  if ((v10 - 268435458) > 0xE || ((1 << (v10 - 2)) & 0x4003) == 0)
  {
    if (!v10)
    {
      if (*(_DWORD *)&rcv_name[16] == 71)
      {
        uint64_t v11 = 4294966988;
      }
      else if (*(_DWORD *)&rcv_name[16] == 69844)
      {
        if ((v14 & 0x80000000) == 0)
        {
          if (*(_DWORD *)rcv_name == 36)
          {
            uint64_t v11 = 4294966996;
            if (HIDWORD(v16))
            {
              if (*(_DWORD *)&rcv_name[4]) {
                uint64_t v11 = 4294966996;
              }
              else {
                uint64_t v11 = HIDWORD(v16);
              }
            }
          }
          else
          {
            uint64_t v11 = 4294966996;
          }
          goto LABEL_24;
        }
        uint64_t v11 = 4294966996;
        if (*(_DWORD *)&rcv_name[20] == 1 && *(_DWORD *)rcv_name == 56 && !*(_DWORD *)&rcv_name[4] && HIBYTE(v17) == 1)
        {
          int v12 = v18;
          if (v18 == *(_DWORD *)&v19[8])
          {
            uint64_t v11 = 0;
            *a4 = v16;
            *a5 = v12;
            return v11;
          }
        }
      }
      else
      {
        uint64_t v11 = 4294966995;
      }
LABEL_24:
      mach_msg_destroy((mach_msg_header_t *)&v14);
      return v11;
    }
    mig_dealloc_special_reply_port();
  }
  return v11;
}

void _WiFiDeviceClientDispatchCatsUpdateEvent(uint64_t a1, uint64_t a2)
{
  CFAllocatorRef v2 = *(void (**)(uint64_t, uint64_t, uint64_t))(a1 + 352);
  if (v2)
  {
    uint64_t v3 = *(void *)(a1 + 360);
    v2(a1, a2, v3);
  }
  else
  {
    CFDataRef v4 = (void *)MEMORY[0x1C18A51F0]();
  }
}

uint64_t _Xwifi_manager_client_dispatch_scan_results(uint64_t result, uint64_t a2)
{
  if ((*(_DWORD *)result & 0x80000000) != 0 && *(_DWORD *)(result + 24) == 2 && *(_DWORD *)(result + 4) == 80)
  {
    if (*(unsigned char *)(result + 39) == 1 && *(unsigned char *)(result + 55) == 1)
    {
      unsigned int v3 = *(_DWORD *)(result + 40);
      if (v3 == *(_DWORD *)(result + 68))
      {
        unsigned int v4 = *(_DWORD *)(result + 56);
        if (v4 == *(_DWORD *)(result + 72))
        {
          uint64_t result = _wifi_manager_client_dispatch_scan_results(*(_DWORD *)(result + 12), *(UInt8 **)(result + 28), v3, *(UInt8 **)(result + 44), v4, *(unsigned int *)(result + 76));
          *(_DWORD *)(a2 + 32) = result;
          return result;
        }
      }
    }
    int v5 = -300;
  }
  else
  {
    int v5 = -304;
  }
  *(_DWORD *)(a2 + 32) = v5;
  *(void *)(a2 + 24) = *MEMORY[0x1E4F14068];
  return result;
}

uint64_t _wifi_manager_client_dispatch_scan_results(unsigned int a1, UInt8 *a2, unsigned int a3, UInt8 *a4, unsigned int a5, uint64_t a6)
{
  uint64_t v11 = WiFiPortCacheCopy(a1);
  if (v11)
  {
    int v12 = v11;
    CFPropertyListRef v13 = _WiFiCopyUnserialized(a2, a3);
    if (v13)
    {
      int v14 = v13;
      Device = WiFiManagerClientGetDevice((uint64_t)v12, v13);
      if (Device)
      {
        uint64_t v16 = (uint64_t)Device;
        CFArrayRef v17 = (const __CFArray *)_WiFiCopyUnserialized(a4, a5);
        if (v17)
        {
          CFArrayRef v18 = v17;
          CFTypeID v19 = CFGetTypeID(v17);
          if (v19 == CFArrayGetTypeID())
          {
            NetworksFromRecords = _WiFiCreateNetworksFromRecords(v18);
            _WiFiDeviceClientDispatchScanResults(v16, (uint64_t)NetworksFromRecords, a6);
            if (NetworksFromRecords) {
              CFRelease(NetworksFromRecords);
            }
          }
          else
          {
            _WiFiDeviceClientDispatchScanResults(v16, 0, a6);
          }
          CFRelease(v18);
        }
        else
        {
          _WiFiDeviceClientDispatchScanResults(v16, 0, a6);
        }
      }
      CFRelease(v14);
    }
    CFRelease(v12);
  }
  _WiFiVMDealloc((uint64_t)a2, a3);
  _WiFiVMDealloc((uint64_t)a4, a5);
  return 0;
}

uint64_t _WiFiDeviceClientDispatchScanResults(uint64_t result, uint64_t a2, uint64_t a3)
{
  unsigned int v3 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, void))(result + 160);
  if (v3) {
    return v3(result, a2, a3, *(void *)(result + 168));
  }
  return result;
}

__CFArray *_WiFiCreateNetworksFromRecordsWithRSSIBounds(const __CFArray *a1, int a2, int a3)
{
  uint64_t v6 = *MEMORY[0x1E4F1CF80];
  CFMutableArrayRef Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, MEMORY[0x1E4F1D510]);
  long long v8 = Mutable;
  if (a1)
  {
    if (Mutable)
    {
      CFIndex Count = CFArrayGetCount(a1);
      if (Count >= 1)
      {
        CFIndex v10 = Count;
        for (CFIndex i = 0; i != v10; ++i)
        {
          CFDictionaryRef ValueAtIndex = CFArrayGetValueAtIndex(a1, i);
          if (ValueAtIndex)
          {
            CFPropertyListRef v13 = WiFiNetworkCreate(v6, ValueAtIndex);
            if (v13)
            {
              int v14 = v13;
              if (a2 != a3)
              {
                float v15 = (float)(int)WiFiNetworkGetIntProperty((uint64_t)v13, @"RSSI") + 77.5;
                float v16 = fabsf(sqrtf((float)(v15 * v15) + 450.0));
                double v17 = (float)((float)(v15 / (float)(v16 + v16)) + 0.5);
                WiFiNetworkSetFloatProperty((uint64_t)v14, @"ScaledRSSI", v17);
                WiFiNetworkSetFloatProperty((uint64_t)v14, @"ScaledRate", 1.0);
                WiFiNetworkSetFloatProperty((uint64_t)v14, @"Strength", v17);
              }
              CFArrayAppendValue(v8, v14);
              CFRelease(v14);
            }
          }
        }
      }
    }
  }
  return v8;
}

__CFArray *_WiFiCreateNetworksFromRecords(const __CFArray *a1)
{
  return _WiFiCreateNetworksFromRecordsWithRSSIBounds(a1, 0, 0);
}

uint64_t _WiFiDeviceClientDispatchWeightAvgLQMEvent(uint64_t result, uint64_t a2)
{
  CFAllocatorRef v2 = *(uint64_t (**)(uint64_t, uint64_t, void))(result + 320);
  if (v2) {
    return v2(result, a2, *(void *)(result + 328));
  }
  return result;
}

uint64_t WiFiDeviceClientGetInterfaceName(uint64_t a1)
{
  return *(void *)(a1 + 24);
}

uint64_t WiFiDeviceClientRegisterLQMCallback(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)(a1 + 304) = a2;
  *(void *)(a1 + 312) = a3;
  *(void *)(a1 + 64) = *(void *)(a1 + 64) & 0xFFFFFFFFFFFFBFFFLL | ((unint64_t)(a2 != 0) << 14);
  return _WiFiDeviceClientSendEventMaskToServer(a1);
}

void WiFiManagerClientRegisterDeviceAttachmentCallback(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)(a1 + 128) = a2;
  *(void *)(a1 + 136) = a3;
  if (a2) {
    __WiFiManagerClientOrEventMask(a1, 4);
  }
  else {
    __WiFiManagerClientAndEventMask(a1, -5);
  }
}

uint64_t WiFiNetworkGetTypeID()
{
  uint64_t result = __kWiFiNetworkTypeID;
  if (!__kWiFiNetworkTypeID)
  {
    pthread_once(&__wifiNetworkTypeInit, (void (*)(void))__WiFiNetworkRegister);
    return __kWiFiNetworkTypeID;
  }
  return result;
}

uint64_t WiFiDeviceClientRegisterBssidChangeCallback(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)(a1 + 272) = a2;
  *(void *)(a1 + 280) = a3;
  *(void *)(a1 + 64) = *(void *)(a1 + 64) & 0xFFFFFFFFFFFFFBFFLL | ((unint64_t)(a2 != 0) << 10);
  return _WiFiDeviceClientSendEventMaskToServer(a1);
}

void WiFiManagerClientRegisterNotificationCallback(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)(a1 + 112) = a2;
  *(void *)(a1 + 120) = a3;
  if (a2) {
    __WiFiManagerClientOrEventMask(a1, 32);
  }
  else {
    __WiFiManagerClientAndEventMask(a1, -33);
  }
}

void WiFiManagerClientRegisterManagedAppleIDStateChangedCallback(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)(a1 + 304) = a2;
  *(void *)(a1 + 312) = a3;
  if (a2) {
    __WiFiManagerClientOrEventMask(a1, 0x100000000);
  }
  else {
    __WiFiManagerClientAndEventMask(a1, 0xFFFFFFFEFFFFFFFFLL);
  }
}

void *WiFiManagerClientRegisterServerRestartCallback(void *result, uint64_t a2, uint64_t a3)
{
  result[28] = a2;
  result[29] = a3;
  result[9] = result[9] & 0xFFFFFFFFFFFEFFFFLL | ((unint64_t)(a2 != 0) << 16);
  return result;
}

uint64_t WiFiDeviceClientRegisterHostApStateChangedCallback(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)(a1 + 496) = a2;
  *(void *)(a1 + 504) = a3;
  *(void *)(a1 + 64) = *(void *)(a1 + 64) & 0xFFFFFFFFFFF7FFFFLL | ((unint64_t)(a2 != 0) << 19);
  return _WiFiDeviceClientSendEventMaskToServer(a1);
}

uint64_t WiFiDeviceClientRegisterCarPlayNetworkTypeChangeCallback(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)(a1 + 416) = a2;
  *(void *)(a1 + 424) = a3;
  *(void *)(a1 + 64) = *(void *)(a1 + 64) & 0xFFFFFFDFFFFFFFFFLL | ((unint64_t)(a2 != 0) << 37);
  return _WiFiDeviceClientSendEventMaskToServer(a1);
}

uint64_t WiFiDeviceClientRegisterPowerCallback(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)(a1 + 144) = a2;
  *(void *)(a1 + 152) = a3;
  *(void *)(a1 + 64) = *(void *)(a1 + 64) & 0xFFFFFFFFFFFFFFFELL | (a2 != 0);
  return _WiFiDeviceClientSendEventMaskToServer(a1);
}

uint64_t __WiFiManagerClientRegister()
{
  uint64_t result = _CFRuntimeRegisterClass();
  __wiFiManagerCFTypeID TypeID = result;
  return result;
}

uint64_t __WiFiDeviceClientRegister()
{
  uint64_t result = _CFRuntimeRegisterClass();
  __wiFiDeviceCFTypeID TypeID = result;
  return result;
}

uint64_t WiFiNetworkIsApplePersonalHotspot(uint64_t a1)
{
  if (!a1) {
    goto LABEL_20;
  }
  CFAllocatorRef v2 = *(const void **)(a1 + 16);
  if (!v2) {
    goto LABEL_20;
  }
  CFTypeID v3 = CFGetTypeID(v2);
  if (v3 != CFDictionaryGetTypeID()) {
    goto LABEL_20;
  }
  CFStringRef Value = CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 16), @"IsPersonalHotspot");
  if (Value && CFEqual(Value, (CFTypeRef)*MEMORY[0x1E4F1CFD0])) {
    return 1;
  }
  uint64_t result = (uint64_t)CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 16), @"IE");
  if (result)
  {
    CFDataRef v6 = (const __CFData *)result;
    CFTypeID v7 = CFGetTypeID((CFTypeRef)result);
    if (v7 == CFDataGetTypeID())
    {
      uint64_t result = (uint64_t)CFDataGetBytePtr(v6);
      if (!result) {
        return result;
      }
      long long v8 = (unsigned __int8 *)result;
      CFIndex Length = CFDataGetLength(v6);
      if (Length << 32 >= 1)
      {
        uint64_t v10 = 0;
        while (*v8 != 221 || v8[1] != 10 || *(_DWORD *)(v8 + 2) != 116528896 || *(_DWORD *)(v8 + 5) != 50397446)
        {
          uint64_t v12 = v8[1] + 2;
          v10 += v12;
          v8 += v12;
          if (v10 >= (int)Length) {
            return 0;
          }
        }
        return 1;
      }
      return 0;
    }
LABEL_20:
    return 0;
  }
  return result;
}

CFMutableDictionaryRef __WiFiMIGMachPortRegister()
{
  __WiFiMIGMachPortCFTypeID TypeID = _CFRuntimeRegisterClass();
  CFMutableDictionaryRef result = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, 0, 0);
  __wifiPortCache = (uint64_t)result;
  return result;
}

BOOL MobileWiFiContainsRadio()
{
  mach_port_t v0 = *MEMORY[0x1E4F2EF00];
  CFDictionaryRef v1 = IOServiceMatching("IOPlatformExpertDevice");
  io_service_t MatchingService = IOServiceGetMatchingService(v0, v1);
  if (MatchingService)
  {
    io_object_t v3 = MatchingService;
    CFAllocatorRef v4 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
    CFDataRef v5 = (const __CFData *)IORegistryEntrySearchCFProperty(MatchingService, "IODeviceTree", @"software-behavior", (CFAllocatorRef)*MEMORY[0x1E4F1CF80], 1u);
    if (v5)
    {
      CFDataRef v6 = v5;
      *(_DWORD *)buffer = -1431655766;
      v14.location = 0;
      v14.length = 4;
      CFDataGetBytes(v5, v14, buffer);
      UInt8 v7 = buffer[0];
      CFRelease(v6);
      if ((v7 & 0x20) != 0)
      {
        BOOL v8 = 0;
LABEL_10:
        IOObjectRelease(v3);
        goto LABEL_11;
      }
    }
    else
    {
      SCLog();
    }
    SCLog();
    CFDataRef v9 = (const __CFData *)IORegistryEntrySearchCFProperty(v3, "IODeviceTree", @"no-sdio-devices", v4, 1u);
    if (v9)
    {
      CFDataRef v10 = v9;
      *(_DWORD *)uint64_t v12 = -1431655766;
      v15.location = 0;
      v15.length = 4;
      CFDataGetBytes(v9, v15, v12);
      BOOL v8 = *(_DWORD *)v12 == 0;
      CFRelease(v10);
    }
    else
    {
      BOOL v8 = 1;
      SCLog();
    }
    goto LABEL_10;
  }
  BOOL v8 = 1;
  SCLog();
LABEL_11:
  SCLog();
  return v8;
}

uint64_t WiFiManagerClientIsPowerModificationDisabled(uint64_t a1)
{
  int v4 = 0;
  CFDictionaryRef v1 = __WiFiManagerClientGetOrReconnectServerPort(a1, 0);
  CFAllocatorRef v2 = (mach_port_name_t *)v1;
  if (v1) {
    wifi_manager_is_power_modification_disabled(v1[1], &v4);
  }
  WiFiSendRightRelease(v2);
  return v4;
}

uint64_t wifi_manager_is_power_modification_disabled(int a1, _DWORD *a2)
{
  *(void *)&long long v4 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v4 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)&rcv_name_12[16] = v4;
  *(_OWORD *)&rcv_name_12[4] = v4;
  int rcv_name = -1431655766;
  mach_port_name_t special_reply_port = mig_get_special_reply_port();
  int rcv_name_4 = a1;
  mach_port_name_t rcv_name_8 = special_reply_port;
  int v10 = 5395;
  *(void *)rcv_name_12 = 0x110B700000000;
  if (MEMORY[0x1E4F14B18])
  {
    voucher_mach_msg_set((mach_msg_header_t *)&v10);
    mach_port_name_t special_reply_port = rcv_name_8;
  }
  uint64_t v6 = mach_msg((mach_msg_header_t *)&v10, 3162115, 0x18u, 0x30u, special_reply_port, 0, 0);
  uint64_t v7 = v6;
  if ((v6 - 268435458) > 0xE || ((1 << (v6 - 2)) & 0x4003) == 0)
  {
    if (!v6)
    {
      if (*(_DWORD *)&rcv_name_12[4] == 71)
      {
        uint64_t v7 = 4294966988;
      }
      else if (*(_DWORD *)&rcv_name_12[4] == 69915)
      {
        if ((v10 & 0x80000000) == 0)
        {
          if (rcv_name == 40)
          {
            if (!rcv_name_4)
            {
              uint64_t v7 = *(unsigned int *)&rcv_name_12[16];
              if (!*(_DWORD *)&rcv_name_12[16])
              {
                *a2 = *(_DWORD *)&rcv_name_12[20];
                return v7;
              }
              goto LABEL_22;
            }
          }
          else if (rcv_name == 36)
          {
            if (rcv_name_4) {
              BOOL v8 = 1;
            }
            else {
              BOOL v8 = *(_DWORD *)&rcv_name_12[16] == 0;
            }
            if (v8) {
              uint64_t v7 = 4294966996;
            }
            else {
              uint64_t v7 = *(unsigned int *)&rcv_name_12[16];
            }
            goto LABEL_22;
          }
        }
        uint64_t v7 = 4294966996;
      }
      else
      {
        uint64_t v7 = 4294966995;
      }
LABEL_22:
      mach_msg_destroy((mach_msg_header_t *)&v10);
      return v7;
    }
    mig_dealloc_special_reply_port();
  }
  return v7;
}

BOOL WiFiDeviceClientGetPower(uint64_t a1)
{
  int v6 = 0;
  mach_port_t v2 = *(_DWORD *)(a1 + 16);
  BytePtr = CFDataGetBytePtr(*(CFDataRef *)(a1 + 48));
  int Length = CFDataGetLength(*(CFDataRef *)(a1 + 48));
  wifi_device_get_power(v2, (uint64_t)BytePtr, Length, &v6);
  return v6 == 1;
}

uint64_t wifi_device_get_power(mach_port_t a1, uint64_t a2, int a3, int *a4)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  int v12 = 1;
  uint64_t v13 = a2;
  int v14 = 27918592;
  int v15 = a3;
  uint64_t v16 = *MEMORY[0x1E4F14068];
  int v17 = a3;
  mach_port_t special_reply_port = mig_get_special_reply_port();
  *(void *)&v11.msgh_bits = 0xAAAAAAAA80001513;
  v11.mach_port_t msgh_remote_port = a1;
  v11.msgh_local_port = special_reply_port;
  *(void *)&v11.msgh_voucher_port = 0x1106E00000000;
  if (MEMORY[0x1E4F14B18])
  {
    voucher_mach_msg_set(&v11);
    mach_port_t special_reply_port = v11.msgh_local_port;
  }
  uint64_t v7 = mach_msg(&v11, 3162115, 0x38u, 0x30u, special_reply_port, 0, 0);
  uint64_t v8 = v7;
  if ((v7 - 268435458) > 0xE || ((1 << (v7 - 2)) & 0x4003) == 0)
  {
    if (!v7)
    {
      if (v11.msgh_id == 71)
      {
        uint64_t v8 = 4294966988;
      }
      else if (v11.msgh_id == 69842)
      {
        if ((v11.msgh_bits & 0x80000000) == 0)
        {
          if (v11.msgh_size == 40)
          {
            if (!v11.msgh_remote_port)
            {
              uint64_t v8 = HIDWORD(v13);
              if (!HIDWORD(v13))
              {
                *a4 = v14;
                return v8;
              }
              goto LABEL_22;
            }
          }
          else if (v11.msgh_size == 36)
          {
            if (v11.msgh_remote_port) {
              BOOL v9 = 1;
            }
            else {
              BOOL v9 = HIDWORD(v13) == 0;
            }
            if (v9) {
              uint64_t v8 = 4294966996;
            }
            else {
              uint64_t v8 = HIDWORD(v13);
            }
            goto LABEL_22;
          }
        }
        uint64_t v8 = 4294966996;
      }
      else
      {
        uint64_t v8 = 4294966995;
      }
LABEL_22:
      mach_msg_destroy(&v11);
      return v8;
    }
    mig_dealloc_special_reply_port();
  }
  return v8;
}

uint64_t WiFiPolicyGetTypeID()
{
  uint64_t result = __kWiFiPolicyTypeID;
  if (!__kWiFiPolicyTypeID)
  {
    pthread_once(&__gWiFiPolicyTypeInit, (void (*)(void))__WiFiPolicyRegister);
    return __kWiFiPolicyTypeID;
  }
  return result;
}

uint64_t __WiFiPolicyRegister()
{
  uint64_t result = _CFRuntimeRegisterClass();
  __kWiFiPolicyCFTypeID TypeID = result;
  return result;
}

void *WiFiPolicyCreate(const __CFAllocator *a1, CFDictionaryRef theDict)
{
  if (theDict)
  {
    CFStringRef Value = CFDictionaryGetValue(theDict, @"PolicyType");
    if (Value)
    {
      CFDataRef v5 = Value;
      CFTypeID TypeID = CFNumberGetTypeID();
      if (TypeID != CFGetTypeID(v5)) {
        return 0;
      }
    }
  }
  if (!__kWiFiPolicyTypeID) {
    pthread_once(&__gWiFiPolicyTypeInit, (void (*)(void))__WiFiPolicyRegister);
  }
  uint64_t Instance = _CFRuntimeCreateInstance();
  uint64_t v8 = (void *)Instance;
  if (Instance)
  {
    *(void *)(Instance + 16) = 0;
    CFMutableDictionaryRef v9 = theDict
       ? CFDictionaryCreateMutableCopy(a1, 0, theDict)
       : CFDictionaryCreateMutable(a1, 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
    v8[2] = v9;
    if (!v9)
    {
      CFRelease(v8);
      return 0;
    }
  }
  return v8;
}

void *WiFiPolicyCreateExtended(const __CFAllocator *a1, const void *a2, const void *a3, const void *a4)
{
  if (!a2) {
    return 0;
  }
  CFMutableArrayRef Mutable = CFDictionaryCreateMutable(a1, 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
  if (!Mutable) {
    return 0;
  }
  CFMutableDictionaryRef v9 = Mutable;
  CFDictionaryAddValue(Mutable, @"PolicyType", a2);
  if (a3)
  {
    CFDictionaryAddValue(v9, @"PolicyUUID", a3);
    CFUUIDRef v10 = 0;
    CFStringRef v11 = 0;
    if (!a4)
    {
LABEL_6:
      int v12 = WiFiPolicyCreate(a1, v9);
      if (v11) {
        CFRelease(v11);
      }
      if (v10) {
        CFRelease(v10);
      }
      goto LABEL_10;
    }
LABEL_5:
    CFDictionaryAddValue(v9, @"PolicyProperties", a4);
    goto LABEL_6;
  }
  CFUUIDRef v14 = CFUUIDCreate(a1);
  if (v14)
  {
    CFUUIDRef v10 = v14;
    CFStringRef v11 = CFUUIDCreateString(a1, v14);
    CFDictionaryAddValue(v9, @"PolicyUUID", v11);
    if (!a4) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
  int v12 = 0;
LABEL_10:
  CFRelease(v9);
  return v12;
}

void WiFiPolicySetUUID(uint64_t a1, void *value)
{
  if (a1)
  {
    if (value) {
      CFDictionarySetValue(*(CFMutableDictionaryRef *)(a1 + 16), @"PolicyUUID", value);
    }
  }
}

const void *WiFiPolicyGetUUID(uint64_t a1)
{
  return CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 16), @"PolicyUUID");
}

void WiFiPolicySetType(uint64_t a1, int a2)
{
  int valuePtr = a2;
  CFNumberRef v3 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], kCFNumberIntType, &valuePtr);
  if (v3)
  {
    CFNumberRef v4 = v3;
    CFDictionarySetValue(*(CFMutableDictionaryRef *)(a1 + 16), @"PolicyType", v3);
    CFRelease(v4);
  }
}

uint64_t WiFiPolicyGetType(uint64_t a1)
{
  uint64_t v1 = 0xFFFFFFFFLL;
  unsigned int valuePtr = -1;
  CFNumberRef Value = (const __CFNumber *)CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 16), @"PolicyType");
  if (Value)
  {
    CFNumberGetValue(Value, kCFNumberIntType, &valuePtr);
    return valuePtr;
  }
  return v1;
}

void WiFiPolicySetProperty(uint64_t a1, const void *a2, const void *a3)
{
  CFNumberRef Value = (__CFDictionary *)CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 16), @"PolicyProperties");
  if (Value)
  {
    if (a3)
    {
      CFDictionarySetValue(Value, a2, a3);
    }
    else
    {
      CFDictionaryRemoveValue(Value, a2);
    }
  }
}

CFDictionaryRef WiFiPolicyGetProperty(uint64_t a1, const void *a2)
{
  CFDictionaryRef result = (const __CFDictionary *)CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 16), @"PolicyProperties");
  if (result)
  {
    return (const __CFDictionary *)CFDictionaryGetValue(result, a2);
  }
  return result;
}

CFDictionaryRef WiFiPolicyCopyRecord(uint64_t a1)
{
  return CFDictionaryCreateCopy((CFAllocatorRef)*MEMORY[0x1E4F1CF80], *(CFDictionaryRef *)(a1 + 16));
}

__CFArray *WiFiCreatePoliciesFromRecords(const __CFArray *a1)
{
  CFAllocatorRef v2 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  CFMutableArrayRef Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, MEMORY[0x1E4F1D510]);
  CFNumberRef v4 = Mutable;
  if (a1)
  {
    if (Mutable)
    {
      CFIndex Count = CFArrayGetCount(a1);
      if (Count >= 1)
      {
        CFIndex v6 = Count;
        for (CFIndex i = 0; i != v6; ++i)
        {
          CFDictionaryRef ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(a1, i);
          if (ValueAtIndex)
          {
            CFMutableDictionaryRef v9 = WiFiPolicyCreate(v2, ValueAtIndex);
            if (v9)
            {
              CFUUIDRef v10 = v9;
              CFArrayAppendValue(v4, v9);
              CFRelease(v10);
            }
          }
        }
      }
    }
  }
  return v4;
}

__CFArray *WiFiCreateRecordsFromPolicies(const __CFArray *a1)
{
  CFAllocatorRef v2 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  CFMutableArrayRef Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, MEMORY[0x1E4F1D510]);
  CFNumberRef v4 = Mutable;
  if (a1)
  {
    if (Mutable)
    {
      CFIndex Count = CFArrayGetCount(a1);
      if (Count >= 1)
      {
        CFIndex v6 = Count;
        for (CFIndex i = 0; i != v6; ++i)
        {
          CFDictionaryRef ValueAtIndex = (CFDictionaryRef *)CFArrayGetValueAtIndex(a1, i);
          if (ValueAtIndex)
          {
            CFDictionaryRef Copy = CFDictionaryCreateCopy(v2, ValueAtIndex[2]);
            if (Copy)
            {
              CFDictionaryRef v10 = Copy;
              CFArrayAppendValue(v4, Copy);
              CFRelease(v10);
            }
          }
        }
      }
    }
  }
  return v4;
}

void __WiFiPolicyRelease(void *a1)
{
  if (!a1) {
    __WiFiPolicyRelease_cold_1();
  }
  CFTypeID v2 = CFGetTypeID(a1);
  uint64_t v3 = __kWiFiPolicyTypeID;
  if (!__kWiFiPolicyTypeID)
  {
    pthread_once(&__gWiFiPolicyTypeInit, (void (*)(void))__WiFiPolicyRegister);
    uint64_t v3 = __kWiFiPolicyTypeID;
  }
  if (v2 != v3) {
    __WiFiPolicyRelease_cold_2();
  }
  CFNumberRef v4 = (const void *)a1[2];
  if (v4)
  {
    CFRelease(v4);
    a1[2] = 0;
  }
}

BOOL __WiFiPolicyEqual(uint64_t a1, uint64_t a2)
{
  CFStringRef Value = (const __CFString *)CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 16), @"PolicyUUID");
  CFStringRef v4 = (const __CFString *)CFDictionaryGetValue(*(CFDictionaryRef *)(a2 + 16), @"PolicyUUID");
  if (Value) {
    BOOL v5 = v4 == 0;
  }
  else {
    BOOL v5 = 1;
  }
  return !v5 && CFEqual(Value, v4);
}

CFStringRef __WiFiPolicyCopyFormattingDesc(uint64_t a1, const __CFDictionary *a2)
{
  CFAllocatorRef v4 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  uint64_t Type = WiFiPolicyGetType(a1);
  CFStringRef Value = CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 16), @"PolicyUUID");
  return CFStringCreateWithFormat(v4, a2, @"%d %@", Type, Value);
}

CFStringRef __WiFiPolicyCopyDebugDesc(uint64_t a1)
{
  CFAllocatorRef v2 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  uint64_t Type = WiFiPolicyGetType(a1);
  CFStringRef Value = CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 16), @"PolicyUUID");
  return CFStringCreateWithFormat(v2, 0, @"%d %@", Type, Value);
}

uint64_t _WiFiPreferenceLockSetDispatchQueue(uint64_t result)
{
  _queue = result;
  return result;
}

const __SCPreferences *_WiFiPreferencesLock(const __SCPreferences *prefs)
{
  if (prefs)
  {
    uint64_t v1 = prefs;
    if (_queue) {
      dispatch_assert_queue_V2((dispatch_queue_t)_queue);
    }
    prefs = (const __SCPreferences *)SCPreferencesLock(v1, 1u);
    if (!prefs)
    {
      SCPreferencesSynchronize(v1);
      prefs = (const __SCPreferences *)SCPreferencesLock(v1, 1u);
      if (!prefs)
      {
        int v2 = SCError();
        uint64_t v3 = SCErrorString(v2);
        return 0;
      }
    }
  }
  return prefs;
}

uint64_t _WiFiPreferencesUnlock(SCPreferencesRef prefs, int a2)
{
  if (_queue) {
    dispatch_assert_queue_V2((dispatch_queue_t)_queue);
  }
  if (a2 && (!SCPreferencesCommitChanges(prefs) || !SCPreferencesApplyChanges(prefs)))
  {
    int v4 = SCError();
    BOOL v5 = SCErrorString(v4);
  }
  uint64_t v6 = SCPreferencesUnlock(prefs);
  if (!v6)
  {
    int v7 = SCError();
    uint64_t v8 = SCErrorString(v7);
  }
  return v6;
}

__CFArray *_WiFiCreateRecordsFromNetworks(const __CFArray *a1)
{
  return _WiFiCreateRecordsFromNetworksWithType(a1, 0);
}

__CFArray *_WiFiCreateRecordsFromNetworksWithType(const __CFArray *a1, int a2)
{
  CFMutableArrayRef Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, MEMORY[0x1E4F1D510]);
  BOOL v5 = Mutable;
  if (a1)
  {
    if (Mutable)
    {
      CFIndex Count = CFArrayGetCount(a1);
      if (Count >= 1)
      {
        CFIndex v7 = Count;
        for (CFIndex i = 0; v7 != i; ++i)
        {
          CFDictionaryRef ValueAtIndex = CFArrayGetValueAtIndex(a1, i);
          if (ValueAtIndex)
          {
            if (a2 == 1)
            {
              CFDictionaryRef v10 = WiFiNetworkCopyFilteredRecord((uint64_t)ValueAtIndex);
LABEL_10:
              CFDictionaryRef v11 = v10;
              if (v10)
              {
                CFArrayAppendValue(v5, v10);
                CFRelease(v11);
              }
              continue;
            }
            if (!a2)
            {
              CFDictionaryRef v10 = WiFiNetworkCopyRecord((uint64_t)ValueAtIndex);
              goto LABEL_10;
            }
          }
        }
      }
    }
  }
  return v5;
}

float _WiFiScaleRSSI(int a1)
{
  float v1 = (float)a1 + 77.5;
  float v2 = fabsf(sqrtf((float)(v1 * v1) + 450.0));
  return (float)(v1 / (float)(v2 + v2)) + 0.5;
}

__CFArray *_WiFiCopyEnabledNetworks(const __CFArray *a1)
{
  if (!a1) {
    return 0;
  }
  CFMutableArrayRef Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, MEMORY[0x1E4F1D510]);
  if (Mutable)
  {
    CFIndex Count = CFArrayGetCount(a1);
    if (Count >= 1)
    {
      CFIndex v4 = Count;
      for (CFIndex i = 0; i != v4; ++i)
      {
        CFDictionaryRef ValueAtIndex = CFArrayGetValueAtIndex(a1, i);
        if (ValueAtIndex)
        {
          CFIndex v7 = ValueAtIndex;
          if (WiFiNetworkIsEnabled((uint64_t)ValueAtIndex)) {
            CFArrayAppendValue(Mutable, v7);
          }
        }
      }
    }
    if (!CFArrayGetCount(Mutable))
    {
      CFRelease(Mutable);
      return 0;
    }
  }
  return Mutable;
}

void _WiFiSerialize(const void *a1, vm_offset_t *a2, mach_msg_type_number_t *a3)
{
  kern_return_t v9;
  mach_msg_type_number_t dataCnt;

  CFDataRef BinaryData = (const __CFData *)_CFPropertyListCreateBinaryData((CFAllocatorRef)*MEMORY[0x1E4F1CF80], a1);
  if (BinaryData)
  {
    CFDataRef v6 = BinaryData;
    dataCnt = -1431655766;
    *a3 = CFDataGetLength(BinaryData);
    vm_map_read_t v7 = *MEMORY[0x1E4F14960];
    BytePtr = CFDataGetBytePtr(v6);
    CFMutableDictionaryRef v9 = vm_read(v7, (vm_address_t)BytePtr, *a3, a2, &dataCnt);
    CFRelease(v6);
    if (v9) {
      *a2 = 0;
    }
    *a3 = dataCnt;
  }
}

CFMutableArrayRef _CFArrayCreateMutableCopyOfCFDictionary(const __CFDictionary *a1)
{
  CFMutableArrayRef Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, MEMORY[0x1E4F1D510]);
  if (Mutable) {
    CFDictionaryApplyFunction(a1, (CFDictionaryApplierFunction)__CFArrayCreateMutableCopyOfCFDictionaryApplier, Mutable);
  }
  return Mutable;
}

void __CFArrayCreateMutableCopyOfCFDictionaryApplier(int a1, const void *a2, CFMutableArrayRef theArray)
{
}

CFMutableArrayRef _CFArrayCreateMutableCopyOfCFSet(const __CFSet *a1)
{
  CFMutableArrayRef Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, MEMORY[0x1E4F1D510]);
  if (Mutable) {
    CFSetApplyFunction(a1, (CFSetApplierFunction)__CFArrayCreateMutableCopyOfCFSetApplier, Mutable);
  }
  return Mutable;
}

void __CFArrayCreateMutableCopyOfCFSetApplier(void *value, CFMutableArrayRef theArray)
{
}

CFMutableSetRef _CFSetCreateMutableCopyOfCFArray(const __CFArray *a1)
{
  CFMutableSetRef Mutable = CFSetCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, MEMORY[0x1E4F1D548]);
  if (Mutable)
  {
    v4.length = CFArrayGetCount(a1);
    v4.location = 0;
    CFArrayApplyFunction(a1, v4, (CFArrayApplierFunction)__CFSetCreateMutableCopyOfCFArrayApplier, Mutable);
  }
  return Mutable;
}

void __CFSetCreateMutableCopyOfCFArrayApplier(void *value, CFMutableSetRef theSet)
{
}

float _WiFiScale(uint64_t a1, uint64_t a2, uint64_t a3)
{
  float result = (float)(a1 - a2) / (float)(a3 - a2);
  if (result > 1.0) {
    float result = 1.0;
  }
  if (result < 0.0) {
    return 0.0;
  }
  return result;
}

double _CFTypeGetFloatValue(const void *a1)
{
  double valuePtr = 0.0;
  double v1 = 0.0;
  if (a1)
  {
    CFTypeID v3 = CFGetTypeID(a1);
    if (v3 == CFNumberGetTypeID())
    {
      CFNumberGetValue((CFNumberRef)a1, kCFNumberDoubleType, &valuePtr);
      return valuePtr;
    }
  }
  return v1;
}

void _CFDictionarySetIntValue(__CFDictionary *a1, const void *a2, uint64_t a3)
{
  uint64_t valuePtr = a3;
  CFNumberRef v5 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], kCFNumberCFIndexType, &valuePtr);
  if (v5)
  {
    CFNumberRef v6 = v5;
    CFDictionarySetValue(a1, a2, v5);
    CFRelease(v6);
  }
}

void _CFDictinoarySetFloatValue(__CFDictionary *a1, const void *a2, double a3)
{
  double valuePtr = a3;
  CFNumberRef v5 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], kCFNumberDoubleType, &valuePtr);
  if (v5)
  {
    CFNumberRef v6 = v5;
    CFDictionarySetValue(a1, a2, v5);
    CFRelease(v6);
  }
}

BOOL _CFValidateType(uint64_t a1, CFTypeRef cf)
{
  return cf && CFGetTypeID(cf) == a1;
}

const char *powerStateToString(unsigned int a1)
{
  if (a1 > 4) {
    return "UNKNOWN";
  }
  else {
    return off_1E63F4080[a1];
  }
}

double getEpochTimeInMicroseconds()
{
  v1.tv_sec = 0xAAAAAAAAAAAAAAAALL;
  *(void *)&v1.tv_usec = 0xAAAAAAAAAAAAAAAALL;
  gettimeofday(&v1, 0);
  return (double)v1.tv_usec + (double)v1.tv_sec * 1000000.0;
}

uint64_t isAppleOUI(unsigned __int16 *a1)
{
  uint64_t v1 = 0;
  while (*(unsigned __int16 *)&byte_1BF219DA8[v1] != *a1 || byte_1BF219DA8[v1 + 2] != *((unsigned __int8 *)a1 + 2))
  {
    v1 += 3;
    if (v1 == 33) {
      return 0;
    }
  }
  return 1;
}

void *WiFiCopyTomorrowDateFromComponents(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8 = (void *)MEMORY[0x1C18A51F0]();
  id v9 = objc_alloc_init(MEMORY[0x1E4F28B28]);
  CFDictionaryRef v10 = objc_opt_new();
  [v10 setHour:a2];
  [v10 setMinute:a3];
  [v10 setSecond:a4];
  CFDictionaryRef v11 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F1C9A8], "currentCalendar"), "nextDateAfterDate:matchingComponents:options:", a1, v10, 1024);
  int v12 = v11;
  if (v11) {
    id v13 = v11;
  }

  [v9 drain];
  return v12;
}

void *_WiFiReallocArray(void *a1, unint64_t a2, unint64_t a3)
{
  if (is_mul_ok(a2, a3))
  {
    size_t v5 = a2 * a3;
    return malloc_type_realloc(a1, v5, 0x939E6BCFuLL);
  }
  else
  {
    *__error() = 12;
    return 0;
  }
}

uint64_t WiFiCreateOSTransactionWithFunctionName(uint64_t a1)
{
  float v2 = (void *)MEMORY[0x1C18A51F0]();
  objc_msgSend((id)objc_msgSend(NSString, "stringWithFormat:", @"com.apple.wifid.%s", a1), "UTF8String");
  uint64_t v3 = os_transaction_create();
  return v3;
}

__CFString *WiFiGetLinkChangeReasonString(int a1)
{
  switch(a1)
  {
    case 1000:
      float result = @"Trigger Disconnect";
      break;
    case 1001:
      float result = @"Client Disconnect";
      break;
    case 1002:
      float result = @"Temporarily Disabled";
      break;
    case 1003:
      float result = @"Network Changed";
      break;
    case 1004:
      float result = @"Decryption Failure";
      break;
    case 1005:
      float result = @"Not Primary Interface";
      break;
    case 1006:
      float result = @"CLTM";
      break;
    case 1007:
      float result = @"Internet Sharing";
      break;
    case 1008:
      float result = @"User Preference";
      break;
    case 1009:
      float result = @"Misc.";
      break;
    case 1010:
      float result = @"EAP Restart";
      break;
    case 1011:
      float result = @"Control Center/3rd Party Client";
      break;
    case 1012:
      float result = @"802.1X Failure";
      break;
    case 1013:
      float result = @"Network Transition";
      break;
    case 1014:
      float result = @"Auto Unlock";
      break;
    case 1015:
      float result = @"Captive";
      break;
    case 1016:
      float result = @"Banner Association";
      break;
    case 1017:
      float result = @"BSS Steering";
      break;
    case 1018:
      float result = @"Auto Hotspot Association";
      break;
    case 1019:
      float result = @"Auto Hotspot Transition";
      break;
    case 1020:
      float result = @"Perf Roam";
      break;
    case 1021:
      float result = @"CarPlay Disabled";
      break;
    case 1022:
      float result = @"Battery Save Mode Enabled";
      break;
    case 1023:
      float result = @"AirPlay Started";
      break;
    case 1024:
      float result = @"Prefer 6E Off";
      break;
    case 1025:
      float result = @"Prefer 6E On";
      break;
    default:
      int v2 = a1 - 1;
      float result = @"Deauth";
      switch(v2)
      {
        case 0:
          return result;
        case 1:
          float result = @"Beacon Lost";
          break;
        case 2:
          float result = @"Internal Error";
          break;
        case 3:
          float result = @"System Sleep";
          break;
        case 4:
          float result = @"Powered Off";
          break;
        case 5:
          float result = @"Join Failure";
          break;
        case 6:
          float result = @"Colocated scope transition";
          break;
        case 7:
          float result = @"Disassociate";
          break;
        case 8:
          float result = @"Invalid SSID";
          break;
        default:
          float result = @"Unknown";
          break;
      }
      break;
  }
  return result;
}

__CFString *WiFiGetConcurrencyStateString(unsigned int a1)
{
  if (a1 < 9 && ((0x117u >> a1) & 1) != 0) {
    return off_1E63F40A8[a1];
  }
  uint64_t v1 = @"Unknown";
  if ((~a1 & 3) == 0) {
    uint64_t v1 = @"STA + AWDL";
  }
  if ((~a1 & 5) == 0) {
    uint64_t v1 = @"STA + SoftAP";
  }
  if ((~a1 & 6) == 0) {
    uint64_t v1 = @"AWDL + SoftAP";
  }
  if ((~a1 & 7) == 0) {
    uint64_t v1 = @"STA + AWDL + SoftAP";
  }
  if ((~a1 & 0xC) == 0) {
    uint64_t v1 = @"SoftAp + NanPh";
  }
  if ((~a1 & 0xE) != 0) {
    return v1;
  }
  else {
    return @"AWDL + SoftAp + NanPh";
  }
}

__CFString *WiFiGetRoamEnvironmentTypeString(unsigned int a1)
{
  if (a1 > 6) {
    return @"Unknown";
  }
  else {
    return off_1E63F40F0[a1];
  }
}

__CFString *WiFiGetRoamProfileOffsetString(unsigned int a1)
{
  if (a1 > 3) {
    return @"Unknown";
  }
  else {
    return off_1E63F4128[a1];
  }
}

__CFString *WiFiGetNOIHomeStateString(int a1)
{
  uint64_t v1 = @"Unknown";
  if (a1 == 2) {
    uint64_t v1 = @"Not Home";
  }
  if (a1 == 1) {
    return @"Home";
  }
  else {
    return v1;
  }
}

__CFString *WiFiGetNOIWorkStateString(int a1)
{
  uint64_t v1 = @"Unknown";
  if (a1 == 2) {
    uint64_t v1 = @"Not Work";
  }
  if (a1 == 1) {
    return @"Work";
  }
  else {
    return v1;
  }
}

__CFString *WiFiGetLowDataModeString(unsigned int a1)
{
  if (a1 > 2) {
    return @"Unknown";
  }
  else {
    return off_1E63F4148[a1];
  }
}

__CFString *WiFiGetLOITypeString(int a1)
{
  if ((a1 - 1) > 4) {
    return @"Unknown";
  }
  else {
    return off_1E63F4160[a1 - 1];
  }
}

__CFString *WiFiGetAutoInstantHotspotModeString(unsigned int a1)
{
  if (a1 > 2) {
    return @"Unknown";
  }
  else {
    return off_1E63F4188[a1];
  }
}

__CFString *WiFiGetClientDisconnectReasonString(int a1)
{
  uint64_t v1 = @"Unknown";
  if (a1 == 2) {
    uint64_t v1 = @"Captive";
  }
  if (a1 == 1) {
    return @"Control Center";
  }
  else {
    return v1;
  }
}

__CFString *WiFiGetUINotificationTypeString(unsigned int a1)
{
  if (a1 > 0xD) {
    return @"Unknown";
  }
  else {
    return off_1E63F41A0[a1];
  }
}

BOOL WiFiGetRtTrafficType(const __CFString *a1)
{
  return CFStringFind(a1, @"facetime", 1uLL).length != 0;
}

__CFString *WiFiGetAssocTypeString(unsigned int a1)
{
  if (a1 > 2) {
    return @"Unknown";
  }
  else {
    return off_1E63F4210[a1];
  }
}

CFDataRef WiFiIsPrivateMacAddress(const __CFData *result)
{
  if (result)
  {
    CFDataRef v1 = result;
    CFTypeID TypeID = CFDataGetTypeID();
    if (TypeID == CFGetTypeID(v1)) {
      return (const __CFData *)((*CFDataGetBytePtr(v1) >> 1) & 1);
    }
    else {
      return 0;
    }
  }
  return result;
}

uint64_t WiFiIsInterfaceExpensive()
{
  return 0;
}

BOOL WiFiIsSystemWokenByWiFi()
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v6 = 0u;
  long long v7 = 0u;
  long long v4 = 0u;
  long long v5 = 0u;
  *(_OWORD *)__big = 0u;
  long long v3 = 0u;
  size_t v1 = 255;
  sysctlbyname("kern.wakereason", __big, &v1, 0, 0);
  if (!__big[0]) {
    return 0;
  }
  if (strcasestr(__big, "wlan")) {
    return 1;
  }
  return strcasestr(__big, "wifibt") != 0;
}

uint64_t WiFiExtractPerCoreValues(const __CFArray *a1, void *a2, void *a3)
{
  if (a1 && CFArrayGetCount(a1) == 2)
  {
    CFNumberRef ValueAtIndex = (const __CFNumber *)CFArrayGetValueAtIndex(a1, 0);
    CFNumberRef v7 = (const __CFNumber *)CFArrayGetValueAtIndex(a1, 1);
    if (ValueAtIndex) {
      CFNumberGetValue(ValueAtIndex, kCFNumberNSIntegerType, a2);
    }
    if (v7)
    {
      CFNumberGetValue(v7, kCFNumberNSIntegerType, a3);
      unsigned int v8 = 1;
      goto LABEL_9;
    }
  }
  else
  {
    CFNumberRef ValueAtIndex = 0;
  }
  unsigned int v8 = 0;
LABEL_9:
  if (ValueAtIndex) {
    return 1;
  }
  else {
    return v8;
  }
}

CFNumberRef WiFiPrivateMacAddressType(const __CFNumber *result)
{
  if (result)
  {
    CFNumberRef v1 = result;
    unsigned int valuePtr = 0;
    CFTypeID TypeID = CFNumberGetTypeID();
    if (TypeID == CFGetTypeID(v1))
    {
      CFNumberGetValue(v1, kCFNumberIntType, &valuePtr);
      return (const __CFNumber *)valuePtr;
    }
    else
    {
      return 0;
    }
  }
  return result;
}

CFNumberRef WiFiCreatePrivateMacAddressType(int a1)
{
  int valuePtr = a1;
  return CFNumberCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], kCFNumberIntType, &valuePtr);
}

uint64_t WiFiMIGMachPortGetTypeID()
{
  uint64_t result = __WiFiMIGMachPortTypeID;
  if (!__WiFiMIGMachPortTypeID)
  {
    pthread_once(&__WiFiMIGMachPortTypeInit, (void (*)(void))__WiFiMIGMachPortRegister);
    return __WiFiMIGMachPortTypeID;
  }
  return result;
}

uint64_t WiFiMIGMachPortScheduleWithQueue(uint64_t a1)
{
  uint64_t result = dispatch_mach_create_f();
  *(void *)(a1 + 72) = result;
  if (result)
  {
    return MEMORY[0x1F40CBB40]();
  }
  return result;
}

void __WiFiMIGMachPortDispatchPortCallback(uint64_t a1, uint64_t a2)
{
  switch(a2)
  {
    case 8:
      dispatch_release(*(dispatch_object_t *)(a1 + 72));
      CFRelease((CFTypeRef)a1);
      break;
    case 7:
      mach_port_name_t v5 = *(_DWORD *)(dispatch_mach_msg_get_msg() + 12);
      ipc_space_t v6 = *MEMORY[0x1E4F14960];
      mach_port_mod_refs(v6, v5, 1u, -1);
      break;
    case 2:
      if (*(_DWORD *)(dispatch_mach_msg_get_msg() + 20) == 70)
      {
        long long v3 = *(void (**)(uint64_t, uint64_t))(a1 + 96);
        if (v3)
        {
          uint64_t v4 = *(void *)(a1 + 104);
          v3(a1, v4);
        }
      }
      else if ((dispatch_mach_mig_demux() & 1) == 0)
      {
        mach_msg_header_t msg = (mach_msg_header_t *)dispatch_mach_msg_get_msg();
        mach_msg_destroy(msg);
      }
      break;
  }
}

uint64_t WiFiMIGMachPortUnscheduleFromQueue(uint64_t result)
{
  if (result)
  {
    uint64_t result = *(void *)(result + 72);
    if (result) {
      return MEMORY[0x1F40CBB38]();
    }
  }
  return result;
}

void WiFiMIGMachPortUnscheduleFromRunLoop(uint64_t a1, __CFRunLoop *cf1, const __CFString *a3)
{
  if (cf1)
  {
    if (a3)
    {
      CFNumberRef v7 = (void *)(a1 + 32);
      ipc_space_t v6 = *(const void **)(a1 + 32);
      if (v6)
      {
        if (*(void *)(a1 + 40))
        {
          if (CFEqual(cf1, v6))
          {
            if (CFEqual(a3, *(CFTypeRef *)(a1 + 40)))
            {
              *CFNumberRef v7 = 0;
              v7[1] = 0;
              unsigned int v8 = *(__CFRunLoopSource **)(a1 + 48);
              if (v8)
              {
                CFRunLoopRemoveSource(cf1, v8, a3);
                long long v9 = *(const void **)(a1 + 48);
                if (v9)
                {
                  CFRelease(v9);
                  *(void *)(a1 + 48) = 0;
                }
              }
            }
          }
        }
      }
    }
  }
}

uint64_t WiFiPortCacheRemove(unsigned int a1)
{
  pthread_mutex_lock(&__wifiPortCacheLock);
  if (__wifiPortCache) {
    CFDictionaryRemoveValue((CFMutableDictionaryRef)__wifiPortCache, (const void *)a1);
  }

  return pthread_mutex_unlock(&__wifiPortCacheLock);
}

const void *WiFiPortCacheCopyWithType(unsigned int a1, uint64_t a2)
{
  long long v3 = WiFiPortCacheCopy(a1);
  uint64_t v4 = v3;
  if (v3 && CFGetTypeID(v3) != a2)
  {
    CFRelease(v4);
    return 0;
  }
  return v4;
}

void __WiFiMIGMachPortRelease(uint64_t a1)
{
  int v2 = *(__CFMachPort **)(a1 + 56);
  if (v2)
  {
    CFMachPortInvalidate(v2);
    long long v3 = *(const void **)(a1 + 56);
    if (v3)
    {
      CFRelease(v3);
      *(void *)(a1 + 56) = 0;
    }
  }
  uint64_t v4 = *(const void **)(a1 + 48);
  if (v4)
  {
    CFRelease(v4);
    *(void *)(a1 + 48) = 0;
  }
}

uint64_t WiFiManagerClientGetTypeID()
{
  uint64_t result = __wiFiManagerTypeID;
  if (!__wiFiManagerTypeID)
  {
    pthread_once(&__wiFiManagerTypeInit, (void (*)(void))__WiFiManagerClientRegister);
    return __wiFiManagerTypeID;
  }
  return result;
}

void __WiFiManagerClientServerTerminationCallback(uint64_t a1, uint64_t a2)
{
  long long v3 = __WiFiManagerClientGetOrReconnectServerPort(a2, 0);
  *(_DWORD *)(a2 + 336) = 1;
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
    __WiFiManagerClientServerTerminationCallback_cold_1();
  }
  WiFiSendRightRelease((mach_port_name_t *)v3);
  uint64_t v4 = __WiFiManagerClientGetOrReconnectServerPort(a2, 1);
  CFNumberRef v7 = (mach_port_name_t *)v4;
  if (v4)
  {
    __WiFiManagerClientAvailableCallback((uint64_t)v4, v5, v6, a2);
LABEL_12:
    WiFiSendRightRelease(v7);
    return;
  }
  if (*(void *)(a2 + 104) || !*(void *)(a2 + 48) || !*(void *)(a2 + 56)) {
    goto LABEL_12;
  }
  mach_port_t notify_port = -1431655766;
  if (!notify_register_mach_port("com.apple.wifi.manager.available", &notify_port, 0, (int *)(a2 + 88)))
  {
    CFAllocatorRef v8 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
    long long v9 = (__CFMachPort *)_CFMachPortCreateWithPort();
    *(void *)(a2 + 96) = v9;
    if (v9)
    {
      RunLoopSource = CFMachPortCreateRunLoopSource(v8, v9, 0);
      *(void *)(a2 + 104) = RunLoopSource;
      if (RunLoopSource)
      {
        CFRunLoopAddSource(*(CFRunLoopRef *)(a2 + 48), RunLoopSource, *(CFRunLoopMode *)(a2 + 56));
        goto LABEL_12;
      }
    }
  }
}

void WiFiManagerClientDispatchNotificationResponse(uint64_t a1, int a2, int a3, const void *a4)
{
  CFNumberRef v7 = __WiFiManagerClientGetOrReconnectServerPort(a1, 0);
  if (v7)
  {
    CFAllocatorRef v8 = v7;
    CFDataRef BinaryData = (const __CFData *)_CFPropertyListCreateBinaryData((CFAllocatorRef)*MEMORY[0x1E4F1CF80], a4);
    if (BinaryData)
    {
      CFDataRef v10 = BinaryData;
      BytePtr = CFDataGetBytePtr(BinaryData);
      int Length = CFDataGetLength(v10);
      wifi_manager_dispatch_notification_response(v8[1], a2, a3, (uint64_t)BytePtr, Length);
      WiFiSendRightRelease((mach_port_name_t *)v8);
      CFRelease(v10);
    }
    else
    {
      wifi_manager_dispatch_notification_response(v8[1], a2, a3, 0, 0);
      WiFiSendRightRelease((mach_port_name_t *)v8);
    }
  }
}

uint64_t WiFiManagerClientIndicateCarPlayHIDEventReceived(uint64_t a1, int a2, int a3, const void *a4)
{
  CFNumberRef v7 = __WiFiManagerClientGetOrReconnectServerPort(a1, 0);
  if (v7)
  {
    CFAllocatorRef v8 = v7;
    CFDataRef BinaryData = (const __CFData *)_CFPropertyListCreateBinaryData((CFAllocatorRef)*MEMORY[0x1E4F1CF80], a4);
    if (BinaryData)
    {
      CFDataRef v10 = BinaryData;
      BytePtr = CFDataGetBytePtr(BinaryData);
      int Length = CFDataGetLength(v10);
      wifi_manager_indicate_carplay_hid_event_received(v8[1], a2, a3, (uint64_t)BytePtr, Length);
      WiFiSendRightRelease((mach_port_name_t *)v8);
      CFRelease(v10);
    }
    else
    {
      wifi_manager_indicate_carplay_hid_event_received(v8[1], a2, a3, 0, 0);
      WiFiSendRightRelease((mach_port_name_t *)v8);
    }
  }
  return 0;
}

atomic_uint *WiFiManagerClientSetProperty(uint64_t a1, const void *a2, const __CFData *a3)
{
  int v15 = -3902;
  uint64_t result = __WiFiManagerClientGetOrReconnectServerPort(a1, 0);
  if (!result) {
    return result;
  }
  uint64_t v6 = (mach_port_name_t *)result;
  CFAllocatorRef v7 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  CFDataRef BinaryData = (const __CFData *)_CFPropertyListCreateBinaryData((CFAllocatorRef)*MEMORY[0x1E4F1CF80], a2);
  CFDataRef v9 = BinaryData;
  if (BinaryData)
  {
    BytePtr = CFDataGetBytePtr(BinaryData);
    int Length = CFDataGetLength(v9);
    if (!a3) {
      goto LABEL_8;
    }
  }
  else
  {
    BytePtr = 0;
    int Length = 0;
    if (!a3)
    {
LABEL_8:
      long long v13 = 0;
      int v14 = 0;
      goto LABEL_9;
    }
  }
  CFDataRef v12 = (const __CFData *)_CFPropertyListCreateBinaryData(v7, a3);
  a3 = v12;
  if (!v12) {
    goto LABEL_8;
  }
  long long v13 = CFDataGetBytePtr(v12);
  int v14 = CFDataGetLength(a3);
LABEL_9:
  wifi_manager_set_property(v6[1], (uint64_t)BytePtr, Length, (uint64_t)v13, v14, &v15);
  WiFiSendRightRelease(v6);
  if (a3) {
    CFRelease(a3);
  }
  if (v9) {
    CFRelease(v9);
  }
  return (atomic_uint *)(v15 == 0);
}

uint64_t __WiFiManagerClientGetRootDevice(uint64_t a1)
{
  v7[1] = *MEMORY[0x1E4F143B8];
  os_unfair_recursive_lock_lock_with_options();
  CFDictionaryRef v2 = *(const __CFDictionary **)(a1 + 64);
  if (v2 && CFDictionaryGetCount(v2))
  {
    MEMORY[0x1F4188790]();
    uint64_t v4 = (void *)((char *)v7 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0));
    memset(v4, 170, v3);
    CFDictionaryGetKeysAndValues(*(CFDictionaryRef *)(a1 + 64), 0, (const void **)v4);
    uint64_t v5 = *v4;
  }
  else
  {
    uint64_t v5 = 0;
  }
  os_unfair_recursive_lock_unlock();
  return v5;
}

uint64_t _WiFiManagerClientGetRunLoop(uint64_t a1)
{
  return *(void *)(a1 + 48);
}

uint64_t _WiFiManagerClientGetRunLoopMode(uint64_t a1)
{
  return *(void *)(a1 + 56);
}

uint64_t WiFiManagerClientGetType(uint64_t a1)
{
  return *(unsigned int *)(a1 + 16);
}

void __WiFiManagerClientAndEventMask(uint64_t a1, uint64_t a2)
{
  *(void *)(a1 + 72) &= a2;
  size_t v3 = __WiFiManagerClientGetOrReconnectServerPort(a1, 0);
  uint64_t v4 = (mach_port_name_t *)v3;
  if (v3) {
    wifi_manager_set_event_mask(v3[1], *(void *)(a1 + 72));
  }

  WiFiSendRightRelease(v4);
}

uint64_t WiFiManagerClientRegisterVirtInterfaceChangeCallback(uint64_t result, uint64_t a2, uint64_t a3)
{
  *(void *)(result + 144) = a2;
  *(void *)(result + 152) = a3;
  return result;
}

void WiFiManagerClientRegisterWowStateChangedCallback(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)(a1 + 208) = a2;
  *(void *)(a1 + 216) = a3;
  if (a2) {
    __WiFiManagerClientOrEventMask(a1, 0x2000);
  }
  else {
    __WiFiManagerClientAndEventMask(a1, -8193);
  }
}

void WiFiManagerClientRegisterBackgroundScanCallback(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)(a1 + 160) = a2;
  *(void *)(a1 + 168) = a3;
  if (a2) {
    __WiFiManagerClientOrEventMask(a1, 512);
  }
  else {
    __WiFiManagerClientAndEventMask(a1, -513);
  }
}

void WiFiManagerClientRegisterBackgroundScanCacheCallback(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)(a1 + 176) = a2;
  *(void *)(a1 + 184) = a3;
  if (a2) {
    __WiFiManagerClientOrEventMask(a1, 0x200000);
  }
  else {
    __WiFiManagerClientAndEventMask(a1, -2097153);
  }
}

void WiFiManagerClientRegisterScanBackoffReportCallback(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)(a1 + 192) = a2;
  *(void *)(a1 + 200) = a3;
  uint64_t v5 = __WiFiManagerClientGetOrReconnectServerPort(a1, 0);
  if (v5)
  {
    uint64_t v6 = (mach_port_name_t *)v5;
    if (a2)
    {
      __WiFiManagerClientOrEventMask(a1, 0x2000000);
      int v7 = 1;
    }
    else
    {
      __WiFiManagerClientAndEventMask(a1, -33554433);
      int v7 = 0;
    }
    wifi_manager_set_scan_backoff_report(v6[1], v7);
    WiFiSendRightRelease(v6);
  }
}

void WiFiManagerClientSetAssociationMode(uint64_t a1, int a2)
{
  size_t v3 = __WiFiManagerClientGetOrReconnectServerPort(a1, 0);
  if (v3)
  {
    uint64_t v4 = (mach_port_name_t *)v3;
    wifi_manager_set_association_mode(v3[1], a2);
    WiFiSendRightRelease(v4);
  }
}

uint64_t WiFiManagerClientGetAssociationMode(uint64_t a1)
{
  unsigned int v4 = 1;
  CFNumberRef v1 = __WiFiManagerClientGetOrReconnectServerPort(a1, 0);
  CFDictionaryRef v2 = (mach_port_name_t *)v1;
  if (v1) {
    wifi_manager_get_association_mode(v1[1], &v4);
  }
  WiFiSendRightRelease(v2);
  return v4;
}

void WiFiManagerClientSetAskToJoinPreference(uint64_t a1, int a2)
{
  size_t v3 = __WiFiManagerClientGetOrReconnectServerPort(a1, 0);
  if (v3)
  {
    unsigned int v4 = (mach_port_name_t *)v3;
    wifi_manager_set_asktojoin_preference(v3[1], a2);
    WiFiSendRightRelease(v4);
  }
}

uint64_t WiFiManagerClientGetAskToJoinPreference(uint64_t a1)
{
  unsigned int v4 = 1;
  CFNumberRef v1 = __WiFiManagerClientGetOrReconnectServerPort(a1, 0);
  CFDictionaryRef v2 = (mach_port_name_t *)v1;
  if (v1) {
    wifi_manager_get_asktojoin_preference(v1[1], &v4);
  }
  WiFiSendRightRelease(v2);
  return v4;
}

void WiFiManagerClientEnable(uint64_t a1)
{
  CFNumberRef v1 = __WiFiManagerClientGetOrReconnectServerPort(a1, 0);
  if (v1)
  {
    CFDictionaryRef v2 = (mach_port_name_t *)v1;
    wifi_manager_set_enable_state(v1[1], 1);
    WiFiSendRightRelease(v2);
  }
}

void WiFiManagerClientDisable(uint64_t a1)
{
  CFNumberRef v1 = __WiFiManagerClientGetOrReconnectServerPort(a1, 0);
  if (v1)
  {
    CFDictionaryRef v2 = (mach_port_name_t *)v1;
    wifi_manager_set_enable_state(v1[1], 0);
    WiFiSendRightRelease(v2);
  }
}

void WiFiManagerClientSetPower(uint64_t a1, int a2)
{
  size_t v3 = __WiFiManagerClientGetOrReconnectServerPort(a1, 0);
  if (v3)
  {
    unsigned int v4 = (mach_port_name_t *)v3;
    wifi_manager_set_power(v3[1], a2);
    WiFiSendRightRelease(v4);
  }
}

BOOL WiFiManagerClientGetPower(uint64_t a1)
{
  return WiFiManagerClientGetPowerExt(a1) == 2;
}

atomic_uint *WiFiManagerClientGetPowerExt(uint64_t a1)
{
  int v3 = 0;
  uint64_t result = __WiFiManagerClientGetOrReconnectServerPort(a1, 0);
  if (result)
  {
    CFDictionaryRef v2 = (mach_port_name_t *)result;
    wifi_manager_get_power(result[1], &v3);
    WiFiSendRightRelease(v2);
    if (v3 == 4) {
      return (atomic_uint *)1;
    }
    else {
      return (atomic_uint *)(2 * (v3 == 1));
    }
  }
  return result;
}

void WiFiManagerClientSetPowerExt(uint64_t a1, unsigned int a2)
{
  if (a2 > 2) {
    int v2 = 1;
  }
  else {
    int v2 = dword_1BF219DF4[a2];
  }
  int v3 = __WiFiManagerClientGetOrReconnectServerPort(a1, 0);
  if (v3)
  {
    unsigned int v4 = (mach_port_name_t *)v3;
    wifi_manager_set_power_ext(v3[1], v2);
    WiFiSendRightRelease(v4);
  }
}

void WiFiManagerClientSetMISState(uint64_t a1, int a2)
{
  int v3 = __WiFiManagerClientGetOrReconnectServerPort(a1, 0);
  if (v3)
  {
    unsigned int v4 = (mach_port_name_t *)v3;
    wifi_manager_set_mis_state(v3[1], a2);
    WiFiSendRightRelease(v4);
  }
}

atomic_uint *WiFiManagerClientGetMISState(uint64_t a1)
{
  int v3 = 0;
  uint64_t result = __WiFiManagerClientGetOrReconnectServerPort(a1, 0);
  if (result)
  {
    int v2 = (mach_port_name_t *)result;
    wifi_manager_get_mis_state(result[1], &v3);
    WiFiSendRightRelease(v2);
    return (atomic_uint *)(v3 != 0);
  }
  return result;
}

void WiFiManagerClientSetMISDiscoveryState(uint64_t a1, int a2, int a3)
{
  uint64_t v5 = __WiFiManagerClientGetOrReconnectServerPort(a1, 0);
  if (v5)
  {
    uint64_t v6 = (mach_port_name_t *)v5;
    int v7 = getprogname();
    BOOL v8 = strncmp("sharingd", v7, 8uLL) == 0;
    wifi_manager_set_mis_discovery_state(v6[1], a2, a3, v8, 0, 0, 0, 0, 0, 0);
    WiFiSendRightRelease(v6);
  }
}

void WiFiManagerClientSetMISDiscoveryStateExt(uint64_t a1, const __CFDictionary *a2)
{
  unsigned __int16 valuePtr = 0;
  if (!a2) {
    return;
  }
  int v3 = __WiFiManagerClientGetOrReconnectServerPort(a1, 0);
  if (!v3) {
    return;
  }
  unsigned int v4 = (mach_port_name_t *)v3;
  CFStringRef Value = CFDictionaryGetValue(a2, @"SOFTAP_ENABLE");
  uint64_t v6 = (CFTypeRef *)MEMORY[0x1E4F1CFD0];
  if (Value) {
    BOOL v27 = CFEqual(Value, (CFTypeRef)*MEMORY[0x1E4F1CFD0]) != 0;
  }
  else {
    BOOL v27 = 0;
  }
  int v7 = CFDictionaryGetValue(a2, @"SOFTAP_IMMEDIATE_DISABLE");
  if (v7) {
    BOOL v26 = CFEqual(v7, *v6) != 0;
  }
  else {
    BOOL v26 = 0;
  }
  BOOL v8 = CFDictionaryGetValue(a2, @"SOFTAP_FORCE_2_4G_CHANNEL");
  if (v8) {
    BOOL v9 = CFEqual(v8, *v6) != 0;
  }
  else {
    BOOL v9 = 0;
  }
  CFDataRef v10 = CFDictionaryGetValue(a2, @"SOFTAP_SOFTAP_HIDDEN_NETWORK");
  if (v10) {
    BOOL v11 = CFEqual(v10, *v6) != 0;
  }
  else {
    BOOL v11 = 0;
  }
  CFDataRef v12 = CFDictionaryGetValue(a2, @"SOFTAP_SOFTAP_CAP_MODEL");
  long long v13 = (CFAllocatorRef *)MEMORY[0x1E4F1CF80];
  if (v12)
  {
    CFDataRef BinaryData = (const __CFData *)_CFPropertyListCreateBinaryData((CFAllocatorRef)*MEMORY[0x1E4F1CF80], v12);
    CFDataRef v15 = BinaryData;
    if (BinaryData)
    {
      BytePtr = CFDataGetBytePtr(BinaryData);
      int Length = CFDataGetLength(v15);
      goto LABEL_20;
    }
  }
  else
  {
    CFDataRef v15 = 0;
  }
  BytePtr = 0;
  int Length = 0;
LABEL_20:
  uint64_t v18 = CFDictionaryGetValue(a2, @"SOFTAP_SOFTAP_OS_VER");
  if (!v18)
  {
    CFDataRef v20 = 0;
    goto LABEL_24;
  }
  CFDataRef v19 = (const __CFData *)_CFPropertyListCreateBinaryData(*v13, v18);
  CFDataRef v20 = v19;
  if (!v19)
  {
LABEL_24:
    uint64_t v21 = 0;
    int v22 = 0;
    goto LABEL_25;
  }
  uint64_t v21 = CFDataGetBytePtr(v19);
  int v22 = CFDataGetLength(v20);
LABEL_25:
  CFNumberRef v23 = (const __CFNumber *)CFDictionaryGetValue(a2, @"SOFTAP_BRINGUP_METHOD");
  if (v23) {
    CFNumberGetValue(v23, kCFNumberSInt16Type, &valuePtr);
  }
  uint64_t v24 = getprogname();
  int v25 = !strncmp("sharingd", v24, 8uLL) || v11;
  wifi_manager_set_mis_discovery_state(v4[1], v27, v26, v25, v9, (uint64_t)BytePtr, Length, (uint64_t)v21, v22, valuePtr);
  WiFiSendRightRelease(v4);
  if (v15) {
    CFRelease(v15);
  }
  if (v20) {
    CFRelease(v20);
  }
}

atomic_uint *WiFiManagerClientGetMISDiscoveryState(uint64_t a1)
{
  int v3 = 0;
  uint64_t result = __WiFiManagerClientGetOrReconnectServerPort(a1, 0);
  if (result)
  {
    int v2 = (mach_port_name_t *)result;
    wifi_manager_get_mis_discovery_state(result[1], &v3);
    WiFiSendRightRelease(v2);
    return (atomic_uint *)(v3 != 0);
  }
  return result;
}

void WiFiManagerClientSetWoWState(uint64_t a1, int a2)
{
  unsigned int v4 = __WiFiManagerClientGetOrReconnectServerPort(a1, 0);
  if (v4)
  {
    uint64_t v5 = (mach_port_name_t *)v4;
    *(unsigned char *)(a1 + 80) = a2;
    wifi_manager_set_wow_state(v4[1], a2);
    WiFiSendRightRelease(v5);
  }
}

BOOL WiFiManagerClientGetWoWState(uint64_t a1)
{
  memset(length, 0, sizeof(length));
  CFNumberRef v1 = __WiFiManagerClientGetOrReconnectServerPort(a1, 0);
  int v2 = (mach_port_name_t *)v1;
  if (v1
    && ((wifi_manager_copy_wow_state(v1[1], &length[1], length), *(void *)&length[1])
      ? (BOOL v3 = length[0] == 0)
      : (BOOL v3 = 1),
        !v3 && (CFDictionaryRef v4 = (const __CFDictionary *)_WiFiCopyUnserialized(*(UInt8 **)&length[1], length[0])) != 0))
  {
    CFDictionaryRef v5 = v4;
    BOOL v6 = CFDictionaryGetValue(v4, @"WoWEnabled") == (const void *)*MEMORY[0x1E4F1CFD0];
    CFRelease(v5);
  }
  else
  {
    BOOL v6 = 0;
  }
  _WiFiVMDealloc(*(uint64_t *)&length[1], length[0]);
  WiFiSendRightRelease(v2);
  return v6;
}

CFPropertyListRef WiFiManagerClientCopyWoWState(uint64_t a1)
{
  memset(length, 0, sizeof(length));
  CFNumberRef v1 = __WiFiManagerClientGetOrReconnectServerPort(a1, 0);
  int v2 = (mach_port_name_t *)v1;
  if (!v1)
  {
    unsigned int v3 = 0;
LABEL_9:
    CFPropertyListRef v5 = 0;
    goto LABEL_7;
  }
  wifi_manager_copy_wow_state(v1[1], &length[1], length);
  CFNumberRef v1 = *(atomic_uint **)&length[1];
  unsigned int v3 = length[0];
  if (*(void *)&length[1]) {
    BOOL v4 = length[0] == 0;
  }
  else {
    BOOL v4 = 1;
  }
  if (v4) {
    goto LABEL_9;
  }
  CFPropertyListRef v5 = _WiFiCopyUnserialized(*(UInt8 **)&length[1], length[0]);
  CFNumberRef v1 = *(atomic_uint **)&length[1];
  unsigned int v3 = length[0];
LABEL_7:
  _WiFiVMDealloc((uint64_t)v1, v3);
  WiFiSendRightRelease(v2);
  return v5;
}

uint64_t WiFiManagerClientGetWoWCapability(uint64_t a1)
{
  int v4 = 0;
  CFNumberRef v1 = __WiFiManagerClientGetOrReconnectServerPort(a1, 0);
  int v2 = (mach_port_name_t *)v1;
  if (v1) {
    wifi_manager_get_wow_capability(v1[1], &v4);
  }
  WiFiSendRightRelease(v2);
  return v4;
}

BOOL WiFiManagerClientQuiesceWiFi(uint64_t a1, int a2)
{
  return WiFiManagerClienSetQuiesceState(a1, a2) == 0;
}

uint64_t WiFiManagerClienSetQuiesceState(uint64_t a1, int a2)
{
  unsigned int v6 = 0;
  unsigned int v3 = __WiFiManagerClientGetOrReconnectServerPort(a1, 0);
  if (!v3) {
    return 4294963394;
  }
  int v4 = (mach_port_name_t *)v3;
  wifi_manager_set_quiesce_state(v3[1], a2, &v6);
  WiFiSendRightRelease(v4);
  return v6;
}

BOOL WiFiManagerClientGetQuiesceState(uint64_t a1)
{
  int v4 = 0;
  CFNumberRef v1 = __WiFiManagerClientGetOrReconnectServerPort(a1, 0);
  int v2 = (mach_port_name_t *)v1;
  if (v1) {
    wifi_manager_get_quiesce_state(v1[1], &v4);
  }
  WiFiSendRightRelease(v2);
  return v4 != 0;
}

BOOL WiFiManagerClientIsTetheringSupported(uint64_t a1)
{
  int v4 = 0;
  CFNumberRef v1 = __WiFiManagerClientGetOrReconnectServerPort(a1, 0);
  int v2 = (mach_port_name_t *)v1;
  if (v1) {
    wifi_manager_is_tethering_supported(v1[1], &v4);
  }
  WiFiSendRightRelease(v2);
  return v4 != 0;
}

CFPropertyListRef WiFiManagerClientCopyMISStats(uint64_t a1)
{
  memset(length, 0, sizeof(length));
  CFNumberRef v1 = __WiFiManagerClientGetOrReconnectServerPort(a1, 0);
  int v2 = (mach_port_name_t *)v1;
  if (!v1)
  {
    unsigned int v3 = 0;
LABEL_9:
    CFPropertyListRef v5 = 0;
    goto LABEL_7;
  }
  wifi_manager_copy_mis_stats(v1[1], &length[1], length);
  CFNumberRef v1 = *(atomic_uint **)&length[1];
  unsigned int v3 = length[0];
  if (*(void *)&length[1]) {
    BOOL v4 = length[0] == 0;
  }
  else {
    BOOL v4 = 1;
  }
  if (v4) {
    goto LABEL_9;
  }
  CFPropertyListRef v5 = _WiFiCopyUnserialized(*(UInt8 **)&length[1], length[0]);
  CFNumberRef v1 = *(atomic_uint **)&length[1];
  unsigned int v3 = length[0];
LABEL_7:
  _WiFiVMDealloc((uint64_t)v1, v3);
  WiFiSendRightRelease(v2);
  return v5;
}

void WiFiManagerClientResetMISStats(uint64_t a1)
{
  CFNumberRef v1 = __WiFiManagerClientGetOrReconnectServerPort(a1, 0);
  int v2 = (mach_port_name_t *)v1;
  if (v1) {
    wifi_manager_reset_mis_stats(v1[1]);
  }

  WiFiSendRightRelease(v2);
}

atomic_uint *WiFiManagerClientIsNanPhsNetworkAssociated(uint64_t a1)
{
  int v3 = 0;
  uint64_t result = __WiFiManagerClientGetOrReconnectServerPort(a1, 0);
  if (result)
  {
    int v2 = (mach_port_name_t *)result;
    wifi_manager_get_nanclient_assoc_status(result[1], &v3);
    WiFiSendRightRelease(v2);
    return (atomic_uint *)(v3 != 0);
  }
  return result;
}

void WiFiManagerClientSetNANOffHeadConnectionExpiry(uint64_t a1, double a2)
{
  int v3 = __WiFiManagerClientGetOrReconnectServerPort(a1, 0);
  if (v3)
  {
    BOOL v4 = (mach_port_name_t *)v3;
    wifi_manager_set_nan_off_head_connection_expiry(v3[1], a2);
    WiFiSendRightRelease(v4);
  }
}

double WiFiManagerClientGetNANOffHeadConnectionExpiry(uint64_t a1)
{
  double v4 = 0.0;
  CFNumberRef v1 = __WiFiManagerClientGetOrReconnectServerPort(a1, 0);
  if (!v1) {
    return 0.0;
  }
  int v2 = (mach_port_name_t *)v1;
  wifi_manager_get_nan_off_head_connection_expiry(v1[1], &v4);
  WiFiSendRightRelease(v2);
  return v4;
}

uint64_t WiFiManagerClientIsAlwaysOnWiFiSupported(uint64_t a1)
{
  int v4 = 0;
  CFNumberRef v1 = __WiFiManagerClientGetOrReconnectServerPort(a1, 0);
  int v2 = (mach_port_name_t *)v1;
  if (v1) {
    wifi_manager_is_always_on_wifi_supported(v1[1], &v4);
  }
  WiFiSendRightRelease(v2);
  return v4;
}

uint64_t WiFiManagerClientIsWiFiAlwaysOnSupported()
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t v0 = MGGetProductType();
  uint64_t v1 = 0;
  BOOL v5 = v0 == 1302273958 || v0 == 761631964 || v0 == 262180327 || v0 == 2445473385;
  if (v0 > 1302273957)
  {
    if (v0 == 1302273958) {
      goto LABEL_20;
    }
    uint64_t v6 = 2445473385;
  }
  else
  {
    if (v0 == 262180327) {
      goto LABEL_20;
    }
    uint64_t v6 = 761631964;
  }
  if (v0 != v6) {
    uint64_t v1 = 1;
  }
LABEL_20:
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    int v7 = "supported";
    if (v5) {
      int v7 = "not supported";
    }
    int v9 = 136315394;
    CFDataRef v10 = "WiFiManagerClientIsWiFiAlwaysOnSupported";
    __int16 v11 = 2080;
    CFDataRef v12 = v7;
    _os_log_impl(&dword_1BF1E6000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "%s: always on wifi %s", (uint8_t *)&v9, 0x16u);
  }
  return v1;
}

CFPropertyListRef WiFiManagerClientCopyLocaleStats(uint64_t a1)
{
  memset(length, 0, sizeof(length));
  uint64_t v1 = __WiFiManagerClientGetOrReconnectServerPort(a1, 0);
  if (!v1) {
    return 0;
  }
  int v2 = (mach_port_name_t *)v1;
  wifi_manager_copy_locale_stats(v1[1], &length[1], length);
  if (*(void *)&length[1]) {
    BOOL v3 = length[0] == 0;
  }
  else {
    BOOL v3 = 1;
  }
  if (v3 || (CFPropertyListRef v4 = _WiFiCopyUnserialized(*(UInt8 **)&length[1], length[0])) == 0)
  {
    CFPropertyListRef v4 = 0;
  }
  _WiFiVMDealloc(*(uint64_t *)&length[1], length[0]);
  WiFiSendRightRelease(v2);
  return v4;
}

atomic_uint *WiFiManagerClientMergeKnownNetworks(uint64_t a1, const void *a2)
{
  int v9 = 0;
  uint64_t result = __WiFiManagerClientGetOrReconnectServerPort(a1, 0);
  if (result)
  {
    CFPropertyListRef v4 = (mach_port_name_t *)result;
    CFDataRef BinaryData = (const __CFData *)_CFPropertyListCreateBinaryData((CFAllocatorRef)*MEMORY[0x1E4F1CF80], a2);
    if (BinaryData)
    {
      CFDataRef v6 = BinaryData;
      BytePtr = CFDataGetBytePtr(BinaryData);
      int Length = CFDataGetLength(v6);
      wifi_manager_merge_known_networks(v4[1], (uint64_t)BytePtr, Length, &v9);
      CFRelease(v6);
    }
    else
    {
      wifi_manager_merge_known_networks(v4[1], 0, 0, &v9);
    }
    WiFiSendRightRelease(v4);
    return (atomic_uint *)(v9 != 0);
  }
  return result;
}

atomic_uint *WiFiManagerClientSetMisPassword(uint64_t a1, const void *a2)
{
  int v9 = -3902;
  uint64_t result = __WiFiManagerClientGetOrReconnectServerPort(a1, 0);
  if (result)
  {
    CFPropertyListRef v4 = (mach_port_name_t *)result;
    CFDataRef BinaryData = (const __CFData *)_CFPropertyListCreateBinaryData((CFAllocatorRef)*MEMORY[0x1E4F1CF80], a2);
    if (BinaryData)
    {
      CFDataRef v6 = BinaryData;
      BytePtr = CFDataGetBytePtr(BinaryData);
      int Length = CFDataGetLength(v6);
      wifi_manager_mis_set_password(v4[1], (uint64_t)BytePtr, Length, &v9);
      CFRelease(v6);
    }
    else
    {
      wifi_manager_mis_set_password(v4[1], 0, 0, &v9);
    }
    WiFiSendRightRelease(v4);
    return (atomic_uint *)(v9 == 0);
  }
  return result;
}

CFPropertyListRef WiFiManagerClientCopyMisPassword(uint64_t a1)
{
  memset(length, 0, sizeof(length));
  uint64_t v1 = __WiFiManagerClientGetOrReconnectServerPort(a1, 0);
  if (!v1) {
    return 0;
  }
  int v2 = (mach_port_name_t *)v1;
  wifi_manager_mis_copy_password(v1[1], &length[1], length);
  uint64_t v3 = *(void *)&length[1];
  unsigned int v4 = length[0];
  if (*(void *)&length[1]) {
    BOOL v5 = length[0] == 0;
  }
  else {
    BOOL v5 = 1;
  }
  if (v5)
  {
    CFPropertyListRef v6 = 0;
  }
  else
  {
    CFPropertyListRef v6 = _WiFiCopyUnserialized(*(UInt8 **)&length[1], length[0]);
    uint64_t v3 = *(void *)&length[1];
    unsigned int v4 = length[0];
  }
  _WiFiVMDealloc(v3, v4);
  WiFiSendRightRelease(v2);
  return v6;
}

void WiFiManagerClientSetRetryIntervalCap(uint64_t a1, int a2)
{
  uint64_t v3 = __WiFiManagerClientGetOrReconnectServerPort(a1, 0);
  if (v3)
  {
    unsigned int v4 = (mach_port_name_t *)v3;
    wifi_manager_set_retry_cap(v3[1], a2);
    WiFiSendRightRelease(v4);
  }
}

uint64_t WiFiManagerClientGetRetryIntervalCap(uint64_t a1)
{
  unsigned int v4 = 0;
  uint64_t v1 = __WiFiManagerClientGetOrReconnectServerPort(a1, 0);
  int v2 = (mach_port_name_t *)v1;
  if (v1) {
    wifi_manager_get_retry_cap(v1[1], &v4);
  }
  WiFiSendRightRelease(v2);
  return v4;
}

void WiFiManagerClientSetBackgroundScanNetworks(uint64_t a1, const __CFArray *a2)
{
  uint64_t v3 = __WiFiManagerClientGetOrReconnectServerPort(a1, 0);
  unsigned int v4 = (mach_port_name_t *)v3;
  if (a2)
  {
    if (v3)
    {
      RecordsFromNetworks = _WiFiCreateRecordsFromNetworks(a2);
      if (RecordsFromNetworks)
      {
        CFPropertyListRef v6 = RecordsFromNetworks;
        CFDataRef BinaryData = (const __CFData *)_CFPropertyListCreateBinaryData((CFAllocatorRef)*MEMORY[0x1E4F1CF80], RecordsFromNetworks);
        if (BinaryData)
        {
          CFDataRef v8 = BinaryData;
          int v9 = v4[1];
          BytePtr = CFDataGetBytePtr(BinaryData);
          int Length = CFDataGetLength(v8);
          wifi_manager_set_background_scan_networks(v9, (uint64_t)BytePtr, Length);
          CFRelease(v8);
        }
        CFRelease(v6);
      }
    }
  }

  WiFiSendRightRelease(v4);
}

void WiFiManagerClientSetBGScanCacheState(uint64_t a1, const void *a2)
{
  uint64_t v3 = __WiFiManagerClientGetOrReconnectServerPort(a1, 0);
  if (v3)
  {
    unsigned int v4 = v3;
    if (a2
      && (CFDataRef BinaryData = (const __CFData *)_CFPropertyListCreateBinaryData((CFAllocatorRef)*MEMORY[0x1E4F1CF80], a2)) != 0)
    {
      CFDataRef v6 = BinaryData;
      BytePtr = CFDataGetBytePtr(BinaryData);
      int Length = CFDataGetLength(v6);
      wifi_manager_set_bgscan_cache_state(v4[1], (uint64_t)BytePtr, Length);
      CFRelease(v6);
    }
    else
    {
      wifi_manager_set_bgscan_cache_state(v4[1], 0, 0);
    }
    WiFiSendRightRelease((mach_port_name_t *)v4);
  }
}

void WiFiManagerClientAddNetwork(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = (mach_port_name_t *)__WiFiManagerClientGetOrReconnectServerPort(a1, 0);
  if (v3 && (CFDictionaryRef v4 = WiFiNetworkCopyRecord(a2)) != 0)
  {
    CFDictionaryRef v5 = v4;
    CFDataRef BinaryData = (const __CFData *)_CFPropertyListCreateBinaryData((CFAllocatorRef)*MEMORY[0x1E4F1CF80], v4);
    if (BinaryData)
    {
      CFDataRef v7 = BinaryData;
      int v8 = v3[1];
      BytePtr = CFDataGetBytePtr(BinaryData);
      int Length = CFDataGetLength(v7);
      wifi_manager_add_network(v8, (uint64_t)BytePtr, Length);
      CFRelease(v7);
    }
    WiFiSendRightRelease(v3);
    CFRelease(v5);
  }
  else
  {
    WiFiSendRightRelease(v3);
  }
}

uint64_t WiFiManagerClientAddNetworkAsync(uint64_t a1, uint64_t a2, CFTypeRef BinaryData, uint64_t a4, uint64_t a5)
{
  if (!a1)
  {
    CFDataRef v10 = 0;
    goto LABEL_16;
  }
  CFDataRef v10 = (mach_port_name_t *)__WiFiManagerClientGetOrReconnectServerPort(a1, 0);
  if (!v10)
  {
LABEL_16:
    uint64_t v21 = 74;
    goto LABEL_13;
  }
  CFDictionaryRef v11 = WiFiNetworkCopyRecord(a2);
  if (!v11)
  {
    uint64_t v21 = 72;
    goto LABEL_13;
  }
  CFDictionaryRef v12 = v11;
  if (*(void *)(a1 + 256) || *(void *)(a1 + 264))
  {
    uint64_t v21 = 37;
    goto LABEL_12;
  }
  *(void *)(a1 + 256) = a4;
  *(void *)(a1 + 264) = a5;
  CFAllocatorRef v13 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  if (BinaryData)
  {
    CFDataRef BinaryData = _CFPropertyListCreateBinaryData((CFAllocatorRef)*MEMORY[0x1E4F1CF80], BinaryData);
    BytePtr = CFDataGetBytePtr((CFDataRef)BinaryData);
    int Length = CFDataGetLength((CFDataRef)BinaryData);
  }
  else
  {
    BytePtr = 0;
    int Length = 0;
  }
  CFDataRef v16 = (const __CFData *)_CFPropertyListCreateBinaryData(v13, v12);
  if (!v16)
  {
    uint64_t v21 = 72;
    if (!BinaryData) {
      goto LABEL_12;
    }
    goto LABEL_11;
  }
  CFDataRef v17 = v16;
  int v18 = v10[1];
  CFDataRef v19 = CFDataGetBytePtr(v16);
  int v20 = CFDataGetLength(v17);
  wifi_manager_add_network_async(v18, (uint64_t)v19, v20, (uint64_t)BytePtr, Length);
  CFRelease(v17);
  uint64_t v21 = 0;
  if (BinaryData) {
LABEL_11:
  }
    CFRelease(BinaryData);
LABEL_12:
  CFRelease(v12);
LABEL_13:
  WiFiSendRightRelease(v10);
  return v21;
}

void WiFiManagerClientUpdateNetwork(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = (mach_port_name_t *)__WiFiManagerClientGetOrReconnectServerPort(a1, 0);
  if (v3)
  {
    CFDictionaryRef v4 = WiFiNetworkCopyRecord(a2);
    if (v4)
    {
      CFDictionaryRef v5 = v4;
      CFDataRef BinaryData = (const __CFData *)_CFPropertyListCreateBinaryData((CFAllocatorRef)*MEMORY[0x1E4F1CF80], v4);
      if (BinaryData)
      {
        CFDataRef v7 = BinaryData;
        int v8 = v3[1];
        BytePtr = CFDataGetBytePtr(BinaryData);
        int Length = CFDataGetLength(v7);
        wifi_manager_update_network(v8, (uint64_t)BytePtr, Length);
        CFRelease(v7);
      }
      CFRelease(v5);
    }
  }

  WiFiSendRightRelease(v3);
}

void WiFiManagerClientRemoveNetwork(uint64_t a1, const void *a2)
{
  CFAllocatorRef v4 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  CFDictionaryRef v5 = getprogname();
  CFStringEncoding SystemEncoding = CFStringGetSystemEncoding();
  CFStringRef v7 = CFStringCreateWithCString(v4, v5, SystemEncoding);
  if (v7)
  {
    CFStringRef v8 = v7;
    if (CFEqual(v7, @"mobilewifitool"))
    {
      uint64_t v9 = a1;
      CFDataRef v10 = a2;
      int v11 = 24;
    }
    else
    {
      if (*(unsigned char *)(a1 + 81)) {
        int v11 = 2;
      }
      else {
        int v11 = 22;
      }
      uint64_t v9 = a1;
      CFDataRef v10 = a2;
    }
    WiFiManagerClientRemoveNetworkWithReason(v9, v10, v11);
    CFRelease(v8);
  }
  else
  {
    if (*(unsigned char *)(a1 + 81)) {
      int v12 = 2;
    }
    else {
      int v12 = 22;
    }
    WiFiManagerClientRemoveNetworkWithReason(a1, a2, v12);
  }
}

void WiFiManagerClientRemoveNetworkWithReason(uint64_t a1, const void *a2, int a3)
{
  if (a2)
  {
    CFDictionaryRef v5 = (mach_port_name_t *)__WiFiManagerClientGetOrReconnectServerPort(a1, 0);
    if (v5)
    {
      CFDictionaryRef v6 = WiFiNetworkCopyRecord((uint64_t)a2);
      if (v6)
      {
        CFDictionaryRef v7 = v6;
        CFDataRef BinaryData = (const __CFData *)_CFPropertyListCreateBinaryData((CFAllocatorRef)*MEMORY[0x1E4F1CF80], v6);
        if (BinaryData)
        {
          CFDataRef v9 = BinaryData;
          int v10 = v5[1];
          BytePtr = CFDataGetBytePtr(BinaryData);
          int Length = CFDataGetLength(v9);
          wifi_manager_remove_network(v10, (uint64_t)BytePtr, Length, a3);
          CFRelease(v9);
        }
        int Type = WiFiNetworkGetType((uint64_t)a2);
        SSID = WiFiNetworkGetSSID(a2);
        if (Type != 2)
        {
          if ((a3 & 0xFFFFFFFE) == 0xC)
          {
            uint64_t v15 = WiFiNetworkSetPasswordSyncable();
          }
          WiFiNetworkRemovePassword(a2);
        }
        if (MEMORY[0x1E4F5FBA8] && WiFiNetworkIsEAP((uint64_t)a2))
        {
          WiFiNetworkGetSSID(a2);
          EAPTLSRemoveTrustExceptionsBindings();
        }
        CFRelease(v7);
      }
    }
    WiFiSendRightRelease(v5);
  }
}

void WiFiManagerClientRemoveNetworksWithBundleIdentifier(uint64_t a1, const void *a2)
{
  uint64_t v3 = __WiFiManagerClientGetOrReconnectServerPort(a1, 0);
  if (v3)
  {
    if (a2)
    {
      CFDataRef BinaryData = (const __CFData *)_CFPropertyListCreateBinaryData((CFAllocatorRef)*MEMORY[0x1E4F1CF80], a2);
      if (BinaryData)
      {
        CFDataRef v5 = BinaryData;
        BytePtr = CFDataGetBytePtr(BinaryData);
        int Length = CFDataGetLength(v5);
        wifi_manager_remove_networks_with_bundle_identifier(v3[1], (uint64_t)BytePtr, Length);
        CFRelease(v5);
      }
    }
    else
    {
    }
  }

  WiFiSendRightRelease((mach_port_name_t *)v3);
}

void WiFiManagerClientEnableNetwork(uint64_t a1, uint64_t a2)
{
}

void __WiFiManagerClientSetNetworkState(uint64_t a1, uint64_t a2, int a3, int a4)
{
  CFDictionaryRef v7 = (mach_port_name_t *)__WiFiManagerClientGetOrReconnectServerPort(a1, 0);
  if (v7)
  {
    CFDictionaryRef v8 = WiFiNetworkCopyRecord(a2);
    if (v8)
    {
      CFDictionaryRef v9 = v8;
      CFDataRef BinaryData = (const __CFData *)_CFPropertyListCreateBinaryData((CFAllocatorRef)*MEMORY[0x1E4F1CF80], v8);
      if (BinaryData)
      {
        CFDataRef v11 = BinaryData;
        int v12 = v7[1];
        BytePtr = CFDataGetBytePtr(BinaryData);
        int Length = CFDataGetLength(v11);
        wifi_manager_set_network_state(v12, (uint64_t)BytePtr, Length, a3, a4);
        CFRelease(v11);
      }
      CFRelease(v9);
    }
  }

  WiFiSendRightRelease(v7);
}

void WiFiManagerClientDisableNetwork(uint64_t a1, uint64_t a2)
{
}

void WiFiManagerClientEnableNetworksWithBundleIdentifier(uint64_t a1, const void *a2)
{
}

void __WiFiManagerClientSetNetworksStateWithBundleIdentifier(uint64_t a1, const void *a2, int a3)
{
  CFDataRef v5 = __WiFiManagerClientGetOrReconnectServerPort(a1, 0);
  if (v5)
  {
    if (a2)
    {
      CFDataRef BinaryData = (const __CFData *)_CFPropertyListCreateBinaryData((CFAllocatorRef)*MEMORY[0x1E4F1CF80], a2);
      if (BinaryData)
      {
        CFDataRef v7 = BinaryData;
        BytePtr = CFDataGetBytePtr(BinaryData);
        int Length = CFDataGetLength(v7);
        wifi_manager_set_networks_state_with_bundle_identifier(v5[1], (uint64_t)BytePtr, Length, a3);
        CFRelease(v7);
      }
    }
    else
    {
    }
  }

  WiFiSendRightRelease((mach_port_name_t *)v5);
}

void WiFiManagerClientDisableNetworksWithBundleIdentifier(uint64_t a1, const void *a2)
{
}

void WiFiManagerClientTemporarilyDisableNetwork(uint64_t a1, uint64_t a2)
{
}

atomic_uint *WiFiManagerClientIsNetworkEnabled(uint64_t a1, uint64_t a2)
{
  int v12 = 0;
  uint64_t result = __WiFiManagerClientGetOrReconnectServerPort(a1, 0);
  if (result)
  {
    CFAllocatorRef v4 = (mach_port_name_t *)result;
    CFDictionaryRef v5 = WiFiNetworkCopyRecord(a2);
    if (v5)
    {
      CFDictionaryRef v6 = v5;
      CFDataRef BinaryData = (const __CFData *)_CFPropertyListCreateBinaryData((CFAllocatorRef)*MEMORY[0x1E4F1CF80], v5);
      if (BinaryData)
      {
        CFDataRef v8 = BinaryData;
        mach_port_t v9 = v4[1];
        BytePtr = CFDataGetBytePtr(BinaryData);
        int Length = CFDataGetLength(v8);
        wifi_manager_get_network_state(v9, (uint64_t)BytePtr, Length, &v12);
        CFRelease(v8);
      }
      CFRelease(v6);
    }
    WiFiSendRightRelease(v4);
    return (atomic_uint *)(v12 != 0);
  }
  return result;
}

__CFArray *WiFiManagerClientCopyNetworks(uint64_t a1)
{
  return __WiFiManagerClientCopyNetworks(a1, 0);
}

__CFArray *__WiFiManagerClientCopyNetworks(uint64_t a1, int a2)
{
  memset(length, 0, sizeof(length));
  uint64_t v3 = __WiFiManagerClientGetOrReconnectServerPort(a1, 0);
  CFAllocatorRef v4 = (mach_port_name_t *)v3;
  if (v3
    && ((wifi_manager_copy_networks(v3[1], a2, &length[1], length), *(void *)&length[1])
      ? (BOOL v5 = length[0] == 0)
      : (BOOL v5 = 1),
        !v5 && (CFArrayRef v6 = (const __CFArray *)_WiFiCopyUnserialized(*(UInt8 **)&length[1], length[0])) != 0))
  {
    CFArrayRef v7 = v6;
    NetworksFromRecords = _WiFiCreateNetworksFromRecords(v6);
    CFRelease(v7);
  }
  else
  {
    NetworksFromRecords = 0;
  }
  _WiFiVMDealloc(*(uint64_t *)&length[1], length[0]);
  WiFiSendRightRelease(v4);
  return NetworksFromRecords;
}

__CFArray *WiFiManagerClientCopyEnabledNetworks(uint64_t a1)
{
  return __WiFiManagerClientCopyNetworks(a1, 1);
}

__CFArray *WiFiManagerClientCopyMutableNetworks(uint64_t a1)
{
  memset(length, 0, sizeof(length));
  uint64_t v1 = __WiFiManagerClientGetOrReconnectServerPort(a1, 0);
  int v2 = (mach_port_name_t *)v1;
  if (v1
    && ((wifi_manager_copy_networks(v1[1], 0, &length[1], length), *(void *)&length[1])
      ? (BOOL v3 = length[0] == 0)
      : (BOOL v3 = 1),
        !v3 && (CFArrayRef v4 = (const __CFArray *)_WiFiCopyUnserialized(*(UInt8 **)&length[1], length[0])) != 0))
  {
    CFArrayRef v5 = v4;
    NetworksFromRecords = _WiFiCreateNetworksFromRecords(v4);
    CFRelease(v5);
  }
  else
  {
    NetworksFromRecords = 0;
  }
  _WiFiVMDealloc(*(uint64_t *)&length[1], length[0]);
  WiFiSendRightRelease(v2);
  return NetworksFromRecords;
}

__CFArray *WiFiManagerClientCopyNetworksWithBundleIdentifier(uint64_t a1, const __CFString *a2)
{
  if (!a2)
  {
    return 0;
  }
  BOOL v3 = __WiFiManagerClientCopyNetworks(a1, 0);
  if (!v3) {
    return 0;
  }
  CFArrayRef v4 = v3;
  CFMutableSetRef Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, MEMORY[0x1E4F1D510]);
  if (Mutable)
  {
    CFIndex Count = CFArrayGetCount(v4);
    if (Count >= 1)
    {
      CFIndex v7 = Count;
      for (CFIndex i = 0; i != v7; ++i)
      {
        CFNumberRef ValueAtIndex = CFArrayGetValueAtIndex(v4, i);
        if (ValueAtIndex)
        {
          int v10 = ValueAtIndex;
          CFStringRef BundleIdentifier = (const __CFString *)WiFiNetworkGetBundleIdentifier((uint64_t)ValueAtIndex);
          if (BundleIdentifier)
          {
            if (CFEqual(BundleIdentifier, a2)) {
              CFArrayAppendValue(Mutable, v10);
            }
          }
        }
      }
    }
    if (!CFArrayGetCount(Mutable))
    {
      CFRelease(Mutable);
      CFMutableSetRef Mutable = 0;
    }
  }
  CFRelease(v4);
  return Mutable;
}

uint64_t WiFiManagerClientGetAskToJoinState(uint64_t a1)
{
  unsigned int v5 = 0;
  uint64_t v1 = __WiFiManagerClientGetOrReconnectServerPort(a1, 0);
  int v2 = (mach_port_name_t *)v1;
  if (v1)
  {
    wifi_manager_get_ask_to_join_state(v1[1], &v5);
    uint64_t v3 = v5;
  }
  else
  {
    uint64_t v3 = 0;
  }
  WiFiSendRightRelease(v2);
  return v3;
}

CFPropertyListRef WiFiManagerClientCopyVersionInfo(uint64_t a1)
{
  memset(length, 0, sizeof(length));
  uint64_t v1 = __WiFiManagerClientGetOrReconnectServerPort(a1, 0);
  if (!v1) {
    return 0;
  }
  int v2 = (mach_port_name_t *)v1;
  wifi_manager_copy_version_info(v1[1], &length[1], length);
  uint64_t v3 = *(void *)&length[1];
  unsigned int v4 = length[0];
  if (*(void *)&length[1]) {
    BOOL v5 = length[0] == 0;
  }
  else {
    BOOL v5 = 1;
  }
  if (v5)
  {
    CFPropertyListRef v6 = 0;
  }
  else
  {
    CFPropertyListRef v6 = _WiFiCopyUnserialized(*(UInt8 **)&length[1], length[0]);
    uint64_t v3 = *(void *)&length[1];
    unsigned int v4 = length[0];
  }
  _WiFiVMDealloc(v3, v4);
  WiFiSendRightRelease(v2);
  return v6;
}

CFPropertyListRef WiFiManagerClientCopyClientNames(uint64_t a1)
{
  memset(length, 0, sizeof(length));
  uint64_t v1 = __WiFiManagerClientGetOrReconnectServerPort(a1, 0);
  if (!v1) {
    return 0;
  }
  int v2 = (mach_port_name_t *)v1;
  wifi_manager_copy_client_names(v1[1], &length[1], length);
  uint64_t v3 = *(void *)&length[1];
  unsigned int v4 = length[0];
  if (*(void *)&length[1]) {
    BOOL v5 = length[0] == 0;
  }
  else {
    BOOL v5 = 1;
  }
  if (v5)
  {
    CFPropertyListRef v6 = 0;
  }
  else
  {
    CFPropertyListRef v6 = _WiFiCopyUnserialized(*(UInt8 **)&length[1], length[0]);
    uint64_t v3 = *(void *)&length[1];
    unsigned int v4 = length[0];
  }
  _WiFiVMDealloc(v3, v4);
  WiFiSendRightRelease(v2);
  return v6;
}

CFArrayRef WiFiManagerClientCopyInterfaces(uint64_t a1)
{
  v9[1] = *MEMORY[0x1E4F143B8];
  os_unfair_recursive_lock_lock_with_options();
  CFDictionaryRef v2 = *(const __CFDictionary **)(a1 + 64);
  if (v2 && (CFIndex Count = CFDictionaryGetCount(v2)) != 0)
  {
    CFIndex v4 = Count;
    MEMORY[0x1F4188790]();
    CFPropertyListRef v6 = (char *)v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
    memset(v6, 170, v5);
    CFDictionaryGetKeysAndValues(*(CFDictionaryRef *)(a1 + 64), 0, (const void **)v6);
    CFArrayRef v7 = CFArrayCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], (const void **)v6, v4, MEMORY[0x1E4F1D510]);
  }
  else
  {
    CFArrayRef v7 = 0;
  }
  os_unfair_recursive_lock_unlock();
  return v7;
}

uint64_t WiFiManagerClientAddDevice(uint64_t a1, const void *a2, uint64_t a3)
{
  return __WiFiManagerClientAddDevice(a1, a2, a3, 0);
}

void WiFiManagerClientRemoveDevice(uint64_t a1, const void *a2, int a3, int a4)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    int v11 = 136315650;
    int v12 = "WiFiManagerClientRemoveDevice";
    __int16 v13 = 2112;
    int v14 = a2;
    __int16 v15 = 2112;
    uint64_t v16 = a1;
    _os_log_impl(&dword_1BF1E6000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "%s: removed %@ (manager %@)", (uint8_t *)&v11, 0x20u);
  }
  if (a2)
  {
    os_unfair_recursive_lock_lock_with_options();
    if (a3)
    {
      if (*(void *)(a1 + 144))
      {
        Device = WiFiManagerClientGetDevice(a1, a2);
        mach_port_t v9 = Device;
        if (Device) {
          CFRetain(Device);
        }
        if (!a4) {
          CFDictionaryRemoveValue(*(CFMutableDictionaryRef *)(a1 + 64), a2);
        }
      }
      else
      {
        mach_port_t v9 = 0;
      }
      os_unfair_recursive_lock_unlock();
      if (!a4)
      {
        int v10 = *(void (**)(uint64_t, const void *, const void *, void, void))(a1 + 144);
        if (v10) {
          v10(a1, v9, a2, 0, *(void *)(a1 + 152));
        }
      }
      if (v9) {
        CFRelease(v9);
      }
    }
    else
    {
      os_unfair_recursive_lock_unlock();
    }
  }
}

void WiFiManagerClientDispatchAttachmentEvent(void *a1, CFStringRef theString, int a3)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if (a3) {
    uint64_t v6 = 6;
  }
  else {
    uint64_t v6 = 0;
  }
  if (theString && a3 && CFStringHasPrefix(theString, @"ap")) {
    uint64_t v6 = 7;
  }
  if (__WiFiManagerClientAddDevice((uint64_t)a1, theString, v6, 0))
  {
    Device = WiFiManagerClientGetDevice((uint64_t)a1, theString);
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
    {
      int v10 = 136316162;
      int v11 = "WiFiManagerClientDispatchAttachmentEvent";
      __int16 v12 = 2112;
      CFStringRef v13 = theString;
      __int16 v14 = 1024;
      int v15 = a3;
      __int16 v16 = 2112;
      uint64_t v17 = a1;
      __int16 v18 = 2112;
      CFDataRef v19 = Device;
      _os_log_impl(&dword_1BF1E6000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "%s: attached %@ (isVirtual %d manager %@ deviceClient %@)", (uint8_t *)&v10, 0x30u);
    }
    if (a3)
    {
      CFDataRef v8 = (void (*)(void *, const void *, CFStringRef, uint64_t, void))a1[18];
      if (v8) {
        v8(a1, Device, theString, 1, a1[19]);
      }
    }
    else
    {
      mach_port_t v9 = (void (*)(void *, const void *, void))a1[16];
      if (v9) {
        v9(a1, Device, a1[17]);
      }
    }
  }
  else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    WiFiManagerClientDispatchAttachmentEvent_cold_1();
  }
}

void WiFiManagerClientDumpLogs(uint64_t a1, const void *a2)
{
  uint64_t v3 = __WiFiManagerClientGetOrReconnectServerPort(a1, 0);
  if (v3)
  {
    CFIndex v4 = v3;
    if (a2
      && (CFDataRef BinaryData = (const __CFData *)_CFPropertyListCreateBinaryData((CFAllocatorRef)*MEMORY[0x1E4F1CF80], a2)) != 0)
    {
      CFDataRef v6 = BinaryData;
      BytePtr = CFDataGetBytePtr(BinaryData);
      int Length = CFDataGetLength(v6);
      wifi_manager_dump_logs(v4[1], (uint64_t)BytePtr, Length);
      CFRelease(v6);
    }
    else
    {
      wifi_manager_dump_logs(v4[1], 0, 0);
    }
    WiFiSendRightRelease((mach_port_name_t *)v4);
  }
}

void WiFiManagerClientSetTestParams(uint64_t a1, const void *a2)
{
  uint64_t v3 = __WiFiManagerClientGetOrReconnectServerPort(a1, 0);
  if (v3)
  {
    CFIndex v4 = v3;
    if (a2
      && (CFDataRef BinaryData = (const __CFData *)_CFPropertyListCreateBinaryData((CFAllocatorRef)*MEMORY[0x1E4F1CF80], a2)) != 0)
    {
      CFDataRef v6 = BinaryData;
      BytePtr = CFDataGetBytePtr(BinaryData);
      int Length = CFDataGetLength(v6);
      wifi_manager_set_test_params(v4[1], (uint64_t)BytePtr, Length);
      CFRelease(v6);
    }
    else
    {
      wifi_manager_set_test_params(v4[1], 0, 0);
    }
    WiFiSendRightRelease((mach_port_name_t *)v4);
  }
}

CFPropertyListRef WiFiManagerClientSetTestParamsAndCopyResponse(uint64_t a1, const void *a2)
{
  memset(length, 0, sizeof(length));
  uint64_t v3 = __WiFiManagerClientGetOrReconnectServerPort(a1, 0);
  if (!v3) {
    goto LABEL_13;
  }
  if (!a2)
  {
LABEL_13:
    CFPropertyListRef v8 = 0;
    goto LABEL_11;
  }
  CFDataRef BinaryData = (const __CFData *)_CFPropertyListCreateBinaryData((CFAllocatorRef)*MEMORY[0x1E4F1CF80], a2);
  CFDataRef v5 = BinaryData;
  if (BinaryData)
  {
    BytePtr = CFDataGetBytePtr(BinaryData);
    int v7 = CFDataGetLength(v5);
  }
  else
  {
    BytePtr = 0;
    int v7 = 0;
  }
  wifi_manager_copy_test_params(v3[1], (uint64_t)BytePtr, v7, &length[1], length);
  CFPropertyListRef v8 = 0;
  if (*(void *)&length[1] && length[0]) {
    CFPropertyListRef v8 = _WiFiCopyUnserialized(*(UInt8 **)&length[1], length[0]);
  }
  if (v5) {
    CFRelease(v5);
  }
LABEL_11:
  _WiFiVMDealloc(*(uint64_t *)&length[1], length[0]);
  WiFiSendRightRelease((mach_port_name_t *)v3);
  return v8;
}

void __WiFiManagerClientAvailableCallback(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  BOOL v5 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR);
  if (v5) {
    __WiFiManagerClientAvailableCallback_cold_3(v5, v6, v7, v8, v9, v10, v11, v12);
  }
  CFStringRef v13 = (mach_port_name_t *)__WiFiManagerClientGetOrReconnectServerPort(a4, 0);
  if (*(_DWORD *)(a4 + 336) >= 2u)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      __WiFiManagerClientAvailableCallback_cold_2();
    }
    WiFiSendRightRelease(v13);
    CFStringRef v13 = (mach_port_name_t *)__WiFiManagerClientGetOrReconnectServerPort(a4, 1);
  }
  *(_DWORD *)(a4 + 336) = 2;
  __int16 v14 = *(void (**)(uint64_t, void, uint64_t, void))(a4 + 256);
  if (v14)
  {
    v14(a4, 0, 74, *(void *)(a4 + 264));
    *(void *)(a4 + 256) = 0;
    *(void *)(a4 + 264) = 0;
  }
  if (v13)
  {
    wifi_manager_set_wow_state(v13[1], *(unsigned __int8 *)(a4 + 80));
    wifi_manager_set_client_type(v13[1], *(_DWORD *)(a4 + 16));
  }
  else
  {
    BOOL v15 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR);
    if (v15) {
      __WiFiManagerClientAvailableCallback_cold_1(v15, v16, v17, v18, v19, v20, v21, v22);
    }
  }
  if (*(unsigned char *)(a4 + 74))
  {
    CFNumberRef v23 = *(void (**)(uint64_t, void))(a4 + 224);
    if (v23) {
      v23(a4, *(void *)(a4 + 232));
    }
  }
  WiFiSendRightRelease(v13);
}

void WiFiManagerClientUnscheduleFromRunLoop(uint64_t a1)
{
  CFDictionaryRef v2 = (void *)(a1 + 48);
  uint64_t v1 = *(__CFRunLoop **)(a1 + 48);
  if (v1 && (CFStringRef v4 = *(const __CFString **)(a1 + 56)) != 0)
  {
    WiFiMIGMachPortUnscheduleFromRunLoop(*(void *)(a1 + 40), v1, v4);
    BOOL v5 = *(__CFRunLoopSource **)(a1 + 104);
    if (v5)
    {
      if (*(void *)(a1 + 96)) {
        CFRunLoopRemoveSource(*(CFRunLoopRef *)(a1 + 48), v5, *(CFRunLoopMode *)(a1 + 56));
      }
    }
    *CFDictionaryRef v2 = 0;
    v2[1] = 0;
  }
  else
  {
    BOOL v6 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR);
    if (v6) {
      WiFiManagerClientUnscheduleFromRunLoop_cold_1(v6, v7, v8, v9, v10, v11, v12, v13);
    }
  }
}

uint64_t _wifi_manager_client_dispatch_notification(unsigned int a1, UInt8 *a2, unsigned int a3, unsigned int a4, unsigned int a5, UInt8 *a6, unsigned int a7, UInt8 *a8, unsigned int a9)
{
  uint64_t v16 = a9;
  uint64_t v17 = WiFiPortCacheCopy(a1);
  uint64_t v18 = a3;
  if (v17)
  {
    uint64_t v19 = v17;
    unsigned int v34 = a4;
    unsigned int v35 = a5;
    CFPropertyListRef v20 = _WiFiCopyUnserialized(a2, a3);
    if (!v20)
    {
LABEL_19:
      CFRelease(v19);
      goto LABEL_20;
    }
    CFPropertyListRef v21 = v20;
    Device = WiFiManagerClientGetDevice((uint64_t)v19, v20);
    CFPropertyListRef v22 = _WiFiCopyUnserialized(a6, a7);
    CFNumberRef v23 = v22;
    CFTypeRef v36 = v21;
    if (v22)
    {
      CFTypeID v24 = CFGetTypeID(v22);
      if (v24 != CFDictionaryGetTypeID())
      {
        int v25 = 0;
        BOOL v27 = 0;
LABEL_13:
        CFRelease(v23);
LABEL_14:
        if (v27) {
          CFRelease(v27);
        }
        if (v25) {
          CFRelease(v25);
        }
        CFRelease(v36);
        goto LABEL_19;
      }
      int v25 = WiFiNetworkCreate(*MEMORY[0x1E4F1CF80], v23);
    }
    else
    {
      int v25 = 0;
    }
    CFPropertyListRef v26 = _WiFiCopyUnserialized(a8, a9);
    BOOL v27 = v26;
    if (!v26 || (v28 = a8, v29 = CFGetTypeID(v26), v30 = v29 == CFDictionaryGetTypeID(), a8 = v28, uint64_t v16 = a9, v30))
    {
      BOOL v31 = (void (*)(void *, const void *, void, void, _WORD *, const void *, void))v19[14];
      if (v31) {
        v31(v19, Device, v34, v35, v25, v27, v19[15]);
      }
    }
    if (!v23) {
      goto LABEL_14;
    }
    goto LABEL_13;
  }
LABEL_20:
  _WiFiVMDealloc((uint64_t)a2, v18);
  _WiFiVMDealloc((uint64_t)a6, a7);
  _WiFiVMDealloc((uint64_t)a8, v16);
  return 0;
}

uint64_t _wifi_manager_client_dispatch_wow_state_change(unsigned int a1, unsigned __int8 a2)
{
  uint64_t v3 = WiFiPortCacheCopy(a1);
  if (v3)
  {
    CFStringRef v4 = v3;
    if ((*((unsigned char *)v3 + 73) & 0x20) != 0)
    {
      BOOL v5 = (void (*)(const void *, void, void))*((void *)v3 + 26);
      if (v5) {
        v5(v3, a2, *((void *)v3 + 27));
      }
    }
    CFRelease(v4);
  }
  return 0;
}

uint64_t _wifi_manager_client_dispatch_association_result(unsigned int a1, UInt8 *a2, unsigned int a3, UInt8 *a4, unsigned int a5, UInt8 *a6, unsigned int a7, unsigned int a8)
{
  BOOL v15 = WiFiPortCacheCopy(a1);
  uint64_t v16 = a3;
  if (v15)
  {
    uint64_t v17 = v15;
    CFPropertyListRef v18 = _WiFiCopyUnserialized(a2, a3);
    if (v18)
    {
      uint64_t v19 = v18;
      Device = WiFiManagerClientGetDevice((uint64_t)v17, v18);
      if (Device)
      {
        uint64_t v21 = (uint64_t)Device;
        unsigned int v37 = a8;
        CFPropertyListRef v22 = _WiFiCopyUnserialized(a4, a5);
        if (v22)
        {
          CFNumberRef v23 = v22;
          CFTypeRef v36 = v19;
          CFTypeID v24 = WiFiNetworkCreate(*MEMORY[0x1E4F1CF80], v22);
          if (v24)
          {
            int v25 = v24;
            unsigned int v35 = v17;
            uint64_t v26 = v16;
            BOOL v27 = a2;
            unsigned int v28 = a5;
            CFTypeID v29 = a4;
            unsigned int v30 = a7;
            CFIndex v31 = a7;
            uint64_t v32 = a6;
            CFPropertyListRef v33 = _WiFiCopyUnserialized(a6, v31);
            _WiFiDeviceClientDispatchAssociationResult(v21, (uint64_t)v25, (uint64_t)v33, v37);
            if (v33) {
              CFRelease(v33);
            }
            CFRelease(v25);
            a6 = v32;
            a7 = v30;
            a4 = v29;
            a5 = v28;
            a2 = v27;
            uint64_t v16 = v26;
            uint64_t v17 = v35;
          }
          else
          {
            _WiFiDeviceClientDispatchAssociationResult(v21, 0, 0, v37);
          }
          CFRelease(v23);
          uint64_t v19 = v36;
        }
        else
        {
          _WiFiDeviceClientDispatchAssociationResult(v21, 0, 0, a8);
        }
      }
      CFRelease(v19);
    }
    CFRelease(v17);
  }
  _WiFiVMDealloc((uint64_t)a2, v16);
  _WiFiVMDealloc((uint64_t)a4, a5);
  _WiFiVMDealloc((uint64_t)a6, a7);
  return 0;
}

uint64_t _wifi_manager_client_dispatch_start_network_result(unsigned int a1, UInt8 *a2, unsigned int a3, unsigned int a4, UInt8 *a5, unsigned int a6, UInt8 *a7, unsigned int a8)
{
  __int16 v14 = WiFiPortCacheCopy(a1);
  uint64_t v15 = a3;
  if (v14)
  {
    uint64_t v16 = v14;
    CFPropertyListRef v17 = _WiFiCopyUnserialized(a2, a3);
    if (!v17)
    {
LABEL_17:
      CFRelease(v16);
      goto LABEL_18;
    }
    CFPropertyListRef v18 = v17;
    CFPropertyListRef v33 = v16;
    Device = WiFiManagerClientGetDevice((uint64_t)v16, v17);
    if (Device)
    {
      uint64_t v20 = (uint64_t)Device;
      uint64_t v21 = 0;
      CFPropertyListRef v22 = 0;
      if (!a5 || !a6)
      {
LABEL_8:
        uint64_t v32 = v15;
        if (a7 && a8)
        {
          CFTypeID v24 = a5;
          int v25 = a2;
          unsigned int v26 = a6;
          unsigned int v27 = a8;
          CFPropertyListRef v28 = _WiFiCopyUnserialized(a7, a8);
          if (v28)
          {
            CFTypeID v29 = v28;
            _WiFiDeviceClientDispatchStartNetworkResult(v20, a4, (uint64_t)v22, (uint64_t)v28);
            CFRelease(v29);
          }
          if (!v22) {
            goto LABEL_14;
          }
        }
        else
        {
          CFTypeID v24 = a5;
          int v25 = a2;
          unsigned int v26 = a6;
          unsigned int v27 = a8;
          _WiFiDeviceClientDispatchStartNetworkResult(v20, a4, (uint64_t)v22, 0);
          if (!v22)
          {
LABEL_14:
            a8 = v27;
            a6 = v26;
            a2 = v25;
            a5 = v24;
            uint64_t v15 = v32;
            if (v21) {
              CFRelease(v21);
            }
            goto LABEL_16;
          }
        }
        CFRelease(v22);
        goto LABEL_14;
      }
      CFPropertyListRef v23 = _WiFiCopyUnserialized(a5, a6);
      if (v23)
      {
        uint64_t v21 = v23;
        CFPropertyListRef v22 = WiFiNetworkCreate(*MEMORY[0x1E4F1CF80], v23);
        goto LABEL_8;
      }
    }
LABEL_16:
    CFRelease(v18);
    uint64_t v16 = v33;
    goto LABEL_17;
  }
LABEL_18:
  _WiFiVMDealloc((uint64_t)a2, v15);
  _WiFiVMDealloc((uint64_t)a5, a6);
  _WiFiVMDealloc((uint64_t)a7, a8);
  return 0;
}

uint64_t _wifi_manager_client_dispatch_stop_network_result(unsigned int a1, UInt8 *a2, unsigned int a3, uint64_t a4, UInt8 *a5, unsigned int a6)
{
  uint64_t v11 = WiFiPortCacheCopy(a1);
  if (v11)
  {
    uint64_t v12 = v11;
    CFPropertyListRef v13 = _WiFiCopyUnserialized(a2, a3);
    if (v13)
    {
      __int16 v14 = v13;
      Device = WiFiManagerClientGetDevice((uint64_t)v12, v13);
      if (Device)
      {
        uint64_t v16 = (uint64_t)Device;
        if (a5 && a6)
        {
          CFPropertyListRef v17 = _WiFiCopyUnserialized(a5, a6);
          if (v17)
          {
            CFPropertyListRef v18 = v17;
            _WiFiDeviceClientDispatchStopNetworkResult(v16, a4, (uint64_t)v17);
            CFRelease(v18);
          }
        }
        else
        {
          _WiFiDeviceClientDispatchStopNetworkResult((uint64_t)Device, a4, 0);
        }
      }
      CFRelease(v14);
    }
    CFRelease(v12);
  }
  _WiFiVMDealloc((uint64_t)a2, a3);
  _WiFiVMDealloc((uint64_t)a5, a6);
  return 0;
}

uint64_t _wifi_manager_client_dispatch_gas_results(unsigned int a1, UInt8 *a2, unsigned int a3, UInt8 *a4, unsigned int a5, uint64_t a6)
{
  uint64_t v11 = WiFiPortCacheCopy(a1);
  if (v11)
  {
    uint64_t v12 = v11;
    CFPropertyListRef v13 = _WiFiCopyUnserialized(a2, a3);
    if (v13)
    {
      __int16 v14 = v13;
      Device = WiFiManagerClientGetDevice((uint64_t)v12, v13);
      if (Device)
      {
        uint64_t v16 = (uint64_t)Device;
        CFArrayRef v17 = (const __CFArray *)_WiFiCopyUnserialized(a4, a5);
        if (v17)
        {
          CFArrayRef v18 = v17;
          NetworksFromRecords = _WiFiCreateNetworksFromRecords(v17);
          _WiFiDeviceClientDispatchGasResults(v16, (uint64_t)NetworksFromRecords, a6);
          if (NetworksFromRecords) {
            CFRelease(NetworksFromRecords);
          }
          CFRelease(v18);
        }
        else
        {
          _WiFiDeviceClientDispatchGasResults(v16, 0, a6);
        }
      }
      CFRelease(v14);
    }
    CFRelease(v12);
  }
  _WiFiVMDealloc((uint64_t)a2, a3);
  _WiFiVMDealloc((uint64_t)a4, a5);
  return 0;
}

uint64_t _wifi_manager_client_dispatch_ranging_result(unsigned int a1, UInt8 *a2, unsigned int a3, UInt8 *a4, unsigned int a5, uint64_t a6)
{
  uint64_t v11 = WiFiPortCacheCopy(a1);
  if (v11)
  {
    uint64_t v12 = v11;
    CFPropertyListRef v13 = _WiFiCopyUnserialized(a2, a3);
    if (v13)
    {
      __int16 v14 = v13;
      Device = WiFiManagerClientGetDevice((uint64_t)v12, v13);
      if (Device)
      {
        uint64_t v16 = (uint64_t)Device;
        CFPropertyListRef v17 = _WiFiCopyUnserialized(a4, a5);
        _WiFiDeviceClientDispatchRangingResult(v16, (uint64_t)v17, a6);
        if (v17) {
          CFRelease(v17);
        }
      }
      CFRelease(v14);
    }
    CFRelease(v12);
  }
  _WiFiVMDealloc((uint64_t)a2, a3);
  _WiFiVMDealloc((uint64_t)a4, a5);
  return 0;
}

uint64_t _wifi_manager_client_dispatch_add_network_async(unsigned int a1, UInt8 *a2, unsigned int a3, uint64_t a4)
{
  uint64_t v7 = WiFiPortCacheCopy(a1);
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = 0;
    uint64_t v10 = 0;
    if (!a2 || !a3) {
      goto LABEL_6;
    }
    CFPropertyListRef v11 = _WiFiCopyUnserialized(a2, a3);
    if (!v11)
    {
LABEL_12:
      CFRelease(v8);
      goto LABEL_13;
    }
    uint64_t v9 = v11;
    uint64_t v10 = WiFiNetworkCreate(*MEMORY[0x1E4F1CF80], v11);
    if (v10)
    {
LABEL_6:
      uint64_t v12 = (void (*)(void *, _WORD *, uint64_t, void))v8[32];
      if (v12)
      {
        v12(v8, v10, a4, v8[33]);
        v8[32] = 0;
        v8[33] = 0;
      }
      if (v10) {
        CFRelease(v10);
      }
      if (!v9) {
        goto LABEL_12;
      }
    }
    CFRelease(v9);
    goto LABEL_12;
  }
LABEL_13:
  _WiFiVMDealloc((uint64_t)a2, a3);
  return 0;
}

void WiFiManagerClientAddPolicy(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = (mach_port_name_t *)__WiFiManagerClientGetOrReconnectServerPort(a1, 0);
  if (v3)
  {
    CFDictionaryRef v4 = WiFiPolicyCopyRecord(a2);
    if (v4)
    {
      CFDictionaryRef v5 = v4;
      CFDataRef BinaryData = (const __CFData *)_CFPropertyListCreateBinaryData((CFAllocatorRef)*MEMORY[0x1E4F1CF80], v4);
      if (BinaryData)
      {
        CFDataRef v7 = BinaryData;
        int v8 = v3[1];
        BytePtr = CFDataGetBytePtr(BinaryData);
        int Length = CFDataGetLength(v7);
        wifi_manager_add_policy(v8, (uint64_t)BytePtr, Length, 0);
        CFRelease(v7);
      }
      CFRelease(v5);
    }
  }

  WiFiSendRightRelease(v3);
}

void WiFiManagerClientRemovePolicy(uint64_t a1, const void *a2)
{
  uint64_t v3 = (mach_port_name_t *)__WiFiManagerClientGetOrReconnectServerPort(a1, 0);
  if (!v3) {
    goto LABEL_10;
  }
  uint64_t TypeID = WiFiPolicyGetTypeID();
  if (TypeID == CFGetTypeID(a2))
  {
    CFDictionaryRef v5 = WiFiPolicyCopyRecord((uint64_t)a2);
    if (!v5) {
      goto LABEL_10;
    }
    CFDictionaryRef v6 = v5;
    CFDataRef BinaryData = (const __CFData *)_CFPropertyListCreateBinaryData((CFAllocatorRef)*MEMORY[0x1E4F1CF80], v5);
    if (!BinaryData) {
      goto LABEL_8;
    }
  }
  else
  {
    CFDataRef BinaryData = (const __CFData *)_CFPropertyListCreateBinaryData((CFAllocatorRef)*MEMORY[0x1E4F1CF80], a2);
    CFDictionaryRef v6 = 0;
    if (!BinaryData) {
      goto LABEL_8;
    }
  }
  int v8 = v3[1];
  BytePtr = CFDataGetBytePtr(BinaryData);
  int Length = CFDataGetLength(BinaryData);
  wifi_manager_remove_policy(v8, (uint64_t)BytePtr, Length, 0);
  CFRelease(BinaryData);
LABEL_8:
  if (v6) {
    CFRelease(v6);
  }
LABEL_10:

  WiFiSendRightRelease(v3);
}

__CFArray *WiFiManagerClientCopyPolicies(uint64_t a1)
{
  memset(length, 0, sizeof(length));
  uint64_t v1 = __WiFiManagerClientGetOrReconnectServerPort(a1, 0);
  CFDictionaryRef v2 = (mach_port_name_t *)v1;
  if (v1
    && ((wifi_manager_copy_policies(v1[1], &length[1], length), *(void *)&length[1])
      ? (BOOL v3 = length[0] == 0)
      : (BOOL v3 = 1),
        !v3 && (CFArrayRef v4 = (const __CFArray *)_WiFiCopyUnserialized(*(UInt8 **)&length[1], length[0])) != 0))
  {
    CFArrayRef v5 = v4;
    CFAllocatorRef v6 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
    CFMutableSetRef Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, MEMORY[0x1E4F1D510]);
    if (Mutable)
    {
      CFIndex Count = CFArrayGetCount(v5);
      if (Count >= 1)
      {
        CFIndex v9 = Count;
        for (CFIndex i = 0; i != v9; ++i)
        {
          CFDictionaryRef ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(v5, i);
          if (ValueAtIndex)
          {
            uint64_t v12 = WiFiPolicyCreate(v6, ValueAtIndex);
            if (v12)
            {
              CFPropertyListRef v13 = v12;
              CFArrayAppendValue(Mutable, v12);
              CFRelease(v13);
            }
          }
        }
      }
    }
    CFRelease(v5);
  }
  else
  {
    CFMutableSetRef Mutable = 0;
  }
  _WiFiVMDealloc(*(uint64_t *)&length[1], length[0]);
  WiFiSendRightRelease(v2);
  return Mutable;
}

void WiFiManagerClientSetInCarState(uint64_t a1, int a2, const __CFData *a3)
{
  uint64_t v6 = kdebug_trace();
  CFDataRef v7 = __WiFiManagerClientGetOrReconnectServerPort(a1, 0);
  if (v7)
  {
    int v8 = v7;
    if (a3
      && (CFDataRef BinaryData = (const __CFData *)_CFPropertyListCreateBinaryData((CFAllocatorRef)*MEMORY[0x1E4F1CF80], a3),
          (a3 = BinaryData) != 0))
    {
      BytePtr = CFDataGetBytePtr(BinaryData);
      int Length = CFDataGetLength(a3);
    }
    else
    {
      BytePtr = 0;
      int Length = 0;
    }
    wifi_manager_set_incar_state(v8[1], a2, (uint64_t)BytePtr, Length);
    if (a3) {
      CFRelease(a3);
    }
    WiFiSendRightRelease((mach_port_name_t *)v8);
  }
  else
  {
    uint64_t v12 = (void *)MEMORY[0x1C18A51F0]();
  }
}

void WiFiManagerClientSetThermalIndex(uint64_t a1, int a2)
{
  BOOL v3 = __WiFiManagerClientGetOrReconnectServerPort(a1, 0);
  if (v3)
  {
    CFArrayRef v4 = (mach_port_name_t *)v3;
    wifi_manager_set_thermal_index(v3[1], a2);
    WiFiSendRightRelease(v4);
  }
}

uint64_t WiFiManagerClientGetThermalIndex(uint64_t a1)
{
  unsigned int v4 = 100;
  uint64_t v1 = __WiFiManagerClientGetOrReconnectServerPort(a1, 0);
  CFDictionaryRef v2 = (mach_port_name_t *)v1;
  if (v1) {
    wifi_manager_get_thermal_index(v1[1], &v4);
  }
  WiFiSendRightRelease(v2);
  return v4;
}

CFPropertyListRef WiFiManagerClientCopyLeechedLocation(uint64_t a1)
{
  memset(length, 0, sizeof(length));
  uint64_t v1 = __WiFiManagerClientGetOrReconnectServerPort(a1, 0);
  CFDictionaryRef v2 = (mach_port_name_t *)v1;
  if (!v1)
  {
    unsigned int v3 = 0;
LABEL_9:
    CFPropertyListRef v5 = 0;
    goto LABEL_7;
  }
  wifi_manager_copy_leeched_location(v1[1], &length[1], length);
  uint64_t v1 = *(atomic_uint **)&length[1];
  unsigned int v3 = length[0];
  if (*(void *)&length[1]) {
    BOOL v4 = length[0] == 0;
  }
  else {
    BOOL v4 = 1;
  }
  if (v4) {
    goto LABEL_9;
  }
  CFPropertyListRef v5 = _WiFiCopyUnserialized(*(UInt8 **)&length[1], length[0]);
  uint64_t v1 = *(atomic_uint **)&length[1];
  unsigned int v3 = length[0];
LABEL_7:
  _WiFiVMDealloc((uint64_t)v1, v3);
  WiFiSendRightRelease(v2);
  return v5;
}

CFPropertyListRef WiFiManagerClientCopyGeoTagsForNetwork(uint64_t a1, uint64_t a2)
{
  memset(length, 0, sizeof(length));
  if (!a1)
  {
    uint64_t v13 = 0;
    uint64_t v12 = 0;
    unsigned int v3 = 0;
    goto LABEL_14;
  }
  unsigned int v3 = (mach_port_name_t *)__WiFiManagerClientGetOrReconnectServerPort(a1, 0);
  if (!v3 || (CFDictionaryRef v4 = WiFiNetworkCopyRecord(a2)) == 0)
  {
    uint64_t v13 = 0;
    uint64_t v12 = 0;
LABEL_14:
    CFPropertyListRef v11 = 0;
    goto LABEL_10;
  }
  CFDictionaryRef v5 = v4;
  CFDataRef BinaryData = (const __CFData *)_CFPropertyListCreateBinaryData((CFAllocatorRef)*MEMORY[0x1E4F1CF80], v4);
  if (BinaryData)
  {
    CFDataRef v7 = BinaryData;
    int v8 = v3[1];
    BytePtr = CFDataGetBytePtr(BinaryData);
    int v10 = CFDataGetLength(v7);
    wifi_manager_copy_geotags_for_network(v8, (uint64_t)BytePtr, v10, &length[1], length);
    if (!*(void *)&length[1] || !length[0] || (CFPropertyListRef v11 = _WiFiCopyUnserialized(*(UInt8 **)&length[1], length[0])) == 0)
    {
      CFPropertyListRef v11 = 0;
    }
    CFRelease(v7);
  }
  else
  {
    CFPropertyListRef v11 = 0;
  }
  CFRelease(v5);
  uint64_t v12 = *(void *)&length[1];
  uint64_t v13 = length[0];
LABEL_10:
  _WiFiVMDealloc(v12, v13);
  WiFiSendRightRelease(v3);
  return v11;
}

uint64_t WiFiManagerClientSetGeoTagForNetwork(uint64_t a1, uint64_t a2, double a3, double a4)
{
  if (!a1)
  {
    CFDataRef v7 = 0;
    goto LABEL_10;
  }
  CFDataRef v7 = (mach_port_name_t *)__WiFiManagerClientGetOrReconnectServerPort(a1, 0);
  if (!v7 || (CFDictionaryRef v8 = WiFiNetworkCopyRecord(a2)) == 0)
  {
LABEL_10:
    uint64_t v15 = 74;
    goto LABEL_7;
  }
  CFDictionaryRef v9 = v8;
  CFDataRef BinaryData = (const __CFData *)_CFPropertyListCreateBinaryData((CFAllocatorRef)*MEMORY[0x1E4F1CF80], v8);
  if (BinaryData)
  {
    CFDataRef v11 = BinaryData;
    int v12 = v7[1];
    BytePtr = CFDataGetBytePtr(BinaryData);
    int Length = CFDataGetLength(v11);
    wifi_manager_set_geotag_for_network(v12, (uint64_t)BytePtr, Length, a3, a4);
    CFRelease(v11);
    uint64_t v15 = 0;
  }
  else
  {
    uint64_t v15 = 74;
  }
  CFRelease(v9);
LABEL_7:
  WiFiSendRightRelease(v7);
  return v15;
}

__CFArray *WiFiManagerClientCopyKnownNetworksNearLocation(uint64_t a1, double a2, double a3)
{
  memset(length, 0, sizeof(length));
  if (a1)
  {
    CFDictionaryRef v5 = __WiFiManagerClientGetOrReconnectServerPort(a1, 0);
    uint64_t v6 = (mach_port_name_t *)v5;
    if (v5
      && (wifi_manager_copy_networks_at_location(v5[1], 0, &length[1], length, a2, a3), *(void *)&length[1])
      && length[0]
      && (CFArrayRef v7 = (const __CFArray *)_WiFiCopyUnserialized(*(UInt8 **)&length[1], length[0])) != 0)
    {
      CFArrayRef v8 = v7;
      NetworksFromRecords = _WiFiCreateNetworksFromRecords(v7);
      if (!NetworksFromRecords) {
      CFRelease(v8);
      }
    }
    else
    {
      NetworksFromRecords = 0;
    }
  }
  else
  {
    NetworksFromRecords = 0;
    uint64_t v6 = 0;
  }
  _WiFiVMDealloc(*(uint64_t *)&length[1], length[0]);
  WiFiSendRightRelease(v6);
  return NetworksFromRecords;
}

__CFArray *WiFiManagerClientCopyScoreSortedKnownNetworksNearLocation(uint64_t a1, double a2, double a3)
{
  memset(length, 0, sizeof(length));
  if (a1)
  {
    CFDictionaryRef v5 = __WiFiManagerClientGetOrReconnectServerPort(a1, 0);
    uint64_t v6 = (mach_port_name_t *)v5;
    if (v5
      && (wifi_manager_copy_networks_at_location(v5[1], 1, &length[1], length, a2, a3), *(void *)&length[1])
      && length[0]
      && (CFArrayRef v7 = (const __CFArray *)_WiFiCopyUnserialized(*(UInt8 **)&length[1], length[0])) != 0)
    {
      CFArrayRef v8 = v7;
      NetworksFromRecords = _WiFiCreateNetworksFromRecords(v7);
      if (!NetworksFromRecords) {
      CFRelease(v8);
      }
    }
    else
    {
      NetworksFromRecords = 0;
    }
  }
  else
  {
    NetworksFromRecords = 0;
    uint64_t v6 = 0;
  }
  _WiFiVMDealloc(*(uint64_t *)&length[1], length[0]);
  WiFiSendRightRelease(v6);
  return NetworksFromRecords;
}

CFPropertyListRef WiFiManagerClientCopyScoreForNetwork(uint64_t a1, uint64_t a2)
{
  memset(length, 0, sizeof(length));
  if (!a1)
  {
    uint64_t v13 = 0;
    uint64_t v12 = 0;
    unsigned int v3 = 0;
    goto LABEL_14;
  }
  unsigned int v3 = (mach_port_name_t *)__WiFiManagerClientGetOrReconnectServerPort(a1, 0);
  if (!v3 || (CFDictionaryRef v4 = WiFiNetworkCopyRecord(a2)) == 0)
  {
    uint64_t v13 = 0;
    uint64_t v12 = 0;
LABEL_14:
    CFPropertyListRef v11 = 0;
    goto LABEL_10;
  }
  CFDictionaryRef v5 = v4;
  CFDataRef BinaryData = (const __CFData *)_CFPropertyListCreateBinaryData((CFAllocatorRef)*MEMORY[0x1E4F1CF80], v4);
  if (BinaryData)
  {
    CFDataRef v7 = BinaryData;
    int v8 = v3[1];
    BytePtr = CFDataGetBytePtr(BinaryData);
    int v10 = CFDataGetLength(v7);
    wifi_manager_copy_score_for_network(v8, (uint64_t)BytePtr, v10, &length[1], length);
    if (!*(void *)&length[1] || !length[0] || (CFPropertyListRef v11 = _WiFiCopyUnserialized(*(UInt8 **)&length[1], length[0])) == 0)
    {
      CFPropertyListRef v11 = 0;
    }
    CFRelease(v7);
  }
  else
  {
    CFPropertyListRef v11 = 0;
  }
  CFRelease(v5);
  uint64_t v12 = *(void *)&length[1];
  uint64_t v13 = length[0];
LABEL_10:
  _WiFiVMDealloc(v12, v13);
  WiFiSendRightRelease(v3);
  return v11;
}

CFPropertyListRef WiFiManagerClientCopySoftErrorCounters(uint64_t a1)
{
  memset(length, 0, sizeof(length));
  uint64_t v1 = __WiFiManagerClientGetOrReconnectServerPort(a1, 0);
  CFDictionaryRef v2 = (mach_port_name_t *)v1;
  if (!v1)
  {
    unsigned int v3 = 0;
LABEL_9:
    CFPropertyListRef v5 = 0;
    goto LABEL_7;
  }
  wifi_manager_copy_softerror_counters(v1[1], &length[1], length);
  uint64_t v1 = *(atomic_uint **)&length[1];
  unsigned int v3 = length[0];
  if (*(void *)&length[1]) {
    BOOL v4 = length[0] == 0;
  }
  else {
    BOOL v4 = 1;
  }
  if (v4) {
    goto LABEL_9;
  }
  CFPropertyListRef v5 = _WiFiCopyUnserialized(*(UInt8 **)&length[1], length[0]);
  uint64_t v1 = *(atomic_uint **)&length[1];
  unsigned int v3 = length[0];
LABEL_7:
  _WiFiVMDealloc((uint64_t)v1, v3);
  WiFiSendRightRelease(v2);
  return v5;
}

BOOL WiFiManagerClientGetAirplaneModePowerPreference(uint64_t a1)
{
  if (!a1)
  {
    return 0;
  }
  CFPropertyListRef v1 = WiFiManagerClientCopyProperty(a1, @"KeepWiFiPoweredAirplaneMode");
  if (!v1) {
    return 0;
  }
  CFDictionaryRef v2 = v1;
  CFTypeID TypeID = CFBooleanGetTypeID();
  BOOL v4 = TypeID == CFGetTypeID(v2) && CFBooleanGetValue((CFBooleanRef)v2) != 0;
  CFRelease(v2);
  return v4;
}

void WiFiManagerClientSetAirplaneModePowerPreference(uint64_t a1, int a2)
{
  if (a1)
  {
    CFDictionaryRef v2 = (const __CFData **)MEMORY[0x1E4F1CFD0];
    if (!a2) {
      CFDictionaryRef v2 = (const __CFData **)MEMORY[0x1E4F1CFC8];
    }
    CFDataRef v3 = *v2;
    WiFiManagerClientSetProperty(a1, @"KeepWiFiPoweredAirplaneMode", v3);
  }
  else
  {
    BOOL v4 = (void *)MEMORY[0x1C18A51F0]();
  }
}

_WORD *WiFiManagerClientCopyCurrentSessionBasedNetwork(uint64_t a1)
{
  memset(length, 0, sizeof(length));
  CFPropertyListRef v1 = __WiFiManagerClientGetOrReconnectServerPort(a1, 0);
  CFDictionaryRef v2 = (mach_port_name_t *)v1;
  if (v1
    && (wifi_manager_copy_current_session_based_network(v1[1], &length[1], length),
        (CFPropertyListRef v3 = _WiFiCopyUnserialized(*(UInt8 **)&length[1], length[0])) != 0))
  {
    BOOL v4 = v3;
    CFPropertyListRef v5 = WiFiNetworkCreate(*MEMORY[0x1E4F1CF80], v3);
    CFRelease(v4);
  }
  else
  {
    CFPropertyListRef v5 = 0;
  }
  _WiFiVMDealloc(*(uint64_t *)&length[1], length[0]);
  WiFiSendRightRelease(v2);
  return v5;
}

uint64_t WiFiManagerClientGetUserAutoJoinState(uint64_t a1)
{
  int v4 = 0;
  CFPropertyListRef v1 = __WiFiManagerClientGetOrReconnectServerPort(a1, 0);
  CFDictionaryRef v2 = (mach_port_name_t *)v1;
  if (v1) {
    wifi_manager_get_user_auto_join_state(v1[1], &v4);
  }
  WiFiSendRightRelease(v2);
  return v4;
}

void WiFiManagerClientEnableUserAutoJoin(uint64_t a1)
{
  CFPropertyListRef v1 = __WiFiManagerClientGetOrReconnectServerPort(a1, 0);
  if (v1)
  {
    CFDictionaryRef v2 = (mach_port_name_t *)v1;
    wifi_manager_set_user_auto_join_state(v1[1], 1);
    WiFiSendRightRelease(v2);
  }
}

void WiFiManagerClientDisableUserAutoJoin(uint64_t a1)
{
  CFPropertyListRef v1 = __WiFiManagerClientGetOrReconnectServerPort(a1, 0);
  if (v1)
  {
    CFDictionaryRef v2 = (mach_port_name_t *)v1;
    wifi_manager_set_user_auto_join_state(v1[1], 0);
    WiFiSendRightRelease(v2);
  }
}

void WiFiManagerClientRegisterUserAutoJoinStateChangedCallback(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)(a1 + 272) = a2;
  *(void *)(a1 + 280) = a3;
  if (a2) {
    __WiFiManagerClientOrEventMask(a1, 0x4000000);
  }
  else {
    __WiFiManagerClientAndEventMask(a1, -67108865);
  }
}

uint64_t _wifi_manager_client_dispatch_auto_join_state_change(unsigned int a1, unsigned __int8 a2, UInt8 *a3, unsigned int a4)
{
  CFDataRef v7 = WiFiPortCacheCopy(a1);
  if (v7)
  {
    int v8 = v7;
    CFPropertyListRef v9 = _WiFiCopyUnserialized(a3, a4);
    if ((*((unsigned char *)v8 + 75) & 4) != 0)
    {
      int v10 = (void (*)(void *, void, CFPropertyListRef, void))v8[34];
      if (v10) {
        v10(v8, a2, v9, v8[35]);
      }
    }
    CFRelease(v8);
    if (v9) {
      CFRelease(v9);
    }
  }
  _WiFiVMDealloc((uint64_t)a3, a4);
  return 0;
}

uint64_t _wifi_manager_client_dispatch_managed_apple_id_state_change(unsigned int a1, unsigned __int8 a2)
{
  CFPropertyListRef v3 = WiFiPortCacheCopy(a1);
  if (v3)
  {
    int v4 = v3;
    if (*((unsigned char *)v3 + 76))
    {
      CFPropertyListRef v5 = (void (*)(const void *, void, void))*((void *)v3 + 38);
      if (v5) {
        v5(v3, a2, *((void *)v3 + 39));
      }
    }
    CFRelease(v4);
  }
  return 0;
}

void WiFiManagerClientRemoveOrphanedSCNetworkSets(uint64_t a1)
{
  CFPropertyListRef v1 = __WiFiManagerClientGetOrReconnectServerPort(a1, 0);
  if (v1)
  {
    CFDictionaryRef v2 = (mach_port_name_t *)v1;
    wifi_manager_remove_orphaned_sc_network_sets(v1[1]);
    WiFiSendRightRelease(v2);
  }
}

void WiFiManagerClientMigrateList(uint64_t a1)
{
  CFPropertyListRef v1 = __WiFiManagerClientGetOrReconnectServerPort(a1, 0);
  if (v1)
  {
    CFDictionaryRef v2 = (mach_port_name_t *)v1;
    wifi_manager_migrate_list(v1[1]);
    WiFiSendRightRelease(v2);
  }
}

void WiFiManagerClientRemoveUnusedNetworkGeotags(uint64_t a1, double a2)
{
  CFPropertyListRef v3 = __WiFiManagerClientGetOrReconnectServerPort(a1, 0);
  if (v3)
  {
    int v4 = (mach_port_name_t *)v3;
    wifi_manager_remove_unused_network_geotags(v3[1], a2);
    WiFiSendRightRelease(v4);
  }
}

void WiFiManagerClientScheduleUnusedNetworkGeotagsRemovalTest(uint64_t a1, int a2, double a3)
{
  CFPropertyListRef v5 = __WiFiManagerClientGetOrReconnectServerPort(a1, 0);
  if (v5)
  {
    uint64_t v6 = (mach_port_name_t *)v5;
    wifi_manager_schedule_unused_network_geotags_removal_test(v5[1], a2, a3);
    WiFiSendRightRelease(v6);
  }
}

void WiFiManagerClientUnScheduleUnusedNetworkGeotagsRemovalTest(uint64_t a1)
{
  CFPropertyListRef v1 = __WiFiManagerClientGetOrReconnectServerPort(a1, 0);
  if (v1)
  {
    CFDictionaryRef v2 = (mach_port_name_t *)v1;
    wifi_manager_unschedule_unused_network_geotags_removal_test(v1[1]);
    WiFiSendRightRelease(v2);
  }
}

void WiFiManagerClientRegisterPreferredNetworksChangedCallback(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)(a1 + 288) = a2;
  *(void *)(a1 + 296) = a3;
  if (a2) {
    __WiFiManagerClientOrEventMask(a1, 0x20000000);
  }
  else {
    __WiFiManagerClientAndEventMask(a1, -536870913);
  }
}

uint64_t _wifi_manager_client_dispatch_preferred_networks_change(unsigned int a1, UInt8 *a2, unsigned int a3)
{
  CFPropertyListRef v5 = WiFiPortCacheCopy(a1);
  if (v5)
  {
    uint64_t v6 = v5;
    CFPropertyListRef v7 = _WiFiCopyUnserialized(a2, a3);
    if (v7)
    {
      int v8 = v7;
      if ((*((unsigned char *)v6 + 75) & 0x20) != 0)
      {
        CFPropertyListRef v9 = (void (*)(void *, CFPropertyListRef, void))v6[36];
        if (v9) {
          v9(v6, v7, v6[37]);
        }
      }
      CFRelease(v6);
    }
    else
    {
      int v8 = v6;
    }
    CFRelease(v8);
  }
  _WiFiVMDealloc((uint64_t)a2, a3);
  return 0;
}

uint64_t WiFiManagerClientSimulateNotification(uint64_t a1, CFDictionaryRef a2, int a3, const __CFData *a4)
{
  if (!a1)
  {
    CFPropertyListRef v7 = 0;
    goto LABEL_20;
  }
  CFPropertyListRef v7 = __WiFiManagerClientGetOrReconnectServerPort(a1, 0);
  if (!v7) {
    goto LABEL_18;
  }
  int v8 = (CFAllocatorRef *)MEMORY[0x1E4F1CF80];
  if (!a2)
  {
    CFDataRef v11 = 0;
    BytePtr = 0;
    int Length = 0;
    if (a4) {
      goto LABEL_7;
    }
LABEL_10:
    uint64_t v15 = 0;
    int v16 = 0;
LABEL_11:
    wifi_manager_simulate_notification(v7[1], (uint64_t)BytePtr, Length, a3, (uint64_t)v15, v16);
    uint64_t v17 = 0;
    if (!v11) {
      goto LABEL_13;
    }
    goto LABEL_12;
  }
  CFDictionaryRef v9 = WiFiNetworkCopyRecord((uint64_t)a2);
  if (!v9)
  {
LABEL_18:
LABEL_20:
    uint64_t v17 = 74;
    goto LABEL_17;
  }
  a2 = v9;
  CFDataRef BinaryData = (const __CFData *)_CFPropertyListCreateBinaryData(*v8, v9);
  if (!BinaryData)
  {
    uint64_t v17 = 74;
LABEL_16:
    CFRelease(a2);
    goto LABEL_17;
  }
  CFDataRef v11 = BinaryData;
  BytePtr = CFDataGetBytePtr(BinaryData);
  int Length = CFDataGetLength(v11);
  if (!a4) {
    goto LABEL_10;
  }
LABEL_7:
  CFDataRef v14 = (const __CFData *)_CFPropertyListCreateBinaryData(*v8, a4);
  a4 = v14;
  if (v14)
  {
    uint64_t v15 = CFDataGetBytePtr(v14);
    int v16 = CFDataGetLength(a4);
    goto LABEL_11;
  }
  uint64_t v17 = 74;
  if (v11) {
LABEL_12:
  }
    CFRelease(v11);
LABEL_13:
  if (a4) {
    CFRelease(a4);
  }
  if (a2) {
    goto LABEL_16;
  }
LABEL_17:
  WiFiSendRightRelease((mach_port_name_t *)v7);
  return v17;
}

void WiFiManagerClientSetAutoInstantHotspotMode(uint64_t a1, int a2)
{
  CFPropertyListRef v3 = __WiFiManagerClientGetOrReconnectServerPort(a1, 0);
  if (v3)
  {
    int v4 = (mach_port_name_t *)v3;
    wifi_manager_set_auto_instant_hotspot_mode(v3[1], a2);
    WiFiSendRightRelease(v4);
  }
}

uint64_t WiFiManagerClientGetAutoInstantHotspotMode(uint64_t a1)
{
  unsigned int v4 = 1;
  CFPropertyListRef v1 = __WiFiManagerClientGetOrReconnectServerPort(a1, 0);
  CFDictionaryRef v2 = (mach_port_name_t *)v1;
  if (v1) {
    wifi_manager_get_auto_instant_hotspot_mode(v1[1], &v4);
  }
  WiFiSendRightRelease(v2);
  return v4;
}

void WiFiManagerClientSetShareMyPersonalHotspotMode(uint64_t a1, int a2)
{
  CFPropertyListRef v3 = __WiFiManagerClientGetOrReconnectServerPort(a1, 0);
  if (v3)
  {
    unsigned int v4 = (mach_port_name_t *)v3;
    wifi_manager_set_share_personal_hotspot_mode(v3[1], a2);
    WiFiSendRightRelease(v4);
  }
}

uint64_t WiFiManagerClientGetShareMyPersonalHotspotMode(uint64_t a1)
{
  unsigned int v4 = 1;
  CFPropertyListRef v1 = __WiFiManagerClientGetOrReconnectServerPort(a1, 0);
  CFDictionaryRef v2 = (mach_port_name_t *)v1;
  if (v1) {
    wifi_manager_get_share_personal_hotspot_mode(v1[1], &v4);
  }
  WiFiSendRightRelease(v2);
  return v4;
}

void WiFiManagerClientSetAutoInstantHotspotTestMode(uint64_t a1, int a2)
{
  CFPropertyListRef v3 = __WiFiManagerClientGetOrReconnectServerPort(a1, 0);
  if (v3)
  {
    unsigned int v4 = (mach_port_name_t *)v3;
    wifi_manager_set_auto_instant_hotspot_test_mode(v3[1], a2);
    WiFiSendRightRelease(v4);
  }
}

void WiFiManagerClientSetAutoInstantHotspotTriggerInterval(uint64_t a1, double a2)
{
  CFPropertyListRef v3 = __WiFiManagerClientGetOrReconnectServerPort(a1, 0);
  if (v3)
  {
    unsigned int v4 = (mach_port_name_t *)v3;
    wifi_manager_set_auto_instant_hotspot_trigger_interval(v3[1], a2);
    WiFiSendRightRelease(v4);
  }
}

uint64_t WiFiManagerClientTriggerGizmoSyncPasswordCheck(uint64_t a1)
{
  CFPropertyListRef v1 = __WiFiManagerClientGetOrReconnectServerPort(a1, 0);
  if (!v1) {
    return 0xFFFFFFFFLL;
  }
  CFDictionaryRef v2 = (mach_port_name_t *)v1;
  wifi_manager_tigger_gizmo_sync_password_check(v1[1]);
  WiFiSendRightRelease(v2);
  return 0;
}

CFPropertyListRef WiFiManagerClientCopySSIDRepresentingMostUsedNetworkGeoTaggedToCurrentDeviceLocation(uint64_t a1)
{
  memset(length, 0, sizeof(length));
  CFPropertyListRef v1 = __WiFiManagerClientGetOrReconnectServerPort(a1, 0);
  if (!v1) {
    return 0;
  }
  CFDictionaryRef v2 = (mach_port_name_t *)v1;
  wifi_manager_copy_ssid_most_used_geo_tagged_to_current_location(v1[1], &length[1], length);
  uint64_t v3 = *(void *)&length[1];
  unsigned int v4 = length[0];
  if (*(void *)&length[1]) {
    BOOL v5 = length[0] == 0;
  }
  else {
    BOOL v5 = 1;
  }
  if (v5)
  {
    CFPropertyListRef v6 = 0;
  }
  else
  {
    CFPropertyListRef v6 = _WiFiCopyUnserialized(*(UInt8 **)&length[1], length[0]);
    uint64_t v3 = *(void *)&length[1];
    unsigned int v4 = length[0];
  }
  _WiFiVMDealloc(v3, v4);
  WiFiSendRightRelease(v2);
  return v6;
}

uint64_t WiFiManagerClientIsHotspotWPA3PersonalSupported(uint64_t a1)
{
  int v4 = 0;
  CFPropertyListRef v1 = __WiFiManagerClientGetOrReconnectServerPort(a1, 0);
  CFDictionaryRef v2 = (mach_port_name_t *)v1;
  if (v1) {
    wifi_manager_is_hotspot_wpa3_personal_supported(v1[1], &v4);
  }
  WiFiSendRightRelease(v2);
  return v4;
}

BOOL WiFiManagerClientIsInfraAllowed(uint64_t a1)
{
  int v4 = 0;
  CFPropertyListRef v1 = __WiFiManagerClientGetOrReconnectServerPort(a1, 0);
  CFDictionaryRef v2 = (mach_port_name_t *)v1;
  if (v1) {
    wifi_manager_is_infra_allowed(v1[1], &v4);
  }
  WiFiSendRightRelease(v2);
  return v4 != 0;
}

BOOL WiFiManagerClientIsP2PAllowed(uint64_t a1)
{
  int v4 = 0;
  CFPropertyListRef v1 = __WiFiManagerClientGetOrReconnectServerPort(a1, 0);
  CFDictionaryRef v2 = (mach_port_name_t *)v1;
  if (v1) {
    wifi_manager_is_p2p_allowed(v1[1], &v4);
  }
  WiFiSendRightRelease(v2);
  return v4 != 0;
}

BOOL WiFiManagerClientSetNetworkProperty(uint64_t a1, uint64_t a2, const void *a3, const void *a4)
{
  int v24 = -3902;
  CFPropertyListRef v7 = (mach_port_name_t *)__WiFiManagerClientGetOrReconnectServerPort(a1, 0);
  if (!v7) {
    goto LABEL_18;
  }
  CFDictionaryRef v8 = WiFiNetworkCopyRecord(a2);
  if (!v8) {
    goto LABEL_18;
  }
  CFDictionaryRef v9 = v8;
  CFAllocatorRef v10 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  CFDataRef BinaryData = (const __CFData *)_CFPropertyListCreateBinaryData((CFAllocatorRef)*MEMORY[0x1E4F1CF80], v8);
  CFDataRef v12 = BinaryData;
  if (BinaryData)
  {
    BytePtr = CFDataGetBytePtr(BinaryData);
    int Length = CFDataGetLength(v12);
  }
  else
  {
    BytePtr = 0;
    int Length = 0;
  }
  CFDataRef v15 = (const __CFData *)_CFPropertyListCreateBinaryData(v10, a3);
  CFDataRef v16 = v15;
  if (v15)
  {
    uint64_t v17 = CFDataGetBytePtr(v15);
    int v18 = CFDataGetLength(v16);
    if (!a4) {
      goto LABEL_13;
    }
  }
  else
  {
    uint64_t v17 = 0;
    int v18 = 0;
    if (!a4) {
      goto LABEL_13;
    }
  }
  CFDataRef v19 = (const __CFData *)_CFPropertyListCreateBinaryData(v10, a4);
  if (v19)
  {
    CFDataRef v20 = v19;
    uint64_t v21 = CFDataGetBytePtr(v19);
    int v22 = CFDataGetLength(v20);
    wifi_manager_set_network_property(v7[1], (uint64_t)BytePtr, Length, (uint64_t)v17, v18, (uint64_t)v21, v22, &v24);
    CFRelease(v20);
    if (!v16) {
      goto LABEL_15;
    }
    goto LABEL_14;
  }
LABEL_13:
  wifi_manager_set_network_property(v7[1], (uint64_t)BytePtr, Length, (uint64_t)v17, v18, 0, 0, &v24);
  if (v16) {
LABEL_14:
  }
    CFRelease(v16);
LABEL_15:
  if (v12) {
    CFRelease(v12);
  }
  CFRelease(v9);
LABEL_18:
  WiFiSendRightRelease(v7);
  return v24 == 0;
}

atomic_uint *WiFiManagerClientSetFamilyHotspotPreferences(uint64_t a1, const void *a2)
{
  int v14 = -3902;
  uint64_t result = __WiFiManagerClientGetOrReconnectServerPort(a1, 0);
  if (result)
  {
    int v4 = (mach_port_name_t *)result;
    CFAllocatorRef v5 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
    CFDataRef BinaryData = (const __CFData *)_CFPropertyListCreateBinaryData((CFAllocatorRef)*MEMORY[0x1E4F1CF80], @"FamilyHotspotPreferences");
    CFDataRef v7 = BinaryData;
    if (BinaryData)
    {
      BytePtr = CFDataGetBytePtr(BinaryData);
      int Length = CFDataGetLength(v7);
      if (!a2) {
        goto LABEL_9;
      }
    }
    else
    {
      BytePtr = 0;
      int Length = 0;
      if (!a2) {
        goto LABEL_9;
      }
    }
    CFDataRef v10 = (const __CFData *)_CFPropertyListCreateBinaryData(v5, a2);
    if (v10)
    {
      CFDataRef v11 = v10;
      CFDataRef v12 = CFDataGetBytePtr(v10);
      int v13 = CFDataGetLength(v11);
      wifi_manager_set_property(v4[1], (uint64_t)BytePtr, Length, (uint64_t)v12, v13, &v14);
      CFRelease(v11);
      if (!v7) {
        goto LABEL_11;
      }
      goto LABEL_10;
    }
LABEL_9:
    wifi_manager_set_property(v4[1], (uint64_t)BytePtr, Length, 0, 0, &v14);
    if (!v7)
    {
LABEL_11:
      WiFiSendRightRelease(v4);
      return (atomic_uint *)(v14 == 0);
    }
LABEL_10:
    CFRelease(v7);
    goto LABEL_11;
  }
  return result;
}

CFPropertyListRef WiFiManagerClientCopyFamilyHotspotPreferences(uint64_t a1)
{
  memset(length, 0, sizeof(length));
  CFPropertyListRef v1 = __WiFiManagerClientGetOrReconnectServerPort(a1, 0);
  if (!v1) {
    return 0;
  }
  CFDictionaryRef v2 = (mach_port_name_t *)v1;
  wifi_manager_copy_family_hotspot_preferences(v1[1], &length[1], length);
  uint64_t v3 = *(void *)&length[1];
  unsigned int v4 = length[0];
  if (*(void *)&length[1]) {
    BOOL v5 = length[0] == 0;
  }
  else {
    BOOL v5 = 1;
  }
  if (v5)
  {
    CFPropertyListRef v6 = 0;
  }
  else
  {
    CFPropertyListRef v6 = _WiFiCopyUnserialized(*(UInt8 **)&length[1], length[0]);
    uint64_t v3 = *(void *)&length[1];
    unsigned int v4 = length[0];
  }
  _WiFiVMDealloc(v3, v4);
  WiFiSendRightRelease(v2);
  return v6;
}

void WiFiManagerClientSetBuiltInReceiver(uint64_t a1, int a2)
{
  uint64_t v3 = __WiFiManagerClientGetOrReconnectServerPort(a1, 0);
  if (v3)
  {
    unsigned int v4 = (mach_port_name_t *)v3;
    wifi_manager_set_built_in_receiver(v3[1], a2);
    WiFiSendRightRelease(v4);
  }
}

uint64_t WiFiManagerClientIsPersonalHotspotModificationDisabled(uint64_t a1)
{
  int v4 = 0;
  CFPropertyListRef v1 = __WiFiManagerClientGetOrReconnectServerPort(a1, 0);
  CFDictionaryRef v2 = (mach_port_name_t *)v1;
  if (v1) {
    wifi_manager_is_personal_hotspot_modification_disabled(v1[1], &v4);
  }
  WiFiSendRightRelease(v2);
  return v4;
}

void WiFiManagerClientRegisterUIEventCallback(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)(a1 + 320) = a2;
  *(void *)(a1 + 328) = a3;
  if (a2) {
    __WiFiManagerClientOrEventMask(a1, 0x200000000);
  }
  else {
    __WiFiManagerClientAndEventMask(a1, 0xFFFFFFFDFFFFFFFFLL);
  }
}

void WiFiManagerClientSetAdaptiveRoamingParams(uint64_t a1, const void *a2)
{
  uint64_t v3 = __WiFiManagerClientGetOrReconnectServerPort(a1, 0);
  if (v3)
  {
    int v4 = v3;
    if (a2
      && (CFDataRef BinaryData = (const __CFData *)_CFPropertyListCreateBinaryData((CFAllocatorRef)*MEMORY[0x1E4F1CF80], a2)) != 0)
    {
      CFDataRef v6 = BinaryData;
      BytePtr = CFDataGetBytePtr(BinaryData);
      int Length = CFDataGetLength(v6);
      wifi_manager_set_adaptive_roam_params(v4[1], (uint64_t)BytePtr, Length);
      CFRelease(v6);
    }
    else
    {
      wifi_manager_set_adaptive_roam_params(v4[1], 0, 0);
    }
    WiFiSendRightRelease((mach_port_name_t *)v4);
  }
}

uint64_t _wifi_manager_client_dispatch_ui_event(unsigned int a1, UInt8 *a2, unsigned int a3)
{
  BOOL v5 = WiFiPortCacheCopy(a1);
  if (v5)
  {
    CFDataRef v6 = v5;
    CFPropertyListRef v7 = _WiFiCopyUnserialized(a2, a3);
    if (v7)
    {
      CFDictionaryRef v8 = v7;
      if ((*((unsigned char *)v6 + 76) & 2) != 0)
      {
        CFDictionaryRef v9 = (void (*)(void *, CFPropertyListRef, void))v6[40];
        if (v9) {
          v9(v6, v7, v6[41]);
        }
      }
      CFRelease(v6);
    }
    else
    {
      CFDictionaryRef v8 = v6;
    }
    CFRelease(v8);
  }
  _WiFiVMDealloc((uint64_t)a2, a3);
  return 0;
}

CFPropertyListRef WiFiManagerClientCopyMacRandomisationParameters(uint64_t a1)
{
  memset(length, 0, sizeof(length));
  CFPropertyListRef v1 = __WiFiManagerClientGetOrReconnectServerPort(a1, 0);
  CFDictionaryRef v2 = (mach_port_name_t *)v1;
  if (!v1)
  {
    unsigned int v3 = 0;
LABEL_9:
    CFPropertyListRef v5 = 0;
    goto LABEL_7;
  }
  wifi_manager_get_mac_randomisation_parameters(v1[1], &length[1], length);
  CFPropertyListRef v1 = *(atomic_uint **)&length[1];
  unsigned int v3 = length[0];
  if (*(void *)&length[1]) {
    BOOL v4 = length[0] == 0;
  }
  else {
    BOOL v4 = 1;
  }
  if (v4) {
    goto LABEL_9;
  }
  CFPropertyListRef v5 = _WiFiCopyUnserialized(*(UInt8 **)&length[1], length[0]);
  CFPropertyListRef v1 = *(atomic_uint **)&length[1];
  unsigned int v3 = length[0];
LABEL_7:
  _WiFiVMDealloc((uint64_t)v1, v3);
  WiFiSendRightRelease(v2);
  return v5;
}

CFDataRef WiFiManagerClientGetPrivateMacNetworkSwitchState(uint64_t a1, const void *a2)
{
  unsigned int v9 = 0;
  unsigned int v3 = __WiFiManagerClientGetOrReconnectServerPort(a1, 0);
  if (!a2) {
    return 0;
  }
  BOOL v4 = (mach_port_name_t *)v3;
  CFDataRef result = (const __CFData *)_CFPropertyListCreateBinaryData((CFAllocatorRef)*MEMORY[0x1E4F1CF80], a2);
  if (result)
  {
    CFDataRef v6 = result;
    BytePtr = CFDataGetBytePtr(result);
    int Length = CFDataGetLength(v6);
    if (v4)
    {
      wifi_manager_get_privatemac_network_switch_state(v4[1], (uint64_t)BytePtr, Length, (int *)&v9);
      WiFiSendRightRelease(v4);
    }
    CFRelease(v6);
    return (const __CFData *)v9;
  }
  return result;
}

void WiFiManagerClientSetUserInteractionOverride(uint64_t a1, const void *a2)
{
  if (a1)
  {
    unsigned int v3 = __WiFiManagerClientGetOrReconnectServerPort(a1, 0);
    BOOL v4 = v3;
    if (v3)
    {
      if (!a2)
      {
        wifi_manager_set_user_interaction_override(v3[1], 0, 0);
        goto LABEL_7;
      }
      CFDataRef BinaryData = (const __CFData *)_CFPropertyListCreateBinaryData((CFAllocatorRef)*MEMORY[0x1E4F1CF80], a2);
      if (BinaryData)
      {
        CFDataRef v6 = BinaryData;
        BytePtr = CFDataGetBytePtr(BinaryData);
        int Length = CFDataGetLength(v6);
        wifi_manager_set_user_interaction_override(v4[1], (uint64_t)BytePtr, Length);
        CFRelease(v6);
        goto LABEL_7;
      }
    }
  }
  else
  {
    BOOL v4 = 0;
  }
LABEL_7:

  WiFiSendRightRelease((mach_port_name_t *)v4);
}

void WiFiManagerClientSetUserInteractionNwOverride(uint64_t a1, const void *a2)
{
  if (a1)
  {
    unsigned int v3 = __WiFiManagerClientGetOrReconnectServerPort(a1, 0);
    BOOL v4 = v3;
    if (v3)
    {
      if (!a2)
      {
        wifi_manager_set_user_interaction_nw_override(v3[1], 0, 0);
        goto LABEL_7;
      }
      CFDataRef BinaryData = (const __CFData *)_CFPropertyListCreateBinaryData((CFAllocatorRef)*MEMORY[0x1E4F1CF80], a2);
      if (BinaryData)
      {
        CFDataRef v6 = BinaryData;
        BytePtr = CFDataGetBytePtr(BinaryData);
        int Length = CFDataGetLength(v6);
        wifi_manager_set_user_interaction_nw_override(v4[1], (uint64_t)BytePtr, Length);
        CFRelease(v6);
        goto LABEL_7;
      }
    }
  }
  else
  {
    BOOL v4 = 0;
  }
LABEL_7:

  WiFiSendRightRelease((mach_port_name_t *)v4);
}

BOOL WiFiManagerClientSetPrivateMacPrefForScanRecord(uint64_t a1, const void *a2, const void *a3, int a4)
{
  int v19 = 0;
  CFAllocatorRef v7 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  CFDataRef BinaryData = (const __CFData *)_CFPropertyListCreateBinaryData((CFAllocatorRef)*MEMORY[0x1E4F1CF80], a2);
  CFDataRef v9 = BinaryData;
  if (BinaryData)
  {
    BytePtr = CFDataGetBytePtr(BinaryData);
    int Length = CFDataGetLength(v9);
  }
  else
  {
    BytePtr = 0;
    int Length = 0;
  }
  CFDataRef v12 = (const __CFData *)_CFPropertyListCreateBinaryData(v7, a3);
  CFDataRef v13 = v12;
  if (v12)
  {
    int v14 = CFDataGetBytePtr(v12);
    int v15 = CFDataGetLength(v13);
  }
  else
  {
    int v14 = 0;
    int v15 = 0;
  }
  CFDataRef v16 = __WiFiManagerClientGetOrReconnectServerPort(a1, 0);
  if (v16)
  {
    uint64_t v17 = (mach_port_name_t *)v16;
    wifi_manager_set_private_mac_pref(v16[1], (uint64_t)BytePtr, Length, a4, (uint64_t)v14, v15, &v19);
    WiFiSendRightRelease(v17);
  }
  if (v13) {
    CFRelease(v13);
  }
  if (v9) {
    CFRelease(v9);
  }
  return v19 == 0;
}

CFDataRef WiFiManagerClientCreatePrivateMacAddress(int a1, const __CFData *a2, const __CFData *a3, const __CFData *a4, CFStringRef theString)
{
  return WiFiNetworkCreatePrivateMacAddress(a2, a3, a4, theString);
}

void WiFiManagerClientSetMacRandomisationParams(uint64_t a1, const void *a2)
{
  unsigned int v3 = __WiFiManagerClientGetOrReconnectServerPort(a1, 0);
  if (v3)
  {
    BOOL v4 = v3;
    if (a2
      && (CFDataRef BinaryData = (const __CFData *)_CFPropertyListCreateBinaryData((CFAllocatorRef)*MEMORY[0x1E4F1CF80], a2)) != 0)
    {
      CFDataRef v6 = BinaryData;
      BytePtr = CFDataGetBytePtr(BinaryData);
      int Length = CFDataGetLength(v6);
      wifi_manager_set_mac_randomisation_params(v4[1], (uint64_t)BytePtr, Length);
      CFRelease(v6);
    }
    else
    {
      wifi_manager_set_mac_randomisation_params(v4[1], 0, 0);
    }
    WiFiSendRightRelease((mach_port_name_t *)v4);
  }
}

void WiFiManagerClientUpdatePrivateMacNetwork(uint64_t a1, uint64_t a2)
{
  unsigned int v3 = (mach_port_name_t *)__WiFiManagerClientGetOrReconnectServerPort(a1, 0);
  if (v3)
  {
    CFDictionaryRef v4 = WiFiNetworkCopyRecord(a2);
    if (v4)
    {
      CFDictionaryRef v5 = v4;
      CFDataRef BinaryData = (const __CFData *)_CFPropertyListCreateBinaryData((CFAllocatorRef)*MEMORY[0x1E4F1CF80], v4);
      if (BinaryData)
      {
        CFDataRef v7 = BinaryData;
        int v8 = v3[1];
        BytePtr = CFDataGetBytePtr(BinaryData);
        int Length = CFDataGetLength(v7);
        wifi_manager_update_privateMac_network(v8, (uint64_t)BytePtr, Length);
        CFRelease(v7);
      }
      CFRelease(v5);
    }
  }

  WiFiSendRightRelease(v3);
}

BOOL WiFiManagerClientPrivateMacIsQuickProbeRequired(uint64_t a1, uint64_t a2)
{
  int v12 = 0;
  unsigned int v3 = (mach_port_name_t *)__WiFiManagerClientGetOrReconnectServerPort(a1, 0);
  if (v3)
  {
    CFDictionaryRef v4 = WiFiNetworkCopyRecord(a2);
    if (v4)
    {
      CFDictionaryRef v5 = v4;
      CFDataRef BinaryData = (const __CFData *)_CFPropertyListCreateBinaryData((CFAllocatorRef)*MEMORY[0x1E4F1CF80], v4);
      if (BinaryData)
      {
        CFDataRef v7 = BinaryData;
        mach_port_t v8 = v3[1];
        BytePtr = CFDataGetBytePtr(BinaryData);
        int Length = CFDataGetLength(v7);
        wifi_manager_private_mac_is_quick_probe_required(v8, (uint64_t)BytePtr, Length, &v12);
        CFRelease(v7);
      }
      CFRelease(v5);
    }
  }
  WiFiSendRightRelease(v3);
  return v12 != 0;
}

void WiFiManagerClientPrivateMacReportProbeResult(uint64_t a1, uint64_t a2, int a3)
{
  CFDictionaryRef v5 = (mach_port_name_t *)__WiFiManagerClientGetOrReconnectServerPort(a1, 0);
  if (v5)
  {
    CFDictionaryRef v6 = WiFiNetworkCopyRecord(a2);
    if (v6)
    {
      CFDictionaryRef v7 = v6;
      CFDataRef BinaryData = (const __CFData *)_CFPropertyListCreateBinaryData((CFAllocatorRef)*MEMORY[0x1E4F1CF80], v6);
      if (BinaryData)
      {
        CFDataRef v9 = BinaryData;
        mach_port_t v10 = v5[1];
        BytePtr = CFDataGetBytePtr(BinaryData);
        int Length = CFDataGetLength(v9);
        wifi_manager_private_mac_probe_result(v10, a3, (uint64_t)BytePtr, Length);
        CFRelease(v9);
      }
      CFRelease(v7);
    }
  }

  WiFiSendRightRelease(v5);
}

uint64_t WiFiManagerClientIsMultiBand(uint64_t a1)
{
  int v4 = 0;
  CFPropertyListRef v1 = __WiFiManagerClientGetOrReconnectServerPort(a1, 0);
  CFDictionaryRef v2 = (mach_port_name_t *)v1;
  if (v1) {
    wifi_manager_is_multi_band(v1[1], &v4);
  }
  WiFiSendRightRelease(v2);
  return v4;
}

uint64_t WiFiManagerClientGetHardwareFailure(uint64_t a1)
{
  int v5 = -1;
  CFPropertyListRef v1 = __WiFiManagerClientGetOrReconnectServerPort(a1, 0);
  CFDictionaryRef v2 = (mach_port_name_t *)v1;
  if (v1)
  {
    wifi_manager_get_hardware_failure(v1[1], &v5);
    if (v5 == 1) {
      uint64_t v3 = 1;
    }
    else {
      uint64_t v3 = 2 * (v5 == 2);
    }
  }
  else
  {
    uint64_t v3 = 0;
  }
  WiFiSendRightRelease(v2);
  return v3;
}

void WiFiManagerClientResetNetworkSettings(uint64_t a1)
{
  CFPropertyListRef v1 = __WiFiManagerClientGetOrReconnectServerPort(a1, 0);
  CFDictionaryRef v2 = (mach_port_name_t *)v1;
  if (v1) {
    wifi_manager_reset_network_settings(v1[1]);
  }
  else {

  }
  WiFiSendRightRelease(v2);
}

void WiFiManagerClientPurgeExpiredKnownNetworks(uint64_t a1)
{
  CFPropertyListRef v1 = __WiFiManagerClientGetOrReconnectServerPort(a1, 0);
  CFDictionaryRef v2 = (mach_port_name_t *)v1;
  if (v1) {
    wifi_manager_purge_expired_known_networks(v1[1]);
  }
  else {

  }
  WiFiSendRightRelease(v2);
}

void WiFiManagerClientCleanupLogBufferFiles(uint64_t a1)
{
  CFPropertyListRef v1 = __WiFiManagerClientGetOrReconnectServerPort(a1, 0);
  if (v1)
  {
    CFDictionaryRef v2 = (mach_port_name_t *)v1;
    wifi_manager_cleanup_log_buffer_files(v1[1]);
    WiFiSendRightRelease(v2);
  }
}

void WiFiManagerClientWiFiCallHandoverNotification(uint64_t a1, int a2)
{
  uint64_t v3 = __WiFiManagerClientGetOrReconnectServerPort(a1, 0);
  int v4 = (mach_port_name_t *)v3;
  if (v3) {
    wifi_manager_wificall_handover_notification(v3[1], a2);
  }
  else {

  }
  WiFiSendRightRelease(v4);
}

uint64_t WiFiManagerClientSetAWDLMacAddressInUse(uint64_t a1, int a2)
{
  uint64_t v3 = (void *)[MEMORY[0x1E4FB6FE8] shared];
  if (a2)
  {
    return [v3 beginTransaction:15 completionHandler:0];
  }
  else
  {
    return [v3 endTransaction:15];
  }
}

CFPropertyListRef WiFiManagerClientCopyMovementStates(uint64_t a1)
{
  memset(length, 0, sizeof(length));
  if (!a1)
  {
    CFDictionaryRef v2 = 0;
    goto LABEL_10;
  }
  CFPropertyListRef v1 = __WiFiManagerClientGetOrReconnectServerPort(a1, 0);
  CFDictionaryRef v2 = (mach_port_name_t *)v1;
  if (!v1 || (wifi_manager_copy_movement_states(v1[1], &length[1], length), !*(void *)&length[1]) || !length[0])
  {
LABEL_10:
    CFPropertyListRef v3 = 0;
    goto LABEL_7;
  }
  CFPropertyListRef v3 = _WiFiCopyUnserialized(*(UInt8 **)&length[1], length[0]);
  if (!v3) {
LABEL_7:
  }
  _WiFiVMDealloc(*(uint64_t *)&length[1], length[0]);
  WiFiSendRightRelease(v2);
  return v3;
}

void WiFiManagerClientSetSimulatedMovementStates(uint64_t a1, const void *a2)
{
  CFPropertyListRef v3 = (mach_port_name_t *)__WiFiManagerClientGetOrReconnectServerPort(a1, 0);
  if (v3)
  {
    CFDataRef BinaryData = (const __CFData *)_CFPropertyListCreateBinaryData((CFAllocatorRef)*MEMORY[0x1E4F1CF80], a2);
    if (BinaryData)
    {
      CFDataRef v5 = BinaryData;
      mach_port_t v6 = v3[1];
      BytePtr = CFDataGetBytePtr(BinaryData);
      int Length = CFDataGetLength(v5);
      wifi_manager_set_simulated_movement_states(v6, (uint64_t)BytePtr, Length);
      CFRelease(v5);
    }
  }
  else
  {
  }

  WiFiSendRightRelease(v3);
}

void WiFiManagerClientSetBatterySaveMode(uint64_t a1, int a2)
{
  CFPropertyListRef v3 = __WiFiManagerClientGetOrReconnectServerPort(a1, 0);
  if (v3)
  {
    int v4 = (mach_port_name_t *)v3;
    wifi_manager_set_battery_save_mode(v3[1], a2);
    WiFiSendRightRelease(v4);
  }
}

uint64_t WiFiManagerClientGetBatterySaveMode(uint64_t a1)
{
  int v5 = 0;
  CFPropertyListRef v1 = __WiFiManagerClientGetOrReconnectServerPort(a1, 0);
  if (v1)
  {
    CFDictionaryRef v2 = (mach_port_name_t *)v1;
    wifi_manager_get_battery_save_mode(v1[1], &v5);
    WiFiSendRightRelease(v2);
    return v5;
  }
  else
  {
    return 0;
  }
}

void WiFiManagerClientInitiateColocatedNetworkTransition(uint64_t a1, const void *a2)
{
  CFPropertyListRef v3 = __WiFiManagerClientGetOrReconnectServerPort(a1, 0);
  if (v3)
  {
    int v4 = v3;
    if (a2
      && (CFDataRef BinaryData = (const __CFData *)_CFPropertyListCreateBinaryData((CFAllocatorRef)*MEMORY[0x1E4F1CF80], a2)) != 0)
    {
      CFDataRef v6 = BinaryData;
      BytePtr = CFDataGetBytePtr(BinaryData);
      int Length = CFDataGetLength(v6);
      wifi_manager_initiate_network_transition(v4[1], (uint64_t)BytePtr, Length);
      CFRelease(v6);
    }
    else
    {
      wifi_manager_initiate_network_transition(v4[1], 0, 0);
    }
    WiFiSendRightRelease((mach_port_name_t *)v4);
  }
}

uint64_t _WiFiManagerClientGetCoreWiFiInterface(uint64_t a1)
{
  if (!*(void *)(a1 + 344))
  {
    CFDictionaryRef v2 = (void *)[objc_alloc(MEMORY[0x1E4F5E320]) initWithServiceType:7];
    *(void *)(a1 + 344) = v2;
    if (v2)
    {
      v4[0] = MEMORY[0x1E4F143A8];
      v4[1] = 3221225472;
      v4[2] = ___WiFiManagerClientGetCoreWiFiInterface_block_invoke;
      v4[3] = &__block_descriptor_40_e5_v8__0l;
      v4[4] = a1;
      [v2 setInvalidationHandler:v4];
      [*(id *)(a1 + 344) activate];
    }
    else
    {
    }
  }
  return *(void *)(a1 + 344);
}

void __WiFiManagerClientRelease(uint64_t a1)
{
  CFDictionaryRef v2 = *(__CFMachPort **)(a1 + 96);
  if (v2)
  {
    CFMachPortInvalidate(v2);
    CFPropertyListRef v3 = *(const void **)(a1 + 96);
    if (v3)
    {
      CFRelease(v3);
      *(void *)(a1 + 96) = 0;
    }
  }
  int v4 = *(const void **)(a1 + 104);
  if (v4)
  {
    CFRelease(v4);
    *(void *)(a1 + 104) = 0;
  }
  int v5 = *(_DWORD *)(a1 + 88);
  if (v5)
  {
    notify_cancel(v5);
    *(_DWORD *)(a1 + 88) = 0;
  }
  uint64_t v6 = *(void *)(a1 + 32);
  if (v6)
  {
    wifi_manager_close(*(_DWORD *)(v6 + 4));
    WiFiSendRightRelease(*(mach_port_name_t **)(a1 + 32));
    *(void *)(a1 + 32) = 0;
  }
  unsigned int Port = WiFiMIGMachPortGetPort(*(void *)(a1 + 40));
  WiFiPortCacheRemove(Port);
  mach_port_name_t v8 = WiFiMIGMachPortGetPort(*(void *)(a1 + 40));
  CFDataRef v9 = *(const void **)(a1 + 40);
  if (v9)
  {
    CFRelease(v9);
    *(void *)(a1 + 40) = 0;
  }
  mach_port_mod_refs(*MEMORY[0x1E4F14960], v8, 1u, -1);
  mach_port_t v10 = *(const void **)(a1 + 64);
  if (v10)
  {
    CFRelease(v10);
    *(void *)(a1 + 64) = 0;
  }
  [*(id *)(a1 + 344) invalidate];

  *(void *)(a1 + 344) = 0;
}

void OUTLINED_FUNCTION_0_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void OUTLINED_FUNCTION_3(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

uint64_t WiFiDeviceClientGetTypeID()
{
  uint64_t result = __wiFiDeviceTypeID;
  if (!__wiFiDeviceTypeID)
  {
    pthread_once(&__wiFiDeviceTypeInit, (void (*)(void))__WiFiDeviceClientRegister);
    return __wiFiDeviceTypeID;
  }
  return result;
}

uint64_t _WiFiDeviceClientGetServerPort(uint64_t a1)
{
  return *(unsigned int *)(a1 + 16);
}

uint64_t _WiFiDeviceClientSetServerPort(uint64_t result, int a2)
{
  *(_DWORD *)(result + 16) = a2;
  return result;
}

void WiFiDeviceClientSetProperty(uint64_t a1, const void *a2, const void *a3)
{
  if (a1 && a2)
  {
    CFAllocatorRef v5 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
    CFDataRef BinaryData = (const __CFData *)_CFPropertyListCreateBinaryData((CFAllocatorRef)*MEMORY[0x1E4F1CF80], a2);
    CFDataRef v7 = BinaryData;
    if (BinaryData)
    {
      BytePtr = CFDataGetBytePtr(BinaryData);
      int Length = CFDataGetLength(v7);
    }
    else
    {
      BytePtr = 0;
      int Length = 0;
    }
    CFDataRef v10 = (const __CFData *)_CFPropertyListCreateBinaryData(v5, a3);
    CFDataRef v11 = v10;
    if (v10)
    {
      int v12 = CFDataGetBytePtr(v10);
      int v13 = CFDataGetLength(v11);
    }
    else
    {
      int v12 = 0;
      int v13 = 0;
    }
    int v14 = *(_DWORD *)(a1 + 16);
    int v15 = CFDataGetBytePtr(*(CFDataRef *)(a1 + 48));
    int v16 = CFDataGetLength(*(CFDataRef *)(a1 + 48));
    wifi_device_set_property(v14, (uint64_t)v15, v16, (uint64_t)BytePtr, Length, (uint64_t)v12, v13);
    if (v7) {
      CFRelease(v7);
    }
    if (v11)
    {
      CFRelease(v11);
    }
  }
}

uint64_t WiFiDeviceClientRegisterRemovalCallback(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)(a1 + 80) = a2;
  *(void *)(a1 + 88) = a3;
  *(void *)(a1 + 64) = *(void *)(a1 + 64) & 0xFFFFFFFFFFFFFFF7 | (8 * (a2 != 0));
  return _WiFiDeviceClientSendEventMaskToServer(a1);
}

uint64_t WiFiDeviceClientRegisterScanCacheUpdateCallback(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)(a1 + 224) = a2;
  *(void *)(a1 + 232) = a3;
  *(void *)(a1 + 64) = *(void *)(a1 + 64) & 0xFFFFFFFFFFFFFFBFLL | ((unint64_t)(a2 != 0) << 6);
  return _WiFiDeviceClientSendEventMaskToServer(a1);
}

uint64_t WiFiDeviceClientRegisterScanCacheUpdateCallback2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)(a1 + 240) = a2;
  *(void *)(a1 + 248) = a3;
  *(void *)(a1 + 64) = *(void *)(a1 + 64) & 0xFFFFFFFFFFFFFFBFLL | ((unint64_t)(a2 != 0) << 6);
  return _WiFiDeviceClientSendEventMaskToServer(a1);
}

uint64_t WiFiDeviceClientRegisterLinkCallback(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)(a1 + 96) = a2;
  *(void *)(a1 + 104) = a3;
  *(void *)(a1 + 64) = *(void *)(a1 + 64) & 0xFFFFFFFFFFFFFFFDLL | (2 * (a2 != 0));
  return _WiFiDeviceClientSendEventMaskToServer(a1);
}

uint64_t WiFiDeviceClientRegisterExtendedLinkCallback(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)(a1 + 448) = a2;
  *(void *)(a1 + 456) = a3;
  *(void *)(a1 + 64) = *(void *)(a1 + 64) & 0xFFFFFFFFFFFFFFFDLL | (2 * (a2 != 0));
  return _WiFiDeviceClientSendEventMaskToServer(a1);
}

uint64_t WiFiDeviceClientRegisterAutoJoinNotificationCallback(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)(a1 + 464) = a2;
  *(void *)(a1 + 472) = a3;
  *(void *)(a1 + 64) = *(void *)(a1 + 64) & 0xFFFFFFFFFF7FFFFFLL | ((unint64_t)(a2 != 0) << 23);
  return _WiFiDeviceClientSendEventMaskToServer(a1);
}

uint64_t WiFiDeviceClientRegisterUserJoinNotificationCallback(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)(a1 + 480) = a2;
  *(void *)(a1 + 488) = a3;
  *(void *)(a1 + 64) = *(void *)(a1 + 64) & 0xFFFFFFFBFFFFFFFFLL | ((unint64_t)(a2 != 0) << 34);
  return _WiFiDeviceClientSendEventMaskToServer(a1);
}

uint64_t WiFiDeviceClientRegisterDecryptionCallback(uint64_t result, uint64_t a2, uint64_t a3)
{
  *(void *)(result + 112) = a2;
  *(void *)(result + 120) = a3;
  return result;
}

uint64_t WiFiDeviceClientRegisterResumeScanCallback(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)(a1 + 128) = a2;
  *(void *)(a1 + 136) = a3;
  *(void *)(a1 + 64) = *(void *)(a1 + 64) & 0xFFFFFFFFFFFFF7FFLL | ((unint64_t)(a2 != 0) << 11);
  return _WiFiDeviceClientSendEventMaskToServer(a1);
}

uint64_t WiFiDeviceClientRegisterBgScanSuspendResumeCallback(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)(a1 + 288) = a2;
  *(void *)(a1 + 296) = a3;
  *(void *)(a1 + 64) = *(void *)(a1 + 64) & 0xFFFFFFFFFFFFEFFFLL | ((unint64_t)(a2 != 0) << 12);
  return _WiFiDeviceClientSendEventMaskToServer(a1);
}

uint64_t WiFiDeviceClientRegisterWeightAvgLQMCallback(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)(a1 + 320) = a2;
  *(void *)(a1 + 328) = a3;
  *(void *)(a1 + 64) = *(void *)(a1 + 64) & 0xFFFFFFFF7FFFFFFFLL | ((unint64_t)(a2 != 0) << 31);
  return _WiFiDeviceClientSendEventMaskToServer(a1);
}

uint64_t WiFiDeviceClientRegisterBTCoexStatsCallback(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)(a1 + 336) = a2;
  *(void *)(a1 + 344) = a3;
  *(void *)(a1 + 64) = *(void *)(a1 + 64) & 0xFFFFFBFFFFFFFFFFLL | ((unint64_t)(a2 != 0) << 42);
  return _WiFiDeviceClientSendEventMaskToServer(a1);
}

uint64_t WiFiDeviceClientRegisterBSPEventCallback(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)(a1 + 624) = a2;
  *(void *)(a1 + 632) = a3;
  *(void *)(a1 + 64) = *(void *)(a1 + 64) & 0xFFFFF7FFFFFFFFFFLL | ((unint64_t)(a2 != 0) << 43);
  return _WiFiDeviceClientSendEventMaskToServer(a1);
}

uint64_t WiFiDeviceClientRegisterUCMEventCallback(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)(a1 + 640) = a2;
  *(void *)(a1 + 648) = a3;
  *(void *)(a1 + 64) = *(void *)(a1 + 64) & 0xFFFFDFFFFFFFFFFFLL | ((unint64_t)(a2 != 0) << 45);
  return _WiFiDeviceClientSendEventMaskToServer(a1);
}

uint64_t WiFiDeviceClientRegisterCatsUpdateCallback(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)(a1 + 352) = a2;
  *(void *)(a1 + 360) = a3;
  *(void *)(a1 + 64) = *(void *)(a1 + 64) & 0xFFFFFEFFFFFFFFFFLL | ((unint64_t)(a2 != 0) << 40);
  return _WiFiDeviceClientSendEventMaskToServer(a1);
}

uint64_t WiFiDeviceClientRegisterBTScanIntervalRelaxCallback(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)(a1 + 368) = a2;
  *(void *)(a1 + 376) = a3;
  *(void *)(a1 + 64) = *(void *)(a1 + 64) & 0xFFFFFFF7FFFFFFFFLL | ((unint64_t)(a2 != 0) << 35);
  return _WiFiDeviceClientSendEventMaskToServer(a1);
}

uint64_t WiFiDeviceClientRegister24GHzNetworkInCriticalStateCallback(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)(a1 + 384) = a2;
  *(void *)(a1 + 392) = a3;
  *(void *)(a1 + 64) = *(void *)(a1 + 64) & 0xFFFFFFBFFFFFFFFFLL | ((unint64_t)(a2 != 0) << 38);
  return _WiFiDeviceClientSendEventMaskToServer(a1);
}

uint64_t WiFiDeviceClientRegisterM1M4Handshake24GHzCountCallback(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)(a1 + 400) = a2;
  *(void *)(a1 + 408) = a3;
  *(void *)(a1 + 64) = *(void *)(a1 + 64) & 0xFFFFFF7FFFFFFFFFLL | ((unint64_t)(a2 != 0) << 39);
  return _WiFiDeviceClientSendEventMaskToServer(a1);
}

uint64_t WiFiDeviceClientRegisterDiagnosticsCallback(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)(a1 + 432) = a2;
  *(void *)(a1 + 440) = a3;
  *(void *)(a1 + 64) = *(void *)(a1 + 64) & 0xFFFFFFFFFFFF7FFFLL | ((unint64_t)(a2 != 0) << 15);
  return _WiFiDeviceClientSendEventMaskToServer(a1);
}

uint64_t WiFiDeviceClientRegisterDeviceAvailableCallback(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)(a1 + 528) = a2;
  *(void *)(a1 + 536) = a3;
  *(void *)(a1 + 64) = *(void *)(a1 + 64) & 0xFFFFFFFFFFEFFFFFLL | ((unint64_t)(a2 != 0) << 20);
  return _WiFiDeviceClientSendEventMaskToServer(a1);
}

uint64_t WiFiDeviceClientRegisterTdConfirmedCallback(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)(a1 + 656) = a2;
  *(void *)(a1 + 664) = a3;
  *(void *)(a1 + 64) = *(void *)(a1 + 64) & 0xFFFFBFFFFFFFFFFFLL | ((unint64_t)(a2 != 0) << 46);
  return _WiFiDeviceClientSendEventMaskToServer(a1);
}

uint64_t WiFiDeviceClientCopyCurrentNetworkAsync(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4)
{
  if (!a1) {
    return 4294963396;
  }
  uint64_t result = 4294963396;
  if (a2 && *(void *)(a1 + 56))
  {
    uint64_t v9 = malloc_type_malloc(0x20uLL, 0xA0040069AE433uLL);
    if (v9)
    {
      CFDataRef v10 = v9;
      *uint64_t v9 = a4;
      v9[1] = a1;
      void v9[2] = a3;
      dispatch_retain(a2);
      v10[3] = a2;
      CFDataRef v11 = dispatch_queue_create("com.apple.wifid.queue", 0);
      dispatch_async_f(v11, v10, (dispatch_function_t)_dispatchCopyCurrentNetwork);
      dispatch_release(v11);
      return 0;
    }
    else
    {
      return 4294963395;
    }
  }
  return result;
}

void _dispatchCopyCurrentNetwork(uint64_t a1)
{
  if (a1)
  {
    CFDictionaryRef v2 = WiFiDeviceClientCopyCurrentNetwork(*(void *)(a1 + 8));
    CFPropertyListRef v3 = *(NSObject **)(a1 + 24);
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = ___dispatchCopyCurrentNetwork_block_invoke;
    v4[3] = &__block_descriptor_48_e5_v8__0l;
    v4[4] = a1;
    void v4[5] = v2;
    dispatch_async(v3, v4);
  }
}

BOOL WiFiDeviceClientIsInterfaceAWDL(uint64_t a1)
{
  return *(void *)(a1 + 40) == 6;
}

BOOL WiFiDeviceClientIsInterfaceHostAp(uint64_t a1)
{
  return *(void *)(a1 + 40) == 7;
}

uint64_t WiFiDeviceClientSetPower(uint64_t a1, int a2)
{
  int v8 = -3902;
  mach_port_t v4 = *(_DWORD *)(a1 + 16);
  BytePtr = CFDataGetBytePtr(*(CFDataRef *)(a1 + 48));
  int Length = CFDataGetLength(*(CFDataRef *)(a1 + 48));
  wifi_device_set_power(v4, (uint64_t)BytePtr, Length, a2, &v8);
  if (v8) {
    return 4294963394;
  }
  else {
    return 0;
  }
}

uint64_t WiFiDeviceClientScanCancel(uint64_t result)
{
  *(void *)(result + 160) = 0;
  *(void *)(result + 168) = 0;
  return result;
}

uint64_t WiFiDeviceClientAssociateAsync(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = 4294963394;
  int v16 = -3902;
  *(void *)(a1 + 176) = a3;
  *(void *)(a1 + 184) = a4;
  CFDictionaryRef v6 = WiFiNetworkCopyRecord(a2);
  if (v6)
  {
    CFDictionaryRef v7 = v6;
    CFDataRef BinaryData = (const __CFData *)_CFPropertyListCreateBinaryData((CFAllocatorRef)*MEMORY[0x1E4F1CF80], v6);
    if (BinaryData)
    {
      CFDataRef v9 = BinaryData;
      mach_port_t v10 = *(_DWORD *)(a1 + 16);
      BytePtr = CFDataGetBytePtr(*(CFDataRef *)(a1 + 48));
      int Length = CFDataGetLength(*(CFDataRef *)(a1 + 48));
      int v13 = CFDataGetBytePtr(v9);
      int v14 = CFDataGetLength(v9);
      wifi_device_assoc_async(v10, (uint64_t)BytePtr, Length, (uint64_t)v13, v14, &v16);
      CFRelease(v9);
    }
    CFRelease(v7);
    if (v16) {
      return 4294963394;
    }
    else {
      return 0;
    }
  }
  return v5;
}

uint64_t WiFiDeviceClientAssociateCancel(uint64_t result)
{
  *(void *)(result + 176) = 0;
  *(void *)(result + 184) = 0;
  return result;
}

uint64_t WiFiDeviceClientDisassociate(uint64_t a1)
{
  int v2 = *(_DWORD *)(a1 + 16);
  BytePtr = CFDataGetBytePtr(*(CFDataRef *)(a1 + 48));
  int Length = CFDataGetLength(*(CFDataRef *)(a1 + 48));
  wifi_device_disassociate(v2, (uint64_t)BytePtr, Length);
  return 0;
}

uint64_t WiFiDeviceClientDisassociateWithReason(uint64_t a1, uint64_t a2, int a3)
{
  if (a1)
  {
    int v5 = *(_DWORD *)(a1 + 16);
    BytePtr = CFDataGetBytePtr(*(CFDataRef *)(a1 + 48));
    int Length = CFDataGetLength(*(CFDataRef *)(a1 + 48));
    wifi_device_disassociate_with_reason(v5, (uint64_t)BytePtr, Length, a3);
  }
  else
  {
  }
  return 0;
}

uint64_t WiFiDeviceClientStartNetwork(uint64_t a1, int a2, const void *a3, uint64_t a4, uint64_t a5)
{
  unsigned int v17 = 0;
  if ((a2 - 1) >= 4 || a2 != 4 && !a3 || !a4) {
    goto LABEL_7;
  }
  if (a3)
  {
    CFDataRef BinaryData = (const __CFData *)_CFPropertyListCreateBinaryData((CFAllocatorRef)*MEMORY[0x1E4F1CF80], a3);
    if (!BinaryData)
    {
LABEL_7:
      uint64_t v10 = 22;
      unsigned int v17 = 22;
LABEL_13:
      NSLog(&cfstr_SStartNetworkF.isa, "WiFiDeviceClientStartNetwork", v10);
      return v17;
    }
  }
  else
  {
    CFDataRef BinaryData = 0;
  }
  *(void *)(a1 + 192) = a4;
  *(void *)(a1 + 200) = a5;
  NSLog(&cfstr_SStartingNetwo.isa, "WiFiDeviceClientStartNetwork");
  mach_port_t v11 = *(_DWORD *)(a1 + 16);
  BytePtr = CFDataGetBytePtr(*(CFDataRef *)(a1 + 48));
  int Length = CFDataGetLength(*(CFDataRef *)(a1 + 48));
  if (BinaryData)
  {
    int v14 = CFDataGetBytePtr(BinaryData);
    int v15 = CFDataGetLength(BinaryData);
    wifi_device_start_network(v11, (uint64_t)BytePtr, Length, a2, (uint64_t)v14, v15, (int *)&v17);
    CFRelease(BinaryData);
  }
  else
  {
    wifi_device_start_network(v11, (uint64_t)BytePtr, Length, a2, 0, 0, (int *)&v17);
  }
  uint64_t v10 = v17;
  if (v17) {
    goto LABEL_13;
  }
  return 0;
}

uint64_t WiFiDeviceClientStopNetwork(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  unsigned int v17 = 0;
  uint64_t result = 22;
  if (a2 && a3)
  {
    CFDictionaryRef v8 = WiFiNetworkCopyRecord(a2);
    if (v8)
    {
      CFDictionaryRef v9 = v8;
      CFDataRef BinaryData = (const __CFData *)_CFPropertyListCreateBinaryData((CFAllocatorRef)*MEMORY[0x1E4F1CF80], v8);
      if (BinaryData)
      {
        CFDataRef v11 = BinaryData;
        *(void *)(a1 + 208) = a3;
        *(void *)(a1 + 216) = a4;
        mach_port_t v12 = *(_DWORD *)(a1 + 16);
        BytePtr = CFDataGetBytePtr(*(CFDataRef *)(a1 + 48));
        int Length = CFDataGetLength(*(CFDataRef *)(a1 + 48));
        int v15 = CFDataGetBytePtr(v11);
        int v16 = CFDataGetLength(v11);
        wifi_device_stop_network(v12, (uint64_t)BytePtr, Length, (uint64_t)v15, v16, (int *)&v17);
        CFRelease(v11);
      }
      else
      {
        unsigned int v17 = 22;
      }
      CFRelease(v9);
      return v17;
    }
    else
    {
      return 22;
    }
  }
  return result;
}

uint64_t WiFiDeviceClientRegisterRangingReportCallback(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)(a1 + 576) = a2;
  *(void *)(a1 + 584) = a3;
  *(void *)(a1 + 64) = *(void *)(a1 + 64) & 0xFFFFFFFFFEFFFFFFLL | ((unint64_t)(a2 != 0) << 24);
  return _WiFiDeviceClientSendEventMaskToServer(a1);
}

void WiFiDeviceClientRegisterVirtualInterfaceStateChangeCallback(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  a1[68] = a2;
  a1[69] = a3;
  uint64_t v4 = a1[8];
  if (a2)
  {
    a1[8] = v4 | 0x400000;
    _WiFiDeviceClientSendEventMaskToServer((uint64_t)a1);
    RunLoop = (__CFRunLoop *)_WiFiManagerClientGetRunLoop(a1[7]);
    RunLoopMode = (const void *)_WiFiManagerClientGetRunLoopMode(a1[7]);
    if (RunLoop) {
      BOOL v7 = RunLoopMode == 0;
    }
    else {
      BOOL v7 = 1;
    }
    if (!v7)
    {
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __WiFiDeviceClientRegisterVirtualInterfaceStateChangeCallback_block_invoke;
      block[3] = &__block_descriptor_40_e5_v8__0l;
      block[4] = a1;
      CFRunLoopPerformBlock(RunLoop, RunLoopMode, block);
      CFRunLoopWakeUp(RunLoop);
    }
  }
  else
  {
    a1[8] = v4 & 0xFFFFFFFFFFBFFFFFLL;
    _WiFiDeviceClientSendEventMaskToServer((uint64_t)a1);
  }
}

void __WiFiDeviceClientRegisterVirtualInterfaceStateChangeCallback_block_invoke(uint64_t a1)
{
  CFTypeRef cf = 0;
  int v2 = WiFiDeviceClientCopyInterfaceStateInfo(*(void *)(a1 + 32), &cf);
  CFTypeRef v3 = cf;
  if (cf) {
    BOOL v4 = v2 == 0;
  }
  else {
    BOOL v4 = 0;
  }
  if (v4)
  {
    _WiFiDeviceClientDispatchVirtInterfaceStateChangeEvent(*(void *)(a1 + 32), cf);
  }
  else if (!cf)
  {
    return;
  }

  CFRelease(v3);
}

uint64_t WiFiDeviceClientCopyInterfaceStateInfo(uint64_t a1, void *a2)
{
  unsigned int v11 = 0;
  *(void *)&length[1] = 0;
  length[0] = 0;
  if (*a2)
  {
    int v9 = 22;
    goto LABEL_11;
  }
  mach_port_t v4 = *(_DWORD *)(a1 + 16);
  BytePtr = CFDataGetBytePtr(*(CFDataRef *)(a1 + 48));
  unsigned int v6 = CFDataGetLength(*(CFDataRef *)(a1 + 48));
  wifi_device_copy_interface_state_info(v4, (uint64_t)BytePtr, v6, 0, &length[1], length, &v11);
  if (!v11)
  {
    if (*(void *)&length[1] && length[0])
    {
      CFPropertyListRef v7 = _WiFiCopyUnserialized(*(UInt8 **)&length[1], length[0]);
      if (v7)
      {
        *a2 = v7;
        goto LABEL_7;
      }
      int v9 = 94;
    }
    else
    {
      int v9 = 5;
    }
LABEL_11:
    unsigned int v11 = v9;
  }
LABEL_7:
  _WiFiVMDealloc(*(uint64_t *)&length[1], length[0]);
  return v11;
}

void _WiFiDeviceClientDispatchVirtInterfaceStateChangeEvent(uint64_t a1, CFTypeRef cf)
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  CFTypeRef cfa = 0;
  if (!a1) {
    return;
  }
  if (!cf) {
    goto LABEL_24;
  }
  CFTypeID v4 = CFGetTypeID(cf);
  if (v4 != CFDictionaryGetTypeID())
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      _WiFiDeviceClientDispatchVirtInterfaceStateChangeEvent_cold_2((uint64_t)cf);
    }
    goto LABEL_24;
  }
  int v5 = (void *)CFRetain(cf);
  CFTypeRef cfa = v5;
  CFStringRef Value = CFDictionaryGetValue((CFDictionaryRef)v5, @"WiFiHostApStateIdentifier");
  if (Value && CFEqual(Value, (CFTypeRef)*MEMORY[0x1E4F1CFD0])) {
    goto LABEL_15;
  }
  CFPropertyListRef v7 = CFDictionaryGetValue((CFDictionaryRef)v5, @"LINK_CHANGED_IS_LINKDOWN");
  if (v7)
  {
    CFDictionaryRef v8 = v7;
    CFTypeID v9 = CFGetTypeID(v7);
    if (v9 != CFBooleanGetTypeID())
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        _WiFiDeviceClientDispatchVirtInterfaceStateChangeEvent_cold_1(v8);
        if (!v5)
        {
LABEL_11:
          uint64_t v10 = WiFiDeviceClientCopyInterfaceStateInfo(a1, &cfa);
          int v5 = (void *)cfa;
          if (!cfa)
          {
            return;
          }
          goto LABEL_12;
        }
      }
      else if (!v5)
      {
        goto LABEL_11;
      }
      CFRelease(v5);
      CFTypeRef cfa = 0;
      goto LABEL_11;
    }
  }
LABEL_12:
  unsigned int v11 = CFDictionaryGetValue((CFDictionaryRef)v5, @"LINK_CHANGED_NETWORK");
  if (v11)
  {
    mach_port_t v12 = WiFiNetworkCreate(*MEMORY[0x1E4F1CF80], v11);
    if (v12)
    {
      int v13 = v12;
      CFDictionaryReplaceValue((CFMutableDictionaryRef)v5, @"LINK_CHANGED_NETWORK", v12);
      CFRelease(v13);
    }
LABEL_15:
    CFArrayRef v14 = (const __CFArray *)CFDictionaryGetValue((CFDictionaryRef)v5, @"LINK_CHANGED_PEER_LIST");
    if (*(void *)(a1 + 544))
    {
      CFArrayRef v15 = v14;
      if (v14)
      {
        if (CFArrayGetCount(v14) >= 1)
        {
          CFIndex v16 = 0;
          unsigned int v17 = MEMORY[0x1E4F14500];
          do
          {
            CFDictionaryRef ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(v15, v16);
            if (ValueAtIndex)
            {
              CFDataRef v19 = (const __CFData *)CFDictionaryGetValue(ValueAtIndex, @"STATION_MAC");
              if (v19)
              {
                BytePtr = (const ether_addr *)CFDataGetBytePtr(v19);
                uint64_t v21 = ether_ntoa(BytePtr);
                if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
                {
                  CFIndex Count = CFArrayGetCount(v15);
                  *(_DWORD *)buf = 134218498;
                  CFIndex v27 = v16 + 1;
                  __int16 v28 = 2048;
                  CFIndex v29 = Count;
                  __int16 v30 = 2080;
                  CFIndex v31 = v21;
                  _os_log_impl(&dword_1BF1E6000, v17, OS_LOG_TYPE_INFO, "Peer %ld of %ld: MAC:%s", buf, 0x20u);
                }
              }
            }
            ++v16;
          }
          while (v16 < CFArrayGetCount(v15));
        }
      }
    }
  }
LABEL_24:
  CFPropertyListRef v23 = *(void (**)(uint64_t, CFTypeRef, void))(a1 + 544);
  CFTypeRef v24 = cfa;
  if (v23) {
    v23(a1, cfa, *(void *)(a1 + 552));
  }
  if (v24) {
    CFRelease(v24);
  }
}

uint64_t WiFiDeviceClientRegisterRoamStatusEventCallback(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)(a1 + 592) = a2;
  *(void *)(a1 + 600) = a3;
  *(void *)(a1 + 64) = *(void *)(a1 + 64) & 0xFFFFFFFFBFFFFFFFLL | ((unint64_t)(a2 != 0) << 30);
  return _WiFiDeviceClientSendEventMaskToServer(a1);
}

uint64_t WiFiDeviceClientCopyHostedNetworks(uint64_t a1, __CFArray **a2)
{
  unsigned int v13 = 0;
  *(void *)&length[1] = 0;
  length[0] = 0;
  if (*a2)
  {
    int v11 = 22;
LABEL_13:
    unsigned int v13 = v11;
    goto LABEL_9;
  }
  mach_port_t v4 = *(_DWORD *)(a1 + 16);
  BytePtr = CFDataGetBytePtr(*(CFDataRef *)(a1 + 48));
  unsigned int v6 = CFDataGetLength(*(CFDataRef *)(a1 + 48));
  wifi_device_copy_networks(v4, (uint64_t)BytePtr, v6, 0, &length[1], length, &v13);
  if (v13) {
    goto LABEL_9;
  }
  if (!*(void *)&length[1] || !length[0])
  {
    int v11 = 5;
    goto LABEL_13;
  }
  CFArrayRef v7 = (const __CFArray *)_WiFiCopyUnserialized(*(UInt8 **)&length[1], length[0]);
  if (!v7)
  {
    int v11 = 94;
    goto LABEL_13;
  }
  CFArrayRef v8 = v7;
  NetworksFromRecords = _WiFiCreateNetworksFromRecords(v7);
  if (NetworksFromRecords) {
    *a2 = NetworksFromRecords;
  }
  else {
    unsigned int v13 = 5;
  }
  CFRelease(v8);
LABEL_9:
  _WiFiVMDealloc(*(uint64_t *)&length[1], length[0]);
  return v13;
}

uint64_t WiFiDeviceClientSetWiFiDirect(uint64_t a1, int a2)
{
  unsigned int v8 = 0;
  if (!a1) {
    WiFiDeviceClientSetWiFiDirect_cold_1();
  }
  mach_port_t v4 = *(_DWORD *)(a1 + 16);
  BytePtr = CFDataGetBytePtr(*(CFDataRef *)(a1 + 48));
  int Length = CFDataGetLength(*(CFDataRef *)(a1 + 48));
  wifi_device_set_wifi_direct_state(v4, (uint64_t)BytePtr, Length, a2, (int *)&v8);
  return v8;
}

uint64_t _WiFiDeviceClientDispatchAssociationResult(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  int v5 = (void *)(result + 176);
  mach_port_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, void))(result + 176);
  if (v4)
  {
    uint64_t result = v4(result, a2, a3, a4, *(void *)(result + 184));
    *int v5 = 0;
    v5[1] = 0;
  }
  return result;
}

uint64_t _WiFiDeviceClientDispatchStartNetworkResult(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  mach_port_t v4 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t, void))(a1 + 192);
  if (v4)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
    {
      int v18 = 136315906;
      CFDataRef v19 = "_WiFiDeviceClientDispatchStartNetworkResult";
      __int16 v20 = 1024;
      int v21 = a2;
      __int16 v22 = 2112;
      uint64_t v23 = a4;
      __int16 v24 = 2112;
      uint64_t v25 = a3;
      _os_log_impl(&dword_1BF1E6000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "%s: dispatching callback (error=%d) with response %@ and network %@", (uint8_t *)&v18, 0x26u);
      mach_port_t v4 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t, void))(a1 + 192);
    }
    v4(a1, a2, a3, a4, *(void *)(a1 + 200));
    uint64_t result = 0;
    *(void *)(a1 + 192) = 0;
  }
  else
  {
    BOOL v10 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR);
    if (v10) {
      _WiFiDeviceClientDispatchStartNetworkResult_cold_1(v10, v11, v12, v13, v14, v15, v16, v17);
    }
    return 2;
  }
  return result;
}

uint64_t _WiFiDeviceClientDispatchStopNetworkResult(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  CFTypeRef v3 = *(void (**)(uint64_t, uint64_t, uint64_t, void))(a1 + 208);
  if (v3)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
    {
      int v16 = 136315650;
      uint64_t v17 = "_WiFiDeviceClientDispatchStopNetworkResult";
      __int16 v18 = 1024;
      int v19 = a2;
      __int16 v20 = 2112;
      uint64_t v21 = a3;
      _os_log_impl(&dword_1BF1E6000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "%s: dispatching callback (error=%d) with response %@", (uint8_t *)&v16, 0x1Cu);
      CFTypeRef v3 = *(void (**)(uint64_t, uint64_t, uint64_t, void))(a1 + 208);
    }
    v3(a1, a2, a3, *(void *)(a1 + 216));
    uint64_t result = 0;
    *(void *)(a1 + 208) = 0;
  }
  else
  {
    BOOL v8 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR);
    if (v8) {
      _WiFiDeviceClientDispatchStopNetworkResult_cold_1(v8, v9, v10, v11, v12, v13, v14, v15);
    }
    return 2;
  }
  return result;
}

uint64_t _WiFiDeviceClientDispatchPowerEvent(uint64_t result)
{
  CFPropertyListRef v1 = *(uint64_t (**)(uint64_t, void))(result + 144);
  if (v1) {
    return v1(result, *(void *)(result + 152));
  }
  return result;
}

uint64_t _WiFiDeviceClientDispatchBssidEvent(uint64_t result, uint64_t a2)
{
  int v2 = *(uint64_t (**)(uint64_t, uint64_t, void))(result + 272);
  if (v2) {
    return v2(result, a2, *(void *)(result + 280));
  }
  return result;
}

void _WiFiDeviceClientDispatchScanCacheUpdateEvent(void *a1, CFDictionaryRef theDict)
{
  if (theDict)
  {
    CFStringRef Value = CFDictionaryGetValue(theDict, @"scanRequest");
    if (Value
      && (int v5 = Value, v6 = CFGetTypeID(Value), v6 == CFDictionaryGetTypeID())
      && (CFArrayRef v7 = (const __CFArray *)CFDictionaryGetValue(theDict, @"scanResults")) != 0
      && (CFArrayRef v8 = v7, v9 = CFGetTypeID(v7), v9 == CFArrayGetTypeID()))
    {
      NetworksFromRecords = _WiFiCreateNetworksFromRecords(v8);
      uint64_t v11 = (void (*)(void *, __CFArray *, void, void))a1[28];
      if (v11) {
        v11(a1, NetworksFromRecords, 0, a1[29]);
      }
      uint64_t v12 = (void (*)(void *, const void *, __CFArray *, void, void))a1[30];
      if (v12) {
        v12(a1, v5, NetworksFromRecords, 0, a1[31]);
      }
      if (NetworksFromRecords)
      {
        CFRelease(NetworksFromRecords);
      }
    }
    else
    {
      uint64_t v13 = (void *)MEMORY[0x1C18A51F0]();
    }
  }
}

void _WiFiDeviceClientDispatchScanUpdateEvent(uint64_t a1, CFDictionaryRef theDict)
{
  if (theDict)
  {
    CFStringRef Value = CFDictionaryGetValue(theDict, @"scanRequest");
    if (Value
      && (int v5 = Value, v6 = CFGetTypeID(Value), v6 == CFDictionaryGetTypeID())
      && (CFArrayRef v7 = (const __CFArray *)CFDictionaryGetValue(theDict, @"scanResults")) != 0
      && (CFArrayRef v8 = v7, v9 = CFGetTypeID(v7), v9 == CFArrayGetTypeID()))
    {
      NetworksFromRecords = _WiFiCreateNetworksFromRecords(v8);
      uint64_t v11 = *(void (**)(uint64_t, const void *, __CFArray *, void, void))(a1 + 256);
      if (v11) {
        v11(a1, v5, NetworksFromRecords, 0, *(void *)(a1 + 264));
      }
      if (NetworksFromRecords)
      {
        CFRelease(NetworksFromRecords);
      }
    }
    else
    {
      uint64_t v12 = (void *)MEMORY[0x1C18A51F0]();
    }
  }
}

uint64_t _WiFiDeviceClientDispatchLinkEvent(uint64_t result, CFDictionaryRef theDict)
{
  uint64_t v3 = result;
  mach_port_t v4 = *(uint64_t (**)(uint64_t, void))(result + 96);
  if (v4) {
    uint64_t result = v4(result, *(void *)(result + 104));
  }
  if (*(void *)(v3 + 448))
  {
    CFStringRef Value = CFDictionaryGetValue(theDict, @"LINK_CHANGED_NETWORK");
    if (Value)
    {
      CFTypeID v6 = WiFiNetworkCreate(*MEMORY[0x1E4F1CF80], Value);
      if (v6)
      {
        CFArrayRef v7 = v6;
        CFDictionaryReplaceValue(theDict, @"LINK_CHANGED_NETWORK", v6);
        CFRelease(v7);
      }
    }
    CFTypeID v9 = *(uint64_t (**)(uint64_t, CFDictionaryRef, uint64_t))(v3 + 448);
    uint64_t v8 = *(void *)(v3 + 456);
    return v9(v3, theDict, v8);
  }
  return result;
}

void _WiFiDeviceClientDispatchAutoJoinNotification(uint64_t a1, CFDictionaryRef theDict)
{
  if (theDict)
  {
    CFStringRef Value = CFDictionaryGetValue(theDict, @"autoJoinNetwork");
    if (Value)
    {
      int v5 = WiFiNetworkCreate(*MEMORY[0x1E4F1CF80], Value);
      CFDictionaryReplaceValue(theDict, @"autoJoinNetwork", v5);
      if (v5) {
        CFRelease(v5);
      }
    }
    CFTypeID v6 = *(void (**)(uint64_t, CFDictionaryRef, uint64_t))(a1 + 464);
    if (v6)
    {
      uint64_t v7 = *(void *)(a1 + 472);
      v6(a1, theDict, v7);
    }
  }
  else
  {
    BOOL v8 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR);
    if (v8) {
      _WiFiDeviceClientDispatchAutoJoinNotification_cold_1(v8, v9, v10, v11, v12, v13, v14, v15);
    }
  }
}

void _WiFiDeviceClientDispatchUserJoinNotification(uint64_t a1, CFDictionaryRef theDict)
{
  if (theDict)
  {
    CFStringRef Value = CFDictionaryGetValue(theDict, @"userJoinNetwork");
    if (Value)
    {
      int v5 = WiFiNetworkCreate(*MEMORY[0x1E4F1CF80], Value);
      CFDictionaryReplaceValue(theDict, @"userJoinNetwork", v5);
      if (v5) {
        CFRelease(v5);
      }
    }
    CFTypeID v6 = CFDictionaryGetValue(theDict, @"userJoinStatus");
    if (v6)
    {
      uint64_t v7 = v6;
      BOOL v8 = CFEqual(v6, @"userJoinStarted")
        || CFEqual(v7, @"userJoinScanning")
        || CFEqual(v7, @"userJoinAssociating")
        || CFEqual(v7, @"userJoinWaiting") != 0;
    }
    else
    {
      BOOL v8 = 0;
    }
    uint64_t v9 = *(void (**)(uint64_t, BOOL, CFDictionaryRef, uint64_t))(a1 + 480);
    if (v9)
    {
      uint64_t v10 = *(void *)(a1 + 488);
      v9(a1, v8, theDict, v10);
    }
  }
  else
  {
    BOOL v11 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR);
    if (v11) {
      _WiFiDeviceClientDispatchUserJoinNotification_cold_1(v11, v12, v13, v14, v15, v16, v17, v18);
    }
  }
}

uint64_t _WiFiDeviceClientDispatchResumeScanEvent(uint64_t result)
{
  CFPropertyListRef v1 = *(uint64_t (**)(uint64_t, void))(result + 128);
  if (v1) {
    return v1(result, *(void *)(result + 136));
  }
  return result;
}

uint64_t _WiFiDeviceClientDispatchBgScanSuspendResumeEvent(uint64_t result, uint64_t a2)
{
  int v2 = *(uint64_t (**)(uint64_t, uint64_t, void))(result + 288);
  if (v2) {
    return v2(result, a2, *(void *)(result + 296));
  }
  return result;
}

uint64_t _WiFiDeviceClientDispatchBTCoexStatsEvent(uint64_t result, uint64_t a2)
{
  int v2 = *(uint64_t (**)(uint64_t, uint64_t, void))(result + 336);
  if (v2) {
    return v2(result, a2, *(void *)(result + 344));
  }
  return result;
}

uint64_t _WiFiDeviceClientDispatchBSPEvent(uint64_t result, uint64_t a2)
{
  int v2 = *(uint64_t (**)(uint64_t, uint64_t, void))(result + 624);
  if (v2) {
    return v2(result, a2, *(void *)(result + 632));
  }
  return result;
}

uint64_t _WiFiDeviceClientDispatchUCMEvent(uint64_t result, uint64_t a2)
{
  int v2 = *(uint64_t (**)(uint64_t, uint64_t, void))(result + 640);
  if (v2) {
    return v2(result, a2, *(void *)(result + 648));
  }
  return result;
}

void _WiFiDeviceClientDispatchBTScanIntervalRelaxEvent(uint64_t a1, uint64_t a2)
{
  int v2 = *(void (**)(uint64_t, uint64_t, uint64_t))(a1 + 368);
  if (v2)
  {
    uint64_t v3 = *(void *)(a1 + 376);
    v2(a1, a2, v3);
  }
  else
  {
    mach_port_t v4 = (void *)MEMORY[0x1C18A51F0]();
  }
}

void _WiFiDeviceClientDispatch24GHzNetworkInCriticalStateEvent(uint64_t a1, uint64_t a2)
{
  int v2 = *(void (**)(uint64_t, uint64_t, uint64_t))(a1 + 384);
  if (v2)
  {
    uint64_t v3 = *(void *)(a1 + 392);
    v2(a1, a2, v3);
  }
  else
  {
    mach_port_t v4 = (void *)MEMORY[0x1C18A51F0]();
  }
}

void _WiFiDeviceClientDispatchM1M4Handshake24GHzCountEvent(uint64_t a1, uint64_t a2)
{
  int v2 = *(void (**)(uint64_t, uint64_t, uint64_t))(a1 + 400);
  if (v2)
  {
    uint64_t v3 = *(void *)(a1 + 408);
    v2(a1, a2, v3);
  }
  else
  {
    mach_port_t v4 = (void *)MEMORY[0x1C18A51F0]();
  }
}

void _WiFiDeviceClientDispatchCarPlayNetworkTypeChangeEvent(uint64_t a1, uint64_t a2)
{
  int v2 = *(void (**)(uint64_t, uint64_t, uint64_t))(a1 + 416);
  if (v2)
  {
    uint64_t v3 = *(void *)(a1 + 424);
    v2(a1, a2, v3);
  }
  else
  {
    mach_port_t v4 = (void *)MEMORY[0x1C18A51F0]();
  }
}

uint64_t _WiFiDeviceClientDispatchDiagnosticsStartEvent(uint64_t result, uint64_t a2)
{
  int v2 = *(uint64_t (**)(uint64_t, uint64_t, void))(result + 432);
  if (v2) {
    return v2(result, a2, *(void *)(result + 440));
  }
  return result;
}

uint64_t _WiFiDeviceClientDispatchHostApStateChangedEvent(uint64_t result, uint64_t a2)
{
  int v2 = *(uint64_t (**)(uint64_t, uint64_t, void))(result + 496);
  if (v2) {
    return v2(result, a2, *(void *)(result + 504));
  }
  return result;
}

uint64_t _WiFiDeviceClientDispatchGasResults(uint64_t result, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, void))(result + 512);
  if (v3) {
    return v3(result, a2, a3, *(void *)(result + 520));
  }
  return result;
}

uint64_t _WiFiDeviceClientDispatchRangingResult(uint64_t result, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, void))(result + 560);
  if (v3) {
    return v3(result, a2, a3, *(void *)(result + 568));
  }
  return result;
}

uint64_t _WiFiDeviceClientDispatchRangingReportEvent(uint64_t result, uint64_t a2)
{
  if (result)
  {
    int v2 = *(uint64_t (**)(uint64_t, uint64_t, void))(result + 576);
    if (v2) {
      return v2(result, a2, *(void *)(result + 584));
    }
  }
  return result;
}

uint64_t _WiFiDeviceClientDispatchDeviceAvailableEvent(uint64_t result, uint64_t a2)
{
  int v2 = *(uint64_t (**)(uint64_t, uint64_t, void))(result + 528);
  if (v2) {
    return v2(result, a2, *(void *)(result + 536));
  }
  return result;
}

uint64_t _WiFiDeviceClientDispatchRoamStatusEvent(uint64_t result, uint64_t a2)
{
  if (result)
  {
    int v2 = *(uint64_t (**)(uint64_t, uint64_t, void))(result + 592);
    if (v2) {
      return v2(result, a2, *(void *)(result + 600));
    }
  }
  return result;
}

uint64_t WiFiDeviceClientGasStartAsync(uint64_t a1, const __CFArray *a2, const void *a3, uint64_t a4, uint64_t a5)
{
  uint64_t result = 4294963396;
  if (a2 && a3)
  {
    *(void *)(a1 + 512) = a4;
    *(void *)(a1 + 520) = a5;
    CFAllocatorRef v8 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
    CFDataRef BinaryData = (const __CFData *)_CFPropertyListCreateBinaryData((CFAllocatorRef)*MEMORY[0x1E4F1CF80], a3);
    CFDataRef v10 = BinaryData;
    if (BinaryData)
    {
      BytePtr = CFDataGetBytePtr(BinaryData);
      int Length = CFDataGetLength(v10);
    }
    else
    {
      BytePtr = 0;
      int Length = 0;
    }
    RecordsFromNetworks = _WiFiCreateRecordsFromNetworks(a2);
    if (RecordsFromNetworks)
    {
      CFDataRef v14 = (const __CFData *)_CFPropertyListCreateBinaryData(v8, RecordsFromNetworks);
      CFDataRef v15 = v14;
      if (v14)
      {
        uint64_t v16 = CFDataGetBytePtr(v14);
        int v17 = CFDataGetLength(v15);
      }
      else
      {
        uint64_t v16 = 0;
        int v17 = 0;
      }
    }
    else
    {
      uint64_t v16 = 0;
      int v17 = 0;
      CFDataRef v15 = 0;
    }
    unsigned int v21 = -1431655766;
    mach_port_t v18 = *(_DWORD *)(a1 + 16);
    int v19 = CFDataGetBytePtr(*(CFDataRef *)(a1 + 48));
    int v20 = CFDataGetLength(*(CFDataRef *)(a1 + 48));
    wifi_device_gas_start_async(v18, (uint64_t)v19, v20, (uint64_t)v16, v17, (uint64_t)BytePtr, Length, (int *)&v21);
    if (RecordsFromNetworks) {
      CFRelease(RecordsFromNetworks);
    }
    if (v15) {
      CFRelease(v15);
    }
    if (v10) {
      CFRelease(v10);
    }
    return v21;
  }
  return result;
}

uint64_t WiFiDeviceClientSetRangeable(uint64_t a1, int a2, const void *a3)
{
  if (a3)
  {
    CFDataRef BinaryData = (const __CFData *)_CFPropertyListCreateBinaryData((CFAllocatorRef)*MEMORY[0x1E4F1CF80], a3);
    CFDataRef v6 = BinaryData;
    if (BinaryData)
    {
      BytePtr = CFDataGetBytePtr(BinaryData);
      int Length = CFDataGetLength(v6);
      goto LABEL_6;
    }
  }
  else
  {
    CFDataRef v6 = 0;
  }
  BytePtr = 0;
  int Length = 0;
LABEL_6:
  int v13 = -1431655766;
  mach_port_t v9 = *(_DWORD *)(a1 + 16);
  CFDataRef v10 = CFDataGetBytePtr(*(CFDataRef *)(a1 + 48));
  int v11 = CFDataGetLength(*(CFDataRef *)(a1 + 48));
  wifi_device_set_rangeable(v9, (uint64_t)v10, v11, a2, (uint64_t)BytePtr, Length, &v13);
  if (v6) {
    CFRelease(v6);
  }
  if (v13) {
    return 4294963394;
  }
  else {
    return 0;
  }
}

uint64_t WiFiDeviceClientSetRangingIdentifier(uint64_t a1, const void *a2)
{
  if (a2)
  {
    CFDataRef BinaryData = (const __CFData *)_CFPropertyListCreateBinaryData((CFAllocatorRef)*MEMORY[0x1E4F1CF80], a2);
    CFDataRef v4 = BinaryData;
    if (BinaryData)
    {
      BytePtr = CFDataGetBytePtr(BinaryData);
      int Length = CFDataGetLength(v4);
    }
    else
    {
      BytePtr = 0;
      int Length = 0;
    }
    int v7 = 1;
  }
  else
  {
    BytePtr = 0;
    int Length = 0;
    CFDataRef v4 = 0;
    int v7 = 0;
  }
  int v12 = -1431655766;
  mach_port_t v8 = *(_DWORD *)(a1 + 16);
  mach_port_t v9 = CFDataGetBytePtr(*(CFDataRef *)(a1 + 48));
  int v10 = CFDataGetLength(*(CFDataRef *)(a1 + 48));
  wifi_device_set_ranging_identifier(v8, (uint64_t)v9, v10, v7, (uint64_t)BytePtr, Length, &v12);
  if (v4) {
    CFRelease(v4);
  }
  if (v12) {
    return 4294963394;
  }
  else {
    return 0;
  }
}

uint64_t WiFiDeviceClientRangingStartAsync(uint64_t a1, const void *a2, uint64_t a3, uint64_t a4, double a5)
{
  if (!a2) {
    return 4294963396;
  }
  *(void *)(a1 + 560) = a3;
  *(void *)(a1 + 568) = a4;
  CFDataRef BinaryData = (const __CFData *)_CFPropertyListCreateBinaryData((CFAllocatorRef)*MEMORY[0x1E4F1CF80], a2);
  CFDataRef v8 = BinaryData;
  if (BinaryData)
  {
    BytePtr = CFDataGetBytePtr(BinaryData);
    int Length = CFDataGetLength(v8);
  }
  else
  {
    BytePtr = 0;
    int Length = 0;
  }
  unsigned int v15 = -1431655766;
  mach_port_t v12 = *(_DWORD *)(a1 + 16);
  int v13 = CFDataGetBytePtr(*(CFDataRef *)(a1 + 48));
  int v14 = CFDataGetLength(*(CFDataRef *)(a1 + 48));
  wifi_device_ranging_start_async(v12, (uint64_t)v13, v14, (uint64_t)BytePtr, Length, (int)a5, (int *)&v15);
  if (v8) {
    CFRelease(v8);
  }
  return v15;
}

uint64_t WiFiDeviceClientDebugCommand(uint64_t a1, const void *a2, CFPropertyListRef *a3)
{
  unsigned int v13 = -1431655766;
  memset(length, 0, sizeof(length));
  if (a2)
  {
    CFDataRef BinaryData = (const __CFData *)_CFPropertyListCreateBinaryData((CFAllocatorRef)*MEMORY[0x1E4F1CF80], a2);
    CFDataRef v6 = BinaryData;
    if (BinaryData)
    {
      BytePtr = CFDataGetBytePtr(BinaryData);
      int v8 = CFDataGetLength(v6);
    }
    else
    {
      BytePtr = 0;
      int v8 = 0;
    }
    mach_port_t v9 = *(_DWORD *)(a1 + 16);
    int v10 = CFDataGetBytePtr(*(CFDataRef *)(a1 + 48));
    int v11 = CFDataGetLength(*(CFDataRef *)(a1 + 48));
    wifi_device_debug_command(v9, (uint64_t)v10, v11, (uint64_t)BytePtr, v8, &length[1], length, &v13);
    if (a3) {
      *a3 = _WiFiCopyUnserialized(*(UInt8 **)&length[1], length[0]);
    }
    if (v6) {
      CFRelease(v6);
    }
  }
  else
  {
    unsigned int v13 = -3900;
  }
  _WiFiVMDealloc(*(uint64_t *)&length[1], length[0]);
  return v13;
}

CFPropertyListRef WiFiDeviceClientCopyRoamStats(uint64_t a1)
{
  memset(length, 0, sizeof(length));
  int v2 = *(_DWORD *)(a1 + 16);
  BytePtr = CFDataGetBytePtr(*(CFDataRef *)(a1 + 48));
  int v4 = CFDataGetLength(*(CFDataRef *)(a1 + 48));
  wifi_device_copy_roam_stats(v2, (uint64_t)BytePtr, v4, &length[1], length);
  CFPropertyListRef v5 = _WiFiCopyUnserialized(*(UInt8 **)&length[1], length[0]);
  _WiFiVMDealloc(*(uint64_t *)&length[1], length[0]);
  return v5;
}

uint64_t WiFiDeviceClientSetTrgDiscParams(uint64_t a1, const void *a2)
{
  if (!a2) {
    return 4294963396;
  }
  unsigned int v14 = -1431655766;
  CFDataRef BinaryData = (const __CFData *)_CFPropertyListCreateBinaryData((CFAllocatorRef)*MEMORY[0x1E4F1CF80], a2);
  if (BinaryData)
  {
    CFDataRef v4 = BinaryData;
    BytePtr = CFDataGetBytePtr(BinaryData);
    int Length = CFDataGetLength(v4);
    mach_port_t v7 = *(_DWORD *)(a1 + 16);
    int v8 = CFDataGetBytePtr(*(CFDataRef *)(a1 + 48));
    int v9 = CFDataGetLength(*(CFDataRef *)(a1 + 48));
    wifi_device_set_trgdisc_params(v7, (uint64_t)v8, v9, (uint64_t)BytePtr, Length, (int *)&v14);
    CFRelease(v4);
  }
  else
  {
    mach_port_t v11 = *(_DWORD *)(a1 + 16);
    mach_port_t v12 = CFDataGetBytePtr(*(CFDataRef *)(a1 + 48));
    int v13 = CFDataGetLength(*(CFDataRef *)(a1 + 48));
    wifi_device_set_trgdisc_params(v11, (uint64_t)v12, v13, 0, 0, (int *)&v14);
  }
  return v14;
}

uint64_t WiFiDeviceClientTrafficRegistration(uint64_t a1, uint64_t a2)
{
  if (!a2) {
    return 4294963396;
  }
  char v8 = 0;
  id v7 = 0;
  uint64_t v3 = [objc_alloc(MEMORY[0x1E4FB6FA8]) initWithDictionary:a2 isActive:&v8];
  if (!v3) {
    return 4294963396;
  }
  CFDataRef v4 = (void *)v3;
  id v5 = *(id *)(a1 + 72);
  if (!v5)
  {
    id v5 = objc_alloc_init(MEMORY[0x1E4FB6FA0]);
    *(void *)(a1 + 72) = v5;
  }
  if (v8) {
    [v5 setTrafficRegistration:v4 error:&v7];
  }
  else {
    [v5 clearTrafficRegistration:v4 error:&v7];
  }

  uint64_t result = (uint64_t)v7;
  if (v7) {
    return [v7 code];
  }
  return result;
}

CFPropertyListRef WiFiDeviceClientSendWoWBlacklistCommandAndCopyResponse(uint64_t a1, const void *a2, _DWORD *a3)
{
  memset(length, 0, sizeof(length));
  if (a2)
  {
    CFDataRef BinaryData = (const __CFData *)_CFPropertyListCreateBinaryData((CFAllocatorRef)*MEMORY[0x1E4F1CF80], a2);
    CFDataRef v7 = BinaryData;
    if (BinaryData)
    {
      BytePtr = CFDataGetBytePtr(BinaryData);
      int v9 = CFDataGetLength(v7);
    }
    else
    {
      BytePtr = 0;
      int v9 = 0;
    }
    mach_port_t v10 = *(_DWORD *)(a1 + 16);
    mach_port_t v11 = CFDataGetBytePtr(*(CFDataRef *)(a1 + 48));
    int v12 = CFDataGetLength(*(CFDataRef *)(a1 + 48));
    wifi_device_wowblacklist_command(v10, (uint64_t)v11, v12, (uint64_t)BytePtr, v9, &length[1], length, a3);
    CFPropertyListRef v13 = 0;
    if (*(void *)&length[1] && length[0]) {
      CFPropertyListRef v13 = _WiFiCopyUnserialized(*(UInt8 **)&length[1], length[0]);
    }
    if (v7) {
      CFRelease(v7);
    }
  }
  else
  {
    CFPropertyListRef v13 = 0;
  }
  _WiFiVMDealloc(*(uint64_t *)&length[1], length[0]);
  return v13;
}

uint64_t WiFiDeviceClientNotifySoftError(uint64_t a1, const void *a2)
{
  int v14 = -3900;
  if (a2)
  {
    CFDataRef BinaryData = (const __CFData *)_CFPropertyListCreateBinaryData((CFAllocatorRef)*MEMORY[0x1E4F1CF80], a2);
    if (BinaryData)
    {
      CFDataRef v4 = BinaryData;
      BytePtr = CFDataGetBytePtr(BinaryData);
      int Length = CFDataGetLength(v4);
      mach_port_t v7 = *(_DWORD *)(a1 + 16);
      char v8 = CFDataGetBytePtr(*(CFDataRef *)(a1 + 48));
      int v9 = CFDataGetLength(*(CFDataRef *)(a1 + 48));
      wifi_device_soft_error_notification(v7, (uint64_t)v8, v9, (uint64_t)BytePtr, Length, &v14);
      CFRelease(v4);
    }
    else
    {
      mach_port_t v10 = *(_DWORD *)(a1 + 16);
      mach_port_t v11 = CFDataGetBytePtr(*(CFDataRef *)(a1 + 48));
      int v12 = CFDataGetLength(*(CFDataRef *)(a1 + 48));
      wifi_device_soft_error_notification(v10, (uint64_t)v11, v12, 0, 0, &v14);
    }
  }
  else
  {
  }
  if (v14) {
    return 4294963394;
  }
  else {
    return 0;
  }
}

CFDictionaryRef WiFiDeviceClientAutoJoinBlacklistCommand(uint64_t a1, const void *a2, _DWORD *a3)
{
  length[0] = 0;
  CFDataRef BinaryData = (const __CFData *)_CFPropertyListCreateBinaryData((CFAllocatorRef)*MEMORY[0x1E4F1CF80], a2);
  CFDataRef v7 = BinaryData;
  if (BinaryData)
  {
    BytePtr = CFDataGetBytePtr(BinaryData);
    int v9 = CFDataGetLength(v7);
  }
  else
  {
    BytePtr = 0;
    int v9 = 0;
  }
  *(void *)&length[1] = 0xAAAAAAAAAAAAAAAALL;
  mach_port_t v10 = *(_DWORD *)(a1 + 16);
  mach_port_t v11 = CFDataGetBytePtr(*(CFDataRef *)(a1 + 48));
  int v12 = CFDataGetLength(*(CFDataRef *)(a1 + 48));
  wifi_device_autojoinblacklist_command(v10, (uint64_t)v11, v12, (uint64_t)BytePtr, v9, &length[1], length);
  CFDictionaryRef v13 = 0;
  if (*(void *)&length[1] && length[0])
  {
    CFDictionaryRef v13 = (const __CFDictionary *)_WiFiCopyUnserialized(*(UInt8 **)&length[1], length[0]);
    CFArrayRef Value = (const __CFArray *)CFDictionaryGetValue(v13, @"networks");
    NetworksFromRecords = _WiFiCreateNetworksFromRecords(Value);
    if (NetworksFromRecords)
    {
      uint64_t v16 = NetworksFromRecords;
      CFDictionarySetValue(v13, @"networks", NetworksFromRecords);
      CFRelease(v16);
    }
    else
    {
    }
  }
  *a3 = 0;
  if (v7) {
    CFRelease(v7);
  }
  _WiFiVMDealloc(*(uint64_t *)&length[1], length[0]);
  return v13;
}

uint64_t WiFiDeviceClientDestroyEAPTrustExceptionsForCurrentNetwork(uint64_t a1, int *a2)
{
  if (a1)
  {
    mach_port_t v4 = *(_DWORD *)(a1 + 16);
    BytePtr = CFDataGetBytePtr(*(CFDataRef *)(a1 + 48));
    int Length = CFDataGetLength(*(CFDataRef *)(a1 + 48));
    wifi_device_destroy_eap_trust_current_network(v4, (uint64_t)BytePtr, Length, a2);
  }
  else
  {
  }
  if (a2) {
    return 4294963394;
  }
  else {
    return 0;
  }
}

uint64_t WiFiDeviceClientGetLQMEventInterval(uint64_t a1)
{
  unsigned int v6 = 0;
  mach_port_t v2 = *(_DWORD *)(a1 + 16);
  BytePtr = CFDataGetBytePtr(*(CFDataRef *)(a1 + 48));
  int Length = CFDataGetLength(*(CFDataRef *)(a1 + 48));
  wifi_device_get_event_interval(v2, (uint64_t)BytePtr, Length, 14, (int *)&v6);
  return v6;
}

uint64_t WiFiDeviceClientSetLQMEventInterval(uint64_t a1, int a2)
{
  int v8 = -3902;
  mach_port_t v4 = *(_DWORD *)(a1 + 16);
  BytePtr = CFDataGetBytePtr(*(CFDataRef *)(a1 + 48));
  int Length = CFDataGetLength(*(CFDataRef *)(a1 + 48));
  wifi_device_set_event_interval(v4, (uint64_t)BytePtr, Length, 14, a2, &v8);
  if (v8) {
    return 4294963394;
  }
  else {
    return 0;
  }
}

CFPropertyListRef WiFiDeviceClientCopyNetworkRecommendations(uint64_t a1)
{
  memset(length, 0, sizeof(length));
  int v2 = *(_DWORD *)(a1 + 16);
  BytePtr = CFDataGetBytePtr(*(CFDataRef *)(a1 + 48));
  int v4 = CFDataGetLength(*(CFDataRef *)(a1 + 48));
  wifi_device_copy_network_recommendations(v2, (uint64_t)BytePtr, v4, &length[1], length);
  CFPropertyListRef v5 = _WiFiCopyUnserialized(*(UInt8 **)&length[1], length[0]);
  _WiFiVMDealloc(*(uint64_t *)&length[1], length[0]);
  return v5;
}

void WiFiDeviceClientResetAvailabilityEngine(uint64_t a1)
{
  if (a1)
  {
    int v2 = *(_DWORD *)(a1 + 16);
    BytePtr = CFDataGetBytePtr(*(CFDataRef *)(a1 + 48));
    int Length = CFDataGetLength(*(CFDataRef *)(a1 + 48));
    wifi_device_reset_availability_engine(v2, (uint64_t)BytePtr, Length);
  }
  else
  {
    CFPropertyListRef v5 = (void *)MEMORY[0x1C18A51F0]();
  }
}

CFDictionaryRef WiFiDeviceClientBssBlacklistCommandAndCopyResponse(uint64_t a1, const void *a2, _DWORD *a3)
{
  length[0] = 0;
  CFDataRef BinaryData = (const __CFData *)_CFPropertyListCreateBinaryData((CFAllocatorRef)*MEMORY[0x1E4F1CF80], a2);
  CFDataRef v6 = BinaryData;
  if (BinaryData)
  {
    BytePtr = CFDataGetBytePtr(BinaryData);
    int v8 = CFDataGetLength(v6);
  }
  else
  {
    BytePtr = 0;
    int v8 = 0;
  }
  *(void *)&length[1] = 0xAAAAAAAAAAAAAAAALL;
  mach_port_t v9 = *(_DWORD *)(a1 + 16);
  mach_port_t v10 = CFDataGetBytePtr(*(CFDataRef *)(a1 + 48));
  int v11 = CFDataGetLength(*(CFDataRef *)(a1 + 48));
  wifi_device_bssblacklist_command(v9, (uint64_t)v10, v11, (uint64_t)BytePtr, v8, &length[1], length);
  CFDictionaryRef v12 = 0;
  if (*(void *)&length[1] && length[0])
  {
    CFDictionaryRef v12 = (const __CFDictionary *)_WiFiCopyUnserialized(*(UInt8 **)&length[1], length[0]);
    CFArrayRef Value = (const __CFArray *)CFDictionaryGetValue(v12, @"networks");
    NetworksFromRecords = _WiFiCreateNetworksFromRecords(Value);
    if (NetworksFromRecords)
    {
      unsigned int v15 = NetworksFromRecords;
      CFDictionarySetValue(v12, @"networks", NetworksFromRecords);
      CFRelease(v15);
    }
    else
    {
    }
  }
  *a3 = 0;
  if (v6) {
    CFRelease(v6);
  }
  _WiFiVMDealloc(*(uint64_t *)&length[1], length[0]);
  return v12;
}

uint64_t WiFiDeviceClientCopyAirplayStatistics()
{
  return 0;
}

CFPropertyListRef WiFiDeviceClientCopyMimoStatus(CFNumberRef a1)
{
  CFPropertyListRef v1 = a1;
  int v13 = 375;
  memset(length, 0, sizeof(length));
  if (a1)
  {
    CFAllocatorRef v2 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
    a1 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], kCFNumberIntType, &v13);
    if (a1)
    {
      CFNumberRef v3 = a1;
      CFDataRef BinaryData = (const __CFData *)_CFPropertyListCreateBinaryData(v2, a1);
      CFDataRef v5 = BinaryData;
      if (BinaryData)
      {
        BytePtr = CFDataGetBytePtr(BinaryData);
        int v7 = CFDataGetLength(v5);
      }
      else
      {
        BytePtr = 0;
        int v7 = 0;
      }
      mach_port_t v8 = *((_DWORD *)v1 + 4);
      mach_port_t v9 = CFDataGetBytePtr(*((CFDataRef *)v1 + 6));
      int v10 = CFDataGetLength(*((CFDataRef *)v1 + 6));
      wifi_device_copy_property(v8, (uint64_t)v9, v10, (uint64_t)BytePtr, v7, &length[1], length);
      CFPropertyListRef v1 = 0;
      if (*(void *)&length[1] && length[0]) {
        CFPropertyListRef v1 = _WiFiCopyUnserialized(*(UInt8 **)&length[1], length[0]);
      }
      if (v5) {
        CFRelease(v5);
      }
      CFRelease(v3);
      a1 = *(CFNumberRef *)&length[1];
      uint64_t v11 = length[0];
    }
    else
    {
      uint64_t v11 = 0;
      CFPropertyListRef v1 = 0;
    }
  }
  else
  {
    uint64_t v11 = 0;
  }
  _WiFiVMDealloc((uint64_t)a1, v11);
  return v1;
}

BOOL WiFiDeviceClientGetAppState(BOOL result)
{
  int v5 = 0;
  if (result)
  {
    uint64_t v1 = result;
    mach_port_t v2 = *(_DWORD *)(result + 16);
    BytePtr = CFDataGetBytePtr(*(CFDataRef *)(result + 48));
    int Length = CFDataGetLength(*(CFDataRef *)(v1 + 48));
    wifi_device_get_app_state(v2, (uint64_t)BytePtr, Length, &v5);
    return v5 != 0;
  }
  return result;
}

uint64_t WiFiDeviceClientRegisterP2pThreadCoexCallback(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)(a1 + 608) = a2;
  *(void *)(a1 + 616) = a3;
  *(void *)(a1 + 64) = *(void *)(a1 + 64) & 0xFFFFFDFFFFFFFFFFLL | ((unint64_t)(a2 != 0) << 41);
  return _WiFiDeviceClientSendEventMaskToServer(a1);
}

void _WiFiDeviceClientDispatchP2pThreadCoexEvent(uint64_t a1, uint64_t a2)
{
  mach_port_t v2 = *(void (**)(uint64_t, uint64_t, uint64_t))(a1 + 608);
  if (v2)
  {
    uint64_t v3 = *(void *)(a1 + 616);
    v2(a1, a2, v3);
  }
  else
  {
    int v4 = (void *)MEMORY[0x1C18A51F0]();
  }
}

void WiFiDeviceClientInsertMissingNetworkService(uint64_t a1)
{
  if (a1)
  {
    int v2 = *(_DWORD *)(a1 + 16);
    BytePtr = CFDataGetBytePtr(*(CFDataRef *)(a1 + 48));
    int Length = CFDataGetLength(*(CFDataRef *)(a1 + 48));
    wifi_device_insert_missing_network_service(v2, (uint64_t)BytePtr, Length);
  }
  else
  {
    int v5 = (void *)MEMORY[0x1C18A51F0]();
  }
}

void WiFiDeviceClientSet6GDisablementParams(uint64_t a1, uint64_t a2)
{
  CFDictionaryRef v3 = WiFiNetworkCopyRecord(a2);
  if (v3)
  {
    CFDictionaryRef v4 = v3;
    CFDataRef BinaryData = (const __CFData *)_CFPropertyListCreateBinaryData((CFAllocatorRef)*MEMORY[0x1E4F1CF80], v3);
    if (BinaryData)
    {
      CFDataRef v6 = BinaryData;
      int v7 = *(_DWORD *)(a1 + 16);
      BytePtr = CFDataGetBytePtr(*(CFDataRef *)(a1 + 48));
      int Length = CFDataGetLength(*(CFDataRef *)(a1 + 48));
      int v10 = CFDataGetBytePtr(v6);
      int v11 = CFDataGetLength(v6);
      wifi_device_update_network_property(v7, (uint64_t)BytePtr, Length, (uint64_t)v10, v11);
      CFRelease(v6);
    }
    CFRelease(v4);
  }
}

void _WiFiDeviceClientDispatchTdConfirmedEvent(uint64_t a1, uint64_t a2)
{
  int v2 = *(void (**)(uint64_t, uint64_t, uint64_t))(a1 + 656);
  if (v2)
  {
    uint64_t v3 = *(void *)(a1 + 664);
    v2(a1, a2, v3);
  }
  else
  {
    CFDictionaryRef v4 = (void *)MEMORY[0x1C18A51F0]();
  }
}

void __WiFiDeviceClientRelease(void *a1)
{
  int v2 = (const void *)a1[3];
  if (v2)
  {
    CFRelease(v2);
    a1[3] = 0;
  }
  uint64_t v3 = (const void *)a1[6];
  if (v3)
  {
    CFRelease(v3);
    a1[6] = 0;
  }
  CFDictionaryRef v4 = (const void *)a1[9];
  if (v4)
  {
    CFRelease(v4);
    a1[9] = 0;
  }
}

void ___dispatchCopyCurrentNetwork_block_invoke(uint64_t a1)
{
  (*(void (**)(void, void, void))(*(void *)(a1 + 32) + 16))(*(void *)(*(void *)(a1 + 32) + 8), *(void *)(a1 + 40), **(void **)(a1 + 32));
  dispatch_release(*(dispatch_object_t *)(*(void *)(a1 + 32) + 24));
  int v2 = *(void **)(a1 + 32);

  free(v2);
}

CFSetRef __WiFiNetworkRegister()
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  __kWiFiNetworkCFTypeID TypeID = _CFRuntimeRegisterClass();
  *(_OWORD *)values = xmmword_1E63F4268;
  long long v4 = *(_OWORD *)&off_1E63F4278;
  int v5 = @"AcceptEAPTypes";
  CFAllocatorRef v0 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  __eapKeys = (uint64_t)CFArrayCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], (const void **)values, 5, MEMORY[0x1E4F1D510]);
  v2[0] = xmmword_1E63F4290;
  v2[1] = *(_OWORD *)off_1E63F42A0;
  CFSetRef result = CFSetCreate(v0, (const void **)v2, 4, MEMORY[0x1E4F1D548]);
  __internalSSIDs = (uint64_t)result;
  return result;
}

_WORD *WiFiNetworkCreateWithSsid(const __CFString *a1)
{
  if (a1
    && (CFAllocatorRef v2 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80],
        (CFMutableSetRef Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540])) != 0))
  {
    long long v4 = Mutable;
    CFDictionarySetValue(Mutable, @"SSID_STR", a1);
    CFDataRef ExternalRepresentation = CFStringCreateExternalRepresentation(v2, a1, 0x8000100u, 0);
    if (ExternalRepresentation)
    {
      CFDataRef v6 = ExternalRepresentation;
      CFDictionarySetValue(v4, @"SSID", ExternalRepresentation);
      CFRelease(v6);
    }
    __int16 valuePtr = 2;
    CFNumberRef v7 = CFNumberCreate(v2, kCFNumberSInt16Type, &valuePtr);
    if (v7)
    {
      CFNumberRef v8 = v7;
      CFDictionarySetValue(v4, @"AP_MODE", v7);
      CFRelease(v8);
    }
    mach_port_t v9 = WiFiNetworkCreate((int)v2, v4);
    CFRelease(v4);
  }
  else
  {
    return 0;
  }
  return v9;
}

_WORD *WiFiNetworkCreateCopy(uint64_t a1, uint64_t a2)
{
  CFSetRef result = WiFiNetworkCreate(*MEMORY[0x1E4F1CF80], *(CFTypeRef *)(a2 + 16));
  result[12] = *(_WORD *)(a2 + 24);
  return result;
}

CFMutableDictionaryRef WiFiNetworkCopyMutableRecord(uint64_t a1)
{
  return CFDictionaryCreateMutableCopy((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, *(CFDictionaryRef *)(a1 + 16));
}

CFDictionaryRef WiFiNetworkCopyRecord(uint64_t a1)
{
  return CFDictionaryCreateCopy((CFAllocatorRef)*MEMORY[0x1E4F1CF80], *(CFDictionaryRef *)(a1 + 16));
}

CFDictionaryRef WiFiNetworkCopyFilteredRecord(uint64_t a1)
{
  CFAllocatorRef v1 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  CFDictionaryRef MutableCopy = CFDictionaryCreateMutableCopy((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, *(CFDictionaryRef *)(a1 + 16));
  CFDictionaryRef v3 = MutableCopy;
  if (MutableCopy)
  {
    if (!CFDictionaryGetValue(MutableCopy, @"SSID_STR"))
    {
      CFDictionaryRef v6 = v3;
      CFDictionaryRef v3 = 0;
LABEL_10:
      CFRelease(v6);
      return v3;
    }
    CFDictionaryRef Value = (const __CFDictionary *)CFDictionaryGetValue(v3, @"EnterpriseProfile");
    if (Value)
    {
      CFDictionaryRef v5 = CFDictionaryCreateMutableCopy(v1, 0, Value);
      if (v5)
      {
        CFDictionaryRef v6 = v5;
        CFDictionaryRef v7 = (const __CFDictionary *)CFDictionaryGetValue(v5, @"EAPClientConfiguration");
        if (v7)
        {
          CFNumberRef v8 = CFDictionaryCreateMutableCopy(v1, 0, v7);
          if (v8)
          {
            mach_port_t v9 = v8;
            CFDictionaryRemoveValue(v8, @"UserPassword");
            CFDictionaryRemoveValue(v9, @"TLSSaveTrustExceptions");
            CFDictionaryRemoveValue(v9, @"TLSUserTrustProceedCertificateChain");
            CFDictionarySetValue(v6, @"EAPClientConfiguration", v9);
            CFRelease(v9);
          }
        }
        CFDictionarySetValue(v3, @"EnterpriseProfile", v6);
        goto LABEL_10;
      }
    }
  }
  return v3;
}

CFDictionaryRef WiFiNetworkCopyPreparedEAPProfile(CFDictionaryRef *a1, const void *a2)
{
  CFDictionaryRef Property = (const __CFDictionary *)WiFiNetworkGetProperty((uint64_t)a1, @"EnterpriseProfile");
  if (!Property) {
    return 0;
  }
  CFAllocatorRef v5 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  CFDictionaryRef MutableCopy = CFDictionaryCreateMutableCopy((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, Property);
  CFDictionaryRef v7 = MutableCopy;
  if (MutableCopy)
  {
    CFDictionarySetValue(MutableCopy, @"EnableUserInterface", (const void *)*MEMORY[0x1E4F1CFC8]);
    CFDictionaryRef Value = (const __CFDictionary *)CFDictionaryGetValue(v7, @"EAPClientConfiguration");
    if (Value)
    {
      mach_port_t v9 = CFDictionaryCreateMutableCopy(v5, 0, Value);
      if (v9)
      {
        int v10 = v9;
        if (a2)
        {
          CFDictionarySetValue(v9, @"UserPassword", a2);
LABEL_15:
          CFDictionarySetValue(v7, @"EAPClientConfiguration", v10);
          CFRelease(v10);
          return v7;
        }
        if (WiFiNetworkIsHotspot20((BOOL)a1))
        {
          CFStringRef v11 = __WiFiNetworkCopyPasswordForAccount((uint64_t)a1);
          if (!v11)
          {
            CFStringRef v11 = WiFiNetworkCopyPassword(a1);
            if (!v11)
            {
              CFStringRef v11 = __WiFiNetworkCopyPasswordByDomainName((uint64_t)a1);
              if (!v11)
              {
                goto LABEL_15;
              }
            }
          }
        }
        else
        {
          CFStringRef v11 = WiFiNetworkCopyPassword(a1);
          if (!v11) {
            goto LABEL_15;
          }
        }
        CFDictionarySetValue(v10, @"UserPassword", v11);
        CFRelease(v11);
        goto LABEL_15;
      }
    }
  }
  return v7;
}

BOOL WiFiNetworkIsHotspot20(BOOL result)
{
  if (result)
  {
    uint64_t v1 = result;
    return CFDictionaryGetValue(*(CFDictionaryRef *)(result + 16), @"HOTSPOT20_IE")
        || CFDictionaryGetValue(*(CFDictionaryRef *)(v1 + 16), @"DomainName") != 0;
  }
  return result;
}

CFStringRef __WiFiNetworkCopyPasswordForAccount(uint64_t a1)
{
  CFDictionaryRef Property = (__CFString *)WiFiNetworkGetProperty(a1, @"HS20AccountName");
  if (!Property || CFStringGetLength(Property) < 1) {
    return 0;
  }

  return WiFiSecurityCopyPassword(Property);
}

CFStringRef WiFiNetworkCopyPassword(CFDictionaryRef *a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315394;
    CFDictionaryRef v6 = "WiFiNetworkCopyPassword";
    __int16 v7 = 2112;
    CFStringRef AccountForNetwork = WiFiNetworkGetAccountForNetwork(a1);
    _os_log_impl(&dword_1BF1E6000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%s: Copy password for Network %@", (uint8_t *)&v5, 0x16u);
  }
  if (!a1
    || !CFDictionaryContainsKey(a1[2], @"PayloadUUID")
    || (CFStringRef v2 = WiFiNetworkGetAccountForNetwork(a1), (result = WiFiSecurityCopyNonSyncablePassword(v2)) == 0))
  {
    long long v4 = (__CFString *)WiFiNetworkGetAccountForNetwork(a1);
    return WiFiSecurityCopyPassword(v4);
  }
  return result;
}

__CFString *__WiFiNetworkCopyPasswordByDomainName(uint64_t a1)
{
  CFStringRef result = (__CFString *)WiFiNetworkGetProperty(a1, @"DomainName");
  if (result)
  {
    return (__CFString *)WiFiSecurityCopyPassword(result);
  }
  return result;
}

void WiFiNetworkMergeForAssociation(uint64_t a1, uint64_t a2)
{
  if (a1)
  {
    if (CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 16), @"WEP") == (const void *)*MEMORY[0x1E4F1CFD0])
    {
      CFDictionaryRef Property = WiFiNetworkGetProperty(a2, @"WEP_AUTH_Flags");
      if (Property) {
        WiFiNetworkSetProperty(a1, @"WEP_AUTH_Flags", Property);
      }
    }
  }
  if (WiFiNetworkIsEAP(a2))
  {
    int v5 = WiFiNetworkGetProperty(a2, @"EnterpriseProfile");
    if (v5) {
      WiFiNetworkSetProperty(a1, @"EnterpriseProfile", v5);
    }
  }
  if (a2 && CFDictionaryGetValue(*(CFDictionaryRef *)(a2 + 16), @"DomainName") && WiFiNetworkIsHotspot20(a1))
  {
    CFDictionaryRef v6 = WiFiNetworkGetProperty(a2, @"DisplayedOperatorName");
    if (v6) {
      WiFiNetworkSetProperty(a1, @"HS2NetworkBadge", v6);
    }
    SSID = WiFiNetworkGetProperty(a2, @"HS20AccountName");
    if (SSID || (SSID = WiFiNetworkGetSSID((const void *)a2)) != 0)
    {
      WiFiNetworkSetProperty(a1, @"HS20AccountName", SSID);
    }
  }
  CFNumberRef v8 = WiFiNetworkGetProperty(a2, @"TransitionDisabledFlags");
  if (v8) {
    WiFiNetworkSetProperty(a1, @"TransitionDisabledFlags", v8);
  }
  uint64_t v9 = (void *)*MEMORY[0x1E4F5E2C0];
  int v10 = WiFiNetworkGetProperty(a2, (void *)*MEMORY[0x1E4F5E2C0]);
  if (v10) {
    WiFiNetworkSetProperty(a1, v9, v10);
  }
  CFStringRef v11 = WiFiNetworkGetProperty(a2, @"PolicyUUID");
  if (v11) {
    WiFiNetworkSetProperty(a1, @"PolicyUUID", v11);
  }
  CFDictionaryRef v12 = WiFiNetworkGetProperty(a2, @"PayloadUUID");
  if (v12) {
    WiFiNetworkSetProperty(a1, @"PayloadUUID", v12);
  }
  WiFiNetworkMergeAutoJoinProperties(a1, a2);
  if (MEMORY[0x1E4F57E00])
  {
    int v13 = (void *)*MEMORY[0x1E4F57E38];
    int v14 = WiFiNetworkGetProperty(a2, (void *)*MEMORY[0x1E4F57E38]);
    WiFiNetworkSetProperty(a1, v13, v14);
  }
  unsigned int v15 = WiFiNetworkGetProperty(a2, @"WiFiNetworkUserAcceptedRecommendationAt");
  WiFiNetworkSetProperty(a1, @"WiFiNetworkUserAcceptedRecommendationAt", v15);
  if (*(__int16 *)(a1 + 24) == -1)
  {
    int v16 = *(unsigned __int16 *)(a2 + 24);
    if (v16 != 0xFFFF) {
      *(_WORD *)(a1 + 24) = v16;
    }
  }
}

BOOL WiFiNetworkIsWEP(BOOL result)
{
  if (result) {
    return CFDictionaryGetValue(*(CFDictionaryRef *)(result + 16), @"WEP") == (const void *)*MEMORY[0x1E4F1CFD0];
  }
  return result;
}

void WiFiNetworkSetProperty(uint64_t a1, void *key, const void *a3)
{
  if (a1)
  {
    CFDictionaryRef v4 = *(const __CFDictionary **)(a1 + 16);
    if (v4)
    {
      CFArrayRef v7 = (const __CFArray *)__eapKeys;
      if (__eapKeys
        && (v31.length = CFArrayGetCount((CFArrayRef)__eapKeys),
            v31.location = 0,
            int v8 = CFArrayContainsValue(v7, v31, key),
            CFDictionaryRef v4 = *(const __CFDictionary **)(a1 + 16),
            v8))
      {
        CFDictionaryRef Value = (const __CFDictionary *)CFDictionaryGetValue(v4, @"EnterpriseProfile");
        if (!Value
          || (CFDictionaryRef v10 = Value,
              CFAllocatorRef v11 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80],
              (CFMutableDictionaryRef MutableCopy = CFDictionaryCreateMutableCopy((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, Value)) == 0))
        {
          BOOL v21 = 0;
          mach_port_t v18 = 0;
LABEL_28:
          if (a3 && !v18)
          {
LABEL_30:
            CFAllocatorRef v24 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
            CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
            CFDateRef v26 = CFDateCreate(v24, Current);
            if (v26)
            {
              CFDateRef v27 = v26;
              CFDictionarySetValue(*(CFMutableDictionaryRef *)(a1 + 16), @"lastUpdated", v26);
              CFRelease(v27);
              if (!v21) {
                return;
              }
              goto LABEL_39;
            }
LABEL_38:
            if (!v21) {
              return;
            }
            goto LABEL_39;
          }
          char v28 = !v21;
          if (!a3) {
            char v28 = 1;
          }
          if (v28) {
            goto LABEL_38;
          }
          if (CFEqual(a3, v18))
          {
LABEL_39:
            CFRelease(v18);
            return;
          }
LABEL_27:
          BOOL v21 = 1;
          goto LABEL_30;
        }
        int v13 = MutableCopy;
        CFDictionaryRef v14 = (const __CFDictionary *)CFDictionaryGetValue(v10, @"EAPClientConfiguration");
        if (v14 && (CFDictionaryRef v15 = CFDictionaryCreateMutableCopy(v11, 0, v14)) != 0)
        {
          int v16 = v15;
          int v17 = CFDictionaryGetValue(v15, key);
          mach_port_t v18 = v17;
          if (v17) {
            CFRetain(v17);
          }
          CFDictionarySetValue(v16, key, a3);
          CFDictionarySetValue(v13, @"EAPClientConfiguration", v16);
          CFRelease(v16);
        }
        else
        {
          mach_port_t v18 = 0;
        }
        CFDictionarySetValue(*(CFMutableDictionaryRef *)(a1 + 16), @"EnterpriseProfile", v13);
        CFRelease(v13);
      }
      else
      {
        int v19 = CFDictionaryGetValue(v4, key);
        mach_port_t v18 = v19;
        if (v19) {
          CFRetain(v19);
        }
        int v20 = *(__CFDictionary **)(a1 + 16);
        if (a3) {
          CFDictionarySetValue(v20, key, a3);
        }
        else {
          CFDictionaryRemoveValue(v20, key);
        }
        if (CFEqual(key, @"EnterpriseProfile") && !__WiFiNetworkIsWPAEAP(*(const __CFDictionary **)(a1 + 16)))
        {
          unsigned int v22 = __WiFiNetworkIsSAE(*(const __CFDictionary **)(a1 + 16));
          int IsWPAWPA2PSK = WiFiNetworkIsWPAWPA2PSK(a1);
          if (v22) {
            WiFiNetworkSetSAE(a1, 1, IsWPAWPA2PSK);
          }
          else {
            WiFiNetworkSetWPA(a1, IsWPAWPA2PSK);
          }
        }
      }
      BOOL v21 = v18 != 0;
      if (!a3 && v18) {
        goto LABEL_27;
      }
      goto LABEL_28;
    }
  }
  CFIndex v29 = (void *)MEMORY[0x1C18A51F0]();
}

BOOL WiFiNetworkIsEAP(uint64_t a1)
{
  if (!a1 || WiFiNetworkIsWAPI(a1)) {
    return 0;
  }
  CFDictionaryRef v3 = *(const __CFDictionary **)(a1 + 16);

  return __WiFiNetworkIsEAP(v3);
}

BOOL WiFiNetworkIsHS20Account(BOOL result)
{
  if (result) {
    return CFDictionaryGetValue(*(CFDictionaryRef *)(result + 16), @"DomainName") != 0;
  }
  return result;
}

void WiFiNetworkSetHS2NetworkBadge(uint64_t a1, const void *a2)
{
}

const void *WiFiNetworkGetSSID(const void *result)
{
  if (result)
  {
    uint64_t v1 = (uint64_t)result;
    CFStringRef result = WiFiNetworkGetProperty((uint64_t)result, @"SSID_STR");
    if (!result)
    {
      CFDataRef Property = (const __CFData *)WiFiNetworkGetProperty(v1, @"SSID");
      CFAllocatorRef v3 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
      if (Property
        && ((CFDataRef v4 = Property,
             (CFStringRef v5 = CFStringCreateFromExternalRepresentation((CFAllocatorRef)*MEMORY[0x1E4F1CF80], Property, 0x8000100u)) != 0)
         || (CFStringRef v5 = CFStringCreateFromExternalRepresentation(v3, v4, 0)) != 0)
        || (CFStringRef v5 = CFStringCreateWithCString(v3, "", 0x8000100u)) != 0)
      {
        WiFiNetworkSetProperty(v1, @"SSID_STR", v5);
        CFRelease(v5);
      }
      return WiFiNetworkGetProperty(v1, @"SSID_STR");
    }
  }
  return result;
}

CFStringRef WiFiNetworkGetAccountForNetwork(const void *a1)
{
  if (!a1) {
    return 0;
  }
  CFStringRef SSID = (const __CFString *)WiFiNetworkGetSSID(a1);
  CFStringRef v3 = SSID;
  if ((!SSID || !CFStringGetLength(SSID)) && WiFiNetworkIsHotspot20((BOOL)a1))
  {
    CFDataRef Property = WiFiNetworkGetProperty((uint64_t)a1, @"DomainName");
    if (Property) {
      return (const __CFString *)Property;
    }
  }
  return v3;
}

void WiFiNetworkMergeAutoJoinProperties(uint64_t a1, uint64_t a2)
{
  if (a1 && a2)
  {
    WiFiNetworkRemoveAutoJoinProperties(a1);
    BOOL IsEnabled = WiFiNetworkIsEnabled(a2);
    WiFiNetworkSetState(a1, IsEnabled);
    if (IsEnabled) {
      return;
    }
    CFDataRef Property = WiFiNetworkGetProperty(a2, @"networkDisabledClientName");
    WiFiNetworkSetProperty(a1, @"networkDisabledClientName", Property);
    CFDictionaryRef v6 = WiFiNetworkGetProperty(a2, @"networkDisabledReason");
    WiFiNetworkSetProperty(a1, @"networkDisabledReason", v6);
    CFArrayRef v7 = WiFiNetworkGetProperty(a2, @"networkDisabledTimestamp");
    WiFiNetworkSetProperty(a1, @"networkDisabledTimestamp", v7);
    int v8 = WiFiNetworkGetProperty(a2, @"WiFiNetworkDisabledUntilDate");
    if (!v8) {
      return;
    }
    WiFiNetworkSetProperty(a1, @"WiFiNetworkDisabledUntilDate", v8);
  }
  uint64_t v9 = (void *)MEMORY[0x1C18A51F0]();
}

void WiFiNetworkMerge(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    WiFiNetworkMergeProperties(a1, *(CFDictionaryRef *)(a2 + 16));
    if (*(__int16 *)(a1 + 24) == -1)
    {
      int v4 = *(unsigned __int16 *)(a2 + 24);
      if (v4 != 0xFFFF) {
        *(_WORD *)(a1 + 24) = v4;
      }
    }
  }
}

void WiFiNetworkMergeProperties(uint64_t a1, CFDictionaryRef theDict)
{
  if (!a1) {
    return;
  }
  if (!theDict) {
    return;
  }
  uint64_t v3 = a1;
  unsigned int Count = CFDictionaryGetCount(theDict);
  uint64_t v5 = Count;
  if (!Count) {
    return;
  }
  size_t v6 = 8 * Count;
  CFArrayRef v7 = (const void **)malloc_type_malloc(v6, 0x6004044C4A2DFuLL);
  uint64_t v40 = (const void **)malloc_type_malloc(v6, 0xC0040B8AA526DuLL);
  CFDictionaryGetKeysAndValues(theDict, v7, v40);
  uint64_t v8 = 0;
  int v9 = 0;
  char v43 = 0;
  CFStringRef v10 = @"LEAKY_AP_LEARNED_DATA";
  CFAllocatorRef allocator = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  uint64_t v38 = v5;
  do
  {
    if (CFEqual(v10, (CFStringRef)v7[v8]))
    {
      char v43 = 1;
    }
    if (WiFiNetworkIsHotspot20(v3)
      && (CFEqual(@"SSID_STR", (CFStringRef)v7[v8])
       || CFEqual(@"SSID", (CFStringRef)v7[v8])))
    {
      goto LABEL_42;
    }
    if (CFEqual(@"PRIVATE_MAC_ADDRESS", (CFStringRef)v7[v8])) {
      goto LABEL_42;
    }
    if (CFEqual(@"EnterpriseProfile", (CFStringRef)v7[v8]))
    {
      CFDictionaryRef Property = (const __CFDictionary *)WiFiNetworkGetProperty(v3, @"EnterpriseProfile");
      CFDictionaryRef Mutable = Property;
      if (!Property) {
        CFDictionaryRef Mutable = CFDictionaryCreateMutable(allocator, 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
      }
      CFDictionaryRef v14 = (const __CFDictionary *)v40[v8];
      CFDictionaryRef v15 = _copyDictionaryAddingMissingValuesFromSource(Mutable, v14);
      value = 0;
      CFDictionaryRef valuePtr = 0;
      CFDictionaryGetValueIfPresent(v14, @"EAPClientConfiguration", (const void **)&valuePtr);
      CFDictionaryGetValueIfPresent(Mutable, @"EAPClientConfiguration", (const void **)&value);
      CFDictionaryRef v16 = valuePtr;
      if (valuePtr)
      {
        int v17 = value;
        mach_port_t v18 = value;
        if (!value)
        {
          mach_port_t v18 = CFDictionaryCreateMutable(allocator, 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
          value = v18;
          CFDictionaryRef v16 = valuePtr;
        }
        CFDictionaryRef v19 = _copyDictionaryAddingMissingValuesFromSource((CFDictionaryRef)v18, v16);
        CFAllocatorRef Default = CFAllocatorGetDefault();
        CFMutableDictionaryRef MutableCopy = CFDictionaryCreateMutableCopy(Default, 0, v15);
        CFDictionarySetValue(MutableCopy, @"EAPClientConfiguration", v19);
        WiFiNetworkSetProperty(v3, @"EnterpriseProfile", MutableCopy);
        if (MutableCopy) {
          CFRelease(MutableCopy);
        }
        if (v19) {
          CFRelease(v19);
        }
        if (!v17 && value)
        {
          CFRelease(value);
          value = 0;
        }
        if (!v15)
        {
LABEL_37:
          if (!Property && Mutable)
          {
            CFDictionaryRef v22 = Mutable;
            goto LABEL_40;
          }
LABEL_41:
          int v9 = 1;
          uint64_t v5 = v38;
          goto LABEL_42;
        }
      }
      else
      {
        WiFiNetworkSetProperty(v3, @"EnterpriseProfile", v15);
        if (!v15) {
          goto LABEL_37;
        }
      }
      CFRelease(v15);
      goto LABEL_37;
    }
    if (CFStringCompare(@"HomePropertyFromMobilewifitool", (CFStringRef)v7[v8], 0)
      && CFStringCompare(@"COLOCATED_NETWORK_SCOPE_ID", (CFStringRef)v7[v8], 0))
    {
      if (CFEqual(@"NetworkOfInterestHomeState", (CFStringRef)v7[v8]))
      {
        CFNumberRef v11 = (const __CFNumber *)v40[v8];
        LODWORD(valuePtr) = 0;
        if (WiFiNetworkGetNetworkOfInterestHomeType(v3))
        {
          if (v11) {
            CFNumberGetValue(v11, kCFNumberSInt32Type, &valuePtr);
          }
        }
      }
      if (CFEqual(@"networkKnownBSSListKey", (CFStringRef)v7[v8]))
      {
        CFArrayRef v23 = (const __CFArray *)WiFiNetworkGetProperty(v3, @"networkKnownBSSListKey");
        CFArrayRef theArray = (const __CFArray *)v40[v8];
        if (theArray)
        {
          CFArrayRef v24 = v23;
          if (v23)
          {
            uint64_t v36 = v3;
            CFIndex v25 = CFArrayGetCount(theArray);
            CFIndex v26 = CFArrayGetCount(v24);
            uint64_t v39 = CFArrayCreateMutableCopy(allocator, 0, v24);
            CFIndex v41 = v25;
            if (v25 >= 1)
            {
              CFIndex v27 = 0;
              do
              {
                CFDictionaryRef ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(theArray, v27);
                if (ValueAtIndex)
                {
                  CFDictionaryRef v29 = ValueAtIndex;
                  CFStringRef v30 = v10;
                  CFStringRef v31 = (const __CFString *)CFDictionaryGetValue(ValueAtIndex, @"BSSID");
                  if (v26 < 1)
                  {
LABEL_59:
                    CFArrayAppendValue(v39, v29);
                  }
                  else
                  {
                    CFStringRef v32 = v31;
                    CFStringRef v33 = 0;
                    CFIndex v34 = 0;
                    while (1)
                    {
                      CFDictionaryRef v35 = (const __CFDictionary *)CFArrayGetValueAtIndex(v24, v34);
                      if (v35) {
                        CFStringRef v33 = (const __CFString *)CFDictionaryGetValue(v35, @"BSSID");
                      }
                      if (v33 && v32 && CFStringCompare(v33, v32, 1uLL) == kCFCompareEqualTo) {
                        break;
                      }
                      if (v26 == ++v34) {
                        goto LABEL_59;
                      }
                    }
                    CFArraySetValueAtIndex(v39, v34, v29);
                  }
                  CFStringRef v10 = v30;
                }
                ++v27;
              }
              while (v27 != v41);
            }
            uint64_t v3 = v36;
            WiFiNetworkSetProperty(v36, @"networkKnownBSSListKey", v39);
            if (v39)
            {
              CFDictionaryRef v22 = v39;
LABEL_40:
              CFRelease(v22);
            }
            goto LABEL_41;
          }
        }
      }
      if (CFStringCompare(@"lastUpdated", (CFStringRef)v7[v8], 0) || v9 != 1)
      {
        CFRetain(v40[v8]);
        CFDictionarySetValue(*(CFMutableDictionaryRef *)(v3 + 16), v7[v8], v40[v8]);
        CFRelease(v40[v8]);
      }
    }
LABEL_42:
    ++v8;
  }
  while (v8 != v5);
  if ((v43 & 1) == 0)
  {
    if (WiFiNetworkGetProperty(v3, @"LEAKY_AP_LEARNED_DATA"))
    {
      CFDictionaryRemoveValue(*(CFMutableDictionaryRef *)(v3 + 16), @"LEAKY_AP_LEARNED_DATA");
    }
  }
  free(v40);
  free(v7);
}

CFDictionaryRef _copyDictionaryAddingMissingValuesFromSource(CFDictionaryRef result, CFDictionaryRef theDict)
{
  if (result)
  {
    CFDictionaryRef v3 = result;
    if (theDict && (Count = CFDictionaryGetCount(theDict), (uint64_t v5 = Count) != 0))
    {
      size_t v6 = 8 * Count;
      CFArrayRef v7 = (const void **)malloc_type_malloc(v6, 0x6004044C4A2DFuLL);
      uint64_t v8 = (const void **)malloc_type_malloc(v6, 0xC0040B8AA526DuLL);
      CFAllocatorRef Default = CFAllocatorGetDefault();
      CFDictionaryRef MutableCopy = CFDictionaryCreateMutableCopy(Default, 0, v3);
      CFDictionaryGetKeysAndValues(theDict, v7, v8);
      unint64_t v11 = 0;
      uint64_t v12 = 8 * v5;
      do
      {
        CFDictionaryGetValueIfPresent(MutableCopy, v7[v11 / 8], 0);
        CFDictionaryAddValue(MutableCopy, v7[v11 / 8], v8[v11 / 8]);
        v11 += 8;
      }
      while (v12 != v11);
      free(v8);
      free(v7);
      CFAllocatorRef v13 = CFAllocatorGetDefault();
      CFDictionaryRef Copy = CFDictionaryCreateCopy(v13, MutableCopy);
      CFRelease(MutableCopy);
      return Copy;
    }
    else
    {
      CFAllocatorRef v15 = CFAllocatorGetDefault();
      return CFDictionaryCreateCopy(v15, v3);
    }
  }
  return result;
}

CFNumberRef WiFiNetworkGetNetworkOfInterestHomeType(uint64_t a1)
{
  unsigned int valuePtr = 0;
  if (a1)
  {
    CFNumberRef result = (const __CFNumber *)WiFiNetworkGetProperty(a1, @"NetworkOfInterestHomeState");
    if (result)
    {
      int Value = CFNumberGetValue(result, kCFNumberSInt32Type, &valuePtr);
      if (valuePtr - 3 >= 0xFFFFFFFE || Value == 0) {
        return (const __CFNumber *)valuePtr;
      }
      else {
        return 0;
      }
    }
  }
  else
  {
    return 0;
  }
  return result;
}

const void *WiFiNetworkGetKnownBssList(uint64_t a1)
{
  return WiFiNetworkGetProperty(a1, @"networkKnownBSSListKey");
}

CFDictionaryRef WiFiNetworkRecordGetSSID(const __CFDictionary *result)
{
  if (result)
  {
    CFDictionaryRef v1 = result;
    CFNumberRef result = (const __CFDictionary *)CFDictionaryGetValue(result, @"SSID_STR");
    if (!result)
    {
      CFDataRef Value = (const __CFData *)CFDictionaryGetValue(v1, @"SSID");
      CFAllocatorRef v3 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
      if (Value
        && ((CFDataRef v4 = Value,
             (CFStringRef v5 = CFStringCreateFromExternalRepresentation((CFAllocatorRef)*MEMORY[0x1E4F1CF80], Value, 0x8000100u)) != 0)
         || (CFStringRef v5 = CFStringCreateFromExternalRepresentation(v3, v4, 0)) != 0)
        || (CFStringRef v5 = CFStringCreateWithCString(v3, "", 0x8000100u)) != 0)
      {
        CFDictionarySetValue(v1, @"SSID_STR", v5);
        CFRelease(v5);
      }
      return (const __CFDictionary *)CFDictionaryGetValue(v1, @"SSID_STR");
    }
  }
  return result;
}

CFStringRef WiFiNetworkGetSSIDData(const void *a1)
{
  CFStringRef result = (const __CFString *)WiFiNetworkGetProperty((uint64_t)a1, @"SSID");
  if (!result)
  {
    CFStringRef result = (const __CFString *)WiFiNetworkGetSSID(a1);
    if (result)
    {
      CFStringRef result = (const __CFString *)CFStringCreateExternalRepresentation((CFAllocatorRef)*MEMORY[0x1E4F1CF80], result, 0x8000100u, 0);
      if (result)
      {
        CFStringRef v3 = result;
        WiFiNetworkSetProperty((uint64_t)a1, @"SSID", result);
        CFRelease(v3);
        return (const __CFString *)WiFiNetworkGetProperty((uint64_t)a1, @"SSID");
      }
    }
  }
  return result;
}

CFDataRef WiFiNetworkCopyBSSIDData(uint64_t a1)
{
  v5[2] = *MEMORY[0x1E4F143B8];
  CFDataRef result = (CFDataRef)WiFiNetworkGetProperty(a1, @"BSSID");
  if (result)
  {
    CFStringRef v2 = (const __CFString *)result;
    CFTypeID v3 = CFGetTypeID(result);
    if (v3 == CFStringGetTypeID()
      && (uint64_t v4 = 0, v5[0] = 0, *(_DWORD *)((char *)v5 + 7) = 0, CFStringGetCString(v2, (char *)&v4, 19, 0x8000100u)))
    {
      CFDataRef result = (CFDataRef)ether_aton((const char *)&v4);
      if (result) {
        return CFDataCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], (const UInt8 *)result, 6);
      }
    }
    else
    {
      return 0;
    }
  }
  return result;
}

CFArrayRef WiFiNetworkGetLastBSSID(const __CFArray *result)
{
  if (result)
  {
    uint64_t v1 = (uint64_t)result;
    CFDataRef result = (const __CFArray *)WiFiNetworkGetProperty((uint64_t)result, @"BSSID");
    if (!result)
    {
      CFDataRef result = (const __CFArray *)WiFiNetworkGetProperty(v1, @"networkKnownBSSListKey");
      if (result)
      {
        CFArrayRef v2 = result;
        CFDataRef result = (const __CFArray *)CFArrayGetCount(result);
        if (result)
        {
          CFIndex Count = CFArrayGetCount(v2);
          CFDataRef result = (const __CFArray *)CFArrayGetValueAtIndex(v2, Count - 1);
          if (result)
          {
            return (const __CFArray *)CFDictionaryGetValue(result, @"BSSID");
          }
        }
      }
    }
  }
  return result;
}

const void *WiFiNetworkGetBSSIDList(const void *result)
{
  if (result) {
    return WiFiNetworkGetProperty((uint64_t)result, @"SCAN_BSSID_LIST");
  }
  return result;
}

CFArrayRef WiFiNetworkGetLastChannel(const __CFArray *result)
{
  if (result)
  {
    uint64_t v1 = (uint64_t)result;
    CFDataRef result = (const __CFArray *)WiFiNetworkGetProperty((uint64_t)result, @"CHANNEL");
    if (!result)
    {
      CFDataRef result = (const __CFArray *)WiFiNetworkGetProperty(v1, @"networkKnownBSSListKey");
      if (result)
      {
        CFArrayRef v2 = result;
        CFDataRef result = (const __CFArray *)CFArrayGetCount(result);
        if (result)
        {
          CFIndex Count = CFArrayGetCount(v2);
          CFDataRef result = (const __CFArray *)CFArrayGetValueAtIndex(v2, Count - 1);
          if (result)
          {
            return (const __CFArray *)CFDictionaryGetValue(result, @"CHANNEL");
          }
        }
      }
    }
  }
  return result;
}

const void *WiFiNetworkGetChannel(uint64_t a1, uint64_t a2)
{
  if (a1)
  {
    return WiFiNetworkGetProperty(a1, @"CHANNEL");
  }
  else
  {
    return 0;
  }
}

CFArrayRef WiFiNetworkGetBandHistory(const __CFArray *result)
{
  if (result)
  {
    uint64_t v1 = (uint64_t)result;
    CFDataRef result = (const __CFArray *)WiFiNetworkGetProperty((uint64_t)result, @"CHANNEL");
    if (!result)
    {
      CFDataRef result = (const __CFArray *)WiFiNetworkGetProperty(v1, @"networkKnownBSSListKey");
      if (result)
      {
        CFArrayRef v2 = result;
        CFDataRef result = (const __CFArray *)CFArrayGetCount(result);
        if (result)
        {
          CFIndex Count = CFArrayGetCount(v2);
          CFDataRef result = (const __CFArray *)CFArrayGetValueAtIndex(v2, Count - 1);
          if (result)
          {
            return (const __CFArray *)CFDictionaryGetValue(result, @"CHANNEL");
          }
        }
      }
    }
  }
  return result;
}

uint64_t WiFiNetworkGetRateBounds(uint64_t a1, void *a2, void *a3)
{
  *a3 = 0xFFFFFFFF80000000;
  *a2 = 37;
  uint64_t result = (uint64_t)WiFiNetworkGetProperty(a1, @"RATES");
  if (result)
  {
    CFArrayRef v6 = (const __CFArray *)result;
    uint64_t result = CFArrayGetCount((CFArrayRef)result);
    if (result >= 1)
    {
      uint64_t v7 = result;
      for (CFIndex i = 0; i != v7; ++i)
      {
        uint64_t result = (uint64_t)CFArrayGetValueAtIndex(v6, i);
        int valuePtr = -1431655766;
        if (result)
        {
          int v9 = (const void *)result;
          CFTypeID TypeID = CFNumberGetTypeID();
          uint64_t result = CFGetTypeID(v9);
          if (TypeID == result)
          {
            uint64_t result = CFNumberGetValue((CFNumberRef)v9, kCFNumberIntType, &valuePtr);
            uint64_t v11 = valuePtr;
            if (*a3 < valuePtr) {
              *a3 = valuePtr;
            }
            if (*a2 > v11) {
              *a2 = v11;
            }
          }
        }
      }
    }
  }
  return result;
}

CFNumberRef WiFiNetworkGetRSSI(const __CFNumber *result)
{
  if (result)
  {
    CFNumberRef Property = (const __CFNumber *)WiFiNetworkGetProperty((uint64_t)result, @"RSSI");
    return _CFTypeGetIntValue(Property);
  }
  return result;
}

CFNumberRef WiFiNetworkGetIntProperty(uint64_t a1, void *a2)
{
  CFNumberRef Property = (const __CFNumber *)WiFiNetworkGetProperty(a1, a2);

  return _CFTypeGetIntValue(Property);
}

BOOL __WiFiNetworkIsWPAEAP(const __CFDictionary *a1)
{
  CFDictionaryRef Value = (const __CFDictionary *)CFDictionaryGetValue(a1, @"WPA_IE");
  CFDictionaryRef v3 = (const __CFDictionary *)CFDictionaryGetValue(a1, @"RSN_IE");
  if (Value && (CFTypeID TypeID = CFDictionaryGetTypeID(), _CFValidateType(TypeID, Value)))
  {
    BOOL v5 = 1;
    if (!__WiFiNetworkContainsAuthSelector(Value, 1)) {
      BOOL v5 = __WiFiNetworkContainsAuthSelector(Value, 0) != 0;
    }
  }
  else
  {
    BOOL v5 = 0;
  }
  if (!v5)
  {
    if (v3)
    {
      BOOL v5 = 1;
      if (!__WiFiNetworkContainsAuthSelector(v3, 1)
        && !__WiFiNetworkContainsAuthSelector(v3, 0)
        && !__WiFiNetworkContainsAuthSelector(v3, 3)
        && !__WiFiNetworkContainsAuthSelector(v3, 5)
        && !__WiFiNetworkContainsAuthSelector(v3, 12))
      {
        return __WiFiNetworkContainsAuthSelector(v3, 13) != 0;
      }
    }
  }
  return v5;
}

CFDictionaryRef WiFiNetworkIsSAE(const __CFDictionary *result)
{
  if (result) {
    return __WiFiNetworkIsSAE(*((const __CFDictionary **)result + 2));
  }
  return result;
}

void WiFiNetworkSetSAE(int a1, int a2, int a3)
{
  if (a2)
  {
    CFAllocatorRef v5 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
    CFMutableArrayRef Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, MEMORY[0x1E4F1D510]);
    values = Mutable;
    if (Mutable)
    {
      uint64_t v7 = Mutable;
      uint64_t valuePtr = 8;
      CFNumberRef v8 = CFNumberCreate(v5, kCFNumberCFIndexType, &valuePtr);
      if (v8)
      {
        CFNumberRef v9 = v8;
        CFArrayAppendValue(v7, v8);
        CFRelease(v9);
      }
      if (a3)
      {
        uint64_t valuePtr = 2;
        CFNumberRef v10 = CFNumberCreate(v5, kCFNumberCFIndexType, &valuePtr);
        if (v10)
        {
          CFNumberRef v11 = v10;
          CFArrayAppendValue(v7, v10);
          CFRelease(v11);
        }
      }
      else
      {
        WiFiNetworkSetProperty(a1, @"ALLOW_WPA2_PSK");
      }
      keys = @"IE_KEY_RSN_AUTHSELS";
      CFDictionaryRef v12 = CFDictionaryCreate(v5, (const void **)&keys, (const void **)&values, 1, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
      if (v12)
      {
        CFDictionaryRef v13 = v12;
        WiFiNetworkSetProperty(a1, @"RSN_IE");
        CFRelease(v13);
      }
      CFRelease(values);
    }
  }
  else
  {
    WiFiNetworkSetProperty(a1, @"RSN_IE");
  }
}

uint64_t WiFiNetworkIsWPAWPA2PSK(uint64_t result)
{
  if (result)
  {
    CFDictionaryRef v1 = *(const __CFDictionary **)(result + 16);
    if (__WiFiNetworkSupportsWPA(v1))
    {
      return 1;
    }
    else
    {
      return __WiFiNetworkSupportsWPA2(v1);
    }
  }
  return result;
}

void WiFiNetworkSetWPA(uint64_t a1, int a2)
{
  int v2 = a1;
  if (a2)
  {
    uint64_t v3 = 2 * (WiFiNetworkGetProperty(a1, @"EnterpriseProfile") == 0);
    uint64_t valuePtr = v3;
    CFAllocatorRef v4 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
    values = CFNumberCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], kCFNumberCFIndexType, &valuePtr);
    if (values)
    {
      CFTypeRef cf = CFArrayCreate(v4, (const void **)&values, 1, MEMORY[0x1E4F1D510]);
      if (cf)
      {
        CFNumberRef v9 = @"IE_KEY_RSN_AUTHSELS";
        CFDictionaryRef v5 = CFDictionaryCreate(v4, (const void **)&v9, &cf, 1, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
        if (v5)
        {
          CFDictionaryRef v6 = v5;
          WiFiNetworkSetProperty(v2, @"RSN_IE");
          CFRelease(v6);
        }
        if (cf)
        {
          CFRelease(cf);
          CFTypeRef cf = 0;
        }
      }
      if (values)
      {
        CFRelease(values);
        values = 0;
      }
    }
    uint64_t valuePtr = v3;
    values = CFNumberCreate(v4, kCFNumberCFIndexType, &valuePtr);
    if (values)
    {
      CFTypeRef cf = CFArrayCreate(v4, (const void **)&values, 1, MEMORY[0x1E4F1D510]);
      if (cf)
      {
        CFNumberRef v9 = @"IE_KEY_WPA_AUTHSELS";
        CFDictionaryRef v7 = CFDictionaryCreate(v4, (const void **)&v9, &cf, 1, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
        if (v7)
        {
          CFDictionaryRef v8 = v7;
          WiFiNetworkSetProperty(v2, @"WPA_IE");
          CFRelease(v8);
        }
        if (cf)
        {
          CFRelease(cf);
          CFTypeRef cf = 0;
        }
      }
      if (values) {
        CFRelease(values);
      }
    }
  }
  else
  {
    WiFiNetworkSetProperty(a1, @"RSN_IE");
    WiFiNetworkSetProperty(v2, @"WPA_IE");
  }
}

void WiFiNetworkSetIntProperty(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t valuePtr = a3;
  CFNumberRef v5 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], kCFNumberCFIndexType, &valuePtr);
  if (v5)
  {
    CFNumberRef v6 = v5;
    WiFiNetworkSetProperty(a1, a2, v5);
    CFRelease(v6);
  }
}

double WiFiNetworkGetFloatProperty(uint64_t a1, void *a2)
{
  CFNumberRef Property = WiFiNetworkGetProperty(a1, a2);

  return _CFTypeGetFloatValue(Property);
}

void WiFiNetworkSetFloatProperty(uint64_t a1, void *a2, double a3)
{
  double valuePtr = a3;
  CFNumberRef v5 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], kCFNumberDoubleType, &valuePtr);
  if (v5)
  {
    CFNumberRef v6 = v5;
    WiFiNetworkSetProperty(a1, a2, v5);
    CFRelease(v6);
  }
}

CFNumberRef WiFiNetworkIsAdHoc(uint64_t a1)
{
  CFNumberRef result = (const __CFNumber *)WiFiNetworkGetProperty(a1, @"AP_MODE");
  if (result)
  {
    __int16 valuePtr = -21846;
    CFNumberRef result = (const __CFNumber *)CFNumberGetValue(result, kCFNumberSInt16Type, &valuePtr);
    if (result) {
      return (const __CFNumber *)(valuePtr == 1);
    }
  }
  return result;
}

uint64_t WiFiNetworkIsHidden(const void *a1)
{
  CFNumberRef Property = (const __CFNumber *)WiFiNetworkGetProperty((uint64_t)a1, @"HIDDEN_NETWORK");
  IntCFDictionaryRef Value = _CFTypeGetIntValue(Property);
  if (IntValue) {
    goto LABEL_2;
  }
  CFNumberRef v5 = (const __CFNumber *)WiFiNetworkGetProperty((uint64_t)a1, @"scanWasDirected");
  if (!_CFTypeGetIntValue(v5))
  {
    IntCFDictionaryRef Value = WiFiNetworkIsHiddenSSID(a1);
LABEL_2:
    unsigned int v4 = 0;
    goto LABEL_5;
  }
  IntCFDictionaryRef Value = 0;
  unsigned int v4 = 1;
LABEL_5:
  if (IntValue) {
    return 1;
  }
  else {
    return v4;
  }
}

BOOL WiFiNetworkIsHiddenSSID(const void *a1)
{
  CFStringRef SSID = WiFiNetworkGetSSID(a1);
  if (SSID && (int v2 = SSID, !CFEqual(SSID, &stru_1F1A78C20))) {
    return CFEqual(v2, @" ") != 0;
  }
  else {
    return 1;
  }
}

BOOL WiFiNetworkIsSSIDAmbiguous(uint64_t a1)
{
  CFNumberRef Property = WiFiNetworkGetProperty(a1, @"AmbiguousSSIDs");
  return Property && Property == (const void *)*MEMORY[0x1E4F1CFD0];
}

BOOL WiFiNetworkIsSSIDUnmappable(const void *a1)
{
  CFStringRef SSID = (const __CFString *)WiFiNetworkGetSSID(a1);
  return SSID && CFStringHasSuffix(SSID, @"_nomap");
}

uint64_t WiFiNetworkGetDirectedState(const void *a1)
{
  CFNumberRef Property = (const __CFNumber *)WiFiNetworkGetProperty((uint64_t)a1, @"UserDirected");
  IntCFDictionaryRef Value = _CFTypeGetIntValue(Property);
  if (IntValue || !WiFiNetworkIsHidden(a1))
  {
    unsigned int v4 = 0;
  }
  else
  {
    WiFiNetworkSetProperty((uint64_t)a1, @"UserDirected", (const void *)*MEMORY[0x1E4F1CFD0]);
    unsigned int v4 = 1;
  }
  if (IntValue) {
    return 1;
  }
  else {
    return v4;
  }
}

void WiFiNetworkSetDirectedState(uint64_t a1, int a2)
{
  int v2 = (const void **)MEMORY[0x1E4F1CFD0];
  if (!a2) {
    int v2 = (const void **)MEMORY[0x1E4F1CFC8];
  }
  WiFiNetworkSetProperty(a1, @"UserDirected", *v2);
}

BOOL WiFiNetworkWasCaptive(uint64_t a1)
{
  return MEMORY[0x1E4F57E00]
      && CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 16), (const void *)*MEMORY[0x1E4F57E80]) == (const void *)*MEMORY[0x1E4F1CFD0];
}

const void *WiFiNetworkGetAPEnv(uint64_t a1)
{
  if (a1 && (CFDictionaryRef v1 = *(const __CFDictionary **)(a1 + 16)) != 0) {
    return CFDictionaryGetValue(v1, @"DiagnosticsBssEnv");
  }
  else {
    return 0;
  }
}

uint64_t WiFiNetworkGetCaptiveStatus(uint64_t a1)
{
  if (!MEMORY[0x1E4F57E00]) {
    return 0;
  }
  value = 0;
  int ValueIfPresent = CFDictionaryGetValueIfPresent(*(CFDictionaryRef *)(a1 + 16), (const void *)*MEMORY[0x1E4F57E38], (const void **)&value);
  if (value == (void *)*MEMORY[0x1E4F1CFD0]) {
    unsigned int v2 = 2;
  }
  else {
    unsigned int v2 = 1;
  }
  if (ValueIfPresent) {
    return v2;
  }
  else {
    return 0;
  }
}

BOOL WiFiNetworkIsWoWAllowed(uint64_t a1)
{
  if (!a1) {
    goto LABEL_17;
  }
  unsigned int v2 = *(const void **)(a1 + 16);
  if (!v2) {
    goto LABEL_17;
  }
  CFTypeID v3 = CFGetTypeID(v2);
  if (v3 != CFDictionaryGetTypeID()) {
    goto LABEL_17;
  }
  CFDataRef Value = (const __CFData *)CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 16), @"IE");
  if (!Value) {
    return 1;
  }
  CFDataRef v5 = Value;
  CFTypeID v6 = CFGetTypeID(Value);
  if (v6 != CFDataGetTypeID())
  {
LABEL_17:
    return 1;
  }
  BytePtr = CFDataGetBytePtr(v5);
  if (!BytePtr) {
    return 1;
  }
  CFDictionaryRef v8 = BytePtr;
  CFIndex Length = CFDataGetLength(v5);
  if (Length << 32 < 1) {
    return 1;
  }
  uint64_t v10 = 0;
  while (*v8 != 221 || v8[1] != 10 || *(_DWORD *)(v8 + 2) != 116528896 || *(_DWORD *)(v8 + 5) != 50397446)
  {
    uint64_t v12 = v8[1] + 2;
    v10 += v12;
    v8 += v12;
    if (v10 >= (int)Length) {
      return 1;
    }
  }
  return (v8[9] & 3) != 1;
}

CFDataRef WiFiNetworkFoundNanIe(uint64_t a1)
{
  if (!a1 || (unsigned int v2 = *(const void **)(a1 + 16)) == 0 || (v3 = CFGetTypeID(v2), v3 != CFDictionaryGetTypeID()))
  {
    return 0;
  }
  CFDataRef result = (const __CFData *)CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 16), @"IE");
  if (!result) {
    return result;
  }
  CFDataRef v5 = result;
  CFDataRef result = (const __CFData *)CFDataGetBytePtr(result);
  if (!result) {
    return result;
  }
  CFTypeID v6 = (unsigned __int8 *)result;
  CFIndex Length = CFDataGetLength(v5);
  if (Length << 32 < 1) {
    return 0;
  }
  uint64_t v8 = 0;
  unint64_t v9 = (unint64_t)&v6[(int)Length];
  while (1)
  {
    uint64_t v10 = v6 + 6;
    if (*v6 == 221
      && (unint64_t)v10 <= v9
      && *(_DWORD *)(v6 + 2) == 116528896
      && (unint64_t)(v6 + 9) <= v9)
    {
      break;
    }
LABEL_13:
    uint64_t v12 = v6[1] + 2;
    v8 += v12;
    v6 += v12;
    if (v8 >= (int)Length) {
      return 0;
    }
  }
  while (1)
  {
    uint64_t v14 = v10[2];
    if (*(_WORD *)v10 == 260 && v14 == 18) {
      return (const __CFData *)1;
    }
    CFDictionaryRef v16 = &v10[v14];
    uint64_t v10 = v16 + 3;
    if ((unint64_t)(v16 + 6) > v9) {
      goto LABEL_13;
    }
  }
}

uint64_t WiFiNetworkIsNanPH(uint64_t a1)
{
  if (a1)
  {
    uint64_t result = WiFiNetworkIsApplePersonalHotspot(a1);
    if (result)
    {
      uint64_t result = (uint64_t)WiFiNetworkFoundNanIe(a1);
      if (result) {
        return WiFiNetworkGetProperty(a1, @"WiFiNetworkNANServiceID") != 0;
      }
    }
  }
  else
  {
    return 0;
  }
  return result;
}

CFDataRef WiFiNetworkGetBtMacFromIe(uint64_t a1, uint64_t a2)
{
  CFDataRef result = (const __CFData *)CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 16), @"IE");
  if (result)
  {
    CFDataRef v4 = result;
    CFDataRef result = (const __CFData *)CFDataGetBytePtr(result);
    if (result)
    {
      CFDataRef v5 = (unsigned __int8 *)result;
      CFIndex Length = CFDataGetLength(v4);
      if (Length << 32 < 1)
      {
        return 0;
      }
      else
      {
        uint64_t v7 = 0;
        while (*v5 != 221 || v5[1] != 13 || *(_DWORD *)(v5 + 2) != 116528896 || *(_DWORD *)(v5 + 5) != 100729350)
        {
          uint64_t v9 = v5[1] + 2;
          v7 += v9;
          v5 += v9;
          if (v7 >= (int)Length) {
            return 0;
          }
        }
        int v10 = *(_DWORD *)(v5 + 9);
        *(_WORD *)(a2 + 4) = *(_WORD *)(v5 + 13);
        *(_DWORD *)a2 = v10;
        return (const __CFData *)1;
      }
    }
  }
  return result;
}

const UInt8 *WiFiNetworkCopyNanPHSServiceNameFromIe(uint64_t a1)
{
  unsigned int v2 = malloc_type_malloc(0x11uLL, 0xC32A05B9uLL);
  CFDataRef Value = (const __CFData *)CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 16), @"IE");
  if (!Value) {
    goto LABEL_23;
  }
  CFDataRef v4 = Value;
  BytePtr = CFDataGetBytePtr(Value);
  if (!BytePtr) {
    goto LABEL_24;
  }
  CFIndex Length = CFDataGetLength(v4);
  if (Length << 32 < 1)
  {
LABEL_23:
    BytePtr = 0;
    goto LABEL_24;
  }
  uint64_t v7 = 0;
  unint64_t v8 = (unint64_t)&BytePtr[(int)Length];
  while (1)
  {
    uint64_t v9 = (unsigned __int16 *)(BytePtr + 6);
    if (*BytePtr == 221
      && (unint64_t)v9 <= v8
      && *(_DWORD *)(BytePtr + 2) == 116528896
      && (unint64_t)(BytePtr + 9) <= v8)
    {
      break;
    }
LABEL_10:
    uint64_t v11 = BytePtr[1] + 2;
    v7 += v11;
    BytePtr += v11;
    if (v7 >= (int)Length) {
      goto LABEL_23;
    }
  }
  while (1)
  {
    uint64_t v13 = *((unsigned __int8 *)v9 + 2);
    if (!(*v9 ^ 0x104 | v13 ^ 0x12) && (unint64_t)v9 + 21 <= v8) {
      break;
    }
    CFAllocatorRef v15 = (char *)v9 + v13;
    uint64_t v9 = (unsigned __int16 *)(v15 + 3);
    if ((unint64_t)(v15 + 6) > v8) {
      goto LABEL_10;
    }
  }
  long long v16 = *(_OWORD *)(v9 + 2);
  v2[16] = *((unsigned char *)v9 + 20);
  *(_OWORD *)unsigned int v2 = v16;
  BytePtr = (const UInt8 *)objc_msgSend([NSString alloc], "initWithFormat:", @"%s", v2);
LABEL_24:
  free(v2);
  return BytePtr;
}

const UInt8 *WiFiNetworkGet11dCountryCodeFromIe(uint64_t a1, uint64_t a2, _DWORD *a3)
{
  CFDataRef Value = (const __CFData *)CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 16), @"IE");
  if (*a3 < 3u || Value == 0) {
    return 0;
  }
  CFDataRef v7 = Value;
  CFDataRef result = CFDataGetBytePtr(Value);
  if (!result) {
    return result;
  }
  uint64_t v9 = result;
  CFIndex Length = CFDataGetLength(v7);
  if (Length << 32 < 1) {
    return 0;
  }
  uint64_t v11 = 0;
  while (1)
  {
    uint64_t v12 = v9[1];
    if (*v9 == 7 && v12 >= 3) {
      break;
    }
    uint64_t v14 = v12 + 2;
    v11 += v14;
    v9 += v14;
    if (v11 >= (int)Length) {
      return 0;
    }
  }
  __int16 v15 = *((_WORD *)v9 + 1);
  *(unsigned char *)(a2 + 2) = v9[4];
  *(_WORD *)a2 = v15;
  *a3 = 3;
  return (const UInt8 *)1;
}

BOOL WiFiNetworkIsWPA(BOOL result)
{
  if (result)
  {
    uint64_t v1 = result;
    CFDictionaryRef v2 = *(const __CFDictionary **)(result + 16);
    return __WiFiNetworkSupportsWPA(v2)
        || __WiFiNetworkSupportsWPA2(v2)
        || __WiFiNetworkIsSAE(*(const __CFDictionary **)(v1 + 16)) != 0;
  }
  return result;
}

CFDictionaryRef __WiFiNetworkIsSAE(const __CFDictionary *a1)
{
  CFDictionaryRef result = (const __CFDictionary *)CFDictionaryGetValue(a1, @"RSN_IE");
  if (result)
  {
    CFDictionaryRef v2 = result;
    int v3 = __WiFiNetworkContainsAuthSelector(result, 8);
    int v4 = __WiFiNetworkContainsAuthSelector(v2, 9) | v3;
    int v5 = __WiFiNetworkContainsAuthSelector(v2, 24);
    return (const __CFDictionary *)(v4 | v5 | __WiFiNetworkContainsAuthSelector(v2, 25));
  }
  return result;
}

uint64_t WiFiNetworkSupportsWPA(uint64_t result)
{
  if (result) {
    return __WiFiNetworkSupportsWPA(*(const __CFDictionary **)(result + 16));
  }
  return result;
}

uint64_t __WiFiNetworkSupportsWPA(const __CFDictionary *a1)
{
  CFDataRef Value = CFDictionaryGetValue(a1, @"WPA_IE");
  if (!Value) {
    return 0;
  }
  CFDictionaryRef v2 = Value;
  CFTypeID TypeID = CFDictionaryGetTypeID();
  if (!_CFValidateType(TypeID, v2)) {
    return 0;
  }

  return __WiFiNetworkContainsAuthSelector((const __CFDictionary *)v2, 2);
}

uint64_t WiFiNetworkSupportsWPA2(uint64_t result)
{
  if (result) {
    return __WiFiNetworkSupportsWPA2(*(const __CFDictionary **)(result + 16));
  }
  return result;
}

uint64_t __WiFiNetworkSupportsWPA2(const __CFDictionary *a1)
{
  if (__WiFiNetworkContainsWPA2Auth(a1))
  {
    LOBYTE(result) = 1;
  }
  else
  {
    CFNumberRef Value = (const __CFNumber *)CFDictionaryGetValue(a1, @"ALLOW_WPA2_PSK");
    LOBYTE(result) = _CFTypeGetIntValue(Value);
  }
  return result;
}

CFDictionaryRef WiFiNetworkContainsWPA2Auth(const __CFDictionary *result)
{
  if (result) {
    return __WiFiNetworkContainsWPA2Auth(*((const __CFDictionary **)result + 2));
  }
  return result;
}

CFDictionaryRef __WiFiNetworkContainsWPA2Auth(const __CFDictionary *result)
{
  if (result)
  {
    uint64_t result = (const __CFDictionary *)CFDictionaryGetValue(result, @"RSN_IE");
    if (result)
    {
      CFDictionaryRef v1 = result;
      if (__WiFiNetworkContainsAuthSelector(result, 2)
        || __WiFiNetworkContainsAuthSelector(v1, 4))
      {
        return (const __CFDictionary *)1;
      }
      else
      {
        return (const __CFDictionary *)(__WiFiNetworkContainsAuthSelector(v1, 6) != 0);
      }
    }
  }
  return result;
}

CFDictionaryRef WiFiNetworkSupportsWPA3(const __CFDictionary *result)
{
  if (result) {
    return __WiFiNetworkIsSAE(*((const __CFDictionary **)result + 2));
  }
  return result;
}

void *WiFiNetworkIsBcnProtCapable(void *result)
{
  if (result)
  {
    CFDictionaryRef v1 = (const __CFDictionary *)*((void *)result + 2);
    value = 0;
    int valuePtr = 0;
    CFDictionaryRef v2 = (const __CFDictionary *)CFDictionaryGetValue(v1, @"EXT_CAPS");
    uint64_t result = 0;
    if (v2)
    {
      uint64_t result = (void *)CFDictionaryGetValueIfPresent(v2, @"BEACON_PROTECTION", (const void **)&value);
      if (result)
      {
        uint64_t result = value;
        if (value)
        {
          CFNumberGetValue((CFNumberRef)value, kCFNumberIntType, &valuePtr);
          return (void *)(valuePtr == 1);
        }
      }
    }
  }
  return result;
}

CFDictionaryRef *WiFiNetworkIsOCVCapable(CFDictionaryRef *result)
{
  if (result)
  {
    uint64_t result = (CFDictionaryRef *)CFDictionaryGetValue(result[2], @"RSN_IE");
    if (result)
    {
      uint64_t result = (CFDictionaryRef *)CFDictionaryGetValue((CFDictionaryRef)result, @"IE_KEY_RSN_CAPS");
      if (result)
      {
        uint64_t result = (CFDictionaryRef *)CFDictionaryGetValue((CFDictionaryRef)result, @"OCV");
        if (result) {
          return (CFDictionaryRef *)(CFBooleanGetValue((CFBooleanRef)result) == 1);
        }
      }
    }
  }
  return result;
}

CFDictionaryRef WiFiNetworkIsSAEPK(const __CFDictionary *result)
{
  if (result) {
    return __WiFiNetworkIsSAEPK(*((const __CFDictionary **)result + 2));
  }
  return result;
}

CFDictionaryRef __WiFiNetworkIsSAEPK(const __CFDictionary *a1)
{
  CFDictionaryRef result = __WiFiNetworkIsSAE(a1);
  if (result)
  {
    CFDictionaryRef result = (const __CFDictionary *)CFDictionaryGetValue(a1, @"RSN_XE");
    if (result)
    {
      CFDictionaryRef result = (const __CFDictionary *)CFDictionaryGetValue(result, @"IE_KEY_RSNXE_CAPS");
      if (result)
      {
        CFBooleanRef Value = (const __CFBoolean *)CFDictionaryGetValue(result, @"RSNXE_SAE_PK");
        return (const __CFDictionary *)(CFBooleanGetValue(Value) == 1);
      }
    }
  }
  return result;
}

CFDictionaryRef WiFiNetworkIsSAEPKPasswordUsed(const __CFDictionary *result)
{
  if (result)
  {
    CFDictionaryRef v1 = (const __CFDictionary *)*((void *)result + 2);
    value = 0;
    CFDictionaryRef result = __WiFiNetworkIsSAE(v1);
    if (result)
    {
      CFDictionaryRef result = __WiFiNetworkIsSAEPK(v1);
      if (result)
      {
        CFDictionaryRef result = (const __CFDictionary *)CFDictionaryGetValue(v1, @"EXT_CAPS");
        if (result)
        {
          int valuePtr = -1431655766;
          CFDictionaryRef result = (const __CFDictionary *)CFDictionaryGetValueIfPresent(result, @"SAE_PK_PASSWD_USED", (const void **)&value);
          if (result) {
            return (const __CFDictionary *)(CFNumberGetValue((CFNumberRef)value, kCFNumberSInt32Type, &valuePtr)
          }
                                         && valuePtr == 1);
        }
      }
    }
  }
  return result;
}

BOOL WiFiNetworkIsWAPIPSK(BOOL result)
{
  if (result) {
    return (~__WiFiNetworkGetWAPIPolicy(*(const __CFDictionary **)(result + 16)) & 7) == 0;
  }
  return result;
}

CFNumberRef __WiFiNetworkGetWAPIPolicy(const __CFDictionary *a1)
{
  unsigned int valuePtr = 0;
  CFNumberRef result = (const __CFNumber *)CFDictionaryGetValue(a1, @"WAPI");
  if (result)
  {
    CFNumberGetValue(result, kCFNumberIntType, &valuePtr);
    return (const __CFNumber *)valuePtr;
  }
  return result;
}

BOOL WiFiNetworkIsWAPICERT(BOOL result)
{
  if (result) {
    return (~__WiFiNetworkGetWAPIPolicy(*(const __CFDictionary **)(result + 16)) & 0xB) == 0;
  }
  return result;
}

BOOL WiFiNetworkIsWAPI(BOOL result)
{
  if (result)
  {
    uint64_t v1 = result;
    return (~__WiFiNetworkGetWAPIPolicy(*(const __CFDictionary **)(result + 16)) & 0xB) == 0
        || (~__WiFiNetworkGetWAPIPolicy(*(const __CFDictionary **)(v1 + 16)) & 7) == 0;
  }
  return result;
}

uint64_t WiFiNetworkIsOWETransition(uint64_t result)
{
  if (result)
  {
    CFDictionaryRef v1 = *(const __CFDictionary **)(result + 16);
    CFNumberRef Value = (const __CFNumber *)CFDictionaryGetValue(v1, @"SCAN_RESULT_OWE_MULTI_SSID");
    LOBYTE(result) = _CFTypeGetIntValue(Value);
    if (!(_BYTE)result)
    {
      CFNumberRef v3 = (const __CFNumber *)CFDictionaryGetValue(v1, @"ALLOW_OWE_TSN");
      LOBYTE(result) = _CFTypeGetIntValue(v3);
    }
  }
  return result;
}

CFDictionaryRef WiFiNetworkIsOWEOnly(const __CFDictionary *result)
{
  if (result) {
    return __WiFiNetworkIsOWEOnly(*((const __CFDictionary **)result + 2));
  }
  return result;
}

CFDictionaryRef __WiFiNetworkIsOWEOnly(const __CFDictionary *a1)
{
  CFDictionaryRef result = (const __CFDictionary *)CFDictionaryGetValue(a1, @"RSN_IE");
  if (result)
  {
    CFDictionaryRef result = (const __CFDictionary *)__WiFiNetworkContainsAuthSelector(result, 18);
    if (result)
    {
      CFNumberRef Value = (const __CFNumber *)CFDictionaryGetValue(a1, @"SCAN_RESULT_OWE_MULTI_SSID");
      if (_CFTypeGetIntValue(Value))
      {
        return 0;
      }
      else
      {
        CFNumberRef v4 = (const __CFNumber *)CFDictionaryGetValue(a1, @"ALLOW_OWE_TSN");
        return (const __CFDictionary *)(_CFTypeGetIntValue(v4) == 0);
      }
    }
  }
  return result;
}

BOOL __WiFiNetworkIsEAP(const __CFDictionary *a1)
{
  return __WiFiNetworkIsWPAEAP(a1) || CFDictionaryGetValue(a1, @"EnterpriseProfile") != 0;
}

BOOL WiFiNetworkAllowsPasswordBasedEAPType(BOOL result)
{
  if (result)
  {
    uint64_t v1 = result;
    CFDictionaryRef result = WiFiNetworkIsEAP(result);
    if (result) {
      return __WiFiNetworkIsEAPWithType(v1, 17)
    }
          || __WiFiNetworkIsEAPWithType(v1, 21)
          || __WiFiNetworkIsEAPWithType(v1, 25)
          || __WiFiNetworkIsEAPWithType(v1, 26)
          || __WiFiNetworkIsEAPWithType(v1, 43) != 0;
  }
  return result;
}

CFArrayRef __WiFiNetworkIsEAPWithType(uint64_t a1, int a2)
{
  int valuePtr = a2;
  CFArrayRef result = (const __CFArray *)WiFiNetworkIsEAP(a1);
  if (result)
  {
    CFArrayRef result = (const __CFArray *)WiFiNetworkGetProperty(a1, @"AcceptEAPTypes");
    if (result)
    {
      CFArrayRef v4 = result;
      CFArrayRef result = CFNumberCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], kCFNumberIntType, &valuePtr);
      if (result)
      {
        int v5 = result;
        v8.length = CFArrayGetCount(v4);
        v8.location = 0;
        FirstIndexOfCFNumberRef Value = CFArrayGetFirstIndexOfValue(v4, v8, v5);
        CFRelease(v5);
        return (const __CFArray *)(FirstIndexOfValue != -1);
      }
    }
  }
  return result;
}

BOOL WiFiNetworkIsProfileBased(uint64_t a1)
{
  return a1 && CFDictionaryContainsKey(*(CFDictionaryRef *)(a1 + 16), @"PayloadUUID");
}

BOOL WiFiNetworkIsShareble(uint64_t a1)
{
  int valuePtr = 0;
  if (!a1) {
    return 1;
  }
  CFNumberRef Value = (const __CFNumber *)CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 16), @"IsWiFiNetworkShareble");
  if (!Value) {
    return 1;
  }
  CFNumberGetValue(Value, kCFNumberIntType, &valuePtr);
  return valuePtr != 0;
}

BOOL WiFiNetworkIsAppBased(uint64_t a1)
{
  return a1 && CFDictionaryContainsKey(*(CFDictionaryRef *)(a1 + 16), @"BundleIdentifier");
}

void WiFiNetworkGetTimeToExpire(uint64_t a1)
{
  if (WiFiNetworkGetExpireDate(a1) != 0.0) {
    CFAbsoluteTimeGetCurrent();
  }
}

double WiFiNetworkGetExpireDate(uint64_t a1)
{
  double valuePtr = 0.0;
  if (!a1)
  {
    return 0.0;
  }
  CFNumberRef Property = (const __CFNumber *)WiFiNetworkGetProperty(a1, @"WiFiNetworkExpirationDate");
  if (!Property) {
    return 0.0;
  }
  CFNumberGetValue(Property, kCFNumberDoubleType, &valuePtr);
  return valuePtr;
}

void WiFiNetworkSetExpireDate(uint64_t a1, uint64_t a2)
{
  if (a1)
  {
    if (a2)
    {
      MEMORY[0x1C18A4890](a2);
      WiFiNetworkSetFloatProperty(a1, @"WiFiNetworkExpirationDate", v3);
    }
    else
    {
      WiFiNetworkSetProperty(a1, @"WiFiNetworkExpirationDate", 0);
    }
  }
}

BOOL WiFiNetworkIsExpirable(uint64_t a1)
{
  if (a1) {
    return WiFiNetworkGetProperty(a1, @"WiFiNetworkExpirationDate") != 0;
  }
  return 0;
}

void WiFiNetworkSetWEP(uint64_t a1, int a2)
{
  CFDictionaryRef v2 = (const void **)MEMORY[0x1E4F1CFD0];
  if (!a2) {
    CFDictionaryRef v2 = (const void **)MEMORY[0x1E4F1CFC8];
  }
  WiFiNetworkSetProperty(a1, @"WEP", *v2);
}

void WiFiNetworkSetOWE(uint64_t a1, int a2)
{
  if (a2)
  {
    CFAllocatorRef v3 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
    CFMutableArrayRef Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, MEMORY[0x1E4F1D510]);
    values = Mutable;
    if (Mutable)
    {
      int v5 = Mutable;
      uint64_t valuePtr = 18;
      CFNumberRef v6 = CFNumberCreate(v3, kCFNumberCFIndexType, &valuePtr);
      if (v6)
      {
        CFNumberRef v7 = v6;
        CFArrayAppendValue(v5, v6);
        CFRelease(v7);
      }
      keys = @"IE_KEY_RSN_AUTHSELS";
      CFDictionaryRef v8 = CFDictionaryCreate(v3, (const void **)&keys, (const void **)&values, 1, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
      if (v8)
      {
        CFDictionaryRef v9 = v8;
        WiFiNetworkSetProperty(a1, @"RSN_IE", v8);
        CFRelease(v9);
      }
      CFRelease(values);
    }
  }
  else
  {
    WiFiNetworkSetProperty(a1, @"RSN_IE", 0);
  }
}

void WiFiNetworkSetEAP(uint64_t a1, int a2)
{
  if (a2)
  {
    uint64_t valuePtr = 1;
    CFAllocatorRef v3 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
    values = CFNumberCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], kCFNumberCFIndexType, &valuePtr);
    if (values)
    {
      CFTypeRef cf = CFArrayCreate(v3, (const void **)&values, 1, MEMORY[0x1E4F1D510]);
      if (cf)
      {
        CFDictionaryRef v8 = @"IE_KEY_RSN_AUTHSELS";
        CFDictionaryRef v4 = CFDictionaryCreate(v3, (const void **)&v8, &cf, 1, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
        if (v4)
        {
          CFDictionaryRef v5 = v4;
          WiFiNetworkSetProperty(a1, @"RSN_IE", v4);
          CFRelease(v5);
        }
        if (cf)
        {
          CFRelease(cf);
          CFTypeRef cf = 0;
        }
      }
      if (values)
      {
        CFRelease(values);
        values = 0;
      }
    }
    uint64_t valuePtr = 1;
    values = CFNumberCreate(v3, kCFNumberCFIndexType, &valuePtr);
    if (values)
    {
      CFTypeRef cf = CFArrayCreate(v3, (const void **)&values, 1, MEMORY[0x1E4F1D510]);
      if (cf)
      {
        CFDictionaryRef v8 = @"IE_KEY_WPA_AUTHSELS";
        CFDictionaryRef v6 = CFDictionaryCreate(v3, (const void **)&v8, &cf, 1, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
        if (v6)
        {
          CFDictionaryRef v7 = v6;
          WiFiNetworkSetProperty(a1, @"WPA_IE", v6);
          CFRelease(v7);
        }
        if (cf)
        {
          CFRelease(cf);
          CFTypeRef cf = 0;
        }
      }
      if (values) {
        CFRelease(values);
      }
    }
  }
  else
  {
    WiFiNetworkSetProperty(a1, @"RSN_IE", 0);
    WiFiNetworkSetProperty(a1, @"WPA_IE", 0);
    WiFiNetworkSetProperty(a1, @"EnterpriseProfile", 0);
  }
}

BOOL WiFiNetworkRequiresPassword(uint64_t a1)
{
  if (!WiFiNetworkIsEAP(a1))
  {
    if (!WiFiNetworkIsWPAWPA2PSK(a1))
    {
      if (a1)
      {
        if (CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 16), @"WEP") != (const void *)*MEMORY[0x1E4F1CFD0]
          && !WiFiNetworkIsWAPI(a1))
        {
          return __WiFiNetworkIsSAE(*(const __CFDictionary **)(a1 + 16)) != 0;
        }
      }
      else
      {
        BOOL result = WiFiNetworkIsWAPI(0);
        if (!result) {
          return result;
        }
      }
    }
    return 1;
  }
  return !WiFiNetworkRequiresIdentity(a1)
      && !__WiFiNetworkIsEAPWithType(a1, 18)
      && __WiFiNetworkIsEAPWithType(a1, 23) == 0;
}

CFArrayRef WiFiNetworkRequiresIdentity(uint64_t a1)
{
  if (!WiFiNetworkIsEAP(a1)) {
    return 0;
  }
  CFArrayRef Property = (const __CFArray *)WiFiNetworkGetProperty(a1, @"AcceptEAPTypes");
  if (Property)
  {
    int valuePtr = 13;
    CFNumberRef v3 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], kCFNumberIntType, &valuePtr);
    if (v3)
    {
      CFNumberRef v4 = v3;
      v7.length = CFArrayGetCount(Property);
      v7.location = 0;
      CFArrayRef Property = (const __CFArray *)(CFArrayGetFirstIndexOfValue(Property, v7, v4) != -1);
      CFRelease(v4);
      return Property;
    }
    return 0;
  }
  return Property;
}

BOOL WiFiNetworkRequiresUsername(uint64_t a1)
{
  int v12 = 18;
  int valuePtr = 13;
  BOOL result = WiFiNetworkIsEAP(a1);
  if (result)
  {
    CFArrayRef Property = (const __CFArray *)WiFiNetworkGetProperty(a1, @"AcceptEAPTypes");
    if (Property
      && (CFArrayRef v4 = Property,
          CFAllocatorRef v5 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80],
          (CFNumberRef v6 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], kCFNumberIntType, &valuePtr)) != 0))
    {
      CFNumberRef v7 = v6;
      v14.length = CFArrayGetCount(v4);
      v14.location = 0;
      FirstIndexOfCFNumberRef Value = CFArrayGetFirstIndexOfValue(v4, v14, v7);
      CFRelease(v7);
      CFNumberRef v9 = CFNumberCreate(v5, kCFNumberIntType, &v12);
      if (v9)
      {
        CFNumberRef v10 = v9;
        v15.length = CFArrayGetCount(v4);
        v15.location = 0;
        CFIndex v11 = CFArrayGetFirstIndexOfValue(v4, v15, v10);
        CFRelease(v10);
      }
      else
      {
        CFIndex v11 = -1;
      }
      if (FirstIndexOfValue != -1) {
        return 0;
      }
    }
    else
    {
      CFIndex v11 = -1;
    }
    return v11 == -1;
  }
  return result;
}

const void *WiFiNetworkRequiresOneTimePassword(const void *result)
{
  if (result)
  {
    BOOL result = WiFiNetworkGetProperty((uint64_t)result, @"OneTimeUserPassword");
    if (result) {
      return (const void *)(CFEqual(result, (CFTypeRef)*MEMORY[0x1E4F1CFD0]) != 0);
    }
  }
  return result;
}

uint64_t WiFiNetworkGetAuthFlags(uint64_t a1)
{
  return __WiFiNetworkGetAuthFlags(*(const __CFDictionary **)(a1 + 16));
}

uint64_t __WiFiNetworkGetAuthFlags(const __CFDictionary *a1)
{
  if (__WiFiNetworkSupportsWPA(a1)) {
    int v2 = 2;
  }
  else {
    int v2 = 2 * (__WiFiNetworkSupportsWPA2(a1) != 0);
  }
  if (__WiFiNetworkIsEAP(a1)) {
    v2 |= 8u;
  }
  unsigned int v3 = v2 | (CFDictionaryGetValue(a1, @"WEP") == (const void *)*MEMORY[0x1E4F1CFD0]);
  if (__WiFiNetworkIsSAE(a1)) {
    v3 |= 4u;
  }
  if (__WiFiNetworkIsSAEPK(a1)) {
    return v3 | 0x10;
  }
  else {
    return v3;
  }
}

uint64_t WiFiNetworkCompareAuthFlags(unsigned int a1, unsigned int a2)
{
  if ((a1 & a2 & 4) == 0 || ((a2 ^ a1) & 8) != 0)
  {
    if (a1 >= a2) {
      unsigned int v8 = 0;
    }
    else {
      unsigned int v8 = -1;
    }
    if (a1 <= a2) {
      return v8;
    }
    else {
      return 1;
    }
  }
  else
  {
    unsigned int v2 = a1 & 0xFFFFFFFB;
    unsigned int v3 = a2 & 0xFFFFFFFB;
    if ((a1 & 0xFFFFFFFB) > (a2 & 0xFFFFFFFB)) {
      int v4 = 1;
    }
    else {
      int v4 = -1;
    }
    if (v3) {
      int v5 = v4;
    }
    else {
      int v5 = -1;
    }
    if (v2) {
      unsigned int v6 = v5;
    }
    else {
      unsigned int v6 = 1;
    }
    if (v2 == v3) {
      return 0;
    }
    else {
      return v6;
    }
  }
}

uint64_t WiFiNetworkIsSameSecurity(const __CFDictionary **cf, const __CFDictionary **a2)
{
  uint64_t result = 0;
  if (cf && a2)
  {
    CFTypeID v5 = CFGetTypeID(cf);
    uint64_t v6 = __kWiFiNetworkTypeID;
    if (!__kWiFiNetworkTypeID)
    {
      pthread_once(&__wifiNetworkTypeInit, (void (*)(void))__WiFiNetworkRegister);
      uint64_t v6 = __kWiFiNetworkTypeID;
    }
    if (v5 != v6) {
      return 0;
    }
    CFTypeID v7 = CFGetTypeID(a2);
    uint64_t v8 = __kWiFiNetworkTypeID;
    if (!__kWiFiNetworkTypeID)
    {
      pthread_once(&__wifiNetworkTypeInit, (void (*)(void))__WiFiNetworkRegister);
      uint64_t v8 = __kWiFiNetworkTypeID;
    }
    if (v7 != v8) {
      return 0;
    }
    int AuthFlags = __WiFiNetworkGetAuthFlags(cf[2]);
    int v10 = __WiFiNetworkGetAuthFlags(a2[2]);
    int v33 = __WiFiNetworkIsSAE(cf[2])
       && (CFDictionaryRef v11 = cf[2], !__WiFiNetworkSupportsWPA(v11))
       && __WiFiNetworkSupportsWPA2(v11) == 0;
    int v30 = v10;
    int v13 = __WiFiNetworkIsSAE(a2[2])
       && (CFDictionaryRef v12 = a2[2], !__WiFiNetworkSupportsWPA(v12))
       && __WiFiNetworkSupportsWPA2(v12) == 0;
    unsigned int v31 = __WiFiNetworkIsOWEOnly(cf[2]);
    unsigned int v32 = __WiFiNetworkIsOWEOnly(a2[2]);
    unint64_t Value = (unint64_t)CFDictionaryGetValue(cf[2], @"ALLOW_WPA2_PSK");
    unint64_t v15 = (unint64_t)CFDictionaryGetValue(a2[2], @"ALLOW_WPA2_PSK");
    unint64_t v16 = (unint64_t)CFDictionaryGetValue(cf[2], @"ALLOW_OWE_TSN");
    unint64_t v17 = (unint64_t)CFDictionaryGetValue(a2[2], @"ALLOW_OWE_TSN");
    int v18 = (Value | v16) == 0;
    int v19 = (v15 | v17) == 0;
    if (v18 != v19)
    {
      unint64_t v20 = v17;
      int v29 = AuthFlags;
      if (v33)
      {
        BOOL v21 = WiFiNetworkGetOperatingBand((uint64_t)cf) != 3;
        if ((v13 & 1) == 0)
        {
LABEL_20:
          CFDictionaryRef v22 = (const void *)*MEMORY[0x1E4F1CFD0];
LABEL_31:
          if ((const void *)v15 == v22 && v21) {
            return 0;
          }
          int AuthFlags = v29;
          if ((v18 & v33) == 1 && WiFiNetworkGetOperatingBand((uint64_t)cf) == 3) {
            int AuthFlags = v29 | 2;
          }
          if ((v19 & v13) == 1)
          {
            int OperatingBand = WiFiNetworkGetOperatingBand((uint64_t)a2);
            int v26 = v30;
            if (OperatingBand == 3) {
              int v26 = v30 | 2;
            }
            int v30 = v26;
          }
          BOOL v27 = v31 && WiFiNetworkGetOperatingBand((uint64_t)cf) != 3;
          if (v32)
          {
            int v28 = WiFiNetworkGetOperatingBand((uint64_t)a2);
            if ((const void *)v16 == v22 && v28 != 3) {
              return 0;
            }
          }
          if ((const void *)v20 == v22 && v27) {
            return 0;
          }
LABEL_23:
          if (!AuthFlags || !v30 || (v30 & AuthFlags) != 0) {
            return (AuthFlags == 0) ^ (v30 != 0);
          }
          return 0;
        }
      }
      else
      {
        BOOL v21 = 0;
        if ((v13 & 1) == 0) {
          goto LABEL_20;
        }
      }
      int v23 = WiFiNetworkGetOperatingBand((uint64_t)a2);
      BOOL v24 = Value == *MEMORY[0x1E4F1CFD0];
      CFDictionaryRef v22 = (const void *)*MEMORY[0x1E4F1CFD0];
      if (v24 && v23 != 3) {
        return 0;
      }
      goto LABEL_31;
    }
    uint64_t result = 0;
    if (v33 == v13 && v31 == v32) {
      goto LABEL_23;
    }
  }
  return result;
}

uint64_t WiFiNetworkGetOperatingBand(uint64_t result)
{
  int v9 = 0;
  if (result)
  {
    uint64_t v1 = (const void *)result;
    CFTypeID v2 = CFGetTypeID((CFTypeRef)result);
    uint64_t v3 = __kWiFiNetworkTypeID;
    if (!__kWiFiNetworkTypeID)
    {
      pthread_once(&__wifiNetworkTypeInit, (void (*)(void))__WiFiNetworkRegister);
      uint64_t v3 = __kWiFiNetworkTypeID;
    }
    if (v2 == v3)
    {
      CFArrayRef Property = WiFiNetworkGetProperty((uint64_t)v1, @"CHANNEL");
      CFNumberRef v5 = (const __CFNumber *)WiFiNetworkGetProperty((uint64_t)v1, @"CHANNEL_FLAGS");
      if (v5)
      {
        int valuePtr = 0;
        CFNumberGetValue(v5, kCFNumberIntType, &valuePtr);
        if ((valuePtr & 8) != 0) {
          return 1;
        }
        if ((valuePtr & 0x10) != 0) {
          return 2;
        }
        if ((valuePtr & 0x2000) != 0) {
          return 3;
        }
      }
      uint64_t v1 = Property;
      if (!Property) {
        return 0;
      }
    }
    else
    {
      CFTypeID v6 = CFGetTypeID(v1);
      if (v6 != CFNumberGetTypeID()) {
        return 0;
      }
    }
    CFNumberGetValue((CFNumberRef)v1, kCFNumberIntType, &v9);
    if (v9)
    {
      if (v9 < 15) {
        return 1;
      }
      uint64_t v7 = 0;
      while (v9 != channels5Ghz[v7])
      {
        if (++v7 == 33) {
          return 0;
        }
      }
      return 2;
    }
    return 0;
  }
  return result;
}

uint64_t WiFiNetworkCompareNoSecurity(uint64_t a1, uint64_t a2)
{
  uint64_t result = 0;
  if (a1 && a2)
  {
    uint64_t result = __WiFiCompareSSIDorBSSID(*(const void **)(a1 + 16), *(const void **)(a2 + 16));
    if (result) {
      return __WiFiCompareDictionaryValues(*(CFTypeRef *)(a1 + 16), *(const void **)(a1 + 16), @"AP_MODE") != 0;
    }
  }
  return result;
}

uint64_t __WiFiCompareSSIDorBSSID(const void *a1, const void *a2)
{
  uint64_t v3 = __WiFiCompareDictionaryValues(a1, a2, @"SSID_STR");
  uint64_t v4 = v3;
  if (a1)
  {
    if (v3)
    {
      CFStringRef Value = (const __CFString *)CFDictionaryGetValue((CFDictionaryRef)a1, @"SSID_STR");
      if (Value)
      {
        if (!CFStringGetLength(Value)) {
          return 0;
        }
      }
    }
  }
  return v4;
}

uint64_t __WiFiCompareDictionaryValues(CFTypeRef cf, const void *a2, const void *a3)
{
  uint64_t result = 0;
  if (!cf || !a2) {
    return result;
  }
  CFTypeID v7 = CFGetTypeID(cf);
  if (v7 != CFGetTypeID(a2)) {
    return 0;
  }
  CFTypeID v8 = CFGetTypeID(cf);
  if (v8 != CFDictionaryGetTypeID()) {
    return 0;
  }
  CFTypeRef v9 = cf;
  if (!a3)
  {
    CFDictionaryRef v12 = a2;
    goto LABEL_12;
  }
  CFStringRef Value = CFDictionaryGetValue((CFDictionaryRef)cf, a3);
  CFDictionaryRef v11 = CFDictionaryGetValue((CFDictionaryRef)a2, a3);
  if (Value == v11) {
    return 1;
  }
  CFDictionaryRef v12 = v11;
  if ((Value != 0) == (v11 == 0)) {
    return 0;
  }
  CFTypeRef v9 = Value;
LABEL_12:

  return CFEqual(v9, v12);
}

uint64_t WiFiNetworkCompareNetworksForHS20Equivalency(uint64_t a1, uint64_t a2)
{
  if (a1 && a2) {
    return __WiFiHS20NetworksHaveSameDomain(a1, a2);
  }
  else {
    return 0;
  }
}

uint64_t __WiFiHS20NetworksHaveSameDomain(uint64_t a1, uint64_t a2)
{
  if (!a1 || !a2 || !WiFiNetworkIsHotspot20(a1) || !WiFiNetworkIsHotspot20(a2)) {
    return 0;
  }
  uint64_t v4 = *(const void **)(a1 + 16);
  CFNumberRef v5 = *(const void **)(a2 + 16);

  return __WiFiCompareDictionaryValues(v4, v5, @"DomainName");
}

BOOL WiFiNetworkCompareSSIDOnly(uint64_t a1, uint64_t a2)
{
  BOOL result = 0;
  if (a1)
  {
    if (a2) {
      return __WiFiCompareDictionaryValues(*(CFTypeRef *)(a1 + 16), *(const void **)(a2 + 16), @"SSID_STR") != 0;
    }
  }
  return result;
}

uint64_t WiFiNetworkComparePriority(uint64_t a1, uint64_t a2)
{
  if (a1 | a2) {
    uint64_t v3 = -1;
  }
  else {
    uint64_t v3 = 0;
  }
  if (a2) {
    uint64_t result = 1;
  }
  else {
    uint64_t result = v3;
  }
  if (!a1 || !a2) {
    return result;
  }
  BOOL IsLegacyHotspot = WiFiNetworkIsLegacyHotspot(a1);
  BOOL v7 = WiFiNetworkIsLegacyHotspot(a2);
  BOOL IsHotspot20 = WiFiNetworkIsHotspot20(a1);
  BOOL v9 = WiFiNetworkIsHotspot20(a2);
  if (IsLegacyHotspot || IsHotspot20 || v7 || v9)
  {
    BOOL v16 = !IsLegacyHotspot && !IsHotspot20;
    if (!v16 && !v7 && !v9) {
      return 1;
    }
    if (v16 && (v7 || v9)) {
      return -1;
    }
    if (IsLegacyHotspot && v9) {
      return 1;
    }
    if (IsHotspot20 && v7) {
      return -1;
    }
    if (IsHotspot20 && v9)
    {
      CFArrayRef Property = WiFiNetworkGetProperty(a1, @"HS20HomeOperatorNetwork");
      int v18 = (const void *)*MEMORY[0x1E4F1CFD0];
      int v19 = WiFiNetworkGetProperty(a2, @"HS20HomeOperatorNetwork");
      if (Property == v18 && v19 != v18) {
        return -1;
      }
      if (Property != v18 && v19 == v18) {
        return 1;
      }
    }
  }
  unsigned int AuthFlags = __WiFiNetworkGetAuthFlags(*(const __CFDictionary **)(a1 + 16));
  unsigned int v11 = __WiFiNetworkGetAuthFlags(*(const __CFDictionary **)(a2 + 16));
  int v12 = WiFiNetworkCompareAuthFlags(AuthFlags, v11);
  if (v12 == 1) {
    return -1;
  }
  if (v12 == -1) {
    return 1;
  }
  uint64_t valuePtr = 0;
  CFNumberRef v13 = (const __CFNumber *)WiFiNetworkGetProperty(a1, @"Strength");
  if (v13) {
    CFNumberGetValue(v13, kCFNumberFloatType, (char *)&valuePtr + 4);
  }
  CFNumberRef v14 = (const __CFNumber *)WiFiNetworkGetProperty(a2, @"Strength");
  if (v14)
  {
    CFNumberGetValue(v14, kCFNumberFloatType, &valuePtr);
    float v15 = *(float *)&valuePtr;
  }
  else
  {
    float v15 = 0.0;
  }
  if (*((float *)&valuePtr + 1) <= v15) {
    return *((float *)&valuePtr + 1) < v15;
  }
  else {
    return -1;
  }
}

BOOL WiFiNetworkIsLegacyHotspot(uint64_t a1)
{
  if (WiFiNetworkGetProperty(a1, @"DomainName")) {
    return 0;
  }
  if (WiFiNetworkGetProperty(a1, @"IsHotspot") == (const void *)*MEMORY[0x1E4F1CFD0]) {
    return 1;
  }
  if (MEMORY[0x1E4F57E00])
  {
    uint64_t v3 = (const void *)*MEMORY[0x1E4F1CFD0];
    if (CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 16), (const void *)*MEMORY[0x1E4F57E38]) == v3) {
      return 1;
    }
  }
  if (__WiFiNetworkIsEAPWithType(a1, 18) || __WiFiNetworkIsEAPWithType(a1, 23)) {
    return 1;
  }
  return WiFiNetworkIsPublicHotspot(a1) != 0;
}

BOOL WiFiNetworkIsHS20HomeOperatorNetwork(uint64_t a1)
{
  return WiFiNetworkGetProperty(a1, @"HS20HomeOperatorNetwork") == (const void *)*MEMORY[0x1E4F1CFD0];
}

__CFString *WiFiNetworkCopyShareablePassword(CFDictionaryRef *a1)
{
  if (WiFiNetworkGetShareMode((uint64_t)a1) < 2) {
    return 0;
  }
  CFStringRef v2 = WiFiNetworkCopyPassword(a1);
  if (v2 && !WiFiNetworkGetProperty((uint64_t)a1, @"RSN_IE"))
  {
    CFDataRef SSIDData = (const __CFData *)WiFiNetworkGetSSIDData(a1);
    uint64_t v4 = WiFiSecurityCopyHashedWPAPassword(v2, SSIDData);
    CFRelease(v2);
    return v4;
  }
  return (__CFString *)v2;
}

uint64_t WiFiNetworkGetShareMode(uint64_t a1)
{
  unsigned int valuePtr = 3;
  CFNumberRef Property = (const __CFNumber *)WiFiNetworkGetProperty(a1, @"ShareMode");
  if (Property) {
    CFNumberGetValue(Property, kCFNumberIntType, &valuePtr);
  }
  BOOL v3 = a1 && CFDictionaryContainsKey(*(CFDictionaryRef *)(a1 + 16), @"PayloadUUID");
  BOOL IsEAP = WiFiNetworkIsEAP(a1);
  int IsWPAWPA2PSK = WiFiNetworkIsWPAWPA2PSK(a1);
  if (a1)
  {
    BOOL v6 = CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 16), @"WEP") == (const void *)*MEMORY[0x1E4F1CFD0];
    BOOL v7 = __WiFiNetworkIsSAE(*(const __CFDictionary **)(a1 + 16)) == 0;
  }
  else
  {
    BOOL v6 = 0;
    BOOL v7 = 1;
  }
  if (IsWPAWPA2PSK) {
    BOOL v7 = 0;
  }
  if (IsEAP) {
    BOOL v7 = 1;
  }
  if (v3 || v6 || v7) {
    return 1;
  }
  else {
    return valuePtr;
  }
}

__CFString *WiFiNetworkCopyHashedWPAPassword(const void *a1, const __CFString *a2)
{
  CFDataRef SSIDData = (const __CFData *)WiFiNetworkGetSSIDData(a1);

  return WiFiSecurityCopyHashedWPAPassword(a2, SSIDData);
}

uint64_t WiFiNetworkCopyPasswordWithTimeout(CFDictionaryRef *a1, BOOL *a2, double a3)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 136315394;
    int v10 = "WiFiNetworkCopyPasswordWithTimeout";
    __int16 v11 = 2112;
    CFStringRef AccountForNetwork = WiFiNetworkGetAccountForNetwork(a1);
    _os_log_impl(&dword_1BF1E6000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%s: Copy password for Network/account %@", (uint8_t *)&v9, 0x16u);
  }
  if (!a1
    || !CFDictionaryContainsKey(a1[2], @"PayloadUUID")
    || (CFStringRef v6 = WiFiNetworkGetAccountForNetwork(a1),
        (uint64_t result = WiFiSecurityCopyNonSyncablePasswordWithTimeout(v6, a2, a3)) == 0))
  {
    CFStringRef v8 = WiFiNetworkGetAccountForNetwork(a1);
    return WiFiSecurityCopyPasswordWithTimeout(v8, a2, a3);
  }
  return result;
}

BOOL WiFiNetworkSetPasswordWithTimeout(const void *a1, const __CFString *a2, BOOL *a3, double a4)
{
  CFStringRef AccountForNetwork = WiFiNetworkGetAccountForNetwork(a1);

  return WiFiSecuritySetPasswordWithTimeout(AccountForNetwork, a2, a3, a4);
}

CFStringRef WiFiNetworkCopyLegacyPassword(const void *a1)
{
  CFStringRef AccountForNetwork = WiFiNetworkGetAccountForNetwork(a1);

  return WiFiSecurityCopyLegacyPassword(AccountForNetwork);
}

CFStringRef WiFiNetworkCopyNonSyncablePassword(const void *a1)
{
  CFStringRef AccountForNetwork = WiFiNetworkGetAccountForNetwork(a1);

  return WiFiSecurityCopyNonSyncablePassword(AccountForNetwork);
}

uint64_t WiFiNetworkCopyNonSyncablePasswordWithTimeout(const void *a1, BOOL *a2, double a3)
{
  CFStringRef AccountForNetwork = WiFiNetworkGetAccountForNetwork(a1);

  return WiFiSecurityCopyNonSyncablePasswordWithTimeout(AccountForNetwork, a2, a3);
}

BOOL WiFiNetworkSetPassword(const void *a1, const __CFString *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  CFStringRef AccountForNetwork = WiFiNetworkGetAccountForNetwork(a1);
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315394;
    CFStringRef v6 = "WiFiNetworkSetPassword";
    __int16 v7 = 2112;
    CFStringRef v8 = AccountForNetwork;
    _os_log_impl(&dword_1BF1E6000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%s: Set password for Network/account %@", (uint8_t *)&v5, 0x16u);
  }
  return WiFiSecuritySetPassword((BOOL)AccountForNetwork, a2);
}

BOOL WiFiNetworkSetLegacyPassword(const void *a1, const __CFString *a2)
{
  CFStringRef AccountForNetwork = WiFiNetworkGetAccountForNetwork(a1);

  return WiFiSecuritySetLegacyPassword((BOOL)AccountForNetwork, a2);
}

uint64_t WiFiNetworkRemovePassword(const void *a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136315394;
    int v5 = "WiFiNetworkRemovePassword";
    __int16 v6 = 2112;
    CFStringRef AccountForNetwork = WiFiNetworkGetAccountForNetwork(a1);
    _os_log_impl(&dword_1BF1E6000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%s: Remove password for Network/account %@", (uint8_t *)&v4, 0x16u);
  }
  CFStringRef v2 = WiFiNetworkGetAccountForNetwork(a1);
  return WiFiSecurityRemovePassword(v2);
}

uint64_t WiFiNetworkRemoveLegacyPassword(const void *a1)
{
  CFStringRef AccountForNetwork = WiFiNetworkGetAccountForNetwork(a1);

  return WiFiSecurityRemoveLegacyPassword(AccountForNetwork);
}

CFStringRef WiFiNetworkIsPasswordAvailable(CFDictionaryRef *a1)
{
  CFStringRef result = WiFiNetworkCopyPassword(a1);
  if (result)
  {
    CFRelease(result);
    return (CFStringRef)1;
  }
  return result;
}

uint64_t WiFiNetworkIsPasswordAvailableForHS20Account(void *a1)
{
  if (!WiFiNetworkRequiresPassword((uint64_t)a1)) {
    return 1;
  }
  uint64_t result = (uint64_t)__WiFiNetworkCopyPasswordForAccount((uint64_t)a1);
  if (result)
  {
LABEL_3:
    CFRelease((CFTypeRef)result);
    return 1;
  }
  CFStringRef SSID = WiFiNetworkGetSSID(a1);
  CFNumberRef Property = WiFiNetworkGetProperty((uint64_t)a1, @"HS20AccountName");
  if (!SSID || Property && CFEqual(SSID, Property)) {
    return 0;
  }
  uint64_t result = (uint64_t)WiFiNetworkCopyPassword((CFDictionaryRef *)a1);
  if (result) {
    goto LABEL_3;
  }
  return result;
}

uint64_t WiFiNetworkSetPasswordSyncable()
{
  return 1;
}

uint64_t WiFiNetworkIsPasswordSyncing(const void *a1)
{
  CFStringRef AccountForNetwork = WiFiNetworkGetAccountForNetwork(a1);

  return WiFiSecurityIsPasswordSyncing(AccountForNetwork);
}

void WiFiNetworkSetState(uint64_t a1, int a2)
{
  if (a1)
  {
    int v4 = (const void **)MEMORY[0x1E4F1CFD0];
    int v5 = *(__CFDictionary **)(a1 + 16);
    if (!a2) {
      int v4 = (const void **)MEMORY[0x1E4F1CFC8];
    }
    CFDictionarySetValue(v5, @"enabled", *v4);
    if (a2)
    {
      WiFiNetworkSetDisabledUntilDate(a1, 0);
      CFDictionaryRemoveValue(*(CFMutableDictionaryRef *)(a1 + 16), @"networkDisabledTimestamp");
      CFDictionaryRemoveValue(*(CFMutableDictionaryRef *)(a1 + 16), @"networkDisabledReason");
      CFDictionaryRemoveValue(*(CFMutableDictionaryRef *)(a1 + 16), @"networkDisabledClientName");
      __int16 v6 = *(__CFDictionary **)(a1 + 16);
      __int16 v7 = @"prevJoined";
    }
    else
    {
      __int16 v6 = *(__CFDictionary **)(a1 + 16);
      __int16 v7 = @"WiFiNetworkUserAcceptedRecommendationAt";
    }
    CFDictionaryRemoveValue(v6, v7);
  }
}

void WiFiNetworkSetDisabledUntilDate(uint64_t a1, const void *a2)
{
  if (a1)
  {
    CFStringRef v2 = a2;
    uint64_t v3 = a1;
    if (!a2)
    {
      a1 = v3;
      CFStringRef v2 = 0;
    }
    WiFiNetworkSetProperty(a1, @"WiFiNetworkDisabledUntilDate", v2);
  }
}

void WiFiNetworkSetStateWithReason(CFMutableDictionaryRef *a1, int a2, const void *a3)
{
  if (a1)
  {
    if (a3)
    {
      CFTypeID TypeID = CFStringGetTypeID();
      if (TypeID == CFGetTypeID(a3))
      {
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
          WiFiNetworkSetStateWithReason_cold_1(a1, a2, (uint64_t)a3);
        }
        BOOL IsEnabled = WiFiNetworkIsEnabled((uint64_t)a1);
        if (!a2 && IsEnabled)
        {
          WiFiNetworkSetProperty((uint64_t)a1, @"networkDisabledReason", a3);
          CFAllocatorRef v8 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
          CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
          CFDateRef v10 = CFDateCreate(v8, Current);
          if (v10)
          {
            CFDateRef v11 = v10;
            CFDictionarySetValue(a1[2], @"networkDisabledTimestamp", v10);
            CFRelease(v11);
          }
        }
      }
    }
  }
  WiFiNetworkSetState((uint64_t)a1, a2);
}

BOOL WiFiNetworkIsEnabled(uint64_t a1)
{
  CFStringRef Value = CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 16), @"enabled");
  return !Value || CFEqual(Value, (CFTypeRef)*MEMORY[0x1E4F1CFC8]) == 0;
}

BOOL WiFiNetworkHasAutoJoinPreference(uint64_t a1)
{
  return CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 16), @"enabled") != 0;
}

void WiFiNetworkSetAssociationDate(uint64_t a1, int a2, const void *a3)
{
  LastAssociationDate = (const void *)WiFiNetworkGetLastAssociationDate(a1);
  if (LastAssociationDate) {
    WiFiNetworkSetProperty(a1, @"prevJoined", LastAssociationDate);
  }
  if (a2) {
    __int16 v7 = @"lastJoined";
  }
  else {
    __int16 v7 = @"lastAutoJoined";
  }

  WiFiNetworkSetProperty(a1, v7, a3);
}

unint64_t WiFiNetworkGetLastAssociationDate(uint64_t a1)
{
  unint64_t Property = (unint64_t)WiFiNetworkGetProperty(a1, @"lastJoined");
  unint64_t result = (unint64_t)WiFiNetworkGetProperty(a1, @"lastAutoJoined");
  if (Property | result)
  {
    CFDateRef v4 = (const __CFDate *)result;
    if (!result) {
      unint64_t result = Property;
    }
    if (Property && v4)
    {
      if (CFDateCompare((CFDateRef)Property, v4, 0) == kCFCompareGreaterThan) {
        return Property;
      }
      else {
        return (unint64_t)v4;
      }
    }
  }
  else
  {
    return 0;
  }
  return result;
}

const void *WiFiNetworkGetAssociationDate(uint64_t a1, int a2)
{
  if (a2) {
    CFStringRef v2 = @"lastJoined";
  }
  else {
    CFStringRef v2 = @"lastAutoJoined";
  }
  return WiFiNetworkGetProperty(a1, v2);
}

double WiFiNetworkGetTimeIntervalSinceLastAssociation(uint64_t a1)
{
  CFDateRef LastAssociationDate = (const __CFDate *)WiFiNetworkGetLastAssociationDate(a1);
  CFDateRef Property = (const __CFDate *)WiFiNetworkGetProperty(a1, @"prevJoined");
  if (LastAssociationDate && Property)
  {
    return CFDateGetTimeIntervalSinceDate(LastAssociationDate, Property);
  }
  else
  {
    double result = -1.0;
    if (LastAssociationDate) {
      return 0.0;
    }
  }
  return result;
}

double WiFiNetworkGetNetworkUsage(uint64_t a1)
{
  CFDateRef Property = WiFiNetworkGetProperty(a1, @"networkUsage");

  return _CFTypeGetFloatValue(Property);
}

void WiFiNetworkSetNetworkUsage(uint64_t a1, double a2)
{
}

const void *WiFiNetworkGetChannelFlags(uint64_t a1, uint64_t a2)
{
  if (a1)
  {
    return WiFiNetworkGetProperty(a1, @"CHANNEL_FLAGS");
  }
  else
  {
    return 0;
  }
}

uint64_t WiFiNetworkGetChannelWidthInMHz(uint64_t a1)
{
  unsigned __int16 valuePtr = 0;
  if (a1 && (CFNumberRef Property = (const __CFNumber *)WiFiNetworkGetProperty(a1, @"CHANNEL_WIDTH")) != 0)
  {
    CFNumberGetValue(Property, kCFNumberSInt16Type, &valuePtr);
    return valuePtr;
  }
  else
  {
    return 0;
  }
}

uint64_t WiFiNetworkGetChannelFreqBand(int a1)
{
  if (a1 < 1) {
    return 0;
  }
  if (a1 < 0xF) {
    return 1;
  }
  uint64_t v2 = 0;
  while (channels5Ghz[v2] != a1)
  {
    if (++v2 == 33) {
      return 0;
    }
  }
  return 2;
}

void WiFiNetworkPrepareKnownBssList(uint64_t a1)
{
  CFAllocatorRef v2 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
  CFDateRef v4 = CFDateCreate(v2, Current);
  CFDateRef v5 = v4;
  if (!a1 || !v4) {
    goto LABEL_45;
  }
  CFNumberRef Property = WiFiNetworkGetProperty(a1, @"CHANNEL");
  if (Property)
  {
    __int16 v7 = Property;
    CFAllocatorRef v8 = WiFiNetworkGetProperty(a1, @"CHANNEL_FLAGS");
    if (v8)
    {
      uint64_t v9 = v8;
      CFDateRef v10 = WiFiNetworkGetProperty(a1, @"BSSID");
      if (v10)
      {
        CFDateRef v11 = v10;
        CFArrayRef theArray = CFArrayCreateMutable(v2, 0, MEMORY[0x1E4F1D510]);
        if (theArray)
        {
          CFArrayRef v12 = (const __CFArray *)WiFiNetworkGetProperty(a1, @"networkKnownBSSListKey");
          uint64_t v36 = a1;
          if (!v12) {
            goto LABEL_20;
          }
          CFArrayRef v13 = v12;
          if (CFArrayGetCount(v12) < 1)
          {
            CFDictionaryRef v14 = 0;
          }
          else
          {
            CFDictionaryRef v14 = 0;
            CFIndex v15 = 0;
            do
            {
              CFDictionaryRef ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(v13, v15);
              if (ValueAtIndex)
              {
                CFDictionaryRef v17 = ValueAtIndex;
                CFStringRef Value = CFDictionaryGetValue(ValueAtIndex, @"BSSID");
                if (Value)
                {
                  if (CFEqual(Value, v11)) {
                    CFDictionaryRef v14 = v17;
                  }
                  else {
                    CFArrayAppendValue(theArray, v17);
                  }
                }
              }
              ++v15;
            }
            while (v15 < CFArrayGetCount(v13));
          }
          a1 = v36;
          if (v14) {
            CFDictionaryRef MutableCopy = CFDictionaryCreateMutableCopy(v2, 0, v14);
          }
          else {
LABEL_20:
          }
            CFDictionaryRef MutableCopy = CFDictionaryCreateMutable(v2, 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
          unint64_t v20 = MutableCopy;
          if (MutableCopy)
          {
            CFDictionarySetValue(MutableCopy, @"BSSID", v11);
            CFDictionarySetValue(v20, @"CHANNEL", v7);
            CFDictionarySetValue(v20, @"CHANNEL_FLAGS", v9);
            CFDictionarySetValue(v20, @"lastRoamed", v5);
            CFNumberRef v21 = (const __CFNumber *)WiFiNetworkGetProperty(a1, @"CHANNEL_FLAGS");
            if (v21)
            {
              int valuePtr = 0;
              CFNumberGetValue(v21, kCFNumberSInt32Type, &valuePtr);
              if ((valuePtr & 0x2000) != 0)
              {
                CFArrayRef v22 = (const __CFArray *)WiFiNetworkGetProperty(a1, @"ORIG_RNR_CHANNEL_LIST");
                if (v22)
                {
                  CFArrayRef v23 = v22;
                  if (CFArrayGetCount(v22) >= 1)
                  {
                    CFDateRef v35 = v5;
                    CFIndex v24 = 0;
                    CFNumberRef v25 = 0;
                    int v26 = 0;
                    CFNumberRef v27 = 0;
                    int v28 = 0;
                    while (!v28 || !v26)
                    {
                      CFDictionaryRef v29 = (const __CFDictionary *)CFArrayGetValueAtIndex(v23, v24);
                      if (v29)
                      {
                        CFDictionaryRef v30 = v29;
                        unsigned int v31 = CFDictionaryGetValue(v29, @"CHANNEL");
                        CFNumberRef v32 = (const __CFNumber *)CFDictionaryGetValue(v30, @"CHANNEL_FLAGS");
                        if (v31)
                        {
                          CFNumberRef v33 = v32;
                          if (v32)
                          {
                            int v38 = 0;
                            CFNumberGetValue(v32, kCFNumberSInt32Type, &v38);
                            if ((v38 & 8) != 0)
                            {
                              int v28 = v31;
                              CFNumberRef v27 = v33;
                            }
                            else if ((v38 & 0x10) != 0)
                            {
                              int v26 = v31;
                              CFNumberRef v25 = v33;
                            }
                          }
                        }
                      }
                      if (CFArrayGetCount(v23) <= ++v24)
                      {
                        if (!v26) {
                          goto LABEL_39;
                        }
                        break;
                      }
                    }
                    CFDictionarySetValue(v20, @"colocated5GHzRNRChannel", v26);
                    CFDictionarySetValue(v20, @"colocated5GHzRNRChannelFlags", v25);
LABEL_39:
                    CFDateRef v5 = v35;
                    a1 = v36;
                    if (v28)
                    {
                      CFDictionarySetValue(v20, @"colocated2GHzRNRChannel", v28);
                      CFDictionarySetValue(v20, @"colocated2GHzRNRChannelFlags", v27);
                    }
                  }
                }
              }
            }
            CFIndex v34 = WiFiNetworkGetProperty(a1, @"LEAKY_AP_LEARNED_DATA");
            if (v34)
            {
              CFDictionarySetValue(v20, @"LEAKY_AP_LEARNED_DATA", v34);
              WiFiNetworkSetProperty(a1, @"LEAKY_AP_LEARNED_DATA", 0);
            }
            CFArrayAppendValue(theArray, v20);
            WiFiNetworkSetProperty(a1, @"networkKnownBSSListKey", theArray);
            CFRelease(theArray);
          }
          else
          {
            unint64_t v20 = theArray;
          }
          CFRelease(v20);
LABEL_45:
          if (!v5) {
            return;
          }
        }
      }
    }
  }
  CFRelease(v5);
}

void WiFiNetworkRemoveBssFromKnownList(uint64_t a1, CFArrayRef theArray)
{
  if (a1)
  {
    if (theArray)
    {
      if (CFArrayGetCount(theArray) >= 1)
      {
        CFArrayRef Property = (const __CFArray *)WiFiNetworkGetProperty(a1, @"networkKnownBSSListKey");
        if (Property)
        {
          CFArrayRef v5 = Property;
          CFMutableArrayRef Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, MEMORY[0x1E4F1D510]);
          if (Mutable)
          {
            __int16 v7 = Mutable;
            if (CFArrayGetCount(v5) >= 1)
            {
              CFIndex v8 = 0;
              do
              {
                CFDictionaryRef ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(v5, v8);
                if (ValueAtIndex)
                {
                  CFDictionaryRef v10 = ValueAtIndex;
                  CFStringRef Value = CFDictionaryGetValue(ValueAtIndex, @"BSSID");
                  if (Value)
                  {
                    CFArrayRef v12 = Value;
                    v14.length = CFArrayGetCount(theArray);
                    v14.location = 0;
                    if (CFArrayGetFirstIndexOfValue(theArray, v14, v12) == -1) {
                      CFArrayAppendValue(v7, v10);
                    }
                    else {
                  }
                    }
                }
                ++v8;
              }
              while (v8 < CFArrayGetCount(v5));
            }
            WiFiNetworkSetProperty(a1, @"networkKnownBSSListKey", v7);
            CFRelease(v7);
          }
        }
      }
    }
  }
}

void WiFiNetworkSetKnownBssUsageData(uint64_t a1, uint64_t a2)
{
  CFAllocatorRef v4 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
  CFDateRef v6 = CFDateCreate(v4, Current);
  if (a1 && a2)
  {
    CFArrayRef Property = WiFiNetworkGetProperty(a2, @"CHANNEL");
    CFIndex v8 = WiFiNetworkGetProperty(a2, @"CHANNEL_FLAGS");
    uint64_t v9 = WiFiNetworkGetProperty(a2, @"BSSID");
    if (!v9)
    {
      if (!v6) {
        return;
      }
      goto LABEL_25;
    }
    CFDictionaryRef v10 = v9;
    CFMutableArrayRef Mutable = CFArrayCreateMutable(v4, 0, MEMORY[0x1E4F1D510]);
    if (Mutable)
    {
      CFArrayRef v12 = Mutable;
      CFArrayRef v23 = v8;
      CFArrayRef v13 = (const __CFArray *)WiFiNetworkGetProperty(a1, @"networkKnownBSSListKey");
      if (!v13) {
        goto LABEL_18;
      }
      CFArrayRef v14 = v13;
      CFDateRef v22 = v6;
      if (CFArrayGetCount(v13) < 1)
      {
        CFDictionaryRef v15 = 0;
      }
      else
      {
        CFDictionaryRef v15 = 0;
        CFIndex v16 = 0;
        do
        {
          CFDictionaryRef ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(v14, v16);
          if (ValueAtIndex)
          {
            CFDictionaryRef v18 = ValueAtIndex;
            CFStringRef Value = CFDictionaryGetValue(ValueAtIndex, @"BSSID");
            if (Value)
            {
              if (CFEqual(Value, v10)) {
                CFDictionaryRef v15 = v18;
              }
              else {
                CFArrayAppendValue(v12, v18);
              }
            }
          }
          ++v16;
        }
        while (v16 < CFArrayGetCount(v14));
      }
      CFDateRef v6 = v22;
      if (v15) {
        CFDictionaryRef MutableCopy = CFDictionaryCreateMutableCopy(v4, 0, v15);
      }
      else {
LABEL_18:
      }
        CFDictionaryRef MutableCopy = CFDictionaryCreateMutable(v4, 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
      CFNumberRef v21 = MutableCopy;
      if (MutableCopy)
      {
        CFDictionarySetValue(MutableCopy, @"BSSID", v10);
        CFDictionarySetValue(v21, @"CHANNEL", Property);
        CFDictionarySetValue(v21, @"CHANNEL_FLAGS", v23);
        CFDictionarySetValue(v21, @"lastRoamed", v6);
        CFArrayAppendValue(v12, v21);
        if (CFArrayGetCount(v12) >= 21)
        {
          CFArrayRemoveValueAtIndex(v12, 0);
        }
        WiFiNetworkSetProperty(a2, @"networkKnownBSSListKey", v12);
        WiFiNetworkSetProperty(a1, @"networkKnownBSSListKey", v12);
        CFRelease(v21);
      }
      CFRelease(v12);
    }
  }
  if (!v6) {
    return;
  }
LABEL_25:

  CFRelease(v6);
}

void WiFiNetworkSetBSSLocation(uint64_t a1, const void *a2, double a3, double a4, double a5)
{
  if (a1 && a2)
  {
    CFArrayRef Property = WiFiNetworkGetProperty(a1, @"BSSID");
    if (Property)
    {
      CFDateRef v11 = Property;
      CFAllocatorRef v12 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
      CFMutableArrayRef Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, MEMORY[0x1E4F1D510]);
      if (Mutable)
      {
        CFArrayRef v14 = Mutable;
        CFArrayRef v15 = (const __CFArray *)WiFiNetworkGetProperty(a1, @"networkKnownBSSListKey");
        if (v15)
        {
          CFArrayRef v16 = v15;
          if (CFArrayGetCount(v15) >= 1)
          {
            CFDictionaryRef v17 = 0;
            CFIndex v18 = 0;
            do
            {
              CFDictionaryRef ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(v16, v18);
              if (ValueAtIndex)
              {
                CFDictionaryRef v20 = ValueAtIndex;
                CFStringRef Value = CFDictionaryGetValue(ValueAtIndex, @"BSSID");
                if (Value)
                {
                  if (CFEqual(Value, v11)) {
                    CFDictionaryRef v17 = v20;
                  }
                  else {
                    CFArrayAppendValue(v14, v20);
                  }
                }
              }
              ++v18;
            }
            while (v18 < CFArrayGetCount(v16));
            if (v17)
            {
              CFDictionaryRef MutableCopy = CFDictionaryCreateMutableCopy(v12, 0, v17);
              if (MutableCopy)
              {
                CFArrayRef v23 = MutableCopy;
                CFDictionarySetValue(MutableCopy, @"networkLocnLat", (const void *)[NSNumber numberWithDouble:a3]);
                CFDictionarySetValue(v23, @"networkLocnLong", (const void *)[NSNumber numberWithDouble:a4]);
                CFDictionarySetValue(v23, @"networkLocnAccuracy", (const void *)[NSNumber numberWithDouble:a5]);
                CFDictionarySetValue(v23, @"networkLocnTimestamp", a2);
                CFArrayAppendValue(v14, v23);
                WiFiNetworkSetProperty(a1, @"networkKnownBSSListKey", v14);
                CFRelease(v23);
              }
            }
          }
        }
        CFRelease(v14);
      }
    }
    else
    {
      CFIndex v24 = (void *)MEMORY[0x1C18A51F0]();
    }
  }
}

void WiFiNetworkSetBSSProperty(const void *a1, const __CFString *a2, uint64_t a3)
{
  if (a1 && a3)
  {
    CFStringRef SSID = WiFiNetworkGetSSID(a1);
    if (a2)
    {
      CFAllocatorRef v7 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
      CFMutableArrayRef Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, MEMORY[0x1E4F1D510]);
      if (Mutable)
      {
        uint64_t v9 = Mutable;
        CFArrayRef Property = (const __CFArray *)WiFiNetworkGetProperty((uint64_t)a1, @"networkKnownBSSListKey");
        if (Property)
        {
          CFArrayRef v11 = Property;
          if (CFArrayGetCount(Property) >= 1)
          {
            CFIndex v12 = 0;
            do
            {
              CFDictionaryRef ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(v11, v12);
              if (ValueAtIndex)
              {
                CFDictionaryRef v14 = ValueAtIndex;
                CFStringRef Value = (const __CFString *)CFDictionaryGetValue(ValueAtIndex, @"BSSID");
                if (Value)
                {
                  if (CFStringCompare(Value, a2, 1uLL))
                  {
                    CFArrayAppendValue(v9, v14);
                  }
                  else
                  {
                    CFMutableDictionaryRef MutableCopy = CFDictionaryCreateMutableCopy(v7, 0, v14);
                    if (MutableCopy)
                    {
                      CFMutableDictionaryRef v17 = MutableCopy;
                      (*(void (**)(uint64_t, CFMutableDictionaryRef))(a3 + 16))(a3, MutableCopy);
                      CFArrayAppendValue(v9, v17);
                      CFRelease(v17);
                    }
                  }
                }
              }
              ++v12;
            }
            while (v12 < CFArrayGetCount(v11));
          }
        }
        WiFiNetworkSetProperty((uint64_t)a1, @"networkKnownBSSListKey", v9);
        CFRelease(v9);
      }
    }
    else
    {
      CFIndex v18 = (void *)MEMORY[0x1C18A51F0](SSID);
    }
  }
}

void WiFiNetworkSetBSSAWDLRealTimeModeTimestamp(uint64_t a1, const void *a2)
{
  if (a1 && a2)
  {
    CFArrayRef Property = WiFiNetworkGetProperty(a1, @"BSSID");
    if (Property)
    {
      CFArrayRef v5 = Property;
      CFAllocatorRef v6 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
      CFMutableArrayRef Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, MEMORY[0x1E4F1D510]);
      if (Mutable)
      {
        CFIndex v8 = Mutable;
        CFArrayRef v9 = (const __CFArray *)WiFiNetworkGetProperty(a1, @"networkKnownBSSListKey");
        if (v9)
        {
          CFArrayRef v10 = v9;
          if (CFArrayGetCount(v9) >= 1)
          {
            CFDictionaryRef v11 = 0;
            CFIndex v12 = 0;
            do
            {
              CFDictionaryRef ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(v10, v12);
              if (ValueAtIndex)
              {
                CFDictionaryRef v14 = ValueAtIndex;
                CFStringRef Value = CFDictionaryGetValue(ValueAtIndex, @"BSSID");
                if (Value)
                {
                  if (CFEqual(Value, v5)) {
                    CFDictionaryRef v11 = v14;
                  }
                  else {
                    CFArrayAppendValue(v8, v14);
                  }
                }
              }
              ++v12;
            }
            while (v12 < CFArrayGetCount(v10));
            if (v11)
            {
              CFMutableDictionaryRef MutableCopy = CFDictionaryCreateMutableCopy(v6, 0, v11);
              if (MutableCopy)
              {
                CFMutableDictionaryRef v17 = MutableCopy;
                CFDictionarySetValue(MutableCopy, @"AWDLRealTimeModeTimestamp", a2);
                CFArrayAppendValue(v8, v17);
                WiFiNetworkSetProperty(a1, @"networkKnownBSSListKey", v8);
                CFRelease(v17);
              }
            }
          }
        }
        CFRelease(v8);
      }
    }
    else
    {
      CFIndex v18 = (void *)MEMORY[0x1C18A51F0]();
    }
  }
}

void WiFiNetworkSetBssLateRoamInfo(uint64_t a1, uint64_t a2, int a3, int a4)
{
  int v34 = a4;
  int v35 = a3;
  if (a1 && a2)
  {
    CFArrayRef Property = WiFiNetworkGetProperty(a2, @"BSSID");
    if (Property)
    {
      CFArrayRef v9 = Property;
      CFAllocatorRef v10 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
      CFMutableArrayRef Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, MEMORY[0x1E4F1D510]);
      if (!Mutable) {
        return;
      }
      CFArrayRef v12 = (const __CFArray *)WiFiNetworkGetProperty(a1, @"networkKnownBSSListKey");
      if (!v12) {
        goto LABEL_40;
      }
      CFArrayRef v13 = v12;
      int v32 = a3;
      if (CFArrayGetCount(v12) < 1)
      {
        CFDictionaryRef v14 = 0;
      }
      else
      {
        CFDictionaryRef v14 = 0;
        CFIndex v15 = 0;
        do
        {
          CFDictionaryRef ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(v13, v15);
          if (ValueAtIndex)
          {
            CFDictionaryRef v17 = ValueAtIndex;
            CFStringRef Value = CFDictionaryGetValue(ValueAtIndex, @"BSSID");
            if (Value)
            {
              if (CFEqual(Value, v9)) {
                CFDictionaryRef v14 = v17;
              }
              else {
                CFArrayAppendValue(Mutable, v17);
              }
            }
          }
          ++v15;
        }
        while (v15 < CFArrayGetCount(v13));
      }
      int v19 = a4;
      if (!v14) {
        goto LABEL_40;
      }
      CFMutableDictionaryRef MutableCopy = CFDictionaryCreateMutableCopy(v10, 0, v14);
      if (!MutableCopy)
      {
        goto LABEL_40;
      }
      CFMutableDictionaryRef v21 = MutableCopy;
      CFDictionaryRef v22 = (const __CFDictionary *)CFDictionaryGetValue(v14, @"lateRoamInfo");
      if (v22)
      {
        CFDictionaryRef v23 = v22;
        CFDictionaryRef v24 = CFDictionaryCreateMutableCopy(v10, 0, v23);
      }
      else
      {
        CFDictionaryRef v24 = CFDictionaryCreateMutable(v10, 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
      }
      CFDictionaryRef v25 = v24;
      if (!v24)
      {
        goto LABEL_39;
      }
      CFNumberRef v26 = (const __CFNumber *)CFDictionaryGetValue(v24, @"lateRoamMinDelta");
      if (v26 && (int valuePtr = 0, CFNumberGetValue(v26, kCFNumberIntType, &valuePtr)) && valuePtr <= v32)
      {
        CFNumberRef v27 = 0;
      }
      else
      {
        CFNumberRef v28 = CFNumberCreate(v10, kCFNumberIntType, &v35);
        if (!v28)
        {
LABEL_38:
          CFRelease(v25);
LABEL_39:
          CFRelease(v21);
LABEL_40:
          CFRelease(Mutable);
          return;
        }
        CFNumberRef v27 = v28;
        CFDictionarySetValue(v25, @"lateRoamMinDelta", v28);
      }
      CFNumberRef v29 = (const __CFNumber *)CFDictionaryGetValue(v25, @"lateRoamMaxDelta");
      if (v29 && (int valuePtr = 0, CFNumberGetValue(v29, kCFNumberIntType, &valuePtr)) && valuePtr >= v19)
      {
        CFNumberRef v30 = 0;
      }
      else
      {
        CFNumberRef v30 = CFNumberCreate(v10, kCFNumberIntType, &v34);
        if (!v30)
        {
          if (!v27)
          {
LABEL_36:
            if (v30) {
              CFRelease(v30);
            }
            goto LABEL_38;
          }
LABEL_35:
          CFRelease(v27);
          goto LABEL_36;
        }
        CFDictionarySetValue(v25, @"lateRoamMaxDelta", v30);
      }
      CFDictionarySetValue(v21, @"lateRoamInfo", v25);
      CFArrayAppendValue(Mutable, v21);
      WiFiNetworkSetProperty(a2, @"networkKnownBSSListKey", Mutable);
      WiFiNetworkSetProperty(a1, @"networkKnownBSSListKey", Mutable);
      if (!v27) {
        goto LABEL_36;
      }
      goto LABEL_35;
    }
    unsigned int v31 = (void *)MEMORY[0x1C18A51F0]();
  }
}

void WiFiNetworkSetBssDisconnectReason(uint64_t a1, const __CFString *a2, int a3)
{
  double Current = CFAbsoluteTimeGetCurrent();
  uint64_t v41 = 0;
  int valuePtr = 0;
  if (!a1 || !a2) {
    return;
  }
  int v7 = a3 - 3;
  if ((a3 - 3) >= 3)
  {
    CFDictionaryRef v14 = (void *)MEMORY[0x1C18A51F0](Current);
    return;
  }
  CFAbsoluteTime v8 = Current;
  LODWORD(v37) = dword_1BF219EB8[v7];
  HIDWORD(v37) = dword_1BF219EAC[v7];
  CFArrayRef Property = WiFiNetworkGetProperty(a1, @"knownBSSUpdatedDate");
  CFAllocatorRef v10 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  CFDateRef v11 = CFDateCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], v8);
  if (!Property)
  {
    int v13 = 1;
    goto LABEL_12;
  }
  double v12 = v8 - MEMORY[0x1C18A4890](Property);
  if (v12 > 2592000.0)
  {
    int v13 = 0;
    LOBYTE(Property) = 1;
LABEL_12:
    WiFiNetworkSetProperty(a1, @"knownBSSUpdatedDate", v11);
    char v15 = v13;
    char v16 = (char)Property;
    goto LABEL_13;
  }
  LOBYTE(Property) = 0;
  char v15 = 0;
  int v13 = 1;
  char v16 = 1;
  if (v12 > 1296000.0) {
    goto LABEL_12;
  }
LABEL_13:
  int v38 = v13;
  CFDateRef cf = v11;
  CFArrayRef v17 = (const __CFArray *)WiFiNetworkGetProperty(a1, @"networkKnownBSSListKey");
  CFMutableArrayRef Mutable = CFArrayCreateMutable(v10, 0, MEMORY[0x1E4F1D510]);
  if (Mutable)
  {
    int v19 = Mutable;
    if (v17 && CFArrayGetCount(v17) >= 1)
    {
      CFIndex v20 = 0;
      char v39 = v15 | Property;
      do
      {
        CFDictionaryRef ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(v17, v20);
        if (!ValueAtIndex) {
          goto LABEL_44;
        }
        CFDictionaryRef v22 = ValueAtIndex;
        CFStringRef Value = (const __CFString *)CFDictionaryGetValue(ValueAtIndex, @"BSSID");
        if (!Value) {
          goto LABEL_44;
        }
        CFStringRef v24 = Value;
        if (CFStringCompare(Value, a2, 0))
        {
          uint64_t v41 = 0;
          if ((v39 & 1) == 0)
          {
            CFArrayAppendValue(v19, v22);
            goto LABEL_44;
          }
        }
        else
        {
          uint64_t v41 = v37;
        }
        CFNumberRef v25 = (const __CFNumber *)CFDictionaryGetValue(v22, @"beaconLossCount");
        if (v25)
        {
          CFNumberGetValue(v25, kCFNumberIntType, &valuePtr);
          if (v16)
          {
            if (!v38) {
              goto LABEL_29;
            }
            int v26 = valuePtr & 0xFF00 | (BYTE4(v41) + valuePtr);
          }
          else
          {
            int v26 = BYTE4(v41) | (valuePtr << 8);
          }
          HIDWORD(v41) = v26;
        }
LABEL_29:
        CFNumberRef v27 = (const __CFNumber *)CFDictionaryGetValue(v22, @"trigDisconnectCount");
        if (!v27) {
          goto LABEL_35;
        }
        CFNumberGetValue(v27, kCFNumberIntType, &valuePtr);
        if (v16)
        {
          if (!v38) {
            goto LABEL_35;
          }
          int v28 = valuePtr & 0xFF00 | (v41 + valuePtr);
        }
        else
        {
          int v28 = v41 | (valuePtr << 8);
        }
        LODWORD(v41) = v28;
LABEL_35:
        int v29 = CFEqual(v24, a2);
        if (a3 == 5 && v29) {
          uint64_t v41 = 0;
        }
        CFMutableDictionaryRef MutableCopy = CFDictionaryCreateMutableCopy(v10, 0, v22);
        if (!MutableCopy) {
          goto LABEL_46;
        }
        unsigned int v31 = MutableCopy;
        CFNumberRef v32 = CFNumberCreate(v10, kCFNumberIntType, (char *)&v41 + 4);
        if (v32)
        {
          CFNumberRef v33 = v32;
          CFDictionarySetValue(v31, @"beaconLossCount", v32);
          CFRelease(v33);
        }
        CFNumberRef v34 = CFNumberCreate(v10, kCFNumberIntType, &v41);
        if (v34)
        {
          CFNumberRef v35 = v34;
          CFDictionarySetValue(v31, @"trigDisconnectCount", v34);
          CFRelease(v35);
        }
        CFArrayInsertValueAtIndex(v19, v20, v31);
        CFRelease(v31);
LABEL_44:
        ++v20;
      }
      while (v20 < CFArrayGetCount(v17));
    }
    WiFiNetworkSetProperty(a1, @"networkKnownBSSListKey", v19);
LABEL_46:
    CFRelease(v19);
  }
  if (cf) {
    CFRelease(cf);
  }
}

__CFDictionary *WiFiNetworkCopyNetworkChannelList(uint64_t a1)
{
  CFArrayRef Property = (const __CFArray *)WiFiNetworkGetProperty(a1, @"networkKnownBSSListKey");
  if (!Property) {
    return 0;
  }
  CFArrayRef v2 = Property;
  CFAllocatorRef v3 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  CFMutableArrayRef Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
  if (Mutable && CFArrayGetCount(v2) >= 1)
  {
    CFIndex v5 = 0;
    do
    {
      CFDictionaryRef ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(v2, v5);
      if (ValueAtIndex)
      {
        CFDictionaryRef v7 = ValueAtIndex;
        CFStringRef Value = CFDictionaryGetValue(ValueAtIndex, @"CHANNEL");
        if (Value)
        {
          CFArrayRef v9 = Value;
          CFAllocatorRef v10 = CFStringCreateMutable(v3, 0);
          if (v10)
          {
            CFDateRef v11 = v10;
            CFStringAppendFormat(v10, 0, @"%@", v9);
            CFDictionarySetValue(Mutable, v11, v7);
            CFRelease(v11);
          }
        }
      }
      ++v5;
    }
    while (v5 < CFArrayGetCount(v2));
  }
  return Mutable;
}

uint64_t WiFiNetworkIsEdgeBss(uint64_t a1, const void *a2)
{
  uint64_t v2 = 0;
  uint64_t valuePtr = 0;
  if (a1 && a2)
  {
    CFArrayRef Property = (const __CFArray *)WiFiNetworkGetProperty(a1, @"networkKnownBSSListKey");
    uint64_t v2 = (uint64_t)Property;
    if (Property)
    {
      if (CFArrayGetCount(Property) < 1)
      {
LABEL_10:
        uint64_t v2 = 0;
      }
      else
      {
        CFIndex v5 = 0;
        while (1)
        {
          CFDictionaryRef ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex((CFArrayRef)v2, v5);
          if (ValueAtIndex)
          {
            CFDictionaryRef v7 = ValueAtIndex;
            CFStringRef Value = CFDictionaryGetValue(ValueAtIndex, @"BSSID");
            if (Value)
            {
              if (CFEqual(Value, a2)) {
                break;
              }
            }
          }
          if (++v5 >= CFArrayGetCount((CFArrayRef)v2)) {
            goto LABEL_10;
          }
        }
        CFNumberRef v10 = (const __CFNumber *)CFDictionaryGetValue(v7, @"beaconLossCount");
        if (v10)
        {
          CFNumberGetValue(v10, kCFNumberIntType, (char *)&valuePtr + 4);
          HIDWORD(valuePtr) = BYTE5(valuePtr) + BYTE4(valuePtr);
        }
        CFNumberRef v11 = (const __CFNumber *)CFDictionaryGetValue(v7, @"trigDisconnectCount");
        if (v11)
        {
          CFNumberGetValue(v11, kCFNumberIntType, &valuePtr);
          LODWORD(valuePtr) = BYTE1(valuePtr) + valuePtr;
          BOOL v12 = valuePtr > 2;
        }
        else
        {
          BOOL v12 = 0;
        }
        uint64_t v2 = SHIDWORD(valuePtr) > 5 || v12;
      }
    }
  }
  return v2;
}

uint64_t WiFiNetworkSortNetworksByUsageTime(uint64_t a1, uint64_t a2)
{
  if (a1 | a2) {
    uint64_t v3 = -1;
  }
  else {
    uint64_t v3 = 0;
  }
  if (a2) {
    uint64_t result = 1;
  }
  else {
    uint64_t result = v3;
  }
  if (a1 && a2)
  {
    CFArrayRef Property = WiFiNetworkGetProperty(a1, @"networkUsage");
    FloatCFStringRef Value = _CFTypeGetFloatValue(Property);
    CFAbsoluteTime v8 = WiFiNetworkGetProperty(a2, @"networkUsage");
    double v9 = _CFTypeGetFloatValue(v8);
    if (FloatValue >= v9)
    {
      if (FloatValue <= v9)
      {
        return WiFiNetworkSortNetworksByLastUsedDate(a1, a2);
      }
      else
      {
        return -1;
      }
    }
    else
    {
      return 1;
    }
  }
  return result;
}

uint64_t WiFiNetworkSortNetworksByLastUsedDate(uint64_t a1, uint64_t a2)
{
  if (a1 | a2) {
    uint64_t v3 = -1;
  }
  else {
    uint64_t v3 = 0;
  }
  if (a2) {
    uint64_t result = 1;
  }
  else {
    uint64_t result = v3;
  }
  if (a1 && a2)
  {
    CFDateRef Property = (const __CFDate *)WiFiNetworkGetProperty(a1, @"lastAutoJoined");
    CFDateRef v7 = (const __CFDate *)WiFiNetworkGetProperty(a1, @"lastJoined");
    CFDateRef v8 = v7;
    if (Property && v7)
    {
      CFComparisonResult v9 = CFDateCompare(Property, v7, 0);
      if (v9 == kCFCompareGreaterThan) {
        CFDateRef v10 = Property;
      }
      else {
        CFDateRef v10 = 0;
      }
      if (v9 == kCFCompareEqualTo) {
        CFDateRef v10 = v8;
      }
      if (v9 == kCFCompareLessThan) {
        CFDateRef Property = v8;
      }
      else {
        CFDateRef Property = v10;
      }
    }
    else if (!Property)
    {
      CFDateRef Property = v7;
    }
    CFDateRef v11 = (const __CFDate *)WiFiNetworkGetProperty(a2, @"lastAutoJoined");
    CFDateRef v12 = (const __CFDate *)WiFiNetworkGetProperty(a2, @"lastJoined");
    CFDateRef v13 = v12;
    if (v11 && v12)
    {
      CFComparisonResult v14 = CFDateCompare(v11, v12, 0);
      if (v14 != kCFCompareLessThan)
      {
        if (v14)
        {
          CFDateRef v13 = v11;
          if (v14 != kCFCompareGreaterThan)
          {
            BOOL v15 = 0;
            BOOL v16 = Property != 0;
LABEL_34:
            if (v16) {
              return -1;
            }
            else {
              return v15;
            }
          }
        }
      }
    }
    else if (v11)
    {
      CFDateRef v13 = v11;
    }
    BOOL v16 = Property != 0;
    BOOL v15 = v13 != 0;
    if (!Property || !v13) {
      goto LABEL_34;
    }
    CFComparisonResult v17 = CFDateCompare(Property, v13, 0);
    if (v17 == kCFCompareGreaterThan) {
      return -1;
    }
    else {
      return v17 == kCFCompareLessThan;
    }
  }
  return result;
}

BOOL WiFiNetworkSortNetworksBySignalStrength(uint64_t a1, uint64_t a2)
{
  uint64_t valuePtr = 0;
  if (a1 | a2) {
    uint64_t v2 = -1;
  }
  else {
    uint64_t v2 = 0;
  }
  if (a2) {
    uint64_t v2 = 1;
  }
  if (a1 && a2)
  {
    CFNumberRef Property = (const __CFNumber *)WiFiNetworkGetProperty(a1, @"Strength");
    if (Property) {
      CFNumberGetValue(Property, kCFNumberFloatType, (char *)&valuePtr + 4);
    }
    CFNumberRef v5 = (const __CFNumber *)WiFiNetworkGetProperty(a2, @"Strength");
    if (v5)
    {
      CFNumberGetValue(v5, kCFNumberFloatType, &valuePtr);
      float v6 = *(float *)&valuePtr;
    }
    else
    {
      float v6 = 0.0;
    }
    uint64_t v2 = -1;
    if (*((float *)&valuePtr + 1) <= v6) {
      return *((float *)&valuePtr + 1) < v6;
    }
  }
  return v2;
}

CFArrayRef WiFiNetworkIsMultiAPEnvironment(uint64_t a1)
{
  int valuePtr = 0;
  CFArrayRef result = (const __CFArray *)WiFiNetworkGetProperty(a1, @"networkKnownBSSListKey");
  if (result)
  {
    CFArrayRef v2 = result;
    CFIndex Count = CFArrayGetCount(result);
    if (Count >= 2)
    {
      CFIndex v4 = Count;
      uint64_t v5 = 0;
      uint64_t v6 = 0;
      uint64_t v7 = 0;
      CFIndex v8 = 0;
      unsigned int v17 = -1431655766;
      do
      {
        CFDictionaryRef ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(v2, v8);
        if (ValueAtIndex)
        {
          CFDictionaryRef v10 = ValueAtIndex;
          CFNumberRef Value = (const __CFNumber *)CFDictionaryGetValue(ValueAtIndex, @"CHANNEL");
          CFNumberRef v12 = (const __CFNumber *)CFDictionaryGetValue(v10, @"CHANNEL_FLAGS");
          if (Value)
          {
            CFNumberRef v13 = v12;
            if (v12)
            {
              CFNumberGetValue(Value, kCFNumberSInt32Type, &valuePtr);
              CFNumberGetValue(v13, kCFNumberSInt32Type, &v17);
              if (valuePtr)
              {
                if (v17)
                {
                  if ((v17 & 8) != 0)
                  {
                    ++v7;
                  }
                  else if ((v17 & 0x10) != 0)
                  {
                    ++v6;
                  }
                  else
                  {
                    v5 += ((unint64_t)v17 >> 13) & 1;
                  }
                }
              }
            }
          }
        }
        ++v8;
      }
      while (v4 != v8);
      return (const __CFArray *)(v6 > 1 || v7 > 1 || v5 > 1);
    }
    else
    {
      return 0;
    }
  }
  return result;
}

uint64_t WiFiNetworkCompareHomeState(uint64_t a1, uint64_t a2, unsigned char *a3)
{
  if (!(a1 | a2)) {
    return 0;
  }
  if (a1)
  {
    int ForcedHomeFix = WiFiNetworkGetForcedHomeFix(a1);
    if (ForcedHomeFix == 1)
    {
      int v7 = 1;
    }
    else
    {
      int v7 = 0;
    }
    NetworkOfInterestHomeint Type = WiFiNetworkGetNetworkOfInterestHomeType(a1);
    if (NetworkOfInterestHomeType == 1)
    {
      int v9 = 1;
    }
    else
    {
      int v9 = 0;
    }
    BOOL v10 = CFDictionaryContainsKey(*(CFDictionaryRef *)(a1 + 16), @"PayloadUUID") != 0;
    CFDateRef Property = (const __CFDate *)WiFiNetworkGetProperty(a1, @"addedAt");
    if (!a2)
    {
      uint64_t result = -1;
      if (ForcedHomeFix != 1 && NetworkOfInterestHomeType != 1) {
        return 0;
      }
      return result;
    }
    CFDateRef v28 = Property;
  }
  else
  {
    if (!a2) {
      return 0;
    }
    int v9 = 0;
    int v7 = 0;
    BOOL v10 = 0;
    CFDateRef v28 = 0;
  }
  int v13 = WiFiNetworkGetForcedHomeFix(a2);
  if (v13 == 1) {
  unsigned int v14 = WiFiNetworkGetNetworkOfInterestHomeType(a2);
  }
  if (v14 == 1) {
  int v15 = CFDictionaryContainsKey(*(CFDictionaryRef *)(a2 + 16), @"PayloadUUID");
  }
  CFDateRef v16 = (const __CFDate *)WiFiNetworkGetProperty(a2, @"addedAt");
  if (a1 && a2)
  {
    CFDateRef v17 = v16;
    if (v7 && v13 == 1)
    {
      CFDateRef v18 = (const __CFDate *)WiFiNetworkGetProperty(a1, @"kWiFiNetworkLastHomeForceFixDateKey");
      CFDateRef v17 = (const __CFDate *)WiFiNetworkGetProperty(a2, @"kWiFiNetworkLastHomeForceFixDateKey");
      CFDateRef v16 = v18;
LABEL_23:
      CFComparisonResult v19 = CFDateCompare(v16, v17, 0);
      BOOL v20 = v19 == kCFCompareLessThan;
      goto LABEL_50;
    }
    if (v7 && v15 || v10 && v13 == 1)
    {
      if (v7) {
        uint64_t v21 = a1;
      }
      else {
        uint64_t v21 = a2;
      }
      CFDateRef v22 = (const __CFDate *)WiFiNetworkGetProperty(v21, @"kWiFiNetworkLastHomeForceFixDateKey");
      if (v10) {
        uint64_t v23 = a1;
      }
      else {
        uint64_t v23 = a2;
      }
      CFDateRef v24 = (const __CFDate *)WiFiNetworkGetProperty(v23, @"addedAt");
      CFComparisonResult v25 = CFDateCompare(v22, v24, 0);
      if (v25 == kCFCompareLessThan)
      {
        BOOL v20 = v7 == 0;
        uint64_t v26 = -1;
LABEL_51:
        if (v20) {
          return v26;
        }
        else {
          return -v26;
        }
      }
      BOOL v20 = v7 == 0;
LABEL_50:
      uint64_t v26 = 1;
      goto LABEL_51;
    }
    if (v7) {
      BOOL v27 = v13 == 1;
    }
    else {
      BOOL v27 = 1;
    }
    if (!v27) {
      goto LABEL_65;
    }
    if (!v7 && v13 == 1) {
      goto LABEL_62;
    }
    if (v10 && !v15)
    {
LABEL_65:
      return -1;
    }
    if (!v10 && v15)
    {
LABEL_62:
      return 1;
    }
    if (v10 && v15)
    {
      CFDateRef v16 = v28;
      if (v28)
      {
        if (v17) {
          goto LABEL_23;
        }
        goto LABEL_65;
      }
      goto LABEL_62;
    }
    if (v9 && v14 != 1) {
      goto LABEL_65;
    }
    if (!v9 && v14 == 1) {
      goto LABEL_62;
    }
    if (a3) {
      *a3 = v9;
    }
    return 0;
  }
  if (v7) {
    uint64_t result = -1;
  }
  else {
    uint64_t result = 1;
  }
  if (!v7 && v13 != 1)
  {
    uint64_t result = v9 ? -1 : 1;
    if (!v9 && v14 != 1) {
      return 0;
    }
  }
  return result;
}

uint64_t WiFiNetworkGetForcedHomeFix(uint64_t a1)
{
  if (!a1) {
    goto LABEL_7;
  }
  CFBooleanRef Property = (const __CFBoolean *)WiFiNetworkGetProperty(a1, @"NetworkForcedHomeFix");
  if (!Property) {
    return 0;
  }
  CFBooleanRef v2 = Property;
  CFTypeID v3 = CFGetTypeID(Property);
  if (v3 != CFBooleanGetTypeID())
  {
LABEL_7:
    return 0;
  }

  return CFBooleanGetValue(v2);
}

const void *WiFiNetworkGetLastHomeForceFixDate(uint64_t a1)
{
  if (a1)
  {
    return WiFiNetworkGetProperty(a1, @"kWiFiNetworkLastHomeForceFixDateKey");
  }
  else
  {
    return 0;
  }
}

CFDictionaryRef WiFiNetworkIsPublicHotspot(uint64_t a1)
{
  char valuePtr = 0;
  CFDictionaryRef result = (const __CFDictionary *)CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 16), @"11U_INTERWORKING_IE");
  if (result)
  {
    CFDictionaryRef result = (const __CFDictionary *)CFDictionaryGetValue(result, @"INTERWORKING_ACCESS_NETWORK_TYPE");
    if (result)
    {
      CFNumberGetValue(result, kCFNumberSInt8Type, &valuePtr);
      return (const __CFDictionary *)((valuePtr & 0xFE) == 2);
    }
  }
  return result;
}

BOOL WiFiNetworkIsHotspot(uint64_t a1)
{
  return CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 16), @"IsHotspot") == (const void *)*MEMORY[0x1E4F1CFD0]
      || WiFiNetworkIsLegacyHotspot(a1)
      || WiFiNetworkIsHotspot20(a1);
}

void WiFiNetworkDumpHS20AccountInfo(uint64_t a1, __CFString *a2)
{
  value = (void *)*MEMORY[0x1E4F1CFC8];
  if (a2)
  {
    CFStringRef v4 = (const __CFString *)CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 16), @"DomainName");
    if (v4)
    {
      CFStringRef v5 = v4;
      CFStringAppend(a2, @"\nDomain name ");
      CFStringAppend(a2, v5);
    }
    CFArrayRef v6 = (const __CFArray *)CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 16), @"RoamingConsortiumOIs");
    if (v6)
    {
      CFArrayRef v7 = v6;
      CFIndex Count = CFArrayGetCount(v6);
      if (Count)
      {
        uint64_t v9 = Count;
        CFStringAppend(a2, @"\nRoaming Consortium OI ");
        if (v9 >= 1)
        {
          for (CFIndex i = 0; i != v9; ++i)
          {
            CFStringRef ValueAtIndex = (const __CFString *)CFArrayGetValueAtIndex(v7, i);
            CFStringAppend(a2, ValueAtIndex);
            CFStringAppend(a2, @" ");
          }
        }
      }
    }
    CFArrayRef v12 = (const __CFArray *)CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 16), @"NaiRealmName");
    if (v12)
    {
      CFArrayRef v13 = v12;
      CFIndex v14 = CFArrayGetCount(v12);
      if (v14)
      {
        uint64_t v15 = v14;
        CFStringAppend(a2, @"\nNAI Realm Name ");
        if (v15 >= 1)
        {
          for (CFIndex j = 0; j != v15; ++j)
          {
            CFStringRef v17 = (const __CFString *)CFArrayGetValueAtIndex(v13, j);
            CFStringAppend(a2, v17);
            CFStringAppend(a2, @" ");
          }
        }
      }
    }
    CFArrayRef v18 = (const __CFArray *)CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 16), @"MCCandMNC");
    if (v18)
    {
      CFArrayRef v19 = v18;
      CFIndex v20 = CFArrayGetCount(v18);
      if (v20)
      {
        uint64_t v21 = v20;
        CFStringAppend(a2, @"\n3GPP MCC&MNC ");
        if (v21 >= 1)
        {
          for (CFIndex k = 0; k != v21; ++k)
          {
            CFStringRef v23 = (const __CFString *)CFArrayGetValueAtIndex(v19, k);
            CFStringAppend(a2, v23);
            CFStringAppend(a2, @" ");
          }
        }
      }
    }
    CFStringRef v24 = (const __CFString *)CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 16), @"DisplayedOperatorName");
    if (v24)
    {
      CFStringRef v25 = v24;
      CFStringAppend(a2, @"\nFriendly Operator Name ");
      CFStringAppend(a2, v25);
    }
    if (CFDictionaryGetValueIfPresent(*(CFDictionaryRef *)(a1 + 16), @"SPRoaming", (const void **)&value))
    {
      CFStringAppend(a2, @"\nRoaming set to: ");
      if (value) {
        CFStringRef v26 = @"true";
      }
      else {
        CFStringRef v26 = @"false";
      }
      CFStringAppend(a2, v26);
    }
  }
}

__CFDictionary *WiFiNetworkCopyHS20Account(uint64_t a1)
{
  CFMutableArrayRef Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
  if (Mutable)
  {
    CFNumberRef Value = CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 16), @"DomainName");
    if (Value) {
      CFDictionaryAddValue(Mutable, @"DomainName", Value);
    }
    CFStringRef v4 = CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 16), @"DisplayedOperatorName");
    if (v4) {
      CFDictionaryAddValue(Mutable, @"DisplayedOperatorName", v4);
    }
    CFStringRef v5 = CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 16), @"RoamingConsortiumOIs");
    if (v5) {
      CFDictionaryAddValue(Mutable, @"RoamingConsortiumOIs", v5);
    }
    CFArrayRef v6 = CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 16), @"NaiRealmName");
    if (v6) {
      CFDictionaryAddValue(Mutable, @"NaiRealmName", v6);
    }
    CFArrayRef v7 = CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 16), @"MCCandMNC");
    if (v7) {
      CFDictionaryAddValue(Mutable, @"MCCandMNC", v7);
    }
  }
  return Mutable;
}

void WiFiNetworkSetProvisionedHS20Network(uint64_t a1, int a2)
{
  CFBooleanRef v2 = (const void **)MEMORY[0x1E4F1CFD0];
  if (!a2) {
    CFBooleanRef v2 = (const void **)MEMORY[0x1E4F1CFC8];
  }
  WiFiNetworkSetProperty(a1, @"HS20ProvisionedNetwork", *v2);
}

BOOL WiFiNetworkIsProvisionedHS20Network(uint64_t a1)
{
  return WiFiNetworkGetProperty(a1, @"HS20ProvisionedNetwork") == (const void *)*MEMORY[0x1E4F1CFD0];
}

void WiFiNetworkSetHS20HomeOperatorNetwork(uint64_t a1, int a2)
{
  CFBooleanRef v2 = (const void **)MEMORY[0x1E4F1CFD0];
  if (!a2) {
    CFBooleanRef v2 = (const void **)MEMORY[0x1E4F1CFC8];
  }
  WiFiNetworkSetProperty(a1, @"HS20HomeOperatorNetwork", *v2);
}

const void *WiFiNetworkGetHS2NetworkBadge(uint64_t a1)
{
  CFDictionaryRef result = WiFiNetworkGetProperty(a1, @"HS2NetworkBadge");
  if (!result)
  {
    return WiFiNetworkGetHS20OperatorFriendlyName(a1);
  }
  return result;
}

const void *WiFiNetworkGetHS20OperatorFriendlyName(uint64_t a1)
{
  CFDictionaryRef Property = (const __CFDictionary *)WiFiNetworkGetProperty(a1, @"HS20GasResponse");
  if (!Property) {
    return 0;
  }
  CFArrayRef Value = (const __CFArray *)CFDictionaryGetValue(Property, @"ANQP_OPERATOR_NAMES_LIST");
  if (!Value) {
    return 0;
  }
  CFArrayRef v3 = Value;
  if (CFArrayGetCount(Value) < 1) {
    return 0;
  }
  CFDictionaryRef ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(v3, 0);
  if (!ValueAtIndex) {
    return 0;
  }

  return CFDictionaryGetValue(ValueAtIndex, @"ANQP_OPERATOR_NAME");
}

const void *WiFiNetworkGetGasResponse(uint64_t a1)
{
  return WiFiNetworkGetProperty(a1, @"HS20GasResponse");
}

const void *WiFiNetworkGetHS20DomainName(uint64_t a1)
{
  CFDictionaryRef Property = (const __CFDictionary *)WiFiNetworkGetProperty(a1, @"HS20GasResponse");
  if (Property)
  {
    CFArrayRef Value = (const __CFArray *)CFDictionaryGetValue(Property, @"ANQP_DOMAIN_NAME_LIST");
    if (Value && (CFArrayRef v4 = Value, CFArrayGetCount(Value) >= 1))
    {
      return CFArrayGetValueAtIndex(v4, 0);
    }
    else
    {
      return 0;
    }
  }
  else
  {
    return WiFiNetworkGetProperty(a1, @"DomainName");
  }
}

void WiFiNetworkSetGasResponse(uint64_t a1, const void *a2)
{
  if (WiFiNetworkGetProperty(a1, @"HS20GasResponse")) {
    WiFiNetworkSetProperty(a1, @"HS20GasResponse", 0);
  }

  WiFiNetworkSetProperty(a1, @"HS20GasResponse", a2);
}

uint64_t WiFiNetworkIsScannedNetworkMatchingHS20Account(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = 0;
  if (a1 && a2)
  {
    CFDictionaryRef Property = (const __CFDictionary *)WiFiNetworkGetProperty(a1, @"HS20GasResponse");
    if (Property)
    {
      CFDictionaryRef v5 = Property;
      CFArrayRef v6 = WiFiNetworkGetProperty(a2, @"DomainName");
      CFArrayRef Value = (const __CFArray *)CFDictionaryGetValue(v5, @"ANQP_DOMAIN_NAME_LIST");
      if (Value && (CFArrayRef v8 = Value, CFArrayGetCount(Value) >= 1))
      {
        CFIndex v9 = 0;
        while (1)
        {
          CFDictionaryRef ValueAtIndex = CFArrayGetValueAtIndex(v8, v9);
          if (ValueAtIndex)
          {
            if (v6 && CFEqual(ValueAtIndex, v6)) {
              break;
            }
          }
          if (++v9 >= CFArrayGetCount(v8)) {
            goto LABEL_11;
          }
        }
        char v11 = 0;
        uint64_t v2 = 1;
      }
      else
      {
LABEL_11:
        uint64_t v2 = 0;
        char v11 = 1;
      }
      CFArrayRef v12 = WiFiNetworkGetProperty(a2, @"SPRoaming");
      CFArrayRef v13 = (const __CFArray *)WiFiNetworkGetProperty(a2, @"MCCandMNC");
      if (v13)
      {
        CFArrayRef v14 = v13;
        CFIndex Count = CFArrayGetCount(v13);
        char v16 = v11 ^ 1;
        if (Count < 1) {
          char v16 = 1;
        }
        if ((v16 & 1) == 0)
        {
          CFIndex v17 = 0;
          while (1)
          {
            CFArrayRef v18 = CFArrayGetValueAtIndex(v14, v17);
            if (v18)
            {
              CFArrayRef v19 = v18;
              CFArrayRef v20 = (const __CFArray *)CFDictionaryGetValue(v5, @"ANQP_CELL_NETWORK_INFO");
              if (v20)
              {
                CFArrayRef v21 = v20;
                v44.length = CFArrayGetCount(v21);
                v44.location = 0;
                if (CFArrayContainsValue(v21, v44, v19)) {
                  break;
                }
              }
            }
            if (++v17 >= CFArrayGetCount(v14))
            {
              uint64_t v2 = 0;
              goto LABEL_24;
            }
          }
          uint64_t v2 = 1;
        }
      }
LABEL_24:
      CFArrayRef v22 = (const __CFArray *)WiFiNetworkGetProperty(a2, @"NaiRealmName");
      if (v22)
      {
        CFArrayRef v23 = v22;
        CFIndex v24 = CFArrayGetCount(v22);
        if (!v2 && v24 >= 1)
        {
          CFIndex v25 = 0;
          while (1)
          {
            uint64_t v2 = (uint64_t)CFArrayGetValueAtIndex(v23, v25);
            if (v2)
            {
              CFArrayRef v26 = (const __CFArray *)CFDictionaryGetValue(v5, @"ANQP_NAI_REALM_LIST");
              if (v26)
              {
                CFArrayRef v27 = v26;
                if (CFArrayGetCount(v27) >= 1)
                {
                  CFIndex v28 = 0;
                  while (1)
                  {
                    CFDictionaryRef v29 = (const __CFDictionary *)CFArrayGetValueAtIndex(v27, v28);
                    if (v29)
                    {
                      CFNumberRef v30 = CFDictionaryGetValue(v29, @"ANQP_NAI_REALM_NAME");
                      if (v30)
                      {
                        if (CFEqual(v30, (CFTypeRef)v2)) {
                          break;
                        }
                      }
                    }
                    if (++v28 >= CFArrayGetCount(v27)) {
                      goto LABEL_36;
                    }
                  }
                  int v31 = 0;
                  uint64_t v2 = 1;
                  goto LABEL_38;
                }
              }
LABEL_36:
              uint64_t v2 = 0;
            }
            int v31 = 1;
LABEL_38:
            CFIndex v32 = CFArrayGetCount(v23);
            if (v31)
            {
              if (++v25 < v32) {
                continue;
              }
            }
            break;
          }
        }
      }
      CFArrayRef v33 = (const __CFArray *)WiFiNetworkGetProperty(a2, @"RoamingConsortiumOIs");
      if (v33)
      {
        CFArrayRef v34 = v33;
        CFIndex v35 = CFArrayGetCount(v33);
        if (!v2 && v35 >= 1)
        {
          CFIndex v36 = 0;
          while (1)
          {
            uint64_t v2 = (uint64_t)CFArrayGetValueAtIndex(v34, v36);
            if (v2)
            {
              CFArrayRef v37 = (const __CFArray *)CFDictionaryGetValue(v5, @"ANQP_ROAMING_CONSORTIUM_OI_LIST");
              if (v37)
              {
                CFArrayRef v38 = v37;
                if (CFArrayGetCount(v38) >= 1)
                {
                  CFIndex v39 = 0;
                  while (1)
                  {
                    CFStringRef v40 = (const __CFString *)CFArrayGetValueAtIndex(v38, v39);
                    if (v40)
                    {
                      if (CFStringCompare(v40, (CFStringRef)v2, 1uLL) == kCFCompareEqualTo) {
                        break;
                      }
                    }
                    if (++v39 >= CFArrayGetCount(v38)) {
                      goto LABEL_53;
                    }
                  }
                  int v41 = 0;
                  uint64_t v2 = 1;
                  goto LABEL_55;
                }
              }
LABEL_53:
              uint64_t v2 = 0;
            }
            int v41 = 1;
LABEL_55:
            CFIndex v42 = CFArrayGetCount(v34);
            if (v41)
            {
              if (++v36 < v42) {
                continue;
              }
            }
            return v2;
          }
        }
      }
    }
    else
    {
      return 0;
    }
  }
  return v2;
}

CFDictionaryRef *WiFiNetworkIsFullyLoaded(CFDictionaryRef *result)
{
  __int16 valuePtr = 0;
  __int16 v3 = 0;
  if (result)
  {
    uint64_t v1 = result;
    CFDictionaryRef result = (CFDictionaryRef *)CFDictionaryGetValue(result[2], @"EXT_CAPS");
    if (result)
    {
      CFDictionaryRef result = (CFDictionaryRef *)CFDictionaryGetValue((CFDictionaryRef)result, @"BSS_TRANS_MGMT");
      if (result)
      {
        CFNumberGetValue((CFNumberRef)result, kCFNumberSInt8Type, &valuePtr);
        if ((_BYTE)valuePtr)
        {
          CFDictionaryRef result = (CFDictionaryRef *)CFDictionaryGetValue(v1[2], @"QBSS_LOAD_IE");
          if (result)
          {
            CFDictionaryRef v2 = (const __CFDictionary *)result;
            CFDictionaryRef result = (CFDictionaryRef *)CFDictionaryGetValue((CFDictionaryRef)result, @"QBSS_CHAN_UTIL");
            if (result)
            {
              CFNumberGetValue((CFNumberRef)result, kCFNumberSInt8Type, (char *)&valuePtr + 1);
              CFDictionaryRef result = (CFDictionaryRef *)CFDictionaryGetValue(v2, @"QBSS_STA_COUNT");
              if (result)
              {
                CFNumberGetValue((CFNumberRef)result, kCFNumberSInt16Type, &v3);
                return (CFDictionaryRef *)(v3 == -1);
              }
            }
          }
        }
        else
        {
          return 0;
        }
      }
    }
  }
  return result;
}

void WiFiNetworkSetPasswordModificationDate(const void *a1, const void *a2)
{
  if (a1 && a2)
  {
    CFStringRef SSID = WiFiNetworkGetSSID(a1);
    if (SSID)
    {
      WiFiNetworkSetProperty((uint64_t)a1, @"WiFiNetworkPasswordModificationDate", a2);
    }
  }
  else
  {
    CFDictionaryRef v5 = (void *)MEMORY[0x1C18A51F0]();
  }
}

const void *WiFiNetworkGetPasswordModificationDate(uint64_t a1)
{
  if (a1)
  {
    return WiFiNetworkGetProperty(a1, @"WiFiNetworkPasswordModificationDate");
  }
  else
  {
    return 0;
  }
}

CFTypeRef WiFiNetworkCopyKeychainModDate(const void *a1)
{
  if (a1)
  {
    CFStringRef AccountForNetwork = WiFiNetworkGetAccountForNetwork(a1);
    return WiFiSecurityCopyPasswordModificationDate(AccountForNetwork);
  }
  else
  {
    return 0;
  }
}

CFDictionaryRef WiFiNetworkIsFullyQualifiedCarPlayNetwork(uint64_t a1)
{
  CFDictionaryRef result = (const __CFDictionary *)CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 16), @"APPLE_DEVICE_IE");
  if (result)
  {
    CFArrayRef Value = CFDictionaryGetValue(result, @"APPLE_DEVICE_IE_FEATURE_SUPPORTS_CARPLAY");
    return (const __CFDictionary *)(Value && Value == (const void *)*MEMORY[0x1E4F1CFD0]);
  }
  return result;
}

uint64_t WiFiNetworkIsCarPlay(uint64_t a1)
{
  if (a1 && (CFDictionaryRef v2 = *(const __CFDictionary **)(a1 + 16)) != 0)
  {
    CFDictionaryRef Value = (const __CFDictionary *)CFDictionaryGetValue(v2, @"APPLE_DEVICE_IE");
    CFArrayRef v4 = (CFTypeRef *)MEMORY[0x1E4F1CFD0];
    if (Value)
    {
      CFTypeRef v5 = CFDictionaryGetValue(Value, @"APPLE_DEVICE_IE_FEATURE_SUPPORTS_CARPLAY");
      if (v5) {
        BOOL v6 = v5 == *v4;
      }
      else {
        BOOL v6 = 0;
      }
      uint64_t v7 = v6;
    }
    else
    {
      uint64_t v7 = 0;
    }
    CFArrayRef v8 = CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 16), @"CARPLAY_NETWORK");
    if (v8)
    {
      if (CFEqual(v8, *v4)) {
        return 1;
      }
      else {
        return v7;
      }
    }
  }
  else
  {
    return 0;
  }
  return v7;
}

BOOL WiFiNetworkIs24GHzNetwork(uint64_t a1)
{
  CFNumberRef Property = (const __CFNumber *)WiFiNetworkGetProperty(a1, @"CHANNEL");
  int v7 = -1431655766;
  CFNumberRef v3 = (const __CFNumber *)WiFiNetworkGetProperty(a1, @"CHANNEL_FLAGS");
  if (v3)
  {
    unsigned int valuePtr = 0;
    CFNumberGetValue(v3, kCFNumberIntType, &valuePtr);
    return (valuePtr >> 3) & 1;
  }
  else
  {
    uint64_t Value = CFNumberGetValue(Property, kCFNumberSInt32Type, &v7);
    return (v7 - 1) < 0xE;
  }
}

uint64_t WiFiNetworkGetType(uint64_t a1)
{
  CFNumberRef Property = WiFiNetworkGetProperty(a1, @"CARPLAY_NETWORK");
  if (Property && CFEqual(Property, (CFTypeRef)*MEMORY[0x1E4F1CFD0]))
  {
    if (WiFiNetworkGetProperty(a1, @"lastJoined")
      || a1 && CFDictionaryContainsKey(*(CFDictionaryRef *)(a1 + 16), @"PayloadUUID"))
    {
      unsigned int v3 = 2;
    }
    else
    {
      unsigned int v3 = 1;
    }
  }
  else
  {
    unsigned int v3 = 0;
  }
  if (WiFiNetworkIsHotspot20(a1)) {
    return 3;
  }
  else {
    return v3;
  }
}

CFIndex WiFiNetworkDumpRecords(CFIndex result)
{
  if (result)
  {
    CFArrayRef v1 = (const __CFArray *)result;
    CFDictionaryRef result = CFArrayGetCount((CFArrayRef)result);
    if (result >= 1)
    {
      for (CFIndex i = 0; i < result; ++i)
      {
        if (CFArrayGetValueAtIndex(v1, i)) {
        CFDictionaryRef result = CFArrayGetCount(v1);
        }
      }
    }
  }
  return result;
}

void WiFiNetworkRemoveCarPlaySettings(uint64_t a1)
{
  WiFiNetworkSetProperty(a1, @"CARPLAY_NETWORK", 0);

  WiFiNetworkSetProperty(a1, @"CARPLAY_UUID", 0);
}

const void *WiFiNetworkCopyLeakyStatus(uint64_t a1, const __CFString *a2)
{
  if (!a1) {
    goto LABEL_18;
  }
  if (!a2) {
    goto LABEL_18;
  }
  CFStringRef Property = (const __CFString *)WiFiNetworkGetProperty(a1, @"BSSID");
  if (!Property) {
    goto LABEL_18;
  }
  if (CFEqual(a2, Property))
  {
    CFDictionaryRef result = WiFiNetworkGetProperty(a1, @"LEAKY_AP_LEARNED_DATA");
    if (!result) {
      return result;
    }
    goto LABEL_14;
  }
  CFArrayRef v5 = (const __CFArray *)WiFiNetworkGetProperty(a1, @"networkKnownBSSListKey");
  if (!v5 || (CFArrayRef v6 = v5, (Count = CFArrayGetCount(v5)) == 0))
  {
LABEL_18:
    return 0;
  }
  CFIndex v8 = Count;
  if (Count < 1) {
    return 0;
  }
  CFIndex v9 = 0;
  while (1)
  {
    CFDictionaryRef ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(v6, v9);
    if (ValueAtIndex)
    {
      CFDictionaryRef v11 = ValueAtIndex;
      CFStringRef Value = (const __CFString *)CFDictionaryGetValue(ValueAtIndex, @"BSSID");
      if (CFEqual(a2, Value)) {
        break;
      }
    }
    if (v8 == ++v9) {
      return 0;
    }
  }
  CFDictionaryRef result = CFDictionaryGetValue(v11, @"LEAKY_AP_LEARNED_DATA");
  if (result)
  {
LABEL_14:
    Apple80211CopyLeakyAPStatus();
    return 0;
  }
  return result;
}

BOOL WiFiNetworkIsAPLeaky(uint64_t a1, const __CFString *a2)
{
  CFNumberRef v2 = (const __CFNumber *)WiFiNetworkCopyLeakyStatus(a1, a2);
  if (v2)
  {
    CFNumberRef v3 = v2;
    char valuePtr = -86;
    CFNumberGetValue(v2, kCFNumberSInt8Type, &valuePtr);
    BOOL v4 = valuePtr == 2;
    CFRelease(v3);
  }
  else
  {
    return 0;
  }
  return v4;
}

CFDictionaryRef WiFiNetworkIsChargeablePublicNetwork(uint64_t a1)
{
  CFDictionaryRef result = (const __CFDictionary *)WiFiNetworkGetProperty(a1, @"11U_INTERWORKING_IE");
  if (result)
  {
    CFDictionaryRef result = (const __CFDictionary *)CFDictionaryGetValue(result, @"INTERWORKING_ACCESS_NETWORK_TYPE");
    if (result)
    {
      char valuePtr = 0;
      CFNumberGetValue(result, kCFNumberSInt8Type, &valuePtr);
      return (const __CFDictionary *)(valuePtr == 2);
    }
  }
  return result;
}

BOOL WiFiNetworkIsMetered(uint64_t a1)
{
  if (WiFiNetworkIsHotspot20(a1)
    || MEMORY[0x1E4F57E00]
    && CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 16), (const void *)*MEMORY[0x1E4F57E38]) == (const void *)*MEMORY[0x1E4F1CFD0])
  {
    unsigned int v2 = WiFiNetworkIsChargeablePublicNetwork(a1);
  }
  else
  {
    unsigned int v2 = 0;
  }
  return WiFiNetworkIsApplePersonalHotspot(a1) || WiFiNetworkIsCarPlay(a1) || v2;
}

uint64_t WiFiNetworkIsInSaveDataMode(uint64_t a1)
{
  int valuePtr = 0;
  CFNumberRef Property = (const __CFNumber *)WiFiNetworkGetProperty(a1, @"SaveDataMode");
  if (Property)
  {
    CFNumberGetValue(Property, kCFNumberSInt32Type, &valuePtr);
    BOOL v3 = valuePtr == 1;
    if (valuePtr) {
      return v3;
    }
  }
  else
  {
    BOOL v3 = 0;
  }
  if (WiFiNetworkIsApplePersonalHotspot(a1)
    || WiFiNetworkFoundNanIe(a1)
    || WiFiNetworkIsCarPlay(a1))
  {
    return 1;
  }
  return v3;
}

CFNumberRef WiFiNetworkGetSaveDataMode(uint64_t a1)
{
  unsigned int valuePtr = 0;
  CFNumberRef result = (const __CFNumber *)WiFiNetworkGetProperty(a1, @"SaveDataMode");
  if (result)
  {
    CFNumberGetValue(result, kCFNumberSInt32Type, &valuePtr);
    return (const __CFNumber *)valuePtr;
  }
  return result;
}

double WiFiNetworkGetNetworkQualityResponsiveness(uint64_t a1)
{
  double valuePtr = 0.0;
  CFNumberRef Property = (const __CFNumber *)WiFiNetworkGetProperty(a1, @"NetworkQualityResponsiveness");
  if (Property) {
    CFNumberRef Property = (const __CFNumber *)CFNumberGetValue(Property, kCFNumberDoubleType, &valuePtr);
  }
  return valuePtr;
}

const void *WiFiNetworkGetNetworkQualityDate(uint64_t a1)
{
  CFNumberRef Property = WiFiNetworkGetProperty(a1, @"NetworkQualityDate");
  return Property;
}

void WiFiNetworkSetNetworkQuality(uint64_t a1, const void *a2, double a3)
{
  double valuePtr = a3;
  CFNumberRef v5 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], kCFNumberDoubleType, &valuePtr);
  if (v5)
  {
    CFNumberRef v6 = v5;
    WiFiNetworkSetProperty(a1, @"NetworkQualityResponsiveness", v5);
    WiFiNetworkSetProperty(a1, @"NetworkQualityDate", a2);
    CFRelease(v6);
  }
  else
  {
  }
}

void WiFiNetworkDisableAutoJoinUntilFirstUserJoin(uint64_t a1, int a2)
{
  if (a1)
  {
    BOOL v4 = (const void **)MEMORY[0x1E4F1CFD0];
    if (!a2) {
      BOOL v4 = (const void **)MEMORY[0x1E4F1CFC8];
    }
    CFNumberRef v5 = *v4;
    WiFiNetworkSetProperty(a1, @"DisableWiFiAutoJoinUntilFirstUserJoin", v5);
  }
}

uint64_t WiFiNetworkIsAutoJoinDisabledUntilFirstUserJoin(uint64_t a1)
{
  if (!a1) {
    goto LABEL_7;
  }
  CFBooleanRef Property = (const __CFBoolean *)WiFiNetworkGetProperty(a1, @"DisableWiFiAutoJoinUntilFirstUserJoin");
  if (!Property) {
    return 0;
  }
  CFBooleanRef v2 = Property;
  CFTypeID v3 = CFGetTypeID(Property);
  if (v3 != CFBooleanGetTypeID())
  {
LABEL_7:
    return 0;
  }

  return CFBooleanGetValue(v2);
}

CFBooleanRef WiFiNetworkIsInfrequentlyJoinedPublicNetwork(uint64_t a1)
{
  if (!a1) {
    goto LABEL_8;
  }
  if (__WiFiNetworkGetAuthFlags(*(const __CFDictionary **)(a1 + 16))) {
    return 0;
  }
  CFBooleanRef result = (const __CFBoolean *)WiFiNetworkGetProperty(a1, @"WiFiNetworkAttributeIsPublic");
  if (!result) {
    return result;
  }
  CFBooleanRef v3 = result;
  CFTypeID v4 = CFGetTypeID(result);
  if (v4 != CFBooleanGetTypeID())
  {
LABEL_8:
    return 0;
  }
  CFBooleanRef result = (const __CFBoolean *)CFBooleanGetValue(v3);
  if (result) {
    return (const __CFBoolean *)(WiFiNetworkGetTimeIntervalSinceLastAssociation(a1) > 1209600.0);
  }
  return result;
}

BOOL WiFiNetworkIsBypassCaptiveEnabled(uint64_t a1)
{
  CFBooleanRef Property = WiFiNetworkGetProperty(a1, @"CaptiveBypass");
  return Property && Property == (const void *)*MEMORY[0x1E4F1CFD0];
}

void WiFiNetworkAddBundleIdentifier(uint64_t a1, const void *a2)
{
  if (a1)
  {
    WiFiNetworkSetProperty(a1, @"BundleIdentifier", a2);
  }
  else
  {
    CFBooleanRef v2 = (void *)MEMORY[0x1C18A51F0]();
  }
}

const void *WiFiNetworkGetBundleIdentifier(uint64_t a1)
{
  if (a1)
  {
    return WiFiNetworkGetProperty(a1, @"BundleIdentifier");
  }
  else
  {
    return 0;
  }
}

void WiFiNetworkAddOriginator(uint64_t a1, unsigned int a2)
{
  if (a1)
  {
    WiFiNetworkSetIntProperty(a1, @"NetworkOriginator", a2);
  }
  else
  {
    CFBooleanRef v2 = (void *)MEMORY[0x1C18A51F0]();
  }
}

void WiFiNetworkSetOriginatorName(uint64_t a1, const void *a2)
{
  if (a1)
  {
    WiFiNetworkSetProperty(a1, @"NetworkOriginatorName", a2);
  }
  else
  {
    CFBooleanRef v2 = (void *)MEMORY[0x1C18A51F0]();
  }
}

CFNumberRef WiFiNetworkGetOriginator(uint64_t a1)
{
  if (a1)
  {
    CFNumberRef Property = (const __CFNumber *)WiFiNetworkGetProperty(a1, @"NetworkOriginator");
    return _CFTypeGetIntValue(Property);
  }
  else
  {
    return 0;
  }
}

uint64_t WiFiNetworkGetUserRole(uint64_t a1)
{
  uint64_t v1 = 1;
  unsigned int valuePtr = 1;
  CFNumberRef Property = (const __CFNumber *)WiFiNetworkGetProperty(a1, @"UserRole");
  if (Property)
  {
    CFNumberGetValue(Property, kCFNumberIntType, &valuePtr);
    return valuePtr;
  }
  return v1;
}

uint64_t WiFiNetworkGetFirstIndexMatchingSSIDNetwork(const __CFArray *a1, uint64_t a2)
{
  CFIndex v2 = -1;
  if (a1 && a2 && CFArrayGetCount(a1) >= 1)
  {
    CFIndex v2 = 0;
    while (1)
    {
      CFDictionaryRef ValueAtIndex = (CFTypeRef *)CFArrayGetValueAtIndex(a1, v2);
      if (ValueAtIndex)
      {
        CFNumberRef v6 = ValueAtIndex;
        CFTypeID v7 = CFGetTypeID(ValueAtIndex);
        uint64_t v8 = __kWiFiNetworkTypeID;
        if (!__kWiFiNetworkTypeID)
        {
          pthread_once(&__wifiNetworkTypeInit, (void (*)(void))__WiFiNetworkRegister);
          uint64_t v8 = __kWiFiNetworkTypeID;
        }
        if (v7 == v8
          && __WiFiCompareDictionaryValues(v6[2], *(const void **)(a2 + 16), @"SSID_STR"))
        {
          break;
        }
      }
      if (++v2 >= CFArrayGetCount(a1)) {
        return -1;
      }
    }
  }
  return v2;
}

BOOL WiFiNetworkIsCarrierBundleBased(uint64_t a1)
{
  if (a1)
  {
    CFNumberRef Property = (const __CFNumber *)WiFiNetworkGetProperty(a1, @"NetworkOriginator");
    return _CFTypeGetIntValue(Property) == 2;
  }
  else
  {
    return 0;
  }
}

const void *WiFiNetworkGetDisabledUntilDate(uint64_t a1)
{
  if (a1)
  {
    return WiFiNetworkGetProperty(a1, @"WiFiNetworkDisabledUntilDate");
  }
  else
  {
    return 0;
  }
}

CFArrayRef WiFiNetworkCanExposeIMSI(uint64_t a1)
{
  if (!a1) {
    goto LABEL_10;
  }
  if (__WiFiNetworkIsEAPWithType(a1, 18)
    || __WiFiNetworkIsEAPWithType(a1, 23)
    || (CFArrayRef result = __WiFiNetworkIsEAPWithType(a1, 50), result))
  {
    CFDictionaryRef Property = (const __CFDictionary *)WiFiNetworkGetProperty(a1, @"EnterpriseProfile");
    if (Property)
    {
      CFStringRef Value = CFDictionaryGetValue(Property, @"EAPClientConfiguration");
      CFTypeID v5 = CFGetTypeID(Value);
      if (v5 == CFDictionaryGetTypeID())
      {
        if (CFDictionaryContainsKey((CFDictionaryRef)Value, @"EAPSIMAKAEncryptedIdentityEnabled"))
        {
          CFNumberRef v6 = (const __CFNumber *)CFDictionaryGetValue((CFDictionaryRef)Value, @"EAPSIMAKAEncryptedIdentityEnabled");
          return (const __CFArray *)(_CFTypeGetIntValue(v6) == 0);
        }
        else
        {
          return (const __CFArray *)1;
        }
      }
    }
LABEL_10:
    return 0;
  }
  return result;
}

void WiFiNetworkRemoveInternalProperties(uint64_t a1)
{
  if (a1)
  {
    if (CFDictionaryContainsKey(*(CFDictionaryRef *)(a1 + 16), @"enabled")) {
      CFDictionaryRemoveValue(*(CFMutableDictionaryRef *)(a1 + 16), @"enabled");
    }
    if (CFDictionaryContainsKey(*(CFDictionaryRef *)(a1 + 16), @"lastAutoJoined")) {
      CFDictionaryRemoveValue(*(CFMutableDictionaryRef *)(a1 + 16), @"lastAutoJoined");
    }
    if (CFDictionaryContainsKey(*(CFDictionaryRef *)(a1 + 16), @"lastJoined")) {
      CFDictionaryRemoveValue(*(CFMutableDictionaryRef *)(a1 + 16), @"lastJoined");
    }
    if (CFDictionaryContainsKey(*(CFDictionaryRef *)(a1 + 16), @"prevJoined")) {
      CFDictionaryRemoveValue(*(CFMutableDictionaryRef *)(a1 + 16), @"prevJoined");
    }
    if (CFDictionaryContainsKey(*(CFDictionaryRef *)(a1 + 16), @"lastRoamed"))
    {
      CFIndex v2 = *(__CFDictionary **)(a1 + 16);
      CFDictionaryRemoveValue(v2, @"lastRoamed");
    }
  }
  else
  {
    CFBooleanRef v3 = (void *)MEMORY[0x1C18A51F0]();
  }
}

CFDictionaryRef *WiFiNetworkInterworkingIsOutdoorNetwork(CFDictionaryRef *result)
{
  char valuePtr = -1;
  if (result)
  {
    CFArrayRef result = (CFDictionaryRef *)CFDictionaryGetValue(result[2], @"11U_INTERWORKING_IE");
    if (result)
    {
      CFArrayRef result = (CFDictionaryRef *)CFDictionaryGetValue((CFDictionaryRef)result, @"INTERWORKING_ACCESS_VENTURE_GRP");
      if (result)
      {
        CFNumberGetValue((CFNumberRef)result, kCFNumberSInt8Type, &valuePtr);
        return (CFDictionaryRef *)(valuePtr == 11);
      }
    }
  }
  return result;
}

CFDictionaryRef *WiFiNetworkInterworkingIsVehicularNetwork(CFDictionaryRef *result)
{
  char valuePtr = -1;
  if (result)
  {
    CFArrayRef result = (CFDictionaryRef *)CFDictionaryGetValue(result[2], @"11U_INTERWORKING_IE");
    if (result)
    {
      CFArrayRef result = (CFDictionaryRef *)CFDictionaryGetValue((CFDictionaryRef)result, @"INTERWORKING_ACCESS_VENTURE_GRP");
      if (result)
      {
        CFNumberGetValue((CFNumberRef)result, kCFNumberSInt8Type, &valuePtr);
        return (CFDictionaryRef *)(valuePtr == 10);
      }
    }
  }
  return result;
}

CFDictionaryRef WiFiNetworkGetAdvertisedNetworkType(uint64_t a1)
{
  char valuePtr = -1;
  CFDictionaryRef result = (const __CFDictionary *)CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 16), @"11U_INTERWORKING_IE");
  if (result)
  {
    CFDictionaryRef result = (const __CFDictionary *)CFDictionaryGetValue(result, @"INTERWORKING_ACCESS_NETWORK_TYPE");
    if (result)
    {
      uint64_t Value = CFNumberGetValue(result, kCFNumberSInt8Type, &valuePtr);
      char v3 = valuePtr + 1;
      if (valuePtr + 1) < 0x13u && ((0x6007Fu >> v3))
      {
        return (const __CFDictionary *)dword_1BF219EC4[v3];
      }
      else
      {
        return 0;
      }
    }
  }
  return result;
}

uint64_t WiFiNetworkArchiveToPath(uint64_t a1, void *a2)
{
  uint64_t v9 = 0;
  uint64_t v4 = [a2 stringByDeletingLastPathComponent];
  if ((objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28CB8], "defaultManager"), "fileExistsAtPath:", v4) & 1) == 0
    && !objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28CB8], "defaultManager"), "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v4, 0, 0, &v9))
  {
    return 0;
  }
  CFDictionaryRef Copy = CFDictionaryCreateCopy((CFAllocatorRef)*MEMORY[0x1E4F1CF80], *(CFDictionaryRef *)(a1 + 16));
  uint64_t v6 = [MEMORY[0x1E4F28F98] dataWithPropertyList:Copy format:200 options:0 error:0];
  if (v6
    && (objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28CB8], "defaultManager"), "createFileAtPath:contents:attributes:", a2, v6, 0) & 1) != 0)
  {
    uint64_t v7 = 1;
    if (!Copy) {
      return v7;
    }
    goto LABEL_8;
  }
  uint64_t v7 = 0;
  if (Copy) {
LABEL_8:
  }
    CFRelease(Copy);
  return v7;
}

_WORD *WiFiNetworkCreateFromPath(uint64_t a1)
{
  if (!a1
    || (uint64_t v1 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28CB8], "defaultManager"), "contentsAtPath:", a1)) == 0
    || (CFDictionaryRef result = WiFiNetworkCreate(0, (CFTypeRef)[MEMORY[0x1E4F28F98] propertyListWithData:v1 options:0 format:0 error:0])) == 0)
  {
    return 0;
  }
  return result;
}

uint64_t WiFiNetworkSetUsageRank(uint64_t result, __int16 a2)
{
  *(_WORD *)(result + 24) = a2;
  return result;
}

uint64_t WiFiNetworkGetUsageRank(uint64_t a1)
{
  return *(unsigned __int16 *)(a1 + 24);
}

void WiFiNetworkSetNetworkOfInterestWorkType(uint64_t a1, int a2)
{
  int valuePtr = a2;
  if (a1)
  {
    if ((a2 - 1) > 1)
    {
      int valuePtr = 0;
      CFNumberRef v3 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], kCFNumberIntType, &valuePtr);
    }
    else
    {
      CFNumberRef v3 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], kCFNumberIntType, &valuePtr);
    }
    WiFiNetworkSetProperty(a1, @"NetworkOfInterestWorkState", v3);
    if (v3) {
      CFRelease(v3);
    }
  }
}

CFNumberRef WiFiNetworkGetNetworkOfInterestWorkType(uint64_t a1)
{
  unsigned int valuePtr = 0;
  if (a1)
  {
    CFNumberRef result = (const __CFNumber *)WiFiNetworkGetProperty(a1, @"NetworkOfInterestWorkState");
    if (result)
    {
      int Value = CFNumberGetValue(result, kCFNumberSInt32Type, &valuePtr);
      if (valuePtr - 3 >= 0xFFFFFFFE || Value == 0) {
        return (const __CFNumber *)valuePtr;
      }
      else {
        return 0;
      }
    }
  }
  else
  {
    return 0;
  }
  return result;
}

void WiFiNetworkSetNetworkOfInterestHomeType(uint64_t a1, int a2)
{
  int valuePtr = a2;
  if (a1)
  {
    if ((a2 - 1) > 1)
    {
      int valuePtr = 0;
      CFNumberRef v3 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], kCFNumberIntType, &valuePtr);
    }
    else
    {
      CFNumberRef v3 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], kCFNumberIntType, &valuePtr);
    }
    WiFiNetworkSetProperty(a1, @"NetworkOfInterestHomeState", v3);
    if (v3) {
      CFRelease(v3);
    }
  }
}

void WiFiNetworkSetForcedHomeFix(const void *a1, int a2)
{
  if (a1)
  {
    uint64_t v4 = (const void **)MEMORY[0x1E4F1CFC8];
    if (a2) {
      uint64_t v4 = (const void **)MEMORY[0x1E4F1CFD0];
    }
    WiFiNetworkSetProperty((uint64_t)a1, @"NetworkForcedHomeFix", *v4);
    if (a2)
    {
      CFAllocatorRef v5 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
      CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
      CFDateRef v7 = CFDateCreate(v5, Current);
      WiFiNetworkSetLastHomeForceFixDate(a1, v7);
      if (v7)
      {
        CFRelease(v7);
      }
    }
  }
  else
  {
    uint64_t v8 = (void *)MEMORY[0x1C18A51F0]();
  }
}

void WiFiNetworkSetLastHomeForceFixDate(const void *a1, const void *a2)
{
  if (a1 && a2)
  {
    CFStringRef SSID = WiFiNetworkGetSSID(a1);
    if (SSID)
    {
      WiFiNetworkSetProperty((uint64_t)a1, @"kWiFiNetworkLastHomeForceFixDateKey", a2);
    }
  }
  else
  {
    CFAllocatorRef v5 = (void *)MEMORY[0x1C18A51F0]();
  }
}

uint64_t WiFiNetworkGetLOIType(uint64_t a1)
{
  unsigned int valuePtr = 0;
  if (!a1
    || (CFNumberRef Property = (const __CFNumber *)WiFiNetworkGetProperty(a1, @"NetworkAtLocationOfInterestType")) == 0
    || !CFNumberGetValue(Property, kCFNumberSInt32Type, &valuePtr))
  {
  }
  return valuePtr;
}

void WiFiNetworkSetLOIType(uint64_t a1, int a2)
{
  int valuePtr = a2;
  CFNumberRef v3 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], kCFNumberIntType, &valuePtr);
  if (v3)
  {
    WiFiNetworkSetProperty(a1, @"NetworkAtLocationOfInterestType", v3);
    CFRelease(v3);
  }
}

BOOL WiFiNetworkIsInternalNetwork(const void *a1)
{
  CFStringRef SSID = WiFiNetworkGetSSID(a1);
  if (__internalSSIDs) {
    BOOL v2 = SSID == 0;
  }
  else {
    BOOL v2 = 1;
  }
  return !v2 && CFSetContainsValue((CFSetRef)__internalSSIDs, SSID);
}

CFNumberRef WiFiNetworkGetShareableStatus(const __CFNumber *result)
{
  if (result)
  {
    if (*((void *)result + 2))
    {
      CFNumberRef Property = (const __CFNumber *)WiFiNetworkGetProperty((uint64_t)result, @"ShareableStatus");
      return _CFTypeGetIntValue(Property);
    }
    else
    {
      return 0;
    }
  }
  return result;
}

void WiFiNetworkSetWalletIdentifier(uint64_t a1, const void *a2)
{
  if (a1) {
    WiFiNetworkSetProperty(a1, @"WalletIdentifier", a2);
  }
}

const void *WiFiNetworkGetWalletIdentifier(const void *result)
{
  if (result) {
    return WiFiNetworkGetProperty((uint64_t)result, @"WalletIdentifier");
  }
  return result;
}

void WiFiNetworkUpdateWPARSNAuthType(uint64_t a1, uint64_t a2)
{
  uint64_t valuePtr = a2;
  CFAllocatorRef v3 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  CFTypeRef cf = CFNumberCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], kCFNumberCFIndexType, &valuePtr);
  if (!cf)
  {
    return;
  }
  CFArrayRef v4 = CFArrayCreate(v3, &cf, 1, MEMORY[0x1E4F1D510]);
  if (!v4)
  {
    goto LABEL_30;
  }
  CFArrayRef v5 = v4;
  if ((unint64_t)(valuePtr - 1) >= 2)
  {
    if (valuePtr != 8 && valuePtr != 12) {
      goto LABEL_29;
    }
    CFDictionaryRef Property = (const __CFDictionary *)WiFiNetworkGetProperty(a1, @"RSN_IE");
    if (Property)
    {
      CFDictionaryRef v7 = Property;
      CFMutableDictionaryRef MutableCopy = CFDictionaryCreateMutableCopy(v3, 0, Property);
      if (MutableCopy)
      {
        uint64_t v9 = MutableCopy;
        CFArrayRef Value = (const __CFArray *)CFDictionaryGetValue(v7, @"IE_KEY_RSN_AUTHSELS");
        if (Value && CFArrayGetCount(Value) < 2) {
          goto LABEL_27;
        }
        CFDictionaryReplaceValue(v9, @"IE_KEY_RSN_AUTHSELS", v5);
        CFDictionaryRef v11 = @"RSN_IE";
LABEL_26:
        WiFiNetworkSetProperty(a1, v11, v9);
LABEL_27:
        CFRelease(v9);
        goto LABEL_29;
      }
      goto LABEL_29;
    }
LABEL_28:
    goto LABEL_29;
  }
  CFDictionaryRef v12 = (const __CFDictionary *)WiFiNetworkGetProperty(a1, @"RSN_IE");
  if (v12)
  {
    CFMutableDictionaryRef v13 = CFDictionaryCreateMutableCopy(v3, 0, v12);
    if (v13)
    {
      CFArrayRef v14 = v13;
      CFArrayRef v15 = (const __CFArray *)CFDictionaryGetValue(v12, @"IE_KEY_RSN_AUTHSELS");
      if (!v15 || CFArrayGetCount(v15) >= 2)
      {
        CFDictionaryReplaceValue(v14, @"IE_KEY_RSN_AUTHSELS", v5);
        WiFiNetworkSetProperty(a1, @"RSN_IE", v14);
      }
      CFRelease(v14);
    }
  }
  else
  {
  }
  char v16 = WiFiNetworkGetProperty(a1, @"WPA_IE");
  if (!v16) {
    goto LABEL_28;
  }
  CFIndex v17 = v16;
  CFTypeID TypeID = CFDictionaryGetTypeID();
  if (!_CFValidateType(TypeID, v17)) {
    goto LABEL_28;
  }
  CFMutableDictionaryRef v19 = CFDictionaryCreateMutableCopy(v3, 0, (CFDictionaryRef)v17);
  if (v19)
  {
    uint64_t v9 = v19;
    CFArrayRef v20 = (const __CFArray *)CFDictionaryGetValue(v12, @"IE_KEY_WPA_AUTHSELS");
    if (v20 && CFArrayGetCount(v20) < 2) {
      goto LABEL_27;
    }
    CFDictionaryReplaceValue(v9, @"IE_KEY_WPA_AUTHSELS", v5);
    CFDictionaryRef v11 = @"WPA_IE";
    goto LABEL_26;
  }
LABEL_29:
  CFRelease(v5);
LABEL_30:
  if (cf) {
    CFRelease(cf);
  }
}

uint64_t WiFiNetworkGetHarvestSSIDStatus(uint64_t a1)
{
  if (a1)
  {
    CFNumberRef Property = (const __CFNumber *)WiFiNetworkGetProperty(a1, @"kWiFiNetworkSSIDHarvestStatusKey");
    uint64_t result = (uint64_t)_CFTypeGetIntValue(Property);
    if (!result)
    {
      CFArrayRef v4 = WiFiNetworkGetProperty(a1, @"WiFiNetworkAttributeHighPopularity");
      if (v4 == (const void *)*MEMORY[0x1E4F1CFD0])
      {
        if (WiFiNetworkGetProperty(a1, @"WiFiNetworkAttributeIsPublic") == v4) {
          return 3;
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
  }
  else
  {
    return 1;
  }
  return result;
}

void WiFiNetworkRemoveAutoJoinProperties(uint64_t a1)
{
  if (a1)
  {
    if (CFDictionaryContainsKey(*(CFDictionaryRef *)(a1 + 16), @"enabled")) {
      CFDictionaryRemoveValue(*(CFMutableDictionaryRef *)(a1 + 16), @"enabled");
    }
    if (CFDictionaryContainsKey(*(CFDictionaryRef *)(a1 + 16), @"WiFiNetworkDisabledUntilDate")) {
      CFDictionaryRemoveValue(*(CFMutableDictionaryRef *)(a1 + 16), @"WiFiNetworkDisabledUntilDate");
    }
    if (CFDictionaryContainsKey(*(CFDictionaryRef *)(a1 + 16), @"networkDisabledClientName")) {
      CFDictionaryRemoveValue(*(CFMutableDictionaryRef *)(a1 + 16), @"networkDisabledClientName");
    }
    if (CFDictionaryContainsKey(*(CFDictionaryRef *)(a1 + 16), @"networkDisabledReason")) {
      CFDictionaryRemoveValue(*(CFMutableDictionaryRef *)(a1 + 16), @"networkDisabledReason");
    }
    if (CFDictionaryContainsKey(*(CFDictionaryRef *)(a1 + 16), @"networkDisabledTimestamp"))
    {
      BOOL v2 = *(__CFDictionary **)(a1 + 16);
      CFDictionaryRemoveValue(v2, @"networkDisabledTimestamp");
    }
  }
  else
  {
    CFAllocatorRef v3 = (void *)MEMORY[0x1C18A51F0]();
  }
}

void *WiFiNetworkCreateCoreWiFiNetworkProfile(CFDictionaryRef *a1)
{
  uint64_t v119 = *MEMORY[0x1E4F143B8];
  context = (void *)MEMORY[0x1C18A51F0]();
  if (!a1 || !getCWFNetworkProfileClass())
  {
    v87 = 0;
    goto LABEL_141;
  }
  id v2 = objc_alloc_init((Class)getCWFNetworkProfileClass());
  objc_msgSend(v2, "setSSID:", WiFiNetworkGetSSIDData(a1), context);
  WiFiNetworkIsHotspot20((BOOL)a1);
  [v2 setSupportedSecurityTypes:0];
  BOOL IsWAPI = WiFiNetworkIsWAPI((BOOL)a1);
  CFArrayRef v4 = (const void **)MEMORY[0x1E4F1CFD0];
  v87 = v2;
  if (!IsWAPI)
  {
    if (WiFiNetworkIsOWETransition((uint64_t)a1))
    {
      uint64_t v8 = v2;
      uint64_t v9 = 768;
    }
    else
    {
      if (!__WiFiNetworkIsOWEOnly(a1[2]))
      {
        if (CFDictionaryGetValue(a1[2], @"WEP") == *v4)
        {
          objc_msgSend(v2, "setSupportedSecurityTypes:", objc_msgSend(v2, "supportedSecurityTypes") | 1);
          if (WiFiNetworkIsEAP((uint64_t)a1))
          {
            CFArrayRef v23 = v2;
            uint64_t v24 = 5;
          }
          else
          {
            CFNumberRef Property = (void *)WiFiNetworkGetProperty((uint64_t)a1, @"WEP_AUTH_Flags");
            if (!Property) {
              goto LABEL_14;
            }
            v82 = Property;
            char v83 = [Property intValue];
            [v82 intValue];
            char v84 = [v82 intValue];
            if (v83)
            {
              if ((v84 & 4) == 0) {
                goto LABEL_14;
              }
              CFArrayRef v23 = v87;
              uint64_t v24 = 3;
            }
            else
            {
              if ((v84 & 4) == 0) {
                goto LABEL_14;
              }
              CFArrayRef v23 = v87;
              uint64_t v24 = 4;
            }
          }
          [v23 setWEPSubtype:v24];
        }
        goto LABEL_14;
      }
      uint64_t v9 = [v2 supportedSecurityTypes] | 0x100;
      uint64_t v8 = v2;
    }
    [v8 setSupportedSecurityTypes:v9];
    goto LABEL_14;
  }
  objc_msgSend(v2, "setSupportedSecurityTypes:", objc_msgSend(v2, "supportedSecurityTypes") | 2);
  int v5 = objc_msgSend((id)WiFiNetworkGetProperty((uint64_t)a1, @"WAPI"), "intValue");
  if ((~v5 & 0xB) == 0)
  {
    uint64_t v6 = v2;
    uint64_t v7 = 2;
LABEL_10:
    [v6 setWAPISubtype:v7];
    goto LABEL_14;
  }
  if ((~v5 & 7) == 0)
  {
    uint64_t v6 = v2;
    uint64_t v7 = 1;
    goto LABEL_10;
  }
LABEL_14:
  BOOL v10 = (void *)WiFiNetworkGetProperty((uint64_t)a1, @"RSN_IE");
  if (v10)
  {
    CFDictionaryRef v11 = (void *)[v10 objectForKey:@"IE_KEY_RSN_AUTHSELS"];
    if (([v11 containsObject:&unk_1F1A7D0E0] & 1) != 0
      || [v11 containsObject:&unk_1F1A7D0F8])
    {
      objc_msgSend(v87, "setSupportedSecurityTypes:", objc_msgSend(v87, "supportedSecurityTypes") | 0x80);
    }
    if (([v11 containsObject:&unk_1F1A7D110] & 1) != 0
      || ([v11 containsObject:&unk_1F1A7D128] & 1) != 0
      || ([v11 containsObject:&unk_1F1A7D140] & 1) != 0
      || [v11 containsObject:&unk_1F1A7D158])
    {
      objc_msgSend(v87, "setSupportedSecurityTypes:", objc_msgSend(v87, "supportedSecurityTypes") | 0x20);
    }
    if (([v11 containsObject:&unk_1F1A7D170] & 1) != 0
      || ([v11 containsObject:&unk_1F1A7D188] & 1) != 0
      || ([v11 containsObject:&unk_1F1A7D1A0] & 1) != 0
      || [v11 containsObject:&unk_1F1A7D1B8])
    {
      objc_msgSend(v87, "setSupportedSecurityTypes:", objc_msgSend(v87, "supportedSecurityTypes") | 0x40);
      if (__WiFiNetworkSupportsWPA2(a1[2])) {
        objc_msgSend(v87, "setSupportedSecurityTypes:", objc_msgSend(v87, "supportedSecurityTypes") | 0x10);
      }
    }
    if (([v11 containsObject:&unk_1F1A7D1D0] & 1) != 0
      || ([v11 containsObject:&unk_1F1A7D1E8] & 1) != 0
      || [v11 containsObject:&unk_1F1A7D200])
    {
      objc_msgSend(v87, "setSupportedSecurityTypes:", objc_msgSend(v87, "supportedSecurityTypes") | 0x10);
    }
  }
  CFDictionaryRef v12 = (void *)WiFiNetworkGetProperty((uint64_t)a1, @"WPA_IE");
  if (v12)
  {
    CFMutableDictionaryRef v13 = (void *)[v12 objectForKey:@"IE_KEY_WPA_AUTHSELS"];
    if (([v13 containsObject:&unk_1F1A7D110] & 1) != 0
      || [v13 containsObject:&unk_1F1A7D128])
    {
      objc_msgSend(v87, "setSupportedSecurityTypes:", objc_msgSend(v87, "supportedSecurityTypes") | 8);
    }
    if ([v13 containsObject:&unk_1F1A7D1D0]) {
      objc_msgSend(v87, "setSupportedSecurityTypes:", objc_msgSend(v87, "supportedSecurityTypes") | 4);
    }
  }
  if (![v87 supportedSecurityTypes]) {
    [v87 setSupportedSecurityTypes:512];
  }
  if (MEMORY[0x1E4F57E00])
  {
    CFArrayRef v14 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
    objc_msgSend(v14, "setObject:forKeyedSubscript:", WiFiNetworkGetProperty((uint64_t)a1, (void *)*MEMORY[0x1E4F57E38]), *MEMORY[0x1E4F57E38]);
    objc_msgSend(v14, "setObject:forKeyedSubscript:", WiFiNetworkGetProperty((uint64_t)a1, (void *)*MEMORY[0x1E4F57E48]), *MEMORY[0x1E4F57E48]);
    objc_msgSend(v14, "setObject:forKeyedSubscript:", WiFiNetworkGetProperty((uint64_t)a1, (void *)*MEMORY[0x1E4F57E60]), *MEMORY[0x1E4F57E60]);
    objc_msgSend(v14, "setObject:forKeyedSubscript:", WiFiNetworkGetProperty((uint64_t)a1, (void *)*MEMORY[0x1E4F57E68]), *MEMORY[0x1E4F57E68]);
    objc_msgSend(v14, "setObject:forKeyedSubscript:", WiFiNetworkGetProperty((uint64_t)a1, (void *)*MEMORY[0x1E4F57E50]), *MEMORY[0x1E4F57E50]);
    objc_msgSend(v14, "setObject:forKeyedSubscript:", WiFiNetworkGetProperty((uint64_t)a1, (void *)*MEMORY[0x1E4F57E58]), *MEMORY[0x1E4F57E58]);
    objc_msgSend(v14, "setObject:forKeyedSubscript:", WiFiNetworkGetProperty((uint64_t)a1, (void *)*MEMORY[0x1E4F57E80]), *MEMORY[0x1E4F57E80]);
    objc_msgSend(v14, "setObject:forKeyedSubscript:", WiFiNetworkGetProperty((uint64_t)a1, (void *)*MEMORY[0x1E4F57E70]), *MEMORY[0x1E4F57E70]);
    objc_msgSend(v14, "setObject:forKeyedSubscript:", WiFiNetworkGetProperty((uint64_t)a1, (void *)*MEMORY[0x1E4F57E30]), *MEMORY[0x1E4F57E30]);
    objc_msgSend(v14, "setObject:forKeyedSubscript:", WiFiNetworkGetProperty((uint64_t)a1, (void *)*MEMORY[0x1E4F57E78]), *MEMORY[0x1E4F57E78]);
    objc_msgSend(v14, "setObject:forKeyedSubscript:", WiFiNetworkGetProperty((uint64_t)a1, (void *)*MEMORY[0x1E4F57E88]), *MEMORY[0x1E4F57E88]);
    objc_msgSend(v14, "setObject:forKeyedSubscript:", WiFiNetworkGetProperty((uint64_t)a1, (void *)*MEMORY[0x1E4F57E20]), *MEMORY[0x1E4F57E20]);
    objc_msgSend(v14, "setObject:forKeyedSubscript:", WiFiNetworkGetProperty((uint64_t)a1, (void *)*MEMORY[0x1E4F57E28]), *MEMORY[0x1E4F57E28]);
    objc_msgSend(v14, "setObject:forKeyedSubscript:", WiFiNetworkGetProperty((uint64_t)a1, (void *)*MEMORY[0x1E4F57E40]), *MEMORY[0x1E4F57E40]);
    objc_msgSend(v14, "setObject:forKeyedSubscript:", WiFiNetworkGetProperty((uint64_t)a1, @"DisabledByCaptiveReason"), @"DisabledByCaptiveReason");
    if ([v14 count]) {
      CFArrayRef v15 = v14;
    }
    else {
      CFArrayRef v15 = 0;
    }
    [v87 setCaptiveProfile:v15];
  }
  if (WiFiNetworkGetDirectedState(a1)) {
    uint64_t v16 = 1;
  }
  else {
    uint64_t v16 = 2;
  }
  [v87 setHiddenState:v16];
  if (WiFiNetworkGetShareMode((uint64_t)a1) == 2) {
    [v87 setPasswordSharingDisabled:1];
  }
  objc_msgSend(v87, "setPayloadUUID:", WiFiNetworkGetProperty((uint64_t)a1, @"PayloadUUID"));
  [v87 setAutoJoinDisabled:!WiFiNetworkIsEnabled((uint64_t)a1)];
  unsigned int SaveDataMode = WiFiNetworkGetSaveDataMode((uint64_t)a1);
  if (SaveDataMode == 1) {
    uint64_t v18 = 1;
  }
  else {
    uint64_t v18 = 2 * (SaveDataMode == 2);
  }
  [v87 setLowDataMode:v18];
  objc_msgSend(v87, "setBundleID:", WiFiNetworkGetProperty((uint64_t)a1, @"BundleIdentifier"));
  objc_msgSend(v87, "setLastJoinedBySystemAt:", WiFiNetworkGetProperty((uint64_t)a1, @"lastAutoJoined"));
  objc_msgSend(v87, "setLastJoinedByUserAt:", WiFiNetworkGetProperty((uint64_t)a1, @"lastJoined"));
  int v19 = objc_msgSend((id)WiFiNetworkGetProperty((uint64_t)a1, @"WiFiManagerKnownNetworksEventType"), "intValue");
  int v20 = objc_msgSend((id)WiFiNetworkGetProperty((uint64_t)a1, @"WiFiNetworkAttributeSource"), "intValue");
  int v21 = objc_msgSend((id)WiFiNetworkGetProperty((uint64_t)a1, @"NetworkOriginator"), "intValue");
  uint64_t v22 = 10;
  switch(v21)
  {
    case 0:
      if (!objc_msgSend(v87, "bundleID", 10)) {
        goto LABEL_58;
      }
      uint64_t v22 = 14;
      break;
    case 1:
    case 6:
      uint64_t v22 = 15;
      break;
    case 2:
      break;
    default:
LABEL_58:
      uint64_t v22 = 17;
      if (v21 != 3 && v20 != 1)
      {
        if (v21 == 4)
        {
          uint64_t v22 = 7;
        }
        else if (v21 == 5)
        {
          uint64_t v22 = 12;
        }
        else if (objc_msgSend(v87, "payloadUUID", 17))
        {
LABEL_69:
          uint64_t v22 = 9;
        }
        else
        {
          uint64_t v22 = 16;
          if (v19 != 14 && v20 != 2)
          {
            uint64_t v22 = 5;
            switch(v19)
            {
              case 1:
                goto LABEL_70;
              case 2:
              case 4:
              case 7:
              case 8:
              case 9:
              case 10:
                goto LABEL_154;
              case 3:
                uint64_t v22 = 8;
                break;
              case 5:
                uint64_t v22 = 13;
                break;
              case 6:
                uint64_t v22 = 6;
                break;
              case 11:
                uint64_t v22 = 11;
                break;
              default:
                if (v19 == 17) {
                  goto LABEL_69;
                }
LABEL_154:
                uint64_t v22 = 0;
                break;
            }
          }
        }
      }
      break;
  }
LABEL_70:
  [v87 setAddReason:v22];
  objc_msgSend(v87, "setAddedAt:", WiFiNetworkGetProperty((uint64_t)a1, @"addedAt"));
  objc_msgSend(v87, "setUpdatedAt:", WiFiNetworkGetProperty((uint64_t)a1, @"lastUpdated"));
  objc_msgSend(v87, "setEAPProfile:", objc_msgSend((id)WiFiNetworkGetProperty((uint64_t)a1, @"EnterpriseProfile"), "objectForKeyedSubscript:", @"EAPClientConfiguration"));
  objc_msgSend(v87, "setDomainName:", WiFiNetworkGetProperty((uint64_t)a1, @"DomainName"));
  objc_msgSend(v87, "setDisplayedOperatorName:", WiFiNetworkGetProperty((uint64_t)a1, @"DisplayedOperatorName"));
  objc_msgSend(v87, "setServiceProviderRoamingEnabled:", WiFiNetworkGetProperty((uint64_t)a1, @"SPRoaming") != (const void *)*MEMORY[0x1E4F1CFC8]);
  objc_msgSend(v87, "setCellularNetworkInfo:", WiFiNetworkGetProperty((uint64_t)a1, @"MCCandMNC"));
  objc_msgSend(v87, "setNAIRealmNameList:", WiFiNetworkGetProperty((uint64_t)a1, @"NaiRealmName"));
  objc_msgSend(v87, "setRoamingConsortiumList:", WiFiNetworkGetProperty((uint64_t)a1, @"RoamingConsortiumOIs"));
  objc_msgSend(v87, "setUserPreferredNetworkNames:", WiFiNetworkGetProperty((uint64_t)a1, @"userPreferredNetworkNames"));
  objc_msgSend(v87, "setUserPreferredPasspointDomains:", WiFiNetworkGetProperty((uint64_t)a1, @"userPreferredPasspointDomains"));
  objc_msgSend(v87, "setNetworkGroupID:", WiFiNetworkGetProperty((uint64_t)a1, @"networkGroupID"));
  objc_msgSend(v87, "setNetworkGroupPriority:", objc_msgSend((id)WiFiNetworkGetProperty((uint64_t)a1, @"networkGroupPriority"), "unsignedIntegerValue"));
  objc_msgSend(v87, "setLastDiscoveredAt:", WiFiNetworkGetProperty((uint64_t)a1, @"discoveredAt"));
  CFIndex v25 = (void *)WiFiNetworkGetProperty((uint64_t)a1, @"TransitionDisabledFlags");
  if (v25) {
    objc_msgSend(v87, "setTransitionDisabledFlags:", objc_msgSend(v25, "unsignedIntegerValue"));
  }
  CFArrayRef v26 = WiFiNetworkGetProperty((uint64_t)a1, @"Standalone");
  CFTypeRef cf2 = *v4;
  [v87 setStandalone6G:v26 == *v4];
  CFArrayRef v27 = (const __CFArray *)WiFiNetworkGetProperty((uint64_t)a1, @"networkKnownBSSListKey");
  if (v27)
  {
    CFArrayRef v28 = v27;
    if (CFArrayGetCount(v27))
    {
      long long v103 = 0u;
      long long v104 = 0u;
      long long v101 = 0u;
      long long v102 = 0u;
      obuint64_t j = v28;
      uint64_t v91 = [(__CFArray *)v28 countByEnumeratingWithState:&v101 objects:v118 count:16];
      if (v91)
      {
        v92 = 0;
        uint64_t v90 = *(void *)v102;
        uint64_t v89 = *MEMORY[0x1E4F5E2C0];
        do
        {
          for (uint64_t i = 0; i != v91; ++i)
          {
            if (*(void *)v102 != v90) {
              objc_enumerationMutation(obj);
            }
            CFNumberRef v30 = *(void **)(*((void *)&v101 + 1) + 8 * i);
            uint64_t v110 = 0;
            uint64_t v111 = (uint64_t)&v110;
            uint64_t v112 = 0x3052000000;
            v113 = __Block_byref_object_copy_;
            v114 = __Block_byref_object_dispose_;
            int v31 = (objc_class *)getCWFBSSClass_softClass;
            uint64_t v115 = getCWFBSSClass_softClass;
            if (!getCWFBSSClass_softClass)
            {
              uint64_t v105 = MEMORY[0x1E4F143A8];
              uint64_t v106 = 3221225472;
              uint64_t v107 = (uint64_t)__getCWFBSSClass_block_invoke;
              v108 = &unk_1E63F42B8;
              v109 = &v110;
              __getCWFBSSClass_block_invoke((uint64_t)&v105);
              int v31 = *(objc_class **)(v111 + 40);
            }
            _Block_object_dispose(&v110, 8);
            id v32 = objc_alloc_init(v31);
            [v30 objectForKeyedSubscript:@"BSSID"];
            [v32 setBSSID:CWFCorrectEthernetAddressString()];
            CFArrayRef v33 = (void *)[v30 objectForKeyedSubscript:@"CHANNEL"];
            uint64_t v34 = [v30 objectForKeyedSubscript:@"CHANNEL_FLAGS"];
            if (v33)
            {
              CFIndex v35 = (void *)v34;
              if (v34)
              {
                id v36 = objc_alloc_init((Class)getCWFChannelClass());
                objc_msgSend(v36, "setChannel:", objc_msgSend(v33, "integerValue"));
                objc_msgSend(v36, "setFlags:", objc_msgSend(v35, "unsignedIntegerValue"));
                [v32 setChannel:v36];
              }
            }
            if ([v32 BSSID] && objc_msgSend(v32, "channel"))
            {
              objc_msgSend(v32, "setLastAssociatedAt:", objc_msgSend(v30, "objectForKeyedSubscript:", @"lastRoamed"));
              CFArrayRef v37 = (void *)[v30 objectForKeyedSubscript:@"networkLocnLat"];
              CFArrayRef v38 = (void *)[v30 objectForKeyedSubscript:@"networkLocnLong"];
              CFIndex v39 = (void *)[v30 objectForKeyedSubscript:@"networkLocnAccuracy"];
              uint64_t v40 = [v30 objectForKeyedSubscript:@"networkLocnTimestamp"];
              if (v37)
              {
                if (v38)
                {
                  if (v39)
                  {
                    uint64_t v41 = v40;
                    if (v40)
                    {
                      uint64_t v110 = 0;
                      uint64_t v111 = (uint64_t)&v110;
                      uint64_t v112 = 0x3052000000;
                      v113 = __Block_byref_object_copy_;
                      v114 = __Block_byref_object_dispose_;
                      CFIndex v42 = (objc_class *)getCLLocationClass_softClass;
                      uint64_t v115 = getCLLocationClass_softClass;
                      if (!getCLLocationClass_softClass)
                      {
                        uint64_t v105 = MEMORY[0x1E4F143A8];
                        uint64_t v106 = 3221225472;
                        uint64_t v107 = (uint64_t)__getCLLocationClass_block_invoke;
                        v108 = &unk_1E63F42B8;
                        v109 = &v110;
                        __getCLLocationClass_block_invoke((uint64_t)&v105);
                        CFIndex v42 = *(objc_class **)(v111 + 40);
                      }
                      _Block_object_dispose(&v110, 8);
                      id v43 = [v42 alloc];
                      [v37 doubleValue];
                      double v45 = v44;
                      [v38 doubleValue];
                      double v47 = v46;
                      uint64_t v105 = 0;
                      uint64_t v106 = (uint64_t)&v105;
                      uint64_t v107 = 0x2020000000;
                      uint64_t v48 = (double (*)(double, double))getCLLocationCoordinate2DMakeSymbolLoc_ptr;
                      v108 = getCLLocationCoordinate2DMakeSymbolLoc_ptr;
                      if (!getCLLocationCoordinate2DMakeSymbolLoc_ptr)
                      {
                        uint64_t v110 = MEMORY[0x1E4F143A8];
                        uint64_t v111 = 3221225472;
                        uint64_t v112 = (uint64_t)__getCLLocationCoordinate2DMakeSymbolLoc_block_invoke;
                        v113 = (void (*)(uint64_t, uint64_t))&unk_1E63F42B8;
                        v114 = (void (*)(uint64_t))&v105;
                        uint64_t v49 = (void *)CoreLocationLibrary();
                        uint64_t v50 = dlsym(v49, "CLLocationCoordinate2DMake");
                        *(void *)(*((void *)v114 + 1) + 24) = v50;
                        getCLLocationCoordinate2DMakeSymbolLoc_ptr = *(_UNKNOWN **)(*((void *)v114 + 1) + 24);
                        uint64_t v48 = *(double (**)(double, double))(v106 + 24);
                      }
                      _Block_object_dispose(&v105, 8);
                      if (!v48) {
                        WiFiNetworkCreateCoreWiFiNetworkProfile_cold_1();
                      }
                      double v51 = v48(v45, v47);
                      double v53 = v52;
                      [v39 doubleValue];
                      objc_msgSend(v32, "setLocation:", (id)objc_msgSend(v43, "initWithCoordinate:altitude:horizontalAccuracy:verticalAccuracy:timestamp:", v41, v51, v53, 0.0, v54, 0.0));
                    }
                  }
                }
              }
              BOOL v55 = (void *)[v30 objectForKeyedSubscript:@"colocated2GHzRNRChannel"];
              uint64_t v56 = [v30 objectForKeyedSubscript:@"colocated2GHzRNRChannelFlags"];
              if (v55)
              {
                uint64_t v57 = (void *)v56;
                if (v56)
                {
                  id v58 = objc_alloc_init((Class)getCWFChannelClass());
                  objc_msgSend(v58, "setChannel:", objc_msgSend(v55, "integerValue"));
                  objc_msgSend(v58, "setFlags:", objc_msgSend(v57, "unsignedIntegerValue"));
                  [v32 setColocated2GHzRNRChannel:v58];
                }
              }
              uint64_t v59 = (void *)[v30 objectForKeyedSubscript:@"colocated5GHzRNRChannel"];
              uint64_t v60 = [v30 objectForKeyedSubscript:@"colocated5GHzRNRChannelFlags"];
              if (v59)
              {
                uint64_t v61 = (void *)v60;
                if (v60)
                {
                  id v62 = objc_alloc_init((Class)getCWFChannelClass());
                  objc_msgSend(v62, "setChannel:", objc_msgSend(v59, "integerValue"));
                  objc_msgSend(v62, "setFlags:", objc_msgSend(v61, "unsignedIntegerValue"));
                  [v32 setColocated5GHzRNRChannel:v62];
                }
              }
              objc_msgSend(v32, "setAWDLRealTimeModeTimestamp:", objc_msgSend(v30, "objectForKeyedSubscript:", @"AWDLRealTimeModeTimestamp"));
              objc_msgSend(v32, "setIPv4NetworkSignature:", objc_msgSend(v30, "objectForKeyedSubscript:", @"IPv4NetworkSignature"));
              objc_msgSend(v32, "setIPv6NetworkSignature:", objc_msgSend(v30, "objectForKeyedSubscript:", @"IPv6NetworkSignature"));
              objc_msgSend(v32, "setDHCPServerID:", objc_msgSend(v30, "objectForKeyedSubscript:", @"DHCPServerID"));
              objc_msgSend(v32, "setDHCPv6ServerID:", objc_msgSend(v30, "objectForKeyedSubscript:", @"DHCPv6ServerID"));
              BOOL v63 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
              long long v99 = 0u;
              long long v100 = 0u;
              long long v97 = 0u;
              long long v98 = 0u;
              uint64_t v64 = (void *)[MEMORY[0x1E4F5E310] supportedOSSpecificKeys];
              uint64_t v65 = [v64 countByEnumeratingWithState:&v97 objects:v117 count:16];
              if (v65)
              {
                uint64_t v66 = *(void *)v98;
                do
                {
                  for (uint64_t j = 0; j != v65; ++j)
                  {
                    if (*(void *)v98 != v66) {
                      objc_enumerationMutation(v64);
                    }
                    objc_msgSend(v63, "setObject:forKeyedSubscript:", WiFiNetworkGetProperty((uint64_t)a1, *(void **)(*((void *)&v97 + 1) + 8 * j)), *(void *)(*((void *)&v97 + 1) + 8 * j));
                  }
                  uint64_t v65 = [v64 countByEnumeratingWithState:&v97 objects:v117 count:16];
                }
                while (v65);
              }
              if ([v63 count]) {
                uint64_t v68 = v63;
              }
              else {
                uint64_t v68 = 0;
              }
              [v32 setOSSpecificAttributes:v68];
              objc_msgSend(v32, "setCoreWiFiSpecificAttributes:", objc_msgSend(v30, "objectForKeyedSubscript:", v89));
              uint64_t v69 = v92;
              if (!v92) {
                uint64_t v69 = (void *)[MEMORY[0x1E4F1CA80] set];
              }
              v92 = v69;
              [v69 addObject:v32];
            }
          }
          uint64_t v91 = [(__CFArray *)obj countByEnumeratingWithState:&v101 objects:v118 count:16];
        }
        while (v91);
      }
      else
      {
        v92 = 0;
      }
      [v87 setBSSList:v92];
    }
  }
  [v87 setPrivacyProxyEnabled:WiFiNetworkGetPrivacyProxyEnabled((uint64_t)a1)];
  objc_msgSend(v87, "setPrivacyProxyBlockedReason:", WiFiNetworkGetProperty((uint64_t)a1, @"PrivacyProxyBlockedReason"));
  if (WiFiNetworkGetProperty((uint64_t)a1, @"WiFiNetworkAttributeIsMoving"))
  {
    uint64_t v70 = WiFiNetworkGetProperty((uint64_t)a1, @"WiFiNetworkAttributeIsMoving");
    if (CFEqual(v70, cf2)) {
      uint64_t v71 = 1;
    }
    else {
      uint64_t v71 = 2;
    }
  }
  else
  {
    uint64_t v71 = 0;
  }
  [v87 setMovingAttribute:v71];
  if (WiFiNetworkGetProperty((uint64_t)a1, @"WiFiNetworkAttributeIsPublic"))
  {
    uint64_t v72 = WiFiNetworkGetProperty((uint64_t)a1, @"WiFiNetworkAttributeIsPublic");
    if (CFEqual(v72, cf2)) {
      uint64_t v73 = 1;
    }
    else {
      uint64_t v73 = 2;
    }
  }
  else
  {
    uint64_t v73 = 0;
  }
  [v87 setPublicAttribute:v73];
  objc_msgSend(v87, "setCarplayUUID:", WiFiNetworkGetProperty((uint64_t)a1, @"CARPLAY_UUID"));
  [v87 setCarplayNetwork:WiFiNetworkIsCarPlay((uint64_t)a1) != 0];
  [v87 setPersonalHotspot:WiFiNetworkIsApplePersonalHotspot((uint64_t)a1) != 0];
  objc_msgSend(v87, "setNANServiceID:", WiFiNetworkGetProperty((uint64_t)a1, @"WiFiNetworkNANServiceID"));
  [v87 setPublicAirPlayNetwork:WiFiNetworkIsPublicAirPlayNetwork((uint64_t)a1) != 0];
  objc_msgSend(v87, "setDNSHeuristicsFilteredNetwork:", WiFiNetworkGetProperty((uint64_t)a1, @"FilteredNetwork") == cf2);
  objc_msgSend(v87, "setDNSHeuristicsFailureStateInfo:", WiFiNetworkGetProperty((uint64_t)a1, @"DNSFailures"));
  uint64_t v74 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
  long long v95 = 0u;
  long long v96 = 0u;
  long long v93 = 0u;
  long long v94 = 0u;
  uint64_t v75 = (void *)[MEMORY[0x1E4F5E328] supportedOSSpecificKeys];
  uint64_t v76 = [v75 countByEnumeratingWithState:&v93 objects:v116 count:16];
  if (v76)
  {
    uint64_t v77 = *(void *)v94;
    do
    {
      for (uint64_t k = 0; k != v76; ++k)
      {
        if (*(void *)v94 != v77) {
          objc_enumerationMutation(v75);
        }
        objc_msgSend(v74, "setObject:forKeyedSubscript:", WiFiNetworkGetProperty((uint64_t)a1, *(void **)(*((void *)&v93 + 1) + 8 * k)), *(void *)(*((void *)&v93 + 1) + 8 * k));
      }
      uint64_t v76 = [v75 countByEnumeratingWithState:&v93 objects:v116 count:16];
    }
    while (v76);
  }
  if ([v74 count]) {
    v79 = v74;
  }
  else {
    v79 = 0;
  }
  [v87 setOSSpecificAttributes:v79];
  objc_msgSend(v87, "setCoreWiFiSpecificAttributes:", WiFiNetworkGetProperty((uint64_t)a1, (void *)*MEMORY[0x1E4F5E2C0]));
LABEL_141:
  return v87;
}

void sub_1BF201768(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,char a51)
{
}

uint64_t getCWFNetworkProfileClass()
{
  uint64_t v3 = 0;
  CFArrayRef v4 = &v3;
  uint64_t v5 = 0x3052000000;
  uint64_t v6 = __Block_byref_object_copy_;
  uint64_t v7 = __Block_byref_object_dispose_;
  uint64_t v0 = getCWFNetworkProfileClass_softClass;
  uint64_t v8 = getCWFNetworkProfileClass_softClass;
  if (!getCWFNetworkProfileClass_softClass)
  {
    v2[0] = MEMORY[0x1E4F143A8];
    v2[1] = 3221225472;
    _OWORD v2[2] = __getCWFNetworkProfileClass_block_invoke;
    v2[3] = &unk_1E63F42B8;
    v2[4] = &v3;
    __getCWFNetworkProfileClass_block_invoke((uint64_t)v2);
    uint64_t v0 = v4[5];
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_1BF2018BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t getCWFChannelClass()
{
  uint64_t v3 = 0;
  CFArrayRef v4 = &v3;
  uint64_t v5 = 0x3052000000;
  uint64_t v6 = __Block_byref_object_copy_;
  uint64_t v7 = __Block_byref_object_dispose_;
  uint64_t v0 = getCWFChannelClass_softClass;
  uint64_t v8 = getCWFChannelClass_softClass;
  if (!getCWFChannelClass_softClass)
  {
    v2[0] = MEMORY[0x1E4F143A8];
    v2[1] = 3221225472;
    _OWORD v2[2] = __getCWFChannelClass_block_invoke;
    v2[3] = &unk_1E63F42B8;
    v2[4] = &v3;
    __getCWFChannelClass_block_invoke((uint64_t)v2);
    uint64_t v0 = v4[5];
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_1BF2019B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

BOOL WiFiNetworkGetPrivacyProxyEnabled(uint64_t a1)
{
  if (a1)
  {
    if (CFDictionaryContainsKey(*(CFDictionaryRef *)(a1 + 16), @"PrivacyProxyEnabled")) {
      return WiFiNetworkGetProperty(a1, @"PrivacyProxyEnabled") == (const void *)*MEMORY[0x1E4F1CFD0];
    }
  }
  else
  {
  }
  return 1;
}

const void *WiFiNetworkGetPrivacyProxyBlockedReason(uint64_t a1)
{
  if (a1)
  {
    return WiFiNetworkGetProperty(a1, @"PrivacyProxyBlockedReason");
  }
  else
  {
    return 0;
  }
}

uint64_t WiFiNetworkIsPublicAirPlayNetwork(uint64_t a1)
{
  if (a1)
  {
    uint64_t result = CFDictionaryContainsKey(*(CFDictionaryRef *)(a1 + 16), @"PublicAirPlayNetwork");
    if (result) {
      return WiFiNetworkGetProperty(a1, @"PublicAirPlayNetwork") == (const void *)*MEMORY[0x1E4F1CFD0];
    }
  }
  else
  {
    return 0;
  }
  return result;
}

_WORD *WiFiNetworkCreateFromCoreWiFiNetworkProfile(void *a1, void *a2)
{
  v95[1] = *MEMORY[0x1E4F143B8];
  CFArrayRef v4 = (void *)MEMORY[0x1C18A51F0]();
  uint64_t CWFNetworkProfileClass = getCWFNetworkProfileClass();
  uint64_t v6 = 0;
  if (a1 && CWFNetworkProfileClass)
  {
    getCWFNetworkProfileClass();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      uint64_t v6 = 0;
      goto LABEL_223;
    }
    uint64_t v7 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
    if (!a2 || [a2 containsObject:&unk_1F1A7D218])
    {
      objc_msgSend(v7, "addEntriesFromDictionary:", objc_msgSend(a1, "OSSpecificAttributes"));
      if (![v7 objectForKey:@"AP_MODE"]) {
        [v7 setObject:&unk_1F1A7D1D0 forKeyedSubscript:@"AP_MODE"];
      }
    }
    uint64_t v8 = [a1 coreWiFiSpecificAttributes];
    uint64_t v88 = *MEMORY[0x1E4F5E2C0];
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v8);
    uint64_t v9 = MEMORY[0x1E4F1CC28];
    v86 = v4;
    if (a2)
    {
      if ([a2 containsObject:&unk_1F1A7D230])
      {
        objc_msgSend(v7, "setObject:forKeyedSubscript:", objc_msgSend(a1, "SSID"), @"SSID");
        objc_msgSend(v7, "setObject:forKeyedSubscript:", objc_msgSend(a1, "networkName"), @"SSID_STR");
      }
      if (([a2 containsObject:&unk_1F1A7D248] & 1) == 0)
      {
LABEL_61:
        if (![a2 containsObject:&unk_1F1A7D2C0])
        {
LABEL_65:
          if (![a2 containsObject:&unk_1F1A7D2D8]) {
            goto LABEL_72;
          }
LABEL_66:
          if ([a1 hiddenState] == 1)
          {
            uint64_t v33 = MEMORY[0x1E4F1CC38];
          }
          else
          {
            if ([a1 hiddenState] != 2) {
              goto LABEL_71;
            }
            uint64_t v33 = MEMORY[0x1E4F1CC28];
          }
          [v7 setObject:v33 forKeyedSubscript:@"UserDirected"];
LABEL_71:
          if (!a2)
          {
LABEL_73:
            if ([a1 isPasswordSharingDisabled]) {
              [v7 setObject:&unk_1F1A7D1D0 forKeyedSubscript:@"ShareMode"];
            }
            if (!a2)
            {
              objc_msgSend(v7, "setObject:forKeyedSubscript:", objc_msgSend(a1, "payloadUUID"), @"PayloadUUID");
LABEL_81:
              objc_msgSend(v7, "setObject:forKeyedSubscript:", objc_msgSend(a1, "bundleID"), @"BundleIdentifier");
              if (!a2)
              {
                if ([a1 isAutoJoinDisabled]) {
                  uint64_t v35 = v9;
                }
                else {
                  uint64_t v35 = MEMORY[0x1E4F1CC38];
                }
                [v7 setObject:v35 forKeyedSubscript:@"enabled"];
LABEL_93:
                uint64_t v36 = [a1 lowDataMode];
                CFArrayRef v37 = &unk_1F1A7D110;
                if (v36 == 2) {
                  CFArrayRef v37 = &unk_1F1A7D1D0;
                }
                if (v36 == 1) {
                  CFArrayRef v38 = &unk_1F1A7D128;
                }
                else {
                  CFArrayRef v38 = v37;
                }
                [v7 setObject:v38 forKeyedSubscript:@"SaveDataMode"];
                if (!a2)
                {
                  objc_msgSend(v7, "setObject:forKeyedSubscript:", objc_msgSend(a1, "lastJoinedByUserAt"), @"lastJoined");
LABEL_104:
                  objc_msgSend(v7, "setObject:forKeyedSubscript:", objc_msgSend(a1, "lastJoinedBySystemAt"), @"lastAutoJoined");
                  if (!a2)
                  {
LABEL_106:
                    uint64_t v39 = [a1 addReason];
                    uint64_t v40 = 0;
                    char v41 = 1;
                    CFIndex v42 = &unk_1F1A7D170;
                    id v43 = &unk_1F1A7D128;
                    switch(v39)
                    {
                      case 2:
                      case 3:
                      case 4:
                      case 5:
                        goto LABEL_107;
                      case 6:
                        id v43 = &unk_1F1A7D200;
                        goto LABEL_107;
                      case 7:
                        uint64_t v40 = 0;
                        CFIndex v42 = &unk_1F1A7D128;
                        id v43 = &unk_1F1A7D1E8;
                        goto LABEL_119;
                      case 8:
                        id v43 = &unk_1F1A7D140;
                        goto LABEL_107;
                      case 9:
                        id v43 = &unk_1F1A7D3C8;
                        goto LABEL_107;
                      case 10:
                        uint64_t v40 = 0;
                        id v43 = &unk_1F1A7D1D0;
                        goto LABEL_119;
                      case 11:
                        id v43 = &unk_1F1A7D278;
                        goto LABEL_107;
                      case 12:
                        uint64_t v40 = 0;
                        CFIndex v42 = &unk_1F1A7D128;
                        id v43 = &unk_1F1A7D158;
                        goto LABEL_119;
                      case 13:
                        id v43 = &unk_1F1A7D158;
LABEL_107:
                        double v44 = @"WiFiManagerKnownNetworksEventType";
                        double v45 = v7;
                        double v46 = v43;
                        goto LABEL_121;
                      case 14:
                        uint64_t v40 = 0;
                        id v43 = &unk_1F1A7D110;
                        goto LABEL_119;
                      case 15:
                        goto LABEL_119;
                      case 16:
                        [v7 setObject:&unk_1F1A7D3B0 forKeyedSubscript:@"WiFiManagerKnownNetworksEventType"];
                        uint64_t v40 = &unk_1F1A7D248;
                        goto LABEL_120;
                      case 17:
                        char v41 = 0;
                        uint64_t v40 = &unk_1F1A7D230;
                        CFIndex v42 = &unk_1F1A7D3B0;
                        id v43 = &unk_1F1A7D140;
LABEL_119:
                        [v7 setObject:v42 forKeyedSubscript:@"WiFiManagerKnownNetworksEventType"];
                        [v7 setObject:v43 forKeyedSubscript:@"NetworkOriginator"];
                        if ((v41 & 1) == 0)
                        {
LABEL_120:
                          double v44 = @"WiFiNetworkAttributeSource";
                          double v45 = v7;
                          double v46 = v40;
LABEL_121:
                          [v45 setObject:v46 forKeyedSubscript:v44];
                        }
                        break;
                      default:
                        break;
                    }
                    if (!a2)
                    {
                      objc_msgSend(v7, "setObject:forKeyedSubscript:", objc_msgSend(a1, "addedAt", v42), @"addedAt");
LABEL_128:
                      uint64_t v47 = [a1 EAPProfile];
                      if (v47)
                      {
                        long long v94 = @"EAPClientConfiguration";
                        v95[0] = v47;
                        uint64_t v48 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v95 forKeys:&v94 count:1];
                      }
                      else
                      {
                        uint64_t v48 = 0;
                      }
                      [v7 setObject:v48 forKeyedSubscript:@"EnterpriseProfile"];
                      if (!a2)
                      {
                        objc_msgSend(v7, "setObject:forKeyedSubscript:", objc_msgSend(a1, "domainName"), @"DomainName");
LABEL_137:
                        objc_msgSend(v7, "setObject:forKeyedSubscript:", objc_msgSend(a1, "displayedOperatorName"), @"DisplayedOperatorName");
                        if (!a2)
                        {
                          objc_msgSend(v7, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(a1, "isServiceProviderRoamingEnabled")), @"SPRoaming");
LABEL_143:
                          objc_msgSend(v7, "setObject:forKeyedSubscript:", objc_msgSend(a1, "cellularNetworkInfo"), @"MCCandMNC");
                          if (!a2)
                          {
                            objc_msgSend(v7, "setObject:forKeyedSubscript:", objc_msgSend(a1, "NAIRealmNameList"), @"NaiRealmName");
LABEL_149:
                            objc_msgSend(v7, "setObject:forKeyedSubscript:", objc_msgSend(a1, "roamingConsortiumList"), @"RoamingConsortiumOIs");
                            if (!a2)
                            {
                              objc_msgSend(v7, "setObject:forKeyedSubscript:", objc_msgSend(a1, "userPreferredNetworkNames"), @"userPreferredNetworkNames");
LABEL_155:
                              objc_msgSend(v7, "setObject:forKeyedSubscript:", objc_msgSend(a1, "userPreferredPasspointDomains"), @"userPreferredPasspointDomains");
                              if (!a2)
                              {
                                objc_msgSend(v7, "setObject:forKeyedSubscript:", objc_msgSend(a1, "networkGroupID"), @"networkGroupID");
LABEL_161:
                                objc_msgSend(v7, "setObject:forKeyedSubscript:", objc_msgSend(a1, "networkGroupPriority"), @"networkGroupPriority");
                                if (!a2)
                                {
                                  objc_msgSend(v7, "setObject:forKeyedSubscript:", objc_msgSend(a1, "lastDiscoveredAt"), @"discoveredAt");
LABEL_167:
                                  uint64_t v49 = (void *)[MEMORY[0x1E4F1CA80] set];
                                  uint64_t v50 = (void *)[a1 BSSList];
                                  if (v50)
                                  {
                                    double v51 = v50;
                                    char v83 = a2;
                                    char v84 = v7;
                                    v85 = a1;
                                    long long v91 = 0u;
                                    long long v92 = 0u;
                                    long long v89 = 0u;
                                    long long v90 = 0u;
                                    uint64_t v52 = [v50 countByEnumeratingWithState:&v89 objects:v93 count:16];
                                    if (v52)
                                    {
                                      uint64_t v53 = v52;
                                      double v54 = 0;
                                      uint64_t v55 = *(void *)v90;
                                      unint64_t v56 = 0x1E4F29000uLL;
                                      v87 = v51;
                                      do
                                      {
                                        for (uint64_t i = 0; i != v53; ++i)
                                        {
                                          if (*(void *)v90 != v55) {
                                            objc_enumerationMutation(v51);
                                          }
                                          id v58 = *(void **)(*((void *)&v89 + 1) + 8 * i);
                                          uint64_t v59 = (void *)[v58 BSSID];
                                          if (v59)
                                          {
                                            uint64_t v60 = (const char *)[v59 UTF8String];
                                            if (v60)
                                            {
                                              uint64_t v61 = ether_aton(v60);
                                              if (v61)
                                              {
                                                id v62 = ether_ntoa(v61);
                                                if (v62)
                                                {
                                                  uint64_t v63 = [*(id *)(v56 + 24) stringWithUTF8String:v62];
                                                  if (v63)
                                                  {
                                                    uint64_t v64 = v63;
                                                    if (([v49 containsObject:v63] & 1) == 0)
                                                    {
                                                      [v49 addObject:v64];
                                                      uint64_t v65 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
                                                      objc_msgSend(v65, "addEntriesFromDictionary:", objc_msgSend(v58, "OSSpecificAttributes"));
                                                      [v65 setObject:v64 forKeyedSubscript:@"BSSID"];
                                                      uint64_t v66 = (void *)[v58 channel];
                                                      if (v66)
                                                      {
                                                        uint64_t v67 = v66;
                                                        objc_msgSend(v65, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v66, "channel")), @"CHANNEL");
                                                        objc_msgSend(v65, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(v67, "flags")), @"CHANNEL_FLAGS");
                                                      }
                                                      uint64_t v68 = (void *)[v58 location];
                                                      if (v68)
                                                      {
                                                        uint64_t v69 = v68;
                                                        uint64_t v70 = NSNumber;
                                                        [v68 coordinate];
                                                        objc_msgSend(v65, "setObject:forKeyedSubscript:", objc_msgSend(v70, "numberWithDouble:"), @"networkLocnLat");
                                                        uint64_t v71 = NSNumber;
                                                        [v69 coordinate];
                                                        objc_msgSend(v65, "setObject:forKeyedSubscript:", objc_msgSend(v71, "numberWithDouble:", v72), @"networkLocnLong");
                                                        uint64_t v73 = NSNumber;
                                                        [v69 horizontalAccuracy];
                                                        objc_msgSend(v65, "setObject:forKeyedSubscript:", objc_msgSend(v73, "numberWithDouble:"), @"networkLocnAccuracy");
                                                        objc_msgSend(v65, "setObject:forKeyedSubscript:", objc_msgSend(v69, "timestamp"), @"networkLocnTimestamp");
                                                      }
                                                      objc_msgSend(v65, "setObject:forKeyedSubscript:", objc_msgSend(v58, "lastAssociatedAt"), @"lastRoamed");
                                                      uint64_t v74 = (void *)[v58 colocated2GHzRNRChannel];
                                                      if (v74)
                                                      {
                                                        uint64_t v75 = v74;
                                                        objc_msgSend(v65, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v74, "channel")), @"colocated2GHzRNRChannel");
                                                        objc_msgSend(v65, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(v75, "flags")), @"colocated2GHzRNRChannelFlags");
                                                      }
                                                      uint64_t v76 = (void *)[v58 colocated5GHzRNRChannel];
                                                      if (v76)
                                                      {
                                                        uint64_t v77 = v76;
                                                        objc_msgSend(v65, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v76, "channel")), @"colocated5GHzRNRChannel");
                                                        objc_msgSend(v65, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(v77, "flags")), @"colocated5GHzRNRChannelFlags");
                                                      }
                                                      objc_msgSend(v65, "setObject:forKeyedSubscript:", objc_msgSend(v58, "AWDLRealTimeModeTimestamp"), @"AWDLRealTimeModeTimestamp");
                                                      objc_msgSend(v65, "setObject:forKeyedSubscript:", objc_msgSend(v58, "IPv4NetworkSignature"), @"IPv4NetworkSignature");
                                                      objc_msgSend(v65, "setObject:forKeyedSubscript:", objc_msgSend(v58, "IPv6NetworkSignature"), @"IPv6NetworkSignature");
                                                      objc_msgSend(v65, "setObject:forKeyedSubscript:", objc_msgSend(v58, "DHCPServerID"), @"DHCPServerID");
                                                      objc_msgSend(v65, "setObject:forKeyedSubscript:", objc_msgSend(v58, "DHCPv6ServerID"), @"DHCPv6ServerID");
                                                      objc_msgSend(v65, "setObject:forKeyedSubscript:", objc_msgSend(v58, "coreWiFiSpecificAttributes"), v88);
                                                      if (!v54) {
                                                        double v54 = (void *)[MEMORY[0x1E4F1CA48] array];
                                                      }
                                                      [v54 addObject:v65];
                                                      double v51 = v87;
                                                      unint64_t v56 = 0x1E4F29000;
                                                    }
                                                  }
                                                }
                                              }
                                            }
                                          }
                                        }
                                        uint64_t v53 = [v51 countByEnumeratingWithState:&v89 objects:v93 count:16];
                                      }
                                      while (v53);
                                    }
                                    else
                                    {
                                      double v54 = 0;
                                    }
                                    uint64_t v7 = v84;
                                    [v84 setObject:v54 forKeyedSubscript:@"networkKnownBSSListKey"];
                                    a1 = v85;
                                    CFArrayRef v4 = v86;
                                    a2 = v83;
                                  }
                                  if (!a2)
                                  {
                                    objc_msgSend(v7, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(a1, "isPrivacyProxyEnabled")), @"PrivacyProxyEnabled");
                                    goto LABEL_201;
                                  }
LABEL_196:
                                  if ([a2 containsObject:&unk_1F1A7D530]) {
                                    objc_msgSend(v7, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(a1, "isPrivacyProxyEnabled")), @"PrivacyProxyEnabled");
                                  }
                                  if (([a2 containsObject:&unk_1F1A7D548] & 1) == 0)
                                  {
LABEL_202:
                                    if (![a2 containsObject:&unk_1F1A7D560])
                                    {
LABEL_209:
                                      if (![a2 containsObject:&unk_1F1A7D578]) {
                                        goto LABEL_216;
                                      }
LABEL_210:
                                      uint64_t v80 = [a1 publicAttribute];
                                      if (v80 == 1)
                                      {
                                        uint64_t v81 = MEMORY[0x1E4F1CC38];
                                      }
                                      else
                                      {
                                        if (v80 != 2) {
                                          goto LABEL_215;
                                        }
                                        uint64_t v81 = MEMORY[0x1E4F1CC28];
                                      }
                                      [v7 setObject:v81 forKeyedSubscript:@"WiFiNetworkAttributeIsPublic"];
LABEL_215:
                                      if (!a2)
                                      {
                                        objc_msgSend(v7, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(a1, "transitionDisabledFlags")), @"TransitionDisabledFlags");
LABEL_221:
                                        objc_msgSend(v7, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(a1, "isStandalone6G")), @"Standalone");
LABEL_222:
                                        objc_msgSend(v7, "setObject:forKeyedSubscript:", objc_msgSend(a1, "carplayUUID"), @"CARPLAY_UUID");
                                        objc_msgSend(v7, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(a1, "isPersonalHotspot")), @"IsPersonalHotspot");
                                        objc_msgSend(v7, "setObject:forKeyedSubscript:", objc_msgSend(a1, "NANServiceID"), @"WiFiNetworkNANServiceID");
                                        objc_msgSend(v7, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(a1, "isPublicAirPlayNetwork")), @"PublicAirPlayNetwork");
                                        objc_msgSend(v7, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(a1, "isDNSHeuristicsFilteredNetwork")), @"FilteredNetwork");
                                        objc_msgSend(v7, "setObject:forKeyedSubscript:", objc_msgSend(a1, "DNSHeuristicsFailureStateInfo"), @"DNSFailures");
                                        uint64_t v6 = WiFiNetworkCreate(*MEMORY[0x1E4F1CF80], v7);
                                        goto LABEL_223;
                                      }
LABEL_216:
                                      if ([a2 containsObject:&unk_1F1A7D590]) {
                                        objc_msgSend(v7, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(a1, "transitionDisabledFlags")), @"TransitionDisabledFlags");
                                      }
                                      if (([a2 containsObject:&unk_1F1A7D5A8] & 1) == 0) {
                                        goto LABEL_222;
                                      }
                                      goto LABEL_221;
                                    }
LABEL_203:
                                    uint64_t v78 = [a1 movingAttribute];
                                    if (v78 == 1)
                                    {
                                      uint64_t v79 = MEMORY[0x1E4F1CC38];
                                    }
                                    else
                                    {
                                      if (v78 != 2) {
                                        goto LABEL_208;
                                      }
                                      uint64_t v79 = MEMORY[0x1E4F1CC28];
                                    }
                                    [v7 setObject:v79 forKeyedSubscript:@"WiFiNetworkAttributeIsMoving"];
LABEL_208:
                                    if (!a2) {
                                      goto LABEL_210;
                                    }
                                    goto LABEL_209;
                                  }
LABEL_201:
                                  objc_msgSend(v7, "setObject:forKeyedSubscript:", objc_msgSend(a1, "privacyProxyBlockedReason"), @"PrivacyProxyBlockedReason");
                                  if (!a2) {
                                    goto LABEL_203;
                                  }
                                  goto LABEL_202;
                                }
LABEL_162:
                                if ([a2 containsObject:&unk_1F1A7D500]) {
                                  objc_msgSend(v7, "setObject:forKeyedSubscript:", objc_msgSend(a1, "lastDiscoveredAt"), @"discoveredAt");
                                }
                                if (([a2 containsObject:&unk_1F1A7D518] & 1) == 0) {
                                  goto LABEL_196;
                                }
                                goto LABEL_167;
                              }
LABEL_156:
                              if ([a2 containsObject:&unk_1F1A7D4D0]) {
                                objc_msgSend(v7, "setObject:forKeyedSubscript:", objc_msgSend(a1, "networkGroupID"), @"networkGroupID");
                              }
                              if (([a2 containsObject:&unk_1F1A7D4E8] & 1) == 0) {
                                goto LABEL_162;
                              }
                              goto LABEL_161;
                            }
LABEL_150:
                            if ([a2 containsObject:&unk_1F1A7D4A0]) {
                              objc_msgSend(v7, "setObject:forKeyedSubscript:", objc_msgSend(a1, "userPreferredNetworkNames"), @"userPreferredNetworkNames");
                            }
                            if (([a2 containsObject:&unk_1F1A7D4B8] & 1) == 0) {
                              goto LABEL_156;
                            }
                            goto LABEL_155;
                          }
LABEL_144:
                          if ([a2 containsObject:&unk_1F1A7D470]) {
                            objc_msgSend(v7, "setObject:forKeyedSubscript:", objc_msgSend(a1, "NAIRealmNameList"), @"NaiRealmName");
                          }
                          if (([a2 containsObject:&unk_1F1A7D488] & 1) == 0) {
                            goto LABEL_150;
                          }
                          goto LABEL_149;
                        }
LABEL_138:
                        if ([a2 containsObject:&unk_1F1A7D440]) {
                          objc_msgSend(v7, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(a1, "isServiceProviderRoamingEnabled")), @"SPRoaming");
                        }
                        if (([a2 containsObject:&unk_1F1A7D458] & 1) == 0) {
                          goto LABEL_144;
                        }
                        goto LABEL_143;
                      }
LABEL_132:
                      if ([a2 containsObject:&unk_1F1A7D410]) {
                        objc_msgSend(v7, "setObject:forKeyedSubscript:", objc_msgSend(a1, "domainName"), @"DomainName");
                      }
                      if (([a2 containsObject:&unk_1F1A7D428] & 1) == 0) {
                        goto LABEL_138;
                      }
                      goto LABEL_137;
                    }
LABEL_123:
                    if ([a2 containsObject:&unk_1F1A7D3E0]) {
                      objc_msgSend(v7, "setObject:forKeyedSubscript:", objc_msgSend(a1, "addedAt"), @"addedAt");
                    }
                    if (([a2 containsObject:&unk_1F1A7D3F8] & 1) == 0) {
                      goto LABEL_132;
                    }
                    goto LABEL_128;
                  }
LABEL_105:
                  if (![a2 containsObject:&unk_1F1A7D398]) {
                    goto LABEL_123;
                  }
                  goto LABEL_106;
                }
LABEL_99:
                if ([a2 containsObject:&unk_1F1A7D368]) {
                  objc_msgSend(v7, "setObject:forKeyedSubscript:", objc_msgSend(a1, "lastJoinedByUserAt"), @"lastJoined");
                }
                if (([a2 containsObject:&unk_1F1A7D380] & 1) == 0) {
                  goto LABEL_105;
                }
                goto LABEL_104;
              }
LABEL_82:
              if ([a2 containsObject:&unk_1F1A7D338])
              {
                if ([a1 isAutoJoinDisabled]) {
                  uint64_t v34 = v9;
                }
                else {
                  uint64_t v34 = MEMORY[0x1E4F1CC38];
                }
                [v7 setObject:v34 forKeyedSubscript:@"enabled"];
              }
              if (([a2 containsObject:&unk_1F1A7D350] & 1) == 0) {
                goto LABEL_99;
              }
              goto LABEL_93;
            }
LABEL_76:
            if ([a2 containsObject:&unk_1F1A7D308]) {
              objc_msgSend(v7, "setObject:forKeyedSubscript:", objc_msgSend(a1, "payloadUUID"), @"PayloadUUID");
            }
            if (([a2 containsObject:&unk_1F1A7D320] & 1) == 0) {
              goto LABEL_82;
            }
            goto LABEL_81;
          }
LABEL_72:
          if (![a2 containsObject:&unk_1F1A7D2F0]) {
            goto LABEL_76;
          }
          goto LABEL_73;
        }
LABEL_62:
        uint64_t v32 = [a1 captiveProfile];
        if (v32) {
          [v7 addEntriesFromDictionary:v32];
        }
        if (!a2) {
          goto LABEL_66;
        }
        goto LABEL_65;
      }
      __int16 v10 = [a1 supportedSecurityTypes];
      __int16 v11 = v10;
      if ((v10 & 2) == 0)
      {
        if ((v10 & 1) == 0
          || ([v7 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"WEP"],
              ![a2 containsObject:&unk_1F1A7D2A8]))
        {
LABEL_31:
          if ((v11 & 0xC) != 0)
          {
            int v19 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
            objc_msgSend(v19, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", 1), @"IE_KEY_WPA_VERSION");
            objc_msgSend(v19, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithInt:", 2), @"IE_KEY_WPA_MCIPHER");
            int v20 = (void *)[MEMORY[0x1E4F1CA48] array];
            objc_msgSend(v20, "addObject:", objc_msgSend(NSNumber, "numberWithInt:", 2));
            [v19 setObject:v20 forKey:@"IE_KEY_WPA_UCIPHERS"];
            int v21 = (void *)[MEMORY[0x1E4F1CA48] array];
            if ((v11 & 8) != 0) {
              uint64_t v22 = 1;
            }
            else {
              uint64_t v22 = 2;
            }
            objc_msgSend(v21, "addObject:", objc_msgSend(NSNumber, "numberWithInt:", v22));
            [v19 setObject:v21 forKey:@"IE_KEY_WPA_AUTHSELS"];
            [v7 setObject:v19 forKeyedSubscript:@"WPA_IE"];
          }
          uint64_t v23 = v11 & 0x300;
          if ((v11 & 0xF0) == 0 && v23 != 256)
          {
LABEL_52:
            if (v23 == 768) {
              [v7 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"SCAN_RESULT_OWE_MULTI_SSID"];
            }
            int v28 = [a1 isWPA2];
            uint64_t v29 = MEMORY[0x1E4F1CC38];
            if (v28) {
              uint64_t v30 = MEMORY[0x1E4F1CC38];
            }
            else {
              uint64_t v30 = v9;
            }
            [v7 setObject:v30 forKeyedSubscript:@"ALLOW_WPA2_PSK"];
            if ([a1 isOpen]) {
              uint64_t v31 = v29;
            }
            else {
              uint64_t v31 = v9;
            }
            [v7 setObject:v31 forKeyedSubscript:@"ALLOW_OWE_TSN"];
            CFArrayRef v4 = v86;
            if (!a2) {
              goto LABEL_62;
            }
            goto LABEL_61;
          }
          uint64_t v24 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
          objc_msgSend(v24, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", 1), @"IE_KEY_RSN_VERSION");
          objc_msgSend(v24, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithInt:", 4), @"IE_KEY_RSN_MCIPHER");
          CFIndex v25 = (void *)[MEMORY[0x1E4F1CA48] array];
          objc_msgSend(v25, "addObject:", objc_msgSend(NSNumber, "numberWithInt:", 4));
          [v24 setObject:v25 forKey:@"IE_KEY_RSN_UCIPHERS"];
          CFArrayRef v26 = (void *)[MEMORY[0x1E4F1CA48] array];
          if ((v11 & 0x80) != 0)
          {
            objc_msgSend(v26, "addObject:", objc_msgSend(NSNumber, "numberWithInt:", 12));
            if ((v11 & 0x20) == 0)
            {
LABEL_40:
              if ((v11 & 0x40) == 0) {
                goto LABEL_47;
              }
              goto LABEL_44;
            }
          }
          else if ((v11 & 0x20) == 0)
          {
            goto LABEL_40;
          }
          objc_msgSend(v26, "addObject:", objc_msgSend(NSNumber, "numberWithInt:", 1));
          if ((v11 & 0x40) == 0)
          {
LABEL_47:
            if (v23 == 256) {
              objc_msgSend(v26, "addObject:", objc_msgSend(NSNumber, "numberWithInt:", 18));
            }
            if ((v11 & 0x10) != 0) {
              objc_msgSend(v26, "addObject:", objc_msgSend(NSNumber, "numberWithInt:", 2));
            }
            [v24 setObject:v26 forKey:@"IE_KEY_RSN_AUTHSELS"];
            [v7 setObject:v24 forKeyedSubscript:@"RSN_IE"];
            goto LABEL_52;
          }
LABEL_44:
          objc_msgSend(v26, "addObject:", objc_msgSend(NSNumber, "numberWithInt:", 8));
          CFArrayRef v27 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
          [v27 setObject:MEMORY[0x1E4F1CC38] forKey:@"MFP_CAPABLE"];
          if ((v11 & 0x10) == 0) {
            [v27 setObject:MEMORY[0x1E4F1CC38] forKey:@"MFP_REQUIRED"];
          }
          [v24 setObject:v27 forKey:@"IE_KEY_RSN_CAPS"];
          goto LABEL_47;
        }
        goto LABEL_19;
      }
      if (![a2 containsObject:&unk_1F1A7D260]) {
        goto LABEL_31;
      }
    }
    else
    {
      objc_msgSend(v7, "setObject:forKeyedSubscript:", objc_msgSend(a1, "SSID"), @"SSID");
      objc_msgSend(v7, "setObject:forKeyedSubscript:", objc_msgSend(a1, "networkName"), @"SSID_STR");
      __int16 v12 = [a1 supportedSecurityTypes];
      __int16 v11 = v12;
      if ((v12 & 2) == 0)
      {
        if ((v12 & 1) == 0) {
          goto LABEL_31;
        }
        [v7 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"WEP"];
LABEL_19:
        unint64_t v13 = [a1 WEPSubtype] - 1;
        if (v13 > 3) {
          uint64_t v14 = 0;
        }
        else {
          uint64_t v14 = dword_1BF219F10[v13];
        }
        CFIndex v17 = (void *)[NSNumber numberWithInt:v14];
        uint64_t v18 = @"WEP_AUTH_Flags";
LABEL_30:
        [v7 setObject:v17 forKeyedSubscript:v18];
        goto LABEL_31;
      }
    }
    uint64_t v15 = [a1 WAPISubtype];
    uint64_t v16 = &unk_1F1A7D290;
    if (v15 != 1) {
      uint64_t v16 = 0;
    }
    if (v15 == 2) {
      CFIndex v17 = &unk_1F1A7D278;
    }
    else {
      CFIndex v17 = v16;
    }
    uint64_t v18 = @"WAPI";
    goto LABEL_30;
  }
LABEL_223:
  return v6;
}

uint64_t WiFiNetworkCreateCoreWiFiScanResult(uint64_t a1)
{
  v35[75] = *MEMORY[0x1E4F143B8];
  id v2 = (void *)MEMORY[0x1C18A51F0]();
  if (getCWFScanResultClass()
    && (uint64_t CWFScanResultPropertyOSSpecificAttributesKey = getCWFScanResultPropertyOSSpecificAttributesKey(), a1)
    && CWFScanResultPropertyOSSpecificAttributesKey
    && (CFDictionaryRef Copy = CFDictionaryCreateCopy((CFAllocatorRef)*MEMORY[0x1E4F1CF80], *(CFDictionaryRef *)(a1 + 16))) != 0)
  {
    CFDictionaryRef v5 = Copy;
    uint64_t v23 = v2;
    id v6 = (id)objc_msgSend((id)WiFiNetworkGetProperty(a1, @"HS20GasResponse"), "mutableCopy");
    [v6 setObject:0 forKeyedSubscript:@"ANQP_STATUS"];
    [v6 setObject:0 forKeyedSubscript:@"BSSID"];
    [v6 setObject:0 forKeyedSubscript:@"CHANNEL"];
    [v6 setObject:0 forKeyedSubscript:@"CHANNEL_FLAGS"];
    id v7 = (id)[(__CFDictionary *)v5 mutableCopy];
    [v7 setObject:v6 forKeyedSubscript:@"ANQP_PARSED"];
    uint64_t v8 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    uint64_t v9 = (void *)[MEMORY[0x1E4F5E330] supportedOSSpecificKeys];
    uint64_t v10 = [v9 countByEnumeratingWithState:&v28 objects:v33 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v29;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v29 != v12) {
            objc_enumerationMutation(v9);
          }
          objc_msgSend(v8, "setObject:forKeyedSubscript:", WiFiNetworkGetProperty(a1, *(void **)(*((void *)&v28 + 1) + 8 * i)), *(void *)(*((void *)&v28 + 1) + 8 * i));
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v28 objects:v33 count:16];
      }
      while (v11);
    }
    if ([v8 count]) {
      uint64_t v14 = v8;
    }
    else {
      uint64_t v14 = 0;
    }
    [v7 setObject:v14 forKeyedSubscript:getCWFScanResultPropertyOSSpecificAttributesKey()];
    v35[0] = @"IsWiFiNetworkShareble";
    v35[1] = @"NetworkOriginator";
    v35[2] = @"CaptiveBypass";
    v35[3] = @"DiagnosticsBssEnv";
    v35[4] = @"DisableWiFiAutoJoinUntilFirstUserJoin";
    v35[5] = @"DisplayedOperatorName";
    v35[6] = @"DomainName";
    v35[7] = @"HS20GasResponse";
    v35[8] = @"HS20HomeOperatorNetwork";
    v35[9] = @"HS20ProvisionedNetwork";
    v35[10] = @"HS2NetworkBadge";
    v35[11] = @"HS20AccountName";
    v35[12] = @"MCCandMNC";
    v35[13] = @"NaiRealmName";
    v35[14] = @"NetworkAtLocationOfInterestType";
    v35[15] = @"WiFiNetworkAttributeHighPopularity";
    v35[16] = @"WiFiNetworkAttributeHighQuality";
    v35[17] = @"WiFiNetworkAttributeIsMoving";
    v35[18] = @"WiFiNetworkAttributeIsPotentiallyCaptive";
    v35[19] = @"WiFiNetworkAttributeIsPotentiallyMoving";
    v35[20] = @"WiFiNetworkAttributeIsSuspicious";
    v35[21] = @"WiFiNetworkAttributeIsTCPGood";
    v35[22] = @"WiFiNetworkAttributeLowPopularity";
    v35[23] = @"WiFiNetworkAttributeLowQuality";
    v35[24] = @"WiFiNetworkAttributePopularityScore";
    v35[25] = @"WiFiNetworkAttributeProminentDisplay";
    v35[26] = @"WiFiNetworkAttributeQualityScore";
    v35[27] = @"WiFiNetworkAttributeSource";
    v35[28] = @"BundleIdentifier";
    v35[29] = @"SIMIdentifiers";
    v35[30] = @"WiFiNetworkDisabledUntilDate";
    v35[31] = @"EnterpriseProfile";
    v35[32] = @"WiFiNetworkExpirationDate";
    v35[33] = @"NetworkForcedHomeFix";
    v35[34] = @"kWiFiNetworkLastHomeForceFixDateKey";
    v35[35] = @"NetworkOfInterestHomeState";
    v35[36] = @"NetworkOfInterestWorkState";
    v35[37] = @"WiFiNetworkPasswordModificationDate";
    v35[38] = @"PayloadUUID";
    v35[39] = @"SaveDataMode";
    v35[40] = @"NetworkQualityResponsiveness";
    v35[41] = @"NetworkQualityDate";
    v35[42] = @"ShareableEAPConfig";
    v35[43] = @"ShareableEAPTrustExceptions";
    v35[44] = @"ShareableStatus";
    v35[45] = @"ShareMode";
    v35[46] = @"kWiFiNetworkSSIDHarvestStatusKey";
    v35[47] = @"UserRole";
    v35[48] = @"WalletIdentifier";
    v35[49] = @"addedAt";
    v35[50] = @"knownBSSUpdatedDate";
    v35[51] = @"lastAutoJoined";
    v35[52] = @"lastJoined";
    v35[53] = @"lastRoamed";
    v35[54] = @"lastUpdated";
    v35[55] = @"WiFiManagerKnownNetworksEventType";
    v35[56] = @"networkDisabledClientName";
    v35[57] = @"networkDisabledReason";
    v35[58] = @"networkDisabledTimestamp";
    v35[59] = @"enabled";
    v35[60] = @"networkKnownBSSListKey";
    v35[61] = @"scanWasDirected";
    v35[62] = @"prevJoined";
    v35[63] = @"UserDirected";
    v35[64] = @"networkUsage";
    v35[65] = @"RoamingConsortiumOIs";
    v35[66] = @"SPRoaming";
    v35[67] = @"PolicyUUID";
    v35[68] = @"PrivacyProxyEnabled";
    v35[69] = @"TransitionDisabledFlags";
    v35[70] = @"Standalone";
    v35[71] = @"PublicAirPlayNetwork";
    v35[72] = @"PrivacyProxyBlockedReason";
    v35[73] = @"FilteredNetwork";
    v35[74] = @"DNSFailures";
    uint64_t v15 = (void *)[MEMORY[0x1E4F1C978] arrayWithObjects:v35 count:75];
    if (MEMORY[0x1E4F57E00])
    {
      uint64_t v16 = *MEMORY[0x1E4F57E80];
      v34[0] = *MEMORY[0x1E4F57E38];
      v34[1] = v16;
      uint64_t v15 = objc_msgSend(v15, "arrayByAddingObjectsFromArray:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v34, 2));
    }
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    uint64_t v17 = [v15 countByEnumeratingWithState:&v24 objects:v32 count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v19 = *(void *)v25;
      do
      {
        for (uint64_t j = 0; j != v18; ++j)
        {
          if (*(void *)v25 != v19) {
            objc_enumerationMutation(v15);
          }
          [v7 setObject:0 forKeyedSubscript:*(void *)(*((void *)&v24 + 1) + 8 * j)];
        }
        uint64_t v18 = [v15 countByEnumeratingWithState:&v24 objects:v32 count:16];
      }
      while (v18);
    }
    uint64_t v21 = [objc_alloc((Class)getCWFScanResultClass()) initWithScanRecord:v7 includeProperties:0];
    CFRelease(v5);
  }
  else
  {
    return 0;
  }
  return v21;
}

uint64_t getCWFScanResultClass()
{
  uint64_t v3 = 0;
  CFArrayRef v4 = &v3;
  uint64_t v5 = 0x3052000000;
  id v6 = __Block_byref_object_copy_;
  id v7 = __Block_byref_object_dispose_;
  uint64_t v0 = getCWFScanResultClass_softClass;
  uint64_t v8 = getCWFScanResultClass_softClass;
  if (!getCWFScanResultClass_softClass)
  {
    v2[0] = MEMORY[0x1E4F143A8];
    v2[1] = 3221225472;
    _OWORD v2[2] = __getCWFScanResultClass_block_invoke;
    v2[3] = &unk_1E63F42B8;
    v2[4] = &v3;
    __getCWFScanResultClass_block_invoke((uint64_t)v2);
    uint64_t v0 = v4[5];
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_1BF2038FC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t getCWFScanResultPropertyOSSpecificAttributesKey()
{
  uint64_t v3 = 0;
  CFArrayRef v4 = &v3;
  uint64_t v5 = 0x2020000000;
  uint64_t v0 = getCWFScanResultPropertyOSSpecificAttributesKeySymbolLoc_ptr;
  uint64_t v6 = getCWFScanResultPropertyOSSpecificAttributesKeySymbolLoc_ptr;
  if (!getCWFScanResultPropertyOSSpecificAttributesKeySymbolLoc_ptr)
  {
    uint64_t v1 = (void *)CoreWiFiLibrary();
    v4[3] = (uint64_t)dlsym(v1, "CWFScanResultPropertyOSSpecificAttributesKey");
    getCWFScanResultPropertyOSSpecificAttributesKeySymbolLoc_ptr = v4[3];
    uint64_t v0 = v4[3];
  }
  _Block_object_dispose(&v3, 8);
  if (!v0) {
    getCWFScanResultPropertyOSSpecificAttributesKey_cold_1();
  }
  return *(void *)v0;
}

void sub_1BF2039F8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t WiFiNetworkCompareWithKnownNetwork(const __CFDictionary **a1, const __CFDictionary **a2)
{
  CFNumberRef Property = WiFiNetworkGetProperty((uint64_t)a1, @"WiFiNetworkNANServiceID");
  uint64_t v5 = WiFiNetworkGetProperty((uint64_t)a2, @"WiFiNetworkNANServiceID");
  if (Property) {
    BOOL v6 = v5 == 0;
  }
  else {
    BOOL v6 = 1;
  }
  if (!v6 && CFEqual(Property, v5)) {
    return 1;
  }
  uint64_t result = 0;
  if (a1 && a2)
  {
    if (__WiFiCompareSSIDorBSSID(a1[2], a2[2]))
    {
      if (WiFiNetworkIsHotspot20((BOOL)a1) && !WiFiNetworkIsHotspot20((BOOL)a2)
        || !WiFiNetworkIsHotspot20((BOOL)a1) && WiFiNetworkIsHotspot20((BOOL)a2))
      {
        return 0;
      }
      uint64_t result = __WiFiCompareBGScanParams(a1[2], a2[2]);
      if (!result) {
        return result;
      }
      int HaveSameDomain = __WiFiCompareDictionaryValues(a1[2], a2[2], @"AP_MODE");
      return HaveSameDomain != 0;
    }
    if (!__WiFiIsSameHS20Account(a1, a2, 0))
    {
      int HaveSameDomain = __WiFiHS20NetworksHaveSameDomain((uint64_t)a1, (uint64_t)a2);
      return HaveSameDomain != 0;
    }
    return 1;
  }
  return result;
}

void *WiFiNetworkCreateFromCoreWiFiScanResult(void *a1)
{
  id v2 = (void *)MEMORY[0x1C18A51F0]();
  uint64_t CWFScanResultClass = getCWFScanResultClass();
  if (a1
    && CWFScanResultClass
    && (getCWFScanResultClass(), objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    && (id v4 = (id)objc_msgSend((id)objc_msgSend(a1, "scanRecord"), "mutableCopy")) != 0
    && (uint64_t v5 = v4,
        objc_msgSend(v4, "addEntriesFromDictionary:", objc_msgSend(a1, "OSSpecificAttributes")),
        CFAllocatorRef v6 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80],
        (id v7 = WiFiNetworkCreate(*MEMORY[0x1E4F1CF80], v5)) != 0))
  {
    uint64_t v8 = v7;
    uint64_t v9 = (void *)[a1 matchingKnownNetworkProfile];
    if (v9)
    {
      uint64_t v10 = (CFDictionaryRef *)WiFiNetworkCreateFromCoreWiFiNetworkProfile(v9, 0);
      uint64_t v11 = v10;
      if (v10 && (CFDictionaryRef Copy = CFDictionaryCreateCopy(v6, v10[2])) != 0)
      {
        CFDictionaryRef v13 = Copy;
        id v14 = (id)[v5 copy];
        [v5 setDictionary:v13];
        [v5 addEntriesFromDictionary:v14];
        uint64_t v15 = WiFiNetworkCreate((int)v6, v5);
        CFRelease(v13);
      }
      else
      {
        uint64_t v15 = 0;
      }
    }
    else
    {
      uint64_t v15 = (void *)CFRetain(v8);
      uint64_t v11 = 0;
    }
    CFNumberRef Property = WiFiNetworkGetProperty((uint64_t)v11, @"WPA_IE");
    uint64_t v17 = WiFiNetworkGetProperty((uint64_t)v8, @"WPA_IE");
    uint64_t v18 = WiFiNetworkGetProperty((uint64_t)v11, @"RSN_IE");
    uint64_t v19 = WiFiNetworkGetProperty((uint64_t)v8, @"RSN_IE");
    if (v18 && Property && v19 && !v17) {
      WiFiNetworkSetProperty((uint64_t)v15, @"WPA_IE", 0);
    }
    if (!WiFiNetworkGetProperty((uint64_t)v8, @"BSSID")) {
      WiFiNetworkSetProperty((uint64_t)v15, @"BSSID", 0);
    }
    if (v11) {
      CFRelease(v11);
    }
    CFRelease(v8);
  }
  else
  {
    return 0;
  }
  return v15;
}

CFDictionaryRef WiFiNetworkGetApManufacturerName(const __CFDictionary *result)
{
  if (result)
  {
    uint64_t result = (const __CFDictionary *)WiFiNetworkGetProperty((uint64_t)result, @"WPS_PROB_RESP_IE");
    if (result)
    {
      uint64_t result = (const __CFDictionary *)CFDictionaryGetValue(result, @"IE_KEY_WPS_MANUFACTURER");
      if (result)
      {
        CFDictionaryRef v1 = result;
        CFTypeID TypeID = CFStringGetTypeID();
        if (TypeID == CFGetTypeID(v1)) {
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

CFDictionaryRef WiFiNetworkGetApModelName(const __CFDictionary *result)
{
  if (result)
  {
    uint64_t result = (const __CFDictionary *)WiFiNetworkGetProperty((uint64_t)result, @"WPS_PROB_RESP_IE");
    if (result)
    {
      uint64_t result = (const __CFDictionary *)CFDictionaryGetValue(result, @"IE_KEY_WPS_MODEL_NAME");
      if (result)
      {
        CFDictionaryRef v1 = result;
        CFTypeID TypeID = CFStringGetTypeID();
        if (TypeID == CFGetTypeID(v1)) {
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

CFDictionaryRef WiFiNetworkGetApModelNumber(const __CFDictionary *result)
{
  if (result)
  {
    uint64_t result = (const __CFDictionary *)WiFiNetworkGetProperty((uint64_t)result, @"WPS_PROB_RESP_IE");
    if (result)
    {
      uint64_t result = (const __CFDictionary *)CFDictionaryGetValue(result, @"IE_KEY_WPS_MODEL_NUM");
      if (result)
      {
        CFDictionaryRef v1 = result;
        CFTypeID TypeID = CFStringGetTypeID();
        if (TypeID == CFGetTypeID(v1)) {
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

uint64_t WiFiNetworkGetApDeviceVersion(uint64_t a1)
{
  if (a1) {
    WiFiNetworkGetProperty(a1, @"WPS_PROB_RESP_IE");
  }
  return 0;
}

CFDataRef WiFiNetworkCreatePrivateMacAddress(const __CFData *a1, const __CFData *a2, const __CFData *a3, CFStringRef theString)
{
  CFDataRef v4 = 0;
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  *(_OWORD *)md = 0u;
  long long v28 = 0u;
  *(void *)&long long v5 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v5 + 1) = 0xAAAAAAAAAAAAAAAALL;
  bytes[0] = v5;
  bytes[1] = v5;
  if (a1 && a3)
  {
    if (theString)
    {
      CFAllocatorRef v9 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
      CFDataRef ExternalRepresentation = CFStringCreateExternalRepresentation((CFAllocatorRef)*MEMORY[0x1E4F1CF80], theString, 0x8000100u, 0);
    }
    else
    {
      if (SecRandomCopyBytes((SecRandomRef)*MEMORY[0x1E4F3BC60], 0x20uLL, bytes)) {
        return 0;
      }
      CFAllocatorRef v9 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
      CFDataRef ExternalRepresentation = CFDataCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], (const UInt8 *)bytes, 32);
    }
    CFDataRef v11 = ExternalRepresentation;
    CFMutableArrayRef Mutable = CFDataCreateMutable(v9, 0);
    if (Mutable)
    {
      BytePtr = CFDataGetBytePtr(v11);
      id v14 = CFDataGetBytePtr(a1);
      uint64_t v15 = CFDataGetBytePtr(a3);
      if (a2) {
        uint64_t v16 = CFDataGetBytePtr(a2);
      }
      else {
        uint64_t v16 = 0;
      }
      CFIndex Length = CFDataGetLength(a1);
      CFDataAppendBytes(Mutable, v14, Length);
      CFDataAppendBytes(Mutable, v15, 6);
      CFIndex v18 = CFDataGetLength(v11);
      CFDataAppendBytes(Mutable, BytePtr, v18);
      if (a2 && v16)
      {
        CFIndex v19 = CFDataGetLength(a2);
        CFDataAppendBytes(Mutable, v16, v19);
      }
      CFIndex v20 = CFDataGetLength(a1);
      CFIndex v21 = v20 + CFDataGetLength(v11) + 6;
      if (a2) {
        LODWORD(v21) = CFDataGetLength(a2) + v21;
      }
      MutableBytePtr = CFDataGetMutableBytePtr(Mutable);
      *(void *)&v25.wbuf[14] = 0xAAAAAAAAAAAAAAAALL;
      *(void *)&long long v23 = 0xAAAAAAAAAAAAAAAALL;
      *((void *)&v23 + 1) = 0xAAAAAAAAAAAAAAAALL;
      *(_OWORD *)&v25.wbuf[6] = v23;
      *(_OWORD *)&v25.wbuf[10] = v23;
      *(_OWORD *)&v25.hash[6] = v23;
      *(_OWORD *)&v25.wbuf[2] = v23;
      *(_OWORD *)v25.count = v23;
      *(_OWORD *)&v25.hash[2] = v23;
      CC_SHA256_Init(&v25);
      CC_SHA256_Update(&v25, MutableBytePtr, v21);
      CC_SHA256_Final(md, &v25);
    }
    v25.count[0] = *(_DWORD *)md;
    LOWORD(v25.count[1]) = *(_WORD *)&md[4];
    LOBYTE(v25.count[0]) = md[0] & 0xFC | 2;
    CFDataRef v4 = CFDataCreate(v9, (const UInt8 *)&v25, 6);
    if (Mutable) {
      CFRelease(Mutable);
    }
    if (v11) {
      CFRelease(v11);
    }
  }
  return v4;
}

CFDataRef WiFiNetworkCreateForceNewPrivateMacAddress(const __CFData *a1, const __CFData *a2, CFStringRef theString)
{
  CFDataRef v3 = 0;
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  __int16 v22 = 0;
  *(_DWORD *)CFIndex v21 = 0;
  *(_OWORD *)md = 0u;
  long long v27 = 0u;
  *(void *)&long long v4 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v4 + 1) = 0xAAAAAAAAAAAAAAAALL;
  bytes[0] = v4;
  bytes[1] = v4;
  *(_OWORD *)long long v23 = v4;
  long long v24 = v4;
  if (a1 && a2)
  {
    if (theString)
    {
      CFAllocatorRef v7 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
      CFDataRef ExternalRepresentation = CFStringCreateExternalRepresentation((CFAllocatorRef)*MEMORY[0x1E4F1CF80], theString, 0x8000100u, 0);
      CFAllocatorRef v9 = (const __SecRandom *)*MEMORY[0x1E4F3BC60];
    }
    else
    {
      CFAllocatorRef v9 = (const __SecRandom *)*MEMORY[0x1E4F3BC60];
      if (SecRandomCopyBytes((SecRandomRef)*MEMORY[0x1E4F3BC60], 0x20uLL, v23)) {
        return 0;
      }
      CFAllocatorRef v7 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
      CFDataRef ExternalRepresentation = CFDataCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], v23, 32);
    }
    if (SecRandomCopyBytes(v9, 0x20uLL, bytes))
    {
      CFDataRef v3 = 0;
    }
    else
    {
      CFMutableArrayRef Mutable = CFDataCreateMutable(v7, 0);
      if (Mutable)
      {
        BytePtr = CFDataGetBytePtr(ExternalRepresentation);
        uint64_t v12 = CFDataGetBytePtr(a1);
        CFDictionaryRef v13 = CFDataGetBytePtr(a2);
        CFIndex Length = CFDataGetLength(a1);
        CFDataAppendBytes(Mutable, v12, Length);
        CFDataAppendBytes(Mutable, v13, 6);
        CFIndex v15 = CFDataGetLength(ExternalRepresentation);
        CFDataAppendBytes(Mutable, BytePtr, v15);
        CFDataAppendBytes(Mutable, (const UInt8 *)bytes, 32);
        int v16 = CFDataGetLength(a1);
        LODWORD(v13) = v16 + CFDataGetLength(ExternalRepresentation);
        MutableBytePtr = CFDataGetMutableBytePtr(Mutable);
        *(void *)&v20.wbuf[14] = 0xAAAAAAAAAAAAAAAALL;
        *(void *)&long long v18 = 0xAAAAAAAAAAAAAAAALL;
        *((void *)&v18 + 1) = 0xAAAAAAAAAAAAAAAALL;
        *(_OWORD *)&v20.wbuf[6] = v18;
        *(_OWORD *)&v20.wbuf[10] = v18;
        *(_OWORD *)&v20.hash[6] = v18;
        *(_OWORD *)&v20.wbuf[2] = v18;
        *(_OWORD *)v20.count = v18;
        *(_OWORD *)&v20.hash[2] = v18;
        CC_SHA256_Init(&v20);
        CC_SHA256_Update(&v20, MutableBytePtr, v13 + 38);
        CC_SHA256_Final(md, &v20);
      }
      *(_DWORD *)CFIndex v21 = *(_DWORD *)md;
      __int16 v22 = *(_WORD *)&md[4];
      v21[0] = md[0] & 0xFC | 2;
      CFDataRef v3 = CFDataCreate(v7, v21, 6);
      if (Mutable) {
        CFRelease(Mutable);
      }
    }
    if (ExternalRepresentation) {
      CFRelease(ExternalRepresentation);
    }
  }
  return v3;
}

CFDataRef WiFiNetworkCreateNetworkID(const __CFData *a1, const __CFString *a2)
{
  CFDataRef v2 = 0;
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  *(void *)&long long v3 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v3 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)bytes = v3;
  long long v20 = v3;
  *(_OWORD *)md = 0u;
  long long v18 = 0u;
  if (a1 && a2)
  {
    CFAllocatorRef v5 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
    CFDataRef ExternalRepresentation = CFStringCreateExternalRepresentation((CFAllocatorRef)*MEMORY[0x1E4F1CF80], a2, 0x8000100u, 0);
    CFMutableDataRef Mutable = CFDataCreateMutable(v5, 0);
    if (!Mutable)
    {
      *(_OWORD *)bytes = 0u;
      long long v20 = 0u;
      CFDataRef v2 = CFDataCreate(v5, bytes, 32);
      if (!ExternalRepresentation) {
        return v2;
      }
      goto LABEL_5;
    }
    uint64_t v8 = Mutable;
    BytePtr = CFDataGetBytePtr(ExternalRepresentation);
    uint64_t v10 = CFDataGetBytePtr(a1);
    CFDataAppendBytes(v8, v10, 6);
    CFIndex Length = CFDataGetLength(ExternalRepresentation);
    CFDataAppendBytes(v8, BytePtr, Length);
    int v12 = CFDataGetLength(ExternalRepresentation);
    MutableBytePtr = CFDataGetMutableBytePtr(v8);
    *(void *)&v16.wbuf[14] = 0xAAAAAAAAAAAAAAAALL;
    *(void *)&long long v14 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v14 + 1) = 0xAAAAAAAAAAAAAAAALL;
    *(_OWORD *)&v16.wbuf[6] = v14;
    *(_OWORD *)&v16.wbuf[10] = v14;
    *(_OWORD *)&v16.hash[6] = v14;
    *(_OWORD *)&v16.wbuf[2] = v14;
    *(_OWORD *)v16.count = v14;
    *(_OWORD *)&v16.hash[2] = v14;
    CC_SHA256_Init(&v16);
    CC_SHA256_Update(&v16, MutableBytePtr, v12 + 6);
    CC_SHA256_Final(md, &v16);
    *(_OWORD *)bytes = *(_OWORD *)md;
    long long v20 = v18;
    CFDataRef v2 = CFDataCreate(v5, bytes, 32);
    CFRelease(v8);
    if (ExternalRepresentation) {
LABEL_5:
    }
      CFRelease(ExternalRepresentation);
  }
  return v2;
}

uint64_t WiFiNetworkIsOpen(uint64_t result)
{
  if (result)
  {
    uint64_t v1 = result;
    return !WiFiNetworkIsEAP(result)
        && CFDictionaryGetValue(*(CFDictionaryRef *)(v1 + 16), @"WEP") != (const void *)*MEMORY[0x1E4F1CFD0]
        && !WiFiNetworkIsWPAWPA2PSK(v1)
        && !WiFiNetworkIsWAPI(v1)
        && !__WiFiNetworkIsSAE(*(const __CFDictionary **)(v1 + 16))
        && __WiFiNetworkIsOWEOnly(*(const __CFDictionary **)(v1 + 16)) == 0;
  }
  return result;
}

const void *WiFiPrivateMacNetworkGetMatchingNetwork(const __CFArray *a1, const void **a2)
{
  uint64_t result = 0;
  uint64_t v4 = 0;
  CFIndex idx = -1;
  if (a1 && a2)
  {
    WiFiGetPrivateMacNetworkIndices(a1, a2, &idx, &v4);
    if (idx == -1) {
      return 0;
    }
    else {
      return CFArrayGetValueAtIndex(a1, idx);
    }
  }
  return result;
}

void WiFiGetPrivateMacNetworkIndices(const __CFArray *a1, const void **a2, CFIndex *a3, void *a4)
{
  if (!a1) {
    goto LABEL_12;
  }
  CFIndex Count = CFArrayGetCount(a1);
  if (!Count) {
    goto LABEL_12;
  }
  if (!a2) {
    goto LABEL_18;
  }
  uint64_t v9 = Count;
  CFTypeID v10 = CFGetTypeID(a2);
  uint64_t v11 = __kWiFiNetworkTypeID;
  if (!__kWiFiNetworkTypeID)
  {
    pthread_once(&__wifiNetworkTypeInit, (void (*)(void))__WiFiNetworkRegister);
    uint64_t v11 = __kWiFiNetworkTypeID;
  }
  if (v10 != v11)
  {
LABEL_18:
    goto LABEL_12;
  }
  if (v9 < 1)
  {
LABEL_12:
    CFIndex v12 = -1;
    goto LABEL_13;
  }
  CFIndex v12 = 0;
  while (1)
  {
    CFDictionaryRef ValueAtIndex = (CFTypeRef *)CFArrayGetValueAtIndex(a1, v12);
    if (ValueAtIndex)
    {
      if (__WiFiCompareDictionaryValues(ValueAtIndex[2], a2[2], @"SSID_STR")) {
        break;
      }
    }
    if (v9 == ++v12) {
      goto LABEL_12;
    }
  }
LABEL_13:
  if (a4) {
    *a4 = 0;
  }
  if (a3) {
    *a3 = v12;
  }
}

uint64_t WiFiNetworkPrivateMacIsNetworkTrustworthy(uint64_t a1)
{
  if (a1) {
    return WiFiNetworkIsPublicAirPlayNetwork(a1) ^ 1;
  }
  else {
    return 1;
  }
}

BOOL WiFiNetworkPrivateMacNetworkType(CFDictionaryRef *a1)
{
  CoreWiFiNetworkProfile = WiFiNetworkCreateCoreWiFiNetworkProfile(a1);
  CoreWiFiScanResult = (void *)WiFiNetworkCreateCoreWiFiScanResult((uint64_t)a1);
  if ([CoreWiFiNetworkProfile isAllowedInLockdownMode]) {
    int v4 = [CoreWiFiScanResult isAllowedInLockdownMode] ^ 1;
  }
  else {
    LOBYTE(v4) = 1;
  }
  char v5 = [CoreWiFiNetworkProfile supportedSecurityTypes];
  if (CoreWiFiNetworkProfile) {
    CFRelease(CoreWiFiNetworkProfile);
  }
  if (CoreWiFiScanResult) {
    CFRelease(CoreWiFiScanResult);
  }
  BOOL v6 = WiFiNetworkIsCarPlay((uint64_t)a1) == 0;
  BOOL result = v6;
  if (v6) {
    char v8 = v4;
  }
  else {
    char v8 = 1;
  }
  if ((v8 & 1) == 0)
  {
    if (WiFiNetworkIsLegacyHotspot((uint64_t)a1)
      || WiFiNetworkIsHotspot20((BOOL)a1)
      || WiFiNetworkIsHotspot((uint64_t)a1)
      || WiFiNetworkIsPublicHotspot((uint64_t)a1))
    {
      return 1;
    }
    if (a1)
    {
      if (!CFDictionaryGetValue(a1[2], @"DomainName")
        && !CFDictionaryContainsKey(a1[2], @"BundleIdentifier")
        && !WiFiNetworkIsCarrierBundleBased((uint64_t)a1)
        && !WiFiNetworkGetProperty((uint64_t)a1, @"WalletIdentifier"))
      {
LABEL_25:
        if (!WiFiNetworkIsPublicAirPlayNetwork((uint64_t)a1)
          && !WiFiNetworkIsApplePersonalHotspot((uint64_t)a1))
        {
          return ((unint64_t)WiFiNetworkGetAccessoryIdentifier((uint64_t)a1) | v5 & 4 | v5 & 8) != 0;
        }
      }
    }
    else if (!WiFiNetworkIsCarrierBundleBased(0))
    {
      goto LABEL_25;
    }
    return 1;
  }
  return result;
}

BOOL WiFiNetworkIsAccessoryNetwork(uint64_t a1)
{
  return WiFiNetworkGetAccessoryIdentifier(a1) != 0;
}

uint64_t WiFiNetworkGetAuthTypes(uint64_t a1, __int32 *a2)
{
  CFDictionaryRef v4 = *(const __CFDictionary **)(a1 + 16);
  if (v4)
  {
    CFDictionaryRef Value = (const __CFDictionary *)CFDictionaryGetValue(v4, @"RSN_IE");
    CFDictionaryRef v6 = (const __CFDictionary *)CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 16), @"WPA_IE");
    if (Value)
    {
      BOOL v7 = __WiFiNetworkContainsAuthSelector(Value, 2) != 0;
      int v8 = __WiFiNetworkContainsAuthSelector(Value, 1);
      if (v8) {
        int v9 = (8 * v7) | 4;
      }
      else {
        int v9 = 8 * v7;
      }
      v35.i32[0] = v9;
      v35.i32[1] = v8 | (2 * v7);
      unsigned int v34 = __WiFiNetworkContainsAuthSelector(Value, 3) == 0;
      unsigned int v10 = __WiFiNetworkContainsAuthSelector(Value, 4) == 0;
      unsigned int v11 = __WiFiNetworkContainsAuthSelector(Value, 5) == 0;
      unsigned int v12 = __WiFiNetworkContainsAuthSelector(Value, 6) == 0;
      unsigned int v13 = __WiFiNetworkContainsAuthSelector(Value, 8) == 0;
      unsigned int v14 = __WiFiNetworkContainsAuthSelector(Value, 9) == 0;
      unsigned int v15 = __WiFiNetworkContainsAuthSelector(Value, 24) == 0;
      unsigned int v16 = __WiFiNetworkContainsAuthSelector(Value, 25) == 0;
      unsigned int v17 = __WiFiNetworkContainsAuthSelector(Value, 12) == 0;
      int8x8_t v18 = vbsl_s8((int8x8_t)vcltz_s32(vshl_n_s32(vdup_n_s32(v34), 0x1FuLL)), v35, vorr_s8(v35, (int8x8_t)0x400000080));
      int8x8_t v19 = vbsl_s8((int8x8_t)vcltz_s32(vshl_n_s32(vdup_n_s32(v10), 0x1FuLL)), v18, vorr_s8(v18, (int8x8_t)0x800000010));
      int8x8_t v20 = vbsl_s8((int8x8_t)vcltz_s32(vshl_n_s32(vdup_n_s32(v11), 0x1FuLL)), v19, vorr_s8(v19, (int8x8_t)0x1000000800));
      int8x8_t v21 = vbsl_s8((int8x8_t)vcltz_s32(vshl_n_s32(vdup_n_s32(v12), 0x1FuLL)), v20, vorr_s8(v20, (int8x8_t)0x2000000400));
      int8x8_t v22 = vbsl_s8((int8x8_t)vcltz_s32(vshl_n_s32(vdup_n_s32(v13), 0x1FuLL)), v21, vorr_s8(v21, (int8x8_t)0x8000001000));
      int8x8_t v23 = vbsl_s8((int8x8_t)vcltz_s32(vshl_n_s32(vdup_n_s32(v14), 0x1FuLL)), v22, vorr_s8(v22, (int8x8_t)0x10000002000));
      int8x8_t v24 = vbsl_s8((int8x8_t)vcltz_s32(vshl_n_s32(vdup_n_s32(v15), 0x1FuLL)), v23, vorr_s8(v23, (int8x8_t)0x80000000010000));
      int8x8_t v25 = vbsl_s8((int8x8_t)vcltz_s32(vshl_n_s32(vdup_n_s32(v16), 0x1FuLL)), v24, vorr_s8(v24, (int8x8_t)0x100000000020000));
      int8x8_t v26 = vbsl_s8((int8x8_t)vcltz_s32(vshl_n_s32(vdup_n_s32(v17), 0x1FuLL)), v25, vorr_s8(v25, (int8x8_t)0x80000004000));
      __int32 v27 = __WiFiNetworkContainsAuthSelector(Value, 13);
      v28.i32[0] = 0;
      v29.i32[0] = v27;
      int8x8_t v30 = vbsl_s8(vdup_lane_s8(vceq_s8(v29, v28), 0), v26, vorr_s8(v26, (int8x8_t)0x100000008000));
    }
    else
    {
      int8x8_t v30 = 0;
    }
    uint64_t v32 = v30.u32[0];
    __int32 v31 = v30.i32[1];
    if (v6)
    {
      if (__WiFiNetworkContainsAuthSelector(v6, 2)) {
        LODWORD(v32) = v32 | 2;
      }
      uint64_t v32 = v32 | __WiFiNetworkContainsAuthSelector(v6, 1);
    }
  }
  else
  {
    __int32 v31 = 0;
    uint64_t v32 = 0xFFFFLL;
  }
  if (a2) {
    *a2 = v31;
  }
  return v32;
}

uint64_t __WiFiNetworkContainsAuthSelector(const __CFDictionary *a1, int a2)
{
  CFArrayRef Value = (const __CFArray *)CFDictionaryGetValue(a1, @"IE_KEY_RSN_AUTHSELS");
  if (Value
    || (uint64_t result = (uint64_t)CFDictionaryGetValue(a1, @"IE_KEY_WPA_AUTHSELS"),
        (CFArrayRef Value = (const __CFArray *)result) != 0))
  {
    CFIndex Count = CFArrayGetCount(Value);
    if (Count < 1)
    {
      return 0;
    }
    else
    {
      CFIndex v7 = Count;
      CFIndex v8 = 0;
      while (1)
      {
        int valuePtr = -1431655766;
        CFNumberRef ValueAtIndex = (const __CFNumber *)CFArrayGetValueAtIndex(Value, v8);
        if (CFNumberGetValue(ValueAtIndex, kCFNumberSInt32Type, &valuePtr))
        {
          if (valuePtr == a2) {
            break;
          }
        }
        if (v7 == ++v8) {
          return 0;
        }
      }
      return 1;
    }
  }
  return result;
}

uint64_t WiFiNetworkIsProblematicForEncryptedDNS(const void *a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0;
  }
  unint64_t v2 = 0;
  long long v3 = &byte_1BF219E92;
  CFDictionaryRef v4 = MEMORY[0x1E4F14500];
  do
  {
    CFDataRef v5 = WiFiNetworkCopyBSSIDData((uint64_t)a1);
    if (v5)
    {
      CFDataRef v6 = v5;
      memset(buffer, 170, 6);
      v18.location = 0;
      v18.length = 6;
      CFDataGetBytes(v5, v18, buffer);
      if (buffer[0] == *(v3 - 2)
        && buffer[1] == *(v3 - 1)
        && buffer[2] == *v3)
      {
        if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
        {
          CFStringRef SSID = WiFiNetworkGetSSID(a1);
          *(_DWORD *)buf = 136315650;
          unsigned int v12 = "WiFiNetworkIsProblematicForEncryptedDNS";
          __int16 v13 = 2112;
          unsigned int v14 = SSID;
          __int16 v15 = 2112;
          CFDataRef v16 = v6;
          _os_log_impl(&dword_1BF1E6000, v4, OS_LOG_TYPE_DEFAULT, "%s: network %@ (%@) is known to be problematic for DoT/DoH", buf, 0x20u);
        }
        uint64_t v8 = 1;
      }
      else
      {
        uint64_t v8 = 0;
      }
      CFRelease(v6);
    }
    else
    {
      uint64_t v8 = 0;
    }
    if (v2 > 1) {
      break;
    }
    ++v2;
    v3 += 3;
  }
  while (!v8);
  return v8;
}

void WiFiNetworkAddSIMIdentifier(uint64_t a1, const void *a2)
{
  if (a1 && a2)
  {
    CFArrayRef Property = (const __CFArray *)WiFiNetworkGetProperty(a1, @"SIMIdentifiers");
    CFAllocatorRef v5 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
    if (Property) {
      CFArrayRef MutableCopy = CFArrayCreateMutableCopy(v5, 0, Property);
    }
    else {
      CFArrayRef MutableCopy = CFArrayCreateMutable(v5, 0, MEMORY[0x1E4F1D510]);
    }
    uint64_t v8 = MutableCopy;
    v10.length = CFArrayGetCount(MutableCopy);
    v10.location = 0;
    if (CFArrayGetFirstIndexOfValue(v8, v10, a2) == -1) {
      CFArrayAppendValue(v8, a2);
    }
    WiFiNetworkSetProperty(a1, @"SIMIdentifiers", v8);
    if (v8)
    {
      CFRelease(v8);
    }
  }
  else
  {
    CFIndex v7 = (void *)MEMORY[0x1C18A51F0]();
  }
}

void WiFiNetworkRemoveSIMIdentifier(uint64_t a1, const void *a2)
{
  if (a1 && a2)
  {
    CFArrayRef Property = (const __CFArray *)WiFiNetworkGetProperty(a1, @"SIMIdentifiers");
    CFAllocatorRef v5 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
    if (Property) {
      CFArrayRef MutableCopy = CFArrayCreateMutableCopy(v5, 0, Property);
    }
    else {
      CFArrayRef MutableCopy = CFArrayCreateMutable(v5, 0, MEMORY[0x1E4F1D510]);
    }
    CFArrayRef v8 = MutableCopy;
    v12.length = CFArrayGetCount(MutableCopy);
    v12.location = 0;
    FirstIndexOfCFArrayRef Value = CFArrayGetFirstIndexOfValue(v8, v12, a2);
    if (FirstIndexOfValue != -1) {
      CFArrayRemoveValueAtIndex(v8, FirstIndexOfValue);
    }
    if (CFArrayGetCount(v8)) {
      CFArrayRef v10 = v8;
    }
    else {
      CFArrayRef v10 = 0;
    }
    WiFiNetworkSetProperty(a1, @"SIMIdentifiers", v10);
    if (v8)
    {
      CFRelease(v8);
    }
  }
  else
  {
    CFIndex v7 = (void *)MEMORY[0x1C18A51F0]();
  }
}

void WiFiNetworkSetUserPreferredNetwork(uint64_t a1, CFDictionaryRef *a2, const void *a3)
{
  if (!a1 || !a2) {
    return;
  }
  if (CFDictionaryGetValue(a2[2], @"DomainName"))
  {
    HS20DomainName = WiFiNetworkGetHS20DomainName((uint64_t)a2);
    if (HS20DomainName)
    {
      CFIndex v7 = HS20DomainName;
      CFDictionaryRef Property = (const __CFDictionary *)WiFiNetworkGetProperty(a1, @"userPreferredPasspointDomains");
      CFAllocatorRef v9 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
      CFArrayRef v10 = Property
          ? CFDictionaryCreateMutableCopy(v9, 0, Property)
          : CFDictionaryCreateMutable(v9, 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
      CFDictionaryRef v16 = v10;
      if (v10)
      {
        if (a3) {
          CFDictionaryAddValue(v10, v7, a3);
        }
        else {
          CFDictionaryRemoveValue(v10, v7);
        }
        CFIndex Count = CFDictionaryGetCount(v16);
        CFRange v18 = @"userPreferredPasspointDomains";
        if (Count)
        {
LABEL_16:
          uint64_t v19 = a1;
          CFDictionaryRef v20 = v16;
LABEL_25:
          WiFiNetworkSetProperty(v19, v18, v20);
          CFRelease(v16);
          return;
        }
LABEL_24:
        uint64_t v19 = a1;
        CFDictionaryRef v20 = 0;
        goto LABEL_25;
      }
    }
  }
  else
  {
    CFStringRef SSID = WiFiNetworkGetSSID(a2);
    if (SSID)
    {
      CFRange v12 = SSID;
      CFDictionaryRef v13 = (const __CFDictionary *)WiFiNetworkGetProperty(a1, @"userPreferredNetworkNames");
      CFAllocatorRef v14 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
      __int16 v15 = v13
          ? CFDictionaryCreateMutableCopy(v14, 0, v13)
          : CFDictionaryCreateMutable(v14, 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
      CFDictionaryRef v16 = v15;
      if (v15)
      {
        if (a3) {
          CFDictionarySetValue(v15, v12, a3);
        }
        else {
          CFDictionaryRemoveValue(v15, v12);
        }
        CFIndex v21 = CFDictionaryGetCount(v16);
        CFRange v18 = @"userPreferredNetworkNames";
        if (v21) {
          goto LABEL_16;
        }
        goto LABEL_24;
      }
    }
  }
}

const void *WiFiNetworkGetUserPreferredTimestamp(uint64_t a1, CFDictionaryRef *a2)
{
  if (!a1 || !a2) {
    return 0;
  }
  if (CFDictionaryGetValue(a2[2], @"DomainName"))
  {
    HS20DomainName = WiFiNetworkGetHS20DomainName((uint64_t)a2);
    if (HS20DomainName)
    {
      CFAllocatorRef v5 = HS20DomainName;
      CFDataRef v6 = @"userPreferredPasspointDomains";
      goto LABEL_8;
    }
    return 0;
  }
  CFStringRef SSID = WiFiNetworkGetSSID(a2);
  if (!SSID) {
    return 0;
  }
  CFAllocatorRef v5 = SSID;
  CFDataRef v6 = @"userPreferredNetworkNames";
LABEL_8:
  CFDictionaryRef Property = (const __CFDictionary *)WiFiNetworkGetProperty(a1, v6);
  if (!Property) {
    return 0;
  }

  return CFDictionaryGetValue(Property, v5);
}

void WiFiNetworkSetPrivacyProxyEnabled(uint64_t a1, int a2)
{
  if (a1)
  {
    unint64_t v2 = (const void **)MEMORY[0x1E4F1CFD0];
    if (!a2) {
      unint64_t v2 = (const void **)MEMORY[0x1E4F1CFC8];
    }
    long long v3 = *v2;
    WiFiNetworkSetProperty(a1, @"PrivacyProxyEnabled", v3);
  }
  else
  {
    CFDictionaryRef v4 = (void *)MEMORY[0x1C18A51F0]();
  }
}

void WiFiNetworkSetPrivacyProxyBlockedReason(uint64_t a1, const void *a2)
{
  if (a1)
  {
    WiFiNetworkSetProperty(a1, @"PrivacyProxyBlockedReason", a2);
  }
  else
  {
    unint64_t v2 = (void *)MEMORY[0x1C18A51F0]();
  }
}

BOOL WiFiNetworkIsPriorityNetwork(uint64_t a1)
{
  CFAllocatorRef v2 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
  CFDateRef v4 = CFDateCreate(v2, Current);
  CFDateRef Property = (const __CFDate *)WiFiNetworkGetProperty(a1, @"lastJoined");
  double TimeIntervalSinceDate = CFDateGetTimeIntervalSinceDate(v4, Property);
  if (WiFiNetworkGetNetworkOfInterestWorkType(a1) == 1
    || WiFiNetworkGetNetworkOfInterestHomeType(a1) == 1
    || (!MEMORY[0x1E4F57E00]
     || CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 16), (const void *)*MEMORY[0x1E4F57E38]) != (const void *)*MEMORY[0x1E4F1CFD0])
    && !WiFiNetworkGetProperty(a1, @"WiFiNetworkAttributeIsPublic")
    && !WiFiNetworkIsCarrierBundleBased(a1))
  {
    BOOL v7 = 1;
    if (!v4) {
      return v7;
    }
LABEL_4:
    CFRelease(v4);
    return v7;
  }
  BOOL v7 = TimeIntervalSinceDate < 86400.0 && TimeIntervalSinceDate > -1.0;
  if (v4) {
    goto LABEL_4;
  }
  return v7;
}

BOOL WiFiNetworkIsPriorityNetworkWrapper(uint64_t a1)
{
  if (!_os_feature_enabled_impl()) {
    return 1;
  }

  return WiFiNetworkIsPriorityNetwork(a1);
}

uint64_t WiFiNetworkIsPublicNetwork(CFDictionaryRef *a1)
{
  if (WiFiNetworkGetProperty((uint64_t)a1, @"WiFiNetworkAttributeIsPublic")) {
    return 1;
  }
  uint64_t result = (uint64_t)WiFiNetworkInterworkingIsOutdoorNetwork(a1);
  if (result) {
    return 1;
  }
  return result;
}

BOOL WiFiNetworkIsLowQualityNetwork(uint64_t a1)
{
  return WiFiNetworkGetProperty(a1, @"WiFiNetworkAttributeIsLowQuality") != 0;
}

void WiFiNetworkSetPublicAirPlayNetwork(uint64_t a1, int a2)
{
  if (a1)
  {
    CFAllocatorRef v2 = (const void **)MEMORY[0x1E4F1CFD0];
    if (!a2) {
      CFAllocatorRef v2 = (const void **)MEMORY[0x1E4F1CFC8];
    }
    long long v3 = *v2;
    WiFiNetworkSetProperty(a1, @"PublicAirPlayNetwork", v3);
  }
  else
  {
    CFDateRef v4 = (void *)MEMORY[0x1C18A51F0]();
  }
}

void *WiFiNetworkIs6EModeOff(uint64_t a1)
{
  if (a1)
  {
    uint64_t result = (void *)WiFiNetworkGetProperty(a1, (void *)*MEMORY[0x1E4F5E2C0]);
    if (result) {
      return (void *)(objc_msgSend((id)objc_msgSend(result, "objectForKey:", *MEMORY[0x1E4F5E2E8]), "integerValue") == 2);
    }
  }
  else
  {
    return 0;
  }
  return result;
}

void WiFiNetworkSetDisplayFriendlyName(uint64_t a1, const void *a2)
{
  if (a1)
  {
    WiFiNetworkSetProperty(a1, @"DisplayFriendlyName", a2);
  }
  else
  {
    CFAllocatorRef v2 = (void *)MEMORY[0x1C18A51F0]();
  }
}

const void *WiFiNetworkGetDisplayFriendlyName(uint64_t a1)
{
  if (a1)
  {
    return WiFiNetworkGetProperty(a1, @"DisplayFriendlyName");
  }
  else
  {
    return 0;
  }
}

void WiFiNetworkSetAccessoryIdentifier(uint64_t a1, const void *a2)
{
  if (a1)
  {
    WiFiNetworkSetProperty(a1, @"AccessoryIdentifier", a2);
  }
  else
  {
    CFAllocatorRef v2 = (void *)MEMORY[0x1C18A51F0]();
  }
}

const void *WiFiNetworkGetAccessoryIdentifier(uint64_t a1)
{
  if (a1)
  {
    return WiFiNetworkGetProperty(a1, @"AccessoryIdentifier");
  }
  else
  {
    return 0;
  }
}

BOOL WiFiNetworkSupportsSlowWiFiRecovery(uint64_t a1)
{
  return WiFiNetworkGetAccessoryIdentifier(a1) == 0;
}

BOOL WiFiNetworkSupportsDPSRecovery(uint64_t a1)
{
  return WiFiNetworkGetAccessoryIdentifier(a1) == 0;
}

BOOL __WiFiNetworkEqual(void *a1, void *a2)
{
  uint64_t v2 = 0;
  if (a1)
  {
    long long v3 = a2;
    if (a2)
    {
      CFDateRef v4 = a1;
      CFTypeID v5 = CFGetTypeID(a1);
      uint64_t v6 = __kWiFiNetworkTypeID;
      if (!__kWiFiNetworkTypeID)
      {
        pthread_once(&__wifiNetworkTypeInit, (void (*)(void))__WiFiNetworkRegister);
        uint64_t v6 = __kWiFiNetworkTypeID;
      }
      if (v5 == v6) {
        BOOL v7 = v4;
      }
      else {
        BOOL v7 = 0;
      }
      CFTypeID v8 = CFGetTypeID(v3);
      uint64_t v9 = __kWiFiNetworkTypeID;
      if (!__kWiFiNetworkTypeID)
      {
        pthread_once(&__wifiNetworkTypeInit, (void (*)(void))__WiFiNetworkRegister);
        uint64_t v9 = __kWiFiNetworkTypeID;
      }
      if (v8 == v9) {
        CFArrayRef v10 = v3;
      }
      else {
        CFArrayRef v10 = 0;
      }
      CFTypeID TypeID = CFDictionaryGetTypeID();
      if (TypeID != CFGetTypeID(v4))
      {
        uint64_t v12 = __kWiFiNetworkTypeID;
        if (!__kWiFiNetworkTypeID)
        {
          pthread_once(&__wifiNetworkTypeInit, (void (*)(void))__WiFiNetworkRegister);
          uint64_t v12 = __kWiFiNetworkTypeID;
        }
        if (v12 == CFGetTypeID(v4)) {
          CFDateRef v4 = (void *)v4[2];
        }
        else {
          CFDateRef v4 = 0;
        }
      }
      CFTypeID v13 = CFDictionaryGetTypeID();
      if (v13 != CFGetTypeID(v3))
      {
        uint64_t v14 = __kWiFiNetworkTypeID;
        if (!__kWiFiNetworkTypeID)
        {
          pthread_once(&__wifiNetworkTypeInit, (void (*)(void))__WiFiNetworkRegister);
          uint64_t v14 = __kWiFiNetworkTypeID;
        }
        if (v14 != CFGetTypeID(v3)) {
          return 0;
        }
        long long v3 = (void *)v3[2];
      }
      uint64_t v2 = 0;
      if (v4)
      {
        if (v3)
        {
          if (__WiFiCompareSSIDorBSSID(v4, v3))
          {
            if (WiFiNetworkIsHotspot20((BOOL)v7) && !WiFiNetworkIsHotspot20((BOOL)v10)
              || !WiFiNetworkIsHotspot20((BOOL)v7) && WiFiNetworkIsHotspot20((BOOL)v10))
            {
              return 0;
            }
            if (!__WiFiCompareBGScanParams((const __CFDictionary *)v4, (const __CFDictionary *)v3)
              || !__WiFiCompareDictionaryValues(v4, v3, @"AP_MODE"))
            {
              return 0;
            }
            int AuthFlags = __WiFiNetworkGetAuthFlags((const __CFDictionary *)v4);
            int v42 = __WiFiNetworkGetAuthFlags((const __CFDictionary *)v3);
            int v15 = __WiFiNetworkIsSAE((const __CFDictionary *)v4)
               && !__WiFiNetworkSupportsWPA((const __CFDictionary *)v4)
               && __WiFiNetworkSupportsWPA2((const __CFDictionary *)v4) == 0;
            int v24 = __WiFiNetworkIsSAE((const __CFDictionary *)v3)
               && !__WiFiNetworkSupportsWPA((const __CFDictionary *)v3)
               && __WiFiNetworkSupportsWPA2((const __CFDictionary *)v3) == 0;
            unsigned int v44 = __WiFiNetworkIsOWEOnly((const __CFDictionary *)v4);
            unsigned int v45 = __WiFiNetworkIsOWEOnly((const __CFDictionary *)v3);
            unint64_t Value = (unint64_t)CFDictionaryGetValue((CFDictionaryRef)v4, @"ALLOW_WPA2_PSK");
            unint64_t v26 = (unint64_t)CFDictionaryGetValue((CFDictionaryRef)v3, @"ALLOW_WPA2_PSK");
            unint64_t v27 = (unint64_t)CFDictionaryGetValue((CFDictionaryRef)v4, @"ALLOW_OWE_TSN");
            unint64_t v28 = (unint64_t)CFDictionaryGetValue((CFDictionaryRef)v3, @"ALLOW_OWE_TSN");
            int v29 = (Value | v27) == 0;
            int v30 = (v26 | v28) == 0;
            if (v29 != v30)
            {
              unint64_t v31 = v28;
              if (v15) {
                BOOL v32 = WiFiNetworkGetOperatingBand((uint64_t)v7) != 3;
              }
              else {
                BOOL v32 = 0;
              }
              if (v24)
              {
                BOOL v41 = v32;
                int OperatingBand = WiFiNetworkGetOperatingBand((uint64_t)v10);
                BOOL v20 = Value == *MEMORY[0x1E4F1CFD0];
                unsigned int v34 = (const void *)*MEMORY[0x1E4F1CFD0];
                if (v20)
                {
                  BOOL v32 = v41;
                  if (OperatingBand != 3) {
                    return 0;
                  }
                }
                else
                {
                  BOOL v32 = v41;
                }
              }
              else
              {
                unsigned int v34 = (const void *)*MEMORY[0x1E4F1CFD0];
              }
              if ((const void *)v26 == v34 && v32) {
                return 0;
              }
              if ((v29 & v15) == 1)
              {
                int v35 = WiFiNetworkGetOperatingBand((uint64_t)v7);
                int v36 = AuthFlags;
                if (v35 == 3) {
                  int v36 = AuthFlags | 2;
                }
                int AuthFlags = v36;
              }
              if ((v30 & v24) == 1)
              {
                int v37 = WiFiNetworkGetOperatingBand((uint64_t)v10);
                int v38 = v42;
                if (v37 == 3) {
                  int v38 = v42 | 2;
                }
                int v42 = v38;
              }
              BOOL v39 = v44 && WiFiNetworkGetOperatingBand((uint64_t)v7) != 3;
              if (v45)
              {
                int v40 = WiFiNetworkGetOperatingBand((uint64_t)v10);
                if ((const void *)v27 == v34 && v40 != 3) {
                  return 0;
                }
              }
              if ((const void *)v31 == v34 && v39) {
                return 0;
              }
LABEL_59:
              if (!AuthFlags || !v42 || (v42 & AuthFlags) != 0) {
                return (AuthFlags == 0) ^ (v42 != 0);
              }
              return 0;
            }
            uint64_t v2 = 0;
            if (v15 == v24 && v44 == v45) {
              goto LABEL_59;
            }
          }
          else
          {
            CFNumberRef Property = (const __CFNumber *)WiFiNetworkGetProperty((uint64_t)v7, @"networkRole");
            Intunint64_t Value = _CFTypeGetIntValue(Property);
            CFNumberRef v18 = (const __CFNumber *)WiFiNetworkGetProperty((uint64_t)v10, @"networkRole");
            unsigned int v19 = _CFTypeGetIntValue(v18);
            BOOL v20 = (IntValue & 0xFFFFFFFE) == 2 || IntValue == 4;
            if (v20 || v19 - 2 <= 2)
            {
              return IntValue == v19;
            }
            else
            {
              uint64_t v2 = 1;
              if (!__WiFiIsSameHS20Account(v7, v10, 1))
              {
                CFStringRef SSID = (const __CFString *)WiFiNetworkGetSSID(v7);
                if (CFStringGetLength(SSID)) {
                  return 0;
                }
                CFStringRef v22 = (const __CFString *)WiFiNetworkGetSSID(v10);
                if (CFStringGetLength(v22)) {
                  return 0;
                }
                return __WiFiHS20NetworksHaveSameDomain((uint64_t)v7, (uint64_t)v10) != 0;
              }
            }
          }
        }
      }
    }
  }
  return v2;
}

CFHashCode __WiFiNetworkHash(const void *a1)
{
  if (!a1) {
    return 0;
  }
  CFStringRef SSID = WiFiNetworkGetSSID(a1);
  if (!SSID) {
    return 0;
  }

  return CFHash(SSID);
}

CFStringRef __WiFiNetworkCopyDesc(const __CFDictionary **cf)
{
  valuePtr[0] = 0;
  if (!cf) {
    return @"Invalid network ref";
  }
  uint64_t v2 = __kWiFiNetworkTypeID;
  if (!__kWiFiNetworkTypeID)
  {
    pthread_once(&__wifiNetworkTypeInit, (void (*)(void))__WiFiNetworkRegister);
    uint64_t v2 = __kWiFiNetworkTypeID;
  }
  if (v2 != CFGetTypeID(cf)) {
    return @"Invalid network ref";
  }
  CFNumberRef Channel = (const __CFNumber *)WiFiNetworkGetChannel((uint64_t)cf, v3);
  if (Channel) {
    CFNumberGetValue(Channel, kCFNumberSInt32Type, valuePtr);
  }
  CFAllocatorRef v31 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  CFStringRef SSID = WiFiNetworkGetSSID(cf);
  unsigned int DirectedState = WiFiNetworkGetDirectedState(cf);
  BOOL IsEAP = WiFiNetworkIsEAP((uint64_t)cf);
  unsigned int v27 = __WiFiNetworkIsSAE(cf[2]);
  BOOL v26 = WiFiNetworkIsWPAWPA2PSK((uint64_t)cf) != 0;
  BOOL v25 = CFDictionaryGetValue(cf[2], @"WEP") == (const void *)*MEMORY[0x1E4F1CFD0];
  CFNumberRef WAPIPolicy = __WiFiNetworkGetWAPIPolicy(cf[2]);
  uint64_t Type = WiFiNetworkGetType((uint64_t)cf);
  CFNumberRef Property = WiFiNetworkGetProperty((uint64_t)cf, @"enabled");
  CFIndex v21 = WiFiNetworkGetProperty((uint64_t)cf, @"SaveDataMode");
  BOOL v20 = WiFiNetworkGetProperty((uint64_t)cf, @"NetworkQualityResponsiveness");
  CFTypeID v5 = WiFiNetworkGetProperty((uint64_t)cf, @"NetworkQualityDate");
  NetworkOfInterestHomeuint64_t Type = WiFiNetworkGetNetworkOfInterestHomeType((uint64_t)cf);
  BOOL v7 = @"Unknown";
  if (NetworkOfInterestHomeType == 1) {
    BOOL v7 = @"Home";
  }
  if (NetworkOfInterestHomeType == 2) {
    CFTypeID v8 = @"Not Home";
  }
  else {
    CFTypeID v8 = v7;
  }
  unsigned int ForcedHomeFix = WiFiNetworkGetForcedHomeFix((uint64_t)cf);
  CFArrayRef v10 = WiFiNetworkGetProperty((uint64_t)cf, @"TransitionDisabledFlags");
  unsigned int v11 = WiFiNetworkFoundNanIe((uint64_t)cf);
  unsigned int IsApplePersonalHotspot = WiFiNetworkIsApplePersonalHotspot((uint64_t)cf);
  IsPublicAirPlayNetworuint64_t k = WiFiNetworkIsPublicAirPlayNetwork((uint64_t)cf);
  unsigned int v14 = WiFiNetworkIs6EModeOff((uint64_t)cf);
  BOOL IsHotspot20 = WiFiNetworkIsHotspot20((BOOL)cf);
  CFDictionaryRef v16 = cf[2];
  uint64_t v17 = valuePtr[0];
  int v18 = CFDictionaryContainsKey(v16, @"BundleIdentifier");
  return CFStringCreateWithFormat(v31, 0, @"%@: isHidden=%d, isEAP=%d, isSAE=%d, isWPA=%d, isWEP=%d, WAPI=%d, type=%d, enabled=%@, saveData=%@, responsiveness=%@ (%@) isHome=%@, isForceFixed=%d, transitionDisabledFlags=%@, foundNanIe=%d, isPH=%d, isPublicAirPlayNetwork=%d, is6EDisabled=%d, hs20=%d, Channel=%d, isBundleIdentifierPresent=%d", SSID, DirectedState, IsEAP, v27, v26, v25, WAPIPolicy, Type, Property, v21, v20, v5, v8, ForcedHomeFix, v10, v11,
           IsApplePersonalHotspot,
           IsPublicAirPlayNetwork,
           v14,
           IsHotspot20,
           v17,
           v18 != 0);
}

uint64_t __WiFiIsSameHS20Account(const void *a1, const void *a2, int a3)
{
  uint64_t v3 = 0;
  if (a1 && a2)
  {
    if (WiFiNetworkIsHotspot20((BOOL)a1) && WiFiNetworkIsHotspot20((BOOL)a2))
    {
      CFStringRef SSID = (const __CFString *)WiFiNetworkGetSSID(a1);
      CFStringRef v8 = (const __CFString *)WiFiNetworkGetSSID(a2);
      CFStringRef Property = (const __CFString *)WiFiNetworkGetProperty((uint64_t)a1, @"HS20AccountName");
      CFStringRef v10 = (const __CFString *)WiFiNetworkGetProperty((uint64_t)a2, @"HS20AccountName");
      CFStringRef HS20DomainName = (const __CFString *)WiFiNetworkGetHS20DomainName((uint64_t)a1);
      CFStringRef v12 = (const __CFString *)WiFiNetworkGetHS20DomainName((uint64_t)a2);
      if (SSID && v10 && CFEqual(SSID, v10)
        || v8 && Property && CFEqual(v8, Property))
      {
        return 1;
      }
      if (Property && v10 && HS20DomainName && v12 && CFEqual(HS20DomainName, v12)) {
        goto LABEL_19;
      }
      if (!a3)
      {
        uint64_t v3 = 0;
        goto LABEL_23;
      }
      if (WiFiNetworkIsScannedNetworkMatchingHS20Account((uint64_t)a1, (uint64_t)a2)
        || WiFiNetworkIsScannedNetworkMatchingHS20Account((uint64_t)a2, (uint64_t)a1))
      {
LABEL_19:
        uint64_t v3 = 1;
LABEL_23:
        return v3;
      }
    }
    return 0;
  }
  return v3;
}

uint64_t __WiFiCompareBGScanParams(const __CFDictionary *a1, const __CFDictionary *a2)
{
  if (CFDictionaryGetValue(a1, @"forceBGScanParamsCompare") != (const void *)*MEMORY[0x1E4F1CFD0])
  {
    CFDateRef v4 = (const void *)*MEMORY[0x1E4F1CFD0];
    if (CFDictionaryGetValue(a2, @"forceBGScanParamsCompare") != v4) {
      return 1;
    }
  }
  uint64_t result = __WiFiCompareDictionaryValues(a1, a2, @"BSSID");
  if (result)
  {
    uint64_t result = __WiFiCompareDictionaryValues(a1, a2, @"ENTRY_NETWORK");
    if (result)
    {
      return __WiFiCompareDictionaryValues(a1, a2, @"EXIT_NETWORK");
    }
  }
  return result;
}

void __Block_byref_object_copy_(uint64_t a1, uint64_t a2)
{
}

void __Block_byref_object_dispose_(uint64_t a1)
{
}

Class __getCWFNetworkProfileClass_block_invoke(uint64_t a1)
{
  CoreWiFiLibrary();
  Class result = objc_getClass("CWFNetworkProfile");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40)) {
    __getCWFNetworkProfileClass_block_invoke_cold_1();
  }
  getCWFNetworkProfileClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  return result;
}

uint64_t CoreWiFiLibrary()
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  v2[0] = 0;
  if (!CoreWiFiLibraryCore_frameworkLibrary)
  {
    v2[1] = (void *)MEMORY[0x1E4F143A8];
    _OWORD v2[2] = (void *)3221225472;
    v2[3] = __CoreWiFiLibraryCore_block_invoke;
    v2[4] = &__block_descriptor_40_e5_v8__0l;
    void v2[5] = v2;
    long long v3 = xmmword_1E63F42D8;
    uint64_t v4 = 0;
    CoreWiFiLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  uint64_t v0 = CoreWiFiLibraryCore_frameworkLibrary;
  if (!CoreWiFiLibraryCore_frameworkLibrary) {
    CoreWiFiLibrary_cold_1(v2);
  }
  if (v2[0]) {
    free(v2[0]);
  }
  return v0;
}

uint64_t __CoreWiFiLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  CoreWiFiLibraryCore_frameworkLibrary = result;
  return result;
}

Class __getCWFBSSClass_block_invoke(uint64_t a1)
{
  CoreWiFiLibrary();
  Class result = objc_getClass("CWFBSS");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40)) {
    __getCWFBSSClass_block_invoke_cold_1();
  }
  getCWFBSSClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  return result;
}

Class __getCWFChannelClass_block_invoke(uint64_t a1)
{
  CoreWiFiLibrary();
  Class result = objc_getClass("CWFChannel");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40)) {
    __getCWFChannelClass_block_invoke_cold_1();
  }
  getCWFChannelClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  return result;
}

Class __getCLLocationClass_block_invoke(uint64_t a1)
{
  CoreLocationLibrary();
  Class result = objc_getClass("CLLocation");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40)) {
    __getCLLocationClass_block_invoke_cold_1();
  }
  getCLLocationClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  return result;
}

uint64_t CoreLocationLibrary()
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  v2[0] = 0;
  if (!CoreLocationLibraryCore_frameworkLibrary)
  {
    v2[1] = (void *)MEMORY[0x1E4F143A8];
    _OWORD v2[2] = (void *)3221225472;
    v2[3] = __CoreLocationLibraryCore_block_invoke;
    v2[4] = &__block_descriptor_40_e5_v8__0l;
    void v2[5] = v2;
    long long v3 = xmmword_1E63F42F0;
    uint64_t v4 = 0;
    CoreLocationLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  uint64_t v0 = CoreLocationLibraryCore_frameworkLibrary;
  if (!CoreLocationLibraryCore_frameworkLibrary) {
    CoreLocationLibrary_cold_1(v2);
  }
  if (v2[0]) {
    free(v2[0]);
  }
  return v0;
}

uint64_t __CoreLocationLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  CoreLocationLibraryCore_frameworkLibrary = result;
  return result;
}

void *__getCLLocationCoordinate2DMakeSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)CoreLocationLibrary();
  uint64_t result = dlsym(v2, "CLLocationCoordinate2DMake");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getCLLocationCoordinate2DMakeSymbolLoc_ptr = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

Class __getCWFScanResultClass_block_invoke(uint64_t a1)
{
  CoreWiFiLibrary();
  Class result = objc_getClass("CWFScanResult");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40)) {
    __getCWFScanResultClass_block_invoke_cold_1();
  }
  getCWFScanResultClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  return result;
}

void *__getCWFScanResultPropertyOSSpecificAttributesKeySymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)CoreWiFiLibrary();
  Class result = dlsym(v2, "CWFScanResultPropertyOSSpecificAttributesKey");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getCWFScanResultPropertyOSSpecificAttributesKeySymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8)
                                                                           + 24);
  return result;
}

uint64_t WiFiSecurityCopyPasswordWithTimeout(const void *a1, BOOL *a2, double a3)
{
  uint64_t v18 = 0;
  unsigned int v19 = &v18;
  uint64_t v20 = 0x2020000000;
  uint64_t v21 = 0;
  if (a1)
  {
    if (MKBGetDeviceLockState() == 1 && !MKBUserUnlockedSinceBoot())
    {
    }
    else
    {
      uint64_t v6 = dispatch_semaphore_create(0);
      uint64_t v14 = 0;
      int v15 = &v14;
      uint64_t v16 = 0x2020000000;
      char v17 = 0;
      CFRetain(a1);
      global_queue = dispatch_get_global_queue(0, 0);
      v13[0] = MEMORY[0x1E4F143A8];
      v13[1] = 3221225472;
      v13[2] = __WiFiSecurityCopyPasswordWithTimeout_block_invoke;
      v13[3] = &unk_1E63F4310;
      v13[6] = &v14;
      v13[7] = a1;
      v13[4] = v6;
      v13[5] = &v18;
      dispatch_async(global_queue, v13);
      dispatch_time_t v8 = dispatch_time(0, (uint64_t)(a3 * 1000000000.0));
      BOOL v9 = dispatch_semaphore_wait(v6, v8) != 0;
      CFStringRef v10 = v15;
      *((unsigned char *)v15 + 24) = v9;
      *a2 = v9;
      if (*((unsigned char *)v10 + 24)) {
      dispatch_release(v6);
      }
      _Block_object_dispose(&v14, 8);
    }
  }
  uint64_t v11 = v19[3];
  _Block_object_dispose(&v18, 8);
  return v11;
}

void sub_1BF2068A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 80), 8);
  _Unwind_Resume(a1);
}

intptr_t __WiFiSecurityCopyPasswordWithTimeout_block_invoke(uint64_t a1)
{
  CFTypeRef result = 0;
  Query = __WiFiSecurityCreateQuery(*(const void **)(a1 + 56), 0, 0, 0, 0, 1);
  long long v3 = Query;
  if (!Query || (!SecItemCopyMatching(Query, &result) ? (BOOL v4 = result == 0) : (BOOL v4 = 1), v4)) {
  else
  }
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = CFStringCreateFromExternalRepresentation((CFAllocatorRef)*MEMORY[0x1E4F1CF80], (CFDataRef)result, 0x8000100u);
  if (result)
  {
    CFRelease(result);
    CFTypeRef result = 0;
  }
  if (v3) {
    CFRelease(v3);
  }
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24))
  {
    uint64_t v5 = *(const void **)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
    if (v5)
    {
      CFRelease(v5);
      *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
    }
  }
  CFRelease(*(CFTypeRef *)(a1 + 56));
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

__CFDictionary *__WiFiSecurityCreateQuery(const void *a1, const void *a2, const void *a3, int a4, int a5, int a6)
{
  if (a1)
  {
    CFMutableDataRef Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, 0, 0);
    CFTypeID v13 = Mutable;
    if (Mutable)
    {
      CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x1E4F3B978], (const void *)*MEMORY[0x1E4F3B988]);
      CFDictionarySetValue(v13, (const void *)*MEMORY[0x1E4F3B5C0], a1);
      CFDictionarySetValue(v13, (const void *)*MEMORY[0x1E4F3B850], @"AirPort");
      CFDictionarySetValue(v13, (const void *)*MEMORY[0x1E4F3B878], (const void *)*MEMORY[0x1E4F3B880]);
      if (a2) {
        CFDictionarySetValue(v13, (const void *)*MEMORY[0x1E4F3B788], a2);
      }
      if (a3) {
        CFDictionarySetValue(v13, (const void *)*MEMORY[0x1E4F3B678], a3);
      }
      uint64_t v14 = (const void **)MEMORY[0x1E4F1CFD0];
      if (a6) {
        CFDictionarySetValue(v13, (const void *)*MEMORY[0x1E4F3BD20], (const void *)*MEMORY[0x1E4F1CFD0]);
      }
      if (!a4) {
        CFDictionarySetValue(v13, (const void *)*MEMORY[0x1E4F3BC70], *v14);
      }
      if (a5) {
        CFDictionarySetValue(v13, (const void *)*MEMORY[0x1E4F3BC68], *v14);
      }
    }
    else
    {
    }
  }
  else
  {
    return 0;
  }
  return v13;
}

CFStringRef WiFiSecurityCopyPassword(__CFString *a1)
{
  CFStringRef result = __WiFiSecurityCopyPassword(a1, 1);
  if (!result)
  {
    long long v3 = getprogname();
    if (!strncmp("sharingd", v3, 8uLL)
      || (BOOL v4 = getprogname(), !strncmp("HPSetup", v4, 7uLL))
      || (uint64_t v5 = getprogname(), !strncmp("HDSViewService", v5, 0xEuLL)))
    {
      return WiFiSecurityCopyPasswordFromPasswordBackup(a1);
    }
    else
    {
      return 0;
    }
  }
  return result;
}

CFStringRef __WiFiSecurityCopyPassword(const __CFString *a1, int a2)
{
  CFStringRef v2 = a1;
  if (a1)
  {
    if (MKBGetDeviceLockState() == 1 && !MKBUserUnlockedSinceBoot())
    {
      return 0;
    }
    else
    {
      Query = __WiFiSecurityCreateQuery(v2, 0, 0, 0, 0, a2);
      uint64_t v5 = Query;
      CFTypeRef result = 0;
      if (Query && !SecItemCopyMatching(Query, &result) && result)
      {
        CFStringRef v2 = CFStringCreateFromExternalRepresentation((CFAllocatorRef)*MEMORY[0x1E4F1CF80], (CFDataRef)result, 0x8000100u);
      }
      else
      {
        CFStringRef v2 = 0;
      }
      if (result)
      {
        CFRelease(result);
        CFTypeRef result = 0;
      }
      if (v5) {
        CFRelease(v5);
      }
    }
  }
  return v2;
}

CFStringRef WiFiSecurityCopyPasswordFromPasswordBackup(void *a1)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  CFStringRef v2 = (void *)MEMORY[0x1C18A51F0]();
  CFTypeRef result = 0;
  if (a1)
  {
    if ([a1 length])
    {
      long long v3 = WiFiSecurityCopySSIDHashForPasswordBackup(a1);
      BOOL v4 = v3;
      if (v3 && [v3 length])
      {
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315650;
          uint64_t v16 = "WiFiSecurityCopyPasswordFromPasswordBackup";
          __int16 v17 = 2112;
          uint64_t v18 = a1;
          __int16 v19 = 2112;
          uint64_t v20 = v4;
          _os_log_impl(&dword_1BF1E6000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%s: ssid %@ (%@)", buf, 0x20u);
        }
        uint64_t v5 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
        [v5 setObject:*MEMORY[0x1E4F3B988] forKey:*MEMORY[0x1E4F3B978]];
        [v5 setObject:v4 forKey:*MEMORY[0x1E4F3B5C0]];
        [v5 setObject:@"AirPort" forKey:*MEMORY[0x1E4F3B850]];
        [v5 setObject:MEMORY[0x1E4F1CC38] forKey:*MEMORY[0x1E4F3BC70]];
        OSStatus v6 = SecItemCopyMatching((CFDictionaryRef)v5, &result);
        if (!v6 && result)
        {
          CFStringRef v7 = CFStringCreateFromExternalRepresentation((CFAllocatorRef)*MEMORY[0x1E4F1CF80], (CFDataRef)result, 0x8000100u);
          goto LABEL_14;
        }
        if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_13;
        }
        *(_DWORD *)buf = 136315650;
        uint64_t v16 = "WiFiSecurityCopyPasswordFromPasswordBackup";
        __int16 v17 = 2112;
        uint64_t v18 = v4;
        __int16 v19 = 1024;
        LODWORD(v20) = v6;
        dispatch_time_t v8 = MEMORY[0x1E4F14500];
        uint64_t v9 = "%s:[%@] error result %d \n";
        uint32_t v10 = 28;
      }
      else
      {
        if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_13;
        }
        *(_DWORD *)buf = 136315138;
        uint64_t v16 = "WiFiSecurityCopyPasswordFromPasswordBackup";
        dispatch_time_t v8 = MEMORY[0x1E4F14500];
        uint64_t v9 = "%s: error: empty ssid hash";
        uint32_t v10 = 12;
      }
      _os_log_impl(&dword_1BF1E6000, v8, OS_LOG_TYPE_DEFAULT, v9, buf, v10);
LABEL_13:
      CFStringRef v7 = 0;
      goto LABEL_14;
    }
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      uint64_t v16 = "WiFiSecurityCopyPasswordFromPasswordBackup";
      CFStringRef v12 = MEMORY[0x1E4F14500];
      CFTypeID v13 = "%s: error: empty ssid";
      goto LABEL_23;
    }
  }
  else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    uint64_t v16 = "WiFiSecurityCopyPasswordFromPasswordBackup";
    CFStringRef v12 = MEMORY[0x1E4F14500];
    CFTypeID v13 = "%s: null ssid";
LABEL_23:
    _os_log_impl(&dword_1BF1E6000, v12, OS_LOG_TYPE_DEFAULT, v13, buf, 0xCu);
  }
  CFStringRef v7 = 0;
  BOOL v4 = 0;
LABEL_14:

  if (result) {
    CFRelease(result);
  }
  return v7;
}

CFStringRef WiFiSecurityCopyLegacyPassword(const __CFString *a1)
{
  return __WiFiSecurityCopyPassword(a1, 0);
}

CFTypeRef WiFiSecurityCopyPasswordModificationDate(const void *a1)
{
  CFTypeRef result = 0;
  if (a1)
  {
    if (MKBGetDeviceLockState() == 1 && !MKBUserUnlockedSinceBoot())
    {
      CFTypeRef v5 = 0;
      long long v3 = 0;
    }
    else
    {
      Query = __WiFiSecurityCreateQuery(a1, 0, 0, 0, 1, 1);
      long long v3 = Query;
      if (Query && !SecItemCopyMatching(Query, &result) && result)
      {
        unint64_t Value = CFDictionaryGetValue((CFDictionaryRef)result, (const void *)*MEMORY[0x1E4F3B790]);
        CFTypeRef v5 = CFRetain(Value);
      }
      else
      {
        CFTypeRef v5 = 0;
      }
    }
    if (result)
    {
      CFRelease(result);
      CFTypeRef result = 0;
    }
    if (v3) {
      CFRelease(v3);
    }
  }
  else
  {
    return 0;
  }
  return v5;
}

BOOL WiFiSecuritySetPasswordWithTimeout(const void *a1, const __CFString *a2, BOOL *a3, double a4)
{
  BOOL v22 = 0;
  if (!a1 || !a2 || !CFStringGetLength(a2))
  {
    return 0;
  }
  CFAllocatorRef v8 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  CFDataRef ExternalRepresentation = CFStringCreateExternalRepresentation((CFAllocatorRef)*MEMORY[0x1E4F1CF80], a2, 0x8000100u, 0);
  CFStringRef v10 = (const __CFString *)WiFiSecurityCopyPasswordWithTimeout(a1, &v22, a4);
  CFStringRef v11 = v10;
  BOOL v12 = v22;
  if (v22)
  {
    *a3 = 1;
    BOOL v13 = 0;
    if (!v11) {
      goto LABEL_21;
    }
LABEL_20:
    CFRelease(v11);
    goto LABEL_21;
  }
  if (v10)
  {
    if (CFEqual(a2, v10))
    {
      *a3 = v12;
      BOOL v13 = 1;
      goto LABEL_20;
    }
    Query = __WiFiSecurityCreateQuery(a1, 0, 0, 1, 0, 1);
    if (!Query)
    {
      BOOL v13 = 0;
      goto LABEL_20;
    }
    CFDictionaryRef v15 = Query;
    CFMutableDataRef Mutable = CFDictionaryCreateMutable(v8, 0, 0, 0);
    CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x1E4F3BD38], ExternalRepresentation);
    CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x1E4F3B788], a1);
    CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x1E4F3B678], @"AirPort network password");
    uint64_t v17 = SecItemUpdate(v15, Mutable);
    int v18 = v17;
    if (Mutable) {
      CFRelease(Mutable);
    }
  }
  else
  {
    __int16 v19 = __WiFiSecurityCreateQuery(a1, a1, @"AirPort network password", 1, 0, 1);
    if (!v19)
    {
      BOOL v13 = 0;
      if (!ExternalRepresentation) {
        return v13;
      }
      goto LABEL_22;
    }
    CFDictionaryRef v15 = v19;
    unint64_t v21 = 0xAAAAAAAAAAAAAAAALL;
    CFDictionarySetValue(v19, (const void *)*MEMORY[0x1E4F3BD38], ExternalRepresentation);
    CFDictionarySetValue(v15, (const void *)*MEMORY[0x1E4F3B558], (const void *)*MEMORY[0x1E4F3B570]);
    CFDictionarySetValue(v15, (const void *)*MEMORY[0x1E4F3B878], (const void *)*MEMORY[0x1E4F1CFD0]);
    uint64_t v17 = SecItemAdd(v15, (CFTypeRef *)&v21);
    int v18 = v17;
  }
  *a3 = v12;
  BOOL v13 = v18 == 0;
  if (v18) {
  else
  }
    notify_post("com.apple.wifid.WiFiPasswordChanged");
  CFRelease(v15);
  if (v11) {
    goto LABEL_20;
  }
LABEL_21:
  if (ExternalRepresentation) {
LABEL_22:
  }
    CFRelease(ExternalRepresentation);
  return v13;
}

BOOL WiFiSecuritySetPassword(BOOL a1, const __CFString *a2)
{
  return __WiFiSecuritySetPassword(a1, a2, 1);
}

BOOL __WiFiSecuritySetPassword(BOOL a1, CFStringRef theString, int a3)
{
  BOOL v3 = a1;
  if (!a1)
  {
    return v3;
  }
  if (!theString || !CFStringGetLength(theString))
  {
    return 0;
  }
  CFAllocatorRef v6 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  CFDataRef ExternalRepresentation = CFStringCreateExternalRepresentation((CFAllocatorRef)*MEMORY[0x1E4F1CF80], theString, 0x8000100u, 0);
  CFStringRef v8 = WiFiSecurityCopyPassword((__CFString *)v3);
  if (v8)
  {
    if (CFStringCompare(theString, v8, 0))
    {
      Query = __WiFiSecurityCreateQuery((const void *)v3, 0, 0, 1, 0, a3);
      if (Query)
      {
        CFDictionaryRef v10 = Query;
        CFMutableDataRef Mutable = CFDictionaryCreateMutable(v6, 0, 0, 0);
        CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x1E4F3BD38], ExternalRepresentation);
        CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x1E4F3B788], (const void *)v3);
        CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x1E4F3B678], @"AirPort network password");
        OSStatus v12 = SecItemUpdate(v10, Mutable);
        if (Mutable) {
          CFRelease(Mutable);
        }
        goto LABEL_11;
      }
      BOOL v3 = 0;
    }
    else
    {
      BOOL v3 = 1;
    }
LABEL_17:
    CFRelease(v8);
    goto LABEL_18;
  }
  BOOL v13 = __WiFiSecurityCreateQuery((const void *)v3, (const void *)v3, @"AirPort network password", 1, 0, a3);
  if (!v13)
  {
    BOOL v3 = 0;
    if (!ExternalRepresentation) {
      return v3;
    }
    goto LABEL_19;
  }
  CFDictionaryRef v10 = v13;
  CFTypeRef result = (CFTypeRef)0xAAAAAAAAAAAAAAAALL;
  CFDictionarySetValue(v13, (const void *)*MEMORY[0x1E4F3BD38], ExternalRepresentation);
  CFDictionarySetValue(v10, (const void *)*MEMORY[0x1E4F3B558], (const void *)*MEMORY[0x1E4F3B570]);
  CFDictionarySetValue(v10, (const void *)*MEMORY[0x1E4F3B878], (const void *)*MEMORY[0x1E4F1CFD0]);
  OSStatus v12 = SecItemAdd(v10, &result);
LABEL_11:
  BOOL v3 = v12 == 0;
  if (v12) {
  else
  }
    notify_post("com.apple.wifid.WiFiPasswordChanged");
  CFRelease(v10);
  if (v8) {
    goto LABEL_17;
  }
LABEL_18:
  if (ExternalRepresentation) {
LABEL_19:
  }
    CFRelease(ExternalRepresentation);
  return v3;
}

BOOL WiFiSecuritySetLegacyPassword(BOOL a1, const __CFString *a2)
{
  return __WiFiSecuritySetPassword(a1, a2, 0);
}

uint64_t WiFiSecurityRemovePassword(const void *a1)
{
  return __WiFiSecurityRemovePassword(a1, 1);
}

uint64_t __WiFiSecurityRemovePassword(const void *a1, int a2)
{
  if (a1
    && (Query = __WiFiSecurityCreateQuery(a1, 0, 0, 0, 0, a2)) != 0
    && (v3 = Query, OSStatus v4 = SecItemDelete(Query), CFRelease(v3), !v4))
  {
    notify_post("com.apple.wifid.WiFiPasswordChanged");
    return 1;
  }
  else
  {
    return 0;
  }
}

uint64_t WiFiSecurityRemoveLegacyPassword(const void *a1)
{
  return __WiFiSecurityRemovePassword(a1, 0);
}

uint64_t WiFiSecurityIsPasswordSyncing(const void *a1)
{
  CFTypeRef result = 0;
  if (!a1)
  {
    return 0;
  }
  if (MKBGetDeviceLockState() == 1 && !MKBUserUnlockedSinceBoot())
  {
    uint64_t v5 = 0;
    BOOL v3 = 0;
    goto LABEL_11;
  }
  Query = __WiFiSecurityCreateQuery(a1, 0, 0, 0, 1, 1);
  BOOL v3 = Query;
  if (!Query || SecItemCopyMatching(Query, &result) || !result)
  {
    goto LABEL_10;
  }
  CFBooleanRef Value = (const __CFBoolean *)CFDictionaryGetValue((CFDictionaryRef)result, (const void *)*MEMORY[0x1E4F3B878]);
  if (!Value)
  {
LABEL_10:
    uint64_t v5 = 0;
    goto LABEL_11;
  }
  uint64_t v5 = CFBooleanGetValue(Value);
LABEL_11:
  if (result)
  {
    CFRelease(result);
    CFTypeRef result = 0;
  }
  if (v3) {
    CFRelease(v3);
  }
  return v5;
}

BOOL WiFiSecuritySetPasswordSyncable(__CFString *a1, int a2)
{
  if (!a1 || (CFStringRef v4 = WiFiSecurityCopyPassword(a1)) == 0)
  {
    return 0;
  }
  CFStringRef v5 = v4;
  Query = __WiFiSecurityCreateQuery(a1, 0, 0, 0, 0, 1);
  if (!Query)
  {
    CFRelease(v5);
    return 0;
  }
  CFStringRef v7 = Query;
  CFMutableDataRef Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, 0, 0);
  if (Mutable)
  {
    CFDictionaryRef v9 = Mutable;
    CFDictionaryRef v10 = (const void **)MEMORY[0x1E4F1CFC8];
    if (a2) {
      CFDictionaryRef v10 = (const void **)MEMORY[0x1E4F1CFD0];
    }
    CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x1E4F3B878], *v10);
    CFDictionaryRemoveValue(v7, (const void *)*MEMORY[0x1E4F3BC70]);
    OSStatus v11 = SecItemUpdate(v7, v9);
    BOOL v12 = v11 == 0;
    if (v11) {
    CFRelease(v9);
    }
  }
  else
  {
    BOOL v12 = 0;
  }
  CFRelease(v5);
  CFRelease(v7);
  return v12;
}

__CFString *WiFiSecurityCopyHashedWPAPassword(const __CFString *a1, const __CFData *a2)
{
  CFMutableDataRef Mutable = 0;
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if (a1 && a2)
  {
    *(_OWORD *)bytes = 0u;
    long long v11 = 0u;
    CFStringGetCStringPtr(a1, 0x8000100u);
    CFDataGetBytePtr(a2);
    CFDataGetLength(a2);
    if (Apple80211ParseWPAPassword()) {
      return 0;
    }
    CFAllocatorRef v4 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
    CFDataRef v5 = CFDataCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], bytes, 32);
    if (!v5)
    {
      return 0;
    }
    else
    {
      CFDataRef v6 = v5;
      BytePtr = CFDataGetBytePtr(v5);
      if (CFDataGetLength(v6) == 32)
      {
        CFMutableDataRef Mutable = CFStringCreateMutable(v4, 64);
        for (uint64_t i = 0; i != 32; ++i)
          CFStringAppendFormat(Mutable, 0, @"%02x", BytePtr[i]);
      }
      else
      {
        CFMutableDataRef Mutable = 0;
      }
      CFRelease(v6);
    }
  }
  return Mutable;
}

CFTypeRef WiFiSecurityCopyAttributesForAllAirPortEntries()
{
  CFTypeRef result = 0;
  if ((MKBGetDeviceLockState() != 1 || MKBUserUnlockedSinceBoot())
    && (CFMutableDataRef Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, 0, 0)) != 0)
  {
    uint64_t v1 = Mutable;
    CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x1E4F3B978], (const void *)*MEMORY[0x1E4F3B988]);
    CFDictionarySetValue(v1, (const void *)*MEMORY[0x1E4F3BB80], (const void *)*MEMORY[0x1E4F3BB88]);
    CFDictionarySetValue(v1, (const void *)*MEMORY[0x1E4F3B850], @"AirPort");
    CFDictionarySetValue(v1, (const void *)*MEMORY[0x1E4F3B878], (const void *)*MEMORY[0x1E4F3B880]);
    CFStringRef v2 = (const void *)*MEMORY[0x1E4F1CFD0];
    CFDictionarySetValue(v1, (const void *)*MEMORY[0x1E4F3BC68], (const void *)*MEMORY[0x1E4F1CFD0]);
    CFDictionarySetValue(v1, (const void *)*MEMORY[0x1E4F3BD20], v2);
    if (SecItemCopyMatching(v1, &result))
    {
      if (result) {
    }
      }
    CFRelease(v1);
    return result;
  }
  else
  {
    return 0;
  }
}

CFStringRef WiFiSecurityCopyNonSyncablePassword(const void *a1)
{
  CFTypeRef result = 0;
  if (!a1) {
    return 0;
  }
  if (MKBGetDeviceLockState() == 1 && !MKBUserUnlockedSinceBoot())
  {
    CFAllocatorRef v4 = 0;
    goto LABEL_13;
  }
  CFAllocatorRef v2 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  CFMutableDataRef Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, 0, 0);
  CFAllocatorRef v4 = Mutable;
  if (!Mutable)
  {
LABEL_13:
    CFStringRef v7 = 0;
    goto LABEL_14;
  }
  CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x1E4F3B978], (const void *)*MEMORY[0x1E4F3B988]);
  CFDictionarySetValue(v4, (const void *)*MEMORY[0x1E4F3B5C0], a1);
  CFDictionarySetValue(v4, (const void *)*MEMORY[0x1E4F3B850], @"AirPort");
  CFDataRef v5 = (const void *)*MEMORY[0x1E4F1CFD0];
  CFDictionarySetValue(v4, (const void *)*MEMORY[0x1E4F3BD20], (const void *)*MEMORY[0x1E4F1CFD0]);
  CFDictionarySetValue(v4, (const void *)*MEMORY[0x1E4F3BC70], v5);
  if (SecItemCopyMatching(v4, &result)) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = result == 0;
  }
  if (v6)
  {
    goto LABEL_13;
  }
  CFStringRef v7 = CFStringCreateFromExternalRepresentation(v2, (CFDataRef)result, 0x8000100u);
LABEL_14:
  if (result)
  {
    CFRelease(result);
    CFTypeRef result = 0;
  }
  if (v4) {
    CFRelease(v4);
  }
  return v7;
}

uint64_t WiFiSecurityCopyNonSyncablePasswordWithTimeout(const void *a1, BOOL *a2, double a3)
{
  uint64_t v18 = 0;
  __int16 v19 = &v18;
  uint64_t v20 = 0x2020000000;
  uint64_t v21 = 0;
  if (a1)
  {
    if (MKBGetDeviceLockState() == 1 && !MKBUserUnlockedSinceBoot())
    {
    }
    else
    {
      BOOL v6 = dispatch_semaphore_create(0);
      uint64_t v14 = 0;
      CFDictionaryRef v15 = &v14;
      uint64_t v16 = 0x2020000000;
      char v17 = 0;
      CFRetain(a1);
      global_queue = dispatch_get_global_queue(0, 0);
      v13[0] = MEMORY[0x1E4F143A8];
      v13[1] = 3221225472;
      v13[2] = __WiFiSecurityCopyNonSyncablePasswordWithTimeout_block_invoke;
      v13[3] = &unk_1E63F4310;
      v13[6] = &v14;
      v13[7] = a1;
      v13[4] = v6;
      v13[5] = &v18;
      dispatch_async(global_queue, v13);
      dispatch_time_t v8 = dispatch_time(0, (uint64_t)(a3 * 1000000000.0));
      BOOL v9 = dispatch_semaphore_wait(v6, v8) != 0;
      CFDictionaryRef v10 = v15;
      *((unsigned char *)v15 + 24) = v9;
      *a2 = v9;
      if (*((unsigned char *)v10 + 24)) {
      dispatch_release(v6);
      }
      _Block_object_dispose(&v14, 8);
    }
  }
  uint64_t v11 = v19[3];
  _Block_object_dispose(&v18, 8);
  return v11;
}

void sub_1BF207EF4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 80), 8);
  _Unwind_Resume(a1);
}

intptr_t __WiFiSecurityCopyNonSyncablePasswordWithTimeout_block_invoke(uint64_t a1)
{
  CFTypeRef result = 0;
  CFAllocatorRef v2 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  CFMutableDataRef Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, 0, 0);
  CFAllocatorRef v4 = Mutable;
  if (!Mutable
    || ((CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x1E4F3B978], (const void *)*MEMORY[0x1E4F3B988]),
         CFDictionarySetValue(v4, (const void *)*MEMORY[0x1E4F3B5C0], *(const void **)(a1 + 56)),
         CFDictionarySetValue(v4, (const void *)*MEMORY[0x1E4F3B850], @"AirPort"),
         CFDataRef v5 = (const void *)*MEMORY[0x1E4F1CFD0],
         CFDictionarySetValue(v4, (const void *)*MEMORY[0x1E4F3BD20], (const void *)*MEMORY[0x1E4F1CFD0]),
         CFDictionarySetValue(v4, (const void *)*MEMORY[0x1E4F3BC70], v5),
         !SecItemCopyMatching(v4, &result))
      ? (BOOL v6 = result == 0)
      : (BOOL v6 = 1),
        v6))
  {
  }
  else
  {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = CFStringCreateFromExternalRepresentation(v2, (CFDataRef)result, 0x8000100u);
  }
  if (result)
  {
    CFRelease(result);
    CFTypeRef result = 0;
  }
  if (v4) {
    CFRelease(v4);
  }
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24))
  {
    CFStringRef v7 = *(const void **)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
    if (v7)
    {
      CFRelease(v7);
      *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
    }
  }
  CFRelease(*(CFTypeRef *)(a1 + 56));
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void *WiFiSecurityCopySSIDHashForPasswordBackup(void *a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  CFAllocatorRef v2 = (void *)MEMORY[0x1C18A51F0]();
  *(void *)&long long v3 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v3 + 1) = 0xAAAAAAAAAAAAAAAALL;
  macOut[0] = v3;
  macOut[1] = v3;
  CFAllocatorRef v4 = (const char *)[a1 cStringUsingEncoding:4];
  size_t v5 = strlen(v4);
  CCHmac(2u, "CURRENT_NETWORK", 0xFuLL, v4, v5, macOut);
  BOOL v6 = (void *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithCapacity:64];
  for (uint64_t i = 0; i != 32; ++i)
    objc_msgSend(v6, "appendFormat:", @"%02x", *((unsigned __int8 *)macOut + i));
  return v6;
}

BOOL WiFiSecuritySavePasswordForPasswordBackup(uint64_t a1, uint64_t a2)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  CFAllocatorRef v4 = (void *)MEMORY[0x1C18A51F0]();
  size_t v5 = dispatch_semaphore_create(0);
  uint64_t v12 = 0;
  BOOL v13 = &v12;
  uint64_t v14 = 0x2020000000;
  int v15 = 0;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __WiFiSecuritySavePasswordForPasswordBackup_block_invoke;
  v11[3] = &unk_1E63F4338;
  v11[4] = a1;
  v11[5] = a2;
  v11[6] = v5;
  v11[7] = &v12;
  dispatch_async(MEMORY[0x1E4F14428], v11);
  dispatch_time_t v6 = dispatch_time(0, 1000000000);
  intptr_t v7 = dispatch_semaphore_wait(v5, v6);
  BOOL v8 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT);
  if (v7)
  {
    if (v8)
    {
      *(_DWORD *)buf = 136315394;
      char v17 = "WiFiSecuritySavePasswordForPasswordBackup";
      __int16 v18 = 2112;
      uint64_t v19 = a1;
      _os_log_impl(&dword_1BF1E6000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%s:[%@] timed out\n", buf, 0x16u);
    }
    BOOL v9 = 0;
  }
  else
  {
    if (v8)
    {
      *(_DWORD *)buf = 136315394;
      char v17 = "WiFiSecuritySavePasswordForPasswordBackup";
      __int16 v18 = 2112;
      uint64_t v19 = a1;
      _os_log_impl(&dword_1BF1E6000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%s:[%@] completed\n", buf, 0x16u);
    }
    BOOL v9 = *((_DWORD *)v13 + 6) == 0;
  }
  dispatch_release(v5);
  _Block_object_dispose(&v12, 8);
  return v9;
}

intptr_t __WiFiSecuritySavePasswordForPasswordBackup_block_invoke(uint64_t a1)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  CFTypeRef result = (CFTypeRef)0xAAAAAAAAAAAAAAAALL;
  CFAllocatorRef v2 = *(void **)(a1 + 32);
  if (!v2)
  {
    if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_28;
    }
    *(_DWORD *)buf = 136315138;
    uint64_t v19 = "WiFiSecuritySavePasswordForPasswordBackup_block_invoke";
    BOOL v13 = MEMORY[0x1E4F14500];
    uint64_t v14 = "%s: null ssid";
LABEL_24:
    uint32_t v15 = 12;
LABEL_27:
    _os_log_impl(&dword_1BF1E6000, v13, OS_LOG_TYPE_DEFAULT, v14, buf, v15);
    goto LABEL_28;
  }
  if (!*(void *)(a1 + 40))
  {
    if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_28;
    }
    *(_DWORD *)buf = 136315138;
    uint64_t v19 = "WiFiSecuritySavePasswordForPasswordBackup_block_invoke";
    BOOL v13 = MEMORY[0x1E4F14500];
    uint64_t v14 = "%s: null password";
    goto LABEL_24;
  }
  if (![v2 length])
  {
    if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_28;
    }
    *(_DWORD *)buf = 136315138;
    uint64_t v19 = "WiFiSecuritySavePasswordForPasswordBackup_block_invoke";
    BOOL v13 = MEMORY[0x1E4F14500];
    uint64_t v14 = "%s: error: empty ssid";
    goto LABEL_24;
  }
  if (![*(id *)(a1 + 40) length])
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v16 = *(void **)(a1 + 32);
      *(_DWORD *)buf = 136315394;
      uint64_t v19 = "WiFiSecuritySavePasswordForPasswordBackup_block_invoke";
      __int16 v20 = 2112;
      uint64_t v21 = v16;
      BOOL v13 = MEMORY[0x1E4F14500];
      uint64_t v14 = "%s: error: empty password for ssid %@";
      uint32_t v15 = 22;
      goto LABEL_27;
    }
LABEL_28:
    CFAllocatorRef v4 = 0;
    goto LABEL_15;
  }
  long long v3 = WiFiSecurityCopySSIDHashForPasswordBackup(*(void **)(a1 + 32));
  CFAllocatorRef v4 = v3;
  if (!v3 || ![v3 length])
  {
    if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_15;
    }
    *(_DWORD *)buf = 136315138;
    uint64_t v19 = "WiFiSecuritySavePasswordForPasswordBackup_block_invoke";
    BOOL v9 = MEMORY[0x1E4F14500];
    uint64_t v10 = "%s: error: empty ssid hash";
    uint32_t v11 = 12;
    goto LABEL_14;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    size_t v5 = *(void **)(a1 + 32);
    *(_DWORD *)buf = 136315650;
    uint64_t v19 = "WiFiSecuritySavePasswordForPasswordBackup_block_invoke";
    __int16 v20 = 2112;
    uint64_t v21 = v5;
    __int16 v22 = 2112;
    int8x8_t v23 = v4;
    _os_log_impl(&dword_1BF1E6000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%s: ssid %@ (%@)", buf, 0x20u);
  }
  uint64_t v6 = [*(id *)(a1 + 40) dataUsingEncoding:4];
  intptr_t v7 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
  [v7 setObject:*MEMORY[0x1E4F3B988] forKey:*MEMORY[0x1E4F3B978]];
  [v7 setObject:v4 forKey:*MEMORY[0x1E4F3B5C0]];
  [v7 setObject:@"AirPort" forKey:*MEMORY[0x1E4F3B850]];
  [v7 setObject:v6 forKey:*MEMORY[0x1E4F3BD38]];
  [v7 setObject:*MEMORY[0x1E4F3B570] forKey:*MEMORY[0x1E4F3B558]];
  *(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = SecItemAdd((CFDictionaryRef)v7, &result);
  int v8 = *(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
  if (v8 == -25299)
  {
    WiFiSecurityRemovePasswordFromPasswordBackup(*(void *)(a1 + 32));
    *(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = SecItemAdd((CFDictionaryRef)v7, &result);
    int v8 = *(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
  }
  if (v8 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    uint64_t v19 = "WiFiSecuritySavePasswordForPasswordBackup_block_invoke";
    __int16 v20 = 2112;
    uint64_t v21 = v4;
    __int16 v22 = 1024;
    LODWORD(v23) = v8;
    BOOL v9 = MEMORY[0x1E4F14500];
    uint64_t v10 = "%s:[%@] error result %d \n";
    uint32_t v11 = 28;
LABEL_14:
    _os_log_impl(&dword_1BF1E6000, v9, OS_LOG_TYPE_DEFAULT, v10, buf, v11);
  }
LABEL_15:

  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));
}

BOOL WiFiSecurityRemovePasswordFromPasswordBackup(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  CFAllocatorRef v2 = (void *)MEMORY[0x1C18A51F0]();
  long long v3 = dispatch_semaphore_create(0);
  uint64_t v10 = 0;
  uint32_t v11 = &v10;
  uint64_t v12 = 0x2020000000;
  int v13 = 0;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __WiFiSecurityRemovePasswordFromPasswordBackup_block_invoke;
  block[3] = &unk_1E63F4360;
  void block[5] = v3;
  block[6] = &v10;
  block[4] = a1;
  dispatch_async(MEMORY[0x1E4F14428], block);
  dispatch_time_t v4 = dispatch_time(0, 1000000000);
  intptr_t v5 = dispatch_semaphore_wait(v3, v4);
  BOOL v6 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT);
  if (v5)
  {
    if (v6)
    {
      *(_DWORD *)buf = 136315394;
      uint32_t v15 = "WiFiSecurityRemovePasswordFromPasswordBackup";
      __int16 v16 = 2112;
      uint64_t v17 = a1;
      _os_log_impl(&dword_1BF1E6000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%s:[%@] timed out\n", buf, 0x16u);
    }
    BOOL v7 = 0;
  }
  else
  {
    if (v6)
    {
      *(_DWORD *)buf = 136315394;
      uint32_t v15 = "WiFiSecurityRemovePasswordFromPasswordBackup";
      __int16 v16 = 2112;
      uint64_t v17 = a1;
      _os_log_impl(&dword_1BF1E6000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%s:[%@] completed\n", buf, 0x16u);
    }
    BOOL v7 = *((_DWORD *)v11 + 6) == 0;
  }
  dispatch_release(v3);
  _Block_object_dispose(&v10, 8);
  return v7;
}

intptr_t __WiFiSecurityRemovePasswordFromPasswordBackup_block_invoke(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  CFAllocatorRef v2 = *(void **)(a1 + 32);
  if (!v2)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      int v14 = 136315138;
      uint32_t v15 = "WiFiSecurityRemovePasswordFromPasswordBackup_block_invoke";
      uint64_t v12 = MEMORY[0x1E4F14500];
      int v13 = "%s: null ssid";
LABEL_18:
      _os_log_impl(&dword_1BF1E6000, v12, OS_LOG_TYPE_DEFAULT, v13, (uint8_t *)&v14, 0xCu);
    }
LABEL_19:
    dispatch_time_t v4 = 0;
    goto LABEL_11;
  }
  if (![v2 length])
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      int v14 = 136315138;
      uint32_t v15 = "WiFiSecurityRemovePasswordFromPasswordBackup_block_invoke";
      uint64_t v12 = MEMORY[0x1E4F14500];
      int v13 = "%s: error: empty ssid";
      goto LABEL_18;
    }
    goto LABEL_19;
  }
  long long v3 = WiFiSecurityCopySSIDHashForPasswordBackup(*(void **)(a1 + 32));
  dispatch_time_t v4 = v3;
  if (!v3 || ![v3 length])
  {
    if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_11;
    }
    int v14 = 136315138;
    uint32_t v15 = "WiFiSecurityRemovePasswordFromPasswordBackup_block_invoke";
    int v8 = MEMORY[0x1E4F14500];
    BOOL v9 = "%s: error: empty ssid hash";
    uint32_t v10 = 12;
    goto LABEL_10;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    intptr_t v5 = *(void **)(a1 + 32);
    int v14 = 136315650;
    uint32_t v15 = "WiFiSecurityRemovePasswordFromPasswordBackup_block_invoke";
    __int16 v16 = 2112;
    uint64_t v17 = v5;
    __int16 v18 = 2112;
    uint64_t v19 = v4;
    _os_log_impl(&dword_1BF1E6000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%s: ssid %@ (%@)", (uint8_t *)&v14, 0x20u);
  }
  BOOL v6 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
  [v6 setObject:*MEMORY[0x1E4F3B988] forKey:*MEMORY[0x1E4F3B978]];
  [v6 setObject:v4 forKey:*MEMORY[0x1E4F3B5C0]];
  [v6 setObject:@"AirPort" forKey:*MEMORY[0x1E4F3B850]];
  *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = SecItemDelete((CFDictionaryRef)v6);
  int v7 = *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
  if (v7 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    int v14 = 136315650;
    uint32_t v15 = "WiFiSecurityRemovePasswordFromPasswordBackup_block_invoke";
    __int16 v16 = 2112;
    uint64_t v17 = v4;
    __int16 v18 = 1024;
    LODWORD(v19) = v7;
    int v8 = MEMORY[0x1E4F14500];
    BOOL v9 = "%s:[%@] error result %d \n";
    uint32_t v10 = 28;
LABEL_10:
    _os_log_impl(&dword_1BF1E6000, v8, OS_LOG_TYPE_DEFAULT, v9, (uint8_t *)&v14, v10);
  }
LABEL_11:

  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

uint64_t MobileWiFiContainsDriver()
{
  kern_return_t v3;

  mach_port_t v0 = MobileWiFiContainsDriver_masterPort;
  if (!MobileWiFiContainsDriver_masterPort)
  {
    long long v3 = IOMasterPort(0, (mach_port_t *)&MobileWiFiContainsDriver_masterPort);
    uint64_t result = 0;
    if (v3) {
      return result;
    }
    mach_port_t v0 = MobileWiFiContainsDriver_masterPort;
  }
  CFDictionaryRef v1 = IOServiceMatching("IO80211Controller");
  uint64_t result = IOServiceGetMatchingService(v0, v1);
  if (result)
  {
    IOObjectRelease(result);
    return 1;
  }
  return result;
}

void sub_1BF208E58(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t SharingLibraryCore()
{
  if (!SharingLibraryCore_frameworkLibrary) {
    SharingLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  return SharingLibraryCore_frameworkLibrary;
}

uint64_t __SharingLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  SharingLibraryCore_frameworkLibrary = result;
  return result;
}

void __Block_byref_object_copy__0(uint64_t a1, uint64_t a2)
{
}

void __Block_byref_object_dispose__0(uint64_t a1)
{
}

Class __getSFPasswordSharingServiceClass_block_invoke(uint64_t a1)
{
  long long v3 = 0;
  if (!SharingLibraryCore()) {
    __getSFPasswordSharingServiceClass_block_invoke_cold_1(&v3);
  }
  Class result = objc_getClass("SFPasswordSharingService");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40)) {
    __getSFPasswordSharingServiceClass_block_invoke_cold_2();
  }
  getSFPasswordSharingServiceClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  return result;
}

uint64_t wifi_manager_client_server_routine(uint64_t a1)
{
  int v1 = *(_DWORD *)(a1 + 20);
  if ((v1 - 96974) >= 0xFFFFFFF2) {
    return (uint64_t)*(&_wifi_manager_client_subsystem + 5 * (v1 - 96960) + 5);
  }
  else {
    return 0;
  }
}

uint64_t _Xwifi_manager_client_dispatch_notification(uint64_t result, uint64_t a2)
{
  if ((*(_DWORD *)result & 0x80000000) != 0 && *(_DWORD *)(result + 24) == 3 && *(_DWORD *)(result + 4) == 104)
  {
    if (*(unsigned char *)(result + 39) == 1 && *(unsigned char *)(result + 55) == 1 && *(unsigned char *)(result + 71) == 1)
    {
      unsigned int v3 = *(_DWORD *)(result + 40);
      if (v3 == *(_DWORD *)(result + 84))
      {
        unsigned int v4 = *(_DWORD *)(result + 56);
        if (v4 == *(_DWORD *)(result + 96))
        {
          unsigned int v5 = *(_DWORD *)(result + 72);
          if (v5 == *(_DWORD *)(result + 100))
          {
            Class result = _wifi_manager_client_dispatch_notification(*(_DWORD *)(result + 12), *(UInt8 **)(result + 28), v3, *(_DWORD *)(result + 88), *(_DWORD *)(result + 92), *(UInt8 **)(result + 44), v4, *(UInt8 **)(result + 60), v5);
            *(_DWORD *)(a2 + 32) = result;
            return result;
          }
        }
      }
    }
    int v6 = -300;
  }
  else
  {
    int v6 = -304;
  }
  *(_DWORD *)(a2 + 32) = v6;
  *(void *)(a2 + 24) = *MEMORY[0x1E4F14068];
  return result;
}

uint64_t _Xwifi_manager_client_dispatch_association_result(uint64_t result, uint64_t a2)
{
  if ((*(_DWORD *)result & 0x80000000) != 0 && *(_DWORD *)(result + 24) == 3 && *(_DWORD *)(result + 4) == 100)
  {
    if (*(unsigned char *)(result + 39) == 1 && *(unsigned char *)(result + 55) == 1 && *(unsigned char *)(result + 71) == 1)
    {
      unsigned int v3 = *(_DWORD *)(result + 40);
      if (v3 == *(_DWORD *)(result + 84))
      {
        unsigned int v4 = *(_DWORD *)(result + 56);
        if (v4 == *(_DWORD *)(result + 88))
        {
          unsigned int v5 = *(_DWORD *)(result + 72);
          if (v5 == *(_DWORD *)(result + 92))
          {
            Class result = _wifi_manager_client_dispatch_association_result(*(_DWORD *)(result + 12), *(UInt8 **)(result + 28), v3, *(UInt8 **)(result + 44), v4, *(UInt8 **)(result + 60), v5, *(_DWORD *)(result + 96));
            *(_DWORD *)(a2 + 32) = result;
            return result;
          }
        }
      }
    }
    int v6 = -300;
  }
  else
  {
    int v6 = -304;
  }
  *(_DWORD *)(a2 + 32) = v6;
  *(void *)(a2 + 24) = *MEMORY[0x1E4F14068];
  return result;
}

uint64_t _Xwifi_manager_client_dispatch_start_network_result(uint64_t result, uint64_t a2)
{
  if ((*(_DWORD *)result & 0x80000000) != 0 && *(_DWORD *)(result + 24) == 3 && *(_DWORD *)(result + 4) == 100)
  {
    if (*(unsigned char *)(result + 39) == 1 && *(unsigned char *)(result + 55) == 1 && *(unsigned char *)(result + 71) == 1)
    {
      unsigned int v3 = *(_DWORD *)(result + 40);
      if (v3 == *(_DWORD *)(result + 84))
      {
        unsigned int v4 = *(_DWORD *)(result + 56);
        if (v4 == *(_DWORD *)(result + 92))
        {
          unsigned int v5 = *(_DWORD *)(result + 72);
          if (v5 == *(_DWORD *)(result + 96))
          {
            Class result = _wifi_manager_client_dispatch_start_network_result(*(_DWORD *)(result + 12), *(UInt8 **)(result + 28), v3, *(_DWORD *)(result + 88), *(UInt8 **)(result + 44), v4, *(UInt8 **)(result + 60), v5);
            *(_DWORD *)(a2 + 32) = result;
            return result;
          }
        }
      }
    }
    int v6 = -300;
  }
  else
  {
    int v6 = -304;
  }
  *(_DWORD *)(a2 + 32) = v6;
  *(void *)(a2 + 24) = *MEMORY[0x1E4F14068];
  return result;
}

uint64_t _Xwifi_manager_client_dispatch_stop_network_result(uint64_t result, uint64_t a2)
{
  if ((*(_DWORD *)result & 0x80000000) != 0 && *(_DWORD *)(result + 24) == 2 && *(_DWORD *)(result + 4) == 80)
  {
    if (*(unsigned char *)(result + 39) == 1 && *(unsigned char *)(result + 55) == 1)
    {
      unsigned int v3 = *(_DWORD *)(result + 40);
      if (v3 == *(_DWORD *)(result + 68))
      {
        unsigned int v4 = *(_DWORD *)(result + 56);
        if (v4 == *(_DWORD *)(result + 76))
        {
          Class result = _wifi_manager_client_dispatch_stop_network_result(*(_DWORD *)(result + 12), *(UInt8 **)(result + 28), v3, *(unsigned int *)(result + 72), *(UInt8 **)(result + 44), v4);
          *(_DWORD *)(a2 + 32) = result;
          return result;
        }
      }
    }
    int v5 = -300;
  }
  else
  {
    int v5 = -304;
  }
  *(_DWORD *)(a2 + 32) = v5;
  *(void *)(a2 + 24) = *MEMORY[0x1E4F14068];
  return result;
}

_DWORD *_Xwifi_manager_client_dispatch_wow_state_change(_DWORD *result, uint64_t a2)
{
  if ((*result & 0x80000000) != 0 || result[1] != 36)
  {
    *(_DWORD *)(a2 + 32) = -304;
    *(void *)(a2 + 24) = *MEMORY[0x1E4F14068];
  }
  else
  {
    Class result = (_DWORD *)_wifi_manager_client_dispatch_wow_state_change(result[3], result[8]);
    *(_DWORD *)(a2 + 32) = result;
  }
  return result;
}

uint64_t _Xwifi_manager_client_dispatch_gas_results(uint64_t result, uint64_t a2)
{
  if ((*(_DWORD *)result & 0x80000000) != 0 && *(_DWORD *)(result + 24) == 2 && *(_DWORD *)(result + 4) == 80)
  {
    if (*(unsigned char *)(result + 39) == 1 && *(unsigned char *)(result + 55) == 1)
    {
      unsigned int v3 = *(_DWORD *)(result + 40);
      if (v3 == *(_DWORD *)(result + 68))
      {
        unsigned int v4 = *(_DWORD *)(result + 56);
        if (v4 == *(_DWORD *)(result + 72))
        {
          Class result = _wifi_manager_client_dispatch_gas_results(*(_DWORD *)(result + 12), *(UInt8 **)(result + 28), v3, *(UInt8 **)(result + 44), v4, *(unsigned int *)(result + 76));
          *(_DWORD *)(a2 + 32) = result;
          return result;
        }
      }
    }
    int v5 = -300;
  }
  else
  {
    int v5 = -304;
  }
  *(_DWORD *)(a2 + 32) = v5;
  *(void *)(a2 + 24) = *MEMORY[0x1E4F14068];
  return result;
}

uint64_t _Xwifi_manager_client_dispatch_ranging_result(uint64_t result, uint64_t a2)
{
  if ((*(_DWORD *)result & 0x80000000) != 0 && *(_DWORD *)(result + 24) == 2 && *(_DWORD *)(result + 4) == 80)
  {
    if (*(unsigned char *)(result + 39) == 1 && *(unsigned char *)(result + 55) == 1)
    {
      unsigned int v3 = *(_DWORD *)(result + 40);
      if (v3 == *(_DWORD *)(result + 68))
      {
        unsigned int v4 = *(_DWORD *)(result + 56);
        if (v4 == *(_DWORD *)(result + 72))
        {
          Class result = _wifi_manager_client_dispatch_ranging_result(*(_DWORD *)(result + 12), *(UInt8 **)(result + 28), v3, *(UInt8 **)(result + 44), v4, *(unsigned int *)(result + 76));
          *(_DWORD *)(a2 + 32) = result;
          return result;
        }
      }
    }
    int v5 = -300;
  }
  else
  {
    int v5 = -304;
  }
  *(_DWORD *)(a2 + 32) = v5;
  *(void *)(a2 + 24) = *MEMORY[0x1E4F14068];
  return result;
}

uint64_t _Xwifi_manager_client_dispatch_add_network_async(uint64_t result, uint64_t a2)
{
  if ((*(_DWORD *)result & 0x80000000) != 0 && *(_DWORD *)(result + 24) == 1 && *(_DWORD *)(result + 4) == 60)
  {
    if (*(unsigned char *)(result + 39) == 1)
    {
      unsigned int v3 = *(_DWORD *)(result + 40);
      if (v3 == *(_DWORD *)(result + 52))
      {
        Class result = _wifi_manager_client_dispatch_add_network_async(*(_DWORD *)(result + 12), *(UInt8 **)(result + 28), v3, *(unsigned int *)(result + 56));
        *(_DWORD *)(a2 + 32) = result;
        return result;
      }
    }
    int v4 = -300;
  }
  else
  {
    int v4 = -304;
  }
  *(_DWORD *)(a2 + 32) = v4;
  *(void *)(a2 + 24) = *MEMORY[0x1E4F14068];
  return result;
}

uint64_t _Xwifi_manager_client_dispatch_auto_join_state_change(uint64_t result, uint64_t a2)
{
  if ((*(_DWORD *)result & 0x80000000) != 0 && *(_DWORD *)(result + 24) == 1 && *(_DWORD *)(result + 4) == 60)
  {
    if (*(unsigned char *)(result + 39) == 1)
    {
      unsigned int v3 = *(_DWORD *)(result + 40);
      if (v3 == *(_DWORD *)(result + 56))
      {
        Class result = _wifi_manager_client_dispatch_auto_join_state_change(*(_DWORD *)(result + 12), *(_DWORD *)(result + 52), *(UInt8 **)(result + 28), v3);
        *(_DWORD *)(a2 + 32) = result;
        return result;
      }
    }
    int v4 = -300;
  }
  else
  {
    int v4 = -304;
  }
  *(_DWORD *)(a2 + 32) = v4;
  *(void *)(a2 + 24) = *MEMORY[0x1E4F14068];
  return result;
}

uint64_t _Xwifi_manager_client_dispatch_preferred_networks_change(uint64_t result, uint64_t a2)
{
  if ((*(_DWORD *)result & 0x80000000) != 0 && *(_DWORD *)(result + 24) == 1 && *(_DWORD *)(result + 4) == 56)
  {
    if (*(unsigned char *)(result + 39) == 1)
    {
      unsigned int v3 = *(_DWORD *)(result + 40);
      if (v3 == *(_DWORD *)(result + 52))
      {
        Class result = _wifi_manager_client_dispatch_preferred_networks_change(*(_DWORD *)(result + 12), *(UInt8 **)(result + 28), v3);
        *(_DWORD *)(a2 + 32) = result;
        return result;
      }
    }
    int v4 = -300;
  }
  else
  {
    int v4 = -304;
  }
  *(_DWORD *)(a2 + 32) = v4;
  *(void *)(a2 + 24) = *MEMORY[0x1E4F14068];
  return result;
}

_DWORD *_Xwifi_manager_client_dispatch_managed_apple_id_state_change(_DWORD *result, uint64_t a2)
{
  if ((*result & 0x80000000) != 0 || result[1] != 36)
  {
    *(_DWORD *)(a2 + 32) = -304;
    *(void *)(a2 + 24) = *MEMORY[0x1E4F14068];
  }
  else
  {
    Class result = (_DWORD *)_wifi_manager_client_dispatch_managed_apple_id_state_change(result[3], result[8]);
    *(_DWORD *)(a2 + 32) = result;
  }
  return result;
}

uint64_t _Xwifi_manager_client_dispatch_ui_event(uint64_t result, uint64_t a2)
{
  if ((*(_DWORD *)result & 0x80000000) != 0 && *(_DWORD *)(result + 24) == 1 && *(_DWORD *)(result + 4) == 56)
  {
    if (*(unsigned char *)(result + 39) == 1)
    {
      unsigned int v3 = *(_DWORD *)(result + 40);
      if (v3 == *(_DWORD *)(result + 52))
      {
        Class result = _wifi_manager_client_dispatch_ui_event(*(_DWORD *)(result + 12), *(UInt8 **)(result + 28), v3);
        *(_DWORD *)(a2 + 32) = result;
        return result;
      }
    }
    int v4 = -300;
  }
  else
  {
    int v4 = -304;
  }
  *(_DWORD *)(a2 + 32) = v4;
  *(void *)(a2 + 24) = *MEMORY[0x1E4F14068];
  return result;
}

uint64_t wifi_manager_close(mach_port_t a1)
{
  *(void *)&msg.msgh_bits = 0xAAAAAAAA00000013;
  msg.msgh_voucher_port = 0;
  msg.msgh_id = 69691;
  msg.mach_port_t msgh_remote_port = a1;
  msg.msgh_local_port = 0;
  if (MEMORY[0x1E4F14B18]) {
    voucher_mach_msg_set(&msg);
  }
  return mach_msg(&msg, 2097153, 0x18u, 0, 0, 0, 0);
}

uint64_t wifi_manager_copy_networks(int a1, int a2, void *a3, _DWORD *a4)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  *(void *)&long long v7 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v7 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)&msg[20] = v7;
  *(_OWORD *)&v14[12] = v7;
  *(_OWORD *)int v14 = v7;
  *(_OWORD *)&msg[4] = v7;
  *(void *)&msg[24] = *MEMORY[0x1E4F14068];
  *(_DWORD *)&msg[32] = a2;
  mach_port_name_t special_reply_port = mig_get_special_reply_port();
  *(_DWORD *)&msg[8] = a1;
  *(_DWORD *)&msg[12] = special_reply_port;
  *(_DWORD *)mach_msg_header_t msg = 5395;
  *(void *)&msg[16] = 0x1103D00000000;
  if (MEMORY[0x1E4F14B18])
  {
    voucher_mach_msg_set((mach_msg_header_t *)msg);
    mach_port_name_t special_reply_port = *(_DWORD *)&msg[12];
  }
  uint64_t v9 = mach_msg((mach_msg_header_t *)msg, 3162115, 0x24u, 0x40u, special_reply_port, 0, 0);
  uint64_t v10 = v9;
  if ((v9 - 268435458) > 0xE || ((1 << (v9 - 2)) & 0x4003) == 0)
  {
    if (!v9)
    {
      if (*(_DWORD *)&msg[20] == 71)
      {
        uint64_t v10 = 4294966988;
      }
      else if (*(_DWORD *)&msg[20] == 69793)
      {
        if ((*(_DWORD *)msg & 0x80000000) == 0)
        {
          if (*(_DWORD *)&msg[4] == 36)
          {
            uint64_t v10 = 4294966996;
            if (*(_DWORD *)&msg[32])
            {
              if (*(_DWORD *)&msg[8]) {
                uint64_t v10 = 4294966996;
              }
              else {
                uint64_t v10 = *(unsigned int *)&msg[32];
              }
            }
          }
          else
          {
            uint64_t v10 = 4294966996;
          }
          goto LABEL_24;
        }
        uint64_t v10 = 4294966996;
        if (*(_DWORD *)&msg[24] == 1 && *(_DWORD *)&msg[4] == 56 && !*(_DWORD *)&msg[8] && v14[3] == 1)
        {
          int v11 = *(_DWORD *)&v14[4];
          if (*(_DWORD *)&v14[4] == *(_DWORD *)&v14[16])
          {
            uint64_t v10 = 0;
            *a3 = *(void *)&msg[28];
            *a4 = v11;
            return v10;
          }
        }
      }
      else
      {
        uint64_t v10 = 4294966995;
      }
LABEL_24:
      mach_msg_destroy((mach_msg_header_t *)msg);
      return v10;
    }
    mig_dealloc_special_reply_port();
  }
  return v10;
}

uint64_t wifi_manager_set_property(mach_port_t a1, uint64_t a2, int a3, uint64_t a4, int a5, int *a6)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  int v14 = 2;
  uint64_t v15 = a2;
  int v16 = 27918592;
  int v17 = a3;
  uint64_t v18 = a4;
  int v19 = 27918592;
  int v20 = a5;
  uint64_t v21 = *MEMORY[0x1E4F14068];
  int v22 = a3;
  int v23 = a5;
  mach_port_t special_reply_port = mig_get_special_reply_port();
  *(void *)&msg.msgh_bits = 0xAAAAAAAA80001513;
  msg.mach_port_t msgh_remote_port = a1;
  msg.msgh_local_port = special_reply_port;
  *(void *)&msg.msgh_voucher_port = 0x1103F00000000;
  if (MEMORY[0x1E4F14B18])
  {
    voucher_mach_msg_set(&msg);
    mach_port_t special_reply_port = msg.msgh_local_port;
  }
  uint64_t v9 = mach_msg(&msg, 3162115, 0x4Cu, 0x30u, special_reply_port, 0, 0);
  uint64_t v10 = v9;
  if ((v9 - 268435458) > 0xE || ((1 << (v9 - 2)) & 0x4003) == 0)
  {
    if (!v9)
    {
      if (msg.msgh_id == 71)
      {
        uint64_t v10 = 4294966988;
      }
      else if (msg.msgh_id == 69795)
      {
        if ((msg.msgh_bits & 0x80000000) == 0)
        {
          if (msg.msgh_size == 40)
          {
            if (!msg.msgh_remote_port)
            {
              uint64_t v10 = HIDWORD(v15);
              if (!HIDWORD(v15))
              {
                *a6 = v16;
                return v10;
              }
              goto LABEL_22;
            }
          }
          else if (msg.msgh_size == 36)
          {
            if (msg.msgh_remote_port) {
              BOOL v11 = 1;
            }
            else {
              BOOL v11 = HIDWORD(v15) == 0;
            }
            if (v11) {
              uint64_t v10 = 4294966996;
            }
            else {
              uint64_t v10 = HIDWORD(v15);
            }
            goto LABEL_22;
          }
        }
        uint64_t v10 = 4294966996;
      }
      else
      {
        uint64_t v10 = 4294966995;
      }
LABEL_22:
      mach_msg_destroy(&msg);
      return v10;
    }
    mig_dealloc_special_reply_port();
  }
  return v10;
}

uint64_t wifi_manager_add_network(int a1, uint64_t a2, int a3)
{
  uint64_t v5 = a2;
  int v6 = 27918592;
  int v7 = a3;
  uint64_t v8 = *MEMORY[0x1E4F14068];
  int v9 = a3;
  *(void *)mach_msg_header_t msg = 0xAAAAAAAA80000013;
  *(_DWORD *)&msg[8] = a1;
  *(_OWORD *)&msg[12] = xmmword_1BF21A240;
  if (MEMORY[0x1E4F14B18]) {
    voucher_mach_msg_set((mach_msg_header_t *)msg);
  }
  return mach_msg((mach_msg_header_t *)msg, 2097153, 0x38u, 0, 0, 0, 0);
}

uint64_t wifi_manager_add_network_async(int a1, uint64_t a2, int a3, uint64_t a4, int a5)
{
  uint64_t v9 = a2;
  int v10 = 27918592;
  int v11 = a3;
  uint64_t v12 = a4;
  int v13 = 27918592;
  int v14 = a5;
  uint64_t v15 = *MEMORY[0x1E4F14068];
  int v16 = a3;
  int v17 = a5;
  unint64_t v6 = 0xAAAAAAAA80000013;
  int v7 = a1;
  long long v8 = xmmword_1BF21A250;
  if (MEMORY[0x1E4F14B18]) {
    voucher_mach_msg_set((mach_msg_header_t *)&v6);
  }
  return mach_msg((mach_msg_header_t *)&v6, 2097153, 0x4Cu, 0, 0, 0, 0);
}

uint64_t wifi_manager_update_network(int a1, uint64_t a2, int a3)
{
  uint64_t v5 = a2;
  int v6 = 27918592;
  int v7 = a3;
  uint64_t v8 = *MEMORY[0x1E4F14068];
  int v9 = a3;
  *(void *)mach_msg_header_t msg = 0xAAAAAAAA80000013;
  *(_DWORD *)&msg[8] = a1;
  *(_OWORD *)&msg[12] = xmmword_1BF21A260;
  if (MEMORY[0x1E4F14B18]) {
    voucher_mach_msg_set((mach_msg_header_t *)msg);
  }
  return mach_msg((mach_msg_header_t *)msg, 2097153, 0x38u, 0, 0, 0, 0);
}

uint64_t wifi_manager_remove_network(int a1, uint64_t a2, int a3, int a4)
{
  uint64_t v8 = a2;
  int v9 = 27918592;
  int v10 = a3;
  uint64_t v11 = *MEMORY[0x1E4F14068];
  int v12 = a3;
  int v13 = a4;
  unint64_t v5 = 0xAAAAAAAA80000013;
  int v6 = a1;
  long long v7 = xmmword_1BF21A270;
  if (MEMORY[0x1E4F14B18]) {
    voucher_mach_msg_set((mach_msg_header_t *)&v5);
  }
  return mach_msg((mach_msg_header_t *)&v5, 2097153, 0x3Cu, 0, 0, 0, 0);
}

uint64_t wifi_manager_remove_networks_with_bundle_identifier(int a1, uint64_t a2, int a3)
{
  uint64_t v5 = a2;
  int v6 = 27918592;
  int v7 = a3;
  uint64_t v8 = *MEMORY[0x1E4F14068];
  int v9 = a3;
  *(void *)mach_msg_header_t msg = 0xAAAAAAAA80000013;
  *(_DWORD *)&msg[8] = a1;
  *(_OWORD *)&msg[12] = xmmword_1BF21A280;
  if (MEMORY[0x1E4F14B18]) {
    voucher_mach_msg_set((mach_msg_header_t *)msg);
  }
  return mach_msg((mach_msg_header_t *)msg, 2097153, 0x38u, 0, 0, 0, 0);
}

uint64_t wifi_manager_set_networks_state_with_bundle_identifier(int a1, uint64_t a2, int a3, int a4)
{
  uint64_t v8 = a2;
  int v9 = 27918592;
  int v10 = a3;
  uint64_t v11 = *MEMORY[0x1E4F14068];
  int v12 = a3;
  int v13 = a4;
  unint64_t v5 = 0xAAAAAAAA80000013;
  int v6 = a1;
  long long v7 = xmmword_1BF21A290;
  if (MEMORY[0x1E4F14B18]) {
    voucher_mach_msg_set((mach_msg_header_t *)&v5);
  }
  return mach_msg((mach_msg_header_t *)&v5, 2097153, 0x3Cu, 0, 0, 0, 0);
}

uint64_t wifi_manager_set_network_state(int a1, uint64_t a2, int a3, int a4, int a5)
{
  uint64_t v9 = a2;
  int v10 = 27918592;
  int v11 = a3;
  uint64_t v12 = *MEMORY[0x1E4F14068];
  int v13 = a3;
  int v14 = a4;
  int v15 = a5;
  unint64_t v6 = 0xAAAAAAAA80000013;
  int v7 = a1;
  long long v8 = xmmword_1BF21A2A0;
  if (MEMORY[0x1E4F14B18]) {
    voucher_mach_msg_set((mach_msg_header_t *)&v6);
  }
  return mach_msg((mach_msg_header_t *)&v6, 2097153, 0x40u, 0, 0, 0, 0);
}

uint64_t wifi_manager_get_network_state(mach_port_t a1, uint64_t a2, int a3, int *a4)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  int v12 = 1;
  uint64_t v13 = a2;
  int v14 = 27918592;
  int v15 = a3;
  uint64_t v16 = *MEMORY[0x1E4F14068];
  int v17 = a3;
  mach_port_t special_reply_port = mig_get_special_reply_port();
  *(void *)&v11.msgh_bits = 0xAAAAAAAA80001513;
  v11.mach_port_t msgh_remote_port = a1;
  v11.msgh_local_port = special_reply_port;
  *(void *)&v11.msgh_voucher_port = 0x1104700000000;
  if (MEMORY[0x1E4F14B18])
  {
    voucher_mach_msg_set(&v11);
    mach_port_t special_reply_port = v11.msgh_local_port;
  }
  uint64_t v7 = mach_msg(&v11, 3162115, 0x38u, 0x30u, special_reply_port, 0, 0);
  uint64_t v8 = v7;
  if ((v7 - 268435458) > 0xE || ((1 << (v7 - 2)) & 0x4003) == 0)
  {
    if (!v7)
    {
      if (v11.msgh_id == 71)
      {
        uint64_t v8 = 4294966988;
      }
      else if (v11.msgh_id == 69803)
      {
        if ((v11.msgh_bits & 0x80000000) == 0)
        {
          if (v11.msgh_size == 40)
          {
            if (!v11.msgh_remote_port)
            {
              uint64_t v8 = HIDWORD(v13);
              if (!HIDWORD(v13))
              {
                *a4 = v14;
                return v8;
              }
              goto LABEL_22;
            }
          }
          else if (v11.msgh_size == 36)
          {
            if (v11.msgh_remote_port) {
              BOOL v9 = 1;
            }
            else {
              BOOL v9 = HIDWORD(v13) == 0;
            }
            if (v9) {
              uint64_t v8 = 4294966996;
            }
            else {
              uint64_t v8 = HIDWORD(v13);
            }
            goto LABEL_22;
          }
        }
        uint64_t v8 = 4294966996;
      }
      else
      {
        uint64_t v8 = 4294966995;
      }
LABEL_22:
      mach_msg_destroy(&v11);
      return v8;
    }
    mig_dealloc_special_reply_port();
  }
  return v8;
}

uint64_t wifi_manager_dispatch_notification_response(int a1, int a2, int a3, uint64_t a4, int a5)
{
  uint64_t v9 = a4;
  int v10 = 27918592;
  int v11 = a5;
  uint64_t v12 = *MEMORY[0x1E4F14068];
  int v13 = a2;
  int v14 = a3;
  int v15 = a5;
  unint64_t v6 = 0xAAAAAAAA80000013;
  int v7 = a1;
  long long v8 = xmmword_1BF21A2B0;
  if (MEMORY[0x1E4F14B18]) {
    voucher_mach_msg_set((mach_msg_header_t *)&v6);
  }
  return mach_msg((mach_msg_header_t *)&v6, 2097153, 0x40u, 0, 0, 0, 0);
}

uint64_t wifi_manager_indicate_carplay_hid_event_received(int a1, int a2, int a3, uint64_t a4, int a5)
{
  uint64_t v9 = a4;
  int v10 = 27918592;
  int v11 = a5;
  uint64_t v12 = *MEMORY[0x1E4F14068];
  int v13 = a2;
  int v14 = a3;
  int v15 = a5;
  unint64_t v6 = 0xAAAAAAAA80000013;
  int v7 = a1;
  long long v8 = xmmword_1BF21A2C0;
  if (MEMORY[0x1E4F14B18]) {
    voucher_mach_msg_set((mach_msg_header_t *)&v6);
  }
  return mach_msg((mach_msg_header_t *)&v6, 2097153, 0x40u, 0, 0, 0, 0);
}

uint64_t wifi_manager_set_enable_state(mach_port_t a1, int a2)
{
  uint64_t v4 = *MEMORY[0x1E4F14068];
  int v5 = a2;
  *(void *)&msg.msgh_bits = 0xAAAAAAAA00000013;
  msg.msgh_voucher_port = 0;
  msg.msgh_id = 69706;
  msg.mach_port_t msgh_remote_port = a1;
  msg.msgh_local_port = 0;
  if (MEMORY[0x1E4F14B18]) {
    voucher_mach_msg_set(&msg);
  }
  return mach_msg(&msg, 2097153, 0x24u, 0, 0, 0, 0);
}

uint64_t wifi_manager_set_power(mach_port_t a1, int a2)
{
  uint64_t v4 = *MEMORY[0x1E4F14068];
  int v5 = a2;
  *(void *)&msg.msgh_bits = 0xAAAAAAAA00000013;
  msg.msgh_voucher_port = 0;
  msg.msgh_id = 69707;
  msg.mach_port_t msgh_remote_port = a1;
  msg.msgh_local_port = 0;
  if (MEMORY[0x1E4F14B18]) {
    voucher_mach_msg_set(&msg);
  }
  return mach_msg(&msg, 2097153, 0x24u, 0, 0, 0, 0);
}

uint64_t wifi_manager_get_power(int a1, _DWORD *a2)
{
  *(void *)&long long v4 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v4 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)&rcv_name_12[16] = v4;
  *(_OWORD *)&rcv_name_12[4] = v4;
  int rcv_name = -1431655766;
  mach_port_name_t special_reply_port = mig_get_special_reply_port();
  int rcv_name_4 = a1;
  mach_port_name_t rcv_name_8 = special_reply_port;
  int v10 = 5395;
  *(void *)rcv_name_12 = 0x1104C00000000;
  if (MEMORY[0x1E4F14B18])
  {
    voucher_mach_msg_set((mach_msg_header_t *)&v10);
    mach_port_name_t special_reply_port = rcv_name_8;
  }
  uint64_t v6 = mach_msg((mach_msg_header_t *)&v10, 3162115, 0x18u, 0x30u, special_reply_port, 0, 0);
  uint64_t v7 = v6;
  if ((v6 - 268435458) > 0xE || ((1 << (v6 - 2)) & 0x4003) == 0)
  {
    if (!v6)
    {
      if (*(_DWORD *)&rcv_name_12[4] == 71)
      {
        uint64_t v7 = 4294966988;
      }
      else if (*(_DWORD *)&rcv_name_12[4] == 69808)
      {
        if ((v10 & 0x80000000) == 0)
        {
          if (rcv_name == 40)
          {
            if (!rcv_name_4)
            {
              uint64_t v7 = *(unsigned int *)&rcv_name_12[16];
              if (!*(_DWORD *)&rcv_name_12[16])
              {
                *a2 = *(_DWORD *)&rcv_name_12[20];
                return v7;
              }
              goto LABEL_22;
            }
          }
          else if (rcv_name == 36)
          {
            if (rcv_name_4) {
              BOOL v8 = 1;
            }
            else {
              BOOL v8 = *(_DWORD *)&rcv_name_12[16] == 0;
            }
            if (v8) {
              uint64_t v7 = 4294966996;
            }
            else {
              uint64_t v7 = *(unsigned int *)&rcv_name_12[16];
            }
            goto LABEL_22;
          }
        }
        uint64_t v7 = 4294966996;
      }
      else
      {
        uint64_t v7 = 4294966995;
      }
LABEL_22:
      mach_msg_destroy((mach_msg_header_t *)&v10);
      return v7;
    }
    mig_dealloc_special_reply_port();
  }
  return v7;
}

uint64_t wifi_manager_set_power_ext(mach_port_t a1, int a2)
{
  uint64_t v4 = *MEMORY[0x1E4F14068];
  int v5 = a2;
  *(void *)&msg.msgh_bits = 0xAAAAAAAA00000013;
  msg.msgh_voucher_port = 0;
  msg.msgh_id = 69709;
  msg.mach_port_t msgh_remote_port = a1;
  msg.msgh_local_port = 0;
  if (MEMORY[0x1E4F14B18]) {
    voucher_mach_msg_set(&msg);
  }
  return mach_msg(&msg, 2097153, 0x24u, 0, 0, 0, 0);
}

uint64_t wifi_manager_get_ask_to_join_state(int a1, _DWORD *a2)
{
  *(void *)&long long v4 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v4 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)&rcv_name_12[16] = v4;
  *(_OWORD *)&rcv_name_12[4] = v4;
  int rcv_name = -1431655766;
  mach_port_name_t special_reply_port = mig_get_special_reply_port();
  int rcv_name_4 = a1;
  mach_port_name_t rcv_name_8 = special_reply_port;
  int v10 = 5395;
  *(void *)rcv_name_12 = 0x1104E00000000;
  if (MEMORY[0x1E4F14B18])
  {
    voucher_mach_msg_set((mach_msg_header_t *)&v10);
    mach_port_name_t special_reply_port = rcv_name_8;
  }
  uint64_t v6 = mach_msg((mach_msg_header_t *)&v10, 3162115, 0x18u, 0x30u, special_reply_port, 0, 0);
  uint64_t v7 = v6;
  if ((v6 - 268435458) > 0xE || ((1 << (v6 - 2)) & 0x4003) == 0)
  {
    if (!v6)
    {
      if (*(_DWORD *)&rcv_name_12[4] == 71)
      {
        uint64_t v7 = 4294966988;
      }
      else if (*(_DWORD *)&rcv_name_12[4] == 69810)
      {
        if ((v10 & 0x80000000) == 0)
        {
          if (rcv_name == 40)
          {
            if (!rcv_name_4)
            {
              uint64_t v7 = *(unsigned int *)&rcv_name_12[16];
              if (!*(_DWORD *)&rcv_name_12[16])
              {
                *a2 = *(_DWORD *)&rcv_name_12[20];
                return v7;
              }
              goto LABEL_22;
            }
          }
          else if (rcv_name == 36)
          {
            if (rcv_name_4) {
              BOOL v8 = 1;
            }
            else {
              BOOL v8 = *(_DWORD *)&rcv_name_12[16] == 0;
            }
            if (v8) {
              uint64_t v7 = 4294966996;
            }
            else {
              uint64_t v7 = *(unsigned int *)&rcv_name_12[16];
            }
            goto LABEL_22;
          }
        }
        uint64_t v7 = 4294966996;
      }
      else
      {
        uint64_t v7 = 4294966995;
      }
LABEL_22:
      mach_msg_destroy((mach_msg_header_t *)&v10);
      return v7;
    }
    mig_dealloc_special_reply_port();
  }
  return v7;
}

uint64_t wifi_manager_set_mis_state(mach_port_t a1, int a2)
{
  uint64_t v4 = *MEMORY[0x1E4F14068];
  int v5 = a2;
  *(void *)&msg.msgh_bits = 0xAAAAAAAA00000013;
  msg.msgh_voucher_port = 0;
  msg.msgh_id = 69711;
  msg.mach_port_t msgh_remote_port = a1;
  msg.msgh_local_port = 0;
  if (MEMORY[0x1E4F14B18]) {
    voucher_mach_msg_set(&msg);
  }
  return mach_msg(&msg, 2097153, 0x24u, 0, 0, 0, 0);
}

uint64_t wifi_manager_get_mis_state(int a1, _DWORD *a2)
{
  *(void *)&long long v4 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v4 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)&rcv_name_12[16] = v4;
  *(_OWORD *)&rcv_name_12[4] = v4;
  int rcv_name = -1431655766;
  mach_port_name_t special_reply_port = mig_get_special_reply_port();
  int rcv_name_4 = a1;
  mach_port_name_t rcv_name_8 = special_reply_port;
  int v10 = 5395;
  *(void *)rcv_name_12 = 0x1105000000000;
  if (MEMORY[0x1E4F14B18])
  {
    voucher_mach_msg_set((mach_msg_header_t *)&v10);
    mach_port_name_t special_reply_port = rcv_name_8;
  }
  uint64_t v6 = mach_msg((mach_msg_header_t *)&v10, 3162115, 0x18u, 0x30u, special_reply_port, 0, 0);
  uint64_t v7 = v6;
  if ((v6 - 268435458) > 0xE || ((1 << (v6 - 2)) & 0x4003) == 0)
  {
    if (!v6)
    {
      if (*(_DWORD *)&rcv_name_12[4] == 71)
      {
        uint64_t v7 = 4294966988;
      }
      else if (*(_DWORD *)&rcv_name_12[4] == 69812)
      {
        if ((v10 & 0x80000000) == 0)
        {
          if (rcv_name == 40)
          {
            if (!rcv_name_4)
            {
              uint64_t v7 = *(unsigned int *)&rcv_name_12[16];
              if (!*(_DWORD *)&rcv_name_12[16])
              {
                *a2 = *(_DWORD *)&rcv_name_12[20];
                return v7;
              }
              goto LABEL_22;
            }
          }
          else if (rcv_name == 36)
          {
            if (rcv_name_4) {
              BOOL v8 = 1;
            }
            else {
              BOOL v8 = *(_DWORD *)&rcv_name_12[16] == 0;
            }
            if (v8) {
              uint64_t v7 = 4294966996;
            }
            else {
              uint64_t v7 = *(unsigned int *)&rcv_name_12[16];
            }
            goto LABEL_22;
          }
        }
        uint64_t v7 = 4294966996;
      }
      else
      {
        uint64_t v7 = 4294966995;
      }
LABEL_22:
      mach_msg_destroy((mach_msg_header_t *)&v10);
      return v7;
    }
    mig_dealloc_special_reply_port();
  }
  return v7;
}

uint64_t wifi_manager_set_mis_discovery_state(mach_port_t a1, int a2, int a3, int a4, int a5, uint64_t a6, int a7, uint64_t a8, int a9, int a10)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  int v16 = 2;
  uint64_t v17 = a6;
  int v18 = 27918592;
  int v19 = a7;
  uint64_t v20 = a8;
  int v21 = 27918592;
  int v22 = a9;
  uint64_t v23 = *MEMORY[0x1E4F14068];
  int v24 = a2;
  int v25 = a3;
  int v26 = a4;
  int v27 = a5;
  int v28 = a7;
  int v29 = a9;
  int v30 = a10;
  mach_port_t special_reply_port = mig_get_special_reply_port();
  *(void *)&msg.msgh_bits = 0xAAAAAAAA80001513;
  msg.mach_port_t msgh_remote_port = a1;
  msg.msgh_local_port = special_reply_port;
  *(void *)&msg.msgh_voucher_port = 0x1105100000000;
  if (MEMORY[0x1E4F14B18])
  {
    voucher_mach_msg_set(&msg);
    mach_port_t special_reply_port = msg.msgh_local_port;
  }
  uint64_t v12 = mach_msg(&msg, 3162115, 0x60u, 0x2Cu, special_reply_port, 0, 0);
  uint64_t v13 = v12;
  if ((v12 - 268435458) > 0xE || ((1 << (v12 - 2)) & 0x4003) == 0)
  {
    if (v12)
    {
      mig_dealloc_special_reply_port();
      return v13;
    }
    if (msg.msgh_id == 71)
    {
      uint64_t v13 = 4294966988;
    }
    else if (msg.msgh_id == 69813)
    {
      uint64_t v13 = 4294966996;
      if ((msg.msgh_bits & 0x80000000) == 0 && msg.msgh_size == 36 && !msg.msgh_remote_port)
      {
        uint64_t v13 = HIDWORD(v17);
        if (!HIDWORD(v17)) {
          return v13;
        }
      }
    }
    else
    {
      uint64_t v13 = 4294966995;
    }
    mach_msg_destroy(&msg);
  }
  return v13;
}

uint64_t wifi_manager_get_mis_discovery_state(int a1, _DWORD *a2)
{
  *(void *)&long long v4 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v4 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)&rcv_name_12[16] = v4;
  *(_OWORD *)&rcv_name_12[4] = v4;
  int rcv_name = -1431655766;
  mach_port_name_t special_reply_port = mig_get_special_reply_port();
  int rcv_name_4 = a1;
  mach_port_name_t rcv_name_8 = special_reply_port;
  int v10 = 5395;
  *(void *)rcv_name_12 = 0x1105200000000;
  if (MEMORY[0x1E4F14B18])
  {
    voucher_mach_msg_set((mach_msg_header_t *)&v10);
    mach_port_name_t special_reply_port = rcv_name_8;
  }
  uint64_t v6 = mach_msg((mach_msg_header_t *)&v10, 3162115, 0x18u, 0x30u, special_reply_port, 0, 0);
  uint64_t v7 = v6;
  if ((v6 - 268435458) > 0xE || ((1 << (v6 - 2)) & 0x4003) == 0)
  {
    if (!v6)
    {
      if (*(_DWORD *)&rcv_name_12[4] == 71)
      {
        uint64_t v7 = 4294966988;
      }
      else if (*(_DWORD *)&rcv_name_12[4] == 69814)
      {
        if ((v10 & 0x80000000) == 0)
        {
          if (rcv_name == 40)
          {
            if (!rcv_name_4)
            {
              uint64_t v7 = *(unsigned int *)&rcv_name_12[16];
              if (!*(_DWORD *)&rcv_name_12[16])
              {
                *a2 = *(_DWORD *)&rcv_name_12[20];
                return v7;
              }
              goto LABEL_22;
            }
          }
          else if (rcv_name == 36)
          {
            if (rcv_name_4) {
              BOOL v8 = 1;
            }
            else {
              BOOL v8 = *(_DWORD *)&rcv_name_12[16] == 0;
            }
            if (v8) {
              uint64_t v7 = 4294966996;
            }
            else {
              uint64_t v7 = *(unsigned int *)&rcv_name_12[16];
            }
            goto LABEL_22;
          }
        }
        uint64_t v7 = 4294966996;
      }
      else
      {
        uint64_t v7 = 4294966995;
      }
LABEL_22:
      mach_msg_destroy((mach_msg_header_t *)&v10);
      return v7;
    }
    mig_dealloc_special_reply_port();
  }
  return v7;
}

uint64_t wifi_manager_set_wow_state(mach_port_t a1, int a2)
{
  uint64_t v4 = *MEMORY[0x1E4F14068];
  int v5 = a2;
  *(void *)&msg.msgh_bits = 0xAAAAAAAA00000013;
  msg.msgh_voucher_port = 0;
  msg.msgh_id = 69715;
  msg.mach_port_t msgh_remote_port = a1;
  msg.msgh_local_port = 0;
  if (MEMORY[0x1E4F14B18]) {
    voucher_mach_msg_set(&msg);
  }
  return mach_msg(&msg, 2097153, 0x24u, 0, 0, 0, 0);
}

uint64_t wifi_manager_copy_wow_state(int a1, void *a2, _DWORD *a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  *(void *)&long long v6 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v6 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)&v13[12] = v6;
  *(_OWORD *)uint64_t v13 = v6;
  *(_OWORD *)&msg[20] = v6;
  *(_DWORD *)&msg[4] = -1431655766;
  mach_port_name_t special_reply_port = mig_get_special_reply_port();
  *(_DWORD *)&msg[8] = a1;
  *(_DWORD *)&msg[12] = special_reply_port;
  *(_DWORD *)mach_msg_header_t msg = 5395;
  *(void *)&msg[16] = 0x1105400000000;
  if (MEMORY[0x1E4F14B18])
  {
    voucher_mach_msg_set((mach_msg_header_t *)msg);
    mach_port_name_t special_reply_port = *(_DWORD *)&msg[12];
  }
  uint64_t v8 = mach_msg((mach_msg_header_t *)msg, 3162115, 0x18u, 0x40u, special_reply_port, 0, 0);
  uint64_t v9 = v8;
  if ((v8 - 268435458) > 0xE || ((1 << (v8 - 2)) & 0x4003) == 0)
  {
    if (!v8)
    {
      if (*(_DWORD *)&msg[20] == 71)
      {
        uint64_t v9 = 4294966988;
      }
      else if (*(_DWORD *)&msg[20] == 69816)
      {
        if ((*(_DWORD *)msg & 0x80000000) == 0)
        {
          if (*(_DWORD *)&msg[4] == 36)
          {
            uint64_t v9 = 4294966996;
            if (*(_DWORD *)&msg[32])
            {
              if (*(_DWORD *)&msg[8]) {
                uint64_t v9 = 4294966996;
              }
              else {
                uint64_t v9 = *(unsigned int *)&msg[32];
              }
            }
          }
          else
          {
            uint64_t v9 = 4294966996;
          }
          goto LABEL_24;
        }
        uint64_t v9 = 4294966996;
        if (*(_DWORD *)&msg[24] == 1 && *(_DWORD *)&msg[4] == 56 && !*(_DWORD *)&msg[8] && v13[3] == 1)
        {
          int v10 = *(_DWORD *)&v13[4];
          if (*(_DWORD *)&v13[4] == *(_DWORD *)&v13[16])
          {
            uint64_t v9 = 0;
            *a2 = *(void *)&msg[28];
            *a3 = v10;
            return v9;
          }
        }
      }
      else
      {
        uint64_t v9 = 4294966995;
      }
LABEL_24:
      mach_msg_destroy((mach_msg_header_t *)msg);
      return v9;
    }
    mig_dealloc_special_reply_port();
  }
  return v9;
}

uint64_t wifi_manager_set_quiesce_state(int a1, int a2, _DWORD *a3)
{
  *(void *)&long long v5 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v5 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)&rcv_name[16] = v5;
  *(_OWORD *)&rcv_name[28] = v5;
  *(_OWORD *)int rcv_name = v5;
  *(void *)&rcv_name[20] = *MEMORY[0x1E4F14068];
  *(_DWORD *)&rcv_name[28] = a2;
  mach_port_name_t special_reply_port = mig_get_special_reply_port();
  *(_DWORD *)&rcv_name[4] = a1;
  *(_DWORD *)&rcv_name[8] = special_reply_port;
  int v11 = 5395;
  *(void *)&rcv_name[12] = 0x1105500000000;
  if (MEMORY[0x1E4F14B18])
  {
    voucher_mach_msg_set((mach_msg_header_t *)&v11);
    mach_port_name_t special_reply_port = *(_DWORD *)&rcv_name[8];
  }
  uint64_t v7 = mach_msg((mach_msg_header_t *)&v11, 3162115, 0x24u, 0x30u, special_reply_port, 0, 0);
  uint64_t v8 = v7;
  if ((v7 - 268435458) > 0xE || ((1 << (v7 - 2)) & 0x4003) == 0)
  {
    if (!v7)
    {
      if (*(_DWORD *)&rcv_name[16] == 71)
      {
        uint64_t v8 = 4294966988;
      }
      else if (*(_DWORD *)&rcv_name[16] == 69817)
      {
        if ((v11 & 0x80000000) == 0)
        {
          if (*(_DWORD *)rcv_name == 40)
          {
            if (!*(_DWORD *)&rcv_name[4])
            {
              uint64_t v8 = *(unsigned int *)&rcv_name[28];
              if (!*(_DWORD *)&rcv_name[28])
              {
                *a3 = *(_DWORD *)&rcv_name[32];
                return v8;
              }
              goto LABEL_22;
            }
          }
          else if (*(_DWORD *)rcv_name == 36)
          {
            if (*(_DWORD *)&rcv_name[4]) {
              BOOL v9 = 1;
            }
            else {
              BOOL v9 = *(_DWORD *)&rcv_name[28] == 0;
            }
            if (v9) {
              uint64_t v8 = 4294966996;
            }
            else {
              uint64_t v8 = *(unsigned int *)&rcv_name[28];
            }
            goto LABEL_22;
          }
        }
        uint64_t v8 = 4294966996;
      }
      else
      {
        uint64_t v8 = 4294966995;
      }
LABEL_22:
      mach_msg_destroy((mach_msg_header_t *)&v11);
      return v8;
    }
    mig_dealloc_special_reply_port();
  }
  return v8;
}

uint64_t wifi_manager_get_quiesce_state(int a1, _DWORD *a2)
{
  *(void *)&long long v4 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v4 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)&rcv_name_12[16] = v4;
  *(_OWORD *)&rcv_name_12[4] = v4;
  int rcv_name = -1431655766;
  mach_port_name_t special_reply_port = mig_get_special_reply_port();
  int rcv_name_4 = a1;
  mach_port_name_t rcv_name_8 = special_reply_port;
  int v10 = 5395;
  *(void *)rcv_name_12 = 0x1105600000000;
  if (MEMORY[0x1E4F14B18])
  {
    voucher_mach_msg_set((mach_msg_header_t *)&v10);
    mach_port_name_t special_reply_port = rcv_name_8;
  }
  uint64_t v6 = mach_msg((mach_msg_header_t *)&v10, 3162115, 0x18u, 0x30u, special_reply_port, 0, 0);
  uint64_t v7 = v6;
  if ((v6 - 268435458) > 0xE || ((1 << (v6 - 2)) & 0x4003) == 0)
  {
    if (!v6)
    {
      if (*(_DWORD *)&rcv_name_12[4] == 71)
      {
        uint64_t v7 = 4294966988;
      }
      else if (*(_DWORD *)&rcv_name_12[4] == 69818)
      {
        if ((v10 & 0x80000000) == 0)
        {
          if (rcv_name == 40)
          {
            if (!rcv_name_4)
            {
              uint64_t v7 = *(unsigned int *)&rcv_name_12[16];
              if (!*(_DWORD *)&rcv_name_12[16])
              {
                *a2 = *(_DWORD *)&rcv_name_12[20];
                return v7;
              }
              goto LABEL_22;
            }
          }
          else if (rcv_name == 36)
          {
            if (rcv_name_4) {
              BOOL v8 = 1;
            }
            else {
              BOOL v8 = *(_DWORD *)&rcv_name_12[16] == 0;
            }
            if (v8) {
              uint64_t v7 = 4294966996;
            }
            else {
              uint64_t v7 = *(unsigned int *)&rcv_name_12[16];
            }
            goto LABEL_22;
          }
        }
        uint64_t v7 = 4294966996;
      }
      else
      {
        uint64_t v7 = 4294966995;
      }
LABEL_22:
      mach_msg_destroy((mach_msg_header_t *)&v10);
      return v7;
    }
    mig_dealloc_special_reply_port();
  }
  return v7;
}

uint64_t wifi_manager_get_wow_capability(int a1, _DWORD *a2)
{
  *(void *)&long long v4 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v4 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)&rcv_name_12[16] = v4;
  *(_OWORD *)&rcv_name_12[4] = v4;
  int rcv_name = -1431655766;
  mach_port_name_t special_reply_port = mig_get_special_reply_port();
  int rcv_name_4 = a1;
  mach_port_name_t rcv_name_8 = special_reply_port;
  int v10 = 5395;
  *(void *)rcv_name_12 = 0x1105700000000;
  if (MEMORY[0x1E4F14B18])
  {
    voucher_mach_msg_set((mach_msg_header_t *)&v10);
    mach_port_name_t special_reply_port = rcv_name_8;
  }
  uint64_t v6 = mach_msg((mach_msg_header_t *)&v10, 3162115, 0x18u, 0x30u, special_reply_port, 0, 0);
  uint64_t v7 = v6;
  if ((v6 - 268435458) > 0xE || ((1 << (v6 - 2)) & 0x4003) == 0)
  {
    if (!v6)
    {
      if (*(_DWORD *)&rcv_name_12[4] == 71)
      {
        uint64_t v7 = 4294966988;
      }
      else if (*(_DWORD *)&rcv_name_12[4] == 69819)
      {
        if ((v10 & 0x80000000) == 0)
        {
          if (rcv_name == 40)
          {
            if (!rcv_name_4)
            {
              uint64_t v7 = *(unsigned int *)&rcv_name_12[16];
              if (!*(_DWORD *)&rcv_name_12[16])
              {
                *a2 = *(_DWORD *)&rcv_name_12[20];
                return v7;
              }
              goto LABEL_22;
            }
          }
          else if (rcv_name == 36)
          {
            if (rcv_name_4) {
              BOOL v8 = 1;
            }
            else {
              BOOL v8 = *(_DWORD *)&rcv_name_12[16] == 0;
            }
            if (v8) {
              uint64_t v7 = 4294966996;
            }
            else {
              uint64_t v7 = *(unsigned int *)&rcv_name_12[16];
            }
            goto LABEL_22;
          }
        }
        uint64_t v7 = 4294966996;
      }
      else
      {
        uint64_t v7 = 4294966995;
      }
LABEL_22:
      mach_msg_destroy((mach_msg_header_t *)&v10);
      return v7;
    }
    mig_dealloc_special_reply_port();
  }
  return v7;
}

uint64_t wifi_manager_get_bgscancache_state(int a1, _DWORD *a2)
{
  *(void *)&long long v4 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v4 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)&rcv_name_12[16] = v4;
  *(_OWORD *)&rcv_name_12[4] = v4;
  int rcv_name = -1431655766;
  mach_port_name_t special_reply_port = mig_get_special_reply_port();
  int rcv_name_4 = a1;
  mach_port_name_t rcv_name_8 = special_reply_port;
  int v10 = 5395;
  *(void *)rcv_name_12 = 0x1105800000000;
  if (MEMORY[0x1E4F14B18])
  {
    voucher_mach_msg_set((mach_msg_header_t *)&v10);
    mach_port_name_t special_reply_port = rcv_name_8;
  }
  uint64_t v6 = mach_msg((mach_msg_header_t *)&v10, 3162115, 0x18u, 0x30u, special_reply_port, 0, 0);
  uint64_t v7 = v6;
  if ((v6 - 268435458) > 0xE || ((1 << (v6 - 2)) & 0x4003) == 0)
  {
    if (!v6)
    {
      if (*(_DWORD *)&rcv_name_12[4] == 71)
      {
        uint64_t v7 = 4294966988;
      }
      else if (*(_DWORD *)&rcv_name_12[4] == 69820)
      {
        if ((v10 & 0x80000000) == 0)
        {
          if (rcv_name == 40)
          {
            if (!rcv_name_4)
            {
              uint64_t v7 = *(unsigned int *)&rcv_name_12[16];
              if (!*(_DWORD *)&rcv_name_12[16])
              {
                *a2 = *(_DWORD *)&rcv_name_12[20];
                return v7;
              }
              goto LABEL_22;
            }
          }
          else if (rcv_name == 36)
          {
            if (rcv_name_4) {
              BOOL v8 = 1;
            }
            else {
              BOOL v8 = *(_DWORD *)&rcv_name_12[16] == 0;
            }
            if (v8) {
              uint64_t v7 = 4294966996;
            }
            else {
              uint64_t v7 = *(unsigned int *)&rcv_name_12[16];
            }
            goto LABEL_22;
          }
        }
        uint64_t v7 = 4294966996;
      }
      else
      {
        uint64_t v7 = 4294966995;
      }
LABEL_22:
      mach_msg_destroy((mach_msg_header_t *)&v10);
      return v7;
    }
    mig_dealloc_special_reply_port();
  }
  return v7;
}

uint64_t wifi_manager_set_retry_cap(mach_port_t a1, int a2)
{
  uint64_t v4 = *MEMORY[0x1E4F14068];
  int v5 = a2;
  *(void *)&msg.msgh_bits = 0xAAAAAAAA00000013;
  msg.msgh_voucher_port = 0;
  msg.msgh_id = 69721;
  msg.mach_port_t msgh_remote_port = a1;
  msg.msgh_local_port = 0;
  if (MEMORY[0x1E4F14B18]) {
    voucher_mach_msg_set(&msg);
  }
  return mach_msg(&msg, 2097153, 0x24u, 0, 0, 0, 0);
}

uint64_t wifi_manager_get_retry_cap(int a1, _DWORD *a2)
{
  *(void *)&long long v4 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v4 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)&rcv_name_12[16] = v4;
  *(_OWORD *)&rcv_name_12[4] = v4;
  int rcv_name = -1431655766;
  mach_port_name_t special_reply_port = mig_get_special_reply_port();
  int rcv_name_4 = a1;
  mach_port_name_t rcv_name_8 = special_reply_port;
  int v10 = 5395;
  *(void *)rcv_name_12 = 0x1105A00000000;
  if (MEMORY[0x1E4F14B18])
  {
    voucher_mach_msg_set((mach_msg_header_t *)&v10);
    mach_port_name_t special_reply_port = rcv_name_8;
  }
  uint64_t v6 = mach_msg((mach_msg_header_t *)&v10, 3162115, 0x18u, 0x30u, special_reply_port, 0, 0);
  uint64_t v7 = v6;
  if ((v6 - 268435458) > 0xE || ((1 << (v6 - 2)) & 0x4003) == 0)
  {
    if (!v6)
    {
      if (*(_DWORD *)&rcv_name_12[4] == 71)
      {
        uint64_t v7 = 4294966988;
      }
      else if (*(_DWORD *)&rcv_name_12[4] == 69822)
      {
        if ((v10 & 0x80000000) == 0)
        {
          if (rcv_name == 40)
          {
            if (!rcv_name_4)
            {
              uint64_t v7 = *(unsigned int *)&rcv_name_12[16];
              if (!*(_DWORD *)&rcv_name_12[16])
              {
                *a2 = *(_DWORD *)&rcv_name_12[20];
                return v7;
              }
              goto LABEL_22;
            }
          }
          else if (rcv_name == 36)
          {
            if (rcv_name_4) {
              BOOL v8 = 1;
            }
            else {
              BOOL v8 = *(_DWORD *)&rcv_name_12[16] == 0;
            }
            if (v8) {
              uint64_t v7 = 4294966996;
            }
            else {
              uint64_t v7 = *(unsigned int *)&rcv_name_12[16];
            }
            goto LABEL_22;
          }
        }
        uint64_t v7 = 4294966996;
      }
      else
      {
        uint64_t v7 = 4294966995;
      }
LABEL_22:
      mach_msg_destroy((mach_msg_header_t *)&v10);
      return v7;
    }
    mig_dealloc_special_reply_port();
  }
  return v7;
}

uint64_t wifi_manager_set_association_mode(mach_port_t a1, int a2)
{
  uint64_t v4 = *MEMORY[0x1E4F14068];
  int v5 = a2;
  *(void *)&msg.msgh_bits = 0xAAAAAAAA00000013;
  msg.msgh_voucher_port = 0;
  msg.msgh_id = 69723;
  msg.mach_port_t msgh_remote_port = a1;
  msg.msgh_local_port = 0;
  if (MEMORY[0x1E4F14B18]) {
    voucher_mach_msg_set(&msg);
  }
  return mach_msg(&msg, 2097153, 0x24u, 0, 0, 0, 0);
}

uint64_t wifi_manager_get_association_mode(int a1, _DWORD *a2)
{
  *(void *)&long long v4 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v4 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)&rcv_name_12[16] = v4;
  *(_OWORD *)&rcv_name_12[4] = v4;
  int rcv_name = -1431655766;
  mach_port_name_t special_reply_port = mig_get_special_reply_port();
  int rcv_name_4 = a1;
  mach_port_name_t rcv_name_8 = special_reply_port;
  int v10 = 5395;
  *(void *)rcv_name_12 = 0x1105C00000000;
  if (MEMORY[0x1E4F14B18])
  {
    voucher_mach_msg_set((mach_msg_header_t *)&v10);
    mach_port_name_t special_reply_port = rcv_name_8;
  }
  uint64_t v6 = mach_msg((mach_msg_header_t *)&v10, 3162115, 0x18u, 0x30u, special_reply_port, 0, 0);
  uint64_t v7 = v6;
  if ((v6 - 268435458) > 0xE || ((1 << (v6 - 2)) & 0x4003) == 0)
  {
    if (!v6)
    {
      if (*(_DWORD *)&rcv_name_12[4] == 71)
      {
        uint64_t v7 = 4294966988;
      }
      else if (*(_DWORD *)&rcv_name_12[4] == 69824)
      {
        if ((v10 & 0x80000000) == 0)
        {
          if (rcv_name == 40)
          {
            if (!rcv_name_4)
            {
              uint64_t v7 = *(unsigned int *)&rcv_name_12[16];
              if (!*(_DWORD *)&rcv_name_12[16])
              {
                *a2 = *(_DWORD *)&rcv_name_12[20];
                return v7;
              }
              goto LABEL_22;
            }
          }
          else if (rcv_name == 36)
          {
            if (rcv_name_4) {
              BOOL v8 = 1;
            }
            else {
              BOOL v8 = *(_DWORD *)&rcv_name_12[16] == 0;
            }
            if (v8) {
              uint64_t v7 = 4294966996;
            }
            else {
              uint64_t v7 = *(unsigned int *)&rcv_name_12[16];
            }
            goto LABEL_22;
          }
        }
        uint64_t v7 = 4294966996;
      }
      else
      {
        uint64_t v7 = 4294966995;
      }
LABEL_22:
      mach_msg_destroy((mach_msg_header_t *)&v10);
      return v7;
    }
    mig_dealloc_special_reply_port();
  }
  return v7;
}

uint64_t wifi_manager_get_nanclient_assoc_status(int a1, _DWORD *a2)
{
  *(void *)&long long v4 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v4 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)&rcv_name_12[16] = v4;
  *(_OWORD *)&rcv_name_12[4] = v4;
  int rcv_name = -1431655766;
  mach_port_name_t special_reply_port = mig_get_special_reply_port();
  int rcv_name_4 = a1;
  mach_port_name_t rcv_name_8 = special_reply_port;
  int v10 = 5395;
  *(void *)rcv_name_12 = 0x1105D00000000;
  if (MEMORY[0x1E4F14B18])
  {
    voucher_mach_msg_set((mach_msg_header_t *)&v10);
    mach_port_name_t special_reply_port = rcv_name_8;
  }
  uint64_t v6 = mach_msg((mach_msg_header_t *)&v10, 3162115, 0x18u, 0x30u, special_reply_port, 0, 0);
  uint64_t v7 = v6;
  if ((v6 - 268435458) > 0xE || ((1 << (v6 - 2)) & 0x4003) == 0)
  {
    if (!v6)
    {
      if (*(_DWORD *)&rcv_name_12[4] == 71)
      {
        uint64_t v7 = 4294966988;
      }
      else if (*(_DWORD *)&rcv_name_12[4] == 69825)
      {
        if ((v10 & 0x80000000) == 0)
        {
          if (rcv_name == 40)
          {
            if (!rcv_name_4)
            {
              uint64_t v7 = *(unsigned int *)&rcv_name_12[16];
              if (!*(_DWORD *)&rcv_name_12[16])
              {
                *a2 = *(_DWORD *)&rcv_name_12[20];
                return v7;
              }
              goto LABEL_22;
            }
          }
          else if (rcv_name == 36)
          {
            if (rcv_name_4) {
              BOOL v8 = 1;
            }
            else {
              BOOL v8 = *(_DWORD *)&rcv_name_12[16] == 0;
            }
            if (v8) {
              uint64_t v7 = 4294966996;
            }
            else {
              uint64_t v7 = *(unsigned int *)&rcv_name_12[16];
            }
            goto LABEL_22;
          }
        }
        uint64_t v7 = 4294966996;
      }
      else
      {
        uint64_t v7 = 4294966995;
      }
LABEL_22:
      mach_msg_destroy((mach_msg_header_t *)&v10);
      return v7;
    }
    mig_dealloc_special_reply_port();
  }
  return v7;
}

uint64_t wifi_manager_set_nan_off_head_connection_expiry(mach_port_t a1, double a2)
{
  uint64_t v4 = *MEMORY[0x1E4F14068];
  double v5 = a2;
  *(void *)&msg.msgh_bits = 0xAAAAAAAA00000013;
  msg.msgh_voucher_port = 0;
  msg.msgh_id = 69726;
  msg.mach_port_t msgh_remote_port = a1;
  msg.msgh_local_port = 0;
  if (MEMORY[0x1E4F14B18]) {
    voucher_mach_msg_set(&msg);
  }
  return mach_msg(&msg, 2097153, 0x28u, 0, 0, 0, 0);
}

uint64_t wifi_manager_get_nan_off_head_connection_expiry(int a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  *(void *)&long long v4 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v4 + 1) = 0xAAAAAAAAAAAAAAAALL;
  long long v11 = v4;
  *(_OWORD *)&msg[20] = v4;
  *(_DWORD *)&msg[4] = -1431655766;
  mach_port_name_t special_reply_port = mig_get_special_reply_port();
  *(_DWORD *)&msg[8] = a1;
  *(_DWORD *)&msg[12] = special_reply_port;
  *(_DWORD *)mach_msg_header_t msg = 5395;
  *(void *)&msg[16] = 0x1105F00000000;
  if (MEMORY[0x1E4F14B18])
  {
    voucher_mach_msg_set((mach_msg_header_t *)msg);
    mach_port_name_t special_reply_port = *(_DWORD *)&msg[12];
  }
  uint64_t v6 = mach_msg((mach_msg_header_t *)msg, 3162115, 0x18u, 0x34u, special_reply_port, 0, 0);
  uint64_t v7 = v6;
  if ((v6 - 268435458) > 0xE || ((1 << (v6 - 2)) & 0x4003) == 0)
  {
    if (!v6)
    {
      if (*(_DWORD *)&msg[20] == 71)
      {
        uint64_t v7 = 4294966988;
      }
      else if (*(_DWORD *)&msg[20] == 69827)
      {
        if ((*(_DWORD *)msg & 0x80000000) == 0)
        {
          if (*(_DWORD *)&msg[4] == 44)
          {
            if (!*(_DWORD *)&msg[8])
            {
              uint64_t v7 = *(unsigned int *)&msg[32];
              if (!*(_DWORD *)&msg[32])
              {
                *a2 = v11;
                return v7;
              }
              goto LABEL_22;
            }
          }
          else if (*(_DWORD *)&msg[4] == 36)
          {
            if (*(_DWORD *)&msg[8]) {
              BOOL v8 = 1;
            }
            else {
              BOOL v8 = *(_DWORD *)&msg[32] == 0;
            }
            if (v8) {
              uint64_t v7 = 4294966996;
            }
            else {
              uint64_t v7 = *(unsigned int *)&msg[32];
            }
            goto LABEL_22;
          }
        }
        uint64_t v7 = 4294966996;
      }
      else
      {
        uint64_t v7 = 4294966995;
      }
LABEL_22:
      mach_msg_destroy((mach_msg_header_t *)msg);
      return v7;
    }
    mig_dealloc_special_reply_port();
  }
  return v7;
}

uint64_t wifi_manager_set_asktojoin_preference(mach_port_t a1, int a2)
{
  uint64_t v4 = *MEMORY[0x1E4F14068];
  int v5 = a2;
  *(void *)&msg.msgh_bits = 0xAAAAAAAA00000013;
  msg.msgh_voucher_port = 0;
  msg.msgh_id = 69728;
  msg.mach_port_t msgh_remote_port = a1;
  msg.msgh_local_port = 0;
  if (MEMORY[0x1E4F14B18]) {
    voucher_mach_msg_set(&msg);
  }
  return mach_msg(&msg, 2097153, 0x24u, 0, 0, 0, 0);
}

uint64_t wifi_manager_get_asktojoin_preference(int a1, _DWORD *a2)
{
  *(void *)&long long v4 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v4 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)&rcv_name_12[16] = v4;
  *(_OWORD *)&rcv_name_12[4] = v4;
  int rcv_name = -1431655766;
  mach_port_name_t special_reply_port = mig_get_special_reply_port();
  int rcv_name_4 = a1;
  mach_port_name_t rcv_name_8 = special_reply_port;
  int v10 = 5395;
  *(void *)rcv_name_12 = 0x1106100000000;
  if (MEMORY[0x1E4F14B18])
  {
    voucher_mach_msg_set((mach_msg_header_t *)&v10);
    mach_port_name_t special_reply_port = rcv_name_8;
  }
  uint64_t v6 = mach_msg((mach_msg_header_t *)&v10, 3162115, 0x18u, 0x30u, special_reply_port, 0, 0);
  uint64_t v7 = v6;
  if ((v6 - 268435458) > 0xE || ((1 << (v6 - 2)) & 0x4003) == 0)
  {
    if (!v6)
    {
      if (*(_DWORD *)&rcv_name_12[4] == 71)
      {
        uint64_t v7 = 4294966988;
      }
      else if (*(_DWORD *)&rcv_name_12[4] == 69829)
      {
        if ((v10 & 0x80000000) == 0)
        {
          if (rcv_name == 40)
          {
            if (!rcv_name_4)
            {
              uint64_t v7 = *(unsigned int *)&rcv_name_12[16];
              if (!*(_DWORD *)&rcv_name_12[16])
              {
                *a2 = *(_DWORD *)&rcv_name_12[20];
                return v7;
              }
              goto LABEL_22;
            }
          }
          else if (rcv_name == 36)
          {
            if (rcv_name_4) {
              BOOL v8 = 1;
            }
            else {
              BOOL v8 = *(_DWORD *)&rcv_name_12[16] == 0;
            }
            if (v8) {
              uint64_t v7 = 4294966996;
            }
            else {
              uint64_t v7 = *(unsigned int *)&rcv_name_12[16];
            }
            goto LABEL_22;
          }
        }
        uint64_t v7 = 4294966996;
      }
      else
      {
        uint64_t v7 = 4294966995;
      }
LABEL_22:
      mach_msg_destroy((mach_msg_header_t *)&v10);
      return v7;
    }
    mig_dealloc_special_reply_port();
  }
  return v7;
}

uint64_t wifi_manager_is_tethering_supported(int a1, _DWORD *a2)
{
  *(void *)&long long v4 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v4 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)&rcv_name_12[16] = v4;
  *(_OWORD *)&rcv_name_12[4] = v4;
  int rcv_name = -1431655766;
  mach_port_name_t special_reply_port = mig_get_special_reply_port();
  int rcv_name_4 = a1;
  mach_port_name_t rcv_name_8 = special_reply_port;
  int v10 = 5395;
  *(void *)rcv_name_12 = 0x1106400000000;
  if (MEMORY[0x1E4F14B18])
  {
    voucher_mach_msg_set((mach_msg_header_t *)&v10);
    mach_port_name_t special_reply_port = rcv_name_8;
  }
  uint64_t v6 = mach_msg((mach_msg_header_t *)&v10, 3162115, 0x18u, 0x30u, special_reply_port, 0, 0);
  uint64_t v7 = v6;
  if ((v6 - 268435458) > 0xE || ((1 << (v6 - 2)) & 0x4003) == 0)
  {
    if (!v6)
    {
      if (*(_DWORD *)&rcv_name_12[4] == 71)
      {
        uint64_t v7 = 4294966988;
      }
      else if (*(_DWORD *)&rcv_name_12[4] == 69832)
      {
        if ((v10 & 0x80000000) == 0)
        {
          if (rcv_name == 40)
          {
            if (!rcv_name_4)
            {
              uint64_t v7 = *(unsigned int *)&rcv_name_12[16];
              if (!*(_DWORD *)&rcv_name_12[16])
              {
                *a2 = *(_DWORD *)&rcv_name_12[20];
                return v7;
              }
              goto LABEL_22;
            }
          }
          else if (rcv_name == 36)
          {
            if (rcv_name_4) {
              BOOL v8 = 1;
            }
            else {
              BOOL v8 = *(_DWORD *)&rcv_name_12[16] == 0;
            }
            if (v8) {
              uint64_t v7 = 4294966996;
            }
            else {
              uint64_t v7 = *(unsigned int *)&rcv_name_12[16];
            }
            goto LABEL_22;
          }
        }
        uint64_t v7 = 4294966996;
      }
      else
      {
        uint64_t v7 = 4294966995;
      }
LABEL_22:
      mach_msg_destroy((mach_msg_header_t *)&v10);
      return v7;
    }
    mig_dealloc_special_reply_port();
  }
  return v7;
}

uint64_t wifi_manager_copy_mis_stats(int a1, void *a2, _DWORD *a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  *(void *)&long long v6 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v6 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)&v13[12] = v6;
  *(_OWORD *)uint64_t v13 = v6;
  *(_OWORD *)&msg[20] = v6;
  *(_DWORD *)&msg[4] = -1431655766;
  mach_port_name_t special_reply_port = mig_get_special_reply_port();
  *(_DWORD *)&msg[8] = a1;
  *(_DWORD *)&msg[12] = special_reply_port;
  *(_DWORD *)mach_msg_header_t msg = 5395;
  *(void *)&msg[16] = 0x1106500000000;
  if (MEMORY[0x1E4F14B18])
  {
    voucher_mach_msg_set((mach_msg_header_t *)msg);
    mach_port_name_t special_reply_port = *(_DWORD *)&msg[12];
  }
  uint64_t v8 = mach_msg((mach_msg_header_t *)msg, 3162115, 0x18u, 0x40u, special_reply_port, 0, 0);
  uint64_t v9 = v8;
  if ((v8 - 268435458) > 0xE || ((1 << (v8 - 2)) & 0x4003) == 0)
  {
    if (!v8)
    {
      if (*(_DWORD *)&msg[20] == 71)
      {
        uint64_t v9 = 4294966988;
      }
      else if (*(_DWORD *)&msg[20] == 69833)
      {
        if ((*(_DWORD *)msg & 0x80000000) == 0)
        {
          if (*(_DWORD *)&msg[4] == 36)
          {
            uint64_t v9 = 4294966996;
            if (*(_DWORD *)&msg[32])
            {
              if (*(_DWORD *)&msg[8]) {
                uint64_t v9 = 4294966996;
              }
              else {
                uint64_t v9 = *(unsigned int *)&msg[32];
              }
            }
          }
          else
          {
            uint64_t v9 = 4294966996;
          }
          goto LABEL_24;
        }
        uint64_t v9 = 4294966996;
        if (*(_DWORD *)&msg[24] == 1 && *(_DWORD *)&msg[4] == 56 && !*(_DWORD *)&msg[8] && v13[3] == 1)
        {
          int v10 = *(_DWORD *)&v13[4];
          if (*(_DWORD *)&v13[4] == *(_DWORD *)&v13[16])
          {
            uint64_t v9 = 0;
            *a2 = *(void *)&msg[28];
            *a3 = v10;
            return v9;
          }
        }
      }
      else
      {
        uint64_t v9 = 4294966995;
      }
LABEL_24:
      mach_msg_destroy((mach_msg_header_t *)msg);
      return v9;
    }
    mig_dealloc_special_reply_port();
  }
  return v9;
}

uint64_t wifi_manager_reset_mis_stats(int a1)
{
  unint64_t v8 = 0xAAAAAAAAAAAAAAAALL;
  *(void *)&long long v2 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v2 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)&msg[20] = v2;
  *(_DWORD *)&msg[4] = -1431655766;
  mach_port_name_t special_reply_port = mig_get_special_reply_port();
  *(_DWORD *)&msg[8] = a1;
  *(_DWORD *)&msg[12] = special_reply_port;
  *(_DWORD *)mach_msg_header_t msg = 5395;
  *(void *)&msg[16] = 0x1106600000000;
  if (MEMORY[0x1E4F14B18])
  {
    voucher_mach_msg_set((mach_msg_header_t *)msg);
    mach_port_name_t special_reply_port = *(_DWORD *)&msg[12];
  }
  uint64_t v4 = mach_msg((mach_msg_header_t *)msg, 3162115, 0x18u, 0x2Cu, special_reply_port, 0, 0);
  uint64_t v5 = v4;
  if ((v4 - 268435458) > 0xE || ((1 << (v4 - 2)) & 0x4003) == 0)
  {
    if (v4)
    {
      mig_dealloc_special_reply_port();
      return v5;
    }
    if (*(_DWORD *)&msg[20] == 71)
    {
      uint64_t v5 = 4294966988;
    }
    else if (*(_DWORD *)&msg[20] == 69834)
    {
      uint64_t v5 = 4294966996;
      if ((*(_DWORD *)msg & 0x80000000) == 0 && *(_DWORD *)&msg[4] == 36 && !*(_DWORD *)&msg[8])
      {
        uint64_t v5 = *(unsigned int *)&msg[32];
        if (!*(_DWORD *)&msg[32]) {
          return v5;
        }
      }
    }
    else
    {
      uint64_t v5 = 4294966995;
    }
    mach_msg_destroy((mach_msg_header_t *)msg);
  }
  return v5;
}

uint64_t wifi_manager_is_always_on_wifi_supported(int a1, _DWORD *a2)
{
  *(void *)&long long v4 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v4 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)&rcv_name_12[16] = v4;
  *(_OWORD *)&rcv_name_12[4] = v4;
  int rcv_name = -1431655766;
  mach_port_name_t special_reply_port = mig_get_special_reply_port();
  int rcv_name_4 = a1;
  mach_port_name_t rcv_name_8 = special_reply_port;
  int v10 = 5395;
  *(void *)rcv_name_12 = 0x1106700000000;
  if (MEMORY[0x1E4F14B18])
  {
    voucher_mach_msg_set((mach_msg_header_t *)&v10);
    mach_port_name_t special_reply_port = rcv_name_8;
  }
  uint64_t v6 = mach_msg((mach_msg_header_t *)&v10, 3162115, 0x18u, 0x30u, special_reply_port, 0, 0);
  uint64_t v7 = v6;
  if ((v6 - 268435458) > 0xE || ((1 << (v6 - 2)) & 0x4003) == 0)
  {
    if (!v6)
    {
      if (*(_DWORD *)&rcv_name_12[4] == 71)
      {
        uint64_t v7 = 4294966988;
      }
      else if (*(_DWORD *)&rcv_name_12[4] == 69835)
      {
        if ((v10 & 0x80000000) == 0)
        {
          if (rcv_name == 40)
          {
            if (!rcv_name_4)
            {
              uint64_t v7 = *(unsigned int *)&rcv_name_12[16];
              if (!*(_DWORD *)&rcv_name_12[16])
              {
                *a2 = *(_DWORD *)&rcv_name_12[20];
                return v7;
              }
              goto LABEL_22;
            }
          }
          else if (rcv_name == 36)
          {
            if (rcv_name_4) {
              BOOL v8 = 1;
            }
            else {
              BOOL v8 = *(_DWORD *)&rcv_name_12[16] == 0;
            }
            if (v8) {
              uint64_t v7 = 4294966996;
            }
            else {
              uint64_t v7 = *(unsigned int *)&rcv_name_12[16];
            }
            goto LABEL_22;
          }
        }
        uint64_t v7 = 4294966996;
      }
      else
      {
        uint64_t v7 = 4294966995;
      }
LABEL_22:
      mach_msg_destroy((mach_msg_header_t *)&v10);
      return v7;
    }
    mig_dealloc_special_reply_port();
  }
  return v7;
}

uint64_t wifi_manager_copy_locale_stats(int a1, void *a2, _DWORD *a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  *(void *)&long long v6 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v6 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)&v13[12] = v6;
  *(_OWORD *)uint64_t v13 = v6;
  *(_OWORD *)&msg[20] = v6;
  *(_DWORD *)&msg[4] = -1431655766;
  mach_port_name_t special_reply_port = mig_get_special_reply_port();
  *(_DWORD *)&msg[8] = a1;
  *(_DWORD *)&msg[12] = special_reply_port;
  *(_DWORD *)mach_msg_header_t msg = 5395;
  *(void *)&msg[16] = 0x1106800000000;
  if (MEMORY[0x1E4F14B18])
  {
    voucher_mach_msg_set((mach_msg_header_t *)msg);
    mach_port_name_t special_reply_port = *(_DWORD *)&msg[12];
  }
  uint64_t v8 = mach_msg((mach_msg_header_t *)msg, 3162115, 0x18u, 0x40u, special_reply_port, 0, 0);
  uint64_t v9 = v8;
  if ((v8 - 268435458) > 0xE || ((1 << (v8 - 2)) & 0x4003) == 0)
  {
    if (!v8)
    {
      if (*(_DWORD *)&msg[20] == 71)
      {
        uint64_t v9 = 4294966988;
      }
      else if (*(_DWORD *)&msg[20] == 69836)
      {
        if ((*(_DWORD *)msg & 0x80000000) == 0)
        {
          if (*(_DWORD *)&msg[4] == 36)
          {
            uint64_t v9 = 4294966996;
            if (*(_DWORD *)&msg[32])
            {
              if (*(_DWORD *)&msg[8]) {
                uint64_t v9 = 4294966996;
              }
              else {
                uint64_t v9 = *(unsigned int *)&msg[32];
              }
            }
          }
          else
          {
            uint64_t v9 = 4294966996;
          }
          goto LABEL_24;
        }
        uint64_t v9 = 4294966996;
        if (*(_DWORD *)&msg[24] == 1 && *(_DWORD *)&msg[4] == 56 && !*(_DWORD *)&msg[8] && v13[3] == 1)
        {
          int v10 = *(_DWORD *)&v13[4];
          if (*(_DWORD *)&v13[4] == *(_DWORD *)&v13[16])
          {
            uint64_t v9 = 0;
            *a2 = *(void *)&msg[28];
            *a3 = v10;
            return v9;
          }
        }
      }
      else
      {
        uint64_t v9 = 4294966995;
      }
LABEL_24:
      mach_msg_destroy((mach_msg_header_t *)msg);
      return v9;
    }
    mig_dealloc_special_reply_port();
  }
  return v9;
}

uint64_t wifi_manager_mis_set_password(mach_port_t a1, uint64_t a2, int a3, int *a4)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  int v12 = 1;
  uint64_t v13 = a2;
  int v14 = 27918592;
  int v15 = a3;
  uint64_t v16 = *MEMORY[0x1E4F14068];
  int v17 = a3;
  mach_port_t special_reply_port = mig_get_special_reply_port();
  *(void *)&v11.msgh_bits = 0xAAAAAAAA80001513;
  v11.mach_port_t msgh_remote_port = a1;
  v11.msgh_local_port = special_reply_port;
  *(void *)&v11.msgh_voucher_port = 0x1106900000000;
  if (MEMORY[0x1E4F14B18])
  {
    voucher_mach_msg_set(&v11);
    mach_port_t special_reply_port = v11.msgh_local_port;
  }
  uint64_t v7 = mach_msg(&v11, 3162115, 0x38u, 0x30u, special_reply_port, 0, 0);
  uint64_t v8 = v7;
  if ((v7 - 268435458) > 0xE || ((1 << (v7 - 2)) & 0x4003) == 0)
  {
    if (!v7)
    {
      if (v11.msgh_id == 71)
      {
        uint64_t v8 = 4294966988;
      }
      else if (v11.msgh_id == 69837)
      {
        if ((v11.msgh_bits & 0x80000000) == 0)
        {
          if (v11.msgh_size == 40)
          {
            if (!v11.msgh_remote_port)
            {
              uint64_t v8 = HIDWORD(v13);
              if (!HIDWORD(v13))
              {
                *a4 = v14;
                return v8;
              }
              goto LABEL_22;
            }
          }
          else if (v11.msgh_size == 36)
          {
            if (v11.msgh_remote_port) {
              BOOL v9 = 1;
            }
            else {
              BOOL v9 = HIDWORD(v13) == 0;
            }
            if (v9) {
              uint64_t v8 = 4294966996;
            }
            else {
              uint64_t v8 = HIDWORD(v13);
            }
            goto LABEL_22;
          }
        }
        uint64_t v8 = 4294966996;
      }
      else
      {
        uint64_t v8 = 4294966995;
      }
LABEL_22:
      mach_msg_destroy(&v11);
      return v8;
    }
    mig_dealloc_special_reply_port();
  }
  return v8;
}

uint64_t wifi_manager_mis_copy_password(int a1, void *a2, _DWORD *a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  *(void *)&long long v6 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v6 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)&v13[12] = v6;
  *(_OWORD *)uint64_t v13 = v6;
  *(_OWORD *)&msg[20] = v6;
  *(_DWORD *)&msg[4] = -1431655766;
  mach_port_name_t special_reply_port = mig_get_special_reply_port();
  *(_DWORD *)&msg[8] = a1;
  *(_DWORD *)&msg[12] = special_reply_port;
  *(_DWORD *)mach_msg_header_t msg = 5395;
  *(void *)&msg[16] = 0x1106A00000000;
  if (MEMORY[0x1E4F14B18])
  {
    voucher_mach_msg_set((mach_msg_header_t *)msg);
    mach_port_name_t special_reply_port = *(_DWORD *)&msg[12];
  }
  uint64_t v8 = mach_msg((mach_msg_header_t *)msg, 3162115, 0x18u, 0x40u, special_reply_port, 0, 0);
  uint64_t v9 = v8;
  if ((v8 - 268435458) > 0xE || ((1 << (v8 - 2)) & 0x4003) == 0)
  {
    if (!v8)
    {
      if (*(_DWORD *)&msg[20] == 71)
      {
        uint64_t v9 = 4294966988;
      }
      else if (*(_DWORD *)&msg[20] == 69838)
      {
        if ((*(_DWORD *)msg & 0x80000000) == 0)
        {
          if (*(_DWORD *)&msg[4] == 36)
          {
            uint64_t v9 = 4294966996;
            if (*(_DWORD *)&msg[32])
            {
              if (*(_DWORD *)&msg[8]) {
                uint64_t v9 = 4294966996;
              }
              else {
                uint64_t v9 = *(unsigned int *)&msg[32];
              }
            }
          }
          else
          {
            uint64_t v9 = 4294966996;
          }
          goto LABEL_24;
        }
        uint64_t v9 = 4294966996;
        if (*(_DWORD *)&msg[24] == 1 && *(_DWORD *)&msg[4] == 56 && !*(_DWORD *)&msg[8] && v13[3] == 1)
        {
          int v10 = *(_DWORD *)&v13[4];
          if (*(_DWORD *)&v13[4] == *(_DWORD *)&v13[16])
          {
            uint64_t v9 = 0;
            *a2 = *(void *)&msg[28];
            *a3 = v10;
            return v9;
          }
        }
      }
      else
      {
        uint64_t v9 = 4294966995;
      }
LABEL_24:
      mach_msg_destroy((mach_msg_header_t *)msg);
      return v9;
    }
    mig_dealloc_special_reply_port();
  }
  return v9;
}

uint64_t wifi_device_set_property(int a1, uint64_t a2, int a3, uint64_t a4, int a5, uint64_t a6, int a7)
{
  uint64_t v11 = a2;
  int v12 = 27918592;
  int v13 = a3;
  uint64_t v14 = a4;
  int v15 = 27918592;
  int v16 = a5;
  uint64_t v17 = a6;
  int v18 = 27918592;
  int v19 = a7;
  uint64_t v20 = *MEMORY[0x1E4F14068];
  int v21 = a3;
  int v22 = a5;
  int v23 = a7;
  unint64_t v8 = 0xAAAAAAAA80000013;
  int v9 = a1;
  long long v10 = xmmword_1BF21A2D0;
  if (MEMORY[0x1E4F14B18]) {
    voucher_mach_msg_set((mach_msg_header_t *)&v8);
  }
  return mach_msg((mach_msg_header_t *)&v8, 2097153, 0x60u, 0, 0, 0, 0);
}

uint64_t wifi_device_set_power(mach_port_t a1, uint64_t a2, int a3, int a4, int *a5)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  int v13 = 1;
  uint64_t v14 = a2;
  int v15 = 27918592;
  int v16 = a3;
  uint64_t v17 = *MEMORY[0x1E4F14068];
  int v18 = a3;
  int v19 = a4;
  mach_port_t special_reply_port = mig_get_special_reply_port();
  *(void *)&msg.msgh_bits = 0xAAAAAAAA80001513;
  msg.mach_port_t msgh_remote_port = a1;
  msg.msgh_local_port = special_reply_port;
  *(void *)&msg.msgh_voucher_port = 0x1106F00000000;
  if (MEMORY[0x1E4F14B18])
  {
    voucher_mach_msg_set(&msg);
    mach_port_t special_reply_port = msg.msgh_local_port;
  }
  uint64_t v8 = mach_msg(&msg, 3162115, 0x3Cu, 0x30u, special_reply_port, 0, 0);
  uint64_t v9 = v8;
  if ((v8 - 268435458) > 0xE || ((1 << (v8 - 2)) & 0x4003) == 0)
  {
    if (!v8)
    {
      if (msg.msgh_id == 71)
      {
        uint64_t v9 = 4294966988;
      }
      else if (msg.msgh_id == 69843)
      {
        if ((msg.msgh_bits & 0x80000000) == 0)
        {
          if (msg.msgh_size == 40)
          {
            if (!msg.msgh_remote_port)
            {
              uint64_t v9 = HIDWORD(v14);
              if (!HIDWORD(v14))
              {
                *a5 = v15;
                return v9;
              }
              goto LABEL_22;
            }
          }
          else if (msg.msgh_size == 36)
          {
            if (msg.msgh_remote_port) {
              BOOL v10 = 1;
            }
            else {
              BOOL v10 = HIDWORD(v14) == 0;
            }
            if (v10) {
              uint64_t v9 = 4294966996;
            }
            else {
              uint64_t v9 = HIDWORD(v14);
            }
            goto LABEL_22;
          }
        }
        uint64_t v9 = 4294966996;
      }
      else
      {
        uint64_t v9 = 4294966995;
      }
LABEL_22:
      mach_msg_destroy(&msg);
      return v9;
    }
    mig_dealloc_special_reply_port();
  }
  return v9;
}

uint64_t wifi_device_disassociate(int a1, uint64_t a2, int a3)
{
  uint64_t v5 = a2;
  int v6 = 27918592;
  int v7 = a3;
  uint64_t v8 = *MEMORY[0x1E4F14068];
  int v9 = a3;
  *(void *)mach_msg_header_t msg = 0xAAAAAAAA80000013;
  *(_DWORD *)&msg[8] = a1;
  *(_OWORD *)&msg[12] = xmmword_1BF21A2E0;
  if (MEMORY[0x1E4F14B18]) {
    voucher_mach_msg_set((mach_msg_header_t *)msg);
  }
  return mach_msg((mach_msg_header_t *)msg, 2097153, 0x38u, 0, 0, 0, 0);
}

uint64_t wifi_device_disassociate_with_reason(int a1, uint64_t a2, int a3, int a4)
{
  uint64_t v8 = a2;
  int v9 = 27918592;
  int v10 = a3;
  uint64_t v11 = *MEMORY[0x1E4F14068];
  int v12 = a3;
  int v13 = a4;
  unint64_t v5 = 0xAAAAAAAA80000013;
  int v6 = a1;
  long long v7 = xmmword_1BF21A2F0;
  if (MEMORY[0x1E4F14B18]) {
    voucher_mach_msg_set((mach_msg_header_t *)&v5);
  }
  return mach_msg((mach_msg_header_t *)&v5, 2097153, 0x3Cu, 0, 0, 0, 0);
}

uint64_t wifi_device_assoc_async(mach_port_t a1, uint64_t a2, int a3, uint64_t a4, int a5, int *a6)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  int v14 = 2;
  uint64_t v15 = a2;
  int v16 = 27918592;
  int v17 = a3;
  uint64_t v18 = a4;
  int v19 = 27918592;
  int v20 = a5;
  uint64_t v21 = *MEMORY[0x1E4F14068];
  int v22 = a3;
  int v23 = a5;
  mach_port_t special_reply_port = mig_get_special_reply_port();
  *(void *)&msg.msgh_bits = 0xAAAAAAAA80001513;
  msg.mach_port_t msgh_remote_port = a1;
  msg.msgh_local_port = special_reply_port;
  *(void *)&msg.msgh_voucher_port = 0x1107400000000;
  if (MEMORY[0x1E4F14B18])
  {
    voucher_mach_msg_set(&msg);
    mach_port_t special_reply_port = msg.msgh_local_port;
  }
  uint64_t v9 = mach_msg(&msg, 3162115, 0x4Cu, 0x30u, special_reply_port, 0, 0);
  uint64_t v10 = v9;
  if ((v9 - 268435458) > 0xE || ((1 << (v9 - 2)) & 0x4003) == 0)
  {
    if (!v9)
    {
      if (msg.msgh_id == 71)
      {
        uint64_t v10 = 4294966988;
      }
      else if (msg.msgh_id == 69848)
      {
        if ((msg.msgh_bits & 0x80000000) == 0)
        {
          if (msg.msgh_size == 40)
          {
            if (!msg.msgh_remote_port)
            {
              uint64_t v10 = HIDWORD(v15);
              if (!HIDWORD(v15))
              {
                *a6 = v16;
                return v10;
              }
              goto LABEL_22;
            }
          }
          else if (msg.msgh_size == 36)
          {
            if (msg.msgh_remote_port) {
              BOOL v11 = 1;
            }
            else {
              BOOL v11 = HIDWORD(v15) == 0;
            }
            if (v11) {
              uint64_t v10 = 4294966996;
            }
            else {
              uint64_t v10 = HIDWORD(v15);
            }
            goto LABEL_22;
          }
        }
        uint64_t v10 = 4294966996;
      }
      else
      {
        uint64_t v10 = 4294966995;
      }
LABEL_22:
      mach_msg_destroy(&msg);
      return v10;
    }
    mig_dealloc_special_reply_port();
  }
  return v10;
}

uint64_t wifi_device_start_network(mach_port_t a1, uint64_t a2, int a3, int a4, uint64_t a5, int a6, int *a7)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  int v15 = 2;
  uint64_t v16 = a2;
  int v17 = 27918592;
  int v18 = a3;
  uint64_t v19 = a5;
  int v20 = 27918592;
  int v21 = a6;
  uint64_t v22 = *MEMORY[0x1E4F14068];
  int v23 = a3;
  int v24 = a4;
  int v25 = a6;
  mach_port_t special_reply_port = mig_get_special_reply_port();
  *(void *)&msg.msgh_bits = 0xAAAAAAAA80001513;
  msg.mach_port_t msgh_remote_port = a1;
  msg.msgh_local_port = special_reply_port;
  *(void *)&msg.msgh_voucher_port = 0x1107500000000;
  if (MEMORY[0x1E4F14B18])
  {
    voucher_mach_msg_set(&msg);
    mach_port_t special_reply_port = msg.msgh_local_port;
  }
  uint64_t v10 = mach_msg(&msg, 3162115, 0x50u, 0x30u, special_reply_port, 0, 0);
  uint64_t v11 = v10;
  if ((v10 - 268435458) > 0xE || ((1 << (v10 - 2)) & 0x4003) == 0)
  {
    if (!v10)
    {
      if (msg.msgh_id == 71)
      {
        uint64_t v11 = 4294966988;
      }
      else if (msg.msgh_id == 69849)
      {
        if ((msg.msgh_bits & 0x80000000) == 0)
        {
          if (msg.msgh_size == 40)
          {
            if (!msg.msgh_remote_port)
            {
              uint64_t v11 = HIDWORD(v16);
              if (!HIDWORD(v16))
              {
                *a7 = v17;
                return v11;
              }
              goto LABEL_22;
            }
          }
          else if (msg.msgh_size == 36)
          {
            if (msg.msgh_remote_port) {
              BOOL v12 = 1;
            }
            else {
              BOOL v12 = HIDWORD(v16) == 0;
            }
            if (v12) {
              uint64_t v11 = 4294966996;
            }
            else {
              uint64_t v11 = HIDWORD(v16);
            }
            goto LABEL_22;
          }
        }
        uint64_t v11 = 4294966996;
      }
      else
      {
        uint64_t v11 = 4294966995;
      }
LABEL_22:
      mach_msg_destroy(&msg);
      return v11;
    }
    mig_dealloc_special_reply_port();
  }
  return v11;
}

uint64_t wifi_device_stop_network(mach_port_t a1, uint64_t a2, int a3, uint64_t a4, int a5, int *a6)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  int v14 = 2;
  uint64_t v15 = a2;
  int v16 = 27918592;
  int v17 = a3;
  uint64_t v18 = a4;
  int v19 = 27918592;
  int v20 = a5;
  uint64_t v21 = *MEMORY[0x1E4F14068];
  int v22 = a3;
  int v23 = a5;
  mach_port_t special_reply_port = mig_get_special_reply_port();
  *(void *)&msg.msgh_bits = 0xAAAAAAAA80001513;
  msg.mach_port_t msgh_remote_port = a1;
  msg.msgh_local_port = special_reply_port;
  *(void *)&msg.msgh_voucher_port = 0x1107600000000;
  if (MEMORY[0x1E4F14B18])
  {
    voucher_mach_msg_set(&msg);
    mach_port_t special_reply_port = msg.msgh_local_port;
  }
  uint64_t v9 = mach_msg(&msg, 3162115, 0x4Cu, 0x30u, special_reply_port, 0, 0);
  uint64_t v10 = v9;
  if ((v9 - 268435458) > 0xE || ((1 << (v9 - 2)) & 0x4003) == 0)
  {
    if (!v9)
    {
      if (msg.msgh_id == 71)
      {
        uint64_t v10 = 4294966988;
      }
      else if (msg.msgh_id == 69850)
      {
        if ((msg.msgh_bits & 0x80000000) == 0)
        {
          if (msg.msgh_size == 40)
          {
            if (!msg.msgh_remote_port)
            {
              uint64_t v10 = HIDWORD(v15);
              if (!HIDWORD(v15))
              {
                *a6 = v16;
                return v10;
              }
              goto LABEL_22;
            }
          }
          else if (msg.msgh_size == 36)
          {
            if (msg.msgh_remote_port) {
              BOOL v11 = 1;
            }
            else {
              BOOL v11 = HIDWORD(v15) == 0;
            }
            if (v11) {
              uint64_t v10 = 4294966996;
            }
            else {
              uint64_t v10 = HIDWORD(v15);
            }
            goto LABEL_22;
          }
        }
        uint64_t v10 = 4294966996;
      }
      else
      {
        uint64_t v10 = 4294966995;
      }
LABEL_22:
      mach_msg_destroy(&msg);
      return v10;
    }
    mig_dealloc_special_reply_port();
  }
  return v10;
}

uint64_t wifi_device_copy_networks(mach_port_t a1, uint64_t a2, unsigned int a3, unsigned int a4, void *a5, unsigned int *a6, _DWORD *a7)
{
  *(void *)&long long v11 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v11 + 1) = 0xAAAAAAAAAAAAAAAALL;
  msg.msgh_id = -1431655766;
  unint64_t v22 = 0xAAAAAAAAAAAAAAAALL;
  long long v23 = v11;
  *(_OWORD *)&msg.msgh_size = v11;
  int v18 = 1;
  uint64_t v19 = a2;
  int v20 = 27918592;
  unsigned int v21 = a3;
  unint64_t v22 = *MEMORY[0x1E4F14068];
  *(void *)&long long v23 = __PAIR64__(a4, a3);
  mach_port_t special_reply_port = mig_get_special_reply_port();
  msg.mach_port_t msgh_remote_port = a1;
  msg.msgh_local_port = special_reply_port;
  msg.msgh_bits = -2147478253;
  *(void *)&msg.msgh_voucher_port = 0x1107700000000;
  if (MEMORY[0x1E4F14B18])
  {
    voucher_mach_msg_set(&msg);
    mach_port_t special_reply_port = msg.msgh_local_port;
  }
  uint64_t v13 = mach_msg(&msg, 3162115, 0x3Cu, 0x44u, special_reply_port, 0, 0);
  uint64_t v14 = v13;
  if ((v13 - 268435458) > 0xE || ((1 << (v13 - 2)) & 0x4003) == 0)
  {
    if (!v13)
    {
      if (msg.msgh_id == 71)
      {
        uint64_t v14 = 4294966988;
      }
      else if (msg.msgh_id == 69851)
      {
        if ((msg.msgh_bits & 0x80000000) == 0)
        {
          if (msg.msgh_size == 36)
          {
            uint64_t v14 = 4294966996;
            if (HIDWORD(v19))
            {
              if (msg.msgh_remote_port) {
                uint64_t v14 = 4294966996;
              }
              else {
                uint64_t v14 = HIDWORD(v19);
              }
            }
          }
          else
          {
            uint64_t v14 = 4294966996;
          }
          goto LABEL_24;
        }
        uint64_t v14 = 4294966996;
        if (v18 == 1 && msg.msgh_size == 60 && !msg.msgh_remote_port && HIBYTE(v20) == 1)
        {
          unsigned int v15 = v21;
          if (v21 == v23)
          {
            uint64_t v14 = 0;
            *a5 = v19;
            *a6 = v15;
            *a7 = DWORD1(v23);
            return v14;
          }
        }
      }
      else
      {
        uint64_t v14 = 4294966995;
      }
LABEL_24:
      mach_msg_destroy(&msg);
      return v14;
    }
    mig_dealloc_special_reply_port();
  }
  return v14;
}

uint64_t wifi_device_set_wifi_direct_state(mach_port_t a1, uint64_t a2, int a3, int a4, int *a5)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  int v13 = 1;
  uint64_t v14 = a2;
  int v15 = 27918592;
  int v16 = a3;
  uint64_t v17 = *MEMORY[0x1E4F14068];
  int v18 = a3;
  int v19 = a4;
  mach_port_t special_reply_port = mig_get_special_reply_port();
  *(void *)&msg.msgh_bits = 0xAAAAAAAA80001513;
  msg.mach_port_t msgh_remote_port = a1;
  msg.msgh_local_port = special_reply_port;
  *(void *)&msg.msgh_voucher_port = 0x1107800000000;
  if (MEMORY[0x1E4F14B18])
  {
    voucher_mach_msg_set(&msg);
    mach_port_t special_reply_port = msg.msgh_local_port;
  }
  uint64_t v8 = mach_msg(&msg, 3162115, 0x3Cu, 0x30u, special_reply_port, 0, 0);
  uint64_t v9 = v8;
  if ((v8 - 268435458) > 0xE || ((1 << (v8 - 2)) & 0x4003) == 0)
  {
    if (!v8)
    {
      if (msg.msgh_id == 71)
      {
        uint64_t v9 = 4294966988;
      }
      else if (msg.msgh_id == 69852)
      {
        if ((msg.msgh_bits & 0x80000000) == 0)
        {
          if (msg.msgh_size == 40)
          {
            if (!msg.msgh_remote_port)
            {
              uint64_t v9 = HIDWORD(v14);
              if (!HIDWORD(v14))
              {
                *a5 = v15;
                return v9;
              }
              goto LABEL_22;
            }
          }
          else if (msg.msgh_size == 36)
          {
            if (msg.msgh_remote_port) {
              BOOL v10 = 1;
            }
            else {
              BOOL v10 = HIDWORD(v14) == 0;
            }
            if (v10) {
              uint64_t v9 = 4294966996;
            }
            else {
              uint64_t v9 = HIDWORD(v14);
            }
            goto LABEL_22;
          }
        }
        uint64_t v9 = 4294966996;
      }
      else
      {
        uint64_t v9 = 4294966995;
      }
LABEL_22:
      mach_msg_destroy(&msg);
      return v9;
    }
    mig_dealloc_special_reply_port();
  }
  return v9;
}

uint64_t wifi_manager_set_background_scan_networks(int a1, uint64_t a2, int a3)
{
  uint64_t v5 = a2;
  int v6 = 27918592;
  int v7 = a3;
  uint64_t v8 = *MEMORY[0x1E4F14068];
  int v9 = a3;
  *(void *)mach_msg_header_t msg = 0xAAAAAAAA80000013;
  *(_DWORD *)&msg[8] = a1;
  *(_OWORD *)&msg[12] = xmmword_1BF21A310;
  if (MEMORY[0x1E4F14B18]) {
    voucher_mach_msg_set((mach_msg_header_t *)msg);
  }
  return mach_msg((mach_msg_header_t *)msg, 2097153, 0x38u, 0, 0, 0, 0);
}

uint64_t wifi_manager_set_bgscan_cache_state(int a1, uint64_t a2, int a3)
{
  uint64_t v5 = a2;
  int v6 = 27918592;
  int v7 = a3;
  uint64_t v8 = *MEMORY[0x1E4F14068];
  int v9 = a3;
  *(void *)mach_msg_header_t msg = 0xAAAAAAAA80000013;
  *(_DWORD *)&msg[8] = a1;
  *(_OWORD *)&msg[12] = xmmword_1BF21A320;
  if (MEMORY[0x1E4F14B18]) {
    voucher_mach_msg_set((mach_msg_header_t *)msg);
  }
  return mach_msg((mach_msg_header_t *)msg, 2097153, 0x38u, 0, 0, 0, 0);
}

uint64_t wifi_manager_set_scan_backoff_report(mach_port_t a1, int a2)
{
  uint64_t v4 = *MEMORY[0x1E4F14068];
  int v5 = a2;
  *(void *)&msg.msgh_bits = 0xAAAAAAAA00000013;
  msg.msgh_voucher_port = 0;
  msg.msgh_id = 69756;
  msg.mach_port_t msgh_remote_port = a1;
  msg.msgh_local_port = 0;
  if (MEMORY[0x1E4F14B18]) {
    voucher_mach_msg_set(&msg);
  }
  return mach_msg(&msg, 2097153, 0x24u, 0, 0, 0, 0);
}

uint64_t wifi_manager_set_test_params(int a1, uint64_t a2, int a3)
{
  uint64_t v5 = a2;
  int v6 = 27918592;
  int v7 = a3;
  uint64_t v8 = *MEMORY[0x1E4F14068];
  int v9 = a3;
  *(void *)mach_msg_header_t msg = 0xAAAAAAAA80000013;
  *(_DWORD *)&msg[8] = a1;
  *(_OWORD *)&msg[12] = xmmword_1BF21A330;
  if (MEMORY[0x1E4F14B18]) {
    voucher_mach_msg_set((mach_msg_header_t *)msg);
  }
  return mach_msg((mach_msg_header_t *)msg, 2097153, 0x38u, 0, 0, 0, 0);
}

uint64_t wifi_manager_copy_test_params(int a1, uint64_t a2, int a3, void *a4, _DWORD *a5)
{
  *(void *)&long long v8 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v8 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(void *)&rcv_name[16] = 0x1AAAAAAAALL;
  *(_DWORD *)int v19 = -1431655766;
  *(_OWORD *)&v19[4] = v8;
  *(_OWORD *)int rcv_name = v8;
  uint64_t v16 = a2;
  int v17 = 27918592;
  int v18 = a3;
  *(void *)int v19 = *MEMORY[0x1E4F14068];
  *(_DWORD *)&v19[8] = a3;
  mach_port_name_t special_reply_port = mig_get_special_reply_port();
  *(_DWORD *)&rcv_name[4] = a1;
  *(_DWORD *)&rcv_name[8] = special_reply_port;
  int v14 = -2147478253;
  *(void *)&rcv_name[12] = 0x1107E00000000;
  if (MEMORY[0x1E4F14B18])
  {
    voucher_mach_msg_set((mach_msg_header_t *)&v14);
    mach_port_name_t special_reply_port = *(_DWORD *)&rcv_name[8];
  }
  uint64_t v10 = mach_msg((mach_msg_header_t *)&v14, 3162115, 0x38u, 0x40u, special_reply_port, 0, 0);
  uint64_t v11 = v10;
  if ((v10 - 268435458) > 0xE || ((1 << (v10 - 2)) & 0x4003) == 0)
  {
    if (!v10)
    {
      if (*(_DWORD *)&rcv_name[16] == 71)
      {
        uint64_t v11 = 4294966988;
      }
      else if (*(_DWORD *)&rcv_name[16] == 69858)
      {
        if ((v14 & 0x80000000) == 0)
        {
          if (*(_DWORD *)rcv_name == 36)
          {
            uint64_t v11 = 4294966996;
            if (HIDWORD(v16))
            {
              if (*(_DWORD *)&rcv_name[4]) {
                uint64_t v11 = 4294966996;
              }
              else {
                uint64_t v11 = HIDWORD(v16);
              }
            }
          }
          else
          {
            uint64_t v11 = 4294966996;
          }
          goto LABEL_24;
        }
        uint64_t v11 = 4294966996;
        if (*(_DWORD *)&rcv_name[20] == 1 && *(_DWORD *)rcv_name == 56 && !*(_DWORD *)&rcv_name[4] && HIBYTE(v17) == 1)
        {
          int v12 = v18;
          if (v18 == *(_DWORD *)&v19[8])
          {
            uint64_t v11 = 0;
            *a4 = v16;
            *a5 = v12;
            return v11;
          }
        }
      }
      else
      {
        uint64_t v11 = 4294966995;
      }
LABEL_24:
      mach_msg_destroy((mach_msg_header_t *)&v14);
      return v11;
    }
    mig_dealloc_special_reply_port();
  }
  return v11;
}

uint64_t wifi_manager_copy_version_info(int a1, void *a2, _DWORD *a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  *(void *)&long long v6 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v6 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)&v13[12] = v6;
  *(_OWORD *)int v13 = v6;
  *(_OWORD *)&msg[20] = v6;
  *(_DWORD *)&msg[4] = -1431655766;
  mach_port_name_t special_reply_port = mig_get_special_reply_port();
  *(_DWORD *)&msg[8] = a1;
  *(_DWORD *)&msg[12] = special_reply_port;
  *(_DWORD *)mach_msg_header_t msg = 5395;
  *(void *)&msg[16] = 0x1107F00000000;
  if (MEMORY[0x1E4F14B18])
  {
    voucher_mach_msg_set((mach_msg_header_t *)msg);
    mach_port_name_t special_reply_port = *(_DWORD *)&msg[12];
  }
  uint64_t v8 = mach_msg((mach_msg_header_t *)msg, 3162115, 0x18u, 0x40u, special_reply_port, 0, 0);
  uint64_t v9 = v8;
  if ((v8 - 268435458) > 0xE || ((1 << (v8 - 2)) & 0x4003) == 0)
  {
    if (!v8)
    {
      if (*(_DWORD *)&msg[20] == 71)
      {
        uint64_t v9 = 4294966988;
      }
      else if (*(_DWORD *)&msg[20] == 69859)
      {
        if ((*(_DWORD *)msg & 0x80000000) == 0)
        {
          if (*(_DWORD *)&msg[4] == 36)
          {
            uint64_t v9 = 4294966996;
            if (*(_DWORD *)&msg[32])
            {
              if (*(_DWORD *)&msg[8]) {
                uint64_t v9 = 4294966996;
              }
              else {
                uint64_t v9 = *(unsigned int *)&msg[32];
              }
            }
          }
          else
          {
            uint64_t v9 = 4294966996;
          }
          goto LABEL_24;
        }
        uint64_t v9 = 4294966996;
        if (*(_DWORD *)&msg[24] == 1 && *(_DWORD *)&msg[4] == 56 && !*(_DWORD *)&msg[8] && v13[3] == 1)
        {
          int v10 = *(_DWORD *)&v13[4];
          if (*(_DWORD *)&v13[4] == *(_DWORD *)&v13[16])
          {
            uint64_t v9 = 0;
            *a2 = *(void *)&msg[28];
            *a3 = v10;
            return v9;
          }
        }
      }
      else
      {
        uint64_t v9 = 4294966995;
      }
LABEL_24:
      mach_msg_destroy((mach_msg_header_t *)msg);
      return v9;
    }
    mig_dealloc_special_reply_port();
  }
  return v9;
}

uint64_t wifi_manager_copy_client_names(int a1, void *a2, _DWORD *a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  *(void *)&long long v6 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v6 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)&v13[12] = v6;
  *(_OWORD *)int v13 = v6;
  *(_OWORD *)&msg[20] = v6;
  *(_DWORD *)&msg[4] = -1431655766;
  mach_port_name_t special_reply_port = mig_get_special_reply_port();
  *(_DWORD *)&msg[8] = a1;
  *(_DWORD *)&msg[12] = special_reply_port;
  *(_DWORD *)mach_msg_header_t msg = 5395;
  *(void *)&msg[16] = 0x1108000000000;
  if (MEMORY[0x1E4F14B18])
  {
    voucher_mach_msg_set((mach_msg_header_t *)msg);
    mach_port_name_t special_reply_port = *(_DWORD *)&msg[12];
  }
  uint64_t v8 = mach_msg((mach_msg_header_t *)msg, 3162115, 0x18u, 0x40u, special_reply_port, 0, 0);
  uint64_t v9 = v8;
  if ((v8 - 268435458) > 0xE || ((1 << (v8 - 2)) & 0x4003) == 0)
  {
    if (!v8)
    {
      if (*(_DWORD *)&msg[20] == 71)
      {
        uint64_t v9 = 4294966988;
      }
      else if (*(_DWORD *)&msg[20] == 69860)
      {
        if ((*(_DWORD *)msg & 0x80000000) == 0)
        {
          if (*(_DWORD *)&msg[4] == 36)
          {
            uint64_t v9 = 4294966996;
            if (*(_DWORD *)&msg[32])
            {
              if (*(_DWORD *)&msg[8]) {
                uint64_t v9 = 4294966996;
              }
              else {
                uint64_t v9 = *(unsigned int *)&msg[32];
              }
            }
          }
          else
          {
            uint64_t v9 = 4294966996;
          }
          goto LABEL_24;
        }
        uint64_t v9 = 4294966996;
        if (*(_DWORD *)&msg[24] == 1 && *(_DWORD *)&msg[4] == 56 && !*(_DWORD *)&msg[8] && v13[3] == 1)
        {
          int v10 = *(_DWORD *)&v13[4];
          if (*(_DWORD *)&v13[4] == *(_DWORD *)&v13[16])
          {
            uint64_t v9 = 0;
            *a2 = *(void *)&msg[28];
            *a3 = v10;
            return v9;
          }
        }
      }
      else
      {
        uint64_t v9 = 4294966995;
      }
LABEL_24:
      mach_msg_destroy((mach_msg_header_t *)msg);
      return v9;
    }
    mig_dealloc_special_reply_port();
  }
  return v9;
}

uint64_t wifi_manager_merge_known_networks(mach_port_t a1, uint64_t a2, int a3, int *a4)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  int v12 = 1;
  uint64_t v13 = a2;
  int v14 = 27918592;
  int v15 = a3;
  uint64_t v16 = *MEMORY[0x1E4F14068];
  int v17 = a3;
  mach_port_t special_reply_port = mig_get_special_reply_port();
  *(void *)&v11.msgh_bits = 0xAAAAAAAA80001513;
  v11.mach_port_t msgh_remote_port = a1;
  v11.msgh_local_port = special_reply_port;
  *(void *)&v11.msgh_voucher_port = 0x1108100000000;
  if (MEMORY[0x1E4F14B18])
  {
    voucher_mach_msg_set(&v11);
    mach_port_t special_reply_port = v11.msgh_local_port;
  }
  uint64_t v7 = mach_msg(&v11, 3162115, 0x38u, 0x30u, special_reply_port, 0, 0);
  uint64_t v8 = v7;
  if ((v7 - 268435458) > 0xE || ((1 << (v7 - 2)) & 0x4003) == 0)
  {
    if (!v7)
    {
      if (v11.msgh_id == 71)
      {
        uint64_t v8 = 4294966988;
      }
      else if (v11.msgh_id == 69861)
      {
        if ((v11.msgh_bits & 0x80000000) == 0)
        {
          if (v11.msgh_size == 40)
          {
            if (!v11.msgh_remote_port)
            {
              uint64_t v8 = HIDWORD(v13);
              if (!HIDWORD(v13))
              {
                *a4 = v14;
                return v8;
              }
              goto LABEL_22;
            }
          }
          else if (v11.msgh_size == 36)
          {
            if (v11.msgh_remote_port) {
              BOOL v9 = 1;
            }
            else {
              BOOL v9 = HIDWORD(v13) == 0;
            }
            if (v9) {
              uint64_t v8 = 4294966996;
            }
            else {
              uint64_t v8 = HIDWORD(v13);
            }
            goto LABEL_22;
          }
        }
        uint64_t v8 = 4294966996;
      }
      else
      {
        uint64_t v8 = 4294966995;
      }
LABEL_22:
      mach_msg_destroy(&v11);
      return v8;
    }
    mig_dealloc_special_reply_port();
  }
  return v8;
}

uint64_t wifi_device_gas_start_async(mach_port_t a1, uint64_t a2, int a3, uint64_t a4, int a5, uint64_t a6, int a7, int *a8)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  int v16 = 3;
  uint64_t v17 = a2;
  int v18 = 27918592;
  int v19 = a3;
  uint64_t v20 = a4;
  int v21 = 27918592;
  int v22 = a5;
  uint64_t v23 = a6;
  int v24 = 27918592;
  int v25 = a7;
  uint64_t v26 = *MEMORY[0x1E4F14068];
  int v27 = a3;
  int v28 = a5;
  int v29 = a7;
  mach_port_t special_reply_port = mig_get_special_reply_port();
  *(void *)&msg.msgh_bits = 0xAAAAAAAA80001513;
  msg.mach_port_t msgh_remote_port = a1;
  msg.msgh_local_port = special_reply_port;
  *(void *)&msg.msgh_voucher_port = 0x1108200000000;
  if (MEMORY[0x1E4F14B18])
  {
    voucher_mach_msg_set(&msg);
    mach_port_t special_reply_port = msg.msgh_local_port;
  }
  uint64_t v11 = mach_msg(&msg, 3162115, 0x60u, 0x30u, special_reply_port, 0, 0);
  uint64_t v12 = v11;
  if ((v11 - 268435458) > 0xE || ((1 << (v11 - 2)) & 0x4003) == 0)
  {
    if (!v11)
    {
      if (msg.msgh_id == 71)
      {
        uint64_t v12 = 4294966988;
      }
      else if (msg.msgh_id == 69862)
      {
        if ((msg.msgh_bits & 0x80000000) == 0)
        {
          if (msg.msgh_size == 40)
          {
            if (!msg.msgh_remote_port)
            {
              uint64_t v12 = HIDWORD(v17);
              if (!HIDWORD(v17))
              {
                *a8 = v18;
                return v12;
              }
              goto LABEL_22;
            }
          }
          else if (msg.msgh_size == 36)
          {
            if (msg.msgh_remote_port) {
              BOOL v13 = 1;
            }
            else {
              BOOL v13 = HIDWORD(v17) == 0;
            }
            if (v13) {
              uint64_t v12 = 4294966996;
            }
            else {
              uint64_t v12 = HIDWORD(v17);
            }
            goto LABEL_22;
          }
        }
        uint64_t v12 = 4294966996;
      }
      else
      {
        uint64_t v12 = 4294966995;
      }
LABEL_22:
      mach_msg_destroy(&msg);
      return v12;
    }
    mig_dealloc_special_reply_port();
  }
  return v12;
}

uint64_t wifi_device_set_rangeable(mach_port_t a1, uint64_t a2, int a3, int a4, uint64_t a5, int a6, int *a7)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  int v15 = 2;
  uint64_t v16 = a2;
  int v17 = 27918592;
  int v18 = a3;
  uint64_t v19 = a5;
  int v20 = 27918592;
  int v21 = a6;
  uint64_t v22 = *MEMORY[0x1E4F14068];
  int v23 = a3;
  int v24 = a4;
  int v25 = a6;
  mach_port_t special_reply_port = mig_get_special_reply_port();
  *(void *)&msg.msgh_bits = 0xAAAAAAAA80001513;
  msg.mach_port_t msgh_remote_port = a1;
  msg.msgh_local_port = special_reply_port;
  *(void *)&msg.msgh_voucher_port = 0x1108300000000;
  if (MEMORY[0x1E4F14B18])
  {
    voucher_mach_msg_set(&msg);
    mach_port_t special_reply_port = msg.msgh_local_port;
  }
  uint64_t v10 = mach_msg(&msg, 3162115, 0x50u, 0x30u, special_reply_port, 0, 0);
  uint64_t v11 = v10;
  if ((v10 - 268435458) > 0xE || ((1 << (v10 - 2)) & 0x4003) == 0)
  {
    if (!v10)
    {
      if (msg.msgh_id == 71)
      {
        uint64_t v11 = 4294966988;
      }
      else if (msg.msgh_id == 69863)
      {
        if ((msg.msgh_bits & 0x80000000) == 0)
        {
          if (msg.msgh_size == 40)
          {
            if (!msg.msgh_remote_port)
            {
              uint64_t v11 = HIDWORD(v16);
              if (!HIDWORD(v16))
              {
                *a7 = v17;
                return v11;
              }
              goto LABEL_22;
            }
          }
          else if (msg.msgh_size == 36)
          {
            if (msg.msgh_remote_port) {
              BOOL v12 = 1;
            }
            else {
              BOOL v12 = HIDWORD(v16) == 0;
            }
            if (v12) {
              uint64_t v11 = 4294966996;
            }
            else {
              uint64_t v11 = HIDWORD(v16);
            }
            goto LABEL_22;
          }
        }
        uint64_t v11 = 4294966996;
      }
      else
      {
        uint64_t v11 = 4294966995;
      }
LABEL_22:
      mach_msg_destroy(&msg);
      return v11;
    }
    mig_dealloc_special_reply_port();
  }
  return v11;
}

uint64_t wifi_device_set_ranging_identifier(mach_port_t a1, uint64_t a2, int a3, int a4, uint64_t a5, int a6, int *a7)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  int v15 = 2;
  uint64_t v16 = a2;
  int v17 = 27918592;
  int v18 = a3;
  uint64_t v19 = a5;
  int v20 = 27918592;
  int v21 = a6;
  uint64_t v22 = *MEMORY[0x1E4F14068];
  int v23 = a3;
  int v24 = a4;
  int v25 = a6;
  mach_port_t special_reply_port = mig_get_special_reply_port();
  *(void *)&msg.msgh_bits = 0xAAAAAAAA80001513;
  msg.mach_port_t msgh_remote_port = a1;
  msg.msgh_local_port = special_reply_port;
  *(void *)&msg.msgh_voucher_port = 0x1108400000000;
  if (MEMORY[0x1E4F14B18])
  {
    voucher_mach_msg_set(&msg);
    mach_port_t special_reply_port = msg.msgh_local_port;
  }
  uint64_t v10 = mach_msg(&msg, 3162115, 0x50u, 0x30u, special_reply_port, 0, 0);
  uint64_t v11 = v10;
  if ((v10 - 268435458) > 0xE || ((1 << (v10 - 2)) & 0x4003) == 0)
  {
    if (!v10)
    {
      if (msg.msgh_id == 71)
      {
        uint64_t v11 = 4294966988;
      }
      else if (msg.msgh_id == 69864)
      {
        if ((msg.msgh_bits & 0x80000000) == 0)
        {
          if (msg.msgh_size == 40)
          {
            if (!msg.msgh_remote_port)
            {
              uint64_t v11 = HIDWORD(v16);
              if (!HIDWORD(v16))
              {
                *a7 = v17;
                return v11;
              }
              goto LABEL_22;
            }
          }
          else if (msg.msgh_size == 36)
          {
            if (msg.msgh_remote_port) {
              BOOL v12 = 1;
            }
            else {
              BOOL v12 = HIDWORD(v16) == 0;
            }
            if (v12) {
              uint64_t v11 = 4294966996;
            }
            else {
              uint64_t v11 = HIDWORD(v16);
            }
            goto LABEL_22;
          }
        }
        uint64_t v11 = 4294966996;
      }
      else
      {
        uint64_t v11 = 4294966995;
      }
LABEL_22:
      mach_msg_destroy(&msg);
      return v11;
    }
    mig_dealloc_special_reply_port();
  }
  return v11;
}

uint64_t wifi_device_ranging_start_async(mach_port_t a1, uint64_t a2, int a3, uint64_t a4, int a5, int a6, int *a7)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  int v15 = 2;
  uint64_t v16 = a2;
  int v17 = 27918592;
  int v18 = a3;
  uint64_t v19 = a4;
  int v20 = 27918592;
  int v21 = a5;
  uint64_t v22 = *MEMORY[0x1E4F14068];
  int v23 = a3;
  int v24 = a5;
  int v25 = a6;
  mach_port_t special_reply_port = mig_get_special_reply_port();
  *(void *)&msg.msgh_bits = 0xAAAAAAAA80001513;
  msg.mach_port_t msgh_remote_port = a1;
  msg.msgh_local_port = special_reply_port;
  *(void *)&msg.msgh_voucher_port = 0x1108500000000;
  if (MEMORY[0x1E4F14B18])
  {
    voucher_mach_msg_set(&msg);
    mach_port_t special_reply_port = msg.msgh_local_port;
  }
  uint64_t v10 = mach_msg(&msg, 3162115, 0x50u, 0x30u, special_reply_port, 0, 0);
  uint64_t v11 = v10;
  if ((v10 - 268435458) > 0xE || ((1 << (v10 - 2)) & 0x4003) == 0)
  {
    if (!v10)
    {
      if (msg.msgh_id == 71)
      {
        uint64_t v11 = 4294966988;
      }
      else if (msg.msgh_id == 69865)
      {
        if ((msg.msgh_bits & 0x80000000) == 0)
        {
          if (msg.msgh_size == 40)
          {
            if (!msg.msgh_remote_port)
            {
              uint64_t v11 = HIDWORD(v16);
              if (!HIDWORD(v16))
              {
                *a7 = v17;
                return v11;
              }
              goto LABEL_22;
            }
          }
          else if (msg.msgh_size == 36)
          {
            if (msg.msgh_remote_port) {
              BOOL v12 = 1;
            }
            else {
              BOOL v12 = HIDWORD(v16) == 0;
            }
            if (v12) {
              uint64_t v11 = 4294966996;
            }
            else {
              uint64_t v11 = HIDWORD(v16);
            }
            goto LABEL_22;
          }
        }
        uint64_t v11 = 4294966996;
      }
      else
      {
        uint64_t v11 = 4294966995;
      }
LABEL_22:
      mach_msg_destroy(&msg);
      return v11;
    }
    mig_dealloc_special_reply_port();
  }
  return v11;
}

uint64_t wifi_device_debug_command(mach_port_t a1, uint64_t a2, int a3, uint64_t a4, int a5, void *a6, _DWORD *a7, _DWORD *a8)
{
  int v18 = 2;
  uint64_t v19 = a2;
  int v20 = 27918592;
  int v21 = a3;
  uint64_t v22 = a4;
  int v23 = 27918592;
  int v24 = a5;
  uint64_t v25 = *MEMORY[0x1E4F14068];
  int v26 = a3;
  int v27 = a5;
  mach_port_t special_reply_port = mig_get_special_reply_port();
  *(void *)&v17.msgh_bits = 0xAAAAAAAA80001513;
  v17.mach_port_t msgh_remote_port = a1;
  v17.msgh_local_port = special_reply_port;
  *(void *)&v17.msgh_voucher_port = 0x1108600000000;
  if (MEMORY[0x1E4F14B18])
  {
    voucher_mach_msg_set(&v17);
    mach_port_t special_reply_port = v17.msgh_local_port;
  }
  uint64_t v13 = mach_msg(&v17, 3162115, 0x4Cu, 0x44u, special_reply_port, 0, 0);
  uint64_t v14 = v13;
  if ((v13 - 268435458) > 0xE || ((1 << (v13 - 2)) & 0x4003) == 0)
  {
    if (!v13)
    {
      if (v17.msgh_id == 71)
      {
        uint64_t v14 = 4294966988;
      }
      else if (v17.msgh_id == 69866)
      {
        if ((v17.msgh_bits & 0x80000000) == 0)
        {
          if (v17.msgh_size == 36)
          {
            uint64_t v14 = 4294966996;
            if (HIDWORD(v19))
            {
              if (v17.msgh_remote_port) {
                uint64_t v14 = 4294966996;
              }
              else {
                uint64_t v14 = HIDWORD(v19);
              }
            }
          }
          else
          {
            uint64_t v14 = 4294966996;
          }
          goto LABEL_23;
        }
        uint64_t v14 = 4294966996;
        if (v18 == 1 && *(void *)&v17.msgh_size == 60 && HIBYTE(v20) == 1)
        {
          int v15 = v21;
          if (v21 == v23)
          {
            uint64_t v14 = 0;
            *a6 = v19;
            *a7 = v15;
            *a8 = v24;
            return v14;
          }
        }
      }
      else
      {
        uint64_t v14 = 4294966995;
      }
LABEL_23:
      mach_msg_destroy(&v17);
      return v14;
    }
    mig_dealloc_special_reply_port();
  }
  return v14;
}

uint64_t wifi_device_copy_roam_stats(int a1, uint64_t a2, int a3, void *a4, _DWORD *a5)
{
  *(void *)&long long v8 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v8 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(void *)&rcv_name[16] = 0x1AAAAAAAALL;
  *(_DWORD *)uint64_t v19 = -1431655766;
  *(_OWORD *)&v19[4] = v8;
  *(_OWORD *)int rcv_name = v8;
  uint64_t v16 = a2;
  int v17 = 27918592;
  int v18 = a3;
  *(void *)uint64_t v19 = *MEMORY[0x1E4F14068];
  *(_DWORD *)&v19[8] = a3;
  mach_port_name_t special_reply_port = mig_get_special_reply_port();
  *(_DWORD *)&rcv_name[4] = a1;
  *(_DWORD *)&rcv_name[8] = special_reply_port;
  int v14 = -2147478253;
  *(void *)&rcv_name[12] = 0x1108700000000;
  if (MEMORY[0x1E4F14B18])
  {
    voucher_mach_msg_set((mach_msg_header_t *)&v14);
    mach_port_name_t special_reply_port = *(_DWORD *)&rcv_name[8];
  }
  uint64_t v10 = mach_msg((mach_msg_header_t *)&v14, 3162115, 0x38u, 0x40u, special_reply_port, 0, 0);
  uint64_t v11 = v10;
  if ((v10 - 268435458) > 0xE || ((1 << (v10 - 2)) & 0x4003) == 0)
  {
    if (!v10)
    {
      if (*(_DWORD *)&rcv_name[16] == 71)
      {
        uint64_t v11 = 4294966988;
      }
      else if (*(_DWORD *)&rcv_name[16] == 69867)
      {
        if ((v14 & 0x80000000) == 0)
        {
          if (*(_DWORD *)rcv_name == 36)
          {
            uint64_t v11 = 4294966996;
            if (HIDWORD(v16))
            {
              if (*(_DWORD *)&rcv_name[4]) {
                uint64_t v11 = 4294966996;
              }
              else {
                uint64_t v11 = HIDWORD(v16);
              }
            }
          }
          else
          {
            uint64_t v11 = 4294966996;
          }
          goto LABEL_24;
        }
        uint64_t v11 = 4294966996;
        if (*(_DWORD *)&rcv_name[20] == 1 && *(_DWORD *)rcv_name == 56 && !*(_DWORD *)&rcv_name[4] && HIBYTE(v17) == 1)
        {
          int v12 = v18;
          if (v18 == *(_DWORD *)&v19[8])
          {
            uint64_t v11 = 0;
            *a4 = v16;
            *a5 = v12;
            return v11;
          }
        }
      }
      else
      {
        uint64_t v11 = 4294966995;
      }
LABEL_24:
      mach_msg_destroy((mach_msg_header_t *)&v14);
      return v11;
    }
    mig_dealloc_special_reply_port();
  }
  return v11;
}

uint64_t wifi_device_set_trgdisc_params(mach_port_t a1, uint64_t a2, int a3, uint64_t a4, int a5, int *a6)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  int v14 = 2;
  uint64_t v15 = a2;
  int v16 = 27918592;
  int v17 = a3;
  uint64_t v18 = a4;
  int v19 = 27918592;
  int v20 = a5;
  uint64_t v21 = *MEMORY[0x1E4F14068];
  int v22 = a3;
  int v23 = a5;
  mach_port_t special_reply_port = mig_get_special_reply_port();
  *(void *)&msg.msgh_bits = 0xAAAAAAAA80001513;
  msg.mach_port_t msgh_remote_port = a1;
  msg.msgh_local_port = special_reply_port;
  *(void *)&msg.msgh_voucher_port = 0x1108800000000;
  if (MEMORY[0x1E4F14B18])
  {
    voucher_mach_msg_set(&msg);
    mach_port_t special_reply_port = msg.msgh_local_port;
  }
  uint64_t v9 = mach_msg(&msg, 3162115, 0x4Cu, 0x30u, special_reply_port, 0, 0);
  uint64_t v10 = v9;
  if ((v9 - 268435458) > 0xE || ((1 << (v9 - 2)) & 0x4003) == 0)
  {
    if (!v9)
    {
      if (msg.msgh_id == 71)
      {
        uint64_t v10 = 4294966988;
      }
      else if (msg.msgh_id == 69868)
      {
        if ((msg.msgh_bits & 0x80000000) == 0)
        {
          if (msg.msgh_size == 40)
          {
            if (!msg.msgh_remote_port)
            {
              uint64_t v10 = HIDWORD(v15);
              if (!HIDWORD(v15))
              {
                *a6 = v16;
                return v10;
              }
              goto LABEL_22;
            }
          }
          else if (msg.msgh_size == 36)
          {
            if (msg.msgh_remote_port) {
              BOOL v11 = 1;
            }
            else {
              BOOL v11 = HIDWORD(v15) == 0;
            }
            if (v11) {
              uint64_t v10 = 4294966996;
            }
            else {
              uint64_t v10 = HIDWORD(v15);
            }
            goto LABEL_22;
          }
        }
        uint64_t v10 = 4294966996;
      }
      else
      {
        uint64_t v10 = 4294966995;
      }
LABEL_22:
      mach_msg_destroy(&msg);
      return v10;
    }
    mig_dealloc_special_reply_port();
  }
  return v10;
}

uint64_t wifi_device_copy_interface_state_info(mach_port_t a1, uint64_t a2, unsigned int a3, unsigned int a4, void *a5, unsigned int *a6, _DWORD *a7)
{
  *(void *)&long long v11 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v11 + 1) = 0xAAAAAAAAAAAAAAAALL;
  msg.msgh_id = -1431655766;
  unint64_t v22 = 0xAAAAAAAAAAAAAAAALL;
  long long v23 = v11;
  *(_OWORD *)&msg.msgh_size = v11;
  int v18 = 1;
  uint64_t v19 = a2;
  int v20 = 27918592;
  unsigned int v21 = a3;
  unint64_t v22 = *MEMORY[0x1E4F14068];
  *(void *)&long long v23 = __PAIR64__(a4, a3);
  mach_port_t special_reply_port = mig_get_special_reply_port();
  msg.mach_port_t msgh_remote_port = a1;
  msg.msgh_local_port = special_reply_port;
  msg.msgh_bits = -2147478253;
  *(void *)&msg.msgh_voucher_port = 0x1108900000000;
  if (MEMORY[0x1E4F14B18])
  {
    voucher_mach_msg_set(&msg);
    mach_port_t special_reply_port = msg.msgh_local_port;
  }
  uint64_t v13 = mach_msg(&msg, 3162115, 0x3Cu, 0x44u, special_reply_port, 0, 0);
  uint64_t v14 = v13;
  if ((v13 - 268435458) > 0xE || ((1 << (v13 - 2)) & 0x4003) == 0)
  {
    if (!v13)
    {
      if (msg.msgh_id == 71)
      {
        uint64_t v14 = 4294966988;
      }
      else if (msg.msgh_id == 69869)
      {
        if ((msg.msgh_bits & 0x80000000) == 0)
        {
          if (msg.msgh_size == 36)
          {
            uint64_t v14 = 4294966996;
            if (HIDWORD(v19))
            {
              if (msg.msgh_remote_port) {
                uint64_t v14 = 4294966996;
              }
              else {
                uint64_t v14 = HIDWORD(v19);
              }
            }
          }
          else
          {
            uint64_t v14 = 4294966996;
          }
          goto LABEL_24;
        }
        uint64_t v14 = 4294966996;
        if (v18 == 1 && msg.msgh_size == 60 && !msg.msgh_remote_port && HIBYTE(v20) == 1)
        {
          unsigned int v15 = v21;
          if (v21 == v23)
          {
            uint64_t v14 = 0;
            *a5 = v19;
            *a6 = v15;
            *a7 = DWORD1(v23);
            return v14;
          }
        }
      }
      else
      {
        uint64_t v14 = 4294966995;
      }
LABEL_24:
      mach_msg_destroy(&msg);
      return v14;
    }
    mig_dealloc_special_reply_port();
  }
  return v14;
}

uint64_t wifi_manager_dump_logs(int a1, uint64_t a2, int a3)
{
  uint64_t v5 = a2;
  int v6 = 27918592;
  int v7 = a3;
  uint64_t v8 = *MEMORY[0x1E4F14068];
  int v9 = a3;
  *(void *)mach_msg_header_t msg = 0xAAAAAAAA80000013;
  *(_DWORD *)&msg[8] = a1;
  *(_OWORD *)&msg[12] = xmmword_1BF21A340;
  if (MEMORY[0x1E4F14B18]) {
    voucher_mach_msg_set((mach_msg_header_t *)msg);
  }
  return mach_msg((mach_msg_header_t *)msg, 2097153, 0x38u, 0, 0, 0, 0);
}

uint64_t wifi_manager_add_policy(int a1, uint64_t a2, int a3, int a4)
{
  uint64_t v8 = a2;
  int v9 = 27918592;
  int v10 = a3;
  uint64_t v11 = *MEMORY[0x1E4F14068];
  int v12 = a3;
  int v13 = a4;
  unint64_t v5 = 0xAAAAAAAA80000013;
  int v6 = a1;
  long long v7 = xmmword_1BF21A350;
  if (MEMORY[0x1E4F14B18]) {
    voucher_mach_msg_set((mach_msg_header_t *)&v5);
  }
  return mach_msg((mach_msg_header_t *)&v5, 2097153, 0x3Cu, 0, 0, 0, 0);
}

uint64_t wifi_manager_remove_policy(int a1, uint64_t a2, int a3, int a4)
{
  uint64_t v8 = a2;
  int v9 = 27918592;
  int v10 = a3;
  uint64_t v11 = *MEMORY[0x1E4F14068];
  int v12 = a3;
  int v13 = a4;
  unint64_t v5 = 0xAAAAAAAA80000013;
  int v6 = a1;
  long long v7 = xmmword_1BF21A360;
  if (MEMORY[0x1E4F14B18]) {
    voucher_mach_msg_set((mach_msg_header_t *)&v5);
  }
  return mach_msg((mach_msg_header_t *)&v5, 2097153, 0x3Cu, 0, 0, 0, 0);
}

uint64_t wifi_manager_copy_policies(int a1, void *a2, _DWORD *a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  *(void *)&long long v6 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v6 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)&v13[12] = v6;
  *(_OWORD *)int v13 = v6;
  *(_OWORD *)&msg[20] = v6;
  *(_DWORD *)&msg[4] = -1431655766;
  mach_port_name_t special_reply_port = mig_get_special_reply_port();
  *(_DWORD *)&msg[8] = a1;
  *(_DWORD *)&msg[12] = special_reply_port;
  *(_DWORD *)mach_msg_header_t msg = 5395;
  *(void *)&msg[16] = 0x1108D00000000;
  if (MEMORY[0x1E4F14B18])
  {
    voucher_mach_msg_set((mach_msg_header_t *)msg);
    mach_port_name_t special_reply_port = *(_DWORD *)&msg[12];
  }
  uint64_t v8 = mach_msg((mach_msg_header_t *)msg, 3162115, 0x18u, 0x40u, special_reply_port, 0, 0);
  uint64_t v9 = v8;
  if ((v8 - 268435458) > 0xE || ((1 << (v8 - 2)) & 0x4003) == 0)
  {
    if (!v8)
    {
      if (*(_DWORD *)&msg[20] == 71)
      {
        uint64_t v9 = 4294966988;
      }
      else if (*(_DWORD *)&msg[20] == 69873)
      {
        if ((*(_DWORD *)msg & 0x80000000) == 0)
        {
          if (*(_DWORD *)&msg[4] == 36)
          {
            uint64_t v9 = 4294966996;
            if (*(_DWORD *)&msg[32])
            {
              if (*(_DWORD *)&msg[8]) {
                uint64_t v9 = 4294966996;
              }
              else {
                uint64_t v9 = *(unsigned int *)&msg[32];
              }
            }
          }
          else
          {
            uint64_t v9 = 4294966996;
          }
          goto LABEL_24;
        }
        uint64_t v9 = 4294966996;
        if (*(_DWORD *)&msg[24] == 1 && *(_DWORD *)&msg[4] == 56 && !*(_DWORD *)&msg[8] && v13[3] == 1)
        {
          int v10 = *(_DWORD *)&v13[4];
          if (*(_DWORD *)&v13[4] == *(_DWORD *)&v13[16])
          {
            uint64_t v9 = 0;
            *a2 = *(void *)&msg[28];
            *a3 = v10;
            return v9;
          }
        }
      }
      else
      {
        uint64_t v9 = 4294966995;
      }
LABEL_24:
      mach_msg_destroy((mach_msg_header_t *)msg);
      return v9;
    }
    mig_dealloc_special_reply_port();
  }
  return v9;
}

uint64_t wifi_manager_set_incar_state(int a1, int a2, uint64_t a3, int a4)
{
  uint64_t v8 = a3;
  int v9 = 27918592;
  int v10 = a4;
  uint64_t v11 = *MEMORY[0x1E4F14068];
  int v12 = a2;
  int v13 = a4;
  unint64_t v5 = 0xAAAAAAAA80000013;
  int v6 = a1;
  long long v7 = xmmword_1BF21A370;
  if (MEMORY[0x1E4F14B18]) {
    voucher_mach_msg_set((mach_msg_header_t *)&v5);
  }
  return mach_msg((mach_msg_header_t *)&v5, 2097153, 0x3Cu, 0, 0, 0, 0);
}

uint64_t wifi_manager_set_thermal_index(mach_port_t a1, int a2)
{
  uint64_t v4 = *MEMORY[0x1E4F14068];
  int v5 = a2;
  *(void *)&msg.msgh_bits = 0xAAAAAAAA00000013;
  msg.msgh_voucher_port = 0;
  msg.msgh_id = 69776;
  msg.mach_port_t msgh_remote_port = a1;
  msg.msgh_local_port = 0;
  if (MEMORY[0x1E4F14B18]) {
    voucher_mach_msg_set(&msg);
  }
  return mach_msg(&msg, 2097153, 0x24u, 0, 0, 0, 0);
}

uint64_t wifi_manager_get_thermal_index(int a1, _DWORD *a2)
{
  *(void *)&long long v4 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v4 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)&rcv_name_12[16] = v4;
  *(_OWORD *)&rcv_name_12[4] = v4;
  int rcv_name = -1431655766;
  mach_port_name_t special_reply_port = mig_get_special_reply_port();
  int rcv_name_4 = a1;
  mach_port_name_t rcv_name_8 = special_reply_port;
  int v10 = 5395;
  *(void *)rcv_name_12 = 0x1109100000000;
  if (MEMORY[0x1E4F14B18])
  {
    voucher_mach_msg_set((mach_msg_header_t *)&v10);
    mach_port_name_t special_reply_port = rcv_name_8;
  }
  uint64_t v6 = mach_msg((mach_msg_header_t *)&v10, 3162115, 0x18u, 0x30u, special_reply_port, 0, 0);
  uint64_t v7 = v6;
  if ((v6 - 268435458) > 0xE || ((1 << (v6 - 2)) & 0x4003) == 0)
  {
    if (!v6)
    {
      if (*(_DWORD *)&rcv_name_12[4] == 71)
      {
        uint64_t v7 = 4294966988;
      }
      else if (*(_DWORD *)&rcv_name_12[4] == 69877)
      {
        if ((v10 & 0x80000000) == 0)
        {
          if (rcv_name == 40)
          {
            if (!rcv_name_4)
            {
              uint64_t v7 = *(unsigned int *)&rcv_name_12[16];
              if (!*(_DWORD *)&rcv_name_12[16])
              {
                *a2 = *(_DWORD *)&rcv_name_12[20];
                return v7;
              }
              goto LABEL_22;
            }
          }
          else if (rcv_name == 36)
          {
            if (rcv_name_4) {
              BOOL v8 = 1;
            }
            else {
              BOOL v8 = *(_DWORD *)&rcv_name_12[16] == 0;
            }
            if (v8) {
              uint64_t v7 = 4294966996;
            }
            else {
              uint64_t v7 = *(unsigned int *)&rcv_name_12[16];
            }
            goto LABEL_22;
          }
        }
        uint64_t v7 = 4294966996;
      }
      else
      {
        uint64_t v7 = 4294966995;
      }
LABEL_22:
      mach_msg_destroy((mach_msg_header_t *)&v10);
      return v7;
    }
    mig_dealloc_special_reply_port();
  }
  return v7;
}

uint64_t wifi_device_wowblacklist_command(mach_port_t a1, uint64_t a2, int a3, uint64_t a4, int a5, void *a6, _DWORD *a7, _DWORD *a8)
{
  int v18 = 2;
  uint64_t v19 = a2;
  int v20 = 27918592;
  int v21 = a3;
  uint64_t v22 = a4;
  int v23 = 27918592;
  int v24 = a5;
  uint64_t v25 = *MEMORY[0x1E4F14068];
  int v26 = a3;
  int v27 = a5;
  mach_port_t special_reply_port = mig_get_special_reply_port();
  *(void *)&v17.msgh_bits = 0xAAAAAAAA80001513;
  v17.mach_port_t msgh_remote_port = a1;
  v17.msgh_local_port = special_reply_port;
  *(void *)&v17.msgh_voucher_port = 0x1109200000000;
  if (MEMORY[0x1E4F14B18])
  {
    voucher_mach_msg_set(&v17);
    mach_port_t special_reply_port = v17.msgh_local_port;
  }
  uint64_t v13 = mach_msg(&v17, 3162115, 0x4Cu, 0x44u, special_reply_port, 0, 0);
  uint64_t v14 = v13;
  if ((v13 - 268435458) > 0xE || ((1 << (v13 - 2)) & 0x4003) == 0)
  {
    if (!v13)
    {
      if (v17.msgh_id == 71)
      {
        uint64_t v14 = 4294966988;
      }
      else if (v17.msgh_id == 69878)
      {
        if ((v17.msgh_bits & 0x80000000) == 0)
        {
          if (v17.msgh_size == 36)
          {
            uint64_t v14 = 4294966996;
            if (HIDWORD(v19))
            {
              if (v17.msgh_remote_port) {
                uint64_t v14 = 4294966996;
              }
              else {
                uint64_t v14 = HIDWORD(v19);
              }
            }
          }
          else
          {
            uint64_t v14 = 4294966996;
          }
          goto LABEL_23;
        }
        uint64_t v14 = 4294966996;
        if (v18 == 1 && *(void *)&v17.msgh_size == 60 && HIBYTE(v20) == 1)
        {
          int v15 = v21;
          if (v21 == v23)
          {
            uint64_t v14 = 0;
            *a6 = v19;
            *a7 = v15;
            *a8 = v24;
            return v14;
          }
        }
      }
      else
      {
        uint64_t v14 = 4294966995;
      }
LABEL_23:
      mach_msg_destroy(&v17);
      return v14;
    }
    mig_dealloc_special_reply_port();
  }
  return v14;
}

uint64_t wifi_manager_copy_leeched_location(int a1, void *a2, _DWORD *a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  *(void *)&long long v6 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v6 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)&v13[12] = v6;
  *(_OWORD *)uint64_t v13 = v6;
  *(_OWORD *)&msg[20] = v6;
  *(_DWORD *)&msg[4] = -1431655766;
  mach_port_name_t special_reply_port = mig_get_special_reply_port();
  *(_DWORD *)&msg[8] = a1;
  *(_DWORD *)&msg[12] = special_reply_port;
  *(_DWORD *)mach_msg_header_t msg = 5395;
  *(void *)&msg[16] = 0x1109300000000;
  if (MEMORY[0x1E4F14B18])
  {
    voucher_mach_msg_set((mach_msg_header_t *)msg);
    mach_port_name_t special_reply_port = *(_DWORD *)&msg[12];
  }
  uint64_t v8 = mach_msg((mach_msg_header_t *)msg, 3162115, 0x18u, 0x40u, special_reply_port, 0, 0);
  uint64_t v9 = v8;
  if ((v8 - 268435458) > 0xE || ((1 << (v8 - 2)) & 0x4003) == 0)
  {
    if (!v8)
    {
      if (*(_DWORD *)&msg[20] == 71)
      {
        uint64_t v9 = 4294966988;
      }
      else if (*(_DWORD *)&msg[20] == 69879)
      {
        if ((*(_DWORD *)msg & 0x80000000) == 0)
        {
          if (*(_DWORD *)&msg[4] == 36)
          {
            uint64_t v9 = 4294966996;
            if (*(_DWORD *)&msg[32])
            {
              if (*(_DWORD *)&msg[8]) {
                uint64_t v9 = 4294966996;
              }
              else {
                uint64_t v9 = *(unsigned int *)&msg[32];
              }
            }
          }
          else
          {
            uint64_t v9 = 4294966996;
          }
          goto LABEL_24;
        }
        uint64_t v9 = 4294966996;
        if (*(_DWORD *)&msg[24] == 1 && *(_DWORD *)&msg[4] == 56 && !*(_DWORD *)&msg[8] && v13[3] == 1)
        {
          int v10 = *(_DWORD *)&v13[4];
          if (*(_DWORD *)&v13[4] == *(_DWORD *)&v13[16])
          {
            uint64_t v9 = 0;
            *a2 = *(void *)&msg[28];
            *a3 = v10;
            return v9;
          }
        }
      }
      else
      {
        uint64_t v9 = 4294966995;
      }
LABEL_24:
      mach_msg_destroy((mach_msg_header_t *)msg);
      return v9;
    }
    mig_dealloc_special_reply_port();
  }
  return v9;
}

uint64_t wifi_manager_copy_geotags_for_network(int a1, uint64_t a2, int a3, void *a4, _DWORD *a5)
{
  *(void *)&long long v8 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v8 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(void *)&rcv_name[16] = 0x1AAAAAAAALL;
  *(_DWORD *)uint64_t v19 = -1431655766;
  *(_OWORD *)&v19[4] = v8;
  *(_OWORD *)int rcv_name = v8;
  uint64_t v16 = a2;
  int v17 = 27918592;
  int v18 = a3;
  *(void *)uint64_t v19 = *MEMORY[0x1E4F14068];
  *(_DWORD *)&v19[8] = a3;
  mach_port_name_t special_reply_port = mig_get_special_reply_port();
  *(_DWORD *)&rcv_name[4] = a1;
  *(_DWORD *)&rcv_name[8] = special_reply_port;
  int v14 = -2147478253;
  *(void *)&rcv_name[12] = 0x1109400000000;
  if (MEMORY[0x1E4F14B18])
  {
    voucher_mach_msg_set((mach_msg_header_t *)&v14);
    mach_port_name_t special_reply_port = *(_DWORD *)&rcv_name[8];
  }
  uint64_t v10 = mach_msg((mach_msg_header_t *)&v14, 3162115, 0x38u, 0x40u, special_reply_port, 0, 0);
  uint64_t v11 = v10;
  if ((v10 - 268435458) > 0xE || ((1 << (v10 - 2)) & 0x4003) == 0)
  {
    if (!v10)
    {
      if (*(_DWORD *)&rcv_name[16] == 71)
      {
        uint64_t v11 = 4294966988;
      }
      else if (*(_DWORD *)&rcv_name[16] == 69880)
      {
        if ((v14 & 0x80000000) == 0)
        {
          if (*(_DWORD *)rcv_name == 36)
          {
            uint64_t v11 = 4294966996;
            if (HIDWORD(v16))
            {
              if (*(_DWORD *)&rcv_name[4]) {
                uint64_t v11 = 4294966996;
              }
              else {
                uint64_t v11 = HIDWORD(v16);
              }
            }
          }
          else
          {
            uint64_t v11 = 4294966996;
          }
          goto LABEL_24;
        }
        uint64_t v11 = 4294966996;
        if (*(_DWORD *)&rcv_name[20] == 1 && *(_DWORD *)rcv_name == 56 && !*(_DWORD *)&rcv_name[4] && HIBYTE(v17) == 1)
        {
          int v12 = v18;
          if (v18 == *(_DWORD *)&v19[8])
          {
            uint64_t v11 = 0;
            *a4 = v16;
            *a5 = v12;
            return v11;
          }
        }
      }
      else
      {
        uint64_t v11 = 4294966995;
      }
LABEL_24:
      mach_msg_destroy((mach_msg_header_t *)&v14);
      return v11;
    }
    mig_dealloc_special_reply_port();
  }
  return v11;
}

uint64_t wifi_manager_set_geotag_for_network(int a1, uint64_t a2, int a3, double a4, double a5)
{
  *(void *)mach_msg_header_t msg = 0xAAAAAAAAAAAAAAAALL;
  uint64_t v7 = a2;
  int v8 = 27918592;
  int v9 = a3;
  uint64_t v10 = *MEMORY[0x1E4F14068];
  int v11 = a3;
  double v12 = a4;
  double v13 = a5;
  *(_DWORD *)mach_msg_header_t msg = -2147483629;
  *(_DWORD *)&msg[8] = a1;
  *(_OWORD *)&msg[12] = xmmword_1BF21A380;
  if (MEMORY[0x1E4F14B18]) {
    voucher_mach_msg_set((mach_msg_header_t *)msg);
  }
  return mach_msg((mach_msg_header_t *)msg, 2097153, 0x48u, 0, 0, 0, 0);
}

uint64_t wifi_manager_copy_networks_at_location(int a1, int a2, void *a3, _DWORD *a4, double a5, double a6)
{
  *(void *)&long long v9 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v9 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)&rcv_name[16] = v9;
  *(_OWORD *)&rcv_name[32] = v9;
  *(_OWORD *)&unsigned char rcv_name[44] = v9;
  *(_OWORD *)int rcv_name = v9;
  *(void *)&rcv_name[20] = *MEMORY[0x1E4F14068];
  *(double *)&rcv_name[28] = a5;
  *(double *)&rcv_name[36] = a6;
  *(_DWORD *)&unsigned char rcv_name[44] = a2;
  mach_port_name_t special_reply_port = mig_get_special_reply_port();
  *(_DWORD *)&rcv_name[4] = a1;
  *(_DWORD *)&rcv_name[8] = special_reply_port;
  int v15 = 5395;
  *(void *)&rcv_name[12] = 0x1109600000000;
  if (MEMORY[0x1E4F14B18])
  {
    voucher_mach_msg_set((mach_msg_header_t *)&v15);
    mach_port_name_t special_reply_port = *(_DWORD *)&rcv_name[8];
  }
  uint64_t v11 = mach_msg((mach_msg_header_t *)&v15, 3162115, 0x34u, 0x40u, special_reply_port, 0, 0);
  uint64_t v12 = v11;
  if ((v11 - 268435458) > 0xE || ((1 << (v11 - 2)) & 0x4003) == 0)
  {
    if (!v11)
    {
      if (*(_DWORD *)&rcv_name[16] == 71)
      {
        uint64_t v12 = 4294966988;
      }
      else if (*(_DWORD *)&rcv_name[16] == 69882)
      {
        if ((v15 & 0x80000000) == 0)
        {
          if (*(_DWORD *)rcv_name == 36)
          {
            uint64_t v12 = 4294966996;
            if (*(_DWORD *)&rcv_name[28])
            {
              if (*(_DWORD *)&rcv_name[4]) {
                uint64_t v12 = 4294966996;
              }
              else {
                uint64_t v12 = *(unsigned int *)&rcv_name[28];
              }
            }
          }
          else
          {
            uint64_t v12 = 4294966996;
          }
          goto LABEL_24;
        }
        uint64_t v12 = 4294966996;
        if (*(_DWORD *)&rcv_name[20] == 1 && *(_DWORD *)rcv_name == 56 && !*(_DWORD *)&rcv_name[4] && rcv_name[35] == 1)
        {
          int v13 = *(_DWORD *)&rcv_name[36];
          if (*(_DWORD *)&rcv_name[36] == *(_DWORD *)&rcv_name[48])
          {
            uint64_t v12 = 0;
            *a3 = *(void *)&rcv_name[24];
            *a4 = v13;
            return v12;
          }
        }
      }
      else
      {
        uint64_t v12 = 4294966995;
      }
LABEL_24:
      mach_msg_destroy((mach_msg_header_t *)&v15);
      return v12;
    }
    mig_dealloc_special_reply_port();
  }
  return v12;
}

uint64_t wifi_manager_copy_score_for_network(int a1, uint64_t a2, int a3, void *a4, _DWORD *a5)
{
  *(void *)&long long v8 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v8 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(void *)&rcv_name[16] = 0x1AAAAAAAALL;
  *(_DWORD *)uint64_t v19 = -1431655766;
  *(_OWORD *)&v19[4] = v8;
  *(_OWORD *)int rcv_name = v8;
  uint64_t v16 = a2;
  int v17 = 27918592;
  int v18 = a3;
  *(void *)uint64_t v19 = *MEMORY[0x1E4F14068];
  *(_DWORD *)&v19[8] = a3;
  mach_port_name_t special_reply_port = mig_get_special_reply_port();
  *(_DWORD *)&rcv_name[4] = a1;
  *(_DWORD *)&rcv_name[8] = special_reply_port;
  int v14 = -2147478253;
  *(void *)&rcv_name[12] = 0x1109700000000;
  if (MEMORY[0x1E4F14B18])
  {
    voucher_mach_msg_set((mach_msg_header_t *)&v14);
    mach_port_name_t special_reply_port = *(_DWORD *)&rcv_name[8];
  }
  uint64_t v10 = mach_msg((mach_msg_header_t *)&v14, 3162115, 0x38u, 0x40u, special_reply_port, 0, 0);
  uint64_t v11 = v10;
  if ((v10 - 268435458) > 0xE || ((1 << (v10 - 2)) & 0x4003) == 0)
  {
    if (!v10)
    {
      if (*(_DWORD *)&rcv_name[16] == 71)
      {
        uint64_t v11 = 4294966988;
      }
      else if (*(_DWORD *)&rcv_name[16] == 69883)
      {
        if ((v14 & 0x80000000) == 0)
        {
          if (*(_DWORD *)rcv_name == 36)
          {
            uint64_t v11 = 4294966996;
            if (HIDWORD(v16))
            {
              if (*(_DWORD *)&rcv_name[4]) {
                uint64_t v11 = 4294966996;
              }
              else {
                uint64_t v11 = HIDWORD(v16);
              }
            }
          }
          else
          {
            uint64_t v11 = 4294966996;
          }
          goto LABEL_24;
        }
        uint64_t v11 = 4294966996;
        if (*(_DWORD *)&rcv_name[20] == 1 && *(_DWORD *)rcv_name == 56 && !*(_DWORD *)&rcv_name[4] && HIBYTE(v17) == 1)
        {
          int v12 = v18;
          if (v18 == *(_DWORD *)&v19[8])
          {
            uint64_t v11 = 0;
            *a4 = v16;
            *a5 = v12;
            return v11;
          }
        }
      }
      else
      {
        uint64_t v11 = 4294966995;
      }
LABEL_24:
      mach_msg_destroy((mach_msg_header_t *)&v14);
      return v11;
    }
    mig_dealloc_special_reply_port();
  }
  return v11;
}

uint64_t wifi_device_soft_error_notification(mach_port_t a1, uint64_t a2, int a3, uint64_t a4, int a5, int *a6)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  int v14 = 2;
  uint64_t v15 = a2;
  int v16 = 27918592;
  int v17 = a3;
  uint64_t v18 = a4;
  int v19 = 27918592;
  int v20 = a5;
  uint64_t v21 = *MEMORY[0x1E4F14068];
  int v22 = a3;
  int v23 = a5;
  mach_port_t special_reply_port = mig_get_special_reply_port();
  *(void *)&msg.msgh_bits = 0xAAAAAAAA80001513;
  msg.mach_port_t msgh_remote_port = a1;
  msg.msgh_local_port = special_reply_port;
  *(void *)&msg.msgh_voucher_port = 0x1109800000000;
  if (MEMORY[0x1E4F14B18])
  {
    voucher_mach_msg_set(&msg);
    mach_port_t special_reply_port = msg.msgh_local_port;
  }
  uint64_t v9 = mach_msg(&msg, 3162115, 0x4Cu, 0x30u, special_reply_port, 0, 0);
  uint64_t v10 = v9;
  if ((v9 - 268435458) > 0xE || ((1 << (v9 - 2)) & 0x4003) == 0)
  {
    if (!v9)
    {
      if (msg.msgh_id == 71)
      {
        uint64_t v10 = 4294966988;
      }
      else if (msg.msgh_id == 69884)
      {
        if ((msg.msgh_bits & 0x80000000) == 0)
        {
          if (msg.msgh_size == 40)
          {
            if (!msg.msgh_remote_port)
            {
              uint64_t v10 = HIDWORD(v15);
              if (!HIDWORD(v15))
              {
                *a6 = v16;
                return v10;
              }
              goto LABEL_22;
            }
          }
          else if (msg.msgh_size == 36)
          {
            if (msg.msgh_remote_port) {
              BOOL v11 = 1;
            }
            else {
              BOOL v11 = HIDWORD(v15) == 0;
            }
            if (v11) {
              uint64_t v10 = 4294966996;
            }
            else {
              uint64_t v10 = HIDWORD(v15);
            }
            goto LABEL_22;
          }
        }
        uint64_t v10 = 4294966996;
      }
      else
      {
        uint64_t v10 = 4294966995;
      }
LABEL_22:
      mach_msg_destroy(&msg);
      return v10;
    }
    mig_dealloc_special_reply_port();
  }
  return v10;
}

uint64_t wifi_manager_copy_softerror_counters(int a1, void *a2, _DWORD *a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  *(void *)&long long v6 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v6 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)&v13[12] = v6;
  *(_OWORD *)int v13 = v6;
  *(_OWORD *)&msg[20] = v6;
  *(_DWORD *)&msg[4] = -1431655766;
  mach_port_name_t special_reply_port = mig_get_special_reply_port();
  *(_DWORD *)&msg[8] = a1;
  *(_DWORD *)&msg[12] = special_reply_port;
  *(_DWORD *)mach_msg_header_t msg = 5395;
  *(void *)&msg[16] = 0x1109900000000;
  if (MEMORY[0x1E4F14B18])
  {
    voucher_mach_msg_set((mach_msg_header_t *)msg);
    mach_port_name_t special_reply_port = *(_DWORD *)&msg[12];
  }
  uint64_t v8 = mach_msg((mach_msg_header_t *)msg, 3162115, 0x18u, 0x40u, special_reply_port, 0, 0);
  uint64_t v9 = v8;
  if ((v8 - 268435458) > 0xE || ((1 << (v8 - 2)) & 0x4003) == 0)
  {
    if (!v8)
    {
      if (*(_DWORD *)&msg[20] == 71)
      {
        uint64_t v9 = 4294966988;
      }
      else if (*(_DWORD *)&msg[20] == 69885)
      {
        if ((*(_DWORD *)msg & 0x80000000) == 0)
        {
          if (*(_DWORD *)&msg[4] == 36)
          {
            uint64_t v9 = 4294966996;
            if (*(_DWORD *)&msg[32])
            {
              if (*(_DWORD *)&msg[8]) {
                uint64_t v9 = 4294966996;
              }
              else {
                uint64_t v9 = *(unsigned int *)&msg[32];
              }
            }
          }
          else
          {
            uint64_t v9 = 4294966996;
          }
          goto LABEL_24;
        }
        uint64_t v9 = 4294966996;
        if (*(_DWORD *)&msg[24] == 1 && *(_DWORD *)&msg[4] == 56 && !*(_DWORD *)&msg[8] && v13[3] == 1)
        {
          int v10 = *(_DWORD *)&v13[4];
          if (*(_DWORD *)&v13[4] == *(_DWORD *)&v13[16])
          {
            uint64_t v9 = 0;
            *a2 = *(void *)&msg[28];
            *a3 = v10;
            return v9;
          }
        }
      }
      else
      {
        uint64_t v9 = 4294966995;
      }
LABEL_24:
      mach_msg_destroy((mach_msg_header_t *)msg);
      return v9;
    }
    mig_dealloc_special_reply_port();
  }
  return v9;
}

uint64_t wifi_manager_copy_current_session_based_network(int a1, void *a2, _DWORD *a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  *(void *)&long long v6 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v6 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)&v13[12] = v6;
  *(_OWORD *)int v13 = v6;
  *(_OWORD *)&msg[20] = v6;
  *(_DWORD *)&msg[4] = -1431655766;
  mach_port_name_t special_reply_port = mig_get_special_reply_port();
  *(_DWORD *)&msg[8] = a1;
  *(_DWORD *)&msg[12] = special_reply_port;
  *(_DWORD *)mach_msg_header_t msg = 5395;
  *(void *)&msg[16] = 0x1109A00000000;
  if (MEMORY[0x1E4F14B18])
  {
    voucher_mach_msg_set((mach_msg_header_t *)msg);
    mach_port_name_t special_reply_port = *(_DWORD *)&msg[12];
  }
  uint64_t v8 = mach_msg((mach_msg_header_t *)msg, 3162115, 0x18u, 0x40u, special_reply_port, 0, 0);
  uint64_t v9 = v8;
  if ((v8 - 268435458) > 0xE || ((1 << (v8 - 2)) & 0x4003) == 0)
  {
    if (!v8)
    {
      if (*(_DWORD *)&msg[20] == 71)
      {
        uint64_t v9 = 4294966988;
      }
      else if (*(_DWORD *)&msg[20] == 69886)
      {
        if ((*(_DWORD *)msg & 0x80000000) == 0)
        {
          if (*(_DWORD *)&msg[4] == 36)
          {
            uint64_t v9 = 4294966996;
            if (*(_DWORD *)&msg[32])
            {
              if (*(_DWORD *)&msg[8]) {
                uint64_t v9 = 4294966996;
              }
              else {
                uint64_t v9 = *(unsigned int *)&msg[32];
              }
            }
          }
          else
          {
            uint64_t v9 = 4294966996;
          }
          goto LABEL_24;
        }
        uint64_t v9 = 4294966996;
        if (*(_DWORD *)&msg[24] == 1 && *(_DWORD *)&msg[4] == 56 && !*(_DWORD *)&msg[8] && v13[3] == 1)
        {
          int v10 = *(_DWORD *)&v13[4];
          if (*(_DWORD *)&v13[4] == *(_DWORD *)&v13[16])
          {
            uint64_t v9 = 0;
            *a2 = *(void *)&msg[28];
            *a3 = v10;
            return v9;
          }
        }
      }
      else
      {
        uint64_t v9 = 4294966995;
      }
LABEL_24:
      mach_msg_destroy((mach_msg_header_t *)msg);
      return v9;
    }
    mig_dealloc_special_reply_port();
  }
  return v9;
}

uint64_t wifi_manager_set_user_auto_join_state(mach_port_t a1, int a2)
{
  uint64_t v4 = *MEMORY[0x1E4F14068];
  int v5 = a2;
  *(void *)&msg.msgh_bits = 0xAAAAAAAA00000013;
  msg.msgh_voucher_port = 0;
  msg.msgh_id = 69787;
  msg.mach_port_t msgh_remote_port = a1;
  msg.msgh_local_port = 0;
  if (MEMORY[0x1E4F14B18]) {
    voucher_mach_msg_set(&msg);
  }
  return mach_msg(&msg, 2097153, 0x24u, 0, 0, 0, 0);
}

uint64_t wifi_manager_get_user_auto_join_state(int a1, _DWORD *a2)
{
  *(void *)&long long v4 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v4 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)&rcv_name_12[16] = v4;
  *(_OWORD *)&rcv_name_12[4] = v4;
  int rcv_name = -1431655766;
  mach_port_name_t special_reply_port = mig_get_special_reply_port();
  int rcv_name_4 = a1;
  mach_port_name_t rcv_name_8 = special_reply_port;
  int v10 = 5395;
  *(void *)rcv_name_12 = 0x1109C00000000;
  if (MEMORY[0x1E4F14B18])
  {
    voucher_mach_msg_set((mach_msg_header_t *)&v10);
    mach_port_name_t special_reply_port = rcv_name_8;
  }
  uint64_t v6 = mach_msg((mach_msg_header_t *)&v10, 3162115, 0x18u, 0x30u, special_reply_port, 0, 0);
  uint64_t v7 = v6;
  if ((v6 - 268435458) > 0xE || ((1 << (v6 - 2)) & 0x4003) == 0)
  {
    if (!v6)
    {
      if (*(_DWORD *)&rcv_name_12[4] == 71)
      {
        uint64_t v7 = 4294966988;
      }
      else if (*(_DWORD *)&rcv_name_12[4] == 69888)
      {
        if ((v10 & 0x80000000) == 0)
        {
          if (rcv_name == 40)
          {
            if (!rcv_name_4)
            {
              uint64_t v7 = *(unsigned int *)&rcv_name_12[16];
              if (!*(_DWORD *)&rcv_name_12[16])
              {
                *a2 = *(_DWORD *)&rcv_name_12[20];
                return v7;
              }
              goto LABEL_22;
            }
          }
          else if (rcv_name == 36)
          {
            if (rcv_name_4) {
              BOOL v8 = 1;
            }
            else {
              BOOL v8 = *(_DWORD *)&rcv_name_12[16] == 0;
            }
            if (v8) {
              uint64_t v7 = 4294966996;
            }
            else {
              uint64_t v7 = *(unsigned int *)&rcv_name_12[16];
            }
            goto LABEL_22;
          }
        }
        uint64_t v7 = 4294966996;
      }
      else
      {
        uint64_t v7 = 4294966995;
      }
LABEL_22:
      mach_msg_destroy((mach_msg_header_t *)&v10);
      return v7;
    }
    mig_dealloc_special_reply_port();
  }
  return v7;
}

uint64_t wifi_manager_remove_orphaned_sc_network_sets(mach_port_t a1)
{
  *(void *)&msg.msgh_bits = 0xAAAAAAAA00000013;
  msg.msgh_voucher_port = 0;
  msg.msgh_id = 69789;
  msg.mach_port_t msgh_remote_port = a1;
  msg.msgh_local_port = 0;
  if (MEMORY[0x1E4F14B18]) {
    voucher_mach_msg_set(&msg);
  }
  return mach_msg(&msg, 2097153, 0x18u, 0, 0, 0, 0);
}

uint64_t wifi_manager_migrate_list(mach_port_t a1)
{
  *(void *)&msg.msgh_bits = 0xAAAAAAAA00000013;
  msg.msgh_voucher_port = 0;
  msg.msgh_id = 69790;
  msg.mach_port_t msgh_remote_port = a1;
  msg.msgh_local_port = 0;
  if (MEMORY[0x1E4F14B18]) {
    voucher_mach_msg_set(&msg);
  }
  return mach_msg(&msg, 2097153, 0x18u, 0, 0, 0, 0);
}

uint64_t wifi_manager_remove_unused_network_geotags(mach_port_t a1, double a2)
{
  uint64_t v4 = *MEMORY[0x1E4F14068];
  double v5 = a2;
  *(void *)&msg.msgh_bits = 0xAAAAAAAA00000013;
  msg.msgh_voucher_port = 0;
  msg.msgh_id = 69791;
  msg.mach_port_t msgh_remote_port = a1;
  msg.msgh_local_port = 0;
  if (MEMORY[0x1E4F14B18]) {
    voucher_mach_msg_set(&msg);
  }
  return mach_msg(&msg, 2097153, 0x28u, 0, 0, 0, 0);
}

uint64_t wifi_manager_schedule_unused_network_geotags_removal_test(mach_port_t a1, int a2, double a3)
{
  uint64_t v5 = *MEMORY[0x1E4F14068];
  double v6 = a3;
  int v7 = a2;
  *(void *)&v4.msgh_bits = 0xAAAAAAAA00000013;
  v4.msgh_voucher_port = 0;
  v4.msgh_id = 69792;
  v4.mach_port_t msgh_remote_port = a1;
  v4.msgh_local_port = 0;
  if (MEMORY[0x1E4F14B18]) {
    voucher_mach_msg_set(&v4);
  }
  return mach_msg(&v4, 2097153, 0x2Cu, 0, 0, 0, 0);
}

uint64_t wifi_manager_unschedule_unused_network_geotags_removal_test(mach_port_t a1)
{
  *(void *)&msg.msgh_bits = 0xAAAAAAAA00000013;
  msg.msgh_voucher_port = 0;
  msg.msgh_id = 69793;
  msg.mach_port_t msgh_remote_port = a1;
  msg.msgh_local_port = 0;
  if (MEMORY[0x1E4F14B18]) {
    voucher_mach_msg_set(&msg);
  }
  return mach_msg(&msg, 2097153, 0x18u, 0, 0, 0, 0);
}

uint64_t wifi_device_autojoinblacklist_command(mach_port_t a1, uint64_t a2, int a3, uint64_t a4, int a5, void *a6, _DWORD *a7)
{
  int v16 = 2;
  uint64_t v17 = a2;
  int v18 = 27918592;
  int v19 = a3;
  uint64_t v20 = a4;
  int v21 = 27918592;
  int v22 = a5;
  uint64_t v23 = *MEMORY[0x1E4F14068];
  int v24 = a3;
  int v25 = a5;
  mach_port_t special_reply_port = mig_get_special_reply_port();
  *(void *)&v15.msgh_bits = 0xAAAAAAAA80001513;
  v15.mach_port_t msgh_remote_port = a1;
  v15.msgh_local_port = special_reply_port;
  *(void *)&v15.msgh_voucher_port = 0x110A200000000;
  if (MEMORY[0x1E4F14B18])
  {
    voucher_mach_msg_set(&v15);
    mach_port_t special_reply_port = v15.msgh_local_port;
  }
  uint64_t v11 = mach_msg(&v15, 3162115, 0x4Cu, 0x40u, special_reply_port, 0, 0);
  uint64_t v12 = v11;
  if ((v11 - 268435458) > 0xE || ((1 << (v11 - 2)) & 0x4003) == 0)
  {
    if (!v11)
    {
      if (v15.msgh_id == 71)
      {
        uint64_t v12 = 4294966988;
      }
      else if (v15.msgh_id == 69894)
      {
        if ((v15.msgh_bits & 0x80000000) == 0)
        {
          if (v15.msgh_size == 36)
          {
            uint64_t v12 = 4294966996;
            if (HIDWORD(v17))
            {
              if (v15.msgh_remote_port) {
                uint64_t v12 = 4294966996;
              }
              else {
                uint64_t v12 = HIDWORD(v17);
              }
            }
          }
          else
          {
            uint64_t v12 = 4294966996;
          }
          goto LABEL_23;
        }
        uint64_t v12 = 4294966996;
        if (v16 == 1 && *(void *)&v15.msgh_size == 56 && HIBYTE(v18) == 1)
        {
          int v13 = v19;
          if (v19 == v21)
          {
            uint64_t v12 = 0;
            *a6 = v17;
            *a7 = v13;
            return v12;
          }
        }
      }
      else
      {
        uint64_t v12 = 4294966995;
      }
LABEL_23:
      mach_msg_destroy(&v15);
      return v12;
    }
    mig_dealloc_special_reply_port();
  }
  return v12;
}

uint64_t wifi_manager_simulate_notification(int a1, uint64_t a2, int a3, int a4, uint64_t a5, int a6)
{
  uint64_t v10 = a2;
  int v11 = 27918592;
  int v12 = a3;
  uint64_t v13 = a5;
  int v14 = 27918592;
  int v15 = a6;
  uint64_t v16 = *MEMORY[0x1E4F14068];
  int v17 = a3;
  int v18 = a4;
  int v19 = a6;
  unint64_t v7 = 0xAAAAAAAA80000013;
  int v8 = a1;
  long long v9 = xmmword_1BF21A390;
  if (MEMORY[0x1E4F14B18]) {
    voucher_mach_msg_set((mach_msg_header_t *)&v7);
  }
  return mach_msg((mach_msg_header_t *)&v7, 2097153, 0x50u, 0, 0, 0, 0);
}

uint64_t wifi_device_destroy_eap_trust_current_network(mach_port_t a1, uint64_t a2, int a3, int *a4)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  int v12 = 1;
  uint64_t v13 = a2;
  int v14 = 27918592;
  int v15 = a3;
  uint64_t v16 = *MEMORY[0x1E4F14068];
  int v17 = a3;
  mach_port_t special_reply_port = mig_get_special_reply_port();
  *(void *)&v11.msgh_bits = 0xAAAAAAAA80001513;
  v11.mach_port_t msgh_remote_port = a1;
  v11.msgh_local_port = special_reply_port;
  *(void *)&v11.msgh_voucher_port = 0x110A400000000;
  if (MEMORY[0x1E4F14B18])
  {
    voucher_mach_msg_set(&v11);
    mach_port_t special_reply_port = v11.msgh_local_port;
  }
  uint64_t v7 = mach_msg(&v11, 3162115, 0x38u, 0x30u, special_reply_port, 0, 0);
  uint64_t v8 = v7;
  if ((v7 - 268435458) > 0xE || ((1 << (v7 - 2)) & 0x4003) == 0)
  {
    if (!v7)
    {
      if (v11.msgh_id == 71)
      {
        uint64_t v8 = 4294966988;
      }
      else if (v11.msgh_id == 69896)
      {
        if ((v11.msgh_bits & 0x80000000) == 0)
        {
          if (v11.msgh_size == 40)
          {
            if (!v11.msgh_remote_port)
            {
              uint64_t v8 = HIDWORD(v13);
              if (!HIDWORD(v13))
              {
                *a4 = v14;
                return v8;
              }
              goto LABEL_22;
            }
          }
          else if (v11.msgh_size == 36)
          {
            if (v11.msgh_remote_port) {
              BOOL v9 = 1;
            }
            else {
              BOOL v9 = HIDWORD(v13) == 0;
            }
            if (v9) {
              uint64_t v8 = 4294966996;
            }
            else {
              uint64_t v8 = HIDWORD(v13);
            }
            goto LABEL_22;
          }
        }
        uint64_t v8 = 4294966996;
      }
      else
      {
        uint64_t v8 = 4294966995;
      }
LABEL_22:
      mach_msg_destroy(&v11);
      return v8;
    }
    mig_dealloc_special_reply_port();
  }
  return v8;
}

uint64_t wifi_manager_tigger_gizmo_sync_password_check(mach_port_t a1)
{
  *(void *)&msg.msgh_bits = 0xAAAAAAAA00000013;
  msg.msgh_voucher_port = 0;
  msg.msgh_id = 69797;
  msg.mach_port_t msgh_remote_port = a1;
  msg.msgh_local_port = 0;
  if (MEMORY[0x1E4F14B18]) {
    voucher_mach_msg_set(&msg);
  }
  return mach_msg(&msg, 2097153, 0x18u, 0, 0, 0, 0);
}

uint64_t wifi_manager_copy_ssid_most_used_geo_tagged_to_current_location(int a1, void *a2, _DWORD *a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  *(void *)&long long v6 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v6 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)&v13[12] = v6;
  *(_OWORD *)uint64_t v13 = v6;
  *(_OWORD *)&msg[20] = v6;
  *(_DWORD *)&msg[4] = -1431655766;
  mach_port_name_t special_reply_port = mig_get_special_reply_port();
  *(_DWORD *)&msg[8] = a1;
  *(_DWORD *)&msg[12] = special_reply_port;
  *(_DWORD *)mach_msg_header_t msg = 5395;
  *(void *)&msg[16] = 0x110A600000000;
  if (MEMORY[0x1E4F14B18])
  {
    voucher_mach_msg_set((mach_msg_header_t *)msg);
    mach_port_name_t special_reply_port = *(_DWORD *)&msg[12];
  }
  uint64_t v8 = mach_msg((mach_msg_header_t *)msg, 3162115, 0x18u, 0x40u, special_reply_port, 0, 0);
  uint64_t v9 = v8;
  if ((v8 - 268435458) > 0xE || ((1 << (v8 - 2)) & 0x4003) == 0)
  {
    if (!v8)
    {
      if (*(_DWORD *)&msg[20] == 71)
      {
        uint64_t v9 = 4294966988;
      }
      else if (*(_DWORD *)&msg[20] == 69898)
      {
        if ((*(_DWORD *)msg & 0x80000000) == 0)
        {
          if (*(_DWORD *)&msg[4] == 36)
          {
            uint64_t v9 = 4294966996;
            if (*(_DWORD *)&msg[32])
            {
              if (*(_DWORD *)&msg[8]) {
                uint64_t v9 = 4294966996;
              }
              else {
                uint64_t v9 = *(unsigned int *)&msg[32];
              }
            }
          }
          else
          {
            uint64_t v9 = 4294966996;
          }
          goto LABEL_24;
        }
        uint64_t v9 = 4294966996;
        if (*(_DWORD *)&msg[24] == 1 && *(_DWORD *)&msg[4] == 56 && !*(_DWORD *)&msg[8] && v13[3] == 1)
        {
          int v10 = *(_DWORD *)&v13[4];
          if (*(_DWORD *)&v13[4] == *(_DWORD *)&v13[16])
          {
            uint64_t v9 = 0;
            *a2 = *(void *)&msg[28];
            *a3 = v10;
            return v9;
          }
        }
      }
      else
      {
        uint64_t v9 = 4294966995;
      }
LABEL_24:
      mach_msg_destroy((mach_msg_header_t *)msg);
      return v9;
    }
    mig_dealloc_special_reply_port();
  }
  return v9;
}

uint64_t wifi_manager_is_hotspot_wpa3_personal_supported(int a1, _DWORD *a2)
{
  *(void *)&long long v4 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v4 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)&rcv_name_12[16] = v4;
  *(_OWORD *)&rcv_name_12[4] = v4;
  int rcv_name = -1431655766;
  mach_port_name_t special_reply_port = mig_get_special_reply_port();
  int rcv_name_4 = a1;
  mach_port_name_t rcv_name_8 = special_reply_port;
  int v10 = 5395;
  *(void *)rcv_name_12 = 0x110A800000000;
  if (MEMORY[0x1E4F14B18])
  {
    voucher_mach_msg_set((mach_msg_header_t *)&v10);
    mach_port_name_t special_reply_port = rcv_name_8;
  }
  uint64_t v6 = mach_msg((mach_msg_header_t *)&v10, 3162115, 0x18u, 0x30u, special_reply_port, 0, 0);
  uint64_t v7 = v6;
  if ((v6 - 268435458) > 0xE || ((1 << (v6 - 2)) & 0x4003) == 0)
  {
    if (!v6)
    {
      if (*(_DWORD *)&rcv_name_12[4] == 71)
      {
        uint64_t v7 = 4294966988;
      }
      else if (*(_DWORD *)&rcv_name_12[4] == 69900)
      {
        if ((v10 & 0x80000000) == 0)
        {
          if (rcv_name == 40)
          {
            if (!rcv_name_4)
            {
              uint64_t v7 = *(unsigned int *)&rcv_name_12[16];
              if (!*(_DWORD *)&rcv_name_12[16])
              {
                *a2 = *(_DWORD *)&rcv_name_12[20];
                return v7;
              }
              goto LABEL_22;
            }
          }
          else if (rcv_name == 36)
          {
            if (rcv_name_4) {
              BOOL v8 = 1;
            }
            else {
              BOOL v8 = *(_DWORD *)&rcv_name_12[16] == 0;
            }
            if (v8) {
              uint64_t v7 = 4294966996;
            }
            else {
              uint64_t v7 = *(unsigned int *)&rcv_name_12[16];
            }
            goto LABEL_22;
          }
        }
        uint64_t v7 = 4294966996;
      }
      else
      {
        uint64_t v7 = 4294966995;
      }
LABEL_22:
      mach_msg_destroy((mach_msg_header_t *)&v10);
      return v7;
    }
    mig_dealloc_special_reply_port();
  }
  return v7;
}

uint64_t wifi_manager_set_auto_instant_hotspot_mode(mach_port_t a1, int a2)
{
  uint64_t v4 = *MEMORY[0x1E4F14068];
  int v5 = a2;
  *(void *)&msg.msgh_bits = 0xAAAAAAAA00000013;
  msg.msgh_voucher_port = 0;
  msg.msgh_id = 69803;
  msg.mach_port_t msgh_remote_port = a1;
  msg.msgh_local_port = 0;
  if (MEMORY[0x1E4F14B18]) {
    voucher_mach_msg_set(&msg);
  }
  return mach_msg(&msg, 2097153, 0x24u, 0, 0, 0, 0);
}

uint64_t wifi_manager_get_auto_instant_hotspot_mode(int a1, _DWORD *a2)
{
  *(void *)&long long v4 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v4 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)&rcv_name_12[16] = v4;
  *(_OWORD *)&rcv_name_12[4] = v4;
  int rcv_name = -1431655766;
  mach_port_name_t special_reply_port = mig_get_special_reply_port();
  int rcv_name_4 = a1;
  mach_port_name_t rcv_name_8 = special_reply_port;
  int v10 = 5395;
  *(void *)rcv_name_12 = 0x110AC00000000;
  if (MEMORY[0x1E4F14B18])
  {
    voucher_mach_msg_set((mach_msg_header_t *)&v10);
    mach_port_name_t special_reply_port = rcv_name_8;
  }
  uint64_t v6 = mach_msg((mach_msg_header_t *)&v10, 3162115, 0x18u, 0x30u, special_reply_port, 0, 0);
  uint64_t v7 = v6;
  if ((v6 - 268435458) > 0xE || ((1 << (v6 - 2)) & 0x4003) == 0)
  {
    if (!v6)
    {
      if (*(_DWORD *)&rcv_name_12[4] == 71)
      {
        uint64_t v7 = 4294966988;
      }
      else if (*(_DWORD *)&rcv_name_12[4] == 69904)
      {
        if ((v10 & 0x80000000) == 0)
        {
          if (rcv_name == 40)
          {
            if (!rcv_name_4)
            {
              uint64_t v7 = *(unsigned int *)&rcv_name_12[16];
              if (!*(_DWORD *)&rcv_name_12[16])
              {
                *a2 = *(_DWORD *)&rcv_name_12[20];
                return v7;
              }
              goto LABEL_22;
            }
          }
          else if (rcv_name == 36)
          {
            if (rcv_name_4) {
              BOOL v8 = 1;
            }
            else {
              BOOL v8 = *(_DWORD *)&rcv_name_12[16] == 0;
            }
            if (v8) {
              uint64_t v7 = 4294966996;
            }
            else {
              uint64_t v7 = *(unsigned int *)&rcv_name_12[16];
            }
            goto LABEL_22;
          }
        }
        uint64_t v7 = 4294966996;
      }
      else
      {
        uint64_t v7 = 4294966995;
      }
LABEL_22:
      mach_msg_destroy((mach_msg_header_t *)&v10);
      return v7;
    }
    mig_dealloc_special_reply_port();
  }
  return v7;
}

uint64_t wifi_manager_set_share_personal_hotspot_mode(mach_port_t a1, int a2)
{
  uint64_t v4 = *MEMORY[0x1E4F14068];
  int v5 = a2;
  *(void *)&msg.msgh_bits = 0xAAAAAAAA00000013;
  msg.msgh_voucher_port = 0;
  msg.msgh_id = 69805;
  msg.mach_port_t msgh_remote_port = a1;
  msg.msgh_local_port = 0;
  if (MEMORY[0x1E4F14B18]) {
    voucher_mach_msg_set(&msg);
  }
  return mach_msg(&msg, 2097153, 0x24u, 0, 0, 0, 0);
}

uint64_t wifi_manager_get_share_personal_hotspot_mode(int a1, _DWORD *a2)
{
  *(void *)&long long v4 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v4 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)&rcv_name_12[16] = v4;
  *(_OWORD *)&rcv_name_12[4] = v4;
  int rcv_name = -1431655766;
  mach_port_name_t special_reply_port = mig_get_special_reply_port();
  int rcv_name_4 = a1;
  mach_port_name_t rcv_name_8 = special_reply_port;
  int v10 = 5395;
  *(void *)rcv_name_12 = 0x110AE00000000;
  if (MEMORY[0x1E4F14B18])
  {
    voucher_mach_msg_set((mach_msg_header_t *)&v10);
    mach_port_name_t special_reply_port = rcv_name_8;
  }
  uint64_t v6 = mach_msg((mach_msg_header_t *)&v10, 3162115, 0x18u, 0x30u, special_reply_port, 0, 0);
  uint64_t v7 = v6;
  if ((v6 - 268435458) > 0xE || ((1 << (v6 - 2)) & 0x4003) == 0)
  {
    if (!v6)
    {
      if (*(_DWORD *)&rcv_name_12[4] == 71)
      {
        uint64_t v7 = 4294966988;
      }
      else if (*(_DWORD *)&rcv_name_12[4] == 69906)
      {
        if ((v10 & 0x80000000) == 0)
        {
          if (rcv_name == 40)
          {
            if (!rcv_name_4)
            {
              uint64_t v7 = *(unsigned int *)&rcv_name_12[16];
              if (!*(_DWORD *)&rcv_name_12[16])
              {
                *a2 = *(_DWORD *)&rcv_name_12[20];
                return v7;
              }
              goto LABEL_22;
            }
          }
          else if (rcv_name == 36)
          {
            if (rcv_name_4) {
              BOOL v8 = 1;
            }
            else {
              BOOL v8 = *(_DWORD *)&rcv_name_12[16] == 0;
            }
            if (v8) {
              uint64_t v7 = 4294966996;
            }
            else {
              uint64_t v7 = *(unsigned int *)&rcv_name_12[16];
            }
            goto LABEL_22;
          }
        }
        uint64_t v7 = 4294966996;
      }
      else
      {
        uint64_t v7 = 4294966995;
      }
LABEL_22:
      mach_msg_destroy((mach_msg_header_t *)&v10);
      return v7;
    }
    mig_dealloc_special_reply_port();
  }
  return v7;
}

uint64_t wifi_manager_set_auto_instant_hotspot_test_mode(mach_port_t a1, int a2)
{
  uint64_t v4 = *MEMORY[0x1E4F14068];
  int v5 = a2;
  *(void *)&msg.msgh_bits = 0xAAAAAAAA00000013;
  msg.msgh_voucher_port = 0;
  msg.msgh_id = 69807;
  msg.mach_port_t msgh_remote_port = a1;
  msg.msgh_local_port = 0;
  if (MEMORY[0x1E4F14B18]) {
    voucher_mach_msg_set(&msg);
  }
  return mach_msg(&msg, 2097153, 0x24u, 0, 0, 0, 0);
}

uint64_t wifi_manager_set_auto_instant_hotspot_trigger_interval(mach_port_t a1, double a2)
{
  uint64_t v4 = *MEMORY[0x1E4F14068];
  double v5 = a2;
  *(void *)&msg.msgh_bits = 0xAAAAAAAA00000013;
  msg.msgh_voucher_port = 0;
  msg.msgh_id = 69808;
  msg.mach_port_t msgh_remote_port = a1;
  msg.msgh_local_port = 0;
  if (MEMORY[0x1E4F14B18]) {
    voucher_mach_msg_set(&msg);
  }
  return mach_msg(&msg, 2097153, 0x28u, 0, 0, 0, 0);
}

uint64_t wifi_device_get_event_interval(mach_port_t a1, uint64_t a2, int a3, int a4, int *a5)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  int v13 = 1;
  uint64_t v14 = a2;
  int v15 = 27918592;
  int v16 = a3;
  uint64_t v17 = *MEMORY[0x1E4F14068];
  int v18 = a3;
  int v19 = a4;
  mach_port_t special_reply_port = mig_get_special_reply_port();
  *(void *)&msg.msgh_bits = 0xAAAAAAAA80001513;
  msg.mach_port_t msgh_remote_port = a1;
  msg.msgh_local_port = special_reply_port;
  *(void *)&msg.msgh_voucher_port = 0x110B100000000;
  if (MEMORY[0x1E4F14B18])
  {
    voucher_mach_msg_set(&msg);
    mach_port_t special_reply_port = msg.msgh_local_port;
  }
  uint64_t v8 = mach_msg(&msg, 3162115, 0x3Cu, 0x30u, special_reply_port, 0, 0);
  uint64_t v9 = v8;
  if ((v8 - 268435458) > 0xE || ((1 << (v8 - 2)) & 0x4003) == 0)
  {
    if (!v8)
    {
      if (msg.msgh_id == 71)
      {
        uint64_t v9 = 4294966988;
      }
      else if (msg.msgh_id == 69909)
      {
        if ((msg.msgh_bits & 0x80000000) == 0)
        {
          if (msg.msgh_size == 40)
          {
            if (!msg.msgh_remote_port)
            {
              uint64_t v9 = HIDWORD(v14);
              if (!HIDWORD(v14))
              {
                *a5 = v15;
                return v9;
              }
              goto LABEL_22;
            }
          }
          else if (msg.msgh_size == 36)
          {
            if (msg.msgh_remote_port) {
              BOOL v10 = 1;
            }
            else {
              BOOL v10 = HIDWORD(v14) == 0;
            }
            if (v10) {
              uint64_t v9 = 4294966996;
            }
            else {
              uint64_t v9 = HIDWORD(v14);
            }
            goto LABEL_22;
          }
        }
        uint64_t v9 = 4294966996;
      }
      else
      {
        uint64_t v9 = 4294966995;
      }
LABEL_22:
      mach_msg_destroy(&msg);
      return v9;
    }
    mig_dealloc_special_reply_port();
  }
  return v9;
}

uint64_t wifi_device_set_event_interval(mach_port_t a1, uint64_t a2, int a3, uint64_t a4, int a5, int *a6)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  int v14 = 1;
  uint64_t v15 = a2;
  int v16 = 27918592;
  int v17 = a3;
  uint64_t v18 = *MEMORY[0x1E4F14068];
  int v19 = a3;
  uint64_t v20 = a4;
  int v21 = a5;
  mach_port_t special_reply_port = mig_get_special_reply_port();
  *(void *)&v13.msgh_bits = 0xAAAAAAAA80001513;
  v13.mach_port_t msgh_remote_port = a1;
  v13.msgh_local_port = special_reply_port;
  *(void *)&v13.msgh_voucher_port = 0x110B200000000;
  if (MEMORY[0x1E4F14B18])
  {
    voucher_mach_msg_set(&v13);
    mach_port_t special_reply_port = v13.msgh_local_port;
  }
  uint64_t v9 = mach_msg(&v13, 3162115, 0x44u, 0x30u, special_reply_port, 0, 0);
  uint64_t v10 = v9;
  if ((v9 - 268435458) > 0xE || ((1 << (v9 - 2)) & 0x4003) == 0)
  {
    if (!v9)
    {
      if (v13.msgh_id == 71)
      {
        uint64_t v10 = 4294966988;
      }
      else if (v13.msgh_id == 69910)
      {
        if ((v13.msgh_bits & 0x80000000) == 0)
        {
          if (v13.msgh_size == 40)
          {
            if (!v13.msgh_remote_port)
            {
              uint64_t v10 = HIDWORD(v15);
              if (!HIDWORD(v15))
              {
                *a6 = v16;
                return v10;
              }
              goto LABEL_22;
            }
          }
          else if (v13.msgh_size == 36)
          {
            if (v13.msgh_remote_port) {
              BOOL v11 = 1;
            }
            else {
              BOOL v11 = HIDWORD(v15) == 0;
            }
            if (v11) {
              uint64_t v10 = 4294966996;
            }
            else {
              uint64_t v10 = HIDWORD(v15);
            }
            goto LABEL_22;
          }
        }
        uint64_t v10 = 4294966996;
      }
      else
      {
        uint64_t v10 = 4294966995;
      }
LABEL_22:
      mach_msg_destroy(&v13);
      return v10;
    }
    mig_dealloc_special_reply_port();
  }
  return v10;
}

uint64_t wifi_manager_is_infra_allowed(int a1, _DWORD *a2)
{
  *(void *)&long long v4 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v4 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)&rcv_name_12[16] = v4;
  *(_OWORD *)&rcv_name_12[4] = v4;
  int rcv_name = -1431655766;
  mach_port_name_t special_reply_port = mig_get_special_reply_port();
  int rcv_name_4 = a1;
  mach_port_name_t rcv_name_8 = special_reply_port;
  int v10 = 5395;
  *(void *)rcv_name_12 = 0x110B300000000;
  if (MEMORY[0x1E4F14B18])
  {
    voucher_mach_msg_set((mach_msg_header_t *)&v10);
    mach_port_name_t special_reply_port = rcv_name_8;
  }
  uint64_t v6 = mach_msg((mach_msg_header_t *)&v10, 3162115, 0x18u, 0x30u, special_reply_port, 0, 0);
  uint64_t v7 = v6;
  if ((v6 - 268435458) > 0xE || ((1 << (v6 - 2)) & 0x4003) == 0)
  {
    if (!v6)
    {
      if (*(_DWORD *)&rcv_name_12[4] == 71)
      {
        uint64_t v7 = 4294966988;
      }
      else if (*(_DWORD *)&rcv_name_12[4] == 69911)
      {
        if ((v10 & 0x80000000) == 0)
        {
          if (rcv_name == 40)
          {
            if (!rcv_name_4)
            {
              uint64_t v7 = *(unsigned int *)&rcv_name_12[16];
              if (!*(_DWORD *)&rcv_name_12[16])
              {
                *a2 = *(_DWORD *)&rcv_name_12[20];
                return v7;
              }
              goto LABEL_22;
            }
          }
          else if (rcv_name == 36)
          {
            if (rcv_name_4) {
              BOOL v8 = 1;
            }
            else {
              BOOL v8 = *(_DWORD *)&rcv_name_12[16] == 0;
            }
            if (v8) {
              uint64_t v7 = 4294966996;
            }
            else {
              uint64_t v7 = *(unsigned int *)&rcv_name_12[16];
            }
            goto LABEL_22;
          }
        }
        uint64_t v7 = 4294966996;
      }
      else
      {
        uint64_t v7 = 4294966995;
      }
LABEL_22:
      mach_msg_destroy((mach_msg_header_t *)&v10);
      return v7;
    }
    mig_dealloc_special_reply_port();
  }
  return v7;
}

uint64_t wifi_manager_is_p2p_allowed(int a1, _DWORD *a2)
{
  *(void *)&long long v4 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v4 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)&rcv_name_12[16] = v4;
  *(_OWORD *)&rcv_name_12[4] = v4;
  int rcv_name = -1431655766;
  mach_port_name_t special_reply_port = mig_get_special_reply_port();
  int rcv_name_4 = a1;
  mach_port_name_t rcv_name_8 = special_reply_port;
  int v10 = 5395;
  *(void *)rcv_name_12 = 0x110B400000000;
  if (MEMORY[0x1E4F14B18])
  {
    voucher_mach_msg_set((mach_msg_header_t *)&v10);
    mach_port_name_t special_reply_port = rcv_name_8;
  }
  uint64_t v6 = mach_msg((mach_msg_header_t *)&v10, 3162115, 0x18u, 0x30u, special_reply_port, 0, 0);
  uint64_t v7 = v6;
  if ((v6 - 268435458) > 0xE || ((1 << (v6 - 2)) & 0x4003) == 0)
  {
    if (!v6)
    {
      if (*(_DWORD *)&rcv_name_12[4] == 71)
      {
        uint64_t v7 = 4294966988;
      }
      else if (*(_DWORD *)&rcv_name_12[4] == 69912)
      {
        if ((v10 & 0x80000000) == 0)
        {
          if (rcv_name == 40)
          {
            if (!rcv_name_4)
            {
              uint64_t v7 = *(unsigned int *)&rcv_name_12[16];
              if (!*(_DWORD *)&rcv_name_12[16])
              {
                *a2 = *(_DWORD *)&rcv_name_12[20];
                return v7;
              }
              goto LABEL_22;
            }
          }
          else if (rcv_name == 36)
          {
            if (rcv_name_4) {
              BOOL v8 = 1;
            }
            else {
              BOOL v8 = *(_DWORD *)&rcv_name_12[16] == 0;
            }
            if (v8) {
              uint64_t v7 = 4294966996;
            }
            else {
              uint64_t v7 = *(unsigned int *)&rcv_name_12[16];
            }
            goto LABEL_22;
          }
        }
        uint64_t v7 = 4294966996;
      }
      else
      {
        uint64_t v7 = 4294966995;
      }
LABEL_22:
      mach_msg_destroy((mach_msg_header_t *)&v10);
      return v7;
    }
    mig_dealloc_special_reply_port();
  }
  return v7;
}

uint64_t wifi_manager_set_network_property(mach_port_t a1, uint64_t a2, int a3, uint64_t a4, int a5, uint64_t a6, int a7, int *a8)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  int v16 = 3;
  uint64_t v17 = a2;
  int v18 = 27918592;
  int v19 = a3;
  uint64_t v20 = a4;
  int v21 = 27918592;
  int v22 = a5;
  uint64_t v23 = a6;
  int v24 = 27918592;
  int v25 = a7;
  uint64_t v26 = *MEMORY[0x1E4F14068];
  int v27 = a3;
  int v28 = a5;
  int v29 = a7;
  mach_port_t special_reply_port = mig_get_special_reply_port();
  *(void *)&msg.msgh_bits = 0xAAAAAAAA80001513;
  msg.mach_port_t msgh_remote_port = a1;
  msg.msgh_local_port = special_reply_port;
  *(void *)&msg.msgh_voucher_port = 0x110B500000000;
  if (MEMORY[0x1E4F14B18])
  {
    voucher_mach_msg_set(&msg);
    mach_port_t special_reply_port = msg.msgh_local_port;
  }
  uint64_t v11 = mach_msg(&msg, 3162115, 0x60u, 0x30u, special_reply_port, 0, 0);
  uint64_t v12 = v11;
  if ((v11 - 268435458) > 0xE || ((1 << (v11 - 2)) & 0x4003) == 0)
  {
    if (!v11)
    {
      if (msg.msgh_id == 71)
      {
        uint64_t v12 = 4294966988;
      }
      else if (msg.msgh_id == 69913)
      {
        if ((msg.msgh_bits & 0x80000000) == 0)
        {
          if (msg.msgh_size == 40)
          {
            if (!msg.msgh_remote_port)
            {
              uint64_t v12 = HIDWORD(v17);
              if (!HIDWORD(v17))
              {
                *a8 = v18;
                return v12;
              }
              goto LABEL_22;
            }
          }
          else if (msg.msgh_size == 36)
          {
            if (msg.msgh_remote_port) {
              BOOL v13 = 1;
            }
            else {
              BOOL v13 = HIDWORD(v17) == 0;
            }
            if (v13) {
              uint64_t v12 = 4294966996;
            }
            else {
              uint64_t v12 = HIDWORD(v17);
            }
            goto LABEL_22;
          }
        }
        uint64_t v12 = 4294966996;
      }
      else
      {
        uint64_t v12 = 4294966995;
      }
LABEL_22:
      mach_msg_destroy(&msg);
      return v12;
    }
    mig_dealloc_special_reply_port();
  }
  return v12;
}

uint64_t wifi_manager_copy_family_hotspot_preferences(int a1, void *a2, _DWORD *a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  *(void *)&long long v6 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v6 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)&v13[12] = v6;
  *(_OWORD *)BOOL v13 = v6;
  *(_OWORD *)&msg[20] = v6;
  *(_DWORD *)&msg[4] = -1431655766;
  mach_port_name_t special_reply_port = mig_get_special_reply_port();
  *(_DWORD *)&msg[8] = a1;
  *(_DWORD *)&msg[12] = special_reply_port;
  *(_DWORD *)mach_msg_header_t msg = 5395;
  *(void *)&msg[16] = 0x110B600000000;
  if (MEMORY[0x1E4F14B18])
  {
    voucher_mach_msg_set((mach_msg_header_t *)msg);
    mach_port_name_t special_reply_port = *(_DWORD *)&msg[12];
  }
  uint64_t v8 = mach_msg((mach_msg_header_t *)msg, 3162115, 0x18u, 0x40u, special_reply_port, 0, 0);
  uint64_t v9 = v8;
  if ((v8 - 268435458) > 0xE || ((1 << (v8 - 2)) & 0x4003) == 0)
  {
    if (!v8)
    {
      if (*(_DWORD *)&msg[20] == 71)
      {
        uint64_t v9 = 4294966988;
      }
      else if (*(_DWORD *)&msg[20] == 69914)
      {
        if ((*(_DWORD *)msg & 0x80000000) == 0)
        {
          if (*(_DWORD *)&msg[4] == 36)
          {
            uint64_t v9 = 4294966996;
            if (*(_DWORD *)&msg[32])
            {
              if (*(_DWORD *)&msg[8]) {
                uint64_t v9 = 4294966996;
              }
              else {
                uint64_t v9 = *(unsigned int *)&msg[32];
              }
            }
          }
          else
          {
            uint64_t v9 = 4294966996;
          }
          goto LABEL_24;
        }
        uint64_t v9 = 4294966996;
        if (*(_DWORD *)&msg[24] == 1 && *(_DWORD *)&msg[4] == 56 && !*(_DWORD *)&msg[8] && v13[3] == 1)
        {
          int v10 = *(_DWORD *)&v13[4];
          if (*(_DWORD *)&v13[4] == *(_DWORD *)&v13[16])
          {
            uint64_t v9 = 0;
            *a2 = *(void *)&msg[28];
            *a3 = v10;
            return v9;
          }
        }
      }
      else
      {
        uint64_t v9 = 4294966995;
      }
LABEL_24:
      mach_msg_destroy((mach_msg_header_t *)msg);
      return v9;
    }
    mig_dealloc_special_reply_port();
  }
  return v9;
}

uint64_t wifi_manager_set_built_in_receiver(mach_port_t a1, int a2)
{
  uint64_t v4 = *MEMORY[0x1E4F14068];
  int v5 = a2;
  *(void *)&msg.msgh_bits = 0xAAAAAAAA00000013;
  msg.msgh_voucher_port = 0;
  msg.msgh_id = 69817;
  msg.mach_port_t msgh_remote_port = a1;
  msg.msgh_local_port = 0;
  if (MEMORY[0x1E4F14B18]) {
    voucher_mach_msg_set(&msg);
  }
  return mach_msg(&msg, 2097153, 0x24u, 0, 0, 0, 0);
}

uint64_t wifi_manager_is_personal_hotspot_modification_disabled(int a1, _DWORD *a2)
{
  *(void *)&long long v4 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v4 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)&rcv_name_12[16] = v4;
  *(_OWORD *)&rcv_name_12[4] = v4;
  int rcv_name = -1431655766;
  mach_port_name_t special_reply_port = mig_get_special_reply_port();
  int rcv_name_4 = a1;
  mach_port_name_t rcv_name_8 = special_reply_port;
  int v10 = 5395;
  *(void *)rcv_name_12 = 0x110BA00000000;
  if (MEMORY[0x1E4F14B18])
  {
    voucher_mach_msg_set((mach_msg_header_t *)&v10);
    mach_port_name_t special_reply_port = rcv_name_8;
  }
  uint64_t v6 = mach_msg((mach_msg_header_t *)&v10, 3162115, 0x18u, 0x30u, special_reply_port, 0, 0);
  uint64_t v7 = v6;
  if ((v6 - 268435458) > 0xE || ((1 << (v6 - 2)) & 0x4003) == 0)
  {
    if (!v6)
    {
      if (*(_DWORD *)&rcv_name_12[4] == 71)
      {
        uint64_t v7 = 4294966988;
      }
      else if (*(_DWORD *)&rcv_name_12[4] == 69918)
      {
        if ((v10 & 0x80000000) == 0)
        {
          if (rcv_name == 40)
          {
            if (!rcv_name_4)
            {
              uint64_t v7 = *(unsigned int *)&rcv_name_12[16];
              if (!*(_DWORD *)&rcv_name_12[16])
              {
                *a2 = *(_DWORD *)&rcv_name_12[20];
                return v7;
              }
              goto LABEL_22;
            }
          }
          else if (rcv_name == 36)
          {
            if (rcv_name_4) {
              BOOL v8 = 1;
            }
            else {
              BOOL v8 = *(_DWORD *)&rcv_name_12[16] == 0;
            }
            if (v8) {
              uint64_t v7 = 4294966996;
            }
            else {
              uint64_t v7 = *(unsigned int *)&rcv_name_12[16];
            }
            goto LABEL_22;
          }
        }
        uint64_t v7 = 4294966996;
      }
      else
      {
        uint64_t v7 = 4294966995;
      }
LABEL_22:
      mach_msg_destroy((mach_msg_header_t *)&v10);
      return v7;
    }
    mig_dealloc_special_reply_port();
  }
  return v7;
}

uint64_t wifi_device_copy_network_recommendations(int a1, uint64_t a2, int a3, void *a4, _DWORD *a5)
{
  *(void *)&long long v8 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v8 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(void *)&rcv_name[16] = 0x1AAAAAAAALL;
  *(_DWORD *)int v19 = -1431655766;
  *(_OWORD *)&v19[4] = v8;
  *(_OWORD *)int rcv_name = v8;
  uint64_t v16 = a2;
  int v17 = 27918592;
  int v18 = a3;
  *(void *)int v19 = *MEMORY[0x1E4F14068];
  *(_DWORD *)&v19[8] = a3;
  mach_port_name_t special_reply_port = mig_get_special_reply_port();
  *(_DWORD *)&rcv_name[4] = a1;
  *(_DWORD *)&rcv_name[8] = special_reply_port;
  int v14 = -2147478253;
  *(void *)&rcv_name[12] = 0x110BB00000000;
  if (MEMORY[0x1E4F14B18])
  {
    voucher_mach_msg_set((mach_msg_header_t *)&v14);
    mach_port_name_t special_reply_port = *(_DWORD *)&rcv_name[8];
  }
  uint64_t v10 = mach_msg((mach_msg_header_t *)&v14, 3162115, 0x38u, 0x40u, special_reply_port, 0, 0);
  uint64_t v11 = v10;
  if ((v10 - 268435458) > 0xE || ((1 << (v10 - 2)) & 0x4003) == 0)
  {
    if (!v10)
    {
      if (*(_DWORD *)&rcv_name[16] == 71)
      {
        uint64_t v11 = 4294966988;
      }
      else if (*(_DWORD *)&rcv_name[16] == 69919)
      {
        if ((v14 & 0x80000000) == 0)
        {
          if (*(_DWORD *)rcv_name == 36)
          {
            uint64_t v11 = 4294966996;
            if (HIDWORD(v16))
            {
              if (*(_DWORD *)&rcv_name[4]) {
                uint64_t v11 = 4294966996;
              }
              else {
                uint64_t v11 = HIDWORD(v16);
              }
            }
          }
          else
          {
            uint64_t v11 = 4294966996;
          }
          goto LABEL_24;
        }
        uint64_t v11 = 4294966996;
        if (*(_DWORD *)&rcv_name[20] == 1 && *(_DWORD *)rcv_name == 56 && !*(_DWORD *)&rcv_name[4] && HIBYTE(v17) == 1)
        {
          int v12 = v18;
          if (v18 == *(_DWORD *)&v19[8])
          {
            uint64_t v11 = 0;
            *a4 = v16;
            *a5 = v12;
            return v11;
          }
        }
      }
      else
      {
        uint64_t v11 = 4294966995;
      }
LABEL_24:
      mach_msg_destroy((mach_msg_header_t *)&v14);
      return v11;
    }
    mig_dealloc_special_reply_port();
  }
  return v11;
}

uint64_t wifi_device_reset_availability_engine(int a1, uint64_t a2, int a3)
{
  uint64_t v5 = a2;
  int v6 = 27918592;
  int v7 = a3;
  uint64_t v8 = *MEMORY[0x1E4F14068];
  int v9 = a3;
  *(void *)mach_msg_header_t msg = 0xAAAAAAAA80000013;
  *(_DWORD *)&msg[8] = a1;
  *(_OWORD *)&msg[12] = xmmword_1BF21A3A0;
  if (MEMORY[0x1E4F14B18]) {
    voucher_mach_msg_set((mach_msg_header_t *)msg);
  }
  return mach_msg((mach_msg_header_t *)msg, 2097153, 0x38u, 0, 0, 0, 0);
}

uint64_t wifi_manager_set_user_interaction_override(int a1, uint64_t a2, int a3)
{
  uint64_t v5 = a2;
  int v6 = 27918592;
  int v7 = a3;
  uint64_t v8 = *MEMORY[0x1E4F14068];
  int v9 = a3;
  *(void *)mach_msg_header_t msg = 0xAAAAAAAA80000013;
  *(_DWORD *)&msg[8] = a1;
  *(_OWORD *)&msg[12] = xmmword_1BF21A3B0;
  if (MEMORY[0x1E4F14B18]) {
    voucher_mach_msg_set((mach_msg_header_t *)msg);
  }
  return mach_msg((mach_msg_header_t *)msg, 2097153, 0x38u, 0, 0, 0, 0);
}

uint64_t wifi_manager_set_user_interaction_nw_override(int a1, uint64_t a2, int a3)
{
  uint64_t v5 = a2;
  int v6 = 27918592;
  int v7 = a3;
  uint64_t v8 = *MEMORY[0x1E4F14068];
  int v9 = a3;
  *(void *)mach_msg_header_t msg = 0xAAAAAAAA80000013;
  *(_DWORD *)&msg[8] = a1;
  *(_OWORD *)&msg[12] = xmmword_1BF21A3C0;
  if (MEMORY[0x1E4F14B18]) {
    voucher_mach_msg_set((mach_msg_header_t *)msg);
  }
  return mach_msg((mach_msg_header_t *)msg, 2097153, 0x38u, 0, 0, 0, 0);
}

uint64_t wifi_device_bssblacklist_command(mach_port_t a1, uint64_t a2, int a3, uint64_t a4, int a5, void *a6, _DWORD *a7)
{
  int v16 = 2;
  uint64_t v17 = a2;
  int v18 = 27918592;
  int v19 = a3;
  uint64_t v20 = a4;
  int v21 = 27918592;
  int v22 = a5;
  uint64_t v23 = *MEMORY[0x1E4F14068];
  int v24 = a3;
  int v25 = a5;
  mach_port_t special_reply_port = mig_get_special_reply_port();
  *(void *)&v15.msgh_bits = 0xAAAAAAAA80001513;
  v15.mach_port_t msgh_remote_port = a1;
  v15.msgh_local_port = special_reply_port;
  *(void *)&v15.msgh_voucher_port = 0x110BF00000000;
  if (MEMORY[0x1E4F14B18])
  {
    voucher_mach_msg_set(&v15);
    mach_port_t special_reply_port = v15.msgh_local_port;
  }
  uint64_t v11 = mach_msg(&v15, 3162115, 0x4Cu, 0x40u, special_reply_port, 0, 0);
  uint64_t v12 = v11;
  if ((v11 - 268435458) > 0xE || ((1 << (v11 - 2)) & 0x4003) == 0)
  {
    if (!v11)
    {
      if (v15.msgh_id == 71)
      {
        uint64_t v12 = 4294966988;
      }
      else if (v15.msgh_id == 69923)
      {
        if ((v15.msgh_bits & 0x80000000) == 0)
        {
          if (v15.msgh_size == 36)
          {
            uint64_t v12 = 4294966996;
            if (HIDWORD(v17))
            {
              if (v15.msgh_remote_port) {
                uint64_t v12 = 4294966996;
              }
              else {
                uint64_t v12 = HIDWORD(v17);
              }
            }
          }
          else
          {
            uint64_t v12 = 4294966996;
          }
          goto LABEL_23;
        }
        uint64_t v12 = 4294966996;
        if (v16 == 1 && *(void *)&v15.msgh_size == 56 && HIBYTE(v18) == 1)
        {
          int v13 = v19;
          if (v19 == v21)
          {
            uint64_t v12 = 0;
            *a6 = v17;
            *a7 = v13;
            return v12;
          }
        }
      }
      else
      {
        uint64_t v12 = 4294966995;
      }
LABEL_23:
      mach_msg_destroy(&v15);
      return v12;
    }
    mig_dealloc_special_reply_port();
  }
  return v12;
}

uint64_t wifi_manager_set_private_mac_pref(mach_port_t a1, uint64_t a2, int a3, int a4, uint64_t a5, int a6, int *a7)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  int v15 = 2;
  uint64_t v16 = a2;
  int v17 = 27918592;
  int v18 = a3;
  uint64_t v19 = a5;
  int v20 = 27918592;
  int v21 = a6;
  uint64_t v22 = *MEMORY[0x1E4F14068];
  int v23 = a3;
  int v24 = a4;
  int v25 = a6;
  mach_port_t special_reply_port = mig_get_special_reply_port();
  *(void *)&msg.msgh_bits = 0xAAAAAAAA80001513;
  msg.mach_port_t msgh_remote_port = a1;
  msg.msgh_local_port = special_reply_port;
  *(void *)&msg.msgh_voucher_port = 0x110C000000000;
  if (MEMORY[0x1E4F14B18])
  {
    voucher_mach_msg_set(&msg);
    mach_port_t special_reply_port = msg.msgh_local_port;
  }
  uint64_t v10 = mach_msg(&msg, 3162115, 0x50u, 0x30u, special_reply_port, 0, 0);
  uint64_t v11 = v10;
  if ((v10 - 268435458) > 0xE || ((1 << (v10 - 2)) & 0x4003) == 0)
  {
    if (!v10)
    {
      if (msg.msgh_id == 71)
      {
        uint64_t v11 = 4294966988;
      }
      else if (msg.msgh_id == 69924)
      {
        if ((msg.msgh_bits & 0x80000000) == 0)
        {
          if (msg.msgh_size == 40)
          {
            if (!msg.msgh_remote_port)
            {
              uint64_t v11 = HIDWORD(v16);
              if (!HIDWORD(v16))
              {
                *a7 = v17;
                return v11;
              }
              goto LABEL_22;
            }
          }
          else if (msg.msgh_size == 36)
          {
            if (msg.msgh_remote_port) {
              BOOL v12 = 1;
            }
            else {
              BOOL v12 = HIDWORD(v16) == 0;
            }
            if (v12) {
              uint64_t v11 = 4294966996;
            }
            else {
              uint64_t v11 = HIDWORD(v16);
            }
            goto LABEL_22;
          }
        }
        uint64_t v11 = 4294966996;
      }
      else
      {
        uint64_t v11 = 4294966995;
      }
LABEL_22:
      mach_msg_destroy(&msg);
      return v11;
    }
    mig_dealloc_special_reply_port();
  }
  return v11;
}

uint64_t wifi_manager_set_mac_randomisation_params(int a1, uint64_t a2, int a3)
{
  uint64_t v5 = a2;
  int v6 = 27918592;
  int v7 = a3;
  uint64_t v8 = *MEMORY[0x1E4F14068];
  int v9 = a3;
  *(void *)mach_msg_header_t msg = 0xAAAAAAAA80000013;
  *(_DWORD *)&msg[8] = a1;
  *(_OWORD *)&msg[12] = xmmword_1BF21A3D0;
  if (MEMORY[0x1E4F14B18]) {
    voucher_mach_msg_set((mach_msg_header_t *)msg);
  }
  return mach_msg((mach_msg_header_t *)msg, 2097153, 0x38u, 0, 0, 0, 0);
}

uint64_t wifi_device_update_network_property(int a1, uint64_t a2, int a3, uint64_t a4, int a5)
{
  uint64_t v9 = a2;
  int v10 = 27918592;
  int v11 = a3;
  uint64_t v12 = a4;
  int v13 = 27918592;
  int v14 = a5;
  uint64_t v15 = *MEMORY[0x1E4F14068];
  int v16 = a3;
  int v17 = a5;
  unint64_t v6 = 0xAAAAAAAA80000013;
  int v7 = a1;
  long long v8 = xmmword_1BF21A3E0;
  if (MEMORY[0x1E4F14B18]) {
    voucher_mach_msg_set((mach_msg_header_t *)&v6);
  }
  return mach_msg((mach_msg_header_t *)&v6, 2097153, 0x4Cu, 0, 0, 0, 0);
}

uint64_t wifi_manager_get_mac_randomisation_parameters(int a1, void *a2, _DWORD *a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  *(void *)&long long v6 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v6 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)&v13[12] = v6;
  *(_OWORD *)int v13 = v6;
  *(_OWORD *)&msg[20] = v6;
  *(_DWORD *)&msg[4] = -1431655766;
  mach_port_name_t special_reply_port = mig_get_special_reply_port();
  *(_DWORD *)&msg[8] = a1;
  *(_DWORD *)&msg[12] = special_reply_port;
  *(_DWORD *)mach_msg_header_t msg = 5395;
  *(void *)&msg[16] = 0x110C300000000;
  if (MEMORY[0x1E4F14B18])
  {
    voucher_mach_msg_set((mach_msg_header_t *)msg);
    mach_port_name_t special_reply_port = *(_DWORD *)&msg[12];
  }
  uint64_t v8 = mach_msg((mach_msg_header_t *)msg, 3162115, 0x18u, 0x40u, special_reply_port, 0, 0);
  uint64_t v9 = v8;
  if ((v8 - 268435458) > 0xE || ((1 << (v8 - 2)) & 0x4003) == 0)
  {
    if (!v8)
    {
      if (*(_DWORD *)&msg[20] == 71)
      {
        uint64_t v9 = 4294966988;
      }
      else if (*(_DWORD *)&msg[20] == 69927)
      {
        if ((*(_DWORD *)msg & 0x80000000) == 0)
        {
          if (*(_DWORD *)&msg[4] == 36)
          {
            uint64_t v9 = 4294966996;
            if (*(_DWORD *)&msg[32])
            {
              if (*(_DWORD *)&msg[8]) {
                uint64_t v9 = 4294966996;
              }
              else {
                uint64_t v9 = *(unsigned int *)&msg[32];
              }
            }
          }
          else
          {
            uint64_t v9 = 4294966996;
          }
          goto LABEL_24;
        }
        uint64_t v9 = 4294966996;
        if (*(_DWORD *)&msg[24] == 1 && *(_DWORD *)&msg[4] == 56 && !*(_DWORD *)&msg[8] && v13[3] == 1)
        {
          int v10 = *(_DWORD *)&v13[4];
          if (*(_DWORD *)&v13[4] == *(_DWORD *)&v13[16])
          {
            uint64_t v9 = 0;
            *a2 = *(void *)&msg[28];
            *a3 = v10;
            return v9;
          }
        }
      }
      else
      {
        uint64_t v9 = 4294966995;
      }
LABEL_24:
      mach_msg_destroy((mach_msg_header_t *)msg);
      return v9;
    }
    mig_dealloc_special_reply_port();
  }
  return v9;
}

uint64_t wifi_manager_get_privatemac_network_switch_state(mach_port_t a1, uint64_t a2, int a3, int *a4)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  int v12 = 1;
  uint64_t v13 = a2;
  int v14 = 27918592;
  int v15 = a3;
  uint64_t v16 = *MEMORY[0x1E4F14068];
  int v17 = a3;
  mach_port_t special_reply_port = mig_get_special_reply_port();
  *(void *)&v11.msgh_bits = 0xAAAAAAAA80001513;
  v11.mach_port_t msgh_remote_port = a1;
  v11.msgh_local_port = special_reply_port;
  *(void *)&v11.msgh_voucher_port = 0x110C400000000;
  if (MEMORY[0x1E4F14B18])
  {
    voucher_mach_msg_set(&v11);
    mach_port_t special_reply_port = v11.msgh_local_port;
  }
  uint64_t v7 = mach_msg(&v11, 3162115, 0x38u, 0x30u, special_reply_port, 0, 0);
  uint64_t v8 = v7;
  if ((v7 - 268435458) > 0xE || ((1 << (v7 - 2)) & 0x4003) == 0)
  {
    if (!v7)
    {
      if (v11.msgh_id == 71)
      {
        uint64_t v8 = 4294966988;
      }
      else if (v11.msgh_id == 69928)
      {
        if ((v11.msgh_bits & 0x80000000) == 0)
        {
          if (v11.msgh_size == 40)
          {
            if (!v11.msgh_remote_port)
            {
              uint64_t v8 = HIDWORD(v13);
              if (!HIDWORD(v13))
              {
                *a4 = v14;
                return v8;
              }
              goto LABEL_22;
            }
          }
          else if (v11.msgh_size == 36)
          {
            if (v11.msgh_remote_port) {
              BOOL v9 = 1;
            }
            else {
              BOOL v9 = HIDWORD(v13) == 0;
            }
            if (v9) {
              uint64_t v8 = 4294966996;
            }
            else {
              uint64_t v8 = HIDWORD(v13);
            }
            goto LABEL_22;
          }
        }
        uint64_t v8 = 4294966996;
      }
      else
      {
        uint64_t v8 = 4294966995;
      }
LABEL_22:
      mach_msg_destroy(&v11);
      return v8;
    }
    mig_dealloc_special_reply_port();
  }
  return v8;
}

uint64_t wifi_manager_update_privateMac_network(int a1, uint64_t a2, int a3)
{
  uint64_t v5 = a2;
  int v6 = 27918592;
  int v7 = a3;
  uint64_t v8 = *MEMORY[0x1E4F14068];
  int v9 = a3;
  *(void *)mach_msg_header_t msg = 0xAAAAAAAA80000013;
  *(_DWORD *)&msg[8] = a1;
  *(_OWORD *)&msg[12] = xmmword_1BF21A3F0;
  if (MEMORY[0x1E4F14B18]) {
    voucher_mach_msg_set((mach_msg_header_t *)msg);
  }
  return mach_msg((mach_msg_header_t *)msg, 2097153, 0x38u, 0, 0, 0, 0);
}

uint64_t wifi_manager_private_mac_is_quick_probe_required(mach_port_t a1, uint64_t a2, int a3, int *a4)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  int v12 = 1;
  uint64_t v13 = a2;
  int v14 = 27918592;
  int v15 = a3;
  uint64_t v16 = *MEMORY[0x1E4F14068];
  int v17 = a3;
  mach_port_t special_reply_port = mig_get_special_reply_port();
  *(void *)&v11.msgh_bits = 0xAAAAAAAA80001513;
  v11.mach_port_t msgh_remote_port = a1;
  v11.msgh_local_port = special_reply_port;
  *(void *)&v11.msgh_voucher_port = 0x110C600000000;
  if (MEMORY[0x1E4F14B18])
  {
    voucher_mach_msg_set(&v11);
    mach_port_t special_reply_port = v11.msgh_local_port;
  }
  uint64_t v7 = mach_msg(&v11, 3162115, 0x38u, 0x30u, special_reply_port, 0, 0);
  uint64_t v8 = v7;
  if ((v7 - 268435458) > 0xE || ((1 << (v7 - 2)) & 0x4003) == 0)
  {
    if (!v7)
    {
      if (v11.msgh_id == 71)
      {
        uint64_t v8 = 4294966988;
      }
      else if (v11.msgh_id == 69930)
      {
        if ((v11.msgh_bits & 0x80000000) == 0)
        {
          if (v11.msgh_size == 40)
          {
            if (!v11.msgh_remote_port)
            {
              uint64_t v8 = HIDWORD(v13);
              if (!HIDWORD(v13))
              {
                *a4 = v14;
                return v8;
              }
              goto LABEL_22;
            }
          }
          else if (v11.msgh_size == 36)
          {
            if (v11.msgh_remote_port) {
              BOOL v9 = 1;
            }
            else {
              BOOL v9 = HIDWORD(v13) == 0;
            }
            if (v9) {
              uint64_t v8 = 4294966996;
            }
            else {
              uint64_t v8 = HIDWORD(v13);
            }
            goto LABEL_22;
          }
        }
        uint64_t v8 = 4294966996;
      }
      else
      {
        uint64_t v8 = 4294966995;
      }
LABEL_22:
      mach_msg_destroy(&v11);
      return v8;
    }
    mig_dealloc_special_reply_port();
  }
  return v8;
}

uint64_t wifi_manager_private_mac_probe_result(mach_port_t a1, int a2, uint64_t a3, int a4)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  int v10 = 1;
  uint64_t v11 = a3;
  int v12 = 27918592;
  int v13 = a4;
  uint64_t v14 = *MEMORY[0x1E4F14068];
  int v15 = a2;
  int v16 = a4;
  mach_port_t special_reply_port = mig_get_special_reply_port();
  *(void *)&msg.msgh_bits = 0xAAAAAAAA80001513;
  msg.mach_port_t msgh_remote_port = a1;
  msg.msgh_local_port = special_reply_port;
  *(void *)&msg.msgh_voucher_port = 0x110C700000000;
  if (MEMORY[0x1E4F14B18])
  {
    voucher_mach_msg_set(&msg);
    mach_port_t special_reply_port = msg.msgh_local_port;
  }
  uint64_t v6 = mach_msg(&msg, 3162115, 0x3Cu, 0x2Cu, special_reply_port, 0, 0);
  uint64_t v7 = v6;
  if ((v6 - 268435458) > 0xE || ((1 << (v6 - 2)) & 0x4003) == 0)
  {
    if (v6)
    {
      mig_dealloc_special_reply_port();
      return v7;
    }
    if (msg.msgh_id == 71)
    {
      uint64_t v7 = 4294966988;
    }
    else if (msg.msgh_id == 69931)
    {
      uint64_t v7 = 4294966996;
      if ((msg.msgh_bits & 0x80000000) == 0 && msg.msgh_size == 36 && !msg.msgh_remote_port)
      {
        uint64_t v7 = HIDWORD(v11);
        if (!HIDWORD(v11)) {
          return v7;
        }
      }
    }
    else
    {
      uint64_t v7 = 4294966995;
    }
    mach_msg_destroy(&msg);
  }
  return v7;
}

uint64_t wifi_manager_set_adaptive_roam_params(int a1, uint64_t a2, int a3)
{
  uint64_t v5 = a2;
  int v6 = 27918592;
  int v7 = a3;
  uint64_t v8 = *MEMORY[0x1E4F14068];
  int v9 = a3;
  *(void *)mach_msg_header_t msg = 0xAAAAAAAA80000013;
  *(_DWORD *)&msg[8] = a1;
  *(_OWORD *)&msg[12] = xmmword_1BF21A400;
  if (MEMORY[0x1E4F14B18]) {
    voucher_mach_msg_set((mach_msg_header_t *)msg);
  }
  return mach_msg((mach_msg_header_t *)msg, 2097153, 0x38u, 0, 0, 0, 0);
}

uint64_t wifi_manager_is_multi_band(int a1, _DWORD *a2)
{
  *(void *)&long long v4 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v4 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)&rcv_name_12[16] = v4;
  *(_OWORD *)&rcv_name_12[4] = v4;
  int rcv_name = -1431655766;
  mach_port_name_t special_reply_port = mig_get_special_reply_port();
  int rcv_name_4 = a1;
  mach_port_name_t rcv_name_8 = special_reply_port;
  int v10 = 5395;
  *(void *)rcv_name_12 = 0x110C900000000;
  if (MEMORY[0x1E4F14B18])
  {
    voucher_mach_msg_set((mach_msg_header_t *)&v10);
    mach_port_name_t special_reply_port = rcv_name_8;
  }
  uint64_t v6 = mach_msg((mach_msg_header_t *)&v10, 3162115, 0x18u, 0x30u, special_reply_port, 0, 0);
  uint64_t v7 = v6;
  if ((v6 - 268435458) > 0xE || ((1 << (v6 - 2)) & 0x4003) == 0)
  {
    if (!v6)
    {
      if (*(_DWORD *)&rcv_name_12[4] == 71)
      {
        uint64_t v7 = 4294966988;
      }
      else if (*(_DWORD *)&rcv_name_12[4] == 69933)
      {
        if ((v10 & 0x80000000) == 0)
        {
          if (rcv_name == 40)
          {
            if (!rcv_name_4)
            {
              uint64_t v7 = *(unsigned int *)&rcv_name_12[16];
              if (!*(_DWORD *)&rcv_name_12[16])
              {
                *a2 = *(_DWORD *)&rcv_name_12[20];
                return v7;
              }
              goto LABEL_22;
            }
          }
          else if (rcv_name == 36)
          {
            if (rcv_name_4) {
              BOOL v8 = 1;
            }
            else {
              BOOL v8 = *(_DWORD *)&rcv_name_12[16] == 0;
            }
            if (v8) {
              uint64_t v7 = 4294966996;
            }
            else {
              uint64_t v7 = *(unsigned int *)&rcv_name_12[16];
            }
            goto LABEL_22;
          }
        }
        uint64_t v7 = 4294966996;
      }
      else
      {
        uint64_t v7 = 4294966995;
      }
LABEL_22:
      mach_msg_destroy((mach_msg_header_t *)&v10);
      return v7;
    }
    mig_dealloc_special_reply_port();
  }
  return v7;
}

uint64_t wifi_manager_get_hardware_failure(int a1, _DWORD *a2)
{
  *(void *)&long long v4 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v4 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)&rcv_name_12[16] = v4;
  *(_OWORD *)&rcv_name_12[4] = v4;
  int rcv_name = -1431655766;
  mach_port_name_t special_reply_port = mig_get_special_reply_port();
  int rcv_name_4 = a1;
  mach_port_name_t rcv_name_8 = special_reply_port;
  int v10 = 5395;
  *(void *)rcv_name_12 = 0x110CA00000000;
  if (MEMORY[0x1E4F14B18])
  {
    voucher_mach_msg_set((mach_msg_header_t *)&v10);
    mach_port_name_t special_reply_port = rcv_name_8;
  }
  uint64_t v6 = mach_msg((mach_msg_header_t *)&v10, 3162115, 0x18u, 0x30u, special_reply_port, 0, 0);
  uint64_t v7 = v6;
  if ((v6 - 268435458) > 0xE || ((1 << (v6 - 2)) & 0x4003) == 0)
  {
    if (!v6)
    {
      if (*(_DWORD *)&rcv_name_12[4] == 71)
      {
        uint64_t v7 = 4294966988;
      }
      else if (*(_DWORD *)&rcv_name_12[4] == 69934)
      {
        if ((v10 & 0x80000000) == 0)
        {
          if (rcv_name == 40)
          {
            if (!rcv_name_4)
            {
              uint64_t v7 = *(unsigned int *)&rcv_name_12[16];
              if (!*(_DWORD *)&rcv_name_12[16])
              {
                *a2 = *(_DWORD *)&rcv_name_12[20];
                return v7;
              }
              goto LABEL_22;
            }
          }
          else if (rcv_name == 36)
          {
            if (rcv_name_4) {
              BOOL v8 = 1;
            }
            else {
              BOOL v8 = *(_DWORD *)&rcv_name_12[16] == 0;
            }
            if (v8) {
              uint64_t v7 = 4294966996;
            }
            else {
              uint64_t v7 = *(unsigned int *)&rcv_name_12[16];
            }
            goto LABEL_22;
          }
        }
        uint64_t v7 = 4294966996;
      }
      else
      {
        uint64_t v7 = 4294966995;
      }
LABEL_22:
      mach_msg_destroy((mach_msg_header_t *)&v10);
      return v7;
    }
    mig_dealloc_special_reply_port();
  }
  return v7;
}

uint64_t wifi_manager_reset_network_settings(mach_port_t a1)
{
  *(void *)&msg.msgh_bits = 0xAAAAAAAA00000013;
  msg.msgh_voucher_port = 0;
  msg.msgh_id = 69835;
  msg.mach_port_t msgh_remote_port = a1;
  msg.msgh_local_port = 0;
  if (MEMORY[0x1E4F14B18]) {
    voucher_mach_msg_set(&msg);
  }
  return mach_msg(&msg, 2097153, 0x18u, 0, 0, 0, 0);
}

uint64_t wifi_manager_purge_expired_known_networks(mach_port_t a1)
{
  *(void *)&msg.msgh_bits = 0xAAAAAAAA00000013;
  msg.msgh_voucher_port = 0;
  msg.msgh_id = 69836;
  msg.mach_port_t msgh_remote_port = a1;
  msg.msgh_local_port = 0;
  if (MEMORY[0x1E4F14B18]) {
    voucher_mach_msg_set(&msg);
  }
  return mach_msg(&msg, 2097153, 0x18u, 0, 0, 0, 0);
}

uint64_t wifi_manager_cleanup_log_buffer_files(mach_port_t a1)
{
  *(void *)&msg.msgh_bits = 0xAAAAAAAA00000013;
  msg.msgh_voucher_port = 0;
  msg.msgh_id = 69837;
  msg.mach_port_t msgh_remote_port = a1;
  msg.msgh_local_port = 0;
  if (MEMORY[0x1E4F14B18]) {
    voucher_mach_msg_set(&msg);
  }
  return mach_msg(&msg, 2097153, 0x18u, 0, 0, 0, 0);
}

uint64_t wifi_device_get_app_state(mach_port_t a1, uint64_t a2, int a3, int *a4)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  int v12 = 1;
  uint64_t v13 = a2;
  int v14 = 27918592;
  int v15 = a3;
  uint64_t v16 = *MEMORY[0x1E4F14068];
  int v17 = a3;
  mach_port_t special_reply_port = mig_get_special_reply_port();
  *(void *)&v11.msgh_bits = 0xAAAAAAAA80001513;
  v11.mach_port_t msgh_remote_port = a1;
  v11.msgh_local_port = special_reply_port;
  *(void *)&v11.msgh_voucher_port = 0x110CE00000000;
  if (MEMORY[0x1E4F14B18])
  {
    voucher_mach_msg_set(&v11);
    mach_port_t special_reply_port = v11.msgh_local_port;
  }
  uint64_t v7 = mach_msg(&v11, 3162115, 0x38u, 0x30u, special_reply_port, 0, 0);
  uint64_t v8 = v7;
  if ((v7 - 268435458) > 0xE || ((1 << (v7 - 2)) & 0x4003) == 0)
  {
    if (!v7)
    {
      if (v11.msgh_id == 71)
      {
        uint64_t v8 = 4294966988;
      }
      else if (v11.msgh_id == 69938)
      {
        if ((v11.msgh_bits & 0x80000000) == 0)
        {
          if (v11.msgh_size == 40)
          {
            if (!v11.msgh_remote_port)
            {
              uint64_t v8 = HIDWORD(v13);
              if (!HIDWORD(v13))
              {
                *a4 = v14;
                return v8;
              }
              goto LABEL_22;
            }
          }
          else if (v11.msgh_size == 36)
          {
            if (v11.msgh_remote_port) {
              BOOL v9 = 1;
            }
            else {
              BOOL v9 = HIDWORD(v13) == 0;
            }
            if (v9) {
              uint64_t v8 = 4294966996;
            }
            else {
              uint64_t v8 = HIDWORD(v13);
            }
            goto LABEL_22;
          }
        }
        uint64_t v8 = 4294966996;
      }
      else
      {
        uint64_t v8 = 4294966995;
      }
LABEL_22:
      mach_msg_destroy(&v11);
      return v8;
    }
    mig_dealloc_special_reply_port();
  }
  return v8;
}

uint64_t wifi_manager_wificall_handover_notification(int a1, int a2)
{
  *(void *)&long long v3 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v3 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)&msg[20] = v3;
  unint64_t v9 = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)&msg[4] = v3;
  *(void *)&msg[24] = *MEMORY[0x1E4F14068];
  *(_DWORD *)&msg[32] = a2;
  mach_port_name_t special_reply_port = mig_get_special_reply_port();
  *(_DWORD *)&msg[8] = a1;
  *(_DWORD *)&msg[12] = special_reply_port;
  *(_DWORD *)mach_msg_header_t msg = 5395;
  *(void *)&msg[16] = 0x110CF00000000;
  if (MEMORY[0x1E4F14B18])
  {
    voucher_mach_msg_set((mach_msg_header_t *)msg);
    mach_port_name_t special_reply_port = *(_DWORD *)&msg[12];
  }
  uint64_t v5 = mach_msg((mach_msg_header_t *)msg, 3162115, 0x24u, 0x2Cu, special_reply_port, 0, 0);
  uint64_t v6 = v5;
  if ((v5 - 268435458) > 0xE || ((1 << (v5 - 2)) & 0x4003) == 0)
  {
    if (v5)
    {
      mig_dealloc_special_reply_port();
      return v6;
    }
    if (*(_DWORD *)&msg[20] == 71)
    {
      uint64_t v6 = 4294966988;
    }
    else if (*(_DWORD *)&msg[20] == 69939)
    {
      uint64_t v6 = 4294966996;
      if ((*(_DWORD *)msg & 0x80000000) == 0 && *(_DWORD *)&msg[4] == 36 && !*(_DWORD *)&msg[8])
      {
        uint64_t v6 = *(unsigned int *)&msg[32];
        if (!*(_DWORD *)&msg[32]) {
          return v6;
        }
      }
    }
    else
    {
      uint64_t v6 = 4294966995;
    }
    mach_msg_destroy((mach_msg_header_t *)msg);
  }
  return v6;
}

uint64_t wifi_device_insert_missing_network_service(int a1, uint64_t a2, int a3)
{
  uint64_t v5 = a2;
  int v6 = 27918592;
  int v7 = a3;
  uint64_t v8 = *MEMORY[0x1E4F14068];
  int v9 = a3;
  *(void *)mach_msg_header_t msg = 0xAAAAAAAA80000013;
  *(_DWORD *)&msg[8] = a1;
  *(_OWORD *)&msg[12] = xmmword_1BF21A410;
  if (MEMORY[0x1E4F14B18]) {
    voucher_mach_msg_set((mach_msg_header_t *)msg);
  }
  return mach_msg((mach_msg_header_t *)msg, 2097153, 0x38u, 0, 0, 0, 0);
}

uint64_t wifi_manager_copy_movement_states(int a1, void *a2, _DWORD *a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  *(void *)&long long v6 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v6 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)&v13[12] = v6;
  *(_OWORD *)uint64_t v13 = v6;
  *(_OWORD *)&msg[20] = v6;
  *(_DWORD *)&msg[4] = -1431655766;
  mach_port_name_t special_reply_port = mig_get_special_reply_port();
  *(_DWORD *)&msg[8] = a1;
  *(_DWORD *)&msg[12] = special_reply_port;
  *(_DWORD *)mach_msg_header_t msg = 5395;
  *(void *)&msg[16] = 0x110D100000000;
  if (MEMORY[0x1E4F14B18])
  {
    voucher_mach_msg_set((mach_msg_header_t *)msg);
    mach_port_name_t special_reply_port = *(_DWORD *)&msg[12];
  }
  uint64_t v8 = mach_msg((mach_msg_header_t *)msg, 3162115, 0x18u, 0x40u, special_reply_port, 0, 0);
  uint64_t v9 = v8;
  if ((v8 - 268435458) > 0xE || ((1 << (v8 - 2)) & 0x4003) == 0)
  {
    if (!v8)
    {
      if (*(_DWORD *)&msg[20] == 71)
      {
        uint64_t v9 = 4294966988;
      }
      else if (*(_DWORD *)&msg[20] == 69941)
      {
        if ((*(_DWORD *)msg & 0x80000000) == 0)
        {
          if (*(_DWORD *)&msg[4] == 36)
          {
            uint64_t v9 = 4294966996;
            if (*(_DWORD *)&msg[32])
            {
              if (*(_DWORD *)&msg[8]) {
                uint64_t v9 = 4294966996;
              }
              else {
                uint64_t v9 = *(unsigned int *)&msg[32];
              }
            }
          }
          else
          {
            uint64_t v9 = 4294966996;
          }
          goto LABEL_24;
        }
        uint64_t v9 = 4294966996;
        if (*(_DWORD *)&msg[24] == 1 && *(_DWORD *)&msg[4] == 56 && !*(_DWORD *)&msg[8] && v13[3] == 1)
        {
          int v10 = *(_DWORD *)&v13[4];
          if (*(_DWORD *)&v13[4] == *(_DWORD *)&v13[16])
          {
            uint64_t v9 = 0;
            *a2 = *(void *)&msg[28];
            *a3 = v10;
            return v9;
          }
        }
      }
      else
      {
        uint64_t v9 = 4294966995;
      }
LABEL_24:
      mach_msg_destroy((mach_msg_header_t *)msg);
      return v9;
    }
    mig_dealloc_special_reply_port();
  }
  return v9;
}

uint64_t wifi_manager_set_simulated_movement_states(mach_port_t a1, uint64_t a2, int a3)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  int v9 = 1;
  uint64_t v10 = a2;
  int v11 = 27918592;
  int v12 = a3;
  uint64_t v13 = *MEMORY[0x1E4F14068];
  int v14 = a3;
  mach_port_t special_reply_port = mig_get_special_reply_port();
  *(void *)&v8.msgh_bits = 0xAAAAAAAA80001513;
  v8.mach_port_t msgh_remote_port = a1;
  v8.msgh_local_port = special_reply_port;
  *(void *)&v8.msgh_voucher_port = 0x110D200000000;
  if (MEMORY[0x1E4F14B18])
  {
    voucher_mach_msg_set(&v8);
    mach_port_t special_reply_port = v8.msgh_local_port;
  }
  uint64_t v5 = mach_msg(&v8, 3162115, 0x38u, 0x2Cu, special_reply_port, 0, 0);
  uint64_t v6 = v5;
  if ((v5 - 268435458) > 0xE || ((1 << (v5 - 2)) & 0x4003) == 0)
  {
    if (v5)
    {
      mig_dealloc_special_reply_port();
      return v6;
    }
    if (v8.msgh_id == 71)
    {
      uint64_t v6 = 4294966988;
    }
    else if (v8.msgh_id == 69942)
    {
      uint64_t v6 = 4294966996;
      if ((v8.msgh_bits & 0x80000000) == 0 && *(void *)&v8.msgh_size == 36)
      {
        uint64_t v6 = HIDWORD(v10);
        if (!HIDWORD(v10)) {
          return v6;
        }
      }
    }
    else
    {
      uint64_t v6 = 4294966995;
    }
    mach_msg_destroy(&v8);
  }
  return v6;
}

uint64_t wifi_manager_set_battery_save_mode(mach_port_t a1, int a2)
{
  uint64_t v4 = *MEMORY[0x1E4F14068];
  int v5 = a2;
  *(void *)&msg.msgh_bits = 0xAAAAAAAA00000013;
  msg.msgh_voucher_port = 0;
  msg.msgh_id = 69843;
  msg.mach_port_t msgh_remote_port = a1;
  msg.msgh_local_port = 0;
  if (MEMORY[0x1E4F14B18]) {
    voucher_mach_msg_set(&msg);
  }
  return mach_msg(&msg, 2097153, 0x24u, 0, 0, 0, 0);
}

uint64_t wifi_manager_get_battery_save_mode(int a1, _DWORD *a2)
{
  *(void *)&long long v4 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v4 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)&rcv_name_12[16] = v4;
  *(_OWORD *)&rcv_name_12[4] = v4;
  int rcv_name = -1431655766;
  mach_port_name_t special_reply_port = mig_get_special_reply_port();
  int rcv_name_4 = a1;
  mach_port_name_t rcv_name_8 = special_reply_port;
  int v10 = 5395;
  *(void *)rcv_name_12 = 0x110D400000000;
  if (MEMORY[0x1E4F14B18])
  {
    voucher_mach_msg_set((mach_msg_header_t *)&v10);
    mach_port_name_t special_reply_port = rcv_name_8;
  }
  uint64_t v6 = mach_msg((mach_msg_header_t *)&v10, 3162115, 0x18u, 0x30u, special_reply_port, 0, 0);
  uint64_t v7 = v6;
  if ((v6 - 268435458) > 0xE || ((1 << (v6 - 2)) & 0x4003) == 0)
  {
    if (!v6)
    {
      if (*(_DWORD *)&rcv_name_12[4] == 71)
      {
        uint64_t v7 = 4294966988;
      }
      else if (*(_DWORD *)&rcv_name_12[4] == 69944)
      {
        if ((v10 & 0x80000000) == 0)
        {
          if (rcv_name == 40)
          {
            if (!rcv_name_4)
            {
              uint64_t v7 = *(unsigned int *)&rcv_name_12[16];
              if (!*(_DWORD *)&rcv_name_12[16])
              {
                *a2 = *(_DWORD *)&rcv_name_12[20];
                return v7;
              }
              goto LABEL_22;
            }
          }
          else if (rcv_name == 36)
          {
            if (rcv_name_4) {
              BOOL v8 = 1;
            }
            else {
              BOOL v8 = *(_DWORD *)&rcv_name_12[16] == 0;
            }
            if (v8) {
              uint64_t v7 = 4294966996;
            }
            else {
              uint64_t v7 = *(unsigned int *)&rcv_name_12[16];
            }
            goto LABEL_22;
          }
        }
        uint64_t v7 = 4294966996;
      }
      else
      {
        uint64_t v7 = 4294966995;
      }
LABEL_22:
      mach_msg_destroy((mach_msg_header_t *)&v10);
      return v7;
    }
    mig_dealloc_special_reply_port();
  }
  return v7;
}

uint64_t wifi_manager_initiate_network_transition(int a1, uint64_t a2, int a3)
{
  uint64_t v5 = a2;
  int v6 = 27918592;
  int v7 = a3;
  uint64_t v8 = *MEMORY[0x1E4F14068];
  int v9 = a3;
  *(void *)mach_msg_header_t msg = 0xAAAAAAAA80000013;
  *(_DWORD *)&msg[8] = a1;
  *(_OWORD *)&msg[12] = xmmword_1BF21A420;
  if (MEMORY[0x1E4F14B18]) {
    voucher_mach_msg_set((mach_msg_header_t *)msg);
  }
  return mach_msg((mach_msg_header_t *)msg, 2097153, 0x38u, 0, 0, 0, 0);
}

void __WiFiPolicyRelease_cold_1()
{
}

void __WiFiPolicyRelease_cold_2()
{
  __assert_rtn("__WiFiPolicyRelease", "WiFiPolicy.c", 200, "CFGetTypeID(object) == WiFiPolicyGetTypeID()");
}

void _WiFiCopyUnserialized_cold_1()
{
  uint64_t v1 = *MEMORY[0x1E4F143B8];
  v0[0] = 136315394;
  OUTLINED_FUNCTION_0();
  _os_log_error_impl(&dword_1BF1E6000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%s: CFPropertyListCreateWithData returned with error %@", (uint8_t *)v0, 0x16u);
}

void _WiFiCopyUnserialized_cold_2()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136315138;
  uint64_t v1 = "_WiFiCopyUnserialized";
  _os_log_error_impl(&dword_1BF1E6000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%s: Invalid buffer/buffersize.", (uint8_t *)&v0, 0xCu);
}

void _CFPropertyListCreateBinaryData_cold_1()
{
  uint64_t v1 = *MEMORY[0x1E4F143B8];
  v0[0] = 136315394;
  OUTLINED_FUNCTION_0();
  _os_log_error_impl(&dword_1BF1E6000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%s: CFPropertyListWrite returned with error %@", (uint8_t *)v0, 0x16u);
}

void WiFiManagerClientCreate_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void WiFiManagerClientCreate_cold_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void WiFiManagerClientCreate_cold_3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void WiFiManagerClientCreate_cold_4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __WiFiManagerClientServerTerminationCallback_cold_1()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2();
  _os_log_error_impl(v0, v1, v2, v3, v4, 0x12u);
}

void WiFiManagerClientGetDevice_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2();
  _os_log_error_impl(v0, v1, v2, v3, v4, 0x20u);
}

void __WiFiManagerClientAddDevice_cold_1()
{
  uint64_t v1 = *MEMORY[0x1E4F143B8];
  v0[0] = 136315394;
  OUTLINED_FUNCTION_1();
  _os_log_debug_impl(&dword_1BF1E6000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "%s: delaying attach callback for %@", (uint8_t *)v0, 0x16u);
}

void WiFiManagerClientDispatchAttachmentEvent_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2();
  _os_log_error_impl(v0, v1, v2, v3, v4, 0x26u);
}

void __WiFiManagerClientAvailableCallback_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __WiFiManagerClientAvailableCallback_cold_2()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2();
  _os_log_error_impl(v0, v1, v2, v3, v4, 0x18u);
}

void __WiFiManagerClientAvailableCallback_cold_3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void WiFiManagerClientUnscheduleFromRunLoop_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __WiFiManagerClientGetOrReconnectServerPort_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __WiFiManagerClientGetOrReconnectServerPort_cold_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __WiFiManagerClientGetOrReconnectServerPort_cold_3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __WiFiManagerClientGetOrReconnectServerPort_cold_4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __WiFiManagerClientGetOrReconnectServerPort_cold_5(uint8_t *buf, void *a2)
{
  *(_DWORD *)buf = 136315138;
  *a2 = "__WiFiManagerClientGetOrReconnectServerPort";
  _os_log_debug_impl(&dword_1BF1E6000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "%s: invoking delayed attach callback", buf, 0xCu);
}

void __WiFiManagerClientGetOrReconnectServerPort_cold_6(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __WiFiManagerClientGetOrReconnectServerPort_cold_7(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void WiFiDeviceClientCopyCurrentNetwork_cold_1(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  if (a1) {
    int v1 = *(_DWORD *)(a1 + 16);
  }
  else {
    int v1 = -1;
  }
  int v2 = 136315394;
  long long v3 = "__WiFiDeviceClientCopyCurrentNetworkLegacy";
  __int16 v4 = 1024;
  int v5 = v1;
  _os_log_error_impl(&dword_1BF1E6000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%s: server port [%d]", (uint8_t *)&v2, 0x12u);
}

void _WiFiDeviceClientDispatchVirtInterfaceStateChangeEvent_cold_1(const void *a1)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  int v1 = 136315394;
  int v2 = "_WiFiDeviceClientDispatchVirtInterfaceStateChangeEvent";
  __int16 v3 = 2048;
  CFTypeID v4 = CFGetTypeID(a1);
  _os_log_error_impl(&dword_1BF1E6000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%s: bad type %ld detected for APPLE80211KEY_STATE_CHANGED_IS_LINKDOWN", (uint8_t *)&v1, 0x16u);
}

void _WiFiDeviceClientDispatchVirtInterfaceStateChangeEvent_cold_2(uint64_t a1)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  int v1 = 136315394;
  int v2 = "_WiFiDeviceClientDispatchVirtInterfaceStateChangeEvent";
  __int16 v3 = 2112;
  uint64_t v4 = a1;
  _os_log_error_impl(&dword_1BF1E6000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%s: unexpected type for payload %@", (uint8_t *)&v1, 0x16u);
}

void WiFiDeviceClientSetWiFiDirect_cold_1()
{
}

void _WiFiDeviceClientDispatchStartNetworkResult_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void _WiFiDeviceClientDispatchStopNetworkResult_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void _WiFiDeviceClientDispatchAutoJoinNotification_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void _WiFiDeviceClientDispatchUserJoinNotification_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void WiFiNetworkSetStateWithReason_cold_1(const void *a1, char a2, uint64_t a3)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  CFStringRef SSID = WiFiNetworkGetSSID(a1);
  uint64_t v6 = "enabled";
  int v7 = 136315906;
  uint64_t v8 = "WiFiNetworkSetStateWithReason";
  int v10 = SSID;
  __int16 v9 = 2112;
  __int16 v11 = 2080;
  if (!a2) {
    uint64_t v6 = "disabled";
  }
  int v12 = v6;
  __int16 v13 = 2112;
  uint64_t v14 = a3;
  _os_log_error_impl(&dword_1BF1E6000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%s: Network '%@' %s for auto-join due to %@", (uint8_t *)&v7, 0x2Au);
}

void WiFiNetworkCreateCoreWiFiNetworkProfile_cold_1()
{
  int v0 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(NSString, "stringWithUTF8String:", "CLLocationCoordinate2D soft_CLLocationCoordinate2DMake(CLLocationDegrees, CLLocationDegrees)"), @"WiFiNetwork.c", 51, @"%s", dlerror());
  __break(1u);
}

void getCWFScanResultPropertyOSSpecificAttributesKey_cold_1()
{
  int v0 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(NSString, "stringWithUTF8String:", "NSString *getCWFScanResultPropertyOSSpecificAttributesKey(void)"), @"WiFiNetwork.c", 39, @"%s", dlerror());
  __break(1u);
}

void __getCWFNetworkProfileClass_block_invoke_cold_1()
{
  int v0 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(NSString, "stringWithUTF8String:", "Class getCWFNetworkProfileClass(void)_block_invoke"), @"WiFiNetwork.c", 35, @"Unable to find class %s", "CWFNetworkProfile");
  __break(1u);
}

void CoreWiFiLibrary_cold_1(void *a1)
{
  int v2 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(NSString, "stringWithUTF8String:", "void *CoreWiFiLibrary(void)"), @"WiFiNetwork.c", 34, @"%s", *a1);
  __break(1u);
}

void __getCWFBSSClass_block_invoke_cold_1()
{
  int v0 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(NSString, "stringWithUTF8String:", "Class getCWFBSSClass(void)_block_invoke"), @"WiFiNetwork.c", 43, @"Unable to find class %s", "CWFBSS");
  __break(1u);
}

void __getCWFChannelClass_block_invoke_cold_1()
{
  int v0 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(NSString, "stringWithUTF8String:", "Class getCWFChannelClass(void)_block_invoke"), @"WiFiNetwork.c", 41, @"Unable to find class %s", "CWFChannel");
  __break(1u);
}

void __getCLLocationClass_block_invoke_cold_1()
{
  int v0 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(NSString, "stringWithUTF8String:", "Class getCLLocationClass(void)_block_invoke"), @"WiFiNetwork.c", 47, @"Unable to find class %s", "CLLocation");
  __break(1u);
}

void CoreLocationLibrary_cold_1(void *a1)
{
  int v2 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(NSString, "stringWithUTF8String:", "void *CoreLocationLibrary(void)"), @"WiFiNetwork.c", 46, @"%s", *a1);
  __break(1u);
}

void __getCWFScanResultClass_block_invoke_cold_1()
{
  int v0 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(NSString, "stringWithUTF8String:", "Class getCWFScanResultClass(void)_block_invoke"), @"WiFiNetwork.c", 37, @"Unable to find class %s", "CWFScanResult");
  __break(1u);
}

void __getSFPasswordSharingServiceClass_block_invoke_cold_1(void *a1)
{
  int v2 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(NSString, "stringWithUTF8String:", "void *SharingLibrary(void)"), @"WiFiPasswordSharingSimulator.m", 13, @"%s", *a1);
  __break(1u);
}

void __getSFPasswordSharingServiceClass_block_invoke_cold_2()
{
  int v0 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(NSString, "stringWithUTF8String:", "Class getSFPasswordSharingServiceClass(void)_block_invoke"), @"WiFiPasswordSharingSimulator.m", 14, @"Unable to find class %s", "SFPasswordSharingService");
  __break(1u);
  Apple80211CopyLeakyAPStatus();
}

uint64_t Apple80211CopyLeakyAPStatus()
{
  return MEMORY[0x1F41247A8]();
}

uint64_t Apple80211ParseWPAPassword()
{
  return MEMORY[0x1F4124808]();
}

void CCHmac(CCHmacAlgorithm algorithm, const void *key, size_t keyLength, const void *data, size_t dataLength, void *macOut)
{
}

int CC_SHA256_Final(unsigned __int8 *md, CC_SHA256_CTX *c)
{
  return MEMORY[0x1F40C9778](md, c);
}

int CC_SHA256_Init(CC_SHA256_CTX *c)
{
  return MEMORY[0x1F40C9780](c);
}

int CC_SHA256_Update(CC_SHA256_CTX *c, const void *data, CC_LONG len)
{
  return MEMORY[0x1F40C9788](c, data, *(void *)&len);
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  MEMORY[0x1F40D70A8]();
  return result;
}

void *__cdecl CFAllocatorAllocate(CFAllocatorRef allocator, CFIndex size, CFOptionFlags hint)
{
  return (void *)MEMORY[0x1F40D70E8](allocator, size, hint);
}

void CFAllocatorDeallocate(CFAllocatorRef allocator, void *ptr)
{
}

CFAllocatorRef CFAllocatorGetDefault(void)
{
  return (CFAllocatorRef)MEMORY[0x1F40D7110]();
}

void CFArrayAppendValue(CFMutableArrayRef theArray, const void *value)
{
}

void CFArrayApplyFunction(CFArrayRef theArray, CFRange range, CFArrayApplierFunction applier, void *context)
{
}

Boolean CFArrayContainsValue(CFArrayRef theArray, CFRange range, const void *value)
{
  return MEMORY[0x1F40D7160](theArray, range.location, range.length, value);
}

CFArrayRef CFArrayCreate(CFAllocatorRef allocator, const void **values, CFIndex numValues, const CFArrayCallBacks *callBacks)
{
  return (CFArrayRef)MEMORY[0x1F40D7170](allocator, values, numValues, callBacks);
}

CFMutableArrayRef CFArrayCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFArrayCallBacks *callBacks)
{
  return (CFMutableArrayRef)MEMORY[0x1F40D7190](allocator, capacity, callBacks);
}

CFMutableArrayRef CFArrayCreateMutableCopy(CFAllocatorRef allocator, CFIndex capacity, CFArrayRef theArray)
{
  return (CFMutableArrayRef)MEMORY[0x1F40D7198](allocator, capacity, theArray);
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x1F40D71B8](theArray);
}

CFIndex CFArrayGetFirstIndexOfValue(CFArrayRef theArray, CFRange range, const void *value)
{
  return MEMORY[0x1F40D71C8](theArray, range.location, range.length, value);
}

CFTypeID CFArrayGetTypeID(void)
{
  return MEMORY[0x1F40D71D8]();
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return (const void *)MEMORY[0x1F40D71F0](theArray, idx);
}

void CFArrayInsertValueAtIndex(CFMutableArrayRef theArray, CFIndex idx, const void *value)
{
}

void CFArrayRemoveValueAtIndex(CFMutableArrayRef theArray, CFIndex idx)
{
}

void CFArraySetValueAtIndex(CFMutableArrayRef theArray, CFIndex idx, const void *value)
{
}

CFTypeID CFBooleanGetTypeID(void)
{
  return MEMORY[0x1F40D7420]();
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return MEMORY[0x1F40D7430](BOOLean);
}

void CFDataAppendBytes(CFMutableDataRef theData, const UInt8 *bytes, CFIndex length)
{
}

CFDataRef CFDataCreate(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length)
{
  return (CFDataRef)MEMORY[0x1F40D77E8](allocator, bytes, length);
}

CFMutableDataRef CFDataCreateMutable(CFAllocatorRef allocator, CFIndex capacity)
{
  return (CFMutableDataRef)MEMORY[0x1F40D7808](allocator, capacity);
}

CFDataRef CFDataCreateWithBytesNoCopy(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length, CFAllocatorRef bytesDeallocator)
{
  return (CFDataRef)MEMORY[0x1F40D7818](allocator, bytes, length, bytesDeallocator);
}

const UInt8 *__cdecl CFDataGetBytePtr(CFDataRef theData)
{
  return (const UInt8 *)MEMORY[0x1F40D7830](theData);
}

void CFDataGetBytes(CFDataRef theData, CFRange range, UInt8 *buffer)
{
}

CFIndex CFDataGetLength(CFDataRef theData)
{
  return MEMORY[0x1F40D7850](theData);
}

UInt8 *__cdecl CFDataGetMutableBytePtr(CFMutableDataRef theData)
{
  return (UInt8 *)MEMORY[0x1F40D7858](theData);
}

CFTypeID CFDataGetTypeID(void)
{
  return MEMORY[0x1F40D7860]();
}

CFComparisonResult CFDateCompare(CFDateRef theDate, CFDateRef otherDate, void *context)
{
  return MEMORY[0x1F40D7888](theDate, otherDate, context);
}

CFDateRef CFDateCreate(CFAllocatorRef allocator, CFAbsoluteTime at)
{
  return (CFDateRef)MEMORY[0x1F40D7898](allocator, at);
}

CFAbsoluteTime CFDateGetAbsoluteTime(CFDateRef theDate)
{
  MEMORY[0x1F40D7928](theDate);
  return result;
}

CFTimeInterval CFDateGetTimeIntervalSinceDate(CFDateRef theDate, CFDateRef otherDate)
{
  MEMORY[0x1F40D7930](theDate, otherDate);
  return result;
}

void CFDictionaryAddValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

void CFDictionaryApplyFunction(CFDictionaryRef theDict, CFDictionaryApplierFunction applier, void *context)
{
}

Boolean CFDictionaryContainsKey(CFDictionaryRef theDict, const void *key)
{
  return MEMORY[0x1F40D7968](theDict, key);
}

CFDictionaryRef CFDictionaryCreate(CFAllocatorRef allocator, const void **keys, const void **values, CFIndex numValues, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFDictionaryRef)MEMORY[0x1F40D7978](allocator, keys, values, numValues, keyCallBacks, valueCallBacks);
}

CFDictionaryRef CFDictionaryCreateCopy(CFAllocatorRef allocator, CFDictionaryRef theDict)
{
  return (CFDictionaryRef)MEMORY[0x1F40D7990](allocator, theDict);
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x1F40D7998](allocator, capacity, keyCallBacks, valueCallBacks);
}

CFMutableDictionaryRef CFDictionaryCreateMutableCopy(CFAllocatorRef allocator, CFIndex capacity, CFDictionaryRef theDict)
{
  return (CFMutableDictionaryRef)MEMORY[0x1F40D79A8](allocator, capacity, theDict);
}

CFIndex CFDictionaryGetCount(CFDictionaryRef theDict)
{
  return MEMORY[0x1F40D79C0](theDict);
}

void CFDictionaryGetKeysAndValues(CFDictionaryRef theDict, const void **keys, const void **values)
{
}

CFTypeID CFDictionaryGetTypeID(void)
{
  return MEMORY[0x1F40D7A00]();
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x1F40D7A10](theDict, key);
}

Boolean CFDictionaryGetValueIfPresent(CFDictionaryRef theDict, const void *key, const void **value)
{
  return MEMORY[0x1F40D7A18](theDict, key, value);
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

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return MEMORY[0x1F40D7A68](cf1, cf2);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x1F40D7B80](cf);
}

CFHashCode CFHash(CFTypeRef cf)
{
  return MEMORY[0x1F40D7BA0](cf);
}

CFMachPortRef CFMachPortCreate(CFAllocatorRef allocator, CFMachPortCallBack callout, CFMachPortContext *context, Boolean *shouldFreeInfo)
{
  return (CFMachPortRef)MEMORY[0x1F40D7C58](allocator, callout, context, shouldFreeInfo);
}

CFRunLoopSourceRef CFMachPortCreateRunLoopSource(CFAllocatorRef allocator, CFMachPortRef port, CFIndex order)
{
  return (CFRunLoopSourceRef)MEMORY[0x1F40D7C60](allocator, port, order);
}

void CFMachPortInvalidate(CFMachPortRef port)
{
}

CFNumberRef CFNumberCreate(CFAllocatorRef allocator, CFNumberType theType, const void *valuePtr)
{
  return (CFNumberRef)MEMORY[0x1F40D7D80](allocator, theType, valuePtr);
}

CFTypeID CFNumberGetTypeID(void)
{
  return MEMORY[0x1F40D7E10]();
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return MEMORY[0x1F40D7E20](number, theType, valuePtr);
}

CFPropertyListRef CFPropertyListCreateWithData(CFAllocatorRef allocator, CFDataRef data, CFOptionFlags options, CFPropertyListFormat *format, CFErrorRef *error)
{
  return (CFPropertyListRef)MEMORY[0x1F40D7F50](allocator, data, options, format, error);
}

CFIndex CFPropertyListWrite(CFPropertyListRef propertyList, CFWriteStreamRef stream, CFPropertyListFormat format, CFOptionFlags options, CFErrorRef *error)
{
  return MEMORY[0x1F40D7F70](propertyList, stream, format, options, error);
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x1F40D8048](cf);
}

void CFRunLoopAddSource(CFRunLoopRef rl, CFRunLoopSourceRef source, CFRunLoopMode mode)
{
}

void CFRunLoopPerformBlock(CFRunLoopRef rl, CFTypeRef mode, void *block)
{
}

void CFRunLoopRemoveSource(CFRunLoopRef rl, CFRunLoopSourceRef source, CFRunLoopMode mode)
{
}

void CFRunLoopWakeUp(CFRunLoopRef rl)
{
}

void CFSetAddValue(CFMutableSetRef theSet, const void *value)
{
}

void CFSetApplyFunction(CFSetRef theSet, CFSetApplierFunction applier, void *context)
{
}

Boolean CFSetContainsValue(CFSetRef theSet, const void *value)
{
  return MEMORY[0x1F40D81F8](theSet, value);
}

CFSetRef CFSetCreate(CFAllocatorRef allocator, const void **values, CFIndex numValues, const CFSetCallBacks *callBacks)
{
  return (CFSetRef)MEMORY[0x1F40D8200](allocator, values, numValues, callBacks);
}

CFMutableSetRef CFSetCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFSetCallBacks *callBacks)
{
  return (CFMutableSetRef)MEMORY[0x1F40D8210](allocator, capacity, callBacks);
}

void CFStringAppend(CFMutableStringRef theString, CFStringRef appendedString)
{
}

void CFStringAppendFormat(CFMutableStringRef theString, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
}

CFComparisonResult CFStringCompare(CFStringRef theString1, CFStringRef theString2, CFStringCompareFlags compareOptions)
{
  return MEMORY[0x1F40D8388](theString1, theString2, compareOptions);
}

CFArrayRef CFStringCreateArrayBySeparatingStrings(CFAllocatorRef alloc, CFStringRef theString, CFStringRef separatorString)
{
  return (CFArrayRef)MEMORY[0x1F40D83D0](alloc, theString, separatorString);
}

CFDataRef CFStringCreateExternalRepresentation(CFAllocatorRef alloc, CFStringRef theString, CFStringEncoding encoding, UInt8 lossByte)
{
  return (CFDataRef)MEMORY[0x1F40D83F8](alloc, theString, *(void *)&encoding, lossByte);
}

CFStringRef CFStringCreateFromExternalRepresentation(CFAllocatorRef alloc, CFDataRef data, CFStringEncoding encoding)
{
  return (CFStringRef)MEMORY[0x1F40D8400](alloc, data, *(void *)&encoding);
}

CFMutableStringRef CFStringCreateMutable(CFAllocatorRef alloc, CFIndex maxLength)
{
  return (CFMutableStringRef)MEMORY[0x1F40D8408](alloc, maxLength);
}

CFStringRef CFStringCreateWithCString(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding)
{
  return (CFStringRef)MEMORY[0x1F40D8448](alloc, cStr, *(void *)&encoding);
}

CFStringRef CFStringCreateWithFormat(CFAllocatorRef alloc, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
  return (CFStringRef)MEMORY[0x1F40D8490](alloc, formatOptions, format);
}

CFRange CFStringFind(CFStringRef theString, CFStringRef stringToFind, CFStringCompareFlags compareOptions)
{
  CFIndex v3 = MEMORY[0x1F40D84C8](theString, stringToFind, compareOptions);
  result.length = v4;
  result.location = v3;
  return result;
}

Boolean CFStringGetCString(CFStringRef theString, char *buffer, CFIndex bufferSize, CFStringEncoding encoding)
{
  return MEMORY[0x1F40D8510](theString, buffer, bufferSize, *(void *)&encoding);
}

const char *__cdecl CFStringGetCStringPtr(CFStringRef theString, CFStringEncoding encoding)
{
  return (const char *)MEMORY[0x1F40D8520](theString, *(void *)&encoding);
}

CFIndex CFStringGetLength(CFStringRef theString)
{
  return MEMORY[0x1F40D8578](theString);
}

CFStringEncoding CFStringGetSystemEncoding(void)
{
  return MEMORY[0x1F40D85E0]();
}

CFTypeID CFStringGetTypeID(void)
{
  return MEMORY[0x1F40D85F0]();
}

Boolean CFStringHasPrefix(CFStringRef theString, CFStringRef prefix)
{
  return MEMORY[0x1F40D8600](theString, prefix);
}

Boolean CFStringHasSuffix(CFStringRef theString, CFStringRef suffix)
{
  return MEMORY[0x1F40D8608](theString, suffix);
}

CFUUIDRef CFUUIDCreate(CFAllocatorRef alloc)
{
  return (CFUUIDRef)MEMORY[0x1F40D8988](alloc);
}

CFStringRef CFUUIDCreateString(CFAllocatorRef alloc, CFUUIDRef uuid)
{
  return (CFStringRef)MEMORY[0x1F40D89B0](alloc, uuid);
}

void CFWriteStreamClose(CFWriteStreamRef stream)
{
}

CFTypeRef CFWriteStreamCopyProperty(CFWriteStreamRef stream, CFStreamPropertyKey propertyName)
{
  return (CFTypeRef)MEMORY[0x1F40D8A90](stream, propertyName);
}

CFWriteStreamRef CFWriteStreamCreateWithAllocatedBuffers(CFAllocatorRef alloc, CFAllocatorRef bufferAllocator)
{
  return (CFWriteStreamRef)MEMORY[0x1F40D8AA0](alloc, bufferAllocator);
}

Boolean CFWriteStreamOpen(CFWriteStreamRef stream)
{
  return MEMORY[0x1F40D8AD0](stream);
}

uint64_t CWFCorrectEthernetAddressString()
{
  return MEMORY[0x1F4116DB0]();
}

uint64_t EAPTLSRemoveTrustExceptionsBindings()
{
  return MEMORY[0x1F41177A0]();
}

kern_return_t IOMasterPort(mach_port_t bootstrapPort, mach_port_t *mainPort)
{
  return MEMORY[0x1F40E8F00](*(void *)&bootstrapPort, mainPort);
}

kern_return_t IOObjectRelease(io_object_t object)
{
  return MEMORY[0x1F40E8F60](*(void *)&object);
}

CFTypeRef IORegistryEntrySearchCFProperty(io_registry_entry_t entry, const io_name_t plane, CFStringRef key, CFAllocatorRef allocator, IOOptionBits options)
{
  return (CFTypeRef)MEMORY[0x1F40E9208](*(void *)&entry, plane, key, allocator, *(void *)&options);
}

io_service_t IOServiceGetMatchingService(mach_port_t mainPort, CFDictionaryRef matching)
{
  return MEMORY[0x1F40E9250](*(void *)&mainPort, matching);
}

CFMutableDictionaryRef IOServiceMatching(const char *name)
{
  return (CFMutableDictionaryRef)MEMORY[0x1F40E9268](name);
}

uint64_t MGGetProductType()
{
  return MEMORY[0x1F417CE18]();
}

uint64_t MKBGetDeviceLockState()
{
  return MEMORY[0x1F412F980]();
}

uint64_t MKBUserUnlockedSinceBoot()
{
  return MEMORY[0x1F412FA20]();
}

void NSLog(NSString *format, ...)
{
}

int SCError(void)
{
  return MEMORY[0x1F4101E20]();
}

const char *__cdecl SCErrorString(int status)
{
  return (const char *)MEMORY[0x1F4101E28](*(void *)&status);
}

uint64_t SCLog()
{
  return MEMORY[0x1F4101E30]();
}

Boolean SCPreferencesApplyChanges(SCPreferencesRef prefs)
{
  return MEMORY[0x1F4101FE8](prefs);
}

Boolean SCPreferencesCommitChanges(SCPreferencesRef prefs)
{
  return MEMORY[0x1F4101FF0](prefs);
}

Boolean SCPreferencesLock(SCPreferencesRef prefs, Boolean wait)
{
  return MEMORY[0x1F4102018](prefs, wait);
}

void SCPreferencesSynchronize(SCPreferencesRef prefs)
{
}

Boolean SCPreferencesUnlock(SCPreferencesRef prefs)
{
  return MEMORY[0x1F4102068](prefs);
}

OSStatus SecItemAdd(CFDictionaryRef attributes, CFTypeRef *result)
{
  return MEMORY[0x1F40F6DD8](attributes, result);
}

OSStatus SecItemCopyMatching(CFDictionaryRef query, CFTypeRef *result)
{
  return MEMORY[0x1F40F6DE0](query, result);
}

OSStatus SecItemDelete(CFDictionaryRef query)
{
  return MEMORY[0x1F40F6DE8](query);
}

OSStatus SecItemUpdate(CFDictionaryRef query, CFDictionaryRef attributesToUpdate)
{
  return MEMORY[0x1F40F6E20](query, attributesToUpdate);
}

int SecRandomCopyBytes(SecRandomRef rnd, size_t count, void *bytes)
{
  return MEMORY[0x1F40F70F0](rnd, count, bytes);
}

CFTypeRef SecTaskCopyValueForEntitlement(SecTaskRef task, CFStringRef entitlement, CFErrorRef *error)
{
  return (CFTypeRef)MEMORY[0x1F40F7138](task, entitlement, error);
}

SecTaskRef SecTaskCreateFromSelf(CFAllocatorRef allocator)
{
  return (SecTaskRef)MEMORY[0x1F40F7160](allocator);
}

void _Block_object_assign(void *a1, const void *a2, const int a3)
{
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

uint64_t _CFRuntimeCreateInstance()
{
  return MEMORY[0x1F40D90D0]();
}

uint64_t _CFRuntimeRegisterClass()
{
  return MEMORY[0x1F40D90E8]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
}

int *__error(void)
{
  return (int *)MEMORY[0x1F40C9B88]();
}

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x1F40C9FB0]();
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
  return MEMORY[0x1F415B160]();
}

kern_return_t bootstrap_look_up(mach_port_t bp, const name_t service_name, mach_port_t *sp)
{
  return MEMORY[0x1F40CA548](*(void *)&bp, service_name, sp);
}

void bzero(void *a1, size_t a2)
{
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_async_f(dispatch_queue_t queue, void *context, dispatch_function_t work)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x1F40CBA60](identifier, flags);
}

uint64_t dispatch_mach_create_f()
{
  return MEMORY[0x1F40CBB50]();
}

uint64_t dispatch_mach_mig_demux()
{
  return MEMORY[0x1F40CBB58]();
}

uint64_t dispatch_mach_msg_get_msg()
{
  return MEMORY[0x1F40CBB68]();
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1F40CBBC0](label, attr);
}

void dispatch_release(dispatch_object_t object)
{
}

void dispatch_retain(dispatch_object_t object)
{
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x1F40CBC30](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x1F40CBC40](dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x1F40CBC50](dsema, timeout);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x1F40CBD30](when, delta);
}

char *dlerror(void)
{
  return (char *)MEMORY[0x1F40CBDB0]();
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x1F40CBDC8](__handle, __symbol);
}

ether_addr *__cdecl ether_aton(const char *a1)
{
  return (ether_addr *)MEMORY[0x1F40CBF70](a1);
}

char *__cdecl ether_ntoa(const ether_addr *a1)
{
  return (char *)MEMORY[0x1F40CBF78](a1);
}

void free(void *a1)
{
}

pid_t getpid(void)
{
  return MEMORY[0x1F40CC4A0]();
}

const char *getprogname(void)
{
  return (const char *)MEMORY[0x1F40CC4C0]();
}

int gettimeofday(timeval *a1, void *a2)
{
  return MEMORY[0x1F40CC568](a1, a2);
}

uint64_t kdebug_trace()
{
  return MEMORY[0x1F40CC700]();
}

mach_msg_return_t mach_msg(mach_msg_header_t *msg, mach_msg_option_t option, mach_msg_size_t send_size, mach_msg_size_t rcv_size, mach_port_name_t rcv_name, mach_msg_timeout_t timeout, mach_port_name_t notify)
{
  return MEMORY[0x1F40CC970](msg, *(void *)&option, *(void *)&send_size, *(void *)&rcv_size, *(void *)&rcv_name, *(void *)&timeout, *(void *)&notify);
}

void mach_msg_destroy(mach_msg_header_t *a1)
{
}

kern_return_t mach_port_allocate(ipc_space_t task, mach_port_right_t right, mach_port_name_t *name)
{
  return MEMORY[0x1F40CC9A0](*(void *)&task, *(void *)&right, name);
}

kern_return_t mach_port_deallocate(ipc_space_t task, mach_port_name_t name)
{
  return MEMORY[0x1F40CC9B8](*(void *)&task, *(void *)&name);
}

kern_return_t mach_port_get_attributes(ipc_space_read_t task, mach_port_name_t name, mach_port_flavor_t flavor, mach_port_info_t port_info_out, mach_msg_type_number_t *port_info_outCnt)
{
  return MEMORY[0x1F40CC9E0](*(void *)&task, *(void *)&name, *(void *)&flavor, port_info_out, port_info_outCnt);
}

kern_return_t mach_port_insert_right(ipc_space_t task, mach_port_name_t name, mach_port_t poly, mach_msg_type_name_t polyPoly)
{
  return MEMORY[0x1F40CCA08](*(void *)&task, *(void *)&name, *(void *)&poly, *(void *)&polyPoly);
}

kern_return_t mach_port_mod_refs(ipc_space_t task, mach_port_name_t name, mach_port_right_t right, mach_port_delta_t delta)
{
  return MEMORY[0x1F40CCA10](*(void *)&task, *(void *)&name, *(void *)&right, *(void *)&delta);
}

kern_return_t mach_port_request_notification(ipc_space_t task, mach_port_name_t name, mach_msg_id_t msgid, mach_port_mscount_t sync, mach_port_t notify, mach_msg_type_name_t notifyPoly, mach_port_t *previous)
{
  return MEMORY[0x1F40CCA28](*(void *)&task, *(void *)&name, *(void *)&msgid, *(void *)&sync, *(void *)&notify, *(void *)&notifyPoly, previous);
}

kern_return_t mach_port_set_attributes(ipc_space_t task, mach_port_name_t name, mach_port_flavor_t flavor, mach_port_info_t port_info, mach_msg_type_number_t port_infoCnt)
{
  return MEMORY[0x1F40CCA30](*(void *)&task, *(void *)&name, *(void *)&flavor, port_info, *(void *)&port_infoCnt);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1F40CCB98](size, type_id);
}

void *__cdecl malloc_type_realloc(void *ptr, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1F40CCBA8](ptr, size, type_id);
}

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return (void *)MEMORY[0x1F40CCD20](__b, *(void *)&__c, __len);
}

uint64_t mig_dealloc_special_reply_port()
{
  return MEMORY[0x1F40CCD60]();
}

uint64_t mig_get_special_reply_port()
{
  return MEMORY[0x1F40CCD78]();
}

uint32_t notify_cancel(int token)
{
  return MEMORY[0x1F40CD028](*(void *)&token);
}

uint32_t notify_post(const char *name)
{
  return MEMORY[0x1F40CD050](name);
}

uint32_t notify_register_mach_port(const char *name, mach_port_t *notify_port, int flags, int *out_token)
{
  return MEMORY[0x1F40CD070](name, notify_port, *(void *)&flags, out_token);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1F4181638](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1F4181648]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x1F4181660](a1);
}

{
  MEMORY[0x1F4181668](context);
}

{
  return (void *)MEMORY[0x1F4181670]();
}

void objc_enumerationMutation(id obj)
{
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x1F4181728](name);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x1F41817A8](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x1F41817B0]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x1F41817B8]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x1F41817C0]();
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1F40CD3B8](oslog, type);
}

uint64_t os_transaction_create()
{
  return MEMORY[0x1F40CD5A0]();
}

uint64_t os_unfair_recursive_lock_lock_with_options()
{
  return MEMORY[0x1F40CD610]();
}

uint64_t os_unfair_recursive_lock_unlock()
{
  return MEMORY[0x1F40CD628]();
}

int printf(const char *a1, ...)
{
  return MEMORY[0x1F40CD838](a1);
}

int pthread_mutex_lock(pthread_mutex_t *a1)
{
  return MEMORY[0x1F40CDA88](a1);
}

int pthread_mutex_unlock(pthread_mutex_t *a1)
{
  return MEMORY[0x1F40CDA98](a1);
}

int pthread_once(pthread_once_t *a1, void (*a2)(void))
{
  return MEMORY[0x1F40CDAC8](a1, a2);
}

char *__cdecl strcasestr(const char *__big, const char *__little)
{
  return (char *)MEMORY[0x1F40CE140](__big, __little);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x1F40CE1C8](__s);
}

int strncmp(const char *__s1, const char *__s2, size_t __n)
{
  return MEMORY[0x1F40CE1F0](__s1, __s2, __n);
}

int sysctlbyname(const char *a1, void *a2, size_t *a3, void *a4, size_t a5)
{
  return MEMORY[0x1F40CE3D0](a1, a2, a3, a4, a5);
}

kern_return_t vm_deallocate(vm_map_t target_task, vm_address_t address, vm_size_t size)
{
  return MEMORY[0x1F40CE6C0](*(void *)&target_task, address, size);
}

kern_return_t vm_read(vm_map_read_t target_task, vm_address_t address, vm_size_t size, vm_offset_t *data, mach_msg_type_number_t *dataCnt)
{
  return MEMORY[0x1F40CE6E8](*(void *)&target_task, address, size, data, dataCnt);
}

BOOLean_t voucher_mach_msg_set(mach_msg_header_t *msg)
{
  return MEMORY[0x1F40CE758](msg);
}