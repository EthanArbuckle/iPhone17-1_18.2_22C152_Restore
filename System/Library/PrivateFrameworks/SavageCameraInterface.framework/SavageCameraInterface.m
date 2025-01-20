uint64_t connect(uint64_t a1, const char *a2)
{
  mach_port_t v4;
  CFDictionaryRef v5;
  uint64_t MatchingServices;
  io_iterator_t v7;
  uint64_t v8;
  int v9;
  char **v10;
  CFDictionaryRef v11;
  uint64_t v12;
  CFDictionaryRef v13;
  io_service_t MatchingService;
  io_object_t v15;
  CFNumberRef v16;
  CFNumberRef v17;
  const char *v18;
  const char *v19;
  NSObject *v20;
  xpc_connection_t mach_service;
  NSObject *v22;
  const char *v23;
  io_iterator_t existing;
  char valuePtr;
  uint8_t buf[4];
  const char *v28;
  uint64_t v29;

  v29 = *MEMORY[0x263EF8340];
  valuePtr = 0;
  existing = 0;
  if (!a1) {
    return 3758096385;
  }
  v4 = *MEMORY[0x263F0EC88];
  v5 = IOServiceMatching("AppleH13CamIn");
  MatchingServices = IOServiceGetMatchingServices(v4, v5, &existing);
  v7 = existing;
  if (existing)
  {
    v8 = MatchingServices;
    v9 = 0;
    v10 = off_2654A0280;
  }
  else
  {
    v11 = IOServiceMatching("AppleH16CamIn");
    v12 = IOServiceGetMatchingServices(v4, v11, &existing);
    if (!existing) {
      return 3758097086;
    }
    v8 = v12;
    v10 = &off_2654A0288;
    v9 = 1;
  }
  v13 = IOServiceNameMatching(*v10);
  MatchingService = IOServiceGetMatchingService(v4, v13);
  v15 = MatchingService;
  if (MatchingService)
  {
    v16 = (const __CFNumber *)IORegistryEntrySearchCFProperty(MatchingService, "IOService", @"RestoreMode", (CFAllocatorRef)*MEMORY[0x263EFFB08], 3u);
    v17 = v16;
    if (v16) {
      CFNumberGetValue(v16, kCFNumberSInt32Type, &valuePtr);
    }
  }
  else
  {
    v17 = 0;
  }
  *(_DWORD *)(a1 + 16) = v9;
  if (v7)
  {
    v18 = "com.apple.dietappleh13camerad";
    if (valuePtr != 1 && !os_variant_is_recovery()) {
      v18 = "com.apple.appleh13camerad";
    }
    *(void *)(a1 + 24) = "H13ISPServicesRemoteTypeKey";
    *(void *)(a1 + 32) = "H13ISPServicesRemoteDataKey";
    *(void *)(a1 + 40) = v18;
    *(void *)(a1 + 48) = "H13ISPServicesRemoteFusingDataKey";
    *(void *)(a1 + 56) = "H13ISPServicesRemoteFusingLengthKey";
  }
  else
  {
    v19 = "com.apple.dietappleh16camerad";
    if (valuePtr != 1 && !os_variant_is_recovery()) {
      v19 = "com.apple.appleh16camerad";
    }
    *(void *)(a1 + 24) = "H16ISPServicesRemoteTypeKey";
    *(void *)(a1 + 32) = "H16ISPServicesRemoteDataKey";
    *(void *)(a1 + 40) = v19;
    *(void *)(a1 + 48) = "H16ISPServicesRemoteFusingDataKey";
    *(void *)(a1 + 56) = "H16ISPServicesRemoteFusingLengthKey";
    *(void *)(a1 + 64) = "H16ISPServicesRemoteIORegPropertyNameKey";
    *(void *)(a1 + 72) = "H16ISPServicesRemoteIORegPropertyDataKey";
  }
  v20 = dispatch_queue_create(a2, 0);
  *(void *)(a1 + 8) = v20;
  if (v20)
  {
    mach_service = xpc_connection_create_mach_service(*(const char **)(a1 + 40), v20, 0);
    *(void *)a1 = mach_service;
    if (mach_service) {
      goto LABEL_27;
    }
    v8 = 3758097086;
    if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_27;
    }
    *(_DWORD *)buf = 136315138;
    v28 = "connect";
    v22 = &_os_log_internal;
    v23 = "%s: Could not establish a connection\n";
    goto LABEL_26;
  }
  v8 = 3758097086;
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v28 = "connect";
    v22 = &_os_log_internal;
    v23 = "%s: Could not create a serial dispatch queue, exiting\n";
LABEL_26:
    _os_log_impl(&dword_25BA30000, v22, OS_LOG_TYPE_DEFAULT, v23, buf, 0xCu);
  }
LABEL_27:
  if (existing)
  {
    IOObjectRelease(existing);
    existing = 0;
  }
  if (v15) {
    IOObjectRelease(v15);
  }
  if (v17) {
    CFRelease(v17);
  }
  return v8;
}

void disconnect(xpc_connection_t *a1)
{
  v2 = *a1;
  if (v2)
  {
    xpc_connection_set_event_handler(v2, &__block_literal_global);
    xpc_connection_cancel(*a1);
    xpc_release(*a1);
    *a1 = 0;
  }
}

xpc_object_t sendSynchronousXpcMsgWithReply()
{
  v0 = (xpc_connection_t *)MEMORY[0x270FA5388]();
  *(void *)&v23[3293] = *MEMORY[0x263EF8340];
  if (*v0)
  {
    uint64_t v4 = v3;
    int v5 = v2;
    int v6 = v1;
    v7 = v0;
    xpc_object_t v8 = xpc_dictionary_create(0, 0, 0);
    if (v8)
    {
      v9 = v8;
      if (v5 == 1)
      {
        bzero(&bytes, 0x3378uLL);
        int bytes = v6;
        switch(v6)
        {
          case 204:
          case 207:
          case 212:
            if (v4)
            {
              uint64_t v14 = *(void *)(v4 + 16);
              v13 = (size_t *)(v4 + 16);
              *(void *)&v23[1] = *(v13 - 1);
              *(void *)&v23[3] = v14;
              xpc_dictionary_set_uint64(v9, (const char *)v7[3], 1uLL);
              xpc_dictionary_set_data(v9, (const char *)v7[4], &bytes, 0x3378uLL);
              xpc_dictionary_set_data(v9, (const char *)v7[6], *(const void **)&v23[1], *v13);
              xpc_dictionary_set_uint64(v9, (const char *)v7[7], *(uint64_t *)&v23[3]);
            }
            else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
            {
              int v20 = 136315138;
              v21 = "sendSynchronousXpcMsgWithReply";
              v15 = &_os_log_internal;
              v16 = "%s: Missing property information to set, returning\n";
              goto LABEL_27;
            }
            break;
          case 208:
            xpc_dictionary_set_uint64(v9, (const char *)v7[3], 1uLL);
            xpc_dictionary_set_data(v9, (const char *)v7[4], &bytes, 0x3378uLL);
            break;
          case 211:
            if (v4)
            {
              uint64_t v18 = *(void *)(v4 + 24);
              v17 = (size_t *)(v4 + 24);
              *(_OWORD *)&v23[1] = *((_OWORD *)v17 - 1);
              *(void *)&v23[5] = v18;
              xpc_dictionary_set_uint64(v9, (const char *)v7[3], 1uLL);
              xpc_dictionary_set_data(v9, (const char *)v7[4], &bytes, 0x3378uLL);
              xpc_dictionary_set_string(v9, (const char *)v7[8], *(const char **)&v23[1]);
              xpc_dictionary_set_data(v9, (const char *)v7[9], *(const void **)&v23[3], *v17);
            }
            else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
            {
              int v20 = 136315138;
              v21 = "sendSynchronousXpcMsgWithReply";
              v15 = &_os_log_internal;
              v16 = "%s: Missing property information to set, returning\n";
              goto LABEL_27;
            }
            break;
          default:
            if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
            {
              int v20 = 136315138;
              v21 = "sendSynchronousXpcMsgWithReply";
              v15 = &_os_log_internal;
              v16 = "%s: Unhandled property\n";
LABEL_27:
              _os_log_impl(&dword_25BA30000, v15, OS_LOG_TYPE_DEFAULT, v16, (uint8_t *)&v20, 0xCu);
            }
            break;
        }
      }
      else
      {
        if (v5 != 2)
        {
          if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
          {
            int bytes = 136315138;
            *(void *)v23 = "sendSynchronousXpcMsgWithReply";
            _os_log_impl(&dword_25BA30000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "%s: Unexpected property type, returning\n", (uint8_t *)&bytes, 0xCu);
          }
          xpc_object_t v12 = 0;
          goto LABEL_29;
        }
        bzero(&bytes, 0xE60uLL);
        int bytes = v6;
        xpc_dictionary_set_uint64(v9, (const char *)v7[3], 2uLL);
        xpc_dictionary_set_data(v9, (const char *)v7[4], &bytes, 0xE60uLL);
      }
      xpc_object_t v12 = xpc_connection_send_message_with_reply_sync(*v7, v9);
LABEL_29:
      xpc_release(v9);
      return v12;
    }
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      int bytes = 136315138;
      *(void *)v23 = "sendSynchronousXpcMsgWithReply";
      v10 = &_os_log_internal;
      v11 = "%s: Could not create dictionary, exiting\n";
      goto LABEL_10;
    }
  }
  else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    int bytes = 136315138;
    *(void *)v23 = "sendSynchronousXpcMsgWithReply";
    v10 = &_os_log_internal;
    v11 = "%s: Connection is invalid, exiting \n";
LABEL_10:
    _os_log_impl(&dword_25BA30000, v10, OS_LOG_TYPE_DEFAULT, v11, (uint8_t *)&bytes, 0xCu);
  }
  return 0;
}

uint64_t SavageCamInterfaceOpen(uint64_t a1)
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  if (a1) {
    operator new();
  }
  return 3758097090;
}

void __SavageCamInterfaceOpen_block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  if (MEMORY[0x26116E110](a2) == MEMORY[0x263EF8720])
  {
    if (a2 == MEMORY[0x263EF86A8])
    {
      if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_2;
      }
      int v6 = 136315138;
      v7 = "SavageCamInterfaceOpen_block_invoke";
      uint64_t v4 = &_os_log_internal;
      int v5 = "%s: Received error XPC_ERROR_CONNECTION_INVALID\n";
    }
    else if (a2 == MEMORY[0x263EF86A0])
    {
      if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_2;
      }
      int v6 = 136315138;
      v7 = "SavageCamInterfaceOpen_block_invoke";
      uint64_t v4 = &_os_log_internal;
      int v5 = "%s: Received error XPC_ERROR_CONNECTION_INTERRUPTED\n";
    }
    else
    {
      if (a2 != MEMORY[0x263EF86C0] || !os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_2;
      }
      int v6 = 136315138;
      v7 = "SavageCamInterfaceOpen_block_invoke";
      uint64_t v4 = &_os_log_internal;
      int v5 = "%s: Received error XPC_ERROR_TERMINATION_IMMINENT\n";
    }
    _os_log_impl(&dword_25BA30000, v4, OS_LOG_TYPE_DEFAULT, v5, (uint8_t *)&v6, 0xCu);
  }
LABEL_2:
  disconnect(*(xpc_connection_t **)(a1 + 32));
}

uint64_t SavageCamInterfaceClose(const void *a1)
{
  if (!a1) {
    return 3758097090;
  }
  uint64_t result = getPtrForRef(a1);
  if (result)
  {
    uint64_t v2 = result;
    xpc_object_t v3 = sendSynchronousXpcMsgWithReply();
    uint64_t v4 = *(NSObject **)(v2 + 8);
    if (v4)
    {
      block[0] = MEMORY[0x263EF8330];
      block[1] = 0x40000000;
      block[2] = __SavageCamInterfaceClose_block_invoke;
      block[3] = &__block_descriptor_tmp_3;
      block[4] = v2;
      dispatch_sync(v4, block);
      dispatch_release(*(dispatch_object_t *)(v2 + 8));
      *(void *)(v2 + 8) = 0;
    }
    MEMORY[0x26116DFD0](v2, 0x1070C40BC5C29B4);
    if (v3) {
      xpc_release(v3);
    }
    return 0;
  }
  return result;
}

uint64_t SavageCamInterfaceGetSensorInfo(const void *a1, int a2, uint64_t a3)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  unsigned int v4 = -536870206;
  if (!a1 || (unsigned int v5 = a2, a2 > 2) || !a3)
  {
LABEL_11:
    if (*(_DWORD *)a3 == -1) {
      return 3758097086;
    }
    else {
      return v4;
    }
  }
  uint64_t PtrForRef = getPtrForRef(a1);
  xpc_object_t v7 = sendSynchronousXpcMsgWithReply();
  if (!v7)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      uint64_t v18 = "SavageCamInterfaceGetSensorInfo";
      _os_log_impl(&dword_25BA30000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "%s: Did not receive a reply from the daemon\n", buf, 0xCu);
    }
    unsigned int v4 = -536870209;
    goto LABEL_11;
  }
  uint64_t v8 = v7;
  if (MEMORY[0x26116E110]() == MEMORY[0x263EF8708])
  {
    size_t length = 0;
    data = xpc_dictionary_get_data(v8, *(const char **)(PtrForRef + 32), &length);
    size_t v11 = length;
    if (length == 3680)
    {
      char v12 = data[9];
      char v13 = data[10];
      char v14 = data[11];
      *(unsigned char *)(a3 + 4) = data[8];
      if (v5 == 2)
      {
        unsigned int v5 = 0;
        *(_DWORD *)a3 = *(_DWORD *)(PtrForRef + 80);
        *(unsigned char *)(a3 + 5) = v14;
      }
      else if (v5 == 1)
      {
        unsigned int v5 = 0;
        *(_DWORD *)a3 = *(_DWORD *)(PtrForRef + 84);
        *(unsigned char *)(a3 + 5) = v13;
      }
      else if (v5)
      {
        unsigned int v5 = -536870212;
      }
      else
      {
        *(_DWORD *)a3 = *(_DWORD *)(PtrForRef + 80);
        *(unsigned char *)(a3 + 5) = v12;
      }
    }
    else
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        uint64_t v18 = "SavageCamInterfaceGetSensorInfo";
        __int16 v19 = 2048;
        size_t v20 = v11;
        __int16 v21 = 2048;
        uint64_t v22 = 3680;
        _os_log_impl(&dword_25BA30000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "%s: Received reply with unexpected length %lu. Expected %lu\n", buf, 0x20u);
      }
      unsigned int v5 = -536870209;
    }
  }
  else
  {
    unsigned int v5 = -536870199;
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      uint64_t v18 = "SavageCamInterfaceGetSensorInfo";
      _os_log_impl(&dword_25BA30000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "%s: Received an unexpected event\n", buf, 0xCu);
    }
  }
  if (*(_DWORD *)a3 == -1) {
    uint64_t v9 = 3758097086;
  }
  else {
    uint64_t v9 = v5;
  }
  xpc_release(v8);
  return v9;
}

uint64_t getPtrForRef(const void *a1)
{
  uint64_t valuePtr = 0;
  CFTypeID v2 = CFGetTypeID(a1);
  if (v2 == CFNumberGetTypeID()
    && !CFNumberGetValue((CFNumberRef)a1, kCFNumberLongLongType, &valuePtr)
    && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)unsigned int v4 = 0;
    _os_log_impl(&dword_25BA30000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "error: getPtrForRef CFNumberGetValue returned false\n", v4, 2u);
  }
  return valuePtr;
}

uint64_t SavageCamInterfaceSensorPrePersonalize(const void *a1, int a2)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  uint64_t v2 = 3758097087;
  uint64_t v3 = 3758097090;
  if (a1 && a2 <= 2)
  {
    uint64_t PtrForRef = getPtrForRef(a1);
    if (a2 >= 3)
    {
      uint64_t v3 = 3758097090;
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        char v14 = "SavageCamInterfaceSensorPrePersonalize";
        _os_log_impl(&dword_25BA30000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "%s: Did we miss a sensor in the switch..case ??\n", buf, 0xCu);
      }
    }
    else
    {
      uint64_t v6 = PtrForRef;
      xpc_object_t v7 = sendSynchronousXpcMsgWithReply();
      if (v7)
      {
        uint64_t v8 = v7;
        if (MEMORY[0x26116E110]() == MEMORY[0x263EF8708])
        {
          size_t length = 0;
          data = (unsigned int *)xpc_dictionary_get_data(v8, *(const char **)(v6 + 32), &length);
          size_t v10 = length;
          if (length == 3680)
          {
            uint64_t v2 = data[2];
          }
          else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136315650;
            char v14 = "SavageCamInterfaceSensorPrePersonalize";
            __int16 v15 = 2048;
            size_t v16 = v10;
            __int16 v17 = 2048;
            uint64_t v18 = 3680;
            _os_log_impl(&dword_25BA30000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "%s: Received reply with unexpected length %lu. Expected %lu\n", buf, 0x20u);
          }
          uint64_t v3 = v2;
        }
        else
        {
          uint64_t v3 = 3758097097;
          if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136315138;
            char v14 = "SavageCamInterfaceSensorPrePersonalize";
            _os_log_impl(&dword_25BA30000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "%s: Received an unexpected event\n", buf, 0xCu);
          }
        }
        xpc_release(v8);
      }
      else
      {
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315138;
          char v14 = "SavageCamInterfaceSensorPrePersonalize";
          _os_log_impl(&dword_25BA30000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "%s: Did not receive a reply from the daemon\n", buf, 0xCu);
        }
        return 3758097087;
      }
    }
  }
  return v3;
}

uint64_t SavageCamInterfaceSensorPreFusing(const void *a1, int a2)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  uint64_t v2 = 3758097087;
  uint64_t v3 = 3758097090;
  if (a1 && a2 <= 2)
  {
    uint64_t PtrForRef = getPtrForRef(a1);
    if (a2 >= 3)
    {
      uint64_t v3 = 3758097090;
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        char v14 = "SavageCamInterfaceSensorPreFusing";
        _os_log_impl(&dword_25BA30000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "%s: Did we miss a sensor in the switch..case ??\n", buf, 0xCu);
      }
    }
    else
    {
      uint64_t v6 = PtrForRef;
      xpc_object_t v7 = sendSynchronousXpcMsgWithReply();
      if (v7)
      {
        uint64_t v8 = v7;
        if (MEMORY[0x26116E110]() == MEMORY[0x263EF8708])
        {
          size_t length = 0;
          data = (unsigned int *)xpc_dictionary_get_data(v8, *(const char **)(v6 + 32), &length);
          size_t v10 = length;
          if (length == 3680)
          {
            uint64_t v2 = data[2];
          }
          else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136315650;
            char v14 = "SavageCamInterfaceSensorPreFusing";
            __int16 v15 = 2048;
            size_t v16 = v10;
            __int16 v17 = 2048;
            uint64_t v18 = 3680;
            _os_log_impl(&dword_25BA30000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "%s: Received reply with unexpected length %lu. Expected %lu\n", buf, 0x20u);
          }
          uint64_t v3 = v2;
        }
        else
        {
          uint64_t v3 = 3758097097;
          if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136315138;
            char v14 = "SavageCamInterfaceSensorPreFusing";
            _os_log_impl(&dword_25BA30000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "%s: Received an unexpected event\n", buf, 0xCu);
          }
        }
        xpc_release(v8);
      }
      else
      {
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315138;
          char v14 = "SavageCamInterfaceSensorPreFusing";
          _os_log_impl(&dword_25BA30000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "%s: Did not receive a reply from the daemon\n", buf, 0xCu);
        }
        return 3758097087;
      }
    }
  }
  return v3;
}

uint64_t SavageCamInterfaceSensorFusing()
{
  uint64_t v0 = MEMORY[0x270FA5388]();
  unsigned int v2 = v1;
  uint64_t v4 = v3;
  int v6 = v5;
  xpc_object_t v7 = (const void *)v0;
  uint64_t v16 = *MEMORY[0x263EF8340];
  uint64_t v8 = 3758097090;
  bzero(v13, 0x3378uLL);
  if (v7 && v6 < 3)
  {
    getPtrForRef(v7);
    if (v6 <= 2) {
      uint64_t v8 = 0;
    }
    uint64_t v14 = v4;
    uint64_t v15 = v2;
    xpc_object_t v9 = sendSynchronousXpcMsgWithReply();
    if (v9) {
      xpc_release(v9);
    }
  }
  else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 136315138;
    char v12 = "SavageCamInterfaceSensorFusing";
    _os_log_impl(&dword_25BA30000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "%s: Bad argument, returning\n", (uint8_t *)&v11, 0xCu);
  }
  return v8;
}

uint64_t SavageCamInterfaceSensorAuth()
{
  uint64_t v0 = MEMORY[0x270FA5388]();
  unsigned int v2 = v1;
  uint64_t v4 = v3;
  int v6 = v5;
  xpc_object_t v7 = (const void *)v0;
  uint64_t v16 = *MEMORY[0x263EF8340];
  bzero(v13, 0x3378uLL);
  if (v7 && v6 < 3)
  {
    getPtrForRef(v7);
    if ((v6 & 0xFFFFFFFD) != 0) {
      uint64_t v8 = 3758097090;
    }
    else {
      uint64_t v8 = 0;
    }
    uint64_t v14 = v4;
    uint64_t v15 = v2;
    xpc_object_t v9 = sendSynchronousXpcMsgWithReply();
    if (v9) {
      xpc_release(v9);
    }
  }
  else
  {
    uint64_t v8 = 3758097090;
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 136315138;
      char v12 = "SavageCamInterfaceSensorAuth";
      _os_log_impl(&dword_25BA30000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "%s: Bad argument, returning\n", (uint8_t *)&v11, 0xCu);
    }
  }
  return v8;
}

void __SavageCamInterfaceClose_block_invoke(uint64_t a1)
{
}

uint64_t SavageCamInterfaceForgetISPFirmware(const void *a1)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  uint64_t v1 = 3758097087;
  if (!a1) {
    return 3758097090;
  }
  uint64_t PtrForRef = getPtrForRef(a1);
  xpc_object_t v3 = sendSynchronousXpcMsgWithReply();
  if (v3)
  {
    uint64_t v4 = v3;
    if (MEMORY[0x26116E110]() == MEMORY[0x263EF8708])
    {
      size_t length = 0;
      data = (unsigned int *)xpc_dictionary_get_data(v4, *(const char **)(PtrForRef + 32), &length);
      size_t v9 = length;
      if (length == 3680)
      {
        uint64_t v1 = data[2];
      }
      else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        char v13 = "SavageCamInterfaceForgetISPFirmware";
        __int16 v14 = 2048;
        size_t v15 = v9;
        __int16 v16 = 2048;
        uint64_t v17 = 3680;
        int v5 = &_os_log_internal;
        int v6 = "%s: Received reply with unexpected length %lu. Expected %lu\n";
        uint32_t v7 = 32;
        goto LABEL_13;
      }
    }
    else
    {
      uint64_t v1 = 3758097097;
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        char v13 = "SavageCamInterfaceForgetISPFirmware";
        int v5 = &_os_log_internal;
        int v6 = "%s: Received an unexpected event\n";
        uint32_t v7 = 12;
LABEL_13:
        _os_log_impl(&dword_25BA30000, v5, OS_LOG_TYPE_DEFAULT, v6, buf, v7);
      }
    }
    xpc_release(v4);
    return v1;
  }
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    char v13 = "SavageCamInterfaceForgetISPFirmware";
    _os_log_impl(&dword_25BA30000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "%s: Did not receive a reply from the daemon\n", buf, 0xCu);
  }
  return v1;
}

uint64_t SavageCamInterfaceColdBootPowerCycle(const void *a1)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  uint64_t v1 = 3758097087;
  if (!a1) {
    return 3758097090;
  }
  uint64_t PtrForRef = getPtrForRef(a1);
  xpc_object_t v3 = sendSynchronousXpcMsgWithReply();
  if (v3)
  {
    uint64_t v4 = v3;
    if (MEMORY[0x26116E110]() == MEMORY[0x263EF8708])
    {
      size_t length = 0;
      data = (unsigned int *)xpc_dictionary_get_data(v4, *(const char **)(PtrForRef + 32), &length);
      size_t v9 = length;
      if (length == 3680)
      {
        uint64_t v1 = data[2];
      }
      else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        char v13 = "SavageCamInterfaceColdBootPowerCycle";
        __int16 v14 = 2048;
        size_t v15 = v9;
        __int16 v16 = 2048;
        uint64_t v17 = 3680;
        int v5 = &_os_log_internal;
        int v6 = "%s: Received reply with unexpected length %lu. Expected %lu\n";
        uint32_t v7 = 32;
        goto LABEL_13;
      }
    }
    else
    {
      uint64_t v1 = 3758097097;
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        char v13 = "SavageCamInterfaceColdBootPowerCycle";
        int v5 = &_os_log_internal;
        int v6 = "%s: Received an unexpected event\n";
        uint32_t v7 = 12;
LABEL_13:
        _os_log_impl(&dword_25BA30000, v5, OS_LOG_TYPE_DEFAULT, v6, buf, v7);
      }
    }
    xpc_release(v4);
    return v1;
  }
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    char v13 = "SavageCamInterfaceColdBootPowerCycle";
    _os_log_impl(&dword_25BA30000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "%s: Did not receive a reply from the daemon\n", buf, 0xCu);
  }
  return v1;
}

uint64_t SavageCamInterfacePublishToRegistry()
{
  uint64_t v0 = MEMORY[0x270FA5388]();
  CFDataRef v2 = v1;
  CFStringRef v4 = v3;
  int v5 = (const void *)v0;
  uint64_t v17 = *MEMORY[0x263EF8340];
  bzero(v13, 0x3378uLL);
  if (!v5 || !v4)
  {
    uint64_t v7 = 3758097090;
    if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
      return v7;
    }
    int v11 = 136315138;
    char v12 = "SavageCamInterfacePublishToRegistry";
    uint64_t v8 = &_os_log_internal;
    size_t v9 = "%s: Bad argument, returning\n";
LABEL_11:
    _os_log_impl(&dword_25BA30000, v8, OS_LOG_TYPE_DEFAULT, v9, (uint8_t *)&v11, 0xCu);
    return v7;
  }
  if (!getPtrForRef(v5))
  {
    uint64_t v7 = 3758097101;
    if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
      return v7;
    }
    int v11 = 136315138;
    char v12 = "SavageCamInterfacePublishToRegistry";
    uint64_t v8 = &_os_log_internal;
    size_t v9 = "%s: Interface to SavageCam not open, returning\n";
    goto LABEL_11;
  }
  CStringPtr = CFStringGetCStringPtr(v4, 0x8000100u);
  BytePtr = CFDataGetBytePtr(v2);
  CFIndex Length = CFDataGetLength(v2);
  xpc_object_t v6 = sendSynchronousXpcMsgWithReply();
  if (v6) {
    xpc_release(v6);
  }
  return 0;
}

const UInt8 *__cdecl CFDataGetBytePtr(CFDataRef theData)
{
  return (const UInt8 *)MEMORY[0x270EE4808](theData);
}

CFIndex CFDataGetLength(CFDataRef theData)
{
  return MEMORY[0x270EE4820](theData);
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

const char *__cdecl CFStringGetCStringPtr(CFStringRef theString, CFStringEncoding encoding)
{
  return (const char *)MEMORY[0x270EE5180](theString, *(void *)&encoding);
}

kern_return_t IOObjectRelease(io_object_t object)
{
  return MEMORY[0x270EF4820](*(void *)&object);
}

CFTypeRef IORegistryEntrySearchCFProperty(io_registry_entry_t entry, const io_name_t plane, CFStringRef key, CFAllocatorRef allocator, IOOptionBits options)
{
  return (CFTypeRef)MEMORY[0x270EF4A50](*(void *)&entry, plane, key, allocator, *(void *)&options);
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

CFMutableDictionaryRef IOServiceNameMatching(const char *name)
{
  return (CFMutableDictionaryRef)MEMORY[0x270EF4AD8](name);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
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

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void bzero(void *a1, size_t a2)
{
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x270ED9460](label, attr);
}

void dispatch_release(dispatch_object_t object)
{
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

uint64_t os_variant_is_recovery()
{
  return MEMORY[0x270EDAB58]();
}

void xpc_connection_activate(xpc_connection_t connection)
{
}

void xpc_connection_cancel(xpc_connection_t connection)
{
}

xpc_connection_t xpc_connection_create_mach_service(const char *name, dispatch_queue_t targetq, uint64_t flags)
{
  return (xpc_connection_t)MEMORY[0x270EDBE58](name, targetq, flags);
}

xpc_object_t xpc_connection_send_message_with_reply_sync(xpc_connection_t connection, xpc_object_t message)
{
  return (xpc_object_t)MEMORY[0x270EDBED0](connection, message);
}

void xpc_connection_set_event_handler(xpc_connection_t connection, xpc_handler_t handler)
{
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return (xpc_object_t)MEMORY[0x270EDC008](keys, values, count);
}

const void *__cdecl xpc_dictionary_get_data(xpc_object_t xdict, const char *key, size_t *length)
{
  return (const void *)MEMORY[0x270EDC060](xdict, key, length);
}

void xpc_dictionary_set_data(xpc_object_t xdict, const char *key, const void *bytes, size_t length)
{
}

void xpc_dictionary_set_string(xpc_object_t xdict, const char *key, const char *string)
{
}

void xpc_dictionary_set_uint64(xpc_object_t xdict, const char *key, uint64_t value)
{
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return (xpc_type_t)MEMORY[0x270EDC200](object);
}